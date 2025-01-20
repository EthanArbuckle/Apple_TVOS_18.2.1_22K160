@interface CPLCloudKitZoneIdentification
+ (BOOL)isScopeReadonlyFromCKShare:(id)a3;
+ (BOOL)isSupportedShare:(id)a3;
+ (BOOL)isSupportedShareType:(id)a3;
+ (BOOL)isSupportedZoneID:(id)a3;
+ (BOOL)shouldProtectZoneIDFromDeletion:(id)a3;
+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4;
+ (NSArray)recordNamesForScopeInfo;
+ (NSArray)shareTypes;
+ (NSArray)supportedZonePrefixes;
+ (NSString)libraryInfoRecordName;
+ (NSString)rootRecordName;
+ (NSString)shareRecordName;
+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3;
+ (id)recordsToFetchToIdentifyZoneID:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5;
+ (int64_t)_permissionFromCKShare:(id)a3;
+ (int64_t)proposedScopeTypeForCloudKitScope:(id)a3;
+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6;
- (BOOL)_isScopeReadonlyFromCKShare:(id)a3;
- (BOOL)isSupportedShare:(id)a3;
- (BOOL)isSupportedShareType:(id)a3;
- (BOOL)supportsDeletionOfRecord:(id)a3 scopeProvider:(id)a4;
- (BOOL)supportsDeletionOfRecordClass:(Class)a3;
- (BOOL)supportsDirectDeletionOfRecord:(id)a3 scopeProvider:(id)a4;
- (BOOL)supportsDirectDeletionOfRecordClass:(Class)a3;
- (BOOL)supportsDownloadOfChange:(id)a3 scopeProvider:(id)a4;
- (BOOL)supportsDownloadOfRecordClass:(Class)a3;
- (BOOL)supportsUploadOfChange:(id)a3 scopeProvider:(id)a4;
- (BOOL)supportsUploadOfRecordClass:(Class)a3;
- (BOOL)supportsZoneCreation;
- (BOOL)supportsZoneDelete;
- (CKRecordID)rootRecordID;
- (CKRecordID)shareRecordIDToDelete;
- (CKRecordZone)zone;
- (CKRecordZoneID)zoneID;
- (CPLCloudKitScope)cloudKitScope;
- (CPLCloudKitZoneIdentification)initWithCloudKitScope:(id)a3 engineScope:(id)a4;
- (CPLEngineScope)engineScope;
- (NSString)libraryInfoRecordName;
- (NSString)rootRecordType;
- (NSString)scopeIdentifier;
- (NSString)shareRecordName;
- (id)_baseScopeChange;
- (id)_rootRef;
- (id)newScopeIdentifierRelativeToMainScopeIdentifier:(id)a3;
- (id)proposedStagingZoneIdentificationWithCurrentUserID:(id)a3;
- (id)recordIDWithRecordName:(id)a3;
- (id)recordsToFetchForScopeInfoWithCurrentUserID:(id)a3;
- (id)recordsToUpdateFromScopeChange:(id)a3 currentUserID:(id)a4;
- (id)scopeChangeFromCKRecords:(id)a3 currentUserID:(id)a4 previousScopeChange:(id)a5;
- (id)scopeFlagsUpdateFromCKRecords:(id)a3;
- (id)scopedIdentifierWithIdentifier:(id)a3;
- (id)shareType;
- (id)shareTypeForScopeChange:(id)a3;
- (id)updatedFlagsFromCKRecord:(id)a3;
- (id)updatedFlagsFromDeletedCKRecordID:(id)a3 recordType:(id)a4;
- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withCKRecord:(id)a5;
- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withDeletedCKRecordID:(id)a5 recordType:(id)a6;
- (int64_t)databaseScope;
- (int64_t)operationType;
- (int64_t)scopeType;
- (void)setupRootOnRecord:(id)a3;
- (void)validateAcceptSharedScopeTask:(id)a3 completionHandler:(id)a4;
- (void)validateCreateScopeTask:(id)a3 completionHandler:(id)a4;
@end

@implementation CPLCloudKitZoneIdentification

+ (BOOL)shouldProtectZoneIDFromDeletion:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneName]);
  unsigned __int8 v4 = [v3 hasPrefix:CPLPrimaryScopeIdentifier];

  return v4;
}

- (CPLCloudKitZoneIdentification)initWithCloudKitScope:(id)a3 engineScope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class(self) supportsCloudKitScope:v6 engineScope:v7])
  {
    v26.receiver = self;
    v26.super_class = (Class)&OBJC_CLASS___CPLCloudKitZoneIdentification;
    v8 = -[CPLCloudKitZoneIdentification init](&v26, "init");
    if (!v8)
    {
LABEL_17:
      self = v8;
      v14 = self;
      goto LABEL_18;
    }

    uint64_t v9 = (uint64_t)[v6 options];
    uint64_t v10 = v9;
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification shareRecordName](v8, "shareRecordName"));
    v12 = (void *)v11;
    if (v11 && CKRecordNameZoneWideShare)
    {
      unsigned __int8 v13 = [(id)v11 isEqual:CKRecordNameZoneWideShare];

      if ((v13 & 1) == 0) {
        goto LABEL_10;
      }
    }

    else
    {
      unint64_t v15 = v11 | (unint64_t)CKRecordNameZoneWideShare;

      if (v15)
      {
LABEL_10:
        v16 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 ownerName]);
        unsigned int v18 = [v17 isEqualToString:CKCurrentUserDefaultName];

        if (v18) {
          uint64_t v19 = v10;
        }
        else {
          uint64_t v19 = v10 | 2;
        }
        if (v19 == v9)
        {
          v20 = (CPLCloudKitScope *)v6;
          cloudKitScope = v8->_cloudKitScope;
          v8->_cloudKitScope = v20;
        }

        else
        {
          v22 = objc_alloc(&OBJC_CLASS___CPLCloudKitScope);
          cloudKitScope = (CPLCloudKitScope *)objc_claimAutoreleasedReturnValue([v6 zone]);
          v23 = -[CPLCloudKitScope initWithZone:options:](v22, "initWithZone:options:", cloudKitScope, v19);
          v24 = v8->_cloudKitScope;
          v8->_cloudKitScope = v23;
        }

        objc_storeStrong((id *)&v8->_engineScope, a4);
        goto LABEL_17;
      }
    }

    uint64_t v10 = v9 | 4;
    goto LABEL_10;
  }

  v14 = 0LL;
LABEL_18:

  return v14;
}

+ (NSArray)recordNamesForScopeInfo
{
  v3 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 3LL);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([a1 rootRecordName]);
  if (v4) {
    -[NSMutableArray addObject:](v3, "addObject:", v4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 shareRecordName]);
  if (v5) {
    -[NSMutableArray addObject:](v3, "addObject:", v5);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 libraryInfoRecordName]);
  if (v6) {
    -[NSMutableArray addObject:](v3, "addObject:", v6);
  }

  return (NSArray *)v3;
}

+ (id)recordsToFetchToIdentifyZoneID:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 recordNamesForScopeInfo]);
  v8 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v7 count]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      unsigned __int8 v13 = 0LL;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v13);
        unint64_t v15 = objc_alloc(&OBJC_CLASS___CKRecordID);
        v16 = -[CKRecordID initWithRecordName:zoneID:](v15, "initWithRecordName:zoneID:", v14, v6, (void)v18);
        -[NSMutableArray addObject:](v8, "addObject:", v16);

        unsigned __int8 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v11);
  }

  return v8;
}

+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6
{
  return 0LL;
}

+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4
{
  return 0;
}

- (id)recordsToFetchForScopeInfoWithCurrentUserID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_opt_class(self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification cloudKitScope](self, "cloudKitScope"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "recordsToFetchToIdentifyZoneID:proposedScopeType:currentUserID:",  v7,  -[CPLEngineScope scopeType](self->_engineScope, "scopeType"),  v4));

  return v8;
}

- (BOOL)supportsZoneDelete
{
  return 0;
}

- (BOOL)supportsZoneCreation
{
  return 0;
}

- (CKRecordID)shareRecordIDToDelete
{
  return 0LL;
}

- (id)recordsToUpdateFromScopeChange:(id)a3 currentUserID:(id)a4
{
  return &__NSArray0__struct;
}

- (id)_baseScopeChange
{
  id v3 = -[CPLEngineScope scopeType](self->_engineScope, "scopeType");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_engineScope, "scopeIdentifier"));
  id v5 = +[CPLScopeChange newScopeChangeInferClassWithScopeIdentifier:type:]( &OBJC_CLASS___CPLScopeChange,  "newScopeChangeInferClassWithScopeIdentifier:type:",  v4,  v3);

  return v5;
}

- (id)scopeChangeFromCKRecords:(id)a3 currentUserID:(id)a4 previousScopeChange:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification _baseScopeChange](self, "_baseScopeChange"));
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification libraryInfoRecordName](self, "libraryInfoRecordName"));
  if (v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self, "zoneID"));
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 cplRecordWithName:v13 zonedID:v14]);

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zone](self, "zone"));
      [v12 updateWithLibraryInfoCKRecord:v15 zone:v16 userRecordID:v10];
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification shareRecordName](self, "shareRecordName"));
  if (v17)
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self, "zoneID"));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v9 cplRecordWithName:v17 zonedID:v18]);

    if (v19 && -[CPLCloudKitZoneIdentification isSupportedShare:](self, "isSupportedShare:", v19)) {
      [v12 updateWithCKShare:v19 currentUserID:v10];
    }
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification rootRecordID](self, "rootRecordID"));
  if (v20)
  {
    SEL v30 = a2;
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v20]);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification rootRecordType](self, "rootRecordType"));
    if (!v22) {
      sub_100196A9C((uint64_t)self, (uint64_t)v30);
    }
    v23 = (void *)v22;
    v31 = v13;
    id v24 = v9;
    id v25 = v10;
    id v26 = v11;
    if (v21)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v21 recordType]);
      unsigned int v28 = [v27 isEqualToString:v23];

      if (v28) {
        [v12 updateWithRootCKRecord:v21];
      }
    }

    id v11 = v26;
    id v10 = v25;
    id v9 = v24;
    unsigned __int8 v13 = v31;
  }

  return v12;
}

- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withCKRecord:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9) {
    sub_100196B7C((uint64_t)self, (uint64_t)a2);
  }
  uint64_t v12 = v11;
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification libraryInfoRecordName](self, "libraryInfoRecordName"));
  if (v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 selfIfMatchesRecordName:v13]);
    if (v14)
    {
      id v15 = [v9 copy];
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zone](self, "zone"));
      [v15 updateWithLibraryInfoCKRecord:v14 zone:v16 userRecordID:v10];
    }

    else
    {
      id v15 = 0LL;
    }
  }

  else
  {
    id v15 = 0LL;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification shareRecordName](self, "shareRecordName"));
  if (v17)
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v12 selfIfMatchesRecordName:v17]);
    if (v18 && -[CPLCloudKitZoneIdentification isSupportedShare:](self, "isSupportedShare:", v18))
    {
      if (!v15) {
        id v15 = [v9 copy];
      }
      [v15 updateWithCKShare:v18 currentUserID:v10];
    }
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification rootRecordID](self, "rootRecordID"));
  if (v19)
  {
    SEL v29 = a2;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v12 recordID]);
    else {
      __int128 v21 = 0LL;
    }
    id v22 = v21;

    if (v22)
    {
      uint64_t v23 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification rootRecordType](self, "rootRecordType"));
      if (!v23) {
        sub_100196C5C((uint64_t)self, (uint64_t)v29);
      }
      id v24 = (void *)v23;
      SEL v30 = v9;
      id v25 = v10;
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v22 recordType]);
      unsigned int v27 = [v26 isEqualToString:v24];

      if (v27)
      {
        if (!v15) {
          id v15 = [v30 copy];
        }
        [v15 updateWithRootCKRecord:v22];
      }

      id v10 = v25;

      id v9 = v30;
    }
  }

  return v15;
}

- (id)scopeFlagsUpdateFromCKRecords:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___CPLEngineScopeFlagsUpdate);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification shareRecordName](self, "shareRecordName"));
  if (v7)
  {
    id v8 = [(id)objc_opt_class(self) shareTypes];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    if (!v9) {
      sub_100196D3C((uint64_t)self, (uint64_t)a2);
    }
    id v10 = (void *)v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self, "zoneID"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 cplRecordWithName:v7 zonedID:v11]);
    if (v12)
    {
      unsigned __int8 v13 = (void *)v12;
      if (-[CPLCloudKitZoneIdentification isSupportedShare:](self, "isSupportedShare:", v12)) {
        -[CPLEngineScopeFlagsUpdate setValue:forFlag:]( v6,  "setValue:forFlag:",  -[CPLCloudKitZoneIdentification _isScopeReadonlyFromCKShare:](self, "_isScopeReadonlyFromCKShare:", v13),  1LL);
      }
    }
  }

  return v6;
}

- (id)updatedFlagsFromCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification shareRecordName](self, "shareRecordName"));
  if (v5 && (uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 selfIfMatchesRecordName:v5])) != 0)
  {
    id v7 = (void *)v6;
    if (-[CPLCloudKitZoneIdentification isSupportedShare:](self, "isSupportedShare:", v6))
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___CPLEngineScopeFlagsUpdate);
      -[CPLEngineScopeFlagsUpdate setValue:forFlag:]( v8,  "setValue:forFlag:",  -[CPLCloudKitZoneIdentification _isScopeReadonlyFromCKShare:](self, "_isScopeReadonlyFromCKShare:", v7),  1LL);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withDeletedCKRecordID:(id)a5 recordType:(id)a6
{
  return 0LL;
}

- (id)updatedFlagsFromDeletedCKRecordID:(id)a3 recordType:(id)a4
{
  return 0LL;
}

+ (NSArray)supportedZonePrefixes
{
  return (NSArray *)&__NSArray0__struct;
}

+ (BOOL)isSupportedZoneID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneName]);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "supportedZonePrefixes", 0));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([v4 hasPrefix:*(void *)(*((void *)&v10 + 1) + 8 * (void)i)])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

+ (int64_t)proposedScopeTypeForCloudKitScope:(id)a3
{
  return 0LL;
}

+ (NSString)rootRecordName
{
  return 0LL;
}

+ (NSString)shareRecordName
{
  return 0LL;
}

+ (NSArray)shareTypes
{
  return 0LL;
}

+ (BOOL)isSupportedShareType:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "shareTypes", 0));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)i) isEqualToString:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

+ (BOOL)isSupportedShare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKShare);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:CKShareTypeKey]);
    if (v6) {
      unsigned __int8 v7 = [a1 isSupportedShareType:v6];
    }
    else {
      unsigned __int8 v7 = 0;
    }
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)isSupportedShareType:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(id)objc_opt_class(self) isSupportedShareType:v4];

  return (char)self;
}

- (BOOL)isSupportedShare:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(id)objc_opt_class(self) isSupportedShare:v4];

  return (char)self;
}

+ (NSString)libraryInfoRecordName
{
  return 0LL;
}

- (id)proposedStagingZoneIdentificationWithCurrentUserID:(id)a3
{
  return 0LL;
}

- (CKRecordID)rootRecordID
{
  id v3 = [(id)objc_opt_class(self) rootRecordName];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification recordIDWithRecordName:](self, "recordIDWithRecordName:", v4));
  }
  else {
    uint64_t v5 = 0LL;
  }

  return (CKRecordID *)v5;
}

- (NSString)rootRecordType
{
  return 0LL;
}

- (NSString)shareRecordName
{
  return (NSString *)[(id)objc_opt_class(self) shareRecordName];
}

- (id)shareType
{
  v2 = (void *)objc_opt_class(self);
  return _[v2 shareType];
}

- (id)shareTypeForScopeChange:(id)a3
{
  id v3 = [(id)objc_opt_class(self) shareTypes];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  return v5;
}

- (NSString)libraryInfoRecordName
{
  return (NSString *)[(id)objc_opt_class(self) libraryInfoRecordName];
}

- (id)_rootRef
{
  if (self->_hasCachedRootRef)
  {
    id v3 = self->_cachedRootRef;
  }

  else
  {
    self->_hasCachedRootRef = 1;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification rootRecordID](self, "rootRecordID"));
    if (v4)
    {
      uint64_t v5 = -[CKReference initWithRecordID:action:]( objc_alloc(&OBJC_CLASS___CKReference),  "initWithRecordID:action:",  v4,  0LL);
      cachedRootRef = self->_cachedRootRef;
      self->_cachedRootRef = v5;
    }

    else
    {
      cachedRootRef = self->_cachedRootRef;
      self->_cachedRootRef = 0LL;
    }

    id v3 = self->_cachedRootRef;
  }

  return v3;
}

- (int64_t)operationType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification cloudKitScope](self, "cloudKitScope"));
  int64_t v3 = CPLCloudKitOperationTypeForScope(v2);

  return v3;
}

- (int64_t)databaseScope
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification cloudKitScope](self, "cloudKitScope"));
  id v3 = [v2 databaseScope];

  return (int64_t)v3;
}

- (void)setupRootOnRecord:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification _rootRef](self, "_rootRef"));
  if (v4) {
    [v5 setParent:v4];
  }
}

- (BOOL)supportsUploadOfChange:(id)a3 scopeProvider:(id)a4
{
  return -[CPLCloudKitZoneIdentification supportsUploadOfRecordClass:]( self,  "supportsUploadOfRecordClass:",  [a3 recordClass]);
}

- (BOOL)supportsDownloadOfChange:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 isAssetChange])
  {
LABEL_6:
    LOBYTE(self) = -[CPLCloudKitZoneIdentification supportsDownloadOfRecordClass:]( self,  "supportsDownloadOfRecordClass:",  [v6 recordClass]);
    goto LABEL_7;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 relatedIdentifier]);

  if (!v8) {
    goto LABEL_6;
  }
LABEL_4:
  self = (CPLCloudKitZoneIdentification *)objc_claimAutoreleasedReturnValue([v7 fingerprintContext]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 fingerprintSchemeWithContext:self]);

  LODWORD(self) = [v9 isMMCSv2] ^ 1;
LABEL_7:

  return (char)self;
}

- (BOOL)supportsDirectDeletionOfRecord:(id)a3 scopeProvider:(id)a4
{
  return [a3 supportsDirectDeletion];
}

- (BOOL)supportsDeletionOfRecord:(id)a3 scopeProvider:(id)a4
{
  return [a3 supportsDeletion];
}

- (BOOL)supportsUploadOfRecordClass:(Class)a3
{
  return 1;
}

- (BOOL)supportsDownloadOfRecordClass:(Class)a3
{
  return 1;
}

- (BOOL)supportsDirectDeletionOfRecordClass:(Class)a3
{
  return -[objc_class supportsDirectDeletion](a3, "supportsDirectDeletion");
}

- (BOOL)supportsDeletionOfRecordClass:(Class)a3
{
  return -[objc_class supportsDeletion](a3, "supportsDeletion");
}

- (id)recordIDWithRecordName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification cloudKitScope](self, "cloudKitScope"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 recordIDWithRecordName:v4]);

  return v6;
}

- (id)scopedIdentifierWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_engineScope, "scopeIdentifier"));
  id v7 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v5, "initWithScopeIdentifier:identifier:", v6, v4);

  return v7;
}

- (CKRecordZoneID)zoneID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification cloudKitScope](self, "cloudKitScope"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 zoneID]);

  return (CKRecordZoneID *)v3;
}

- (CKRecordZone)zone
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification cloudKitScope](self, "cloudKitScope"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 zone]);

  return (CKRecordZone *)v3;
}

- (NSString)scopeIdentifier
{
  return (NSString *)-[CPLEngineScope scopeIdentifier](self->_engineScope, "scopeIdentifier");
}

- (int64_t)scopeType
{
  return (int64_t)-[CPLEngineScope scopeType](self->_engineScope, "scopeType");
}

- (void)validateAcceptSharedScopeTask:(id)a3 completionHandler:(id)a4
{
}

- (void)validateCreateScopeTask:(id)a3 completionHandler:(id)a4
{
}

- (id)newScopeIdentifierRelativeToMainScopeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) prefixForNewScopesRelativeToMainScopeIdentifier:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    id v7 = CPLSharingScopeUUID();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    }
    __int128 v12 = v10;

    __int128 v13 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    __int128 v11 = -[NSString initWithFormat:](v13, "initWithFormat:", @"%@%@", v6, v14);
  }

  else
  {
    __int128 v11 = 0LL;
  }

  return v11;
}

+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3
{
  return 0LL;
}

+ (int64_t)_permissionFromCKShare:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentUserParticipant]);
  id v5 = v4;
  if (v4) {
    id v6 = [v4 permission];
  }
  else {
    id v6 = [v3 publicPermission];
  }
  int64_t v7 = (int64_t)v6;

  return v7;
}

- (BOOL)_isScopeReadonlyFromCKShare:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(id)objc_opt_class(self) isScopeReadonlyFromCKShare:v4];

  if (!v5) {
    return 0;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification cloudKitScope](self, "cloudKitScope"));
  unsigned __int8 v7 = [v6 isShared];

  return v7;
}

+ (BOOL)isScopeReadonlyFromCKShare:(id)a3
{
  return [a1 _permissionFromCKShare:a3] == (id)2;
}

- (CPLCloudKitScope)cloudKitScope
{
  return self->_cloudKitScope;
}

- (CPLEngineScope)engineScope
{
  return self->_engineScope;
}

- (void).cxx_destruct
{
}

@end