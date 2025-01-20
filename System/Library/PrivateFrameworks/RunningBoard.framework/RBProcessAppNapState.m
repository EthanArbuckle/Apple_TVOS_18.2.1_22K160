@interface RBProcessAppNapState
- (BOOL)isEqual:(id)a3;
- (RBProcessAppNapState)init;
- (id)_initWithProcessAppNapState:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unsigned)encodedState;
- (void)dealloc;
@end

@implementation RBProcessAppNapState

- (RBProcessAppNapState)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBProcessAppNapState;
  return -[RBProcessAppNapState init](&v3, sel_init);
}

- (id)_initWithProcessAppNapState:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RBProcessAppNapState;
  return -[RBProcessAppNapState init](&v4, sel_init, a3);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___RBProcessAppNapState;
  -[RBProcessAppNapState dealloc](&v2, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  return 1;
}

- (unsigned)encodedState
{
  return 0;
}

- (id)description
{
  return &stru_18A257E48;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[RBProcessAppNapState _initWithProcessAppNapState:]( +[RBMutableProcessAppNapState allocWithZone:]( &OBJC_CLASS___RBMutableProcessAppNapState,  "allocWithZone:",  a3),  "_initWithProcessAppNapState:",  self);
}

@end