console.log("Emergency Alert System - V:2.1.3")

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const Load_States = async () => {
	return await (await fetch("https://raw.githubusercontent.com/TheEndBoss-101/EAS/main/d033e22ae348aeb5660fc2140aec35850c4da997/state.json")).json();
};

const Load_Counties = async () => {
	return await (await fetch("https://raw.githubusercontent.com/TheEndBoss-101/EAS/main/d033e22ae348aeb5660fc2140aec35850c4da997/county.json")).json();
};

let states, counties;

(async () => {
	try {
		states = await Load_States();
		counties = await Load_Counties();
		
		$("#State").innerHTML = "<option value=\"00\">Entire nation</option>";
		Object.keys(states).forEach((id) => {
			const o = document.createElement('option');
			o.value = id;
			o.innerText = states[id];
			$("#State").appendChild(o);
		});
		
		Update_Counties();
	} catch(e) {
		console.log(`Failed to load states and counties. ${e}`)
    }
	console.log("Loaded states and counties.")
})();

function Update_Counties() {
	$("#County").innerHTML = "<option value=\"000\">Entire state</option>";
	Object.keys(counties[$("#State").value] || []).forEach((id) => {
		const o = document.createElement('option');
		o.value = id;
		o.innerText = counties[$("#State").value][id];
		$("#County").appendChild(o);
	});
}

function Send_EAS_Message_Discord() {
    const ORG = Originator.value
    const EEE = Events.value
    const P = SubDiv.value
    const SS = State.value
    const CCC = County.value
    const PSSCCC = P+SS+CCC
    const HHMM = PurgeTime.value
    const LLLLLLLL = SenderCallSign.value
    const MSG = Message.value
    const EAS_WEBHOOK = atob(Webhook.value)

    const request = new XMLHttpRequest();
    request.open("POST", `${EAS_WEBHOOK}`);
    request.setRequestHeader('Content-type', 'application/json');
    const params = {
        content: ``,
        tts: false,
        allowed_mentions: { "parse": [] }
    }

    if (document.getElementById('TTS').checked) {
        params.tts = true
    }
    else{
        params.tts = false
    }
    if (document.getElementById('AtRole').checked) {
        params.content = `<@EAS-OPT> \n :rotating_light:** === *EAS MESSAGE* ===** :rotating_light:\nHeader: \`${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}\`\nMessage: \`${MSG}\``
        params.allowed_mentions = { "roles": ["EAS-OPT"] }
    }
    else{
        params.content = `:rotating_light:** === *EAS MESSAGE* ===** :rotating_light:\nHeader: \`${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}\`\nMessage: \`${MSG}\``
        params.allowed_mentions = { "parse": [] }
    }

    request.send(JSON.stringify(params));
}

function Send_RDT_Message_Discord() {
    const ORG = Originator.value
    const EEE = "RDT"
    const P = SubDiv.value
    const SS = State.value
    const CCC = County.value
    const PSSCCC = P+SS+CCC
    const HHMM = "1200"
    const LLLLLLLL = SenderCallSign.value
    const MSG = "This is a coordinated daily test of the broadcast stations of your area. We are testing equipment that can quickly warn you during emergencies. If this had been an actual emergency, an official message would have followed the alert tone. This concludes this test of the Emergency Alert System."
    const EAS_WEBHOOK = atob(Webhook.value)

    const request = new XMLHttpRequest();
    request.open("POST", `${EAS_WEBHOOK}`);
    request.setRequestHeader('Content-type', 'application/json');
    const params = {
        content: `:rotating_light:** === *EAS MESSAGE* ===** :rotating_light:\nHeader: \`${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}\`\nMessage: \`${MSG}\``
    }

    request.send(JSON.stringify(params));
}

function Send_RWT_Message_Discord() {
    const ORG = Originator.value
    const EEE = "RWT"
    const P = SubDiv.value
    const SS = State.value
    const CCC = County.value
    const PSSCCC = P+SS+CCC
    const HHMM = "1200"
    const LLLLLLLL = SenderCallSign.value
    const MSG = "This is a coordinated weekly test of the broadcast stations of your area. We are testing equipment that can quickly warn you during emergencies. If this had been an actual emergency, an official message would have followed the alert tone. This concludes this test of the Emergency Alert System."
    const EAS_WEBHOOK = atob(Webhook.value)

    const request = new XMLHttpRequest();
    request.open("POST", `${EAS_WEBHOOK}`);
    request.setRequestHeader('Content-type', 'application/json');
    const params = {
        content: `:rotating_light:** === *EAS MESSAGE* ===** :rotating_light:\nHeader: \`${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}\`\nMessage: \`${MSG}\``,
        tts: false
    }

    if (document.getElementById('TTS').checked) {
        params.tts = true
    }
    else{
        params.tts = false
    }

    request.send(JSON.stringify(params));
}

function Send_RMT_Message_Discord() {
    const ORG = Originator.value
    const EEE = "RMT"
    const P = SubDiv.value
    const SS = State.value
    const CCC = County.value
    const PSSCCC = P+SS+CCC
    const HHMM = "1200"
    const LLLLLLLL = SenderCallSign.value
    const MSG = "This is a coordinated monthly test of the broadcast stations of your area. We are testing equipment that can quickly warn you during emergencies. If this had been an actual emergency, an official message would have followed the alert tone. This concludes this test of the Emergency Alert System."
    const EAS_WEBHOOK = atob(Webhook.value)

    const request = new XMLHttpRequest();
    request.open("POST", `${EAS_WEBHOOK}`);
    request.setRequestHeader('Content-type', 'application/json');
    const params = {
        content: ``,
        tts: false,
        allowed_mentions: { "parse": [] }
    }

    if (document.getElementById('TTS').checked) {
        params.tts = true
    }
    else{
        params.tts = false
    }
    if (document.getElementById('AtRole').checked) {
        params.content = `<@EAS-OPT> \n :rotating_light:** === *EAS MESSAGE* ===** :rotating_light:\nHeader: \`${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}\`\nMessage: \`${MSG}\``
        params.allowed_mentions = { "roles": ["EAS-OPT"] }
    }
    else{
        params.content = `:rotating_light:** === *EAS MESSAGE* ===** :rotating_light:\nHeader: \`${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}\`\nMessage: \`${MSG}\``
        params.allowed_mentions = { "parse": [] }
    }

    request.send(JSON.stringify(params));
}

function Send_EAN_Message_Discord() {
    const ORG = Originator.value
    const EEE = "EAN"
    const P = SubDiv.value
    const SS = State.value
    const CCC = County.value
    const PSSCCC = P+SS+CCC
    const HHMM = PurgeTime.value
    const LLLLLLLL = SenderCallSign.value
    const MSG = "We interrupt our programming; this is a national emergency. This is an Emergency Action Notification. All broadcast stations and cable systems shall transmit this Emergency Action Notification Message. This station has interrupted its regular programming at the request of the ${ORG} to participate in the Emergency Alert System.  During this emergency, most stations will remain on the air providing news and information to the public in assigned areas. This is ${ORG}. We will continue to serve the ${ORG} area. If you are not in this Local Area, you should tune to stations providing news and information for your Local Area. You are listening to the Emergency Alert System serving the ${ORG} area. Do not use your telephone. The telephone lines should be kept open for emergency use. Do not spam the ${ORG} Discord. The Discord channels should be kept open for emergency use."
    const EAS_WEBHOOK = atob(Webhook.value)

    const request = new XMLHttpRequest();
    request.open("POST", `${EAS_WEBHOOK}`);
    request.setRequestHeader('Content-type', 'application/json');
    const params = {
        content: `@everyone \n :rotating_light:** === *EAS MESSAGE* ===** :rotating_light:\nHeader: \`${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}\`\nMessage: \`${MSG}\``,
        tts: false,
        allowed_mentions: { "parse": ["everyone"] }
    }

    if (document.getElementById('TTS').checked) {
        params.tts = true
    }
    else{
        params.tts = false
    }

    request.send(JSON.stringify(params));
}
