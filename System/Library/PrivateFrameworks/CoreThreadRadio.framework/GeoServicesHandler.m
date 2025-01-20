@interface GeoServicesHandler
- (BOOL)startMonitoring:(id)a3;
- (NSString)lastCountryCode;
- (void)regulatoryAreaGeoChanged;
- (void)setLastCountryCode:(id)a3;
- (void)stopMonitoring;
@end

@implementation GeoServicesHandler

- (BOOL)startMonitoring:(id)a3
{
  id v4 = a3;
  v5 = sub_1000160F4("com.apple.wpantund", "default");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    if (sub_10015A058(6))
    {
      v7 = v6;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int monitoring = self->_monitoring;
        v13[0] = 67109120;
        v13[1] = monitoring;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "[PowerTable] startMonitoring: Geo _monitoring: %d",  (uint8_t *)v13,  8u);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1001FF028();
  }

  if (self->_monitoring)
  {
    v9 = sub_1000160F4("com.apple.wpantund", "default");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (v10)
    {
      if (sub_10015A058(6) && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[PowerTable] regulatory,geo,geosvc,startMonitoring, _monitoring is already true, done.",  (uint8_t *)v13,  2u);
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1001FF028();
    }
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:self selector:"countryConfigurationDidChangeNotification:" name:GEOCountryConfigurationCountryCodeDidChangeNotification object:0];

    self->_int monitoring = 1;
    -[GeoServicesHandler regulatoryAreaGeoChanged](self, "regulatoryAreaGeoChanged");
  }

  return 1;
}

- (void)regulatoryAreaGeoChanged
{
  v3 = sub_1000160F4("com.apple.wpantund", "default");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    if (sub_10015A058(6) && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "[PowerTable] regulatoryAreaGeoChanged: regulatory,geo,geosvc,regulatory area GEO changed notification.",  buf,  2u);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1001FF028();
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[GEOCountryConfiguration sharedConfiguration]( &OBJC_CLASS___GEOCountryConfiguration,  "sharedConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 countryCode]);

  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    v8 = sub_1000160F4("com.apple.wpantund", "default");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (v9)
    {
      if (sub_10015A058(6) && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "[PowerTable] regulatory,geo,geosvc,regulatory area GEO changed: %@",  buf,  0xCu);
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1001FF028();
    }

    objc_storeStrong((id *)&v7->_lastCountryCode, v6);
    std::string::assign( (std::string *)&qword_1002C9C50, (const std::string::value_type *)[v6 cStringUsingEncoding:4]);
    std::string::basic_string(&v10, (const std::string *)&qword_1002C9C50);
    sub_10015AB38((const void **)&v10.__r_.__value_.__l.__data_);
    objc_sync_exit(v7);
  }
}

- (void)stopMonitoring
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:GEOCountryConfigurationCountryCodeDidChangeNotification object:0];

  id v4 = sub_1000160F4("com.apple.wpantund", "default");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    if (sub_10015A058(6) && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "[PowerTable] regulatory,geo,geosvc,stopMonitoring done.",  v6,  2u);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1001FF028();
  }
}

- (NSString)lastCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setLastCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end