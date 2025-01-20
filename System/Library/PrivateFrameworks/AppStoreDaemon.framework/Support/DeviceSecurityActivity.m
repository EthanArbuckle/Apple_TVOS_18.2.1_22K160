@interface DeviceSecurityActivity
- (BOOL)isEnabled;
- (NSString)descriptiveName;
- (_TtC9appstored22DeviceSecurityActivity)init;
- (_TtC9appstored22DeviceSecurityActivity)initWithBlock:(id)a3;
- (int64_t)deadline;
- (void)run;
@end

@implementation DeviceSecurityActivity

- (_TtC9appstored22DeviceSecurityActivity)initWithBlock:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject(&unk_1003E03D8, 24LL, 7LL);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored22DeviceSecurityActivity_deadline) = (Class)XPC_ACTIVITY_INTERVAL_15_MIN;
  v8 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored22DeviceSecurityActivity_descriptiveName);
  void *v8 = 0x5320656369766544LL;
  v8[1] = 0xEF79746972756365LL;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC9appstored22DeviceSecurityActivity_isEnabled) = 1;
  *(void *)(v7 + 16) = v6;
  v9 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC9appstored22DeviceSecurityActivity_body);
  *v9 = sub_10008FCA4;
  v9[1] = (uint64_t (*)())v7;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[ActivityClass init](&v11, "init");
}

- (int64_t)deadline
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored22DeviceSecurityActivity_deadline);
}

- (NSString)descriptiveName
{
  uint64_t v2 = *(void *)&self->body[OBJC_IVAR____TtC9appstored22DeviceSecurityActivity_descriptiveName];
  swift_bridgeObjectRetain(v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)run
{
  uint64_t v2 = *(void (**)(void))((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored22DeviceSecurityActivity_body);
  NSString v3 = self;
  v2();
}

- (_TtC9appstored22DeviceSecurityActivity)init
{
  result = (_TtC9appstored22DeviceSecurityActivity *)_swift_stdlib_reportUnimplementedInitializer( "appstored.DeviceSecurityActivity",  32LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end