# --- ARC ISSUE ---  

=== TABEL INFO ===  

Emergency Alert System Garry's Mod Add-On  

By: TheEndBoss_101  

For: A.R.C. & The GM13B Community  

Purpace: To provide up to date detals about Events, Wars, Etc... at a seconds notice  

With support from:  

>    1. Xalalau  

Thank you all for helping me make this Garry's Mod Addon.  
  
## Adminstrators:  

### These are people with aucess to the EAS System  

| User | ORG | CallSign |
| ----------- | ----------- | ----------- |
| TheEndBoss_101 | PEP | TEB_101 |
| Mobinix | ARC | MOB |
| Milo | MTF | MILO |
| Fluffy | CIV | FLUFFY |
| Cache99 | CIV | CACHE |

## Nameing:  

>    1. No Dashes, Underscores, Spaces.  

## Name Order:  

>   1. EAS (Top Level)
>   2. DATA (Tabel Containg EAS Keys)
>       1. Key = Key Codes
>           1. USA-Type
>           2. CAN/MEX-Type
>           3. Event-Type
>       2. Originator
>       3. Event codes
>       4. FIPS
>           1. SubDiv (Value of "P")
>               1. 0 = Entire US
>               2. 1 = North West
>               3. 2 = North
>               4. 3 = North East
>               5. 4 = West
>               6. 5 = Central
>               7. 6 = East
>               8. 7 = South West
>               9. 8 = South
>               10. 9 = South East
>           2. State Code (Value of "SS")
>               1. 01 = A.R.C.
>               2. ETC ...
>           3. County (Value of "CCC")
>               1. 000 = Entire State
>               2. 001 = ### County (Basted On State Code)
>               3. ETC ...
>   3. Recive = Function controling what happens when a EAS message comes thrugh from a server to a client.
>   4. MakeGobals = Function that makes/updates gobal values