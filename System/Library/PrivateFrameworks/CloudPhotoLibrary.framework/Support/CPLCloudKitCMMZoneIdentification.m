@interface CPLCloudKitCMMZoneIdentification
+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4;
+ (id)libraryInfoRecordName;
+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3;
+ (id)rootRecordName;
+ (id)shareRecordName;
+ (id)shareTypes;
+ (id)supportedZonePrefixes;
+ (int64_t)proposedScopeTypeForCloudKitScope:(id)a3;
+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6;
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
- (id)rootRecordType;
- (id)shareRecordIDToDelete;
- (id)shareTypeForScopeChange:(id)a3;
@end

@implementation CPLCloudKitCMMZoneIdentification

+ (id)supportedZonePrefixes
{
  uint64_t v3 = CPLScopeIdentifierPrefixForMomentShare;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3
{
  return CPLScopeIdentifierPrefixForMomentShare;
}

+ (int64_t)proposedScopeTypeForCloudKitScope:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneID]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "supportedZonePrefixes", 0));
  int64_t v8 = (int64_t)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if ([v6 hasPrefix:*(void *)(*((void *)&v12 + 1) + 8 * i)])
        {
          else {
            int64_t v8 = 2LL;
          }
          goto LABEL_13;
        }
      }

      int64_t v8 = (int64_t)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ((unint64_t)(a4 - 2) >= 2)
  {
    if (!a4)
    {
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
      if (![a1 isSupportedZoneID:v13])
      {
        a4 = 0LL;
LABEL_18:

        goto LABEL_19;
      }

      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v11 cplRecordWithName:@"cmm-share" zonedID:v13]);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 cplRecordWithName:@"cmm-root" zonedID:v13]);
      if (v14 && ([a1 isSupportedShare:v14] & 1) == 0)
      {

        __int128 v14 = 0LL;
      }

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 recordType]);
        unsigned __int8 v17 = [v16 isEqualToString:@"CMMRoot"];

        if ((v17 & 1) != 0)
        {
          if (v14)
          {
            else {
              a4 = 2LL;
            }
            goto LABEL_17;
          }
        }

        else
        {

          __int128 v15 = 0LL;
        }
      }

      a4 = 0LL;
LABEL_17:

      goto LABEL_18;
    }

    a4 = 0LL;
  }

+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4
{
  return ((unint64_t)objc_msgSend(a4, "scopeType", a3) & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)rootRecordName
{
  return @"cmm-root";
}

- (id)rootRecordType
{
  return @"CMMRoot";
}

+ (id)shareRecordName
{
  return @"cmm-share";
}

+ (id)shareTypes
{
  else {
    return &off_10025C618;
  }
}

+ (id)libraryInfoRecordName
{
  return @"library-info";
}

- (id)shareTypeForScopeChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CPLMomentShareScopeChange);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0) {
    sub_100196E1C((uint64_t)v5, (uint64_t)self, (uint64_t)a2);
  }
  if (+[CPLFingerprintScheme alwaysCreateEPPMomentShares]( CPLFingerprintScheme,  "alwaysCreateEPPMomentShares") & 1) != 0 || ([v5 hasEPPAssets])
  {
    v7 = @"photos_links";
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___CPLCloudKitCMMZoneIdentification;
    id v8 = -[CPLCloudKitZoneIdentification shareTypeForScopeChange:](&v10, "shareTypeForScopeChange:", v5);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v8);
  }

  return v7;
}

- (BOOL)supportsZoneDelete
{
  return (id)-[CPLCloudKitZoneIdentification scopeType](self, "scopeType") == (id)2;
}

- (BOOL)supportsZoneCreation
{
  return (id)-[CPLCloudKitZoneIdentification scopeType](self, "scopeType") == (id)2;
}

- (id)shareRecordIDToDelete
{
  if ((id)-[CPLCloudKitZoneIdentification scopeType](self, "scopeType") == (id)3) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification recordIDWithRecordName:]( self,  "recordIDWithRecordName:",  @"cmm-share"));
  }
  else {
    uint64_t v3 = 0LL;
  }
  return v3;
}

- (BOOL)supportsUploadOfChange:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100090938();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (objc_msgSend(v9, "containsObject:", objc_msgSend(v6, "recordClass")))
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___CPLCloudKitCMMZoneIdentification;
    BOOL v10 = -[CPLCloudKitZoneIdentification supportsUploadOfChange:scopeProvider:]( &v12,  "supportsUploadOfChange:scopeProvider:",  v6,  v7);
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)supportsDownloadOfChange:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100090938();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (objc_msgSend(v9, "containsObject:", objc_msgSend(v6, "recordClass")))
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___CPLCloudKitCMMZoneIdentification;
    BOOL v10 = -[CPLCloudKitZoneIdentification supportsDownloadOfChange:scopeProvider:]( &v12,  "supportsDownloadOfChange:scopeProvider:",  v6,  v7);
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)supportsDirectDeletionOfRecord:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100090938();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (objc_msgSend(v9, "containsObject:", objc_msgSend(v6, "recordClass")))
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___CPLCloudKitCMMZoneIdentification;
    BOOL v10 = -[CPLCloudKitZoneIdentification supportsDirectDeletionOfRecord:scopeProvider:]( &v12,  "supportsDirectDeletionOfRecord:scopeProvider:",  v6,  v7);
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)supportsDeletionOfRecord:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100090938();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (objc_msgSend(v9, "containsObject:", objc_msgSend(v6, "recordClass")))
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___CPLCloudKitCMMZoneIdentification;
    BOOL v10 = -[CPLCloudKitZoneIdentification supportsDeletionOfRecord:scopeProvider:]( &v12,  "supportsDeletionOfRecord:scopeProvider:",  v6,  v7);
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)supportsUploadOfRecordClass:(Class)a3
{
  id v5 = sub_100090938();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ([v6 containsObject:a3])
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___CPLCloudKitCMMZoneIdentification;
    BOOL v7 = -[CPLCloudKitZoneIdentification supportsUploadOfRecordClass:](&v9, "supportsUploadOfRecordClass:", a3);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)supportsDownloadOfRecordClass:(Class)a3
{
  id v5 = sub_100090938();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ([v6 containsObject:a3])
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___CPLCloudKitCMMZoneIdentification;
    BOOL v7 = -[CPLCloudKitZoneIdentification supportsDownloadOfRecordClass:](&v9, "supportsDownloadOfRecordClass:", a3);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)supportsDirectDeletionOfRecordClass:(Class)a3
{
  id v5 = sub_100090938();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ([v6 containsObject:a3])
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___CPLCloudKitCMMZoneIdentification;
    BOOL v7 = -[CPLCloudKitZoneIdentification supportsDirectDeletionOfRecordClass:]( &v9,  "supportsDirectDeletionOfRecordClass:",  a3);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)supportsDeletionOfRecordClass:(Class)a3
{
  id v5 = sub_100090938();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ([v6 containsObject:a3])
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___CPLCloudKitCMMZoneIdentification;
    BOOL v7 = -[CPLCloudKitZoneIdentification supportsDeletionOfRecordClass:](&v9, "supportsDeletionOfRecordClass:", a3);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end