EAS_DEVMODE = true 
function EAS_DEVMODE_Toggle()
  if EAS_DEVMODE then
    EAS_DEVMODE = false 
    print("DEVMODE: OFF")
  else
    EAS_DEVMODE = true 
    print("DEVMODE: ON")
  end
end
concommand.Add("cgm13d_eas_devmode_toggle", EAS_DEVMODE_Toggle)

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
    ["EAS"] = {
      ["ID"] = "EAS",
      ["Code"] = "EAS Participant",
      ["Deprecated"] = false
    },
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
    ["???"] = {
      ["ID"] = "DMO",
      ["USA-Type"] = "O2",
      ["CAN-Type"] = "CI",
      ["MEX-Type"] = "NI",
      ["Description"] = "Unrecognized Event",
      ["Level"] = "ADV",
      ["Deprecated"] = false
    },
    ["DMO"] = {
      ["ID"] = "DMO",
      ["USA-Type"] = "O1",
      ["CAN-Type"] = "AB",
      ["MEX-Type"] = "NI",
      ["Description"] = "Practice/Demo Warning",
      ["Level"] = "TEST",
      ["Deprecated"] = false
    },
    ["RMT"] = {
      ["ID"] = "RMT",
      ["USA-Type"] = "M",
      ["CAN-Type"] = "RT",
      ["MEX-Type"] = "NI",
      ["Description"] = "Required Monthly Test",
      ["Level"] = "TEST",
      ["Deprecated"] = false
    },
    ["RWT"] = {
      ["ID"] = "RWT",
      ["USA-Type"] = "M",
      ["CAN-Type"] = "RT",
      ["MEX-Type"] = "CI",
      ["Description"] = "Required Weekly Test",
      ["Level"] = "TEST",
      ["Deprecated"] = false
    },
    ["RDT"] = {
      ["ID"] = "RDT",
      ["USA-Type"] = "M",
      ["CAN-Type"] = "RI",
      ["MEX-Type"] = "NI",
      ["Description"] = "Required Daily Test",
      ["Level"] = "TEST",
      ["Deprecated"] = false
    }
  },
  ["FIPS"] = {
    ["SubDiv"] = {
      ["0"] = "the entire",
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
    EAS_DATA_Events_EEE = EAS_DATA_Events[EEE]
    if EAS_DATA_Events_EEE == nil then
      print("EAS_WARNING: '" ..EEE.. "' is not found! In 'EAS_DATA_Events_EEE'!")
      print("Setting EAS_DATA_Events_EEE to '???'!")
      EAS_DATA_Events_EEE = EAS_DATA_Events["???"]
      print("")
    end
      EAS_DATA_Events_EEE_ID = EAS_DATA_Events_EEE["ID"]
      EAS_DATA_Events_EEE_USA_Type = EAS_DATA_Events_EEE["USA-Type"]
      EAS_DATA_Events_EEE_CAN_Type = EAS_DATA_Events_EEE["CAN-Type"]
      EAS_DATA_Events_EEE_MEX_Type = EAS_DATA_Events_EEE["MEX-Type"]
      EAS_DATA_Events_EEE_Description = EAS_DATA_Events_EEE["Description"]
      EAS_DATA_Events_EEE_Level = EAS_DATA_Events_EEE["Level"]
      EAS_DATA_Events_EEE_Deprecated = EAS_DATA_Events_EEE["Deprecated"]
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
            if EAS_DATA_FIPS_Codes_SS_County_CCC == nil and CCC ~= "000" then
              print("EAS_WARNING: '" ..CCC.. "' is not found! In 'EAS_DATA_FIPS_Codes_SS_County_CCC'!")
              print("Setting EAS_DATA_FIPS_Codes_SS_County_CCC to '000'!")
              EAS_DATA_FIPS_Codes_SS_County_CCC = "000"
              print("")
            end
            if EAS_DATA_FIPS_Codes_SS_County_CCC == "000" or EAS_DATA_FIPS_Codes_SS_County_CCC == nil then
              EAS_DATA_FIPS_Codes_SS_County_CCC_ID = "000"
              EAS_DATA_FIPS_Codes_SS_County_CCC_Class = ""
              EAS_DATA_FIPS_Codes_SS_County_CCC_Name = ""
              EAS_DATA_FIPS_Codes_SS_County_CCC_Deprecated = false
            else
              EAS_DATA_FIPS_Codes_SS_County_CCC_ID = EAS_DATA_FIPS_Codes_SS_County_CCC["ID"]
              EAS_DATA_FIPS_Codes_SS_County_CCC_Class = EAS_DATA_FIPS_Codes_SS_County_CCC["Class"]
              EAS_DATA_FIPS_Codes_SS_County_CCC_Name = EAS_DATA_FIPS_Codes_SS_County_CCC["Name"]
              EAS_DATA_FIPS_Codes_SS_County_CCC_Deprecated = EAS_DATA_FIPS_Codes_SS_County_CCC["Deprecated"]
            end
  EAS_DATA_CallSign = EAS_DATA["CallSign"]
    EAS_DATA_CallSign_LLLLLLLL = EAS_DATA_CallSign[LLLLLLLL]
    if EAS_DATA_CallSign_LLLLLLLL == nil then
      print("EAS_WARNING: '" ..EAS_DATA_CallSign_LLLLLLLL.. "' is not found! In 'EAS_DATA_CallSign_LLLLLLLL'!")
      print("Setting EAS_DATA_CallSign_LLLLLLLL to 'WHITEHSE'!")
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
    print("    ID: " ..EAS_DATA_Events_EEE_ID)
    print("    UAS-Type: " ..EAS_DATA_Events_EEE_USA_Type)
    print("    CAN-Type: " ..EAS_DATA_Events_EEE_CAN_Type)
    print("    MEX-Type: " ..EAS_DATA_Events_EEE_MEX_Type)
    print("    Description: " ..EAS_DATA_Events_EEE_Description)
    print("    Level: " ..EAS_DATA_Events_EEE_Level)
    print("    Deprecated: " ..tostring(EAS_DATA_Events_EEE_Deprecated))
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
function EAS_MakeMessage()
  if EAS_DATA_FIPS_Codes_SS_County_CCC_ID == "000" then
    Same_Message_PSSCCC = EAS_DATA_FIPS_SubDiv_P.. " " ..EAS_DATA_FIPS_Codes_SS_Name.. ", " ..EAS_DATA_FIPS_Codes_SS_County_CCC_Name.. ""
  else
    Same_Message_PSSCCC = EAS_DATA_FIPS_SubDiv_P.. " " ..EAS_DATA_FIPS_Codes_SS_Name.. ""
  end
  if EAS_DATA_Events_EEE_Level == "TEST" then
    Same_Message = "The " ..EAS_DATA_Originator_ORG_Code.. " Has isshued the following " ..EAS_DATA_Events_EEE_Description.." for " ..Same_Message_PSSCCC.. "\nTHIS IS A TEST AND ONLY A TEST!"
  else
    Same_Message = "The " ..EAS_DATA_Originator_ORG_Code.. " Has isshued the following " ..EAS_DATA_Events_EEE_Description.." for " ..Same_Message_PSSCCC.. ""
  end
end

if CLIENT then
ReturnedHTML = ""
LastReturnedHTML = "1"
ReturnedHTML2 = ""
LastReturnedHTML2 = "1"
URL = "https://theendboss-101.github.io/EAS/EAS/Send.html"

function EAS_CheckData()
	http.Fetch(URL,
		function( body, length, headers, code )
			ReturnedHTML = body
			if ReturnedHTML == LastReturnedHTML then
				if true then end
			else
        local ReturnedHTMLBody = string.match(ReturnedHTML, "EAS EVENT: (.*)")
        local SAMEHeader = string.match(ReturnedHTMLBody, "(.+)<br>")
        Transcript = string.match(ReturnedHTMLBody, "Transcript: (.*)")
        local SAMEHeader_ORG = string.sub(SAMEHeader, 1, 3)
        local SAMEHeader_EEE = string.sub(SAMEHeader, 5, 7)
        local SAMEHeader_PSSCCC = string.sub(SAMEHeader, 9, 14)
        local SAMEHeader_HHMM = string.sub(SAMEHeader, 16, 19)
        local SAMEHeader_LLLLLLLL_Pt1 = string.sub(SAMEHeader, 21, 28)
        local SAMEHeader_LLLLLLLL = SAMEHeader_LLLLLLLL_Pt1 .. string.rep(" ", 8 - SAMEHeader_LLLLLLLL_Pt1:len())
        EAS_MakeGobals(SAMEHeader_ORG, SAMEHeader_EEE, SAMEHeader_PSSCCC, SAMEHeader_HHMM, SAMEHeader_LLLLLLLL)
        EAS_MakeMessage()
        chat.AddText(Color(255,74,74), "Same Header: ", Color(150,255,255), SAMEHeader)
        chat.AddText(Color(255,74,74), "EAS EVENT: ", Color(150,255,255), Same_Message)
        if Same_Test then
          chat.AddText(Color(255,74,74), "TEST: ", Color(150,255,255), "THIS IS A TEST OF THE EAS SYSTEM AND IS ONLY A TEST.")
        end
        chat.AddText(Color(255,74,74), "Transcript: ", Color(150,255,255), Transcript)
				chat.PlaySound()
				LastReturnedHTML = ReturnedHTML
			end
		end
	)
end

timer.Create("EAS_FETCH_HTML", 15, 0, EAS_CheckData)
chat.AddText(Color(255,74,74), "WARNING: ", Color(150,255,255), "Ignore Above.")
concommand.Add("cgm13d_eas_checkdata", EAS_CheckData)

function EAS_testsys()
  	http.Fetch(URL,
		function( body, length, headers, code )
			ReturnedHTML = body
      local ReturnedHTMLBody = string.match(ReturnedHTML, "EAS EVENT: (.*)")
      local SAMEHeader = string.match(ReturnedHTMLBody, "(.+)<br>")
      Transcript = string.match(ReturnedHTMLBody, "Transcript: (.*)")
      local SAMEHeader_ORG = string.sub(SAMEHeader, 1, 3)
      local SAMEHeader_EEE = string.sub(SAMEHeader, 5, 7)
      local SAMEHeader_PSSCCC = string.sub(SAMEHeader, 9, 14)
      local SAMEHeader_HHMM = string.sub(SAMEHeader, 16, 19)
      local SAMEHeader_LLLLLLLL_Pt1 = string.sub(SAMEHeader, 21, 28)
      local SAMEHeader_LLLLLLLL = SAMEHeader_LLLLLLLL_Pt1 .. string.rep(" ", 8 - SAMEHeader_LLLLLLLL_Pt1:len())
      EAS_MakeGobals(SAMEHeader_ORG, SAMEHeader_EEE, SAMEHeader_PSSCCC, SAMEHeader_HHMM, SAMEHeader_LLLLLLLL)
      EAS_MakeMessage()
      MsgC(Color(255,74,74), "Same Header: ", Color(150,255,255), SAMEHeader, "\n")
      MsgC(Color(255,74,74), "EAS EVENT: ", Color(150,255,255), Same_Message, "\n")
      if Same_Test then
        MsgC(Color(255,74,74), "TEST: ", Color(150,255,255), "THIS IS A TEST OF THE EAS SYSTEM AND IS ONLY A TEST.", "\n")
      end
      MsgC(Color(255,74,74), "Transcript: ", Color(150,255,255), Transcript, "\n")
			chat.PlaySound()
		end
  )
end

concommand.Add("cgm13d_eas_testsys", EAS_testsys)
end