@interface DownloadEntity
+ (Class)memoryEntityClass;
+ (id)copyValueDictionaryWithMetadata:(id)a3;
+ (id)databasePropertyToGetClientProperty:(id)a3;
+ (id)databasePropertyToSetClientProperty:(id)a3;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)foreignDatabaseColumnForProperty:(id)a3;
+ (id)foreignDatabaseTableForProperty:(id)a3;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (id)joinClauseForProperty:(id)a3;
+ (void)initialize;
- (BOOL)_shouldSuppressDialogForError:(id)a3;
- (BOOL)deleteFromDatabase;
- (NSArray)allAssetCookies;
- (NSString)ITunesSafeGUID;
- (NSString)downloadKind;
- (id)_databaseAssetForAsset:(id)a3;
- (id)anyAssetForAssetType:(id)a3;
- (id)copyAdditionalMetadataForStoreDownload:(id)a3;
- (id)copyAssetsWithAssetType:(id)a3;
- (id)copyDownloadingIPodLibraryItem;
- (id)copyStoreDownloadMetadata;
- (id)failWithError:(id)a3;
- (id)finishWithFinalPhase:(id)a3;
- (id)rentalInformation;
- (id)retryDownload;
- (id)setAssetsUsingDownload:(id)a3;
- (int64_t)addPersistentDownloadsWithClientID:(id)a3 kind:(id)a4;
- (unint64_t)itemIdentifier;
- (void)_deleteTransaction;
- (void)_resetAssetProperty:(id)a3;
- (void)deleteScratchDirectory;
- (void)resetAssetLocalPaths;
- (void)resetAssetURLs;
@end

@implementation DownloadEntity

+ (id)copyValueDictionaryWithMetadata:(id)a3
{
  id v4 = [a3 newDownloadProperties];
  id v5 = [a1 copyDatabaseDictionaryToSetClientDictionary:v4];

  return v5;
}

- (int64_t)addPersistentDownloadsWithClientID:(id)a3 kind:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v25 = -[NSNumber initWithLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithLongLong:",  -[DownloadEntity persistentID](self, "persistentID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity database](self, "database"));
    id v22 = v6;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"download_kind",  v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[PersistentDownloadManagerKindEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PersistentDownloadManagerKindEntity,  "queryWithDatabase:predicate:",  v8));
    v36 = @"manager_id";
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100024210;
    v30[3] = &unk_10034B450;
    v10 = v7;
    v31 = v10;
    [v9 enumeratePersistentIDsAndProperties:&v36 count:1 usingBlock:v30];
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    obuint64_t j = v10;
    id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v35,  16LL);
    if (v11)
    {
      id v12 = v11;
      int64_t v13 = 0LL;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          v17 = -[PersistentDownloadManagerEntity initWithPersistentID:inDatabase:]( [PersistentDownloadManagerEntity alloc],  "initWithPersistentID:inDatabase:",  [v16 longLongValue],  v8);
          v34[0] = @"client_id";
          v34[1] = @"filters_external_downloads";
          uint64_t v32 = 0LL;
          id v33 = 0LL;
          -[PersistentDownloadManagerEntity getValues:forProperties:count:]( v17,  "getValues:forProperties:count:",  &v32,  v34,  2LL);
          if (![v33 BOOLValue] || objc_msgSend(v23, "isEqualToString:", v32))
          {
            v18 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  v25,  @"download_id",  v16,  @"manager_id",  0LL);

            ++v13;
          }

          for (uint64_t j = 1LL; j != -1; --j)
        }

        id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v35,  16LL);
      }

      while (v12);
    }

    else
    {
      int64_t v13 = 0LL;
    }

    id v6 = v22;
  }

  else
  {
    int64_t v13 = 0LL;
  }

  return v13;
}

- (NSArray)allAssetCookies
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSHTTPCookieStorage sharedHTTPCookieStorage]( &OBJC_CLASS___NSHTTPCookieStorage,  "sharedHTTPCookieStorage"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"download_id",  -[DownloadEntity persistentID](self, "persistentID")));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity database](self, "database"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadAssetEntity queryWithDatabase:predicate:]( &OBJC_CLASS___DownloadAssetEntity,  "queryWithDatabase:predicate:",  v6,  v5));

  v16 = @"url";
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000243B4;
  v13[3] = &unk_10034B478;
  id v14 = v4;
  id v8 = v3;
  id v15 = v8;
  id v9 = v4;
  [v7 enumeratePersistentIDsAndProperties:&v16 count:1 usingBlock:v13];
  v10 = v15;
  id v11 = v8;

  return (NSArray *)v11;
}

- (id)anyAssetForAssetType:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"download_id",  -[DownloadEntity persistentID](self, "persistentID")));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"asset_type",  v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v5, v6, 0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity database](self, "database"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadAssetEntity anyInDatabase:predicate:]( &OBJC_CLASS___DownloadAssetEntity,  "anyInDatabase:predicate:",  v9,  v8));

  return v10;
}

- (id)copyAdditionalMetadataForStoreDownload:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v6 = SSDownloadMetadataKeyPurchaseDate;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForMetadataKey:SSDownloadMetadataKeyPurchaseDate]);
  if (v7) {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v7, v6);
  }
  v21[0] = @"kind";
  v21[1] = @"store_account_id";
  v21[2] = @"store_account_name";
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v20 = 0LL;
  -[DownloadEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v18, v21, 3LL);
  if (v19)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountWithUniqueIdentifier:v19]);

    v10 = (NSMutableDictionary *)[v9 copyLockdownRepresentation];
    if (!v10)
    {
      v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v19, kSSLockdownKeyAccountDSPersonID);
    }

    uint64_t v11 = kSSLockdownKeyAccountID;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v10, "objectForKey:", kSSLockdownKeyAccountID));
    uint64_t v13 = v20;

    if (v12) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v13 == 0;
    }
    if (!v14) {
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v20, v11);
    }
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v10, SSDownloadMetadataKeyAccountInfo);
  }

  if (SSDownloadKindIsToneKind(v18))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity ITunesSafeGUID](self, "ITunesSafeGUID"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v15, SSDownloadMetadataKeyRingtoneGUID);
  }

  for (uint64_t i = 2LL; i != -1; --i)

  return v5;
}

- (id)copyAssetsWithAssetType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity database](self, "database"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"download_id",  -[DownloadEntity persistentID](self, "persistentID")));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"asset_type",  v4));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v7, v8, 0LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  v21 = @"asset_order";
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadAssetEntity queryWithDatabase:predicate:orderingProperties:]( &OBJC_CLASS___DownloadAssetEntity,  "queryWithDatabase:predicate:orderingProperties:",  v6,  v10,  v11));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100024A0C;
  v18[3] = &unk_10034B4B8;
  id v19 = v6;
  uint64_t v13 = v5;
  uint64_t v20 = v13;
  id v14 = v6;
  [v12 enumeratePersistentIDsUsingBlock:v18];
  id v15 = v20;
  v16 = v13;

  return v16;
}

- (id)copyDownloadingIPodLibraryItem
{
  v14[0] = @"is_restore";
  v14[1] = @"kind";
  v14[2] = @"library_id";
  id v11 = 0LL;
  uint64_t v12 = 0LL;
  id v13 = 0LL;
  -[DownloadEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v11, v14, 3LL);
  v3 = 0LL;
  if (SSDownloadKindIsMediaKind(v12))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity anyAssetForAssetType:](self, "anyAssetForAssetType:", SSDownloadAssetTypeMedia));
    v3 = (IPodLibraryItem *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"url"]);

    if (v3)
    {
      v3 = objc_alloc_init(&OBJC_CLASS___IPodLibraryItem);
      if (v13) {
        -[IPodLibraryItem setLibraryPersistentIdentifier:]( v3,  "setLibraryPersistentIdentifier:",  [v13 longLongValue]);
      }
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"protection_type"]);
      uint64_t v6 = v5;
      if (v5) {
        -[IPodLibraryItem setProtectionType:](v3, "setProtectionType:", [v5 integerValue]);
      }
      id v7 = -[DownloadEntity copyStoreDownloadMetadata](self, "copyStoreDownloadMetadata");
      -[IPodLibraryItem setItemMetadata:](v3, "setItemMetadata:", v7);
      id v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  -[DownloadEntity persistentID](self, "persistentID"));
      -[IPodLibraryItem setItemDownloadIdentifier:](v3, "setItemDownloadIdentifier:", v8);
    }
  }

  for (uint64_t i = 2LL; i != -1; --i)

  return v3;
}

- (id)copyStoreDownloadMetadata
{
  id v3 = -[DownloadEntity persistentID](self, "persistentID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity valueForProperty:](self, "valueForProperty:", @"kind"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[ScratchManager directoryPathForDownloadID:kind:createIfNeeded:]( &OBJC_CLASS___ScratchManager,  "directoryPathForDownloadID:kind:createIfNeeded:",  v3,  v4,  0LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"iTunesMetadata.plist"]);

  id v7 = -[StoreDownload initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___StoreDownload), "initWithContentsOfFile:", v6);
  if (!v7) {
    id v7 = -[StoreDownload initWithDownload:](objc_alloc(&OBJC_CLASS___StoreDownload), "initWithDownload:", self);
  }

  return v7;
}

- (NSString)downloadKind
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity valueForProperty:](self, "valueForProperty:", @"kind"));
  id v3 = v2;
  if (!v2) {
    v2 = (void *)SSDownloadKindOther;
  }
  id v4 = v2;

  return v4;
}

- (id)failWithError:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___DownloadsChangeset);
  v35[0] = @"bundle_id";
  v35[1] = @"client_id";
  v35[2] = @"is_restore";
  v35[3] = @"kind";
  v35[4] = @"is_private";
  v35[5] = @"title";
  v35[6] = @"transaction_id";
  v35[7] = @"suppress_error_dialogs";
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  -[DownloadEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v31, v35, 8LL);
  id v6 = -[DownloadEntity persistentID](self, "persistentID");
  if (!v4)
  {
    uint64_t v7 = SSError(SSErrorDomain, 100LL, 0LL, 0LL);
    id v4 = (id)objc_claimAutoreleasedReturnValue(v7);
  }

  ArchivableData = (void *)SSCodingCreateArchivableData(v4);
  uint64_t v9 = SSDownloadPhaseFailed;
  v29[0] = @"download_state.phase";
  v29[1] = @"download_state.download_error";
  v30[0] = SSDownloadPhaseFailed;
  v30[1] = ArchivableData;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
  -[DownloadEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v10);

  if (SSDownloadKindIsSoftwareKind(*((void *)&v32 + 1)))
  {
    id v11 = [(id)v34 longLongValue];
    uint64_t v12 = objc_alloc(&OBJC_CLASS___ApplicationHandle);
    id v13 = -[ApplicationHandle initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:]( v12,  "initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:",  v11,  v6,  (void)v31);
    -[DownloadsChangeset addFailedAppWithHandle:](v5, "addFailedAppWithHandle:", v13);
    +[ApplicationWorkspaceState incompleteNotificationForFailedDownload:bundleIdentifier:]( &OBJC_CLASS___ApplicationWorkspaceState,  "incompleteNotificationForFailedDownload:bundleIdentifier:",  v6,  (void)v31);
  }

  else
  {
    id v14 = objc_alloc(&OBJC_CLASS___NSOrderedSet);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v6));
    id v13 = -[NSOrderedSet initWithObjects:](v14, "initWithObjects:", v15, 0LL);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MicroPaymentQueue paymentQueue](&OBJC_CLASS___MicroPaymentQueue, "paymentQueue"));
    [v16 failDownloadsWithIdentifiers:v13];
  }

LABEL_8:
  id v17 = *((id *)&v32 + 1);
  if (SSDownloadKindIsBookToShimKind())
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    if ([v18 isEqualToString:SSErrorDomain])
    {
      id v19 = [v4 code];

      if (v19 == (id)150)
      {
        -[DownloadEntity deleteFromDatabase](self, "deleteFromDatabase");
        -[DownloadsChangeset addDownloadChangeTypes:](v5, "addDownloadChangeTypes:", 8LL);
        -[DownloadsChangeset addDownloadKind:](v5, "addDownloadKind:", v17);
        -[DownloadsChangeset addRemovedDownloadID:]( v5,  "addRemovedDownloadID:",  -[DownloadEntity persistentID](self, "persistentID"));
        goto LABEL_26;
      }
    }

    else
    {
    }
  }

  if (([(id)v33 BOOLValue] & 1) == 0
    && ([*((id *)&v32 + 1) isEqualToString:SSDownloadKindInAppContent] & 1) == 0)
  {
    -[DownloadEntity addPersistentDownloadsWithClientID:kind:]( self,  "addPersistentDownloadsWithClientID:kind:",  *((void *)&v31 + 1),  *((void *)&v32 + 1));
  }

  v27[0] = SSDownloadPropertyDownloadPhase;
  v27[1] = SSDownloadPropertyEncodedErrorData;
  v28[0] = v9;
  v28[1] = ArchivableData;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL));
  -[DownloadsChangeset setChangedDownloadProperties:](v5, "setChangedDownloadProperties:", v20);

  -[DownloadsChangeset addDownloadChangeTypes:](v5, "addDownloadChangeTypes:", 2LL);
  -[DownloadsChangeset addDownloadKind:](v5, "addDownloadKind:", *((void *)&v32 + 1));
  -[DownloadsChangeset addStatusChangedDownloadID:](v5, "addStatusChangedDownloadID:", v6);
  if (([*((id *)&v34 + 1) BOOLValue] & 1) == 0
    && ([(id)v32 BOOLValue] & 1) == 0
    && (SSDownloadKindIsSoftwareKind(*((void *)&v32 + 1)) & 1) == 0
    && !-[DownloadEntity _shouldSuppressDialogForError:](self, "_shouldSuppressDialogForError:", v4))
  {
    else {
      v21 = -[DownloadGenericError initWithError:](objc_alloc(&OBJC_CLASS___DownloadGenericError), "initWithError:", v4);
    }
    id v22 = v21;
    if (v21)
    {
      -[DownloadError addDownloadIdentifier:](v21, "addDownloadIdentifier:", v6);
      -[DownloadError setDownloadKind:](v22, "setDownloadKind:", *((void *)&v32 + 1));
      -[DownloadError setDownloadTitle:](v22, "setDownloadTitle:", *((void *)&v33 + 1));
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadErrorController sharedErrorController]( &OBJC_CLASS___DownloadErrorController,  "sharedErrorController"));
      [v23 showDownloadError:v22];
    }
  }

- (id)finishWithFinalPhase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___DownloadsChangeset);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity database](self, "database"));
  v38[0] = @"bundle_id";
  v38[1] = @"cancel_url";
  v38[2] = @"client_id";
  v38[3] = @"download_state.did_restore_data";
  v38[4] = @"is_restore";
  v38[5] = @"download_state.is_server_finished";
  v38[6] = @"kind";
  v38[7] = @"library_id";
  v38[8] = @"is_private";
  v38[9] = @"store_account_id";
  v38[10] = @"store_item_id";
  v38[11] = @"store_transaction_id";
  v38[12] = @"transaction_id";
  id v37 = 0LL;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  -[DownloadEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v31, v38, 13LL);
  if (SSDownloadKindIsMediaKind(v34))
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[DownloadEntity allAssetCookies](self, "allAssetCookies"));
    if ([v7 count]) {
      -[DownloadsChangeset addDeletedHTTPCookies:](v5, "addDeletedHTTPCookies:", v7);
    }
    unsigned int v8 = [v4 isEqualToString:SSDownloadPhaseCanceled];
    id v9 = -[DownloadEntity persistentID](self, "persistentID");
    if (v8) {
      -[DownloadsChangeset addCanceledIPodLibraryDownloadID:](v5, "addCanceledIPodLibraryDownloadID:", v9);
    }
    else {
      -[DownloadsChangeset addDeletedIPodLibraryDownloadID:](v5, "addDeletedIPodLibraryDownloadID:", v9);
    }
  }

  else
  {
    id v7 = (id)v31;
    if ([v7 length])
    {
      v10 = objc_alloc(&OBJC_CLASS___ApplicationHandle);
      id v11 = -[ApplicationHandle initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:]( v10,  "initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:",  [v37 longLongValue],  -[DownloadEntity persistentID](self, "persistentID"),  v7);
      if ([v4 isEqualToString:SSDownloadPhaseCanceled])
      {
        if ([(id)v33 BOOLValue]
          && ([*((id *)&v32 + 1) BOOLValue] & 1) == 0)
        {
          -[DownloadsChangeset addCanceledAppDataRestoreID:](v5, "addCanceledAppDataRestoreID:", v7);
        }

        if (([(id)v35 BOOLValue] & 1) == 0)
        {
          -[DownloadsChangeset addCanceledAppWithHandle:](v5, "addCanceledAppWithHandle:", v11);
          +[ApplicationWorkspaceState incompleteNotificationForCanceledDownload:bundleIdentifier:]( &OBJC_CLASS___ApplicationWorkspaceState,  "incompleteNotificationForCanceledDownload:bundleIdentifier:",  -[DownloadEntity persistentID](self, "persistentID"),  v7);
        }
      }

      else if (([(id)v35 BOOLValue] & 1) == 0)
      {
        -[DownloadsChangeset addFinishedAppWithHandle:](v5, "addFinishedAppWithHandle:", v11);
      }
    }
  }

LABEL_19:
  if ((void)v32)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"client_id"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"wake_up_on_finish",  1LL));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v13, v12, 0LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity database](self, "database"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[PersistentDownloadManagerEntity anyInDatabase:predicate:]( &OBJC_CLASS___PersistentDownloadManagerEntity,  "anyInDatabase:predicate:",  v16,  v15));

    if (v17)
    {
      uint64_t v18 = objc_alloc(&OBJC_CLASS___NSArray);
      id v19 = -[NSArray initWithObjects:](v18, "initWithObjects:", *((void *)&v34 + 1), 0LL);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[SSAppWakeRequest newsstandFinishRequestWithAppIdentifier:issueIdentifiers:]( &OBJC_CLASS___SSAppWakeRequest,  "newsstandFinishRequestWithAppIdentifier:issueIdentifiers:",  (void)v32,  v19));
      if (v20) {
        -[DownloadsChangeset addSSAppWakeRequest:](v5, "addSSAppWakeRequest:", v20);
      }
    }
  }

  if (![(id)v35 BOOLValue])
  {
    if ([(id)v34 isEqualToString:SSDownloadKindInAppContent])
    {
      id v21 = -[DownloadEntity persistentID](self, "persistentID");
    }

    else
    {
      uint64_t v23 = -[DownloadEntity addPersistentDownloadsWithClientID:kind:]( self,  "addPersistentDownloadsWithClientID:kind:",  (void)v32,  (void)v34);
      id v21 = -[DownloadEntity persistentID](self, "persistentID");
      if (v23 < 1) {
        goto LABEL_27;
      }
    }

    v24 = objc_alloc(&OBJC_CLASS___NSDictionary);
    v25 = -[NSDictionary initWithObjectsAndKeys:]( v24,  "initWithObjectsAndKeys:",  v4,  SSDownloadPropertyDownloadPhase,  0LL);
    -[DownloadEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"download_state.phase");
    -[DownloadsChangeset addDownloadChangeTypes:](v5, "addDownloadChangeTypes:", 10LL);
    -[DownloadsChangeset addRemovedPersistentDownloadID:](v5, "addRemovedPersistentDownloadID:", v21);
    -[DownloadsChangeset addStatusChangedDownloadID:](v5, "addStatusChangedDownloadID:", v21);
    -[DownloadsChangeset setChangedDownloadProperties:](v5, "setChangedDownloadProperties:", v25);

    int v22 = 1;
    goto LABEL_34;
  }

  id v21 = -[DownloadEntity persistentID](self, "persistentID");
LABEL_27:
  if (-[DownloadEntity deleteFromDatabase](self, "deleteFromDatabase"))
  {
    -[DownloadsChangeset addDownloadChangeTypes:](v5, "addDownloadChangeTypes:", 8LL);
    -[DownloadsChangeset addRemovedDownloadID:](v5, "addRemovedDownloadID:", v21);
  }

  int v22 = 0;
LABEL_34:
  -[DownloadsChangeset addDownloadKind:](v5, "addDownloadKind:", (void)v34);
  -[DownloadsChangeset addFinishedDownloadKind:](v5, "addFinishedDownloadKind:", (void)v34);
  -[DownloadsChangeset removeDownloadFromPipelineWithID:](v5, "removeDownloadFromPipelineWithID:", v21);
  if (*((void *)&v35 + 1) && ([*((id *)&v33 + 1) BOOLValue] & 1) == 0)
  {
    __int128 v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", *((void *)&v35 + 1), @"store_account_id");
    if ([v4 isEqualToString:SSDownloadPhaseCanceled])
    {
      if (*((void *)&v31 + 1)) {
        goto LABEL_42;
      }
    }

    else if ((void)v36 && *((void *)&v36 + 1))
    {
      -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:");
LABEL_42:
      -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:");
      __int128 v27 = -[FinishedDownloadEntity initWithPropertyValues:inDatabase:]( objc_alloc(&OBJC_CLASS___FinishedDownloadEntity),  "initWithPropertyValues:inDatabase:",  v26,  v6);
      if (v27)
      {
        if (v22)
        {
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
          -[DownloadEntity setValue:forProperty:]( self,  "setValue:forProperty:",  v28,  @"download_state.is_server_finished");
        }

        -[DownloadsChangeset addDownloadChangeTypes:](v5, "addDownloadChangeTypes:", 4LL);
      }
    }
  }

  for (uint64_t i = 12LL; i != -1; --i)

  return v5;
}

- (unint64_t)itemIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity valueForProperty:](self, "valueForProperty:", @"store_item_id"));
  unint64_t v3 = SSGetItemIdentifierFromValue();

  return v3;
}

- (NSString)ITunesSafeGUID
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llx",  -[DownloadEntity persistentID](self, "persistentID"));
}

- (id)rentalInformation
{
  id v2 = -[DownloadEntity copyStoreDownloadMetadata](self, "copyStoreDownloadMetadata");
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sinfs]);
  if (v3)
  {
    id v4 = -[DownloadDRM initWithSinfArray:](objc_alloc(&OBJC_CLASS___DownloadDRM), "initWithSinfArray:", v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadDRM sinfsArray](v4, "sinfsArray"));
    id v6 = [v5 copyValueForProperty:@"SinfPropertyRentalInformation" error:0];
LABEL_6:
    id v9 = v6;
    goto LABEL_7;
  }

  id v4 = (DownloadDRM *)objc_claimAutoreleasedReturnValue([v2 rentalID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);

  id v9 = 0LL;
  if (v4 && v5)
  {
    v10 = sub_100022CFC( (uint64_t)[v5 unsignedLongLongValue],  (uint64_t)-[DownloadDRM unsignedLongLongValue](v4, "unsignedLongLongValue"));
    id v6 = (id)objc_claimAutoreleasedReturnValue(v10);
    goto LABEL_6;
  }

- (void)resetAssetLocalPaths
{
}

- (void)resetAssetURLs
{
}

- (id)retryDownload
{
  unint64_t v3 = objc_alloc_init(&OBJC_CLASS___DownloadsChangeset);
  id v4 = -[DownloadEntity persistentID](self, "persistentID");
  -[DownloadsChangeset addDownloadToPipelineWithID:](v3, "addDownloadToPipelineWithID:", v4);
  v13[0] = @"bundle_id";
  v13[1] = @"kind";
  v13[2] = @"transaction_id";
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  id v12 = 0LL;
  -[DownloadEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v10, v13, 3LL);
  if (SSDownloadKindIsSoftwareKind(v11))
  {
    id v5 = objc_alloc(&OBJC_CLASS___ApplicationHandle);
    id v6 = [v12 longLongValue];
    id v7 = -[ApplicationHandle initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:]( v5,  "initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:",  v6,  v4,  v10);
    -[DownloadsChangeset addRetryAppWithHandle:](v3, "addRetryAppWithHandle:", v7);
  }

  for (uint64_t i = 2LL; i != -1; --i)

  return v3;
}

- (id)setAssetsUsingDownload:(id)a3
{
  id v4 = a3;
  __int128 v35 = objc_alloc_init(&OBJC_CLASS___DownloadsChangeset);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[DownloadEntity database](self, "database"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[DownloadEntity persistentID](self, "persistentID")));
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v33 = (void *)v5;
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"download_id",  v6));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadAssetEntity queryWithDatabase:predicate:]( &OBJC_CLASS___DownloadAssetEntity,  "queryWithDatabase:predicate:",  v5));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100025FF8;
  v44[3] = &unk_10034B548;
  id v9 = v7;
  v45 = v9;
  v30 = v8;
  [v8 enumeratePersistentIDsUsingBlock:v44];
  __int128 v32 = v4;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  obuint64_t j = (DownloadsChangeset *)(id)objc_claimAutoreleasedReturnValue([v4 assets]);
  id v10 = -[DownloadsChangeset countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v40,  v47,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        [v14 setValue:v6 forProperty:@"download_id"];
        uint64_t v15 = objc_claimAutoreleasedReturnValue(-[DownloadEntity _databaseAssetForAsset:](self, "_databaseAssetForAsset:", v14));
        if (v15)
        {
          uint64_t v16 = (DownloadAssetEntity *)v15;
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 propertyValues]);
          -[DownloadAssetEntity setValuesWithDictionary:](v16, "setValuesWithDictionary:", v17);
        }

        else
        {
          uint64_t v18 = objc_alloc(&OBJC_CLASS___DownloadAssetEntity);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 propertyValues]);
          uint64_t v16 = -[DownloadAssetEntity initWithPropertyValues:inDatabase:]( v18,  "initWithPropertyValues:inDatabase:",  v19,  v33);

          if (!v16)
          {
            uint64_t v22 = obj;
            goto LABEL_23;
          }
        }

        id v20 = -[DownloadAssetEntity copyStoreDownloadKeyCookie](v16, "copyStoreDownloadKeyCookie");
        if (v20) {
          -[DownloadsChangeset addHTTPCookie:](v35, "addHTTPCookie:", v20);
        }
        id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[DownloadAssetEntity persistentID](v16, "persistentID")));
        -[NSMutableSet removeObject:](v9, "removeObject:", v21);
      }

      id v11 = -[DownloadsChangeset countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v40,  v47,  16LL);
      if (v11) {
        continue;
      }
      break;
    }
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  uint64_t v22 = v9;
  id v23 = -[DownloadsChangeset countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v36,  v46,  16LL);
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v37;
LABEL_15:
    uint64_t v26 = 0LL;
    while (1)
    {
      if (*(void *)v37 != v25) {
        objc_enumerationMutation(v22);
      }
      __int128 v27 = -[DownloadAssetEntity initWithPersistentID:inDatabase:]( [DownloadAssetEntity alloc],  "initWithPersistentID:inDatabase:",  [*(id *)(*((void *)&v36 + 1) + 8 * v26) longLongValue],  v33);
      unsigned int v28 = -[DownloadAssetEntity deleteFromDatabase](v27, "deleteFromDatabase");

      if (!v28) {
        break;
      }
      if (v24 == (id)++v26)
      {
        id v24 = -[DownloadsChangeset countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v36,  v46,  16LL);
        if (v24) {
          goto LABEL_15;
        }
        goto LABEL_24;
      }
    }

+ (id)databasePropertyToGetClientProperty:(id)a3
{
  return [(id)qword_1003A3230 objectForKey:a3];
}

+ (id)databasePropertyToSetClientProperty:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1003A3238 objectForKey:v3]);
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue([(id)qword_1003A3230 objectForKey:v3]);
  }
  id v7 = v6;

  return v7;
}

+ (id)databaseTable
{
  return @"download";
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1003A3200 objectForKey:v4]);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }

  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___DownloadEntity;
    id v8 = objc_msgSendSuper2(&v11, "disambiguatedSQLForProperty:", v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v8);
  }

  id v9 = v7;

  return v9;
}

+ (id)foreignDatabaseColumnForProperty:(id)a3
{
  return [(id)qword_1003A3208 objectForKey:a3];
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  return [(id)qword_1003A3218 objectForKey:a3];
}

+ (id)foreignDatabaseTablesToDelete
{
  return (id)qword_1003A3220;
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  return [(id)qword_1003A3210 objectForKey:a3];
}

+ (id)joinClauseForProperty:(id)a3
{
  return [(id)qword_1003A3228 objectForKey:a3];
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___Download);
}

- (BOOL)deleteFromDatabase
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DownloadEntity;
  BOOL v3 = -[DownloadEntity deleteFromDatabase](&v9, "deleteFromDatabase");
  id v4 = -[DownloadEntity persistentID](self, "persistentID");
  -[DownloadEntity deleteScratchDirectory](self, "deleteScratchDirectory");
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100026264;
    v8[3] = &unk_10034B568;
    v8[4] = v4;
    id v6 = [v5 modifyExternalUsingTransactionBlock:v8];
  }

  return v3;
}

- (void)deleteScratchDirectory
{
  id v3 = -[DownloadEntity persistentID](self, "persistentID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity valueForProperty:](self, "valueForProperty:", @"kind"));
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[ScratchManager directoryPathForDownloadID:kind:createIfNeeded:]( &OBJC_CLASS___ScratchManager,  "directoryPathForDownloadID:kind:createIfNeeded:",  v3,  v4,  0LL));

  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  if (-[NSFileManager fileExistsAtPath:](v5, "fileExistsAtPath:", v6)) {
    -[NSFileManager removeItemAtPath:error:](v5, "removeItemAtPath:error:", v6, 0LL);
  }
}

- (id)_databaseAssetForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"asset_type"]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"download_id",  -[DownloadEntity persistentID](self, "persistentID")));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"asset_type",  v5));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"url"]);
    if (v8) {
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"url",  v8));
    }
    else {
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[SSSQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SSSQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"url"));
    }
    objc_super v11 = (void *)v9;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v6, v7, v9, 0LL));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity database](self, "database"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadAssetEntity anyInDatabase:predicate:]( &OBJC_CLASS___DownloadAssetEntity,  "anyInDatabase:predicate:",  v14,  v13));
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (void)_deleteTransaction
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity valueForProperty:](self, "valueForProperty:", @"transaction_id"));
  id v4 = [v3 longLongValue];

  uint64_t v5 = objc_alloc(&OBJC_CLASS___TransactionEntity);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity database](self, "database"));
  id v7 = -[TransactionEntity initWithPersistentID:inDatabase:](v5, "initWithPersistentID:inDatabase:", v4, v6);

  -[TransactionEntity deleteFromDatabase](v7, "deleteFromDatabase");
}

- (void)_resetAssetProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity database](self, "database"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"download_id",  -[DownloadEntity persistentID](self, "persistentID")));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadAssetEntity queryWithDatabase:predicate:]( &OBJC_CLASS___DownloadAssetEntity,  "queryWithDatabase:predicate:",  v5,  v6));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002666C;
  v10[3] = &unk_10034B4B8;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  [v7 enumeratePersistentIDsUsingBlock:v10];
}

- (BOOL)_shouldSuppressDialogForError:(id)a3
{
  return ISErrorIsEqual(a3, SSErrorDomain, 115LL);
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___DownloadEntity) == a1)
  {
    id v3 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"download_state.auto_update_state",  @"blocked_reason",  @"download_state.blocked_reason",  @"can_cancel",  @"download_state.can_cancel",  @"can_pause",  @"download_state.can_pause",  @"can_prioritize",  @"download_state.can_prioritize",  @"audit_token_data",  @"client.audit_token_data",  @"phase",  @"download_state.phase",  @"did_restore_data",  @"download_state.did_restore_data",  @"bundle_id",  @"application_id.bundle_id",  @"download_error",  @"download_state.download_error",  @"has_restore_data",  @"download_state.has_restore_data",  @"is_restricted",  @"download_state.is_restricted",  @"is_server_finished",  @"download_state.is_server_finished",  @"last_odr_action",  @"download_state.last_odr_action",  @"restore_data_size",  @"download_state.restore_data_size",  @"restore_state",  @"download_state.restore_state",  @"store_queue_refresh_count",  @"download_state.store_queue_refresh_count",  @"auto_update_state",  @"IFNULL(download_state.auto_update_state, 0)",  @"blocked_reason",  @"IFNULL(download_state.blocked_reason, 0)",  @"can_cancel",  @"IFNULL(download_state.can_cancel, 1)",  @"can_pause",  @"IFNULL(download_state.can_pause, 1)",  @"can_prioritize",  @"IFNULL(download_state.can_prioritize, 1)",  @"phase",  @"IFNULL(download_state.phase, SSDownloadPhaseWaiting)",  @"bundle_id",  @"IFNULL(application_id.bundle_id, download.client_id)",
           @"has_restore_data",
           @"IFNULL(download_state.has_restore_data, -1)",
           @"is_restricted",
           @"IFNULL(download_state.is_restricted, 0)",
           @"is_server_finished",
           @"IFNULL(download_state.is_server_finished, 0)",
           @"restore_data_size",
           @"IFNULL(download_state.restore_data_size, 0)",
           @"restore_state",
           @"IFNULL(download_state.restore_state, 0)",
           0LL);
    id v4 = (void *)qword_1003A3208;
    qword_1003A3208 = (uint64_t)v3;

    uint64_t v5 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"asset",  @"client_id",  @"client",  @"download_id",  @"download_state",  @"effective_client_id",  @"application_id",  0LL);
    id v6 = (void *)qword_1003A3210;
    qword_1003A3210 = (uint64_t)v5;

    id v7 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"download_state",  @"download_state.auto_update_state",  @"download_state",  @"download_state.blocked_reason",  @"download_state",  @"download_state.can_cancel",  @"download_state",  @"download_state.can_pause",  @"download_state",  @"download_state.can_prioritize",  @"client",  @"client.audit_token_data",  @"download_state",  @"download_state.did_restore_data",  @"download_state",  @"download_state.phase",  @"application_id",  @"application_id.bundle_id",  @"download_state",  @"download_state.download_error",  @"download_state",  @"download_state.has_restore_data",  @"download_state",  @"download_state.is_restricted",  @"download_state",  @"download_state.is_server_finished",  @"download_state",  @"download_state.last_odr_action",  @"download_state",  @"download_state.restore_data_size",  @"download_state",  @"download_state.restore_state",  @"download_state",  @"IFNULL(download_state.auto_update_state, 0)",  @"download_state",  @"IFNULL(download_state.blocked_reason, 0)",  @"download_state",  @"IFNULL(download_state.can_cancel, 1)",  @"download_state",  @"IFNULL(download_state.can_pause, 1)",  @"download_state",  @"IFNULL(download_state.can_prioritize, 1)",  @"download_state",  @"IFNULL(download_state.phase, SSDownloadPhaseWaiting)",  @"application_id",  @"IFNULL(application_id.bundle_id, download.client_id)",  @"download_state",
           @"IFNULL(download_state.has_restore_data, -1)",
           @"download_state",
           @"IFNULL(download_state.is_restricted, 0)",
           @"download_state",
           @"IFNULL(download_state.is_server_finished, 0)",
           @"download_state",
           @"IFNULL(download_state.restore_data_size, 0)",
           @"download_state",
           @"IFNULL(download_state.restore_state, 0)",
           @"download_state",
           @"download_state.store_queue_refresh_count",
           0LL);
    id v8 = (void *)qword_1003A3218;
    qword_1003A3218 = (uint64_t)v7;

    id v9 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  @"asset",  @"download_state",  0LL);
    id v10 = (void *)qword_1003A3220;
    qword_1003A3220 = (uint64_t)v9;

    id v11 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"auto_update_time",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"download_state.blocked_reason",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"download_state.can_cancel",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"download_state.can_pause",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"download_state.can_prioritize",  @"LEFT OUTER JOIN client ON download.client_id = client.client_id",  @"client.audit_token_data",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"download_state.did_restore_data",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"download_state.phase",  @"LEFT OUTER JOIN application_id ON download.effective_client_id = application_id.effective_client_id",  @"application_id.bundle_id",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"download_state.download_error",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"download_state.has_restore_data",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"download_state.is_restricted",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"download_state.is_server_finished",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"download_state.last_odr_action",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"download_state.restore_data_size",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"download_state.restore_state",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"IFNULL(download_state.auto_update_state, 0)",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"IFNULL(download_state.blocked_reason, 0)",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"IFNULL(download_state.can_cancel, 1)",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"IFNULL(download_state.can_pause, 1)",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"IFNULL(download_state.can_prioritize, 1)",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"IFNULL(download_state.phase, SSDownloadPhaseWaiting)",  @"LEFT OUTER JOIN application_id ON download.effective_client_id = application_id.effective_client_id",  @"IFNULL(application_id.bundle_id, download.client_id)",  @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",  @"IFNULL(download_state.has_restore_data, -1)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"IFNULL(download_state.is_restricted, 0)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"IFNULL(download_state.is_server_finished, 0)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"IFNULL(download_state.restore_data_size, 0)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"IFNULL(download_state.restore_state, 0)",
            @"LEFT OUTER JOIN download_state ON download.pid = download_state.download_id",
            @"download_state.store_queue_refresh_count",
            0LL);
    id v12 = (void *)qword_1003A3228;
    qword_1003A3228 = (uint64_t)v11;

    uint64_t v13 = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  @"client.audit_token_data",  @"client.audit_token_data",  @"application_id.bundle_id",  @"application_id.bundle_id",  @"IFNULL(download_state.auto_update_state, 0)",  @"IFNULL(download_state.auto_update_state, 0)",  @"IFNULL(download_state.blocked_reason, 0)",  @"IFNULL(download_state.blocked_reason, 0)",  @"IFNULL(download_state.can_cancel, 1)",  @"IFNULL(download_state.can_cancel, 1)",  @"IFNULL(download_state.can_pause, 1)",  @"IFNULL(download_state.can_pause, 1)",  @"IFNULL(download_state.can_prioritize, 1)",  @"IFNULL(download_state.can_prioritize, 1)",  @"IFNULL(download_state.phase, SSDownloadPhaseWaiting)",  @"IFNULL(download_state.phase, SSDownloadPhaseWaiting)",  @"IFNULL(application_id.bundle_id, download.client_id)",  @"IFNULL(application_id.bundle_id, download.client_id)",  @"IFNULL(download_state.has_restore_data, -1)",  @"IFNULL(download_state.has_restore_data, -1)",  @"IFNULL(download_state.is_restricted, 0)",  @"IFNULL(download_state.is_restricted, 0)",  @"IFNULL(download_state.is_server_finished, 0)",  @"IFNULL(download_state.is_server_finished, 0)",  @"IFNULL(download_state.restore_data_size, 0)",  @"IFNULL(download_state.restore_data_size, 0)",  @"IFNULL(download_state.restore_state, 0)",  @"IFNULL(download_state.restore_state, 0)",  @"IFNULL(download.store_item_id, 0)",  @"IFNULL(download.store_item_id, 0)",  0LL);
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v14 = objc_retain( -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  @"airplay_content_type",  @"artist_name",  @"artwork_is_prerendered",  @"artwork_template_name",  @"is_automatic",  @"auto_update_time",  @"download_state.blocked_reason",  @"bundle_id",  @"cancel_url",  @"download_state.can_cancel",  @"download_state.can_pause",  @"download_state.can_prioritize",  @"client_id",  @"collection_artist_name",  @"collection_group_count",  @"collection_item_count",  @"collection_name",  @"composer_name",  @"download_state.did_restore_data",  @"document_target_id",  @"download_state.phase",  @"download_permalink",  @"duet_transfer_type",  @"duration_in_ms",  @"effective_client_id",  @"enable_extensions",  @"download_state.download_error",  @"episode_id",  @"episode_sort_id",  @"genre_name",  @"handler_id",  @"download_state.has_restore_data",  @"index_in_collection",  @"index_in_collection_group",  @"is_compilation",  @"is_device_based_vpp",  @"is_explicit",  @"is_hd",  @"is_hls",  @"is_store_queued",  @"is_premium",  @"is_private",  @"is_purchase",  @"is_redownload",  @"is_rental",  @"is_restore",
              @"download_state.is_restricted",
              @"download_state.is_server_finished",
              @"is_sample",
              @"is_shared",
              @"is_from_store",
              @"is_tv_template",
              @"is_music_show",
              @"show_composer",
              @"work_name",
              @"kind",
              @"download_state.last_odr_action",
              @"library_id",
              @"long_description",
              @"long_season_description",
              @"network_name"));
    id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v34,  v38,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t i = 0LL; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)i);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([a1 disambiguatedSQLForProperty:v19]);
          -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v20, v19);
        }

        id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v34,  v38,  16LL);
      }

      while (v16);
    }

    id v21 = -[NSMutableDictionary copy](v13, "copy");
    uint64_t v22 = (void *)qword_1003A3200;
    qword_1003A3200 = (uint64_t)v21;

    __int128 v33 = objc_alloc(&OBJC_CLASS___NSDictionary);
    uint64_t v23 = SSDownloadPropertyClientBundleIdentifier;
    uint64_t v24 = SSDownloadPropertyDownloadPhase;
    uint64_t v25 = SSDownloadPropertyCanPrioritize;
    uint64_t v26 = SSDownloadPropertyCanPause;
    uint64_t v27 = SSDownloadPropertyCanCancel;
    uint64_t v28 = SSDownloadPropertyIsContentRestricted;
    __int128 v29 = -[NSDictionary initWithObjectsAndKeys:]( v33,  "initWithObjectsAndKeys:",  @"airplay_content_type",  SSDownloadPropertyAirPlayContentType,  @"artist_name",  SSDownloadPropertyArtistName,  @"artwork_is_prerendered",  SSDownloadPropertyArtworkIsPrerendered,  @"artwork_template_name",  SSDownloadPropertyArtworkTemplateName,  @"is_automatic",  SSDownloadPropertyAutomaticType,  @"auto_update_time",  SSDownloadPropertyAutoUpdateTime,  @"beta_external_version_identifier",  SSDownloadPropertyBetaExternalVersionIdentifier,  @"bundle_id",  SSDownloadPropertyBundleIdentifier,  @"bundle_version",  SSDownloadPropertyBundleVersion,  @"cancel_url",  SSDownloadPropertyStoreCancelURL,  @"collection_artist_name",  SSDownloadPropertyCollectionArtistName,  @"collection_group_count",  SSDownloadPropertyNumberOfCollectionsInGroup,  @"collection_item_count",  SSDownloadPropertyNumberOfItemsInCollection,  @"collection_name",  SSDownloadPropertyCollectionName,  @"composer_name",  SSDownloadPropertyComposerName,  @"document_target_id",  SSDownloadPropertyDocumentTargetIdentifier,  @"download_permalink",  SSDownloadPropertyDownloadPermalink,  @"duet_transfer_type",  SSDownloadPropertyDuetTransferType,  @"duration_in_ms",  SSDownloadPropertyDurationInMilliseconds,  @"episode_id",  SSDownloadPropertyEpisodeIdentifier,  @"episode_sort_id",  SSDownloadPropertyEpisodeSortIdentifier,  @"enable_extensions",  SSDownloadPropertyEnableExtensions,  @"download_state.download_error",  SSDownloadPropertyEncodedErrorData,  @"genre_name",
            SSDownloadPropertyGenre,
            @"handler_id",
            SSDownloadPropertyHandlerID,
            @"has_messages_extension",
            SSDownloadPropertyHasMessagesExtension,
            @"is_hls",
            SSDownloadPropertyIsHLS,
            @"hls_playlist_url",
            SSDownloadPropertyHLSPlaylistURL,
            @"index_in_collection",
            SSDownloadPropertyIndexInCollection,
            @"index_in_collection_group",
            SSDownloadPropertyIndexInCollectionGroup,
            @"is_compilation");
    v30 = (void *)qword_1003A3230;
    qword_1003A3230 = (uint64_t)v29;

    __int128 v31 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"download_state.can_cancel",  v27,  @"download_state.can_pause",  v26,  @"application_id.bundle_id",  v23,  @"download_state.can_prioritize",  v25,  @"download_state.phase",  v24,  @"download_state.is_restricted",  v28,  0LL);
    __int128 v32 = (void *)qword_1003A3238;
    qword_1003A3238 = (uint64_t)v31;
  }

@end