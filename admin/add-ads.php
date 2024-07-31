<?php include "header.php"; ?>
<div id="admin-content">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="admin-heading">Add New Advertisement</h1>
            </div>
            <div class="col-md-offset-3 col-md-6">
                <!-- Form Start -->
                <form id="advertisement-form" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" enctype="multipart/form-data" autocomplete="off">
                    <div class="form-group">
                        <label>Advertisement Name</label>
                        <input type="text" name="ads_name" class="form-control" placeholder="Advertisement Name" required>
                    </div>
                    <div class="form-group">
                        <label>Advertisement Link</label>
                        <input type="text" name="ads_link" class="form-control" placeholder="Advertisement Link" required>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Image</label>
                        <input type="file" name="fileToUpload" required>
                    </div>
                    <input type="submit" name="save" class="btn btn-primary" value="Save" />
                </form>
                <!-- /Form End -->
            </div>
        </div>
    </div>
</div>

<?php
if (isset($_POST['save']) && isset($_FILES['fileToUpload'])) {
    // database configuration
    include 'config.php';
    $errors = array();
    $file_name = $_FILES['fileToUpload']['name'];
    $file_size = $_FILES['fileToUpload']['size'];
    $file_tmp = $_FILES['fileToUpload']['tmp_name'];
    $file_type = $_FILES['fileToUpload']['type'];
    $file_ext_parts = explode('.', $file_name);
    $file_ext = strtolower(end($file_ext_parts));

    $extensions = array("jpeg", "jpg", "png");

    if (in_array($file_ext, $extensions) === false) {
        $errors[] = "This extension file is not allowed. Please choose a JPG or PNG file.";
    }

    if ($file_size > 2097152) {
        $errors[] = "File size must be 2MB or lower.";
    }
    
    $img_name = time() . "-" . basename($file_name);
    $target = "upload/" . $img_name;

    // URL validation function
    function validateURL($url) {
        return filter_var($url, FILTER_VALIDATE_URL);
    }

    $ads_name = mysqli_real_escape_string($conn, $_POST['ads_name']);
    $ads_link = mysqli_real_escape_string($conn, $_POST['ads_link']);

    if (empty($ads_name)) {
        $errors[] = "Advertisement Name is required.";
    }

    if (empty($ads_link)) {
        $errors[] = "Advertisement Link is required.";
    } elseif (!validateURL($ads_link)) {
        $errors[] = "Invalid Advertisement Link URL.";
    }

    if (empty($errors)) {
        move_uploaded_file($file_tmp, $target);

        $sql = "INSERT INTO advertisments (ads_name,  image,Link)
                VALUES ('{$ads_name}', '{$img_name}', '{$ads_link}')";

        if (mysqli_query($conn, $sql)) {
            mysqli_close($conn);  // Close the connection before header
            header("location: {$hostname}/admin/ads.php");
            exit();  // Exit after header
        } else {
            echo "<p style='color:red;text-align:center;margin: 10px 0;'>Query Failed.</p>";
        }
    } else {
        foreach ($errors as $error) {
            echo "<p style='color:red;text-align:center;margin: 10px 0;'>$error</p>";
        }
    }
}
include "footer.php";
?>
