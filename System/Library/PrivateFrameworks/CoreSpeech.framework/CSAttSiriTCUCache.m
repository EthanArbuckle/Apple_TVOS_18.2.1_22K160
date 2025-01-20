@interface CSAttSiriTCUCache
- (CSAttSiriTCUCache)init;
- (NSMutableDictionary)cachedTCUList;
- (id)getRequestIdForTCUId:(id)a3;
- (id)getTCUPackageWithTrpId:(id)a3;
- (id)getTRPIdForTCUId:(id)a3;
- (id)updateTcuState:(id)a3;
- (unint64_t)cachedTCUCount;
- (void)addTCU:(id)a3 firstTRPId:(id)a4 lastTRPId:(id)a5;
- (void)cleanUpTCUCache:(id)a3;
- (void)clearTcuCache;
- (void)setCachedTCUList:(id)a3;
@end

@implementation CSAttSiriTCUCache

- (CSAttSiriTCUCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSAttSiriTCUCache;
  v2 = -[CSAttSiriTCUCache init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    cachedTCUList = v2->_cachedTCUList;
    v2->_cachedTCUList = v3;
  }

  return v2;
}

- (id)getTCUPackageWithTrpId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000F27FC;
  v16 = sub_1000F280C;
  id v17 = 0LL;
  cachedTCUList = self->_cachedTCUList;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000F2C80;
  v9[3] = &unk_10022D388;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cachedTCUList, "enumerateKeysAndObjectsUsingBlock:", v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)updateTcuState:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = sub_1000F27FC;
  v15 = sub_1000F280C;
  id v16 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000F29C0;
  v10[3] = &unk_10022D3D0;
  v10[4] = self;
  v10[5] = &v11;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];
  if (v12[5])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedTCUList, "objectForKeyedSubscript:"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastTRPId]);
  }

  else
  {
    id v6 = 0LL;
  }

  id v7 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    cachedTCUList = self->_cachedTCUList;
    *(_DWORD *)buf = 136315394;
    v18 = "-[CSAttSiriTCUCache updateTcuState:]";
    __int16 v19 = 2112;
    v20 = cachedTCUList;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Updated TCU Cache:%@", buf, 0x16u);
  }

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)addTCU:(id)a3 firstTRPId:(id)a4 lastTRPId:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = -[CSAttSiriTCUCachedObject initWithTCUPackage:firstTRPId:lastTRPId:]( objc_alloc(&OBJC_CLASS___CSAttSiriTCUCachedObject),  "initWithTCUPackage:firstTRPId:lastTRPId:",  v8,  v10,  v9);

  if (v11)
  {
    cachedTCUList = self->_cachedTCUList;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 tcuId]);
    -[NSMutableDictionary setObject:forKey:](cachedTCUList, "setObject:forKey:", v11, v13);

    uint64_t v14 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_cachedTCUList;
      int v20 = 136315394;
      v21 = "-[CSAttSiriTCUCache addTCU:firstTRPId:lastTRPId:]";
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Updated TCU-Cache with new TCU:%@",  (uint8_t *)&v20,  0x16u);
    }
  }

  id v16 = (void *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = self->_cachedTCUList;
    v18 = v16;
    unsigned int v19 = -[NSMutableDictionary count](v17, "count");
    int v20 = 136315394;
    v21 = "-[CSAttSiriTCUCache addTCU:firstTRPId:lastTRPId:]";
    __int16 v22 = 1024;
    LODWORD(v23) = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s Cached TCU Count:%d",  (uint8_t *)&v20,  0x12u);
  }
}

- (void)cleanUpTCUCache:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableDictionary count](self->_cachedTCUList, "count");
  id v6 = (void *)CSLogCategoryRequest;
  BOOL v7 = os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      cachedTCUList = self->_cachedTCUList;
      id v9 = v6;
      id v10 = -[NSMutableDictionary count](cachedTCUList, "count");
      uint64_t v11 = self->_cachedTCUList;
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[CSAttSiriTCUCache cleanUpTCUCache:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      v28 = (uint64_t (*)(uint64_t, uint64_t))v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s itemCount:%lu _cachedTCUList:%@",  buf,  0x20u);
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v28 = sub_1000F27FC;
    v29 = sub_1000F280C;
    id v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v12 = self->_cachedTCUList;
    id v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    unsigned int v19 = sub_1000F2814;
    int v20 = &unk_10022D388;
    id v21 = v4;
    __int16 v22 = buf;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v12, "enumerateKeysAndObjectsUsingBlock:", &v17);
    if (objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "count", v17, v18, v19, v20))
    {
      uint64_t v13 = (os_log_s *)CSLogCategoryRequest;
      if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(NSMutableDictionary **)(*(void *)&buf[8] + 40LL);
        *(_DWORD *)v23 = 136315394;
        v24 = "-[CSAttSiriTCUCache cleanUpTCUCache:]";
        __int16 v25 = 2112;
        v26 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s dropTCUIDList:%@", v23, 0x16u);
      }

      -[NSMutableDictionary removeObjectsForKeys:]( self->_cachedTCUList,  "removeObjectsForKeys:",  *(void *)(*(void *)&buf[8] + 40LL));
    }

    v15 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
    {
      id v16 = self->_cachedTCUList;
      *(_DWORD *)v23 = 136315394;
      v24 = "-[CSAttSiriTCUCache cleanUpTCUCache:]";
      __int16 v25 = 2112;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Updated TCU-cache : %@", v23, 0x16u);
    }

    _Block_object_dispose(buf, 8);
  }

  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CSAttSiriTCUCache cleanUpTCUCache:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "%s Empty Cached TCU List !",  buf,  0xCu);
  }
}

- (unint64_t)cachedTCUCount
{
  cachedTCUList = self->_cachedTCUList;
  if (cachedTCUList) {
    return (unint64_t)-[NSMutableDictionary count](cachedTCUList, "count");
  }
  id v4 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    id v6 = "-[CSAttSiriTCUCache cachedTCUCount]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Cache is nil!", (uint8_t *)&v5, 0xCu);
  }

  return 0LL;
}

- (void)clearTcuCache
{
  v3 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[CSAttSiriTCUCache clearTcuCache]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[NSMutableDictionary removeAllObjects](self->_cachedTCUList, "removeAllObjects");
}

- (id)getRequestIdForTCUId:(id)a3
{
  id v4 = a3;
  cachedTCUList = self->_cachedTCUList;
  if (cachedTCUList
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cachedTCUList, "objectForKey:", v4)),
        v6,
        v6))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedTCUList, "objectForKeyedSubscript:", v4));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 TCUPackage]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 requestId]);
  }

  else
  {
    id v10 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      uint64_t v13 = "-[CSAttSiriTCUCache getRequestIdForTCUId:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Cache object not found for tcuId: %@",  (uint8_t *)&v12,  0x16u);
    }

    id v9 = 0LL;
  }

  return v9;
}

- (id)getTRPIdForTCUId:(id)a3
{
  id v4 = a3;
  cachedTCUList = self->_cachedTCUList;
  if (cachedTCUList
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cachedTCUList, "objectForKey:", v4)),
        v6,
        v6))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedTCUList, "objectForKeyedSubscript:", v4));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastTRPId]);
  }

  else
  {
    id v9 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      int v12 = "-[CSAttSiriTCUCache getTRPIdForTCUId:]";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Cache object not found for tcuId: %@",  (uint8_t *)&v11,  0x16u);
    }

    id v8 = 0LL;
  }

  return v8;
}

- (NSMutableDictionary)cachedTCUList
{
  return self->_cachedTCUList;
}

- (void)setCachedTCUList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end