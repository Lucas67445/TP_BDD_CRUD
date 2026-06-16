<?php
require 'connexion.php';

$sql = "SELECT c.nom_elements, t.nom_type
       FROM element c
       JOIN types_elements t ON c.id_type = t.id_type";


$resultat = $pdo->query($sql);
?>

<h1>Éléments</h1>

<table border="1">
<tr>
    <th>Titre</th>
    <th>Numéro</th>
    <th>Collection</th>
    <th>Possédé</th>
</tr>

<?php foreach($resultat as $row): ?>
<tr>
    <td><?= htmlspecialchars($row['titre_element']) ?></td>
    <td><?= $row['numero'] ?></td>
    <td><?= htmlspecialchars($row['nom_collection']) ?></td>
    <td><?= $row['possede'] ? "Oui" : "Non" ?></td>
</tr>
<?php endforeach; ?>

</table>
