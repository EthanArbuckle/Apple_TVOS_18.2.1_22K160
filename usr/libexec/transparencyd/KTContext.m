@interface KTContext
+ (BOOL)checkNetworkError:(id)a3;
+ (BOOL)hasAccountMismatch:(id)a3;
+ (BOOL)hasReachedEligibilityThreshold:(id)a3;
+ (BOOL)isCurrentlyEligible:(id)a3;
+ (id)analyticsSelfFlagNames;
+ (id)analyticsSuccessNames;
+ (id)chunkArray:(id)a3 chunkSize:(unint64_t)a4;
+ (id)selfStatusFlagMetricsKey:(id)a3 name:(id)a4;
+ (id)successMetricsKey:(id)a3 validationName:(id)a4;
+ (id)successMetricsKey:(unint64_t)a3 forApplicationID:(id)a4;
+ (id)validateEventName:(unint64_t)a3 application:(id)a4;
+ (unint64_t)validateStaticKeyForPeer:(id)a3 accountKey:(id)a4 application:(id)a5 staticKeyStore:(id)a6 error:(id *)a7;
+ (void)checkAndLogHardErrorIfNecessary:(unint64_t)a3 type:(unint64_t)a4 logger:(id)a5 error:(id)a6 applicationID:(id)a7;
+ (void)metricsForResult:(unint64_t)a3 type:(unint64_t)a4 logger:(id)a5 applicationID:(id)a6;
+ (void)updateEligibilityThreshold:(id)a3;
- (BOOL)contextShouldGossip;
- (BOOL)drainContext;
- (BOOL)injectSelfVerificationFailure:(id)a3 failing:(id)a4 error:(id *)a5;
- (BOOL)peerStaticKeyFallback:(id)a3 accountKey:(id)a4 transparentData:(id *)a5;
- (BOOL)ready:(id *)a3;
- (BOOL)shouldShowCFU:(id)a3;
- (BOOL)unsupported:(id *)a3;
- (BOOL)validatePendingSMTs:(id)a3 singleQuery:(id)a4 error:(id *)a5;
- (BOOL)verifyInclusionProofDownload:(id)a3 error:(id *)a4;
- (BOOL)verifyInclusionProofDownloadRecord:(id)a3 error:(id *)a4;
- (KTAccountKeyServer)accountKeyServer;
- (KTApplicationPublicKeyStore)applicationKeyStore;
- (KTCloudRecordsProtocol)cloudRecords;
- (KTCondition)storedEligibilityResult;
- (KTContext)initWithApplicationID:(id)a3 dependencies:(id)a4;
- (KTContext)initWithApplicationKeyStore:(id)a3 dataStore:(id)a4 smDataStore:(id)a5 staticKeyStore:(id)a6 logClient:(id)a7 applicationID:(id)a8 contextStore:(id)a9 accountKeyServer:(id)a10 stateMachine:(id)a11 kvs:(id)a12 cloudRecords:(id)a13 followup:(id)a14 settings:(id)a15 analyticsLogger:(id)a16 tapToRadar:(id)a17 eligibilityStatusReporter:(id)a18;
- (KTContextStore)contextStore;
- (KTContextVerifier)verifier;
- (KTLogClientProtocol)logClient;
- (KTOptInManagerServer)optInServer;
- (KTSMDataStore)smDataStore;
- (KTSMManager)stateMachine;
- (KTTapToRadarProtocol)tapToRadar;
- (NSString)applicationID;
- (OS_dispatch_queue)eligibilityQueue;
- (TransparencyAnalytics)analyticsLogger;
- (TransparencyFollowUpProtocol)followUp;
- (TransparencyManagedDataStore)dataStore;
- (TransparencySettingsProtocol)settings;
- (TransparencyStaticKeyStore)staticKeyStore;
- (TransparencyTranscript)transcript;
- (_TtC13transparencyd28KTEligibilityStatusReporting)eligibilityStatusReporter;
- (id)analyticsForResponse:(id)a3 type:(unint64_t)a4 uri:(id)a5 result:(unint64_t)a6 ktCapable:(BOOL)a7;
- (id)analyticsForType:(unint64_t)a3 uri:(id)a4 accountKey:(id)a5 serverLoggableDatas:(id)a6 syncedLoggableDatas:(id)a7 transparentData:(id)a8 selfVerificationInfo:(id)a9 responseTime:(id)a10 result:(unint64_t)a11 failure:(id)a12 responseMetadata:(id)a13;
- (id)copyState;
- (id)createQueryRequestForKTRequest:(id)a3 error:(id *)a4;
- (id)metadataForInsertResponse:(id)a3;
- (id)parseQueryRequestFromKTRequest:(id)a3 error:(id *)a4;
- (id)parseQueryResponseFromKTRequest:(id)a3 error:(id *)a4;
- (id)parseSTHData:(id)a3 error:(id *)a4;
- (id)retrieveTLTSTH:(id *)a3;
- (id)serverLoggableDatasDiagnostics:(id)a3 selfPushToken:(id)a4 humbled:(BOOL *)a5;
- (unint64_t)deserializeServerLoggableDatas:(id)a3 loggableDatas:(id *)a4 error:(id *)a5;
- (unint64_t)deserializeSyncedLoggableDatas:(id)a3 loggableDatas:(id *)a4 error:(id *)a5;
- (unint64_t)fetchAndValidateEnrollKTRequest:(id)a3 transparentData:(id *)a4 loggableDatas:(id *)a5 cloudOptIn:(id)a6 error:(id *)a7;
- (unint64_t)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8;
- (unint64_t)handleInsertResponse:(id)a3 uri:(id)a4 fetchId:(id)a5 error:(id *)a6 transparentDataHandler:(id)a7;
- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8;
- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 validateType:(unint64_t)a7 ktCapable:(BOOL)a8 error:(id *)a9 transparentDataHandler:(id)a10;
- (unint64_t)synchronousFetchAndValidatePeerKTRequest:(id)a3 fetchNow:(BOOL)a4 transparentData:(id *)a5 loggableDatas:(id *)a6 error:(id *)a7;
- (unint64_t)synchronousFetchAndValidatePeerKTRequest:(id)a3 transparentData:(id *)a4 loggableDatas:(id *)a5 error:(id *)a6;
- (unint64_t)validateAndReportEnroll:(id)a3 transparentData:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 initialResult:(unint64_t)a7 idsResponseTime:(id)a8 responseMetadata:(id)a9 error:(id *)a10;
- (unint64_t)validateAndReportPeer:(id)a3 transparentData:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 initialResult:(unint64_t)a7 idsResponseTime:(id)a8 responseMetadata:(id)a9 error:(id *)a10;
- (unint64_t)validateAndReportPeerOrEnroll:(id)a3 type:(unint64_t)a4 transparentData:(id)a5 accountKey:(id)a6 loggableDatas:(id)a7 initialResult:(unint64_t)a8 idsResponseTime:(id)a9 responseMetadata:(id)a10 error:(id *)a11;
- (unint64_t)validateAndReportSelf:(id)a3 transparentData:(id)a4 accountKey:(id)a5 serverloggableDatas:(id)a6 syncedLoggableDatas:(id)a7 selfVerificationInfo:(id)a8 optInCheck:(BOOL)a9 cloudDevices:(id)a10 pcsAccountKey:(id)a11 kvsOptInHistory:(id)a12 isReplay:(BOOL)a13 initialResult:(unint64_t)a14 idsResponseTime:(id)a15 responseMetadata:(id)a16 error:(id *)a17;
- (unint64_t)validateEnrollKTRequest:(id)a3 insertResponse:(id)a4 transparentData:(id *)a5 loggableDatas:(id *)a6 cloudOptIn:(id)a7 error:(id *)a8;
- (unint64_t)validateEnrollmentRequestId:(id)a3 transparentData:(id *)a4 loggableDatas:(id *)a5 cloudOptIn:(id)a6 error:(id *)a7;
- (unint64_t)validatePeer:(id)a3 transparentData:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 selfVerificationInfo:(id)a7 enforceStaticKey:(BOOL)a8 idsResponseTime:(id)a9 responseTime:(id)a10 error:(id *)a11;
- (unint64_t)validatePeerOrEnrollKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 transparentData:(id *)a6 loggableDatas:(id *)a7 error:(id *)a8;
- (unint64_t)validateSelf:(id)a3 transparentData:(id)a4 accountKey:(id)a5 serverloggableDatas:(id)a6 syncedLoggableDatas:(id)a7 selfVerificationInfo:(id)a8 idsResponseTime:(id)a9 responseTime:(id)a10 optInCheck:(BOOL)a11 cloudDevices:(id)a12 pcsAccountKey:(id)a13 kvsOptInHistory:(id)a14 isReplay:(BOOL)a15 error:(id *)a16;
- (unint64_t)validateSelfKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 selfVerificationInfo:(id)a6 optInCheck:(BOOL)a7 cloudDevices:(id)a8 pcsAccountKey:(id)a9 kvsOptInHistory:(id)a10 isReplay:(BOOL)a11 transparentData:(id *)a12 loggableDatas:(id *)a13 error:(id *)a14;
- (unint64_t)validateSelfKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 selfVerificationInfo:(id)a6 optInCheck:(BOOL)a7 cloudDevices:(id)a8 transparentData:(id *)a9 loggableDatas:(id *)a10 error:(id *)a11;
- (unint64_t)validateStaticKeyForPeer:(id)a3 accountKey:(id)a4 error:(id *)a5;
- (unint64_t)verifyConsistencyProofDownload:(id)a3 error:(id *)a4;
- (unint64_t)verifyConsistencyProofDownloadRecord:(id)a3 error:(id *)a4;
- (unint64_t)writeResult:(unint64_t)a3 request:(id)a4 proof:(id)a5 error:(id *)a6;
- (unint64_t)writeResult:(unint64_t)a3 request:(id)a4 proof:(id)a5 replay:(BOOL)a6 error:(id *)a7;
- (void)analyticsForDecodeFailure:(id)a3 error:(id)a4;
- (void)analyticsForParseFailure:(id)a3;
- (void)analyticsForPredateLogBeginningMs:(unint64_t)a3 expectedLogBeginningMS:(unint64_t)a4 sth:(id)a5;
- (void)analyticsForTooNewLogBeginningMs:(unint64_t)a3 expectedLogBeginningMS:(unint64_t)a4 sth:(id)a5;
- (void)analyticsForUnsupportedProtocol:(int)a3 expected:(int)a4 sth:(id)a5;
- (void)clearSelfTicketState:(id)a3 responseTime:(id)a4;
- (void)clearState:(id)a3;
- (void)dealloc;
- (void)fetchAndValidatePeerKTRequest:(id)a3 fetchNow:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchQueryForKTRequest:(id)a3 completionHandler:(id)a4;
- (void)fetchQueryForKTRequest:(id)a3 userInitiated:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchRPCSingleQuery:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 backgroundOpId:(id)a6 completionHandler:(id)a7;
- (void)fetchRPCSingleQuery:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 completionHandler:(id)a6;
- (void)logFinishFailureEvent:(id)a3 error:(id)a4;
- (void)logFinishSuccessEvent:(id)a3;
- (void)logStartEvent:(id)a3;
- (void)optInStateForUri:(id)a3 completionHandler:(id)a4;
- (void)processSTHsFromPeers:(id)a3 verifier:(id)a4 completionHandler:(id)a5;
- (void)queryForUris:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 backgroundOpId:(id)a6 completionHandler:(id)a7;
- (void)queryForUris:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 completionHandler:(id)a6;
- (void)recordEnrollOptInRecord:(id)a3 accountKey:(id)a4 transparentData:(id)a5 cloudOptIn:(id)a6;
- (void)replaySelfValidate:(id)a3 pcsAccountKey:(id)a4 queryRequest:(id)a5 queryResponse:(id)a6 responseTime:(id)a7 completionHandler:(id)a8;
- (void)reportValidationTime:(unint64_t)a3 initialResult:(unint64_t)a4 result:(unint64_t)a5 idsResponseTime:(id)a6;
- (void)selfValidationURIStatus:(id)a3 transparentData:(id)a4 selfDeviceID:(id)a5 logger:(id)a6;
- (void)setAccountKeyServer:(id)a3;
- (void)setAnalyticsLogger:(id)a3;
- (void)setApplicationID:(id)a3;
- (void)setApplicationKeyStore:(id)a3;
- (void)setCloudRecords:(id)a3;
- (void)setContextStore:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setEligibilityQueue:(id)a3;
- (void)setEligibilityStatusReporter:(id)a3;
- (void)setFollowUp:(id)a3;
- (void)setLogClient:(id)a3;
- (void)setOptInServer:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSmDataStore:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setStaticKeyStore:(id)a3;
- (void)setStoredEligibilityResult:(id)a3;
- (void)setTapToRadar:(id)a3;
- (void)setTranscript:(id)a3;
- (void)setVerifier:(id)a3;
- (void)storeEligibilityMetric:(unint64_t)a3 result:(unint64_t)a4 error:(id)a5;
- (void)validatePeer:(id)a3 verificationInfo:(id)a4 fetchNow:(BOOL)a5 completionBlock:(id)a6;
- (void)validatePeerIDSKTVerification:(id)a3 batchQuery:(id)a4 completionBlock:(id)a5;
- (void)validatePeerIDSKTVerification:(id)a3 serverRPC:(id)a4 completionBlock:(id)a5;
- (void)validatePeerIDSKTVerification:(id)a3 singleQuery:(id)a4 completionBlock:(id)a5;
- (void)validatePeerRequestId:(id)a3 revalidate:(BOOL)a4 fetchNow:(BOOL)a5 completionHandler:(id)a6;
- (void)validatePeers:(id)a3 fetchNow:(BOOL)a4 completionBlock:(id)a5;
- (void)validatePendingPeersForBatchQuery:(id)a3;
- (void)validatePendingPeersForRpcId:(id)a3;
- (void)validatePendingPeersForSingleQuery:(id)a3;
- (void)validatePendingSMTsForBatchQuery:(id)a3;
- (void)validatePendingSMTsForRpcId:(id)a3;
- (void)validatePendingSMTsForSingleQuery:(id)a3;
- (void)writeLoggableDatas:(id)a3 request:(id)a4;
- (void)writeResult:(id)a3 verification:(id)a4;
@end

@implementation KTContext

- (BOOL)validatePendingSMTs:(id)a3 singleQuery:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  v58[0] = 0LL;
  v46 = (void *)objc_claimAutoreleasedReturnValue([v7 getQueryRequest:v58]);
  id v8 = v58[0];
  id v57 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 getQueryResponse:&v57]);
  id v10 = v57;

  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 metadata]);
  uint64_t v12 = kTransparencyResponseMetadataKeyServerHint;
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint]);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 metadata]);
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"APS"]);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v17 = v16;
  v43 = (void *)v15;
  v44 = (void *)v13;
  if (v13 | v15)
  {
    if (v13) {
      [v16 setObject:v13 forKey:v12];
    }
    if (v15) {
      [v17 setObject:&__kCFBooleanTrue forKey:@"APS"];
    }
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v7 backgroundOpId]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 UUIDString]);
  [v17 setObject:v19 forKeyedSubscript:@"opUUID"];

  if (v46 && v9)
  {
    uint64_t v53 = 0LL;
    v54 = &v53;
    uint64_t v55 = 0x2020000000LL;
    char v56 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v7 responseTime]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v7 rpcId]);
    id v52 = v10;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_100004234;
    v47[3] = &unk_100276508;
    v47[4] = self;
    id v41 = v6;
    id v48 = v41;
    id v23 = v9;
    id v49 = v23;
    id v24 = v17;
    id v50 = v24;
    v51 = &v53;
    id v40 = [v20 handleQueryResponse:v23 queryRequest:v46 receiptDate:v21 fetchId:v22 error:&v52 rawDataHandler:v47];
    id v42 = v6;
    id v25 = v52;

    v26 = v44;
    if (v25)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v25 domain]);
      else {
        BOOL v28 = 0LL;
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
      v35 = (void *)objc_claimAutoreleasedReturnValue([v23 data]);
      unsigned __int8 v36 = [v34 failSMTsIfOverMMD:v41 skipOptInOut:v28 proof:v35 underlyingError:v25 errorCode:-306 analyticsData:v24];

      if ((v36 & 1) == 0) {
        *((_BYTE *)v54 + 24) = 1;
      }
      if (!v40)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        v38 = (void *)objc_claimAutoreleasedReturnValue([v7 rpcId]);
        [v37 failRpcId:v38 failure:v25 error:0];
      }
    }

    LOBYTE(v32) = *((_BYTE *)v54 + 24) != 0;

    _Block_object_dispose(&v53, 8);
    v33 = v42;
  }

  else
  {
    BOOL v29 = [v9 status] == 7;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v9 data]);
    unsigned int v32 = [v30 failSMTsIfOverMMD:v6 skipOptInOut:v29 proof:v31 underlyingError:v10 errorCode:-306 analyticsData:v17] ^ 1;

    v33 = v6;
    id v25 = v10;
    v26 = (void *)v13;
  }

  return v32;
}

- (void)validatePendingSMTsForSingleQuery:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uri]);
  id v21 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000046A0;
  v19[3] = &unk_100276550;
  v19[4] = self;
  id v8 = v4;
  id v20 = v8;
  unsigned __int8 v9 = [v5 performForPendingSMTs:v6 uri:v7 error:&v21 batchSize:20 block:v19];
  id v10 = v21;

  if ((v9 & 1) != 0 || !v10)
  {
    if ((v9 & 1) == 0)
    {
      if (qword_1002E6380 != -1) {
        dispatch_once(&qword_1002E6380, &stru_100276590);
      }
      v18 = (void *)qword_1002E6388;
      if (os_log_type_enabled((os_log_t)qword_1002E6388, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = v18;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 rpcId]);
        *(_DWORD *)buf = 138543362;
        id v23 = v13;
        v14 = "no pending SMTs found for rpcId %{public}@";
        uint64_t v15 = v12;
        os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
        uint32_t v17 = 12;
        goto LABEL_12;
      }
    }
  }

  else
  {
    if (qword_1002E6380 != -1) {
      dispatch_once(&qword_1002E6380, &stru_100276570);
    }
    v11 = (void *)qword_1002E6388;
    if (os_log_type_enabled((os_log_t)qword_1002E6388, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = v11;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 rpcId]);
      *(_DWORD *)buf = 138543618;
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v10;
      v14 = "no pending SMTs found for rpcId %{public}@: %@";
      uint64_t v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 22;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v17);
    }
  }
}

- (void)validatePendingSMTsForBatchQuery:(id)a3
{
  id v3 = a3;
  if (qword_1002E6380 != -1) {
    dispatch_once(&qword_1002E6380, &stru_1002765B0);
  }
  id v4 = (os_log_s *)qword_1002E6388;
  if (os_log_type_enabled((os_log_t)qword_1002E6388, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "validatePendingSMTsForBatchQuery: batch query is unimplemented",  v5,  2u);
  }
}

- (void)validatePendingSMTsForRpcId:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v9[4] = self;
  id v10 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100004A70;
  v9[3] = &unk_1002765F8;
  unsigned __int8 v6 = [v5 performAndWaitForRpcId:v4 error:&v10 block:v9];
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    if (qword_1002E6380 != -1) {
      dispatch_once(&qword_1002E6380, &stru_100276618);
    }
    id v8 = (os_log_s *)qword_1002E6388;
    if (os_log_type_enabled((os_log_t)qword_1002E6388, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "failed to find rpc for rpcId %{public}@: %@",  buf,  0x16u);
    }
  }
}

+ (unint64_t)validateStaticKeyForPeer:(id)a3 accountKey:(id)a4 application:(id)a5 staticKeyStore:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication stripApplicationPrefixForIdentifier:uri:]( &OBJC_CLASS___TransparencyApplication,  "stripApplicationPrefixForIdentifier:uri:",  a5,  v11));
  id v40 = 0LL;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 findStaticKeyByHandle:v14 error:&v40]);

  id v16 = v40;
  if (v15
    || (uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue([0 publicKeyID]), v17, v17))
  {
    if (v12)
    {
      id v39 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:error:]( &OBJC_CLASS___KTAccountPublicID,  "ktAccountPublicIDWithPublicKeyInfo:error:",  v12,  &v39));
      id v19 = v39;

      if (v18)
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 publicKeyID]);
        unsigned __int8 v21 = [v18 isEqual:v20];

        if ((v21 & 1) != 0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v15 handles]);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v14]);

          if ([v23 errorCode])
          {
            if (a7) {
              *a7 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  (int)[v23 errorCode],  @"Synthetic mock error"));
            }
            unint64_t v24 = 2LL;
          }

          else
          {
            unint64_t v24 = 0LL;
          }
        }

        else
        {
          v38 = a7;
          v41[0] = @"peerID";
          BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v18 publicAccountIdentity]);
          v41[1] = @"entry";
          v42[0] = v29;
          v30 = (void *)objc_claimAutoreleasedReturnValue([v15 publicKeyID]);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 publicAccountIdentity]);
          v42[1] = v31;
          unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  2LL));

          v33 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:userinfo:description:",  kTransparencyErrorDecode,  -304LL,  0LL,  v32,  @"Static key mismatch"));
          if (qword_1002E63A0 != -1) {
            dispatch_once(&qword_1002E63A0, &stru_100276978);
          }
          v34 = (os_log_s *)qword_1002E63A8;
          if (os_log_type_enabled((os_log_t)qword_1002E63A8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v44 = (uint64_t)v11;
            __int16 v45 = 2112;
            id v46 = v33;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Failed to validateStaticKeyForPeer %@: %@",  buf,  0x16u);
          }

          if (v38) {
            id *v38 = v33;
          }

          unint64_t v24 = 2LL;
          id v19 = v33;
        }
      }

      else
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:userinfo:description:",  kTransparencyErrorDecode,  -305LL,  0LL,  0LL,  @"failed to decode"));

        if (qword_1002E63A0 != -1) {
          dispatch_once(&qword_1002E63A0, &stru_100276958);
        }
        v26 = (void *)qword_1002E63A8;
        if (os_log_type_enabled((os_log_t)qword_1002E63A8, OS_LOG_TYPE_ERROR))
        {
          v27 = v26;
          BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_hexString"));
          *(_DWORD *)buf = 138412802;
          uint64_t v44 = (uint64_t)v11;
          __int16 v45 = 2112;
          id v46 = v28;
          __int16 v47 = 2112;
          id v48 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Failed to parse account key %@ %@: %@",  buf,  0x20u);
        }

        if (a7)
        {
          id v19 = v25;
          *a7 = v19;
          unint64_t v24 = 5LL;
        }

        else
        {
          unint64_t v24 = 5LL;
          id v19 = v25;
        }
      }

      id v16 = v19;
    }

    else
    {
      if (a7) {
        *a7 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -305LL,  @"Static key missing"));
      }
      unint64_t v24 = 5LL;
    }
  }

  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue([0 publicKeyID]);

    if (!v35)
    {
      if (qword_1002E63A0 != -1) {
        dispatch_once(&qword_1002E63A0, &stru_100276938);
      }
      unsigned __int8 v36 = (os_log_s *)qword_1002E63A8;
      if (os_log_type_enabled((os_log_t)qword_1002E63A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 141558274;
        uint64_t v44 = 1752392040LL;
        __int16 v45 = 2112;
        id v46 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "Static key entry for %{mask.hash}@ missing publicKeyID",  buf,  0x16u);
      }
    }

    unint64_t v24 = 1LL;
  }

  return v24;
}

- (unint64_t)validateStaticKeyForPeer:(id)a3 accountKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v11 = (void *)objc_opt_class(self, v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext staticKeyStore](self, "staticKeyStore"));
  id v14 = [v11 validateStaticKeyForPeer:v9 accountKey:v8 application:v12 staticKeyStore:v13 error:a5];

  return (unint64_t)v14;
}

- (unint64_t)validatePeer:(id)a3 transparentData:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 selfVerificationInfo:(id)a7 enforceStaticKey:(BOOL)a8 idsResponseTime:(id)a9 responseTime:(id)a10 error:(id *)a11
{
  id v25 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  [a9 timeIntervalSinceReferenceDate];
  id v27 = 0LL;
  unsigned __int8 v17 = objc_msgSend( v14,  "validateAndUpdateWithServerLoggableDatas:accountKey:idsResponseTime:error:",  v16,  v15,  &v27);
  id v18 = v27;
  if ((v17 & 1) != 0)
  {
    unint64_t v19 = 1LL;
  }

  else
  {
    if (qword_1002E63A0 != -1) {
      dispatch_once(&qword_1002E63A0, &stru_100276998);
    }
    id v20 = (os_log_s *)qword_1002E63A8;
    if (os_log_type_enabled((os_log_t)qword_1002E63A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558530;
      uint64_t v29 = 1752392040LL;
      __int16 v30 = 2112;
      id v31 = v25;
      __int16 v32 = 2112;
      id v33 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to verify %{mask.hash}@ transparency: %@",  buf,  0x20u);
    }

    unint64_t v19 = 0LL;
    if (a11 && v18)
    {
      unint64_t v19 = 0LL;
      *a11 = v18;
    }
  }

  id v26 = v18;
  unsigned __int8 v21 = +[KTContextVerifier verifyLoggableDataSignatures:accountKey:error:]( &OBJC_CLASS___KTContextVerifier,  "verifyLoggableDataSignatures:accountKey:error:",  v16,  v15,  &v26);
  id v22 = v26;

  if ((v21 & 1) == 0)
  {
    if (qword_1002E63A0 != -1) {
      dispatch_once(&qword_1002E63A0, &stru_1002769B8);
    }
    id v23 = (os_log_s *)qword_1002E63A8;
    if (os_log_type_enabled((os_log_t)qword_1002E63A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558530;
      uint64_t v29 = 1752392040LL;
      __int16 v30 = 2112;
      id v31 = v25;
      __int16 v32 = 2112;
      id v33 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Failed to verify %{mask.hash}@ signatures: %@",  buf,  0x20u);
    }

    if (a11 && v22) {
      *a11 = v22;
    }
    [v14 setStaticKeyStatus:4];
    unint64_t v19 = 0LL;
  }

  return v19;
}

- (BOOL)injectSelfVerificationFailure:(id)a3 failing:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v7;
  id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    char v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceID]);
        unsigned int v16 = [v8 containsObject:v15];

        if (v16)
        {
          unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:errorLevel:underlyingError:userinfo:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:errorLevel:underlyingError:userinfo:description:",  @"TransparencyErrorVerify",  -397LL,  4LL,  0LL,  0LL,  @"Testing force self error"));
          [v14 setResult:0];
          [v14 setFailure:v17];
          if (a5 && v17) {
            *a5 = v17;
          }

          char v11 = 1;
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v10);
  }

  else
  {
    char v11 = 0;
  }

  return v11 & 1;
}

- (unint64_t)validateSelf:(id)a3 transparentData:(id)a4 accountKey:(id)a5 serverloggableDatas:(id)a6 syncedLoggableDatas:(id)a7 selfVerificationInfo:(id)a8 idsResponseTime:(id)a9 responseTime:(id)a10 optInCheck:(BOOL)a11 cloudDevices:(id)a12 pcsAccountKey:(id)a13 kvsOptInHistory:(id)a14 isReplay:(BOOL)a15 error:(id *)a16
{
  id v82 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a7;
  id v25 = a10;
  id v84 = a12;
  id v26 = a13;
  id v79 = a14;
  id v91 = 0LL;
  id v73 = v25;
  v83 = v25;
  id v27 = v82;
  BOOL v28 = v21;
  id v29 = v22;
  __int16 v30 = self;
  unint64_t v77 = -[KTContext validatePeer:transparentData:accountKey:loggableDatas:selfVerificationInfo:enforceStaticKey:idsResponseTime:responseTime:error:]( self,  "validatePeer:transparentData:accountKey:loggableDatas:selfVerificationInfo:enforceStaticKey:idsResponseTime:re sponseTime:error:",  a9,  v73,  &v91);
  id v31 = v91;
  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext settings](self, "settings"));
  uint64_t v33 = objc_claimAutoreleasedReturnValue([v32 testingSelfValidationFailing]);

  v34 = (void *)v33;
  if (v33
    && -[KTContext injectSelfVerificationFailure:failing:error:]( v30,  "injectSelfVerificationFailure:failing:error:",  v23,  v33,  a16))
  {
    v35 = v79;
    unsigned __int8 v36 = v28;
    v37 = v29;
    unint64_t v38 = 0LL;
    goto LABEL_48;
  }

  v80 = (void *)v33;
  id v81 = v26;
  id v90 = v31;
  id v78 = v23;
  unsigned __int8 v39 = +[KTContextVerifier verifyServerLoggableDatas:againstSyncedLoggableDatas:cloudDevices:error:]( &OBJC_CLASS___KTContextVerifier,  "verifyServerLoggableDatas:againstSyncedLoggableDatas:cloudDevices:error:",  v23,  v24,  v84,  &v90);
  id v40 = v90;

  if ((v39 & 1) == 0)
  {
    if (qword_1002E63A0 != -1) {
      dispatch_once(&qword_1002E63A0, &stru_1002769D8);
    }
    unsigned __int8 v36 = v28;
    id v42 = (os_log_s *)qword_1002E63A8;
    v37 = v29;
    if (os_log_type_enabled((os_log_t)qword_1002E63A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558530;
      uint64_t v93 = 1752392040LL;
      __int16 v94 = 2112;
      id v95 = v82;
      __int16 v96 = 2112;
      id v97 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "Failed to verify %{mask.hash}@ server data against synced data: %@",  buf,  0x20u);
    }

    unint64_t v38 = 0LL;
    id v26 = v81;
    if (a16 && v40)
    {
      id v31 = v40;
      unint64_t v38 = 0LL;
      *a16 = v31;
LABEL_37:
      v35 = v79;
      v34 = v80;
      id v23 = v78;
      goto LABEL_48;
    }

- (unint64_t)validateAndReportPeerOrEnroll:(id)a3 type:(unint64_t)a4 transparentData:(id)a5 accountKey:(id)a6 loggableDatas:(id)a7 initialResult:(unint64_t)a8 idsResponseTime:(id)a9 responseMetadata:(id)a10 error:(id *)a11
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  id v31 = (void *)objc_claimAutoreleasedReturnValue( +[KTContext validateEventName:application:]( &OBJC_CLASS___KTContext,  "validateEventName:application:",  a4,  v22));

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100008BDC;
  v33[3] = &unk_100276AE0;
  id v34 = v21;
  v35 = self;
  id v36 = v16;
  id v37 = v17;
  id v38 = v18;
  id v39 = v19;
  id v40 = v20;
  unint64_t v41 = a4;
  unint64_t v42 = a8;
  id v23 = v20;
  id v24 = v19;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  id v28 = v21;
  id v29 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:error:block:]( &OBJC_CLASS___TransparencyAnalytics,  "doKTResultWithAnalyticsForEventName:error:block:",  v31,  a11,  v33);

  return (unint64_t)v29;
}

- (unint64_t)validateAndReportPeer:(id)a3 transparentData:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 initialResult:(unint64_t)a7 idsResponseTime:(id)a8 responseMetadata:(id)a9 error:(id *)a10
{
  return -[KTContext validateAndReportPeerOrEnroll:type:transparentData:accountKey:loggableDatas:initialResult:idsResponseTime:responseMetadata:error:]( self,  "validateAndReportPeerOrEnroll:type:transparentData:accountKey:loggableDatas:initialResult:idsResponseTime:res ponseMetadata:error:",  a3,  0LL,  a4,  a5,  a6,  a7,  a8,  a9,  a10);
}

- (unint64_t)validateAndReportEnroll:(id)a3 transparentData:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 initialResult:(unint64_t)a7 idsResponseTime:(id)a8 responseMetadata:(id)a9 error:(id *)a10
{
  return -[KTContext validateAndReportPeerOrEnroll:type:transparentData:accountKey:loggableDatas:initialResult:idsResponseTime:responseMetadata:error:]( self,  "validateAndReportPeerOrEnroll:type:transparentData:accountKey:loggableDatas:initialResult:idsResponseTime:res ponseMetadata:error:",  a3,  2LL,  a4,  a5,  a6,  a7,  a8,  a9,  a10);
}

- (void)clearSelfTicketState:(id)a3 responseTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  id v21 = 0LL;
  id v10 = (char *)[v8 checkFollowupTicket:v9 uri:v6 checkTime:v7 error:&v21];

  id v11 = v21;
  if (v11 && [v11 code] != (id)-338)
  {
    if (qword_1002E63A0 != -1) {
      dispatch_once(&qword_1002E63A0, &stru_100276B00);
    }
    uint64_t v12 = (void *)qword_1002E63A8;
    if (os_log_type_enabled((os_log_t)qword_1002E63A8, OS_LOG_TYPE_ERROR))
    {
      id v13 = v12;
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
      *(_DWORD *)buf = 138544130;
      uint64_t v23 = (uint64_t)v14;
      __int16 v24 = 2160;
      uint64_t v25 = 1752392040LL;
      __int16 v26 = 2112;
      id v27 = v6;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to check followup ticket for %{public}@:%{mask.hash}@ with error: %@",  buf,  0x2Au);
    }
  }

  if ((unint64_t)(v10 - 1) <= 1)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
    id v20 = 0LL;
    unsigned __int8 v17 = [v15 clearFollowupTicket:v16 uri:v6 error:&v20];
    id v18 = v20;

    if ((v17 & 1) == 0)
    {
      if (qword_1002E63A0 != -1) {
        dispatch_once(&qword_1002E63A0, &stru_100276B20);
      }
      id v19 = (os_log_s *)qword_1002E63A8;
      if (os_log_type_enabled((os_log_t)qword_1002E63A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 141558530;
        uint64_t v23 = 1752392040LL;
        __int16 v24 = 2112;
        uint64_t v25 = (uint64_t)v6;
        __int16 v26 = 2112;
        id v27 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to clear followup ticket for %{mask.hash}@: %@",  buf,  0x20u);
      }
    }
  }
}

- (unint64_t)validateAndReportSelf:(id)a3 transparentData:(id)a4 accountKey:(id)a5 serverloggableDatas:(id)a6 syncedLoggableDatas:(id)a7 selfVerificationInfo:(id)a8 optInCheck:(BOOL)a9 cloudDevices:(id)a10 pcsAccountKey:(id)a11 kvsOptInHistory:(id)a12 isReplay:(BOOL)a13 initialResult:(unint64_t)a14 idsResponseTime:(id)a15 responseMetadata:(id)a16 error:(id *)a17
{
  id v50 = a3;
  id v22 = a4;
  id v23 = a5;
  id v49 = a6;
  id v48 = a7;
  id v52 = a8;
  id v51 = a10;
  id v24 = a11;
  id v25 = a12;
  id v26 = a15;
  id v27 = a16;
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"ResponseTime"]);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate kt_dateFromString:](&OBJC_CLASS___NSDate, "kt_dateFromString:", v28));

  id v46 = v25;
  if (a13)
  {
    LOBYTE(v43) = 1;
    id v42 = v25;
    __int16 v30 = v50;
    LOBYTE(v41) = a9;
    id v31 = v22;
    id v32 = v22;
    uint64_t v33 = v23;
    id v34 = v23;
    id v36 = v48;
    v35 = v49;
    id v37 = v24;
    id v38 = -[KTContext validateSelf:transparentData:accountKey:serverloggableDatas:syncedLoggableDatas:selfVerificationInfo:idsResponseTime:responseTime:optInCheck:cloudDevices:pcsAccountKey:kvsOptInHistory:isReplay:error:]( self,  "validateSelf:transparentData:accountKey:serverloggableDatas:syncedLoggableDatas:selfVerificationInfo:idsResp onseTime:responseTime:optInCheck:cloudDevices:pcsAccountKey:kvsOptInHistory:isReplay:error:",  v50,  v32,  v34,  v49,  v48,  v52,  v26,  v29,  v41,  v51,  v24,  v42,  v43,  a17);
  }

  else
  {
    id v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[KTContext validateEventName:application:]( &OBJC_CLASS___KTContext,  "validateEventName:application:",  1LL,  v39));

    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_100009404;
    v53[3] = &unk_100276B48;
    v53[4] = self;
    __int16 v30 = v50;
    id v54 = v50;
    id v31 = v22;
    id v55 = v22;
    uint64_t v33 = v23;
    id v56 = v23;
    v35 = v49;
    id v57 = v49;
    id v36 = v48;
    id v58 = v48;
    id v59 = v52;
    id v60 = v26;
    id v61 = v29;
    BOOL v65 = a9;
    id v62 = v51;
    unint64_t v64 = a14;
    id v63 = v27;
    id v47 = v24;
    id v38 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:error:block:]( &OBJC_CLASS___TransparencyAnalytics,  "doKTResultWithAnalyticsForEventName:error:block:",  v44,  a17,  v53);

    id v37 = v47;
  }

  return (unint64_t)v38;
}

- (unint64_t)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
  id v20 = [v19 handleBatchQueryResponse:v18 queryRequest:v17 receiptDate:v16 fetchId:v15 error:a7 transparentDataHandler:v14];

  return (unint64_t)v20;
}

- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 validateType:(unint64_t)a7 ktCapable:(BOOL)a8 error:(id *)a9 transparentDataHandler:(id)a10
{
  BOOL v32 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a10;
  id v18 = a6;
  id v19 = a5;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[KTContext validateEventName:application:]( &OBJC_CLASS___KTContext,  "validateEventName:application:",  a7,  v20));

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
  id v34 = 0LL;
  id v22 = [v21 handleQueryResponse:v15 queryRequest:v16 receiptDate:v19 fetchId:v18 error:&v34 transparentDataHandler:v17];

  id v23 = v34;
  if (v22 != (id)1)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v15 metadata]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v16 uri]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue( -[KTContext analyticsForResponse:type:uri:result:ktCapable:]( self,  "analyticsForResponse:type:uri:result:ktCapable:",  v24,  a7,  v25,  v22,  v32));

    if (v22)
    {
      uint64_t v27 = 0LL;
    }

    else
    {
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"ktSoftFailure"]);
      unsigned int v29 = [v28 BOOLValue];

      uint64_t v27 = v29 ^ 1;
    }

    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    [v30 logResultForEvent:v33 hardFailure:v27 result:v23 withAttributes:v26];
  }

  if (a9 && v23) {
    *a9 = v23;
  }

  return (unint64_t)v22;
}

- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8
{
  return -[KTContext handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:]( self,  "handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:",  a3,  a4,  a5,  a6,  3LL,  0LL,  a7,  a8);
}

- (id)metadataForInsertResponse:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serverEventInfo]);

  if (v4)
  {
    uint64_t v7 = kTransparencyResponseMetadataKeyServerHint;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 serverEventInfo]);
    id v8 = v5;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  }

  return v4;
}

- (unint64_t)handleInsertResponse:(id)a3 uri:(id)a4 fetchId:(id)a5 error:(id *)a6 transparentDataHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[KTContext validateEventName:application:]( &OBJC_CLASS___KTContext,  "validateEventName:application:",  2LL,  v16));

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100009AEC;
  v24[3] = &unk_100276B70;
  v24[4] = self;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:error:block:]( &OBJC_CLASS___TransparencyAnalytics,  "doKTResultWithAnalyticsForEventName:error:block:",  v17,  a6,  v24);

  return (unint64_t)v22;
}

- (KTContext)initWithApplicationID:(id)a3 dependencies:(id)a4
{
  id v5 = a4;
  id v22 = a3;
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationKeyStore]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 dataStore]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 smDataStore]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 staticKeyStore]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 logClient]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v5 contextStore]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 accountKeyServer]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 stateMachine]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 kvs]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudRecords]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 followup]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 settings]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 analyticsLogger]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 tapToRadar]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 eligibilityStatusReporter]);

  id v21 = -[KTContext initWithApplicationKeyStore:dataStore:smDataStore:staticKeyStore:logClient:applicationID:contextStore:accountKeyServer:stateMachine:kvs:cloudRecords:followup:settings:analyticsLogger:tapToRadar:eligibilityStatusReporter:]( self,  "initWithApplicationKeyStore:dataStore:smDataStore:staticKeyStore:logClient:applicationID:contextStore:accountK eyServer:stateMachine:kvs:cloudRecords:followup:settings:analyticsLogger:tapToRadar:eligibilityStatusReporter:",  v24,  v19,  v18,  v17,  v16,  v22,  v23,  v15,  v14,  v13,  v6,  v12,  v7,  v8,  v9,  v10);
  return v21;
}

- (KTContext)initWithApplicationKeyStore:(id)a3 dataStore:(id)a4 smDataStore:(id)a5 staticKeyStore:(id)a6 logClient:(id)a7 applicationID:(id)a8 contextStore:(id)a9 accountKeyServer:(id)a10 stateMachine:(id)a11 kvs:(id)a12 cloudRecords:(id)a13 followup:(id)a14 settings:(id)a15 analyticsLogger:(id)a16 tapToRadar:(id)a17 eligibilityStatusReporter:(id)a18
{
  id v58 = a3;
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  id v26 = a7;
  id v27 = a8;
  id v61 = a9;
  id v28 = a10;
  id v59 = a11;
  id v29 = a12;
  id v68 = a13;
  id v67 = a14;
  id v30 = a15;
  id v66 = a16;
  id v65 = a17;
  id v64 = a18;
  v70.receiver = self;
  v70.super_class = (Class)&OBJC_CLASS___KTContext;
  id v31 = -[KTContext init](&v70, "init");
  BOOL v32 = v31;
  id v62 = v26;
  id v63 = v24;
  id v60 = v30;
  if (!v31)
  {
    uint64_t v44 = v58;
    id v48 = v59;
    id v50 = v61;
    goto LABEL_7;
  }

  id v55 = v29;
  -[KTContext setApplicationID:](v31, "setApplicationID:", v27);
  -[KTContext setApplicationKeyStore:](v32, "setApplicationKeyStore:", v58);
  -[KTContext setDataStore:](v32, "setDataStore:", v23);
  -[KTContext setSmDataStore:](v32, "setSmDataStore:", v24);
  id v57 = v25;
  -[KTContext setStaticKeyStore:](v32, "setStaticKeyStore:", v25);
  -[KTContext setLogClient:](v32, "setLogClient:", v26);
  -[KTContext setSettings:](v32, "setSettings:", v30);
  uint64_t v33 = -[KTContextVerifier initWithApplicationKeyStore:dataStore:applicationID:context:]( objc_alloc(&OBJC_CLASS___KTContextVerifier),  "initWithApplicationKeyStore:dataStore:applicationID:context:",  v58,  v23,  v27,  v32);
  -[KTContext setVerifier:](v32, "setVerifier:", v33);

  id v34 = objc_alloc(&OBJC_CLASS___TransparencyTranscript);
  id v36 = (objc_class *)objc_opt_class(v32, v35);
  id v37 = NSStringFromClass(v36);
  id v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  id v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](v32, "applicationID"));
  id v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v38, v39));
  id v41 = v27;
  id v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext settings](v32, "settings"));
  uint64_t v43 = -[TransparencyTranscript initWithContext:settings:](v34, "initWithContext:settings:", v40, v42);
  -[KTContext setTranscript:](v32, "setTranscript:", v43);

  uint64_t v44 = v58;
  if (!v28) {
    id v28 = (id)objc_claimAutoreleasedReturnValue( +[KTAccountKeyServer sharedKeyServiceForApplication:]( &OBJC_CLASS___KTAccountKeyServer,  "sharedKeyServiceForApplication:",  v41));
  }
  -[KTContext setAccountKeyServer:](v32, "setAccountKeyServer:", v28);
  unsigned __int8 v45 = objc_alloc(&OBJC_CLASS___KTOptInManagerServer);
  id v47 = v41;
  id v48 = v59;
  id v29 = v55;
  id v49 = -[KTOptInManagerServer initWithApplication:context:stateMachine:account:store:]( v45,  "initWithApplication:context:stateMachine:account:store:",  v41,  v32,  v59,  objc_opt_class(&OBJC_CLASS___TransparencyAccount, v46),  v55);
  -[KTContext setOptInServer:](v32, "setOptInServer:", v49);

  -[KTContext setStateMachine:](v32, "setStateMachine:", v59);
  id v50 = v61;
  -[KTContext setContextStore:](v32, "setContextStore:", v61);
  -[KTContext setFollowUp:](v32, "setFollowUp:", v67);
  -[KTContext setCloudRecords:](v32, "setCloudRecords:", v68);
  -[KTContext setTapToRadar:](v32, "setTapToRadar:", v65);
  -[KTContext setAnalyticsLogger:](v32, "setAnalyticsLogger:", v66);
  -[KTContext setEligibilityStatusReporter:](v32, "setEligibilityStatusReporter:", v64);
  dispatch_queue_t v51 = dispatch_queue_create("com.apple.transparencyd.eligibility", &_dispatch_queue_attr_concurrent);
  -[KTContext setEligibilityQueue:](v32, "setEligibilityQueue:", v51);

  if (v32->_verifier)
  {
    id v25 = v57;
    id v27 = v47;
LABEL_7:
    id v52 = v32;
    goto LABEL_13;
  }

  id v25 = v57;
  if (qword_1002E63C0 != -1) {
    dispatch_once(&qword_1002E63C0, &stru_100276C38);
  }
  id v27 = v47;
  uint64_t v53 = (os_log_s *)qword_1002E63C8;
  if (os_log_type_enabled((os_log_t)qword_1002E63C8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "Cannot create a KTContext with an invalid KTPublicKeyStore",  buf,  2u);
  }

  id v52 = 0LL;
LABEL_13:

  return v52;
}

- (BOOL)drainContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  unsigned __int8 v3 = [v2 drainDataStore];

  return v3;
}

- (void)dealloc
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext optInServer](self, "optInServer"));
  [v3 setContext:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___KTContext;
  -[KTContext dealloc](&v4, "dealloc");
}

- (void)logStartEvent:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[KTContext transcript](self, "transcript"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v5, v4));

  [v7 startEvent:v6];
}

- (void)logFinishSuccessEvent:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[KTContext transcript](self, "transcript"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v5, v4));

  [v7 stopEventWithSuccess:v6];
}

- (void)logFinishFailureEvent:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[KTContext transcript](self, "transcript"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v8, v7));

  [v10 stopEventWithFailure:v9 error:v6];
}

- (BOOL)unsupported:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
  unsigned int v6 = [v5 unsupported];

  if (v6)
  {
    if (qword_1002E63C0 != -1) {
      dispatch_once(&qword_1002E63C0, &stru_100276C58);
    }
    id v7 = (os_log_s *)qword_1002E63C8;
    if (os_log_type_enabled((os_log_t)qword_1002E63C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = kTransparencyProtocolVersion;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "This client version (%d) is no longer supported.",  buf,  8u);
    }

    if (a3)
    {
      uint64_t v8 = kTransparencyErrorInternal;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 treeRollInfoURL]);
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  v8,  -230LL,  @"Client version (%d) no longer supported. See %@ for more info.",  kTransparencyProtocolVersion,  v10));
    }
  }

  return v6;
}

- (BOOL)ready:(id *)a3
{
  BOOL v4 = -[KTApplicationPublicKeyStore ready](self->_applicationKeyStore, "ready");
  if (!v4)
  {
    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInterface,  -41LL,  @"KT public key store is not ready"));
    }
    if (qword_1002E63C0 != -1) {
      dispatch_once(&qword_1002E63C0, &stru_100276C78);
    }
    id v5 = (os_log_s *)qword_1002E63C8;
    if (os_log_type_enabled((os_log_t)qword_1002E63C8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "KT public key store is not ready", v7, 2u);
    }
  }

  return v4;
}

- (void)clearState:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  -[KTContext logStartEvent:](self, "logStartEvent:", @"clearState");
  v4[2](v4, 0LL);

  -[KTContext logFinishSuccessEvent:](self, "logFinishSuccessEvent:", @"clearState");
}

- (id)copyState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
  id v3 = [v2 copyKeyStoreState];

  return v3;
}

- (BOOL)contextShouldGossip
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
  id v4 = [v3 shutDown];

  if (!v4) {
    return 1;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
  id v6 = [v5 shutDown];
  double v7 = (double)((unint64_t)v6 + kTransparencyThirtyDaysInMs);

  +[NSDate kt_currentTimeMs](&OBJC_CLASS___NSDate, "kt_currentTimeMs");
  return v8 < v7;
}

- (NSString)applicationID
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setApplicationID:(id)a3
{
}

- (TransparencyTranscript)transcript
{
  return (TransparencyTranscript *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTranscript:(id)a3
{
}

- (KTApplicationPublicKeyStore)applicationKeyStore
{
  return (KTApplicationPublicKeyStore *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setApplicationKeyStore:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDataStore:(id)a3
{
}

- (KTSMDataStore)smDataStore
{
  return (KTSMDataStore *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSmDataStore:(id)a3
{
}

- (TransparencyStaticKeyStore)staticKeyStore
{
  return (TransparencyStaticKeyStore *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setStaticKeyStore:(id)a3
{
}

- (KTContextVerifier)verifier
{
  return (KTContextVerifier *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setVerifier:(id)a3
{
}

- (KTLogClientProtocol)logClient
{
  return (KTLogClientProtocol *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setLogClient:(id)a3
{
}

- (KTAccountKeyServer)accountKeyServer
{
  return (KTAccountKeyServer *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setAccountKeyServer:(id)a3
{
}

- (KTOptInManagerServer)optInServer
{
  return (KTOptInManagerServer *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setOptInServer:(id)a3
{
}

- (TransparencyFollowUpProtocol)followUp
{
  return (TransparencyFollowUpProtocol *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setFollowUp:(id)a3
{
}

- (KTCloudRecordsProtocol)cloudRecords
{
  return (KTCloudRecordsProtocol *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setCloudRecords:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setSettings:(id)a3
{
}

- (TransparencyAnalytics)analyticsLogger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setAnalyticsLogger:(id)a3
{
}

- (_TtC13transparencyd28KTEligibilityStatusReporting)eligibilityStatusReporter
{
  return (_TtC13transparencyd28KTEligibilityStatusReporting *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setEligibilityStatusReporter:(id)a3
{
}

- (OS_dispatch_queue)eligibilityQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setEligibilityQueue:(id)a3
{
}

- (KTContextStore)contextStore
{
  return (KTContextStore *)objc_loadWeakRetained((id *)&self->_contextStore);
}

- (void)setContextStore:(id)a3
{
}

- (KTSMManager)stateMachine
{
  return (KTSMManager *)objc_loadWeakRetained((id *)&self->_stateMachine);
}

- (void)setStateMachine:(id)a3
{
}

- (KTTapToRadarProtocol)tapToRadar
{
  return (KTTapToRadarProtocol *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setTapToRadar:(id)a3
{
}

- (KTCondition)storedEligibilityResult
{
  return (KTCondition *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setStoredEligibilityResult:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)shouldShowCFU:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 application]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uri]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v4 responseTime]);
  id v39 = 0LL;
  id v9 = [v5 checkFollowupTicket:v6 uri:v7 checkTime:v8 error:&v39];
  id v10 = v39;

  if (v10 && [v10 code] != (id)-338)
  {
    if (qword_1002E6460 != -1) {
      dispatch_once(&qword_1002E6460, &stru_100277C88);
    }
    id v11 = (void *)qword_1002E6468;
    if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_ERROR))
    {
      id v12 = v11;
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 application]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 uri]);
      *(_DWORD *)buf = 138544130;
      uint64_t v41 = (uint64_t)v13;
      __int16 v42 = 2160;
      uint64_t v43 = 1752392040LL;
      __int16 v44 = 2112;
      unsigned __int8 v45 = v14;
      __int16 v46 = 2112;
      id v47 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to check followup ticket for %{public}@:%{mask.hash}@ with error: %@",  buf,  0x2Au);
    }
  }

  if (v9 != (id)2)
  {
    if (v9 == (id)1)
    {
      if (qword_1002E6460 != -1) {
        dispatch_once(&qword_1002E6460, &stru_100277CE8);
      }
      id v30 = (void *)qword_1002E6468;
      if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = v30;
        BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v4 uri]);
        *(_DWORD *)buf = 141558274;
        uint64_t v41 = 1752392040LL;
        __int16 v42 = 2112;
        uint64_t v43 = (uint64_t)v32;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Have active followup ticket for %{mask.hash}@",  buf,  0x16u);
      }
    }

    else if (!v9)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 application]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 uri]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 responseTime]);
      id v38 = v10;
      unsigned __int8 v19 = [v15 createFollowupTicket:v16 uri:v17 startTime:v18 error:&v38];
      id v20 = v38;

      if ((v19 & 1) != 0)
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 application]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 uri]);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v4 responseTime]);
        id v25 = [v21 checkFollowupTicket:v22 uri:v23 checkTime:v24 error:0];

        BOOL v26 = v25 == (id)2;
      }

      else
      {
        if (qword_1002E6460 != -1) {
          dispatch_once(&qword_1002E6460, &stru_100277CA8);
        }
        uint64_t v33 = (void *)qword_1002E6468;
        if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_ERROR))
        {
          id v34 = v33;
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v4 application]);
          id v36 = (void *)objc_claimAutoreleasedReturnValue([v4 uri]);
          *(_DWORD *)buf = 138544130;
          uint64_t v41 = (uint64_t)v35;
          __int16 v42 = 2160;
          uint64_t v43 = 1752392040LL;
          __int16 v44 = 2112;
          unsigned __int8 v45 = v36;
          __int16 v46 = 2112;
          id v47 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Failed to create followup ticket for %{public}@:%{mask.hash}@ with error: %@",  buf,  0x2Au);
        }

        BOOL v26 = 1;
      }

      id v10 = v20;
      goto LABEL_28;
    }

    BOOL v26 = 0;
    goto LABEL_28;
  }

  if (qword_1002E6460 != -1) {
    dispatch_once(&qword_1002E6460, &stru_100277CC8);
  }
  id v27 = (void *)qword_1002E6468;
  if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = v27;
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v4 uri]);
    *(_DWORD *)buf = 141558274;
    uint64_t v41 = 1752392040LL;
    __int16 v42 = 2112;
    uint64_t v43 = (uint64_t)v29;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Have expired followup ticket for %{mask.hash}@",  buf,  0x16u);
  }

  BOOL v26 = 1;
LABEL_28:

  return v26;
}

- (unint64_t)writeResult:(unint64_t)a3 request:(id)a4 proof:(id)a5 replay:(BOOL)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  if (v12)
  {
    if (a3 == 2)
    {
      [v12 requestTime];
      CFAbsoluteTime v15 = v14 + (double)kKTMaximumMergeDelayMs / 1000.0;
      if (v15 >= CFAbsoluteTimeGetCurrent()) {
        a3 = 2LL;
      }
      else {
        a3 = 0LL;
      }
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 createRequestFailure]);

    if (!v17)
    {
      a3 = 2LL;
LABEL_46:

      goto LABEL_47;
    }

    [v17 setRequest:v12];
    if (a7)
    {
      if (*a7) {
        uint64_t v18 = (uint64_t)[*a7 code];
      }
      else {
        uint64_t v18 = -120LL;
      }
      [v17 setErrorCode:v18];
      if (*a7)
      {
        unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([*a7 domain]);
        [v17 setErrorDomain:v19];

LABEL_16:
        [v12 setUnsigned:"verificationResult" value:a3];
        if (a6) {
          goto LABEL_46;
        }
        id v20 = [v12 type];
        if (!a7 || a3 || v20 != (id)1) {
          goto LABEL_46;
        }
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        id v22 = *a7;
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext optInServer](self, "optInServer"));
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v21 createFailureEvent:v22 application:v23 optInServer:v24]);

        BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v12 failureEvent]);
        if (v26)
        {
          id v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v12 failureEvent]);
          [v27 deleteObject:v28];
        }

        [v12 setFailureEvent:v25];
        if (qword_1002E6460 != -1) {
          dispatch_once(&qword_1002E6460, &stru_100277D08);
        }
        id v29 = (void *)qword_1002E6468;
        if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = v29;
          id v31 = (void *)objc_claimAutoreleasedReturnValue([v25 eventId]);
          BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v12 requestId]);
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v17 errorDomain]);
          *(_DWORD *)buf = 138544130;
          id v57 = v31;
          __int16 v58 = 2114;
          uint64_t v59 = (uint64_t)v32;
          __int16 v60 = 2112;
          id v61 = v33;
          __int16 v62 = 1024;
          LODWORD(v63) = [v17 errorCode];
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Created failure eventId %{public}@ for self validation requestId %{public}@ because error: %@:%d",  buf,  0x26u);
        }

        if (!-[KTContext shouldShowCFU:](self, "shouldShowCFU:", v12)) {
          goto LABEL_45;
        }
        id v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext optInServer](self, "optInServer"));
        id v55 = 0LL;
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 getAggregateOptInState:&v55]);
        id v36 = v55;

        if (!v35)
        {
          if (qword_1002E6460 != -1) {
            dispatch_once(&qword_1002E6460, &stru_100277D28);
          }
          id v37 = (os_log_s *)qword_1002E6468;
          if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v36;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "writeResult: failed getting optin state: %@",  buf,  0xCu);
          }
        }

        uint64_t v53 = v36;
        if ([v17 errorCode] == (id)-289) {
          goto LABEL_33;
        }
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v17 errorDomain]);
        if ([v41 isEqual:@"com.apple.Transparency"])
        {
          id v42 = [v17 errorCode];

          if (v42 == (id)7)
          {
LABEL_33:
            id v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext followUp](self, "followUp"));
            id v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
            id v40 = (void *)objc_claimAutoreleasedReturnValue([v25 eventId]);
            [v38 postFollowup:v39 type:4 eventId:v40 errorCode:-289 optInState:v35 infoLink:0 additionalInfo:0 error:0];
LABEL_39:

            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
            __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v12 application]);
            unsigned __int8 v45 = (void *)objc_claimAutoreleasedReturnValue([v12 uri]);
            id v54 = 0LL;
            unsigned __int8 v46 = [v43 clearFollowupTicket:v44 uri:v45 error:&v54];
            id v47 = v54;

            if ((v46 & 1) == 0)
            {
              if (qword_1002E6460 != -1) {
                dispatch_once(&qword_1002E6460, &stru_100277D48);
              }
              id v48 = (void *)qword_1002E6468;
              if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_ERROR))
              {
                id v49 = v48;
                id v50 = (void *)objc_claimAutoreleasedReturnValue([v12 application]);
                dispatch_queue_t v51 = (void *)objc_claimAutoreleasedReturnValue([v12 uri]);
                *(_DWORD *)buf = 138544130;
                id v57 = v50;
                __int16 v58 = 2160;
                uint64_t v59 = 1752392040LL;
                __int16 v60 = 2112;
                id v61 = v51;
                __int16 v62 = 2112;
                id v63 = v47;
                _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "Failed to clear followup ticket for %{public}@:%{mask.hash}@ with error: %@",  buf,  0x2Au);
              }
            }

LABEL_45:
            a3 = 0LL;
            goto LABEL_46;
          }
        }

        else
        {
        }

        id v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext followUp](self, "followUp"));
        id v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        id v40 = (void *)objc_claimAutoreleasedReturnValue([v25 eventId]);
        objc_msgSend( v38,  "postFollowup:type:eventId:errorCode:optInState:infoLink:additionalInfo:error:",  v39,  0,  v40,  objc_msgSend(v17, "errorCode"),  v35,  0,  0,  0);
        goto LABEL_39;
      }
    }

    else
    {
      [v17 setErrorCode:-120];
    }

    [v17 setErrorDomain:kTransparencyErrorUnknown];
    goto LABEL_16;
  }

- (unint64_t)writeResult:(unint64_t)a3 request:(id)a4 proof:(id)a5 error:(id *)a6
{
  return -[KTContext writeResult:request:proof:replay:error:]( self,  "writeResult:request:proof:replay:error:",  a3,  a4,  a5,  0LL,  a6);
}

- (unint64_t)deserializeServerLoggableDatas:(id)a3 loggableDatas:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serverLoggableDatas]);
  id v21 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyManagedDataStore deserializeLoggableDatas:error:]( &OBJC_CLASS___TransparencyManagedDataStore,  "deserializeLoggableDatas:error:",  v9,  &v21));
  id v11 = v21;

  if (v10)
  {
    if (a4) {
      *a4 = v10;
    }
    unint64_t v12 = 1LL;
  }

  else
  {
    if (qword_1002E6460 != -1) {
      dispatch_once(&qword_1002E6460, &stru_100277D68);
    }
    id v13 = (void *)qword_1002E6468;
    if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_ERROR))
    {
      double v14 = v13;
      CFAbsoluteTime v15 = (void *)objc_claimAutoreleasedReturnValue([v8 requestId]);
      *(_DWORD *)buf = 138543362;
      id v23 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "deleting requestId %{public}@ with failed deserialization of serverLoggableDatas",  buf,  0xCu);
    }

    uint64_t v16 = kTransparencyErrorDecode;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 requestId]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  v16,  -131LL,  v11,  @"deleting requestId %@ with failed deserialization of serverLoggableDatas",  v17));

    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    [v19 deleteObject:v8];

    unint64_t v12 = 0LL;
    if (a5 && v18)
    {
      id v11 = v18;
      unint64_t v12 = 0LL;
      *a5 = v11;
    }

    else
    {
      id v11 = v18;
    }
  }

  return v12;
}

- (unint64_t)validatePeerOrEnrollKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 transparentData:(id *)a6 loggableDatas:(id *)a7 error:(id *)a8
{
  id v11 = a3;
  id v48 = a4;
  id v12 = a5;
  id v45 = [v11 getUnsigned:"type"];
  uint64_t v81 = 0LL;
  id v82 = &v81;
  uint64_t v83 = 0x2020000000LL;
  uint64_t v84 = 2LL;
  uint64_t v75 = 0LL;
  id v76 = (id *)&v75;
  uint64_t v77 = 0x3032000000LL;
  id v78 = sub_10001BEB0;
  id v79 = sub_10001BEC0;
  id v80 = 0LL;
  id v13 = objc_msgSend(v11, "getUnsigned:");
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v12 metadata]);
  CFAbsoluteTime v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint]);
  [v11 setServerHint:v15];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 metadata]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"APS"]);
  [v11 setUsedReversePush:v17 != 0];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v12 metadata]);
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"ResponseTime"]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate kt_dateFromString:](&OBJC_CLASS___NSDate, "kt_dateFromString:", v19));
  [v11 setResponseTime:v20];

  uint64_t v69 = 0LL;
  objc_super v70 = &v69;
  uint64_t v71 = 0x3032000000LL;
  v72 = sub_10001BEB0;
  id v73 = sub_10001BEC0;
  id v74 = 0LL;
  id obj = 0LL;
  unint64_t v21 = -[KTContext deserializeServerLoggableDatas:loggableDatas:error:]( self,  "deserializeServerLoggableDatas:loggableDatas:error:",  v11,  &obj,  a8);
  objc_storeStrong(&v74, obj);
  v82[3] = v21;
  if (v21 == 1)
  {
    id v22 = +[KTLoggableData isAccountKTCapable:](&OBJC_CLASS___KTLoggableData, "isAccountKTCapable:", v70[5]);
    uint64_t v62 = 0LL;
    id v63 = &v62;
    uint64_t v64 = 0x3032000000LL;
    id v65 = sub_10001BEB0;
    id v66 = sub_10001BEC0;
    id v67 = 0LL;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v11 responseTime]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v11 requestId]);
    id v61 = 0LL;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_10001BEC8;
    v52[3] = &unk_100277E10;
    id v55 = &v75;
    id v56 = &v81;
    v52[4] = self;
    id v59 = v45;
    id v25 = v11;
    id v53 = v25;
    id v57 = &v69;
    id v60 = v13;
    id v26 = v12;
    id v54 = v26;
    __int16 v58 = &v62;
    unint64_t v27 = -[KTContext handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:]( self,  "handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:",  v26,  v48,  v23,  v24,  v45,  v22,  &v61,  v52);
    id v28 = v61;

    if (a6)
    {
      id v29 = (void *)v63[5];
      if (v29) {
        *a6 = v29;
      }
    }

    if (a7)
    {
      id v30 = (void *)v70[5];
      if (v30) {
        *a7 = v30;
      }
    }

    if (v27 == 2
      || (id v31 = (void *)objc_claimAutoreleasedReturnValue([v48 data]),
          [v25 setQueryRequest:v31],
          v31,
          BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v26 data]),
          [v25 setQueryResponse:v32],
          v32,
          v27 != 1))
    {
      if (a8 && v28) {
        *a8 = v28;
      }
      id v51 = v28;
      unint64_t v33 = -[KTContext writeResult:request:proof:error:](self, "writeResult:request:proof:error:", v27, v25, 0LL, &v51);
      id v34 = v51;

      v82[3] = v33;
      id v28 = v34;
    }

    else
    {
      unint64_t v33 = v82[3];
    }

    if (v33 == 1) {
      goto LABEL_20;
    }
    uint64_t v35 = v76;
    if (a8)
    {
      id v36 = v76[5];
      if (v36)
      {
        *a8 = v36;
        unint64_t v33 = v82[3];
        uint64_t v35 = v76;
      }
    }

    id v50 = v35[5];
    unint64_t v37 = -[KTContext writeResult:request:proof:error:](self, "writeResult:request:proof:error:", v33, v25, 0LL, &v50);
    objc_storeStrong(v35 + 5, v50);
    v82[3] = v37;
    if (v37 == 1) {
LABEL_20:
    }
      [v25 setUnsigned:"verificationResult" value:1];
    id v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    unsigned __int8 v39 = [v38 persistAndRefaultObject:v25 error:a8];

    if ((v39 & 1) == 0)
    {
      if (a8 && *a8)
      {
        id v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        [v40 reportCoreDataPersistEventForLocation:@"validatePeerOrEnrollKTRequest" underlyingError:*a8];
      }

      if (qword_1002E6460 != -1) {
        dispatch_once(&qword_1002E6460, &stru_100277E30);
      }
      uint64_t v41 = (os_log_s *)qword_1002E6468;
      if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_ERROR))
      {
        id v42 = @"enroll";
        if (!v45) {
          id v42 = @"peer";
        }
        uint64_t v43 = a8;
        if (a8) {
          uint64_t v43 = *a8;
        }
        *(_DWORD *)buf = 138412546;
        id v86 = v42;
        __int16 v87 = 2112;
        id v88 = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "failed to save validate %@ with response: %@",  buf,  0x16u);
      }
    }

    unint64_t v21 = v82[3];

    _Block_object_dispose(&v62, 8);
  }

  _Block_object_dispose(&v69, 8);

  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v81, 8);

  return v21;
}

- (void)writeLoggableDatas:(id)a3 request:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v11);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        double v14 = (void *)objc_claimAutoreleasedReturnValue([v7 application]);
        CFAbsoluteTime v15 = (void *)objc_claimAutoreleasedReturnValue([v13 createRecordFromLoggableData:v12 application:v14]);

        [v15 setRequest:v7];
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }
}

- (unint64_t)deserializeSyncedLoggableDatas:(id)a3 loggableDatas:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 clientLoggableDatas]);
  id v21 = 0LL;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyManagedDataStore deserializeLoggableDatas:error:]( &OBJC_CLASS___TransparencyManagedDataStore,  "deserializeLoggableDatas:error:",  v9,  &v21));
  id v11 = v21;

  if (v10)
  {
    if (a4) {
      *a4 = v10;
    }
    unint64_t v12 = 1LL;
  }

  else
  {
    if (qword_1002E6460 != -1) {
      dispatch_once(&qword_1002E6460, &stru_100277E50);
    }
    id v13 = (void *)qword_1002E6468;
    if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_ERROR))
    {
      double v14 = v13;
      CFAbsoluteTime v15 = (void *)objc_claimAutoreleasedReturnValue([v8 requestId]);
      *(_DWORD *)buf = 138543362;
      id v23 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "deleting requestId %{public}@ with failed deserialization of clientLoggableDatas",  buf,  0xCu);
    }

    uint64_t v16 = kTransparencyErrorDecode;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 requestId]);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  v16,  -131LL,  v11,  @"deleting requestId %@ with failed deserialization of clientLoggableDatas",  v17));

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    [v19 deleteObject:v8];

    unint64_t v12 = 0LL;
    if (a5 && v18)
    {
      id v11 = v18;
      unint64_t v12 = 0LL;
      *a5 = v11;
    }

    else
    {
      id v11 = v18;
    }
  }

  return v12;
}

- (unint64_t)validateSelfKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 selfVerificationInfo:(id)a6 optInCheck:(BOOL)a7 cloudDevices:(id)a8 pcsAccountKey:(id)a9 kvsOptInHistory:(id)a10 isReplay:(BOOL)a11 transparentData:(id *)a12 loggableDatas:(id *)a13 error:(id *)a14
{
  id v19 = a3;
  id v57 = a4;
  id v20 = a5;
  id v53 = a6;
  id v54 = a8;
  id v55 = a9;
  id v56 = a10;
  uint64_t v94 = 0LL;
  id v95 = &v94;
  uint64_t v96 = 0x2020000000LL;
  uint64_t v97 = 2LL;
  uint64_t v88 = 0LL;
  id v89 = (id *)&v88;
  uint64_t v90 = 0x3032000000LL;
  id v91 = sub_10001BEB0;
  v92 = sub_10001BEC0;
  id v93 = 0LL;
  id v21 = objc_msgSend(v19, "getUnsigned:");
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 metadata]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint]);
  [v19 setServerHint:v23];

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v20 metadata]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"APS"]);
  [v19 setUsedReversePush:v25 != 0];

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v20 metadata]);
  unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"ResponseTime"]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate kt_dateFromString:](&OBJC_CLASS___NSDate, "kt_dateFromString:", v27));
  [v19 setResponseTime:v28];

  uint64_t v82 = 0LL;
  uint64_t v83 = &v82;
  uint64_t v84 = 0x3032000000LL;
  id v85 = sub_10001BEB0;
  id v86 = sub_10001BEC0;
  id v87 = 0LL;
  id obj = 0LL;
  unint64_t v29 = -[KTContext deserializeServerLoggableDatas:loggableDatas:error:]( self,  "deserializeServerLoggableDatas:loggableDatas:error:",  v19,  &obj,  a14);
  objc_storeStrong(&v87, obj);
  v95[3] = v29;
  if (v29 == 1)
  {
    id v30 = +[KTLoggableData isAccountKTCapable:](&OBJC_CLASS___KTLoggableData, "isAccountKTCapable:", v83[5]);
    uint64_t v75 = 0LL;
    id v76 = &v75;
    uint64_t v77 = 0x3032000000LL;
    id v78 = sub_10001BEB0;
    id v79 = sub_10001BEC0;
    id v80 = 0LL;
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v19 responseTime]);
    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v19 requestId]);
    id v74 = 0LL;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_10001CEE0;
    v60[3] = &unk_100277F18;
    id v68 = &v94;
    id v67 = &v88;
    v60[4] = self;
    id v33 = v19;
    id v61 = v33;
    id v62 = v54;
    uint64_t v69 = &v82;
    id v63 = v53;
    BOOL v72 = a7;
    id v64 = v55;
    BOOL v73 = a11;
    id v65 = v56;
    id v71 = v21;
    id v34 = v20;
    id v66 = v34;
    objc_super v70 = &v75;
    unint64_t v35 = -[KTContext handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:]( self,  "handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:",  v34,  v57,  v31,  v32,  0LL,  v30,  &v74,  v60);
    id v36 = v74;

    if (a12)
    {
      unint64_t v37 = (void *)v76[5];
      if (v37) {
        *a12 = v37;
      }
    }

    if (a13)
    {
      id v38 = (void *)v83[5];
      if (v38) {
        *a13 = v38;
      }
    }

    if (v35 == 2
      || (unsigned __int8 v39 = (void *)objc_claimAutoreleasedReturnValue([v57 data]),
          [v33 setQueryRequest:v39],
          v39,
          id v40 = (void *)objc_claimAutoreleasedReturnValue([v34 data]),
          [v33 setQueryResponse:v40],
          v40,
          v35 != 1))
    {
      if (a14 && v36) {
        *a14 = v36;
      }
      id v59 = v36;
      unint64_t v41 = -[KTContext writeResult:request:proof:replay:error:]( self,  "writeResult:request:proof:replay:error:",  v35,  v33,  0LL,  a11,  &v59);
      id v42 = v59;

      v95[3] = v41;
      id v36 = v42;
    }

    else
    {
      unint64_t v41 = v95[3];
    }

    if (v41 == 1) {
      goto LABEL_20;
    }
    uint64_t v43 = v89;
    if (a14)
    {
      id v44 = v89[5];
      if (v44)
      {
        *a14 = v44;
        unint64_t v41 = v95[3];
        uint64_t v43 = v89;
      }
    }

    id v58 = v43[5];
    unint64_t v45 = -[KTContext writeResult:request:proof:replay:error:]( self,  "writeResult:request:proof:replay:error:",  v41,  v33,  0LL,  a11,  &v58);
    objc_storeStrong(v43 + 5, v58);
    v95[3] = v45;
    if (v45 == 1) {
LABEL_20:
    }
      [v33 setUnsigned:"verificationResult" value:1];
    unsigned __int8 v46 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    unsigned __int8 v47 = [v46 persistAndRefaultObject:v33 error:a14];

    if ((v47 & 1) == 0)
    {
      if (a14 && *a14)
      {
        id v48 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        [v48 reportCoreDataPersistEventForLocation:@"validateSelfResponse" underlyingError:*a14];
      }

      if (qword_1002E6460 != -1) {
        dispatch_once(&qword_1002E6460, &stru_100277F38);
      }
      id v49 = (os_log_s *)qword_1002E6468;
      if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_ERROR))
      {
        if (a14) {
          id v50 = *a14;
        }
        else {
          id v50 = 0LL;
        }
        *(_DWORD *)buf = 138412290;
        id v99 = v50;
        _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "failed to save validate self with response: %@",  buf,  0xCu);
      }
    }

    unint64_t v29 = v95[3];

    _Block_object_dispose(&v75, 8);
  }

  _Block_object_dispose(&v82, 8);

  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v94, 8);

  return v29;
}

- (unint64_t)validateSelfKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 selfVerificationInfo:(id)a6 optInCheck:(BOOL)a7 cloudDevices:(id)a8 transparentData:(id *)a9 loggableDatas:(id *)a10 error:(id *)a11
{
  LOBYTE(v12) = 0;
  return -[KTContext validateSelfKTRequest:queryRequest:queryResponse:selfVerificationInfo:optInCheck:cloudDevices:pcsAccountKey:kvsOptInHistory:isReplay:transparentData:loggableDatas:error:]( self,  "validateSelfKTRequest:queryRequest:queryResponse:selfVerificationInfo:optInCheck:cloudDevices:pcsAccountKey:k vsOptInHistory:isReplay:transparentData:loggableDatas:error:",  a3,  a4,  a5,  a6,  a7,  a8,  0LL,  0LL,  v12,  a9,  a10,  a11);
}

- (void)recordEnrollOptInRecord:(id)a3 accountKey:(id)a4 transparentData:(id)a5 cloudOptIn:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a5 accountOptInRecord:a4]);
  id v13 = v12;
  if (v12)
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v12 timestampMs] / 1000.0));
    CFAbsoluteTime v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
    id v22 = 0LL;
    unsigned __int8 v16 = objc_msgSend( v11,  "addOptInStateWithURI:smtTimestamp:application:state:error:",  v10,  v14,  v15,  objc_msgSend(v13, "optIn"),  &v22);
    id v17 = v22;

    if ((v16 & 1) == 0)
    {
      if (qword_1002E6460 != -1) {
        dispatch_once(&qword_1002E6460, &stru_100277F78);
      }
      __int128 v18 = (void *)qword_1002E6468;
      if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_ERROR))
      {
        id v19 = v18;
        id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kt_toISO_8601_UTCString"));
        *(_DWORD *)buf = 141558786;
        uint64_t v24 = 1752392040LL;
        __int16 v25 = 2112;
        id v26 = v10;
        __int16 v27 = 2114;
        id v28 = v20;
        __int16 v29 = 2112;
        id v30 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to update cloud opt-in records for %{mask.hash}@ at %{public}@: %@",  buf,  0x2Au);
      }
    }
  }

  else
  {
    if (qword_1002E6460 != -1) {
      dispatch_once(&qword_1002E6460, &stru_100277F58);
    }
    id v21 = (os_log_s *)qword_1002E6468;
    if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558274;
      uint64_t v24 = 1752392040LL;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to find optInOut record during enroll for %{mask.hash}@",  buf,  0x16u);
    }
  }
}

- (unint64_t)validateEnrollKTRequest:(id)a3 insertResponse:(id)a4 transparentData:(id *)a5 loggableDatas:(id *)a6 cloudOptIn:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v39 = a4;
  id v40 = a7;
  uint64_t v67 = 0LL;
  id v68 = &v67;
  uint64_t v69 = 0x2020000000LL;
  uint64_t v70 = 2LL;
  uint64_t v61 = 0LL;
  id v62 = (id *)&v61;
  uint64_t v63 = 0x3032000000LL;
  id v64 = sub_10001BEB0;
  id v65 = sub_10001BEC0;
  id v66 = 0LL;
  uint64_t v55 = 0LL;
  id v56 = &v55;
  uint64_t v57 = 0x3032000000LL;
  id v58 = sub_10001BEB0;
  id v59 = sub_10001BEC0;
  id v60 = 0LL;
  id v54 = 0LL;
  unint64_t v15 = -[KTContext deserializeServerLoggableDatas:loggableDatas:error:]( self,  "deserializeServerLoggableDatas:loggableDatas:error:",  v14,  &v54,  a8);
  id v41 = v54;
  v68[3] = v15;
  if (v15 == 1)
  {
    id v38 = a8;
    unsigned __int8 v16 = a5;
    id v17 = a6;
    id v18 = objc_msgSend(v14, "getUnsigned:");
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 uri]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 requestId]);
    id v53 = 0LL;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_10001DED0;
    v44[3] = &unk_100278020;
    id v50 = &v67;
    id v49 = &v61;
    v44[4] = self;
    id v21 = v14;
    id v45 = v21;
    id v22 = v41;
    id v46 = v22;
    id v52 = v18;
    id v47 = v39;
    id v48 = v40;
    id v51 = &v55;
    unint64_t v23 = -[KTContext handleInsertResponse:uri:fetchId:error:transparentDataHandler:]( self,  "handleInsertResponse:uri:fetchId:error:transparentDataHandler:",  v47,  v19,  v20,  &v53,  v44);
    id v24 = v53;

    if (v16)
    {
      __int16 v25 = (void *)v56[5];
      if (v25) {
        id *v16 = v25;
      }
    }

    if (v17 && v22) {
      id *v17 = v22;
    }
    if (v23 == 1)
    {
      unint64_t v26 = v68[3];
    }

    else
    {
      if (v38 && v24) {
        id *v38 = v24;
      }
      id v43 = v24;
      unint64_t v26 = -[KTContext writeResult:request:proof:error:](self, "writeResult:request:proof:error:", v23, v21, 0LL, &v43);
      id v27 = v43;

      v68[3] = v26;
      id v24 = v27;
    }

    if (v26 == 1) {
      goto LABEL_19;
    }
    id v28 = v62;
    if (v38)
    {
      id v29 = v62[5];
      if (v29)
      {
        id *v38 = v29;
        unint64_t v26 = v68[3];
        id v28 = v62;
      }
    }

    id obj = v28[5];
    unint64_t v30 = -[KTContext writeResult:request:proof:error:](self, "writeResult:request:proof:error:", v26, v21, 0LL, &obj);
    objc_storeStrong(v28 + 5, obj);
    v68[3] = v30;
    if (v30 == 1) {
LABEL_19:
    }
      [v21 setUnsigned:"verificationResult" value:1];
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    unsigned __int8 v32 = [v31 persistAndRefaultObject:v21 error:v38];

    id v33 = v38;
    if ((v32 & 1) == 0)
    {
      if (v38 && *v38)
      {
        id v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        [v34 reportCoreDataPersistEventForLocation:@"validateEnrollKTRequest" underlyingError:*v38];

        id v33 = v38;
      }

      if (qword_1002E6460 != -1) {
        dispatch_once(&qword_1002E6460, &stru_100278040);
      }
      unint64_t v35 = (os_log_s *)qword_1002E6468;
      if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_ERROR))
      {
        if (v33) {
          id v36 = *v33;
        }
        else {
          id v36 = 0LL;
        }
        *(_DWORD *)buf = 138412290;
        id v72 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "failed to save validate enrollment with response: %@",  buf,  0xCu);
      }
    }

    unint64_t v15 = v68[3];
  }

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v67, 8);
  return v15;
}

- (id)createQueryRequestForKTRequest:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 uri]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  id v12 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyRPCRequestBuilder buildQueryRequest:application:error:]( &OBJC_CLASS___TransparencyRPCRequestBuilder,  "buildQueryRequest:application:error:",  v6,  v7,  &v12));
  id v9 = v12;

  if (v8)
  {
    id v10 = v8;
  }

  else if (a4 && v9)
  {
    *a4 = v9;
  }

  return v8;
}

- (id)parseQueryRequestFromKTRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 queryRequest]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 queryRequest]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___QueryRequest,  "parseFromData:error:",  v8,  a4));
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 queryRequest]);

  if (!v9 || v7)
  {
    if (v7)
    {
      id v14 = v7;
      goto LABEL_32;
    }
  }

  else
  {
    if (qword_1002E6460 != -1) {
      dispatch_once(&qword_1002E6460, &stru_100278060);
    }
    id v10 = (os_log_s *)(id)qword_1002E6468;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 requestId]);
      id v12 = (void *)v11;
      if (a4) {
        id v13 = *a4;
      }
      else {
        id v13 = 0LL;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "parse saved queryRequest for requestId %{public}@ failed: %@",  buf,  0x16u);
    }
  }

  [v6 setQueryRequest:0];
  [v6 setQueryResponse:0];
  [v6 setServerHint:0];
  [v6 setUsedReversePush:0];
  [v6 setResponseTime:0];
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  id v24 = 0LL;
  unsigned __int8 v16 = [v15 persistWithError:&v24];
  id v17 = v24;

  if ((v16 & 1) == 0)
  {
    if (qword_1002E6460 != -1) {
      dispatch_once(&qword_1002E6460, &stru_100278080);
    }
    id v18 = (os_log_s *)qword_1002E6468;
    if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = (uint64_t)v17;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "failed to remove query request and response for unparseable request: %@",  buf,  0xCu);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    [v19 reportCoreDataPersistEventForLocation:@"verifyDeviceWitnesses" underlyingError:v17];
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 queryRequest]);

  if (v20)
  {
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDecode,  -133LL,  *a4,  @"saved query request failed to decode"));
    }
    if (qword_1002E6460 != -1) {
      dispatch_once(&qword_1002E6460, &stru_1002780A0);
    }
    id v21 = (os_log_s *)qword_1002E6468;
    if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        id v22 = *a4;
      }
      else {
        id v22 = 0LL;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = (uint64_t)v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "saved query request failed to decode: %@",  buf,  0xCu);
    }
  }

  id v14 = 0LL;
LABEL_32:

  return v14;
}

- (id)parseQueryResponseFromKTRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 queryResponse]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 queryResponse]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___QueryResponse,  "parseFromData:error:",  v7,  a4));
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 queryResponse]);

  if (!v8 || v6)
  {
    if (v6)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 serverHint]);

      if (v13)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 serverHint]);
        [v6 setMetadataValue:v14 key:kTransparencyResponseMetadataKeyServerHint];
      }

      unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 responseTime]);

      if (v15)
      {
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v5 responseTime]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "kt_dateToString"));
        [v6 setMetadataValue:v17 key:@"ResponseTime"];
      }
    }
  }

  else
  {
    if (qword_1002E6460 != -1) {
      dispatch_once(&qword_1002E6460, &stru_1002780C0);
    }
    id v9 = (os_log_s *)(id)qword_1002E6468;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v5 requestId]);
      uint64_t v11 = (void *)v10;
      if (a4) {
        id v12 = *a4;
      }
      else {
        id v12 = 0LL;
      }
      int v19 = 138543618;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "parse saved queryResponse as query response for requestId %{public}@ failed: %@",  (uint8_t *)&v19,  0x16u);
    }
  }

  return v6;
}

- (void)fetchQueryForKTRequest:(id)a3 userInitiated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v27 = 0LL;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[KTContext createQueryRequestForKTRequest:error:]( self,  "createQueryRequestForKTRequest:error:",  v8,  &v27));
  id v11 = v27;
  if (v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 data]);
    id v26 = v11;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 createFetchRecordForRequestData:v13 request:v8 error:&v26]);
    id v15 = v26;

    if (v14)
    {
      if (qword_1002E6460 != -1) {
        dispatch_once(&qword_1002E6460, &stru_100278100);
      }
      unsigned __int8 v16 = (void *)qword_1002E6468;
      if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v16;
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 requestId]);
        *(_DWORD *)buf = 138543618;
        id v29 = v18;
        __int16 v30 = 2114;
        id v31 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Fetching query response for requestId %{public}@ with fetchId %{public}@",  buf,  0x16u);
      }

      int v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext logClient](self, "logClient"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10001EEFC;
      v22[3] = &unk_1002781B0;
      v22[4] = self;
      id v23 = v14;
      id v25 = v9;
      id v24 = v10;
      [v19 fetchQuery:v24 uuid:v23 userInitiated:v6 completionHandler:v22];
    }

    else
    {
      if (qword_1002E6460 != -1) {
        dispatch_once(&qword_1002E6460, &stru_1002780E0);
      }
      uint64_t v20 = (os_log_s *)qword_1002E6468;
      if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "failed to save query request before fetch: %@",  buf,  0xCu);
      }

      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
      [v21 reportCoreDataPersistEventForLocation:@"fetchQuery" underlyingError:v15];

      (*((void (**)(id, void, void, void, id))v9 + 2))(v9, 0LL, 0LL, 0LL, v15);
    }
  }

  else
  {
    (*((void (**)(id, void, void, void, id))v9 + 2))(v9, 0LL, 0LL, 0LL, v11);
    id v15 = v11;
  }
}

- (void)fetchQueryForKTRequest:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)peerStaticKeyFallback:(id)a3 accountKey:(id)a4 transparentData:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v23 = 0LL;
  unint64_t v10 = -[KTContext validateStaticKeyForPeer:accountKey:error:]( self,  "validateStaticKeyForPeer:accountKey:error:",  v8,  v9,  &v23);
  id v11 = v23;
  if (qword_1002E6460 != -1) {
    dispatch_once(&qword_1002E6460, &stru_1002781D0);
  }
  id v12 = (os_log_s *)qword_1002E6468;
  if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v8;
    __int16 v26 = 1024;
    int v27 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "validatePeer static key: %@ result: %d",  buf,  0x12u);
  }

  if (!v10)
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___OptInOutWithExt);
    -[OptInOut setOptIn:](v13, "setOptIn:", 1LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -3600.0));
    [v14 timeIntervalSince1970];
    -[OptInOut setTimestampMs:](v13, "setTimestampMs:", (unint64_t)(v15 * 1000.0));

    unsigned __int8 v16 = objc_alloc(&OBJC_CLASS___KTTransparentData);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
    id v18 = -[KTTransparentData initWithUriVRFOutput:](v16, "initWithUriVRFOutput:", v17);

    -[KTTransparentData setStaticKeyEnforced:](v18, "setStaticKeyEnforced:", 1LL);
    int v19 = objc_alloc_init(&OBJC_CLASS___KTAccount);
    -[KTAccount setAccountKey:](v19, "setAccountKey:", v9);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](v19, "optInOutHistory"));
    [v20 addObject:v13];

    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](v18, "accounts"));
    [v21 addObject:v19];

    if (a5 && v18) {
      *a5 = v18;
    }
  }

  return v10 == 0;
}

- (void)fetchAndValidatePeerKTRequest:(id)a3 fetchNow:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, unint64_t, id, id, id))a5;
  id v37 = 0LL;
  unsigned int v10 = -[KTContext unsupported:](self, "unsupported:", &v37);
  id v11 = v37;
  id v12 = v11;
  if (!v10)
  {
    if (v6)
    {
      if (qword_1002E6460 != -1) {
        dispatch_once(&qword_1002E6460, &stru_1002781F0);
      }
      id v14 = (os_log_s *)qword_1002E6468;
      if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "client requested fresh KT data", buf, 2u);
      }

      double v15 = 0LL;
      unsigned __int8 v16 = 0LL;
    }

    else
    {
      id v35 = v11;
      double v15 = (void *)objc_claimAutoreleasedReturnValue( -[KTContext parseQueryRequestFromKTRequest:error:]( self,  "parseQueryRequestFromKTRequest:error:",  v8,  &v35));
      id v17 = v35;

      id v34 = v17;
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue( -[KTContext parseQueryResponseFromKTRequest:error:]( self,  "parseQueryResponseFromKTRequest:error:",  v8,  &v34));
      id v12 = v34;

      if (v16 && v15)
      {
        if (qword_1002E6460 != -1) {
          dispatch_once(&qword_1002E6460, &stru_100278298);
        }
        id v18 = (void *)qword_1002E6468;
        if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = v18;
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 requestId]);
          *(_DWORD *)buf = 138543362;
          id v39 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Using existing queryResponse in validatePeer for requestId %{public}@",  buf,  0xCu);
        }

        id v30 = 0LL;
        id v31 = 0LL;
        id v29 = v12;
        unint64_t v21 = -[KTContext validatePeerOrEnrollKTRequest:queryRequest:queryResponse:transparentData:loggableDatas:error:]( self,  "validatePeerOrEnrollKTRequest:queryRequest:queryResponse:transparentData:loggableDatas:error:",  v8,  v15,  v16,  &v31,  &v30,  &v29);
        id v22 = v31;
        id v23 = v30;
        id v24 = v29;

        v9[2](v9, v21, v22, v23, v24);
        id v12 = v24;
        goto LABEL_21;
      }
    }

    if (qword_1002E6460 != -1) {
      dispatch_once(&qword_1002E6460, &stru_100278210);
    }
    id v25 = (void *)qword_1002E6468;
    if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_DEBUG))
    {
      __int16 v26 = v25;
      int v27 = (void *)objc_claimAutoreleasedReturnValue([v8 requestId]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v8 uri]);
      *(_DWORD *)buf = 138543618;
      id v39 = v27;
      __int16 v40 = 2112;
      id v41 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "fetching query in validatePeer for requestId %{public}@ uri: %@",  buf,  0x16u);
    }

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10001FADC;
    v32[3] = &unk_100278278;
    v32[4] = self;
    id v33 = v9;
    -[KTContext fetchQueryForKTRequest:completionHandler:](self, "fetchQueryForKTRequest:completionHandler:", v8, v32);

LABEL_21:
    goto LABEL_22;
  }

  id v36 = v11;
  -[KTContext writeResult:request:proof:error:](self, "writeResult:request:proof:error:", 0LL, v8, 0LL, &v36);
  id v13 = v36;

  v9[2](v9, 0LL, 0LL, 0LL, v13);
  id v12 = v13;
LABEL_22:
}

- (unint64_t)synchronousFetchAndValidatePeerKTRequest:(id)a3 fetchNow:(BOOL)a4 transparentData:(id *)a5 loggableDatas:(id *)a6 error:(id *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  uint64_t v49 = 0LL;
  id v50 = &v49;
  uint64_t v51 = 0x2020000000LL;
  uint64_t v52 = 2LL;
  uint64_t v43 = 0LL;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  id v46 = sub_10001BEB0;
  id v47 = sub_10001BEC0;
  id v48 = 0LL;
  uint64_t v37 = 0LL;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  __int16 v40 = sub_10001BEB0;
  id v41 = sub_10001BEC0;
  id v42 = 0LL;
  uint64_t v31 = 0LL;
  unsigned __int8 v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  id v34 = sub_10001BEB0;
  id v35 = sub_10001BEC0;
  id v36 = 0LL;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100020188;
  v25[3] = &unk_1002782C0;
  int v27 = &v43;
  id v28 = &v37;
  id v29 = &v31;
  id v30 = &v49;
  id v13 = dispatch_semaphore_create(0LL);
  __int16 v26 = v13;
  -[KTContext fetchAndValidatePeerKTRequest:fetchNow:completionHandler:]( self,  "fetchAndValidatePeerKTRequest:fetchNow:completionHandler:",  v12,  v10,  v25);
  dispatch_time_t v14 = dispatch_time(0LL, 2000000000LL);
  if (dispatch_semaphore_wait(v13, v14))
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -168LL,  @"test timed out waiting for validatePeer"));
    unsigned __int8 v16 = (void *)v32[5];
    void v32[5] = v15;

    if (qword_1002E6460 != -1) {
      dispatch_once(&qword_1002E6460, &stru_1002782E0);
    }
    id v17 = (os_log_s *)qword_1002E6468;
    if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v24 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "test timed out waiting for validatePeer",  v24,  2u);
    }

    if (a7)
    {
      id v18 = (void *)v32[5];
      if (v18) {
        *a7 = v18;
      }
    }

    unint64_t v19 = 2LL;
  }

  else
  {
    if (a5)
    {
      uint64_t v20 = (void *)v44[5];
      if (v20) {
        *a5 = v20;
      }
    }

    if (a6)
    {
      unint64_t v21 = (void *)v38[5];
      if (v21) {
        *a6 = v21;
      }
    }

    if (a7)
    {
      id v22 = (void *)v32[5];
      if (v22) {
        *a7 = v22;
      }
    }

    unint64_t v19 = v50[3];
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v19;
}

- (unint64_t)synchronousFetchAndValidatePeerKTRequest:(id)a3 transparentData:(id *)a4 loggableDatas:(id *)a5 error:(id *)a6
{
  return -[KTContext synchronousFetchAndValidatePeerKTRequest:fetchNow:transparentData:loggableDatas:error:]( self,  "synchronousFetchAndValidatePeerKTRequest:fetchNow:transparentData:loggableDatas:error:",  a3,  0LL,  a4,  a5,  a6);
}

- (unint64_t)fetchAndValidateEnrollKTRequest:(id)a3 transparentData:(id *)a4 loggableDatas:(id *)a5 cloudOptIn:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  if (-[KTContext unsupported:](self, "unsupported:", a7))
  {
    -[KTContext writeResult:request:proof:error:](self, "writeResult:request:proof:error:", 0LL, v12, 0LL, a7);
    unint64_t v14 = 0LL;
    goto LABEL_26;
  }

  uint64_t v15 = objc_claimAutoreleasedReturnValue([v12 queryResponse]);
  if (v15)
  {
    unsigned __int8 v16 = (void *)v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 queryRequest]);

    if (!v17)
    {
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v12 queryResponse]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___InsertResponse,  "parseFromData:error:",  v26,  a7));

      if (v18)
      {
        if (qword_1002E6460 != -1) {
          dispatch_once(&qword_1002E6460, &stru_1002783A8);
        }
        int v27 = (void *)qword_1002E6468;
        if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_DEFAULT))
        {
          id v28 = v27;
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v12 requestId]);
          *(_DWORD *)buf = 138543362;
          uint64_t v37 = (uint64_t)v29;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "using existing insertResponse in validateEnrollment for requestId %{public}@",  buf,  0xCu);
        }

        unint64_t v14 = -[KTContext validateEnrollKTRequest:insertResponse:transparentData:loggableDatas:cloudOptIn:error:]( self,  "validateEnrollKTRequest:insertResponse:transparentData:loggableDatas:cloudOptIn:error:",  v12,  v18,  a4,  a5,  v13,  a7);
        goto LABEL_25;
      }

      if (qword_1002E6460 != -1) {
        dispatch_once(&qword_1002E6460, &stru_100278300);
      }
      uint64_t v31 = (os_log_s *)(id)qword_1002E6468;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = objc_claimAutoreleasedReturnValue([v12 requestId]);
        uint64_t v33 = (void *)v32;
        if (a7) {
          id v34 = *a7;
        }
        else {
          id v34 = 0LL;
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v32;
        __int16 v38 = 2112;
        id v39 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "parse saved queryResponse as insert response for requestId %{public}@ failed: %@",  buf,  0x16u);
      }
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[KTContext parseQueryRequestFromKTRequest:error:]( self,  "parseQueryRequestFromKTRequest:error:",  v12,  a7));
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[KTContext parseQueryResponseFromKTRequest:error:]( self,  "parseQueryResponseFromKTRequest:error:",  v12,  a7));
  if (v19 && v18)
  {
    if (qword_1002E6460 != -1) {
      dispatch_once(&qword_1002E6460, &stru_100278388);
    }
    uint64_t v20 = (void *)qword_1002E6468;
    if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v21 = v20;
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 requestId]);
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = (uint64_t)v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "using existing queryResponse in validateEnrollment for requestId %{public}@",  buf,  0xCu);
    }

    unint64_t v14 = -[KTContext validatePeerOrEnrollKTRequest:queryRequest:queryResponse:transparentData:loggableDatas:error:]( self,  "validatePeerOrEnrollKTRequest:queryRequest:queryResponse:transparentData:loggableDatas:error:",  v12,  v18,  v19,  a4,  a5,  a7);

LABEL_25:
    goto LABEL_26;
  }

  if (qword_1002E6460 != -1) {
    dispatch_once(&qword_1002E6460, &stru_100278320);
  }
  id v23 = (void *)qword_1002E6468;
  if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_DEBUG))
  {
    id v24 = v23;
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v12 requestId]);
    *(_DWORD *)buf = 138543362;
    uint64_t v37 = (uint64_t)v25;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "fetching query in validateEnrollment for requestId %{public}@",  buf,  0xCu);
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100020790;
  v35[3] = &unk_100278368;
  v35[4] = self;
  -[KTContext fetchQueryForKTRequest:completionHandler:](self, "fetchQueryForKTRequest:completionHandler:", v12, v35);

  if (a7) {
    *a7 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorUnknown,  -134LL,  @"request to server pending"));
  }
  unint64_t v14 = 2LL;
LABEL_26:

  return v14;
}

- (void)validatePeerRequestId:(id)a3 revalidate:(BOOL)a4 fetchNow:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[KTContext validateEventName:application:]( &OBJC_CLASS___KTContext,  "validateEventName:application:",  0LL,  v12));

  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  id v27 = 0LL;
  unint64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  unint64_t v21 = sub_100020B34;
  id v22 = &unk_1002783F8;
  BOOL v25 = a4;
  id v23 = self;
  BOOL v26 = a5;
  id v15 = v10;
  id v24 = v15;
  unsigned __int8 v16 = [v14 performAndWaitForRequestId:v11 error:&v27 block:&v19];

  id v17 = v27;
  if ((v16 & 1) == 0)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics logger]( &OBJC_CLASS___TransparencyAnalytics,  "logger",  v19,  v20,  v21,  v22,  v23));
    [v18 logResultForEvent:v13 hardFailure:1 result:v17];

    (*((void (**)(id, void, id))v15 + 2))(v15, 0LL, v17);
  }
}

- (unint64_t)validateEnrollmentRequestId:(id)a3 transparentData:(id *)a4 loggableDatas:(id *)a5 cloudOptIn:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a6;
  uint64_t v45 = 0LL;
  id v46 = &v45;
  uint64_t v47 = 0x2020000000LL;
  uint64_t v48 = 2LL;
  uint64_t v39 = 0LL;
  __int16 v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  id v42 = sub_10001BEB0;
  uint64_t v43 = sub_10001BEC0;
  id v44 = 0LL;
  uint64_t v33 = 0LL;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  id v36 = sub_10001BEB0;
  uint64_t v37 = sub_10001BEC0;
  id v38 = 0LL;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_10001BEB0;
  uint64_t v31 = sub_10001BEC0;
  id v32 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100020FA4;
  v21[3] = &unk_100278420;
  id v23 = &v45;
  id v24 = &v39;
  v21[4] = self;
  BOOL v25 = &v33;
  id v14 = v12;
  id v22 = v14;
  BOOL v26 = &v27;
  LOBYTE(v12) = [v13 performAndWaitForRequestId:v11 error:a7 block:v21];

  if ((v12 & 1) != 0)
  {
    if (a4)
    {
      id v15 = (void *)v40[5];
      if (v15) {
        *a4 = v15;
      }
    }

    if (a5)
    {
      unsigned __int8 v16 = (void *)v34[5];
      if (v16) {
        *a5 = v16;
      }
    }

    if (a7)
    {
      id v17 = (void *)v28[5];
      if (v17) {
        *a7 = v17;
      }
    }

    unint64_t v18 = v46[3];
  }

  else
  {
    unint64_t v18 = 0LL;
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v18;
}

- (void)replaySelfValidate:(id)a3 pcsAccountKey:(id)a4 queryRequest:(id)a5 queryResponse:(id)a6 responseTime:(id)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v38 = a4;
  id v44 = a5;
  id v43 = a6;
  id v42 = a7;
  uint64_t v35 = (void (**)(id, uint64_t, id, void))a8;
  uint64_t v45 = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 syncedLoggableDatas]);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyManagedDataStore serializeLoggableDatas:]( &OBJC_CLASS___TransparencyManagedDataStore,  "serializeLoggableDatas:",  v14));

  __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v13 uriToServerLoggableDatas]);
  id v41 = [obj countByEnumeratingWithState:&v60 objects:v72 count:16];
  if (v41)
  {
    uint64_t v37 = *(void *)v61;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v61 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v60 + 1) + 8LL * (void)v15);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v45 uriToServerLoggableDatas]);
        unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v16]);

        unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 serverLoggableDatas]);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyManagedDataStore serializeLoggableDatas:]( &OBJC_CLASS___TransparencyManagedDataStore,  "serializeLoggableDatas:",  v19));

        unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 accountKey]);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v18 idsResponseTime]);
        id v59 = 0LL;
        BOOL v25 = (void *)objc_claimAutoreleasedReturnValue( [v21 createRequestWithUri:v16 application:v22 accountKey:v23 serverData:v20 syncedData:v39 idsResponseTime:v24 queryRequest :v44 queryResponse:v43 responseDate:v42 type:1 clientId:0 error:&v59]);
        id v26 = v59;

        if (qword_1002E6460 != -1) {
          dispatch_once(&qword_1002E6460, &stru_100278440);
        }
        uint64_t v27 = (os_log_s *)qword_1002E6468;
        if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v25;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "ReplaySelfValidate: created requestId %{public}@ for %@",  buf,  0x16u);
        }

        *(void *)buf = 0LL;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000LL;
        uint64_t v69 = sub_10001BEB0;
        uint64_t v70 = sub_10001BEC0;
        id v71 = 0LL;
        id v71 = objc_alloc_init(&OBJC_CLASS___KTSelfValidationURIDiagnostics);
        id v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        id v58 = 0LL;
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_1000216B8;
        v47[3] = &unk_1002784A8;
        id v48 = v44;
        id v29 = v25;
        uint64_t v57 = buf;
        id v49 = v29;
        id v50 = self;
        id v51 = v43;
        id v52 = v42;
        id v53 = v45;
        id v54 = v38;
        id v55 = v40;
        uint64_t v56 = v16;
        unsigned __int8 v30 = [v28 performAndWaitForRequestId:v29 error:&v58 block:v47];
        id v31 = v58;

        if ((v30 & 1) == 0)
        {
          if (qword_1002E6460 != -1) {
            dispatch_once(&qword_1002E6460, &stru_1002784C8);
          }
          id v32 = (os_log_s *)qword_1002E6468;
          if (os_log_type_enabled((os_log_t)qword_1002E6468, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id v64 = 138543618;
            id v65 = v29;
            __int16 v66 = 2112;
            id v67 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "ReplayValidateSelf: failed to find requestId %{public}@: %@",  v64,  0x16u);
          }

          [*(id *)(*(void *)&buf[8] + 40) setResult:@"Failed"];
          [*(id *)(*(void *)&buf[8] + 40) setError:v31];
        }

        _Block_object_dispose(buf, 8);
        id v15 = (char *)v15 + 1;
      }

      while (v41 != v15);
      id v41 = [obj countByEnumeratingWithState:&v60 objects:v72 count:16];
    }

    while (v41);
  }

  id v33 = objc_alloc_init(&OBJC_CLASS___KTSelfValidationDiagnostics);
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v45 diagnosticsJsonDictionary]);
  [v33 setKtSelfVerificationInfoDiagnosticsJson:v34];

  [v33 setUriToDiagnostics:v40];
  v35[2](v35, 1LL, v33, 0LL);
}

+ (id)validateEventName:(unint64_t)a3 application:(id)a4
{
  id v5 = a4;
  if (a3 > 5) {
    BOOL v6 = @"ValidateUnknownCompleteEvent";
  }
  else {
    BOOL v6 = *(&off_10027AA50 + a3);
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  v6,  v5));

  return v7;
}

+ (id)successMetricsKey:(id)a3 validationName:(id)a4
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"days%@Validation-%@",  a4,  a3);
}

+ (id)analyticsSuccessNames
{
  if (qword_1002E64D0 != -1) {
    dispatch_once(&qword_1002E64D0, &stru_10027A978);
  }
  return (id)qword_1002E64D8;
}

+ (id)successMetricsKey:(unint64_t)a3 forApplicationID:(id)a4
{
  id v5 = a4;
  if (a3 <= 6 && ((0x77u >> a3) & 1) != 0) {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[KTContext successMetricsKey:validationName:]( &OBJC_CLASS___KTContext,  "successMetricsKey:validationName:",  v5,  *(&off_10027AA80 + a3)));
  }
  else {
    BOOL v6 = 0LL;
  }

  return v6;
}

+ (void)metricsForResult:(unint64_t)a3 type:(unint64_t)a4 logger:(id)a5 applicationID:(id)a6
{
  id v11 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[KTContext successMetricsKey:forApplicationID:]( &OBJC_CLASS___KTContext,  "successMetricsKey:forApplicationID:",  a4,  a6));
  if (v9)
  {
    if (a3)
    {
      id v10 = v11;
      if (a3 != 1)
      {
LABEL_7:
        +[KTContext updateEligibilityThreshold:](&OBJC_CLASS___KTContext, "updateEligibilityThreshold:", v10);
        goto LABEL_8;
      }

      [v11 setSuccessNowForPropertyKey:v9];
    }

    else
    {
      [v11 setFailureNowForPropertyKey:v9];
    }

    id v10 = v11;
    goto LABEL_7;
  }

+ (id)analyticsSelfFlagNames
{
  if (qword_1002E64E0 != -1) {
    dispatch_once(&qword_1002E64E0, &stru_10027A998);
  }
  return (id)qword_1002E64E8;
}

+ (id)selfStatusFlagMetricsKey:(id)a3 name:(id)a4
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"selfValidation-%@-%@",  a4,  a3);
}

- (void)selfValidationURIStatus:(id)a3 transparentData:(id)a4 selfDeviceID:(id)a5 logger:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[KTLoggableData isAccountKTCapable:](&OBJC_CLASS___KTLoggableData, "isAccountKTCapable:", v10);
  uint64_t v16 = (void *)objc_opt_class(self, v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 selfStatusFlagMetricsKey:v17 name:@"ktCapable"]);

  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14));
  id v54 = (void *)v18;
  [v13 setNumberProperty:v19 forKey:v18];

  unint64_t v21 = (void *)objc_opt_class(self, v20);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  uint64_t v23 = objc_claimAutoreleasedReturnValue([v21 selfStatusFlagMetricsKey:v22 name:@"optIn"]);

  uint64_t v56 = v11;
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v11 verifiedAccountOptInState]));
  id v55 = v13;
  id v53 = (void *)v23;
  [v13 setNumberProperty:v24 forKey:v23];

  id v26 = (void *)objc_opt_class(self, v25);
  id v51 = self;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  id v52 = (void *)objc_claimAutoreleasedReturnValue([v26 selfStatusFlagMetricsKey:v27 name:@"humbled"]);

  BOOL v57 = v12 != 0LL;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id obj = v10;
  id v28 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v28)
  {
    id v29 = v28;
    unsigned __int8 v30 = 0LL;
    char v31 = 0;
    uint64_t v32 = *(void *)v60;
    do
    {
      for (i = 0LL; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v60 != v32) {
          objc_enumerationMutation(obj);
        }
        id v34 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
        uint64_t v35 = objc_claimAutoreleasedReturnValue([v34 version]);
        if (v35
          && (id v36 = (void *)v35,
              uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v34 version]),
              unsigned __int8 v38 = [v37 isEqual:&off_100299B70],
              v37,
              v36,
              (v38 & 1) == 0))
        {
          if (!v30
            || (uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v34 version]),
                id v40 = [v30 compare:v39],
                v39,
                v40 == (id)1))
          {
            uint64_t v41 = objc_claimAutoreleasedReturnValue([v34 version]);

            unsigned __int8 v30 = (void *)v41;
          }
        }

        else
        {
          char v31 = 1;
        }

        id v42 = (void *)objc_claimAutoreleasedReturnValue([v34 deviceID]);
        unsigned int v43 = [v12 isEqual:v42];

        if (v43)
        {
          if ([v34 result]) {
            int v44 = 3;
          }
          else {
            int v44 = 2;
          }
          BOOL v57 = v44;
        }
      }

      id v29 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
    }

    while (v29);
  }

  else
  {
    unsigned __int8 v30 = 0LL;
    char v31 = 0;
  }

  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v57));
  [v55 setNumberProperty:v45 forKey:v52];

  if (v30)
  {
    if ((v31 & 1) != 0)
    {
      uint64_t v47 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  -(uint64_t)[v30 intValue]));

      unsigned __int8 v30 = (void *)v47;
    }

    id v48 = (void *)objc_opt_class(v51, v46);
    id v49 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](v51, "applicationID"));
    id v50 = (void *)objc_claimAutoreleasedReturnValue([v48 selfStatusFlagMetricsKey:v49 name:@"OV"]);

    [v55 setNumberProperty:v30 forKey:v50];
  }
}

- (void)reportValidationTime:(unint64_t)a3 initialResult:(unint64_t)a4 result:(unint64_t)a5 idsResponseTime:(id)a6
{
  if (a4 == 2 && a5 != 2)
  {
    id v8 = a6;
    double Current = CFAbsoluteTimeGetCurrent();
    [v8 timeIntervalSinceReferenceDate];
    double v11 = v10;

    double v12 = Current - v11;
    switch(a3)
    {
      case 0uLL:
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        id v14 = @"ValidatePeerTime";
        break;
      case 1uLL:
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        id v14 = @"ValidateSelfTime";
        break;
      case 2uLL:
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        id v14 = @"ValidateEnrollmentTime";
        break;
      case 4uLL:
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        id v14 = @"PeerV2Time";
        break;
      case 5uLL:
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        id v14 = @"PeerV2OptInTime";
        break;
      default:
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        id v14 = @"UnknownTypeTime";
        break;
    }

    id v17 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  v14,  v13));

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12));
    [v15 logMetric:v16 withName:v17];
  }

+ (BOOL)hasAccountMismatch:(id)a3
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)i), "successfulSync", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (id)serverLoggableDatasDiagnostics:(id)a3 selfPushToken:(id)a4 humbled:(BOOL *)a5
{
  uint64_t v25 = a5;
  id v6 = a3;
  id v7 = a4;
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    id obj = v9;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary", v25));
        if (!v15)
        {
          id v9 = obj;

          goto LABEL_15;
        }

        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 build]);
        [v15 setObject:v16 forKeyedSubscript:@"b"];

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 product]);
        [v15 setObject:v17 forKeyedSubscript:@"p"];

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 version]);
        [v15 setObject:v18 forKeyedSubscript:@"v"];

        unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v14 result]));
        [v15 setObject:v19 forKeyedSubscript:@"r"];

        if (v7
          && (uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceID]),
              unsigned int v21 = [v20 isEqualToData:v7],
              v20,
              v21))
        {
          *uint64_t v25 = [v14 result] == 0;
          uint64_t v22 = 1LL;
        }

        else
        {
          uint64_t v22 = 0LL;
        }

        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v22));
        [v15 setObject:v23 forKeyedSubscript:@"c"];

        [v8 addObject:v15];
      }

      id v9 = obj;
      id v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v15 = v8;
LABEL_15:

  return v15;
}

- (id)analyticsForType:(unint64_t)a3 uri:(id)a4 accountKey:(id)a5 serverLoggableDatas:(id)a6 syncedLoggableDatas:(id)a7 transparentData:(id)a8 selfVerificationInfo:(id)a9 responseTime:(id)a10 result:(unint64_t)a11 failure:(id)a12 responseMetadata:(id)a13
{
  id v75 = a4;
  id v18 = a5;
  id v79 = a6;
  id v19 = a7;
  id v20 = a8;
  id v76 = a10;
  id v81 = a12;
  id v80 = a13;
  id v73 = a9;
  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v22 inResetWindow]));
  [v21 setObject:v23 forKeyedSubscript:@"inResetWindow"];

  uint64_t v77 = self;
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext optInServer](self, "optInServer"));
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472LL;
  v83[2] = sub_10004A094;
  v83[3] = &unk_10027A9C0;
  id v25 = v21;
  id v84 = v25;
  [v24 getOptInState:1 completionBlock:v83];

  if (v20)
  {
    uint64_t String = KTOptInGetString([v20 accountOptInState:v18]);
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(String);
    [v25 setObject:v27 forKeyedSubscript:@"peerOptIn"];

    uint64_t v28 = KTOptInGetString([v20 accountEverOptedIn:v18]);
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    [v25 setObject:v29 forKeyedSubscript:@"peerEverOptedIn"];

    uint64_t v30 = KTOptInGetString([v20 accountRecentlyOptedIn:v18]);
    char v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    [v25 setObject:v31 forKeyedSubscript:@"peerRecentlyOptedIn"];

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v20 staticKeyEnforced]));
    [v25 setObject:v32 forKeyedSubscript:@"staticKeyEnforced"];

    id v33 = (void *)objc_claimAutoreleasedReturnValue([v20 expectedSelfResolutionDate:v18 requestDate:v76]);
    id v34 = v33;
    if (v33)
    {
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "kt_dateToString"));
      [v25 setObject:v35 forKeyedSubscript:@"expectedResolutionDate"];

      id v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "kt_toISO_8601_UTCString"));
      [v25 setObject:v36 forKeyedSubscript:@"expectedResolutionDateReadable"];

      [v34 timeIntervalSinceNow];
      unsigned __int8 v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", llround(v37 / 86400.0)));
      [v25 setObject:v38 forKeyedSubscript:@"daysUntilExpectedResolutionDate"];
    }

    if (v18)
    {
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v20 getLogDataForAccountKey:v18 uri:v75]);
      id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:v75]);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 lastObject]);
      id v42 = v41;
      if (v41)
      {
        unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v41 optIn]));
        [v25 setObject:v43 forKeyedSubscript:@"serverOptIn"];
      }
    }
  }

  int v44 = (void *)objc_claimAutoreleasedReturnValue([v20 earliestAddedDate:v18]);
  uint64_t v46 = v44;
  if (v44)
  {
    [v44 timeIntervalSince1970];
    double v48 = (double)(kKTMaximumResetFailureWindowMs + (unint64_t)(v47 * 1000.0));
    +[NSDate kt_currentTimeMs](&OBJC_CLASS___NSDate, "kt_currentTimeMs");
    id v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v49 < v48));
    [v25 setObject:v50 forKeyedSubscript:@"inHeartbeatWindow"];
  }

  id v51 = v79;
  if (v19 && !a11)
  {
    id v52 = +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend((id)objc_opt_class(v77, v45), "hasAccountMismatch:", v19));
    id v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    [v25 setObject:v53 forKeyedSubscript:@"mismatchedAccounts"];
  }

  id v54 = +[KTLoggableData isAccountKTCapable:](&OBJC_CLASS___KTLoggableData, "isAccountKTCapable:", v79);
  if ((v54 & 1) != 0)
  {
    BOOL v74 = 0;
  }

  else
  {
    BOOL v56 = (a3 & 0xFFFFFFFFFFFFFFFBLL) == 0 || a3 == 5;
    BOOL v74 = v56;
  }

  if (v79)
  {
    if (!a11)
    {
      BOOL v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v54));
      [v25 setObject:v57 forKeyedSubscript:@"ktCapable"];

      if (v74) {
        [v25 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ktSoftFailure"];
      }
    }
  }

  id v58 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics analyticsErrorData:]( &OBJC_CLASS___TransparencyAnalytics,  "analyticsErrorData:",  v81));
  [v25 setObject:v58 forKeyedSubscript:@"failure"];

  unsigned __int8 v82 = 0;
  __int128 v59 = (void *)objc_claimAutoreleasedReturnValue([v73 selfDeviceID]);

  __int128 v60 = (void *)objc_claimAutoreleasedReturnValue( -[KTContext serverLoggableDatasDiagnostics:selfPushToken:humbled:]( v77,  "serverLoggableDatasDiagnostics:selfPushToken:humbled:",  v79,  v59,  &v82));
  [v25 setObject:v60 forKeyedSubscript:@"sldd"];

  __int128 v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v82));
  [v25 setObject:v61 forKeyedSubscript:@"humbled"];

  if (a3 == 1 && [v81 code] == (id)-286)
  {
    __int128 v62 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    __int128 v63 = (void *)objc_claimAutoreleasedReturnValue([v62 numberPropertyForKey:@"stateAtSigFetchStart"]);
    [v25 setObject:v63 forKeyedSubscript:@"stateAtSigFetchStart"];

    id v64 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    id v65 = (void *)objc_claimAutoreleasedReturnValue([v64 numberPropertyForKey:@"stateAtSigFetchEnd"]);
    [v25 setObject:v65 forKeyedSubscript:@"stateAtSigFetchEnd"];

    id v51 = v79;
  }

  if (+[TransparencyAnalytics hasInternalDiagnostics]( &OBJC_CLASS___TransparencyAnalytics,  "hasInternalDiagnostics"))
  {
    if (!a11)
    {
      [v25 setObject:v75 forKeyedSubscript:@"failedUri"];
      __int16 v66 = (void *)objc_claimAutoreleasedReturnValue([v18 base64EncodedStringWithOptions:0]);
      [v25 setObject:v66 forKeyedSubscript:@"failedAccountKey"];
    }

    uint64_t v67 = kTransparencyResponseMetadataKeyServerHint;
    id v68 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint]);
    if (v68) {
      [v25 setObject:v68 forKeyedSubscript:v67];
    }
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKeyedSubscript:@"APS"]);

    if (v69)
    {
      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      [v25 setObject:v70 forKeyedSubscript:@"APS"];
    }

    id v51 = v79;
  }

  if (!v74 && !+[KTContext checkNetworkError:](&OBJC_CLASS___KTContext, "checkNetworkError:", v81)) {
    -[KTContext storeEligibilityMetric:result:error:](v77, "storeEligibilityMetric:result:error:", a3, a11, v81);
  }
  id v71 = v25;

  return v71;
}

- (void)storeEligibilityMetric:(unint64_t)a3 result:(unint64_t)a4 error:(id)a5
{
  id v8 = a5;
  if (_os_feature_enabled_impl("Transparency", "KTEligibilityMetrics"))
  {
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTContext eligibilityQueue](self, "eligibilityQueue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10004A1A8;
    v10[3] = &unk_10027AA30;
    unint64_t v13 = a3;
    unint64_t v14 = a4;
    id v11 = v8;
    uint64_t v12 = self;
    dispatch_async(v9, v10);
  }
}

- (id)analyticsForResponse:(id)a3 type:(unint64_t)a4 uri:(id)a5 result:(unint64_t)a6 ktCapable:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a5;
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v15 inResetWindow]));
  [v14 setObject:v16 forKeyedSubscript:@"inResetWindow"];

  if (a6)
  {
    +[TransparencyAnalytics hasInternalDiagnostics](&OBJC_CLASS___TransparencyAnalytics, "hasInternalDiagnostics");
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
    [v14 setObject:v17 forKeyedSubscript:@"ktCapable"];

    if (!v7 && a4 <= 5 && ((1LL << a4) & 0x31) != 0) {
      [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ktSoftFailure"];
    }
    if (+[TransparencyAnalytics hasInternalDiagnostics]( &OBJC_CLASS___TransparencyAnalytics,  "hasInternalDiagnostics")) {
      [v14 setObject:v13 forKeyedSubscript:@"failedUri"];
    }
  }

  uint64_t v18 = kTransparencyResponseMetadataKeyServerHint;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint]);
  if (v19) {
    [v14 setObject:v19 forKeyedSubscript:v18];
  }
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"APS"]);

  if (v20)
  {
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    [v14 setObject:v21 forKeyedSubscript:@"APS"];
  }

  return v14;
}

+ (void)checkAndLogHardErrorIfNecessary:(unint64_t)a3 type:(unint64_t)a4 logger:(id)a5 error:(id)a6 applicationID:(id)a7
{
  id v15 = a5;
  id v11 = a6;
  id v12 = a7;
  if (a4 == 1)
  {
    if (a3)
    {
      unint64_t v13 = a3;
      id v14 = v15;
LABEL_6:
      +[KTContext metricsForResult:type:logger:applicationID:]( &OBJC_CLASS___KTContext,  "metricsForResult:type:logger:applicationID:",  v13,  6LL,  v14,  v12);
      goto LABEL_7;
    }

    if (!+[KTContext checkNetworkError:](&OBJC_CLASS___KTContext, "checkNetworkError:", v11))
    {
      unint64_t v13 = 0LL;
      id v14 = v15;
      goto LABEL_6;
    }
  }

+ (BOOL)checkNetworkError:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSError, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    BOOL v13 = 0;
    goto LABEL_18;
  }

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  if ([v8 isEqual:NSURLErrorDomain])
  {
LABEL_14:

LABEL_15:
LABEL_16:
    BOOL v13 = 1;
    goto LABEL_18;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  if ([v9 isEqual:kCFErrorDomainCFNetwork])
  {
LABEL_13:

    goto LABEL_14;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  if ([v10 isEqual:kTransparencyErrorInternal] && objc_msgSend(v4, "code") == (id)-343)
  {
LABEL_12:

    goto LABEL_13;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  if ([v11 isEqual:kTransparencyErrorInterface] && objc_msgSend(v4, "code") == (id)-41)
  {
LABEL_11:

    goto LABEL_12;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  if ([v12 isEqual:kTransparencyErrorIDSRegistrationTimeout])
  {

    goto LABEL_11;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  unsigned __int8 v16 = [v15 isEqual:kTransparencyErrorBAACertFetch];

  if ((v16 & 1) != 0) {
    goto LABEL_16;
  }
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v18 = (id)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  if ([a1 checkNetworkError:v18])
  {
    BOOL v13 = 1;
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:NSMultipleUnderlyingErrorsKey]);

    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSArray, v21);
    if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0)
    {
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v23 = v20;
      id v24 = [v23 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v30;
        while (2)
        {
          __int128 v27 = 0LL;
          uint64_t v28 = v18;
          do
          {
            if (*(void *)v30 != v26) {
              objc_enumerationMutation(v23);
            }
            id v18 = *(id *)(*((void *)&v29 + 1) + 8LL * (void)v27);

            if (objc_msgSend(a1, "checkNetworkError:", v18, (void)v29))
            {
              BOOL v13 = 1;
              goto LABEL_34;
            }

            __int128 v27 = (char *)v27 + 1;
            uint64_t v28 = v18;
          }

          while (v25 != v27);
          id v25 = [v23 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }

      BOOL v13 = 0;
      id v18 = 0LL;
LABEL_34:
    }

    else
    {
      BOOL v13 = 0;
    }
  }

LABEL_18:
  return v13;
}

+ (BOOL)hasReachedEligibilityThreshold:(id)a3
{
  uint64_t v3 = eligibilityKey;
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 numberPropertyForKey:v3]);
  unsigned __int8 v6 = [v5 BOOLValue];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 numberPropertyForKey:eligibilityVersionKey]);
  id v8 = [v7 longValue];
  uint64_t v9 = ktEligibilityAnalyticsVersion;

  else {
    return 0;
  }
}

+ (BOOL)isCurrentlyEligible:(id)a3
{
  uint64_t v3 = kKTApplicationIdentifierIDS;
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[KTContext successMetricsKey:forApplicationID:]( &OBJC_CLASS___KTContext,  "successMetricsKey:forApplicationID:",  1LL,  v3));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[KTContext successMetricsKey:forApplicationID:]( &OBJC_CLASS___KTContext,  "successMetricsKey:forApplicationID:",  4LL,  v3));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 fuzzyTimeSinceLastSuccess:v5]);
  id v8 = [v7 longValue];
  uint64_t v9 = ktSelfValidateSuccessDays;

  uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 fuzzyTimeSinceLastSuccess:v6]);
  id v11 = [(id)v10 longValue];
  uint64_t v12 = ktPeerValidateSuccessDays;

  LODWORD(v10) = [v4 manateeStatusForReporting];
  unsigned int v13 = (v10 < 0x18) & (0x804001u >> v10);
  else {
    BOOL v14 = 0;
  }

  return v14;
}

+ (void)updateEligibilityThreshold:(id)a3
{
  id v4 = a3;
  if (!+[KTContext hasReachedEligibilityThreshold:](&OBJC_CLASS___KTContext, "hasReachedEligibilityThreshold:")
    && +[KTContext isCurrentlyEligible:](&OBJC_CLASS___KTContext, "isCurrentlyEligible:", v4))
  {
    [v4 setNumberProperty:&__kCFBooleanTrue forKey:eligibilityKey];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  ktEligibilityAnalyticsVersion));
    [v4 setNumberProperty:v3 forKey:eligibilityVersionKey];
  }
}

- (void)fetchRPCSingleQuery:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 backgroundOpId:(id)a6 completionHandler:(id)a7
{
  BOOL v27 = a4;
  id v11 = a3;
  id v12 = a5;
  id v28 = a6;
  unsigned int v13 = (void (**)(id, void *, id))a7;
  if (v12)
  {
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 uri]);
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v11 application]));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationIdentifierForValue:]( &OBJC_CLASS___TransparencyApplication,  "applicationIdentifierForValue:",  v16));
    id v47 = 0LL;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( [v14 getLatestSuccessfulSingleQueryForUri:v15 application:v17 requestYoungerThan:v12 error:&v47]);
    id v19 = v47;

    if (v18)
    {
      v13[2](v13, v18, v19);

      goto LABEL_14;
    }
  }

  uint64_t v41 = 0LL;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  int v44 = sub_10005531C;
  uint64_t v45 = sub_10005532C;
  id v46 = 0LL;
  uint64_t v35 = 0LL;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  unsigned __int8 v38 = sub_10005531C;
  uint64_t v39 = sub_10005532C;
  id v40 = 0LL;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100055334;
  v30[3] = &unk_10027B708;
  id v33 = &v35;
  v30[4] = self;
  id v21 = v11;
  id v31 = v21;
  id v32 = v28;
  id v34 = &v41;
  [v20 performBlockAndWait:v30];

  if (v36[5] && !v42[5])
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext logClient](self, "logClient"));
    uint64_t v26 = v36[5];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000553E8;
    v29[3] = &unk_10027B770;
    v29[5] = &v41;
    v29[6] = &v35;
    v29[4] = self;
    [v25 fetchQuery:v21 uuid:v26 userInitiated:v27 completionHandler:v29];

    v13[2](v13, (void *)v36[5], (id)v42[5]);
  }

  else
  {
    if (qword_1002E6560 != -1) {
      dispatch_once(&qword_1002E6560, &stru_10027B728);
    }
    uint64_t v22 = (os_log_s *)qword_1002E6568;
    if (os_log_type_enabled((os_log_t)qword_1002E6568, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = v42[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v49 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "failed to save single query rpc before fetch: %@",  buf,  0xCu);
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    [v24 reportCoreDataPersistEventForLocation:@"fetchRPCSingleQuery" underlyingError:v42[5]];

    v13[2](v13, 0LL, (id)v42[5]);
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

LABEL_14:
}

- (void)fetchRPCSingleQuery:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 completionHandler:(id)a6
{
}

- (void)queryForUris:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 backgroundOpId:(id)a6 completionHandler:(id)a7
{
  BOOL v26 = a4;
  id v11 = a3;
  id v28 = a5;
  id v27 = a6;
  id v25 = (void (**)(id, void))a7;
  uint64_t v37 = 0LL;
  unsigned __int8 v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  id v40 = sub_10005531C;
  uint64_t v41 = sub_10005532C;
  id v42 = 0LL;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v33 objects:v47 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        id v18 = (id *)(v38 + 5);
        id v32 = (id)v38[5];
        unsigned int v19 = [v16 hasPendingSingleQueryForUri:v15 application:v17 error:&v32];
        objc_storeStrong(v18, v32);

        if (v19)
        {
          if (qword_1002E6560 != -1) {
            dispatch_once(&qword_1002E6560, &stru_10027B790);
          }
          id v20 = (os_log_s *)qword_1002E6568;
          if (os_log_type_enabled((os_log_t)qword_1002E6568, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 141558274;
            uint64_t v44 = 1752392040LL;
            __int16 v45 = 2112;
            uint64_t v46 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "queryForUris: skipping fetch for %{mask.hash}@ due to existing pending query",  buf,  0x16u);
          }
        }

        else
        {
          if (qword_1002E6560 != -1) {
            dispatch_once(&qword_1002E6560, &stru_10027B7B0);
          }
          id v21 = (os_log_s *)qword_1002E6568;
          if (os_log_type_enabled((os_log_t)qword_1002E6568, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 141558274;
            uint64_t v44 = 1752392040LL;
            __int16 v45 = 2112;
            uint64_t v46 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "queryForUris: fetching rpc for uri %{mask.hash}@",  buf,  0x16u);
          }

          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
          uint64_t v23 = (id *)(v38 + 5);
          id v31 = (id)v38[5];
          id v24 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyRPCRequestBuilder buildQueryRequest:application:error:]( &OBJC_CLASS___TransparencyRPCRequestBuilder,  "buildQueryRequest:application:error:",  v15,  v22,  &v31));
          objc_storeStrong(v23, v31);

          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472LL;
          v30[2] = sub_100055B50;
          v30[3] = &unk_10027B818;
          v30[4] = v15;
          void v30[5] = &v37;
          -[KTContext fetchRPCSingleQuery:userInitiated:cachedYoungerThan:backgroundOpId:completionHandler:]( self,  "fetchRPCSingleQuery:userInitiated:cachedYoungerThan:backgroundOpId:completionHandler:",  v24,  v26,  v28,  v27,  v30);
        }
      }

      id v12 = [obj countByEnumeratingWithState:&v33 objects:v47 count:16];
    }

    while (v12);
  }

  v25[2](v25, v38[5]);
  _Block_object_dispose(&v37, 8);
}

- (void)queryForUris:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 completionHandler:(id)a6
{
}

- (void)optInStateForUri:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication addApplicationPrefixForIdentifier:uri:]( &OBJC_CLASS___TransparencyApplication,  "addApplicationPrefixForIdentifier:uri:",  v8,  v6));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  id v23 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyRPCRequestBuilder buildQueryRequest:application:error:]( &OBJC_CLASS___TransparencyRPCRequestBuilder,  "buildQueryRequest:application:error:",  v9,  v10,  &v23));
  id v12 = v23;

  if (v11)
  {
    if (qword_1002E6560 != -1) {
      dispatch_once(&qword_1002E6560, &stru_10027B858);
    }
    uint64_t v13 = (os_log_s *)qword_1002E6568;
    if (os_log_type_enabled((os_log_t)qword_1002E6568, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 141558274;
      *(void *)&uint8_t buf[4] = 1752392040LL;
      __int16 v25 = 2112;
      BOOL v26 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "optInStateForUri: querying KT server opt-in state for %{mask.hash}@",  buf,  0x16u);
    }

    *(void *)buf = 0LL;
    objc_initWeak((id *)buf, self);
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext logClient](self, "logClient"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000560FC;
    v18[3] = &unk_10027B908;
    objc_copyWeak(&v22, (id *)buf);
    id v21 = v7;
    id v19 = v11;
    id v16 = v14;
    id v20 = v16;
    [v15 fetchQuery:v19 uuid:v16 userInitiated:0 completionHandler:v18];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    if (qword_1002E6560 != -1) {
      dispatch_once(&qword_1002E6560, &stru_10027B838);
    }
    id v17 = (os_log_s *)qword_1002E6568;
    if (os_log_type_enabled((os_log_t)qword_1002E6568, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "optInStateForUri: failed to check opt-in, no query request: %@",  buf,  0xCu);
    }

    (*((void (**)(id, uint64_t, id))v7 + 2))(v7, 2LL, v12);
  }
}

+ (id)chunkArray:(id)a3 chunkSize:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (unint64_t)[v5 count] / a4 + 1));
    if ([v6 count])
    {
      uint64_t v8 = 0LL;
      unint64_t v9 = 0LL;
      do
      {
        id v10 = [v6 count];
        else {
          unint64_t v11 = (unint64_t)v10 + v8;
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", v9, v11));
        [v7 addObject:v12];

        v9 += a4;
        v8 -= a4;
      }

      while (v9 < (unint64_t)[v6 count]);
    }
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v13));
  }

  return v7;
}

- (BOOL)verifyInclusionProofDownload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_100065EC4;
  id v24 = sub_100065ED4;
  id v25 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  id v19 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100065EDC;
  v15[3] = &unk_10027C6C8;
  id v17 = &v26;
  id v18 = &v20;
  v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  unsigned __int8 v9 = [v7 performAndWaitForDownloadId:v8 error:&v19 block:v15];
  id v10 = v19;

  if ((v9 & 1) != 0)
  {
    if (a4)
    {
      unint64_t v11 = (void *)v21[5];
      if (v11) {
        *a4 = v11;
      }
    }

    BOOL v12 = *((_BYTE *)v27 + 24) != 0;
  }

  else
  {
    if (qword_1002E6580 != -1) {
      dispatch_once(&qword_1002E6580, &stru_10027C6E8);
    }
    uint64_t v13 = (os_log_s *)qword_1002E6588;
    if (os_log_type_enabled((os_log_t)qword_1002E6588, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "failed to fetch download record for downloadId %{public}@: %@",  buf,  0x16u);
    }

    BOOL v12 = 0;
    if (a4 && v10)
    {
      BOOL v12 = 0;
      *a4 = v10;
    }
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

- (BOOL)verifyInclusionProofDownloadRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___RevisionLogInclusionProofResponse);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 response]);
  unsigned __int8 v9 = -[TransparencyGPBMessage initWithData:error:](v7, "initWithData:error:", v8, a4);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 serverHint]);
  -[RevisionLogInclusionProofResponse setMetadataValue:key:]( v9,  "setMetadataValue:key:",  v10,  kTransparencyResponseMetadataKeyServerHint);

  if (!v9)
  {
    if (qword_1002E6580 != -1) {
      dispatch_once(&qword_1002E6580, &stru_10027C728);
    }
    BOOL v14 = (os_log_s *)qword_1002E6588;
    if (os_log_type_enabled((os_log_t)qword_1002E6588, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        id v15 = *a4;
      }
      else {
        id v15 = 0LL;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = (uint64_t)v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "response failed to parse: %@", buf, 0xCu);
    }

    goto LABEL_24;
  }

  if (-[RevisionLogInclusionProofResponse status](v9, "status") != 1)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorServer,  (int)-[RevisionLogInclusionProofResponse status](v9, "status"),  @"server failed to produce inclusion proof: %d",  -[RevisionLogInclusionProofResponse status](v9, "status")));
    id v17 = v16;
    if (a4 && v16) {
      *a4 = v16;
    }

    goto LABEL_24;
  }

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
  unsigned __int8 v12 = [v11 verifyRevisionLogInclusionProofResponse:v9 receivedRevisions:0 error:a4];

  if ((v12 & 1) == 0)
  {
    if (qword_1002E6580 != -1) {
      dispatch_once(&qword_1002E6580, &stru_10027C708);
    }
    id v18 = (os_log_s *)(id)qword_1002E6588;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
      uint64_t v20 = (void *)v19;
      if (a4) {
        id v21 = *a4;
      }
      else {
        id v21 = 0LL;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v19;
      __int16 v25 = 2112;
      id v26 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Inclusion proof response verification failed for %{public}@: %@",  buf,  0x16u);
    }

LABEL_24:
    BOOL v13 = 0;
    goto LABEL_25;
  }

  BOOL v13 = 1;
LABEL_25:

  return v13;
}

- (unint64_t)verifyConsistencyProofDownload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  uint64_t v29 = 2LL;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_100065EC4;
  uint64_t v24 = sub_100065ED4;
  id v25 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  id v19 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006683C;
  v15[3] = &unk_10027C6C8;
  id v17 = &v26;
  id v18 = &v20;
  v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  unsigned __int8 v9 = [v7 performAndWaitForDownloadId:v8 error:&v19 block:v15];
  id v10 = v19;

  if ((v9 & 1) != 0)
  {
    if (a4)
    {
      unint64_t v11 = (void *)v21[5];
      if (v11) {
        *a4 = v11;
      }
    }

    unint64_t v12 = v27[3];
  }

  else
  {
    if (qword_1002E6580 != -1) {
      dispatch_once(&qword_1002E6580, &stru_10027C7A8);
    }
    BOOL v13 = (os_log_s *)qword_1002E6588;
    if (os_log_type_enabled((os_log_t)qword_1002E6588, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "failed to fetch download record for downloadId %{public}@: %@",  buf,  0x16u);
    }

    unint64_t v12 = 0LL;
    if (a4 && v10)
    {
      unint64_t v12 = 0LL;
      *a4 = v10;
    }
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

- (unint64_t)verifyConsistencyProofDownloadRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___ConsistencyProofResponse);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 response]);
  unsigned __int8 v9 = -[TransparencyGPBMessage initWithData:error:](v7, "initWithData:error:", v8, a4);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 serverHint]);
  -[ConsistencyProofResponse setMetadataValue:key:]( v9,  "setMetadataValue:key:",  v10,  kTransparencyResponseMetadataKeyServerHint);

  if (v9)
  {
    if (-[ConsistencyProofResponse status](v9, "status") == 1)
    {
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
      id v12 = objc_msgSend( v11,  "verifyConsistencyProofResponse:startRevision:receivedRevisions:error:",  v9,  objc_msgSend(v6, "startSLHRevision"),  0,  a4);

      if (v12) {
        goto LABEL_27;
      }
      if (qword_1002E6580 != -1) {
        dispatch_once(&qword_1002E6580, &stru_10027C7C8);
      }
      BOOL v13 = (os_log_s *)(id)qword_1002E6588;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
        id v15 = (void *)v14;
        if (a4) {
          id v16 = *a4;
        }
        else {
          id v16 = 0LL;
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v14;
        __int16 v30 = 2112;
        id v31 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Consistency proof response verification failed for %{public}@: %@",  buf,  0x16u);
      }
    }

    else
    {
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorServer,  (int)-[ConsistencyProofResponse status](v9, "status"),  @"server failed to produce consistency proof: %d",  -[ConsistencyProofResponse status](v9, "status")));
      BOOL v13 = v19;
      if (a4 && v19) {
        *a4 = v19;
      }
      if (qword_1002E6580 != -1) {
        dispatch_once(&qword_1002E6580, &stru_10027C7E8);
      }
      uint64_t v20 = (void *)qword_1002E6588;
      if (os_log_type_enabled((os_log_t)qword_1002E6588, OS_LOG_TYPE_ERROR))
      {
        id v21 = v20;
        *(_DWORD *)buf = 67109120;
        LODWORD(v29) = -[ConsistencyProofResponse status](v9, "status");
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "server failed to produce consistency proof: %d",  buf,  8u);
      }
    }
  }

  else
  {
    if (qword_1002E6580 != -1) {
      dispatch_once(&qword_1002E6580, &stru_10027C808);
    }
    id v17 = (os_log_s *)qword_1002E6588;
    if (os_log_type_enabled((os_log_t)qword_1002E6588, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        id v18 = *a4;
      }
      else {
        id v18 = 0LL;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = (uint64_t)v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "response failed to parse: %@", buf, 0xCu);
    }
  }

  id v12 = 0LL;
LABEL_27:
  if (qword_1002E6580 != -1) {
    dispatch_once(&qword_1002E6580, &stru_10027C828);
  }
  uint64_t v22 = (void *)qword_1002E6588;
  if (os_log_type_enabled((os_log_t)qword_1002E6588, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = v22;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadId]);
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = (uint64_t)v24;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "deleting download record %{public}@",  buf,  0xCu);
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext logClient](self, "logClient"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadId]);
  [v25 deleteDownloadId:v26];

  return (unint64_t)v12;
}

- (id)retrieveTLTSTH:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  uint64_t v6 = kKTApplicationIdentifierTLT;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "latestConsistencyVerifiedTreeHeadSTH:logBeginMs:error:",  v6,  objc_msgSend(v7, "tltLogBeginningMs"),  a3));

  if (v8)
  {
    unsigned __int8 v9 = objc_alloc_init(&OBJC_CLASS___Gossip);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
    -[Gossip setVersion:](v9, "setVersion:", [v10 tltEarliestVersion]);

    -[Gossip setSth:](v9, "setSth:", v8);
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGPBMessage data](v9, "data"));
  }

  else
  {
    unint64_t v11 = 0LL;
  }

  return v11;
}

- (id)parseSTHData:(id)a3 error:(id *)a4
{
  return +[SignedObjectHolder parseFromData:error:](&OBJC_CLASS___SignedLogHead, "parseFromData:error:", a3, a4);
}

- (void)analyticsForDecodeFailure:(id)a3 error:(id)a4
{
  uint64_t v4 = kKTApplicationIdentifierTLT;
  id v5 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"GossipDecodeMessageFailure",  v4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  [v6 logResultForEvent:v7 hardFailure:1 result:v5];
}

- (void)analyticsForUnsupportedProtocol:(int)a3 expected:(int)a4 sth:(id)a5
{
  uint64_t v5 = kTransparencyErrorGossip;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported protocol version, message version %d, expected version: %d, sth: %@",  *(void *)&a3,  *(void *)&a4,  a5));
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  v5,  -276LL,  @"%@",  v6));

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"GossipUnsupportedProtocol",  kKTApplicationIdentifierTLT));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  [v8 logResultForEvent:v7 hardFailure:1 result:v9];
}

- (void)analyticsForParseFailure:(id)a3
{
  uint64_t v3 = kKTApplicationIdentifierTLT;
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"GossipParseFailure",  v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  [v5 logResultForEvent:v6 hardFailure:1 result:v4];
}

- (void)analyticsForPredateLogBeginningMs:(unint64_t)a3 expectedLogBeginningMS:(unint64_t)a4 sth:(id)a5
{
  uint64_t v5 = kTransparencyErrorGossip;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"STH predates our TLT's LogBeginningMs, gossiped loghead logBeginningMs %llu, expected logBeginningMs: %llu, sth: %@",  a3,  a4,  a5));
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  v5,  -277LL,  @"%@",  v6));

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"GossipOldLogBeginningMS",  kKTApplicationIdentifierTLT));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  [v8 logResultForEvent:v7 hardFailure:1 result:v9];
}

- (void)analyticsForTooNewLogBeginningMs:(unint64_t)a3 expectedLogBeginningMS:(unint64_t)a4 sth:(id)a5
{
  uint64_t v5 = kTransparencyErrorGossip;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Received gossip from a newer client.  Gossiped logBeginningsMs: %llu, client logBeginningsMs: %llu",  a4,  a5,  a3,  a4));
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  v5,  -279LL,  @"%@",  v6));

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"GossipLogBeginningMSTooNew",  kKTApplicationIdentifierTLT));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  [v8 logResultForEvent:v7 hardFailure:1 result:v9];
}

- (void)processSTHsFromPeers:(id)a3 verifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v81 = a4;
  id v80 = a5;
  unsigned __int8 v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v93 objects:v103 count:16];
  if (v10)
  {
    id v11 = v10;
    id v12 = 0LL;
    p_cache = (objc_class *)&OBJC_METACLASS___TransparencyGPBAnyRoot.cache;
    uint64_t v14 = *(void *)v94;
    int v89 = kTransparencyProtocolVersion;
    uint64_t v84 = kTransparencyErrorGossip;
    id v87 = v9;
    uint64_t v88 = *(void *)v94;
    while (1)
    {
      id v15 = 0LL;
      do
      {
        id v16 = v12;
        if (*(void *)v94 != v14) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void *)(*((void *)&v93 + 1) + 8LL * (void)v15);
        id v18 = objc_alloc(p_cache + 333);
        id v92 = v12;
        id v19 = [v18 initWithData:v17 error:&v92];
        id v12 = v92;

        if (v19) {
          BOOL v20 = v12 == 0LL;
        }
        else {
          BOOL v20 = 0;
        }
        if (v20)
        {
          if ((int)[v19 version] <= v89)
          {
            signed int v28 = [v19 version];
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
            signed int v30 = [v29 tltEarliestVersion];

            if (v28 >= v30)
            {
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v19 sth]);
              id v91 = 0LL;
              id v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext parseSTHData:error:](self, "parseSTHData:error:", v41, &v91));
              id v43 = v91;

              if (v42 && !v43)
              {
                uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v42 parsedLogHead]);
                __int16 v45 = v44;
                if (v44)
                {
                  id v46 = [v44 logBeginningMs];
                  id v47 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
                  id v48 = [v47 tltLogBeginningMs];

                  if (v46 < v48)
                  {
                    if (qword_1002E6580 != -1) {
                      dispatch_once(&qword_1002E6580, &stru_10027C8E8);
                    }
                    id v85 = v42;
                    uint64_t v49 = (void *)qword_1002E6588;
                    if (os_log_type_enabled((os_log_t)qword_1002E6588, OS_LOG_TYPE_ERROR))
                    {
                      id v50 = v49;
                      id v83 = [v45 logBeginningMs];
                      id v51 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
                      id v52 = [v51 tltLogBeginningMs];
                      id v53 = (void *)objc_claimAutoreleasedReturnValue([v19 sth]);
                      *(_DWORD *)buf = 134218498;
                      *(void *)v98 = v83;
                      *(_WORD *)&v98[8] = 2048;
                      *(void *)id v99 = v52;
                      *(_WORD *)&v99[8] = 2112;
                      v100 = v53;
                      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "STH predates our TLT's LogBeginningMs, gossiped loghead logBeginningMs %llu, expected logBeginni ngMs: %llu, sth: %@",  buf,  0x20u);
                    }

                    id v54 = [v45 logBeginningMs];
                    id v55 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
                    id v56 = [v55 tltLogBeginningMs];
                    BOOL v57 = v45;
                    id v58 = (void *)objc_claimAutoreleasedReturnValue([v19 sth]);
                    -[KTContext analyticsForPredateLogBeginningMs:expectedLogBeginningMS:sth:]( self,  "analyticsForPredateLogBeginningMs:expectedLogBeginningMS:sth:",  v54,  v56,  v58);

                    __int16 v45 = v57;
                    id v43 = 0LL;
                    id v9 = v87;
                    p_cache = (objc_class *)(&OBJC_METACLASS___TransparencyGPBAnyRoot + 16);
                    id v42 = v85;
LABEL_54:

LABEL_55:
                    uint64_t v14 = v88;
                    goto LABEL_56;
                  }

                  id v86 = v45;
                  id v62 = [v45 logBeginningMs];
                  __int128 v63 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
                  id v64 = [v63 tltLogBeginningMs];

                  if (v62 <= v64)
                  {
                    id v76 = (void *)objc_claimAutoreleasedReturnValue([v19 sth]);
                    [v82 addObject:v76];

                    id v43 = 0LL;
                    id v9 = v87;
                    p_cache = (objc_class *)(&OBJC_METACLASS___TransparencyGPBAnyRoot + 16);
                    __int16 v45 = v86;
                    goto LABEL_54;
                  }

                  if (qword_1002E6580 != -1) {
                    dispatch_once(&qword_1002E6580, &stru_10027C908);
                  }
                  id v65 = (void *)qword_1002E6588;
                  if (os_log_type_enabled((os_log_t)qword_1002E6588, OS_LOG_TYPE_INFO))
                  {
                    __int16 v66 = v65;
                    id v67 = [v86 logBeginningMs];
                    id v68 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
                    id v69 = [v68 tltLogBeginningMs];
                    *(_DWORD *)buf = 134218240;
                    *(void *)v98 = v67;
                    *(_WORD *)&v98[8] = 2048;
                    *(void *)id v99 = v69;
                    _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_INFO,  "Received gossip from a newer client.  Gossiped logBeginningsMs: %llu, client logBeginningsMs: %llu",  buf,  0x16u);
                  }

                  id v70 = [v86 logBeginningMs];
                  id v71 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
                  id v72 = [v71 tltLogBeginningMs];
                  id v73 = (void *)objc_claimAutoreleasedReturnValue([v19 sth]);
                  -[KTContext analyticsForTooNewLogBeginningMs:expectedLogBeginningMS:sth:]( self,  "analyticsForTooNewLogBeginningMs:expectedLogBeginningMS:sth:",  v70,  v72,  v73);

                  BOOL v74 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext verifier](self, "verifier"));
                  id v75 = (void *)objc_claimAutoreleasedReturnValue([v42 signedObject]);
                  [v74 checkHeadEpoch:v75];

                  __int16 v45 = v86;
                  id v43 = 0LL;
                }

                else
                {
                  if (qword_1002E6580 != -1) {
                    dispatch_once(&qword_1002E6580, &stru_10027C8C8);
                  }
                  __int128 v60 = (os_log_s *)qword_1002E6588;
                  if (os_log_type_enabled((os_log_t)qword_1002E6588, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)v98 = 0LL;
                    _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "Failed to parse gossiped sth loghead: %@",  buf,  0xCu);
                  }

                  NSErrorUserInfoKey v101 = NSLocalizedDescriptionKey;
                  v102 = @"Failed to parse gossiped sth loghead";
                  __int128 v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v102,  &v101,  1LL));
                  id v43 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v84,  -278LL,  v61));

                  -[KTContext analyticsForParseFailure:](self, "analyticsForParseFailure:", v43);
                }

                id v9 = v87;
                p_cache = (objc_class *)(&OBJC_METACLASS___TransparencyGPBAnyRoot + 16);
                goto LABEL_54;
              }

              if (qword_1002E6580 != -1) {
                dispatch_once(&qword_1002E6580, &stru_10027C8A8);
              }
              __int128 v59 = (os_log_s *)qword_1002E6588;
              if (os_log_type_enabled((os_log_t)qword_1002E6588, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v98 = v43;
                _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_ERROR,  "Failed to parse gossiped sth signedLogHead: %@",  buf,  0xCu);
              }

              -[KTContext analyticsForParseFailure:](self, "analyticsForParseFailure:", v43);
              goto LABEL_55;
            }

            if (qword_1002E6580 != -1) {
              dispatch_once(&qword_1002E6580, &stru_10027C888);
            }
            uint64_t v14 = v88;
            id v31 = (void *)qword_1002E6588;
            if (os_log_type_enabled((os_log_t)qword_1002E6588, OS_LOG_TYPE_ERROR))
            {
              __int16 v32 = v31;
              unsigned int v33 = [v19 version];
              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
              unsigned int v35 = [v34 tltEarliestVersion];
              __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v19 sth]);
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v98 = v33;
              *(_WORD *)&v98[4] = 1024;
              *(_DWORD *)&v98[6] = v35;
              *(_WORD *)id v99 = 2112;
              *(void *)&v99[2] = v36;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Unsupported protocol version, message version %d, expected version: %d, sth: %@",  buf,  0x18u);

              uint64_t v14 = v88;
            }

            id v37 = [v19 version];
            unsigned __int8 v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationKeyStore](self, "applicationKeyStore"));
            id v39 = [v38 tltEarliestVersion];
            id v40 = (void *)objc_claimAutoreleasedReturnValue([v19 sth]);
            -[KTContext analyticsForUnsupportedProtocol:expected:sth:]( self,  "analyticsForUnsupportedProtocol:expected:sth:",  v37,  v39,  v40);

            id v9 = v87;
            p_cache = (objc_class *)(&OBJC_METACLASS___TransparencyGPBAnyRoot + 16);
          }

          else
          {
            if (qword_1002E6580 != -1) {
              dispatch_once(&qword_1002E6580, &stru_10027C868);
            }
            uint64_t v22 = (void *)qword_1002E6588;
            if (os_log_type_enabled((os_log_t)qword_1002E6588, OS_LOG_TYPE_ERROR))
            {
              id v23 = v22;
              unsigned int v24 = [v19 version];
              id v25 = (void *)objc_claimAutoreleasedReturnValue([v19 sth]);
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v98 = v24;
              *(_WORD *)&v98[4] = 1024;
              *(_DWORD *)&v98[6] = v89;
              *(_WORD *)id v99 = 2112;
              *(void *)&v99[2] = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Unsupported protocol version, message version %d, expected version: %d, sth: %@",  buf,  0x18u);

              uint64_t v14 = v88;
            }

            id v26 = [v19 version];
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v19 sth]);
            -[KTContext analyticsForUnsupportedProtocol:expected:sth:]( self,  "analyticsForUnsupportedProtocol:expected:sth:",  v26,  v89,  v27);
          }
        }

        else
        {
          if (qword_1002E6580 != -1) {
            dispatch_once(&qword_1002E6580, &stru_10027C848);
          }
          id v21 = (os_log_s *)qword_1002E6588;
          if (os_log_type_enabled((os_log_t)qword_1002E6588, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v98 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to inflate Gossip message %@",  buf,  0xCu);
          }

          -[KTContext analyticsForDecodeFailure:error:](self, "analyticsForDecodeFailure:error:", v19, v12);
        }

- (void)writeResult:(id)a3 verification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 succeed] == (id)2)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 idsResponseTime]);
    [v8 timeIntervalSinceNow];
    double v10 = v9;
    double v11 = (double)kKTMaximumMergeDelayMs / -1000.0;

    if (v10 < v11) {
      [v6 setSucceed:0];
    }
  }

  objc_msgSend(v7, "setUnsigned:value:", "verificationResult", objc_msgSend(v6, "succeed"));
  if ([v6 succeed] != (id)2)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 loggableDatas]);

    if (v12)
    {
      BOOL v13 = objc_alloc(&OBJC_CLASS___KTLoggableDataArray);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 loggableDatas]);
      id v15 = -[KTLoggableDataArray initWithLoggableDatas:](v13, "initWithLoggableDatas:", v14);
      [v7 setServerLoggableDatas:v15];
    }

    objc_msgSend(v7, "setOptedIn:", objc_msgSend(v6, "optedIn"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 failure]);
    [v7 setFailure:v16];

    objc_msgSend(v7, "setUnsigned:value:", "staticKeyStatus", objc_msgSend(v6, "staticAccountKeyStatus"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 peerState]);
    [v17 setEverCompletedVerification:1];
    if ([v6 optInTernaryState] != (id)2) {
      objc_msgSend(v17, "setOptedIn:", objc_msgSend(v6, "optedIn"));
    }
    if ([v6 optInTernaryState] == (id)1)
    {
      [v17 setEverOptedIn:1];
    }

    if ([v17 setCompletedVerification:v7])
    {
      if (qword_1002E6590 != -1) {
        dispatch_once(&qword_1002E6590, &stru_10027C928);
      }
      id v18 = (void *)qword_1002E6598;
      if (os_log_type_enabled((os_log_t)qword_1002E6598, OS_LOG_TYPE_INFO))
      {
        id v19 = v18;
        BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v6 uri]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 application]);
        *(_DWORD *)buf = 138412546;
        unsigned int v35 = v20;
        __int16 v36 = 2112;
        id v37 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Updated cached verifications for uri: %@ application: %@",  buf,  0x16u);
      }

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext contextStore](self, "contextStore"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 uri]);
      unsigned int v33 = v23;
      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 application]);
      [v22 handlePeerStateChange:v24 application:v25];
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    id v32 = 0LL;
    unsigned __int8 v27 = [v26 persistWithError:&v32];
    id v28 = v32;

    if ((v27 & 1) == 0)
    {
      if (qword_1002E6590 != -1) {
        dispatch_once(&qword_1002E6590, &stru_10027C948);
      }
      uint64_t v29 = (void *)qword_1002E6598;
      if (os_log_type_enabled((os_log_t)qword_1002E6598, OS_LOG_TYPE_ERROR))
      {
        signed int v30 = v29;
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v7 verificationId]);
        *(_DWORD *)buf = 138543618;
        unsigned int v35 = v31;
        __int16 v36 = 2112;
        id v37 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "failed to persist IDSKTVerification results for id %{public}@: %@",  buf,  0x16u);
      }
    }
  }
}

- (void)validatePeerIDSKTVerification:(id)a3 singleQuery:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v39 = (void (**)(id, void))a5;
  uint64_t v53 = 0LL;
  id v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  id v56 = sub_100068B88;
  BOOL v57 = sub_100068B98;
  id v58 = 0LL;
  id v58 = (id)objc_claimAutoreleasedReturnValue([v8 serverLoggableDatas]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([(id)v54[5] loggableDatas]);
  id v11 = +[KTLoggableData isAccountKTCapable:](&OBJC_CLASS___KTLoggableData, "isAccountKTCapable:", v10);

  id v52 = 0LL;
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v9 getQueryRequest:&v52]);
  id v12 = v52;
  id v51 = v12;
  id v40 = (void *)objc_claimAutoreleasedReturnValue([v9 getQueryResponse:&v51]);
  id v13 = v51;

  if (v41 && v40)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext optInServer](self, "optInServer"));
    id v50 = 0LL;
    unsigned __int8 v38 = (void *)objc_claimAutoreleasedReturnValue([v14 getAggregateOptInState:&v50]);
    id v15 = (KTVerifierResult *)v50;

    if (v38)
    {
      if ([v38 state] == (id)1) {
        uint64_t v16 = 5LL;
      }
      else {
        uint64_t v16 = 4LL;
      }
    }

    else
    {
      if (qword_1002E6590 != -1) {
        dispatch_once(&qword_1002E6590, &stru_10027C968);
      }
      uint64_t v22 = (os_log_s *)qword_1002E6598;
      if (os_log_type_enabled((os_log_t)qword_1002E6598, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "getAggregateOptInState: %@",  (uint8_t *)&buf,  0xCu);
      }

      uint64_t v16 = 4LL;
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v60 = 0x3032000000LL;
    __int128 v61 = sub_100068B88;
    id v62 = sub_100068B98;
    id v63 = 0LL;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v9 responseTime]);
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v8 verificationId]);
    id v49 = v13;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    void v42[2] = sub_100068BD0;
    v42[3] = &unk_10027CA10;
    p___int128 buf = &buf;
    id v25 = v8;
    id v43 = v25;
    uint64_t v44 = self;
    id v47 = &v53;
    uint64_t v48 = v16;
    id v45 = v40;
    unint64_t v26 = -[KTContext handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:]( self,  "handleQueryResponse:queryRequest:receiptDate:fetchId:validateType:ktCapable:error:transparentDataHandler:",  v45,  v41,  v23,  v24,  v16,  v11,  &v49,  v42);
    id v27 = v49;

    id v13 = v27;
    uint64_t v28 = *(void *)(*((void *)&buf + 1) + 40LL);
    if (v28) {
      goto LABEL_22;
    }
    if (!v26)
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
      signed int v30 = (void *)objc_claimAutoreleasedReturnValue([v9 rpcId]);
      [v29 failRpcId:v30 failure:v13 error:0];
    }

    id v31 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
    if ([v31 isEqual:kTransparencyErrorServer])
    {
      BOOL v32 = [v13 code] == (id)7;

      if (v32) {
        goto LABEL_21;
      }
    }

    else
    {
    }

    unint64_t v26 = 2LL;
LABEL_21:
    unsigned int v33 = objc_alloc(&OBJC_CLASS___KTVerifierResult);
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v25 uri]);
    unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue([v25 application]);
    __int16 v36 = -[KTVerifierResult initWithUri:application:ktResult:failure:]( v33,  "initWithUri:application:ktResult:failure:",  v34,  v35,  v26,  v13);
    id v37 = *(void **)(*((void *)&buf + 1) + 40LL);
    *(void *)(*((void *)&buf + 1) + 40LL) = v36;

    uint64_t v28 = *(void *)(*((void *)&buf + 1) + 40LL);
LABEL_22:
    -[KTContext writeResult:verification:](self, "writeResult:verification:", v28, v25);
    v39[2](v39, *(void *)(*((void *)&buf + 1) + 40LL));

    _Block_object_dispose(&buf, 8);
    goto LABEL_23;
  }

  uint64_t v17 = objc_alloc(&OBJC_CLASS___KTVerifierResult);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 uri]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 application]);
  id v15 = -[KTVerifierResult initWithUri:application:ktResult:failure:]( v17,  "initWithUri:application:ktResult:failure:",  v18,  v19,  2LL,  v13);

  -[KTContext writeResult:verification:](self, "writeResult:verification:", v15, v8);
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 rpcId]);
  [v20 failRpcId:v21 failure:v13 error:0];

  ((void (**)(id, KTVerifierResult *))v39)[2](v39, v15);
LABEL_23:

  _Block_object_dispose(&v53, 8);
}

- (void)validatePeerIDSKTVerification:(id)a3 batchQuery:(id)a4 completionBlock:(id)a5
{
  id v7 = (void (**)(id, id))a5;
  id v8 = a3;
  id v9 = NSStringFromSelector(a2);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError unimplementedError:](&OBJC_CLASS___TransparencyError, "unimplementedError:", v10));

  id v11 = objc_alloc(&OBJC_CLASS___KTVerifierResult);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 uri]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 application]);

  uint64_t v14 = -[KTVerifierResult initWithUri:application:failure:](v11, "initWithUri:application:failure:", v12, v13, v15);
  v7[2](v7, v14);
}

- (void)validatePeerIDSKTVerification:(id)a3 serverRPC:(id)a4 completionBlock:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  if ([v8 rpcType])
  {
    if ([v8 rpcType] == (id)1)
    {
      -[KTContext validatePeerIDSKTVerification:batchQuery:completionBlock:]( self,  "validatePeerIDSKTVerification:batchQuery:completionBlock:",  v15,  v8,  v9);
    }

    else
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -340,  @"unknown server rpc type: %lld",  [v8 rpcType]));
      id v11 = objc_alloc(&OBJC_CLASS___KTVerifierResult);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v15 uri]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v15 application]);
      uint64_t v14 = -[KTVerifierResult initWithUri:application:failure:](v11, "initWithUri:application:failure:", v12, v13, v10);
      v9[2](v9, v14);
    }
  }

  else
  {
    -[KTContext validatePeerIDSKTVerification:singleQuery:completionBlock:]( self,  "validatePeerIDSKTVerification:singleQuery:completionBlock:",  v15,  v8,  v9);
  }
}

- (void)validatePeer:(id)a3 verificationInfo:(id)a4 fetchNow:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
  id v37 = 0LL;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( [v13 fetchOrCreateVerification:v10 application:v14 verificationInfo:v12 fetchNow:v7 error:&v37]);

  id v16 = v37;
  if (v15)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    id v36 = v16;
    uint64_t v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472LL;
    signed int v30 = sub_100069668;
    id v31 = &unk_10027CB08;
    BOOL v32 = v15;
    id v18 = v10;
    id v33 = v18;
    __int128 v34 = self;
    id v19 = v11;
    id v35 = v19;
    unsigned __int8 v20 = [v17 performAndWaitForVerificationId:v32 error:&v36 block:&v28];
    id v21 = v36;

    if ((v20 & 1) == 0)
    {
      uint64_t v22 = objc_alloc(&OBJC_CLASS___KTVerifierResult);
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID", v28, v29, v30, v31));
      unsigned int v24 = -[KTVerifierResult initWithUri:application:failure:](v22, "initWithUri:application:failure:", v18, v23, v21);

      (*((void (**)(id, KTVerifierResult *, void))v19 + 2))(v19, v24, 0LL);
    }

    id v25 = v32;
  }

  else
  {
    unint64_t v26 = objc_alloc(&OBJC_CLASS___KTVerifierResult);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
    id v25 = -[KTVerifierResult initWithUri:application:failure:](v26, "initWithUri:application:failure:", v10, v27, v16);

    (*((void (**)(id, KTVerifierResult *, void))v11 + 2))(v11, v25, 0LL);
    id v21 = v16;
  }
}

- (void)validatePeers:(id)a3 fetchNow:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v22 = a3;
  id v18 = (void (**)(id, void))a5;
  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v39 = 0LL;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  id v42 = sub_100068B88;
  id v43 = sub_100068B98;
  id v44 = 0LL;
  id v44 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v22 count]));
  uint64_t v33 = 0LL;
  __int128 v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  id v36 = sub_100068B88;
  id v37 = sub_100068B98;
  id v38 = 0LL;
  id v38 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v22 count]));
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v22 keyEnumerator]);
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v11]);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_10006A21C;
        v23[3] = &unk_10027CB50;
        id v27 = &v39;
        id v24 = v20;
        uint64_t v25 = v11;
        uint64_t v28 = &v33;
        id v26 = v21;
        -[KTContext validatePeer:verificationInfo:fetchNow:completionBlock:]( self,  "validatePeer:verificationInfo:fetchNow:completionBlock:",  v11,  v12,  v6,  v23);
      }

      id v8 = [v7 countByEnumeratingWithState:&v29 objects:v51 count:16];
    }

    while (v8);
  }

  if (qword_1002E6590 != -1) {
    dispatch_once(&qword_1002E6590, &stru_10027CB70);
  }
  id v13 = (os_log_s *)(id)qword_1002E6598;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v20 count];
    id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "componentsJoinedByString:", @", "));
    uint64_t v16 = v40[5];
    *(_DWORD *)__int128 buf = 134218498;
    id v46 = v14;
    __int16 v47 = 2112;
    uint64_t v48 = v15;
    __int16 v49 = 2112;
    uint64_t v50 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "validatePeers: returning %lu results for %@: %@",  buf,  0x20u);
  }

  v18[2](v18, v40[5]);
  if ([(id)v34[5] count])
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
    [v17 updateIDSCacheWithResults:v34[5]];
  }

  if ([v21 count]) {
    -[KTContext queryForUris:userInitiated:cachedYoungerThan:completionHandler:]( self,  "queryForUris:userInitiated:cachedYoungerThan:completionHandler:",  v21,  1LL,  0LL,  &stru_10027CB90);
  }
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
}

- (void)validatePendingPeersForSingleQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 uri]);
  if (v5)
  {
    BOOL v6 = (void *)v5;
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 responseTime]);

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext applicationID](self, "applicationID"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 uri]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 responseTime]);
      id v28 = 0LL;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10006A864;
      v25[3] = &unk_100276550;
      id v12 = v4;
      id v26 = v12;
      id v27 = self;
      unsigned __int8 v13 = [v8 performForPendingVerfications:v9 uri:v10 responseOlderThan:v11 error:&v28 batchSize:20 block:v25];
      id v14 = (os_log_s *)v28;

      if ((v13 & 1) != 0 || !v14)
      {
        if ((v13 & 1) != 0) {
          goto LABEL_19;
        }
        if (qword_1002E6590 != -1) {
          dispatch_once(&qword_1002E6590, &stru_10027CC78);
        }
        id v24 = (void *)qword_1002E6598;
        if (!os_log_type_enabled((os_log_t)qword_1002E6598, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_19;
        }
        uint64_t v16 = v24;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 rpcId]);
        *(_DWORD *)__int128 buf = 138543362;
        __int128 v30 = v17;
        id v18 = "no pending IDSKTVerifications found for rpcId %{public}@";
        id v19 = v16;
        os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
        uint32_t v21 = 12;
      }

      else
      {
        if (qword_1002E6590 != -1) {
          dispatch_once(&qword_1002E6590, &stru_10027CC58);
        }
        id v15 = (void *)qword_1002E6598;
        if (!os_log_type_enabled((os_log_t)qword_1002E6598, OS_LOG_TYPE_ERROR)) {
          goto LABEL_19;
        }
        uint64_t v16 = v15;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 rpcId]);
        *(_DWORD *)__int128 buf = 138543618;
        __int128 v30 = v17;
        __int16 v31 = 2112;
        __int128 v32 = v14;
        id v18 = "no pending IDSKTVerifications found for rpcId %{public}@: %@";
        id v19 = v16;
        os_log_type_t v20 = OS_LOG_TYPE_ERROR;
        uint32_t v21 = 22;
      }

      _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, v21);

LABEL_19:
      goto LABEL_20;
    }
  }

  if (qword_1002E6590 != -1) {
    dispatch_once(&qword_1002E6590, &stru_10027CBD0);
  }
  id v22 = (void *)qword_1002E6598;
  if (os_log_type_enabled((os_log_t)qword_1002E6598, OS_LOG_TYPE_ERROR))
  {
    id v14 = v22;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 rpcId]);
    *(_DWORD *)__int128 buf = 138543362;
    __int128 v30 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "rpcId %{public}@ missing uri or response time",  buf,  0xCu);

LABEL_20:
  }
}

- (void)validatePendingPeersForBatchQuery:(id)a3
{
  id v3 = a3;
  if (qword_1002E6590 != -1) {
    dispatch_once(&qword_1002E6590, &stru_10027CC98);
  }
  id v4 = (os_log_s *)qword_1002E6598;
  if (os_log_type_enabled((os_log_t)qword_1002E6598, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "validatePendingPeersForBatchQuery: batch query is unimplemented",  v5,  2u);
  }
}

- (void)validatePendingPeersForRpcId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContext dataStore](self, "dataStore"));
  v9[4] = self;
  id v10 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006AF20;
  v9[3] = &unk_1002765F8;
  unsigned __int8 v6 = [v5 performAndWaitForRpcId:v4 error:&v10 block:v9];
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    if (qword_1002E6590 != -1) {
      dispatch_once(&qword_1002E6590, &stru_10027CCD8);
    }
    id v8 = (os_log_s *)qword_1002E6598;
    if (os_log_type_enabled((os_log_t)qword_1002E6598, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138543618;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "failed to find rpc for rpcId %{public}@: %@",  buf,  0x16u);
    }
  }
}

@end