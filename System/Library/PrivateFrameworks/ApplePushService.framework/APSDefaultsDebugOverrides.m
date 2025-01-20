@interface APSDefaultsDebugOverrides
- (APSDefaultsDebugOverrides)init;
- (APSDefaultsDebugOverrides)initWithUserDefaults:(id)a3;
- (BOOL)disableFilterOptimization;
- (NSDictionary)connectionRetryPhases;
- (NSNumber)forcedInvalidPresences;
- (NSNumber)overrideFilterVersion;
- (id)overrideFilterDisableResponseForConnectionType:(int64_t)a3;
@end

@implementation APSDefaultsDebugOverrides

- (APSDefaultsDebugOverrides)init
{
  id v3 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  v4 = -[APSDefaultsDebugOverrides initWithUserDefaults:](self, "initWithUserDefaults:", v3);

  return v4;
}

- (APSDefaultsDebugOverrides)initWithUserDefaults:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSDefaultsDebugOverrides_userDefaults) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DefaultsDebugOverrides();
  id v4 = a3;
  return -[APSDefaultsDebugOverrides init](&v6, "init");
}

- (void).cxx_destruct
{
}

- (BOOL)disableFilterOptimization
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSDefaultsDebugOverrides_userDefaults);
  id v3 = self;
  NSString v4 = String._bridgeToObjectiveC()();
  LOBYTE(v2) = [v2 BOOLForKey:v4];

  return (char)v2;
}

- (id)overrideFilterDisableResponseForConnectionType:(int64_t)a3
{
  NSString v4 = self;
  v5 = sub_1000AFA70(a3);

  return v5;
}

- (NSNumber)overrideFilterVersion
{
  v2 = self;
  Class isa = sub_1000AFFA0().super.super.isa;

  return (NSNumber *)isa;
}

- (NSDictionary)connectionRetryPhases
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSDefaultsDebugOverrides_userDefaults);
  id v3 = self;
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [v2 dictionaryForKey:v4];

  if (v5)
  {
    uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v5,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);

    v7.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }

  else
  {

    v7.super.Class isa = 0LL;
  }

  return (NSDictionary *)v7.super.isa;
}

- (NSNumber)forcedInvalidPresences
{
  v2 = self;
  Class isa = sub_1000AFFA0().super.super.isa;

  return (NSNumber *)isa;
}

@end