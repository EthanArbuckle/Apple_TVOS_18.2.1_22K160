@interface PDDefaultPassManager
- (PDDefaultPassManager)init;
- (PDDefaultPassManager)initWithDatabaseManager:(id)a3 fieldDetectorManager:(id)a4 remoteInterfacePresenter:(id)a5 assertionManager:(id)a6 delegate:(id)a7;
- (PDDefaultPassManagerDelegate)delegate;
- (id)_queue_identifyDefaultPaymentPassWithCurrentDefaultPaymentPassUniqueIdentifier:(id)a3;
- (id)defaultPaymentPassIdentifier;
- (void)_presentDefaultPaymentPassUpdateNotification:(id)a3;
- (void)clearDefaultPaymentPassIfNeeded;
- (void)setDelegate:(id)a3;
- (void)updateContactlessPassesAvailability;
- (void)updateDefaultPaymentPassIdentifier:(id)a3;
- (void)updateDefaultPaymentPassIfNeeded;
- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4;
@end

@implementation PDDefaultPassManager

- (PDDefaultPassManager)init
{
  return 0LL;
}

- (PDDefaultPassManager)initWithDatabaseManager:(id)a3 fieldDetectorManager:(id)a4 remoteInterfacePresenter:(id)a5 assertionManager:(id)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    v27.receiver = self;
    v27.super_class = (Class)&OBJC_CLASS___PDDefaultPassManager;
    v18 = -[PDDefaultPassManager init](&v27, "init");
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_databaseManager, a3);
      objc_storeStrong((id *)&v19->_fieldDetectorManager, a4);
      objc_storeStrong((id *)&v19->_remoteInterfacePresenter, a5);
      objc_storeStrong((id *)&v19->_assertionManager, a6);
      objc_storeWeak((id *)&v19->_delegate, v17);
      *(_WORD *)&v19->_shouldUpdateContactlessPassesAvailibility = 0;
      v19->_contactlessPassesLock._os_unfair_lock_opaque = 0;
      dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);
      dispatch_queue_t v22 = dispatch_queue_create("com.apple.passd.defaultPass.work", v21);
      workQueue = v19->_workQueue;
      v19->_workQueue = (OS_dispatch_queue *)v22;

      dispatch_queue_t v24 = dispatch_queue_create("com.apple.passd.defaultPass.reply", v21);
      replyQueue = v19->_replyQueue;
      v19->_replyQueue = (OS_dispatch_queue *)v24;
    }
  }

  else
  {

    v19 = 0LL;
  }

  return v19;
}

- (void)updateContactlessPassesAvailability
{
  p_contactlessPassesLock = &self->_contactlessPassesLock;
  os_unfair_lock_lock(&self->_contactlessPassesLock);
  if (self->_isUpdatingContactlessPassesAvailibility)
  {
    self->_shouldUpdateContactlessPassesAvailibility = 1;
    os_unfair_lock_unlock(p_contactlessPassesLock);
  }

  else
  {
    self->_isUpdatingContactlessPassesAvailibility = 1;
    lock = p_contactlessPassesLock;
    os_unfair_lock_unlock(p_contactlessPassesLock);
    while (1)
    {
      v5 = objc_autoreleasePoolPush();
      v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager validNFCBarcodePassUniqueIDs]( self->_databaseManager,  "validNFCBarcodePassUniqueIDs"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager objectSettingsManager](self->_databaseManager, "objectSettingsManager"));
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v8 = v6;
      id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      context = v5;
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v29;
        while (2)
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v29 != v11) {
              objc_enumerationMutation(v8);
            }
            if ((sub_1003AFBF4((uint64_t)v7, *(void **)(*((void *)&v28 + 1) + 8LL * (void)i), 0LL) & 0x10) != 0)
            {
              uint64_t v13 = 1LL;
              goto LABEL_14;
            }
          }

          id v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      uint64_t v13 = 0LL;
LABEL_14:

      BOOL v14 = -[PDDatabaseManager hasActiveSecureElementPasses](self->_databaseManager, "hasActiveSecureElementPasses");
      unsigned int v15 = -[PDDatabaseManager hasActiveContactlessSecureElementPasses]( self->_databaseManager,  "hasActiveContactlessSecureElementPasses");
      PDSetContactlessPaymentPassesAvailable(v14);
      int v16 = PDFieldDetectAvailable();
      int v17 = PDContactlessInterfaceAvailable();
      uint64_t v18 = 0x10000LL;
      if (!(_DWORD)v13) {
        uint64_t v18 = 0LL;
      }
      uint64_t v19 = 256LL;
      if (!v15) {
        uint64_t v19 = 0LL;
      }
      unint64_t v20 = v18 | v2 & 0xFFFFFFFFFF000000LL | v14;
      unint64_t v2 = v20 | v19;
      PDPassStateSet(v20 | v19);
      int v21 = PDFieldDetectAvailable();
      int v23 = PDContactlessInterfaceAvailable();
      if (v16 != v21) {
        sub_10015B884((uint64_t)self->_fieldDetectorManager);
      }
      if (v17 != v23) {
        nullsub_41(self->_remoteInterfacePresenter, v22);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v25 = WeakRetained;
      if (WeakRetained)
      {
        if ((objc_opt_respondsToSelector( WeakRetained,  "defaultPassManager:didUpdateContactlessSecureElementPassesAvailability:barcodePassesAvailable:") & 1) != 0) {
          [v25 defaultPassManager:self didUpdateContactlessSecureElementPassesAvailability:v14 barcodePassesAvailable:v13];
        }
      }

      os_unfair_lock_lock(lock);
      self->_isUpdatingContactlessPassesAvailibility = 0;
      if (!self->_shouldUpdateContactlessPassesAvailibility) {
        break;
      }
      self->_shouldUpdateContactlessPassesAvailibility = 0;
      os_unfair_lock_unlock(lock);

      objc_autoreleasePoolPop(context);
    }

    os_unfair_lock_unlock(lock);

    objc_autoreleasePoolPop(context);
  }

- (void)updateDefaultPaymentPassIfNeeded
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100339AE4;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)clearDefaultPaymentPassIfNeeded
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100339E78;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)updateDefaultPaymentPassIdentifier:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100339FE4;
  v7[3] = &unk_1006392B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (id)defaultPaymentPassIdentifier
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10033A204;
  id v10 = sub_10033A214;
  id v11 = 0LL;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10033A21C;
  block[3] = &unk_100657A80;
  block[4] = &v6;
  dispatch_sync((dispatch_queue_t)workQueue, block);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    if (v6)
    {
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10033A34C;
      block[3] = &unk_100639AF0;
      block[4] = self;
      id v15 = v6;
      id v16 = v8;
      dispatch_async((dispatch_queue_t)workQueue, block);

      id v10 = v15;
    }

    else
    {
      replyQueue = self->_replyQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10033A430;
      v12[3] = &unk_10063A830;
      id v13 = v7;
      dispatch_async((dispatch_queue_t)replyQueue, v12);
      id v10 = v13;
    }
  }
}

- (void)_presentDefaultPaymentPassUpdateNotification:(id)a3
{
  id v4 = a3;
  uint64_t v6 = PKStoreDemoModeEnabled(v4, v5);
  if ((v6 & 1) == 0)
  {
    uint64_t v7 = PKUIOnlyDemoModeEnabled(v6);
    if ((v7 & 1) == 0 && (PKHandsOnDemoModeEnabled(v7) & 1) == 0)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAssertionManager assertionsOfType:](self->_assertionManager, "assertionsOfType:", 4LL));
      id v9 = [v8 count];

      if (v9)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(6LL);
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Supressing default pass change notification for pass: %@",  (uint8_t *)&buf,  0xCu);
        }
      }

      else
      {
        dispatch_time_t v13 = dispatch_time(0LL, 1000000000LL);
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_10033A5F8;
        v17[3] = &unk_100639300;
        uint64_t v18 = (os_log_s *)v4;
        id v16 = v17;
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        unint64_t v20 = sub_10033AE88;
        int v21 = &unk_10063A830;
        id v22 = v16;
        dispatch_after(v13, v15, &buf);

        id v11 = v18;
      }
    }
  }
}

- (id)_queue_identifyDefaultPaymentPassWithCurrentDefaultPaymentPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passWithUniqueIdentifier:](self->_databaseManager, "passWithUniqueIdentifier:", v4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 paymentPass]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager peerPaymentAccount](self->_databaseManager, "peerPaymentAccount"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 associatedPassUniqueID]);

  if (v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager primaryPaymentApplicationForPassUniqueIdentifier:]( self->_databaseManager,  "primaryPaymentApplicationForPassUniqueIdentifier:",  v4));
    id v10 = [v9 state];
    uint64_t v11 = PDUserSpecifiedDefaultPaymentPassUniqueIdentifier();
    id v12 = (id)objc_claimAutoreleasedReturnValue(v11);
    else {
      unsigned int v13 = 0;
    }
    if ([v6 isTransitPass] && objc_msgSend(v9, "paymentNetworkIdentifier") == (id)113)
    {
      unsigned int v15 = [v4 isEqualToString:v12] ^ 1;
      if (!v13) {
        goto LABEL_11;
      }
    }

    else
    {
      unsigned int v15 = 0;
      if (!v13)
      {
LABEL_11:
        if (!v15)
        {
          if ([v6 supportsDefaultCardSelection])
          {
            if (PKPaymentApplicationStateIsPersonalized([v6 effectiveContactlessPaymentApplicationState])
              || PKPaymentApplicationStateIsSuspended(v10)
              || v10 == (id)2)
            {
              uint64_t Object = PKLogFacilityTypeGetObject(6LL);
              v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Default card is valid. No need to update.",  buf,  2u);
              }

              id v25 = v6;
              goto LABEL_42;
            }

            uint64_t v40 = PKLogFacilityTypeGetObject(6LL);
            int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_18;
            }
            *(_WORD *)__int128 buf = 0;
            uint64_t v18 = "Default card payment application is not personalized and it's not suspended or personalizing, attempti"
                  "ng to update with another card if possible";
          }

          else
          {
            uint64_t v39 = PKLogFacilityTypeGetObject(6LL);
            int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_18;
            }
            *(_WORD *)__int128 buf = 0;
            uint64_t v18 = "Default card does not support default card selection, attempting to update with another card if possible";
          }

          goto LABEL_17;
        }

        uint64_t v16 = PKLogFacilityTypeGetObject(6LL);
        int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          uint64_t v18 = "Transit only card found as automatic default card, attempting to update with another card if possible";
LABEL_17:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
          goto LABEL_18;
        }

        goto LABEL_18;
      }
    }

    uint64_t v19 = PKLogFacilityTypeGetObject(6LL);
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      uint64_t v18 = "Apple Cash found as automatic default card, attempting to update with another card if possible";
      goto LABEL_17;
    }

- (PDDefaultPassManagerDelegate)delegate
{
  return (PDDefaultPassManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end