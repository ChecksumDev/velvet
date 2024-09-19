# Removes all scores required by the datapack

schedule clear real_clock:tick
schedule clear real_clock:second

scoreboard objectives remove rc_displayBar
scoreboard objectives remove rc_display
scoreboard objectives remove rc_seconds
scoreboard objectives remove rc_hours
