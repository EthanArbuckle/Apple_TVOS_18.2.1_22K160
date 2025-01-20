@interface PDPeerPaymentAccountManager
- (PDPeerPaymentAccountManager)initWithDatabaseManager:(id)a3 cloudStoreNotificationCoordinator:(id)a4 transactionProcessor:(id)a5;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_handlePeerPaymentPendingRequestsChanged;
- (void)_handleRecurringPaymentsChanged;
- (void)deleteAllRecurringPaymentsWithCompletion:(id)a3;
- (void)deletePeerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3;
- (void)deletePeerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4;
- (void)deleteRecurringPaymentsForIdentifiers:(id)a3 completion:(id)a4;
- (void)hasRecurringPayments:(id)a3;
- (void)insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier:(id)a3 memo:(id)a4 counterpartAppearanceData:(id)a5 completion:(id)a6;
- (void)insertOrUpdatePeerPaymentPendingRequests:(id)a3 completion:(id)a4;
- (void)insertOrUpdateRecurringPayments:(id)a3 completion:(id)a4;
- (void)peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3;
- (void)peerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateAutoReloadAmount:(id)a3 threshold:(id)a4 identifier:(id)a5 completion:(id)a6;
- (void)updateRecurringPaymentMemo:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)updateRecurringPaymentStatus:(unint64_t)a3 identifier:(id)a4 completion:(id)a5;
@end

@implementation PDPeerPaymentAccountManager

- (PDPeerPaymentAccountManager)initWithDatabaseManager:(id)a3 cloudStoreNotificationCoordinator:(id)a4 transactionProcessor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PDPeerPaymentAccountManager;
  v12 = -[PDPeerPaymentAccountManager init](&v21, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseManager, a3);
    objc_storeStrong((id *)&v13->_cloudStoreCoordinator, a4);
    objc_storeStrong((id *)&v13->_transactionProcessor, a5);
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v14;

    v13->_lockObservers._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.passd.peerpaymentaccountmanager.reply", v17);
    replyQueue = v13->_replyQueue;
    v13->_replyQueue = (OS_dispatch_queue *)v18;
  }

  return v13;
}

- (void)peerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001ADE94;
  block[3] = &unk_10063C450;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)replyQueue, block);
}

- (void)peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3
{
  id v4 = a3;
  replyQueue = self->_replyQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001ADF88;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)replyQueue, v7);
}

- (void)insertOrUpdatePeerPaymentPendingRequests:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001AE080;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)replyQueue, block);
}

- (void)deletePeerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001AE170;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)replyQueue, block);
}

- (void)deletePeerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3
{
  id v4 = a3;
  replyQueue = self->_replyQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001AE234;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)replyQueue, v7);
}

- (void)_handlePeerPaymentPendingRequestsChanged
{
}

- (void)updateAutoReloadAmount:(id)a3 threshold:(id)a4 identifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v36 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v11 length])
  {
    id v34 = v10;
    v35 = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager peerPaymentRecurringPayments]( self->_databaseManager,  "peerPaymentRecurringPayments"));
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v14 = v13;
    id v15 = [v14 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v41;
LABEL_4:
      uint64_t v18 = 0LL;
      while (1)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v40 + 1) + 8 * v18);
        id v20 = (id)objc_claimAutoreleasedReturnValue([v19 identifier]);
        id v21 = v11;
        v22 = v21;
        if (v20 == v21) {
          break;
        }
        if (v11 && v20)
        {
          unsigned __int8 v23 = [v20 isEqualToString:v21];

          if ((v23 & 1) != 0) {
            goto LABEL_21;
          }
        }

        else
        {
        }

        if (v16 == (id)++v18)
        {
          id v16 = [v14 countByEnumeratingWithState:&v40 objects:v46 count:16];
          if (v16) {
            goto LABEL_4;
          }
          goto LABEL_15;
        }
      }

LABEL_21:
      v27 = v19;

      id v10 = v34;
      if (v27) {
        goto LABEL_23;
      }
    }

    else
    {
LABEL_15:

      id v10 = v34;
    }

    v27 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentRecurringPayment);
    -[PKPeerPaymentRecurringPayment setIdentifier:](v27, "setIdentifier:", v11);
    -[PKPeerPaymentRecurringPayment setType:](v27, "setType:", 3LL);
    -[PKPeerPaymentRecurringPayment setStatus:](v27, "setStatus:", 1LL);
    -[PKPeerPaymentRecurringPayment setActions:](v27, "setActions:", 2LL);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v10 currency]);
    -[PKPeerPaymentRecurringPayment setCurrency:](v27, "setCurrency:", v28);

LABEL_23:
    v29 = (void *)objc_claimAutoreleasedReturnValue([v10 amount]);
    -[PKPeerPaymentRecurringPayment setAmount:](v27, "setAmount:", v29);

    v26 = v36;
    v30 = (void *)objc_claimAutoreleasedReturnValue([v36 amount]);
    -[PKPeerPaymentRecurringPayment setThreshold:](v27, "setThreshold:", v30);

    databaseManager = self->_databaseManager;
    v45 = v27;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL));
    -[PDDatabaseManager insertOrUpdatePeerPaymentRecurringPayments:]( databaseManager,  "insertOrUpdatePeerPaymentRecurringPayments:",  v32);

    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001AE638;
    block[3] = &unk_10063C450;
    void block[4] = self;
    id v12 = v35;
    id v39 = v35;
    id v38 = v11;
    dispatch_async((dispatch_queue_t)replyQueue, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(11LL);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Missing identifier while updating auto reload, ignoring.",  buf,  2u);
    }

    v26 = v36;
    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0LL);
    }
  }
}

- (void)deleteRecurringPaymentsForIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001AE74C;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)replyQueue, block);
}

- (void)deleteAllRecurringPaymentsWithCompletion:(id)a3
{
  id v4 = a3;
  replyQueue = self->_replyQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001AE810;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)replyQueue, v7);
}

- (void)insertOrUpdateRecurringPayments:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001AE900;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)replyQueue, block);
}

- (void)updateRecurringPaymentMemo:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 emoji]);
  if ([v11 length])
  {
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 text]);
    id v13 = [v12 length];

    if (!v13)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(11LL);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 138412290;
      id v58 = v9;
      v27 = "Memo is empty for recurring payment identifier: %@, ignoring.";
      v28 = v26;
      uint32_t v29 = 12;
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
LABEL_33:

      if (v10) {
        v10[2](v10, 0LL);
      }
      goto LABEL_35;
    }
  }

  if (![v9 length])
  {
    uint64_t v25 = PKLogFacilityTypeGetObject(11LL);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v27 = "Missing identifier while updating memo, ignoring.";
    v28 = v26;
    uint32_t v29 = 2;
    goto LABEL_32;
  }

  __int128 v42 = v10;
  id v43 = v8;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager peerPaymentRecurringPayments]( self->_databaseManager,  "peerPaymentRecurringPayments"));
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v51;
LABEL_7:
    uint64_t v19 = 0LL;
    while (1)
    {
      if (*(void *)v51 != v18) {
        objc_enumerationMutation(v15);
      }
      id v20 = *(void **)(*((void *)&v50 + 1) + 8 * v19);
      id v21 = (id)objc_claimAutoreleasedReturnValue([v20 identifier]);
      id v22 = v9;
      unsigned __int8 v23 = v22;
      if (v21 == v22) {
        break;
      }
      if (v9 && v21)
      {
        unsigned __int8 v24 = [v21 isEqualToString:v22];

        if ((v24 & 1) != 0) {
          goto LABEL_22;
        }
      }

      else
      {
      }

      if (v17 == (id)++v19)
      {
        id v17 = [v15 countByEnumeratingWithState:&v50 objects:v56 count:16];
        if (v17) {
          goto LABEL_7;
        }
        goto LABEL_18;
      }
    }

LABEL_22:
    id v8 = v43;
    [v20 setMemo:v43];
    v30 = v20;
    databaseManager = self->_databaseManager;
    v55 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v55, 1LL));
    -[PDDatabaseManager insertOrUpdatePeerPaymentRecurringPayments:]( databaseManager,  "insertOrUpdatePeerPaymentRecurringPayments:",  v32);

    if (!v30) {
      goto LABEL_24;
    }
    uint64_t v33 = PKLogFacilityTypeGetObject(11LL);
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    id v10 = v42;
  }

  else
  {
LABEL_18:

    id v8 = v43;
LABEL_24:
    uint64_t v35 = PKLogFacilityTypeGetObject(11LL);
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    id v10 = v42;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v58 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Inserting memo for recurring payment which did not exist on device with identifier %@",  buf,  0xCu);
    }

    v30 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentRecurringPayment);
    -[PKPeerPaymentRecurringPayment setIdentifier:](v30, "setIdentifier:", v9);
    -[PKPeerPaymentRecurringPayment setMemo:](v30, "setMemo:", v8);
    id v36 = self->_databaseManager;
    v54 = v30;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v54, 1LL));
    -[PDDatabaseManager insertOrUpdatePeerPaymentRecurringPayments:]( v36,  "insertOrUpdatePeerPaymentRecurringPayments:",  v37);
  }

  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v58 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Uploading memo for recurring payment %@",  buf,  0xCu);
  }

  id v38 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator applePayContainer]( self->_cloudStoreCoordinator,  "applePayContainer"));
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_1001AEE18;
  v48[3] = &unk_10063F0A0;
  id v49 = v9;
  [v38 uploadRecurringPayment:v30 completion:v48];

  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001AEED8;
  block[3] = &unk_10063C6A8;
  v46 = self;
  v47 = v10;
  v45 = v30;
  __int128 v40 = v30;
  dispatch_async((dispatch_queue_t)replyQueue, block);

LABEL_35:
}

- (void)updateRecurringPaymentStatus:(unint64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (!a3)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(11LL);
    unsigned __int8 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 138412290;
    id v44 = v8;
    unsigned __int8 v24 = "Unknown status for recurring payment identifier: %@, ignoring.";
    uint64_t v25 = v23;
    uint32_t v26 = 12;
    goto LABEL_21;
  }

  if (![v8 length])
  {
    uint64_t v27 = PKLogFacilityTypeGetObject(11LL);
    unsigned __int8 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    unsigned __int8 v24 = "Missing identifier while updating status, ignoring.";
    uint64_t v25 = v23;
    uint32_t v26 = 2;
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
LABEL_22:

    if (v9) {
      v9[2](v9, 0LL);
    }
    goto LABEL_28;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager peerPaymentRecurringPayments]( self->_databaseManager,  "peerPaymentRecurringPayments"));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v12)
  {
    id v13 = v12;
    v32 = self;
    uint64_t v33 = v9;
    uint64_t v14 = *(void *)v38;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        id v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier", v32));
        id v18 = v8;
        uint64_t v19 = v18;
        if (v17 == v18)
        {

LABEL_25:
          [v16 setStatus:a3];
          id v21 = v16;
          self = v32;
          databaseManager = v32->_databaseManager;
          id v41 = v21;
          uint32_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v41,  1LL));
          -[PDDatabaseManager insertOrUpdatePeerPaymentRecurringPayments:]( databaseManager,  "insertOrUpdatePeerPaymentRecurringPayments:",  v29);

          id v9 = v33;
          goto LABEL_27;
        }

        if (v8 && v17)
        {
          unsigned int v20 = [v17 isEqualToString:v18];

          if (v20) {
            goto LABEL_25;
          }
        }

        else
        {
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v13) {
        continue;
      }
      break;
    }

    id v21 = 0LL;
    self = v32;
    id v9 = v33;
  }

  else
  {
    id v21 = 0LL;
  }

- (void)hasRecurringPayments:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager peerPaymentRecurringPayments]( self->_databaseManager,  "peerPaymentRecurringPayments"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ([v10 type] == (id)3
          || [v10 type] == (id)1 && (objc_msgSend(v10, "sentByMe") & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_13;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)_handleRecurringPaymentsChanged
{
}

- (void)insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier:(id)a3 memo:(id)a4 counterpartAppearanceData:(id)a5 completion:(id)a6
{
  id v10 = (PKPeerPaymentCounterpartImageData *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    id v14 = -[PKPeerPaymentCounterpartImageData initWithAppearanceData:]( objc_alloc(&OBJC_CLASS___PKPeerPaymentCounterpartImageData),  "initWithAppearanceData:",  v12);
    char v15 = (PKPeerPaymentCounterpartImageData *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentCounterpartImageData identifier](v14, "identifier"));
    uint64_t Object = PKLogFacilityTypeGetObject(11LL);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v14;
      __int16 v29 = 2112;
      v30 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "NearbyPeerPayment: Inserting counterpart image data: %@, for transaction identifier: %@",  buf,  0x16u);
    }

    -[PDDatabaseManager insertOrUpdatePeerPaymentCounterpartImageData:]( self->_databaseManager,  "insertOrUpdatePeerPaymentCounterpartImageData:",  v14);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "NearbyPeerPayment: Uploading counterpart image data with identifier %@ to CloudKit",  buf,  0xCu);
    }

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator applePayContainer]( self->_cloudStoreCoordinator,  "applePayContainer"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1001AF6E4;
    v25[3] = &unk_10063F0A0;
    __int128 v19 = v15;
    uint32_t v26 = v19;
    [v18 uploadCounterpartImageData:v14 completion:v25];
  }

  else
  {
    uint64_t v20 = PKLogFacilityTypeGetObject(11LL);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    __int128 v19 = 0LL;
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v10;
    __int16 v29 = 2112;
    v30 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "NearbyPeerPayment: inserting device originated transaction with identifier: %@, counterpartImageDataIdentifier: %@",  buf,  0x16u);
  }

  databaseManager = self->_databaseManager;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1001AF7A4;
  v23[3] = &unk_100649C10;
  v23[4] = self;
  id v24 = v13;
  id v22 = v13;
  -[PDDatabaseManager insertOrUpdateDeviceOriginatedNearbyPeerPaymentMemo:counterpartImageDataIdentifier:forTransactionWithServiceIdentifier:completion:]( databaseManager,  "insertOrUpdateDeviceOriginatedNearbyPeerPaymentMemo:counterpartImageDataIdentifier:forTransactionWithServiceIdentifier:completion:",  v11,  v19,  v10,  v23);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001AF9F8;
    v8[3] = &unk_10063AC90;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)replyQueue, v8);
  }
}

- (void).cxx_destruct
{
}

@end