tag @s add armored_elytra.elytra
scoreboard players set #found_chestplate armEly.dummy 0
execute align xyz as @e[type=minecraft:item,dx=0,dy=0,dz=0,sort=nearest] if items entity @s contents #armored_elytra:chestplates run function armored_elytra:try_to_armor_elytra
tag @s remove armored_elytra.elytra