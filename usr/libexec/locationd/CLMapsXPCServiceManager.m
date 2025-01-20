@interface CLMapsXPCServiceManager
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (NSXPCConnection)connection;
- (void)clearMemoryAndExitHelperProcessCleanly;
- (void)collectMapDataOfType:(int64_t)a3 aroundCoordinate:(CLLocationCoordinate2D)a4 inRadius:(double)a5 allowNetwork:(BOOL)a6 isPedestrianOrCycling:(BOOL)a7 clearTiles:(BOOL)a8 callSynchronously:(BOOL)a9 WithReply:(id)a10;
- (void)createConnection;
- (void)dealloc;
- (void)onTimerFire:(id)a3;
- (void)releaseMapHelperServiceOSTransaction;
- (void)setConnection:(id)a3;
- (void)updateTimer;
@end

@implementation CLMapsXPCServiceManager

+ (id)sharedInstance
{
  if (!qword_101999370)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10093E200;
    block[3] = &unk_10181A288;
    block[4] = a1;
    if (qword_101999378 != -1) {
      dispatch_once(&qword_101999378, block);
    }
    if (qword_1019348C0 != -1) {
      dispatch_once(&qword_1019348C0, &stru_101861BD0);
    }
    v2 = (os_log_s *)qword_1019348C8;
    if (os_log_type_enabled((os_log_t)qword_1019348C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,XPCManager allocate", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019348C0 != -1) {
        dispatch_once(&qword_1019348C0, &stru_101861BD0);
      }
      __int16 v6 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348C8,  0LL,  "CLMM,CLTSP,XPCManager allocate",  &v6,  2);
      v5 = (uint8_t *)v4;
      sub_10029211C("Generic", 1LL, 0, 2LL, "+[CLMapsXPCServiceManager sharedInstance]", "%s\n", v4);
      if (v5 != buf) {
        free(v5);
      }
    }
  }

  return (id)qword_101999370;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return objc_msgSend(a1, "sharedInstance", a3);
}

- (void)createConnection
{
  connection = self->_connection;
  if (connection)
  {

    self->_connection = 0LL;
  }

  v4 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.corelocation.maphelperservice");
  self->_connection = v4;
  if (v4)
  {
    self->fInactivityTimer = 0LL;
    self->fTimerUpdateMachContTime = -1.0;
    -[NSXPCConnection setRemoteObjectInterface:]( self->_connection,  "setRemoteObjectInterface:",  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CLMapHelperServiceProtocol));
    objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v6 = v5;
    objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v8 = v7;
    objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v10 = v9;
    *(void *)&double v11 = objc_opt_class(&OBJC_CLASS___NSNumber).n128_u64[0];
    v13 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v6, v11, v8, v10, v12, 0LL);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( -[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v13,  "fetchGEORoadDataAroundCoordinate:inRadius:allowNetwork:isPedestrianOrCycling:clearTiles:withReply:",  0LL,  1LL);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( -[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v13,  "fetchGEOBuildingDataAroundCoordinate:inRadius:tileSetStyle:allowNetwork:clearTiles:withReply:",  0LL,  1LL);
    -[NSXPCConnection resume](self->_connection, "resume");
  }

  if (qword_1019348C0 != -1) {
    dispatch_once(&qword_1019348C0, &stru_101861BD0);
  }
  v14 = (os_log_s *)qword_1019348C8;
  if (os_log_type_enabled((os_log_t)qword_1019348C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "CLMM,CLTSP,MapHelperService,createConnection",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019348C0 != -1) {
      dispatch_once(&qword_1019348C0, &stru_101861BD0);
    }
    v18[0] = 0;
    LODWORD(v17) = 2;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348C8,  0LL,  "CLMM,CLTSP,MapHelperService,createConnection",  v18,  v17);
    v16 = (uint8_t *)v15;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMapsXPCServiceManager createConnection]", "%s\n", v15);
    if (v16 != buf) {
      free(v16);
    }
  }

- (void)dealloc
{
  if (qword_1019348C0 != -1) {
    dispatch_once(&qword_1019348C0, &stru_101861BD0);
  }
  v3 = (os_log_s *)qword_1019348C8;
  if (os_log_type_enabled((os_log_t)qword_1019348C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,dealloc", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019348C0 != -1) {
      dispatch_once(&qword_1019348C0, &stru_101861BD0);
    }
    v7[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348C8,  0LL,  "CLMM,CLTSP,MapHelperService,dealloc",  v7,  2);
    uint64_t v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMapsXPCServiceManager dealloc]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  -[CLMapsXPCServiceManager releaseMapHelperServiceOSTransaction](self, "releaseMapHelperServiceOSTransaction");
  -[NSXPCConnection invalidate](-[CLMapsXPCServiceManager connection](self, "connection"), "invalidate");

  -[CLMapsXPCServiceManager setConnection:](self, "setConnection:", 0LL);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLMapsXPCServiceManager;
  -[CLMapsXPCServiceManager dealloc](&v6, "dealloc");
}

- (void)collectMapDataOfType:(int64_t)a3 aroundCoordinate:(CLLocationCoordinate2D)a4 inRadius:(double)a5 allowNetwork:(BOOL)a6 isPedestrianOrCycling:(BOOL)a7 clearTiles:(BOOL)a8 callSynchronously:(BOOL)a9 WithReply:(id)a10
{
  BOOL v11 = a9;
  BOOL v12 = a8;
  BOOL v13 = a7;
  BOOL v14 = a6;
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  -[CLMapsXPCServiceManager updateTimer](self, "updateTimer");
  connection = self->_connection;
  if (v11)
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10093E904;
    v32[3] = &unk_101861B48;
    v32[4] = a10;
    id v21 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v32);
  }

  else
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10093EB3C;
    v31[3] = &unk_101861B48;
    v31[4] = a10;
    id v21 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v31);
  }

  v22 = v21;
  v30[0] = 0LL;
  v30[1] = v30;
  v30[2] = 0x2020000000LL;
  v30[3] = sub_101171D4C();
  if (a3 == 2)
  {
    v26 = _NSConcreteStackBlock;
    uint64_t v23 = 1LL;
    v24 = sub_10093F2F4;
    v25 = &v26;
LABEL_10:
    v25[1] = (void **)3221225472LL;
    v25[2] = (void **)v24;
    v25[3] = (void **)&unk_101861B70;
    *((double *)v25 + 6) = latitude;
    *((double *)v25 + 7) = longitude;
    *((double *)v25 + 8) = a5;
    *((_BYTE *)v25 + 72) = v11;
    v25[4] = (void **)a10;
    v25[5] = (void **)v30;
    objc_msgSend( v22,  "fetchGEOBuildingDataAroundCoordinate:inRadius:tileSetStyle:allowNetwork:clearTiles:withReply:",  v23,  v14,  v12,  latitude,  longitude,  a5,  v26);
    goto LABEL_12;
  }

  if (a3 == 1)
  {
    uint64_t v23 = 0LL;
    v27 = _NSConcreteStackBlock;
    v24 = sub_10093F034;
    v25 = &v27;
    goto LABEL_10;
  }

  if (a3)
  {
    (*((void (**)(id, void))a10 + 2))(a10, 0LL);
  }

  else
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10093ED74;
    v28[3] = &unk_101861B70;
    *(double *)&v28[6] = latitude;
    *(double *)&v28[7] = longitude;
    *(double *)&v28[8] = a5;
    BOOL v29 = v11;
    v28[4] = a10;
    v28[5] = v30;
    objc_msgSend( v22,  "fetchGEORoadDataAroundCoordinate:inRadius:allowNetwork:isPedestrianOrCycling:clearTiles:withReply:",  v14,  v13,  v12,  v28,  latitude,  longitude,  a5);
  }

- (void)clearMemoryAndExitHelperProcessCleanly
{
  if (qword_101999370)
  {
    _objc_msgSend( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connection,  "remoteObjectProxyWithErrorHandler:",  &stru_101861B90),  "clearMemoryAndExitCleanly");
  }

  else
  {
    if (qword_1019348C0 != -1) {
      dispatch_once(&qword_1019348C0, &stru_101861BD0);
    }
    v2 = (os_log_s *)qword_1019348C8;
    if (os_log_type_enabled((os_log_t)qword_1019348C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "CLMM,CLTSP,MapHelperService,clearMemoryAndExitHelperProcessCleanly,sharedInstance is nil",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019348C0 != -1) {
        dispatch_once(&qword_1019348C0, &stru_101861BD0);
      }
      v5[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348C8,  0LL,  "CLMM,CLTSP,MapHelperService,clearMemoryAndExitHelperProcessCleanly,sharedInstance is nil",  v5,  2);
      v4 = (uint8_t *)v3;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMapsXPCServiceManager clearMemoryAndExitHelperProcessCleanly]",  "%s\n",  v3);
      if (v4 != buf) {
        free(v4);
      }
    }
  }

- (void)updateTimer
{
  if (self->fTimerUpdateMachContTime <= 0.0 || vabdd_f64(sub_101171D4C(), self->fTimerUpdateMachContTime) >= 60.0)
  {
    self->double fTimerUpdateMachContTime = sub_101171D4C();
    fInactivityTimer = self->fInactivityTimer;
    if (fInactivityTimer)
    {
      -[NSTimer invalidate](fInactivityTimer, "invalidate");
      self->fInactivityTimer = 0LL;
    }

    if (qword_1019348C0 != -1) {
      dispatch_once(&qword_1019348C0, &stru_101861BD0);
    }
    v4 = (os_log_s *)qword_1019348C8;
    if (os_log_type_enabled((os_log_t)qword_1019348C8, OS_LOG_TYPE_DEFAULT))
    {
      double fTimerUpdateMachContTime = self->fTimerUpdateMachContTime;
      *(_DWORD *)buf = 134349056;
      double v13 = fTimerUpdateMachContTime;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "CLMM,CLTSP,MapHelperService,Inactivity timer updated in XPC manager,updateTime,%{public}.2lf",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019348C0 != -1) {
        dispatch_once(&qword_1019348C0, &stru_101861BD0);
      }
      double v6 = self->fTimerUpdateMachContTime;
      int v10 = 134349056;
      double v11 = v6;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348C8,  0LL,  "CLMM,CLTSP,MapHelperService,Inactivity timer updated in XPC manager,updateTime,%{public}.2lf",  &v10,  12);
      uint64_t v8 = (uint8_t *)v7;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMapsXPCServiceManager updateTimer]", "%s\n", v7);
      if (v8 != buf) {
        free(v8);
      }
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10093FBD4;
    block[3] = &unk_10181A288;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

- (void)onTimerFire:(id)a3
{
  if (qword_1019348C0 != -1) {
    dispatch_once(&qword_1019348C0, &stru_101861BD0);
  }
  v4 = (os_log_s *)qword_1019348C8;
  if (os_log_type_enabled((os_log_t)qword_1019348C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "CLMM,CLTSP,MapHelperService,onTimerFire",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019348C0 != -1) {
      dispatch_once(&qword_1019348C0, &stru_101861BD0);
    }
    v7[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348C8,  0LL,  "CLMM,CLTSP,MapHelperService,onTimerFire",  v7,  2);
    double v6 = (uint8_t *)v5;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMapsXPCServiceManager onTimerFire:]", "%s\n", v5);
    if (v6 != buf) {
      free(v6);
    }
  }

  -[CLMapsXPCServiceManager releaseMapHelperServiceOSTransaction](self, "releaseMapHelperServiceOSTransaction");
}

- (void)releaseMapHelperServiceOSTransaction
{
  if (qword_1019348C0 != -1) {
    dispatch_once(&qword_1019348C0, &stru_101861BD0);
  }
  v3 = (os_log_s *)qword_1019348C8;
  if (os_log_type_enabled((os_log_t)qword_1019348C8, OS_LOG_TYPE_DEFAULT))
  {
    double fTimerUpdateMachContTime = self->fTimerUpdateMachContTime;
    *(_DWORD *)buf = 134349056;
    double v16 = fTimerUpdateMachContTime;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CLMM,CLTSP,MapHelperService,releaseMapHelperServiceOSTransaction,lastTimerUpdateTime,%{public}.2lf",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019348C0 != -1) {
      dispatch_once(&qword_1019348C0, &stru_101861BD0);
    }
    double v7 = self->fTimerUpdateMachContTime;
    int v13 = 134349056;
    double v14 = v7;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348C8,  0LL,  "CLMM,CLTSP,MapHelperService,releaseMapHelperServiceOSTransaction,lastTimerUpdateTime,%{public}.2lf",  &v13,  12);
    uint64_t v9 = (uint8_t *)v8;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMapsXPCServiceManager releaseMapHelperServiceOSTransaction]", "%s\n", v8);
    if (v9 != buf) {
      free(v9);
    }
  }

  fInactivityTimer = self->fInactivityTimer;
  if (fInactivityTimer)
  {
    -[NSTimer invalidate](fInactivityTimer, "invalidate");
    self->fInactivityTimer = 0LL;
    self->double fTimerUpdateMachContTime = -1.0;
  }

  if (qword_101999370)
  {
    objc_msgSend( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connection,  "remoteObjectProxyWithErrorHandler:",  &stru_101861BB0),  "releaseOSTransaction");
  }

  else
  {
    if (qword_1019348C0 != -1) {
      dispatch_once(&qword_1019348C0, &stru_101861BD0);
    }
    double v6 = (os_log_s *)qword_1019348C8;
    if (os_log_type_enabled((os_log_t)qword_1019348C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CLMM,CLTSP,MapHelperService,clearMemoryAndExitHelperProcessCleanly,sharedInstance is nil",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019348C0 != -1) {
        dispatch_once(&qword_1019348C0, &stru_101861BD0);
      }
      LOWORD(v13) = 0;
      LODWORD(v12) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348C8,  0LL,  "CLMM,CLTSP,MapHelperService,clearMemoryAndExitHelperProcessCleanly,sharedInstance is nil",  &v13,  v12);
      double v11 = (uint8_t *)v10;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMapsXPCServiceManager releaseMapHelperServiceOSTransaction]",  "%s\n",  v10);
      if (v11 != buf) {
        free(v11);
      }
    }
  }

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

@end