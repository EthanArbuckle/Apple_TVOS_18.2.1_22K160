@interface PDAccountNotificationController
- (BOOL)_canShowPayLaterNotificationsForAccount:(id)a3 financingPlan:(id)a4;
- (BOOL)_canShowPayLaterNotificationsForAccount:(id)a3 overrideBlockNotifications:(BOOL)a4;
- (BOOL)_didPayOffFinancingPlan:(id)a3 oldFinancingPlan:(id)a4;
- (OS_dispatch_queue)workQueue;
- (PDAccountManager)accountManager;
- (PDAccountNotificationController)initWithAccountManager:(id)a3 userNotificationManager:(id)a4 databaseManager:(id)a5 paymentWebServiceCoordinator:(id)a6 peerPaymentWebServiceCoordinator:(id)a7 familyMemberManager:(id)a8;
- (PDDatabaseManager)databaseManager;
- (PDUserNotificationManager)userNotificationManager;
- (id)_latestNewFinancingPlanPaymentOfType:(unint64_t)a3 financingPlan:(id)a4 oldFinancingPlan:(id)a5;
- (id)_notificationForAccountEvent:(id)a3 account:(id)a4;
- (id)_paymentDueNotificationsForAccount:(id)a3 estimatedRemainingMinimumPayment:(id)a4;
- (id)_upcomingScheduledPaymentNotificationsForPayment:(id)a3 account:(id)a4;
- (void)_accountWithIdentifier:(id)a3 completion:(id)a4;
- (void)_notificationForAccountEvent:(id)a3 withManager:(id)a4 completion:(id)a5;
- (void)_queue_addOrUpdateNotification:(id)a3 updateLogLine:(id)a4 addLogLine:(id)a5;
- (void)_queue_addOrUpdateNotification:(id)a3 updateLogLine:(id)a4 addLogLine:(id)a5 newNotificationSuppressionBehavior:(unint64_t)a6;
- (void)_queue_computeAccountStateChangeNotification:(id)a3 oldAccount:(id)a4;
- (void)_queue_computeAdjustmentPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeCanceledFinancingPlanNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeDeclinedPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeFinancingPlanDisputeNotifications:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeFinancingPlanPastDueNotifications:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeFinancingPlanPaymentReminderNotifications:(id)a3 account:(id)a4;
- (void)_queue_computeFinancingPlanScheduleSummaryReasonNotifications:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeNewFinancingPlanNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeNewPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_computeRefundPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5;
- (void)_queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:(id)a3;
- (void)_queue_removeSummaryTimesForAccountChangedIfNecessary:(id)a3 oldAccount:(id)a4;
- (void)_recomputePaymentNotificationsForScheduledPayments:(id)a3 account:(id)a4;
- (void)_recomputeSummaryNotificationsForAccountIdentifier:(id)a3 paymentPass:(id)a4 dateForSummary:(id)a5 summaryTypes:(id)a6 fireImmediately:(BOOL)a7;
- (void)_recomputeSummaryNotificationsForTransactionSourceIdentifier:(id)a3 withTransaction:(id)a4;
- (void)_removePayLaterNotificationsForAccount:(id)a3 removeAccountStateChangeNotification:(BOOL)a4;
- (void)_resurfaceRecentNotificationsAndPromote:(BOOL)a3;
- (void)_resurfaceRecentNotificationsForAccount:(id)a3 andPromote:(BOOL)a4;
- (void)_scheduledAndDeliveredUserNotificationWithIdentifier:(id)a3 completion:(id)a4;
- (void)_scheduledAndDeliveredUserNotificationsOfType:(unint64_t)a3 completion:(id)a4;
- (void)_updateAccountAPYMessageForNewAccount:(id)a3 oldAccount:(id)a4 blockNotifications:(BOOL)a5;
- (void)_updateAccountBalanceNotificationForNewAccount:(id)a3 oldAccount:(id)a4;
- (void)_updateAccountStateNotificationForNewAccount:(id)a3 oldAccount:(id)a4;
- (void)_updateAccountUserIdentityStatusNotificationsWithAccount:(id)a3 accountUserCollection:(id)a4 oldAccountUserCollection:(id)a5;
- (void)_updateAccountUserMonthlySpendLimitNotificationsForOldAccount:(id)a3 newAccount:(id)a4 accountUserCollection:(id)a5;
- (void)_updateBankVerificationExpirationDismissalsForFundingSources:(id)a3;
- (void)_updateCanShowFixRewardsMessageForNewAccount:(id)a3 oldAccount:(id)a4;
- (void)_updateFCCStepUpMessageForNewAccount:(id)a3 oldAccount:(id)a4;
- (void)_updateInstallmentNotificationsForOldAccount:(id)a3 newAccount:(id)a4 passUniqueIdentifier:(id)a5;
- (void)_updatePastDueNotificationsForOldAccount:(id)a3 newAccount:(id)a4 passUniqueIdentifier:(id)a5 enrolledInRecoveryPaymentPlan:(BOOL)a6;
- (void)accountManager:(id)a3 accountUsersChanged:(id)a4 oldUsers:(id)a5 accountIdentifier:(id)a6;
- (void)accountManager:(id)a3 creditRecoveryPaymentPlansChangedForAccountIdentifier:(id)a4;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didAddAccountEvent:(id)a4;
- (void)accountManager:(id)a3 didAddFinancingPlan:(id)a4 accountIdentifier:(id)a5;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccountEvent:(id)a4;
- (void)accountManager:(id)a3 didRemoveFinancingPlan:(id)a4 accountIdentifier:(id)a5;
- (void)accountManager:(id)a3 didSetScheduledPayments:(id)a4 forAccountIdentifier:(id)a5;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)accountManager:(id)a3 didUpdateAccountEvent:(id)a4;
- (void)accountManager:(id)a3 didUpdateFinancingPlan:(id)a4 oldFinancingPlan:(id)a5 accountIdentifier:(id)a6;
- (void)accountManager:(id)a3 didUpdatePaymentFundingSources:(id)a4 accountIdentifier:(id)a5;
- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3;
- (void)insertSummaryNotificationForAccountIdentifier:(id)a3 summaryType:(unint64_t)a4;
- (void)paymentTransactionUpdated:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)removePayLaterNotificationsForAccount:(id)a3;
- (void)removeSavingsNotificationsForAccount:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setUserNotificationManager:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)updateDailyCashNotificationsForAccountIdentifier:(id)a3 date:(id)a4 completion:(id)a5;
- (void)updateDailyCashNotificationsWithAccount:(id)a3;
- (void)updatedFundingSources:(id)a3 forSavingsAccount:(id)a4;
- (void)updatedPayLaterAccount:(id)a3 oldAccount:(id)a4;
- (void)updatedSavingsAccount:(id)a3 oldAccount:(id)a4;
@end

@implementation PDAccountNotificationController

- (void)removePayLaterNotificationsForAccount:(id)a3
{
}

- (void)_removePayLaterNotificationsForAccount:(id)a3 removeAccountStateChangeNotification:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = (id)objc_claimAutoreleasedReturnValue([a3 associatedPassUniqueID]);
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
    [v6 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:20];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
  [v7 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:44];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
  [v8 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:51];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
  [v9 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:52];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
  [v10 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:53];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
  [v11 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:54];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
  [v12 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:55];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
  [v13 removeUserNotificationsForPassUniqueIdentifier:v14 ofType:56];
}

- (void)accountManager:(id)a3 didUpdateFinancingPlan:(id)a4 oldFinancingPlan:(id)a5 accountIdentifier:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000E324;
  v10[3] = &unk_100639840;
  v11 = self;
  id v12 = a4;
  id v13 = a5;
  id v8 = v13;
  id v9 = v12;
  -[PDAccountNotificationController _accountWithIdentifier:completion:]( v11,  "_accountWithIdentifier:completion:",  a6,  v10);
}

- (void)accountManager:(id)a3 didAddFinancingPlan:(id)a4 accountIdentifier:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000E4A0;
  v7[3] = &unk_100639868;
  id v8 = self;
  id v9 = a4;
  id v6 = v9;
  -[PDAccountNotificationController _accountWithIdentifier:completion:]( v8,  "_accountWithIdentifier:completion:",  a5,  v7);
}

- (void)accountManager:(id)a3 didRemoveFinancingPlan:(id)a4 accountIdentifier:(id)a5
{
  id v6 = a4;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController workQueue](self, "workQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000E5BC;
  v9[3] = &unk_1006392B0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (void)updatedPayLaterAccount:(id)a3 oldAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000EABC;
  v11[3] = &unk_100639840;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[PDAccountNotificationController _accountWithIdentifier:completion:]( self,  "_accountWithIdentifier:completion:",  v8,  v11);
}

- (void)_queue_computeNewFinancingPlanNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 planSummary]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 transactionDate]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 planIdentifier]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 associatedPassUniqueID]);

  if (!v11)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v12;
      v17 = "New Financing Plan doesnt have a transactionDate %@, skip notification.";
      v18 = v16;
      uint32_t v19 = 12;
      goto LABEL_7;
    }

- (void)_queue_computeCanceledFinancingPlanNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v16 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v16 planIdentifier]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 associatedPassUniqueID]);

  id v12 = [v9 state];
  if ([v16 state] != (id)5)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[PDAccountFinancingPlanUserNotification notificationIdentifierForFinancingPlan:updateType:]( &OBJC_CLASS___PDAccountFinancingPlanUserNotification,  "notificationIdentifierForFinancingPlan:updateType:",  v16,  2LL));
    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
    [v14 removeNotificationApplicationMessageWithIdentifier:v13];
    goto LABEL_5;
  }

  if (v12 != (id)5)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Found an existing active user notification for a canceled financing plan %@. Updating contents but not re-rolling banner.",  v10));
    double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Creating new notification for a canceled financing plan %@",  v10));
    uint64_t v15 = -[PDAccountFinancingPlanUserNotification initWithFinancingPlan:updateType:passUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDAccountFinancingPlanUserNotification),  "initWithFinancingPlan:updateType:passUniqueIdentifier:",  v16,  2LL,  v11);
    -[PDAccountNotificationController _queue_addOrUpdateNotification:updateLogLine:addLogLine:]( self,  "_queue_addOrUpdateNotification:updateLogLine:addLogLine:",  v15,  v13,  v14);

LABEL_5:
  }
}

- (void)_queue_computeNewPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 planIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 associatedPassUniqueID]);
  if (-[PDAccountNotificationController _didPayOffFinancingPlan:oldFinancingPlan:]( self,  "_didPayOffFinancingPlan:oldFinancingPlan:",  v8,  v9))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Found an existing active user notification for a paid off financing plan %@. Updating contents but not re-rolling banner.",  v11));
    double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Creating new notification for a paid off financing plan %@",  v11));
    uint64_t v15 = -[PDAccountFinancingPlanPaidOffNotification initWithFinancingPlan:passUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDAccountFinancingPlanPaidOffNotification),  "initWithFinancingPlan:passUniqueIdentifier:",  v8,  v12);
    -[PDAccountNotificationController _queue_addOrUpdateNotification:updateLogLine:addLogLine:]( self,  "_queue_addOrUpdateNotification:updateLogLine:addLogLine:",  v15,  v13,  v14);

LABEL_8:
    goto LABEL_9;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountNotificationController _latestNewFinancingPlanPaymentOfType:financingPlan:oldFinancingPlan:]( self,  "_latestNewFinancingPlanPaymentOfType:financingPlan:oldFinancingPlan:",  1LL,  v8,  v9));
  id v13 = v16;
  if (v16)
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v16 paymentIdentifier]);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Found an existing active user notification for a new payment %@ on financing plan %@. Updating contents but not re-rolling banner.",  v14,  v11));
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Creating new notification for a new payment %@ on financing plan %@",  v14,  v11));
    if (v8)
    {
      id v24 = v8;
      v22 = v14;
      v18 = v17;
      uint32_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
      id v20 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:financingPlans:]( &OBJC_CLASS___PKPayLaterFinancingPlan,  "requiresGenericMessagingForAccount:financingPlans:",  v10,  v19);

      v17 = v18;
      double v14 = v22;
    }

    else
    {
      id v20 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:financingPlans:]( &OBJC_CLASS___PKPayLaterFinancingPlan,  "requiresGenericMessagingForAccount:financingPlans:",  v10,  0LL);
    }

    v21 = -[PDAccountFinancingPlanPaymentNotification initWithFinancingPlan:payment:requiresGenericMessaging:passUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDAccountFinancingPlanPaymentNotification),  "initWithFinancingPlan:payment:requiresGenericMessaging:passUniqueIdentifier:",  v8,  v13,  v20,  v12);
    -[PDAccountNotificationController _queue_addOrUpdateNotification:updateLogLine:addLogLine:newNotificationSuppressionBehavior:]( self,  "_queue_addOrUpdateNotification:updateLogLine:addLogLine:newNotificationSuppressionBehavior:",  v21,  v17,  v23,  0LL);

    goto LABEL_8;
  }

- (void)_queue_computeDeclinedPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v30 = a5;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 scheduleSummary]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 payments]);

  id v12 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[PDAccountFinancingPlanPaymentNotification notificationIdentifierForPayment:]( &OBJC_CLASS___PDAccountFinancingPlanPaymentNotification,  "notificationIdentifierForPayment:",  *(void *)(*((void *)&v31 + 1) + 8LL * (void)i)));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
        [v17 removeNotificationApplicationMessageWithIdentifier:v16];
      }

      id v13 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }

    while (v13);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v8 planIdentifier]);
  uint32_t v19 = v30;
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v30 associatedPassUniqueID]);
  v21 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountNotificationController _latestNewFinancingPlanPaymentOfType:financingPlan:oldFinancingPlan:]( self,  "_latestNewFinancingPlanPaymentOfType:financingPlan:oldFinancingPlan:",  5LL,  v8,  v9));
  v22 = v21;
  if (v21)
  {
    id v29 = v9;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v21 paymentIdentifier]);
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Found an existing active user notification for a declined payment %@ on financing plan %@. Updating contents but not re-rolling banner.",  v23,  v18));
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Creating new notification for a declined payment %@ on financing plan %@",  v23,  v18));
    if (v8)
    {
      id v35 = v8;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
      id v26 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:financingPlans:]( &OBJC_CLASS___PKPayLaterFinancingPlan,  "requiresGenericMessagingForAccount:financingPlans:",  v30,  v25);

      uint32_t v19 = v30;
    }

    else
    {
      id v26 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:financingPlans:]( &OBJC_CLASS___PKPayLaterFinancingPlan,  "requiresGenericMessagingForAccount:financingPlans:",  v30,  0LL);
    }

    v27 = -[PDAccountFinancingPlanPaymentNotification initWithFinancingPlan:payment:requiresGenericMessaging:passUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDAccountFinancingPlanPaymentNotification),  "initWithFinancingPlan:payment:requiresGenericMessaging:passUniqueIdentifier:",  v8,  v22,  v26,  v20);
    -[PDAccountNotificationController _queue_addOrUpdateNotification:updateLogLine:addLogLine:]( self,  "_queue_addOrUpdateNotification:updateLogLine:addLogLine:",  v27,  v28,  v24);

    id v9 = v29;
  }
}

- (void)_queue_computeFinancingPlanPaymentReminderNotifications:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v57 = (void *)objc_claimAutoreleasedReturnValue([v6 planIdentifier]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 associatedPassUniqueID]);
  v53 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 payLaterDetails]);
  uint64_t v55 = objc_claimAutoreleasedReturnValue([v9 createdDate]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
  v56 = (void *)v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 scheduledNotificationActivitiesForPassUniqueIdentifier:v8 ofType:53]);

  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v66;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v66 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)i);
        uint64_t v18 = objc_opt_class(&OBJC_CLASS___PDAccountFinancingPlanPaymentReminderNotification, v13);
        if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
        {
          id v19 = v17;
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 planIdentifier]);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v19 planIdentifier]);
          id v22 = v20;
          id v23 = v21;
          if (v22 != v23)
          {
            id v24 = v23;
            if (v22 && v23)
            {
              unsigned __int8 v25 = [v22 isEqualToString:v23];

              if ((v25 & 1) == 0) {
                goto LABEL_18;
              }
LABEL_13:
              uint64_t Object = PKLogFacilityTypeGetObject(14LL);
              v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v71 = v19;
                _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Removing future scheduled financing plan payment reminder notifications: %@",  buf,  0xCu);
              }

              id v22 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
              [v22 removeUserNotification:v19];
            }

            else
            {
            }

LABEL_18:
            continue;
          }

          goto LABEL_13;
        }
      }

      id v14 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
    }

    while (v14);
  }

  v58 = v6;
  v28 = (void *)objc_claimAutoreleasedReturnValue([v6 scheduleSummary]);
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 installments]);

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id v30 = v29;
  id v31 = [v30 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v62;
    do
    {
      for (j = 0LL; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v62 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = 0LL;
        uint64_t v36 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)j);
        do
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue( +[PDAccountFinancingPlanPaymentReminderNotification notificationIdentifierForInstallment:reminderOffset:]( &OBJC_CLASS___PDAccountFinancingPlanPaymentReminderNotification,  "notificationIdentifierForInstallment:reminderOffset:",  v36,  v35));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
          [v38 removeNotificationApplicationMessageWithIdentifier:v37];

          ++v35;
        }

        while (v35 != 3);
      }

      id v32 = [v30 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }

    while (v32);
  }

  v39 = v53;
  if ([v53 state] == (id)3)
  {
    uint64_t v40 = PKLogFacilityTypeGetObject(14LL);
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    v42 = v58;
    v43 = (void *)v55;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Not scheduling any financing plan payment reminder notifications since the account is locked.",  buf,  2u);
    }
  }

  else
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "pk_objectsPassingTest:", &stru_1006398A8));

    id v30 = (id)objc_claimAutoreleasedReturnValue([v44 sortedArrayUsingComparator:&stru_1006398E8]);
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 firstObject]);
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s installmentIdentifier](v41, "installmentIdentifier"));
    v42 = v58;
    char IsPending = PKPayLaterFinancingPlanStateIsPending([v58 state]);
    v43 = (void *)v55;
    if (!v41 || (IsPending & 1) != 0)
    {
      uint64_t v51 = PKLogFacilityTypeGetObject(14LL);
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Not scheduling any financing plan payment reminder notifications since there are no open installments.",  buf,  2u);
      }
    }

    else
    {
      uint64_t v46 = 0LL;
      v54 = v41;
      do
      {
        v47 = -[PDAccountFinancingPlanPaymentReminderNotification initWithInstallment:financingPlan:accountCreatedDate:passUniqueIdentifier:reminderOffset:]( objc_alloc(&OBJC_CLASS___PDAccountFinancingPlanPaymentReminderNotification),  "initWithInstallment:financingPlan:accountCreatedDate:passUniqueIdentifier:reminderOffset:",  v41,  v42,  v43,  v56,  v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification notificationIdentifier](v47, "notificationIdentifier"));
        v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Found an existing active payment reminder notification for installment %@, financing plan %@, notification identifier %@. Updating contents but not re-rolling banner.",  v59,  v57,  v48));
        v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Creating new notification for a payment reminder notification with installment %@, financing plan %@, notification identifier %@.",  v59,  v57,  v48));
        -[PDAccountNotificationController _queue_addOrUpdateNotification:updateLogLine:addLogLine:]( self,  "_queue_addOrUpdateNotification:updateLogLine:addLogLine:",  v47,  v49,  v50);

        v42 = v58;
        v41 = v54;

        v43 = (void *)v55;
        ++v46;
      }

      while (v46 != 3);
    }

    v39 = v53;
  }
}

- (void)_queue_computeFinancingPlanPastDueNotifications:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 planIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 associatedPassUniqueID]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 planSummary]);

  id v14 = [v13 daysPastDue];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 planSummary]);
  id v16 = [v15 daysPastDue];

  if (v14 != v16)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10000FD10;
    v27[3] = &unk_100639350;
    v27[4] = self;
    id v17 = v12;
    id v28 = v17;
    id v18 = v8;
    id v29 = v18;
    id v19 = objc_retainBlock(v27);
    if ([v18 state] == (id)4)
    {
      id v26 = self;
      if (v18)
      {
        id v30 = v18;
        id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
        id v21 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:financingPlans:]( &OBJC_CLASS___PKPayLaterFinancingPlan,  "requiresGenericMessagingForAccount:financingPlans:",  v9,  v20);
      }

      else
      {
        id v21 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:financingPlans:]( &OBJC_CLASS___PKPayLaterFinancingPlan,  "requiresGenericMessagingForAccount:financingPlans:",  v9,  0LL);
      }

      id v22 = -[PDAccountFinancingPlanPastDueNotification initWithFinancingPlan:requiresGenericMessaging:daysPastDue:passUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDAccountFinancingPlanPastDueNotification),  "initWithFinancingPlan:requiresGenericMessaging:daysPastDue:passUniqueIdentifier:",  v18,  v21,  v16,  v17);
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification notificationIdentifier](v22, "notificationIdentifier"));
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Found an existing active financing plan past due notification for financing plan %@, notification identifier %@. Updating contents but not re-rolling banner.",  v11,  v23));
      unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Creating new notification for a financing plan past due notification with financing plan %@, notification identifier %@.",  v11,  v23));
      if (v22) {
        ((void (*)(void *))v19[2])(v19);
      }
      -[PDAccountNotificationController _queue_addOrUpdateNotification:updateLogLine:addLogLine:]( v26,  "_queue_addOrUpdateNotification:updateLogLine:addLogLine:",  v22,  v24,  v25);
    }

    else
    {
      ((void (*)(void *))v19[2])(v19);
    }
  }
}

- (void)_queue_computeFinancingPlanScheduleSummaryReasonNotifications:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 planIdentifier]);
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v8 associatedPassUniqueID]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 scheduleSummary]);
  id v12 = [v11 scheduleSummaryReason];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 scheduleSummary]);
  id v14 = [v13 scheduleSummaryReason];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 planSummary]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 totalAmount]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 planSummary]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v17 totalAmount]);

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v14));
  if ([&off_100690E30 containsObject:v18])
  {
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v12));
    unsigned __int8 v20 = [&off_100690E48 containsObject:v19];

    if ((v20 & 1) != 0)
    {
      uint64_t v21 = 1LL;
      goto LABEL_9;
    }
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v14));
  if (![&off_100690E60 containsObject:v22])
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v12));
    unsigned __int8 v24 = [&off_100690E78 containsObject:v23];

    if ((v24 & 1) == 0) {
      goto LABEL_10;
    }
    uint64_t v21 = 3LL;
LABEL_9:
    unsigned __int8 v25 = v16;
    goto LABEL_17;
  }

LABEL_10:
  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v14));
  unsigned __int8 v25 = v16;
  if ([&off_100690E90 containsObject:v26])
  {

    goto LABEL_14;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v12));
  unsigned __int8 v28 = [&off_100690EA8 containsObject:v27];

  if ((v28 & 1) == 0)
  {
LABEL_14:
    else {
      uint64_t v21 = 0LL;
    }
    goto LABEL_17;
  }

  uint64_t v21 = 4LL;
LABEL_17:
  if (v7)
  {
    id v38 = v7;
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
    id v30 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:financingPlans:]( &OBJC_CLASS___PKPayLaterFinancingPlan,  "requiresGenericMessagingForAccount:financingPlans:",  v8,  v29);
  }

  else
  {
    id v30 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:financingPlans:]( &OBJC_CLASS___PKPayLaterFinancingPlan,  "requiresGenericMessagingForAccount:financingPlans:",  v8,  0LL);
  }

  id v31 = -[PDAccountFinancingPlanScheduleUpdateNotification initWithFinancingPlan:updateType:requiresGenericMessaging:passUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDAccountFinancingPlanScheduleUpdateNotification),  "initWithFinancingPlan:updateType:requiresGenericMessaging:passUniqueIdentifier:",  v7,  v21,  v30,  v35);
  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification notificationIdentifier](v31, "notificationIdentifier"));
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Found an existing active financing plan schedule summary reason notification for financing plan %@, notification identifier %@. Updating contents but not re-rolling banner.",  v10,  v32));
  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Creating new notification for a financing plan schedule summary reason notification with financing plan %@, notification identifier %@.",  v10,  v32));
  -[PDAccountNotificationController _queue_addOrUpdateNotification:updateLogLine:addLogLine:]( self,  "_queue_addOrUpdateNotification:updateLogLine:addLogLine:",  v31,  v33,  v34);
}

- (void)_queue_computeRefundPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 planIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 associatedPassUniqueID]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountNotificationController _latestNewFinancingPlanPaymentOfType:financingPlan:oldFinancingPlan:]( self,  "_latestNewFinancingPlanPaymentOfType:financingPlan:oldFinancingPlan:",  3LL,  v8,  v10));

  if (v13)
  {
    unsigned __int8 v20 = self;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 paymentIdentifier]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Found an existing active user notification for a refund payment %@ on financing plan %@. Updating contents but not re-rolling banner.",  v14,  v11));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Creating new notification for a refund payment %@ on financing plan %@",  v14,  v11));
    if (v8)
    {
      id v21 = v8;
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
      id v18 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:financingPlans:]( &OBJC_CLASS___PKPayLaterFinancingPlan,  "requiresGenericMessagingForAccount:financingPlans:",  v9,  v17);
    }

    else
    {
      id v18 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:financingPlans:]( &OBJC_CLASS___PKPayLaterFinancingPlan,  "requiresGenericMessagingForAccount:financingPlans:",  v9,  0LL);
    }

    id v19 = -[PDAccountFinancingPlanPaymentNotification initWithFinancingPlan:payment:requiresGenericMessaging:passUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDAccountFinancingPlanPaymentNotification),  "initWithFinancingPlan:payment:requiresGenericMessaging:passUniqueIdentifier:",  v8,  v13,  v18,  v12);
    -[PDAccountNotificationController _queue_addOrUpdateNotification:updateLogLine:addLogLine:]( v20,  "_queue_addOrUpdateNotification:updateLogLine:addLogLine:",  v19,  v15,  v16);
  }
}

- (void)_queue_computeFinancingPlanDisputeNotifications:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 planIdentifier]);
  v82 = v10;
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 associatedPassUniqueID]);
  id v13 = sub_100010D20(v12, v8);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = sub_100010D20((uint64_t)v14, v9);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = [v14 mutableCopy];
  [v17 minusSet:v16];
  v85 = v16;
  id v18 = [v16 mutableCopy];
  v86 = v14;
  [v18 minusSet:v14];
  v83 = v18;
  v89 = v8;
  v84 = (void *)v11;
  v87 = (void *)v12;
  if ([v18 count])
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 scheduledNotificationActivitiesForPassUniqueIdentifier:v12 ofType:56]);

    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472LL;
    v104[2] = sub_100010D94;
    v104[3] = &unk_100639950;
    id v105 = v83;
    v79 = v20;
    id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pk_objectsPassingTest:", v104));
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    __int128 v103 = 0u;
    id v22 = [v21 countByEnumeratingWithState:&v100 objects:v110 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v101;
      do
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v101 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v100 + 1) + 8LL * (void)i);
          uint64_t Object = PKLogFacilityTypeGetObject(14LL);
          unsigned __int8 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v109 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Removing notification for removed dispute: %@",  buf,  0xCu);
          }

          id v29 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
          [v29 removeUserNotification:v26];
        }

        id v23 = [v21 countByEnumeratingWithState:&v100 objects:v110 count:16];
      }

      while (v23);
    }

    id v8 = v89;
    uint64_t v11 = (uint64_t)v84;
    uint64_t v12 = (uint64_t)v87;
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue([v8 disputes]);
  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472LL;
  v98[2] = sub_100010E14;
  v98[3] = &unk_100639978;
  id v81 = v17;
  id v99 = v81;
  id v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "pk_objectsPassingTest:", v98));

  id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 sortedArrayUsingComparator:&stru_1006399B8]);
  v80 = v32;
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 lastObject]);
  __int128 v34 = v33;
  if (v33)
  {
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v33 identifier]);
    uint64_t v36 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    if ([v34 state] == (id)2)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Found an existing active user notification for a new financing plan dispute in evidenceRequired state %@ on financing plan %@. Updating contents but not re-rolling banner.",  v35,  v11));
      id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Creating new notification for a new financing plan dispute in evidenceRequired state %@ on financing plan %@",  v35,  v11));
      v39 = -[PDAccountFinancingPlanDisputeUpdateNotification initWithFinancingPlan:dispute:type:passUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDAccountFinancingPlanDisputeUpdateNotification),  "initWithFinancingPlan:dispute:type:passUniqueIdentifier:",  v8,  v34,  0LL,  v12);
      -[PDAccountNotificationController _queue_addOrUpdateNotification:updateLogLine:addLogLine:]( self,  "_queue_addOrUpdateNotification:updateLogLine:addLogLine:",  v39,  v37,  v38);

      uint64_t v36 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
      uint64_t v40 = 1LL;
    }

    else
    {
      uint64_t v40 = 0LL;
    }

    uint64_t v41 = objc_claimAutoreleasedReturnValue( [v36[410] stringWithFormat:@"Found an existing active user notification for a new financing plan dispute %@ on financing plan %@. Updating contents but not re-rolling banner.", v35, v11]);
    v42 = v36;
    v43 = (void *)v41;
    v44 = (void *)objc_claimAutoreleasedReturnValue( [v42[410] stringWithFormat:@"Creating new notification for a new financing plan dispute %@ on financing plan %@", v35, v11]);
    v45 = -[PDAccountFinancingPlanDisputeUpdateNotification initWithFinancingPlan:dispute:type:passUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDAccountFinancingPlanDisputeUpdateNotification),  "initWithFinancingPlan:dispute:type:passUniqueIdentifier:",  v8,  v34,  v40,  v87);
    -[PDAccountNotificationController _queue_addOrUpdateNotification:updateLogLine:addLogLine:]( self,  "_queue_addOrUpdateNotification:updateLogLine:addLogLine:",  v45,  v43,  v44);
  }

  v78 = v34;
  id v46 = [v86 mutableCopy];
  [v46 intersectSet:v85];
  v47 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  id obj = v46;
  id v48 = [obj countByEnumeratingWithState:&v94 objects:v107 count:16];
  if (v48)
  {
    id v49 = v48;
    uint64_t v50 = *(void *)v95;
    do
    {
      for (j = 0LL; j != v49; j = (char *)j + 1)
      {
        if (*(void *)v95 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v52 = *(void *)(*((void *)&v94 + 1) + 8LL * (void)j);
        v53 = (void *)objc_claimAutoreleasedReturnValue([v89 disputeWithIdentifier:v52]);
        id v54 = [v53 state];
        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v9 disputeWithIdentifier:v52]);
        id v56 = [v55 state];

        if (v54 != v56) {
          -[NSMutableArray safelyAddObject:](v47, "safelyAddObject:", v53);
        }
      }

      id v49 = [obj countByEnumeratingWithState:&v94 objects:v107 count:16];
    }

    while (v49);
  }

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v47, "sortedArrayUsingComparator:", &stru_1006399D8));
  id v58 = [v57 mutableCopy];

  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  id v59 = v58;
  id v60 = [v59 countByEnumeratingWithState:&v90 objects:v106 count:16];
  if (v60)
  {
    id v61 = v60;
    uint64_t v62 = *(void *)v91;
    do
    {
      for (k = 0LL; k != v61; k = (char *)k + 1)
      {
        if (*(void *)v91 != v62) {
          objc_enumerationMutation(v59);
        }
        __int128 v64 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v90 + 1) + 8 * (void)k) identifier]);
        __int128 v65 = (void *)objc_claimAutoreleasedReturnValue([v9 disputeWithIdentifier:v64]);

        __int128 v66 = (void *)objc_claimAutoreleasedReturnValue( +[PDAccountFinancingPlanDisputeUpdateNotification notificationIdentifierForFinancingPlan:dispute:type:]( &OBJC_CLASS___PDAccountFinancingPlanDisputeUpdateNotification,  "notificationIdentifierForFinancingPlan:dispute:type:",  v9,  v65,  1LL));
        __int128 v67 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
        [v67 removeUserNotificationWithIdentifier:v66];

        __int128 v68 = (void *)objc_claimAutoreleasedReturnValue( +[PDAccountFinancingPlanDisputeUpdateNotification notificationIdentifierForFinancingPlan:dispute:type:]( &OBJC_CLASS___PDAccountFinancingPlanDisputeUpdateNotification,  "notificationIdentifierForFinancingPlan:dispute:type:",  v9,  v65,  0LL));
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
        [v69 removeUserNotificationWithIdentifier:v68];
      }

      id v61 = [v59 countByEnumeratingWithState:&v90 objects:v106 count:16];
    }

    while (v61);
  }

  v70 = (void *)objc_claimAutoreleasedReturnValue([v59 lastObject]);
  id v71 = v70;
  v72 = v87;
  v73 = v89;
  if (v70)
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue([v70 identifier]);
    v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Found an existing active user notification for a financing plan dispute state change %@ on financing plan %@. Updating contents but not re-rolling banner.",  v74,  v84));
    v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Creating new notification for a financing plan dispute state change %@ on financing plan %@",  v74,  v84));
    v76 = -[PDAccountFinancingPlanDisputeUpdateNotification initWithFinancingPlan:dispute:type:passUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDAccountFinancingPlanDisputeUpdateNotification),  "initWithFinancingPlan:dispute:type:passUniqueIdentifier:",  v89,  v71,  1LL,  v87);
    -[PDAccountNotificationController _queue_addOrUpdateNotification:updateLogLine:addLogLine:]( self,  "_queue_addOrUpdateNotification:updateLogLine:addLogLine:",  v76,  v77,  v75);

    v73 = v89;
    v72 = v87;
  }
}

- (void)_queue_computeAdjustmentPaymentNotification:(id)a3 oldFinancingPlan:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 planIdentifier]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 associatedPassUniqueID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountNotificationController _latestNewFinancingPlanPaymentOfType:financingPlan:oldFinancingPlan:]( self,  "_latestNewFinancingPlanPaymentOfType:financingPlan:oldFinancingPlan:",  7LL,  v8,  v10));

  if (v13)
  {
    unsigned __int8 v20 = self;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 paymentIdentifier]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Found an existing active user notification for a adjustment payment %@ on financing plan %@. Updating contents but not re-rolling banner.",  v14,  v11));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Creating new notification for a adjustment payment %@ on financing plan %@",  v14,  v11));
    if (v8)
    {
      id v21 = v8;
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
      id v18 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:financingPlans:]( &OBJC_CLASS___PKPayLaterFinancingPlan,  "requiresGenericMessagingForAccount:financingPlans:",  v9,  v17);
    }

    else
    {
      id v18 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:financingPlans:]( &OBJC_CLASS___PKPayLaterFinancingPlan,  "requiresGenericMessagingForAccount:financingPlans:",  v9,  0LL);
    }

    id v19 = -[PDAccountFinancingPlanPaymentNotification initWithFinancingPlan:payment:requiresGenericMessaging:passUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDAccountFinancingPlanPaymentNotification),  "initWithFinancingPlan:payment:requiresGenericMessaging:passUniqueIdentifier:",  v8,  v13,  v18,  v12);
    -[PDAccountNotificationController _queue_addOrUpdateNotification:updateLogLine:addLogLine:]( v20,  "_queue_addOrUpdateNotification:updateLogLine:addLogLine:",  v19,  v15,  v16);
  }
}

- (void)_queue_computeAccountStateChangeNotification:(id)a3 oldAccount:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v12 associatedPassUniqueID]);
  id v8 = +[PKPayLaterFinancingPlan requiresGenericMessagingForAccount:financingPlans:]( &OBJC_CLASS___PKPayLaterFinancingPlan,  "requiresGenericMessagingForAccount:financingPlans:",  v12,  0LL);
  id v9 = [v6 state];

  if ([v12 state] != (id)1)
  {
    id v10 = [v12 state];
    if (v9 == (id)1)
    {
      if (v10)
      {
        uint64_t v11 = -[PDPassAccountStateChangeUserNotification initWithPassUniqueIdentifier:accountState:accountStateReason:accessLevel:featureIdentifier:requiresDebtCollectionNotices:]( [PDPassAccountStateChangeUserNotification alloc],  "initWithPassUniqueIdentifier:accountState:accountStateReason:accessLevel:featureIdentifier:requiresDebtC ollectionNotices:",  v7,  [v12 state],  objc_msgSend(v12, "stateReason"),  0,  objc_msgSend(v12, "feature"),  v8);
        -[PDAccountNotificationController _queue_addOrUpdateNotification:updateLogLine:addLogLine:]( self,  "_queue_addOrUpdateNotification:updateLogLine:addLogLine:",  v11,  @"Found an existing active user notification for a pay later account state change. Updating contents but not re-rolling banner.",  @"Creating new notification for a pay later account state change");
      }
    }
  }
}

- (void)_queue_removeSummaryTimesForAccountChangedIfNecessary:(id)a3 oldAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v7 state] != (id)3 && objc_msgSend(v7, "state") != (id)4;
  BOOL v9 = [v6 state] != (id)3 && objc_msgSend(v6, "state") != (id)4;
  id v10 = [v6 state];
  if (v10 != [v7 state] && (v8 || v9) && !v9)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Removing financing plan notifications because the pay later account is locked or closed",  v13,  2u);
    }

    -[PDAccountNotificationController _removePayLaterNotificationsForAccount:removeAccountStateChangeNotification:]( self,  "_removePayLaterNotificationsForAccount:removeAccountStateChangeNotification:",  v6,  0LL);
  }
}

- (id)_latestNewFinancingPlanPaymentOfType:(unint64_t)a3 financingPlan:(id)a4 oldFinancingPlan:(id)a5
{
  id v7 = a4;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000114E8;
  v26[3] = &unk_100639A38;
  v26[4] = a3;
  id v8 = a5;
  BOOL v9 = objc_retainBlock(v26);
  uint64_t v10 = ((uint64_t (*)(void *, id))v9[2])(v9, v8);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  uint64_t v12 = ((uint64_t (*)(void *, id))v9[2])(v9, v7);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = [v13 mutableCopy];

  [v14 minusSet:v11];
  if ([v14 count])
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 scheduleSummary]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 paymentsOfType:a3]);
    id v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472LL;
    id v23 = sub_100011574;
    uint64_t v24 = &unk_100639A60;
    id v25 = v14;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pk_objectsPassingTest:", &v21));

    id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sortedArrayUsingComparator:", &stru_100639AA0, v21, v22, v23, v24));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 lastObject]);
  }

  else
  {
    id v19 = 0LL;
  }

  return v19;
}

- (void)_accountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController workQueue](self, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000116E0;
    block[3] = &unk_100639AF0;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)_queue_addOrUpdateNotification:(id)a3 updateLogLine:(id)a4 addLogLine:(id)a5
{
}

- (void)_queue_addOrUpdateNotification:(id)a3 updateLogLine:(id)a4 addLogLine:(id)a5 newNotificationSuppressionBehavior:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 notificationIdentifier]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100011940;
    v15[3] = &unk_100639B40;
    v15[4] = self;
    id v16 = v11;
    id v17 = v10;
    id v18 = v12;
    unint64_t v19 = a6;
    [v13 userNotificationWithIdentifier:v14 completion:v15];
  }
}

- (BOOL)_didPayOffFinancingPlan:(id)a3 oldFinancingPlan:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 state];
  id v8 = [v6 state];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 disputes]);

  unsigned __int8 v10 = objc_msgSend(v9, "pk_containsObjectPassingTest:", &stru_100639B80);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 disputes]);

  unsigned int v12 = objc_msgSend(v11, "pk_containsObjectPassingTest:", &stru_100639BA0);
  if (v7 != (id)6 && v8 == (id)6 && !v12) {
    return 1;
  }
  BOOL v14 = v7 == (id)6 && v8 == (id)6;
  char v15 = v10 ^ 1;
  if (!v14) {
    char v15 = 1;
  }
  return (v15 | v12) ^ 1;
}

- (BOOL)_canShowPayLaterNotificationsForAccount:(id)a3 overrideBlockNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedPassUniqueID]);
  unsigned int v8 = [v6 supportsShowNotifications];
  unsigned int v9 = [v6 blockNotifications];
  if (!v6)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    char v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23[0]) = 0;
      id v16 = "Skipping pay later notifications since there is no account defined";
LABEL_9:
      id v17 = v15;
      uint32_t v18 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)v23, v18);
    }

- (BOOL)_canShowPayLaterNotificationsForAccount:(id)a3 financingPlan:(id)a4
{
  id v6 = a4;
  unsigned int v7 = -[PDAccountNotificationController _canShowPayLaterNotificationsForAccount:overrideBlockNotifications:]( self,  "_canShowPayLaterNotificationsForAccount:overrideBlockNotifications:",  a3,  0LL);
  BOOL v8 = 0;
  if (v7)
  {
    if ([v6 updateReasonIsInitialDownload])
    {
      uint64_t Object = PKLogFacilityTypeGetObject(14LL);
      unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 planIdentifier]);
        int v13 = 138412290;
        BOOL v14 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Skipping financing plan financing plan notification %@ since it was apart of initial download.",  (uint8_t *)&v13,  0xCu);
      }

      BOOL v8 = 0;
    }

    else
    {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (PDAccountNotificationController)initWithAccountManager:(id)a3 userNotificationManager:(id)a4 databaseManager:(id)a5 paymentWebServiceCoordinator:(id)a6 peerPaymentWebServiceCoordinator:(id)a7 familyMemberManager:(id)a8
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___PDAccountNotificationController;
  uint32_t v18 = -[PDAccountNotificationController init](&v31, "init");
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_webServiceCoordinator, a6);
    objc_storeStrong((id *)&v19->_userNotificationManager, a4);
    objc_storeStrong((id *)&v19->_databaseManager, a5);
    objc_storeStrong((id *)&v19->_peerPaymentWebServiceCoordinator, a7);
    objc_storeStrong((id *)&v19->_familyMemberManager, a8);
    -[PDFamilyCircleManager addObserver:](v19->_familyMemberManager, "addObserver:", v19, v26, v27, v28);
    dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.passd.accountnotificationcontroller", v21);
    workQueue = v19->_workQueue;
    v19->_workQueue = (OS_dispatch_queue *)v22;

    objc_storeStrong((id *)&v19->_accountManager, a3);
    -[PDAccountManager registerObserver:](v19->_accountManager, "registerObserver:", v19);
    __int16 v24 = (dispatch_queue_s *)v19->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100263690;
    block[3] = &unk_100639300;
    id v30 = v19;
    dispatch_async(v24, block);
  }

  return v19;
}

- (void)paymentTransactionUpdated:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (([v7 updateReasonIsInitialDownload] & 1) == 0) {
    -[PDAccountNotificationController _recomputeSummaryNotificationsForTransactionSourceIdentifier:withTransaction:]( self,  "_recomputeSummaryNotificationsForTransactionSourceIdentifier:withTransaction:",  v6,  v7);
  }
}

- (void)_resurfaceRecentNotificationsAndPromote:(BOOL)a3
{
  accountManager = self->_accountManager;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100263804;
  v4[3] = &unk_100650050;
  v4[4] = self;
  BOOL v5 = a3;
  -[PDAccountManager accountsWithCompletion:](accountManager, "accountsWithCompletion:", v4);
}

- (void)_resurfaceRecentNotificationsForAccount:(id)a3 andPromote:(BOOL)a4
{
  id v6 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100263980;
  block[3] = &unk_10063B300;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)insertSummaryNotificationForAccountIdentifier:(id)a3 summaryType:(unint64_t)a4
{
  databaseManager = self->_databaseManager;
  id v7 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierWithAssociatedAccountIdentifier:]( databaseManager,  "passUniqueIdentifierWithAssociatedAccountIdentifier:",  v7));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v13));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentPass]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v11));
  -[PDAccountNotificationController _recomputeSummaryNotificationsForAccountIdentifier:paymentPass:dateForSummary:summaryTypes:fireImmediately:]( self,  "_recomputeSummaryNotificationsForAccountIdentifier:paymentPass:dateForSummary:summaryTypes:fireImmediately:",  v7,  v9,  v10,  v12,  1LL);
}

- (void)_recomputeSummaryNotificationsForTransactionSourceIdentifier:(id)a3 withTransaction:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierWithAssociatedAccountIdentifier:]( self->_databaseManager,  "passUniqueIdentifierWithAssociatedAccountIdentifier:",  v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passWithUniqueIdentifier:](self->_databaseManager, "passWithUniqueIdentifier:", v7));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentPass]);

  if ((PKIsPhone(v10, v11) & 1) != 0 || (PKIsPad() & 1) != 0)
  {
    if (!v7) {
      goto LABEL_16;
    }
  }

  else
  {
    char v12 = PKIsVision();
    if (!v7 || (v12 & 1) == 0) {
      goto LABEL_16;
    }
  }

  if (v5 && v6 && v9)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t Month = PKStartOfLastMonth(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(Month);

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 transactionDate]);
    if ([v16 compare:v15] == (id)-1)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(14LL);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Outdated transaction (%@), not computing summary notifications",  buf,  0xCu);
      }
    }

    else
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  &off_1006904E8,  &off_100690500,  0LL));
      -[PDAccountNotificationController _recomputeSummaryNotificationsForAccountIdentifier:paymentPass:dateForSummary:summaryTypes:fireImmediately:]( self,  "_recomputeSummaryNotificationsForAccountIdentifier:paymentPass:dateForSummary:summaryTypes:fireImmediately:",  v6,  v9,  v16,  v17,  0LL);
    }
  }

- (void)_recomputeSummaryNotificationsForAccountIdentifier:(id)a3 paymentPass:(id)a4 dateForSummary:(id)a5 summaryTypes:(id)a6 fireImmediately:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v28 = v14;
  if (![v15 count])
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", &off_1006904E8, &off_100690500, 0LL, v14));

    id v15 = (id)v16;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
  id v18 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  v47[0] = 0LL;
  v47[1] = v47;
  v47[2] = 0x3032000000LL;
  v47[3] = sub_10026423C;
  v47[4] = sub_10026424C;
  id v48 = 0LL;
  v45[0] = 0LL;
  v45[1] = v45;
  v45[2] = 0x3032000000LL;
  v45[3] = sub_10026423C;
  v45[4] = sub_10026424C;
  id v46 = 0LL;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_100264254;
  v42[3] = &unk_10063B5A8;
  v42[4] = self;
  id v19 = v12;
  id v43 = v19;
  v44 = v47;
  [v18 addOperation:v42];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100264368;
  v39[3] = &unk_10063B5A8;
  v39[4] = self;
  id v20 = v19;
  id v40 = v20;
  uint64_t v41 = v45;
  [v18 addOperation:v39];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100264494;
  v29[3] = &unk_100650140;
  uint64_t v36 = v47;
  id v22 = v17;
  id v30 = v22;
  id v23 = v13;
  v37 = v45;
  id v31 = v23;
  id v32 = self;
  id v24 = v20;
  id v33 = v24;
  id v25 = v15;
  id v34 = v25;
  id v26 = v28;
  id v35 = v26;
  BOOL v38 = a7;
  id v27 = [v18 evaluateWithInput:v21 completion:v29];

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v47, 8);
}

- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100265130;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)accountManager:(id)a3 didAddAccountEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 updateReasonIsInitialDownload] & 1) == 0)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002651F0;
    block[3] = &unk_100639350;
    void block[4] = self;
    id v10 = v7;
    id v11 = v6;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)accountManager:(id)a3 didUpdateAccountEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100265308;
  block[3] = &unk_100639350;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)accountManager:(id)a3 didRemoveAccountEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100265460;
  block[3] = &unk_100639350;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)accountManager:(id)a3 accountUsersChanged:(id)a4 oldUsers:(id)a5 accountIdentifier:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  workQueue = self->_workQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002655A0;
  v16[3] = &unk_10063B060;
  id v17 = v9;
  id v18 = self;
  id v19 = v11;
  id v20 = v10;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  dispatch_async((dispatch_queue_t)workQueue, v16);
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002658EC;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002659B8;
  block[3] = &unk_100639350;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)accountManager:(id)a3 creditRecoveryPaymentPlansChangedForAccountIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierWithAssociatedAccountIdentifier:]( self->_databaseManager,  "passUniqueIdentifierWithAssociatedAccountIdentifier:",  v5));
  if (v6)
  {
    accountManager = self->_accountManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100266240;
    v8[3] = &unk_100639840;
    v8[4] = self;
    id v9 = v5;
    id v10 = v6;
    -[PDAccountManager accountWithIdentifier:completion:](accountManager, "accountWithIdentifier:completion:", v9, v8);
  }
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002663AC;
  block[3] = &unk_100639350;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)accountManager:(id)a3 didSetScheduledPayments:(id)a4 forAccountIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100266694;
  block[3] = &unk_100639350;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)accountManager:(id)a3 didUpdatePaymentFundingSources:(id)a4 accountIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  accountManager = self->_accountManager;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002667D4;
  v12[3] = &unk_10063E250;
  id v13 = v8;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  -[PDAccountManager accountsWithCompletion:](accountManager, "accountsWithCompletion:", v12);
}

- (void)_updateInstallmentNotificationsForOldAccount:(id)a3 newAccount:(id)a4 passUniqueIdentifier:(id)a5
{
  id v7 = a3;
  id v64 = a4;
  id v63 = a5;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  id v58 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 creditDetails]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 installmentPlans]);

  id v11 = [v10 countByEnumeratingWithState:&v73 objects:v79 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v74;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v74 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v15, v16);
      }

      id v12 = [v10 countByEnumeratingWithState:&v73 objects:v79 count:16];
    }

    while (v12);
  }

  id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v64 creditDetails]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 installmentPlans]);

  id v20 = [v19 countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v70;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v70 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)j);
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v24, v25);
      }

      id v21 = [v19 countByEnumeratingWithState:&v69 objects:v78 count:16];
    }

    while (v21);
  }

  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  v57 = v17;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v17, "allValues"));
  id v26 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v66;
    uint64_t v59 = PKSharedCacheApplicationDateForAppleCardInstallmentsFlow;
    uint64_t v60 = *(void *)v66;
    do
    {
      id v29 = 0LL;
      do
      {
        if (*(void *)v66 != v28) {
          objc_enumerationMutation(obj);
        }
        id v30 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)v29);
        id v31 = [v30 state];
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
        id v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v32));

        if (!v33)
        {
          id v35 = -[PDInstallmentAddedUserNotification initWithAccount:installmentPlan:passUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDInstallmentAddedUserNotification),  "initWithAccount:installmentPlan:passUniqueIdentifier:",  v64,  v30,  v63);
          -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v35);
          uint64_t DateForKey = PKSharedCacheGetDateForKey(v59);
          id v43 = (void *)objc_claimAutoreleasedReturnValue(DateForKey);
          databaseManager = self->_databaseManager;
          v45 = (void *)objc_claimAutoreleasedReturnValue([v64 accountIdentifier]);
          id v46 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager physicalCardsForAccountWithIdentifier:]( databaseManager,  "physicalCardsForAccountWithIdentifier:",  v45));

          if (v43)
          {
            [v43 timeIntervalSinceNow];
            double v48 = v47;
            [v43 timeIntervalSinceNow];
            if (v48 < 0.0) {
              double v49 = -v49;
            }
            if (v49 <= 3600.0 && ![v46 count])
            {
              uint64_t v50 = objc_alloc(&OBJC_CLASS___PDWalletUserNotification);
              uint64_t v51 = PKLocalizedFeatureString( @"FINISH_SETTING_UP_NOTIFICATION_TITLE",  [v64 feature]);
              uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
              uint64_t v53 = PKLocalizedFeatureString( @"FINISH_SETTING_UP_NOTIFICATION_MESSAGE",  [v64 feature]);
              id v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
              uint64_t v55 = -[PDGenericUserNotification initWithTitle:message:forPassUniqueIdentifier:]( v50,  "initWithTitle:message:forPassUniqueIdentifier:",  v52,  v54,  v63);

              -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v55);
              PKSharedCacheRemoveObjectForKey(v59);
            }
          }

          uint64_t v28 = v60;
          goto LABEL_33;
        }

        if (v31 == (id)2)
        {
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v30 payments]);
          id v35 = (PDInstallmentAddedUserNotification *)objc_claimAutoreleasedReturnValue([v34 firstObject]);

          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v33 payments]);
          v37 = (void *)objc_claimAutoreleasedReturnValue([v36 firstObject]);

          BOOL v38 = (void *)objc_claimAutoreleasedReturnValue(-[PDInstallmentAddedUserNotification statement](v35, "statement"));
          if (v38)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue([v37 statementIdentifier]);

            if (!v39)
            {
              id v40 = -[PDInstallmentStateUserNotification initWithAccount:installmentPlan:passUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDInstallmentStateUserNotification),  "initWithAccount:installmentPlan:passUniqueIdentifier:",  v64,  v30,  v63);
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v38 closingDate]);
              -[PDInstallmentStateUserNotification setStatementClosingDate:](v40, "setStatementClosingDate:", v41);

              uint64_t v28 = v60;
              -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v40);
            }
          }

          goto LABEL_33;
        }

        if ([v33 state] != v31 && (char *)objc_msgSend(v30, "state") - 3 <= (char *)1)
        {
          id v35 = -[PDInstallmentStateUserNotification initWithAccount:installmentPlan:passUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDInstallmentStateUserNotification),  "initWithAccount:installmentPlan:passUniqueIdentifier:",  v64,  v30,  v63);
          -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v35);
LABEL_33:
        }

        id v29 = (char *)v29 + 1;
      }

      while (v27 != v29);
      id v56 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
      id v27 = v56;
    }

    while (v56);
  }
}

- (void)_updatePastDueNotificationsForOldAccount:(id)a3 newAccount:(id)a4 passUniqueIdentifier:(id)a5 enrolledInRecoveryPaymentPlan:(BOOL)a6
{
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100266FDC;
  v14[3] = &unk_10063B558;
  v14[4] = self;
  id v15 = v10;
  id v16 = v9;
  BOOL v17 = a6;
  id v12 = v9;
  id v13 = v10;
  dispatch_async((dispatch_queue_t)workQueue, v14);
}

- (void)_recomputePaymentNotificationsForScheduledPayments:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002673E8;
  block[3] = &unk_100639350;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (id)_upcomingScheduledPaymentNotificationsForPayment:(id)a3 account:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = -[PDAccountPaymentScheduledUserNotification initWithAccount:payment:reminderOffset:]( objc_alloc(&OBJC_CLASS___PDAccountPaymentScheduledUserNotification),  "initWithAccount:payment:reminderOffset:",  v5,  v6,  1LL);
  if (-[PDAccountPaymentScheduledUserNotification isValid](v8, "isValid")) {
    id v9 = v8;
  }
  else {
    id v9 = 0LL;
  }
  -[NSMutableArray safelyAddObject:](v7, "safelyAddObject:", v9);
  id v10 = -[PDAccountPaymentScheduledUserNotification initWithAccount:payment:reminderOffset:]( objc_alloc(&OBJC_CLASS___PDAccountPaymentScheduledUserNotification),  "initWithAccount:payment:reminderOffset:",  v5,  v6,  0LL);

  if (-[PDAccountPaymentScheduledUserNotification isValid](v10, "isValid")) {
    id v11 = v10;
  }
  else {
    id v11 = 0LL;
  }
  -[NSMutableArray safelyAddObject:](v7, "safelyAddObject:", v11);
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    BOOL v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Evaluation resulted in 'Payment Reminder' notifications: %@",  (uint8_t *)&v16,  0xCu);
  }

  id v14 = -[NSMutableArray copy](v7, "copy");
  return v14;
}

- (id)_paymentDueNotificationsForAccount:(id)a3 estimatedRemainingMinimumPayment:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = -[PDAccountPaymentDueUserNotification initWithAccount:estimatedRemainingMinimumPayment:reminderOffset:]( objc_alloc(&OBJC_CLASS___PDAccountPaymentDueUserNotification),  "initWithAccount:estimatedRemainingMinimumPayment:reminderOffset:",  v6,  v5,  2LL);
  if (-[PDAccountPaymentDueUserNotification isValid](v8, "isValid")) {
    id v9 = v8;
  }
  else {
    id v9 = 0LL;
  }
  -[NSMutableArray safelyAddObject:](v7, "safelyAddObject:", v9);
  id v10 = -[PDAccountPaymentDueUserNotification initWithAccount:estimatedRemainingMinimumPayment:reminderOffset:]( objc_alloc(&OBJC_CLASS___PDAccountPaymentDueUserNotification),  "initWithAccount:estimatedRemainingMinimumPayment:reminderOffset:",  v6,  v5,  1LL);

  if (-[PDAccountPaymentDueUserNotification isValid](v10, "isValid")) {
    id v11 = v10;
  }
  else {
    id v11 = 0LL;
  }
  -[NSMutableArray safelyAddObject:](v7, "safelyAddObject:", v11);
  id v12 = -[PDAccountPaymentDueUserNotification initWithAccount:estimatedRemainingMinimumPayment:reminderOffset:]( objc_alloc(&OBJC_CLASS___PDAccountPaymentDueUserNotification),  "initWithAccount:estimatedRemainingMinimumPayment:reminderOffset:",  v6,  v5,  0LL);

  if (-[PDAccountPaymentDueUserNotification isValid](v12, "isValid")) {
    id v13 = v12;
  }
  else {
    id v13 = 0LL;
  }
  -[NSMutableArray safelyAddObject:](v7, "safelyAddObject:", v13);
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Evaluation resulted in 'Payment Due' notifications: %@",  (uint8_t *)&v18,  0xCu);
  }

  id v16 = -[NSMutableArray copy](v7, "copy");
  return v16;
}

- (void)_notificationForAccountEvent:(id)a3 withManager:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10 && ([v8 updateReasonIsInitialDownload] & 1) == 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 accountIdentifier]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100268908;
    v12[3] = &unk_10064B940;
    void v12[4] = self;
    id v13 = v8;
    id v14 = v10;
    [v9 accountWithIdentifier:v11 completion:v12];
  }
}

- (id)_notificationForAccountEvent:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseManager = self->_databaseManager;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 accountIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierWithAssociatedAccountIdentifier:]( databaseManager,  "passUniqueIdentifierWithAssociatedAccountIdentifier:",  v9));

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 anyObject]);

    id v13 = objc_alloc(&OBJC_CLASS___PDPassAccountEventUserNotification);
    id v14 = [v7 feature];
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 creditDetails]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 accountSummary]);
    BOOL v17 = -[PDPassAccountEventUserNotification initWithPassUniqueIdentifier:transactionSourceIdentifier:accountEvent:featureIdentifier:requiresDebtCollectionNotices:]( v13,  "initWithPassUniqueIdentifier:transactionSourceIdentifier:accountEvent:featureIdentifier:requiresDebtCollectionNotices:",  v10,  v12,  v6,  v14,  [v16 requiresDebtCollectionNotices]);
  }

  else
  {
    BOOL v17 = 0LL;
  }

  return v17;
}

- (void)updateDailyCashNotificationsWithAccount:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager peerPaymentAccount](self->_databaseManager, "peerPaymentAccount"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 associatedPassUniqueID]);

  if (v6
    && -[PDDatabaseManager settingEnabled:forPassWithUniqueIdentifier:]( self->_databaseManager,  "settingEnabled:forPassWithUniqueIdentifier:",  1024LL,  v6))
  {
    -[PDUserNotificationManager removeUserNotificationsForPassUniqueIdentifier:ofType:]( self->_userNotificationManager,  "removeUserNotificationsForPassUniqueIdentifier:ofType:",  v6,  23LL);
    -[PDUserNotificationManager removeUserNotificationsForPassUniqueIdentifier:ofType:]( self->_userNotificationManager,  "removeUserNotificationsForPassUniqueIdentifier:ofType:",  v6,  42LL);
    -[PDUserNotificationManager removeUserNotificationsForPassUniqueIdentifier:ofType:]( self->_userNotificationManager,  "removeUserNotificationsForPassUniqueIdentifier:ofType:",  v6,  43LL);
  }

  else if (v4 {
         && (![v4 supportsShowNotifications]
  }
          || [v4 blockNotifications]))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
      else {
        id v10 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      else {
        id v11 = @"NO";
      }
      id v15 = v9;
      __int16 v16 = 2112;
      BOOL v17 = v10;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Suppressing daily Daily Cash notifications for account with identifier %@. supportsShowNotifications: %@ blockNotifications: %@",  buf,  0x20u);
    }
  }

  else
  {
    accountManager = self->_accountManager;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100268F84;
    v13[3] = &unk_10063A2F0;
    v13[4] = self;
    -[PDAccountManager defaultAccountForFeature:completion:]( accountManager,  "defaultAccountForFeature:completion:",  2LL,  v13);
  }
}

- (void)updateDailyCashNotificationsForAccountIdentifier:(id)a3 date:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_10026423C;
  id v30 = sub_10026424C;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  id v31 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  if (([v12 isDateInToday:v27[5]] & 1) != 0
    || ([v12 isDateInTomorrow:v27[5]] & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dateByAddingUnit:16 value:-1 toDate:v27[5] options:0]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[PDPassPaymentDailyDailyCashUserNotification notificationIdentifierForDate:]( &OBJC_CLASS___PDPassPaymentDailyDailyCashUserNotification,  "notificationIdentifierForDate:",  v27[5]));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[PDPassPaymentDailyDailyCashUserNotification notificationIdentifierForDate:]( &OBJC_CLASS___PDPassPaymentDailyDailyCashUserNotification,  "notificationIdentifierForDate:",  v13));
    userNotificationManager = self->_userNotificationManager;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100269288;
    v19[3] = &unk_100650408;
    v19[4] = self;
    id v17 = v15;
    id v20 = v17;
    id v25 = &v26;
    id v21 = v12;
    id v18 = v13;
    id v22 = v18;
    id v23 = v8;
    id v24 = v10;
    -[PDUserNotificationManager userNotificationWithIdentifier:completion:]( userNotificationManager,  "userNotificationWithIdentifier:completion:",  v14,  v19);
  }

  else if (v10)
  {
    v10[2](v10);
  }

  _Block_object_dispose(&v26, 8);
}

- (void)_updateAccountUserMonthlySpendLimitNotificationsForOldAccount:(id)a3 newAccount:(id)a4 accountUserCollection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((PKIsMac(v10, v11) & 1) == 0 && [v9 accessLevel] != (id)2)
  {
    userNotificationManager = self->_userNotificationManager;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100269AE0;
    v13[3] = &unk_10063A4B8;
    v13[4] = self;
    id v14 = v10;
    id v15 = v9;
    id v16 = v8;
    -[PDUserNotificationManager userNotificationsOfType:completion:]( userNotificationManager,  "userNotificationsOfType:completion:",  37LL,  v13);
  }
}

- (void)_updateAccountUserIdentityStatusNotificationsWithAccount:(id)a3 accountUserCollection:(id)a4 oldAccountUserCollection:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((PKAccountStateIsTerminal([v13 state]) & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 currentAccountUser]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 currentAccountUser]);
    if ((PKAccountStateIsTerminal([v10 accountState]) & 1) == 0
      && [v11 identityStatus] == (id)3
      && [v10 identityStatus] == (id)2)
    {
      id v12 = -[PDAccountFailedIdentityVerificationUserNotification initWithAccount:accountUser:]( objc_alloc(&OBJC_CLASS___PDAccountFailedIdentityVerificationUserNotification),  "initWithAccount:accountUser:",  v13,  v10);
      -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v12);
    }
  }
}

- (void)_queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = v4;
  if (self->_familyMemberCollection)
  {
    if (v4) {
      v4[2](v4);
    }
  }

  else
  {
    familyMemberManager = self->_familyMemberManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10026A434;
    v7[3] = &unk_10063F520;
    void v7[4] = self;
    id v8 = v4;
    -[PDFamilyCircleManager familyMembersWithCachePolicy:completion:]( familyMemberManager,  "familyMembersWithCachePolicy:completion:",  0LL,  v7);
  }
}

- (PDUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void)setUserNotificationManager:(id)a3
{
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (PDAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)updatedSavingsAccount:(id)a3 oldAccount:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [v8 blockNotifications];
  -[PDAccountNotificationController _updateAccountStateNotificationForNewAccount:oldAccount:]( self,  "_updateAccountStateNotificationForNewAccount:oldAccount:",  v8,  v6);
  -[PDAccountNotificationController _updateAccountAPYMessageForNewAccount:oldAccount:blockNotifications:]( self,  "_updateAccountAPYMessageForNewAccount:oldAccount:blockNotifications:",  v8,  v6,  v7);
  if ((v7 & 1) == 0) {
    -[PDAccountNotificationController _updateAccountBalanceNotificationForNewAccount:oldAccount:]( self,  "_updateAccountBalanceNotificationForNewAccount:oldAccount:",  v8,  v6);
  }
  -[PDAccountNotificationController _updateCanShowFixRewardsMessageForNewAccount:oldAccount:]( self,  "_updateCanShowFixRewardsMessageForNewAccount:oldAccount:",  v8,  v6);
  -[PDAccountNotificationController _updateFCCStepUpMessageForNewAccount:oldAccount:]( self,  "_updateFCCStepUpMessageForNewAccount:oldAccount:",  v8,  v6);
}

- (void)updatedFundingSources:(id)a3 forSavingsAccount:(id)a4
{
  id v5 = a3;
  id v29 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Reconciling updated funding sources with verification notifications",  buf,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pk_objectsPassingTest:", &stru_10065E950));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pk_arrayByApplyingBlock:", &stru_10065E990));
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 fundingDetails]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 verificationDetails]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 pendingAttempt]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sentDate]);

        uint64_t v20 = PKShortDayAndMonthStringFromDate(v19);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        id v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v9, "objectForKey:", v21));
        if (!v22)
        {
          id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v22, v21);
        }

        -[NSMutableArray addObject:](v22, "addObject:", v15);
      }

      id v12 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }

    while (v12);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10040B3E8;
  v31[3] = &unk_10065EB00;
  id v32 = (id)objc_claimAutoreleasedReturnValue([v29 accountIdentifier]);
  id v33 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
  id v34 = v28;
  id v35 = v9;
  id v36 = v29;
  v37 = self;
  id v23 = v29;
  id v24 = v9;
  id v25 = v28;
  id v26 = v33;
  id v27 = v32;
  -[PDAccountNotificationController _scheduledAndDeliveredUserNotificationsOfType:completion:]( self,  "_scheduledAndDeliveredUserNotificationsOfType:completion:",  78LL,  v31);
}

- (void)removeSavingsNotificationsForAccount:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 accountIdentifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PDAccountAPYUpdateUserNotification notificationIdentifierForAccountIdentifier:]( &OBJC_CLASS___PDAccountAPYUpdateUserNotification,  "notificationIdentifierForAccountIdentifier:",  v8));
  [v4 removeUserNotificationWithIdentifier:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PDAccountOverdrawnBalanceUserNotification notificationIdentifierForAccountIdentifier:]( &OBJC_CLASS___PDAccountOverdrawnBalanceUserNotification,  "notificationIdentifierForAccountIdentifier:",  v8));
  [v4 removeUserNotificationWithIdentifier:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PDAccountFCCStepUpThresholdExceededUserNotification notificationIdentifierForAccountIdentifier:]( &OBJC_CLASS___PDAccountFCCStepUpThresholdExceededUserNotification,  "notificationIdentifierForAccountIdentifier:",  v8));
  [v4 removeUserNotificationWithIdentifier:v7];

  [v4 removeUserNotificationsOfType:78];
}

- (void)_updateAccountStateNotificationForNewAccount:(id)a3 oldAccount:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [v16 state];
  id v8 = [v6 state];

  id v9 = v16;
  if (v7 != v8)
  {
    id v10 = [v16 state];
    id v9 = v16;
    if ((unint64_t)v10 >= 2 && v10 != (id)5)
    {
      if (v10 == (id)4)
      {
        id v11 = objc_alloc(&OBJC_CLASS___PDPassAccountStateChangeUserNotification);
        int v12 = 0;
        uint64_t v13 = 0LL;
      }

      else
      {
        id v11 = objc_alloc(&OBJC_CLASS___PDPassAccountStateChangeUserNotification);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v16 accountIdentifier]);
        int v12 = 1;
      }

      id v14 = -[PDPassAccountStateChangeUserNotification initWithAccountIdentifier:accountState:accountStateReason:featureIdentifier:]( v11,  "initWithAccountIdentifier:accountState:accountStateReason:featureIdentifier:",  v13,  [v16 state],  objc_msgSend(v16, "stateReason"),  objc_msgSend(v16, "feature"));
      if (v12) {

      }
      -[PDUserNotification setReissueBannerOnUpdate:](v14, "setReissueBannerOnUpdate:", 1LL);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
      [v15 insertUserNotification:v14];

      id v9 = v16;
    }
  }
}

- (void)_updateAccountAPYMessageForNewAccount:(id)a3 oldAccount:(id)a4 blockNotifications:(BOOL)a5
{
  id v24 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a4 savingsDetails]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountSummary]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v24 savingsDetails]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accountSummary]);

  int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 apy]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 apy]);
  if ((objc_msgSend(v13, "pk_isNotANumber") & 1) == 0
    && (objc_msgSend(v12, "pk_isNotANumber") & 1) == 0)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 formattedAPY]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 formattedAPY]);
    id v16 = v14;
    id v17 = v15;
    if (v16 == v17)
    {
    }

    else
    {
      id v18 = v17;
      if (v16 && v17)
      {
        unsigned __int8 v19 = [v16 isEqualToString:v17];

        if ((v19 & 1) != 0) {
          goto LABEL_14;
        }
      }

      else
      {
      }

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v24 accountIdentifier]);
      char v21 = PKHasDisabledAPYUpdateNotificationsForAccountIdentifier();

      if ((v21 & 1) == 0 && !a5)
      {
        id v22 = -[PDAccountAPYUpdateUserNotification initWithAccount:]( objc_alloc(&OBJC_CLASS___PDAccountAPYUpdateUserNotification),  "initWithAccount:",  v24);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
        [v23 insertUserNotification:v22];
      }

      PKSavingsSetPreviousAPYForUpdateMessage(v12);
    }
  }

- (void)_updateAccountBalanceNotificationForNewAccount:(id)a3 oldAccount:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v17 savingsDetails]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accountSummary]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentBalance]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 savingsDetails]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accountSummary]);
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentBalance]);

  uint64_t v13 = (PDAccountOverdrawnBalanceUserNotification *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  if ([v12 compare:v13] == (id)-1) {
    goto LABEL_4;
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  id v15 = [v9 compare:v14];

  if (v15 == (id)-1LL)
  {
    uint64_t v13 = -[PDAccountOverdrawnBalanceUserNotification initWithAccount:]( objc_alloc(&OBJC_CLASS___PDAccountOverdrawnBalanceUserNotification),  "initWithAccount:",  v17);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
    [v16 insertUserNotification:v13];

LABEL_4:
  }
}

- (void)_updateCanShowFixRewardsMessageForNewAccount:(id)a3 oldAccount:(id)a4
{
  id v5 = a3;
  id v6 = [a4 state];
  id v7 = [v5 state];

  if (v6 != (id)1 && v7 == (id)1) {
    PKSavingsSetHasDismissedFixRewardsMessage(0LL);
  }
}

- (void)_updateFCCStepUpMessageForNewAccount:(id)a3 oldAccount:(id)a4
{
  id v12 = a3;
  int IsThresholdExceededActive = PKSavingsAccountIsThresholdExceededActive(a4);
  int v7 = PKSavingsAccountIsThresholdExceededActive(v12);
  if ((IsThresholdExceededActive & 1) == 0 && v7)
  {
    id v8 = -[PDAccountFCCStepUpThresholdExceededUserNotification initWithAccount:]( objc_alloc(&OBJC_CLASS___PDAccountFCCStepUpThresholdExceededUserNotification),  "initWithAccount:",  v12);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
    [v9 insertUserNotification:v8];
LABEL_6:

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
    [v11 updateWalletBadgeCount];

    goto LABEL_7;
  }

  if (((IsThresholdExceededActive ^ 1 | v7) & 1) == 0)
  {
    id v8 = (PDAccountFCCStepUpThresholdExceededUserNotification *)objc_claimAutoreleasedReturnValue([v12 accountIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PDAccountFCCStepUpThresholdExceededUserNotification notificationIdentifierForAccountIdentifier:]( &OBJC_CLASS___PDAccountFCCStepUpThresholdExceededUserNotification,  "notificationIdentifierForAccountIdentifier:",  v8));
    [v9 removeUserNotificationWithIdentifier:v10];

    goto LABEL_6;
  }

- (void)_updateBankVerificationExpirationDismissalsForFundingSources:(id)a3
{
  id v3 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fundingDetails]);
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___PKAccountPaymentFundingDetailsBankAccount, v10);
        char isKindOfClass = objc_opt_isKindOfClass(v9, v11);

        if ((isKindOfClass & 1) != 0)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 fundingDetails]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
          if (PKSavingsHasDismissedBankVerificationExpirationMessage())
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 verificationDetails]);
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pendingAttempt]);

            if (v16) {
              PKSetSavingsHasDismissedBankVerificationExpirationMessage(v14, 0LL);
            }
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v5);
  }
}

- (void)_scheduledAndDeliveredUserNotificationsOfType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10040C8E4;
  v9[3] = &unk_10064B6C0;
  id v10 = v6;
  unint64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 userNotificationsOfType:a3 completion:v9];
}

- (void)_scheduledAndDeliveredUserNotificationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountNotificationController userNotificationManager](self, "userNotificationManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10040CA40;
  v11[3] = &unk_10065EB28;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 userNotificationWithIdentifier:v9 completion:v11];
}

@end