@interface FocusableCollectionView
- (BOOL)canBecomeFocused;
- (_TtC8AppStore23FocusableCollectionView)initWithCoder:(id)a3;
- (_TtC8AppStore23FocusableCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
@end

@implementation FocusableCollectionView

- (BOOL)canBecomeFocused
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC8AppStore23FocusableCollectionView_allowFocus);
}

- (_TtC8AppStore23FocusableCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore23FocusableCollectionView_allowFocus) = 1;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[FocusableCollectionView initWithFrame:collectionViewLayout:]( &v12,  "initWithFrame:collectionViewLayout:",  a4,  x,  y,  width,  height);
}

- (_TtC8AppStore23FocusableCollectionView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore23FocusableCollectionView_allowFocus) = 1;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[FocusableCollectionView initWithCoder:](&v7, "initWithCoder:", a3);
}

@end