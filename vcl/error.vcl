if (obj.status == 901) {
    set obj.status = 301;
    set obj.response = "FORCE SSL";
    set obj.http.Location = "https://" req.http.host req.url;
    return (deliver);
}