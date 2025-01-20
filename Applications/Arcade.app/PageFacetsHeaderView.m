@interface PageFacetsHeaderView
- (BOOL)canBecomeFocused;
- (BOOL)isFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)preferredFocusEnvironments;
- (_TtC6Arcade20PageFacetsHeaderView)initWithCoder:(id)a3;
- (_TtC6Arcade20PageFacetsHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PageFacetsHeaderView

- (_TtC6Arcade20PageFacetsHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001C887C();
}

  ;
}

- (BOOL)isFocused
{
  v2 = self;
  unsigned __int8 v3 = sub_1001C5EF4();

  return v3 & 1;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  sub_1001C6060();
  uint64_t v4 = v3;

  sub_1000031E8((uint64_t *)&unk_1002DF9C0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = self;
  sub_1001C8930();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001C6248();
}

- (_TtC6Arcade20PageFacetsHeaderView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC6Arcade20PageFacetsHeaderView *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.PageFacetsHeaderView",  27LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade20PageFacetsHeaderView_objectGraph));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC6Arcade20PageFacetsHeaderView_facetsPresenter);
  sub_100015B48((uint64_t)self + OBJC_IVAR____TtC6Arcade20PageFacetsHeaderView_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade20PageFacetsHeaderView_facetButtons));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade20PageFacetsHeaderView_facetAlertController));
}

@end