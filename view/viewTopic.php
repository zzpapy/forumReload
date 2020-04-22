<h1>Titre : <?= $result["data"]["topics"]->getTitle(); 
$id_topic = $result["data"]["topics"]->getId();
$user_id = $result["data"]["topics"]->getUser()->getId();
$closed = $result["data"]["topics"]->getClosed();
if($closed == 1){?> - (cloturé) <?php } ?>
</h1>
<?php if($closed == 0){ ?>
    <form class="command" action="index.php?ctrl=forum&action=closeTopic&id=<?php echo $id_topic ?>" method="POST">
        <input type="hidden" name="user_id" value="<?php echo $user_id ?>">
        <input type="hidden" name="topic_id" value="<?php echo $id_topic ?>">
        <button class=""><i class="fas fa-lock-open"></i></button>
    </form>
    <?php 
}
else{ ?>
    <form class="command" action="index.php?ctrl=forum&action=closeTopic&id=<?php echo $id_topic ?>" method="POST">
        <input type="hidden" name="user_id" value="<?php echo $user_id ?>">
        <input type="hidden" name="topic_id" value="<?php echo $id_topic ?>">
        <button class=""><i class="fas fa-lock"></i></button>
    </form>
<?php }

$admin = App\Session::isAdmin();
foreach ($result["data"]["posts"] as  $post) { 
    ?>
    <article>
        <table class="posts">
            <tr>
                <td width="5%"></td>
                <td class="mess" width="90%">Message</td>
                <td  width="10%" class="outils" name="<?= $post->getId() ?>"><div >outils</div></td>
            <td id="<?= $post->getId() ?>"class="command_op hide" >
                <div  width="5%">
                    <form class="stop_form" action="index.php?ctrl=forum&action=signal" method="post">
                        <input type="hidden" name="user_id" value="<?php echo $_SESSION["user"]->getId() ?>">
                        <input type="hidden" name="post_id" value="<?php echo $post->getId() ?>">
                        <input type="hidden" name="topic_id" value="<?php echo $id_topic ?>">
                        <input class="stop" type="image" src="public/img/stop.png" name="submit"> 
                    </form>
                </div>
                <?php  if ($_SESSION["user"]->getId() == $post->getUser()->getId() || $admin) { ?>
                <div width="5%">
                    <form class="command" action='index.php?ctrl=forum&action=deleteMess' method='POST'>
                        <input type="hidden" name="id_post" value="<?php echo $post->getId() ?>">
                        <input type="hidden" name="user_id" value="<?php echo $post->getUser()->getId() ?>">
                        <input type="hidden" name="topic_id" value="<?php echo $_GET["id"] ?>">
                        <button><span class=' fa-2x fas fa-times-circle'></button>
                    </form>
                </div>
                <div width="5%">
                    <form class="command" action="index.php?ctrl=forum&action=modifMess" method="POST">
                        <input type="hidden" name="id_post" value="<?php echo $post->getId() ?>">
                        <input type="hidden" name="user_id" value="<?php echo $post->getUser()->getId() ?>">
                        <input type="hidden" name="topic_id" value="<?php echo $_GET["id"] ?>">
                        <button class=""><i class="fas fa-2x fa-edit"></i></button>
                    </form>
                </div>
            </td>
        <?php
            } ?>
    </tr>
    <tr>
        </tr>
        <tr>
            <td width="15%" class="author_comment author_post" >
                <div>
                    <img src="<?= $post->getUser()->getAvatar() ?>" alt="">                
                    by: <?= $post->getUser()->getUsername() ?>
                </div>
                <div >
                    <?= $post->getCreationdate() ?>
                </div>
            </td>
        <td class="text_comment" colspan="2"><?= $post->getContent() ?></td>
    </tr>
</table>
</article>
<article>
<table>
    <?php if($closed == 0){ ?>
    <tr>
        <td ></td>
        <td colspan="2">
            <form action="index.php?ctrl=forum&action=creaComment&id=<?= $post->getId() ?>" method="POST">
            <input type="hidden" name="topic_id" value="<?= $result["data"]["topics"]->getId() ?>">
                <p><textarea name="content" id="" cols="20" rows="4" placeholder="commenter le meassage de <?= $post->getUser()->getUsername() ?> ..."></textarea></p>
                <p><input type="submit" value="créer"></p>
            </form>
        </td>
    </tr>
    <?php } ?>
    <tr>
     <?php 
        if(!empty($result["data"]["comments"][$post->getId()])){ ?>
        <tr>
            <!-- <td width="10%"></td> -->
            <td class="comment_title">Commentaires</td>
        </tr>
    <?php } ?>
</table>
    <table class="comment">
    <?php
        // var_dump(!empty($result["data"]["comments"][$post->getId()]));die;
        if(!empty($result["data"]["comments"][$post->getId()])){
            foreach ($result["data"]["comments"][$post->getId()] as  $comment) { ?>
                    <td  class="marge"width="5%"></td>
                <td class="author_comment" width="15%">
                <?= $comment->getUser()->getUsername() ?>
                </td>
                </tr>
                <tr>
                    <td class="marge"></td>
                <td class="author_comment" width="15%">
                <?= $comment->getCreationdate() ?>
                </td>
                <td class="text_comment">
                    <?= $comment->getContent() ?>
                </td>
            </tr>
            <?php }
        }
        ?>
        </table>
    
    <?php }
?>
</table>
</article>
<?php if($closed == 0){ ?>
<form action="index.php?ctrl=forum&action=creaPost&id=<?= $result["data"]["topics"]->getId() ?>" method="POST">
    <p><textarea name="content" id="" cols="90" rows="10" placeholder="Nouveau message du sujet..."></textarea></p>
    <p><input type="submit" value="créer"></p>
</form>
<?php } ?>