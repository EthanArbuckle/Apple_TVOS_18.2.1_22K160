@interface CPLMemoryChange
+ (id)ckAssetProperties;
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillMissingCKAssetProperties:(id)a3 withCKRecord:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLMemoryChange

+ (id)ckAssetProperties
{
  if (qword_100296588 != -1) {
    dispatch_once(&qword_100296588, &stru_100242258);
  }
  return (id)qword_100296590;
}

- (void)fillMissingCKAssetProperties:(id)a3 withCKRecord:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLMemoryChange;
  id v7 = a3;
  -[CPLMemoryChange fillMissingCKAssetProperties:withCKRecord:]( &v12,  "fillMissingCKAssetProperties:withCKRecord:",  v7,  v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "objectForKeyedSubscript:",  @"resCustomUserAssetList",  v12.receiver,  v12.super_class));

  if (v8)
  {
    id v10 = [[CPLMemoryAssetList alloc] initWithData:v8];
    [v10 setVersion:0];
    [v10 setHasVersion:0];
    -[CPLMemoryChange setCustomUserAssetList:](self, "setCustomUserAssetList:", v10);
LABEL_6:

    goto LABEL_7;
  }

  if (!_CPLSilentLogging)
  {
    uint64_t v11 = __CPLGenericOSLogDomain(v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "Failed to find any customUserAssetList from %@",  buf,  0xCu);
    }

    goto LABEL_6;
  }

+ (id)ckPropertyForRelatedIdentifier
{
  return @"resCustomUserAssetList";
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  id v3 = a3;
  v4 = -[CKReference initWithRecord:action:](objc_alloc(&OBJC_CLASS___CKReference), "initWithRecord:action:", v3, 0LL);

  return v4;
}

- (void)fillWithCKRecord:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"title",  objc_opt_class(NSString));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[CPLMemoryChange setTitle:](v5, "setTitle:", v7);

  id v8 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"subtitle",  objc_opt_class(NSString));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[CPLMemoryChange setSubtitle:](v5, "setSubtitle:", v9);

  id v10 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"type",  objc_opt_class(NSNumber));
  uint64_t v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v10);
  objc_super v12 = v11;
  if (!v11) {
    uint64_t v11 = &off_10025A1A0;
  }
  -[CPLMemoryChange setCategory:](v5, "setCategory:", [v11 integerValue]);

  id v13 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"subtype",  objc_opt_class(NSNumber));
  id v14 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (!v14) {
    id v14 = &off_10025A1A0;
  }
  -[CPLMemoryChange setSubcategory:](v5, "setSubcategory:", [v14 integerValue]);

  id v16 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"assetList", objc_opt_class(NSData));
  uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)v17;
  if (v17)
  {
    id v19 = [[CPLMemoryAssetList alloc] initWithData:v17];
    [v19 setVersion:0];
    [v19 setHasVersion:0];
    -[CPLMemoryChange setAssetList:](v5, "setAssetList:", v19);
  }

  else
  {
    if (_CPLSilentLogging) {
      goto LABEL_11;
    }
    uint64_t v20 = __CPLGenericOSLogDomain(0LL);
    id v19 = (id)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      int v57 = 138412290;
      id v58 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_ERROR,  "Failed to find any assetListData from %@",  (uint8_t *)&v57,  0xCu);
    }
  }

LABEL_11:
  id v21 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"assetListPredicate",  objc_opt_class(NSData));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[CPLMemoryChange setAssetListPredicate:](v5, "setAssetListPredicate:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"createDate"]);
  -[CPLMemoryChange setCreationDate:](v5, "setCreationDate:", v23);

  id v24 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"graphData",  objc_opt_class(NSData));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  -[CPLMemoryChange setGraphData:](v5, "setGraphData:", v25);

  id v26 = objc_msgSend( v4,  "cpl_objectForKey:validateClass:",  @"graphVersion",  objc_opt_class(NSNumber));
  v27 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v26);
  v28 = v27;
  if (!v27) {
    v27 = &off_10025A1A0;
  }
  -[CPLMemoryChange setGraphVersion:](v5, "setGraphVersion:", [v27 longLongValue]);

  id v29 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"isFavorite", objc_opt_class(NSNumber));
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = v30;
  if (!v30) {
    v30 = &__kCFBooleanFalse;
  }
  -[CPLMemoryChange setFavorite:](v5, "setFavorite:", [v30 BOOLValue]);

  id v32 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"isRejected", objc_opt_class(NSNumber));
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = v33;
  if (!v33) {
    v33 = &__kCFBooleanFalse;
  }
  -[CPLMemoryChange setRejected:](v5, "setRejected:", [v33 BOOLValue]);

  id v35 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"movieData",  objc_opt_class(NSData));
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  -[CPLMemoryChange setMovieData:](v5, "setMovieData:", v36);

  id v37 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"score",  objc_opt_class(NSNumber));
  v38 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v37);
  v39 = v38;
  if (!v38) {
    v38 = &off_10025C708;
  }
  [v38 doubleValue];
  -[CPLMemoryChange setScore:](v5, "setScore:");

  id v40 = objc_msgSend( v4,  "cpl_objectForKey:validateClass:",  @"notificationState",  objc_opt_class(NSNumber));
  v41 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v40);
  v42 = v41;
  if (!v41) {
    v41 = &off_10025A1A0;
  }
  -[CPLMemoryChange setNotificationState:](v5, "setNotificationState:", [v41 integerValue]);

  id v43 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"blacklistedFeature",  objc_opt_class(NSData));
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  -[CPLMemoryChange setBlacklistedFeature:](v5, "setBlacklistedFeature:", v44);

  id v45 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"viewCount", objc_opt_class(NSNumber));
  v46 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v45);
  v47 = v46;
  if (!v46) {
    v46 = &off_10025A1A0;
  }
  -[CPLMemoryChange setViewCount:](v5, "setViewCount:", [v46 longLongValue]);

  id v48 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"shareCount", objc_opt_class(NSNumber));
  v49 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v48);
  v50 = v49;
  if (!v49) {
    v49 = &off_10025A1A0;
  }
  -[CPLMemoryChange setShareCount:](v5, "setShareCount:", [v49 longLongValue]);

  id v51 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"playCount", objc_opt_class(NSNumber));
  v52 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v51);
  v53 = v52;
  if (!v52) {
    v52 = &off_10025A1A0;
  }
  -[CPLMemoryChange setPlayCount:](v5, "setPlayCount:", [v52 longLongValue]);

  id v54 = objc_msgSend( v4,  "cpl_objectForKey:validateClass:",  @"isUserCreated",  objc_opt_class(NSNumber));
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  if (((unint64_t)[v55 integerValue] & 0x8000000000000000) != 0
    || (uint64_t)[v55 integerValue] > 0x80000000)
  {
    uint64_t v56 = 1LL;
  }

  else
  {
    uint64_t v56 = (uint64_t)[v55 integerValue];
  }

  -[CPLMemoryChange setUserActionOptions:](v5, "setUserActionOptions:", v56);
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v34 = a3;
  id v6 = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 fingerprintContext]);
  if (-[CPLMemoryChange hasChangeType:](v6, "hasChangeType:", 2LL))
  {
    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"title")))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMemoryChange title](v6, "title"));
      [v34 setLegacyEncryptedObject:v8 forKey:@"title"];
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"subtitle")))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMemoryChange subtitle](v6, "subtitle"));
      if (v9) {
        [v34 setLegacyEncryptedObject:v9 forKey:@"subtitle"];
      }
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"category")))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CPLMemoryChange category](v6, "category")));
      [v34 setLegacyEncryptedObject:v10 forKey:@"type"];
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"subcategory")))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CPLMemoryChange subcategory](v6, "subcategory")));
      [v34 setLegacyEncryptedObject:v11 forKey:@"subtype"];
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"assetList")))
    {
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMemoryChange assetList](v6, "assetList"));
      id v13 = v12;
      if (v12)
      {
        [v12 setVersion:kCPLMemoryListCurrentVersion];
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 data]);
        [v34 setObject:v14 forKey:@"assetList"];
      }
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"assetListPredicate")))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMemoryChange assetListPredicate](v6, "assetListPredicate"));
      if (v15) {
        [v34 setLegacyEncryptedObject:v15 forKey:@"assetListPredicate"];
      }
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"creationDate")))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMemoryChange creationDate](v6, "creationDate"));
      [v34 setObject:v16 forKey:@"createDate"];
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"graphData")))
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMemoryChange graphData](v6, "graphData"));
      if (v17) {
        [v34 setLegacyEncryptedObject:v17 forKey:@"graphData"];
      }
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"graphVersion")))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[CPLMemoryChange graphVersion](v6, "graphVersion")));
      [v34 setObject:v18 forKey:@"graphVersion"];
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"favorite")))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CPLMemoryChange isFavorite](v6, "isFavorite")));
      [v34 setObject:v19 forKey:@"isFavorite"];
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"rejected")))
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CPLMemoryChange isRejected](v6, "isRejected")));
      [v34 setObject:v20 forKey:@"isRejected"];
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"movieData")))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMemoryChange movieData](v6, "movieData"));
      if (v21) {
        [v34 setLegacyEncryptedObject:v21 forKey:@"movieData"];
      }
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"score")))
    {
      -[CPLMemoryChange score](v6, "score");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      [v34 setLegacyEncryptedObject:v22 forKey:@"score"];
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"notificationState")))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CPLMemoryChange notificationState](v6, "notificationState")));
      [v34 setObject:v23 forKey:@"notificationState"];
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"blacklistedFeature")))
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMemoryChange blacklistedFeature](v6, "blacklistedFeature"));
      [v34 setLegacyEncryptedObject:v24 forKey:@"blacklistedFeature"];
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"viewCount")))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[CPLMemoryChange viewCount](v6, "viewCount")));
      [v34 setObject:v25 forKey:@"viewCount"];
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"shareCount")))
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[CPLMemoryChange shareCount](v6, "shareCount")));
      [v34 setObject:v26 forKey:@"shareCount"];
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"playCount")))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[CPLMemoryChange playCount](v6, "playCount")));
      [v34 setObject:v27 forKey:@"playCount"];
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"userActionOptions")))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[CPLMemoryChange userActionOptions](v6, "userActionOptions")));
      [v34 setObject:v28 forKey:@"isUserCreated"];
    }

    if (-[CPLMemoryChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"customUserAssetList")))
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMemoryChange customUserAssetList](v6, "customUserAssetList"));
      v30 = v29;
      if (v29)
      {
        [v29 setVersion:kCPLMemoryListCurrentVersion];
        v31 = objc_alloc(&OBJC_CLASS___CKAsset);
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v30 data]);
        v33 = -[CKAsset initWithAssetContent:itemTypeHint:]( v31,  "initWithAssetContent:itemTypeHint:",  v32,  @"fxd");

        [v34 setObject:v33 forKey:@"resCustomUserAssetList"];
      }
    }
  }
}

@end