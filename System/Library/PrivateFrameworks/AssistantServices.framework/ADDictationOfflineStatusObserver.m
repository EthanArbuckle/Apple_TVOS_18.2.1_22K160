@interface ADDictationOfflineStatusObserver
+ (id)_offlineDictationStatusStringToDictionary:(id)a3;
+ (id)sharedDictationOfflineStatusObserver;
- (ADDictationOfflineStatusObserver)init;
- (NSDictionary)offlineDictationStatus;
- (void)_updateOfflineDictationStatus:(id)a3 error:(id)a4;
- (void)fetchOfflineDictationStatusIgnoringCache:(BOOL)a3 asynchronously:(BOOL)a4;
- (void)setOfflineDictationStatus:(id)a3;
@end

@implementation ADDictationOfflineStatusObserver

- (ADDictationOfflineStatusObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ADDictationOfflineStatusObserver;
  v2 = -[ADDictationOfflineStatusObserver init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("ADDictationOfflineStatusObserver", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (void)_updateOfflineDictationStatus:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (v7)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "-[ADDictationOfflineStatusObserver _updateOfflineDictationStatus:error:]";
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Error getting offline dictation status. Error: %@",  (uint8_t *)&v14,  0x16u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kAssetQueryResultKey]);
    unsigned int v11 = [v10 isEqualToNumber:&off_1005131E0];

    if (v11)
    {
      -[ADDictationOfflineStatusObserver setOfflineDictationStatus:]( self,  "setOfflineDictationStatus:",  &__NSDictionary0__struct);
      v12 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315138;
        v15 = "-[ADDictationOfflineStatusObserver _updateOfflineDictationStatus:error:]";
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Resetting offline dictation status prefs",  (uint8_t *)&v14,  0xCu);
      }
    }
  }

  else
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      v15 = "-[ADDictationOfflineStatusObserver _updateOfflineDictationStatus:error:]";
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Received offline dictation status %@",  (uint8_t *)&v14,  0x16u);
    }

    id v13 = [(id)objc_opt_class(self) _offlineDictationStatusStringToDictionary:v6];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[ADDictationOfflineStatusObserver setOfflineDictationStatus:](self, "setOfflineDictationStatus:", v9);
  }
}

- (void)fetchOfflineDictationStatusIgnoringCache:(BOOL)a3 asynchronously:(BOOL)a4
{
  BOOL v4 = a4;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100085450;
  v11[3] = &unk_1004FAF58;
  objc_copyWeak(&v12, &location);
  id v6 = objc_retainBlock(v11);
  id v7 = v6;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000854E0;
    block[3] = &unk_1004FC838;
    v10 = v6;
    dispatch_async(queue, block);
  }

  else
  {
    ((void (*)(void *))v6[2])(v6);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (NSDictionary)offlineDictationStatus
{
  dispatch_queue_t v3 = self->_offlineDictationStatus;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100577B40);
  if (!v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    dispatch_queue_t v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue([v4 offlineDictationStatus]);
  }

  return v3;
}

- (void)setOfflineDictationStatus:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100577B40);
  objc_storeStrong((id *)&self->_offlineDictationStatus, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100577B40);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 offlineDictationStatus]);

  if (([v7 isEqualToDictionary:v5] & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    [v8 setOfflineDictationStatus:v5];

    v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      unsigned int v11 = "-[ADDictationOfflineStatusObserver setOfflineDictationStatus:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Prefs updated with new offline dictation status",  (uint8_t *)&v10,  0xCu);
    }
  }
}

- (void).cxx_destruct
{
}

+ (id)sharedDictationOfflineStatusObserver
{
  if (qword_100577B38 != -1) {
    dispatch_once(&qword_100577B38, &stru_1004EF550);
  }
  return (id)qword_100577B30;
}

+ (id)_offlineDictationStatusStringToDictionary:(id)a3
{
  id v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000855D8;
  v7[3] = &unk_1004FBB00;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v4));
  return v5;
}

@end