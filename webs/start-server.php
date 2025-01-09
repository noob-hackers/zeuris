<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
session_start(); // Start the session

// Check if the platform is set
if (isset($_POST['platform'])) {
    $platform = $_POST['platform'];

    // Define the folder name relative to the current directory
    $folder = $platform;

    // Debugging output for folder
    echo "Folder: " . $folder . "<br>";

    // Ensure the folder exists
    if (!is_dir($folder)) {
        echo "Error: Folder for platform '$platform' not found.<br>";
        exit();
    }

    // Commands to execute
    // Use relative paths for commands
    $startServerCommand = "php -S 0.0.0.0:8013 -t $folder > /dev/null 2>&1 &";
    $createFileCommand = "bash linkmerger.sh $folder > /dev/null 2>&1 &";

    // Execute commands
    shell_exec($startServerCommand);
    shell_exec($createFileCommand);

    // Debugging output
    echo "Server started for platform: $platform<br>";

    // Dashboard Link
    echo "<script>
            setTimeout(function() {
                window.open('https://fintechwins.blogspot.com/p/draco.html', '_blank');
            }, 10000); // Open in a new tab after 10 seconds
          </script>";
    exit();
} else {
    echo "Error: No platform selected.";
}
?>
