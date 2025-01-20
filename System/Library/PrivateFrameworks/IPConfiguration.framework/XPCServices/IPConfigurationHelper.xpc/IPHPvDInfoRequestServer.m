@interface IPHPvDInfoRequestServer
- (BOOL)validFetch;
- (IPHPvDInfoRequestServer)init;
- (NSURLSession)urlSession;
- (__CFDictionary)createValidPvDAdditionalInfoDict:(id)a3 withID:(id)a4 andPrefixes:(id)a5;
- (id)xpcClientCompletionHandler;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)cancelRequest;
- (void)fetchPvDAdditionalInformationWithPvDID:(id)a3 prefixesArray:(id)a4 bindToInterface:(id)a5 andCompletionHandler:(id)a6;
- (void)scheduleParsingEventAbort;
- (void)scheduleParsingEventCompleteWithParsedJSON:(id)a3 pvdID:(id)a4 ipv6Prefixes:(id)a5;
- (void)setUrlSession:(id)a3;
- (void)setValidFetch:(BOOL)a3;
- (void)setXpcClientCompletionHandler:(id)a3;
@end

@implementation IPHPvDInfoRequestServer

- (IPHPvDInfoRequestServer)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IPHPvDInfoRequestServer;
  v2 = -[IPHPvDInfoRequestServer init](&v4, "init");
  if (v2)
  {
    sub_10000315C((uint64_t)"Helper");
    -[IPHPvDInfoRequestServer setValidFetch:](v2, "setValidFetch:", 1LL);
  }

  return v2;
}

- (void)cancelRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IPHPvDInfoRequestServer urlSession](self, "urlSession"));

  if (v3)
  {
    uint64_t v4 = sub_100009A18();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = _SC_syslog_os_log_mapping(6LL);
    if (__SC_log_enabled(6LL, v5, v6))
    {
      memset(v12, 0, sizeof(v12));
      unsigned int v7 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v5, (os_log_type_t)v6)) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 2LL;
      }
      v11[0] = 0;
      v9 = (_OWORD *)((uint64_t (*)(uint64_t, void, _OWORD *, uint64_t, const mach_header_64 *, os_log_s *, uint64_t, const char *, _WORD *, int))_os_log_send_and_compose_impl)( v8,  0LL,  v12,  256LL,  &_mh_execute_header,  v5,  v6,  "cancelling in-flight URLSession and tasks",  v11,  2);
      __SC_log_send2(6LL, v5, v6, 0LL, v9);
      if (v9 != v12) {
        free(v9);
      }
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IPHPvDInfoRequestServer urlSession](self, "urlSession"));
    [v10 invalidateAndCancel];

    -[IPHPvDInfoRequestServer setUrlSession:](self, "setUrlSession:", 0LL);
  }

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = (void (**)(id, uint64_t, void))a6;
  id v9 = a5;
  uint64_t v10 = sub_100009A18();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = _SC_syslog_os_log_mapping(7LL);
  if (__SC_log_enabled(7LL, v11, v12))
  {
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    unsigned int v13 = (_sc_log > 0) | 2;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    uint64_t v14 = os_log_type_enabled(v11, (os_log_type_t)v12) ? v13 : 2LL;
    v31[0] = 0;
    v15 = (__int128 *)_os_log_send_and_compose_impl( v14,  0LL,  &v32,  256LL,  &_mh_execute_header,  v11,  v12,  "entered authentication challenge callback",  v31,  2);
    __SC_log_send2(7LL, v11, v12, 0LL, v15);
    if (v15 != &v32) {
      free(v15);
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 protectionSpace]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 authenticationMethod]);
  unsigned int v18 = [v17 isEqualToString:NSURLAuthenticationMethodServerTrust];

  if (v18)
  {
    uint64_t v19 = sub_100009A18();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v21 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v20, v21))
    {
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      unsigned int v22 = (_sc_log > 0) | 2;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      uint64_t v23 = os_log_type_enabled(v20, (os_log_type_t)v21) ? v22 : 2LL;
      v31[0] = 0;
      v24 = (__int128 *)_os_log_send_and_compose_impl( v23,  0LL,  &v32,  256LL,  &_mh_execute_header,  v20,  v21,  "encountered a server authentication error, aborting fetch",  v31,  2);
      __SC_log_send2(5LL, v20, v21, 0LL, v24);
      if (v24 != &v32) {
        free(v24);
      }
    }

    -[IPHPvDInfoRequestServer setValidFetch:](self, "setValidFetch:", 0LL);
    -[IPHPvDInfoRequestServer scheduleParsingEventAbort](self, "scheduleParsingEventAbort");
  }

  v8[2](v8, 1LL, 0LL);
  uint64_t v25 = sub_100009A18();
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  uint64_t v27 = _SC_syslog_os_log_mapping(7LL);
  if (__SC_log_enabled(7LL, v26, v27))
  {
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    unsigned int v28 = (_sc_log > 0) | 2;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    if (os_log_type_enabled(v26, (os_log_type_t)v27)) {
      uint64_t v29 = v28;
    }
    else {
      uint64_t v29 = 2LL;
    }
    v31[0] = 0;
    v30 = (__int128 *)_os_log_send_and_compose_impl( v29,  0LL,  &v32,  256LL,  &_mh_execute_header,  v26,  v27,  "finished authentication challenge callback",  v31,  2);
    __SC_log_send2(7LL, v26, v27, 0LL, v30);
    if (v30 != &v32) {
      free(v30);
    }
  }
}

- (void)fetchPvDAdditionalInformationWithPvDID:(id)a3 prefixesArray:(id)a4 bindToInterface:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  -[IPHPvDInfoRequestServer setXpcClientCompletionHandler:](self, "setXpcClientCompletionHandler:", a6);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v13,  self,  0LL));
  -[IPHPvDInfoRequestServer setUrlSession:](self, "setUrlSession:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IPHPvDInfoRequestServer urlSession](self, "urlSession"));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s%@%s",  "https://",  v10,  "/.well-known/pvd"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v16));
    unsigned int v18 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v17);
    -[NSMutableURLRequest setHTTPMethod:](v18, "setHTTPMethod:", @"GET");
    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v18,  "setValue:forHTTPHeaderField:",  @"application/pvd+json",  @"Content-Type");
    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v18,  "setValue:forHTTPHeaderField:",  @"application/pvd+json",  @"Accept");
    -[NSMutableURLRequest setBoundInterfaceIdentifier:](v18, "setBoundInterfaceIdentifier:", v12);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IPHPvDInfoRequestServer urlSession](self, "urlSession"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100003BD8;
    v33[3] = &unk_10000C3B0;
    v33[4] = self;
    id v20 = v16;
    id v34 = v20;
    id v35 = v10;
    id v36 = v11;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 dataTaskWithRequest:v18 completionHandler:v33]);

    uint64_t v22 = sub_100009A18();
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    uint64_t v24 = _SC_syslog_os_log_mapping(6LL);
    if (__SC_log_enabled(6LL, v23, v24))
    {
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      unsigned int v25 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v23, (os_log_type_t)v24)) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = 2LL;
      }
      int v37 = 138412290;
      id v38 = v20;
      uint64_t v27 = (__int128 *)_os_log_send_and_compose_impl( v26,  0LL,  &v39,  256LL,  &_mh_execute_header,  v23,  v24,  "fetching PvD Additional Info from URL %@",  &v37,  12);
      __SC_log_send2(6LL, v23, v24, 0LL, v27);
      if (v27 != &v39) {
        free(v27);
      }
    }

    [v21 resume];
  }

  else
  {
    uint64_t v28 = sub_100009A18();
    id v20 = (id)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v29 = _SC_syslog_os_log_mapping(3LL);
    if (__SC_log_enabled(3LL, v20, v29))
    {
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      unsigned int v30 = (_sc_log > 0) | 2;
      uint64_t v31 = os_log_type_enabled((os_log_t)v20, (os_log_type_t)v29) ? v30 : 2LL;
      LOWORD(v37) = 0;
      __int128 v32 = (__int128 *)_os_log_send_and_compose_impl( v31,  0LL,  &v39,  256LL,  &_mh_execute_header,  v20,  v29,  "failed to create an NSURLSession",  &v37,  2);
      __SC_log_send2(3LL, v20, v29, 0LL, v32);
      if (v32 != &v39) {
        free(v32);
      }
    }
  }
}

- (void)scheduleParsingEventCompleteWithParsedJSON:(id)a3 pvdID:(id)a4 ipv6Prefixes:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100004720;
  v10[3] = &unk_10000C3D8;
  v10[4] = self;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v11;
  dispatch_async(&_dispatch_main_q, v10);
}

- (void)scheduleParsingEventAbort
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004AC0;
  block[3] = &unk_10000C400;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (__CFDictionary)createValidPvDAdditionalInfoDict:(id)a3 withID:(id)a4 andPrefixes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    uint64_t v168 = sub_100009A18();
    v169 = (os_log_s *)objc_claimAutoreleasedReturnValue(v168);
    uint64_t v170 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v169, v170))
    {
      __int128 v243 = 0u;
      __int128 v244 = 0u;
      __int128 v241 = 0u;
      __int128 v242 = 0u;
      __int128 v239 = 0u;
      __int128 v240 = 0u;
      __int128 v237 = 0u;
      __int128 v238 = 0u;
      __int128 v235 = 0u;
      __int128 v236 = 0u;
      __int128 v233 = 0u;
      __int128 v234 = 0u;
      __int128 v231 = 0u;
      __int128 v232 = 0u;
      __int128 v229 = 0u;
      __int128 v230 = 0u;
      unsigned int v171 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v169, (os_log_type_t)v170)) {
        uint64_t v172 = v171;
      }
      else {
        uint64_t v172 = 2LL;
      }
      LOWORD(v220) = 0;
      uint64_t v173 = _os_log_send_and_compose_impl( v172,  0LL,  &v229,  256LL,  &_mh_execute_header,  v169,  v170,  "can't create valid info dict from empty JSON",  &v220,  2);
LABEL_208:
      v177 = (__int128 *)v173;
      __SC_log_send2(5LL, v169, v170, 0LL, v173);
      if (v177 != &v229) {
        free(v177);
      }
    }

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
}

- (BOOL)validFetch
{
  return self->_validFetch;
}

- (void)setValidFetch:(BOOL)a3
{
  self->_validFetch = a3;
}

- (id)xpcClientCompletionHandler
{
  return self->_xpcClientCompletionHandler;
}

- (void)setXpcClientCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end