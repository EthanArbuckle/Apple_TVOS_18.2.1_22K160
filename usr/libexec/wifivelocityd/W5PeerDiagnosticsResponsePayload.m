@interface W5PeerDiagnosticsResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (NSArray)results;
- (NSError)error;
- (NSNumber)version;
- (W5PeerDiagnosticsResponsePayload)initWithRequest:(id)a3;
- (id)encode;
- (int64_t)status;
- (void)setError:(id)a3;
- (void)setResults:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerDiagnosticsResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerDiagnosticsResponsePayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___W5PeerDiagnosticsResponsePayload;
  uint64_t v5 = -[W5PeerDiagnosticsResponsePayload init](&v24, "init");
  if (!v5
    || (id v6 = (NSNumber *)[v4 objectForKey:@"version"],
        (v5->_version = v6) == 0LL))
  {

    uint64_t v21 = sub_10008C90C();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315906;
      v26 = "-[W5PeerDiagnosticsResponsePayload initWithRequest:]";
      __int16 v27 = 2080;
      v28 = "W5PeerDiagnosticsResponsePayload.m";
      __int16 v29 = 1024;
      int v30 = 56;
      __int16 v31 = 2114;
      uint64_t v32 = 0LL;
      int v22 = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] %s (%s:%u) init error (error='%{public}@'",  &v25,  v22);
    }

    v9 = 0LL;
    v8 = 0LL;
    id v16 = 0LL;
    uint64_t v5 = 0LL;
    goto LABEL_8;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"status"]);
  v8 = v7;
  if (v7) {
    v5->_status = (int64_t)[v7 integerValue];
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"testResults"]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray, v10);
  v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v11,  objc_opt_class(&OBJC_CLASS___W5DiagnosticsTestResult, v12),  0LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v23 = 0LL;
  uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v14,  v9,  &v23));
  id v16 = v23;
  results = v5->_results;
  v5->_results = (NSArray *)v15;

  if (!v5->_results)
  {
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"testError"]);
    if (v18) {
      objc_storeStrong((id *)&v5->_error, v18);
    }
LABEL_8:
  }

  v19 = v5;

  return v19;
}

- (id)encode
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = sub_10008C90C();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload version](self, "version"));
    int64_t v7 = -[W5PeerDiagnosticsResponsePayload status](self, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload results](self, "results"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload error](self, "error"));
    int v22 = 136316674;
    id v23 = "-[W5PeerDiagnosticsResponsePayload encode]";
    __int16 v24 = 2080;
    int v25 = "W5PeerDiagnosticsResponsePayload.m";
    __int16 v26 = 1024;
    int v27 = 66;
    __int16 v28 = 2114;
    __int16 v29 = v6;
    __int16 v30 = 2048;
    int64_t v31 = v7;
    __int16 v32 = 2114;
    v33 = v8;
    __int16 v34 = 2114;
    v35 = v9;
    int v20 = 68;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] %s (%s:%u) version='%{public}@', status=%ld, status='%{public}@' error='%{public}@'",  &v22,  v20);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload version](self, "version"));
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload version](self, "version"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v11, @"version");

    if (!-[W5PeerDiagnosticsResponsePayload status](self, "status"))
    {
LABEL_9:
      uint64_t v15 = 0LL;
      id v10 = 0LL;
      goto LABEL_11;
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[W5PeerDiagnosticsResponsePayload status](self, "status")));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v12, @"status");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload results](self, "results"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload results](self, "results"));
      id v21 = 0LL;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v14,  1LL,  &v21));
      id v10 = v21;

      -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v15, @"testResults");
      goto LABEL_11;
    }

    id v10 = (id)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload error](self, "error"));

    if (v10)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload error](self, "error"));
      -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v16, @"testError");

      goto LABEL_9;
    }
  }

  uint64_t v15 = 0LL;
LABEL_11:
  if (!-[NSMutableDictionary count](v3, "count"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s: empty payload",  "-[W5PeerDiagnosticsResponsePayload encode]"));
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v18,  0LL));

    objc_exception_throw(v19);
  }

  return v3;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end