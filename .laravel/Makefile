

make:
	@make vendor

composer.phar:
	curl -sS https://getcomposer.org/installer | php

vendor: composer.phar
	php composer.phar install
