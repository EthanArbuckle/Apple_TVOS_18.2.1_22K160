@interface NSPServiceStatusStats
- (NSString)tierType;
- (id)analyticsDict;
- (id)eventName;
- (unint64_t)serviceStatusActiveCount;
- (unint64_t)serviceStatusDisabledCount;
- (unint64_t)serviceStatusFraudAlertCount;
- (unint64_t)serviceStatusNetworkOutageCount;
- (unint64_t)serviceStatusOutageCount;
- (unint64_t)serviceStatusSubscriberUnsupportedRegionCount;
- (unint64_t)serviceStatusSystemIncompatibleCount;
- (unint64_t)serviceStatusUnsupportedRegionCount;
- (void)setServiceStatusActiveCount:(unint64_t)a3;
- (void)setServiceStatusDisabledCount:(unint64_t)a3;
- (void)setServiceStatusFraudAlertCount:(unint64_t)a3;
- (void)setServiceStatusNetworkOutageCount:(unint64_t)a3;
- (void)setServiceStatusOutageCount:(unint64_t)a3;
- (void)setServiceStatusSubscriberUnsupportedRegionCount:(unint64_t)a3;
- (void)setServiceStatusSystemIncompatibleCount:(unint64_t)a3;
- (void)setServiceStatusUnsupportedRegionCount:(unint64_t)a3;
- (void)setTierType:(id)a3;
@end

@implementation NSPServiceStatusStats

- (id)eventName
{
  return @"com.apple.nsp.serviceStatusStats";
}

- (id)analyticsDict
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusStats tierType](self, "tierType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"TierType");

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPServiceStatusStats serviceStatusDisabledCount](self, "serviceStatusDisabledCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  @"ServiceStatusDisabledCount");

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPServiceStatusStats serviceStatusActiveCount](self, "serviceStatusActiveCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  @"ServiceStatusActiveCount");

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPServiceStatusStats serviceStatusOutageCount](self, "serviceStatusOutageCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  @"ServiceStatusOutageCount");

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPServiceStatusStats serviceStatusFraudAlertCount](self, "serviceStatusFraudAlertCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v8,  @"ServiceStatusFraudAlertCount");

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPServiceStatusStats serviceStatusUnsupportedRegionCount]( self,  "serviceStatusUnsupportedRegionCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v9,  @"ServiceStatusUnsupportedRegionCount");

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPServiceStatusStats serviceStatusSystemIncompatibleCount]( self,  "serviceStatusSystemIncompatibleCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  @"ServiceStatusSystemIncompatibleCount");

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPServiceStatusStats serviceStatusSubscriberUnsupportedRegionCount]( self,  "serviceStatusSubscriberUnsupportedRegionCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v11,  @"ServiceStatusSubscriberUnsupportedRegionCount");

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPServiceStatusStats serviceStatusNetworkOutageCount](self, "serviceStatusNetworkOutageCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v12,  @"ServiceStatusNetworkOutageCount");

  return v3;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (unint64_t)serviceStatusDisabledCount
{
  return self->_serviceStatusDisabledCount;
}

- (void)setServiceStatusDisabledCount:(unint64_t)a3
{
  self->_serviceStatusDisabledCount = a3;
}

- (unint64_t)serviceStatusActiveCount
{
  return self->_serviceStatusActiveCount;
}

- (void)setServiceStatusActiveCount:(unint64_t)a3
{
  self->_serviceStatusActiveCount = a3;
}

- (unint64_t)serviceStatusOutageCount
{
  return self->_serviceStatusOutageCount;
}

- (void)setServiceStatusOutageCount:(unint64_t)a3
{
  self->_serviceStatusOutageCount = a3;
}

- (unint64_t)serviceStatusFraudAlertCount
{
  return self->_serviceStatusFraudAlertCount;
}

- (void)setServiceStatusFraudAlertCount:(unint64_t)a3
{
  self->_serviceStatusFraudAlertCount = a3;
}

- (unint64_t)serviceStatusUnsupportedRegionCount
{
  return self->_serviceStatusUnsupportedRegionCount;
}

- (void)setServiceStatusUnsupportedRegionCount:(unint64_t)a3
{
  self->_serviceStatusUnsupportedRegionCount = a3;
}

- (unint64_t)serviceStatusSystemIncompatibleCount
{
  return self->_serviceStatusSystemIncompatibleCount;
}

- (void)setServiceStatusSystemIncompatibleCount:(unint64_t)a3
{
  self->_serviceStatusSystemIncompatibleCount = a3;
}

- (unint64_t)serviceStatusSubscriberUnsupportedRegionCount
{
  return self->_serviceStatusSubscriberUnsupportedRegionCount;
}

- (void)setServiceStatusSubscriberUnsupportedRegionCount:(unint64_t)a3
{
  self->_serviceStatusSubscriberUnsupportedRegionCount = a3;
}

- (unint64_t)serviceStatusNetworkOutageCount
{
  return self->_serviceStatusNetworkOutageCount;
}

- (void)setServiceStatusNetworkOutageCount:(unint64_t)a3
{
  self->_serviceStatusNetworkOutageCount = a3;
}

- (void).cxx_destruct
{
}

@end