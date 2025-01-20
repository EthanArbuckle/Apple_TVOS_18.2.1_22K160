@interface ScreenshotCollectionViewCell
- (_TtC6Arcade28ScreenshotCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ScreenshotCollectionViewCell

- (_TtC6Arcade28ScreenshotCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade28ScreenshotCollectionViewCell *)sub_100011998( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v13.receiver;
  -[ScreenshotCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC6Arcade28ScreenshotCollectionViewCell_artworkView];
  id v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  id v2 = v4.receiver;
  -[BaseCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  v5.value.super.isa = 0LL;
  v5.is_nil = 0;
  ArtworkView.setImage(image:animated:)(v5, v3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade28ScreenshotCollectionViewCell_artworkView));
}

@end