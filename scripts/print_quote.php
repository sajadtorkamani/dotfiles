<?php
#!/usr/bin/env php

$quotes = [
    'We are all going to die.',
    "Love yourself first because that's who you'll be spending the rest of your life with."
];

echo $quotes[array_rand($quotes)];
