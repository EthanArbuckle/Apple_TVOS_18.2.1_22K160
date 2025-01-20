@interface SDAuthentication.LTKManager
- (NSString)description;
- (_TtCV16DaemoniOSLibrary16SDAuthentication10LTKManager)init;
@end

@implementation SDAuthentication.LTKManager

- (_TtCV16DaemoniOSLibrary16SDAuthentication10LTKManager)init
{
  result = (_TtCV16DaemoniOSLibrary16SDAuthentication10LTKManager *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.LTKManager",  27LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCV16DaemoniOSLibrary16SDAuthentication10LTKManager_localLTKByKeyClass));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCV16DaemoniOSLibrary16SDAuthentication10LTKManager_lockStateMonitor));
}

- (NSString)description
{
  v2 = self;
  sub_100271768();
  v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

@end