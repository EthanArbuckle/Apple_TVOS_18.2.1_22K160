@interface DebugHierarchyRequestFailureReason
+ (id)_failureReasonWithReasonString:(id)a3;
+ (id)_wordStartingAfterSubstring:(id)a3 inString:(id)a4;
+ (id)_wordStartingAtIndex:(int64_t)a3 inString:(id)a4;
+ (id)failureReasonWithErrorMessage:(id)a3;
- (NSString)address;
- (NSString)code;
- (NSString)exceptionCode;
- (NSString)signal;
- (NSString)subcode;
- (void)setAddress:(id)a3;
- (void)setCode:(id)a3;
- (void)setExceptionCode:(id)a3;
- (void)setSignal:(id)a3;
- (void)setSubcode:(id)a3;
@end

@implementation DebugHierarchyRequestFailureReason

+ (id)failureReasonWithErrorMessage:(id)a3
{
  id v4 = a3;
  v5 = (char *)[v4 rangeOfString:DebugHierarchyRequestFailureReasonPrefix];
  if (v5 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0LL;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "substringFromIndex:",  &v5[(void)objc_msgSend(DebugHierarchyRequestFailureReasonPrefix, "length")]));
    v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _failureReasonWithReasonString:v7]);
  }

  return v6;
}

+ (id)_failureReasonWithReasonString:(id)a3
{
  id v4 = a3;
  v6 = (void *)objc_opt_new(&OBJC_CLASS___DebugHierarchyRequestFailureReason, v5);
  if ([v4 hasPrefix:DebugHierarchyRequestFailureReasonSignalPrefix])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_wordStartingAtIndex:inString:",  objc_msgSend(DebugHierarchyRequestFailureReasonSignalPrefix, "length"),  v4));
    [v6 setSignal:v7];
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _wordStartingAtIndex:0 inString:v4]);
    [v6 setExceptionCode:v8];

    v9 = (void *)objc_claimAutoreleasedReturnValue( [a1 _wordStartingAfterSubstring:DebugHierarchyRequestFailureReasonCodePrefix inString:v4]);
    [v6 setCode:v9];

    v10 = (void *)objc_claimAutoreleasedReturnValue( [a1 _wordStartingAfterSubstring:DebugHierarchyRequestFailureReasonSubcodePrefix inString:v4]);
    [v6 setSubcode:v10];

    v7 = (void *)objc_claimAutoreleasedReturnValue( [a1 _wordStartingAfterSubstring:DebugHierarchyRequestFailureReasonAddressPrefix inString:v4]);
    [v6 setAddress:v7];
  }

  return v6;
}

+ (id)_wordStartingAtIndex:(int64_t)a3 inString:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @" ,.")));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 substringFromIndex:a3]);

  id v8 = [v7 rangeOfCharacterFromSet:v6];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_claimAutoreleasedReturnValue([v7 substringToIndex:v8]);
  }
  v10 = v9;

  return v10;
}

+ (id)_wordStartingAfterSubstring:(id)a3 inString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (char *)[v7 rangeOfString:v6];
  else {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_wordStartingAtIndex:inString:", &v8[(void)objc_msgSend(v6, "length")], v7));
  }

  return v9;
}

- (NSString)signal
{
  return self->_signal;
}

- (void)setSignal:(id)a3
{
}

- (NSString)exceptionCode
{
  return self->_exceptionCode;
}

- (void)setExceptionCode:(id)a3
{
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
}

- (NSString)subcode
{
  return self->_subcode;
}

- (void)setSubcode:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end