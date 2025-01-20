@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC10IdleScreen11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)_resetAudioSessionConfiguration;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0LL);
    uint64_t v8 = v7;
    unint64_t v9 = sub_100008400();
    id v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }

  v10 = (void *)objc_opt_self(&OBJC_CLASS___AVAudioSession);
  id v11 = a3;
  v12 = self;
  id v13 = [v10 sharedInstance];
  sub_100005E74();

  id v14 = [(id)objc_opt_self(NSNotificationCenter) defaultCenter];
  [v14 addObserver:v12 selector:"_resetAudioSessionConfiguration" name:AVAudioSessionMediaServicesWereResetNotification object:0];

  swift_bridgeObjectRelease(v4);
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  id v12 = [v9 role];
  id v13 = objc_allocWithZone(&OBJC_CLASS___UISceneConfiguration);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v13 initWithName:v14 sessionRole:v12];

  return v15;
}

- (void)_resetAudioSessionConfiguration
{
  v3 = (void *)objc_opt_self(&OBJC_CLASS___AVAudioSession);
  id v4 = self;
  id v5 = [v3 sharedInstance];
  sub_100005E74();
}

- (_TtC10IdleScreen11AppDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v3, "init");
}

@end