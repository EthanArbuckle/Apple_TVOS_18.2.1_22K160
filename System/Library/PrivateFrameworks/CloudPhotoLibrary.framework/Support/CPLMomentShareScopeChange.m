@interface CPLMomentShareScopeChange
- (id)_libraryStateFromRootRecord:(id)a3;
- (id)rootRecordUsingTempCKAssetURL:(id)a3 inZone:(id)a4;
- (void)updateCKShare:(id)a3;
- (void)updateWithCKShare:(id)a3 currentUserID:(id)a4;
- (void)updateWithRootCKRecord:(id)a3;
@end

@implementation CPLMomentShareScopeChange

- (void)updateWithCKShare:(id)a3 currentUserID:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CPLMomentShareScopeChange;
  -[CPLMomentShareScopeChange updateWithCKShare:currentUserID:](&v10, "updateWithCKShare:currentUserID:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:CKShareThumbnailImageDataKey]);
  if (v7) {
    -[CPLMomentShareScopeChange setThumbnailImageData:](self, "setThumbnailImageData:", v7);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:CKShareTypeKey]);
  unsigned int v9 = [v8 isEqualToString:@"photos_links"];

  if (v9) {
    -[CPLMomentShareScopeChange setHasEPPAssets:](self, "setHasEPPAssets:", 1LL);
  }
}

- (id)_libraryStateFromRootRecord:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___CPLLibraryState);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 pluginFields]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"expiryDate"]);

  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v8 = __CPLGenericOSLogDomain(v7);
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v3 recordID]);
        int v15 = 138412546;
        v16 = v10;
        __int16 v17 = 2112;
        v18 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Got expiryDate from %@ to %@",  (uint8_t *)&v15,  0x16u);
      }
    }

    [v4 setDeleteDate:v6];
  }

  else if (!_CPLSilentLogging)
  {
    uint64_t v11 = __CPLGenericOSLogDomain(v7);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v3 recordID]);
      int v15 = 138412290;
      v16 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "No expiry date found in %@",  (uint8_t *)&v15,  0xCu);
    }
  }

  return v4;
}

- (void)updateWithRootCKRecord:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___CPLMomentShareScopeChange;
  -[CPLMomentShareScopeChange updateWithRootCKRecord:](&v39, "updateWithRootCKRecord:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMomentShareScopeChange _libraryStateFromRootRecord:](self, "_libraryStateFromRootRecord:", v4));
  -[CPLMomentShareScopeChange setLibraryState:](self, "setLibraryState:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"createDate"]);
  -[CPLMomentShareScopeChange setCreationDate:](self, "setCreationDate:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"startDate"]);
  -[CPLMomentShareScopeChange setStartDate:](self, "setStartDate:", v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"endDate"]);
  -[CPLMomentShareScopeChange setEndDate:](self, "setEndDate:", v8);

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 pluginFields]);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"expiryDate"]);

  if (v10)
  {
    -[CPLMomentShareScopeChange setExpiryDate:](self, "setExpiryDate:", v10);
  }

  else if (!_CPLSilentLogging)
  {
    uint64_t v12 = __CPLGenericOSLogDomain(v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to get expiryDate from server", buf, 2u);
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"assetCount"]);
  -[CPLMomentShareScopeChange setPromisedAssetCount:](self, "setPromisedAssetCount:", [v14 integerValue]);
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"photosCount"]);
  -[CPLMomentShareScopeChange setPromisedPhotosCount:]( self,  "setPromisedPhotosCount:",  [v15 integerValue]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"videosCount"]);
  -[CPLMomentShareScopeChange setPromisedVideosCount:]( self,  "setPromisedVideosCount:",  [v16 integerValue]);
  id v17 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"originatingZoneName",  objc_opt_class(NSString));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (v18) {
    -[CPLMomentShareScopeChange setOriginatingScopeIdentifier:](self, "setOriginatingScopeIdentifier:", v18);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"previewData"]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 fileURL]);
  if (v20)
  {
    v37 = v20;
    v36 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v35 = v4;
    v22 = v18;
    v23 = v16;
    v24 = v15;
    v25 = v14;
    v26 = v10;
    v27 = v5;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v37 path]);
    unsigned int v29 = [v21 fileExistsAtPath:v28];

    v5 = v27;
    objc_super v10 = v26;
    v14 = v25;
    int v15 = v24;
    v16 = v23;
    v18 = v22;
    id v4 = v35;

    v19 = v36;
    v20 = v37;
    if (v29)
    {
      id v38 = 0LL;
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v37,  1LL,  &v38));
      id v31 = v38;
      v32 = v31;
      if (v31)
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v33 = __CPLGenericOSLogDomain(v31);
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v41 = v37;
            __int16 v42 = 2112;
            v43 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Failed to read previewData from %@: %@",  buf,  0x16u);
          }
        }
      }

      else
      {
        -[CPLMomentShareScopeChange setPreviewImageData:](self, "setPreviewImageData:", v30);
      }

      v19 = v36;
      v20 = v37;
    }
  }
}

- (id)rootRecordUsingTempCKAssetURL:(id)a3 inZone:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a4 zoneID]);
  uint64_t v8 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  @"cmm-root",  v7);
  unsigned int v9 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"CMMRoot",  v8);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMomentShareScopeChange creationDate](self, "creationDate"));
  uint64_t v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  v13 = v12;

  -[CKRecord setObject:forKey:](v9, "setObject:forKey:", v13, @"createDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMomentShareScopeChange startDate](self, "startDate"));
  if (v14) {
    -[CKRecord setObject:forKey:](v9, "setObject:forKey:", v14, @"startDate");
  }
  int v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMomentShareScopeChange endDate](self, "endDate"));
  if (v15) {
    -[CKRecord setObject:forKey:](v9, "setObject:forKey:", v15, @"endDate");
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CPLMomentShareScopeChange promisedAssetCount](self, "promisedAssetCount")));
  -[CKRecord setObject:forKey:](v9, "setObject:forKey:", v16, @"assetCount");

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CPLMomentShareScopeChange promisedPhotosCount](self, "promisedPhotosCount")));
  -[CKRecord setObject:forKey:](v9, "setObject:forKey:", v17, @"photosCount");

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CPLMomentShareScopeChange promisedVideosCount](self, "promisedVideosCount")));
  -[CKRecord setObject:forKey:](v9, "setObject:forKey:", v18, @"videosCount");

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMomentShareScopeChange originatingScopeIdentifier](self, "originatingScopeIdentifier"));
  if (v19)
  {
    v20 = v19;
    id v21 = [v19 rangeOfString:@"#_"];
    if (v21 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v22 = objc_claimAutoreleasedReturnValue([v20 substringToIndex:v21]);

      v20 = (void *)v22;
    }

    -[CKRecord cpl_setLegacyEncryptedObject:forKey:]( v9,  "cpl_setLegacyEncryptedObject:forKey:",  v20,  @"originatingZoneName");
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMomentShareScopeChange previewImageData](self, "previewImageData"));
  if (v23)
  {
    uint64_t v33 = v8;
    v24 = v7;
    id v25 = v6;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:@"preview.data" isDirectory:0]);
    id v34 = 0LL;
    unsigned int v27 = [v23 writeToURL:v26 options:1 error:&v34];
    id v28 = v34;
    unsigned int v29 = v28;
    if (v27)
    {
      v30 = -[CKAsset initWithFileURL:](objc_alloc(&OBJC_CLASS___CKAsset), "initWithFileURL:", v26);
      -[CKAsset setItemTypeHint:](v30, "setItemTypeHint:", @"fxd");
      -[CKRecord setObject:forKey:](v9, "setObject:forKey:", v30, @"previewData");
    }

    else
    {
      if (_CPLSilentLogging)
      {
LABEL_19:

        id v6 = v25;
        uint64_t v7 = v24;
        uint64_t v8 = v33;
        goto LABEL_20;
      }

      uint64_t v31 = __CPLGenericOSLogDomain(v28);
      v30 = (CKAsset *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v26;
        __int16 v37 = 2112;
        id v38 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v30,  OS_LOG_TYPE_ERROR,  "Failed to write resource data to %@: %@",  buf,  0x16u);
      }
    }

    goto LABEL_19;
  }

- (void)updateCKShare:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CPLMomentShareScopeChange;
  -[CPLMomentShareScopeChange updateCKShare:](&v8, "updateCKShare:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMomentShareScopeChange share](self, "share"));
  id v6 = v5;
  if (v5) {
    objc_msgSend( v4,  "setAllowsAnonymousPublicAccess:",  ((unint64_t)objc_msgSend(v5, "publicPermission") & 0xFFFFFFFFFFFFFFFELL) == 2);
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLMomentShareScopeChange thumbnailImageData](self, "thumbnailImageData"));
  [v4 setObject:v7 forKey:CKShareThumbnailImageDataKey];
}

@end