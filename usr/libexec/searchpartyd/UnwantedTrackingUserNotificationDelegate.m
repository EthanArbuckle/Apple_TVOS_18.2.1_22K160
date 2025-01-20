@interface UnwantedTrackingUserNotificationDelegate
- (_TtC12searchpartyd40UnwantedTrackingUserNotificationDelegate)init;
- (void)dealloc;
@end

@implementation UnwantedTrackingUserNotificationDelegate

- (_TtC12searchpartyd40UnwantedTrackingUserNotificationDelegate)init
{
  return (_TtC12searchpartyd40UnwantedTrackingUserNotificationDelegate *)sub_10000A8EC();
}

- (void)dealloc
{
  uint64_t v2 = qword_10099B638;
  v3 = self;
  if (v2 != -1) {
    swift_once(&qword_10099B638, sub_1005E6B7C);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_10000A720(v4, (uint64_t)qword_100A2AED0);
  v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "UnwantedTrackingUserNotificationDelegate: Deinit", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for UnwantedTrackingUserNotificationDelegate();
  -[UnwantedTrackingUserNotificationDelegate dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{
}

@end