@interface Snowglobe.Scene
- (CGSize)size;
- (_TtCC8FaceTime9Snowglobe5Scene)init;
- (_TtCC8FaceTime9Snowglobe5Scene)initWithCoder:(id)a3;
- (_TtCC8FaceTime9Snowglobe5Scene)initWithSize:(CGSize)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation Snowglobe.Scene

- (CGSize)size
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for Snowglobe.Scene((uint64_t)self, (uint64_t)a2);
  -[Snowglobe.Scene size](&v4, "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for Snowglobe.Scene((uint64_t)self, (uint64_t)a2);
  id v5 = v6.receiver;
  -[Snowglobe.Scene setSize:](&v6, "setSize:", width, height);
  sub_1000A1B88();
}

- (_TtCC8FaceTime9Snowglobe5Scene)initWithSize:(CGSize)a3
{
  return (_TtCC8FaceTime9Snowglobe5Scene *)sub_1000A1904(a3.width, a3.height);
}

- (_TtCC8FaceTime9Snowglobe5Scene)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000A3218();
}

  ;
}

- (_TtCC8FaceTime9Snowglobe5Scene)init
{
  CGSize result = (_TtCC8FaceTime9Snowglobe5Scene *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.Scene",  14LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene____lazy_storage___magneticField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8FaceTime9Snowglobe5Scene_fenceNode));
}

@end