@interface CPLCloudKitDefaultZoneManager
+ (CPLCloudKitDefaultZoneManager)sharedInstance;
+ (id)_defaultIdentificationClasses;
- (BOOL)isNewCloudKitScope:(id)a3 compatibleWithOldCloudKitScope:(id)a4;
- (CPLCloudKitDefaultZoneManager)initWithIdentificationClasses:(id)a3;
- (CPLFingerprintContext)fingerprintContext;
- (NSArray)identificationClasses;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)init_;
- (id)recordsToFetchToIdentifyCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)tentativeZoneIdentifierForZoneID:(id)a3;
- (id)zoneIDFromScopeIdentifier:(id)a3;
- (id)zoneIdentificationForCloudKitScope:(id)a3 engineScope:(id)a4;
- (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6;
@end

@implementation CPLCloudKitDefaultZoneManager

+ (id)_defaultIdentificationClasses
{
  if (qword_100296500 != -1) {
    dispatch_once(&qword_100296500, &stru_100241DA0);
  }
  return (id)qword_1002964F8;
}

+ (CPLCloudKitDefaultZoneManager)sharedInstance
{
  if (qword_100296510 != -1) {
    dispatch_once(&qword_100296510, &stru_100241DC0);
  }
  return (CPLCloudKitDefaultZoneManager *)(id)qword_100296508;
}

- (CPLCloudKitDefaultZoneManager)initWithIdentificationClasses:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CPLCloudKitDefaultZoneManager;
  v5 = -[CPLCloudKitDefaultZoneManager init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    identificationClasses = v5->_identificationClasses;
    v5->_identificationClasses = v6;
  }

  return v5;
}

- (id)init_
{
  id v3 = [(id)objc_opt_class(self) _defaultIdentificationClasses];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[CPLCloudKitDefaultZoneManager initWithIdentificationClasses:](self, "initWithIdentificationClasses:", v4);

  return v5;
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  return 0LL;
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 ownerName]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);

  v6 = (void *)CPLPrimaryScopeIdentifier;
  if ([v5 hasPrefix:CPLPrimaryScopeIdentifier])
  {
    id v7 = v6;

    v5 = v7;
  }

  if (v4 && ![v4 isEqualToString:CKCurrentUserDefaultName]) {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[CPLScopedIdentifier descriptionWithScopeIdentifier:identifier:]( &OBJC_CLASS___CPLScopedIdentifier,  "descriptionWithScopeIdentifier:identifier:",  v4,  v5));
  }
  else {
    id v8 = v5;
  }
  objc_super v9 = v8;

  return v9;
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneID]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitDefaultZoneManager scopeIdentifierFromZoneID:](self, "scopeIdentifierFromZoneID:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cpl_scopedIdentifierWithScopeIdentifier:", v6));

  return v7;
}

- (CPLFingerprintContext)fingerprintContext
{
  return (CPLFingerprintContext *)+[CPLFingerprintContext sharedContext]( &OBJC_CLASS___CPLFingerprintContext,  "sharedContext");
}

- (id)zoneIDFromScopeIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CPLPrimaryScopeIdentifier;
  if ([v3 isEqualToString:CPLPrimaryScopeIdentifier])
  {
    v5 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  v4,  CKCurrentUserDefaultName);
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[CPLScopedIdentifier scopedIdentifierWithString:includeScopeIndex:defaultScopeIdentifier:]( &OBJC_CLASS___CPLScopedIdentifier,  "scopedIdentifierWithString:includeScopeIndex:defaultScopeIdentifier:",  v3,  0LL,  CKCurrentUserDefaultName));
    id v7 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
    v5 = -[CKRecordZoneID initWithZoneName:ownerName:](v7, "initWithZoneName:ownerName:", v8, v9);
  }

  return v5;
}

- (id)recordsToFetchToIdentifyCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  v11 = self->_identificationClasses;
  id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID", (void)v21));
        v18 = (void *)objc_claimAutoreleasedReturnValue( [v16 recordsToFetchToIdentifyZoneID:v17 proposedScopeType:a4 currentUserID:v9]);
        -[NSMutableSet addObjectsFromArray:](v10, "addObjectsFromArray:", v18);

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    }

    while (v13);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v10, "allObjects"));
  return v19;
}

- (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v13 = self->_identificationClasses;
  id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    while (2)
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = objc_msgSend( *(id *)(*((void *)&v21 + 1) + 8 * (void)v17),  "scopeTypeForCloudKitScope:proposedScopeType:fetchedRecords:currentUserID:",  v10,  a4,  v11,  v12,  (void)v21);
        if (v18)
        {
          int64_t v19 = (int64_t)v18;
          goto LABEL_11;
        }

        v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
      if (v15) {
        continue;
      }
      break;
    }
  }

  int64_t v19 = 0LL;
LABEL_11:

  return v19;
}

- (id)zoneIdentificationForCloudKitScope:(id)a3 engineScope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = self->_identificationClasses;
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_alloc(*(Class *)(*((void *)&v17 + 1) + 8LL * (void)v12));
        id v14 = (CPLCloudKitUnknownIdentification *)objc_msgSend( v13,  "initWithCloudKitScope:engineScope:",  v6,  v7,  (void)v17);
        if (v14)
        {
          id v15 = v14;

          goto LABEL_11;
        }

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v15 = -[CPLCloudKitZoneIdentification initWithCloudKitScope:engineScope:]( objc_alloc(&OBJC_CLASS___CPLCloudKitUnknownIdentification),  "initWithCloudKitScope:engineScope:",  v6,  v7);
LABEL_11:

  return v15;
}

- (BOOL)isNewCloudKitScope:(id)a3 compatibleWithOldCloudKitScope:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneID]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 zoneName]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 ownerName]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);

  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 zoneName]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 ownerName]);
  id v12 = (void *)v11;
  if (v11 && v8)
  {
LABEL_6:
    if (v10 && v7)
    {
    }

    else if (v10 | v7)
    {
      goto LABEL_9;
    }

    unsigned __int8 v17 = 1;
    goto LABEL_16;
  }

  if (!(v11 | v8)) {
    goto LABEL_6;
  }
LABEL_9:
  if ([v12 isEqualToString:CKCurrentUserDefaultName]
    && (uint64_t v13 = CPLPrimaryScopeIdentifier, [(id)v10 hasPrefix:CPLPrimaryScopeIdentifier])
    && [(id)v7 hasPrefix:v13])
  {
    v19[0] = v9;
    v19[1] = v6;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitLibraryZoneIdentification primaryZoneIDFromProposedZoneIDs:]( &OBJC_CLASS___CPLCloudKitLibraryZoneIdentification,  "primaryZoneIDFromProposedZoneIDs:",  v14));

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneName]);
    unsigned __int8 v17 = [v16 isEqual:v7];
  }

  else
  {
    unsigned __int8 v17 = 0;
  }

- (id)tentativeZoneIdentifierForZoneID:(id)a3
{
  id v5 = a3;
  id v6 = -[CPLCloudKitScope initWithZoneID:](objc_alloc(&OBJC_CLASS___CPLCloudKitScope), "initWithZoneID:", v5);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v7 = self->_identificationClasses;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v27;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v27 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(objc_class **)(*((void *)&v26 + 1) + 8 * v11);
      id v13 = -[objc_class proposedScopeTypeForCloudKitScope:](v12, "proposedScopeTypeForCloudKitScope:", v6);
      if (v13) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v14 = v13;

    if (v12) {
      goto LABEL_12;
    }
  }

  else
  {
LABEL_9:

    id v14 = 0LL;
  }

  id v12 = (objc_class *)objc_opt_class(&OBJC_CLASS___CPLCloudKitUnknownIdentification);
LABEL_12:
  id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cpl_zoneName"));
  uint64_t v16 = -[CPLEngineScope initWithScopeIdentifier:scopeType:]( objc_alloc(&OBJC_CLASS___CPLEngineScope),  "initWithScopeIdentifier:scopeType:",  v15,  v14);
  id v17 = [[v12 alloc] initWithCloudKitScope:v6 engineScope:v16];
  if (v17)
  {
    __int128 v18 = v17;
  }

  else
  {
    __int128 v19 = -[CPLEngineScope initWithScopeIdentifier:scopeType:]( objc_alloc(&OBJC_CLASS___CPLEngineScope),  "initWithScopeIdentifier:scopeType:",  v15,  0LL);

    id v20 = [[v12 alloc] initWithCloudKitScope:v6 engineScope:v19];
    if (!v20)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v22 = __CPLGenericOSLogDomain(0LL);
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v31 = v6;
          __int16 v32 = 2112;
          v33 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Unable to create fallback identification from %@/%@",  buf,  0x16u);
        }
      }

      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudK it/CPLCloudKitZoneIdentification.m"));
      [v24 handleFailureInMethod:a2, self, v25, 1454, @"Unable to create fallback identification from %@/%@", v6, v19, (void)v26 object file lineNumber description];

      abort();
    }

    __int128 v18 = v20;
    uint64_t v16 = v19;
  }

  return v18;
}

- (NSArray)identificationClasses
{
  return self->_identificationClasses;
}

- (void).cxx_destruct
{
}

@end