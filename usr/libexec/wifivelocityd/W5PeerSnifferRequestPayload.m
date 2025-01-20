@interface W5PeerSnifferRequestPayload
+ (id)payloadFromDictionary:(id)a3;
- (BOOL)noAutoStop;
- (NSArray)channels;
- (NSNumber)version;
- (NSString)description;
- (NSUUID)uuid;
- (W5PeerSnifferRequestPayload)initWithRequest:(id)a3;
- (double)duration;
- (id)encode;
- (int64_t)rotationInterval;
- (int64_t)type;
- (void)setChannels:(id)a3;
- (void)setDuration:(double)a3;
- (void)setNoAutoStop:(BOOL)a3;
- (void)setRotationInterval:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerSnifferRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerSnifferRequestPayload)initWithRequest:(id)a3
{
  id v4 = (NSError *)a3;
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___W5PeerSnifferRequestPayload;
  uint64_t v5 = -[W5PeerSnifferRequestPayload init](&v55, "init");
  if (v5)
  {
    uint64_t v6 = sub_10008C90C();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v68 = 136315906;
      v69 = "-[W5PeerSnifferRequestPayload initWithRequest:]";
      __int16 v70 = 2080;
      v71 = "W5PeerSnifferRequestPayload.m";
      __int16 v72 = 1024;
      int v73 = 36;
      __int16 v74 = 2114;
      v75 = v4;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] %s (%s:%u) Request Data: %{public}@",  &v68,  38);
    }

    v8 = (NSNumber *)-[NSError objectForKey:](v4, "objectForKey:", @"version");
    v5->_version = v8;
    if (!v8)
    {
      v35 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v66 = NSLocalizedDescriptionKey;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v52 = (void *)objc_claimAutoreleasedReturnValue( [v36 localizedStringForKey:@"nil version" value:&stru_1000D4648 table:0]);
      v67 = v52;
      v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v67,  &v66,  1LL));
      v19 = -[NSError initWithDomain:code:userInfo:]( v35,  "initWithDomain:code:userInfo:",  @"com.apple.wifivelocty.sniffer",  -1LL,  v37);
      v16 = 0LL;
      v17 = 0LL;
      v18 = 0LL;
      v9 = 0LL;
LABEL_30:

      goto LABEL_31;
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v4, "objectForKey:", @"type"));
    v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___NSNumber, v10),  0LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v54 = 0LL;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v12,  v9,  &v54));
    v14 = (NSError *)v54;
    v5->_int64_t type = (int64_t)[v13 integerValue];

    int64_t type = v5->_type;
    if (type != 1)
    {
      if (type != 2)
      {
        if (type)
        {
          v16 = 0LL;
          v17 = 0LL;
          v18 = 0LL;
          v19 = v14;
LABEL_16:
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v4, "objectForKey:", @"noAutoStop"));
          v5->_noAutoStop = [v31 BOOLValue];

          if (!v5->_noAutoStop)
          {
            v33 = 0LL;
            goto LABEL_20;
          }

          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v4, "objectForKey:", @"rorationInterval"));
          if (v32)
          {
            v33 = v32;
            v5->_rotationInterval = (int)[v32 intValue];
            goto LABEL_20;
          }

          v40 = objc_alloc(&OBJC_CLASS___NSError);
          NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
          v52 = (void *)objc_claimAutoreleasedReturnValue( [v51 localizedStringForKey:@"nil rotation interval" value:&stru_1000D4648 table:0]);
          v57 = v52;
          v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
          v41 = -[NSError initWithDomain:code:userInfo:]( v40,  "initWithDomain:code:userInfo:",  @"com.apple.wifivelocty.sniffer",  -1LL,  v37);

          goto LABEL_29;
        }

        v38 = objc_alloc(&OBJC_CLASS___NSError);
        NSErrorUserInfoKey v64 = NSLocalizedDescriptionKey;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v52 = (void *)objc_claimAutoreleasedReturnValue([v39 localizedStringForKey:@"nil type" value:&stru_1000D4648 table:0]);
        v65 = v52;
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
        v19 = -[NSError initWithDomain:code:userInfo:]( v38,  "initWithDomain:code:userInfo:",  @"com.apple.wifivelocty.sniffer",  -2LL,  v37);

        v36 = v39;
        v16 = 0LL;
        goto LABEL_24;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v4, "objectForKey:", @"uuid"));
      if (!v16)
      {
        v48 = objc_alloc(&OBJC_CLASS___NSError);
        NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v52 = (void *)objc_claimAutoreleasedReturnValue([v49 localizedStringForKey:@"nil UUID" value:&stru_1000D4648 table:0]);
        v59 = v52;
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
        v19 = -[NSError initWithDomain:code:userInfo:]( v48,  "initWithDomain:code:userInfo:",  @"com.apple.wifivelocty.sniffer",  -1LL,  v37);

        v36 = v49;
LABEL_24:
        v17 = 0LL;
        v18 = 0LL;
        goto LABEL_30;
      }

      v30 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v16);
      v17 = 0LL;
      v18 = 0LL;
      uuid = v5->_uuid;
      v5->_uuid = v30;
      v19 = v14;
LABEL_15:

      goto LABEL_16;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v4, "objectForKey:", @"channels"));
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSArray, v20);
    v23 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v21,  objc_opt_class(&OBJC_CLASS___W5WiFiChannel, v22),  0LL);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v53 = v14;
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v24,  v18,  &v53));
    v19 = v53;

    channels = v5->_channels;
    v5->_channels = (NSArray *)v25;

    if (v5->_channels)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v4, "objectForKey:", @"duration"));
      if (v27)
      {
        v17 = v27;
        v5->_duration = (double)(uint64_t)[v27 longValue];
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v4, "objectForKey:", @"uuid"));
        if (!v16) {
          goto LABEL_16;
        }
        v28 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v16);
        uuid = v5->_uuid;
        v5->_uuid = v28;
        goto LABEL_15;
      }

      v45 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v52 = (void *)objc_claimAutoreleasedReturnValue( [v51 localizedStringForKey:@"nil duration" value:&stru_1000D4648 table:0]);
      v61 = v52;
      v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));
      v43 = v45;
      uint64_t v44 = -1LL;
    }

    else
    {
      v42 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v62 = NSLocalizedDescriptionKey;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v52 = (void *)objc_claimAutoreleasedReturnValue( [v51 localizedStringForKey:@"nil channel" value:&stru_1000D4648 table:0]);
      v63 = v52;
      v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v63,  &v62,  1LL));
      v43 = v42;
      uint64_t v44 = -3LL;
    }

    v41 = -[NSError initWithDomain:code:userInfo:]( v43,  "initWithDomain:code:userInfo:",  @"com.apple.wifivelocty.sniffer",  v44,  v37);

    v16 = 0LL;
    v17 = 0LL;
LABEL_29:
    v19 = v41;
    v36 = v51;
    goto LABEL_30;
  }

  v16 = 0LL;
  v19 = 0LL;
  v17 = 0LL;
  v18 = 0LL;
  v9 = 0LL;
LABEL_31:

  uint64_t v46 = sub_10008C90C();
  v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    int v68 = 136315906;
    v69 = "-[W5PeerSnifferRequestPayload initWithRequest:]";
    __int16 v70 = 2080;
    v71 = "W5PeerSnifferRequestPayload.m";
    __int16 v72 = 1024;
    int v73 = 77;
    __int16 v74 = 2114;
    v75 = v19;
    LODWORD(v50) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v47,  0LL,  "[wifivelocity] %s (%s:%u) init error (error='%{public}@')",  &v68,  v50);
  }

  v33 = 0LL;
  uint64_t v5 = 0LL;
LABEL_20:

  return v5;
}

- (id)encode
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequestPayload version](self, "version"));

  if (!v4) {
    goto LABEL_20;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequestPayload version](self, "version"));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, @"version");

  if (!-[W5PeerSnifferRequestPayload type](self, "type"))
  {
    id v4 = 0LL;
LABEL_20:
    v9 = 0LL;
    id v10 = 0LL;
    goto LABEL_17;
  }

  uint64_t v6 = -[NSNumber initWithInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInteger:",  -[W5PeerSnifferRequestPayload type](self, "type"));
  id v25 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v25));
  id v7 = v25;

  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"type");
  if ((id)-[W5PeerSnifferRequestPayload type](self, "type") != (id)1)
  {
    v9 = 0LL;
    id v10 = v7;
    goto LABEL_8;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequestPayload channels](self, "channels"));
  id v24 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  &v24));
  id v10 = v24;

  if (v9)
  {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, @"channels");
    -[W5PeerSnifferRequestPayload duration](self, "duration");
    if (v11 == 0.0) {
      goto LABEL_17;
    }
    -[W5PeerSnifferRequestPayload duration](self, "duration");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v12, @"duration");

LABEL_8:
    int64_t v13 = -[W5PeerSnifferRequestPayload type](self, "type");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequestPayload uuid](self, "uuid"));
    v15 = v14;
    if (v13 == 2)
    {

      if (!v15) {
        goto LABEL_17;
      }
    }

    else
    {

      if (!v15) {
        goto LABEL_13;
      }
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequestPayload uuid](self, "uuid"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v17, @"uuid");

LABEL_13:
    if (-[W5PeerSnifferRequestPayload noAutoStop](self, "noAutoStop"))
    {
      -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", &__kCFBooleanTrue, @"noAutoStop");
      if (-[W5PeerSnifferRequestPayload rotationInterval](self, "rotationInterval"))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[W5PeerSnifferRequestPayload rotationInterval](self, "rotationInterval")));
        -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v18, @"rorationInterval");
      }
    }

    else
    {
      -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", &__kCFBooleanFalse, @"noAutoStop");
    }

    goto LABEL_17;
  }

  uint64_t v20 = sub_10008C90C();
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136315906;
    v27 = "-[W5PeerSnifferRequestPayload encode]";
    __int16 v28 = 2080;
    v29 = "W5PeerSnifferRequestPayload.m";
    __int16 v30 = 1024;
    int v31 = 102;
    __int16 v32 = 2114;
    id v33 = v10;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "[wifivelocity] %s (%s:%u) failed to encode channels with error='%{public}@'",  &v26,  38);
  }

  v9 = 0LL;
LABEL_17:
  if (!-[NSMutableDictionary count](v3, "count"))
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s: empty payload",  "-[W5PeerSnifferRequestPayload encode]"));
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v22,  0LL));

    objc_exception_throw(v23);
  }

  return v3;
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Type:%ld, UUID:%@, Channels:%@, Duration:%d, NoAutoStop:%d, RotationInterval:%ld",  self->_type,  self->_uuid,  self->_channels,  (int)self->_duration,  self->_noAutoStop,  self->_rotationInterval);
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (NSArray)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)noAutoStop
{
  return self->_noAutoStop;
}

- (void)setNoAutoStop:(BOOL)a3
{
  self->_noAutoStop = a3;
}

- (int64_t)rotationInterval
{
  return self->_rotationInterval;
}

- (void)setRotationInterval:(int64_t)a3
{
  self->_rotationInterval = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (void).cxx_destruct
{
}

@end