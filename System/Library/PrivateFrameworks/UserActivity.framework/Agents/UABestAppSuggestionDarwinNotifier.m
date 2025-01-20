@interface UABestAppSuggestionDarwinNotifier
- (NSMutableDictionary)possibleItems;
- (NSUUID)lastUUID;
- (id)bestCornerItemsFromItems:(id)a3;
- (void)setItems:(id)a3;
- (void)setLastUUID:(id)a3;
- (void)setPossibleItems:(id)a3;
@end

@implementation UABestAppSuggestionDarwinNotifier

- (void)setItems:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionDarwinNotifier bestCornerItemsFromItems:](self, "bestCornerItemsFromItems:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 uuid]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionDarwinNotifier lastUUID](self, "lastUUID"));
  if ([v7 isEqual:v6])
  {
  }

  else
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionDarwinNotifier lastUUID](self, "lastUUID"));
    uint64_t v9 = v8 | v6;

    if (v9)
    {
      os_log_t v10 = sub_100039584(0LL);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionDarwinNotifier lastUUID](self, "lastUUID"));
        int v13 = 138412546;
        v14 = v12;
        __int16 v15 = 2112;
        uint64_t v16 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "NOTIFY BEST CHANGE: %@ -> %@",  (uint8_t *)&v13,  0x16u);
      }

      -[UABestAppSuggestionDarwinNotifier setLastUUID:](self, "setLastUUID:", v6);
      notify_post(_UABestAppSuggestionChangedNotification);
    }
  }
}

- (id)bestCornerItemsFromItems:(id)a3
{
  id v3 = a3;
  p_cache = &OBJC_METACLASS___UAActivityReplayReceiver.cache;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v5 cornerActionItemTimeout];
  double v7 = v6;

  if (v7 <= 0.0) {
    uint64_t v8 = 0LL;
  }
  else {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -v7));
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v3;
  id v9 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v36;
    *(void *)&__int128 v10 = 138544131LL;
    __int128 v32 = v10;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        if (sub_10005C3C4((uint64_t)objc_msgSend(v14, "type", v32)) && v8 != 0)
        {
          uint64_t v16 = objc_claimAutoreleasedReturnValue([v14 when]);
          if (v16)
          {
            v17 = (void *)v16;
            v18 = p_cache;
            v19 = (void *)objc_claimAutoreleasedReturnValue([v14 when]);
            BOOL v20 = sub_10005B958(v19, v8);

            p_cache = v18;
            if (v20)
            {
              os_log_t v21 = sub_100039584(0LL);
              v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
                v24 = (void *)objc_claimAutoreleasedReturnValue([v23 UUIDString]);
                v25 = (void *)objc_claimAutoreleasedReturnValue([v14 when]);
                *(_DWORD *)buf = v32;
                v40 = v24;
                __int16 v41 = 2113;
                v42 = v14;
                __int16 v43 = 2114;
                v44 = v25;
                __int16 v45 = 2114;
                v46 = v8;
                _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "BESTAPP: Ignoring item %{public}@/%{private}@ %{public}@, because it is earlier than %{public}@",  buf,  0x2Au);

                p_cache = v18;
              }

- (NSMutableDictionary)possibleItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPossibleItems:(id)a3
{
}

- (NSUUID)lastUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setLastUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end