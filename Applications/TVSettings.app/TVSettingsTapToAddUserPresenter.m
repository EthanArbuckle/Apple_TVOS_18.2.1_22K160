@interface TVSettingsTapToAddUserPresenter
- (NSString)suggestedUserIdentifier;
- (NSString)suggestedUserShortName;
- (_TtC10TVSettings31TVSettingsTapToAddUserPresenter)init;
- (_TtC10TVSettings31TVSettingsTapToAddUserPresenter)initWithSuggestedUserIdentifier:(id)a3 suggestedUserShortName:(id)a4;
- (_TtC10TVSettings31TVSettingsTapToAddUserPresenter)initWithUserType:(int64_t)a3 allowsManualSignIn:(BOOL)a4;
- (_TtP10TVSettings39TVSettingsTapToAddUserPresenterDelegate_)delegate;
- (int64_t)userType;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setSuggestedUserIdentifier:(id)a3;
- (void)setSuggestedUserShortName:(id)a3;
- (void)startFlowWithPresentingViewController:(id)a3;
- (void)stopFlow;
- (void)tapToAddUserManager:(id)a3 didFinishWithError:(id)a4;
- (void)tapToAddUserManager:(id)a3 didFinishWithResult:(id)a4;
- (void)tapToAddUserManager:(id)a3 didFinishWithUnconfiguredHomeKitLocalAccessoryWithResult:(id)a4;
- (void)tapToAddUserManagerDidStart:(id)a3;
- (void)tapToAddUserManagerUserCancelled:(id)a3;
- (void)tapToAddUserManagerWillBeginHomeKitSetup:(id)a3;
@end

@implementation TVSettingsTapToAddUserPresenter

- (_TtP10TVSettings39TVSettingsTapToAddUserPresenterDelegate_)delegate
{
  return (_TtP10TVSettings39TVSettingsTapToAddUserPresenterDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC10TVSettings31TVSettingsTapToAddUserPresenter_delegate, a2);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)userType
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10TVSettings31TVSettingsTapToAddUserPresenter_userType);
}

- (NSString)suggestedUserIdentifier
{
  return (NSString *)sub_1000EEC20( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC10TVSettings31TVSettingsTapToAddUserPresenter_suggestedUserIdentifier);
}

- (void)setSuggestedUserIdentifier:(id)a3
{
}

- (NSString)suggestedUserShortName
{
  return (NSString *)sub_1000EEC20( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC10TVSettings31TVSettingsTapToAddUserPresenter_suggestedUserShortName);
}

- (void)setSuggestedUserShortName:(id)a3
{
}

- (_TtC10TVSettings31TVSettingsTapToAddUserPresenter)initWithUserType:(int64_t)a3 allowsManualSignIn:(BOOL)a4
{
  return (_TtC10TVSettings31TVSettingsTapToAddUserPresenter *)sub_1000F4244(a3, a4);
}

- (_TtC10TVSettings31TVSettingsTapToAddUserPresenter)initWithSuggestedUserIdentifier:(id)a3 suggestedUserShortName:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  return (_TtC10TVSettings31TVSettingsTapToAddUserPresenter *)sub_1000F43C4(v5, v7, v8, v9);
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10TVSettings31TVSettingsTapToAddUserPresenter_tapToAddUserManager);
  v3 = self;
  [v2 setDelegate:0];
  [v2 stop];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for TVSettingsTapToAddUserPresenter();
  -[TVSettingsTapToAddUserPresenter dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVSettings31TVSettingsTapToAddUserPresenter_tapToAddUserManager));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC10TVSettings31TVSettingsTapToAddUserPresenter_instructionsViewController);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC10TVSettings31TVSettingsTapToAddUserPresenter_presentingViewController);
  swift_bridgeObjectRelease(*(void *)&self->delegate[OBJC_IVAR____TtC10TVSettings31TVSettingsTapToAddUserPresenter_suggestedUserIdentifier]);
  swift_bridgeObjectRelease(*(void *)&self->delegate[OBJC_IVAR____TtC10TVSettings31TVSettingsTapToAddUserPresenter_suggestedUserShortName]);
}

- (void)startFlowWithPresentingViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000F4608(v4);
}

- (void)stopFlow
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10TVSettings31TVSettingsTapToAddUserPresenter_tapToAddUserManager);
  v3 = self;
  [v2 stop];
  sub_1000F571C();
  swift_unknownObjectWeakAssign( (char *)v3 + OBJC_IVAR____TtC10TVSettings31TVSettingsTapToAddUserPresenter_presentingViewController,  0LL);
}

- (_TtC10TVSettings31TVSettingsTapToAddUserPresenter)init
{
  result = (_TtC10TVSettings31TVSettingsTapToAddUserPresenter *)_swift_stdlib_reportUnimplementedInitializer( "TVSettings.TVSettingsTapToAddUserPresenter",  42LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void)tapToAddUserManagerDidStart:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000F6024(0xD00000000000001FLL, 0x80000001001416A0LL);
}

- (void)tapToAddUserManagerWillBeginHomeKitSetup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000F6024(0xD000000000000026LL, 0x8000000100141670LL);
}

- (void)tapToAddUserManager:(id)a3 didFinishWithResult:(id)a4
{
}

- (void)tapToAddUserManager:(id)a3 didFinishWithUnconfiguredHomeKitLocalAccessoryWithResult:(id)a4
{
}

- (void)tapToAddUserManagerUserCancelled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000F571C();
}

- (void)tapToAddUserManager:(id)a3 didFinishWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  uint64_t v7 = self;
  sub_1000F60D0((uint64_t)v8);
}

@end