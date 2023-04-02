fx_version 'cerulean'
game 'gta5'

name "mtc-moneywash"
description "Money wash for qbcore or qbox"
author "More Then Code"
version "0"

lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
    '@qb-core/shared/locale.lua',
	'locale/nl.lua',
	'shared/*.lua'
}

client_scripts {
	'client/ped.lua',
	'client/enter.lua',
	'client/main.lua',
	'client/zones.lua',
}

server_scripts {
	'server/*.lua'
}
