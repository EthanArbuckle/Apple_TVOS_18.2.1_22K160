@interface IDSConnectivityMonitorMetric
- (IDSConnectivityMonitorMetric)initWithProperties:(id)a3;
- (IDSConnectivityMonitorMetricProperties)properties;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (unsigned)rtcType;
- (void)setProperties:(id)a3;
@end

@implementation IDSConnectivityMonitorMetric

- (IDSConnectivityMonitorMetric)initWithProperties:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSConnectivityMonitorMetric;
  v6 = -[IDSConnectivityMonitorMetric init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_properties, a3);
  }

  return v7;
}

- (NSString)name
{
  return (NSString *)kIDSConnectivityMonitoringMetricName;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSConnectivityMonitorMetric properties](self, "properties"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 success]));

  if (v5) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"MessageSuccess", v5);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSConnectivityMonitorMetric properties](self, "properties"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 terminusConnected]));

  if (v7) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"TerminusConnected", v7);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSConnectivityMonitorMetric properties](self, "properties"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 terminusNearby]));

  if (v9) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"TerminusConnected", v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSConnectivityMonitorMetric properties](self, "properties"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 terminusRegistered]));

  if (v11) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"TerminusConnected", v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSConnectivityMonitorMetric properties](self, "properties"));
  [v12 timeConnected];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));

  if (v13) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"TimeConnected", v13);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSConnectivityMonitorMetric properties](self, "properties"));
  [v14 timeDisconnected];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));

  if (v15) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"TimeDisconnected", v15);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSConnectivityMonitorMetric properties](self, "properties"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 personalCBUUIDString]);

  if (v17) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"PersonalCBUUID", v17);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSConnectivityMonitorMetric properties](self, "properties"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pairedDeviceCBUUIDString]);

  if (v19) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"PairedDeviceCBUUID", v19);
  }

  return (NSDictionary *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeConnectivityMonitor;
}

- (IDSConnectivityMonitorMetricProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
}

@end