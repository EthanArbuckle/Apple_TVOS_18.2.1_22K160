@interface FramedMediaCollectionViewCell
- (_TtC8AppStore29FramedMediaCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FramedMediaCollectionViewCell

- (_TtC8AppStore29FramedMediaCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29FramedMediaCollectionViewCell *)sub_10002AF4C( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10002B6F4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29FramedMediaCollectionViewCell_captionView));
  sub_1000077E0( (uint64_t)self + OBJC_IVAR____TtC8AppStore29FramedMediaCollectionViewCell_itemLayoutContext,  (uint64_t *)&unk_1002E1D40);
}

@end