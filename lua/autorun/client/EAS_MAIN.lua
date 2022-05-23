--[[ EAS-REALISTIC ]]--
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