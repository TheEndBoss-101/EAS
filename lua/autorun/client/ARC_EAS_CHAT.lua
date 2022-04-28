ReturnedHTML = ""
LastReturnedHTML = "1"
ReturnedHTML2 = ""
LastReturnedHTML2 = "1"
URL = ""

function checkdata()
	http.Fetch(URL,
		function( body, length, headers, code )
			ReturnedHTML = body
			if ReturnedHTML == LastReturnedHTML then
				if true then end
			else
				chat.AddText(Color(150,255,150), "EAS EVENT: ", Color(150,255,255), ReturnedHTML)
				chat.PlaySound()
				LastReturnedHTML = ReturnedHTML
			end
		end
	)
end

timer.Create("EAS_FETCH_HTML", 15, 0, checkdata)