@interface SRCarPlayScrollViewController
- (_TtC4Siri29SRCarPlayScrollViewController)initWithCoder:(id)a3;
- (_TtC4Siri29SRCarPlayScrollViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation SRCarPlayScrollViewController

- (_TtC4Siri29SRCarPlayScrollViewController)initWithCoder:(id)a3
{
  result = (_TtC4Siri29SRCarPlayScrollViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x800000010008B670LL,  "Siri/SRCarPlayScrollViewController.swift",  40LL,  2LL,  21LL,  0);
  __break(1u);
  return result;
}

- (void)loadView
{
  char v3 = *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri29SRCarPlayScrollViewController_isRightHandDrive);
  id v4 = objc_allocWithZone((Class)type metadata accessor for SRCarPlayScrollView());
  v5 = self;
  v6 = sub_10005FC7C(v3);
  -[SRCarPlayScrollViewController setView:](v5, "setView:", v6);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10005F798();
}

- (_TtC4Siri29SRCarPlayScrollViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC4Siri29SRCarPlayScrollViewController *)_swift_stdlib_reportUnimplementedInitializer( "Siri.SRCarPlayScrollViewController",  34LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

@end