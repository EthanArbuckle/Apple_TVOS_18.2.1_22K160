@interface CSDConversationNoticeManager
- (CSDConversationNoticeDelegate)delegate;
- (CSDConversationNoticeManager)initWithDelegate:(id)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
- (id)fetchUpcomingNoticeFromQueue;
- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4;
- (void)conversation:(id)a3 receivedActivitySessionEvent:(id)a4;
- (void)removeConversationNoticeWithUUID:(id)a3;
@end

@implementation CSDConversationNoticeManager

- (CSDConversationNoticeManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSDConversationNoticeManager;
  v8 = -[CSDConversationNoticeManager init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    objc_storeWeak((id *)&v9->_delegate, v6);
  }

  return v9;
}

- (void)conversation:(id)a3 receivedActivitySessionEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationNoticeManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 session]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 activity]);
  unsigned int v11 = [v10 isSystemActivity];

  if (v11)
  {
    id v12 = sub_1001704C4();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 sessionUUID]);
      *(_DWORD *)buf = 138412290;
      v69 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Ignoring event for session %@, since the activity is a system group activity",  buf,  0xCu);
    }
  }

  else
  {
    id v15 = objc_alloc(&OBJC_CLASS___TUConversationNotice);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v13 = (os_log_s *)[v15 initWithUUID:v16];

    id v17 = sub_1001704C4();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 description]);
      *(_DWORD *)buf = 138412290;
      v69 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Received TUConversationActivityEvent: %@",  buf,  0xCu);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionUUID]);
    -[os_log_s setSessionUUID:](v13, "setSessionUUID:", v20);

    id v21 = [v7 type];
    switch((unint64_t)v21)
    {
      case 1uLL:
        v22 = v13;
        uint64_t v23 = 1LL;
        goto LABEL_26;
      case 2uLL:
        v22 = v13;
        uint64_t v23 = 2LL;
        goto LABEL_26;
      case 3uLL:
        v22 = v13;
        uint64_t v23 = 3LL;
        goto LABEL_26;
      case 4uLL:
        v24 = v13;
        uint64_t v25 = 4LL;
        goto LABEL_24;
      case 5uLL:
        v22 = v13;
        uint64_t v23 = 5LL;
        goto LABEL_26;
      case 6uLL:
        v22 = v13;
        uint64_t v23 = 6LL;
        goto LABEL_26;
      case 7uLL:
        v24 = v13;
        uint64_t v25 = 7LL;
        goto LABEL_24;
      case 8uLL:
        v22 = v13;
        uint64_t v23 = 8LL;
        goto LABEL_26;
      case 9uLL:
        goto LABEL_27;
      case 0xAuLL:
        -[os_log_s setSessionEventType:](v13, "setSessionEventType:", 10LL);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v7 item]);
        -[os_log_s setItem:](v13, "setItem:", v26);

        id v27 = [v7 queueItemType];
        if (v27 == (id)2)
        {
          v28 = v13;
          uint64_t v29 = 2LL;
        }

        else if (v27 == (id)1)
        {
          v28 = v13;
          uint64_t v29 = 1LL;
        }

        else
        {
          if (v27) {
            goto LABEL_27;
          }
          v28 = v13;
          uint64_t v29 = 0LL;
        }

        -[os_log_s setQueueItemType:](v28, "setQueueItemType:", v29);
LABEL_27:
        v63 = v6;
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tuActivitySessions", self));
        id v32 = [v31 countByEnumeratingWithState:&v64 objects:v72 count:16];
        if (!v32) {
          goto LABEL_37;
        }
        id v33 = v32;
        uint64_t v34 = *(void *)v65;
        break;
      case 0xBuLL:
        v22 = v13;
        uint64_t v23 = 11LL;
        goto LABEL_26;
      case 0xCuLL:
        v22 = v13;
        uint64_t v23 = 12LL;
        goto LABEL_26;
      case 0xDuLL:
        v24 = v13;
        uint64_t v25 = 13LL;
        goto LABEL_24;
      case 0xEuLL:
        v22 = v13;
        uint64_t v23 = 14LL;
LABEL_26:
        -[os_log_s setSessionEventType:](v22, "setSessionEventType:", v23);
        goto LABEL_27;
      default:
        if (v21 == (id)99)
        {
          v24 = v13;
          uint64_t v25 = 99LL;
LABEL_24:
          -[os_log_s setSessionEventType:](v24, "setSessionEventType:", v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue([v7 item]);
          -[os_log_s setItem:](v13, "setItem:", v30);
        }

        goto LABEL_27;
    }

    while (2)
    {
      for (i = 0LL; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v65 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)i);
        v37 = (void *)objc_claimAutoreleasedReturnValue([v36 UUID]);
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s sessionUUID](v13, "sessionUUID"));
        unsigned int v39 = [v37 isEqual:v38];

        if (v39)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue([v36 activity]);
          v41 = (void *)objc_claimAutoreleasedReturnValue([v40 bundleIdentifier]);
          -[os_log_s setBundleIdentifier:](v13, "setBundleIdentifier:", v41);

          goto LABEL_37;
        }
      }

      id v33 = [v31 countByEnumeratingWithState:&v64 objects:v72 count:16];
      if (v33) {
        continue;
      }
      break;
    }

- (id)fetchUpcomingNoticeFromQueue
{
  id v2 = sub_1001704C4();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching notices is a no-op", v5, 2u);
  }

  return 0LL;
}

- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationNoticeManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Activating conversation notice with URL: %@ and bundleID %@",  (uint8_t *)&v13,  0x16u);
  }

  if (!v6 || !v7)
  {
    id v11 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Error activating conversation notice. Could not find action url %@ or bundleID %@",  (uint8_t *)&v13,  0x16u);
    }
  }
}

- (void)removeConversationNoticeWithUUID:(id)a3
{
  id v3 = sub_1001704C4();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Removing conversation notice is a no-op",  v5,  2u);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDConversationNoticeDelegate)delegate
{
  return (CSDConversationNoticeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

@end