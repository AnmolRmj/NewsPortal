<?php include "header.php"; 
if($_SESSION["user_role"]==2){
    header("Location: {$hostname}/admin/post.php");
  }?>
  <div id="admin-content">
      <div class="container">
         <div class="row">
             <div class="col-md-12">
              
                 <h1 class="admin-heading">Add New Post</h1>

             </div>
              <div class="col-md-offset-3 col-md-6">
                  <!-- Form -->
                  <form  action="save-post.php" method="POST" enctype="multipart/form-data">
                      <div class="form-group">
                          <label for="post_title">Title</label>
                          <input type="text" name="post_title" class="form-control" autocomplete="off" required>
                      </div>
                      <div class="form-group">
                          <label for="exampleInputPassword1"> Description</label>
                          <textarea name="postdesc" class="form-control" rows="5"  required></textarea>
                      </div>
                      <div class="form-group">
                          <label for="exampleInputPassword1">Category</label>
                          <select name="category" class="form-control">
                              <option disabled selected> Select Category</option>
                              <?php
                                include "config.php";
                                $sql = "SELECT * FROM category";

                                $result = mysqli_query($conn, $sql) or die("Query Failed.");

                                if(mysqli_num_rows($result) > 0){
                                  while($row = mysqli_fetch_assoc($result)){
                                    echo "<option value='{$row['category_id']}'>{$row['category_name']}</option>";
                                  }
                                }
                              ?>
                          </select>
                      </div>
                      <div class="form-group">
                          <label for="exampleInputPassword1">Post Image/Video</label>
                          <input type="file" name="fileToUpload" required id="file" onchange="return fileValidation()">
                          <div id="imagePreview"></div>
                      </div>
                      <input type="submit" name="submit" class="btn btn-primary" value="Save" required />
                      
                  </form>
                  <!--/Form -->
              </div>
          </div>
      </div>
  </div>
<?php include "footer.php"; ?>
<script>
    function fileValidation(){
    var fileInput = document.getElementById('file');
    var filePath = fileInput.value;
    var allowedExtensions = /(\.jpg|\.jpeg|\.mp4|\.png)$/
    if(!allowedExtensions.exec(filePath)){
        alert('Please upload file having extensions .jpeg/.jpg/.png only.');
        fileInput.value = '';
        return false;
    }else{
        //Image preview
        if (fileInput.files && fileInput.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('imagePreview').innerHTML = '<img src="'+e.target.result+'"/>';
            };
            reader.readAsDataURL(fileInput.files[0]);
        }
    }
}
// fileValidation()
</script>