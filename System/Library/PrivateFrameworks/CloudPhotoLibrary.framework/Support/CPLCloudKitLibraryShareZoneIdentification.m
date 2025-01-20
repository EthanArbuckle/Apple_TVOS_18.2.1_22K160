@interface CPLCloudKitLibraryShareZoneIdentification
+ (BOOL)isSupportedShareType:(id)a3;
+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3;
+ (id)recordsToFetchToIdentifyZoneID:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5;
+ (id)shareRecordName;
+ (id)shareTypes;
+ (id)supportedZonePrefixes;
+ (int64_t)_scopeTypeForCloudKitScope:(id)a3;
- (BOOL)isSupportedShareType:(id)a3;
- (BOOL)supportsDownloadOfChange:(id)a3 scopeProvider:(id)a4;
- (BOOL)supportsDownloadOfRecordClass:(Class)a3;
- (BOOL)supportsUploadOfChange:(id)a3 scopeProvider:(id)a4;
- (BOOL)supportsZoneCreation;
- (BOOL)supportsZoneDelete;
- (CPLCloudKitScope)stagingCloudKitScope;
- (id)cloudKitScope;
- (id)proposedStagingZoneIdentificationWithCurrentUserID:(id)a3;
- (id)recordsToUpdateFromScopeChange:(id)a3 currentUserID:(id)a4;
- (id)scopeChangeFromCKRecords:(id)a3 currentUserID:(id)a4 previousScopeChange:(id)a5;
- (id)scopeFlagsUpdateFromCKRecords:(id)a3;
- (id)shareRecordIDToDelete;
- (id)updatedFlagsFromCKRecord:(id)a3;
- (id)updatedFlagsFromDeletedCKRecordID:(id)a3 recordType:(id)a4;
- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withCKRecord:(id)a5;
- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withDeletedCKRecordID:(id)a5 recordType:(id)a6;
- (void)setStagingCloudKitScope:(id)a3;
- (void)validateAcceptSharedScopeTask:(id)a3 completionHandler:(id)a4;
- (void)validateCreateScopeTask:(id)a3 completionHandler:(id)a4;
@end

@implementation CPLCloudKitLibraryShareZoneIdentification

+ (id)supportedZonePrefixes
{
  v3[0] = CPLPrimarySharingScopeIdentifierPrefix;
  v3[1] = CPLPrimarySharingScopeIdentifierPrefixForParallelUniverse;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  2LL));
}

+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3
{
  return (id)CPLSharingScopePrefixForScopeWithIdentifier(a3, a2);
}

+ (int64_t)_scopeTypeForCloudKitScope:(id)a3
{
  else {
    return 4LL;
  }
}

+ (id)shareRecordName
{
  return CKRecordNameZoneWideShare;
}

+ (id)shareTypes
{
  uint64_t v3 = CKPhotosSharedLibraryShareType;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

+ (BOOL)isSupportedShareType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"shared_library"])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLCloudKitLibraryShareZoneIdentification;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, "isSupportedShareType:", v4);
  }

  return v5;
}

- (BOOL)isSupportedShareType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"shared_library"])
  {
    BOOL v5 = 1;
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification;
    BOOL v5 = -[CPLCloudKitZoneIdentification isSupportedShareType:](&v7, "isSupportedShareType:", v4);
  }

  return v5;
}

- (BOOL)supportsZoneDelete
{
  return (id)-[CPLCloudKitZoneIdentification scopeType](self, "scopeType") == (id)4;
}

- (BOOL)supportsZoneCreation
{
  return (id)-[CPLCloudKitZoneIdentification scopeType](self, "scopeType") == (id)4;
}

- (BOOL)supportsUploadOfChange:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 supportsSharing])
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification;
    BOOL v8 = -[CPLCloudKitZoneIdentification supportsUploadOfChange:scopeProvider:]( &v10,  "supportsUploadOfChange:scopeProvider:",  v6,  v7);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)supportsDownloadOfRecordClass:(Class)a3
{
  unsigned int v5 = -[objc_class supportsSharing](a3, "supportsSharing");
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification;
    LOBYTE(v5) = -[CPLCloudKitZoneIdentification supportsDownloadOfRecordClass:]( &v7,  "supportsDownloadOfRecordClass:",  a3);
  }

  return v5;
}

- (BOOL)supportsDownloadOfChange:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 supportsSharing])
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification;
    BOOL v8 = -[CPLCloudKitZoneIdentification supportsDownloadOfChange:scopeProvider:]( &v10,  "supportsDownloadOfChange:scopeProvider:",  v6,  v7);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)cloudKitScope
{
  stagingCloudKitScope = self->_stagingCloudKitScope;
  if (stagingCloudKitScope) {
    return stagingCloudKitScope;
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification;
  id v4 = -[CPLCloudKitZoneIdentification cloudKitScope](&v5, "cloudKitScope");
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)shareRecordIDToDelete
{
  if ((id)-[CPLCloudKitZoneIdentification scopeType](self, "scopeType") == (id)5) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification recordIDWithRecordName:]( self,  "recordIDWithRecordName:",  CKRecordNameZoneWideShare));
  }
  else {
    uint64_t v3 = 0LL;
  }
  return v3;
}

+ (id)recordsToFetchToIdentifyZoneID:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___CPLCloudKitLibraryShareZoneIdentification;
  id v10 = objc_msgSendSuper2(&v18, "recordsToFetchToIdentifyZoneID:proposedScopeType:currentUserID:", v8, a4, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = [v11 mutableCopy];

  v13 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  @"ParticipantExitStates",  v8);
  [v12 addObject:v13];

  v14 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  @"ExitConfig",  v8);
  [v12 addObject:v14];

  if (+[CPLLibraryShareScopeChange serverSupportsLibraryShareSettingsRecordSyncing]( &OBJC_CLASS___CPLLibraryShareScopeChange,  "serverSupportsLibraryShareSettingsRecordSyncing"))
  {
    v15 = CPLLibraryShareSettingsRecordID(v8, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (v16) {
      [v12 addObject:v16];
    }
  }

  return v12;
}

- (id)scopeChangeFromCKRecords:(id)a3 currentUserID:(id)a4 previousScopeChange:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification;
  id v12 = -[CPLCloudKitLibraryZoneIdentification scopeChangeFromCKRecords:currentUserID:previousScopeChange:]( &v31,  "scopeChangeFromCKRecords:currentUserID:previousScopeChange:",  v9,  v10,  v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___CPLLibraryShareScopeChange);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0) {
    sub_100196F08(self, (uint64_t)v13, (uint64_t)a2);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self, "zoneID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 cplRecordWithName:@"ParticipantExitStates" zonedID:v15]);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 recordType]);
    unsigned int v18 = [v17 isEqualToString:@"ParticipantExitStates"];

    if (v18) {
      [v13 updateWithExitStatesRecord:v16];
    }
  }

  if (self->_stagingCloudKitScope || (id)-[CPLCloudKitZoneIdentification scopeType](self, "scopeType") == (id)4)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self, "zoneID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v9 cplRecordWithName:@"ExitConfig" zonedID:v19]);

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 recordType]);
      unsigned int v22 = [v21 isEqualToString:@"SharedSyncExitConfig"];

      if (v22) {
        [v13 updateWithExitConfigRecord:v20];
      }
    }
  }

  else
  {
    [v13 updateExitConfigFromPreviousScopeChange:v11];
  }

  if (+[CPLLibraryShareScopeChange serverSupportsLibraryShareSettingsRecordSyncing]( &OBJC_CLASS___CPLLibraryShareScopeChange,  "serverSupportsLibraryShareSettingsRecordSyncing"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self, "zoneID"));
    v24 = CPLLibraryShareSettingsRecordID(v23, v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v25]);
      v27 = v26;
      if (v26)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue([v26 recordType]);
        unsigned int v29 = [v28 isEqualToString:@"CPLScopeUserSettings"];

        if (v29) {
          [v13 updateLibraryShareSettingsWithCKRecord:v27];
        }
      }
    }
  }

  return v13;
}

- (id)scopeFlagsUpdateFromCKRecords:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification;
  id v3 = -[CPLCloudKitZoneIdentification scopeFlagsUpdateFromCKRecords:](&v5, "scopeFlagsUpdateFromCKRecords:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withCKRecord:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification;
  id v12 = -[CPLCloudKitLibraryZoneIdentification updatedScopeChangeFromScopeChange:currentUserID:withCKRecord:]( &v31,  "updatedScopeChangeFromScopeChange:currentUserID:withCKRecord:",  v9,  v10,  v11);
  id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
  if (v13)
  {
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___CPLLibraryShareScopeChange);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0) {
      sub_10019701C(self, (uint64_t)v13, (uint64_t)a2);
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v11 recordType]);
  if ([v15 isEqualToString:@"ParticipantExitStates"])
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v11 recordID]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 recordName]);
    unsigned int v18 = [v17 isEqualToString:@"ParticipantExitStates"];

    if (v18)
    {
      if (!v13) {
        id v13 = [v9 copy];
      }
      [v13 updateWithExitStatesRecord:v11];
      goto LABEL_17;
    }
  }

  else
  {
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v11 recordType]);
  if ([v19 isEqualToString:@"SharedSyncExitConfig"])
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v11 recordID]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 recordName]);
    unsigned int v22 = [v21 isEqualToString:@"ExitConfig"];

    if (v22
      && (self->_stagingCloudKitScope || (id)-[CPLCloudKitZoneIdentification scopeType](self, "scopeType") == (id)4))
    {
      if (!v13) {
        id v13 = [v9 copy];
      }
      [v13 updateWithExitConfigRecord:v11];
    }
  }

  else
  {
  }

- (id)updatedFlagsFromCKRecord:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification;
  id v3 = -[CPLCloudKitZoneIdentification updatedFlagsFromCKRecord:](&v5, "updatedFlagsFromCKRecord:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withDeletedCKRecordID:(id)a5 recordType:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification;
  id v15 = -[CPLCloudKitZoneIdentification updatedScopeChangeFromScopeChange:currentUserID:withDeletedCKRecordID:recordType:]( &v26,  "updatedScopeChangeFromScopeChange:currentUserID:withDeletedCKRecordID:recordType:",  v11,  v12,  v13,  v14);
  id v16 = (id)objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___CPLLibraryShareScopeChange);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0) {
      sub_100197130(self, (uint64_t)v16, (uint64_t)a2);
    }
  }

  if ([v14 isEqualToString:@"ParticipantExitStates"]
    && (unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v13 recordName]),
        unsigned int v19 = [v18 isEqualToString:@"ParticipantExitStates"],
        v18,
        v19))
  {
    if (!v16) {
      id v16 = [v11 copy];
    }
    [v16 updateWithExitStatesRecord:0];
  }

  else if ([v14 isEqualToString:@"SharedSyncExitConfig"])
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v13 recordName]);
    unsigned int v21 = [v20 isEqualToString:@"ExitConfig"];

    if (v21)
    {
      if (self->_stagingCloudKitScope || (id)-[CPLCloudKitZoneIdentification scopeType](self, "scopeType") == (id)4)
      {
        if (!v16) {
          id v16 = [v11 copy];
        }
        [v16 updateWithExitConfigRecord:0];
      }
    }
  }

  if (+[CPLLibraryShareScopeChange serverSupportsLibraryShareSettingsRecordSyncing]( &OBJC_CLASS___CPLLibraryShareScopeChange,  "serverSupportsLibraryShareSettingsRecordSyncing")
    && [v14 isEqualToString:@"CPLScopeUserSettings"])
  {
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self, "zoneID"));
    v23 = CPLLibraryShareSettingsRecordID(v22, v12);
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    if (v24 && [v13 isEqual:v24])
    {
      if (!v16) {
        id v16 = [v11 copy];
      }
      [v16 updateLibraryShareSettingsWithCKRecord:0];
    }
  }

  return v16;
}

- (id)updatedFlagsFromDeletedCKRecordID:(id)a3 recordType:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification;
  id v4 = -[CPLCloudKitZoneIdentification updatedFlagsFromDeletedCKRecordID:recordType:]( &v6,  "updatedFlagsFromDeletedCKRecordID:recordType:",  a3,  a4);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)recordsToUpdateFromScopeChange:(id)a3 currentUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification;
  id v8 = -[CPLCloudKitZoneIdentification recordsToUpdateFromScopeChange:currentUserID:]( &v15,  "recordsToUpdateFromScopeChange:currentUserID:",  v6,  v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v9 mutableCopy];

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___CPLLibraryShareScopeChange);
  if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self, "zoneID"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 ckRecordForLibraryShareSettingsWithZoneID:v12 userID:v7]);

    if (v13) {
      [v10 addObject:v13];
    }
  }

  return v10;
}

- (void)validateAcceptSharedScopeTask:(id)a3 completionHandler:(id)a4
{
}

- (void)validateCreateScopeTask:(id)a3 completionHandler:(id)a4
{
}

- (id)proposedStagingZoneIdentificationWithCurrentUserID:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification engineScope](self, "engineScope"));
  id v6 = [v5 scopeType];

  if (v6 == (id)5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitLibraryShareZoneIdentification cloudKitScope](self, "cloudKitScope"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitLibraryShareZoneIdentification cloudKitScope](self, "cloudKitScope"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
    id v12 = CPLStagingZoneNameFromZoneName(v11, v4);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (v13)
    {
      id v14 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v8 ownerName]);
      id v16 = -[CKRecordZoneID initWithZoneName:ownerName:databaseScope:]( v14,  "initWithZoneName:ownerName:databaseScope:",  v13,  v15,  [v8 databaseScope]);

      uint64_t v17 = -[CPLCloudKitScope initWithZoneID:options:]( [CPLCloudKitScope alloc],  "initWithZoneID:options:",  v16,  [v7 options]);
      unsigned int v18 = objc_alloc(&OBJC_CLASS___CPLEngineScope);
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID cpl_zoneName](v16, "cpl_zoneName"));
      v20 = -[CPLEngineScope initWithScopeIdentifier:scopeType:](v18, "initWithScopeIdentifier:scopeType:", v19, 6LL);

      unsigned int v21 = -[CPLCloudKitZoneIdentification initWithCloudKitScope:engineScope:]( objc_alloc(&OBJC_CLASS___CPLCloudKitStagingZoneIdentification),  "initWithCloudKitScope:engineScope:",  v17,  v20);
    }

    else
    {
      unsigned int v21 = 0LL;
    }
  }

  else
  {
    unsigned int v21 = 0LL;
  }

  return v21;
}

- (CPLCloudKitScope)stagingCloudKitScope
{
  return self->_stagingCloudKitScope;
}

- (void)setStagingCloudKitScope:(id)a3
{
}

- (void).cxx_destruct
{
}

@end