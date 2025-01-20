@interface InsetCollectionViewControllerContentView
- (_TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView)initWithFrame:(CGRect)a3;
- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews;
- (unint64_t)edgesInsettingLayoutMarginsFromSafeArea;
- (void)setEdgesInsettingLayoutMarginsFromSafeArea:(unint64_t)a3;
@end

@implementation InsetCollectionViewControllerContentView

- (unint64_t)edgesInsettingLayoutMarginsFromSafeArea
{
  if (*((_BYTE *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView_insetLayoutMarginsFromTopSafeAreaInset) != 1)
    return 14LL;
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[InsetCollectionViewControllerContentView edgesInsettingLayoutMarginsFromSafeArea]( &v3,  "edgesInsettingLayoutMarginsFromSafeArea");
}

- (void)setEdgesInsettingLayoutMarginsFromSafeArea:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  -[InsetCollectionViewControllerContentView setEdgesInsettingLayoutMarginsFromSafeArea:]( &v4,  "setEdgesInsettingLayoutMarginsFromSafeArea:",  a3);
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  if (*((_BYTE *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView_insetLayoutMarginsFromTopSafeAreaInset))
    return 15LL;
  else {
    return 14LL;
  }
}

- (_TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  swift_unknownObjectWeakInit( (char *)self + OBJC_IVAR____TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView_collectionView,  0LL);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView_insetLayoutMarginsFromTopSafeAreaInset) = 1;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[InsetCollectionViewControllerContentView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(void *)&double v6 = swift_unknownObjectWeakInit( (char *)self + OBJC_IVAR____TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView_collectionView,  0LL).n128_u64[0];
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8AppStoreP33_F9B20E6387F6F627D5761E6B0A83FE5540InsetCollectionViewControllerContentView_insetLayoutMarginsFromTopSafeAreaInset) = 1;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[InsetCollectionViewControllerContentView initWithCoder:](&v8, "initWithCoder:", a3, v6);
}

- (void).cxx_destruct
{
}

@end