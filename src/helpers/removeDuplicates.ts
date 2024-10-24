interface Product {
  ProductID: number;
  Title: string;
  CategoryID: number;
  CategoryName: string;
  image_link: string;
  VariantID: number;
  Price: string;
}

export function removeDuplicateItems(products: Product[]): Product[] {
  const uniqueItems: { [key: string]: Product } = {};

  products.forEach((product) => {
    const key = `${product.ProductID}`;
    if (!uniqueItems[key]) {
      uniqueItems[key] = product;
    }
  });

  return Object.values(uniqueItems);
}