@interface W5PeerFileTransferResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (NSArray)files;
- (NSData)publicKey;
- (NSError)error;
- (NSNumber)version;
- (W5PeerFileTransferResponsePayload)initWithRequest:(id)a3;
- (id)encode;
- (int64_t)status;
- (void)setError:(id)a3;
- (void)setFiles:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerFileTransferResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerFileTransferResponsePayload)initWithRequest:(id)a3
{
  id v4 = (NSError *)a3;
  uint64_t v5 = sub_10008C90C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = 136315906;
    v36 = "-[W5PeerFileTransferResponsePayload initWithRequest:]";
    __int16 v37 = 2080;
    v38 = "W5PeerFileTransferResponsePayload.m";
    __int16 v39 = 1024;
    int v40 = 30;
    __int16 v41 = 2114;
    v42 = v4;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) Response Dictionary: %{public}@",  &v35,  38);
  }

  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___W5PeerFileTransferResponsePayload;
  v7 = -[W5PeerFileTransferResponsePayload init](&v34, "init");
  if (v7
    && (v8 = (NSNumber *)-[NSError objectForKey:](v4, "objectForKey:", @"version"),
        (v7->_version = v8) != 0LL)
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v4, "objectForKey:", @"status"))) != 0LL)
  {
    v10 = v9;
    v7->_status = (int64_t)[v9 integerValue];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v4, "objectForKey:", @"publicKey"));
    publicKey = v7->_publicKey;
    v7->_publicKey = (NSData *)v11;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v4, "objectForKey:", @"files"));
    if (v14)
    {
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray, v13);
      v17 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v15,  objc_opt_class(&OBJC_CLASS___NSURL, v16),  0LL);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      id v33 = 0LL;
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v18,  v14,  &v33));
      id v20 = v33;
      files = v7->_files;
      v7->_files = (NSArray *)v19;
    }

    else
    {
      id v20 = 0LL;
    }

    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v4, "objectForKey:", @"error"));
    error = v7->_error;
    v7->_error = (NSError *)v22;

    v24 = v7->_error;
    if (!v24)
    {
      v25 = 0LL;
      goto LABEL_14;
    }

    v25 = v24;
    uint64_t v26 = sub_10008C90C();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 136315906;
      v36 = "-[W5PeerFileTransferResponsePayload initWithRequest:]";
      __int16 v37 = 2080;
      v38 = "W5PeerFileTransferResponsePayload.m";
      __int16 v39 = 1024;
      int v40 = 56;
      __int16 v41 = 2114;
      v42 = v25;
      LODWORD(v31) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[wifivelocity] %s (%s:%u) initialization failed due to error=(%{public}@)",  &v35,  v31);
    }
  }

  else
  {

    uint64_t v30 = sub_10008C90C();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 136315650;
      v36 = "-[W5PeerFileTransferResponsePayload initWithRequest:]";
      __int16 v37 = 2080;
      v38 = "W5PeerFileTransferResponsePayload.m";
      __int16 v39 = 1024;
      int v40 = 64;
      LODWORD(v31) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[wifivelocity] %s (%s:%u) init error with request dictionary",  (const char *)&v35,  v31,  v32);
    }

    v14 = 0LL;
    id v20 = 0LL;
    v10 = 0LL;
    v25 = 0LL;
    v7 = 0LL;
  }

LABEL_14:
  v28 = v7;

  return v28;
}

- (id)encode
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = sub_10008C90C();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload version](self, "version"));
    int64_t v7 = -[W5PeerFileTransferResponsePayload status](self, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload publicKey](self, "publicKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload error](self, "error"));
    int v26 = 136316674;
    v27 = "-[W5PeerFileTransferResponsePayload encode]";
    __int16 v28 = 2080;
    v29 = "W5PeerFileTransferResponsePayload.m";
    __int16 v30 = 1024;
    int v31 = 76;
    __int16 v32 = 2114;
    id v33 = v6;
    __int16 v34 = 2048;
    int64_t v35 = v7;
    __int16 v36 = 2114;
    __int16 v37 = v8;
    __int16 v38 = 2114;
    __int16 v39 = v9;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] %s (%s:%u) version='%{public}@', status=%ld, publicKey='%{public}@', error='%{public}@'",  &v26,  68);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload version](self, "version"));
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload version](self, "version"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v11, @"version");

    if (-[W5PeerFileTransferResponsePayload status](self, "status"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[W5PeerFileTransferResponsePayload status](self, "status")));
      -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v12, @"status");

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload publicKey](self, "publicKey"));
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload publicKey](self, "publicKey"));
        -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v14, @"publicKey");
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload files](self, "files"));

      if (v10)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload files](self, "files"));
        id v25 = 0LL;
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v15,  1LL,  &v25));
        id v16 = v25;

        if (!v10 || v16)
        {
          uint64_t v17 = sub_10008C90C();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            int v26 = 136315906;
            v27 = "-[W5PeerFileTransferResponsePayload encode]";
            __int16 v28 = 2080;
            v29 = "W5PeerFileTransferResponsePayload.m";
            __int16 v30 = 1024;
            int v31 = 96;
            __int16 v32 = 2114;
            id v33 = v16;
            LODWORD(v24) = 38;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] %s (%s:%u) Failed to encode files with error='%{public}@'",  &v26,  v24);
          }
        }

        else
        {
          -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v10, @"files");
        }
      }

      else
      {
        id v16 = 0LL;
      }

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload error](self, "error"));

      if (v19)
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload error](self, "error"));
        -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v20, @"error");
      }
    }

    else
    {
      id v16 = 0LL;
      v10 = 0LL;
    }
  }

  else
  {
    id v16 = 0LL;
  }

  if (!-[NSMutableDictionary count](v3, "count"))
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s: empty payload",  "-[W5PeerFileTransferResponsePayload encode]"));
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v22,  0LL));

    objc_exception_throw(v23);
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

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSArray)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
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