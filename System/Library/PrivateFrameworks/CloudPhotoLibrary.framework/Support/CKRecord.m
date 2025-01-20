@interface CKRecord
+ (Class)cpl_recordChangeClassForRecordType:(id)a3;
+ (id)cpl_expungedRecordFromCPLRecordChange:(id)a3 inZone:(id)a4 target:(id)a5;
+ (id)cpl_expungedSharedRecordFromCPLRecordChange:(id)a3 inZone:(id)a4 target:(id)a5;
+ (id)cpl_recordFromCPLRecordChange:(id)a3 scopeProvider:(id)a4 currentUserRecordID:(id)a5 inZone:(id)a6 resourceCountAndSize:(id)a7 error:(id *)a8;
- (BOOL)cpl_inExpunged;
- (BOOL)cpl_isSharedWithScopeWithIdentifier:(id)a3 scopeProvider:(id)a4 currentUserRecordID:(id)a5 isSparseRecord:(BOOL *)a6;
- (BOOL)cpl_isSparseRecord;
- (BOOL)cpl_supportsSharingScopeIdentifier;
- (CKRecord)initWithCPLArchiver:(id)a3;
- (Class)cpl_recordChangeClass;
- (id)cplChangedKeys;
- (id)cplFullDescription;
- (id)cplResourceWithType:(unint64_t)a3 scopedIdentifier:(id)a4 forRecord:(id)a5 isCoherent:(BOOL *)a6 scopeProvider:(id)a7;
- (id)cplResourcesWithScopedIdentifier:(id)a3 coherent:(BOOL *)a4 forRecord:(id)a5 scopeProvider:(id)a6;
- (id)cpl_decryptedObjectForKey:(id)a3 validateClass:(Class)a4;
- (id)cpl_destinationRecordIDInPrivateScopeWithCurrentUserRecordID:(id)a3 proposedDestinationRecordID:(id)a4;
- (id)cpl_legacyDecryptedObjectForKey:(id)a3 validateClass:(Class)a4;
- (id)cpl_objectForKey:(id)a3 validateClass:(Class)a4;
- (id)cpl_recordChangeMissingResourceProperties:(id *)a3 scopeIdentifier:(id)a4 scopeProvider:(id)a5 currentUserRecordID:(id)a6;
- (id)cpl_sharingRecordScopedIdentifierWithScopeProvider:(id)a3 currentUserRecordID:(id)a4 isSparseRecord:(BOOL *)a5;
- (id)plistArchiveWithCPLArchiver:(id)a3;
- (id)selfIfMatchesRecordName:(id)a3;
- (void)cplValidateAndWarnIntegrityOfResourceData:(id)a3 withFingerPrintKey:(id)a4 andFileSizeKey:(id)a5 fingerprintScheme:(id)a6;
- (void)cpl_setEncryptedObject:(id)a3 forKey:(id)a4 validateClass:(Class)a5;
- (void)cpl_setLegacyEncryptedObject:(id)a3 forKey:(id)a4;
- (void)cpl_updateContributorsOnSharedRecord:(id)a3;
- (void)cpl_updatePrivateRecordSharedToRecordWithID:(id)a3 currentUserRecordID:(id)a4 setSparseRecordFlag:(BOOL)a5 force:(BOOL)a6;
@end

@implementation CKRecord

- (id)cplFullDescription
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self, "recordID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 cplFullDescription]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[CKRecord recordChangeTag](self, "recordChangeTag"));
  v9 = (void *)v8;
  v10 = @"<no etag>";
  if (v8) {
    v10 = (const __CFString *)v8;
  }
  v11 = -[NSMutableString initWithFormat:]( v3,  "initWithFormat:",  @"[%@ (%@) %@ recordChangeTag=%@",  v4,  v5,  v7,  v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord valueStore](self, "valueStore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValueStore](self, "encryptedValueStore"));
  v14 = objc_alloc(&OBJC_CLASS___NSSet);
  v37 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 allKeys]);
  v16 = -[NSSet initWithArray:](v14, "initWithArray:", v15);

  v17 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  v38 = v12;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
  v19 = -[NSMutableSet initWithArray:](v17, "initWithArray:", v18);

  -[NSMutableSet unionSet:](v19, "unionSet:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord changedKeys](self, "changedKeys"));
  -[NSMutableSet addObjectsFromArray:](v19, "addObjectsFromArray:", v20);

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  v36 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v19, "allObjects"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 sortedArrayUsingSelector:"compare:"]);

  id obj = v22;
  id v23 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)i);
        if (-[NSSet containsObject:](v16, "containsObject:", v27))
        {
          uint64_t v28 = objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v27]);
          if (v28) {
            v29 = (__CFString *)v28;
          }
          else {
            v29 = @"<failed to decrypt>";
          }
          v30 = @" (encrypted)";
        }

        else
        {
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:v27]);
          v30 = &stru_1002482B0;
        }

        uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSData);
        if ((objc_opt_isKindOfClass(v29, v31) & 1) != 0)
        {
          v32 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"<%lu bytes>",  -[__CFString length](v29, "length"));
        }

        else
        {
          uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v29, v33) & 1) != 0) {
            v32 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"\"%@\"",  v29);
          }
          else {
            v32 = (NSString *)objc_claimAutoreleasedReturnValue(-[__CFString description](v29, "description"));
          }
        }

        v34 = v32;
        -[NSMutableString appendFormat:](v11, "appendFormat:", @"\n%@%@%@ = %@", @"  ", v27, v30, v32);
      }

      id v24 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }

    while (v24);
  }

  -[NSMutableString appendString:](v11, "appendString:", @"]");
  return v11;
}

+ (Class)cpl_recordChangeClassForRecordType:(id)a3
{
  return (Class)CPLRecordChangeClassForCKRecordType(a3);
}

- (Class)cpl_recordChangeClass
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType"));
  id v3 = CPLRecordChangeClassForCKRecordType(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (Class)v4;
}

- (id)cpl_objectForKey:(id)a3 validateClass:(Class)a4
{
  id v6 = a3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[CKRecord objectForKey:](self, "objectForKey:", v6));
  uint64_t v8 = (void *)v7;
  if (v7)
  {
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v7, a4);
    if ((isKindOfClass & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v10 = __CPLGenericOSLogDomain(isKindOfClass);
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType"));
          int v14 = 138412802;
          id v15 = v6;
          __int16 v16 = 2112;
          v17 = v12;
          __int16 v18 = 2112;
          v19 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Unexpected object for key %@ in record of type %@: %@",  (uint8_t *)&v14,  0x20u);
        }
      }

      uint64_t v8 = 0LL;
    }
  }

  return v8;
}

- (void)cplValidateAndWarnIntegrityOfResourceData:(id)a3 withFingerPrintKey:(id)a4 andFileSizeKey:(id)a5 fingerprintScheme:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v27 = 0LL;
  v13 = (CKRecord *)objc_claimAutoreleasedReturnValue([a6 fingerPrintForData:v10 error:&v27]);
  id v14 = v27;
  id v15 = v14;
  if (v13)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[CKRecord objectForKey:](self, "objectForKey:", v11));
    v17 = (void *)v16;
    if (!v16 || (uint64_t v16 = (uint64_t)[(id)v16 isEqual:v13], (v16 & 1) == 0))
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v18 = __CPLGenericOSLogDomain(v16);
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v29 = v13;
          __int16 v30 = 2112;
          uint64_t v31 = v17;
          __int16 v32 = 2112;
          uint64_t v33 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Mismatching fingerprint (fetched %@ vs. expected %@) for resourceData for %@",  buf,  0x20u);
        }
      }
    }

- (id)cplChangedKeys
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord valueStore](self, "valueStore"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 changedKeysSet]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  id v6 = [v5 mutableCopy];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValueStore](self, "encryptedValueStore"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 changedKeysSet]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  [v6 addObjectsFromArray:v9];

  return v6;
}

- (BOOL)cpl_inExpunged
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"isExpunged"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)cpl_isSparseRecord
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord objectForKey:](self, "objectForKey:", @"isSparsePrivateRecord"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)cpl_sharingRecordScopedIdentifierWithScopeProvider:(id)a3 currentUserRecordID:(id)a4 isSparseRecord:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord objectForKey:](self, "objectForKey:", @"isSparsePrivateRecord"));
  *a5 = [v10 BOOLValue];

  if (*a5)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord objectForKey:](self, "objectForKey:", @"linkedShareZoneName"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord objectForKey:](self, "objectForKey:", @"linkedShareZoneOwner"));
    if (!v11) {
      goto LABEL_24;
    }
    v13 = CKCurrentUserDefaultName;
    if (v12)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 recordID]);
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 recordName]);

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 recordName]);
      unint64_t v17 = (unint64_t)v16;
      if (v15 && v16)
      {
        unsigned __int8 v18 = [(id)v15 isEqual:v16];

        if ((v18 & 1) != 0) {
          goto LABEL_11;
        }
      }

      else
      {

        if (!(v15 | v17)) {
          goto LABEL_11;
        }
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue([v12 recordID]);
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 recordName]);

      v13 = (NSString *)v20;
    }

- (BOOL)cpl_supportsSharingScopeIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType"));
  id v3 = CPLRecordChangeClassForCKRecordType(v2);

  if (v3) {
    return [v3 supportsSharingScopedIdentifier];
  }
  else {
    return 0;
  }
}

- (BOOL)cpl_isSharedWithScopeWithIdentifier:(id)a3 scopeProvider:(id)a4 currentUserRecordID:(id)a5 isSparseRecord:(BOOL *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord objectForKey:](self, "objectForKey:", @"isSparsePrivateRecord"));
  *a6 = [v13 BOOLValue];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord objectForKey:](self, "objectForKey:", @"linkedShareZoneName"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord objectForKey:](self, "objectForKey:", @"linkedShareZoneOwner"));
  if (v14)
  {
    uint64_t v16 = CKCurrentUserDefaultName;
    id v32 = v10;
    if (!v15) {
      goto LABEL_10;
    }
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 recordID]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 recordName]);

    v19 = (void *)objc_claimAutoreleasedReturnValue([v12 recordName]);
    unint64_t v20 = (unint64_t)v19;
    if (v18 && v19)
    {
      unsigned __int8 v21 = [(id)v18 isEqual:v19];

      if ((v21 & 1) != 0)
      {
LABEL_10:
        uint64_t v25 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  v14,  v16);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v11 scopeIdentifierFromZoneID:v25]);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudKitScopeForScopeIdentifier:v26]);
        if (v27)
        {
          if (v26 && ([v26 isEqualToString:v32] & 1) != 0)
          {

            BOOL v22 = 1;
LABEL_20:
            id v10 = v32;
            goto LABEL_21;
          }
        }

        else
        {
          if (!_CPLSilentLogging)
          {
            id v28 = sub_10006C678();
            v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self, "recordID"));
              *(_DWORD *)buf = 138412546;
              v34 = v30;
              __int16 v35 = 2112;
              v36 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%@ record points to unknown zone %@",  buf,  0x16u);
            }
          }

          v26 = 0LL;
        }

        BOOL v22 = 0;
        goto LABEL_20;
      }
    }

    else
    {

      if (!(v18 | v20)) {
        goto LABEL_10;
      }
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v15 recordID]);
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 recordName]);

    uint64_t v16 = (NSString *)v24;
    goto LABEL_10;
  }

  BOOL v22 = 0;
LABEL_21:

  return v22;
}

- (void)cpl_updatePrivateRecordSharedToRecordWithID:(id)a3 currentUserRecordID:(id)a4 setSparseRecordFlag:(BOOL)a5 force:(BOOL)a6
{
  BOOL v7 = a5;
  id v20 = a3;
  id v10 = a4;
  if (a6
    || (id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType")),
        unsigned int v12 = [CPLRecordChangeClassForCKRecordType(v11) supportsSharingScopedIdentifier],
        v11,
        v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v20 zoneID]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 ownerName]);
    uint64_t v15 = CPLCKReferenceToUser(v14, v10);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    -[CKRecord setObject:forKey:](self, "setObject:forKey:", v16, @"linkedShareZoneOwner");
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v20 zoneID]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
    -[CKRecord setObject:forKey:](self, "setObject:forKey:", v18, @"linkedShareZoneName");

    v19 = (void *)objc_claimAutoreleasedReturnValue([v20 recordName]);
    -[CKRecord setObject:forKey:](self, "setObject:forKey:", v19, @"linkedShareRecordName");

    if (v7) {
      -[CKRecord setObject:forKey:](self, "setObject:forKey:", &__kCFBooleanTrue, @"isSparsePrivateRecord");
    }
  }
}

- (void)cpl_updateContributorsOnSharedRecord:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v25 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self, "recordID"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);

    BOOL v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v26 = v4;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)i),  v6);
          id v14 = -[CKReference initWithRecordID:action:]( objc_alloc(&OBJC_CLASS___CKReference),  "initWithRecordID:action:",  v13,  0LL);
          -[NSMutableArray addObject:](v7, "addObject:", v14);
        }

        id v10 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }

      while (v10);
    }

    if (!_CPLSilentLogging)
    {
      id v15 = sub_10006C678();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](v25, "recordID"));
        *(_DWORD *)buf = 138412546;
        id v32 = v7;
        __int16 v33 = 2114;
        v34 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Setting proposed contributors to %@ for record %{public}@",  buf,  0x16u);
      }
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord pluginFields](v25, "pluginFields"));
    v19 = (NSMutableDictionary *)[v18 mutableCopy];

    if (!v19) {
      v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setValue:forKey:](v19, "setValue:forKey:", v7, @"proposedContributors");
    id v20 = -[CKRecord setPluginFields:](v25, "setPluginFields:", v19);
    id v4 = v26;
    if (!_CPLSilentLogging)
    {
      uint64_t v21 = __CPLGenericOSLogDomain(v20);
      BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](v25, "recordID"));
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 recordName]);
        *(_DWORD *)buf = 138412546;
        id v32 = v19;
        __int16 v33 = 2112;
        v34 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Setting plugin fields to %@ for %@",  buf,  0x16u);
      }
    }
  }
}

- (id)cpl_destinationRecordIDInPrivateScopeWithCurrentUserRecordID:(id)a3 proposedDestinationRecordID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"remappedBy"));
  if (v8)
  {
    id v27 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 recordName]);
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v26 = -[CPLRemappedBy initWithData:](objc_alloc(&OBJC_CLASS___CPLRemappedBy), "initWithData:", v8);
    uint64_t v10 = sub_1000475BC((uint64_t)v26);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v29;
      while (2)
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
          uint64_t v17 = sub_10004126C(v16);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          unsigned __int8 v19 = [v18 isEqualToString:v9];

          if ((v19 & 1) != 0)
          {
            uint64_t v21 = objc_alloc(&OBJC_CLASS___CKRecordID);
            uint64_t v22 = sub_100041280(v16);
            id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
            id v20 = -[CKRecordID initWithRecordName:zoneID:](v21, "initWithRecordName:zoneID:", v23, v24);

            id v6 = v27;
            goto LABEL_13;
          }
        }

        id v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16, v26);
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v6 = v27;
  }

  id v20 = (CKRecordID *)v7;
LABEL_13:

  return v20;
}

- (id)cpl_decryptedObjectForKey:(id)a3 validateClass:(Class)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](self, "encryptedValues"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

  if (v8 && (objc_opt_isKindOfClass(v8, a4) & 1) == 0) {
    id v9 = (id)objc_claimAutoreleasedReturnValue( -[CKRecord cpl_legacyDecryptedObjectForKey:validateClass:]( self,  "cpl_legacyDecryptedObjectForKey:validateClass:",  v6,  a4));
  }
  else {
    id v9 = v8;
  }
  uint64_t v10 = v9;

  return v10;
}

- (void)cpl_setEncryptedObject:(id)a3 forKey:(id)a4 validateClass:(Class)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](self, "encryptedValues"));
  [v9 setObject:v8 forKeyedSubscript:v7];
}

- (id)cpl_legacyDecryptedObjectForKey:(id)a3 validateClass:(Class)a4
{
  id v6 = a3;
  if ((-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class(&OBJC_CLASS___NSString)) & 1) == 0
    && (-[objc_class isSubclassOfClass:]( a4,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___NSDictionary)) & 1) == 0 && (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class(&OBJC_CLASS___NSArray)) & 1) == 0 && (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class(&OBJC_CLASS___NSNumber)) & 1) == 0 && (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class(&OBJC_CLASS___NSDate)) & 1) == 0 && (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class(&OBJC_CLASS___NSData)) & 1) == 0)
  {
    sub_1001951B0((uint64_t)a4);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](self, "encryptedValues"));
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

  if ((v8
     || (id v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[CKRecord objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v6))) != 0LL)
    && (objc_opt_isKindOfClass(v8, a4) & 1) == 0)
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
    {
      if (-[objc_class isSubclassOfClass:]( a4,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___NSString)))
      {
        id v9 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v8, 4LL);
        goto LABEL_11;
      }

      id v35 = 0LL;
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v8,  0LL,  0LL,  &v35));
      id v20 = v35;
      uint64_t v21 = v19;
      uint64_t v10 = v21;
      if (v21 || _CPLSilentLogging)
      {
        BOOL v27 = v21 == 0LL;

        if (!v27)
        {
          if ((objc_opt_isKindOfClass(v10, a4) & 1) != 0) {
            goto LABEL_20;
          }
          if (!_CPLSilentLogging)
          {
            id v28 = sub_10006D6C8();
            __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType"));
              __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self, "recordID"));
              id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 recordName]);
              __int16 v33 = (void *)objc_opt_class(v10);
              *(_DWORD *)buf = 138543874;
              id v37 = v30;
              __int16 v38 = 2114;
              v39 = v32;
              __int16 v40 = 2114;
              id v41 = v33;
              id v34 = v33;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Unexpected object for %{public}@.%{public}@: %{public}@",  buf,  0x20u);
            }
          }
        }
      }

      else
      {
        id v22 = sub_10006D6C8();
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          id v24 = (id)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType"));
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self, "recordID"));
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 recordName]);
          *(_DWORD *)buf = 138543874;
          id v37 = v24;
          __int16 v38 = 2114;
          v39 = v26;
          __int16 v40 = 2112;
          id v41 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Unable to decode property list for %{public}@.%{public}@: %@",  buf,  0x20u);
        }
      }
    }

    else if (!_CPLSilentLogging)
    {
      id v12 = sub_10006D6C8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self, "recordID"));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 recordName]);
        *(_DWORD *)buf = 138543874;
        id v37 = v14;
        __int16 v38 = 2114;
        v39 = v16;
        __int16 v40 = 2114;
        id v41 = (id)objc_opt_class(v8);
        id v17 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Unexpected object instead of encrypted data for %{public}@.%{public}@: %{public}@",  buf,  0x20u);
      }
    }

    uint64_t v10 = 0LL;
    goto LABEL_20;
  }

  id v9 = v8;
  id v8 = v9;
LABEL_11:
  uint64_t v10 = v9;
LABEL_20:

  return v10;
}

- (void)cpl_setLegacyEncryptedObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue([v6 dataUsingEncoding:4]);
    }

    else
    {
      id v18 = 0LL;
      id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v6,  200LL,  0LL,  &v18));
      id v11 = v18;
      if (!v9 && !_CPLSilentLogging)
      {
        id v12 = sub_10006D6C8();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v14 = (id)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType"));
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self, "recordID"));
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 recordName]);
          *(_DWORD *)buf = 138543874;
          id v20 = v14;
          __int16 v21 = 2114;
          id v22 = v16;
          __int16 v23 = 2112;
          id v24 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Unable to convert property list for %{public}@.%{public}@: %@",  buf,  0x20u);
        }
      }
    }

    if (v9) {
      goto LABEL_13;
    }
LABEL_14:
    -[CKRecord setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", 0LL, v7);
    goto LABEL_15;
  }

  id v9 = v6;
LABEL_13:
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](self, "encryptedValues"));
  [v17 setObject:v9 forKeyedSubscript:v7];

LABEL_15:
}

+ (id)cpl_expungedRecordFromCPLRecordChange:(id)a3 inZone:(id)a4 target:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = CPLBaseCKRecordFromCPLRecordChange(v7, v8, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v11 setObject:v12 forKey:@"recordModificationDate"];

  [v11 setObject:&__kCFBooleanTrue forKey:@"isDeleted"];
  [v11 setObject:&__kCFBooleanTrue forKey:@"isExpunged"];

  return v11;
}

+ (id)cpl_expungedSharedRecordFromCPLRecordChange:(id)a3 inZone:(id)a4 target:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = CPLBaseSharedCKRecordFromCPLRecordChange(v7, v8, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v11 setObject:v12 forKey:@"recordModificationDate"];

  [v11 setObject:&__kCFBooleanTrue forKey:@"isDeleted"];
  [v11 setObject:&__kCFBooleanTrue forKey:@"isExpunged"];

  return v11;
}

+ (id)cpl_recordFromCPLRecordChange:(id)a3 scopeProvider:(id)a4 currentUserRecordID:(id)a5 inZone:(id)a6 resourceCountAndSize:(id)a7 error:(id *)a8
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(&OBJC_CLASS___CPLSimpleRecordTargetMapping);
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 scopedIdentifier]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 targetForRecordWithScopedIdentifier:v19]);
  __int16 v21 = CPLBaseCKRecordFromCPLRecordChange(v17, v14, v20);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  __int16 v23 = -[CPLSimpleCKRecordBuilder initWithBaseCKRecord:scopeProvider:currentUserRecordID:targetMapping:]( objc_alloc(&OBJC_CLASS___CPLSimpleCKRecordBuilder),  "initWithBaseCKRecord:scopeProvider:currentUserRecordID:targetMapping:",  v22,  v16,  v15,  v18);
  LODWORD(a8) = [v17 prepareWithCKRecordBuilder:v23 resourceCountAndSize:v13 scopeProvider:v16 error:a8];

  if ((_DWORD)a8) {
    id v24 = v22;
  }
  else {
    id v24 = 0LL;
  }

  return v24;
}

- (id)cpl_recordChangeMissingResourceProperties:(id *)a3 scopeIdentifier:(id)a4 scopeProvider:(id)a5 currentUserRecordID:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType"));
  id v14 = (objc_class *)CPLRecordChangeClassForCKRecordType(v13);
  if (v14)
  {
    id v15 = objc_alloc_init(v14);
    [v15 prepareWithCKRecord:self scopeIdentifier:v10 scopeProvider:v11 currentUserRecordID:v12];
    if (([v15 isDelete] & 1) == 0)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"dateExpunged"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dateByAddingTimeInterval:-2592000.0]);
      [v15 setDateDeleted:v17];

      [v15 fillWithCKRecord:self missingResourceProperties:a3 scopeProvider:v11];
    }

    id v18 = v15;
  }

  else
  {
    id v18 = 0LL;
  }

  return v18;
}

- (id)cplResourceWithType:(unint64_t)a3 scopedIdentifier:(id)a4 forRecord:(id)a5 isCoherent:(BOOL *)a6 scopeProvider:(id)a7
{
  id v12 = (CKRecord *)a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = sub_1000896D4((uint64_t)&OBJC_CLASS___CPLCloudKitResourceKeys, a3);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (!v16) {
    goto LABEL_68;
  }
  unint64_t v105 = a3;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord pluginFields](self, "pluginFields"));
  uint64_t v18 = sub_100089C40((uint64_t)v16);
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v19]);
  unsigned int v21 = [v20 BOOLValue];

  *a6 = 1;
  v98 = self;
  unsigned int v104 = v21;
  v106 = v17;
  if (v21)
  {
    id v22 = a6;
    uint64_t v23 = sub_100031F28((uint64_t)v16);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v24]);
    id v114 = [v25 unsignedIntegerValue];

    uint64_t v26 = sub_100089BD4((uint64_t)v16);
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    id v109 = (id)objc_claimAutoreleasedReturnValue([v17 objectForKey:v27]);

    uint64_t v28 = sub_100089BE0((uint64_t)v16);
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v29]);

    uint64_t v31 = sub_100089BEC((uint64_t)v16);
    id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    id v33 = v14;
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v32]);

    double v112 = (double)(uint64_t)[v30 integerValue];
    double v113 = (double)(uint64_t)[v34 integerValue];
    uint64_t v35 = sub_100089BF8((uint64_t)v16);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v36]);
    id v38 = CPLDynamicFingerPrintFromCloudKitFingerPrint(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);

    id v14 = v33;
    __int16 v40 = 0LL;
    id v41 = 0LL;
    __int128 v42 = 0LL;
    BOOL v43 = 0;
    unsigned int v101 = 1;
  }

  else
  {
    uint64_t v44 = sub_100089BF8((uint64_t)v16);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord objectForKey:](self, "objectForKey:", v45));

    uint64_t v46 = sub_100089C34((uint64_t)v16);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord objectForKey:](self, "objectForKey:", v47));

    if (v39)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue([v14 fingerprintContext]);
      v49 = (void *)objc_claimAutoreleasedReturnValue([v48 fingerprintSchemeForFingerprint:v39]);

      v97 = v49;
      if (v49 && (id v50 = [v49 isValid], (_DWORD)v50))
      {
        id v110 = 0LL;
        id v111 = 0LL;
        v94 = sub_1000A7488( (id *)[CPLCloudKitResourceRecordProperties alloc],  v16,  [v13 recordClass],  v49);
        sub_1000A7E0C((uint64_t)v94, &v111, &v114, &v112, &v110, self);
        v107 = (CPLResource *)v111;
        id v109 = v110;
        __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v99 signature]);
        if (v40)
        {
          v92 = v13;
          v51 = (void *)objc_claimAutoreleasedReturnValue([v14 fingerprintContext]);
          uint64_t v52 = objc_claimAutoreleasedReturnValue([v51 fingerprintSchemeForSignature:v40]);

          v93 = (void *)v52;
          if ((void *)v52 == v49)
          {
            if ([v49 isForStableHash])
            {
              unsigned int v66 = 0;
              __int128 v42 = v107;
              id v13 = v92;
              v54 = v93;
            }

            else
            {
              id v13 = v92;
              unsigned int v66 = [v92 requiresStableHashForResourceType:v105];
              __int128 v42 = v107;
              v54 = v93;
            }

            unsigned int v101 = [v97 canMatchSignatureToFingerprint];
          }

          else
          {
            v102 = v40;
            v95 = a6;
            id v13 = v92;
            v54 = v93;
            if (!_CPLSilentLogging)
            {
              uint64_t v55 = __CPLGenericOSLogDomain(v53);
              v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                v57 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self, "recordID"));
                v58 = (void *)objc_claimAutoreleasedReturnValue( +[CPLResource shortDescriptionForResourceType:]( &OBJC_CLASS___CPLResource,  "shortDescriptionForResourceType:",  v105));
                v59 = (void *)objc_claimAutoreleasedReturnValue([v93 fingerprintSchemeDescription]);
                v60 = (void *)objc_claimAutoreleasedReturnValue([v97 fingerprintSchemeDescription]);
                *(_DWORD *)buf = 138544386;
                v116 = v57;
                __int16 v117 = 2112;
                v118 = v12;
                __int16 v119 = 2112;
                v120 = v58;
                __int16 v121 = 2114;
                v122 = v59;
                __int16 v123 = 2114;
                v124 = v60;
                _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "CKRecord %{public}@ (for %@) has a CKAsset for %@ with a fingerprint of a different scheme %{public}@ (vs. %{public}@)",  buf,  0x34u);

                v54 = v93;
              }
            }

            a6 = v95;
            BOOL *v95 = 0;
            __int128 v42 = v107;
            if (!v107)
            {
              if ([v97 isForStableHash]
                && ([v54 isForStableHash] & 1) == 0)
              {
                __int128 v42 = v39;
              }

              else
              {
                __int128 v42 = 0LL;
              }
            }

            uint64_t v67 = objc_claimAutoreleasedReturnValue(+[CKAsset cplFingerPrintForSignature:](&OBJC_CLASS___CKAsset, "cplFingerPrintForSignature:", v102));

            unsigned int v66 = 0;
            unsigned int v101 = 0;
            v39 = (void *)v67;
            __int16 v40 = v102;
          }
        }

        else
        {
          unsigned int v66 = 0;
          unsigned int v101 = 1;
          __int128 v42 = v107;
        }

        id v22 = a6;

        BOOL v43 = v66 != 0;
      }

      else
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v61 = __CPLGenericOSLogDomain(v50);
          v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            v63 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self, "recordID"));
            id v64 = v14;
            v65 = (void *)objc_claimAutoreleasedReturnValue( +[CPLResource shortDescriptionForResourceType:]( &OBJC_CLASS___CPLResource,  "shortDescriptionForResourceType:",  v105));
            *(_DWORD *)buf = 138544130;
            v116 = v63;
            __int16 v117 = 2112;
            v118 = v12;
            __int16 v119 = 2112;
            v120 = v65;
            __int16 v121 = 2112;
            v122 = v39;
            _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "CKRecord %{public}@ (for %@) has a CKAsset for %@ with an invalid fingerprint (%@) attached",  buf,  0x2Au);

            id v14 = v64;
          }
        }

        id v22 = a6;

        __int16 v40 = 0LL;
        __int128 v42 = 0LL;
        BOOL v43 = 0;
        v39 = 0LL;
        id v109 = 0LL;
        unsigned int v101 = 1;
      }
    }

    else
    {
      id v22 = a6;
      __int16 v40 = 0LL;
      __int128 v42 = 0LL;
      BOOL v43 = 0;
      id v109 = 0LL;
      unsigned int v101 = 1;
    }

    id v41 = v99;
  }

  v108 = v42;
  if (!v39) {
    goto LABEL_67;
  }
  v103 = v40;
  v68 = objc_alloc_init(&OBJC_CLASS___CPLResourceIdentity);
  id v69 = -[CPLResourceIdentity setFingerPrint:](v68, "setFingerPrint:", v39);
  if (v42) {
    BOOL v70 = 0;
  }
  else {
    BOOL v70 = v43;
  }
  if (v70 && !_CPLSilentLogging)
  {
    uint64_t v71 = __CPLGenericOSLogDomain(v69);
    v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](v98, "recordID"));
      v96 = v22;
      v74 = v41;
      v75 = (void *)objc_claimAutoreleasedReturnValue( +[CPLResource shortDescriptionForResourceType:]( &OBJC_CLASS___CPLResource,  "shortDescriptionForResourceType:",  v105));
      *(_DWORD *)buf = 138543874;
      v116 = v73;
      __int16 v117 = 2112;
      v118 = v12;
      __int16 v119 = 2112;
      v120 = v75;
      _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_ERROR,  "CKRecord %{public}@ (for %@) has no stable hash for %@",  buf,  0x20u);

      __int128 v42 = v108;
      id v41 = v74;
      id v22 = v96;
    }
  }

  -[CPLResourceIdentity setStableHash:](v68, "setStableHash:", v42);
  -[CPLResourceIdentity setFileSize:](v68, "setFileSize:", v114);
  -[CPLResourceIdentity setFileUTI:](v68, "setFileUTI:", v109);
  id v76 = -[CPLResourceIdentity setImageDimensions:](v68, "setImageDimensions:", v112, v113);
  if (v41) {
    int v77 = 1;
  }
  else {
    int v77 = v104;
  }
  if (v77 == 1)
  {
    -[CPLResourceIdentity setAvailable:](v68, "setAvailable:", 1LL);
  }

  else if (!_CPLSilentLogging)
  {
    uint64_t v78 = __CPLGenericOSLogDomain(v76);
    v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v80 = sub_100089C34((uint64_t)v16);
      v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
      *(_DWORD *)buf = 138412546;
      v116 = v81;
      __int16 v117 = 2112;
      v118 = v98;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Did not find %@ in %@", buf, 0x16u);
    }
  }

  if (*v22)
  {
    if (v101)
    {
      if (v103)
      {
        v100 = v41;
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[CKAsset cplFingerPrintForSignature:](&OBJC_CLASS___CKAsset, "cplFingerPrintForSignature:"));
        id v83 = v39;
        id v84 = v82;
        if (v84 && ([v83 isEqual:v84] & 1) != 0)
        {
          char v85 = 1;
          id v41 = v100;
LABEL_63:

          BOOL *v22 = v85;
          goto LABEL_64;
        }

        id v41 = v100;
      }

      else
      {
        id v86 = v39;
        id v84 = 0LL;
      }

      char v85 = 0;
      goto LABEL_63;
    }

    BOOL *v22 = 1;
  }

- (id)cplResourcesWithScopedIdentifier:(id)a3 coherent:(BOOL *)a4 forRecord:(id)a5 scopeProvider:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  uint64_t v35 = sub_10006EAB0;
  v36 = sub_10006EAC0;
  id v37 = 0LL;
  id v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472LL;
  id v24 = sub_10006EAC8;
  uint64_t v25 = &unk_100240F10;
  id v13 = v11;
  id v26 = v13;
  BOOL v27 = self;
  id v14 = v10;
  id v28 = v14;
  id v15 = v12;
  id v29 = v15;
  __int128 v30 = &v32;
  uint64_t v31 = a4;
  +[CPLResource enumerateResourceTypesWithBlock:](&OBJC_CLASS___CPLResource, "enumerateResourceTypesWithBlock:", &v22);
  id v16 = (id)v33[5];
  id v17 = v16;
  if (*a4 && objc_msgSend(v16, "count", v22, v23, v24, v25, v26, v27, v28))
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[CPLCloudKitFakeDynamicDerivatives overriddenResourcesFromResources:]( &OBJC_CLASS___CPLCloudKitFakeDynamicDerivatives,  "overriddenResourcesFromResources:",  v17));

    id v17 = (void *)v18;
  }

  unsigned __int8 v19 = v29;
  id v20 = v17;

  _Block_object_dispose(&v32, 8);
  return v20;
}

- (id)plistArchiveWithCPLArchiver:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 archiveCursor]);
  [v4 setArchiveCursor:v5];
  -[CKRecord encodeWithCoder:](self, "encodeWithCoder:", v4);
  [v4 setArchiveCursor:v6];

  return v5;
}

- (CKRecord)initWithCPLArchiver:(id)a3
{
  return -[CKRecord initWithCoder:](self, "initWithCoder:", a3);
}

- (id)selfIfMatchesRecordName:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self, "recordID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 recordName]);
  unsigned int v7 = [v6 isEqualToString:v4];

  if (v7) {
    id v8 = self;
  }
  else {
    id v8 = 0LL;
  }
  return v8;
}

@end