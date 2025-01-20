@interface ProductMediaCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC8AppStore30ProductMediaCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ProductMediaCollectionViewCell

- (_TtC8AppStore30ProductMediaCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore30ProductMediaCollectionViewCell *)sub_10005A6EC( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10005A904();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  id v2 = v3.receiver;
  -[BaseCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_10005B644(0LL);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10005B074(v6, v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_mediaCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ProductMediaCollectionViewCell_bottomAccessoryView));
}

@end