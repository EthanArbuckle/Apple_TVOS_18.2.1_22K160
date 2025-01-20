@interface CPLSocialGroupChange
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
+ (void)setRelatedValueOnRecord:(id)a3 fromRelatedRecord:(id)a4;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLSocialGroupChange

+ (id)ckPropertyForRelatedIdentifier
{
  return @"keyAssetIdEnc";
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 recordID]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordName]);

  return v4;
}

+ (void)setRelatedValueOnRecord:(id)a3 fromRelatedRecord:(id)a4
{
  if (a4)
  {
    id v5 = a3;
    id v7 = (id)objc_claimAutoreleasedReturnValue([a4 recordID]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]);
    objc_msgSend( v5,  "cpl_setEncryptedObject:forKey:validateClass:",  v6,  @"keyAssetIdEnc",  objc_opt_class(NSString));
  }

- (void)fillWithCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = objc_msgSend( v4,  "cpl_decryptedObjectForKey:validateClass:",  @"verifiedTypeEnc",  objc_opt_class(NSNumber));
  id v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (!v7) {
    id v7 = &off_10025A1A0;
  }
  -[CPLSocialGroupChange setVerifiedType:]( v5,  "setVerifiedType:",  (__int16)[v7 integerValue]);

  id v9 = objc_msgSend( v4,  "cpl_decryptedObjectForKey:validateClass:",  @"customTitleEnc",  objc_opt_class(NSString));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[CPLSocialGroupChange setCustomTitle:](v5, "setCustomTitle:", v10);

  id v11 = objc_msgSend( v4,  "cpl_decryptedObjectForKey:validateClass:",  @"positionEnc",  objc_opt_class(NSNumber));
  v12 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (!v12) {
    v12 = &off_10025A1A0;
  }
  -[CPLSocialGroupChange setPosition:](v5, "setPosition:", [v12 integerValue]);

  id v14 = objc_msgSend( v4,  "cpl_decryptedObjectForKey:validateClass:",  @"keyAssetIdEnc",  objc_opt_class(NSString));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[CPLSocialGroupChange setKeyAssetIdentifier:](v5, "setKeyAssetIdentifier:", v15);

  id v16 = objc_msgSend( v4,  "cpl_decryptedObjectForKey:validateClass:",  @"personListEnc",  objc_opt_class(NSData));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if ([v17 length])
  {
    -[CPLSocialGroupChange setPersonsData:](v5, "setPersonsData:", v17);
  }

  else if (!_CPLSilentLogging)
  {
    uint64_t v18 = __CPLGenericOSLogDomain(0LL);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412290;
      id v21 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to find any personsData for %@",  (uint8_t *)&v20,  0xCu);
    }
  }
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a4 fingerprintContext]);
  if (-[CPLSocialGroupChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"verifiedType")))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  -[CPLSocialGroupChange verifiedType](v7, "verifiedType")));
    [v6 setEncryptedObject:v9 forKey:@"verifiedTypeEnc" validateClass:objc_opt_class(NSNumber)];
  }

  if (-[CPLSocialGroupChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"customTitle")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSocialGroupChange customTitle](v7, "customTitle"));
    [v6 setEncryptedObject:v10 forKey:@"customTitleEnc" validateClass:objc_opt_class(NSString)];
  }

  if (-[CPLSocialGroupChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"position")))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CPLSocialGroupChange position](v7, "position")));
    [v6 setEncryptedObject:v11 forKey:@"positionEnc" validateClass:objc_opt_class(NSNumber)];
  }

  if (-[CPLSocialGroupChange shouldApplyPropertiesWithSelector:]( v7,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"keyAssetIdentifier")))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSocialGroupChange keyAssetIdentifier](v7, "keyAssetIdentifier"));
    if (v12) {
      [v6 setEncryptedObject:v12 forKey:@"keyAssetIdEnc" validateClass:objc_opt_class(NSString)];
    }
  }

  v13 = v7;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v14 = [&__NSArray0__struct countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
LABEL_15:
    uint64_t v17 = 0LL;
    while (1)
    {
      if (*(void *)v21 != v16) {
        objc_enumerationMutation(&__NSArray0__struct);
      }
      if ((-[CPLSocialGroupChange shouldApplyPropertiesWithSelector:]( v13,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(*(NSString **)(*((void *)&v20 + 1) + 8 * v17))) & 1) != 0) {
        break;
      }
      if (v15 == (id)++v17)
      {
        id v15 = [&__NSArray0__struct countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v15) {
          goto LABEL_15;
        }
        goto LABEL_21;
      }
    }

@end