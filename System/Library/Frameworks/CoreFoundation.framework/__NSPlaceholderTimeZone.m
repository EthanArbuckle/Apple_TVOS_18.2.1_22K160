@interface __NSPlaceholderTimeZone
- (BOOL)isDaylightSavingTimeForDate:(id)a3;
- (__NSPlaceholderTimeZone)init;
- (__NSPlaceholderTimeZone)initWithName:(id)a3;
- (__NSPlaceholderTimeZone)initWithName:(id)a3 data:(id)a4;
- (double)daylightSavingTimeOffsetForDate:(id)a3;
- (id)abbreviationForDate:(id)a3;
- (id)data;
- (id)name;
- (id)nextDaylightSavingTimeTransitionAfterDate:(id)a3;
- (int64_t)secondsFromGMTForDate:(id)a3;
- (unint64_t)retainCount;
@end

@implementation __NSPlaceholderTimeZone

- (__NSPlaceholderTimeZone)initWithName:(id)a3 data:(id)a4
{
  if (a3) {
    return (__NSPlaceholderTimeZone *)(id)+[NSTimeZone _timeZoneWithName:data:]( &OBJC_CLASS___NSTimeZone,  "_timeZoneWithName:data:",  a3,  a4);
  }
  else {
    return 0LL;
  }
}

- (__NSPlaceholderTimeZone)initWithName:(id)a3
{
  if (a3) {
    return (__NSPlaceholderTimeZone *)(id)+[NSTimeZone _timeZoneWithName:]( &OBJC_CLASS___NSTimeZone,  "_timeZoneWithName:");
  }
  else {
    return 0LL;
  }
}

- (__NSPlaceholderTimeZone)init
{
  return 0LL;
}

- (unint64_t)retainCount
{
  return -1LL;
}

- (id)name
{
  v4 = __CFLookUpClass("NSTimeZone");
  uint64_t v5 = __CFFullMethodName(v4, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized time zone object",  v5);
  v6 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v6);
  return -[__NSPlaceholderTimeZone data](v7, v8);
}

- (id)data
{
  v4 = __CFLookUpClass("NSTimeZone");
  uint64_t v5 = __CFFullMethodName(v4, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized time zone object",  v5);
  v6 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v6);
  return (id)-[__NSPlaceholderTimeZone secondsFromGMTForDate:](v7, v8, v9);
}

- (int64_t)secondsFromGMTForDate:(id)a3
{
  uint64_t v5 = __CFLookUpClass("NSTimeZone");
  uint64_t v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized time zone object",  v6);
  v7 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v7);
  return (int64_t)-[__NSPlaceholderTimeZone abbreviationForDate:](v8, v9, v10);
}

- (id)abbreviationForDate:(id)a3
{
  uint64_t v5 = __CFLookUpClass("NSTimeZone");
  uint64_t v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized time zone object",  v6);
  v7 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v7);
  return (id)-[__NSPlaceholderTimeZone isDaylightSavingTimeForDate:](v8, v9, v10);
}

- (BOOL)isDaylightSavingTimeForDate:(id)a3
{
  uint64_t v5 = __CFLookUpClass("NSTimeZone");
  uint64_t v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized time zone object",  v6);
  v7 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v7);
  -[__NSPlaceholderTimeZone daylightSavingTimeOffsetForDate:](v8, v9, v10);
  return result;
}

- (double)daylightSavingTimeOffsetForDate:(id)a3
{
  uint64_t v5 = __CFLookUpClass("NSTimeZone");
  uint64_t v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized time zone object",  v6);
  v7 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v7);
  -[__NSPlaceholderTimeZone nextDaylightSavingTimeTransitionAfterDate:](v8, v9, v10);
  return result;
}

- (id)nextDaylightSavingTimeTransitionAfterDate:(id)a3
{
  uint64_t v5 = __CFLookUpClass("NSTimeZone");
  uint64_t v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized time zone object",  v6);
  v7 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v7);
  -[NSTimeZone daylightSavingTimeOffsetForDate:](v8, v9, v10);
  return result;
}

@end