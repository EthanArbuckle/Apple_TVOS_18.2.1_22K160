@interface CLAudioAccessoryService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLAudioAccessoryService)init;
- (NSDictionary)latestData;
- (NSMutableSet)clients;
- (void)beginService;
- (void)endService;
- (void)fireMotionAlarm;
- (void)onAudioAccessoryInterfaceDailyUsageCallback:(int)a3 data:(id)a4;
- (void)registerForUsageMetricsUpdates:(id)a3;
- (void)setClients:(id)a3;
- (void)setLatestData:(id)a3;
- (void)unregisterForUsageMetricsUpdates:(id)a3;
@end

@implementation CLAudioAccessoryService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199F5F0 != -1) {
    dispatch_once(&qword_10199F5F0, &stru_10188D890);
  }
  return (id)qword_10199F5E8;
}

- (CLAudioAccessoryService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAudioAccessoryService;
  return -[CLAudioAccessoryService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLAudioAccessoryServiceProtocol,  &OBJC_PROTOCOL___CLAudioAccessoryServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_10199F600 != -1) {
    dispatch_once(&qword_10199F600, &stru_10188D8B0);
  }
  return byte_10199F5F8;
}

- (void)beginService
{
  if (qword_1019345C0 != -1) {
    dispatch_once(&qword_1019345C0, &stru_10188D8D0);
  }
  objc_super v3 = (os_log_s *)qword_1019345C8;
  if (os_log_type_enabled((os_log_t)qword_1019345C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[HeadphoneUsage] Starting up CLAudioAccessoryService",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345C0 != -1) {
      dispatch_once(&qword_1019345C0, &stru_10188D8D0);
    }
    v7[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345C8,  0LL,  "[HeadphoneUsage] Starting up CLAudioAccessoryService",  v7,  2);
    v6 = (uint8_t *)v5;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAudioAccessoryService beginService]", "%s\n", v5);
    if (v6 != buf) {
      free(v6);
    }
  }

  uint64_t v4 = sub_1002E6920();
  sub_1002E9194(v4, (uint64_t)sub_100F461AC, (uint64_t)self);
  -[CLAudioAccessoryService setClients:](self, "setClients:", objc_opt_new(&OBJC_CLASS___NSMutableSet));
  -[CLAudioAccessoryService setLatestData:](self, "setLatestData:", 0LL);
}

- (void)endService
{
  if (qword_1019345C0 != -1) {
    dispatch_once(&qword_1019345C0, &stru_10188D8D0);
  }
  objc_super v3 = (os_log_s *)qword_1019345C8;
  if (os_log_type_enabled((os_log_t)qword_1019345C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[HeadphoneUsage] Shutting down CLAudioAccessoryService",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345C0 != -1) {
      dispatch_once(&qword_1019345C0, &stru_10188D8D0);
    }
    v7[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345C8,  0LL,  "[HeadphoneUsage] Shutting down CLAudioAccessoryService",  v7,  2);
    v6 = (uint8_t *)v5;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAudioAccessoryService endService]", "%s\n", v5);
    if (v6 != buf) {
      free(v6);
    }
  }

  uint64_t v4 = sub_1002E6920();
  sub_1002E91E4(v4, (uint64_t)self);

  -[CLAudioAccessoryService setClients:](self, "setClients:", 0LL);
  -[CLAudioAccessoryService setLatestData:](self, "setLatestData:", 0LL);
}

- (void)registerForUsageMetricsUpdates:(id)a3
{
  if (qword_1019345C0 != -1) {
    dispatch_once(&qword_1019345C0, &stru_10188D8D0);
  }
  unint64_t v5 = (os_log_s *)qword_1019345C8;
  if (os_log_type_enabled((os_log_t)qword_1019345C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[HeadphoneUsage] AccessoryService - registerForUsageMetricsUpdates %@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345C0 != -1) {
      dispatch_once(&qword_1019345C0, &stru_10188D8D0);
    }
    int v12 = 138412290;
    id v13 = a3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345C8,  0LL,  "[HeadphoneUsage] AccessoryService - registerForUsageMetricsUpdates %@",  &v12,  12);
    v8 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAudioAccessoryService registerForUsageMetricsUpdates:]", "%s\n", v7);
    if (v8 != buf) {
      free(v8);
    }
  }

  -[NSMutableSet addObject:](-[CLAudioAccessoryService clients](self, "clients"), "addObject:", a3);
  if (-[CLAudioAccessoryService latestData](self, "latestData"))
  {
    if (qword_1019345C0 != -1) {
      dispatch_once(&qword_1019345C0, &stru_10188D8D0);
    }
    v6 = (os_log_s *)qword_1019345C8;
    if (os_log_type_enabled((os_log_t)qword_1019345C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[HeadphoneUsage] Sending cached data",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019345C0 != -1) {
        dispatch_once(&qword_1019345C0, &stru_10188D8D0);
      }
      LOWORD(v12) = 0;
      LODWORD(v11) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345C8,  0LL,  "[HeadphoneUsage] Sending cached data",  &v12,  v11);
      v10 = (uint8_t *)v9;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAudioAccessoryService registerForUsageMetricsUpdates:]", "%s\n", v9);
      if (v10 != buf) {
        free(v10);
      }
    }

    objc_msgSend(a3, "onUsageMetricsEvent:", -[CLAudioAccessoryService latestData](self, "latestData"));
  }

- (void)unregisterForUsageMetricsUpdates:(id)a3
{
  if (qword_1019345C0 != -1) {
    dispatch_once(&qword_1019345C0, &stru_10188D8D0);
  }
  unint64_t v5 = (os_log_s *)qword_1019345C8;
  if (os_log_type_enabled((os_log_t)qword_1019345C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[HeadphoneUsage] AccessoryService - unregisterForUsageMetricsUpdates %@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345C0 != -1) {
      dispatch_once(&qword_1019345C0, &stru_10188D8D0);
    }
    int v8 = 138412290;
    id v9 = a3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345C8,  0LL,  "[HeadphoneUsage] AccessoryService - unregisterForUsageMetricsUpdates %@",  &v8,  12);
    v7 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAudioAccessoryService unregisterForUsageMetricsUpdates:]", "%s\n", v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  -[NSMutableSet removeObject:](-[CLAudioAccessoryService clients](self, "clients"), "removeObject:", a3);
}

- (void)onAudioAccessoryInterfaceDailyUsageCallback:(int)a3 data:(id)a4
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (qword_1019345C0 != -1) {
    dispatch_once(&qword_1019345C0, &stru_10188D8D0);
  }
  int v8 = (os_log_s *)qword_1019345C8;
  if (os_log_type_enabled((os_log_t)qword_1019345C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v36 = a3;
    *(_WORD *)&v36[4] = 2048;
    *(void *)&v36[6] = -[NSMutableSet count](-[CLAudioAccessoryService clients](self, "clients"), "count");
    __int16 v37 = 1024;
    int v38 = (int)Current;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[HeadphoneUsage] Service received bluetooth event:%d, numClients:%lu, timestamp:%d",  buf,  0x18u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345C0 != -1) {
      dispatch_once(&qword_1019345C0, &stru_10188D8D0);
    }
    uint64_t v20 = qword_1019345C8;
    int v31 = 67109632;
    *(_DWORD *)v32 = a3;
    *(_WORD *)&v32[4] = 2048;
    *(void *)&v32[6] = -[NSMutableSet count](-[CLAudioAccessoryService clients](self, "clients"), "count");
    __int16 v33 = 1024;
    int v34 = (int)Current;
    LODWORD(v23) = 24;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v20,  0LL,  "[HeadphoneUsage] Service received bluetooth event:%d, numClients:%lu, timestamp:%d",  &v31,  v23,  v24);
    v22 = (uint8_t *)v21;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAudioAccessoryService onAudioAccessoryInterfaceDailyUsageCallback:data:]",  "%s\n",  v21);
    if (v22 != buf) {
      free(v22);
    }
  }

  -[CLAudioAccessoryService fireMotionAlarm](self, "fireMotionAlarm");
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (int)Current),  @"timestamp_received_on_companion");
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v25 = self;
  v10 = -[CLAudioAccessoryService clients](self, "clients");
  id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v14);
        if (qword_1019345C0 != -1) {
          dispatch_once(&qword_1019345C0, &stru_10188D8D0);
        }
        v16 = (os_log_s *)qword_1019345C8;
        if (os_log_type_enabled((os_log_t)qword_1019345C8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v36 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "[HeadphoneUsage] AccessoryService - Notifying client %@",  buf,  0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019345C0 != -1) {
            dispatch_once(&qword_1019345C0, &stru_10188D8D0);
          }
          int v31 = 138412290;
          *(void *)v32 = v15;
          LODWORD(v23) = 12;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345C8,  2LL,  "[HeadphoneUsage] AccessoryService - Notifying client %@",  &v31,  v23);
          v18 = (uint8_t *)v17;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAudioAccessoryService onAudioAccessoryInterfaceDailyUsageCallback:data:]",  "%s\n",  v17);
          if (v18 != buf) {
            free(v18);
          }
        }

        [v15 onUsageMetricsEvent:v9];
        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
      id v12 = v19;
    }

    while (v19);
  }

  -[CLAudioAccessoryService setLatestData:](v25, "setLatestData:", v9);
}

- (void)fireMotionAlarm
{
  id v2 = objc_msgSend( objc_msgSend(-[CLAudioAccessoryService universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLMotionAlarmNotifier");
  if (qword_1019345C0 != -1) {
    dispatch_once(&qword_1019345C0, &stru_10188D8D0);
  }
  objc_super v3 = (os_log_s *)qword_1019345C8;
  if (os_log_type_enabled((os_log_t)qword_1019345C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[HeadphoneUsage] Firing motion alarm kCMMotionAlarmTriggerTypeMetricsEvent",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345C0 != -1) {
      dispatch_once(&qword_1019345C0, &stru_10188D8D0);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345C8,  0LL,  "[HeadphoneUsage] Firing motion alarm kCMMotionAlarmTriggerTypeMetricsEvent",  v6,  2);
    unint64_t v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAudioAccessoryService fireMotionAlarm]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  [v2 fireEventAlarm:27];
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSDictionary)latestData
{
  return self->_latestData;
}

- (void)setLatestData:(id)a3
{
}

@end