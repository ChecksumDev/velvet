#legAnimations
execute if entity @s[type=armor_stand,tag=ftf.rightLegPos] run scoreboard players add @s ftf.rightLegPos 12
execute if entity @s[type=armor_stand,tag=!ftf.rightLegPos] run scoreboard players remove @s ftf.rightLegPos 12
execute if score @s ftf.rightLegPos matches ..-30 run tag @s add ftf.rightLegPos
execute if score @s ftf.rightLegPos matches 30.. run tag @s remove ftf.rightLegPos
execute as @s[type=armor_stand,tag=ftf.leftLegPos] run scoreboard players remove @s ftf.leftLegPos 12
execute as @s[type=armor_stand,tag=!ftf.leftLegPos] run scoreboard players add @s ftf.leftLegPos 12
execute if score @s ftf.leftLegPos matches ..-30 run tag @s remove ftf.leftLegPos
execute if score @s ftf.leftLegPos matches 30.. run tag @s add ftf.leftLegPos
execute store result entity @s Pose.RightArm[0] float 1 run scoreboard players get @s ftf.rightLegPos
execute store result entity @s Pose.LeftArm[0] float 1 run scoreboard players get @s ftf.leftLegPos

#armAnimations
execute as @e[type=armor_stand,tag=body,tag=seen,distance=..2] store result entity @s Pose.RightArm[0] float 1 run scoreboard players get @e[tag=legs,limit=1] ftf.leftLegPos
execute as @e[type=armor_stand,tag=body,tag=seen,distance=..2] store result entity @s Pose.LeftArm[0] float 1 run scoreboard players get @e[tag=legs,limit=1] ftf.rightLegPos

#fixOffsetHead
execute as @e[type=armor_stand,tag=headRotation,tag=seen,distance=..2] run data merge entity @s {Air:1}

#fixOffsetNameTag
execute as @e[type=armor_stand,tag=nameTagEntity,distance=..2] run data merge entity @s {Air:1}