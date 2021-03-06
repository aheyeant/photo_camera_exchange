<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?=$this->title?></title>
    <link href="<?=$this->deploy_prefix?>/assets/styles/style.css" rel="stylesheet">
    <script src="<?=$this->deploy_prefix?>/assets/scripts/verify.js"></script>
</head>
<body>
<div id="masterHead" class="master-header">
    <div class="nav-layout big">
        <div class="nav-user">
            <?php if (!$this->user_logged) { ?>
            <div class="sign-button-layout">
                <a href="<?=$this->deploy_prefix?>/auth/signin" class="a-border">SIGN IN</a>
            </div>
            <?php } else { ?>
            <div class="sign-button-layout">
                <a href="<?=$this->deploy_prefix?>/account" class="user-account">
                    <svg class="nav-svg-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M255.999,0c-74.443,0-135,60.557-135,135s60.557,135,135,135s135-60.557,135-135S330.442,0,255.999,0z"/><path d="M478.48,398.68C438.124,338.138,370.579,302,297.835,302h-83.672c-72.744,0-140.288,36.138-180.644,96.68l-2.52,3.779V512 h450h0.001V402.459L478.48,398.68z"/></svg>
                    <span><?=$this->user_username?></span>
                </a>
                <a href="<?=$this->deploy_prefix?>/auth/signout" class="a-border">SIGN OUT</a>
            </div>
            <?php } ?>
        </div>
        <div class="nav-center">
            <a href="<?=$this->deploy_prefix?>/home" class="site-name-text"><?=$this->site_name?></a>
        </div>
        <div class="nav-filter hidden">

        </div>
    </div>
</div>

<div id="pageContent">
    <div class="account-layout">
        <div class="account-nav">
            <div class="account-nav-field">
                <div class="flex">
                    <div class="field-link field-link-padding">
                        <a href="<?=$this->deploy_prefix?>/account">Details</a>
                    </div>
                    <div class="field-edit">
                        <a href="<?=$this->deploy_prefix?>/account/edit">
                            <svg class="field-edit-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M328.883,89.125l107.59,107.589l-272.34,272.34L56.604,361.465L328.883,89.125z M518.113,63.177l-47.981-47.981   c-18.543-18.543-48.653-18.543-67.259,0l-45.961,45.961l107.59,107.59l53.611-53.611   C532.495,100.753,532.495,77.559,518.113,63.177z M0.3,512.69c-1.958,8.812,5.998,16.708,14.811,14.565l119.891-29.069 L27.473,390.597L0.3,512.69z"></svg>
                        </a>
                    </div>
                </div>
            </div>
            <div class="account-nav-field">
                <div class="field-link">
                    <a href="<?=$this->deploy_prefix?>/account/offers">My offers</a>
                </div>
            </div>
            <div class="account-nav-field">
                <div class="field-link">
                    <a href="<?=$this->deploy_prefix?>/account/create">New offer</a>
                </div>
            </div>
            <div class="account-nav-field">
                <div class="field-link">
                    <a href="<?=$this->deploy_prefix?>/account/password">Password</a>
                </div>
            </div>
        </div>

        <div class="account-content-layout">
            <div class="account-content">
                <div class="form-layout">
                    <div class="form">
                        <form method="post" onsubmit="return accountEditVerify()">
                            <input type="hidden" name="post" readonly value="edit-account">
                            <?php if (!$this->verify_error) { ?>
                                <div class="form-field">
                                    <span title="Enter your email">Email<span class="form-field-required"> *</span></span>
                                    <input id="input_email" type="email" name="email" autocomplete="off" required value="<?=$this->user_email?>" placeholder="example@example.com" title="Enter your email">
                                    <span id="error_email" class="form-error-message hidden"></span>
                                </div>

                                <div class="form-field">
                                    <span title="Phone number must start with +">Phone number</span>
                                    <input id="input_phone" type="text" name="phone" autocomplete="off" placeholder="+420 777204045" value="<?=$this->user_phone?>" title="Phone number must start with +">
                                    <span id="error_phone" class="form-error-message hidden"></span>
                                </div>
                                <?php } else { ?>

                                <div class="form-field">
                                    <span title="Enter your email">Email<span class="form-field-required"> *</span></span>
                                    <input id="input_email" type="email" name="email" autocomplete="off" required value="<?=$this->old_email?>" title="Enter your email">
                                    <span id="error_email" class="form-error-message"><?=$this->log_email?></span>
                                </div>

                                <div class="form-field">
                                    <span title="Phone number must start with +">Phone number</span>
                                    <input id="input_phone" type="text" name="phone" autocomplete="off" value="<?=$this->old_phone?>" title="Phone number must start with +">
                                    <span id="error_phone" class="form-error-message"><?=$this->log_phone?></span>
                                </div>
                            <?php } ?>

                            <div class="form-submit">
                                <input type="submit" value="Edit" class="form-button">
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

</body>
</html>