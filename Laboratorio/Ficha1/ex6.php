<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    for($j = 1; $j < 13; $j++){
        for($i = 1; $i < 13; $i++){
            echo "$i * $j = ". $j*$i, "\n";
        }
    }
    ?>
</body>
</html>