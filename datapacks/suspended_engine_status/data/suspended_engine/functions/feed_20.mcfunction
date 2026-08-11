scoreboard players add @s engine_power 20
execute if score @s engine_power > #max engine_power run scoreboard players operation @s engine_power = #max engine_power
tellraw @s {"text":"[Engine] +20 power","color":"green"}
