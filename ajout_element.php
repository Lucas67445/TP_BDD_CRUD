<?php
require 'connexion.php';

if($_SERVER["REQUEST_METHOD"] === "POST") {

$titre = $_POST['titre'];
$numero = $_POST['numero'];
$collection = $_POST['collection'];

$sql = "INSERT INTO elements_collection (titre_element, numero, id_collection) VALUES (?, ?, ?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([$titre, $numero, $collection]);

echo "Élément ajouté";
}

$collections = $pdo->query("SELECT * FROM collections");
?>

<form method="post">
Nom : <input type="text" name="nom"><br>

   Type :
   <select name="type">
       <?php foreach($types as $t): ?>
           <option value="<?= $t['id_type'] ?>">
               <?= htmlspecialchars($t['nom_type']) ?>
           </option>
       <?php endforeach; ?>
   </select>

   <button type="submit">Ajouter</button>

</form>
