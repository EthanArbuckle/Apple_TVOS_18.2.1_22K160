@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC7Fitness11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_100003CE8(v10);

  return v12;
}

- (_TtC7Fitness11AppDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v3, "init");
}

@end