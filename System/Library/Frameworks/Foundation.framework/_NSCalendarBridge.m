@interface _NSCalendarBridge
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (_NSCalendarBridge)initWithCalendarIdentifier:(id)a3;
- (id)_components:(unint64_t)a3 fromDate:(id)a4;
- (id)_componentsInTimeZone:(id)a3 fromDate:(id)a4;
- (id)_dateFromComponents:(id)a3;
- (id)components:(unint64_t)a3 fromDate:(id)a4;
- (id)componentsInTimeZone:(id)a3 fromDate:(id)a4;
- (id)dateFromComponents:(id)a3;
- (void)_enumerateDatesStartingAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (void)enumerateDatesStartingAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6;
@end

@implementation _NSCalendarBridge

- (_NSCalendarBridge)initWithCalendarIdentifier:(id)a3
{
  else {
    return 0LL;
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)enumerateDatesStartingAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  v6[5] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __91___NSCalendarBridge_enumerateDatesStartingAfterDate_matchingComponents_options_usingBlock___block_invoke;
    v6[3] = &unk_189C999A8;
    v6[4] = a6;
    -[_NSCalendarBridge _enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:]( self,  "_enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:",  a3,  a4,  a5,  v6);
  }

- (void)_enumerateDatesStartingAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  v8 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v8);
}

- (id)componentsInTimeZone:(id)a3 fromDate:(id)a4
{
  if (!a3)
  {
    a3 = (id)-[_NSCalendarBridge timeZone](self, "timeZone");
    if (!a3) {
      a3 = (id)[MEMORY[0x189604020] systemTimeZone];
    }
  }

  return -[_NSCalendarBridge _componentsInTimeZone:fromDate:](self, "_componentsInTimeZone:fromDate:", a3, a4);
}

- (id)_componentsInTimeZone:(id)a3 fromDate:(id)a4
{
  v6 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)components:(unint64_t)a3 fromDate:(id)a4
{
  if (a4) {
    return -[_NSCalendarBridge _components:fromDate:](self, "_components:fromDate:", a3);
  }
  else {
    return 0LL;
  }
}

- (id)_components:(unint64_t)a3 fromDate:(id)a4
{
  v6 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)dateFromComponents:(id)a3
{
  if (a3) {
    return -[_NSCalendarBridge _dateFromComponents:](self, "_dateFromComponents:");
  }
  else {
    return 0LL;
  }
}

- (id)_dateFromComponents:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

@end