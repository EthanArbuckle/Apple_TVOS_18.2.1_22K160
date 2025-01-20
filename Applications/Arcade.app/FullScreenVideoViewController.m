@interface FullScreenVideoViewController
- (_TtC6Arcade29FullScreenVideoViewController)init;
- (_TtC6Arcade29FullScreenVideoViewController)initWithCoder:(id)a3;
- (_TtC6Arcade29FullScreenVideoViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation FullScreenVideoViewController

- (_TtC6Arcade29FullScreenVideoViewController)init
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC6Arcade29FullScreenVideoViewController_videoView, 0LL);
  v6.receiver = self;
  v6.super_class = ObjectType;
  v4 = -[FullScreenVideoViewController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", 0LL, 0LL);
  -[FullScreenVideoViewController setRestoresFocusAfterTransition:](v4, "setRestoresFocusAfterTransition:", 0LL);
  return v4;
}

- (_TtC6Arcade29FullScreenVideoViewController)initWithCoder:(id)a3
{
  id v5 = a3;

  result = (_TtC6Arcade29FullScreenVideoViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/FullScreenVideoViewController.swift",  42LL,  2LL,  25LL,  0);
  __break(1u);
  return result;
}

- (_TtC6Arcade29FullScreenVideoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6Arcade29FullScreenVideoViewController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.FullScreenVideoViewController",  36LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end