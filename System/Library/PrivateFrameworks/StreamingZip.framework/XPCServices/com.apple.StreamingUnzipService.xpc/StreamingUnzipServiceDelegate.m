@interface StreamingUnzipServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation StreamingUnzipServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  id v5 = [v4 processIdentifier];
  int v6 = proc_pidpath((int)v5, &buffer, 0x1000u);
  if (v6 < 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown Process Name (pid %d)",  v5));
  }

  else
  {
    v7 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  &buffer,  v6,  4LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (pid %d)",  v8,  v5));
  }

  v10 = sub_100004680();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = qos_class_self();
    if ((int)v12 > 20)
    {
      switch((_DWORD)v12)
      {
        case 0x15:
          v13 = @"DEFAULT";
          goto LABEL_19;
        case 0x21:
          v13 = @"USER_INTERACTIVE";
          goto LABEL_19;
        case 0x19:
          v13 = @"USER_INITIATED";
          goto LABEL_19;
      }
    }

    else
    {
      switch((_DWORD)v12)
      {
        case 0:
          v13 = @"UNSPECIFIED";
          goto LABEL_19;
        case 9:
          v13 = @"BACKGROUND";
          goto LABEL_19;
        case 0x11:
          v13 = @"UTILITY";
LABEL_19:
          int buffer = 138412546;
          v24 = v9;
          __int16 v25 = 2112;
          v26 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Got connection from process %@ at qos %@",  (uint8_t *)&buffer,  0x16u);

          goto LABEL_20;
      }
    }

    v13 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UNKNOWN_QOS: 0x%x",  v12));
    goto LABEL_19;
  }

@end