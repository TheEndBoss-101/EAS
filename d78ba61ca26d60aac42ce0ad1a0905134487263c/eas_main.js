alert("WARNING: HIGHLY EXPERMENTAL!")

function sendMessage() {
    const request = new XMLHttpRequest();
    request.open("POST", "https://discord.com/api/webhooks/965359101926314025/H6RpMxAvESc9GQ3ip-wPVCqxSgeBwknVHaWZSE3v6PiaRmsw7GGBlqkINK7ff12V9M3g");
    request.setRequestHeader('Content-type', 'application/json');
    const params = {
        content: "EAS EVENT: `${#originator}.value-${#event}.value-${#subdiv}.value${#state}.value${#county}.value-${#purgetime}.value-${#senderCallsign}.value+${#message}.value` Transcript: `${#message}.value`",
        ttss: true
    }

    request.send(JSON.stringify(params));
}