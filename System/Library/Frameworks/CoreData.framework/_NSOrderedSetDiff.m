@interface _NSOrderedSetDiff
- (_NSOrderedSetDiff)initWithObject:(id)a3;
- (void)applyToSet:(id)a3;
- (void)dealloc;
@end

@implementation _NSOrderedSetDiff

- (_NSOrderedSetDiff)initWithObject:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____NSOrderedSetDiff;
  v4 = -[_NSOrderedSetDiff init](&v6, sel_init);
  if (v4) {
    v4->_diffObject = a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSOrderedSetDiff;
  -[_NSOrderedSetDiff dealloc](&v3, sel_dealloc);
}

- (void)applyToSet:(id)a3
{
}

@end