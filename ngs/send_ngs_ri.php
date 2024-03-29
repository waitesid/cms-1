<?php
/**
 * @package cms
 * @link    http://www.cmsvt.com
 * @author  s waite <stephen.waite@cmsvt.com>
 * @copyright Copyright (c) 2024 cms <stephen.waite@cmsvt.com>
 * @license https://github.com/openemr/openemr/blob/master/LICENSE GNU General Public License 3
 */

use phpseclib3\Net\SFTP;

require_once(dirname(__FILE__) . '/../vendor/autoload.php');

$cms_user = getenv('NGS_RI_USERNAME');
$cms_pass = getenv('NGS_RI_PASSWORD');
$sftp = new SFTP('edi.ngs.ahdsxhub.com', 10062);
if (!$sftp->login($cms_user, $cms_pass)) {
    echo "failed to login to ngs, exiting...\n";
    exit;
}

try {
    $sftp->uploadFile($argv[1], "/" . $argv[1]);
    echo "file uploaded to ngs via sftp \n";
} catch (Exception $e) {
    echo $e->getMessage() . "\n";
}
