@interface PDDeviceLockStateMonitor
- (PDDeviceLockStateMonitor)init;
- (id)createCurrentNotificationRegistrationState;
- (void)dealloc;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
@end

@implementation PDDeviceLockStateMonitor

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PDDeviceLockStateMonitor_notificationStreamManager);
  v3 = self;
  [v2 unregisterConsumer:v3];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DeviceLockStateMonitor();
  -[PDDeviceLockStateMonitor dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
}

- (PDDeviceLockStateMonitor)init
{
  result = (PDDeviceLockStateMonitor *)_swift_stdlib_reportUnimplementedInitializer( "passd.DeviceLockStateMonitor",  28LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (id)createCurrentNotificationRegistrationState
{
  return sub_100440D8C();
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    uint64_t v8 = v7;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  v9 = (os_unfair_lock_s *)&(*(Class *)((char *)&self->super.isa + OBJC_IVAR___PDDeviceLockStateMonitor_lock))[2];
  swift_unknownObjectRetain(a4);
  v10 = self;
  os_unfair_lock_lock(v9);
  char v11 = PDGetDeviceLockState();
  *((_BYTE *)&v10->super.isa + OBJC_IVAR___PDDeviceLockStateMonitor_currentLockState) = sub_10043E6C0(v11) ^ 1;
  os_unfair_lock_unlock(v9);
  sub_10043E05C(0LL, 0LL, 0LL);
  swift_unknownObjectRelease(a4);

  swift_bridgeObjectRelease(v8);
}

@end