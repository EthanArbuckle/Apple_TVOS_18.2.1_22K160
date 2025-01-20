@interface __NSTaggedDate
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (__NSTaggedDate)initWithTimeIntervalSinceReferenceDate:(double)a3;
- (double)timeIntervalSinceReferenceDate;
- (void)dealloc;
@end

@implementation __NSTaggedDate

- (double)timeIntervalSinceReferenceDate
{
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v3 = 0LL;
    uint64_t v5 = *MEMORY[0x189616658];
    unint64_t v2 = v5 ^ (unint64_t)self;
    unint64_t v4 = v2 & 7;
    do
    {
      ++v3;
    }

    while (v3 != 7);
  }

  do
  {
    __break(1u);
LABEL_8:
    ;
  }

  while (v3 != 6);
  uint64_t v6 = 0xFFFFFFFFFFFFFFFLL;
  if (v4 == 7) {
    uint64_t v6 = 0xFFFFFFFFFFFFFLL;
  }
  return decodeTaggedTimeInterval(v6 & (v2 >> 3));
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS_____NSTaggedDate;
  -[__NSTaggedDate dealloc](&v2, sel_dealloc);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return &___immutablePlaceholderDate;
}

- (__NSTaggedDate)initWithTimeIntervalSinceReferenceDate:(double)a3
{
  return (__NSTaggedDate *)-[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  a3);
}

@end