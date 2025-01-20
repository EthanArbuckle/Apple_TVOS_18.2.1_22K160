@interface AXCleanupSiriVoiceSubscriptionsSimpleTask
- (void)run:(id)a3;
@end

@implementation AXCleanupSiriVoiceSubscriptionsSimpleTask

- (void)run:(id)a3
{
  id v3 = a3;
  uint64_t v4 = AXLogAssetDaemon(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXCleanupSiriSubsTask: Task did begin", buf, 2u);
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___SiriTTSDaemonSession);
  *(void *)buf = 0LL;
  v17 = buf;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_10000F8A8;
  v20 = sub_10000F8B8;
  id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v7 = AXLogAssetDaemon(v21);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "AXCleanupSiriSubsTask: Asking SiriTTSDaemonSession for auto-downloaded voices",  v15,  2u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000F8C0;
  v11[3] = &unk_100020BC8;
  v14 = buf;
  id v9 = v6;
  id v12 = v9;
  id v10 = v3;
  id v13 = v10;
  [v9 subscribedVoicesWithReply:v11];

  _Block_object_dispose(buf, 8);
}

@end