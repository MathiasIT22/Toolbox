
# Windows Powershell Toolbox

Panite meile kodutööks teha PowerShell toolbox

## Authors

- mina (Mathias Salla IT22)


## Scriptid

Enable HyperV \
Ühe nupuvajutusega lülitab sisse HyperV Feature, nõuab W11/10 Pro editionit

VMQuickCreate \
Loob tühja VMI sinu valitud sättetega

Process Killer \
Loetleb käivad protsessid ning neid saab vajadusel tappa

Static IP \
Kiiraken, et saaksid seadistada staatilise IP

Audio Test \
Eesmärgiks on testida kõlareid, teeb piiksu vajutades kõva häälega

Ping Test \
Pingib 8.8.8.8, et näha kas netiühendus on olemas välismaailmaga

Remove Bloat \
Eemaldab nimekirja asju, mida peetakse mõtetuks ning kasutuks

Disable Cortana \
Eemaldab Registrist Cortana asjad, nagu Cortana ise, Cortana oskus otsingumootorit kasutada ning Voice Recognition

PC Name \
Saad kiirelt seadme nime vahetada

IPLocator \
Saad sisestada IP aadressi, ning väljastab info teatud aadressi kohta

Darkmode ON/OFF \
Vahetab systemi värviskeemi valge ja musta vahel

No Sleep \
Ei lase arvutil Hibernate mode minna

Telemetry? \
Lubab/Keelab telemeetria kasutuse seadmes

Blue? \
Muudab Toolboxi värvi siniseks, kui punane silmadele hakkab

UTC Time \
Muutab ajatsooni UTC-ks 

Rippmenüü Seadme sulgemise valikutega

Eraldi aken kuhu saab scripte kirjutada ning need väljastade CLI-seadistada

CLI Info (ei saanud aru mis siit nõutakse) printib teksti mis sisestate aknasse CLI-ssse 

System Info näitab infot seadme kohta


## Installation

laed alla powershell folderi ning paigutad kuhu soovid


Avad powershelli administraatorina (Windows + X) ning teed jargnevad asjad:
```py
cd C:\Users\SinuNimi\Asukoht\Toolbox-main
```
```py
.\mathiastoolbox2.3.ps1
```
## Kui ExecutePolicyga probleeme siis proovi seda:
```py
Set-ExecutionPolicy RemoteSigned -Scope Process
```
## Screenshots

![App pilt](https://cdn.discordapp.com/attachments/1037428610862170182/1251689352954646781/image.png?ex=666f7e0d&is=666e2c8d&hm=27779384e3a65f53a303455d43061c9c5f572305dd0aa12ee381ce4ce14da4ea&)
