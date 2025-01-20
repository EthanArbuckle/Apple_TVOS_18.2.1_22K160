@interface FinishDownloadMemoryEntity
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (BOOL)hasRestoreData;
- (BOOL)isDeviceBasedVPP;
- (BOOL)isHLS;
- (BOOL)isPodcastDownload;
- (BOOL)isRentalDownload;
- (BOOL)isRestoreDownload;
- (BOOL)isSampleDownload;
- (BOOL)isSharedDownload;
- (BOOL)isStoreDownload;
- (BOOL)isTvTemplate;
- (FinishDownloadAssetMemoryEntity)mediaAsset;
- (NSArray)secondaryAssets;
- (NSNumber)durationInMilliseconds;
- (NSNumber)handlerIdentifier;
- (NSNumber)storeAccountIdentifier;
- (NSNumber)storeCollectionIdentifier;
- (NSNumber)storeItemIdentifier;
- (NSNumber)storePublicationVersion;
- (NSNumber)storeSagaIdentifier;
- (NSString)ITunesMetadataDestinationPath;
- (NSString)artistName;
- (NSString)artworkTemplateName;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)clientIdentifier;
- (NSString)collectionName;
- (NSString)documentTargetIdentifier;
- (NSString)downloadKind;
- (NSString)downloadPermalink;
- (NSString)genreName;
- (NSString)storeAccountName;
- (NSString)storeFrontIdentifier;
- (NSString)storeTransactionIdentifier;
- (NSString)storeXID;
- (NSString)title;
- (StoreDownload)storeMetadata;
- (id)destinationDirectoryPathForAsset:(id)a3;
- (id)libraryItemIdentifier;
- (id)newITunesMetadataDictionary;
- (id)secondaryAssetForType:(id)a3;
- (int64_t)automaticType;
- (int64_t)priority;
- (int64_t)restoreState;
- (int64_t)transactionID;
- (void)loadAssetsUsingSession:(id)a3;
- (void)setStoreMetadata:(id)a3;
@end

@implementation FinishDownloadMemoryEntity

- (NSString)artistName
{
  return (NSString *)-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"artist_name");
}

- (NSString)artworkTemplateName
{
  return (NSString *)-[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"artwork_template_name");
}

- (int64_t)automaticType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"is_automatic"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"bundle_id");
}

- (NSString)bundleVersion
{
  return (NSString *)-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"bundle_version");
}

- (int64_t)priority
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"priority"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (NSString)clientIdentifier
{
  return (NSString *)-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"client_id");
}

- (NSString)collectionName
{
  return (NSString *)-[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"collection_name");
}

- (id)destinationDirectoryPathForAsset:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 destinationURLString]);
  if (v4)
  {
    v5 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v5, "path"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByDeletingLastPathComponent]);
  }

  else
  {
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity downloadKind](self, "downloadKind"));
    id v8 = sub_10015AF78(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  return v7;
}

- (NSString)documentTargetIdentifier
{
  return (NSString *)-[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"document_target_id");
}

- (NSString)downloadKind
{
  return (NSString *)-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"kind");
}

- (NSString)downloadPermalink
{
  return (NSString *)-[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"download_permalink");
}

- (NSNumber)durationInMilliseconds
{
  return (NSNumber *)-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"duration_in_ms");
}

- (NSString)genreName
{
  return (NSString *)-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"genre_name");
}

- (NSNumber)handlerIdentifier
{
  return (NSNumber *)-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"handler_id");
}

- (BOOL)hasRestoreData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"download_state.has_restore_data"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isDeviceBasedVPP
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"is_device_based_vpp"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isHLS
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"is_hls"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isPodcastDownload
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity downloadKind](self, "downloadKind"));
  char IsPodcastKind = SSDownloadKindIsPodcastKind(v2);

  return IsPodcastKind;
}

- (BOOL)isRentalDownload
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"is_rental"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isRestoreDownload
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"is_restore"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isSampleDownload
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"is_sample"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isSharedDownload
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"is_shared"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isStoreDownload
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"is_from_store"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isTvTemplate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"is_tv_template"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)ITunesMetadataDestinationPath
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity downloadKind](self, "downloadKind"));
  id v4 = sub_10015AF78(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lld",  -[FinishDownloadMemoryEntity databaseID](self, "databaseID")));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v6]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathExtension:@"plist"]);
  return (NSString *)v8;
}

- (id)libraryItemIdentifier
{
  return -[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"library_id");
}

- (void)loadAssetsUsingSession:(id)a3
{
  id v4 = a3;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  v34 = sub_100063894;
  v35 = sub_1000638A4;
  id v36 = 0LL;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_100063894;
  v29 = sub_1000638A4;
  id v30 = 0LL;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"download_id",  -[FinishDownloadMemoryEntity databaseID](self, "databaseID")));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"IFNULL(asset.blocked_reason, 0)",  0LL));
  v38[0] = v6;
  v38[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 database]);
  v37 = @"asset_order";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[FinishDownloadAssetMemoryEntity queryWithDatabase:predicate:orderingProperties:]( &OBJC_CLASS___FinishDownloadAssetMemoryEntity,  "queryWithDatabase:predicate:orderingProperties:",  v10,  v9,  v11));

  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_1000638AC;
  v20 = &unk_10034C690;
  v23 = &v25;
  v24 = &v31;
  v13 = v5;
  v21 = v13;
  v22 = self;
  [v12 enumerateMemoryEntitiesUsingBlock:&v17];
  v14 = (void *)v32[5];
  if (!v14) {
    v14 = (void *)v26[5];
  }
  objc_storeStrong((id *)&self->_mediaAsset, v14);
  v15 = (NSArray *)-[NSMutableArray copy](v13, "copy", v17, v18, v19, v20);
  secondaryAssets = self->_secondaryAssets;
  self->_secondaryAssets = v15;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

- (id)newITunesMetadataDictionary
{
  id v3 = -[StoreDownload copyWritableMetadata](self->_storeMetadata, "copyWritableMetadata");
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = SSDownloadMetadataKeyPurchaseDate;
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[StoreDownload valueForMetadataKey:]( self->_storeMetadata,  "valueForMetadataKey:",  SSDownloadMetadataKeyPurchaseDate));
  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, v5);
  }
  v7 = objc_alloc(&OBJC_CLASS___DownloadDRM);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload sinfs](self->_storeMetadata, "sinfs"));
  v9 = -[DownloadDRM initWithSinfArray:](v7, "initWithSinfArray:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadDRM sinfsArray](v9, "sinfsArray"));
  id v11 = [v10 copyValueForProperty:@"SinfPropertyAccountIdentifier" error:0];

  if (v11
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadDRM pinfsArray](v9, "pinfsArray")),
        id v11 = [v12 copyValueForProperty:@"SinfPropertyAccountIdentifier" error:0],
        v12,
        v11)
    || (id v11 = (id)objc_claimAutoreleasedReturnValue( -[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"store_account_id"))) != 0LL)
  {
    id v40 = v3;
    v41 = v9;
    v42 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accountWithUniqueIdentifier:v11]);

    v15 = (NSMutableDictionary *)[v14 copyLockdownRepresentation];
    if (!v15)
    {
      v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v11, kSSLockdownKeyAccountDSPersonID);
    }

    v16 = v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"store_account_name"));
    uint64_t v18 = kSSLockdownKeyAccountID;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v15, "objectForKey:", kSSLockdownKeyAccountID));

    if (v19) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = v17 == 0LL;
    }
    if (!v20) {
      -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v17, v18);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload downloaderAccountIdentifier](self->_storeMetadata, "downloaderAccountIdentifier"));
    if (v21) {
      -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v21, @"DownloaderID");
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload familyAccountIdentifier](self->_storeMetadata, "familyAccountIdentifier"));
    if (v22) {
      -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v22, @"FamilyID");
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload purchaserAccountIdentifier](self->_storeMetadata, "purchaserAccountIdentifier"));
    if (v23) {
      -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v23, @"PurchaserID");
    }
    -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v15, SSDownloadMetadataKeyAccountInfo);

    id v4 = v42;
    v6 = v16;
    id v3 = v40;
    v9 = v41;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity downloadKind](self, "downloadKind"));
  int IsToneKind = SSDownloadKindIsToneKind(v24);

  if (IsToneKind)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llx",  -[FinishDownloadMemoryEntity databaseID](self, "databaseID")));
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v26, SSDownloadMetadataKeyRingtoneGUID);
  }

  uint64_t v27 = SSDownloadMetadataKeyIsPurchaseRedownload;
  v28 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:SSDownloadMetadataKeyIsPurchaseRedownload]);

  if (!v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"is_redownload"));
    unsigned int v30 = [v29 BOOLValue];

    if (v30) {
      [v3 setObject:&__kCFBooleanTrue forKey:v27];
    }
  }

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"ref_app"));

  if (v31) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v31, SSDownloadMetadataKeyReferrerAppName);
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"ref_url"));

  if (v32) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v32, SSDownloadMetadataKeyReferrerURL);
  }
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"sourceApp"]);

  if (!v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity clientIdentifier](self, "clientIdentifier"));
    if (v34) {
      [v3 setObject:v34 forKey:@"sourceApp"];
    }
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:SSDownloadMetadataKeyVariantIdentifier]);

  if (!v35)
  {
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity mediaAsset](self, "mediaAsset"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v36 variantIdentifier]);

    if (v37
      || (v37 = (void *)objc_claimAutoreleasedReturnValue( -[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"variant_id"))) != 0LL)
    {
      [v3 setObject:v37 forKey:@"variantID"];
    }
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue( -[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"beta_external_version_identifier"));
  if (v38) {
    [v3 setObject:v38 forKey:SSDownloadMetadataKeyBetaExternalVersionIdentifier];
  }
  [v3 setObject:v4 forKey:SSDownloadMetadataKeyAdditionalInfo];

  return v3;
}

- (int64_t)restoreState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"IFNULL(download_state.restore_state, 0)"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (id)secondaryAssetForType:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v5 = self->_secondaryAssets;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetType", (void)v13));
        unsigned int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (NSNumber)storeAccountIdentifier
{
  return (NSNumber *)-[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"store_account_id");
}

- (NSString)storeAccountName
{
  return (NSString *)-[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"store_account_name");
}

- (NSNumber)storeCollectionIdentifier
{
  return (NSNumber *)-[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"store_collection_id");
}

- (NSString)storeFrontIdentifier
{
  return (NSString *)-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"store_front_id");
}

- (NSNumber)storeItemIdentifier
{
  return (NSNumber *)-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"store_item_id");
}

- (NSNumber)storePublicationVersion
{
  return (NSNumber *)-[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"store_publication_version");
}

- (NSNumber)storeSagaIdentifier
{
  return (NSNumber *)-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"store_saga_id");
}

- (NSString)storeTransactionIdentifier
{
  return (NSString *)-[FinishDownloadMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"store_transaction_id");
}

- (NSString)storeXID
{
  return (NSString *)-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"store_xid");
}

- (NSString)title
{
  return (NSString *)-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"title");
}

- (int64_t)transactionID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadMemoryEntity valueForProperty:](self, "valueForProperty:", @"transaction_id"));
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___DownloadEntity);
}

+ (id)defaultProperties
{
  v3[0] = @"artist_name";
  v3[1] = @"artwork_template_name";
  v3[2] = @"is_automatic";
  v3[3] = @"bundle_id";
  v3[4] = @"bundle_version";
  v3[5] = @"client_id";
  v3[6] = @"collection_name";
  v3[7] = @"document_target_id";
  v3[8] = @"download_permalink";
  v3[9] = @"duration_in_ms";
  v3[10] = @"handler_id";
  v3[11] = @"genre_name";
  v3[12] = @"has_4k";
  v3[13] = @"has_dolby_vision";
  v3[14] = @"has_hdr";
  v3[15] = @"download_state.has_restore_data";
  v3[16] = @"is_device_based_vpp";
  v3[17] = @"is_hls";
  v3[18] = @"is_redownload";
  v3[19] = @"is_rental";
  v3[20] = @"is_restore";
  v3[21] = @"is_sample";
  v3[22] = @"is_shared";
  v3[23] = @"is_from_store";
  v3[24] = @"is_tv_template";
  v3[25] = @"is_device_based_vpp";
  v3[26] = @"kind";
  v3[27] = @"library_id";
  v3[28] = @"ref_app";
  v3[29] = @"ref_url";
  v3[30] = @"IFNULL(download_state.restore_state, 0)";
  v3[31] = @"store_account_name";
  v3[32] = @"store_account_id";
  v3[33] = @"store_collection_id";
  v3[34] = @"store_front_id";
  v3[35] = @"store_item_id";
  v3[36] = @"store_publication_version";
  v3[37] = @"store_saga_id";
  v3[38] = @"store_transaction_id";
  v3[39] = @"store_xid";
  v3[40] = @"title";
  v3[41] = @"transaction_id";
  v3[42] = @"priority";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  43LL));
}

- (FinishDownloadAssetMemoryEntity)mediaAsset
{
  return self->_mediaAsset;
}

- (StoreDownload)storeMetadata
{
  return self->_storeMetadata;
}

- (void)setStoreMetadata:(id)a3
{
}

- (NSArray)secondaryAssets
{
  return self->_secondaryAssets;
}

- (void).cxx_destruct
{
}

@end