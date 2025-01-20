@interface NSPTokenFetchAnalytics
- (NSString)authenticationType;
- (NSString)proxyURL;
- (NSString)proxyVendor;
- (NSString)requestedServerUUID;
- (NSString)tierType;
- (double)latency;
- (id)analyticsDict;
- (id)eventName;
- (int64_t)httpCode;
- (int64_t)nsurlErrorCode;
- (unint64_t)activatedCount;
- (unint64_t)requestedTokenCount;
- (void)setActivatedCount:(unint64_t)a3;
- (void)setAuthenticationType:(id)a3;
- (void)setHttpCode:(int64_t)a3;
- (void)setLatency:(double)a3;
- (void)setNsurlErrorCode:(int64_t)a3;
- (void)setProxyURL:(id)a3;
- (void)setProxyVendor:(id)a3;
- (void)setRequestedServerUUID:(id)a3;
- (void)setRequestedTokenCount:(unint64_t)a3;
- (void)setTierType:(id)a3;
@end

@implementation NSPTokenFetchAnalytics

- (id)eventName
{
  return @"com.apple.nsp.tokenFetch";
}

- (id)analyticsDict
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPTokenFetchAnalytics proxyURL](self, "proxyURL"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"ProxyURL");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPTokenFetchAnalytics proxyVendor](self, "proxyVendor"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"ProxyVendor");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPTokenFetchAnalytics tierType](self, "tierType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"TierType");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPTokenFetchAnalytics authenticationType](self, "authenticationType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  @"AuthenticationType");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPTokenFetchAnalytics requestedServerUUID](self, "requestedServerUUID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v8,  @"RequestedServerUUID");

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPTokenFetchAnalytics requestedTokenCount](self, "requestedTokenCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v9,  @"RequestedTokenCount");

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPTokenFetchAnalytics activatedCount](self, "activatedCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  @"ActivatedTokenCount");

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[NSPTokenFetchAnalytics httpCode](self, "httpCode")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"HTTPCode");

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[NSPTokenFetchAnalytics nsurlErrorCode](self, "nsurlErrorCode")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, @"NSURLErrorCode");

  -[NSPTokenFetchAnalytics latency](self, "latency");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v13, @"Latency");

  return v3;
}

- (NSString)proxyURL
{
  return self->_proxyURL;
}

- (void)setProxyURL:(id)a3
{
}

- (NSString)proxyVendor
{
  return self->_proxyVendor;
}

- (void)setProxyVendor:(id)a3
{
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (NSString)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(id)a3
{
}

- (NSString)requestedServerUUID
{
  return self->_requestedServerUUID;
}

- (void)setRequestedServerUUID:(id)a3
{
  self->_requestedServerUUID = (NSString *)a3;
}

- (unint64_t)requestedTokenCount
{
  return self->_requestedTokenCount;
}

- (void)setRequestedTokenCount:(unint64_t)a3
{
  self->_requestedTokenCount = a3;
}

- (unint64_t)activatedCount
{
  return self->_activatedCount;
}

- (void)setActivatedCount:(unint64_t)a3
{
  self->_activatedCount = a3;
}

- (int64_t)httpCode
{
  return self->_httpCode;
}

- (void)setHttpCode:(int64_t)a3
{
  self->_httpCode = a3;
}

- (int64_t)nsurlErrorCode
{
  return self->_nsurlErrorCode;
}

- (void)setNsurlErrorCode:(int64_t)a3
{
  self->_nsurlErrorCode = a3;
}

- (double)latency
{
  return self->_latency;
}

- (void)setLatency:(double)a3
{
  self->_latency = a3;
}

- (void).cxx_destruct
{
}

@end