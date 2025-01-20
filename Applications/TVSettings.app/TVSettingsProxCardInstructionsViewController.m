@interface TVSettingsProxCardInstructionsViewController
- (_TtC10TVSettings44TVSettingsProxCardInstructionsViewController)initWithCoder:(id)a3;
- (_TtC10TVSettings44TVSettingsProxCardInstructionsViewController)initWithConfiguration:(id)a3;
- (_TtC10TVSettings44TVSettingsProxCardInstructionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)showActivitySpinnerWithStatus:(id)a3;
- (void)showInstructions;
- (void)showViewController:(id)a3 sender:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVSettingsProxCardInstructionsViewController

- (_TtC10TVSettings44TVSettingsProxCardInstructionsViewController)initWithConfiguration:(id)a3
{
  return (_TtC10TVSettings44TVSettingsProxCardInstructionsViewController *)sub_1000ED948(a3);
}

- (_TtC10TVSettings44TVSettingsProxCardInstructionsViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10TVSettings44TVSettingsProxCardInstructionsViewController_instructionsViewController) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10TVSettings44TVSettingsProxCardInstructionsViewController_imageView) = 0LL;
  id v4 = a3;

  result = (_TtC10TVSettings44TVSettingsProxCardInstructionsViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100140A90LL,  "TVSettings/TVSettingsProxCardInstructions ViewController.swift",  61LL,  2LL,  28LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000EDAE0();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)showViewController:(id)a3 sender:(id)a4
{
  if (a4)
  {
    id v7 = a3;
    v8 = self;
    swift_unknownObjectRetain(a4, v9);
    _bridgeAnyObjectToAny(_:)(v12);
    swift_unknownObjectRelease(a4);
  }

  else
  {
    memset(v12, 0, sizeof(v12));
    id v10 = a3;
    v11 = self;
  }

  sub_1000EDEF8(a3);

  sub_1000EF844((uint64_t)v12);
}

- (void)showInstructions
{
  v2 = self;
  sub_1000EE434();
}

- (void)showActivitySpinnerWithStatus:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    unint64_t v6 = v5;
  }

  else
  {
    uint64_t v4 = 0LL;
    unint64_t v6 = 0LL;
  }

  id v7 = self;
  sub_1000EE780(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TVSettingsProxCardInstructionsViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  -[TVSettingsProxCardInstructionsViewController traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_1000EE930();
}

- (_TtC10TVSettings44TVSettingsProxCardInstructionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVSettings44TVSettingsProxCardInstructionsViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVSettings44TVSettingsProxCardInstructionsViewController_instructionsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVSettings44TVSettingsProxCardInstructionsViewController_imageView));
}

@end