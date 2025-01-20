@interface PDProvisioningContinuityHostManager
- (BOOL)_canHandleDiscoveryRequest:(id)a3;
- (PDProvisioningContinuityHostManager)initWithHandle:(id)a3 databaseManager:(id)a4 remoteInterfacePresenter:(id)a5 notificationManager:(id)a6;
- (id)_requestedPassForRequest:(id)a3;
- (id)invalidationHandler;
- (void)_handleOutstandingMessage:(id)a3 messageHandled:(id)a4;
- (void)_invalidateWithReason:(id)a3;
- (void)_presentContinuityPromptNotificationForPass:(id)a3;
- (void)_presentRemoteContinuityAlert;
- (void)_removePromptNotification;
- (void)_verifyProximityAdvertisement:(id)a3 completion:(id)a4;
- (void)setInvalidationHandler:(id)a3;
- (void)userNotificationActionPerformed:(unint64_t)a3 notificationIdentifier:(id)a4;
@end

@implementation PDProvisioningContinuityHostManager

- (PDProvisioningContinuityHostManager)initWithHandle:(id)a3 databaseManager:(id)a4 remoteInterfacePresenter:(id)a5 notificationManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PDProvisioningContinuityHostManager;
  v15 = -[PDProvisioningContinuityHostManager init](&v23, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_handle, a3);
    objc_storeStrong((id *)&v16->_databaseManager, a4);
    objc_storeStrong((id *)&v16->_remoteInterfacePresenter, a5);
    objc_storeStrong((id *)&v16->_userNotificationManager, a6);
    v16->_isValid = 1;
    objc_initWeak(&location, v16);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1002C1404;
    v20[3] = &unk_100653028;
    objc_copyWeak(&v21, &location);
    [v11 setInvalidationHandler:v20];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1002C1438;
    v18[3] = &unk_100653028;
    objc_copyWeak(&v19, &location);
    [v11 setMessageReceivedHandler:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)_handleOutstandingMessage:(id)a3 messageHandled:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  objc_initWeak(&location, self);
  if (v6)
  {
    id v8 = [v6 type];
    if (v8 == (id)1001)
    {
      v7[2](v7, 1LL);
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDProvisioningContinuityHostManager _requestedPassForRequest:]( self,  "_requestedPassForRequest:",  v6));
      id v14 = v13;
      if (v13)
      {
        v15 = (NSString *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
        requestedPassUniqueID = self->_requestedPassUniqueID;
        self->_requestedPassUniqueID = v15;

        -[PDProvisioningContinuityHostManager _presentContinuityPromptNotificationForPass:]( self,  "_presentContinuityPromptNotificationForPass:",  v14);
      }

      else
      {
        uint64_t Object = PKLogFacilityTypeGetObject(42LL);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "PDProvisioningContinuityHostManager: Unable to find pass for invitation request",  buf,  2u);
        }

        -[PDProvisioningContinuityHostManager _invalidateWithReason:]( self,  "_invalidateWithReason:",  @"unable to find requested pass");
      }

      goto LABEL_16;
    }

    if (v8 == (id)2001)
    {
      id v9 = v6;
      if (-[PDProvisioningContinuityHostManager _canHandleDiscoveryRequest:](self, "_canHandleDiscoveryRequest:", v9))
      {
        uint64_t v10 = PKLogFacilityTypeGetObject(42LL);
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PDProvisioningContinuityHostManager: handling discovery request",  buf,  2u);
        }

        v7[2](v7, 1LL);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 advertisement]);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_1002C1748;
        v19[3] = &unk_100653078;
        v19[4] = self;
        objc_copyWeak(&v20, &location);
        -[PDProvisioningContinuityHostManager _verifyProximityAdvertisement:completion:]( self,  "_verifyProximityAdvertisement:completion:",  v12,  v19);

        objc_destroyWeak(&v20);
      }

      else
      {
        v7[2](v7, 1LL);
        -[PDProvisioningContinuityHostManager _invalidateWithReason:]( self,  "_invalidateWithReason:",  @"can't handle discovery request");
      }

- (void)_invalidateWithReason:(id)a3
{
  id v4 = a3;
  if (self->_isValid)
  {
    self->_isValid = 0;
    uint64_t Object = PKLogFacilityTypeGetObject(42LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PDProvisioningContinuityHostManager: invalidating with reason: %@",  (uint8_t *)&v11,  0xCu);
    }

    handle = self->_handle;
    if (handle)
    {
      -[PDSharingChannelHandle setInvalidationHandler:](handle, "setInvalidationHandler:", 0LL);
      -[PDSharingChannelHandle closeWithCompletion:](self->_handle, "closeWithCompletion:", 0LL);
      -[PDSharingChannelHandle invalidate](self->_handle, "invalidate");
      id v8 = self->_handle;
      self->_handle = 0LL;
    }

    -[PDProvisioningContinuityHostManager _removePromptNotification](self, "_removePromptNotification");
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      id v10 = self->_invalidationHandler;
      self->_invalidationHandler = 0LL;
    }
  }
}

- (BOOL)_canHandleDiscoveryRequest:(id)a3
{
  return [a3 continuityType] == (id)1;
}

- (void)_verifyProximityAdvertisement:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3)
  {
    handle = self->_handle;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1002C1A54;
    v9[3] = &unk_1006530A0;
    id v10 = v6;
    -[PDSharingChannelHandle startProximityDetectionForAdvertisement:completion:]( handle,  "startProximityDetectionForAdvertisement:completion:",  a3,  v9);
  }

  else
  {
    (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1LL, 0LL);
  }
}

- (void)_presentContinuityPromptNotificationForPass:(id)a3
{
  id v4 = a3;
  handle = self->_handle;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002C1AE8;
  v7[3] = &unk_1006530C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  -[PDSharingChannelHandle remoteDeviceInformation:](handle, "remoteDeviceInformation:", v7);
}

- (void)_removePromptNotification
{
  if (self->_promptNotification)
  {
    -[PDUserNotificationManager removeUserNotification:](self->_userNotificationManager, "removeUserNotification:");
    promptNotification = self->_promptNotification;
    self->_promptNotification = 0LL;
  }

- (void)_presentRemoteContinuityAlert
{
  v3 = self->_requestedPassUniqueID;
  if (v3)
  {
    objc_initWeak(&location, self);
    handle = self->_handle;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1002C1D70;
    v5[3] = &unk_100653118;
    objc_copyWeak(&v8, &location);
    id v6 = v3;
    v7 = self;
    -[PDSharingChannelHandle detachHandleForTransfer:](handle, "detachHandleForTransfer:", v5);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  else
  {
    -[PDProvisioningContinuityHostManager _invalidateWithReason:]( self,  "_invalidateWithReason:",  @"no identified pass to present remote alert for");
  }
}

- (id)_requestedPassForRequest:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 personalizedVehicleIdentifier]);
  if (!v5)
  {
LABEL_26:
    databaseManager = self->_databaseManager;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v4 passTypeIdentifier]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v4 passSerialNumber]);
    v29 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithPassTypeID:serialNumber:]( databaseManager,  "passWithPassTypeID:serialNumber:",  v27,  v28));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v29 secureElementPass]);

    goto LABEL_27;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PKAppleAccountManager sharedInstance](&OBJC_CLASS___PKAppleAccountManager, "sharedInstance"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v6 appleAccountInformation]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager credentialIdentifiersForAid](self->_databaseManager, "credentialIdentifiersForAid"));
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v8 = v7;
  id v32 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (!v32)
  {
    v25 = 0LL;
    goto LABEL_25;
  }

  uint64_t v9 = *(void *)v44;
  v34 = v8;
  id v35 = v4;
  uint64_t v31 = *(void *)v44;
  do
  {
    uint64_t v10 = 0LL;
    do
    {
      if (*(void *)v44 != v9) {
        objc_enumerationMutation(v8);
      }
      uint64_t v33 = v10;
      uint64_t v11 = *(void *)(*((void *)&v43 + 1) + 8 * v10);
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      uint64_t v36 = v11;
      id obj = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v31]);
      id v12 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (!v12) {
        goto LABEL_20;
      }
      id v13 = v12;
      uint64_t v14 = *(void *)v40;
      while (2)
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v40 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager appletSubcredentialWithIdentifier:]( self->_databaseManager,  "appletSubcredentialWithIdentifier:",  v16));
          uint64_t v18 = PKCreatePersonalVehicleIdentifier(v17, v38);
          id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          id v20 = v19;
          if (!v19)
          {
LABEL_15:

            continue;
          }

          id v21 = v19;
          if (v5 == v21)
          {
          }

          else
          {
            unsigned __int8 v22 = [v5 isEqualToString:v21];

            if ((v22 & 1) == 0) {
              goto LABEL_15;
            }
          }

          objc_super v23 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierWithPaymentApplicationIdentifier:subcredentialIdentifier:]( self->_databaseManager,  "passUniqueIdentifierWithPaymentApplicationIdentifier:subcredentialIdentifier:",  v36,  v16));
          v24 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v23));
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 secureElementPass]);

          if (v25)
          {

            id v8 = v34;
            id v4 = v35;
            goto LABEL_25;
          }
        }

        id v13 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v13) {
          continue;
        }
        break;
      }

- (void)userNotificationActionPerformed:(unint64_t)a3 notificationIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[PDUserNotification notificationIdentifier]( self->_promptNotification,  "notificationIdentifier"));
  id v7 = v5;
  id v8 = v7;
  if (v6 == v7)
  {
  }

  else
  {
    if (!v7 || !v6)
    {

      goto LABEL_11;
    }

    unsigned int v9 = [v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_11;
    }
  }

  uint64_t Object = PKLogFacilityTypeGetObject(42LL);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PDProvisioningContinuityHostManager: user prompt notification tapped",  v12,  2u);
  }

  -[PDProvisioningContinuityHostManager _removePromptNotification](self, "_removePromptNotification");
  -[PDProvisioningContinuityHostManager _presentRemoteContinuityAlert](self, "_presentRemoteContinuityAlert");
LABEL_11:
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end