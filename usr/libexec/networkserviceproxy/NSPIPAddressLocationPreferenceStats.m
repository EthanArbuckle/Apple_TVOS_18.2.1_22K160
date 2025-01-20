@interface NSPIPAddressLocationPreferenceStats
- (NSString)tierType;
- (id)analyticsDict;
- (id)eventName;
- (unint64_t)locationPreference;
- (void)setLocationPreference:(unint64_t)a3;
- (void)setTierType:(id)a3;
@end

@implementation NSPIPAddressLocationPreferenceStats

- (id)eventName
{
  return @"com.apple.nsp.ipLocationPreference";
}

- (id)analyticsDict
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPIPAddressLocationPreferenceStats tierType](self, "tierType"));

  if (v3)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPIPAddressLocationPreferenceStats locationPreference](self, "locationPreference")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v8,  @"LocationSharingPreference");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPIPAddressLocationPreferenceStats tierType](self, "tierType"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, @"TierType");

    return v7;
  }

  else
  {
    uint64_t v11 = nplog_obj(v4, v5, v6);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315138;
      v14 = "-[NSPIPAddressLocationPreferenceStats analyticsDict]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "%s called with null self.tierType",  (uint8_t *)&v13,  0xCu);
    }

    return 0LL;
  }

- (unint64_t)locationPreference
{
  return self->_locationPreference;
}

- (void)setLocationPreference:(unint64_t)a3
{
  self->_locationPreference = a3;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end