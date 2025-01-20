@interface NSDate(NSURLExtras)
- (BOOL)_web_isToday;
- (NSString)_web_RFC1123DateString;
- (uint64_t)_web_compareDay:()NSURLExtras;
@end

@implementation NSDate(NSURLExtras)

- (NSString)_web_RFC1123DateString
{
  if (v1 < -1.26227808e10) {
    double v1 = -1.26227808e10;
  }
  if (v1 <= 1.26227808e10) {
    double v2 = v1;
  }
  else {
    double v2 = 1.26227808e10;
  }
  id v3 = objc_alloc(MEMORY[0x189603F38]);
  id v4 = (id)[v3 initWithCalendarIdentifier:*MEMORY[0x1896039C8]];
  objc_msgSend(v4, "setTimeZone:", objc_msgSend(MEMORY[0x189604020], "timeZoneWithName:", @"GMT"));
  v5 = (void *)objc_msgSend( v4,  "components:fromDate:",  764,  objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSinceReferenceDate:", v2));
  return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%s, %02ld %s %ld %02ld:%02ld:%02ld GMT",  kDayStrs[[v5 weekday] - 1],  objc_msgSend(v5, "day"),  kMonthStrs[objc_msgSend(v5, "month") - 1],  objc_msgSend(v5, "year"),  objc_msgSend(v5, "hour"),  objc_msgSend(v5, "minute"),  objc_msgSend(v5, "second"));
}

- (uint64_t)_web_compareDay:()NSURLExtras
{
  if (a1 == a3) {
    return 0LL;
  }
  id v5 = objc_alloc(MEMORY[0x189603F38]);
  id v6 = (id)[v5 initWithCalendarIdentifier:*MEMORY[0x1896039C8]];
  v7 = (void *)[v6 components:28 fromDate:a1];
  v8 = (void *)[v6 components:28 fromDate:a3];
  uint64_t v9 = [v7 year];
  uint64_t v10 = [v8 year];
  if (v9 < v10) {
    return -1LL;
  }
  if (v9 > v10) {
    return 1LL;
  }
  uint64_t v11 = [v7 month];
  uint64_t v12 = [v8 month];
  if (v11 < v12) {
    return -1LL;
  }
  if (v11 > v12) {
    return 1LL;
  }
  uint64_t v14 = [v7 day];
  uint64_t v15 = [v8 day];
  if (v14 < v15) {
    return -1LL;
  }
  else {
    return v14 > v15;
  }
}

- (BOOL)_web_isToday
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x189603F50], "date"), "_web_compareDay:", a1) == 0;
}

@end