@interface AvatarView
- (CGSize)intrinsicContentSize;
- (_TtC8FaceTime10AvatarView)initWithCoder:(id)a3;
- (_TtC8FaceTime10AvatarView)initWithFrame:(CGRect)a3;
- (_TtC8FaceTime10AvatarView)initWithImage:(id)a3;
- (_TtC8FaceTime10AvatarView)initWithImage:(id)a3 highlightedImage:(id)a4;
@end

@implementation AvatarView

- (CGSize)intrinsicContentSize
{
  v2 = self;
  -[AvatarView frame](v2, "frame");
  double v4 = v3;
  -[AvatarView frame](v2, "frame");
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC8FaceTime10AvatarView)initWithCoder:(id)a3
{
  CGSize result = (_TtC8FaceTime10AvatarView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000001CLL,  0x80000001000DA760LL,  "FaceTime/CreateCallCollectionViewCell.swift",  43LL,  2LL,  43LL,  0);
  __break(1u);
  return result;
}

- (_TtC8FaceTime10AvatarView)initWithImage:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC8FaceTime10AvatarView *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.AvatarView",  19LL,  "init(image:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC8FaceTime10AvatarView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CGSize result = (_TtC8FaceTime10AvatarView *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.AvatarView",  19LL,  "init(image:highlightedImage:)",  29LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC8FaceTime10AvatarView)initWithFrame:(CGRect)a3
{
}

@end