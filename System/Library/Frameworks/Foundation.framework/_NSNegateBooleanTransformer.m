@interface _NSNegateBooleanTransformer
+ (Class)transformedValueClass;
- (BOOL)_isBooleanTransformer;
- (id)description;
- (id)transformedValue:(id)a3;
@end

@implementation _NSNegateBooleanTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_self();
}

- (id)transformedValue:(id)a3
{
  return +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [a3 BOOLValue] ^ 1);
}

- (id)description
{
  return @"<shared NSNegateBoolean transformer>";
}

- (BOOL)_isBooleanTransformer
{
  return 1;
}

@end