@interface SKAction
+ (id)moveTo:(CGPoint)a3 delay:(double)a4 mass:(double)a5 stiffness:(double)a6 damping:(double)a7;
+ (id)scaleTo:(double)a3 delay:(double)a4 mass:(double)a5 stiffness:(double)a6 damping:(double)a7;
+ (id)scaleXTo:(double)a3 y:(double)a4 delay:(double)a5 mass:(double)a6 stiffness:(double)a7 damping:(double)a8;
@end

@implementation SKAction

+ (id)moveTo:(CGPoint)a3 delay:(double)a4 mass:(double)a5 stiffness:(double)a6 damping:(double)a7
{
  return sub_10005144C((uint64_t)&unk_1000C57F0, (uint64_t)&unk_1000C5820, a3.x, a3.y, a4, a5, a6, a7);
}

+ (id)scaleTo:(double)a3 delay:(double)a4 mass:(double)a5 stiffness:(double)a6 damping:(double)a7
{
  return [a1 scaleXTo:a3 y:a3 delay:a4 mass:a5 stiffness:a6 damping:a7];
}

+ (id)scaleXTo:(double)a3 y:(double)a4 delay:(double)a5 mass:(double)a6 stiffness:(double)a7 damping:(double)a8
{
  return sub_10005144C((uint64_t)&unk_1000C5798, (uint64_t)&unk_1000C57C8, a3, a4, a5, a6, a7, a8);
}

@end