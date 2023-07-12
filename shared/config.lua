Config = {}

Config.Item = 'rentdocument'

Config.Rent = {
    ["rent1"] = {
        --TARGET
        ped = 'a_m_m_og_boss_01',
        pedcoords = vector3(430.24, 3474.44, 34.56),
        pedheading = 37.6,
        label = 'Open rent',
        distance = 3.5, 
        icon = 'fas fa-car',
        --BLIP
        sprite = 225,
        scale = 0.7,
        color = 3,
        text = 'Rent A Car',
        --CONTEXT
        title = 'Rent a Car',
        vehicles = {
            {
                title = 'Futo',
                icon = 'fas fa-car',
                description = 'Price : 250',
                event = 'spawncar',
                arrow = true,
                image = 'https://cdn.discordapp.com/attachments/954465466435403826/1127885708200263780/Futo-GTAVe-front.webp',
                args = {model = 'futo', price = 250, spawncoords = vector3(433.68, 3480.04, 34.64), spawnheading = 289.08, account = 'money'}
            },
            {
                title = 'Blista',
                icon = 'fas fa-car',
                description = 'Price : 350',
                event = 'spawncar',
                arrow = true,
                image = 'https://cdn.discordapp.com/attachments/954465466435403826/1127887154589212722/Blista-GTAV-front.webp',
                args = {model = 'blista', price = 350, spawncoords = vector3(433.68, 3480.04, 34.64), spawnheading = 289.08, account = 'money'}
            }
        }
    },
}
