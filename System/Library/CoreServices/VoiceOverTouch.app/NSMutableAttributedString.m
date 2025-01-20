@interface NSMutableAttributedString
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)appendFormat:(id)a3;
- (void)appendString:(id)a3;
@end

@implementation NSMutableAttributedString

- (unsigned)characterAtIndex:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableAttributedString string](self, "string"));
  LOWORD(a3) = (unsigned __int16)[v4 characterAtIndex:a3];

  return a3;
}

- (void)appendString:(id)a3
{
  id v4 = a3;
  v5 = -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", v4);

  -[NSMutableAttributedString appendAttributedString:](self, "appendAttributedString:", v5);
}

- (void)appendFormat:(id)a3
{
  id v4 = a3;
  v5 = -[NSString initWithFormat:locale:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:locale:arguments:",  v4,  0LL,  &v6);

  -[NSMutableAttributedString appendString:](self, "appendString:", v5);
}

@end