@interface CPLPersonChange
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLPersonChange

+ (id)ckPropertyForRelatedIdentifier
{
  return @"mergeTargetRef";
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  id v3 = a3;
  v4 = -[CKReference initWithRecord:action:](objc_alloc(&OBJC_CLASS___CKReference), "initWithRecord:action:", v3, 0LL);

  return v4;
}

- (void)fillWithCKRecord:(id)a3
{
  id v28 = a3;
  v4 = self;
  id v5 = objc_msgSend( v28,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"personFullNameEnc",  objc_opt_class(NSString));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[CPLPersonChange setFullName:](v4, "setFullName:", v6);

  id v7 = objc_msgSend(v28, "cpl_objectForKey:validateClass:", @"personType", objc_opt_class(NSNumber));
  v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (!v8) {
    v8 = &off_10025A1A0;
  }
  -[CPLPersonChange setPersonType:](v4, "setPersonType:", [v8 integerValue]);

  id v10 = objc_msgSend( v28,  "cpl_objectForKey:validateClass:",  @"manualSortOrder",  objc_opt_class(NSNumber));
  v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (!v11) {
    v11 = &off_10025A1A0;
  }
  -[CPLPersonChange setManualSortOrder:](v4, "setManualSortOrder:", [v11 integerValue]);

  if (+[CPLPersonChange serverSupportsAssetSortOrder]( &OBJC_CLASS___CPLPersonChange,  "serverSupportsAssetSortOrder"))
  {
    id v13 = objc_msgSend( v28,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"sortAscendingEnc",  objc_opt_class(NSNumber));
    v14 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v13);
    v15 = v14;
    if (!v14) {
      v14 = &off_10025A1A0;
    }
    -[CPLPersonChange setAssetSortOrder:](v4, "setAssetSortOrder:", [v14 integerValue]);
  }

  id v16 = objc_msgSend( v28,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"displayName",  objc_opt_class(NSString));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[CPLPersonChange setDisplayName:](v4, "setDisplayName:", v17);

  id v18 = objc_msgSend( v28,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"contactDescriptor",  objc_opt_class(NSData));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[CPLPersonChange setContactDescriptor:](v4, "setContactDescriptor:", v19);

  if (+[CPLPersonChange serverSupportsGraphPeopleHome]( &OBJC_CLASS___CPLPersonChange,  "serverSupportsGraphPeopleHome"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"verifiedType"]);
    -[CPLPersonChange setVerifiedType:](v4, "setVerifiedType:", [v20 integerValue]);
  }

  if (+[CPLPersonChange serverSupportsDetectionType]( &OBJC_CLASS___CPLPersonChange,  "serverSupportsDetectionType"))
  {
    id v21 = objc_msgSend( v28,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"detectionTypeEnc",  objc_opt_class(NSNumber));
    v22 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v21);
    v23 = v22;
    if (!v22) {
      v22 = &off_10025A1A0;
    }
    -[CPLPersonChange setDetectionType:]( v4,  "setDetectionType:",  (__int16)[v22 integerValue]);
  }

  if (+[CPLPersonChange serverSupportsMergeTargetRef]( &OBJC_CLASS___CPLPersonChange,  "serverSupportsMergeTargetRef"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"mergeTargetRef"]);
    v25 = v24;
    if (v24)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue([v24 recordID]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 recordName]);

      -[CPLPersonChange setMergeTargetPersonIdentifier:](v4, "setMergeTargetPersonIdentifier:", v27);
    }
  }
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v27 = a3;
  v6 = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 fingerprintContext]);
  if (-[CPLPersonChange hasChangeType:](v6, "hasChangeType:", 2LL))
  {
    if (-[CPLPersonChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"fullName")))
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[CPLPersonChange fullName](v6, "fullName"));
      v9 = (void *)v8;
      id v10 = &stru_1002482B0;
      if (v8) {
        id v10 = (__CFString *)v8;
      }
      v11 = v10;

      [v27 setLegacyEncryptedObject:v11 forKey:@"personFullNameEnc"];
    }

    if (-[CPLPersonChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"personType")))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CPLPersonChange personType](v6, "personType")));
      [v27 setObject:v12 forKey:@"personType"];
    }

    if (-[CPLPersonChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"manualSortOrder")))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CPLPersonChange manualSortOrder](v6, "manualSortOrder")));
      [v27 setObject:v13 forKey:@"manualSortOrder"];
    }

    if (+[CPLPersonChange serverSupportsAssetSortOrder]( &OBJC_CLASS___CPLPersonChange,  "serverSupportsAssetSortOrder")
      && -[CPLPersonChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"assetSortOrder")))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CPLPersonChange assetSortOrder](v6, "assetSortOrder")));
      [v27 setLegacyEncryptedObject:v14 forKey:@"sortAscendingEnc"];
    }

    if (-[CPLPersonChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"displayName")))
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue(-[CPLPersonChange displayName](v6, "displayName"));
      id v16 = (void *)v15;
      v17 = &stru_1002482B0;
      if (v15) {
        v17 = (__CFString *)v15;
      }
      id v18 = v17;

      [v27 setLegacyEncryptedObject:v18 forKey:@"displayName"];
    }

    if (-[CPLPersonChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"contactDescriptor")))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPersonChange contactDescriptor](v6, "contactDescriptor"));
      if (v19) {
        [v27 setLegacyEncryptedObject:v19 forKey:@"contactDescriptor"];
      }
    }

    if (-[CPLPersonChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"verifiedType"))
      && +[CPLPersonChange serverSupportsGraphPeopleHome]( &OBJC_CLASS___CPLPersonChange,  "serverSupportsGraphPeopleHome")
      && -[CPLPersonChange verifiedType](v6, "verifiedType"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CPLPersonChange verifiedType](v6, "verifiedType")));
      [v27 setObject:v20 forKey:@"verifiedType"];
    }

    if (+[CPLPersonChange serverSupportsDetectionType]( &OBJC_CLASS___CPLPersonChange,  "serverSupportsDetectionType")
      && -[CPLPersonChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"detectionType")))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  -[CPLPersonChange detectionType](v6, "detectionType")));
      [v27 setLegacyEncryptedObject:v21 forKey:@"detectionTypeEnc"];
    }

    if (-[CPLPersonChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"mergeTargetPersonIdentifier")))
    {
      if (+[CPLPersonChange serverSupportsMergeTargetRef]( &OBJC_CLASS___CPLPersonChange,  "serverSupportsMergeTargetRef"))
      {
        uint64_t v22 = objc_claimAutoreleasedReturnValue(-[CPLPersonChange mergeTargetPersonIdentifier](v6, "mergeTargetPersonIdentifier"));
        if (v22)
        {
          v23 = (void *)v22;
          v24 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPersonChange scopedIdentifier](v6, "scopedIdentifier"));
          id v26 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:]( v24,  "initRelativeToScopedIdentifier:identifier:",  v25,  v23);

          if (v26)
          {
            [v27 setCKReferenceWithScopedIdentifier:v26 forKey:@"mergeTargetRef" referenceAction:0];
          }
        }
      }
    }
  }
}

@end