@interface APSUserDependencies
- (APSClientIdentityProvider)clientIdentityProvider;
- (APSSystemTokenStorage)systemTokenStorage;
- (APSUserAppIDManager)userAppIDManager;
- (APSUserDependencies)init;
- (APSUserDependencies)initWithClientIdentityProvider:(id)a3 systemTokenStorage:(id)a4 userPreferences:(id)a5 userAppIDManager:(id)a6;
- (APSUserPreferences)userPreferences;
- (NSString)description;
@end

@implementation APSUserDependencies

- (APSClientIdentityProvider)clientIdentityProvider
{
  return (APSClientIdentityProvider *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR___APSUserDependencies_clientIdentityProvider));
}

- (APSSystemTokenStorage)systemTokenStorage
{
  return (APSSystemTokenStorage *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR___APSUserDependencies_systemTokenStorage));
}

- (APSUserPreferences)userPreferences
{
  return (APSUserPreferences *)objc_autoreleaseReturnValue((id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa
                                                                                                  + OBJC_IVAR___APSUserDependencies_userPreferences)));
}

- (APSUserAppIDManager)userAppIDManager
{
  return (APSUserAppIDManager *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR___APSUserDependencies_userAppIDManager));
}

- (APSUserDependencies)initWithClientIdentityProvider:(id)a3 systemTokenStorage:(id)a4 userPreferences:(id)a5 userAppIDManager:(id)a6
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSUserDependencies_clientIdentityProvider) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSUserDependencies_systemTokenStorage) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSUserDependencies_userPreferences) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSUserDependencies_userAppIDManager) = (Class)a6;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for UserDependencies();
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  swift_unknownObjectRetain(a6);
  return -[APSUserDependencies init](&v11, "init");
}

- (NSString)description
{
  v2 = self;
  sub_1000AF41C();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (APSUserDependencies)init
{
  result = (APSUserDependencies *)_swift_stdlib_reportUnimplementedInitializer( "apsd.UserDependencies",  21LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end