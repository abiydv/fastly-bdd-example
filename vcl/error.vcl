if (obj.status == 901) {
    set obj.status = 301;
    set obj.response = "FORCE SSL";
    set obj.http.Location = "https://" req.http.host req.url;
    return (deliver);
}

if (obj.status == 902) {
    set obj.status = 302;
    set obj.response = "REDIRECT";
    set obj.http.Location = "https://" req.http.host "/gateway";
    return (deliver);
}

if (obj.status == 903) {
    set obj.status = 403;
    set obj.response = "BLOCKED";
    synthetic {""};
    return (deliver);
}
