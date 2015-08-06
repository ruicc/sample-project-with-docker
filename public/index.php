<?php

# xhprof
xhprof_enable();
$foo = strlen('heyhey');
$profile = xhprof_disable();

echo '<pre>';
    print_r($profile);

    # curl
    $ch = curl_init('http://httpbin.org/get');
    curl_exec($ch);
    curl_close($ch);
echo '</pre>';

phpinfo();
