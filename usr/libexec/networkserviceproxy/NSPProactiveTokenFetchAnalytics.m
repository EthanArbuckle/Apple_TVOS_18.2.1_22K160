@interface NSPProactiveTokenFetchAnalytics
- (BOOL)tokenFetchTriggered;
- (NSDate)fromDate;
- (NSDate)toDate;
- (NSDictionary)stats;
- (NSString)type;
- (NSString)vendor;
- (id)analyticsDict;
- (id)eventName;
- (void)setFromDate:(id)a3;
- (void)setStats:(id)a3;
- (void)setToDate:(id)a3;
- (void)setTokenFetchTriggered:(BOOL)a3;
- (void)setType:(id)a3;
- (void)setVendor:(id)a3;
@end

@implementation NSPProactiveTokenFetchAnalytics

- (id)eventName
{
  return @"com.apple.nsp.proactiveTokenFetch";
}

- (id)analyticsDict
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  v6 = v3;
  if (!v3)
  {
    uint64_t v23 = nplog_obj(0LL, v4, v5);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      int v26 = 136315138;
      v27 = "-[NSPProactiveTokenFetchAnalytics analyticsDict]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_FAULT,  "%s called with null dateFormatter",  (uint8_t *)&v26,  0xCu);
    }

    goto LABEL_13;
  }

  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimeZone timeZoneWithAbbreviation:]( &OBJC_CLASS___NSTimeZone,  "timeZoneWithAbbreviation:",  @"UTC"));
  -[NSDateFormatter setTimeZone:](v6, "setTimeZone:", v7);

  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (!v8)
  {
    uint64_t v24 = nplog_obj(0LL, v9, v10);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      int v26 = 136315138;
      v27 = "-[NSPProactiveTokenFetchAnalytics analyticsDict]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_FAULT,  "%s called with null dictionary",  (uint8_t *)&v26,  0xCu);
    }

    v20 = 0LL;
LABEL_13:
    v21 = 0LL;
    goto LABEL_7;
  }

  v11 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProactiveTokenFetchAnalytics vendor](self, "vendor"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, @"Vendor");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProactiveTokenFetchAnalytics type](self, "type"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v13, @"Type");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProactiveTokenFetchAnalytics stats](self, "stats"));
  -[NSMutableDictionary addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProactiveTokenFetchAnalytics fromDate](self, "fromDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v6, "stringFromDate:", v15));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v16, @"FromDate");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProactiveTokenFetchAnalytics toDate](self, "toDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v6, "stringFromDate:", v17));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v18, @"ToDate");

  if (-[NSPProactiveTokenFetchAnalytics tokenFetchTriggered](self, "tokenFetchTriggered")) {
    v19 = @"Yes";
  }
  else {
    v19 = @"No";
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v19,  @"TokenFetchTriggered");
  v20 = v11;
  v21 = v20;
LABEL_7:

  return v21;
}

- (NSDictionary)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
  self->_stats = (NSDictionary *)a3;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  self->_type = (NSString *)a3;
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (void)setFromDate:(id)a3
{
  self->_fromDate = (NSDate *)a3;
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (void)setToDate:(id)a3
{
  self->_toDate = (NSDate *)a3;
}

- (NSString)vendor
{
  return self->_vendor;
}

- (void)setVendor:(id)a3
{
  self->_vendor = (NSString *)a3;
}

- (BOOL)tokenFetchTriggered
{
  return self->_tokenFetchTriggered;
}

- (void)setTokenFetchTriggered:(BOOL)a3
{
  self->_tokenFetchTriggered = a3;
}

@end