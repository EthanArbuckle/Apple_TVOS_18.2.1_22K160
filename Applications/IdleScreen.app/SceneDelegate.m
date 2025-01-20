@interface SceneDelegate
- (UIWindow)window;
- (_TtC10IdleScreen13SceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (_TtC10IdleScreen13SceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_window) = 0LL;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_startingSignpostIntervalState) = 0LL;
  id v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_sceneObserver);
  id v4 = (objc_class *)type metadata accessor for SceneDelegate();
  *id v3 = 0LL;
  v3[1] = 0LL;
  v6.receiver = self;
  v6.super_class = v4;
  return -[SceneDelegate init](&v6, "init");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_startingSignpostIntervalState));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC10IdleScreen13SceneDelegate_sceneObserver));
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100007504(v8, v10);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000068A4(v4);
}

- (void)sceneDidBecomeActive:(id)a3
{
  v5 = (void *)objc_opt_self(&OBJC_CLASS___AVAudioSession);
  id v6 = a3;
  v7 = self;
  id v8 = [v5 sharedInstance];
  sub_100005E74();
}

@end