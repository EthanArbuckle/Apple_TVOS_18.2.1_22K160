@interface STExtractionServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation STExtractionServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  id v5 = [v4 processIdentifier];
  int v6 = proc_pidpath((int)v5, buffer, 0x1000u);
  if (v6 < 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown Process Name (pid %d)",  v5));
  }

  else
  {
    v7 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  buffer,  v6,  4LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (pid %d)",  v8,  v5));
  }

  id v10 = [v4 processIdentifier];
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(buffer, 0, 32);
  }
  *(_DWORD *)buf = 0;
  if (!csops_audittoken(v10, 0LL, buf, 4LL, buffer))
  {
    if ((buf[3] & 4) == 0)
    {
      v13 = sub_10000171C();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100004540();
      }
      goto LABEL_13;
    }

    v16 = sub_10000171C();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
LABEL_31:

      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___STExtractionServiceProtocol));
      [v4 setExportedInterface:v20];

      id v21 = -[STExtractionService initForClient:connection:]( objc_alloc(&OBJC_CLASS___STExtractionService),  "initForClient:connection:",  v9,  v4);
      [v4 setExportedObject:v21];
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___STExtractionOriginatorProtocol));
      [v4 setRemoteObjectInterface:v22];

      [v21 setXpcConnection:v4];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_100001E54;
      v29[3] = &unk_100008368;
      id v23 = v9;
      id v30 = v23;
      id v24 = v21;
      id v31 = v24;
      [v4 setInterruptionHandler:v29];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100001F34;
      v26[3] = &unk_100008368;
      id v27 = v23;
      id v28 = v24;
      id v25 = v24;
      [v4 setInvalidationHandler:v26];
      [v4 resume];

      BOOL v14 = 1;
      goto LABEL_14;
    }

    uint64_t v18 = qos_class_self();
    if ((int)v18 > 20)
    {
      switch((_DWORD)v18)
      {
        case 0x15:
          v19 = @"DEFAULT";
          goto LABEL_30;
        case 0x21:
          v19 = @"USER_INTERACTIVE";
          goto LABEL_30;
        case 0x19:
          v19 = @"USER_INITIATED";
          goto LABEL_30;
      }
    }

    else
    {
      switch((_DWORD)v18)
      {
        case 0:
          v19 = @"UNSPECIFIED";
          goto LABEL_30;
        case 9:
          v19 = @"BACKGROUND";
          goto LABEL_30;
        case 0x11:
          v19 = @"UTILITY";
LABEL_30:
          *(_DWORD *)buf = 136446722;
          v33 = "-[STExtractionServiceDelegate listener:shouldAcceptNewConnection:]";
          __int16 v34 = 2112;
          v35 = v9;
          __int16 v36 = 2112;
          v37 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Got connection from process %@ at qos %@",  buf,  0x20u);

          goto LABEL_31;
      }
    }

    v19 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UNKNOWN_QOS: 0x%x",  v18));
    goto LABEL_30;
  }

  v11 = sub_10000171C();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1000045B0();
  }
LABEL_13:

  [v4 invalidate];
  BOOL v14 = 0;
LABEL_14:

  return v14;
}

@end