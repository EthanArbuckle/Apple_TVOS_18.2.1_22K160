@interface PDPushProvisioningManager
- (BOOL)_companionHasProvisionedPassForCredentialHash:(id)a3;
- (BOOL)_hasProvisionedPassForCredentialHash:(id)a3;
- (BOOL)_isPushProvisioningSupportedForCurrentDeviceRequiresSimultaneousRequestRouting:(BOOL)a3 checkPassCount:(BOOL)a4 passCount:(unint64_t)a5;
- (PDCardFileManager)cardFileManager;
- (PDDatabaseManager)databaseManager;
- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationServiceCoordinator;
- (PDFamilyCircleManager)familyCircleManager;
- (PDNotificationStreamManager)notificationStreamManager;
- (PDPaymentWebServiceCoordinator)webServiceCoordinator;
- (PDPendingProvisioningManager)pendingProvisioningManager;
- (PDPushProvisioningManager)initWithDataBaseManager:(id)a3 cardFileManager:(id)a4 userNotificationManager:(id)a5 paymentWebServiceCoordinator:(id)a6 familyCircleManager:(id)a7 secureElement:(id)a8 assertionManager:(id)a9 deviceRegistrationServiceCoordinator:(id)a10 notificationStreamManager:(id)a11 pendingProvisioningManager:(id)a12;
- (PDUserNotificationManager)userNotificationManager;
- (PKCloudStoreCoordinatorDelegate)cloudStoreCoordinator;
- (PKSecureElement)secureElement;
- (id)_encryptProvisioningTarget:(id)a3 devSigned:(BOOL)a4 certificateChain:(id)a5 error:(id *)a6;
- (void)_handleExpectedPassUpdateForEligibilityResponse:(id)a3 completion:(id)a4;
- (void)_handleUnsupportedDeviceResponse:(id)a3 completion:(id)a4;
- (void)_isPushProvisioningSupportedForConfiguration:(id)a3 completion:(id)a4;
- (void)_prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 determineTargetDevice:(BOOL)a5 completion:(id)a6;
- (void)_queue_checkAvailablePushProvisioningSharingIdentifiersAndProvisionWithCompletion:(id)a3;
- (void)_queue_insertOrUpdatePushProvisioningSharingMetadata:(id)a3;
- (void)_queue_performBackgroundPushProvisioningWithTransaction:(id)a3;
- (void)_webServiceForTargetDevice:(unint64_t)a3 completion:(id)a4;
- (void)configurePushProvisioningConfiguration:(id)a3 completion:(id)a4;
- (void)encryptProvisioningTarget:(id)a3 completion:(id)a4;
- (void)isPushProvisioningSupportedForConfiguration:(id)a3 completion:(id)a4;
- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5;
- (void)provideEncryptedPushProvisioningTarget:(id)a3 sharingInstanceIdentifier:(id)a4 withCompletion:(id)a5;
- (void)provisionAvailablePushProvisioningSharingIdentifiers;
- (void)pushProvisioningNoncesWithCredentialCount:(unint64_t)a3 completion:(id)a4;
- (void)pushProvisioningSharingIdentifiers:(id)a3;
- (void)redeemPaymentShareableCredential:(id)a3 completion:(id)a4;
- (void)redeemPaymentShareableCredential:(id)a3 provisioningRequestForEligibilityResponse:(id)a4 completion:(id)a5;
- (void)redeemProvisioningMetadata:(id)a3 completion:(id)a4;
- (void)redeemProvisioningSharingIdentifier:(id)a3 completion:(id)a4;
- (void)setCardFileManager:(id)a3;
- (void)setCloudStoreCoordinator:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDeviceRegistrationServiceCoordinator:(id)a3;
- (void)setFamilyCircleManager:(id)a3;
- (void)setNotificationStreamManager:(id)a3;
- (void)setPendingProvisioningManager:(id)a3;
- (void)setSecureElement:(id)a3;
- (void)setUserNotificationManager:(id)a3;
- (void)setWebServiceCoordinator:(id)a3;
- (void)statusForShareableCredentials:(id)a3 completion:(id)a4;
@end

@implementation PDPushProvisioningManager

- (PDPushProvisioningManager)initWithDataBaseManager:(id)a3 cardFileManager:(id)a4 userNotificationManager:(id)a5 paymentWebServiceCoordinator:(id)a6 familyCircleManager:(id)a7 secureElement:(id)a8 assertionManager:(id)a9 deviceRegistrationServiceCoordinator:(id)a10 notificationStreamManager:(id)a11 pendingProvisioningManager:(id)a12
{
  id v41 = a3;
  id obj = a4;
  id v40 = a4;
  id v39 = a5;
  id v38 = a6;
  id v37 = a7;
  id v36 = a8;
  id v35 = a9;
  id v34 = a10;
  id v33 = a11;
  id v32 = a12;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___PDPushProvisioningManager;
  v18 = -[PDPushProvisioningManager init](&v44, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_databaseManager, a3);
    objc_storeStrong((id *)&v19->_cardFileManager, obj);
    objc_storeStrong((id *)&v19->_webServiceCoordinator, a6);
    objc_storeStrong((id *)&v19->_secureElement, a8);
    objc_storeStrong((id *)&v19->_userNotificationManager, a5);
    objc_storeStrong((id *)&v19->_familyCircleManager, a7);
    objc_storeStrong((id *)&v19->_deviceRegistrationServiceCoordinator, a10);
    objc_storeStrong((id *)&v19->_notificationStreamManager, a11);
    objc_storeStrong((id *)&v19->_pendingProvisioningManager, a12);
    objc_storeStrong((id *)&v19->_assertionManager, a9);
    dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.passd.pushprovisioningmanager.work", v21);
    workQueue = v19->_workQueue;
    v19->_workQueue = (OS_dispatch_queue *)v22;

    dispatch_queue_t v24 = dispatch_queue_create("com.apple.passd.pushprovisioningmanager.reply", v21);
    replyQueue = v19->_replyQueue;
    v19->_replyQueue = (OS_dispatch_queue *)v24;

    v26 = v19->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000DD9D4;
    block[3] = &unk_100639300;
    v43 = v19;
    v27 = v26;
    dispatch_block_t v28 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v27, v28);
  }

  return v19;
}

- (void)isPushProvisioningSupportedForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000DDA70;
    v8[3] = &unk_1006422F0;
    v8[4] = self;
    id v9 = v6;
    -[PDPushProvisioningManager _isPushProvisioningSupportedForConfiguration:completion:]( self,  "_isPushProvisioningSupportedForConfiguration:completion:",  a3,  v8);
  }
}

- (void)_isPushProvisioningSupportedForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 secureElementPassConfiguration]);
  id v9 = objc_alloc_init(&OBJC_CLASS___PKProvisioningRequirementOracle);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 requirementsForAddSecureElementPassConfiguration:v8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 recoverableRequirements]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 requirementsByRemovingRequirements:v11]);

  id v13 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  v37[0] = 0LL;
  v37[1] = v37;
  v37[2] = 0x2020000000LL;
  char v38 = 0;
  v35[0] = 0LL;
  v35[1] = v35;
  v35[2] = 0x2020000000LL;
  char v36 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000DDDE0;
  v34[3] = &unk_1006396D8;
  v34[4] = self;
  [v13 addOperation:v34];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000DDEA0;
  v31[3] = &unk_10063B5A8;
  v31[4] = self;
  id v14 = v12;
  id v32 = v14;
  id v33 = v37;
  [v13 addOperation:v31];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000DE050;
  v25[3] = &unk_1006423B8;
  id v15 = v6;
  id v26 = v15;
  v27 = self;
  id v16 = v14;
  id v28 = v16;
  v30 = v35;
  id v17 = v8;
  id v29 = v17;
  [v13 addOperation:v25];
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000DE37C;
  v21[3] = &unk_1006423E0;
  v23 = v37;
  dispatch_queue_t v24 = v35;
  id v19 = v7;
  id v22 = v19;
  id v20 = [v13 evaluateWithInput:v18 completion:v21];

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);
}

- (BOOL)_isPushProvisioningSupportedForCurrentDeviceRequiresSimultaneousRequestRouting:(BOOL)a3 checkPassCount:(BOOL)a4 passCount:(unint64_t)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  if (!PKSecureElementIsAvailable(self))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(27LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = 0;
      v11 = "Push provisioning: Device does not support push provisioning.";
      v12 = (uint8_t *)&v24;
      goto LABEL_10;
    }

- (void)pushProvisioningSharingIdentifiers:(id)a3
{
  id v4 = a3;
  webServiceCoordinator = self->_webServiceCoordinator;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000DE79C;
  v7[3] = &unk_100642430;
  id v8 = v4;
  id v6 = v4;
  -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( webServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v7);
}

- (void)statusForShareableCredentials:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        if (!PKPushProvisioningSharingStatusIsTerminal(objc_msgSend(*(id *)(*((void *)&v22 + 1)
                                                                                         + 8LL * (void)v12), "status")))
        {

          webServiceCoordinator = self->_webServiceCoordinator;
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472LL;
          v17[2] = sub_1000DEA80;
          v17[3] = &unk_100642480;
          id v18 = v8;
          uint64_t v19 = self;
          id v20 = v7;
          -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( webServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v17);

          goto LABEL_13;
        }

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t Object = PKLogFacilityTypeGetObject(27LL);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Already at final state: completing", buf, 2u);
  }

  uint64_t v15 = PKAggregateSharingStatusForShareableCredentials(v8);
  (*((void (**)(id, uint64_t, id, void))v7 + 2))(v7, v15, v8, 0LL);
LABEL_13:
}

- (void)provideEncryptedPushProvisioningTarget:(id)a3 sharingInstanceIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  webServiceCoordinator = self->_webServiceCoordinator;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000DF178;
  v15[3] = &unk_100642480;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( webServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v15);
}

- (void)pushProvisioningNoncesWithCredentialCount:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  webServiceCoordinator = self->_webServiceCoordinator;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000DF2B8;
  v9[3] = &unk_100642570;
  id v10 = v6;
  unint64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( webServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v9);
}

- (void)configurePushProvisioningConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v24 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  v51[0] = 0LL;
  v51[1] = v51;
  v51[2] = 0x3032000000LL;
  v51[3] = sub_1000DEECC;
  v51[4] = sub_1000DEEDC;
  id v52 = 0LL;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_1000DFA1C;
  v50[3] = &unk_10063BBC8;
  v50[4] = self;
  v50[5] = v51;
  [v7 addOperation:v50];
  v49[0] = 0LL;
  v49[1] = v49;
  v49[2] = 0x2020000000LL;
  v48[0] = 0LL;
  v48[1] = v48;
  v48[2] = 0x2020000000LL;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000DFBF4;
  v43[3] = &unk_10063C810;
  id v8 = self;
  v43[4] = self;
  id v9 = v6;
  id v44 = v9;
  v45 = v49;
  v46 = v48;
  v47 = v51;
  [v7 addOperation:v43];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 shareablePassConfiguration]);
  __int128 v25 = v7;
  __int128 v22 = v10;
  if (v10) {
    BOOL v11 = objc_msgSend(v10, "primaryAction", v10, v24) == (id)1;
  }
  else {
    BOOL v11 = 0;
  }
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadataProviders", v22));
  id v13 = [v12 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v40;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v39 + 1) + 8 * (void)i) provisioningTarget]);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_1000DFDF4;
        v31[3] = &unk_100642660;
        BOOL v38 = v11;
        id v35 = v49;
        char v36 = v48;
        id v17 = v16;
        id v32 = v17;
        id v33 = v8;
        id v37 = v51;
        id v34 = v9;
        [v7 addOperation:v31];
      }

      id v13 = [v12 countByEnumeratingWithState:&v39 objects:v53 count:16];
    }

    while (v13);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000E0350;
  v26[3] = &unk_1006426B0;
  id v19 = v9;
  v30 = v51;
  id v27 = v19;
  id v28 = v8;
  id v20 = v24;
  id v29 = v20;
  id v21 = [v25 evaluateWithInput:v18 completion:v26];

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);
}

- (void)_queue_insertOrUpdatePushProvisioningSharingMetadata:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 =  -[PDDatabaseManager insertOrUpdatePushProvisioningSharingMetadata:]( self->_databaseManager,  "insertOrUpdatePushProvisioningSharingMetadata:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

- (void)provisionAvailablePushProvisioningSharingIdentifiers
{
  uint64_t Object = PKLogFacilityTypeGetObject(27LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Push provisioning: provisioning pending sharing instance identifiers",  buf,  2u);
  }

  id v5 = (void *)PDOSTransactionCreate("PDPushProvisioningManager");
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000E0670;
  v8[3] = &unk_1006392B0;
  id v9 = v5;
  __int128 v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)workQueue, v8);
}

- (void)_queue_performBackgroundPushProvisioningWithTransaction:(id)a3
{
  id v4 = a3;
  if (self->_isUpdatingPushProvisioningSharingIdentifier)
  {
    self->_didDeferUpdatingSharingIdentifiers = 1;
  }

  else
  {
    self->_isUpdatingPushProvisioningSharingIdentifier = 1;
    uint64_t Object = PKLogFacilityTypeGetObject(27LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Push provisioning: Performing background push provisioning",  buf,  2u);
    }

    if (!v4) {
      id v4 = (id)PDOSTransactionCreate("PDPushProvisioningManager.updating_sharing_identifier");
    }
    __int128 v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = sub_1000E0808;
    uint64_t v15 = &unk_1006426D8;
    id v16 = self;
    id v4 = v4;
    id v17 = v4;
    id v7 = objc_retainBlock(&v12);
    id v8 = objc_alloc(&OBJC_CLASS___NSMutableSet);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager pushProvisioningSharingMetadataWithStatus:]( self->_databaseManager,  "pushProvisioningSharingMetadataWithStatus:",  1LL,  v12,  v13,  v14,  v15,  v16));
    __int128 v10 = -[NSMutableSet initWithSet:](v8, "initWithSet:", v9);
    availableSharingMetaData = self->_availableSharingMetaData;
    self->_availableSharingMetaData = v10;

    if (self->_shouldFetchSharingIdentifiersFromServer
      || -[NSMutableSet count](self->_availableSharingMetaData, "count"))
    {
      -[PDPushProvisioningManager _queue_checkAvailablePushProvisioningSharingIdentifiersAndProvisionWithCompletion:]( self,  "_queue_checkAvailablePushProvisioningSharingIdentifiersAndProvisionWithCompletion:",  v7);
    }

    else
    {
      ((void (*)(void ***, uint64_t))v7[2])(v7, 1LL);
    }
  }
}

- (void)_queue_checkAvailablePushProvisioningSharingIdentifiersAndProvisionWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(27LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Push provisioning: using new provisioning coordinatoor",  buf,  2u);
  }

  BOOL shouldFetchSharingIdentifiersFromServer = self->_shouldFetchSharingIdentifiersFromServer;
  self->_BOOL shouldFetchSharingIdentifiersFromServer = 0;
  if (shouldFetchSharingIdentifiersFromServer)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
    *(void *)buf = 0LL;
    id v17 = buf;
    uint64_t v18 = 0x3032000000LL;
    id v19 = sub_1000DEECC;
    id v20 = sub_1000DEEDC;
    id v21 = 0LL;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000E0B08;
    v15[3] = &unk_1006396D8;
    void v15[4] = self;
    [v8 addOperation:v15];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000E0C80;
    v14[3] = &unk_10063BBC8;
    v14[4] = self;
    v14[5] = buf;
    [v8 addOperation:v14];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000E10DC;
    v11[3] = &unk_1006427C8;
    v11[4] = self;
    uint64_t v13 = buf;
    id v12 = v4;
    id v10 = [v8 evaluateWithInput:v9 completion:v11];

    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Push provisioning: skipping check because pending push provisioning credentials are handled by the pending provisioning manager",  buf,  2u);
    }

    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1LL);
  }
}

- (void)encryptProvisioningTarget:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E1208;
  v7[3] = &unk_1006427F0;
  id v8 = a4;
  id v6 = v8;
  -[PDPushProvisioningManager _prepareProvisioningTarget:checkFamilyCircle:determineTargetDevice:completion:]( self,  "_prepareProvisioningTarget:checkFamilyCircle:determineTargetDevice:completion:",  a3,  0LL,  0LL,  v7);
}

- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5
{
}

- (void)_prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 determineTargetDevice:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [v9 targetDevice];
  id v12 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  v48[0] = 0LL;
  v48[1] = v48;
  v48[2] = 0x3032000000LL;
  v48[3] = sub_1000DEECC;
  void v48[4] = sub_1000DEEDC;
  id v49 = 0LL;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1000E157C;
  v47[3] = &unk_1006396D8;
  v47[4] = self;
  [v12 addOperation:v47];
  v45[0] = 0LL;
  v45[1] = v45;
  v45[2] = 0x2020000000LL;
  char v46 = 0;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1000E163C;
  v41[3] = &unk_100642868;
  BOOL v44 = a4;
  v41[4] = self;
  id v13 = v9;
  id v42 = v13;
  v43 = v45;
  [v12 addOperation:v41];
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x3032000000LL;
  v39[3] = sub_1000DEECC;
  v39[4] = sub_1000DEEDC;
  id v40 = 0LL;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1000E1C48;
  v38[3] = &unk_1006428B8;
  v38[5] = v39;
  v38[6] = v11;
  v38[4] = self;
  [v12 addOperation:v38];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000E1D78;
  v34[3] = &unk_100641880;
  id v14 = v13;
  id v35 = v14;
  char v36 = v39;
  id v37 = v48;
  [v12 addOperation:v34];
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x3032000000LL;
  v32[3] = sub_1000DEECC;
  v32[4] = sub_1000DEEDC;
  id v33 = 0LL;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000E1FBC;
  v25[3] = &unk_100642908;
  id v27 = v39;
  id v28 = v32;
  void v25[4] = self;
  id v15 = v14;
  id v26 = v15;
  id v31 = v11;
  id v29 = v48;
  v30 = v45;
  [v12 addOperation:v25];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000E22A4;
  v19[3] = &unk_100642958;
  id v24 = v11;
  id v21 = v48;
  id v17 = v10;
  v19[4] = self;
  id v20 = v17;
  __int128 v22 = v32;
  __int128 v23 = v45;
  id v18 = [v12 evaluateWithInput:v16 completion:v19];

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v48, 8);
}

- (id)_encryptProvisioningTarget:(id)a3 devSigned:(BOOL)a4 certificateChain:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  PKPaymentCreateAndValidateTrustWithCerts();
  if (a6) {
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKEncryptionErrorDomain,  1LL,  0LL));
  }

  return 0LL;
}

- (void)redeemPaymentShareableCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 encryptedProvisioningTarget]);
  id v9 = [v8 targetDevice];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000E27C4;
  v12[3] = &unk_1006429A8;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  -[PDPushProvisioningManager _webServiceForTargetDevice:completion:]( self,  "_webServiceForTargetDevice:completion:",  v9,  v12);
}

- (void)redeemProvisioningSharingIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(27LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Push provisioning starting redeem with sharingIdentifier: %@",  buf,  0xCu);
  }

  id v10 = [[PKPaymentShareableCredential alloc] initWithProvisioningSharingIdentifier:v6 isBackgroundProvisioning:1];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000E2C30;
  v12[3] = &unk_1006429D0;
  id v13 = v7;
  id v11 = v7;
  -[PDPushProvisioningManager redeemPaymentShareableCredential:completion:]( self,  "redeemPaymentShareableCredential:completion:",  v10,  v12);
}

- (void)redeemProvisioningMetadata:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(27LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Push provisioning starting redeem with metadata: %@",  buf,  0xCu);
  }

  id v10 = objc_alloc(&OBJC_CLASS___PKPaymentShareableCredential);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 sharingInstanceIdentifier]);
  id v12 = [v10 initWithProvisioningSharingIdentifier:v11 isBackgroundProvisioning:1];

  objc_msgSend(v12, "setSource:", objc_msgSend(v6, "source"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000E2DB8;
  v14[3] = &unk_1006429D0;
  id v15 = v7;
  id v13 = v7;
  -[PDPushProvisioningManager redeemPaymentShareableCredential:completion:]( self,  "redeemPaymentShareableCredential:completion:",  v12,  v14);
}

- (void)redeemPaymentShareableCredential:(id)a3 provisioningRequestForEligibilityResponse:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v26 = a4;
  id v9 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(27LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Push provisioning starting redeeme with credential: %@",  (uint8_t *)&buf,  0xCu);
  }

  objc_initWeak(&location, self);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v44 = 0x3032000000LL;
  v45 = sub_1000DEECC;
  char v46 = sub_1000DEEDC;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v47 = (id)objc_claimAutoreleasedReturnValue([v12 UUIDString]);

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1000E3130;
  v40[3] = &unk_1006429F8;
  objc_copyWeak(&v41, &location);
  v40[4] = &buf;
  id v13 = objc_retainBlock(v40);
  id v14 = (void *)PDOSTransactionCreate("PDPushProvisioningManager");
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000E31A0;
  v36[3] = &unk_100642A20;
  id v15 = v9;
  id v38 = v15;
  id v16 = v13;
  id v39 = v16;
  id v17 = v14;
  id v37 = v17;
  id v18 = objc_retainBlock(v36);
  assertionManager = self->_assertionManager;
  uint64_t v20 = *(void *)(*((void *)&buf + 1) + 40LL);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000E31D4;
  v27[3] = &unk_100642AC0;
  id v21 = v8;
  p___int128 buf = &buf;
  id v28 = v21;
  id v29 = self;
  __int128 v22 = v18;
  id v30 = v22;
  objc_copyWeak(&v35, &location);
  id v23 = v15;
  id v31 = v23;
  id v24 = v16;
  id v32 = v24;
  id v25 = v26;
  id v33 = v25;
  -[PDAssertionManager acquireAssertionOfType:withIdentifier:reason:handler:]( assertionManager,  "acquireAssertionOfType:withIdentifier:reason:handler:",  1LL,  v20,  @"Push provisioning request",  v27);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v41);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

- (void)_handleUnsupportedDeviceResponse:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 eligibilityStatus];
  if (v7 == (id)4)
  {
    NSErrorUserInfoKey v23 = NSDebugDescriptionErrorKey;
    id v24 = @"Newer OS version required";
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    id v10 = PKAddSecureElementPassErrorDomain;
    uint64_t v11 = 6LL;
    goto LABEL_5;
  }

  int v8 = (int)v7;
  if (v7 == (id)5)
  {
    NSErrorUserInfoKey v25 = NSDebugDescriptionErrorKey;
    id v26 = @"Hardware not supported";
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    id v10 = PKAddSecureElementPassErrorDomain;
    uint64_t v11 = 4LL;
LABEL_5:
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  v11,  v9));

    goto LABEL_9;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(27LL);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109120;
    int v22 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Error: Unsupported eligibility status: %ul",  buf,  8u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAddSecureElementPassErrorDomain,  0LL,  0LL));
LABEL_9:
  replyQueue = self->_replyQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000E3C4C;
  v18[3] = &unk_1006396B0;
  id v19 = v12;
  id v20 = v6;
  id v16 = v12;
  id v17 = v6;
  dispatch_async((dispatch_queue_t)replyQueue, v18);
}

- (void)_handleExpectedPassUpdateForEligibilityResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(27LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Push provisioning: Received pass update eligibility status, waiting for pass update",  buf,  2u);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000E3E4C;
  v19[3] = &unk_100642AE8;
  v19[4] = self;
  id v10 = v7;
  id v20 = v10;
  uint64_t v11 = objc_retainBlock(v19);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 dpanIdentifier]);
  id v13 = v12;
  if (v12)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000E3F90;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v17 = v12;
    id v18 = v11;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Push provisioning: Missing DPAN identifier, unable to wait for pass update.",  buf,  2u);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAddSecureElementPassErrorDomain,  2LL,  0LL));
    ((void (*)(void *, void, void *))v11[2])(v11, 0LL, v15);
  }
}

- (BOOL)_hasProvisionedPassForCredentialHash:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithProvisioningCredentialHash:]( self->_databaseManager,  "passWithProvisioningCredentialHash:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 secureElementPass]);

  if (v4) {
    BOOL v5 = [v4 passActivationState] != (id)4;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_companionHasProvisionedPassForCredentialHash:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PKPassLibrary sharedInstanceWithRemoteLibrary]( &OBJC_CLASS___PKPassLibrary,  "sharedInstanceWithRemoteLibrary"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _remoteLibrary]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 passesOfType:1]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000E4238;
  v10[3] = &unk_100642B10;
  id v11 = v3;
  id v7 = v3;
  unsigned __int8 v8 = objc_msgSend(v6, "pk_containsObjectPassingTest:", v10);

  return v8;
}

- (void)_webServiceForTargetDevice:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 == 2)
  {
    (*((void (**)(id, void, Block_layout *))v6 + 2))(v6, 0LL, &stru_100642B30);
  }

  else
  {
    webServiceCoordinator = self->_webServiceCoordinator;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000E43BC;
    v9[3] = &unk_100642430;
    id v10 = v6;
    -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( webServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v9);
  }
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (PDCardFileManager)cardFileManager
{
  return self->_cardFileManager;
}

- (void)setCardFileManager:(id)a3
{
}

- (PDPaymentWebServiceCoordinator)webServiceCoordinator
{
  return self->_webServiceCoordinator;
}

- (void)setWebServiceCoordinator:(id)a3
{
}

- (PKSecureElement)secureElement
{
  return self->_secureElement;
}

- (void)setSecureElement:(id)a3
{
}

- (PDUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void)setUserNotificationManager:(id)a3
{
}

- (PDFamilyCircleManager)familyCircleManager
{
  return self->_familyCircleManager;
}

- (void)setFamilyCircleManager:(id)a3
{
}

- (PKCloudStoreCoordinatorDelegate)cloudStoreCoordinator
{
  return self->_cloudStoreCoordinator;
}

- (void)setCloudStoreCoordinator:(id)a3
{
}

- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationServiceCoordinator
{
  return self->_deviceRegistrationServiceCoordinator;
}

- (void)setDeviceRegistrationServiceCoordinator:(id)a3
{
}

- (PDNotificationStreamManager)notificationStreamManager
{
  return self->_notificationStreamManager;
}

- (void)setNotificationStreamManager:(id)a3
{
}

- (PDPendingProvisioningManager)pendingProvisioningManager
{
  return self->_pendingProvisioningManager;
}

- (void)setPendingProvisioningManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end