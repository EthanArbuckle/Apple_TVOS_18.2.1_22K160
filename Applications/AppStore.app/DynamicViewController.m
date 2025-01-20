@interface DynamicViewController
- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 URL:(id)a4;
- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 bagValue:(id)a4;
- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 javaScriptBagValue:(id)a4;
- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 javaScriptURL:(id)a4;
- (_TtC8AppStore21DynamicViewController)initWithCoder:(id)a3;
- (_TtC8AppStore21DynamicViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation DynamicViewController

- (_TtC8AppStore21DynamicViewController)initWithCoder:(id)a3
{
  *(void *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC8AppStore21DynamicViewController_dynamicDelegate] = 0LL;
  *(void *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC8AppStore21DynamicViewController_gridPresenter] = 0LL;
  v4 = &self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC8AppStore21DynamicViewController_gridView];
  *(void *)v4 = 0LL;
  *((void *)v4 + 1) = 0LL;
  id v5 = a3;

  result = (_TtC8AppStore21DynamicViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/DynamicViewController.swift",  36LL,  2LL,  57LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  sub_10000A4AC( (unint64_t *)&unk_1002EA8E0,  v4,  (uint64_t (*)(uint64_t))type metadata accessor for DynamicViewController,  (uint64_t)&unk_10023FF80);
  id v5 = self;
  DynamicViewControllerDisplaying.injectFieldsIntoMetricsOverlay()();
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[DynamicViewController viewDidLoad](&v6, "viewDidLoad");
}

- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 bagValue:(id)a4
{
}

- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 URL:(id)a4
{
}

- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 javaScriptBagValue:(id)a4
{
}

- (_TtC8AppStore21DynamicViewController)initWithBag:(id)a3 javaScriptURL:(id)a4
{
}

- (_TtC8AppStore21DynamicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore21DynamicViewController *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.DynamicViewController",  30LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end