@interface DownloadsSession
- (BOOL)placeholderDownloadCanceledForPurchaseIdentifier:(int64_t)a3;
- (DownloadPipeline)pipeline;
- (DownloadPolicyManager)policyManager;
- (DownloadsSession)init;
- (DownloadsSession)initWithSessionDescriptor:(id)a3;
- (NSOrderedSet)activeDownloadIdentifiers;
- (SSSQLiteDatabase)database;
- (id)downloadForStoreDownload:(id)a3;
- (id)externalValuesForDownloadID:(int64_t)a3;
- (id)newEventDictionaryWithDownloadIdentifier:(int64_t)a3 assetIdentifier:(int64_t)a4;
- (id)placeholderDownloadForPurchase:(id)a3;
- (id)placeholderDownloadForPurchaseIdentifier:(int64_t)a3;
- (id)valueForExternalProperty:(id)a3 ofAssetID:(int64_t)a4;
- (id)valueForExternalProperty:(id)a3 ofDownloadID:(int64_t)a4;
- (void)dealloc;
@end

@implementation DownloadsSession

- (DownloadsSession)init
{
  return -[DownloadsSession initWithSessionDescriptor:](self, "initWithSessionDescriptor:", 0LL);
}

- (DownloadsSession)initWithSessionDescriptor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DownloadsSession;
  v4 = -[DownloadsSession init](&v6, "init");
  if (v4)
  {
    v4->_database = (SSSQLiteDatabase *)[a3 database];
    v4->_externalState = (ExternalDownloadState *)[a3 externalState];
    v4->_pipeline = (DownloadPipeline *)[a3 pipeline];
    v4->_policyManager = (DownloadPolicyManager *)[a3 policyManager];
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DownloadsSession;
  -[DownloadsSession dealloc](&v3, "dealloc");
}

- (NSOrderedSet)activeDownloadIdentifiers
{
  return 0LL;
}

- (id)downloadForStoreDownload:(id)a3
{
  id result = [a3 transactionIdentifier];
  if (result) {
    return +[DownloadEntity anyInDatabase:predicate:]( DownloadEntity,  "anyInDatabase:predicate:",  self->_database,  +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  +[NSArray arrayWithObjects:]( NSArray,  "arrayWithObjects:",  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"store_item_id",  [a3 itemIdentifier]),  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"store_transaction_id",  result),  0)));
  }
  return result;
}

- (id)externalValuesForDownloadID:(int64_t)a3
{
  return -[ExternalDownloadState externalValuesForDownloadID:](self->_externalState, "externalValuesForDownloadID:", a3);
}

- (id)newEventDictionaryWithDownloadIdentifier:(int64_t)a3 assetIdentifier:(int64_t)a4
{
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v8 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4);
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v8, SSEventKeyDownloadAssetIdentifier);
  v9 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3);
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v9, SSEventKeyDownloadIdentifier);
  v10 = -[DownloadAssetEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___DownloadAssetEntity),  "initWithPersistentID:inDatabase:",  a4,  self->_database);
  v25 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  @"bytes_total",  @"url",  0LL);
  v26 = v10;
  v11 = -[SSMemoryEntity initWithDatabaseEntity:properties:]( objc_alloc(&OBJC_CLASS___SSMemoryEntity),  "initWithDatabaseEntity:properties:",  v10,  v25);
  id v12 = -[SSMemoryEntity valueForProperty:](v11, "valueForProperty:", @"bytes_total");
  if (v12) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v12, SSEventKeySizeInBytes);
  }
  id v13 = -[SSMemoryEntity valueForProperty:](v11, "valueForProperty:", @"url");
  if (v13) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v13, SSEventKeyURLString);
  }
  v14 = -[DownloadEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___DownloadEntity),  "initWithPersistentID:inDatabase:",  a3,  self->_database);
  v15 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  @"is_automatic",  @"client_id",  @"is_restore",  @"kind",  0LL);
  v16 = -[SSMemoryEntity initWithDatabaseEntity:properties:]( objc_alloc(&OBJC_CLASS___SSMemoryEntity),  "initWithDatabaseEntity:properties:",  v14,  v15);
  uint64_t v17 = SSEventDownloadClassUserInitiated;
  if (objc_msgSend( -[SSMemoryEntity valueForProperty:](v16, "valueForProperty:", @"is_restore"),  "BOOLValue"))
  {
    v18 = (uint64_t *)&SSEventDownloadClassRestore;
LABEL_11:
    uint64_t v17 = *v18;
    v21 = v25;
    v20 = v26;
    goto LABEL_12;
  }

  id v19 = objc_msgSend( -[SSMemoryEntity valueForProperty:](v16, "valueForProperty:", @"is_automatic"),  "integerValue");
  if (v19 == (id)2)
  {
    v18 = (uint64_t *)&SSEventDownloadClassAutomaticUpdate;
    goto LABEL_11;
  }

  v21 = v25;
  v20 = v26;
  if (v19 == (id)1) {
    uint64_t v17 = SSEventDownloadClassAutomaticDownload;
  }
LABEL_12:
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v17, SSEventKeyDownloadClass);
  id v22 = -[SSMemoryEntity valueForProperty:](v16, "valueForProperty:", @"kind");
  if (v22) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v22, SSEventKeyDownloadKind);
  }
  id v23 = -[SSMemoryEntity valueForProperty:](v16, "valueForProperty:", @"client_id");
  if (v23) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v23, SSEventKeyClientIdentifier);
  }

  return v7;
}

- (BOOL)placeholderDownloadCanceledForPurchaseIdentifier:(int64_t)a3
{
  id v3 = objc_msgSend( -[DownloadsSession placeholderDownloadForPurchaseIdentifier:]( self,  "placeholderDownloadForPurchaseIdentifier:",  a3),  "valueForProperty:",  @"download_state.phase");
  return [v3 isEqualToString:SSDownloadPhaseCanceled];
}

- (id)placeholderDownloadForPurchase:(id)a3
{
  id v5 = [a3 valueForDownloadProperty:SSSQLEntityPropertyPersistentID];
  if (!v5) {
    return -[DownloadsSession placeholderDownloadForPurchaseIdentifier:]( self,  "placeholderDownloadForPurchaseIdentifier:",  [a3 uniqueIdentifier]);
  }
  id result =  -[DownloadEntity initWithPersistentID:inDatabase:]( [DownloadEntity alloc],  "initWithPersistentID:inDatabase:",  [v5 longLongValue],  self->_database);
  if (!result) {
    return -[DownloadsSession placeholderDownloadForPurchaseIdentifier:]( self,  "placeholderDownloadForPurchaseIdentifier:",  [a3 uniqueIdentifier]);
  }
  return result;
}

- (id)placeholderDownloadForPurchaseIdentifier:(int64_t)a3
{
  return +[DownloadEntity anyInDatabase:predicate:]( &OBJC_CLASS___DownloadEntity,  "anyInDatabase:predicate:",  self->_database,  +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"is_purchase",  1LL),  +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"purchase_id",  a3),  0LL)));
}

- (id)valueForExternalProperty:(id)a3 ofAssetID:(int64_t)a4
{
  if (![a3 isEqualToString:SSDownloadAssetExternalPropertySINFs]) {
    return -[ExternalDownloadState valueForExternalProperty:ofAssetID:]( self->_externalState,  "valueForExternalProperty:ofAssetID:",  a3,  a4);
  }
  v7 = -[DownloadAssetEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___DownloadAssetEntity),  "initWithPersistentID:inDatabase:",  a4,  self->_database);
  v8 = -[DownloadAssetEntity sinfs](v7, "sinfs");

  return v8;
}

- (id)valueForExternalProperty:(id)a3 ofDownloadID:(int64_t)a4
{
  if ([a3 isEqualToString:SSDownloadExternalPropertyRentalInformation])
  {
    v7 = -[DownloadEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___DownloadEntity),  "initWithPersistentID:inDatabase:",  a4,  self->_database);
    id v8 = -[DownloadEntity rentalInformation](v7, "rentalInformation");

    return v8;
  }

  if ([a3 isEqualToString:SSDownloadExternalPropertyPolicy])
  {
    v10 = -[DownloadEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___DownloadEntity),  "initWithPersistentID:inDatabase:",  a4,  self->_database);
    id v11 = -[DownloadEntity valueForProperty:](v10, "valueForProperty:", @"policy_id");
    if (v11)
    {
      id v12 = -[DownloadPolicyManager downloadPolicyForID:]( self->_policyManager,  "downloadPolicyForID:",  [v11 longLongValue]);
      uint64_t v25 = 0LL;
      id v13 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v12,  1LL,  &v25);
      if (v25)
      {
        id v14 = +[SSLogConfig sharedStoreServicesConfig](&OBJC_CLASS___SSLogConfig, "sharedStoreServicesConfig");
        if (!v14) {
          id v14 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v15 = [v14 shouldLog];
        else {
          LODWORD(v16) = v15;
        }
        uint64_t v17 = (os_log_s *)[v14 OSLogObject];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          uint64_t v16 = v16;
        }
        else {
          v16 &= 2u;
        }
        if ((_DWORD)v16)
        {
          uint64_t v18 = objc_opt_class(self);
          int v26 = 138543618;
          uint64_t v27 = v18;
          __int16 v28 = 2114;
          uint64_t v29 = v25;
          uint64_t v19 = _os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  16LL,  "%{public}@: Failed to archive policy. Error = %{public}@",  &v26,  22);
          if (v19)
          {
            v20 = (void *)v19;
            +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v19, 4LL);
            free(v20);
            SSFileLog(v14, @"%@");
          }
        }
      }
    }

    else
    {
      id v13 = 0LL;
    }

    return v13;
  }

  if (![a3 isEqualToString:SSDownloadExternalPropertyPolicySizeLimit])
  {
    id v13 = -[ExternalDownloadState valueForExternalProperty:ofDownloadID:]( self->_externalState,  "valueForExternalProperty:ofDownloadID:",  a3,  a4);
    if (!v13)
    {
      return 0LL;
    }

    return v13;
  }

  id v21 = -[DownloadPolicyManager overrideDownloadSizeLimitForDownloadIdentifier:]( self->_policyManager,  "overrideDownloadSizeLimitForDownloadIdentifier:",  a4);
  if (v21)
  {
    id v22 = [v21 longLongValue];
  }

  else
  {
    id v23 = -[DownloadEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___DownloadEntity),  "initWithPersistentID:inDatabase:",  a4,  self->_database);
    id v24 = -[DownloadEntity valueForProperty:](v23, "valueForProperty:", @"policy_id");
    if (v24) {
      id v22 = -[DownloadPolicyManager downloadSizeLimitForPolicyWithID:]( self->_policyManager,  "downloadSizeLimitForPolicyWithID:",  [v24 longLongValue]);
    }
    else {
      id v22 = (id)SSDownloadSizeLimitNoLimit;
    }
  }

  return +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v22);
}

- (SSSQLiteDatabase)database
{
  return self->_database;
}

- (DownloadPipeline)pipeline
{
  return self->_pipeline;
}

- (DownloadPolicyManager)policyManager
{
  return self->_policyManager;
}

@end