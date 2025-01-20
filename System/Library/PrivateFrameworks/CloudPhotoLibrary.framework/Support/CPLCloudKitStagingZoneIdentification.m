@interface CPLCloudKitStagingZoneIdentification
+ (BOOL)isSupportedShareType:(id)a3;
+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4;
+ (id)libraryInfoRecordName;
+ (id)recordsToFetchToIdentifyZoneID:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5;
+ (id)shareRecordName;
+ (id)shareTypes;
+ (int64_t)proposedScopeTypeForCloudKitScope:(id)a3;
+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6;
- (BOOL)isSupportedShareType:(id)a3;
- (BOOL)supportsZoneCreation;
- (BOOL)supportsZoneDelete;
- (id)scopeChangeFromCKRecords:(id)a3 currentUserID:(id)a4 previousScopeChange:(id)a5;
- (id)shareRecordIDToDelete;
@end

@implementation CPLCloudKitStagingZoneIdentification

+ (id)recordsToFetchToIdentifyZoneID:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5
{
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___CPLCloudKitStagingZoneIdentification;
  id v7 = a3;
  id v8 = objc_msgSendSuper2(&v13, "recordsToFetchToIdentifyZoneID:proposedScopeType:currentUserID:", v7, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = objc_msgSend(v9, "mutableCopy", v13.receiver, v13.super_class);

  v11 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  @"ExitConfig",  v7);
  [v10 addObject:v11];

  return v10;
}

+ (int64_t)proposedScopeTypeForCloudKitScope:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneID]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);

  else {
    int64_t v6 = 0LL;
  }

  return v6;
}

+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6
{
  if (a4)
  {
    if (a4 == 6) {
      return 6LL;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    id v8 = a6;
    v9 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneID]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
    id v11 = CPLStagedZoneNameFromStagingZoneName(v10, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    if (v12) {
      int64_t v6 = 6LL;
    }
    else {
      int64_t v6 = 0LL;
    }
  }

  return v6;
}

+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4
{
  return objc_msgSend(a4, "scopeType", a3) == (id)6;
}

- (id)scopeChangeFromCKRecords:(id)a3 currentUserID:(id)a4 previousScopeChange:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___CPLCloudKitStagingZoneIdentification;
  id v11 = -[CPLCloudKitZoneIdentification scopeChangeFromCKRecords:currentUserID:previousScopeChange:]( &v38,  "scopeChangeFromCKRecords:currentUserID:previousScopeChange:",  v8,  v9,  v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self, "zoneID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
  id v15 = CPLStagedZoneNameFromStagingZoneName(v14, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (v16)
  {
    v17 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self, "zoneID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 ownerName]);
    v20 = -[CKRecordZoneID initWithZoneName:ownerName:](v17, "initWithZoneName:ownerName:", v16, v19);

    v21 = objc_alloc(&OBJC_CLASS___CPLCloudKitScope);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification cloudKitScope](self, "cloudKitScope"));
    v37 = v20;
    v23 = -[CPLCloudKitScope initWithZoneID:options:](v21, "initWithZoneID:options:", v20, [v22 options]);

    v24 = objc_alloc(&OBJC_CLASS___CPLEngineScope);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID cpl_zoneName](v20, "cpl_zoneName"));
    v36 = -[CPLEngineScope initWithScopeIdentifier:scopeType:](v24, "initWithScopeIdentifier:scopeType:", v25, 5LL);

    v26 = -[CPLCloudKitZoneIdentification initWithCloudKitScope:engineScope:]( objc_alloc(&OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification),  "initWithCloudKitScope:engineScope:",  v23,  v36);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification cloudKitScope](self, "cloudKitScope"));
    -[CPLCloudKitLibraryShareZoneIdentification setStagingCloudKitScope:](v26, "setStagingCloudKitScope:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitLibraryShareZoneIdentification scopeChangeFromCKRecords:currentUserID:previousScopeChange:]( v26,  "scopeChangeFromCKRecords:currentUserID:previousScopeChange:",  v8,  v9,  v10));
    id v29 = v10;
    v30 = v12;
    v31 = (void *)objc_claimAutoreleasedReturnValue([v9 recordName]);
    v39 = v31;
    id v32 = v8;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
    [v28 setExitingUserIdentifiers:v33];

    v12 = v30;
    id v10 = v29;
    [v12 setStagedScopeChange:v28];
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope transportScope](v23, "transportScope"));
    [v12 setStagedTransportScope:v34];

    id v8 = v32;
  }

  return v12;
}

+ (id)shareRecordName
{
  return +[CPLCloudKitLibraryShareZoneIdentification shareRecordName]( &OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification,  "shareRecordName");
}

+ (id)shareTypes
{
  return +[CPLCloudKitLibraryShareZoneIdentification shareTypes]( &OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification,  "shareTypes");
}

+ (BOOL)isSupportedShareType:(id)a3
{
  return +[CPLCloudKitLibraryShareZoneIdentification isSupportedShareType:]( &OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification,  "isSupportedShareType:",  a3);
}

- (BOOL)isSupportedShareType:(id)a3
{
  return +[CPLCloudKitLibraryShareZoneIdentification isSupportedShareType:]( &OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification,  "isSupportedShareType:",  a3);
}

+ (id)libraryInfoRecordName
{
  return +[CPLCloudKitLibraryZoneIdentification libraryInfoRecordName]( &OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification,  "libraryInfoRecordName");
}

- (BOOL)supportsZoneDelete
{
  return 0;
}

- (BOOL)supportsZoneCreation
{
  return 0;
}

- (id)shareRecordIDToDelete
{
  return -[CPLCloudKitZoneIdentification recordIDWithRecordName:]( self,  "recordIDWithRecordName:",  CKRecordNameZoneWideShare);
}

- (void).cxx_destruct
{
}

@end