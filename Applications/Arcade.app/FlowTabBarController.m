@interface FlowTabBarController
- (_TtC6Arcade20FlowTabBarController)initWithCoder:(id)a3;
- (_TtC6Arcade20FlowTabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC6Arcade20FlowTabBarController)initWithTabs:(id)a3;
@end

@implementation FlowTabBarController

- (_TtC6Arcade20FlowTabBarController)initWithTabs:(id)a3
{
  uint64_t v5 = sub_100006028(0LL, &qword_1002EAAA8, &OBJC_CLASS___UITab_ptr);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = (char *)self + OBJC_IVAR____TtC6Arcade20FlowTabBarController_flowController;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0LL;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade20FlowTabBarController_actionRunner) = 0LL;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FlowTabBarController();
  v9 = -[FlowTabBarController initWithTabs:](&v11, "initWithTabs:", isa);

  return v9;
}

- (_TtC6Arcade20FlowTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v7 = v6;
    v8 = (char *)self + OBJC_IVAR____TtC6Arcade20FlowTabBarController_flowController;
    *(_OWORD *)v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((void *)v8 + 4) = 0LL;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade20FlowTabBarController_actionRunner) = 0LL;
    id v9 = a4;
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }

  else
  {
    objc_super v11 = (char *)self + OBJC_IVAR____TtC6Arcade20FlowTabBarController_flowController;
    *(_OWORD *)objc_super v11 = 0u;
    *((_OWORD *)v11 + 1) = 0u;
    *((void *)v11 + 4) = 0LL;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade20FlowTabBarController_actionRunner) = 0LL;
    id v12 = a4;
    NSString v10 = 0LL;
  }

  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for FlowTabBarController();
  v13 = -[FlowTabBarController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v10, a4);

  return v13;
}

- (_TtC6Arcade20FlowTabBarController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC6Arcade20FlowTabBarController_flowController;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0LL;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade20FlowTabBarController_actionRunner) = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FlowTabBarController();
  return -[FlowTabBarController initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade20FlowTabBarController_actionRunner));
}

@end