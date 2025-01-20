@interface SidebarNavigationBaseChildViewController
- (_TtC8FaceTime40SidebarNavigationBaseChildViewController)initWithCoder:(id)a3;
- (_TtC8FaceTime40SidebarNavigationBaseChildViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation SidebarNavigationBaseChildViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SidebarNavigationBaseChildViewController( (uint64_t)self,  (uint64_t)a2);
  v2 = (char *)v5.receiver;
  -[SidebarNavigationBaseChildViewController viewDidLoad](&v5, "viewDidLoad");
  sub_10007482C();
  uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC8FaceTime40SidebarNavigationBaseChildViewController_navigationTitle];
  v4 = *(void **)&v2[OBJC_IVAR____TtC8FaceTime40SidebarNavigationBaseChildViewController_navigationTitle + 8];
  swift_bridgeObjectRetain(v4);
  sub_100074BF8(v3, v4);

  swift_bridgeObjectRelease(v4);
}

- (_TtC8FaceTime40SidebarNavigationBaseChildViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8FaceTime40SidebarNavigationBaseChildViewController *)sub_100074F54(v5, v7, a4);
}

- (_TtC8FaceTime40SidebarNavigationBaseChildViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC8FaceTime40SidebarNavigationBaseChildViewController *)sub_100075060(v3, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime40SidebarNavigationBaseChildViewController____lazy_storage___navigationTitleStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime40SidebarNavigationBaseChildViewController____lazy_storage___titleLabel));
}

@end