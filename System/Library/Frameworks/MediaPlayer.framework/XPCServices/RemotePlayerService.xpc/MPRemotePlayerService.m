@interface MPRemotePlayerService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation MPRemotePlayerService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v25, 0, sizeof(v25));
  }
  uint64_t v9 = MSVBundleIDForAuditToken(v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unsigned int v11 = [v8 processIdentifier];
  id v12 = [v10 length];
  if (v12)
  {
    sub_100004C88();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = [v14 beginTaskWithName:@"shouldAcceptNewConnection" expirationHandler:0];

    id v16 = sub_1000049CC();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v27 = self;
      __int16 v28 = 2112;
      v29 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "MPRemotePlayerService: %p: Received new incoming XPC connection: %@",  buf,  0x16u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000053A4;
    block[3] = &unk_100008348;
    id v20 = v8;
    id v21 = v10;
    v22 = self;
    unsigned int v24 = v11;
    id v23 = v15;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    [v8 invalidate];
  }

  return v12 != 0LL;
}

- (void).cxx_destruct
{
}

@end