@interface CPLPrequeliteScopeStorage
+ (BOOL)_scopeType:(int64_t)a3 supportsClientSyncWithOptions:(unint64_t)a4;
+ (id)_supportedScopeTypesWithOptions:(unint64_t)a3;
- (BOOL)_addScope:(id)a3 error:(id *)a4;
- (BOOL)_createInitialPrimarySyncScope;
- (BOOL)_scopeTypeSupportsClientSync:(int64_t)a3 scopeIdentifier:(id)a4;
- (BOOL)_setScope:(id)a3 hasCompletedTaskItem:(int64_t)a4 task:(id)a5 error:(id *)a6;
- (BOOL)_setScope:(id)a3 hasTaskTodo:(id)a4 error:(id *)a5;
- (BOOL)_storeLibraryInfo:(id)a3 forScope:(id)a4 libraryInfoHasBeenUpdated:(BOOL *)a5 error:(id *)a6;
- (BOOL)_storeTransportGroup:(id)a3 inColumnVariable:(id)a4 forScope:(id)a5 error:(id *)a6;
- (BOOL)_storeValue:(id)a3 forColumnVariable:(id)a4 scope:(id)a5 error:(id *)a6;
- (BOOL)_transferValueFromVariable:(id)a3 type:(id)a4 ofStorage:(id)a5 toColumnVariable:(id)a6 transformer:(id)a7;
- (BOOL)allActiveScopesHasFinishedSyncs;
- (BOOL)bumpCloudIndexForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)bumpLocalIndexForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)bumpPullFromTransportExpirationIntervalWithError:(id *)a3;
- (BOOL)bumpStableIndexForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)commitSyncAnchorForScope:(id)a3 error:(id *)a4;
- (BOOL)deleteScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)didDropSomeRecordsForScope:(id)a3;
- (BOOL)discardStagedSyncAnchorForScope:(id)a3 error:(id *)a4;
- (BOOL)discardStagedSyncAnchorWithScopeFilter:(id)a3 error:(id *)a4;
- (BOOL)doScopesNeedMetadataSync:(id)a3;
- (BOOL)doesScopeNeedToBePulledByClient:(id)a3;
- (BOOL)doesScopeNeedToPullChangesFromTransport:(id)a3;
- (BOOL)doesScopeNeedToPushChangesToTransport:(id)a3;
- (BOOL)doesScopeNeedToUpdateTransport:(id)a3;
- (BOOL)doesScopeNeedToUploadComputeState:(id)a3;
- (BOOL)doesScopeSupportToBePulledByClient:(id)a3;
- (BOOL)fixStorageAfterAnyVersionChange;
- (BOOL)forceIdentifyUknownScopesWithError:(id *)a3;
- (BOOL)forcePushToTransportForActiveScopesWithError:(id *)a3;
- (BOOL)hasFinishedAFullSyncForScope:(id)a3;
- (BOOL)hasScopeFetchedInitialSyncAnchor:(id)a3;
- (BOOL)hasScopesNeedingToPullChangesFromTransport;
- (BOOL)hasScopesNeedingToPushChangesToTransport;
- (BOOL)hasScopesNeedingToPushHighPriorityChangesToTransport;
- (BOOL)hasScopesNeedingToUpdateTransport;
- (BOOL)hasScopesNeedingToUploadComputeState;
- (BOOL)hasStagedSyncAnchorForScope:(id)a3;
- (BOOL)hasStagedSyncAnchors;
- (BOOL)initializeStorage;
- (BOOL)openWithError:(id *)a3;
- (BOOL)resetSyncAnchorForScope:(id)a3 error:(id *)a4;
- (BOOL)resetSyncStateForScope:(id)a3 error:(id *)a4;
- (BOOL)setAllScopesHasChangesToPullFromTransportWithError:(id *)a3;
- (BOOL)setClassNameOfRecordsForInitialQuery:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setDeleteDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setDidDropSomeRecordsForScope:(id)a3 error:(id *)a4;
- (BOOL)setDisabledDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setHasFetchedInitialSyncAnchor:(BOOL)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setInitialDownloadDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setInitialSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setPullFromTransportExpirationInterval:(double)a3 scope:(id)a4 error:(id *)a5;
- (BOOL)setScope:(id)a3 hasCompletedClientNeedsToPullTask:(int64_t)a4 error:(id *)a5;
- (BOOL)setScope:(id)a3 hasCompletedPullFromTransportTask:(int64_t)a4 error:(id *)a5;
- (BOOL)setScope:(id)a3 hasCompletedPushToTransportTask:(int64_t)a4 error:(id *)a5;
- (BOOL)setScope:(id)a3 hasCompletedTransportUpdate:(int64_t)a4 error:(id *)a5;
- (BOOL)setScope:(id)a3 hasCompletedUploadComputeStateTask:(int64_t)a4 error:(id *)a5;
- (BOOL)setScopeHasChangesToPullFromTransport:(id)a3 error:(id *)a4;
- (BOOL)setScopeHasChangesToPushToTransport:(id)a3 error:(id *)a4;
- (BOOL)setScopeNeedsToBePulledByClient:(id)a3 error:(id *)a4;
- (BOOL)setScopeNeedsToUpdateTransport:(id)a3 error:(id *)a4;
- (BOOL)setScopeNeedsToUploadComputeState:(id)a3 error:(id *)a4;
- (BOOL)setScopeNeedsUpdateFromTransport:(id)a3 error:(id *)a4;
- (BOOL)setScopeType:(int64_t)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setTransportScope:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeActivationDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeBusyState:(int64_t)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeDownloadTransportGroup:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeEstimatedSize:(unint64_t)a3 estimatedAssetCount:(unint64_t)a4 forScope:(id)a5 error:(id *)a6;
- (BOOL)storeInitialMetadataDownloadDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeInitialMetadataQueriesDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeInitialMingleDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeLastDateOfClearedPushRepository:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeRewindSyncAnchors:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeScopeChange:(id)a3 forScope:(id)a4 scopeChangeHasBeenUpdated:(BOOL *)a5 error:(id *)a6;
- (BOOL)storeScopeListSyncAnchor:(id)a3 error:(id *)a4;
- (BOOL)storeSupervisorInfo:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeSupportedFeatureVersionInLastSync:(unint64_t)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeTransientSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeUploadTransportGroup:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)updateFlags:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)upgradeScopesWithNewLibraryOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteScopeStorage)initWithAbstractObject:(id)a3;
- (Class)_transportGroupClass;
- (double)_minimalPullFromTranportExpirationInterval;
- (id)_injectionForFilter:(id)a3;
- (id)_injectionForScopesAllowingPullFromTransport;
- (id)_libraryInfoForScope:(id)a3;
- (id)_librarySateForScope:(id)a3;
- (id)_scopeWithQuery:(id)a3;
- (id)_taskItemCompletionDateForScope:(id)a3 task:(id)a4;
- (id)_transportGroupForColumnVariable:(id)a3 forScope:(id)a4;
- (id)_valueForColumnVariable:(id)a3 scope:(id)a4;
- (id)activationDateForScope:(id)a3;
- (id)addScopeWithIdentifier:(id)a3 scopeType:(int64_t)a4 error:(id *)a5;
- (id)classNameOfRecordsForInitialQueryForScope:(id)a3;
- (id)creationDateForScope:(id)a3;
- (id)deleteDateForScope:(id)a3;
- (id)disabledDateForScope:(id)a3;
- (id)downloadTransportGroupForScope:(id)a3;
- (id)enumeratorForDeletedStagedScopes;
- (id)enumeratorForScopesIncludeInactive:(BOOL)a3;
- (id)enumeratorForScopesNeedingToBePulledByClientWithMaximumCount:(unint64_t)a3;
- (id)enumeratorForScopesNeedingToPullChangesFromTransport;
- (id)enumeratorForScopesNeedingToPushChangesToTransport;
- (id)enumeratorForScopesNeedingToPushHighPriorityChangesToTransport;
- (id)enumeratorForScopesNeedingToUpdateTransport;
- (id)enumeratorForScopesNeedingToUploadComputeState;
- (id)enumeratorForScopesNeedingUpdateFromTransport;
- (id)enumeratorForScopesWithMingling;
- (id)filterForExcludedScopeIdentifiers:(id)a3;
- (id)filterForIncludedScopeIdentifiers:(id)a3;
- (id)flagsForScope:(id)a3;
- (id)initialDownloadDateForScope:(id)a3;
- (id)initialMetadataDownloadDateForScope:(id)a3;
- (id)initialMetadataQueriesDateForScope:(id)a3;
- (id)initialMingleDateForScope:(id)a3;
- (id)initialSyncAnchorForScope:(id)a3;
- (id)initialSyncDateForScope:(id)a3;
- (id)lastDateOfClearedPushRepositoryForScope:(id)a3;
- (id)lastDateOfCompletedPullFromTransportForScope:(id)a3;
- (id)lastScopeChangeUpdateDateForScope:(id)a3;
- (id)primaryScope;
- (id)recordsDesignation;
- (id)rewindSyncAnchorsForScope:(id)a3;
- (id)scopeChangeForScope:(id)a3;
- (id)scopeListSyncAnchor;
- (id)scopeWithCloudIndex:(int64_t)a3;
- (id)scopeWithIdentifier:(id)a3;
- (id)scopeWithLocalIndex:(int64_t)a3;
- (id)scopeWithStableIndex:(int64_t)a3;
- (id)stagingScopeForScope:(id)a3;
- (id)statusDictionary;
- (id)supervisorInfoForScope:(id)a3;
- (id)syncAnchorForScope:(id)a3 isCommitted:(BOOL *)a4;
- (id)transientSyncAnchorForScope:(id)a3;
- (id)transportScopeForScope:(id)a3;
- (id)uploadTransportGroupForScope:(id)a3;
- (id)validCloudIndexes;
- (id)validLocalIndexes;
- (int64_t)_bumpIndexWithError:(id *)a3;
- (int64_t)_taskItemForScope:(id)a3 task:(id)a4;
- (int64_t)busyStateForScope:(id)a3;
- (int64_t)clientNeedsToPullTaskForScope:(id)a3;
- (int64_t)pullFromTransportTaskForScope:(id)a3;
- (int64_t)pushToTransportTaskForScope:(id)a3;
- (int64_t)transportUpdateTaskForScope:(id)a3;
- (int64_t)uploadComputeStateTaskForScope:(id)a3;
- (unint64_t)estimatedAssetCountForScope:(id)a3;
- (unint64_t)estimatedSizeForScope:(id)a3;
- (unint64_t)supportedFeatureVersionInLastSyncForScope:(id)a3;
- (void)_cacheValue:(id)a3 forColumnVariable:(id)a4 scope:(id)a5;
- (void)_discardCachedValuesForGroup:(id)a3;
- (void)_fillScopeTypeOrder:(int64_t)a3[7] withOrderOfScopeTypes:(id)a4 name:(id)a5;
- (void)_getLocalIndexes:(id *)a3 cloudIndexes:(id *)a4 forScopeIdentifiers:(id)a5;
- (void)_markFirstSyncOfPrimaryAsSuccessfulWithScope:(id)a3;
- (void)_noteEndOfResetIfNecessary;
- (void)_updateStatusForMainScopeChange:(id)a3;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLPrequeliteScopeStorage

+ (BOOL)_scopeType:(int64_t)a3 supportsClientSyncWithOptions:(unint64_t)a4
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  id v6 = sub_100140A0C();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100140A4C;
  v9[3] = &unk_100247078;
  v9[5] = a3;
  v9[6] = a4;
  v9[4] = &v10;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];

  LOBYTE(v7) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v7;
}

+ (id)_supportedScopeTypesWithOptions:(unint64_t)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  id v5 = sub_100140A0C();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100140B64;
  v9[3] = &unk_1002470A0;
  unint64_t v11 = a3;
  v7 = v4;
  uint64_t v10 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

- (CPLPrequeliteScopeStorage)initWithAbstractObject:(id)a3
{
  v87.receiver = self;
  v87.super_class = (Class)&OBJC_CLASS___CPLPrequeliteScopeStorage;
  v3 = -[CPLPrequeliteStorage initWithAbstractObject:](&v87, "initWithAbstractObject:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 variableWithName:@"nextIndex" defaultValue:&off_10025A290 type:v4]);
    id v6 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 variableWithName:@"scopeListSyncAnchor" type:v7]);
    v9 = *(void **)(v3 + 44);
    *(void *)(v3 + 44) = v8;

    uint64_t v10 = objc_alloc_init(&OBJC_CLASS____CPLPrequeliteScopeBase);
    unint64_t v11 = *(void **)(v3 + 60);
    *(void *)(v3 + 60) = v10;

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"flags",  &off_10025A290,  v12));
    v14 = *(void **)(v3 + 68);
    *(void *)(v3 + 68) = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dateType](&OBJC_CLASS___CPLPrequeliteType, "dateType"));
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"disabledDate",  0LL,  v15));
    v17 = *(void **)(v3 + 76);
    *(void *)(v3 + 76) = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dateType](&OBJC_CLASS___CPLPrequeliteType, "dateType"));
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"deleteDate",  0LL,  v18));
    v20 = *(void **)(v3 + 84);
    *(void *)(v3 + 84) = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"libraryInfo",  0LL,  v21));
    v23 = *(void **)(v3 + 92);
    *(void *)(v3 + 92) = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"scopeChange",  0LL,  v24));
    v26 = *(void **)(v3 + 100);
    *(void *)(v3 + 100) = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dateType](&OBJC_CLASS___CPLPrequeliteType, "dateType"));
    uint64_t v28 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"lastLibraryInfoUpdate",  0LL,  v27));
    v29 = *(void **)(v3 + 108);
    *(void *)(v3 + 108) = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
    uint64_t v31 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"transportScope",  0LL,  v30));
    v32 = *(void **)(v3 + 116);
    *(void *)(v3 + 116) = v31;

    v33 = objc_alloc_init(&OBJC_CLASS____CPLPrequeliteScopeSyncState);
    v34 = *(void **)(v3 + 124);
    *(void *)(v3 + 124) = v33;

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v36 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"estimatedSize",  0LL,  v35));
    v37 = *(void **)(v3 + 132);
    *(void *)(v3 + 132) = v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v39 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"estimatedAssetCount",  0LL,  v38));
    v40 = *(void **)(v3 + 140);
    *(void *)(v3 + 140) = v39;

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dateType](&OBJC_CLASS___CPLPrequeliteType, "dateType"));
    uint64_t v42 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"initialSyncDate",  0LL,  v41));
    v43 = *(void **)(v3 + 148);
    *(void *)(v3 + 148) = v42;

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dateType](&OBJC_CLASS___CPLPrequeliteType, "dateType"));
    uint64_t v45 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"initialDownloadDate",  0LL,  v44));
    v46 = *(void **)(v3 + 156);
    *(void *)(v3 + 156) = v45;

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dateType](&OBJC_CLASS___CPLPrequeliteType, "dateType"));
    uint64_t v48 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"activationDate",  0LL,  v47));
    v49 = *(void **)(v3 + 164);
    *(void *)(v3 + 164) = v48;

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dateType](&OBJC_CLASS___CPLPrequeliteType, "dateType"));
    uint64_t v51 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"initialMetadataQueriesDate",  0LL,  v50));
    v52 = *(void **)(v3 + 180);
    *(void *)(v3 + 180) = v51;

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dateType](&OBJC_CLASS___CPLPrequeliteType, "dateType"));
    uint64_t v54 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"initialMetadataDownloadDate",  0LL,  v53));
    v55 = *(void **)(v3 + 172);
    *(void *)(v3 + 172) = v54;

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dateType](&OBJC_CLASS___CPLPrequeliteType, "dateType"));
    uint64_t v57 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"initialMingleDate",  0LL,  v56));
    v58 = *(void **)(v3 + 188);
    *(void *)(v3 + 188) = v57;

    v59 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
    uint64_t v60 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"supervisorInfo",  0LL,  v59));
    v61 = *(void **)(v3 + 196);
    *(void *)(v3 + 196) = v60;

    [*(id *)(v3 + 196) setShouldNotCacheValue:1];
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType stringType](&OBJC_CLASS___CPLPrequeliteType, "stringType"));
    uint64_t v63 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  @"stagedScopeIdentifier",  0LL,  v62));
    v64 = *(void **)(v3 + 244);
    *(void *)(v3 + 244) = v63;

    uint64_t v65 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteTodoVar todoVariableWithName:]( &OBJC_CLASS___CPLPrequeliteTodoVar,  "todoVariableWithName:",  @"pushToTransport"));
    v66 = *(void **)(v3 + 204);
    *(void *)(v3 + 204) = v65;

    uint64_t v67 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteTodoVar todoVariableWithName:defaultExpirationInterval:]( &OBJC_CLASS___CPLPrequeliteTodoVar,  "todoVariableWithName:defaultExpirationInterval:",  @"pullFromTransport",  600.0));
    v68 = *(void **)(v3 + 212);
    *(void *)(v3 + 212) = v67;

    uint64_t v69 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteTodoVar todoVariableWithName:]( &OBJC_CLASS___CPLPrequeliteTodoVar,  "todoVariableWithName:",  @"clientNeedsToPull"));
    v70 = *(void **)(v3 + 220);
    *(void *)(v3 + 220) = v69;

    uint64_t v71 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteTodoVar todoVariableWithName:]( &OBJC_CLASS___CPLPrequeliteTodoVar,  "todoVariableWithName:",  @"updateTransport"));
    v72 = *(void **)(v3 + 228);
    *(void *)(v3 + 228) = v71;

    uint64_t v73 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteTodoVar todoVariableWithName:]( &OBJC_CLASS___CPLPrequeliteTodoVar,  "todoVariableWithName:",  @"computeState"));
    v74 = *(void **)(v3 + 236);
    *(void *)(v3 + 236) = v73;

    v89[0] = *(void *)(v3 + 60);
    v89[1] = *(void *)(v3 + 68);
    v89[2] = *(void *)(v3 + 76);
    v89[3] = *(void *)(v3 + 84);
    v89[4] = *(void *)(v3 + 92);
    v89[5] = *(void *)(v3 + 100);
    v89[6] = *(void *)(v3 + 108);
    v89[7] = *(void *)(v3 + 116);
    v89[8] = *(void *)(v3 + 124);
    v89[9] = *(void *)(v3 + 132);
    v89[10] = *(void *)(v3 + 140);
    v89[11] = *(void *)(v3 + 148);
    v89[12] = *(void *)(v3 + 156);
    v89[13] = *(void *)(v3 + 164);
    v89[14] = *(void *)(v3 + 180);
    v89[15] = *(void *)(v3 + 172);
    v89[16] = *(void *)(v3 + 188);
    v89[17] = *(void *)(v3 + 196);
    v89[18] = *(void *)(v3 + 204);
    v89[19] = *(void *)(v3 + 212);
    v89[20] = *(void *)(v3 + 220);
    v89[21] = *(void *)(v3 + 228);
    v89[22] = *(void *)(v3 + 236);
    v89[23] = *(void *)(v3 + 244);
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v89, 24LL));
    uint64_t v76 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariableGroup variableGroupWithVariablesAndGroups:]( &OBJC_CLASS___CPLPrequeliteVariableGroup,  "variableGroupWithVariablesAndGroups:",  v75));
    v77 = *(void **)(v3 + 252);
    *(void *)(v3 + 252) = v76;

    v88[0] = *(void *)(v3 + 68);
    v88[1] = *(void *)(v3 + 76);
    v88[2] = *(void *)(v3 + 84);
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v88, 3LL));
    uint64_t v79 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariableGroup variableGroupWithVariables:]( &OBJC_CLASS___CPLPrequeliteVariableGroup,  "variableGroupWithVariables:",  v78));
    v80 = *(void **)(v3 + 260);
    *(void *)(v3 + 260) = v79;

    v81 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v82 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteSynthesizedVariable,  "variableWithName:type:",  @"hasStagedSyncAnchors",  v81));
    v83 = *(void **)(v3 + 292);
    *(void *)(v3 + 292) = v82;

    v84 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v85 = *(void **)(v3 + 52);
    *(void *)(v3 + 52) = v84;
  }

  return (CPLPrequeliteScopeStorage *)v3;
}

- (BOOL)_scopeTypeSupportsClientSync:(int64_t)a3 scopeIdentifier:(id)a4
{
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v9 = [v8 libraryOptions];

  unsigned int v10 = [(id)objc_opt_class(self) _scopeType:a3 supportsClientSyncWithOptions:v9];
  if (v10)
  {
    if ((v9 & 2) == 0)
    {
      LOBYTE(v10) = 1;
      if ((unint64_t)a3 <= 7)
      {
        if (((1LL << a3) & 0x30) != 0)
        {
          unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage abstractObject](self, "abstractObject"));
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mainScopeIdentifier]);
          uint64_t v14 = CPLSharingScopePrefixForScopeWithIdentifier(v12, v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          LOBYTE(v10) = [v7 hasPrefix:v15];

LABEL_8:
          goto LABEL_9;
        }

        if (a3 == 1)
        {
          unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage abstractObject](self, "abstractObject"));
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mainScopeIdentifier]);
          LOBYTE(v10) = [v7 isEqualToString:v12];
          goto LABEL_8;
        }

        if (((1LL << a3) & 0xC1) != 0) {
          sub_100199558(a3, (uint64_t)a2, (uint64_t)self);
        }
      }
    }
  }

- (double)_minimalPullFromTranportExpirationInterval
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  BOOL v3 = [v2 libraryOptions] == 0;

  return dbl_100219BC0[v3];
}

- (BOOL)_addScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

  id v8 = [v6 scopeType];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
  if (-[CPLPrequeliteScopeStorage _scopeTypeSupportsClientSync:scopeIdentifier:]( self,  "_scopeTypeSupportsClientSync:scopeIdentifier:",  v8,  v9))
  {
    uint64_t v10 = 0x10000LL;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  -[CPLPrequeliteScopeStorage _minimalPullFromTranportExpirationInterval]( self,  "_minimalPullFromTranportExpirationInterval");
  double v12 = v11;
  if (!_CPLSilentLogging)
  {
    id v13 = sub_100140908();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[CPLEngineScopeFlagsUpdate descriptionForFlags:]( &OBJC_CLASS___CPLEngineScopeFlagsUpdate,  "descriptionForFlags:",  v10));
      *(_DWORD *)buf = 138412546;
      id v43 = v6;
      __int16 v44 = 2114;
      uint64_t v45 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Creating record for %@ with flags %{public}@",  buf,  0x16u);
    }
  }

  v34 = a4;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) namesInjection]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) featureVersionVar]);
  uint64_t v19 = *(uint64_t *)((char *)&self->_base + 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_pushToTransportTodoVar + 4) expirationIntervalVar]);
  v35 = v6;
  v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) injectionForValues:v6]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) featureVersionVar]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 bindableValueForDefaultValue]);
  unsigned __int8 v24 = [v36 cplExecute:@"INSERT INTO %@ (%@, %@, %@, %@) VALUES (%@, %@, %ld, %lu)", v16, v17, v18, v19, v20, v21, v23, v10, (unint64_t)v12];

  if ((v24 & 1) != 0)
  {
    uint64_t v25 = v35;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v35 scopeIdentifier]);
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_stagedScopeIdentifierVar + 4) variables]);
    id v28 = [v27 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v38;
      do
      {
        for (i = 0LL; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        }

        id v29 = [v27 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }

      while (v29);
    }
  }

  else
  {
    uint64_t v25 = v35;
    if (v34) {
      id *v34 = (id)objc_claimAutoreleasedReturnValue([v36 lastError]);
    }
  }

  return v24;
}

- (BOOL)_createInitialPrimarySyncScope
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 libraryCreationDate]);
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  id v7 = v6;

  id v8 = objc_alloc(&OBJC_CLASS___CPLEngineScope);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainScopeIdentifier](self, "mainScopeIdentifier"));
  uint64_t v10 = -[CPLEngineScope initWithScopeIdentifier:scopeType:](v8, "initWithScopeIdentifier:scopeType:", v9, 1LL);

  -[CPLEngineScope setCreationDate:](v10, "setCreationDate:", v7);
  -[CPLEngineScope setLocalIndex:](v10, "setLocalIndex:", 1LL);
  -[CPLEngineScope setCloudIndex:](v10, "setCloudIndex:", 2LL);
  -[CPLEngineScope setStableIndex:](v10, "setStableIndex:", 3LL);
  if (-[CPLPrequeliteScopeStorage _addScope:error:](self, "_addScope:error:", v10, 0LL)) {
    BOOL v11 = -[CPLPrequeliteStorage setValue:forVariable:error:]( self,  "setValue:forVariable:error:",  &off_10025A2A8,  *(void *)(&self->super._shouldUpgradeSchema + 1),  0LL);
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)initializeStorage
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CPLPrequeliteScopeStorage;
  if (-[CPLPrequeliteStorage initializeStorage](&v13, "initializeStorage")
    && -[CPLPrequeliteStorage createMainTableWithColumnVariables:error:]( self,  "createMainTableWithColumnVariables:error:",  *(CPLPrequeliteVariable **)((char *)&self->_stagedScopeIdentifierVar + 4),  0LL)
    && -[CPLPrequeliteStorage createVariable:defaultValue:error:]( self,  "createVariable:defaultValue:error:",  *(void *)(&self->super._shouldUpgradeSchema + 1),  &off_10025A290,  0LL)
    && -[CPLPrequeliteStorage createVariable:defaultValue:error:]( self,  "createVariable:defaultValue:error:",  *(CPLPrequeliteVariable **)((char *)&self->_nextIndexVar + 4),  0LL,  0LL)
    && (BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar]),
        unsigned int v4 = -[CPLPrequeliteStorage createIndexOnColumnVariable:error:]( self,  "createIndexOnColumnVariable:error:",  v3,  0LL),  v3,  v4))
  {
    BOOL v5 = -[CPLPrequeliteStorage createIndexOnColumnVariable:error:]( self,  "createIndexOnColumnVariable:error:",  *(CPLPrequeliteTodoVar **)((char *)&self->_uploadComputeStateTodoVar + 4),  0LL);
  }

  else
  {
    BOOL v5 = 0;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage abstractObject](self, "abstractObject"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 engineStore]);
  unsigned __int8 v8 = [v7 libraryOptions];

  if ((v8 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_100140908();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v12 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Automatically creating PrimarySync scope",  v12,  2u);
      }
    }

    return -[CPLPrequeliteScopeStorage _createInitialPrimarySyncScope](self, "_createInitialPrimarySyncScope");
  }

  return v5;
}

- (BOOL)_transferValueFromVariable:(id)a3 type:(id)a4 ofStorage:(id)a5 toColumnVariable:(id)a6 transformer:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (uint64_t (**)(id, void *))a7;
  v17 = objc_autoreleasePoolPush();
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned int v19 = -[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema");
  v20 = (void *)objc_claimAutoreleasedReturnValue([v18 pqlConnection]);
  if (!v19 || -[CPLPrequeliteStorage addColumnVariable:error:](self, "addColumnVariable:error:", v15, 0LL))
  {
    if (v14)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v14 variableWithName:v12 type:v13]);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForVariable:v21]);
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  v12,  v13));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v18 valueForGlobalVariable:v21]);
    }

    uint64_t v60 = v22;
    if (v16)
    {
      uint64_t v23 = v16[2](v16, v22);
      id v24 = (id)objc_claimAutoreleasedReturnValue(v23);
    }

    else
    {
      id v24 = v22;
    }

    id v59 = v24;
    if (v24)
    {
      v56 = v17;
      uint64_t v57 = v21;
      uint64_t v25 = v16;
      id v55 = v14;
      v26 = v18;
      id v27 = v13;
      id v28 = v12;
      id v29 = v24;
      uint64_t v30 = v20;
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar]);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainScopeIdentifier](self, "mainScopeIdentifier"));
      id v54 = v29;
      v34 = v15;
      unsigned int v35 = [v30 cplExecute:@"UPDATE %@ SET %@ = %@ WHERE %@ = %@", v31, v15, v54, v32, v33];

      if (v35)
      {
        id v12 = v28;
        v20 = v30;
        id v13 = v27;
        if ((uint64_t)[v30 changes] < 1)
        {
          id v15 = v34;
          uint64_t v16 = v25;
          if (!_CPLSilentLogging)
          {
            id v50 = sub_100140908();
            __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
            v17 = v56;
            v21 = v57;
            v18 = v26;
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v51 = v20;
              v52 = (void *)objc_claimAutoreleasedReturnValue([v57 variableName]);
              *(_DWORD *)buf = 138412546;
              uint64_t v62 = (uint64_t)v52;
              __int16 v63 = 2112;
              v64 = v60;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Discarded value of global %@ (%@) - no changes were applied",  buf,  0x16u);

              v20 = v51;
            }

            goto LABEL_30;
          }
        }

        else
        {
          id v15 = v34;
          uint64_t v16 = v25;
          if (!_CPLSilentLogging)
          {
            id v36 = sub_100140908();
            __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            v18 = v26;
            v21 = v57;
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              __int128 v38 = v20;
              __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v57 variableName]);
              __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v34 variableName]);
              *(_DWORD *)buf = 138413058;
              uint64_t v62 = (uint64_t)v39;
              __int16 v63 = 2112;
              v64 = v60;
              __int16 v65 = 2112;
              id v66 = v59;
              __int16 v67 = 2112;
              v68 = v40;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Transferred value of global %@ (%@) to column %@ (%@) in scope storage",  buf,  0x2Au);

              id v15 = v34;
              v20 = v38;
            }

            v17 = v56;
LABEL_30:
            id v14 = v55;
            goto LABEL_31;
          }
        }

        BOOL v47 = 1;
        v18 = v26;
        id v14 = v55;
        v17 = v56;
      }

      else
      {
        BOOL v47 = 0;
        id v12 = v28;
        id v13 = v27;
        id v15 = v34;
        v18 = v26;
        id v14 = v55;
        v17 = v56;
        v20 = v30;
        uint64_t v16 = v25;
      }

      v21 = v57;
LABEL_33:
      id v24 = v59;
LABEL_34:

      goto LABEL_35;
    }

    if (v60)
    {
      if (_CPLSilentLogging)
      {
        BOOL v47 = 1;
        goto LABEL_34;
      }

      id v41 = sub_100140908();
      __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      uint64_t v42 = objc_claimAutoreleasedReturnValue([v21 variableName]);
      v58 = v21;
      id v43 = v16;
      __int16 v44 = v20;
      uint64_t v45 = (void *)v42;
      *(_DWORD *)buf = 138412546;
      uint64_t v62 = v42;
      __int16 v63 = 2112;
      v64 = v60;
      v46 = "Discarded value of global %@ (%@)";
    }

    else
    {
      if (_CPLSilentLogging)
      {
LABEL_32:
        BOOL v47 = 1;
        goto LABEL_33;
      }

      id v48 = sub_100140908();
      __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
LABEL_31:

        goto LABEL_32;
      }

      uint64_t v49 = objc_claimAutoreleasedReturnValue([v21 variableName]);
      v58 = v21;
      id v43 = v16;
      __int16 v44 = v20;
      uint64_t v45 = (void *)v49;
      *(_DWORD *)buf = 138412546;
      uint64_t v62 = v49;
      __int16 v63 = 2112;
      v64 = 0LL;
      v46 = "No value for global %@ (%@)";
    }

    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v46, buf, 0x16u);

    v20 = v44;
    uint64_t v16 = v43;
    v21 = v58;
    goto LABEL_31;
  }

  BOOL v47 = 0;
LABEL_35:

  objc_autoreleasePoolPop(v17);
  return v47;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  LOBYTE(v4) = 1;
  switch(a3)
  {
    case '(':
      return -[CPLPrequeliteStorage createStorage](self, "createStorage");
    case ')':
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 abstractObject]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 transientPullRepository]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) transientSyncAnchorVar]);
      unsigned int v17 = -[CPLPrequeliteScopeStorage _transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:]( self,  "_transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:",  @"syncAnchor",  v14,  v15,  v16,  &stru_1002470E0);

      if (!v17) {
        goto LABEL_129;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudCache]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar]);
      unsigned int v21 = -[CPLPrequeliteScopeStorage _transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:]( self,  "_transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:",  @"syncAnchor",  v18,  v19,  v20,  &stru_100247100);

      if (!v21) {
        goto LABEL_129;
      }
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudCache]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar]);
      unsigned int v25 = -[CPLPrequeliteScopeStorage _transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:]( self,  "_transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:",  @"stagedSyncAnchor",  v22,  v23,  v24,  &stru_100247120);

      if (!v25) {
        goto LABEL_129;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudCache]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) initialSyncAnchorVar]);
      unsigned int v29 = -[CPLPrequeliteScopeStorage _transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:]( self,  "_transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:",  @"initialSyncAnchor",  v26,  v27,  v28,  &stru_100247140);

      if (!v29) {
        goto LABEL_129;
      }
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType stringType](&OBJC_CLASS___CPLPrequeliteType, "stringType"));
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudCache]);
      v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) classForInitialQueryVar]);
      unsigned int v33 = -[CPLPrequeliteScopeStorage _transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:]( self,  "_transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:",  @"classForInitialQuery",  v30,  v31,  v32,  &stru_100247160);

      if (!v33) {
        goto LABEL_129;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
      unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudCache]);
      id v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) uploadTransportGroupVar]);
      unsigned int v37 = -[CPLPrequeliteScopeStorage _transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:]( self,  "_transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:",  @"uploadTransportGroup",  v34,  v35,  v36,  &stru_100247180);

      if (!v37) {
        goto LABEL_129;
      }
      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dataType](&OBJC_CLASS___CPLPrequeliteType, "dataType"));
      __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudCache]);
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) downloadTransportGroupVar]);
      unsigned int v41 = -[CPLPrequeliteScopeStorage _transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:]( self,  "_transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:",  @"downloadTransportGroup",  v38,  v39,  v40,  &stru_1002471A0);

      if (!v41) {
        goto LABEL_129;
      }
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v11 clientCache]);
      unsigned int v44 = -[CPLPrequeliteScopeStorage _transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:]( self,  "_transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:",  @"estimatedLocalLibrarySize",  v42,  v43,  *(_CPLPrequeliteScopeSyncState **)((char *)&self->_syncState + 4),  &stru_1002471C0);

      if (!v44) {
        goto LABEL_129;
      }
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
      v46 = (void *)objc_claimAutoreleasedReturnValue([v11 clientCache]);
      unsigned int v47 = -[CPLPrequeliteScopeStorage _transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:]( self,  "_transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:",  @"estimatedLocalLibraryAssetCount",  v45,  v46,  *(CPLPrequeliteVariable **)((char *)&self->_estimatedSizeVar + 4),  &stru_1002471E0);

      if (!v47) {
        goto LABEL_129;
      }
      if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
      {
        id v48 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
        uint64_t v49 = *(CPLPrequeliteVariable **)((char *)&self->_estimatedAssetCountVar + 4);
        id v50 = (void *)objc_claimAutoreleasedReturnValue([v49 columnDefinition]);
        LODWORD(v49) = [v12 cplExecute:@"ALTER TABLE %@ ADD COLUMN %@ %@ DEFAULT NULL", v48, v49, v50];

        if (!(_DWORD)v49) {
          goto LABEL_129;
        }
      }

      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage engineLibrary](self, "engineLibrary"));
      v52 = (void *)objc_claimAutoreleasedReturnValue([v51 initialSyncDate]);

      if (!v52) {
        goto LABEL_127;
      }
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      uint64_t v54 = *(uint64_t *)((char *)&self->_estimatedAssetCountVar + 4);
      v118 = v52;
      [v52 timeIntervalSinceReferenceDate];
      uint64_t v56 = v55;
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar]);
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainScopeIdentifier](self, "mainScopeIdentifier"));
      unsigned int v4 = [v12 cplExecute:@"UPDATE %@ SET %@ = %f WHERE %@ = %@", v53, v54, v56, v57, v58];

      if (!v4)
      {

        goto LABEL_130;
      }

      if ((uint64_t)[v12 changes] < 1)
      {
        v52 = v118;
        if (_CPLSilentLogging) {
          goto LABEL_127;
        }
        id v110 = sub_100140908();
        uint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "Discarded initial sync date - no changes were applied",  buf,  2u);
        }
      }

      else
      {
        v52 = v118;
        if (_CPLSilentLogging) {
          goto LABEL_127;
        }
        id v59 = sub_100140908();
        uint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(+[CPLDateFormatter stringFromDate:](&OBJC_CLASS___CPLDateFormatter, "stringFromDate:", v118));
          *(_DWORD *)buf = 138412290;
          v127 = v61;
          _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "Set initial sync date to %@ in scope storage",  buf,  0xCu);
        }
      }

      v52 = v118;
LABEL_127:

      v111 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType stringType](&OBJC_CLASS___CPLPrequeliteType, "stringType"));
      uint64_t v112 = *(uint64_t *)((char *)&self->_lastLibraryInfoUpdateVar + 4);
      v124[0] = _NSConcreteStackBlock;
      v124[1] = 3221225472LL;
      v124[2] = sub_100143660;
      v124[3] = &unk_100247208;
      id v125 = v13;
      LODWORD(v112) = -[CPLPrequeliteScopeStorage _transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:]( self,  "_transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:",  @"zoneName",  v111,  0LL,  v112,  v124);

      if ((_DWORD)v112)
      {
        v113 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
        v114 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) featureVersionVar]);
        LOBYTE(v4) = -[CPLPrequeliteScopeStorage _transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:]( self,  "_transferValueFromVariable:type:ofStorage:toColumnVariable:transformer:",  @"featureVersion",  v113,  0LL,  v114,  &stru_100247228);

        goto LABEL_130;
      }

- (BOOL)upgradeScopesWithNewLibraryOptions:(unint64_t)a3 error:(id *)a4
{
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x2020000000LL;
  BOOL v4 = 1;
  char v54 = 1;
  if (a3)
  {
    __int16 v6 = a3;
    id v8 = [(id)objc_opt_class(self) _supportedScopeTypesWithOptions:a3];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    [*(id *)((char *)&self->_base + 4) discardCachedValue];
    uint64_t v47 = 0LL;
    id v48 = &v47;
    uint64_t v49 = 0x2020000000LL;
    uint64_t v50 = 0LL;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_100143BB0;
    v42[3] = &unk_100247250;
    uint64_t v45 = &v51;
    id v12 = v11;
    id v43 = v12;
    unsigned int v44 = self;
    v46 = &v47;
    [v9 enumerateIndexesUsingBlock:v42];
    if (*((_BYTE *)v52 + 24))
    {
      if (v48[3] >= 1 && !_CPLSilentLogging)
      {
        id v13 = sub_100140908();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = v48[3];
          *(_DWORD *)buf = 134217984;
          uint64_t v57 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Automatically set %lld scopes to sync with client",  buf,  0xCu);
        }
      }
    }

    else if (a4)
    {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v12 lastCPLError]);
    }

    if (*((_BYTE *)v52 + 24))
    {
      unsigned __int8 v16 = -[CPLPrequeliteScopeStorage bumpPullFromTransportExpirationIntervalWithError:]( self,  "bumpPullFromTransportExpirationIntervalWithError:",  a4);
      *((_BYTE *)v52 + 24) = v16;
      char v17 = (v6 & 0x400) != 0 ? v16 ^ 1 : 1;
      if ((v17 & 1) == 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
        unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pqlConnection]);

        v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) namesInjection]);
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
        id v22 = [v19 cplFetch:@"SELECT %@ FROM %@ WHERE (%@ & %ld) = %ld", v20, v21, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 65552, 65552];
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472LL;
        v41[2] = sub_100143C98;
        v41[3] = &unk_100247278;
        v41[4] = self;
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 enumerateObjects:v41]);

        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        id v24 = v23;
        id v25 = [v24 countByEnumeratingWithState:&v37 objects:v55 count:16];
        id v36 = v9;
        if (v25)
        {
          uint64_t v26 = 0LL;
          uint64_t v27 = *(void *)v38;
          while (2)
          {
            id v28 = v19;
            unsigned int v29 = 0LL;
            uint64_t v30 = (uint64_t)v25 + v26;
            do
            {
              if (*(void *)v38 != v27) {
                objc_enumerationMutation(v24);
              }
              unsigned __int8 v31 = -[CPLPrequeliteScopeStorage setScopeNeedsUpdateFromTransport:error:]( self,  "setScopeNeedsUpdateFromTransport:error:",  *(void *)(*((void *)&v37 + 1) + 8LL * (void)v29),  a4);
              *((_BYTE *)v52 + 24) = v31;
              if ((v31 & 1) == 0)
              {
                uint64_t v30 = (uint64_t)v29 + v26 + 1;
                unsigned int v19 = v28;
                goto LABEL_26;
              }

              unsigned int v29 = (char *)v29 + 1;
            }

            while (v25 != v29);
            id v25 = [v24 countByEnumeratingWithState:&v37 objects:v55 count:16];
            uint64_t v26 = v30;
            unsigned int v19 = v28;
            if (v25) {
              continue;
            }
            break;
          }
        }

        else
        {
          uint64_t v30 = 0LL;
        }

- (BOOL)openWithError:(id *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CPLPrequeliteScopeStorage;
  BOOL v4 = -[CPLPrequeliteStorage openWithError:](&v8, "openWithError:", a3);
  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

    [v6 cplRegisterDeterministicFunction:@"scopeTypeOrder" nArgs:2 handler:&stru_1002472B8];
    BYTE4(self->_transportGroupClass) = 1;
  }

  return v4;
}

- (void)_fillScopeTypeOrder:(int64_t)a3[7] withOrderOfScopeTypes:(id)a4 name:(id)a5
{
  id v13 = a4;
  id v9 = a5;
  if ([v13 count] != (id)7) {
    sub_1001995F8((uint64_t)v9, (uint64_t)a2, (uint64_t)self);
  }
  for (int64_t i = 0LL; i != 7; ++i)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:i]);
    id v12 = [v11 integerValue];

    a3[(void)v12] = i;
  }
}

- (id)recordsDesignation
{
  return @"scopes";
}

- (id)statusDictionary
{
  return &__NSDictionary0__struct;
}

- (void)_updateStatusForMainScopeChange:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a3 libraryInfo]);
  id v9 = (id)objc_claimAutoreleasedReturnValue([v4 featureCompatibleVersion]);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage abstractObject](self, "abstractObject"));
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 engineStore]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 engineLibrary]);

  if (v9) {
    id v8 = [v9 integerValue];
  }
  else {
    id v8 = 0LL;
  }
  [v7 setServerFeatureCompatibleVersion:v8];
}

- (BOOL)fixStorageAfterAnyVersionChange
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CPLPrequeliteScopeStorage;
  BOOL v3 = -[CPLPrequeliteStorage fixStorageAfterAnyVersionChange](&v9, "fixStorageAfterAnyVersionChange");
  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainScopeIdentifier](self, "mainScopeIdentifier"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage scopeWithIdentifier:](self, "scopeWithIdentifier:", v4));

    if (v5)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage scopeChangeForScope:](self, "scopeChangeForScope:", v5));
      if (v6)
      {
        id v7 = (void *)v6;
        -[CPLPrequeliteScopeStorage _updateStatusForMainScopeChange:](self, "_updateStatusForMainScopeChange:", v6);
      }
    }
  }

  return v3;
}

- (BOOL)_setScope:(id)a3 hasTaskTodo:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 setHasSomethingTodo]);

  id v14 = objc_alloc(&OBJC_CLASS____CPLPrequeliteScopeIsEqual);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);

  unsigned __int8 v16 = -[_CPLPrequeliteScopeIsEqual initWithIdentifier:](v14, "initWithIdentifier:", v15);
  unsigned __int8 v17 = [v11 cplExecute:@"UPDATE %@ SET %@ WHERE %@", v12, v13, v16];

  if (a5 && (v17 & 1) == 0) {
    *a5 = (id)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
  }

  return v17;
}

- (int64_t)_taskItemForScope:(id)a3 task:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v6 targetGenerationVar]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) localIndexVar]);
  id v14 = [v7 localIndex];

  id v15 = [v9 cplFetchObjectOfClass:v10, @"SELECT %@ FROM %@ WHERE %@ = %ld", v11, v12, v13, v14 sql];
  id v16 = [v15 integerValue];

  return (int64_t)v16;
}

- (id)_taskItemCompletionDateForScope:(id)a3 task:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastCompletionDateVar]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 lastCompletionDateVar]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v9,  v6));
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (BOOL)_setScope:(id)a3 hasCompletedTaskItem:(int64_t)a4 task:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 setHasCompletedGeneration:a4]);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) localIndexVar]);
  id v17 = [v11 localIndex];

  unsigned __int8 v18 = [v13 cplExecute:@"UPDATE %@ SET %@ WHERE %@ = %ld", v14, v15, v16, v17];
  if (a6 && (v18 & 1) == 0) {
    *a6 = (id)objc_claimAutoreleasedReturnValue([v13 lastCPLError]);
  }

  return v18;
}

- (id)enumeratorForScopesIncludeInactive:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) namesInjection]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v9 = (void *)v8;
  if (v3)
  {
    id v10 = [v6 cplFetch:@"SELECT %@ FROM %@", v7, v8];
    id v11 = v10;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100144568;
    v16[3] = &unk_100247278;
    v16[4] = self;
    id v12 = v16;
  }

  else
  {
    id v10 = [v6 cplFetch:@"SELECT %@ FROM %@ WHERE (%@ & %ld) = 0", v7, v8, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 16];
    id v11 = v10;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001445F4;
    v15[3] = &unk_100247278;
    v15[4] = self;
    id v12 = v15;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 enumerateObjects:v12]);

  return v13;
}

- (id)enumeratorForScopesNeedingUpdateFromTransport
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_scopeChangeVar + 4) bindableValueForValue:v4]);
  id v6 = *(CPLPrequeliteVariable **)((char *)&self->_scopeChangeVar + 4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 dateByAddingTimeInterval:-86400.0]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bindableValueForValue:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) namesInjection]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v11 = *(uint64_t *)((char *)&self->_base + 4);
  uint64_t v12 = *(uint64_t *)((char *)&self->_lastLibraryInfoUpdateVar + 4);
  uint64_t v13 = *(uint64_t *)((char *)&self->_scopeChangeVar + 4);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) busyStateVar]);
  id v15 = [v18 cplFetch:@"SELECT %@ FROM %@ WHERE ((%@ & %ld) = 0) AND ((%@ IS NULL) OR (%@ IS NULL) OR (%@ > %@) OR (%@ < %@) OR (%@ != 0))", v9, v10, v11, 4, v12, v13, v13, v5, v13, v8, v14];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10014483C;
  v19[3] = &unk_100247278;
  v19[4] = self;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 enumerateObjects:v19]);

  return v16;
}

- (id)enumeratorForDeletedStagedScopes
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) namesInjection]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v7 = [v4 cplFetch:@"SELECT %@ FROM %@ WHERE (%@ & %ld) = %ld", v5, v6, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 68, 68];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001449C4;
  v10[3] = &unk_100247278;
  v10[4] = self;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 enumerateObjects:v10]);

  return v8;
}

- (BOOL)forceIdentifyUknownScopesWithError:(id *)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  [*(id *)((char *)&self->_scopeChangeVar + 4) discardCachedValue];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v8 = *(uint64_t *)((char *)&self->_scopeChangeVar + 4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) scopeTypeVar]);
  unsigned int v10 = [v6 cplExecute:@"UPDATE %@ SET %@ = NULL WHERE %@ = %ld", v7, v8, v9, 0];

  if (v10)
  {
    id v11 = [v6 changes];
    if (!_CPLSilentLogging)
    {
      id v12 = v11;
      id v13 = sub_100140908();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v17 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Will try to identify %lld yet unidentified scopes",  buf,  0xCu);
      }
    }
  }

  else if (a3)
  {
    *a3 = (id)objc_claimAutoreleasedReturnValue([v6 lastCPLError]);
  }

  return v10;
}

- (BOOL)forcePushToTransportForActiveScopesWithError:(id *)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_supervisorInfoVar + 4) setHasSomethingTodo]);
  unsigned int v9 = [v6 cplExecute:@"UPDATE %@ SET %@ WHERE %@ & %ld = 0", v7, v8, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 16];

  if (v9)
  {
    id v10 = [v6 changes];
    if (!_CPLSilentLogging)
    {
      id v11 = v10;
      id v12 = sub_100140908();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v16 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Marked %lld scopes as need to push to transport",  buf,  0xCu);
      }
    }
  }

  else if (a3)
  {
    *a3 = (id)objc_claimAutoreleasedReturnValue([v6 lastCPLError]);
  }

  return v9;
}

- (id)enumeratorForScopesNeedingToPushHighPriorityChangesToTransport
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100144F10;
  block[3] = &unk_10023DC70;
  block[4] = self;
  if (qword_1002A3848 != -1) {
    dispatch_once(&qword_1002A3848, block);
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) namesInjection]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v7 = *(uint64_t *)((char *)&self->_base + 4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_supervisorInfoVar + 4) hasSomethingTodo]);
  uint64_t v9 = *(uint64_t *)((char *)&self->_lastLibraryInfoUpdateVar + 4);
  uint64_t v10 = *(uint64_t *)((char *)&self->_base + 4);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) scopeTypeVar]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar]);
  id v13 = [v4 cplFetch:@"SELECT %@ FROM %@ WHERE (%@ & %ld) = %ld AND %@ AND (%@ IS NOT NULL OR (%@ & %ld) != 0) ORDER BY scopeTypeOrder(%@, %p), %@ ASC", v5, v6, v7, 131088, 0x20000, v8, v9, v10, 4, v11, &unk_1002A3810, v12];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100144F30;
  v16[3] = &unk_100247278;
  v16[4] = self;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 enumerateObjects:v16]);

  return v14;
}

- (BOOL)hasScopesNeedingToPushHighPriorityChangesToTransport
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v5 = *(uint64_t *)((char *)&self->_base + 4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_supervisorInfoVar + 4) hasSomethingTodo]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"(%@ & %ld) = %ld AND %@",  v5,  131088LL,  0x20000LL,  v6));
  LOBYTE(v5) = [v3 table:v4 hasRecordsMatchingQuery:v7];

  return v5;
}

- (id)enumeratorForScopesNeedingToPushChangesToTransport
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100145264;
  block[3] = &unk_10023DC70;
  block[4] = self;
  if (qword_1002A3888 != -1) {
    dispatch_once(&qword_1002A3888, block);
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) namesInjection]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v7 = *(uint64_t *)((char *)&self->_base + 4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_supervisorInfoVar + 4) hasSomethingTodo]);
  uint64_t v9 = *(uint64_t *)((char *)&self->_lastLibraryInfoUpdateVar + 4);
  uint64_t v10 = *(uint64_t *)((char *)&self->_base + 4);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) scopeTypeVar]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar]);
  id v13 = [v4 cplFetch:@"SELECT %@ FROM %@ WHERE (%@ & %ld) = 0 AND %@ AND (%@ IS NOT NULL OR (%@ & %ld) != 0) ORDER BY scopeTypeOrder(%@, %p), %@ ASC", v5, v6, v7, 131088, v8, v9, v10, 4, v11, &unk_1002A3850, v12];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100145284;
  v16[3] = &unk_100247278;
  v16[4] = self;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 enumerateObjects:v16]);

  return v14;
}

- (BOOL)hasScopesNeedingToPushChangesToTransport
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v5 = *(uint64_t *)((char *)&self->_base + 4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_supervisorInfoVar + 4) hasSomethingTodo]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"(%@ & %ld) = 0 AND %@",  v5,  131088LL,  v6));
  LOBYTE(v5) = [v3 table:v4 hasRecordsMatchingQuery:v7];

  return v5;
}

- (BOOL)setScopeHasChangesToPushToTransport:(id)a3 error:(id *)a4
{
  return -[CPLPrequeliteScopeStorage _setScope:hasTaskTodo:error:]( self,  "_setScope:hasTaskTodo:error:",  a3,  *(CPLPrequeliteVariable **)((char *)&self->_supervisorInfoVar + 4),  a4);
}

- (int64_t)pushToTransportTaskForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _taskItemForScope:task:]( self,  "_taskItemForScope:task:",  a3,  *(CPLPrequeliteVariable **)((char *)&self->_supervisorInfoVar + 4));
}

- (BOOL)setScope:(id)a3 hasCompletedPushToTransportTask:(int64_t)a4 error:(id *)a5
{
  return -[CPLPrequeliteScopeStorage _setScope:hasCompletedTaskItem:task:error:]( self,  "_setScope:hasCompletedTaskItem:task:error:",  a3,  a4,  *(CPLPrequeliteVariable **)((char *)&self->_supervisorInfoVar + 4),  a5);
}

- (BOOL)doesScopeNeedToPushChangesToTransport:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v7 = objc_alloc(&OBJC_CLASS____CPLPrequeliteScopeIsEqual);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);

  uint64_t v9 = -[_CPLPrequeliteScopeIsEqual initWithIdentifier:](v7, "initWithIdentifier:", v8);
  uint64_t v10 = *(uint64_t *)((char *)&self->_base + 4);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_supervisorInfoVar + 4) hasSomethingTodo]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"%@ AND (%@ & %ld) = 0 AND %@",  v9,  v10,  16LL,  v11));
  LOBYTE(v10) = [v5 table:v6 hasRecordsMatchingQuery:v12];

  return v10;
}

- (id)_injectionForScopesAllowingPullFromTransport
{
  BOOL v3 = *(CPLPrequeliteVariableGroup **)((char *)&self->_libraryStateGroup + 4);
  if (!v3)
  {
    id v4 = (CPLPrequeliteVariableGroup *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"((%@ & %ld) = 0 OR (%@ & %ld) = %ld)",  *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4),  262164LL,  *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4),  262228LL,  68LL));
    uint64_t v5 = *(CPLPrequeliteVariableGroup **)((char *)&self->_libraryStateGroup + 4);
    *(CPLPrequeliteVariableGroup **)((char *)&self->_libraryStateGroup + 4) = v4;

    BOOL v3 = *(CPLPrequeliteVariableGroup **)((char *)&self->_libraryStateGroup + 4);
  }

  return v3;
}

- (id)enumeratorForScopesNeedingToPullChangesFromTransport
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100145764;
  block[3] = &unk_10023DC70;
  block[4] = self;
  if (qword_1002A38C8 != -1) {
    dispatch_once(&qword_1002A38C8, block);
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) namesInjection]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _injectionForScopesAllowingPullFromTransport]( self,  "_injectionForScopesAllowingPullFromTransport"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_pushToTransportTodoVar + 4) hasSomethingTodo]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) scopeTypeVar]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar]);
  id v11 = [v4 cplFetch:@"SELECT %@ FROM %@ WHERE (%@) AND %@ ORDER BY scopeTypeOrder(%@, %p), %@ ASC", v5, v6, v7, v8, v9, &unk_1002A3890, v10];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100145784;
  v14[3] = &unk_100247278;
  v14[4] = self;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 enumerateObjects:v14]);

  return v12;
}

- (BOOL)hasScopesNeedingToPullChangesFromTransport
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _injectionForScopesAllowingPullFromTransport]( self,  "_injectionForScopesAllowingPullFromTransport"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_pushToTransportTodoVar + 4) hasSomethingTodo]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"(%@) = 0 AND %@",  v5,  v6));
  unsigned __int8 v8 = [v3 table:v4 hasRecordsMatchingQuery:v7];

  return v8;
}

- (BOOL)setScopeHasChangesToPullFromTransport:(id)a3 error:(id *)a4
{
  return -[CPLPrequeliteScopeStorage _setScope:hasTaskTodo:error:]( self,  "_setScope:hasTaskTodo:error:",  a3,  *(CPLPrequeliteTodoVar **)((char *)&self->_pushToTransportTodoVar + 4),  a4);
}

- (BOOL)setAllScopesHasChangesToPullFromTransportWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_pushToTransportTodoVar + 4) setHasSomethingTodo]);
  unsigned __int8 v9 = [v6 cplExecute:@"UPDATE %@ SET %@", v7, v8];

  if (a3 && (v9 & 1) == 0) {
    *a3 = (id)objc_claimAutoreleasedReturnValue([v6 lastCPLError]);
  }

  return v9;
}

- (int64_t)pullFromTransportTaskForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _taskItemForScope:task:]( self,  "_taskItemForScope:task:",  a3,  *(CPLPrequeliteTodoVar **)((char *)&self->_pushToTransportTodoVar + 4));
}

- (BOOL)setScope:(id)a3 hasCompletedPullFromTransportTask:(int64_t)a4 error:(id *)a5
{
  return -[CPLPrequeliteScopeStorage _setScope:hasCompletedTaskItem:task:error:]( self,  "_setScope:hasCompletedTaskItem:task:error:",  a3,  a4,  *(CPLPrequeliteTodoVar **)((char *)&self->_pushToTransportTodoVar + 4),  a5);
}

- (BOOL)doesScopeNeedToPullChangesFromTransport:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v7 = objc_alloc(&OBJC_CLASS____CPLPrequeliteScopeIsEqual);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);

  unsigned __int8 v9 = -[_CPLPrequeliteScopeIsEqual initWithIdentifier:](v7, "initWithIdentifier:", v8);
  uint64_t v10 = *(uint64_t *)((char *)&self->_base + 4);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_pushToTransportTodoVar + 4) hasSomethingTodo]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"%@ AND (%@ & %ld) = 0 AND %@",  v9,  v10,  262164LL,  v11));
  LOBYTE(v10) = [v5 table:v6 hasRecordsMatchingQuery:v12];

  return v10;
}

- (BOOL)setPullFromTransportExpirationInterval:(double)a3 scope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_pushToTransportTodoVar + 4) expirationIntervalVar]);
  LOBYTE(a5) = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v9,  v10,  v8,  a5);

  return (char)a5;
}

- (id)enumeratorForScopesWithMingling
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100145D24;
  block[3] = &unk_10023DC70;
  block[4] = self;
  if (qword_1002A3908 != -1) {
    dispatch_once(&qword_1002A3908, block);
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) namesInjection]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _injectionForScopesAllowingPullFromTransport]( self,  "_injectionForScopesAllowingPullFromTransport"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) scopeTypeVar]);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar]);
  id v10 = [v4 cplFetch:@"SELECT %@ FROM %@ WHERE (%@) ORDER BY scopeTypeOrder(%@, %p), %@ ASC", v5, v6, v7, v8, &unk_1002A38D0, v9];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100145D44;
  v13[3] = &unk_100247278;
  v13[4] = self;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 enumerateObjects:v13]);

  return v11;
}

- (BOOL)doScopesNeedMetadataSync:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage _injectionForFilter:](self, "_injectionForFilter:", a3));
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    uint64_t v7 = *(uint64_t *)((char *)&self->_base + 4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_supervisorInfoVar + 4) hasSomethingTodo]);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"%@ AND (%@ & %ld) = 0 AND %@",  v4,  v7,  16LL,  v8));
    LOBYTE(v7) = [v5 table:v6 hasRecordsMatchingQuery:v9];

    if ((v7 & 1) != 0)
    {
      unsigned __int8 v10 = 1;
    }

    else
    {
      uint64_t v11 = *(uint64_t *)((char *)&self->_base + 4);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_pushToTransportTodoVar + 4) hasSomethingTodo]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"%@ AND (%@ & %ld) = 0 AND %@",  v4,  v11,  262164LL,  v12));
      unsigned __int8 v10 = [v5 table:v6 hasRecordsMatchingQuery:v13];
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (id)enumeratorForScopesNeedingToBePulledByClientWithMaximumCount:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int16 v8 = (unsigned __int16)[v7 libraryOptions];

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) namesInjection]);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v11 = *(uint64_t *)((char *)&self->_base + 4);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_pullFromTransportTodoVar + 4) hasSomethingTodo]);
  id v13 = (void *)v12;
  uint64_t v14 = 65552LL;
  if ((v8 & 0x400) != 0) {
    uint64_t v14 = 0x10000LL;
  }
  id v15 = [v6 cplFetch:@"SELECT %@ FROM %@ WHERE (%@ & %ld) = %ld AND %@ LIMIT %lu", v9, v10, v11, v14, 0x10000, v12, a3];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100146090;
  v18[3] = &unk_100247278;
  v18[4] = self;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 enumerateObjects:v18]);

  return v16;
}

- (int64_t)clientNeedsToPullTaskForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _taskItemForScope:task:]( self,  "_taskItemForScope:task:",  a3,  *(CPLPrequeliteTodoVar **)((char *)&self->_pullFromTransportTodoVar + 4));
}

- (BOOL)setScope:(id)a3 hasCompletedClientNeedsToPullTask:(int64_t)a4 error:(id *)a5
{
  return -[CPLPrequeliteScopeStorage _setScope:hasCompletedTaskItem:task:error:]( self,  "_setScope:hasCompletedTaskItem:task:error:",  a3,  a4,  *(CPLPrequeliteTodoVar **)((char *)&self->_pullFromTransportTodoVar + 4),  a5);
}

- (BOOL)setScopeNeedsToBePulledByClient:(id)a3 error:(id *)a4
{
  return -[CPLPrequeliteScopeStorage _setScope:hasTaskTodo:error:]( self,  "_setScope:hasTaskTodo:error:",  a3,  *(CPLPrequeliteTodoVar **)((char *)&self->_pullFromTransportTodoVar + 4),  a4);
}

- (BOOL)doesScopeNeedToBePulledByClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int16 v6 = (unsigned __int16)[v5 libraryOptions];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v9 = objc_alloc(&OBJC_CLASS____CPLPrequeliteScopeIsEqual);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);

  uint64_t v11 = -[_CPLPrequeliteScopeIsEqual initWithIdentifier:](v9, "initWithIdentifier:", v10);
  uint64_t v12 = *(uint64_t *)((char *)&self->_base + 4);
  uint64_t v13 = objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_pullFromTransportTodoVar + 4) hasSomethingTodo]);
  uint64_t v14 = (void *)v13;
  uint64_t v15 = 65552LL;
  if ((v6 & 0x400) != 0) {
    uint64_t v15 = 0x10000LL;
  }
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"%@ AND (%@ & %ld) = %ld AND %@",  v11,  v12,  v15,  0x10000LL,  v13));
  unsigned __int8 v17 = [v7 table:v8 hasRecordsMatchingQuery:v16];

  return v17;
}

- (BOOL)doesScopeSupportToBePulledByClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int16 v6 = (unsigned __int16)[v5 libraryOptions];

  id v7 = [v4 scopeType];
  if (v7)
  {
    unsigned __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);
    LODWORD(v7) = -[CPLPrequeliteScopeStorage _scopeTypeSupportsClientSync:scopeIdentifier:]( self,  "_scopeTypeSupportsClientSync:scopeIdentifier:",  v7,  v8);

    if ((_DWORD)v7)
    {
      if ((v6 & 0x400) == 0)
      {
        unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4),  v4));
        LOBYTE(v7) = ((unint64_t)[v9 integerValue] & 0x10) == 0;
      }
    }
  }

  return (char)v7;
}

- (id)enumeratorForScopesNeedingToUpdateTransport
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) namesInjection]);
  unsigned __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_clientNeedsToPullTodoVar + 4) hasSomethingTodo]);
  id v8 = [v4 cplFetch:@"SELECT %@ FROM %@ WHERE %@", v5, v6, v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10014646C;
  v11[3] = &unk_100247278;
  v11[4] = self;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 enumerateObjects:v11]);

  return v9;
}

- (BOOL)hasScopesNeedingToUpdateTransport
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_clientNeedsToPullTodoVar + 4) hasSomethingTodo]);
  unsigned __int16 v6 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"%@",  v5));
  unsigned __int8 v7 = [v3 table:v4 hasRecordsMatchingQuery:v6];

  return v7;
}

- (BOOL)setScopeNeedsToUpdateTransport:(id)a3 error:(id *)a4
{
  return -[CPLPrequeliteScopeStorage _setScope:hasTaskTodo:error:]( self,  "_setScope:hasTaskTodo:error:",  a3,  *(CPLPrequeliteTodoVar **)((char *)&self->_clientNeedsToPullTodoVar + 4),  a4);
}

- (int64_t)transportUpdateTaskForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _taskItemForScope:task:]( self,  "_taskItemForScope:task:",  a3,  *(CPLPrequeliteTodoVar **)((char *)&self->_clientNeedsToPullTodoVar + 4));
}

- (BOOL)setScope:(id)a3 hasCompletedTransportUpdate:(int64_t)a4 error:(id *)a5
{
  return -[CPLPrequeliteScopeStorage _setScope:hasCompletedTaskItem:task:error:]( self,  "_setScope:hasCompletedTaskItem:task:error:",  a3,  a4,  *(CPLPrequeliteTodoVar **)((char *)&self->_clientNeedsToPullTodoVar + 4),  a5);
}

- (BOOL)doesScopeNeedToUpdateTransport:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v7 = objc_alloc(&OBJC_CLASS____CPLPrequeliteScopeIsEqual);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);

  unsigned __int8 v9 = -[_CPLPrequeliteScopeIsEqual initWithIdentifier:](v7, "initWithIdentifier:", v8);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_clientNeedsToPullTodoVar + 4) hasSomethingTodo]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"%@ AND %@",  v9,  v10));
  LOBYTE(v7) = [v5 table:v6 hasRecordsMatchingQuery:v11];

  return (char)v7;
}

- (id)enumeratorForScopesNeedingToUploadComputeState
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) namesInjection]);
  unsigned __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_updateTransportTodoVar + 4) hasSomethingTodo]);
  id v8 = [v4 cplFetch:@"SELECT %@ FROM %@ WHERE %@", v5, v6, v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001467F0;
  v11[3] = &unk_100247278;
  v11[4] = self;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 enumerateObjects:v11]);

  return v9;
}

- (BOOL)hasScopesNeedingToUploadComputeState
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_updateTransportTodoVar + 4) hasSomethingTodo]);
  unsigned __int16 v6 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"%@",  v5));
  unsigned __int8 v7 = [v3 table:v4 hasRecordsMatchingQuery:v6];

  return v7;
}

- (BOOL)setScopeNeedsToUploadComputeState:(id)a3 error:(id *)a4
{
  return -[CPLPrequeliteScopeStorage _setScope:hasTaskTodo:error:]( self,  "_setScope:hasTaskTodo:error:",  a3,  *(CPLPrequeliteTodoVar **)((char *)&self->_updateTransportTodoVar + 4),  a4);
}

- (int64_t)uploadComputeStateTaskForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _taskItemForScope:task:]( self,  "_taskItemForScope:task:",  a3,  *(CPLPrequeliteTodoVar **)((char *)&self->_updateTransportTodoVar + 4));
}

- (BOOL)setScope:(id)a3 hasCompletedUploadComputeStateTask:(int64_t)a4 error:(id *)a5
{
  return -[CPLPrequeliteScopeStorage _setScope:hasCompletedTaskItem:task:error:]( self,  "_setScope:hasCompletedTaskItem:task:error:",  a3,  a4,  *(CPLPrequeliteTodoVar **)((char *)&self->_updateTransportTodoVar + 4),  a5);
}

- (BOOL)doesScopeNeedToUploadComputeState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v7 = objc_alloc(&OBJC_CLASS____CPLPrequeliteScopeIsEqual);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);

  unsigned __int8 v9 = -[_CPLPrequeliteScopeIsEqual initWithIdentifier:](v7, "initWithIdentifier:", v8);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_updateTransportTodoVar + 4) hasSomethingTodo]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"%@ AND %@",  v9,  v10));
  LOBYTE(v7) = [v5 table:v6 hasRecordsMatchingQuery:v11];

  return (char)v7;
}

- (id)addScopeWithIdentifier:(id)a3 scopeType:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStorage valueForVariable:]( self,  "valueForVariable:",  *(void *)(&self->super._shouldUpgradeSchema + 1)));
  unsigned __int8 v10 = (char *)[v9 integerValue];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10 + 3));
  unsigned int v12 = -[CPLPrequeliteStorage setValue:forVariable:error:]( self,  "setValue:forVariable:error:",  v11,  *(void *)(&self->super._shouldUpgradeSchema + 1),  a5);

  if (v12)
  {
    uint64_t v13 = -[CPLEngineScope initWithScopeIdentifier:scopeType:]( objc_alloc(&OBJC_CLASS___CPLEngineScope),  "initWithScopeIdentifier:scopeType:",  v8,  a4);
    -[CPLEngineScope setLocalIndex:](v13, "setLocalIndex:", v10 + 1);
    -[CPLEngineScope setCloudIndex:](v13, "setCloudIndex:", v10 + 2);
    -[CPLEngineScope setStableIndex:](v13, "setStableIndex:", v10 + 3);
    if (-[CPLPrequeliteScopeStorage _addScope:error:](self, "_addScope:error:", v13, a5)) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0LL;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  return v14;
}

- (BOOL)deleteScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar]);
  unsigned __int8 v11 = [v8 cplExecute:@"DELETE FROM %@ WHERE %@ = %@", v9, v10, v6];

  if (a4 && (v11 & 1) == 0) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([v8 lastCPLError]);
  }
  -[CPLPrequeliteScopeStorage _discardCachedValuesForGroup:]( self,  "_discardCachedValuesForGroup:",  *(CPLPrequeliteVariable **)((char *)&self->_stagedScopeIdentifierVar + 4));
  [*(id *)(&self->_noteEndOfResetIfNecessary + 4) discardCachedValue];
  -[CPLPrequeliteScopeStorage _discardCachedValuesForGroup:]( self,  "_discardCachedValuesForGroup:",  *(CPLPrequeliteVariable **)((char *)&self->_stagedScopeIdentifierVar + 4));

  return v11;
}

- (BOOL)setScopeType:(int64_t)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) scopeTypeVar]);
  unsigned int v11 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v9,  v10,  v8,  a5);

  if (v11)
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

    [*(id *)((char *)&self->_base + 4) discardCachedValue];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
    unsigned int v15 = -[CPLPrequeliteScopeStorage _scopeTypeSupportsClientSync:scopeIdentifier:]( self,  "_scopeTypeSupportsClientSync:scopeIdentifier:",  a3,  v14);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    uint64_t v17 = *(uint64_t *)((char *)&self->_base + 4);
    unsigned __int8 v18 = objc_alloc(&OBJC_CLASS____CPLPrequeliteScopeIsEqual);
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
    v20 = -[_CPLPrequeliteScopeIsEqual initWithIdentifier:](v18, "initWithIdentifier:", v19);
    unsigned int v21 = v20;
    if (v15)
    {
      unsigned int v22 = [v13 cplExecute:@"UPDATE %@ SET %@ = (%@ | %ld) WHERE %@", v16, v17, v17, 0x10000, v20];

      if (v22)
      {
        BOOL v23 = 1;
        id v24 = sub_100140908();
        id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        if (!os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
        {
LABEL_15:

LABEL_18:
          goto LABEL_19;
        }

        *(_DWORD *)buf = 138412290;
        id v31 = v8;
        uint64_t v26 = "Enabled client sync for %@";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
        goto LABEL_15;
      }
    }

    else
    {
      unsigned int v27 = [v13 cplExecute:@"UPDATE %@ SET %@ = (%@ & %ld) WHERE %@", v16, v17, v17, -65537, v20];

      if (v27)
      {
        BOOL v23 = 1;
        id v28 = sub_100140908();
        id v25 = (void *)objc_claimAutoreleasedReturnValue(v28);
        if (!os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 138412290;
        id v31 = v8;
        uint64_t v26 = "Disabled client sync for %@";
        goto LABEL_14;
      }
    }

    BOOL v23 = 0;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue([v13 lastError]);
    }
    goto LABEL_18;
  }

  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (int64_t)_bumpIndexWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStorage valueForVariable:]( self,  "valueForVariable:",  *(void *)(&self->super._shouldUpgradeSchema + 1)));
  id v6 = (char *)[v5 integerValue];

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6 + 1));
  LODWORD(a3) = -[CPLPrequeliteStorage setValue:forVariable:error:]( self,  "setValue:forVariable:error:",  v7,  *(void *)(&self->super._shouldUpgradeSchema + 1),  a3);

  if ((_DWORD)a3) {
    return (int64_t)(v6 + 1);
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (BOOL)bumpLocalIndexForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteScopeStorage _bumpIndexWithError:](self, "_bumpIndexWithError:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
  }

  else
  {
    int64_t v9 = v7;
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    uint64_t v13 = -[_CPLPrequeliteScopeIsEqual initWithIdentifier:]( objc_alloc(&OBJC_CLASS____CPLPrequeliteScopeIsEqual),  "initWithIdentifier:",  v6);
    unsigned __int8 v8 = [v11 cplExecute:@"UPDATE %@ SET localIndex = %ld WHERE %@", v12, v9, v13];

    if (a4 && (v8 & 1) == 0) {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v11 lastError]);
    }
  }

  return v8;
}

- (BOOL)bumpCloudIndexForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteScopeStorage _bumpIndexWithError:](self, "_bumpIndexWithError:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
  }

  else
  {
    int64_t v9 = v7;
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    uint64_t v13 = -[_CPLPrequeliteScopeIsEqual initWithIdentifier:]( objc_alloc(&OBJC_CLASS____CPLPrequeliteScopeIsEqual),  "initWithIdentifier:",  v6);
    unsigned __int8 v8 = [v11 cplExecute:@"UPDATE %@ SET cloudIndex = %ld WHERE %@", v12, v9, v13];

    if (a4 && (v8 & 1) == 0) {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v11 lastError]);
    }
  }

  return v8;
}

- (BOOL)bumpStableIndexForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteScopeStorage _bumpIndexWithError:](self, "_bumpIndexWithError:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
  }

  else
  {
    int64_t v9 = v7;
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    uint64_t v13 = -[_CPLPrequeliteScopeIsEqual initWithIdentifier:]( objc_alloc(&OBJC_CLASS____CPLPrequeliteScopeIsEqual),  "initWithIdentifier:",  v6);
    unsigned __int8 v8 = [v11 cplExecute:@"UPDATE %@ SET stableIndex = %ld WHERE %@", v12, v9, v13];

    if (a4 && (v8 & 1) == 0) {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v11 lastError]);
    }
  }

  return v8;
}

- (id)_scopeWithQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001473E8;
  v11[3] = &unk_100247278;
  v11[4] = self;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) namesInjection]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v9 = [v6 cplFetchObject:v11, @"SELECT %@ FROM %@ WHERE %@", v7, v8, v4 sql];

  return v9;
}

- (id)scopeWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[_CPLPrequeliteScopeIsEqual initWithIdentifier:]( objc_alloc(&OBJC_CLASS____CPLPrequeliteScopeIsEqual),  "initWithIdentifier:",  v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage _scopeWithQuery:](self, "_scopeWithQuery:", v5));
  return v6;
}

- (id)scopeWithLocalIndex:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"localIndex = %ld",  a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage _scopeWithQuery:](self, "_scopeWithQuery:", v4));

  return v5;
}

- (id)scopeWithCloudIndex:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"cloudIndex = %ld",  a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage _scopeWithQuery:](self, "_scopeWithQuery:", v4));

  return v5;
}

- (id)scopeWithStableIndex:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"stableIndex = %ld",  a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage _scopeWithQuery:](self, "_scopeWithQuery:", v4));

  return v5;
}

- (id)validLocalIndexes
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pqlConnection]);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v7 = [v5 cplFetch:@"SELECT localIndex FROM %@ WHERE (%@ & %ld) = 0", v6, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 16];
  id v8 = [v7 enumerateObjectsOfClass:objc_opt_class(NSNumber)];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        -[NSMutableIndexSet addIndex:]( v3,  "addIndex:",  [*(id *)(*((void *)&v15 + 1) + 8 * (void)v13) integerValue]);
        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v11);
  }

  return v3;
}

- (id)validCloudIndexes
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pqlConnection]);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v7 = [v5 cplFetch:@"SELECT cloudIndex FROM %@ WHERE (%@ & %ld) = 0", v6, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 16];
  id v8 = [v7 enumerateObjectsOfClass:objc_opt_class(NSNumber)];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        -[NSMutableIndexSet addIndex:]( v3,  "addIndex:",  [*(id *)(*((void *)&v15 + 1) + 8 * (void)v13) integerValue]);
        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v11);
  }

  return v3;
}

- (id)primaryScope
{
  BOOL v3 = objc_alloc(&OBJC_CLASS____CPLPrequeliteScopeIsEqual);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainScopeIdentifier](self, "mainScopeIdentifier"));
  uint64_t v5 = -[_CPLPrequeliteScopeIsEqual initWithIdentifier:](v3, "initWithIdentifier:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage _scopeWithQuery:](self, "_scopeWithQuery:", v5));

  return v6;
}

- (id)stagingScopeForScope:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->_uploadComputeStateTodoVar + 4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 scopeIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"%@ = %@",  v4,  v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage _scopeWithQuery:](self, "_scopeWithQuery:", v6));

  return v7;
}

- (id)rewindSyncAnchorsForScope:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) rewindSyncAnchorsVar]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v5,  v4));

  if (v6)
  {
    if (qword_1002A3918 != -1) {
      dispatch_once(&qword_1002A3918, &stru_1002472D8);
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:classes:]( &OBJC_CLASS___NSKeyedUnarchiver,  "cpl_safeUnarchiveObjectWithData:classes:",  v6,  qword_1002A3910));
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSSet);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      id v9 = v7;
    }

    else
    {
      if (!_CPLSilentLogging)
      {
        id v10 = sub_100140908();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v13 = 138412290;
          id v14 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Rewind sync anchors for %@ is invalid",  (uint8_t *)&v13,  0xCu);
        }
      }

      id v9 = 0LL;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (BOOL)storeRewindSyncAnchors:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3) {
    a3 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver cpl_archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "cpl_archivedDataWithRootObject:",  a3));
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) rewindSyncAnchorsVar]);
  BOOL v10 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  a3,  v9,  v8,  a5);

  return v10;
}

- (BOOL)storeBusyState:(int64_t)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) busyStateVar]);
  LOBYTE(a5) = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v9,  v10,  v8,  a5);

  return (char)a5;
}

- (int64_t)busyStateForScope:(id)a3
{
  id v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 busyStateVar]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v6,  v5));

  id v8 = [v7 integerValue];
  return (int64_t)v8;
}

- (BOOL)storeSupervisorInfo:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    BOOL v10 = 0LL;
    goto LABEL_5;
  }

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v8,  200LL,  0LL,  a5));
  if (v10)
  {
LABEL_5:
    BOOL v11 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v10,  *(CPLPrequeliteVariable **)((char *)&self->_initialMingleDateVar + 4),  v9,  a5);

    goto LABEL_6;
  }

  BOOL v11 = 0;
LABEL_6:

  return v11;
}

- (id)supervisorInfoForScope:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_initialMingleDateVar + 4),  v4));
  if (v5)
  {
    id v12 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  0LL,  0LL,  &v12));
    id v7 = v12;
    if (v6) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = _CPLSilentLogging == 0;
    }
    if (v8)
    {
      id v9 = sub_100140908();
      BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        id v16 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to deserialize supervisor info for %@: %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)scopeListSyncAnchor
{
  return -[CPLPrequeliteStorage valueForVariable:]( self,  "valueForVariable:",  *(CPLPrequeliteVariable **)((char *)&self->_nextIndexVar + 4));
}

- (BOOL)storeScopeListSyncAnchor:(id)a3 error:(id *)a4
{
  unsigned int v7 = -[CPLPrequeliteStorage setValue:forVariable:error:]( self,  "setValue:forVariable:error:",  a3,  *(CPLPrequeliteVariable **)((char *)&self->_nextIndexVar + 4),  a4);
  BOOL v8 = v7;
  if (!a3 && v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pqlConnection]);

    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_pullFromTransportTodoVar + 4) setHasSomethingTodo]);
    unsigned __int8 v13 = [v10 cplExecute:@"UPDATE %@ SET %@ WHERE %@ & %lu != 0", v11, v12, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 0x10000];

    if ((v13 & 1) != 0)
    {
      if (!_CPLSilentLogging)
      {
        id v14 = sub_100140908();
        __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v18 = [v10 changes];
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Marking %lu scopes to be pulled by client",  buf,  0xCu);
        }
      }
    }

    else if (a4)
    {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v10 lastCPLError]);
    }
  }

  return v8;
}

- (void)_cacheValue:(id)a3 forColumnVariable:(id)a4 scope:(id)a5
{
  unsigned int v7 = *(CPLPrequeliteVariable **)((char *)&self->_scopeListSyncAnchorVar + 4);
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v7 addObject:v9];
  id v11 = (id)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);

  [v9 setCachedValue:v10 forIdentifier:v11];
}

- (BOOL)_storeValue:(id)a3 forColumnVariable:(id)a4 scope:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v10 bindableValueForValue:v9]);
  id v16 = objc_alloc(&OBJC_CLASS____CPLPrequeliteScopeIsEqual);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v11 scopeIdentifier]);
  id v18 = -[_CPLPrequeliteScopeIsEqual initWithIdentifier:](v16, "initWithIdentifier:", v17);
  unsigned __int8 v19 = [v13 cplExecute:@"UPDATE %@ SET %@ = %@ WHERE %@", v14, v10, v15, v18];

  if ((v19 & 1) != 0)
  {
    -[CPLPrequeliteScopeStorage _cacheValue:forColumnVariable:scope:]( self,  "_cacheValue:forColumnVariable:scope:",  v9,  v10,  v11);
  }

  else if (a6)
  {
    *a6 = (id)objc_claimAutoreleasedReturnValue([v13 lastCPLError]);
  }

  return v19;
}

- (id)_valueForColumnVariable:(id)a3 scope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 scopeIdentifier]);
  unsigned int v9 = [v6 hasCachedValueForIdentifier:v8];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 scopeIdentifier]);
    id v11 = (id)objc_claimAutoreleasedReturnValue([v6 cachedValueForIdentifier:v10]);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1001484D8;
    v19[3] = &unk_100247278;
    id v13 = v6;
    id v20 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    __int16 v15 = objc_alloc(&OBJC_CLASS____CPLPrequeliteScopeIsEqual);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 scopeIdentifier]);
    __int128 v17 = -[_CPLPrequeliteScopeIsEqual initWithIdentifier:](v15, "initWithIdentifier:", v16);
    id v11 = [v10 cplFetchObject:v19, @"SELECT %@ FROM %@ WHERE %@", v13, v14, v17 sql];

    -[CPLPrequeliteScopeStorage _cacheValue:forColumnVariable:scope:]( self,  "_cacheValue:forColumnVariable:scope:",  v11,  v13,  v7);
  }

  return v11;
}

- (id)creationDateForScope:(id)a3
{
  id v4 = *(NSMutableSet **)((char *)&self->_modifiedVariables + 4);
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 creationDateVar]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v6,  v5));

  return v7;
}

- (id)flagsForScope:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4),  a3));
  id v4 = v3;
  if (v3) {
    id v5 = -[CPLEngineScopeFlagsUpdate initWithFlags:]( [CPLEngineScopeFlagsUpdate alloc],  "initWithFlags:",  [v3 integerValue]);
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (BOOL)updateFlags:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 updatedFlagsMask])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4),  v9));
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 integerValue];
      id v13 = [v8 updatedFlagsFromFlags:v12];
      if (v12 == v13)
      {
        LOBYTE(a5) = 1;
      }

      else
      {
        id v15 = v13;
        if (!_CPLSilentLogging)
        {
          id v16 = sub_100140908();
          __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = 138412546;
            id v21 = v9;
            __int16 v22 = 2112;
            id v23 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Updating flags for %@: %@",  (uint8_t *)&v20,  0x16u);
          }
        }

        id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v15));
        LOBYTE(a5) = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v18,  *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4),  v9,  a5);
      }
    }

    else if (a5)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v14));

      LOBYTE(a5) = 0;
    }
  }

  else
  {
    LOBYTE(a5) = 1;
  }

  return (char)a5;
}

- (id)disabledDateForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_flagsVar + 4),  a3);
}

- (BOOL)setDisabledDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  return -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  a3,  *(CPLPrequeliteVariable **)((char *)&self->_flagsVar + 4),  a4,  a5);
}

- (id)deleteDateForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_disabledDateVar + 4),  a3);
}

- (BOOL)setDeleteDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  return -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  a3,  *(CPLPrequeliteVariable **)((char *)&self->_disabledDateVar + 4),  a4,  a5);
}

- (id)_librarySateForScope:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100148910;
  v14[3] = &unk_100247278;
  v14[4] = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_all + 4) namesInjection]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v9 = objc_alloc(&OBJC_CLASS____CPLPrequeliteScopeIsEqual);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);

  id v11 = -[_CPLPrequeliteScopeIsEqual initWithIdentifier:](v9, "initWithIdentifier:", v10);
  id v12 = [v6 cplFetchObject:v14, @"SELECT %@ FROM %@ WHERE %@", v7, v8, v11 sql];

  return v12;
}

- (BOOL)setScopeNeedsUpdateFromTransport:(id)a3 error:(id *)a4
{
  return -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  0LL,  *(CPLPrequeliteVariable **)((char *)&self->_scopeChangeVar + 4),  a3,  a4);
}

- (id)transportScopeForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_lastLibraryInfoUpdateVar + 4),  a3);
}

- (BOOL)setTransportScope:(id)a3 forScope:(id)a4 error:(id *)a5
{
  return -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  a3,  *(CPLPrequeliteVariable **)((char *)&self->_lastLibraryInfoUpdateVar + 4),  a4,  a5);
}

- (id)_libraryInfoForScope:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_deleteDateVar + 4),  a3));
  if (v3)
  {
    id v4 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:class:]( &OBJC_CLASS___NSKeyedUnarchiver,  "cpl_safeUnarchiveObjectWithData:class:",  v3,  objc_opt_class(&OBJC_CLASS___CPLLibraryInfo));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)scopeChangeForScope:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_libraryInfoVar + 4),  v4));
  if (!v5)
  {
LABEL_8:
    id v7 = 0LL;
    goto LABEL_9;
  }

  id v6 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:class:]( &OBJC_CLASS___NSKeyedUnarchiver,  "cpl_safeUnarchiveObjectWithData:class:",  v5,  objc_opt_class(&OBJC_CLASS___CPLScopeChange));
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v7 scopeType];
  if (v8 != [v4 scopeType])
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_100140908();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v24 = 138412546;
        id v25 = v7;
        __int16 v26 = 2112;
        id v27 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Invalid stored scope change %@ for %@",  (uint8_t *)&v24,  0x16u);
      }
    }

    goto LABEL_8;
  }

- (BOOL)_storeLibraryInfo:(id)a3 forScope:(id)a4 libraryInfoHasBeenUpdated:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  *a5 = 0;
  if (!v10)
  {
    id v20 = 0LL;
LABEL_27:
    id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    BOOL v32 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v33,  *(CPLPrequeliteVariable **)((char *)&self->_scopeChangeVar + 4),  v11,  0LL);

    goto LABEL_28;
  }

  id v12 = objc_autoreleasePoolPush();
  unint64_t v13 = -[CPLPrequeliteScopeStorage supportedFeatureVersionInLastSyncForScope:]( self,  "supportedFeatureVersionInLastSyncForScope:",  v11);
  unsigned int v41 = a5;
  if (v13 > 0x13) {
    goto LABEL_14;
  }
  unint64_t v14 = v13;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 featureVersionHistory]);
  id v16 = v15;
  if (!v15)
  {
    if (!_CPLSilentLogging)
    {
      id v21 = sub_100140908();
      unsigned __int8 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 scopeIdentifier]);
        *(_DWORD *)buf = 138412546;
        uint64_t v45 = v22;
        __int16 v46 = 2048;
        unint64_t v47 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Last supported feature version for %@ was %lu but no feature version history was found on server",  buf,  0x16u);
      }

      goto LABEL_12;
    }

- (BOOL)storeScopeChange:(id)a3 forScope:(id)a4 scopeChangeHasBeenUpdated:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_autoreleasePoolPush();
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 libraryInfo]);
  id v43 = 0LL;
  unsigned int v14 = -[CPLPrequeliteScopeStorage _storeLibraryInfo:forScope:libraryInfoHasBeenUpdated:error:]( self,  "_storeLibraryInfo:forScope:libraryInfoHasBeenUpdated:error:",  v13,  v11,  a5,  &v43);
  id v15 = v43;

  if (v14)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 scopeIdentifier]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainScopeIdentifier](self, "mainScopeIdentifier"));
    unsigned int v18 = [v16 isEqualToString:v17];

    if (v18) {
      -[CPLPrequeliteScopeStorage _updateStatusForMainScopeChange:](self, "_updateStatusForMainScopeChange:", v10);
    }
    [v10 setLibraryInfo:0];
    [v10 setStagingScopeIdentifier:0];
    if ([v10 scopeType])
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver cpl_archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "cpl_archivedDataWithRootObject:",  v10));
      uint64_t v20 = objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_libraryInfoVar + 4),  v11));
      id v21 = (void *)v20;
      if (v19 && v20)
      {
        if (([(id)v19 isEqual:v20] & 1) == 0)
        {
LABEL_8:
          id v39 = v21;
          id v22 = v12;
          uint64_t v23 = *(uint64_t *)((char *)&self->_libraryInfoVar + 4);
          id v42 = v15;
          unsigned int v24 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v19,  v23,  v11,  &v42);
          id v25 = v42;

          if (v24)
          {
            *a5 = 1;
            __int16 v26 = v25;
            id v12 = v22;
            id v21 = v39;
            goto LABEL_18;
          }

          BOOL v27 = 0;
          __int16 v26 = v25;
          id v12 = v22;
          id v21 = v39;
          goto LABEL_32;
        }
      }

      else if (v19 | v20)
      {
        goto LABEL_8;
      }

      if (*a5)
      {
        __int16 v26 = v15;
LABEL_18:
        uint64_t v31 = objc_opt_class(&OBJC_CLASS___CPLStagingScopeChange);
        if ((objc_opt_isKindOfClass(v10, v31) & 1) != 0)
        {
          BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v10 stagedScopeChange]);
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 scopeIdentifier]);

          if (v33)
          {
            if (!_CPLSilentLogging)
            {
              id v34 = sub_100140908();
              id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v45 = v11;
                __int16 v46 = 2114;
                unint64_t v47 = v33;
                _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Setting staged scope for %@ to %{public}@",  buf,  0x16u);
              }
            }

            uint64_t v36 = *(uint64_t *)((char *)&self->_uploadComputeStateTodoVar + 4);
            id v41 = v26;
            BOOL v27 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v33,  v36,  v11,  &v41);
            id v37 = v41;

            __int16 v26 = v37;
          }

          else
          {
            BOOL v27 = 1;
          }
        }

        else
        {
          BOOL v27 = 1;
        }

        goto LABEL_32;
      }

      BOOL v27 = 1;
      __int16 v26 = v15;
LABEL_32:

      LOBYTE(v27) = v27;
      id v15 = v26;
      goto LABEL_33;
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_libraryInfoVar + 4),  v11));
    if (v28)
    {
      uint64_t v29 = *(uint64_t *)((char *)&self->_libraryInfoVar + 4);
      id v40 = v15;
      BOOL v27 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  0LL,  v29,  v11,  &v40);
      id v30 = v40;

      if (v27)
      {
        LOBYTE(v27) = 1;
        *a5 = 1;
      }

      id v15 = v30;
    }

    else
    {
      LOBYTE(v27) = 1;
    }
  }

  else
  {
    LOBYTE(v27) = 0;
  }

- (id)lastScopeChangeUpdateDateForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_scopeChangeVar + 4),  a3);
}

- (Class)_transportGroupClass
{
  BOOL v3 = *(PQLInjecting **)((char *)&self->_injectionForScopesAllowingPullFromTransport + 4);
  if (!v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage abstractObject](self, "abstractObject"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 engineStore]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 engineLibrary]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 transport]);
    *(PQLInjecting **)((char *)&self->_injectionForScopesAllowingPullFromTransport + 4) = (PQLInjecting *)[v8 transportGroupClass];

    BOOL v3 = *(PQLInjecting **)((char *)&self->_injectionForScopesAllowingPullFromTransport + 4);
    if (!v3) {
      sub_1001996E0((uint64_t)a2, (uint64_t)self);
    }
  }

  return (Class)v3;
}

- (id)_transportGroupForColumnVariable:(id)a3 forScope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v6,  v7));
  if (v8) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:class:]( &OBJC_CLASS___NSKeyedUnarchiver,  "cpl_safeUnarchiveObjectWithData:class:",  v8,  -[CPLPrequeliteScopeStorage _transportGroupClass](self, "_transportGroupClass")));
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

- (BOOL)_storeTransportGroup:(id)a3 inColumnVariable:(id)a4 forScope:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver cpl_archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "cpl_archivedDataWithRootObject:",  v11));
    if (!v14) {
      sub_100199854((uint64_t)v11, (uint64_t)a2, (uint64_t)self);
    }
  }

  else
  {
    unsigned int v14 = 0LL;
  }

  BOOL v15 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v14,  v12,  v13,  a6);
  if (!v15)
  {
    if (!_CPLSilentLogging)
    {
      id v16 = sub_100140908();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412546;
        id v20 = v11;
        __int16 v21 = 2112;
        uint64_t v22 = 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Can't save group %@: %@",  (uint8_t *)&v19,  0x16u);
      }
    }

    if (a6) {
      *a6 = 0LL;
    }
  }

  return v15;
}

- (void)_discardCachedValuesForGroup:(id)a3
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "variables", 0));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) discardCachedValue];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

- (BOOL)resetSyncStateForScope:(id)a3 error:(id *)a4
{
  uint64_t v6 = *(uint64_t *)((char *)&self->_transportScopeVar + 4);
  id v7 = a3;
  -[CPLPrequeliteScopeStorage _discardCachedValuesForGroup:](self, "_discardCachedValuesForGroup:", v6);
  -[CPLPrequeliteScopeStorage _discardCachedValuesForGroup:]( self,  "_discardCachedValuesForGroup:",  *(CPLPrequeliteVariable **)((char *)&self->_supervisorInfoVar + 4));
  -[CPLPrequeliteScopeStorage _discardCachedValuesForGroup:]( self,  "_discardCachedValuesForGroup:",  *(CPLPrequeliteTodoVar **)((char *)&self->_pushToTransportTodoVar + 4));
  [*(id *)(&self->_noteEndOfResetIfNecessary + 4) discardCachedValue];
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) injectionForDefaultValuesUpdate]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_supervisorInfoVar + 4) injectionForDefaultValuesUpdate]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_pushToTransportTodoVar + 4) lastCompletionDateVar]);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar]);
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v7 scopeIdentifier]);

  unsigned __int8 v16 = [v9 cplExecute:@"UPDATE %@ SET %@, %@, %@ = NULL WHERE %@ = %@", v10, v11, v12, v13, v14, v15];
  if (a4 && (v16 & 1) == 0) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([v9 lastError]);
  }

  return v16;
}

- (id)uploadTransportGroupForScope:(id)a3
{
  id v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uploadTransportGroupVar]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _transportGroupForColumnVariable:forScope:]( self,  "_transportGroupForColumnVariable:forScope:",  v6,  v5));

  return v7;
}

- (BOOL)storeUploadTransportGroup:(id)a3 forScope:(id)a4 error:(id *)a5
{
  __int128 v8 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v9 = a4;
  id v10 = a3;
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uploadTransportGroupVar]);
  LOBYTE(a5) = -[CPLPrequeliteScopeStorage _storeTransportGroup:inColumnVariable:forScope:error:]( self,  "_storeTransportGroup:inColumnVariable:forScope:error:",  v10,  v11,  v9,  a5);

  return (char)a5;
}

- (id)downloadTransportGroupForScope:(id)a3
{
  id v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadTransportGroupVar]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _transportGroupForColumnVariable:forScope:]( self,  "_transportGroupForColumnVariable:forScope:",  v6,  v5));

  return v7;
}

- (BOOL)storeDownloadTransportGroup:(id)a3 forScope:(id)a4 error:(id *)a5
{
  __int128 v8 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v9 = a4;
  id v10 = a3;
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadTransportGroupVar]);
  LOBYTE(a5) = -[CPLPrequeliteScopeStorage _storeTransportGroup:inColumnVariable:forScope:error:]( self,  "_storeTransportGroup:inColumnVariable:forScope:error:",  v10,  v11,  v9,  a5);

  return (char)a5;
}

- (BOOL)didDropSomeRecordsForScope:(id)a3
{
  id v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 droppedSomeRecordsVar]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v6,  v5));

  LOBYTE(v5) = [v7 BOOLValue];
  return (char)v5;
}

- (BOOL)setDidDropSomeRecordsForScope:(id)a3 error:(id *)a4
{
  id v4 = self;
  id v5 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 droppedSomeRecordsVar]);
  LOBYTE(v4) = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( v4,  "_storeValue:forColumnVariable:scope:error:",  &__kCFBooleanTrue,  v7,  v6,  0LL);

  return (char)v4;
}

- (id)syncAnchorForScope:(id)a3 isCommitted:(BOOL *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar]);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v7,  v6));

  if (v8)
  {
    BOOL v9 = 0;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar]);
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v10,  v6));

    BOOL v9 = 1;
  }

  *a4 = v9;

  return v8;
}

- (BOOL)setSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar]);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v10,  v9));

    if (!v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v12,  v9));

      if (v13 && [v8 isEqual:v13])
      {
        if (!_CPLSilentLogging)
        {
          id v14 = sub_100140908();
          BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
            int v30 = 138412290;
            uint64_t v31 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "New sync anchor for %@ is identical to the stored one - there were no changes for this scope",  (uint8_t *)&v30,  0xCu);
          }
        }

        goto LABEL_25;
      }
    }
  }

  if (!_CPLSilentLogging)
  {
    id v17 = sub_100140908();
    unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v19 = (void *)objc_claimAutoreleasedReturnValue([v8 cplSyncAnchorDescription]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
      int v30 = 138412546;
      uint64_t v31 = v19;
      __int16 v32 = 2112;
      id v33 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Storing staged sync anchor %@ for %@",  (uint8_t *)&v30,  0x16u);
    }
  }

  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar]);
  unsigned int v22 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v8,  v21,  v9,  a5);

  if (v22)
  {
    uint64_t v23 = *(void **)(&self->_noteEndOfResetIfNecessary + 4);
    if (v8) {
      [v23 setValue:&__kCFBooleanTrue];
    }
    else {
      [v23 discardCachedValue];
    }
LABEL_25:
    BOOL v28 = 1;
    goto LABEL_26;
  }

  if (!_CPLSilentLogging)
  {
    id v24 = sub_100140908();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v8 cplSyncAnchorDescription]);
      id v27 = *a5;
      int v30 = 138412802;
      uint64_t v31 = v26;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      id v35 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Unable to store sync anchor %@ for %@: %@",  (uint8_t *)&v30,  0x20u);
    }
  }

  BOOL v28 = 0;
LABEL_26:

  return v28;
}

- (BOOL)resetSyncAnchorForScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = sub_100140908();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Resetting sync anchor for %@",  (uint8_t *)&v14,  0xCu);
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar]);
  unsigned int v10 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  0LL,  v9,  v6,  a4);

  if (v10)
  {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar]);
    BOOL v12 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  0LL,  v11,  v6,  a4);
  }

  else
  {
    BOOL v12 = 0;
  }

  [*(id *)(&self->_noteEndOfResetIfNecessary + 4) discardCachedValue];

  return v12;
}

- (void)_markFirstSyncOfPrimaryAsSuccessfulWithScope:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v5,  v4));

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage initialSyncDateForScope:](self, "initialSyncDateForScope:", v4));
    if (!v7)
    {
      if (_CPLSilentLogging)
      {
LABEL_21:

        goto LABEL_22;
      }

      id v13 = sub_100140908();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v18 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Failed to set initial sync date for status (no initial sync date)",  v18,  2u);
      }

- (BOOL)commitSyncAnchorForScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v7,  v6));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainScopeIdentifier](self, "mainScopeIdentifier"));
  unsigned int v11 = [v9 isEqualToString:v10];

  if (v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage initialSyncDateForScope:](self, "initialSyncDateForScope:", v6));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v13,  v6));

    if (!v14) {
      BYTE4(self->_transportGroupClass) = 1;
    }
    id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar]);
    unsigned int v16 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v8,  v15,  v6,  a4);

    if (v16)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar]);
      BOOL v18 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  0LL,  v17,  v6,  a4);

      [*(id *)(&self->_noteEndOfResetIfNecessary + 4) discardCachedValue];
      if (v18 && !v12)
      {
        int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        BOOL v18 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v19,  *(CPLPrequeliteVariable **)((char *)&self->_estimatedAssetCountVar + 4),  v6,  a4);

        if ((v18 & v11) == 1)
        {
          if (!_CPLSilentLogging)
          {
            id v20 = sub_100140908();
            __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
              int v32 = 138412290;
              id v33 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Committing initial sync date for %@ and updating initial sync date in global status",  (uint8_t *)&v32,  0xCu);
            }
          }

          -[CPLPrequeliteScopeStorage _markFirstSyncOfPrimaryAsSuccessfulWithScope:]( self,  "_markFirstSyncOfPrimaryAsSuccessfulWithScope:",  v6);
        }

        else
        {
          if (_CPLSilentLogging) {
            BOOL v27 = 0;
          }
          else {
            BOOL v27 = v18;
          }
          if (!v27) {
            goto LABEL_31;
          }
          id v28 = sub_100140908();
          uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            int v30 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
            int v32 = 138412290;
            id v33 = v30;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Committing initial sync date for %@",  (uint8_t *)&v32,  0xCu);
          }
        }

        goto LABEL_30;
      }

      if ((v18 & v11) == 1)
      {
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage engineLibrary](self, "engineLibrary"));
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 initialSyncDate]);
        if (!v24)
        {
          if (!_CPLSilentLogging)
          {
            id v25 = sub_100140908();
            __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v32) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Force updating missing initial sync date in global status",  (uint8_t *)&v32,  2u);
            }
          }

          -[CPLPrequeliteScopeStorage _markFirstSyncOfPrimaryAsSuccessfulWithScope:]( self,  "_markFirstSyncOfPrimaryAsSuccessfulWithScope:",  v6);
        }

LABEL_30:
        LOBYTE(v18) = 1;
      }
    }

    else
    {
      LOBYTE(v18) = 0;
    }

- (BOOL)hasStagedSyncAnchorForScope:(id)a3
{
  id v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stagedSyncAnchorVar]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v6,  v5));

  return v7 != 0LL;
}

- (BOOL)hasStagedSyncAnchors
{
  v2 = *(void **)(&self->_noteEndOfResetIfNecessary + 4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10014AA00;
  v6[3] = &unk_100247300;
  v6[4] = self;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueWithConstructor:v6]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)discardStagedSyncAnchorForScope:(id)a3 error:(id *)a4
{
  id v6 = *(void **)(&self->_noteEndOfResetIfNecessary + 4);
  id v7 = a3;
  [v6 discardCachedValue];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar]);
  LOBYTE(a4) = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  0LL,  v8,  v7,  a4);

  return (char)a4;
}

- (BOOL)discardStagedSyncAnchorWithScopeFilter:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pqlConnection]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage _injectionForFilter:](self, "_injectionForFilter:", v5));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar]);
    unsigned __int8 v11 = [v7 cplExecute:@"UPDATE %@ SET %@ = NULL WHERE %@", v9, v10, v8];

    [*(id *)(&self->_noteEndOfResetIfNecessary + 4) discardCachedValue];
  }

  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (id)transientSyncAnchorForScope:(id)a3
{
  unsigned __int8 v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 transientSyncAnchorVar]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v6,  v5));

  return v7;
}

- (BOOL)storeTransientSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v9 = a4;
  id v10 = a3;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 transientSyncAnchorVar]);
  LOBYTE(a5) = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v10,  v11,  v9,  a5);

  return (char)a5;
}

- (id)classNameOfRecordsForInitialQueryForScope:(id)a3
{
  unsigned __int8 v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 classForInitialQueryVar]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v6,  v5));

  return v7;
}

- (BOOL)setClassNameOfRecordsForInitialQuery:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v9 = a4;
  id v10 = a3;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 classForInitialQueryVar]);
  LOBYTE(a5) = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v10,  v11,  v9,  a5);

  return (char)a5;
}

- (BOOL)hasScopeFetchedInitialSyncAnchor:(id)a3
{
  unsigned __int8 v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 hasFetchedInitialSyncAnchorVar]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v6,  v5));

  LOBYTE(v5) = [v7 BOOLValue];
  return (char)v5;
}

- (BOOL)setHasFetchedInitialSyncAnchor:(BOOL)a3 forScope:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) hasFetchedInitialSyncAnchorVar]);
  LOBYTE(a5) = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v9,  v10,  v8,  a5);

  return (char)a5;
}

- (BOOL)setInitialSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v9 = a4;
  id v10 = a3;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 initialSyncAnchorVar]);
  LOBYTE(a5) = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v10,  v11,  v9,  a5);

  return (char)a5;
}

- (id)initialSyncAnchorForScope:(id)a3
{
  unsigned __int8 v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 initialSyncAnchorVar]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v6,  v5));

  return v7;
}

- (id)initialSyncDateForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_estimatedAssetCountVar + 4),  a3);
}

- (BOOL)setInitialDownloadDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v8,  *(CPLPrequeliteVariable **)((char *)&self->_initialSyncDateVar + 4),  v9,  a5);
  if (v10)
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainScopeIdentifier](self, "mainScopeIdentifier"));
    unsigned int v13 = [v11 isEqualToString:v12];

    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage engineLibrary](self, "engineLibrary"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 initialDownloadDate]);
      if (!v15) {
        [v14 updateInitialDownloadDate:v8];
      }
    }
  }

  return v10;
}

- (id)initialDownloadDateForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_initialSyncDateVar + 4),  a3);
}

- (BOOL)hasFinishedAFullSyncForScope:(id)a3
{
  unsigned __int8 v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 syncAnchorVar]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v6,  v5));

  return v7 != 0LL;
}

- (BOOL)allActiveScopesHasFinishedSyncs
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v5 = *(uint64_t *)((char *)&self->_base + 4);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"(%@ & %ld) = 0 AND %@ IS NULL",  v5,  262164LL,  v6));
  LOBYTE(v5) = [v3 table:v4 hasRecordsMatchingQuery:v7] ^ 1;

  return v5;
}

- (id)lastDateOfClearedPushRepositoryForScope:(id)a3
{
  unsigned __int8 v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lastClearedPushVar]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v6,  v5));

  return v7;
}

- (BOOL)storeLastDateOfClearedPushRepository:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v9 = a4;
  id v10 = a3;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 lastClearedPushVar]);
  LOBYTE(a5) = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v10,  v11,  v9,  a5);

  return (char)a5;
}

- (id)lastDateOfCompletedPullFromTransportForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _taskItemCompletionDateForScope:task:]( self,  "_taskItemCompletionDateForScope:task:",  a3,  *(CPLPrequeliteTodoVar **)((char *)&self->_pushToTransportTodoVar + 4));
}

- (unint64_t)supportedFeatureVersionInLastSyncForScope:(id)a3
{
  unsigned __int8 v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 featureVersionVar]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  v6,  v5));

  id v8 = [v7 unsignedIntegerValue];
  return (unint64_t)v8;
}

- (BOOL)storeSupportedFeatureVersionInLastSync:(unint64_t)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) featureVersionVar]);
  LOBYTE(a5) = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v9,  v10,  v8,  a5);

  return (char)a5;
}

- (BOOL)storeEstimatedSize:(unint64_t)a3 estimatedAssetCount:(unint64_t)a4 forScope:(id)a5 error:(id *)a6
{
  id v10 = a5;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  unsigned int v12 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v11,  *(_CPLPrequeliteScopeSyncState **)((char *)&self->_syncState + 4),  v10,  a6);

  if (v12)
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    BOOL v14 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  v13,  *(CPLPrequeliteVariable **)((char *)&self->_estimatedSizeVar + 4),  v10,  a6);
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)estimatedSizeForScope:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(_CPLPrequeliteScopeSyncState **)((char *)&self->_syncState + 4),  a3));
  id v4 = [v3 unsignedLongLongValue];

  return (unint64_t)v4;
}

- (unint64_t)estimatedAssetCountForScope:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_estimatedSizeVar + 4),  a3));
  id v4 = [v3 integerValue];

  return (unint64_t)v4;
}

- (void)_noteEndOfResetIfNecessary
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"%@ IS NULL AND (%@ & %ld) = 0",  v5,  *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4),  28LL));
  unsigned __int8 v7 = [v3 table:v4 hasRecordsMatchingQuery:v6];

  if ((v7 & 1) == 0)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteScopeStorage abstractObject](self, "abstractObject"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 engineStore]);
    [v8 noteResetSyncFinished];
  }

- (void)_getLocalIndexes:(id *)a3 cloudIndexes:(id *)a4 forScopeIdentifiers:(id)a5
{
  id v7 = a5;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (int64_t i = 0LL; i != v12; int64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        int64_t v16 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:]( self,  "localScopeIndexForScopeIdentifier:",  v15);
        if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
          -[NSMutableIndexSet addIndex:](v8, "addIndex:", v16);
        }
        int64_t v17 = -[CPLPrequeliteStorage cloudScopeIndexForScopeIdentifier:]( self,  "cloudScopeIndexForScopeIdentifier:",  v15);
        if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
          -[NSMutableIndexSet addIndex:](v9, "addIndex:", v17);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v12);
  }

  BOOL v18 = v8;
  *a3 = v18;
  int v19 = v9;
  *a4 = v19;
}

- (id)_injectionForFilter:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localIndexes]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 includedScopeIdentifiers]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) localIndexVar]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[PQLConnection cplInjectionFor:isInIndexSet:]( &OBJC_CLASS___PQLConnection,  "cplInjectionFor:isInIndexSet:",  v7,  v5));
LABEL_5:
    id v9 = (void *)v8;

    goto LABEL_6;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 excludedScopeIdentifiers]);

  if (v9)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_modifiedVariables + 4) localIndexVar]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[PQLConnection cplInjectionFor:isNotInIndexSet:]( &OBJC_CLASS___PQLConnection,  "cplInjectionFor:isNotInIndexSet:",  v7,  v5));
    goto LABEL_5;
  }

- (id)filterForIncludedScopeIdentifiers:(id)a3
{
  id v15 = 0LL;
  id v16 = 0LL;
  id v4 = a3;
  -[CPLPrequeliteScopeStorage _getLocalIndexes:cloudIndexes:forScopeIdentifiers:]( self,  "_getLocalIndexes:cloudIndexes:forScopeIdentifiers:",  &v16,  &v15,  v4);
  id v5 = v16;
  id v6 = v15;
  id v7 = sub_10014BAA4();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PQLConnection cplInjectionFor:isInIndexSet:]( &OBJC_CLASS___PQLConnection,  "cplInjectionFor:isInIndexSet:",  v8,  v5));

  id v10 = sub_10014BAA4();
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PQLConnection cplInjectionFor:isInIndexSet:]( &OBJC_CLASS___PQLConnection,  "cplInjectionFor:isInIndexSet:",  v11,  v6));

  uint64_t v13 = -[CPLPrequeliteScopeFilter initWithIncludedScopeIdentifiers:localIndexesInjection:localIndexes:cloudIndexesInjection:cloudIndexes:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteScopeFilter),  "initWithIncludedScopeIdentifiers:localIndexesInjection:localIndexes:cloudIndexesInjection:cloudIndexes:",  v4,  v9,  v5,  v12,  v6);
  return v13;
}

- (id)filterForExcludedScopeIdentifiers:(id)a3
{
  id v15 = 0LL;
  id v16 = 0LL;
  id v4 = a3;
  -[CPLPrequeliteScopeStorage _getLocalIndexes:cloudIndexes:forScopeIdentifiers:]( self,  "_getLocalIndexes:cloudIndexes:forScopeIdentifiers:",  &v16,  &v15,  v4);
  id v5 = v16;
  id v6 = v15;
  id v7 = sub_10014BAA4();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PQLConnection cplInjectionFor:isNotInIndexSet:]( &OBJC_CLASS___PQLConnection,  "cplInjectionFor:isNotInIndexSet:",  v8,  v5));

  id v10 = sub_10014BAA4();
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PQLConnection cplInjectionFor:isInIndexSet:]( &OBJC_CLASS___PQLConnection,  "cplInjectionFor:isInIndexSet:",  v11,  v6));

  uint64_t v13 = -[CPLPrequeliteScopeFilter initWithExcludedScopeIdentifiers:localIndexesInjection:localIndexes:cloudIndexesInjection:cloudIndexes:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteScopeFilter),  "initWithExcludedScopeIdentifiers:localIndexesInjection:localIndexes:cloudIndexesInjection:cloudIndexes:",  v4,  v9,  v5,  v12,  v6);
  return v13;
}

- (BOOL)bumpPullFromTransportExpirationIntervalWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  -[CPLPrequeliteScopeStorage _minimalPullFromTranportExpirationInterval]( self,  "_minimalPullFromTranportExpirationInterval");
  double v8 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_pushToTransportTodoVar + 4) expirationIntervalVar]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_pushToTransportTodoVar + 4) expirationIntervalVar]);
  unsigned int v12 = [v6 cplExecute:@"UPDATE %@ SET %@ = %lu WHERE %@ < %lu", v9, v10, (unint64_t)v8, v11, (unint64_t)v8];

  if (v12)
  {
    uint64_t v13 = (uint64_t)[v6 changes];
    if (v13 >= 1 && !_CPLSilentLogging)
    {
      uint64_t v14 = v13;
      id v15 = sub_100140908();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringForTimeInterval:]( &OBJC_CLASS___CPLDateFormatter,  "stringForTimeInterval:",  v8));
        *(_DWORD *)buf = 138412546;
        id v20 = v17;
        __int16 v21 = 2048;
        uint64_t v22 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Bumped pull-from-transport expiration interval to %@ for %lld scopes",  buf,  0x16u);
      }
    }
  }

  else if (a3)
  {
    *a3 = (id)objc_claimAutoreleasedReturnValue([v6 lastCPLError]);
  }

  return v12;
}

- (id)activationDateForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_initialDownloadDateVar + 4),  a3);
}

- (BOOL)storeActivationDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (-[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  a3,  *(CPLPrequeliteVariable **)((char *)&self->_initialDownloadDateVar + 4),  v8,  a5)
    && -[CPLPrequeliteScopeStorage storeInitialMetadataQueriesDate:forScope:error:]( self,  "storeInitialMetadataQueriesDate:forScope:error:",  0LL,  v8,  a5)
    && -[CPLPrequeliteScopeStorage storeInitialMetadataDownloadDate:forScope:error:]( self,  "storeInitialMetadataDownloadDate:forScope:error:",  0LL,  v8,  a5))
  {
    BOOL v9 = -[CPLPrequeliteScopeStorage storeInitialMingleDate:forScope:error:]( self,  "storeInitialMingleDate:forScope:error:",  0LL,  v8,  a5);
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)initialMetadataQueriesDateForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_initialMetadataDownloadDateVar + 4),  a3);
}

- (BOOL)storeInitialMetadataQueriesDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  return -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  a3,  *(CPLPrequeliteVariable **)((char *)&self->_initialMetadataDownloadDateVar + 4),  a4,  a5);
}

- (id)initialMetadataDownloadDateForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_activationDateVar + 4),  a3);
}

- (BOOL)storeInitialMetadataDownloadDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  return -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  a3,  *(CPLPrequeliteVariable **)((char *)&self->_activationDateVar + 4),  a4,  a5);
}

- (id)initialMingleDateForScope:(id)a3
{
  return -[CPLPrequeliteScopeStorage _valueForColumnVariable:scope:]( self,  "_valueForColumnVariable:scope:",  *(CPLPrequeliteVariable **)((char *)&self->_initialMetadataQueriesDateVar + 4),  a3);
}

- (BOOL)storeInitialMingleDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  return -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:]( self,  "_storeValue:forColumnVariable:scope:error:",  a3,  *(CPLPrequeliteVariable **)((char *)&self->_initialMetadataQueriesDateVar + 4),  a4,  a5);
}

- (void)writeTransactionDidSucceed
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CPLPrequeliteScopeStorage;
  -[CPLPrequeliteStorage writeTransactionDidSucceed](&v3, "writeTransactionDidSucceed");
  if (BYTE4(self->_transportGroupClass))
  {
    -[CPLPrequeliteScopeStorage _noteEndOfResetIfNecessary](self, "_noteEndOfResetIfNecessary");
    BYTE4(self->_transportGroupClass) = 0;
  }

  [*(id *)((char *)&self->_scopeListSyncAnchorVar + 4) removeAllObjects];
}

- (void)writeTransactionDidFail
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLPrequeliteScopeStorage;
  -[CPLPrequeliteStorage writeTransactionDidFail](&v12, "writeTransactionDidFail");
  BYTE4(self->_transportGroupClass) = 0;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = *(id *)((char *)&self->_scopeListSyncAnchorVar + 4);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      double v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "discardCachedValue", (void)v8);
        double v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }

    while (v5);
  }

  [*(id *)(&self->_noteEndOfResetIfNecessary + 4) discardCachedValue];
  [*(id *)((char *)&self->_scopeListSyncAnchorVar + 4) removeAllObjects];
}

- (void).cxx_destruct
{
}

@end