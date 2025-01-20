@interface ODPSyncActivity
- (BOOL)isEnabled;
- (NSString)descriptiveName;
- (_TtC9appstored15ODPSyncActivity)init;
- (int64_t)deadline;
- (void)run;
@end

@implementation ODPSyncActivity

- (int64_t)deadline
{
  return 0LL;
}

- (NSString)descriptiveName
{
  uint64_t v2 = *(void *)&self->deadline[OBJC_IVAR____TtC9appstored15ODPSyncActivity_descriptiveName];
  swift_bridgeObjectRetain(v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (BOOL)isEnabled
{
  return 0;
}

- (void)run
{
  NSString v3 = self;
  sub_10003844C((uint64_t)v3, v2);
}

- (_TtC9appstored15ODPSyncActivity)init
{
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored15ODPSyncActivity_deadline) = 0LL;
  v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored15ODPSyncActivity_descriptiveName);
  void *v4 = 0x636E79732050444FLL;
  v4[1] = 0xE800000000000000LL;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC9appstored15ODPSyncActivity_isEnabled) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[ActivityClass init](&v6, "init");
}

- (void).cxx_destruct
{
}

@end