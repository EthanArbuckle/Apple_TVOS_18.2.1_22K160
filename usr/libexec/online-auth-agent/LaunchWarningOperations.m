@interface LaunchWarningOperations
- (BOOL)setUserOverride:(BOOL)a3 forID:(unint64_t)a4 error:(id *)a5;
- (BOOL)syncLaunchWarningsAndReturnError:(id *)a3;
- (_TtC17online_auth_agent23LaunchWarningOperations)init;
- (id)lookupLaunchWarningData:(id)a3 cdhashType:(unsigned int)a4 error:(id *)a5;
@end

@implementation LaunchWarningOperations

- (_TtC17online_auth_agent23LaunchWarningOperations)init
{
  return (_TtC17online_auth_agent23LaunchWarningOperations *)sub_100021AAC();
}

- (BOOL)setUserOverride:(BOOL)a3 forID:(unint64_t)a4 error:(id *)a5
{
  v7 = self;
  sub_100021E7C(a3, a4);

  return 1;
}

- (id)lookupLaunchWarningData:(id)a3 cdhashType:(unsigned int)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v12 = v11;

  uint64_t v13 = sub_10002229C(v10, v12, a4);
  unint64_t v15 = v14;

  sub_1000106F8(v10, v12);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1000106F8(v13, v15);
  return isa;
}

- (BOOL)syncLaunchWarningsAndReturnError:(id *)a3
{
  v3 = self;
  sub_1000229F4();

  return 1;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_launchWarningController));
  sub_100012A9C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics));
}

@end