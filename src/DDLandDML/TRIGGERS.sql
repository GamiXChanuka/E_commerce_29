DELIMITER $$
CREATE TRIGGER `before_order_delete` BEFORE DELETE ON `order` FOR EACH ROW BEGIN
    -- Declare necessary variables
    DECLARE var_variant_id INT;
    DECLARE var_quantity INT;
    DECLARE back_quantity INT;
    DECLARE total_return_quantity INT;
    DECLARE done BOOLEAN DEFAULT FALSE;  -- Declare the 'done' variable to track end of cursor

    -- Cursor to loop through each variant in orderitem related to the deleted order
    DECLARE cur_orderitem CURSOR FOR 
        SELECT VariantID, Quantity 
        FROM orderitem 
        WHERE OrderID = OLD.OrderID;

    -- Continue handler for cursor end
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open cursor
    OPEN cur_orderitem;

    -- Loop through cursor result set
    read_loop: LOOP
        -- Fetch each row into declared variables
        FETCH cur_orderitem INTO var_variant_id, var_quantity;
        
        -- Check if cursor has reached the end
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Get the backorder quantity for the specific order and variant
        SELECT COALESCE(SUM(Quantity), 0) 
        INTO back_quantity 
        FROM backorders 
        WHERE OrderID = OLD.OrderID AND VariantID = var_variant_id;

        -- Calculate total quantity to return to stock (ordered - backordered)
        SET total_return_quantity = var_quantity - back_quantity;

        -- Update stock in the variant table
        UPDATE variant
        SET StockCount = StockCount + total_return_quantity
        WHERE VariantID = var_variant_id;

        -- Delete the related backorders
        DELETE FROM backorders 
        WHERE OrderID = OLD.OrderID AND VariantID = var_variant_id;

        -- Delete the related orderitems
        DELETE FROM orderitem 
        WHERE OrderID = OLD.OrderID AND VariantID = var_variant_id;
    END LOOP;

    -- Close cursor
    CLOSE cur_orderitem;
END;
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `check_stock_before_insert_order` BEFORE INSERT ON `orderitem` FOR EACH ROW BEGIN
    DECLARE current_stock INT;

    -- Fetch current stock for the variant
    SELECT StockCount INTO current_stock FROM Variant WHERE VariantID = NEW.VariantID;

    -- Check if the order quantity exceeds available stock
    IF NEW.Quantity > current_stock THEN
        -- Log oversell in Backorders table
        INSERT INTO Backorders (VariantID, Quantity, OrderID)
        VALUES (NEW.VariantID, NEW.Quantity - current_stock, NEW.OrderID);

        -- Update stock to 0 since it's oversold
        UPDATE Variant SET StockCount = 0 WHERE VariantID = NEW.VariantID;
    ELSE
        -- Deduct stock if sufficient
        UPDATE Variant
        SET StockCount = StockCount - NEW.Quantity
        WHERE VariantID = NEW.VariantID;
    END IF;
END;
$$
DELIMITER ;



