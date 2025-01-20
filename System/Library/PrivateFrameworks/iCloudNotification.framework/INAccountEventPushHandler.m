@interface INAccountEventPushHandler
- (INAccountEventPushHandler)init;
- (INAccountEventPushHandler)initWithAccountStore:(id)a3;
- (id)_iCloudAccountType;
- (void)_dismissNotificationsForPushEventWithID:(id)a3;
- (void)_handleEventDetailsResponse:(id)a3 forEventID:(id)a4 accountID:(id)a5 pushMessage:(id)a6;
- (void)_requestEventDetailsForPushMessage:(id)a3 withEventID:(id)a4 recipientDSID:(id)a5;
- (void)_sendAcknowledgementForNotification:(id)a3;
- (void)accountNotifier:(id)a3 didActivateNotification:(id)a4;
- (void)accountNotifier:(id)a3 didClearNotification:(id)a4;
- (void)accountNotifier:(id)a3 didDismissNotification:(id)a4;
- (void)handleIncomingPushNotification:(id)a3;
@end

@implementation INAccountEventPushHandler

- (INAccountEventPushHandler)init
{
  return 0LL;
}

- (INAccountEventPushHandler)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___INAccountEventPushHandler;
  v6 = -[INAccountEventPushHandler init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    v8 = -[ANAccountNotifier initWithCallbackMachService:]( objc_alloc(&OBJC_CLASS___ANAccountNotifier),  "initWithCallbackMachService:",  @"com.apple.ind.and_callback");
    accountNotifier = v7->_accountNotifier;
    v7->_accountNotifier = v8;

    -[ANAccountNotifier setDelegate:](v7->_accountNotifier, "setDelegate:", v7);
    v10 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    networkingQueue = v7->_networkingQueue;
    v7->_networkingQueue = v10;
  }

  return v7;
}

- (void)handleIncomingPushNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"dsid"]);

  if (v6)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
    {
      id v11 = v6;
    }

    else
    {
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
      uint64_t isKindOfClass = objc_opt_isKindOfClass(v6, v15);
      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v17 = _INLogSystem(isKindOfClass);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10001717C((uint64_t)v6, v18);
        }

        v14 = 0LL;
        goto LABEL_13;
      }

      id v11 = (id)objc_claimAutoreleasedReturnValue([v6 stringValue]);
    }

    v14 = v11;
LABEL_13:
    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    objc_super v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"msgid"]);

    if (v13)
    {
      uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString, v20);
      uint64_t v22 = objc_opt_isKindOfClass(v13, v21);
      if ((v22 & 1) == 0)
      {
        uint64_t v23 = _INLogSystem(v22);
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_100017118();
        }
      }
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"event"]);

    uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString, v27);
    if ((objc_opt_isKindOfClass(v26, v28) & 1) != 0
      && [v26 isEqualToString:@"dismiss"])
    {
      -[INAccountEventPushHandler _dismissNotificationsForPushEventWithID:]( self,  "_dismissNotificationsForPushEventWithID:",  v13);
    }

    else
    {
      -[INAccountEventPushHandler _requestEventDetailsForPushMessage:withEventID:recipientDSID:]( self,  "_requestEventDetailsForPushMessage:withEventID:recipientDSID:",  v4,  v13,  v14);
    }

    goto LABEL_23;
  }

  uint64_t v12 = _INLogSystem(v7);
  objc_super v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1000170EC();
  }
  v14 = 0LL;
LABEL_23:
}

- (void)_requestEventDetailsForPushMessage:(id)a3 withEventID:(id)a4 recipientDSID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[ACAccountStore aa_appleAccountWithPersonID:]( self->_accountStore,  "aa_appleAccountWithPersonID:",  v10));
  if (v11)
  {
    uint64_t v12 = -[INAccountEventDetailsRequest initWithAccount:pushMessage:]( objc_alloc(&OBJC_CLASS___INAccountEventDetailsRequest),  "initWithAccount:pushMessage:",  v11,  v8);
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[INDaemon sharedInstance](&OBJC_CLASS___INDaemon, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pushToken]);
    -[INAccountEventDetailsRequest setPushToken:](v12, "setPushToken:", v14);

    uint64_t v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472LL;
    uint64_t v23 = sub_10000E1D8;
    v24 = &unk_100025118;
    v25 = self;
    id v26 = v9;
    id v27 = v11;
    id v28 = v8;
    uint64_t v15 = objc_retainBlock(&v21);
    uint64_t v16 = _INLogSystem(v15);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100017278();
    }

    id v18 = objc_alloc(&OBJC_CLASS___AARequester);
    id v19 = objc_msgSend(v18, "initWithRequest:handler:", v12, v15, v21, v22, v23, v24, v25);
    -[NSOperationQueue addOperation:](self->_networkingQueue, "addOperation:", v19);
  }

  else
  {
    uint64_t v20 = _INLogSystem(0LL);
    uint64_t v12 = (INAccountEventDetailsRequest *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_100017214();
    }
  }
}

- (void)_handleEventDetailsResponse:(id)a3 forEventID:(id)a4 accountID:(id)a5 pushMessage:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = _INLogSystem(v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100017350(v10);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);
  if (v16)
  {
    uint64_t v18 = _INLogSystem(v17);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
      sub_1000172D0(v10, (os_log_s *)v19);
    }
  }

  else
  {
    id v20 = [v10 showAlert];
    if ((v20 & 1) != 0)
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v10 title]);
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v10 message]);
      uint64_t v22 = (void *)v21;
      if (v19 | v21)
      {
        id v26 = objc_alloc(&OBJC_CLASS___ANAccountNotification);
        id v27 = (void *)objc_claimAutoreleasedReturnValue(-[INAccountEventPushHandler _iCloudAccountType](self, "_iCloudAccountType"));
        id v24 = [v26 initForAccountWithType:v27];

        [v24 setTitle:v19];
        [v24 setMessage:v22];
        [v24 setEventIdentifier:v11];
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v10 defaultButtonTitle]);
        [v24 setActivateButtonTitle:v28];

        uint64_t v29 = objc_claimAutoreleasedReturnValue([v10 defaultButtonURL]);
        v39 = (void *)v29;
        if (v29)
        {
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[ANNotificationAction actionForOpeningWebURL:]( &OBJC_CLASS___ANNotificationAction,  "actionForOpeningWebURL:",  v29));
          [v24 setActivateAction:v30];
        }

        else
        {
          uint64_t v31 = _INLogSystem(0LL);
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v42 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "No server-supplied default action URL.",  v42,  2u);
          }
        }

        uint64_t v32 = objc_claimAutoreleasedReturnValue([v10 alternateButtonURL]);
        v40 = v22;
        v38 = (void *)v32;
        if (v32)
        {
          v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[ANNotificationAction actionForOpeningWebURL:]( &OBJC_CLASS___ANNotificationAction,  "actionForOpeningWebURL:",  v32));
          [v24 setDismissAction:v33];
        }

        else
        {
          uint64_t v34 = _INLogSystem(0LL);
          v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v41 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "No server-supplied alternate action URL.",  v41,  2u);
          }
        }

        v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v35,  "setObject:forKeyedSubscript:",  v12,  @"INAccountID");
        v36 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
        id v37 = [v36 mutableCopy];

        [v37 removeObjectForKey:@"aps"];
        if (v37) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v35,  "setObject:forKeyedSubscript:",  v37,  @"INPushMessage");
        }
        [v24 setUserInfo:v35];
        -[ANAccountNotifier addNotification:](self->_accountNotifier, "addNotification:", v24);

        uint64_t v22 = v40;
      }

      else
      {
        uint64_t v23 = _INLogSystem(v21);
        id v24 = (id)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR)) {
          sub_1000172A4();
        }
      }
    }

    else
    {
      uint64_t v25 = _INLogSystem(v20);
      uint64_t v19 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "Account event details says not to notify.",  buf,  2u);
      }
    }
  }
}

- (void)_dismissNotificationsForPushEventWithID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _INLogSystem(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Removing notifications for event ID: %@",  (uint8_t *)&v8,  0xCu);
    }

    -[ANAccountNotifier removeNotificationsWithEventIdentifier:]( self->_accountNotifier,  "removeNotificationsWithEventIdentifier:",  v4);
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000173BC();
    }
  }
}

- (void)accountNotifier:(id)a3 didActivateNotification:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _INLogSystem(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }

  -[INAccountEventPushHandler _sendAcknowledgementForNotification:](self, "_sendAcknowledgementForNotification:", v5);
}

- (void)accountNotifier:(id)a3 didClearNotification:(id)a4
{
  id v4 = a4;
  uint64_t v5 = _INLogSystem(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)accountNotifier:(id)a3 didDismissNotification:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _INLogSystem(v5);
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }

  -[INAccountEventPushHandler _sendAcknowledgementForNotification:](self, "_sendAcknowledgementForNotification:", v5);
}

- (void)_sendAcknowledgementForNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"INAccountID"]);

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore accountWithIdentifier:](self->_accountStore, "accountWithIdentifier:", v6));
  if (v7)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"INPushMessage"]);

    if (!v9)
    {
      uint64_t v11 = _INLogSystem(v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100017478();
      }
    }

    id v13 = -[INAcknowledgeAccountAlertRequest initWithAccount:store:]( objc_alloc(&OBJC_CLASS___INAcknowledgeAccountAlertRequest),  "initWithAccount:store:",  v7,  self->_accountStore);
    -[INAcknowledgeAccountAlertRequest setPushMessageInfo:](v13, "setPushMessageInfo:", v9);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[INDaemon sharedInstance](&OBJC_CLASS___INDaemon, "sharedInstance"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pushToken]);
    -[INAcknowledgeAccountAlertRequest setPushToken:](v13, "setPushToken:", v15);

    uint64_t v17 = _INLogSystem(v16);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10001744C();
    }

    id v19 = [[AARequester alloc] initWithRequest:v13 handler:&stru_100025158];
    -[NSOperationQueue addOperation:](self->_networkingQueue, "addOperation:", v19);
  }

  else
  {
    uint64_t v20 = _INLogSystem(0LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000173E8();
    }
  }
}

- (id)_iCloudAccountType
{
  iCloudAccountType = self->_iCloudAccountType;
  if (!iCloudAccountType)
  {
    id v4 = (ACAccountType *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_appleAccountType](self->_accountStore, "aa_appleAccountType"));
    id v5 = self->_iCloudAccountType;
    self->_iCloudAccountType = v4;

    iCloudAccountType = self->_iCloudAccountType;
  }

  return iCloudAccountType;
}

- (void).cxx_destruct
{
}

@end