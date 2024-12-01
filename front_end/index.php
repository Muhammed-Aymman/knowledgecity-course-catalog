<?php
error_reporting(E_ALL);
ini_set("display_errors", "1");

require_once("./conf.php");


function getCategoryTree($parentId = null)
{
    global $dbConn;
    $categories = $dbConn->query("SELECT `categories`.`id`, `categories`.`name`, COUNT(`courses`.`id`) AS `course_count` FROM `categories` LEFT JOIN `courses` ON `courses`.`category_id` = `categories`.`id` WHERE `categories`.`parent` " . ($parentId === null ? "IS NULL" : "= '" . $parentId . "'") . " GROUP BY `categories`.`id`, `categories`.`name`;")->fetch_all(MYSQLI_ASSOC);
    foreach ($categories as &$category) {
        $category['children'] = getCategoryTree($category['id']);
    }
    return $categories;
}

function getAllCourses()
{
    global $dbConn;
    return $dbConn->query("SELECT `courses`.*, `categories`.`name` as `cat_name` FROM `courses` JOIN `categories` ON `courses`.`category_id` = `categories`.`id`;")->fetch_all(MYSQLI_ASSOC);
}

function generateTreeView(array $categories, $currentDepth = 1, $maxDepth = 4): string
{
    if ($currentDepth > $maxDepth) {
        return '';
    }

    $treeView = '<ul>';
    foreach ($categories as $category) {
        $treeView .= '<li class="cat-main-filter"><a href="javascript:;" data-id="' . $category['id'] . '" class="category-filter">' . htmlspecialchars($category['name']) . ($category['course_count'] > 0 ? " <span class='course-count'>(" . $category['course_count'] . ")</span>" : NULL) . '</a>';
        if (!empty($category['children'])) {
            $treeView .= generateTreeView($category['children'], $currentDepth + 1, $maxDepth);
        }
        $treeView .= '</li>';
    }
    $treeView .= '</ul>';
    return $treeView;
}

$dbConn = openConnection();
$finalCatList = getCategoryTree(null);
$allCourses = getAllCourses();
closeConnection($dbConn);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Course catalog</title>
    <link rel="stylesheet" type="text/css" href="./bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./custom.css">
</head>

<body class="min-vh-100">
    <div class="container-xl">
        <div class="row">
            <div class="col-4">
                <div class="row">
                    <div class="col-12 py-5">
                        <h2><strong>Categories</strong></h2>
                    </div>
                    <div class="col-12">
                        <ul>
                            <li><a href="javascript:;" data-id="" class="category-filter">All Categories</a></li>
                        </ul>
                        <?= generateTreeView($finalCatList); ?>
                    </div>
                </div>
            </div>
            <div class="col-8">
                <div class="row text-center">
                    <div class="col-12 py-5">
                        <h1><strong class="selected-category-name">Course catalog</strong></h1>
                    </div>
                    <div class="col-12">
                        <div class="row justify-content-center">
                            <?php foreach ($allCourses as $course) { ?>
                                <div class="col-12 col-lg-4 mb-4 course-card" cat-id="<?= $course['category_id']; ?>">
                                    <div class="card">
                                        <span class="course-category-name"><?= $course['cat_name']; ?></span>
                                        <img src="<?= $course['image']; ?>" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title text-start course-title text-limited"><?= $course['title']; ?></h5>
                                            <p class="card-text text-start course-text text-limited"><?= $course['description']; ?></p>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                            <div class="col-12" id="no-courses-available">
                                <h2>No Available Courses</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', () => {
            const categoryButtons = document.querySelectorAll('.category-filter');
            const courseCards = document.querySelectorAll('.course-card');
            const noCoursesMessage = document.getElementById('no-courses-available');

            const updateNoCoursesMessage = () => {
                const visibleCourses = Array.from(courseCards).some(card => card.style.display !== 'none');
                if (!visibleCourses) {
                    noCoursesMessage.style.display = 'block';
                } else {
                    noCoursesMessage.style.display = 'none';
                }
            };

            categoryButtons.forEach(button => {
                button.addEventListener('click', function() {
                    categoryButtons.forEach(btn => btn.style.fontWeight = "normal");
                    document.querySelectorAll(".cat-main-filter").forEach(list => list.classList.remove("active"));
                    this.style.fontWeight = "bold";
                    this.parentNode.classList.add("active");
                    document.querySelector(".selected-category-name").innerHTML = this.innerText.trim().replace(/\s*\(.*\)\s*/, '');

                    const selectedCategoryId = this.getAttribute('data-id');
                    courseCards.forEach(courseCard => {
                        const courseCategoryId = courseCard.getAttribute('cat-id');

                        if (courseCategoryId === selectedCategoryId || selectedCategoryId === '') {
                            courseCard.style.display = 'block';
                        } else {
                            courseCard.style.display = 'none';
                        }
                    });
                    updateNoCoursesMessage();
                });
            });

            document.querySelector('.category-filter[data-id=""]').addEventListener('click', () => {
                document.querySelector(".selected-category-name").innerHTML = "Course catalog";
                courseCards.forEach(courseCard => {
                    courseCard.style.display = 'block';
                });
                updateNoCoursesMessage();
            });

            updateNoCoursesMessage();
        });
    </script>
</body>

</html>