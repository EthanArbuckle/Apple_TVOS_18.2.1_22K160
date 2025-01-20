@interface PDTransactionNotificationController
- (BOOL)_isValidTimeBetweenCreationAndAcceptForPeerPaymentTransaction:(id)a3 config:(id)a4;
- (BOOL)_shouldCreateMerchantTransactionNotificationForTransaction:(id)a3 config:(id)a4;
- (BOOL)_shouldCreateNotificationForTransactionUpdateReasons:(id)a3 notificationTypeDescription:(id)a4;
- (BOOL)_shouldCreatePromotionRewardNotificationForTransaction:(id)a3 config:(id)a4;
- (BOOL)_shouldDeleteNotificationForTransaction:(id)a3;
- (BOOL)_shouldDisplayNotificationForManuallyAcceptedPeerPaymentTransaction:(id)a3 config:(id)a4;
- (BOOL)_shouldDisplayNotificationForReceivedPeerPaymentTransaction:(id)a3 config:(id)a4;
- (BOOL)_transactionHasBeenUpdatedRecentlyEnoughForNotification:(id)a3;
- (PDTransactionNotificationController)initWithUserNotificationManager:(id)a3 databaseManager:(id)a4 accountManager:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 familyCircleManager:(id)a7;
- (void)_fetchFamilyMemberIfNeccessaryForConfiguration:(id)a3 completion:(id)a4;
- (void)_scheduleOrCancelBalanceReminderNotificationIfNecessaryForPassUniqueIdentifier:(id)a3 config:(id)a4 transaction:(id)a5;
- (void)_scheduleOrCancelReminderNotificationsForPendingTransaction:(id)a3 config:(id)a4;
- (void)_updateFraudNotificationIfNecessaryForTransaction:(id)a3 config:(id)a4;
- (void)_updatePeerPaymentNotificationIfNecessaryForTransaction:(id)a3 existingTransaction:(id)a4 config:(id)a5;
- (void)_updatePromotionRewardNotificationIfNecessaryForTransaction:(id)a3 existingTransaction:(id)a4 config:(id)a5;
- (void)_updateTransactionNotificationIfNecessaryForTransaction:(id)a3 existingTransaction:(id)a4 config:(id)a5;
- (void)paymentTransactionRemoved:(id)a3 transactionSourceIdentifier:(id)a4;
- (void)paymentTransactionUpdated:(id)a3 existingPaymentTransaction:(id)a4 transactionSourceIdentifier:(id)a5;
- (void)transitPropertiesUpdated:(id)a3 forPassUniqueIdentifier:(id)a4;
@end

@implementation PDTransactionNotificationController

- (PDTransactionNotificationController)initWithUserNotificationManager:(id)a3 databaseManager:(id)a4 accountManager:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 familyCircleManager:(id)a7
{
  id v24 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PDTransactionNotificationController;
  v17 = -[PDTransactionNotificationController init](&v25, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_userNotificationManager, a3);
    objc_storeStrong((id *)&v18->_databaseManager, a4);
    objc_storeStrong((id *)&v18->_accountManager, a5);
    objc_storeStrong((id *)&v18->_peerPaymentWebServiceCoordinator, a6);
    objc_storeStrong((id *)&v18->_familyCircleManager, a7);
    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.passd.PDTransactionNotificationController", v20);
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v21;
  }

  return v18;
}

- (void)paymentTransactionUpdated:(id)a3 existingPaymentTransaction:(id)a4 transactionSourceIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1002561B0;
  v15[3] = &unk_10063B060;
  id v16 = v8;
  v17 = self;
  id v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)workQueue, v15);
}

- (void)paymentTransactionRemoved:(id)a3 transactionSourceIdentifier:(id)a4
{
  id v5 = a3;
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100256A30;
  v8[3] = &unk_1006392B0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)workQueue, v8);
}

- (void)transitPropertiesUpdated:(id)a3 forPassUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100256B34;
  block[3] = &unk_100639350;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_fetchFamilyMemberIfNeccessaryForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_12;
  }
  id v8 = [v6 transactionSourceType];
  if (v8 == (id)2)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 accountUser]);
  }

  else
  {
    if (v8 != (id)1)
    {
      v11 = 0LL;
      goto LABEL_8;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedPeerPaymentAccount]);
  }

  id v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 altDSID]);

LABEL_8:
  if ([v11 length])
  {
    familyCircleManager = self->_familyCircleManager;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100256E4C;
    v13[3] = &unk_10063F520;
    id v14 = v11;
    id v15 = v7;
    -[PDFamilyCircleManager familyMembersWithCachePolicy:completion:]( familyCircleManager,  "familyMembersWithCachePolicy:completion:",  0LL,  v13);
  }

  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }

LABEL_12:
}

- (void)_updateTransactionNotificationIfNecessaryForTransaction:(id)a3 existingTransaction:(id)a4 config:(id)a5
{
  id v8 = (os_log_s *)a3;
  id v9 = a4;
  id v10 = a5;
  if ((-[os_log_s fullyProcessed](v8, "fullyProcessed") & 1) == 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(23LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v91 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Not creating notification for transaction that is not yet fully processed: %@",  buf,  0xCu);
    }

    goto LABEL_75;
  }

  if (PKPaymentTransactionHasAuthenticationRequest(v8))
  {
    uint64_t v11 = PKLogFacilityTypeGetObject(23LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s identifier](v8, "identifier"));
      *(_DWORD *)buf = 138412290;
      v91 = v13;
      id v14 = "Not creating notification for transaction that has authentication request: %@";
LABEL_38:
      dispatch_queue_t v21 = v12;
      uint32_t v22 = 12;
      goto LABEL_39;
    }

    goto LABEL_75;
  }

  if (-[os_log_s transactionType](v8, "transactionType") != (id)15)
  {
    id v17 = -[os_log_s transactionType](v8, "transactionType");
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 associatedPeerPaymentAccount]);

    if (-[os_log_s isRecurring](v8, "isRecurring") && (v17 != (id)6 || !v18))
    {
      uint64_t v47 = PKLogFacilityTypeGetObject(23LL);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s identifier](v8, "identifier"));
        *(_DWORD *)buf = 138412290;
        v91 = v13;
        id v14 = "Not creating notification for recurring transaction: %@";
        goto LABEL_38;
      }

      goto LABEL_75;
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s transfers](v8, "transfers"));
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 firstObject]);

    if (-[os_log_s featureIdentifier](v8, "featureIdentifier") == (id)1
      && -[os_log_s associatedFeatureIdentifier](v8, "associatedFeatureIdentifier") == (id)5
      && -[os_log_s type](v12, "type") == (id)2)
    {
      uint64_t v20 = PKLogFacilityTypeGetObject(23LL);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_74:

        goto LABEL_75;
      }

      *(_WORD *)buf = 0;
      id v14 = "Not creating notification for transfer from cash to savings";
      dispatch_queue_t v21 = v13;
      uint32_t v22 = 2;
LABEL_39:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v14, buf, v22);
      goto LABEL_74;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue([v10 paymentPass]);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 uniqueID]);

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v10 paymentApplication]);
    v26 = (objc_class *)objc_opt_class(&OBJC_CLASS___PDPassPaymentTransactionUserNotification, v25);
    id v27 = [v10 transactionSourceType];
    id v28 = -[os_log_s transactionType](v8, "transactionType");
    v83 = (void *)objc_claimAutoreleasedReturnValue([v10 familyMember]);
    v84 = v24;
    if (v28 != (id)2)
    {
LABEL_28:
      if (!v27
        && (-[PDDatabaseManager settingEnabled:forPassWithUniqueIdentifier:]( self->_databaseManager,  "settingEnabled:forPassWithUniqueIdentifier:",  128LL,  v13)
         || !-[PDDatabaseManager settingEnabled:forPassWithUniqueIdentifier:]( self->_databaseManager,  "settingEnabled:forPassWithUniqueIdentifier:",  8LL,  v13)))
      {
        uint64_t v48 = PKLogFacilityTypeGetObject(23LL);
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v91 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Not creating notification for transaction since notifications are suppressed for pass: %@",  buf,  0xCu);
        }

        goto LABEL_73;
      }

      if (-[os_log_s featureIdentifier](v8, "featureIdentifier") == (id)5)
      {
        v77 = v13;
        v80 = v26;
        v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s accountIdentifier](v8, "accountIdentifier"));
        id v39 = -[os_log_s transactionType](v8, "transactionType");
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s transfers](v8, "transfers"));
        v41 = (void *)objc_claimAutoreleasedReturnValue([v40 firstObject]);
        v42 = (void *)objc_claimAutoreleasedReturnValue([v41 externalAccount]);
        id v43 = [v42 type];

        if (v39 != (id)11 && v43 != (id)5)
        {
          uint64_t v44 = PKLogFacilityTypeGetObject(23LL);
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Not creating notification for transaction since it is not an interest or RDFI transaction",  buf,  2u);
          }

          v46 = v74;
          id v13 = v77;
          goto LABEL_35;
        }

        v46 = v74;
        if (v39 == (id)11 && PKHasDisabledInterestPaidNotificationsForAccountIdentifier(v74))
        {
          uint64_t v49 = PKLogFacilityTypeGetObject(23LL);
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          id v13 = v77;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v91 = v74;
            v50 = "Not creating notification for transaction since interest notifications are suppressed for account: %@";
LABEL_54:
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, v50, buf, 0xCu);
            goto LABEL_35;
          }

          goto LABEL_35;
        }

        id v13 = v77;
        if (v43 == (id)5 && PKHasDisabledTransactionsNotificationsForAccountIdentifier(v74))
        {
          uint64_t v51 = PKLogFacilityTypeGetObject(23LL);
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v91 = v74;
            v50 = "Not creating notification for transaction since transaction notifications are suppressed for account: %@";
            goto LABEL_54;
          }

- (void)_updateFraudNotificationIfNecessaryForTransaction:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 transactionSourceIdentifier]);
  id v9 = (void *)v8;
  if (v6 && v8)
  {
    id v10 = objc_alloc(&OBJC_CLASS___PDPassPaymentFraudTransactionUserNotification);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 passUniqueIdentifier]);
    id v12 = -[PDPassPaymentFraudTransactionUserNotification initWithPaymentTransaction:forPassUniqueIdentifier:]( v10,  "initWithPaymentTransaction:forPassUniqueIdentifier:",  v6,  v11);

    userNotificationManager = self->_userNotificationManager;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification notificationIdentifier](v12, "notificationIdentifier"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100257D54;
    v16[3] = &unk_10064FE80;
    id v17 = v6;
    id v18 = self;
    id v19 = v12;
    id v15 = v12;
    -[PDUserNotificationManager userNotificationWithIdentifier:completion:]( userNotificationManager,  "userNotificationWithIdentifier:completion:",  v14,  v16);
  }
}

- (void)_updatePromotionRewardNotificationIfNecessaryForTransaction:(id)a3 existingTransaction:(id)a4 config:(id)a5
{
  uint64_t v8 = (os_log_s *)a3;
  id v9 = a4;
  id v10 = a5;
  if (PKRewardsCenterEnabled(v10))
  {
    if ((-[os_log_s fullyProcessed](v8, "fullyProcessed") & 1) == 0)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(23LL);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v59 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Not creating notification for transaction that is not yet fully processed: %@",  buf,  0xCu);
      }

      goto LABEL_41;
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 paymentPass]);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 paymentApplication]);
    id v14 = [v10 transactionSourceType];
    if (-[os_log_s transactionType](v8, "transactionType")
      || -[os_log_s transactionStatus](v8, "transactionStatus") != (id)1
      || -[os_log_s accountType](v8, "accountType") != (id)2)
    {
LABEL_40:

LABEL_41:
      goto LABEL_42;
    }

    if (!v14
      && (-[PDDatabaseManager settingEnabled:forPassWithUniqueIdentifier:]( self->_databaseManager,  "settingEnabled:forPassWithUniqueIdentifier:",  128LL,  v12)
       || !-[PDDatabaseManager settingEnabled:forPassWithUniqueIdentifier:]( self->_databaseManager,  "settingEnabled:forPassWithUniqueIdentifier:",  8LL,  v12)))
    {
      uint64_t v23 = PKLogFacilityTypeGetObject(23LL);
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v59 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Not creating notification for transaction since notifications are suppressed for pass: %@",  buf,  0xCu);
      }

      goto LABEL_39;
    }

    v41 = v13;
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[os_log_s altDSID](v8, "altDSID"));
    v42 = (void *)v15;
    if (v15)
    {
      uint64_t v16 = PKCurrentUserAltDSID(v15);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      id v18 = v42;
      id v19 = v17;
      if (v18 == v19)
      {
      }

      else
      {
        uint64_t v20 = v19;
        if (!v19)
        {

LABEL_35:
          uint64_t v39 = PKLogFacilityTypeGetObject(23LL);
          char v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v59 = (os_log_s *)v18;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Not creating promotion reward notification for other account user: %@",  buf,  0xCu);
          }

          id v24 = (os_log_s *)v42;
          goto LABEL_38;
        }

        unsigned __int8 v21 = [v18 isEqualToString:v19];

        if ((v21 & 1) == 0) {
          goto LABEL_35;
        }
      }
    }

    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s rewards](v8, "rewards"));
    id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    v40 = v25;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[os_log_s rewardsItems](v25, "rewardsItems"));
    id v46 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v46)
    {
      uint64_t v45 = *(void *)v54;
LABEL_21:
      uint64_t v26 = 0LL;
      while (1)
      {
        if (*(void *)v54 != v45) {
          objc_enumerationMutation(obj);
        }
        id v27 = *(void **)(*((void *)&v53 + 1) + 8 * v26);
        if ([v27 state] != (id)2) {
          break;
        }
        [v27 type];
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 currencyAmount]);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 amount]);

        if ([v27 eligibleValueUnit] == (id)2)
        {
          unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
          unsigned __int8 v31 = [v29 isEqualToNumber:v30];

          if ((v31 & 1) == 0) {
            [v43 addObject:v27];
          }
        }

        if (v46 == (id)++v26)
        {
          id v46 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
          if (v46) {
            goto LABEL_21;
          }
          goto LABEL_30;
        }
      }
    }

    else
    {
LABEL_30:

      id v13 = v41;
      if (![v43 count])
      {
LABEL_33:

        id v24 = (os_log_s *)v42;
        char v38 = v40;
LABEL_38:

LABEL_39:
        goto LABEL_40;
      }

      BOOL v32 = [v9 transactionStatus] != (id)1;
      char v33 = [v9 fullyProcessed] ^ 1;
      v34 = -[PDPassPaymentPromotionRewardEarnedUserNotification initWithPaymentTransaction:forPassUniqueIdentifier:paymentApplication:promotionalRewardItems:]( objc_alloc(&OBJC_CLASS___PDPassPaymentPromotionRewardEarnedUserNotification),  "initWithPaymentTransaction:forPassUniqueIdentifier:paymentApplication:promotionalRewardItems:",  v8,  v12,  v41,  v43);
      uint64_t v35 = objc_claimAutoreleasedReturnValue(-[PDUserNotification notificationIdentifier](v34, "notificationIdentifier"));
      userNotificationManager = self->_userNotificationManager;
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_100258450;
      v47[3] = &unk_10064FED0;
      v47[4] = self;
      uint64_t v48 = v8;
      id v49 = v10;
      v50 = v34;
      BOOL v51 = v32;
      char v52 = v33;
      BOOL v37 = v34;
      id obj = (id)v35;
      -[PDUserNotificationManager userNotificationWithIdentifier:completion:]( userNotificationManager,  "userNotificationWithIdentifier:completion:",  v35,  v47);
    }

    id v13 = v41;
    goto LABEL_33;
  }

- (void)_updatePeerPaymentNotificationIfNecessaryForTransaction:(id)a3 existingTransaction:(id)a4 config:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 transactionSourceIdentifier]);
  id v12 = (void *)v11;
  if (v8 && v11)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue([v10 passUniqueIdentifier]);
    id v49 = (void *)objc_claimAutoreleasedReturnValue([v10 familyMember]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 associatedPeerPaymentAccount]);
    BOOL v47 = v13 != 0LL;

    id v46 = self;
    if (v13)
    {
      unsigned int v14 = 0;
    }

    else
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 peerPaymentAccount]);
      if (v15)
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 peerPaymentAccount]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 associatedPassUniqueID]);
        unsigned int v14 = [v17 isEqualToString:v50];
      }

      else
      {
        unsigned int v14 = 0;
      }
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 peerPaymentCounterpartHandle]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 currentUser]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 appleID]);
    id v21 = v18;
    id v22 = v20;
    uint64_t v23 = v22;
    if (v21 == v22)
    {
      unsigned int v24 = 0;
    }

    else
    {
      unsigned int v24 = 1;
      if (v21 && v22) {
        unsigned int v24 = [v21 isEqualToString:v22] ^ 1;
      }
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v8 recurringPeerPayment]);
    id v26 = [v25 type];

    int v27 = v47;
    if (v14)
    {
      if (![v10 transactionSourceType])
      {
        -[PDTransactionNotificationController _scheduleOrCancelBalanceReminderNotificationIfNecessaryForPassUniqueIdentifier:config:transaction:]( v46,  "_scheduleOrCancelBalanceReminderNotificationIfNecessaryForPassUniqueIdentifier:config:transaction:",  v50,  v10,  v8);
        if ([v8 transactionType] == (id)3 && objc_msgSend(v8, "peerPaymentType") == (id)2) {
          -[PDTransactionNotificationController _scheduleOrCancelReminderNotificationsForPendingTransaction:config:]( v46,  "_scheduleOrCancelReminderNotificationsForPendingTransaction:config:",  v8,  v10);
        }
      }

      int v27 = 1;
    }

    if (v26 == (id)3) {
      int v28 = 1;
    }
    else {
      int v28 = v24;
    }
    if (v28 == 1 && v27)
    {
      unsigned __int8 v29 = [v10 shouldReceiveNotificationsForPeerPaymentNotificationType:1];
      unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v8 transactionStatusChangedDate]);
      unsigned __int8 v31 = v30;
      if (v30 && ([v30 timeIntervalSinceNow], fabs(v32) < 86400.0))
      {
        id v45 = [v8 transactionStatus];
        id v33 = [v9 transactionStatus];
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472LL;
        v53[2] = sub_100258C18;
        v53[3] = &unk_10064FF20;
        v53[4] = v46;
        id v54 = v8;
        id v34 = v10;
        id v55 = v34;
        BOOL v58 = v47;
        id v48 = v50;
        id v56 = v48;
        id v57 = v49;
        BOOL v59 = v45 != v33;
        unsigned __int8 v60 = v29;
        char v61 = v14;
        uint64_t v35 = objc_retainBlock(v53);
        id v36 = v35;
        if (v45 == v33)
        {
          ((void (*)(void *))v35[2])(v35);
        }

        else
        {
          BOOL v37 = objc_alloc(&OBJC_CLASS___PDPeerPaymentTransactionReceivedUserNotification);
          char v38 = (void *)objc_claimAutoreleasedReturnValue([v34 peerPaymentAccount]);
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 currentBalance]);
          v40 = -[PDPeerPaymentTransactionReceivedUserNotification initWithPassUniqueIdentifier:accountBalance:]( v37,  "initWithPassUniqueIdentifier:accountBalance:",  v48,  v39);

          v41 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification notificationIdentifier](v40, "notificationIdentifier"));
          userNotificationManager = v46->_userNotificationManager;
          v51[0] = _NSConcreteStackBlock;
          v51[1] = 3221225472LL;
          v51[2] = sub_1002598D4;
          v51[3] = &unk_10064F020;
          v51[4] = v46;
          id v52 = v36;
          -[PDUserNotificationManager userNotificationWithIdentifier:completion:]( userNotificationManager,  "userNotificationWithIdentifier:completion:",  v41,  v51);
        }
      }

      else
      {
        uint64_t Object = PKLogFacilityTypeGetObject(23LL);
        uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v63 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Not creating notification for transaction %@ because transaction status changed more than 1 day ago.",  buf,  0xCu);
        }
      }
    }
  }
}

- (BOOL)_shouldDisplayNotificationForManuallyAcceptedPeerPaymentTransaction:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 transactionType] == (id)3
    && [v6 transactionStatus] == (id)1
    && [v6 peerPaymentType] == (id)1
    && -[PDTransactionNotificationController _shouldCreateNotificationForTransactionUpdateReasons:notificationTypeDescription:]( self,  "_shouldCreateNotificationForTransactionUpdateReasons:notificationTypeDescription:",  v6,  @"manually accepted peer payment notification"))
  {
    if (([v7 shouldReceiveNotificationsForPeerPaymentNotificationType:1] & 1) == 0)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(11LL);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 associatedPeerPaymentAccount]);
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 altDSID]);
        int v22 = 138412290;
        uint64_t v23 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Not displaying notification for approved peer payment transaction since the preference for this associated acc ount altDSID %@ is turned off",  (uint8_t *)&v22,  0xCu);
      }

      BOOL v10 = 0;
      goto LABEL_22;
    }

    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 transactionDate]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionStatusChangedDate]);
    if (v9 && v8)
    {
      if (-[PDTransactionNotificationController _isValidTimeBetweenCreationAndAcceptForPeerPaymentTransaction:config:]( self,  "_isValidTimeBetweenCreationAndAcceptForPeerPaymentTransaction:config:",  v6,  v7))
      {
        BOOL v10 = 1;
LABEL_21:

LABEL_22:
        goto LABEL_11;
      }

      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 transactionDate]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionStatusChangedDate]);
      [v17 timeIntervalSinceDate:v16];
      id v19 = v18;
      uint64_t v20 = PKLogFacilityTypeGetObject(11LL);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 134218498;
        uint64_t v23 = v19;
        __int16 v24 = 2112;
        uint64_t v25 = (os_log_s *)v17;
        __int16 v26 = 2112;
        int v27 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Not displaying notification for approved peer payment transaction with a status changed date %.1f seconds afte r creation date. StatusChangedDate: %@ CreationDate: %@",  (uint8_t *)&v22,  0x20u);
      }
    }

    else
    {
      uint64_t v15 = PKLogFacilityTypeGetObject(11LL);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412546;
        uint64_t v23 = v9;
        __int16 v24 = 2112;
        uint64_t v25 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Not displaying notification for approved peer payment transaction without a status changed and creation date. StatusChangedDate: %@ CreationDate: %@",  (uint8_t *)&v22,  0x16u);
      }
    }

    BOOL v10 = 0;
    goto LABEL_21;
  }

  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_shouldDisplayNotificationForReceivedPeerPaymentTransaction:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 transactionSourceType] <= 1
    && [v6 transactionType] == (id)3
    && [v6 transactionStatus] == (id)1
    && [v6 peerPaymentType] == (id)2)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 recurringPeerPayment]);
    if (!v8
      || (id v9 = (void *)v8,
          BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v7 associatedPeerPaymentAccount]),
          v10,
          v9,
          v10))
    {
      if (-[PDTransactionNotificationController _shouldCreateNotificationForTransactionUpdateReasons:notificationTypeDescription:]( self,  "_shouldCreateNotificationForTransactionUpdateReasons:notificationTypeDescription:",  v6,  @"manually accepted peer payment notification"))
      {
        if (([v7 shouldReceiveNotificationsForPeerPaymentNotificationType:1] & 1) == 0)
        {
          uint64_t Object = PKLogFacilityTypeGetObject(11LL);
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 associatedPeerPaymentAccount]);
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 altDSID]);
            int v25 = 138412290;
            __int16 v26 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Not displaying notification for approved peer payment transaction since the preference for this associated account altDSID %@ is turned off",  (uint8_t *)&v25,  0xCu);
          }

          BOOL v13 = 0;
          goto LABEL_25;
        }

        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 transactionDate]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionStatusChangedDate]);
        if (v12 && v11)
        {
          if (-[PDTransactionNotificationController _isValidTimeBetweenCreationAndAcceptForPeerPaymentTransaction:config:]( self,  "_isValidTimeBetweenCreationAndAcceptForPeerPaymentTransaction:config:",  v6,  v7))
          {
            BOOL v13 = 1;
LABEL_24:

LABEL_25:
            goto LABEL_14;
          }

          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 transactionDate]);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionStatusChangedDate]);
          [v20 timeIntervalSinceDate:v19];
          int v22 = v21;
          uint64_t v23 = PKLogFacilityTypeGetObject(11LL);
          __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = 134218498;
            __int16 v26 = v22;
            __int16 v27 = 2112;
            int v28 = (os_log_s *)v20;
            __int16 v29 = 2112;
            unsigned int v30 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Not displaying notification for a received peer payment transaction on an associated account with a status changed date %.1f seconds after creation date. StatusChangedDate: %@ CreationDate: %@",  (uint8_t *)&v25,  0x20u);
          }
        }

        else
        {
          uint64_t v18 = PKLogFacilityTypeGetObject(11LL);
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = 138412546;
            __int16 v26 = v12;
            __int16 v27 = 2112;
            int v28 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Not displaying notification for a received peer payment transaction on an associated account without a sta tus changed and creation date. StatusChangedDate: %@ CreationDate: %@",  (uint8_t *)&v25,  0x16u);
          }
        }

        BOOL v13 = 0;
        goto LABEL_24;
      }
    }
  }

  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)_isValidTimeBetweenCreationAndAcceptForPeerPaymentTransaction:(id)a3 config:(id)a4
{
  id v5 = a3;
  id v6 = [a4 transactionSourceType];
  double v7 = 0.0;
  if ((unint64_t)v6 <= 3 && v6 != (id)1)
  {
    if ([v5 peerPaymentType] == (id)2) {
      double v7 = 0.0;
    }
    else {
      double v7 = 10.0;
    }
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 transactionDate]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 transactionStatusChangedDate]);
  [v9 timeIntervalSinceDate:v8];
  BOOL v11 = v10 >= v7;

  return v11;
}

- (void)_scheduleOrCancelBalanceReminderNotificationIfNecessaryForPassUniqueIdentifier:(id)a3 config:(id)a4 transaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 transactionType];
  id v12 = v11;
  BOOL v13 = 1;
  if (v11 && v11 != (id)5) {
    BOOL v13 = v11 == (id)3 && [v10 peerPaymentType] == (id)1;
  }
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v9 peerPaymentAccount]);
  if ([v14 isAccountStateDirty])
  {
    BOOL v15 = 0;
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 peerPaymentAccount]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 lastUpdated]);
    [v17 timeIntervalSinceNow];
    BOOL v15 = v18 > -60.0;
  }

  char v19 = PKShouldSuppressPeerPaymentBalanceReminder();
  if (v12 != (id)3 || (v19 & 1) != 0)
  {
    if (!v13) {
      goto LABEL_23;
    }
  }

  else
  {
    id v20 = [v10 peerPaymentType];
    if (!v13)
    {
      if (v20 == (id)2 && v15)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(11LL);
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Scheduling/updating peer payment balance reminder",  buf,  2u);
        }

        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v9 peerPaymentAccount]);
        int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 currentBalance]);

        userNotificationManager = self->_userNotificationManager;
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_10025A244;
        v30[3] = &unk_10063E250;
        id v31 = v25;
        double v32 = self;
        id v33 = v8;
        id v27 = v25;
        -[PDUserNotificationManager userNotificationsForPassUniqueIdentifier:ofType:completion:]( userNotificationManager,  "userNotificationsForPassUniqueIdentifier:ofType:completion:",  v33,  14LL,  v30);
      }

      goto LABEL_23;
    }
  }

  uint64_t v28 = PKLogFacilityTypeGetObject(11LL);
  __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Removing and suppressing future peer payment balance reminders",  buf,  2u);
  }

  PKSetShouldSuppressPeerPaymentBalanceReminder(1LL);
  -[PDUserNotificationManager removeUserNotificationsForPassUniqueIdentifier:ofType:]( self->_userNotificationManager,  "removeUserNotificationsForPassUniqueIdentifier:ofType:",  v8,  14LL);
LABEL_23:
}

- (void)_scheduleOrCancelReminderNotificationsForPendingTransaction:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 passUniqueIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 familyMember]);

  id v10 = -[PDPeerPaymentTransactionReminderUserNotification initWithPaymentTransaction:forPassUniqueIdentifier:familyMember:reminderPeriod:]( objc_alloc(&OBJC_CLASS___PDPeerPaymentTransactionReminderUserNotification),  "initWithPaymentTransaction:forPassUniqueIdentifier:familyMember:reminderPeriod:",  v6,  v8,  v9,  0LL);
  id v11 = -[PDPeerPaymentTransactionReminderUserNotification initWithPaymentTransaction:forPassUniqueIdentifier:familyMember:reminderPeriod:]( objc_alloc(&OBJC_CLASS___PDPeerPaymentTransactionReminderUserNotification),  "initWithPaymentTransaction:forPassUniqueIdentifier:familyMember:reminderPeriod:",  v6,  v8,  v9,  1LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification date](v10, "date"));
  [v12 timeIntervalSinceNow];
  double v14 = v13;

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification date](v11, "date"));
  [v15 timeIntervalSinceNow];
  double v17 = v16;

  if ([v6 peerPaymentStatus])
  {
    -[PDUserNotificationManager removeUserNotification:](self->_userNotificationManager, "removeUserNotification:", v10);
    -[PDUserNotificationManager removeUserNotification:](self->_userNotificationManager, "removeUserNotification:", v11);
  }

  else
  {
    if (v14 >= 0.0 || [v6 isRecurring] && v17 >= 0.0)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(11LL);
      char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        id v23 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Adding user notification reminder for pending transaction %@",  (uint8_t *)&v22,  0xCu);
      }

      -[PDUserNotification setReissueBannerOnUpdate:](v10, "setReissueBannerOnUpdate:", 0LL);
      -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v10);
    }

    if (v17 >= 0.0)
    {
      uint64_t v20 = PKLogFacilityTypeGetObject(11LL);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        id v23 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Adding user notification reminder for pending transaction %@",  (uint8_t *)&v22,  0xCu);
      }

      -[PDUserNotification setReissueBannerOnUpdate:](v11, "setReissueBannerOnUpdate:", 0LL);
      -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v11);
    }
  }
}

- (BOOL)_transactionHasBeenUpdatedRecentlyEnoughForNotification:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 transactionStatusChangedDate]);
  if (!v4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 transactionDate]);
    if (!v4)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(23LL);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Not creating merchant transaction notification for transaction %@ because it does not have a transactionDate.",  (uint8_t *)&v11,  0xCu);
      }

      v4 = 0LL;
      goto LABEL_10;
    }
  }

  [v4 timeIntervalSinceNow];
  if (fabs(v5) > 86400.0)
  {
    uint64_t v6 = PKLogFacilityTypeGetObject(23LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Not creating merchant transaction notification for transaction %@ because it has been more than 1 day since the transaction changed.",  (uint8_t *)&v11,  0xCu);
    }

- (BOOL)_shouldCreateMerchantTransactionNotificationForTransaction:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 paymentPass]);
  if ([v6 suppressNotifications])
  {
    uint64_t Object = PKLogFacilityTypeGetObject(23LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      int v11 = "Not creating merchant transaction notification for transaction that requested suppress notifications";
      id v12 = v10;
      uint32_t v13 = 2;
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v28, v13);
    }

- (BOOL)_shouldDeleteNotificationForTransaction:(id)a3
{
  id v3 = a3;
  if ([v3 transactionType] == (id)8)
  {
    if ([v3 suppressBehavior] == (id)1) {
      goto LABEL_6;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 redemptionEvent]);

    if (v4) {
      goto LABEL_6;
    }
  }

  uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 accountIdentifier]);
  if (v5
    && (id v6 = (void *)v5,
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 unansweredQuestions]),
        id v8 = [v7 count],
        v7,
        v6,
        v8))
  {
LABEL_6:
    unsigned __int8 v9 = 1;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 accountIdentifier]);
    if (v10)
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue([v3 amount]);
      if (v11)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 amount]);
        uint32_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
        unsigned __int8 v9 = [v12 isEqualToNumber:v13];
      }

      else
      {
        unsigned __int8 v9 = 1;
      }
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_shouldCreateNotificationForTransactionUpdateReasons:(id)a3 notificationTypeDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int16 v7 = (unsigned __int16)[v5 updateReasons];
  if ((v7 & 0xCD8) == 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(23LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue([v5 updateReasonsDescription]);
      int v18 = 138543874;
      id v19 = v6;
      __int16 v20 = 2114;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v5;
      id v12 = "Not creating %{public}@ for transaction that did not have a relevant update reason set. Update Reasons: %{pu"
            "blic}@. Transaction: %@";
      goto LABEL_14;
    }

- (BOOL)_shouldCreatePromotionRewardNotificationForTransaction:(id)a3 config:(id)a4
{
  id v5 = a3;
  if ([v5 suppressNotifications])
  {
    uint64_t Object = PKLogFacilityTypeGetObject(23LL);
    unsigned __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      unsigned __int16 v8 = "Not creating merchant transaction notification for transaction that requested suppress notifications";
      uint64_t v9 = v7;
      uint32_t v10 = 2;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  if ([v5 transactionType])
  {
    uint64_t v11 = PKLogFacilityTypeGetObject(23LL);
    unsigned __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v5;
      unsigned __int16 v8 = "Not creating promotion notification for non-purchase transaction %@.";
      uint64_t v9 = v7;
      uint32_t v10 = 12;
      goto LABEL_7;
    }

- (void).cxx_destruct
{
}

@end