<?php
$host = 'localhost';
$dbname = 'collection_perso';
$user = 'root';
$password = 'root';

try {
    $pdo = new PDO("mysql:host=$host;port=3306;dbname=$dbname;charset=utf8", $user, $password);
} catch (PDOException $e) {
    echo "Erreur : " . $e->getMessage();
}
?>
