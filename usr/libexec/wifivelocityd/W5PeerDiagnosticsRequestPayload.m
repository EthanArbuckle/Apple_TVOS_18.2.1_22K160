@interface W5PeerDiagnosticsRequestPayload
+ (id)payloadFromDictionary:(id)a3;
- (NSArray)tests;
- (NSDictionary)configuration;
- (NSNumber)version;
- (NSUUID)uuid;
- (W5PeerDiagnosticsRequestPayload)initWithRequest:(id)a3;
- (id)encode;
- (void)setConfiguration:(id)a3;
- (void)setTests:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerDiagnosticsRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerDiagnosticsRequestPayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___W5PeerDiagnosticsRequestPayload;
  uint64_t v5 = -[W5PeerDiagnosticsRequestPayload init](&v33, "init");
  if (v5
    && (id v6 = (NSNumber *)[v4 objectForKey:@"version"],
        (v5->_version = v6) != 0LL))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"configuration"]);
    v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___NSDictionary, v8),  0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v32 = 0LL;
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v10,  v7,  &v32));
    id v12 = v32;
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v11;

    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"tests"]);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray, v15);
    v18 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v16,  objc_opt_class(&OBJC_CLASS___W5DiagnosticsTestRequest, v17),  0LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v31 = v12;
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v19,  v14,  &v31));
    id v21 = v31;

    tests = v5->_tests;
    v5->_tests = (NSArray *)v20;

    uint64_t v23 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"uuid"]);
    if (v23)
    {
      v24 = (void *)v23;
      v25 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v23);
      uuid = (os_log_s *)v5->_uuid;
      v5->_uuid = v25;
      goto LABEL_5;
    }
  }

  else
  {
    id v21 = 0LL;
    v7 = 0LL;
    v14 = 0LL;
  }

  uint64_t v29 = sub_10008C90C();
  uuid = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(uuid, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 136315906;
    v35 = "-[W5PeerDiagnosticsRequestPayload initWithRequest:]";
    __int16 v36 = 2080;
    v37 = "W5PeerDiagnosticsRequestPayload.m";
    __int16 v38 = 1024;
    int v39 = 54;
    __int16 v40 = 2114;
    id v41 = v21;
    LODWORD(v30) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  uuid,  0LL,  "[wifivelocity] %s (%s:%u) init error (error='%{public}@'",  &v34,  v30);
  }

  v24 = 0LL;
  uint64_t v5 = 0LL;
LABEL_5:

  v27 = v5;
  return v27;
}

- (id)encode
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload version](self, "version"));

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload version](self, "version"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, @"version");

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload configuration](self, "configuration"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload configuration](self, "configuration"));
      id v28 = 0LL;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v7,  1LL,  &v28));
      id v4 = v28;

      if (!v8)
      {
        uint64_t v9 = sub_10008C90C();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = 136315906;
          uint64_t v30 = "-[W5PeerDiagnosticsRequestPayload encode]";
          __int16 v31 = 2080;
          id v32 = "W5PeerDiagnosticsRequestPayload.m";
          __int16 v33 = 1024;
          int v34 = 72;
          __int16 v35 = 2114;
          id v36 = v4;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) failed to encode configuration with error='%{public}@'",  &v29,  38);
        }

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (NSArray)tests
{
  return self->_tests;
}

- (void)setTests:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end