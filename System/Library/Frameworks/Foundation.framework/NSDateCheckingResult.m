@interface NSDateCheckingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)_adjustRangesWithOffset:(int64_t)a3;
- (BOOL)timeIsApproximate;
- (BOOL)timeIsPast;
- (BOOL)timeIsSignificant;
- (NSDate)referenceDate;
- (NSDateCheckingResult)initWithCoder:(id)a3;
- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4;
- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6;
- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6 referenceDate:(id)a7;
- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6 referenceDate:(id)a7 underlyingResult:(void *)a8;
- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6 referenceDate:(id)a7 underlyingResult:(void *)a8 timeIsSignificant:(BOOL)a9 timeIsApproximate:(BOOL)a10;
- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6 referenceDate:(id)a7 underlyingResult:(void *)a8 timeIsSignificant:(BOOL)a9 timeIsApproximate:(BOOL)a10 timeIsPast:(BOOL)a11;
- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6 referenceDate:(id)a7 underlyingResult:(void *)a8 timeIsSignificant:(BOOL)a9 timeIsApproximate:(BOOL)a10 timeIsPast:(BOOL)a11 leadingText:(id)a12 trailingText:(id)a13;
- (NSTimeZone)timeZone;
- (_NSRange)range;
- (double)duration;
- (id)date;
- (id)description;
- (id)leadingText;
- (id)resultByAdjustingRangesWithOffset:(int64_t)a3;
- (id)trailingText;
- (unint64_t)resultType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)underlyingResult;
@end

@implementation NSDateCheckingResult

- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6 referenceDate:(id)a7 underlyingResult:(void *)a8 timeIsSignificant:(BOOL)a9 timeIsApproximate:(BOOL)a10 timeIsPast:(BOOL)a11 leadingText:(id)a12 trailingText:(id)a13
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NSDateCheckingResult;
  v20 = -[NSDateCheckingResult init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_range.NSUInteger location = location;
    v20->_range.NSUInteger length = length;
    v20->_date = (NSDate *)[a4 copy];
    v21->_timeZone = (NSTimeZone *)[a5 copy];
    v21->_duration = a6;
    v21->_referenceDate = (NSDate *)[a7 copy];
    v21->_underlyingResult = a8;
    v21->_timeIsSignificant = a9;
    v21->_timeIsApproximate = a10;
    v21->_timeIsPast = a11;
    v21->_leadingText = (NSString *)[a12 copy];
    v21->_trailingText = (NSString *)[a13 copy];
  }

  return v21;
}

- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6 referenceDate:(id)a7 underlyingResult:(void *)a8 timeIsSignificant:(BOOL)a9 timeIsApproximate:(BOOL)a10 timeIsPast:(BOOL)a11
{
  BYTE2(v12) = 0;
  LOWORD(v12) = __PAIR16__(a10, a9);
  return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:]( self,  "initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeI sPast:leadingText:trailingText:",  a3.location,  a3.length,  a4,  a5,  a7,  a8,  a6,  v12,  0LL,  0LL);
}

- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6 referenceDate:(id)a7 underlyingResult:(void *)a8 timeIsSignificant:(BOOL)a9 timeIsApproximate:(BOOL)a10
{
  BYTE2(v11) = 0;
  LOWORD(v11) = __PAIR16__(a10, a9);
  return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:]( self,  "initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeI sPast:leadingText:trailingText:",  a3.location,  a3.length,  a4,  a5,  a7,  a8,  a6,  v11,  0LL,  0LL);
}

- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6 referenceDate:(id)a7 underlyingResult:(void *)a8
{
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:]( self,  "initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeI sPast:leadingText:trailingText:",  a3.location,  a3.length,  a4,  a5,  a7,  a8,  a6,  v9,  0LL,  0LL);
}

- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6 referenceDate:(id)a7
{
  BYTE2(v8) = 0;
  LOWORD(v8) = 1;
  return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:]( self,  "initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeI sPast:leadingText:trailingText:",  a3.location,  a3.length,  a4,  a5,  a7,  0LL,  a6,  v8,  0LL,  0LL);
}

- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4 timeZone:(id)a5 duration:(double)a6
{
  BYTE2(v7) = 0;
  LOWORD(v7) = 1;
  return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:]( self,  "initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeI sPast:leadingText:trailingText:",  a3.location,  a3.length,  a4,  a5,  0LL,  0LL,  a6,  v7,  0LL,  0LL);
}

- (NSDateCheckingResult)initWithRange:(_NSRange)a3 date:(id)a4
{
  BYTE2(v5) = 0;
  LOWORD(v5) = 1;
  return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeIsPast:leadingText:trailingText:]( self,  "initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:timeI sPast:leadingText:trailingText:",  a3.location,  a3.length,  a4,  0LL,  0LL,  0LL,  0.0,  v5,  0LL,  0LL);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSDateCheckingResult;
  -[NSDateCheckingResult dealloc](&v3, sel_dealloc);
}

- (id)description
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = -[NSDateCheckingResult date](self, "date");
  -[NSDateCheckingResult duration](self, "duration");
  if (v4 <= 0.0)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___NSDateCheckingResult;
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@{%@}",  -[NSTextCheckingResult description](&v7, sel_description),  v3,  v6);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___NSDateCheckingResult;
    return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@{%@-%@}",  -[NSTextCheckingResult description](&v8, sel_description),  v3,  [MEMORY[0x189603F50] dateWithTimeInterval:v3 sinceDate:v4]);
  }

- (void)encodeWithCoder:(id)a3
{
  v11[1] = *MEMORY[0x1895F89C0];
  id v5 = -[NSDateCheckingResult date](self, "date");
  uint64_t v6 = -[NSDateCheckingResult referenceDate](self, "referenceDate");
  objc_super v7 = -[NSDateCheckingResult timeZone](self, "timeZone");
  -[NSDateCheckingResult duration](self, "duration");
  double v9 = v8;
  char v10 = objc_msgSend(a3, "allowsKeyedCoding", *(void *)&v8);
  -[NSTextCheckingResult encodeRangeWithCoder:](self, "encodeRangeWithCoder:", a3);
  if ((v10 & 1) != 0)
  {
    [a3 encodeObject:v5 forKey:@"NSDate"];
    [a3 encodeObject:v7 forKey:@"NSTimeZone"];
    [a3 encodeDouble:@"NSDuration" forKey:v9];
    [a3 encodeObject:v6 forKey:@"NSReferenceDate"];
  }

  else
  {
    [a3 encodeObject:v5];
    [a3 encodeObject:v7];
    [a3 encodeValueOfObjCType:"d" at:v11];
    [a3 encodeObject:v6];
  }

- (NSDateCheckingResult)initWithCoder:(id)a3
{
  v19[1] = *MEMORY[0x1895F89C0];
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    uint64_t v8 = v7;
    uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSDate"];
    uint64_t v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSTimeZone"];
    [a3 decodeDoubleForKey:@"NSDuration"];
    double v12 = v11;
    *(double *)v19 = v11;
    uint64_t v13 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSReferenceDate"];
    return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:]( self,  "initWithRange:date:timeZone:duration:referenceDate:",  v6,  v8,  v9,  v10,  v13,  v12);
  }

  uint64_t v14 = [a3 versionForClassName:@"NSTextCheckingResult"];
  if (v14 == 1)
  {
    uint64_t v6 = -[NSTextCheckingResult decodeRangeWithCoder:](self, "decodeRangeWithCoder:", a3);
    uint64_t v8 = v15;
    uint64_t v9 = [a3 decodeObject];
    uint64_t v10 = [a3 decodeObject];
    [a3 decodeValueOfObjCType:"d" at:v19 size:8];
    uint64_t v13 = [a3 decodeObject];
    double v12 = *(double *)v19;
    return -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:]( self,  "initWithRange:date:timeZone:duration:referenceDate:",  v6,  v8,  v9,  v10,  v13,  v12);
  }

  uint64_t v17 = v14;
  v18 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v18, 1LL, v17);
  -[NSDateCheckingResult dealloc](self, "dealloc");
  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 8LL;
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
  unint64_t v6 = -[NSDateCheckingResult range](self, "range");
  NSUInteger v8 = v7;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_5;
  }
  if ((a3 & 0x8000000000000000LL) == 0 || v6 >= -a3)
  {
    uint64_t v9 = v6 + a3;
LABEL_5:
    id v10 = objc_alloc((Class)objc_opt_class());
    id v11 = -[NSDateCheckingResult date](self, "date");
    double v12 = -[NSDateCheckingResult timeZone](self, "timeZone");
    -[NSDateCheckingResult duration](self, "duration");
    return (id)objc_msgSend( v10,  "initWithRange:date:timeZone:duration:referenceDate:underlyingResult:",  v9,  v8,  v11,  v12,  -[NSDateCheckingResult referenceDate](self, "referenceDate"),  -[NSDateCheckingResult underlyingResult](self, "underlyingResult"),  v13);
  }

  NSUInteger v15 = v6;
  v16 = _NSFullMethodName((objc_class *)self, a2);
  v21.NSUInteger location = v15;
  v21.NSUInteger length = v8;
  uint64_t v17 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v16, a3, NSStringFromRange(v21)), 0 reason userInfo];
  objc_exception_throw(v17);
  return (id)-[NSDateCheckingResult _adjustRangesWithOffset:](v18, v19, v20);
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
  return -[NSDateCheckingResult date](v9, v10);
}

- (id)date
{
  return self->_date;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (id)leadingText
{
  return self->_leadingText;
}

- (id)trailingText
{
  return self->_trailingText;
}

- (void)underlyingResult
{
  return self->_underlyingResult;
}

- (BOOL)timeIsSignificant
{
  return self->_timeIsSignificant;
}

- (BOOL)timeIsApproximate
{
  return self->_timeIsApproximate;
}

- (BOOL)timeIsPast
{
  return self->_timeIsPast;
}

@end