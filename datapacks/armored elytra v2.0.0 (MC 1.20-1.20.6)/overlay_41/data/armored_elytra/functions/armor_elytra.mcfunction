data modify entity @s Item.components.minecraft:bundle_contents append from entity @s Item
data modify entity @s Item.components.minecraft:bundle_contents prepend from entity @e[type=minecraft:item,tag=armored_elytra.chestplate,distance=..2,limit=1] Item
data modify entity @s PickupDelay set value 0s
execute if items entity @e[type=minecraft:item,tag=armored_elytra.chestplate,distance=..2,limit=1] contents minecraft:netherite_chestplate run item modify entity @s contents armored_elytra:armor/netherite
execute if items entity @e[type=minecraft:item,tag=armored_elytra.chestplate,distance=..2,limit=1] contents minecraft:diamond_chestplate run item modify entity @s contents armored_elytra:armor/diamond
execute if items entity @e[type=minecraft:item,tag=armored_elytra.chestplate,distance=..2,limit=1] contents minecraft:iron_chestplate run item modify entity @s contents armored_elytra:armor/iron
execute if items entity @e[type=minecraft:item,tag=armored_elytra.chestplate,distance=..2,limit=1] contents minecraft:golden_chestplate run item modify entity @s contents armored_elytra:armor/gold
execute if items entity @e[type=minecraft:item,tag=armored_elytra.chestplate,distance=..2,limit=1] contents minecraft:chainmail_chestplate run item modify entity @s contents armored_elytra:armor/chain
execute if items entity @e[type=minecraft:item,tag=armored_elytra.chestplate,distance=..2,limit=1] contents minecraft:leather_chestplate run item modify entity @s contents armored_elytra:armor/leather
execute store success score #success armEly.dummy if items entity @e[type=minecraft:item,tag=armored_elytra.chestplate,distance=..2,limit=1] contents *[minecraft:custom_name]
execute if score #success armEly.dummy matches 1 run item modify entity @s contents armored_elytra:named_lore
execute unless score #success armEly.dummy matches 1 run item modify entity @s contents armored_elytra:lore
execute store result score #elytraValue armEly.dummy run data get entity @s Item.components.minecraft:repair_cost
data modify storage armored_elytra:storage enchantments set value []
function armored_elytra:parse_enchantments/start with entity @s Item.components.minecraft:enchantments
data modify storage armored_elytra:storage elytraEnch set from storage armored_elytra:storage enchantments
execute as @e[type=minecraft:item,tag=armored_elytra.chestplate,distance=..2,limit=1] run function armored_elytra:store_chestplate_values
execute store result entity @s Item.components.minecraft:repair_cost int 1 run scoreboard players operation #elytraValue armEly.dummy += #chestplateValue armEly.dummy
function armored_elytra:merge_enchantments/start
kill @e[type=minecraft:item,tag=armored_elytra.chestplate,distance=..2,limit=1]
playsound minecraft:block.anvil.use block @a