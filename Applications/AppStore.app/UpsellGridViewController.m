@interface UpsellGridViewController
- (_TtC8AppStore24UpsellGridViewController)initWithCoder:(id)a3;
- (_TtC8AppStore24UpsellGridViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation UpsellGridViewController

- (_TtC8AppStore24UpsellGridViewController)initWithCoder:(id)a3
{
  result = (_TtC8AppStore24UpsellGridViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/UpsellGridViewController.swift",  39LL,  2LL,  34LL,  0);
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  if ((-[UpsellGridViewController isViewLoaded](v2, "isViewLoaded") & 1) == 0) {
    -[UpsellGridViewController setView:]( v2,  "setView:",  *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC8AppStore24UpsellGridViewController_gridView));
  }
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  id v2 = v6.receiver;
  -[UpsellGridViewController viewDidLoad](&v6, "viewDidLoad");
  id v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend( v3,  "setLayoutMargins:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);

    dispatch thunk of BasePresenter.didLoad()(v5);
  }

  else
  {
    __break(1u);
  }

- (_TtC8AppStore24UpsellGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore24UpsellGridViewController *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.UpsellGridViewController",  33LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore24UpsellGridViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore24UpsellGridViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore24UpsellGridViewController_artworkLoader));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24UpsellGridViewController_gridView));
}

@end