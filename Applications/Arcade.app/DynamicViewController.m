@interface DynamicViewController
- (_TtC6Arcade21DynamicViewController)initWithBag:(id)a3 URL:(id)a4;
- (_TtC6Arcade21DynamicViewController)initWithBag:(id)a3 bagValue:(id)a4;
- (_TtC6Arcade21DynamicViewController)initWithBag:(id)a3 javaScriptBagValue:(id)a4;
- (_TtC6Arcade21DynamicViewController)initWithBag:(id)a3 javaScriptURL:(id)a4;
- (_TtC6Arcade21DynamicViewController)initWithCoder:(id)a3;
- (_TtC6Arcade21DynamicViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation DynamicViewController

- (_TtC6Arcade21DynamicViewController)initWithCoder:(id)a3
{
  *(void *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC6Arcade21DynamicViewController_dynamicDelegate] = 0LL;
  *(void *)&self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC6Arcade21DynamicViewController_gridPresenter] = 0LL;
  v4 = &self->AMSUIDynamicViewController_opaque[OBJC_IVAR____TtC6Arcade21DynamicViewController_gridView];
  *(void *)v4 = 0LL;
  *((void *)v4 + 1) = 0LL;
  id v5 = a3;

  result = (_TtC6Arcade21DynamicViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/DynamicViewController.swift",  34LL,  2LL,  57LL,  0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  sub_100009CA4( (unint64_t *)&unk_1002E5E40,  v4,  (uint64_t (*)(uint64_t))type metadata accessor for DynamicViewController,  (uint64_t)&unk_10023C560);
  id v5 = self;
  DynamicViewControllerDisplaying.injectFieldsIntoMetricsOverlay()();
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[DynamicViewController viewDidLoad](&v6, "viewDidLoad");
}

- (_TtC6Arcade21DynamicViewController)initWithBag:(id)a3 bagValue:(id)a4
{
}

- (_TtC6Arcade21DynamicViewController)initWithBag:(id)a3 URL:(id)a4
{
}

- (_TtC6Arcade21DynamicViewController)initWithBag:(id)a3 javaScriptBagValue:(id)a4
{
}

- (_TtC6Arcade21DynamicViewController)initWithBag:(id)a3 javaScriptURL:(id)a4
{
}

- (_TtC6Arcade21DynamicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6Arcade21DynamicViewController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.DynamicViewController",  28LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end