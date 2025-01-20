@interface SidebarNavigationController
- (_TtC8FaceTime27SidebarNavigationController)initWithCoder:(id)a3;
- (_TtC8FaceTime27SidebarNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC8FaceTime27SidebarNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8FaceTime27SidebarNavigationController)initWithRootViewController:(id)a3;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (id)popViewControllerAnimated:(BOOL)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation SidebarNavigationController

- (_TtC8FaceTime27SidebarNavigationController)initWithCoder:(id)a3
{
  *(void *)&self->listViewController[OBJC_IVAR____TtC8FaceTime27SidebarNavigationController_resizingDelegate] = 0LL;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC8FaceTime27SidebarNavigationController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000001000D8750LL,  "FaceTime/SidebarNavigationController.swift",  42LL,  2LL,  30LL,  0);
  __break(1u);
  return result;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  sub_1000B7B1C(v6, v4);
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  id v6 = sub_1000B7C34(v3, v5);

  return v6;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  uint64_t v6 = sub_1000B7D40(v3, v5);

  if (v6)
  {
    sub_1000B87C0(0LL, v7);
    v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }

  else
  {
    v8.super.isa = 0LL;
  }

  return v8.super.isa;
}

- (_TtC8FaceTime27SidebarNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC8FaceTime27SidebarNavigationController *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.SidebarNavigationController",  36LL,  "init(navigationBarClass:toolbarClass:)",  38LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC8FaceTime27SidebarNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC8FaceTime27SidebarNavigationController *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.SidebarNavigationController",  36LL,  "init(rootViewController:)",  25LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC8FaceTime27SidebarNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8FaceTime27SidebarNavigationController *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.SidebarNavigationController",  36LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime27SidebarNavigationController_listViewController));
  sub_1000A3704((uint64_t)self + OBJC_IVAR____TtC8FaceTime27SidebarNavigationController_resizingDelegate);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  v11 = (objc_class *)type metadata accessor for SidebarTransition((uint64_t)self, (uint64_t)a2);
  v12 = (char *)objc_allocWithZone(v11);
  *(void *)&v12[OBJC_IVAR____TtC8FaceTime17SidebarTransition_operation] = a4;
  v19.receiver = v12;
  v19.super_class = v11;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v16 = self;
  v17 = -[SidebarNavigationController init](&v19, "init");

  return v17;
}

@end