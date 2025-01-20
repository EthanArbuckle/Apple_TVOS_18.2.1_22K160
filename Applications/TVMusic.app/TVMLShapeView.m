@interface TVMLShapeView
- (_TtC7TVMusic13TVMLShapeView)initWithCoder:(id)a3;
- (_TtC7TVMusic13TVMLShapeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TVMLShapeView

- (_TtC7TVMusic13TVMLShapeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7TVMusic13TVMLShapeView_cornerRadius) = 0LL;
  v9 = (char *)self + OBJC_IVAR____TtC7TVMusic13TVMLShapeView_shapeContentType;
  *(void *)v9 = 0LL;
  v9[8] = -1;
  v13.receiver = self;
  v13.super_class = ObjectType;
  v10 = -[TVMLShapeView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  id v11 = -[TVMLShapeView layer](v10, "layer");
  [v11 setMasksToBounds:1];

  return v10;
}

- (_TtC7TVMusic13TVMLShapeView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7TVMusic13TVMLShapeView_cornerRadius) = 0LL;
  v4 = (char *)self + OBJC_IVAR____TtC7TVMusic13TVMLShapeView_shapeContentType;
  *(void *)v4 = 0LL;
  v4[8] = -1;
  id v5 = a3;

  result = (_TtC7TVMusic13TVMLShapeView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100223C30LL,  "TVMusic/TVMLShapeView.swift",  27LL,  2LL,  113LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000F39DC();
}

- (void).cxx_destruct
{
}

@end