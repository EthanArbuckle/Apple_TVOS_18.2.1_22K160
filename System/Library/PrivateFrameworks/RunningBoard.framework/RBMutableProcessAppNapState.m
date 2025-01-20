@interface RBMutableProcessAppNapState
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation RBMutableProcessAppNapState

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RBProcessAppNapState _initWithProcessAppNapState:]( +[RBMutableProcessAppNapState allocWithZone:]( &OBJC_CLASS___RBMutableProcessAppNapState,  "allocWithZone:",  a3),  "_initWithProcessAppNapState:",  self);
}

@end