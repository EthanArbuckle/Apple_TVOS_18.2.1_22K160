@interface PRDaemon
- (PRDaemon)init;
- (void)checkForUnlockSinceBoot;
- (void)deviceHasUnlockedSinceBoot;
- (void)run;
- (void)startServices;
@end

@implementation PRDaemon

- (PRDaemon)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PRDaemon;
  v2 = -[PRDaemon init](&v9, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.nearbyd.eventQueue", 0LL);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v3;

    v5 = sub_100288340();
    v10[0] = &off_1007A3030;
    v11 = v10;
    sub_1002883D0((uint64_t)v5, (uint64_t)v10);
    v6 = v11;
    if (v11 == v10)
    {
      uint64_t v7 = 4LL;
      v6 = v10;
      goto LABEL_6;
    }

    if (v11)
    {
      uint64_t v7 = 5LL;
LABEL_6:
      (*(void (**)(void))(*v6 + 8 * v7))();
    }
  }

  return v2;
}

- (void)run
{
  dispatch_queue_t v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PRDaemon] run", buf, 2u);
  }

  v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PRDaemon] registering for iokit xpc events",  v9,  2u);
  }

  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)self->_eventQueue, &stru_1007A2F98);
  -[PRDaemon checkForUnlockSinceBoot](self, "checkForUnlockSinceBoot");
  v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[PRDaemon] registering for notifyd xpc events",  v8,  2u);
  }

  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)self->_eventQueue, &stru_1007A2FB8);
  v6 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[PRDaemon] registering for CBDiscovery xpc events",  v7,  2u);
  }

  xpc_set_event_stream_handler("com.apple.bluetooth.discovery", (dispatch_queue_t)self->_eventQueue, &stru_1007A2FD8);
  -[PRDaemon startServices](self, "startServices");
}

- (void)startServices
{
  dispatch_queue_t v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PRDaemon] starting services", v8, 2u);
  }

  v4 = -[PRXPCActivityManager initWithQueue:]( objc_alloc(&OBJC_CLASS___PRXPCActivityManager),  "initWithQueue:",  self->_eventQueue);
  xpcActivityManager = self->_xpcActivityManager;
  self->_xpcActivityManager = v4;

  v6 = objc_alloc_init(&OBJC_CLASS___PRXPCServicesManager);
  xpcManager = self->_xpcManager;
  self->_xpcManager = v6;

  -[PRXPCServicesManager startServices](self->_xpcManager, "startServices");
}

- (void)checkForUnlockSinceBoot
{
  eventQueue = (dispatch_queue_s *)self->_eventQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100039B8C;
  block[3] = &unk_1007A3000;
  block[4] = self;
  dispatch_sync(eventQueue, block);
}

- (void)deviceHasUnlockedSinceBoot
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100039DD4;
  block[3] = &unk_1007A3000;
  block[4] = self;
  if (qword_1007F54D0 != -1) {
    dispatch_once(&qword_1007F54D0, block);
  }
}

- (void).cxx_destruct
{
}

@end