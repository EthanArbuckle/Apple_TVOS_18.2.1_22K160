@interface NSDateInterval
+ (BOOL)supportsSecureCoding;
+ (NSDateInterval)allocWithZone:(_NSZone *)a3;
- (BOOL)containsDate:(NSDate *)date;
- (BOOL)intersectsDateInterval:(NSDateInterval *)dateInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDateInterval:(NSDateInterval *)dateInterval;
- (NSComparisonResult)compare:(NSDateInterval *)dateInterval;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateInterval)init;
- (NSDateInterval)initWithCoder:(NSCoder *)coder;
- (NSDateInterval)initWithStartDate:(NSDate *)startDate duration:(NSTimeInterval)duration;
- (NSDateInterval)initWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;
- (NSDateInterval)intersectionWithDateInterval:(NSDateInterval *)dateInterval;
- (NSTimeInterval)duration;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSDateInterval

+ (NSDateInterval)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSDateInterval == a1) {
    return (NSDateInterval *)+[NSDateInterval allocWithZone:]( &OBJC_CLASS____NSConcreteDateInterval,  "allocWithZone:",  a3);
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSDateInterval;
  return (NSDateInterval *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSDateInterval)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSDateInterval;
  return -[NSDateInterval init](&v3, sel_init);
}

- (NSDateInterval)initWithStartDate:(NSDate *)startDate duration:(NSTimeInterval)duration
{
  v6 = NSClassFromString((NSString *)@"NSDateInterval");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSDateInterval)initWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  v6 = NSClassFromString((NSString *)@"NSDateInterval");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSDate)startDate
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSDateInterval");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDate)endDate
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSDateInterval");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSTimeInterval)duration
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSDateInterval");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSComparisonResult)compare:(NSDateInterval *)dateInterval
{
  if (self == dateInterval) {
    return 0LL;
  }
  if (!dateInterval) {
    return 1LL;
  }
  NSComparisonResult result = -[NSDate compare:]( -[NSDateInterval startDate](self, "startDate"),  "compare:",  -[NSDateInterval startDate](dateInterval, "startDate"));
  if (result == NSOrderedSame)
  {
    -[NSDateInterval duration](self, "duration");
    double v7 = v6;
    -[NSDateInterval duration](dateInterval, "duration");
    if (v7 >= v8)
    {
      -[NSDateInterval duration](self, "duration");
      double v10 = v9;
      -[NSDateInterval duration](dateInterval, "duration");
      return (unint64_t)(v10 > v11);
    }

    else
    {
      return -1LL;
    }
  }

  return result;
}

- (id)description
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSDateInterval;
  id v3 = -[NSDateInterval description](&v7, sel_description);
  uint64_t v4 = -[NSDateInterval startDate](self, "startDate");
  -[NSDateInterval duration](self, "duration");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (Start Date) %@ + (Duration) %f seconds = (End Date) %@",  v3,  v4,  v5,  -[NSDateInterval endDate](self, "endDate"));
}

- (unint64_t)hash
{
  return CFHashBytes();
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      return -[NSDateInterval isEqualToDateInterval:](self, "isEqualToDateInterval:", a3);
    }
  }

  return 0;
}

- (BOOL)isEqualToDateInterval:(NSDateInterval *)dateInterval
{
  if (!dateInterval) {
    return 0;
  }
  if (-[NSDate isEqualToDate:]( -[NSDateInterval startDate](self, "startDate"),  "isEqualToDate:",  -[NSDateInterval startDate](dateInterval, "startDate")))
  {
    -[NSDateInterval duration](self, "duration");
    double v6 = v5;
    -[NSDateInterval duration](dateInterval, "duration");
    if (v6 == v7) {
      return 1;
    }
  }

  return 0;
}

- (BOOL)intersectsDateInterval:(NSDateInterval *)dateInterval
{
  if (!dateInterval) {
    return 0;
  }
  if (-[NSDateInterval containsDate:](self, "containsDate:", -[NSDateInterval startDate](dateInterval, "startDate"))
    || -[NSDateInterval containsDate:](dateInterval, "containsDate:", -[NSDateInterval startDate](self, "startDate")))
  {
    return 1;
  }

  -[NSDate timeIntervalSinceReferenceDate]( -[NSDateInterval startDate](dateInterval, "startDate"),  "timeIntervalSinceReferenceDate");
  double v6 = v5;
  -[NSDateInterval duration](dateInterval, "duration");
  double v8 = v6 + v7;
  -[NSDate timeIntervalSinceReferenceDate]( -[NSDateInterval startDate](self, "startDate"),  "timeIntervalSinceReferenceDate");
  double v10 = v9;
  -[NSDateInterval duration](self, "duration");
  double v12 = v10 + v11;
  if (v8 >= v10 && v8 <= v12) {
    return 1;
  }
  if (v12 <= v8) {
    return v12 >= v6;
  }
  return 0;
}

- (NSDateInterval)intersectionWithDateInterval:(NSDateInterval *)dateInterval
{
  if (-[NSDateInterval isEqualToDateInterval:](self, "isEqualToDateInterval:", dateInterval))
  {
    double v5 = (NSDateInterval *)-[NSDateInterval copy](self, "copy");
  }

  else
  {
    -[NSDate timeIntervalSinceReferenceDate]( -[NSDateInterval startDate](self, "startDate"),  "timeIntervalSinceReferenceDate");
    double v8 = v7;
    -[NSDateInterval duration](self, "duration");
    double v10 = v8 + v9;
    -[NSDate timeIntervalSinceReferenceDate]( -[NSDateInterval startDate](dateInterval, "startDate"),  "timeIntervalSinceReferenceDate");
    double v12 = v11;
    -[NSDateInterval duration](dateInterval, "duration");
    double v14 = v12 + v13;
    if (v12 >= v8)
    {
      v15 = -[NSDateInterval startDate](dateInterval, "startDate");
    }

    else
    {
      v15 = -[NSDateInterval startDate](self, "startDate");
      double v12 = v8;
    }

    if (v14 < v10) {
      double v16 = v14;
    }
    else {
      double v16 = v10;
    }
    double v5 = -[NSDateInterval initWithStartDate:duration:]( objc_alloc(&OBJC_CLASS___NSDateInterval),  "initWithStartDate:duration:",  v15,  v16 - v12);
  }

  return v5;
}

- (BOOL)containsDate:(NSDate *)date
{
  if (!date) {
    return 0;
  }
  -[NSDate timeIntervalSinceReferenceDate](date, "timeIntervalSinceReferenceDate");
  double v5 = v4;
  -[NSDate timeIntervalSinceReferenceDate]( -[NSDateInterval startDate](self, "startDate"),  "timeIntervalSinceReferenceDate");
  double v7 = v6;
  -[NSDateInterval duration](self, "duration");
  return v5 <= v7 + v8 && v5 >= v7;
}

- (NSDateInterval)initWithCoder:(NSCoder *)coder
{
  if (-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {
    id v5 = -[NSCoder decodeObjectOfClass:forKey:]( coder,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NS.startDate");
    if (!v5) {
      goto LABEL_6;
    }
    id v6 = v5;
    -[NSCoder decodeDoubleForKey:](coder, "decodeDoubleForKey:", @"NS.duration");
    double v8 = v7;
    if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", @"NS.duration")) {
      return -[NSDateInterval initWithStartDate:duration:](self, "initWithStartDate:duration:", v6, v8);
    }
    id v10 = -[NSCoder decodeObjectOfClass:forKey:]( coder,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NS.endDate");
    if (!-[NSCoder error](coder, "error"))
    {
      if (!v10) {
        return -[NSDateInterval initWithStartDate:duration:](self, "initWithStartDate:duration:", v6, v8);
      }
      return -[NSDateInterval initWithStartDate:endDate:](self, "initWithStartDate:endDate:", v6, v10);
    }

    else
    {
LABEL_6:

      -[NSCoder failWithError:]( coder,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4865LL,  0LL));
      return 0LL;
    }
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSDateInterval cannot be decoded by non-keyed archivers" userInfo:0]);
    -[NSDateInterval encodeWithCoder:](v11, v12, v13);
  }

  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend(a3, "encodeObject:forKey:", -[NSDateInterval startDate](self, "startDate"), @"NS.startDate");
    objc_msgSend(a3, "encodeObject:forKey:", -[NSDateInterval endDate](self, "endDate"), @"NS.endDate");
    -[NSDateInterval duration](self, "duration");
    objc_msgSend(a3, "encodeDouble:forKey:", @"NS.duration");
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Encoder does not allow keyed coding!" userInfo:0]);
    +[NSDateInterval supportsSecureCoding](v5, v6);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end