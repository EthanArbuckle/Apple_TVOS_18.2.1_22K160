@interface ManagedConfigurationObserver
- (_TtC7TVMusic28ManagedConfigurationObserver)init;
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation ManagedConfigurationObserver

- (_TtC7TVMusic28ManagedConfigurationObserver)init
{
  return (_TtC7TVMusic28ManagedConfigurationObserver *)sub_10014CD74();
}

- (void)dealloc
{
  v3 = (void *)objc_opt_self(&OBJC_CLASS___MCProfileConnection);
  v4 = self;
  id v5 = [v3 sharedConnection];
  if (v5)
  {
    v6 = v5;
    [v5 unregisterObserver:v4];

    v7.receiver = v4;
    v7.super_class = (Class)type metadata accessor for ManagedConfigurationObserver(0LL);
    -[ManagedConfigurationObserver dealloc](&v7, "dealloc");
  }

  else
  {
    __break(1u);
  }

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC7TVMusic28ManagedConfigurationObserver__isMusicVideoBlocked;
  uint64_t v3 = sub_1000DFE10(&qword_1002BA170);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  if (a4) {
    uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = a3;
  v8 = self;
  sub_10014D154(a3);

  swift_bridgeObjectRelease(v6);
}

@end