Config = {}
QBCore = exports['qb-core']:GetCoreObject()
Config.debug = false

Config.multiplier = 0.99

Config.price = {
    min = 1000,
    max = 1500
}

Config.npc = {
    coords = vector4(1197.1242675781, -3253.3552246094, 6.0951871871948, 100.58631896973),
    model = "U_M_Y_FIBMugger_01",
    scenario = "WORLD_HUMAN_STAND_MOBILE"
}

Config.shell = vector3(1137.9044189453, -3198.8818359375, -39.665725708008)

Config.zones = {{
    name = "money_exit",
    coords = vector3(1138.13, -3199.77, -39.67),
    length = 1.2,
    width = 1.0,
    heading = 270,
    minZ = -42.27,
    maxZ = -38.27,

    options = {{
        label = Lang:t('targets.exit'),
        icon = "fas fa-door-open",
        action = function()
            CreateThread(function()
                DoScreenFadeOut(1000)
                Wait(1000)
                SetEntityCoords(PlayerPedId(), Config.npc.coords - 1)
                TriggerEvent('InteractSound_CL:PlayOnOne', 'houses_door_open', 1)
                Wait(1000)
                DoScreenFadeIn(1000)
            end)
        end
    }}
}, {
    name = "money_wash",
    coords = vector3(1124.54, -3193.76, -40.39),
    length = 6.2,
    width = 1.0,
    heading = 270,
    minZ = -43.19,
    maxZ = -39.19,
    options = {{
        item = "markedbills",
        label = Lang:t('targets.wash'),
        icon = "fas fa-money-bill-wave",
        action = function()
            WashMoney()
        end,
    }}
}, {
    name = "money_dry",
    coords = vector3(1129.99, -3198.37, -40.4),
    length = 9.0,
    width = 2.0,
    heading = 270,
    minZ = -43.19,
    maxZ = -39.19,

    options = {{
        label = Lang:t('targets.dry'),
        icon = "fas fa-money-bill-wave",
        item = "wet_money_roll",
        action = function()
            DryMoney()
        end
    }}
}, {
    name = "money_print",
    coords = vector3(1117.7, -3198.06, -40.4),
    length = 2.7,
    width = 2.0,
    heading = 271,
    minZ = -44.0,
    maxZ = -40.0,

    options = {{
        label = Lang:t('targets.print'),
        icon = "fas fa-money-bill-wave",
        item = "dry_money_roll",
        action = function()
            PrintMoney()
        end
    }}
}}
