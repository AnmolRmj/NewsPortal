<?php include 'header.php'; ?>
    <div id="main-content">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <!-- post-container -->
                    <div class="post-container">
                      <?php
                        include "config.php";

                        /* Calculate Offset Code */
                        $limit = 15;
                        if(isset($_GET['page'])){
                          $page = $_GET['page'];
                        }else{
                          $page = 1;
                        }
                        $offset = ($page - 1) * $limit;

                        $sql = "SELECT post.post_id, post.title, post.description,post.post_date,post.author,
                        category.category_name,user.username,post.category,post.post_img FROM post
                        LEFT JOIN category ON post.category = category.category_id
                        LEFT JOIN user ON post.author = user.user_id
                        ORDER BY post.post_id DESC LIMIT {$offset},{$limit}";

                        $result = mysqli_query($conn, $sql) or die("Query Failed.");
                        if(mysqli_num_rows($result) > 0){
                          while($row = mysqli_fetch_assoc($result)) {
                      ?>
                        <div class="post-content">
                            <div class="row">
                                <!-- <div class="col-md-4">
                                  <a class="post-img" href="single.php?id=<?php echo $row['post_id']; ?>"><img src="admin/upload/<?php echo $row['post_img']; ?>" alt=""/></a>
                                </div> -->
                                <div class="col-md-4">
    <a class="post-img" href="single.php?id=<?php echo $row['post_id']; ?>">
        <?php
        $fileType = pathinfo($row['post_img'], PATHINFO_EXTENSION);

        if (in_array($fileType, ['jpg', 'jpeg', 'png', 'gif'])) {
            // Display image thumbnail
            echo '<img src="admin/upload/' . $row['post_img'] . '" alt="Image">';
        } elseif (in_array($fileType, ['mp4', 'avi', 'mkv'])) {
            // Display video thumbnail
            echo '<video width="100%" height="auto" controls>';
            echo '<source src="admin/upload/' . $row['post_img'] . '" type="video/mp4">';
            echo 'Your browser does not support the video tag.';
            echo '</video>';
        } else {
            // Unsupported file type
            echo '<p>Unsupported file type</p>';
        }
        ?>
    </a>
</div>

                                <div class="col-md-8">
                                  <div class="inner-content clearfix">
                                      <h3><a href='single.php?id=<?php echo $row['post_id']; ?>'><?php echo $row['title']; ?></a></h3>
                                      <div class="post-information">
                                          <span>
                                              <i class="fa fa-tags" aria-hidden="true"></i>
                                              <a href='category.php?cid=<?php echo $row['category']; ?>'><?php echo $row['category_name']; ?></a>
                                          </span>
                                          <span>
                                              <i class="fa fa-user" aria-hidden="true"></i>
                                              <a href='author.php?aid=<?php echo $row['author']; ?>'><?php echo $row['username']; ?></a>
                                          </span>
                                          <span>
                                              <i class="fa fa-calendar" aria-hidden="true"></i>
                                              <?php echo $row['post_date']; ?>
                                          </span>
                                      </div>
                                      <p class="description">
                                          <?php echo substr($row['description'],0,130) . "..."; ?>
                                      </p>
                                      <a class='read-more pull-right' href='single.php?id=<?php echo $row['post_id']; ?>'>read more</a>
                                  </div>
                                </div>
                            </div>
                        </div>
                        <?php
                          }
                        }else{
                          echo "<h2>No Record Found.</h2>";
                        }

                        // show pagination
                        $sql1 = "SELECT * FROM post";
                        $result1 = mysqli_query($conn, $sql1) or die("Query Failed.");

                        if(mysqli_num_rows($result1) > 0){

                          $total_records = mysqli_num_rows($result1);

                          $total_page = ceil($total_records / $limit);

                          echo '<ul class="pagination admin-pagination">';
                          if($page > 1){
                            echo '<li><a href="index.php?page='.($page - 1).'">Prev</a></li>';
                          }
                          for($i = 1; $i <= $total_page; $i++){
                            if($i == $page){
                              $active = "active";
                            }else{
                              $active = "";
                            }
                            echo '<li class="'.$active.'"><a href="index.php?page='.$i.'">'.$i.'</a></li>';
                          }
                          if($total_page > $page){
                            echo '<li><a href="index.php?page='.($page + 1).'">Next</a></li>';
                          }

                          echo '</ul>';
                        }
                        ?>
                    </div><!-- /post-container -->
                </div>
                <?php include 'sidebar.php'; ?>
            </div>
        </div>
    </div>
<?php include 'footer.php'; ?>
