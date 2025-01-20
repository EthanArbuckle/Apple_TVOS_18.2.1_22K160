@interface NSRegularExpressionCheckingResult
+ (BOOL)supportsSecureCoding;
- (NSArray)rangeArray;
- (NSRegularExpression)regularExpression;
- (NSRegularExpressionCheckingResult)initWithCoder:(id)a3;
- (NSRegularExpressionCheckingResult)initWithRangeArray:(id)a3 regularExpression:(id)a4;
- (NSRegularExpressionCheckingResult)initWithRanges:(_NSRange *)a3 count:(unint64_t)a4 regularExpression:(id)a5;
- (_NSRange)rangeWithName:(id)a3;
- (id)description;
- (id)resultByAdjustingRangesWithOffset:(int64_t)a3;
- (unint64_t)resultType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSRegularExpressionCheckingResult

- (NSRegularExpressionCheckingResult)initWithRanges:(_NSRange *)a3 count:(unint64_t)a4 regularExpression:(id)a5
{
  v7 = NSClassFromString((NSString *)@"NSRegularExpressionCheckingResult");
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (NSRegularExpressionCheckingResult)initWithRangeArray:(id)a3 regularExpression:(id)a4
{
  v6 = NSClassFromString((NSString *)@"NSRegularExpressionCheckingResult");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSRegularExpression)regularExpression
{
  return 0LL;
}

- (NSArray)rangeArray
{
  return 0LL;
}

- (_NSRange)rangeWithName:(id)a3
{
  v5 = -[NSRegularExpressionCheckingResult regularExpression](self, "regularExpression");
  if (v5
    && (v6 = v5,
        NSUInteger v7 = -[NSTextCheckingResult numberOfRanges](self, "numberOfRanges"),
        unint64_t v8 = -[NSRegularExpression _captureGroupNumberWithName:](v6, "_captureGroupNumberWithName:", a3),
        v8 < v7))
  {
    NSUInteger v9 = -[NSTextCheckingResult rangeAtIndex:](self, "rangeAtIndex:", v8);
  }

  else
  {
    NSUInteger v10 = 0LL;
    NSUInteger v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  result.length = v10;
  result.location = v9;
  return result;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSRegularExpressionCheckingResult;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@{%@}",  -[NSTextCheckingResult description](&v3, sel_description),  -[NSRegularExpressionCheckingResult regularExpression](self, "regularExpression"));
}

- (void)encodeWithCoder:(id)a3
{
  v5 = -[NSRegularExpressionCheckingResult regularExpression](self, "regularExpression");
  v6 = -[NSRegularExpressionCheckingResult rangeArray](self, "rangeArray");
  if ([a3 allowsKeyedCoding])
  {
    -[NSTextCheckingResult encodeRangeWithCoder:](self, "encodeRangeWithCoder:", a3);
    [a3 encodeObject:v5 forKey:@"NSRegularExpression"];
    [a3 encodeObject:v6 forKey:@"NSRangeArray"];
  }

  else
  {
    [a3 encodeObject:v5];
    [a3 encodeObject:v6];
  }

- (NSRegularExpressionCheckingResult)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSRegularExpression"];
    NSUInteger v7 = (void *)MEMORY[0x189604010];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0),  @"NSRangeArray");
    return -[NSRegularExpressionCheckingResult initWithRangeArray:regularExpression:]( self,  "initWithRangeArray:regularExpression:",  v9,  v6);
  }

  uint64_t v10 = [a3 versionForClassName:@"NSTextCheckingResult"];
  if (v10 == 1)
  {
    uint64_t v6 = [a3 decodeObject];
    uint64_t v9 = [a3 decodeObject];
    return -[NSRegularExpressionCheckingResult initWithRangeArray:regularExpression:]( self,  "initWithRangeArray:regularExpression:",  v9,  v6);
  }

  uint64_t v12 = v10;
  v13 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v13, 1LL, v12);
  -[NSRegularExpressionCheckingResult dealloc](self, "dealloc");
  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 1024LL;
}

- (id)resultByAdjustingRangesWithOffset:(int64_t)a3
{
  uint64_t v6 = -[NSRegularExpressionCheckingResult rangeArray](self, "rangeArray");
  NSUInteger v7 = (void *)[MEMORY[0x189603FA8] array];
  NSUInteger v8 = -[NSTextCheckingResult numberOfRanges](self, "numberOfRanges");
  if (!v8) {
    return (id)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithRangeArray:regularExpression:",  v7,  -[NSRegularExpressionCheckingResult regularExpression](self, "regularExpression"));
  }
  NSUInteger v9 = v8;
  uint64_t v10 = 0LL;
  while (1)
  {
    unint64_t v11 = objc_msgSend(-[NSArray objectAtIndex:](v6, "objectAtIndex:", v10), "rangeValue");
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
LABEL_7:
    objc_msgSend(v7, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", v13, v12));
    if (v9 == ++v10) {
      return (id)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithRangeArray:regularExpression:",  v7,  -[NSRegularExpressionCheckingResult regularExpression](self, "regularExpression"));
    }
  }

  if ((a3 & 0x8000000000000000LL) == 0 || v11 >= -a3)
  {
    uint64_t v13 = v11 + a3;
    goto LABEL_7;
  }

  NSUInteger v15 = v11;
  v16 = (objc_class *)self;
  NSUInteger v17 = v12;
  v18 = _NSFullMethodName(v16, a2);
  v25.location = v15;
  v25.length = v17;
  v19 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v18, a3, NSStringFromRange(v25)), 0 reason userInfo];
  objc_exception_throw(v19);
  return -[NSSimpleRegularExpressionCheckingResult initWithRanges:count:regularExpression:](v20, v21, v22, v23, v24);
}

@end