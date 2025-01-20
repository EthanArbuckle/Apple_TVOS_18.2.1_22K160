@interface AdPlatformsStatusConditionsActivity
- (BOOL)isEnabled;
- (NSString)descriptiveName;
- (_TtC9appstored35AdPlatformsStatusConditionsActivity)init;
- (int64_t)deadline;
- (void)run;
@end

@implementation AdPlatformsStatusConditionsActivity

- (int64_t)deadline
{
  return *(int64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC9appstored35AdPlatformsStatusConditionsActivity_deadline);
}

- (NSString)descriptiveName
{
  uint64_t v2 = *(void *)&self->deadline[OBJC_IVAR____TtC9appstored35AdPlatformsStatusConditionsActivity_descriptiveName];
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
  NSString v3 = (void *)objc_opt_self(&OBJC_CLASS___SubscriptionEntitlementsCoordinator);
  v4 = self;
  id v5 = [v3 sharedInstance];
  sub_10026621C(v5);
}

- (_TtC9appstored35AdPlatformsStatusConditionsActivity)init
{
  if ((unint64_t)(XPC_ACTIVITY_INTERVAL_1_DAY - 0x400000000000000LL) >> 59 == 31)
  {
    uint64_t v2 = self;
    uint64_t v3 = OBJC_IVAR____TtC9appstored35AdPlatformsStatusConditionsActivity_deadline;
    ObjectType = (objc_class *)swift_getObjectType(self, a2);
    *(Class *)((char *)&v2->super.super.isa + v3) = (Class)(32 * XPC_ACTIVITY_INTERVAL_1_DAY);
    id v5 = (Class *)((char *)&v2->super.super.isa
                 + OBJC_IVAR____TtC9appstored35AdPlatformsStatusConditionsActivity_descriptiveName);
    *id v5 = 0xD00000000000001DLL;
    v5[1] = 0x8000000100343BA0LL;
    *((_BYTE *)&v2->super.super.isa + OBJC_IVAR____TtC9appstored35AdPlatformsStatusConditionsActivity_isEnabled) = 0;
    v6.receiver = v2;
    v6.super_class = ObjectType;
    return -[ActivityClass init](&v6, "init");
  }

  else
  {
    __break(1u);
  }

  return self;
}

- (void).cxx_destruct
{
}

@end