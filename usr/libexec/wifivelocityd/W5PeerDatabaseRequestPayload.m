@interface W5PeerDatabaseRequestPayload
+ (id)payloadFromDictionary:(id)a3;
- (NSFetchRequest)fetchRequest;
- (NSNumber)version;
- (NSString)description;
- (W5PeerDatabaseRequestPayload)initWithRequest:(id)a3;
- (id)encode;
- (void)setFetchRequest:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerDatabaseRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerDatabaseRequestPayload)initWithRequest:(id)a3
{
  id v4 = (char *)a3;
  uint64_t v5 = objc_autoreleasePoolPush();
  uint64_t v6 = sub_10008E334();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "W5PeerDatabaseRequestPayload initWithRequest",  (const char *)&unk_1000BB786,  buf,  2u);
  }

  v75.receiver = self;
  v75.super_class = (Class)&OBJC_CLASS___W5PeerDatabaseRequestPayload;
  v8 = -[W5PeerDatabaseRequestPayload init](&v75, "init");
  if (!v8) {
    goto LABEL_41;
  }
  uint64_t v9 = sub_10008C90C();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
    __int16 v78 = 2112;
    v79 = v4;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: W5PeerDatabaseRequestPayload dictionary %@",  buf,  22);
  }

  v11 = (NSNumber *)[v4 objectForKey:@"version"];
  v8->_version = v11;
  if (!v11)
  {
LABEL_41:
    id v13 = 0LL;
    v37 = 0LL;
    goto LABEL_35;
  }

  if (!-[NSNumber isEqualToNumber:](v11, "isEqualToNumber:", &off_1000DF840))
  {
    if (!-[NSNumber isEqualToNumber:](v8->_version, "isEqualToNumber:", &off_1000DF858)) {
      goto LABEL_30;
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"fetchRequestNSDataUncompressed"]);

    if (v39)
    {
      uint64_t v40 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"fetchRequestNSDataUncompressed"]);
      if (v40)
      {
        id v13 = (id)v40;
        uint64_t v41 = sub_10008C90C();
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = (char *)[v13 length];
          *(_DWORD *)buf = 136315394;
          v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
          __int16 v78 = 2048;
          v79 = v43;
          LODWORD(v69) = 22;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v42,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: Uncompressed fetchRequestData size is %zd",  (const char *)buf,  v69);
        }

        uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSFetchRequest, v44);
        uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSDate, v46);
        v49 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v45,  v47,  objc_opt_class(&OBJC_CLASS___NSSet, v48),  0LL);
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        id v73 = 0LL;
        uint64_t v50 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v16,  v13,  &v73));
        v37 = (char *)v73;
        fetchRequest = v8->_fetchRequest;
        v8->_fetchRequest = (NSFetchRequest *)v50;
        goto LABEL_24;
      }

      goto LABEL_30;
    }

    v60 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"fetchRequestNSData"]);

    if (!v60) {
      goto LABEL_30;
    }
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"fetchRequestNSData"]);
  if (!v12)
  {
LABEL_30:
    uint64_t v61 = sub_10008C90C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE to find kW5PeerRequestDatabaseFetchRequestNSDataUncompre ssedKey or kW5PeerRequestDatabaseFetchRequestNSDataKey",  (const char *)buf);
    }

    id v13 = 0LL;
    goto LABEL_33;
  }

  id v13 = (id)v12;
  v14 = &selRef_collectLogsDiagnosticMode_uuid_reply_;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](&OBJC_CLASS___W5BufferPool, "sharedW5BufferPool"));
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 getPairOfBuffersFromPool]);

  if ((unint64_t)-[os_log_s count](v16, "count") > 1)
  {
    v71 = v4;
    v72 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s firstObject](v16, "firstObject"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s lastObject](v16, "lastObject"));
    compression_encode_scratch_buffer_size(COMPRESSION_LZFSE);
    fetchRequest = v17;
    v20 = (uint8_t *)-[NSFetchRequest mutableBytes](fetchRequest, "mutableBytes");
    id v21 = -[NSFetchRequest length](fetchRequest, "length");
    id v13 = v13;
    v22 = (const uint8_t *)[v13 bytes];
    id v23 = [v13 length];
    id v24 = v18;
    size_t v25 = compression_decode_buffer( v20,  (size_t)v21,  v22,  (size_t)v23,  [v24 mutableBytes],  COMPRESSION_LZFSE);
    uint64_t v26 = sub_10008C90C();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v28)
      {
        id v29 = [v13 length];
        *(_DWORD *)buf = 136315650;
        v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
        __int16 v78 = 2048;
        v79 = (char *)v25;
        __int16 v80 = 2048;
        id v81 = v29;
        LODWORD(v69) = 32;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: compression_decode_buffer fetchRequestData to Size of %zd, from size %zd",  (const char *)buf,  v69,  v70);
      }

      -[NSFetchRequest setLength:](fetchRequest, "setLength:", v25);
      uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSFetchRequest, v30);
      uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSDate, v32);
      v35 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v31,  v33,  objc_opt_class(&OBJC_CLASS___NSSet, v34),  0LL);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      id v74 = 0LL;
      uint64_t v36 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v27,  fetchRequest,  &v74));
      v37 = (char *)v74;
      v38 = v8->_fetchRequest;
      v8->_fetchRequest = (NSFetchRequest *)v36;

      id v4 = v71;
      v14 = &selRef_collectLogsDiagnosticMode_uuid_reply_;
    }

    else
    {
      if (v28)
      {
        id v51 = [v13 length];
        *(_DWORD *)buf = 136315650;
        v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
        __int16 v78 = 2048;
        v79 = 0LL;
        __int16 v80 = 2048;
        id v81 = v51;
        LODWORD(v69) = 32;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE: compression_decode_buffer fetchRequestData to Size of %zd, from size %zd",  (const char *)buf,  v69,  v70);
      }

      v37 = 0LL;
      id v4 = v71;
    }

    v52 = (void *)objc_claimAutoreleasedReturnValue([v14 + 488 sharedW5BufferPool]);
    [v52 returnBufferToPool:fetchRequest];

    v53 = (void *)objc_claimAutoreleasedReturnValue([v14 + 488 sharedW5BufferPool]);
    [v53 returnBufferToPool:v24];

    uint64_t v5 = v72;
LABEL_24:

    v54 = v8->_fetchRequest;
    uint64_t v55 = sub_10008C90C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    BOOL v56 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v54)
    {
      if (v56)
      {
        v57 = (char *)[v13 length];
        *(_DWORD *)buf = 136315394;
        v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
        __int16 v78 = 2048;
        v79 = v57;
        LODWORD(v69) = 22;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: W5PeerDatabaseRequestPayload sizeof fetchRequest %ld bytes",  (const char *)buf,  v69);
      }

      uint64_t v58 = sub_10008E334();
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_signpost_enabled(v59))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v59,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "W5PeerDatabaseRequestPayload initWithRequest",  "Success",  buf,  2u);
      }

      goto LABEL_40;
    }

    if (v56)
    {
      *(_DWORD *)buf = 136315394;
      v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
      __int16 v78 = 2112;
      v79 = v37;
      LODWORD(v69) = 22;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE to NSKeyedUnarchiver fetchRequestData error='%@'",  buf,  v69);
    }

    goto LABEL_34;
  }

  uint64_t v67 = sub_10008C90C();
  v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v68,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE: getPairOfBuffersFromPool returned less than 2 buffers",  (const char *)buf);
  }

LABEL_33:
  v37 = 0LL;
LABEL_34:

LABEL_35:
  uint64_t v62 = sub_10008C90C();
  v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
    __int16 v78 = 2112;
    v79 = v37;
    LODWORD(v69) = 22;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v63,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: init error (error='%@'",  buf,  v69);
  }

  uint64_t v64 = sub_10008E334();
  v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
  if (os_signpost_enabled(v59))
  {
    *(_DWORD *)buf = 138412290;
    v77 = v37;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v59,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "W5PeerDatabaseRequestPayload initWithRequest",  "Error=%@",  buf,  0xCu);
  }

  v8 = 0LL;
LABEL_40:

  v65 = v8;
  objc_autoreleasePoolPop(v5);

  return v65;
}

- (id)encode
{
  v3 = objc_autoreleasePoolPush();
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = sub_10008E334();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "W5PeerDatabaseRequestPayload encode",  (const char *)&unk_1000BB786,  buf,  2u);
  }

  if (!self->_version)
  {
    uint64_t v43 = sub_10008C90C();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "-[W5PeerDatabaseRequestPayload encode]";
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE: bad version",  (const char *)buf);
    }

    uint64_t v9 = 0LL;
    id v10 = 0LL;
    goto LABEL_26;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequestPayload version](self, "version"));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v7, @"version");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequestPayload fetchRequest](self, "fetchRequest"));
  id v52 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  &v52));
  id v10 = v52;

  if (!v9)
  {
    uint64_t v44 = sub_10008C90C();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[W5PeerDatabaseRequestPayload encode]";
      __int16 v55 = 2112;
      size_t v56 = (size_t)v10;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE to NSKeyedArchiver fetchRequest with error='%@'",  buf,  22);
    }

    uint64_t v9 = 0LL;
    goto LABEL_26;
  }

  if (-[NSNumber isEqualToNumber:](self->_version, "isEqualToNumber:", &off_1000DF840)) {
    goto LABEL_8;
  }
  if (-[NSNumber isEqualToNumber:](self->_version, "isEqualToNumber:", &off_1000DF858))
  {
    if ((unint64_t)[v9 length] >= 0x2801)
    {
LABEL_8:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](&OBJC_CLASS___W5BufferPool, "sharedW5BufferPool"));
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 getPairOfBuffersFromPool]);

      if ((unint64_t)-[os_log_s count](v12, "count") <= 1)
      {
        uint64_t v45 = sub_10008C90C();
        uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "-[W5PeerDatabaseRequestPayload encode]";
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v46,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE: getPairOfBuffersFromPool returned less than 2 buffers",  (const char *)buf);
        }

        goto LABEL_26;
      }

      id v50 = v10;
      id v51 = v3;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s firstObject](v12, "firstObject"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s lastObject](v12, "lastObject"));
      compression_encode_scratch_buffer_size(COMPRESSION_LZFSE);
      id v15 = v13;
      v16 = (uint8_t *)[v15 mutableBytes];
      id v17 = [v15 length];
      id v18 = v9;
      v19 = (const uint8_t *)[v18 bytes];
      id v20 = [v18 length];
      id v21 = v14;
      size_t v22 = compression_encode_buffer( v16,  (size_t)v17,  v19,  (size_t)v20,  [v21 mutableBytes],  COMPRESSION_LZFSE);
      uint64_t v23 = sub_10008C90C();
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v25)
        {
          id v26 = [v18 length];
          *(_DWORD *)buf = 136315650;
          v54 = "-[W5PeerDatabaseRequestPayload encode]";
          __int16 v55 = 2048;
          size_t v56 = v22;
          __int16 v57 = 2048;
          id v58 = v26;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: compression_encode_buffer fetchRequestData to Size of %zd, o riginal fetchRequestData.length %zd",  (const char *)buf,  32,  v49);
        }

        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( NSData, "dataWithBytes:length:", [v15 mutableBytes], v22));
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v24, @"fetchRequestNSData");
      }

      else if (v25)
      {
        id v27 = [v18 length];
        id v28 = [v15 length];
        id v29 = [v21 length];
        *(_DWORD *)buf = 136315906;
        v54 = "-[W5PeerDatabaseRequestPayload encode]";
        __int16 v55 = 2048;
        size_t v56 = (size_t)v27;
        __int16 v57 = 2048;
        id v58 = v28;
        __int16 v59 = 2048;
        id v60 = v29;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE: compression_encode_buffer to compress fetchRequestDat a %zd into size %zd with scratch size %zd",  (const char *)buf,  42,  v49,  (size_t)v50);
      }

      id v10 = v50;
      v3 = v51;

      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](&OBJC_CLASS___W5BufferPool, "sharedW5BufferPool"));
      [v30 returnBufferToPool:v15];

      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](&OBJC_CLASS___W5BufferPool, "sharedW5BufferPool"));
      [v31 returnBufferToPool:v21];

      goto LABEL_16;
    }

    uint64_t v40 = sub_10008C90C();
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      id v42 = [v9 length];
      *(_DWORD *)buf = 136315394;
      v54 = "-[W5PeerDatabaseRequestPayload encode]";
      __int16 v55 = 2048;
      size_t v56 = (size_t)v42;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v41,  0LL,  "[wifivelocity] W5PeerDatabaseRequestPayload %s: Uncompressed fetchRequestData to size %zd",  (const char *)buf,  22);
    }

    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v9, @"fetchRequestNSDataUncompressed");
  }

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"W5PeerDatabaseRequestPayload NSFetchRequest %@",  self->_fetchRequest);
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end