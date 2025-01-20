@interface SUControllerPolicyEngine
+ (id)_generateStateTable;
+ (id)scanContentControlName:(int64_t)a3;
+ (int64_t)extendedManagerStateFromPolicyState:(int64_t)a3;
+ (int64_t)limitedManagerStateFromPolicyState:(int64_t)a3;
- (BOOL)activateLoadingPersisted;
- (BOOL)failedForward;
- (BOOL)haveNotifiedApplied;
- (BOOL)haveNotifiedPrepared;
- (BOOL)haveReportedOTADownloaded;
- (BOOL)isLoadedValidMatch:(id)a3 suAssets:(id)a4;
- (BOOL)loadedApplied;
- (BOOL)loadedPrepared;
- (BOOL)perservedScanRampingForeground;
- (BOOL)removeScanContent;
- (BOOL)removingSUContent;
- (BOOL)removingScanContent;
- (BOOL)updateAcceptingTerms;
- (NSData)personalizeSSOToken;
- (NSDictionary)stateTable;
- (NSError)updateAttemptFailureError;
- (NSMutableArray)pendingPurgeComplete;
- (NSString)abandonWhenApplyingReason;
- (NSString)loadedSUAssetID;
- (NSString)policyName;
- (NSString)preservedScanBaseUUID;
- (NSString)updateUUID;
- (NSUUID)installWaitUUID;
- (SUAutoInstallManager)autoInstallManager;
- (SUControllerAttachedClients)attachedClients;
- (SUControllerConfig)updateConfig;
- (SUControllerPolicyEngine)initWithAttachedClients:(id)a3 withConfig:(id)a4 withAutoInstallManager:(id)a5;
- (SUControllerPolicyParam)abandonWhenApplyingPolicyParam;
- (SUControllerPolicyPersistedState)loadedState;
- (SUControllerPolicyPersistedState)state;
- (SUControllerScanOptions)scanOptions;
- (SUCoreDescriptor)activeDescriptor;
- (SUCoreDescriptor)foundPrimaryDescriptor;
- (SUCoreDescriptor)foundSecondaryDescriptor;
- (SUCoreDescriptor)primaryDescriptor;
- (SUCoreDescriptor)secondaryDescriptor;
- (SUCoreDescriptor)updateAttemptFailureDescriptor;
- (SUCoreFSM)policyFSM;
- (SUCoreLog)policyLogCategory;
- (SUCorePersistedState)corePersisted;
- (SUCorePolicy)activeScanPolicy;
- (SUCorePolicy)foundScanPolicy;
- (SUCorePolicy)updatePolicy;
- (SUCoreProgress)lastReportedApplyProgress;
- (SUCoreProgress)lastReportedProgress;
- (SUCoreUpdate)updateControl;
- (id)activeDescriptor:(id)a3 potentiallyInactive:(BOOL)a4;
- (id)controllerDescriptorFromActiveDescriptor:(id)a3;
- (id)initiallyTargertedDescriptor;
- (id)summary;
- (id)updateInfoLogString;
- (id)updateUUIDLogString;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)action_ActivatedReportPrepared:(id)a3 error:(id *)a4;
- (int64_t)action_ActivatedReportRemoved:(id)a3 error:(id *)a4;
- (int64_t)action_ActivatedReportWaitAuto:(id)a3 error:(id *)a4;
- (int64_t)action_AdoptDocCancelUpdate:(id)a3 error:(id *)a4;
- (int64_t)action_AdoptLatestFound:(id)a3 error:(id *)a4;
- (int64_t)action_AnomalyScanBeforeActivated:(id)a3 error:(id *)a4;
- (int64_t)action_ApplyFailedDecideByMode:(id)a3 error:(id *)a4;
- (int64_t)action_ApplyFailedRemoveAll:(id)a3 error:(id *)a4;
- (int64_t)action_AttemptFailedClearFound:(id)a3 error:(id *)a4;
- (int64_t)action_AttemptFailedRemoveAll:(id)a3 error:(id *)a4;
- (int64_t)action_AttemptFailedSetFound:(id)a3 error:(id *)a4;
- (int64_t)action_AttemptFailedSetFoundImmediate:(id)a3 error:(id *)a4;
- (int64_t)action_AttemptFailedTrackPurge:(id)a3 error:(id *)a4;
- (int64_t)action_CancelUpdate:(id)a3 error:(id *)a4;
- (int64_t)action_CancelUpdateStopAutoTrackPurge:(id)a3 error:(id *)a4;
- (int64_t)action_CancelUpdateTrackPurge:(id)a3 error:(id *)a4;
- (int64_t)action_CheckAssets:(id)a3 error:(id *)a4;
- (int64_t)action_CheckPrepare:(id)a3 error:(id *)a4;
- (int64_t)action_ClearFound:(id)a3 error:(id *)a4;
- (int64_t)action_ClearFoundCancelStopAuto:(id)a3 error:(id *)a4;
- (int64_t)action_ClearFoundCancelUpdate:(id)a3 error:(id *)a4;
- (int64_t)action_ClearFoundTrackPurge:(id)a3 error:(id *)a4;
- (int64_t)action_CreateFoundTargetPrepared:(id)a3 error:(id *)a4;
- (int64_t)action_CreateImmediateTargetInstalled:(id)a3 error:(id *)a4;
- (int64_t)action_DecideAdoptLatestFound:(id)a3 error:(id *)a4;
- (int64_t)action_DecideAutoFired:(id)a3 error:(id *)a4;
- (int64_t)action_DecideFallbackToSecondary:(id)a3 error:(id *)a4;
- (int64_t)action_DecidePrepareUpdate:(id)a3 error:(id *)a4;
- (int64_t)action_DecideTermsAccepted:(id)a3 error:(id *)a4;
- (int64_t)action_ImmediateTargetInstalled:(id)a3 error:(id *)a4;
- (int64_t)action_LogExpiredDecideWaitAuto:(id)a3 error:(id *)a4;
- (int64_t)action_LogInstallAwaitingReboot:(id)a3 error:(id *)a4;
- (int64_t)action_LogInstallCanceling:(id)a3 error:(id *)a4;
- (int64_t)action_LogInstallFailedActivating:(id)a3 error:(id *)a4;
- (int64_t)action_LogInstallFailedNoUpdate:(id)a3 error:(id *)a4;
- (int64_t)action_LogRemoveAwaitingReboot:(id)a3 error:(id *)a4;
- (int64_t)action_PersistScanState:(id)a3 error:(id *)a4;
- (int64_t)action_PreparedDecideByMode:(id)a3 error:(id *)a4;
- (int64_t)action_PreservedTargetPrepared:(id)a3 error:(id *)a4;
- (int64_t)action_ReloadDescriptors:(id)a3 error:(id *)a4;
- (int64_t)action_RemoveAll:(id)a3 error:(id *)a4;
- (int64_t)action_RemoveAllIncludingDoc:(id)a3 error:(id *)a4;
- (int64_t)action_RemoveAllPreservingScanState:(id)a3 error:(id *)a4;
- (int64_t)action_RemoveAllTrackPurge:(id)a3 error:(id *)a4;
- (int64_t)action_RemovePreserving:(id)a3 error:(id *)a4;
- (int64_t)action_ReportApplyFailed:(id)a3 error:(id *)a4;
- (int64_t)action_ReportApplyFailedRemoveAll:(id)a3 error:(id *)a4;
- (int64_t)action_ReportApplyFailedWaitAuto:(id)a3 error:(id *)a4;
- (int64_t)action_ReportApplyProgress:(id)a3 error:(id *)a4;
- (int64_t)action_ReportAwaitingReboot:(id)a3 error:(id *)a4;
- (int64_t)action_ReportPrepared:(id)a3 error:(id *)a4;
- (int64_t)action_ReportUpdateProgress:(id)a3 error:(id *)a4;
- (int64_t)action_ReportVerifyFailed:(id)a3 error:(id *)a4;
- (int64_t)action_ReportVerifyFailedWaitAuto:(id)a3 error:(id *)a4;
- (int64_t)action_ReportWaitAuto:(id)a3 error:(id *)a4;
- (int64_t)action_RequestIgnoredNoUpdate:(id)a3 error:(id *)a4;
- (int64_t)action_ResumeTargetPrepared:(id)a3 error:(id *)a4;
- (int64_t)action_ResumedDecideByMode:(id)a3 error:(id *)a4;
- (int64_t)action_SUContentPurgedDecideNewer:(id)a3 error:(id *)a4;
- (int64_t)action_SUContentPurgedDecideRemoved:(id)a3 error:(id *)a4;
- (int64_t)action_ScanPurgedDecideNewer:(id)a3 error:(id *)a4;
- (int64_t)action_ScanPurgedDecideRemoved:(id)a3 error:(id *)a4;
- (int64_t)action_SecondaryTargetMaintain:(id)a3 error:(id *)a4;
- (int64_t)action_SetFound:(id)a3 error:(id *)a4;
- (int64_t)action_SetFoundCancelImmediate:(id)a3 error:(id *)a4;
- (int64_t)action_SetFoundCancelStopAuto:(id)a3 error:(id *)a4;
- (int64_t)action_SetFoundCancelStopImmediate:(id)a3 error:(id *)a4;
- (int64_t)action_SetFoundCancelUpdate:(id)a3 error:(id *)a4;
- (int64_t)action_SetFoundCollectDoc:(id)a3 error:(id *)a4;
- (int64_t)action_SetFoundImmediate:(id)a3 error:(id *)a4;
- (int64_t)action_StopAuto:(id)a3 error:(id *)a4;
- (int64_t)action_StopImmediateTargetInstalled:(id)a3 error:(id *)a4;
- (int64_t)action_TargetInstalled:(id)a3 error:(id *)a4;
- (int64_t)action_TrackPurge:(id)a3 error:(id *)a4;
- (int64_t)action_UseCredentialsToPersonalize:(id)a3 error:(id *)a4;
- (int64_t)action_UserAcceptedTerms:(id)a3 error:(id *)a4;
- (int64_t)action_VerifyLatest:(id)a3 error:(id *)a4;
- (int64_t)action_VerifyLatestStopAuto:(id)a3 error:(id *)a4;
- (int64_t)lastNotifiedState;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (int64_t)scanContentControl;
- (int64_t)updateCurrentPhase;
- (int64_t)updateTarget;
- (void)_policyAnomaly:(id)a3;
- (void)abandonWhenApplying:(id)a3 reportingStatus:(id)a4 abandonError:(id)a5 settingFound:(id)a6;
- (void)acceptPreservedState:(id)a3 loadedPrimaryDescriptor:(id)a4 loadedSecondaryDescriptor:(id)a5 adoptingLoadedState:(id)a6 updateIsPrepared:(BOOL)a7 targetingApplied:(BOOL)a8 updateIsApplied:(BOOL)a9;
- (void)activeFound;
- (void)activePersonalize:(id)a3;
- (void)advanceToCurrentUpdatePhase:(int64_t)a3 forReason:(id)a4;
- (void)advanceUpdateTarget:(int64_t)a3 forReason:(id)a4;
- (void)appendPendingPurgeCompletion:(id)a3;
- (void)applyAttemptFailed:(id)a3;
- (void)assignActiveDescriptor:(id)a3;
- (void)autoInstallWindowCancelWait;
- (void)autoInstallWindowWaitForAllowed;
- (void)autoInstallWindowWaitForAllowedComplete:(id)a3 error:(id)a4;
- (void)broadcastApplyFailed:(id)a3;
- (void)broadcastAwaitingReboot;
- (void)broadcastPrepared:(BOOL)a3;
- (void)broadcastProgressTowardApplied:(id)a3;
- (void)broadcastProgressTowardPrepared:(id)a3;
- (void)broadcastUpdateFailed;
- (void)broadcastVerifyFailed:(id)a3;
- (void)broadcastVerifyingBeforeApply;
- (void)cancelCurrentUpdate;
- (void)cleanPersistedState:(id)a3;
- (void)clearFound:(id)a3;
- (void)clearStateOfActiveUpdate:(id)a3;
- (void)decideFollowupAfterAutoInstallFired:(id)a3;
- (void)determineUpdatePolicy;
- (void)finishFailedUpdateAttempt:(id)a3;
- (void)haveFallenBackToSecondary:(BOOL)a3 forReason:(id)a4;
- (void)installUpdateForClient:(id)a3 forDescriptor:(id)a4;
- (void)issuePendingPurgeCompletions:(id)a3;
- (void)managerConfigForClient:(id)a3 completion:(id)a4;
- (void)managerStateForClient:(id)a3 completion:(id)a4;
- (void)managerStatusForClient:(id)a3 completion:(id)a4;
- (void)modifyConfigForClient:(id)a3 alteringConfig:(id)a4 forChangeMask:(int64_t)a5 completion:(id)a6;
- (void)notifyExternalStateChange;
- (void)persistBaseOSBuildVersion;
- (void)persistScanUUID:(id)a3 withRampingForeground:(BOOL)a4 forReason:(id)a5;
- (void)policyLog:(id)a3;
- (void)policyLogError:(id)a3 message:(id)a4;
- (void)purgeUpdateForClient:(id)a3 forDescriptor:(id)a4 completion:(id)a5;
- (void)removeAllUpdateContent;
- (void)reportOTAAbandoned:(id)a3 dueToError:(id)a4;
- (void)reportOTAAvailable:(id)a3;
- (void)reportOTADownloaded:(id)a3;
- (void)reportOTAPostponed:(id)a3 dueToError:(id)a4;
- (void)reportOTAPostponed:(id)a3 forSessionUUID:(id)a4 postponedDescriptor:(id)a5 dueToError:(id)a6;
- (void)scanContentIntent:(int64_t)a3 forReason:(id)a4;
- (void)scanFoundNoUpdateAvailable;
- (void)scanFoundPostponedUpdate:(id)a3 controllerStatus:(id)a4 scanUUID:(id)a5 rampingForeground:(BOOL)a6 primaryDescriptor:(id)a7 secondaryDescriptor:(id)a8 error:(id)a9;
- (void)scanFoundUpdate:(id)a3 scanUUID:(id)a4 rampingForeground:(BOOL)a5 primaryDescriptor:(id)a6 secondaryDescriptor:(id)a7 scanOptions:(id)a8;
- (void)scanFoundUpdateImmediateAttempt:(id)a3 scanUUID:(id)a4 rampingForeground:(BOOL)a5 primaryDescriptor:(id)a6 secondaryDescriptor:(id)a7 withSSOToken:(id)a8;
- (void)scanGeneratedBaseUUID:(id)a3 rampingForeground:(BOOL)a4;
- (void)setAbandonWhenApplyingPolicyParam:(id)a3;
- (void)setAbandonWhenApplyingReason:(id)a3;
- (void)setActiveDescriptor:(id)a3;
- (void)setActiveScanPolicy:(id)a3;
- (void)setFailedForward:(BOOL)a3;
- (void)setFound:(id)a3 forReason:(id)a4 persistingScanState:(BOOL)a5;
- (void)setFoundPrimaryDescriptor:(id)a3;
- (void)setFoundScanPolicy:(id)a3;
- (void)setFoundSecondaryDescriptor:(id)a3;
- (void)setHaveNotifiedApplied:(BOOL)a3;
- (void)setHaveNotifiedPrepared:(BOOL)a3;
- (void)setHaveReportedOTADownloaded:(BOOL)a3;
- (void)setInstallWaitUUID:(id)a3;
- (void)setLastNotifiedState:(int64_t)a3;
- (void)setLastReportedApplyProgress:(id)a3;
- (void)setLastReportedProgress:(id)a3;
- (void)setLoadedApplied:(BOOL)a3;
- (void)setLoadedPrepared:(BOOL)a3;
- (void)setLoadedSUAssetID:(id)a3;
- (void)setLoadedState:(id)a3;
- (void)setPendingPurgeComplete:(id)a3;
- (void)setPerservedScanRampingForeground:(BOOL)a3;
- (void)setPersonalizeSSOToken:(id)a3;
- (void)setPolicyFSM:(id)a3;
- (void)setPreservedScanBaseUUID:(id)a3;
- (void)setPrimaryDescriptor:(id)a3;
- (void)setRemovingSUContent:(BOOL)a3;
- (void)setRemovingScanContent:(BOOL)a3;
- (void)setScanContentControl:(int64_t)a3;
- (void)setScanOptions:(id)a3;
- (void)setSecondaryDescriptor:(id)a3;
- (void)setState:(id)a3;
- (void)setStateTargetingUpdate:(id)a3 forPrimaryDescriptor:(id)a4 withSecondaryDescriptor:(id)a5;
- (void)setUpdateAcceptingTerms:(BOOL)a3;
- (void)setUpdateAttemptFailureDescriptor:(id)a3;
- (void)setUpdateAttemptFailureError:(id)a3;
- (void)setUpdateConfig:(id)a3;
- (void)setUpdateControl:(id)a3;
- (void)setUpdateCurrentPhase:(int64_t)a3;
- (void)setUpdatePolicy:(id)a3;
- (void)setUpdateTarget:(int64_t)a3;
- (void)setUpdateUUID:(id)a3;
- (void)updateAbandonedNewerFound:(id)a3 eventInfo:(id)a4 persistingScanState:(BOOL)a5 reportingStatus:(id)a6 withErrorCode:(int64_t)a7;
- (void)updateAnomaly:(id)a3;
- (void)updateApplied;
- (void)updateApplyProgress:(id)a3;
- (void)updateAssetDownloadPreflighted;
- (void)updateAssetDownloadProgress:(id)a3;
- (void)updateAssetDownloadStalled:(id)a3;
- (void)updateAssetDownloaded:(id)a3;
- (void)updateAttemptFailed:(id)a3;
- (void)updateBrainLoadProgress:(id)a3;
- (void)updateBrainLoadStalled:(id)a3;
- (void)updateBrainLoaded:(id)a3;
- (void)updateCanceled;
- (void)updateFailurePoint:(id)a3 reportingStatus:(id)a4 error:(id)a5;
- (void)updatePrepareProgress:(id)a3;
- (void)updatePrepared:(id)a3;
- (void)useSSOTokenToPersonalizeForClient:(id)a3 forDescriptor:(id)a4 usingSSOToken:(id)a5;
- (void)userDidAcceptTermsAndConditionsForClient:(id)a3 forDescriptor:(id)a4;
- (void)verifyLatest:(id)a3;
@end

@implementation SUControllerPolicyEngine

+ (id)_generateStateTable
{
  v1208[0] = kSU_S_Startup;
  v1206[0] = @"ActivateNoPersisted";
  uint64_t v2 = kSUCoreNextStateKey;
  uint64_t v3 = kSUCoreActionKey;
  v1204[0] = kSUCoreNextStateKey;
  v1204[1] = kSUCoreActionKey;
  v1205[0] = @"RemovingAll";
  v1205[1] = @"RemoveAllPreservingScanState";
  v396 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1205,  v1204,  2LL));
  v1207[0] = v396;
  v1206[1] = @"ActivateHavePersisted";
  v1202[0] = v2;
  v1202[1] = v3;
  v1203[0] = @"CheckingForPrepare";
  v1203[1] = @"CheckPrepare";
  v395 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1203,  v1202,  2LL));
  v1207[1] = v395;
  v394 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1207,  v1206,  2LL));
  v1209[0] = v394;
  v1208[1] = @"CheckingForPrepare";
  v1200[0] = @"SetModeToManual";
  uint64_t v1198 = v3;
  uint64_t v4 = kSUCoreFSMActionNoOp;
  uint64_t v1199 = kSUCoreFSMActionNoOp;
  v393 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1199,  &v1198,  1LL));
  v1201[0] = v393;
  v1200[1] = @"SetModeToAuto";
  uint64_t v1196 = v3;
  uint64_t v1197 = v4;
  v392 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1197,  &v1196,  1LL));
  v1201[1] = v392;
  v1200[2] = @"ScanFoundNewerUpdate";
  uint64_t v1194 = v3;
  v1195 = @"AnomalyScanBeforeActivated";
  v391 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1195,  &v1194,  1LL));
  v1201[2] = v391;
  v1200[3] = @"ScanFoundDiffModeUpdate";
  uint64_t v1192 = v3;
  v1193 = @"AnomalyScanBeforeActivated";
  v390 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1193,  &v1192,  1LL));
  v1201[3] = v390;
  v1200[4] = @"ScanFoundSameUpdate";
  uint64_t v1190 = v3;
  v1191 = @"AnomalyScanBeforeActivated";
  v389 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1191,  &v1190,  1LL));
  v1201[4] = v389;
  v1200[5] = @"ScanFoundNewerImmediate";
  uint64_t v1188 = v3;
  v1189 = @"AnomalyScanBeforeActivated";
  v388 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1189,  &v1188,  1LL));
  v1201[5] = v388;
  v1200[6] = @"ScanFoundSameImmediate";
  uint64_t v1186 = v3;
  v1187 = @"AnomalyScanBeforeActivated";
  v387 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1187,  &v1186,  1LL));
  v1201[6] = v387;
  v1200[7] = @"ScanNoAvailableUpdate";
  uint64_t v1184 = v3;
  v1185 = @"AnomalyScanBeforeActivated";
  v386 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1185,  &v1184,  1LL));
  v1201[7] = v386;
  v1200[8] = @"UserDidAcceptTerms";
  uint64_t v1182 = v3;
  uint64_t v1183 = v4;
  v385 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1183,  &v1182,  1LL));
  v1201[8] = v385;
  v1200[9] = @"UseSSOToken";
  uint64_t v1180 = v3;
  uint64_t v1181 = v4;
  v384 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1181,  &v1180,  1LL));
  v1201[9] = v384;
  v1200[10] = @"UseCredentials";
  uint64_t v1178 = v3;
  uint64_t v1179 = v4;
  v383 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1179,  &v1178,  1LL));
  v1201[10] = v383;
  v1200[11] = @"InstallUpdate";
  uint64_t v1176 = v3;
  v1177 = @"LogInstallFailedActivating";
  v382 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1177,  &v1176,  1LL));
  v1201[11] = v382;
  v1200[12] = @"RemoveUpdate";
  v1174[0] = v2;
  v1174[1] = v3;
  v1175[0] = @"RemovingAll";
  v1175[1] = @"TrackPurge";
  v381 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1175,  v1174,  2LL));
  v1201[12] = v381;
  v1200[13] = @"SetDoDownloadAndPrep";
  uint64_t v1172 = v3;
  uint64_t v1173 = v4;
  v380 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1173,  &v1172,  1LL));
  v1201[13] = v380;
  v1200[14] = @"PurgeCheckedPrepare";
  v1170[0] = v2;
  v1170[1] = v3;
  v1171[0] = @"CheckingForAssets";
  v1171[1] = @"CheckAssets";
  v379 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1171,  v1170,  2LL));
  v1201[14] = v379;
  v1200[15] = @"PurgeCheckedMismatch";
  v1168[0] = v2;
  v1168[1] = v3;
  v1169[0] = @"RemovingAll";
  v1169[1] = @"RemoveAllPreservingScanState";
  v378 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1169,  v1168,  2LL));
  v1201[15] = v378;
  v377 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1201,  v1200,  16LL));
  v1209[1] = v377;
  v1208[2] = @"CheckingForAssets";
  v1166[0] = @"SetModeToManual";
  uint64_t v1164 = v3;
  uint64_t v1165 = v4;
  v376 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1165,  &v1164,  1LL));
  v1167[0] = v376;
  v1166[1] = @"SetModeToAuto";
  uint64_t v1162 = v3;
  uint64_t v1163 = v4;
  v375 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1163,  &v1162,  1LL));
  v1167[1] = v375;
  v1166[2] = @"ScanFoundNewerUpdate";
  uint64_t v1160 = v3;
  v1161 = @"AnomalyScanBeforeActivated";
  v374 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1161,  &v1160,  1LL));
  v1167[2] = v374;
  v1166[3] = @"ScanFoundDiffModeUpdate";
  uint64_t v1158 = v3;
  v1159 = @"AnomalyScanBeforeActivated";
  v373 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1159,  &v1158,  1LL));
  v1167[3] = v373;
  v1166[4] = @"ScanFoundSameUpdate";
  uint64_t v1156 = v3;
  v1157 = @"AnomalyScanBeforeActivated";
  v372 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1157,  &v1156,  1LL));
  v1167[4] = v372;
  v1166[5] = @"ScanFoundNewerImmediate";
  uint64_t v1154 = v3;
  v1155 = @"AnomalyScanBeforeActivated";
  v371 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1155,  &v1154,  1LL));
  v1167[5] = v371;
  v1166[6] = @"ScanFoundSameImmediate";
  uint64_t v1152 = v3;
  v1153 = @"AnomalyScanBeforeActivated";
  v370 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1153,  &v1152,  1LL));
  v1167[6] = v370;
  v1166[7] = @"ScanNoAvailableUpdate";
  uint64_t v1150 = v3;
  v1151 = @"AnomalyScanBeforeActivated";
  v369 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1151,  &v1150,  1LL));
  v1167[7] = v369;
  v1166[8] = @"UserDidAcceptTerms";
  uint64_t v1148 = v3;
  uint64_t v1149 = v4;
  v368 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1149,  &v1148,  1LL));
  v1167[8] = v368;
  v1166[9] = @"UseSSOToken";
  uint64_t v1146 = v3;
  uint64_t v1147 = v4;
  v367 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1147,  &v1146,  1LL));
  v1167[9] = v367;
  v1166[10] = @"UseCredentials";
  uint64_t v1144 = v3;
  uint64_t v1145 = v4;
  v366 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1145,  &v1144,  1LL));
  v1167[10] = v366;
  v1166[11] = @"InstallUpdate";
  uint64_t v1142 = v3;
  v1143 = @"LogInstallFailedActivating";
  v365 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1143,  &v1142,  1LL));
  v1167[11] = v365;
  v1166[12] = @"RemoveUpdate";
  v1140[0] = v2;
  v1140[1] = v3;
  v1141[0] = @"RemovingAll";
  v1141[1] = @"TrackPurge";
  v364 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1141,  v1140,  2LL));
  v1167[12] = v364;
  v1166[13] = @"SetDoDownloadAndPrep";
  uint64_t v1138 = v3;
  uint64_t v1139 = v4;
  v363 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1139,  &v1138,  1LL));
  v1167[13] = v363;
  v1166[14] = @"PurgeCheckedMismatch";
  v1136[0] = v2;
  v1136[1] = v3;
  v1137[0] = @"RemovingAll";
  v1137[1] = @"RemoveAllPreservingScanState";
  v362 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1137,  v1136,  2LL));
  v1167[14] = v362;
  v1166[15] = @"PurgeCheckedMatch";
  v1134[0] = v2;
  v1134[1] = v3;
  v1135[0] = @"ReloadingAssets";
  v1135[1] = @"ReloadDescriptors";
  v361 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1135,  v1134,  2LL));
  v1167[15] = v361;
  v360 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1167,  v1166,  16LL));
  v1209[2] = v360;
  v1208[3] = @"ReloadingAssets";
  v1132[0] = @"SetModeToManual";
  uint64_t v1130 = v3;
  uint64_t v1131 = v4;
  v359 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1131,  &v1130,  1LL));
  v1133[0] = v359;
  v1132[1] = @"SetModeToAuto";
  uint64_t v1128 = v3;
  uint64_t v1129 = v4;
  v358 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1129,  &v1128,  1LL));
  v1133[1] = v358;
  v1132[2] = @"ScanFoundNewerUpdate";
  uint64_t v1126 = v3;
  v1127 = @"AnomalyScanBeforeActivated";
  v357 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1127,  &v1126,  1LL));
  v1133[2] = v357;
  v1132[3] = @"ScanFoundDiffModeUpdate";
  uint64_t v1124 = v3;
  v1125 = @"AnomalyScanBeforeActivated";
  v356 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1125,  &v1124,  1LL));
  v1133[3] = v356;
  v1132[4] = @"ScanFoundSameUpdate";
  uint64_t v1122 = v3;
  v1123 = @"AnomalyScanBeforeActivated";
  v355 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1123,  &v1122,  1LL));
  v1133[4] = v355;
  v1132[5] = @"ScanFoundNewerImmediate";
  uint64_t v1120 = v3;
  v1121 = @"AnomalyScanBeforeActivated";
  v354 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1121,  &v1120,  1LL));
  v1133[5] = v354;
  v1132[6] = @"ScanFoundSameImmediate";
  uint64_t v1118 = v3;
  v1119 = @"AnomalyScanBeforeActivated";
  v353 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1119,  &v1118,  1LL));
  v1133[6] = v353;
  v1132[7] = @"ScanNoAvailableUpdate";
  uint64_t v1116 = v3;
  v1117 = @"AnomalyScanBeforeActivated";
  v352 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1117,  &v1116,  1LL));
  v1133[7] = v352;
  v1132[8] = @"UserDidAcceptTerms";
  uint64_t v1114 = v3;
  uint64_t v1115 = v4;
  v351 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1115,  &v1114,  1LL));
  v1133[8] = v351;
  v1132[9] = @"UseSSOToken";
  uint64_t v1112 = v3;
  uint64_t v1113 = v4;
  v350 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1113,  &v1112,  1LL));
  v1133[9] = v350;
  v1132[10] = @"UseCredentials";
  uint64_t v1110 = v3;
  uint64_t v1111 = v4;
  v349 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1111,  &v1110,  1LL));
  v1133[10] = v349;
  v1132[11] = @"InstallUpdate";
  uint64_t v1108 = v3;
  v1109 = @"LogInstallFailedActivating";
  v348 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1109,  &v1108,  1LL));
  v1133[11] = v348;
  v1132[12] = @"RemoveUpdate";
  v1106[0] = v2;
  v1106[1] = v3;
  v1107[0] = @"RemovingAll";
  v1107[1] = @"TrackPurge";
  v347 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1107,  v1106,  2LL));
  v1133[12] = v347;
  v1132[13] = @"SetDoDownloadAndPrep";
  uint64_t v1104 = v3;
  uint64_t v1105 = v4;
  v346 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1105,  &v1104,  1LL));
  v1133[13] = v346;
  v1132[14] = @"ReloadDescriptorsFailed";
  v1102[0] = v2;
  v1102[1] = v3;
  v1103[0] = @"RemovingAll";
  v1103[1] = @"RemoveAllPreservingScanState";
  v345 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1103,  v1102,  2LL));
  v1133[14] = v345;
  v1132[15] = @"ReloadDescriptorsSuccess";
  v1100[0] = v2;
  v1100[1] = v3;
  v1101[0] = @"RemovingExceptPreserved";
  v1101[1] = @"RemovePreserving";
  v344 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1101,  v1100,  2LL));
  v1133[15] = v344;
  v343 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1133,  v1132,  16LL));
  v1209[3] = v343;
  v1208[4] = @"RemovingExceptPreserved";
  v1098[0] = @"SetModeToManual";
  uint64_t v1096 = v3;
  uint64_t v1097 = v4;
  v342 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1097,  &v1096,  1LL));
  v1099[0] = v342;
  v1098[1] = @"SetModeToAuto";
  uint64_t v1094 = v3;
  uint64_t v1095 = v4;
  v341 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1095,  &v1094,  1LL));
  v1099[1] = v341;
  v1098[2] = @"ScanFoundNewerUpdate";
  uint64_t v1092 = v3;
  v1093 = @"AnomalyScanBeforeActivated";
  v340 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1093,  &v1092,  1LL));
  v1099[2] = v340;
  v1098[3] = @"ScanFoundDiffModeUpdate";
  uint64_t v1090 = v3;
  v1091 = @"AnomalyScanBeforeActivated";
  v339 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1091,  &v1090,  1LL));
  v1099[3] = v339;
  v1098[4] = @"ScanFoundSameUpdate";
  uint64_t v1088 = v3;
  v1089 = @"AnomalyScanBeforeActivated";
  v338 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1089,  &v1088,  1LL));
  v1099[4] = v338;
  v1098[5] = @"ScanFoundNewerImmediate";
  uint64_t v1086 = v3;
  v1087 = @"AnomalyScanBeforeActivated";
  v337 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1087,  &v1086,  1LL));
  v1099[5] = v337;
  v1098[6] = @"ScanFoundSameImmediate";
  uint64_t v1084 = v3;
  v1085 = @"AnomalyScanBeforeActivated";
  v336 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1085,  &v1084,  1LL));
  v1099[6] = v336;
  v1098[7] = @"ScanNoAvailableUpdate";
  uint64_t v1082 = v3;
  v1083 = @"AnomalyScanBeforeActivated";
  v335 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1083,  &v1082,  1LL));
  v1099[7] = v335;
  v1098[8] = @"UserDidAcceptTerms";
  uint64_t v1080 = v3;
  uint64_t v1081 = v4;
  v334 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1081,  &v1080,  1LL));
  v1099[8] = v334;
  v1098[9] = @"UseSSOToken";
  uint64_t v1078 = v3;
  uint64_t v1079 = v4;
  v333 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1079,  &v1078,  1LL));
  v1099[9] = v333;
  v1098[10] = @"UseCredentials";
  uint64_t v1076 = v3;
  uint64_t v1077 = v4;
  v332 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1077,  &v1076,  1LL));
  v1099[10] = v332;
  v1098[11] = @"InstallUpdate";
  uint64_t v1074 = v3;
  v1075 = @"LogInstallFailedActivating";
  v331 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1075,  &v1074,  1LL));
  v1099[11] = v331;
  v1098[12] = @"RemoveUpdate";
  v1072[0] = v2;
  v1072[1] = v3;
  v1073[0] = @"RemovingAll";
  v1073[1] = @"TrackPurge";
  v330 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1073,  v1072,  2LL));
  v1099[12] = v330;
  v1098[13] = @"SetDoDownloadAndPrep";
  uint64_t v1070 = v3;
  uint64_t v1071 = v4;
  v329 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1071,  &v1070,  1LL));
  v1099[13] = v329;
  v1098[14] = @"PreservedInvalid";
  v1068[0] = v2;
  v1068[1] = v3;
  v1069[0] = @"RemovingAll";
  v1069[1] = @"RemoveAllPreservingScanState";
  v328 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1069,  v1068,  2LL));
  v1099[14] = v328;
  v1098[15] = @"PreservedValidated";
  v1066[0] = v2;
  v1066[1] = v3;
  v1067[0] = @"ResumingPreserved";
  v1067[1] = @"ResumeTargetPrepared";
  v327 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1067,  v1066,  2LL));
  v1099[15] = v327;
  v326 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1099,  v1098,  16LL));
  v1209[4] = v326;
  v1208[5] = @"ResumingPreserved";
  v1064[0] = @"SetModeToManual";
  uint64_t v1062 = v3;
  uint64_t v1063 = v4;
  v325 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1063,  &v1062,  1LL));
  v1065[0] = v325;
  v1064[1] = @"SetModeToAuto";
  uint64_t v1060 = v3;
  uint64_t v1061 = v4;
  v324 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1061,  &v1060,  1LL));
  v1065[1] = v324;
  v1064[2] = @"ScanFoundNewerUpdate";
  uint64_t v1058 = v3;
  v1059 = @"AnomalyScanBeforeActivated";
  v323 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1059,  &v1058,  1LL));
  v1065[2] = v323;
  v1064[3] = @"ScanFoundDiffModeUpdate";
  uint64_t v1056 = v3;
  v1057 = @"AnomalyScanBeforeActivated";
  v322 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1057,  &v1056,  1LL));
  v1065[3] = v322;
  v1064[4] = @"ScanFoundSameUpdate";
  uint64_t v1054 = v3;
  v1055 = @"AnomalyScanBeforeActivated";
  v321 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1055,  &v1054,  1LL));
  v1065[4] = v321;
  v1064[5] = @"ScanFoundNewerImmediate";
  uint64_t v1052 = v3;
  v1053 = @"AnomalyScanBeforeActivated";
  v320 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1053,  &v1052,  1LL));
  v1065[5] = v320;
  v1064[6] = @"ScanFoundSameImmediate";
  uint64_t v1050 = v3;
  v1051 = @"AnomalyScanBeforeActivated";
  v319 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1051,  &v1050,  1LL));
  v1065[6] = v319;
  v1064[7] = @"ScanNoAvailableUpdate";
  uint64_t v1048 = v3;
  v1049 = @"AnomalyScanBeforeActivated";
  v318 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1049,  &v1048,  1LL));
  v1065[7] = v318;
  v1064[8] = @"UserDidAcceptTerms";
  uint64_t v1046 = v3;
  uint64_t v1047 = v4;
  v317 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1047,  &v1046,  1LL));
  v1065[8] = v317;
  v1064[9] = @"UseSSOToken";
  uint64_t v1044 = v3;
  uint64_t v1045 = v4;
  v316 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1045,  &v1044,  1LL));
  v1065[9] = v316;
  v1064[10] = @"UseCredentials";
  uint64_t v1042 = v3;
  uint64_t v1043 = v4;
  v315 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1043,  &v1042,  1LL));
  v1065[10] = v315;
  v1064[11] = @"InstallUpdate";
  uint64_t v1040 = v3;
  v1041 = @"LogInstallFailedActivating";
  v314 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1041,  &v1040,  1LL));
  v1065[11] = v314;
  v1064[12] = @"RemoveUpdate";
  v1038[0] = v2;
  v1038[1] = v3;
  v1039[0] = @"RemovingAll";
  v1039[1] = @"CancelUpdateTrackPurge";
  v313 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1039,  v1038,  2LL));
  v1065[12] = v313;
  v1064[13] = @"SetDoDownloadAndPrep";
  uint64_t v1036 = v3;
  uint64_t v1037 = v4;
  v312 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1037,  &v1036,  1LL));
  v1065[13] = v312;
  v1064[14] = @"UpdateProgress";
  uint64_t v1034 = v3;
  uint64_t v1035 = v4;
  v311 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1035,  &v1034,  1LL));
  v1065[14] = v311;
  uint64_t v5 = kSU_E_PrepareSuccess;
  v1064[15] = kSU_E_PrepareSuccess;
  uint64_t v404 = kSU_E_PrepareSuccess;
  uint64_t v1032 = v3;
  v1033 = @"ResumedDecideByMode";
  v310 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1033,  &v1032,  1LL));
  v1065[15] = v310;
  v1064[16] = @"UpdateFailedFallback";
  v1030[0] = v2;
  v1030[1] = v3;
  v1031[0] = @"RemovingAll";
  v1031[1] = @"CancelUpdate";
  v309 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1031,  v1030,  2LL));
  v1065[16] = v309;
  v1064[17] = @"UpdateFailedDone";
  v1028[0] = v2;
  v1028[1] = v3;
  v1029[0] = @"RemovingAll";
  v1029[1] = @"CancelUpdate";
  v308 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1029,  v1028,  2LL));
  v1065[17] = v308;
  uint64_t v414 = kSU_E_ApplyFailed;
  v1064[18] = kSU_E_ApplyFailed;
  v1026[0] = v2;
  v1026[1] = v3;
  v1027[0] = @"RemovingAll";
  v1027[1] = @"CancelUpdate";
  v307 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1027,  v1026,  2LL));
  v1065[18] = v307;
  v1064[19] = @"UpdatePreparedAuto";
  v1024[0] = v2;
  v1024[1] = v3;
  v1025[0] = @"WaitingToAutoInstall";
  v1025[1] = @"ActivatedReportWaitAuto";
  v306 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1025,  v1024,  2LL));
  v1065[19] = v306;
  v1064[20] = @"UpdatePreparedAtTarget";
  uint64_t v406 = kSU_S_Prepared;
  v1022[0] = v2;
  v1022[1] = v3;
  v1023[0] = kSU_S_Prepared;
  v1023[1] = @"ActivatedReportPrepared";
  v305 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1023,  v1022,  2LL));
  v1065[20] = v305;
  v304 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1065,  v1064,  21LL));
  v1209[5] = v304;
  v1208[6] = @"RemovingAll";
  v1020[0] = @"SetModeToManual";
  uint64_t v1018 = v3;
  uint64_t v1019 = v4;
  v303 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1019,  &v1018,  1LL));
  v1021[0] = v303;
  v1020[1] = @"SetModeToAuto";
  uint64_t v1016 = v3;
  uint64_t v1017 = v4;
  v302 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1017,  &v1016,  1LL));
  v1021[1] = v302;
  v1020[2] = @"ScanFoundNewerUpdate";
  uint64_t v1014 = v3;
  v1015 = @"AnomalyScanBeforeActivated";
  v301 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1015,  &v1014,  1LL));
  v1021[2] = v301;
  v1020[3] = @"ScanFoundDiffModeUpdate";
  uint64_t v1012 = v3;
  v1013 = @"AnomalyScanBeforeActivated";
  v300 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1013,  &v1012,  1LL));
  v1021[3] = v300;
  v1020[4] = @"ScanFoundSameUpdate";
  uint64_t v1010 = v3;
  v1011 = @"AnomalyScanBeforeActivated";
  v299 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1011,  &v1010,  1LL));
  v1021[4] = v299;
  v1020[5] = @"ScanFoundNewerImmediate";
  uint64_t v1008 = v3;
  v1009 = @"AnomalyScanBeforeActivated";
  v298 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1009,  &v1008,  1LL));
  v1021[5] = v298;
  v1020[6] = @"ScanFoundSameImmediate";
  uint64_t v1006 = v3;
  v1007 = @"AnomalyScanBeforeActivated";
  v297 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1007,  &v1006,  1LL));
  v1021[6] = v297;
  v1020[7] = @"ScanNoAvailableUpdate";
  uint64_t v1004 = v3;
  v1005 = @"AnomalyScanBeforeActivated";
  v296 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1005,  &v1004,  1LL));
  v1021[7] = v296;
  v1020[8] = @"UserDidAcceptTerms";
  uint64_t v1002 = v3;
  uint64_t v1003 = v4;
  v295 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1003,  &v1002,  1LL));
  v1021[8] = v295;
  v1020[9] = @"UseSSOToken";
  uint64_t v1000 = v3;
  uint64_t v1001 = v4;
  v294 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v1001,  &v1000,  1LL));
  v1021[9] = v294;
  v1020[10] = @"UseCredentials";
  uint64_t v998 = v3;
  uint64_t v999 = v4;
  v293 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v999,  &v998,  1LL));
  v1021[10] = v293;
  v1020[11] = @"InstallUpdate";
  uint64_t v996 = v3;
  v997 = @"LogInstallFailedActivating";
  v292 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v997,  &v996,  1LL));
  v1021[11] = v292;
  v1020[12] = @"RemoveUpdate";
  uint64_t v994 = v3;
  v995 = @"TrackPurge";
  v291 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v995,  &v994,  1LL));
  v1021[12] = v291;
  v1020[13] = @"SetDoDownloadAndPrep";
  uint64_t v992 = v3;
  uint64_t v993 = v4;
  v290 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v993,  &v992,  1LL));
  v1021[13] = v290;
  v1020[14] = @"PurgeCheckedPrepare";
  uint64_t v990 = v3;
  v991 = @"RemoveAllIncludingDoc";
  v289 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v991,  &v990,  1LL));
  v1021[14] = v289;
  v1020[15] = @"PurgeCheckedMismatch";
  uint64_t v988 = v3;
  v989 = @"RemoveAllIncludingDoc";
  v288 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v989,  &v988,  1LL));
  v1021[15] = v288;
  v1020[16] = @"PurgeCheckedMatch";
  uint64_t v986 = v3;
  v987 = @"RemoveAllIncludingDoc";
  v287 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v987,  &v986,  1LL));
  v1021[16] = v287;
  v1020[17] = @"PurgeRemovedSUContent";
  uint64_t v984 = v3;
  v985 = @"SUContentPurgedDecideRemoved";
  v286 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v985,  &v984,  1LL));
  v1021[17] = v286;
  v1020[18] = @"ScanContentPurged";
  uint64_t v982 = v3;
  v983 = @"ScanPurgedDecideRemoved";
  v285 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v983,  &v982,  1LL));
  v1021[18] = v285;
  v1020[19] = @"PurgeRemovedAll";
  v980[0] = v2;
  v980[1] = v3;
  v981[0] = kSU_S_NoNewerUpdate;
  uint64_t v6 = kSU_S_NoNewerUpdate;
  uint64_t v400 = kSU_S_NoNewerUpdate;
  v981[1] = @"ActivatedReportRemoved";
  v284 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v981,  v980,  2LL));
  v1021[19] = v284;
  v1020[20] = @"ReloadDescriptorsFailed";
  uint64_t v978 = v3;
  v979 = @"RemoveAllIncludingDoc";
  v283 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v979,  &v978,  1LL));
  v1021[20] = v283;
  v1020[21] = @"ReloadDescriptorsSuccess";
  uint64_t v976 = v3;
  v977 = @"RemoveAllIncludingDoc";
  v282 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v977,  &v976,  1LL));
  v1021[21] = v282;
  v1020[22] = @"PreservedInvalid";
  uint64_t v974 = v3;
  v975 = @"RemoveAllIncludingDoc";
  v281 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v975,  &v974,  1LL));
  v1021[22] = v281;
  v1020[23] = @"PreservedValidated";
  uint64_t v972 = v3;
  v973 = @"RemoveAllIncludingDoc";
  v280 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v973,  &v972,  1LL));
  v1021[23] = v280;
  v1020[24] = @"UpdateProgress";
  uint64_t v970 = v3;
  uint64_t v971 = v4;
  v279 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v971,  &v970,  1LL));
  v1021[24] = v279;
  v1020[25] = v5;
  uint64_t v968 = v3;
  uint64_t v969 = v4;
  v278 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v969,  &v968,  1LL));
  v1021[25] = v278;
  v1020[26] = @"UpdateFailedFallback";
  uint64_t v966 = v3;
  uint64_t v967 = v4;
  v277 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v967,  &v966,  1LL));
  v1021[26] = v277;
  v1020[27] = @"UpdateFailedDone";
  uint64_t v964 = v3;
  uint64_t v965 = v4;
  v276 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v965,  &v964,  1LL));
  v1021[27] = v276;
  v1020[28] = @"UpdateCanceled";
  uint64_t v962 = v3;
  v963 = @"RemoveAllIncludingDoc";
  v275 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v963,  &v962,  1LL));
  v1021[28] = v275;
  v274 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1021,  v1020,  29LL));
  v1209[6] = v274;
  v1208[7] = v6;
  v960[0] = @"SetModeToManual";
  uint64_t v958 = v3;
  uint64_t v959 = v4;
  v273 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v959,  &v958,  1LL));
  v961[0] = v273;
  v960[1] = @"SetModeToAuto";
  uint64_t v956 = v3;
  uint64_t v957 = v4;
  v272 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v957,  &v956,  1LL));
  v961[1] = v272;
  v960[2] = @"ScanFoundNewerUpdate";
  v954[0] = v2;
  v954[1] = v3;
  v955[0] = @"UpdateFound";
  v955[1] = @"DecidePrepareUpdate";
  v271 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v955,  v954,  2LL));
  v961[2] = v271;
  v960[3] = @"ScanFoundDiffModeUpdate";
  v952[0] = v2;
  v952[1] = v3;
  v953[0] = @"UpdateFound";
  v953[1] = @"DecidePrepareUpdate";
  v270 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v953,  v952,  2LL));
  v961[3] = v270;
  v960[4] = @"ScanFoundSameUpdate";
  v950[0] = v2;
  v950[1] = v3;
  v951[0] = @"UpdateFound";
  v951[1] = @"DecidePrepareUpdate";
  v269 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v951,  v950,  2LL));
  v961[4] = v269;
  v960[5] = @"ScanFoundNewerImmediate";
  v948[0] = v2;
  v948[1] = v3;
  v949[0] = @"UpdatingToPrimary";
  v949[1] = @"CreateImmediateTargetInstalled";
  v268 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v949,  v948,  2LL));
  v961[5] = v268;
  v960[6] = @"ScanFoundSameImmediate";
  v946[0] = v2;
  v946[1] = v3;
  v947[0] = @"UpdatingToPrimary";
  v947[1] = @"CreateImmediateTargetInstalled";
  v267 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v947,  v946,  2LL));
  v961[6] = v267;
  v960[7] = @"ScanNoAvailableUpdate";
  uint64_t v944 = v3;
  uint64_t v945 = v4;
  v266 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v945,  &v944,  1LL));
  v961[7] = v266;
  v960[8] = @"UserDidAcceptTerms";
  uint64_t v942 = v3;
  v943 = @"RequestIgnoredNoUpdate";
  v265 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v943,  &v942,  1LL));
  v961[8] = v265;
  v960[9] = @"UseSSOToken";
  uint64_t v940 = v3;
  v941 = @"RequestIgnoredNoUpdate";
  v264 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v941,  &v940,  1LL));
  v961[9] = v264;
  v960[10] = @"UseCredentials";
  uint64_t v938 = v3;
  v939 = @"RequestIgnoredNoUpdate";
  v263 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v939,  &v938,  1LL));
  v961[10] = v263;
  v960[11] = @"InstallUpdate";
  uint64_t v936 = v3;
  v937 = @"LogInstallFailedNoUpdate";
  v262 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v937,  &v936,  1LL));
  v961[11] = v262;
  v960[12] = @"RemoveUpdate";
  v934[0] = v2;
  v934[1] = v3;
  v935[0] = @"Canceling";
  v935[1] = @"RemoveAllTrackPurge";
  v261 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v935,  v934,  2LL));
  v961[12] = v261;
  v960[13] = @"SetDoDownloadAndPrep";
  uint64_t v932 = v3;
  uint64_t v933 = v4;
  v260 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v933,  &v932,  1LL));
  v961[13] = v260;
  v259 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v961,  v960,  14LL));
  v1209[7] = v259;
  v1208[8] = @"UpdateFound";
  v930[0] = @"SetModeToManual";
  uint64_t v928 = v3;
  uint64_t v929 = v4;
  v258 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v929,  &v928,  1LL));
  v931[0] = v258;
  v930[1] = @"SetModeToAuto";
  uint64_t v926 = v3;
  uint64_t v927 = v4;
  v257 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v927,  &v926,  1LL));
  v931[1] = v257;
  v930[2] = @"ScanFoundNewerUpdate";
  uint64_t v924 = v3;
  v925 = @"DecidePrepareUpdate";
  v256 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v925,  &v924,  1LL));
  v931[2] = v256;
  v930[3] = @"ScanFoundDiffModeUpdate";
  uint64_t v922 = v3;
  v923 = @"DecidePrepareUpdate";
  v255 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v923,  &v922,  1LL));
  v931[3] = v255;
  v930[4] = @"ScanFoundSameUpdate";
  uint64_t v920 = v3;
  v921 = @"DecidePrepareUpdate";
  v254 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v921,  &v920,  1LL));
  v931[4] = v254;
  v930[5] = @"ScanFoundNewerImmediate";
  v918[0] = v2;
  v918[1] = v3;
  v919[0] = @"UpdatingToPrimary";
  v919[1] = @"CreateImmediateTargetInstalled";
  v253 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v919,  v918,  2LL));
  v931[5] = v253;
  v930[6] = @"ScanFoundSameImmediate";
  v916[0] = v2;
  v916[1] = v3;
  v917[0] = @"UpdatingToPrimary";
  v917[1] = @"CreateImmediateTargetInstalled";
  v252 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v917,  v916,  2LL));
  v931[6] = v252;
  v930[7] = @"ScanNoAvailableUpdate";
  v914[0] = v2;
  v914[1] = v3;
  v915[0] = v400;
  v915[1] = @"ClearFound";
  v251 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v915,  v914,  2LL));
  v931[7] = v251;
  v930[8] = @"UserDidAcceptTerms";
  uint64_t v912 = v3;
  v913 = @"RequestIgnoredNoUpdate";
  v250 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v913,  &v912,  1LL));
  v931[8] = v250;
  v930[9] = @"UseSSOToken";
  uint64_t v910 = v3;
  v911 = @"RequestIgnoredNoUpdate";
  v249 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v911,  &v910,  1LL));
  v931[9] = v249;
  v930[10] = @"UseCredentials";
  uint64_t v908 = v3;
  v909 = @"RequestIgnoredNoUpdate";
  v248 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v909,  &v908,  1LL));
  v931[10] = v248;
  v930[11] = @"InstallUpdate";
  uint64_t v906 = v3;
  v907 = @"LogInstallFailedNoUpdate";
  v247 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v907,  &v906,  1LL));
  v931[11] = v247;
  v930[12] = @"RemoveUpdate";
  v904[0] = v2;
  v904[1] = v3;
  v905[0] = @"Canceling";
  v905[1] = @"RemoveAllTrackPurge";
  v246 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v905,  v904,  2LL));
  v931[12] = v246;
  v930[13] = @"SetDoDownloadAndPrep";
  v902[0] = v2;
  v902[1] = v3;
  v903[0] = @"UpdatingToPrimary";
  v903[1] = @"CreateFoundTargetPrepared";
  v245 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v903,  v902,  2LL));
  v931[13] = v245;
  v930[14] = @"ShouldPrepUpdate";
  v900[0] = v2;
  v900[1] = v3;
  v901[0] = @"UpdatingToPrimary";
  v901[1] = @"CreateFoundTargetPrepared";
  v244 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v901,  v900,  2LL));
  v931[14] = v244;
  v930[15] = @"BackToWaitForUpdate";
  uint64_t v898 = v2;
  uint64_t v899 = v400;
  v243 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v899,  &v898,  1LL));
  v931[15] = v243;
  v242 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v931,  v930,  16LL));
  v1209[8] = v242;
  v1208[9] = @"UpdatingToPrimary";
  v896[0] = @"SetModeToManual";
  uint64_t v894 = v3;
  uint64_t v895 = v4;
  v241 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v895,  &v894,  1LL));
  v897[0] = v241;
  v896[1] = @"SetModeToAuto";
  uint64_t v892 = v3;
  uint64_t v893 = v4;
  v240 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v893,  &v892,  1LL));
  v897[1] = v240;
  v896[2] = @"ScanFoundNewerUpdate";
  v890[0] = v2;
  v890[1] = v3;
  v891[0] = @"AbandoningOlder";
  v891[1] = @"SetFoundCancelUpdate";
  v239 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v891,  v890,  2LL));
  v897[2] = v239;
  v896[3] = @"ScanFoundDiffModeUpdate";
  v888[0] = v2;
  v888[1] = v3;
  v889[0] = @"AbandoningOlder";
  v889[1] = @"SetFoundCancelUpdate";
  v238 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v889,  v888,  2LL));
  v897[3] = v238;
  v896[4] = @"ScanFoundSameUpdate";
  uint64_t v886 = v3;
  uint64_t v887 = v4;
  v237 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v887,  &v886,  1LL));
  v897[4] = v237;
  v896[5] = @"ScanFoundNewerImmediate";
  v884[0] = v2;
  v884[1] = v3;
  v885[0] = @"AbandoningOlder";
  v885[1] = @"SetFoundCancelImmediate";
  v236 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v885,  v884,  2LL));
  v897[5] = v236;
  v896[6] = @"ScanFoundSameImmediate";
  uint64_t v882 = v3;
  v883 = @"ImmediateTargetInstalled";
  v235 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v883,  &v882,  1LL));
  v897[6] = v235;
  v896[7] = @"ScanNoAvailableUpdate";
  v880[0] = v2;
  v880[1] = v3;
  v881[0] = @"Canceling";
  v881[1] = @"ClearFoundCancelUpdate";
  v234 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v881,  v880,  2LL));
  v897[7] = v234;
  v896[8] = @"UserDidAcceptTerms";
  uint64_t v878 = v3;
  v879 = @"UserAcceptedTerms";
  v233 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v879,  &v878,  1LL));
  v897[8] = v233;
  v896[9] = @"UseSSOToken";
  uint64_t v876 = v3;
  v877 = @"UseCredentialsToPersonalize";
  v232 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v877,  &v876,  1LL));
  v897[9] = v232;
  v896[10] = @"UseCredentials";
  uint64_t v874 = v3;
  v875 = @"UseCredentialsToPersonalize";
  v231 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v875,  &v874,  1LL));
  v897[10] = v231;
  v896[11] = @"InstallUpdate";
  uint64_t v872 = v3;
  v873 = @"TargetInstalled";
  v230 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v873,  &v872,  1LL));
  v897[11] = v230;
  v896[12] = @"RemoveUpdate";
  v870[0] = v2;
  v870[1] = v3;
  v871[0] = @"Canceling";
  v871[1] = @"CancelUpdateTrackPurge";
  v229 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v871,  v870,  2LL));
  v897[12] = v229;
  v896[13] = @"SetDoDownloadAndPrep";
  uint64_t v868 = v3;
  uint64_t v869 = v4;
  v228 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v869,  &v868,  1LL));
  v897[13] = v228;
  v896[14] = @"UpdateProgress";
  uint64_t v866 = v3;
  v867 = @"ReportUpdateProgress";
  v227 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v867,  &v866,  1LL));
  v897[14] = v227;
  v896[15] = v404;
  uint64_t v864 = v3;
  v865 = @"PreparedDecideByMode";
  v226 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v865,  &v864,  1LL));
  v897[15] = v226;
  v896[16] = @"UpdateFailedFallback";
  uint64_t v862 = v3;
  v863 = @"DecideFallbackToSecondary";
  v225 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v863,  &v862,  1LL));
  v897[16] = v225;
  v896[17] = @"UpdateFailedDone";
  v860[0] = v2;
  v860[1] = v3;
  v861[0] = @"Canceling";
  v861[1] = @"AttemptFailedRemoveAll";
  v224 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v861,  v860,  2LL));
  v897[17] = v224;
  uint64_t v412 = kSU_E_ApplyProgress;
  v896[18] = kSU_E_ApplyProgress;
  uint64_t v858 = v3;
  uint64_t v402 = kSU_A_ReportApplyProgress;
  uint64_t v859 = kSU_A_ReportApplyProgress;
  v223 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v859,  &v858,  1LL));
  v897[18] = v223;
  v896[19] = v414;
  v856[0] = v2;
  v856[1] = v3;
  v857[0] = @"Canceling";
  v857[1] = @"AttemptFailedRemoveAll";
  v222 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v857,  v856,  2LL));
  v897[19] = v222;
  uint64_t v408 = kSU_E_ApplySuccess;
  v896[20] = kSU_E_ApplySuccess;
  uint64_t v410 = kSU_S_AwaitingReboot;
  v854[0] = v2;
  v854[1] = v3;
  v855[0] = kSU_S_AwaitingReboot;
  v855[1] = @"ReportAwaitingReboot";
  v221 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v855,  v854,  2LL));
  v897[20] = v221;
  v896[21] = @"FallbackAvailable";
  v852[0] = v2;
  v852[1] = v3;
  v853[0] = @"UpdatingToSecondary";
  v853[1] = @"SecondaryTargetMaintain";
  v220 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v853,  v852,  2LL));
  v897[21] = v220;
  v896[22] = @"FallbackNotAvailable";
  v850[0] = v2;
  v850[1] = v3;
  v851[0] = @"Canceling";
  v851[1] = @"RemoveAll";
  v219 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v851,  v850,  2LL));
  v897[22] = v219;
  v896[23] = @"UpdatePreparedAuto";
  v848[0] = v2;
  v848[1] = v3;
  v849[0] = @"WaitingToAutoInstall";
  v849[1] = @"ReportWaitAuto";
  v218 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v849,  v848,  2LL));
  v897[23] = v218;
  v896[24] = @"UpdatePreparedAtTarget";
  v846[0] = v2;
  v846[1] = v3;
  uint64_t v190 = kSU_A_ReportPrepared;
  v847[0] = v406;
  v847[1] = kSU_A_ReportPrepared;
  v217 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v847,  v846,  2LL));
  v897[24] = v217;
  v896[25] = @"UpdatePreparedInstall";
  v844[0] = v2;
  v844[1] = v3;
  v845[0] = @"VerifyingLatest";
  v845[1] = @"VerifyLatest";
  v216 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v845,  v844,  2LL));
  v897[25] = v216;
  v896[26] = @"UpdatePreparedImmediate";
  uint64_t v842 = v2;
  uint64_t v398 = kSU_S_Applying;
  uint64_t v843 = kSU_S_Applying;
  v215 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v843,  &v842,  1LL));
  v897[26] = v215;
  v214 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v897,  v896,  27LL));
  v1209[9] = v214;
  v1208[10] = @"UpdatingToSecondary";
  v840[0] = @"SetModeToManual";
  uint64_t v838 = v3;
  uint64_t v839 = v4;
  v213 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v839,  &v838,  1LL));
  v841[0] = v213;
  v840[1] = @"SetModeToAuto";
  uint64_t v836 = v3;
  uint64_t v837 = v4;
  v212 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v837,  &v836,  1LL));
  v841[1] = v212;
  v840[2] = @"ScanFoundNewerUpdate";
  v834[0] = v2;
  v834[1] = v3;
  v835[0] = @"AbandoningOlder";
  v835[1] = @"SetFoundCancelUpdate";
  v211 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v835,  v834,  2LL));
  v841[2] = v211;
  v840[3] = @"ScanFoundDiffModeUpdate";
  v832[0] = v2;
  v832[1] = v3;
  v833[0] = @"AbandoningOlder";
  v833[1] = @"SetFoundCancelUpdate";
  v210 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v833,  v832,  2LL));
  v841[3] = v210;
  v840[4] = @"ScanFoundSameUpdate";
  uint64_t v830 = v3;
  uint64_t v831 = v4;
  v209 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v831,  &v830,  1LL));
  v841[4] = v209;
  v840[5] = @"ScanFoundNewerImmediate";
  v828[0] = v2;
  v828[1] = v3;
  v829[0] = @"AbandoningOlder";
  v829[1] = @"SetFoundCancelImmediate";
  v208 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v829,  v828,  2LL));
  v841[5] = v208;
  v840[6] = @"ScanFoundSameImmediate";
  uint64_t v826 = v3;
  v827 = @"ImmediateTargetInstalled";
  v207 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v827,  &v826,  1LL));
  v841[6] = v207;
  v840[7] = @"ScanNoAvailableUpdate";
  v824[0] = v2;
  v824[1] = v3;
  v825[0] = @"Canceling";
  v825[1] = @"ClearFoundCancelUpdate";
  v206 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v825,  v824,  2LL));
  v841[7] = v206;
  v840[8] = @"UserDidAcceptTerms";
  uint64_t v822 = v3;
  v823 = @"UserAcceptedTerms";
  v205 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v823,  &v822,  1LL));
  v841[8] = v205;
  v840[9] = @"UseSSOToken";
  uint64_t v820 = v3;
  v821 = @"UseCredentialsToPersonalize";
  v204 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v821,  &v820,  1LL));
  v841[9] = v204;
  v840[10] = @"UseCredentials";
  uint64_t v818 = v3;
  v819 = @"UseCredentialsToPersonalize";
  v203 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v819,  &v818,  1LL));
  v841[10] = v203;
  v840[11] = @"InstallUpdate";
  uint64_t v816 = v3;
  v817 = @"TargetInstalled";
  v202 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v817,  &v816,  1LL));
  v841[11] = v202;
  v840[12] = @"RemoveUpdate";
  v814[0] = v2;
  v814[1] = v3;
  v815[0] = @"Canceling";
  v815[1] = @"CancelUpdateTrackPurge";
  v201 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v815,  v814,  2LL));
  v841[12] = v201;
  v840[13] = @"SetDoDownloadAndPrep";
  uint64_t v812 = v3;
  uint64_t v813 = v4;
  v200 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v813,  &v812,  1LL));
  v841[13] = v200;
  v840[14] = @"UpdateProgress";
  uint64_t v810 = v3;
  v811 = @"ReportUpdateProgress";
  v199 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v811,  &v810,  1LL));
  v841[14] = v199;
  v840[15] = v404;
  uint64_t v808 = v3;
  v809 = @"PreparedDecideByMode";
  v198 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v809,  &v808,  1LL));
  v841[15] = v198;
  v840[16] = @"UpdateFailedFallback";
  v806[0] = v2;
  v806[1] = v3;
  v807[0] = @"Canceling";
  v807[1] = @"AttemptFailedRemoveAll";
  v197 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v807,  v806,  2LL));
  v841[16] = v197;
  v840[17] = @"UpdateFailedDone";
  v804[0] = v2;
  v804[1] = v3;
  v805[0] = @"Canceling";
  v805[1] = @"AttemptFailedRemoveAll";
  v196 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v805,  v804,  2LL));
  v841[17] = v196;
  v840[18] = v412;
  uint64_t v802 = v3;
  uint64_t v803 = v402;
  v195 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v803,  &v802,  1LL));
  v841[18] = v195;
  v840[19] = v414;
  v800[0] = v2;
  v800[1] = v3;
  v801[0] = @"Canceling";
  v801[1] = @"AttemptFailedRemoveAll";
  v194 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v801,  v800,  2LL));
  v841[19] = v194;
  v840[20] = v408;
  v798[0] = v2;
  v798[1] = v3;
  v799[0] = v410;
  v799[1] = @"ReportAwaitingReboot";
  v193 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v799,  v798,  2LL));
  v841[20] = v193;
  v840[21] = @"UpdatePreparedAuto";
  v796[0] = v2;
  v796[1] = v3;
  v797[0] = @"WaitingToAutoInstall";
  v797[1] = @"ReportWaitAuto";
  v192 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v797,  v796,  2LL));
  v841[21] = v192;
  v840[22] = @"UpdatePreparedAtTarget";
  v794[0] = v2;
  v794[1] = v3;
  v795[0] = v406;
  v795[1] = v190;
  v191 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v795,  v794,  2LL));
  v841[22] = v191;
  v840[23] = @"UpdatePreparedInstall";
  v792[0] = v2;
  v792[1] = v3;
  v793[0] = @"VerifyingLatest";
  v793[1] = @"VerifyLatest";
  v189 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v793,  v792,  2LL));
  v841[23] = v189;
  v840[24] = @"UpdatePreparedImmediate";
  uint64_t v790 = v2;
  uint64_t v791 = v398;
  v188 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v791,  &v790,  1LL));
  v841[24] = v188;
  v187 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v841,  v840,  25LL));
  v1209[10] = v187;
  v1208[11] = v406;
  v788[0] = @"SetModeToManual";
  uint64_t v786 = v3;
  uint64_t v787 = v4;
  v186 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v787,  &v786,  1LL));
  v789[0] = v186;
  v788[1] = @"SetModeToAuto";
  v784[0] = v2;
  v784[1] = v3;
  v785[0] = @"WaitingToAutoInstall";
  v785[1] = @"ReportWaitAuto";
  v185 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v785,  v784,  2LL));
  v789[1] = v185;
  v788[2] = @"ScanFoundNewerUpdate";
  v782[0] = v2;
  v782[1] = v3;
  v783[0] = @"AbandoningOlder";
  v783[1] = @"SetFoundCancelUpdate";
  v184 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v783,  v782,  2LL));
  v789[2] = v184;
  v788[3] = @"ScanFoundSameUpdate";
  uint64_t v780 = v3;
  v781 = @"PersistScanState";
  v183 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v781,  &v780,  1LL));
  v789[3] = v183;
  v788[4] = @"ScanFoundNewerImmediate";
  v778[0] = v2;
  v778[1] = v3;
  v779[0] = @"AbandoningOlder";
  v779[1] = @"SetFoundCancelImmediate";
  v182 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v779,  v778,  2LL));
  v789[4] = v182;
  v788[5] = @"ScanFoundSameImmediate";
  v776[0] = v2;
  v776[1] = v3;
  v777[0] = v398;
  v777[1] = @"ImmediateTargetInstalled";
  v181 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v777,  v776,  2LL));
  v789[5] = v181;
  v788[6] = @"ScanNoAvailableUpdate";
  v774[0] = v2;
  v774[1] = v3;
  v775[0] = @"Canceling";
  v775[1] = @"ClearFoundCancelUpdate";
  v180 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v775,  v774,  2LL));
  v789[6] = v180;
  v788[7] = @"UserDidAcceptTerms";
  uint64_t v772 = v3;
  v773 = @"UserAcceptedTerms";
  v179 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v773,  &v772,  1LL));
  v789[7] = v179;
  v788[8] = @"UseSSOToken";
  uint64_t v770 = v3;
  v771 = @"UseCredentialsToPersonalize";
  v178 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v771,  &v770,  1LL));
  v789[8] = v178;
  v788[9] = @"UseCredentials";
  uint64_t v768 = v3;
  v769 = @"UseCredentialsToPersonalize";
  v177 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v769,  &v768,  1LL));
  v789[9] = v177;
  v788[10] = @"InstallUpdate";
  uint64_t v766 = v3;
  v767 = @"DecideTermsAccepted";
  v176 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v767,  &v766,  1LL));
  v789[10] = v176;
  v788[11] = @"RemoveUpdate";
  v764[0] = v2;
  v764[1] = v3;
  v765[0] = @"Canceling";
  v765[1] = @"CancelUpdateTrackPurge";
  v175 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v765,  v764,  2LL));
  v789[11] = v175;
  v788[12] = @"SetDoDownloadAndPrep";
  uint64_t v762 = v3;
  uint64_t v763 = v4;
  v174 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v763,  &v762,  1LL));
  v789[12] = v174;
  v788[13] = @"InstallTermsAccepted";
  v760[0] = v2;
  v760[1] = v3;
  v761[0] = @"VerifyingLatest";
  v761[1] = @"VerifyLatest";
  v173 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v761,  v760,  2LL));
  v789[13] = v173;
  v172 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v789,  v788,  14LL));
  v1209[11] = v172;
  v1208[12] = @"WaitingToAutoInstall";
  v758[0] = @"SetModeToManual";
  v756[0] = v2;
  v756[1] = v3;
  v757[0] = v406;
  v757[1] = @"StopAuto";
  v171 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v757,  v756,  2LL));
  v759[0] = v171;
  v758[1] = @"SetModeToAuto";
  uint64_t v754 = v3;
  uint64_t v755 = v4;
  v170 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v755,  &v754,  1LL));
  v759[1] = v170;
  v758[2] = @"ScanFoundNewerUpdate";
  v752[0] = v2;
  v752[1] = v3;
  v753[0] = @"AbandoningOlder";
  v753[1] = @"SetFoundCancelStopAuto";
  v169 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v753,  v752,  2LL));
  v759[2] = v169;
  v758[3] = @"ScanFoundDiffModeUpdate";
  v750[0] = v2;
  v750[1] = v3;
  v751[0] = @"AbandoningOlder";
  v751[1] = @"SetFoundCancelStopAuto";
  v168 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v751,  v750,  2LL));
  v759[3] = v168;
  v758[4] = @"ScanFoundSameUpdate";
  uint64_t v748 = v3;
  v749 = @"PersistScanState";
  v167 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v749,  &v748,  1LL));
  v759[4] = v167;
  v758[5] = @"ScanFoundNewerImmediate";
  v746[0] = v2;
  v746[1] = v3;
  v747[0] = @"AbandoningOlder";
  v747[1] = @"SetFoundCancelStopImmediate";
  v166 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v747,  v746,  2LL));
  v759[5] = v166;
  v758[6] = @"ScanFoundSameImmediate";
  v744[0] = v2;
  v744[1] = v3;
  v745[0] = v398;
  v745[1] = @"StopImmediateTargetInstalled";
  v165 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v745,  v744,  2LL));
  v759[6] = v165;
  v758[7] = @"ScanNoAvailableUpdate";
  v742[0] = v2;
  v742[1] = v3;
  v743[0] = @"Canceling";
  v743[1] = @"ClearFoundCancelStopAuto";
  v164 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v743,  v742,  2LL));
  v759[7] = v164;
  v758[8] = @"UserDidAcceptTerms";
  uint64_t v740 = v3;
  v741 = @"UserAcceptedTerms";
  v163 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v741,  &v740,  1LL));
  v759[8] = v163;
  v758[9] = @"UseSSOToken";
  uint64_t v738 = v3;
  v739 = @"UseCredentialsToPersonalize";
  v162 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v739,  &v738,  1LL));
  v759[9] = v162;
  v758[10] = @"UseCredentials";
  uint64_t v736 = v3;
  v737 = @"UseCredentialsToPersonalize";
  v161 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v737,  &v736,  1LL));
  v759[10] = v161;
  v758[11] = @"InstallUpdate";
  uint64_t v734 = v3;
  v735 = @"DecideTermsAccepted";
  v160 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v735,  &v734,  1LL));
  v759[11] = v160;
  v758[12] = @"RemoveUpdate";
  v732[0] = v2;
  v732[1] = v3;
  v733[0] = @"Canceling";
  v733[1] = @"CancelUpdateStopAutoTrackPurge";
  v159 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v733,  v732,  2LL));
  v759[12] = v159;
  v758[13] = @"SetDoDownloadAndPrep";
  uint64_t v730 = v3;
  uint64_t v731 = v4;
  v158 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v731,  &v730,  1LL));
  v759[13] = v158;
  v758[14] = @"AutoInstallTriggered";
  uint64_t v728 = v3;
  v729 = @"DecideAutoFired";
  v157 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v729,  &v728,  1LL));
  v759[14] = v157;
  v758[15] = @"AutoInstallExpired";
  uint64_t v726 = v3;
  v727 = @"LogExpiredDecideWaitAuto";
  v156 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v727,  &v726,  1LL));
  v759[15] = v156;
  v758[16] = @"InstallTermsAccepted";
  v724[0] = v2;
  v724[1] = v3;
  v725[0] = @"VerifyingLatest";
  v725[1] = @"VerifyLatestStopAuto";
  v155 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v725,  v724,  2LL));
  v759[16] = v155;
  v758[17] = @"AutoFiredTermsAccepted";
  v722[0] = v2;
  v722[1] = v3;
  v723[0] = @"VerifyingLatest";
  v723[1] = @"VerifyLatest";
  v154 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v723,  v722,  2LL));
  v759[17] = v154;
  v758[18] = @"AutoFiredNotYetAccepted";
  uint64_t v720 = v3;
  v721 = @"ReportWaitAuto";
  v153 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v721,  &v720,  1LL));
  v759[18] = v153;
  v152 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v759,  v758,  19LL));
  v1209[12] = v152;
  v1208[13] = @"AbandoningOlder";
  v718[0] = @"SetModeToManual";
  uint64_t v716 = v3;
  uint64_t v717 = v4;
  v151 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v717,  &v716,  1LL));
  v719[0] = v151;
  v718[1] = @"SetModeToAuto";
  uint64_t v714 = v3;
  uint64_t v715 = v4;
  v150 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v715,  &v714,  1LL));
  v719[1] = v150;
  v718[2] = @"ScanFoundNewerUpdate";
  uint64_t v712 = v3;
  v713 = @"SetFound";
  v149 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v713,  &v712,  1LL));
  v719[2] = v149;
  v718[3] = @"ScanFoundDiffModeUpdate";
  uint64_t v710 = v3;
  v711 = @"SetFound";
  v148 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v711,  &v710,  1LL));
  v719[3] = v148;
  v718[4] = @"ScanFoundSameUpdate";
  uint64_t v708 = v3;
  v709 = @"SetFound";
  v147 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v709,  &v708,  1LL));
  v719[4] = v147;
  v718[5] = @"ScanFoundNewerImmediate";
  uint64_t v706 = v3;
  v707 = @"SetFoundImmediate";
  v146 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v707,  &v706,  1LL));
  v719[5] = v146;
  v718[6] = @"ScanFoundSameImmediate";
  uint64_t v704 = v3;
  v705 = @"SetFoundImmediate";
  v145 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v705,  &v704,  1LL));
  v719[6] = v145;
  v718[7] = @"ScanNoAvailableUpdate";
  v702[0] = v2;
  v702[1] = v3;
  v703[0] = @"Canceling";
  v703[1] = @"ClearFound";
  v144 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v703,  v702,  2LL));
  v719[7] = v144;
  v718[8] = @"UserDidAcceptTerms";
  uint64_t v700 = v3;
  v701 = @"UserAcceptedTerms";
  v143 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v701,  &v700,  1LL));
  v719[8] = v143;
  v718[9] = @"UseSSOToken";
  uint64_t v698 = v3;
  v699 = @"UseCredentialsToPersonalize";
  v142 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v699,  &v698,  1LL));
  v719[9] = v142;
  v718[10] = @"UseCredentials";
  uint64_t v696 = v3;
  v697 = @"UseCredentialsToPersonalize";
  v141 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v697,  &v696,  1LL));
  v719[10] = v141;
  v718[11] = @"InstallUpdate";
  uint64_t v694 = v3;
  v695 = @"TargetInstalled";
  v140 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v695,  &v694,  1LL));
  v719[11] = v140;
  v718[12] = @"RemoveUpdate";
  v692[0] = v2;
  v692[1] = v3;
  v693[0] = @"Canceling";
  v693[1] = @"TrackPurge";
  v139 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v693,  v692,  2LL));
  v719[12] = v139;
  v718[13] = @"SetDoDownloadAndPrep";
  uint64_t v690 = v3;
  uint64_t v691 = v4;
  v138 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v691,  &v690,  1LL));
  v719[13] = v138;
  v718[14] = @"UpdateProgress";
  uint64_t v688 = v3;
  uint64_t v689 = v4;
  v137 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v689,  &v688,  1LL));
  v719[14] = v137;
  v718[15] = v404;
  uint64_t v686 = v3;
  uint64_t v687 = v4;
  v136 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v687,  &v686,  1LL));
  v719[15] = v136;
  v718[16] = @"UpdateFailedFallback";
  uint64_t v684 = v3;
  uint64_t v685 = v4;
  v135 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v685,  &v684,  1LL));
  v719[16] = v135;
  v718[17] = @"UpdateFailedDone";
  uint64_t v682 = v3;
  uint64_t v683 = v4;
  v134 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v683,  &v682,  1LL));
  v719[17] = v134;
  v718[18] = @"UpdateCanceled";
  uint64_t v680 = v3;
  v681 = @"DecideAdoptLatestFound";
  v133 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v681,  &v680,  1LL));
  v719[18] = v133;
  v718[19] = @"AdoptLatestFound";
  v678[0] = v2;
  v678[1] = v3;
  v679[0] = @"UpdatingToPrimary";
  v679[1] = @"AdoptLatestFound";
  v132 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v679,  v678,  2LL));
  v719[19] = v132;
  v718[20] = @"WaitToAdoptLatestFound";
  uint64_t v676 = v2;
  v677 = @"UpdateFound";
  v131 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v677,  &v676,  1LL));
  v719[20] = v131;
  v718[21] = @"DoNotAdoptLatestFound";
  uint64_t v674 = v2;
  uint64_t v675 = v400;
  v130 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v675,  &v674,  1LL));
  v719[21] = v130;
  v129 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v719,  v718,  22LL));
  v1209[13] = v129;
  v1208[14] = @"Canceling";
  v672[0] = @"SetModeToManual";
  uint64_t v670 = v3;
  uint64_t v671 = v4;
  v128 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v671,  &v670,  1LL));
  v673[0] = v128;
  v672[1] = @"SetModeToAuto";
  uint64_t v668 = v3;
  uint64_t v669 = v4;
  v127 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v669,  &v668,  1LL));
  v673[1] = v127;
  v672[2] = @"ScanFoundNewerUpdate";
  uint64_t v666 = v3;
  v667 = @"SetFound";
  v126 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v667,  &v666,  1LL));
  v673[2] = v126;
  v672[3] = @"ScanFoundDiffModeUpdate";
  uint64_t v664 = v3;
  v665 = @"SetFound";
  v125 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v665,  &v664,  1LL));
  v673[3] = v125;
  v672[4] = @"ScanFoundSameUpdate";
  uint64_t v662 = v3;
  v663 = @"SetFound";
  v124 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v663,  &v662,  1LL));
  v673[4] = v124;
  v672[5] = @"ScanFoundNewerImmediate";
  uint64_t v660 = v3;
  v661 = @"SetFoundImmediate";
  v123 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v661,  &v660,  1LL));
  v673[5] = v123;
  v672[6] = @"ScanFoundSameImmediate";
  uint64_t v658 = v3;
  v659 = @"SetFoundImmediate";
  v122 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v659,  &v658,  1LL));
  v673[6] = v122;
  v672[7] = @"ScanNoAvailableUpdate";
  uint64_t v656 = v3;
  v657 = @"ClearFound";
  v121 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v657,  &v656,  1LL));
  v673[7] = v121;
  v672[8] = @"UserDidAcceptTerms";
  uint64_t v654 = v3;
  v655 = @"RequestIgnoredNoUpdate";
  v120 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v655,  &v654,  1LL));
  v673[8] = v120;
  v672[9] = @"UseSSOToken";
  uint64_t v652 = v3;
  v653 = @"RequestIgnoredNoUpdate";
  v119 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v653,  &v652,  1LL));
  v673[9] = v119;
  v672[10] = @"UseCredentials";
  uint64_t v650 = v3;
  v651 = @"RequestIgnoredNoUpdate";
  v118 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v651,  &v650,  1LL));
  v673[10] = v118;
  v672[11] = @"InstallUpdate";
  uint64_t v648 = v3;
  v649 = @"LogInstallCanceling";
  v117 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v649,  &v648,  1LL));
  v673[11] = v117;
  v672[12] = @"RemoveUpdate";
  uint64_t v646 = v3;
  v647 = @"TrackPurge";
  v116 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v647,  &v646,  1LL));
  v673[12] = v116;
  v672[13] = @"SetDoDownloadAndPrep";
  uint64_t v644 = v3;
  uint64_t v645 = v4;
  v115 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v645,  &v644,  1LL));
  v673[13] = v115;
  v672[14] = @"ScanVerifyFoundLatest";
  uint64_t v642 = v3;
  v643 = @"RemoveAll";
  v114 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v643,  &v642,  1LL));
  v673[14] = v114;
  v672[15] = @"ScanVerifyFoundNewer";
  uint64_t v640 = v3;
  v641 = @"RemoveAll";
  v113 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v641,  &v640,  1LL));
  v673[15] = v113;
  v672[16] = @"ScanVerifyFailedManual";
  uint64_t v638 = v3;
  v639 = @"RemoveAll";
  v112 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v639,  &v638,  1LL));
  v673[16] = v112;
  v672[17] = @"ScanVerifyFailedAuto";
  uint64_t v636 = v3;
  v637 = @"RemoveAll";
  v111 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v637,  &v636,  1LL));
  v673[17] = v111;
  v672[18] = @"ScanContentPurged";
  uint64_t v634 = v3;
  v635 = @"ScanPurgedDecideNewer";
  v110 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v635,  &v634,  1LL));
  v673[18] = v110;
  v672[19] = @"UpdateProgress";
  uint64_t v632 = v3;
  uint64_t v633 = v4;
  v109 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v633,  &v632,  1LL));
  v673[19] = v109;
  v672[20] = v404;
  uint64_t v630 = v3;
  uint64_t v631 = v4;
  v108 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v631,  &v630,  1LL));
  v673[20] = v108;
  v672[21] = @"UpdateFailedFallback";
  uint64_t v628 = v3;
  uint64_t v629 = v4;
  v107 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v629,  &v628,  1LL));
  v673[21] = v107;
  v672[22] = @"UpdateFailedDone";
  uint64_t v626 = v3;
  uint64_t v627 = v4;
  v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v627,  &v626,  1LL));
  v673[22] = v106;
  v672[23] = v412;
  uint64_t v624 = v3;
  uint64_t v625 = v4;
  v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v625,  &v624,  1LL));
  v673[23] = v105;
  v672[24] = v414;
  uint64_t v622 = v3;
  v623 = @"ApplyFailedDecideByMode";
  v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v623,  &v622,  1LL));
  v673[24] = v104;
  v672[25] = @"ApplyFailedManual";
  uint64_t v620 = v3;
  v621 = @"RemoveAll";
  v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v621,  &v620,  1LL));
  v673[25] = v103;
  v672[26] = @"ApplyFailedAuto";
  uint64_t v618 = v3;
  v619 = @"RemoveAll";
  v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v619,  &v618,  1LL));
  v673[26] = v102;
  v672[27] = @"ApplyFailedNoRetry";
  uint64_t v616 = v3;
  v617 = @"RemoveAll";
  v101 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v617,  &v616,  1LL));
  v673[27] = v101;
  v672[28] = v408;
  v614[0] = v2;
  v614[1] = v3;
  v615[0] = v410;
  v615[1] = @"ReportAwaitingReboot";
  v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v615,  v614,  2LL));
  v673[28] = v100;
  v672[29] = @"UpdateCanceled";
  uint64_t v612 = v3;
  v613 = @"RemoveAll";
  v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v613,  &v612,  1LL));
  v673[29] = v99;
  v672[30] = @"PurgeRemovedSUContent";
  uint64_t v610 = v3;
  v611 = @"SUContentPurgedDecideNewer";
  v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v611,  &v610,  1LL));
  v673[30] = v98;
  v672[31] = @"UpdateRemovedNoNewerUpdate";
  uint64_t v608 = v2;
  uint64_t v609 = v400;
  v401 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v609,  &v608,  1LL));
  v673[31] = v401;
  v672[32] = @"UpdateRemovedNewerAvailable";
  v606[0] = v2;
  v606[1] = v3;
  v607[0] = @"UpdatingToPrimary";
  v607[1] = @"PersistScanState";
  v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v607,  v606,  2LL));
  v673[32] = v97;
  v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v673,  v672,  33LL));
  v1209[14] = v96;
  v1208[15] = @"VerifyingLatest";
  v604[0] = @"SetModeToManual";
  uint64_t v602 = v3;
  uint64_t v603 = v4;
  v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v603,  &v602,  1LL));
  v605[0] = v95;
  v604[1] = @"SetModeToAuto";
  uint64_t v600 = v3;
  uint64_t v601 = v4;
  v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v601,  &v600,  1LL));
  v605[1] = v94;
  v604[2] = @"ScanFoundNewerUpdate";
  uint64_t v598 = v3;
  v599 = @"PersistScanState";
  v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v599,  &v598,  1LL));
  v605[2] = v93;
  v604[3] = @"ScanFoundDiffModeUpdate";
  uint64_t v596 = v3;
  v597 = @"PersistScanState";
  v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v597,  &v596,  1LL));
  v605[3] = v92;
  v604[4] = @"ScanFoundSameUpdate";
  uint64_t v594 = v3;
  v595 = @"PersistScanState";
  v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v595,  &v594,  1LL));
  v605[4] = v91;
  v604[5] = @"ScanFoundNewerImmediate";
  uint64_t v592 = v3;
  v593 = @"PersistScanState";
  v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v593,  &v592,  1LL));
  v605[5] = v90;
  v604[6] = @"ScanFoundSameImmediate";
  uint64_t v590 = v3;
  v591 = @"PersistScanState";
  v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v591,  &v590,  1LL));
  v605[6] = v89;
  v604[7] = @"ScanNoAvailableUpdate";
  uint64_t v588 = v3;
  uint64_t v589 = v4;
  v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v589,  &v588,  1LL));
  v605[7] = v88;
  v604[8] = @"UserDidAcceptTerms";
  uint64_t v586 = v3;
  v587 = @"UserAcceptedTerms";
  v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v587,  &v586,  1LL));
  v605[8] = v87;
  v604[9] = @"UseSSOToken";
  uint64_t v584 = v3;
  v585 = @"UseCredentialsToPersonalize";
  v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v585,  &v584,  1LL));
  v605[9] = v86;
  v604[10] = @"UseCredentials";
  uint64_t v582 = v3;
  v583 = @"UseCredentialsToPersonalize";
  v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v583,  &v582,  1LL));
  v605[10] = v85;
  v604[11] = @"InstallUpdate";
  uint64_t v580 = v3;
  uint64_t v581 = v4;
  v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v581,  &v580,  1LL));
  v605[11] = v84;
  v604[12] = @"RemoveUpdate";
  v578[0] = v2;
  v578[1] = v3;
  v579[0] = @"Canceling";
  v579[1] = @"TrackPurge";
  v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v579,  v578,  2LL));
  v605[12] = v83;
  v604[13] = @"SetDoDownloadAndPrep";
  uint64_t v576 = v3;
  uint64_t v577 = v4;
  v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v577,  &v576,  1LL));
  v605[13] = v82;
  v604[14] = @"ScanVerifyFoundLatest";
  v574[0] = v2;
  v574[1] = v3;
  v575[0] = v398;
  v575[1] = @"TargetInstalled";
  v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v575,  v574,  2LL));
  v605[14] = v81;
  v604[15] = @"ScanVerifyFoundNewer";
  v572[0] = v2;
  v572[1] = v3;
  v573[0] = @"CollectingLatestDocMetadata";
  v573[1] = @"SetFoundCollectDoc";
  v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v573,  v572,  2LL));
  v605[15] = v80;
  v604[16] = @"ScanVerifyFailedManual";
  v570[0] = v2;
  v570[1] = v3;
  v571[0] = v406;
  v571[1] = @"ReportVerifyFailed";
  v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v571,  v570,  2LL));
  v605[16] = v79;
  v604[17] = @"ScanVerifyFailedAuto";
  v568[0] = v2;
  v568[1] = v3;
  v569[0] = @"WaitingToAutoInstall";
  v569[1] = @"ReportVerifyFailedWaitAuto";
  v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v569,  v568,  2LL));
  v605[17] = v78;
  v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v605,  v604,  18LL));
  v1209[15] = v77;
  v1208[16] = @"CollectingLatestDocMetadata";
  v566[0] = @"SetModeToManual";
  uint64_t v564 = v3;
  uint64_t v565 = v4;
  v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v565,  &v564,  1LL));
  v567[0] = v76;
  v566[1] = @"SetModeToAuto";
  uint64_t v562 = v3;
  uint64_t v563 = v4;
  v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v563,  &v562,  1LL));
  v567[1] = v75;
  v566[2] = @"ScanFoundNewerUpdate";
  uint64_t v560 = v3;
  v561 = @"PersistScanState";
  v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v561,  &v560,  1LL));
  v567[2] = v74;
  v566[3] = @"ScanFoundDiffModeUpdate";
  uint64_t v558 = v3;
  v559 = @"PersistScanState";
  v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v559,  &v558,  1LL));
  v567[3] = v73;
  v566[4] = @"ScanFoundSameUpdate";
  uint64_t v556 = v3;
  v557 = @"PersistScanState";
  v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v557,  &v556,  1LL));
  v567[4] = v72;
  v566[5] = @"ScanFoundNewerImmediate";
  uint64_t v554 = v3;
  v555 = @"PersistScanState";
  v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v555,  &v554,  1LL));
  v567[5] = v71;
  v566[6] = @"ScanFoundSameImmediate";
  uint64_t v552 = v3;
  v553 = @"PersistScanState";
  v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v553,  &v552,  1LL));
  v567[6] = v70;
  v566[7] = @"ScanNoAvailableUpdate";
  v550[0] = v2;
  v550[1] = v3;
  v551[0] = @"Canceling";
  v551[1] = @"ClearFound";
  v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v551,  v550,  2LL));
  v567[7] = v69;
  v566[8] = @"UserDidAcceptTerms";
  uint64_t v548 = v3;
  v549 = @"UserAcceptedTerms";
  v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v549,  &v548,  1LL));
  v567[8] = v68;
  v566[9] = @"UseSSOToken";
  uint64_t v546 = v3;
  v547 = @"UseCredentialsToPersonalize";
  v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v547,  &v546,  1LL));
  v567[9] = v67;
  v566[10] = @"UseCredentials";
  uint64_t v544 = v3;
  v545 = @"UseCredentialsToPersonalize";
  v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v545,  &v544,  1LL));
  v567[10] = v66;
  v566[11] = @"InstallUpdate";
  uint64_t v542 = v3;
  v543 = @"TargetInstalled";
  v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v543,  &v542,  1LL));
  v567[11] = v65;
  v566[12] = @"RemoveUpdate";
  v540[0] = v2;
  v540[1] = v3;
  v541[0] = @"Canceling";
  v541[1] = @"ClearFoundTrackPurge";
  v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v541,  v540,  2LL));
  v567[12] = v64;
  v566[13] = @"SetDoDownloadAndPrep";
  uint64_t v538 = v3;
  uint64_t v539 = v4;
  v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v539,  &v538,  1LL));
  v567[13] = v63;
  v566[14] = @"ScanCollectDocSuccess";
  v536[0] = v2;
  v536[1] = v3;
  v537[0] = @"AbandoningOlder";
  v537[1] = @"AdoptDocCancelUpdate";
  v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v537,  v536,  2LL));
  v567[14] = v62;
  v566[15] = @"ScanCollectDocFailed";
  v534[0] = v2;
  v534[1] = v3;
  v535[0] = @"Canceling";
  v535[1] = @"RemoveAll";
  v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v535,  v534,  2LL));
  v567[15] = v61;
  v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v567,  v566,  16LL));
  v1209[16] = v60;
  v1208[17] = v398;
  v532[0] = @"SetModeToManual";
  uint64_t v530 = v3;
  uint64_t v531 = v4;
  v399 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v531,  &v530,  1LL));
  v533[0] = v399;
  v532[1] = @"SetModeToAuto";
  uint64_t v528 = v3;
  uint64_t v529 = v4;
  v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v529,  &v528,  1LL));
  v533[1] = v59;
  v532[2] = @"ScanFoundNewerUpdate";
  v526[0] = v2;
  v526[1] = v3;
  v527[0] = @"ApplyingPlannedAbandon";
  v527[1] = @"AttemptFailedSetFound";
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v527,  v526,  2LL));
  v533[2] = v58;
  v532[3] = @"ScanFoundDiffModeUpdate";
  v524[0] = v2;
  v524[1] = v3;
  v525[0] = @"ApplyingPlannedAbandon";
  v525[1] = @"AttemptFailedSetFound";
  v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v525,  v524,  2LL));
  v533[3] = v57;
  v532[4] = @"ScanFoundSameUpdate";
  uint64_t v522 = v3;
  uint64_t v523 = v4;
  v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v523,  &v522,  1LL));
  v533[4] = v56;
  v532[5] = @"ScanFoundNewerImmediate";
  v520[0] = v2;
  v520[1] = v3;
  v521[0] = @"ApplyingPlannedAbandon";
  v521[1] = @"AttemptFailedSetFoundImmediate";
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v521,  v520,  2LL));
  v533[5] = v55;
  v532[6] = @"ScanFoundSameImmediate";
  uint64_t v518 = v3;
  uint64_t v519 = v4;
  v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v519,  &v518,  1LL));
  v533[6] = v54;
  v532[7] = @"ScanNoAvailableUpdate";
  v516[0] = v2;
  v516[1] = v3;
  v517[0] = @"ApplyingPlannedAbandon";
  v517[1] = @"AttemptFailedClearFound";
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v517,  v516,  2LL));
  v533[7] = v53;
  v532[8] = @"UserDidAcceptTerms";
  uint64_t v514 = v3;
  uint64_t v515 = v4;
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v515,  &v514,  1LL));
  v533[8] = v52;
  v532[9] = @"UseSSOToken";
  uint64_t v512 = v3;
  uint64_t v513 = v4;
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v513,  &v512,  1LL));
  v533[9] = v51;
  v532[10] = @"UseCredentials";
  uint64_t v510 = v3;
  uint64_t v511 = v4;
  v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v511,  &v510,  1LL));
  v533[10] = v50;
  v532[11] = @"InstallUpdate";
  uint64_t v508 = v3;
  uint64_t v509 = v4;
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v509,  &v508,  1LL));
  v533[11] = v49;
  v532[12] = @"RemoveUpdate";
  v506[0] = v2;
  v506[1] = v3;
  v507[0] = @"ApplyingPlannedAbandon";
  v507[1] = @"AttemptFailedTrackPurge";
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v507,  v506,  2LL));
  v533[12] = v48;
  v532[13] = @"SetDoDownloadAndPrep";
  uint64_t v504 = v3;
  uint64_t v505 = v4;
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v505,  &v504,  1LL));
  v533[13] = v47;
  v532[14] = @"UpdateProgress";
  uint64_t v502 = v3;
  uint64_t v503 = v4;
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v503,  &v502,  1LL));
  v533[14] = v46;
  v532[15] = v404;
  uint64_t v500 = v3;
  uint64_t v501 = v4;
  v405 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v501,  &v500,  1LL));
  v533[15] = v405;
  v532[16] = @"UpdateFailedFallback";
  uint64_t v498 = v3;
  v499 = @"ApplyFailedDecideByMode";
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v499,  &v498,  1LL));
  v533[16] = v45;
  v532[17] = @"UpdateFailedDone";
  uint64_t v496 = v3;
  v497 = @"ApplyFailedDecideByMode";
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v497,  &v496,  1LL));
  v533[17] = v44;
  v532[18] = v412;
  uint64_t v494 = v3;
  uint64_t v495 = v402;
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v495,  &v494,  1LL));
  v533[18] = v43;
  v532[19] = v414;
  uint64_t v492 = v3;
  v493 = @"ApplyFailedDecideByMode";
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v493,  &v492,  1LL));
  v533[19] = v42;
  v532[20] = @"ApplyFailedManual";
  v490[0] = v2;
  v490[1] = v3;
  v491[0] = v406;
  v491[1] = kSU_A_ReportApplyFailed;
  v407 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v491,  v490,  2LL));
  v533[20] = v407;
  v532[21] = @"ApplyFailedAuto";
  v488[0] = v2;
  v488[1] = v3;
  v489[0] = @"WaitingToAutoInstall";
  v489[1] = @"ReportApplyFailedWaitAuto";
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v489,  v488,  2LL));
  v533[21] = v41;
  v532[22] = @"ApplyFailedNoRetry";
  v486[0] = v2;
  v486[1] = v3;
  v487[0] = @"Canceling";
  v487[1] = @"ReportApplyFailedRemoveAll";
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v487,  v486,  2LL));
  v533[22] = v40;
  v532[23] = v408;
  v484[0] = v2;
  v484[1] = v3;
  v485[0] = v410;
  v485[1] = @"ReportAwaitingReboot";
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v485,  v484,  2LL));
  v533[23] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v533,  v532,  24LL));
  v1209[17] = v38;
  v1208[18] = @"ApplyingPlannedAbandon";
  v482[0] = @"SetModeToManual";
  uint64_t v480 = v3;
  uint64_t v481 = v4;
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v481,  &v480,  1LL));
  v483[0] = v37;
  v482[1] = @"SetModeToAuto";
  uint64_t v478 = v3;
  uint64_t v479 = v4;
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v479,  &v478,  1LL));
  v483[1] = v36;
  v482[2] = @"ScanFoundNewerUpdate";
  uint64_t v476 = v3;
  v477 = @"AttemptFailedSetFound";
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v477,  &v476,  1LL));
  v483[2] = v35;
  v482[3] = @"ScanFoundDiffModeUpdate";
  uint64_t v474 = v3;
  v475 = @"AttemptFailedSetFound";
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v475,  &v474,  1LL));
  v483[3] = v34;
  v482[4] = @"ScanFoundSameUpdate";
  uint64_t v472 = v3;
  v473 = @"PersistScanState";
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v473,  &v472,  1LL));
  v483[4] = v33;
  v482[5] = @"ScanFoundNewerImmediate";
  uint64_t v470 = v3;
  v471 = @"AttemptFailedSetFoundImmediate";
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v471,  &v470,  1LL));
  v483[5] = v32;
  v482[6] = @"ScanFoundSameImmediate";
  uint64_t v468 = v3;
  v469 = @"AttemptFailedSetFoundImmediate";
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v469,  &v468,  1LL));
  v483[6] = v31;
  v482[7] = @"ScanNoAvailableUpdate";
  uint64_t v466 = v3;
  v467 = @"AttemptFailedClearFound";
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v467,  &v466,  1LL));
  v483[7] = v30;
  v482[8] = @"UserDidAcceptTerms";
  uint64_t v464 = v3;
  uint64_t v465 = v4;
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v465,  &v464,  1LL));
  v483[8] = v29;
  v482[9] = @"UseSSOToken";
  uint64_t v462 = v3;
  uint64_t v463 = v4;
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v463,  &v462,  1LL));
  v483[9] = v28;
  v482[10] = @"UseCredentials";
  uint64_t v460 = v3;
  uint64_t v461 = v4;
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v461,  &v460,  1LL));
  v483[10] = v27;
  v482[11] = @"InstallUpdate";
  uint64_t v458 = v3;
  uint64_t v459 = v4;
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v459,  &v458,  1LL));
  v483[11] = v26;
  v482[12] = @"RemoveUpdate";
  uint64_t v456 = v3;
  v457 = @"AttemptFailedTrackPurge";
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v457,  &v456,  1LL));
  v483[12] = v25;
  v482[13] = @"SetDoDownloadAndPrep";
  uint64_t v454 = v3;
  uint64_t v455 = v4;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v455,  &v454,  1LL));
  v483[13] = v24;
  v482[14] = @"UpdateProgress";
  uint64_t v452 = v3;
  uint64_t v453 = v4;
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v453,  &v452,  1LL));
  v483[14] = v23;
  v482[15] = v412;
  uint64_t v450 = v3;
  uint64_t v451 = v402;
  v413 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v451,  &v450,  1LL));
  v483[15] = v413;
  v482[16] = v414;
  v448[0] = v2;
  v448[1] = v3;
  v449[0] = @"Canceling";
  v449[1] = @"ApplyFailedRemoveAll";
  v403 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v449,  v448,  2LL));
  v483[16] = v403;
  v482[17] = v408;
  v446[0] = v2;
  v446[1] = v3;
  v447[0] = v410;
  v447[1] = @"ReportAwaitingReboot";
  v409 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v447,  v446,  2LL));
  v483[17] = v409;
  v397 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v483,  v482,  18LL));
  v1209[18] = v397;
  v1208[19] = v410;
  v444[0] = @"SetModeToManual";
  uint64_t v442 = v3;
  uint64_t v443 = v4;
  v411 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v443,  &v442,  1LL));
  v445[0] = v411;
  v444[1] = @"SetModeToAuto";
  uint64_t v440 = v3;
  uint64_t v441 = v4;
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v441,  &v440,  1LL));
  v445[1] = v22;
  v444[2] = @"ScanFoundNewerUpdate";
  uint64_t v438 = v3;
  uint64_t v439 = v4;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v439,  &v438,  1LL));
  v445[2] = v21;
  v444[3] = @"ScanFoundDiffModeUpdate";
  uint64_t v436 = v3;
  uint64_t v437 = v4;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v437,  &v436,  1LL));
  v445[3] = v20;
  v444[4] = @"ScanFoundSameUpdate";
  uint64_t v434 = v3;
  uint64_t v435 = v4;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v435,  &v434,  1LL));
  v445[4] = v19;
  v444[5] = @"ScanFoundNewerImmediate";
  uint64_t v432 = v3;
  uint64_t v433 = v4;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v433,  &v432,  1LL));
  v445[5] = v18;
  v444[6] = @"ScanFoundSameImmediate";
  uint64_t v430 = v3;
  uint64_t v431 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v431,  &v430,  1LL));
  v445[6] = v7;
  v444[7] = @"ScanNoAvailableUpdate";
  uint64_t v428 = v3;
  uint64_t v429 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v429,  &v428,  1LL));
  v445[7] = v8;
  v444[8] = @"UserDidAcceptTerms";
  uint64_t v426 = v3;
  uint64_t v427 = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v427,  &v426,  1LL));
  v445[8] = v9;
  v444[9] = @"UseSSOToken";
  uint64_t v424 = v3;
  uint64_t v425 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v425,  &v424,  1LL));
  v445[9] = v10;
  v444[10] = @"UseCredentials";
  uint64_t v422 = v3;
  uint64_t v423 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v423,  &v422,  1LL));
  v445[10] = v11;
  v444[11] = @"InstallUpdate";
  uint64_t v420 = v3;
  v421 = @"LogInstallAwaitingReboot";
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v421,  &v420,  1LL));
  v445[11] = v12;
  v444[12] = @"RemoveUpdate";
  uint64_t v418 = v3;
  v419 = @"LogRemoveAwaitingReboot";
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v419,  &v418,  1LL));
  v445[12] = v13;
  v444[13] = @"SetDoDownloadAndPrep";
  uint64_t v416 = v3;
  uint64_t v417 = v4;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v417,  &v416,  1LL));
  v445[13] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v445,  v444,  14LL));
  v1209[19] = v15;
  v415 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v1209,  v1208,  20LL));

  v16 = -[NSDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:copyItems:",  v415,  1LL);
  return v16;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v11 = a3;
  id v12 = a6;
  if ([v11 isEqualToString:kSUCoreFSMActionNoOp])
  {
    int64_t v13 = 0LL;
  }

  else
  {
    if ([v11 isEqualToString:@"CheckPrepare"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_CheckPrepare:error:](self, "action_CheckPrepare:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"CheckAssets"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_CheckAssets:error:](self, "action_CheckAssets:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReloadDescriptors"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ReloadDescriptors:error:]( self,  "action_ReloadDescriptors:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"RemovePreserving"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_RemovePreserving:error:](self, "action_RemovePreserving:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ResumeTargetPrepared"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ResumeTargetPrepared:error:]( self,  "action_ResumeTargetPrepared:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ActivatedReportWaitAuto"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ActivatedReportWaitAuto:error:]( self,  "action_ActivatedReportWaitAuto:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ActivatedReportPrepared"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ActivatedReportPrepared:error:]( self,  "action_ActivatedReportPrepared:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ActivatedReportRemoved"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ActivatedReportRemoved:error:]( self,  "action_ActivatedReportRemoved:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"PreservedTargetPrepared"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_PreservedTargetPrepared:error:]( self,  "action_PreservedTargetPrepared:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"DecidePrepareUpdate"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_DecidePrepareUpdate:error:]( self,  "action_DecidePrepareUpdate:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"CreateFoundTargetPrepared"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_CreateFoundTargetPrepared:error:]( self,  "action_CreateFoundTargetPrepared:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"CreateImmediateTargetInstalled"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_CreateImmediateTargetInstalled:error:]( self,  "action_CreateImmediateTargetInstalled:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ImmediateTargetInstalled"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ImmediateTargetInstalled:error:]( self,  "action_ImmediateTargetInstalled:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"SetFound"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_SetFound:error:](self, "action_SetFound:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"SetFoundImmediate"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_SetFoundImmediate:error:]( self,  "action_SetFoundImmediate:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"SetFoundCollectDoc"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_SetFoundCollectDoc:error:]( self,  "action_SetFoundCollectDoc:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"SetFoundCancelUpdate"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_SetFoundCancelUpdate:error:]( self,  "action_SetFoundCancelUpdate:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"SetFoundCancelImmediate"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_SetFoundCancelImmediate:error:]( self,  "action_SetFoundCancelImmediate:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"SetFoundCancelStopAuto"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_SetFoundCancelStopAuto:error:]( self,  "action_SetFoundCancelStopAuto:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"SetFoundCancelStopImmediate"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_SetFoundCancelStopImmediate:error:]( self,  "action_SetFoundCancelStopImmediate:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"PersistScanState"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_PersistScanState:error:](self, "action_PersistScanState:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"StopImmediateTargetInstalled"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_StopImmediateTargetInstalled:error:]( self,  "action_StopImmediateTargetInstalled:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"AdoptDocCancelUpdate"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_AdoptDocCancelUpdate:error:]( self,  "action_AdoptDocCancelUpdate:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"StopAuto"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_StopAuto:error:](self, "action_StopAuto:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"RequestIgnoredNoUpdate"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_RequestIgnoredNoUpdate:error:]( self,  "action_RequestIgnoredNoUpdate:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"UserAcceptedTerms"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_UserAcceptedTerms:error:]( self,  "action_UserAcceptedTerms:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"UseCredentialsToPersonalize"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_UseCredentialsToPersonalize:error:]( self,  "action_UseCredentialsToPersonalize:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"TargetInstalled"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_TargetInstalled:error:](self, "action_TargetInstalled:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"AdoptLatestFound"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_AdoptLatestFound:error:](self, "action_AdoptLatestFound:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"DecideAdoptLatestFound"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_DecideAdoptLatestFound:error:]( self,  "action_DecideAdoptLatestFound:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"PreparedDecideByMode"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_PreparedDecideByMode:error:]( self,  "action_PreparedDecideByMode:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ResumedDecideByMode"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ResumedDecideByMode:error:]( self,  "action_ResumedDecideByMode:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"DecideTermsAccepted"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_DecideTermsAccepted:error:]( self,  "action_DecideTermsAccepted:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"DecideAutoFired"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_DecideAutoFired:error:](self, "action_DecideAutoFired:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"DecideFallbackToSecondary"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_DecideFallbackToSecondary:error:]( self,  "action_DecideFallbackToSecondary:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"SecondaryTargetMaintain"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_SecondaryTargetMaintain:error:]( self,  "action_SecondaryTargetMaintain:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"VerifyLatest"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_VerifyLatest:error:](self, "action_VerifyLatest:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"VerifyLatestStopAuto"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_VerifyLatestStopAuto:error:]( self,  "action_VerifyLatestStopAuto:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ApplyFailedDecideByMode"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ApplyFailedDecideByMode:error:]( self,  "action_ApplyFailedDecideByMode:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ApplyFailedRemoveAll"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ApplyFailedRemoveAll:error:]( self,  "action_ApplyFailedRemoveAll:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ClearFound"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ClearFound:error:](self, "action_ClearFound:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ClearFoundTrackPurge"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ClearFoundTrackPurge:error:]( self,  "action_ClearFoundTrackPurge:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ClearFoundCancelUpdate"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ClearFoundCancelUpdate:error:]( self,  "action_ClearFoundCancelUpdate:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ClearFoundCancelStopAuto"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ClearFoundCancelStopAuto:error:]( self,  "action_ClearFoundCancelStopAuto:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"CancelUpdate"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_CancelUpdate:error:](self, "action_CancelUpdate:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"CancelUpdateTrackPurge"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_CancelUpdateTrackPurge:error:]( self,  "action_CancelUpdateTrackPurge:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"CancelUpdateStopAutoTrackPurge"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_CancelUpdateStopAutoTrackPurge:error:]( self,  "action_CancelUpdateStopAutoTrackPurge:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"TrackPurge"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_TrackPurge:error:](self, "action_TrackPurge:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"RemoveAll"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_RemoveAll:error:](self, "action_RemoveAll:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"RemoveAllPreservingScanState"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_RemoveAllPreservingScanState:error:]( self,  "action_RemoveAllPreservingScanState:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"RemoveAllIncludingDoc"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_RemoveAllIncludingDoc:error:]( self,  "action_RemoveAllIncludingDoc:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"RemoveAllTrackPurge"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_RemoveAllTrackPurge:error:]( self,  "action_RemoveAllTrackPurge:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"AttemptFailedRemoveAll"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_AttemptFailedRemoveAll:error:]( self,  "action_AttemptFailedRemoveAll:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"AttemptFailedClearFound"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_AttemptFailedClearFound:error:]( self,  "action_AttemptFailedClearFound:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"AttemptFailedSetFound"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_AttemptFailedSetFound:error:]( self,  "action_AttemptFailedSetFound:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"AttemptFailedSetFoundImmediate"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_AttemptFailedSetFoundImmediate:error:]( self,  "action_AttemptFailedSetFoundImmediate:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"AttemptFailedTrackPurge"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_AttemptFailedTrackPurge:error:]( self,  "action_AttemptFailedTrackPurge:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ReportUpdateProgress"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ReportUpdateProgress:error:]( self,  "action_ReportUpdateProgress:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:kSU_A_ReportPrepared])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ReportPrepared:error:](self, "action_ReportPrepared:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportWaitAuto"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ReportWaitAuto:error:](self, "action_ReportWaitAuto:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportVerifyFailed"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ReportVerifyFailed:error:]( self,  "action_ReportVerifyFailed:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:kSU_A_ReportApplyFailed])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ReportApplyFailed:error:]( self,  "action_ReportApplyFailed:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ReportApplyFailedWaitAuto"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ReportApplyFailedWaitAuto:error:]( self,  "action_ReportApplyFailedWaitAuto:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ReportApplyFailedRemoveAll"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ReportApplyFailedRemoveAll:error:]( self,  "action_ReportApplyFailedRemoveAll:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ReportAwaitingReboot"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ReportAwaitingReboot:error:]( self,  "action_ReportAwaitingReboot:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ReportVerifyFailedWaitAuto"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ReportVerifyFailedWaitAuto:error:]( self,  "action_ReportVerifyFailedWaitAuto:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:kSU_A_ReportApplyProgress])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ReportApplyProgress:error:]( self,  "action_ReportApplyProgress:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"LogInstallFailedNoUpdate"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_LogInstallFailedNoUpdate:error:]( self,  "action_LogInstallFailedNoUpdate:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"LogInstallFailedActivating"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_LogInstallFailedActivating:error:]( self,  "action_LogInstallFailedActivating:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"LogInstallCanceling"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_LogInstallCanceling:error:]( self,  "action_LogInstallCanceling:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"LogInstallAwaitingReboot"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_LogInstallAwaitingReboot:error:]( self,  "action_LogInstallAwaitingReboot:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"LogRemoveAwaitingReboot"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_LogRemoveAwaitingReboot:error:]( self,  "action_LogRemoveAwaitingReboot:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"LogExpiredDecideWaitAuto"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_LogExpiredDecideWaitAuto:error:]( self,  "action_LogExpiredDecideWaitAuto:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"SUContentPurgedDecideNewer"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_SUContentPurgedDecideNewer:error:]( self,  "action_SUContentPurgedDecideNewer:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ScanPurgedDecideNewer"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ScanPurgedDecideNewer:error:]( self,  "action_ScanPurgedDecideNewer:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"SUContentPurgedDecideRemoved"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_SUContentPurgedDecideRemoved:error:]( self,  "action_SUContentPurgedDecideRemoved:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ScanPurgedDecideRemoved"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_ScanPurgedDecideRemoved:error:]( self,  "action_ScanPurgedDecideRemoved:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"AnomalyScanBeforeActivated"])
    {
      int64_t v14 = -[SUControllerPolicyEngine action_AnomalyScanBeforeActivated:error:]( self,  "action_AnomalyScanBeforeActivated:error:",  v12,  a8);
    }

    else
    {
      int64_t v14 = -[SUControllerPolicyEngine actionUnknownAction:error:](self, "actionUnknownAction:error:", v11, a8);
    }

    int64_t v13 = v14;
  }

  return v13;
}

- (int64_t)action_CheckPrepare:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine loadedState](self, "loadedState"));
  LODWORD(v6) = [v7 updateIsPrepared];

  if ((_DWORD)v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine loadedState](self, "loadedState"));
    else {
      v9 = @"NO";
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine loadedState](self, "loadedState"));
    else {
      id v11 = @"NO";
    }
    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[ACTIVATE] persisted state indicates prepared | updateIsPrepared=%@, updateIsApplied=%@",  v9,  v11);

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    int64_t v13 = objc_alloc(&OBJC_CLASS___SUControllerPolicyParam);
    int64_t v14 = (SUControllerPolicyParam *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine loadedState](self, "loadedState"));
    id v15 = -[SUControllerPolicyParam updateIsPrepared](v14, "updateIsPrepared");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine loadedState](self, "loadedState"));
    v17 = -[SUControllerPolicyParam initWithBrainAssetID:suAssetID:isPrepared:isApplied:]( v13,  "initWithBrainAssetID:suAssetID:isPrepared:isApplied:",  0,  0,  v15,  [v16 updateIsApplied]);
    [v12 postEvent:@"PurgeCheckedPrepare" withInfo:v17];
  }

  else
  {
    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[ACTIVATE] no indication in persisted state that an update had been prepared");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    int64_t v14 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
    [v12 postEvent:@"PurgeCheckedMismatch" withInfo:v14];
  }

  return 0LL;
}

- (int64_t)action_CheckAssets:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 suAssetID]);
  -[SUControllerPolicyEngine setLoadedSUAssetID:](self, "setLoadedSUAssetID:", v8);

  -[SUControllerPolicyEngine setLoadedPrepared:](self, "setLoadedPrepared:", [v5 isPrepared]);
  id v9 = [v5 isApplied];

  -[SUControllerPolicyEngine setLoadedApplied:](self, "setLoadedApplied:", v9);
  v10 = objc_alloc(&OBJC_CLASS___SUCorePolicy);
  id v11 = -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:]( v10,  "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:",  kSUAssetTypeSoftwareUpdate,  kSUAssetTypeUpdateDocumentation,  127LL,  0LL);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100012D48;
  v13[3] = &unk_100065098;
  v13[4] = self;
  +[SUCorePurge checkForExistingAssetsWithPolicy:completion:]( &OBJC_CLASS___SUCorePurge,  "checkForExistingAssetsWithPolicy:completion:",  v11,  v13);

  return 0LL;
}

- (int64_t)action_ReloadDescriptors:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine loadedState](self, "loadedState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 primaryDescriptor]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine loadedState](self, "loadedState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 secondaryDescriptor]);

  if (v8)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100013014;
    v16[3] = &unk_1000650C0;
    id v17 = v8;
    v18 = self;
    id v19 = v10;
    +[SUCoreMobileAsset reloadDescriptor:completion:]( &OBJC_CLASS___SUCoreMobileAsset,  "reloadDescriptor:completion:",  v17,  v16);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 diag]);
    [v12 trackAnomaly:@"[POLICY_RELOAD]" forReason:@"reload when no primaryDescriptor in loadedState" withResult:8117 withError:0];

    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    int64_t v14 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
    [v13 postEvent:@"ReloadDescriptorsFailed" withInfo:v14];
  }

  return 0LL;
}

- (int64_t)action_RemovePreserving:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  [v8 postEvent:@"PreservedValidated" withInfo:v5];

  return 0LL;
}

- (int64_t)action_ResumeTargetPrepared:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryDescriptor]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 secondaryDescriptor]);
  if (!v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 diag]);
    int64_t v14 = v13;
    id v15 = @"about to resume - no loaded primary descriptor";
    goto LABEL_6;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine loadedState](self, "loadedState"));
  unsigned int v11 = [v10 fallenBackToSecondary];

  if (v11 && !v9)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 diag]);
    int64_t v14 = v13;
    id v15 = @"about to resume after fallen back to secondary - no loaded secondary descriptor";
LABEL_6:
    [v13 trackAnomaly:@"[POLICY_FOLLOWUP]" forReason:v15 withResult:8115 withError:0];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    [v16 followupEvent:@"PreservedInvalid" withInfo:v5];
    goto LABEL_11;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine loadedState](self, "loadedState"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine loadedState](self, "loadedState"));
  LOBYTE(v41) = 0;
  -[SUControllerPolicyEngine acceptPreservedState:loadedPrimaryDescriptor:loadedSecondaryDescriptor:adoptingLoadedState:updateIsPrepared:targetingApplied:updateIsApplied:]( self,  "acceptPreservedState:loadedPrimaryDescriptor:loadedSecondaryDescriptor:adoptingLoadedState:updateIsPrepared:targetin gApplied:updateIsApplied:",  @"persisted state validated - resuming previously prepared update",  v8,  v9,  v17,  1,  [v18 targetingApplied],  v41);

  id v19 = objc_alloc(&OBJC_CLASS___SUCoreUpdate);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine loadedState](self, "loadedState"));
  else {
    v21 = v8;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
  v23 = -[SUCoreUpdate initWithDelegate:updateDescriptor:updateUUID:]( v19,  "initWithDelegate:updateDescriptor:updateUUID:",  self,  v21,  v22);
  -[SUControllerPolicyEngine setUpdateControl:](self, "setUpdateControl:", v23);

  -[SUControllerPolicyEngine determineUpdatePolicy](self, "determineUpdatePolicy");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 loadBrainPolicy]);
  [v25 setSkipPhase:0];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 downloadPreflightPolicy]);
  [v27 setSkipPhase:1];

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 softwareUpdateDownloadPolicy]);
  [v29 setSkipPhase:1];

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 preparePolicy]);
  [v31 setSkipPhase:1];

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 suspendPolicy]);
  [v33 setSkipPhase:1];

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 resumePolicy]);
  [v35 setSkipPhase:0];

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 applyPolicy]);
  [v37 setSkipPhase:0];

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  [v38 setCheckAvailableSpace:0];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateControl](self, "updateControl"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  [v16 targetPrepared:v39];

LABEL_11:
  return 0LL;
}

- (int64_t)action_ActivatedReportWaitAuto:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  9LL,  @"preserved update has been resumed, waiting for auto-install window to apply the update");
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  -[SUControllerPolicyEngine updateTarget](self, "updateTarget")));
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:[ACTIVATE] ACTIVATED: update successfully resumed when configured to install automatically | updateTarget(%@)",  @"[__MILESTONE__]",  v7);

  -[SUControllerPolicyEngine broadcastPrepared:](self, "broadcastPrepared:", 1LL);
  -[SUControllerPolicyEngine autoInstallWindowWaitForAllowed](self, "autoInstallWindowWaitForAllowed");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scanBaseUUID]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  +[SUControllerCore activateScanManagerWithBaseUUID:rampingForeground:]( SUControllerCore,  "activateScanManagerWithBaseUUID:rampingForeground:",  v9,  [v10 scanRampingForeground]);

  return 0LL;
}

- (int64_t)action_ActivatedReportPrepared:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  8LL,  @"preserved update has been resumed, now prepared");
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  -[SUControllerPolicyEngine updateTarget](self, "updateTarget")));
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:[ACTIVATE] ACTIVATED: update successfully resumed when not configured to install automatically | updateTarget(%@)",  @"[__MILESTONE__]",  v7);

  -[SUControllerPolicyEngine broadcastPrepared:](self, "broadcastPrepared:", 1LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scanBaseUUID]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  +[SUControllerCore activateScanManagerWithBaseUUID:rampingForeground:]( SUControllerCore,  "activateScanManagerWithBaseUUID:rampingForeground:",  v9,  [v10 scanRampingForeground]);

  return 0LL;
}

- (int64_t)action_ActivatedReportRemoved:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  2LL,  @"persisted state not preserved - all update content has been removed");
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  -[SUControllerPolicyEngine updateTarget](self, "updateTarget")));
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:[ACTIVATE] ACTIVATED: persisted state not preserved - all update content has been removed | updateTarget(%@)",  @"[__MILESTONE__]",  v7);

  -[SUControllerPolicyEngine issuePendingPurgeCompletions:](self, "issuePendingPurgeCompletions:", 0LL);
  return 0LL;
}

- (int64_t)action_PreservedTargetPrepared:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateControl](self, "updateControl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  [v7 targetPrepared:v8];

  return 0LL;
}

- (int64_t)action_DecidePrepareUpdate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine setFound:forReason:persistingScanState:]( self,  "setFound:forReason:persistingScanState:",  v5,  @"update found - deciding whether to download/prepare",  1LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 scanOptions]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 scanOptions]);
    unsigned int v10 = [v9 downloadWhenFound];

    if (!v10)
    {
      -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@",  @"update found - from manual scan - decided to NOT proceed with download/prepare from user options");
      -[SUControllerPolicyEngine clearFound:]( self,  "clearFound:",  @"update found - from manual scan - decided to NOT proceed with download/prepare from user options");
      -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  2LL,  @"update found - from manual scan - decided to NOT proceed with download/prepare from user options");
      int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
      id v15 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
      v16 = @"BackToWaitForUpdate";
      goto LABEL_8;
    }

    unsigned int v11 = @"update found - from manual scan - decided to proceed with download/prepare";
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
    unsigned int v13 = [v12 performAutoDownloadAndPrepare];

    if (!v13)
    {
      -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  3LL,  @"decide whether to prepare update found");
      -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"update found - from automatic scan - decided to NOT proceed with download/prepare due to config options");
      goto LABEL_10;
    }

    unsigned int v11 = @"update found - from automatic scan - decided to proceed with download/prepare ";
  }

  -[SUControllerPolicyEngine policyLog:](self, "policyLog:", v11);
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  3LL,  @"decide whether to prepare update found");
  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v15 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
  v16 = @"ShouldPrepUpdate";
LABEL_8:
  [v14 followupEvent:v16 withInfo:v15];

LABEL_10:
  return 0LL;
}

- (int64_t)action_CreateFoundTargetPrepared:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine activeFound](self, "activeFound");
  v7 = objc_alloc(&OBJC_CLASS___SUCoreUpdate);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine initiallyTargertedDescriptor](self, "initiallyTargertedDescriptor"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
  unsigned int v10 = -[SUCoreUpdate initWithDelegate:updateDescriptor:updateUUID:]( v7,  "initWithDelegate:updateDescriptor:updateUUID:",  self,  v8,  v9);
  -[SUControllerPolicyEngine setUpdateControl:](self, "setUpdateControl:", v10);

  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  4LL,  @"update found - targeting primary prepared");
  -[SUControllerPolicyEngine advanceUpdateTarget:forReason:]( self,  "advanceUpdateTarget:forReason:",  8LL,  @"update found - targeting primary prepared");
  -[SUControllerPolicyEngine determineUpdatePolicy](self, "determineUpdatePolicy");
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateControl](self, "updateControl"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  [v11 targetPrepared:v12];

  -[SUControllerPolicyEngine reportOTAAvailable:](self, "reportOTAAvailable:", @"targetingPrimary");
  return 0LL;
}

- (int64_t)action_CreateImmediateTargetInstalled:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine setFound:forReason:persistingScanState:]( self,  "setFound:forReason:persistingScanState:",  v5,  @"updateAcceptingTerms: update found - targeting primary installed",  1LL);
  -[SUControllerPolicyEngine activeFound](self, "activeFound");
  -[SUControllerPolicyEngine activePersonalize:](self, "activePersonalize:", v5);

  v8 = objc_alloc(&OBJC_CLASS___SUCoreUpdate);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine initiallyTargertedDescriptor](self, "initiallyTargertedDescriptor"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
  unsigned int v11 = -[SUCoreUpdate initWithDelegate:updateDescriptor:updateUUID:]( v8,  "initWithDelegate:updateDescriptor:updateUUID:",  self,  v9,  v10);
  -[SUControllerPolicyEngine setUpdateControl:](self, "setUpdateControl:", v11);

  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  4LL,  @"updateAcceptingTerms: update found - targeting primary installed");
  -[SUControllerPolicyEngine advanceUpdateTarget:forReason:]( self,  "advanceUpdateTarget:forReason:",  14LL,  @"updateAcceptingTerms: update found - targeting primary installed");
  -[SUControllerPolicyEngine determineUpdatePolicy](self, "determineUpdatePolicy");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateControl](self, "updateControl"));
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  [v12 targetApplied:v13];

  -[SUControllerPolicyEngine reportOTAAvailable:](self, "reportOTAAvailable:", @"updateAcceptingTerms");
  return 0LL;
}

- (int64_t)action_ImmediateTargetInstalled:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine activePersonalize:](self, "activePersonalize:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 scanUUID]);
  id v9 = [v5 rampingForeground];

  -[SUControllerPolicyEngine persistScanUUID:withRampingForeground:forReason:]( self,  "persistScanUUID:withRampingForeground:forReason:",  v8,  v9,  @"updateAcceptingTerms: - targeting install of currently active update");
  -[SUControllerPolicyEngine advanceUpdateTarget:forReason:]( self,  "advanceUpdateTarget:forReason:",  14LL,  @"updateAcceptingTerms: - targeting install of currently active update");
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateControl](self, "updateControl"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  [v10 targetApplied:v11];

  return 0LL;
}

- (int64_t)action_SetFound:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine setFound:forReason:persistingScanState:]( self,  "setFound:forReason:persistingScanState:",  v5,  @"newer update found",  1LL);
  -[SUControllerPolicyEngine reportOTAAvailable:](self, "reportOTAAvailable:", @"newerWhenAbandoning");
  return 0LL;
}

- (int64_t)action_SetFoundImmediate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine setFound:forReason:persistingScanState:]( self,  "setFound:forReason:persistingScanState:",  v5,  @"updateAcceptingTerms: newer update found",  1LL);
  -[SUControllerPolicyEngine activePersonalize:](self, "activePersonalize:", v5);

  -[SUControllerPolicyEngine reportOTAAvailable:]( self,  "reportOTAAvailable:",  @"updateAcceptingTermsWhenAbandoning");
  -[SUControllerPolicyEngine advanceUpdateTarget:forReason:]( self,  "advanceUpdateTarget:forReason:",  14LL,  @"updateAcceptingTerms: newer update found");
  return 0LL;
}

- (int64_t)action_SetFoundCollectDoc:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine updateAbandonedNewerFound:eventInfo:persistingScanState:reportingStatus:withErrorCode:]( self,  "updateAbandonedNewerFound:eventInfo:persistingScanState:reportingStatus:withErrorCode:",  @"found newer update when verifying latest - canceling current update",  v5,  0LL,  @"newerCollectingDoc",  8408LL);
  v8 = objc_alloc(&OBJC_CLASS___SUCoreScan);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
  unsigned int v10 = -[SUCoreScan initWithUUID:](v8, "initWithUUID:", v9);

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine foundScanPolicy](self, "foundScanPolicy"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine foundPrimaryDescriptor](self, "foundPrimaryDescriptor"));
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  id v14 = [v13 downloadDocAsset];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001434C;
  v17[3] = &unk_1000650E8;
  v18 = v10;
  id v19 = self;
  id v15 = v10;
  -[SUCoreScan collectDocumentationMetadataWithPolicy:descriptor:downloadDocumentation:completion:]( v15,  "collectDocumentationMetadataWithPolicy:descriptor:downloadDocumentation:completion:",  v11,  v12,  v14,  v17);

  return 0LL;
}

- (int64_t)action_SetFoundCancelUpdate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine updateAbandonedNewerFound:eventInfo:persistingScanState:reportingStatus:withErrorCode:]( self,  "updateAbandonedNewerFound:eventInfo:persistingScanState:reportingStatus:withErrorCode:",  @"newer update found - abandoning older update",  v5,  1LL,  @"abandoningForNewer",  8408LL);
  return 0LL;
}

- (int64_t)action_SetFoundCancelImmediate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine updateAbandonedNewerFound:eventInfo:persistingScanState:reportingStatus:withErrorCode:]( self,  "updateAbandonedNewerFound:eventInfo:persistingScanState:reportingStatus:withErrorCode:",  @"updateAcceptingTerms: newer update found - abandoning older update",  v5,  1LL,  @"abandoningForNewer",  8408LL);
  -[SUControllerPolicyEngine activePersonalize:](self, "activePersonalize:", v5);

  return 0LL;
}

- (int64_t)action_SetFoundCancelStopAuto:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine autoInstallWindowCancelWait](self, "autoInstallWindowCancelWait");
  -[SUControllerPolicyEngine updateAbandonedNewerFound:eventInfo:persistingScanState:reportingStatus:withErrorCode:]( self,  "updateAbandonedNewerFound:eventInfo:persistingScanState:reportingStatus:withErrorCode:",  @"newer update found - stopping auto-install wait and abandoning older update",  v5,  1LL,  @"abandoningForNewerAuto",  8408LL);

  return 0LL;
}

- (int64_t)action_SetFoundCancelStopImmediate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine autoInstallWindowCancelWait](self, "autoInstallWindowCancelWait");
  -[SUControllerPolicyEngine updateAbandonedNewerFound:eventInfo:persistingScanState:reportingStatus:withErrorCode:]( self,  "updateAbandonedNewerFound:eventInfo:persistingScanState:reportingStatus:withErrorCode:",  @"updateAcceptingTerms: newer update found - stopping auto-install wait and abandoning older update",  v5,  1LL,  @"abandoningForNewerAuto",  8408LL);
  -[SUControllerPolicyEngine activePersonalize:](self, "activePersonalize:", v5);

  -[SUControllerPolicyEngine advanceUpdateTarget:forReason:]( self,  "advanceUpdateTarget:forReason:",  14LL,  @"updateAcceptingTerms: newer update found - stopping auto-install wait and abandoning older update");
  return 0LL;
}

- (int64_t)action_PersistScanState:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 scanUUID]);
  id v9 = [v5 rampingForeground];

  -[SUControllerPolicyEngine persistScanUUID:withRampingForeground:forReason:]( self,  "persistScanUUID:withRampingForeground:forReason:",  v8,  v9,  @"PersistScanState");
  return 0LL;
}

- (int64_t)action_StopImmediateTargetInstalled:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine autoInstallWindowCancelWait](self, "autoInstallWindowCancelWait");
  -[SUControllerPolicyEngine activePersonalize:](self, "activePersonalize:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 scanUUID]);
  id v9 = [v5 rampingForeground];

  -[SUControllerPolicyEngine persistScanUUID:withRampingForeground:forReason:]( self,  "persistScanUUID:withRampingForeground:forReason:",  v8,  v9,  @"StopImmediateTargetInstalled");
  -[SUControllerPolicyEngine advanceUpdateTarget:forReason:]( self,  "advanceUpdateTarget:forReason:",  14LL,  @"updateAcceptingTerms: - stopping auto-install wait and targeting install of currently active update");
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateControl](self, "updateControl"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  [v10 targetApplied:v11];

  return 0LL;
}

- (int64_t)action_AdoptDocCancelUpdate:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(FOUND) adopt newer update (doc just collected)",  @"[__MILESTONE__]");
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  10LL,  @"adopt newer update (doc just collected)");
  -[SUControllerPolicyEngine cancelCurrentUpdate](self, "cancelCurrentUpdate");
  return 0LL;
}

- (int64_t)action_StopAuto:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine autoInstallWindowCancelWait](self, "autoInstallWindowCancelWait");
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  8LL,  @"configuration changed to manual install mode");
  return 0LL;
}

- (int64_t)action_RequestIgnoredNoUpdate:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[CLIENT] request ignored since no update to associate request with");
  return 0LL;
}

- (int64_t)action_UserAcceptedTerms:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerPolicyEngine activeDescriptor:potentiallyInactive:]( self,  "activeDescriptor:potentiallyInactive:",  @"user accepted T&C",  1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 activeDescriptor]);

  if (v9)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 activeDescriptor]);
    unsigned int v11 = [v10 isEqual:v8];

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 activeDescriptor]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 summary]);
    id v14 = (void *)v13;
    if (!v11)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
      -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[TERMS] user accepted T&C for descriptor:%@ != activeDescriptor:%@ (accept of T&C ignored)",  v14,  v15);

      goto LABEL_7;
    }

    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[TERMS] user accepted T&C for specified descriptor:%@",  v13);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[TERMS] user accepted T&C for currently active descriptor:%@",  v12);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v12 setTermsAccepted:1];
LABEL_7:

  return 0LL;
}

- (int64_t)action_UseCredentialsToPersonalize:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerPolicyEngine activeDescriptor:potentiallyInactive:]( self,  "activeDescriptor:potentiallyInactive:",  @"user provided credentials",  1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 activeDescriptor]);

  if (v9)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 activeDescriptor]);
    unsigned int v11 = [v10 isEqual:v8];

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 activeDescriptor]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 summary]);
    id v14 = (void *)v13;
    if (!v11)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
      -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[CREDENTIALS] user provided credentials for descriptor:%@ != activeDescriptor:%@ (credentials ignored)",  v14,  v15);

      goto LABEL_8;
    }

    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[CREDENTIALS] user provided credentials for specified descriptor:%@",  v13);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[CREDENTIALS] user provided credentials for currently active descriptor:%@",  v12);
  }

  if ([v5 paramType] != (id)8)
  {
    -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0,  @"[CREDENTIALS] unsupported eventInfo.paramType(%ld) (credentials ignored)",  [v5 paramType]);
    goto LABEL_10;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 ssoToken]);
  -[SUControllerPolicyEngine setPersonalizeSSOToken:](self, "setPersonalizeSSOToken:", v12);
LABEL_8:

LABEL_10:
  return 0LL;
}

- (int64_t)action_DecideTermsAccepted:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  if ([v8 termsAccepted])
  {

LABEL_4:
    unsigned int v10 = @"[FOLLOWUP] user has accepted T&C - installing the update";
    goto LABEL_5;
  }

  unsigned __int8 v9 = -[SUControllerPolicyEngine updateAcceptingTerms](self, "updateAcceptingTerms");

  if ((v9 & 1) != 0) {
    goto LABEL_4;
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  unsigned int v14 = [v13 autoAcceptTermsAndConditions];

  if (!v14)
  {
    -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[TERMS] user has not accepted T&C - cannot install the update");
    goto LABEL_6;
  }

  unsigned int v10 = @"[FOLLOWUP] automatically accepted T&C - installing the update";
LABEL_5:
  -[SUControllerPolicyEngine policyLog:](self, "policyLog:", v10);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  [v11 followupEvent:@"InstallTermsAccepted" withInfo:v5];

LABEL_6:
  return 0LL;
}

- (int64_t)action_DecideAutoFired:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine decideFollowupAfterAutoInstallFired:](self, "decideFollowupAfterAutoInstallFired:", v5);
  return 0LL;
}

- (int64_t)action_PreparedDecideByMode:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v8 setUpdateIsPrepared:1];

  id v9 = [v5 reachedState];
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  v9,  @"update has been successfully prepared");
  if (-[SUControllerPolicyEngine updateTarget](self, "updateTarget") <= 7)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 diag]);
    id v12 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  -[SUControllerPolicyEngine updateTarget](self, "updateTarget")));
    unsigned int v14 = -[NSString initWithFormat:]( v12,  "initWithFormat:",  @"update successfully prepared when targeting earlier phase | updateTarget(%@)",  v13);
    [v11 trackAnomaly:@"[POLICY_FOLLOWUP]" forReason:v14 withResult:8115 withError:0];

LABEL_12:
    v22 = @"UpdatePreparedAtTarget";
    goto LABEL_13;
  }

  if (-[SUControllerPolicyEngine updateTarget](self, "updateTarget") < 14
    || (id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state")),
        unsigned __int8 v16 = [v15 termsAccepted],
        v15,
        (v16 & 1) == 0))
  {
    if (-[SUControllerPolicyEngine updateTarget](self, "updateTarget") >= 14
      && -[SUControllerPolicyEngine updateAcceptingTerms](self, "updateAcceptingTerms"))
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  -[SUControllerPolicyEngine updateTarget](self, "updateTarget")));
      -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(PREPARE)[FOLLOWUP] updateAcceptingTerms: update successfully prepared (already installing) | updateTarget(%@)",  @"[__MILESTONE__]",  v10);
      v22 = @"UpdatePreparedImmediate";
    }

    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
      unsigned int v24 = [v23 performAutoInstall];

      if (!v24)
      {
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  -[SUControllerPolicyEngine updateTarget](self, "updateTarget")));
        -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(PREPARE)[FOLLOWUP] update successfully prepared when not configured to install automatically | updateTarget(%@)",  @"[__MILESTONE__]",  v10);
        goto LABEL_12;
      }

      -[SUControllerPolicyEngine advanceUpdateTarget:forReason:]( self,  "advanceUpdateTarget:forReason:",  9LL,  @"update successfully prepared when configured to perform auto-install");
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  -[SUControllerPolicyEngine updateTarget](self, "updateTarget")));
      -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(PREPARE)[FOLLOWUP] update successfully prepared when configured to install automatically | updateTarget(%@)",  @"[__MILESTONE__]",  v10);
      v22 = @"UpdatePreparedAuto";
    }

- (int64_t)action_ResumedDecideByMode:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v8 setUpdateIsPrepared:1];

  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  [v5 reachedState],  @"update has been successfully resumed");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  LODWORD(v7) = [v9 performAutoInstall];

  if ((_DWORD)v7)
  {
    -[SUControllerPolicyEngine advanceUpdateTarget:forReason:]( self,  "advanceUpdateTarget:forReason:",  9LL,  @"update successfully resumed when configured to perform auto-install");
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    unsigned int v11 = v10;
    id v12 = @"UpdatePreparedAuto";
  }

  else
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    unsigned int v11 = v10;
    id v12 = @"UpdatePreparedAtTarget";
  }

  [v10 followupEvent:v12 withInfo:v5];

  return 0LL;
}

- (int64_t)action_TargetInstalled:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  13LL,  @"applying the update");
  -[SUControllerPolicyEngine advanceUpdateTarget:forReason:]( self,  "advanceUpdateTarget:forReason:",  14LL,  @"applying the update");
  -[SUControllerPolicyEngine determineUpdatePolicy](self, "determineUpdatePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 installPhaseOSBackgroundImagePath]);

  if (v9)
  {
    unsigned int v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 applyPolicy]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 additionalOptions]);

    if (v13)
    {
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 applyPolicy]);
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 additionalOptions]);
      -[NSMutableDictionary addEntriesFromDictionary:](v10, "addEntriesFromDictionary:", v16);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 installPhaseOSBackgroundImagePath]);
    -[NSMutableDictionary setSafeObject:forKey:]( v10,  "setSafeObject:forKey:",  v18,  @"UpdateOSBackgroundImagePath");

    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceClass]);
    unsigned int v21 = [v20 isEqualToString:@"AppleTV"];

    if (v21)
    {
      -[NSMutableDictionary setSafeObject:forKey:]( v10,  "setSafeObject:forKey:",  @"1280",  @"UpdateOSDisplayWidth");
      -[NSMutableDictionary setSafeObject:forKey:]( v10,  "setSafeObject:forKey:",  @"720",  @"UpdateOSDisplayHeight");
      -[NSMutableDictionary setSafeObject:forKey:]( v10,  "setSafeObject:forKey:",  @"60.0",  @"UpdateOSDisplayRefreshRate");
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 applyPolicy]);
    [v23 setAdditionalOptions:v10];

    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 applyPolicy]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 additionalOptions]);
    -[SUControllerPolicyEngine policyLog:](self, "policyLog:", @"Invoking apply with additionalOptions: %@", v26);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 updateMetricEventFields]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v5 applyInvokedBy]);
  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue([v5 applyInvokedBy]);
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerEventReporter addApplyInfoToUMEventFields:withApplyInvokedBy:]( &OBJC_CLASS___SUControllerEventReporter,  "addApplyInfoToUMEventFields:withApplyInvokedBy:",  v28,  v30));
  }

  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerEventReporter addApplyInfoToUMEventFields:withApplyInvokedBy:]( &OBJC_CLASS___SUControllerEventReporter,  "addApplyInfoToUMEventFields:withApplyInvokedBy:",  v28,  @"Unknown"));
  }

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
    id v33 = [v32 setUpdateMetricEventFieldsFromDictionary:v31];
  }

  else
  {
    -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"Failed to add apply invocation information to UMEventFields");
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v34 setTargetingApplied:1];

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateControl](self, "updateControl"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
  [v35 targetApplied:v36];

  return 0LL;
}

- (int64_t)action_DecideAdoptLatestFound:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine scanOptions](self, "scanOptions"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine scanOptions](self, "scanOptions"));
    unsigned int v9 = [v8 downloadWhenFound];

    if (!v9)
    {
      -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"adopt latest found - from manual scan - decided to NOT proceed with download/prepare latest found from user options");
      -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  2LL,  @"decide whether to adopting newer update (just finished abandoning older)");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
      unsigned int v14 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
      id v15 = @"DoNotAdoptLatestFound";
      goto LABEL_9;
    }

    unsigned int v10 = @"adopt latest found - from manual scan - decided to proceed with download/prepare latest found";
  }

  else
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
    unsigned int v12 = [v11 performAutoDownloadAndPrepare];

    if (!v12)
    {
      -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"adopt latest found - from automatic scan - decided to NOT proceed with download/prepare latest found due to config options");
      -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  3LL,  @"decide whether to adopting newer update (just finished abandoning older)");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
      unsigned int v14 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
      id v15 = @"WaitToAdoptLatestFound";
      goto LABEL_9;
    }

    unsigned int v10 = @"adopt latest found - from automatic scan - decided to proceed with download/prepare latest found";
  }

  -[SUControllerPolicyEngine policyLog:](self, "policyLog:", v10);
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  3LL,  @"decide whether to adopting newer update (just finished abandoning older)");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  unsigned int v14 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
  id v15 = @"AdoptLatestFound";
LABEL_9:
  [v13 followupEvent:v15 withInfo:v14];

  return 0LL;
}

- (int64_t)action_AdoptLatestFound:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine foundPrimaryDescriptor](self, "foundPrimaryDescriptor"));
  if (v7)
  {
    -[SUControllerPolicyEngine activeFound](self, "activeFound");
    v8 = objc_alloc(&OBJC_CLASS___SUCoreUpdate);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine initiallyTargertedDescriptor](self, "initiallyTargertedDescriptor"));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
    unsigned int v11 = -[SUCoreUpdate initWithDelegate:updateDescriptor:updateUUID:]( v8,  "initWithDelegate:updateDescriptor:updateUUID:",  self,  v9,  v10);
    -[SUControllerPolicyEngine setUpdateControl:](self, "setUpdateControl:", v11);

    -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  4LL,  @"just adopted newer update, targeting prepared");
    -[SUControllerPolicyEngine advanceUpdateTarget:forReason:]( self,  "advanceUpdateTarget:forReason:",  8LL,  @"just adopted newer update, targeting prepared");
    -[SUControllerPolicyEngine determineUpdatePolicy](self, "determineUpdatePolicy");
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateControl](self, "updateControl"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
    [v12 targetPrepared:v13];
  }

  else
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 diag]);
    [v13 trackAnomaly:@"[POLICY]" forReason:@"adopt updating target when no found descriptor" withResult:8101 withError:0];
  }

  return 0LL;
}

- (int64_t)action_DecideFallbackToSecondary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  LODWORD(v7) = [v8 restrictToFullReplacement];

  if ((_DWORD)v7)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 diag]);
    unsigned int v11 = v10;
    unsigned int v12 = @"fallback to full replacement recommended when restricted to full (should have already been trying full replacement)";
    uint64_t v13 = 8115LL;
LABEL_6:
    [v10 trackAnomaly:@"[POLICY_FOLLOWUP]" forReason:v12 withResult:v13 withError:0];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    unsigned __int8 v16 = v15;
    id v17 = @"FallbackNotAvailable";
    goto LABEL_7;
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine secondaryDescriptor](self, "secondaryDescriptor"));

  if (!v14)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 diag]);
    unsigned int v11 = v10;
    unsigned int v12 = @"fallback to full replacement recommended when no secondary available (should have already been trying full replacement)";
    uint64_t v13 = 8101LL;
    goto LABEL_6;
  }

  -[SUControllerPolicyEngine policyLog:](self, "policyLog:", @"[FOLLOWUP] trying to fallback to full replacement");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  unsigned __int8 v16 = v15;
  id v17 = @"FallbackAvailable";
LABEL_7:
  [v15 followupEvent:v17 withInfo:v5];

  return 0LL;
}

- (int64_t)action_SecondaryTargetMaintain:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine haveFallenBackToSecondary:forReason:]( self,  "haveFallenBackToSecondary:forReason:",  1LL,  @"falling back to secondary descriptor [full replacement]");
  v7 = objc_alloc(&OBJC_CLASS___SUCoreUpdate);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine secondaryDescriptor](self, "secondaryDescriptor"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
  unsigned int v10 = -[SUCoreUpdate initWithDelegate:updateDescriptor:updateUUID:]( v7,  "initWithDelegate:updateDescriptor:updateUUID:",  self,  v8,  v9);
  -[SUControllerPolicyEngine setUpdateControl:](self, "setUpdateControl:", v10);

  -[SUControllerPolicyEngine assignActiveDescriptor:]( self,  "assignActiveDescriptor:",  @"falling back to secondary descriptor [full replacement]");
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  4LL,  @"falling back to full replacement, targeting prepared");
  if (-[SUControllerPolicyEngine updateTarget](self, "updateTarget") < 13)
  {
    -[SUControllerPolicyEngine advanceUpdateTarget:forReason:]( self,  "advanceUpdateTarget:forReason:",  8LL,  @"falling back to full replacement (maintaining target to prepare the update)");
    -[SUControllerPolicyEngine determineUpdatePolicy](self, "determineUpdatePolicy");
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateControl](self, "updateControl"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
    [v11 targetPrepared:v12];
  }

  else
  {
    -[SUControllerPolicyEngine advanceUpdateTarget:forReason:]( self,  "advanceUpdateTarget:forReason:",  14LL,  @"falling back to full replacement (maintaining target to apply the update)");
    -[SUControllerPolicyEngine determineUpdatePolicy](self, "determineUpdatePolicy");
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateControl](self, "updateControl"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
    [v11 targetApplied:v12];
  }

  return 0LL;
}

- (int64_t)action_VerifyLatest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine broadcastVerifyingBeforeApply](self, "broadcastVerifyingBeforeApply");
  -[SUControllerPolicyEngine verifyLatest:](self, "verifyLatest:", v5);

  return 0LL;
}

- (int64_t)action_VerifyLatestStopAuto:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine autoInstallWindowCancelWait](self, "autoInstallWindowCancelWait");
  -[SUControllerPolicyEngine broadcastVerifyingBeforeApply](self, "broadcastVerifyingBeforeApply");
  -[SUControllerPolicyEngine verifyLatest:](self, "verifyLatest:", v5);

  return 0LL;
}

- (int64_t)action_ApplyFailedDecideByMode:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
  unsigned int v9 = v8;
  if (v8)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    unsigned int v11 = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v10,  kCFErrorDomainMobileSoftwareUpdate);

    if (v11)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 userInfo]);
      if (v12
        && (uint64_t v13 = (void *)v12,
            unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]),
            uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary),
            char isKindOfClass = objc_opt_isKindOfClass(v14, v15),
            v14,
            v13,
            (isKindOfClass & 1) != 0))
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
        unsigned __int8 v18 = [v17 safeBooleanForKey:@"Recoverable"];
      }

      else
      {
        unsigned __int8 v18 = 1;
      }

      if ([v9 code] == (id)5)
      {
        -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"%@:(APPLY) apply attempt failed (no suspended update)",  @"[__MILESTONE__]");
LABEL_15:
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
        v23 = -[SUControllerPolicyParam initWithError:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithError:",  v9);
        [v21 followupEvent:@"ApplyFailedNoRetry" withInfo:v23];
        goto LABEL_16;
      }

      if ((v18 & 1) == 0)
      {
        -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"%@:(APPLY) apply attempt failed (error is not recoverable)",  @"[__MILESTONE__]");
        goto LABEL_15;
      }
    }
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  unsigned int v20 = [v19 performAutoInstall];

  if (v20)
  {
    -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"%@:(APPLY) apply attempt failed (waiting for next auto-install window)",  @"[__MILESTONE__]");
    -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  9LL,  @"apply attempt failed (waiting for next auto-install window)");
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    v22 = objc_alloc(&OBJC_CLASS___SUControllerPolicyParam);
    v23 = (SUControllerPolicyParam *)objc_claimAutoreleasedReturnValue([v5 error]);
    unsigned int v24 = -[SUControllerPolicyParam initWithError:](v22, "initWithError:", v23);
    v25 = @"ApplyFailedAuto";
  }

  else
  {
    -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"%@:(APPLY) apply attempt failed",  @"[__MILESTONE__]");
    -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  8LL,  @"apply attempt failed");
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    v26 = objc_alloc(&OBJC_CLASS___SUControllerPolicyParam);
    v23 = (SUControllerPolicyParam *)objc_claimAutoreleasedReturnValue([v5 error]);
    unsigned int v24 = -[SUControllerPolicyParam initWithError:](v26, "initWithError:", v23);
    v25 = @"ApplyFailedManual";
  }

  [v21 followupEvent:v25 withInfo:v24];

LABEL_16:
  return 0LL;
}

- (int64_t)action_ApplyFailedRemoveAll:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"%@:(APPLY) %@",  @"[__MILESTONE__]",  @"apply attempt failed (when earlier trigger indicated abandon on apply failure)");
  -[SUControllerPolicyEngine clearFound:]( self,  "clearFound:",  @"apply attempt failed (when earlier trigger indicated abandon on apply failure)");
  -[SUControllerPolicyEngine cleanPersistedState:](self, "cleanPersistedState:", @"apply failed - abandoning");
  -[SUControllerPolicyEngine setUpdateControl:](self, "setUpdateControl:", 0LL);
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  11LL,  @"apply attempt failed (when earlier trigger indicated abandon on apply failure)");
  -[SUControllerPolicyEngine removeAllUpdateContent](self, "removeAllUpdateContent");
  return 0LL;
}

- (int64_t)action_ClearFound:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  11LL,  @"clearing knowledge of any found update");
  -[SUControllerPolicyEngine clearFound:](self, "clearFound:", @"clearing knowledge of any found update");
  return 0LL;
}

- (int64_t)action_ClearFoundTrackPurge:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(PURGE) %@",  @"[__MILESTONE__]",  @"clearing knowledge of any found update (tracking purge request)");
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  11LL,  @"clearing knowledge of any found update (tracking purge request)");
  -[SUControllerPolicyEngine clearFound:]( self,  "clearFound:",  @"clearing knowledge of any found update (tracking purge request)");
  -[SUControllerPolicyEngine scanContentIntent:forReason:]( self,  "scanContentIntent:forReason:",  1LL,  @"clearing knowledge of any found update (tracking purge request)");
  -[SUControllerPolicyEngine appendPendingPurgeCompletion:](self, "appendPendingPurgeCompletion:", v5);

  return 0LL;
}

- (int64_t)action_ClearFoundCancelUpdate:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 buildError:8406 underlying:0 description:@"no available update - canceling current update"]);
  -[SUControllerPolicyEngine updateFailurePoint:reportingStatus:error:]( self,  "updateFailurePoint:reportingStatus:error:",  @"no available update - canceling current update",  @"abandoningRevoked",  v8);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(REVOKED) %@",  @"[__MILESTONE__]",  @"no available update - canceling current update");
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  11LL,  @"no available update - canceling current update");
  -[SUControllerPolicyEngine clearFound:](self, "clearFound:", @"no available update - canceling current update");
  -[SUControllerPolicyEngine cancelCurrentUpdate](self, "cancelCurrentUpdate");
  return 0LL;
}

- (int64_t)action_ClearFoundCancelStopAuto:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 buildError:8406 underlying:0 description:@"no available update - canceling current update (stopping auto-install wait)"]);
  -[SUControllerPolicyEngine updateFailurePoint:reportingStatus:error:]( self,  "updateFailurePoint:reportingStatus:error:",  @"no available update - canceling current update (stopping auto-install wait)",  @"abandoningRevoked",  v8);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(REVOKED) %@",  @"[__MILESTONE__]",  @"no available update - canceling current update (stopping auto-install wait)");
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  11LL,  @"no available update - canceling current update (stopping auto-install wait)");
  -[SUControllerPolicyEngine autoInstallWindowCancelWait](self, "autoInstallWindowCancelWait");
  -[SUControllerPolicyEngine clearFound:]( self,  "clearFound:",  @"no available update - canceling current update (stopping auto-install wait)");
  -[SUControllerPolicyEngine cancelCurrentUpdate](self, "cancelCurrentUpdate");
  return 0LL;
}

- (int64_t)action_CancelUpdate:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v7 setTermsAccepted:0];

  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  11LL,  @"update failed - canceling current update");
  -[SUControllerPolicyEngine cancelCurrentUpdate](self, "cancelCurrentUpdate");
  return 0LL;
}

- (int64_t)action_CancelUpdateTrackPurge:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  id v12 = sub_1000382D8( @"SUControllerError",  43LL,  0LL,  @"client triggered purge - canceling current update",  v8,  v9,  v10,  v11,  v15);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[SUControllerPolicyEngine updateFailurePoint:reportingStatus:error:]( self,  "updateFailurePoint:reportingStatus:error:",  @"client triggered purge - canceling current update",  @"abandoningPurge",  v13);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(PURGE) %@ (tracking any purge request)",  @"[__MILESTONE__]",  @"client triggered purge - canceling current update");
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  11LL,  @"client triggered purge - canceling current update");
  -[SUControllerPolicyEngine clearFound:]( self,  "clearFound:",  @"client triggered purge - canceling current update");
  -[SUControllerPolicyEngine cancelCurrentUpdate](self, "cancelCurrentUpdate");
  -[SUControllerPolicyEngine scanContentIntent:forReason:]( self,  "scanContentIntent:forReason:",  1LL,  @"client triggered purge - canceling current update");
  -[SUControllerPolicyEngine appendPendingPurgeCompletion:](self, "appendPendingPurgeCompletion:", v5);

  return 0LL;
}

- (int64_t)action_CancelUpdateStopAutoTrackPurge:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  id v12 = sub_1000382D8( @"SUControllerError",  43LL,  0LL,  @"client triggered purge (when had been waiting for auto-install) - canceling current update",  v8,  v9,  v10,  v11,  v15);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[SUControllerPolicyEngine updateFailurePoint:reportingStatus:error:]( self,  "updateFailurePoint:reportingStatus:error:",  @"client triggered purge (when had been waiting for auto-install) - canceling current update",  @"abandoningPurgeAuto",  v13);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(PURGE) %@",  @"[__MILESTONE__]",  @"client triggered purge (when had been waiting for auto-install) - canceling current update");
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  11LL,  @"client triggered purge (when had been waiting for auto-install) - canceling current update");
  -[SUControllerPolicyEngine autoInstallWindowCancelWait](self, "autoInstallWindowCancelWait");
  -[SUControllerPolicyEngine clearFound:]( self,  "clearFound:",  @"client triggered purge (when had been waiting for auto-install) - canceling current update");
  -[SUControllerPolicyEngine cancelCurrentUpdate](self, "cancelCurrentUpdate");
  -[SUControllerPolicyEngine scanContentIntent:forReason:]( self,  "scanContentIntent:forReason:",  1LL,  @"client triggered purge (when had been waiting for auto-install) - canceling current update");
  -[SUControllerPolicyEngine appendPendingPurgeCompletion:](self, "appendPendingPurgeCompletion:", v5);

  return 0LL;
}

- (int64_t)action_TrackPurge:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(PURGE) %@",  @"[__MILESTONE__]",  @"purging update");
  -[SUControllerPolicyEngine clearFound:](self, "clearFound:", @"purging update");
  -[SUControllerPolicyEngine scanContentIntent:forReason:]( self,  "scanContentIntent:forReason:",  1LL,  @"purging update");
  -[SUControllerPolicyEngine autoInstallWindowCancelWait](self, "autoInstallWindowCancelWait");
  -[SUControllerPolicyEngine appendPendingPurgeCompletion:](self, "appendPendingPurgeCompletion:", v5);

  return 0LL;
}

- (int64_t)action_RemoveAll:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(PURGE) %@",  @"[__MILESTONE__]",  @"removing all update content");
  -[SUControllerPolicyEngine clearFound:](self, "clearFound:", @"removing all update content");
  -[SUControllerPolicyEngine cleanPersistedState:](self, "cleanPersistedState:", @"removing all update content");
  -[SUControllerPolicyEngine setUpdateControl:](self, "setUpdateControl:", 0LL);
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  11LL,  @"removing all update content");
  -[SUControllerPolicyEngine removeAllUpdateContent](self, "removeAllUpdateContent");
  return 0LL;
}

- (int64_t)action_RemoveAllPreservingScanState:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(PURGE) %@",  @"[__MILESTONE__]",  @"removing all update content including scan content (preserving scan state)");
  -[SUControllerPolicyEngine clearFound:]( self,  "clearFound:",  @"removing all update content including scan content (preserving scan state)");
  -[SUControllerPolicyEngine cleanPersistedState:]( self,  "cleanPersistedState:",  @"removing all update content including scan content (preserving scan state)");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine preservedScanBaseUUID](self, "preservedScanBaseUUID"));

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine preservedScanBaseUUID](self, "preservedScanBaseUUID"));
    -[SUControllerPolicyEngine persistScanUUID:withRampingForeground:forReason:]( self,  "persistScanUUID:withRampingForeground:forReason:",  v8,  -[SUControllerPolicyEngine perservedScanRampingForeground](self, "perservedScanRampingForeground"),  @"removing all update content including scan content (preserving scan state)");
  }

  -[SUControllerPolicyEngine setUpdateControl:](self, "setUpdateControl:", 0LL);
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  11LL,  @"removing all update content including scan content (preserving scan state)");
  -[SUControllerPolicyEngine scanContentIntent:forReason:]( self,  "scanContentIntent:forReason:",  1LL,  @"removing all update content including scan content (preserving scan state)");
  -[SUControllerPolicyEngine removeAllUpdateContent](self, "removeAllUpdateContent");
  return 0LL;
}

- (int64_t)action_RemoveAllIncludingDoc:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(PURGE) %@",  @"[__MILESTONE__]",  @"removing all update content including scan content (including doc)");
  -[SUControllerPolicyEngine clearFound:]( self,  "clearFound:",  @"removing all update content including scan content (including doc)");
  -[SUControllerPolicyEngine cleanPersistedState:]( self,  "cleanPersistedState:",  @"removing all update content including scan content (including doc)");
  -[SUControllerPolicyEngine setUpdateControl:](self, "setUpdateControl:", 0LL);
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  11LL,  @"removing all update content including scan content (including doc)");
  -[SUControllerPolicyEngine scanContentIntent:forReason:]( self,  "scanContentIntent:forReason:",  1LL,  @"removing all update content including scan content (including doc)");
  -[SUControllerPolicyEngine removeAllUpdateContent](self, "removeAllUpdateContent");
  return 0LL;
}

- (int64_t)action_RemoveAllTrackPurge:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(PURGE) %@",  @"[__MILESTONE__]",  @"removing all update content (potentially due to purge request)");
  -[SUControllerPolicyEngine cleanPersistedState:]( self,  "cleanPersistedState:",  @"removing all update content (potentially due to purge request)");
  -[SUControllerPolicyEngine setUpdateControl:](self, "setUpdateControl:", 0LL);
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  11LL,  @"removing all update content (potentially due to purge request)");
  -[SUControllerPolicyEngine scanContentIntent:forReason:]( self,  "scanContentIntent:forReason:",  1LL,  @"removing all update content (potentially due to purge request)");
  -[SUControllerPolicyEngine removeAllUpdateContent](self, "removeAllUpdateContent");
  -[SUControllerPolicyEngine autoInstallWindowCancelWait](self, "autoInstallWindowCancelWait");
  -[SUControllerPolicyEngine appendPendingPurgeCompletion:](self, "appendPendingPurgeCompletion:", v5);

  return 0LL;
}

- (int64_t)action_AttemptFailedRemoveAll:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  11LL,  @"failure reported from SUCoreUpdate");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);

  -[SUControllerPolicyEngine updateFailurePoint:reportingStatus:error:]( self,  "updateFailurePoint:reportingStatus:error:",  @"failure reported from SUCoreUpdate",  @"updateFailed",  v8);
  -[SUControllerPolicyEngine cleanPersistedState:]( self,  "cleanPersistedState:",  @"failure reported from SUCoreUpdate");
  -[SUControllerPolicyEngine setUpdateControl:](self, "setUpdateControl:", 0LL);
  -[SUControllerPolicyEngine removeAllUpdateContent](self, "removeAllUpdateContent");
  return 0LL;
}

- (int64_t)action_AttemptFailedClearFound:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 buildError:8406 underlying:0 description:@"scan found no update available (when attempting to apply the update)"]);
  -[SUControllerPolicyEngine abandonWhenApplying:reportingStatus:abandonError:settingFound:]( self,  "abandonWhenApplying:reportingStatus:abandonError:settingFound:",  @"scan found no update available (when attempting to apply the update)",  @"noLongerAvailableWhenApplying",  v8,  0LL);

  return 0LL;
}

- (int64_t)action_AttemptFailedSetFound:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 buildError:8408 underlying:0 description:@"scan found newer update available (when attempting to apply the update)"]);
  -[SUControllerPolicyEngine abandonWhenApplying:reportingStatus:abandonError:settingFound:]( self,  "abandonWhenApplying:reportingStatus:abandonError:settingFound:",  @"scan found newer update available (when attempting to apply the update)",  @"newerWhenApplying",  v9,  v5);

  return 0LL;
}

- (int64_t)action_AttemptFailedSetFoundImmediate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 buildError:8408 underlying:0 description:@"updateAcceptingTerms: scan found newer update available (when attempting to apply the update)"]);
  -[SUControllerPolicyEngine abandonWhenApplying:reportingStatus:abandonError:settingFound:]( self,  "abandonWhenApplying:reportingStatus:abandonError:settingFound:",  @"updateAcceptingTerms: scan found newer update available (when attempting to apply the update)",  @"newerWhenApplying",  v9,  v5);

  -[SUControllerPolicyEngine activePersonalize:](self, "activePersonalize:", v5);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 scanUUID]);
  id v11 = [v5 rampingForeground];

  -[SUControllerPolicyEngine persistScanUUID:withRampingForeground:forReason:]( self,  "persistScanUUID:withRampingForeground:forReason:",  v10,  v11,  @"updateAcceptingTerms: scan found newer update available (when attempting to apply the update)");
  -[SUControllerPolicyEngine advanceUpdateTarget:forReason:]( self,  "advanceUpdateTarget:forReason:",  14LL,  @"updateAcceptingTerms: scan found newer update available (when attempting to apply the update)");
  return 0LL;
}

- (int64_t)action_AttemptFailedTrackPurge:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine policyLog:](self, "policyLog:", @"%@:(PURGE) purging update (if apply fails)");
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  11LL,  @"SPI purge (when attempting to apply the update)");
  -[SUControllerPolicyEngine scanContentIntent:forReason:]( self,  "scanContentIntent:forReason:",  1LL,  @"SPI purge (when attempting to apply the update)");
  -[SUControllerPolicyEngine appendPendingPurgeCompletion:](self, "appendPendingPurgeCompletion:", v5);

  id v12 = sub_1000382D8( @"SUControllerError",  43LL,  0LL,  @"SPI purge (when attempting to apply the update)",  v8,  v9,  v10,  v11,  (uint64_t)@"[__MILESTONE__]");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[SUControllerPolicyEngine abandonWhenApplying:reportingStatus:abandonError:settingFound:]( self,  "abandonWhenApplying:reportingStatus:abandonError:settingFound:",  @"SPI purge (when attempting to apply the update)",  @"purgeWhenApplying",  v13,  0LL);

  return 0LL;
}

- (int64_t)action_ReportUpdateProgress:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  [v5 reachedState],  @"current update attempt progress");
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 progress]);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    unsigned __int8 v10 = -[SUControllerPolicyEngine haveNotifiedPrepared](self, "haveNotifiedPrepared");

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 progress]);
      -[SUControllerPolicyEngine broadcastProgressTowardPrepared:](self, "broadcastProgressTowardPrepared:", v11);

      if (-[SUControllerPolicyEngine haveReportedOTADownloaded](self, "haveReportedOTADownloaded"))
      {
        uint64_t v12 = kSUProgressPhasePreparing;
      }

      else
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 progress]);
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 phase]);
        uint64_t v12 = kSUProgressPhasePreparing;
        unsigned int v15 = [v14 isEqualToString:kSUProgressPhasePreparing];

        if (v15)
        {
          -[SUControllerPolicyEngine reportOTADownloaded:](self, "reportOTADownloaded:", @"preparingUpdate");
          -[SUControllerPolicyEngine setHaveReportedOTADownloaded:](self, "setHaveReportedOTADownloaded:", 1LL);
          unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
          [v16 setPrepareWasStarted:1];
        }
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 progress]);
      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 phase]);
      if ([v18 isEqualToString:v12])
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 progress]);
        [v19 portionComplete];
        float v21 = v20;

        if (v21 == 1.0) {
          -[SUControllerPolicyEngine setHaveNotifiedPrepared:](self, "setHaveNotifiedPrepared:", 1LL);
        }
      }

      else
      {
      }
    }
  }

  return 0LL;
}

- (int64_t)action_ReportPrepared:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(PREPARE) update has been prepared",  @"[__MILESTONE__]");
  -[SUControllerPolicyEngine broadcastPrepared:](self, "broadcastPrepared:", 0LL);
  return 0LL;
}

- (int64_t)action_ReportWaitAuto:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(AUTO-INSTALL) update has been prepared, waiting for auto-install window to apply the update",  @"[__MILESTONE__]");
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  9LL,  @"update has been prepared, waiting for auto-install window to apply the update");
  -[SUControllerPolicyEngine broadcastPrepared:](self, "broadcastPrepared:", 1LL);
  -[SUControllerPolicyEngine autoInstallWindowWaitForAllowed](self, "autoInstallWindowWaitForAllowed");
  return 0LL;
}

- (int64_t)action_ReportVerifyFailed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  8LL,  @"unable to verify latest");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
  -[SUControllerPolicyEngine broadcastVerifyFailed:](self, "broadcastVerifyFailed:", v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
  -[SUControllerPolicyEngine reportOTAPostponed:dueToError:]( self,  "reportOTAPostponed:dueToError:",  @"verifyFailed",  v9);

  return 0LL;
}

- (int64_t)action_ReportApplyFailed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
  -[SUControllerPolicyEngine broadcastApplyFailed:](self, "broadcastApplyFailed:", v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
  -[SUControllerPolicyEngine reportOTAPostponed:dueToError:]( self,  "reportOTAPostponed:dueToError:",  @"applyFailed",  v9);

  return 0LL;
}

- (int64_t)action_ReportApplyFailedWaitAuto:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
  -[SUControllerPolicyEngine broadcastApplyFailed:](self, "broadcastApplyFailed:", v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
  -[SUControllerPolicyEngine reportOTAPostponed:dueToError:]( self,  "reportOTAPostponed:dueToError:",  @"applyFailed",  v9);

  -[SUControllerPolicyEngine autoInstallWindowWaitForAllowed](self, "autoInstallWindowWaitForAllowed");
  return 0LL;
}

- (int64_t)action_ReportApplyFailedRemoveAll:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
  -[SUControllerPolicyEngine broadcastApplyFailed:](self, "broadcastApplyFailed:", v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
  -[SUControllerPolicyEngine updateFailurePoint:reportingStatus:error:]( self,  "updateFailurePoint:reportingStatus:error:",  @"apply failed (no retry) - removing all update content",  @"abandoningApplyFailedNoRetry",  v9);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(REMOVE_ALL) %@",  @"[__MILESTONE__]",  @"apply failed (no retry) - removing all update content");
  -[SUControllerPolicyEngine clearFound:]( self,  "clearFound:",  @"apply failed (no retry) - removing all update content");
  -[SUControllerPolicyEngine cleanPersistedState:]( self,  "cleanPersistedState:",  @"apply failed (no retry) - removing all update content");
  -[SUControllerPolicyEngine setUpdateControl:](self, "setUpdateControl:", 0LL);
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  11LL,  @"apply failed (no retry) - removing all update content");
  -[SUControllerPolicyEngine setUpdateAttemptFailureError:](self, "setUpdateAttemptFailureError:", 0LL);
  -[SUControllerPolicyEngine removeAllUpdateContent](self, "removeAllUpdateContent");
  return 0LL;
}

- (int64_t)action_ReportAwaitingReboot:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(INSTALL) update has been applied - awaiting reboot to finish install",  @"[__MILESTONE__]");
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  14LL,  @"update has been applied");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v7 setUpdateIsApplied:1];

  -[SUControllerPolicyEngine broadcastAwaitingReboot](self, "broadcastAwaitingReboot");
  -[SUControllerPolicyEngine setHaveNotifiedApplied:](self, "setHaveNotifiedApplied:", 1LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 buildError:8115 underlying:0 description:@"awaiting reboot so update cannot be removed"]);
  -[SUControllerPolicyEngine issuePendingPurgeCompletions:](self, "issuePendingPurgeCompletions:", v9);

  return 0LL;
}

- (int64_t)action_ReportVerifyFailedWaitAuto:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  9LL,  @"unable to verify latest (awaiting next auto-install window)");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
  -[SUControllerPolicyEngine broadcastVerifyFailed:](self, "broadcastVerifyFailed:", v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
  -[SUControllerPolicyEngine reportOTAPostponed:dueToError:]( self,  "reportOTAPostponed:dueToError:",  @"verifyFailedAuto",  v9);

  -[SUControllerPolicyEngine autoInstallWindowWaitForAllowed](self, "autoInstallWindowWaitForAllowed");
  return 0LL;
}

- (int64_t)action_ReportApplyProgress:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  [v5 reachedState],  @"current apply attempt progress");
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 progress]);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    unsigned __int8 v10 = -[SUControllerPolicyEngine haveNotifiedApplied](self, "haveNotifiedApplied");

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 progress]);
      -[SUControllerPolicyEngine broadcastProgressTowardApplied:](self, "broadcastProgressTowardApplied:", v11);
    }
  }

  return 0LL;
}

- (int64_t)action_LogInstallFailedNoUpdate:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[INSTALL_FAILED] install request received when no update to install");
  return 0LL;
}

- (int64_t)action_LogInstallFailedActivating:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[INSTALL_FAILED] install request received when activating");
  return 0LL;
}

- (int64_t)action_LogInstallCanceling:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[INSTALL_FAILED] install request received when update is being canceled");
  return 0LL;
}

- (int64_t)action_LogInstallAwaitingReboot:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[INSTALL_IGNORED] install request received when update already applied (awaiting reboot)");
  return 0LL;
}

- (int64_t)action_LogRemoveAwaitingReboot:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[REMOVE_FAILED] remove request received when update already applied (awaiting reboot)");
  -[SUControllerPolicyEngine appendPendingPurgeCompletion:](self, "appendPendingPurgeCompletion:", v5);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 buildError:8115 underlying:0 description:@"awaiting reboot so update cannot be removed"]);
  -[SUControllerPolicyEngine issuePendingPurgeCompletions:](self, "issuePendingPurgeCompletions:", v9);

  return 0LL;
}

- (int64_t)action_LogExpiredDecideWaitAuto:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  if (([v7 useSpecifiedInstallWindow] & 1) == 0)
  {

    goto LABEL_5;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  unsigned __int8 v9 = [v8 expiredSpecifiedAsExpired];

  if ((v9 & 1) != 0)
  {
LABEL_5:
    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[AUTO_INSTALL] wait for auto-install window has expired (restaring auto-install wait for next potential window)");
    -[SUControllerPolicyEngine autoInstallWindowWaitForAllowed](self, "autoInstallWindowWaitForAllowed");
    -[SUControllerPolicyEngine reportOTAPostponed:dueToError:]( self,  "reportOTAPostponed:dueToError:",  kSUCoreControllerOperationExpired,  0LL);
    return 0LL;
  }

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[AUTO_INSTALL] wait for auto-install window has expired (using specified install window so installing)");
  unsigned __int8 v10 = -[SUControllerPolicyParam initWithApplyInvokedBy:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithApplyInvokedBy:",  @"TestConfig");
  -[SUControllerPolicyEngine decideFollowupAfterAutoInstallFired:](self, "decideFollowupAfterAutoInstallFired:", v10);

  return 0LL;
}

- (int64_t)action_SUContentPurgedDecideNewer:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (-[SUControllerPolicyEngine removingSUContent](self, "removingSUContent"))
  {
    -[SUControllerPolicyEngine setRemovingSUContent:](self, "setRemovingSUContent:", 0LL);
    if (-[SUControllerPolicyEngine removingScanContent](self, "removingScanContent"))
    {
      -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[UPDATE_REMOVED] SU content has been removed - awaiting completion of scan content removal");
    }

    else if (!-[SUControllerPolicyEngine removeScanContent](self, "removeScanContent"))
    {
      -[SUControllerPolicyEngine finishFailedUpdateAttempt:]( self,  "finishFailedUpdateAttempt:",  @"SU content purged (unable to trigger removal of scan content)");
    }
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 diag]);
    [v8 trackAnomaly:@"[POLICY]" forReason:@"SU content purged when not removing SU content" withResult:8117 withError:0];
  }

  return 0LL;
}

- (int64_t)action_ScanPurgedDecideNewer:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (-[SUControllerPolicyEngine removingScanContent](self, "removingScanContent"))
  {
    -[SUControllerPolicyEngine setRemovingScanContent:](self, "setRemovingScanContent:", 0LL);
    if (-[SUControllerPolicyEngine removingSUContent](self, "removingSUContent")) {
      -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[UPDATE_REMOVED] scan content has been removed - awaiting completion of SU content removal");
    }
    else {
      -[SUControllerPolicyEngine finishFailedUpdateAttempt:]( self,  "finishFailedUpdateAttempt:",  @"scan content purged (all update content has been removed)");
    }
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 diag]);
    [v8 trackAnomaly:@"[POLICY]" forReason:@"scan content purged when not removing scan content" withResult:8117 withError:0];
  }

  return 0LL;
}

- (int64_t)action_SUContentPurgedDecideRemoved:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (!-[SUControllerPolicyEngine removingSUContent](self, "removingSUContent"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    uint64_t v8 = (SUControllerPolicyParam *)objc_claimAutoreleasedReturnValue([v7 diag]);
    -[SUControllerPolicyParam trackAnomaly:forReason:withResult:withError:]( v8,  "trackAnomaly:forReason:withResult:withError:",  @"[POLICY]",  @"SU content purged when not removing SU content",  8117LL,  0LL);
    goto LABEL_7;
  }

  -[SUControllerPolicyEngine setRemovingSUContent:](self, "setRemovingSUContent:", 0LL);
  if (!-[SUControllerPolicyEngine removingScanContent](self, "removingScanContent"))
  {
    if (-[SUControllerPolicyEngine removeScanContent](self, "removeScanContent")) {
      return 0LL;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
    [v7 followupEvent:@"PurgeRemovedAll" withInfo:v8];
LABEL_7:

    return 0LL;
  }

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[UPDATE_REMOVED] SU content has been removed - awaiting completion of scan content removal");
  return 0LL;
}

- (int64_t)action_ScanPurgedDecideRemoved:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (!-[SUControllerPolicyEngine removingScanContent](self, "removingScanContent"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    uint64_t v8 = (SUControllerPolicyParam *)objc_claimAutoreleasedReturnValue([v7 diag]);
    -[SUControllerPolicyParam trackAnomaly:forReason:withResult:withError:]( v8,  "trackAnomaly:forReason:withResult:withError:",  @"[POLICY]",  @"scan content purged when not removing scan content",  8117LL,  0LL);
LABEL_6:

    return 0LL;
  }

  -[SUControllerPolicyEngine setRemovingScanContent:](self, "setRemovingScanContent:", 0LL);
  -[SUControllerPolicyEngine scanContentIntent:forReason:]( self,  "scanContentIntent:forReason:",  0LL,  @"scan content has been removed");
  if (!-[SUControllerPolicyEngine removingSUContent](self, "removingSUContent"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
    [v7 followupEvent:@"PurgeRemovedAll" withInfo:v8];
    goto LABEL_6;
  }

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[UPDATE_REMOVED] scan content has been removed - awaiting completion of SU content removal");
  return 0LL;
}

- (int64_t)action_AnomalyScanBeforeActivated:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM", a3, a4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 diag]);
  [v6 dumpTracked:@"scan result before ScanManager activation" dumpingTo:5 usingFilename:0 clearingStatistics:0 clearingHistory:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 buildError:8115 underlying:0 description:@"scan result before ScanManager activation"]);

  -[SUControllerPolicyEngine _policyAnomaly:](self, "_policyAnomaly:", v8);
  return 0LL;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"unknown action(%@)",  v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 diag]);
  [v8 dumpTracked:v6 dumpingTo:5 usingFilename:0 clearingStatistics:0 clearingHistory:0];

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 buildError:8116 underlying:0 description:v6]);

  -[SUControllerPolicyEngine _policyAnomaly:](self, "_policyAnomaly:", v10);
  return 0LL;
}

- (void)_policyAnomaly:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 diag]);
  objc_msgSend( v5,  "trackAnomaly:forReason:withResult:withError:",  @"[POLICY]",  @"policy FSM has reported an anomaly",  objc_msgSend(v4, "code"),  v4);
}

- (SUControllerPolicyEngine)initWithAttachedClients:(id)a3 withConfig:(id)a4 withAutoInstallManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v62.receiver = self;
  v62.super_class = (Class)&OBJC_CLASS___SUControllerPolicyEngine;
  uint64_t v12 = -[SUControllerPolicyEngine init](&v62, "init");
  if (!v12) {
    goto LABEL_7;
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[POLICY_ENGINE] init | useSUCore=YES", buf, 2u);
  }

  objc_storeStrong((id *)v12 + 9, a3);
  id v15 = [v10 copy];
  unsigned __int8 v16 = (void *)*((void *)v12 + 10);
  *((void *)v12 + 10) = v15;

  objc_storeStrong((id *)v12 + 13, a5);
  id v17 = -[SUCoreLog initWithCategory:](objc_alloc(&OBJC_CLASS___SUCoreLog), "initWithCategory:", @"PE");
  unsigned __int8 v18 = (void *)*((void *)v12 + 14);
  *((void *)v12 + 14) = v17;

  id v19 = (void *)*((void *)v12 + 4);
  *((void *)v12 + 4) = 0LL;

  float v20 = (void *)*((void *)v12 + 5);
  *((void *)v12 + 5) = 0LL;

  float v21 = (void *)*((void *)v12 + 6);
  *((void *)v12 + 6) = 0LL;

  v22 = (void *)*((void *)v12 + 7);
  *((void *)v12 + 7) = 0LL;

  v23 = (void *)*((void *)v12 + 8);
  *((void *)v12 + 8) = 0LL;

  unsigned int v24 = (void *)*((void *)v12 + 16);
  *((void *)v12 + 16) = 0LL;

  v25 = (void *)*((void *)v12 + 17);
  *((void *)v12 + 17) = 0LL;

  v26 = (void *)*((void *)v12 + 18);
  *((void *)v12 + 18) = 0LL;

  *(_OWORD *)(v12 + 88) = xmmword_100049BA0;
  v27 = (void *)MGCopyAnswer(@"ProductVersion", 0LL);
  v28 = (void *)MGCopyAnswer(@"BuildVersion", 0LL);
  v29 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"PolicyEngine:%@(%@)",  v27,  v28);
  v30 = (void *)*((void *)v12 + 15);
  *((void *)v12 + 15) = v29;

  id v31 = [(id)objc_opt_class(SUControllerPolicyEngine) _generateStateTable];
  uint64_t v32 = objc_claimAutoreleasedReturnValue(v31);
  id v33 = (void *)*((void *)v12 + 19);
  *((void *)v12 + 19) = v32;

  v34 = objc_alloc(&OBJC_CLASS___SUCoreFSM);
  id v35 = -[SUCoreFSM initMachine:withTable:startingIn:usingDelegate:registeringAllInfoClass:]( v34,  "initMachine:withTable:startingIn:usingDelegate:registeringAllInfoClass:",  *((void *)v12 + 15),  *((void *)v12 + 19),  kSU_S_Startup,  v12,  objc_opt_class(&OBJC_CLASS___SUControllerPolicyParam));
  v36 = (void *)*((void *)v12 + 20);
  *((void *)v12 + 20) = v35;

  if (!*((void *)v12 + 20))
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue([v58 oslog]);

    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_10003D838(v59);
    }

    goto LABEL_11;
  }

  v37 = objc_alloc(&OBJC_CLASS___SUCorePersistedState);
  v38 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v12 + 20) extendedStateQueue]);
  v39 = -[SUCorePersistedState initWithDispatchQueue:withPersistencePath:forPolicyVersion:]( v37,  "initWithDispatchQueue:withPersistencePath:forPolicyVersion:",  v38,  @"/var/mobile/Library/SoftwareUpdate/SUControllerPolicy.state",  @"1.0");
  v40 = (void *)*((void *)v12 + 3);
  *((void *)v12 + 3) = v39;

  if (!*((void *)v12 + 3))
  {
LABEL_11:

    v57 = 0LL;
    goto LABEL_12;
  }

  uint64_t v41 = (void *)*((void *)v12 + 22);
  *((void *)v12 + 22) = 0LL;

  v42 = (void *)*((void *)v12 + 23);
  *((void *)v12 + 23) = 0LL;

  v12[9] = 0;
  v43 = (void *)*((void *)v12 + 21);
  *((void *)v12 + 21) = 0LL;

  v12[8] = 0;
  v44 = (void *)*((void *)v12 + 24);
  *((void *)v12 + 24) = 0LL;

  v12[17] = 0;
  *(_DWORD *)(v12 + 10) = 0;
  v12[14] = 0;
  v45 = (void *)*((void *)v12 + 26);
  *((void *)v12 + 26) = 0LL;

  v46 = (void *)*((void *)v12 + 27);
  *((void *)v12 + 27) = 0LL;

  v47 = (void *)*((void *)v12 + 28);
  *((void *)v12 + 28) = 0LL;

  v48 = (void *)*((void *)v12 + 29);
  *((void *)v12 + 29) = 0LL;

  v49 = (void *)*((void *)v12 + 30);
  *((void *)v12 + 30) = 0LL;

  v50 = (void *)*((void *)v12 + 31);
  *((void *)v12 + 31) = 0LL;

  *((void *)v12 + 32) = 0LL;
  v51 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v52 = (void *)*((void *)v12 + 33);
  *((void *)v12 + 33) = v51;

  *(_WORD *)(v12 + 15) = 0;
  v53 = (void *)*((void *)v12 + 35);
  *((void *)v12 + 34) = 0LL;
  *((void *)v12 + 35) = 0LL;

  v54 = (void *)*((void *)v12 + 36);
  *((void *)v12 + 36) = 0LL;

  v55 = (void *)*((void *)v12 + 37);
  *((void *)v12 + 37) = 0LL;

  v56 = (void *)*((void *)v12 + 38);
  *((void *)v12 + 38) = 0LL;

LABEL_7:
  v57 = v12;
LABEL_12:

  return v57;
}

- (BOOL)activateLoadingPersisted
{
  uint64_t v2 = self;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100018514;
  v6[3] = &unk_100065110;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

- (void)managerStatusForClient:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 extendedStateQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100018BC4;
    block[3] = &unk_100065138;
    block[4] = self;
    id v11 = v6;
    dispatch_async(v8, block);
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a3 summary]);
    -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[SPI] %@ {managerStatusForClient} invalid request - no completion provided",  v9);
  }
}

- (void)managerStateForClient:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 extendedStateQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100018E50;
    block[3] = &unk_100065138;
    block[4] = self;
    id v11 = v6;
    dispatch_async(v8, block);
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a3 summary]);
    -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[SPI] %@ {managerStateForClient} invalid request - no completion provided",  v9);
  }
}

- (void)managerConfigForClient:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 extendedStateQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100019078;
    block[3] = &unk_100065138;
    block[4] = self;
    id v11 = v6;
    dispatch_async(v8, block);
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a3 summary]);
    -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[SPI] %@ {updateConfigForClient} invalid request - no completion provided",  v9);
  }
}

- (void)modifyConfigForClient:(id)a3 alteringConfig:(id)a4 forChangeMask:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v11 changeSummary:a5]);
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[SPI] %@ {modifyConfigForClient} (mask=0x%llX) | changes: %@",  v13,  a5,  v14);

  if (v12)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    unsigned __int8 v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v15 extendedStateQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000192C8;
    block[3] = &unk_100065188;
    block[4] = self;
    id v19 = v11;
    int64_t v22 = a5;
    id v20 = v10;
    id v21 = v12;
    dispatch_async(v16, block);
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
    -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[SPI] %@ {modifyConfigForClient} invalid request - no completion provided",  v17);
  }
}

- (void)installUpdateForClient:(id)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = objc_alloc(&OBJC_CLASS___SUControllerPolicyParam);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 coreDescriptor]);

  uint64_t v8 = -[SUControllerPolicyParam initWithActiveDescriptor:withApplyInvokedBy:]( v6,  "initWithActiveDescriptor:withApplyInvokedBy:",  v7,  @"ClientSPI");
  [v9 postEvent:@"InstallUpdate" withInfo:v8];
}

- (void)userDidAcceptTermsAndConditionsForClient:(id)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = objc_alloc(&OBJC_CLASS___SUControllerPolicyParam);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 coreDescriptor]);

  uint64_t v8 = -[SUControllerPolicyParam initWithActiveDescriptor:](v6, "initWithActiveDescriptor:", v7);
  [v9 postEvent:@"UserDidAcceptTerms" withInfo:v8];
}

- (void)useSSOTokenToPersonalizeForClient:(id)a3 forDescriptor:(id)a4 usingSSOToken:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v9 = objc_alloc(&OBJC_CLASS___SUControllerPolicyParam);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 coreDescriptor]);

  id v11 = -[SUControllerPolicyParam initWithActiveDescriptor:ssoToken:](v9, "initWithActiveDescriptor:ssoToken:", v10, v7);
  [v12 postEvent:@"UseCredentials" withInfo:v11];
}

- (void)purgeUpdateForClient:(id)a3 forDescriptor:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v9 = objc_alloc(&OBJC_CLASS___SUControllerPolicyParam);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 coreDescriptor]);

  id v11 = -[SUControllerPolicyParam initWithActiveDescriptor:withPurgeCompletion:]( v9,  "initWithActiveDescriptor:withPurgeCompletion:",  v10,  v7);
  [v12 postEvent:@"RemoveUpdate" withInfo:v11];
}

- (void)scanGeneratedBaseUUID:(id)a3 rampingForeground:(BOOL)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 extendedStateQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000199A4;
  block[3] = &unk_1000651B0;
  block[4] = self;
  id v11 = v6;
  BOOL v12 = a4;
  id v9 = v6;
  dispatch_async(v8, block);
}

- (void)scanFoundUpdate:(id)a3 scanUUID:(id)a4 rampingForeground:(BOOL)a5 primaryDescriptor:(id)a6 secondaryDescriptor:(id)a7 scanOptions:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v19 extendedStateQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019B0C;
  block[3] = &unk_1000651D8;
  id v27 = v14;
  v28 = self;
  id v29 = v16;
  id v30 = v15;
  BOOL v33 = a5;
  id v31 = v17;
  id v32 = v18;
  id v21 = v18;
  id v22 = v17;
  id v23 = v15;
  id v24 = v16;
  id v25 = v14;
  dispatch_async(v20, block);
}

- (void)scanFoundUpdateImmediateAttempt:(id)a3 scanUUID:(id)a4 rampingForeground:(BOOL)a5 primaryDescriptor:(id)a6 secondaryDescriptor:(id)a7 withSSOToken:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v19 extendedStateQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019DE0;
  block[3] = &unk_1000651D8;
  id v27 = v16;
  v28 = self;
  id v29 = v14;
  id v30 = v15;
  BOOL v33 = a5;
  id v31 = v17;
  id v32 = v18;
  id v21 = v18;
  id v22 = v17;
  id v23 = v15;
  id v24 = v14;
  id v25 = v16;
  dispatch_async(v20, block);
}

- (void)scanFoundNoUpdateAvailable
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
  [v3 postEvent:@"ScanNoAvailableUpdate" withInfo:v2];
}

- (void)scanFoundPostponedUpdate:(id)a3 controllerStatus:(id)a4 scanUUID:(id)a5 rampingForeground:(BOOL)a6 primaryDescriptor:(id)a7 secondaryDescriptor:(id)a8 error:(id)a9
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a9;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v17 extendedStateQueue]);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10001A0B0;
  v23[3] = &unk_100065200;
  v23[4] = self;
  id v24 = v14;
  BOOL v28 = a6;
  id v25 = v13;
  id v26 = v15;
  id v27 = v16;
  id v19 = v16;
  id v20 = v15;
  id v21 = v13;
  id v22 = v14;
  dispatch_async(v18, v23);
}

- (void)cancelCurrentUpdate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateControl](self, "updateControl"));

  if (v3)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateControl](self, "updateControl"));
    [v7 cancelCurrentUpdate];
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 diag]);
    [v5 trackAnomaly:@"[POLICY]" forReason:@"cancel current update when no update control" withResult:8101 withError:0];

    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    id v6 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
    [v7 postEvent:@"UpdateCanceled" withInfo:v6];
  }
}

- (void)updateBrainLoadProgress:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v5 = -[SUControllerPolicyParam initWithProgress:reachingPolicyState:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithProgress:reachingPolicyState:",  v4,  4LL);

  [v6 postEvent:@"UpdateProgress" withInfo:v5];
}

- (void)updateBrainLoadStalled:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v5 = -[SUControllerPolicyParam initWithProgress:reachingPolicyState:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithProgress:reachingPolicyState:",  v4,  4LL);

  [v6 postEvent:@"UpdateProgress" withInfo:v5];
}

- (void)updateBrainLoaded:(id)a3
{
  id v4 = a3;
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(BRAIN) update brain loaded",  @"[__MILESTONE__]");
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v5 = -[SUControllerPolicyParam initWithProgress:reachingPolicyState:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithProgress:reachingPolicyState:",  v4,  5LL);

  [v6 postEvent:@"UpdateProgress" withInfo:v5];
}

- (void)updateAssetDownloadPreflighted
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  uint64_t v2 = -[SUControllerPolicyParam initWithPolicyState:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithPolicyState:",  6LL);
  [v3 postEvent:@"UpdateProgress" withInfo:v2];
}

- (void)updateAssetDownloadProgress:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v5 = -[SUControllerPolicyParam initWithProgress:reachingPolicyState:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithProgress:reachingPolicyState:",  v4,  6LL);

  [v6 postEvent:@"UpdateProgress" withInfo:v5];
}

- (void)updateAssetDownloadStalled:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v5 = -[SUControllerPolicyParam initWithProgress:reachingPolicyState:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithProgress:reachingPolicyState:",  v4,  6LL);

  [v6 postEvent:@"UpdateProgress" withInfo:v5];
}

- (void)updateAssetDownloaded:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v5 = -[SUControllerPolicyParam initWithProgress:reachingPolicyState:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithProgress:reachingPolicyState:",  v4,  6LL);

  [v6 postEvent:@"UpdateProgress" withInfo:v5];
}

- (void)updatePrepareProgress:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v5 = -[SUControllerPolicyParam initWithProgress:reachingPolicyState:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithProgress:reachingPolicyState:",  v4,  7LL);

  [v6 postEvent:@"UpdateProgress" withInfo:v5];
}

- (void)updatePrepared:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  uint64_t v5 = kSU_E_PrepareSuccess;
  id v6 = -[SUControllerPolicyParam initWithProgress:reachingPolicyState:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithProgress:reachingPolicyState:",  v4,  8LL);

  [v7 postEvent:v5 withInfo:v6];
}

- (void)updateApplyProgress:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  uint64_t v5 = kSU_E_ApplyProgress;
  id v6 = -[SUControllerPolicyParam initWithProgress:reachingPolicyState:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithProgress:reachingPolicyState:",  v4,  13LL);

  [v7 postEvent:v5 withInfo:v6];
}

- (void)updateApplied
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  uint64_t v2 = kSU_E_ApplySuccess;
  id v3 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
  [v4 postEvent:v2 withInfo:v3];
}

- (void)applyAttemptFailed:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  uint64_t v5 = kSU_E_ApplyFailed;
  id v6 = -[SUControllerPolicyParam initWithError:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithError:",  v4);

  [v7 postEvent:v5 withInfo:v6];
}

- (void)updateAttemptFailed:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 checkedIndications];
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = -[SUControllerPolicyParam initWithError:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithError:",  v4);

  if ((v5 & 2) != 0) {
    id v7 = @"UpdateFailedFallback";
  }
  else {
    id v7 = @"UpdateFailedDone";
  }
  [v8 postEvent:v7 withInfo:v6];
}

- (void)updateCanceled
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
  [v3 postEvent:@"UpdateCanceled" withInfo:v2];
}

- (void)updateAnomaly:(id)a3
{
}

- (void)autoInstallWindowWaitForAllowed
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  unsigned __int8 v5 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  -[SUControllerPolicyEngine setInstallWaitUUID:](self, "setInstallWaitUUID:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine installWaitUUID](self, "installWaitUUID"));
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[AUTO_INSTALL] awaitInstallAllowed (begin) installWaitUUID:%@",  v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine autoInstallManager](self, "autoInstallManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001A978;
  v9[3] = &unk_100065228;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 awaitInstallAllowed:v9];
}

- (void)autoInstallWindowWaitForAllowedComplete:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001AAA4;
  block[3] = &unk_100064860;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)autoInstallWindowCancelWait
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  -[SUControllerPolicyEngine setInstallWaitUUID:](self, "setInstallWaitUUID:", 0LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine autoInstallManager](self, "autoInstallManager"));
  [v5 cancelWaitInstallAllowed:40];
}

- (void)broadcastProgressTowardPrepared:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine lastReportedProgress](self, "lastReportedProgress"));
  if (!v7) {
    goto LABEL_3;
  }
  id v8 = (void *)v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine lastReportedProgress](self, "lastReportedProgress"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 phase]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine lastReportedProgress](self, "lastReportedProgress"));
  id v12 = [v11 isStalled];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine lastReportedProgress](self, "lastReportedProgress"));
  [v13 portionComplete];
  int v15 = v14;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine lastReportedProgress](self, "lastReportedProgress"));
  [v16 estimatedTimeRemaining];
  double v18 = v17;
  LODWORD(v17) = v15;
  LOBYTE(v12) = [v4 sameProgress:v10 isStalled:v12 portion:v17 remaining:v18];

  if ((v12 & 1) == 0)
  {
LABEL_3:
    id v19 = objc_alloc_init(&OBJC_CLASS___SUControllerDownload);
    id v20 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerPolicyEngine controllerDescriptorFromActiveDescriptor:]( self,  "controllerDescriptorFromActiveDescriptor:",  @"progressing toward prepared"));
    -[SUControllerDownload setDescriptor:](v19, "setDescriptor:", v20);

    id v21 = +[SUControllerSUCore newProgressFromCoreProgress:]( &OBJC_CLASS___SUControllerSUCore,  "newProgressFromCoreProgress:",  v4);
    -[SUControllerDownload setProgress:](v19, "setProgress:", v21);

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDownload progress](v19, "progress"));
    [v22 setIsDone:0];

    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[BROADCAST] progressing toward prepared | progress: %@",  v19);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
    v38[0] = v23;
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000793B8));
    v39[0] = v24;
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079498));
    v38[1] = v25;
    id v26 = sub_100034E04(v19);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v39[1] = v27;
    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  2LL));

    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine attachedClients](self, "attachedClients"));
    [v29 broadcastMessage:v28];

    id v30 = objc_alloc(&OBJC_CLASS___SUCoreProgress);
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v4 phase]);
    id v32 = [v4 isStalled];
    [v4 portionComplete];
    int v34 = v33;
    [v4 estimatedTimeRemaining];
    double v36 = v35;
    LODWORD(v35) = v34;
    v37 = -[SUCoreProgress initWithPhase:isStalled:portionComplete:remaining:]( v30,  "initWithPhase:isStalled:portionComplete:remaining:",  v31,  v32,  v35,  v36);
    -[SUControllerPolicyEngine setLastReportedProgress:](self, "setLastReportedProgress:", v37);
  }
}

- (void)broadcastPrepared:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (!-[SUControllerPolicyEngine haveNotifiedPrepared](self, "haveNotifiedPrepared"))
  {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___SUControllerDownload);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerPolicyEngine controllerDescriptorFromActiveDescriptor:]( self,  "controllerDescriptorFromActiveDescriptor:",  @"prepared"));
    -[SUControllerDownload setDescriptor:](v7, "setDescriptor:", v8);

    id v9 = objc_alloc_init(&OBJC_CLASS___SUControllerProgress);
    id v10 = v9;
    id v11 = off_100064A60;
    if (v3)
    {
      id v12 = @"[BROADCAST] update has been prepared (beginning wait for auto-install window) | progress: %@";
    }

    else
    {
      id v11 = off_100064A68;
      id v12 = @"[BROADCAST] update has been prepared | progress: %@";
    }

    -[SUControllerProgress setPhase:](v9, "setPhase:", *v11);
    LODWORD(v13) = 1.0;
    -[SUControllerProgress setPortionComplete:](v10, "setPortionComplete:", v13);
    -[SUControllerProgress setEstimatedTimeRemaining:](v10, "setEstimatedTimeRemaining:", 0.0);
    -[SUControllerProgress setIsDone:](v10, "setIsDone:", 1LL);
    -[SUControllerDownload setProgress:](v7, "setProgress:", v10);
    -[SUControllerPolicyEngine policyLog:](self, "policyLog:", v12, v7);
    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
    v21[0] = v14;
    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000793B8));
    v22[0] = v15;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079498));
    v21[1] = v16;
    id v17 = sub_100034E04(v7);
    double v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v22[1] = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine attachedClients](self, "attachedClients"));
    [v20 broadcastMessage:v19];

    -[SUControllerPolicyEngine setHaveNotifiedPrepared:](self, "setHaveNotifiedPrepared:", 1LL);
  }

- (void)broadcastVerifyingBeforeApply
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = objc_alloc_init(&OBJC_CLASS___SUControllerDownload);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerPolicyEngine controllerDescriptorFromActiveDescriptor:]( self,  "controllerDescriptorFromActiveDescriptor:",  @"verifying before apply"));
  -[SUControllerDownload setDescriptor:](v5, "setDescriptor:", v6);

  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___SUControllerProgress);
  -[SUControllerProgress setPhase:](v7, "setPhase:", @"VerifyingBeforeApplying");
  LODWORD(v8) = -1.0;
  -[SUControllerProgress setPortionComplete:](v7, "setPortionComplete:", v8);
  -[SUControllerProgress setEstimatedTimeRemaining:](v7, "setEstimatedTimeRemaining:", -1.0);
  -[SUControllerProgress setIsDone:](v7, "setIsDone:", 0LL);
  -[SUControllerDownload setProgress:](v5, "setProgress:", v7);
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[BROADCAST] verifying that update is still latest available before applying | progress: %@",  v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
  v16[0] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000793B8));
  v17[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079498));
  v16[1] = v11;
  id v12 = sub_100034E04(v5);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v17[1] = v13;
  int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));

  int v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine attachedClients](self, "attachedClients"));
  [v15 broadcastMessage:v14];
}

- (void)broadcastUpdateFailed
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateAttemptFailureDescriptor](self, "updateAttemptFailureDescriptor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateAttemptFailureError](self, "updateAttemptFailureError"));
  -[SUControllerPolicyEngine setUpdateAttemptFailureDescriptor:](self, "setUpdateAttemptFailureDescriptor:", 0LL);
  -[SUControllerPolicyEngine setUpdateAttemptFailureError:](self, "setUpdateAttemptFailureError:", 0LL);
  if (!v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    double v8 = v7;
    if (v5)
    {
      id v9 = @"update failed for descriptor";
      uint64_t v10 = 8101LL;
    }

    else
    {
      id v9 = @"update failed (indication that purge occurred when Idle)";
      uint64_t v10 = 8124LL;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 buildError:v10 underlying:0 description:v9]);
  }

  if (-[SUControllerPolicyEngine haveNotifiedPrepared](self, "haveNotifiedPrepared"))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
    v45[0] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000793E0));
    v46[0] = v12;
    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079490));
    v45[1] = v13;
    id v14 = sub_100034E04(v5);
    int v15 = v5;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v46[1] = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079478));
    v45[2] = v17;
    id v18 = sub_100034E04(v6);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v46[2] = v19;
    id v20 = (SUControllerDownload *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  3LL));

    id v21 = +[SUControllerSUCore newSafeErrorDescription:]( &OBJC_CLASS___SUControllerSUCore,  "newSafeErrorDescription:",  v6);
    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[BROADCAST] update failed (already prepared) | error: %@",  v21);

    id v22 = (SUControllerProgress *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine attachedClients](self, "attachedClients"));
    -[SUControllerProgress broadcastMessage:](v22, "broadcastMessage:", v20);
  }

  else
  {
    id v23 = objc_alloc_init(&OBJC_CLASS___SUControllerDownload);
    if (v5)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine activeScanPolicy](self, "activeScanPolicy"));
      id v25 = +[SUControllerSUCore newDescriptorFromCoreDescriptor:corePolicy:]( &OBJC_CLASS___SUControllerSUCore,  "newDescriptorFromCoreDescriptor:corePolicy:",  v5,  v24);
      -[SUControllerDownload setDescriptor:](v23, "setDescriptor:", v25);
    }

    id v22 = objc_alloc_init(&OBJC_CLASS___SUControllerProgress);
    unsigned int v26 = -[SUControllerPolicyEngine haveReportedOTADownloaded](self, "haveReportedOTADownloaded");
    id v27 = off_100064A50;
    if (!v26) {
      id v27 = off_100064A40;
    }
    -[SUControllerProgress setPhase:](v22, "setPhase:", *v27);
    LODWORD(v28) = -1.0;
    -[SUControllerProgress setPortionComplete:](v22, "setPortionComplete:", v28);
    -[SUControllerProgress setEstimatedTimeRemaining:](v22, "setEstimatedTimeRemaining:", -1.0);
    -[SUControllerProgress setIsDone:](v22, "setIsDone:", 0LL);
    -[SUControllerDownload setProgress:](v23, "setProgress:", v22);
    id v29 = +[SUControllerSUCore newSafeErrorDescription:]( &OBJC_CLASS___SUControllerSUCore,  "newSafeErrorDescription:",  v6);
    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[BROADCAST] update failed (before prepared) | error: %@",  v29);

    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
    v43[0] = v41;
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000793B8));
    v44[0] = v30;
    v42 = v5;
    id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079498));
    v43[1] = v31;
    id v32 = sub_100034E04(v22);
    int v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v44[1] = v33;
    int v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079478));
    v43[2] = v34;
    id v35 = sub_100034E04(v6);
    double v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v44[2] = v36;
    v37 = v6;
    v38 = v23;
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  3LL));

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine attachedClients](self, "attachedClients"));
    [v40 broadcastMessage:v39];

    int v15 = v42;
    id v20 = v38;
    id v6 = v37;
  }
}

- (void)broadcastVerifyFailed:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerPolicyEngine controllerDescriptorFromActiveDescriptor:]( self,  "controllerDescriptorFromActiveDescriptor:",  @"verify failed"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerSUCore errorFromCoreError:](&OBJC_CLASS___SUControllerSUCore, "errorFromCoreError:", v4));

  id v9 = +[SUControllerSUCore newSafeErrorDescription:](&OBJC_CLASS___SUControllerSUCore, "newSafeErrorDescription:", v8);
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[BROADCAST] verify latest available failed | error: %@",  v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
  v20[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000793E0));
  v21[0] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079490));
  v20[1] = v12;
  id v13 = sub_100034E04(v7);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v21[1] = v14;
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079478));
  v20[2] = v15;
  id v16 = sub_100034E04(v8);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  void v21[2] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  3LL));

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine attachedClients](self, "attachedClients"));
  [v19 broadcastMessage:v18];
}

- (void)broadcastApplyFailed:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerPolicyEngine controllerDescriptorFromActiveDescriptor:]( self,  "controllerDescriptorFromActiveDescriptor:",  @"apply failed"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerSUCore errorFromCoreError:](&OBJC_CLASS___SUControllerSUCore, "errorFromCoreError:", v4));

  id v9 = +[SUControllerSUCore newSafeErrorDescription:](&OBJC_CLASS___SUControllerSUCore, "newSafeErrorDescription:", v8);
  -[SUControllerPolicyEngine policyLog:](self, "policyLog:", @"[BROADCAST] apply failed | error: %@", v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
  v20[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000793E0));
  v21[0] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079490));
  v20[1] = v12;
  id v13 = sub_100034E04(v7);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v21[1] = v14;
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079478));
  v20[2] = v15;
  id v16 = sub_100034E04(v8);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  void v21[2] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  3LL));

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine attachedClients](self, "attachedClients"));
  [v19 broadcastMessage:v18];
}

- (void)broadcastAwaitingReboot
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerPolicyEngine controllerDescriptorFromActiveDescriptor:]( self,  "controllerDescriptorFromActiveDescriptor:",  @"awaiting reboot"));
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[BROADCAST] update has been applied - awaiting reboot to install the update");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
  v13[0] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000793E0));
  v14[0] = v7;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079490));
  v13[1] = v8;
  id v9 = sub_100034E04(v5);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v14[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine attachedClients](self, "attachedClients"));
  [v12 broadcastMessage:v11];
}

- (void)broadcastProgressTowardApplied:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine lastReportedApplyProgress](self, "lastReportedApplyProgress"));
  if (!v7) {
    goto LABEL_3;
  }
  double v8 = (void *)v7;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine lastReportedApplyProgress](self, "lastReportedApplyProgress"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v45 phase]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine lastReportedApplyProgress](self, "lastReportedApplyProgress"));
  id v11 = [v10 isStalled];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine lastReportedApplyProgress](self, "lastReportedApplyProgress"));
  [v12 portionComplete];
  int v14 = v13;
  int v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine lastReportedApplyProgress](self, "lastReportedApplyProgress"));
  [v15 estimatedTimeRemaining];
  double v17 = v16;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine lastReportedApplyProgress](self, "lastReportedApplyProgress"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 actionText]);
  LODWORD(v20) = v14;
  LOBYTE(v11) = [v4 sameProgress:v9 isStalled:v11 portion:v19 remaining:v20 actionText:v17];

  if ((v11 & 1) == 0)
  {
LABEL_3:
    id v21 = objc_alloc_init(&OBJC_CLASS___SUControllerApply);
    id v22 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerPolicyEngine controllerDescriptorFromActiveDescriptor:]( self,  "controllerDescriptorFromActiveDescriptor:",  @"progressing toward applied"));
    -[SUControllerApply setDescriptor:](v21, "setDescriptor:", v22);

    id v23 = +[SUControllerSUCore newProgressFromCoreProgress:]( &OBJC_CLASS___SUControllerSUCore,  "newProgressFromCoreProgress:",  v4);
    -[SUControllerApply setProgress:](v21, "setProgress:", v23);

    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerApply progress](v21, "progress"));
    [v24 setPhase:@"Applying"];

    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerApply progress](v21, "progress"));
    [v25 setIsDone:0];

    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v4 actionText]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerApply progress](v21, "progress"));
    [v27 setActionText:v26];

    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[BROADCAST] progressing toward applied | progress: %@",  v21);
    double v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
    v46[0] = v28;
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000793D8));
    v47[0] = v29;
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000794A0));
    v46[1] = v30;
    id v31 = sub_100034E04(v21);
    id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v47[1] = v32;
    int v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v47,  v46,  2LL));

    int v34 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine attachedClients](self, "attachedClients"));
    [v34 broadcastMessage:v33];

    id v35 = objc_alloc(&OBJC_CLASS___SUCoreProgress);
    double v36 = (void *)objc_claimAutoreleasedReturnValue([v4 phase]);
    id v37 = [v4 isStalled];
    [v4 portionComplete];
    int v39 = v38;
    [v4 estimatedTimeRemaining];
    double v41 = v40;
    v42 = (void *)objc_claimAutoreleasedReturnValue([v4 actionText]);
    LODWORD(v43) = v39;
    v44 = -[SUCoreProgress initWithPhase:isStalled:portionComplete:remaining:actionText:]( v35,  "initWithPhase:isStalled:portionComplete:remaining:actionText:",  v36,  v37,  v42,  v43,  v41);
    -[SUControllerPolicyEngine setLastReportedApplyProgress:](self, "setLastReportedApplyProgress:", v44);
  }
}

- (void)notifyExternalStateChange
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 extendedStateQueue]);
  dispatch_assert_queue_V2(v3);

  notify_post((const char *)[@"com.apple.SoftwareUpdateController.State.change" UTF8String]);
}

- (void)reportOTAAvailable:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(AVAILABLE) available update has been found | status:%@",  @"[__MILESTONE__]",  v4);
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
  int64_t v8 = -[SUControllerPolicyEngine updateCurrentPhase](self, "updateCurrentPhase");
  int64_t v9 = -[SUControllerPolicyEngine updateTarget](self, "updateTarget");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine foundPrimaryDescriptor](self, "foundPrimaryDescriptor"));
  +[SUControllerEventReporter reportAvailableEvent:withControllerConfig:forSessionUUID:fromCurrentState:targetingUpdateState:availableDescriptor:]( &OBJC_CLASS___SUControllerEventReporter,  "reportAvailableEvent:withControllerConfig:forSessionUUID:fromCurrentState:targetingUpdateState:availableDescriptor:",  v4,  v11,  v7,  v8,  v9,  v10);
}

- (void)reportOTADownloaded:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(DOWNLOAD) update has been downloaded | status:%@",  @"[__MILESTONE__]",  v4);
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
  int64_t v8 = -[SUControllerPolicyEngine updateCurrentPhase](self, "updateCurrentPhase");
  int64_t v9 = -[SUControllerPolicyEngine updateTarget](self, "updateTarget");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine activeDescriptor](self, "activeDescriptor"));
  +[SUControllerEventReporter reportDownloadedEvent:withControllerConfig:forSessionUUID:fromCurrentState:targetingUpdateState:downloadedDescriptor:]( &OBJC_CLASS___SUControllerEventReporter,  "reportDownloadedEvent:withControllerConfig:forSessionUUID:fromCurrentState:targetingUpdateState:downloadedDescriptor:",  v4,  v11,  v7,  v8,  v9,  v10);
}

- (void)reportOTAPostponed:(id)a3 dueToError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine activeDescriptor](self, "activeDescriptor"));
  -[SUControllerPolicyEngine reportOTAPostponed:forSessionUUID:postponedDescriptor:dueToError:]( self,  "reportOTAPostponed:forSessionUUID:postponedDescriptor:dueToError:",  v7,  v9,  v8,  v6);
}

- (void)reportOTAPostponed:(id)a3 forSessionUUID:(id)a4 postponedDescriptor:(id)a5 dueToError:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  int v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 extendedStateQueue]);
  dispatch_assert_queue_V2(v15);

  id v16 = +[SUControllerSUCore newSafeErrorDescription:]( &OBJC_CLASS___SUControllerSUCore,  "newSafeErrorDescription:",  v10);
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(POSTPONED) update has been postponed | status:%@, error:%@",  @"[__MILESTONE__]",  v13,  v16);

  id v17 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  +[SUControllerEventReporter reportPostponedEvent:withControllerConfig:forSessionUUID:fromCurrentState:targetingUpdateState:postponedDescriptor:dueToError:]( &OBJC_CLASS___SUControllerEventReporter,  "reportPostponedEvent:withControllerConfig:forSessionUUID:fromCurrentState:targetingUpdateState:postponedDescriptor:dueToError:",  v13,  v17,  v12,  -[SUControllerPolicyEngine updateCurrentPhase](self, "updateCurrentPhase"),  -[SUControllerPolicyEngine updateTarget](self, "updateTarget"),  v11,  v10);
}

- (void)reportOTAAbandoned:(id)a3 dueToError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  id v10 = +[SUControllerSUCore newSafeErrorDescription:](&OBJC_CLASS___SUControllerSUCore, "newSafeErrorDescription:", v6);
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(ABANDONED) update has been abandoned | status:%@, error:%@",  @"[__MILESTONE__]",  v7,  v10);

  id v15 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
  int64_t v12 = -[SUControllerPolicyEngine updateCurrentPhase](self, "updateCurrentPhase");
  int64_t v13 = -[SUControllerPolicyEngine updateTarget](self, "updateTarget");
  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine activeDescriptor](self, "activeDescriptor"));
  +[SUControllerEventReporter reportAbandonedEvent:withControllerConfig:forSessionUUID:fromCurrentState:targetingUpdateState:abandonedDescriptor:dueToError:]( &OBJC_CLASS___SUControllerEventReporter,  "reportAbandonedEvent:withControllerConfig:forSessionUUID:fromCurrentState:targetingUpdateState:abandonedDescriptor:dueToError:",  v7,  v15,  v11,  v12,  v13,  v14,  v6);
}

- (void)scanContentIntent:(int64_t)a3 forReason:(id)a4
{
  id v10 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  if (-[SUControllerPolicyEngine scanContentControl](self, "scanContentControl") != a3)
  {
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyEngine scanContentControlName:]( &OBJC_CLASS___SUControllerPolicyEngine,  "scanContentControlName:",  -[SUControllerPolicyEngine scanContentControl](self, "scanContentControl")));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyEngine scanContentControlName:]( &OBJC_CLASS___SUControllerPolicyEngine,  "scanContentControlName:",  a3));
    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[SCAN_CONTENT_CONTROL] adjusting intent for scan content (%@): %@ => %@",  v10,  v8,  v9);

    -[SUControllerPolicyEngine setScanContentControl:](self, "setScanContentControl:", a3);
  }
}

- (void)appendPendingPurgeCompletion:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  if ([v8 paramType] == (id)9)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 purgeCompletion]);

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine pendingPurgeComplete](self, "pendingPurgeComplete"));
      [v7 addObject:v8];
    }
  }
}

- (void)issuePendingPurgeCompletions:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine pendingPurgeComplete](self, "pendingPurgeComplete"));
  id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
        int64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 completionQueue]);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10001CAC8;
        block[3] = &unk_100065250;
        void block[4] = v11;
        id v17 = v4;
        dispatch_async(v13, block);
      }

      id v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v8);
  }

  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine pendingPurgeComplete](self, "pendingPurgeComplete"));
  [v14 removeAllObjects];
}

- (void)cleanPersistedState:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine setLoadedState:](self, "setLoadedState:", 0LL);
  id v7 = objc_alloc(&OBJC_CLASS___SUControllerPolicyPersistedState);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine corePersisted](self, "corePersisted"));
  uint64_t v9 = -[SUControllerPolicyPersistedState initWithPersisted:](v7, "initWithPersisted:", v8);
  -[SUControllerPolicyEngine setState:](self, "setState:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v10 clearPersisted:v4];

  -[SUControllerPolicyEngine persistBaseOSBuildVersion](self, "persistBaseOSBuildVersion");
}

- (void)persistBaseOSBuildVersion
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  id v8 = (id)MGCopyAnswer(@"ProductVersion", 0LL);
  id v5 = (void *)MGCopyAnswer(@"BuildVersion", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v6 setLastOSVersion:v8];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v7 setLastBuildVersion:v5];
}

- (void)persistScanUUID:(id)a3 withRampingForeground:(BOOL)a4 forReason:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 extendedStateQueue]);
  dispatch_assert_queue_V2(v11);

  int64_t v12 = @"NO";
  if (v5) {
    int64_t v12 = @"YES";
  }
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[SCAN_CONTENT_CONTROL] persisting scan state information (%@) | scanBaseUUID=%@, scanRampingForeground=%@",  v8,  v9,  v12);

  int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v13 setScanBaseUUID:v9];

  id v14 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v14 setScanRampingForeground:v5];
}

- (BOOL)isLoadedValidMatch:(id)a3 suAssets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0LL;
  __int128 v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_not_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 extendedStateQueue]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001CEB8;
  v15[3] = &unk_100065278;
  v15[4] = self;
  id v16 = v7;
  id v17 = v6;
  __int128 v18 = &v19;
  id v12 = v6;
  id v13 = v7;
  dispatch_sync(v11, v15);

  LOBYTE(self) = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return (char)self;
}

- (void)setFound:(id)a3 forReason:(id)a4 persistingScanState:(BOOL)a5
{
  BOOL v5 = a5;
  id v19 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 extendedStateQueue]);
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v19 scanPolicy]);
  -[SUControllerPolicyEngine setFoundScanPolicy:](self, "setFoundScanPolicy:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 scanUUID]);
  -[SUControllerPolicyEngine setUpdateUUID:](self, "setUpdateUUID:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v19 primaryDescriptor]);
  -[SUControllerPolicyEngine setFoundPrimaryDescriptor:](self, "setFoundPrimaryDescriptor:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v19 secondaryDescriptor]);
  -[SUControllerPolicyEngine setFoundSecondaryDescriptor:](self, "setFoundSecondaryDescriptor:", v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v19 scanOptions]);
  -[SUControllerPolicyEngine setScanOptions:](self, "setScanOptions:", v15);

  -[SUControllerPolicyEngine clearStateOfActiveUpdate:](self, "clearStateOfActiveUpdate:", v8);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine foundPrimaryDescriptor](self, "foundPrimaryDescriptor"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine foundSecondaryDescriptor](self, "foundSecondaryDescriptor"));
  -[SUControllerPolicyEngine setStateTargetingUpdate:forPrimaryDescriptor:withSecondaryDescriptor:]( self,  "setStateTargetingUpdate:forPrimaryDescriptor:withSecondaryDescriptor:",  v8,  v16,  v17);

  if (v5)
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v19 scanUUID]);
    -[SUControllerPolicyEngine persistScanUUID:withRampingForeground:forReason:]( self,  "persistScanUUID:withRampingForeground:forReason:",  v18,  [v19 rampingForeground],  v8);
  }
}

- (void)clearFound:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  -[SUControllerPolicyEngine setFoundScanPolicy:](self, "setFoundScanPolicy:", 0LL);
  -[SUControllerPolicyEngine setFoundPrimaryDescriptor:](self, "setFoundPrimaryDescriptor:", 0LL);
  -[SUControllerPolicyEngine setFoundSecondaryDescriptor:](self, "setFoundSecondaryDescriptor:", 0LL);
  -[SUControllerPolicyEngine setScanOptions:](self, "setScanOptions:", 0LL);
  -[SUControllerPolicyEngine setHaveReportedOTADownloaded:](self, "setHaveReportedOTADownloaded:", 0LL);
  -[SUControllerPolicyEngine setHaveNotifiedPrepared:](self, "setHaveNotifiedPrepared:", 0LL);
  -[SUControllerPolicyEngine setUpdateAcceptingTerms:](self, "setUpdateAcceptingTerms:", 0LL);
  -[SUControllerPolicyEngine setPersonalizeSSOToken:](self, "setPersonalizeSSOToken:", 0LL);
  -[SUControllerPolicyEngine setActiveDescriptor:](self, "setActiveDescriptor:", 0LL);
  -[SUControllerPolicyEngine clearStateOfActiveUpdate:](self, "clearStateOfActiveUpdate:", v6);
}

- (void)activeFound
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine foundScanPolicy](self, "foundScanPolicy"));
  -[SUControllerPolicyEngine setActiveScanPolicy:](self, "setActiveScanPolicy:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine foundPrimaryDescriptor](self, "foundPrimaryDescriptor"));
  -[SUControllerPolicyEngine setPrimaryDescriptor:](self, "setPrimaryDescriptor:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine foundSecondaryDescriptor](self, "foundSecondaryDescriptor"));
  -[SUControllerPolicyEngine setSecondaryDescriptor:](self, "setSecondaryDescriptor:", v7);

  -[SUControllerPolicyEngine assignActiveDescriptor:](self, "assignActiveDescriptor:", @"new update found");
}

- (void)assignActiveDescriptor:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  LODWORD(v6) = [v7 fallenBackToSecondary];

  if ((_DWORD)v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine secondaryDescriptor](self, "secondaryDescriptor"));
    -[SUControllerPolicyEngine setActiveDescriptor:](self, "setActiveDescriptor:", v8);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine activeDescriptor](self, "activeDescriptor"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 summary]);
    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[ACTIVE_DESCRIPTOR] (%@) descriptor(SECONDARY): %@",  v4,  v10);
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine primaryDescriptor](self, "primaryDescriptor"));
    -[SUControllerPolicyEngine setActiveDescriptor:](self, "setActiveDescriptor:", v11);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine activeDescriptor](self, "activeDescriptor"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 summary]);
    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[ACTIVE_DESCRIPTOR] (%@) descriptor(PRIMARY): %@",  v4,  v10);
  }

  -[SUControllerPolicyEngine setHaveReportedOTADownloaded:](self, "setHaveReportedOTADownloaded:", 0LL);
  -[SUControllerPolicyEngine setHaveNotifiedPrepared:](self, "setHaveNotifiedPrepared:", 0LL);
}

- (void)activePersonalize:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  if ([v9 paramType] == (id)6)
  {
    -[SUControllerPolicyEngine setUpdateAcceptingTerms:]( self,  "setUpdateAcceptingTerms:",  [v9 acceptedTerms]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 ssoToken]);
    -[SUControllerPolicyEngine setPersonalizeSSOToken:](self, "setPersonalizeSSOToken:", v6);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 diag]);
    id v8 = -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"setting active personalization info from unexpected param type (%ld) (credentials ignored)",  [v9 paramType]);
    [v7 trackAnomaly:@"[POLICY]" forReason:v8 withResult:8102 withError:0];
  }
}

- (void)acceptPreservedState:(id)a3 loadedPrimaryDescriptor:(id)a4 loadedSecondaryDescriptor:(id)a5 adoptingLoadedState:(id)a6 updateIsPrepared:(BOOL)a7 targetingApplied:(BOOL)a8 updateIsApplied:(BOOL)a9
{
  unsigned int v56 = a7;
  unsigned int v57 = a8;
  id v58 = a3;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 extendedStateQueue]);
  dispatch_assert_queue_V2(v17);

  __int128 v18 = objc_alloc(&OBJC_CLASS___SUControllerPolicyPersistedState);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine corePersisted](self, "corePersisted"));
  __int128 v20 = -[SUControllerPolicyPersistedState initWithPersisted:](v18, "initWithPersisted:", v19);
  -[SUControllerPolicyEngine setState:](self, "setState:", v20);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 targetOSVersion]);
  char v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v22 setTargetOSVersion:v21];

  id v23 = (void *)objc_claimAutoreleasedReturnValue([v13 targetBuildVersion]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v24 setTargetBuildVersion:v23];

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v13 scanBaseUUID]);
  -[SUControllerPolicyEngine persistScanUUID:withRampingForeground:forReason:]( self,  "persistScanUUID:withRampingForeground:forReason:",  v25,  [v13 scanRampingForeground],  v58);

  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v13 updateUUID]);
  -[SUControllerPolicyEngine setUpdateUUID:](self, "setUpdateUUID:", v26);

  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
  double v28 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v28 setUpdateUUID:v27];

  id v29 = [v13 termsAccepted];
  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v30 setTermsAccepted:v29];

  id v31 = [v13 fallenBackToSecondary];
  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v32 setFallenBackToSecondary:v31];

  -[SUControllerPolicyEngine setPrimaryDescriptor:](self, "setPrimaryDescriptor:", v15);
  int v33 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine primaryDescriptor](self, "primaryDescriptor"));
  int v34 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v34 setPrimaryDescriptor:v33];

  -[SUControllerPolicyEngine setSecondaryDescriptor:](self, "setSecondaryDescriptor:", v14);
  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine secondaryDescriptor](self, "secondaryDescriptor"));
  double v36 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v36 setSecondaryDescriptor:v35];

  -[SUControllerPolicyEngine assignActiveDescriptor:](self, "assignActiveDescriptor:", v58);
  id v37 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  int v38 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  int v39 = (void *)objc_claimAutoreleasedReturnValue([v38 scanBaseUUID]);
  double v40 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  id v41 = +[SUControllerScanManager allocScanPolicyUsingConfig:withScanUUID:rampingForeground:]( SUControllerScanManager,  "allocScanPolicyUsingConfig:withScanUUID:rampingForeground:",  v37,  v39,  [v40 scanRampingForeground]);
  -[SUControllerPolicyEngine setFoundScanPolicy:](self, "setFoundScanPolicy:", v41);

  -[SUControllerPolicyEngine setFoundPrimaryDescriptor:](self, "setFoundPrimaryDescriptor:", v15);
  -[SUControllerPolicyEngine setFoundSecondaryDescriptor:](self, "setFoundSecondaryDescriptor:", v14);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine primaryDescriptor](self, "primaryDescriptor"));
  double v43 = (void *)objc_claimAutoreleasedReturnValue([v42 summary]);
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine secondaryDescriptor](self, "secondaryDescriptor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue([v44 summary]);
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[POLICY_RELOAD] adopted successfully reloaded primaryDescriptor[%@], secondaryDescriptor[%@]",  v43,  v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v46 setPrepareWasStarted:0];

  if ([v13 updateIsPrepared] != v56)
  {
    if (v56) {
      v47 = @"YES";
    }
    else {
      v47 = @"NO";
    }
    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[PERSISTED_DIFF] persisting updateIsPrepared=%@ (different from loaded state)",  v47);
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v48 setUpdateIsPrepared:v56];

  if ([v13 targetingApplied] != v57)
  {
    if (v57) {
      v49 = @"YES";
    }
    else {
      v49 = @"NO";
    }
    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[PERSISTED_DIFF] persisting targetingApplied=%@ (different from loaded state)",  v49);
  }

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v50 setTargetingApplied:v57];

  if ([v13 updateIsApplied] != a9)
  {
    if (a9) {
      v51 = @"YES";
    }
    else {
      v51 = @"NO";
    }
    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[PERSISTED_DIFF] persisting updateIsApplied=%@ (different from loaded state)",  v51);
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v52 setUpdateIsApplied:a9];

  v53 = @"updateIsPrepared";
  if (v57) {
    v53 = @"targetingApplied";
  }
  if (a9) {
    v54 = @"updateIsApplied";
  }
  else {
    v54 = v53;
  }
  if (!a9 && (v57 & 1) == 0 && (v56 & 1) == 0)
  {
    else {
      v54 = @"nothing";
    }
  }

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[PERSISTED(%@)] accepted persisted state (%@) - currently persisted:%@",  v54,  v58,  v55);
}

- (void)clearStateOfActiveUpdate:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v7 setTermsAccepted:0];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v8 setTargetingApplied:0];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v9 setPrepareWasStarted:0];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v10 setUpdateIsPrepared:0];

  -[SUControllerPolicyEngine haveFallenBackToSecondary:forReason:]( self,  "haveFallenBackToSecondary:forReason:",  0LL,  v4);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v11 setPrimaryDescriptor:0];

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v12 setSecondaryDescriptor:0];
}

- (void)setStateTargetingUpdate:(id)a3 forPrimaryDescriptor:(id)a4 withSecondaryDescriptor:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 extendedStateQueue]);
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 productVersion]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v12 setTargetOSVersion:v11];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 productBuildVersion]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v14 setTargetBuildVersion:v13];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v16 setUpdateUUID:v15];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v17 setPrimaryDescriptor:v8];

  id v18 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  [v18 setSecondaryDescriptor:v7];
}

- (void)haveFallenBackToSecondary:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  LODWORD(v7) = [v8 fallenBackToSecondary];

  if ((_DWORD)v7 != v4)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
    [v9 setFallenBackToSecondary:v4];

    id v10 = @"NO";
    if (v4) {
      id v10 = @"YES";
    }
    -[SUControllerPolicyEngine policyLog:](self, "policyLog:", @"[FALLBACK(fallenBack:%@)] %@", v10, v11);
  }
}

- (id)initiallyTargertedDescriptor
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine primaryDescriptor](self, "primaryDescriptor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine secondaryDescriptor](self, "secondaryDescriptor"));

  if (v7)
  {
    id v6 = v5;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine secondaryDescriptor](self, "secondaryDescriptor"));
LABEL_4:
  }

  return v5;
}

- (void)verifyLatest:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  12LL,  @"verifying that prepared update is still latest available");
  id v7 = objc_alloc(&OBJC_CLASS___SUCoreScan);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
  id v9 = -[SUCoreScan initWithUUID:](v7, "initWithUUID:", v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerPolicyEngine activeDescriptor:potentiallyInactive:]( self,  "activeDescriptor:potentiallyInactive:",  @"verify latest",  0LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  unsigned int v12 = [v11 performAutoInstall];

  if (v10
    && (id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine foundScanPolicy](self, "foundScanPolicy")),
        v13,
        v13))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine foundScanPolicy](self, "foundScanPolicy"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10001E274;
    v27[3] = &unk_1000652A0;
    double v28 = v9;
    id v29 = self;
    char v31 = v12;
    id v30 = v4;
    -[SUCoreScan verifyLatestAvailableWithPolicy:descriptor:completion:]( v28,  "verifyLatestAvailableWithPolicy:descriptor:completion:",  v14,  v10,  v27);
  }

  else
  {
    id v15 = objc_alloc(&OBJC_CLASS___NSString);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine foundScanPolicy](self, "foundScanPolicy"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerCore scanPolicySummary:](&OBJC_CLASS___SUControllerCore, "scanPolicySummary:", v17));
    id v19 = -[NSString initWithFormat:]( v15,  "initWithFormat:",  @"missing required | activeDescriptor:%@, foundScanPolicy:%@",  v16,  v18);

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 buildError:8101 underlying:0 description:v19]);

    char v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 diag]);
    [v23 trackAnomaly:@"[POLICY(VERIFY_LATEST)]" forReason:v19 withResult:8101 withError:v21];

    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    id v25 = -[SUControllerPolicyParam initWithError:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyParam),  "initWithError:",  v21);
    if (v12) {
      unsigned int v26 = @"ScanVerifyFailedAuto";
    }
    else {
      unsigned int v26 = @"ScanVerifyFailedManual";
    }
    [v24 postEvent:v26 withInfo:v25];
  }
}

- (void)determineUpdatePolicy
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  BOOL v5 = objc_alloc(&OBJC_CLASS___SUCorePolicy);
  double v36 = -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:]( v5,  "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:",  kSUAssetTypeSoftwareUpdate,  kSUAssetTypeUpdateDocumentation,  127LL,  0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
  id v8 = +[SUControllerEventReporter newUMEventFieldsFromConfig:forSessionUUID:reason:]( &OBJC_CLASS___SUControllerEventReporter,  "newUMEventFieldsFromConfig:forSessionUUID:reason:",  v6,  v7,  @"determined update policy");

  if (v8) {
    id v9 =  -[SUCorePolicy setUpdateMetricEventFieldsFromDictionary:]( v36,  "setUpdateMetricEventFieldsFromDictionary:",  v8);
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
  id v11 = +[SUControllerEventReporter newUMContextFromConfig:]( &OBJC_CLASS___SUControllerEventReporter,  "newUMContextFromConfig:",  v10);
  -[SUCorePolicy setUpdateMetricContext:](v36, "setUpdateMetricContext:", v11);

  -[SUCorePolicy setCheckAvailableSpace:](v36, "setCheckAvailableSpace:", 1LL);
  -[SUCorePolicy setCacheDeleteUrgency:](v36, "setCacheDeleteUrgency:", 4LL);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy loadBrainPolicy](v36, "loadBrainPolicy"));
  [v12 setAllowsCellular:1];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy loadBrainPolicy](v36, "loadBrainPolicy"));
  [v13 setDiscretionary:0];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy loadBrainPolicy](v36, "loadBrainPolicy"));
  [v14 setSkipPhase:0];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy loadBrainPolicy](v36, "loadBrainPolicy"));
  [v15 setAdditionalOptions:0];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy downloadPreflightPolicy](v36, "downloadPreflightPolicy"));
  [v16 setAllowsCellular:1];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy downloadPreflightPolicy](v36, "downloadPreflightPolicy"));
  [v17 setDiscretionary:0];

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy downloadPreflightPolicy](v36, "downloadPreflightPolicy"));
  [v18 setSkipPhase:0];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy downloadPreflightPolicy](v36, "downloadPreflightPolicy"));
  [v19 setAdditionalOptions:0];

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateDownloadPolicy](v36, "softwareUpdateDownloadPolicy"));
  [v20 setAllowsCellular:1];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateDownloadPolicy](v36, "softwareUpdateDownloadPolicy"));
  [v21 setDiscretionary:0];

  char v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateDownloadPolicy](v36, "softwareUpdateDownloadPolicy"));
  [v22 setSkipPhase:0];

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateDownloadPolicy](v36, "softwareUpdateDownloadPolicy"));
  [v23 setRequiresPowerPluggedIn:0];

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateDownloadPolicy](v36, "softwareUpdateDownloadPolicy"));
  [v24 setRequiresInexpensiveAccess:0];

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateDownloadPolicy](v36, "softwareUpdateDownloadPolicy"));
  [v25 setAdditionalOptions:0];

  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy preparePolicy](v36, "preparePolicy"));
  [v26 setSkipPhase:0];

  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy preparePolicy](v36, "preparePolicy"));
  [v27 setAdditionalOptions:0];

  double v28 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy preparePolicy](v36, "preparePolicy"));
  [v28 setBasePrepareOptions:0];

  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy suspendPolicy](v36, "suspendPolicy"));
  [v29 setSkipPhase:0];

  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy suspendPolicy](v36, "suspendPolicy"));
  [v30 setAdditionalOptions:0];

  char v31 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy resumePolicy](v36, "resumePolicy"));
  [v31 setSkipPhase:0];

  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy resumePolicy](v36, "resumePolicy"));
  [v32 setAdditionalOptions:0];

  int v33 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy applyPolicy](v36, "applyPolicy"));
  [v33 setSkipPhase:0];

  int v34 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy applyPolicy](v36, "applyPolicy"));
  [v34 setAdditionalOptions:0];

  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy applyPolicy](v36, "applyPolicy"));
  [v35 setBaseApplyOptions:0];

  -[SUControllerPolicyEngine setUpdatePolicy:](self, "setUpdatePolicy:", v36);
}

- (void)advanceUpdateTarget:(int64_t)a3 forReason:(id)a4
{
  id v10 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  if (-[SUControllerPolicyEngine updateTarget](self, "updateTarget") != a3)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  -[SUControllerPolicyEngine updateTarget](self, "updateTarget")));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  a3));
    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[UPDATE_TARGET] advancing update target: %@ >=> %@ (%@)",  v8,  v9,  v10);

    -[SUControllerPolicyEngine setUpdateTarget:](self, "setUpdateTarget:", a3);
  }
}

- (void)advanceToCurrentUpdatePhase:(int64_t)a3 forReason:(id)a4
{
  id v10 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  if (-[SUControllerPolicyEngine updateCurrentPhase](self, "updateCurrentPhase") != a3)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  -[SUControllerPolicyEngine updateCurrentPhase](self, "updateCurrentPhase")));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  a3));
    -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[CURRENT_PHASE] advanced update phase: %@ >=> %@ (%@)",  v8,  v9,  v10);

    -[SUControllerPolicyEngine setUpdateCurrentPhase:](self, "setUpdateCurrentPhase:", a3);
    -[SUControllerPolicyEngine notifyExternalStateChange](self, "notifyExternalStateChange");
  }
}

- (void)decideFollowupAfterAutoInstallFired:(id)a3
{
  id v12 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
  LODWORD(v5) = [v6 termsAccepted];

  if ((_DWORD)v5)
  {
    id v7 = @"[FOLLOWUP] user has accepted T&C - auto-installing the update";
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateConfig](self, "updateConfig"));
    unsigned int v9 = [v8 autoAcceptTermsAndConditions];

    if (!v9)
    {
      -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"[FOLLOWUP] user has not accepted T&C - cannot auto-install the update");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
      id v11 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
      [v10 followupEvent:@"AutoFiredNotYetAccepted" withInfo:v11];

      goto LABEL_7;
    }

    id v7 = @"[FOLLOWUP] automatically accepted T&C - auto-installing the update";
  }

  -[SUControllerPolicyEngine policyLog:](self, "policyLog:", v7);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  [v10 followupEvent:@"AutoFiredTermsAccepted" withInfo:v12];
LABEL_7:
}

- (id)activeDescriptor:(id)a3 potentiallyInactive:(BOOL)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 extendedStateQueue]);
  dispatch_assert_queue_V2(v8);

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine activeDescriptor](self, "activeDescriptor"));
  if (!v9)
  {
    if ((id)-[SUControllerPolicyEngine updateCurrentPhase](self, "updateCurrentPhase") == (id)3)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v10 primaryDescriptor]);

      if (v9) {
        goto LABEL_8;
      }
    }

    else
    {
      unsigned int v9 = 0LL;
    }

    if (!a4)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 diag]);
      id v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"no active descriptor when should always have descriptor | %@",  v6);
      [v12 trackAnomaly:@"[POLICY_DESCRIPTOR]" forReason:v13 withResult:8101 withError:0];

      unsigned int v9 = 0LL;
    }
  }

- (id)controllerDescriptorFromActiveDescriptor:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerPolicyEngine activeDescriptor:potentiallyInactive:]( self,  "activeDescriptor:potentiallyInactive:",  v4,  0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine activeScanPolicy](self, "activeScanPolicy"));
  id v9 = +[SUControllerSUCore newDescriptorFromCoreDescriptor:corePolicy:]( &OBJC_CLASS___SUControllerSUCore,  "newDescriptorFromCoreDescriptor:corePolicy:",  v7,  v8);

  return v9;
}

- (void)removeAllUpdateContent
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  BOOL v5 = objc_alloc(&OBJC_CLASS___SUCorePolicy);
  id v6 = -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:]( v5,  "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:",  kSUAssetTypeSoftwareUpdate,  0LL,  127LL,  0LL);
  if (-[SUControllerPolicyEngine removingSUContent](self, "removingSUContent"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 diag]);
    [v8 trackAnomaly:@"[POLICY]" forReason:@"removing all update content when already removing SU content" withResult:8111 withError:0];
  }

  else
  {
    -[SUControllerPolicyEngine setRemovingSUContent:](self, "setRemovingSUContent:", 1LL);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10001EDA8;
    v9[3] = &unk_1000652C8;
    v9[4] = self;
    +[SUCorePurge removeAllUpdateContentWithPolicy:completion:]( &OBJC_CLASS___SUCorePurge,  "removeAllUpdateContentWithPolicy:completion:",  v6,  v9);
  }
}

- (BOOL)removeScanContent
{
  int64_t v3 = -[SUControllerPolicyEngine scanContentControl](self, "scanContentControl");
  switch(v3)
  {
    case 0LL:
      return 0;
    case 2LL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 diag]);
      id v6 = v5;
      id v7 = @"beginning to remove scan-related content when already removing scan content";
      break;
    case 1LL:
      if (!-[SUControllerPolicyEngine removingScanContent](self, "removingScanContent"))
      {
        -[SUControllerPolicyEngine scanContentIntent:forReason:]( self,  "scanContentIntent:forReason:",  2LL,  @"remove all update content");
        BOOL v11 = 1;
        -[SUControllerPolicyEngine setRemovingScanContent:](self, "setRemovingScanContent:", 1LL);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 scanBaseUUID]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine state](self, "state"));
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        void v16[2] = sub_10001F068;
        v16[3] = &unk_1000652F0;
        void v16[4] = self;
        +[SUControllerCore purgeScanContentWithBaseUUID:rampingForeground:completion:]( SUControllerCore,  "purgeScanContentWithBaseUUID:rampingForeground:completion:",  v14,  [v15 scanRampingForeground],  v16);

        return v11;
      }

      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 diag]);
      id v6 = v5;
      id v7 = @"intent to purge scan-related content when already purging scan-related content";
      break;
    default:
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 diag]);
      id v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"beginning to remove scan-related content with unknown scan context control (%ld)",  -[SUControllerPolicyEngine scanContentControl](self, "scanContentControl"));
      [v9 trackAnomaly:@"[POLICY_SCAN_CONTENT]" forReason:v10 withResult:8116 withError:0];

      return 0;
  }

  [v5 trackAnomaly:@"[POLICY]" forReason:v7 withResult:8111 withError:0];

  return 0;
}

- (void)finishFailedUpdateAttempt:(id)a3
{
  id v17 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateAttemptFailureError](self, "updateAttemptFailureError"));

  if (v4) {
    -[SUControllerPolicyEngine broadcastUpdateFailed](self, "broadcastUpdateFailed");
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine abandonWhenApplyingReason](self, "abandonWhenApplyingReason"));

  if (v5)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine abandonWhenApplyingReason](self, "abandonWhenApplyingReason"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine abandonWhenApplyingPolicyParam](self, "abandonWhenApplyingPolicyParam"));

    if (v6)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine abandonWhenApplyingPolicyParam](self, "abandonWhenApplyingPolicyParam"));
      int v7 = 0;
      id v8 = @"UpdateRemovedNewerAvailable";
      goto LABEL_9;
    }

    id v8 = 0LL;
  }

  else
  {
    id v8 = 0LL;
    id v6 = 0LL;
  }

  int v7 = 1;
LABEL_9:
  -[SUControllerPolicyEngine setAbandonWhenApplyingReason:](self, "setAbandonWhenApplyingReason:", 0LL);
  -[SUControllerPolicyEngine setAbandonWhenApplyingPolicyParam:](self, "setAbandonWhenApplyingPolicyParam:", 0LL);
  if (!v5) {
    id v5 = v17;
  }
  if (v7)
  {
    -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  2LL,  v5);
    -[SUControllerPolicyEngine setUpdateControl:](self, "setUpdateControl:", 0LL);
    -[SUControllerPolicyEngine clearFound:](self, "clearFound:", v5);
    id v8 = @"UpdateRemovedNoNewerUpdate";
  }

  else
  {
    -[SUControllerPolicyEngine setFound:forReason:persistingScanState:]( self,  "setFound:forReason:persistingScanState:",  v6,  v5,  1LL);
    -[SUControllerPolicyEngine activeFound](self, "activeFound");
    -[SUControllerPolicyEngine reportOTAAvailable:](self, "reportOTAAvailable:", @"newerWhenApplying");
    id v9 = objc_alloc(&OBJC_CLASS___SUCoreUpdate);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine initiallyTargertedDescriptor](self, "initiallyTargertedDescriptor"));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
    id v12 = -[SUCoreUpdate initWithDelegate:updateDescriptor:updateUUID:]( v9,  "initWithDelegate:updateDescriptor:updateUUID:",  self,  v10,  v11);
    -[SUControllerPolicyEngine setUpdateControl:](self, "setUpdateControl:", v12);

    -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  4LL,  v5);
    -[SUControllerPolicyEngine advanceUpdateTarget:forReason:](self, "advanceUpdateTarget:forReason:", 8LL, v5);
    -[SUControllerPolicyEngine determineUpdatePolicy](self, "determineUpdatePolicy");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateControl](self, "updateControl"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updatePolicy](self, "updatePolicy"));
    [v13 targetPrepared:v14];
  }

  -[SUControllerPolicyEngine issuePendingPurgeCompletions:](self, "issuePendingPurgeCompletions:", 0LL);
  -[SUControllerPolicyEngine policyLog:]( self,  "policyLog:",  @"%@:(UPDATE_REMOVED)[FOLLOWUP] %@",  @"[__MILESTONE__]",  v5);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v16 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyParam);
  [v15 followupEvent:v8 withInfo:v16];
}

- (void)updateAbandonedNewerFound:(id)a3 eventInfo:(id)a4 persistingScanState:(BOOL)a5 reportingStatus:(id)a6 withErrorCode:(int64_t)a7
{
  BOOL v8 = a5;
  id v18 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 extendedStateQueue]);
  dispatch_assert_queue_V2(v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 buildError:a7 underlying:0 description:v13]);
  -[SUControllerPolicyEngine updateFailurePoint:reportingStatus:error:]( self,  "updateFailurePoint:reportingStatus:error:",  v13,  v18,  v17);

  -[SUControllerPolicyEngine policyLog:](self, "policyLog:", @"%@:(FOUND) %@", @"[__MILESTONE__]", v13);
  -[SUControllerPolicyEngine clearFound:](self, "clearFound:", v13);
  -[SUControllerPolicyEngine advanceToCurrentUpdatePhase:forReason:]( self,  "advanceToCurrentUpdatePhase:forReason:",  10LL,  v13);
  -[SUControllerPolicyEngine setFound:forReason:persistingScanState:]( self,  "setFound:forReason:persistingScanState:",  v12,  v13,  v8);

  -[SUControllerPolicyEngine cancelCurrentUpdate](self, "cancelCurrentUpdate");
  -[SUControllerPolicyEngine reportOTAAvailable:](self, "reportOTAAvailable:", v18);
}

- (void)abandonWhenApplying:(id)a3 reportingStatus:(id)a4 abandonError:(id)a5 settingFound:(id)a6
{
  id v19 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 extendedStateQueue]);
  dispatch_assert_queue_V2(v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine abandonWhenApplyingReason](self, "abandonWhenApplyingReason"));
  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine abandonWhenApplyingReason](self, "abandonWhenApplyingReason"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine abandonWhenApplyingPolicyParam](self, "abandonWhenApplyingPolicyParam"));
    id v18 = @"YES";
    if (!v17) {
      id v18 = @"NO";
    }
    -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[ABANDON_WHEN_APPLYING] %@ | dropping stale abandon-when-applying(%@), tracking newer: %@",  v19,  v16,  v18);
  }

  if (v12)
  {
    -[SUControllerPolicyEngine setAbandonWhenApplyingReason:](self, "setAbandonWhenApplyingReason:", v19);
    -[SUControllerPolicyEngine setAbandonWhenApplyingPolicyParam:](self, "setAbandonWhenApplyingPolicyParam:", v12);
  }

  -[SUControllerPolicyEngine updateFailurePoint:reportingStatus:error:]( self,  "updateFailurePoint:reportingStatus:error:",  v19,  v10,  v11);
}

- (void)updateFailurePoint:(id)a3 reportingStatus:(id)a4 error:(id)a5
{
  id v26 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyFSM](self, "policyFSM"));
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 extendedStateQueue]);
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateAttemptFailureDescriptor](self, "updateAttemptFailureDescriptor"));
  if (v12)
  {
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateAttemptFailureError](self, "updateAttemptFailureError"));

    if (!v13) {
      goto LABEL_5;
    }
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateAttemptFailureDescriptor](self, "updateAttemptFailureDescriptor"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 summary]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateAttemptFailureError](self, "updateAttemptFailureError"));
  id v17 = +[SUControllerSUCore newSafeErrorDescription:]( &OBJC_CLASS___SUControllerSUCore,  "newSafeErrorDescription:",  v16);
  -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[ATTEMPT_FAILED] dropping stale failure point(%@), descriptor: %@, error: %@",  v26,  v15,  v17);

LABEL_5:
  if (!v8)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    id v19 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ (yet no error provided)",  v26);
    id v8 = (id)objc_claimAutoreleasedReturnValue([v18 buildError:8116 underlying:0 description:v19]);
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine activeDescriptor](self, "activeDescriptor"));
  -[SUControllerPolicyEngine setUpdateAttemptFailureDescriptor:](self, "setUpdateAttemptFailureDescriptor:", v20);

  -[SUControllerPolicyEngine setUpdateAttemptFailureError:](self, "setUpdateAttemptFailureError:", v8);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateAttemptFailureDescriptor](self, "updateAttemptFailureDescriptor"));
  char v22 = (void *)objc_claimAutoreleasedReturnValue([v21 summary]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateAttemptFailureError](self, "updateAttemptFailureError"));
  id v24 = +[SUControllerSUCore newSafeErrorDescription:]( &OBJC_CLASS___SUControllerSUCore,  "newSafeErrorDescription:",  v23);
  -[SUControllerPolicyEngine policyLogError:message:]( self,  "policyLogError:message:",  0LL,  @"[ATTEMPT_FAILED] %@ | descriptor: %@, error: %@",  v26,  v22,  v24);

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateAttemptFailureError](self, "updateAttemptFailureError"));
  -[SUControllerPolicyEngine reportOTAAbandoned:dueToError:](self, "reportOTAAbandoned:dueToError:", v9, v25);
}

- (id)updateUUIDLogString
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" [%@] ", v4));
  }

  else
  {
    id v5 = @" ";
  }

  return v5;
}

- (id)updateInfoLogString
{
  if (qword_100079618 != -1) {
    dispatch_once(&qword_100079618, &stru_100065330);
  }
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine activeDescriptor](self, "activeDescriptor"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine activeDescriptor](self, "activeDescriptor"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 productBuildVersion]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine activeDescriptor](self, "activeDescriptor"));
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 updateTypeName]);
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" => %@[%@]",  v5,  v7));
  }

  else
  {
    id v8 = &stru_100066480;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PolicyEngine:(%@%@)",  qword_100079620,  v8));

  return v9;
}

- (void)policyLog:(id)a3
{
  id v4 = a3;
  id v5 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v4, &v16);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyLogCategory](self, "policyLogCategory"));
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateInfoLogString](self, "updateInfoLogString"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUIDLogString](self, "updateUUIDLogString"));
    *(_DWORD *)buf = 138543874;
    id v11 = v8;
    __int16 v12 = 2114;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@%{public}@", buf, 0x20u);
  }
}

- (void)policyLogError:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v7, &v23);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyLogCategory](self, "policyLogCategory"));
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v11)
    {
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateInfoLogString](self, "updateInfoLogString"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUIDLogString](self, "updateUUIDLogString"));
      id v14 = +[SUControllerSUCore newSafeErrorDescription:]( &OBJC_CLASS___SUControllerSUCore,  "newSafeErrorDescription:",  v6);
      *(_DWORD *)buf = 138544130;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      id v18 = v13;
      __int16 v19 = 2114;
      __int128 v20 = v8;
      __int16 v21 = 2114;
      id v22 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@%{public}@%{public}@ | error:%{public}@",  buf,  0x2Au);
    }
  }

  else if (v11)
  {
    sub_10003D878(self, (uint64_t)v8, v10);
  }
}

- (id)summary
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine policyName](self, "policyName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyEngine updateUUID](self, "updateUUID"));
  if (v4) {
    id v5 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@[%@]", v3, v4);
  }
  else {
    id v5 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v3, v8);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

+ (int64_t)limitedManagerStateFromPolicyState:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10003D944(a3, v6, v7, v8, v9, v10, v11, v12);
  }

  return 0LL;
}

+ (int64_t)extendedManagerStateFromPolicyState:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10003D9A8(a3, v6, v7, v8, v9, v10, v11, v12);
  }

  return 0LL;
}

+ (id)scanContentControlName:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10003DA0C(a3, v6, v7, v8, v9, v10, v11, v12);
  }

  return @"Unknown";
}

- (SUCorePersistedState)corePersisted
{
  return self->_corePersisted;
}

- (SUCoreDescriptor)activeDescriptor
{
  return self->_activeDescriptor;
}

- (void)setActiveDescriptor:(id)a3
{
}

- (SUCorePolicy)activeScanPolicy
{
  return self->_activeScanPolicy;
}

- (void)setActiveScanPolicy:(id)a3
{
}

- (SUCoreDescriptor)primaryDescriptor
{
  return self->_primaryDescriptor;
}

- (void)setPrimaryDescriptor:(id)a3
{
}

- (SUCoreDescriptor)secondaryDescriptor
{
  return self->_secondaryDescriptor;
}

- (void)setSecondaryDescriptor:(id)a3
{
}

- (SUControllerScanOptions)scanOptions
{
  return self->_scanOptions;
}

- (void)setScanOptions:(id)a3
{
}

- (SUControllerAttachedClients)attachedClients
{
  return self->_attachedClients;
}

- (SUControllerConfig)updateConfig
{
  return self->_updateConfig;
}

- (void)setUpdateConfig:(id)a3
{
}

- (int64_t)updateTarget
{
  return self->_updateTarget;
}

- (void)setUpdateTarget:(int64_t)a3
{
  self->_updateTarget = a3;
}

- (int64_t)updateCurrentPhase
{
  return self->_updateCurrentPhase;
}

- (void)setUpdateCurrentPhase:(int64_t)a3
{
  self->_updateCurrentPhase = a3;
}

- (SUAutoInstallManager)autoInstallManager
{
  return self->_autoInstallManager;
}

- (SUCoreLog)policyLogCategory
{
  return self->_policyLogCategory;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (NSString)updateUUID
{
  return self->_updateUUID;
}

- (void)setUpdateUUID:(id)a3
{
}

- (SUCoreUpdate)updateControl
{
  return self->_updateControl;
}

- (void)setUpdateControl:(id)a3
{
}

- (SUCorePolicy)updatePolicy
{
  return self->_updatePolicy;
}

- (void)setUpdatePolicy:(id)a3
{
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (SUCoreFSM)policyFSM
{
  return self->_policyFSM;
}

- (void)setPolicyFSM:(id)a3
{
}

- (SUControllerPolicyPersistedState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (BOOL)failedForward
{
  return self->_failedForward;
}

- (void)setFailedForward:(BOOL)a3
{
  self->_failedForward = a3;
}

- (SUControllerPolicyPersistedState)loadedState
{
  return self->_loadedState;
}

- (void)setLoadedState:(id)a3
{
}

- (NSString)preservedScanBaseUUID
{
  return self->_preservedScanBaseUUID;
}

- (void)setPreservedScanBaseUUID:(id)a3
{
}

- (BOOL)perservedScanRampingForeground
{
  return self->_perservedScanRampingForeground;
}

- (void)setPerservedScanRampingForeground:(BOOL)a3
{
  self->_perservedScanRampingForeground = a3;
}

- (NSString)loadedSUAssetID
{
  return self->_loadedSUAssetID;
}

- (void)setLoadedSUAssetID:(id)a3
{
}

- (BOOL)loadedPrepared
{
  return self->_loadedPrepared;
}

- (void)setLoadedPrepared:(BOOL)a3
{
  self->_loadedPrepared = a3;
}

- (BOOL)loadedApplied
{
  return self->_loadedApplied;
}

- (void)setLoadedApplied:(BOOL)a3
{
  self->_loadedApplied = a3;
}

- (BOOL)haveReportedOTADownloaded
{
  return self->_haveReportedOTADownloaded;
}

- (void)setHaveReportedOTADownloaded:(BOOL)a3
{
  self->_haveReportedOTADownloaded = a3;
}

- (BOOL)haveNotifiedPrepared
{
  return self->_haveNotifiedPrepared;
}

- (void)setHaveNotifiedPrepared:(BOOL)a3
{
  self->_haveNotifiedPrepared = a3;
}

- (BOOL)updateAcceptingTerms
{
  return self->_updateAcceptingTerms;
}

- (void)setUpdateAcceptingTerms:(BOOL)a3
{
  self->_updateAcceptingTerms = a3;
}

- (NSData)personalizeSSOToken
{
  return self->_personalizeSSOToken;
}

- (void)setPersonalizeSSOToken:(id)a3
{
}

- (SUCorePolicy)foundScanPolicy
{
  return self->_foundScanPolicy;
}

- (void)setFoundScanPolicy:(id)a3
{
}

- (SUCoreDescriptor)foundPrimaryDescriptor
{
  return self->_foundPrimaryDescriptor;
}

- (void)setFoundPrimaryDescriptor:(id)a3
{
}

- (SUCoreDescriptor)foundSecondaryDescriptor
{
  return self->_foundSecondaryDescriptor;
}

- (void)setFoundSecondaryDescriptor:(id)a3
{
}

- (NSUUID)installWaitUUID
{
  return self->_installWaitUUID;
}

- (void)setInstallWaitUUID:(id)a3
{
}

- (SUCoreProgress)lastReportedProgress
{
  return self->_lastReportedProgress;
}

- (void)setLastReportedProgress:(id)a3
{
}

- (SUCoreProgress)lastReportedApplyProgress
{
  return self->_lastReportedApplyProgress;
}

- (void)setLastReportedApplyProgress:(id)a3
{
}

- (int64_t)scanContentControl
{
  return self->_scanContentControl;
}

- (void)setScanContentControl:(int64_t)a3
{
  self->_scanContentControl = a3;
}

- (NSMutableArray)pendingPurgeComplete
{
  return self->_pendingPurgeComplete;
}

- (void)setPendingPurgeComplete:(id)a3
{
}

- (BOOL)removingSUContent
{
  return self->_removingSUContent;
}

- (void)setRemovingSUContent:(BOOL)a3
{
  self->_removingSUContent = a3;
}

- (BOOL)removingScanContent
{
  return self->_removingScanContent;
}

- (void)setRemovingScanContent:(BOOL)a3
{
  self->_removingScanContent = a3;
}

- (BOOL)haveNotifiedApplied
{
  return self->_haveNotifiedApplied;
}

- (void)setHaveNotifiedApplied:(BOOL)a3
{
  self->_haveNotifiedApplied = a3;
}

- (int64_t)lastNotifiedState
{
  return self->_lastNotifiedState;
}

- (void)setLastNotifiedState:(int64_t)a3
{
  self->_lastNotifiedState = a3;
}

- (SUCoreDescriptor)updateAttemptFailureDescriptor
{
  return self->_updateAttemptFailureDescriptor;
}

- (void)setUpdateAttemptFailureDescriptor:(id)a3
{
}

- (NSError)updateAttemptFailureError
{
  return self->_updateAttemptFailureError;
}

- (void)setUpdateAttemptFailureError:(id)a3
{
}

- (NSString)abandonWhenApplyingReason
{
  return self->_abandonWhenApplyingReason;
}

- (void)setAbandonWhenApplyingReason:(id)a3
{
}

- (SUControllerPolicyParam)abandonWhenApplyingPolicyParam
{
  return self->_abandonWhenApplyingPolicyParam;
}

- (void)setAbandonWhenApplyingPolicyParam:(id)a3
{
}

- (void).cxx_destruct
{
}

@end