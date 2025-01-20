@interface PageFacetsHeaderView
- (BOOL)canBecomeFocused;
- (BOOL)isFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)preferredFocusEnvironments;
- (_TtC8AppStore20PageFacetsHeaderView)initWithCoder:(id)a3;
- (_TtC8AppStore20PageFacetsHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PageFacetsHeaderView

- (_TtC8AppStore20PageFacetsHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000DA0D8();
}

  ;
}

- (BOOL)isFocused
{
  v2 = self;
  unsigned __int8 v3 = sub_1000D7750();

  return v3 & 1;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  uint64_t v3 = sub_1000D78BC();

  sub_1000038E8((uint64_t *)&unk_1002E3880);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = self;
  sub_1000DA18C();
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
  sub_1000D7AA4();
}

- (_TtC8AppStore20PageFacetsHeaderView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8AppStore20PageFacetsHeaderView *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.PageFacetsHeaderView",  29LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20PageFacetsHeaderView_objectGraph));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore20PageFacetsHeaderView_facetsPresenter);
  sub_1000142AC((uint64_t)self + OBJC_IVAR____TtC8AppStore20PageFacetsHeaderView_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore20PageFacetsHeaderView_facetButtons));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20PageFacetsHeaderView_facetAlertController));
}

@end