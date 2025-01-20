@interface TRIServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation TRIServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TrialArchivingServiceProtocol));
  [v4 setExportedInterface:v5];

  v6 = objc_opt_new(&OBJC_CLASS___TrialArchivingService);
  [v4 setExportedObject:v6];
  [v4 resume];
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  id v7 = TRILogCategory_Archiving();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unsigned __int8 v9 = +[_PASEntitlement taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:]( &OBJC_CLASS____PASEntitlement,  "taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:",  v16,  @"com.apple.TrialArchivingService.internal",  v8);

  id v10 = TRILogCategory_Archiving();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = [v4 processIdentifier];
      *(_DWORD *)buf = 67109120;
      unsigned int v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "accepting connection from pid %d", buf, 8u);
    }
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v15 = [v4 processIdentifier];
      *(_DWORD *)buf = 67109120;
      unsigned int v18 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "connection from pid %d is missing entitlement. Rejecting connection",  buf,  8u);
    }

    [v4 invalidate];
  }

  return v9;
}

@end