@interface NSDateFormatter
- (id)dateFromServerString:(id)a3 withError:(id *)a4;
@end

@implementation NSDateFormatter

- (id)dateFromServerString:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  memset(&v22, 0, sizeof(v22));
  if (v5)
  {
    if (strptime_l( (const char *)[v5 UTF8String], "%a, %d %b %Y %H:%M:%S %Z", &v22, 0))
    {
      time_t v7 = mktime(&v22);
      if (v7 == -1)
      {
        uint64_t v14 = *__error();
        v15 = __error();
        v21 = strerror(*v15);
        MobileActivationError = createMobileActivationError( (uint64_t)"-[NSDateFormatter(MobileActivation) dateFromServerString:withError:]",  38LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create raw time: %d (%s)",  v14,  v21,  *(void *)&v22.tm_sec,  *(void *)&v22.tm_hour,  *(void *)&v22.tm_mon,  *(void *)&v22.tm_wday,  *(void *)&v22.tm_isdst,  v22.tm_gmtoff,  v22.tm_zone);
      }

      else
      {
        v8 = -[NSDate initWithTimeIntervalSince1970:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSince1970:",  (double)v7);
        if (v8)
        {
          v9 = v8;
          v10 = 0LL;
          goto LABEL_13;
        }

        MobileActivationError = createMobileActivationError( (uint64_t)"-[NSDateFormatter(MobileActivation) dateFromServerString:withError:]",  44LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create date.",  v18,  v19,  *(void *)&v22.tm_sec,  *(void *)&v22.tm_hour,  *(void *)&v22.tm_mon,  *(void *)&v22.tm_wday,  *(void *)&v22.tm_isdst,  v22.tm_gmtoff,  v22.tm_zone);
      }
    }

    else
    {
      uint64_t v12 = *__error();
      v13 = __error();
      v20 = strerror(*v13);
      MobileActivationError = createMobileActivationError( (uint64_t)"-[NSDateFormatter(MobileActivation) dateFromServerString:withError:]",  32LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create time object: %d (%s)",  v12,  v20,  *(void *)&v22.tm_sec,  *(void *)&v22.tm_hour,  *(void *)&v22.tm_mon,  *(void *)&v22.tm_wday,  *(void *)&v22.tm_isdst,  v22.tm_gmtoff,  v22.tm_zone);
    }
  }

  else
  {
    MobileActivationError = createMobileActivationError( (uint64_t)"-[NSDateFormatter(MobileActivation) dateFromServerString:withError:]",  27LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid input.",  v18,  v19,  *(void *)&v22.tm_sec,  *(void *)&v22.tm_hour,  *(void *)&v22.tm_mon,  *(void *)&v22.tm_wday,  *(void *)&v22.tm_isdst,  v22.tm_gmtoff,  v22.tm_zone);
  }

  v16 = MobileActivationError;
  v10 = v16;
  if (a4)
  {
    v10 = v16;
    v9 = 0LL;
    *a4 = v10;
  }

  else
  {
    v9 = 0LL;
  }

@end