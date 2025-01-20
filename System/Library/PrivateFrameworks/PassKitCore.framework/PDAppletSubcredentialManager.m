@interface PDAppletSubcredentialManager
- (BOOL)addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4;
- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3;
- (BOOL)createdSharedSubcredentialWithIdentifier:(id)a3 fromSharingInvitationIdentifier:(id)a4;
- (BOOL)didReceiveSharingInvitationWithIdentifier:(id)a3 fromOriginatorIDSHandle:(id)a4 sharingSessionIdentifier:(id)a5 metadata:(id)a6;
- (BOOL)didUpdateSharingInvitationWithIdentifier:(id)a3 reason:(int64_t)a4;
- (BOOL)handleSharingInvitationRequest:(id)a3;
- (BOOL)interestedInAssertionOfType:(unint64_t)a3;
- (BOOL)removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4;
- (BOOL)removeSharingInvitationWithIdentifier:(id)a3;
- (BOOL)sharingInvitationReceiptWasInvalidated:(id)a3 withCredentialIdentifier:(id)a4 error:(id)a5;
- (NSSet)invitations;
- (PDAppletSubcredentialManager)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4 paymentWebServiceCoordinator:(id)a5 daManager:(id)a6 carKeyRequirementsChecker:(id)a7 secureElement:(id)a8 assertionManager:(id)a9 notificationManager:(id)a10;
- (PDAssertionManager)assertionManager;
- (PDCardFileManager)cardFileManager;
- (PDDatabaseManager)databaseManager;
- (PDPaymentWebServiceCoordinator)webServiceCoordinator;
- (PDUserNotificationManager)notificationManager;
- (PKSecureElement)secureElement;
- (id)sharedCredentialManifestForPass:(id)a3;
- (void)_downloadPassAtURL:(id)a3 credentialIdentifier:(id)a4 share:(id)a5;
- (void)_inflateSubcredentialsInDatabaseWithDeviceProperties:(id)a3 withCompletion:(id)a4;
- (void)_removeBackgroundRegistrationRequestForCredentials:(id)a3 withPaymentWebService:(id)a4;
- (void)_setRangingSuspensionReason:(unint64_t)a3 forCredential:(id)a4 forPaymentApplication:(id)a5;
- (void)_trackCredential:(id)a3 withRegistrationData:(id)a4 completion:(id)a5;
- (void)_updateSubcredentialsForBTEnabled:(BOOL)a3;
- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4;
- (void)bluetoothMonitorerRecievedUpdatedBluetoothState:(int64_t)a3;
- (void)canAcceptInvitation:(id)a3 withCompletion:(id)a4;
- (void)createRegistrationRequestForCredentialWithIdentifier:(id)a3 completion:(id)a4;
- (void)credentialsOnDeviceWithCompletion:(id)a3;
- (void)dealloc;
- (void)declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4;
- (void)didUpdateCredential:(id)a3 onPassWithIdentifier:(id)a4;
- (void)didUpdateCredential:(id)a3 onPassWithIdentifier:(id)a4 oldShares:(id)a5;
- (void)handlePaymentApplicationsAddedOrUpdatedOnPass:(id)a3 oldShares:(id)a4;
- (void)invalidateVehicleConnectionSessionForIdentifier:(id)a3;
- (void)passAddedOrUpdated:(id)a3 oldPass:(id)a4 oldShares:(id)a5;
- (void)passWillBeRemoved:(id)a3;
- (void)paymentWebServiceCoordinator:(id)a3 didRegisterCredentialWithIdentifier:(id)a4 response:(id)a5 error:(id)a6;
- (void)rangingDidResumeForTerminalType:(int64_t)a3 forAppletIdentifier:(id)a4 keyIdentifier:(id)a5;
- (void)rangingDidSuspendForTerminalType:(int64_t)a3 withReasons:(unint64_t)a4 forAppletIdentifier:(id)a5 keyIdentifier:(id)a6;
- (void)registerObserver:(id)a3;
- (void)requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3;
- (void)requestRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4;
- (void)restoreSubcredentialsInDatabase:(id)a3 withCompletion:(id)a4;
- (void)revokeSubcredentialForIdentifier:(id)a3 withCompletion:(id)a4;
- (void)revokeSubcredentials:(id)a3 withCompletion:(id)a4;
- (void)revokeSubcredentialsForIdentifiers:(id)a3 withCompletion:(id)a4;
- (void)revokeSubcredentialsForReaderIdentifiers:(id)a3 withCompletion:(id)a4;
- (void)sendRKEPassThroughData:(id)a3 forSessionIdentifier:(id)a4 withCompletion:(id)a5;
- (void)sessionDidChangeConnectionStatus:(int64_t)a3;
- (void)sessionDidReceiveData:(id)a3;
- (void)setAssertionManager:(id)a3;
- (void)setCardFileManager:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)setSecureElement:(id)a3;
- (void)setWebServiceCoordinator:(id)a3;
- (void)signData:(id)a3 auth:(id)a4 bundleIdentifier:(id)a5 nonce:(id)a6 credential:(id)a7 completion:(id)a8;
- (void)startVehicleConnectionSessionWithPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)trackSharedCredential:(id)a3 withCompletion:(id)a4;
- (void)unregisterObserver:(id)a3;
- (void)updateCredential:(id)a3 forPaymentApplication:(id)a4 rangingSuspensionReasons:(unint64_t)a5;
- (void)updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)updateSubcredentialsForBluetoothPowerChange;
@end

@implementation PDAppletSubcredentialManager

- (PDAppletSubcredentialManager)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4 paymentWebServiceCoordinator:(id)a5 daManager:(id)a6 carKeyRequirementsChecker:(id)a7 secureElement:(id)a8 assertionManager:(id)a9 notificationManager:(id)a10
{
  id v34 = a3;
  id v33 = a4;
  id v32 = a5;
  id v31 = a6;
  id v30 = a7;
  id v29 = a8;
  id v28 = a9;
  id v17 = a10;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___PDAppletSubcredentialManager;
  v18 = -[PDAppletSubcredentialManager init](&v37, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_daManager, a6);
    objc_storeStrong((id *)&v19->_carKeyRequirementsChecker, a7);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.passkit.credentialmanager", 0LL);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality",  v28,  v29,  v30,  v31,  v32,  v33,  v34));
    observers = v19->_observers;
    v19->_observers = (NSHashTable *)v22;

    v19->_observersLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v19->_databaseManager, a3);
    objc_storeStrong((id *)&v19->_cardFileManager, a4);
    objc_storeStrong((id *)&v19->_webServiceCoordinator, a5);
    objc_storeStrong((id *)&v19->_secureElement, a8);
    objc_storeStrong((id *)&v19->_assertionManager, a9);
    objc_storeStrong((id *)&v19->_notificationManager, a10);
    -[PDPaymentWebServiceCoordinator registerObserver:](v19->_webServiceCoordinator, "registerObserver:", v19);
    -[PDAssertionManager registerObserver:](v19->_assertionManager, "registerObserver:", v19);
    PDNFSecureXPCRegisterAccessKeyEventObserver(v19);
    id v24 = PDUtilityQueue();
    v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10015C570;
    block[3] = &unk_100639300;
    v36 = v19;
    dispatch_block_t v26 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v25, v26);
  }

  return v19;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDAppletSubcredentialManager;
  -[PDAppletSubcredentialManager dealloc](&v3, "dealloc");
}

- (id)sharedCredentialManifestForPass:(id)a3
{
  id v4 = a3;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 devicePaymentApplications]);
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v30;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v29 + 1) + 8 * (void)i) subcredentials]);
        id v10 = [v9 count];

        if (v10)
        {

          v11 = (void *)objc_claimAutoreleasedReturnValue([v4 dataAccessor]);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKSecureElement secureElementIdentifiers](self->_secureElement, "secureElementIdentifiers"));
          v5 = (void *)objc_claimAutoreleasedReturnValue([v11 remoteAssetManagerForSEIDs:v12]);

          __int128 v27 = 0u;
          __int128 v28 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          v13 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceSpecificItems]);
          id v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v14)
          {
            id v15 = v14;
            id v24 = v4;
            uint64_t v16 = *(void *)v26;
            uint64_t v17 = PKSharedCredentialsAssetName;
            while (2)
            {
              for (j = 0LL; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v26 != v16) {
                  objc_enumerationMutation(v13);
                }
                v19 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)j);
                dispatch_queue_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 localURL]);
                v21 = (void *)objc_claimAutoreleasedReturnValue([v20 lastPathComponent]);
                unsigned __int8 v22 = [v21 hasPrefix:v17];

                if ((v22 & 1) != 0)
                {
                  id v6 = v19;

                  goto LABEL_20;
                }
              }

              id v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v15) {
                continue;
              }
              break;
            }

            id v6 = 0LL;
LABEL_20:
            id v4 = v24;
          }

          else
          {
            id v6 = 0LL;
          }

          goto LABEL_23;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8 && v9)
  {
    if (v13)
    {
      int v17 = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Updating credential metadata for pass (%@): %@",  (uint8_t *)&v17,  0x16u);
    }

    databaseManager = self->_databaseManager;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v9));
    BOOL v16 = -[PDDatabaseManager updateAppletSubcredentials:](databaseManager, "updateAppletSubcredentials:", v15);

    -[PDAppletSubcredentialManager didUpdateCredential:onPassWithIdentifier:]( self,  "didUpdateCredential:onPassWithIdentifier:",  v9,  v8);
    if (!v10) {
      goto LABEL_12;
    }
LABEL_11:
    v10[2](v10, (id)v16);
    goto LABEL_12;
  }

  if (v13)
  {
    LOWORD(v17) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Invalid parameters to update credential metadata",  (uint8_t *)&v17,  2u);
  }

  if (v10)
  {
    BOOL v16 = 0LL;
    goto LABEL_11;
  }

- (void)handlePaymentApplicationsAddedOrUpdatedOnPass:(id)a3 oldShares:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[PDAppletSubcredentialManager _ingestSEBlobsForPass:](self, "_ingestSEBlobsForPass:", v6);
  -[PDAppletSubcredentialManager _ingestSubcredentialConfigurationsForPass:]( self,  "_ingestSubcredentialConfigurationsForPass:",  v6);
  if ([v6 isCarKeyPass])
  {
    v42 = v6;
    v43 = v7;
    v40 = self;
    v41 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passSharesForPassUniqueIdentifier:]( self->_databaseManager,  "passSharesForPassUniqueIdentifier:"));
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    id obj = v8;
    id v10 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v60;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v60 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 credentialShares]);
          id v16 = [v15 countByEnumeratingWithState:&v55 objects:v69 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v56;
            do
            {
              for (j = 0LL; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v56 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)j);
                v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v20, v21);
              }

              id v17 = [v15 countByEnumeratingWithState:&v55 objects:v69 count:16];
            }

            while (v17);
          }
        }

        id v11 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
      }

      while (v11);
    }

    unsigned __int8 v22 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v44 = v43;
    id v23 = [v44 countByEnumeratingWithState:&v51 objects:v68 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v46 = *(void *)v52;
      do
      {
        for (k = 0LL; k != v24; k = (char *)k + 1)
        {
          if (*(void *)v52 != v46) {
            objc_enumerationMutation(v44);
          }
          __int128 v26 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)k);
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 credentialShares]);
          id v28 = [v27 countByEnumeratingWithState:&v47 objects:v67 count:16];
          if (v28)
          {
            id v29 = v28;
            uint64_t v30 = *(void *)v48;
            do
            {
              for (m = 0LL; m != v29; m = (char *)m + 1)
              {
                if (*(void *)v48 != v30) {
                  objc_enumerationMutation(v27);
                }
                __int128 v32 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)m);
                if ((PKShareStatusIsPendingVerification([v32 status]) & 1) == 0)
                {
                  id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 identifier]);
                  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v33));

                  if (!v34) {
                    -[NSMutableSet addObject:](v22, "addObject:", v33);
                  }
                }
              }

              id v29 = [v27 countByEnumeratingWithState:&v47 objects:v67 count:16];
            }

            while (v29);
          }
        }

        id v24 = [v44 countByEnumeratingWithState:&v51 objects:v68 count:16];
      }

      while (v24);
    }

    id v6 = v42;
    v35 = (void *)objc_claimAutoreleasedReturnValue([v42 devicePrimaryPaymentApplication]);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 subcredentials]);
    objc_super v37 = (void *)objc_claimAutoreleasedReturnValue([v36 anyObject]);

    if (v37 && -[NSMutableSet count](v22, "count"))
    {
      uint64_t Object = PKLogFacilityTypeGetObject(22LL);
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v64 = v22;
        __int16 v65 = 2112;
        v66 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Removing %@ credential shares for pass %@",  buf,  0x16u);
      }

      -[PKDAManager removeSharedCredentialsWithIdentifiers:credential:completion:]( v40->_daManager,  "removeSharedCredentialsWithIdentifiers:credential:completion:",  v22,  v37,  0LL);
    }

    id v7 = v43;
  }
}

- (void)passAddedOrUpdated:(id)a3 oldPass:(id)a4 oldShares:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  -[PDAppletSubcredentialManager handlePaymentApplicationsAddedOrUpdatedOnPass:oldShares:]( self,  "handlePaymentApplicationsAddedOrUpdatedOnPass:oldShares:",  v8,  a5);
  if ([v8 isCarKeyPass])
  {
    v40 = self;
    v42 = v8;
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v41 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 devicePaymentApplications]);
    id v12 = [v11 countByEnumeratingWithState:&v60 objects:v67 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v61;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v61 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          __int128 v59 = 0u;
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 subcredentials]);
          id v18 = [v17 countByEnumeratingWithState:&v56 objects:v66 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v57;
            do
            {
              for (j = 0LL; j != v19; j = (char *)j + 1)
              {
                if (*(void *)v57 != v20) {
                  objc_enumerationMutation(v17);
                }
                unsigned __int8 v22 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)j);
                if ([v22 state] == (id)1)
                {
                  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
                  -[NSMutableSet addObject:](v10, "addObject:", v23);
                }
              }

              id v19 = [v17 countByEnumeratingWithState:&v56 objects:v66 count:16];
            }

            while (v19);
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v60 objects:v67 count:16];
      }

      while (v13);
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue([v42 uniqueID]);
    id v24 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v42 devicePaymentApplications]);
    id v26 = [v25 countByEnumeratingWithState:&v52 objects:v65 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v53;
      do
      {
        for (k = 0LL; k != v27; k = (char *)k + 1)
        {
          if (*(void *)v53 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)k);
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "subcredentials", v39));
          id v32 = [v31 countByEnumeratingWithState:&v48 objects:v64 count:16];
          if (v32)
          {
            id v33 = v32;
            uint64_t v34 = *(void *)v49;
            do
            {
              for (m = 0LL; m != v33; m = (char *)m + 1)
              {
                if (*(void *)v49 != v34) {
                  objc_enumerationMutation(v31);
                }
                -[NSMutableSet addObject:](v24, "addObject:", *(void *)(*((void *)&v48 + 1) + 8LL * (void)m));
              }

              id v33 = [v31 countByEnumeratingWithState:&v48 objects:v64 count:16];
            }

            while (v33);
          }
        }

        id v27 = [v25 countByEnumeratingWithState:&v52 objects:v65 count:16];
      }

      while (v27);
    }

    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10015D2D0;
    v43[3] = &unk_10063ADE8;
    id v44 = v24;
    v45 = v10;
    uint64_t v46 = v40;
    id v47 = v39;
    id v36 = v39;
    objc_super v37 = v10;
    v38 = v24;
    -[PDAppletSubcredentialManager _inflateSubcredentialsInDatabaseWithDeviceProperties:withCompletion:]( v40,  "_inflateSubcredentialsInDatabaseWithDeviceProperties:withCompletion:",  v38,  v43);

    id v9 = v41;
    id v8 = v42;
  }
}

- (void)revokeSubcredentials:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_daManager)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Revoking credentials %@", buf, 0xCu);
    }

    id v11 = (void *)PDOSTransactionCreate("PDAppletSubcredentialManager.revoke");
    daManager = self->_daManager;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10015D58C;
    v15[3] = &unk_10063F520;
    id v16 = v11;
    id v17 = v8;
    id v14 = v11;
    -[PKDAManager deleteCredentials:completion:](daManager, "deleteCredentials:completion:", v13, v15);
  }

  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)revokeSubcredentialsForIdentifiers:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  daManager = self->_daManager;
  if (daManager)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10015D65C;
    v10[3] = &unk_1006415E8;
    id v11 = v7;
    -[PKDAManager deleteCredentialsForIdentifiers:completion:]( daManager,  "deleteCredentialsForIdentifiers:completion:",  v6,  v10);
  }

  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)revokeSubcredentialsForReaderIdentifiers:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  daManager = self->_daManager;
  if (daManager)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10015D72C;
    v10[3] = &unk_1006415E8;
    id v11 = v7;
    -[PKDAManager deleteCredentialsForReaderIdentifiers:completion:]( daManager,  "deleteCredentialsForReaderIdentifiers:completion:",  v6,  v10);
  }

  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)revokeSubcredentialForIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  daManager = self->_daManager;
  if (daManager)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10015D7FC;
    v10[3] = &unk_1006424D0;
    id v11 = v7;
    -[PKDAManager deleteCredential:completion:](daManager, "deleteCredential:completion:", v6, v10);
  }

  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)canAcceptInvitation:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    uint64_t v8 = (uint64_t)[v6 supportedRadioTechnologies];
    if (!v8)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(22LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v57 = (uint64_t)v6;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Defaulting to NFC due to missing or invalid radioTechnologies for invitation: %@",  buf,  0xCu);
      }

      uint64_t v8 = 1LL;
    }

    if (PKRadioTechnologyForConfigurationTechnology(v8))
    {
      if (-[PDCarKeyRequirementsChecker deviceSupportsCredentials]( self->_carKeyRequirementsChecker,  "deviceSupportsCredentials"))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 pairedReaderIdentifier]);
        if (v11)
        {
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          v38 = v11;
          id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passesWithPairedReaderIdentifier:]( self->_databaseManager,  "passesWithPairedReaderIdentifier:",  v11));
          id v13 = [v12 countByEnumeratingWithState:&v39 objects:v51 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v40;
            while (2)
            {
              for (i = 0LL; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v40 != v15) {
                  objc_enumerationMutation(v12);
                }
                id v17 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
                id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 devicePrimaryPaymentApplication]);
                id v19 = [v18 state];

                if (v19 != (id)10)
                {
                  uint64_t v26 = PKSubcredentialProvisioningErrorDomain;
                  NSErrorUserInfoKey v49 = NSDebugDescriptionErrorKey;
                  id v27 = objc_alloc(&OBJC_CLASS___NSString);
                  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueID]);
                  uint64_t v28 = -[NSString initWithFormat:](v27, "initWithFormat:", @"Conflicting Pass with ID: %@", v20);
                  __int128 v50 = v28;
                  id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
                  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v26,  11LL,  v29));
                  v7[2](v7, v30);

                  id v11 = v38;
                  goto LABEL_30;
                }
              }

              id v14 = [v12 countByEnumeratingWithState:&v39 objects:v51 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }

          id v11 = v38;
        }

        if (![v6 type])
        {
          uint64_t v33 = objc_claimAutoreleasedReturnValue([v6 identifier]);
          if (v33)
          {
            id v12 = (void *)v33;
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager invitationWithIdentifier:]( self->_databaseManager,  "invitationWithIdentifier:",  v33));

            if (!v34)
            {
              uint64_t v35 = PKSubcredentialProvisioningErrorDomain;
              NSErrorUserInfoKey v47 = NSDebugDescriptionErrorKey;
              __int128 v48 = @"No invitation with that identifier found";
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
              id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v35,  15LL,  v20));
              v7[2](v7, v36);

              goto LABEL_30;
            }

            goto LABEL_20;
          }

          if (!v11)
          {
            uint64_t v37 = PKSubcredentialProvisioningErrorDomain;
            NSErrorUserInfoKey v45 = NSDebugDescriptionErrorKey;
            uint64_t v46 = @"Invalid invitation: no invite id or reader id";
            id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v37,  12LL,  v12));
LABEL_29:
            v7[2](v7, v20);
LABEL_30:

            goto LABEL_31;
          }
        }

        id v12 = 0LL;
LABEL_20:
        if (-[PDCarKeyRequirementsChecker carAccessFeatureAvailable]( self->_carKeyRequirementsChecker,  "carAccessFeatureAvailable"))
        {
          uint64_t v20 = 0LL;
        }

        else
        {
          uint64_t v31 = PKSubcredentialProvisioningErrorDomain;
          NSErrorUserInfoKey v43 = NSDebugDescriptionErrorKey;
          id v44 = @"Software not supported";
          id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v31,  21LL,  v32));
        }

        goto LABEL_29;
      }

      uint64_t v23 = PKSubcredentialProvisioningErrorDomain;
      NSErrorUserInfoKey v52 = NSDebugDescriptionErrorKey;
      __int128 v53 = @"Hardware not supported";
      id v24 = &v53;
      __int128 v25 = &v52;
    }

    else
    {
      uint64_t v21 = PKLogFacilityTypeGetObject(22LL);
      unsigned __int8 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v57 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Device does not support the radio technologies %lu",  buf,  0xCu);
      }

      uint64_t v23 = PKSubcredentialProvisioningErrorDomain;
      NSErrorUserInfoKey v54 = NSDebugDescriptionErrorKey;
      __int128 v55 = @"Radio technology not supported";
      id v24 = &v55;
      __int128 v25 = &v54;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v25,  1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v23,  20LL,  v11));
    v7[2](v7, v12);
LABEL_31:
  }
}

- (void)credentialsOnDeviceWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  daManager = self->_daManager;
  if (daManager)
  {
    id v6 = v4;
    -[PKDAManager listCredentialsWithCompletion:](daManager, "listCredentialsWithCompletion:");
LABEL_5:
    id v4 = v6;
    goto LABEL_6;
  }

  if (v4)
  {
    id v6 = v4;
    v4[2](v4, 0LL);
    goto LABEL_5;
  }

- (void)requestRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Attempting to register credential: %@",  buf,  0xCu);
  }

  id v10 = (void *)PDOSTransactionCreate("PDAppletSubcredentialManager.credential.register");
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10015E0A4;
  v32[3] = &unk_100646A50;
  id v11 = v7;
  id v33 = v11;
  id v12 = objc_retainBlock(v32);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10015E0C0;
  v27[3] = &unk_100646B18;
  id v13 = v10;
  id v28 = v13;
  objc_copyWeak(&v31, &location);
  id v14 = v12;
  id v30 = v14;
  id v15 = v6;
  id v29 = v15;
  id v16 = objc_retainBlock(v27);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10015E6D0;
  v21[3] = &unk_100646B90;
  objc_copyWeak(&v26, &location);
  id v17 = v13;
  id v22 = v17;
  id v18 = v11;
  id v24 = v18;
  id v19 = v15;
  id v23 = v19;
  uint64_t v20 = v16;
  id v25 = v20;
  -[PDAppletSubcredentialManager createRegistrationRequestForCredentialWithIdentifier:completion:]( self,  "createRegistrationRequestForCredentialWithIdentifier:completion:",  v19,  v21);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&location);
}

- (void)requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10015EC38;
  v5[3] = &unk_100646BB8;
  objc_copyWeak(&v6, &location);
  -[PDAppletSubcredentialManager createRegistrationRequestForCredentialWithIdentifier:completion:]( self,  "createRegistrationRequestForCredentialWithIdentifier:completion:",  v4,  v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)passWillBeRemoved:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 devicePaymentApplications]);
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)i) subcredentials]);
        if ([v11 count])
        {
          if (v8) {
            [v8 unionSet:v11];
          }
          else {
            id v8 = [v11 mutableCopy];
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  else
  {
    id v8 = 0LL;
  }

  if ([v8 count])
  {
    webServiceCoordinator = self->_webServiceCoordinator;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10015EE2C;
    v13[3] = &unk_10063A700;
    v13[4] = self;
    id v14 = v8;
    -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( webServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v13);
  }
}

- (void)restoreSubcredentialsInDatabase:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Restoring credentials in database: %@",  buf,  0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10015EF44;
  v9[3] = &unk_100639610;
  id v10 = v5;
  id v8 = v5;
  -[PDAppletSubcredentialManager _inflateSubcredentialsInDatabaseWithDeviceProperties:withCompletion:]( self,  "_inflateSubcredentialsInDatabaseWithDeviceProperties:withCompletion:",  v8,  v9);
}

- (void)_inflateSubcredentialsInDatabaseWithDeviceProperties:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10015F0E4;
    v8[3] = &unk_1006415C0;
    id v9 = v6;
    id v10 = self;
    id v11 = v7;
    -[PDAppletSubcredentialManager credentialsOnDeviceWithCompletion:](self, "credentialsOnDeviceWithCompletion:", v8);
  }

  else if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1LL);
  }
}

- (BOOL)addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Adding share %@ on credential: %@",  (uint8_t *)&v13,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierWithCredentialIdentifier:]( self->_databaseManager,  "passUniqueIdentifierWithCredentialIdentifier:",  v7));
  -[PDDatabaseManager addPassShare:forPassUniqueIdentifier:]( self->_databaseManager,  "addPassShare:forPassUniqueIdentifier:",  v6,  v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager appletSubcredentialWithIdentifier:]( self->_databaseManager,  "appletSubcredentialWithIdentifier:",  v7));
  -[PDAppletSubcredentialManager didUpdateCredential:onPassWithIdentifier:]( self,  "didUpdateCredential:onPassWithIdentifier:",  v11,  v10);

  return 1;
}

- (BOOL)sharingInvitationReceiptWasInvalidated:(id)a3 withCredentialIdentifier:(id)a4 error:(id)a5
{
  id v8 = a3;
  unint64_t v9 = (unint64_t)a4;
  unint64_t v10 = (unint64_t)a5;
  id v11 = (void *)v10;
  if (v8)
  {
    if (v9 | v10)
    {
      if (!v9 || v10)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(22LL);
        __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412546;
          id v22 = v8;
          __int16 v23 = 2112;
          id v24 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Sharing invite (%@) failed or was declined: %@",  (uint8_t *)&v21,  0x16u);
        }

        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v8));
        BOOL v12 = -[PDAppletSubcredentialManager removeSharingInvitationReceiptWithIdentifiers:onCredential:]( self,  "removeSharingInvitationReceiptWithIdentifiers:onCredential:",  v19,  v9);
      }

      else
      {
        BOOL v12 = -[PDAppletSubcredentialManager createdSharedSubcredentialWithIdentifier:fromSharingInvitationIdentifier:]( self,  "createdSharedSubcredentialWithIdentifier:fromSharingInvitationIdentifier:",  v9,  v8);
      }
    }

    else
    {
      uint64_t v15 = PKLogFacilityTypeGetObject(22LL);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
      }

      BOOL v12 = 1;
    }
  }

  else
  {
    uint64_t v13 = PKLogFacilityTypeGetObject(22LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Invalidated recipient with no identifier.",  (uint8_t *)&v21,  2u);
    }

    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4
{
  id v6 = a3;
  id v22 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager appletSubcredentialForSharedCredentialWithIdentifier:]( self->_databaseManager,  "appletSubcredentialForSharedCredentialWithIdentifier:"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierWithCredentialIdentifier:]( self->_databaseManager,  "passUniqueIdentifierWithCredentialIdentifier:",  v8));
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passSharesForPassUniqueIdentifier:]( self->_databaseManager,  "passSharesForPassUniqueIdentifier:",  v9));
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  uint64_t v30 = 0LL;
  databaseManager = self->_databaseManager;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10015F928;
  v23[3] = &unk_100644E28;
  id v12 = v6;
  id v24 = v12;
  id v25 = self;
  id v26 = &v27;
  -[PDDatabaseManager performTransactionWithBlock:](databaseManager, "performTransactionWithBlock:", v23);
  id v13 = [v12 count];
  id v14 = (void *)v28[3];
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v9 && v7 && v14)
  {
    if (v17)
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      *(_DWORD *)buf = 134218754;
      id v32 = v14;
      __int16 v33 = 2048;
      id v34 = v13;
      __int16 v35 = 2112;
      id v36 = v18;
      __int16 v37 = 2112;
      id v38 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Removed %ld/%ld sharing invitation receipts from credential (%@): %@",  buf,  0x2Au);
    }

    -[PDAppletSubcredentialManager didUpdateCredential:onPassWithIdentifier:oldShares:]( self,  "didUpdateCredential:onPassWithIdentifier:oldShares:",  v7,  v9,  v10);
  }

  else
  {
    if (v17)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      *(_DWORD *)buf = 138412546;
      id v32 = v19;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Failed to remove sharing invitation receipts from credential (%@): %@",  buf,  0x16u);
    }
  }

  BOOL v20 = v28[3] == (void)v13;

  _Block_object_dispose(&v27, 8);
  return v20;
}

- (BOOL)createdSharedSubcredentialWithIdentifier:(id)a3 fromSharingInvitationIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager appletSubcredentialForSharedCredentialWithIdentifier:]( self->_databaseManager,  "appletSubcredentialForSharedCredentialWithIdentifier:",  v7));
  databaseManager = self->_databaseManager;
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierFromAppletSubcredentialIdentifier:]( databaseManager,  "passUniqueIdentifierFromAppletSubcredentialIdentifier:",  v10));

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passSharesForPassUniqueIdentifier:]( self->_databaseManager,  "passSharesForPassUniqueIdentifier:",  v11));
  uint64_t v33 = 0LL;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  id v36 = sub_10015FDA0;
  __int16 v37 = sub_10015FDB0;
  id v38 = 0LL;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_10015FDA0;
  id v31 = sub_10015FDB0;
  id v32 = 0LL;
  id v13 = self->_databaseManager;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10015FDB8;
  v22[3] = &unk_100646BE0;
  id v25 = &v27;
  v22[4] = self;
  id v14 = v7;
  id v23 = v14;
  id v15 = v6;
  id v24 = v15;
  id v26 = &v33;
  -[PDDatabaseManager performTransactionWithBlock:](v13, "performTransactionWithBlock:", v22);
  id v16 = (void *)v28[5];
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v15;
      __int16 v41 = 2112;
      id v42 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "RecipientKeyID %@ accepted invite. Share: %@",  buf,  0x16u);
    }

    -[PDAppletSubcredentialManager didUpdateCredential:onPassWithIdentifier:oldShares:]( self,  "didUpdateCredential:onPassWithIdentifier:oldShares:",  v34[5],  v11,  v12);
  }

  else
  {
    if (v19)
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v14;
      __int16 v41 = 2112;
      id v42 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Failed to create shared credential from invitationID %@ and ReceiptKeyID %@",  buf,  0x16u);
    }
  }

  BOOL v20 = v28[5] != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

- (void)trackSharedCredential:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  if (PKV2SharingFlowEnabled(v7, v8))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    v7[2](v7, 1LL);
    goto LABEL_29;
  }

  if (v6)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierFromAppletSubcredentialIdentifier:]( self->_databaseManager,  "passUniqueIdentifierFromAppletSubcredentialIdentifier:",  v11));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passSharesForSubcredentialIdentifier:]( self->_databaseManager,  "passSharesForSubcredentialIdentifier:",  v11));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

    if (v12)
    {
LABEL_20:
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 trackingRequest]);
      if (v23)
      {
        uint64_t v24 = PKLogFacilityTypeGetObject(22LL);
        id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v37 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Tracking shared credential: %@",  buf,  0xCu);
        }

        -[PDAppletSubcredentialManager _trackCredential:withRegistrationData:completion:]( self,  "_trackCredential:withRegistrationData:completion:",  v6,  v23,  v7);
      }

      else
      {
        objc_initWeak(&location, self);
        uint64_t v26 = PKLogFacilityTypeGetObject(22LL);
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v37 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Unable to track shared credential (%@) - missing tracking request",  buf,  0xCu);
        }

        id v28 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v6, 0LL);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_100160378;
        v32[3] = &unk_100646C30;
        objc_copyWeak(&v34, &location);
        uint64_t v33 = v7;
        -[PDAppletSubcredentialManager revokeSubcredentials:withCompletion:]( self,  "revokeSubcredentials:withCompletion:",  v28,  v32);

        os_unfair_lock_lock(&self->_observersLock);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
        os_unfair_lock_unlock(&self->_observersLock);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_1001604B8;
        v30[3] = &unk_100646C58;
        v30[4] = self;
        id v31 = v6;
        [v29 enumerateObjectsUsingBlock:v30];

        objc_destroyWeak(&v34);
        objc_destroyWeak(&location);
      }

LABEL_28:
      goto LABEL_29;
    }

    if (v14 && PKShareStatusIsPendingVerification([v14 status]))
    {
      uint64_t v15 = PKLogFacilityTypeGetObject(22LL);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

        goto LABEL_20;
      }

      *(_DWORD *)buf = 138412290;
      __int16 v37 = v11;
      BOOL v17 = "Tracking credential with active share: %@";
    }

    else
    {
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDAssertionManager assertionsOfType:](self->_assertionManager, "assertionsOfType:", 1LL));

      uint64_t v21 = PKLogFacilityTypeGetObject(22LL);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v21);
      BOOL v22 = os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT);
      if (!v20)
      {
        if (v22)
        {
          *(_DWORD *)buf = 138412290;
          __int16 v37 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "Failed to track unknown pass with credential identifier: %@",  buf,  0xCu);
        }

        if (v7) {
          v7[2](v7, 0LL);
        }
        goto LABEL_28;
      }

      if (!v22) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138412290;
      __int16 v37 = v11;
      BOOL v17 = "Tracking credential with no associated pass due to provisioning assertion: %@";
    }

    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
    goto LABEL_19;
  }

  uint64_t v18 = PKLogFacilityTypeGetObject(22LL);
  BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Missing shared credential to track", buf, 2u);
  }

  if (v7) {
    v7[2](v7, 0LL);
  }
LABEL_29:
}

- (NSSet)invitations
{
  return (NSSet *)-[PDDatabaseManager invitations](self->_databaseManager, "invitations");
}

- (BOOL)didReceiveSharingInvitationWithIdentifier:(id)a3 fromOriginatorIDSHandle:(id)a4 sharingSessionIdentifier:(id)a5 metadata:(id)a6
{
  unint64_t v10 = (PKAppletSubcredentialSharingInvitation *)a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = -[PKAppletSubcredentialSharingInvitation initWithIdentifier:sharingSessionIdentifier:originatorIDSHandle:invitationData:]( objc_alloc(&OBJC_CLASS___PKAppletSubcredentialSharingInvitation),  "initWithIdentifier:sharingSessionIdentifier:originatorIDSHandle:invitationData:",  v10,  v12,  v13,  v11);

  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (!v14)
  {
    if (v17)
    {
      int v21 = 138412290;
      BOOL v22 = v10;
      BOOL v19 = "Received invialid sharing invitation with identifier: %@";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v21, 0xCu);
    }

- (BOOL)removeSharingInvitationWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[PDDatabaseManager deleteInvitationWithIdentifier:]( self->_databaseManager,  "deleteInvitationWithIdentifier:",  v4);
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      int v11 = 138412290;
      id v12 = v4;
      unint64_t v9 = "Removed sharing invitation %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
    }
  }

  else if (v8)
  {
    int v11 = 138412290;
    id v12 = v4;
    unint64_t v9 = "Unable to remove sharing invitation %@";
    goto LABEL_6;
  }

  return v5;
}

- (BOOL)didUpdateSharingInvitationWithIdentifier:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t updated = PKSharingInvitationUpdateReasonToString(a4);
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(updated);
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Sharing invitation (%@) was update with reason: %@",  (uint8_t *)&v13,  0x16u);
  }

  else {
    BOOL v11 = -[PDAppletSubcredentialManager removeSharingInvitationWithIdentifier:]( self,  "removeSharingInvitationWithIdentifier:",  v6);
  }

  return v11;
}

- (void)declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Declining invitations related to: %@",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100160A44;
  v12[3] = &unk_100646CF8;
  objc_copyWeak(&v15, (id *)buf);
  id v10 = v7;
  id v14 = v10;
  id v11 = v6;
  id v13 = v11;
  -[PDAppletSubcredentialManager canAcceptInvitation:withCompletion:]( self,  "canAcceptInvitation:withCompletion:",  v11,  v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (BOOL)handleSharingInvitationRequest:(id)a3
{
  id v40 = (os_log_s *)a3;
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v55 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Received sharing invitation request: %@",  buf,  0xCu);
  }

  oslog = v4;

  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s credentialIdentifier](v40, "credentialIdentifier"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[os_log_s sharedCredentialIdentifier](v40, "sharedCredentialIdentifier"));
  id v6 = (void *)v5;
  if (v39 && v5)
  {
    if (-[os_log_s deviceType](v40, "deviceType"))
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v7 = "Dropping sharing invitation request for unsupported device type.";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
        goto LABEL_11;
      }

      goto LABEL_11;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager appletSubcredentialWithIdentifier:]( self->_databaseManager,  "appletSubcredentialWithIdentifier:",  v39));
    uint64_t v33 = v10;
    if (v10)
    {
      if ([v10 canShare])
      {
        databaseManager = self->_databaseManager;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v33 identifier]);
        uint64_t v32 = objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierWithCredentialIdentifier:]( databaseManager,  "passUniqueIdentifierWithCredentialIdentifier:",  v12));

        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passSharesForPassUniqueIdentifier:]( self->_databaseManager,  "passSharesForPassUniqueIdentifier:",  v32));
        id v13 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (!v13)
        {
LABEL_32:

          BOOL v22 = oslog;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            __int128 v55 = v40;
            _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "No known associated share found for invitation request: %@",  buf,  0xCu);
          }

          goto LABEL_44;
        }

        uint64_t v36 = *(void *)v51;
LABEL_17:
        uint64_t v14 = 0LL;
        while (1)
        {
          if (*(void *)v51 != v36) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v50 + 1) + 8 * v14);
          __int128 v46 = 0u;
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "credentialShares", v32));
          id v17 = [v16 countByEnumeratingWithState:&v46 objects:v58 count:16];
          if (v17) {
            break;
          }
LABEL_28:

LABEL_30:
          if ((id)++v14 == v13)
          {
            id v13 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
            if (!v13) {
              goto LABEL_32;
            }
            goto LABEL_17;
          }
        }

        uint64_t v18 = *(void *)v47;
LABEL_22:
        uint64_t v19 = 0LL;
        while (1)
        {
          if (*(void *)v47 != v18) {
            objc_enumerationMutation(v16);
          }
          BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v46 + 1) + 8 * v19) identifier]);
          char v21 = PKEqualObjects(v20, v6);

          if ((v21 & 1) != 0) {
            break;
          }
          if (v17 == (id)++v19)
          {
            id v17 = [v16 countByEnumeratingWithState:&v46 objects:v58 count:16];
            if (v17) {
              goto LABEL_22;
            }
            goto LABEL_28;
          }
        }

        BOOL v22 = v15;

        if (!v22) {
          goto LABEL_30;
        }

        if (PKShareStatusIsTerminal(-[os_log_s status](v22, "status")))
        {
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            __int128 v55 = v22;
            __int16 v56 = 2112;
            uint64_t v57 = v40;
            _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Invalid state on associated shared credential (%@) for invitation request: %@",  buf,  0x16u);
          }

LABEL_44:
          BOOL v8 = 0;
LABEL_55:

          id v4 = (os_log_s *)v32;
          goto LABEL_56;
        }

        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager objectWithUniqueID:](self->_cardFileManager, "objectWithUniqueID:", v32));
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 paymentPass]);

        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s sharedEntitlements](v22, "sharedEntitlements"));
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 firstObject]);
        __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v27 entitlementIdentifier]);

        id v28 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passEntitlementForIdentifier:passIdentifier:]( self->_databaseManager,  "passEntitlementForIdentifier:passIdentifier:",  v37,  v32));
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[PKAppletSubcredentialSharingInvitation invitationFromShare:entitlement:withCredential:pass:]( &OBJC_CLASS___PKAppletSubcredentialSharingInvitation,  "invitationFromShare:entitlement:withCredential:pass:",  v22,  v28,  v33,  v25));
        objc_msgSend(v29, "setForWatch:", -[os_log_s deviceType](v40, "deviceType") == 0);
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s sharingSessionIdentifier](v40, "sharingSessionIdentifier"));
        [v29 setSharingSessionIdentifier:v30];

        if (v29)
        {
          if (self->_daManager)
          {
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              __int128 v55 = v40;
              __int16 v56 = 2112;
              uint64_t v57 = (os_log_s *)v29;
              _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Sharing invitation request (%@) to be fufilled with invite: %@",  buf,  0x16u);
            }

            objc_initWeak((id *)buf, self);
            daManager = self->_daManager;
            v41[0] = _NSConcreteStackBlock;
            v41[1] = 3221225472LL;
            v41[2] = sub_100161878;
            v41[3] = &unk_100646D20;
            objc_copyWeak(&v45, (id *)buf);
            id v42 = v22;
            NSErrorUserInfoKey v43 = v40;
            id v44 = v39;
            -[PKDAManager sendSharingInvitation:forInvitationRequest:completion:]( daManager,  "sendSharingInvitation:forInvitationRequest:completion:",  v29,  v43,  v41);

            objc_destroyWeak(&v45);
            objc_destroyWeak((id *)buf);
            BOOL v8 = 1;
            goto LABEL_54;
          }
        }

        else
        {
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            __int128 v55 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Unable to create invite from existing share: %@",  buf,  0xCu);
          }
        }

        BOOL v8 = 0;
LABEL_54:

        goto LABEL_55;
      }

      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v55 = v40;
        id v23 = "Credential on sharing invitation request no longer can be shared: %@";
        goto LABEL_38;
      }
    }

    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v55 = v40;
      id v23 = "Unknown credential on sharing invitation request: %@";
LABEL_38:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
    }

    BOOL v8 = 0;
LABEL_56:

    id v4 = (os_log_s *)v33;
    goto LABEL_12;
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v7 = "Dropping malformed sharing invitation request.";
    goto LABEL_10;
  }

- (void)signData:(id)a3 auth:(id)a4 bundleIdentifier:(id)a5 nonce:(id)a6 credential:(id)a7 completion:(id)a8
{
}

- (void)startVehicleConnectionSessionWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (self->_activeVehicleConnectionSession)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Requesting to start vehicle connection session with one already active.",  buf,  2u);
    }

    goto LABEL_7;
  }

  if (!-[PDAssertionManager hasAssertionsOfType:](self->_assertionManager, "hasAssertionsOfType:", 8LL))
  {
LABEL_7:
    v7[2](v7, 0LL);
    goto LABEL_8;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v6));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 secureElementPass]);

  id v12 = -[PDVehicleConnectionSession initForSecureElementPass:delegate:]( objc_alloc(&OBJC_CLASS___PDVehicleConnectionSession),  "initForSecureElementPass:delegate:",  v11,  self);
  activeVehicleConnectionSession = self->_activeVehicleConnectionSession;
  self->_activeVehicleConnectionSession = v12;
  uint64_t v14 = v12;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100161BD4;
  v15[3] = &unk_10063D230;
  id v16 = v7;
  -[PDVehicleConnectionSession startSessionWithCompletion:](v14, "startSessionWithCompletion:", v15);

LABEL_8:
}

- (void)invalidateVehicleConnectionSessionForIdentifier:(id)a3
{
  activeVehicleConnectionSession = self->_activeVehicleConnectionSession;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDVehicleConnectionSession sessionIdentifier](activeVehicleConnectionSession, "sessionIdentifier"));
  unsigned int v7 = [v6 isEqualToString:v5];

  if (v7)
  {
    -[PDVehicleConnectionSession endSession](self->_activeVehicleConnectionSession, "endSession");
    BOOL v8 = self->_activeVehicleConnectionSession;
    self->_activeVehicleConnectionSession = 0LL;
  }

- (void)sendRKEPassThroughData:(id)a3 forSessionIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  unint64_t v9 = (void (**)(id, id, id))a5;
  activeVehicleConnectionSession = self->_activeVehicleConnectionSession;
  id v11 = a4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDVehicleConnectionSession sessionIdentifier](activeVehicleConnectionSession, "sessionIdentifier"));
  unsigned int v13 = [v12 isEqualToString:v11];

  if (v13)
  {
    uint64_t v14 = self->_activeVehicleConnectionSession;
    id v21 = 0LL;
    BOOL v15 = -[PDVehicleConnectionSession sendData:error:](v14, "sendData:error:", v8, &v21);
    id v16 = v21;
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 description]);
      *(_DWORD *)buf = 67109378;
      BOOL v23 = v15;
      __int16 v24 = 2112;
      id v25 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Passthrough message finished, %d, %@",  buf,  0x12u);
    }

    if (v9) {
      v9[2](v9, (id)v15, v16);
    }
  }

  else if (v9)
  {
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  2LL,  0LL));
    v9[2](v9, 0LL, v20);
  }
}

- (void)registerObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);

    os_unfair_lock_unlock(p_observersLock);
  }

- (void)unregisterObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

    os_unfair_lock_unlock(p_observersLock);
  }

- (void)sessionDidChangeConnectionStatus:(int64_t)a3
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
  os_unfair_lock_unlock(p_observersLock);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100161F44;
  v7[3] = &unk_100646D40;
  v7[4] = a3;
  [v6 enumerateObjectsUsingBlock:v7];
}

- (void)sessionDidReceiveData:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
  os_unfair_lock_unlock(&self->_observersLock);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10016203C;
  v7[3] = &unk_100646D68;
  id v8 = v4;
  id v5 = v4;
  [v6 enumerateObjectsUsingBlock:v7];
}

- (void)createRegistrationRequestForCredentialWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager appletSubcredentialWithIdentifier:]( self->_databaseManager,  "appletSubcredentialWithIdentifier:",  v6));
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Creating background request to register credential: %@",  buf,  0xCu);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100162218;
    v12[3] = &unk_100641D48;
    unsigned int v13 = (os_log_s *)v6;
    uint64_t v14 = self;
    id v15 = v8;
    id v16 = v7;
    -[PDAppletSubcredentialManager credentialsOnDeviceWithCompletion:](self, "credentialsOnDeviceWithCompletion:", v12);

    id v10 = v13;
  }

  else if (v11)
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Failed to register unknown credential: %@",  buf,  0xCu);
  }
}

- (void)_trackCredential:(id)a3 withRegistrationData:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  webServiceCoordinator = self->_webServiceCoordinator;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100162728;
  v15[3] = &unk_100646D90;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( webServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v15);
}

- (void)_removeBackgroundRegistrationRequestForCredentials:(id)a3 withPaymentWebService:(id)a4
{
  id v25 = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 backgroundContext]);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remainingTasks]);
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (!v8) {
    goto LABEL_22;
  }
  id v10 = v8;
  char v24 = 0;
  uint64_t v11 = *(void *)v28;
  uint64_t v26 = v7;
  do
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v28 != v11) {
        objc_enumerationMutation(v7);
      }
      id v13 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber, v9);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      {
        id v15 = [v13 unsignedIntegerValue];
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 backgroundDownloadRecordForTaskIdentifier:v15]);
        if ([v16 taskType] == (id)5)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 credentialIdentifier]);
          if (v17)
          {
            id v18 = -[PKAppletSubcredential initWithIdentifier:]( objc_alloc(&OBJC_CLASS___PKAppletSubcredential),  "initWithIdentifier:",  v17);
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v25 member:v18]);

            if (v19)
            {
              uint64_t Object = PKLogFacilityTypeGetObject(22LL);
              id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v32 = v17;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Removing background registration request for credential with identifier: %@",  buf,  0xCu);
              }

              [v6 removeBackgroundDownloadRecordForTaskIdentifier:v15];
              char v24 = 1;
            }
          }

          else
          {
            uint64_t v22 = PKLogFacilityTypeGetObject(22LL);
            BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Found background credential registration request with no identifier!",  buf,  2u);
            }
          }

          id v7 = v26;
        }
      }
    }

    id v10 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
  }

  while (v10);

  if ((v24 & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 archiver]);
    [v7 archiveBackgroundContext:v6];
LABEL_22:
  }
}

- (void)updateCredential:(id)a3 forPaymentApplication:(id)a4 rangingSuspensionReasons:(unint64_t)a5
{
}

- (void)didUpdateCredential:(id)a3 onPassWithIdentifier:(id)a4
{
}

- (void)didUpdateCredential:(id)a3 onPassWithIdentifier:(id)a4 oldShares:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v11 && v8)
  {
    os_unfair_lock_lock(&self->_observersLock);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
    os_unfair_lock_unlock(&self->_observersLock);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100162C18;
    v12[3] = &unk_100646DB8;
    void v12[4] = self;
    id v13 = v11;
    id v14 = v8;
    id v15 = v9;
    [v10 enumerateObjectsUsingBlock:v12];
  }
}

- (void)_downloadPassAtURL:(id)a3 credentialIdentifier:(id)a4 share:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v30 = a5;
  id v10 = (void *)PDOSTransactionCreate("PDAppletSubcredentialManager.pass.download");
  __int128 v29 = v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierWithCredentialIdentifier:]( self->_databaseManager,  "passUniqueIdentifierWithCredentialIdentifier:",  v9));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v11));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 secureElementPass]);

  unsigned int v14 = -[PDAssertionManager hasAssertionsOfType:](self->_assertionManager, "hasAssertionsOfType:", 1LL);
  if (v30)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v30 activationOptions]);
    unsigned int v16 = [v15 containsPinCode];
  }

  else
  {
    unsigned int v16 = 0;
  }

  if (v13) {
    unsigned int v17 = 0;
  }
  else {
    unsigned int v17 = v16;
  }
  if ((v14 & 1) != 0) {
    unsigned int v18 = 0;
  }
  else {
    unsigned int v18 = v17;
  }
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = @"No";
    if (v14) {
      uint64_t v22 = @"Yes";
    }
    else {
      uint64_t v22 = @"No";
    }
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v29;
    if (v16) {
      BOOL v23 = @"Yes";
    }
    else {
      BOOL v23 = @"No";
    }
    *(void *)&buf[14] = v22;
    *(_WORD *)&buf[12] = 2112;
    *(_WORD *)&buf[22] = 2112;
    if (v18) {
      id v21 = @"Yes";
    }
    __int128 v53 = (uint64_t (*)(uint64_t, uint64_t))v23;
    LOWORD(v54) = 2112;
    *(void *)((char *)&v54 + 2) = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Downloading pass after credential (%@) registration. Has provisioning assertion?: %@. isBackgroundProvisioning?: % @. Enable Express?: %@",  buf,  0x2Au);
  }

  id v24 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  __int128 v53 = sub_10015FDA0;
  *(void *)&__int128 v54 = sub_10015FDB0;
  *((void *)&v54 + 1) = 0LL;
  v50[0] = 0LL;
  v50[1] = v50;
  v50[2] = 0x3032000000LL;
  v50[3] = sub_10015FDA0;
  v50[4] = sub_10015FDB0;
  id v51 = 0LL;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_100163134;
  v48[3] = &unk_100646DE0;
  char v49 = v18;
  v48[4] = self;
  v48[5] = v50;
  [v24 addOperation:v48];
  v46[0] = 0LL;
  v46[1] = v46;
  v46[2] = 0x3032000000LL;
  v46[3] = sub_10015FDA0;
  v46[4] = sub_10015FDB0;
  id v47 = 0LL;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1001632D4;
  v43[3] = &unk_10063B5A8;
  void v43[4] = self;
  id v25 = v8;
  id v44 = v25;
  id v45 = v46;
  [v24 addOperation:v43];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_100163500;
  v42[3] = &unk_100641880;
  v42[4] = self;
  v42[5] = v46;
  v42[6] = buf;
  [v24 addOperation:v42];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100163670;
  v41[3] = &unk_10063BBC8;
  void v41[4] = self;
  v41[5] = v46;
  [v24 addOperation:v41];
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x2020000000LL;
  char v40 = 0;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100163774;
  v37[3] = &unk_100646EA8;
  char v38 = v18;
  v37[4] = self;
  v37[5] = v46;
  v37[6] = v39;
  [v24 addOperation:v37];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100163B0C;
  v36[3] = &unk_100646ED0;
  v36[5] = v39;
  v36[6] = v46;
  v36[4] = self;
  [v24 addOperation:v36];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100163C3C;
  v31[3] = &unk_100646EF8;
  id v27 = v10;
  id v32 = v27;
  uint64_t v33 = self;
  id v34 = v50;
  uint64_t v35 = buf;
  id v28 = [v24 evaluateWithInput:v26 completion:v31];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v46, 8);

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(buf, 8);
}

- (void)paymentWebServiceCoordinator:(id)a3 didRegisterCredentialWithIdentifier:(id)a4 response:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned int v14 = v13;
  if (!v12 || v13)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)char v40 = v11;
      *(_WORD *)&v40[8] = 2112;
      *(void *)&v40[10] = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Failed to register credential (%@) with error: %@",  buf,  0x16u);
    }
  }

  else
  {
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager appletSubcredentialWithIdentifier:]( self->_databaseManager,  "appletSubcredentialWithIdentifier:",  v11));
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passSharesForSubcredentialIdentifier:]( self->_databaseManager,  "passSharesForSubcredentialIdentifier:",  v11));
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);

    if (v17 && !v15) {
      id v15 = -[PKAppletSubcredential initWithIdentifier:]( objc_alloc(&OBJC_CLASS___PKAppletSubcredential),  "initWithIdentifier:",  v11);
    }
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v12 passURL]);
    uint64_t v19 = PKLogFacilityTypeGetObject(22LL);
    BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v17 identifier]);
      uint64_t v22 = v18;
      BOOL v23 = (void *)v21;
      id v24 = @"Yes";
      *(_DWORD *)buf = 138412802;
      *(void *)char v40 = v11;
      *(_WORD *)&v40[8] = 2112;
      if (!v22) {
        id v24 = @"No";
      }
      *(void *)&v40[10] = v21;
      __int16 v41 = 2112;
      id v42 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Received credential (%@) registration response. Share: %@ hasPassURL: %@",  buf,  0x20u);

      unsigned int v18 = v22;
    }

    if (v15)
    {
      uint64_t v35 = v18;
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 credentialAttestation]);
      if (v25)
      {
        uint64_t v33 = v17;
        id v34 = v10;
        uint64_t v26 = (void *)PDOSTransactionCreate("PDAppletSubcredentialManager.register");
        id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 vehicleMobilizationEncryptedContainer]);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v28 = -[os_log_s isOnlineImmobilizerToken](v15, "isOnlineImmobilizerToken");
          __int128 v29 = @"Yes";
          if (!v27) {
            __int128 v29 = @"No";
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)char v40 = v28;
          *(_WORD *)&v40[4] = 2112;
          *(void *)&v40[6] = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Credential isOnlineImmobilizerToken (%d). Has encryptedContainer: %@",  buf,  0x12u);
        }

        daManager = self->_daManager;
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472LL;
        v36[2] = sub_1001641B0;
        v36[3] = &unk_1006426D8;
        id v37 = v26;
        id v38 = v11;
        id v31 = v26;
        -[PKDAManager updateTrackingAttestation:forCredential:encryptedContainer:completion:]( daManager,  "updateTrackingAttestation:forCredential:encryptedContainer:completion:",  v25,  v15,  v27,  v36);

        unsigned int v17 = v33;
        id v10 = v34;
      }

      else
      {
        id v27 = v20;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)char v40 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Credential (%@) registration response missing attestation",  buf,  0xCu);
          id v27 = v20;
        }
      }

      unsigned int v18 = v35;
      if (v35)
      {
        -[PDAppletSubcredentialManager _downloadPassAtURL:credentialIdentifier:share:]( self,  "_downloadPassAtURL:credentialIdentifier:share:",  v35,  v11,  v17);
      }

      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)char v40 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "No pass to download after credential (%@) registration!",  buf,  0xCu);
        }
      }
    }

    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)char v40 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Unable to register credential (%@): credential no longer exists",  buf,  0xCu);
      }

      id v25 = v20;
    }
  }
}

- (void)updateSubcredentialsForBluetoothPowerChange
{
  BOOL v3 = -[PDCarKeyRequirementsChecker deviceSupportsCredentials]( self->_carKeyRequirementsChecker,  "deviceSupportsCredentials")
    && -[PKBluetoothMonitorer state](self->_bluetoothMonitorer, "state") == (id)5;
  -[PDAppletSubcredentialManager _updateSubcredentialsForBTEnabled:](self, "_updateSubcredentialsForBTEnabled:", v3);
}

- (void)_updateSubcredentialsForBTEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passUniqueIDs](self->_databaseManager, "passUniqueIDs"));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    if (v3) {
      uint64_t v9 = 0LL;
    }
    else {
      uint64_t v9 = 64LL;
    }
    uint64_t v26 = *(void *)v38;
    do
    {
      id v10 = 0LL;
      id v27 = v7;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)v10);
        id v12 = objc_autoreleasePoolPush();
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v11));
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 secureElementPass]);
        id v15 = v14;
        if (v14 && ([v14 supportedRadioTechnologies] & 2) != 0)
        {
          id v30 = v13;
          id v31 = v12;
          id v32 = v10;
          __int128 v29 = v15;
          unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 devicePrimaryPaymentApplication]);
          unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 subcredentials]);
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          id v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v34;
            do
            {
              for (i = 0LL; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v34 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
                if (([v22 supportedRadioTechnologies] & 2) != 0)
                {
                  databaseManager = self->_databaseManager;
                  id v24 = (void *)objc_claimAutoreleasedReturnValue([v16 applicationIdentifier]);
                  unint64_t v25 = -[PDDatabaseManager rangingSuspensionReasonForAppletSubcredential:forPaymentApplicationID:]( databaseManager,  "rangingSuspensionReasonForAppletSubcredential:forPaymentApplicationID:",  v22,  v24);

                  -[PDAppletSubcredentialManager _setRangingSuspensionReason:forCredential:forPaymentApplication:]( self,  "_setRangingSuspensionReason:forCredential:forPaymentApplication:",  v25 & 0xFFFFFFFFFFFFFFBFLL | v9,  v22,  v16);
                }
              }

              id v19 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }

            while (v19);
          }

          uint64_t v8 = v26;
          id v7 = v27;
          id v12 = v31;
          id v10 = v32;
          id v15 = v29;
          id v13 = v30;
        }

        objc_autoreleasePoolPop(v12);
        id v10 = (char *)v10 + 1;
      }

      while (v10 != v7);
      id v7 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }

    while (v7);
  }
}

- (void)bluetoothMonitorerRecievedUpdatedBluetoothState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) <= 3) {
    -[PDAppletSubcredentialManager _updateSubcredentialsForBTEnabled:]( self,  "_updateSubcredentialsForBTEnabled:",  (((_BYTE)a3 - 2) & 0xF) == 3LL);
  }
}

- (void)rangingDidResumeForTerminalType:(int64_t)a3 forAppletIdentifier:(id)a4 keyIdentifier:(id)a5
{
  id v6 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Ranging resumed for credential (%@)",  (uint8_t *)&v15,  0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierWithCredentialIdentifier:]( self->_databaseManager,  "passUniqueIdentifierWithCredentialIdentifier:",  v6));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v9));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 secureElementPass]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 devicePrimaryPaymentApplication]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 subcredentials]);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 anyObject]);

  -[PDAppletSubcredentialManager _setRangingSuspensionReason:forCredential:forPaymentApplication:]( self,  "_setRangingSuspensionReason:forCredential:forPaymentApplication:",  0LL,  v14,  v12);
}

- (void)rangingDidSuspendForTerminalType:(int64_t)a3 withReasons:(unint64_t)a4 forAppletIdentifier:(id)a5 keyIdentifier:(id)a6
{
  id v8 = a6;
  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v8;
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Ranging suspended for credential (%@) for reasons (%lu)",  (uint8_t *)&v17,  0x16u);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierWithCredentialIdentifier:]( self->_databaseManager,  "passUniqueIdentifierWithCredentialIdentifier:",  v8));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v11));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 secureElementPass]);

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 devicePrimaryPaymentApplication]);
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 subcredentials]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 anyObject]);

  -[PDAppletSubcredentialManager _setRangingSuspensionReason:forCredential:forPaymentApplication:]( self,  "_setRangingSuspensionReason:forCredential:forPaymentApplication:",  a4,  v16,  v14);
}

- (void)_setRangingSuspensionReason:(unint64_t)a3 forCredential:(id)a4 forPaymentApplication:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationIdentifier]);
  databaseManager = self->_databaseManager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001648E8;
  v15[3] = &unk_100640EE0;
  void v15[4] = self;
  id v16 = v8;
  id v18 = v9;
  unint64_t v19 = a3;
  id v17 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  -[PDDatabaseManager performTransactionWithBlock:](databaseManager, "performTransactionWithBlock:", v15);
}

- (BOOL)interestedInAssertionOfType:(unint64_t)a3
{
  return a3 == 8;
}

- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3
{
  return a3 != 8 || self->_activeVehicleConnectionSession == 0LL;
}

- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4
{
  if (objc_msgSend(a4, "type", a3) == (id)8)
  {
    -[PDVehicleConnectionSession endSession](self->_activeVehicleConnectionSession, "endSession");
    activeVehicleConnectionSession = self->_activeVehicleConnectionSession;
    self->_activeVehicleConnectionSession = 0LL;
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

- (PDAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (void)setAssertionManager:(id)a3
{
}

- (PDPaymentWebServiceCoordinator)webServiceCoordinator
{
  return self->_webServiceCoordinator;
}

- (void)setWebServiceCoordinator:(id)a3
{
}

- (PDUserNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void)setNotificationManager:(id)a3
{
}

- (PKSecureElement)secureElement
{
  return self->_secureElement;
}

- (void)setSecureElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end