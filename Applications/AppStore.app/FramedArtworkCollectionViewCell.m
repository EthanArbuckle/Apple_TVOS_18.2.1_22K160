@interface FramedArtworkCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC8AppStore31FramedArtworkCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation FramedArtworkCollectionViewCell

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  id v2 = v3.receiver;
  -[BaseCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  ArtworkView.image.setter(0LL);
}

- (_TtC8AppStore31FramedArtworkCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  uint64_t v9 = OBJC_IVAR____TtC8AppStore31FramedArtworkCollectionViewCell_artworkView;
  type metadata accessor for ArtworkView(0LL);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v9) = (Class)static ArtworkView.plainArtworkView.getter();

  v12.receiver = v10;
  v12.super_class = ObjectType;
  return -[FramedMediaCollectionViewCell initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31FramedArtworkCollectionViewCell_artworkView));
}

@end