@interface _NSIsNotNilTransformer
+ (BOOL)supportsReverseTransformation;
- (id)description;
- (id)transformedValue:(id)a3;
@end

@implementation _NSIsNotNilTransformer

+ (BOOL)supportsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  return +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3 != 0LL);
}

- (id)description
{
  return @"<shared NSIsNotNil transformer>";
}

@end