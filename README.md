# Public Deathmatch
# Discord: https://discord.gg/pAmYkWQxJ7



This repo contains files for a simple Deathmatch server.

Contains simple features like RageUI menus to select what weapon you want, and where you want to spawn every time you die.

Currently it is using base GTA weapons, however if you know what you are doing with guns you can easily add them in and add them to the menus yourself.

At the moment I have only put 2 locations down as a base to guide people on how to add locations they want with multiple spawn points



# Setup Guide

If you have never setup a FiveM server before, please watch a video on how you do that and come back here when you are finished

Step 1:
```
Clone the files into your FiveM server's resources folder
```
Step 2:
```
Move the contents of the server.cfg to your own one.
```
**PS- Fill out the mysql string aswell [Click me](https://github.com/pachxl/deathmatch-public/blob/51e0f8c6a3cf71101b87bcf529e20bc4c27a540f/server.cfg#L1)**


Step 3:
```
You will need to configure some stuff, in the configs folder (core/config),
Look in server_cfg.lua for the important stuff.
```

Step 4:
```
Now you should be able to start your server without any issues. 
If you find any bugs or have any suggestions please reach out in the Official Discord
```



# Features Coming Soon
```
1. Anti cheat
2. Admin menu
3. More default guns
4. Configurable Blip system
5. Hitsounds
6. More settings for players.
7. Private Lobbies
```




# Ban System

The current ban system only allows for manual bans through the database. But this system will be overhauled in the near future. Feel free to implement your own and make a PR!


