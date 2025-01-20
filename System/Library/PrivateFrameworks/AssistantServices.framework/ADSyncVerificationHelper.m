@interface ADSyncVerificationHelper
- (ADSyncVerificationHelper)init;
- (id)_groupKeyForSyncInfo:(id)a3 domainObject:(id)a4;
- (id)checksums;
- (void)handleSyncChunkInfo:(id)a3 withSyncInfo:(id)a4 completion:(id)a5;
@end

@implementation ADSyncVerificationHelper

- (ADSyncVerificationHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADSyncVerificationHelper;
  v2 = -[ADSyncVerificationHelper init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    checksums = v2->_checksums;
    v2->_checksums = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    idCRCChecksums = v2->_idCRCChecksums;
    v2->_idCRCChecksums = v5;
  }

  return v2;
}

- (id)_groupKeyForSyncInfo:(id)a3 domainObject:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 key]);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v6 appMetadata]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_af_preferredBundleID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 syncSlots]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SASyncAnchor _af_normalizedKeyForKey:appBundleID:syncSlotName:]( &OBJC_CLASS___SASyncAnchor,  "_af_normalizedKeyForKey:appBundleID:syncSlotName:",  v7,  v9,  v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 encodedClassName]);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v12, v13));
  return v14;
}

- (void)handleSyncChunkInfo:(id)a3 withSyncInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 toRemove]);
  id v12 = [v11 count];

  v13 = (os_log_s *)AFSiriLogContextSync;
  v53 = (void (**)(void, void))v10;
  if (v12 && os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v67 = "-[ADSyncVerificationHelper handleSyncChunkInfo:withSyncInfo:completion:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Sync Verification: domain objects in toRemove list for sync verification",  buf,  0xCu);
    v13 = (os_log_s *)AFSiriLogContextSync;
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v67 = "-[ADSyncVerificationHelper handleSyncChunkInfo:withSyncInfo:completion:]";
    __int16 v68 = 2112;
    id v69 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s with chunk info %@", buf, 0x16u);
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v14 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 toAdd]);
  v51 = -[NSMutableDictionary initWithCapacity:](v14, "initWithCapacity:", [v15 count]);

  v16 = objc_autoreleasePoolPush();
  v17 = (void *)objc_claimAutoreleasedReturnValue([v8 toAdd]);
  v50 = v8;
  if (v17)
  {
    id v18 = +[AceObject aceObjectArrayWithDictionaryArray:baseClass:]( &OBJC_CLASS___AceObject,  "aceObjectArrayWithDictionaryArray:baseClass:",  v17,  objc_opt_class(&OBJC_CLASS___SADomainObject),  v49);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  }

  else
  {
    v19 = 0LL;
  }

  objc_autoreleasePoolPop(v16);
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id obj = v19;
  id v20 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
  v54 = v9;
  if (v20)
  {
    id v21 = v20;
    uint64_t v55 = *(void *)v61;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v61 != v55) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
        v24 = (void *)objc_claimAutoreleasedReturnValue( -[ADSyncVerificationHelper _groupKeyForSyncInfo:domainObject:]( self,  "_groupKeyForSyncInfo:domainObject:",  v9,  v23,  v49));
        id v25 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_checksums, "objectForKey:", v24));
        if (!v25)
        {
          id v25 = objc_alloc_init(&OBJC_CLASS___SASyncGroupChecksum);
          v26 = (void *)objc_claimAutoreleasedReturnValue([v23 encodedClassName]);
          [v25 setDomainObjectClass:v26];

          v27 = objc_alloc_init(&OBJC_CLASS___SASyncAnchor);
          v28 = (void *)objc_claimAutoreleasedReturnValue([v9 key]);
          -[SASyncAnchor setKey:](v27, "setKey:", v28);

          [v25 setSyncAnchor:v27];
          -[NSMutableDictionary setObject:forKey:](self->_checksums, "setObject:forKey:", v25, v24);
        }

        objc_msgSend(v25, "setCount:", (char *)objc_msgSend(v25, "count") + 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 absoluteString]);

        if ([v30 length])
        {
          id v31 = objc_claimAutoreleasedReturnValue([v30 dataUsingEncoding:4]);
          uLong v32 = crc32(0, (const Bytef *)[v31 bytes], (uInt)objc_msgSend(v31, "length"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_idCRCChecksums, "objectForKey:", v24));
          v34 = (char *)[v33 longLongValue];

          idCRCChecksums = self->_idCRCChecksums;
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", &v34[v32]));
          -[NSMutableDictionary setObject:forKey:](idCRCChecksums, "setObject:forKey:", v36, v24);

          if (v53)
          {
            v37 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v51, "objectForKey:", v24));
            if (!v37)
            {
              v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              -[NSMutableDictionary setObject:forKey:](v51, "setObject:forKey:", v37, v24);
            }

            -[NSMutableArray addObject:](v37, "addObject:", v30);
          }

          id v9 = v54;
        }

        else
        {
          v38 = (os_log_s *)AFSiriLogContextSync;
          if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v67 = "-[ADSyncVerificationHelper handleSyncChunkInfo:withSyncInfo:completion:]";
            __int16 v68 = 2112;
            id v69 = v23;
            _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "%s Sync verification got domain object with no identifier %@",  buf,  0x16u);
          }
        }
      }

      id v21 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
    }

    while (v21);
  }

  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v39 = v49;
  id v40 = [v39 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v57;
    do
    {
      for (j = 0LL; j != v41; j = (char *)j + 1)
      {
        if (*(void *)v57 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = *(void *)(*((void *)&v56 + 1) + 8LL * (void)j);
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_checksums, "objectForKey:", v44, v49));
        v46 = (void *)objc_claimAutoreleasedReturnValue([v45 syncAnchor]);
        v47 = (void *)objc_claimAutoreleasedReturnValue([v50 validity]);
        [v46 setValidity:v47];

        v48 = (void *)objc_claimAutoreleasedReturnValue([v50 post]);
        [v46 setGeneration:v48];

        [v45 setSyncAnchor:v46];
        -[NSMutableDictionary setObject:forKey:](self->_checksums, "setObject:forKey:", v45, v44);
      }

      id v41 = [v39 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }

    while (v41);
  }

  if (v53 && -[NSMutableDictionary count](v51, "count")) {
    ((void (**)(void, NSMutableDictionary *))v53)[2](v53, v51);
  }
}

- (id)checksums
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSMutableDictionary count](self->_checksums, "count")));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_checksums, "allKeys"));
  id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_checksums, "objectForKey:", v8));
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_idCRCChecksums, "objectForKey:", v8));
        id v11 = [v10 longLongValue];

        id v12 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%lld", v11);
        [v9 setIdentifierChecksum:v12];

        v13 = (void *)objc_claimAutoreleasedReturnValue([v9 syncAnchor]);
        objc_msgSend(v13, "setCount:", objc_msgSend(v9, "count"));
        [v9 setSyncAnchor:v13];
        [v3 addObject:v9];
      }

      id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v5);
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end