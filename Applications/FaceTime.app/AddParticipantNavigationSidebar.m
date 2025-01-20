@interface AddParticipantNavigationSidebar
- (_TtC8FaceTime31AddParticipantNavigationSidebar)initWithCoder:(id)a3;
- (_TtC8FaceTime31AddParticipantNavigationSidebar)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC8FaceTime31AddParticipantNavigationSidebar)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8FaceTime31AddParticipantNavigationSidebar)initWithRootViewController:(id)a3;
- (id)popViewControllerAnimated:(BOOL)a3;
- (void)menuButtonActionWithRecognizer:(id)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation AddParticipantNavigationSidebar

- (void)viewDidLoad
{
  v3 = self;
  sub_1000B897C((uint64_t)v3, v2);
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = type metadata accessor for SidebarNavigationBaseChildViewController(0LL, (uint64_t)a2);
  uint64_t v8 = swift_dynamicCastClass(a3, v7);
  if (v8)
  {
    char v9 = *(_BYTE *)(v8 + OBJC_IVAR____TtC8FaceTime40SidebarNavigationBaseChildViewController_wantsExpandedSidebar);
    id v10 = a3;
    v11 = self;
    sub_1000B96C4(v9);
  }

  else
  {
    id v14 = a3;
    v12 = self;
  }

  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for AddParticipantNavigationSidebar((uint64_t)v12, v13);
  -[AddParticipantNavigationSidebar pushViewController:animated:](&v15, "pushViewController:animated:", a3, v4);
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for AddParticipantNavigationSidebar((uint64_t)self, (uint64_t)a2);
  id v4 = v12.receiver;
  id v5 = -[AddParticipantNavigationSidebar popViewControllerAnimated:](&v12, "popViewControllerAnimated:", v3);
  id v6 = objc_msgSend(v4, "topViewController", v12.receiver, v12.super_class);
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = type metadata accessor for SidebarNavigationBaseChildViewController(0LL, v7);
    uint64_t v10 = swift_dynamicCastClass(v8, v9);
    if (v10) {
      sub_1000B96C4(*(_BYTE *)(v10
    }
                             + OBJC_IVAR____TtC8FaceTime40SidebarNavigationBaseChildViewController_wantsExpandedSidebar));
  }

  else
  {
    uint64_t v8 = v4;
  }

  return v5;
}

- (void)menuButtonActionWithRecognizer:(id)a3
{
  id v4 = (_TtC8FaceTime31AddParticipantNavigationSidebar *)a3;
  uint64_t v7 = self;
  if (-[AddParticipantNavigationSidebar state](v4, "state") == (id)3)
  {
    id v5 = (_TtC8FaceTime31AddParticipantNavigationSidebar *) -[AddParticipantNavigationSidebar parentViewController]( v7,  "parentViewController");
    if (v5)
    {
      id v6 = v5;
      -[AddParticipantNavigationSidebar dismissViewControllerAnimated:completion:]( v5,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);

      id v4 = v7;
      uint64_t v7 = v6;
    }
  }
}

- (_TtC8FaceTime31AddParticipantNavigationSidebar)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  if (!a3)
  {
    uint64_t ObjCClassMetadata = 0LL;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0LL;
    return (_TtC8FaceTime31AddParticipantNavigationSidebar *)sub_1000B98C8(ObjCClassMetadata, v6);
  }

  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a3);
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = swift_getObjCClassMetadata(a4);
  return (_TtC8FaceTime31AddParticipantNavigationSidebar *)sub_1000B98C8(ObjCClassMetadata, v6);
}

- (_TtC8FaceTime31AddParticipantNavigationSidebar)initWithRootViewController:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC8FaceTime31AddParticipantNavigationSidebar_visualEffectView;
  id v5 = a3;
  uint64_t v6 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_1000B8E80();
  *(Class *)((char *)&v6->super.super.super.super.isa
           + OBJC_IVAR____TtC8FaceTime31AddParticipantNavigationSidebar____lazy_storage___widthConstraint) = 0LL;

  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for AddParticipantNavigationSidebar(v7, v8);
  uint64_t v9 = -[AddParticipantNavigationSidebar initWithRootViewController:](&v11, "initWithRootViewController:", v5);

  return v9;
}

- (_TtC8FaceTime31AddParticipantNavigationSidebar)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8FaceTime31AddParticipantNavigationSidebar *)sub_1000B9A54(v5, v7, a4);
}

- (_TtC8FaceTime31AddParticipantNavigationSidebar)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC8FaceTime31AddParticipantNavigationSidebar_visualEffectView;
  id v5 = a3;
  uint64_t v6 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_1000B8E80();
  *(Class *)((char *)&v6->super.super.super.super.isa
           + OBJC_IVAR____TtC8FaceTime31AddParticipantNavigationSidebar____lazy_storage___widthConstraint) = 0LL;

  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for AddParticipantNavigationSidebar(v7, v8);
  uint64_t v9 = -[AddParticipantNavigationSidebar initWithCoder:](&v11, "initWithCoder:", v5);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime31AddParticipantNavigationSidebar_visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime31AddParticipantNavigationSidebar____lazy_storage___widthConstraint));
}

@end