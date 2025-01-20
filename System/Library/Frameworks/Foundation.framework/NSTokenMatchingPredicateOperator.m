@interface NSTokenMatchingPredicateOperator
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (SEL)selector;
- (id)symbol;
@end

@implementation NSTokenMatchingPredicateOperator

- (id)symbol
{
  return (id)objc_msgSend( @"TOKENMATCHES",  "stringByAppendingString:",  -[NSStringPredicateOperator _modifierString](self, "_modifierString"));
}

- (SEL)selector
{
  return sel_tokenmatches_;
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  if (!a3 || !a4) {
    return 0;
  }
  char v6 = -[NSStringPredicateOperator flags](self, "flags");
  if ((v6 & 4) != 0)
  {
    uint64_t v7 = 0LL;
  }

  else
  {
    uint64_t v7 = v6 & 3;
    if ((v6 & 8) != 0)
    {
      v8 = +[_NSPredicateOperatorUtilities retainedLocale]( &OBJC_CLASS____NSPredicateOperatorUtilities,  "retainedLocale");
      goto LABEL_9;
    }
  }

  v8 = 0LL;
LABEL_9:
  if (_NSIsNSString())
  {
    v10 = +[_NSPredicateUtilities _processAndTokenize:flags:locale:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  (__CFString *)a3,  v7,  v8);
  }

  else
  {
    v10 = +[_NSPredicateUtilities _collapseAndTokenize:flags:locale:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  a3,  v7,  v8);
  }

  v11 = v10;
  if (_NSIsNSString())
  {
    v12 = +[_NSPredicateUtilities _processAndTokenize:flags:locale:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  (__CFString *)a4,  v7,  v8);
LABEL_21:
    v13 = v12;

    return [v11 intersectsSet:v13];
  }

  if ((_NSIsNSArray() & 1) != 0 || (_NSIsNSSet() & 1) != 0 || _NSIsNSOrderedSet())
  {
    v12 = +[_NSPredicateUtilities _collapseAndTokenize:flags:locale:]( (uint64_t)&OBJC_CLASS____NSPredicateUtilities,  a4,  v7,  v8);
    goto LABEL_21;
  }

@end