<?php
use phpseclib3\Net\SFTP;

require_once(dirname(__FILE__) . '/../vendor/autoload.php');

try {
    $cms_user = getenv('RRB_USERNAME');
    $cms_pass = getenv('RRB_PASSWORD');
    $sftp = new SFTP("edi.palmetto.ahdsxhub.com");
    if (!$sftp->login($cms_user, $cms_pass)) {
        echo "login failed" . "\n";
        exit;
    };
    $remote_dir = "/outbox/EZComm/BC/1.0/Notify/";
    $file_to_upload = $argv[1];
    $sftp->put($remote_dir . $file_to_upload, $file_to_upload, SFTP::SOURCE_LOCAL_FILE);
    echo "file uploaded to rrb via sftp \n";
} catch (Exception $e) {
    echo $e->getMessage() . "\n";
}
