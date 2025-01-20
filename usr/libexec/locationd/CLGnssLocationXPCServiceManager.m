@interface CLGnssLocationXPCServiceManager
- (CLGnssLocationXPCServiceManager)init;
- (NSXPCConnection)connection;
- (id)getConnection;
- (id)getSynchronousRemoteObjectProxy;
- (void)configureInitializeAndStartRavenSupervisorWithPlatformInfo:(id)a3 withParametersOverrideString:(id)a4 withCompletion:(id)a5;
- (void)dealloc;
- (void)getRavenSolutionAtMCTime:(double)a3 WithReply:(id)a4;
- (void)getRavenSolutionWithReply:(id)a3;
- (void)pauseResetAndFreeRavenSupervisorWithCompletion:(id)a3;
- (void)raiseRavenEventsFromData:(id)a3;
- (void)reconfigureRavenIfNeeded;
- (void)reset;
- (void)setConnection:(id)a3;
- (void)shutdown;
@end

@implementation CLGnssLocationXPCServiceManager

- (CLGnssLocationXPCServiceManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLGnssLocationXPCServiceManager;
  v2 = -[CLGnssLocationXPCServiceManager init](&v8, "init");
  if (v2)
  {
    if (qword_1019348A0 != -1) {
      dispatch_once(&qword_1019348A0, &stru_10182FFE8);
    }
    v3 = (os_log_s *)qword_1019348A8;
    if (os_log_type_enabled((os_log_t)qword_1019348A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CLGLS,CLGnssLocationXPCServiceManager,init",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019348A0 != -1) {
        dispatch_once(&qword_1019348A0, &stru_10182FFE8);
      }
      v7[0] = 0;
      v4 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348A8,  0LL,  "CLGLS,CLGnssLocationXPCServiceManager,init",  v7,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLGnssLocationXPCServiceManager init]", "%s\n");
LABEL_19:
      if (v4 != buf) {
        free(v4);
      }
    }
  }

  else
  {
    if (qword_1019348A0 != -1) {
      dispatch_once(&qword_1019348A0, &stru_10182FFE8);
    }
    v5 = (os_log_s *)qword_1019348A8;
    if (os_log_type_enabled((os_log_t)qword_1019348A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "CLGLS,CLGnssLocationXPCServiceManager,could not initialize object",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019348A0 != -1) {
        dispatch_once(&qword_1019348A0, &stru_10182FFE8);
      }
      v7[0] = 0;
      v4 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348A8,  16LL,  "CLGLS,CLGnssLocationXPCServiceManager,could not initialize object",  v7,  2);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLGnssLocationXPCServiceManager init]", "%s\n");
      goto LABEL_19;
    }
  }

  *(_WORD *)&v2->fRavenCurrentlyRunning = 0;
  v2->fRavenPlatformInfoData = 0LL;
  v2->fRavenParametersString = 0LL;
  return v2;
}

- (id)getConnection
{
  id result = self->_connection;
  if (!result)
  {
    id result = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.corelocation.GNSSLocationService");
    self->_connection = (NSXPCConnection *)result;
    if (result)
    {
      -[NSXPCConnection setRemoteObjectInterface:]( self->_connection,  "setRemoteObjectInterface:",  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GNSSLocationServiceProtocol));
      uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
      v5 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  objc_opt_class(&OBJC_CLASS___NSData),  0LL);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( -[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v5,  "getRavenSolutionWithReply:",  0LL,  0LL);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( -[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v5,  "getRavenSolutionWithReply:",  0LL,  1LL);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( -[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v5,  "getRavenSolutionAtMCTime:WithReply:",  0LL,  0LL);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( -[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v5,  "getRavenSolutionAtMCTime:WithReply:",  0LL,  1LL);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( -[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v5,  "raiseRavenEventsFromData:",  0LL,  0LL);
      connection = self->_connection;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1002D75B8;
      v9[3] = &unk_10181A288;
      v9[4] = self;
      -[NSXPCConnection setInvalidationHandler:](connection, "setInvalidationHandler:", v9);
      v7 = self->_connection;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_1002D7760;
      v8[3] = &unk_10181A288;
      v8[4] = self;
      -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v8);
      -[NSXPCConnection activate](self->_connection, "activate");
      return self->_connection;
    }
  }

  return result;
}

- (void)dealloc
{
  if (qword_1019348A0 != -1) {
    dispatch_once(&qword_1019348A0, &stru_10182FFE8);
  }
  v3 = (os_log_s *)qword_1019348A8;
  if (os_log_type_enabled((os_log_t)qword_1019348A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLGLS,GNSSLocationService,dealloc", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019348A0 != -1) {
      dispatch_once(&qword_1019348A0, &stru_10182FFE8);
    }
    v9[0] = 0;
    v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348A8,  0LL,  "CLGLS,GNSSLocationService,dealloc",  v9,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLGnssLocationXPCServiceManager dealloc]", "%s\n", v7);
  }

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection invalidate](connection, "invalidate");
  }

  self->_connection = 0LL;
  fRavenPlatformInfoData = self->fRavenPlatformInfoData;
  if (fRavenPlatformInfoData)
  {

    self->fRavenPlatformInfoData = 0LL;
  }

  fRavenParametersString = self->fRavenParametersString;
  if (fRavenParametersString)
  {

    self->fRavenParametersString = 0LL;
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLGnssLocationXPCServiceManager;
  -[CLGnssLocationXPCServiceManager dealloc](&v8, "dealloc");
}

- (void)reconfigureRavenIfNeeded
{
  if (self->fRavenCurrentlyRunning
    && self->fConnectionInterruptedAfterRavenConfiguration
    && self->fRavenPlatformInfoData
    && self->fRavenParametersString)
  {
    if (qword_1019348A0 != -1) {
      dispatch_once(&qword_1019348A0, &stru_10182FFE8);
    }
    v3 = (os_log_s *)qword_1019348A8;
    if (os_log_type_enabled((os_log_t)qword_1019348A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLGLS,reconfigureRavenIfNeeded", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019348A0 != -1) {
        dispatch_once(&qword_1019348A0, &stru_10182FFE8);
      }
      v9[0] = 0;
      v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348A8,  0LL,  "CLGLS,reconfigureRavenIfNeeded",  v9,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLGnssLocationXPCServiceManager reconfigureRavenIfNeeded]", "%s\n", v7);
    }

    id v4 = -[CLGnssLocationXPCServiceManager getSynchronousRemoteObjectProxy](self, "getSynchronousRemoteObjectProxy");
    fRavenPlatformInfoData = self->fRavenPlatformInfoData;
    fRavenParametersString = self->fRavenParametersString;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1002D7CF8;
    v8[3] = &unk_10182FAF8;
    v8[4] = self;
    [v4 configureInitializeAndStartRavenSupervisorWithPlatformInfo:fRavenPlatformInfoData withParametersOverrideString:fRavenParametersString withCompletion:v8];
  }

- (id)getSynchronousRemoteObjectProxy
{
  return objc_msgSend( -[CLGnssLocationXPCServiceManager getConnection](self, "getConnection"),  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_10182FFA0);
}

- (void)configureInitializeAndStartRavenSupervisorWithPlatformInfo:(id)a3 withParametersOverrideString:(id)a4 withCompletion:(id)a5
{
  if (qword_1019348A0 != -1) {
    dispatch_once(&qword_1019348A0, &stru_10182FFE8);
  }
  v9 = (os_log_s *)qword_1019348A8;
  if (os_log_type_enabled((os_log_t)qword_1019348A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CLGLS,CLGnssLocationXPCServiceManager,configureInitializeAndStartRavenSupervisorWithPlatformInfo",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019348A0 != -1) {
      dispatch_once(&qword_1019348A0, &stru_10182FFE8);
    }
    v11[0] = 0;
    v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348A8,  0LL,  "CLGLS,CLGnssLocationXPCServiceManager,configureInitializeAndStartRavenSupervisorWithPlatformInfo",  v11,  2);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLGnssLocationXPCServiceManager configureInitializeAndStartRavenSupervisorWithPlatformInfo:withParametersOverrid eString:withCompletion:]",  "%s\n",  v10);
  }

  objc_msgSend( -[CLGnssLocationXPCServiceManager getSynchronousRemoteObjectProxy](self, "getSynchronousRemoteObjectProxy"),  "configureInitializeAndStartRavenSupervisorWithPlatformInfo:withParametersOverrideString:withCompletion:",  a3,  a4,  a5);
  *(_WORD *)&self->fRavenCurrentlyRunning = 1;
  self->fRavenPlatformInfoData = (NSData *)a3;
  self->fRavenParametersString = (NSString *)a4;
}

- (void)pauseResetAndFreeRavenSupervisorWithCompletion:(id)a3
{
  if (qword_1019348A0 != -1) {
    dispatch_once(&qword_1019348A0, &stru_10182FFE8);
  }
  v5 = (os_log_s *)qword_1019348A8;
  if (os_log_type_enabled((os_log_t)qword_1019348A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "CLGLS,CLGnssLocationXPCServiceManager,pauseResetAndFreeRavenSupervisor",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019348A0 != -1) {
      dispatch_once(&qword_1019348A0, &stru_10182FFE8);
    }
    v8[0] = 0;
    v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348A8,  0LL,  "CLGLS,CLGnssLocationXPCServiceManager,pauseResetAndFreeRavenSupervisor",  v8,  2);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLGnssLocationXPCServiceManager pauseResetAndFreeRavenSupervisorWithCompletion:]",  "%s\n",  v6);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002D8430;
  v7[3] = &unk_10182FB20;
  v7[4] = self;
  v7[5] = a3;
  objc_msgSend( -[CLGnssLocationXPCServiceManager getSynchronousRemoteObjectProxy](self, "getSynchronousRemoteObjectProxy"),  "pauseResetAndFreeRavenSupervisorWithCompletion:",  v7);
}

- (void)getRavenSolutionAtMCTime:(double)a3 WithReply:(id)a4
{
  if (qword_1019348A0 != -1) {
    dispatch_once(&qword_1019348A0, &stru_10182FFE8);
  }
  v7 = (os_log_s *)qword_1019348A8;
  if (os_log_type_enabled((os_log_t)qword_1019348A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    double v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "CLGLS,CLGnssLocationXPCServiceManager,getRavenSolutionAtMCTimeWithReply,%{public}.2lf",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019348A0 != -1) {
      dispatch_once(&qword_1019348A0, &stru_10182FFE8);
    }
    int v10 = 134349056;
    double v11 = a3;
    objc_super v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348A8,  0LL,  "CLGLS,CLGnssLocationXPCServiceManager,getRavenSolutionAtMCTimeWithReply,%{public}.2lf",  &v10,  12);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLGnssLocationXPCServiceManager getRavenSolutionAtMCTime:WithReply:]",  "%s\n",  v8);
  }

  -[CLGnssLocationXPCServiceManager reconfigureRavenIfNeeded](self, "reconfigureRavenIfNeeded");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002D8668;
  v9[3] = &unk_10182FFC8;
  v9[4] = a4;
  objc_msgSend( -[CLGnssLocationXPCServiceManager getSynchronousRemoteObjectProxy](self, "getSynchronousRemoteObjectProxy"),  "getRavenSolutionAtMCTime:WithReply:",  v9,  a3);
}

- (void)getRavenSolutionWithReply:(id)a3
{
  if (qword_1019348A0 != -1) {
    dispatch_once(&qword_1019348A0, &stru_10182FFE8);
  }
  v5 = (os_log_s *)qword_1019348A8;
  if (os_log_type_enabled((os_log_t)qword_1019348A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "CLGLS,CLGnssLocationXPCServiceManager,getRavenSolutionAtMCTimeWithReply",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019348A0 != -1) {
      dispatch_once(&qword_1019348A0, &stru_10182FFE8);
    }
    v8[0] = 0;
    v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348A8,  0LL,  "CLGLS,CLGnssLocationXPCServiceManager,getRavenSolutionAtMCTimeWithReply",  v8,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLGnssLocationXPCServiceManager getRavenSolutionWithReply:]", "%s\n", v6);
  }

  -[CLGnssLocationXPCServiceManager reconfigureRavenIfNeeded](self, "reconfigureRavenIfNeeded");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002D8850;
  v7[3] = &unk_10182FFC8;
  v7[4] = a3;
  objc_msgSend( -[CLGnssLocationXPCServiceManager getSynchronousRemoteObjectProxy](self, "getSynchronousRemoteObjectProxy"),  "getRavenSolutionWithReply:",  v7);
}

- (void)raiseRavenEventsFromData:(id)a3
{
}

- (void)reset
{
  if (qword_1019348A0 != -1) {
    dispatch_once(&qword_1019348A0, &stru_10182FFE8);
  }
  v3 = (os_log_s *)qword_1019348A8;
  if (os_log_type_enabled((os_log_t)qword_1019348A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLGLS,GNSSLocationService,reset", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019348A0 != -1) {
      dispatch_once(&qword_1019348A0, &stru_10182FFE8);
    }
    v7[0] = 0;
    v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348A8,  0LL,  "CLGLS,GNSSLocationService,reset",  v7,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLGnssLocationXPCServiceManager reset]", "%s\n", v6);
  }

  fRavenPlatformInfoData = self->fRavenPlatformInfoData;
  if (fRavenPlatformInfoData)
  {

    self->fRavenPlatformInfoData = 0LL;
  }

  fRavenParametersString = self->fRavenParametersString;
  if (fRavenParametersString)
  {

    self->fRavenParametersString = 0LL;
  }

  self->fRavenCurrentlyRunning = 0;
}

- (void)shutdown
{
  if (self->_connection)
  {
    if (qword_1019348A0 != -1) {
      dispatch_once(&qword_1019348A0, &stru_10182FFE8);
    }
    v3 = (os_log_s *)qword_1019348A8;
    if (os_log_type_enabled((os_log_t)qword_1019348A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CLGLS,GNSSLocationService,invalidating connection",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019348A0 != -1) {
        dispatch_once(&qword_1019348A0, &stru_10182FFE8);
      }
      v5[0] = 0;
      id v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348A8,  0LL,  "CLGLS,GNSSLocationService,invalidating connection",  v5,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLGnssLocationXPCServiceManager shutdown]", "%s\n", v4);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

@end