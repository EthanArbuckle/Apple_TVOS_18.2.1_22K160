@interface KTIDSSupportServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_workloop)xpcQueue;
- (TransparencydIDSSupportProtocol)daemonContext;
- (void)setDaemonContext:(id)a3;
- (void)setXpcQueue:(id)a3;
@end

@implementation KTIDSSupportServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"application-identifier"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.transparencyd.ids-support"]);
  unsigned __int8 v8 = [v7 BOOLValue];

  if ((v8 & 1) != 0)
  {
    if (qword_1002E65A0 != -1) {
      dispatch_once(&qword_1002E65A0, &stru_10027CD58);
    }
    v9 = (void *)qword_1002E65A8;
    if (os_log_type_enabled((os_log_t)qword_1002E65A8, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      int v17 = 138412546;
      *(void *)v18 = v6;
      *(_WORD *)&v18[8] = 1024;
      *(_DWORD *)&v18[10] = [v5 processIdentifier];
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "ids-support accepting new connection from: %@[%d]",  (uint8_t *)&v17,  0x12u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSupportServiceDelegate xpcQueue](self, "xpcQueue"));
    [v5 _setQueue:v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyIDSSupportInterface interface]( &OBJC_CLASS___TransparencyIDSSupportInterface,  "interface"));
    [v5 setExportedInterface:v12];

    [v5 setExportedObject:self->_daemonContext];
    [v5 resume];
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"application-identifier"]);
    if (qword_1002E65A0 != -1) {
      dispatch_once(&qword_1002E65A0, &stru_10027CD38);
    }
    v14 = (void *)qword_1002E65A8;
    if (os_log_type_enabled((os_log_t)qword_1002E65A8, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      int v17 = 67109378;
      *(_DWORD *)v18 = [v5 processIdentifier];
      *(_WORD *)&v18[4] = 2112;
      *(void *)&v18[6] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "ids-support rejecting client %d/[%@] due to lack of entitlement",  (uint8_t *)&v17,  0x12u);
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

- (TransparencydIDSSupportProtocol)daemonContext
{
  return (TransparencydIDSSupportProtocol *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDaemonContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end