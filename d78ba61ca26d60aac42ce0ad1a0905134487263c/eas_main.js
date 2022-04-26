alert("WARNING: HIGHLY EXPERMENTAL!")
console.log("V: 3.3")

function sendMessage() {
    const ORG = originator.value
    console.log(ORG)
    const EEE = events.value
    console.log(EEE)
    const P = subdiv.value
    console.log(P)
    const SS = state.value
    console.log(SS)
    const CCC = county.value
    console.log(CCC)
    const PSSCCC = P+SS+CCC
    console.log(PSSCCC)
    const HHMM = purgetime.value
    console.log(HHMM)
    const LLLLLLLL = senderCallsign.value
    console.log(LLLLLLLL)
    const MSG = message.value
    console.log(MSG)

    const request = new XMLHttpRequest();
    request.open("POST", "https://discord.com/api/webhooks/965359101926314025/H6RpMxAvESc9GQ3ip-wPVCqxSgeBwknVHaWZSE3v6PiaRmsw7GGBlqkINK7ff12V9M3g");
    request.setRequestHeader('Content-type', 'application/json');
    const params = {
        content: `EAS EVENT: "${ORG}-${EEE}-${PSSCCC}-${HHMM}-${LLLLLLLL}+${MSG}" Transcript: "${MSG}`,
        ttss: true
    }

    request.send(JSON.stringify(params));
}