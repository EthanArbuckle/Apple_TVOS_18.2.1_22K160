@interface RDPeerSharingInfoCache
+ (BOOL)supportsSecureCoding;
+ (id)getCachePath;
+ (id)loadCache;
- (BOOL)save;
- (NSMutableDictionary)cache;
- (RDPeerSharingInfoCache)init;
- (RDPeerSharingInfoCache)initWithCache:(id)a3;
- (RDPeerSharingInfoCache)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCache:(id)a3;
@end

@implementation RDPeerSharingInfoCache

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class(self) allocWithZone:a3];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDPeerSharingInfoCache cache](self, "cache"));
  id v6 = [v4 initWithCache:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RDPeerSharingInfoCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RDPeerSharingInfoCache;
  v2 = -[RDPeerSharingInfoCache init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;
  }

  return v2;
}

- (RDPeerSharingInfoCache)initWithCache:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RDPeerSharingInfoCache;
  objc_super v6 = -[RDPeerSharingInfoCache init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cache, a3);
  }

  return v7;
}

- (RDPeerSharingInfoCache)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RDPeerSharingInfoCache;
  id v5 = -[RDPeerSharingInfoCache init](&v13, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___RDPeerSharingInfoDevice);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDate);
    objc_super v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v7,  v8,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v10 forKey:@"kRDPeerSharingInfoCacheKeyCache"]);
    id v5 = -[RDPeerSharingInfoCache initWithCache:](v5, "initWithCache:", v11);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RDPeerSharingInfoCache cache](self, "cache"));
  [v4 encodeObject:v5 forKey:@"kRDPeerSharingInfoCacheKeyCache"];
}

+ (id)getCachePath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RDCachedData getCacheDirPath](&OBJC_CLASS___RDCachedData, "getCacheDirPath"));
  v6[0] = v2;
  v6[1] = @"shareStamps.plist";
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v3));

  return v4;
}

+ (id)loadCache
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RDPeerSharingInfoCache getCachePath](&OBJC_CLASS___RDPeerSharingInfoCache, "getCachePath"));
  id v34 = 0LL;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v2,  1LL,  &v34));
  id v4 = v34;
  id v5 = v4;
  if (v3)
  {
    if (v4)
    {
      if (qword_100019340 != -1) {
        dispatch_once(&qword_100019340, &stru_100014A68);
      }
      uint64_t v6 = (void *)qword_100019348;
      if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = v6;
        id v8 = objc_claimAutoreleasedReturnValue([v5 description]);
        id v9 = [v8 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v36 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Got an error while reading sharing data, but continuing anyway: %s",  buf,  0xCu);
      }
    }

    uint64_t v10 = objc_opt_class(&OBJC_CLASS___RDPeerSharingInfoCache);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDate);
    objc_super v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  v11,  v12,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v33 = 0LL;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v14,  v3,  &v33));
    id v16 = v33;
    v17 = v16;
    if (v15)
    {
      if (v16)
      {
        if (qword_100019340 != -1) {
          dispatch_once(&qword_100019340, &stru_100014A68);
        }
        v18 = (void *)qword_100019348;
        if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_ERROR))
        {
          v19 = v18;
          id v20 = objc_claimAutoreleasedReturnValue([v17 description]);
          id v21 = [v20 UTF8String];
          *(_DWORD *)buf = 136315138;
          id v36 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Encountered error while unarchiving sharing cache: %s",  buf,  0xCu);
        }
      }

      v22 = v15;
    }

    else
    {
      if (qword_100019340 != -1) {
        dispatch_once(&qword_100019340, &stru_100014A68);
      }
      v28 = (void *)qword_100019348;
      if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_ERROR))
      {
        v29 = v28;
        id v30 = objc_claimAutoreleasedReturnValue([v17 description]);
        id v31 = [v30 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v36 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Failed to read unarchive sharing cache: %s",  buf,  0xCu);
      }

      v22 = objc_alloc_init(&OBJC_CLASS___RDPeerSharingInfoCache);
    }

    v27 = v22;
  }

  else
  {
    if (qword_100019340 != -1) {
      dispatch_once(&qword_100019340, &stru_100014A68);
    }
    v23 = (void *)qword_100019348;
    if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_ERROR))
    {
      v24 = v23;
      id v25 = objc_claimAutoreleasedReturnValue([v5 description]);
      id v26 = [v25 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v36 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Failed to read sharing cached data file: %s",  buf,  0xCu);
    }

    v27 = objc_alloc_init(&OBJC_CLASS___RDPeerSharingInfoCache);
  }

  return v27;
}

- (BOOL)save
{
  uint64_t v3 = (const char **)_CFGetProgname(self, a2);
  if (!strcmp(*v3, "countryd"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[RDPeerSharingInfoCache getCachePath](&OBJC_CLASS___RDPeerSharingInfoCache, "getCachePath"));
    id v24 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  &v24));
    id v9 = v24;
    if (v9)
    {
      if (qword_100019340 != -1) {
        dispatch_once(&qword_100019340, &stru_100014A68);
      }
      uint64_t v10 = (void *)qword_100019348;
      if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = v10;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedFailureReason]);
        *(_DWORD *)buf = 68289538;
        int v26 = 0;
        __int16 v27 = 2082;
        v28 = "";
        __int16 v29 = 2114;
        id v30 = v12;
        __int16 v31 = 2114;
        v32 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:Failed to archive sharing data, description:%{public, location:escape_only}@, f ailureReason:%{public, location:escape_only}@}",  buf,  0x26u);

        if (qword_100019340 != -1) {
          dispatch_once(&qword_100019340, &stru_100014A68);
        }
      }

      v14 = (void *)qword_100019348;
      if (!os_signpost_enabled((os_log_t)qword_100019348)) {
        goto LABEL_32;
      }
      v15 = v14;
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedFailureReason]);
      *(_DWORD *)buf = 68289538;
      int v26 = 0;
      __int16 v27 = 2082;
      v28 = "";
      __int16 v29 = 2114;
      id v30 = v16;
      __int16 v31 = 2114;
      v32 = v17;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Failed to archive sharing data",  "{msg%{public}.0s:Failed to archive sharing data, description:%{public, location:escape_only}@, fai lureReason:%{public, location:escape_only}@}",  buf,  0x26u);
    }

    else
    {
      id v23 = 0LL;
      unsigned __int8 v18 = [v8 writeToFile:v7 options:268435457 error:&v23];
      v15 = (os_log_s *)v23;
      if ((v18 & 1) != 0)
      {
        if (qword_100019340 != -1) {
          dispatch_once(&qword_100019340, &stru_100014A68);
        }
        v19 = (os_log_s *)qword_100019348;
        if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68289026;
          int v26 = 0;
          __int16 v27 = 2082;
          v28 = "";
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Saved sharing cache}",  buf,  0x12u);
        }

        BOOL v6 = 1;
        goto LABEL_33;
      }

      if (qword_100019340 != -1) {
        dispatch_once(&qword_100019340, &stru_100014A68);
      }
      id v20 = (os_log_s *)qword_100019348;
      if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289282;
        int v26 = 0;
        __int16 v27 = 2082;
        v28 = "";
        __int16 v29 = 2114;
        id v30 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:Failed to write sharing cache, path:%{public, location:escape_only}@}",  buf,  0x1Cu);
        if (qword_100019340 != -1) {
          dispatch_once(&qword_100019340, &stru_100014A68);
        }
      }

      id v21 = (os_log_s *)qword_100019348;
      if (os_signpost_enabled((os_log_t)qword_100019348))
      {
        *(_DWORD *)buf = 68289282;
        int v26 = 0;
        __int16 v27 = 2082;
        v28 = "";
        __int16 v29 = 2114;
        id v30 = v7;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Failed to write sharing cache",  "{msg%{public}.0s:Failed to write sharing cache, path:%{public, location:escape_only}@}",  buf,  0x1Cu);
      }
    }

LABEL_32:
    BOOL v6 = 0;
LABEL_33:

    return v6;
  }

  if (qword_100019340 != -1) {
    dispatch_once(&qword_100019340, &stru_100014A68);
  }
  id v4 = (os_log_s *)qword_100019348;
  if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289026;
    int v26 = 0;
    __int16 v27 = 2082;
    v28 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:Only countryd can save the sharing cache}",  buf,  0x12u);
    if (qword_100019340 != -1) {
      dispatch_once(&qword_100019340, &stru_100014A68);
    }
  }

  id v5 = (os_log_s *)qword_100019348;
  if (os_signpost_enabled((os_log_t)qword_100019348))
  {
    *(_DWORD *)buf = 68289026;
    int v26 = 0;
    __int16 v27 = 2082;
    v28 = "";
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v5,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Only countryd can save the sharing cache",  "{msg%{public}.0s:Only countryd can save the sharing cache}",  buf,  0x12u);
  }

  return 0;
}

- (NSMutableDictionary)cache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end