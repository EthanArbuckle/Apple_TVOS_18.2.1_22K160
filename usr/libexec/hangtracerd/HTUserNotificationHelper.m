@interface HTUserNotificationHelper
+ (id)sharedHelperWithCategories:(id)a3;
- (NSMutableDictionary)responseHandlers;
- (OS_dispatch_queue)notificationQueue;
- (UNUserNotificationCenter)notificationCenter;
- (void)associatePrefix:(id)a3 withHandler:(id)a4;
- (void)setNotificationCenter:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setResponseHandlers:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation HTUserNotificationHelper

+ (id)sharedHelperWithCategories:(id)a3
{
  id v3 = a3;
  v4 = v3;
  v5 = (void *)qword_10005BD28;
  if (qword_10005BD28)
  {
    if (v3)
    {
      id v6 = sub_1000233A4();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "+[HTUserNotificationHelper sharedHelperWithCategories:]";
        v8 = "%s Shared HTUserNotificationHelper was provided with notification categories, but singleton is already instantiated.";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
        goto LABEL_13;
      }

      goto LABEL_13;
    }
  }

  else
  {
    if (!v3)
    {
      id v10 = sub_1000233A4();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "+[HTUserNotificationHelper sharedHelperWithCategories:]";
        v8 = "%s Trying to create shared HTUserNotificationHelper but no notification categories provided";
        goto LABEL_12;
      }

- (void)associatePrefix:(id)a3 withHandler:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    id v8 = objc_retainBlock(a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HTUserNotificationHelper responseHandlers](self, "responseHandlers"));
    [v7 setObject:v8 forKeyedSubscript:v6];
  }

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  v30 = self;
  v31 = (void (**)(void))a5;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HTUserNotificationHelper responseHandlers](self, "responseHandlers"));
  id v9 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v33;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v33 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 notification]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 request]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
      unsigned __int8 v17 = [v16 hasPrefix:v13];

      if ((v17 & 1) != 0) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HTUserNotificationHelper responseHandlers](v30, "responseHandlers"));
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v13]);

    if (!v19) {
      goto LABEL_14;
    }
    id v20 = sub_1000233A4();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v7 notification]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 request]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v7 actionIdentifier]);
      *(_DWORD *)buf = 138412546;
      v37 = v24;
      __int16 v38 = 2112;
      v39 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "ResponseHandler invoked, request %@, action %@",  buf,  0x16u);
    }

    (*((void (**)(os_log_s *, id))v19 + 2))(v19, v7);
  }

  else
  {
LABEL_9:

LABEL_14:
    id v26 = sub_1000233A4();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v7 notification]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 request]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 identifier]);
      *(_DWORD *)buf = 138412290;
      v37 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Request identifier %@ using default handler",  buf,  0xCu);
    }
  }

  if (v31) {
    v31[2](v31);
  }
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (NSMutableDictionary)responseHandlers
{
  return self->_responseHandlers;
}

- (void)setResponseHandlers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end