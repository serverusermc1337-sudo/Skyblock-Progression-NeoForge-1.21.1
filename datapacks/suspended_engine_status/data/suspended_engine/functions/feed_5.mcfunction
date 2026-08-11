scoreboard players add @s engine_power 5
execute if score @s engine_power > #max engine_power run scoreboard players operation @s engine_power = #max engine_power
tellraw @s {"text":"[Engine] +5 power","color":"green"}
