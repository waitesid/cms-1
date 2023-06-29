<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit393577e5b6b4fe402c02b2be459a3aac
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'PHPMailer\\PHPMailer\\' => 20,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'PHPMailer\\PHPMailer\\' => 
        array (
            0 => __DIR__ . '/..' . '/phpmailer/phpmailer/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit393577e5b6b4fe402c02b2be459a3aac::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit393577e5b6b4fe402c02b2be459a3aac::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit393577e5b6b4fe402c02b2be459a3aac::$classMap;

        }, null, ClassLoader::class);
    }
}