<?php
/**
 * Created by PhpStorm.
 * User: Li Ning
 * Date: 2018/6/12
 * Time: 14:46
 */
function getRandChar($num)
{
    $randStr = 'abcdefghijklmnopqrstuvwxyz123456789ABCDEFGHIJKLMNPQRSTUVWXYZ';
    $max = strlen($randStr) - 1;
    $returnStr = '';
    for ($i = 0; $i < $num; $i++) {
        $returnStr .= $randStr[rand(0, $max)];
    }
    return $returnStr;
}

function isPositiveInteger($value)
{
    if (is_numeric($value) && is_integer($value + 0) && (($value + 0) > 0)) {
        return true;
    } else {
        return false;
    }
}
