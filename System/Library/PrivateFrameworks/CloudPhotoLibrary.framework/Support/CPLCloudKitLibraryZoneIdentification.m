@interface CPLCloudKitLibraryZoneIdentification
+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4;
+ (id)libraryInfoRecordName;
+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3;
+ (id)primaryZoneIDFromProposedZoneIDs:(id)a3;
+ (id)recordNamesForScopeInfo;
+ (int64_t)_scopeTypeForCloudKitScope:(id)a3;
+ (int64_t)proposedScopeTypeForCloudKitScope:(id)a3;
+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6;
- (BOOL)_simulateExitForScopeIdentifier:(id)a3;
- (BOOL)supportsZoneCreation;
- (BOOL)supportsZoneDelete;
- (id)_libraryStateFromCKRecord:(id)a3;
- (id)scopeChangeFromCKRecords:(id)a3 currentUserID:(id)a4 previousScopeChange:(id)a5;
- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withCKRecord:(id)a5;
@end

@implementation CPLCloudKitLibraryZoneIdentification

+ (id)primaryZoneIDFromProposedZoneIDs:(id)a3
{
  id v3 = a3;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    v6 = 0LL;
    uint64_t v7 = *(void *)v21;
    v8 = (void *)CPLPrimaryScopeIdentifier;
    uint64_t v19 = -1LL;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
        if ([v11 hasPrefix:v8])
        {
          if ([v11 isEqualToString:v8])
          {
            uint64_t v12 = 0LL;
          }

          else
          {
            uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
            v13 = v6;
            id v14 = v3;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v8, "length")));
            id v16 = [v15 integerValue];
            if (v16) {
              uint64_t v12 = (uint64_t)v16;
            }

            id v3 = v14;
            v6 = v13;
          }

          if (v12 != 0x7FFFFFFFFFFFFFFFLL && v12 > v19)
          {
            id v17 = v10;

            uint64_t v19 = v12;
            v6 = v17;
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v5);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3
{
  return 0LL;
}

+ (id)recordNamesForScopeInfo
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CPLCloudKitLibraryZoneIdentification;
  id v2 = objc_msgSendSuper2(&v6, "recordNamesForScopeInfo");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 arrayByAddingObject:@"PrimarySync-0000-ZS"]);

  return v4;
}

+ (int64_t)_scopeTypeForCloudKitScope:(id)a3
{
  return 1LL;
}

+ (int64_t)proposedScopeTypeForCloudKitScope:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneID]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "supportedZonePrefixes", 0));
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if ([v6 hasPrefix:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11)])
        {
          id v12 = [a1 _scopeTypeForCloudKitScope:v4];
          goto LABEL_11;
        }

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v12 = 0LL;
LABEL_11:

  return (int64_t)v12;
}

+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [a1 _scopeTypeForCloudKitScope:v9];
  if (v11 != (id)a4)
  {
    if (a4)
    {
      a4 = 0LL;
      goto LABEL_27;
    }

    int64_t v12 = (int64_t)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
    if (![a1 isSupportedZoneID:v13])
    {
      a4 = 0LL;
LABEL_26:

      goto LABEL_27;
    }

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([a1 shareRecordName]);
    if (!v14) {
      goto LABEL_9;
    }
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v10 cplRecordWithName:v14 zonedID:v13]);
    __int128 v16 = (void *)v15;
    if (v15)
    {
      id v17 = [a1 isSupportedShare:v15];
      if ((v17 & 1) != 0)
      {

LABEL_9:
        v18 = (void *)objc_claimAutoreleasedReturnValue([v10 cplRecordWithName:@"PrimarySync-0000-LI" zonedID:v13]);
        uint64_t v19 = v18;
        if (v18)
        {
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v18 recordType]);
          unsigned int v21 = [v20 isEqualToString:@"CPLLibraryInfo"];

          if (v21) {
            a4 = v12;
          }
          else {
            a4 = 0LL;
          }
        }

        else
        {
          a4 = v12;
        }

        goto LABEL_25;
      }

      if (!_CPLSilentLogging)
      {
        uint64_t v28 = __CPLGenericOSLogDomain(v17);
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          int v30 = 138543874;
          v31 = v14;
          __int16 v32 = 2114;
          id v33 = v9;
          __int16 v34 = 2112;
          v35 = v16;
          v24 = "Unexpected share record %{public}@ in %{public}@: %@ - zone is broken or unsupported";
          v25 = v23;
          os_log_type_t v26 = OS_LOG_TYPE_ERROR;
          uint32_t v27 = 32;
          goto LABEL_22;
        }

        goto LABEL_23;
      }
    }

    else if (!_CPLSilentLogging)
    {
      uint64_t v22 = __CPLGenericOSLogDomain(0LL);
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 138543618;
        v31 = v14;
        __int16 v32 = 2114;
        id v33 = v9;
        v24 = "Expected share record %{public}@ is not yet found in %{public}@ - zone is not yet ready to be used";
        v25 = v23;
        os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
        uint32_t v27 = 22;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v25, v26, v24, (uint8_t *)&v30, v27);
      }

+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4
{
  id v6 = a3;
  id v7 = [a4 scopeType];
  id v8 = [a1 _scopeTypeForCloudKitScope:v6];

  return v7 == v8;
}

+ (id)libraryInfoRecordName
{
  return @"PrimarySync-0000-LI";
}

- (id)_libraryStateFromCKRecord:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"enabled"]);
  id v5 = v4;
  if (v4 && ([v4 BOOLValue] & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"disabledTime"]);
    id v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    }
    id v7 = v11;

    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"deleteTime"]);
    v13 = v12;
    if (v12) {
      id v14 = v12;
    }
    else {
      id v14 = (id)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:2592000.0]);
    }
    id v8 = v14;

    uint64_t v6 = 1LL;
  }

  else
  {
    uint64_t v6 = 0LL;
    id v7 = 0LL;
    id v8 = 0LL;
  }

  id v15 = objc_alloc_init(&OBJC_CLASS___CPLLibraryState);
  [v15 setDisabled:v6];
  [v15 setDisabledDate:v7];
  [v15 setDeleteDate:v8];

  return v15;
}

- (BOOL)_simulateExitForScopeIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:CPLPrimaryScopeIdentifier])
  {
    unsigned __int8 v4 = 0;
  }

  else
  {
    uint64_t v5 = CPLUniverseNameFromMainScopeIdentifier(v3);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (v6)
    {
      id v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"CPLSimulateExitFor%@",  v6);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned __int8 v4 = [v8 BOOLForKey:v7];
    }

    else
    {
      unsigned __int8 v4 = 0;
    }
  }

  return v4;
}

- (id)scopeChangeFromCKRecords:(id)a3 currentUserID:(id)a4 previousScopeChange:(id)a5
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CPLCloudKitLibraryZoneIdentification;
  id v8 = a3;
  id v9 = -[CPLCloudKitZoneIdentification scopeChangeFromCKRecords:currentUserID:previousScopeChange:]( &v24,  "scopeChangeFromCKRecords:currentUserID:previousScopeChange:",  v8,  a4,  a5);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self, "zoneID", v24.receiver, v24.super_class));
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 cplRecordWithName:@"PrimarySync-0000-ZS" zonedID:v11]);

  if (!v12
    || (v13 = (void *)objc_claimAutoreleasedReturnValue([v12 recordType]),
        unsigned int v14 = [v13 isEqualToString:@"CPLZoneState"],
        v13,
        !v14))
  {
    id v16 = 0LL;
    goto LABEL_7;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitLibraryZoneIdentification _libraryStateFromCKRecord:]( self,  "_libraryStateFromCKRecord:",  v12));
  id v16 = v15;
  if (!v15)
  {
LABEL_7:
    int v17 = 1;
    goto LABEL_8;
  }

  int v17 = 0;
LABEL_8:
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification scopeIdentifier](self, "scopeIdentifier"));
  unsigned int v19 = -[CPLCloudKitLibraryZoneIdentification _simulateExitForScopeIdentifier:]( self,  "_simulateExitForScopeIdentifier:",  v18);

  if (v19)
  {
    if (v17) {
      id v16 = objc_alloc_init(&OBJC_CLASS___CPLLibraryState);
    }
    [v16 setDisabled:1];
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v16 setDisabledDate:v20];

    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v16 disabledDate]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 dateByAddingTimeInterval:2592000.0]);
    [v16 setDeleteDate:v22];
  }

- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withCKRecord:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CPLCloudKitLibraryZoneIdentification;
  id v10 = -[CPLCloudKitZoneIdentification updatedScopeChangeFromScopeChange:currentUserID:withCKRecord:]( &v24,  "updatedScopeChangeFromScopeChange:currentUserID:withCKRecord:",  v8,  a4,  v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 recordType]);
  if ([v12 isEqualToString:@"CPLZoneState"])
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 recordName]);
    unsigned int v15 = [v14 isEqualToString:@"PrimarySync-0000-ZS"];

    if (v15)
    {
      uint64_t v16 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitLibraryZoneIdentification _libraryStateFromCKRecord:](self, "_libraryStateFromCKRecord:", v9));
      if (v16)
      {
        int v17 = (void *)v16;
        if (!v11) {
          id v11 = [v8 copy];
        }
        if (([v17 isDisabled] & 1) == 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification scopeIdentifier](self, "scopeIdentifier"));
          unsigned int v19 = -[CPLCloudKitLibraryZoneIdentification _simulateExitForScopeIdentifier:]( self,  "_simulateExitForScopeIdentifier:",  v18);

          if (v19)
          {
            [v17 setDisabled:1];
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            [v17 setDisabledDate:v20];

            unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v17 disabledDate]);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 dateByAddingTimeInterval:2592000.0]);
            [v17 setDeleteDate:v22];
          }
        }

        [v11 setLibraryState:v17];
      }
    }
  }

  return v11;
}

- (BOOL)supportsZoneDelete
{
  return 1;
}

- (BOOL)supportsZoneCreation
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification cloudKitScope](self, "cloudKitScope"));
  char v3 = [v2 isShared] ^ 1;

  return v3;
}

@end