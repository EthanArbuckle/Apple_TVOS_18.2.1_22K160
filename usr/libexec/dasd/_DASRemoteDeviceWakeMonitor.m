@interface _DASRemoteDeviceWakeMonitor
+ (BOOL)appliesToActivity:(id)a3;
+ (id)sharedMonitorWithDaemon:(id)a3;
- (BOOL)isRemoteDeviceAwake:(id)a3;
- (_DASDaemon)daemon;
- (_DASRemoteDeviceWakeMonitor)initWithDaemon:(id)a3;
- (void)setDaemon:(id)a3;
@end

@implementation _DASRemoteDeviceWakeMonitor

- (_DASRemoteDeviceWakeMonitor)initWithDaemon:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____DASRemoteDeviceWakeMonitor;
  v6 = -[_DASRemoteDeviceWakeMonitor init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_daemon, a3);
  }

  return v7;
}

+ (id)sharedMonitorWithDaemon:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002C918;
  block[3] = &unk_1001150D0;
  id v8 = a3;
  uint64_t v3 = qword_100157668;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_100157668, block);
  }
  id v5 = (id)qword_100157670;

  return v5;
}

+ (BOOL)appliesToActivity:(id)a3
{
  return 0;
}

- (BOOL)isRemoteDeviceAwake:(id)a3
{
  return 1;
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end