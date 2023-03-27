<?php
    include_once "./adat.php";
    ?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Vinczeffy Gergely</title>
</head>
<body>
    <?php
        $nev = ["Név","Város neve","Busz sorszáma"];
        $nevek = ["Tibor Gáspár","Zatrár Zoltán", "Kapolta Ilona","Tuba Niki"];
        $varos = ["Szeged","Kaposvár","Sümeg","Temesvar"];
    

        echo "<table>
        <tr>";
        for ($i=0; $i < count($nevek); $i++) { 
            if ($i == 0) {
                echo "<th>$nev[0]</th><th>$nev[1]</th><th>$nev[2]</th></tr>";
            }
            else{
                echo "<tr><th>$nevek[$i]</th><th>$varos[$i]</th><th>";
                echo (rand(1,200));
                echo "</th></tr>";
            }
        }
        echo "</tr></table>"
    ?>
</body>
</html>