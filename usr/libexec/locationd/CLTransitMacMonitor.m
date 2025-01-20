@interface CLTransitMacMonitor
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLLocation)mostRecentLocation;
- (CLTransitMacMonitor)init;
- (NSMutableArray)observedTransitAccessPointsCache;
- (NSMutableSet)clients;
- (id).cxx_construct;
- (unint64_t)currentState;
- (void)beginService;
- (void)endService;
- (void)onLocationNotification:(int)a3 data:(_OWORD *)a4;
- (void)onWifiServiceNotification:(int)a3 data:(uint64_t)a4;
- (void)processNewAccessPoints:(const void *)a3 transitTileResults:(id)a4;
- (void)setClients:(id)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)setMostRecentLocation:(id)a3;
- (void)setObservedTransitAccessPointsCache:(id)a3;
- (void)startMonitoringTransitStateForClient:(id)a3;
- (void)stopMonitoringTransitStateForClient:(id)a3;
@end

@implementation CLTransitMacMonitor

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199F588 != -1) {
    dispatch_once(&qword_10199F588, &stru_10188CEF0);
  }
  return (id)qword_10199F580;
}

- (CLTransitMacMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLTransitMacMonitor;
  return -[CLTransitMacMonitor initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLTransitMacMonitorProtocol,  &OBJC_PROTOCOL___CLTransitMacMonitorClientProtocol);
}

+ (BOOL)isSupported
{
  return 0;
}

- (void)beginService
{
  if (qword_1019348F0 != -1) {
    dispatch_once(&qword_1019348F0, &stru_10188CF68);
  }
  objc_super v3 = (os_log_s *)qword_1019348F8;
  if (os_log_type_enabled((os_log_t)qword_1019348F8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#TransitMacMonitor: service begin", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019348F0 != -1) {
      dispatch_once(&qword_1019348F0, &stru_10188CF68);
    }
    v12[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348F8,  2LL,  "#TransitMacMonitor: service begin",  v12,  2);
    v11 = (uint8_t *)v10;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTransitMacMonitor beginService]", "%s\n", v10);
    if (v11 != buf) {
      free(v11);
    }
  }

  -[CLTransitMacMonitor setCurrentState:](self, "setCurrentState:", 0LL);
  -[CLTransitMacMonitor setClients:](self, "setClients:", +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  -[CLTransitMacMonitor setObservedTransitAccessPointsCache:]( self,  "setObservedTransitAccessPointsCache:",  +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  self->_wifiServiceProxy = (CLWifiServiceProtocol *) objc_msgSend( objc_msgSend( -[CLTransitMacMonitor universe](self, "universe"),  "vendor"),  "proxyForService:",  @"CLWifiService");
  sub_10034FF34((uint64_t)sub_100F26FF0, (uint64_t)self, -[CLTransitMacMonitor universe](self, "universe"), buf);
  v4 = *(Client **)buf;
  *(void *)buf = 0LL;
  value = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = v4;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    v6 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v6) {
      (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
    }
  }

  sub_1004EEF6C((uint64_t)sub_100F270E8, (uint64_t)self, -[CLTransitMacMonitor universe](self, "universe"), buf);
  v7 = *(Client **)buf;
  *(void *)buf = 0LL;
  v8 = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = v7;
  if (v8)
  {
    (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
    v9 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v9) {
      (*(void (**)(Client *))(*(void *)v9 + 8LL))(v9);
    }
  }

  self->_transitMacTileDataProviderProxy = (CLTransitMacTileDataProviderProtocol *) objc_msgSend( objc_msgSend( -[CLTransitMacMonitor universe]( self,  "universe"),  "vendor"),  "proxyForService:forClient:",  @"CLTransitMacTileDataProvider",  @"CLTransitMacMonitor");
}

- (void)endService
{
  if (qword_1019348F0 != -1) {
    dispatch_once(&qword_1019348F0, &stru_10188CF68);
  }
  objc_super v3 = (os_log_s *)qword_1019348F8;
  if (os_log_type_enabled((os_log_t)qword_1019348F8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#TransitMacMonitor: service end", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019348F0 != -1) {
      dispatch_once(&qword_1019348F0, &stru_10188CF68);
    }
    v8[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348F8,  2LL,  "#TransitMacMonitor: service end",  v8,  2);
    v7 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTransitMacMonitor endService]", "%s\n", v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  value = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  -[CLTransitMacMonitor setClients:](self, "setClients:", 0LL);
  -[CLTransitMacMonitor setObservedTransitAccessPointsCache:](self, "setObservedTransitAccessPointsCache:", 0LL);

  self->_wifiServiceProxy = 0LL;
  unint64_t v5 = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0LL;
  if (v5) {
    (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
  }

  self->_transitMacTileDataProviderProxy = 0LL;
}

- (void)startMonitoringTransitStateForClient:(id)a3
{
  if (!-[NSMutableSet count](-[CLTransitMacMonitor clients](self, "clients"), "count"))
  {
    LODWORD(v5) = 3600;
    WORD2(v5) = 257;
    objc_msgSend( *((id *)self->_wifiServiceClient.__ptr_.__value_ + 2),  "register:forNotification:registrationInfo:",  *((void *)self->_wifiServiceClient.__ptr_.__value_ + 1),  3,  0,  (void)v5,  "dwr");
    [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) register:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:12 registrationInfo:sub_10039E77C(&v5)];
    [*((id *)self->_locationClient.__ptr_.__value_ + 2) register:*((void *)self->_locationClient.__ptr_.__value_ + 1) forNotification:4 registrationInfo:0];
  }

  -[NSMutableSet addObject:](-[CLTransitMacMonitor clients](self, "clients"), "addObject:", a3);
  objc_msgSend(a3, "onTransitStateUpdate:", -[CLTransitMacMonitor currentState](self, "currentState"));
}

- (void)stopMonitoringTransitStateForClient:(id)a3
{
  if (-[NSMutableSet containsObject:]( -[CLTransitMacMonitor clients](self, "clients"),  "containsObject:",  a3))
  {
    -[NSMutableSet removeObject:](-[CLTransitMacMonitor clients](self, "clients"), "removeObject:", a3);
    if (!-[NSMutableSet count](-[CLTransitMacMonitor clients](self, "clients"), "count"))
    {
      [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:3];
      [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:12];
      [*((id *)self->_locationClient.__ptr_.__value_ + 2) unregister:*((void *)self->_locationClient.__ptr_.__value_ + 1) forNotification:4];
    }
  }

- (void)setCurrentState:(unint64_t)a3
{
  if (self->_currentState != a3)
  {
    if (qword_1019348F0 != -1) {
      dispatch_once(&qword_1019348F0, &stru_10188CF68);
    }
    __int128 v5 = (os_log_s *)qword_1019348F8;
    if (os_log_type_enabled((os_log_t)qword_1019348F8, OS_LOG_TYPE_DEBUG))
    {
      unint64_t currentState = self->_currentState;
      *(_DWORD *)buf = 134349312;
      unint64_t v25 = currentState;
      __int16 v26 = 2050;
      unint64_t v27 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "#TransitMacMonitor: transit state changed from, %{public}lu, to, %{public}lu",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019348F0 != -1) {
        dispatch_once(&qword_1019348F0, &stru_10188CF68);
      }
      unint64_t v12 = self->_currentState;
      int v20 = 134349312;
      unint64_t v21 = v12;
      __int16 v22 = 2050;
      unint64_t v23 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348F8,  2LL,  "#TransitMacMonitor: transit state changed from, %{public}lu, to, %{public}lu",  &v20,  22);
      v14 = (uint8_t *)v13;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTransitMacMonitor setCurrentState:]", "%s\n", v13);
      if (v14 != buf) {
        free(v14);
      }
    }

    self->_unint64_t currentState = a3;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    v7 = -[CLTransitMacMonitor clients](self, "clients");
    id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)i) onTransitStateUpdate:a3];
        }

        id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      }

      while (v9);
    }
  }

- (void)processNewAccessPoints:(const void *)a3 transitTileResults:(id)a4
{
  v6 = self;
  objc_msgSend(-[CLTransitMacMonitor universe](self, "universe"), "silo");
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472LL;
  v89[2] = sub_100F28290;
  v89[3] = &unk_10188CF10;
  v89[4] = CFAbsoluteTimeGetCurrent();
  -[NSMutableArray filterUsingPredicate:]( -[CLTransitMacMonitor observedTransitAccessPointsCache](v6, "observedTransitAccessPointsCache"),  "filterUsingPredicate:",  +[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v89));
  uint64_t v7 = *(void *)a3;
  v72 = v6;
  for (int i = 0; v7 != *((void *)a3 + 1); v7 += 88LL)
  {
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    id v9 = [a4 countByEnumeratingWithState:&v85 objects:v100 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v86;
      while (2)
      {
        for (j = 0LL; j != v10; j = (char *)j + 1)
        {
          if (*(void *)v86 != v11) {
            objc_enumerationMutation(a4);
          }
          v13 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)j);
          *(void *)buf = *(void *)v7;
          id v14 = (id)sub_1005B46E8((uint64_t)buf);
          if (v14 == [v13 macAddress])
          {
            v6 = v72;
            __int128 v15 = -[CLTransitMacMonitor observedTransitAccessPointsCache](v72, "observedTransitAccessPointsCache");
            __int128 v16 = objc_alloc(&OBJC_CLASS___CLTransitMacMonitorAccessPoint);
            *(void *)buf = *(void *)v7;
            -[NSMutableArray addObject:]( v15,  "addObject:",   -[CLTransitMacMonitorAccessPoint initWithMacAddress:timestamp:]( v16,  "initWithMacAddress:timestamp:",  sub_1005B46E8((uint64_t)buf),  *(double *)(v7 + 56)));
            ++i;
            goto LABEL_12;
          }
        }

        id v10 = [a4 countByEnumeratingWithState:&v85 objects:v100 count:16];
        if (v10) {
          continue;
        }
        break;
      }

      v6 = v72;
    }

- (void)onWifiServiceNotification:(int)a3 data:(uint64_t)a4
{
  void (**v7)(uint8_t *__return_ptr);
  uint64_t v8;
  uint64_t v9;
  os_log_s *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint8_t *v15;
  os_log_s *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t *v28;
  uint64_t v29;
  os_log_s *v30;
  const char *v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  const char *v38;
  uint8_t *v39;
  uint64_t v40;
  void v41[5];
  void *v42[3];
  void *__p;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  _BYTE v49[12];
  uint8_t buf[16];
  __int128 v51[101];
  objc_msgSend(objc_msgSend((id)a1, "universe"), "silo");
  double v46 = 0LL;
  double v47 = 0LL;
  double v48 = 0LL;
  if (a3 != 12)
  {
    if (a3 == 3)
    {
      uint64_t v7 = (void (**)(uint8_t *__return_ptr))[*(id *)(a1 + 8) syncgetScanResult];
      if (v7)
      {
        v7[2](buf);
        id v8 = *(void *)&buf[8];
        id v9 = *(void *)&v51[0];
      }

      else
      {
        id v9 = 0LL;
        id v8 = 0LL;
        *(_OWORD *)buf = 0u;
        v51[0] = 0u;
      }

      sub_1002DD704((uint64_t *)&v46, v8, v9, 0x2E8BA2E8BA2E8BA3LL * ((v9 - v8) >> 3));
      *(void *)double v49 = &buf[8];
      sub_100023498((void ***)v49);
    }

- (void)onLocationNotification:(int)a3 data:(_OWORD *)a4
{
  if ((a3 | 4) == 4)
  {
    uint64_t v7 = objc_alloc(&OBJC_CLASS___CLLocation);
    __int128 v8 = a4[7];
    v15[6] = a4[6];
    v15[7] = v8;
    v16[0] = a4[8];
    *(_OWORD *)((char *)v16 + 12) = *(_OWORD *)((char *)a4 + 140);
    __int128 v9 = a4[3];
    v15[2] = a4[2];
    v15[3] = v9;
    __int128 v10 = a4[5];
    v15[4] = a4[4];
    v15[5] = v10;
    __int128 v11 = a4[1];
    v15[0] = *a4;
    v15[1] = v11;
    objc_msgSend( a1,  "setMostRecentLocation:",  -[CLLocation initWithClientLocation:](v7, "initWithClientLocation:", v15));
  }

  else
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_10188CF88);
    }
    unint64_t v12 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67240192;
      int v19 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "received unhandled notification %{public, location:CLLocationProvider_Type::Notification}d",  buf,  8u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_10188CF88);
      }
      v17[0] = 67240192;
      v17[1] = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349A8,  17LL,  "received unhandled notification %{public, location:CLLocationProvider_Type::Notification}d",  v17,  8);
      id v14 = (uint8_t *)v13;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLTransitMacMonitor onLocationNotification:data:]", "%s\n", v13);
      if (v14 != buf) {
        free(v14);
      }
    }
  }

- (unint64_t)currentState
{
  return self->_currentState;
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSMutableArray)observedTransitAccessPointsCache
{
  return self->_observedTransitAccessPointsCache;
}

- (void)setObservedTransitAccessPointsCache:(id)a3
{
}

- (CLLocation)mostRecentLocation
{
  return self->_mostRecentLocation;
}

- (void)setMostRecentLocation:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  v4 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 4) = 0LL;
  return self;
}

@end