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
    ["MTF"] = {
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
        ["Name"] = "A.R.C.",
        ["Alpha"] = "Anomaly. Research. Center.",
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
      },
      ["02"] = {
        ["ID"] = "02",
        ["Name"] = "A.M.T.F.",
        ["Alpha"] = "Anti. Mingebag. Task. Force.",
        ["Deprecated"] = false,
        ["County"] = {}
      }
    }
  },
  ["CallSign"] = {
    ["WHITEHSE"] = {
      ["ID"] = "WHITEHSE",
      ["Code"] = "White House",
      ["PresOf"] = "United States Of America"
    },
    ["TEB_101 "] = {
      ["ID"] = "TEB_101",
      ["Code"] = "TheEndBoss_101",
      ["PresOf"] = "Emergency Alert System"
    },
    ["MOBENIX "] = {
      ["ID"] = "MOB",
      ["Code"] = "MOBENIX",
      ["PresOf"] = "A.R.C."
    },
    ["MILO    "] = {
      ["ID"] = "MILO",
      ["Code"] = "Milo",
      ["PresOf"] = "A.M.T.F."
    },
    ["FLUFFY  "] = {
      ["ID"] = "FLUFFY",
      ["Code"] = "Fluffy",
      ["PresOf"] = ""
    },
    ["CACHE   "] = {
      ["ID"] = "CACHE",
      ["Code"] = "Cache",
      ["PresOf"] = ""
    }
  }
}

function EAS_MakeGobals(ORG, EEE, PSSCCC, HHMM, LLLLLLLL)
  
  print(LLLLLLLL)

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
  SameMessage = "The " ..ORG.. " Has isshued the following WIP for " ..EAS_DATA_FIPS_SubDiv_P.. " " ..EAS_DATA_FIPS_Codes_SS_Name.. ", " ..EAS_DATA_FIPS_Codes_SS_County_CCC_Name
end
--EAS_MakeGobals("PEP", "EEE", "PSSCCC", "HHMM", "TEB_101")

if CLIENT then
ReturnedHTML = ""
LastReturnedHTML = "1"
ReturnedHTML2 = ""
LastReturnedHTML2 = "1"
URL = "https://theendboss-101.github.io/EAS/EAS/Send.html"

function checkdata()
	http.Fetch(URL,
		function( body, length, headers, code )
			ReturnedHTML = body
			if ReturnedHTML == LastReturnedHTML then
				if true then end
			else
        local ReturnedHTMLBody = string.match(ReturnedHTML, "EAS EVENT: (.*)")
        local SAMEHeader = string.match(ReturnedHTMLBody, "(.+)<br>")
        local Transcript = string.match(ReturnedHTMLBody, "Transcript: (.*)")
        local SAMEHeader_ORG = string.sub(SAMEHeader, 1, 3)
        local SAMEHeader_EEE = string.sub(SAMEHeader, 5, 7)
        local SAMEHeader_PSSCCC = string.sub(SAMEHeader, 9, 14)
        local SAMEHeader_HHMM = string.sub(SAMEHeader, 16, 19)
        local SAMEHeader_LLLLLLLL_Pt1 = string.sub(SAMEHeader, 21, 28)
        local SAMEHeader_LLLLLLLL = SAMEHeader_LLLLLLLL_Pt1 .. string.rep(" ", 8 - SAMEHeader_LLLLLLLL_Pt1:len())
        EAS_MakeGobals(SAMEHeader_ORG, SAMEHeader_EEE, SAMEHeader_PSSCCC, SAMEHeader_HHMM, SAMEHeader_LLLLLLLL)
        chat.AddText(Color(255,74,74), "Same Header: ", Color(150,255,255), SAMEHeader)
        chat.AddText(Color(255,74,74), "EAS EVENT: ", Color(150,255,255), SameMessage)
        chat.AddText(Color(255,74,74), "Transcript: ", Color(150,255,255), Transcript)
				chat.PlaySound()
				LastReturnedHTML = ReturnedHTML
			end
		end
	)
  --[[function(message)
		print(message)
	end--]]
end

timer.Create("EAS_FETCH_HTML", 15, 0, checkdata)
end
concommand.Add("cgm13d_eas_checkdata",checkdata)