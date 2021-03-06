<?php


require_once("../../server/Constants.php");
require_once("../../server/database/model/User.php");
require_once("../../server/database/services/UserService.php");
require_once("../../server/helpers/VerifyHelper.php");
require_once("../../server/helpers/UserVerifyHelper.php");


$username = null;
$password = null;

if (isset($_POST["username"])) $username = $_POST["username"];
if (isset($_POST["password"])) $password = $_POST["password"];

$username = VerifyHelper::removeWhitespacesAndTransformToLowerCase($username);
$password = VerifyHelper::removeWhitespacesAndTransformToLowerCase($password);


$_SESSION["signin_verify_error"] = null;
$_SESSION["signin_error"] = null;
$_SESSION["signin_verify_old_username"] = $username;
$_SESSION["signin_verify_log_username"] = null;
$_SESSION["signin_verify_log_password"] = null;


if (!UserVerifyHelper::verifyUsername($username)) {
    $_SESSION["signin_verify_error"] = true;
    $_SESSION["signin_verify_log_username"] = "Incorrect username format";
    header("Location: http://".$_SERVER['HTTP_HOST'].Constants::$DEPLOY_PREFIX.'/auth/signin');
    exit;
}

if (!UserVerifyHelper::verifyPassword($password)) {
    $_SESSION["signin_verify_error"] = true;
    $_SESSION["signin_verify_log_password"] = "Password must be at least " . Constants::$PASSWORD_MIN_LENGTH . " characters";
    header("Location: http://".$_SERVER['HTTP_HOST'].Constants::$DEPLOY_PREFIX.'/auth/signin');
    exit;
}

$user = UserService::getByUsername($username);
if (!$user->isLoaded()) {
    $_SESSION["signin_error"] = true;
    header("Location: http://".$_SERVER['HTTP_HOST'].Constants::$DEPLOY_PREFIX.'/auth/signin');
    exit;
}

if (password_verify($password, $user->password)) {
    $_SESSION['user_id'] = $user->id;
    $_SESSION['user_username'] = $user->username;
    $_SESSION['user_verified'] = $user->verified;
    $_SESSION['user_blocked'] = $user->blocked;
    header("Location: http://".$_SERVER['HTTP_HOST'].Constants::$DEPLOY_PREFIX."/home");
    exit;
} else {
    $_SESSION["signin_error"] = true;
    header("Location: http://".$_SERVER['HTTP_HOST'].Constants::$DEPLOY_PREFIX.'/auth/signin');
    exit;
}