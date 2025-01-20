@interface _NSAutoCalendar
+ (BOOL)supportsSecureCoding;
- (Class)classForCoder;
- (_NSAutoCalendar)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSAutoCalendar

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_NSAutoCalendar)initWithCoder:(id)a3
{
  v22[1] = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSCalendars cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  if ([a3 containsValueForKey:@"NS.locale"])
  {
    uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.locale"];
    if (!v5)
    {

      v21 = @"NSLocalizedDescription";
      v22[0] = @"Locale has been corrupted!";
      v6 = (void *)MEMORY[0x189603F68];
      v7 = (const __CFString **)v22;
      v8 = &v21;
LABEL_14:
      objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, 1)));
      return 0LL;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  if ([a3 containsValueForKey:@"NS.timezone"])
  {
    uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.timezone"];
    if (!v9)
    {

      v19 = @"NSLocalizedDescription";
      v20 = @"Time zone has been corrupted!";
      v6 = (void *)MEMORY[0x189603F68];
      v7 = &v20;
      v8 = &v19;
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  if ([a3 containsValueForKey:@"NS.gstartdate"])
  {
    uint64_t v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.gstartdate"];
    if (!v10 || (uint64_t v11 = v10, (_NSIsNSDate() & 1) == 0))
    {

      v17 = @"NSLocalizedDescription";
      v18 = @"Gregorian start date has been corrupted!";
      v6 = (void *)MEMORY[0x189603F68];
      v7 = &v18;
      v8 = &v17;
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  else {
    uint64_t v13 = -1LL;
  }
  else {
    uint64_t v14 = -1LL;
  }

  if (v11 || v5 || v9 || v13 != -1 || v14 != -1)
  {
    v15 = (void *)[MEMORY[0x189603F38] currentCalendar];
    id v16 = v15;
    if (v5)
    {
      [v15 setLocale:v5];
      v15 = v16;
    }

    if (v9)
    {
      [v16 setTimeZone:v9];
      v15 = v16;
    }

    if (v13 != -1)
    {
      [v16 setFirstWeekday:v13];
      v15 = v16;
    }

    if (v14)
    {
      [v16 setMinimumDaysInFirstWeek:v14];
      v15 = v16;
    }

    if (v11)
    {
      [v16 setGregorianStartDate:v11];
      v15 = v16;
    }
  }

  else
  {
    v15 = (void *)[MEMORY[0x189603F38] autoupdatingCurrentCalendar];
  }

  return (_NSAutoCalendar *)v15;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

@end