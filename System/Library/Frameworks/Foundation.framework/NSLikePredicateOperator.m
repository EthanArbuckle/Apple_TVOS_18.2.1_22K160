@interface NSLikePredicateOperator
- (BOOL)_shouldEscapeForLike;
- (SEL)selector;
- (id)symbol;
@end

@implementation NSLikePredicateOperator

- (id)symbol
{
  return (id)objc_msgSend( @"LIKE",  "stringByAppendingString:",  -[NSStringPredicateOperator _modifierString](self, "_modifierString"));
}

- (SEL)selector
{
  return sel_like_;
}

- (BOOL)_shouldEscapeForLike
{
  return 1;
}

@end