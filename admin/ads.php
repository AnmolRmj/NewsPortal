<?php include "header.php";
if ($_SESSION["user_role"] == 2) {
    header("Location: {$hostname}/admin/post.php");
} ?>
<div id="admin-content">
    <div class="container">
        <div class="row">
            <div class="col-md-10">
                <h1 class="admin-heading">All Advertisments</h1>
            </div>
            <div class="col-md-2">
                <a class="add-new" href="add-ads.php">add ads</a>
            </div>
            <div class="col-md-12">
                <?php
                include 'config.php'; // database configuration
                /* Calculate Offset Code */
                $limit = 3;
                if (isset($_GET["page"])) {
                    $page = $_GET["page"];
                } else {
                    $page = 1;
                }
                ;
                $offset = ($page - 1) * $limit;
                /* select query with offset and limit */
                $sql = "SELECT * FROM  advertisments ORDER BY ads_id DESC Limit $offset,$limit";
                $result = mysqli_query($conn, $sql);
                if (mysqli_num_rows($result) > 0) {
                    $table = '<table class="content-table">';
                    $table .= '<thead>
                                  <th>S.No.</th>
                                  <th>Ads Name</th>
                                  <th>Link</th>
                                  <th>Edit</th>
                                  <th>Delete</th>
                              </thead>
                              <tbody>';
                    $serial = $offset + 1;
                    while ($row = mysqli_fetch_assoc($result)) {
                        $table .= "<tr>
                            <td class='id'>{$serial}</td>
                            <td>{$row["ads_name"]}</td>
                            <td>{$row["Link"]}</td>
                            <td class='edit'><a href='update-ads.php?id={$row['ads_id']}' ><i class='fa fa-edit'></i></a></td>
                            <td class='delete'><a href='delete-ads.php?id={$row['ads_id']}'><i class='fa fa-trash-o'></i></a></td>
                        </tr>";
                        $serial++;
                    }
                    $table .= '</tbody></table>';
                    // show table
                    echo $table;
                } else {
                    echo "<h3>No Results Found.</h3>";
                }
                // select count() query for pagination
                $sql1 = "SELECT COUNT(ads_id) FROM advertisments";
                $result_1 = mysqli_query($conn, $sql1);
                $row_db = mysqli_fetch_row($result_1);
                $total_record = $row_db[0];
                $total_page = ($total_record / $limit);
                // show pagination
                // echo "<ul class='pagination admin-pagination'>";
                // if ($page > 1) {
                //     echo "<li><a href='ads.php?page=" . ($page - 1) . "'>Prev</a></li>";
                // }
                // if ($total_record > $limit) {
                //     for ($i = 1; $i <= $total_page; $i++) {
                //         if ($i == $page) {
                //             $cls = 'btn-primary active';
                //         } else {
                //             $cls = 'btn-primary';
                //         }
                //         echo "<li><a href='ads.php?page=" . $i . "' class='{$cls}'>$i</a></li>";
                //     }
                // }

                // if ($total_page > $page) {
                //     echo "<li> <a href='adss.php?page=" . ($page + 1) . "'>Next</a></li>";
                // }
                // echo "</ul>";
                $sql1 = "SELECT * FROM advertisments";
                $result1 = mysqli_query($conn, $sql1) or die("Query Failed.");

                if(mysqli_num_rows($result1) > 0){

                  $total_records = mysqli_num_rows($result1);

                  $total_page = ceil($total_records / $limit);

                  echo '<ul class="pagination admin-pagination">';
                  if($page > 1){
                    echo '<li><a href="ads.php?page='.($page - 1).'">Prev</a></li>';
                  }
                  for($i = 1; $i <= $total_page; $i++){
                    if($i == $page){
                      $active = "active";
                    }else{
                      $active = "";
                    }
                    echo '<li class="'.$active.'"><a href="ads.php?page='.$i.'">'.$i.'</a></li>';
                  }
                  if($total_page > $page){
                    echo '<li><a href="ads.php?page='.($page + 1).'">Next</a></li>';
                  }

                  echo '</ul>';
}
                ?>
            </div>
        </div>
    </div>
</div>
<?php include "footer.php"; ?>