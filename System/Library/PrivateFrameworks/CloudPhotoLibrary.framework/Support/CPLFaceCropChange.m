@interface CPLFaceCropChange
+ (id)ckAssetProperties;
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillMissingCKAssetProperties:(id)a3 withCKRecord:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLFaceCropChange

+ (id)ckAssetProperties
{
  if (qword_100296578 != -1) {
    dispatch_once(&qword_100296578, &stru_100242238);
  }
  return (id)qword_100296580;
}

- (void)fillMissingCKAssetProperties:(id)a3 withCKRecord:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CPLFaceCropChange;
  id v7 = a3;
  -[CPLFaceCropChange fillMissingCKAssetProperties:withCKRecord:]( &v10,  "fillMissingCKAssetProperties:withCKRecord:",  v7,  v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", @"resFaceCropRes", v10.receiver, v10.super_class));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[CPLFingerprintScheme nonPrivateFingerprintScheme]( &OBJC_CLASS___CPLFingerprintScheme,  "nonPrivateFingerprintScheme"));
    [v6 cplValidateAndWarnIntegrityOfResourceData:v8 withFingerPrintKey:@"resFaceCropFingerprint" andFileSizeKey:@"resFaceCropFileSize" fingerprintScheme:v9];

    -[CPLFaceCropChange setResourceData:](self, "setResourceData:", v8);
  }
}

+ (id)ckPropertyForRelatedIdentifier
{
  return @"personRef";
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  id v3 = a3;
  v4 = -[CKReference initWithRecord:action:](objc_alloc(&OBJC_CLASS___CKReference), "initWithRecord:action:", v3, 0LL);

  return v4;
}

- (void)fillWithCKRecord:(id)a3
{
  id v13 = a3;
  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"personRef"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 recordID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 recordName]);

  -[CPLFaceCropChange setPersonIdentifier:](v4, "setPersonIdentifier:", v7);
  id v8 = objc_msgSend(v13, "cpl_objectForKey:validateClass:", @"type", objc_opt_class(NSNumber));
  v9 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v8);
  objc_super v10 = v9;
  if (!v9) {
    v9 = &off_10025A1A0;
  }
  -[CPLFaceCropChange setFaceCropType:](v4, "setFaceCropType:", [v9 integerValue]);

  if (+[CPLPersonChange serverSupportsGraphPeopleHome]( &OBJC_CLASS___CPLPersonChange,  "serverSupportsGraphPeopleHome"))
  {
    id v11 = objc_msgSend( v13,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"rejectedPersonIdentifier",  objc_opt_class(NSString));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[CPLFaceCropChange setRejectedPersonIdentifier:](v4, "setRejectedPersonIdentifier:", v12);
  }
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v8 fingerprintContext]);
  if (-[CPLFaceCropChange shouldApplyPropertiesWithSelector:]( v9,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"personIdentifier")))
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[CPLFaceCropChange personScopedIdentifier](v9, "personScopedIdentifier"));
    if (!v11) {
      sub_10019779C((uint64_t)v9, (uint64_t)a2);
    }
    v12 = (void *)v11;
    [v7 setCKReferenceWithScopedIdentifier:v11 forKey:@"personRef" referenceAction:0];
  }

  if (-[CPLFaceCropChange shouldApplyPropertiesWithSelector:]( v9,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"resourceData")))
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CPLFaceCropChange resourceData](v9, "resourceData"));
    if (!v13) {
      sub_100197870((uint64_t)v9, (uint64_t)a2);
    }
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[CPLFingerprintScheme nonPrivateFingerprintScheme]( &OBJC_CLASS___CPLFingerprintScheme,  "nonPrivateFingerprintScheme"));
    id v25 = 0LL;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 fingerPrintForData:v14 error:&v25]);
    id v17 = v25;

    if (v16)
    {
      [v7 setObject:v16 forKey:@"resFaceCropFingerprint"];
      v19 = -[CKAsset initWithAssetContent:itemTypeHint:]( objc_alloc(&OBJC_CLASS___CKAsset),  "initWithAssetContent:itemTypeHint:",  v14,  @"fxd");
      [v7 setObject:v19 forKey:@"resFaceCropRes"];
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v14 length]));
      [v7 setObject:v20 forKey:@"resFaceCropFileSize"];
    }

    else
    {
      if (_CPLSilentLogging)
      {
LABEL_13:

        goto LABEL_14;
      }

      uint64_t v21 = __CPLGenericOSLogDomain(v18);
      v19 = (CKAsset *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_ERROR,  "Failed to compute fingerprint for faceCrop: %@",  buf,  0xCu);
      }
    }

    goto LABEL_13;
  }

@end