alert("WARNING: HIGHLY EXPERMENTAL!")
console.log("V: 3.7")

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
    request.open("POST", "https://discord.com/api/webhooks/965359101926314025/H6RpMxAvESc9GQ3ip-wPVCqxSgeBwknVHaWZSE3v6PiaRmsw7GGBlqkINK7ff12V9M3g");
    request.setRequestHeader('Content-type', 'application/json');
    const params = {
        content: `EAS EVENT: \`${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}\` \n\n Transcript: \`${MSG}\` `,
        ttss: true
    }

    request.send(JSON.stringify(params));
}

function sendRWT() {
    const ORG = originator.value
    //console.log(ORG)
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

    const request = new XMLHttpRequest();
    request.open("POST", "https://discord.com/api/webhooks/965359101926314025/H6RpMxAvESc9GQ3ip-wPVCqxSgeBwknVHaWZSE3v6PiaRmsw7GGBlqkINK7ff12V9M3g");
    request.setRequestHeader('Content-type', 'application/json');
    const params = {
        content: `EAS EVENT: \`${ORG}-RWT-${PSSCCC}-${HHMM}-${LLLLLLLL}\` \n\n Transcript: \`This is a coordinated weakly test of the broadcast stations of your area. We are testing equipment that can quickly warn you during emergencies. If this had been an actual emergency, an official message would have followed the alert tone. This concludes this test of the Emergency Alert System.\` `,
        ttss: true
    }

    request.send(JSON.stringify(params));
}

function sendRMT() {
    const ORG = originator.value
    //console.log(ORG)
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

    const request = new XMLHttpRequest();
    request.open("POST", "https://discord.com/api/webhooks/965359101926314025/H6RpMxAvESc9GQ3ip-wPVCqxSgeBwknVHaWZSE3v6PiaRmsw7GGBlqkINK7ff12V9M3g");
    request.setRequestHeader('Content-type', 'application/json');
    const params = {
        content: `EAS EVENT: \`${ORG}-RWT-${PSSCCC}-${HHMM}-${LLLLLLLL}\` \n\n Transcript: \`This is a coordinated monthly test of the broadcast stations of your area. We are testing equipment that can quickly warn you during emergencies. If this had been an actual emergency, an official message would have followed the alert tone. This concludes this test of the Emergency Alert System.\` `,
        ttss: true
    }

    request.send(JSON.stringify(params));
}
