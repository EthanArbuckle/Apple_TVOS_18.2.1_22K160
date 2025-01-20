@interface KTAccountsSupportServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_workloop)xpcQueue;
- (TransparencydIDSSupportProtocol)daemonContext;
- (void)setDaemonContext:(id)a3;
- (void)setXpcQueue:(id)a3;
@end

@implementation KTAccountsSupportServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"application-identifier"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.transparencyd.accounts-support"]);
  unsigned __int8 v8 = [v7 BOOLValue];

  if ((v8 & 1) != 0)
  {
    if (qword_1002E65A0 != -1) {
      dispatch_once(&qword_1002E65A0, &stru_10027CD98);
    }
    v9 = (os_log_s *)qword_1002E65A8;
    if (os_log_type_enabled((os_log_t)qword_1002E65A8, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      v16[0] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "accounts-support accepting new connection from %@",  (uint8_t *)&v15,  0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountsSupportServiceDelegate xpcQueue](self, "xpcQueue"));
    [v5 _setQueue:v10];

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAccountsSupportInterface interface]( &OBJC_CLASS___TransparencyAccountsSupportInterface,  "interface"));
    [v5 setExportedInterface:v11];

    [v5 setExportedObject:self->_daemonContext];
    [v5 resume];
  }

  else
  {
    if (qword_1002E65A0 != -1) {
      dispatch_once(&qword_1002E65A0, &stru_10027CD78);
    }
    v12 = (void *)qword_1002E65A8;
    if (os_log_type_enabled((os_log_t)qword_1002E65A8, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      int v15 = 67109378;
      LODWORD(v16[0]) = [v5 processIdentifier];
      WORD2(v16[0]) = 2112;
      *(void *)((char *)v16 + 6) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "accounts-support rejecting client %d/[%@] due to lack of entitlement",  (uint8_t *)&v15,  0x12u);
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