oldManAssignment:
    type: assignment
    actions:
        on assignment:
        - trigger name: click state:true
        - trigger name:chat state:true
        - trigger name:proximity state:false
    interact scripts:
    - oldManInteract

# make different versions of chat with different colors for different characters

oldManInteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - lookclose true range:10 realistic
                - narrate format:cchat "<white>Hello. Wow, we haven't had any new travellers come through here since our town's transformation. What might your name be, young traveller?"
                - wait 5s
                - title "subtitle:<green>Dillon the Cautious Adventurer" stay:3s targets:<server.online_players>
                - wait 5s
                - title "subtitle:<gray>or" stay:2s targets:<server.online_players>
                - wait 3s
                - title "subtitle:<blue>Sierra the Legendary Knight" stay:3s targets:<server.online_players>
                - wait 5s
                - narrate "[Type <blue>Sierra <gray>or <green>Dillon<gray>]"
                - flag player introduced
            chat trigger:
                1:
                    trigger: /Yes/
                    script:
                    - narrate "nice to meet you Sierra!"
                2:
                    trigger: /no/ the Cautious Adventurer shall be your name!
                    script:
                    - narrate "Its nice to meet you Dillon!"


introduction:
    type: task
    script:
    - if <player.has_flag[introduced]>
        - narrate format:cchat "I'm glad the formalities are out of the way, since our town is in desperate need of help..."
        