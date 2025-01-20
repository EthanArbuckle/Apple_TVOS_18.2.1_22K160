@interface CSDConversationManagerXPCServer
- (BOOL)_shouldSend:(id)a3;
- (CSDClientManager)clientManager;
- (CSDConversationManager)conversationManager;
- (CSDConversationManagerXPCServer)initWithConversationManager:(id)a3 featureFlags:(id)a4;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (id)_conversationsByGroupUUIDFilteredForClient:(id)a3;
- (id)_filter:(id)a3 withClient:(id)a4;
- (int)clientsShouldConnectToken;
- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4;
- (void)activateLink:(id)a3 completionHandler:(id)a4;
- (void)activatedConversationLinks:(id)a3;
- (void)activityAuthorizedBundleIdentifierState:(id)a3;
- (void)addInvitedMemberHandles:(id)a3 toConversationLink:(id)a4 completionHandler:(id)a5;
- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversationWithUUID:(id)a5;
- (void)addScreenSharingType:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)approvePendingMember:(id)a3 forConversationUUID:(id)a4;
- (void)buzzMember:(id)a3 conversationUUID:(id)a4;
- (void)cancelOrDenyScreenShareRequest:(id)a3 forConversationUUID:(id)a4;
- (void)checkLinkValidity:(id)a3 completionHandler:(id)a4;
- (void)conversationManager:(id)a3 activatedConversationLinksChanged:(id)a4;
- (void)conversationManager:(id)a3 activityAuthorizationChangedForBundleIdentifier:(id)a4;
- (void)conversationManager:(id)a3 conversation:(id)a4 addedMembersLocally:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 appLaunchState:(unint64_t)a5 forActivitySession:(id)a6;
- (void)conversationManager:(id)a3 conversation:(id)a4 buzzedMember:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 didChangeSceneAssociationForActivitySession:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 didChangeStateForActivitySession:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 mediaPrioritiesDidChangeForParticipant:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 participant:(id)a5 addedNotice:(id)a6;
- (void)conversationManager:(id)a3 conversation:(id)a4 participant:(id)a5 didReact:(id)a6;
- (void)conversationManager:(id)a3 conversation:(id)a4 participantDidStopReacting:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 receivedActivitySessionEvent:(id)a5;
- (void)conversationManager:(id)a3 conversationChanged:(id)a4;
- (void)conversationManager:(id)a3 conversationScreenSharingChanged:(id)a4 forParticipant:(id)a5;
- (void)conversationManager:(id)a3 conversationUpdateMessagesGroupPhoto:(id)a4;
- (void)conversationManager:(id)a3 remoteScreenShareAttributesChanged:(id)a4 isLocallySharing:(BOOL)a5;
- (void)conversationManager:(id)a3 remoteScreenShareEndedWithReason:(id)a4;
- (void)conversationManager:(id)a3 removedConversationWithUUID:(id)a4;
- (void)conversationManager:(id)a3 screenSharingAvailableChanged:(BOOL)a4;
- (void)conversationManager:(id)a3 sharePlayAvailableChanged:(BOOL)a4;
- (void)conversationManager:(id)a3 trackedPendingMember:(id)a4 forConversationLink:(id)a5;
- (void)conversationManager:(id)a3 updateIncomingPendingConversationsByGroupUUID:(id)a4;
- (void)conversationsByGroupUUID:(id)a3;
- (void)createActivitySession:(id)a3 onConversationWithUUID:(id)a4;
- (void)dealloc;
- (void)endActivitySession:(id)a3 onConversationWithUUID:(id)a4;
- (void)fetchUpcomingNoticeWithCompletionHandler:(id)a3;
- (void)generateLinkForConversationUUID:(id)a3 completionHandler:(id)a4;
- (void)generateLinkWithInvitedMemberHandles:(id)a3 linkLifetimeScope:(int64_t)a4 completionHandler:(id)a5;
- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4;
- (void)getInactiveLinkWithCompletionHandler:(id)a3;
- (void)getLatestRemoteScreenShareAttributesWithCompletionHandler:(id)a3;
- (void)getMessagesGroupDetailsForConversationUUID:(id)a3 completionHandler:(id)a4;
- (void)getScreenSharingAvailableWithCompletionHandler:(id)a3;
- (void)getSharePlayAvailableWithCompletionHandler:(id)a3;
- (void)incomingPendingConversationsByGroupUUID:(id)a3;
- (void)invalidate;
- (void)invalidateLink:(id)a3 deleteReason:(int64_t)a4 completionHandler:(id)a5;
- (void)joinConversationWithRequest:(id)a3;
- (void)kickMember:(id)a3 conversationUUID:(id)a4;
- (void)launchApplicationForActivitySessionUUID:(id)a3 authorizedExternally:(BOOL)a4 forceBackground:(BOOL)a5 completionHandler:(id)a6;
- (void)leaveActivitySession:(id)a3 onConversationWithUUID:(id)a4;
- (void)leaveConversationWithUUID:(id)a3;
- (void)linkSyncStateIncludeLinks:(BOOL)a3 WithCompletion:(id)a4;
- (void)notifyClientsOfConversationsByGroupUUIDUpdate;
- (void)notifyClientsOfMediaPrioritiesChangedForConversation:(id)a3;
- (void)notifyClientsToConnectIfNecessary;
- (void)prepareConversationWithUUID:(id)a3 withHandoffContext:(id)a4;
- (void)presentDismissalAlertForActivitySessionWithUUID:(id)a3 onConversationWithUUID:(id)a4;
- (void)pseudonymsByCallUUID:(id)a3;
- (void)refreshActiveConversations;
- (void)registerClient:(id)a3;
- (void)registerMessagesGroupUUIDForConversationUUID:(id)a3;
- (void)rejectPendingMember:(id)a3 forConversationUUID:(id)a4;
- (void)removeConversationNoticeWithUUID:(id)a3;
- (void)renewLink:(id)a3 expirationDate:(id)a4 reason:(unint64_t)a5 completionHandler:(id)a6;
- (void)requestParticipantToShareScreen:(id)a3 forConversationUUID:(id)a4;
- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3;
- (void)setActivityAuthorization:(BOOL)a3 forBundleIdentifier:(id)a4;
- (void)setAutoSharePlayEnabled:(BOOL)a3;
- (void)setClientsShouldConnectToken:(int)a3;
- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsInConversationWithUUID:(id)a4;
- (void)setGridDisplayMode:(unint64_t)a3 forConversationWithUUID:(id)a4;
- (void)setIgnoreLetMeInRequests:(BOOL)a3 forConversationUUID:(id)a4;
- (void)setLinkName:(id)a3 forConversationLink:(id)a4 completionHandler:(id)a5;
- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)setScreenEnabled:(BOOL)a3 withScreenShareAttributes:(id)a4 forConversationWithUUID:(id)a5;
- (void)setSharePlayHandedOff:(BOOL)a3 onConversationWithUUID:(id)a4;
- (void)setSupportsMessagesGroupProviding:(BOOL)a3;
- (void)setUsingAirplay:(BOOL)a3 onActivitySession:(id)a4 onConversationWithUUID:(id)a5;
- (void)unregisterClient:(id)a3;
- (void)updateConversationWithUUID:(id)a3 participantPresentationContexts:(id)a4;
- (void)updateLocalParticipantToAVLessWithPresentationMode:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)updateMessagesGroupName:(id)a3 onConversationWithUUID:(id)a4;
- (void)updateMessagesGroupPhotoOnConversationWithUUID:(id)a3;
@end

@implementation CSDConversationManagerXPCServer

- (CSDConversationManagerXPCServer)initWithConversationManager:(id)a3 featureFlags:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CSDConversationManagerXPCServer;
  v9 = -[CSDConversationManagerXPCServer init](&v22, "init");
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.conversationmanagerxpcserver", 0LL);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_conversationManager, a3);
    objc_storeStrong((id *)&v9->_featureFlags, a4);
    -[CSDConversationManager addDelegate:queue:](v9->_conversationManager, "addDelegate:queue:", v9, v9->_queue);
    v12 = -[CSDClientManager initWithSerialQueue:]( objc_alloc(&OBJC_CLASS___CSDClientManager),  "initWithSerialQueue:",  v9->_queue);
    clientManager = v9->_clientManager;
    v9->_clientManager = v12;

    v14 = (dispatch_queue_s *)v9->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013C32C;
    block[3] = &unk_1003D7730;
    v15 = v9;
    v21 = v15;
    dispatch_sync(v14, block);
    v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](v15, "queue"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10013C6C8;
    v18[3] = &unk_1003D7730;
    v19 = v15;
    dispatch_async(v16, v18);
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDConversationManagerXPCServer;
  -[CSDConversationManagerXPCServer dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013C7E0;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)notifyClientsToConnectIfNecessary
{
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 conversationsByUUID]);
  id v6 = [v5 count];

  int clientsShouldConnectToken = self->_clientsShouldConnectToken;
  if (v6)
  {
    notify_set_state(clientsShouldConnectToken, 1uLL);
    notify_post("CSDConversationManagerClientsShouldConnectNotification");
  }

  else
  {
    notify_set_state(clientsShouldConnectToken, 0LL);
  }

- (BOOL)_shouldSend:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  if ([v6 isRemote])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
    unsigned __int8 v8 = [v7 isDefaultProvider];

    if ((v8 & 1) != 0
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer featureFlags](self, "featureFlags")),
          unsigned int v10 = [v9 groupFacetimeAsAServiceEnabled],
          v9,
          !v10))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      if (![v12 isGreenTea])
      {
        unsigned __int8 v15 = 1;
        goto LABEL_11;
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteMembers]);
      unsigned __int8 v15 = (unint64_t)[v13 count] < 2;
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 providerIdentifiersForClient:v6]);

      if (![v12 count])
      {
        unsigned __int8 v15 = 0;
        goto LABEL_11;
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
      unsigned __int8 v15 = [v12 containsObject:v14];
    }

LABEL_11:
    goto LABEL_12;
  }

  unsigned __int8 v15 = 1;
LABEL_12:

  return v15;
}

- (id)_conversationsByGroupUUIDFilteredForClient:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 conversationsByGroupUUID]);
  if (v4)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer _filter:withClient:](self, "_filter:withClient:", v7, v4));

    id v7 = (void *)v8;
  }

  return v7;
}

- (id)_filter:(id)a3 withClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 isRemote])
  {
    id v26 = v5;
    goto LABEL_19;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
  id v28 = v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 providerIdentifiersForClient:v6]);

  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v29 = v5;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
  id v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v11) {
    goto LABEL_17;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v31;
  do
  {
    for (i = 0LL; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(v10);
      }
      unsigned __int8 v15 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 provider]);
      unsigned int v17 = [v16 isDefaultProvider];

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
        if (([v18 isGreenTea] & 1) == 0)
        {

LABEL_14:
          id v24 = [v15 copy];
          v25 = (void *)objc_claimAutoreleasedReturnValue([v15 groupUUID]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v24, v25);

          continue;
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue([v15 remoteMembers]);
        id v20 = [v19 count];
      }

      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue([v15 provider]);
        objc_super v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
        unsigned int v23 = [v8 containsObject:v22];

        if (v23) {
          goto LABEL_14;
        }
      }
    }

    id v12 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
  }

  while (v12);
LABEL_17:

  id v26 = -[NSMutableDictionary copy](v9, "copy");
  id v6 = v28;
  id v5 = v29;
LABEL_19:

  return v26;
}

- (void)conversationsByGroupUUID:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 currentClient]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManagerXPCServer _conversationsByGroupUUIDFilteredForClient:]( self,  "_conversationsByGroupUUIDFilteredForClient:",  v8));
  v4[2](v4, v7);
}

- (void)incomingPendingConversationsByGroupUUID:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 incomingPendingConversationsByGroupUUID]);
  v4[2](v4, v6);
}

- (void)pseudonymsByCallUUID:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 pseudonymsByCallUUID]);
  v4[2](v4, v6);
}

- (void)activityAuthorizedBundleIdentifierState:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 activityAuthorizedBundleIdentifierState]);
  v4[2](v4, v6);
}

- (void)activatedConversationLinks:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  id v11 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activatedConversationLinksWithError:&v11]);
  id v8 = v11;

  if (v8)
  {
    id v9 = sub_1001704C4();
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1002B7700((uint64_t)v8, v10);
    }
  }

  else
  {
    v4[2](v4, v7);
  }
}

- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversationWithUUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v12 addRemoteMembers:v10 otherInvitedHandles:v9 toConversationWithUUID:v8];
}

- (void)createActivitySession:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentClient]);

  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10013D25C;
  v16[3] = &unk_1003DA2A0;
  v16[4] = &v17;
  sub_1001544C8( v10,  @"override-activity-verification",  v16,  0LL,  (uint64_t)"-[CSDConversationManagerXPCServer createActivitySession:onConversationWithUUID:]");
  if (!*((_BYTE *)v18 + 24)
    || (id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]), v11, !v11))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 processBundleIdentifier]);
    [v6 setBundleIdentifier:v12];
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
    [v14 createActivitySession:v6 onConversationWithUUID:v7 withCompletion:&stru_1003DAF00];
  }

  else
  {
    id v15 = sub_1001704C4();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      sub_1002B7774((os_log_t)v14);
    }
  }

  _Block_object_dispose(&v17, 8);
}

- (void)leaveActivitySession:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v9 leaveActivitySession:v7 onConversationWithUUID:v6];
}

- (void)endActivitySession:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v9 endActivitySession:v7 onConversationWithUUID:v6];
}

- (void)setUsingAirplay:(BOOL)a3 onActivitySession:(id)a4 onConversationWithUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentClient]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10013D46C;
  v14[3] = &unk_1003D8FE0;
  BOOL v17 = a3;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  sub_1001544C8( v11,  @"modify-activity-session-airplay",  v14,  0LL,  (uint64_t)"-[CSDConversationManagerXPCServer setUsingAirplay:onActivitySession:onConversationWithUUID:]");
}

- (void)presentDismissalAlertForActivitySessionWithUUID:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v9 presentDismissalAlertForActivitySessionWithUUID:v7 onConversationWithUUID:v6];
}

- (void)setActivityAuthorization:(BOOL)a3 forBundleIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v8 setActivityAuthorization:v4 forBundleID:v6];
}

- (void)setAutoSharePlayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v6 setAutoSharePlayEnabled:v3];
}

- (void)launchApplicationForActivitySessionUUID:(id)a3 authorizedExternally:(BOOL)a4 forceBackground:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v12);

  if (v8)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentClient]);

    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000LL;
    char v21 = 0;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10013D76C;
    v17[3] = &unk_1003DA2A0;
    v17[4] = &v18;
    sub_1001544C8( v14,  @"supports-external-shareplay-authorization",  v17,  0LL,  (uint64_t)"-[CSDConversationManagerXPCServer launchApplicationForActivitySessionUUID:authorizedExternally:forceBackg round:completionHandler:]");
    BOOL v15 = *((_BYTE *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }

  else
  {
    BOOL v15 = 0LL;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v16 launchApplicationForActivitySessionUUID:v10 authorizedExternally:v15 forceBackground:v7 completionHandler:v11];
}

- (void)joinConversationWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v6 joinConversationWithRequest:v4];
}

- (void)leaveConversationWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v6 leaveConversationWithUUID:v4];
}

- (void)buzzMember:(id)a3 conversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v9 buzzMember:v7 conversationUUID:v6];
}

- (void)kickMember:(id)a3 conversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v9 kickMember:v7 conversationUUID:v6];
}

- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsInConversationWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v8 setDownlinkMuted:v4 forRemoteParticipantsOnConversationWithUUID:v6];
}

- (void)addScreenSharingType:(unint64_t)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v8 addScreenSharingType:a3 forConversationUUID:v6];
}

- (void)getLatestRemoteScreenShareAttributesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v6 getLatestRemoteScreenShareAttributesWithCompletionHandler:v4];
}

- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v8 getActiveLinksWithCreatedOnly:v4 completionHandler:v6];
}

- (void)generateLinkForConversationUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v9 generateLinkForConversationUUID:v7 completionHandler:v6];
}

- (void)generateLinkWithInvitedMemberHandles:(id)a3 linkLifetimeScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v11 generateLinkWithInvitedMemberHandles:v9 linkLifetimeScope:a4 completionHandler:v8];
}

- (void)addInvitedMemberHandles:(id)a3 toConversationLink:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v12 addInvitedMemberHandles:v10 toConversationLink:v9 completionHandler:v8];
}

- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v9 activateConversationNoticeWithActionURL:v7 bundleIdentifier:v6];
}

- (void)removeConversationNoticeWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v6 removeConversationNoticeWithUUID:v4];
}

- (void)refreshActiveConversations
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v4 refreshActiveParticipantsList];
}

- (void)getSharePlayAvailableWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  v4[2](v4, [v6 isSharePlayAvailable]);
}

- (void)getScreenSharingAvailableWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  v4[2](v4, [v6 isScreenSharingAvailable]);
}

- (void)fetchUpcomingNoticeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v6 fetchUpcomingNoticeWithCompletionHandler:v4];
}

- (void)invalidateLink:(id)a3 deleteReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v11 invalidateLink:v9 deleteReason:a4 completionHandler:v8];
}

- (void)renewLink:(id)a3 expirationDate:(id)a4 reason:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v13 renewLink:v12 expirationDate:v11 reason:a5 completionHandler:v10];
}

- (void)checkLinkValidity:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v9 checkLinkValidity:v7 completionHandler:v6];
}

- (void)getInactiveLinkWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v6 getInactiveLinkWithCompletionHandler:v4];
}

- (void)activateLink:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v9 activateLink:v7 completionHandler:v6];
}

- (void)setLinkName:(id)a3 forConversationLink:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v12 setLinkName:v10 forConversationLink:v9 completionHandler:v8];
}

- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v6 scheduleConversationLinkCheckInInitial:v3];
}

- (void)linkSyncStateIncludeLinks:(BOOL)a3 WithCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v8 linkSyncStateIncludeLinks:v4 WithCompletion:v6];
}

- (void)approvePendingMember:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v9 approvePendingMember:v7 forConversationUUID:v6];
}

- (void)rejectPendingMember:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v9 rejectPendingMember:v7 forConversationUUID:v6];
}

- (void)setIgnoreLetMeInRequests:(BOOL)a3 forConversationUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v8 setIgnoreLetMeInRequests:v4 forConversationUUID:v6];
}

- (void)updateConversationWithUUID:(id)a3 participantPresentationContexts:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v9 updateParticipantPresentationContexts:v6 onConversationWithUUID:v7];
}

- (void)setGridDisplayMode:(unint64_t)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v8 setGridDisplayMode:a3 forConversationWithUUID:v6];
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10013E65C;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10013E734;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v7 setLocalParticipantAudioVideoMode:a3 forConversationUUID:v6];
}

- (void)updateLocalParticipantToAVLessWithPresentationMode:(unint64_t)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v7 updateLocalParticipantToAVLessWithPresentationMode:a3 forConversationUUID:v6];
}

- (void)registerMessagesGroupUUIDForConversationUUID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v5 registerMessagesGroupUUIDForConversationUUID:v4];
}

- (void)setSupportsMessagesGroupProviding:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 currentClient]);

  [v5 setSupportsMessagesGroupProviding:v3];
}

- (void)getMessagesGroupDetailsForConversationUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 conversationsByUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);

  if (!v10)
  {
    id v16 = sub_1001704C4();
    BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find conversation with conversationUUID %@",  buf,  0xCu);
    }

    goto LABEL_9;
  }

  if (!-[CSDConversationManagerXPCServer _shouldSend:](self, "_shouldSend:", v10))
  {
LABEL_9:
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0LL, 0LL, 0LL);
    goto LABEL_18;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 messagesGroupUUID]);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 clientsPassingTest:&stru_1003DAF20]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

    if (v14)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_10013EC60;
      v26[3] = &unk_1003DAF48;
      id v27 = v11;
      id v28 = v7;
      [v14 performBlock:v26];

      BOOL v15 = v27;
    }

    else
    {
      id v22 = sub_1001704C4();
      unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[WARN] No Messages group provider was registered",  buf,  2u);
      }

      uint64_t v24 = TUConversationManagerMessagesErrorDomain;
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      __int128 v30 = @"No messages group details provider available";
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v24,  1LL,  v25));

      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v15);
    }
  }

  else
  {
    id v18 = sub_1001704C4();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[WARN] Conversation with conversationUUID %@ is not associated with a Messages group",  buf,  0xCu);
    }

    uint64_t v20 = TUConversationManagerMessagesErrorDomain;
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    __int128 v32 = @"Conversation is not associated with a Messages group";
    char v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  2LL,  v21));

    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v14);
  }

LABEL_18:
}

- (void)updateMessagesGroupName:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v9 updateMessagesGroupName:v7 onConversationWithUUID:v6];
}

- (void)updateMessagesGroupPhotoOnConversationWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v6 updateMessagesGroupPhotoOnConversationWithUUID:v4];
}

- (void)requestParticipantToShareScreen:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v9 requestParticipantToShareScreen:v7 forConversationUUID:v6];
}

- (void)cancelOrDenyScreenShareRequest:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v8 cancelOrDenyScreenShareRequest:v7 forConversationUUID:v6];
}

- (void)setScreenEnabled:(BOOL)a3 withScreenShareAttributes:(id)a4 forConversationWithUUID:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v11 setScreenEnabled:v6 screenShareAttributes:v9 forConversationWithUUID:v8];
}

- (void)prepareConversationWithUUID:(id)a3 withHandoffContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v9 prepareConversationWithUUID:v7 withHandoffContext:v6];
}

- (void)setSharePlayHandedOff:(BOOL)a3 onConversationWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer conversationManager](self, "conversationManager"));
  [v8 setSharePlayHandedOff:v4 onConversationWithUUID:v6];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 addedMembersLocally:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  -[CSDConversationManagerXPCServer notifyClientsToConnectIfNecessary](self, "notifyClientsToConnectIfNecessary");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10013F0C0;
  v15[3] = &unk_1003DAF70;
  id v16 = v7;
  id v17 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = NSStringFromSelector("conversation:addedMembersLocally:");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v10 performBlockOnClients:v15 coalescedByIdentifier:v14];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 buzzedMember:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  -[CSDConversationManagerXPCServer notifyClientsToConnectIfNecessary](self, "notifyClientsToConnectIfNecessary");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10013F1C8;
  v15[3] = &unk_1003DAF70;
  id v16 = v7;
  id v17 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = NSStringFromSelector("conversation:buzzedMember:");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v10 performBlockOnClients:v15 coalescedByIdentifier:v14];
}

- (void)conversationManager:(id)a3 conversationUpdateMessagesGroupPhoto:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  -[CSDConversationManagerXPCServer notifyClientsToConnectIfNecessary](self, "notifyClientsToConnectIfNecessary");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10013F2B0;
  v11[3] = &unk_1003DAF98;
  id v12 = v5;
  id v8 = v5;
  id v9 = NSStringFromSelector("conversationUpdatedMessagesGroupPhoto:");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v7 performBlockOnClients:v11 coalescedByIdentifier:v10];
}

- (void)conversationManager:(id)a3 updateIncomingPendingConversationsByGroupUUID:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  -[CSDConversationManagerXPCServer notifyClientsToConnectIfNecessary](self, "notifyClientsToConnectIfNecessary");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10013F398;
  v11[3] = &unk_1003DAF98;
  id v12 = v5;
  id v8 = v5;
  id v9 = NSStringFromSelector("updateIncomingPendingConversationsByGroupUUID:");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v7 performBlockOnClients:v11 coalescedByIdentifier:v10];
}

- (void)conversationManager:(id)a3 activatedConversationLinksChanged:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  -[CSDConversationManagerXPCServer notifyClientsToConnectIfNecessary](self, "notifyClientsToConnectIfNecessary");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10013F480;
  v11[3] = &unk_1003DAF98;
  id v12 = v5;
  id v8 = v5;
  id v9 = NSStringFromSelector("updateActivatedConversationLinks:");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v7 performBlockOnClients:v11 coalescedByIdentifier:v10];
}

- (void)conversationManager:(id)a3 conversationChanged:(id)a4
{
}

- (void)conversationManager:(id)a3 removedConversationWithUUID:(id)a4
{
}

- (void)notifyClientsOfConversationsByGroupUUIDUpdate
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[CSDConversationManagerXPCServer notifyClientsToConnectIfNecessary](self, "notifyClientsToConnectIfNecessary");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10013F544;
  v7[3] = &unk_1003DAF98;
  v7[4] = self;
  id v5 = NSStringFromSelector("updateConversationsByGroupUUID:");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 performBlockOnClients:v7 coalescedByIdentifier:v6];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 mediaPrioritiesDidChangeForParticipant:(id)a5
{
}

- (void)notifyClientsOfMediaPrioritiesChangedForConversation:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10013F698;
  v10[3] = &unk_1003DAF98;
  id v11 = v4;
  id v7 = v4;
  id v8 = NSStringFromSelector("mediaPrioritiesChangedForConversation:");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v6 filterClientsUsingPredicate:&stru_1003DAFB8 andPerformBlock:v10 coalescedByIdentifier:v9];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 participant:(id)a5 didReact:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10013F7E0;
  v19[3] = &unk_1003DB000;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  id v17 = NSStringFromSelector("conversation:participant:didReact:");
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v13 filterClientsUsingPredicate:&stru_1003DAFD8 andPerformBlock:v19 coalescedByIdentifier:v18];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 participantDidStopReacting:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10013F900;
  v15[3] = &unk_1003DAF70;
  id v16 = v7;
  id v17 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = NSStringFromSelector("conversation:participantDidStopReacting:");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v10 filterClientsUsingPredicate:&stru_1003DB020 andPerformBlock:v15 coalescedByIdentifier:v14];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 participant:(id)a5 addedNotice:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  -[CSDConversationManagerXPCServer notifyClientsToConnectIfNecessary](self, "notifyClientsToConnectIfNecessary");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10013FA1C;
  v18[3] = &unk_1003DB000;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = NSStringFromSelector("conversationManager:conversation:participant:addedNotice:");
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v12 performBlockOnClients:v18 coalescedByIdentifier:v17];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 receivedActivitySessionEvent:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  -[CSDConversationManagerXPCServer notifyClientsToConnectIfNecessary](self, "notifyClientsToConnectIfNecessary");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10013FB10;
  v14[3] = &unk_1003DAF70;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = NSStringFromSelector("conversationManager:conversation:receivedActivitySessionEvent:");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v9 performBlockOnClients:v14 coalescedByIdentifier:v13];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 appLaunchState:(unint64_t)a5 forActivitySession:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  -[CSDConversationManagerXPCServer notifyClientsToConnectIfNecessary](self, "notifyClientsToConnectIfNecessary");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10013FBE8;
  v14[3] = &unk_1003DB048;
  id v16 = v10;
  unint64_t v17 = a5;
  id v15 = v9;
  id v12 = v10;
  id v13 = v9;
  [v11 performBlockOnClients:v14];
}

- (void)conversationManager:(id)a3 activityAuthorizationChangedForBundleIdentifier:(id)a4
{
  id v5 = a3;
  -[CSDConversationManagerXPCServer notifyClientsToConnectIfNecessary](self, "notifyClientsToConnectIfNecessary");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10013FCBC;
  v10[3] = &unk_1003DAF98;
  id v11 = v5;
  id v7 = v5;
  id v8 = NSStringFromSelector("updateActivityAuthorizedBundleIdentifierState:");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v6 performBlockOnClients:v10 coalescedByIdentifier:v9];
}

- (void)conversationManager:(id)a3 trackedPendingMember:(id)a4 forConversationLink:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  -[CSDConversationManagerXPCServer notifyClientsToConnectIfNecessary](self, "notifyClientsToConnectIfNecessary");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10013FDEC;
  v14[3] = &unk_1003DAF70;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = NSStringFromSelector("receivedTrackedPendingMember:forConversationLink:");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v9 performBlockOnClients:v14 coalescedByIdentifier:v13];
}

- (void)conversationManager:(id)a3 conversationScreenSharingChanged:(id)a4 forParticipant:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10013FEB4;
  v12[3] = &unk_1003DAF70;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 performBlockOnClients:v12];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 didChangeStateForActivitySession:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10013FF9C;
  v14[3] = &unk_1003DAF70;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = NSStringFromSelector("conversation:didChangeStateForActivitySession:");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v9 performBlockOnClients:v14 coalescedByIdentifier:v13];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 didChangeSceneAssociationForActivitySession:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100140064;
  v12[3] = &unk_1003DAF70;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 performBlockOnClients:v12];
}

- (void)conversationManager:(id)a3 remoteScreenShareAttributesChanged:(id)a4 isLocallySharing:(BOOL)a5
{
  id v7 = a4;
  -[CSDConversationManagerXPCServer notifyClientsToConnectIfNecessary](self, "notifyClientsToConnectIfNecessary");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10014013C;
  v12[3] = &unk_1003DB070;
  id v13 = v7;
  BOOL v14 = a5;
  id v9 = v7;
  id v10 = NSStringFromSelector("remoteScreenShareAttributesChanged:isLocallySharing:");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v8 performBlockOnClients:v12 coalescedByIdentifier:v11];
}

- (void)conversationManager:(id)a3 remoteScreenShareEndedWithReason:(id)a4
{
  id v5 = a4;
  -[CSDConversationManagerXPCServer notifyClientsToConnectIfNecessary](self, "notifyClientsToConnectIfNecessary");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100140210;
  v10[3] = &unk_1003DAF98;
  id v11 = v5;
  id v7 = v5;
  id v8 = NSStringFromSelector("remoteScreenShareEndedWithReason:");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v6 performBlockOnClients:v10 coalescedByIdentifier:v9];
}

- (void)conversationManager:(id)a3 sharePlayAvailableChanged:(BOOL)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager", a3));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001402AC;
  v8[3] = &unk_1003DB090;
  BOOL v9 = a4;
  id v6 = NSStringFromSelector("sharePlayAvailableChanged:");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 performBlockOnClients:v8 coalescedByIdentifier:v7];
}

- (void)conversationManager:(id)a3 screenSharingAvailableChanged:(BOOL)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManagerXPCServer clientManager](self, "clientManager", a3));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100140348;
  v8[3] = &unk_1003DB090;
  BOOL v9 = a4;
  id v6 = NSStringFromSelector("screenSharingAvailableChanged:");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 performBlockOnClients:v8 coalescedByIdentifier:v7];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

- (int)clientsShouldConnectToken
{
  return self->_clientsShouldConnectToken;
}

- (void)setClientsShouldConnectToken:(int)a3
{
  self->_int clientsShouldConnectToken = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
}

@end