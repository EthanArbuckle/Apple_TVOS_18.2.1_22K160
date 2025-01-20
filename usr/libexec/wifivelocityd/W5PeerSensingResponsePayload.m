@interface W5PeerSensingResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (BOOL)result;
- (NSNumber)version;
- (NSString)errorStr;
- (W5PeerSensingResponsePayload)initWithRequest:(id)a3;
- (id)encode;
- (int64_t)status;
- (void)setErrorStr:(id)a3;
- (void)setResult:(BOOL)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerSensingResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerSensingResponsePayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___W5PeerSensingResponsePayload;
  uint64_t v5 = -[W5PeerSensingResponsePayload init](&v11, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"result"]);
    v5->_result = [v6 BOOLValue];

    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"error"]);
    errorStr = (os_log_s *)v5->_errorStr;
    v5->_errorStr = (NSString *)v7;
  }

  else
  {
    uint64_t v10 = sub_10008C90C();
    errorStr = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(errorStr, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315906;
      v13 = "-[W5PeerSensingResponsePayload initWithRequest:]";
      __int16 v14 = 2080;
      v15 = "W5PeerSensingResponsePayload.m";
      __int16 v16 = 1024;
      int v17 = 34;
      __int16 v18 = 2114;
      uint64_t v19 = 0LL;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  errorStr,  0LL,  "[wifivelocity] %s (%s:%u) init error (error='%{public}@'",  &v12,  38);
    }
  }

  return v5;
}

- (id)encode
{
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[W5PeerSensingResponsePayload errorStr](self, "errorStr"));
  if (!v3)
  {
    if (-[W5PeerSensingResponsePayload result](self, "result")) {
      v3 = 0LL;
    }
    else {
      v3 = @"unknown error";
    }
  }

  v7[0] = @"result";
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[W5PeerSensingResponsePayload result](self, "result")));
  v7[1] = @"error";
  v8[0] = v4;
  v8[1] = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  return v5;
}

- (NSNumber)version
{
  return self->version;
}

- (void)setVersion:(id)a3
{
  self->version = (NSNumber *)a3;
}

- (int64_t)status
{
  return self->status;
}

- (void)setStatus:(int64_t)a3
{
  self->status = a3;
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (NSString)errorStr
{
  return self->_errorStr;
}

- (void)setErrorStr:(id)a3
{
}

- (void).cxx_destruct
{
}

@end