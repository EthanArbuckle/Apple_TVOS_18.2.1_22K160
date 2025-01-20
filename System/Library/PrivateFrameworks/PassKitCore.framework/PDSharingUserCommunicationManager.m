@interface PDSharingUserCommunicationManager
- (PDSharingUserCommunicationManager)init;
- (PDSharingUserCommunicationManager)initWithNotificationManager:(id)a3 applicationMessageManager:(id)a4 delegate:(id)a5;
- (PDSharingUserCommunicationManager)initWithNotificationManager:(id)a3 delegate:(id)a4;
- (id)_calculateShareChangeFromOldShares:(id)a3 newShares:(id)a4;
- (id)_groupNotificationForChanges:(id)a3 pass:(id)a4;
- (id)_notificationForShareChange:(id)a3 pass:(id)a4;
- (id)_shareActivationRequiredBodyForPendingActivation:(id)a3;
- (id)_shareActivationRequiredTitleForPendingActivation:(id)a3;
- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4;
- (void)_sendActivationRequiredNotificationsForShareIdentifier:(id)a3;
- (void)applicationMessageSink:(id)a3 removedMessageWithRegistration:(id)a4;
- (void)connectApplicationMessageSink:(id)a3;
- (void)sendEntitlementChangeNotificationsForPass:(id)a3 oldEntitlements:(id)a4 newEntitlements:(id)a5 hasExistingShares:(BOOL)a6;
- (void)sendShareChangeNotificationsForPass:(id)a3 oldShares:(id)a4 newShares:(id)a5;
- (void)updateApplicationMessages;
@end

@implementation PDSharingUserCommunicationManager

- (PDSharingUserCommunicationManager)init
{
  return 0LL;
}

- (PDSharingUserCommunicationManager)initWithNotificationManager:(id)a3 applicationMessageManager:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  v10 = -[PDSharingUserCommunicationManager initWithNotificationManager:delegate:]( self,  "initWithNotificationManager:delegate:",  a3,  a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_applicationMessageManager, a4);
    sub_10030C3AC((uint64_t)v11->_applicationMessageManager, 2LL, v11);
  }

  return v11;
}

- (PDSharingUserCommunicationManager)initWithNotificationManager:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDSharingUserCommunicationManager;
  id v9 = -[PDSharingUserCommunicationManager init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationManager, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    pendingShareActivationShareIdentifiers = v10->_pendingShareActivationShareIdentifiers;
    v10->_pendingShareActivationShareIdentifiers = v11;
  }

  return v10;
}

- (void)connectApplicationMessageSink:(id)a3
{
}

- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "key", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained pendingShareActivationForShareIdentifier:v6]);

  if (v8)
  {
    id v9 = objc_alloc(&OBJC_CLASS___NSURL);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"wallet://%@/%@/%@",  PKURLActionShare,  v6,  PKURLActionShareActivateShare));
    v11 = -[NSURL initWithString:](v9, "initWithString:", v10);

    uint64_t v12 = PKLocalizedShareableCredentialString(@"SHARE_ACTIVATION_APPLICATION_MESSAGE_GROUP_TITLE_SINGULAR");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = PKLocalizedShareableCredentialString(@"SHARE_ACTIVATION_APPLICATION_MESSAGE_GROUP_TITLE_PLURAL");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  @"pendingShares",  v13,  v15);

    id v17 = +[PKImageDescriptorSymbol createForName:withTintColor:]( &OBJC_CLASS___PKImageDescriptorSymbol,  "createForName:withTintColor:",  @"lock.shield",  14LL);
    id v18 = +[PKApplicationMessageIcon createWithImage:style:]( &OBJC_CLASS___PKApplicationMessageIcon,  "createWithImage:style:",  v17,  0LL);

    id v19 = 0LL;
    if ([v8 isWaitingOnUserAction]) {
      id v19 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v11);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingUserCommunicationManager _shareActivationRequiredTitleForPendingActivation:]( self,  "_shareActivationRequiredTitleForPendingActivation:",  v8));
    v21 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingUserCommunicationManager _shareActivationRequiredBodyForPendingActivation:]( self,  "_shareActivationRequiredBodyForPendingActivation:",  v8));
    id v22 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v16,  v19,  v18,  v20,  v21);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(33LL);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "PDSharingUserCommunicationManager: returning no content for %@",  buf,  0xCu);
    }

    id v22 = 0LL;
  }

  return v22;
}

- (void)applicationMessageSink:(id)a3 removedMessageWithRegistration:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "key", a3));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 identifier]);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userDidDismissPendingShareActivationForShareIdentifier:v7];
}

- (void)updateApplicationMessages
{
  if (self->_applicationMessageSink)
  {
    id v3 = PDDefaultQueue();
    v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100278700;
    block[3] = &unk_100639300;
    block[4] = self;
    dispatch_async(v4, block);
  }

- (void)sendShareChangeNotificationsForPass:(id)a3 oldShares:(id)a4 newShares:(id)a5
{
  id v8 = a3;
  if ((unint64_t)a4 | (unint64_t)a5)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingUserCommunicationManager _calculateShareChangeFromOldShares:newShares:]( self,  "_calculateShareChangeFromOldShares:newShares:",  a4,  a5));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pk_groupDictionaryByApplyingBlock:", &stru_1006510E0));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100278CB4;
    v26[3] = &unk_10063E250;
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v27 = v11;
    v28 = self;
    id v29 = v8;
    uint64_t v12 = objc_retainBlock(v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_100690530]);
    ((void (*)(void *, void *))v12[2])(v12, v13);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_100690548]);
    ((void (*)(void *, void *))v12[2])(v12, v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_100690560]);
    ((void (*)(void *, void *))v12[2])(v12, v15);

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_100690578]);
    ((void (*)(void *, void *))v12[2])(v12, v16);

    if (-[NSMutableArray count](v11, "count"))
    {
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      id v17 = v11;
      id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v23;
        do
        {
          v21 = 0LL;
          do
          {
            if (*(void *)v23 != v20) {
              objc_enumerationMutation(v17);
            }
            -[PDUserNotificationManager insertUserNotification:]( self->_notificationManager,  "insertUserNotification:",  *(void *)(*((void *)&v22 + 1) + 8LL * (void)v21),  (void)v22);
            v21 = (char *)v21 + 1;
          }

          while (v19 != v21);
          id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
        }

        while (v19);
      }
    }
  }
}

- (void)sendEntitlementChangeNotificationsForPass:(id)a3 oldEntitlements:(id)a4 newEntitlements:(id)a5 hasExistingShares:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  uint64_t v12 = (uint64_t)a5;
  v13 = (void *)v12;
  if (v11 | v12)
  {
    uint64_t v37 = 0LL;
    v38 = &v37;
    uint64_t v39 = 0x2020000000LL;
    char v40 = 0;
    uint64_t v33 = 0LL;
    v34 = &v33;
    uint64_t v35 = 0x2020000000LL;
    char v36 = 0;
    uint64_t v14 = sub_10027906C(v12, (void *)v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = sub_10027906C((uint64_t)v15, v13);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = [v15 count];
    if (v18 != [v17 count]) {
      goto LABEL_4;
    }
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1002791A8;
    v32[3] = &unk_100651108;
    v32[4] = v15;
    v32[5] = &v37;
    v32[6] = &v33;
    [v17 enumerateKeysAndObjectsUsingBlock:v32];
    if ([v15 count]) {
LABEL_4:
    }
      *((_BYTE *)v38 + 24) = 1;

    if (*((_BYTE *)v38 + 24))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
      uint64_t v20 = PKLocalizedShareableCredentialString( @"SHARE_NOTIFICATION_ENTITLEMENT_UPDATE_TITLE",  @"%@",  v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

      uint64_t v22 = PKLocalizedShareableCredentialString(@"SHARE_NOTIFICATION_ENTITLEMENT_UPDATE_MESSAGE");
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      __int128 v24 = objc_alloc(&OBJC_CLASS___PDEntitlementUpdateUserNotification);
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
      v26 = -[PDEntitlementUpdateUserNotification initWithTitle:message:forPassUniqueIdentifier:]( v24,  "initWithTitle:message:forPassUniqueIdentifier:",  v21,  v23,  v25);

      -[PDUserNotificationManager insertUserNotification:](self->_notificationManager, "insertUserNotification:", v26);
      if (*((_BYTE *)v34 + 24) && v6 && [v10 isCarKeyPass])
      {
        v27 = objc_alloc_init(&OBJC_CLASS___PKPaymentMessage);
        -[PKPaymentMessage setIdentifier:]( v27,  "setIdentifier:",  @"PDSharingUserCommunicationManager.CapabilityChange");
        -[PKPaymentMessage setServiceIdentifier:]( v27,  "setServiceIdentifier:",  @"PDSharingUserCommunicationManager");
        -[PKPaymentMessage setMessageType:](v27, "setMessageType:", 0LL);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        -[PKPaymentMessage setMessageDate:](v27, "setMessageDate:", v28);

        uint64_t v29 = PKLocalizedShareableCredentialString(@"SHARE_NOTIFICATION_ENTITLEMENT_CAPABILITY_UPDATE_MESSAGE");
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        -[PKPaymentMessage setContent:](v27, "setContent:", v30);

        -[PKPaymentMessage setArchived:](v27, "setArchived:", 0LL);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained insertPassMessage:v27 pass:v10];
      }
    }

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v37, 8);
  }
}

- (id)_notificationForShareChange:(id)a3 pass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 updatedShare]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 oldShare]);
  id v9 = (void *)v8;
  if (v7 | v8)
  {
    id v10 = [(id)v8 status];
    id v11 = [(id)v7 status];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 sender]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([(id)v7 recipientNickname]);
    uint64_t v14 = v13;
    if (v13) {
      id v15 = v13;
    }
    else {
      id v15 = (id)objc_claimAutoreleasedReturnValue([v9 recipientNickname]);
    }
    id v17 = v15;

    if (v9)
    {
      if (v7)
      {
        if (v10 == v11)
        {
          if (v10 != (id)1) {
            goto LABEL_20;
          }
          id v18 = [v5 type];
          id v19 = @"SHARE_NOTIFICATION_SHARE_ENTITLEMENT_UPDATE_MESSAGE";
          if (v18 != (id)1)
          {
            if (v18 == (id)2)
            {
              v46 = v12;
              v47 = v17;
              char CanAllowResharing = PKSharingCapabilityShareabilityCanAllowResharing([v9 mostRestrictiveShareability]);
              int v21 = PKSharingCapabilityShareabilityCanAllowResharing([(id)v7 mostRestrictiveShareability]);
              if ((CanAllowResharing & 1) != 0 || !v21)
              {
                unsigned int v24 = [v9 mostRestrictiveIntraAccountSharingEnabled];
                BOOL v22 = 0;
              }

              else
              {
                BOOL v22 = 0;
                id v19 = @"SHARE_NOTIFICATION_SHARE_ENTITLEMENT_UPDATE_CAN_SHARE_MESSAGE";
              }

              goto LABEL_28;
            }

- (id)_groupNotificationForChanges:(id)a3 pass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 updatedShare]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
        id v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }

        else
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 oldShare]);
          id v17 = (id)objc_claimAutoreleasedReturnValue([v18 identifier]);
        }

        -[NSMutableArray safelyAddObject:](v7, "safelyAddObject:", v17);
      }

      id v10 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }

    while (v10);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  unint64_t v20 = (unint64_t)[v19 type];

  if (v20 > 3) {
    int v21 = 0LL;
  }
  else {
    int v21 = off_100651208[v20];
  }
  uint64_t v22 = PKLocalizationKeyForPassType(@"SHARE_NOTIFICATION_BULK_CHANGE_TITLE", v6);
  BOOL v23 = (NSString *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v24 = PKLocalizationKeyForPassType(v21, v6);
  __int128 v25 = (NSString *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = objc_alloc(&OBJC_CLASS___PDShareUpdateUserNotification);
  uint64_t v27 = PKLocalizedShareableCredentialString(v23);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  uint64_t v29 = PKLocalizedShareableCredentialString(v25, @"%lu", [v8 count]);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  uint64_t v32 = -[PDShareUpdateUserNotification initWithTitle:message:forPassUniqueIdentifier:shareIdentifiers:]( v26,  "initWithTitle:message:forPassUniqueIdentifier:shareIdentifiers:",  v28,  v30,  v31,  v7);

  return v32;
}

- (void)_sendActivationRequiredNotificationsForShareIdentifier:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained pendingShareActivationForShareIdentifier:v9]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingUserCommunicationManager _shareActivationRequiredTitleForPendingActivation:]( self,  "_shareActivationRequiredTitleForPendingActivation:",  v5));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingUserCommunicationManager _shareActivationRequiredBodyForPendingActivation:]( self,  "_shareActivationRequiredBodyForPendingActivation:",  v5));
    id v8 = -[PDShareActivationRequiredUserNotification initWithTitle:message:shareIdentifier:]( objc_alloc(&OBJC_CLASS___PDShareActivationRequiredUserNotification),  "initWithTitle:message:shareIdentifier:",  v6,  v7,  v9);
    -[PDUserNotification setSuppressionBehavior:](v8, "setSuppressionBehavior:", 1LL);
    -[PDUserNotificationManager insertUserNotification:](self->_notificationManager, "insertUserNotification:", v8);
  }
}

- (id)_shareActivationRequiredTitleForPendingActivation:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 originalInvitation]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayInformation]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);

  uint64_t v6 = PKLocalizedShareableCredentialString( @"SHARE_ACTIVATION_APPLICATION_MESSAGE_TITLE",  @"%@",  v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)_shareActivationRequiredBodyForPendingActivation:(id)a3
{
  else {
    id v3 = @"SHARE_ACTIVATION_APPLICATION_MESSAGE_DESCRIPTION_PENDING_KEY";
  }
  uint64_t v4 = PKLocalizedShareableCredentialString(&v3->isa);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)_calculateShareChangeFromOldShares:(id)a3 newShares:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "pk_indexDictionaryByApplyingBlock:", &stru_100651128));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pk_indexDictionaryByApplyingBlock:", &stru_100651148));

  id v8 = [v7 mutableCopy];
  id v9 = [v6 mutableCopy];
  [v9 addEntriesFromDictionary:v8];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100279C80;
  v31[3] = &unk_100651170;
  id v32 = v8;
  id v10 = v8;
  uint64_t v11 = objc_retainBlock(v31);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100279DC8;
  v29[3] = &unk_100651198;
  id v30 = v9;
  id v12 = v9;
  v13 = objc_retainBlock(v29);
  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100279E98;
  v25[3] = &unk_1006511C0;
  id v27 = v11;
  id v15 = v13;
  id v28 = v15;
  id v16 = v14;
  uint64_t v26 = v16;
  id v17 = v11;
  [v6 enumerateKeysAndObjectsUsingBlock:v25];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100279FA4;
  v22[3] = &unk_1006511E8;
  BOOL v23 = v16;
  id v24 = v15;
  id v18 = v16;
  id v19 = v15;
  [v10 enumerateKeysAndObjectsUsingBlock:v22];
  id v20 = -[NSMutableArray copy](v18, "copy");

  return v20;
}

- (void).cxx_destruct
{
}

@end