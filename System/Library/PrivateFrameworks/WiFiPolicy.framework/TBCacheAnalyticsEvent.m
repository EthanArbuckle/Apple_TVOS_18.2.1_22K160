@interface TBCacheAnalyticsEvent
+ (id)cacheAnalyticsEventWithStatus:(unint64_t)a3 staleness:(unint64_t)a4 tileKey:(unint64_t)a5 type:(unint64_t)a6 error:(id)a7;
+ (id)cacheAvailabilityEventWithStatus:(unint64_t)a3;
+ (id)cacheEventWithTotalCount:(unint64_t)a3 last24HoursCount:(unint64_t)a4;
- (NSDictionary)eventDictionary;
- (NSNumber)errorCode;
- (NSNumber)staleness;
- (NSNumber)tileKey;
- (NSNumber)type;
- (NSString)eventName;
- (unint64_t)status;
- (void)setErrorCode:(id)a3;
- (void)setEventDictionary:(id)a3;
- (void)setEventName:(id)a3;
- (void)setStaleness:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTileKey:(id)a3;
- (void)setType:(id)a3;
@end

@implementation TBCacheAnalyticsEvent

+ (id)cacheAnalyticsEventWithStatus:(unint64_t)a3 staleness:(unint64_t)a4 tileKey:(unint64_t)a5 type:(unint64_t)a6 error:(id)a7
{
  id v11 = a7;
  v12 = objc_alloc_init(&OBJC_CLASS___TBCacheAnalyticsEvent);
  -[TBCacheAnalyticsEvent setEventName:](v12, "setEventName:", @"com.apple.wifi.3bars.cache_miss");
  id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
  [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 setObject:v14 forKey:@"status"];

  if (a4)
  {
    [MEMORY[0x189607968] numberWithUnsignedInteger:a4];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setObject:v15 forKey:@"staleness"];
  }

  if (a5)
  {
    [MEMORY[0x189607968] numberWithUnsignedInteger:a5];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setObject:v16 forKey:@"tileKey"];
  }

  if (v11)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v11, "code"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setObject:v17 forKey:@"error"];
  }

  [MEMORY[0x189607968] numberWithUnsignedInteger:a6];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 setObject:v18 forKey:@"type"];

  -[TBCacheAnalyticsEvent setEventDictionary:](v12, "setEventDictionary:", v13);
  return v12;
}

+ (id)cacheEventWithTotalCount:(unint64_t)a3 last24HoursCount:(unint64_t)a4
{
  v6 = objc_alloc_init(&OBJC_CLASS___TBCacheAnalyticsEvent);
  -[TBCacheAnalyticsEvent setEventName:](v6, "setEventName:", @"com.apple.wifi.3bars.cache");
  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v8 forKey:@"total"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:a4];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v9 forKey:@"recent"];

  -[TBCacheAnalyticsEvent setEventDictionary:](v6, "setEventDictionary:", v7);
  return v6;
}

+ (id)cacheAvailabilityEventWithStatus:(unint64_t)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___TBCacheAnalyticsEvent);
  -[TBCacheAnalyticsEvent setEventName:](v4, "setEventName:", @"com.apple.wifi.3bars.cache_availability");
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v6 forKey:@"status"];

  id v7 = (void *)MEMORY[0x1895BA820]();
  [MEMORY[0x189603F38] currentCalendar];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] date];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 components:96 fromDate:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = [v10 hour];
  [MEMORY[0x189607968] numberWithInteger:v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v12 forKey:@"hour"];

  objc_autoreleasePoolPop(v7);
  -[TBCacheAnalyticsEvent setEventDictionary:](v4, "setEventDictionary:", v5);

  return v4;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (NSNumber)staleness
{
  return self->_staleness;
}

- (void)setStaleness:(id)a3
{
  self->_staleness = (NSNumber *)a3;
}

- (NSNumber)tileKey
{
  return self->_tileKey;
}

- (void)setTileKey:(id)a3
{
  self->_tileKey = (NSNumber *)a3;
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  self->_type = (NSNumber *)a3;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  self->_errorCode = (NSNumber *)a3;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
}

- (NSDictionary)eventDictionary
{
  return self->_eventDictionary;
}

- (void)setEventDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end