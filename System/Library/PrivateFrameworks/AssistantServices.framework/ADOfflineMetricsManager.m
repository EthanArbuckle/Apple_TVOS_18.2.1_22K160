@interface ADOfflineMetricsManager
+ (id)_buildOfflineMetricsMap;
+ (void)_deleteLegacyOfflineMetricsFiles;
- (ADOfflineMetricsManager)init;
- (void)deleteAllMetrics;
- (void)deleteMetricsWithOfflineIdentifier:(id)a3;
- (void)fetchNextMetricsUsingBlock:(id)a3;
- (void)insertMetrics:(id)a3;
@end

@implementation ADOfflineMetricsManager

- (ADOfflineMetricsManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADOfflineMetricsManager;
  v2 = -[ADOfflineMetricsManager init](&v13, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.offline-metrics", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100204C8C;
    block[3] = &unk_1004FD940;
    v12 = v2;
    dispatch_async(v9, block);
  }

  return v2;
}

- (void)insertMetrics:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[ADOfflineMetricsManager insertMetrics:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s metrics = %@", buf, 0x16u);
  }

  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100204C0C;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)deleteMetricsWithOfflineIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[ADOfflineMetricsManager deleteMetricsWithOfflineIdentifier:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s offlineIdentifier = %@", buf, 0x16u);
  }

  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100204C00;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)fetchNextMetricsUsingBlock:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[ADOfflineMetricsManager fetchNextMetricsUsingBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100204B48;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)deleteAllMetrics
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_queue_t v7 = "-[ADOfflineMetricsManager deleteAllMetrics]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100204B3C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

+ (void)_deleteLegacyOfflineMetricsFiles
{
  id v2 = +[ADAudioFileWriter _savedAudioFilesDirectory]_0();
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"SiriOfflineMetrics.plist"]);
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  v25[0] = v5;
  id v6 = +[ADAudioFileWriter _savedAudioFilesDirectory]_0();
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:@"offlineSAMetrics.plist"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
  v25[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", (void)v20));
        unsigned int v18 = [v17 fileExistsAtPath:v16];

        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          [v19 removeItemAtPath:v16 error:0];
        }

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v13);
  }
}

+ (id)_buildOfflineMetricsMap
{
  id v2 = +[ADAudioFileWriter _savedAudioFilesDirectory]_0();
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"SiriMetrics"]);
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);

  id v6 = -[ADOfflineMetricsMap initWithPath:](objc_alloc(&OBJC_CLASS___ADOfflineMetricsMap), "initWithPath:", v5);
  return v6;
}

@end