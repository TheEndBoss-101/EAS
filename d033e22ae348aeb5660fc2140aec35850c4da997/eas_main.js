//alert("WARNING: HIGHLY EXPERMENTAL!")
console.log("EAS_MAIN.JS - V: 5.0")

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const loadStates = async () => {
	return await (await fetch("./state.json")).json();
};

const loadCounties = async () => {
	return await (await fetch("./county.json")).json();
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
	
	generate();
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

var EAS_WEBHOOK = atob("aHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvOTcwNTE0NDM0NjM4MzgxMDU2L3oycXVrbUF4WXZLQVJjaTF0ZVJRZkRHajhDTXhyV2FMRG1FSTkzNFVobkViZG5KeW9iZ2VMNTJRUk9XSzhGbDZDUnoy")

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
    //console.log(EAS_WEBHOOK)

    const request = new XMLHttpRequest();
    request.open("POST", `${EAS_WEBHOOK}`);
    request.setRequestHeader('Content-type', 'application/json');
    const params = {
        content: `EAS EVENT: \`${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}\` \n\n Transcript: \`${MSG}\` \n `,
        tts: false,
        allowed_mentions: { "parse": [] }
    }

    if (document.getElementById('tts').Checked) {
        params.tts = true
    }
    if (document.getElementById('ate').Checked) {
        params.content = `@everyone \n EAS EVENT: \`${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}\` \n\n Transcript: \`${MSG}\` \n `
        params.allowed_mentions = { "parse": ["everyone"] }
    }

    request.send(JSON.stringify(params));
    //sendeasfunc();
}

function send_RWT() {
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
        content: `EAS EVENT: \`${ORG}-RWT-${PSSCCC}-1200-${LLLLLLLL}\` \n\n Transcript: \`This is a coordinated weekly test of the broadcast stations of your area. We are testing equipment that can quickly warn you during emergencies. If this had been an actual emergency, an official message would have followed the alert tone. This concludes this test of the Emergency Alert System.\` \n `,
        tts: false,
        allowed_mentions: { "parse": [] }
    }

    if (document.getElementById('tts').Checked) {
        params.tts = true
    }
    if (document.getElementById('ate').Checked) {
        params.content = `@everyone \n EAS EVENT: \`${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}\` \n\n Transcript: \`${MSG}\` \n `
        params.allowed_mentions = { "parse": ["everyone"] }
    }

    request.send(JSON.stringify(params));
}

function send_RMT() {
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
        tts: false,
        allowed_mentions: { "parse": [] }
    }

    if (document.getElementById('tts').Checked) {
        params.tts = true
    }
    if (document.getElementById('ate').Checked) {
        params.content = `@everyone \n EAS EVENT: \`${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}\` \n\n Transcript: \`${MSG}\` \n `
        params.allowed_mentions = { "parse": ["everyone"] }
    }

    request.send(JSON.stringify(params));
}

function send_RDT() {
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
        content: `EAS EVENT: \`${ORG}-RDT-${PSSCCC}-1200-${LLLLLLLL}\` \n\n Transcript: \`This is a coordinated daily test of the broadcast stations of your area. We are testing equipment that can quickly warn you during emergencies. If this had been an actual emergency, an official message would have followed the alert tone. This concludes this test of the Emergency Alert System.\` \n `,
        tts: false,
        allowed_mentions: { "parse": [] }
    }

    if (document.getElementById('tts').Checked) {
        params.tts = true
    }
    if (document.getElementById('ate').Checked) {
        params.content = `@everyone \n EAS EVENT: \`${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}\` \n\n Transcript: \`${MSG}\` \n `
        params.allowed_mentions = { "parse": ["everyone"] }
    }

    request.send(JSON.stringify(params));
}

function send_EAN() {
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
        content: `EAS EVENT: \`${ORG}-RDT-${PSSCCC}-1200-${LLLLLLLL}\` \n\n Transcript: \`We interrupt our programming; this is a national emergency. This is an Emergency Action Notification. All broadcast stations and cable systems shall transmit this Emergency Action Notification Message. This station has interrupted its regular programming at the request of the ${ORG} to participate in the Emergency Alert System.  During this emergency, most stations will remain on the air providing news and information to the public in assigned areas. This is ${ORG}. We will continue to serve the ${ORG} area. If you are not in this Local Area, you should tune to stations providing news and information for your Local Area. You are listening to the Emergency Alert System serving the ${ORG} area. Do not use your telephone. The telephone lines should be kept open for emergency use. Do not spam the ${ORG} Discord. The Discord channels should be kept open for emergency use. \` \n `,
        tts: false,
        allowed_mentions: { "parse": [] }
    }

    if (document.getElementById('tts').Checked) {
        params.tts = true
    }
    if (document.getElementById('ate').Checked) {
        params.content = `@everyone \n EAS EVENT: \`${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}\` \n\n Transcript: \`We interrupt our programming; this is a national emergency. This is an Emergency Action Notification. All broadcast stations and cable systems shall transmit this Emergency Action Notification Message. This station has interrupted its regular programming at the request of the ${ORG} to participate in the Emergency Alert System.  During this emergency, most stations will remain on the air providing news and information to the public in assigned areas. This is ${ORG}. We will continue to serve the ${ORG} area. If you are not in this Local Area, you should tune to stations providing news and information for your Local Area. You are listening to the Emergency Alert System serving the ${ORG} area. Do not use your telephone. The telephone lines should be kept open for emergency use. Do not spam the ${ORG} Discord. The Discord channels should be kept open for emergency use. \` \n `
        params.allowed_mentions = { "parse": ["everyone"] }
    }

    request.send(JSON.stringify(params));
}

function generate() {
    const ORG = originator.value
    const EEE = events.value
    const P = subdiv.value
    const SS = state.value
    const CCC = county.value
    const PSSCCC = P+SS+CCC
    const HHMM = purgetime.value
    const LLLLLLLL = senderCallsign.value
    const MSG = message.value

	$("#code").innerText = `WebHook: ${EAS_WEBHOOK} \n Code: ${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL} \n Message: ${MSG}`;
}

//generate()