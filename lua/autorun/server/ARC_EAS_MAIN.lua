--[[
  === TABEL NAMEING CONVENTION ===
  Emergency Alert System Garry's Mod Add-On
  By: TheEndBoss_101
  With support from:
    1. Xalalau
    2. Zauro
  Thank you for helping me make this Garry's Mod Addon.
  For: A.R.C. & The GM13B Community
  Purpace: To provide up to date detals about Events, Wars, Etc... at a seconds notice
  
  Adminstrators:
  -- These are people with PEP aucess to the EAS System.
  -- The data in the () are values transmitted with there batch files.
  -- ORG: the org code.
  -- LLLLLLLL: There call sign.
    1. TheEndBoss_101 (ORG: PEP, LLLLLLLL: TEB_101)
    2. Mobinix (ORG: ARC, LLLLLLLL: MOBINIX)
    3. Milo (ORG: AMTF, LLLLLLLL: MILO)
    4. Fluffy (ORG: CIV,LLLLLLLL: FLUFFY)
  Nameing: 
    1. No Underscores/Spaces.
    2. 
  Name Order:
    1. EAS (Top Level)
    2. DATA (Tabel Containg EAS Values)
      2A. Key = Key codes
        2AA. USA-Type
        2AB. CAN/MEX-Type
        2AC. Event-Type
      2B. Originator
      2C. Event codes
      2D. FIPS
        2DA. SubDiv (Value of "P")
          2DAA. 0 = Entire US
          2DAB. 1 = North West
          2DAC. 2 = North
          2DAD. 3 = North East
          2DAE. 4 = West
          2DAF. 5 = Central
          2DAG. 6 = East
          2DAH. 7 = South West
          2DAI. 8 = South
          2DAJ. 9 = South East
        2DB. State Code (Value of "SS")
          2DBA. 01 = Alabama
          Etc...
          2DBB. County (Value of "CCC")
            2DBBA. 000 = Entire State
            2DBBB. 001 = Autauga County
            Etc...
    3. Recive = Function controling what happens when a EAS message comes thrugh from a server to a client.
    4. MakeGobals = Function that makes/updates gobal values
]]

EAS_DEVMODE = true

EAS_DATA = {
  ["Key"] = {
    ["USA-Type"] = {
      ["M"] = "Mandatory code",
      ["O1"] = "Original optional code",
      ["O2"] = "2002 optional code",
      ["O3"] = "2017 optional code",
      ["NI"] = "NI"
    },
    ["CAN/MEX-Type"] = {
      ["AB"] = "Administrative bulletin",
      ["CI"] = "Currently implemented",
      ["RT"] = "Required test",
      ["FI"] = "For future implementation",
      ["NI"] = "Not implemented",
      ["TS"] = "Testing for Implementation"
    },
    ["Event-Type"] = {
      ["ADV"] = "Advisory",
      ["WCH"] = "Watch",
      ["WRN"] = "Warning",
      ["TEST"] = "Test"
    }
  },
  ["Originator"] = {
    ["PEP"] = {
      ["ID"] = "PEP",
      ["Code"] = "Primary Entry Point",
      ["Deprecated"] = false
    },
    ["CIV"] = {
      ["ID"] = "CIV",
      ["Code"] = "Civil authorities",
      ["Deprecated"] = false
    },
    ["WXR"] = {
      ["ID"] = "WXR",
      ["Code"] = "National Weather Service",
      ["Deprecated"] = false
    },
    ["EAS"] = {
      ["ID"] = "EAS",
      ["Code"] = "EAS Participant",
      ["Deprecated"] = false
    },
    ["EAN"] = {
      ["ID"] = "EAN",
      ["Code"] = "Emergency Action Notification Network",
      ["Deprecated"] = true
    },
    --Custom \/
    ["ARC"] = {
      ["ID"] = "ARC",
      ["Code"] = "Annomly Research Center",
      ["Deprecated"] = false
    },
    ["AMTF"] = {
      ["ID"] = "AMTF",
      ["Code"] = "Anti Mingebag Task Force",
      ["Deprecated"] = false
    },
    ["AMRC"] = {
      ["ID"] = "AMRC",
      ["Code"] = "Anti Mingebag Research Center",
      ["Deprecated"] = false
    }
  },
  ["Events"] = {
    
  },
  ["FIPS"] = {
    ["SubDiv"] = {
      ["0"] = "Entire",
      ["1"] = "North West",
      ["2"] = "North",
      ["3"] = "North East",
      ["4"] = "West",
      ["5"] = "Central",
      ["6"] = "East",
      ["7"] = "South West",
      ["8"] = "South",
      ["9"] = "South East",
    },
    ["Codes"] = {
      ["01"] = {
        ["ID"] = "01",
        ["Name"] = "Alabama",
        ["Alpha"] = "AL",
        ["Deprecated"] = false,
        ["County"] = {
          ["001"] = {
            ["ID"] = "001",
            ["Class"] = "H1",
            ["Name"] = "Autauga County",
            ["Deprecated"] = false
          },
          ["003"] = {
            ["ID"] = "003",
            ["Class"] = "H1",
            ["Name"] = "Baldwin County",
            ["Deprecated"] = false
          }
        }
      }
    }
  },
  ["CallSign"] = {
    ["WHITEHSE"] = {
      ["ID"] = "WHITEHSE",
      ["Code"] = "White House",
      ["PresOf"] = "United States Of America"
    },
    ["TEB_101"] = {
      ["ID"] = "TEB_101",
      ["Code"] = "TheEndBoss_101",
      ["PresOf"] = "Emergency Alert System"
    }
  }
}

function EAS_MakeGobals(ORG, EEE, PSSCCC, HHMM, LLLLLLLL)
  
  P = string.sub(PSSCCC, 1, 1)
  SS = string.sub(PSSCCC, 2, 3)
  CCC = string.sub(PSSCCC, -3)
  HH = string.sub(HHMM, 1, 2)
  MM = string.sub(HHMM, 3, 4)
  
  EAS_DATA_Originator = EAS_DATA["Originator"]
    EAS_DATA_Originator_ORG = EAS_DATA_Originator[ORG]
      EAS_DATA_Originator_ORG_ID = EAS_DATA_Originator_ORG["ID"]
      EAS_DATA_Originator_ORG_Code = EAS_DATA_Originator_ORG["Code"]
      EAS_DATA_Originator_ORG_Deprecated = EAS_DATA_Originator_ORG["Deprecated"]
  EAS_DATA_Events = EAS_DATA["Events"]
  EAS_DATA_FIPS = EAS_DATA["FIPS"]
    EAS_DATA_FIPS_SubDiv = EAS_DATA_FIPS["SubDiv"]
    EAS_DATA_FIPS_SubDiv_P = EAS_DATA_FIPS_SubDiv[P]
    if EAS_DATA_FIPS_SubDiv_P == nil then
      print("EAS_WARNING: '" ..P.. "' is not found! In 'EAS_DATA_FIPS_SubDiv_P'!")
      print("Setting EAS_DATA_FIPS_SubDiv_P to '0'!")
      EAS_DATA_FIPS_SubDiv_P = EAS_DATA_FIPS_SubDiv["0"]
      print("")
    end
    EAS_DATA_FIPS_Codes = EAS_DATA_FIPS["Codes"]
      EAS_DATA_FIPS_Codes_SS = EAS_DATA_FIPS_Codes[SS]
      if EAS_DATA_FIPS_Codes_SS == nil then
        print("EAS_WARNING: '" ..SS.. "' is not found! In 'EAS_DATA_FIPS_Codes_SS'!")
        print("Setting EAS_DATA_FIPS_Codes_SS to '00'!")
        EAS_DATA_FIPS_Codes_SS = EAS_DATA_FIPS_Codes["01"]
        print("")
      end
        EAS_DATA_FIPS_Codes_SS_ID = EAS_DATA_FIPS_Codes_SS["ID"]
        EAS_DATA_FIPS_Codes_SS_Name = EAS_DATA_FIPS_Codes_SS["Name"]
        EAS_DATA_FIPS_Codes_SS_Alpha = EAS_DATA_FIPS_Codes_SS["Alpha"]
        EAS_DATA_FIPS_Codes_SS_Deprecated = EAS_DATA_FIPS_Codes_SS["Deprecated"]
          EAS_DATA_FIPS_Codes_SS_County = EAS_DATA_FIPS_Codes_SS["County"]
            EAS_DATA_FIPS_Codes_SS_County_CCC = EAS_DATA_FIPS_Codes_SS_County[CCC]
            if EAS_DATA_FIPS_Codes_SS_County_CCC == nil then
              print("EAS_WARNING: '" ..CCC.. "' is not found! In 'EAS_DATA_FIPS_Codes_SS_County_CCC'!")
              print("Setting EAS_DATA_FIPS_Codes_SS_County_CCC to '000'!")
              EAS_DATA_FIPS_Codes_SS_County_CCC = "000"
              print("")
            end
            if EAS_DATA_FIPS_Codes_SS_County_CCC == "000" or EAS_DATA_FIPS_Codes_SS_County_CCC == nil then
              EAS_DATA_FIPS_Codes_SS_County_CCC_ID = "000"
              EAS_DATA_FIPS_Codes_SS_County_CCC_Class = ""
              EAS_DATA_FIPS_Codes_SS_County_CCC_Name = "Entire"
              EAS_DATA_FIPS_Codes_SS_County_CCC_Deprecated = false
            else
              EAS_DATA_FIPS_Codes_SS_County_CCC_ID = EAS_DATA_FIPS_Codes_SS_County_CCC["ID"]
              EAS_DATA_FIPS_Codes_SS_County_CCC_Class = EAS_DATA_FIPS_Codes_SS_County_CCC["Class"]
              EAS_DATA_FIPS_Codes_SS_County_CCC_Name = EAS_DATA_FIPS_Codes_SS_County_CCC["Name"]
              EAS_DATA_FIPS_Codes_SS_County_CCC_Deprecated = EAS_DATA_FIPS_Codes_SS_County_CCC["Deprecated"]
            end
  EAS_DATA_CallSign = EAS_DATA["CallSign"]
    EAS_DATA_CallSign_LLLLLLLL = EAS_DATA_CallSign[LLLLLLLL]
    if EAS_DATA_FIPS_Codes_SS_County_CCC == nil then
      print("EAS_WARNING: '" ..EAS_DATA_FIPS_Codes_SS_County_CCC.. "' is not found! In 'EAS_DATA_FIPS_Codes_SS_County_CCC'!")
      print("Setting EAS_DATA_FIPS_Codes_SS_County_CCC to 'WHITEHSE'!")
      EAS_DATA_CallSign_LLLLLLLL = "WHITEHSE"
      print("")
    end
      EAS_DATA_CallSign_LLLLLLLL_ID = EAS_DATA_CallSign_LLLLLLLL["ID"]
      EAS_DATA_CallSign_LLLLLLLL_Code = EAS_DATA_CallSign_LLLLLLLL["Code"]
      EAS_DATA_CallSign_LLLLLLLL_PresOf = EAS_DATA_CallSign_LLLLLLLL["PresOf"]
  
  if EAS_DEVMODE then
    print("EAS_DATA:")
    print("  Key:")
    print("    Wip.")
    print("  Originator:")
    print("    ID: " ..EAS_DATA_Originator_ORG_ID)
    print("    Code: " ..EAS_DATA_Originator_ORG_Code)
    print("    Deprecated: " ..tostring(EAS_DATA_Originator_ORG_Deprecated))
    print("  Events:")
    print("    Wip.")
    print("  FIPS:")
    print("    SubDiv" ..EAS_DATA_FIPS_SubDiv_P)
    print("    Codes:")
    print("      SS:")
    print("        ID: " ..EAS_DATA_FIPS_Codes_SS_ID)
    print("        Name: " ..EAS_DATA_FIPS_Codes_SS_Name)
    print("        Alpha: " ..EAS_DATA_FIPS_Codes_SS_Alpha)
    print("        Deprecated: " ..tostring(EAS_DATA_FIPS_Codes_SS_Deprecated))
    print("        County:")
    print("          ID: " ..EAS_DATA_FIPS_Codes_SS_County_CCC_ID)
    print("          Class: " ..EAS_DATA_FIPS_Codes_SS_County_CCC_Class)
    print("          Name: " ..EAS_DATA_FIPS_Codes_SS_County_CCC_Name)
    print("          Deprecated: " ..tostring(EAS_DATA_FIPS_Codes_SS_County_CCC_Deprecated))
    print("  CallSign:")
    print("    ID: " ..EAS_DATA_CallSign_LLLLLLLL_ID)
    print("    Code: " ..EAS_DATA_CallSign_LLLLLLLL_Code)
    print("    PresOf: " ..EAS_DATA_CallSign_LLLLLLLL_PresOf)
  end
  
end
EAS_MakeGobals("PEP", "EEE", "PSSCCC", "HHMM", "TEB_101")

