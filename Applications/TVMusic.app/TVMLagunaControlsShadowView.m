@interface TVMLagunaControlsShadowView
+ (Class)layerClass;
- (TVMLagunaControlsShadowView)initWithCoder:(id)a3;
- (TVMLagunaControlsShadowView)initWithFrame:(CGRect)a3;
@end

@implementation TVMLagunaControlsShadowView

+ (Class)layerClass
{
  uint64_t v2 = sub_1000E0418(0LL, &qword_1002B93E8, &OBJC_CLASS___CAGradientLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (TVMLagunaControlsShadowView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for LagunaControlsShadowView();
  v7 = -[TVMLagunaControlsShadowView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  -[TVMLagunaControlsShadowView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0LL);
  -[TVMLagunaControlsShadowView setAlpha:](v7, "setAlpha:", 0.0);
  sub_10010AE18();

  return v7;
}

- (TVMLagunaControlsShadowView)initWithCoder:(id)a3
{
  result = (TVMLagunaControlsShadowView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100223C30LL,  "TVMusic/LagunaControlsShadowView.swift",  38LL,  2LL,  23LL,  0);
  __break(1u);
  return result;
}

@end