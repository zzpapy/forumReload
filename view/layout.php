<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <meta property="og:title" content="Forum" />
    <meta name="description" content="Forum réalisé dans le cadre de ma formation CDA">
    <meta property="og:url" content="https://www.manucloud.ddns.net/_forum/_forum" />
    <meta property="og:description" content="Forum réalisé dans le cadre de ma formation CDA">
    <meta property="og:image" itemprop="image" content="//manucloud.ddns.net/_forum/_forum/public/images/acheter-un-chat(1).jpg">
    <!-- <meta property="og:image" itemprop="image" content="//manucloud.ddns.net/forum/public/images/acheter-un-chat.jpg"> -->
    <meta property="og:type" content="website" />
    <meta property="og:locale:alternate" content="fr_FR" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" integrity="sha256-h20CPZ0QyXlBuAw7A+KluUYx/3pK+c7lYEpqLTlxjYQ=" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./public/css/style.css">
    <title>FORUM</title>
    <script src="https://cdn.tiny.cloud/1/3gr70hsm3dpwzqfab3aenwtc39yehpw0o2s2zqg2l2oqim1t/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
</head>
<body>
 
  <script>
    tinymce.init({
      selector: 'textarea',
      plugins: 'a11ychecker advcode casechange formatpainter linkchecker autolink lists checklist media mediaembed pageembed permanentpen powerpaste table advtable tinycomments tinymcespellchecker',
      toolbar: 'a11ycheck addcomment showcomments casechange checklist code formatpainter pageembed permanentpen table',
      toolbar_mode: 'floating',
      tinycomments_mode: 'embedded',
      tinycomments_author: 'Author name',
      content_css: '//localohost/public/css/style.css',
    });
  </script>
</head>
<body>
    <div id="wrapper"> 
        <?php 
        // var_dump(App\Session::getUser()->hasRole("ADMIN"));
        // var_dump(App\Session::isAdmin());die; ?>
        <div id="mainpage">
            <!-- c'est ici que les messages (erreur ou succès) s'affichent-->
            <h3 id="message" style="color: red">
                <?= App\Session::getFlash("error") ?>
            </h3>
            <h3 id="message" style="color: green">
                <?= App\Session::getFlash("success") ?>
            </h3>
            <header>
                <div class="head">
            <?php if(App\Session::getUser()){
                            $user = App\Session::getUser();
                            $avatar = $user->getAvatar();
                            $username = $user->getUsername() ?>
                <p class="username"><span><?= $username ?></span></p>
            <?php } ?>
                <nav>
                    <?php
                        if(App\Session::isAdmin()){
                            ?>
                            <a href="index.php?ctrl=home&action=users">Voir la liste des gens</a>
                            <a href="index.php?ctrl=forum&action=signalement">Signalement</a>
                            <?php
                        } ?>
                        <a href="index.php">Accueil</a>
                        <?php if(App\Session::getUser()){
                            $user = App\Session::getUser();
                            $avatar = $user->getAvatar();
                            $username = $user->getUsername()
                            ?>
                            
                            <a href="index.php?ctrl=security&action=logout">Déconnexion</a>
                            <a href="index.php?ctrl=home&action=profile"><i class="fas fa-3x fa-user-alt"></i></a>
                            <?php
                        }
                        else{
                            ?>
                            <a href="index.php?ctrl=security&action=login">Connexion</a>
                            <a href="index.php?ctrl=security&action=register">Inscription</a>
                            <?php
                        }                   
                    ?>                   
                </nav>
            </header>
            </div>
            
            <main id="forum">
                <?= $page ?>
            </main>
        </div>
        <footer>
            <p>&copy; 2020 - Forum CDA</p>
            <!--<button id="ajaxbtn">Surprise en Ajax !</button> -> cliqué <span id="nbajax">0</span> fois-->
        </footer>
    </div>
    <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous">
    </script>
    <script src="public/js/script.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
    <script>
        $("#ajaxbtn").on("click", function(){
            $.get(
                "index.php?action=ajax",
                {
                    nb : $("#nbajax").text()
                },
                function(result){
                    $("#nbajax").html(result)
                }
            )
        })
    </script>
</body>
</html>