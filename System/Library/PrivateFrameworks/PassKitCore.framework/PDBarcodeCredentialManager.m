@interface PDBarcodeCredentialManager
- (PDBarcodeCredentialManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4 pushNotificationManager:(id)a5 barcodeCertManager:(id)a6 auxiliaryCapabilityManager:(id)a7;
- (id)_handleFetchBarcodeResponse:(id)a3 forPass:(id)a4 outStoredBarcodeCount:(unint64_t *)a5;
- (unint64_t)_barcodeCountLowWatermarkForPass:(id)a3;
- (unint64_t)_estimatedNumberOfBarcodesRequiredPerDayForPass:(id)a3;
- (unint64_t)_numberOfBarcodesToFetchForPass:(id)a3 fetchReason:(int64_t)a4;
- (void)_decryptBarcodeCredential:(id)a3 forPass:(id)a4 authorization:(id)a5 sessionExchangeToken:(id)a6 completion:(id)a7;
- (void)_disableCriticalPushReliability;
- (void)_enableCriticalPushReliabilityForBarcodeCredential:(id)a3;
- (void)_fetchBarcodesForPass:(id)a3 fetchReason:(int64_t)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)_performDeviceSignatureWithData:(id)a3 forPass:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)_removeCertificateForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4;
- (void)_retrieveDecryptedBarcodeCredentialForPass:(id)a3 authorization:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)_scheduleBackgroundFetchForPassUniqueID:(id)a3 withBackgroundFetchType:(int64_t)a4;
- (void)_setupBarcodeFetchScheduleIfNecessaryForPass:(id)a3;
- (void)_signData:(id)a3 withDeviceAccountIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)_submitBarcodePaymentEvent:(id)a3 forPass:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)_unscheduleBackgroundFetchForPassUniqueID:(id)a3;
- (void)_updateBackgroundFetchScheduledActivityIfNecessary;
- (void)fetchBarcodesForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5;
- (void)invalidateCertificateOfType:(int64_t)a3 forPassUniqueIdentifier:(id)a4 withCompletion:(id)a5;
- (void)invalidateCertificatesForPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)nukeTasks;
- (void)passWillBeRemoved:(id)a3;
- (void)performDeviceSignatureWithData:(id)a3 forPassUniqueIdentifier:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)registeredPassForAuxiliaryCapabilityPass:(id)a3;
- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 withCompletion:(id)a5;
- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5;
- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4;
- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 withCompletion:(id)a5;
- (void)task:(id)a3 encounteredError:(id)a4;
- (void)task:(id)a3 encounteredWarnings:(id)a4;
- (void)task:(id)a3 gotResult:(id)a4;
- (void)task:(id)a3 willRetryAfterMinimumDelay:(double)a4;
- (void)taskFailed:(id)a3;
- (void)taskSucceeded:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5;
@end

@implementation PDBarcodeCredentialManager

- (PDBarcodeCredentialManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4 pushNotificationManager:(id)a5 barcodeCertManager:(id)a6 auxiliaryCapabilityManager:(id)a7
{
  id v38 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___PDBarcodeCredentialManager;
  v17 = -[PDBarcodeCredentialManager init](&v39, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_databaseManager, a3);
    objc_storeStrong((id *)&v18->_webServiceCoordinator, a4);
    objc_storeStrong((id *)&v18->_pushNotificationManager, a5);
    objc_storeStrong((id *)&v18->_barcodeCertManager, a6);
    objc_storeStrong((id *)&v18->_auxiliaryCapabilityManager, a7);
    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    isRegisteringAuxiliaryCapabilityForPass = v18->_isRegisteringAuxiliaryCapabilityForPass;
    v18->_isRegisteringAuxiliaryCapabilityForPass = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    auxiliaryRegisterCompletionHandlersForPass = v18->_auxiliaryRegisterCompletionHandlersForPass;
    v18->_auxiliaryRegisterCompletionHandlersForPass = v21;

    v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    isFetchingBarcodesForPass = v18->_isFetchingBarcodesForPass;
    v18->_isFetchingBarcodesForPass = v23;

    v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    hasPendingHighPriorityFetchForPass = v18->_hasPendingHighPriorityFetchForPass;
    v18->_hasPendingHighPriorityFetchForPass = v25;

    v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    fetchBarcodeCompletionHandlersForPass = v18->_fetchBarcodeCompletionHandlersForPass;
    v18->_fetchBarcodeCompletionHandlersForPass = v27;

    v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    barcodeDecryptionAuthTokenForPass = v18->_barcodeDecryptionAuthTokenForPass;
    v18->_barcodeDecryptionAuthTokenForPass = v29;

    v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    retrieveDecryptedBarcodeCompletionHandlersForPass = v18->_retrieveDecryptedBarcodeCompletionHandlersForPass;
    v18->_retrieveDecryptedBarcodeCompletionHandlersForPass = v31;

    v33 = -[PDNetworkTaskManager initWithDelegate:archiveName:]( objc_alloc(&OBJC_CLASS___PDNetworkTaskManager),  "initWithDelegate:archiveName:",  v18,  @"AuxiliaryCapabilityTasks");
    taskManager = v18->_taskManager;
    v18->_taskManager = v33;

    dispatch_queue_t v35 = dispatch_queue_create("com.apple.passd.auxiliarycapabilitymangager", 0LL);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v35;

    PDScheduledActivityClientRegister(@"PDBarcodeCredentialManager", v18, v18->_queue);
  }

  return v18;
}

- (void)fetchBarcodesForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100312038;
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

- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 withCompletion:(id)a5
{
}

- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, const __CFString *, void *, void))a6;
  if (v13)
  {
    if (PKDisplaysTestBarcodeCredential())
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([@"test" dataUsingEncoding:4]);
      v13[2](v13, @"test", v14, 0LL);
    }

    else
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1003121DC;
      block[3] = &unk_10063CD88;
      block[4] = self;
      id v17 = v10;
      id v18 = v11;
      id v19 = v12;
      v20 = v13;
      dispatch_async((dispatch_queue_t)queue, block);
    }
  }
}

- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4
{
}

- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10031231C;
    v12[3] = &unk_10063BA88;
    v12[4] = self;
    id v13 = v8;
    id v15 = v10;
    id v14 = v9;
    dispatch_async((dispatch_queue_t)queue, v12);
  }
}

- (void)invalidateCertificateOfType:(int64_t)a3 forPassUniqueIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100312A0C;
  v13[3] = &unk_10063C928;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (void)invalidateCertificatesForPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100312B38;
  block[3] = &unk_100639AF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)performDeviceSignatureWithData:(id)a3 forPassUniqueIdentifier:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  if (a6)
  {
    uint64_t v7 = PKAuxiliaryCapabilityErrorDomain;
    NSErrorUserInfoKey v11 = NSDebugDescriptionErrorKey;
    id v12 = @"Unsupported platform";
    id v8 = a6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v7,  -1LL,  v9));
    (*((void (**)(id, void, void *))a6 + 2))(v8, 0LL, v10);
  }

- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 withCompletion:(id)a5
{
}

- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100312DEC;
  block[3] = &unk_10063CD88;
  block[4] = self;
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)passWillBeRemoved:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100312ECC;
  v7[3] = &unk_1006392B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)nukeTasks
{
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5
{
  id v6 = a4;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1003130D0;
  v9[3] = &unk_1006392B0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, v9);
}

- (void)_fetchBarcodesForPass:(id)a3 fetchReason:(int64_t)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (PKPassEligibleForBarcodePayment(v10))
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
    if (v12)
    {
      id v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_fetchBarcodeCompletionHandlersForPass,  "objectForKey:",  v13));
      if (!v14)
      {
        id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        -[NSMutableDictionary setObject:forKey:]( self->_fetchBarcodeCompletionHandlersForPass,  "setObject:forKey:",  v14,  v13);
      }

      id v15 = objc_retainBlock(v12);
      -[NSMutableArray addObject:](v14, "addObject:", v15);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_isFetchingBarcodesForPass, "objectForKey:", v13));
    unsigned int v17 = [v16 BOOLValue];

    if (v17)
    {
      if (a4 == 1) {
        -[NSMutableDictionary setObject:forKey:]( self->_hasPendingHighPriorityFetchForPass,  "setObject:forKey:",  &__kCFBooleanTrue,  v13);
      }
    }

    else
    {
      -[NSMutableDictionary setObject:forKey:]( self->_isFetchingBarcodesForPass,  "setObject:forKey:",  &__kCFBooleanTrue,  v13);
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472LL;
      v51[2] = sub_100313668;
      v51[3] = &unk_1006563B8;
      v51[4] = self;
      id v13 = v13;
      id v52 = v13;
      id v21 = v11;
      id v53 = v21;
      id v22 = v10;
      id v54 = v22;
      id v55 = v12;
      id v23 = objc_retainBlock(v51);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v22 deviceAccountIdentifier]);
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_100313860;
      v46[3] = &unk_1006563E0;
      v46[4] = self;
      id v33 = v22;
      id v47 = v33;
      int64_t v50 = a4;
      v34 = v23;
      id v49 = v34;
      id v25 = v24;
      id v48 = v25;
      v26 = objc_retainBlock(v46);
      uint64_t v40 = 0LL;
      v41 = &v40;
      uint64_t v42 = 0x3032000000LL;
      v43 = sub_100313A7C;
      v44 = sub_100313A8C;
      v27 = (void *)objc_claimAutoreleasedReturnValue( -[PDBarcodeCertificateManager fetchCertificatesForDeviceAccountIdentifier:withCertificateType:]( self->_barcodeCertManager,  "fetchCertificatesForDeviceAccountIdentifier:withCertificateType:",  v25,  1LL));
      id v45 = (id)objc_claimAutoreleasedReturnValue([v27 firstObject]);

      if (v41[5])
      {
        ((void (*)(void *))v26[2])(v26);
      }

      else
      {
        if (v21)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAuxiliaryCapabilityErrorDomain,  2LL,  0LL));
          ((void (*)(void *, void, void *))v34[2])(v34, 0LL, v28);
        }

        else
        {
          uint64_t Object = PKLogFacilityTypeGetObject(28LL);
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue([v33 uniqueID]);
            *(_DWORD *)buf = 138412290;
            v57 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Reregistering auxiliary registration due to missing certificates at barcode fetch for pass: %@",  buf,  0xCu);
          }

          auxiliaryCapabilityManager = self->_auxiliaryCapabilityManager;
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472LL;
          v35[2] = sub_100313A94;
          v35[3] = &unk_100656408;
          objc_super v39 = &v40;
          v37 = v34;
          v35[4] = self;
          id v36 = v25;
          id v38 = v26;
          -[PDAuxiliaryCapabilityManager registerAuxiliaryCapabilitiesForPass:force:sessionExchangeToken:completion:]( auxiliaryCapabilityManager,  "registerAuxiliaryCapabilitiesForPass:force:sessionExchangeToken:completion:",  v33,  1LL,  0LL,  v35);

          v28 = v37;
        }
      }

      _Block_object_dispose(&v40, 8);
    }

    goto LABEL_20;
  }

  if (v12)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Pass not eligible for barcode payment: %@",  v18));

    NSErrorUserInfoKey v58 = NSDebugDescriptionErrorKey;
    id v59 = v13;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  1LL,  v19));
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v20);

LABEL_20:
  }
}

- (void)_retrieveDecryptedBarcodeCredentialForPass:(id)a3 authorization:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v30 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
    if (!PKPassEligibleForBarcodePayment(v10))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Pass not eligible for barcode payment: %@",  v13));
      NSErrorUserInfoKey v50 = NSDebugDescriptionErrorKey;
      v51 = v14;
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL));
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  1LL,  v15));
      (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0LL, 0LL, v16);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_barcodeDecryptionAuthTokenForPass,  "setObject:forKeyedSubscript:",  v11,  v13);
    unsigned int v17 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_retrieveDecryptedBarcodeCompletionHandlersForPass,  "objectForKeyedSubscript:",  v13));
    if (v17)
    {
      id v18 = objc_retainBlock(v12);
      -[NSMutableArray addObject:](v17, "addObject:", v18);
    }

    else
    {
      id v19 = objc_alloc(&OBJC_CLASS___NSMutableArray);
      id v20 = objc_retainBlock(v12);
      unsigned int v17 = -[NSMutableArray initWithObjects:](v19, "initWithObjects:", v20, 0LL);

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_retrieveDecryptedBarcodeCompletionHandlersForPass,  "setObject:forKeyedSubscript:",  v17,  v13);
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472LL;
      v48[2] = sub_1003140D8;
      v48[3] = &unk_100656458;
      v48[4] = self;
      id v21 = v13;
      id v49 = v21;
      id v22 = objc_retainBlock(v48);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceAccountIdentifier]);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_1003141E8;
      v42[3] = &unk_1006564A8;
      v42[4] = self;
      id v43 = v21;
      id v24 = v10;
      id v44 = v24;
      id v25 = v30;
      id v45 = v25;
      v28 = v22;
      id v47 = v28;
      id v29 = v23;
      id v46 = v29;
      v26 = objc_retainBlock(v42);
      uint64_t v36 = 0LL;
      v37 = &v36;
      uint64_t v38 = 0x3032000000LL;
      objc_super v39 = sub_100313A7C;
      uint64_t v40 = sub_100313A8C;
      id v41 = (id)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager firstValidBarcodeCredentialForDPANIdentifier:]( self->_databaseManager,  "firstValidBarcodeCredentialForDPANIdentifier:",  v29));
      if (v37[5])
      {
        ((void (*)(void *))v26[2])(v26);
      }

      else
      {
        if (v25)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAuxiliaryCapabilityErrorDomain,  3LL,  0LL));
          ((void (*)(void *, void, void, void *))v28[2])(v28, 0LL, 0LL, v27);
        }

        else
        {
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472LL;
          v31[2] = sub_100314478;
          v31[3] = &unk_1006564D0;
          dispatch_queue_t v35 = &v36;
          v31[4] = self;
          id v32 = v29;
          id v33 = v26;
          v34 = v28;
          -[PDBarcodeCredentialManager _fetchBarcodesForPass:fetchReason:sessionExchangeToken:withCompletion:]( self,  "_fetchBarcodesForPass:fetchReason:sessionExchangeToken:withCompletion:",  v24,  1LL,  0LL,  v31);
        }

        -[PDBarcodeCredentialManager _updateBackgroundFetchScheduledActivityIfNecessary]( self,  "_updateBackgroundFetchScheduledActivityIfNecessary");
      }

      _Block_object_dispose(&v36, 8);
    }
  }
}

- (id)_handleFetchBarcodeResponse:(id)a3 forPass:(id)a4 outStoredBarcodeCount:(unint64_t *)a5
{
  id v8 = a4;
  barcodeCertManager = self->_barcodeCertManager;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceAccountIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDBarcodeCertificateManager publicKeyHashForCertificateType:deviceAccountIdentifier:]( barcodeCertManager,  "publicKeyHashForCertificateType:deviceAccountIdentifier:",  1LL,  v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 barcodes]);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100314904;
  v31[3] = &unk_1006564F8;
  id v14 = v12;
  id v32 = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pk_objectsPassingTest:", v31));

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 barcodes]);
  id v17 = [v16 count];

  id v18 = [v15 count];
  if (v17 != v18)
  {
    id v19 = v18;
    uint64_t Object = PKLogFacilityTypeGetObject(28LL);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v36 = v17;
      __int16 v37 = 2048;
      id v38 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Invalid barcodes in Fetch Barcode response: %lu returned, %lu valid.",  buf,  0x16u);
    }
  }

  databaseManager = self->_databaseManager;
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceAccountIdentifier]);
  LOBYTE(databaseManager) = -[PDDatabaseManager insertBarcodeCredentials:forDPANIdentifier:]( databaseManager,  "insertBarcodeCredentials:forDPANIdentifier:",  v15,  v23);

  if ((databaseManager & 1) == 0)
  {
    id v25 = [v15 count];
    v26 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueID]);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to insert %ld barcode credentials for pass %@",  v25,  v26));

    NSErrorUserInfoKey v33 = NSDebugDescriptionErrorKey;
    v34 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  -1LL,  v28));

    if (!a5) {
      goto LABEL_13;
    }
    if (v24)
    {
      id v29 = 0LL;
LABEL_12:
      *a5 = (unint64_t)v29;
      goto LABEL_13;
    }

- (void)_decryptBarcodeCredential:(id)a3 forPass:(id)a4 authorization:(id)a5 sessionExchangeToken:(id)a6 completion:(id)a7
{
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a7;
  if (v10)
  {
    barcodeCertManager = self->_barcodeCertManager;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceAccountIdentifier]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDBarcodeCertificateManager fetchKeyDataForDeviceAccountIdentifier:withCertificateType:]( barcodeCertManager,  "fetchKeyDataForDeviceAccountIdentifier:withCertificateType:",  v12,  1LL));

    if (v13)
    {
      uint64_t v14 = PKAuxiliaryCapabilityErrorDomain;
      NSErrorUserInfoKey v20 = NSDebugDescriptionErrorKey;
      id v21 = @"Unsupported platform";
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  -1LL,  v15));
      v10[2](v10, 0LL, v16);
    }

    else
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to retrieve key data to decrypt barcode for pass: %@",  v17));

      uint64_t v18 = PKAuxiliaryCapabilityErrorDomain;
      NSErrorUserInfoKey v22 = NSDebugDescriptionErrorKey;
      id v23 = v15;
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v18,  1LL,  v16));
      v10[2](v10, 0LL, v19);
    }
  }
}

- (unint64_t)_numberOfBarcodesToFetchForPass:(id)a3 fetchReason:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if ((unint64_t)(a4 - 1) < 2)
  {
    unint64_t v10 = vcvtpd_u64_f64( (double)-[PDBarcodeCredentialManager _estimatedNumberOfBarcodesRequiredPerDayForPass:]( self,  "_estimatedNumberOfBarcodesRequiredPerDayForPass:",  v6)
          * 1.25);
    if (v10 <= 2) {
      unint64_t v9 = 2LL;
    }
    else {
      unint64_t v9 = v10;
    }
  }

  else if (a4 == 3)
  {
    unint64_t v9 = vcvtpd_u64_f64( (double)-[PDBarcodeCredentialManager _estimatedNumberOfBarcodesRequiredPerDayForPass:]( self,  "_estimatedNumberOfBarcodesRequiredPerDayForPass:",  v6)
         * 1.25);
  }

  else if (a4)
  {
    unint64_t v9 = 0LL;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 barcodeSettings]);
    unint64_t v9 = (unint64_t)[v8 initialBarcodeFetchCount];
  }

  return v9;
}

- (unint64_t)_barcodeCountLowWatermarkForPass:(id)a3
{
  return vcvtpd_u64_f64( (double)-[PDBarcodeCredentialManager _estimatedNumberOfBarcodesRequiredPerDayForPass:]( self,  "_estimatedNumberOfBarcodesRequiredPerDayForPass:",  a3)
         * 0.25);
}

- (unint64_t)_estimatedNumberOfBarcodesRequiredPerDayForPass:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ingestedDate]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceAccountIdentifier]);
  [v5 timeIntervalSinceNow];
  if (fabs(v7) >= 86400.0)
  {
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -1296000.0));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 laterDate:v10]);

    double v11 = (double)-[PDDatabaseManager numberOfBarcodeCredentialsDisplayedAfterDate:forDPANIdentifier:]( self->_databaseManager,  "numberOfBarcodeCredentialsDisplayedAfterDate:forDPANIdentifier:",  v8,  v6);
    [v8 timeIntervalSinceNow];
    double v13 = ceil(v11 / fabs(v12) * 86400.0);
    databaseManager = self->_databaseManager;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -86400.0));
    unint64_t v16 = -[PDDatabaseManager numberOfBarcodeCredentialsDisplayedAfterDate:forDPANIdentifier:]( databaseManager,  "numberOfBarcodeCredentialsDisplayedAfterDate:forDPANIdentifier:",  v15,  v6);

    double v17 = (double)v16;
    unint64_t v9 = (unint64_t)v17;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 barcodeSettings]);
    unint64_t v9 = (unint64_t)[v8 initialBarcodeFetchCount];
  }

  if (v9 >= 0x64) {
    unint64_t v9 = 100LL;
  }

  return v9;
}

- (void)_enableCriticalPushReliabilityForBarcodeCredential:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  if (v4)
  {
    criticalPushReliabilityTimer = self->_criticalPushReliabilityTimer;
    if (criticalPushReliabilityTimer)
    {
      dispatch_source_cancel((dispatch_source_t)criticalPushReliabilityTimer);
      id v6 = self->_criticalPushReliabilityTimer;
      self->_criticalPushReliabilityTimer = 0LL;
    }

    double v7 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    id v8 = self->_criticalPushReliabilityTimer;
    self->_criticalPushReliabilityTimer = v7;

    unint64_t v9 = self->_criticalPushReliabilityTimer;
    dispatch_time_t v10 = dispatch_time(0LL, 30000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    double v11 = self->_criticalPushReliabilityTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100314F08;
    handler[3] = &unk_100639300;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v11, handler);
    if (!self->_criticalPushReliabilityEnabled)
    {
      -[PDPushNotificationManager enableCriticalReliability]( self->_pushNotificationManager,  "enableCriticalReliability");
      self->_criticalPushReliabilityEnabled = 1;
    }

    objc_storeStrong((id *)&self->_pushPendingBarcodeIdentifier, v4);
    dispatch_resume((dispatch_object_t)self->_criticalPushReliabilityTimer);
  }
}

- (void)_disableCriticalPushReliability
{
  criticalPushReliabilityTimer = self->_criticalPushReliabilityTimer;
  if (criticalPushReliabilityTimer)
  {
    dispatch_source_cancel((dispatch_source_t)criticalPushReliabilityTimer);
    id v4 = self->_criticalPushReliabilityTimer;
    self->_criticalPushReliabilityTimer = 0LL;
  }

  if (self->_criticalPushReliabilityEnabled)
  {
    -[PDPushNotificationManager disableCriticalReliability]( self->_pushNotificationManager,  "disableCriticalReliability");
    self->_criticalPushReliabilityEnabled = 0;
  }

  pushPendingBarcodeIdentifier = self->_pushPendingBarcodeIdentifier;
  self->_pushPendingBarcodeIdentifier = 0LL;
}

- (void)_submitBarcodePaymentEvent:(id)a3 forPass:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = (void (**)(void))a6;
  unsigned __int8 v14 = [v11 supportsBarcodePayment];
  if (v10 && (v14 & 1) != 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceAccountIdentifier]);
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
    [v10 setBiometricsChanged:0];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100315178;
    v22[3] = &unk_100656520;
    id v23 = v16;
    id v24 = (id)objc_claimAutoreleasedReturnValue([v10 data]);
    id v25 = v10;
    id v26 = v11;
    v27 = self;
    char v31 = 0;
    id v28 = 0LL;
    id v29 = v15;
    id v30 = v13;
    id v17 = v15;
    id v18 = v24;
    id v19 = v16;
    -[PDBarcodeCredentialManager _performDeviceSignatureWithData:forPass:sessionExchangeToken:completion:]( self,  "_performDeviceSignatureWithData:forPass:sessionExchangeToken:completion:",  v18,  v26,  v12,  v22);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(28LL);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Not submitting barcode event due to empty event data or ineligible pass.",  buf,  2u);
    }

    if (v13) {
      v13[2](v13);
    }
  }
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(28LL);
  unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDBarcodeCredentialManager: perform scheduled activity with activityIdentifier: %@",  buf,  0xCu);
  }

  databaseManager = self->_databaseManager;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 600.0));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passesWithNextBackgroundFetchDateBeforeDate:]( databaseManager,  "passesWithNextBackgroundFetchDateBeforeDate:",  v11));

  if ([v12 count])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100315478;
    v13[3] = &unk_100656570;
    v13[4] = self;
    [v12 enumerateObjectsUsingBlock:v13];
  }

  else
  {
    -[PDBarcodeCredentialManager _updateBackgroundFetchScheduledActivityIfNecessary]( self,  "_updateBackgroundFetchScheduledActivityIfNecessary");
  }
}

- (void)_setupBarcodeFetchScheduleIfNecessaryForPass:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
  if (PKPassEligibleForBarcodePayment(v4))
  {
    databaseManager = self->_databaseManager;
    uint64_t v8 = 0LL;
    if (!-[PDDatabaseManager hasBarcodeBackgroundFetchRecordForPassUniqueIdentifier:nextBackgroundFetchDate:]( databaseManager,  "hasBarcodeBackgroundFetchRecordForPassUniqueIdentifier:nextBackgroundFetchDate:",  v5,  &v8))
    {
      -[PDBarcodeCredentialManager _fetchBarcodesForPass:fetchReason:sessionExchangeToken:withCompletion:]( self,  "_fetchBarcodesForPass:fetchReason:sessionExchangeToken:withCompletion:",  v4,  0LL,  0LL,  &stru_1006565B0);
      uint64_t v7 = 1LL;
      goto LABEL_6;
    }

    if (!v8)
    {
      -[PDBarcodeCredentialManager _fetchBarcodesForPass:fetchReason:sessionExchangeToken:withCompletion:]( self,  "_fetchBarcodesForPass:fetchReason:sessionExchangeToken:withCompletion:",  v4,  3LL,  0LL,  &stru_1006565D0);
      uint64_t v7 = 0LL;
LABEL_6:
      -[PDBarcodeCredentialManager _scheduleBackgroundFetchForPassUniqueID:withBackgroundFetchType:]( self,  "_scheduleBackgroundFetchForPassUniqueID:withBackgroundFetchType:",  v5,  v7);
    }
  }
}

- (void)_scheduleBackgroundFetchForPassUniqueID:(id)a3 withBackgroundFetchType:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0LL:
      double v7 = 82800.0;
      goto LABEL_7;
    case 1LL:
      double v7 = (double)(arc4random() % 0x14370 + 1);
      goto LABEL_7;
    case 2LL:
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  3600.0));
      uint64_t v8 = 1LL;
      break;
    case 3LL:
      double v7 = 60.0;
LABEL_7:
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v7));
      uint64_t v8 = 0LL;
      break;
    default:
      uint64_t v8 = 0LL;
      unint64_t v9 = 0LL;
      break;
  }

  -[PDDatabaseManager updateNextBarcodeBackgroundFetchDate:withRetryLevel:forPassUniqueIdentifier:]( self->_databaseManager,  "updateNextBarcodeBackgroundFetchDate:withRetryLevel:forPassUniqueIdentifier:",  v9,  v8,  v6);
  -[PDBarcodeCredentialManager _updateBackgroundFetchScheduledActivityIfNecessary]( self,  "_updateBackgroundFetchScheduledActivityIfNecessary");
  uint64_t Object = PKLogFacilityTypeGetObject(28LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    [v9 timeIntervalSinceNow];
    int v13 = 134218498;
    uint64_t v14 = v12;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2048;
    int64_t v18 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Background fetch scheduled %lf seconds later for pass: %@, background fetch type: %ld",  (uint8_t *)&v13,  0x20u);
  }
}

- (void)_unscheduleBackgroundFetchForPassUniqueID:(id)a3
{
  id v4 = a3;
  -[PDDatabaseManager updateNextBarcodeBackgroundFetchDate:withRetryLevel:forPassUniqueIdentifier:]( self->_databaseManager,  "updateNextBarcodeBackgroundFetchDate:withRetryLevel:forPassUniqueIdentifier:",  0LL,  0LL,  v4);
  -[PDBarcodeCredentialManager _updateBackgroundFetchScheduledActivityIfNecessary]( self,  "_updateBackgroundFetchScheduledActivityIfNecessary");
  uint64_t Object = PKLogFacilityTypeGetObject(28LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Unscheduling background barcode fetch for pass: %@",  (uint8_t *)&v7,  0xCu);
  }
}

- (void)_updateBackgroundFetchScheduledActivityIfNecessary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager nextBarcodeBackgroundFetchDate]( self->_databaseManager,  "nextBarcodeBackgroundFetchDate"));
  uint64_t Object = PKLogFacilityTypeGetObject(28LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      [v2 timeIntervalSinceNow];
      int v8 = 134217984;
      uint64_t v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Scheduling next barcode background fetch %lf seconds from now",  (uint8_t *)&v8,  0xCu);
    }

    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "priorityActivityCriteriaWithStartDate:",  v2));
    [v7 setRequireNetworkConnectivity:1];
    PDScheduledActivityRegister(@"PDBarcodeCredentialManager", @"FetchBarcode", v7);
  }

  else
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Unscheduling barcode background fetch",  (uint8_t *)&v8,  2u);
    }

    PDScheduledActivityRemove(@"PDBarcodeCredentialManager", @"FetchBarcode");
  }
}

- (void)task:(id)a3 gotResult:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PDBarcodeServiceBarcodeEventTask, v7);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(28LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Barcode event task %@, got response: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)task:(id)a3 willRetryAfterMinimumDelay:(double)a4
{
  uint64_t Object = PKLogFacilityTypeGetObject(28LL);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = a3;
    __int16 v10 = 2048;
    double v11 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Barcode service task %@ will retry after %lf seconds",  (uint8_t *)&v8,  0x16u);
  }
}

- (void)taskSucceeded:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(28LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Barcode service task %@ succeeded",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)taskFailed:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(28LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Barcode service task %@ failed",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)task:(id)a3 encounteredError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___PDBarcodeServiceBarcodeEventTask, v8);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
  {
    id v10 = v6;
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 passUniqueIdentifier]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    unsigned int v13 = [v12 isEqualToString:@"PDTaskErrorDomain"];

    if (v13)
    {
      if ([v7 code] == (id)40601)
      {
        [v10 setSignature:0];
        queue = self->_queue;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_100316100;
        v17[3] = &unk_10063B060;
        v17[4] = self;
        id v18 = v11;
        id v19 = v10;
        id v20 = v19;
        dispatch_async((dispatch_queue_t)queue, v17);
      }

      else
      {
        uint64_t Object = PKLogFacilityTypeGetObject(28LL);
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v22 = v10;
          __int16 v23 = 2112;
          id v24 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Barcode event task %@ for pass %@, encountered unknown error.",  buf,  0x16u);
        }
      }
    }
  }
}

- (void)task:(id)a3 encounteredWarnings:(id)a4
{
  uint64_t Object = PKLogFacilityTypeGetObject(28LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = a3;
    __int16 v10 = 2112;
    id v11 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Barcode service task %@, encountered encountered warnings %@.",  (uint8_t *)&v8,  0x16u);
  }
}

- (void)_removeCertificateForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4
{
  id v6 = a3;
  -[PDBarcodeCertificateManager removeCertificateForDeviceAccountIdentifier:withCertificateType:]( self->_barcodeCertManager,  "removeCertificateForDeviceAccountIdentifier:withCertificateType:");
  if (a4 == 1) {
    -[PDDatabaseManager removeAllBarcodeCredentialValuesForDPANIdentifier:]( self->_databaseManager,  "removeAllBarcodeCredentialValuesForDPANIdentifier:",  v6);
  }
}

- (void)_performDeviceSignatureWithData:(id)a3 forPass:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceAccountIdentifier]);
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10031675C;
    v18[3] = &unk_100656648;
    v18[4] = self;
    id v19 = v14;
    id v20 = v12;
    id v21 = v15;
    id v22 = v11;
    id v23 = v10;
    id v24 = v13;
    id v16 = v15;
    id v17 = v14;
    -[PDBarcodeCredentialManager _signData:withDeviceAccountIdentifier:sessionExchangeToken:completion:]( self,  "_signData:withDeviceAccountIdentifier:sessionExchangeToken:completion:",  v23,  v17,  v20,  v18);
  }
}

- (void)_signData:(id)a3 withDeviceAccountIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, CFErrorRef))a6;
  if (v13)
  {
    if (v10)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDBarcodeCertificateManager fetchKeyDataForDeviceAccountIdentifier:withCertificateType:]( self->_barcodeCertManager,  "fetchKeyDataForDeviceAccountIdentifier:withCertificateType:",  v11,  0LL));
      __int16 v15 = (__CFError *)objc_claimAutoreleasedReturnValue( -[PDBarcodeCertificateManager fetchCertificatesForDeviceAccountIdentifier:withCertificateType:]( self->_barcodeCertManager,  "fetchCertificatesForDeviceAccountIdentifier:withCertificateType:",  v11,  0LL));
      id v16 = v15;
      if (v14 && -[__CFError count](v15, "count"))
      {
        CFErrorRef error = 0LL;
        SecAccessControlRef v17 = SecAccessControlCreateWithFlags( kCFAllocatorDefault,  kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly,  0x40000000uLL,  &error);
        SecAccessControlRef v18 = v17;
        CFErrorRef v19 = error;
        if (error)
        {
          if (v17)
          {
            CFRelease(v17);
            CFErrorRef v19 = error;
          }

          v13[2](v13, 0LL, v19);
        }

        else
        {
          id v38 = @"osgn";
          objc_super v39 = &__kCFBooleanTrue;
          CFErrorRef v19 = (CFErrorRef)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
          SecAccessControlSetConstraints(v18, v19);
          id v36 = &off_100690740;
          __int16 v37 = @"Sign digest";
          uint64_t v24 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
          id v25 = objc_alloc_init(&OBJC_CLASS___LAContext);
          char v31 = (void *)v24;
          id v32 = 0LL;
          id v26 =  -[LAContext evaluateAccessControl:operation:options:error:]( v25,  "evaluateAccessControl:operation:options:error:",  v18,  3LL,  v24,  &v32);
          v27 = (__CFError *)v32;
          if (v18) {
            CFRelease(v18);
          }
          if (v27)
          {
            v13[2](v13, 0LL, v27);
          }

          else
          {
            uint64_t v30 = PKAuxiliaryCapabilityErrorDomain;
            NSErrorUserInfoKey v34 = NSDebugDescriptionErrorKey;
            dispatch_queue_t v35 = @"Platform not supported.";
            id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
            id v28 = (__CFError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v30,  -1LL,  v29));
            v13[2](v13, 0LL, v28);
          }
        }
      }

      else
      {
        uint64_t v20 = PKAuxiliaryCapabilityErrorDomain;
        NSErrorUserInfoKey v40 = NSDebugDescriptionErrorKey;
        id v41 = @"Key data not found to sign the payload";
        id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
        id v22 = (__CFError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  1LL,  v21));
        v13[2](v13, 0LL, v22);
      }
    }

    else
    {
      uint64_t v23 = PKAuxiliaryCapabilityErrorDomain;
      NSErrorUserInfoKey v42 = NSDebugDescriptionErrorKey;
      id v43 = @"No data to sign";
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
      id v16 = (__CFError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v23,  -1LL,  v14));
      v13[2](v13, 0LL, v16);
    }
  }
}

- (void)registeredPassForAuxiliaryCapabilityPass:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100316E98;
  v7[3] = &unk_1006392B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void).cxx_destruct
{
}

@end