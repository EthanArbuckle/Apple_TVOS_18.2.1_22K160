@interface PDSharingManager
- (BOOL)hasActiveExternallySharedPasses;
- (BOOL)hasShareableEntitlementsForPassIdentifier:(id)a3;
- (BOOL)hasSharesForPassIdentifier:(id)a3;
- (PDSharingChannelManager)channelManager;
- (PDSharingManager)init;
- (PDSharingManager)initWithWebServiceCoordinator:(id)a3 databaseManager:(id)a4 notificationManager:(id)a5 pushNotificationManager:(id)a6 cardFileManager:(id)a7 subcredentialManager:(id)a8 applicationMessageManager:(id)a9 remoteInterfacePresenter:(id)a10 idsSharingService:(id)a11 cloudStoreDelegate:(id)a12 delegate:(id)a13;
- (id)entitlementsForPassIdentifier:(id)a3;
- (id)pendingShareActivationForShareIdentifier:(id)a3;
- (id)pendingShareActivations;
- (void)acceptCarKeyShareForMessage:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)cacheSharingMessageFromMailboxAddress:(id)a3 message:(id)a4;
- (void)channelWasRemotelyTerminatedWithTransportIdentifier:(id)a3;
- (void)checkInvitationStatusForMailboxAddress:(id)a3 completion:(id)a4;
- (void)createShareForPartialShareInvitation:(id)a3 authorization:(id)a4 completion:(id)a5;
- (void)createShareInvitationForPartialShareInvitation:(id)a3 existingTransportIdentifier:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)createSingleUseShareURLWithMessage:(id)a3 timeToLive:(unint64_t)a4 completion:(id)a5;
- (void)deleteSharingMessage:(id)a3;
- (void)didReceiveActivationCodeFailureForCredentialIdentifier:(id)a3 attemptsRemaining:(unint64_t)a4 completion:(id)a5;
- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4;
- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4;
- (void)finishedStatefulProvisioningAttemptWithSuccess:(BOOL)a3 operation:(id)a4 share:(id)a5;
- (void)handleOutstandingShareMessage:(id)a3 transportIdentifier:(id)a4;
- (void)insertPassMessage:(id)a3 pass:(id)a4;
- (void)passAdded:(id)a3;
- (void)passUpdated:(id)a3 oldPass:(id)a4 oldShares:(id)a5 oldEntitlements:(id)a6;
- (void)passUpdated:(id)a3 oldShares:(id)a4;
- (void)passWillBeRemoved:(id)a3;
- (void)pendingCredentialsBeingProvisioned:(id)a3;
- (void)pendingShareActivationForShareIdentifier:(id)a3 completion:(id)a4;
- (void)prewarmCreateShareForPassIdentifier:(id)a3 completion:(id)a4;
- (void)processCLICommands:(id)a3 completion:(id)a4;
- (void)provisioningOperationsDidUpdate;
- (void)rejectShareForMailboxAddress:(id)a3;
- (void)relinquishInvitation:(id)a3 completion:(id)a4;
- (void)retrieveShareInvitationForMailboxAddress:(id)a3 completion:(id)a4;
- (void)revokePendingCredentialsForReaderIdentifier:(id)a3 completion:(id)a4;
- (void)revokeShareForPassIdentifier:(id)a3 share:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
- (void)revokeSharesForPassIdentifier:(id)a3 shares:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
- (void)sendSharingMessageTo:(id)a3 message:(id)a4 completion:(id)a5;
- (void)sharesForPassIdentifier:(id)a3 completion:(id)a4;
- (void)start;
- (void)updateShareForPassIdentifier:(id)a3 share:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)userDidDismissPendingShareActivationForShareIdentifier:(id)a3;
- (void)userNotificationActionPerformed:(unint64_t)a3 notificationIdentifier:(id)a4;
@end

@implementation PDSharingManager

- (PDSharingManager)init
{
  return 0LL;
}

- (PDSharingManager)initWithWebServiceCoordinator:(id)a3 databaseManager:(id)a4 notificationManager:(id)a5 pushNotificationManager:(id)a6 cardFileManager:(id)a7 subcredentialManager:(id)a8 applicationMessageManager:(id)a9 remoteInterfacePresenter:(id)a10 idsSharingService:(id)a11 cloudStoreDelegate:(id)a12 delegate:(id)a13
{
  id v52 = a3;
  id obj = a4;
  id v51 = a4;
  id v53 = a5;
  id v45 = a6;
  id v50 = a6;
  id v54 = a7;
  id v49 = a8;
  id v19 = a9;
  id v48 = a10;
  v20 = v19;
  id v21 = a11;
  id v47 = a12;
  id v22 = a13;
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___PDSharingManager;
  v23 = -[PDSharingManager init](&v55, "init");
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_webServiceCoordinator, a3);
    objc_storeStrong((id *)&v24->_databaseManager, obj);
    objc_storeStrong((id *)&v24->_userNotificationManager, a5);
    objc_storeStrong((id *)&v24->_pushNotificationManager, v45);
    objc_storeStrong((id *)&v24->_subcredentialManager, a8);
    objc_storeStrong((id *)&v24->_remoteInterfacePresenter, a10);
    objc_storeStrong((id *)&v24->_cloudStoreDelegate, a12);
    objc_storeWeak((id *)&v24->_delegate, v22);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.passd.sharingmanager", 0LL);
    queue = v24->_queue;
    v24->_queue = (OS_dispatch_queue *)v25;

    dispatch_queue_t v27 = dispatch_queue_create("com.apple.passd.sharingmanager", 0LL);
    replyQueue = v24->_replyQueue;
    v24->_replyQueue = (OS_dispatch_queue *)v27;

    v29 = -[PDCarKeySharingManagementService initWithWebServiceCoordinator:cardFileManager:cloudStoreDelegate:delegate:]( objc_alloc(&OBJC_CLASS___PDCarKeySharingManagementService),  "initWithWebServiceCoordinator:cardFileManager:cloudStoreDelegate:delegate:",  v24->_webServiceCoordinator,  v54,  v24->_cloudStoreDelegate,  v24);
    carKeyManagementService = v24->_carKeyManagementService;
    v24->_carKeyManagementService = v29;

    v31 = -[PDGeneralSharingManagementService initWithWebServiceCoordinator:]( objc_alloc(&OBJC_CLASS___PDGeneralSharingManagementService),  "initWithWebServiceCoordinator:",  v24->_webServiceCoordinator);
    sharingManagementService = v24->_sharingManagementService;
    v24->_sharingManagementService = v31;

    v33 = objc_alloc_init(&OBJC_CLASS___PDHomeShareManagementService);
    homeManagementService = v24->_homeManagementService;
    v24->_homeManagementService = v33;

    v35 = -[PDSharingChannelManager initWithWebServiceCoordinator:databaseManager:pushNotificationManager:idsSharingService:]( objc_alloc(&OBJC_CLASS___PDSharingChannelManager),  "initWithWebServiceCoordinator:databaseManager:pushNotificationManager:idsSharingService:",  v24->_webServiceCoordinator,  v24->_databaseManager,  v24->_pushNotificationManager,  v21);
    channelManager = v24->_channelManager;
    v24->_channelManager = v35;

    -[PDSharingChannelManager addDelegate:](v24->_channelManager, "addDelegate:", v24);
    v37 = -[PDSharingStatefulProvisioningManager initWithQueue:replyQueue:databaseManager:delegate:]( objc_alloc(&OBJC_CLASS___PDSharingStatefulProvisioningManager),  "initWithQueue:replyQueue:databaseManager:delegate:",  v24->_queue,  v24->_replyQueue,  v24->_databaseManager,  v24);
    statefulProvisioningManager = v24->_statefulProvisioningManager;
    v24->_statefulProvisioningManager = v37;

    v39 = -[PDSharingUserCommunicationManager initWithNotificationManager:applicationMessageManager:delegate:]( objc_alloc(&OBJC_CLASS___PDSharingUserCommunicationManager),  "initWithNotificationManager:applicationMessageManager:delegate:",  v53,  v20,  v24);
    userCommunicationManager = v24->_userCommunicationManager;
    v24->_userCommunicationManager = v39;

    v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    continuityManagers = v24->_continuityManagers;
    v24->_continuityManagers = v41;

    -[PDUserNotificationManager removeUserNotificationsOfType:]( v24->_userNotificationManager,  "removeUserNotificationsOfType:",  79LL);
  }

  return v24;
}

- (void)start
{
}

- (void)checkInvitationStatusForMailboxAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C23F4;
    block[3] = &unk_100639AF0;
    id v12 = v6;
    v13 = self;
    id v14 = v7;
    dispatch_async((dispatch_queue_t)queue, block);
  }

  else
  {
    uint64_t v9 = PDBasicError(@"Missing mailboxAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v10);
  }
}

- (void)retrieveShareInvitationForMailboxAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C2574;
    block[3] = &unk_100639AF0;
    id v12 = v6;
    v13 = self;
    id v14 = v7;
    dispatch_async((dispatch_queue_t)queue, block);
  }

  else
  {
    uint64_t v9 = PDBasicError(@"Missing mailboxIdentifier or encryptionKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v10);
  }
}

- (void)relinquishInvitation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C3034;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)deleteSharingMessage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000C3310;
    v9[3] = &unk_1006392B0;
    v9[4] = self;
    id v10 = v4;
    dispatch_async((dispatch_queue_t)queue, v9);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(33LL);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Error: unable to delete message, missing message",  buf,  2u);
    }
  }
}

- (void)rejectShareForMailboxAddress:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000C3598;
    v7[3] = &unk_1006392B0;
    id v8 = v4;
    id v9 = self;
    dispatch_async((dispatch_queue_t)queue, v7);
  }
}

- (void)prewarmCreateShareForPassIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C3A38;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)createShareForPartialShareInvitation:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000C4154;
  v43[3] = &unk_1006410F0;
  v43[4] = self;
  id v10 = a5;
  id v44 = v10;
  v11 = objc_retainBlock(v43);
  id v12 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  v41[0] = 0LL;
  v41[1] = v41;
  v41[2] = 0x3032000000LL;
  v41[3] = sub_1000C4234;
  v41[4] = sub_1000C4244;
  id v42 = 0LL;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x3032000000LL;
  v39[3] = sub_1000C4234;
  v39[4] = sub_1000C4244;
  id v40 = 0LL;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1000C424C;
  v38[3] = &unk_1006396D8;
  v38[4] = self;
  [v12 addOperation:v38];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000C430C;
  v32[3] = &unk_100641118;
  id v13 = v8;
  id v33 = v13;
  v34 = self;
  v36 = v39;
  v37 = v41;
  id v14 = v11;
  id v35 = v14;
  [v12 addOperation:v32];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000C453C;
  v28[3] = &unk_100641168;
  v31 = v39;
  id v15 = v13;
  id v29 = v15;
  v30 = self;
  [v12 addOperation:v28];
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000C47A4;
  v21[3] = &unk_1006411E0;
  id v17 = v15;
  id v22 = v17;
  v26 = v41;
  dispatch_queue_t v27 = v39;
  id v18 = v9;
  id v23 = v18;
  id v19 = v14;
  v24 = self;
  id v25 = v19;
  id v20 = [v12 evaluateWithInput:v16 completion:v21];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
}

- (void)createShareInvitationForPartialShareInvitation:(id)a3 existingTransportIdentifier:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v22 = a4;
  id v11 = a5;
  id v21 = a6;
  id v12 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  v55[0] = 0LL;
  v55[1] = v55;
  v55[2] = 0x3032000000LL;
  v55[3] = sub_1000C4234;
  v55[4] = sub_1000C4244;
  id v56 = 0LL;
  v53[0] = 0LL;
  v53[1] = v53;
  v53[2] = 0x3032000000LL;
  v53[3] = sub_1000C4234;
  v53[4] = sub_1000C4244;
  id v54 = 0LL;
  v51[0] = 0LL;
  v51[1] = v51;
  v51[2] = 0x3032000000LL;
  v51[3] = sub_1000C4234;
  v51[4] = sub_1000C4244;
  id v52 = 0LL;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_1000C51AC;
  v50[3] = &unk_1006396D8;
  v50[4] = self;
  [v12 addOperation:v50];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000C526C;
  v45[3] = &unk_100641208;
  id v47 = v53;
  v45[4] = self;
  id v13 = v10;
  id v46 = v13;
  id v48 = v55;
  id v49 = v51;
  [v12 addOperation:v45];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1000C5464;
  v42[3] = &unk_10063BA38;
  v42[4] = self;
  id v44 = v53;
  id v14 = v13;
  id v43 = v14;
  [v12 addOperation:v42];
  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x3032000000LL;
  v40[3] = sub_1000C4234;
  v40[4] = sub_1000C4244;
  id v41 = 0LL;
  v38[0] = 0LL;
  v38[1] = v38;
  v38[2] = 0x3032000000LL;
  v38[3] = sub_1000C4234;
  v38[4] = sub_1000C4244;
  id v39 = 0LL;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000C5590;
  v29[3] = &unk_100641258;
  id v15 = v14;
  id v30 = v15;
  id v33 = v55;
  v34 = v53;
  id v16 = v11;
  id v31 = v16;
  id v35 = v51;
  v36 = v38;
  id v17 = v22;
  id v32 = v17;
  v37 = v40;
  [v12 addOperation:v29];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000C580C;
  v23[3] = &unk_1006412A8;
  v23[4] = self;
  id v25 = v40;
  v26 = v38;
  dispatch_queue_t v27 = v53;
  id v19 = v21;
  id v24 = v19;
  v28 = v51;
  id v20 = [v12 evaluateWithInput:v18 completion:v23];

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v53, 8);

  _Block_object_dispose(v55, 8);
}

- (void)updateShareForPassIdentifier:(id)a3 share:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C6858;
  block[3] = &unk_10063F190;
  void block[4] = self;
  id v20 = v10;
  id v22 = v12;
  id v23 = v13;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)revokeShareForPassIdentifier:(id)a3 share:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v14 = a4;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));

  -[PDSharingManager revokeSharesForPassIdentifier:shares:shouldCascade:completion:]( self,  "revokeSharesForPassIdentifier:shares:shouldCascade:completion:",  v12,  v13,  v6,  v10,  v14);
}

- (void)revokeSharesForPassIdentifier:(id)a3 shares:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C6EC8;
  block[3] = &unk_100639508;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  BOOL v21 = a5;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)createSingleUseShareURLWithMessage:(id)a3 timeToLive:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C76F0;
  block[3] = &unk_100639AF0;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)cacheSharingMessageFromMailboxAddress:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = +[PKSharingRelayChannelDescriptor existingChannelForURL:]( &OBJC_CLASS___PKSharingRelayChannelDescriptor,  "existingChannelForURL:",  v6);
    -[PDSharingChannelManager cacheSharingMessageForDescriptor:message:]( self->_channelManager,  "cacheSharingMessageForDescriptor:message:",  v9,  v8);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(33LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Error: unable to cache message, missing mailboxAddress or message",  v12,  2u);
    }
  }
}

- (BOOL)hasActiveExternallySharedPasses
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C7BB0;
  v5[3] = &unk_10063AA60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)sharesForPassIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C7C8C;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (BOOL)hasSharesForPassIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C7DF4;
  block[3] = &unk_10063C080;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)hasShareableEntitlementsForPassIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C7EE8;
  block[3] = &unk_10063C080;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (id)entitlementsForPassIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_1000C4234;
  id v16 = sub_1000C4244;
  id v17 = 0LL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C7FF0;
  block[3] = &unk_10063C080;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C80D4;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C852C;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)userNotificationActionPerformed:(unint64_t)a3 notificationIdentifier:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C8758;
  block[3] = &unk_10063A858;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)passAdded:(id)a3
{
}

- (void)passUpdated:(id)a3 oldShares:(id)a4
{
}

- (void)passUpdated:(id)a3 oldPass:(id)a4 oldShares:(id)a5 oldEntitlements:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v10) {
    char v13 = [v10 passActivationState] != (id)2;
  }
  else {
    char v13 = 0;
  }
  if ([v10 passActivationState])
  {
    char v14 = 0;
    id v15 = v17;
  }

  else
  {
    id v16 = [v17 passActivationState];
    id v15 = v17;
    char v14 = v16 == 0LL;
  }

  sub_1000C8BE0((uint64_t)self, v15, v13, v11, v14, v12);
}

- (void)passWillBeRemoved:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C8FF8;
  v7[3] = &unk_1006392B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)sendSharingMessageTo:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000C934C;
  v15[3] = &unk_10063B440;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)queue, v15);
}

- (void)acceptCarKeyShareForMessage:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000C9688;
  v23[3] = &unk_100641660;
  v23[4] = self;
  id v10 = a5;
  id v24 = v10;
  id v11 = objc_retainBlock(v23);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C9758;
  block[3] = &unk_1006416B0;
  id v18 = v8;
  id v19 = self;
  id v21 = v11;
  id v22 = v10;
  id v20 = v9;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  id v16 = v8;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)didReceiveActivationCodeFailureForCredentialIdentifier:(id)a3 attemptsRemaining:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a5;
  if (PKV2SharingFlowEnabled())
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    v9[2](v9, 1LL);
  }

  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CA778;
    block[3] = &unk_10063A858;
    void block[4] = self;
    id v14 = v8;
    unint64_t v15 = a4;
    dispatch_async((dispatch_queue_t)queue, block);
    v9[2](v9, 1LL);
  }
}

- (void)pendingShareActivationForShareIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CA95C;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)pendingCredentialsBeingProvisioned:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CADBC;
  v7[3] = &unk_10063AC90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)revokePendingCredentialsForReaderIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CB000;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)finishedStatefulProvisioningAttemptWithSuccess:(BOOL)a3 operation:(id)a4 share:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(33LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      id v12 = @"Yes";
    }
    else {
      id v12 = @"No";
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    int v24 = 138412546;
    id v25 = v12;
    __int16 v26 = 2112;
    dispatch_queue_t v27 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "StatefulProvisioningManager: finished attempt with success: %@ for share %@",  (uint8_t *)&v24,  0x16u);
  }

  if (!v6)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 subcredentialIdentifier]);
    -[PDAppletSubcredentialManager revokeSubcredentialForIdentifier:withCompletion:]( self->_subcredentialManager,  "revokeSubcredentialForIdentifier:withCompletion:",  v14,  0LL);
  }

  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 transportIdentifier]);
  id v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 credentialShares]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);
    id v17 = (id)objc_claimAutoreleasedReturnValue([v19 channelTransportIdentifier]);
  }

  id v20 = +[PKSharingRelayChannelDescriptor existingChannelForMailboxIdentifier:]( &OBJC_CLASS___PKSharingRelayChannelDescriptor,  "existingChannelForMailboxIdentifier:",  v17);
  id v21 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingChannelManager handleForDescriptor:queue:]( self->_channelManager,  "handleForDescriptor:queue:",  v20,  self->_queue));
  if (v21)
  {
    if (v6) {
      [v8 isForegroundOperation];
    }
    sub_1000C346C((uint64_t)self, v21);
  }

  databaseManager = self->_databaseManager;
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  -[PDDatabaseManager deletePassShareWithIdentifier:](databaseManager, "deletePassShareWithIdentifier:", v23);
}

- (void)provisioningOperationsDidUpdate
{
}

- (id)pendingShareActivations
{
  if ((PKV2SharingFlowEnabled(self, a2) & 1) != 0) {
    return &__NSArray0__struct;
  }
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  queue = self->_queue;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_1000CB600;
  id v11 = &unk_1006392B0;
  id v12 = self;
  BOOL v6 = v4;
  id v13 = v6;
  dispatch_sync((dispatch_queue_t)queue, &v8);
  if (-[NSMutableArray count](v6, "count", v8, v9, v10, v11, v12)) {
    id v7 = -[NSMutableArray copy](v6, "copy");
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (id)pendingShareActivationForShareIdentifier:(id)a3
{
  id v4 = a3;
  if ((PKV2SharingFlowEnabled(v4, v5) & 1) != 0)
  {
    id v6 = 0LL;
  }

  else
  {
    uint64_t v12 = 0LL;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000LL;
    unint64_t v15 = sub_1000C4234;
    id v16 = sub_1000C4244;
    id v17 = 0LL;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CB850;
    block[3] = &unk_10063C080;
    id v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync((dispatch_queue_t)queue, block);
    id v6 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

- (void)userDidDismissPendingShareActivationForShareIdentifier:(id)a3
{
  id v4 = a3;
  if ((PKV2SharingFlowEnabled(v4, v5) & 1) == 0)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000CB91C;
    v7[3] = &unk_1006392B0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)queue, v7);
  }
}

- (void)insertPassMessage:(id)a3 pass:(id)a4
{
  id v9 = a3;
  databaseManager = self->_databaseManager;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 uniqueID]);
  id v8 =  -[PDDatabaseManager insertOrUpdatePaymentMessage:forPassUniqueIdentifier:paymentApplication:performTruncation:]( databaseManager,  "insertOrUpdatePaymentMessage:forPassUniqueIdentifier:paymentApplication:performTruncation:",  v9,  v7,  0LL,  0LL);
}

- (void)handleOutstandingShareMessage:(id)a3 transportIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = (uint64_t)[v8 type];
  if (v7 > 1001)
  {
    if (v7 == 1002)
    {
      sub_1000CBB4C((uint64_t)self, v8, v6);
      goto LABEL_10;
    }

    if (v7 == 2001)
    {
      sub_1000C884C((uint64_t)self, v8, v6);
      goto LABEL_10;
    }

    goto LABEL_8;
  }

  if (v7 != 1)
  {
    if (v7 == 1001)
    {
      sub_1000CBAA4((uint64_t)self, v8, v6);
      goto LABEL_10;
    }

- (void)channelWasRemotelyTerminatedWithTransportIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CEB4C;
  v7[3] = &unk_1006392B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)processCLICommands:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((os_variant_has_internal_ui(PKOSVariantSubsystem) & 1) != 0)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CECBC;
    block[3] = &unk_10063C450;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_async((dispatch_queue_t)queue, block);
  }

  else
  {
    (*((void (**)(id, const __CFString *))v7 + 2))(v7, @"Unsupported on non internal builds");
  }
}

- (PDSharingChannelManager)channelManager
{
  return self->_channelManager;
}

- (void).cxx_destruct
{
}

@end