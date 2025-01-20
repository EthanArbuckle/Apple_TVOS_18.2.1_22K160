@interface NSPBadTokenInfoStats
- (NSString)configTag;
- (NSString)tierType;
- (NSString)tokenProxy;
- (id)analyticsDict;
- (id)eventName;
- (unint64_t)configAgeHours;
- (void)setConfigAgeHours:(unint64_t)a3;
- (void)setConfigTag:(id)a3;
- (void)setTierType:(id)a3;
- (void)setTokenProxy:(id)a3;
@end

@implementation NSPBadTokenInfoStats

- (id)eventName
{
  return @"com.apple.nsp.badTokenInfoStats";
}

- (id)analyticsDict
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPBadTokenInfoStats tierType](self, "tierType"));

  if (!v3)
  {
    uint64_t v17 = nplog_obj(v4, v5, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      return 0LL;
    }

    int v21 = 136315138;
    v22 = "-[NSPBadTokenInfoStats analyticsDict]";
    v19 = "%s called with null self.tierType";
LABEL_10:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_FAULT, v19, (uint8_t *)&v21, 0xCu);
    goto LABEL_8;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPBadTokenInfoStats tokenProxy](self, "tokenProxy"));

  if (!v7)
  {
    uint64_t v20 = nplog_obj(v8, v9, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v21 = 136315138;
    v22 = "-[NSPBadTokenInfoStats analyticsDict]";
    v19 = "%s called with null self.tokenProxy";
    goto LABEL_10;
  }

  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPBadTokenInfoStats tierType](self, "tierType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, @"TierType");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPBadTokenInfoStats tokenProxy](self, "tokenProxy"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v13, @"TokenProxy");

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPBadTokenInfoStats configAgeHours](self, "configAgeHours")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, @"ConfigAge");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPBadTokenInfoStats configTag](self, "configTag"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v15, @"ConfigTag");

  return v11;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (NSString)tokenProxy
{
  return self->_tokenProxy;
}

- (void)setTokenProxy:(id)a3
{
}

- (unint64_t)configAgeHours
{
  return self->_configAgeHours;
}

- (void)setConfigAgeHours:(unint64_t)a3
{
  self->_configAgeHours = a3;
}

- (NSString)configTag
{
  return self->_configTag;
}

- (void)setConfigTag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end