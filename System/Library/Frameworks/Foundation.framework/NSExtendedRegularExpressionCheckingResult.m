@interface NSExtendedRegularExpressionCheckingResult
- (BOOL)_adjustRangesWithOffset:(int64_t)a3;
- (NSExtendedRegularExpressionCheckingResult)initWithRangeArray:(id)a3 regularExpression:(id)a4;
- (NSExtendedRegularExpressionCheckingResult)initWithRanges:(_NSRange *)a3 count:(unint64_t)a4 regularExpression:(id)a5;
- (_NSRange)range;
- (_NSRange)rangeAtIndex:(unint64_t)a3;
- (id)rangeArray;
- (id)regularExpression;
- (unint64_t)numberOfRanges;
- (void)dealloc;
@end

@implementation NSExtendedRegularExpressionCheckingResult

- (NSExtendedRegularExpressionCheckingResult)initWithRanges:(_NSRange *)a3 count:(unint64_t)a4 regularExpression:(id)a5
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a4 - 8 <= 0xFFFFFFFFFFFFFFF8LL)
  {
    v13 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: must have 1-7 ranges", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v13);
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NSExtendedRegularExpressionCheckingResult;
  v8 = -[NSExtendedRegularExpressionCheckingResult init](&v14, sel_init);
  if (v8)
  {
    v8->_regularExpression = (NSRegularExpression *)[a5 copy];
    ranges = v8->_ranges;
    unint64_t v10 = a4;
    do
    {
      _NSRange v11 = *a3++;
      *ranges++ = v11;
      --v10;
    }

    while (v10);
    if (a4 <= 6) {
      memset_pattern16(&v8->_ranges[a4], &unk_183990DF0, 112 - 16 * a4);
    }
  }

  return v8;
}

- (NSExtendedRegularExpressionCheckingResult)initWithRangeArray:(id)a3 regularExpression:(id)a4
{
  v15[13] = *MEMORY[0x1895F89C0];
  unint64_t v7 = [a3 count];
  unint64_t v8 = v7;
  if (v7 >= 7) {
    uint64_t v9 = 7LL;
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = 0LL;
    _NSRange v11 = v15;
    do
    {
      *(v11 - 1) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v10), "rangeValue");
      *_NSRange v11 = v12;
      ++v10;
      v11 += 2;
    }

    while (v9 != v10);
  }

  return -[NSExtendedRegularExpressionCheckingResult initWithRanges:count:regularExpression:]( self,  "initWithRanges:count:regularExpression:",  v14,  v8,  a4);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSExtendedRegularExpressionCheckingResult;
  -[NSExtendedRegularExpressionCheckingResult dealloc](&v3, sel_dealloc);
}

- (id)regularExpression
{
  return self->_regularExpression;
}

- (_NSRange)range
{
  ranges = self->_ranges;
  NSUInteger location = self->_ranges[0].location;
  NSUInteger length = ranges->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)_adjustRangesWithOffset:(int64_t)a3
{
  unint64_t v3 = 0LL;
  for (i = self->_ranges; ; ++i)
  {
    unint64_t location = i->location;
    if (i->location != 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    if (v3 > 5 || i->length == 0x7FFFFFFFFFFFFFFFLL) {
      return 1;
    }
LABEL_9:
    ++v3;
  }

  if ((a3 & 0x8000000000000000LL) == 0 || location >= -a3)
  {
    i->unint64_t location = location + a3;
    if (v3 > 5) {
      return 1;
    }
    goto LABEL_9;
  }

  unint64_t v8 = i;
  uint64_t v9 = _NSFullMethodName((objc_class *)self, a2);
  uint64_t v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v9, a3, NSStringFromRange(*v8)), 0 reason userInfo];
  objc_exception_throw(v10);
  return -[NSExtendedRegularExpressionCheckingResult numberOfRanges](v11, v12);
}

- (unint64_t)numberOfRanges
{
  p_NSUInteger length = &self->_ranges[1].length;
  for (unint64_t result = 1LL; result != 7; ++result)
  {
    if (*(p_length - 1) == 0x7FFFFFFFFFFFFFFFLL && *p_length == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    p_length += 2;
  }

  return result;
}

- (_NSRange)rangeAtIndex:(unint64_t)a3
{
  uint64_t location = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t length = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 <= 6)
  {
    v5 = &self->_ranges[a3];
    uint64_t location = v5->location;
    uint64_t length = v5->length;
  }

  if (location == 0x7FFFFFFFFFFFFFFFLL && length == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: index %lu out of range", _NSFullMethodName((objc_class *)self, a2), a3), 0 reason userInfo];
    objc_exception_throw(v8);
    NSUInteger v6 = (NSUInteger)-[NSExtendedRegularExpressionCheckingResult rangeArray](v9, v10);
  }

  else
  {
    NSUInteger v6 = location;
    NSUInteger v7 = length;
  }

  result.uint64_t length = v7;
  result.uint64_t location = v6;
  return result;
}

- (id)rangeArray
{
  unint64_t v3 = (void *)[MEMORY[0x189603FA8] array];
  uint64_t v4 = 0LL;
  ranges = self->_ranges;
  do
  {
    if (ranges[v4].location == 0x7FFFFFFFFFFFFFFFLL && ranges[v4].length == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    objc_msgSend(v3, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:"));
    ++v4;
  }

  while (v4 != 7);
  return v3;
}

@end