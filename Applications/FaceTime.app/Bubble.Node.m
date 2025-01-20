@interface Bubble.Node
- (_TtCC8FaceTime6Bubble4Node)init;
- (_TtCC8FaceTime6Bubble4Node)initWithCoder:(id)a3;
@end

@implementation Bubble.Node

- (_TtCC8FaceTime6Bubble4Node)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtCC8FaceTime6Bubble4Node_oldCollisionBitMask;
  *(_DWORD *)v4 = 0;
  v4[4] = 1;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtCC8FaceTime6Bubble4Node_enablePhysics) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtCC8FaceTime6Bubble4Node_marginScale) = (Class)0x3FF0CCCCCCCCCCCDLL;
  id v5 = a3;

  result = (_TtCC8FaceTime6Bubble4Node *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000001000D8750LL,  "FaceTime/Bubble.swift",  21LL,  2LL,  433LL,  0);
  __break(1u);
  return result;
}

- (_TtCC8FaceTime6Bubble4Node)init
{
  result = (_TtCC8FaceTime6Bubble4Node *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.Node",  13LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end