@interface CLSimulationControllerAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CLSimulationControllerAdapter)init;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (void)appendSimulatedLocations:(id)a3;
- (void)beginService;
- (void)clearSimulatedLocations;
- (void)controller;
- (void)endService;
- (void)getFencesForBundleID:(id)a3 withReply:(id)a4;
- (void)isInEmegencyState:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setController:(void *)a3;
- (void)setIntermediateLocationDistance:(double)a3;
- (void)setListener:(id)a3;
- (void)setLocationDeliveryBehavior:(unsigned __int8)a3;
- (void)setLocationInterval:(double)a3;
- (void)setLocationRepeatBehavior:(unsigned __int8)a3;
- (void)setLocationTravellingSpeed:(double)a3;
- (void)setSimulationScenario:(id)a3;
- (void)simulateBeaconWithProximityUUID:(id)a3 major:(int64_t)a4 minor:(int64_t)a5 eventType:(unsigned __int8)a6;
- (void)simulateFenceWithBundleID:(id)a3 andFenceID:(id)a4 eventType:(unsigned __int8)a5 atLocation:(id)a6;
- (void)simulateSignificantLocationChange:(id)a3;
- (void)simulateVisit:(id)a3;
- (void)startLocationSimulation;
- (void)stopLocationSimulation;
@end

@implementation CLSimulationControllerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101999250 != -1) {
    dispatch_once(&qword_101999250, &stru_10185F8D0);
  }
  return (id)qword_101999248;
}

- (CLSimulationControllerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLSimulationControllerAdapter;
  return -[CLSimulationControllerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLSimulationControllerProtocol,  &OBJC_PROTOCOL___CLSimulationControllerClientProtocol);
}

- (void)beginService
{
  if (qword_1019349F0 != -1) {
    dispatch_once(&qword_1019349F0, &stru_10185F918);
  }
  objc_super v3 = (os_log_s *)qword_1019349F8;
  if (os_log_type_enabled((os_log_t)qword_1019349F8, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 68289026;
    int v8 = 0;
    __int16 v9 = 2082;
    v10 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Beginning Simulation Service}",  (uint8_t *)&v7,  0x12u);
  }

  v4 = operator new(0x6D8uLL);
  sub_1008DD184((uint64_t)v4, -[CLSimulationControllerAdapter universe](self, "universe"));
  self->_controller = v4;
  self->_listener = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.locationd.simulation");
  if (qword_1019349F0 != -1) {
    dispatch_once(&qword_1019349F0, &stru_10185F918);
  }
  unint64_t v5 = (os_log_s *)qword_1019349F8;
  if (os_log_type_enabled((os_log_t)qword_1019349F8, OS_LOG_TYPE_DEFAULT))
  {
    listener = self->_listener;
    int v7 = 68289282;
    int v8 = 0;
    __int16 v9 = 2082;
    v10 = "";
    __int16 v11 = 2114;
    v12 = listener;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Do we have a listener?, listtner:%{public, location:escape_only}@}",  (uint8_t *)&v7,  0x1Cu);
  }

  -[NSXPCListener _setQueue:]( -[CLSimulationControllerAdapter listener](self, "listener"),  "_setQueue:",  objc_msgSend(-[CLSimulationControllerAdapter silo](self, "silo"), "queue"));
  -[NSXPCListener setDelegate:](-[CLSimulationControllerAdapter listener](self, "listener"), "setDelegate:", self);
  -[NSXPCListener resume](-[CLSimulationControllerAdapter listener](self, "listener"), "resume");
}

- (void)endService
{
  controller = self->_controller;
  if (controller)
  {
    objc_super v3 = (void *)sub_1008DE318((uint64_t)controller);
    operator delete(v3);
  }

- (void)isInEmegencyState:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1019349F0 != -1) {
    dispatch_once(&qword_1019349F0, &stru_10185F918);
  }
  unint64_t v5 = (os_log_s *)qword_1019349F8;
  if (os_log_type_enabled((os_log_t)qword_1019349F8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    int v8 = "";
    __int16 v9 = 1026;
    BOOL v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:received daemon-side update for isInEmegency, isEmergencyState:%{public}hhd}",  (uint8_t *)v6,  0x18u);
  }

  sub_1008DBB14((uint64_t)self->_controller, v3);
}

- (void)stopLocationSimulation
{
  if (qword_1019349F0 != -1) {
    dispatch_once(&qword_1019349F0, &stru_10185F918);
  }
  BOOL v3 = (os_log_s *)qword_1019349F8;
  if (os_log_type_enabled((os_log_t)qword_1019349F8, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:received daemon-side request to stop location simulation}",  (uint8_t *)v4,  0x12u);
  }

  sub_1008DBC3C((uint64_t)self->_controller);
}

- (void)startLocationSimulation
{
  if (qword_1019349F0 != -1) {
    dispatch_once(&qword_1019349F0, &stru_10185F918);
  }
  BOOL v3 = (os_log_s *)qword_1019349F8;
  if (os_log_type_enabled((os_log_t)qword_1019349F8, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:received daemon-side request to start location simulation}",  (uint8_t *)v4,  0x12u);
  }

  sub_1008DBE30((uint64_t)self->_controller);
}

- (void)setSimulationScenario:(id)a3
{
}

- (void)appendSimulatedLocations:(id)a3
{
  if (qword_1019349F0 != -1) {
    dispatch_once(&qword_1019349F0, &stru_10185F918);
  }
  __int16 v5 = (os_log_s *)qword_1019349F8;
  if (os_log_type_enabled((os_log_t)qword_1019349F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(void *)&buf[10] = "";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Reveived daemon-side request to append simulated location}",  buf,  0x12u);
  }

  v21[0] = v21;
  v21[1] = v21;
  uint64_t v22 = 0LL;
  if (a3)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v6 = [a3 countByEnumeratingWithState:&v17 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(a3);
          }
          __int16 v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          if (v9)
          {
            [v9 clientLocation];
          }

          else
          {
            __int128 v29 = 0u;
            memset(v30, 0, 28);
            __int128 v27 = 0u;
            __int128 v28 = 0u;
            __int128 v25 = 0u;
            __int128 v26 = 0u;
            __int128 v24 = 0u;
            memset(buf, 0, sizeof(buf));
          }

          BOOL v10 = operator new(0xB0uLL);
          __int128 v11 = v29;
          v10[7] = v28;
          v10[8] = v11;
          v10[9] = v30[0];
          *(_OWORD *)((char *)v10 + 156) = *(_OWORD *)((char *)v30 + 12);
          __int128 v12 = v25;
          v10[3] = v24;
          v10[4] = v12;
          __int128 v13 = v27;
          v10[5] = v26;
          v10[6] = v13;
          __int128 v14 = *(_OWORD *)&buf[16];
          v10[1] = *(_OWORD *)buf;
          v10[2] = v14;
          uint64_t v15 = v21[0];
          *(void *)BOOL v10 = v21[0];
          *((void *)v10 + 1) = v21;
          *(void *)(v15 + 8) = v10;
          v21[0] = v10;
          ++v22;
        }

        id v6 = [a3 countByEnumeratingWithState:&v17 objects:v31 count:16];
      }

      while (v6);
    }
  }

  controller = (uint64_t *)self->_controller;
  sub_1008DFAD8((uint64_t)controller);
  sub_1008DF64C(controller, (uint64_t)v21);
  sub_1001B4C40(v21);
}

- (void)clearSimulatedLocations
{
}

- (void)setLocationDeliveryBehavior:(unsigned __int8)a3
{
}

- (void)setLocationRepeatBehavior:(unsigned __int8)a3
{
}

- (void)setIntermediateLocationDistance:(double)a3
{
  double v3 = a3;
  sub_1008DC480((uint64_t)self->_controller, &v3);
}

- (void)setLocationInterval:(double)a3
{
  double v3 = a3;
  sub_1008DC5AC((uint64_t)self->_controller, &v3);
}

- (void)setLocationTravellingSpeed:(double)a3
{
  double v3 = a3;
  sub_1008DC6D8((uint64_t)self->_controller, &v3);
}

- (void)simulateVisit:(id)a3
{
}

- (void)simulateSignificantLocationChange:(id)a3
{
}

- (void)getFencesForBundleID:(id)a3 withReply:(id)a4
{
}

- (void)simulateFenceWithBundleID:(id)a3 andFenceID:(id)a4 eventType:(unsigned __int8)a5 atLocation:(id)a6
{
}

- (void)simulateBeaconWithProximityUUID:(id)a3 major:(int64_t)a4 minor:(int64_t)a5 eventType:(unsigned __int8)a6
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (qword_1019349F0 != -1) {
    dispatch_once(&qword_1019349F0, &stru_10185F918);
  }
  id v6 = (os_log_s *)qword_1019349F8;
  if (os_log_type_enabled((os_log_t)qword_1019349F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v20 = 0;
    __int16 v21 = 2082;
    uint64_t v22 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Should accept incoming connection?}",  buf,  0x12u);
  }

  id v7 = [a4 valueForEntitlement:@"com.apple.locationd.simulation"];
  if (v7
    && (int v8 = v7, objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    -[CLSimulationControllerAdapter setConnection:](self, "setConnection:", a4);
    BOOL v10 = +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CLSimulationXPCServerInterface);
    objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v12 = v11;
    *(void *)&double v13 = objc_opt_class(&OBJC_CLASS___CLLocation).n128_u64[0];
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v10,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v12, v13, v14, 0LL),  "appendSimulatedLocations:",  0LL,  0LL);
    objc_msgSend(a4, "_setQueue:", objc_msgSend(-[CLSimulationControllerAdapter silo](self, "silo"), "queue"));
    [a4 setExportedInterface:v10];
    [a4 setExportedObject:self];
    [a4 resume];
    LOBYTE(v15) = 1;
  }

  else
  {
    if (qword_1019349F0 != -1) {
      dispatch_once(&qword_1019349F0, &stru_10185F918);
    }
    v16 = (os_log_s *)qword_1019349F8;
    if (os_log_type_enabled((os_log_t)qword_1019349F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      int v20 = 0;
      __int16 v21 = 2082;
      uint64_t v22 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:unentitled client attempting to simulate location}",  buf,  0x12u);
      if (qword_1019349F0 != -1) {
        dispatch_once(&qword_1019349F0, &stru_10185F918);
      }
    }

    __int128 v17 = (os_log_s *)qword_1019349F8;
    BOOL v15 = os_signpost_enabled((os_log_t)qword_1019349F8);
    if (v15)
    {
      *(_DWORD *)buf = 68289026;
      int v20 = 0;
      __int16 v21 = 2082;
      uint64_t v22 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "unentitled client attempting to simulate location",  "{msg%{public}.0s:unentitled client attempting to simulate location}",  buf,  0x12u);
      LOBYTE(v15) = 0;
    }
  }

  return v15;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void)controller
{
  return self->_controller;
}

- (void)setController:(void *)a3
{
  self->_controller = a3;
}

@end