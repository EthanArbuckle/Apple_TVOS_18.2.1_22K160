@interface FAFollowupPushHandler
- (BOOL)shouldProcess:(id)a3;
- (FAFollowupPushHandler)init;
- (id)removeFamilyInvites:(id)a3;
- (void)process:(id)a3;
@end

@implementation FAFollowupPushHandler

- (FAFollowupPushHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___FAFollowupPushHandler;
  v2 = -[FAFollowupPushHandler init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("family_followup_request", v4);
    networkingQueue = v2->_networkingQueue;
    v2->_networkingQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (BOOL)shouldProcess:(id)a3
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 event]);
  unsigned __int8 v4 = [v3 isEqualToString:@"family_followups"];

  return v4;
}

- (void)process:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _FALogSystem(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
    *(_DWORD *)buf = 138412290;
    v27 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Processing family followup push with user info: %@.",  buf,  0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:AKFollowUpPushPayloadKey]);

  if (v10
    && (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary),
        uint64_t isKindOfClass = objc_opt_isKindOfClass(v10, v13),
        (isKindOfClass & 1) != 0))
  {
    id v14 = [v10 mutableCopy];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FAFollowupPushHandler removeFamilyInvites:](self, "removeFamilyInvites:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
    +[FAFollowupManager synchronizeFollowupWithPayload:altDSID:]( &OBJC_CLASS___FAFollowupManager,  "synchronizeFollowupWithPayload:altDSID:",  v15,  v16);
  }

  else
  {
    uint64_t v17 = _FALogSystem(isKindOfClass, v12);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "No cfudata found. Fetching it directly.",  buf,  2u);
    }

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000088D4;
    v25[3] = &unk_1000415F8;
    v25[4] = self;
    v19 = objc_retainBlock(v25);
    networkingQueue = (dispatch_queue_s *)self->_networkingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100008A44;
    block[3] = &unk_100041620;
    id v23 = v4;
    id v24 = v19;
    v21 = v19;
    dispatch_async(networkingQueue, block);
  }
}

- (id)removeFamilyInvites:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _os_feature_enabled_impl("Family", "BetterPendingInvites");
  if ((v4 & 1) != 0)
  {
    uint64_t v32 = cfuItemsField;
    v33 = v3;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:"));
    id v7 = [v6 mutableCopy];

    uint64_t v10 = _FALogSystem(v8, v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "CFUItems before removing familyInvite %@",  buf,  0xCu);
    }

    id v12 = [v7 count];
    int v14 = (_DWORD)v12 - 1;
    if ((int)v12 >= 1)
    {
      uint64_t v15 = cfuType;
      uint64_t v16 = familyInvite;
      unint64_t v17 = v12 + 1LL;
      do
      {
        uint64_t v18 = _FALogSystem(v12, v13);
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v35) = v14;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Checking CFU Item %d", buf, 8u);
        }

        uint64_t v20 = (v17 - 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v20]);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v15]);
        unsigned int v23 = [v22 isEqualToString:v16];

        if (v23)
        {
          uint64_t v24 = _FALogSystem(v12, v13);
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "CFU Item cfuType matches familyInvite so removing it from the set",  buf,  2u);
          }

          id v12 = [v7 removeObjectAtIndex:v20];
        }

        --v17;
        --v14;
      }

      while (v17 > 1);
    }

    id v3 = v33;
    id v26 = [v33 setObject:v7 forKeyedSubscript:v32];
    uint64_t v28 = _FALogSystem(v26, v27);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "CFUItems after removing family invites %@",  buf,  0xCu);
    }
  }

  else
  {
    uint64_t v30 = _FALogSystem(v4, v5);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "BPI feature flag not enabled in removeFamilyInvites",  buf,  2u);
    }
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end