@interface PDRuleManager
- (PDDiscoveryManager)discoveryManager;
- (PDRuleManager)init;
- (PDRuleManager)initWithDatabaseManager:(id)a3 accountManager:(id)a4 applyManager:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 paymentWebServiceCoordinator:(id)a7 transitNotificationService:(id)a8 familyCircleManager:(id)a9 expressPassManager:(id)a10;
- (id)evaluateUserProperty:(id)a3 withParameter:(id)a4 usingEnvironment:(id)a5;
- (void)deleteRuleWithIdentifier:(id)a3;
- (void)evaluateRulesWithIdentifiers:(id)a3 completion:(id)a4;
- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5;
- (void)getCurrentEnvironmentForKeys:(id)a3 withCompletion:(id)a4;
- (void)insertRule:(id)a3;
- (void)overrideValues:(id)a3 forUserProperties:(id)a4 withParameters:(id)a5;
- (void)rulesWithCompletion:(id)a3;
- (void)setDiscoveryManager:(id)a3;
- (void)updateWithRules:(id)a3;
@end

@implementation PDRuleManager

- (PDRuleManager)init
{
  return 0LL;
}

- (PDRuleManager)initWithDatabaseManager:(id)a3 accountManager:(id)a4 applyManager:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 paymentWebServiceCoordinator:(id)a7 transitNotificationService:(id)a8 familyCircleManager:(id)a9 expressPassManager:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___PDRuleManager;
  v18 = -[PDRuleManager init](&v28, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_databaseManager, a3);
    objc_storeStrong((id *)&v19->_accountManager, a4);
    objc_storeStrong((id *)&v19->_applyManager, a5);
    objc_storeStrong((id *)&v19->_peerPaymentWebServiceCoordinator, a6);
    objc_storeStrong((id *)&v19->_paymentWebServiceCoordinator, a7);
    objc_storeStrong((id *)&v19->_transitNotificationService, a8);
    objc_storeStrong((id *)&v19->_familyCircleManager, a9);
    objc_storeStrong((id *)&v19->_expressPassManager, a10);
    v19->_isUserPropertyOverrideEnabled = PKIsUserPropertyOverrideEnabled();
  }

  return v19;
}

- (void)updateWithRules:(id)a3
{
  id v3 = -[PDDatabaseManager updateRules:](self->_databaseManager, "updateRules:", a3);
}

- (void)evaluateRulesWithIdentifiers:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v35 = a4;
  uint64_t v57 = 0LL;
  v58 = &v57;
  uint64_t v59 = 0x3032000000LL;
  v60 = sub_1002F5884;
  v61 = sub_1002F5894;
  v62 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v38 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v39 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  oslog = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    sub_100442434((uint64_t)v70, (uint64_t)[v5 count], oslog);
  }

  v45 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager rulesWithIdentifiers:](self->_databaseManager, "rulesWithIdentifiers:", v5));
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_1002F589C;
  v55[3] = &unk_100655348;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v56 = v7;
  [v36 enumerateObjectsUsingBlock:v55];
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v51 objects:v69 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v52;
    uint64_t v41 = PKRulesErrorDomain;
    uint64_t v43 = PKAggDKeyDiscoveryRuleWithIdentifierValidationError;
    uint64_t v40 = PKAggDKeyDiscoveryRuleWithIdentifierInvalid;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v52 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v11));
        v13 = v12;
        if (!v12)
        {
          id v17 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  v41,  3LL,  0LL);
          if (v17) {
            goto LABEL_12;
          }
          goto LABEL_16;
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue([v12 predicate]);
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[PDUserEvaluationEnvironment availableKeysAndOperators]( &OBJC_CLASS___PDUserEvaluationEnvironment,  "availableKeysAndOperators"));
        id v50 = 0LL;
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[PDPredicateValidator validatePredicate:allowedKeysAndOperators:error:]( &OBJC_CLASS___PDPredicateValidator,  "validatePredicate:allowedKeysAndOperators:error:",  v14,  v15,  &v50));
        id v17 = (NSError *)v50;

        if (v17)
        {

LABEL_12:
          v19 = (objc_class *)objc_opt_class(self, v18);
          v20 = NSStringFromClass(v19);
          id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          -[NSMutableString appendFormat:]( v45,  "appendFormat:",  @"%@: Validating predicate failed for ruleIdentifier: %@ rule: %@ with error: %@\n",  v21,  v11,  v13,  v17,  v35);

          v67 = @"rule";
          uint64_t v68 = v11;
          id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL));
          PKAnalyticsSendEvent(v43, v22);

          [(id)v58[5] setObject:&__kCFBooleanFalse forKeyedSubscript:v11];
          goto LABEL_18;
        }

        if (([v16 isValid] & 1) == 0)
        {

LABEL_16:
          -[NSMutableString appendFormat:]( v45,  "appendFormat:",  @"%@: Invalid predicate for ruleIdentifier: %@ rule: %@\n",  objc_opt_class(self, v18),  v11,  v13);
          v65 = @"rule";
          uint64_t v66 = v11;
          id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v66,  &v65,  1LL));
          PKAnalyticsSendEvent(v40, v24);

          [(id)v58[5] setObject:&__kCFBooleanFalse forKeyedSubscript:v11];
          goto LABEL_17;
        }

        -[NSMutableSet addObject:](v38, "addObject:", v13);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v16 usedKeys]);
        -[NSMutableSet unionSet:](v39, "unionSet:", v23);

LABEL_17:
        id v17 = 0LL;
LABEL_18:
      }

      id v8 = [obj countByEnumeratingWithState:&v51 objects:v69 count:16];
    }

    while (v8);
  }

  if (-[NSMutableString length](v45, "length"))
  {
    id v25 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v45;
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }

  else
  {
    id v25 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      sub_100442400(oslog, v26, v27, v28, v29, v30, v31, v32);
      id v25 = oslog;
    }
  }

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1002F58EC;
  v46[3] = &unk_100655370;
  v46[4] = self;
  v49 = &v57;
  v33 = v38;
  v47 = v33;
  id v34 = v35;
  id v48 = v34;
  -[PDRuleManager getCurrentEnvironmentForKeys:withCompletion:]( self,  "getCurrentEnvironmentForKeys:withCompletion:",  v39,  v46);

  _Block_object_dispose(&v57, 8);
}

- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v8);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1002F5E14;
    v12[3] = &unk_100655398;
    v12[4] = self;
    id v15 = v10;
    id v13 = v8;
    id v14 = v9;
    -[PDRuleManager getCurrentEnvironmentForKeys:withCompletion:]( self,  "getCurrentEnvironmentForKeys:withCompletion:",  v11,  v12);
  }
}

- (id)evaluateUserProperty:(id)a3 withParameter:(id)a4 usingEnvironment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(35LL);
  v12 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(Object);
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v12))
    {
      int v36 = 138543362;
      id v37 = v8;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v14,  "discovery:evaluateUserProperty",  "%{public}@",  (uint8_t *)&v36,  0xCu);
    }
  }

  id v15 = objc_alloc_init(&OBJC_CLASS___NSArray);
  switch(PDUEEKeyFromString(v8))
  {
    case 1LL:
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v10 currentRegion]);
      goto LABEL_166;
    case 2LL:
      id v16 = [v10 isApplePayActive];
      goto LABEL_163;
    case 3LL:
      id v17 = [v10 defaultCreditAccountSetupFeatureState];
      goto LABEL_165;
    case 4LL:
      id v16 = [v10 hasDefaultCreditAccount];
      goto LABEL_163;
    case 5LL:
      id v17 = [v10 defaultCreditAccountState];
      goto LABEL_165;
    case 6LL:
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v10 defaultCreditAccountLifetimeRewards]);
      goto LABEL_166;
    case 7LL:
      id v16 = [v10 defaultCreditAccountHasPhysicalCard];
      goto LABEL_163;
    case 8LL:
      id v16 = [v10 defaultCreditAccountHasVirtualCard];
      goto LABEL_163;
    case 9LL:
      id v16 = [v10 defaultCreditAccountHasDynamicSecurityCode];
      goto LABEL_163;
    case 10LL:
      id v16 = [v10 defaultCreditAccountRequiresDebtCollectionNotices];
      goto LABEL_163;
    case 11LL:
      id v17 = [v10 defaultCreditAccountBalanceStatus];
      goto LABEL_165;
    case 12LL:
      id v17 = [v10 defaultCreditAccountCyclesPastDue];
      goto LABEL_165;
    case 13LL:
      id v16 = [v10 defaultCreditAccountInGrace];
      goto LABEL_163;
    case 14LL:
      id v16 = [v10 defaultCreditAccountInDisasterRecovery];
      goto LABEL_163;
    case 15LL:
      id v16 = [v10 defaultCreditAccountHasDisputeOpen];
      goto LABEL_163;
    case 16LL:
      id v17 = [v10 defaultCreditAccountDaysSinceDisputeOpened];
      goto LABEL_165;
    case 17LL:
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v10 defaultCreditAccountAvailableCredit]);
      goto LABEL_166;
    case 18LL:
      id v16 = [v10 defaultCreditAccountSupportsShowNotifications];
      goto LABEL_163;
    case 19LL:
      id v16 = [v10 defaultCreditAccountPassIsDefault];
      goto LABEL_163;
    case 20LL:
      id v17 = [v10 defaultCreditAccountDaysSinceLastTransaction];
      goto LABEL_165;
    case 21LL:
      id v16 = [v10 defaultCreditAccountHasInStoreTransaction];
      goto LABEL_163;
    case 22LL:
      id v16 = [v10 defaultCreditAccountHasInAppTransaction];
      goto LABEL_163;
    case 23LL:
      id v16 = [v10 defaultCreditAccountHasWebTransaction];
      goto LABEL_163;
    case 24LL:
      id v16 = [v10 defaultCreditAccountHasVirtualCardTransaction];
      goto LABEL_163;
    case 25LL:
      id v16 = [v10 defaultCreditAccountHasPhysicalCardTransaction];
      goto LABEL_163;
    case 26LL:
      id v17 = [v10 defaultCreditAccountDaysSinceCreatedDate];
      goto LABEL_165;
    case 27LL:
    case 28LL:
      id v16 = [v10 defaultCreditAccountHasActiveInstallment];
      goto LABEL_163;
    case 29LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 defaultCreditAccountSupportedDestinations]);
      goto LABEL_153;
    case 30LL:
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v10 defaultCreditAccountRewardsDestination]);
      goto LABEL_166;
    case 31LL:
      id v16 = [v10 defaultCreditAccountHasMerchantIdentifier:v9];
      goto LABEL_163;
    case 32LL:
      id v16 = [v10 defaultCreditAccountHasMerchantIdentifier30Days:v9];
      goto LABEL_163;
    case 33LL:
      id v16 = [v10 defaultCreditAccountHasMapsIdentifier:v9];
      goto LABEL_163;
    case 34LL:
      id v16 = [v10 defaultCreditAccountHasMapsIdentifierLast30Days:v9];
      goto LABEL_163;
    case 35LL:
      id v16 = [v10 defaultCreditAccountHasMapsBrandIdentifier:v9];
      goto LABEL_163;
    case 36LL:
      id v16 = [v10 defaultCreditAccountHasMapsBrandIdentifierLast30Days:v9];
      goto LABEL_163;
    case 37LL:
      id v17 = [v10 defaultCreditApplicationCount];
      goto LABEL_165;
    case 38LL:
      id v17 = [v10 currentDefaultCreditApplictionDaysSinceLastUpdated];
      goto LABEL_165;
    case 39LL:
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v10 currentDefaultCreditApplicationState]);
      goto LABEL_166;
    case 40LL:
      id v16 = [v10 defaultCreditAccountIsShared];
      goto LABEL_163;
    case 41LL:
      id v17 = [v10 defaultCreditAccountAccessLevel];
      goto LABEL_165;
    case 42LL:
      id v16 = [v10 defaultCreditAccountIsCoOwner];
      goto LABEL_163;
    case 43LL:
      id v17 = [v10 defaultCreditAccountParticipantUsersCount];
      goto LABEL_165;
    case 44LL:
      id v16 = [v10 defaultCreditAccountHasUnderageParticipant];
      goto LABEL_163;
    case 45LL:
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v10 defaultCreditAccountPhysicalAppleCardStatus]);
      goto LABEL_166;
    case 46LL:
      id v17 = [v10 daysSincePhysicalAppleCardShipmentUpdate];
      goto LABEL_165;
    case 47LL:
      id v16 = [v10 hasActivePromotionIdentifier:v9];
      goto LABEL_163;
    case 48LL:
      id v16 = [v10 hasActivePromotionIdentifierExpiringSoon:v9];
      goto LABEL_163;
    case 49LL:
      id v17 = [v10 defaultCreditAccountDaysUntilActivePromotionExpires:v9];
      goto LABEL_165;
    case 50LL:
      id v16 = [v10 defaultCreditAccountHasAutopaySetup];
      goto LABEL_163;
    case 51LL:
      id v16 = [v10 anyCreditAccountStateIsClosed];
      goto LABEL_163;
    case 52LL:
      id v16 = [v10 anyCreditAccountStateIsRemoved];
      goto LABEL_163;
    case 53LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 passStyles]);
      goto LABEL_153;
    case 54LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 unexpiredPassStyles]);
      goto LABEL_153;
    case 55LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 secureElementCardTypes]);
      goto LABEL_153;
    case 56LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 unexpiredSecureElementCardTypes]);
      goto LABEL_153;
    case 57LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 transitNetworksPresent]);
      goto LABEL_153;
    case 58LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 transitNetworksPresentAndUnexpired]);
      goto LABEL_153;
    case 59LL:
      id v16 = [v10 hasMerchantIdentifier:v9];
      goto LABEL_163;
    case 60LL:
      id v16 = [v10 hasMapsIdentifier:v9];
      goto LABEL_163;
    case 61LL:
      id v16 = [v10 hasMapsBrandIdentifier:v9];
      goto LABEL_163;
    case 62LL:
      id v16 = [v10 hasPaymentTransaction];
      goto LABEL_163;
    case 63LL:
      id v16 = [v10 hasTransitTransaction];
      goto LABEL_163;
    case 64LL:
      id v16 = [v10 hasPeerPaymentAccount];
      goto LABEL_163;
    case 65LL:
      id v16 = [v10 hasPeerPaymentPassProvisioned];
      goto LABEL_163;
    case 66LL:
      id v17 = [v10 peerPaymentAccountState];
      goto LABEL_165;
    case 67LL:
      id v17 = [v10 peerPaymentAccountStateReason];
      goto LABEL_165;
    case 68LL:
      id v17 = [v10 peerPaymentAccountStage];
      goto LABEL_165;
    case 69LL:
      id v16 = [v10 peerPaymentAccountHasTransaction];
      goto LABEL_163;
    case 70LL:
      id v16 = [v10 peerPaymentHasOnlinePurchaseTransaction];
      goto LABEL_163;
    case 71LL:
      id v16 = [v10 peerPaymentAccountHasContactlessTransaction];
      goto LABEL_163;
    case 72LL:
      id v17 = [v10 daysSinceLastPeerPaymentTransaction];
      goto LABEL_165;
    case 73LL:
    case 87LL:
      id v17 = [v10 peerPaymentDaysSinceLastP2PTransaction];
      goto LABEL_165;
    case 74LL:
      id v17 = [v10 peerPaymentDaysSinceLastP2PTransactionToAnyParticipant];
      goto LABEL_165;
    case 75LL:
      id v16 = [v10 peerPaymentAccountHasBalance];
      goto LABEL_163;
    case 76LL:
      id v17 = [v10 peerPaymentAccountBalanceBase];
      goto LABEL_165;
    case 77LL:
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v10 deviceLanguage]);
      goto LABEL_166;
    case 78LL:
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 peerPaymentAccountRole]));
      goto LABEL_166;
    case 79LL:
      id v17 = [v10 peerPaymentAccountDaysSinceCreatedDate];
      goto LABEL_165;
    case 80LL:
      id v17 = [v10 peerPaymentAccountDaysSinceIdentifiedDate];
      goto LABEL_165;
    case 81LL:
      id v17 = [v10 daysSinceParticipantPeerPaymentAccountIdentifiedDate];
      goto LABEL_165;
    case 82LL:
      id v16 = [v10 peerPaymentAccountHasSentMoneyToAnyParticipant];
      goto LABEL_163;
    case 83LL:
      id v16 = [v10 peerPaymentHasP2PTransaction];
      goto LABEL_163;
    case 84LL:
      id v16 = [v10 peerPaymentHasAutoReloadEnabled];
      goto LABEL_163;
    case 85LL:
      id v16 = [v10 peerPaymentHasSetupRecurringP2PPayment];
      goto LABEL_163;
    case 86LL:
      id v16 = [v10 peerPaymentHasSetupRecurringP2PPaymentForAnyParticipant];
      goto LABEL_163;
    case 88LL:
      id v16 = [v10 peerPaymentHasSentP2PPayment];
      goto LABEL_163;
    case 89LL:
      id v16 = [v10 peerPaymentHasReceivedP2PPayment];
      goto LABEL_163;
    case 90LL:
      id v16 = [v10 peerPaymentHasSentDeviceTapTransaction];
      goto LABEL_163;
    case 91LL:
      id v16 = [v10 peerPaymentHasReceivedDeviceTapTransactions];
      goto LABEL_163;
    case 92LL:
      id v17 = [v10 peerPaymentNumberOfDeviceTapTransactions];
      goto LABEL_165;
    case 93LL:
      id v17 = [v10 daysSinceLastDeviceTapSendTransaction];
      goto LABEL_165;
    case 94LL:
      id v17 = [v10 peerPaymentFamilyParticipantAccounts];
      goto LABEL_165;
    case 95LL:
      id v16 = [v10 familyCircleFamilyOrganizer];
      goto LABEL_163;
    case 96LL:
      id v16 = [v10 familyCircleParent];
      goto LABEL_163;
    case 97LL:
      id v16 = [v10 familyCircleHasFamily];
      goto LABEL_163;
    case 98LL:
      id v17 = [v10 familyCircleCurrentUserAge];
      goto LABEL_165;
    case 99LL:
      id v17 = [v10 familyCircleMembersUnderAge];
      goto LABEL_165;
    case 100LL:
      id v17 = [v10 familyCircleMembersCount];
      goto LABEL_165;
    case 101LL:
      id v17 = [v10 familyCircleDaysSinceNewestJoinedDate];
      goto LABEL_165;
    case 102LL:
      id v17 = [v10 familyCircleMinimumMemberAge];
      goto LABEL_165;
    case 103LL:
      id v17 = [v10 familyCircleAgeCategory];
      goto LABEL_165;
    case 104LL:
      id v16 = [v10 isApplePaySetupAvailable];
      goto LABEL_163;
    case 105LL:
      id v16 = [v10 isPrimaryAppleAccountVerified];
      goto LABEL_163;
    case 106LL:
      id v16 = [v10 isDeviceRegisteredWithBroker];
      goto LABEL_163;
    case 107LL:
      id v16 = [v10 hasPaymentCard];
      goto LABEL_163;
    case 108LL:
      id v16 = [v10 hasDebitCard];
      goto LABEL_163;
    case 109LL:
      id v16 = [v10 hasApplePayTransaction];
      goto LABEL_163;
    case 110LL:
      id v17 = [v10 daysSinceLastTransaction];
      goto LABEL_165;
    case 111LL:
      id v17 = [v10 daysSinceOldestPaymentPassIngestDate];
      goto LABEL_165;
    case 112LL:
      id v17 = [v10 daysSinceOldestCreditCardIngestDate];
      goto LABEL_165;
    case 113LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 discoveryItemsWithActiveStatus]);
      goto LABEL_153;
    case 114LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 discoveryItemsWithActionedStatus]);
      goto LABEL_153;
    case 115LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 discoveryItemsWithDismissedStatus]);
      goto LABEL_153;
    case 116LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 discoveryItemsWithWaitingForTriggerStatus]);
      goto LABEL_153;
    case 117LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 discoveryItemsExpanded]);
      goto LABEL_153;
    case 118LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 discoveryItemsDismissed]);
      goto LABEL_153;
    case 119LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 discoveryCTAsTapped]);
      goto LABEL_153;
    case 120LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 discoveryCTAsCompleted]);
      goto LABEL_153;
    case 121LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 sentTransitDCINotifications]);
      goto LABEL_153;
    case 122LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 sentTransitOpenLoopUpgradeNotifications]);
      goto LABEL_153;
    case 123LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 sentTransitOpenLoopRenotifiedInMarketNotifications]);
      goto LABEL_153;
    case 124LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 cardTypesWithExpressEnabled]);
      goto LABEL_153;
    case 125LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 supportedMarketsForCurrentLocation]);
      goto LABEL_153;
    case 126LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 supportedTransitMarketsForCurrentLocation]);
      goto LABEL_153;
    case 127LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 supportedTransitNetworksForCurrentLocation]);
      goto LABEL_153;
    case 128LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 expressTransitNetworksForCurrentLocation]);
      goto LABEL_153;
    case 129LL:
      id v16 = [v10 hasTransitPassForCurrentLocation];
      goto LABEL_163;
    case 130LL:
      id v16 = [v10 hasUnexpiredTransitPassForCurrentLocation];
      goto LABEL_163;
    case 131LL:
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v10 currentPlacemark]);
      id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 ISOcountryCode]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v23,  @"ISOcountryCode");

      id v24 = (void *)objc_claimAutoreleasedReturnValue([v21 postalCode]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v24, @"postalCode");

      id v25 = (void *)objc_claimAutoreleasedReturnValue([v21 administrativeArea]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v25,  @"administrativeArea");

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v21 subAdministrativeArea]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v26,  @"subAdministrativeArea");

      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v21 locality]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v27, @"locality");

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v21 subLocality]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v28,  @"subLocality");

      id v29 = -[NSMutableDictionary copy](v22, "copy");
      goto LABEL_157;
    case 132LL:
      id v16 = [v10 hasPayLaterAccount];
      goto LABEL_163;
    case 133LL:
      id v16 = [v10 isPayLaterHidden];
      goto LABEL_163;
    case 134LL:
      id v16 = [v10 hasEverProvisionedPayLaterPass];
      goto LABEL_163;
    case 135LL:
      id v16 = [v10 hasPayLaterPass];
      goto LABEL_163;
    case 136LL:
      id v17 = [v10 payLaterNumberOfLoans];
      goto LABEL_165;
    case 137LL:
      id v17 = [v10 payLaterDaysSinceFirstActiveLoan];
      goto LABEL_165;
    case 138LL:
      id v17 = [v10 payLaterNumberOfActiveLoans];
      goto LABEL_165;
    case 139LL:
      id v17 = [v10 payLaterNumberOfPendingLoans];
      goto LABEL_165;
    case 140LL:
      id v17 = [v10 payLaterNumberOfDelinquentLoans];
      goto LABEL_165;
    case 141LL:
      id v17 = [v10 payLaterNumberOfCanceledLoans];
      goto LABEL_165;
    case 142LL:
      id v17 = [v10 payLaterNumberOfCompleteLoans];
      goto LABEL_165;
    case 143LL:
      id v16 = [v10 hasSavingsAccount];
      goto LABEL_163;
    case 144LL:
      id v17 = [v10 savingsAccountDaysSinceCreatedDate];
      goto LABEL_165;
    case 145LL:
      id v16 = [v10 savingsAccountHasExternalTransferIn];
      goto LABEL_163;
    case 146LL:
      id v16 = [v10 savingsAccountHasExternalTransferOut];
      goto LABEL_163;
    case 147LL:
      id v16 = [v10 savingsAccountHasCashTransferIn];
      goto LABEL_163;
    case 148LL:
      id v17 = [v10 savingsAccountBinnedBalance];
      goto LABEL_165;
    case 149LL:
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 enrolledAuthenticationMechanisms]);
LABEL_153:
      id v21 = v20;
      uint64_t v30 = objc_claimAutoreleasedReturnValue([v20 allObjects]);
      id v22 = (NSMutableDictionary *)v30;
      if (v30) {
        uint64_t v31 = (void *)v30;
      }
      else {
        uint64_t v31 = v15;
      }
      id v29 = v31;
LABEL_157:
      uint64_t v18 = v29;

      break;
    case 150LL:
      id v16 = [v10 hasIssuerInstallmentCard];
      goto LABEL_163;
    case 151LL:
      id v16 = [v10 hasEverMadeIssuerInstallmentTransaction];
      goto LABEL_163;
    case 152LL:
      id v16 = [v10 hasPayWithRewardsCard];
      goto LABEL_163;
    case 153LL:
      id v16 = [v10 hasEverMadePayWithRewardsTransaction];
      goto LABEL_163;
    case 154LL:
      id v16 = [v10 hasAppleAccountCardProvisioned];
LABEL_163:
      uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v16));
      goto LABEL_166;
    case 155LL:
      id v17 = [v10 daysSinceAppleAccountInStoreTopUp];
LABEL_165:
      uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v17));
LABEL_166:
      uint64_t v18 = (void *)v19;
      break;
    default:
      uint64_t v18 = 0LL;
      break;
  }

  uint64_t v32 = v12;
  os_signpost_id_t v33 = os_signpost_id_make_with_pointer(v32, self);
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v34 = v33;
    if (os_signpost_enabled(v32))
    {
      LOWORD(v36) = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v32,  OS_SIGNPOST_INTERVAL_END,  v34,  "discovery:evaluateUserProperty",  "",  (uint8_t *)&v36,  2u);
    }
  }

  return v18;
}

- (void)getCurrentEnvironmentForKeys:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(35LL);
  id v9 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(Object);
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "discovery:preflightEnvironment",  "",  buf,  2u);
    }
  }

  *(void *)buf = 0LL;
  uint64_t v18 = buf;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_1002F5884;
  id v21 = sub_1002F5894;
  id v22 = -[PDUserEvaluationEnvironment initWithAccountManager:applyManager:databaseManager:peerPaymentWebServiceCoordinator:paymentWebServiceCoordinator:transitNotificationService:familyCircleManager:expressPassManager:discoveryManager:]( objc_alloc(&OBJC_CLASS___PDUserEvaluationEnvironment),  "initWithAccountManager:applyManager:databaseManager:peerPaymentWebServiceCoordinator:paymentWebServiceCoordina tor:transitNotificationService:familyCircleManager:expressPassManager:discoveryManager:",  self->_accountManager,  self->_applyManager,  self->_databaseManager,  self->_peerPaymentWebServiceCoordinator,  self->_paymentWebServiceCoordinator,  self->_transitNotificationService,  self->_familyCircleManager,  self->_expressPassManager,  self->_discoveryManager);
  v12 = (void *)*((void *)v18 + 5);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002F7194;
  v14[3] = &unk_1006553C0;
  v14[4] = self;
  id v13 = v7;
  id v15 = v13;
  id v16 = buf;
  [v12 preflightForKeys:v6 completion:v14];

  _Block_object_dispose(buf, 8);
}

- (void)overrideValues:(id)a3 forUserProperties:(id)a4 withParameters:(id)a5
{
  id v37 = a3;
  id v7 = a4;
  id v36 = a5;
  id v42 = 0LL;
  uint64_t v8 = PKDiscoveryDirectoryPath();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:@"Test"]);

  os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:@"engagement"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingPathExtension:@"json"]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v12));
  if (v13)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v13,  0LL,  &v42));
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary, v15);
    if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
    {
      id v14 = v14;
      id v17 = v14;
    }

    else
    {
      NSErrorUserInfoKey v45 = NSUnderlyingErrorKey;
      *(void *)buf = @"dictionary required";
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  &v45,  1LL));
      id v42 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  1LL,  v18));

      id v17 = 0LL;
    }
  }

  else
  {
    NSErrorUserInfoKey v45 = NSUnderlyingErrorKey;
    *(void *)buf = v12;
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  &v45,  1LL));
    id v17 = 0LL;
    id v42 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  1LL,  v14));
  }

  id v19 = v42;
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v22)
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "user property overrides found: %{public}@",  buf,  0xCu);
    }

    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v21 = (os_log_s *)v7;
    id v23 = -[os_log_s countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v38,  v43,  16LL);
    if (v23)
    {
      id v24 = v23;
      id v34 = v19;
      id v35 = v7;
      uint64_t v25 = *(void *)v39;
      uint64_t v26 = v36;
      do
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v21);
          }
          uint64_t v28 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)i);
          id v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v28, v34, v35));
          if (v29)
          {
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v28]);
            if (v31 && (uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSArray, v30), (objc_opt_isKindOfClass(v29, v32) & 1) != 0))
            {
              os_signpost_id_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v29 containsObject:v31]));
              [v37 setObject:v33 forKeyedSubscript:v28];

              uint64_t v26 = v36;
            }

            else
            {
              [v37 setObject:v29 forKeyedSubscript:v28];
            }
          }
        }

        id v24 = -[os_log_s countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v38,  v43,  16LL);
      }

      while (v24);
      id v19 = v34;
      id v7 = v35;
    }
  }

  else if (v22)
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "couldn't read test properties: %{public}@",  buf,  0xCu);
  }
}

- (void)rulesWithCompletion:(id)a3
{
  databaseManager = self->_databaseManager;
  v4 = (void (**)(id, id))a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager rules](databaseManager, "rules"));
  v4[2](v4, v5);
}

- (void)insertRule:(id)a3
{
  id v3 = -[PDDatabaseManager insertOrUpdateRule:](self->_databaseManager, "insertOrUpdateRule:", a3);
}

- (void)deleteRuleWithIdentifier:(id)a3
{
}

- (PDDiscoveryManager)discoveryManager
{
  return self->_discoveryManager;
}

- (void)setDiscoveryManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end