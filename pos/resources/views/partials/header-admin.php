<?php

use Core\Helpers\Helper; ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POS system</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="<?= "http://" . $_SERVER['HTTP_HOST'] ?>/resources/css/styles.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>

<body class="admin-view">
    <nav class="navbar  navbar-expand-lg nav-user">
        <div class="container-fluid w-100">
                <div class="d-flex align-items-center gap-2">
               <h1> <i class="fa-brands fa-opencart text-warning ml-2"></i></h1>
                    <span class="title-1">HTU-STORE</span>
                </div>
                <div class=" mr-5w-25">
             
                    <div class="dropdown w-25 me-3">
                        <button class="btn btn-outline-primary dropdown-toggle rad p-1 pe-2" type="button" id="dropdownMenuButton"
                            data-bs-toggle='dropdown' aria-haspopup="true" aria-expanded="false">
                            <img src="<?= "http://" . $_SERVER['HTTP_HOST'] ?>/resources/image/<?=$_SESSION['user']['image']?>" class="user_image">
                            &nbsp;<?=$_SESSION['user']['display_name']?>
                        </button>


                        <div class="dropdown-menu " aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="/profile?id=<?=$_SESSION['user']['user_id']?>">Mange Your Profile</a>
                            <a class="dropdown-item" href="/logout">Logout</a>
                        </div>
                    </div>
        </div>
    </nav>

    <div id="admin-area" class="row w-100 ">
        
        <div class="col-lg-1 col-md-2 col-sm-2  admin-links list_icon">
            <ul class="list-group list-group-flush mt-3 ">
            <?php if ($_SESSION['user']['role']== "admin") : ?>
                <li class="list-group-item p-3 ">
                    <a href="/dashboard"><i class="fa-sharp fa-solid fa-house fa-2x color w-50"></i></a>
                </li>
                <?php endif;?>
            
                <?php if (Helper::check_permission(['item:read'])) : ?>
                <li class="list-group-item p-3">
                    <a href="/items"><i class="fa-sharp fa-solid fa-bag-shopping  fa-2x color"></i></a>
                </li>
                <?php endif;
                if (Helper::check_permission(['item:create'])) :
                ?>
                <li class="list-group-item p-3">
                    <a href="/items/create"><i class="fa-solid fa-plus fa-2x color "></i></a>
                </li>
                <?php endif;
              
                if (Helper::check_permission(['transaction:read'])) :
                ?>
                <li class="list-group-item p-3">
                    <a href="/sales/all_transactions"><i class="fa-solid fa-money-bill  fa-2x color"></i></a>
                </li>
                <?php endif;
                if (Helper::check_permission(['transaction:create'])) :
                ?>
                <li class="list-group-item p-3">
                    <a href="/sales"><i class="fa-solid fa-cart-plus  fa-2x color"></i></a>
                </li>
                <?php endif; ?>
                <?php if (Helper::check_permission(['user:read'])) :
                ?>
                <li class="list-group-item p-3">
                    <a href="/users"><i class="fa-solid fa-users  fa-2x color"></i></a>
                </li>
                <?php endif;
                if (Helper::check_permission(['user:create'])) :
                ?>
                <li class="list-group-item p-3">
                    <a href="/users/create"><i class="fa-solid fa-user-plus fa-2x color"></i></a>
                </li>
                <?php endif; ?>

            </ul>
        </div>
        <div class="col-xl-11 col-sm-10 cl-md-10 cl-xs-10 admin-area-content" >
            <div class="container my-5 dashboard-divs">