<?php
include "config.php";

if(isset($_POST['submit'])){
$name = $_POST['name'];
$email = $_POST['email'];
$comment = $_POST['comment'];
$parent_id = $_POST['parent_id'];
$post_id = $_POST['post_id'];

// Insert reply into the database
$sql = "INSERT INTO commentsmain (name, email, comment, parent_id,post_id) VALUES ('$name', '$email', '$comment', '$parent_id','$post_id')";
echo $sql;
if (mysqli_query($conn, $sql)) {

} else {
    
    echo "<div class='alert alert-danger'>Query Failed.</div>";
   
}
 mysqli_close($conn);
}


?>