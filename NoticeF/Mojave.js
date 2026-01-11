fetch("https://api.xnexus.cc/request/9132536c8367zfc0a6741ga7050983p5", {
    method: "GET",
    headers: { "X-Client": "Mojave-Valley" }
})
.then(res => {
    console.log("Request sent, status:", res.status);
    return res.json();
})
.then(data => {
    console.log("Payload received");
    console.log(data);
})
.catch(() => {
    console.log("it broke");
});
