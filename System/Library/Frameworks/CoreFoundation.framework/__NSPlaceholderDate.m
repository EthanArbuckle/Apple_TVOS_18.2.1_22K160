@interface __NSPlaceholderDate
+ (void)initialize;
- (__NSPlaceholderDate)init;
- (__NSPlaceholderDate)initWithTimeIntervalSinceReferenceDate:(double)a3;
- (double)timeIntervalSinceReferenceDate;
- (unint64_t)retainCount;
@end

@implementation __NSPlaceholderDate

+ (void)initialize
{
  if (initialize_static_init != -1) {
    dispatch_once(&initialize_static_init, &__block_literal_global_27);
  }
}

- (__NSPlaceholderDate)initWithTimeIntervalSinceReferenceDate:(double)a3
{
  if (self != (__NSPlaceholderDate *)&___immutablePlaceholderDate) {
    return 0LL;
  }
  if (a3 == 6.3113904e10)
  {
    result = (__NSPlaceholderDate *)&_NSConstantDateDistantFuture;
    goto LABEL_7;
  }

  if (a3 == -6.31140768e10)
  {
    result = (__NSPlaceholderDate *)&_NSConstantDateDistantPast;
    goto LABEL_7;
  }

  if ((_NSDateTaggedPointersDisabled & 1) == 0)
  {
    double v6 = a3;
    if (a3 == 0.0)
    {
LABEL_19:
      result = (__NSPlaceholderDate *)((8LL * *(void *)&v6) | 0x8000000000000006LL);
      unint64_t v8 = *MEMORY[0x189616658] ^ (unint64_t)result;
      if ((~v8 & 0xC000000000000007LL) != 0) {
        result = (__NSPlaceholderDate *)(v8 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v8 & 7)));
      }
LABEL_7:
      if (result) {
        return result;
      }
      goto LABEL_8;
    }

    if (a3 == -0.0)
    {
      double v6 = NAN;
      goto LABEL_19;
    }

    if (a3 == 0.0) {
      -[__NSPlaceholderDate initWithTimeIntervalSinceReferenceDate:].cold.1();
    }
    *(void *)&double v6 = *(void *)&a3 & 0xFFFFFFFFFFFFFLL | (*(void *)&a3 >> 63 << 59) | ((unint64_t)(((*(void *)&a3 >> 52) + 17) & 0x7F) << 52);
    if (((uint64_t)((unint64_t)((*(void *)&a3 >> 52) + 17) << 57) >> 57) + 1007 == ((*(void *)&a3 >> 52) & 0x7FFLL)
      && *(void *)&v6 != 0LL)
    {
      goto LABEL_19;
    }
  }

- (__NSPlaceholderDate)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return -[__NSPlaceholderDate initWithTimeIntervalSinceReferenceDate:]( self,  "initWithTimeIntervalSinceReferenceDate:",  (double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001);
}

- (unint64_t)retainCount
{
  return -1LL;
}

- (double)timeIntervalSinceReferenceDate
{
  v4 = __CFLookUpClass("NSDate");
  uint64_t v5 = __CFFullMethodName(v4, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized date object",  v5);
  double v6 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v6);
  _systemClockChangedNotification();
  return result;
}

- (void)initWithTimeIntervalSinceReferenceDate:.cold.1()
{
  __assert_rtn("encodeTaggedTimeInterval", "NSDate.m", 204, "timeInterval != 0");
}

- (void)initWithTimeIntervalSinceReferenceDate:.cold.2()
{
  __assert_rtn("__NSTaggedDate_new", "NSDate.m", 268, "ti == decodeTaggedTimeInterval(encodedBits)");
}

@end