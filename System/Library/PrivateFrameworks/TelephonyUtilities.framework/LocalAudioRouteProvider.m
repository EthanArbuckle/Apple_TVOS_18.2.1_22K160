@interface LocalAudioRouteProvider
- (BOOL)hasActiveAudioSession;
- (_TtC13callservicesd23LocalAudioRouteProvider)init;
- (void)audioInterruptionPropertiesChangedWithNotification:(id)a3;
- (void)audioRouteInformationChangedWithNotification:(id)a3;
- (void)callsChangedForCallCenterObserver:(id)a3;
@end

@implementation LocalAudioRouteProvider

- (BOOL)hasActiveAudioSession
{
  return sub_1002812C0();
}

- (void)audioRouteInformationChangedWithNotification:(id)a3
{
}

- (void)audioInterruptionPropertiesChangedWithNotification:(id)a3
{
}

- (_TtC13callservicesd23LocalAudioRouteProvider)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13callservicesd23LocalAudioRouteProvider_audioRoutes));

  sub_1001B0438((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC13callservicesd23LocalAudioRouteProvider_localAudioSystemProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13callservicesd23LocalAudioRouteProvider_callCenterObserver));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13callservicesd23LocalAudioRouteProvider_ttyProviderObserver));
  sub_100283F84(OBJC_IVAR____TtC13callservicesd23LocalAudioRouteProvider_callAudioCategory);
  sub_100283F84(OBJC_IVAR____TtC13callservicesd23LocalAudioRouteProvider_callAudioMode);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd23LocalAudioRouteProvider_lastUserPickedRoute));
  sub_10028388C(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC13callservicesd23LocalAudioRouteProvider_callAudioInterruptionState));
}

- (void)callsChangedForCallCenterObserver:(id)a3
{
  v5 = self;
  sub_10028354C();
  swift_unknownObjectRelease(a3);
}

@end