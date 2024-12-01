<?php

date_default_timezone_set('Africa/Cairo');

header('Access-Control-Allow-Origin: *');  # Can be changed with the required server
header('Content-Type: application/json; charset=UTF-8');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Max-Age: 3600');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers');

$requestUri = $_SERVER['REQUEST_URI'];
$position = strpos($requestUri, 'index.php');

if ($position !== false) {
    $afterIndexPhp = substr($requestUri, $position + strlen('index.php'));

    if (strpos($afterIndexPhp, '/categories') === 0) {
        $afterCategories = substr($afterIndexPhp, strlen('/categories/'));
        if (strlen($afterCategories) > 0) {
            echo json_encode(getCategoryCoursesByID($afterCategories), JSON_PRETTY_PRINT);
        } else {
            echo json_encode(getAllCategories(), JSON_PRETTY_PRINT);
        }
    } else if (strpos($afterIndexPhp, '/courses') === 0) {
        $afterCourses = substr($afterIndexPhp, strlen('/courses/'));
        if (strlen($afterCourses) > 0) {
            if (isset($_GET['category_id'])) {
                if ($_GET['category_id'] != "") {
                    echo json_encode(getAllCourses($_GET['category_id']), JSON_PRETTY_PRINT);
                } else {
                    http_response_code(404);
                }
            } else {
                echo json_encode(getCoursesByID($afterCourses), JSON_PRETTY_PRINT);
            }
        } else {
            http_response_code(404);
        }
    } else {
        http_response_code(404);
    }
} else {
    http_response_code(404);
}

die();

function openConnection()
{
    $dbConn = new mysqli('database.cc.localhost', 'test_user', 'test_password', 'course_catalog') or die("Connect failed: %s\n" . $dbConn->error);
    $dbConn->set_charset('utf8');

    return $dbConn;
}

function closeConnection($dbConn)
{
    $dbConn->close();
}

function getAllCategories()
{
    $dbConn = openConnection();
    $allCats = $dbConn->query("SELECT * FROM `categories`;");

    $allCategories = [];
    while ($category = $allCats->fetch_assoc()) {
        $allCoursesCount = (int) $dbConn->query("SELECT COUNT(*) AS courses_count FROM `courses` WHERE `category_id` = '" . $category['id'] . "';")->fetch_assoc()['courses_count'];
        $allCategories[] = [
            "id" => $category['id'],
            "name" => $category['name'],
            "description" => $category['description'],
            "parent_id" => $category['parent'],
            "count_of_courses" => $allCoursesCount > 0 ? $allCoursesCount : 0,
            "created_at" => $category['created'],
            "updated_at" => $category['modified']
        ];
    }

    closeConnection($dbConn);

    return $allCategories;
}

function getCategoryCoursesByID($categoryID)
{
    $dbConn = openConnection();
    $allCats = $dbConn->query("SELECT * FROM `categories` WHERE `id` = '" . $categoryID . "';");

    $returnCategory = [];
    $category = $allCats->fetch_assoc();
    $allCoursesCount = (int) $dbConn->query("SELECT COUNT(*) AS courses_count FROM `courses` WHERE `category_id` = '" . $category['id'] . "';")->fetch_assoc()['courses_count'];
    $returnCategory = [
        "id" => $category['id'],
        "name" => $category['name'],
        "description" => $category['description'],
        "parent_id" => $category['parent'],
        "count_of_courses" => $allCoursesCount > 0 ? $allCoursesCount : 0,
        "created_at" => $category['created'],
        "updated_at" => $category['modified']
    ];

    closeConnection($dbConn);

    return $returnCategory;
}

function getAllCourses($categoryID)
{
    $dbConn = openConnection();
    $allCourses = $dbConn->query("SELECT `courses`.*, `categories`.`name` AS `cat_name` FROM `courses` JOIN `categories` ON `courses`.`category_id` = `categories`.`id` WHERE `courses`.`category_id` = '" . $categoryID . "';");
    closeConnection($dbConn);

    $allCoursesArr = [];
    while ($course = $allCourses->fetch_assoc()) {
        $allCoursesArr[] = [
            "id" => $course['id'],
            "name" => $course['title'],
            "description" => $course['description'],
            "preview" => $course['image'],
            "main_category_name" => $course['cat_name'],
            "created_at" => $course['created'],
            "updated_at" => $course['modified']
        ];
    }

    return $allCoursesArr;
}

function getCoursesByID($courseID)
{
    $dbConn = openConnection();
    $allCourses = $dbConn->query("SELECT `courses`.*, `categories`.`name` AS `cat_name` FROM `courses` JOIN `categories` ON `courses`.`category_id` = `categories`.`id` WHERE `courses`.`id` = '" . $courseID . "';");
    closeConnection($dbConn);

    $returnCousr = [];
    $course = $allCourses->fetch_assoc();
    $returnCousr = [
        "id" => $course['id'],
        "name" => $course['title'],
        "description" => $course['description'],
        "preview" => $course['image'],
        "main_category_name" => $course['cat_name'],
        "created_at" => $course['created'],
        "updated_at" => $course['modified']
    ];

    return $returnCousr;
}
