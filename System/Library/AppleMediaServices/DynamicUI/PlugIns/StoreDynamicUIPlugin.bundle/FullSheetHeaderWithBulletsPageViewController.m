@interface FullSheetHeaderWithBulletsPageViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC20StoreDynamicUIPlugin44FullSheetHeaderWithBulletsPageViewController)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin44FullSheetHeaderWithBulletsPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)button1Pressed;
- (void)button2Pressed;
- (void)button3Pressed;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation FullSheetHeaderWithBulletsPageViewController

- (_TtC20StoreDynamicUIPlugin44FullSheetHeaderWithBulletsPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_6357C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_636CC();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_63BD8(a3);
}

- (NSArray)preferredFocusEnvironments
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)button1Pressed
{
  v2 = self;
  sub_65DF8();
}

- (void)button2Pressed
{
  v2 = self;
  sub_65F9C();
}

- (void)button3Pressed
{
  v2 = self;
  sub_65FFC();
}

- (_TtC20StoreDynamicUIPlugin44FullSheetHeaderWithBulletsPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  id v5 = a4;
  sub_66324();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin44FullSheetHeaderWithBulletsPageViewController_blurView));
}

@end