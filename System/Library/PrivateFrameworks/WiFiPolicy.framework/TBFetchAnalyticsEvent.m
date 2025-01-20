@interface TBFetchAnalyticsEvent
+ (id)fetchEventWithSource:(unint64_t)a3 type:(unint64_t)a4 trigger:(unint64_t)a5 duration:(id)a6 requestCount:(id)a7 resultCount:(id)a8 error:(id)a9 tileKey:(id)a10;
- (NSDate)date;
- (NSDictionary)eventDictionary;
- (NSError)error;
- (NSNumber)duration;
- (NSNumber)requestCount;
- (NSNumber)resultCount;
- (NSString)eventName;
- (NSString)tileKey;
- (unint64_t)source;
- (unint64_t)trigger;
- (unint64_t)type;
- (void)setDate:(id)a3;
- (void)setDuration:(id)a3;
- (void)setError:(id)a3;
- (void)setRequestCount:(id)a3;
- (void)setResultCount:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setTileKey:(id)a3;
- (void)setTrigger:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TBFetchAnalyticsEvent

+ (id)fetchEventWithSource:(unint64_t)a3 type:(unint64_t)a4 trigger:(unint64_t)a5 duration:(id)a6 requestCount:(id)a7 resultCount:(id)a8 error:(id)a9 tileKey:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  v21 = objc_alloc_init(&OBJC_CLASS___TBFetchAnalyticsEvent);
  -[TBFetchAnalyticsEvent setSource:](v21, "setSource:", a3);
  -[TBFetchAnalyticsEvent setType:](v21, "setType:", a4);
  -[TBFetchAnalyticsEvent setTrigger:](v21, "setTrigger:", a5);
  -[TBFetchAnalyticsEvent setDuration:](v21, "setDuration:", v20);

  -[TBFetchAnalyticsEvent setRequestCount:](v21, "setRequestCount:", v19);
  -[TBFetchAnalyticsEvent setResultCount:](v21, "setResultCount:", v18);

  -[TBFetchAnalyticsEvent setError:](v21, "setError:", v17);
  [MEMORY[0x189603F50] date];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TBFetchAnalyticsEvent setDate:](v21, "setDate:", v22);

  -[TBFetchAnalyticsEvent setTileKey:](v21, "setTileKey:", v16);
  return v21;
}

- (NSDictionary)eventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[TBFetchAnalyticsEvent source](self, "source"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKey:@"source"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[TBFetchAnalyticsEvent type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v5 forKey:@"type"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[TBFetchAnalyticsEvent trigger](self, "trigger"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v6 forKey:@"trigger"];
  v7 = -[TBFetchAnalyticsEvent duration](self, "duration");
  if (v7)
  {
    v8 = -[TBFetchAnalyticsEvent duration](self, "duration");
    [v3 setObject:v8 forKey:@"duration"];
  }
  v9 = -[TBFetchAnalyticsEvent requestCount](self, "requestCount");
  if (v9)
  {
    v10 = -[TBFetchAnalyticsEvent requestCount](self, "requestCount");
    [v3 setObject:v10 forKey:@"requestCount"];
  }
  v11 = -[TBFetchAnalyticsEvent resultCount](self, "resultCount");
  if (v11)
  {
    v12 = -[TBFetchAnalyticsEvent resultCount](self, "resultCount");
    [v3 setObject:v12 forKey:@"resultCount"];
  }
  v13 = -[TBFetchAnalyticsEvent error](self, "error");
  if (v13)
  {
    v14 = (void *)MEMORY[0x189607968];
    v15 = -[TBFetchAnalyticsEvent error](self, "error");
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "code"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v16 forKey:@"errorCode"];
  }

  -[TBFetchAnalyticsEvent date](self, "date");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    [MEMORY[0x189603F38] currentCalendar];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TBFetchAnalyticsEvent date](self, "date");
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 components:96 fromDate:v19];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v21 = [v20 hour];
    [MEMORY[0x189607968] numberWithInteger:v21];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v22 forKey:@"hour"];
  }
  v23 = -[TBFetchAnalyticsEvent tileKey](self, "tileKey");
  if (v23)
  {
    v24 = -[TBFetchAnalyticsEvent tileKey](self, "tileKey");
    [v3 setObject:v24 forKey:@"tileKey"];
  }

  return (NSDictionary *)v3;
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.wifi.3bars.Fetch";
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(unint64_t)a3
{
  self->_trigger = a3;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSNumber)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(id)a3
{
}

- (NSNumber)resultCount
{
  return self->_resultCount;
}

- (void)setResultCount:(id)a3
{
}

- (NSString)tileKey
{
  return self->_tileKey;
}

- (void)setTileKey:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end