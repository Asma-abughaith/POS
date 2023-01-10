<nav class="navbar1">

    
    <span class="title-1"><i class="fa-brands fa-opencart icon-1"></i> HTU-STORE</span>

</nav>
<div id="login_page">
    <div class="all">
        <div id="login-form">
            <form method="POST" action="/authenticate" class="login">
                <h2 class="title"> Login</h2>
                <?php if (!empty($_SESSION) && isset($_SESSION['error']) && !empty($_SESSION['error'])) : ?>
                <div  class="alert">
                    <?= $_SESSION['error'] ?>
                </div>
                <?php
            $_SESSION['error'] = null;
        endif; ?>

                <div class="info">
                    <!-- <label for="admin-username" >Username</label> -->
                    <i class="fa-solid fa-user icon"></i>
                    <input class=" info-2" type="text" id="admin-username" name="username" placeholder="Username"
                        required>
                </div>
                <div class="info ">
                    <!-- <label for="admin-password" >Password</label> -->
                    <i class="fa-solid fa-lock icon"></i>
                    <input class=" info-2" type="password" id="admin-password" name="password" placeholder="Password"
                        required>
                </div>
                <div class="title">
                    <input type="checkbox" id="remember-me" name="remember_me">
                    <label for="remember-me">Remember Me</label>
                </div>
                <div id="login-button">
                    <button type="submit" class="button ">Login</button>
                </div>
            </form>
</div>
  

<!-- <footer>
    <p class="m-0">&copy; <?= date('Y') ?> - All rights reserved to HTU</p>
</footer> -->