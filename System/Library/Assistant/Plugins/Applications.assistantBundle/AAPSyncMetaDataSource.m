@interface AAPSyncMetaDataSource
+ ($6CA5CDF3C096CCED9299135883B5FA34)_createSourceInfoForLastState:(id)a3 startAnchor:(id)a4 keyAnchor:(id)a5 validity:(id)a6 configuration:(id)a7;
+ (id)projectedStateForKeyAnchor:(id)a3 withValidity:(id)a4;
- (AAPSyncMetaDataSource)initWithLastState:(id)a3 startAnchor:(id)a4 keyAnchor:(id)a5 validity:(id)a6 configuration:(id)a7 observer:(id)a8;
- (AAPSyncState)state;
- (NSArray)metaData;
- (void)dealloc;
- (void)waitUntilReady;
@end

@implementation AAPSyncMetaDataSource

- (AAPSyncMetaDataSource)initWithLastState:(id)a3 startAnchor:(id)a4 keyAnchor:(id)a5 validity:(id)a6 configuration:(id)a7 observer:(id)a8
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___AAPSyncMetaDataSource;
  v14 = -[AAPSyncMetaDataSource init](&v18, "init");
  if (v14)
  {
    v15 = dispatch_queue_create(0LL, 0LL);
    v14->_queue = (OS_dispatch_queue *)v15;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_860C;
    block[3] = &unk_1C860;
    block[4] = v14;
    block[5] = a3;
    block[6] = a4;
    block[7] = a5;
    block[8] = a6;
    block[9] = a7;
    block[10] = a8;
    dispatch_async(v15, block);
  }

  return v14;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AAPSyncMetaDataSource;
  -[AAPSyncMetaDataSource dealloc](&v3, "dealloc");
}

+ (id)projectedStateForKeyAnchor:(id)a3 withValidity:(id)a4
{
  id v4 = [a1 _createSourceInfoForLastState:0 startAnchor:0 keyAnchor:a3 validity:a4 configuration:0];
  v6 = v5;

  return v6;
}

- (void)waitUntilReady
{
}

+ ($6CA5CDF3C096CCED9299135883B5FA34)_createSourceInfoForLastState:(id)a3 startAnchor:(id)a4 keyAnchor:(id)a5 validity:(id)a6 configuration:(id)a7
{
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v69 = 0LL;
  v70 = &v69;
  uint64_t v71 = 0x3052000000LL;
  v72 = sub_8F74;
  v73 = sub_8F84;
  unsigned __int8 v11 = objc_msgSend(a5, "isNewerThanAnchor:", objc_msgSend(a3, "keyAnchor"));
  id v12 = a5;
  if ((v11 & 1) == 0) {
    id v12 = [a3 keyAnchor];
  }
  id v74 = v12;
  uint64_t v65 = 0LL;
  v66 = &v65;
  uint64_t v67 = 0x2020000000LL;
  char v68 = objc_msgSend(a5, "isEqualToAnchor:", objc_msgSend(a3, "keyAnchor")) ^ 1;
  if (*((_BYTE *)v66 + 24)
    || (objc_msgSend( objc_msgSend(a4, "primitiveAnchor"),  "isEqualToAnchor:",  objc_msgSend(objc_msgSend(a3, "stopAnchor"), "primitiveAnchor")) & 1) == 0)
  {
    v14 = -[NSMutableSet initWithSet:]([NSMutableSet alloc], "initWithSet:", [a3 apps]);
    v51 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_8F90;
    v64[3] = &unk_1C8C8;
    v64[4] = v14;
    v64[5] = v51;
    v64[6] = a7;
    v64[7] = v10;
    v64[8] = &v69;
    v64[9] = &v65;
    AFApplicationWorkspaceEnumerateInstalledUserVisibleApplications(v64);
    if (*((_BYTE *)v66 + 24))
    {
      id v15 = [a3 keyAnchor];
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v60,  v85,  16LL);
      if (v16)
      {
        id v48 = a3;
        uint64_t v17 = *(void *)v61;
        do
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v61 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v60 + 1) + 8LL * (void)i);
            id v15 = [v15 anchorByIncrementingSubIndex];
            v20 = -[AAPSyncMetaDataItemDelete initWithAppId:anchor:]( objc_alloc(&OBJC_CLASS___AAPSyncMetaDataItemDelete),  "initWithAppId:anchor:",  v19,  v15);
            -[NSMutableArray addObject:](v10, "addObject:", v20);

            v21 = (os_log_s *)AFSiriLogContextPlugin;
            if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v76 = "+[AAPSyncMetaDataSource _createSourceInfoForLastState:startAnchor:keyAnchor:validity:configuration:]";
              __int16 v77 = 2112;
              id v78 = v20;
              _os_log_debug_impl( &dword_0,  v21,  OS_LOG_TYPE_DEBUG,  "%s com.apple.siri.applications: inserting delete metaDataItem=%@",  buf,  0x16u);
            }
          }

          id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v60,  v85,  16LL);
        }

        while (v16);
        char v22 = 0;
        a3 = v48;
        goto LABEL_24;
      }
    }

    else if (-[NSMutableSet count](v14, "count"))
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_11CF4();
      }
      char v22 = 1;
LABEL_24:

      if ((v22 & 1) != 0)
      {
        v23 = 0LL;
        v24 = 0LL;
        goto LABEL_60;
      }

      goto LABEL_26;
    }

    char v22 = 0;
    goto LABEL_24;
  }

  v13 = (os_log_s *)AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v76 = "+[AAPSyncMetaDataSource _createSourceInfoForLastState:startAnchor:keyAnchor:validity:configuration:]";
    _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: no need to query MI if we only need to send up some delete records",  buf,  0xCu);
  }

  v51 = 0LL;
LABEL_26:
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v25 = a3;
  id v26 = [a3 deletes];
  id v27 = [v26 countByEnumeratingWithState:&v56 objects:v84 count:16];
  if (!v27) {
    goto LABEL_40;
  }
  uint64_t v28 = *(void *)v57;
  do
  {
    v29 = 0LL;
    do
    {
      if (*(void *)v57 != v28) {
        objc_enumerationMutation(v26);
      }
      v30 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)v29);
      if (-[NSMutableSet containsObject:](v51, "containsObject:", [v30 appId]))
      {
        v31 = (os_log_s *)AFSiriLogContextPlugin;
        if (!os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_35;
        }
        id v32 = [v30 appId];
        *(_DWORD *)buf = 136315394;
        v76 = "+[AAPSyncMetaDataSource _createSourceInfoForLastState:startAnchor:keyAnchor:validity:configuration:]";
        __int16 v77 = 2112;
        id v78 = v32;
        v33 = v31;
        v34 = "%s com.apple.siri.applications: not applying saved delete because the app has been re-added -> (%@)";
      }

      else
      {
        -[NSMutableArray addObject:](v10, "addObject:", v30);
        v35 = (os_log_s *)AFSiriLogContextPlugin;
        if (!os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_35;
        }
        *(_DWORD *)buf = 136315394;
        v76 = "+[AAPSyncMetaDataSource _createSourceInfoForLastState:startAnchor:keyAnchor:validity:configuration:]";
        __int16 v77 = 2112;
        id v78 = v30;
        v33 = v35;
        v34 = "%s com.apple.siri.applications: applying saved delete metaDataItem=%@";
      }

      _os_log_debug_impl(&dword_0, v33, OS_LOG_TYPE_DEBUG, v34, buf, 0x16u);
LABEL_35:
      v29 = (char *)v29 + 1;
    }

    while (v27 != v29);
    id v36 = [v26 countByEnumeratingWithState:&v56 objects:v84 count:16];
    id v27 = v36;
  }

  while (v36);
LABEL_40:
  -[NSMutableArray sortUsingComparator:](v10, "sortUsingComparator:", &stru_1C908);
  v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v38 = [v25 stopAnchor];
  v24 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](v10, "count"));
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v52,  v83,  16LL);
  if (v39)
  {
    uint64_t v40 = *(void *)v53;
    do
    {
      for (j = 0LL; j != v39; j = (char *)j + 1)
      {
        if (*(void *)v53 != v40) {
          objc_enumerationMutation(v10);
        }
        v42 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)j);
        id v43 = [v42 anchor];
        if ([v43 isNewerThanAnchor:a4])
        {
          -[NSMutableArray addObject:](v24, "addObject:", v42);
        }
      }

      id v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v52,  v83,  16LL);
    }

    while (v39);
  }

  v44 = (os_log_s *)AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v76 = "+[AAPSyncMetaDataSource _createSourceInfoForLastState:startAnchor:keyAnchor:validity:configuration:]";
    __int16 v77 = 2114;
    id v78 = a4;
    __int16 v79 = 2114;
    id v80 = v38;
    __int16 v81 = 2112;
    v82 = v24;
    _os_log_debug_impl( &dword_0,  v44,  OS_LOG_TYPE_DEBUG,  "%s com.apple.siri.applications: sorted and trimmed metaData to range (%{public}@, %{public}@) -> %@",  buf,  0x2Au);
  }

  if (*((_BYTE *)v66 + 24))
  {
    v45 = objc_alloc(&OBJC_CLASS___AAPSyncState);
    v23 = -[AAPSyncState initWithValidity:version:keyAnchor:startAnchor:stopAnchor:apps:deletes:]( v45,  "initWithValidity:version:keyAnchor:startAnchor:stopAnchor:apps:deletes:",  a6,  4LL,  v70[5],  a4,  v38,  v51,  v37);
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_11C88();
    }
  }

  else
  {
    v23 = (AAPSyncState *)v25;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_11C1C();
    }
  }

LABEL_60:
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  v46 = v24;
  v47 = v23;
  result.var1 = v47;
  result.var0 = v46;
  return result;
}

- (NSArray)metaData
{
  return self->_metaData;
}

- (AAPSyncState)state
{
  return self->_state;
}

@end