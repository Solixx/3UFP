<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="post">
        <textarea name="tx" id="" cols="30" rows="10"></textarea>
        <button>Submit</button>
    </form>

    <?php
        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            $texto = $_POST['tx'];

            $palavras = explode(' ', $texto);

            foreach($palavras as $palavra){
                echo ucfirst($palavra) . ' ';
            }

            foreach($palavras as $palavra){
                echo '<br>' . $palavra . ' ';
            }
        }
    ?>
</body>
</html>