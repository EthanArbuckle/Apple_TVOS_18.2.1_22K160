@interface W5PeerStatusResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (NSNumber)version;
- (W5PeerStatusResponsePayload)initWithRequest:(id)a3;
- (W5Status)peerStatus;
- (id)encode;
- (int64_t)status;
- (void)setPeerStatus:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerStatusResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerStatusResponsePayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___W5PeerStatusResponsePayload;
  uint64_t v5 = -[W5PeerStatusResponsePayload init](&v32, "init");
  if (v5
    && (id v6 = (NSNumber *)[v4 objectForKey:@"version"],
        (v5->_version = v6) != 0LL))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"status"]);
    v8 = v7;
    if (v7) {
      v5->_status = (int64_t)[v7 integerValue];
    }
    v29 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"peerStatus"]);
    v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___W5Status, v10),  0LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v31 = 0LL;
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v12,  v9,  &v31));
    id v14 = v31;
    peerStatus = v5->_peerStatus;
    v5->_peerStatus = (W5Status *)v13;

    BOOL v16 = v5->_peerStatus != 0LL;
  }

  else
  {
    id v14 = 0LL;
    v29 = 0LL;
    v9 = 0LL;
    BOOL v16 = 0;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:&off_1000DF720]);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:&off_1000DF720]);

    v20 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___W5Status, v19),  0LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v30 = v14;
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v21,  v18,  &v30));
    id v23 = v30;

    v24 = v5->_peerStatus;
    v5->_peerStatus = (W5Status *)v22;

    if (v5->_peerStatus)
    {
      v5->_version = (NSNumber *)&off_1000DF720;
      v5->_status = 1LL;
      v25 = v29;
      goto LABEL_14;
    }
  }

  else
  {
    id v23 = v14;
    v18 = v9;
  }

  v25 = v29;
  if (!v16)
  {

    uint64_t v26 = sub_10008C90C();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136315906;
      v34 = "-[W5PeerStatusResponsePayload initWithRequest:]";
      __int16 v35 = 2080;
      v36 = "W5PeerStatusResponsePayload.m";
      __int16 v37 = 1024;
      int v38 = 66;
      __int16 v39 = 2114;
      id v40 = v23;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[wifivelocity] %s (%s:%u) init error (error='%{public}@'",  &v33,  38);
    }

    uint64_t v5 = 0LL;
  }

- (id)encode
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = sub_10008C90C();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusResponsePayload version](self, "version"));
    int64_t v7 = -[W5PeerStatusResponsePayload status](self, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusResponsePayload peerStatus](self, "peerStatus"));
    int v21 = 136316418;
    uint64_t v22 = "-[W5PeerStatusResponsePayload encode]";
    __int16 v23 = 2080;
    v24 = "W5PeerStatusResponsePayload.m";
    __int16 v25 = 1024;
    int v26 = 77;
    __int16 v27 = 2114;
    id v28 = v6;
    __int16 v29 = 2048;
    int64_t v30 = v7;
    __int16 v31 = 2114;
    objc_super v32 = v8;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] %s (%s:%u) version='%{public}@', status=%ld, status='%{public}@'",  &v21,  58);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusResponsePayload version](self, "version"));
  if (!v9) {
    goto LABEL_15;
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusResponsePayload version](self, "version"));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v10, @"version");

  if (!-[W5PeerStatusResponsePayload status](self, "status"))
  {
    v9 = 0LL;
    goto LABEL_15;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[W5PeerStatusResponsePayload status](self, "status")));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v11, @"status");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusResponsePayload peerStatus](self, "peerStatus"));
  if (!v9)
  {
LABEL_15:
    id v13 = 0LL;
    goto LABEL_12;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusResponsePayload peerStatus](self, "peerStatus"));
  id v20 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v12,  1LL,  &v20));
  id v13 = v20;

  if (!v9 || v13)
  {
    uint64_t v14 = sub_10008C90C();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315906;
      uint64_t v22 = "-[W5PeerStatusResponsePayload encode]";
      __int16 v23 = 2080;
      v24 = "W5PeerStatusResponsePayload.m";
      __int16 v25 = 1024;
      int v26 = 94;
      __int16 v27 = 2114;
      id v28 = v13;
      LODWORD(v19) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) failed to encode status with error='%{public}@'",  &v21,  v19);
    }
  }

  else
  {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, @"peerStatus");
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, self->_version);
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

- (W5Status)peerStatus
{
  return self->_peerStatus;
}

- (void)setPeerStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end