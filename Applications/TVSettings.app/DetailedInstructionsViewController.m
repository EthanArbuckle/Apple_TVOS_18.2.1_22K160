@interface DetailedInstructionsViewController
- (_TtC10TVSettingsP33_FC551CFD2E3FD394F7751CAAC1BC26AD34DetailedInstructionsViewController)init;
- (_TtC10TVSettingsP33_FC551CFD2E3FD394F7751CAAC1BC26AD34DetailedInstructionsViewController)initWithCoder:(id)a3;
- (_TtC10TVSettingsP33_FC551CFD2E3FD394F7751CAAC1BC26AD34DetailedInstructionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation DetailedInstructionsViewController

- (_TtC10TVSettingsP33_FC551CFD2E3FD394F7751CAAC1BC26AD34DetailedInstructionsViewController)init
{
  id v3 = objc_allocWithZone((Class)&OBJC_CLASS___TVSettingsTapToSetupView);
  v4 = self;
  v5 = (objc_class *)[v3 init];
  *(Class *)((char *)&v4->super.super.super.isa
           + OBJC_IVAR____TtC10TVSettingsP33_FC551CFD2E3FD394F7751CAAC1BC26AD34DetailedInstructionsViewController_tapToSetupView) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for DetailedInstructionsViewController();
  return -[DetailedInstructionsViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0LL, 0LL);
}

- (_TtC10TVSettingsP33_FC551CFD2E3FD394F7751CAAC1BC26AD34DetailedInstructionsViewController)initWithCoder:(id)a3
{
  result = (_TtC10TVSettingsP33_FC551CFD2E3FD394F7751CAAC1BC26AD34DetailedInstructionsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11LL, 2LL, 0xD000000000000025LL, 0x8000000100140A90LL, "TVSettings/TVSettingsProxCardInstructionsViewController.swift", 61LL, 2LL, 198LL, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000EF318();
}

- (_TtC10TVSettingsP33_FC551CFD2E3FD394F7751CAAC1BC26AD34DetailedInstructionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVSettingsP33_FC551CFD2E3FD394F7751CAAC1BC26AD34DetailedInstructionsViewController_tapToSetupView));
}

@end