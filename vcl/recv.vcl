if (!req.http.Fastly-SSL) {
    error 901;
}

if (table.lookup(block,req.url)){
    error 903;
}

if (req.http.User-Agent ~ "googlebot"){
    return (lookup);
}

if (req.url ~ "^/status/200") {
    error 902;
}
