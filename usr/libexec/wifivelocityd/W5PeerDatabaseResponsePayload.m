@interface W5PeerDatabaseResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (NSArray)fetchedResults;
- (NSNumber)version;
- (W5PeerDatabaseResponsePayload)initWithRequest:(id)a3;
- (id)convertCSVArrayToKeyValueDictArray:(id)a3;
- (id)convertKeyValueDictArrayToCSVArray:(id)a3;
- (id)encode;
- (int64_t)status;
- (void)setFetchedResults:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerDatabaseResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerDatabaseResponsePayload)initWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_autoreleasePoolPush();
  uint64_t v6 = sub_10008E334();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "W5PeerDatabaseResponsePayload initWithRequest",  (const char *)&unk_1000BB786,  buf,  2u);
  }

  v108.receiver = self;
  v108.super_class = (Class)&OBJC_CLASS___W5PeerDatabaseResponsePayload;
  v8 = -[W5PeerDatabaseResponsePayload init](&v108, "init");
  if (!v8
    || (v9 = (NSNumber *)[v4 objectForKey:@"version"],
        (v8->_version = v9) == 0LL))
  {
    v38 = 0LL;
    goto LABEL_47;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"status"]);
  v11 = v10;
  if (v10) {
    v8->_status = (int64_t)[v10 integerValue];
  }
  context = v5;
  v105 = v4;
  v103 = v11;
  if (!-[NSNumber isEqualToNumber:](v8->_version, "isEqualToNumber:", &off_1000DF7F8))
  {
    if (!-[NSNumber isEqualToNumber:](v8->_version, "isEqualToNumber:", &off_1000DF810)) {
      goto LABEL_52;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"peerDatabaseResultsUncompressed"]);

    if (v12)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"peerDatabaseResultsUncompressed"]);
      if (v13)
      {
        v14 = (void *)v13;
        v101 = v8;
        uint64_t v15 = sub_10008C90C();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (char *)[v14 length];
          *(_DWORD *)buf = 136315394;
          v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
          __int16 v111 = 2048;
          v112 = v17;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: Uncompressed databaseData size is %zd",  (const char *)buf,  22);
        }

        uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSArray, v18);
        uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary, v20);
        uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSNumber, v22);
        v25 = v14;
        uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString, v24);
        uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSDate, v27);
        uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSUUID, v29);
        uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSMutableSet, v31);
        uint64_t v98 = v26;
        id v34 = v25;
        v35 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v19,  v21,  v23,  v98,  v28,  v30,  v32,  objc_opt_class(&OBJC_CLASS___NSNull, v33),  0LL);
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        id v106 = 0LL;
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v36,  v25,  &v106));
        v38 = (char *)v106;
        v8 = v101;
        goto LABEL_26;
      }

      goto LABEL_52;
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"peerDatabaseResults"]);

    if (!v39) {
      goto LABEL_52;
    }
  }

  uint64_t v40 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"peerDatabaseResults"]);
  if (!v40)
  {
LABEL_52:
    uint64_t v95 = sub_10008C90C();
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v36,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: Failed to find kW5PeerResponsePeerDatabaseResultsUncompressedKe y or kW5PeerResponsePeerDatabaseResultsKey",  buf);
    }

- (id)convertCSVArrayToKeyValueDictArray:(id)a3
{
  id v3 = a3;
  id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v26 = (id)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = v3;
  uint64_t v23 = (char *)[obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v23)
  {
    id v4 = 0LL;
    uint64_t v22 = *(void *)v32;
    do
    {
      uint64_t v5 = 0LL;
      uint64_t v19 = v4;
      uint64_t v6 = (uint64_t)v4;
      do
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v5);
        if (v6)
        {
          uint64_t v24 = v6;
          v25 = v5;
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          id v26 = v26;
          id v9 = [v26 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = 0LL;
            uint64_t v12 = *(void *)v28;
            do
            {
              uint64_t v13 = 0LL;
              do
              {
                if (*(void *)v28 != v12) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)v13);
                uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (char *)v13 + v11, v19));
                v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

                if (v15 != v16) {
                  [v8 setObject:v15 forKeyedSubscript:v14];
                }

                uint64_t v13 = (char *)v13 + 1;
              }

              while (v10 != v13);
              id v10 = [v26 countByEnumeratingWithState:&v27 objects:v35 count:16];
              v11 += (uint64_t)v13;
            }

            while (v10);
          }

          [v21 addObject:v8];
          uint64_t v5 = v25;
          uint64_t v6 = v24 + 1;
        }

        else
        {
          v8 = v26;
          uint64_t v6 = 1LL;
          id v26 = v7;
        }

        ++v5;
      }

      while (v5 != v23);
      v17 = (char *)[obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      id v4 = &v19[(void)v23];
      uint64_t v23 = v17;
    }

    while (v17);
  }

  return v21;
}

- (id)convertKeyValueDictArrayToCSVArray:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v35 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v50 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v49 + 1) + 8 * (void)i) allKeys]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
        [v4 unionSet:v12];
      }

      id v8 = [v6 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }

    while (v8);
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v13 = v4;
  id v14 = [v13 countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v46;
    do
    {
      for (j = 0LL; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(v13);
        }
        [v5 addObject:*(void *)(*((void *)&v45 + 1) + 8 * (void)j)];
      }

      id v15 = [v13 countByEnumeratingWithState:&v45 objects:v55 count:16];
    }

    while (v15);
  }

  __int128 v31 = v13;

  [v35 addObject:v5];
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = v6;
  id v36 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v36)
  {
    uint64_t v33 = *(void *)v42;
    __int128 v34 = v5;
    do
    {
      for (k = 0LL; k != v36; k = (char *)k + 1)
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)k);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", v31));
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        id v21 = v5;
        id v22 = [v21 countByEnumeratingWithState:&v37 objects:v53 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v38;
          do
          {
            for (m = 0LL; m != v23; m = (char *)m + 1)
            {
              if (*(void *)v38 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)m);
              __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v26]);

              if (v27) {
                uint64_t v28 = objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v26]);
              }
              else {
                uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
              }
              __int128 v29 = (void *)v28;
              [v20 addObject:v28];
            }

            id v23 = [v21 countByEnumeratingWithState:&v37 objects:v53 count:16];
          }

          while (v23);
        }

        [v35 addObject:v20];
        uint64_t v5 = v34;
      }

      id v36 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
    }

    while (v36);
  }

  return v35;
}

- (id)encode
{
  id v3 = objc_autoreleasePoolPush();
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = sub_10008E334();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "W5PeerDatabaseResponsePayload encode",  (const char *)&unk_1000BB786,  buf,  2u);
  }

  uint64_t v7 = sub_10008C90C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload version](self, "version"));
    int64_t v10 = -[W5PeerDatabaseResponsePayload status](self, "status");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload fetchedResults](self, "fetchedResults"));
    *(_DWORD *)buf = 136315906;
    uint64_t v78 = "-[W5PeerDatabaseResponsePayload encode]";
    __int16 v79 = 2112;
    size_t v80 = (size_t)v9;
    __int16 v81 = 2048;
    int64_t v82 = v10;
    __int16 v83 = 2112;
    id v84 = v11;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: version='%@', status=%ld, peerDatabase='%@'",  buf,  42);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload version](self, "version"));
  if (!v12)
  {
    uint64_t v59 = sub_10008C90C();
    __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v78 = "-[W5PeerDatabaseResponsePayload encode]";
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: bad version",  buf);
    }

    goto LABEL_53;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload version](self, "version"));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v13, @"version");

  if (!-[W5PeerDatabaseResponsePayload status](self, "status"))
  {
    uint64_t v60 = sub_10008C90C();
    __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v78 = "-[W5PeerDatabaseResponsePayload encode]";
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: bad status",  buf);
    }

    goto LABEL_53;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[W5PeerDatabaseResponsePayload status](self, "status")));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v14, @"status");

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload fetchedResults](self, "fetchedResults"));
  if (!v15)
  {
    uint64_t v16 = sub_10008C90C();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v78 = "-[W5PeerDatabaseResponsePayload encode]";
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: bad fetchedResults",  (const char *)buf);
    }
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload fetchedResults](self, "fetchedResults"));

  if (!v18)
  {
    uint64_t v61 = sub_10008C90C();
    __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v78 = "-[W5PeerDatabaseResponsePayload encode]";
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: bad fetchedResults",  buf);
    }

    goto LABEL_53;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload fetchedResults](self, "fetchedResults"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[W5PeerDatabaseResponsePayload convertKeyValueDictArrayToCSVArray:]( self,  "convertKeyValueDictArrayToCSVArray:",  v19));

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload fetchedResults](self, "fetchedResults"));
  if (!v21) {
    goto LABEL_20;
  }
  id v22 = v21;
  if (!v20)
  {

LABEL_17:
    uint64_t v24 = sub_10008C90C();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      fetchedResults = self->_fetchedResults;
      *(_DWORD *)buf = 136315650;
      uint64_t v78 = "-[W5PeerDatabaseResponsePayload encode]";
      __int16 v79 = 2112;
      size_t v80 = (size_t)v20;
      __int16 v81 = 2112;
      int64_t v82 = (int64_t)fetchedResults;
      LODWORD(v72) = 32;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: bad csvDictArray: %@ from fetchedResults: %@",  buf,  v72);
    }

LABEL_20:
    if (!v20)
    {
      uint64_t v62 = sub_10008C90C();
      __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v78 = "-[W5PeerDatabaseResponsePayload encode]";
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: bad csvDictArray",  buf);
      }

      goto LABEL_53;
    }

    goto LABEL_21;
  }

  id v23 = [v20 count];

  if (!v23) {
    goto LABEL_17;
  }
LABEL_21:
  id v76 = 0LL;
  uint64_t v27 = objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v20,  1LL,  &v76));
  unint64_t v28 = (unint64_t)v76;
  if (!(v27 | v28))
  {
    uint64_t v63 = sub_10008C90C();
    __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v78 = "-[W5PeerDatabaseResponsePayload encode]";
      __int16 v79 = 2112;
      size_t v80 = 0LL;
      LODWORD(v72) = 22;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: to encode W5PeerDatabaseResponsePayload databaseData with error='%@'",  buf,  v72);
    }

    goto LABEL_53;
  }

  __int128 v29 = (void *)v28;
  if (-[NSNumber isEqualToNumber:](self->_version, "isEqualToNumber:", &off_1000DF7F8)) {
    goto LABEL_23;
  }
  if (!-[NSNumber isEqualToNumber:](self->_version, "isEqualToNumber:", &off_1000DF810)) {
    goto LABEL_36;
  }
  if ((unint64_t)[(id)v27 length] >= 0x2801)
  {
LABEL_23:
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](&OBJC_CLASS___W5BufferPool, "sharedW5BufferPool"));
    __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 getPairOfBuffersFromPool]);

    v73 = v29;
    uint64_t v75 = v3;
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s firstObject](v31, "firstObject"));
    v74 = v31;
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s lastObject](v31, "lastObject"));
    compression_encode_scratch_buffer_size(COMPRESSION_LZFSE);
    id v34 = v32;
    id v35 = (uint8_t *)[v34 mutableBytes];
    id v36 = [v34 length];
    id v37 = (id) v27;
    __int128 v38 = (const uint8_t *)[v37 bytes];
    id v39 = [v37 length];
    id v40 = v33;
    size_t v41 = compression_encode_buffer( v35,  (size_t)v36,  v38,  (size_t)v39,  [v40 mutableBytes],  COMPRESSION_LZFSE);
    uint64_t v42 = sub_10008C90C();
    __int128 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
    if (v41)
    {
      if (v44)
      {
        id v45 = [v37 length];
        *(_DWORD *)buf = 136315650;
        uint64_t v78 = "-[W5PeerDatabaseResponsePayload encode]";
        __int16 v79 = 2048;
        size_t v80 = v41;
        __int16 v81 = 2048;
        int64_t v82 = (int64_t)v45;
        LODWORD(v72) = 32;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v43,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: compression_encode_buffer databaseData to Size of %zd, origin al databaseData.length %zd",  (const char *)buf,  v72,  (size_t)v73);
      }

      __int128 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( NSData, "dataWithBytes:length:", [v34 mutableBytes], v41));
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v43, @"peerDatabaseResults");
    }

    else if (v44)
    {
      id v49 = [v37 length];
      id v50 = [v34 length];
      id v51 = [v40 length];
      *(_DWORD *)buf = 136315906;
      uint64_t v78 = "-[W5PeerDatabaseResponsePayload encode]";
      __int16 v79 = 2048;
      size_t v80 = (size_t)v49;
      __int16 v81 = 2048;
      int64_t v82 = (int64_t)v50;
      __int16 v83 = 2048;
      id v84 = v51;
      LODWORD(v72) = 42;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v43,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: compression_encode_buffer to compress databaseData %zd into size %zd with scratch size %zd",  (const char *)buf,  v72,  (size_t)v73,  (size_t)v74);
    }

    __int128 v29 = v73;

    __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](&OBJC_CLASS___W5BufferPool, "sharedW5BufferPool"));
    [v52 returnBufferToPool:v34];

    BOOL v53 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](&OBJC_CLASS___W5BufferPool, "sharedW5BufferPool"));
    [v53 returnBufferToPool:v40];

    id v3 = v75;
  }

  else
  {
    uint64_t v46 = sub_10008C90C();
    __int128 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      id v48 = [(id)v27 length];
      *(_DWORD *)buf = 136315394;
      uint64_t v78 = "-[W5PeerDatabaseResponsePayload encode]";
      __int16 v79 = 2048;
      size_t v80 = (size_t)v48;
      LODWORD(v72) = 22;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v47,  0LL,  "[wifivelocity] W5PeerDatabaseResponsePayload %s: Uncompressed databaseData to size %zd",  (const char *)buf,  v72);
    }

    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v27, @"peerDatabaseResultsUncompressed");
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

- (NSArray)fetchedResults
{
  return self->_fetchedResults;
}

- (void)setFetchedResults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end