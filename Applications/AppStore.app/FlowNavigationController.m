@interface FlowNavigationController
- (_TtC8AppStore24FlowNavigationController)init;
- (_TtC8AppStore24FlowNavigationController)initWithCoder:(id)a3;
- (_TtC8AppStore24FlowNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC8AppStore24FlowNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8AppStore24FlowNavigationController)initWithRootViewController:(id)a3;
@end

@implementation FlowNavigationController

- (_TtC8AppStore24FlowNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  if (!a3)
  {
    uint64_t ObjCClassMetadata = 0LL;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0LL;
    return (_TtC8AppStore24FlowNavigationController *)sub_1000918AC(ObjCClassMetadata, v6);
  }

  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a3);
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = swift_getObjCClassMetadata(a4);
  return (_TtC8AppStore24FlowNavigationController *)sub_1000918AC(ObjCClassMetadata, v6);
}

- (_TtC8AppStore24FlowNavigationController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8AppStore24FlowNavigationController *)sub_100091A1C(v5, v7, a4);
}

- (_TtC8AppStore24FlowNavigationController)init
{
  return -[FlowNavigationController initWithNavigationBarClass:toolbarClass:]( self,  "initWithNavigationBarClass:toolbarClass:",  0LL,  0LL);
}

- (_TtC8AppStore24FlowNavigationController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC8AppStore24FlowNavigationController_flowController;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0LL;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore24FlowNavigationController_actionRunner) = 0LL;
  id v5 = a3;

  result = (_TtC8AppStore24FlowNavigationController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/NavigationFlowController.swift",  39LL,  2LL,  141LL,  0);
  __break(1u);
  return result;
}

- (_TtC8AppStore24FlowNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC8AppStore24FlowNavigationController *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.FlowNavigationController",  33LL,  "init(rootViewController:)",  25LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore24FlowNavigationController_actionRunner));
}

@end