@interface Download
+ (Class)databaseEntityClass;
- (BOOL)_setAssetsWithExternalAssets:(id)a3 error:(id *)a4;
- (BOOL)_setAssetsWithExternalThinnedAssets:(id)a3 error:(id *)a4;
- (BOOL)_setDatabasePropertiesWithExternalMetadata:(id)a3 error:(id *)a4;
- (BOOL)_setThumbnailImageWithExternalAssets:(id)a3 error:(id *)a4;
- (Download)initWithClientXPCDownload:(id)a3;
- (Download)initWithExternalManifestDictionary:(id)a3;
- (Download)initWithMicroPaymentDownload:(id)a3 clientID:(id)a4;
- (Download)initWithStoreDownload:(id)a3;
- (NSArray)assets;
- (SSDownloadPolicy)downloadPolicy;
- (id)_copyValidAssetsWithExternalAssets:(id)a3 validateVariants:(BOOL)a4;
- (id)_newAssetArrayWithDownloadAssets:(id)a3;
- (id)anyAssetForAssetType:(id)a3;
- (id)assetForAssetIdentifier:(int64_t)a3;
- (id)copyInMemoryStoreDownloadMetadata;
- (id)copyJobActivity;
- (id)copyStoreDownloadMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)removeAssetsWithAssetType:(id)a3;
- (void)setAssets:(id)a3;
- (void)setDownloadPolicy:(id)a3;
- (void)unionNetworkConstraints:(id)a3;
@end

@implementation Download

- (id)copyJobActivity
{
  id v3 = objc_alloc_init((Class)ISWeakLinkedClassForString(@"ASDJobActivity", 29LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"store_artist_id"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = [v4 copy];
    [v3 setArtistID:v6];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"artist_name"));

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    id v9 = [v7 copy];
    [v3 setArtistName:v9];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"bundle_id"));

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
  {
    id v12 = [v10 copy];
    [v3 setBundleID:v12];
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"beta_external_version_identifier"));

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
  {
    id v15 = [v13 copy];
    [v3 setBetaExternalVersionIdentifier:v15];
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"bundle_version"));

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
  {
    id v18 = [v16 copy];
    [v3 setBundleVersion:v18];
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"is32BitOnly"));

  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0) {
    objc_msgSend(v3, "setThirtyTwoBitOnly:", objc_msgSend(v19, "BOOLValue"));
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"store_redownload_parameters"));

  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
  {
    id v23 = [v21 copy];
    [v3 setBuyParams:v23];
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"cancel_url"));

  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
  {
    id v26 = [v24 copy];
    [v3 setCancelDownloadURL:v26];
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"cancel_if_duplicate"));

  if ((objc_opt_respondsToSelector(v27, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setCancelIfDuplicate:", objc_msgSend(v27, "BOOLValue"));
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"client_id"));

  uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
  {
    id v30 = [v28 copy];
    [v3 setClientID:v30];
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"collection_name"));

  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0)
  {
    id v33 = [v31 copy];
    [v3 setCollectionName:v33];
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[Download databaseID](self, "databaseID")));
  if (-[Download databaseID](self, "databaseID")) {
    [v3 setDivertedTrackingID:v34];
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"is_device_based_vpp"));

  if ((objc_opt_respondsToSelector(v35, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setIsDeviceBasedVPP:", objc_msgSend(v35, "BOOLValue"));
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"enable_extensions"));

  uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v36, v37) & 1) != 0)
  {
    id v38 = [v36 copy];
    [v3 setEnableExtensions:v38];
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"is_explicit"));

  if ((objc_opt_respondsToSelector(v39, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setExplicitContent:", objc_msgSend(v39, "BOOLValue"));
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"is_from_store"));

  if ((objc_opt_respondsToSelector(v40, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setIsFromStore:", objc_msgSend(v40, "BOOLValue"));
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"is_tv_template"));

  if ((objc_opt_respondsToSelector(v41, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setIsTVTemplate:", objc_msgSend(v41, "BOOLValue"));
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"genre_name"));

  uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v42, v43) & 1) != 0)
  {
    id v44 = [v42 copy];
    [v3 setGenre:v44];
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"store_genre_id"));

  uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v45, v46) & 1) != 0)
  {
    id v47 = [v45 copy];
    [v3 setGenreID:v47];
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"is_store_queued"));

  if ((objc_opt_respondsToSelector(v48, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setIsInQueue:", objc_msgSend(v48, "BOOLValue"));
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"is_redownload"));

  if ((objc_opt_respondsToSelector(v49, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setIsPurchasedRedownload:", objc_msgSend(v49, "BOOLValue"));
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"is_restore"));

  if ((objc_opt_respondsToSelector(v50, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setIsRestore:", objc_msgSend(v50, "BOOLValue"));
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"store_item_id"));

  uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v51, v52) & 1) != 0)
  {
    id v53 = [v51 copy];
    [v3 setItemID:v53];
  }

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"kind"));

  uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v54, v55) & 1) != 0)
  {
    id v56 = [v54 copy];
    [v3 setKind:v56];
  }

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"has_messages_extension"));

  if ((objc_opt_respondsToSelector(v57, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setHasMessagesExtension:", objc_msgSend(v57, "BOOLValue"));
  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"launch_prohibited"));

  if ((objc_opt_respondsToSelector(v58, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setLaunchProhibited:", objc_msgSend(v58, "BOOLValue"));
  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"messages_artwork_url"));

  uint64_t v60 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v59, v60) & 1) != 0)
  {
    id v61 = [v59 copy];
    [v3 setMessagesArtworkURL:v61];
  }

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"order_key"));

  uint64_t v63 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v62, v63) & 1) != 0) {
    [v3 setExternalOrderKey:v62];
  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"store_purchase_date"));

  if ((objc_opt_respondsToSelector(v64, "doubleValue") & 1) != 0)
  {
    [v64 doubleValue];
    v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    [v3 setPurchaseDate:v65];
  }

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"rating_label"));

  uint64_t v67 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v66, v67) & 1) != 0)
  {
    id v68 = [v66 copy];
    [v3 setRatingLabel:v68];
  }

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"rating_rank"));

  uint64_t v70 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v69, v70) & 1) != 0)
  {
    id v71 = [v69 copy];
    [v3 setRatingRank:v71];
  }

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"release_date"));

  if ((objc_opt_respondsToSelector(v72, "doubleValue") & 1) != 0)
  {
    [v72 doubleValue];
    v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    [v3 setReleaseDate:v73];
  }

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"store_account_id"));

  uint64_t v75 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v74, v75) & 1) != 0)
  {
    id v76 = [v74 copy];
    [v3 setStoreAccountID:v76];
  }

  v77 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"store_account_name"));

  uint64_t v78 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v77, v78) & 1) != 0)
  {
    id v79 = [v77 copy];
    [v3 setStoreAccountName:v79];
  }

  v80 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"store_front_id"));

  uint64_t v81 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v80, v81) & 1) != 0)
  {
    id v82 = [v80 copy];
  }

  else
  {
    if ((objc_opt_respondsToSelector(v80, "stringValue") & 1) == 0) {
      goto LABEL_74;
    }
    id v82 = (id)objc_claimAutoreleasedReturnValue([v80 stringValue]);
  }

  v83 = v82;
  [v3 setStorefront:v82];

LABEL_74:
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"store_download_key"));

  uint64_t v85 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v84, v85) & 1) != 0)
  {
    id v86 = [v84 copy];
    [v3 setStoreDownloadKey:v86];
  }

  v87 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"store_transaction_id"));

  uint64_t v88 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v87, v88) & 1) != 0)
  {
    id v89 = [v87 copy];
    [v3 setStoreTransactionID:v89];
  }

  v90 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"artwork_is_prerendered"));

  if ((objc_opt_respondsToSelector(v90, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setSoftwareIconNeedsShine:", objc_msgSend(v90, "BOOLValue"));
  }
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"store_software_version_id"));

  uint64_t v92 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v91, v92) & 1) != 0)
  {
    id v93 = [v91 copy];
    [v3 setSoftwareVersionExternalIdentifier:v93];
  }

  v94 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"store_cohort"));

  uint64_t v95 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v94, v95) & 1) != 0)
  {
    id v96 = [v94 copy];
    [v3 setStoreCohort:v96];
  }

  v97 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"thumbnail_url"));

  uint64_t v98 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v97, v98) & 1) != 0)
  {
    id v99 = [v97 copy];
    [v3 setThumbnailURL:v99];
  }

  v100 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"title"));

  uint64_t v101 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v100, v101) & 1) != 0)
  {
    id v102 = [v100 copy];
    [v3 setTitle:v102];
  }

  v103 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](self, "valueForProperty:", @"variant_id"));

  uint64_t v104 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v103, v104) & 1) != 0)
  {
    id v105 = [v103 copy];
    [v3 setVariantID:v105];
  }

  v106 = (void *)objc_claimAutoreleasedReturnValue(-[Download assets](self, "assets"));
  id v107 = -[Download _newAssetArrayWithDownloadAssets:](self, "_newAssetArrayWithDownloadAssets:", v106);

  [v3 setAssets:v107];
  id v108 = v3;

  return v108;
}

- (id)_newAssetArrayWithDownloadAssets:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
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
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "copyJobAsset", (void)v13);
        -[NSMutableArray addObject:](v4, "addObject:", v10);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = -[NSMutableArray copy](v4, "copy");
  return v11;
}

- (Download)initWithClientXPCDownload:(id)a3
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___Download;
  v4 = -[Download init](&v30, "init");
  if (v4)
  {
    int64_t int64 = xpc_dictionary_get_int64(a3, "0");
    -[Download setDatabaseID:](v4, "setDatabaseID:", int64);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "1", v6);
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      id v9 = +[DownloadEntity copyDatabaseDictionaryToSetClientDictionary:]( &OBJC_CLASS___DownloadEntity,  "copyDatabaseDictionaryToSetClientDictionary:",  v7);
      id v10 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", int64);
      [v9 setObject:v10 forKey:SSSQLEntityPropertyPersistentID];
      -[Download setValuesWithDictionary:](v4, "setValuesWithDictionary:", v9);
    }

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v12 = SSXPCDictionaryCopyCFObjectWithClass(a3, "4", v11);
    if (v12)
    {
      __int128 v13 = (void *)v12;
      -[Download setExternalValuesWithDictionary:](v4, "setExternalValuesWithDictionary:", v12);
    }

    uint64_t v26 = 0LL;
    v27 = &v26;
    uint64_t v28 = 0x2020000000LL;
    char v29 = 0;
    xpc_object_t value = xpc_dictionary_get_value(a3, "2");
    __int128 v15 = value;
    if (value)
    {
      if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_dictionary)
      {
        __int128 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        uint64_t v22 = 0LL;
        id v23 = &v22;
        uint64_t v24 = 0x2020000000LL;
        uint64_t v25 = 0LL;
        applier[0] = _NSConcreteStackBlock;
        applier[1] = 3221225472LL;
        applier[2] = sub_1000FF518;
        applier[3] = &unk_10034E980;
        applier[5] = &v22;
        applier[6] = &v26;
        applier[4] = v16;
        xpc_dictionary_apply(v15, applier);
        id v17 = -[NSMutableArray count](v16, "count");
        LOBYTE(v15) = v17 == (id)v23[3];
        -[Download setAssets:](v4, "setAssets:", v16);

        _Block_object_dispose(&v22, 8);
      }

      else
      {
        LOBYTE(v15) = 0;
      }
    }

    if (-[Download valueForExternalProperty:](v4, "valueForExternalProperty:", SSDownloadExternalPropertyPolicy)) {
      char v18 = 1;
    }
    else {
      char v18 = (char)v15;
    }
    if ((v18 & 1) == 0)
    {
      v4->_downloadPolicy = -[SSDownloadPolicy initWithDownloadKind:URLBagType:]( objc_alloc(&OBJC_CLASS___SSDownloadPolicy),  "initWithDownloadKind:URLBagType:",  -[Download valueForProperty:](v4, "valueForProperty:", @"kind"),  2LL * *((unsigned __int8 *)v27 + 24));
      if (objc_msgSend(-[Download valueForProperty:](v4, "valueForProperty:", @"is_automatic"), "integerValue") == (id)2)
      {
        id v19 = objc_alloc_init(&OBJC_CLASS___SSDownloadPolicyRule);
        [v19 addNetworkType:1000];
        -[SSDownloadPolicy unionPolicyRule:](v4->_downloadPolicy, "unionPolicyRule:", v19);
      }
    }

    _Block_object_dispose(&v26, 8);
  }

  return v4;
}

- (Download)initWithExternalManifestDictionary:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___Download;
  v4 = -[Download init](&v18, "init");
  if (v4)
  {
    id v17 = 0LL;
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0) {
      goto LABEL_15;
    }
    id v6 = [a3 objectForKey:@"metadata"];
    id v7 = [a3 objectForKey:@"assets"];
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0
      && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v7, v9) & 1) != 0)
      && -[Download _setDatabasePropertiesWithExternalMetadata:error:]( v4,  "_setDatabasePropertiesWithExternalMetadata:error:",  v6,  &v17)
      && -[Download _setAssetsWithExternalAssets:error:](v4, "_setAssetsWithExternalAssets:error:", v7, &v17))
    {
      unsigned int v10 = -[Download _setThumbnailImageWithExternalAssets:error:]( v4,  "_setThumbnailImageWithExternalAssets:error:",  v7,  &v17);
    }

    else
    {
      unsigned int v10 = 0;
    }

    id v11 = [a3 objectForKey:@"thinned-assets"];
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0 && v10) {
      unsigned int v10 = -[Download _setAssetsWithExternalThinnedAssets:error:]( v4,  "_setAssetsWithExternalThinnedAssets:error:",  v11,  &v17);
    }
    if (v10)
    {
      v4->_downloadPolicy = -[SSDownloadPolicy initWithDownloadKind:URLBagType:]( objc_alloc(&OBJC_CLASS___SSDownloadPolicy),  "initWithDownloadKind:URLBagType:",  -[Download valueForProperty:](v4, "valueForProperty:", @"kind"),  2LL);
      -[Download setValue:forProperty:]( v4,  "setValue:forProperty:",  &__kCFBooleanTrue,  @"download_state.can_cancel");
      return v4;
    }

    __int128 v13 = v17;
    if (!v17)
    {
LABEL_15:
      __int128 v13 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SSErrorDomain,  200LL,  0LL);
      id v17 = v13;
    }

    uint64_t ArchivableData = SSCodingCreateArchivableData(v13);
    if (ArchivableData)
    {
      __int128 v15 = (void *)ArchivableData;
      -[Download setValue:forProperty:]( v4,  "setValue:forProperty:",  ArchivableData,  @"download_state.download_error");
    }
  }

  return v4;
}

- (Download)initWithStoreDownload:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___Download;
  v4 = -[Download init](&v22, "init");
  if (!v4) {
    return v4;
  }
  id v5 = +[DownloadEntity copyValueDictionaryWithMetadata:]( &OBJC_CLASS___DownloadEntity,  "copyValueDictionaryWithMetadata:",  a3);
  unsigned int v6 = objc_msgSend(objc_msgSend(v5, "objectForKey:", @"is_automatic"), "BOOLValue");
  if (v6)
  {
    if (![v5 objectForKey:@"cancel_if_duplicate"]) {
      objc_msgSend( v5,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"cancel_if_duplicate");
    }
    if (![v5 objectForKey:@"suppress_error_dialogs"]) {
      objc_msgSend( v5,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"suppress_error_dialogs");
    }
    if (![v5 objectForKey:@"priority"]) {
      objc_msgSend( v5,  "setObject:forKey:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -1),  @"priority");
    }
  }

  if (SSDownloadKindIsSoftwareKind([a3 kind]))
  {
    id v7 = [a3 contentRating];
    if ([v7 ratingLabel]) {
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v7, "ratingLabel"), @"rating_label");
    }
    if ([v7 rank]) {
      objc_msgSend( v5,  "setObject:forKey:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "rank")),  @"rating_rank");
    }
  }

  -[Download setValuesWithDictionary:](v4, "setValuesWithDictionary:", v5);

  -[Download setAssets:](v4, "setAssets:", [a3 assets]);
  id v8 = [a3 valueForMetadataKey:SSDownloadMetadataKeyNetworkConstraints];
  id v9 = -[Download valueForProperty:](v4, "valueForProperty:", @"kind");
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___SSNetworkConstraints);
    [v11 setSizeLimitsWithStoreConstraintDictionary:v8];
    v4->_downloadPolicy = -[SSDownloadPolicy initWithNetworkConstraints:]( objc_alloc(&OBJC_CLASS___SSDownloadPolicy),  "initWithNetworkConstraints:",  v11);

    downloadPolicy = v4->_downloadPolicy;
  }

  else
  {
    downloadPolicy = -[SSDownloadPolicy initWithDownloadKind:URLBagType:]( objc_alloc(&OBJC_CLASS___SSDownloadPolicy),  "initWithDownloadKind:URLBagType:",  v9,  0LL);
    v4->_downloadPolicy = downloadPolicy;
  }

  __int128 v13 = (NSMutableArray *)objc_msgSend(-[SSDownloadPolicy policyRules](downloadPolicy, "policyRules"), "mutableCopy");
  if (!v13) {
    __int128 v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  id v14 = [a3 valueForMetadataKey:SSDownloadMetadataKeyRequiresPluggedIn];
  if ((objc_opt_respondsToSelector(v14, "BOOLValue") & 1) == 0)
  {
    if (!v6) {
      goto LABEL_37;
    }
LABEL_28:
    id v16 = objc_alloc_init(&OBJC_CLASS___SSDownloadPolicyRule);
    [v16 setCellularDataStates:2];
    [v16 setPowerStates:2];
    -[NSMutableArray addObject:](v13, "addObject:", v16);

    goto LABEL_29;
  }

  if (![v14 BOOLValue])
  {
    if ((v6 & 1) == 0) {
      goto LABEL_37;
    }
    goto LABEL_28;
  }

  id v15 = objc_alloc_init(&OBJC_CLASS___SSDownloadPolicyRule);
  [v15 setDownloadSizeLimit:SSDownloadSizeLimitDisabled];
  [v15 setPowerStates:1];
  -[NSMutableArray addObject:](v13, "addObject:", v15);

  if ((v6 & 1) == 0) {
    goto LABEL_37;
  }
LABEL_29:
  id v17 = objc_alloc_init(&OBJC_CLASS___SSDownloadPolicyRule);
  [v17 setCellularDataStates:2];
  -[NSMutableArray addObject:](v13, "addObject:", v17);

  if (!-[Download valueForProperty:](v4, "valueForProperty:", @"client_id"))
  {
    if ((SSDownloadKindIsSoftwareKind(v9) & 1) != 0)
    {
      objc_super v18 = @"com.apple.AppStore";
LABEL_36:
      -[Download setValue:forProperty:](v4, "setValue:forProperty:", v18, @"client_id");
      goto LABEL_37;
    }

    if ((SSDownloadKindIsEBookKind(v9) & 1) != 0)
    {
      objc_super v18 = @"com.apple.iBooks";
      goto LABEL_36;
    }

    if (SSDownloadKindIsMediaKind(v9))
    {
      objc_super v18 = @"com.apple.MobileStore";
      goto LABEL_36;
    }
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___Download;
  -[Download dealloc](&v3, "dealloc");
}

- (id)anyAssetForAssetType:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  assets = self->_assets;
  id result = -[NSArray countByEnumeratingWithState:objects:count:]( assets,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(assets);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v8);
        if (objc_msgSend( objc_msgSend(v9, "valueForProperty:", @"asset_type"),  "isEqualToString:",  a3)) {
          return v9;
        }
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id result = -[NSArray countByEnumeratingWithState:objects:count:]( assets,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }

  return result;
}

- (id)assetForAssetIdentifier:(int64_t)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  assets = self->_assets;
  id result = -[NSArray countByEnumeratingWithState:objects:count:]( assets,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(assets);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v8);
        if ([v9 databaseID] == (id)a3) {
          return v9;
        }
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id result = -[NSArray countByEnumeratingWithState:objects:count:]( assets,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }

  return result;
}

- (id)copyStoreDownloadMetadata
{
  return -[StoreDownload initWithContentsOfFile:]( [StoreDownload alloc],  "initWithContentsOfFile:",  objc_msgSend( +[ScratchManager directoryPathForDownloadID:kind:createIfNeeded:]( ScratchManager,  "directoryPathForDownloadID:kind:createIfNeeded:",  -[Download databaseID](self, "databaseID"),  -[Download valueForProperty:](self, "valueForProperty:", @"kind"),  0),  "stringByAppendingPathComponent:",  @"iTunesMetadata.plist"));
}

- (id)copyInMemoryStoreDownloadMetadata
{
  return -[StoreDownload initWithDictionary:]( objc_alloc(&OBJC_CLASS___StoreDownload),  "initWithDictionary:",  -[Download propertyValues](self, "propertyValues"));
}

- (void)removeAssetsWithAssetType:(id)a3
{
  id v7 = -[NSArray mutableCopy](self->_assets, "mutableCopy");
  uint64_t v5 = (uint64_t)[v7 count];
  if (v5 >= 1)
  {
    unint64_t v6 = v5 + 1;
    do
    {
      if (objc_msgSend( objc_msgSend( objc_msgSend(v7, "objectAtIndex:", v6 - 2),  "valueForProperty:",  @"asset_type"),  "isEqualToString:",  a3)) {
        [v7 removeObjectAtIndex:v6 - 2];
      }
      --v6;
    }

    while (v6 > 1);
  }

  -[Download setAssets:](self, "setAssets:", v7);
}

- (void)unionNetworkConstraints:(id)a3
{
  if (!self->_downloadPolicy) {
    self->_downloadPolicy = objc_alloc_init(&OBJC_CLASS___SSDownloadPolicy);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100100204;
  v5[3] = &unk_10034E9A8;
  v5[4] = a3;
  v5[5] = self;
  SSNetworkTypeApplyBlock(v5, a2);
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___DownloadEntity);
}

- (id)_copyValidAssetsWithExternalAssets:(id)a3 validateVariants:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v10);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          __int128 v13 = -[DownloadAsset initWithExternalManifestDictionary:validateVariants:]( objc_alloc(&OBJC_CLASS___DownloadAsset),  "initWithExternalManifestDictionary:validateVariants:",  v11,  v4);
          if (v13)
          {
            id v14 = v13;
            -[NSMutableArray addObject:](v6, "addObject:", v13);
          }
        }

        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  return v6;
}

- (BOOL)_setAssetsWithExternalAssets:(id)a3 error:(id *)a4
{
  id v6 = -[Download _copyValidAssetsWithExternalAssets:validateVariants:]( self,  "_copyValidAssetsWithExternalAssets:validateVariants:",  a3,  0LL);
  id v7 = [v6 count];
  if (v7)
  {
    -[Download setAssets:](self, "setAssets:", v6);
  }

  else if (a4)
  {
    *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SSErrorDomain,  401LL,  0LL);
  }

  return v7 != 0LL;
}

- (BOOL)_setAssetsWithExternalThinnedAssets:(id)a3 error:(id *)a4
{
  id v5 = -[Download _copyValidAssetsWithExternalAssets:validateVariants:]( self,  "_copyValidAssetsWithExternalAssets:validateVariants:",  a3,  1LL);
  if ([v5 count])
  {
    id v6 = +[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice");
    id v20 = [v6 productType];
    id v21 = [v6 compatibleProductType];
    __int128 v19 = self;
    objc_msgSend(v5, "addObjectsFromArray:", -[Download assets](self, "assets"));
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v8 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      id obj = v5;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          id v13 = [v12 valueForProperty:@"asset_type"];
          id v14 = -[NSMutableDictionary objectForKey:](v7, "objectForKey:", v13);
          if (v14)
          {
            id v15 = [v14 valueForProperty:@"variant_id"];
            id v16 = [v12 valueForProperty:@"variant_id"];
            if (!v16) {
              continue;
            }
            if (v15)
            {
              __int128 v17 = v16;
              if (![v15 isEqualToString:v21]
                || ![v17 isEqualToString:v20])
              {
                continue;
              }
            }
          }

          -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v12, v13);
        }

        id v5 = obj;
        id v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v9);
    }

    -[Download setAssets:](v19, "setAssets:", -[NSMutableDictionary allValues](v7, "allValues"));
  }

  return 1;
}

- (BOOL)_setDatabasePropertiesWithExternalMetadata:(id)a3 error:(id *)a4
{
  id v7 = [a3 objectForKey:@"kind"];
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0) {
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"software"])
  {
    uint64_t v9 = SSDownloadKindSoftwareApplication;
LABEL_7:
    -[Download setValue:forProperty:](self, "setValue:forProperty:", v9, @"kind");
    goto LABEL_8;
  }

  if ([v7 isEqualToString:@"vpn-plugin"])
  {
    uint64_t v9 = SSDownloadKindVPNPlugin;
    goto LABEL_7;
  }

- (BOOL)_setThumbnailImageWithExternalAssets:(id)a3 error:(id *)a4
{
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v30;
    uint64_t v8 = @"display-image";
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(a3);
        }
        id v10 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          id v12 = [v10 objectForKey:@"kind"];
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
          {
            if ([v12 isEqualToString:v8])
            {
              uint64_t v14 = v8;
              id v15 = [v10 objectForKey:@"url"];
              uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
              {
                id v17 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v15);
                if (-[NSURL host](v17, "host")) {
                  -[Download setValue:forProperty:](self, "setValue:forProperty:", v15, @"thumbnail_url");
                }
              }

              id v18 = [v10 objectForKey:@"needs-shine"];
              if ((objc_opt_respondsToSelector(v18, "BOOLValue") & 1) != 0) {
                -[Download setValue:forProperty:]( self,  "setValue:forProperty:",  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v18 BOOLValue] ^ 1),  @"artwork_is_prerendered");
              }
              id v19 = [v10 objectForKey:@"UINewsstandBindingEdge"];
              uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
              uint64_t v8 = v14;
              if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0) {
                -[Download setValue:forProperty:]( self,  "setValue:forProperty:",  v19,  @"thumbnail_newsstand_binding_edge");
              }
              id v21 = [v10 objectForKey:@"UINewsstandBindingType"];
              uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
                -[Download setValue:forProperty:]( self,  "setValue:forProperty:",  v21,  @"thumbnail_newsstand_binding_type");
              }
            }

            else if ([v12 isEqualToString:@"messages-display-image"])
            {
              id v23 = [v10 objectForKey:@"url"];
              uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
              {
                __int128 v25 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v23);
                if (-[NSURL host](v25, "host")) {
                  -[Download setValue:forProperty:](self, "setValue:forProperty:", v23, @"messages_artwork_url");
                }
              }
            }
          }
        }
      }

      id v6 = [a3 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v6);
  }

  if (a4) {
    *a4 = 0LL;
  }
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___Download;
  id v5 = -[Download copyWithZone:](&v7, "copyWithZone:");
  v5[1] = -[NSArray copyWithZone:](self->_assets, "copyWithZone:", a3);
  v5[2] = -[SSDownloadPolicy copyWithZone:](self->_downloadPolicy, "copyWithZone:", a3);
  return v5;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (SSDownloadPolicy)downloadPolicy
{
  return self->_downloadPolicy;
}

- (void)setDownloadPolicy:(id)a3
{
}

- (Download)initWithMicroPaymentDownload:(id)a3 clientID:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___Download;
  id v6 = -[Download init](&v19, "init");
  if (v6)
  {
    id v7 = [a3 downloadID];
    -[Download setDatabaseID:](v6, "setDatabaseID:", [v7 longLongValue]);
    -[Download setValue:forProperty:](v6, "setValue:forProperty:", a4, @"client_id");
    -[Download setValue:forProperty:](v6, "setValue:forProperty:", v7, SSSQLEntityPropertyPersistentID);
    -[Download setValue:forProperty:]( v6,  "setValue:forProperty:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"suppress_error_dialogs");
    -[Download setValue:forProperty:]( v6,  "setValue:forProperty:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"is_from_store");
    -[Download setValue:forProperty:](v6, "setValue:forProperty:", SSDownloadKindInAppContent, @"kind");
    -[Download setValue:forProperty:]( v6,  "setValue:forProperty:",  [a3 downloadKey],  @"store_download_key");
    uint64_t v8 = objc_alloc(&OBJC_CLASS___SSDownloadPolicy);
    uint64_t v9 = -[SSDownloadPolicy initWithDownloadKind:URLBagType:]( v8,  "initWithDownloadKind:URLBagType:",  SSDownloadKindSoftwareApplication,  0LL);
    -[Download setDownloadPolicy:](v6, "setDownloadPolicy:", v9);

    id v10 = objc_alloc_init(&OBJC_CLASS___DownloadAsset);
    -[DownloadAsset setValue:forProperty:]( v10,  "setValue:forProperty:",  [a3 hashArrayData],  @"hash_array");
    -[DownloadAsset setValue:forProperty:](v10, "setValue:forProperty:", SSDownloadAssetTypeMedia, @"asset_type");
    -[DownloadAsset setValue:forProperty:](v10, "setValue:forProperty:", [a3 remoteURL], @"url");
    id v11 = [a3 sinfs];
    if (v11)
    {
      id v12 = v11;
      id v13 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v11,  0LL,  0LL,  0LL);
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      {
        id v15 = -[DownloadDRM initWithSinfArray:](objc_alloc(&OBJC_CLASS___DownloadDRM), "initWithSinfArray:", v13);
        if (-[DownloadDRM isDRMFree](v15, "isDRMFree")) {
          -[DownloadAsset setValue:forProperty:]( v10,  "setValue:forProperty:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"is_drm_free");
        }
      }

      -[DownloadAsset setValue:forProperty:](v10, "setValue:forProperty:", v12, @"sinfs_data");
    }

    id v16 = [a3 contentLength];
    id v17 = [a3 hashChunkSize];
    -[Download setAssets:]( v6,  "setAssets:",  +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v10));
  }

  return v6;
}

@end