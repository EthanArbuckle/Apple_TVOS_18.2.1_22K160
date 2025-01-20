@interface NSComplexRegularExpressionCheckingResult
- (BOOL)_adjustRangesWithOffset:(int64_t)a3;
- (NSComplexRegularExpressionCheckingResult)initWithRangeArray:(id)a3 regularExpression:(id)a4;
- (NSComplexRegularExpressionCheckingResult)initWithRanges:(_NSRange *)a3 count:(unint64_t)a4 regularExpression:(id)a5;
- (_NSRange)range;
- (_NSRange)rangeAtIndex:(unint64_t)a3;
- (id)rangeArray;
- (id)regularExpression;
- (unint64_t)numberOfRanges;
- (void)dealloc;
@end

@implementation NSComplexRegularExpressionCheckingResult

- (NSComplexRegularExpressionCheckingResult)initWithRanges:(_NSRange *)a3 count:(unint64_t)a4 regularExpression:(id)a5
{
  v9 = (void *)[MEMORY[0x189603FA8] array];
  if (a4)
  {
    p_length = &a3->length;
    do
    {
      objc_msgSend( v9,  "addObject:",  +[NSValue valueWithRange:](NSValue, "valueWithRange:", *(p_length - 1), *p_length));
      p_length += 2;
      --a4;
    }

    while (a4);
  }

  return -[NSComplexRegularExpressionCheckingResult initWithRangeArray:regularExpression:]( self,  "initWithRangeArray:regularExpression:",  v9,  a5);
}

- (NSComplexRegularExpressionCheckingResult)initWithRangeArray:(id)a3 regularExpression:(id)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (![a3 count])
  {
    v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: must have at least one range", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSComplexRegularExpressionCheckingResult;
  v8 = -[NSComplexRegularExpressionCheckingResult init](&v11, sel_init);
  if (v8)
  {
    v8->_regularExpression = (NSRegularExpression *)[a4 copy];
    v8->_rangeArray = (NSArray *)[a3 copy];
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSComplexRegularExpressionCheckingResult;
  -[NSComplexRegularExpressionCheckingResult dealloc](&v3, sel_dealloc);
}

- (id)regularExpression
{
  return self->_regularExpression;
}

- (_NSRange)range
{
  NSUInteger v2 = objc_msgSend(-[NSArray objectAtIndex:](self->_rangeArray, "objectAtIndex:", 0), "rangeValue");
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)_adjustRangesWithOffset:(int64_t)a3
{
  v6 = (void *)[MEMORY[0x189603FA8] array];
  unint64_t v7 = -[NSComplexRegularExpressionCheckingResult numberOfRanges](self, "numberOfRanges");
  if (!v7)
  {
LABEL_8:

    self->_rangeArray = (NSArray *)v6;
    return 1;
  }

  unint64_t v8 = v7;
  uint64_t v9 = 0LL;
  while (1)
  {
    unint64_t v10 = -[NSComplexRegularExpressionCheckingResult rangeAtIndex:](self, "rangeAtIndex:", v9);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
LABEL_7:
    if (v8 == ++v9) {
      goto LABEL_8;
    }
  }

  if ((a3 & 0x8000000000000000LL) == 0 || v10 >= -a3)
  {
    objc_msgSend(v6, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", v10 + a3, v11));
    goto LABEL_7;
  }

  NSUInteger v13 = v10;
  v14 = (objc_class *)self;
  NSUInteger v15 = v11;
  v16 = _NSFullMethodName(v14, a2);
  v20.location = v13;
  v20.length = v15;
  v17 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v16, a3, NSStringFromRange(v20)), 0 reason userInfo];
  objc_exception_throw(v17);
  return -[NSComplexRegularExpressionCheckingResult numberOfRanges](v18, v19);
}

- (unint64_t)numberOfRanges
{
  return -[NSArray count](self->_rangeArray, "count");
}

- (_NSRange)rangeAtIndex:(unint64_t)a3
{
  NSUInteger v3 = objc_msgSend(-[NSArray objectAtIndex:](self->_rangeArray, "objectAtIndex:", a3), "rangeValue");
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)rangeArray
{
  return self->_rangeArray;
}

@end