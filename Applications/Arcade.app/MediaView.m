@interface MediaView
- (_TtC6ArcadeP33_486D9B92CCE6B7E2CFCE4CE9AB6D9CFD9MediaView)initWithCoder:(id)a3;
- (_TtC6ArcadeP33_486D9B92CCE6B7E2CFCE4CE9AB6D9CFD9MediaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MediaView

- (void)layoutSubviews
{
  v2 = self;
  sub_100059B58();
}

- (_TtC6ArcadeP33_486D9B92CCE6B7E2CFCE4CE9AB6D9CFD9MediaView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6ArcadeP33_486D9B92CCE6B7E2CFCE4CE9AB6D9CFD9MediaView_artworkView) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6ArcadeP33_486D9B92CCE6B7E2CFCE4CE9AB6D9CFD9MediaView_videoContainer) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6ArcadeP33_486D9B92CCE6B7E2CFCE4CE9AB6D9CFD9MediaView_contentView) = 0LL;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[MediaView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC6ArcadeP33_486D9B92CCE6B7E2CFCE4CE9AB6D9CFD9MediaView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6ArcadeP33_486D9B92CCE6B7E2CFCE4CE9AB6D9CFD9MediaView_artworkView) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6ArcadeP33_486D9B92CCE6B7E2CFCE4CE9AB6D9CFD9MediaView_videoContainer) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC6ArcadeP33_486D9B92CCE6B7E2CFCE4CE9AB6D9CFD9MediaView_contentView) = 0LL;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[MediaView initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6ArcadeP33_486D9B92CCE6B7E2CFCE4CE9AB6D9CFD9MediaView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6ArcadeP33_486D9B92CCE6B7E2CFCE4CE9AB6D9CFD9MediaView_videoContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6ArcadeP33_486D9B92CCE6B7E2CFCE4CE9AB6D9CFD9MediaView_contentView));
}

@end