@interface TransparencyManagedDataStore
+ (BOOL)isStrictSecureDecodingEnabled;
+ (id)deserializeLoggableDatas:(id)a3 error:(id *)a4;
+ (id)deserializeNSError:(id)a3 error:(id *)a4;
+ (id)serializeLoggableDatas:(id)a3;
+ (id)serializeNSError:(id)a3;
+ (id)supportedClassTypes;
+ (void)cleanseError:(id *)a3;
- (BOOL)clearAllFailureEvents:(id)a3 error:(id *)a4;
- (BOOL)clearFollowupTicket:(id)a3 uri:(id)a4 error:(id *)a5;
- (BOOL)clearSelfFailureRelatedData:(id)a3 uri:(id)a4 error:(id *)a5;
- (BOOL)clearSelfValidationFollowups:(id)a3 uri:(id)a4 error:(id *)a5;
- (BOOL)clearState:(id *)a3;
- (BOOL)clearStateForApplication:(id)a3 error:(id *)a4;
- (BOOL)createFollowupTicket:(id)a3 uri:(id)a4 startTime:(id)a5 error:(id *)a6;
- (BOOL)deleteCompletedSingleQueryForUris:(id)a3 application:(id)a4 error:(id *)a5;
- (BOOL)deleteDownloadRecord:(unint64_t)a3 application:(id)a4 error:(id *)a5;
- (BOOL)deleteDownloadRecordById:(id)a3 error:(id *)a4;
- (BOOL)deleteDownloadRecords:(id)a3 error:(id *)a4;
- (BOOL)deleteSMTsWithSPKINotIn:(id)a3 application:(id)a4 error:(id *)a5;
- (BOOL)deleteSTHs:(id)a3 logBeginMsLessThan:(unint64_t)a4 error:(id *)a5;
- (BOOL)deleteServerRPCs:(id)a3 error:(id *)a4;
- (BOOL)deleteServerRpcById:(id)a3 error:(id *)a4;
- (BOOL)disableCacheHitsForUris:(id)a3 application:(id)a4 error:(id *)a5;
- (BOOL)drainDataStore;
- (BOOL)failRpcId:(id)a3 failure:(id)a4 error:(id *)a5;
- (BOOL)fetchBooleanPropertyOnMostRecentMapHead:(id)a3 logBeginMs:(unint64_t)a4 propertyName:(id)a5 error:(id *)a6;
- (BOOL)garbageCollectEntity:(id)a3 predicate:(id)a4 error:(id *)a5;
- (BOOL)garbageCollectEntityBatchDelete:(id)a3 predicate:(id)a4 error:(id *)a5;
- (BOOL)hasPendingDownloadForUUID:(id)a3 error:(id *)a4;
- (BOOL)hasPendingSingleQueryForUri:(id)a3 application:(id)a4 error:(id *)a5;
- (BOOL)haveTreeHead:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logType:(int64_t)a7 revision:(unint64_t)a8 gossip:(BOOL)a9 error:(id *)a10;
- (BOOL)ignoreFailureForResults:(id)a3 error:(id *)a4;
- (BOOL)ignoreFailureForUri:(id)a3 application:(id)a4 status:(unint64_t)a5 error:(id *)a6;
- (BOOL)initSelfState:(id)a3 uri:(id)a4 error:(id *)a5;
- (BOOL)isMapStillPopulating:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5;
- (BOOL)logMetricsForApplication:(id)a3 error:(id *)a4;
- (BOOL)logRequestMetricsForApplication:(id)a3 error:(id *)a4;
- (BOOL)logSMTMetricsForApplication:(id)a3 error:(id *)a4;
- (BOOL)logSTHMetricsForApplication:(id)a3 error:(id *)a4;
- (BOOL)onMocLogVerificationMetricsForApplication:(id)a3 error:(id *)a4;
- (BOOL)onQueueRemoveFailures:(id)a3 error:(id *)a4;
- (BOOL)onQueueSetCachedPeerOptInState:(BOOL)a3 uris:(id)a4 application:(id)a5 error:(id *)a6;
- (BOOL)performAndWaitForDeviceId:(id)a3 application:(id)a4 error:(id *)a5 block:(id)a6;
- (BOOL)performAndWaitForDownloadId:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)performAndWaitForFailedEventId:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)performAndWaitForFetchId:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)performAndWaitForPeer:(id)a3 application:(id)a4 error:(id *)a5 block:(id)a6;
- (BOOL)performAndWaitForRequestId:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)performAndWaitForRpcId:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)performAndWaitForVerificationId:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)performBlockWithSelfState:(id)a3 uri:(id)a4 error:(id *)a5 block:(id)a6;
- (BOOL)performCheckWithNewestMap:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5 block:(id)a6;
- (BOOL)performForPendingSMTs:(id)a3 uri:(id)a4 error:(id *)a5 batchSize:(unint64_t)a6 block:(id)a7;
- (BOOL)performForPendingVerfications:(id)a3 uri:(id)a4 responseOlderThan:(id)a5 error:(id *)a6 batchSize:(unint64_t)a7 block:(id)a8;
- (BOOL)persistAndRefaultObject:(id)a3 error:(id *)a4;
- (BOOL)persistAndRefaultObjects:(id)a3 error:(id *)a4;
- (BOOL)persistWithError:(id *)a3;
- (BOOL)populateExistingRequestsToLookupTable:(id *)a3;
- (BOOL)populateMissingLogHeadHashes:(id *)a3;
- (BOOL)resetPeersToPending:(id)a3 error:(id *)a4;
- (BOOL)resetPendingRequests:(id *)a3;
- (BOOL)resetPendingRequests:(id)a3 error:(id *)a4;
- (BOOL)resetRequestsForApplication:(id)a3 error:(id *)a4;
- (BOOL)resetRequestsForTLTReset:(id *)a3;
- (BOOL)resetVerificationsToPending:(id)a3 error:(id *)a4;
- (BOOL)setResponse:(id)a3 downloadId:(id)a4 error:(id *)a5;
- (BOOL)setResponseForRpcId:(id)a3 response:(id)a4 responseStatus:(id)a5 usedReversePush:(BOOL)a6 serverHint:(id)a7 error:(id *)a8;
- (BOOL)setSeenDate:(id)a3 uris:(id)a4 application:(id)a5 error:(id *)a6;
- (BOOL)shouldGarbageCollectSMH:(id)a3 application:(id)a4 logBeginMs:(unint64_t)a5 olderThanRevision:(unint64_t)a6 olderThanDate:(id)a7;
- (BOOL)shouldGarbageCollectSTH:(id)a3 application:(id)a4 logBeginMs:(unint64_t)a5 olderThanDate:(id)a6;
- (NSManagedObjectContext)context;
- (OS_dispatch_queue)peerQueue;
- (TransparencyAnalytics)logger;
- (TransparencyFollowUpProtocol)followup;
- (TransparencyManagedDataStore)initWithController:(id)a3 followup:(id)a4 logger:(id)a5;
- (TransparencyManagedDataStoreController)controller;
- (TransparencyManagedDataStoreProtocol)updateDelegate;
- (TransparencyPeerOverrides)peerOverridesStore;
- (TransparencyStaticKeyStore)staticKeyStore;
- (double)serverRPCTimeoutSeconds;
- (id)copyStatistics:(id *)a3;
- (id)createBatchQuery;
- (id)createBatchQuery:(id)a3 backgroundOpId:(id)a4 error:(id *)a5;
- (id)createBatchQuery:(id)a3 error:(id *)a4;
- (id)createDownloadRecord:(unint64_t)a3 moc:(id)a4 application:(id)a5;
- (id)createFailureEvent:(id)a3 application:(id)a4 optInServer:(id)a5;
- (id)createFetchRecord;
- (id)createFetchRecordForRequestData:(id)a3 request:(id)a4 error:(id *)a5;
- (id)createIDSKTVerification:(id)a3 application:(id)a4 accountKey:(id)a5 idsResponseTime:(id)a6 serverLoggableDatas:(id)a7 optedIn:(unint64_t)a8 type:(unint64_t)a9 syncedLoggableDatas:(id)a10 verificationId:(id)a11 error:(id *)a12;
- (id)createIDSKTVerification:(id)a3 application:(id)a4 verificationInfo:(id)a5 type:(unint64_t)a6 syncedLoggableDatas:(id)a7 verificationId:(id)a8 error:(id *)a9;
- (id)createMapHead;
- (id)createMapHead:(id)a3 application:(id)a4 logBeginTime:(unint64_t)a5 logHeadHash:(id)a6 logType:(int64_t)a7 revision:(unint64_t)a8 populating:(BOOL)a9 gossip:(BOOL)a10;
- (id)createMutation:(id)a3 application:(id)a4 uri:(id)a5 mutationMs:(unint64_t)a6 spkiHash:(id)a7 receiptTime:(id)a8;
- (id)createPeerIDSKTVerification:(id)a3 application:(id)a4 verificationInfo:(id)a5 error:(id *)a6;
- (id)createPeerState:(id)a3 application:(id)a4 error:(id *)a5;
- (id)createRecordFromLoggableData:(id)a3 application:(id)a4;
- (id)createRequest;
- (id)createRequestFailure;
- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 syncedData:(id)a7 idsResponseTime:(id)a8 queryRequest:(id)a9 queryResponse:(id)a10 responseDate:(id)a11 type:(unint64_t)a12 clientId:(id)a13 error:(id *)a14;
- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 syncedData:(id)a7 queryRequest:(id)a8 queryResponse:(id)a9 type:(unint64_t)a10 clientId:(id)a11 error:(id *)a12;
- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 syncedData:(id)a7 queryRequest:(id)a8 queryResponse:(id)a9 type:(unint64_t)a10 error:(id *)a11;
- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 type:(unint64_t)a7 error:(id *)a8;
- (id)createSignedMutationTimestampsFailure;
- (id)createSignedTreeHeadFailure;
- (id)createSingleQuery;
- (id)createSingleQuery:(id)a3 backgroundOpId:(id)a4 error:(id *)a5;
- (id)createSingleQuery:(id)a3 error:(id *)a4;
- (id)createTreeHead;
- (id)createTreeHead:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logHeadHash:(id)a7 logType:(int64_t)a8 revision:(unint64_t)a9 gossip:(BOOL)a10;
- (id)downloadRecords:(id *)a3;
- (id)failedHeadSignaturesWithRevisions:(id)a3 application:(id)a4;
- (id)fetchCompletedRequests:(id)a3 olderThan:(id)a4 error:(id *)a5;
- (id)fetchDownloadRecord:(unint64_t)a3 application:(id)a4 error:(id *)a5;
- (id)fetchDownloadRecordById:(id)a3 error:(id *)a4;
- (id)fetchFetchRecordById:(id)a3 error:(id *)a4;
- (id)fetchLatestSingleQueryByUri:(id)a3 application:(id)a4 error:(id *)a5;
- (id)fetchNumericPropertyOnMostRecentMapHead:(id)a3 logBeginMs:(unint64_t)a4 propertyName:(id)a5 error:(id *)a6;
- (id)fetchOrCreateVerification:(id)a3 application:(id)a4 verificationInfo:(id)a5 fetchNow:(BOOL)a6 error:(id *)a7;
- (id)fetchPeer:(id)a3 application:(id)a4 error:(id *)a5;
- (id)fetchRecentFailureEvents:(id)a3 fetchLimit:(unint64_t)a4 error:(id *)a5;
- (id)fetchRequestForUUID:(id)a3 error:(id *)a4;
- (id)fetchRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 youngerThan:(id)a7 error:(id *)a8;
- (id)fetchRequestsForURI:(id)a3 error:(id *)a4;
- (id)fetchServerRpcById:(id)a3 error:(id *)a4;
- (id)fetchTreeHead:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logType:(int64_t)a7 revision:(unint64_t)a8 error:(id *)a9;
- (id)fetchTreeHeadsWithoutHash:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logType:(int64_t)a7 revision:(unint64_t)a8 error:(id *)a9;
- (id)getLatestSuccessfulBatchQueryForUri:(id)a3 application:(id)a4 requestYoungerThan:(id)a5 error:(id *)a6;
- (id)getLatestSuccessfulSingleQueryForUri:(id)a3 application:(id)a4 requestYoungerThan:(id)a5 error:(id *)a6;
- (id)getOptInStatus:(id)a3 application:(id)a4 error:(id *)a5;
- (id)getPendingSmtUris:(id)a3 fetchLimit:(unint64_t)a4 error:(id *)a5;
- (id)getTapToRadarDate:(id)a3;
- (id)initializeServerRPC:(id)a3 application:(int)a4 backgroundOpId:(id)a5 request:(id)a6;
- (id)latestConsistencyVerifiedTreeHeadRevision:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5;
- (id)latestConsistencyVerifiedTreeHeadSTH:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5;
- (id)onMocFetchVerificationForVerificationId:(id)a3 error:(id *)a4;
- (id)onMocSetPendingResultForVerification:(id)a3;
- (id)peerVerificationIdForUri:(id)a3 application:(id)a4 verificationInfo:(id)a5 newerThan:(id)a6 error:(id *)a7;
- (id)pendingVerificationURIs:(id)a3 fetchLimit:(unint64_t)a4 error:(id *)a5;
- (id)requestFailures:(id *)a3;
- (id)requestIds:(id *)a3;
- (id)requests:(id *)a3;
- (id)retainContext;
- (id)signedMutationTimestamps:(id *)a3;
- (id)signedMutationTimestampsFailures:(id *)a3;
- (id)signedTreeHeadFailures:(id *)a3;
- (id)treeHeads:(id *)a3;
- (id)treeHeadsForApplication:(id)a3 error:(id *)a4;
- (id)unverifiedRevisions:(id)a3 isMapHead:(BOOL)a4 inclusion:(BOOL)a5 logBeginMs:(unint64_t)a6 error:(id *)a7;
- (id)verifierResultForPeer:(id)a3 application:(id)a4;
- (int64_t)contextRefCount;
- (unint64_t)checkFollowupTicket:(id)a3 uri:(id)a4 checkTime:(id)a5 error:(id *)a6;
- (unint64_t)countOutstandingRequestsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countOutstandingSMHsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countOutstandingSMTsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countOutstandingSTHsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countOutstandingVerificationsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countTotalRequestsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countTotalSMTsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countTotalSTHsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countTotalVerificationsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)newestMapRevision:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5;
- (unint64_t)onMocCountEntity:(id)a3 predicate:(id)a4 error:(id *)a5;
- (unint64_t)requestCount:(id *)a3;
- (unint64_t)requestFailureCount:(id *)a3;
- (unint64_t)signedMutationTimestampCount:(id *)a3;
- (unint64_t)signedMutationTimestampsFailureCount:(id *)a3;
- (unint64_t)signedTreeHeadFailureCount:(id *)a3;
- (unint64_t)treeHeadCount:(id *)a3;
- (void)clearFailureEvents:(id)a3 completionBlock:(id)a4;
- (void)clearPeerState:(id)a3 uris:(id)a4 error:(id *)a5;
- (void)createIDSVerificationID:(id)a3 verification:(id)a4;
- (void)createKTRequestID:(id)a3 request:(id)a4;
- (void)createSelfValidationState:(id)a3 uri:(id)a4 error:(id *)a5;
- (void)deleteNonRecentVerificationsForApplication:(id)a3 error:(id *)a4;
- (void)deleteObject:(id)a3;
- (void)deleteObjectSet:(id)a3;
- (void)errorsForFailedEvents:(id)a3 completionBlock:(id)a4;
- (void)failHeadDownload:(id)a3 failure:(id)a4 logClient:(id)a5;
- (void)failHeadDownloadRecord:(id)a3 failure:(id)a4 error:(id *)a5;
- (void)fetchSelfValidationState:(id)a3 uri:(id)a4 error:(id *)a5;
- (void)garbageCollectRequests:(id)a3 olderThan:(id)a4 error:(id *)a5;
- (void)garbageCollectSMHs:(id)a3 logBeginMs:(unint64_t)a4 olderThanRevision:(unint64_t)a5 olderThanDate:(id)a6 error:(id *)a7;
- (void)garbageCollectSMTs:(id *)a3;
- (void)garbageCollectSTHs:(id)a3 logBeginMs:(unint64_t)a4 olderThanDate:(id)a5 error:(id *)a6;
- (void)garbageCollectServerRPCs:(id *)a3;
- (void)garbageCollectVerifications:(id *)a3;
- (void)onMocSetMapHead:(id)a3 inclusionResult:(unint64_t)a4 inclusionError:(id)a5;
- (void)onMocSetMapHead:(id)a3 mmdResult:(unint64_t)a4 mmdError:(id)a5;
- (void)onMocSetMapHead:(id)a3 signatureResult:(unint64_t)a4 signatureError:(id)a5;
- (void)peers:(id)a3;
- (void)performAndWaitForLatestSelfRequest:(id)a3 accountKey:(id)a4 block:(id)a5;
- (void)performBlock:(id)a3;
- (void)performBlockAndWait:(id)a3;
- (void)performBlockAndWaitWithMoc:(id)a3;
- (void)performForPendingSTHs:(id)a3 olderThan:(id)a4 type:(unint64_t)a5 error:(id *)a6 block:(id)a7;
- (void)performForRequestsWithPendingResponses:(id)a3 error:(id *)a4 block:(id)a5;
- (void)performForSMHsWithUnverifiedMMD:(id)a3 error:(id *)a4 block:(id)a5;
- (void)performForSMTsWithUnverifiedSignature:(id)a3 error:(id *)a4 block:(id)a5;
- (void)performForSTHs:(id)a3 isMapHead:(BOOL)a4 revision:(id)a5 error:(id *)a6 block:(id)a7;
- (void)performForSTHsWithUnverifiedSignature:(id)a3 error:(id *)a4 block:(id)a5;
- (void)performOnBatchesOfEntity:(id)a3 predicate:(id)a4 enforceMax:(BOOL)a5 error:(id *)a6 block:(id)a7;
- (void)performOnRequestsForPredicate:(id)a3 enforceMax:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (void)recalculateVerifierResultForPeer:(id)a3 application:(id)a4 after:(double)a5;
- (void)refaultObject:(id)a3;
- (void)refaultObjects:(id)a3;
- (void)releaseContext;
- (void)removeFailuresOnOptIn:(id)a3;
- (void)reportCoreDataEventForEntity:(id)a3 hardFailure:(BOOL)a4 write:(BOOL)a5 code:(int64_t)a6 underlyingError:(id)a7;
- (void)reportCoreDataEventForEntity:(id)a3 write:(BOOL)a4 code:(int64_t)a5 underlyingError:(id)a6;
- (void)reportCoreDataPersistEventForLocation:(id)a3 underlyingError:(id)a4;
- (void)reportFailedRevisions:(id)a3 failure:(id)a4 downloadType:(unint64_t)a5 application:(id)a6;
- (void)saveAndRefaultObject:(id)a3;
- (void)setCachedPeerOptInState:(BOOL)a3 uris:(id)a4 application:(id)a5;
- (void)setContext:(id)a3;
- (void)setContextRefCount:(int64_t)a3;
- (void)setController:(id)a3;
- (void)setFollowup:(id)a3;
- (void)setLogger:(id)a3;
- (void)setPeerOverridesStore:(id)a3;
- (void)setPeerQueue:(id)a3;
- (void)setServerRPCTimeoutSeconds:(double)a3;
- (void)setStaticKeyStore:(id)a3;
- (void)setUpdateDelegate:(id)a3;
- (void)storeTTR:(id)a3 withType:(id)a4;
- (void)updateIDSCacheWithResults:(id)a3;
@end

@implementation TransparencyManagedDataStore

- (id)createPeerState:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"PeerState",  v10));

  [v11 setUri:v9];
  [v11 setApplication:v8];

  if (-[TransparencyManagedDataStore persistWithError:](self, "persistWithError:", a5))
  {
    id v13 = v11;
  }

  else
  {
    objc_msgSend((id)objc_opt_class(self, v12), "cleanseError:", a5);
    id v13 = 0LL;
  }

  return v13;
}

- (id)fetchPeer:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"PeerState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"uri = %@ && application = %@",  v9,  v8));

  [v10 setPredicate:v11];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 executeFetchRequest:v10 error:a5]);

  objc_msgSend((id)objc_opt_class(self, v14), "cleanseError:", a5);
  if (v13 && [v13 count]) {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:0]);
  }
  else {
    v15 = 0LL;
  }

  return v15;
}

- (BOOL)performAndWaitForPeer:(id)a3 application:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  char v34 = 0;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_10001254C;
  v29 = sub_10001255C;
  id v30 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100012564;
  v19[3] = &unk_100277478;
  v19[4] = self;
  id v13 = v10;
  id v20 = v13;
  id v14 = v11;
  id v21 = v14;
  v23 = &v25;
  id v15 = v12;
  id v22 = v15;
  v24 = &v31;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v19);
  if (a5)
  {
    v16 = (void *)v26[5];
    if (v16) {
      *a5 = v16;
    }
  }

  char v17 = *((_BYTE *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (BOOL)resetPeersToPending:(id)a3 error:(id *)a4
{
  uint64_t v16 = 0LL;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_10001254C;
  id v20 = sub_10001255C;
  id v21 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100012810;
  v12[3] = &unk_1002774A0;
  id v13 = self;
  id v15 = &v16;
  id v5 = a3;
  id v14 = v5;
  -[TransparencyManagedDataStore performBlockAndWait:](v13, "performBlockAndWait:", v12);
  v6 = v17;
  if (a4)
  {
    v7 = (void *)v17[5];
    if (v7)
    {
      *a4 = v7;
      v6 = v17;
    }
  }

  uint64_t v8 = v6[5];
  if (v8)
  {
    if (qword_1002E6410 != -1) {
      dispatch_once(&qword_1002E6410, &stru_1002774C0);
    }
    id v9 = (os_log_s *)qword_1002E6418;
    if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = v17[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "failed to reset peer states to pending: %@",  buf,  0xCu);
    }
  }

  _Block_object_dispose(&v16, 8);
  return v8 == 0;
}

- (void)peers:(id)a3
{
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x3032000000LL;
  v8[3] = sub_10001254C;
  v8[4] = sub_10001255C;
  id v9 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100012B4C;
  v4[3] = &unk_100277508;
  id v5 = self;
  v7 = v8;
  id v3 = a3;
  id v6 = v3;
  -[TransparencyManagedDataStore performBlockAndWait:](v5, "performBlockAndWait:", v4);

  _Block_object_dispose(v8, 8);
}

- (BOOL)setSeenDate:(id)a3 uris:(id)a4 application:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_10001254C;
  uint64_t v31 = sub_10001255C;
  id v32 = 0LL;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100012F9C;
  v22[3] = &unk_100277550;
  v22[4] = self;
  v26 = &v27;
  id v13 = v11;
  id v23 = v13;
  id v14 = v12;
  id v24 = v14;
  id v15 = v10;
  id v25 = v15;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v22);
  uint64_t v16 = v28;
  if (a6)
  {
    char v17 = (void *)v28[5];
    if (v17)
    {
      *a6 = v17;
      uint64_t v16 = v28;
    }
  }

  uint64_t v18 = v16[5];
  if (v18)
  {
    if (qword_1002E6410 != -1) {
      dispatch_once(&qword_1002E6410, &stru_100277570);
    }
    v19 = (os_log_s *)qword_1002E6418;
    if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = v28[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "failed to update seen date: %@", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v27, 8);
  return v18 == 0;
}

- (void)updateIDSCacheWithResults:(id)a3
{
  id v4 = a3;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v45 objects:v62 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v46;
    *(void *)&__int128 v6 = 141558786LL;
    __int128 v36 = v6;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uri", v36));
        BOOL v11 = v10 == 0LL;

        if (!v11)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 uri]);
          [v38 addObject:v12];

          *(void *)v58 = 0LL;
          *(void *)&v58[8] = v58;
          *(void *)&v58[16] = 0x3032000000LL;
          v59 = sub_10001254C;
          v60 = sub_10001255C;
          id v61 = 0LL;
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 uri]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 application]);
          id v15 = (id *)(*(void *)&v58[8] + 40LL);
          id v44 = *(id *)(*(void *)&v58[8] + 40LL);
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472LL;
          v43[2] = sub_1000137D8;
          v43[3] = &unk_100277598;
          v43[4] = v9;
          v43[5] = self;
          v43[6] = v58;
          -[TransparencyManagedDataStore performAndWaitForPeer:application:error:block:]( self,  "performAndWaitForPeer:application:error:block:",  v13,  v14,  &v44,  v43);
          objc_storeStrong(v15, v44);

          if (*(void *)(*(void *)&v58[8] + 40LL))
          {
            if (qword_1002E6410 != -1) {
              dispatch_once(&qword_1002E6410, &stru_1002775B8);
            }
            uint64_t v16 = (os_log_s *)(id)qword_1002E6418;
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              char v17 = (void *)objc_claimAutoreleasedReturnValue([v9 uri]);
              uint64_t String = KTUIStatusGetString([v9 uiStatus]);
              v19 = (void *)objc_claimAutoreleasedReturnValue(String);
              uint64_t v20 = *(void *)(*(void *)&v58[8] + 40LL);
              *(_DWORD *)buf = v36;
              uint64_t v51 = 1752392040LL;
              __int16 v52 = 2112;
              v53 = v17;
              __int16 v54 = 2114;
              v55 = v19;
              __int16 v56 = 2112;
              uint64_t v57 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "failed to update peer state for %{mask.hash}@ with %{public}@ sent to IDS: %@",  buf,  0x2Au);
            }
          }

          _Block_object_dispose(v58, 8);
        }

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v5 != v8);
      id v5 = [obj countByEnumeratingWithState:&v45 objects:v62 count:16];
    }

    while (v5);
  }

  if (qword_1002E6410 != -1) {
    dispatch_once(&qword_1002E6410, &stru_1002775D8);
  }
  id v21 = (void *)qword_1002E6418;
  if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = v21;
    id v23 = [v38 count];
    id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "componentsJoinedByString:", @", "));
    *(_DWORD *)v58 = 134218242;
    *(void *)&v58[4] = v23;
    *(_WORD *)&v58[12] = 2112;
    *(void *)&v58[14] = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "calling IDS with %lu results for %@",  v58,  0x16u);
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v25 = obj;
  id v26 = [v25 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v40;
    do
    {
      v28 = 0LL;
      do
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v25);
        }
        uint64_t v29 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)v28);
        if (qword_1002E6410 != -1) {
          dispatch_once(&qword_1002E6410, &stru_1002775F8);
        }
        id v30 = (void *)qword_1002E6418;
        if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = v30;
          uint64_t v32 = KTUIStatusGetString([v29 uiStatus]);
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          uint64_t v34 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v29 uri]);
          *(_DWORD *)v58 = 138543874;
          *(void *)&v58[4] = v33;
          *(_WORD *)&v58[12] = 2160;
          *(void *)&v58[14] = 1752392040LL;
          *(_WORD *)&v58[22] = 2112;
          v59 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "calling IDS with UIStatus %{public}@ for uri %{mask.hash}@",  v58,  0x20u);
        }

        v28 = (char *)v28 + 1;
      }

      while (v26 != v28);
      id v26 = [v25 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }

    while (v26);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore updateDelegate](self, "updateDelegate"));
  [v35 peerVerificationUpdated:v25];
}

- (BOOL)ignoreFailureForResults:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v28;
    char v25 = 1;
    *(void *)&__int128 v9 = 141558274LL;
    __int128 v24 = v9;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v12);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uri", v24));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 application]);
        unsigned int v16 = -[TransparencyManagedDataStore ignoreFailureForUri:application:status:error:]( self,  "ignoreFailureForUri:application:status:error:",  v14,  v15,  [v13 uiStatus],  a4);

        if (v16)
        {
          if (qword_1002E6410 != -1) {
            dispatch_once(&qword_1002E6410, &stru_100277618);
          }
          char v17 = (void *)qword_1002E6418;
          if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_INFO))
          {
            uint64_t v18 = v17;
            v19 = (void *)objc_claimAutoreleasedReturnValue([v13 uri]);
            *(_DWORD *)buf = v24;
            uint64_t v32 = 1752392040LL;
            __int16 v33 = 2112;
            uint64_t v34 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "ignoreFailure for %{mask.hash}@, will update IDS cache",  buf,  0x16u);
          }

          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v13 uri]);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v13 application]);
          id v22 = (void *)objc_claimAutoreleasedReturnValue( -[TransparencyManagedDataStore verifierResultForPeer:application:]( self,  "verifierResultForPeer:application:",  v20,  v21));
          [v26 addObject:v22];
        }

        else
        {
          char v25 = 0;
        }

        [v13 setSentToIDS:1];
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }

    while (v10);
  }

  else
  {
    char v25 = 1;
  }

  -[TransparencyManagedDataStore updateIDSCacheWithResults:](self, "updateIDSCacheWithResults:", v26);
  return v25 & 1;
}

- (BOOL)ignoreFailureForUri:(id)a3 application:(id)a4 status:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v24 = 0LL;
  char v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  __int128 v27 = sub_10001254C;
  __int128 v28 = sub_10001255C;
  id v29 = 0LL;
  id obj = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100013E3C;
  v18[3] = &unk_100277660;
  unint64_t v22 = a5;
  v18[4] = self;
  id v11 = a4;
  id v19 = v11;
  id v12 = v10;
  id v20 = v12;
  id v21 = &v24;
  BOOL v13 = -[TransparencyManagedDataStore performAndWaitForPeer:application:error:block:]( self,  "performAndWaitForPeer:application:error:block:",  v12,  v11,  &obj,  v18);
  objc_storeStrong(&v29, obj);
  if (!v13)
  {
    if (qword_1002E6410 != -1) {
      dispatch_once(&qword_1002E6410, &stru_100277680);
    }
    id v14 = (os_log_s *)qword_1002E6418;
    if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = v25[5];
      *(_DWORD *)buf = 138544130;
      id v31 = v11;
      __int16 v32 = 2160;
      uint64_t v33 = 1752392040LL;
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2112;
      uint64_t v37 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "unable to ignore error for application=%{public}@ uri=%{mask.hash}@: %@",  buf,  0x2Au);
    }

    if (a6)
    {
      unsigned int v16 = (void *)v25[5];
      if (v16) {
        *a6 = v16;
      }
    }
  }

  _Block_object_dispose(&v24, 8);
  return v13;
}

- (id)getOptInStatus:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  unsigned int v16 = sub_10001254C;
  char v17 = sub_10001255C;
  id v18 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100014190;
  v12[3] = &unk_1002776A8;
  void v12[4] = &v13;
  -[TransparencyManagedDataStore performAndWaitForPeer:application:error:block:]( self,  "performAndWaitForPeer:application:error:block:",  v8,  v9,  a5,  v12);
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (id)verifierResultForPeer:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0LL;
  unint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_10001254C;
  char v25 = sub_10001255C;
  uint64_t v26 = 0LL;
  uint64_t v26 = -[KTVerifierResult initWithUri:application:]( objc_alloc(&OBJC_CLASS___KTVerifierResult),  "initWithUri:application:",  v6,  v7);
  id v20 = 0LL;
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  uint64_t v15 = sub_100014394;
  unsigned int v16 = &unk_1002776F0;
  char v17 = self;
  id v19 = &v21;
  id v8 = v6;
  id v18 = v8;
  unsigned __int8 v9 = -[TransparencyManagedDataStore performAndWaitForPeer:application:error:block:]( self,  "performAndWaitForPeer:application:error:block:",  v8,  v7,  &v20,  &v13);
  id v10 = v20;
  if ((v9 & 1) == 0) {
    objc_msgSend((id)v22[5], "setFailure:", v10, v13, v14, v15, v16, v17);
  }
  id v11 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (void)recalculateVerifierResultForPeer:(id)a3 application:(id)a4 after:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id location = 0LL;
  objc_initWeak(&location, self);
  dispatch_time_t v10 = dispatch_time(0LL, (uint64_t)(a5 * 1000000000.0));
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore peerQueue](self, "peerQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100014718;
  v14[3] = &unk_100276C18;
  objc_copyWeak(&v17, &location);
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_after(v10, v11, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (id)onMocSetPendingResultForVerification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uri]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 application]);
  id v7 = -[KTVerifierResult initPendingForUri:application:]( objc_alloc(&OBJC_CLASS___KTVerifierResult),  "initPendingForUri:application:",  v5,  v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 serverLoggableDatas]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 loggableDatas]);
  [v7 setLoggableDatas:v9];

  dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 accountKey]);
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 accountKey]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:error:]( &OBJC_CLASS___KTAccountPublicID,  "ktAccountPublicIDWithPublicKeyInfo:error:",  v11,  0LL));
    [v7 setPublicID:v12];
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 peerState]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore staticKeyStore](self, "staticKeyStore"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v13 updateResultWithStaticKey:v7 staticKeyStore:v14 forDate:v15];

  id v16 = [v7 uiStatus];
  if (v16 != [v13 lastIDSCacheUIStatus])
  {
    if (qword_1002E6410 != -1) {
      dispatch_once(&qword_1002E6410, &stru_100277710);
    }
    id v17 = (void *)qword_1002E6418;
    if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      *(_DWORD *)buf = 134218754;
      id v24 = [v13 lastIDSCacheUIStatus];
      __int16 v25 = 2048;
      id v26 = [v7 uiStatus];
      __int16 v27 = 2160;
      uint64_t v28 = 1752392040LL;
      __int16 v29 = 2112;
      __int128 v30 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "verifierResultForPeer cached UI status changed %lld->%llu for %{mask.hash}@, will update IDS cache",  buf,  0x2Au);
    }

    id v22 = v7;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    -[TransparencyManagedDataStore updateIDSCacheWithResults:](self, "updateIDSCacheWithResults:", v19);

    [v7 setSentToIDS:1];
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore peerOverridesStore](self, "peerOverridesStore"));
  [v20 applyPeerOverrides:v7 peer:v13];

  -[TransparencyManagedDataStore persistAndRefaultObject:error:](self, "persistAndRefaultObject:error:", v13, 0LL);
  return v7;
}

- (void)clearPeerState:(id)a3 uris:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_time_t v10 = v9;
  if (v9 && [v9 count])
  {
    if (qword_1002E6410 != -1) {
      dispatch_once(&qword_1002E6410, &stru_100277730);
    }
    id v11 = (void *)qword_1002E6418;
    if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_DEBUG))
    {
      id v12 = v11;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsJoinedByString:@","]);
      *(_DWORD *)buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Clearing peer state for %@ for %@", buf, 0x16u);
    }

    uint64_t v14 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application = %@ && uri IN %@",  v8,  v10);
  }

  else
  {
    if (qword_1002E6410 != -1) {
      dispatch_once(&qword_1002E6410, &stru_100277750);
    }
    id v15 = (os_log_s *)qword_1002E6418;
    if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Clearing peer state for %@", buf, 0xCu);
    }

    uint64_t v14 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application = %@",  v8,  v17);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (-[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"PeerState",  v16,  a5)
    && -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"IDSKTVerification",  v16,  a5))
  {
    -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"RPCSingleQuery",  v16,  a5);
  }
}

- (void)setCachedPeerOptInState:(BOOL)a3 uris:(id)a4 application:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatch_time_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore peerQueue](self, "peerQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100014DD0;
  v13[3] = &unk_100277778;
  BOOL v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)removeFailuresOnOptIn:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore peerQueue](self, "peerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100014E80;
  v7[3] = &unk_1002777A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)onQueueRemoveFailures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (qword_1002E6410 != -1) {
    dispatch_once(&qword_1002E6410, &stru_1002777C0);
  }
  id v7 = (os_log_s *)qword_1002E6418;
  if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "removing all saved failures for %{public}@ following opt-in",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_10001254C;
  uint64_t v23 = sub_10001255C;
  id v24 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000150FC;
  v15[3] = &unk_1002774A0;
  v15[4] = self;
  p___int128 buf = &buf;
  id v8 = v6;
  id v16 = v8;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  uint64_t v9 = *((void *)&buf + 1);
  if (a4)
  {
    dispatch_time_t v10 = *(void **)(*((void *)&buf + 1) + 40LL);
    if (v10)
    {
      *a4 = v10;
      uint64_t v9 = *((void *)&buf + 1);
    }
  }

  uint64_t v11 = *(void *)(v9 + 40);
  if (v11)
  {
    if (qword_1002E6410 != -1) {
      dispatch_once(&qword_1002E6410, &stru_1002777E0);
    }
    id v12 = (os_log_s *)qword_1002E6418;
    if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(*((void *)&buf + 1) + 40LL);
      *(_DWORD *)id v18 = 138412290;
      uint64_t v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "failed to remove failures after opt-in: %@",  v18,  0xCu);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v11 == 0;
}

- (BOOL)onQueueSetCachedPeerOptInState:(BOOL)a3 uris:(id)a4 application:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore peerQueue](self, "peerQueue"));
  dispatch_assert_queue_V2(v12);

  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  __int128 v39 = sub_10001254C;
  __int128 v40 = sub_10001255C;
  id v41 = 0LL;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10001566C;
  v31[3] = &unk_100277828;
  v31[4] = self;
  __int16 v34 = &v36;
  id v13 = v10;
  id v32 = v13;
  id v14 = v11;
  id v33 = v14;
  BOOL v35 = a3;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v31);
  id v15 = v37;
  if (a6)
  {
    id v16 = (void *)v37[5];
    if (v16)
    {
      *a6 = v16;
      id v15 = v37;
    }
  }

  uint64_t v17 = v15[5];
  if (v17)
  {
    if (qword_1002E6410 != -1) {
      dispatch_once(&qword_1002E6410, &stru_100277848);
    }
    id v18 = (os_log_s *)qword_1002E6418;
    if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = v37[5];
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v44 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "failed to update opt-in state: %@", buf, 0xCu);
    }
  }

  else
  {
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v21 = v13;
    id v22 = [v21 countByEnumeratingWithState:&v27 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v21);
          }
          __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( -[TransparencyManagedDataStore verifierResultForPeer:application:]( self,  "verifierResultForPeer:application:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)i),  v14,  (void)v27));
          if (v25) {
            [v20 addObject:v25];
          }
        }

        id v22 = [v21 countByEnumeratingWithState:&v27 objects:v42 count:16];
      }

      while (v22);
    }

    -[TransparencyManagedDataStore updateIDSCacheWithResults:](self, "updateIDSCacheWithResults:", v20);
    -[TransparencyManagedDataStore disableCacheHitsForUris:application:error:]( self,  "disableCacheHitsForUris:application:error:",  v21,  v14,  0LL);
    -[TransparencyManagedDataStore deleteCompletedSingleQueryForUris:application:error:]( self,  "deleteCompletedSingleQueryForUris:application:error:",  v21,  v14,  0LL);
  }

  _Block_object_dispose(&v36, 8);
  return v17 == 0;
}

- (id)createMapHead
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"KTTreeHead",  v2));

  return v3;
}

- (id)createMapHead:(id)a3 application:(id)a4 logBeginTime:(unint64_t)a5 logHeadHash:(id)a6 logType:(int64_t)a7 revision:(unint64_t)a8 populating:(BOOL)a9 gossip:(BOOL)a10
{
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createTreeHead](self, "createTreeHead"));
  [v19 setSth:v18];

  [v19 setIsMapHead:1];
  [v19 setApplication:v17];

  [v19 setUnsigned:"logBeginTime" value:a5];
  [v19 setLogHeadHash:v16];

  [v19 setLogType:a7];
  [v19 setUnsigned:"revision" value:a8];
  [v19 setPopulating:a9];
  [v19 setGossip:a10];
  [v19 setReceiptTime:CFAbsoluteTimeGetCurrent()];
  [v19 setInclusionVerified:2];
  [v19 setConsistencyVerified:1];
  return v19;
}

- (BOOL)fetchBooleanPropertyOnMostRecentMapHead:(id)a3 logBeginMs:(unint64_t)a4 propertyName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v29 = 0LL;
  __int128 v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 0;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = sub_10013DC6C;
  __int128 v27 = sub_10013DC7C;
  id v28 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10013DC84;
  v17[3] = &unk_100283918;
  v17[4] = self;
  __int16 v20 = &v23;
  id v12 = v10;
  id v18 = v12;
  unint64_t v22 = a4;
  id v13 = v11;
  id v19 = v13;
  id v21 = &v29;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v17);
  if (a6)
  {
    id v14 = (void *)v24[5];
    if (v14) {
      *a6 = v14;
    }
  }

  char v15 = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (id)fetchNumericPropertyOnMostRecentMapHead:(id)a3 logBeginMs:(unint64_t)a4 propertyName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v29 = 0LL;
  __int128 v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  char v32 = sub_10013DC6C;
  id v33 = sub_10013DC7C;
  id v34 = 0LL;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = sub_10013DC6C;
  __int128 v27 = sub_10013DC7C;
  id v28 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10013E438;
  v17[3] = &unk_100283918;
  v17[4] = self;
  __int16 v20 = &v23;
  id v12 = v10;
  id v18 = v12;
  unint64_t v22 = a4;
  id v13 = v11;
  id v19 = v13;
  id v21 = &v29;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v17);
  if (a6)
  {
    id v14 = (void *)v24[5];
    if (v14) {
      *a6 = v14;
    }
  }

  id v15 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (BOOL)isMapStillPopulating:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  return -[TransparencyManagedDataStore fetchBooleanPropertyOnMostRecentMapHead:logBeginMs:propertyName:error:]( self,  "fetchBooleanPropertyOnMostRecentMapHead:logBeginMs:propertyName:error:",  a3,  a4,  @"populating",  a5);
}

- (unint64_t)newestMapRevision:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  id v12 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TransparencyManagedDataStore fetchNumericPropertyOnMostRecentMapHead:logBeginMs:propertyName:error:]( self,  "fetchNumericPropertyOnMostRecentMapHead:logBeginMs:propertyName:error:",  a3,  a4,  @"revision",  &v12));
  id v7 = v12;
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0LL;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v10 = [v6 unsignedLongLongValue];
  }

  else
  {
    id v10 = 0LL;
    if (a5 && v7)
    {
      id v10 = 0LL;
      *a5 = v7;
    }
  }

  return (unint64_t)v10;
}

- (BOOL)performCheckWithNewestMap:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  __int128 v30 = sub_10013DC6C;
  uint64_t v31 = sub_10013DC7C;
  id v32 = 0LL;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10013EC34;
  v17[3] = &unk_1002839E0;
  v17[4] = self;
  __int16 v20 = &v27;
  id v12 = v10;
  id v21 = &v23;
  unint64_t v22 = a4;
  id v18 = v12;
  id v13 = v11;
  id v19 = v13;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v17);
  if (a5)
  {
    id v14 = (void *)v28[5];
    if (v14) {
      *a5 = v14;
    }
  }

  char v15 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

- (void)garbageCollectSMHs:(id)a3 logBeginMs:(unint64_t)a4 olderThanRevision:(unint64_t)a5 olderThanDate:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  if (qword_1002EE830 != -1) {
    dispatch_once(&qword_1002EE830, &stru_100283A00);
  }
  id v14 = (os_log_s *)qword_1002EE838;
  if (os_log_type_enabled((os_log_t)qword_1002EE838, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 134217984;
    unint64_t v20 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "garbage collecting map heads earlier than revision %llu",  buf,  0xCu);
  }

  char v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"isMapHead == YES && application == %@ && (revision != %llu && receiptTime < %@ || logBeginTime < %llu || logBeginTime == %llu && signatureVerified != %d && inclusionVerified != %d && mmdVerified != %d && revision < %llu)",  v12,  a5,  v13,  a4,  a4,  2LL,  2LL,  2LL,  a5));
  id v18 = 0LL;
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"KTTreeHead",  v15,  &v18);
  id v16 = v18;
  id v17 = v16;
  if (a7 && v16) {
    *a7 = v16;
  }
}

- (BOOL)shouldGarbageCollectSMH:(id)a3 application:(id)a4 logBeginMs:(unint64_t)a5 olderThanRevision:(unint64_t)a6 olderThanDate:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  if ([v11 isMapHead])
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"isMapHead == YES && application == %@ && (revision != %llu && receiptTime < %@ || logBeginTime < %llu || logBeginTime == %llu && signatureVerified != %d && inclusionVerified != %d && mmdVerified != %d && revision < %llu)",  v12,  a6,  v13,  a5,  a5,  2LL,  2LL,  2LL,  a6));
    unsigned __int8 v15 = [v14 evaluateWithObject:v11];
  }

  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (void)onMocSetMapHead:(id)a3 signatureResult:(unint64_t)a4 signatureError:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  [v13 setUnsigned:"signatureVerified" value:a4];
  if (v8)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createSignedTreeHeadFailure](self, "createSignedTreeHeadFailure"));
    objc_msgSend(v9, "setErrorCode:", objc_msgSend(v8, "code"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    [v9 setErrorDomain:v10];

    [v9 setSth:v13];
    [v9 setVerificationType:0];
  }

  if (a4 == 1 && [v13 inclusionVerified] == (id)1 && objc_msgSend(v13, "mmdVerified") == (id)1)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore updateDelegate](self, "updateDelegate"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v13 application]);
    objc_msgSend(v11, "mapHeadUpdated:populating:", v12, objc_msgSend(v13, "populating"));
  }
}

- (void)onMocSetMapHead:(id)a3 mmdResult:(unint64_t)a4 mmdError:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  [v14 setUnsigned:"mmdVerified" value:a4];
  if (v8)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createSignedTreeHeadFailure](self, "createSignedTreeHeadFailure"));
    objc_msgSend(v9, "setErrorCode:", objc_msgSend(v8, "code"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    [v9 setErrorDomain:v10];

    [v9 setSth:v14];
    [v9 setVerificationType:3];
  }

  if ([v14 signatureVerified] == (id)1)
  {
    id v11 = [v14 inclusionVerified];
    if (a4 == 1 && v11 == (id)1)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore updateDelegate](self, "updateDelegate"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v14 application]);
      objc_msgSend(v12, "mapHeadUpdated:populating:", v13, objc_msgSend(v14, "populating"));
    }
  }
}

- (void)onMocSetMapHead:(id)a3 inclusionResult:(unint64_t)a4 inclusionError:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  [v14 setUnsigned:"inclusionVerified" value:a4];
  if (v8)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createSignedTreeHeadFailure](self, "createSignedTreeHeadFailure"));
    objc_msgSend(v9, "setErrorCode:", objc_msgSend(v8, "code"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    [v9 setErrorDomain:v10];

    [v9 setSth:v14];
    [v9 setVerificationType:1];
  }

  id v11 = [v14 signatureVerified];
  if (a4 == 1 && v11 == (id)1 && [v14 mmdVerified] == (id)1)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore updateDelegate](self, "updateDelegate"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v14 application]);
    objc_msgSend(v12, "mapHeadUpdated:populating:", v13, objc_msgSend(v14, "populating"));
  }
}

- (void)createSelfValidationState:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = sub_10014B5B0;
  __int128 v30 = sub_10014B5C0;
  id v31 = 0LL;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_10014B5B0;
  id v24 = sub_10014B5C0;
  id v25 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10014B5C8;
  v15[3] = &unk_10027B708;
  id v18 = &v26;
  v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  id v11 = v9;
  id v17 = v11;
  id v19 = &v20;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a5)
  {
    uint64_t v12 = v21[5];
    if (v12) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:errorLevel:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:errorLevel:underlyingError:description:",  kTransparencyErrorDatabase,  -129LL,  1LL,  v12,  @"couldn't create self state"));
    }
  }

  id v13 = (void *)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (void)fetchSelfValidationState:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = sub_10014B5B0;
  __int128 v30 = sub_10014B5C0;
  id v31 = 0LL;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_10014B5B0;
  id v24 = sub_10014B5C0;
  id v25 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10014B854;
  v15[3] = &unk_100283E70;
  v15[4] = self;
  id v18 = &v20;
  id v10 = v8;
  id v16 = v10;
  id v11 = v9;
  id v17 = v11;
  id v19 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a5)
  {
    uint64_t v12 = v21[5];
    if (v12) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:errorLevel:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:errorLevel:underlyingError:description:",  kTransparencyErrorDatabase,  -128LL,  1LL,  v12,  @"couldn't fetch self state"));
    }
  }

  id v13 = (void *)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (BOOL)initSelfState:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v15 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[TransparencyManagedDataStore fetchSelfValidationState:uri:error:]( self,  "fetchSelfValidationState:uri:error:",  v8,  v9,  &v15));
  id v11 = v15;
  if (!v10)
  {
    id v14 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[TransparencyManagedDataStore createSelfValidationState:uri:error:]( self,  "createSelfValidationState:uri:error:",  v8,  v9,  &v14));
    id v12 = v14;

    id v11 = v12;
  }

  if (a5 && v11) {
    *a5 = v11;
  }

  return v10 != 0LL;
}

- (BOOL)performBlockWithSelfState:(id)a3 uri:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v29 = 0LL;
  __int128 v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  id v32 = sub_10014B5B0;
  id v33 = sub_10014B5C0;
  id v34 = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10014BC94;
  v19[3] = &unk_100283E98;
  v19[4] = self;
  id v13 = v10;
  id v20 = v13;
  id v14 = v11;
  id v21 = v14;
  uint64_t v23 = &v29;
  id v24 = &v25;
  id v15 = v12;
  id v22 = v15;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v19);
  if (a5)
  {
    id v16 = (void *)v30[5];
    if (v16) {
      *a5 = v16;
    }
  }

  char v17 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

- (BOOL)createFollowupTicket:(id)a3 uri:(id)a4 startTime:(id)a5 error:(id *)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10014BEB4;
  v15[3] = &unk_100283EC0;
  id v16 = a5;
  id v10 = v16;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_retainBlock(v15);
  LOBYTE(a6) = -[TransparencyManagedDataStore performBlockWithSelfState:uri:error:block:]( self,  "performBlockWithSelfState:uri:error:block:",  v12,  v11,  a6,  v13);

  return (char)a6;
}

- (unint64_t)checkFollowupTicket:(id)a3 uri:(id)a4 checkTime:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10014C084;
  v23[3] = &unk_100283EE8;
  id v13 = v10;
  id v24 = v13;
  id v14 = v11;
  id v25 = v14;
  id v15 = v12;
  id v26 = v15;
  id v16 = objc_retainBlock(v23);
  id v22 = 0LL;
  unsigned int v17 = -[TransparencyManagedDataStore performBlockWithSelfState:uri:error:block:]( self,  "performBlockWithSelfState:uri:error:block:",  v13,  v14,  &v22,  v16);
  id v18 = v22;
  id v19 = v18;
  if (v18)
  {
    unint64_t v20 = 0LL;
    if (a6) {
      *a6 = v18;
    }
  }

  else if (v17)
  {
    unint64_t v20 = 2LL;
  }

  else
  {
    unint64_t v20 = 1LL;
  }

  return v20;
}

- (BOOL)clearFollowupTicket:(id)a3 uri:(id)a4 error:(id *)a5
{
  return -[TransparencyManagedDataStore performBlockWithSelfState:uri:error:block:]( self,  "performBlockWithSelfState:uri:error:block:",  a3,  a4,  a5,  &stru_100283F28);
}

- (id)initializeServerRPC:(id)a3 application:(int)a4 backgroundOpId:(id)a5 request:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  [v9 setState:2];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v9 setRequestTime:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  [v9 setRpcId:v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationIdentifierForValue:]( &OBJC_CLASS___TransparencyApplication,  "applicationIdentifierForValue:",  v14));
  [v9 setApplication:v15];

  [v9 setRequest:v10];
  [v9 setBackgroundOpId:v11];

  return v9;
}

- (id)createBatchQuery
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"RPCBatchQuery",  v2));

  [v3 setRpcType:1];
  return v3;
}

- (id)createSingleQuery
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"RPCSingleQuery",  v2));

  [v3 setRpcType:0];
  return v3;
}

- (id)createBatchQuery:(id)a3 backgroundOpId:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createBatchQuery](self, "createBatchQuery"));
  id v11 = [v9 application];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 data]);
  id v13 =  -[TransparencyManagedDataStore initializeServerRPC:application:backgroundOpId:request:]( self,  "initializeServerRPC:application:backgroundOpId:request:",  v10,  v11,  v8,  v12);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 uriArray]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v14));
  [v10 setUris:v15];

  if (-[TransparencyManagedDataStore persistWithError:](self, "persistWithError:", a5)) {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 rpcId]);
  }
  else {
    id v16 = 0LL;
  }
  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a5);

  return v16;
}

- (id)createBatchQuery:(id)a3 error:(id *)a4
{
  return -[TransparencyManagedDataStore createBatchQuery:backgroundOpId:error:]( self,  "createBatchQuery:backgroundOpId:error:",  a3,  0LL,  a4);
}

- (id)createSingleQuery:(id)a3 backgroundOpId:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createSingleQuery](self, "createSingleQuery"));
  id v11 = [v9 application];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 data]);
  id v13 =  -[TransparencyManagedDataStore initializeServerRPC:application:backgroundOpId:request:]( self,  "initializeServerRPC:application:backgroundOpId:request:",  v10,  v11,  v8,  v12);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 uri]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v14));
  [v10 setUri:v15];

  if (-[TransparencyManagedDataStore persistWithError:](self, "persistWithError:", a5)) {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 rpcId]);
  }
  else {
    id v16 = 0LL;
  }
  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a5);

  return v16;
}

- (id)createSingleQuery:(id)a3 error:(id *)a4
{
  return -[TransparencyManagedDataStore createSingleQuery:backgroundOpId:error:]( self,  "createSingleQuery:backgroundOpId:error:",  a3,  0LL,  a4);
}

- (BOOL)deleteServerRpcById:(id)a3 error:(id *)a4
{
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = sub_1001628BC;
  id v22 = sub_1001628CC;
  id v23 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001628D4;
  v13[3] = &unk_100284C70;
  id v14 = self;
  id v6 = a3;
  id v15 = v6;
  id v16 = &v18;
  unsigned int v17 = &v24;
  -[TransparencyManagedDataStore performBlockAndWait:](v14, "performBlockAndWait:", v13);
  if (*((_BYTE *)v25 + 24))
  {
    BOOL v7 = 1;
  }

  else
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"ServerRPC",  1LL,  -325LL,  v19[5]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001629AC;
    v10[3] = &unk_100279700;
    id v11 = v6;
    id v12 = &v18;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v10);
    if (a4)
    {
      id v8 = (void *)v19[5];
      if (v8) {
        *a4 = v8;
      }
    }

    BOOL v7 = *((_BYTE *)v25 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v7;
}

- (id)fetchServerRpcById:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"ServerRPC"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"rpcId = %@",  v6));

  [v7 setPredicate:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 executeFetchRequest:v7 error:a4]);

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a4);
  if (v10 && [v10 count]) {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

- (id)fetchLatestSingleQueryByUri:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"RPCSingleQuery"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application = %@ && uri = %@",  v8,  v9));

  [v10 setPredicate:v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"requestTime",  0LL));
  uint64_t v18 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  [v10 setSortDescriptors:v13];

  [v10 setFetchLimit:1];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 executeFetchRequest:v10 error:a5]);

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a5);
  if (v15 && [v15 count]) {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:0]);
  }
  else {
    id v16 = 0LL;
  }

  return v16;
}

- (BOOL)performAndWaitForRpcId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v26 = 0LL;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_1001628BC;
  uint64_t v24 = sub_1001628CC;
  id v25 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100162ED0;
  v15[3] = &unk_100284FD0;
  void v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  uint64_t v18 = &v20;
  id v11 = v9;
  id v17 = v11;
  id v19 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a4)
  {
    id v12 = (void *)v21[5];
    if (v12) {
      *a4 = v12;
    }
  }

  char v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (BOOL)failRpcId:(id)a3 failure:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_1001628BC;
  id v25 = sub_1001628CC;
  id v26 = 0LL;
  id obj = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10016322C;
  v16[3] = &unk_100285018;
  id v9 = a4;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = &v21;
  -[TransparencyManagedDataStore performAndWaitForRpcId:error:block:]( self,  "performAndWaitForRpcId:error:block:",  v8,  &obj,  v16);
  objc_storeStrong(&v26, obj);
  id v10 = (id *)(v22 + 5);
  id v15 = (id)v22[5];
  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", &v15);
  objc_storeStrong(v10, v15);
  id v11 = v22;
  if (a5)
  {
    id v12 = (void *)v22[5];
    if (v12)
    {
      *a5 = v12;
      id v11 = v22;
    }
  }

  BOOL v13 = v11[5] == 0;

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (BOOL)setResponseForRpcId:(id)a3 response:(id)a4 responseStatus:(id)a5 usedReversePush:(BOOL)a6 serverHint:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  uint64_t v38 = sub_1001628BC;
  __int128 v39 = sub_1001628CC;
  id v40 = 0LL;
  id obj = 0LL;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100163578;
  v27[3] = &unk_100285080;
  id v18 = v15;
  id v28 = v18;
  id v19 = v16;
  id v29 = v19;
  BOOL v33 = a6;
  id v20 = v17;
  id v30 = v20;
  uint64_t v31 = self;
  id v32 = &v35;
  -[TransparencyManagedDataStore performAndWaitForRpcId:error:block:]( self,  "performAndWaitForRpcId:error:block:",  v14,  &obj,  v27);
  objc_storeStrong(&v40, obj);
  uint64_t v21 = (id *)(v36 + 5);
  id v26 = (id)v36[5];
  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", &v26);
  objc_storeStrong(v21, v26);
  uint64_t v22 = v36;
  if (a8)
  {
    uint64_t v23 = (void *)v36[5];
    if (v23)
    {
      *a8 = v23;
      uint64_t v22 = v36;
    }
  }

  BOOL v24 = v22[5] == 0;

  _Block_object_dispose(&v35, 8);
  return v24;
}

- (id)getLatestSuccessfulSingleQueryForUri:(id)a3 application:(id)a4 requestYoungerThan:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v26 = 0LL;
  char v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_1001628BC;
  id v30 = sub_1001628CC;
  id v31 = 0LL;
  if (qword_1002EEA38 != -1) {
    dispatch_once(&qword_1002EEA38, &stru_1002850A0);
  }
  BOOL v13 = (os_log_s *)qword_1002EEA40;
  if (os_log_type_enabled((os_log_t)qword_1002EEA40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 141558530;
    uint64_t v33 = 1752392040LL;
    __int16 v34 = 2112;
    id v35 = v10;
    __int16 v36 = 2112;
    id v37 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "getting successful ServerRPC for %{mask.hash}@ younger than %@",  buf,  0x20u);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100163AAC;
  v19[3] = &unk_1002850C8;
  id v14 = v10;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  uint64_t v23 = self;
  BOOL v24 = &v26;
  id v25 = a6;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v19);
  id v17 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v17;
}

- (id)getLatestSuccessfulBatchQueryForUri:(id)a3 application:(id)a4 requestYoungerThan:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_1001628BC;
  id v29 = sub_1001628CC;
  id v30 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100163DBC;
  v18[3] = &unk_1002850C8;
  id v13 = v11;
  id v19 = v13;
  id v14 = v12;
  id v20 = v14;
  id v21 = self;
  BOOL v24 = a6;
  id v15 = v10;
  id v22 = v15;
  uint64_t v23 = &v25;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v18);
  id v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v16;
}

- (BOOL)hasPendingSingleQueryForUri:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_1001628BC;
  id v30 = sub_1001628CC;
  id v31 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  uint64_t v25 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10016427C;
  v17[3] = &unk_1002850F0;
  v17[4] = self;
  id v10 = v8;
  id v18 = v10;
  id v11 = v9;
  id v19 = v11;
  id v20 = &v22;
  id v21 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v17);
  if (v27[5])
  {
    if (qword_1002EEA38 != -1) {
      dispatch_once(&qword_1002EEA38, &stru_100285110);
    }
    id v12 = (os_log_s *)qword_1002EEA40;
    if (os_log_type_enabled((os_log_t)qword_1002EEA40, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = v27[5];
      *(_DWORD *)__int128 buf = 141558530;
      uint64_t v33 = 1752392040LL;
      __int16 v34 = 2112;
      id v35 = v10;
      __int16 v36 = 2112;
      uint64_t v37 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to count number of pending single queries for %{mask.hash}@: %@",  buf,  0x20u);
    }
  }

  if (a5)
  {
    id v14 = (void *)v27[5];
    if (v14) {
      *a5 = v14;
    }
  }

  BOOL v15 = v23[3] != 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

- (void)garbageCollectServerRPCs:(id *)a3
{
  if (qword_1002EEA38 != -1) {
    dispatch_once(&qword_1002EEA38, &stru_100285130);
  }
  id v5 = (os_log_s *)qword_1002EEA40;
  if (os_log_type_enabled((os_log_t)qword_1002EEA40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Garbage collecting pending server RPCs", buf, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(uint64_t)-kTransparencyMaxmimumDownloadRecordLifetime));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"state == %@ && requestTime < %@",  &off_100299BE8,  v6));
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"RPCSingleQuery",  v7,  a3);
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"RPCBatchQuery",  v7,  a3);
  if (qword_1002EEA38 != -1) {
    dispatch_once(&qword_1002EEA38, &stru_100285150);
  }
  id v8 = (os_log_s *)qword_1002EEA40;
  if (os_log_type_enabled((os_log_t)qword_1002EEA40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Garbage collecting completed server RPCs", v11, 2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(uint64_t)-kKTMaximumCompletedRequestLifetime));

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"state != %@ && responseTime < %@",  &off_100299BE8,  v9));
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"RPCSingleQuery",  v10,  a3);
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"RPCBatchQuery",  v10,  a3);
}

- (BOOL)deleteServerRPCs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (qword_1002EEA38 != -1) {
    dispatch_once(&qword_1002EEA38, &stru_100285170);
  }
  BOOL v7 = (os_log_s *)qword_1002EEA40;
  if (os_log_type_enabled((os_log_t)qword_1002EEA40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Deleting cached server RPCs", buf, 2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application == %@",  v6));
  BOOL v9 = -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"ServerRPC",  v8,  a4);

  return v9;
}

- (BOOL)deleteCompletedSingleQueryForUris:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (qword_1002EEA38 != -1) {
    dispatch_once(&qword_1002EEA38, &stru_100285190);
  }
  id v10 = (void *)qword_1002EEA40;
  if (os_log_type_enabled((os_log_t)qword_1002EEA40, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", @", "));
    *(_DWORD *)__int128 buf = 141558274;
    uint64_t v17 = 1752392040LL;
    __int16 v18 = 2112;
    id v19 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Deleting cached server RPCs for %{mask.hash}@",  buf,  0x16u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"uri IN %@ && application == %@ && state != %@",  v8,  v9,  &off_100299BE8));
  BOOL v14 = -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"RPCSingleQuery",  v13,  a5);

  return v14;
}

- (id)createIDSKTVerification:(id)a3 application:(id)a4 accountKey:(id)a5 idsResponseTime:(id)a6 serverLoggableDatas:(id)a7 optedIn:(unint64_t)a8 type:(unint64_t)a9 syncedLoggableDatas:(id)a10 verificationId:(id)a11 error:(id *)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a10;
  id v24 = a11;
  uint64_t v53 = 0LL;
  __int16 v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  __int16 v56 = sub_100170528;
  uint64_t v57 = sub_100170538;
  id v58 = 0LL;
  uint64_t v47 = 0LL;
  __int128 v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  v50 = sub_100170528;
  uint64_t v51 = sub_100170538;
  id v52 = 0LL;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100170540;
  v35[3] = &unk_1002856A0;
  v35[4] = self;
  id v25 = v18;
  id v36 = v25;
  id v26 = v19;
  id v37 = v26;
  id v27 = v20;
  id v38 = v27;
  unint64_t v45 = a8;
  id v28 = v21;
  id v39 = v28;
  id v29 = v22;
  id v40 = v29;
  unint64_t v46 = a9;
  id v30 = v23;
  id v41 = v30;
  id v31 = v24;
  id v42 = v31;
  v43 = &v47;
  uint64_t v44 = &v53;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v35);
  if (a12)
  {
    id v32 = (void *)v48[5];
    if (v32) {
      *a12 = v32;
    }
  }

  id v33 = (id)v54[5];

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  return v33;
}

- (id)createIDSKTVerification:(id)a3 application:(id)a4 verificationInfo:(id)a5 type:(unint64_t)a6 syncedLoggableDatas:(id)a7 verificationId:(id)a8 error:(id *)a9
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 accountKey]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 idsResponseTime]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 serverLoggableDatas]);
  id v21 = [v15 optedIn];

  id v22 = (void *)objc_claimAutoreleasedReturnValue( -[TransparencyManagedDataStore createIDSKTVerification:application:accountKey:idsResponseTime:serverLoggableDatas:optedIn:type:syncedLoggableDatas:verificationId:error:]( self,  "createIDSKTVerification:application:accountKey:idsResponseTime:serverLoggableDatas:optedIn:type:sync edLoggableDatas:verificationId:error:",  v17,  v16,  v18,  v19,  v20,  v21,  a6,  v14,  v13,  a9));
  return v22;
}

- (id)createPeerIDSKTVerification:(id)a3 application:(id)a4 verificationInfo:(id)a5 error:(id *)a6
{
  return -[TransparencyManagedDataStore createIDSKTVerification:application:verificationInfo:type:syncedLoggableDatas:verificationId:error:]( self,  "createIDSKTVerification:application:verificationInfo:type:syncedLoggableDatas:verificationId:error:",  a3,  a4,  a5,  0LL,  0LL,  0LL,  a6);
}

- (id)onMocFetchVerificationForVerificationId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTRequestID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"requestId == %@",  v6));

  [v7 setPredicate:v8];
  [v7 setRelationshipKeyPathsForPrefetching:&off_10029A298];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 executeFetchRequest:v7 error:a4]);

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a4);
  if ([v10 count])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 idsKTVerification]);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (BOOL)performAndWaitForVerificationId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_100170528;
  id v24 = sub_100170538;
  id v25 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100170DD4;
  v15[3] = &unk_100284FD0;
  void v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  id v18 = &v20;
  id v11 = v9;
  id v17 = v11;
  id v19 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a4)
  {
    id v12 = (void *)v21[5];
    if (v12) {
      *a4 = v12;
    }
  }

  char v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (BOOL)resetVerificationsToPending:(id)a3 error:(id *)a4
{
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_100170528;
  id v21 = sub_100170538;
  id v22 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100171060;
  v13[3] = &unk_1002774A0;
  id v14 = self;
  id v16 = &v17;
  id v6 = a3;
  id v15 = v6;
  -[TransparencyManagedDataStore performBlockAndWait:](v14, "performBlockAndWait:", v13);
  BOOL v7 = v18;
  if (a4)
  {
    id v8 = (void *)v18[5];
    if (v8)
    {
      *a4 = v8;
      BOOL v7 = v18;
    }
  }

  if (v7[5])
  {
    if (qword_1002EEAD0 != -1) {
      dispatch_once(&qword_1002EEAD0, &stru_1002856E0);
    }
    id v9 = (os_log_s *)qword_1002EEAD8;
    if (os_log_type_enabled((os_log_t)qword_1002EEAD8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = v18[5];
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "failed to reset peer verifications to pending: %@",  buf,  0xCu);
    }

    BOOL v11 = 0;
  }

  else
  {
    BOOL v11 = -[TransparencyManagedDataStore resetPeersToPending:error:](self, "resetPeersToPending:error:", v6, a4);
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (BOOL)performForPendingVerfications:(id)a3 uri:(id)a4 responseOlderThan:(id)a5 error:(id *)a6 batchSize:(unint64_t)a7 block:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  uint64_t v41 = 0LL;
  id v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  char v44 = 0;
  uint64_t v35 = 0LL;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  id v38 = sub_100170528;
  id v39 = sub_100170538;
  id v40 = 0LL;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100171610;
  v27[3] = &unk_100285708;
  void v27[4] = self;
  id v32 = &v35;
  id v18 = v15;
  id v28 = v18;
  id v19 = v14;
  id v29 = v19;
  id v20 = v16;
  id v30 = v20;
  unint64_t v34 = a7;
  id v21 = v17;
  id v31 = v21;
  id v33 = &v41;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v27);
  if (a6)
  {
    id v22 = (void *)v36[5];
    if (v22) {
      *a6 = v22;
    }
  }

  if (*((_BYTE *)v42 + 24))
  {
    BOOL v23 = 1;
  }

  else
  {
    if (qword_1002EEAD0 != -1) {
      dispatch_once(&qword_1002EEAD0, &stru_100285728);
    }
    uint64_t v24 = (os_log_s *)qword_1002EEAD8;
    if (os_log_type_enabled((os_log_t)qword_1002EEAD8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = v36[5];
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v46 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "failed to perform block for pending verifications: %@",  buf,  0xCu);
    }

    BOOL v23 = *((_BYTE *)v42 + 24) != 0;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v23;
}

- (id)pendingVerificationURIs:(id)a3 fetchLimit:(unint64_t)a4 error:(id *)a5
{
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_100170528;
  id v27 = sub_100170538;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_100170528;
  id v21 = sub_100170538;
  id v22 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100171900;
  v11[3] = &unk_100285750;
  id v12 = self;
  id v14 = &v17;
  id v7 = a3;
  id v15 = &v23;
  unint64_t v16 = a4;
  id v13 = v7;
  -[TransparencyManagedDataStore performBlockAndWait:](v12, "performBlockAndWait:", v11);
  if (a5)
  {
    id v8 = (void *)v18[5];
    if (v8) {
      *a5 = v8;
    }
  }

  id v9 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

- (id)peerVerificationIdForUri:(id)a3 application:(id)a4 verificationInfo:(id)a5 newerThan:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v42 = 0LL;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000LL;
  unint64_t v45 = sub_100170528;
  uint64_t v46 = sub_100170538;
  id v47 = 0LL;
  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  id v39 = sub_100170528;
  id v40 = sub_100170538;
  id v41 = 0LL;
  unint64_t v16 = objc_alloc(&OBJC_CLASS___KTLoggableDataArray);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 serverLoggableDatas]);
  id v18 = -[KTLoggableDataArray initWithLoggableDatas:](v16, "initWithLoggableDatas:", v17);

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100171DCC;
  v27[3] = &unk_100285778;
  id v19 = v13;
  id v28 = v19;
  id v20 = v12;
  id v29 = v20;
  id v21 = v15;
  id v30 = v21;
  id v22 = v14;
  id v31 = v22;
  id v32 = self;
  unint64_t v34 = &v36;
  uint64_t v23 = v18;
  id v33 = v23;
  uint64_t v35 = &v42;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v27);
  if (a7)
  {
    uint64_t v24 = (void *)v37[5];
    if (v24) {
      *a7 = v24;
    }
  }

  id v25 = (id)v43[5];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v25;
}

- (id)fetchOrCreateVerification:(id)a3 application:(id)a4 verificationInfo:(id)a5 fetchNow:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v8)
  {
    +[TransparencySettings defaultQueryCacheTimeout](&OBJC_CLASS___TransparencySettings, "defaultQueryCacheTimeout");
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -v18));
    uint64_t v20 = objc_claimAutoreleasedReturnValue( -[TransparencyManagedDataStore peerVerificationIdForUri:application:verificationInfo:newerThan:error:]( self,  "peerVerificationIdForUri:application:verificationInfo:newerThan:error:",  v12,  v13,  v14,  v19,  a7));
    if (v20)
    {
      id v21 = (void *)v20;
      if (qword_1002EEAD0 != -1) {
        dispatch_once(&qword_1002EEAD0, &stru_1002857D8);
      }
      id v22 = (os_log_s *)qword_1002EEAD8;
      if (!os_log_type_enabled((os_log_t)qword_1002EEAD8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v25 = 138543874;
      uint64_t v26 = v21;
      __int16 v27 = 2160;
      uint64_t v28 = 1752392040LL;
      __int16 v29 = 2112;
      id v30 = v12;
      uint64_t v23 = "re-using verificationId %{public}@ for %{mask.hash}@";
    }

    else
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue( -[TransparencyManagedDataStore createPeerIDSKTVerification:application:verificationInfo:error:]( self,  "createPeerIDSKTVerification:application:verificationInfo:error:",  v12,  v13,  v14,  a7));
      if (qword_1002EEAD0 != -1) {
        dispatch_once(&qword_1002EEAD0, &stru_1002857B8);
      }
      id v22 = (os_log_s *)qword_1002EEAD8;
      if (!os_log_type_enabled((os_log_t)qword_1002EEAD8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v25 = 138543874;
      uint64_t v26 = v21;
      __int16 v27 = 2160;
      uint64_t v28 = 1752392040LL;
      __int16 v29 = 2112;
      id v30 = v12;
      uint64_t v23 = "created verificationId %{public}@ for %{mask.hash}@ none cached";
    }

    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v25, 0x20u);
LABEL_17:
    id v17 = v21;

    goto LABEL_18;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[TransparencyManagedDataStore createPeerIDSKTVerification:application:verificationInfo:error:]( self,  "createPeerIDSKTVerification:application:verificationInfo:error:",  v12,  v13,  v14,  a7));
  if (qword_1002EEAD0 != -1) {
    dispatch_once(&qword_1002EEAD0, &stru_100285798);
  }
  unint64_t v16 = (os_log_s *)qword_1002EEAD8;
  if (os_log_type_enabled((os_log_t)qword_1002EEAD8, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138543874;
    uint64_t v26 = v15;
    __int16 v27 = 2160;
    uint64_t v28 = 1752392040LL;
    __int16 v29 = 2112;
    id v30 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "created verificationId %{public}@ for %{mask.hash}@ because fetchNow",  (uint8_t *)&v25,  0x20u);
  }

  id v17 = v15;
LABEL_18:

  return v17;
}

- (void)garbageCollectVerifications:(id *)a3
{
  if (qword_1002EEAD0 != -1) {
    dispatch_once(&qword_1002EEAD0, &stru_1002857F8);
  }
  id v5 = (os_log_s *)qword_1002EEAD8;
  if (os_log_type_enabled((os_log_t)qword_1002EEAD8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Garbage collecting IDSKTVerifications", buf, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(uint64_t)-kKTMaximumPendingRequestLifetime));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"creationTime < %@",  v6));

  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"IDSKTVerification",  v7,  a3);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"peerStateFailure == nil && peerStateMostRecent == nil && peerStateMostRecentSuccess == nil && peerStateMostRecentCompleted == nil"));

  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"IDSKTVerification",  v8,  a3);
}

- (void)deleteNonRecentVerificationsForApplication:(id)a3 error:(id *)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application == %@ && peerStateFailure == nil && peerStateMostRecent == nil && peerStateMostRecentSuccess == nil && peerStateMostRecentCompleted == nil",  a3));
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"IDSKTVerification",  v6,  a4);
}

- (BOOL)disableCacheHitsForUris:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (qword_1002EEAD0 != -1) {
    dispatch_once(&qword_1002EEAD0, &stru_100285818);
  }
  uint64_t v10 = (void *)qword_1002EEAD8;
  if (os_log_type_enabled((os_log_t)qword_1002EEAD8, OS_LOG_TYPE_INFO))
  {
    BOOL v11 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", @", "));
    *(_DWORD *)__int128 buf = 141558274;
    *(void *)&uint8_t buf[4] = 1752392040LL;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Disabling future cache hits for %{mask.hash}@",  buf,  0x16u);
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  id v32 = sub_100170528;
  id v33 = sub_100170538;
  id v34 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100172894;
  v21[3] = &unk_10027B9F8;
  v21[4] = self;
  uint64_t v24 = buf;
  id v13 = v8;
  id v22 = v13;
  id v14 = v9;
  id v23 = v14;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v21);
  uint64_t v15 = *(void *)&buf[8];
  if (a5)
  {
    unint64_t v16 = *(void **)(*(void *)&buf[8] + 40LL);
    if (v16)
    {
      *a5 = v16;
      uint64_t v15 = *(void *)&buf[8];
    }
  }

  uint64_t v17 = *(void *)(v15 + 40);
  if (v17)
  {
    if (qword_1002EEAD0 != -1) {
      dispatch_once(&qword_1002EEAD0, &stru_100285858);
    }
    double v18 = (os_log_s *)qword_1002EEAD8;
    if (os_log_type_enabled((os_log_t)qword_1002EEAD8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(*(void *)&buf[8] + 40LL);
      *(_DWORD *)int v25 = 141558530;
      uint64_t v26 = 1752392040LL;
      __int16 v27 = 2112;
      id v28 = v13;
      __int16 v29 = 2112;
      uint64_t v30 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "failed to disable cache hits for %{mask.hash}@: %@",  v25,  0x20u);
    }
  }

  _Block_object_dispose(buf, 8);
  return v17 == 0;
}

- (unint64_t)countOutstandingVerificationsForApplication:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"verificationResult == %d && application == %@",  2LL,  a3));
  unint64_t v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:]( self,  "onMocCountEntity:predicate:error:",  @"IDSKTVerification",  v6,  a4);

  return v7;
}

- (unint64_t)countTotalVerificationsForApplication:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application == %@",  a3));
  unint64_t v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:]( self,  "onMocCountEntity:predicate:error:",  @"IDSKTVerification",  v6,  a4);

  return v7;
}

- (BOOL)onMocLogVerificationMetricsForApplication:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v23 = 0LL;
  unint64_t v7 = -[TransparencyManagedDataStore countOutstandingVerificationsForApplication:error:]( self,  "countOutstandingVerificationsForApplication:error:",  v6,  &v23);
  id v8 = v23;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (qword_1002EEAD0 != -1) {
      dispatch_once(&qword_1002EEAD0, &stru_100285878);
    }
    id v9 = (os_log_s *)qword_1002EEAD8;
    if (os_log_type_enabled((os_log_t)qword_1002EEAD8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "failed to get outstanding IDSKTVerifications for %@: %@",  buf,  0x16u);
    }

    BOOL v10 = 0;
    if (!a4 || !v8)
    {
      id v16 = v8;
      goto LABEL_20;
    }

    BOOL v11 = v8;
    goto LABEL_17;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore logger](self, "logger"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"PendVer",  v6));
  [v12 logMetric:v13 withName:v14];

  id v22 = v8;
  unint64_t v15 = -[TransparencyManagedDataStore countTotalVerificationsForApplication:error:]( self,  "countTotalVerificationsForApplication:error:",  v6,  &v22);
  id v16 = v22;

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore logger](self, "logger"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v15));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"TotVer",  v6));
    [v18 logMetric:v19 withName:v20];

    BOOL v10 = 1;
    goto LABEL_20;
  }

  if (qword_1002EEAD0 != -1) {
    dispatch_once(&qword_1002EEAD0, &stru_100285898);
  }
  uint64_t v17 = (os_log_s *)qword_1002EEAD8;
  if (os_log_type_enabled((os_log_t)qword_1002EEAD8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "failed to get total IDSKTVerifications for %@: %@",  buf,  0x16u);
  }

  BOOL v10 = 0;
  if (a4 && v16)
  {
    BOOL v11 = v16;
LABEL_17:
    id v16 = v11;
    BOOL v10 = 0;
    *a4 = v16;
  }

- (id)createRecordFromLoggableData:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"KTDeviceRecord",  v8));

  if (v9)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceID]);
    [v9 setDeviceId:v10];

    id v14 = v6;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyManagedDataStore serializeLoggableDatas:]( &OBJC_CLASS___TransparencyManagedDataStore,  "serializeLoggableDatas:",  v11));
    [v9 setLoggableData:v12];

    [v9 setApplication:v7];
  }

  return v9;
}

- (BOOL)performAndWaitForDeviceId:(id)a3 application:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = 0;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  __int16 v29 = sub_100173218;
  uint64_t v30 = sub_100173228;
  id v31 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100173230;
  v19[3] = &unk_100277478;
  id v13 = v10;
  id v20 = v13;
  id v14 = v11;
  id v21 = v14;
  id v22 = self;
  uint64_t v24 = &v26;
  id v15 = v12;
  id v23 = v15;
  id v25 = &v32;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v19);
  if (a5)
  {
    id v16 = (void *)v27[5];
    if (v16) {
      *a5 = v16;
    }
  }

  char v17 = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

- (id)createRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"KTRequest",  v2));

  return v3;
}

- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 type:(unint64_t)a7 error:(id *)a8
{
  return -[TransparencyManagedDataStore createRequestWithUri:application:accountKey:serverData:syncedData:queryRequest:queryResponse:type:clientId:error:]( self,  "createRequestWithUri:application:accountKey:serverData:syncedData:queryRequest:queryResponse:type:clientId:error:",  a3,  a4,  a5,  a6,  0LL,  0LL,  0LL,  a7,  0LL,  a8);
}

- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 syncedData:(id)a7 queryRequest:(id)a8 queryResponse:(id)a9 type:(unint64_t)a10 error:(id *)a11
{
  return -[TransparencyManagedDataStore createRequestWithUri:application:accountKey:serverData:syncedData:queryRequest:queryResponse:type:clientId:error:]( self,  "createRequestWithUri:application:accountKey:serverData:syncedData:queryRequest:queryResponse:type:clientId:error:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  0LL,  a11);
}

- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 syncedData:(id)a7 queryRequest:(id)a8 queryResponse:(id)a9 type:(unint64_t)a10 clientId:(id)a11 error:(id *)a12
{
  id v18 = a11;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v30 = (id)objc_claimAutoreleasedReturnValue( -[TransparencyManagedDataStore createRequestWithUri:application:accountKey:serverData:syncedData:idsResponseTime:queryRequest:queryResponse:responseDate:type:clientId:error:]( self,  "createRequestWithUri:application:accountKey:serverData:syncedData:idsResponseTime:queryRequest:queryResp onse:responseDate:type:clientId:error:",  v25,  v24,  v23,  v22,  v21,  v26,  v20,  v19,  v27,  a10,  v18,  a12));

  return v30;
}

- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 syncedData:(id)a7 idsResponseTime:(id)a8 queryRequest:(id)a9 queryResponse:(id)a10 responseDate:(id)a11 type:(unint64_t)a12 clientId:(id)a13 error:(id *)a14
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v42 = a6;
  id v41 = a7;
  id v40 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a13;
  uint64_t v64 = 0LL;
  v65 = &v64;
  uint64_t v66 = 0x3032000000LL;
  v67 = sub_100173B2C;
  v68 = sub_100173B3C;
  id v69 = 0LL;
  uint64_t v58 = 0LL;
  v59 = &v58;
  uint64_t v60 = 0x3032000000LL;
  id v61 = sub_100173B2C;
  v62 = sub_100173B3C;
  id v63 = 0LL;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100173B44;
  v44[3] = &unk_100285920;
  v44[4] = self;
  uint64_t v55 = &v58;
  id v26 = v19;
  id v45 = v26;
  id v38 = v20;
  id v46 = v38;
  id v27 = v21;
  id v47 = v27;
  id v28 = v25;
  id v48 = v28;
  id v29 = v22;
  id v49 = v29;
  id v30 = v23;
  id v50 = v30;
  id v31 = v24;
  id v51 = v31;
  id v32 = v40;
  id v52 = v32;
  id v33 = v41;
  id v53 = v33;
  id v34 = v42;
  id v54 = v34;
  __int16 v56 = &v64;
  unint64_t v57 = a12;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v44);
  uint64_t v43 = v26;
  if (a14)
  {
    char v35 = (void *)v59[5];
    if (v35) {
      *a14 = v35;
    }
  }

  id v36 = (id)v65[5];

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  return v36;
}

- (id)requests:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 executeFetchRequest:v5 error:a3]);

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"KTRequest",  0LL,  -128LL);
    +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (unint64_t)requestCount:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v7 = [v6 countForFetchRequest:v5 error:a3];

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a3);
  return (unint64_t)v7;
}

- (id)fetchRequestForUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTRequestID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"requestId == %@",  v6));
  [v7 setPredicate:v8];

  [v7 setRelationshipKeyPathsForPrefetching:&off_10029A2C8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 executeFetchRequest:v7 error:a4]);

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a4);
  if ([v10 count] == (id)1)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 request]);
  }

  else
  {
    id v13 = [v10 count];
    if (a4 && (unint64_t)v13 >= 2)
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDatabase,  -57LL,  *a4,  @"Fetch returned too many requests for requestId = %@",  v6));
      *a4 = v14;
      -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"KTRequestID",  0LL,  -57LL,  v14);
      if (qword_1002EEAF0 != -1) {
        dispatch_once(&qword_1002EEAF0, &stru_100285940);
      }
      id v15 = (os_log_s *)qword_1002EEAF8;
      if (os_log_type_enabled((os_log_t)qword_1002EEAF8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v21 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Fetch returned too many requests for requestId = %@",  buf,  0xCu);
      }
    }

    id v16 = [v10 count];
    id v12 = 0LL;
    if (a4 && !v16)
    {
      id v17 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDatabase,  -58LL,  *a4,  @"Fetch returned no requests for requestId = %@",  v6));
      *a4 = v17;
      -[TransparencyManagedDataStore reportCoreDataEventForEntity:hardFailure:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:hardFailure:write:code:underlyingError:",  @"KTRequestID",  0LL,  0LL,  -58LL,  v17);
      if (qword_1002EEAF0 != -1) {
        dispatch_once(&qword_1002EEAF0, &stru_100285960);
      }
      id v18 = (os_log_s *)qword_1002EEAF8;
      if (os_log_type_enabled((os_log_t)qword_1002EEAF8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v21 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Fetch returned no requests for requestId = %@",  buf,  0xCu);
      }

      id v12 = 0LL;
    }
  }

  return v12;
}

- (id)fetchRequestsForURI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTRequest"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"uri == %@",  v6));

  [v7 setPredicate:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 executeFetchRequest:v7 error:a4]);

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a4);
  return v10;
}

- (id)fetchRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 youngerThan:(id)a7 error:(id *)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTRequest"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"uri == %@ && application == %@ && accountKey == %@ && serverLoggableDatas == %@ && requestTime > %@",  v18,  v17,  v16,  v15,  v14));

  [v19 setPredicate:v20];
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"requestTime",  0LL));
  id v28 = v21;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  [v19 setSortDescriptors:v22];

  [v19 setFetchLimit:1];
  [v19 setPropertiesToFetch:&off_10029A2E0];
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 executeFetchRequest:v19 error:a8]);

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a8);
  if (v24 && [v24 count])
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:0]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 requestId]);
  }

  else
  {
    id v26 = 0LL;
  }

  return v26;
}

- (void)performForRequestsWithPendingResponses:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"verificationResult == %d && application == %@",  2LL,  a3));
  -[TransparencyManagedDataStore performOnRequestsForPredicate:enforceMax:error:block:]( self,  "performOnRequestsForPredicate:enforceMax:error:block:",  v9,  1LL,  a4,  v8);
}

- (id)fetchCompletedRequests:(id)a3 olderThan:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (-[TransparencyManagedDataStore persistWithError:](self, "persistWithError:", a5))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTRequest"));
    [v10 setReturnsDistinctResults:1];
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"requestTime < %@ && (verificationResult == %d || verificationResult == %d) && application == %@",  v9,  1LL,  0LL,  v8));
    [v10 setPredicate:v11];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 executeFetchRequest:v10 error:a5]);
  }

  else
  {
    id v13 = 0LL;
  }

  if (qword_1002EEAF0 != -1) {
    dispatch_once(&qword_1002EEAF0, &stru_100285980);
  }
  id v14 = (os_log_s *)qword_1002EEAF8;
  if (os_log_type_enabled((os_log_t)qword_1002EEAF8, OS_LOG_TYPE_ERROR))
  {
    if (a5) {
      id v15 = *a5;
    }
    else {
      id v15 = 0LL;
    }
    *(_DWORD *)__int128 buf = 138412290;
    id v18 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "unable to read completed requests: %@",  buf,  0xCu);
  }

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a5);

  return v13;
}

- (BOOL)populateExistingRequestsToLookupTable:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"requestIDCache.@count == 0"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100174960;
  v12[3] = &unk_1002859A8;
  void v12[4] = self;
  -[TransparencyManagedDataStore performOnBatchesOfEntity:predicate:enforceMax:error:block:]( self,  "performOnBatchesOfEntity:predicate:enforceMax:error:block:",  @"KTRequest",  v5,  0LL,  a3,  v12);
  if (a3 && *a3)
  {
    id v6 = *a3;
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"KTRequest",  1LL,  -200LL,  v6);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100174A90;
    v10[3] = &unk_100276740;
    id v11 = v6;
    id v7 = v6;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v10);

    BOOL v8 = 0;
  }

  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)garbageCollectRequests:(id)a3 olderThan:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"requestTime < %@ && (verificationResult == %d || verificationResult == %d || verificationResult == %d) && application == %@",  a4,  1LL,  0LL,  3LL,  v8));
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"KTRequest",  v9,  a5);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(uint64_t)-kKTMaximumPendingRequestLifetime));
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"requestTime < %@ && application == %@",  v10,  v8));

  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"KTRequest",  v11,  a5);
}

- (BOOL)resetRequestsForApplication:(id)a3 error:(id *)a4
{
  return -[TransparencyManagedDataStore resetPendingRequests:error:](self, "resetPendingRequests:error:", a3, a4);
}

- (BOOL)resetRequestsForTLTReset:(id *)a3
{
  return -[TransparencyManagedDataStore resetPendingRequests:](self, "resetPendingRequests:", a3);
}

- (BOOL)resetPendingRequests:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6) {
    id v7 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application == %@ AND verificationResult == %d",  v6,  2LL);
  }
  else {
    id v7 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"verificationResult == %d",  2LL,  v11);
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100174D70;
  v12[3] = &unk_1002859A8;
  void v12[4] = self;
  -[TransparencyManagedDataStore performOnRequestsForPredicate:enforceMax:error:block:]( self,  "performOnRequestsForPredicate:enforceMax:error:block:",  v8,  0LL,  a4,  v12);
  BOOL v9 = !a4 || !*a4;

  return v9;
}

- (BOOL)resetPendingRequests:(id *)a3
{
  return -[TransparencyManagedDataStore resetPendingRequests:error:](self, "resetPendingRequests:error:", 0LL, a3);
}

- (unint64_t)countOutstandingRequestsForApplication:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"verificationResult == %d && application == %@",  2LL,  a3));
  unint64_t v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:]( self,  "onMocCountEntity:predicate:error:",  @"KTRequest",  v6,  a4);

  return v7;
}

- (unint64_t)countTotalRequestsForApplication:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application == %@",  a3));
  unint64_t v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:]( self,  "onMocCountEntity:predicate:error:",  @"KTRequest",  v6,  a4);

  return v7;
}

- (BOOL)logRequestMetricsForApplication:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v23 = 0LL;
  unint64_t v7 = -[TransparencyManagedDataStore countOutstandingRequestsForApplication:error:]( self,  "countOutstandingRequestsForApplication:error:",  v6,  &v23);
  id v8 = v23;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (qword_1002EEAF0 != -1) {
      dispatch_once(&qword_1002EEAF0, &stru_1002859E8);
    }
    BOOL v9 = (os_log_s *)qword_1002EEAF8;
    if (os_log_type_enabled((os_log_t)qword_1002EEAF8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "failed to get outstanding requests for %@: %@",  buf,  0x16u);
    }

    BOOL v10 = 0;
    if (!a4 || !v8)
    {
      id v16 = v8;
      goto LABEL_20;
    }

    uint64_t v11 = v8;
    goto LABEL_17;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore logger](self, "logger"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"OutstandingRequests",  v6));
  [v12 logMetric:v13 withName:v14];

  id v22 = v8;
  unint64_t v15 = -[TransparencyManagedDataStore countTotalRequestsForApplication:error:]( self,  "countTotalRequestsForApplication:error:",  v6,  &v22);
  id v16 = v22;

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore logger](self, "logger"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v15));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"TotalRequests",  v6));
    [v18 logMetric:v19 withName:v20];

    BOOL v10 = 1;
    goto LABEL_20;
  }

  if (qword_1002EEAF0 != -1) {
    dispatch_once(&qword_1002EEAF0, &stru_100285A08);
  }
  id v17 = (os_log_s *)qword_1002EEAF8;
  if (os_log_type_enabled((os_log_t)qword_1002EEAF8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "failed to get total requests for %@: %@",  buf,  0x16u);
  }

  BOOL v10 = 0;
  if (a4 && v16)
  {
    uint64_t v11 = v16;
LABEL_17:
    id v16 = v11;
    BOOL v10 = 0;
    *a4 = v16;
  }

- (void)performOnRequestsForPredicate:(id)a3 enforceMax:(BOOL)a4 error:(id *)a5 block:(id)a6
{
}

- (BOOL)performAndWaitForRequestId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_100173B2C;
  id v24 = sub_100173B3C;
  id v25 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001754FC;
  v15[3] = &unk_100284FD0;
  void v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  id v18 = &v20;
  id v11 = v9;
  id v17 = v11;
  id v19 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a4)
  {
    id v12 = (void *)v21[5];
    if (v12) {
      *a4 = v12;
    }
  }

  char v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (void)performAndWaitForLatestSelfRequest:(id)a3 accountKey:(id)a4 block:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100175678;
  v11[3] = &unk_100285A30;
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  id v15 = a5;
  id v8 = v15;
  id v9 = v13;
  id v10 = v12;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v11);
}

- (id)createRequestFailure
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"KTRequestFailure",  v2));

  return v3;
}

- (id)requestFailures:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTRequestFailure"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 executeFetchRequest:v5 error:a3]);

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"KTRequestFailure",  0LL,  -128LL);
    +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (unint64_t)requestFailureCount:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTRequestFailure"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v7 = [v6 countForFetchRequest:v5 error:a3];

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a3);
  return (unint64_t)v7;
}

- (void)createKTRequestID:(id)a3 request:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"KTRequestID",  v8));

  [v9 setRequestId:v7];
  [v9 setRequest:v6];
}

- (void)createIDSVerificationID:(id)a3 verification:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"KTRequestID",  v8));

  [v9 setRequestId:v7];
  [v9 setIdsKTVerification:v6];
}

- (id)requestIds:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTRequestID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 executeFetchRequest:v5 error:a3]);

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"KTRequestID",  0LL,  -128LL);
    +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (id)createMutation:(id)a3 application:(id)a4 uri:(id)a5 mutationMs:(unint64_t)a6 spkiHash:(id)a7 receiptTime:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"KTMutation",  v19));

  if (v20)
  {
    [v20 setSmt:v14];
    [v20 setUnsigned:"mutationMs" value:a6];
    [v20 setReceiptTime:v18];
    [v20 setApplication:v15];
    [v20 setUri:v16];
    [v20 setSpkiHash:v17];
  }

  return v20;
}

- (id)signedMutationTimestamps:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[KTMutation fetchRequest](&OBJC_CLASS___KTMutation, "fetchRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 executeFetchRequest:v5 error:a3]);

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"KTMutation",  0LL,  -128LL);
    +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (unint64_t)signedMutationTimestampCount:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[KTMutation fetchRequest](&OBJC_CLASS___KTMutation, "fetchRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v7 = [v6 countForFetchRequest:v5 error:a3];

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a3);
  return (unint64_t)v7;
}

- (void)performForSMTsWithUnverifiedSignature:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"signatureResult == %d && mergeResult == %d && application == %@",  2LL,  2LL,  a3));
  -[TransparencyManagedDataStore performOnBatchesOfEntity:predicate:enforceMax:error:block:]( self,  "performOnBatchesOfEntity:predicate:enforceMax:error:block:",  @"KTMutation",  v9,  0LL,  a4,  v8);
}

- (unint64_t)countOutstandingSMTsForApplication:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(signatureResult == %d || mergeResult == %d) && application == %@",  2LL,  2LL,  a3));
  unint64_t v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:]( self,  "onMocCountEntity:predicate:error:",  @"KTMutation",  v6,  a4);

  return v7;
}

- (unint64_t)countTotalSMTsForApplication:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application == %@",  a3));
  unint64_t v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:]( self,  "onMocCountEntity:predicate:error:",  @"KTMutation",  v6,  a4);

  return v7;
}

- (BOOL)logSMTMetricsForApplication:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v23 = 0LL;
  unint64_t v7 = -[TransparencyManagedDataStore countOutstandingSMTsForApplication:error:]( self,  "countOutstandingSMTsForApplication:error:",  v6,  &v23);
  id v8 = v23;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (qword_1002EEB00 != -1) {
      dispatch_once(&qword_1002EEB00, &stru_100285A50);
    }
    id v9 = (os_log_s *)qword_1002EEB08;
    if (os_log_type_enabled((os_log_t)qword_1002EEB08, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "failed to get outstanding SMTs for %@: %@",  buf,  0x16u);
    }

    BOOL v10 = 0;
    if (!a4 || !v8)
    {
      id v16 = v8;
      goto LABEL_20;
    }

    id v11 = v8;
    goto LABEL_17;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore logger](self, "logger"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"OutstandingSMTs",  v6));
  [v12 logMetric:v13 withName:v14];

  id v22 = v8;
  unint64_t v15 = -[TransparencyManagedDataStore countTotalSMTsForApplication:error:]( self,  "countTotalSMTsForApplication:error:",  v6,  &v22);
  id v16 = v22;

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore logger](self, "logger"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v15));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"TotalSMTs",  v6));
    [v18 logMetric:v19 withName:v20];

    BOOL v10 = 1;
    goto LABEL_20;
  }

  if (qword_1002EEB00 != -1) {
    dispatch_once(&qword_1002EEB00, &stru_100285A70);
  }
  id v17 = (os_log_s *)qword_1002EEB08;
  if (os_log_type_enabled((os_log_t)qword_1002EEB08, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to get total SMTs for %@: %@", buf, 0x16u);
  }

  BOOL v10 = 0;
  if (a4 && v16)
  {
    id v11 = v16;
LABEL_17:
    id v16 = v11;
    BOOL v10 = 0;
    *a4 = v16;
  }

- (void)garbageCollectSMTs:(id *)a3
{
  if (qword_1002EEB00 != -1) {
    dispatch_once(&qword_1002EEB00, &stru_100285A90);
  }
  id v5 = (os_log_s *)qword_1002EEB08;
  if (os_log_type_enabled((os_log_t)qword_1002EEB08, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Garbage collecting SMTs", buf, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(uint64_t)-kKTMaximumPendingRequestLifetime));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"receiptTime < %@",  v6));

  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"KTMutation",  v7,  a3);
  if (qword_1002EEB00 != -1) {
    dispatch_once(&qword_1002EEB00, &stru_100285AB0);
  }
  id v8 = (os_log_s *)qword_1002EEB08;
  if (os_log_type_enabled((os_log_t)qword_1002EEB08, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Garbage collecting successfully verified SMTs",  v11,  2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(uint64_t)-kKTMaximumCompletedRequestLifetime));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"receiptTime < %@ && signatureResult == %d && mergeResult == %d",  v9,  1LL,  1LL));

  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"KTMutation",  v10,  a3);
}

- (BOOL)performForPendingSMTs:(id)a3 uri:(id)a4 error:(id *)a5 batchSize:(unint64_t)a6 block:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  id v33 = sub_10017679C;
  id v34 = sub_1001767AC;
  id v35 = 0LL;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1001767B4;
  v23[3] = &unk_100285AD8;
  void v23[4] = self;
  id v27 = &v30;
  id v15 = v13;
  id v24 = v15;
  id v16 = v12;
  id v25 = v16;
  unint64_t v29 = a6;
  id v17 = v14;
  id v26 = v17;
  uint64_t v28 = &v36;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v23);
  if (a5)
  {
    id v18 = (void *)v31[5];
    if (v18) {
      *a5 = v18;
    }
  }

  if (*((_BYTE *)v37 + 24))
  {
    BOOL v19 = 1;
  }

  else
  {
    if (qword_1002EEB00 != -1) {
      dispatch_once(&qword_1002EEB00, &stru_100285AF8);
    }
    uint64_t v20 = (os_log_s *)qword_1002EEB08;
    if (os_log_type_enabled((os_log_t)qword_1002EEB08, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = v31[5];
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v41 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "failed to perform block for pending SMTs: %@",  buf,  0xCu);
    }

    BOOL v19 = *((_BYTE *)v37 + 24) != 0;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v19;
}

- (id)getPendingSmtUris:(id)a3 fetchLimit:(unint64_t)a4 error:(id *)a5
{
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = sub_10017679C;
  id v27 = sub_1001767AC;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_10017679C;
  uint64_t v21 = sub_1001767AC;
  id v22 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100176B20;
  v11[3] = &unk_100285750;
  id v12 = self;
  id v14 = &v17;
  id v7 = a3;
  id v15 = &v23;
  unint64_t v16 = a4;
  id v13 = v7;
  -[TransparencyManagedDataStore performBlockAndWait:](v12, "performBlockAndWait:", v11);
  if (a5)
  {
    id v8 = (void *)v18[5];
    if (v8) {
      *a5 = v8;
    }
  }

  id v9 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

- (BOOL)deleteSMTsWithSPKINotIn:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (qword_1002EEB00 != -1) {
    dispatch_once(&qword_1002EEB00, &stru_100285B18);
  }
  BOOL v10 = (os_log_s *)qword_1002EEB08;
  if (os_log_type_enabled((os_log_t)qword_1002EEB08, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Deleting %@ SMTs with old SPKI hashes", buf, 0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application == %@ && (NOT spkiHash IN %@ || spkiHash == nil)",  v9,  v8));
  BOOL v12 = -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"KTMutation",  v11,  a5);

  return v12;
}

- (id)createSignedMutationTimestampsFailure
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"KTSMTFailure",  v2));

  return v3;
}

- (id)signedMutationTimestampsFailures:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTSMTFailure"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 executeFetchRequest:v5 error:a3]);

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"KTSMTFailure",  0LL,  -128LL);
    +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (unint64_t)signedMutationTimestampsFailureCount:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTSMTFailure"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v7 = [v6 countForFetchRequest:v5 error:a3];

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a3);
  return (unint64_t)v7;
}

+ (id)serializeNSError:(id)a3
{
  id v3 = a3;
  id v4 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  id v9 = v3;
  id v5 = v3;
  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", &v9);
  id v6 = v9;

  -[NSKeyedArchiver encodeObject:forKey:](v4, "encodeObject:forKey:", v6, @"error");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v4, "encodedData"));

  return v7;
}

+ (id)deserializeNSError:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v5,  a4);

  id v8 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError, v7), 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSKeyedUnarchiver _enableStrictSecureDecodingMode](v6, "_enableStrictSecureDecodingMode");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v6,  "decodeObjectOfClasses:forKey:",  v9,  @"error"));

  return v10;
}

- (id)createFailureEvent:(id)a3 application:(id)a4 optInServer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v19 = 0LL;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([a5 getAggregateOptInState:&v19]);
  id v11 = v19;
  if (!v10)
  {
    if (qword_1002EED90 != -1) {
      dispatch_once(&qword_1002EED90, &stru_1002881E8);
    }
    uint64_t v17 = (os_log_s *)qword_1002EED98;
    if (os_log_type_enabled((os_log_t)qword_1002EED98, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v21 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "createFailureEvent: failed getting optin state: %@",  buf,  0xCu);
    }

    goto LABEL_9;
  }

  if ([v10 state] != (id)1)
  {
LABEL_9:
    id v13 = 0LL;
    goto LABEL_10;
  }

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"KTFailureEvent",  v12));

  if (v13)
  {
    [v13 setApplication:v9];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    [v13 setEventId:v14];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v13 setFailureTime:v15];

    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyManagedDataStore serializeNSError:]( &OBJC_CLASS___TransparencyManagedDataStore,  "serializeNSError:",  v8));
    [v13 setEncodedError:v16];
  }

- (id)fetchRecentFailureEvents:(id)a3 fetchLimit:(unint64_t)a4 error:(id *)a5
{
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = sub_1001A9578;
  id v27 = sub_1001A9588;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_1001A9578;
  id v21 = sub_1001A9588;
  id v22 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001A9590;
  v11[3] = &unk_100285750;
  BOOL v12 = self;
  id v14 = &v17;
  id v7 = a3;
  id v15 = &v23;
  unint64_t v16 = a4;
  id v13 = v7;
  -[TransparencyManagedDataStore performBlockAndWait:](v12, "performBlockAndWait:", v11);
  if (a5)
  {
    id v8 = (void *)v18[5];
    if (v8) {
      *a5 = v8;
    }
  }

  id v9 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

- (void)errorsForFailedEvents:(id)a3 completionBlock:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001A9A08;
  v8[3] = &unk_100288290;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v8);
}

- (BOOL)performAndWaitForFailedEventId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_1001A9578;
  uint64_t v25 = sub_1001A9588;
  id v26 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001AA114;
  v15[3] = &unk_100284FD0;
  id v10 = v8;
  id v16 = v10;
  uint64_t v17 = self;
  uint64_t v19 = &v21;
  id v11 = v9;
  id v18 = v11;
  uint64_t v20 = &v27;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a4)
  {
    BOOL v12 = (void *)v22[5];
    if (v12) {
      *a4 = v12;
    }
  }

  char v13 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (BOOL)clearAllFailureEvents:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application == %@",  a3));
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"KTFailureEvent",  v6,  a4);
  if (a4 && *a4)
  {
    id v7 = *a4;
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"KTFailureEvent",  1LL,  -171LL,  v7);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001AA484;
    v11[3] = &unk_100276740;
    id v12 = v7;
    id v8 = v7;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v11);

    BOOL v9 = 0;
  }

  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)clearFailureEvents:(id)a3 completionBlock:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001AA624;
  v8[3] = &unk_100288290;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v8);
}

- (BOOL)clearSelfFailureRelatedData:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"request.uri == %@ AND application == %@ AND request.type == %lld",  v8,  a3,  1LL));
  if (!-[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"KTFailureEvent",  v9,  a5))
  {
    if (!a5) {
      goto LABEL_19;
    }
    if (*a5)
    {
      id v10 = *a5;
      -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"KTFailureEvent",  1LL,  -310LL,  v10);
      if (qword_1002EED90 != -1) {
        dispatch_once(&qword_1002EED90, &stru_100288330);
      }
      id v11 = (os_log_s *)qword_1002EED98;
      if (!os_log_type_enabled((os_log_t)qword_1002EED98, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)__int128 buf = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v10;
      id v12 = "failed to clear self-validation failure events for uri %@: %@";
      goto LABEL_16;
    }

- (BOOL)clearSelfValidationFollowups:(id)a3 uri:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)createTreeHead
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"KTTreeHead",  v2));

  return v3;
}

- (id)createTreeHead:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logHeadHash:(id)a7 logType:(int64_t)a8 revision:(unint64_t)a9 gossip:(BOOL)a10
{
  BOOL v13 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a3;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createTreeHead](self, "createTreeHead"));
  [v19 setSth:v18];

  [v19 setIsMapHead:v13];
  [v19 setApplication:v16];
  [v19 setUnsigned:"logBeginTime" value:a6];
  [v19 setLogHeadHash:v17];
  [v19 setLogType:a8];
  [v19 setUnsigned:"revision" value:a9];
  [v19 setGossip:a10];
  [v19 setReceiptTime:CFAbsoluteTimeGetCurrent()];
  if (a8 != 3 || v13) {
    [v19 setInclusionVerified:2];
  }
  if (v13) {
    [v19 setConsistencyVerified:1];
  }
  if (qword_1002EEDB0 != -1) {
    dispatch_once(&qword_1002EEDB0, &stru_100288700);
  }
  uint64_t v20 = (void *)qword_1002EEDB8;
  if (os_log_type_enabled((os_log_t)qword_1002EEDB8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = v20;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "kt_hexString"));
    int v24 = 138413570;
    uint64_t v25 = v22;
    __int16 v26 = 2112;
    id v27 = v16;
    __int16 v28 = 1024;
    BOOL v29 = v13;
    __int16 v30 = 2048;
    unint64_t v31 = a6;
    __int16 v32 = 2048;
    int64_t v33 = a8;
    __int16 v34 = 2048;
    unint64_t v35 = a9;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Add new tree head: %@[%@] %d %llu %lld %lld",  (uint8_t *)&v24,  0x3Au);
  }

  return v19;
}

- (BOOL)haveTreeHead:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logType:(int64_t)a7 revision:(unint64_t)a8 gossip:(BOOL)a9 error:(id *)a10
{
  BOOL v13 = a4;
  id v16 = a5;
  id v17 = a3;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTTreeHead"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"isMapHead == %@ && logHeadHash == %@ && application == %@ && logBeginTime == %llu && logType == %lld && revision == %llu",  v19,  v17,  v16,  a6,  a7,  a8));

  [v18 setPredicate:v20];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v25 = 0LL;
  id v22 = [v21 countForFetchRequest:v18 error:&v25];
  id v23 = v25;

  if (a10 && v23) {
    *a10 = v23;
  }
  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a10);

  return v22 != 0LL;
}

- (id)treeHeads:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTTreeHead"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v10 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 executeFetchRequest:v5 error:&v10]);
  id v8 = v10;

  if (v8)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"KTTreeHead",  0LL,  -128LL,  v8);
    if (a3) {
      *a3 = v8;
    }
    +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (id)treeHeadsForApplication:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTTreeHead"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application == %@",  v6));

  [v7 setPredicate:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v13 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 executeFetchRequest:v7 error:&v13]);
  id v11 = v13;

  if (a4 && v11) {
    *a4 = v11;
  }
  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a4);

  return v10;
}

- (unint64_t)treeHeadCount:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTTreeHead"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v7 = [v6 countForFetchRequest:v5 error:a3];

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a3);
  return (unint64_t)v7;
}

- (id)fetchTreeHead:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logType:(int64_t)a7 revision:(unint64_t)a8 error:(id *)a9
{
  BOOL v13 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTTreeHead"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13));
  id v50 = v16;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"isMapHead == %@ && logHeadHash == %@ && application == %@ && logBeginTime == %lld && logType == %lld && revision == %lld",  v18,  v15,  v16,  a6,  a7,  a8));
  [v17 setPredicate:v19];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v60 = 0LL;
  id v51 = v17;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 executeFetchRequest:v17 error:&v60]);
  id v22 = v60;

  if ([v21 count])
  {
    id v47 = v15;
    if ((unint64_t)[v21 count] >= 2)
    {
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      id v48 = v21;
      id obj = v21;
      id v23 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v57;
        __int16 v26 = &qword_1002EC9F8[705];
        id v27 = &qword_1002EC9F8[705];
        uint64_t v52 = *(void *)v57;
        id v53 = v22;
        do
        {
          for (i = 0LL; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v57 != v25) {
              objc_enumerationMutation(obj);
            }
            BOOL v29 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
            if (v26[438] != -1LL) {
              dispatch_once(&qword_1002EEDB0, &stru_100288740);
            }
            __int16 v30 = (void *)v27[439];
            if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
            {
              log = v30;
              unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v29 logHeadHash]);
              __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "kt_hexString"));
              int64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v29 application]);
              id v34 = v24;
              unint64_t v35 = v27;
              unsigned int v36 = [v29 isMapHead];
              id v37 = [v29 logBeginTime];
              id v38 = [v29 logType];
              id v39 = [v29 revision];
              *(_DWORD *)__int128 buf = 138413570;
              id v63 = v32;
              __int16 v64 = 2112;
              id v65 = v33;
              __int16 v66 = 1024;
              int v67 = v36;
              id v27 = v35;
              id v24 = v34;
              __int16 v68 = 2048;
              unint64_t v69 = (unint64_t)v37;
              __int16 v70 = 2048;
              int64_t v71 = (int64_t)v38;
              __int16 v72 = 2048;
              unint64_t v73 = (unint64_t)v39;
              _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Fetch returned too dup head: %@[%@] %d %llu %lld %lld",  buf,  0x3Au);

              __int16 v26 = qword_1002EC9F8 + 5640;
              id v22 = v53;

              uint64_t v25 = v52;
            }
          }

          id v24 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
        }

        while (v24);
      }

      uint64_t v21 = v48;
    }

    +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a9);
    id v40 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:0]);
    id v15 = v47;
    uint64_t v41 = v50;
  }

  else
  {
    id v49 = v21;
    id v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "kt_hexString"));
    uint64_t v43 = objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDatabase,  -185LL,  v22,  @"Fetch returned no tree heads for hash: %@",  v42));
    uint64_t v44 = v22;
    id v22 = (id)v43;

    -[TransparencyManagedDataStore reportCoreDataEventForEntity:hardFailure:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:hardFailure:write:code:underlyingError:",  @"KTTreeHead",  0LL,  0LL,  -185LL,  v22);
    if (qword_1002EEDB0 != -1) {
      dispatch_once(&qword_1002EEDB0, &stru_100288720);
    }
    uint64_t v41 = v16;
    id v45 = (os_log_s *)qword_1002EEDB8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDB8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138413570;
      id v63 = v42;
      __int16 v64 = 2112;
      id v65 = v16;
      __int16 v66 = 1024;
      int v67 = v13;
      __int16 v68 = 2048;
      unint64_t v69 = a6;
      __int16 v70 = 2048;
      int64_t v71 = a7;
      __int16 v72 = 2048;
      unint64_t v73 = a8;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Fetch returned no tree heads for hash: %@[%@] %d %llu %lld %lld",  buf,  0x3Au);
    }

    if (a9 && v22) {
      *a9 = v22;
    }

    id v40 = 0LL;
    uint64_t v21 = v49;
  }

  return v40;
}

- (id)fetchTreeHeadsWithoutHash:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logType:(int64_t)a7 revision:(unint64_t)a8 error:(id *)a9
{
  BOOL v12 = a4;
  id v15 = a5;
  id v16 = a3;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTTreeHead"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"isMapHead == %@ && logHeadHash != %@ && application == %@ && logBeginTime == %llu && logType == %lld && revision == %llu",  v18,  v16,  v15,  a6,  a7,  a8));

  [v17 setPredicate:v19];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 executeFetchRequest:v17 error:a9]);

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a9);
  return v21;
}

- (id)latestConsistencyVerifiedTreeHeadRevision:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  id v27 = sub_1001AEA98;
  __int16 v28 = sub_1001AEAA8;
  id v29 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_1001AEA98;
  id v22 = sub_1001AEAA8;
  id v23 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001AEAB0;
  v12[3] = &unk_1002887A8;
  id v8 = a3;
  id v16 = &v24;
  unint64_t v17 = a4;
  id v13 = v8;
  id v14 = self;
  id v15 = &v18;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v12);
  if (a5)
  {
    id v9 = (void *)v19[5];
    if (v9) {
      *a5 = v9;
    }
  }

  id v10 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v10;
}

- (id)latestConsistencyVerifiedTreeHeadSTH:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  id v27 = sub_1001AEA98;
  __int16 v28 = sub_1001AEAA8;
  id v29 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_1001AEA98;
  id v22 = sub_1001AEAA8;
  id v23 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001AF0F0;
  v11[3] = &unk_100288830;
  BOOL v12 = self;
  id v14 = &v18;
  id v7 = a3;
  id v13 = v7;
  id v15 = &v24;
  unint64_t v16 = a4;
  unint64_t v17 = a5;
  -[TransparencyManagedDataStore performBlockAndWait:](v12, "performBlockAndWait:", v11);
  if (a5)
  {
    id v8 = (void *)v19[5];
    if (v8) {
      *a5 = v8;
    }
  }

  id v9 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v9;
}

- (id)unverifiedRevisions:(id)a3 isMapHead:(BOOL)a4 inclusion:(BOOL)a5 logBeginMs:(unint64_t)a6 error:(id *)a7
{
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  unint64_t v31 = sub_1001AEA98;
  __int16 v32 = sub_1001AEAA8;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_1001AEA98;
  uint64_t v26 = sub_1001AEAA8;
  id v27 = 0LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001AF800;
  v14[3] = &unk_100288858;
  BOOL v20 = a5;
  BOOL v21 = a4;
  id v10 = a3;
  uint64_t v18 = &v28;
  unint64_t v19 = a6;
  id v15 = v10;
  unint64_t v16 = self;
  unint64_t v17 = &v22;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v14);
  if (a7)
  {
    id v11 = (void *)v23[5];
    if (v11) {
      *a7 = v11;
    }
  }

  id v12 = (id)v29[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

- (BOOL)populateMissingLogHeadHashes:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"isMapHead == NO && logHeadHash == nil"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001AFC54;
  v12[3] = &unk_1002859A8;
  void v12[4] = self;
  -[TransparencyManagedDataStore performOnBatchesOfEntity:predicate:enforceMax:error:block:]( self,  "performOnBatchesOfEntity:predicate:enforceMax:error:block:",  @"KTTreeHead",  v5,  0LL,  a3,  v12);
  if (a3 && *a3)
  {
    id v6 = *a3;
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"KTTreeHead",  1LL,  -194LL,  v6);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001AFEA0;
    v10[3] = &unk_100276740;
    id v11 = v6;
    id v7 = v6;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v10);

    BOOL v8 = 0;
  }

  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)performForPendingSTHs:(id)a3 olderThan:(id)a4 type:(unint64_t)a5 error:(id *)a6 block:(id)a7
{
  id v15 = a3;
  id v12 = a4;
  id v13 = a7;
  if (a5 > 3) {
    id v14 = 0LL;
  }
  else {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  *(&off_100288A70 + a5),  v15,  v12,  2LL));
  }
  -[TransparencyManagedDataStore performOnBatchesOfEntity:predicate:enforceMax:error:block:]( self,  "performOnBatchesOfEntity:predicate:enforceMax:error:block:",  @"KTTreeHead",  v14,  0LL,  a6,  v13);
}

- (void)performForSTHsWithUnverifiedSignature:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application == %@ && signatureVerified == %d",  a3,  2LL));
  -[TransparencyManagedDataStore performOnBatchesOfEntity:predicate:enforceMax:error:block:]( self,  "performOnBatchesOfEntity:predicate:enforceMax:error:block:",  @"KTTreeHead",  v9,  0LL,  a4,  v8);
}

- (void)performForSMHsWithUnverifiedMMD:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"isMapHead = %@ && application == %@ && mmdVerified == %d",  &__kCFBooleanTrue,  a3,  2LL));
  -[TransparencyManagedDataStore performOnBatchesOfEntity:predicate:enforceMax:error:block:]( self,  "performOnBatchesOfEntity:predicate:enforceMax:error:block:",  @"KTTreeHead",  v9,  0LL,  a4,  v8);
}

- (void)performForSTHs:(id)a3 isMapHead:(BOOL)a4 revision:(id)a5 error:(id *)a6 block:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
  id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"isMapHead == %@ && application == %@ && revision == %@",  v15,  v14,  v13));

  -[TransparencyManagedDataStore performOnBatchesOfEntity:predicate:enforceMax:error:block:]( self,  "performOnBatchesOfEntity:predicate:enforceMax:error:block:",  @"KTTreeHead",  v16,  0LL,  a6,  v12);
}

- (void)garbageCollectSTHs:(id)a3 logBeginMs:(unint64_t)a4 olderThanDate:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue( -[TransparencyManagedDataStore latestConsistencyVerifiedTreeHeadRevision:logBeginMs:error:]( self,  "latestConsistencyVerifiedTreeHeadRevision:logBeginMs:error:",  v11,  a4,  a6));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( NSPredicate,  "predicateWithFormat:",  @"isMapHead == NO && receiptTime < %@ && (consistencyVerified == %d || consistencyVerified == %d || consistencyVerified == %d) && application == %@ && revision != %llu",  v10,  1,  0,  3,  v11,  [v13 unsignedLongLongValue]));

  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"KTTreeHead",  v12,  a6);
}

- (BOOL)shouldGarbageCollectSTH:(id)a3 application:(id)a4 logBeginMs:(unint64_t)a5 olderThanDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v10 isMapHead])
  {
    unsigned __int8 v13 = 0;
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[TransparencyManagedDataStore latestConsistencyVerifiedTreeHeadRevision:logBeginMs:error:]( self,  "latestConsistencyVerifiedTreeHeadRevision:logBeginMs:error:",  v11,  a5,  0LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( NSPredicate,  "predicateWithFormat:",  @"isMapHead == NO && receiptTime < %@ && (consistencyVerified == %d || consistencyVerified == %d || consistencyVerified == %d) && application == %@ && revision != %llu",  v12,  1,  0,  3,  v11,  [v14 unsignedLongLongValue]));
    unsigned __int8 v13 = [v15 evaluateWithObject:v10];
  }

  return v13;
}

- (unint64_t)countOutstandingSTHsForApplication:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application == %@ && isMapHead == NO && (signatureVerified == %d || consistencyVerified == %d || inclusionVerified == %d)",  a3,  2LL,  2LL,  2LL));
  unint64_t v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:]( self,  "onMocCountEntity:predicate:error:",  @"KTTreeHead",  v6,  a4);

  return v7;
}

- (unint64_t)countTotalSTHsForApplication:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application == %@",  a3));
  unint64_t v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:]( self,  "onMocCountEntity:predicate:error:",  @"KTTreeHead",  v6,  a4);

  return v7;
}

- (unint64_t)countOutstandingSMHsForApplication:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application == %@ && isMapHead == YES && (signatureVerified == %d || mmdVerified == %d || inclusionVerified == %d)",  a3,  2LL,  2LL,  2LL));
  unint64_t v7 = -[TransparencyManagedDataStore onMocCountEntity:predicate:error:]( self,  "onMocCountEntity:predicate:error:",  @"KTTreeHead",  v6,  a4);

  return v7;
}

- (BOOL)logSTHMetricsForApplication:(id)a3 error:(id *)a4
{
  uint64_t v12 = 0LL;
  unsigned __int8 v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B0668;
  v7[3] = &unk_100288900;
  id v8 = self;
  id v5 = a3;
  id v10 = &v12;
  id v11 = a4;
  id v9 = v5;
  -[TransparencyManagedDataStore performBlockAndWait:](v8, "performBlockAndWait:", v7);
  LOBYTE(a4) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)a4;
}

- (BOOL)deleteSTHs:(id)a3 logBeginMsLessThan:(unint64_t)a4 error:(id *)a5
{
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application == %@ && logBeginTime < %llu",  a3,  a4));
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"KTTreeHead",  v7,  a5);
  if (a5 && *a5)
  {
    id v8 = *a5;
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"KTTreeHead",  1LL,  -171LL,  v8);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001B0C04;
    v12[3] = &unk_100276740;
    id v13 = v8;
    id v9 = v8;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v12);

    BOOL v10 = 0;
  }

  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)reportFailedRevisions:(id)a3 failure:(id)a4 downloadType:(unint64_t)a5 application:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (a5 - 1 <= 2)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  *(&off_100288A90 + a5 - 1),  v11));
    v18[0] = v9;
    v17[0] = @"requestedRevisions";
    v17[1] = @"errorCode";
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 code]));
    v18[1] = v13;
    v17[2] = @"errorDomain";
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
    v18[2] = v14;
    char v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    [v16 logHardFailureForEventNamed:v12 withAttributes:v15];
  }
}

- (void)failHeadDownloadRecord:(id)a3 failure:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v37 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 revisions]);
  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v9,  0LL,  a5));
    if (v11 && (uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0))
    {
      if (os_variant_allows_internal_security_policies("com.apple.Transparency"))
      {
        id v13 = [v8 downloadType];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 application]);
        -[TransparencyManagedDataStore reportFailedRevisions:failure:downloadType:application:]( self,  "reportFailedRevisions:failure:downloadType:application:",  v11,  v37,  v13,  v14);
      }

      id v15 = [v8 downloadType];
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      id v16 = v11;
      id v17 = [v16 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v17)
      {
        id v19 = v17;
        unsigned int v36 = a5;
        id v34 = v11;
        unint64_t v35 = v9;
        uint64_t v20 = *(void *)v44;
        do
        {
          BOOL v21 = 0LL;
          do
          {
            if (*(void *)v44 != v20) {
              objc_enumerationMutation(v16);
            }
            uint64_t v22 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v21);
            uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSNumber, v18);
            if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
            {
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v8 application]);
              v38[0] = _NSConcreteStackBlock;
              v38[1] = 3221225472LL;
              v38[2] = sub_1001B1384;
              v38[3] = &unk_1002889E8;
              id v42 = v15;
              id v39 = v8;
              id v40 = self;
              id v41 = v37;
              -[TransparencyManagedDataStore performForSTHs:isMapHead:revision:error:block:]( self,  "performForSTHs:isMapHead:revision:error:block:",  v24,  v15 == (id)1,  v22,  v36,  v38);
            }

            else
            {
              if (qword_1002EEDB0 != -1) {
                dispatch_once(&qword_1002EEDB0, &stru_100288980);
              }
              uint64_t v25 = (void *)qword_1002EEDB8;
              if (os_log_type_enabled((os_log_t)qword_1002EEDB8, OS_LOG_TYPE_ERROR))
              {
                uint64_t v26 = v25;
                id v27 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadId]);
                *(_DWORD *)__int128 buf = 138543618;
                uint64_t v49 = (uint64_t)v27;
                __int16 v50 = 2112;
                id v51 = v22;
                _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "invalid revision type serialized from downloadId %{public}@: %@",  buf,  0x16u);
              }
            }

            BOOL v21 = (char *)v21 + 1;
          }

          while (v19 != v21);
          id v19 = [v16 countByEnumeratingWithState:&v43 objects:v47 count:16];
        }

        while (v19);
        id v11 = v34;
        id v9 = v35;
      }
    }

    else
    {
      if (qword_1002EEDB0 != -1) {
        dispatch_once(&qword_1002EEDB0, &stru_100288960);
      }
      id v16 = (id)qword_1002EEDB8;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = objc_claimAutoreleasedReturnValue([v8 downloadId]);
        id v29 = (void *)v28;
        if (a5) {
          id v30 = *a5;
        }
        else {
          id v30 = 0LL;
        }
        *(_DWORD *)__int128 buf = 138543618;
        uint64_t v49 = v28;
        __int16 v50 = 2112;
        id v51 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "failed to deserialize revisions for downloadId %{public}@: %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    if (qword_1002EEDB0 != -1) {
      dispatch_once(&qword_1002EEDB0, &stru_100288940);
    }
    unint64_t v31 = (void *)qword_1002EEDB8;
    if (os_log_type_enabled((os_log_t)qword_1002EEDB8, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = v31;
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadId]);
      *(_DWORD *)__int128 buf = 138543362;
      uint64_t v49 = (uint64_t)v33;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "STH download record type missing revisions for downloadId %{public}@",  buf,  0xCu);
    }
  }
}

- (void)failHeadDownload:(id)a3 failure:(id)a4 logClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_1002EEDB0 != -1) {
    dispatch_once(&qword_1002EEDB0, &stru_100288A08);
  }
  id v11 = (os_log_s *)qword_1002EEDB8;
  if (os_log_type_enabled((os_log_t)qword_1002EEDB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "failing STH downloadId %{public}@", buf, 0xCu);
  }

  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_1001B1878;
  id v16 = &unk_100288A50;
  id v17 = self;
  id v18 = v9;
  id v12 = v9;
  -[TransparencyManagedDataStore performAndWaitForDownloadId:error:block:]( self,  "performAndWaitForDownloadId:error:block:",  v8,  0LL,  &v13);
  objc_msgSend(v10, "deleteDownloadId:", v8, v13, v14, v15, v16, v17);
}

- (id)failedHeadSignaturesWithRevisions:(id)a3 application:(id)a4
{
  id v6 = a3;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_1001AEA98;
  id v20 = sub_1001AEAA8;
  id v21 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001B1AEC;
  v11[3] = &unk_100284B80;
  id v7 = a4;
  id v12 = v7;
  id v8 = v6;
  id v13 = v8;
  uint64_t v14 = self;
  id v15 = &v16;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v11);
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (id)createSignedTreeHeadFailure
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"KTSTHFailure",  v2));

  return v3;
}

- (id)signedTreeHeadFailures:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTSTHFailure"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 executeFetchRequest:v5 error:a3]);

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"KTSTHFailure",  0LL,  -128LL);
    +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (unint64_t)signedTreeHeadFailureCount:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTSTHFailure"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v7 = [v6 countForFetchRequest:v5 error:a3];

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a3);
  return (unint64_t)v7;
}

- (id)createDownloadRecord:(unint64_t)a3 moc:(id)a4 application:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"DownloadRecord",  a4));
  [v8 setUnsigned:"downloadType" value:a3];
  [v8 setApplication:v7];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  [v8 setDownloadId:v9];

  [v8 setRequestTime:CFAbsoluteTimeGetCurrent()];
  return v8;
}

- (id)downloadRecords:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"DownloadRecord"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 executeFetchRequest:v5 error:a3]);

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"DownloadRecord",  0LL,  -128LL);
    +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a3);
  }

  return v7;
}

- (id)fetchDownloadRecord:(unint64_t)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"DownloadRecord"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"downloadType == %d && application = %@",  a3,  v8));

  [v9 setPredicate:v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 executeFetchRequest:v9 error:a5]);

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a5);
  if (v12 && [v12 count]) {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);
  }
  else {
    id v13 = 0LL;
  }

  return v13;
}

- (id)fetchDownloadRecordById:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"DownloadRecord"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"downloadId = %@",  v6));

  [v7 setPredicate:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 executeFetchRequest:v7 error:a4]);

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a4);
  if (v10 && [v10 count]) {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

- (BOOL)hasPendingDownloadForUUID:(id)a3 error:(id *)a4
{
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_1001B2354;
  uint64_t v18 = sub_1001B2364;
  id v19 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001B236C;
  v9[3] = &unk_100284C70;
  id v10 = self;
  id v5 = a3;
  id v11 = v5;
  id v12 = &v14;
  id v13 = &v20;
  -[TransparencyManagedDataStore performBlockAndWait:](v10, "performBlockAndWait:", v9);
  if (a4)
  {
    id v6 = (void *)v15[5];
    if (v6) {
      *a4 = v6;
    }
  }

  char v7 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

- (BOOL)setResponse:(id)a3 downloadId:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  char v23 = sub_1001B2354;
  uint64_t v24 = sub_1001B2364;
  id v25 = 0LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001B2590;
  v14[3] = &unk_100278F60;
  id v9 = a4;
  id v15 = v9;
  uint64_t v16 = self;
  uint64_t v18 = &v20;
  id v10 = v8;
  id v17 = v10;
  id v19 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v14);
  if (a5)
  {
    id v11 = (void *)v21[5];
    if (v11) {
      *a5 = v11;
    }
  }

  char v12 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

- (BOOL)deleteDownloadRecordById:(id)a3 error:(id *)a4
{
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = sub_1001B2354;
  uint64_t v22 = sub_1001B2364;
  id v23 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001B2A08;
  v13[3] = &unk_100284C70;
  uint64_t v14 = self;
  id v6 = a3;
  id v15 = v6;
  uint64_t v16 = &v18;
  id v17 = &v24;
  -[TransparencyManagedDataStore performBlockAndWait:](v14, "performBlockAndWait:", v13);
  if (*((_BYTE *)v25 + 24))
  {
    BOOL v7 = 1;
  }

  else
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"DownloadRecord",  1LL,  -190LL,  v19[5]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001B2AE0;
    v10[3] = &unk_100279700;
    id v11 = v6;
    char v12 = &v18;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v10);
    if (a4)
    {
      id v8 = (void *)v19[5];
      if (v8) {
        *a4 = v8;
      }
    }

    BOOL v7 = *((_BYTE *)v25 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v7;
}

- (BOOL)deleteDownloadRecords:(id)a3 error:(id *)a4
{
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = sub_1001B2354;
  uint64_t v22 = sub_1001B2364;
  id v23 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001B2DA0;
  v13[3] = &unk_100284C70;
  id v6 = a3;
  id v14 = v6;
  id v15 = self;
  uint64_t v16 = &v18;
  id v17 = &v24;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v13);
  if (!*((_BYTE *)v25 + 24))
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"DownloadRecord",  1LL,  -190LL,  v19[5]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001B2EDC;
    v10[3] = &unk_100279700;
    id v11 = v6;
    char v12 = &v18;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v10);
  }

  if (a4)
  {
    BOOL v7 = (void *)v19[5];
    if (v7) {
      *a4 = v7;
    }
  }

  char v8 = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v8;
}

- (BOOL)deleteDownloadRecord:(unint64_t)a3 application:(id)a4 error:(id *)a5
{
  uint64_t v26 = 0LL;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_1001B2354;
  uint64_t v24 = sub_1001B2364;
  id v25 = 0LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001B31A8;
  v14[3] = &unk_1002887A8;
  id v15 = self;
  unint64_t v19 = a3;
  id v7 = a4;
  id v16 = v7;
  id v17 = &v20;
  uint64_t v18 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](v15, "performBlockAndWait:", v14);
  if (!*((_BYTE *)v27 + 24))
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  @"DownloadRecord",  1LL,  -190LL,  v21[5]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001B3280;
    v11[3] = &unk_100279700;
    id v12 = v7;
    id v13 = &v20;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v11);
  }

  if (a5)
  {
    char v8 = (void *)v21[5];
    if (v8) {
      *a5 = v8;
    }
  }

  char v9 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v9;
}

- (BOOL)performAndWaitForDownloadId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v26 = 0LL;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_1001B2354;
  uint64_t v24 = sub_1001B2364;
  id v25 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001B3500;
  v15[3] = &unk_100284FD0;
  void v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  uint64_t v18 = &v20;
  id v11 = v9;
  id v17 = v11;
  unint64_t v19 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a4)
  {
    id v12 = (void *)v21[5];
    if (v12) {
      *a4 = v12;
    }
  }

  char v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (id)createFetchRecord
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"FetchRecord",  v2));

  return v3;
}

- (id)createFetchRecordForRequestData:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore createFetchRecord](self, "createFetchRecord"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  [v10 setFetchId:v11];

  [v10 setRequestData:v9];
  [v10 setRequest:v8];

  if (-[TransparencyManagedDataStore persistWithError:](self, "persistWithError:", a5)) {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 fetchId]);
  }
  else {
    id v12 = 0LL;
  }
  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a5);

  return v12;
}

- (id)fetchFetchRecordById:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"FetchRecord"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"fetchId = %@",  v6));

  [v7 setPredicate:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 executeFetchRequest:v7 error:a4]);

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a4);
  if (v10 && [v10 count]) {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

- (BOOL)performAndWaitForFetchId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v26 = 0LL;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_1001B397C;
  uint64_t v24 = sub_1001B398C;
  id v25 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001B3994;
  v15[3] = &unk_100284FD0;
  void v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  uint64_t v18 = &v20;
  id v11 = v9;
  id v17 = v11;
  unint64_t v19 = &v26;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v15);
  if (a4)
  {
    id v12 = (void *)v21[5];
    if (v12) {
      *a4 = v12;
    }
  }

  char v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (TransparencyManagedDataStore)initWithController:(id)a3 followup:(id)a4 logger:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TransparencyManagedDataStore;
  id v11 = -[TransparencyManagedDataStore init](&v15, "init");
  id v12 = v11;
  if (v11)
  {
    -[TransparencyManagedDataStore setController:](v11, "setController:", v8);
    -[TransparencyManagedDataStore setLogger:](v12, "setLogger:", v10);
    dispatch_queue_t v13 = dispatch_queue_create("TransparencyManagedDataStore peerQueue", 0LL);
    -[TransparencyManagedDataStore setPeerQueue:](v12, "setPeerQueue:", v13);

    -[TransparencyManagedDataStore setContextRefCount:](v12, "setContextRefCount:", 0LL);
    -[TransparencyManagedDataStore setFollowup:](v12, "setFollowup:", v9);
    -[TransparencyManagedDataStore setServerRPCTimeoutSeconds:]( v12,  "setServerRPCTimeoutSeconds:",  (double)kTransparencyMaxmimumServerRPCWaitTime);
  }

  return v12;
}

+ (void)cleanseError:(id *)a3
{
  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[SecXPCHelper cleanseErrorForXPC:]( &OBJC_CLASS___SecXPCHelper,  "cleanseErrorForXPC:",  *a3));
  }
}

- (void)reportCoreDataEventForEntity:(id)a3 write:(BOOL)a4 code:(int64_t)a5 underlyingError:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore controller](self, "controller"));
  [v12 reportCoreDataEventForEntity:v11 write:v7 code:a5 underlyingError:v10];
}

- (void)reportCoreDataEventForEntity:(id)a3 hardFailure:(BOOL)a4 write:(BOOL)a5 code:(int64_t)a6 underlyingError:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore controller](self, "controller"));
  [v14 reportCoreDataEventForEntity:v13 hardFailure:v9 write:v8 code:a6 underlyingError:v12];
}

- (void)reportCoreDataPersistEventForLocation:(id)a3 underlyingError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore logger](self, "logger"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[SecXPCHelper cleanseErrorForXPC:](&OBJC_CLASS___SecXPCHelper, "cleanseErrorForXPC:", v6));

  v11[0] = @"entityType";
  v11[1] = @"write";
  v12[0] = @"Persistence";
  v12[1] = &__kCFBooleanTrue;
  v11[2] = @"location";
  v12[2] = v7;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));

  [v8 logResultForEvent:@"ktCoreDataEvent" hardFailure:1 result:v9 withAttributes:v10];
}

+ (id)serializeLoggableDatas:(id)a3
{
  id v3 = a3;
  id v4 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  -[NSKeyedArchiver encodeObject:forKey:](v4, "encodeObject:forKey:", v3, @"loggableDatas");

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v4, "encodedData"));
  return v5;
}

+ (BOOL)isStrictSecureDecodingEnabled
{
  return _os_feature_enabled_impl("Transparency", "KTStrictDecoding");
}

+ (id)deserializeLoggableDatas:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v17 = 0LL;
  id v7 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v6,  &v17);

  id v8 = v17;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([a1 supportedClassTypes]);
  id v16 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeTopLevelObjectOfClasses:forKey:error:]( v7,  "decodeTopLevelObjectOfClasses:forKey:error:",  v9,  @"loggableDatas",  &v16));
  id v11 = v16;

  if (!v10 && [v11 code] == (id)4864)
  {
    if (qword_1002EEFA0 != -1) {
      dispatch_once(&qword_1002EEFA0, &stru_10028A738);
    }
    id v12 = (void *)qword_1002EEFA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEFA8, OS_LOG_TYPE_ERROR))
    {
      id v13 = v12;
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
      *(_DWORD *)__int128 buf = 138412290;
      unint64_t v19 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to decode loggable data. Error: %@",  buf,  0xCu);
    }
  }

  if (a4 && v11) {
    *a4 = v11;
  }

  return v10;
}

+ (id)supportedClassTypes
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray, a2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v3);
  return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v2,  v4,  objc_opt_class(&OBJC_CLASS___KTLoggableData, v5),  0LL);
}

- (void)deleteObject:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  [v5 deleteObject:v4];
}

- (void)deleteObjectSet:(id)a3
{
  id v4 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[TransparencyManagedDataStore deleteObject:]( self,  "deleteObject:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (BOOL)clearState:(id *)a3
{
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = sub_1001D3770;
  uint64_t v26 = sub_1001D3780;
  id v27 = 0LL;
  uint64_t v18 = 0LL;
  unint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore controller](self, "controller"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 persistentContainer]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 managedObjectModel]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001D3788;
  void v12[3] = &unk_1002850F0;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 entities]);
  id v13 = v8;
  id v14 = &off_10029A3B8;
  objc_super v15 = self;
  id v16 = &v22;
  id v17 = &v18;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v12);
  if (a3)
  {
    __int128 v9 = (void *)v23[5];
    if (v9) {
      *a3 = v9;
    }
  }

  char v10 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (BOOL)garbageCollectEntityBatchDelete:(id)a3 predicate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  char v29 = sub_1001D3770;
  id v30 = sub_1001D3780;
  id v31 = 0LL;
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  uint64_t v20 = sub_1001D3C44;
  char v21 = &unk_10028A7C0;
  id v10 = v8;
  id v22 = v10;
  id v11 = v9;
  id v23 = v11;
  uint64_t v24 = self;
  id v25 = &v26;
  -[TransparencyManagedDataStore performBlockAndWaitWithMoc:](self, "performBlockAndWaitWithMoc:", &v18);
  __int128 v12 = v27;
  if (a5)
  {
    id v13 = (void *)v27[5];
    if (v13)
    {
      *a5 = v13;
      __int128 v12 = v27;
    }
  }

  uint64_t v14 = v12[5];
  if (v14)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  v10,  1LL,  -122LL,  v12[5],  v18,  v19,  v20,  v21,  v22);
    if (qword_1002EEFA0 != -1) {
      dispatch_once(&qword_1002EEFA0, &stru_10028A7E0);
    }
    objc_super v15 = (os_log_s *)qword_1002EEFA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEFA8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v27[5];
      *(_DWORD *)__int128 buf = 138412546;
      id v33 = v10;
      __int16 v34 = 2112;
      uint64_t v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "failed to garbage collect %@: %@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v26, 8);
  return v14 == 0;
}

- (BOOL)garbageCollectEntity:(id)a3 predicate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_1001D3770;
  id v31 = sub_1001D3780;
  id v32 = 0LL;
  uint64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  char v21 = sub_1001D4168;
  id v22 = &unk_10028A808;
  id v10 = v8;
  id v23 = v10;
  id v11 = v9;
  id v25 = self;
  uint64_t v26 = &v27;
  id v24 = v11;
  -[TransparencyManagedDataStore performBlockAndWaitWithMoc:](self, "performBlockAndWaitWithMoc:", &v19);
  uint64_t v12 = v28[5];
  if (v12)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[SecXPCHelper cleanseErrorForXPC:]( &OBJC_CLASS___SecXPCHelper,  "cleanseErrorForXPC:",  v28[5],  v19,  v20,  v21,  v22,  v23));
    uint64_t v14 = (void *)v28[5];
    v28[5] = v13;

    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  v10,  1LL,  -122LL,  v28[5]);
    if (qword_1002EEFA0 != -1) {
      dispatch_once(&qword_1002EEFA0, &stru_10028A828);
    }
    objc_super v15 = (os_log_s *)qword_1002EEFA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEFA8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v28[5];
      *(_DWORD *)__int128 buf = 138412546;
      id v34 = v10;
      __int16 v35 = 2112;
      uint64_t v36 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "failed to garbage collect %@: %@", buf, 0x16u);
    }

    if (a5)
    {
      id v17 = (void *)v28[5];
      if (v17) {
        *a5 = v17;
      }
    }
  }

  _Block_object_dispose(&v27, 8);
  return v12 == 0;
}

- (void)storeTTR:(id)a3 withType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v15 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v15));
  id v9 = v15;
  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001D45A8;
    void v11[3] = &unk_10028A890;
    id v12 = v7;
    id v13 = v6;
    id v14 = v8;
    -[TransparencyManagedDataStore performBlockAndWaitWithMoc:](self, "performBlockAndWaitWithMoc:", v11);
  }

  else
  {
    if (qword_1002EEFA0 != -1) {
      dispatch_once(&qword_1002EEFA0, &stru_10028A848);
    }
    id v10 = (os_log_s *)qword_1002EEFA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEFA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "storeTTR: archivedDataWithRootObject: %@",  buf,  0xCu);
    }
  }
}

- (id)getTapToRadarDate:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_1001D3770;
  id v17 = sub_1001D3780;
  id v18 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](&OBJC_CLASS___CachedData, "fetchRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"key = %@ AND application = %@",  @"TapToRadarDate",  v4));
  [v5 setPredicate:v6];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001D4A08;
  v10[3] = &unk_10028A8D8;
  id v7 = v5;
  id v11 = v7;
  id v12 = &v13;
  -[TransparencyManagedDataStore performBlockAndWaitWithMoc:](self, "performBlockAndWaitWithMoc:", v10);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (unint64_t)onMocCountEntity:(id)a3 predicate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  a3));
  [v9 setPredicate:v8];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  id v11 = [v10 countForFetchRequest:v9 error:a5];

  +[TransparencyManagedDataStore cleanseError:](&OBJC_CLASS___TransparencyManagedDataStore, "cleanseError:", a5);
  return (unint64_t)v11;
}

- (BOOL)logMetricsForApplication:(id)a3 error:(id *)a4
{
  uint64_t v20 = 0LL;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 1;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_1001D3770;
  id v18 = sub_1001D3780;
  id v19 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001D4D7C;
  v9[3] = &unk_100284C70;
  id v10 = self;
  id v5 = a3;
  id v11 = v5;
  id v12 = &v14;
  uint64_t v13 = &v20;
  -[TransparencyManagedDataStore performBlockAndWait:](v10, "performBlockAndWait:", v9);
  if (a4)
  {
    id v6 = (void *)v15[5];
    if (v6) {
      *a4 = v6;
    }
  }

  char v7 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

- (void)refaultObject:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  [v5 refreshObject:v4 mergeChanges:0];
}

- (void)saveAndRefaultObject:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  [v5 refreshObject:v4 mergeChanges:1];
}

- (void)refaultObjects:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allObjects", 0));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
        [v10 refreshObject:v9 mergeChanges:0];

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

- (BOOL)persistWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore controller](self, "controller"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
  LOBYTE(a3) = [v5 saveContext:v6 error:a3];

  return (char)a3;
}

- (BOOL)persistAndRefaultObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = -[TransparencyManagedDataStore persistWithError:](self, "persistWithError:", a4);
  if (v7) {
    -[TransparencyManagedDataStore refaultObject:](self, "refaultObject:", v6);
  }

  return v7;
}

- (BOOL)persistAndRefaultObjects:(id)a3 error:(id *)a4
{
  BOOL v5 = -[TransparencyManagedDataStore persistWithError:](self, "persistWithError:", a4);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](self, "context"));
    [v6 refreshAllObjects];
  }

  return v5;
}

- (BOOL)clearStateForApplication:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"application = %@",  a3));
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"KTRequest",  v6,  a4);
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"KTTreeHead",  v6,  a4);
  -[TransparencyManagedDataStore garbageCollectEntity:predicate:error:]( self,  "garbageCollectEntity:predicate:error:",  @"KTMutation",  v6,  a4);

  return 1;
}

- (id)copyStatistics:(id *)a3
{
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_1001D3770;
  id v19 = sub_1001D3780;
  uint64_t v20 = 0LL;
  uint64_t v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  __int128 v12 = sub_1001D3770;
  __int128 v13 = sub_1001D3780;
  id v14 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001D5344;
  v8[3] = &unk_10028A930;
  v8[4] = self;
  void v8[5] = &v15;
  v8[6] = &v9;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v8);
  if (a3)
  {
    BOOL v5 = (void *)v10[5];
    if (v5) {
      *a3 = v5;
    }
  }

  id v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (void)performOnBatchesOfEntity:(id)a3 predicate:(id)a4 enforceMax:(BOOL)a5 error:(id *)a6 block:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v37 = 0LL;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  id v40 = sub_1001D3770;
  id v41 = sub_1001D3780;
  id v42 = 0LL;
  uint64_t v31 = 0LL;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  id v34 = sub_1001D3770;
  __int16 v35 = sub_1001D3780;
  id v36 = 0LL;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1001D5834;
  v24[3] = &unk_10028A978;
  v24[4] = self;
  uint64_t v28 = &v31;
  id v15 = v12;
  id v25 = v15;
  id v16 = v13;
  id v26 = v16;
  BOOL v30 = a5;
  id v17 = v14;
  id v27 = v17;
  uint64_t v29 = &v37;
  -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v24);
  if (v32[5])
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:]( self,  "reportCoreDataEventForEntity:write:code:underlyingError:",  v15,  0LL,  -211LL);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1001D5B70;
    v20[3] = &unk_100284D58;
    id v21 = v15;
    id v22 = v16;
    char v23 = &v31;
    -[TransparencyManagedDataStore performBlockAndWait:](self, "performBlockAndWait:", v20);
    if (a6)
    {
      id v18 = (void *)v32[5];
      if (v18) {
        *a6 = v18;
      }
    }
  }

  else if (a6)
  {
    id v19 = (void *)v38[5];
    if (v19) {
      *a6 = v19;
    }
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
}

- (id)retainContext
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](v2, "context"));

  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore controller](v2, "controller"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 backgroundContext]);
    -[TransparencyManagedDataStore setContext:](v2, "setContext:", v5);
  }

  -[TransparencyManagedDataStore setContextRefCount:]( v2,  "setContextRefCount:",  (char *)-[TransparencyManagedDataStore contextRefCount](v2, "contextRefCount") + 1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore context](v2, "context"));
  objc_sync_exit(v2);

  return v6;
}

- (void)releaseContext
{
  id obj = self;
  objc_sync_enter(obj);
  -[TransparencyManagedDataStore setContextRefCount:]( obj,  "setContextRefCount:",  (char *)-[TransparencyManagedDataStore contextRefCount](obj, "contextRefCount") - 1);
  if (-[TransparencyManagedDataStore contextRefCount](obj, "contextRefCount") <= 0)
  {
    -[TransparencyManagedDataStore setContext:](obj, "setContext:", 0LL);
    -[TransparencyManagedDataStore setContextRefCount:](obj, "setContextRefCount:", 0LL);
  }

  objc_sync_exit(obj);
}

- (BOOL)drainDataStore
{
  unint64_t v3 = 120LL;
  do
  {
    id v4 = self;
    objc_sync_enter(v4);
    uint64_t v5 = -[TransparencyManagedDataStore contextRefCount](v4, "contextRefCount");
    objc_sync_exit(v4);

    sleep(1u);
    if (v3 < 2) {
      break;
    }
    --v3;
  }

  while (v5 >= 1);
  return v5 < 1;
}

- (void)performBlockAndWaitWithMoc:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D5EFC;
  v7[3] = &unk_10027C338;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore retainContext](self, "retainContext"));
  id v9 = v4;
  id v5 = v8;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
  -[TransparencyManagedDataStore releaseContext](self, "releaseContext");
}

- (void)performBlockAndWait:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001D5F84;
  v5[3] = &unk_10028A9C0;
  id v6 = a3;
  id v4 = v6;
  -[TransparencyManagedDataStore performBlockAndWaitWithMoc:](self, "performBlockAndWaitWithMoc:", v5);
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x3032000000LL;
  v10[3] = sub_1001D3770;
  void v10[4] = sub_1001D3780;
  id v11 = 0LL;
  id v11 = (id)os_transaction_create("com.apple.transparencyd.DBWrite");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyManagedDataStore retainContext](self, "retainContext"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D6094;
  v7[3] = &unk_10028A9E8;
  id v6 = v4;
  void v7[4] = self;
  id v8 = v6;
  id v9 = v10;
  [v5 performBlock:v7];

  _Block_object_dispose(v10, 8);
}

- (TransparencyManagedDataStoreController)controller
{
  return (TransparencyManagedDataStoreController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
}

- (NSManagedObjectContext)context
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setContext:(id)a3
{
}

- (TransparencyAnalytics)logger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLogger:(id)a3
{
}

- (TransparencyManagedDataStoreProtocol)updateDelegate
{
  return (TransparencyManagedDataStoreProtocol *)objc_loadWeakRetained((id *)&self->_updateDelegate);
}

- (void)setUpdateDelegate:(id)a3
{
}

- (TransparencyFollowUpProtocol)followup
{
  return (TransparencyFollowUpProtocol *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setFollowup:(id)a3
{
}

- (double)serverRPCTimeoutSeconds
{
  return self->_serverRPCTimeoutSeconds;
}

- (void)setServerRPCTimeoutSeconds:(double)a3
{
  self->_serverRPCTimeoutSeconds = a3;
}

- (OS_dispatch_queue)peerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setPeerQueue:(id)a3
{
}

- (TransparencyStaticKeyStore)staticKeyStore
{
  return (TransparencyStaticKeyStore *)objc_loadWeakRetained((id *)&self->_staticKeyStore);
}

- (void)setStaticKeyStore:(id)a3
{
}

- (TransparencyPeerOverrides)peerOverridesStore
{
  return (TransparencyPeerOverrides *)objc_loadWeakRetained((id *)&self->_peerOverridesStore);
}

- (void)setPeerOverridesStore:(id)a3
{
}

- (int64_t)contextRefCount
{
  return self->_contextRefCount;
}

- (void)setContextRefCount:(int64_t)a3
{
  self->_contextRefCount = a3;
}

- (void).cxx_destruct
{
}

@end