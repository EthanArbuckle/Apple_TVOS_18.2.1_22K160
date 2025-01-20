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
  v11 = @"com.apple.private.STRemoteExtractor.privileged";
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:v11]);
    unsigned __int8 v13 = [v12 BOOLValue];

    if ((v13 & 1) != 0) {
      goto LABEL_9;
    }
    v20 = sub_1000015A8();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100004514();
    }
  }

  else
  {
    *(_DWORD *)buf = 0;
    if (csops_audittoken(v10, 0LL, buf, 4LL, buffer))
    {
      v18 = sub_1000015A8();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000044A8();
      }
    }

    else
    {
      if ((buf[3] & 4) != 0)
      {
LABEL_9:
        v14 = sub_1000015A8();
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
        {
LABEL_34:

          v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___STExtractionServiceProtocol));
          [v4 setExportedInterface:v23];

          id v24 = -[STExtractionService initForClient:connection:]( objc_alloc(&OBJC_CLASS___STExtractionService),  "initForClient:connection:",  v9,  v4);
          [v4 setExportedObject:v24];
          v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___STExtractionOriginatorProtocol));
          [v4 setRemoteObjectInterface:v25];

          [v24 setXpcConnection:v4];
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472LL;
          v33[2] = sub_100001D48;
          v33[3] = &unk_100008368;
          id v26 = v9;
          id v34 = v26;
          id v27 = v24;
          id v35 = v27;
          [v4 setInterruptionHandler:v33];
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472LL;
          v30[2] = sub_100001E28;
          v30[3] = &unk_100008368;
          id v31 = v26;
          id v32 = v27;
          id v28 = v27;
          [v4 setInvalidationHandler:v30];
          [v4 resume];

          BOOL v21 = 1;
          goto LABEL_35;
        }

        uint64_t v16 = qos_class_self();
        if ((int)v16 > 20)
        {
          switch((_DWORD)v16)
          {
            case 0x15:
              v17 = @"DEFAULT";
              goto LABEL_33;
            case 0x21:
              v17 = @"USER_INTERACTIVE";
              goto LABEL_33;
            case 0x19:
              v17 = @"USER_INITIATED";
              goto LABEL_33;
          }
        }

        else
        {
          switch((_DWORD)v16)
          {
            case 0:
              v17 = @"UNSPECIFIED";
              goto LABEL_33;
            case 9:
              v17 = @"BACKGROUND";
              goto LABEL_33;
            case 0x11:
              v17 = @"UTILITY";
LABEL_33:
              *(_DWORD *)buf = 136446722;
              v37 = "-[STExtractionServiceDelegate listener:shouldAcceptNewConnection:]";
              __int16 v38 = 2112;
              v39 = v9;
              __int16 v40 = 2112;
              v41 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Got connection from process %@ at qos %@",  buf,  0x20u);

              goto LABEL_34;
          }
        }

        v17 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UNKNOWN_QOS: 0x%x",  v16));
        goto LABEL_33;
      }

      v22 = sub_1000015A8();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10000443C();
      }
    }
  }

  [v4 invalidate];
  BOOL v21 = 0;
LABEL_35:

  return v21;
}

@end