alert("WARNING: HIGHLY EXPERMENTAL!")
console.log("V: 4.0")

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const loadStates = async () => {
	return await (await fetch("https://raw.githubusercontent.com/TheEndBoss-101/EAS/main/ControlPanel/d78ba61ca26d60aac42ce0ad1a0905134487263c/state.json")).json();
};

const loadCounties = async () => {
	return await (await fetch("https://raw.githubusercontent.com/TheEndBoss-101/EAS/main/ControlPanel/d78ba61ca26d60aac42ce0ad1a0905134487263c/county.json")).json();
};

let states, counties;

(async () => {
	try {
		states = await loadStates();
		counties = await loadCounties();
		
		$("#state").innerHTML = "<option value=\"00\">Entire nation</option>";
		Object.keys(states).forEach((id) => {
			const o = document.createElement('option');
			o.value = id;
			o.innerText = states[id];
			$("#state").appendChild(o);
		});
		
		updateCounties();
	} catch(e) {
		alert(`Failed to load states and counties. ${e}`)
	}
	
	// generate();
})();

function updateCounties() {
	$("#county").innerHTML = "<option value=\"000\">Entire state</option>";
	Object.keys(counties[$("#state").value] || []).forEach((id) => {
		const o = document.createElement('option');
		o.value = id;
		o.innerText = counties[$("#state").value][id];
		$("#county").appendChild(o);
	});
}

const EAS_WEBHOOK = "https://discord.com/api/webhooks/965359101926314025/H6RpMxAvESc9GQ3ip-wPVCqxSgeBwknVHaWZSE3v6PiaRmsw7GGBlqkINK7ff12V9M3g"

function sendMessage() {
    const ORG = originator.value
    //console.log(ORG)
    const EEE = events.value
    //console.log(EEE)
    const P = subdiv.value
    //console.log(P)
    const SS = state.value
    //console.log(SS)
    const CCC = county.value
    //console.log(CCC)
    const PSSCCC = P+SS+CCC
    //console.log(PSSCCC)
    const HHMM = purgetime.value
    //console.log(HHMM)
    const LLLLLLLL = senderCallsign.value
    //console.log(LLLLLLLL)
    const MSG = message.value
    //console.log(MSG)

    const request = new XMLHttpRequest();
    request.open("POST", `${EAS_WEBHOOK}`);
    request.setRequestHeader('Content-type', 'application/json');
    const params = {
        content: `EAS EVENT: \`${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}\` \n\n Transcript: \`${MSG}\` \n `,
        ttss: true
    }

    request.send(JSON.stringify(params));
}

function sendRWT() {
    const ORG = originator.value
    const P = subdiv.value
    const SS = state.value
    const CCC = county.value
    const PSSCCC = P+SS+CCC
    const LLLLLLLL = senderCallsign.value

    const request = new XMLHttpRequest();
    request.open("POST", `${EAS_WEBHOOK}`);
    request.setRequestHeader('Content-type', 'application/json');
    const params = {
        content: `EAS EVENT: \`${ORG}-RWT-${PSSCCC}-1200-${LLLLLLLL}\` \n\n Transcript: \`This is a coordinated weakly test of the broadcast stations of your area. We are testing equipment that can quickly warn you during emergencies. If this had been an actual emergency, an official message would have followed the alert tone. This concludes this test of the Emergency Alert System.\` \n `,
        ttss: true
    }

    request.send(JSON.stringify(params));
}

function sendRMT() {
    const ORG = originator.value
    const P = subdiv.value
    const SS = state.value
    const CCC = county.value
    const PSSCCC = P+SS+CCC
    const LLLLLLLL = senderCallsign.value

    const request = new XMLHttpRequest();
    request.open("POST", `${EAS_WEBHOOK}`);
    request.setRequestHeader('Content-type', 'application/json');
    const params = {
        content: `EAS EVENT: \`${ORG}-RMT-${PSSCCC}-1200-${LLLLLLLL}\` \n\n Transcript: \`This is a coordinated monthly test of the broadcast stations of your area. We are testing equipment that can quickly warn you during emergencies. If this had been an actual emergency, an official message would have followed the alert tone. This concludes this test of the Emergency Alert System.\` \n `,
        ttss: true
    }

    request.send(JSON.stringify(params));
}
