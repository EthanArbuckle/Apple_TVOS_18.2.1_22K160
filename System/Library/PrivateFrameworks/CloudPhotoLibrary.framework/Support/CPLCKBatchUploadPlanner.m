@interface CPLCKBatchUploadPlanner
- (BOOL)_shouldUpdateKeyOnCKRecord:(id)a3;
- (BOOL)_shouldUpdateKeyOnSharedCKRecord:(id)a3;
- (BOOL)didFetchPrivateCKRecord:(id)a3 forRecordWithRecordID:(id)a4 error:(id *)a5;
- (BOOL)didFetchSharedCKRecord:(id)a3 forRecordWithRecordID:(id)a4 error:(id *)a5;
- (BOOL)planRecordChangeUpload:(id)a3 error:(id *)a4;
- (CKRecordID)currentUserRecordID;
- (CPLCKBatchUploadPlanner)initWithScopeProvider:(id)a3 destinationZoneIdentification:(id)a4 sharedZoneIdentification:(id)a5 propertyMapping:(id)a6 currentUserRecordID:(id)a7 targetMapping:(id)a8 fetchCache:(id)a9 cplEnabledDate:(id)a10;
- (CPLCKRecordFetchCache)fetchCache;
- (CPLCKRecordPropertyMapping)propertyMapping;
- (CPLCKRecordRequestor)recordRequestor;
- (CPLCKSharePlan)sharePlan;
- (CPLCKUnsharePlan)unsharePlan;
- (CPLCloudKitScopeProvider)scopeProvider;
- (CPLCloudKitUploadMetric)metric;
- (CPLCloudKitZoneIdentification)destinationZoneIdentification;
- (CPLCloudKitZoneIdentification)sharedZoneIdentification;
- (CPLFingerprintContext)fingerprintContext;
- (CPLRecordTargetMapping)targetMapping;
- (NSArray)ckRecordIDsToDelete;
- (NSArray)ckRecordsToUpload;
- (NSArray)requestedPrivateCKRecordIDs;
- (NSArray)requestedSharedCKRecordIDs;
- (NSArray)sharedCKRecordIDsToDelete;
- (NSArray)sharedCKRecordsToUpload;
- (NSDate)cplEnabledDate;
- (double)planProgess;
- (double)totalDurationOfUpload;
- (double)uploadedSize;
- (id)_recordIDFromScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5;
- (id)_shareTodoForRecordWithScopedIdentifier:(id)a3 recordClass:(Class)a4 proposedContributorUserIdentifiers:(id)a5 target:(id)a6;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)progressHandler;
- (id)recordIDForResourcesOfRecordWithScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5;
- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)willUploadRecords;
- (id)willUploadSharedRecords;
- (id)zoneIDFromScopeIdentifier:(id)a3;
- (void)_addCKRecordIDForResourcesUploadProgressTracking:(id)a3 size:(double)a4;
- (void)_addRecordWithScopedIdentifierToShareTodos:(id)a3 recordClass:(Class)a4 proposedContributorUserIdentifiers:(id)a5 target:(id)a6 force:(BOOL)a7;
- (void)_addRecordWithScopedIdentifierToUnshareTodos:(id)a3 recordClass:(Class)a4 target:(id)a5;
- (void)_deleteRecord;
- (void)_deleteSharedRecord;
- (void)_dontUnshareRecordWithScopedIdentifier:(id)a3 recordClass:(Class)a4;
- (void)_noteMasterWillBeUploadedToPrivateZone:(id)a3;
- (void)_noteMasterWillBeUploadedToSharedZone:(id)a3;
- (void)_noteRecordWithScopedIdentifierWillMoveToSplitState:(id)a3;
- (void)_resetPlannerState;
- (void)_willUpdateCKRecordWithID:(id)a3 onBehalfOfRecordWithScopedIdentifier:(id)a4;
- (void)deleteCKRecordWithRecordID:(id)a3;
- (void)deleteSharedCKRecordWithRecordID:(id)a3;
- (void)didFinishUploadOfRecordsWithError:(id)a3;
- (void)didFinishUploadOfSharedRecordsWithError:(id)a3;
- (void)requestPrivateCKRecordWithRecordIDBeforeUpload:(id)a3 fetchedBlock:(id)a4 reason:(id)a5;
- (void)requestSharedCKRecordWithRecordIDBeforeUpload:(id)a3 fetchedBlock:(id)a4 reason:(id)a5;
- (void)setCKAsset:(id)a3 forKey:(id)a4;
- (void)setCKReferenceWithScopedIdentifier:(id)a3 forKey:(id)a4 referenceAction:(unint64_t)a5;
- (void)setCplEnabledDate:(id)a3;
- (void)setEncryptedObject:(id)a3 forKey:(id)a4 validateClass:(Class)a5;
- (void)setLegacyEncryptedObject:(id)a3 forKey:(id)a4;
- (void)setMetric:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setProgressHandler:(id)a3;
- (void)setRecordRequestor:(id)a3;
- (void)updatePrivateRecord:(id)a3 sharedToRecordWithID:(id)a4;
- (void)updateTargetMappingAfterUpload;
- (void)uploadCKRecord:(id)a3 forScopedIdentifier:(id)a4 triggeringKey:(id)a5;
- (void)uploadOfRecordID:(id)a3 didProgress:(double)a4;
- (void)uploadSharedCKRecord:(id)a3 forScopedIdentifier:(id)a4 triggeringKey:(id)a5;
@end

@implementation CPLCKBatchUploadPlanner

- (CPLCKBatchUploadPlanner)initWithScopeProvider:(id)a3 destinationZoneIdentification:(id)a4 sharedZoneIdentification:(id)a5 propertyMapping:(id)a6 currentUserRecordID:(id)a7 targetMapping:(id)a8 fetchCache:(id)a9 cplEnabledDate:(id)a10
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v17 = a9;
  id v18 = a10;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CPLCKBatchUploadPlanner;
  v19 = -[CPLCKBatchUploadPlanner init](&v30, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_scopeProvider, a3);
    objc_storeStrong((id *)&v20->_destinationZoneIdentification, a4);
    objc_storeStrong((id *)&v20->_sharedZoneIdentification, a5);
    objc_storeStrong((id *)&v20->_propertyMapping, a6);
    objc_storeStrong((id *)&v20->_currentUserRecordID, a7);
    objc_storeStrong((id *)&v20->_targetMapping, a8);
    if (v17) {
      v21 = (CPLCKRecordFetchCache *)v17;
    }
    else {
      v21 = objc_alloc_init(&OBJC_CLASS___CPLCKRecordFetchCache);
    }
    fetchCache = v20->_fetchCache;
    v20->_fetchCache = v21;

    objc_storeStrong((id *)&v20->_cplEnabledDate, a10);
  }

  return v20;
}

- (CPLFingerprintContext)fingerprintContext
{
  return (CPLFingerprintContext *)-[CPLCloudKitScopeProvider fingerprintContext]( self->_scopeProvider,  "fingerprintContext");
}

- (void)_noteRecordWithScopedIdentifierWillMoveToSplitState:(id)a3
{
  id v4 = a3;
  scopedIdentifiersMovingToSplitState = self->_scopedIdentifiersMovingToSplitState;
  id v8 = v4;
  if (!scopedIdentifiersMovingToSplitState)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v7 = self->_scopedIdentifiersMovingToSplitState;
    self->_scopedIdentifiersMovingToSplitState = v6;

    id v4 = v8;
    scopedIdentifiersMovingToSplitState = self->_scopedIdentifiersMovingToSplitState;
  }

  -[NSMutableSet addObject:](scopedIdentifiersMovingToSplitState, "addObject:", v4);
}

- (void)_willUpdateCKRecordWithID:(id)a3 onBehalfOfRecordWithScopedIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!_CPLSilentLogging)
  {
    id v8 = sub_100032740();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "If necessary, will update %@ on behalf of %@",  (uint8_t *)&v18,  0x16u);
    }
  }

  ckRecordIDToScopedIdentifier = self->_ckRecordIDToScopedIdentifier;
  if (!ckRecordIDToScopedIdentifier)
  {
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v12 = self->_ckRecordIDToScopedIdentifier;
    self->_ckRecordIDToScopedIdentifier = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    ckRecordIDToRejectedScopedIdentifier = self->_ckRecordIDToRejectedScopedIdentifier;
    self->_ckRecordIDToRejectedScopedIdentifier = v13;

    ckRecordIDToScopedIdentifier = self->_ckRecordIDToScopedIdentifier;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( ckRecordIDToScopedIdentifier,  "setObject:forKeyedSubscript:",  v7,  v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_ckRecordIDToRejectedScopedIdentifier,  "objectForKeyedSubscript:",  v6));

  if (!v15)
  {
    currentRecordChange = self->_currentRecordChange;
    if (currentRecordChange)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange scopedIdentifier](currentRecordChange, "scopedIdentifier"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_ckRecordIDToRejectedScopedIdentifier,  "setObject:forKeyedSubscript:",  v17,  v6);
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_ckRecordIDToRejectedScopedIdentifier,  "setObject:forKeyedSubscript:",  v7,  v6);
    }
  }
}

- (void)_resetPlannerState
{
  currentRecordChange = self->_currentRecordChange;
  self->_currentRecordChange = 0LL;

  currentRecordTarget = self->_currentRecordTarget;
  self->_currentRecordTarget = 0LL;

  recordModificationDate = self->_recordModificationDate;
  self->_recordModificationDate = 0LL;

  simpleBuilder = self->_simpleBuilder;
  self->_simpleBuilder = 0LL;

  ckRecordToUpload = self->_ckRecordToUpload;
  self->_ckRecordToUpload = 0LL;

  id v8 = self->_currentRecordTarget;
  self->_currentRecordTarget = 0LL;

  currentRecordID = self->_currentRecordID;
  self->_currentRecordID = 0LL;

  v10 = self->_recordModificationDate;
  self->_recordModificationDate = 0LL;

  sharedCKRecordToUpload = self->_sharedCKRecordToUpload;
  self->_sharedCKRecordToUpload = 0LL;

  sharedRecordID = self->_sharedRecordID;
  self->_sharedRecordID = 0LL;

  pendingCKRecordToUpload = self->_pendingCKRecordToUpload;
  self->_pendingCKRecordToUpload = 0LL;
}

- (BOOL)planRecordChangeUpload:(id)a3 error:(id *)a4
{
  id v8 = a3;
  -[CPLCKBatchUploadPlanner _resetPlannerState](self, "_resetPlannerState");
  p_currentRecordChange = (id *)&self->_currentRecordChange;
  objc_storeStrong((id *)&self->_currentRecordChange, a3);
  if (!_CPLSilentLogging)
  {
    id v10 = sub_100032740();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = *p_currentRecordChange;
      uint64_t v13 = objc_claimAutoreleasedReturnValue([*p_currentRecordChange attachedDiffTracker]);
      v14 = (void *)v13;
      v15 = @"no diff tracker";
      if (v13) {
        v15 = (const __CFString *)v13;
      }
      int v68 = 138412546;
      id v69 = v12;
      __int16 v70 = 2112;
      v71 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Planning %@ (%@)", (uint8_t *)&v68, 0x16u);
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 scopedIdentifier]);
  id v17 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v16));
  currentRecordTarget = self->_currentRecordTarget;
  self->_currentRecordTarget = v17;

  id v19 = self->_currentRecordTarget;
  if (!v19) {
    sub_100190238(v8, a2, self);
  }
  destinationZoneIdentification = self->_destinationZoneIdentification;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordTarget scopedIdentifier](v19, "scopedIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
  v23 = (CKRecordID *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification recordIDWithRecordName:]( destinationZoneIdentification,  "recordIDWithRecordName:",  v22));
  currentRecordID = self->_currentRecordID;
  self->_currentRecordID = v23;

  -[CPLCKBatchUploadPlanner _willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:]( self,  "_willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:",  self->_currentRecordID,  v16);
  if (self->_sharedZoneIdentification)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordTarget otherScopedIdentifier](self->_currentRecordTarget, "otherScopedIdentifier"));
    id v26 = v25;
    if (v25)
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 scopeIdentifier]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification scopeIdentifier]( self->_sharedZoneIdentification,  "scopeIdentifier"));
      unsigned int v29 = [v27 isEqualToString:v28];

      if (v29)
      {
        sharedZoneIdentification = self->_sharedZoneIdentification;
        v31 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
        v32 = (CKRecordID *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification recordIDWithRecordName:]( sharedZoneIdentification,  "recordIDWithRecordName:",  v31));
        sharedRecordID = self->_sharedRecordID;
        self->_sharedRecordID = v32;

        -[CPLCKBatchUploadPlanner _willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:]( self,  "_willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:",  self->_sharedRecordID,  v16);
      }
    }

    if ([v8 isMasterChange] && objc_msgSend(v8, "isFullRecord"))
    {
      if (!self->_mastersNotYetUploadedToPrivateZone)
      {
        v34 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        mastersNotYetUploadedToPrivateZone = self->_mastersNotYetUploadedToPrivateZone;
        self->_mastersNotYetUploadedToPrivateZone = v34;
      }

      if (!self->_mastersNotYetUploadedToSharedZone)
      {
        v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        mastersNotYetUploadedToSharedZone = self->_mastersNotYetUploadedToSharedZone;
        self->_mastersNotYetUploadedToSharedZone = v36;
      }

      v38 = self->_mastersNotYetUploadedToPrivateZone;
      v39 = (void *)objc_claimAutoreleasedReturnValue([v8 scopedIdentifier]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v8, v39);

      v40 = self->_mastersNotYetUploadedToSharedZone;
      v41 = (void *)objc_claimAutoreleasedReturnValue([v8 scopedIdentifier]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v8, v41);
    }
  }

  v42 = objc_alloc_init(&OBJC_CLASS___CPLCloudKitResourceCountAndSize);
  if (![v8 isDelete])
  {
    if ([v8 isMasterChange])
    {
      scopedIdentifiersNeedingToCallProgressHandler = self->_scopedIdentifiersNeedingToCallProgressHandler;
      if (!scopedIdentifiersNeedingToCallProgressHandler)
      {
        v45 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        v46 = self->_scopedIdentifiersNeedingToCallProgressHandler;
        self->_scopedIdentifiersNeedingToCallProgressHandler = v45;

        scopedIdentifiersNeedingToCallProgressHandler = self->_scopedIdentifiersNeedingToCallProgressHandler;
      }

      -[NSMutableSet addObject:](scopedIdentifiersNeedingToCallProgressHandler, "addObject:", v16);
    }

    if (![v8 prepareWithCKRecordBuilder:self resourceCountAndSize:v42 scopeProvider:self error:a4])
    {
      BOOL v52 = 0;
      goto LABEL_62;
    }

    if (self->_metric)
    {
      if (sub_100031EF8((uint64_t)v42) || sub_100031F28((uint64_t)v42))
      {
        -[CPLCloudKitUploadMetric setItemCount:]( self->_metric,  "setItemCount:",  (char *)-[CPLCloudKitUploadMetric itemCount](self->_metric, "itemCount") + 1);
        -[CPLCloudKitUploadMetric setUploadSize:]( self->_metric,  "setUploadSize:",  (char *)-[CPLCloudKitUploadMetric uploadSize](self->_metric, "uploadSize") + sub_100031EF8((uint64_t)v42));
        -[CPLCloudKitUploadMetric setReferencedResourcesSize:]( self->_metric,  "setReferencedResourcesSize:",  (char *)-[CPLCloudKitUploadMetric referencedResourcesSize](self->_metric, "referencedResourcesSize")
        + sub_100031F28((uint64_t)v42));
        -[CPLCloudKitUploadMetric setReferencedResourcesCount:]( self->_metric,  "setReferencedResourcesCount:",  (char *)-[CPLCloudKitUploadMetric referencedResourcesCount](self->_metric, "referencedResourcesCount")
        + sub_100031F10((uint64_t)v42));
      }

      else
      {
        -[CPLCloudKitUploadMetric setOtherItemCount:]( self->_metric,  "setOtherItemCount:",  (char *)-[CPLCloudKitUploadMetric otherItemCount](self->_metric, "otherItemCount") + 1);
      }
    }

    if (!self->_sharedZoneIdentification
      || ![v8 supportsSharingScopedIdentifier]
      || ![v8 hasChangeType:64])
    {
      goto LABEL_44;
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification scopeIdentifier](self->_sharedZoneIdentification, "scopeIdentifier"));
    unsigned int v48 = [v8 isSharedInScopeWithIdentifier:v47];

    uint64_t v49 = objc_claimAutoreleasedReturnValue([v8 relatedScopedIdentifier]);
    v50 = (void *)v49;
    if (!v48)
    {
      if (v49)
      {
        id v61 = [v8 relatedRecordClass];
        v62 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v50));
        -[CPLCKBatchUploadPlanner _addRecordWithScopedIdentifierToUnshareTodos:recordClass:target:]( self,  "_addRecordWithScopedIdentifierToUnshareTodos:recordClass:target:",  v50,  v61,  v62);
      }

      v63 = (void *)objc_claimAutoreleasedReturnValue([v8 scopedIdentifier]);
      -[CPLCKBatchUploadPlanner _addRecordWithScopedIdentifierToUnshareTodos:recordClass:target:]( self,  "_addRecordWithScopedIdentifierToUnshareTodos:recordClass:target:",  v63,  [v8 recordClass],  self->_currentRecordTarget);
      goto LABEL_71;
    }

    if (!v49)
    {
LABEL_70:
      v63 = (void *)objc_claimAutoreleasedReturnValue([v8 updateSharingContributorUserIdentifiers]);
      v66 = (void *)objc_claimAutoreleasedReturnValue([v8 scopedIdentifier]);
      -[CPLCKBatchUploadPlanner _addRecordWithScopedIdentifierToShareTodos:recordClass:proposedContributorUserIdentifiers:target:force:]( self,  "_addRecordWithScopedIdentifierToShareTodos:recordClass:proposedContributorUserIdentifiers:target:force:",  v66,  [v8 recordClass],  v63,  self->_currentRecordTarget,  0);

LABEL_71:
      goto LABEL_44;
    }

    if ((-[CPLRecordTarget shouldUploadToOtherRecord]( self->_currentRecordTarget,  "shouldUploadToOtherRecord") & 1) == 0)
    {
      if ([v8 _relatedRecordShouldBeShared])
      {
        uint64_t v51 = 1LL;
        goto LABEL_69;
      }

      if ([v8 isAssetChange])
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v50));
        if ([v67 targetState] == (id)3) {
          -[CPLCKBatchUploadPlanner _copyPrivateMasterWithScopedIdentifier:masterTarget:uploadIndex:reason:]( self,  "_copyPrivateMasterWithScopedIdentifier:masterTarget:uploadIndex:reason:",  v50,  v67,  0LL,  @"sharing asset with split master");
        }
      }
    }

    uint64_t v51 = 0LL;
LABEL_69:
    id v64 = [v8 relatedRecordClass];
    v65 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v50));
    -[CPLCKBatchUploadPlanner _addRecordWithScopedIdentifierToShareTodos:recordClass:proposedContributorUserIdentifiers:target:force:]( self,  "_addRecordWithScopedIdentifierToShareTodos:recordClass:proposedContributorUserIdentifiers:target:force:",  v50,  v64,  0LL,  v65,  v51);

    goto LABEL_70;
  }

  id v43 = -[CPLRecordTarget targetState](self->_currentRecordTarget, "targetState");
  if ((unint64_t)v43 < 2)
  {
    -[CPLCKBatchUploadPlanner _deleteRecord](self, "_deleteRecord");
  }

  else
  {
    if (v43 != (id)2)
    {
      if (v43 != (id)3) {
        goto LABEL_44;
      }
      -[CPLCKBatchUploadPlanner _deleteRecord](self, "_deleteRecord");
    }

    -[CPLCKBatchUploadPlanner _deleteSharedRecord](self, "_deleteSharedRecord");
  }

- (void)_addCKRecordIDForResourcesUploadProgressTracking:(id)a3 size:(double)a4
{
  id v9 = a3;
  self->_uploadTotalSize = self->_uploadTotalSize + a4;
  if (!self->_sizesPerRecordID)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sizesPerRecordID = self->_sizesPerRecordID;
    self->_sizesPerRecordID = v6;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sizesPerRecordID, "setObject:forKeyedSubscript:", v8, v9);
}

- (id)_shareTodoForRecordWithScopedIdentifier:(id)a3 recordClass:(Class)a4 proposedContributorUserIdentifiers:(id)a5 target:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  destinationZoneIdentification = self->_destinationZoneIdentification;
  id v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 scopedIdentifier]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification recordIDWithRecordName:]( destinationZoneIdentification,  "recordIDWithRecordName:",  v15));

  sharedZoneIdentification = self->_sharedZoneIdentification;
  int v18 = (void *)objc_claimAutoreleasedReturnValue([v13 otherScopedIdentifier]);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification recordIDWithRecordName:]( sharedZoneIdentification,  "recordIDWithRecordName:",  v19));

  if ([v11 count])
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](self->_currentUserRecordID, "recordName"));
    unsigned __int8 v22 = [v11 containsObject:v21];

    if ((v22 & 1) == 0)
    {
      id v23 = [v11 mutableCopy];
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](self->_currentUserRecordID, "recordName"));
      [v23 addObject:v24];

      id v11 = v23;
    }
  }

  id v25 = objc_alloc(&OBJC_CLASS___CPLCKShareRecordTodo);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange recordModificationDate](self->_currentRecordChange, "recordModificationDate"));
  if (v26)
  {
    id v27 = sub_100033214((id *)&v25->super.isa, v10, a4, v16, v20, v11, v26);
  }

  else
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v27 = sub_100033214((id *)&v25->super.isa, v10, a4, v16, v20, v11, v28);
  }

  return v27;
}

- (void)_dontUnshareRecordWithScopedIdentifier:(id)a3 recordClass:(Class)a4
{
  id v9 = a3;
  if ((Class)objc_opt_class(&OBJC_CLASS___CPLMasterChange) != a4)
  {
    dontUnshareScopedIdentifier = self->_dontUnshareScopedIdentifier;
    if (!dontUnshareScopedIdentifier)
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v8 = self->_dontUnshareScopedIdentifier;
      self->_dontUnshareScopedIdentifier = v7;

      dontUnshareScopedIdentifier = self->_dontUnshareScopedIdentifier;
    }

    -[NSMutableSet addObject:](dontUnshareScopedIdentifier, "addObject:", v9);
  }
}

- (void)_addRecordWithScopedIdentifierToShareTodos:(id)a3 recordClass:(Class)a4 proposedContributorUserIdentifiers:(id)a5 target:(id)a6 force:(BOOL)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if ([v14 shouldUploadToOtherRecord] && !a7)
  {
    if (!_CPLSilentLogging)
    {
      id v15 = sub_100032740();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Already shared %@", buf, 0xCu);
      }
    }

- (void)_addRecordWithScopedIdentifierToUnshareTodos:(id)a3 recordClass:(Class)a4 target:(id)a5
{
  id v8 = (objc_class *)a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCKBatchUploadPlanner _shareTodoForRecordWithScopedIdentifier:recordClass:proposedContributorUserIdentifiers:target:]( self,  "_shareTodoForRecordWithScopedIdentifier:recordClass:proposedContributorUserIdentifiers:target:",  v8,  a4,  0LL,  v9));
  if (-[objc_class isSubclassOfClass:]( a4,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___CPLMasterChange))
    && [v9 shouldUploadToOtherRecord]
    && (!v10 ? (uint64_t v11 = 0LL) : (uint64_t v11 = v10[4]),
        id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_requestedSharedCKRecordIDs,  "objectForKeyedSubscript:",  v11)),  v12,  v12))
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_100032740();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification scopeIdentifier]( self->_destinationZoneIdentification,  "scopeIdentifier"));
        int v30 = 138412802;
        Class v31 = a4;
        __int16 v32 = 2112;
        v33 = v8;
        __int16 v34 = 2114;
        __int16 v35 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "We are already planning to copy shared <%@ %@> to %{public}@ - no need to unshare",  (uint8_t *)&v30,  0x20u);
      }
    }
  }

  else if ([v9 shouldUploadToOtherRecord])
  {
    if ((-[NSMutableSet containsObject:](self->_dontUnshareScopedIdentifier, "containsObject:", v8) & 1) != 0
      || -[CPLCKSharePlan hasShareTodoForScopedIdentifier:](self->_sharePlan, "hasShareTodoForScopedIdentifier:", v8))
    {
      if (!_CPLSilentLogging)
      {
        id v16 = sub_100032740();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v30 = 138412290;
          Class v31 = v8;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Won't unshare %@", (uint8_t *)&v30, 0xCu);
        }
      }
    }

    else if (!-[CPLCKUnsharePlan hasShareTodoForScopedIdentifier:]( self->_unsharePlan,  "hasShareTodoForScopedIdentifier:",  v8))
    {
      if (!self->_unsharePlan)
      {
        int v18 = -[CPLCKUnsharePlan initWithPlanner:](objc_alloc(&OBJC_CLASS___CPLCKUnsharePlan), "initWithPlanner:", self);
        unsharePlan = self->_unsharePlan;
        self->_unsharePlan = v18;
      }

      if (v10)
      {
        -[CPLCKBatchUploadPlanner _willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:]( self,  "_willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:",  v10[3],  v8);
        uint64_t v20 = v10[4];
      }

      else
      {
        -[CPLCKBatchUploadPlanner _willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:]( self,  "_willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:",  0LL,  v8);
        uint64_t v20 = 0LL;
      }

      -[CPLCKBatchUploadPlanner _willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:]( self,  "_willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:",  v20,  v8);
      if (!_CPLSilentLogging)
      {
        id v21 = sub_100032740();
        unsigned __int8 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = (objc_class *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification engineScope]( self->_sharedZoneIdentification,  "engineScope"));
          if (v10) {
            id v24 = (void *)v10[4];
          }
          else {
            id v24 = 0LL;
          }
          id v25 = v24;
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 recordName]);
          if (v10) {
            id v27 = (void *)v10[3];
          }
          else {
            id v27 = 0LL;
          }
          id v28 = v27;
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 recordName]);
          int v30 = 138413058;
          Class v31 = v8;
          __int16 v32 = 2112;
          v33 = v23;
          __int16 v34 = 2112;
          __int16 v35 = v26;
          __int16 v36 = 2112;
          __int16 v37 = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Will move back %@ from %@ (%@ -> %@)",  (uint8_t *)&v30,  0x2Au);
        }
      }

      -[CPLCKUnsharePlan addShareTodo:](self->_unsharePlan, "addShareTodo:", v10);
    }
  }
}

- (void)_deleteRecord
{
  if (-[CPLCloudKitZoneIdentification supportsDeletionOfRecord:scopeProvider:]( self->_destinationZoneIdentification,  "supportsDeletionOfRecord:scopeProvider:",  self->_currentRecordChange,  self))
  {
    if (-[CPLCloudKitZoneIdentification supportsDirectDeletionOfRecord:scopeProvider:]( self->_destinationZoneIdentification,  "supportsDirectDeletionOfRecord:scopeProvider:",  self->_currentRecordChange,  self))
    {
      -[CPLCKBatchUploadPlanner deleteCKRecordWithRecordID:]( self,  "deleteCKRecordWithRecordID:",  self->_currentRecordID);
    }

    else
    {
      currentRecordChange = self->_currentRecordChange;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zone](self->_destinationZoneIdentification, "zone"));
      id v9 = (id)objc_claimAutoreleasedReturnValue( +[CKRecord cpl_expungedRecordFromCPLRecordChange:inZone:target:]( &OBJC_CLASS___CKRecord,  "cpl_expungedRecordFromCPLRecordChange:inZone:target:",  currentRecordChange,  v7,  self->_currentRecordTarget));

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange scopedIdentifier](self->_currentRecordChange, "scopedIdentifier"));
      -[CPLCKBatchUploadPlanner uploadCKRecord:forScopedIdentifier:triggeringKey:]( self,  "uploadCKRecord:forScopedIdentifier:triggeringKey:",  v9,  v8,  @"isExpunged");
    }
  }

  else if (!_CPLSilentLogging)
  {
    id v3 = sub_100032740();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_currentRecordChange;
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dropping %@", buf, 0xCu);
    }
  }

- (void)_deleteSharedRecord
{
  if (!self->_sharedRecordID) {
    sub_10019030C((uint64_t)self, (uint64_t)a2);
  }
  if (-[CPLCloudKitZoneIdentification supportsDeletionOfRecord:scopeProvider:]( self->_sharedZoneIdentification,  "supportsDeletionOfRecord:scopeProvider:",  self->_currentRecordChange,  self))
  {
    if (-[CPLCloudKitZoneIdentification supportsDirectDeletionOfRecord:scopeProvider:]( self->_sharedZoneIdentification,  "supportsDirectDeletionOfRecord:scopeProvider:",  self->_currentRecordChange,  self))
    {
      -[CPLCKBatchUploadPlanner deleteSharedCKRecordWithRecordID:]( self,  "deleteSharedCKRecordWithRecordID:",  self->_sharedRecordID);
    }

    else
    {
      currentRecordChange = self->_currentRecordChange;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zone](self->_sharedZoneIdentification, "zone"));
      id v9 = (id)objc_claimAutoreleasedReturnValue( +[CKRecord cpl_expungedSharedRecordFromCPLRecordChange:inZone:target:]( &OBJC_CLASS___CKRecord,  "cpl_expungedSharedRecordFromCPLRecordChange:inZone:target:",  currentRecordChange,  v7,  self->_currentRecordTarget));

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange scopedIdentifier](self->_currentRecordChange, "scopedIdentifier"));
      -[CPLCKBatchUploadPlanner uploadSharedCKRecord:forScopedIdentifier:triggeringKey:]( self,  "uploadSharedCKRecord:forScopedIdentifier:triggeringKey:",  v9,  v8,  @"isExpunged");
    }
  }

  else if (!_CPLSilentLogging)
  {
    id v3 = sub_100032740();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_currentRecordChange;
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dropping %@ (shared)", buf, 0xCu);
    }
  }

- (void)deleteCKRecordWithRecordID:(id)a3
{
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    id v5 = sub_100032740();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Will delete shared %{public}@",  (uint8_t *)&v10,  0xCu);
    }
  }

  ckRecordIDsToDelete = self->_ckRecordIDsToDelete;
  if (!ckRecordIDsToDelete)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v9 = self->_ckRecordIDsToDelete;
    self->_ckRecordIDsToDelete = v8;

    ckRecordIDsToDelete = self->_ckRecordIDsToDelete;
  }

  -[NSMutableArray addObject:](ckRecordIDsToDelete, "addObject:", v4);
}

- (void)uploadCKRecord:(id)a3 forScopedIdentifier:(id)a4 triggeringKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!_CPLSilentLogging)
  {
    id v11 = sub_100032740();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 recordID]);
      int v17 = 138543618;
      int v18 = v13;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Will update %{public}@ (triggered by %@)",  (uint8_t *)&v17,  0x16u);
    }
  }

  ckRecordsToUpload = self->_ckRecordsToUpload;
  if (!ckRecordsToUpload)
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v16 = self->_ckRecordsToUpload;
    self->_ckRecordsToUpload = v15;

    ckRecordsToUpload = self->_ckRecordsToUpload;
  }

  -[NSMutableArray addObject:](ckRecordsToUpload, "addObject:", v8);
}

- (void)updatePrivateRecord:(id)a3 sharedToRecordWithID:(id)a4
{
}

- (void)deleteSharedCKRecordWithRecordID:(id)a3
{
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    id v5 = sub_100032740();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Will delete shared %{public}@",  (uint8_t *)&v10,  0xCu);
    }
  }

  sharedCKRecordIDsToDelete = self->_sharedCKRecordIDsToDelete;
  if (!sharedCKRecordIDsToDelete)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v9 = self->_sharedCKRecordIDsToDelete;
    self->_sharedCKRecordIDsToDelete = v8;

    sharedCKRecordIDsToDelete = self->_sharedCKRecordIDsToDelete;
  }

  -[NSMutableArray addObject:](sharedCKRecordIDsToDelete, "addObject:", v4);
}

- (void)uploadSharedCKRecord:(id)a3 forScopedIdentifier:(id)a4 triggeringKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!_CPLSilentLogging)
  {
    id v11 = sub_100032740();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 recordID]);
      int v17 = 138543618;
      int v18 = v13;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Will update shared %{public}@ (triggered by %@)",  (uint8_t *)&v17,  0x16u);
    }
  }

  sharedCKRecordsToUpload = self->_sharedCKRecordsToUpload;
  if (!sharedCKRecordsToUpload)
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v16 = self->_sharedCKRecordsToUpload;
    self->_sharedCKRecordsToUpload = v15;

    sharedCKRecordsToUpload = self->_sharedCKRecordsToUpload;
  }

  -[NSMutableArray addObject:](sharedCKRecordsToUpload, "addObject:", v8);
}

- (void)requestSharedCKRecordWithRecordIDBeforeUpload:(id)a3 fetchedBlock:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  requestedSharedCKRecordIDs = self->_requestedSharedCKRecordIDs;
  if (requestedSharedCKRecordIDs)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( requestedSharedCKRecordIDs,  "objectForKeyedSubscript:",  v8));

    if (v12) {
      goto LABEL_10;
    }
  }

  else
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v14 = self->_requestedSharedCKRecordIDs;
    self->_requestedSharedCKRecordIDs = v13;
  }

  if (!_CPLSilentLogging)
  {
    id v15 = sub_100032740();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      currentRecordChange = self->_currentRecordChange;
      int v19 = 138543874;
      id v20 = v8;
      __int16 v21 = 2112;
      unsigned __int8 v22 = currentRecordChange;
      __int16 v23 = 2114;
      id v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Will fetch shared %{public}@ for %@ before upload because %{public}@",  (uint8_t *)&v19,  0x20u);
    }
  }

  id v18 = objc_retainBlock(v9);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_requestedSharedCKRecordIDs,  "setObject:forKeyedSubscript:",  v18,  v8);

LABEL_10:
}

- (BOOL)didFetchSharedCKRecord:(id)a3 forRecordWithRecordID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_requestedSharedCKRecordIDs,  "objectForKeyedSubscript:",  v9));
  id v11 = (void *)v10;
  if (v10)
  {
    char v12 = (*(uint64_t (**)(uint64_t, id, id, id *))(v10 + 16))(v10, v9, v8, a5);
    -[NSMutableDictionary removeObjectForKey:](self->_requestedSharedCKRecordIDs, "removeObjectForKey:", v9);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_100032740();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138412546;
        id v19 = v8;
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Received unrequested fetch record %@ for %@",  (uint8_t *)&v18,  0x16u);
      }
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    id v16 = v15;
    if (a5) {
      *a5 = v15;
    }

    char v12 = 0;
  }

  return v12;
}

- (NSArray)requestedSharedCKRecordIDs
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_requestedSharedCKRecordIDs, "allKeys");
}

- (void)requestPrivateCKRecordWithRecordIDBeforeUpload:(id)a3 fetchedBlock:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  requestedPrivateCKRecordIDs = self->_requestedPrivateCKRecordIDs;
  if (requestedPrivateCKRecordIDs)
  {
    char v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( requestedPrivateCKRecordIDs,  "objectForKeyedSubscript:",  v8));

    if (v12) {
      goto LABEL_15;
    }
  }

  else
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v14 = self->_requestedPrivateCKRecordIDs;
    self->_requestedPrivateCKRecordIDs = v13;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_requestedPrivateCKRecordIDs,  "objectForKeyedSubscript:",  v8));

  if (!v15)
  {
    if (!_CPLSilentLogging)
    {
      id v19 = sub_100032740();
      __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        currentRecordChange = self->_currentRecordChange;
        int v22 = 138543874;
        id v23 = v8;
        __int16 v24 = 2112;
        id v25 = currentRecordChange;
        __int16 v26 = 2114;
        id v27 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Will fetch private %{public}@ for %@ before upload because %{public}@",  (uint8_t *)&v22,  0x20u);
      }
    }

    int v17 = (os_log_s *)objc_retainBlock(v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_requestedPrivateCKRecordIDs,  "setObject:forKeyedSubscript:",  v17,  v8);
    goto LABEL_14;
  }

  if (!_CPLSilentLogging)
  {
    id v16 = sub_100032740();
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = self->_currentRecordChange;
      int v22 = 138543874;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v18;
      __int16 v26 = 2114;
      id v27 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Will also fetch private %{public}@ for %@ before upload because %{public}@",  (uint8_t *)&v22,  0x20u);
    }

- (BOOL)didFetchPrivateCKRecord:(id)a3 forRecordWithRecordID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_requestedPrivateCKRecordIDs,  "objectForKeyedSubscript:",  v9));
  id v11 = (void *)v10;
  if (v10)
  {
    char v12 = (*(uint64_t (**)(uint64_t, id, id, id *))(v10 + 16))(v10, v9, v8, a5);
    -[NSMutableDictionary removeObjectForKey:](self->_requestedPrivateCKRecordIDs, "removeObjectForKey:", v9);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_100032740();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138412546;
        id v19 = v8;
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Received unrequested fetch record %@ for %@",  (uint8_t *)&v18,  0x16u);
      }
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    id v16 = v15;
    if (a5) {
      *a5 = v15;
    }

    char v12 = 0;
  }

  return v12;
}

- (NSArray)requestedPrivateCKRecordIDs
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_requestedPrivateCKRecordIDs, "allKeys");
}

- (double)uploadedSize
{
  uint64_t v6 = 0LL;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  progressSizesPerRecordID = self->_progressSizesPerRecordID;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100034918;
  v5[3] = &unk_10023F5A0;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( progressSizesPerRecordID,  "enumerateKeysAndObjectsUsingBlock:",  v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)planProgess
{
  double result = 0.0;
  if (self->_uploadTotalSize > 0.0)
  {
    -[CPLCKBatchUploadPlanner uploadedSize](self, "uploadedSize", 0.0);
    return fmin(v4 / self->_uploadTotalSize, 1.0);
  }

  return result;
}

- (id)willUploadRecords
{
  if (!_CPLSilentLogging)
  {
    id v3 = sub_100032740();
    double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification cloudKitScope]( self->_destinationZoneIdentification,  "cloudKitScope"));
      if (self->_ckRecordsToUpload) {
        ckRecordsToUpload = self->_ckRecordsToUpload;
      }
      else {
        ckRecordsToUpload = (NSMutableArray *)&__NSArray0__struct;
      }
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray cplFullDescription](ckRecordsToUpload, "cplFullDescription"));
      int v11 = 138412546;
      char v12 = v5;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Will upload to %@: %@", (uint8_t *)&v11, 0x16u);
    }
  }

  dateOfFirstUploadProgress = self->_dateOfFirstUploadProgress;
  self->_dateOfFirstUploadProgress = 0LL;

  -[CPLCKBatchUploadPlanner _resetPlannerState](self, "_resetPlannerState");
  requestedSharedCKRecordIDs = self->_requestedSharedCKRecordIDs;
  self->_requestedSharedCKRecordIDs = 0LL;

  return self->_uploadContext;
}

- (void)uploadOfRecordID:(id)a3 didProgress:(double)a4
{
  id v22 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sizesPerRecordID, "objectForKeyedSubscript:"));
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 doubleValue];
    if (v9 > 0.0)
    {
      double v10 = v9;
      if (!self->_dateOfFirstUploadProgress)
      {
        int v11 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        dateOfFirstUploadProgress = self->_dateOfFirstUploadProgress;
        self->_dateOfFirstUploadProgress = v11;
      }

      if (!self->_progressSizesPerRecordID)
      {
        __int16 v13 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSMutableDictionary count](self->_sizesPerRecordID, "count"));
        progressSizesPerRecordID = self->_progressSizesPerRecordID;
        self->_progressSizesPerRecordID = v13;
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10 * a4));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_progressSizesPerRecordID,  "setObject:forKeyedSubscript:",  v15,  v22);
    }
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[CPLCKBatchUploadPlanner scopedIdentifierForCKRecordID:](self, "scopedIdentifierForCKRecordID:", v22));
  if (v16)
  {
    int v17 = (void *)v16;
    if (self->_progressHandler)
    {
      if (-[NSMutableSet containsObject:]( self->_scopedIdentifiersNeedingToCallProgressHandler,  "containsObject:",  v16))
      {
        float v18 = a4;
        (*((void (**)(float))self->_progressHandler + 2))(v18);
      }
    }
  }

  else
  {
    id v19 = (CPLCKBatchUploadPlanner *)sub_1001903F4(v22, a2, self);
    -[CPLCKBatchUploadPlanner didFinishUploadOfRecordsWithError:](v19, v20, v21);
  }

- (void)didFinishUploadOfRecordsWithError:(id)a3
{
  dateOfFirstUploadProgress = self->_dateOfFirstUploadProgress;
  if (dateOfFirstUploadProgress)
  {
    -[NSDate timeIntervalSinceNow](dateOfFirstUploadProgress, "timeIntervalSinceNow", a3);
    self->_totalDurationOfUpload = self->_totalDurationOfUpload + fmax(-v5, 0.0);
    uint64_t v6 = self->_dateOfFirstUploadProgress;
    self->_dateOfFirstUploadProgress = 0LL;
  }

  uploadContext = self->_uploadContext;
  self->_uploadContext = 0LL;
}

- (id)willUploadSharedRecords
{
  if (self->_sharedZoneIdentification) {
    BOOL v3 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    id v4 = sub_100032740();
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification cloudKitScope](self->_sharedZoneIdentification, "cloudKitScope"));
      if (self->_sharedCKRecordsToUpload) {
        sharedCKRecordsToUpload = self->_sharedCKRecordsToUpload;
      }
      else {
        sharedCKRecordsToUpload = (NSMutableArray *)&__NSArray0__struct;
      }
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray cplFullDescription](sharedCKRecordsToUpload, "cplFullDescription"));
      int v11 = 138412546;
      char v12 = v6;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Will upload to shared %@: %@",  (uint8_t *)&v11,  0x16u);
    }
  }

  dateOfFirstUploadProgress = self->_dateOfFirstUploadProgress;
  self->_dateOfFirstUploadProgress = 0LL;

  return self->_sharedUploadContext;
}

- (void)didFinishUploadOfSharedRecordsWithError:(id)a3
{
  dateOfFirstUploadProgress = self->_dateOfFirstUploadProgress;
  if (dateOfFirstUploadProgress)
  {
    -[NSDate timeIntervalSinceNow](dateOfFirstUploadProgress, "timeIntervalSinceNow", a3);
    self->_totalDurationOfUpload = self->_totalDurationOfUpload + fmax(-v5, 0.0);
    uint64_t v6 = self->_dateOfFirstUploadProgress;
    self->_dateOfFirstUploadProgress = 0LL;
  }

  sharedUploadContext = self->_sharedUploadContext;
  self->_sharedUploadContext = 0LL;
}

- (void)updateTargetMappingAfterUpload
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  BOOL v3 = self->_scopedIdentifiersMovingToSplitState;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        double v9 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v8,  (void)v14));
        double v10 = objc_alloc(&OBJC_CLASS___CPLRecordTarget);
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 otherScopedIdentifier]);
        char v12 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]( v10,  "initWithScopedIdentifier:otherScopedIdentifier:targetState:",  v8,  v11,  3LL);

        -[CPLRecordTargetMapping setTarget:forRecordWithScopedIdentifier:]( self->_targetMapping,  "setTarget:forRecordWithScopedIdentifier:",  v12,  v8);
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v5);
  }

  requestedSharedCKRecordIDs = self->_requestedSharedCKRecordIDs;
  self->_requestedSharedCKRecordIDs = 0LL;
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  return -[CPLCloudKitScopeProvider cloudKitScopeForScopeIdentifier:]( self->_scopeProvider,  "cloudKitScopeForScopeIdentifier:",  a3);
}

- (id)zoneIDFromScopeIdentifier:(id)a3
{
  return -[CPLCloudKitScopeProvider zoneIDFromScopeIdentifier:](self->_scopeProvider, "zoneIDFromScopeIdentifier:", a3);
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  return -[CPLCloudKitScopeProvider scopeIdentifierFromZoneID:](self->_scopeProvider, "scopeIdentifierFromZoneID:", a3);
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_ckRecordIDToScopedIdentifier,  "objectForKeyedSubscript:",  v4));
  uint64_t v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue( -[CPLCloudKitScopeProvider scopedIdentifierForCKRecordID:]( self->_scopeProvider,  "scopedIdentifierForCKRecordID:",  v4));
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_ckRecordIDToRejectedScopedIdentifier,  "objectForKeyedSubscript:",  v4));
  uint64_t v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[CPLCKBatchUploadPlanner scopedIdentifierForCKRecordID:](self, "scopedIdentifierForCKRecordID:", v4));
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)_noteMasterWillBeUploadedToPrivateZone:(id)a3
{
  id v4 = a3;
  mastersUploadedToPrivateZone = self->_mastersUploadedToPrivateZone;
  id v8 = v4;
  if (!mastersUploadedToPrivateZone)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v7 = self->_mastersUploadedToPrivateZone;
    self->_mastersUploadedToPrivateZone = v6;

    id v4 = v8;
    mastersUploadedToPrivateZone = self->_mastersUploadedToPrivateZone;
  }

  -[NSMutableSet addObject:](mastersUploadedToPrivateZone, "addObject:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_mastersNotYetUploadedToPrivateZone, "removeObjectForKey:", v8);
}

- (void)_noteMasterWillBeUploadedToSharedZone:(id)a3
{
  id v4 = a3;
  mastersUploadedToSharedZone = self->_mastersUploadedToSharedZone;
  id v8 = v4;
  if (!mastersUploadedToSharedZone)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v7 = self->_mastersUploadedToSharedZone;
    self->_mastersUploadedToSharedZone = v6;

    id v4 = v8;
    mastersUploadedToSharedZone = self->_mastersUploadedToSharedZone;
  }

  -[NSMutableSet addObject:](mastersUploadedToSharedZone, "addObject:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_mastersNotYetUploadedToSharedZone, "removeObjectForKey:", v8);
}

- (BOOL)_shouldUpdateKeyOnCKRecord:(id)a3
{
  id v5 = a3;
  if (-[CPLCKRecordPropertyMapping isKeyReadOnly:recordClass:]( self->_propertyMapping,  "isKeyReadOnly:recordClass:",  v5,  -[CPLRecordChange recordClass](self->_currentRecordChange, "recordClass")))
  {
    goto LABEL_2;
  }

  if (self->_sharedZoneIdentification
    && -[CPLRecordTarget shouldUploadToOtherRecord]( self->_currentRecordTarget,  "shouldUploadToOtherRecord"))
  {
    if (-[CPLRecordTarget targetState](self->_currentRecordTarget, "targetState") == (id)2 && !self->_ckRecordToUpload)
    {
      if (!-[CPLCKRecordPropertyMapping shouldSplitIndirectRecordForKey:recordClass:]( self->_propertyMapping,  "shouldSplitIndirectRecordForKey:recordClass:",  v5,  -[CPLRecordChange recordClass](self->_currentRecordChange, "recordClass")))
      {
        if (-[CPLCKRecordPropertyMapping shouldUpdateKeyOnPrivateRecord:recordClass:]( self->_propertyMapping,  "shouldUpdateKeyOnPrivateRecord:recordClass:",  v5,  -[CPLRecordChange recordClass](self->_currentRecordChange, "recordClass")))
        {
          currentRecordChange = self->_currentRecordChange;
          v65 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zone](self->_destinationZoneIdentification, "zone"));
          v66 = CPLBaseCKRecordFromCPLRecordChange(currentRecordChange, v65, self->_currentRecordTarget);
          v67 = (CKRecord *)objc_claimAutoreleasedReturnValue(v66);
          pendingCKRecordToUpload = self->_pendingCKRecordToUpload;
          self->_pendingCKRecordToUpload = v67;

          id v69 = -[CPLSimpleCKRecordBuilder initWithBaseCKRecord:scopeProvider:currentUserRecordID:targetMapping:]( objc_alloc(&OBJC_CLASS___CPLSimpleCKRecordBuilder),  "initWithBaseCKRecord:scopeProvider:currentUserRecordID:targetMapping:",  self->_pendingCKRecordToUpload,  self,  self->_currentUserRecordID,  self->_targetMapping);
          simpleBuilder = self->_simpleBuilder;
          self->_simpleBuilder = v69;
        }

        goto LABEL_2;
      }
    }

    else if (!-[CPLCKRecordPropertyMapping shouldUpdateKeyOnPrivateRecord:recordClass:]( self->_propertyMapping,  "shouldUpdateKeyOnPrivateRecord:recordClass:",  v5,  -[CPLRecordChange recordClass](self->_currentRecordChange, "recordClass")))
    {
LABEL_2:
      BOOL v6 = 0;
LABEL_65:

      return v6;
    }
  }

  if (self->_ckRecordToUpload)
  {
LABEL_64:
    BOOL v6 = 1;
    goto LABEL_65;
  }

  id v7 = self->_pendingCKRecordToUpload;
  if (v7)
  {
    id v8 = v7;
    ckRecordToUpload = self->_ckRecordToUpload;
    self->_ckRecordToUpload = v8;
  }

  else
  {
    double v10 = self->_currentRecordChange;
    ckRecordToUpload = (CKRecord *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zone](self->_destinationZoneIdentification, "zone"));
    int v11 = CPLBaseCKRecordFromCPLRecordChange(v10, ckRecordToUpload, self->_currentRecordTarget);
    char v12 = (CKRecord *)objc_claimAutoreleasedReturnValue(v11);
    __int16 v13 = self->_ckRecordToUpload;
    self->_ckRecordToUpload = v12;
  }

  __int128 v14 = self->_pendingCKRecordToUpload;
  self->_pendingCKRecordToUpload = 0LL;

  if (-[CPLRecordChange isMasterChange](self->_currentRecordChange, "isMasterChange"))
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange scopedIdentifier](self->_currentRecordChange, "scopedIdentifier"));
    -[CPLCKBatchUploadPlanner _noteMasterWillBeUploadedToPrivateZone:]( self,  "_noteMasterWillBeUploadedToPrivateZone:",  v15);
  }

  if (self->_cplEnabledDate
    && -[CPLRecordChange isAssetChange](self->_currentRecordChange, "isAssetChange"))
  {
    -[CPLRecordChange setMostRecentAddedDateOnCKRecord:withCPLEnabledDate:]( self->_currentRecordChange,  "setMostRecentAddedDateOnCKRecord:withCPLEnabledDate:",  self->_ckRecordToUpload,  self->_cplEnabledDate);
  }

  if (-[CPLRecordChange isFullRecord](self->_currentRecordChange, "isFullRecord")) {
    -[CPLCloudKitZoneIdentification setupRootOnRecord:]( self->_destinationZoneIdentification,  "setupRootOnRecord:",  self->_ckRecordToUpload);
  }
  recordModificationDate = self->_recordModificationDate;
  if (recordModificationDate) {
    -[CKRecord setObject:forKey:]( self->_ckRecordToUpload,  "setObject:forKey:",  recordModificationDate,  @"recordModificationDate");
  }
  __int128 v17 = self->_ckRecordToUpload;
  float v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange scopedIdentifier](self->_currentRecordChange, "scopedIdentifier"));
  -[CPLCKBatchUploadPlanner uploadCKRecord:forScopedIdentifier:triggeringKey:]( self,  "uploadCKRecord:forScopedIdentifier:triggeringKey:",  v17,  v18,  v5);

  if (!self->_sharedZoneIdentification)
  {
LABEL_63:
    v77 = -[CPLSimpleCKRecordBuilder initWithBaseCKRecord:scopeProvider:currentUserRecordID:targetMapping:]( objc_alloc(&OBJC_CLASS___CPLSimpleCKRecordBuilder),  "initWithBaseCKRecord:scopeProvider:currentUserRecordID:targetMapping:",  self->_ckRecordToUpload,  self,  self->_currentUserRecordID,  self->_targetMapping);
    v78 = self->_simpleBuilder;
    self->_simpleBuilder = v77;

    goto LABEL_64;
  }

  if (-[CPLRecordTarget targetState](self->_currentRecordTarget, "targetState") == (id)2)
  {
    -[CPLCKBatchUploadPlanner updatePrivateRecord:sharedToRecordWithID:]( self,  "updatePrivateRecord:sharedToRecordWithID:",  self->_ckRecordToUpload,  self->_sharedRecordID);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordTarget scopedIdentifier](self->_currentRecordTarget, "scopedIdentifier"));
    -[CPLCKBatchUploadPlanner _noteRecordWithScopedIdentifierWillMoveToSplitState:]( self,  "_noteRecordWithScopedIdentifierWillMoveToSplitState:",  v19);

    unsigned int v20 = -[CPLCKRecordPropertyMapping doesRecordClassSupportSparseRecords:]( self->_propertyMapping,  "doesRecordClassSupportSparseRecords:",  -[CPLRecordChange recordClass](self->_currentRecordChange, "recordClass"));
    id v21 = @"shared record needs private properties to be uploaded but can't be sparse";
    if (v20) {
      id v21 = @"creating private sparse record from shared record";
    }
    v137 = v21;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordTarget otherScopedIdentifier](self->_currentRecordTarget, "otherScopedIdentifier"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);

    __int16 v24 = objc_alloc(&OBJC_CLASS___CKRecordID);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self->_sharedZoneIdentification, "zoneID"));
    __int16 v26 = -[CKRecordID initWithRecordName:zoneID:](v24, "initWithRecordName:zoneID:", v23, v25);

    id v27 = -[CPLRecordChange recordClass](self->_currentRecordChange, "recordClass");
    id v28 = a2;
    id v29 = objc_alloc(&OBJC_CLASS___CPLCKSplitCopyHelper);
    int v30 = self->_ckRecordToUpload;
    int64_t v31 = -[CPLCloudKitZoneIdentification databaseScope](self->_sharedZoneIdentification, "databaseScope");
    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](self->_ckRecordToUpload, "recordID"));
    v33 = v29;
    a2 = v28;
    __int16 v34 = -[CPLCKSplitCopyHelper initWithBaseCKRecord:sourceRecordID:fromPrivateRecord:recordClass:sourceDatabaseScope:destinationRecordID:planner:]( v33,  "initWithBaseCKRecord:sourceRecordID:fromPrivateRecord:recordClass:sourceDatabaseScope:destinationRecordID:planner:",  v30,  v26,  0LL,  v27,  v31,  v32,  self);

    v153[0] = _NSConcreteStackBlock;
    v153[1] = 3221225472LL;
    v153[2] = sub_1000361A4;
    v153[3] = &unk_10023F5C8;
    v155 = self;
    v156 = v28;
    v154 = v34;
    __int16 v35 = v34;
    -[CPLCKBatchUploadPlanner requestSharedCKRecordWithRecordIDBeforeUpload:fetchedBlock:reason:]( self,  "requestSharedCKRecordWithRecordIDBeforeUpload:fetchedBlock:reason:",  v26,  v153,  v137);
  }

  unsigned int v36 = -[CPLRecordChange isAssetChange](self->_currentRecordChange, "isAssetChange");
  __int16 v37 = self->_currentRecordChange;
  if (!v36)
  {
    id v43 = (CPLRecordChange *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange relatedScopedIdentifier](v37, "relatedScopedIdentifier"));
    if (!v43)
    {
LABEL_62:

      goto LABEL_63;
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v43));
    if (v44)
    {
      v45 = v44;
      if ([v44 targetState] != (id)2
        || (-[NSMutableSet containsObject:]( self->_scopedIdentifiersMovingToSplitState,  "containsObject:",  v43) & 1) != 0)
      {
        goto LABEL_61;
      }

      SEL v134 = a2;
      v46 = (void *)objc_claimAutoreleasedReturnValue([v45 otherScopedIdentifier]);
      uint64_t v47 = objc_claimAutoreleasedReturnValue([v46 identifier]);

      unsigned int v48 = objc_alloc(&OBJC_CLASS___CKRecordID);
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self->_sharedZoneIdentification, "zoneID"));
      v138 = (void *)v47;
      v50 = -[CKRecordID initWithRecordName:zoneID:](v48, "initWithRecordName:zoneID:", v47, v49);

      id v133 = -[CPLRecordChange relatedRecordClass](self->_currentRecordChange, "relatedRecordClass");
      uint64_t v51 = (CKRecordID *)[v133 newRecordWithScopedIdentifier:v43];
      BOOL v52 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zone](self->_destinationZoneIdentification, "zone"));
      v53 = CPLBaseCKRecordFromCPLRecordChange(v51, v52, v45);
      v54 = (void *)objc_claimAutoreleasedReturnValue(v53);

      -[CPLCKBatchUploadPlanner updatePrivateRecord:sharedToRecordWithID:]( self,  "updatePrivateRecord:sharedToRecordWithID:",  v54,  v50);
      unsigned int v55 = (void *)objc_claimAutoreleasedReturnValue([v54 recordID]);
      -[CPLCKBatchUploadPlanner _willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:]( self,  "_willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:",  v55,  v43);

      -[NSMutableArray insertObject:atIndex:]( self->_ckRecordsToUpload,  "insertObject:atIndex:",  v54,  (char *)-[NSMutableArray count](self->_ckRecordsToUpload, "count") - 1);
      -[CPLCKBatchUploadPlanner _noteRecordWithScopedIdentifierWillMoveToSplitState:]( self,  "_noteRecordWithScopedIdentifierWillMoveToSplitState:",  v43);
      char v56 = self->_recordModificationDate;
      if (v56) {
        [v54 setObject:v56 forKeyedSubscript:@"recordModificationDate"];
      }
      if (-[CKRecordID isAssetChange](v51, "isAssetChange")) {
        -[CKRecordID setMostRecentAddedDateOnCKRecord:withCPLEnabledDate:]( v51,  "setMostRecentAddedDateOnCKRecord:withCPLEnabledDate:",  v54,  self->_cplEnabledDate);
      }
      v130 = v56;
      if (-[CPLCloudKitZoneIdentification supportsDeletionOfRecord:scopeProvider:]( self->_destinationZoneIdentification,  "supportsDeletionOfRecord:scopeProvider:",  v51,  self)
        && !-[CPLCloudKitZoneIdentification supportsDirectDeletionOfRecord:scopeProvider:]( self->_destinationZoneIdentification,  "supportsDirectDeletionOfRecord:scopeProvider:",  v51,  self))
      {
        [v54 setObject:&__kCFBooleanFalse forKeyedSubscript:@"isExpunged"];
        v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CPLRecordChange inTrash](self->_currentRecordChange, "inTrash")));
        [v54 setObject:v57 forKeyedSubscript:@"isDeleted"];
      }

      v58 = objc_alloc(&OBJC_CLASS___CPLCKSplitCopyHelper);
      int64_t v59 = -[CPLCloudKitZoneIdentification databaseScope](self->_sharedZoneIdentification, "databaseScope");
      v60 = (void *)objc_claimAutoreleasedReturnValue([v54 recordID]);
      id v61 = -[CPLCKSplitCopyHelper initWithBaseCKRecord:sourceRecordID:fromPrivateRecord:recordClass:sourceDatabaseScope:destinationRecordID:planner:]( v58,  "initWithBaseCKRecord:sourceRecordID:fromPrivateRecord:recordClass:sourceDatabaseScope:destinationRecordID:planner:",  v54,  v50,  0LL,  v133,  v59,  v60,  self);

      v140[0] = _NSConcreteStackBlock;
      v140[1] = 3221225472LL;
      v140[2] = sub_1000364F8;
      v140[3] = &unk_10023F5C8;
      v142 = self;
      SEL v143 = v134;
      v141 = v61;
      v62 = v61;
      -[CPLCKBatchUploadPlanner requestSharedCKRecordWithRecordIDBeforeUpload:fetchedBlock:reason:]( self,  "requestSharedCKRecordWithRecordIDBeforeUpload:fetchedBlock:reason:",  v50,  v140,  @"shared related record needs to be in private zone");

      goto LABEL_47;
    }

    if (!_CPLSilentLogging)
    {
      id v117 = sub_100032740();
      v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
      if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
      {
        id v119 = -[CPLRecordChange relatedRecordClass](self->_currentRecordChange, "relatedRecordClass");
        v120 = self->_currentRecordChange;
        *(_DWORD *)buf = 138412802;
        id v158 = v119;
        __int16 v159 = 2112;
        v160 = v43;
        __int16 v161 = 2112;
        v162 = v120;
        _os_log_impl( (void *)&_mh_execute_header,  v118,  OS_LOG_TYPE_ERROR,  "Target for <%@ %@> related to %@ should be known here",  buf,  0x20u);
      }
    }

    v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v122 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKi t/CPLCKBatchUploadPlanner.m"));
    [v121 handleFailureInMethod:a2, self, v122, 929, @"Target for <%@ %@> related to %@ should be known here", -[CPLRecordChange relatedRecordClass](self->_currentRecordChange, "relatedRecordClass"), v43, self->_currentRecordChange object file lineNumber description];
LABEL_107:

    abort();
  }

  v38 = self->_currentRecordChange;
  __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification scopeIdentifier](self->_sharedZoneIdentification, "scopeIdentifier"));
  LOBYTE(v38) = -[CPLRecordChange isSharedInScopeWithIdentifier:]( v38,  "isSharedInScopeWithIdentifier:",  v39);

  if ((v38 & 1) == 0)
  {
    if ((-[CPLRecordTarget shouldUploadToOtherRecord]( self->_currentRecordTarget,  "shouldUploadToOtherRecord") & 1) != 0)
    {
LABEL_53:
      if ((-[CPLRecordTarget shouldUploadToOtherRecord]( self->_currentRecordTarget,  "shouldUploadToOtherRecord") & 1) != 0) {
        goto LABEL_63;
      }
      uint64_t v71 = objc_claimAutoreleasedReturnValue(-[CPLRecordChange relatedScopedIdentifier](self->_currentRecordChange, "relatedScopedIdentifier"));
      if (!v71) {
        goto LABEL_63;
      }
      v72 = (void *)v71;
      v73 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v71));
      id v74 = [v73 targetState];

      if (v74 != (id)2) {
        goto LABEL_63;
      }
      int v75 = 1;
      v76 = @"private asset is pointing to indirect master";
      goto LABEL_59;
    }

    int v75 = 1;
    v76 = @"private asset needs to copy shared master back to private zone";
LABEL_59:
    id v43 = self->_currentRecordChange;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange masterScopedIdentifier](v43, "masterScopedIdentifier"));
    if (!v45
      || (-[NSMutableSet containsObject:](self->_mastersUploadedToPrivateZone, "containsObject:", v45) & 1) != 0)
    {
      goto LABEL_61;
    }

    if (v75) {
      -[CPLCKBatchUploadPlanner _noteRecordWithScopedIdentifierWillMoveToSplitState:]( self,  "_noteRecordWithScopedIdentifierWillMoveToSplitState:",  v45);
    }
    -[CPLCKUnsharePlan removeShareTodoForScopedIdentifier:]( self->_unsharePlan,  "removeShareTodoForScopedIdentifier:",  v45);
    v80 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v45));
    if (v80)
    {
      v63 = v80;
      if ([v80 targetState] != (id)2) {
        goto LABEL_48;
      }
      v81 = objc_alloc(&OBJC_CLASS___CKRecordID);
      v82 = v63;
      v83 = (void *)objc_claimAutoreleasedReturnValue([v63 scopedIdentifier]);
      v84 = (void *)objc_claimAutoreleasedReturnValue([v83 identifier]);
      v85 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self->_destinationZoneIdentification, "zoneID"));
      v135 = -[CKRecordID initWithRecordName:zoneID:](v81, "initWithRecordName:zoneID:", v84, v85);

      v86 = objc_alloc(&OBJC_CLASS___CKRecordID);
      v138 = v82;
      v87 = (void *)objc_claimAutoreleasedReturnValue([v82 otherScopedIdentifier]);
      v88 = (void *)objc_claimAutoreleasedReturnValue([v87 identifier]);
      v89 = v88;
      if (!v88)
      {
        id v132 = (id)objc_claimAutoreleasedReturnValue([v138 scopedIdentifier]);
        v89 = (void *)objc_claimAutoreleasedReturnValue([v132 identifier]);
      }

      v90 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self->_sharedZoneIdentification, "zoneID"));
      v91 = -[CKRecordID initWithRecordName:zoneID:](v86, "initWithRecordName:zoneID:", v89, v90);

      if (!v88)
      {
      }

      v92 = (char *)-[NSMutableArray count](self->_ckRecordsToUpload, "count") - 1;
      -[CPLCKBatchUploadPlanner _willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:]( self,  "_willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:",  v135,  v45);
      -[CPLCKBatchUploadPlanner _willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:]( self,  "_willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:",  v91,  v45);
      v144[0] = _NSConcreteStackBlock;
      v144[1] = 3221225472LL;
      v144[2] = sub_1000363B0;
      v144[3] = &unk_10023F618;
      v144[4] = self;
      id v145 = v45;
      v146 = v91;
      v147 = v135;
      v148 = (__CFString *)v76;
      v149 = v92;
      uint64_t v51 = v135;
      v50 = v91;
      -[CPLCKBatchUploadPlanner requestSharedCKRecordWithRecordIDBeforeUpload:fetchedBlock:reason:]( self,  "requestSharedCKRecordWithRecordIDBeforeUpload:fetchedBlock:reason:",  v50,  v144,  v76);

LABEL_47:
      v63 = v138;
LABEL_48:

LABEL_61:
      goto LABEL_62;
    }

    if (!_CPLSilentLogging)
    {
      id v123 = sub_100032740();
      v124 = (os_log_s *)objc_claimAutoreleasedReturnValue(v123);
      if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v158 = v45;
        __int16 v159 = 2112;
        v160 = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v124,  OS_LOG_TYPE_ERROR,  "Missing target for %@ to upload %@",  buf,  0x16u);
      }
    }

    v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v122 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKi t/CPLCKBatchUploadPlanner.m"));
    [v121 handleFailureInMethod:a2, self, v122, 886, @"Missing target for %@ to upload %@", v45, v43, v126 object file lineNumber description];
    goto LABEL_107;
  }

  if (!-[CPLRecordChange _relatedRecordShouldBeShared]( self->_currentRecordChange,  "_relatedRecordShouldBeShared")
    || (-[CPLRecordTarget shouldUploadToOtherRecord]( self->_currentRecordTarget,  "shouldUploadToOtherRecord") & 1) != 0)
  {
    goto LABEL_53;
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange relatedScopedIdentifier](self->_currentRecordChange, "relatedScopedIdentifier"));
  v41 = a2;
  if (!v40
    || (-[NSMutableSet containsObject:](self->_mastersUploadedToPrivateZone, "containsObject:", v40) & 1) != 0)
  {
    id v42 = v40;
LABEL_34:

    a2 = v41;
    goto LABEL_53;
  }

  v93 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_mastersNotYetUploadedToPrivateZone,  "objectForKeyedSubscript:",  v40));
  v94 = v93;
  if (!v93)
  {
LABEL_100:

    int v75 = 0;
    v76 = @"asset/master needs to be uploaded to private zone first before being shared";
    a2 = v41;
    goto LABEL_59;
  }

  if ([v93 isFullRecord])
  {
    uint64_t v95 = objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v40));
    if (v95)
    {
      v96 = (void *)v95;
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zone](self->_destinationZoneIdentification, "zone"));
      v131 = v96;
      v98 = CPLBaseCKRecordFromCPLRecordChange(v94, v97, v96);
      uint64_t v99 = objc_claimAutoreleasedReturnValue(v98);

      v136 = (void *)v99;
      v139 = -[CPLSimpleCKRecordBuilder initWithBaseCKRecord:scopeProvider:currentUserRecordID:targetMapping:]( objc_alloc(&OBJC_CLASS___CPLSimpleCKRecordBuilder),  "initWithBaseCKRecord:scopeProvider:currentUserRecordID:targetMapping:",  v99,  self,  self->_currentUserRecordID,  self->_targetMapping);
      sharedCKRecordsToUpload = self->_sharedCKRecordsToUpload;
      v151[0] = _NSConcreteStackBlock;
      v151[1] = 3221225472LL;
      v151[2] = sub_100036340;
      v151[3] = &unk_10023F5F0;
      id v42 = v40;
      id v152 = v42;
      id v101 = -[NSMutableArray indexOfObjectWithOptions:passingTest:]( sharedCKRecordsToUpload,  "indexOfObjectWithOptions:passingTest:",  2LL,  v151);
      if (v101 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v102 = v101;
        if (!_CPLSilentLogging)
        {
          id v103 = sub_100032740();
          v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v158 = v42;
            _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEBUG,  "Removing shared master %@ from uploads as it will be moved later",  buf,  0xCu);
          }
        }

        -[NSMutableArray removeObjectAtIndex:](self->_sharedCKRecordsToUpload, "removeObjectAtIndex:", v102);
      }

      v105 = objc_alloc_init(&OBJC_CLASS___CPLCloudKitResourceCountAndSize);
      id v150 = 0LL;
      unsigned int v106 = [v94 prepareWithCKRecordBuilder:v139 resourceCountAndSize:v105 scopeProvider:self error:&v150];
      id v132 = v150;
      unsigned int v129 = v106;
      if (v106)
      {
        if (self->_metric)
        {
          if (sub_100031EF8((uint64_t)v105) || sub_100031F28((uint64_t)v105))
          {
            -[CPLCloudKitUploadMetric setItemCount:]( self->_metric,  "setItemCount:",  (char *)-[CPLCloudKitUploadMetric itemCount](self->_metric, "itemCount") + 1);
            -[CPLCloudKitUploadMetric setUploadSize:]( self->_metric,  "setUploadSize:",  (char *)-[CPLCloudKitUploadMetric uploadSize](self->_metric, "uploadSize") + sub_100031EF8((uint64_t)v105));
            -[CPLCloudKitUploadMetric setReferencedResourcesSize:]( self->_metric,  "setReferencedResourcesSize:",  (char *)-[CPLCloudKitUploadMetric referencedResourcesSize](self->_metric, "referencedResourcesSize")
            + sub_100031F28((uint64_t)v105));
            -[CPLCloudKitUploadMetric setReferencedResourcesCount:]( self->_metric,  "setReferencedResourcesCount:",  (char *)-[CPLCloudKitUploadMetric referencedResourcesCount](self->_metric, "referencedResourcesCount")
            + sub_100031F10((uint64_t)v105));
          }

          else
          {
            -[CPLCloudKitUploadMetric setOtherItemCount:]( self->_metric,  "setOtherItemCount:",  (char *)-[CPLCloudKitUploadMetric otherItemCount](self->_metric, "otherItemCount") + 1);
          }
        }

        if (!_CPLSilentLogging)
        {
          id v107 = sub_100032740();
          v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
          {
            v128 = v105;
            v109 = (void *)objc_claimAutoreleasedReturnValue([v136 recordID]);
            v127 = (CPLRecordChange *)-[CPLRecordChange recordClass](self->_currentRecordChange, "recordClass");
            v110 = (CPLRecordChange *)objc_claimAutoreleasedReturnValue( -[CPLRecordChange scopedIdentifier]( self->_currentRecordChange,  "scopedIdentifier"));
            *(_DWORD *)buf = 138543874;
            id v158 = v109;
            __int16 v159 = 2112;
            v160 = v127;
            __int16 v161 = 2112;
            v162 = v110;
            _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEFAULT,  "Will update %{public}@ (triggered by sharing <%@ %@>)",  buf,  0x20u);

            v105 = v128;
          }
        }

        -[CPLCKBatchUploadPlanner _noteMasterWillBeUploadedToPrivateZone:]( self,  "_noteMasterWillBeUploadedToPrivateZone:",  v42);
        ckRecordsToUpload = self->_ckRecordsToUpload;
        v112 = (char *)-[NSMutableArray count](ckRecordsToUpload, "count") - 1;
        v113 = ckRecordsToUpload;
        v114 = v136;
        -[NSMutableArray insertObject:atIndex:](v113, "insertObject:atIndex:", v136, v112);
        v115 = (os_log_s *)objc_claimAutoreleasedReturnValue([v136 recordID]);
        -[CPLCKBatchUploadPlanner _willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:]( self,  "_willUpdateCKRecordWithID:onBehalfOfRecordWithScopedIdentifier:",  v115,  v42);
      }

      else
      {
        v114 = v136;
        if (_CPLSilentLogging) {
          goto LABEL_98;
        }
        id v116 = sub_100032740();
        v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v116);
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v158 = v94;
          __int16 v159 = 2112;
          v160 = (CPLRecordChange *)v132;
          _os_log_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_ERROR,  "Failed to create CKRecord for %@: %@",  buf,  0x16u);
        }
      }

LABEL_98:
      if (v129)
      {

        goto LABEL_34;
      }

      goto LABEL_100;
    }
  }

  else
  {
    sub_10019059C(v94, a2, self);
  }

  uint64_t v125 = sub_1001904C8(v94, a2, self);
  return sub_1000361A4(v125);
}

- (BOOL)_shouldUpdateKeyOnSharedCKRecord:(id)a3
{
  id v5 = a3;
  if (!-[CPLCKRecordPropertyMapping isKeyReadOnly:recordClass:]( self->_propertyMapping,  "isKeyReadOnly:recordClass:",  v5,  -[CPLRecordChange recordClass](self->_currentRecordChange, "recordClass"))
    && self->_sharedZoneIdentification
    && -[CPLRecordTarget shouldUploadToOtherRecord]( self->_currentRecordTarget,  "shouldUploadToOtherRecord")
    && -[CPLCKRecordPropertyMapping shouldUpdateKeyOnSharedRecord:recordClass:]( self->_propertyMapping,  "shouldUpdateKeyOnSharedRecord:recordClass:",  v5,  -[CPLRecordChange recordClass](self->_currentRecordChange, "recordClass")))
  {
    if (!self->_sharedCKRecordToUpload)
    {
      currentRecordChange = self->_currentRecordChange;
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zone](self->_sharedZoneIdentification, "zone"));
      double v10 = CPLBaseSharedCKRecordFromCPLRecordChange(currentRecordChange, v9, self->_currentRecordTarget);
      int v11 = (CKRecord *)objc_claimAutoreleasedReturnValue(v10);
      sharedCKRecordToUpload = self->_sharedCKRecordToUpload;
      self->_sharedCKRecordToUpload = v11;

      __int16 v13 = -[CPLSimpleCKRecordBuilder initWithBaseCKRecord:scopeProvider:currentUserRecordID:targetMapping:]( objc_alloc(&OBJC_CLASS___CPLSimpleCKRecordBuilder),  "initWithBaseCKRecord:scopeProvider:currentUserRecordID:targetMapping:",  self->_sharedCKRecordToUpload,  self,  self->_currentUserRecordID,  self->_targetMapping);
      simpleBuilderForSharedCKRecord = self->_simpleBuilderForSharedCKRecord;
      self->_simpleBuilderForSharedCKRecord = v13;

      if (-[CPLRecordChange isMasterChange](self->_currentRecordChange, "isMasterChange"))
      {
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange scopedIdentifier](self->_currentRecordChange, "scopedIdentifier"));
        -[CPLCKBatchUploadPlanner _noteMasterWillBeUploadedToSharedZone:]( self,  "_noteMasterWillBeUploadedToSharedZone:",  v15);
      }

      recordModificationDate = self->_recordModificationDate;
      if (recordModificationDate) {
        -[CKRecord setObject:forKey:]( self->_sharedCKRecordToUpload,  "setObject:forKey:",  recordModificationDate,  @"recordModificationDate");
      }
      __int128 v17 = self->_sharedCKRecordToUpload;
      float v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange scopedIdentifier](self->_currentRecordChange, "scopedIdentifier"));
      -[CPLCKBatchUploadPlanner uploadSharedCKRecord:forScopedIdentifier:triggeringKey:]( self,  "uploadSharedCKRecord:forScopedIdentifier:triggeringKey:",  v17,  v18,  v5);

      if (self->_sharedZoneIdentification)
      {
        if (-[CPLRecordChange isAssetChange](self->_currentRecordChange, "isAssetChange"))
        {
          if (-[CPLRecordChange hasChangeType:](self->_currentRecordChange, "hasChangeType:", 2LL))
          {
            if (-[CPLRecordTarget shouldUploadToOtherRecord]( self->_currentRecordTarget,  "shouldUploadToOtherRecord"))
            {
              uint64_t v19 = objc_claimAutoreleasedReturnValue(-[CPLRecordChange relatedScopedIdentifier](self->_currentRecordChange, "relatedScopedIdentifier"));
              if (v19)
              {
                unsigned int v20 = (void *)v19;
                id v21 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v19));
                unsigned __int8 v22 = [v21 shouldUploadToOtherRecord];

                if ((v22 & 1) == 0)
                {
                  id v23 = self->_currentRecordChange;
                  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordChange masterScopedIdentifier](v23, "masterScopedIdentifier"));
                  if (v24
                    && (-[NSMutableSet containsObject:]( self->_mastersUploadedToPrivateZone,  "containsObject:",  v24) & 1) == 0)
                  {
                    -[CPLCKBatchUploadPlanner _noteRecordWithScopedIdentifierWillMoveToSplitState:]( self,  "_noteRecordWithScopedIdentifierWillMoveToSplitState:",  v24);
                    id v25 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v24));
                    if (!v25)
                    {
                      if (!_CPLSilentLogging)
                      {
                        id v27 = sub_100032740();
                        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
                        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          __int16 v32 = v24;
                          __int16 v33 = 2112;
                          __int16 v34 = v23;
                          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Missing target for %@ to upload %@",  buf,  0x16u);
                        }
                      }

                      id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSAssertionHandler currentHandler]( &OBJC_CLASS___NSAssertionHandler,  "currentHandler"));
                      int v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implem entations/CloudKit/CPLCKBatchUploadPlanner.m"));
                      [v29 handleFailureInMethod:a2, self, v30, 1107, @"Missing target for %@ to upload %@", v24, v23 object file lineNumber description];

                      abort();
                    }

                    __int16 v26 = v25;
                    if (([v25 shouldUploadToOtherRecord] & 1) == 0) {
                      -[CPLCKBatchUploadPlanner _copyPrivateMasterWithScopedIdentifier:masterTarget:uploadIndex:reason:]( self,  "_copyPrivateMasterWithScopedIdentifier:masterTarget:uploadIndex:reason:",  v24,  v26,  (char *)-[NSMutableArray count](self->_sharedCKRecordsToUpload, "count") - 1,  @"shared asset is pointing to direct master");
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    BOOL v6 = 1;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v22 = a3;
  id v8 = a4;
  double v9 = v8;
  if (self->_recordModificationDate
    || ![v8 isEqualToString:@"recordModificationDate"])
  {
    if (-[CPLCKBatchUploadPlanner _shouldUpdateKeyOnCKRecord:](self, "_shouldUpdateKeyOnCKRecord:", v9)) {
      -[CPLSimpleCKRecordBuilder setObject:forKey:](self->_simpleBuilder, "setObject:forKey:", v22, v9);
    }
    if (!-[CPLCKBatchUploadPlanner _shouldUpdateKeyOnSharedCKRecord:](self, "_shouldUpdateKeyOnSharedCKRecord:", v9)) {
      goto LABEL_16;
    }
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___CKAsset);
    char isKindOfClass = objc_opt_isKindOfClass(v22, v13);
    sharedCKRecordToUpload = self->_sharedCKRecordToUpload;
    if ((isKindOfClass & 1) == 0)
    {
      char v12 = sharedCKRecordToUpload;
LABEL_15:
      -[CKRecord setObject:forKey:](v12, "setObject:forKey:", v22, v9);
      goto LABEL_16;
    }

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v22 cplCopyCleanAsset]);
    -[CKRecord setObject:forKey:](sharedCKRecordToUpload, "setObject:forKey:", v16, v9);

LABEL_16:
    return;
  }

  if (!v22) {
    goto LABEL_16;
  }
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v22, v10) & 1) != 0)
  {
    objc_storeStrong((id *)&self->_recordModificationDate, a3);
    ckRecordToUpload = self->_ckRecordToUpload;
    if (ckRecordToUpload) {
      -[CKRecord setObject:forKey:](ckRecordToUpload, "setObject:forKey:", v22, v9);
    }
    char v12 = self->_sharedCKRecordToUpload;
    if (!v12) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  __int128 v17 = (CPLCKBatchUploadPlanner *)sub_100190930(v22, a2, self);
  -[CPLCKBatchUploadPlanner setEncryptedObject:forKey:validateClass:](v17, v18, v19, v20, v21);
}

- (void)setEncryptedObject:(id)a3 forKey:(id)a4 validateClass:(Class)a5
{
  id v9 = a3;
  id v8 = a4;
  if (-[CPLCKBatchUploadPlanner _shouldUpdateKeyOnCKRecord:](self, "_shouldUpdateKeyOnCKRecord:", v8)) {
    -[CPLSimpleCKRecordBuilder setEncryptedObject:forKey:validateClass:]( self->_simpleBuilder,  "setEncryptedObject:forKey:validateClass:",  v9,  v8,  a5);
  }
  if (-[CPLCKBatchUploadPlanner _shouldUpdateKeyOnSharedCKRecord:](self, "_shouldUpdateKeyOnSharedCKRecord:", v8)) {
    -[CKRecord cpl_setEncryptedObject:forKey:validateClass:]( self->_sharedCKRecordToUpload,  "cpl_setEncryptedObject:forKey:validateClass:",  v9,  v8,  a5);
  }
}

- (void)setLegacyEncryptedObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (-[CPLCKBatchUploadPlanner _shouldUpdateKeyOnCKRecord:](self, "_shouldUpdateKeyOnCKRecord:", v6)) {
    -[CPLSimpleCKRecordBuilder setLegacyEncryptedObject:forKey:]( self->_simpleBuilder,  "setLegacyEncryptedObject:forKey:",  v7,  v6);
  }
  if (-[CPLCKBatchUploadPlanner _shouldUpdateKeyOnSharedCKRecord:](self, "_shouldUpdateKeyOnSharedCKRecord:", v6)) {
    -[CKRecord cpl_setLegacyEncryptedObject:forKey:]( self->_sharedCKRecordToUpload,  "cpl_setLegacyEncryptedObject:forKey:",  v7,  v6);
  }
}

- (void)setCKAsset:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (-[CPLCKBatchUploadPlanner _shouldUpdateKeyOnCKRecord:](self, "_shouldUpdateKeyOnCKRecord:", v6))
  {
    -[CPLSimpleCKRecordBuilder setCKAsset:forKey:](self->_simpleBuilder, "setCKAsset:forKey:", v9, v6);
    if (-[CPLCKBatchUploadPlanner _shouldUpdateKeyOnSharedCKRecord:](self, "_shouldUpdateKeyOnSharedCKRecord:", v6))
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue([v9 cplCopyCleanAsset]);
LABEL_6:
      id v8 = v7;
      -[CKRecord setObject:forKey:](self->_sharedCKRecordToUpload, "setObject:forKey:", v7, v6);
    }
  }

  else if (-[CPLCKBatchUploadPlanner _shouldUpdateKeyOnSharedCKRecord:](self, "_shouldUpdateKeyOnSharedCKRecord:", v6))
  {
    id v7 = v9;
    goto LABEL_6;
  }
}

- (void)setCKReferenceWithScopedIdentifier:(id)a3 forKey:(id)a4 referenceAction:(unint64_t)a5
{
  id v15 = a3;
  id v8 = a4;
  if (-[CPLCKBatchUploadPlanner _shouldUpdateKeyOnCKRecord:](self, "_shouldUpdateKeyOnCKRecord:", v8)) {
    -[CPLSimpleCKRecordBuilder setCKReferenceWithScopedIdentifier:forKey:referenceAction:]( self->_simpleBuilder,  "setCKReferenceWithScopedIdentifier:forKey:referenceAction:",  v15,  v8,  a5);
  }
  if (-[CPLCKBatchUploadPlanner _shouldUpdateKeyOnSharedCKRecord:](self, "_shouldUpdateKeyOnSharedCKRecord:", v8))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v15));
    uint64_t v10 = v9;
    if (v9)
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 otherScopedIdentifier]);
      char v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    }

    else
    {
      char v12 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification recordIDWithRecordName:]( self->_sharedZoneIdentification,  "recordIDWithRecordName:",  v12));
    __int128 v14 = -[CKReference initWithRecordID:action:]( objc_alloc(&OBJC_CLASS___CKReference),  "initWithRecordID:action:",  v13,  a5);
    -[CKRecord setObject:forKey:](self->_sharedCKRecordToUpload, "setObject:forKey:", v14, v8);
  }
}

- (id)_recordIDFromScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCKBatchUploadPlanner cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v9));

  if (v10)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    a5 = (id *)objc_claimAutoreleasedReturnValue([v10 recordIDWithRecordName:v11]);

    *a4 = v10;
  }

  else if (a5)
  {
    char v12 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  2001LL,  @"Can't find CloudKit scope for %@",  v12));

    a5 = 0LL;
  }

  return a5;
}

- (id)recordIDForResourcesOfRecordWithScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5
{
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v9));
  if (v10)
  {
    int v11 = v10;
    char v12 = (void *)objc_claimAutoreleasedReturnValue([v10 resourceScopedIdentifier]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCKBatchUploadPlanner _recordIDFromScopedIdentifier:cloudKitScope:error:]( self,  "_recordIDFromScopedIdentifier:cloudKitScope:error:",  v12,  a4,  a5));

    return v13;
  }

  else
  {
    id v15 = (CPLCKBatchUploadPlanner *)sub_100190AFC(v9, a2, self);
    return -[CPLCKBatchUploadPlanner scopeProvider](v15, v16);
  }

- (CPLCloudKitScopeProvider)scopeProvider
{
  return self->_scopeProvider;
}

- (CPLCloudKitZoneIdentification)destinationZoneIdentification
{
  return self->_destinationZoneIdentification;
}

- (CPLCloudKitZoneIdentification)sharedZoneIdentification
{
  return self->_sharedZoneIdentification;
}

- (CPLCKRecordPropertyMapping)propertyMapping
{
  return self->_propertyMapping;
}

- (CKRecordID)currentUserRecordID
{
  return self->_currentUserRecordID;
}

- (CPLRecordTargetMapping)targetMapping
{
  return self->_targetMapping;
}

- (CPLCKRecordFetchCache)fetchCache
{
  return self->_fetchCache;
}

- (NSDate)cplEnabledDate
{
  return self->_cplEnabledDate;
}

- (void)setCplEnabledDate:(id)a3
{
}

- (CPLCloudKitUploadMetric)metric
{
  return self->_metric;
}

- (void)setMetric:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (CPLCKRecordRequestor)recordRequestor
{
  return self->_recordRequestor;
}

- (void)setRecordRequestor:(id)a3
{
}

- (NSArray)ckRecordsToUpload
{
  return &self->_ckRecordsToUpload->super;
}

- (NSArray)ckRecordIDsToDelete
{
  return &self->_ckRecordIDsToDelete->super;
}

- (NSArray)sharedCKRecordsToUpload
{
  return &self->_sharedCKRecordsToUpload->super;
}

- (NSArray)sharedCKRecordIDsToDelete
{
  return &self->_sharedCKRecordIDsToDelete->super;
}

- (double)totalDurationOfUpload
{
  return self->_totalDurationOfUpload;
}

- (CPLCKSharePlan)sharePlan
{
  return self->_sharePlan;
}

- (CPLCKUnsharePlan)unsharePlan
{
  return self->_unsharePlan;
}

- (void).cxx_destruct
{
}

@end