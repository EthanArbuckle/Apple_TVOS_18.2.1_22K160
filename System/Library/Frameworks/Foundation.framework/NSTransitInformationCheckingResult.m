@interface NSTransitInformationCheckingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)_adjustRangesWithOffset:(int64_t)a3;
- (NSTransitInformationCheckingResult)initWithCoder:(id)a3;
- (NSTransitInformationCheckingResult)initWithRange:(_NSRange)a3 components:(id)a4;
- (NSTransitInformationCheckingResult)initWithRange:(_NSRange)a3 components:(id)a4 underlyingResult:(void *)a5;
- (_NSRange)range;
- (id)components;
- (id)resultByAdjustingRangesWithOffset:(int64_t)a3;
- (unint64_t)resultType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)underlyingResult;
@end

@implementation NSTransitInformationCheckingResult

- (NSTransitInformationCheckingResult)initWithRange:(_NSRange)a3 components:(id)a4 underlyingResult:(void *)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSTransitInformationCheckingResult;
  v9 = -[NSTransitInformationCheckingResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_range.NSUInteger location = location;
    v9->_range.NSUInteger length = length;
    v9->_components = (NSDictionary *)[a4 copy];
    v10->_underlyingResult = a5;
  }

  return v10;
}

- (NSTransitInformationCheckingResult)initWithRange:(_NSRange)a3 components:(id)a4
{
  return -[NSTransitInformationCheckingResult initWithRange:components:underlyingResult:]( self,  "initWithRange:components:underlyingResult:",  a3.location,  a3.length,  a4,  0LL);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSTransitInformationCheckingResult;
  -[NSTransitInformationCheckingResult dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = -[NSTransitInformationCheckingResult components](self, "components");
  char v6 = [a3 allowsKeyedCoding];
  -[NSTextCheckingResult encodeRangeWithCoder:](self, "encodeRangeWithCoder:", a3);
  if ((v6 & 1) != 0) {
    [a3 encodeObject:v5 forKey:@"NSTransitInformationComponents"];
  }
  else {
    [a3 encodeObject:v5];
  }
}

- (NSTransitInformationCheckingResult)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    uint64_t v8 = v7;
    v9 = (void *)MEMORY[0x189604010];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0),  @"NSTransitInformationComponents");
    return -[NSTransitInformationCheckingResult initWithRange:components:]( self,  "initWithRange:components:",  v6,  v8,  v11);
  }

  uint64_t v12 = [a3 versionForClassName:@"NSTextCheckingResult"];
  if (v12 == 1)
  {
    uint64_t v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    uint64_t v8 = v13;
    uint64_t v11 = [a3 decodeObject];
    return -[NSTransitInformationCheckingResult initWithRange:components:]( self,  "initWithRange:components:",  v6,  v8,  v11);
  }

  uint64_t v15 = v12;
  v16 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v16, 1LL, v15);
  -[NSTransitInformationCheckingResult dealloc](self, "dealloc");
  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 4096LL;
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)resultByAdjustingRangesWithOffset:(int64_t)a3
{
  unint64_t v6 = -[NSTransitInformationCheckingResult range](self, "range");
  NSUInteger v8 = v7;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return (id)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithRange:components:underlyingResult:",  v9,  v7,  -[NSTransitInformationCheckingResult components](self, "components"),  -[NSTransitInformationCheckingResult underlyingResult](self, "underlyingResult"));
  }
  if ((a3 & 0x8000000000000000LL) == 0 || v6 >= -a3)
  {
    uint64_t v9 = v6 + a3;
    return (id)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithRange:components:underlyingResult:",  v9,  v7,  -[NSTransitInformationCheckingResult components](self, "components"),  -[NSTransitInformationCheckingResult underlyingResult](self, "underlyingResult"));
  }

  NSUInteger v11 = v6;
  uint64_t v12 = _NSFullMethodName((objc_class *)self, a2);
  v17.NSUInteger location = v11;
  v17.NSUInteger length = v8;
  uint64_t v13 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v12, a3, NSStringFromRange(v17)), 0 reason userInfo];
  objc_exception_throw(v13);
  return (id)-[NSTransitInformationCheckingResult _adjustRangesWithOffset:](v14, v15, v16);
}

- (BOOL)_adjustRangesWithOffset:(int64_t)a3
{
  NSUInteger location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  if ((a3 & 0x8000000000000000LL) == 0 || location >= -a3)
  {
    self->_range.NSUInteger location = location + a3;
    return 1;
  }

  p_range = &self->_range;
  NSUInteger v7 = _NSFullMethodName((objc_class *)self, a2);
  NSUInteger v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v7, a3, NSStringFromRange(*p_range)), 0 reason userInfo];
  objc_exception_throw(v8);
  return -[NSTransitInformationCheckingResult components](v9, v10);
}

- (id)components
{
  return self->_components;
}

- (void)underlyingResult
{
  return self->_underlyingResult;
}

@end