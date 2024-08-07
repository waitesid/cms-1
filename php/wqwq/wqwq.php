<?php
$USER = getenv("USER");
$filepath = "/home/" . $USER;
include $filepath . "/src/cms/vendor/autoload.php";

$pdf = new Cezpdf('LETTER');
$pdf->ezSetMargins(170, 0, 10, 0);
$pdf->selectFont('Courier');
$page_count = 0;
$continued = false;
$is_continued = false;
$was_continued = false;
$line_count = 0;
$old_body = '';
$total_line_count = 0;

$content = file_get_contents($argv[1]);
$pages = explode("\014", $content); // form feeds separate pages
foreach ($pages as $page) {
    $line_count = 0;
    $page_count++;

    $page_lines = explode("\012", $page);
    $page_lines_count = count($page_lines);

    $was_continued = $is_continued;

    if (!strpos($page, "CONTINUED")) {
        $is_continued = false;
    } else {
        $is_continued = true;
    }

    $header = '';
    for ($i = 0; $i < 5; $i++) {
        $header .= $page_lines[$i] ?? '';
    }

    $body = '';
    for ($i = 5; $i < ($page_lines_count - 4); $i++) {
        $body .= $page_lines[$i];
        $line_count++;
    }

    $footer = '';
    for ($i = ($page_lines_count - 3); $i < $page_lines_count; $i++) {
        if (empty($page_lines[$i])) {
            $footer .= "\r\n";
        }
        $footer .= $page_lines[$i] ?? '' . "\r";
    }
    //error_log($footer);

    if (!$is_continued && !$was_continued) {
        printHeader($header, $pdf);
        printBody($body, $pdf);
        printFooter($footer, $pdf);
        $total_line_count = 0;
    }

    if ($is_continued && !$was_continued) {
        $old_body = $body;
        $total_line_count += $line_count;
    }

    if (!$is_continued && $was_continued) {
        $total_line_count += $line_count;
        $first_page_is_continued = true;
        if ($total_line_count < 37) {
            $old_body .= $body;
            printHeader($header, $pdf);
            printBody($old_body, $pdf);
            printFooter($footer, $pdf);
            $old_body = '';
            $total_line_count = 0;
        } else {
            printHeader($header, $pdf);
            printBody($old_body, $pdf);
            printFooter($footer, $pdf);
            printHeader($header, $pdf);
            $body = "\r" . $body ;
            printBody($body, $pdf);
            printFooter($footer, $pdf);
            $old_body = '';
            $total_line_count = 0;
        }
    }

    if ($is_continued && $was_continued) {
        $total_line_count += $line_count;
        if ($total_line_count < 41) {
            $old_body .= $body;
        } else {
            printHeader($header, $pdf);
            printBody($old_body, $pdf);
            printFooter($footer, $pdf);
            $old_body = "\r" . $body ;
            $total_line_count = $line_count;
        }
    }
}

function printHeader($header, $pdf) {
    global $argv;
    global $page_count;
    global $first_page_is_continued;
    global $was_continued;
    if ($page_count > 1 || $was_continued) {
      $pdf->ezNewPage();
    }
    $pdf->ezSetY($pdf->ez['pageHeight'] - $pdf->ez['topMargin']);
    $pdf->addPngFromFile($argv[2], 0, 0, 612, 792);
    $pdf->ezText($header, 12, array(
        'justification' => 'left',
        'leading' => 12
    ));
}

function printBody($content, $pdf) {
    $pdf->ezSetY($pdf->ez['pageHeight'] - $pdf->ez['topMargin'] - 140);
    $pdf->ezText($content, 12, array(
        'justification' => 'left',
        'leading' => 12
    ));
}

function printFooter($footer, $pdf) {
    $pdf->ezSetY($pdf->ez['pageHeight'] - $pdf->ez['topMargin'] - 570);
    $pdf->ezText($footer, 12, array(
        'justification' => 'left',
        'leading' => 12
    ));
}

$fname = tempnam('/tmp', 'PDF');
file_put_contents($fname, $pdf->ezOutput());
$command = "cp $fname ./bill.pdf";
exec($command);

exit();

