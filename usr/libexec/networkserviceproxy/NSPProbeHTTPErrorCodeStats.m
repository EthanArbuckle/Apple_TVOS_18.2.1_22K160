@interface NSPProbeHTTPErrorCodeStats
- (BOOL)directPath;
- (NSNumber)HTTPErrorCode;
- (NSString)interfaceType;
- (id)analyticsDict;
- (id)eventName;
- (void)setDirectPath:(BOOL)a3;
- (void)setHTTPErrorCode:(id)a3;
- (void)setInterfaceType:(id)a3;
@end

@implementation NSPProbeHTTPErrorCodeStats

- (id)eventName
{
  return @"com.apple.nsp.ProbeHTTPErrorStats";
}

- (id)analyticsDict
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProbeHTTPErrorCodeStats HTTPErrorCode](self, "HTTPErrorCode"));

  if (v3)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProbeHTTPErrorCodeStats interfaceType](self, "interfaceType"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, @"InterfaceType");

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPProbeHTTPErrorCodeStats directPath](self, "directPath")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, @"DirectPath");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProbeHTTPErrorCodeStats HTTPErrorCode](self, "HTTPErrorCode"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v10, @"HTTPCode");

    return v7;
  }

  else
  {
    uint64_t v12 = nplog_obj(v4, v5, v6);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v14 = 136315138;
      v15 = "-[NSPProbeHTTPErrorCodeStats analyticsDict]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "%s called with null self.HTTPErrorCode",  (uint8_t *)&v14,  0xCu);
    }

    return 0LL;
  }

- (NSString)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(id)a3
{
}

- (BOOL)directPath
{
  return self->_directPath;
}

- (void)setDirectPath:(BOOL)a3
{
  self->_directPath = a3;
}

- (NSNumber)HTTPErrorCode
{
  return self->_HTTPErrorCode;
}

- (void)setHTTPErrorCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end