@interface GradientView
+ (Class)layerClass;
- (_TtC8FaceTime12GradientView)initWithCoder:(id)a3;
- (_TtC8FaceTime12GradientView)initWithFrame:(CGRect)a3;
@end

@implementation GradientView

+ (Class)layerClass
{
  uint64_t v2 = sub_10001C5D0(0LL, &qword_100113148, &OBJC_CLASS___CAGradientLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC8FaceTime12GradientView)initWithFrame:(CGRect)a3
{
  return (_TtC8FaceTime12GradientView *)GradientView.init(frame:)( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8FaceTime12GradientView)initWithCoder:(id)a3
{
  return (_TtC8FaceTime12GradientView *)GradientView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8FaceTime12GradientView_colors));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8FaceTime12GradientView_locations));
}

@end