@interface SAAlarmDelete
- (id)_ad_alarmResponseForResponse:(id)a3;
- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3;
@end

@implementation SAAlarmDelete

- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, id))a3;
  v5 = objc_alloc_init(&OBJC_CLASS___AFDeleteAlarmRequest);
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmDelete alarmIds](self, "alarmIds", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = sub_10022AD80(*(void **)(*((void *)&v15 + 1) + 8LL * (void)v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        if (v13) {
          -[NSMutableArray addObject:](v6, "addObject:", v13);
        }

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v9);
  }

  -[AFDeleteAlarmRequest setAlarmIdentifiers:](v5, "setAlarmIdentifiers:", v6);
  v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[SAAlarmDelete(ADAlarmTransformer) _ad_getAlarmRequestRepresentationWithCompletionHandler:]";
    __int16 v21 = 2112;
    v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Asking to delete alarms with identifiers %@",  buf,  0x16u);
  }

  v4[2](v4, v5);
}

- (id)_ad_alarmResponseForResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AFSiriRequestSucceededResponse);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0) {
    id v6 = objc_alloc_init(&OBJC_CLASS___SAAlarmDeleteCompleted);
  }
  else {
    id v6 = 0LL;
  }
  return v6;
}

@end