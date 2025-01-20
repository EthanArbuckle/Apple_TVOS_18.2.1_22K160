@interface GradientView
+ (Class)layerClass;
- (_TtC6Arcade12GradientView)initWithCoder:(id)a3;
- (_TtC6Arcade12GradientView)initWithFrame:(CGRect)a3;
@end

@implementation GradientView

+ (Class)layerClass
{
  uint64_t v2 = sub_100006028(0LL, &qword_1002E6328, &OBJC_CLASS___CAGradientLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC6Arcade12GradientView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade12GradientView_kind) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for GradientView();
  return -[GradientView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC6Arcade12GradientView)initWithCoder:(id)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade12GradientView_kind) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GradientView();
  return -[GradientView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end