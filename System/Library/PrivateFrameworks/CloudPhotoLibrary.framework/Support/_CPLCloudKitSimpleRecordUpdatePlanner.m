@interface _CPLCloudKitSimpleRecordUpdatePlanner
- (CPLCKRecordPropertyMapping)propertyMapping;
- (CPLCloudKitTransportTask)task;
- (CPLCloudKitZoneIdentification)destinationZoneIdentification;
- (CPLCloudKitZoneIdentification)sharedZoneIdentification;
- (CPLFingerprintContext)fingerprintContext;
- (CPLRecordTargetMapping)targetMapping;
- (NSArray)privateRecordIDs;
- (NSArray)scopedIdentifiers;
- (NSArray)sharedRecordIDs;
- (NSDictionary)sharedRecordIDsToMissingPrivateRecordIDs;
- (_CPLCloudKitSimpleRecordUpdatePlanner)initWithTask:(id)a3 scopedIdentifiers:(id)a4 destinationZoneIdentification:(id)a5 sharedZoneIdentification:(id)a6 targetMapping:(id)a7 propertyMapping:(id)a8 fingerprintContext:(id)a9;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)zoneIDFromScopeIdentifier:(id)a3;
@end

@implementation _CPLCloudKitSimpleRecordUpdatePlanner

- (_CPLCloudKitSimpleRecordUpdatePlanner)initWithTask:(id)a3 scopedIdentifiers:(id)a4 destinationZoneIdentification:(id)a5 sharedZoneIdentification:(id)a6 targetMapping:(id)a7 propertyMapping:(id)a8 fingerprintContext:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v63 = a6;
  id v62 = a7;
  id v61 = a8;
  id v60 = a9;
  v75.receiver = self;
  v75.super_class = (Class)&OBJC_CLASS____CPLCloudKitSimpleRecordUpdatePlanner;
  v19 = -[_CPLCloudKitSimpleRecordUpdatePlanner init](&v75, "init");
  v20 = v19;
  if (v19)
  {
    id v56 = v18;
    id v57 = v16;
    objc_storeStrong((id *)&v19->_task, a3);
    v21 = (NSArray *)[v17 copy];
    scopedIdentifiers = v20->_scopedIdentifiers;
    v20->_scopedIdentifiers = v21;

    p_destinationZoneIdentification = (void **)&v20->_destinationZoneIdentification;
    objc_storeStrong((id *)&v20->_destinationZoneIdentification, a5);
    p_sharedZoneIdentification = (void **)&v20->_sharedZoneIdentification;
    objc_storeStrong((id *)&v20->_sharedZoneIdentification, a6);
    p_targetMapping = (id *)&v20->_targetMapping;
    objc_storeStrong((id *)&v20->_targetMapping, a7);
    objc_storeStrong((id *)&v20->_propertyMapping, a8);
    objc_storeStrong((id *)&v20->_fingerprintContext, a9);
    v23 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v17 count]);
    v67 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v17 count]);
    uint64_t v59 = (uint64_t)v20;
    if (v20->_sharedZoneIdentification)
    {
      v24 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  2 * (void)[v17 count]);
      v66 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v17 count]);
      v64 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v17 count]);
    }

    else
    {
      v66 = 0LL;
      v64 = 0LL;
      v24 = 0LL;
    }

    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    id v55 = v17;
    id obj = v17;
    id v25 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v72;
      do
      {
        for (i = 0LL; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v72 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void *)(*((void *)&v71 + 1) + 8LL * (void)i);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_targetMapping, "targetForRecordWithScopedIdentifier:", v29, v55));
          if (!v30) {
            sub_1001969B4(v29, (uint64_t)a2, v59);
          }
          v31 = v30;
          v32 = *p_destinationZoneIdentification;
          v33 = (void *)objc_claimAutoreleasedReturnValue([v30 scopedIdentifier]);
          v34 = (void *)objc_claimAutoreleasedReturnValue([v33 identifier]);
          v35 = (void *)objc_claimAutoreleasedReturnValue([v32 recordIDWithRecordName:v34]);

          -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v29, v35);
          v36 = *p_sharedZoneIdentification;
          if (!*p_sharedZoneIdentification)
          {
            -[NSMutableArray addObject:](v67, "addObject:", v35);
            goto LABEL_19;
          }

          v37 = (void *)objc_claimAutoreleasedReturnValue([v31 otherScopedIdentifier]);
          v38 = (void *)objc_claimAutoreleasedReturnValue([v37 identifier]);
          v39 = (void *)objc_claimAutoreleasedReturnValue([v36 recordIDWithRecordName:v38]);

          v40 = (void *)objc_claimAutoreleasedReturnValue([v31 otherScopedIdentifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v40, v39);

          v41 = (void *)objc_claimAutoreleasedReturnValue([v31 scopedIdentifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v41, v35);

          v42 = (void *)objc_claimAutoreleasedReturnValue([v31 scopedIdentifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v42, v39);

          id v43 = [v31 targetState];
          if (v43 == (id)2)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v64, "setObject:forKeyedSubscript:", v35, v39);
            goto LABEL_18;
          }

          if (v43 == (id)3) {
LABEL_15:
          }
            -[NSMutableArray addObject:](v67, "addObject:", v35);
LABEL_18:
          -[NSMutableArray addObject:](v66, "addObject:", v39);

LABEL_19:
        }

        id v26 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
      }

      while (v26);
    }

    id v44 = -[NSMutableDictionary copy](v23, "copy");
    v20 = (_CPLCloudKitSimpleRecordUpdatePlanner *)v59;
    v45 = *(void **)(v59 + 8);
    *(void *)(v59 + 8) = v44;

    if (v24) {
      id v46 = -[NSMutableDictionary copy](v24, "copy");
    }
    else {
      id v46 = *(id *)(v59 + 8);
    }
    id v17 = v55;
    v47 = *(void **)(v59 + 16);
    *(void *)(v59 + 16) = v46;

    id v48 = -[NSMutableArray copy](v67, "copy");
    v49 = *(void **)(v59 + 80);
    *(void *)(v59 + 80) = v48;

    id v50 = -[NSMutableDictionary copy](v64, "copy");
    v51 = *(void **)(v59 + 88);
    *(void *)(v59 + 88) = v50;

    id v52 = -[NSMutableArray copy](v66, "copy");
    v53 = *(void **)(v59 + 96);
    *(void *)(v59 + 96) = v52;

    id v18 = v56;
    id v16 = v57;
  }

  return v20;
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification scopeIdentifier]( self->_destinationZoneIdentification,  "scopeIdentifier"));
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) != 0)
  {
    p_destinationZoneIdentification = &self->_destinationZoneIdentification;
  }

  else
  {
    sharedZoneIdentification = self->_sharedZoneIdentification;
    p_destinationZoneIdentification = &self->_sharedZoneIdentification;
    v8 = sharedZoneIdentification;
    if (!sharedZoneIdentification
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification scopeIdentifier](v8, "scopeIdentifier")),
          unsigned int v11 = [v4 isEqualToString:v10],
          v10,
          !v11))
    {
      v12 = 0LL;
      goto LABEL_7;
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification cloudKitScope](*p_destinationZoneIdentification, "cloudKitScope"));
LABEL_7:

  return v12;
}

- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:]( self->_ckRecordIDToRejectedScopedIdentifier,  "objectForKeyedSubscript:",  a3);
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self->_destinationZoneIdentification, "zoneID"));
  unsigned int v6 = [v5 isEqual:v4];

  if (v6)
  {
    destinationZoneIdentification = self->_destinationZoneIdentification;
  }

  else
  {
    sharedZoneIdentification = self->_sharedZoneIdentification;
    if (!sharedZoneIdentification
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](sharedZoneIdentification, "zoneID")),
          unsigned int v10 = [v9 isEqual:v4],
          v9,
          !v10))
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask scopeIdentifierFromZoneID:](self->_task, "scopeIdentifierFromZoneID:", v4));
      goto LABEL_8;
    }

    destinationZoneIdentification = self->_sharedZoneIdentification;
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification scopeIdentifier](destinationZoneIdentification, "scopeIdentifier"));
LABEL_8:
  v12 = (void *)v11;

  return v12;
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_ckRecordIDToScopedIdentifier, "objectForKeyedSubscript:", a3);
}

- (id)zoneIDFromScopeIdentifier:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[_CPLCloudKitSimpleRecordUpdatePlanner cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneID]);

  return v4;
}

- (CPLFingerprintContext)fingerprintContext
{
  return (CPLFingerprintContext *)objc_getProperty(self, a2, 24LL, 1);
}

- (CPLCloudKitTransportTask)task
{
  return self->_task;
}

- (NSArray)scopedIdentifiers
{
  return self->_scopedIdentifiers;
}

- (CPLCloudKitZoneIdentification)destinationZoneIdentification
{
  return self->_destinationZoneIdentification;
}

- (CPLCloudKitZoneIdentification)sharedZoneIdentification
{
  return self->_sharedZoneIdentification;
}

- (CPLRecordTargetMapping)targetMapping
{
  return self->_targetMapping;
}

- (CPLCKRecordPropertyMapping)propertyMapping
{
  return self->_propertyMapping;
}

- (NSArray)privateRecordIDs
{
  return self->_privateRecordIDs;
}

- (NSDictionary)sharedRecordIDsToMissingPrivateRecordIDs
{
  return self->_sharedRecordIDsToMissingPrivateRecordIDs;
}

- (NSArray)sharedRecordIDs
{
  return self->_sharedRecordIDs;
}

- (void).cxx_destruct
{
}

@end