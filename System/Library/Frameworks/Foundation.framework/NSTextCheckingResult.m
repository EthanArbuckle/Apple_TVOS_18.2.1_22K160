@interface NSTextCheckingResult
+ (BOOL)supportsSecureCoding;
+ (NSTextCheckingResult)addressCheckingResultWithRange:(NSRange)range components:(NSDictionary *)components;
+ (NSTextCheckingResult)correctionCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString;
+ (NSTextCheckingResult)correctionCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString alternativeStrings:(NSArray *)alternativeStrings;
+ (NSTextCheckingResult)dashCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString;
+ (NSTextCheckingResult)dateCheckingResultWithRange:(NSRange)range date:(NSDate *)date;
+ (NSTextCheckingResult)dateCheckingResultWithRange:(NSRange)range date:(NSDate *)date timeZone:(NSTimeZone *)timeZone duration:(NSTimeInterval)duration;
+ (NSTextCheckingResult)grammarCheckingResultWithRange:(NSRange)range details:(NSArray *)details;
+ (NSTextCheckingResult)linkCheckingResultWithRange:(NSRange)range URL:(NSURL *)url;
+ (NSTextCheckingResult)orthographyCheckingResultWithRange:(NSRange)range orthography:(NSOrthography *)orthography;
+ (NSTextCheckingResult)phoneNumberCheckingResultWithRange:(NSRange)range phoneNumber:(NSString *)phoneNumber;
+ (NSTextCheckingResult)quoteCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString;
+ (NSTextCheckingResult)regularExpressionCheckingResultWithRanges:(NSRangePointer)ranges count:(NSUInteger)count regularExpression:(NSRegularExpression *)regularExpression;
+ (NSTextCheckingResult)replacementCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString;
+ (NSTextCheckingResult)spellCheckingResultWithRange:(NSRange)range;
+ (NSTextCheckingResult)transitInformationCheckingResultWithRange:(NSRange)range components:(NSDictionary *)components;
+ (void)initialize;
- (BOOL)_adjustRangesWithOffset:(int64_t)a3;
- (BOOL)timeIsApproximate;
- (BOOL)timeIsPast;
- (BOOL)timeIsSignificant;
- (NSArray)alternativeStrings;
- (NSArray)grammarDetails;
- (NSDate)date;
- (NSDictionary)components;
- (NSOrthography)orthography;
- (NSRange)range;
- (NSRange)rangeAtIndex:(NSUInteger)idx;
- (NSRange)rangeWithName:(NSString *)name;
- (NSRegularExpression)regularExpression;
- (NSString)phoneNumber;
- (NSString)replacementString;
- (NSTextCheckingResult)resultByAdjustingRangesWithOffset:(NSInteger)offset;
- (NSTextCheckingType)resultType;
- (NSTimeInterval)duration;
- (NSTimeZone)timeZone;
- (NSUInteger)numberOfRanges;
- (NSURL)URL;
- (_NSRange)decodeRangeWithCoder:(id)a3;
- (id)description;
- (id)leadingText;
- (id)referenceDate;
- (id)trailingText;
- (void)encodeRangeWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)underlyingResult;
@end

@implementation NSTextCheckingResult

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    [a1 setVersion:1];
  }
}

- (id)description
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSTextCheckingResult;
  id v3 = -[NSTextCheckingResult description](&v5, sel_description);
  v7.location = -[NSTextCheckingResult range](self, "range");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v3,  NSStringFromRange(v7));
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5 = NSClassFromString((NSString *)@"NSTextCheckingResult");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeRangeWithCoder:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = -[NSTextCheckingResult range](self, "range");
  uint64_t v6 = v5;
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInteger:v4 forKey:@"NSRangeLocation"];
    [a3 encodeInteger:v6 forKey:@"NSRangeLength"];
  }

  else
  {
    uint64_t v7 = v6;
    v8[0] = v4;
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "QQ", v8, &v7);
  }

- (_NSRange)decodeRangeWithCoder:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v4 = [a3 decodeIntegerForKey:@"NSRangeLocation"];
    NSUInteger v5 = [a3 decodeIntegerForKey:@"NSRangeLength"];
  }

  else
  {
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "QQ", v8, &v7);
    NSUInteger v5 = v7;
    uint64_t v4 = v8[0];
  }

  NSUInteger v6 = v4;
  result.length = v5;
  result.location = v6;
  return result;
}

- (NSTextCheckingType)resultType
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSTextCheckingResult");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)range
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSTextCheckingResult");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSTextCheckingResult)resultByAdjustingRangesWithOffset:(NSInteger)offset
{
  NSUInteger v5 = NSClassFromString((NSString *)@"NSTextCheckingResult");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)_adjustRangesWithOffset:(int64_t)a3
{
  return 0;
}

- (NSUInteger)numberOfRanges
{
  return 1LL;
}

- (NSRange)rangeAtIndex:(NSUInteger)idx
{
  NSUInteger v6 = -[NSTextCheckingResult numberOfRanges](self, "numberOfRanges");
  if (v6 <= idx)
  {
    v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: range index (%lu) >= number of ranges (%lu)", _NSFullMethodName((objc_class *)self, a2), idx, v6), 0 reason userInfo];
    objc_exception_throw(v9);
    NSRange v13 = -[NSTextCheckingResult rangeWithName:](v10, v11, v12);
    NSUInteger length = v13.length;
    uint64_t location = v13.location;
  }

  else
  {
    uint64_t location = -[NSTextCheckingResult range](self, "range");
  }

  result.NSUInteger length = length;
  result.uint64_t location = location;
  return result;
}

- (NSRange)rangeWithName:(NSString *)name
{
  NSUInteger v3 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v4 = 0LL;
  result.NSUInteger length = v4;
  result.uint64_t location = v3;
  return result;
}

- (NSOrthography)orthography
{
  return 0LL;
}

- (NSArray)grammarDetails
{
  return 0LL;
}

- (NSDate)date
{
  return 0LL;
}

- (NSTimeZone)timeZone
{
  return 0LL;
}

- (NSTimeInterval)duration
{
  return 0.0;
}

- (id)referenceDate
{
  return 0LL;
}

- (id)leadingText
{
  return 0LL;
}

- (id)trailingText
{
  return 0LL;
}

- (NSDictionary)components
{
  return 0LL;
}

- (NSURL)URL
{
  return 0LL;
}

- (NSString)replacementString
{
  return 0LL;
}

- (NSArray)alternativeStrings
{
  return 0LL;
}

- (NSRegularExpression)regularExpression
{
  return 0LL;
}

- (NSString)phoneNumber
{
  return 0LL;
}

- (void)underlyingResult
{
  return 0LL;
}

- (BOOL)timeIsSignificant
{
  return 0;
}

- (BOOL)timeIsApproximate
{
  return 0;
}

- (BOOL)timeIsPast
{
  return 0;
}

+ (NSTextCheckingResult)orthographyCheckingResultWithRange:(NSRange)range orthography:(NSOrthography *)orthography
{
  return (NSTextCheckingResult *) -[NSOrthographyCheckingResult initWithRange:orthography:]( objc_alloc(&OBJC_CLASS___NSOrthographyCheckingResult),  "initWithRange:orthography:",  range.location,  range.length,  orthography);
}

+ (NSTextCheckingResult)spellCheckingResultWithRange:(NSRange)range
{
  return (NSTextCheckingResult *) -[NSSpellCheckingResult initWithRange:]( objc_alloc(&OBJC_CLASS___NSSpellCheckingResult),  "initWithRange:",  range.location,  range.length);
}

+ (NSTextCheckingResult)grammarCheckingResultWithRange:(NSRange)range details:(NSArray *)details
{
  return (NSTextCheckingResult *) -[NSGrammarCheckingResult initWithRange:details:]( objc_alloc(&OBJC_CLASS___NSGrammarCheckingResult),  "initWithRange:details:",  range.location,  range.length,  details);
}

+ (NSTextCheckingResult)dateCheckingResultWithRange:(NSRange)range date:(NSDate *)date
{
  return (NSTextCheckingResult *) -[NSDateCheckingResult initWithRange:date:]( objc_alloc(&OBJC_CLASS___NSDateCheckingResult),  "initWithRange:date:",  range.location,  range.length,  date);
}

+ (NSTextCheckingResult)dateCheckingResultWithRange:(NSRange)range date:(NSDate *)date timeZone:(NSTimeZone *)timeZone duration:(NSTimeInterval)duration
{
  return (NSTextCheckingResult *) -[NSDateCheckingResult initWithRange:date:timeZone:duration:]( objc_alloc(&OBJC_CLASS___NSDateCheckingResult),  "initWithRange:date:timeZone:duration:",  range.location,  range.length,  date,  timeZone,  duration);
}

+ (NSTextCheckingResult)addressCheckingResultWithRange:(NSRange)range components:(NSDictionary *)components
{
  return (NSTextCheckingResult *) -[NSAddressCheckingResult initWithRange:components:]( objc_alloc(&OBJC_CLASS___NSAddressCheckingResult),  "initWithRange:components:",  range.location,  range.length,  components);
}

+ (NSTextCheckingResult)linkCheckingResultWithRange:(NSRange)range URL:(NSURL *)url
{
  return (NSTextCheckingResult *) -[NSLinkCheckingResult initWithRange:URL:]( objc_alloc(&OBJC_CLASS___NSLinkCheckingResult),  "initWithRange:URL:",  range.location,  range.length,  url);
}

+ (NSTextCheckingResult)quoteCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString
{
  return (NSTextCheckingResult *) -[NSSubstitutionCheckingResult initWithRange:replacementString:]( objc_alloc(&OBJC_CLASS___NSQuoteCheckingResult),  "initWithRange:replacementString:",  range.location,  range.length,  replacementString);
}

+ (NSTextCheckingResult)dashCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString
{
  return (NSTextCheckingResult *) -[NSSubstitutionCheckingResult initWithRange:replacementString:]( objc_alloc(&OBJC_CLASS___NSDashCheckingResult),  "initWithRange:replacementString:",  range.location,  range.length,  replacementString);
}

+ (NSTextCheckingResult)replacementCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString
{
  return (NSTextCheckingResult *) -[NSSubstitutionCheckingResult initWithRange:replacementString:]( objc_alloc(&OBJC_CLASS___NSReplacementCheckingResult),  "initWithRange:replacementString:",  range.location,  range.length,  replacementString);
}

+ (NSTextCheckingResult)correctionCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString
{
  return (NSTextCheckingResult *) -[NSSubstitutionCheckingResult initWithRange:replacementString:]( objc_alloc(&OBJC_CLASS___NSCorrectionCheckingResult),  "initWithRange:replacementString:",  range.location,  range.length,  replacementString);
}

+ (NSTextCheckingResult)correctionCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString alternativeStrings:(NSArray *)alternativeStrings
{
  return (NSTextCheckingResult *) -[NSCorrectionCheckingResult initWithRange:replacementString:alternativeStrings:]( objc_alloc(&OBJC_CLASS___NSCorrectionCheckingResult),  "initWithRange:replacementString:alternativeStrings:",  range.location,  range.length,  replacementString,  alternativeStrings);
}

+ (NSTextCheckingResult)regularExpressionCheckingResultWithRanges:(NSRangePointer)ranges count:(NSUInteger)count regularExpression:(NSRegularExpression *)regularExpression
{
  NSUInteger v5 = off_189C61778;
  if ((count & 0xFFFFFFFFFFFFFFFCLL) != 4) {
    NSUInteger v5 = off_189C615F8;
  }
  if (count - 1 >= 3) {
    NSUInteger v6 = (Class *)v5;
  }
  else {
    NSUInteger v6 = (Class *)off_189C61D90;
  }
  return (NSTextCheckingResult *)(id)[objc_alloc(*v6) initWithRanges:ranges count:count regularExpression:regularExpression];
}

+ (NSTextCheckingResult)phoneNumberCheckingResultWithRange:(NSRange)range phoneNumber:(NSString *)phoneNumber
{
  return (NSTextCheckingResult *) -[NSPhoneNumberCheckingResult initWithRange:phoneNumber:]( objc_alloc(&OBJC_CLASS___NSPhoneNumberCheckingResult),  "initWithRange:phoneNumber:",  range.location,  range.length,  phoneNumber);
}

+ (NSTextCheckingResult)transitInformationCheckingResultWithRange:(NSRange)range components:(NSDictionary *)components
{
  return (NSTextCheckingResult *) -[NSTransitInformationCheckingResult initWithRange:components:]( objc_alloc(&OBJC_CLASS___NSTransitInformationCheckingResult),  "initWithRange:components:",  range.location,  range.length,  components);
}

@end