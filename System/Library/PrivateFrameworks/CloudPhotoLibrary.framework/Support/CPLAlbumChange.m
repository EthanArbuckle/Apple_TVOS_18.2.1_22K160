@interface CPLAlbumChange
+ (id)ckAssetProperties;
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillMissingCKAssetProperties:(id)a3 withCKRecord:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLAlbumChange

+ (id)ckAssetProperties
{
  if (qword_100296568 != -1) {
    dispatch_once(&qword_100296568, &stru_100242218);
  }
  return (id)qword_100296570;
}

- (void)fillMissingCKAssetProperties:(id)a3 withCKRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLAlbumChange;
  -[CPLAlbumChange fillMissingCKAssetProperties:withCKRecord:]( &v12,  "fillMissingCKAssetProperties:withCKRecord:",  v6,  v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"resProjectDataRes"]);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[CPLFingerprintScheme nonPrivateFingerprintScheme]( &OBJC_CLASS___CPLFingerprintScheme,  "nonPrivateFingerprintScheme"));
    [v7 cplValidateAndWarnIntegrityOfResourceData:v8 withFingerPrintKey:@"resProjectDataFingerprint" andFileSizeKey:@"resProjectDataFileSize" fingerprintScheme:v9];

    -[CPLAlbumChange setProjectData:](self, "setProjectData:", v8);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"resProjectPreviewImageDataRes"]);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[CPLFingerprintScheme nonPrivateFingerprintScheme]( &OBJC_CLASS___CPLFingerprintScheme,  "nonPrivateFingerprintScheme"));
    [v7 cplValidateAndWarnIntegrityOfResourceData:v10 withFingerPrintKey:@"resProjectPreviewImageDataFingerprint" andFileSizeKey:@"resProjectPreviewImageDataFileSize" fingerprintScheme:v11];

    -[CPLAlbumChange setProjectPreviewImageData:](self, "setProjectPreviewImageData:", v10);
  }
}

+ (id)ckPropertyForRelatedIdentifier
{
  return @"parentId";
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 recordID]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordName]);

  return v4;
}

- (void)fillWithCKRecord:(id)a3
{
  id v26 = a3;
  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:@"parentId"]);
  -[CPLAlbumChange setParentIdentifier:](v4, "setParentIdentifier:", v5);

  id v6 = objc_msgSend( v26,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"albumNameEnc",  objc_opt_class(NSString));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[CPLAlbumChange setName:](v4, "setName:", v7);

  id v8 = objc_msgSend(v26, "cpl_objectForKey:validateClass:", @"position", objc_opt_class(NSNumber));
  v9 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (!v9) {
    v9 = &off_10025A188;
  }
  -[CPLAlbumChange setPosition:](v4, "setPosition:", [v9 integerValue]);

  id v11 = objc_msgSend(v26, "cpl_objectForKey:validateClass:", @"albumType", objc_opt_class(NSNumber));
  objc_super v12 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (!v12) {
    objc_super v12 = &off_10025A1A0;
  }
  -[CPLAlbumChange setAlbumType:](v4, "setAlbumType:", [v12 unsignedIntegerValue]);

  id v14 = objc_msgSend( v26,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"importedByBundleIdentifierEnc",  objc_opt_class(NSString));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[CPLAlbumChange setImportedByBundleIdentifier:](v4, "setImportedByBundleIdentifier:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"sortType"]);
  v17 = v16;
  if (v16 && [v16 unsignedIntegerValue])
  {
    id v18 = [v17 unsignedIntegerValue];
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"sortTypeExt"]);
    v20 = v19;
    if (v19 && [v19 unsignedIntegerValue]) {
      id v18 = [v20 unsignedIntegerValue];
    }
    else {
      id v18 = 0LL;
    }
  }

  -[CPLAlbumChange setAlbumSortType:](v4, "setAlbumSortType:", v18);

  id v21 = objc_msgSend( v26,  "cpl_objectForKey:validateClass:",  @"sortAscending",  objc_opt_class(NSNumber));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = v22;
  if (!v22) {
    v22 = &__kCFBooleanFalse;
  }
  -[CPLAlbumChange setAlbumSortAscending:](v4, "setAlbumSortAscending:", [v22 BOOLValue]);

  id v24 = objc_msgSend( v26,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"projectDocumentTypeEnc",  objc_opt_class(NSString));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  -[CPLAlbumChange setProjectDocumentType:](v4, "setProjectDocumentType:", v25);
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a4 fingerprintContext]);
  if (-[CPLAlbumChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"parentIdentifier")))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLAlbumChange parentIdentifier](v7, "parentIdentifier"));
    [v6 setObject:v9 forKey:@"parentId"];
  }

  if (-[CPLAlbumChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"name")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLAlbumChange name](v7, "name"));
    [v6 setLegacyEncryptedObject:v10 forKey:@"albumNameEnc"];
  }

  if (-[CPLAlbumChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"position")))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CPLAlbumChange position](v7, "position")));
    [v6 setObject:v11 forKey:@"position"];
  }

  if (-[CPLAlbumChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"albumType")))
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CPLAlbumChange albumType](v7, "albumType")));
    [v6 setObject:v12 forKey:@"albumType"];
  }

  if (-[CPLAlbumChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"importedByBundleIdentifier")))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLAlbumChange importedByBundleIdentifier](v7, "importedByBundleIdentifier"));
    [v6 setLegacyEncryptedObject:v13 forKey:@"importedByBundleIdentifierEnc"];
  }

  if (-[CPLAlbumChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"albumSortType")))
  {
    id v14 = -[CPLAlbumChange albumSortType](v7, "albumSortType");
    id v15 = v14;
    if ((unint64_t)v14 < 6 || v14 == (id)100)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v14));
      [v6 setObject:v16 forKey:@"sortType"];

      [v6 setObject:&off_10025A1A0 forKey:@"sortTypeExt"];
    }

    else
    {
      [v6 setObject:&off_10025A1A0 forKey:@"sortType"];
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v15));
      [v6 setObject:v25 forKey:@"sortTypeExt"];
    }
  }

  if (-[CPLAlbumChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"albumSortAscending")))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CPLAlbumChange albumSortAscending](v7, "albumSortAscending")));
    [v6 setObject:v17 forKey:@"sortAscending"];
  }

  if (-[CPLAlbumChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"projectDocumentType")))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLAlbumChange projectDocumentType](v7, "projectDocumentType"));
    [v6 setLegacyEncryptedObject:v18 forKey:@"projectDocumentTypeEnc"];
  }

  if (-[CPLAlbumChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"projectData")))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLAlbumChange projectData](v7, "projectData"));
    if (!v19)
    {
      [v6 setObject:0 forKey:@"resProjectDataFingerprint"];
      [v6 setObject:0 forKey:@"resProjectDataRes"];
      [v6 setObject:0 forKey:@"resProjectDataFileSize"];
LABEL_31:

      goto LABEL_32;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[CPLFingerprintScheme nonPrivateFingerprintScheme]( &OBJC_CLASS___CPLFingerprintScheme,  "nonPrivateFingerprintScheme"));
    id v37 = 0LL;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 fingerPrintForData:v19 error:&v37]);
    id v22 = v37;

    if (v21)
    {
      [v6 setObject:v21 forKey:@"resProjectDataFingerprint"];
      id v24 = -[CKAsset initWithAssetContent:itemTypeHint:]( objc_alloc(&OBJC_CLASS___CKAsset),  "initWithAssetContent:itemTypeHint:",  v19,  @"fxd");
      [v6 setObject:v24 forKey:@"resProjectDataRes"];
    }

    else
    {
      if (_CPLSilentLogging)
      {
LABEL_30:
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v19 length]));
        [v6 setObject:v27 forKey:@"resProjectDataFileSize"];

        goto LABEL_31;
      }

      uint64_t v26 = __CPLGenericOSLogDomain(v23);
      id v24 = (CKAsset *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v24,  OS_LOG_TYPE_ERROR,  "Failed to compute fingerprint for projectData: %@",  buf,  0xCu);
      }
    }

    goto LABEL_30;
  }

@end