@interface AONSenseSampleProvider
+ (BOOL)AONSENSE_FRAMEWORK_AVAILABLE;
+ (_TtC19ProximityDaemonCore22AONSenseSampleProvider)shared;
- (_TtC19ProximityDaemonCore22AONSenseSampleProvider)init;
- (void)registerWithQueue:(id)a3 callback:(id)a4;
@end

@implementation AONSenseSampleProvider

+ (BOOL)AONSENSE_FRAMEWORK_AVAILABLE
{
  return 1;
}

+ (_TtC19ProximityDaemonCore22AONSenseSampleProvider)shared
{
  if (qword_1007FE588 != -1) {
    swift_once(&qword_1007FE588, sub_1002B6104);
  }
  return (_TtC19ProximityDaemonCore22AONSenseSampleProvider *)(id)static AONSenseSampleProvider.shared;
}

- (void)registerWithQueue:(id)a3 callback:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v10 = self;
  uint64_t v8 = static os_log_type_t.error.getter();
  sub_1002B627C();
  v9 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)( v8,  &_mh_execute_header,  v9,  "#AONSenseSampleProvider Not registering with AONSense For BT samples - platform not supported",  93LL,  2LL,  &_swiftEmptyArrayStorage);

  _Block_release(v6);
}

- (_TtC19ProximityDaemonCore22AONSenseSampleProvider)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19ProximityDaemonCore22AONSenseSampleProvider__callout);
  void *v2 = 0LL;
  v2[1] = 0LL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19ProximityDaemonCore22AONSenseSampleProvider__aonSense) = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AONSenseSampleProvider();
  return -[AONSenseSampleProvider init](&v4, "init");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC19ProximityDaemonCore22AONSenseSampleProvider__aonSense));
}

@end