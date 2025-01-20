@interface Pass
+ (id)_copyPropertiesForPass;
+ (id)_dynamicStateInDatabase:(id)a3 forPassPID:(int64_t)a4;
+ (id)_insertionDictionaryWithPass:(id)a3 passType:(id)a4;
+ (id)_predicateForPassAnnotationState:(int64_t)a3;
+ (id)_propertySettersForDisplayProfile;
+ (id)_propertySettersForGroupingProfile;
+ (id)_propertySettersForPass;
+ (id)_propertySettersForUpdateContext;
+ (id)_realPassInDatabase:(id)a3 withProperties:(id)a4 values:(const void *)a5 fromPass:(id)a6;
+ (id)_realPassPredicateForPredicate:(id)a3;
+ (id)_realPassesInDatabase:(id)a3 states:(id *)a4 predicate:(id)a5 orderedBy:(id)a6;
+ (id)_updateDictionaryWithDisplayProfile:(id)a3;
+ (id)_updateDictionaryWithPass:(id)a3;
+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifier:(id)a5;
+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifiers:(id)a5;
+ (id)anyInDatabase:(id)a3 withAssociatedAccountIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withGroup:(id)a4;
+ (id)anyInDatabase:(id)a3 withNotificationService:(id)a4;
+ (id)anyInDatabase:(id)a3 withPassType:(id)a4;
+ (id)anyInDatabase:(id)a3 withPassType:(id)a4 serialNumber:(id)a5;
+ (id)anyInDatabase:(id)a3 withPersistentID:(int64_t)a4;
+ (id)anyInDatabase:(id)a3 withPrimaryAccountIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withProvisioningCredentialHash:(id)a4;
+ (id)anyInDatabase:(id)a3 withReaderIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(unint64_t)a4;
+ (id)anyInDatabase:(id)a3 withUniqueID:(id)a4;
+ (id)anyInDatabase:(id)a3 withWebService:(id)a4;
+ (id)anyInDatabase:(id)a3 withWebService:(id)a4 serialNumber:(id)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)candidatePassesInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)databaseTable;
+ (id)dynamicStateInDatabase:(id)a3 forPassUniqueID:(id)a4;
+ (id)dynamicStatesInDatabase:(id)a3 forPassUniqueIDs:(id)a4;
+ (id)insertPass:(id)a3 withPassType:(id)a4 webService:(id)a5 transactionService:(id)a6 messageService:(id)a7 daemonPassData:(id)a8 inDatabase:(id)a9;
+ (id)passStylesInDatabase:(id)a3;
+ (id)passUniqueIDsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)passesInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)passesInDatabase:(id)a3 states:(id *)a4 matchingPredicate:(id)a5;
+ (id)predicateForAssociatedAccountIdentifier:(id)a3;
+ (id)predicateForAssociatedPassTypeIdentifierHash:(id)a3;
+ (id)predicateForExpired;
+ (id)predicateForGroup:(id)a3;
+ (id)predicateForHasAnyWebService;
+ (id)predicateForHasVPANID;
+ (id)predicateForHasValidNFCPayload;
+ (id)predicateForInMainStack;
+ (id)predicateForIsCloudKitArchived:(BOOL)a3;
+ (id)predicateForIsCloudKitSecurelyArchived:(BOOL)a3;
+ (id)predicateForIsRevoked:(BOOL)a3;
+ (id)predicateForIssuerCountryCodes:(id)a3;
+ (id)predicateForManuallyRecovered;
+ (id)predicateForNFCPayloadState:(unint64_t)a3;
+ (id)predicateForNotificationService:(id)a3;
+ (id)predicateForPassType:(id)a3;
+ (id)predicateForPassTypeIdentifier:(id)a3;
+ (id)predicateForPassTypeIdentifierHash:(id)a3;
+ (id)predicateForPaymentApplicationAppletDataFormatPrefix:(id)a3;
+ (id)predicateForPaymentApplicationIdentifier:(id)a3 withSecureElementIdentifier:(id)a4;
+ (id)predicateForPaymentApplicationIdentifier:(id)a3 withSecureElementIdentifiers:(id)a4;
+ (id)predicateForPaymentApplicationNetworks:(id)a3;
+ (id)predicateForPaymentApplicationSecureElementIdentifier:(id)a3;
+ (id)predicateForPaymentApplicationSecureElementIdentifiers:(id)a3;
+ (id)predicateForPaymentApplicationState:(int64_t)a3;
+ (id)predicateForPaymentApplicationStates:(id)a3;
+ (id)predicateForPaymentApplicationSupportsContactlessPayment:(BOOL)a3;
+ (id)predicateForPaymentApplicationSupportsInAppPayment:(BOOL)a3;
+ (id)predicateForPaymentCardType:(int64_t)a3;
+ (id)predicateForPaymentType:(unint64_t)a3;
+ (id)predicateForPersistentID:(int64_t)a3;
+ (id)predicateForPrimaryAccountIdentifier:(id)a3;
+ (id)predicateForPrimaryPaymentApplication:(BOOL)a3;
+ (id)predicateForProvisioningCredentialHash:(id)a3;
+ (id)predicateForReaderIds:(id)a3;
+ (id)predicateForSerialNumber:(id)a3;
+ (id)predicateForStagedForExpiration;
+ (id)predicateForStyle:(int64_t)a3;
+ (id)predicateForSupportsDefaultCardSelection:(BOOL)a3;
+ (id)predicateForSupportsIssuerBinding:(BOOL)a3;
+ (id)predicateForTCIs:(id)a3;
+ (id)predicateForTransactionSourceWithPID:(unint64_t)a3;
+ (id)predicateForUniqueID:(id)a3;
+ (id)predicateForUniqueIDs:(id)a3;
+ (id)predicateForValidStyle;
+ (id)predicateForWebService:(id)a3;
+ (id)queryWithDatabase:(id)a3 group:(id)a4;
+ (id)queryWithDatabase:(id)a3 passType:(id)a4;
+ (id)secureElementCardTypesInDatabase:(id)a3;
+ (id)unexpiredPassStylesInDatabase:(id)a3;
+ (id)unexpiredSecureElementCardTypesInDatabase:(id)a3;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)enumerateOrganizationNamesForQuery:(id)a3 withHandler:(id)a4;
+ (void)enumeratePassSyncabilityPropertiesInDatabase:(id)a3 withHandler:(id)a4;
+ (void)enumeratePassUniqueIDsAndTypesForQuery:(id)a3 withHandler:(id)a4;
+ (void)enumeratePassesAndGroupingProfilesForQuery:(id)a3 withHandler:(id)a4;
+ (void)enumeratePassesForQuery:(id)a3 withHandler:(id)a4;
+ (void)enumerateUpdateContextsForQuery:(id)a3 withHandler:(id)a4;
- (BOOL)deleteFromDatabase;
- (BOOL)hasAssociatedPeerPaymentAccount;
- (BOOL)revoked;
- (BOOL)supportsIssuerBinding;
- (BOOL)voided;
- (Pass)initWithPass:(id)a3 passType:(id)a4 webService:(id)a5 transactionService:(id)a6 messageService:(id)a7 daemonPassData:(id)a8 inDatabase:(id)a9;
- (id)_realPass;
- (id)_updatePassTileDescriptor:(id)a3 groupDescriptor:(id)a4 idx:(unint64_t)a5 previousStates:(id)a6 visitedIdentifiers:(id)a7;
- (id)associatedAccountIdentifier;
- (id)associatedApplicationIdentifiers;
- (id)associatedPassTypeIdentifiers;
- (id)authenticationToken;
- (id)defaultPaymentApplication;
- (id)displayProfile;
- (id)expirationDate;
- (id)group;
- (id)groupingProfile;
- (id)messageService;
- (id)pass;
- (id)passMessageService;
- (id)passNotificationServiceForType:(unint64_t)a3;
- (id)passTransactionService;
- (id)passType;
- (id)primaryAccountIdentifier;
- (id)serialNumber;
- (id)signingDate;
- (id)transactionService;
- (id)transactionSourceIdentifier;
- (id)uniqueID;
- (id)updateContext;
- (id)webService;
- (int64_t)passStyle;
- (int64_t)sortingState;
- (unint64_t)associatedAccountFeatureIdentifier;
- (unint64_t)passFlavor;
- (void)_updateSortingStateIfNecessary;
- (void)_updateWithMessageService:(id)a3;
- (void)_updateWithPassMessageService:(id)a3;
- (void)_updateWithPassTransactionService:(id)a3;
- (void)_updateWithTransactionService:(id)a3;
- (void)_updateWithWebService:(id)a3;
- (void)getPushRegistrationStatus:(unint64_t *)a3 date:(id *)a4;
- (void)udpateWithCloudKitMetadata:(id)a3;
- (void)udpateWithCloudKitSecureMetadata:(id)a3;
- (void)udpateWithIsCloudKitArchived:(BOOL)a3;
- (void)udpateWithIsCloudKitSecurelyArchived:(BOOL)a3;
- (void)updateBackgroundColorWithPass:(id)a3;
- (void)updateLocationsWithPass:(id)a3;
- (void)updateTallCodeValueWithPass:(id)a3;
- (void)updateWithAssociatedAccountIdentifier:(id)a3;
- (void)updateWithAssociatedApplicationIdentifiers:(id)a3;
- (void)updateWithAssociatedPassTypeIdentifiers:(id)a3;
- (void)updateWithAssociatedWebDomains:(id)a3;
- (void)updateWithBeacons:(id)a3;
- (void)updateWithContactlessActivationGroupingType:(unint64_t)a3;
- (void)updateWithDaemonPassData:(id)a3;
- (void)updateWithDefaultPaymentApplication:(id)a3;
- (void)updateWithGroup:(id)a3;
- (void)updateWithIngestedDate:(id)a3;
- (void)updateWithLastModifiedSource:(int64_t)a3;
- (void)updateWithLastModifiedTag:(id)a3;
- (void)updateWithNFCPayload:(id)a3;
- (void)updateWithPass:(id)a3 webService:(id)a4 transactionSevice:(id)a5 messageService:(id)a6 daemonPassData:(id)a7;
- (void)updateWithPassDisplayProfile:(id)a3;
- (void)updateWithPassTileDescriptors:(id)a3;
- (void)updateWithPaymentApplications:(id)a3;
- (void)updateWithProvisioningMetadata:(id)a3;
- (void)updateWithPushRegistrationStatus:(int64_t)a3 date:(id)a4;
- (void)updateWithRelevantDates:(id)a3;
- (void)updateWithRevocationStatus:(BOOL)a3;
- (void)updateWithSecureElementPassFields:(id)a3;
- (void)updateWithShareBundle:(id)a3;
- (void)updateWithSortingState:(int64_t)a3 forSortingReason:(int64_t)a4;
- (void)updateWithSupportsIssuerBinding:(BOOL)a3;
- (void)updateWithTransactionSourcePID:(int64_t)a3;
@end

@implementation Pass

+ (id)databaseTable
{
  return @"pass";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PassLocationSource, a2) == a3
    || (Class)objc_opt_class(&OBJC_CLASS___Beacon, v4) == a3
    || (Class)objc_opt_class(&OBJC_CLASS___Location, v5) == a3
    || (Class)objc_opt_class(&OBJC_CLASS___PaymentApplication, v6) == a3
    || (Class)objc_opt_class(&OBJC_CLASS___PassNotificationService, v7) == a3
    || (Class)objc_opt_class(&OBJC_CLASS___AssociatedApplicationIdentifier, v8) == a3
    || (Class)objc_opt_class(&OBJC_CLASS___AssociatedWebDomain, v9) == a3
    || (Class)objc_opt_class(&OBJC_CLASS___PassAnnotations, v10) == a3
    || (Class)objc_opt_class(&OBJC_CLASS___PassRelevancyDates, v11) == a3
    || (Class)objc_opt_class(&OBJC_CLASS___PassRelevancyModel, v12) == a3)
  {
    return @"pid";
  }

  if ((Class)objc_opt_class(&OBJC_CLASS___WebService, v13) == a3) {
    return @"web_service_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___TransactionSource, v14) == a3) {
    return @"transaction_source_pid";
  }
  return 0LL;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if (([v11 isEqualToString:@"pass_type.identifier"] & 1) != 0
    || ([v11 isEqualToString:@"pass_type.team_identifier"] & 1) != 0
    || [v11 isEqualToString:@"pass_type.identifier_hash"])
  {
    [v5 addObject:@"JOIN pass_type ON pass_type.pid = pass.pass_type_pid"];
  }

  if (([v11 isEqualToString:@"pass_group.group_order"] & 1) != 0
    || [v11 isEqualToString:@"pass_group.pass_style"])
  {
    [v5 addObject:@"JOIN pass_group ON pass_group.pid = pass.group_pid"];
  }

  if (([v11 isEqualToString:@"payment_application.aid"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.seid"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.state"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.auxiliary_application"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.payment_network_identifier"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.supports_contactless_payment"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.supports_in_app_payment"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.payment_type"] & 1) != 0
    || ([v11 isEqualToString:@"payment_application.applet_data_format"] & 1) != 0
    || [v11 isEqualToString:@"payment_application.i"])
  {
    [v5 addObject:@"JOIN payment_application ON payment_application.pass_pid = pass.pid"];
  }

  if (([v11 isEqualToString:@"payment_automatic_selection_criterion_tci.tci"] & 1) != 0
    || ([v11 isEqualToString:@"payment_automatic_selection_criterion_reader_id.reader_id"] & 1) != 0 || objc_msgSend(v11, "isEqualToString:", @"associated_reader_id.reader_id"))
  {
    [v5 addObject:@"JOIN payment_automatic_selection_criterion ON payment_automatic_selection_criterion.payment_application_pid = payment_application.pid JOIN payment_automatic_selection_criterion_tci ON payment_automatic_selection_criterion_tci.payment_automatic_selection_criterion_pid = payment_automatic_selection_criterion.pid LEFT JOIN payment_automatic_selection_criterion_reader_id ON payment_automatic_selection_criterion_reader_id.payment_automatic_selection_criterion_pid = payment_automatic_selection_criterion.pid LEFT JOIN associated_reader_id ON associated_reader_id.automatic_selection_criterion_pid = payment_automatic_selection_criterion.pid"];
  }

  if ([v11 isEqualToString:@"pass_notification_service.notification_service_pid"]) {
    [v5 addObject:@"JOIN pass_notification_service ON (pass_notification_service.pid = pass_transaction_service_pid OR pass_notification_service.pid = pass_message_service_pid)"];
  }
  if (([v11 isEqualToString:@"nfc.message"] & 1) != 0
    || ([v11 isEqualToString:@"nfc.encryption_public_key"] & 1) != 0
    || [v11 isEqualToString:@"nfc.a"])
  {
    [v5 addObject:@"LEFT OUTER JOIN nfc ON nfc.pass_pid = pass.pid"];
  }

  if ([v11 isEqualToString:@"associated_pass_type_identifier.identifier_hash"]) {
    [v5 addObject:@"JOIN associated_pass_type_identifier ON associated_pass_type_identifier.pass_pid = pass.pid"];
  }
  if ([v11 isEqualToString:@"transaction_source.identifier"]) {
    [v5 addObject:@"LEFT JOIN transaction_source ON transaction_source.pid = pass.transaction_source_pid"];
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[PassAnnotations databaseTable](&OBJC_CLASS___PassAnnotations, "databaseTable"));
  id v7 = [v11 rangeOfString:v6];
  if (v8)
  {
    if (!v7)
    {
      unint64_t v9 = v8;
      if ((unint64_t)[v11 length] > v8
        && [v11 characterAtIndex:v9] == 46)
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"JOIN %@ ON %@.%@ = pass.pid",  v6,  v6,  @"pass_pid"));
        [v5 addObject:v10];
      }
    }
  }
}

+ (id)_insertionDictionaryWithPass:(id)a3 passType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v8, @"unique_id");

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 serialNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v9, @"serial_number");

  id v10 = [v5 persistentID];
  -[NSMutableDictionary setLongLong:forKey:](v7, "setLongLong:forKey:", v10, @"pass_type_pid");
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 groupingID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v11, @"grouping_id");

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 provisioningCredentialHash]);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v7,  "setObjectOrNull:forKey:",  v12,  @"provisioning_credential_hash");

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v13, @"ingested_date");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 signingDate]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v14, @"signing_date");

  return v7;
}

+ (id)_updateDictionaryWithPass:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"organization_name");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 expirationDate]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"expiration_date");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 sequenceCounter]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"sequence_counter");

  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", [v3 isVoided], @"voided");
  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 hasStoredValue],  @"has_stored_value");
  uint64_t v8 = PKPassLiveRenderTypeToString([v3 liveRenderType]);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v4,  "setObjectOrNull:forKey:",  v9,  @"live_render_background_type");

  uint64_t v10 = PKPassHomeKeyLiveRenderTypeToString([v3 homeKeyLiveRenderType]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"f");

  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 supportsCategoryVisualization],  @"b");
  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 liveRenderingRequiresEnablement],  @"live_rendering_requires_enablement");
  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 muteReadyForUseNotification],  @"mute_ready_for_use_notification");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v12))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v12,  0LL,  0LL));
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"user_info");
  }

  else
  {
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", 0LL, @"user_info");
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 manifestHash]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v14, @"manifest_hash");

  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  [v3 sharingMethod],  @"sharing_method");
  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 sharingURL]);
  v16 = (void *)_SQLValueForURL(v15);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"sharing_url");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 sharingText]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"sharing_text");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 authenticationToken]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"authentication_token");

  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  [v3 passType],  @"pass_flavor");
  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 isCloudKitArchived],  @"is_cloud_kit_archived");
  v19 = (void *)objc_claimAutoreleasedReturnValue([v3 cloudKitMetadata]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"cloud_kit_metadata");

  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 isCloudKitSecurelyArchived],  @"is_cloud_kit_securely_archived");
  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 cloudKitSecureMetadata]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v20, @"cloud_kit_secure_metadata");

  v21 = (void *)objc_claimAutoreleasedReturnValue([v3 provisioningCredentialHash]);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v4,  "setObjectOrNull:forKey:",  v21,  @"provisioning_credential_hash");

  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 supportsIssuerBinding],  @"supports_issuer_binding");
  v22 = (void *)objc_claimAutoreleasedReturnValue([v3 transferURL]);
  v23 = (void *)_SQLValueForURL(v22);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v23, @"transfer_url");

  v24 = (void *)objc_claimAutoreleasedReturnValue([v3 sellURL]);
  v25 = (void *)_SQLValueForURL(v24);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v25, @"sell_url");

  v26 = (void *)objc_claimAutoreleasedReturnValue([v3 bagPolicyURL]);
  v27 = (void *)_SQLValueForURL(v26);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v27, @"bag_policy_url");

  v28 = (void *)objc_claimAutoreleasedReturnValue([v3 orderFoodURL]);
  v29 = (void *)_SQLValueForURL(v28);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v29, @"order_food_url");

  v30 = (void *)objc_claimAutoreleasedReturnValue([v3 transitInformationURL]);
  v31 = (void *)_SQLValueForURL(v30);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v31, @"transit_information_url");

  v32 = (void *)objc_claimAutoreleasedReturnValue([v3 parkingInformationURL]);
  v33 = (void *)_SQLValueForURL(v32);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v33, @"parking_information_url");

  v34 = (void *)objc_claimAutoreleasedReturnValue([v3 directionsInformationURL]);
  v35 = (void *)_SQLValueForURL(v34);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v4,  "setObjectOrNull:forKey:",  v35,  @"directions_information_url");

  v36 = (void *)objc_claimAutoreleasedReturnValue([v3 merchandiseURL]);
  v37 = (void *)_SQLValueForURL(v36);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v37, @"merchandise_url");

  v38 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityURL]);
  v39 = (void *)_SQLValueForURL(v38);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v39, @"accessibility_url");

  v40 = (void *)objc_claimAutoreleasedReturnValue([v3 purchaseParkingURL]);
  v41 = (void *)_SQLValueForURL(v40);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v41, @"purchase_parking_url");

  v42 = (void *)objc_claimAutoreleasedReturnValue([v3 partnerAddOnURL]);
  v43 = (void *)_SQLValueForURL(v42);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v43, @"add_on_url");

  v44 = (void *)objc_claimAutoreleasedReturnValue([v3 contactVenuePhoneNumber]);
  v45 = (void *)_SQLValueForURL(v44);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v4,  "setObjectOrNull:forKey:",  v45,  @"contact_venue_phone_number");

  v46 = (void *)objc_claimAutoreleasedReturnValue([v3 contactVenueEmail]);
  v47 = (void *)_SQLValueForURL(v46);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v47, @"contact_venue_email");

  v48 = (void *)objc_claimAutoreleasedReturnValue([v3 contactVenueWebsite]);
  v49 = (void *)_SQLValueForURL(v48);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v49, @"contact_venue_website");

  if ([v3 passType] == (id)1)
  {
    -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  [v3 cardType],  @"card_type");
    v50 = (void *)objc_claimAutoreleasedReturnValue([v3 primaryAccountIdentifier]);
    -[NSMutableDictionary setObjectOrNull:forKey:]( v4,  "setObjectOrNull:forKey:",  v50,  @"primary_account_identifier");

    v51 = (void *)objc_claimAutoreleasedReturnValue([v3 primaryAccountNumberSuffix]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v51, @"primary_account_suffix");

    v52 = (void *)objc_claimAutoreleasedReturnValue([v3 sanitizedPrimaryAccountNumber]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v52, @"sanitized_pan");

    v53 = (void *)objc_claimAutoreleasedReturnValue([v3 sanitizedPrimaryAccountName]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v53, @"c");

    -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 supportsDPANNotifications],  @"supports_dpan_notifications");
    -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 supportsFPANNotifications],  @"supports_fpan_notifications");
    -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 supportsDefaultCardSelection],  @"supports_default_card_selection");
    -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 isShellPass],  @"is_shell_pass");
    -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 supportsSerialNumberBasedProvisioning],  @"supports_serial_number_based_provisioning");
    -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 requiresTransferSerialNumberBasedProvisioning],  @"requires_transfer_serial_number_based_provisioning");
    -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 hasAssociatedPeerPaymentAccount],  @"has_associated_peer_payment_account");
    v54 = (void *)objc_claimAutoreleasedReturnValue([v3 associatedAccountServiceAccountIdentifier]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v54, @"a");

    -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  [v3 contactlessActivationGroupingType],  @"contactless_activation_grouping_type");
    -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", [v3 isCobranded], @"cobranded");
    v55 = (void *)objc_claimAutoreleasedReturnValue([v3 issuerCountryCode]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v55, @"issuer_country_code");

    v56 = (void *)objc_claimAutoreleasedReturnValue([v3 issuerAdministrativeAreaCode]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v56, @"d");

    v57 = (void *)objc_claimAutoreleasedReturnValue([v3 identityAccountKeyIdentifier]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v57, @"g");

    v58 = (void *)objc_claimAutoreleasedReturnValue([v3 partnerAccountIdentifier]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v58, @"e");

    v59 = (void *)objc_claimAutoreleasedReturnValue([v3 shippingAddressSeed]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v59, @"shipping_address_seed");

    v60 = (void *)objc_claimAutoreleasedReturnValue([v3 originalProvisioningDate]);
    v61 = (void *)_SQLValueForDate(v60);
    -[NSMutableDictionary setObjectOrNull:forKey:]( v4,  "setObjectOrNull:forKey:",  v61,  @"original_provisioning_date");
  }

  return v4;
}

+ (id)_updateDictionaryWithDisplayProfile:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 backgroundColor]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 string]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"background_color");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 secondaryBackgroundColor]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 string]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"secondary_background_color");

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 foregroundColor]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 string]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"foreground_color");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 labelColor]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 string]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"label_color");

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 stripColor]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 string]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v14, @"strip_color");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 passStyle], @"template");
  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", [v3 tallCode], @"tall_code");
  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 hasBackgroundImage],  @"has_background_image");
  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 hasStripImage],  @"has_strip_image");
  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 supportsAutomaticForegroundVibrancy],  @"supports_automatic_foreground_vibrancy");
  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 supportsAutomaticLabelVibrancy],  @"supports_automatic_label_vibrancy");
  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 suppressesHeaderDarkening],  @"suppress_header_darkening");
  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 footerBackgroundColor]);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 string]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"footer_background_color");

  return v4;
}

- (Pass)initWithPass:(id)a3 passType:(id)a4 webService:(id)a5 transactionService:(id)a6 messageService:(id)a7 daemonPassData:(id)a8 inDatabase:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[Pass _insertionDictionaryWithPass:passType:]( &OBJC_CLASS___Pass,  "_insertionDictionaryWithPass:passType:",  v15,  a4));
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___Pass;
  v22 = -[SQLiteEntity initWithPropertyValues:inDatabase:](&v24, "initWithPropertyValues:inDatabase:", v21, v20);

  if (v22) {
    -[Pass updateWithPass:webService:transactionSevice:messageService:daemonPassData:]( v22,  "updateWithPass:webService:transactionSevice:messageService:daemonPassData:",  v15,  v16,  v17,  v18,  v19);
  }

  return v22;
}

+ (id)insertPass:(id)a3 withPassType:(id)a4 webService:(id)a5 transactionService:(id)a6 messageService:(id)a7 daemonPassData:(id)a8 inDatabase:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [objc_alloc((Class)a1) initWithPass:v22 passType:v21 webService:v20 transactionService:v19 messageService:v18 daemonPassData:v17 inDatabase:v16];

  return v23;
}

- (void)updateWithPass:(id)a3 webService:(id)a4 transactionSevice:(id)a5 messageService:(id)a6 daemonPassData:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[Pass _updateDictionaryWithPass:](&OBJC_CLASS___Pass, "_updateDictionaryWithPass:", v12));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 displayProfile]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[Pass _updateDictionaryWithDisplayProfile:]( &OBJC_CLASS___Pass,  "_updateDictionaryWithDisplayProfile:",  v18));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v19);

  -[Pass _updateWithWebService:](self, "_updateWithWebService:", v13);
  -[Pass _updateWithTransactionService:](self, "_updateWithTransactionService:", v14);
  -[Pass _updateWithMessageService:](self, "_updateWithMessageService:", v15);
  id v20 = objc_autoreleasePoolPush();
  -[Pass updateLocationsWithPass:](self, "updateLocationsWithPass:", v12);
  objc_autoreleasePoolPop(v20);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 embeddedBeacons]);
  -[Pass updateWithBeacons:](self, "updateWithBeacons:", v21);

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 nfcPayload]);
  -[Pass updateWithNFCPayload:](self, "updateWithNFCPayload:", v22);

  id v23 = (void *)objc_claimAutoreleasedReturnValue([v12 relevantDates]);
  -[Pass updateWithRelevantDates:](self, "updateWithRelevantDates:", v23);

  -[Pass _updateSortingStateIfNecessary](self, "_updateSortingStateIfNecessary");
  objc_super v24 = (void *)objc_claimAutoreleasedReturnValue([v12 associatedPassTypeIdentifiers]);
  -[Pass updateWithAssociatedPassTypeIdentifiers:](self, "updateWithAssociatedPassTypeIdentifiers:", v24);

  -[Pass updateWithDaemonPassData:](self, "updateWithDaemonPassData:", v16);
  if ([v12 passType] == (id)1)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v12 paymentApplications]);
    -[Pass updateWithPaymentApplications:](self, "updateWithPaymentApplications:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue([v12 associatedApplicationIdentifiers]);
    -[Pass updateWithAssociatedApplicationIdentifiers:](self, "updateWithAssociatedApplicationIdentifiers:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue([v12 associatedWebDomains]);
    -[Pass updateWithAssociatedWebDomains:](self, "updateWithAssociatedWebDomains:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue([v12 provisioningMetadata]);
    -[Pass updateWithProvisioningMetadata:](self, "updateWithProvisioningMetadata:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue([v12 auxiliaryRegistrationRequirements]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 allRequirements]);
    +[PassAuxiliaryRegistrationRequirement insertOrUpdateAuxiliaryRegistrationRequirements:passPID:inDatabase:]( &OBJC_CLASS___PassAuxiliaryRegistrationRequirement,  "insertOrUpdateAuxiliaryRegistrationRequirements:passPID:inDatabase:",  v30,  self->super._persistentID,  self->super._database);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[Pass transactionSourceIdentifier](self, "transactionSourceIdentifier"));
    unsigned int v32 = [v12 supportsFPANNotifications];
    if (!v31 && v32)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(24LL);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);
        int v37 = 138412290;
        v38 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Pass %@ did not have a transaction source, adding one now",  (uint8_t *)&v37,  0xCu);
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue( +[TransactionSource insertTransactionSourceWithType:inDatabase:]( &OBJC_CLASS___TransactionSource,  "insertTransactionSourceWithType:inDatabase:",  0LL,  self->super._database));
      -[Pass updateWithTransactionSourcePID:]( self,  "updateWithTransactionSourcePID:",  [v36 persistentID]);
    }
  }
}

- (void)updateWithPushRegistrationStatus:(int64_t)a3 date:(id)a4
{
  v10[0] = @"push_registration_status";
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  v10[1] = @"push_registration_date";
  v11[0] = v7;
  uint64_t v8 = (void *)_SQLValueForDate(v6);

  v11[1] = v8;
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v9);
}

- (void)updateWithLastModifiedTag:(id)a3
{
}

- (void)updateWithLastModifiedSource:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (id)_SQLValueForDate(v5);

  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v7, @"modified_date");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v6, @"modified_source");
}

- (void)updateLocationsWithPass:(id)a3
{
  id v17 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v17 localLocationsURL]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[LocationSource anyInDatabase:withURL:]( &OBJC_CLASS___LocationSource,  "anyInDatabase:withURL:",  v4,  v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[PassLocationSource queryWithDatabase:passPID:locationSourcePID:]( PassLocationSource,  "queryWithDatabase:passPID:locationSourcePID:",  v7,  -[SQLiteEntity persistentID](self, "persistentID"),  [v6 persistentID]));

  [v8 deleteAllEntities];
  if (v6) {
    [v6 deleteFromDatabase];
  }
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v17 localLocationsURL]);

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v17 localLocationsURL]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[LocationSource insertLocationSourceWithURL:forPass:type:inDatabase:]( &OBJC_CLASS___LocationSource,  "insertLocationSourceWithURL:forPass:type:inDatabase:",  v10,  self,  0LL,  v11));

    id v13 = objc_alloc(&OBJC_CLASS___NSSet);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v17 embeddedLocationsArray]);
    id v15 = -[NSSet initWithArray:](v13, "initWithArray:", v14);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    +[Location insertLocations:forSource:inDatabase:]( &OBJC_CLASS___Location,  "insertLocations:forSource:inDatabase:",  v15,  v12,  v16);
  }
}

- (void)updateBackgroundColorWithPass:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 displayProfile]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v8 backgroundColor]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 string]);
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v5, @"background_color");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 secondaryBackgroundColor]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 string]);
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v7, @"secondary_background_color");
}

- (void)updateTallCodeValueWithPass:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 displayProfile]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 tallCode]));
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"tall_code");
}

- (void)updateWithNFCPayload:(id)a3
{
  id v11 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NFC anyInDatabase:forPassPID:]( &OBJC_CLASS___NFC,  "anyInDatabase:forPassPID:",  v4,  -[SQLiteEntity persistentID](self, "persistentID")));

  unsigned int v6 = -[Pass supportsIssuerBinding](self, "supportsIssuerBinding");
  else {
    uint64_t v7 = 0LL;
  }
  if (((v5 == 0LL) & v6) == 0 && v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 nfcPayload]);
    uint64_t v7 = (uint64_t)[v8 payloadState];
  }

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[NFC deleteEntitiesForPass:inDatabase:](&OBJC_CLASS___NFC, "deleteEntitiesForPass:inDatabase:", self, v9);

  if (v11)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    +[NFC insertOrUpdateNFCPayload:forPass:computedPayloadState:inDatabase:]( &OBJC_CLASS___NFC,  "insertOrUpdateNFCPayload:forPass:computedPayloadState:inDatabase:",  v11,  self,  v7,  v10);
  }
}

- (void)updateWithRelevantDates:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[SQLiteEntity persistentID](self, "persistentID");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PassRelevancyDates deleteEntitiesForPassPID:inDatabase:]( &OBJC_CLASS___PassRelevancyDates,  "deleteEntitiesForPassPID:inDatabase:",  v5,  v6);

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PassRelevancyDates insertPassRelevancyDates:forPassPID:inDatabase:]( &OBJC_CLASS___PassRelevancyDates,  "insertPassRelevancyDates:forPassPID:inDatabase:",  v4,  v5,  v7);
}

- (void)updateWithBeacons:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[Beacon deleteEntitiesForPass:inDatabase:](&OBJC_CLASS___Beacon, "deleteEntitiesForPass:inDatabase:", self, v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[Beacon insertBeacons:forPass:inDatabase:](&OBJC_CLASS___Beacon, "insertBeacons:forPass:inDatabase:", v4, self, v6);
}

- (void)_updateWithWebService:(id)a3
{
  id v4 = (id)_SQLValueForEntity(a3, a2);
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"web_service_pid");
}

- (void)updateWithPaymentApplications:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PaymentApplication updatePaymentApplications:forPass:inDatabase:]( &OBJC_CLASS___PaymentApplication,  "updatePaymentApplications:forPass:inDatabase:",  v4,  self,  v5);
}

- (id)_updatePassTileDescriptor:(id)a3 groupDescriptor:(id)a4 idx:(unint64_t)a5 previousStates:(id)a6 visitedIdentifiers:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 metadata]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
  if (!v17
    || ([v15 containsObject:v17] & 1) != 0
    || (unsigned __int8 v18 = [v16 isGroupType], v13) && (v18 & 1) != 0)
  {
    id v19 = 0LL;
  }

  else
  {
    [v15 addObject:v17];
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v17]);
    id v22 = [v16 type];
    if (!v21 || [v21 type] != v22)
    {
      id v23 = -[PKPassTileDescriptorState initForType:]( objc_alloc(&OBJC_CLASS___PKPassTileDescriptorState),  "initForType:",  v22);

      id v21 = v23;
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[TileDescriptor insertDescriptor:groupDescriptor:withState:order:forPass:inDatabase:]( &OBJC_CLASS___TileDescriptor,  "insertDescriptor:groupDescriptor:withState:order:forPass:inDatabase:",  v12,  v13,  v21,  a5,  self,  self->super._database));
  }

  return v19;
}

- (void)updateWithPassTileDescriptors:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[SQLiteEntity persistentID](self, "persistentID");
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TileDescriptorState statesInDatabase:forPassPID:]( &OBJC_CLASS___TileDescriptorState,  "statesInDatabase:forPassPID:",  self->super._database,  v5));
  +[TileDescriptor deleteEntitiesForPassPID:inDatabase:]( &OBJC_CLASS___TileDescriptor,  "deleteEntitiesForPassPID:inDatabase:",  v5,  self->super._database);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000B298C;
  v9[3] = &unk_10063FD58;
  v9[4] = self;
  id v10 = v6;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = v11;
  id v8 = v6;
  [v4 enumerateObjectsUsingBlock:v9];
}

- (void)updateWithSecureElementPassFields:(id)a3
{
  id v4 = a3;
  +[SecureElementPassField deleteSecureElementPassFieldsInDatabase:forPassPID:]( &OBJC_CLASS___SecureElementPassField,  "deleteSecureElementPassFieldsInDatabase:forPassPID:",  self->super._database,  -[SQLiteEntity persistentID](self, "persistentID"));
  id v14 = v4;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fieldsDictionary]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v15 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v15) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v9]);
        if ([v10 count])
        {
          unint64_t v11 = 0LL;
          do
          {
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v11]);
            id v13 =  +[SecureElementPassField insertBalanceFieldUnit:forPass:passDictionaryKey:order:inDatabase:]( &OBJC_CLASS___SecureElementPassField,  "insertBalanceFieldUnit:forPass:passDictionaryKey:order:inDatabase:",  v12,  self,  v9,  v11,  self->super._database);

            ++v11;
          }

          while (v11 < (unint64_t)[v10 count]);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }
}

- (void)updateWithShareBundle:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int64_t v5 = -[SQLiteEntity persistentID](self, "persistentID");
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 shares]);
    +[PassShare mergeInShares:forPassPID:inDatabase:]( &OBJC_CLASS___PassShare,  "mergeInShares:forPassPID:inDatabase:",  v6,  v5,  self->super._database);

    id v7 = (id)objc_claimAutoreleasedReturnValue([v4 entitlements]);
    +[PassEntitlement insertOrUpdatePassEntitlements:forPassPID:inDatabase:]( &OBJC_CLASS___PassEntitlement,  "insertOrUpdatePassEntitlements:forPassPID:inDatabase:",  v7,  v5,  self->super._database);
  }

- (void)udpateWithIsCloudKitArchived:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"is_cloud_kit_archived");
}

- (void)udpateWithCloudKitMetadata:(id)a3
{
}

- (void)udpateWithIsCloudKitSecurelyArchived:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"is_cloud_kit_securely_archived");
}

- (void)udpateWithCloudKitSecureMetadata:(id)a3
{
}

- (void)updateWithDefaultPaymentApplication:(id)a3
{
  id v4 = (id)_SQLValueForEntity(a3, a2);
  -[SQLiteEntity setValue:forProperty:]( self,  "setValue:forProperty:",  v4,  @"pass_default_payment_application_pid");
}

- (void)updateWithTransactionSourcePID:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"transaction_source_pid");
}

- (void)updateWithAssociatedAccountIdentifier:(id)a3
{
}

- (void)_updateWithTransactionService:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[Pass passTransactionService](self, "passTransactionService"));
  if (v4)
  {
    int64_t v5 = v4;
    [v4 updateWithNotificationService:v8];
LABEL_5:

    id v6 = v8;
    goto LABEL_6;
  }

  id v6 = v8;
  if (v8)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[PassNotificationService insertPassNotificationServiceWithNotificationService:inDatabase:]( &OBJC_CLASS___PassNotificationService,  "insertPassNotificationServiceWithNotificationService:inDatabase:",  v8,  v7));

    -[Pass _updateWithPassTransactionService:](self, "_updateWithPassTransactionService:", v5);
    goto LABEL_5;
  }

- (void)_updateWithMessageService:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[Pass passMessageService](self, "passMessageService"));
  if (v4)
  {
    int64_t v5 = v4;
    [v4 updateWithNotificationService:v8];
LABEL_5:

    id v6 = v8;
    goto LABEL_6;
  }

  id v6 = v8;
  if (v8)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[PassNotificationService insertPassNotificationServiceWithNotificationService:inDatabase:]( &OBJC_CLASS___PassNotificationService,  "insertPassNotificationServiceWithNotificationService:inDatabase:",  v8,  v7));

    -[Pass _updateWithPassMessageService:](self, "_updateWithPassMessageService:", v5);
    goto LABEL_5;
  }

- (void)_updateWithPassTransactionService:(id)a3
{
  id v4 = (id)_SQLValueForEntity(a3, a2);
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"pass_transaction_service_pid");
}

- (void)_updateWithPassMessageService:(id)a3
{
  id v4 = (id)_SQLValueForEntity(a3, a2);
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"pass_message_service_pid");
}

- (void)_updateSortingStateIfNecessary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[Pass uniqueID](self, "uniqueID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[PassAnnotations anyInDatabase:withPassID:]( &OBJC_CLASS___PassAnnotations,  "anyInDatabase:withPassID:",  v4,  v3));

  if (v5 && [v5 sortingState] == (id)1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[Pass pass](self, "pass"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 expirationDate]);

    if (v7) {
      unsigned int v8 = [v6 isExpired];
    }
    else {
      unsigned int v8 = [v6 isPastRelevancy];
    }
    unsigned int v9 = v8;
    if ([v6 isExpired] && objc_msgSend(v6, "passType") == (id)1)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 secureElementPass]);
      [v10 passActivationState];
    }

    if ((([v6 isVoided] | v9) & 1) == 0
      && ([v6 isExpiredBasedOnSigningDate] & 1) == 0)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Un-archiving updated pass with unique id:%@ since it no longer qualifies for the expired section",  (uint8_t *)&v13,  0xCu);
      }

      [v5 updateSortingState:0];
    }
  }
}

- (void)updateWithSortingState:(int64_t)a3 forSortingReason:(int64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[Pass uniqueID](self, "uniqueID"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[PassAnnotations anyInDatabase:withPassID:]( &OBJC_CLASS___PassAnnotations,  "anyInDatabase:withPassID:",  v7,  v8));

  if ((PKExpiredPassesDisabledByUser() & 1) != 0)
  {
    if (a3 == 1) {
      a3 = 3LL;
    }
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        else {
          int v13 = *(&off_100640B20 + a4 - 1);
        }
        int v24 = 134218498;
        int64_t v25 = a3;
        __int16 v26 = 2112;
        int64_t v27 = (int64_t)v13;
        __int16 v28 = 2048;
        uint64_t v29 = 1LL;
LABEL_22:
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Updating sorting state to: %ld with existing annotations for sorting reason: %@ (PKExpiredPassesDisabledByUser:%ld)",  (uint8_t *)&v24,  0x20u);
        goto LABEL_23;
      }

      goto LABEL_23;
    }

    if (v12)
    {
      uint64_t v17 = objc_claimAutoreleasedReturnValue(-[Pass uniqueID](self, "uniqueID"));
      __int128 v18 = (void *)v17;
      else {
        __int128 v19 = *(&off_100640B20 + a4 - 1);
      }
      int v24 = 138413058;
      int64_t v25 = v17;
      __int16 v26 = 2048;
      int64_t v27 = a3;
      __int16 v28 = 2112;
      uint64_t v29 = (uint64_t)v19;
      __int16 v30 = 2048;
      uint64_t v31 = 1LL;
LABEL_28:
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "No annotations found for pass with id:%@ creating new annotations with sorting state: %ld for sorting reason: %@ (PKExpiredPassesDisabledByUser:%ld)",  (uint8_t *)&v24,  0x2Au);

      goto LABEL_29;
    }

    goto LABEL_29;
  }

  uint64_t v14 = PKLogFacilityTypeGetObject(0LL);
  unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v15 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v15)
    {
      uint64_t v20 = objc_claimAutoreleasedReturnValue(-[Pass uniqueID](self, "uniqueID"));
      __int128 v18 = (void *)v20;
      else {
        id v21 = *(&off_100640B20 + a4 - 1);
      }
      int v24 = 138413058;
      int64_t v25 = v20;
      __int16 v26 = 2048;
      int64_t v27 = a3;
      __int16 v28 = 2112;
      uint64_t v29 = (uint64_t)v21;
      __int16 v30 = 2048;
      uint64_t v31 = 0LL;
      goto LABEL_28;
    }

- (void)updateWithAssociatedApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[AssociatedApplicationIdentifier deleteEntitiesForPass:inDatabase:]( &OBJC_CLASS___AssociatedApplicationIdentifier,  "deleteEntitiesForPass:inDatabase:",  self,  v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[AssociatedApplicationIdentifier insertAssociatedApplicationIdentifiers:forPass:inDatabase:]( &OBJC_CLASS___AssociatedApplicationIdentifier,  "insertAssociatedApplicationIdentifiers:forPass:inDatabase:",  v4,  self,  v6);
}

- (void)updateWithAssociatedPassTypeIdentifiers:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[AssociatedPassTypeIdentifier deleteEntitiesForPass:inDatabase:]( &OBJC_CLASS___AssociatedPassTypeIdentifier,  "deleteEntitiesForPass:inDatabase:",  self,  v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[AssociatedPassTypeIdentifier insertAssociatedPassTypeIdentifiers:forPass:inDatabase:]( &OBJC_CLASS___AssociatedPassTypeIdentifier,  "insertAssociatedPassTypeIdentifiers:forPass:inDatabase:",  v4,  self,  v6);
}

- (void)updateWithAssociatedWebDomains:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[AssociatedWebDomain deleteEntitiesForPass:inDatabase:]( &OBJC_CLASS___AssociatedWebDomain,  "deleteEntitiesForPass:inDatabase:",  self,  v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[AssociatedWebDomain insertAssociatedWebDomains:forPass:inDatabase:]( &OBJC_CLASS___AssociatedWebDomain,  "insertAssociatedWebDomains:forPass:inDatabase:",  v4,  self,  v6);
}

- (void)updateWithGroup:(id)a3
{
  id v4 = (id)_SQLValueForEntity(a3, a2);
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"group_pid");
}

- (void)updateWithRevocationStatus:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"revoked");
}

- (void)updateWithIngestedDate:(id)a3
{
}

- (void)updateWithDaemonPassData:(id)a3
{
  id v10 = a3;
  if ((id)-[Pass passFlavor](self, "passFlavor") == (id)1)
  {
    uint64_t v4 = sub_100016B5C((uint64_t)v10);
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[Pass updateWithPassTileDescriptors:](self, "updateWithPassTileDescriptors:", v5);

    uint64_t v6 = sub_100016B68((uint64_t)v10);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[Pass updateWithSecureElementPassFields:](self, "updateWithSecureElementPassFields:", v7);

    uint64_t v8 = sub_100016B74((uint64_t)v10);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[Pass updateWithShareBundle:](self, "updateWithShareBundle:", v9);
  }
}

- (void)updateWithSupportsIssuerBinding:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"supports_issuer_binding");
}

- (void)updateWithProvisioningMetadata:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int64_t v5 = -[SQLiteEntity persistentID](self, "persistentID");
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    +[PassProvisioningMetadata insertOrUpdateProvisioningMetadata:forPassPID:inDatabase:]( &OBJC_CLASS___PassProvisioningMetadata,  "insertOrUpdateProvisioningMetadata:forPassPID:inDatabase:",  v4,  v5,  v6);
  }

- (void)updateWithPassDisplayProfile:(id)a3
{
  if (a3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[Pass _updateDictionaryWithDisplayProfile:](&OBJC_CLASS___Pass, "_updateDictionaryWithDisplayProfile:"));
    -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
  }

- (void)updateWithContactlessActivationGroupingType:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[SQLiteEntity setValue:forProperty:]( self,  "setValue:forProperty:",  v4,  @"contactless_activation_grouping_type");
}

+ (id)_dynamicStateInDatabase:(id)a3 forPassPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithPersistentID:a4 inDatabase:v6];
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___PassDynamicState);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[PassLiveRender passLiveRenderInDatabase:forPass:]( &OBJC_CLASS___PassLiveRender,  "passLiveRenderInDatabase:forPass:",  v6,  v7));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 passLiveRender]);
  -[PassDynamicState setLiveRender:](v8, "setLiveRender:", v10);

  unint64_t v11 = objc_alloc(&OBJC_CLASS___PKPassBalanceModel);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentBalance paymentBalancesInDatabase:forPass:]( &OBJC_CLASS___PaymentBalance,  "paymentBalancesInDatabase:forPass:",  v6,  v7));
  int v13 = -[PKPassBalanceModel initWithBalances:](v11, "initWithBalances:", v12);
  -[PassDynamicState setBalanceModel:](v8, "setBalanceModel:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[PassRelevancyModel passRelevancyModelInDatabase:forPass:]( &OBJC_CLASS___PassRelevancyModel,  "passRelevancyModelInDatabase:forPass:",  v6,  v7));
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 passRelevancyModel]);
  -[PassDynamicState setRelevancyModel:](v8, "setRelevancyModel:", v15);

  return v8;
}

+ (id)dynamicStateInDatabase:(id)a3 forPassUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_autoreleasePoolPush();
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForUniqueID:v7]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _realPassPredicateForPredicate:v9]);

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v10]);
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_1000B3C7C;
  id v23 = sub_1000B3C8C;
  id v24 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000B3C94;
  v15[3] = &unk_10063FD80;
  uint64_t v17 = &v19;
  id v18 = a1;
  id v12 = v6;
  id v16 = v12;
  [v11 enumeratePersistentIDsAndProperties:&__NSArray0__struct usingBlock:v15];
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  objc_autoreleasePoolPop(v8);

  return v13;
}

+ (id)dynamicStatesInDatabase:(id)a3 forPassUniqueIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_autoreleasePoolPush();
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForUniqueIDs:v7]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _realPassPredicateForPredicate:v9]);

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v10]);
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v22 = @"unique_id";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000B3E6C;
  v18[3] = &unk_100639BF0;
  uint64_t v19 = v12;
  id v21 = a1;
  id v14 = v6;
  id v20 = v14;
  BOOL v15 = v12;
  [v11 enumeratePersistentIDsAndProperties:v13 usingBlock:v18];

  id v16 = -[NSMutableDictionary copy](v15, "copy");
  objc_autoreleasePoolPop(v8);

  return v16;
}

+ (id)_realPassPredicateForPredicate:(id)a3
{
  id v4 = a3;
  int64_t v5 = v4;
  if (v4)
  {
    v10[0] = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForValidStyle]);
    v10[1] = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForValidStyle]);
  }

  return v8;
}

+ (id)_realPassesInDatabase:(id)a3 states:(id *)a4 predicate:(id)a5 orderedBy:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  context = objc_autoreleasePoolPush();
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _realPassPredicateForPredicate:v12]);

  uint64_t v29 = v11;
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v14 orderingProperties:v11]);
  unsigned __int8 v16 = +[PKSecureElement isInFailForward](&OBJC_CLASS___PKSecureElement, "isInFailForward");
  uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if (a4) {
    id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  else {
    id v18 = 0LL;
  }
  id v19 = [a1 _copyPropertiesForPass];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000B41CC;
  v30[3] = &unk_10063FDA8;
  id v20 = v17;
  uint64_t v31 = v20;
  id v35 = a1;
  id v21 = v10;
  id v32 = v21;
  unsigned __int8 v36 = v16;
  id v22 = v13;
  v33 = v22;
  id v23 = v18;
  v34 = v23;
  [v15 enumeratePersistentIDsAndProperties:v19 usingBlock:v30];

  if (a4)
  {
    id v24 = -[NSMutableDictionary copy](v23, "copy");
    id v25 = *a4;
    *a4 = v24;
  }

  objc_autoreleasePoolPop(context);
  id v26 = -[NSMutableArray copy](v22, "copy");

  return v26;
}

- (id)_realPass
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = sub_1000B3C7C;
  id v13 = sub_1000B3C8C;
  id v14 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"template"));
  uint64_t v4 = (uint64_t)[v3 integerValue];

  if (v4 <= 11)
  {
    id v5 = +[Pass _copyPropertiesForPass](&OBJC_CLASS___Pass, "_copyPropertiesForPass");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000B4438;
    v8[3] = &unk_10063FDD0;
    v8[4] = self;
    v8[5] = &v9;
    -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v8);
  }

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (id)passesInDatabase:(id)a3 matchingPredicate:(id)a4
{
  return [a1 passesInDatabase:a3 states:0 matchingPredicate:a4];
}

+ (id)passesInDatabase:(id)a3 states:(id *)a4 matchingPredicate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_autoreleasePoolPush();
  uint64_t v11 = objc_alloc(&OBJC_CLASS___NSSet);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _realPassesInDatabase:v8 states:a4 predicate:v9 orderedBy:0]);
  id v13 = -[NSSet initWithArray:](v11, "initWithArray:", v12);

  objc_autoreleasePoolPop(v10);
  return v13;
}

+ (id)passUniqueIDsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _realPassPredicateForPredicate:a4]);
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);
  uint64_t v17 = @"unique_id";
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000B469C;
  v15[3] = &unk_10063C0D0;
  unsigned __int8 v16 = v9;
  id v12 = v9;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v15];

  id v13 = -[NSMutableSet copy](v12, "copy");
  objc_autoreleasePoolPop(v7);

  return v13;
}

+ (id)passStylesInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForValidStyle]);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v8 = objc_alloc_init(&OBJC_CLASS___SQLiteQueryDescriptor);
  -[SQLiteQueryDescriptor setEntityClass:](v8, "setEntityClass:", a1);
  -[SQLiteQueryDescriptor setPredicate:](v8, "setPredicate:", v6);
  -[SQLiteQueryDescriptor setReturnsDistinctEntities:](v8, "setReturnsDistinctEntities:", 1LL);
  id v9 = -[SQLiteQuery initWithDatabase:descriptor:]( objc_alloc(&OBJC_CLASS___SQLiteQuery),  "initWithDatabase:descriptor:",  v4,  v8);
  unsigned __int8 v16 = @"template";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000B483C;
  v14[3] = &unk_10063D7F0;
  BOOL v15 = v7;
  uint64_t v11 = v7;
  -[SQLiteQuery enumerateProperties:usingBlock:](v9, "enumerateProperties:usingBlock:", v10, v14);

  id v12 = -[NSMutableSet copy](v11, "copy");
  objc_autoreleasePoolPop(v5);

  return v12;
}

+ (id)unexpiredPassStylesInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForValidStyle]);
  v20[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForInMainStack]);
  v20[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___SQLiteQueryDescriptor);
  -[SQLiteQueryDescriptor setEntityClass:](v11, "setEntityClass:", a1);
  -[SQLiteQueryDescriptor setPredicate:](v11, "setPredicate:", v9);
  -[SQLiteQueryDescriptor setReturnsDistinctEntities:](v11, "setReturnsDistinctEntities:", 1LL);
  id v12 = -[SQLiteQuery initWithDatabase:descriptor:]( objc_alloc(&OBJC_CLASS___SQLiteQuery),  "initWithDatabase:descriptor:",  v4,  v11);
  id v19 = @"template";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000B4A34;
  v17[3] = &unk_10063D7F0;
  id v18 = v10;
  id v14 = v10;
  -[SQLiteQuery enumerateProperties:usingBlock:](v12, "enumerateProperties:usingBlock:", v13, v17);

  id v15 = -[NSMutableSet copy](v14, "copy");
  objc_autoreleasePoolPop(v5);

  return v15;
}

+ (id)secureElementCardTypesInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v8 = objc_alloc_init(&OBJC_CLASS___SQLiteQueryDescriptor);
  -[SQLiteQueryDescriptor setEntityClass:](v8, "setEntityClass:", a1);
  -[SQLiteQueryDescriptor setPredicate:](v8, "setPredicate:", v6);
  -[SQLiteQueryDescriptor setReturnsDistinctEntities:](v8, "setReturnsDistinctEntities:", 1LL);
  id v9 = -[SQLiteQuery initWithDatabase:descriptor:]( objc_alloc(&OBJC_CLASS___SQLiteQuery),  "initWithDatabase:descriptor:",  v4,  v8);
  unsigned __int8 v16 = @"card_type";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000B4BD8;
  v14[3] = &unk_10063D7F0;
  id v15 = v7;
  uint64_t v11 = v7;
  -[SQLiteQuery enumerateProperties:usingBlock:](v9, "enumerateProperties:usingBlock:", v10, v14);

  id v12 = -[NSMutableSet copy](v11, "copy");
  objc_autoreleasePoolPop(v5);

  return v12;
}

+ (id)unexpiredSecureElementCardTypesInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForInMainStack]);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v8 = objc_alloc_init(&OBJC_CLASS___SQLiteQueryDescriptor);
  -[SQLiteQueryDescriptor setEntityClass:](v8, "setEntityClass:", a1);
  -[SQLiteQueryDescriptor setPredicate:](v8, "setPredicate:", v6);
  -[SQLiteQueryDescriptor setReturnsDistinctEntities:](v8, "setReturnsDistinctEntities:", 1LL);
  id v9 = -[SQLiteQuery initWithDatabase:descriptor:]( objc_alloc(&OBJC_CLASS___SQLiteQuery),  "initWithDatabase:descriptor:",  v4,  v8);
  unsigned __int8 v16 = @"card_type";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000B4D78;
  v14[3] = &unk_10063D7F0;
  id v15 = v7;
  uint64_t v11 = v7;
  -[SQLiteQuery enumerateProperties:usingBlock:](v9, "enumerateProperties:usingBlock:", v10, v14);

  id v12 = -[NSMutableSet copy](v11, "copy");
  objc_autoreleasePoolPop(v5);

  return v12;
}

+ (id)candidatePassesInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _realPassPredicateForPredicate:a4]);
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  uint64_t v17 = sub_1000B4E90;
  id v18 = &unk_10063FDF8;
  id v22 = a1;
  id v10 = v6;
  id v19 = v10;
  id v11 = v8;
  id v20 = v11;
  id v21 = v9;
  id v12 = v9;
  sub_1002CCC5C((uint64_t)v10, &v15);
  id v13 = -[NSMutableSet copy](v12, "copy", v15, v16, v17, v18);

  objc_autoreleasePoolPop(v7);
  return v13;
}

- (id)pass
{
  return -[Pass _realPass](self, "_realPass");
}

- (id)updateContext
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PDPassUpdateContext);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[Pass _propertySettersForUpdateContext](&OBJC_CLASS___Pass, "_propertySettersForUpdateContext"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  void v11[2] = sub_1000B5270;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)groupingProfile
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PDPassGroupingProfile);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[Pass _propertySettersForGroupingProfile](&OBJC_CLASS___Pass, "_propertySettersForGroupingProfile"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  uint64_t v17 = sub_1000B53D8;
  id v18 = &unk_100639EE8;
  id v19 = v4;
  id v6 = v3;
  id v20 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, &v15);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"pid", v15, v16, v17, v18));
  id v9 = [v8 longLongValue];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PassRelevancyDates relevancyDatesForPassPID:inDatabase:]( &OBJC_CLASS___PassRelevancyDates,  "relevancyDatesForPassPID:inDatabase:",  v9,  v10));
  -[PDPassGroupingProfile setRelevantDates:](v6, "setRelevantDates:", v11);

  id v12 = v20;
  id v13 = v6;

  return v13;
}

- (id)passType
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"pass_type_pid"));
  if (v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS___PassType);
    id v5 = [v3 longLongValue];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v7 = -[SQLiteEntity initWithPersistentID:inDatabase:](v4, "initWithPersistentID:inDatabase:", v5, v6);
  }

  else
  {
    id v7 = 0LL;
  }

  if (-[SQLiteEntity existsInDatabase](v7, "existsInDatabase")) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;

  return v9;
}

- (int64_t)passStyle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"pass_group.pass_style"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (unint64_t)passFlavor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"pass_flavor"));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)webService
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"web_service_pid"));
  if (v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS___WebService);
    id v5 = [v3 longLongValue];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v7 = -[SQLiteEntity initWithPersistentID:inDatabase:](v4, "initWithPersistentID:inDatabase:", v5, v6);
  }

  else
  {
    id v7 = 0LL;
  }

  if (-[SQLiteEntity existsInDatabase](v7, "existsInDatabase")) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;

  return v9;
}

- (id)transactionService
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[Pass passTransactionService](self, "passTransactionService"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 notificationService]);

  return v3;
}

- (id)messageService
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[Pass passMessageService](self, "passMessageService"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 notificationService]);

  return v3;
}

- (id)passTransactionService
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"pass_transaction_service_pid"));
  if (v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS___PassNotificationService);
    id v5 = [v3 longLongValue];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v7 = -[SQLiteEntity initWithPersistentID:inDatabase:](v4, "initWithPersistentID:inDatabase:", v5, v6);
  }

  else
  {
    id v7 = 0LL;
  }

  if (-[SQLiteEntity existsInDatabase](v7, "existsInDatabase")) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;

  return v9;
}

- (id)passMessageService
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"pass_message_service_pid"));
  if (v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS___PassNotificationService);
    id v5 = [v3 longLongValue];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v7 = -[SQLiteEntity initWithPersistentID:inDatabase:](v4, "initWithPersistentID:inDatabase:", v5, v6);
  }

  else
  {
    id v7 = 0LL;
  }

  if (-[SQLiteEntity existsInDatabase](v7, "existsInDatabase")) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;

  return v9;
}

- (id)passNotificationServiceForType:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[Pass passMessageService](self, "passMessageService"));
  }

  else if (a3)
  {
    id v3 = 0LL;
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[Pass passTransactionService](self, "passTransactionService"));
  }

  return v3;
}

- (id)group
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"group_pid"));
  if (v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS___Group);
    id v5 = [v3 longLongValue];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v7 = -[SQLiteEntity initWithPersistentID:inDatabase:](v4, "initWithPersistentID:inDatabase:", v5, v6);
  }

  else
  {
    id v7 = 0LL;
  }

  if (-[SQLiteEntity existsInDatabase](v7, "existsInDatabase")) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;

  return v9;
}

- (id)defaultPaymentApplication
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SQLiteEntity valueForProperty:]( self,  "valueForProperty:",  @"pass_default_payment_application_pid"));
  if (v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS___PaymentApplication);
    id v5 = [v3 longLongValue];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v7 = -[SQLiteEntity initWithPersistentID:inDatabase:](v4, "initWithPersistentID:inDatabase:", v5, v6);
  }

  else
  {
    id v7 = 0LL;
  }

  if (-[SQLiteEntity existsInDatabase](v7, "existsInDatabase")) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;

  return v9;
}

- (BOOL)revoked
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"revoked"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)voided
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"voided"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)uniqueID
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"unique_id");
}

- (id)serialNumber
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"serial_number");
}

- (id)authenticationToken
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"authentication_token");
}

- (BOOL)hasAssociatedPeerPaymentAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SQLiteEntity valueForProperty:]( self,  "valueForProperty:",  @"has_associated_peer_payment_account"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)associatedAccountIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"a");
}

- (unint64_t)associatedAccountFeatureIdentifier
{
  if (-[Pass hasAssociatedPeerPaymentAccount](self, "hasAssociatedPeerPaymentAccount")) {
    return 1LL;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[Pass associatedAccountIdentifier](self, "associatedAccountIdentifier"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[Account anyInDatabase:withIdentifier:]( &OBJC_CLASS___Account,  "anyInDatabase:withIdentifier:",  v5,  v4));

    if (v6) {
      id v3 = [v6 feature];
    }
    else {
      id v3 = 0LL;
    }
  }

  else
  {
    id v3 = 0LL;
  }

  return (unint64_t)v3;
}

- (id)primaryAccountIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"primary_account_identifier");
}

- (id)associatedPassTypeIdentifiers
{
  return +[AssociatedPassTypeIdentifier associatedPassTypeIdentifiersInDatabase:forPass:]( &OBJC_CLASS___AssociatedPassTypeIdentifier,  "associatedPassTypeIdentifiersInDatabase:forPass:",  self->super._database);
}

- (id)associatedApplicationIdentifiers
{
  return +[AssociatedApplicationIdentifier associatedApplicationIdentifiersInDatabase:forPass:]( &OBJC_CLASS___AssociatedApplicationIdentifier,  "associatedApplicationIdentifiersInDatabase:forPass:",  self->super._database);
}

- (BOOL)supportsIssuerBinding
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"supports_issuer_binding"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)displayProfile
{
  unsigned __int8 v3 = objc_alloc_init(&OBJC_CLASS___PKPassDisplayProfile);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[Pass _propertySettersForDisplayProfile](&OBJC_CLASS___Pass, "_propertySettersForDisplayProfile"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  void v11[2] = sub_1000B5C3C;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (void)getPushRegistrationStatus:(unint64_t *)a3 date:(id *)a4
{
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = sub_1000B3C7C;
  id v13 = sub_1000B3C8C;
  id v14 = 0LL;
  v18[0] = @"push_registration_status";
  v18[1] = @"push_registration_date";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B5DE4;
  v8[3] = &unk_10063FE20;
  v8[4] = &v15;
  v8[5] = &v9;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v8);

  if (a3) {
    *a3 = v16[3];
  }
  if (a4) {
    *a4 = (id) v10[5];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
}

- (id)transactionSourceIdentifier
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"transaction_source_pid"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransactionSource anyInDatabase:withPersistentID:]( TransactionSource,  "anyInDatabase:withPersistentID:",  v3,  [v4 longLongValue]));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  return v6;
}

- (id)expirationDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"expiration_date"));
  unsigned __int8 v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

- (int64_t)sortingState
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[PassAnnotations databaseTable](&OBJC_CLASS___PassAnnotations, "databaseTable"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  v3,  @"sorting_state"));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", v4));
  id v6 = [v5 integerValue];

  return (int64_t)v6;
}

- (id)signingDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"signing_date"));
  unsigned __int8 v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

+ (void)enumerateUpdateContextsForQuery:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForUpdateContext]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000B60F8;
  v12[3] = &unk_10063FE48;
  id v14 = v6;
  id v15 = a1;
  id v13 = v8;
  id v10 = v6;
  id v11 = v8;
  [v7 enumeratePersistentIDsAndProperties:v9 usingBlock:v12];
}

+ (void)enumerateOrganizationNamesForQuery:(id)a3 withHandler:(id)a4
{
  id v5 = a4;
  id v11 = @"organization_name";
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000B6274;
  v9[3] = &unk_10063E788;
  id v10 = v5;
  id v8 = v5;
  [v6 enumeratePersistentIDsAndProperties:v7 usingBlock:v9];
}

+ (void)enumeratePassesAndGroupingProfilesForQuery:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForGroupingProfile]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000B636C;
  v13[3] = &unk_10063FE70;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v17 = a1;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  [v12 enumeratePersistentIDsAndProperties:v9 usingBlock:v13];
}

+ (void)enumeratePassesForQuery:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue([a1 _propertySettersForGroupingProfile]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000B650C;
  v12[3] = &unk_10063FE98;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v10 enumeratePersistentIDsAndProperties:v8 usingBlock:v12];
}

+ (void)enumeratePassUniqueIDsAndTypesForQuery:(id)a3 withHandler:(id)a4
{
  id v5 = a4;
  v11[0] = @"unique_id";
  v11[1] = @"pass_flavor";
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000B6690;
  v9[3] = &unk_10063FEC0;
  id v10 = v5;
  id v8 = v5;
  [v6 enumerateProperties:v7 usingBlock:v9];
}

+ (void)enumeratePassSyncabilityPropertiesInDatabase:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:a3 predicate:0]);
  v12[0] = @"unique_id";
  v12[1] = @"pass_flavor";
  v12[2] = @"template";
  v12[3] = @"pass_type.identifier";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 4LL));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_1000B67F0;
  v10[3] = &unk_10063FEC0;
  id v11 = v6;
  id v9 = v6;
  [v7 enumerateProperties:v8 usingBlock:v10];
}

+ (id)anyInDatabase:(id)a3 withPersistentID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForPersistentID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForTransactionSourceWithPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForUniqueID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withReaderIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v13 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  }

  else
  {
    id v9 = 0LL;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForReaderIds:v9]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v10]);

  if (v8) {
  return v11;
  }
}

+ (id)anyInDatabase:(id)a3 withProvisioningCredentialHash:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForProvisioningCredentialHash:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withPassType:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForPassType:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withWebService:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForWebService:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withGroup:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForGroup:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withPassType:(id)a4 serialNumber:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForPassType:a4]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForSerialNumber:v8]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v10, v11, 0LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v13]);

  return v14;
}

+ (id)anyInDatabase:(id)a3 withWebService:(id)a4 serialNumber:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForWebService:a4]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForSerialNumber:v8]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v10, v11, 0LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v13]);

  return v14;
}

+ (id)anyInDatabase:(id)a3 withNotificationService:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForNotificationService:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForPaymentApplicationIdentifier:a4 withSecureElementIdentifier:a5]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  return v10;
}

+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForPaymentApplicationIdentifier:a4 withSecureElementIdentifiers:a5]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  return v10;
}

+ (id)anyInDatabase:(id)a3 withPrimaryAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForPrimaryAccountIdentifier:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withAssociatedAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForAssociatedAccountIdentifier:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v8]);

  if (v9)
  {
    id v10 = v9;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[Account anyInDatabase:withPreviousAccountIdentifier:]( &OBJC_CLASS___Account,  "anyInDatabase:withPreviousAccountIdentifier:",  v6,  v7));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 accountIdentifier]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForAssociatedAccountIdentifier:v12]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v13]);

    id v10 = v14;
    id v7 = (id)v12;
  }

  return v10;
}

+ (id)queryWithDatabase:(id)a3 passType:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForPassType:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)queryWithDatabase:(id)a3 group:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForGroup:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  return v8;
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](v2, "valueForProperty:", @"unique_id"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PassLocationSource queryWithDatabase:passPID:]( &OBJC_CLASS___PassLocationSource,  "queryWithDatabase:passPID:",  v2->super._database,  v3));
  [v5 deleteAllEntities];
  +[Beacon deleteEntitiesForPass:inDatabase:]( &OBJC_CLASS___Beacon,  "deleteEntitiesForPass:inDatabase:",  v2,  v2->super._database);
  +[NFC deleteEntitiesForPass:inDatabase:]( &OBJC_CLASS___NFC,  "deleteEntitiesForPass:inDatabase:",  v2,  v2->super._database);
  +[PaymentApplication deleteEntitiesForPass:inDatabase:]( &OBJC_CLASS___PaymentApplication,  "deleteEntitiesForPass:inDatabase:",  v2,  v2->super._database);
  +[PaymentMessage deleteEntitiesForPass:inDatabase:]( &OBJC_CLASS___PaymentMessage,  "deleteEntitiesForPass:inDatabase:",  v2,  v2->super._database);
  +[PaymentBalance deleteEntitiesForPass:inDatabase:]( &OBJC_CLASS___PaymentBalance,  "deleteEntitiesForPass:inDatabase:",  v2,  v2->super._database);
  +[PassAnnotations deleteEntitiesForPass:inDatabase:]( &OBJC_CLASS___PassAnnotations,  "deleteEntitiesForPass:inDatabase:",  v2,  v2->super._database);
  +[PassLiveRender deleteEntitiesForPass:inDatabase:]( &OBJC_CLASS___PassLiveRender,  "deleteEntitiesForPass:inDatabase:",  v2,  v2->super._database);
  +[PassRelevancyModel deleteEntitiesForPass:inDatabase:]( &OBJC_CLASS___PassRelevancyModel,  "deleteEntitiesForPass:inDatabase:",  v2,  v2->super._database);
  +[AssociatedApplicationIdentifier deleteEntitiesForPass:inDatabase:]( &OBJC_CLASS___AssociatedApplicationIdentifier,  "deleteEntitiesForPass:inDatabase:",  v2,  v2->super._database);
  +[AssociatedPassTypeIdentifier deleteEntitiesForPass:inDatabase:]( &OBJC_CLASS___AssociatedPassTypeIdentifier,  "deleteEntitiesForPass:inDatabase:",  v2,  v2->super._database);
  +[AssociatedWebDomain deleteEntitiesForPass:inDatabase:]( &OBJC_CLASS___AssociatedWebDomain,  "deleteEntitiesForPass:inDatabase:",  v2,  v2->super._database);
  +[ValueAddedServiceTransaction deleteEntitiesForPass:inDatabase:]( &OBJC_CLASS___ValueAddedServiceTransaction,  "deleteEntitiesForPass:inDatabase:",  v2,  v2->super._database);
  +[CategoryVisualizationMagnitude deleteAnyInDatabase:forPassUniqueID:]( &OBJC_CLASS___CategoryVisualizationMagnitude,  "deleteAnyInDatabase:forPassUniqueID:",  v2->super._database,  v4);
  +[BalanceReminder deleteAnyInDatabase:forPassIdentifier:]( &OBJC_CLASS___BalanceReminder,  "deleteAnyInDatabase:forPassIdentifier:",  v2->super._database,  v4);
  +[CommutePlanReminder deleteAnyInDatabase:forPassIdentifier:]( &OBJC_CLASS___CommutePlanReminder,  "deleteAnyInDatabase:forPassIdentifier:",  v2->super._database,  v4);
  +[TileDescriptor deleteEntitiesForPassPID:inDatabase:]( &OBJC_CLASS___TileDescriptor,  "deleteEntitiesForPassPID:inDatabase:",  v3,  v2->super._database);
  +[PassShare deletePassShareForPassPID:inDatabase:]( &OBJC_CLASS___PassShare,  "deletePassShareForPassPID:inDatabase:",  v3,  v2->super._database);
  +[PassEntitlement deletePassEntitlementForPassPID:inDatabase:]( &OBJC_CLASS___PassEntitlement,  "deletePassEntitlementForPassPID:inDatabase:",  v3,  v2->super._database);
  +[SecureElementPassField deleteSecureElementPassFieldsInDatabase:forPassPID:]( &OBJC_CLASS___SecureElementPassField,  "deleteSecureElementPassFieldsInDatabase:forPassPID:",  v2->super._database,  v3);
  +[PassAuxiliaryRegistrationRequirement deleteAuxiliaryRegistrationRequirementsForPassPID:inDatabase:]( &OBJC_CLASS___PassAuxiliaryRegistrationRequirement,  "deleteAuxiliaryRegistrationRequirementsForPassPID:inDatabase:",  v3,  v2->super._database);
  +[PaymentApplicationUsageSummary deleteUsageSummariesForPassUniqueIdentifier:inDatabase:]( &OBJC_CLASS___PaymentApplicationUsageSummary,  "deleteUsageSummariesForPassUniqueIdentifier:inDatabase:",  v4,  v2->super._database);
  +[PassProvisioningMetadata deleteProvisioningMetadataForPassPID:inDatabase:]( &OBJC_CLASS___PassProvisioningMetadata,  "deleteProvisioningMetadataForPassPID:inDatabase:",  v3,  v2->super._database);
  +[PassRelevancyDates deleteEntitiesForPassPID:inDatabase:]( &OBJC_CLASS___PassRelevancyDates,  "deleteEntitiesForPassPID:inDatabase:",  v3,  v2->super._database);
  +[PaymentRewardsBalance deleteRewardsBalanceForPass:inDatabase:]( &OBJC_CLASS___PaymentRewardsBalance,  "deleteRewardsBalanceForPass:inDatabase:",  v2,  v2->super._database);
  +[PaymentRewardsRedemption deleteRewardsRedemptionsForPass:inDatabase:]( &OBJC_CLASS___PaymentRewardsRedemption,  "deleteRewardsRedemptionsForPass:inDatabase:",  v2,  v2->super._database);
  +[PassEndpointMetadata deleteEntitiesForPassPID:inDatabase:]( &OBJC_CLASS___PassEndpointMetadata,  "deleteEntitiesForPassPID:inDatabase:",  v3,  v2->super._database);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[Pass passTransactionService](v2, "passTransactionService"));
  [v6 deleteFromDatabase];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[Pass passMessageService](v2, "passMessageService"));
  [v7 deleteFromDatabase];

  v9.receiver = v2;
  v9.super_class = (Class)&OBJC_CLASS___Pass;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v9, "deleteFromDatabase");

  return (char)v2;
}

+ (id)predicateForPersistentID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

+ (id)predicateForTransactionSourceWithPID:(unint64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"transaction_source_pid",  v3));

  return v4;
}

+ (id)predicateForHasAnyWebService
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"web_service_pid");
}

+ (id)predicateForHasValidNFCPayload
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"nfc.message"));
  if (PKNFCPassKeyOptional())
  {
    id v3 = v2;
  }

  else
  {
    v7[0] = v2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"nfc.encryption_public_key"));
    v7[1] = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));
    id v3 = (id)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v5));
  }

  return v3;
}

+ (id)predicateForNFCPayloadState:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"nfc.message"));
  v10[0] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"nfc.a",  v5));
  v10[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));

  return v8;
}

+ (id)predicateForWebService:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"web_service_pid",  v3));

  return v4;
}

+ (id)predicateForPaymentCardType:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"card_type",  v3));

  return v4;
}

+ (id)predicateForPassTypeIdentifierHash:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_type.identifier_hash",  a3);
}

+ (id)predicateForAssociatedPassTypeIdentifierHash:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"associated_pass_type_identifier.identifier_hash",  a3);
}

+ (id)predicateForNotificationService:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_notification_service.notification_service_pid",  v3));

  return v4;
}

+ (id)predicateForPaymentApplicationSecureElementIdentifiers:(id)a3
{
  return +[SQLiteCompoundPredicate predicateWithProperty:equalToValues:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateWithProperty:equalToValues:",  @"payment_application.seid",  a3);
}

+ (id)predicateForPaymentApplicationSecureElementIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.seid",  a3);
}

+ (id)predicateForPaymentApplicationState:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.state",  v3));

  return v4;
}

+ (id)predicateForPaymentApplicationStates:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
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
      objc_super v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.state",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v9),  (void)v13));
        [v4 addObject:v10];

        objc_super v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v4));
  return v11;
}

+ (id)predicateForPrimaryPaymentApplication:(BOOL)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", !a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.auxiliary_application",  v3));

  return v4;
}

+ (id)predicateForPaymentApplicationSupportsContactlessPayment:(BOOL)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.supports_contactless_payment",  v3));

  return v4;
}

+ (id)predicateForPaymentApplicationSupportsInAppPayment:(BOOL)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.supports_in_app_payment",  v3));

  return v4;
}

+ (id)predicateForPaymentApplicationNetworks:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"payment_application.payment_network_identifier",  a3);
}

+ (id)predicateForPaymentApplicationAppletDataFormatPrefix:(id)a3
{
  return +[SQLiteStringGlobPredicate predicateWithProperty:havingPrefix:]( &OBJC_CLASS___SQLiteStringGlobPredicate,  "predicateWithProperty:havingPrefix:",  @"payment_application.applet_data_format",  a3);
}

+ (id)predicateForPaymentType:(unint64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.payment_type",  v3));

  return v4;
}

+ (id)predicateForTCIs:(id)a3
{
  return +[SQLiteCompoundPredicate predicateWithProperty:equalToValues:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateWithProperty:equalToValues:",  @"payment_automatic_selection_criterion_tci.tci",  a3);
}

+ (id)predicateForReaderIds:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateWithProperty:equalToValues:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateWithProperty:equalToValues:",  @"payment_automatic_selection_criterion_reader_id.reader_id",  v3));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateWithProperty:equalToValues:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateWithProperty:equalToValues:",  @"associated_reader_id.reader_id",  v3));
    v9[0] = v4;
    v9[1] = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v6));
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v7;
}

+ (id)predicateForPaymentApplicationIdentifier:(id)a3 withSecureElementIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.aid",  a3));
  v11[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.seid",  v5));

  v11[1] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));
  return v9;
}

+ (id)predicateForPaymentApplicationIdentifier:(id)a3 withSecureElementIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.aid",  a3));
  v11[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateWithProperty:equalToValues:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateWithProperty:equalToValues:",  @"payment_application.seid",  v5));

  v11[1] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));
  return v9;
}

+ (id)predicateForPrimaryAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"primary_account_identifier",  a3);
}

+ (id)predicateForPassType:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_type_pid",  v3));

  return v4;
}

+ (id)predicateForGroup:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"group_pid",  v3));

  return v4;
}

+ (id)predicateForValidStyle
{
  return +[SQLiteComparisonPredicate predicateWithProperty:lessThanValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanValue:",  @"template",  &off_10068FC00);
}

+ (id)predicateForUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"unique_id",  a3);
}

+ (id)predicateForUniqueIDs:(id)a3
{
  return +[SQLiteCompoundPredicate predicateWithProperty:equalToValues:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateWithProperty:equalToValues:",  @"unique_id",  a3);
}

+ (id)predicateForProvisioningCredentialHash:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"provisioning_credential_hash",  a3);
}

+ (id)predicateForStyle:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"template",  v3));

  return v4;
}

+ (id)predicateForPassTypeIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_type.identifier",  a3);
}

+ (id)predicateForSerialNumber:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"serial_number",  a3);
}

+ (id)predicateForIssuerCountryCodes:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"issuer_country_code",  a3);
}

+ (id)predicateForIsCloudKitArchived:(BOOL)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"is_cloud_kit_archived",  &__kCFBooleanTrue));
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"is_cloud_kit_archived",  &__kCFBooleanFalse));
  v8[0] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"is_cloud_kit_archived"));
  v8[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v6));

  return v7;
}

+ (id)predicateForIsCloudKitSecurelyArchived:(BOOL)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"is_cloud_kit_securely_archived",  &__kCFBooleanTrue));
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"is_cloud_kit_securely_archived",  &__kCFBooleanFalse));
  v8[0] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"is_cloud_kit_securely_archived"));
  v8[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v6));

  return v7;
}

+ (id)predicateForIsRevoked:(BOOL)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"revoked",  &__kCFBooleanTrue));
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"revoked",  &__kCFBooleanFalse));
  v8[0] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"revoked"));
  v8[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v6));

  return v7;
}

+ (id)predicateForSupportsIssuerBinding:(BOOL)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"supports_issuer_binding",  v3));

  return v4;
}

+ (id)predicateForAssociatedAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)predicateForExpired
{
  return _[a1 _predicateForPassAnnotationState:1];
}

+ (id)predicateForStagedForExpiration
{
  return _[a1 _predicateForPassAnnotationState:3];
}

+ (id)predicateForInMainStack
{
  return _[a1 _predicateForPassAnnotationState:0];
}

+ (id)predicateForManuallyRecovered
{
  return _[a1 _predicateForPassAnnotationState:2];
}

+ (id)_predicateForPassAnnotationState:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PassAnnotations databaseTable](&OBJC_CLASS___PassAnnotations, "databaseTable"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  v4,  @"sorting_state"));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  v5,  v6));

  return v7;
}

+ (id)predicateForSupportsDefaultCardSelection:(BOOL)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"supports_default_card_selection",  v3));

  return v4;
}

+ (id)predicateForHasVPANID
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"payment_application.i");
}

+ (id)_realPassInDatabase:(id)a3 withProperties:(id)a4 values:(const void *)a5 fromPass:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  __int128 v13 = v12;
  if (!v12)
  {
    id v17 = 0LL;
    goto LABEL_19;
  }

  id v14 = [v12 persistentID];
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  id v16 = [v11 indexOfObject:@"pass_flavor"];
  if (v16 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v15) {
      goto LABEL_9;
    }
    goto LABEL_10;
  }

  id v18 = (id)a5[(void)v16];
  if (v18 == v15)
  {
LABEL_9:

    goto LABEL_10;
  }

  id v19 = v18;
  if (!v18)
  {
LABEL_10:
    id v21 = [v11 indexOfObject:@"pass_type.identifier"];
    if (v21 == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v22 = 0LL;
    }
    else {
      id v22 = (void *)a5[(void)v21];
    }
    id v19 = v22;
    if (v19 == v15)
    {

      id v19 = 0LL;
    }

    id v20 = (id)PKPassTypeForPassTypeIdentifier(v19);
    goto LABEL_16;
  }

  id v20 = [v18 integerValue];
LABEL_16:
  id v23 = v20;

  id v17 = objc_alloc_init((Class)+[PKPass classForPassType:](&OBJC_CLASS___PKPass, "classForPassType:", v23));
  [v17 setPassType:v23];
  id v24 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPass]);
  [a1 applyPropertySetters:v24 toObject:v17 withProperties:v11 values:a5];

  id v25 = objc_alloc_init(&OBJC_CLASS___PKPassDisplayProfile);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForDisplayProfile]);
  [a1 applyPropertySetters:v26 toObject:v25 withProperties:v11 values:a5];

  [v17 setDisplayProfile:v25];
  int64_t v27 = objc_autoreleasePoolPush();
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( +[Location locationsInDatabase:forPassPID:withSourceType:]( &OBJC_CLASS___Location,  "locationsInDatabase:forPassPID:withSourceType:",  v10,  v14,  0LL));
  [v17 setEmbeddedLocationsArray:v28];

  objc_autoreleasePoolPop(v27);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[Beacon beaconsInDatabase:forPassPID:]( &OBJC_CLASS___Beacon,  "beaconsInDatabase:forPassPID:",  v10,  v14));
  [v17 setEmbeddedBeacons:v29];

  __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NFC anyInDatabase:forPassPID:](&OBJC_CLASS___NFC, "anyInDatabase:forPassPID:", v10, v14));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 nfcPayload]);
  [v17 setNFCPayload:v31];

  id v32 = (void *)objc_claimAutoreleasedReturnValue( +[AssociatedPassTypeIdentifier associatedPassTypeIdentifiersInDatabase:forPassPID:]( &OBJC_CLASS___AssociatedPassTypeIdentifier,  "associatedPassTypeIdentifiersInDatabase:forPassPID:",  v10,  v14));
  [v17 setAssociatedPassTypeIdentifiers:v32];

  v33 = (void *)objc_claimAutoreleasedReturnValue( +[PassRelevancyDates relevancyDatesForPassPID:inDatabase:]( &OBJC_CLASS___PassRelevancyDates,  "relevancyDatesForPassPID:inDatabase:",  v14,  v10));
  [v17 setRelevantDates:v33];

  if (v23 == (id)1)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentApplication paymentApplicationsInDatabase:forPassPID:]( &OBJC_CLASS___PaymentApplication,  "paymentApplicationsInDatabase:forPassPID:",  v10,  v14));
    [v17 setPaymentApplications:v34];

    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[AssociatedApplicationIdentifier associatedApplicationIdentifiersInDatabase:forPassPID:]( &OBJC_CLASS___AssociatedApplicationIdentifier,  "associatedApplicationIdentifiersInDatabase:forPassPID:",  v10,  v14));
    [v17 setAssociatedApplicationIdentifiers:v35];

    unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue( +[AssociatedWebDomain associatedWebDomainsInDatabase:forPassPID:]( &OBJC_CLASS___AssociatedWebDomain,  "associatedWebDomainsInDatabase:forPassPID:",  v10,  v14));
    [v17 setAssociatedWebDomains:v36];

    objc_msgSend(v17, "setAssociatedAccountFeatureIdentifier:", objc_msgSend(v13, "associatedAccountFeatureIdentifier"));
    int v37 = (void *)objc_claimAutoreleasedReturnValue( +[PassProvisioningMetadata provisioningMetadataForPassPID:inDatabase:]( &OBJC_CLASS___PassProvisioningMetadata,  "provisioningMetadataForPassPID:inDatabase:",  v14,  v10));
    [v17 setProvisioningMetadata:v37];
  }

LABEL_19:
  return v17;
}

+ (id)_copyPropertiesForPass
{
  id v3 = objc_autoreleasePoolPush();
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPass]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  -[NSMutableSet addObjectsFromArray:](v4, "addObjectsFromArray:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForDisplayProfile]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  -[NSMutableSet addObjectsFromArray:](v4, "addObjectsFromArray:", v8);

  id v9 = -[NSMutableSet pk_arrayCopy](v4, "pk_arrayCopy");
  objc_autoreleasePoolPop(v3);
  return v9;
}

+ (id)_propertySettersForPass
{
  v3[0] = @"unique_id";
  v3[1] = @"transaction_source.identifier";
  v4[0] = &stru_10063FF00;
  v4[1] = &stru_10063FF20;
  v3[2] = @"pass_type.identifier";
  v3[3] = @"pass_type.team_identifier";
  v4[2] = &stru_10063FF40;
  v4[3] = &stru_10063FF60;
  v3[4] = @"serial_number";
  v3[5] = @"sequence_counter";
  v4[4] = &stru_10063FF80;
  v4[5] = &stru_10063FFA0;
  v3[6] = @"authentication_token";
  v3[7] = @"organization_name";
  v4[6] = &stru_10063FFC0;
  v4[7] = &stru_10063FFE0;
  v3[8] = @"expiration_date";
  v3[9] = @"voided";
  v4[8] = &stru_100640000;
  v4[9] = &stru_100640020;
  v3[10] = @"web_service.service_url";
  v3[11] = @"user_info";
  v4[10] = &stru_100640040;
  v4[11] = &stru_100640060;
  v3[12] = @"provisioning_credential_hash";
  v3[13] = @"manifest_hash";
  v4[12] = &stru_100640080;
  v4[13] = &stru_1006400A0;
  v3[14] = @"share_count";
  v3[15] = @"sharing_method";
  v4[14] = &stru_1006400C0;
  v4[15] = &stru_1006400E0;
  v3[16] = @"sharing_url";
  v3[17] = @"sharing_text";
  v4[16] = &stru_100640100;
  v4[17] = &stru_100640120;
  v3[18] = @"ingested_date";
  v3[19] = @"signing_date";
  v4[18] = &stru_100640140;
  v4[19] = &stru_100640160;
  v3[20] = @"modified_date";
  v3[21] = @"revoked";
  v4[20] = &stru_100640180;
  v4[21] = &stru_1006401A0;
  v3[22] = @"has_stored_value";
  v3[23] = @"live_render_background_type";
  v4[22] = &stru_1006401C0;
  v4[23] = &stru_1006401E0;
  v3[24] = @"f";
  v3[25] = @"b";
  v4[24] = &stru_100640200;
  v4[25] = &stru_100640220;
  v3[26] = @"live_rendering_requires_enablement";
  v3[27] = @"mute_ready_for_use_notification";
  v4[26] = &stru_100640240;
  v4[27] = &stru_100640260;
  v3[28] = @"pass_flavor";
  v3[29] = @"card_type";
  v4[28] = &stru_100640280;
  v4[29] = &stru_1006402A0;
  v3[30] = @"primary_account_identifier";
  v3[31] = @"primary_account_suffix";
  v4[30] = &stru_1006402C0;
  v4[31] = &stru_1006402E0;
  v3[32] = @"sanitized_pan";
  v3[33] = @"c";
  v4[32] = &stru_100640300;
  v4[33] = &stru_100640320;
  v3[34] = @"supports_dpan_notifications";
  v3[35] = @"supports_fpan_notifications";
  v4[34] = &stru_100640340;
  v4[35] = &stru_100640360;
  v3[36] = @"supports_default_card_selection";
  v3[37] = @"is_shell_pass";
  v4[36] = &stru_100640380;
  v4[37] = &stru_1006403A0;
  v3[38] = @"supports_serial_number_based_provisioning";
  v3[39] = @"requires_transfer_serial_number_based_provisioning";
  v4[38] = &stru_1006403C0;
  v4[39] = &stru_1006403E0;
  v3[40] = @"has_associated_peer_payment_account";
  v3[41] = @"a";
  v4[40] = &stru_100640400;
  v4[41] = &stru_100640420;
  v3[42] = @"contactless_activation_grouping_type";
  v3[43] = @"cobranded";
  v4[42] = &stru_100640440;
  v4[43] = &stru_100640460;
  v3[44] = @"issuer_country_code";
  v3[45] = @"d";
  v4[44] = &stru_100640480;
  v4[45] = &stru_1006404A0;
  v3[46] = @"g";
  v3[47] = @"e";
  v4[46] = &stru_1006404C0;
  v4[47] = &stru_1006404E0;
  v3[48] = @"is_cloud_kit_archived";
  v3[49] = @"cloud_kit_metadata";
  v4[48] = &stru_100640500;
  v4[49] = &stru_100640520;
  v3[50] = @"is_cloud_kit_securely_archived";
  v3[51] = @"cloud_kit_secure_metadata";
  v4[50] = &stru_100640540;
  v4[51] = &stru_100640560;
  v3[52] = @"shipping_address_seed";
  v3[53] = @"original_provisioning_date";
  v4[52] = &stru_100640580;
  v4[53] = &stru_1006405A0;
  v3[54] = @"transfer_url";
  v3[55] = @"sell_url";
  v4[54] = &stru_1006405C0;
  v4[55] = &stru_1006405E0;
  v3[56] = @"bag_policy_url";
  v3[57] = @"order_food_url";
  v4[56] = &stru_100640600;
  v4[57] = &stru_100640620;
  v3[58] = @"transit_information_url";
  v3[59] = @"parking_information_url";
  v4[58] = &stru_100640640;
  v4[59] = &stru_100640660;
  v3[60] = @"directions_information_url";
  v3[61] = @"merchandise_url";
  v4[60] = &stru_100640680;
  v4[61] = &stru_1006406A0;
  v3[62] = @"accessibility_url";
  v3[63] = @"purchase_parking_url";
  v4[62] = &stru_1006406C0;
  v4[63] = &stru_1006406E0;
  v3[64] = @"add_on_url";
  v4[64] = &stru_100640700;
  v3[65] = @"contact_venue_phone_number";
  v4[65] = &stru_100640720;
  v3[66] = @"contact_venue_email";
  v4[66] = &stru_100640740;
  v3[67] = @"contact_venue_website";
  v4[67] = &stru_100640760;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  68LL));
}

+ (id)_propertySettersForDisplayProfile
{
  v3[0] = @"template";
  v3[1] = @"background_color";
  v4[0] = &stru_1006407A0;
  v4[1] = &stru_1006407C0;
  v3[2] = @"secondary_background_color";
  v3[3] = @"foreground_color";
  v4[2] = &stru_1006407E0;
  v4[3] = &stru_100640800;
  v3[4] = @"label_color";
  v3[5] = @"strip_color";
  v4[4] = &stru_100640820;
  v4[5] = &stru_100640840;
  v3[6] = @"manifest_hash";
  v3[7] = @"tall_code";
  v4[6] = &stru_100640860;
  v4[7] = &stru_100640880;
  v3[8] = @"has_background_image";
  v3[9] = @"has_strip_image";
  v4[8] = &stru_1006408A0;
  v4[9] = &stru_1006408C0;
  v3[10] = @"supports_automatic_foreground_vibrancy";
  v3[11] = @"supports_automatic_label_vibrancy";
  v4[10] = &stru_1006408E0;
  v4[11] = &stru_100640900;
  v3[12] = @"suppress_header_darkening";
  v3[13] = @"footer_background_color";
  v4[12] = &stru_100640920;
  v4[13] = &stru_100640940;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  14LL));
}

+ (id)_propertySettersForUpdateContext
{
  v3[0] = @"unique_id";
  v3[1] = @"serial_number";
  v4[0] = &stru_100640980;
  v4[1] = &stru_1006409A0;
  v3[2] = @"authentication_token";
  v3[3] = @"last_modified_tag";
  v4[2] = &stru_1006409C0;
  v4[3] = &stru_1006409E0;
  v3[4] = @"modified_date";
  v3[5] = @"modified_source";
  v4[4] = &stru_100640A00;
  v4[5] = &stru_100640A20;
  v3[6] = @"manifest_hash";
  v4[6] = &stru_100640A40;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

+ (id)_propertySettersForGroupingProfile
{
  v3[0] = @"pass_type.identifier";
  v3[1] = @"grouping_id";
  v4[0] = &stru_100640A80;
  v4[1] = &stru_100640AA0;
  v3[2] = @"template";
  v3[3] = @"ingested_date";
  v4[2] = &stru_100640AC0;
  v4[3] = &stru_100640AE0;
  v3[4] = @"nfc.message";
  v4[4] = &stru_100640B00;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

@end