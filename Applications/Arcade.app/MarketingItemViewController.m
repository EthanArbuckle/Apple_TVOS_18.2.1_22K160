@interface MarketingItemViewController
- (_TtC6Arcade27MarketingItemViewController)initWithBag:(id)a3 URL:(id)a4;
- (_TtC6Arcade27MarketingItemViewController)initWithBag:(id)a3 bagValue:(id)a4;
- (_TtC6Arcade27MarketingItemViewController)initWithCoder:(id)a3;
- (_TtC6Arcade27MarketingItemViewController)initWithMarketingItem:(id)a3 bag:(id)a4;
- (_TtC6Arcade27MarketingItemViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC6Arcade27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6;
- (_TtC6Arcade27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5;
- (void)viewDidLoad;
@end

@implementation MarketingItemViewController

- (_TtC6Arcade27MarketingItemViewController)initWithCoder:(id)a3
{
  *(void *)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC6Arcade27MarketingItemViewController_dynamicDelegate] = 0LL;
  *(void *)&self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC6Arcade27MarketingItemViewController_gridPresenter] = 0LL;
  v4 = &self->AMSUIMarketingItemViewController_opaque[OBJC_IVAR____TtC6Arcade27MarketingItemViewController_gridView];
  *(void *)v4 = 0LL;
  *((void *)v4 + 1) = 0LL;
  id v5 = a3;

  result = (_TtC6Arcade27MarketingItemViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/MarketingItemViewController.swift",  40LL,  2LL,  62LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  sub_100126810(&qword_1002E6FA8, (uint64_t)&unk_10023D2B8);
  v4 = self;
  DynamicViewControllerDisplaying.injectFieldsIntoMetricsOverlay()();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[MarketingItemViewController viewDidLoad](&v5, "viewDidLoad");
}

- (_TtC6Arcade27MarketingItemViewController)initWithMarketingItem:(id)a3 bag:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain(a4);
  result = (_TtC6Arcade27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.MarketingItemViewController",  34LL,  "init(marketingItem:bag:)",  24LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC6Arcade27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5
{
  result = (_TtC6Arcade27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.MarketingItemViewController",  34LL,  "init(serviceType:placement:bag:)",  32LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC6Arcade27MarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6
{
  id v7 = a5;
  swift_unknownObjectRetain(a6);
  result = (_TtC6Arcade27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.MarketingItemViewController",  34LL,  "init(serviceType:placement:account:bag:)",  40LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC6Arcade27MarketingItemViewController)initWithBag:(id)a3 bagValue:(id)a4
{
  id v5 = a4;
  result = (_TtC6Arcade27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.MarketingItemViewController",  34LL,  "init(bag:bagValue:)",  19LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC6Arcade27MarketingItemViewController)initWithBag:(id)a3 URL:(id)a4
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  __chkstk_darwin(v6);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  swift_unknownObjectRetain(a3);
  result = (_TtC6Arcade27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.MarketingItemViewController",  34LL,  "init(bag:url:)",  14LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC6Arcade27MarketingItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6Arcade27MarketingItemViewController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.MarketingItemViewController",  34LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end