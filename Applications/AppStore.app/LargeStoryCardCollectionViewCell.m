@interface LargeStoryCardCollectionViewCell
- (_TtC8AppStore32LargeStoryCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation LargeStoryCardCollectionViewCell

- (_TtC8AppStore32LargeStoryCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore32LargeStoryCardCollectionViewCell *)sub_10000A6AC( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10000ABE4();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10000AF24();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32LargeStoryCardCollectionViewCell_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32LargeStoryCardCollectionViewCell_detailsView));
}

@end