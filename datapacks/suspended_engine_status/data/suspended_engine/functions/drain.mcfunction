execute as @a unless score @s engine_power matches 0 run scoreboard players remove @s engine_power 1
execute as @a if score @s engine_power matches ..0 run scoreboard players set @s engine_power 0
