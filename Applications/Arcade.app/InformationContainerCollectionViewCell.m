@interface InformationContainerCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC6Arcade38InformationContainerCollectionViewCell)initWithFrame:(CGRect)a3;
- (int64_t)overrideUserInterfaceStyle;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setOverrideUserInterfaceStyle:(int64_t)a3;
@end

@implementation InformationContainerCollectionViewCell

- (int64_t)overrideUserInterfaceStyle
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[InformationContainerCollectionViewCell overrideUserInterfaceStyle](&v3, "overrideUserInterfaceStyle");
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  v4 = self;
  sub_10013A228(a3);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v4.receiver;
  -[BaseCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  objc_super v3 = *(void **)&v2[OBJC_IVAR____TtC6Arcade38InformationContainerCollectionViewCell_focusGuide];
  *(void *)&v2[OBJC_IVAR____TtC6Arcade38InformationContainerCollectionViewCell_focusGuide] = 0LL;
  sub_10013A8D0(v3);

  sub_100139E6C((uint64_t)_swiftEmptyArrayStorage);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10013A51C();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10013AC6C(v6, (uint64_t)v7);
}

- (_TtC6Arcade38InformationContainerCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC6Arcade38InformationContainerCollectionViewCell_minHeight) = 0LL;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC6Arcade38InformationContainerCollectionViewCell_columns) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC6Arcade38InformationContainerCollectionViewCell_focusGuide) = 0LL;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[BaseCollectionViewCell initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade38InformationContainerCollectionViewCell_columns));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade38InformationContainerCollectionViewCell_focusGuide));
}

@end