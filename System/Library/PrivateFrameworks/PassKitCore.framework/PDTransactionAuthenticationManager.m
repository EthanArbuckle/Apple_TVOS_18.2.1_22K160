@interface PDTransactionAuthenticationManager
- (BOOL)_supportsTransactionAuthenticationNotifications;
- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3;
- (BOOL)interestedInAssertionOfType:(unint64_t)a3;
- (PDTransactionAuthenticationManager)initWithDatabaseManager:(id)a3 auxiliaryCapabilityManager:(id)a4 notificationServiceCoordinator:(id)a5 userNotificationManager:(id)a6 transactionProcessor:(id)a7 assertionManager:(id)a8 pushNotificationManager:(id)a9;
- (id)_transactionAuthenticationResultsDataFromResult:(id)a3 outError:(id *)a4;
- (void)_collectTransactionSignatureForTransaction:(id)a3 completion:(id)a4;
- (void)_collectTransactionSignatureIfNecessaryAndSubmitResultForTransaction:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5;
- (void)_configureSigningCertificateForPass:(id)a3 withSigningCertificate:(id)a4;
- (void)_disableCriticalPushReliability;
- (void)_enableCriticalPushReliabilityForTransaction:(id)a3;
- (void)_performTransactionSignatureRequestForPass:(id)a3 withTransaction:(id)a4 completion:(id)a5;
- (void)_processLatestTransactionPendingUserNotification;
- (void)_startPaymentInformationEventExtensionForPass:(id)a3 completion:(id)a4;
- (void)_submitAuthenticationResult:(id)a3 forTransaction:(id)a4 pass:(id)a5 retryForInvalidCertificate:(BOOL)a6 sessionExchangeToken:(id)a7 completion:(id)a8;
- (void)_submitAuthenticationResultForTransaction:(id)a3 pass:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)assertionManager:(id)a3 didAcquireAssertion:(id)a4;
- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4;
- (void)dealloc;
- (void)markAuthenticationCompleteForTransactionIdentifier:(id)a3 completion:(id)a4;
- (void)processedAuthenticationMechanism:(unint64_t)a3 forTransactionIdentifier:(id)a4 completion:(id)a5;
- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 completion:(id)a5;
- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)submitTransactionSignatureForTransactionIdentifier:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5;
- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 completion:(id)a5;
- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
@end

@implementation PDTransactionAuthenticationManager

- (PDTransactionAuthenticationManager)initWithDatabaseManager:(id)a3 auxiliaryCapabilityManager:(id)a4 notificationServiceCoordinator:(id)a5 userNotificationManager:(id)a6 transactionProcessor:(id)a7 assertionManager:(id)a8 pushNotificationManager:(id)a9
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v27 = a7;
  id v16 = a8;
  id v17 = a9;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___PDTransactionAuthenticationManager;
  v18 = -[PDTransactionAuthenticationManager init](&v32, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_databaseManager, a3);
    objc_storeStrong((id *)&v19->_auxiliaryCapabilityManager, a4);
    objc_storeStrong((id *)&v19->_notificationServiceCoordinator, a5);
    objc_storeStrong((id *)&v19->_userNotificationManager, a6);
    objc_storeStrong((id *)&v19->_paymentTransactionProcessor, a7);
    objc_storeStrong((id *)&v19->_assertionManager, a8);
    objc_storeStrong((id *)&v19->_pushNotificationManager, a9);
    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    signTransactionCompletionsForTransactionIdentifier = v19->_signTransactionCompletionsForTransactionIdentifier;
    v19->_signTransactionCompletionsForTransactionIdentifier = v20;

    dispatch_queue_attr_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v22);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.passd.transactionauthenticationmanager", v23);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v24;

    if (-[PDTransactionAuthenticationManager _supportsTransactionAuthenticationNotifications]( v19,  "_supportsTransactionAuthenticationNotifications"))
    {
      -[PDAssertionManager registerObserver:](v19->_assertionManager, "registerObserver:", v19);
    }
  }

  return v19;
}

- (void)dealloc
{
  if (-[PDTransactionAuthenticationManager _supportsTransactionAuthenticationNotifications]( self,  "_supportsTransactionAuthenticationNotifications"))
  {
    -[PDAssertionManager unregisterObserver:](self->_assertionManager, "unregisterObserver:", self);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDTransactionAuthenticationManager;
  -[PDTransactionAuthenticationManager dealloc](&v3, "dealloc");
}

- (void)processedAuthenticationMechanism:(unint64_t)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100317BF4;
  v13[3] = &unk_10063C928;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (void)markAuthenticationCompleteForTransactionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100317CE8;
  block[3] = &unk_100639AF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
}

- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100317E18;
  block[3] = &unk_100639508;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a3;
  id v19 = v11;
  id v20 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
}

- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void (**)(void, void, void))v13;
  if (v10)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 asWebServiceDictionary]);
    id v24 = 0LL;
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v15,  0LL,  &v24));
    id v17 = v24;

    if (v17)
    {
      if (v14) {
        ((void (**)(void, void, id))v14)[2](v14, 0LL, v17);
      }
    }

    else
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100318244;
      block[3] = &unk_10063CD88;
      block[4] = self;
      id v16 = v16;
      id v20 = v16;
      id v21 = v11;
      id v22 = v12;
      v23 = v14;
      dispatch_async((dispatch_queue_t)queue, block);
    }

    goto LABEL_9;
  }

  if (v13)
  {
    NSErrorUserInfoKey v25 = NSDebugDescriptionErrorKey;
    v26 = @"Encrypted PIN is nil.";
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  1LL,  v17));
    ((void (**)(void, void, id))v14)[2](v14, 0LL, v16);
LABEL_9:
  }
}

- (void)submitTransactionSignatureForTransactionIdentifier:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100318380;
  v15[3] = &unk_10063B440;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)queue, v15);
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5
{
  id v6 = a4;
  if (([v6 updateReasonIsInitialDownload] & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 authenticationContext]);
    unint64_t v8 = (unint64_t)[v7 requestedAuthenticationMechanisms];
    unint64_t v9 = (unint64_t)[v7 processedAuthenticationMechanisms];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v11 = [v6 transactionStatus];
    unint64_t v12 = v8 & ~v9;
    BOOL v19 = v11 == 0LL;
    char IsValid = PKTransactionAuthenticationMechanismIsValid(v8);
    unsigned __int8 v14 = [v7 complete];
    unsigned __int8 v15 = -[PDTransactionAuthenticationManager _supportsTransactionAuthenticationNotifications]( self,  "_supportsTransactionAuthenticationNotifications");
    char v16 = 0;
    if (!v11 && v12) {
      char v16 = IsValid & (v14 ^ 1);
    }
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100318540;
    block[3] = &unk_100656670;
    char v25 = v16;
    unint64_t v23 = v12;
    block[4] = self;
    id v21 = v6;
    id v22 = v10;
    unsigned __int8 v26 = v15;
    unint64_t v24 = v8;
    BOOL v27 = v19;
    BOOL v28 = v12 != 0;
    char v29 = IsValid;
    unsigned __int8 v30 = v14;
    id v18 = v10;
    dispatch_async((dispatch_queue_t)queue, block);
  }
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6 = a4;
  if (-[PDTransactionAuthenticationManager _supportsTransactionAuthenticationNotifications]( self,  "_supportsTransactionAuthenticationNotifications"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[PDPassPaymentTransactionAuthenticationUserNotification notificationIdentifierForTransactionIdentifier:]( &OBJC_CLASS___PDPassPaymentTransactionAuthenticationUserNotification,  "notificationIdentifierForTransactionIdentifier:",  v6));
    -[PDUserNotificationManager removeUserNotificationWithIdentifier:]( self->_userNotificationManager,  "removeUserNotificationWithIdentifier:",  v5);
  }
}

- (void)_enableCriticalPushReliabilityForTransaction:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  if (v4)
  {
    criticalPushReliabilityTimer = self->_criticalPushReliabilityTimer;
    if (criticalPushReliabilityTimer)
    {
      dispatch_source_cancel((dispatch_source_t)criticalPushReliabilityTimer);
      id v6 = self->_criticalPushReliabilityTimer;
      self->_criticalPushReliabilityTimer = 0LL;
    }

    id v7 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    unint64_t v8 = self->_criticalPushReliabilityTimer;
    self->_criticalPushReliabilityTimer = v7;

    unint64_t v9 = self->_criticalPushReliabilityTimer;
    dispatch_time_t v10 = dispatch_time(0LL, 10000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    id v11 = self->_criticalPushReliabilityTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1003188CC;
    handler[3] = &unk_100639300;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v11, handler);
    if (!self->_criticalPushReliabilityEnabled)
    {
      -[PDPushNotificationManager enableCriticalReliability]( self->_pushNotificationManager,  "enableCriticalReliability");
      self->_criticalPushReliabilityEnabled = 1;
    }

    objc_storeStrong((id *)&self->_pushPendingTransactionIdentifier, v4);
    dispatch_resume((dispatch_object_t)self->_criticalPushReliabilityTimer);
  }
}

- (void)_disableCriticalPushReliability
{
  criticalPushReliabilityTimer = self->_criticalPushReliabilityTimer;
  if (criticalPushReliabilityTimer)
  {
    dispatch_source_cancel((dispatch_source_t)criticalPushReliabilityTimer);
    v4 = self->_criticalPushReliabilityTimer;
    self->_criticalPushReliabilityTimer = 0LL;
  }

  if (self->_criticalPushReliabilityEnabled)
  {
    -[PDPushNotificationManager disableCriticalReliability]( self->_pushNotificationManager,  "disableCriticalReliability");
    self->_criticalPushReliabilityEnabled = 0;
  }

  pushPendingTransactionIdentifier = self->_pushPendingTransactionIdentifier;
  self->_pushPendingTransactionIdentifier = 0LL;
}

- (void)_collectTransactionSignatureForTransaction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (v6)
  {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    uint64_t v9 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_signTransactionCompletionsForTransactionIdentifier,  "objectForKey:",  v8));
    dispatch_time_t v10 = (NSMutableArray *)v9;
    if (!v9)
    {
      dispatch_time_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      -[NSMutableDictionary setObject:forKey:]( self->_signTransactionCompletionsForTransactionIdentifier,  "setObject:forKey:",  v10,  v8);
    }

    id v11 = objc_retainBlock(v7);
    -[NSMutableArray safelyAddObject:](v10, "safelyAddObject:", v11);

    if (!v9)
    {
      databaseManager = self->_databaseManager;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionSourceIdentifier]);
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierForTransactionSourceIdentifier:]( databaseManager,  "passUniqueIdentifierForTransactionSourceIdentifier:",  v13));

      unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v14));
      char v16 = (void *)objc_claimAutoreleasedReturnValue([v15 paymentPass]);

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100318B48;
      v20[3] = &unk_1006566D8;
      id v21 = v16;
      id v22 = v6;
      unint64_t v23 = self;
      id v24 = v8;
      id v17 = v16;
      -[PDTransactionAuthenticationManager _performTransactionSignatureRequestForPass:withTransaction:completion:]( self,  "_performTransactionSignatureRequestForPass:withTransaction:completion:",  v17,  v22,  v20);
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(28LL);
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "No transaction to perform signature with",  buf,  2u);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)_performTransactionSignatureRequestForPass:(id)a3 withTransaction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100318D90;
    v12[3] = &unk_100656778;
    v12[4] = self;
    id v15 = v10;
    id v13 = v8;
    id v14 = v9;
    -[PDTransactionAuthenticationManager _startPaymentInformationEventExtensionForPass:completion:]( self,  "_startPaymentInformationEventExtensionForPass:completion:",  v13,  v12);
  }
}

- (void)_startPaymentInformationEventExtensionForPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedApplicationIdentifiers]);
    id v9 = [v8 count];

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PKExtensionProvider providerForExtensionPoint:]( &OBJC_CLASS___PKExtensionProvider,  "providerForExtensionPoint:",  PKExtensionPaymentInformationEventExtensionPointName));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedApplicationIdentifiers]);
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allObjects]);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1003196C8;
      v14[3] = &unk_1006390F0;
      v14[4] = self;
      id v15 = v7;
      [v10 extensionsWithContainingApplicationIdentifiers:v12 completion:v14];
    }

    else
    {
      NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
      id v17 = @"No associated application for pass";
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  1LL,  v10));
      (*((void (**)(id, void, void *, void))v7 + 2))(v7, 0LL, v13, 0LL);
    }
  }
}

- (BOOL)interestedInAssertionOfType:(unint64_t)a3
{
  return a3 == 4;
}

- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3
{
  return 1;
}

- (void)assertionManager:(id)a3 didAcquireAssertion:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100319BC8;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100319C30;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_processLatestTransactionPendingUserNotification
{
  if (!self->_userNotificationSuppressed && !self->_resultSubmissionInProgress)
  {
    latestTransactionPendingUserNotification = self->_latestTransactionPendingUserNotification;
    if (latestTransactionPendingUserNotification)
    {
      id v16 = (id)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction identifier](latestTransactionPendingUserNotification, "identifier"));
      v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionWithTransactionIdentifier:]( self->_databaseManager,  "transactionWithTransactionIdentifier:"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 authenticationContext]);
      unint64_t v7 = (unint64_t)[v6 requestedAuthenticationMechanisms];
      if ([v5 transactionStatus]
        || !PKTransactionAuthenticationMechanismIsValid(v7)
        || ([v6 complete] & 1) != 0)
      {
        goto LABEL_17;
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionAuthenticationResultForTransactionIdentifier:]( self->_databaseManager,  "transactionAuthenticationResultForTransactionIdentifier:",  v16));
      unint64_t v9 = v7 & ~(unint64_t)[v6 processedAuthenticationMechanisms];
      if ((v9 & 1) != 0)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 encryptedPIN]);
        if (!v10) {
          goto LABEL_15;
        }
        v2 = v10;
        if ((v9 & 4) != 0) {
          goto LABEL_18;
        }
      }

      else if ((v9 & 4) != 0)
      {
LABEL_18:
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 userConfirmation]);
        if (v14) {
          int v15 = (v9 >> 3) & 1;
        }
        else {
          int v15 = 1;
        }

        if ((v9 & 1) != 0)
        {

          if ((v15 & 1) == 0) {
            goto LABEL_16;
          }
        }

        else if (!v15)
        {
          goto LABEL_16;
        }

        goto LABEL_15;
      }

      if ((v9 & 8) == 0)
      {
LABEL_16:

LABEL_17:
        return;
      }

- (BOOL)_supportsTransactionAuthenticationNotifications
{
  return 0;
}

- (void)_collectTransactionSignatureIfNecessaryAndSubmitResultForTransaction:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void, void))v10;
  if (v8)
  {
    self->_resultSubmissionInProgress = 1;
    databaseManager = self->_databaseManager;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionAuthenticationResultForTransactionIdentifier:]( databaseManager,  "transactionAuthenticationResultForTransactionIdentifier:",  v13));

    int v15 = self->_databaseManager;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 transactionSourceIdentifier]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierForTransactionSourceIdentifier:]( v15,  "passUniqueIdentifierForTransactionSourceIdentifier:",  v16));

    id v18 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v17));
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 paymentPass]);

    if ([v14 hasDataForAllRequestedAuthenticationMechanisms])
    {
      -[PDTransactionAuthenticationManager _submitAuthenticationResultForTransaction:pass:sessionExchangeToken:completion:]( self,  "_submitAuthenticationResultForTransaction:pass:sessionExchangeToken:completion:",  v8,  v19,  v9,  v11);
    }

    else if (PKPaymentTransactionShouldAuthenticateForMechanism(v8, 2LL))
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10031A110;
      v23[3] = &unk_10063CD88;
      v23[4] = self;
      id v24 = v8;
      id v25 = v19;
      id v26 = v9;
      BOOL v27 = v11;
      -[PDTransactionAuthenticationManager _collectTransactionSignatureForTransaction:completion:]( self,  "_collectTransactionSignatureForTransaction:completion:",  v24,  v23);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(28LL);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 authenticationContext]);
        *(_DWORD *)buf = 138412546;
        char v29 = v14;
        __int16 v30 = 2112;
        id v31 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Transaction authentication does not have results for all requested mechanisms. Not submitting authentication r esults %@ with context %@.",  buf,  0x16u);
      }

      self->_resultSubmissionInProgress = 0;
      if (v11) {
        ((void (**)(void, id, void))v11)[2](v11, v8, 0LL);
      }
    }

    goto LABEL_13;
  }

  if (v10)
  {
    NSErrorUserInfoKey v32 = NSDebugDescriptionErrorKey;
    v33 = @"No transaction to submit transaction authentication result for.";
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  1LL,  v14));
    ((void (**)(void, void, void *))v11)[2](v11, 0LL, v17);
LABEL_13:
  }
}

- (void)_submitAuthenticationResultForTransaction:(id)a3 pass:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472LL;
  char v29 = sub_10031A478;
  __int16 v30 = &unk_1006567C8;
  id v31 = self;
  id v13 = a6;
  id v32 = v13;
  id v14 = objc_retainBlock(&v27);
  if (v10 && v11)
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "authenticationContext", v27, v28, v29, v30, v31));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    if ([v10 transactionStatus])
    {
      uint64_t Object = PKLogFacilityTypeGetObject(28LL);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = [v10 transactionStatus];
        uint64_t v21 = PKPaymentTransactionStatusToString(v19, v20);
        id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *(_DWORD *)buf = 138412290;
        v34 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Transaction is not pending (%@). Not submitting authentication results.",  buf,  0xCu);
      }

- (void)_submitAuthenticationResult:(id)a3 forTransaction:(id)a4 pass:(id)a5 retryForInvalidCertificate:(BOOL)a6 sessionExchangeToken:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = (void (**)(id, void, id))a8;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v14 identifier]);
  uint64_t Object = PKLogFacilityTypeGetObject(28LL);
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v51 = v18;
    __int16 v52 = 2112;
    uint64_t v53 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Submitting transaction authentication result for pass %@, transaction %@",  buf,  0x16u);
  }

  NSErrorUserInfoKey v37 = (void *)v19;

  id v49 = 0LL;
  id v22 = (void *)objc_claimAutoreleasedReturnValue( -[PDTransactionAuthenticationManager _transactionAuthenticationResultsDataFromResult:outError:]( self,  "_transactionAuthenticationResultsDataFromResult:outError:",  v13,  &v49));
  id v23 = v49;
  if (v23)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Failed to create transaction authentication data with error: %@. Not submitting authentication results.",  buf,  0xCu);
    }

    if (v17) {
      v17[2](v17, 0LL, v23);
    }
  }

  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager notificationServiceOfType:forPassWithUniqueIdentifier:]( self->_databaseManager,  "notificationServiceOfType:forPassWithUniqueIdentifier:",  0LL,  v18));
    auxiliaryCapabilityManager = self->_auxiliaryCapabilityManager;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10031A7F8;
    v38[3] = &unk_100656890;
    v38[4] = self;
    v47 = v17;
    id v39 = v22;
    id v40 = v15;
    id v41 = v14;
    id v42 = v33;
    id v43 = v37;
    id v44 = v18;
    BOOL v48 = a6;
    id v24 = v16;
    uint64_t v25 = v17;
    id v26 = v18;
    id v27 = v16;
    id v28 = v15;
    id v29 = v14;
    __int16 v30 = v13;
    id v31 = v24;
    id v45 = v24;
    id v46 = v30;
    id v36 = v33;
    id v32 = v31;
    id v13 = v30;
    id v14 = v29;
    id v15 = v28;
    id v16 = v27;
    id v18 = v26;
    id v17 = v25;
    -[PDBarcodeCredentialManager performDeviceSignatureWithData:forPassUniqueIdentifier:sessionExchangeToken:withCompletion:]( auxiliaryCapabilityManager,  "performDeviceSignatureWithData:forPassUniqueIdentifier:sessionExchangeToken:withCompletion:",  v39,  v44,  v32,  v38);
  }
}

- (id)_transactionAuthenticationResultsDataFromResult:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 authenticationContext]);
  unsigned __int8 v8 = [v7 requestedAuthenticationMechanisms];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 encryptedPIN]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 base64EncodedStringWithOptions:0]);

  if (v10 && (v8 & 1) != 0)
  {
    v30[0] = @"authenticationMechanism";
    v30[1] = @"authenticationData";
    v31[0] = PKTransactionAuthenticationMechanismPaymentPINInputKey;
    v31[1] = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  2LL));
    -[NSMutableArray addObject:](v6, "addObject:", v11);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 userConfirmation]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 base64EncodedStringWithOptions:0]);

  if (v13 && (v8 & 4) != 0)
  {
    v28[0] = @"authenticationMechanism";
    v28[1] = @"authenticationData";
    v29[0] = PKTransactionAuthenticationMechanismUserConfirmationKey;
    v29[1] = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  2LL));
    -[NSMutableArray addObject:](v6, "addObject:", v14);
  }

  if ((v8 & 2) != 0)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 transactionDetailsSignature]);
    id v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = objc_alloc_init(&OBJC_CLASS___NSData);
    }
    uint64_t v19 = v18;

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](v19, "base64EncodedStringWithOptions:", 0LL));
    if (v15)
    {
      v26[0] = @"authenticationMechanism";
      v26[1] = @"authenticationData";
      v27[0] = PKTransactionAuthenticationMechanismTransactionDetailsSignatureKey;
      v27[1] = v15;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
      -[NSMutableArray addObject:](v6, "addObject:", v20);
    }
  }

  else
  {
    id v15 = v13;
  }

  id v21 = -[NSMutableArray copy](v6, "copy");
  id v25 = 0LL;
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v21,  0LL,  &v25));
  id v23 = v25;

  if (a4) {
    *a4 = v23;
  }

  return v22;
}

- (void)_configureSigningCertificateForPass:(id)a3 withSigningCertificate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  uint64_t Object = PKLogFacilityTypeGetObject(28LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Configuring signing certificate for pass %@",  buf,  0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10031B5C4;
  v14[3] = &unk_1006568B8;
  id v15 = v8;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v8;
  -[PDTransactionAuthenticationManager _startPaymentInformationEventExtensionForPass:completion:]( self,  "_startPaymentInformationEventExtensionForPass:completion:",  v12,  v14);
}

- (void).cxx_destruct
{
}

@end