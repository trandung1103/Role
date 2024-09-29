<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link rel="stylesheet" href="css/home.css?v=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        header {
            text-align: center;
            margin: 20px 0;
        }

        main {
            display: flex;
            justify-content: center;
        }

        table {
            width: 50%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50; /* Green */
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9; /* Light gray for alternate rows */
        }

        button {
            background-color: #4CAF50; /* Green */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049; /* Darker green */
        }
    </style>
</head>
<body>
    <header>
        <h1>Add New Product</h1>
    </header>

    <main>
        <form action="Admin_Product" method="post">
            <table>
                <tr>
                    <th colspan="2">Product Information</th>
                </tr>
                <tr>
                    <td><label for="name">Product Name:</label></td>
                    <td><input type="text" name="name" required></td>
                </tr>
                <tr>
                    <td><label for="price">Price:</label></td>
                    <td><input type="number" name="price" step="0.01" required></td>
                </tr>
                <tr>
                    <td><label for="description">Description:</label></td>
                    <td><textarea name="description" required></textarea></td>
                </tr>
                <tr>
                    <td><label for="quantity">Available Stock:</label></td>
                    <td><input type="number" name="quantity" required></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <button type="submit">Add Product</button>
                    </td>
                </tr>
            </table>
        </form>
    </main>

    <footer>
        <p>&copy; 2024 Shop DDT. All rights reserved.</p>
    </footer>
</body>
</html>
