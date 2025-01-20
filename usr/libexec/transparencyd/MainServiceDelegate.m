@interface MainServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_workloop)xpcQueue;
- (transparencyd)daemonContext;
- (void)setDaemonContext:(id)a3;
- (void)setXpcQueue:(id)a3;
@end

@implementation MainServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"application-identifier"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.transparency.kt"]);
  unsigned __int8 v8 = [v7 BOOLValue];

  if ((v8 & 1) != 0)
  {
    if (qword_1002E65A0 != -1) {
      dispatch_once(&qword_1002E65A0, &stru_10027CD18);
    }
    v9 = (void *)qword_1002E65A8;
    if (os_log_type_enabled((os_log_t)qword_1002E65A8, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      int v16 = 138412546;
      *(void *)v17 = v6;
      *(_WORD *)&v17[8] = 1024;
      *(_DWORD *)&v17[10] = [v5 processIdentifier];
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "transparency accepting new connection from: %@[%d]",  (uint8_t *)&v16,  0x12u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainServiceDelegate xpcQueue](self, "xpcQueue"));
    [v5 _setQueue:v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyXPCInterface interface](&OBJC_CLASS___TransparencyXPCInterface, "interface"));
    [v5 setExportedInterface:v12];

    [v5 setExportedObject:self->_daemonContext];
    [v5 resume];
  }

  else
  {
    if (qword_1002E65A0 != -1) {
      dispatch_once(&qword_1002E65A0, &stru_10027CCF8);
    }
    v13 = (void *)qword_1002E65A8;
    if (os_log_type_enabled((os_log_t)qword_1002E65A8, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      int v16 = 67109378;
      *(_DWORD *)v17 = [v5 processIdentifier];
      *(_WORD *)&v17[4] = 2112;
      *(void *)&v17[6] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "transparency rejecting client %d/[%@] due to lack of entitlement",  (uint8_t *)&v16,  0x12u);
    }
  }

  return v8;
}

- (OS_dispatch_workloop)xpcQueue
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setXpcQueue:(id)a3
{
}

- (transparencyd)daemonContext
{
  return (transparencyd *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDaemonContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end