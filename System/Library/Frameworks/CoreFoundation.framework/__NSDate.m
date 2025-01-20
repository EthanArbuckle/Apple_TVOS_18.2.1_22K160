@interface __NSDate
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (__NSDate)initWithTimeIntervalSinceReferenceDate:(double)a3;
- (double)timeIntervalSinceReferenceDate;
- (void)dealloc;
@end

@implementation __NSDate

- (double)timeIntervalSinceReferenceDate
{
  return self->_time;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS_____NSDate;
  -[__NSDate dealloc](&v2, sel_dealloc);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return &___immutablePlaceholderDate;
}

- (__NSDate)initWithTimeIntervalSinceReferenceDate:(double)a3
{
  return (__NSDate *)-[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  a3);
}

@end