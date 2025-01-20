@interface NSLinkCheckingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)_adjustRangesWithOffset:(int64_t)a3;
- (NSLinkCheckingResult)initWithCoder:(id)a3;
- (NSLinkCheckingResult)initWithRange:(_NSRange)a3 URL:(id)a4;
- (_NSRange)range;
- (id)URL;
- (id)description;
- (id)resultByAdjustingRangesWithOffset:(int64_t)a3;
- (unint64_t)resultType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSLinkCheckingResult

- (NSLinkCheckingResult)initWithRange:(_NSRange)a3 URL:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSLinkCheckingResult;
  v7 = -[NSLinkCheckingResult init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_range.NSUInteger location = location;
    v7->_range.NSUInteger length = length;
    v7->_url = (NSURL *)[a4 copy];
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSLinkCheckingResult;
  -[NSLinkCheckingResult dealloc](&v3, sel_dealloc);
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSLinkCheckingResult;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@{%@}",  -[NSTextCheckingResult description](&v3, sel_description),  -[NSLinkCheckingResult URL](self, "URL"));
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = -[NSLinkCheckingResult URL](self, "URL");
  char v6 = [a3 allowsKeyedCoding];
  -[NSTextCheckingResult encodeRangeWithCoder:](self, "encodeRangeWithCoder:", a3);
  if ((v6 & 1) != 0) {
    [a3 encodeObject:v5 forKey:@"NSURL"];
  }
  else {
    [a3 encodeObject:v5];
  }
}

- (NSLinkCheckingResult)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    uint64_t v8 = v7;
    uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSURL"];
    return -[NSLinkCheckingResult initWithRange:URL:](self, "initWithRange:URL:", v6, v8, v9);
  }

  uint64_t v10 = [a3 versionForClassName:@"NSTextCheckingResult"];
  if (v10 == 1)
  {
    uint64_t v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    uint64_t v8 = v11;
    uint64_t v9 = [a3 decodeObject];
    return -[NSLinkCheckingResult initWithRange:URL:](self, "initWithRange:URL:", v6, v8, v9);
  }

  uint64_t v13 = v10;
  v14 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v14, 1LL, v13);
  -[NSLinkCheckingResult dealloc](self, "dealloc");
  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 32LL;
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
  unint64_t v6 = -[NSLinkCheckingResult range](self, "range");
  NSUInteger v8 = v7;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return (id)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithRange:URL:",  v9,  v7,  -[NSLinkCheckingResult URL](self, "URL"));
  }
  if ((a3 & 0x8000000000000000LL) == 0 || v6 >= -a3)
  {
    uint64_t v9 = v6 + a3;
    return (id)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithRange:URL:",  v9,  v7,  -[NSLinkCheckingResult URL](self, "URL"));
  }

  NSUInteger v11 = v6;
  v12 = _NSFullMethodName((objc_class *)self, a2);
  v17.NSUInteger location = v11;
  v17.NSUInteger length = v8;
  uint64_t v13 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v12, a3, NSStringFromRange(v17)), 0 reason userInfo];
  objc_exception_throw(v13);
  return (id)-[NSLinkCheckingResult _adjustRangesWithOffset:](v14, v15, v16);
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
  return -[NSLinkCheckingResult URL](v9, v10);
}

- (id)URL
{
  return self->_url;
}

@end