@interface StreamingUnzipServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation StreamingUnzipServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = @"com.apple.private.SZExtractor.privileged";
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:@"com.apple.private.SZExtractor.privileged"]);
  unsigned __int8 v9 = [v8 BOOLValue];

  if ((v9 & 1) != 0)
  {
    id v10 = [v6 processIdentifier];
    int v11 = proc_pidpath((int)v10, &buffer, 0x1000u);
    if (v11 < 1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown Process Name (pid %d)",  v10));
    }

    else
    {
      v12 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  &buffer,  v11,  4LL);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](v12, "lastPathComponent"));
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (pid %d)",  v13,  v10));
    }

    v15 = sub_100004680();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    uint64_t v17 = qos_class_self();
    if ((int)v17 > 20)
    {
      switch((_DWORD)v17)
      {
        case 0x15:
          v18 = @"DEFAULT";
          goto LABEL_21;
        case 0x21:
          v18 = @"USER_INTERACTIVE";
          goto LABEL_21;
        case 0x19:
          v18 = @"USER_INITIATED";
          goto LABEL_21;
      }
    }

    else
    {
      switch((_DWORD)v17)
      {
        case 0:
          v18 = @"UNSPECIFIED";
          goto LABEL_21;
        case 9:
          v18 = @"BACKGROUND";
          goto LABEL_21;
        case 0x11:
          v18 = @"UTILITY";
LABEL_21:
          int buffer = 138412546;
          v29 = v14;
          __int16 v30 = 2112;
          v31 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Got connection from process %@ at qos %@",  (uint8_t *)&buffer,  0x16u);

LABEL_22:
          id v19 = sub_100019E30();
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          [v6 setExportedInterface:v20];

          id v21 = -[StreamingUnzipper initForClient:connection:]( objc_alloc(&OBJC_CLASS___StreamingUnzipper),  "initForClient:connection:",  v14,  v6);
          [v6 setExportedObject:v21];
          id v22 = sub_100019A00();
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          [v6 setRemoteObjectInterface:v23];

          [v21 setXpcConnection:v6];
          [v6 setInterruptionHandler:&stru_1000286E8];
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472LL;
          v26[2] = sub_1000046C0;
          v26[3] = &unk_100028C10;
          id v27 = v21;
          id v24 = v21;
          [v6 setInvalidationHandler:v26];
          [v6 resume];

          goto LABEL_23;
      }
    }

    v18 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UNKNOWN_QOS: 0x%x",  v17));
    goto LABEL_21;
  }

  [v6 invalidate];
LABEL_23:

  return v9;
}

@end