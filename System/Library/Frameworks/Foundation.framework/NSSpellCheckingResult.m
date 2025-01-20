@interface NSSpellCheckingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)_adjustRangesWithOffset:(int64_t)a3;
- (NSSpellCheckingResult)initWithCoder:(id)a3;
- (NSSpellCheckingResult)initWithRange:(_NSRange)a3;
- (_NSRange)range;
- (id)resultByAdjustingRangesWithOffset:(int64_t)a3;
- (unint64_t)resultType;
@end

@implementation NSSpellCheckingResult

- (NSSpellCheckingResult)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSSpellCheckingResult;
  result = -[NSSpellCheckingResult init](&v6, sel_init);
  if (result)
  {
    result->_range.NSUInteger location = location;
    result->_range.NSUInteger length = length;
  }

  return result;
}

- (NSSpellCheckingResult)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) != 0
    || (uint64_t v6 = [a3 versionForClassName:@"NSTextCheckingResult"], v6 == 1))
  {
    uint64_t v7 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    return -[NSSpellCheckingResult initWithRange:](self, "initWithRange:", v7, v8);
  }

  else
  {
    uint64_t v10 = v6;
    v11 = _NSFullMethodName((objc_class *)self, a2);
    NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v11, 1LL, v10);
    -[NSSpellCheckingResult dealloc](self, "dealloc");
    return 0LL;
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 2LL;
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
  unint64_t v6 = -[NSSpellCheckingResult range](self, "range");
  NSUInteger v8 = v7;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:", v9, v7);
  }
  if ((a3 & 0x8000000000000000LL) == 0 || v6 >= -a3)
  {
    uint64_t v9 = v6 + a3;
    return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:", v9, v7);
  }

  NSUInteger v11 = v6;
  v12 = _NSFullMethodName((objc_class *)self, a2);
  v17.NSUInteger location = v11;
  v17.NSUInteger length = v8;
  v13 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v12, a3, NSStringFromRange(v17)), 0 reason userInfo];
  objc_exception_throw(v13);
  return (id)-[NSSpellCheckingResult _adjustRangesWithOffset:](v14, v15, v16);
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
  return -[NSGrammarCheckingResult initWithRange:details:](v9, v10, v12, v11);
}

@end