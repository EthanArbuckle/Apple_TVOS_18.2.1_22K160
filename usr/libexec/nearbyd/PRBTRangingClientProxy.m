@interface PRBTRangingClientProxy
- (NSDictionary)clientInfo;
- (PRBTRangingClientProxy)initWithConnection:(id)a3 queue:(id)a4;
- (PRRemoteDevice)beacon;
- (id).cxx_construct;
- (id)convertToString:(int)a3;
- (void)activate;
- (void)connectWithClientInfo:(id)a3;
- (void)dealloc;
- (void)didFailWithError:(id)a3;
- (void)fetchTxPower:(id)a3 isUT:(id)a4 reply:(id)a5;
- (void)handleError:(id)a3;
- (void)informDelegateOwnerRangeStoppedonDevice:(id)a3;
- (void)setBeacon:(id)a3;
- (void)setCurrentTask:(int)a3;
- (void)setUUID:(id)a3;
- (void)startOwnerRanging:(id)a3 reply:(id)a4;
- (void)startUTRanging:(id)a3 reply:(id)a4;
- (void)stopOwnerRanging:(id)a3 reply:(id)a4;
- (void)stopUTRanging:(id)a3 reply:(id)a4;
- (void)terminate;
@end

@implementation PRBTRangingClientProxy

- (PRBTRangingClientProxy)initWithConnection:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v17 handleFailureInMethod:a2, self, @"PRBTRangingClientProxy.mm", 80, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v18 handleFailureInMethod:a2, self, @"PRBTRangingClientProxy.mm", 81, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PRBTRangingClientProxy;
  v10 = -[PRBTRangingClientProxy init](&v20, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a4);
    beacon = v11->_beacon;
    v11->_beacon = 0LL;

    v11->_cleaningUponDidFail = 0;
    *(_WORD *)&v11->_utFinding = 1;
    v11->_ranging = 0;
    v11->_currentTask = 0;
    v13 = -[PRNSXPCConnection initWithConnection:]( objc_alloc(&OBJC_CLASS___PRNSXPCConnection),  "initWithConnection:",  v7);
    connWrapper = v11->_connWrapper;
    v11->_connWrapper = (PRBTRangingClientProtocol *)v13;
  }

  v15 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PRBTRangingClientProxy init", buf, 2u);
  }

  return v11;
}

- (void)dealloc
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRBTRangingClientProxy dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PRBTRangingClientProxy;
  -[PRBTRangingClientProxy dealloc](&v4, "dealloc");
}

- (void)activate
{
  v2 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "PRBTRangingClientProxy activate", v3, 2u);
  }

- (void)terminate
{
  if (self->_beacon)
  {
    v3 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      beacon = self->_beacon;
      int v6 = 138412290;
      id v7 = beacon;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Tearing down BT ranging session. Beacon: %@",  (uint8_t *)&v6,  0xCu);
    }

    -[PRBTRangingClientProxy deinitCompanion](self, "deinitCompanion");
  }

  -[PRBTRangingClientProtocol invalidate](self->_connWrapper, "invalidate");
  voucher = self->_clientVoucher.voucher;
  self->_clientVoucher.voucher = 0LL;
}

- (void)handleError:(id)a3
{
  id v4 = a3;
  -[PRBTRangingClientProxy setCurrentTask:](self, "setCurrentTask:", 0LL);
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000359A0;
  v7[3] = &unk_1007A2D10;
  id v6 = v4;
  id v8 = v6;
  -[PRBTRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v7);
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#btranging-retry didFailWithError: %@",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100035B60;
  v8[3] = &unk_1007A2060;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)informDelegateOwnerRangeStoppedonDevice:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100035C48;
  v7[3] = &unk_1007A2D10;
  id v8 = v4;
  id v6 = v4;
  -[PRBTRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v7);
}

- (void)connectWithClientInfo:(id)a3
{
  id v5 = a3;
  id v6 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:PRProcessNameKey]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:PRProcessIdentifierKey]);
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 1024;
    unsigned int v12 = [v8 intValue];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PRBTRanging: XPC connection created. Process name: %@, pid: %d",  (uint8_t *)&v9,  0x12u);
  }

  objc_storeStrong((id *)&self->_clientInfo, a3);
  -[PRBTRangingClientProxy activate](self, "activate");
}

- (void)fetchTxPower:(id)a3 isUT:(id)a4 reply:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, uint64_t, void))a5;
  self->_utFinding = [v8 BOOLValue];
  -[PRBTRangingClientProxy setCurrentTask:](self, "setCurrentTask:", 1LL);
  id v10 = (OS_voucher *)voucher_copy(-[PRBTRangingClientProxy setUUID:](self, "setUUID:", v12));
  voucher = self->_clientVoucher.voucher;
  self->_clientVoucher.voucher = v10;

  v9[2](v9, 1LL, 0LL);
}

- (void)startUTRanging:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  -[PRBTRangingClientProxy setCurrentTask:](self, "setCurrentTask:", 2LL);
  self->_ranging = 1;
  -[PRBTRangingClientProxy setUUID:](self, "setUUID:", v7);
  v6[2](v6, 1LL, 0LL);
}

- (void)stopUTRanging:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, uint64_t, void))a4;
  -[PRBTRangingClientProxy setCurrentTask:](self, "setCurrentTask:", 0LL);
  self->_ranging = 0;
  v5[2](v5, 1LL, 0LL);
}

- (void)startOwnerRanging:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  -[PRBTRangingClientProxy setCurrentTask:](self, "setCurrentTask:", 5LL);
  self->_ranging = 1;
  self->_utFinding = 0;
  -[PRBTRangingClientProxy setUUID:](self, "setUUID:", v7);
  v6[2](v6, 1LL, 0LL);
}

- (void)stopOwnerRanging:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, uint64_t, void))a4;
  -[PRBTRangingClientProxy setCurrentTask:](self, "setCurrentTask:", 8LL);
  self->_ranging = 0;
  self->_utFinding = 0;
  v5[2](v5, 1LL, 0LL);
}

- (void)setCurrentTask:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_claimAutoreleasedReturnValue(-[PRBTRangingClientProxy convertToString:](self, "convertToString:", v3));
    int v7 = 136315138;
    id v8 = [v6 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#btranging-retry setting current task: %s",  (uint8_t *)&v7,  0xCu);
  }

  self->_currentTask = v3;
}

- (void)setUUID:(id)a3
{
  id v4 = a3;
  if (!self->_beacon)
  {
    id v5 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_claimAutoreleasedReturnValue([v4 UUIDString]);
      int v9 = 136315138;
      id v10 = [v6 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#btranging-retry setting beacon to: %s",  (uint8_t *)&v9,  0xCu);
    }

    int v7 = -[PRRemoteDevice initWithBeaconUUID:](objc_alloc(&OBJC_CLASS___PRRemoteDevice), "initWithBeaconUUID:", v4);
    beacon = self->_beacon;
    self->_beacon = v7;
  }
}

- (id)convertToString:(int)a3
{
  else {
    return (id)*((void *)&off_1007A2E10 + a3);
  }
}

- (NSDictionary)clientInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (PRRemoteDevice)beacon
{
  return (PRRemoteDevice *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setBeacon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInfo, 0LL);
  objc_storeStrong((id *)&self->_startOptions, 0LL);
  objc_storeStrong((id *)&self->_queue, 0LL);
  objc_storeStrong((id *)&self->_connWrapper, 0LL);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0LL;
  return self;
}

@end