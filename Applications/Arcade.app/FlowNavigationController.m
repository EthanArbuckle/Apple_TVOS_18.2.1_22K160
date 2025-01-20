@interface FlowNavigationController
- (_TtC6Arcade24FlowNavigationController)init;
- (_TtC6Arcade24FlowNavigationController)initWithCoder:(id)a3;
- (_TtC6Arcade24FlowNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC6Arcade24FlowNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC6Arcade24FlowNavigationController)initWithRootViewController:(id)a3;
@end

@implementation FlowNavigationController

- (_TtC6Arcade24FlowNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  if (!a3)
  {
    uint64_t ObjCClassMetadata = 0LL;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0LL;
    return (_TtC6Arcade24FlowNavigationController *)sub_10008953C(ObjCClassMetadata, v6);
  }

  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a3);
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = swift_getObjCClassMetadata(a4);
  return (_TtC6Arcade24FlowNavigationController *)sub_10008953C(ObjCClassMetadata, v6);
}

- (_TtC6Arcade24FlowNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v7 = v6;
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v7 = 0LL;
  }

  id v8 = a4;
  return (_TtC6Arcade24FlowNavigationController *)sub_1000896AC(v5, v7, a4);
}

- (_TtC6Arcade24FlowNavigationController)init
{
  return -[FlowNavigationController initWithNavigationBarClass:toolbarClass:]( self,  "initWithNavigationBarClass:toolbarClass:",  0LL,  0LL);
}

- (_TtC6Arcade24FlowNavigationController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC6Arcade24FlowNavigationController_flowController;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0LL;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade24FlowNavigationController_actionRunner) = 0LL;
  id v5 = a3;

  result = (_TtC6Arcade24FlowNavigationController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/NavigationFlowController.swift",  37LL,  2LL,  141LL,  0);
  __break(1u);
  return result;
}

- (_TtC6Arcade24FlowNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC6Arcade24FlowNavigationController *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.FlowNavigationController",  31LL,  "init(rootViewController:)",  25LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade24FlowNavigationController_actionRunner));
}

@end