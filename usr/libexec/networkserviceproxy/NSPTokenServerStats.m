@interface NSPTokenServerStats
- (NSString)tierType;
- (NSString)tokenServerAddress;
- (id)analyticsDict;
- (id)eventName;
- (void)setTierType:(id)a3;
- (void)setTokenServerAddress:(id)a3;
@end

@implementation NSPTokenServerStats

- (id)eventName
{
  return @"com.apple.nsp.tokenServerStats";
}

- (id)analyticsDict
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPTokenServerStats tierType](self, "tierType"));

  if (!v3)
  {
    uint64_t v15 = nplog_obj(v4, v5, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      return 0LL;
    }

    int v19 = 136315138;
    v20 = "-[NSPTokenServerStats analyticsDict]";
    v17 = "%s called with null self.tierType";
LABEL_10:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_FAULT, v17, (uint8_t *)&v19, 0xCu);
    goto LABEL_8;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPTokenServerStats tokenServerAddress](self, "tokenServerAddress"));

  if (!v7)
  {
    uint64_t v18 = nplog_obj(v8, v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v19 = 136315138;
    v20 = "-[NSPTokenServerStats analyticsDict]";
    v17 = "%s called with null self.tokenServerAddress";
    goto LABEL_10;
  }

  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPTokenServerStats tierType](self, "tierType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, @"TierType");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPTokenServerStats tokenServerAddress](self, "tokenServerAddress"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v13,  @"TokenServerAddress");

  return v11;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (NSString)tokenServerAddress
{
  return self->_tokenServerAddress;
}

- (void)setTokenServerAddress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end