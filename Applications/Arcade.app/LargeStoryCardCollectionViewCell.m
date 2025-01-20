@interface LargeStoryCardCollectionViewCell
- (_TtC6Arcade32LargeStoryCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation LargeStoryCardCollectionViewCell

- (_TtC6Arcade32LargeStoryCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade32LargeStoryCardCollectionViewCell *)sub_100009DC4( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10000A2FC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10000A63C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade32LargeStoryCardCollectionViewCell_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade32LargeStoryCardCollectionViewCell_detailsView));
}

@end