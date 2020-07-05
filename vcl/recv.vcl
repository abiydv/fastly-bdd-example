if (!req.http.Fastly-SSL) {
    error 901;
}