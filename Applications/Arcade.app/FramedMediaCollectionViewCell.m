@interface FramedMediaCollectionViewCell
- (_TtC6Arcade29FramedMediaCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FramedMediaCollectionViewCell

- (_TtC6Arcade29FramedMediaCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade29FramedMediaCollectionViewCell *)sub_100045FBC( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100046764();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade29FramedMediaCollectionViewCell_captionView));
  sub_100006060( (uint64_t)self + OBJC_IVAR____TtC6Arcade29FramedMediaCollectionViewCell_itemLayoutContext,  (uint64_t *)&unk_1002DDB60);
}

@end