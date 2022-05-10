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
    }
  },
  ["Events"] = {
    ["???"] = {
      ["ID"] = "???",
      ["USA-Type"] = "",
      ["CAN-Type"] = "",
      ["MEX-Type"] = "",
      ["Description"] = "Unrecognized Event",
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
        ["Name"] = "Alabama",
        ["Alpha"] = "AL",
        ["Class"] = "H1",
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
    }
  },
  ["CallSign"] = {
    ["WHITEHSE"] = {
      ["ID"] = "WHITEHSE",
      ["Code"] = "White House",
      ["PresOf"] = "United States Of America"
    }
  }
}

function EAS_MakeGlobals(ORG, EEE, PSSCCC, HHMM, LLLLLLLL)

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
        EAS_DATA_FIPS_Codes_SS_Class = EAS_DATA_FIPS_Codes_SS["Class"]
        EAS_DATA_FIPS_Codes_SS_Deprecated = EAS_DATA_FIPS_Codes_SS["Deprecated"]
          EAS_DATA_FIPS_Codes_SS_County = EAS_DATA_FIPS_Codes_SS["County"]
            EAS_DATA_FIPS_Codes_SS_County_CCC = EAS_DATA_FIPS_Codes_SS_County[CCC]
            if EAS_DATA_FIPS_Codes_SS_County_CCC == nil and CCC ~= "000" then
              print("EAS_WARNING: '" ..CCC.. "' is not found! In 'EAS_DATA_FIPS_Codes_SS_County_CCC'!")
              print("Setting EAS_DATA_FIPS_Codes_SS_County_CCC to '000'!")
              EAS_DATA_FIPS_Codes_SS_County_CCC = EAS_DATA_FIPS_Codes_SS_County["000"]
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
      print("EAS_WARNING: '" ..LLLLLLLL.. "' is not found! In 'EAS_DATA_CallSign_LLLLLLLL'!")
      print("Setting EAS_DATA_CallSign_LLLLLLLL to 'WHITEHSE'!")
      EAS_DATA_CallSign_LLLLLLLL = EAS_DATA_CallSign["WHITEHSE"]
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
    print("        Class: " ..EAS_DATA_FIPS_Codes_SS_Class)
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
end

if CLIENT then
ReturnedHTML = ""
LastReturnedHTML = "1"
ReturnedHTML2 = ""
LastReturnedHTML2 = "1"
URL = "https://theendboss-101.github.io/EAS/EAS/Send.html"

function EAS_CHECK_XML()
  URL = "https://theendboss-101.github.io/EAS/EAS/Send.xml"
  http.Fetch(URL,
    function(body, length, headers, code)
      ReturnedHTML = body
		  if ReturnedHTML == LastReturnedHTML then
			  if true then end
		  else
        local EAS_XML_Alert = string.match(body, "<alert>(.*)</alert>")
        local EAS_XML_Org = string.match(EAS_XML_Alert, "<org>(.+)</org>")
        local EAS_XML_Event = string.match(EAS_XML_Alert, "<event>(.+)</event>")
        local EAS_XML_PSSCCC = string.match(EAS_XML_Alert, "<pssccc>(.+)</pssccc>")
        local EAS_XML_PSSCCC_P = string.match(EAS_XML_Alert, "<p>(.+)</p>")
        local EAS_XML_PSSCCC_SS = string.match(EAS_XML_Alert, "<ss>(.+)</ss>")
        local EAS_XML_PSSCCC_CCC = string.match(EAS_XML_Alert, "<ccc>(.+)</ccc>")
        local EAS_XML_PSSCCC_Full = EAS_XML_PSSCCC_P .. EAS_XML_PSSCCC_SS .. EAS_XML_PSSCCC_CCC
        local EAS_XML_HHMM = string.match(EAS_XML_Alert, "<hhmm>(.+)</hhmm>")
        local EAS_XML_LLLLLLLL = string.match(EAS_XML_Alert, "<llllllll>(.+)</llllllll>")
        --local EAS_XML_LLLLLLLL_Fill = EAS_XML_LLLLLLLL .. string.rep(" ", 8 - EAS_XML_LLLLLLLL:len())
        local EAS_XML_SAME_HEADER = EAS_XML_Org.. "-" ..EAS_XML_Event.. "-" ..EAS_XML_PSSCCC_Full.. "-" ..EAS_XML_HHMM.. "-" ..EAS_XML_LLLLLLLL_Fill
        local EAS_XML_Message = string.match(EAS_XML_Alert, "<message>(.+)</message>")
        --EAS_MakeGlobals(EAS_XML_Org, EAS_XML_Event, EAS_XML_PSSCCC_Full, EAS_XML_HHMM, EAS_XML_LLLLLLLL_Fill)
        EAS_MakeGlobals(EAS_XML_Org, EAS_XML_Event, EAS_XML_PSSCCC_Full, EAS_XML_HHMM, EAS_XML_LLLLLLLL)
        EAS_MakeMessage()
        --Make Send Message.
        chat.AddText(Color(255,74,74), "Same Header: ", Color(150,255,255), EAS_XML_SAME_HEADER, "\n")
        chat.AddText(Color(255,74,74), "EAS EVENT: ", Color(150,255,255), Same_Message, "\n")
        if EAS_DATA_Events_EEE_Level == "TEST" then
          chat.AddText(Color(255,74,74), "TEST: ", Color(150,255,255), "THIS IS A TEST OF THE EAS SYSTEM AND IS ONLY A TEST.", "\n")
        end
        chat.AddText(Color(255,74,74), "Transcript: ", Color(150,255,255), EAS_XML_Message, "\n")
        chat.PlaySound()
        LastReturnedHTML = ReturnedHTML
      end
    end
  )
end
concommand.Add("eas_check_xml", EAS_CHECK_XML)
timer.Create("EAS_CHECK_XML", 15, 0, EAS_CHECK_XML)
chat.AddText(Color(255,74,74), "WARNING: ", Color(150,255,255), "Ignore Above.")
end