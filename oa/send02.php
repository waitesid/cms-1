<?php

use phpseclib3\Net\SFTP;

require_once(dirname(__FILE__) . '/../vendor/autoload.php');

try {
    $cms_user = getenv('OA_USERNAME');
    $cms_pass = getenv('OA_PASSWORD');
    $sftp = new SFTP('ftp10.officeally.com');

    if (!$sftp->login($cms_user, $cms_pass)) {
        echo "login failed" . "\n";
        exit;
    };

    $date = new DateTimeImmutable();
    $stamp = $date->format('YmdHis');

    $remote_file_path = "/inbound/" . $argv[1] . "-" . $stamp . ".txt";
    $file_to_upload = $argv[1];
    $sftp->put($remote_file_path, $file_to_upload, SFTP::SOURCE_LOCAL_FILE);
    echo "file uploaded to oa via sftp \n";
    copy($argv[1], $argv[1] . "-" . $stamp . ".txt");
} catch (Exception $e) {
    echo $e->getMessage() . "\n";
}
