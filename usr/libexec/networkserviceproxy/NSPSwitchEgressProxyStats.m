@interface NSPSwitchEgressProxyStats
- (BOOL)fallbackProxy;
- (BOOL)primaryProxy;
- (NSString)tierType;
- (NSString)vendor;
- (id)analyticsDict;
- (id)eventName;
- (void)setFallbackProxy:(BOOL)a3;
- (void)setPrimaryProxy:(BOOL)a3;
- (void)setTierType:(id)a3;
- (void)setVendor:(id)a3;
@end

@implementation NSPSwitchEgressProxyStats

- (id)eventName
{
  return @"com.apple.nsp.SwitchEgressProxyStats";
}

- (id)analyticsDict
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPSwitchEgressProxyStats tierType](self, "tierType"));

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
    v22 = "-[NSPSwitchEgressProxyStats analyticsDict]";
    v19 = "%s called with null self.tierType";
LABEL_10:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_FAULT, v19, (uint8_t *)&v21, 0xCu);
    goto LABEL_8;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPSwitchEgressProxyStats vendor](self, "vendor"));

  if (!v7)
  {
    uint64_t v20 = nplog_obj(v8, v9, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v21 = 136315138;
    v22 = "-[NSPSwitchEgressProxyStats analyticsDict]";
    v19 = "%s called with null self.vendor";
    goto LABEL_10;
  }

  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPSwitchEgressProxyStats tierType](self, "tierType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, @"TierType");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPSwitchEgressProxyStats vendor](self, "vendor"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v13, @"Vendor");

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPSwitchEgressProxyStats primaryProxy](self, "primaryProxy")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, @"PrimaryProxy");

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPSwitchEgressProxyStats fallbackProxy](self, "fallbackProxy")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v15, @"FallbackProxy");

  return v11;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (NSString)vendor
{
  return self->_vendor;
}

- (void)setVendor:(id)a3
{
}

- (BOOL)primaryProxy
{
  return self->_primaryProxy;
}

- (void)setPrimaryProxy:(BOOL)a3
{
  self->_primaryProxy = a3;
}

- (BOOL)fallbackProxy
{
  return self->_fallbackProxy;
}

- (void)setFallbackProxy:(BOOL)a3
{
  self->_fallbackProxy = a3;
}

- (void).cxx_destruct
{
}

@end