<div id="sidebar" class="col-md-4">
    <!-- search box -->
    <div class="search-box-container">
        <h4>Search</h4>
        <form class="search-post" action="search.php" method ="GET">
            <div class="input-group">
                <input type="text" name="search" class="form-control" placeholder="Search .....">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-danger">Search</button>
                </span>
            </div>
        </form>
    </div>
    <!-- /search box -->
    <!-- / Advertisment section-->
    <div class="search-box-container">
        <?php
        include "config.php";

        /* Calculate Offset Code */
        $limit = 3;

        $sql = "SELECT ads_id,image,Link FROM advertisments ORDER BY ads_id DESC LIMIT {$limit}";

        $result = mysqli_query($conn, $sql) or die("Query Failed. : Advertisment");
        if(mysqli_num_rows($result) > 0){
          while($row = mysqli_fetch_assoc($result)) {
      ?>
        <div class="recent-post">
            <a class="ads-img" href="<?php echo $row['Link']; ?>" target="_blank" >
                <img src="admin/upload/<?php echo $row['image']; ?>" alt=""/>
            </a>
        </div>
        <?php
            }
        }
        ?>
    </div>
    <!-- recent posts box -->
    <div class="recent-post-container">
        <h4>Recent Posts</h4>
        <?php
        /* Calculate Offset Code */
        $limit = 5;

        $sql = "SELECT post.post_id, post.title, post.post_date,
        category.category_name,post.category,post.post_img FROM post
        LEFT JOIN category ON post.category = category.category_id
        ORDER BY post.post_id DESC LIMIT {$limit}";

        $result = mysqli_query($conn, $sql) or die("Query Failed. : Recent Post");
        if(mysqli_num_rows($result) > 0){
          while($row = mysqli_fetch_assoc($result)) {
      ?>
        <div class="recent-post">
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

            <div class="post-content">
                <h5><a href="single.php?id=<?php echo $row['post_id']; ?>"><?php echo $row['title']; ?></a></h5>
                <span>
                    <i class="fa fa-tags" aria-hidden="true"></i>
                    <a href='category.php?cid=<?php echo $row['category']; ?>'><?php echo $row['category_name']; ?></a>
                </span>
                <span>
                    <i class="fa fa-calendar" aria-hidden="true"></i>
                    <?php echo $row['post_date']; ?>
                </span>
                <a class="read-more" href="single.php?id=<?php echo $row['post_id']; ?>">Read more</a>
            </div>
        </div>
    <?php
      }
    }
    ?>
    </div>
    <!-- /recent posts box -->
</div>
