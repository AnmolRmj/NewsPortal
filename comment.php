<?php
    include "config.php";
    if(isset($_POST['submit'])){
        $errors = array();
        $comment = mysqli_real_escape_string($conn, $_POST['comments']);
        $post_id = $_POST['post_id'];
        // $date = date("d M, Y");
        $date1 = new DateTime("now", new DateTimeZone("Asia/Kathmandu"));
        $date = $date1->format("d M, Y H:i");
        // $date = date("d M, Y H:i");
        $sql = "INSERT INTO comments(comments, post_id,comment_date)
            VALUES('{$comment}','{$post_id}','{$date}')";
        echo $sql;
        if (mysqli_query($conn, $sql)) {
            header("location: {$hostname}/single.php?id={$post_id}");
        } else {
            echo "<div class='alert alert-danger'>Query Failed.</div>";
        }
         mysqli_close($conn);
    }
?>