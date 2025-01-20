@interface ApplicationDelegate
+ (BOOL)isFeatureEnabled;
+ (NSString)debugFeatureName;
+ (NSString)featureEnabledStatusDidChangeNotification;
+ (OS_os_log)loggingFacility;
- (_TtC15assistivetouchd19ApplicationDelegate)init;
- (void)didFinishLaunching;
- (void)stop;
- (void)willTerminate;
@end

@implementation ApplicationDelegate

- (_TtC15assistivetouchd19ApplicationDelegate)init
{
  uint64_t v3 = OBJC_IVAR____TtC15assistivetouchd19ApplicationDelegate_runtimeManager;
  id v4 = objc_allocWithZone((Class)&OBJC_CLASS___HNDRuntimeManager);
  v5 = self;
  *(void *)&self->AXUIDaemonApplicationDelegate_opaque[v3] = [v4 init];
  *(void *)&v5->AXUIDaemonApplicationDelegate_opaque[OBJC_IVAR____TtC15assistivetouchd19ApplicationDelegate_sceneAttemptCount] = 0LL;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for ApplicationDelegate();
  v6 = -[ApplicationDelegate init](&v8, "init");
  [*(id *)&v6->AXUIDaemonApplicationDelegate_opaque[OBJC_IVAR____TtC15assistivetouchd19ApplicationDelegate_runtimeManager] setDelegate:v6];
  return v6;
}

+ (OS_os_log)loggingFacility
{
  result = (OS_os_log *)(id)ASTLogCommon(a1);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

+ (NSString)debugFeatureName
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (BOOL)isFeatureEnabled
{
  return 1;
}

+ (NSString)featureEnabledStatusDidChangeNotification
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (void)didFinishLaunching
{
  v2 = *(void **)&self->AXUIDaemonApplicationDelegate_opaque[OBJC_IVAR____TtC15assistivetouchd19ApplicationDelegate_runtimeManager];
  id v4 = self;
  [v2 setupRuntime];
  [v2 initializeSystemSettings];
  [v2 startRuntime];
  unint64_t v3 = sub_1000AE004();
  [(id)swift_getObjCClassFromMetadata(v3) usesScenes];
}

- (void)willTerminate
{
}

- (void).cxx_destruct
{
}

- (void)stop
{
  v2 = self;
  sub_1000AE260();
}

@end