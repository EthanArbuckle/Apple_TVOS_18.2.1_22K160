@interface TVSetupContainerViewController
- (_TtC22HomeCaptiveViewService30TVSetupContainerViewController)initWithCoder:(id)a3;
- (_TtC22HomeCaptiveViewService30TVSetupContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVSetupContainerViewController

- (_TtC22HomeCaptiveViewService30TVSetupContainerViewController)initWithCoder:(id)a3
{
  *(void *)&self->mainNavigationController[OBJC_IVAR____TtC22HomeCaptiveViewService30TVSetupContainerViewController_progressDelegate] = 0LL;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC22HomeCaptiveViewService30TVSetupContainerViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100012830LL,  "HomeCaptiveViewService/TVSetupContainerView Controller.swift",  59LL,  2LL,  28LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10000CCF8();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (_TtC22HomeCaptiveViewService30TVSetupContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22HomeCaptiveViewService30TVSetupContainerViewController *)_swift_stdlib_reportUnimplementedInitializer( "HomeCaptiveViewService.TVSetupContainerViewController",  53LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HomeCaptiveViewService30TVSetupContainerViewController_mainNavigationController));
  sub_10000D298((uint64_t)self + OBJC_IVAR____TtC22HomeCaptiveViewService30TVSetupContainerViewController_progressDelegate);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_10000D0E8(v8);
}

@end