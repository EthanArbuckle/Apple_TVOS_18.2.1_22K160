@interface CLNearbydInterfaceManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)pairSupportsRegulatorySync;
- (CLNearbydInterfaceManagerAdapter)init;
- (IDSService)service;
- (NSString)nearbyPairUniqueID;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setNearbyPairUniqueID:(id)a3;
- (void)setPairSupportsRegulatorySync:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setSilo:(id)a3;
- (void)updateNearbyStatusWithDevices:(id)a3;
@end

@implementation CLNearbydInterfaceManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019A0690 != -1) {
    dispatch_once(&qword_1019A0690, &stru_1018A2AC8);
  }
  return (id)qword_1019A0688;
}

+ (BOOL)isSupported
{
  if ((sub_1004F7000() & 1) != 0) {
    return 1;
  }
  sub_1004F2598();
  return sub_1001B9A1C();
}

- (CLNearbydInterfaceManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLNearbydInterfaceManagerAdapter;
  return -[CLNearbydInterfaceManagerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLNearbydInterfaceManagerProtocol,  &OBJC_PROTOCOL___CLNearbydInterfaceManagerClientProtocol);
}

- (void)setSilo:(id)a3
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018A2AE8);
  }
  unint64_t v5 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#NearbydIfMgr,suspending silo until IDS becomes available}",  buf,  0x12u);
  }

  [a3 suspend];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLNearbydInterfaceManagerAdapter;
  -[CLNearbydInterfaceManagerAdapter setSilo:](&v8, "setSilo:", a3);
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018A2AE8);
  }
  v6 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#NearbydIfMgr,waiting on IDS to become available}",  buf,  0x12u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1011D701C;
  v7[3] = &unk_1018306C8;
  v7[4] = self;
  v7[5] = a3;
  +[IDSService serviceWithIdentifier:completion:]( &OBJC_CLASS___IDSService,  "serviceWithIdentifier:completion:",  @"com.apple.private.alloy.regulatorysync",  v7);
}

- (void)beginService
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018A2AE8);
  }
  objc_super v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 68289026;
    int v8 = 0;
    __int16 v9 = 2082;
    int v10 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#NearbydIfMgr,beginService}",  (uint8_t *)&v7,  0x12u);
  }

  id v4 = -[CLNearbydInterfaceManagerAdapter universe](self, "universe");
  unint64_t v5 = operator new(0x28uLL);
  *unint64_t v5 = v4;
  v5[1] = 0LL;
  v5[4] = 0LL;
  v5[3] = 0LL;
  v5[2] = v5 + 3;
  sub_1011D7498((uint64_t *)&self->fNearbydIfMgrInstance, (uint64_t)v5);
  *((void *)self->fNearbydIfMgrInstance.__ptr_.__value_ + 1) = self;
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018A2AE8);
  }
  v6 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 68289026;
    int v8 = 0;
    __int16 v9 = 2082;
    int v10 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#NearbydIfMgr,addDelegateself queue:[(CLDispatchSilo *)self.universe.silo queue]];}",
      (uint8_t *)&v7,
      0x12u);
  }

  -[IDSService addDelegate:queue:]( -[CLNearbydInterfaceManagerAdapter service](self, "service"),  "addDelegate:queue:",  self,  objc_msgSend(objc_msgSend(-[CLNearbydInterfaceManagerAdapter universe](self, "universe"), "silo"), "queue"));
  -[CLNearbydInterfaceManagerAdapter updateNearbyStatusWithDevices:]( self,  "updateNearbyStatusWithDevices:",  -[IDSService devices](-[CLNearbydInterfaceManagerAdapter service](self, "service"), "devices"));
}

- (void)endService
{
}

- (void)updateNearbyStatusWithDevices:(id)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v13 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(a3);
        }
        __int16 v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ([v9 isDefaultPairedDevice] && objc_msgSend(v9, "isNearby"))
        {
          id v10 = [v9 uniqueIDOverride];
          if (v9) {
            [v9 operatingSystemVersion];
          }
          goto LABEL_13;
        }
      }

      id v6 = [a3 countByEnumeratingWithState:&v13 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_13:
  if ((objc_msgSend( v10,  "isEqualToString:",  -[CLNearbydInterfaceManagerAdapter nearbyPairUniqueID](self, "nearbyPairUniqueID")) & 1) == 0)
  {
    -[CLNearbydInterfaceManagerAdapter setNearbyPairUniqueID:](self, "setNearbyPairUniqueID:", v10);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018A2AE8);
    }
    __int16 v11 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[CLNearbydInterfaceManagerAdapter nearbyPairUniqueID](self, "nearbyPairUniqueID");
      *(_DWORD *)buf = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      v20 = "";
      __int16 v21 = 1026;
      BOOL v22 = v12 != 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#NearbydIfMgr,Nearby status change, is nearby:%{public}d}",  buf,  0x18u);
    }
  }

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018A2AE8);
  }
  id v6 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289026;
    v7[1] = 0;
    __int16 v8 = 2082;
    __int16 v9 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#NearbydIfMgr,nearbyDevicesChanged}",  (uint8_t *)v7,  0x12u);
  }

  -[CLNearbydInterfaceManagerAdapter updateNearbyStatusWithDevices:](self, "updateNearbyStatusWithDevices:", a4);
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018A2AE8);
  }
  uint64_t v7 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#NearbydIfMgr,didSwitchActivePairedDevice,activePairedDevice=%@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018A2AE8);
    }
    int v10 = 138412290;
    id v11 = a4;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  0LL,  "#NearbydIfMgr,didSwitchActivePairedDevice,activePairedDevice=%@",  &v10,  12);
    __int16 v9 = (uint8_t *)v8;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLNearbydInterfaceManagerAdapter service:didSwitchActivePairedDevice:acknowledgementBlock:]",  "%s\n",  v8);
    if (v9 != buf) {
      free(v9);
    }
  }

  (*((void (**)(id))a5 + 2))(a5);
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setService:(id)a3
{
}

- (NSString)nearbyPairUniqueID
{
  return self->_nearbyPairUniqueID;
}

- (void)setNearbyPairUniqueID:(id)a3
{
}

- (BOOL)pairSupportsRegulatorySync
{
  return self->_pairSupportsRegulatorySync;
}

- (void)setPairSupportsRegulatorySync:(BOOL)a3
{
  self->_pairSupportsRegulatorySync = a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  return self;
}

@end