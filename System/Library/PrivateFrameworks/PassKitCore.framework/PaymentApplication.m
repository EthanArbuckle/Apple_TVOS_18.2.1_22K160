@interface PaymentApplication
+ (id)_paymentApplicationForPass:(id)a3 applicationIdentifier:(id)a4 secureElementIdentifier:(id)a5 inDatabase:(id)a6;
+ (id)_paymentApplicationsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_paymentApplicationsInDatabase:(id)a3 matchingPredicate:(id)a4 withJoinKeys:(id)a5;
+ (id)_predicateForApplicationIdentifier:(id)a3 secureElementIdentifier:(id)a4;
+ (id)_predicateForApplicationIdentifier:(id)a3 secureElementIdentifiers:(id)a4;
+ (id)_predicateForApplicationIdentifier:(id)a3 subcredentialIdentifier:(id)a4 secureElementIdentifiers:(id)a5;
+ (id)_predicateForPass:(id)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForPassUniqueIdentifier:(id)a3 applicationIdentifier:(id)a4 secureElementIdentifier:(id)a5;
+ (id)_predicateForPersistentID:(int64_t)a3;
+ (id)_propertySettersForPaymentApplication;
+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifier:(id)a5;
+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifiers:(id)a5;
+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 subcredentialIdentifier:(id)a5 secureElementIdentifiers:(id)a6;
+ (id)anyInDatabase:(id)a3 withPassUniqueIdentifier:(id)a4 secureElementIdentifier:(id)a5 paymentApplicationIdentifier:(id)a6;
+ (id)anyInDatabase:(id)a3 withPersistentID:(unint64_t)a4;
+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(unint64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)paymentApplicationsInDatabase:(id)a3;
+ (id)paymentApplicationsInDatabase:(id)a3 forNotificationService:(id)a4;
+ (id)paymentApplicationsInDatabase:(id)a3 forPass:(id)a4;
+ (id)paymentApplicationsInDatabase:(id)a3 forPassPID:(unint64_t)a4;
+ (id)paymentApplicationsInDatabase:(id)a3 forPassUniqueIdentifier:(id)a4 secureElementIdentifiers:(id)a5;
+ (id)paymentApplicationsInDatabase:(id)a3 forSecureElementIdentifier:(id)a4;
+ (id)paymentApplicationsInDatabase:(id)a3 forSecureElementIdentifiers:(id)a4;
+ (id)paymentApplicationsInDatabase:(id)a3 forTransitAppletStatesDirty:(id)a4;
+ (id)paymentApplicationsInDatabaseWithActiveVPAN:(id)a3;
+ (id)predicateForDPANIdentifier:(id)a3;
+ (id)predicateForHasMerchantTokens:(BOOL)a3;
+ (id)predicateForHasVPANID:(BOOL)a3;
+ (id)predicateForNetworks:(id)a3;
+ (id)predicateForNotificationService:(id)a3;
+ (id)predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)predicateForPaymentMethodTypes:(id)a3;
+ (id)predicateForPrimaryPaymentApplication:(BOOL)a3;
+ (id)predicateForSecureElementIdentifier:(id)a3;
+ (id)predicateForSecureElementIdentifiers:(id)a3;
+ (id)predicateForState:(int64_t)a3;
+ (id)predicateForStates:(id)a3;
+ (id)predicateForSupportBarcodePayment:(BOOL)a3;
+ (id)predicateForSupportsInAppPayment:(BOOL)a3;
+ (id)predicateForSupportsMerchantTokens:(BOOL)a3;
+ (id)predicateForTransactionSourceWithPID:(unint64_t)a3;
+ (id)predicateForVPANID:(id)a3 primaryOnly:(BOOL)a4;
+ (id)primaryPaymentApplicationsInDatabase:(id)a3 forSecureElementIdentifiers:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)updatePaymentApplications:(id)a3 forPass:(id)a4 inDatabase:(id)a5;
+ (void)updatePaymentApplications:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PaymentApplication)initWithPaymentApplication:(id)a3 pass:(id)a4 inDatabase:(id)a5;
- (id)applicationIdentifier;
- (id)paymentApplication;
- (id)transactionSourceIdentifier;
- (int64_t)passPID;
- (int64_t)paymentNetworkIdentifier;
- (void)_updateExpressModes:(id)a3;
- (void)updateAutomaticSelectionCriteria:(id)a3;
- (void)updateTransitNetworkIdentifiers:(id)a3;
- (void)updateWithPaymentApplication:(id)a3;
@end

@implementation PaymentApplication

- (PaymentApplication)initWithPaymentApplication:(id)a3 pass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 inAppPINRequiredAmount]);
  uint64_t v13 = PKCurrencyDecimalToStorageNumber(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationIdentifier]);
  [v11 setObjectOrNull:v15 forKey:@"aid"];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 secureElementIdentifier]);
  [v11 setObjectOrNull:v16 forKey:@"seid"];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v10 dpanIdentifier]);
  [v11 setObjectOrNull:v17 forKey:@"dpan_id"];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v10 dpanSuffix]);
  [v11 setObjectOrNull:v18 forKey:@"dpan_suffix"];

  v19 = (void *)objc_claimAutoreleasedReturnValue([v10 sanitizedDPAN]);
  [v11 setObjectOrNull:v19 forKey:@"sanitized_dpan"];

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 state]));
  [v11 setObjectOrNull:v20 forKey:@"state"];

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 supportsContactlessPayment]));
  [v11 setObjectOrNull:v21 forKey:@"supports_contactless_payment"];

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 supportsInAppPayment]));
  [v11 setObjectOrNull:v22 forKey:@"supports_in_app_payment"];

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 supportsMerchantTokens]));
  [v11 setObjectOrNull:v23 forKey:@"c"];

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 hasMerchantTokens]));
  [v11 setObjectOrNull:v24 forKey:@"f"];

  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 hadMerchantTokens]));
  [v11 setObjectOrNull:v25 forKey:@"m"];

  v26 = (void *)objc_claimAutoreleasedReturnValue([v10 apanIdentifier]);
  [v11 setObjectOrNull:v26 forKey:@"d"];

  v27 = (void *)objc_claimAutoreleasedReturnValue([v10 apanSuffix]);
  [v11 setObjectOrNull:v27 forKey:@"e"];

  v28 = (void *)objc_claimAutoreleasedReturnValue([v10 supportsMultiTokens]);
  [v11 setObjectOrNull:v28 forKey:@"h"];

  v29 = (void *)objc_claimAutoreleasedReturnValue([v10 virtualCardIdentifier]);
  [v11 setObjectOrNull:v29 forKey:@"i"];

  v30 = (void *)objc_claimAutoreleasedReturnValue([v10 virtualCardSuffix]);
  [v11 setObjectOrNull:v30 forKey:@"l"];

  v31 = (void *)objc_claimAutoreleasedReturnValue([v10 supportsVirtualCardNumber]);
  [v11 setObjectOrNull:v31 forKey:@"j"];

  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 virtualCardVPANOrigin]));
  [v11 setObjectOrNull:v32 forKey:@"n"];

  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 supportsBarcodePayment]));
  [v11 setObjectOrNull:v33 forKey:@"b"];

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 supportsServiceMode]));
  [v11 setObjectOrNull:v34 forKey:@"supports_service_mode"];

  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 supportsOptionalAuthentication]));
  [v11 setObject:v35 forKey:@"supports_optional_authentication"];

  v36 = (void *)objc_claimAutoreleasedReturnValue([v10 appletDataFormat]);
  [v11 setObjectOrNull:v36 forKey:@"applet_data_format"];

  v37 = (void *)objc_claimAutoreleasedReturnValue([v10 appletCurrencyCode]);
  [v11 setObjectOrNull:v37 forKey:@"applet_currency_code"];

  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 requiresDeferredAuthorization]));
  [v11 setObjectOrNull:v38 forKey:@"requires_deferred_authorization"];

  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 paymentNetworkIdentifier]));
  [v11 setObjectOrNull:v39 forKey:@"payment_network_identifier"];

  [v11 setObjectOrNull:v14 forKey:@"in_app_pin_required_amount"];
  v40 = (void *)objc_claimAutoreleasedReturnValue([v10 inAppPINRequiredCurrency]);
  [v11 setObjectOrNull:v40 forKey:@"in_app_pin_required_currency"];

  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 paymentType]));
  [v11 setObjectOrNull:v41 forKey:@"payment_type"];

  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 auxiliaryPaymentType]));
  [v11 setObjectOrNull:v42 forKey:@"auxiliary_payment_type"];

  v43 = (void *)objc_claimAutoreleasedReturnValue([v10 displayName]);
  [v11 setObjectOrNull:v43 forKey:@"display_name"];

  v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 isAuxiliary]));
  [v11 setObjectOrNull:v44 forKey:@"auxiliary_application"];

  v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 contactlessPriority]));
  [v11 setObjectOrNull:v45 forKey:@"contactless_priority"];

  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 inAppPriority]));
  [v11 setObjectOrNull:v46 forKey:@"in_app_priority"];

  v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 supportsInstantFundsIn]));
  [v11 setObjectOrNull:v47 forKey:@"supports_instant_funds_in"];

  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 fundingSourcePaymentType]));
  [v11 setObjectOrNull:v48 forKey:@"funding_source_payment_type"];

  v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 requiresConsentForDataRelease]));
  [v11 setObjectOrNull:v49 forKey:@"g"];

  id v50 = [v9 persistentID];
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v50));
  [v11 setObject:v51 forKey:@"pass_pid"];

  id v52 = [v10 isShareable];
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v52));
  [v11 setObject:v53 forKey:@"k"];

  v54 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);
  return v54;
}

- (int64_t)paymentNetworkIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"payment_network_identifier"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (int64_t)passPID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"pass_pid"));
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (id)transactionSourceIdentifier
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"transaction_source_pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransactionSource anyInDatabase:withPersistentID:]( TransactionSource,  "anyInDatabase:withPersistentID:",  v3,  [v4 longLongValue]));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  return v6;
}

- (id)applicationIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"aid");
}

+ (id)databaseTable
{
  return @"payment_application";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) == a3) {
    return @"pass_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___TransactionSource, v4) == a3) {
    return @"transaction_source_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___PaymentApplicationMerchantSupport, v5) == a3) {
    return @"pid";
  }
  return 0LL;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v15 = @"pass.unique_id";
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  v14 = @"transaction_source.identifier";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  uint64_t v13 = @"notification_service.pid";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  if ([v9 containsObject:v5])
  {
    [v6 addObject:@"JOIN pass ON pass.pid = payment_application.pass_pid"];
    [v6 addObject:@"JOIN pass_notification_service ON (pass_notification_service.pid = pass.pass_transaction_service_pid OR pass_notification_service.pid = pass.pass_message_service_pid)"];
    [v6 addObject:@"JOIN notification_service ON notification_service.pid = pass_notification_service.notification_service_pid"];
  }

  if ([v8 containsObject:v5]) {
    [v6 addObject:@"JOIN transaction_source ON transaction_source.pid = payment_application.transaction_source_pid"];
  }
  id v10 = (__CFString *)v5;
  v11 = v10;
  if (v10 == @"whitney.b"
    || v10
    && (unsigned int v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", @"whitney.b"),
        v11,
        v12))
  {
    [v6 addObject:@"JOIN whitney ON whitney.a = payment_application.pid"];
  }
}

+ (id)anyInDatabase:(id)a3 withPersistentID:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPersistentID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForTransactionSourceWithPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationIdentifier:a4 secureElementIdentifier:a5]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  return v10;
}

+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationIdentifier:a4 secureElementIdentifiers:a5]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  return v10;
}

+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 subcredentialIdentifier:(id)a5 secureElementIdentifiers:(id)a6
{
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue( [a1 _predicateForApplicationIdentifier:a4 subcredentialIdentifier:a5 secureElementIdentifiers:a6]);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v11]);

  return v12;
}

+ (id)anyInDatabase:(id)a3 withPassUniqueIdentifier:(id)a4 secureElementIdentifier:(id)a5 paymentApplicationIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v15 = (void *)objc_claimAutoreleasedReturnValue( [a1 _predicateForPassUniqueIdentifier:v13 applicationIdentifier:v11 secureElementIdentifier:v12]);

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentApplication,  "queryWithDatabase:predicate:",  v10,  v15));
  v26 = @"pass.unique_id";
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10026B520;
  v22[3] = &unk_100639BF0;
  v24 = v14;
  id v25 = a1;
  id v23 = v10;
  v18 = v14;
  id v19 = v10;
  [v16 enumeratePersistentIDsAndProperties:v17 usingBlock:v22];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](v18, "anyObject"));
  return v20;
}

+ (id)paymentApplicationsInDatabase:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPass:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentApplicationsInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (id)paymentApplicationsInDatabase:(id)a3 forPassPID:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentApplicationsInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (id)paymentApplicationsInDatabase:(id)a3 forSecureElementIdentifiers:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForSecureElementIdentifiers:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentApplicationsInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (id)paymentApplicationsInDatabase:(id)a3 forSecureElementIdentifier:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForSecureElementIdentifier:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentApplicationsInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (id)primaryPaymentApplicationsInDatabase:(id)a3 forSecureElementIdentifiers:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentApplication predicateForSecureElementIdentifiers:]( &OBJC_CLASS___PaymentApplication,  "predicateForSecureElementIdentifiers:",  a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentApplication predicateForPrimaryPaymentApplication:]( &OBJC_CLASS___PaymentApplication,  "predicateForPrimaryPaymentApplication:",  1LL));
  v13[0] = v7;
  v13[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentApplicationsInDatabase:v6 matchingPredicate:v10]);

  return v11;
}

+ (id)paymentApplicationsInDatabase:(id)a3 forPassUniqueIdentifier:(id)a4 secureElementIdentifiers:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForPassWithUniqueIdentifier:a4]);
  v18[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForSecureElementIdentifiers:v8]);

  v18[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));
  v17 = @"pass.unique_id";
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentApplicationsInDatabase:v9 matchingPredicate:v13 withJoinKeys:v14]);

  return v15;
}

+ (id)paymentApplicationsInDatabase:(id)a3 forTransitAppletStatesDirty:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v22 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 passUniqueIdentifier]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v13 applicationIdentifier]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v13 secureElementIdentifier]);
        v17 = (void *)objc_claimAutoreleasedReturnValue( [a1 _predicateForPassUniqueIdentifier:v14 applicationIdentifier:v15 secureElementIdentifier:v16]);

        -[NSMutableArray addObject:](v7, "addObject:", v17);
      }

      id v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v10);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v7));
  v28 = @"pass.unique_id";
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  v20 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentApplicationsInDatabase:v23 matchingPredicate:v18 withJoinKeys:v19]);

  return v20;
}

+ (id)paymentApplicationsInDatabase:(id)a3 forNotificationService:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForNotificationService:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentApplicationsInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (id)paymentApplicationsInDatabase:(id)a3
{
  return [a1 _paymentApplicationsInDatabase:a3 matchingPredicate:0];
}

+ (id)_paymentApplicationsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  return [a1 _paymentApplicationsInDatabase:a3 matchingPredicate:a4 withJoinKeys:0];
}

+ (id)_paymentApplicationsInDatabase:(id)a3 matchingPredicate:(id)a4 withJoinKeys:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentApplication]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
  id v14 = [v13 mutableCopy];

  if (v10)
  {
    v28 = v11;
    id v29 = v9;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v15 = v10;
    id v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        }

        id v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }

      while (v17);
    }

    uint64_t v11 = v28;
    id v9 = v29;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentApplication,  "queryWithDatabase:predicate:",  v8,  v9,  v28,  v29));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10026BE2C;
  v30[3] = &unk_100638F18;
  id v34 = a1;
  id v31 = v12;
  id v32 = v8;
  v22 = v11;
  v33 = v22;
  id v23 = v8;
  id v24 = v12;
  [v21 enumeratePersistentIDsAndProperties:v14 usingBlock:v30];
  __int128 v25 = v33;
  __int128 v26 = v22;

  return v26;
}

+ (void)updatePaymentApplications:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = v6;
  id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 secureElementIdentifier]);
        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 applicationIdentifier]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationIdentifier:v14 secureElementIdentifier:v13]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v7 predicate:v15]);
          id v17 = v16;
          if (v16) {
            [v16 updateWithPaymentApplication:v12];
          }
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v9);
  }
}

+ (void)updatePaymentApplications:(id)a3 forPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10026C2FC;
  v12[3] = &unk_10063FDF8;
  id v13 = a4;
  id v14 = a5;
  id v15 = v8;
  id v16 = a1;
  id v9 = v8;
  id v10 = v14;
  id v11 = v13;
  sub_1002CCC5C((uint64_t)v10, v12);
}

+ (id)_paymentApplicationForPass:(id)a3 applicationIdentifier:(id)a4 secureElementIdentifier:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPass:a3]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationIdentifier:v12 secureElementIdentifier:v11]);

  v19[0] = v13;
  v19[1] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));

  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v16]);
  return v17;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPass:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PaymentExpressMode deleteEntitiesInDatabase:forPaymentApplication:]( &OBJC_CLASS___PaymentExpressMode,  "deleteEntitiesInDatabase:forPaymentApplication:",  v3,  v2);
  +[PaymentAutomaticSelectionCriterion deleteEntitiesInDatabase:forPaymentApplication:]( &OBJC_CLASS___PaymentAutomaticSelectionCriterion,  "deleteEntitiesInDatabase:forPaymentApplication:",  v3,  v2);
  +[PaymentTransitNetworkIdentifier deleteEntitiesInDatabase:forPaymentApplication:]( &OBJC_CLASS___PaymentTransitNetworkIdentifier,  "deleteEntitiesInDatabase:forPaymentApplication:",  v3,  v2);
  +[AppletSubcredential deleteEntitiesInDatabase:forPaymentApplication:]( &OBJC_CLASS___AppletSubcredential,  "deleteEntitiesInDatabase:forPaymentApplication:",  v3,  v2);
  +[FelicaTransitAppletState deleteEntitiesForPaymentApplicationPID:inDatabase:]( &OBJC_CLASS___FelicaTransitAppletState,  "deleteEntitiesForPaymentApplicationPID:inDatabase:",  -[SQLiteEntity persistentID](v2, "persistentID"),  v3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[TransactionSource deleteEntitiesInDatabase:forPaymentApplication:]( &OBJC_CLASS___TransactionSource,  "deleteEntitiesInDatabase:forPaymentApplication:",  v4,  v2);

  +[PaymentApplicationMerchantSupport deleteEntitiesForPaymentApplication:inDatabase:]( &OBJC_CLASS___PaymentApplicationMerchantSupport,  "deleteEntitiesForPaymentApplication:inDatabase:",  v2,  v3);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___PaymentApplication;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");

  return (char)v2;
}

+ (id)predicateForDPANIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"dpan_id",  a3);
}

+ (id)predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

+ (id)predicateForTransactionSourceWithPID:(unint64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"transaction_source_pid",  v3));

  return v4;
}

+ (id)predicateForSecureElementIdentifiers:(id)a3
{
  return +[SQLiteCompoundPredicate predicateWithProperty:equalToValues:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateWithProperty:equalToValues:",  @"seid",  a3);
}

+ (id)predicateForSecureElementIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"seid",  a3);
}

+ (id)predicateForNotificationService:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"notification_service.pid",  v3));

  return v4;
}

+ (id)predicateForPrimaryPaymentApplication:(BOOL)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", !a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"auxiliary_application",  v3));

  return v4;
}

+ (id)predicateForState:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"state",  v3));

  return v4;
}

+ (id)predicateForStates:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentApplication predicateForState:]( PaymentApplication,  "predicateForState:",  objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "integerValue", (void)v13)));
        [v4 addObject:v10];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v4));
  return v11;
}

+ (id)predicateForSupportsInAppPayment:(BOOL)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"supports_in_app_payment",  v3));

  return v4;
}

+ (id)predicateForSupportsMerchantTokens:(BOOL)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"c",  v3));

  return v4;
}

+ (id)predicateForHasMerchantTokens:(BOOL)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"f",  v3));

  return v4;
}

+ (id)paymentApplicationsInDatabaseWithActiveVPAN:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentApplication predicateForHasVPANID:]( &OBJC_CLASS___PaymentApplication,  "predicateForHasVPANID:",  1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentApplicationsInDatabase:v4 matchingPredicate:v5]);

  return v6;
}

+ (id)predicateForVPANID:(id)a3 primaryOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"i",  a3));
  id v6 = v5;
  if (v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentApplication predicateForPrimaryPaymentApplication:]( &OBJC_CLASS___PaymentApplication,  "predicateForPrimaryPaymentApplication:",  1LL));
    v11[0] = v6;
    v11[1] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));
  }

  else
  {
    id v9 = v5;
  }

  return v9;
}

+ (id)predicateForHasVPANID:(BOOL)a3
{
  if (a3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"i"));
  }
  else {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"i"));
  }
  return v3;
}

+ (id)predicateForSupportBarcodePayment:(BOOL)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));

  return v4;
}

+ (id)predicateForNetworks:(id)a3
{
  return +[SQLiteCompoundPredicate predicateWithProperty:equalToValues:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateWithProperty:equalToValues:",  @"payment_network_identifier",  a3);
}

+ (id)predicateForPaymentMethodTypes:(id)a3
{
  return +[SQLiteCompoundPredicate predicateWithProperty:equalToValues:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateWithProperty:equalToValues:",  @"payment_type",  a3);
}

+ (id)_predicateForApplicationIdentifier:(id)a3 secureElementIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"aid",  a3));
  v12[0] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForSecureElementIdentifier:v6]);

  v12[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));
  return v10;
}

+ (id)_predicateForPassUniqueIdentifier:(id)a3 applicationIdentifier:(id)a4 secureElementIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForPassWithUniqueIdentifier:a3]);
  v15[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationIdentifier:v9 secureElementIdentifier:v8]);

  v15[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));
  return v13;
}

+ (id)_predicateForApplicationIdentifier:(id)a3 secureElementIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"aid",  a3));
  v12[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForSecureElementIdentifiers:v6]);

  v12[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_predicateForApplicationIdentifier:(id)a3 subcredentialIdentifier:(id)a4 secureElementIdentifiers:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"aid",  a3));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"whitney.b",  v8,  v10));
    v16[1] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForSecureElementIdentifiers:v9]);

    v16[2] = v12;
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));
  }

  else
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationIdentifier:a3 secureElementIdentifiers:v9]);
  }

  return v14;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForPass:(id)a3
{
  return objc_msgSend(a1, "_predicateForPassPID:", objc_msgSend(a3, "persistentID"));
}

+ (id)_predicateForPersistentID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

- (id)paymentApplication
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKPaymentApplication);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentApplication _propertySettersForPaymentApplication]( &OBJC_CLASS___PaymentApplication,  "_propertySettersForPaymentApplication"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  __int128 v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472LL;
  __int128 v27 = sub_10026DE38;
  v28 = &unk_100639EE8;
  id v6 = v4;
  id v29 = v6;
  id v7 = v3;
  v30 = v7;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, &v25);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database", v25, v26, v27, v28));
  int64_t v9 = -[SQLiteEntity persistentID](self, "persistentID");
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentExpressMode expressModesInDatabase:forPaymentApplicationPID:]( &OBJC_CLASS___PaymentExpressMode,  "expressModesInDatabase:forPaymentApplicationPID:",  v8,  v9));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
  -[PKPaymentApplication setSupportedExpressModes:](v7, "setSupportedExpressModes:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentAutomaticSelectionCriterion criteriaInDatabase:forPaymentApplicationPID:]( &OBJC_CLASS___PaymentAutomaticSelectionCriterion,  "criteriaInDatabase:forPaymentApplicationPID:",  v8,  v9));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allObjects]);
  -[PKPaymentApplication setAutomaticSelectionCriteria:](v7, "setAutomaticSelectionCriteria:", v13);

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransitNetworkIdentifier transitNetworkIdentifiersInDatabase:forPaymentApplicationPID:]( &OBJC_CLASS___PaymentTransitNetworkIdentifier,  "transitNetworkIdentifiersInDatabase:forPaymentApplicationPID:",  v8,  v9));
  -[PKPaymentApplication setSupportedTransitNetworkIdentifiers:](v7, "setSupportedTransitNetworkIdentifiers:", v14);

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[AppletSubcredential appletSubcredentialsInDatabase:forPaymentApplicationPID:]( &OBJC_CLASS___AppletSubcredential,  "appletSubcredentialsInDatabase:forPaymentApplicationPID:",  v8,  v9));
  -[PKPaymentApplication setSubcredentials:](v7, "setSubcredentials:", v15);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[FelicaTransitAppletState anyInDatabase:withPaymentApplicationPID:]( &OBJC_CLASS___FelicaTransitAppletState,  "anyInDatabase:withPaymentApplicationPID:",  v8,  v9));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 transitAppletState]);

  if (!v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[TransitAppletState anyInDatabase:withPaymentApplicationPID:]( &OBJC_CLASS___TransitAppletState,  "anyInDatabase:withPaymentApplicationPID:",  v8,  v9));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v18 transitAppletState]);
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[SecureElementPassField secureElementPassFieldsInDatabase:forPassPID:]( &OBJC_CLASS___SecureElementPassField,  "secureElementPassFieldsInDatabase:forPassPID:",  v8,  -[PaymentApplication passPID](self, "passPID")));
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v17 transitPassPropertiesWithPaymentApplication:v7 fieldCollection:v19]);
  -[PKPaymentApplication setTransitProperties:](v7, "setTransitProperties:", v20);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentApplicationMerchantSupport supportedCountryCodesForPaymentApplication:inDatabase:]( &OBJC_CLASS___PaymentApplicationMerchantSupport,  "supportedCountryCodesForPaymentApplication:inDatabase:",  self,  v8));
  -[PKPaymentApplication setSupportedInAppMerchantCountryCodes:](v7, "setSupportedInAppMerchantCountryCodes:", v21);

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentApplicationMerchantSupport unsupportedCountryCodesForPaymentApplication:inDatabase:]( &OBJC_CLASS___PaymentApplicationMerchantSupport,  "unsupportedCountryCodesForPaymentApplication:inDatabase:",  self,  v8));
  -[PKPaymentApplication setUnsupportedInAppMerchantCountryCodes:](v7, "setUnsupportedInAppMerchantCountryCodes:", v22);

  id v23 = v7;
  return v23;
}

- (void)updateWithPaymentApplication:(id)a3
{
  id v4 = a3;
  id v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 inAppPINRequiredAmount]);
  uint64_t v6 = PKCurrencyDecimalToStorageNumber(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 dpanIdentifier]);
  [v30 setObjectOrNull:v8 forKey:@"dpan_id"];

  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 dpanSuffix]);
  [v30 setObjectOrNull:v9 forKey:@"dpan_suffix"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 sanitizedDPAN]);
  [v30 setObjectOrNull:v10 forKey:@"sanitized_dpan"];

  objc_msgSend(v30, "setInteger:forKey:", objc_msgSend(v4, "state"), @"state");
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 suspendedReason]);
  [v30 setObjectOrNull:v11 forKey:@"suspended_reason"];

  objc_msgSend( v30,  "setInteger:forKey:",  objc_msgSend(v4, "paymentNetworkIdentifier"),  @"payment_network_identifier");
  objc_msgSend( v30,  "setBool:forKey:",  objc_msgSend(v4, "supportsContactlessPayment"),  @"supports_contactless_payment");
  objc_msgSend(v30, "setBool:forKey:", objc_msgSend(v4, "supportsInAppPayment"), @"supports_in_app_payment");
  objc_msgSend(v30, "setBool:forKey:", objc_msgSend(v4, "supportsMerchantTokens"), @"c");
  objc_msgSend(v30, "setBool:forKey:", objc_msgSend(v4, "hasMerchantTokens"), @"f");
  objc_msgSend(v30, "setBool:forKey:", objc_msgSend(v4, "hadMerchantTokens"), @"m");
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 apanIdentifier]);
  [v30 setObjectOrNull:v12 forKey:@"d"];

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 apanSuffix]);
  [v30 setObjectOrNull:v13 forKey:@"e"];

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 virtualCardIdentifier]);
  [v30 setObjectOrNull:v14 forKey:@"i"];

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 virtualCardSuffix]);
  [v30 setObjectOrNull:v15 forKey:@"l"];

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 supportsVirtualCardNumber]);
  [v30 setObjectOrNull:v16 forKey:@"j"];

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 virtualCardVPANOrigin]));
  [v30 setObjectOrNull:v17 forKey:@"n"];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 supportsMultiTokens]);
  [v30 setObjectOrNull:v18 forKey:@"h"];

  objc_msgSend(v30, "setBool:forKey:", objc_msgSend(v4, "supportsBarcodePayment"), @"b");
  objc_msgSend( v30,  "setBool:forKey:",  objc_msgSend(v4, "supportsOptionalAuthentication"),  @"supports_optional_authentication");
  objc_msgSend(v30, "setBool:forKey:", objc_msgSend(v4, "supportsServiceMode"), @"supports_service_mode");
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v4 appletDataFormat]);
  [v30 setObjectOrNull:v19 forKey:@"applet_data_format"];

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v4 appletCurrencyCode]);
  [v30 setObjectOrNull:v20 forKey:@"applet_currency_code"];

  objc_msgSend( v30,  "setBool:forKey:",  objc_msgSend(v4, "requiresDeferredAuthorization"),  @"requires_deferred_authorization");
  [v30 setObjectOrNull:v7 forKey:@"in_app_pin_required_amount"];
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v4 inAppPINRequiredCurrency]);
  [v30 setObjectOrNull:v21 forKey:@"in_app_pin_required_currency"];

  objc_msgSend(v30, "setBool:forKey:", objc_msgSend(v4, "isAuxiliary"), @"auxiliary_application");
  objc_msgSend(v30, "setInteger:forKey:", objc_msgSend(v4, "paymentType"), @"payment_type");
  objc_msgSend(v30, "setInteger:forKey:", objc_msgSend(v4, "auxiliaryPaymentType"), @"auxiliary_payment_type");
  objc_msgSend(v30, "setInteger:forKey:", objc_msgSend(v4, "contactlessPriority"), @"contactless_priority");
  objc_msgSend(v30, "setInteger:forKey:", objc_msgSend(v4, "inAppPriority"), @"in_app_priority");
  objc_msgSend(v30, "setBool:forKey:", objc_msgSend(v4, "supportsInstantFundsIn"), @"supports_instant_funds_in");
  objc_msgSend( v30,  "setInteger:forKey:",  objc_msgSend(v4, "fundingSourcePaymentType"),  @"funding_source_payment_type");
  objc_msgSend(v30, "setBool:forKey:", objc_msgSend(v4, "requiresConsentForDataRelease"), @"g");
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
  [v30 setObjectOrNull:v22 forKey:@"display_name"];

  objc_msgSend(v30, "setBool:forKey:", objc_msgSend(v4, "isShareable"), @"k");
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 supportedExpressModes]);
  -[PaymentApplication _updateExpressModes:](self, "_updateExpressModes:", v23);

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v4 automaticSelectionCriteria]);
  -[PaymentApplication updateAutomaticSelectionCriteria:](self, "updateAutomaticSelectionCriteria:", v24);

  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v4 supportedTransitNetworkIdentifiers]);
  -[PaymentApplication updateTransitNetworkIdentifiers:](self, "updateTransitNetworkIdentifiers:", v25);

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v4 subcredentials]);
  id v27 =  +[AppletSubcredential setAppletSubcredentials:forPaymentApplication:inDatabase:]( &OBJC_CLASS___AppletSubcredential,  "setAppletSubcredentials:forPaymentApplication:inDatabase:",  v26,  self,  self->super._database);

  v28 = (void *)objc_claimAutoreleasedReturnValue([v4 supportedInAppMerchantCountryCodes]);
  +[PaymentApplicationMerchantSupport updateSupportedCountryCodes:forPaymentApplication:inDatabase:]( &OBJC_CLASS___PaymentApplicationMerchantSupport,  "updateSupportedCountryCodes:forPaymentApplication:inDatabase:",  v28,  self,  self->super._database);

  id v29 = (void *)objc_claimAutoreleasedReturnValue([v4 unsupportedInAppMerchantCountryCodes]);
  +[PaymentApplicationMerchantSupport updateUnsupportedCountryCodes:forPaymentApplication:inDatabase:]( &OBJC_CLASS___PaymentApplicationMerchantSupport,  "updateUnsupportedCountryCodes:forPaymentApplication:inDatabase:",  v29,  self,  self->super._database);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v30);
}

- (void)_updateExpressModes:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10026E540;
  v7[3] = &unk_10063E440;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  int64_t v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = v8;
  sub_1002CCC5C((uint64_t)v6, v7);
}

- (void)updateAutomaticSelectionCriteria:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10026E630;
  v7[3] = &unk_10063E440;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  int64_t v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = v8;
  sub_1002CCC5C((uint64_t)v6, v7);
}

- (void)updateTransitNetworkIdentifiers:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10026E720;
  v7[3] = &unk_10063E440;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  int64_t v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = v8;
  sub_1002CCC5C((uint64_t)v6, v7);
}

+ (id)_propertySettersForPaymentApplication
{
  v3[0] = @"aid";
  v3[1] = @"transaction_source.identifier";
  v4[0] = &stru_1006504D8;
  v4[1] = &stru_1006504F8;
  v3[2] = @"seid";
  v3[3] = @"dpan_id";
  v4[2] = &stru_100650518;
  v4[3] = &stru_100650538;
  v3[4] = @"dpan_suffix";
  v3[5] = @"sanitized_dpan";
  v4[4] = &stru_100650558;
  v4[5] = &stru_100650578;
  v3[6] = @"state";
  v3[7] = @"suspended_reason";
  v4[6] = &stru_100650598;
  v4[7] = &stru_1006505B8;
  v3[8] = @"supports_contactless_payment";
  v3[9] = @"supports_in_app_payment";
  v4[8] = &stru_1006505D8;
  v4[9] = &stru_1006505F8;
  v3[10] = @"c";
  v3[11] = @"f";
  v4[10] = &stru_100650618;
  v4[11] = &stru_100650638;
  v3[12] = @"m";
  v3[13] = @"d";
  v4[12] = &stru_100650658;
  v4[13] = &stru_100650678;
  v3[14] = @"e";
  v3[15] = @"h";
  v4[14] = &stru_100650698;
  v4[15] = &stru_1006506B8;
  v3[16] = @"i";
  v3[17] = @"l";
  v4[16] = &stru_1006506D8;
  v4[17] = &stru_1006506F8;
  v3[18] = @"j";
  v3[19] = @"n";
  v4[18] = &stru_100650718;
  v4[19] = &stru_100650738;
  v3[20] = @"b";
  v3[21] = @"supports_optional_authentication";
  v4[20] = &stru_100650758;
  v4[21] = &stru_100650778;
  v3[22] = @"applet_data_format";
  v3[23] = @"applet_currency_code";
  v4[22] = &stru_100650798;
  v4[23] = &stru_1006507B8;
  v3[24] = @"requires_deferred_authorization";
  v3[25] = @"payment_network_identifier";
  v4[24] = &stru_1006507D8;
  v4[25] = &stru_1006507F8;
  v3[26] = @"in_app_pin_required_amount";
  v3[27] = @"in_app_pin_required_currency";
  v4[26] = &stru_100650818;
  v4[27] = &stru_100650838;
  v3[28] = @"auxiliary_application";
  v3[29] = @"payment_type";
  v4[28] = &stru_100650858;
  v4[29] = &stru_100650878;
  v3[30] = @"auxiliary_payment_type";
  v3[31] = @"contactless_priority";
  v4[30] = &stru_100650898;
  v4[31] = &stru_1006508B8;
  v3[32] = @"in_app_priority";
  v3[33] = @"supports_instant_funds_in";
  v4[32] = &stru_1006508D8;
  v4[33] = &stru_1006508F8;
  v3[34] = @"funding_source_payment_type";
  v3[35] = @"g";
  v4[34] = &stru_100650918;
  v4[35] = &stru_100650938;
  v3[36] = @"display_name";
  v3[37] = @"supports_service_mode";
  v4[36] = &stru_100650958;
  v4[37] = &stru_100650978;
  v3[38] = @"k";
  v4[38] = &stru_100650998;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  39LL));
}

@end