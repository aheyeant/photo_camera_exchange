<?php

require_once("../../server/content/Template.php");
require_once("../../server/Constants.php");


$user_logged = false;
$user_username = null;
if (isset($_SESSION["user_id"])) $user_logged = true;
if (isset($_SESSION["user_username"])) $user_username = strlen($_SESSION["user_username"]) > 12 ? substr($_SESSION["user_username"], 0, 12) . "..." : $_SESSION["user_username"];
if (!$user_logged) {
    header("Location: http://".$_SERVER['HTTP_HOST'].Constants::$DEPLOY_PREFIX."/auth/signin");
}

$template = new Template("./");
$title = "Reset Password";

$verify_error = false;
$log_old_password = "";
$log_new_password = "";

if (isset($_SESSION["reset_password_verify_error"])) $verify_error = true;
if (isset($_SESSION["reset_password_verify_log_old_password"])) $log_old_password = $_SESSION["reset_password_verify_log_old_password"];
if (isset($_SESSION["reset_password_verify_log_new_password"])) $log_new_password = $_SESSION["reset_password_verify_log_new_password"];

$_SESSION["reset_password_verify_error"] = null;
$_SESSION["reset_password_verify_log_old_password"] = null;
$_SESSION["reset_password_verify_log_new_password"] = null;


//------------------------------------------------
$template->set("title", $title);
$template->set("site_name", Constants::$SITE_NAME_UPPERCASE);
$template->set("deploy_prefix", Constants::$DEPLOY_PREFIX);
$template->set("user_logged", $user_logged);
$template->set("user_username", $user_username);
$template->set("verify_error", $verify_error);
$template->set("log_old_password", $log_old_password);
$template->set("log_new_password", $log_new_password);
//------------------------------------------------
$template->display("passwordPage");