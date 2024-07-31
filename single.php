<?php include 'header.php'; ?>
    <div id="main-content">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                  <!-- post-container -->
                    <div class="post-container">
                      <?php
                        include "config.php";

                        $post_id = $_GET['id'];

                        $sql = "SELECT post.post_id, post.title, post.description,post.post_date,post.author,
                        category.category_name,user.username,post.category,post.post_img FROM post
                        LEFT JOIN category ON post.category = category.category_id
                        LEFT JOIN user ON post.author = user.user_id
                        WHERE post.post_id = {$post_id}";

                        $result = mysqli_query($conn, $sql) or die("Query Failed.");
                        if(mysqli_num_rows($result) > 0){
                          while($row = mysqli_fetch_assoc($result)) {
                      ?>
                        <div class="post-content single-post">
                            <h3><?php echo $row['title']; ?></h3>
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
                          
<?php
$fileType = pathinfo($row['post_img'], PATHINFO_EXTENSION);

if (in_array($fileType, ['jpg', 'jpeg', 'png', 'gif'])) {
    // If it's an image, display the image
    echo '<img class="single-feature-image" src="admin/upload/' . $row['post_img'] . '" alt="Image">';
} elseif (in_array($fileType, ['mp4', 'avi', 'mkv'])) {
    // If it's a video, display the video
    echo '<video class="single-feature-video" controls>';
    echo '<source src="admin/upload/' . $row['post_img'] . '" type="video/mp4">';
    echo 'Your browser does not support the video tag.';
    echo '</video>';
} else {
    // Unsupported file type
    echo '<p>Unsupported file type</p>';
}
?>
                            <?php $des= $row['description']; ?>
                            
                            <p id="descvalue" class="description hidevalue">
                                <?php echo $des; ?>
                            </p>
                            <p id="newparagraph">
                                
                          </p>
                          <div class="myparas"></div>
                        </div>
                        <h4 class="page-header">Comments</h4>
                        <section class="comment-list">
                            <?php
                                $postId = $row['post_id'];
                                $post_comments = "SELECT * FROM  comments WHERE post_id = $postId ORDER BY comment_id DESC";
                                $result = mysqli_query($conn, $post_comments);
                                if (mysqli_num_rows($result) > 0) {
                                    while($row = mysqli_fetch_assoc($result)){
                                    ?>
                                    <article class="row">
                                        <div class="col-md-2 col-sm-2 hidden-xs">
                                            <figure class="thumbnail">
                                                <img class="img-responsive image-circle" src="images/cmt-user.png" height="50" width="50" />
                                            </figure>
                                        </div>
                                        <div class="col-md-10 col-sm-10">
                                            <div class="panel panel-default arrow left">
                                                <div class="panel-body">
                                                    <header class="text-left">
                                                        <time class="comment-date" datetime="<?php echo $row['comment_date']; ?>"><i class="fa fa-clock-o"></i>
                                                         <?php echo $row['comment_date']; ?></time>
                                                    </header>
                                                    <div class="comment-post">
                                                        <p>
                                                            <?php echo $row['comments']; ?>
                                                        </p>
                                                    </div>
                                                   

                                                    <!-- <div class="comment-actions">
                                                    <button class="reply-button" data-comment-id="<?php echo $row['comment_id']; ?>">Reply</button>
</div> -->
<!-- <div class="reply-form ">
    <form action="submit_comment.php" method="post">
       
        <input type="hidden" name="parent_id" value="<?php echo $row['comment_id']; ?>">
        <div style="padding-left: 4px;">
    <textarea name="comment" rows="3" placeholder="Write a reply"></textarea>
</div>
<div style="padding-left: 4px;">
<input type="hidden" name="post_id" value="<?php echo $postId ?>"/>
    <input type="text" name="name" placeholder="your name"  >
    <input type="text" name="email" placeholder="your email"  >
</div>
<div style="padding-left: 4px;">
    <input type="submit" value="Submit Reply">
</div>
    </form>
</div> -->
<!-- <script>
 document.addEventListener("DOMContentLoaded", function () {
    var replyButtons = document.querySelectorAll(".reply-button");

    replyButtons.forEach(function (button) {
        button.addEventListener("click", function () {
            var commentId = this.getAttribute("data-comment-id");
            console.log("Clicked reply button for comment ID: " + commentId);

            var replyForm = document.querySelector(".reply-form[data-comment-id='" + commentId + "']");
            if (replyForm) {
                replyForm.classList.toggle("hidden");
            } else {
                console.log("Reply form not found for comment ID: " + commentId);
            }
        });
    });
});

</script> -->
                                                </div>
                                                
                                            </div>
                                            
                                        </div>
                                        
                                    </article> 
                                    <?php   
                                    }
                                }
                            ?>
                        </section>
                           
                        <div class="post-information">
                            <form action="comment.php" method ="POST">
                                <div class="form-group">
                                    <textarea name="comments" class="form-control" rows="5"  placeholder="Please write your comment" required></textarea>
                                </div>
                                <input type="hidden" name="post_id" value="<?php echo $postId ?>"/>
                                <input type="submit" name="submit" class="btn btn-primary" value="Submit" required />
                            </form>
                        </div>
                        <?php
                          }
                        }else{
                          echo "<h2>No Record Found.</h2>";
                        }

                        ?>
                    </div>
                    <!-- /post-container -->
                </div>
                <?php include 'sidebar.php'; ?>
            </div>
        </div>
    </div>

    <script>
       const paragraph=document.querySelector("#descvalue").textContent; 
    //    document.querySelector("#newparagraph").textContent=myparagraph.replace(/(\d+\.)\s*/g, '$1\n');                        
        
       

const div = document.querySelector('.myparas');

// Split the paragraph into an array of strings at each "\n" character
const paragraphs = paragraph.split("\n");

// Loop through each paragraph and wrap each "number dot like 2" item in a p element
for (let i = 0; i < paragraphs.length; i++) {
  const p = document.createElement('p');
  const matches = paragraphs[i].match(/(\d\..+?)(?=\d\.|$)/g) || [];

  // If there are no "number dot like 2" items in the paragraph, just append the whole paragraph to the div
  if (matches.length === 0) {
    p.textContent = paragraphs[i];
    div.appendChild(p);
  } else {
    // Loop through each match and wrap it in a p element
    for (let j = 0; j < matches.length; j++) {
      const innerP = document.createElement('p');
      innerP.textContent = matches[j];
      p.appendChild(innerP);
    }
    // Append the new p element to the div
    div.appendChild(p);
  }
}
                                
                            </script>
                           
<?php include 'footer.php'; ?>
