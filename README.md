# TwitchCubieBot
Twitch Bot focusing on aggregating votes and averages from Twitch chat

---
# Explanation
When the bot has started, it will start listening to chat messages in the channel listed in the settings.txt file. All messages will be parsed, and votes and numbers will be stored for 3 minutes after the messages comes in.
If at some point someone decides to calculate a vote or average, the information from the last 3 minutes will be used. <b>This means it is not needed to start a vote or average in advance</b> Note that if one user sends multiple votes or multiple values, newer values will override the older ones, so everyone only has one vote.

**Note that this bot now has a new version with a GUI: [TwitchCubieBotGUI](https://github.com/CubieDev/TwitchCubieBotGUI)**

---
# Voting
Commands:
<pre>
<b>!vote</b>
</pre>
This command will decide the winner between votes.
<pre>
<b>!vote numbers</b>
</pre>
This command will decide the winner between numbers.
<pre>
<b>!vote emotes</b>
</pre>
This command will decide the winner between emotes.

Valid votes (for A) include:
* A
* AAAAA
* A A A
* A Please
* All of the above, but with lower case a

Invalid votes include:
* I would really like that
* D I A L

Any single letter can be a vote.

---

# Averaging
Command:
<pre>
<b>!average</b>
</pre>
This command will average (median) all numbers sent in the last `LookbackTime` seconds. See [Settings](#settings) for information on how to configure `LookbackTime`.

---
# Examples

The logging and chat output when `!vote` was typed by someone with the appropriate rank:
<pre>
<b>B won with 74.24%.</b>
</pre>
The logging and chat output when `!vote numbers` was typed by someone with the appropriate rank:
<pre>
<b>3.0 won with 84.72%.</b>
</pre>

The logging and chat output when `!average` was typed by someone with the appropriate rank:
<pre>
<b>The average is 67.38.</b>
</pre>

---

# Settings
This bot is controlled by a settings.txt file, which looks like:
```
{
    "Host": "irc.chat.twitch.tv",
    "Port": 6667,
    "Channel": "#<channel>",
    "Nickname": "<name>",
    "Authentication": "oauth:<auth>",
    "DeniedUsers": [
        "streamelements",
        "marbiebot",
        "moobot"
    ],
    "AllowedRanks": [
        "broadcaster",
        "moderator"
    ],
    "AllowedPeople": [],
    "LookbackTime": 30
}
```

| **Parameter**        | **Meaning** | **Example** |
| -------------------- | ----------- | ----------- |
| Host                 | The URL that will be used. Do not change.                         | "irc.chat.twitch.tv" |
| Port                 | The Port that will be used. Do not change.                        | 6667 |
| Channel              | The Channel that will be connected to.                            | "#CubieDev" |
| Nickname             | The Username of the bot account.                                  | "CubieB0T" |
| Authentication       | The OAuth token for the bot account.                              | "oauth:pivogip8ybletucqdz4pkhag6itbax" |
| DeniedUsers     | List of (bot) names who's messages will not be included in voting and averages. | ["streamelements", "marbiebot", "moobot"] |
| AllowedRanks  | List of ranks required to be able to perform the commands. | ["broadcaster", "moderator"] |
| AllowedPeople | List of users who, even if they don't have the right ranks, will be allowed to perform the commands. | ["cubiedev"] |
| LookbackTime | The amount of seconds the bot looks back for votes/numbers/emotes. | 30 |

*Note that the example OAuth token is not an actual token, but merely a generated string to give an indication what it might look like.*

I got my real OAuth token from https://twitchapps.com/tmi/.

---

# Requirements
* [Python 3.6+](https://www.python.org/downloads/)
* [Module requirements](requirements.txt)<br>
Install these modules using `pip install -r requirements.txt`

Among these modules is my own [TwitchWebsocket](https://github.com/CubieDev/TwitchWebsocket) wrapper, which makes making a Twitch chat bot a lot easier.
This repository can be seen as an implementation using this wrapper.

---

# Other Twitch Bots

* [TwitchMarkovChain](https://github.com/CubieDev/TwitchMarkovChain)
* [TwitchAIDungeon](https://github.com/CubieDev/TwitchAIDungeon)
* [TwitchGoogleTranslate](https://github.com/CubieDev/TwitchGoogleTranslate)
* [TwitchCubieBotGUI](https://github.com/CubieDev/TwitchCubieBotGUI)
* [TwitchCubieBot](https://github.com/CubieDev/TwitchCubieBot)
* [TwitchRandomRecipe](https://github.com/CubieDev/TwitchRandomRecipe)
* [TwitchUrbanDictionary](https://github.com/CubieDev/TwitchUrbanDictionary)
* [TwitchRhymeBot](https://github.com/CubieDev/TwitchRhymeBot)
* [TwitchWeather](https://github.com/CubieDev/TwitchWeather)
* [TwitchDeathCounter](https://github.com/CubieDev/TwitchDeathCounter)
* [TwitchSuggestDinner](https://github.com/CubieDev/TwitchSuggestDinner)
* [TwitchPickUser](https://github.com/CubieDev/TwitchPickUser)
* [TwitchSaveMessages](https://github.com/CubieDev/TwitchSaveMessages)
* [TwitchMMLevelPickerGUI](https://github.com/CubieDev/TwitchMMLevelPickerGUI) (Mario Maker 2 specific bot)
* [TwitchMMLevelQueueGUI](https://github.com/CubieDev/TwitchMMLevelQueueGUI) (Mario Maker 2 specific bot)
* [TwitchPackCounter](https://github.com/CubieDev/TwitchPackCounter) (Streamer specific bot)
* [TwitchDialCheck](https://github.com/CubieDev/TwitchDialCheck) (Streamer specific bot)
* [TwitchSendMessage](https://github.com/CubieDev/TwitchSendMessage) (Meant for debugging purposes)

