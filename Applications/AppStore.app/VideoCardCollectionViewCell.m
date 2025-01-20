@interface VideoCardCollectionViewCell
- (_TtC8AppStore27VideoCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation VideoCardCollectionViewCell

- (_TtC8AppStore27VideoCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore27VideoCardCollectionViewCell *)sub_100095340( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10009597C();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  id v2 = v3.receiver;
  -[BaseCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_1001AE998();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27VideoCardCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27VideoCardCollectionViewCell_avatarShowcase));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27VideoCardCollectionViewCell_videoContainer));
  sub_100035470((uint64_t)self + OBJC_IVAR____TtC8AppStore27VideoCardCollectionViewCell_metrics);
}

@end