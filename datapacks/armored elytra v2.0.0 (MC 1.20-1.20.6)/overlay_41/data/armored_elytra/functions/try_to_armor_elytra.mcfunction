execute if score #found_chestplate armEly.dummy matches 1 run return 0
scoreboard players set #found_chestplate armEly.dummy 1
tag @s add armored_elytra.chestplate
execute as @e[type=minecraft:item,tag=armored_elytra.elytra,dx=0,dy=0,dz=0,limit=1] at @s run function armored_elytra:armor_elytra
tag @s remove armored_elytra.chestplate