scoreboard objectives add engine_power dummy "Engine Power"
scoreboard objectives add engine_timer dummy
scoreboard players set #max engine_power 100
scoreboard players set #stable engine_power 40
scoreboard players set #critical engine_power 15
tellraw @a {"text":"[Suspended Engine] Status systems loaded.","color":"aqua"}
