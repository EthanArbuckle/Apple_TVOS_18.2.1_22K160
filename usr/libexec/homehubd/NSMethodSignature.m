@interface NSMethodSignature
- (int64_t)getArgumentIndexForClass:(Class)a3;
@end

@implementation NSMethodSignature

- (int64_t)getArgumentIndexForClass:(Class)a3
{
  v4 = NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"@\"%@\"", v5));

  if (-[NSMethodSignature numberOfArguments](self, "numberOfArguments"))
  {
    int64_t v7 = 0LL;
    while (1)
    {
      v8 = self;
      if (!strcmp( -[NSMethodSignature getArgumentTypeAtIndex:](v8, "getArgumentTypeAtIndex:", v7), (const char *)[v6 UTF8String])) {
        break;
      }
      if (++v7 >= -[NSMethodSignature numberOfArguments](v8, "numberOfArguments")) {
        goto LABEL_5;
      }
    }
  }

  else
  {
LABEL_5:
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

@end