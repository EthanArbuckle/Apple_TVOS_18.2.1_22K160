@interface CacheDeleteActivity
- (BOOL)isEnabled;
- (NSString)descriptiveName;
- (_TtC9appstored19CacheDeleteActivity)init;
- (int64_t)deadline;
- (void)run;
@end

@implementation CacheDeleteActivity

- (int64_t)deadline
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored19CacheDeleteActivity_deadline);
}

- (NSString)descriptiveName
{
  uint64_t v2 = *(void *)&self->deadline[OBJC_IVAR____TtC9appstored19CacheDeleteActivity_descriptiveName];
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
  uint64_t v3 = objc_opt_self(&OBJC_CLASS___CacheDeleteCoordinator);
  v4 = self;
  id v5 = sub_10021E048(v3);
  sub_10021F418(v5);
}

- (_TtC9appstored19CacheDeleteActivity)init
{
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored19CacheDeleteActivity_deadline) = (Class)XPC_ACTIVITY_INTERVAL_15_MIN;
  v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored19CacheDeleteActivity_descriptiveName);
  void *v4 = 0xD000000000000010LL;
  v4[1] = 0x8000000100343C30LL;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC9appstored19CacheDeleteActivity_isEnabled) = 1;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[ActivityClass init](&v6, "init");
}

- (void).cxx_destruct
{
}

@end