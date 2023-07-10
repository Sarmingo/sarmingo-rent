fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'
author 'Sarmingo'
description 'Simple rent system for esx using ox lib and ox target, easy configurable'

shared_scripts{
    'shared/*.lua',
    '@ox_lib/init.lua',
    '@es_extended/imports.lua'
}

server_scripts{
'server/*.lua'
}

client_scripts{
'client/*.lua'
}