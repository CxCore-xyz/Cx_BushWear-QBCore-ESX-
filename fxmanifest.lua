fx_version 'cerulean'
games { 'gta5' }

shared_script {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua'
}

client_script {
    'client/*.lua',
    'client/functions/*.lua'
}

server_script {
    'server/*.lua'
}