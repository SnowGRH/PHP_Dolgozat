<?php
class adat{
    private $host= "localhost";
    private $felhasznaloNev = "root";
    private $jelszo = "";
    private $adatNev = "utazás";
    private $kapcsolat;
 
    public function __construct()
    {
        $this->kapcsolat = new mysqli($this->host, $this->felhasznaloNev,$this->jelszo,$this-> adatNev);
        $this->kapcsolat->query("SET NAMES UTF8");
        if ($this->kapcsolat->connect_error) {
            $szoveg = "Hiba: $this->kapcsolat->connect_error";
        }
        else {
            $szoveg = "Sikeres kapcsolódás";
        }
        echo $szoveg;
    }
    public function kapcsolatBezar(){
        $this->kapcsolat->close();
    }
}
?>