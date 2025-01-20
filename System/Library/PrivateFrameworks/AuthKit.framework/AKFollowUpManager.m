@interface AKFollowUpManager
- (AKFollowUpControllerServiceProvider)serviceProvider;
- (AKFollowUpManager)initWithFollowUpFactory:(id)a3 provider:(id)a4;
- (BOOL)_synchronizeLocalFollowUpsWithServerPayload:(id)a3 altDSID:(id)a4 error:(id *)a5;
- (id)_alignedInsertionCandidates:(id)a3 withExistingItems:(id)a4;
- (id)pendingFollowUpWithCommand:(unint64_t)a3;
- (id)pendingFollowUpWithMessageId:(id)a3;
- (void)_notifyServerOfTeardownWithContext:(id)a3 completion:(id)a4;
- (void)_processFetchCompletionForAltDSID:(id)a3 items:(id)a4 fetchError:(id)a5 completion:(id)a6;
- (void)_refreshFollowUpsWithIdmsInfo:(id)a3 context:(id)a4 authHandler:(id)a5 completion:(id)a6;
- (void)_refreshFollowUpsWithIdmsInfo:(id)a3 context:(id)a4 completion:(id)a5;
- (void)processPushMessage:(id)a3;
- (void)setServiceProvider:(id)a3;
- (void)synchronizeFollowUpItemsForContext:(id)a3 authHandler:(id)a4 completion:(id)a5;
- (void)tearDownFollowUpsWithItems:(id)a3;
- (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKFollowUpManager

- (AKFollowUpManager)initWithFollowUpFactory:(id)a3 provider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AKFollowUpManager;
  v9 = -[AKFollowUpManager init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_factory, a3);
    objc_storeStrong((id *)&v10->_provider, a4);
    latestPushMessage = v10->_latestPushMessage;
    v10->_latestPushMessage = 0LL;
  }

  return v10;
}

- (void)processPushMessage:(id)a3
{
  id v5 = a3;
  if ([v5 command] == (id)800 || objc_msgSend(v5, "command") == (id)1900)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 altDSID]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 iCloudAccountForAltDSID:v6]);

    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
      if ([v10 isPrimaryiCloudAccount:v8])
      {

LABEL_10:
        objc_storeStrong((id *)&self->_latestPushMessage, a3);
        v15 = objc_opt_new(&OBJC_CLASS___AKAppleIDAuthenticationContext);
        -[AKAppleIDAuthenticationContext setAltDSID:](v15, "setAltDSID:", v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:AKFollowUpPushPayloadKey]);
        -[AKFollowUpManager _refreshFollowUpsWithIdmsInfo:context:completion:]( self,  "_refreshFollowUpsWithIdmsInfo:context:completion:",  v17,  v15,  0LL);

        goto LABEL_11;
      }

      id v13 = [v5 command];

      if (v13 == (id)1900) {
        goto LABEL_10;
      }
      uint64_t v18 = _AKLogSystem(v14);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Suppressing repair push for non-primary account",  v19,  2u);
      }
    }

    else
    {
      uint64_t v11 = _AKLogSystem(v9);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10012AE9C(v5, v12);
      }
    }

LABEL_11:
  }
}

- (void)synchronizeFollowUpItemsForContext:(id)a3 authHandler:(id)a4 completion:(id)a5
{
}

- (void)_refreshFollowUpsWithIdmsInfo:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)_refreshFollowUpsWithIdmsInfo:(id)a3 context:(id)a4 authHandler:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = _AKLogSystem(v13);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v11 altDSID]);
    *(_DWORD *)buf = 138412546;
    v23 = v16;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Refreshing follow ups for %@ with info %@",  buf,  0x16u);
  }

  if (v10)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"items"]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 altDSID]);
    -[AKFollowUpManager _processFetchCompletionForAltDSID:items:fetchError:completion:]( self,  "_processFetchCompletionForAltDSID:items:fetchError:completion:",  v18,  v17,  0LL,  v13);
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[AKFollowUpControllerServiceProvider serviceControllerForContext:]( self->_serviceProvider,  "serviceControllerForContext:",  v11));
    [v17 setAuthenticationDelegate:v12];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10000638C;
    v19[3] = &unk_1001C6568;
    id v21 = v13;
    v19[4] = self;
    id v20 = v11;
    [v17 executeRequestWithCompletion:v19];

    uint64_t v18 = v21;
  }
}

- (void)_processFetchCompletionForAltDSID:(id)a3 items:(id)a4 fetchError:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t, void *))a6;
  if (v12)
  {
    id v14 = v12;
    v15 = v14;
  }

  else
  {
    id v20 = 0LL;
    unsigned __int8 v16 = -[AKFollowUpManager _synchronizeLocalFollowUpsWithServerPayload:altDSID:error:]( self,  "_synchronizeLocalFollowUpsWithServerPayload:altDSID:error:",  v11,  v10,  &v20);
    id v14 = v20;
    v15 = v14;
    if ((v16 & 1) != 0)
    {
      uint64_t v17 = 1LL;
      if (!v13) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }

  uint64_t v18 = _AKLogSystem(v14);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10012AF50();
  }

  uint64_t v17 = 0LL;
  if (v13) {
LABEL_9:
  }
    v13[2](v13, v17, v15);
LABEL_10:
}

- (BOOL)_synchronizeLocalFollowUpsWithServerPayload:(id)a3 altDSID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = _AKLogSystem(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Synchronizing local follow up state", buf, 2u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  latestPushMessage = self->_latestPushMessage;
  if (latestPushMessage)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[AKPushMessage command](latestPushMessage, "command")));
    [v12 setObject:v14 forKeyedSubscript:@"cmd"];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage messageId](self->_latestPushMessage, "messageId"));
    [v12 setObject:v15 forKeyedSubscript:@"txnid"];
  }

  id v16 = -[AKFollowUpProvider pendingFollowUpItems:](self->_provider, "pendingFollowUpItems:", 0LL);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[AKFollowUpItemFactory itemsForAltDSID:pushMessageInfo:fromIDMSPayload:]( self->_factory,  "itemsForAltDSID:pushMessageInfo:fromIDMSPayload:",  v9,  v12,  v8));
  uint64_t v18 = _AKLogSystem(v17);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v73 = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Insertion Candidates: %@", buf, 0xCu);
  }

  unint64_t v20 = -[AKPushMessage command](self->_latestPushMessage, "command");
  uint64_t v21 = objc_claimAutoreleasedReturnValue(-[AKFollowUpManager pendingFollowUpWithCommand:](self, "pendingFollowUpWithCommand:", 800LL));
  v22 = (void *)v21;
  if (v20 != 1900 && v21)
  {
    id v58 = v9;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aaf_map:", &stru_1001C65A8));
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v23));

    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472LL;
    v69[2] = sub_100006B5C;
    v69[3] = &unk_1001C65D0;
    id v57 = v24;
    id v70 = v57;
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "aaf_filter:", v69));
    id v25 = [v59 count];
    if (v25)
    {
      uint64_t v26 = _AKLogSystem(v25);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v73 = v59;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Deleting: %@", buf, 0xCu);
      }

      provider = self->_provider;
      id v68 = 0LL;
      unsigned __int8 v29 = -[AKFollowUpProvider removeFollowUpItems:error:]( provider,  "removeFollowUpItems:error:",  v59,  &v68);
      id v30 = v68;
      v31 = v30;
      if ((v29 & 1) == 0)
      {
        uint64_t v32 = _AKLogSystem(v30);
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_10012AFB4();
        }
      }
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue( -[AKFollowUpItemFactory itemIdentifiersRequiringNotificationClearFromPayload:]( self->_factory,  "itemIdentifiersRequiringNotificationClearFromPayload:",  v8));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v34));

    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    v66[2] = sub_100006BA0;
    v66[3] = &unk_1001C65D0;
    id v36 = v35;
    id v67 = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "aaf_filter:", v66));
    id v38 = [v37 count];
    if (v38)
    {
      v55 = a5;
      id v56 = v8;
      uint64_t v39 = _AKLogSystem(v38);
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v73 = v37;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Clearing Notifications: %@", buf, 0xCu);
      }

      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      id v41 = v37;
      id v42 = [v41 countByEnumeratingWithState:&v62 objects:v71 count:16];
      if (v42)
      {
        id v43 = v42;
        uint64_t v44 = *(void *)v63;
        do
        {
          for (i = 0LL; i != v43; i = (char *)i + 1)
          {
            if (*(void *)v63 != v44) {
              objc_enumerationMutation(v41);
            }
            -[AKFollowUpProvider clearNotificationsForItem:error:]( self->_provider,  "clearNotificationsForItem:error:",  *(void *)(*((void *)&v62 + 1) + 8LL * (void)i),  0LL,  v55,  v56);
          }

          id v43 = [v41 countByEnumeratingWithState:&v62 objects:v71 count:16];
        }

        while (v43);
      }

      a5 = v55;
      id v8 = v56;
    }

    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_100006BE4;
    v60[3] = &unk_1001C65D0;
    id v61 = v36;
    id v46 = v36;
    uint64_t v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "aaf_filter:", v60));

    uint64_t v17 = (void *)v47;
    id v9 = v58;
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue( -[AKFollowUpManager _alignedInsertionCandidates:withExistingItems:]( self,  "_alignedInsertionCandidates:withExistingItems:",  v17,  v22,  v55,  v56));

  v49 = self->_latestPushMessage;
  self->_latestPushMessage = 0LL;

  uint64_t v51 = _AKLogSystem(v50);
  v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v73 = v48;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Inserting: %@", buf, 0xCu);
  }

  unsigned __int8 v53 = -[AKFollowUpProvider addFollowUpItems:error:]( self->_provider,  "addFollowUpItems:error:",  v48,  a5);
  return v53;
}

- (id)_alignedInsertionCandidates:(id)a3 withExistingItems:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100006E64;
  v27[3] = &unk_1001C65F8;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v28 = v9;
  id v10 = v8;
  id v29 = v10;
  [v7 enumerateObjectsUsingBlock:v27];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100006F3C;
  v23[3] = &unk_1001C6620;
  id v11 = v9;
  id v24 = v11;
  id v12 = v10;
  id v25 = v12;
  uint64_t v26 = self;
  [v6 enumerateObjectsUsingBlock:v23];

  uint64_t v14 = _AKLogSystem(v13);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Found incoming sparse followups: %@",  buf,  0xCu);
  }

  uint64_t v17 = _AKLogSystem(v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found incoming full followups: %@", buf, 0xCu);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v11 allValues]);
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v12 allValues]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 arrayByAddingObjectsFromArray:v20]);

  return v21;
}

- (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 itemIdentifier]);
  if (!v8
    || (id v9 = (void *)v8,
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]),
        v10,
        v9,
        !v10))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7044LL));
    v7[2](v7, 0LL, v22);

    goto LABEL_16;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 akAction]);
  unsigned __int8 v12 = [v11 isEqualToString:AKActionDelete];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 akAction]);
  unsigned int v14 = [v13 isEqualToString:AKActionTeardown];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 akAction]);
  unsigned int v16 = [v15 isEqualToString:AKFollowUpActionClear];

  int v18 = 1;
  if ((v12 & 1) == 0 && (v14 & 1) == 0)
  {
    id v17 = [v6 isContinuityPush];
    int v18 = (int)v17;
  }

  if (((v14 | v16) & 1) != 0)
  {
    int v19 = 1;
    if (!v18) {
      goto LABEL_8;
    }
  }

  else
  {
    id v17 = [v6 isContinuityPush];
    int v19 = (int)v17;
    if (!v18)
    {
LABEL_8:
      uint64_t v20 = _AKLogSystem(v17);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10012B0FC();
      }
      goto LABEL_13;
    }
  }

  provider = self->_provider;
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 itemIdentifier]);
  id v25 = v21;
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  -[AKFollowUpProvider removeFollowUpItemsWithIdentifiers:error:]( provider,  "removeFollowUpItemsWithIdentifiers:error:",  v24,  0LL);

LABEL_13:
  if (v19) {
    -[AKFollowUpManager _notifyServerOfTeardownWithContext:completion:]( self,  "_notifyServerOfTeardownWithContext:completion:",  v6,  v7);
  }
  else {
    v7[2](v7, 1LL, 0LL);
  }
LABEL_16:
}

- (void)_notifyServerOfTeardownWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  uint64_t v27 = AKRequestBodyFollowupKey;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 itemIdentifier]);
  uint64_t v26 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  id v28 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  id v10 = [v9 mutableCopy];

  if ([v5 isContinuityPush])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 txnid]);
    [v10 setObject:v11 forKeyedSubscript:@"txnid"];

    [v10 setObject:&off_1001D8C98 forKeyedSubscript:@"cmd"];
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v5 idmsData]);

    if (v12)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 idmsData]);
      [v10 setObject:v13 forKeyedSubscript:AKIdmsDataKey];
    }

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v5 akAction]);
    v15 = @"action";
  }

  else
  {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v5 akAction]);

    if (!v16) {
      goto LABEL_8;
    }
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v5 akAction]);
    v15 = (const __CFString *)AKFollowUpTeardownSource;
  }

  [v10 setObject:v14 forKeyedSubscript:v15];

LABEL_8:
  uint64_t v18 = _AKLogSystem(v17);
  int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Sending tear down payload: %@",  (uint8_t *)&v24,  0xCu);
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDCheckInHelperService sharedService]( &OBJC_CLASS___AKAppleIDCheckInHelperService,  "sharedService"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v5 altDSID]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v21 authKitAccountWithAltDSID:v22 error:0]);
  [v20 ackWithPayload:v10 account:v23 completion:v6];
}

- (id)pendingFollowUpWithMessageId:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKFollowUpProvider pendingFollowUpItems:](self->_provider, "pendingFollowUpItems:", 0LL));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000077B8;
  v13[3] = &unk_1001C65F8;
  id v14 = v4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v15 = v6;
  id v7 = v4;
  uint64_t v8 = _AKLogSystem([v5 enumerateObjectsUsingBlock:v13]);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10012B128();
  }

  id v10 = v15;
  id v11 = v6;

  return v11;
}

- (id)pendingFollowUpWithCommand:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKFollowUpProvider pendingFollowUpItems:](self->_provider, "pendingFollowUpItems:", 0LL));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100007928;
  v9[3] = &unk_1001C6648;
  unint64_t v11 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v10 = v5;
  uint64_t v6 = _AKLogSystem([v4 enumerateObjectsUsingBlock:v9]);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10012B188();
  }

  return v5;
}

- (void)tearDownFollowUpsWithItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Tear down follow up items: %@",  (uint8_t *)&v7,  0xCu);
  }

  -[AKFollowUpProvider removeFollowUpItems:error:](self->_provider, "removeFollowUpItems:error:", v4, 0LL);
}

- (AKFollowUpControllerServiceProvider)serviceProvider
{
  return self->_serviceProvider;
}

- (void)setServiceProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end