@interface _NSOrderedSetDiffMove
- (id)description;
- (void)applyToSet:(id)a3;
@end

@implementation _NSOrderedSetDiffMove

- (void)applyToSet:(id)a3
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Move: %@ to index: %lu", self->super.super._diffObject, self->super._index];
}

@end