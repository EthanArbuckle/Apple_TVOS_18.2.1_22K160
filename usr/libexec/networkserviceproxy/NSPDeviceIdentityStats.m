@interface NSPDeviceIdentityStats
- (BOOL)success;
- (NSString)errorDomain;
- (id)analyticsDict;
- (id)eventName;
- (int64_t)errorCode;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation NSPDeviceIdentityStats

- (id)eventName
{
  return @"com.apple.nsp.deviceIdentityStats";
}

- (id)analyticsDict
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSPDeviceIdentityStats success](self, "success")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"Success");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPDeviceIdentityStats errorDomain](self, "errorDomain"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"ErrorDomain");

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[NSPDeviceIdentityStats errorCode](self, "errorCode")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"ErrorCode");

  return v3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (void).cxx_destruct
{
}

@end