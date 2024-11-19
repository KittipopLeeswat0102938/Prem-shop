<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top-Up & Shop - ปล Simp Girl Shop</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f8ff;
            color: #333;
            text-align: center;
        }
        header {
            background-color: #ffa07a;
            padding: 20px;
        }
        header h1 {
            margin: 0;
            color: white;
        }
        .container {
            margin: 20px auto;
            padding: 20px;
            max-width: 900px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .container h2 {
            margin-bottom: 20px;
            color: #ff6347;
        }
        .money-section, .shop-section {
            margin: 20px 0;
            padding: 20px;
            background: #fefefe;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .money-section input {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 50%;
            margin-right: 10px;
        }
        button {
            background-color: #ffa07a;
            border: none;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #ff6347;
        }
        .shop-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .shop-item {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .shop-item img {
            width: 100%;
            border-radius: 10px;
        }
        .shop-item h3 {
            margin: 10px 0;
        }
        .shop-item p {
            color: #777;
        }
    </style>
</head>
<body>
    <header>
        <h1>ปล Simp Girl Shop</h1>
    </header>
    <div class="container">
        <!-- Top-Up Section -->
        <div class="money-section">
            <h2>Top-Up Money</h2>
            <input type="number" id="topUpAmount" placeholder="Enter amount to top up">
            <button onclick="topUp()">Add Money</button>
            <p id="currentBalance">Current Balance: ฿0</p>
        </div>

        <!-- Shop Section -->
        <div class="shop-section">
            <h2>Shop Items</h2>
            <div class="shop-container">
                <div class="shop-item">
                    <img src="https://via.placeholder.com/200" alt="Prem Sus">
                    <h3>Prem Sus</h3>
                    <p>Price: ฿100</p>
                    <button onclick="buyPremSus()">Buy</button>
                </div>
                <div class="shop-item">
                    <img src="https://via.placeholder.com/200" alt="Item 2">
                    <h3>Item 2</h3>
                    <p>Price: ฿200</p>
                    <button onclick="buyItem(200)">Buy</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        let balance = 0;

        function topUp() {
            const amount = parseInt(document.getElementById('topUpAmount').value);
            if (isNaN(amount) || amount <= 0) {
                alert("Please enter a valid amount!");
                return;
            }
            balance += amount;
            updateBalance();
            alert(`฿${amount} added to your balance.`);
        }

        function buyPremSus() {
            const price = 100;
            if (balance >= price) {
                balance -= price;
                updateBalance();
                alert("Prem Sus purchased successfully!");
                // Redirect directly to the YouTube Shorts link
                window.location.href = "https://www.youtube.com/shorts/6W7u2cBp0kI";
            } else {
                alert("Insufficient balance. Please top up.");
            }
        }

        function buyItem(price) {
            if (balance >= price) {
                balance -= price;
                updateBalance();
                alert("Item purchased successfully!");
            } else {
                alert("Insufficient balance. Please top up.");
            }
        }

        function updateBalance() {
            document.getElementById('currentBalance').innerText = `Current Balance: ฿${balance}`;
        }
    </script>
</body>
</html>
