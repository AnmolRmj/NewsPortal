<?php
include "header.php";

if ($_SESSION["user_role"] == '0' || $_SESSION["user_role"] == '2') {
    header("Location: {$hostname}/admin/post.php");
    exit(); // Make sure to exit after a header redirect
}

?>

<div id="admin-content">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="admin-heading">Update Advertisement</h1>
            </div>
            <div class="col-md-offset-3 col-md-6">
                <?php
                include 'config.php';

                if (isset($_GET['id'])) {
                    $advertismentId = mysqli_real_escape_string($conn, $_GET['id']);

                    // Query record for modification
                    $sql = "SELECT * FROM advertisments WHERE ads_id = '{$advertismentId}'";
                    $result = mysqli_query($conn, $sql);

                    if (mysqli_num_rows($result) > 0) {
                        while ($row = mysqli_fetch_assoc($result)) {
                ?>
                            <!-- Form Start -->
                            <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="hidden" name="ads_id" class="form-control" value="<?php echo $row['ads_id']; ?>">
                                </div>
                                <div class="form-group">
                                    <label>Advertisement Name</label>
                                    <input type="text" name="ads_name" class="form-control" value="<?php echo $row['ads_name']; ?>" placeholder="" required>
                                </div>
                                <div class="form-group">
                                    <label>Advertisement Link</label>
                                    <input type="text" name="ads_link" class="form-control" value="<?php echo $row['Link']; ?>" placeholder="" required>
                                </div>
                                <div class="form-group">
                                    <label for="">Image</label>
                                    <input type="file" name="new-image">
                                    <img src="upload/<?php echo $row['image']; ?>" height="150px">
                                    <input type="hidden" name="old_image" value="<?php echo $row['image']; ?>">
                                </div>
                                <input type="submit" name="submit" class="btn btn-primary" value="Update" />
                            </form>
                            <!-- Form End -->
                <?php
                        }
                    } else {
                        echo "<p>No advertisement found.</p>";
                    }
                } else {
                    echo "<p>Advertisement ID not provided.</p>";
                }
                ?>
            </div>
        </div>
    </div>
</div>

<script>
    document.querySelector("form").addEventListener("submit", function(event) {
        const adsLinkInput = document.querySelector("input[name='ads_link']");
        const adsLinkValue = adsLinkInput.value;

        if (!isValidURL(adsLinkValue)) {
            event.preventDefault();
            alert("Invalid Advertisement Link URL.");
        }
    });

    function isValidURL(url) {
        const pattern = /^(ftp|http|https):\/\/[^ "]+$/;
        return pattern.test(url);
    }
</script>

<?php
if (isset($_POST['submit'])) {
    include 'config.php';

    $isNewImage = false;
    $image_name = $_POST['old_image'];

    if (!empty($_FILES['new-image']['name'])) {
        $file_name = $_FILES['new-image']['name'];
        $file_size = $_FILES['new-image']['size'];
        $file_tmp = $_FILES['new-image']['tmp_name'];
        $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));

        $extensions = array("jpeg", "jpg", "png");
        if (in_array($file_ext, $extensions) === false) {
            echo "<p style='color:red;text-align:center;margin: 10px 0;'>This extension file is not allowed. Please choose a JPG or PNG file.</p>";
            exit();
        }

        if ($file_size > 2097152) {
            echo "<p style='color:red;text-align:center;margin: 10px 0;'>File size must be 2MB or lower.</p>";
            exit();
        }

        $image_name = time() . "-" . $file_name;
        $target = "upload/" . $image_name;

        if (move_uploaded_file($file_tmp, $target)) {
            $isNewImage = true;
        } else {
            echo "<p style='color:red;text-align:center;margin: 10px 0;'>Error uploading the image.</p>";
            exit();
        }
    }

    $ads_id = mysqli_real_escape_string($conn, $_POST['ads_id']);
    $ads_name = mysqli_real_escape_string($conn, $_POST['ads_name']);
    $ads_link = mysqli_real_escape_string($conn, $_POST['ads_link']);


    if ($isNewImage) {
        $sql1 = "UPDATE advertisments SET ads_name='{$ads_name}', image='{$image_name}', Link='{$ads_link}' WHERE ads_id={$ads_id}";
    } else {
        $sql1 = "UPDATE advertisments SET ads_name='{$ads_name}', Link='{$ads_link}' WHERE ads_id={$ads_id}";
    }

    if (mysqli_query($conn, $sql1)) {
        // Redirect to all ads page
        header("Location: {$hostname}/admin/ads.php");
        exit();
    } else {
        echo "<p style='color:red;text-align:center;margin: 10px 0;'>Query Failed.</p>";
    }
}

include "footer.php";
?>
