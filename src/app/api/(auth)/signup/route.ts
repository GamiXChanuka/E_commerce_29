import { NextResponse, NextRequest } from 'next/server';
import bcryptjs from 'bcryptjs';
import { createUser } from '@/models/userAction';

export async function POST(request: NextRequest) {
    try {
        const reqBody = await request.json();
        const {
            firstName,
            lastName,
            userName,
            phoneNumber,
            email,
            password,
            confirmPassword,
            addressNumber,
            lane,
            city,
            postalCode,
            district,
        } = reqBody;
        // Check if passwords match
        if (password !== confirmPassword) {
            return NextResponse.json({ message: 'Passwords do not match' }, { status: 400 });
        }

        // Hash the password
        const salt = await bcryptjs.genSalt(10);
        const hashedPassword = await bcryptjs.hash(password, salt);

        // Prepare user data for insertion
        const userData = {
            firstName,
            lastName,
            userName,
            phoneNumber,
            email,
            password: hashedPassword, // Store hashed password
            addressNumber,
            lane,
            city,
            postalCode,
            district,
        };

        // Create a new user with address and registered customer details
        const newUser = await createUser(userData);

        return NextResponse.json({
            message: 'User created successfully',
            userId: newUser.userId,
            addressId: newUser.addressId,
        }, { status: 201 });

    } catch (error: any) {
        if (error.sqlState === '45000') {
            return NextResponse.json({ message: "User Already exists" }, { status: 404 });
        }
        return NextResponse.json({ message: 'Make sure you fill all the feilds' }, { status: 500 });
    }
}