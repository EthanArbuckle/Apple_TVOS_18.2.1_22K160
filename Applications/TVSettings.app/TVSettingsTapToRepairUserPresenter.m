@interface TVSettingsTapToRepairUserPresenter
- (TVSettingsTapToRepairUserPresenterConfiguration)configuration;
- (TVSettingsUser)user;
- (_TtC10TVSettings34TVSettingsTapToRepairUserPresenter)init;
- (_TtC10TVSettings34TVSettingsTapToRepairUserPresenter)initWithUser:(id)a3 configuration:(id)a4;
- (_TtP10TVSettings42TVSettingsTapToRepairUserPresenterDelegate_)delegate;
- (void)dealloc;
- (void)proxRepairManager:(id)a3 didFinishWithError:(id)a4;
- (void)proxRepairManagerDidFinish:(id)a3;
- (void)proxRepairManagerDidStart:(id)a3;
- (void)proxRepairManagerUserDidCancel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startFlowWithPresentingViewController:(id)a3;
- (void)stopFlow;
@end

@implementation TVSettingsTapToRepairUserPresenter

- (TVSettingsUser)user
{
  return (TVSettingsUser *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR____TtC10TVSettings34TVSettingsTapToRepairUserPresenter_user));
}

- (TVSettingsTapToRepairUserPresenterConfiguration)configuration
{
  return (TVSettingsTapToRepairUserPresenterConfiguration *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC10TVSettings34TVSettingsTapToRepairUserPresenter_configuration);
}

- (_TtP10TVSettings42TVSettingsTapToRepairUserPresenterDelegate_)delegate
{
  return (_TtP10TVSettings42TVSettingsTapToRepairUserPresenterDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC10TVSettings34TVSettingsTapToRepairUserPresenter_delegate, a2);
}

- (void)setDelegate:(id)a3
{
}

- (_TtC10TVSettings34TVSettingsTapToRepairUserPresenter)initWithUser:(id)a3 configuration:(id)a4
{
  return (_TtC10TVSettings34TVSettingsTapToRepairUserPresenter *)sub_1000EF980(a3, a4);
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10TVSettings34TVSettingsTapToRepairUserPresenter_proxRepairManager);
  v3 = self;
  [v2 setDelegate:0];
  [v2 stop];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for TVSettingsTapToRepairUserPresenter();
  -[TVSettingsTapToRepairUserPresenter dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVSettings34TVSettingsTapToRepairUserPresenter_proxRepairManager));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC10TVSettings34TVSettingsTapToRepairUserPresenter_instructionsViewController);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC10TVSettings34TVSettingsTapToRepairUserPresenter_presentingViewController);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVSettings34TVSettingsTapToRepairUserPresenter_configuration));
  sub_1000F12D8((uint64_t)self + OBJC_IVAR____TtC10TVSettings34TVSettingsTapToRepairUserPresenter_delegate);
}

- (void)startFlowWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000EFC78(v4);
}

- (void)stopFlow
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10TVSettings34TVSettingsTapToRepairUserPresenter_proxRepairManager);
  v3 = self;
  [v2 stop];
  sub_1000F06FC();
  swift_unknownObjectWeakAssign( (char *)v3 + OBJC_IVAR____TtC10TVSettings34TVSettingsTapToRepairUserPresenter_presentingViewController,  0LL);
}

- (_TtC10TVSettings34TVSettingsTapToRepairUserPresenter)init
{
  result = (_TtC10TVSettings34TVSettingsTapToRepairUserPresenter *)_swift_stdlib_reportUnimplementedInitializer( "TVSettings.TVSettingsTapToRepairUserPresenter",  45LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void)proxRepairManagerDidStart:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000F0F90();
}

- (void)proxRepairManagerDidFinish:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000F10B0();
}

- (void)proxRepairManagerUserDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000F06FC();
}

- (void)proxRepairManager:(id)a3 didFinishWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_1000F1158((uint64_t)v8);
}

@end