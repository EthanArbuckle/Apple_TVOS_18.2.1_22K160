@interface PDTransitStateManager
- (PDTransitStateManager)init;
- (PDTransitStateManager)initWithDatabaseManager:(id)a3 expressPassManager:(id)a4 secureElement:(id)a5 transactionProcessor:(id)a6 paymentWebServiceCoordinator:(id)a7 delegate:(id)a8;
- (PDTransitStateManagerDelegate)delegate;
- (void)_ingestAppletStateHistory:(id)a3 withTransactionDate:(id)a4 forceTransactionGeneration:(BOOL)a5 recoverMissingTransactions:(BOOL)a6 forPaymentApplication:(id)a7 withPassUniqueIdentifier:(id)a8 skipQueuedRequestSanitization:(BOOL)a9 expressTransactionState:(id)a10;
- (void)_notifyIssuerAppletStateDirtyWithPassID:(id)a3 forPaymentApplication:(id)a4;
- (void)_performWebRequestToNotifyIssuerAppletDirty;
- (void)_performWebRequestToNotifyIssuerAppletDirtyIfNecessary;
- (void)_queueTransitStateFetchRequest:(id)a3;
- (void)_resolveStationCodesForAppletState:(id)a3 paymentApplication:(id)a4 passUniqueIdentifier:(id)a5;
- (void)_scheduleOneOffActivityRequest;
- (void)_scheduleRepeatingActivityRequest;
- (void)_unscheduleOneOffActivityRequest;
- (void)_unschedulePeriodicActivityRequest;
- (void)dealloc;
- (void)expressPassManager:(id)a3 didFinishExpressTransactionWithState:(id)a4;
- (void)expressPassManager:(id)a3 willProcessPaymentApplicationsUpdateFromPriorPaymentApplications:(id)a4 toPaymentApplications:(id)a5 forPassUniqueIdentifier:(id)a6;
- (void)fetchAndCacheTransitStateForPassUniqueIdentifier:(id)a3 secureElementIdentifier:(id)a4 paymentApplicationIdentifier:(id)a5;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)processTransactionEventWithHistory:(id)a3 transactionDate:(id)a4 forPaymentApplication:(id)a5 withPassUniqueIdentifier:(id)a6 expressTransactionState:(id)a7;
- (void)secureElementDidUpdateAppletStateForApplicationIdentifier:(id)a3 keyIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)transitAppletStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5;
- (void)updateAllExpressTransitAppletStates;
- (void)updateTransitAppletStateWithHistory:(id)a3 transactionDate:(id)a4 forPaymentApplication:(id)a5 withPassUniqueIdentifier:(id)a6;
@end

@implementation PDTransitStateManager

- (PDTransitStateManager)init
{
  return 0LL;
}

- (PDTransitStateManager)initWithDatabaseManager:(id)a3 expressPassManager:(id)a4 secureElement:(id)a5 transactionProcessor:(id)a6 paymentWebServiceCoordinator:(id)a7 delegate:(id)a8
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___PDTransitStateManager;
  v18 = -[PDTransitStateManager init](&v32, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_databaseManager, a3);
    objc_storeStrong((id *)&v19->_expressPassManager, a4);
    objc_storeStrong((id *)&v19->_secureElement, a5);
    objc_storeStrong((id *)&v19->_transactionProcessor, a6);
    objc_storeStrong((id *)&v19->_paymentWebServiceCoordinator, a7);
    objc_storeWeak((id *)&v19->_delegate, v17);
    dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.passd.felicaStateManager", v21);
    accessQueue = v19->_accessQueue;
    v19->_accessQueue = (OS_dispatch_queue *)v22;

    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    transitRequests = v19->_transitRequests;
    v19->_transitRequests = v24;

    v26 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    appletStateDirtyRequests = v19->_appletStateDirtyRequests;
    v19->_appletStateDirtyRequests = &v26->super;

    v19->_appletStateDirtyLock._os_unfair_lock_opaque = 0;
    v19->_performingAppletDirtyRequests = 0;
    PDNFSecureXPCRegisterSecureElementEventObserver(v19);
    sub_10014DBAC((uint64_t)v19->_expressPassManager, v19);
    PDScheduledActivityClientRegister( @"PDScheduleActivityTransitStateManagerClientIdentifier",  v19,  v19->_accessQueue);
  }

  return v19;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDTransitStateManager;
  -[PDTransitStateManager dealloc](&v3, "dealloc");
}

- (void)fetchAndCacheTransitStateForPassUniqueIdentifier:(id)a3 secureElementIdentifier:(id)a4 paymentApplicationIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)PDOSTransactionCreate("PDTransitStateManager");
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BD540;
  block[3] = &unk_10063AE10;
  id v18 = v11;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  dispatch_queue_t v22 = self;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = v11;
  dispatch_async((dispatch_queue_t)accessQueue, block);
}

- (void)_queueTransitStateFetchRequest:(id)a3
{
}

- (void)processTransactionEventWithHistory:(id)a3 transactionDate:(id)a4 forPaymentApplication:(id)a5 withPassUniqueIdentifier:(id)a6 expressTransactionState:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)PDOSTransactionCreate("PDTransitStateManager");
  if (!v13) {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BD70C;
  block[3] = &unk_10063AE60;
  id v26 = v17;
  id v27 = v12;
  v28 = self;
  id v29 = v13;
  id v30 = v14;
  id v31 = v15;
  id v32 = v16;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  id v24 = v17;
  dispatch_async((dispatch_queue_t)accessQueue, block);
}

- (void)updateTransitAppletStateWithHistory:(id)a3 transactionDate:(id)a4 forPaymentApplication:(id)a5 withPassUniqueIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)PDOSTransactionCreate("PDTransitStateManager");
  accessQueue = self->_accessQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000BD930;
  v21[3] = &unk_100640CE0;
  id v22 = v14;
  id v23 = self;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  id v27 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  id v20 = v14;
  dispatch_async((dispatch_queue_t)accessQueue, v21);
}

- (void)_ingestAppletStateHistory:(id)a3 withTransactionDate:(id)a4 forceTransactionGeneration:(BOOL)a5 recoverMissingTransactions:(BOOL)a6 forPaymentApplication:(id)a7 withPassUniqueIdentifier:(id)a8 skipQueuedRequestSanitization:(BOOL)a9 expressTransactionState:(id)a10
{
  BOOL v41 = a6;
  BOOL v12 = a5;
  id v44 = a3;
  id v43 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = a10;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (v12)
  {
    unsigned int v18 = [v15 isParsedTransitApplication];
    uint64_t v19 = 1LL;
    if (v17 && v18) {
      uint64_t v19 = (uint64_t)[v17 transacted];
    }
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  v42 = v17;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_1000BDDA0;
  v50[3] = &unk_100640D08;
  v50[4] = self;
  id v20 = v16;
  id v51 = v20;
  id v21 = v15;
  id v52 = v21;
  -[PDTransitStateManager transitAppletStateWithPassUniqueIdentifier:paymentApplication:completion:]( self,  "transitAppletStateWithPassUniqueIdentifier:paymentApplication:completion:",  v20,  v21,  v50);
  id v22 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v20));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 paymentPass]);

  if (v23)
  {
    if ([v23 isStoredValuePass])
    {
      id v24 = PKPaymentPassBalanceLabelDictionary(v23);
      id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      id v26 = PKPaymentPassUnitDictionary(v23);
      id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      id v28 = PKPaymentPassPlanLabelDictionary(v23);
      id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      goto LABEL_13;
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Error no pass in database for pass unique ID: %@",  buf,  0xCu);
    }
  }

  id v29 = 0LL;
  id v27 = 0LL;
  id v25 = 0LL;
LABEL_13:
  databaseManager = self->_databaseManager;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1000BDDDC;
  v47[3] = &unk_100640D30;
  v47[4] = self;
  id v33 = v21;
  id v48 = v33;
  id v34 = v20;
  id v49 = v34;
  -[PDDatabaseManager updateTransitAppletStateWithHistory:transactionDate:forPaymentApplication:withPassUniqueIdentifier:forceTransactionGeneration:recoverMissingTransactions:balanceLabelDictionary:unitDictionary:planLabelDictionary:completion:]( databaseManager,  "updateTransitAppletStateWithHistory:transactionDate:forPaymentApplication:withPassUniqueIdentifier:forceTransactionG eneration:recoverMissingTransactions:balanceLabelDictionary:unitDictionary:planLabelDictionary:completion:",  v44,  v43,  v33,  v34,  v19,  v41,  v25,  v27,  v29,  v47);
  if (!a9)
  {
    v35 = objc_alloc_init(&OBJC_CLASS___PDTransitStateFetchRequest);
    -[PDTransitStateFetchRequest setPassUniqueIdentifier:](v35, "setPassUniqueIdentifier:", v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v33 secureElementIdentifier]);
    -[PDTransitStateFetchRequest setSecureElementIdentifier:](v35, "setSecureElementIdentifier:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue([v33 applicationIdentifier]);
    -[PDTransitStateFetchRequest setPaymentApplicationIdentifier:](v35, "setPaymentApplicationIdentifier:", v37);

    transitRequests = self->_transitRequests;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1000BDFCC;
    v45[3] = &unk_100640D58;
    v39 = v35;
    v46 = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](transitRequests, "indexesOfObjectsPassingTest:", v45));
    if ([v40 count]) {
      -[NSMutableArray removeObjectsAtIndexes:](self->_transitRequests, "removeObjectsAtIndexes:", v40);
    }
  }
}

- (void)transitAppletStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    accessQueue = self->_accessQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000BE0AC;
    v12[3] = &unk_10063B440;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async((dispatch_queue_t)accessQueue, v12);
  }
}

- (void)_resolveStationCodesForAppletState:(id)a3 paymentApplication:(id)a4 passUniqueIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000BE4B4;
  v39[3] = &unk_100640D80;
  id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(@"0000", "pk_decodeHexadecimal"));
  id v40 = v12;
  id v13 = v11;
  BOOL v41 = v13;
  id v14 = objc_retainBlock(v39);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 felicaState]);

  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 greenCarOriginStationCode]);
    ((void (*)(void *, void *))v14[2])(v14, v16);

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 greenCarDestinationStationCode]);
    ((void (*)(void *, void *))v14[2])(v14, v17);

    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v15 shinkansenOriginStationCode]);
    ((void (*)(void *, void *))v14[2])(v14, v18);

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 shinkansenDestinationStationCode]);
    ((void (*)(void *, void *))v14[2])(v14, v19);

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 shinkansenSecondaryOriginStationCode]);
    ((void (*)(void *, void *))v14[2])(v14, v20);

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 shinkansenSecondaryDestinationStationCode]);
    ((void (*)(void *, void *))v14[2])(v14, v21);

    id v22 = -[NSMutableSet count](v13, "count");
    if (v22)
    {
      id v23 = v22;
      id v32 = self;
      uint64_t Object = PKLogFacilityTypeGetObject(12LL);
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationIdentifier]);
        *(_DWORD *)buf = 138412290;
        id v43 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Processing Felica Applet State For Stations: %@",  buf,  0xCu);
      }

      id v27 = objc_alloc_init(off_100704CC0());
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v13, "allObjects"));
      [v27 setStationCodes:v28];

      id v29 = (void *)objc_claimAutoreleasedReturnValue([v8 stationCodeProvider]);
      [v27 setSourceIdentifier:v29];

      id v30 = objc_alloc_init(off_100704CC8());
      [v30 _setExternalTransitLookupParameters:v27];
      id v31 = [objc_alloc(off_100704CD0()) initWithRequest:v30];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1000BE50C;
      v33[3] = &unk_100640DA8;
      id v38 = v23;
      id v34 = v8;
      v35 = v32;
      id v36 = v9;
      v37 = v13;
      [v31 startWithCompletionHandler:v33];
    }

    else
    {
      -[PDDatabaseManager updateTransitAppletStateWithStationNames:forPaymentApplication:withPassUniqueIdentifier:]( self->_databaseManager,  "updateTransitAppletStateWithStationNames:forPaymentApplication:withPassUniqueIdentifier:",  0LL,  v8,  v9);
    }
  }
}

- (void)secureElementDidUpdateAppletStateForApplicationIdentifier:(id)a3 keyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(12LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v6;
      __int16 v25 = 2112;
      id v26 = v7;
      id v11 = "Handle SE Event From TSM for application identifier: %@ key identifier: %@.";
      id v12 = v9;
      uint32_t v13 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
  }

  else if (v10)
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v6;
    id v11 = "Handle SE Event From TSM for application identifier: %@.";
    id v12 = v9;
    uint32_t v13 = 12;
    goto LABEL_6;
  }

  id v14 = (void *)PDOSTransactionCreate("PDTransitStateManager");
  id v15 = PDDefaultQueue();
  id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BE8F4;
  block[3] = &unk_100639350;
  id v20 = v14;
  id v21 = self;
  id v22 = v6;
  id v17 = v6;
  id v18 = v14;
  dispatch_async(v16, block);
}

- (void)updateAllExpressTransitAppletStates
{
  objc_super v3 = (void *)PDOSTransactionCreate("PDTransitStateManager");
  expressPassManager = self->_expressPassManager;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000BEBB4;
  v6[3] = &unk_100640DF8;
  id v7 = v3;
  id v8 = self;
  id v5 = v3;
  sub_10014C1C8((uint64_t)expressPassManager, v6);
}

- (void)expressPassManager:(id)a3 willProcessPaymentApplicationsUpdateFromPriorPaymentApplications:(id)a4 toPaymentApplications:(id)a5 forPassUniqueIdentifier:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)PDOSTransactionCreate("PDTransitStateManager");
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BF060;
  block[3] = &unk_10063AE10;
  id v19 = v12;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  id v23 = self;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  id v17 = v12;
  dispatch_async((dispatch_queue_t)accessQueue, block);
}

- (void)expressPassManager:(id)a3 didFinishExpressTransactionWithState:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 passUniqueIdentifier]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationIdentifier]);
    if ([v6 status] != (id)2 && !objc_msgSend(v6, "isIgnorable") && v7 && v8)
    {
      id v9 = (void *)PDOSTransactionCreate("PDTransitStateManager");
      accessQueue = self->_accessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000BF4F8;
      block[3] = &unk_10063AE10;
      id v13 = v9;
      id v14 = self;
      id v15 = v7;
      id v16 = v8;
      id v17 = v6;
      id v11 = v9;
      dispatch_async((dispatch_queue_t)accessQueue, block);
    }
  }
}

- (void)_notifyIssuerAppletStateDirtyWithPassID:(id)a3 forPaymentApplication:(id)a4
{
  p_appletStateDirtyLock = &self->_appletStateDirtyLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_appletStateDirtyLock);
  id v9 = -[PKTransitAppletStateDirty initWithPassUniqueIdentifier:paymentApplication:]( objc_alloc(&OBJC_CLASS___PKTransitAppletStateDirty),  "initWithPassUniqueIdentifier:paymentApplication:",  v8,  v7);

  id v10 = (id)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager insertOrUpdateAppletStateDirtyForTransitAppletStateDirty:]( self->_databaseManager,  "insertOrUpdateAppletStateDirtyForTransitAppletStateDirty:",  v9));
  -[NSMutableSet addObject:](self->_appletStateDirtyRequests, "addObject:", v10);
  -[PDTransitStateManager _scheduleOneOffActivityRequest](self, "_scheduleOneOffActivityRequest");
  os_unfair_lock_unlock(p_appletStateDirtyLock);
  -[PDTransitStateManager _performWebRequestToNotifyIssuerAppletDirtyIfNecessary]( self,  "_performWebRequestToNotifyIssuerAppletDirtyIfNecessary");
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  p_appletStateDirtyLock = &self->_appletStateDirtyLock;
  os_unfair_lock_lock(&self->_appletStateDirtyLock);
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager retrieveDirtyAppletStates](self->_databaseManager, "retrieveDirtyAppletStates"));
  appletStateDirtyRequests = self->_appletStateDirtyRequests;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  -[NSMutableSet addObjectsFromArray:](appletStateDirtyRequests, "addObjectsFromArray:", v7);

  os_unfair_lock_unlock(p_appletStateDirtyLock);
  -[PDTransitStateManager _performWebRequestToNotifyIssuerAppletDirtyIfNecessary]( self,  "_performWebRequestToNotifyIssuerAppletDirtyIfNecessary");
}

- (void)_scheduleOneOffActivityRequest
{
  if ((PDScheduledActivityExists( @"PDScheduleActivityTransitStateManagerClientIdentifier",  @"PDScheduleActivityAppletStateDirtyOneOffActivityIdentifier") & 1) == 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Scheduling one off scheduleOneOffActivityRequest Activity for notification of applet state dirty",  v6,  2u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 300.0));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "priorityActivityCriteriaWithStartDate:",  v4));
    [v5 setRequireNetworkConnectivity:1];
    PDScheduledActivityRegister( @"PDScheduleActivityTransitStateManagerClientIdentifier",  @"PDScheduleActivityAppletStateDirtyOneOffActivityIdentifier",  v5);
  }

- (void)_scheduleRepeatingActivityRequest
{
  if ((PDScheduledActivityExists( @"PDScheduleActivityTransitStateManagerClientIdentifier",  @"PDScheduleActivityAppletStateDirtyPeriodicActivityIdentifier") & 1) == 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Scheduling repeating scheduleOneOffActivityRequest Activity for notification of applet state dirty",  v6,  2u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  3600.0));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "priorityActivityCriteriaWithStartDate:",  v4));
    [v5 setRequireNetworkConnectivity:1];
    [v5 setRepeating:1];
    [v5 setRepeatInterval:86400.0];
    PDScheduledActivityRegister( @"PDScheduleActivityTransitStateManagerClientIdentifier",  @"PDScheduleActivityAppletStateDirtyPeriodicActivityIdentifier",  v5);
  }

- (void)_unscheduleOneOffActivityRequest
{
  if (PDScheduledActivityExists( @"PDScheduleActivityTransitStateManagerClientIdentifier",  @"PDScheduleActivityAppletStateDirtyOneOffActivityIdentifier"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Unscheduling one off scheduleOneOffActivityRequest Activity for notification of applet state dirty",  v4,  2u);
    }

    PDScheduledActivityRemove( @"PDScheduleActivityTransitStateManagerClientIdentifier",  @"PDScheduleActivityAppletStateDirtyOneOffActivityIdentifier");
  }

- (void)_unschedulePeriodicActivityRequest
{
  if (PDScheduledActivityExists( @"PDScheduleActivityTransitStateManagerClientIdentifier",  @"PDScheduleActivityAppletStateDirtyPeriodicActivityIdentifier"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Scheduling repeating scheduleOneOffActivityRequest Activity for notification of applet state dirty",  v4,  2u);
    }

    PDScheduledActivityRemove( @"PDScheduleActivityTransitStateManagerClientIdentifier",  @"PDScheduleActivityAppletStateDirtyPeriodicActivityIdentifier");
  }

- (void)_performWebRequestToNotifyIssuerAppletDirtyIfNecessary
{
  p_appletStateDirtyLock = &self->_appletStateDirtyLock;
  os_unfair_lock_lock(&self->_appletStateDirtyLock);
  if (self->_performingAppletDirtyRequests)
  {
    os_unfair_lock_unlock(p_appletStateDirtyLock);
  }

  else
  {
    self->_performingAppletDirtyRequests = 1;
    os_unfair_lock_unlock(p_appletStateDirtyLock);
    -[PDTransitStateManager _performWebRequestToNotifyIssuerAppletDirty]( self,  "_performWebRequestToNotifyIssuerAppletDirty");
  }

- (void)_performWebRequestToNotifyIssuerAppletDirty
{
  p_appletStateDirtyLock = &self->_appletStateDirtyLock;
  os_unfair_lock_lock(&self->_appletStateDirtyLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->_appletStateDirtyRequests, "anyObject"));
  if (v4)
  {
    self->_performingAppletDirtyRequests = 1;
    -[NSMutableSet removeObject:](self->_appletStateDirtyRequests, "removeObject:", v4);
    os_unfair_lock_unlock(p_appletStateDirtyLock);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 passUniqueIdentifier]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dpanIdentifier]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v5));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serialNumber]);
    id v9 = [[PKPaymentNotifyIssuerAppletDirtyRequest alloc] initWithPassSerialNumber:v8 deviceAccountIdentifier:v6];
    objc_initWeak(&location, self);
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000BFD2C;
    v12[3] = &unk_100640E70;
    id v11 = v9;
    id v13 = v11;
    objc_copyWeak(&v15, &location);
    id v14 = v4;
    -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( paymentWebServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  else
  {
    self->_performingAppletDirtyRequests = 0;
    if (-[PDDatabaseManager dirtyAppletStateCount](self->_databaseManager, "dirtyAppletStateCount") < 1)
    {
      -[PDTransitStateManager _unscheduleOneOffActivityRequest](self, "_unscheduleOneOffActivityRequest");
      -[PDTransitStateManager _unschedulePeriodicActivityRequest](self, "_unschedulePeriodicActivityRequest");
    }

    else
    {
      -[PDTransitStateManager _scheduleRepeatingActivityRequest](self, "_scheduleRepeatingActivityRequest");
    }

    os_unfair_lock_unlock(p_appletStateDirtyLock);
  }
}

- (PDTransitStateManagerDelegate)delegate
{
  return (PDTransitStateManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end