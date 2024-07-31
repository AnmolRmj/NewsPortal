<?php
include 'config.php';
if ($_SESSION["user_role"] == '0') {
    header("Location: {$hostname}/admin/post.php");
    if ($_SESSION["user_role"] == 2) {
        header("Location: {$hostname}/admin/post.php");
    }
}
$cat_id = $_GET["id"];

/*sql to delete a record*/
$sql = "DELETE FROM advertisments WHERE ads_id ='{$cat_id}'";

if (mysqli_query($conn, $sql)) {
    header("location:{$hostname}/admin/ads.php");
}

mysqli_close($conn);

?>