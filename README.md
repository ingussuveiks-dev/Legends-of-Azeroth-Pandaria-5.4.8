# Legends of Azeroth Pandaria 5.4.8

World of Warcraft Mists of Pandaria emulator core for client build `5.4.8.18414`.

This project is based on SkyFire/TrinityCore-style server architecture and builds the usual `authserver`, `worldserver`, database tools, and map extraction tools.

## Requirements

### Windows

- Windows 10/11 x64
- Visual Studio 2022 Community with `Desktop development with C++`
- Windows SDK 10.0.22621 or newer
- CMake 3.27 or newer
- Boost 1.85 x64 for MSVC 14.3/14.4
- MySQL 5.7 or MySQL 8.x
- OpenSSL 1.1.1 or OpenSSL 3.x

Tested local Windows layout:

```txt
Boost:   C:/local/boost_1_85_0
MySQL:   C:/wamp64/bin/mysql/mysql5.7.44
OpenSSL: C:/Program Files/OpenSSL-Win64
```

### Linux

- GCC 13+ or Clang 12+
- CMake 3.27+
- Boost 1.81+
- MySQL 5.7/8.x or MariaDB-compatible server
- OpenSSL 1.1.1 or 3.x

## Configure and Build on Windows

The repository includes a CMake preset for a Wampserver-style Windows setup:

```powershell
cmake --preset windows-wamp-vs2022
cmake --build --preset windows-wamp-vs2022-relwithdebinfo
```

Or open the generated solution:

```txt
Build/Legends-of-Azeroth-Pandaria-5.4.8.sln
```

Recommended Visual Studio build configuration:

```txt
RelWithDebInfo x64
```

The built executables will be in:

```txt
Build/bin/RelWithDebInfo
```

Important executables:

```txt
authserver.exe
worldserver.exe
mapextractor.exe
vmap4extractor.exe
vmap4assembler.exe
mmaps_generator.exe
```

## OpenSSL 3 Legacy Provider

For OpenSSL 3, the server needs the OpenSSL legacy provider because MoP authentication still uses RC4 through `AuthCrypt`.

If you use OpenSSL 3, copy this file:

```txt
C:/Program Files/OpenSSL-Win64/bin/legacy.dll
```

next to the server executables:

```txt
Build/bin/RelWithDebInfo/legacy.dll
```

Without this file, `worldserver.exe` can crash when a client connects to the realm. The crash stack usually points to:

```txt
Trinity::Crypto::ARC4::ARC4
AuthCrypt::AuthCrypt
WorldSocket::WorldSocket
```

Also keep these DLLs next to the executables:

```txt
libcrypto-3-x64.dll
libssl-3-x64.dll
libmysql.dll
```

## Database Setup

Create the base databases:

```sql
CREATE DATABASE auth DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE characters DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE world DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE acore_playerbots DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
```

Import the base SQL files:

```txt
sql/base/auth.sql
sql/base/characters.sql
sql/base/world_548_20240722.sql
```

Then import relevant updates from:

```txt
sql/updates
modules/mod_playerbots/data/sql
```

Playerbots uses its own database. The runtime config should point to it:

```ini
PlayerbotsDatabaseInfo = "127.0.0.1;3306;user;password;acore_playerbots"
PlayerbotsDatabase.WorkerThreads = 1
PlayerbotsDatabase.SynchThreads = 1
```

## Configuration Files

Copy or keep the generated config files next to the executables:

```txt
authserver.conf
worldserver.conf
playerbots.conf
```

Useful local settings:

```ini
DataDir = "."
RealmID = 1
WorldServerPort = 8085
BindIP = "0.0.0.0"
Console.Enable = 0
Warden.Enabled = 0
```

`Console.Enable = 0` is useful when running `worldserver.exe` in the background. If you launch it manually in a visible terminal and want console commands, set it to `1`.

For a local server, set the realm address in the `auth.realmlist` table:

```sql
UPDATE auth.realmlist
SET address = '127.0.0.1',
    localAddress = '127.0.0.1',
    localSubnetMask = '255.255.255.0',
    port = 8085,
    gamebuild = 18414
WHERE id = 1;
```

## Extracting Client Data

The server needs client data extracted from a clean World of Warcraft `5.4.8.18414` client:

```txt
dbc
maps
vmaps
mmaps
```

Build the project with `TOOLS=ON`, then copy or use:

```txt
extract_548_18414_maps_vmaps_mmaps.bat
```

Put the `.bat` file in the root of the WoW client folder and run it there. Before running, edit these paths inside the file if your project is not in the default local path:

```bat
set "TOOLS_DIR=C:\wamp64\www\Legends-of-Azeroth-Pandaria-5.4.8\Build\bin\RelWithDebInfo"
set "SERVER_DIR=C:\wamp64\www\Legends-of-Azeroth-Pandaria-5.4.8\Build\bin\RelWithDebInfo"
```

For build `5.4.8.18414`, the extractor uses:

```bat
set "TARGET_BUILD=18273"
```

This is expected for this extractor and client data layout.

## Running the Server

Start MySQL first, then run:

```txt
Build/bin/RelWithDebInfo/authserver.exe
Build/bin/RelWithDebInfo/worldserver.exe
```

Ports:

```txt
authserver:  3724
worldserver: 8085
```

Create an account from the `worldserver` console:

```txt
account create Admin password
account set gmlevel Admin 3 -1
account set addon Admin 4
```

For a local client, set `WTF/Config.wtf`:

```txt
SET realmlist "127.0.0.1"
SET portal "127.0.0.1"
```

## Playerbots

Playerbots are included, but still experimental. They may cause crashes or gameplay issues depending on database state and config.

Required file:

```txt
Build/bin/RelWithDebInfo/playerbots.conf
```

Basic enable/disable options:

```ini
AiPlayerbot.Enabled = 1
AiPlayerbot.RandomBotAutologin = 1
```

For debugging, disable them:

```ini
AiPlayerbot.Enabled = 0
AiPlayerbot.RandomBotAutologin = 0
```

The first playerbots startup can take longer because random bot accounts and characters are prepared.

## Troubleshooting

If the client reaches realm selection but disconnects when selecting the realm:

- Check that `worldserver.exe` is still running.
- Check that port `8085` is listening.
- If using OpenSSL 3, make sure `legacy.dll` is next to `worldserver.exe`.
- Check `Build/bin/RelWithDebInfo/Logs/Server.log`.
- Check crash reports in `Build/bin/RelWithDebInfo/Crashes`.

PowerShell checks:

```powershell
Get-Process authserver,worldserver -ErrorAction SilentlyContinue
Get-NetTCPConnection -LocalPort 3724,8085 -ErrorAction SilentlyContinue
```

If `authserver.exe` says port `3724` is already in use, another `authserver` instance is already running:

```powershell
taskkill /F /IM authserver.exe
```

## License

GPL-2.0. See [COPYING.md](COPYING.md).

## Authors and Contributors

See [THANKS.md](THANKS.md).

## Build Status

[![windows-build](https://github.com/Legends-of-Azeroth/Legends-of-Azeroth-Pandaria-5.4.8/actions/workflows/windows-build-release.yml/badge.svg?branch=master)](https://github.com/Legends-of-Azeroth/Legends-of-Azeroth-Pandaria-5.4.8/actions/workflows/windows-build-release.yml)
[![linux-gcc-build](https://github.com/Legends-of-Azeroth/Legends-of-Azeroth-Pandaria-5.4.8/actions/workflows/linux_gcc.yml/badge.svg?branch=master)](https://github.com/Legends-of-Azeroth/Legends-of-Azeroth-Pandaria-5.4.8/actions/workflows/linux_gcc.yml)

<a href="https://scan.coverity.com/projects/legends-of-azeroth-mop">
  <img alt="Coverity Scan Build Status" src="https://scan.coverity.com/projects/26941/badge.svg"/>
</a>
