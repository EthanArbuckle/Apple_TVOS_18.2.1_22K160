@interface SUControllerScanManager
+ (id)_generateStateTable;
+ (id)allocScanPolicyUsingConfig:(id)a3 withScanUUID:(id)a4 rampingForeground:(BOOL)a5;
- (BOOL)rampingForeground;
- (BOOL)rampingForegroundLatched;
- (BOOL)triggerDownloadAndPrepare;
- (NSDictionary)stateTable;
- (NSString)scanName;
- (NSString)scanUUID;
- (NSString)scanUUIDBasePortion;
- (SUControllerAttachedClients)attachedClients;
- (SUControllerConfig)scanConfig;
- (SUControllerPolicyEngine)policyEngine;
- (SUControllerScanManager)initWithAttachedClients:(id)a3 withConfig:(id)a4 withPolicyEngine:(id)a5;
- (SUControllerScanManagerParam)updateAcceptingTerms;
- (SUControllerScanOptions)scanOptions;
- (SUCoreDescriptor)latestFoundPrimary;
- (SUCoreDescriptor)latestFoundSecondary;
- (SUCoreDescriptor)newerFoundPrimary;
- (SUCoreDescriptor)newerFoundSecondary;
- (SUCoreFSM)scanFSM;
- (SUCoreLog)scanLogCategory;
- (SUCorePolicy)newerScanPolicy;
- (SUCorePolicy)scanPolicy;
- (SUCoreScan)scanner;
- (id)newSessionID;
- (id)purgeCompletion;
- (id)summary;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)action_CancelForgetTriggers:(id)a3 error:(id *)a4;
- (int64_t)action_CollectDocMetadata:(id)a3 error:(id *)a4;
- (int64_t)action_DecideAutoScanForUpdate:(id)a3 error:(id *)a4;
- (int64_t)action_DecideNewer:(id)a3 error:(id *)a4;
- (int64_t)action_FailPurgeAlreadyPurging:(id)a3 error:(id *)a4;
- (int64_t)action_ForgetTriggers:(id)a3 error:(id *)a4;
- (int64_t)action_NotifyFoundSame:(id)a3 error:(id *)a4;
- (int64_t)action_NotifyNoUpdateFound:(id)a3 error:(id *)a4;
- (int64_t)action_NotifyPulledRemoveAll:(id)a3 error:(id *)a4;
- (int64_t)action_NotifyScanFailed:(id)a3 error:(id *)a4;
- (int64_t)action_NotifyScanFailedRemoveAll:(id)a3 error:(id *)a4;
- (int64_t)action_NotifyUpdateFound:(id)a3 error:(id *)a4;
- (int64_t)action_PurgeComplete:(id)a3 error:(id *)a4;
- (int64_t)action_PurgeCompleteScan:(id)a3 error:(id *)a4;
- (int64_t)action_RampManual:(id)a3 error:(id *)a4;
- (int64_t)action_RampManualDecidePromote:(id)a3 error:(id *)a4;
- (int64_t)action_RampManualScanForUpdate:(id)a3 error:(id *)a4;
- (int64_t)action_RemoveAllDoc:(id)a3 error:(id *)a4;
- (int64_t)action_RemoveAllDocForPurge:(id)a3 error:(id *)a4;
- (int64_t)action_RemoveOlder:(id)a3 error:(id *)a4;
- (int64_t)action_RemovedNotifyUpdateFound:(id)a3 error:(id *)a4;
- (int64_t)action_ScanForUpdate:(id)a3 error:(id *)a4;
- (int64_t)action_ScanForUpdateWillDownload:(id)a3 error:(id *)a4;
- (int64_t)action_ScanWillUATC:(id)a3 error:(id *)a4;
- (int64_t)action_SetRamp:(id)a3 error:(id *)a4;
- (int64_t)action_SetRampRemoveAllDocForPurge:(id)a3 error:(id *)a4;
- (int64_t)action_SetRampScan:(id)a3 error:(id *)a4;
- (int64_t)action_WillDownload:(id)a3 error:(id *)a4;
- (int64_t)action_WillUATC:(id)a3 error:(id *)a4;
- (int64_t)action_WillUATCDecidePromote:(id)a3 error:(id *)a4;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (void)activateWithBaseUUID:(id)a3 rampingForeground:(BOOL)a4;
- (void)adoptClientScanOptions:(id)a3;
- (void)autoScanTrigger;
- (void)clearAllScanTracking;
- (void)clearLatchedRamp;
- (void)clearUnlatchedRamp;
- (void)forgetAllPendingTriggers:(id)a3;
- (void)forgetDowloadAndPrepareTrigger:(id)a3;
- (void)forgetUpdateAcceptingTerms:(id)a3;
- (void)issuePurgeCompletion;
- (void)modifyConfigForClient:(id)a3 alteringConfig:(id)a4 forChangeMask:(int64_t)a5 completion:(id)a6;
- (void)notifyNoUpdateFound:(id)a3;
- (void)notifyScanFailed:(id)a3;
- (void)notifyScanPostponedForReason:(id)a3 locatedPrimaryDescriptor:(id)a4 locatedSecondaryDescrtiptor:(id)a5 scanPolicy:(id)a6;
- (void)notifyUpdateFoundUsingPolicy:(id)a3 locatedPrimaryDescriptor:(id)a4 locatedSecondaryDescrtiptor:(id)a5;
- (void)plantDowloadAndPrepareTrigger:(id)a3;
- (void)purgeScanContentWithBaseUUID:(id)a3 rampingForeground:(BOOL)a4 completion:(id)a5;
- (void)rememberPurgeCompletion:(id)a3 withEventInfo:(id)a4;
- (void)removeAllDocumentationContent;
- (void)scanForUpdate;
- (void)scanForUpdatesForClient:(id)a3 withScanOptions:(id)a4;
- (void)scanLog:(id)a3;
- (void)scanLogError:(id)a3 message:(id)a4;
- (void)setLatestFoundPrimary:(id)a3;
- (void)setLatestFoundSecondary:(id)a3;
- (void)setNewerFoundPrimary:(id)a3;
- (void)setNewerFoundSecondary:(id)a3;
- (void)setNewerScanPolicy:(id)a3;
- (void)setPurgeCompletion:(id)a3;
- (void)setRampFromPersisted:(id)a3;
- (void)setRampingForeground:(BOOL)a3;
- (void)setRampingForegroundLatched:(BOOL)a3;
- (void)setScanConfig:(id)a3;
- (void)setScanFSM:(id)a3;
- (void)setScanName:(id)a3;
- (void)setScanOptions:(id)a3;
- (void)setScanPolicy:(id)a3;
- (void)setScanUUID:(id)a3;
- (void)setScanUUIDBasePortion:(id)a3;
- (void)setScanner:(id)a3;
- (void)setTriggerDownloadAndPrepare:(BOOL)a3;
- (void)setUpdateAcceptingTerms:(id)a3;
- (void)updateAcceptingTermsForClient:(id)a3 forDescriptor:(id)a4 usingSSOToken:(id)a5;
- (void)updateScanName;
- (void)willUpdateAcceptingTerms:(id)a3;
@end

@implementation SUControllerScanManager

+ (id)_generateStateTable
{
  v453[0] = kSU_S_Startup;
  v451[0] = @"ManualScan";
  uint64_t v2 = kSUCoreNextStateKey;
  uint64_t v3 = kSUCoreActionKey;
  v449[0] = kSUCoreNextStateKey;
  v449[1] = kSUCoreActionKey;
  v450[0] = @"StartupPending";
  v450[1] = @"RampManual";
  v154 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v450,  v449,  2LL));
  v452[0] = v154;
  v451[1] = @"AutoScan";
  v447[0] = v2;
  v447[1] = v3;
  v448[0] = @"StartupPending";
  v448[1] = @"WillDownload";
  v153 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v448,  v447,  2LL));
  v452[1] = v153;
  v451[2] = @"UpdateAcceptingTerms";
  v445[0] = v2;
  v445[1] = v3;
  v446[0] = @"StartupPending";
  v446[1] = @"WillUATC";
  v152 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v446,  v445,  2LL));
  v452[2] = v152;
  v451[3] = @"PurgeScan";
  v443[0] = v2;
  v443[1] = v3;
  v444[0] = @"PurgingRemoving";
  v444[1] = @"SetRampRemoveAllDocForPurge";
  v151 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v444,  v443,  2LL));
  v452[3] = v151;
  v451[4] = @"Activate";
  uint64_t v155 = kSU_S_NoNewerUpdate;
  v441[0] = v2;
  v441[1] = v3;
  v442[0] = kSU_S_NoNewerUpdate;
  v442[1] = @"SetRamp";
  v150 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v442,  v441,  2LL));
  v452[4] = v150;
  v149 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v452,  v451,  5LL));
  v454[0] = v149;
  v453[1] = @"StartupPending";
  v439[0] = @"ManualScan";
  uint64_t v437 = v3;
  v438 = @"RampManual";
  v148 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v438,  &v437,  1LL));
  v440[0] = v148;
  v439[1] = @"AutoScan";
  uint64_t v435 = v3;
  v436 = @"WillDownload";
  v147 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v436,  &v435,  1LL));
  v440[1] = v147;
  v439[2] = @"UpdateAcceptingTerms";
  uint64_t v433 = v3;
  v434 = @"WillUATC";
  v146 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v434,  &v433,  1LL));
  v440[2] = v146;
  v439[3] = @"PurgeScan";
  v431[0] = v2;
  v431[1] = v3;
  v432[0] = @"PurgingRemovingPending";
  v432[1] = @"SetRampRemoveAllDocForPurge";
  v145 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v432,  v431,  2LL));
  v440[3] = v145;
  v439[4] = @"Activate";
  v429[0] = v2;
  v429[1] = v3;
  v430[0] = @"NoNewerScanning";
  v430[1] = @"SetRampScan";
  v144 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v430,  v429,  2LL));
  v440[4] = v144;
  v143 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v440,  v439,  5LL));
  v454[1] = v143;
  v453[2] = @"RemovingAllDoc";
  v427[0] = @"ManualScan";
  v425[0] = v2;
  v425[1] = v3;
  v426[0] = @"RemovingAllPending";
  v426[1] = @"RampManual";
  v142 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v426,  v425,  2LL));
  v428[0] = v142;
  v427[1] = @"AutoScan";
  v423[0] = v2;
  v423[1] = v3;
  v424[0] = @"RemovingAllPending";
  v424[1] = @"WillDownload";
  v141 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v424,  v423,  2LL));
  v428[1] = v141;
  v427[2] = @"UpdateAcceptingTerms";
  v421[0] = v2;
  v421[1] = v3;
  v422[0] = @"RemovingAllPending";
  v422[1] = @"WillUATC";
  v140 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v422,  v421,  2LL));
  v428[2] = v140;
  v427[3] = @"PurgeScan";
  v419[0] = v2;
  v419[1] = v3;
  v420[0] = @"PurgingRemoving";
  v420[1] = @"ForgetTriggers";
  v139 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v420,  v419,  2LL));
  v428[3] = v139;
  v427[4] = @"Removed";
  uint64_t v417 = v2;
  uint64_t v418 = v155;
  v138 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v418,  &v417,  1LL));
  v428[4] = v138;
  v137 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v428,  v427,  5LL));
  v454[2] = v137;
  v453[3] = @"RemovingAllPending";
  v415[0] = @"ManualScan";
  uint64_t v413 = v3;
  v414 = @"RampManual";
  v136 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v414,  &v413,  1LL));
  v416[0] = v136;
  v415[1] = @"AutoScan";
  uint64_t v411 = v3;
  v412 = @"WillDownload";
  v135 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v412,  &v411,  1LL));
  v416[1] = v135;
  v415[2] = @"UpdateAcceptingTerms";
  uint64_t v409 = v3;
  v410 = @"WillUATC";
  v134 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v410,  &v409,  1LL));
  v416[2] = v134;
  v415[3] = @"PurgeScan";
  v407[0] = v2;
  v407[1] = v3;
  v408[0] = @"PurgingRemovingPending";
  v408[1] = @"ForgetTriggers";
  v133 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v408,  v407,  2LL));
  v416[3] = v133;
  v415[4] = @"Removed";
  v405[0] = v2;
  v405[1] = v3;
  v406[0] = @"NoNewerScanning";
  v406[1] = @"ScanForUpdate";
  v132 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v406,  v405,  2LL));
  v416[4] = v132;
  v131 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v416,  v415,  5LL));
  v454[3] = v131;
  v453[4] = v155;
  v403[0] = @"ManualScan";
  v401[0] = v2;
  v401[1] = v3;
  v402[0] = @"NoNewerScanning";
  v402[1] = @"RampManualScanForUpdate";
  v130 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v402,  v401,  2LL));
  v404[0] = v130;
  v403[1] = @"AutoScan";
  uint64_t v399 = v3;
  v400 = @"DecideAutoScanForUpdate";
  v129 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v400,  &v399,  1LL));
  v404[1] = v129;
  v403[2] = @"UpdateAcceptingTerms";
  v397[0] = v2;
  v397[1] = v3;
  v398[0] = @"NoNewerScanning";
  v398[1] = @"ScanWillUATC";
  v128 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v398,  v397,  2LL));
  v404[2] = v128;
  v403[3] = @"PurgeScan";
  v395[0] = v2;
  v395[1] = v3;
  v396[0] = @"PurgingRemoving";
  v396[1] = @"RemoveAllDocForPurge";
  v127 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v396,  v395,  2LL));
  v404[3] = v127;
  v403[4] = @"ShouldAutoScan";
  v393[0] = v2;
  v393[1] = v3;
  v394[0] = @"NoNewerScanning";
  v394[1] = @"ScanForUpdateWillDownload";
  v126 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v394,  v393,  2LL));
  v404[4] = v126;
  v125 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v404,  v403,  5LL));
  v454[4] = v125;
  v453[5] = @"NoNewerScanning";
  v391[0] = @"ManualScan";
  uint64_t v389 = v3;
  v390 = @"RampManualDecidePromote";
  v124 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v390,  &v389,  1LL));
  v392[0] = v124;
  v391[1] = @"AutoScan";
  uint64_t v387 = v3;
  v388 = @"WillDownload";
  v123 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v388,  &v387,  1LL));
  v392[1] = v123;
  v391[2] = @"UpdateAcceptingTerms";
  uint64_t v385 = v3;
  v386 = @"WillUATCDecidePromote";
  v122 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v386,  &v385,  1LL));
  v392[2] = v122;
  v391[3] = @"PurgeScan";
  v383[0] = v2;
  v383[1] = v3;
  v384[0] = @"Canceling";
  v384[1] = @"CancelForgetTriggers";
  v121 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v384,  v383,  2LL));
  v392[3] = v121;
  v391[4] = @"ScanFailed";
  v381[0] = v2;
  v381[1] = v3;
  v382[0] = v155;
  v382[1] = @"NotifyScanFailed";
  v120 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v382,  v381,  2LL));
  v392[4] = v120;
  v391[5] = @"UpdateFound";
  v379[0] = v2;
  v379[1] = v3;
  v380[0] = @"FoundCollectingDoc";
  v380[1] = @"CollectDocMetadata";
  v119 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v380,  v379,  2LL));
  v392[5] = v119;
  v391[6] = @"NoUpdateFound";
  v377[0] = v2;
  v377[1] = v3;
  v378[0] = v155;
  v378[1] = @"NotifyNoUpdateFound";
  v118 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v378,  v377,  2LL));
  v392[6] = v118;
  v391[7] = @"PromoteToUserInitiated";
  uint64_t v375 = v2;
  v376 = @"NoNewerPromoting";
  v117 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v376,  &v375,  1LL));
  v392[7] = v117;
  v116 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v392,  v391,  8LL));
  v454[5] = v116;
  v453[6] = @"FoundCollectingDoc";
  v373[0] = @"ManualScan";
  uint64_t v371 = v3;
  v372 = @"RampManualDecidePromote";
  v115 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v372,  &v371,  1LL));
  v374[0] = v115;
  v373[1] = @"AutoScan";
  uint64_t v369 = v3;
  v370 = @"WillDownload";
  v114 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v370,  &v369,  1LL));
  v374[1] = v114;
  v373[2] = @"UpdateAcceptingTerms";
  uint64_t v367 = v3;
  v368 = @"WillUATCDecidePromote";
  v113 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v368,  &v367,  1LL));
  v374[2] = v113;
  v373[3] = @"PurgeScan";
  v365[0] = v2;
  v365[1] = v3;
  v366[0] = @"Canceling";
  v366[1] = @"CancelForgetTriggers";
  v112 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v366,  v365,  2LL));
  v374[3] = v112;
  v373[4] = @"CollectDocFailed";
  v363[0] = v2;
  v363[1] = v3;
  v364[0] = @"RemovingAllDoc";
  v364[1] = @"NotifyScanFailedRemoveAll";
  v111 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v364,  v363,  2LL));
  v374[4] = v111;
  v373[5] = @"CollectDocNotRequired";
  v361[0] = v2;
  v361[1] = v3;
  v362[0] = @"UpdateFound";
  v362[1] = @"NotifyUpdateFound";
  v110 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v362,  v361,  2LL));
  v374[5] = v110;
  v373[6] = @"CollectDocSuccess";
  v359[0] = v2;
  v359[1] = v3;
  v360[0] = @"UpdateFound";
  v360[1] = @"NotifyUpdateFound";
  v109 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v360,  v359,  2LL));
  v374[6] = v109;
  v373[7] = @"PromoteToUserInitiated";
  uint64_t v357 = v2;
  v358 = @"NoNewerPromoting";
  v108 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v358,  &v357,  1LL));
  v374[7] = v108;
  v107 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v374,  v373,  8LL));
  v454[6] = v107;
  v453[7] = @"NoNewerPromoting";
  v355[0] = @"ManualScan";
  uint64_t v353 = v3;
  v354 = @"RampManual";
  v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v354,  &v353,  1LL));
  v356[0] = v106;
  v355[1] = @"AutoScan";
  uint64_t v351 = v3;
  v352 = @"WillDownload";
  v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v352,  &v351,  1LL));
  v356[1] = v105;
  v355[2] = @"UpdateAcceptingTerms";
  uint64_t v349 = v3;
  v350 = @"WillUATC";
  v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v350,  &v349,  1LL));
  v356[2] = v104;
  v355[3] = @"PurgeScan";
  v347[0] = v2;
  v347[1] = v3;
  v348[0] = @"Canceling";
  v348[1] = @"CancelForgetTriggers";
  v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v348,  v347,  2LL));
  v356[3] = v103;
  v355[4] = @"ScanFailed";
  v345[0] = v2;
  v345[1] = v3;
  v346[0] = @"NoNewerScanning";
  v346[1] = @"ScanForUpdate";
  v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v346,  v345,  2LL));
  v356[4] = v102;
  v355[5] = @"UpdateFound";
  v343[0] = v2;
  v343[1] = v3;
  v344[0] = @"NoNewerScanning";
  v344[1] = @"ScanForUpdate";
  v101 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v344,  v343,  2LL));
  v356[5] = v101;
  v355[6] = @"NoUpdateFound";
  v341[0] = v2;
  v341[1] = v3;
  v342[0] = @"NoNewerScanning";
  v342[1] = @"ScanForUpdate";
  v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v342,  v341,  2LL));
  v356[6] = v100;
  v355[7] = @"CollectDocFailed";
  v339[0] = v2;
  v339[1] = v3;
  v340[0] = @"NoNewerScanning";
  v340[1] = @"ScanForUpdate";
  v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v340,  v339,  2LL));
  v356[7] = v99;
  v355[8] = @"CollectDocNotRequired";
  v337[0] = v2;
  v337[1] = v3;
  v338[0] = @"NoNewerScanning";
  v338[1] = @"ScanForUpdate";
  v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v338,  v337,  2LL));
  v356[8] = v98;
  v355[9] = @"CollectDocSuccess";
  v335[0] = v2;
  v335[1] = v3;
  v336[0] = @"NoNewerScanning";
  v336[1] = @"ScanForUpdate";
  v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v336,  v335,  2LL));
  v356[9] = v97;
  v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v356,  v355,  10LL));
  v454[7] = v96;
  v453[8] = @"UpdateFound";
  v333[0] = @"ManualScan";
  v331[0] = v2;
  v331[1] = v3;
  v332[0] = @"FoundScanning";
  v332[1] = @"RampManualScanForUpdate";
  v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v332,  v331,  2LL));
  v334[0] = v95;
  v333[1] = @"AutoScan";
  uint64_t v329 = v3;
  v330 = @"DecideAutoScanForUpdate";
  v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v330,  &v329,  1LL));
  v334[1] = v94;
  v333[2] = @"UpdateAcceptingTerms";
  v327[0] = v2;
  v327[1] = v3;
  v328[0] = @"FoundScanning";
  v328[1] = @"ScanWillUATC";
  v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v328,  v327,  2LL));
  v334[2] = v93;
  v333[3] = @"PurgeScan";
  v325[0] = v2;
  v325[1] = v3;
  v326[0] = @"PurgingRemoving";
  v326[1] = @"RemoveAllDocForPurge";
  v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v326,  v325,  2LL));
  v334[3] = v92;
  v333[4] = @"ShouldAutoScan";
  v323[0] = v2;
  v323[1] = v3;
  v324[0] = @"FoundScanning";
  v324[1] = @"ScanForUpdateWillDownload";
  v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v324,  v323,  2LL));
  v334[4] = v91;
  v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v334,  v333,  5LL));
  v454[8] = v90;
  v453[9] = @"FoundScanning";
  v321[0] = @"ManualScan";
  uint64_t v319 = v3;
  v320 = @"RampManualDecidePromote";
  v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v320,  &v319,  1LL));
  v322[0] = v89;
  v321[1] = @"AutoScan";
  uint64_t v317 = v3;
  v318 = @"WillDownload";
  v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v318,  &v317,  1LL));
  v322[1] = v88;
  v321[2] = @"UpdateAcceptingTerms";
  uint64_t v315 = v3;
  v316 = @"WillUATC";
  v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v316,  &v315,  1LL));
  v322[2] = v87;
  v321[3] = @"PurgeScan";
  v313[0] = v2;
  v313[1] = v3;
  v314[0] = @"Canceling";
  v314[1] = @"CancelForgetTriggers";
  v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v314,  v313,  2LL));
  v322[3] = v86;
  v321[4] = @"ScanFailed";
  v311[0] = v2;
  v311[1] = v3;
  v312[0] = @"UpdateFound";
  v312[1] = @"NotifyScanFailed";
  v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v312,  v311,  2LL));
  v322[4] = v85;
  v321[5] = @"UpdateFound";
  v309[0] = v2;
  v309[1] = v3;
  v310[0] = @"FoundNewerCollectingDoc";
  v310[1] = @"CollectDocMetadata";
  v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v310,  v309,  2LL));
  v322[5] = v84;
  v321[6] = @"NoUpdateFound";
  v307[0] = v2;
  v307[1] = v3;
  v308[0] = @"RemovingAllDoc";
  v308[1] = @"NotifyPulledRemoveAll";
  v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v308,  v307,  2LL));
  v322[6] = v83;
  v321[7] = @"PromoteToUserInitiated";
  uint64_t v305 = v2;
  v306 = @"FoundPromoting";
  v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v306,  &v305,  1LL));
  v322[7] = v82;
  v321[8] = @"FoundSame";
  v303[0] = v2;
  v303[1] = v3;
  v304[0] = @"UpdateFound";
  v304[1] = @"NotifyFoundSame";
  v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v304,  v303,  2LL));
  v322[8] = v81;
  v321[9] = @"FoundNewerSameDoc";
  v301[0] = v2;
  v301[1] = v3;
  v302[0] = @"UpdateFound";
  v302[1] = @"NotifyUpdateFound";
  v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v302,  v301,  2LL));
  v322[9] = v80;
  v321[10] = @"FoundNewerDiffDoc";
  v299[0] = v2;
  v299[1] = v3;
  v300[0] = @"RemovingOlder";
  v300[1] = @"RemoveOlder";
  v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v300,  v299,  2LL));
  v322[10] = v79;
  v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v322,  v321,  11LL));
  v454[9] = v78;
  v453[10] = @"FoundNewerCollectingDoc";
  v297[0] = @"ManualScan";
  uint64_t v295 = v3;
  v296 = @"RampManualDecidePromote";
  v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v296,  &v295,  1LL));
  v298[0] = v77;
  v297[1] = @"AutoScan";
  uint64_t v293 = v3;
  v294 = @"WillDownload";
  v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v294,  &v293,  1LL));
  v298[1] = v76;
  v297[2] = @"UpdateAcceptingTerms";
  uint64_t v291 = v3;
  v292 = @"WillUATC";
  v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v292,  &v291,  1LL));
  v298[2] = v75;
  v297[3] = @"PurgeScan";
  v289[0] = v2;
  v289[1] = v3;
  v290[0] = @"Canceling";
  v290[1] = @"CancelForgetTriggers";
  v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v290,  v289,  2LL));
  v298[3] = v74;
  v297[4] = @"CollectDocFailed";
  v287[0] = v2;
  v287[1] = v3;
  v288[0] = @"UpdateFound";
  v288[1] = @"NotifyScanFailed";
  v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v288,  v287,  2LL));
  v298[4] = v73;
  v297[5] = @"CollectDocNotRequired";
  uint64_t v285 = v3;
  v286 = @"DecideNewer";
  v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v286,  &v285,  1LL));
  v298[5] = v72;
  v297[6] = @"CollectDocSuccess";
  uint64_t v283 = v3;
  v284 = @"DecideNewer";
  v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v284,  &v283,  1LL));
  v298[6] = v71;
  v297[7] = @"PromoteToUserInitiated";
  uint64_t v281 = v2;
  v282 = @"FoundPromoting";
  v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v282,  &v281,  1LL));
  v298[7] = v70;
  v297[8] = @"FoundSame";
  v279[0] = v2;
  v279[1] = v3;
  v280[0] = @"UpdateFound";
  v280[1] = @"NotifyFoundSame";
  v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v280,  v279,  2LL));
  v298[8] = v69;
  v297[9] = @"FoundNewerSameDoc";
  v277[0] = v2;
  v277[1] = v3;
  v278[0] = @"UpdateFound";
  v278[1] = @"NotifyUpdateFound";
  v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v278,  v277,  2LL));
  v298[9] = v68;
  v297[10] = @"FoundNewerDiffDoc";
  v275[0] = v2;
  v275[1] = v3;
  v276[0] = @"RemovingOlder";
  v276[1] = @"RemoveOlder";
  v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v276,  v275,  2LL));
  v298[10] = v67;
  v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v298,  v297,  11LL));
  v454[10] = v66;
  v453[11] = @"FoundPromoting";
  v273[0] = @"ManualScan";
  uint64_t v271 = v3;
  v272 = @"RampManual";
  v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v272,  &v271,  1LL));
  v274[0] = v65;
  v273[1] = @"AutoScan";
  uint64_t v269 = v3;
  v270 = @"WillDownload";
  v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v270,  &v269,  1LL));
  v274[1] = v64;
  v273[2] = @"UpdateAcceptingTerms";
  uint64_t v267 = v3;
  v268 = @"WillUATC";
  v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v268,  &v267,  1LL));
  v274[2] = v63;
  v273[3] = @"PurgeScan";
  v265[0] = v2;
  v265[1] = v3;
  v266[0] = @"Canceling";
  v266[1] = @"CancelForgetTriggers";
  v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v266,  v265,  2LL));
  v274[3] = v62;
  v273[4] = @"ScanFailed";
  v263[0] = v2;
  v263[1] = v3;
  v264[0] = @"FoundScanning";
  v264[1] = @"ScanForUpdate";
  v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v264,  v263,  2LL));
  v274[4] = v61;
  v273[5] = @"UpdateFound";
  v261[0] = v2;
  v261[1] = v3;
  v262[0] = @"FoundScanning";
  v262[1] = @"ScanForUpdate";
  v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v262,  v261,  2LL));
  v274[5] = v60;
  v273[6] = @"NoUpdateFound";
  v259[0] = v2;
  v259[1] = v3;
  v260[0] = @"FoundScanning";
  v260[1] = @"ScanForUpdate";
  v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v260,  v259,  2LL));
  v274[6] = v59;
  v273[7] = @"CollectDocFailed";
  v257[0] = v2;
  v257[1] = v3;
  v258[0] = @"FoundScanning";
  v258[1] = @"ScanForUpdate";
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v258,  v257,  2LL));
  v274[7] = v58;
  v273[8] = @"CollectDocNotRequired";
  v255[0] = v2;
  v255[1] = v3;
  v256[0] = @"FoundScanning";
  v256[1] = @"ScanForUpdate";
  v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v256,  v255,  2LL));
  v274[8] = v57;
  v273[9] = @"CollectDocSuccess";
  v253[0] = v2;
  v253[1] = v3;
  v254[0] = @"FoundScanning";
  v254[1] = @"ScanForUpdate";
  v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v254,  v253,  2LL));
  v274[9] = v56;
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v274,  v273,  10LL));
  v454[11] = v55;
  v453[12] = @"RemovingOlder";
  v251[0] = @"ManualScan";
  v249[0] = v2;
  v249[1] = v3;
  v250[0] = @"RemovingOlderPending";
  v250[1] = @"RampManual";
  v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v250,  v249,  2LL));
  v252[0] = v54;
  v251[1] = @"AutoScan";
  v247[0] = v2;
  v247[1] = v3;
  v248[0] = @"RemovingOlderPending";
  v248[1] = @"WillDownload";
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v248,  v247,  2LL));
  v252[1] = v53;
  v251[2] = @"UpdateAcceptingTerms";
  v245[0] = v2;
  v245[1] = v3;
  v246[0] = @"RemovingOlderPending";
  v246[1] = @"WillUATC";
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v246,  v245,  2LL));
  v252[2] = v52;
  v251[3] = @"PurgeScan";
  v243[0] = v2;
  v243[1] = v3;
  v244[0] = @"PurgingRemoving";
  v244[1] = @"ForgetTriggers";
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v244,  v243,  2LL));
  v252[3] = v51;
  v251[4] = @"Removed";
  v241[0] = v2;
  v241[1] = v3;
  v242[0] = @"UpdateFound";
  v242[1] = @"RemovedNotifyUpdateFound";
  v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v242,  v241,  2LL));
  v252[4] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v252,  v251,  5LL));
  v454[12] = v49;
  v453[13] = @"RemovingOlderPending";
  v239[0] = @"ManualScan";
  uint64_t v237 = v3;
  v238 = @"RampManual";
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v238,  &v237,  1LL));
  v240[0] = v48;
  v239[1] = @"AutoScan";
  uint64_t v235 = v3;
  v236 = @"WillDownload";
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v236,  &v235,  1LL));
  v240[1] = v47;
  v239[2] = @"UpdateAcceptingTerms";
  uint64_t v233 = v3;
  v234 = @"WillUATC";
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v234,  &v233,  1LL));
  v240[2] = v46;
  v239[3] = @"PurgeScan";
  v231[0] = v2;
  v231[1] = v3;
  v232[0] = @"PurgingRemoving";
  v232[1] = @"ForgetTriggers";
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v232,  v231,  2LL));
  v240[3] = v45;
  v239[4] = @"Removed";
  v229[0] = v2;
  v229[1] = v3;
  v230[0] = @"FoundScanning";
  v230[1] = @"ScanForUpdate";
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v230,  v229,  2LL));
  v240[4] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v240,  v239,  5LL));
  v454[13] = v43;
  v453[14] = @"Canceling";
  v227[0] = @"ManualScan";
  v225[0] = v2;
  v225[1] = v3;
  v226[0] = @"CancelingPending";
  v226[1] = @"RampManual";
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v226,  v225,  2LL));
  v228[0] = v42;
  v227[1] = @"AutoScan";
  v223[0] = v2;
  v223[1] = v3;
  v224[0] = @"CancelingPending";
  v224[1] = @"WillDownload";
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v224,  v223,  2LL));
  v228[1] = v41;
  v227[2] = @"UpdateAcceptingTerms";
  v221[0] = v2;
  v221[1] = v3;
  v222[0] = @"CancelingPending";
  v222[1] = @"WillUATC";
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v222,  v221,  2LL));
  v228[2] = v40;
  v227[3] = @"PurgeScan";
  uint64_t v219 = v3;
  v220 = @"FailPurgeAlreadyPurging";
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v220,  &v219,  1LL));
  v228[3] = v39;
  v227[4] = @"ScanFailed";
  uint64_t v217 = v3;
  uint64_t v4 = kSUCoreFSMActionNoOp;
  uint64_t v218 = kSUCoreFSMActionNoOp;
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v218,  &v217,  1LL));
  v228[4] = v38;
  v227[5] = @"UpdateFound";
  uint64_t v215 = v3;
  uint64_t v216 = v4;
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v216,  &v215,  1LL));
  v228[5] = v37;
  v227[6] = @"NoUpdateFound";
  uint64_t v213 = v3;
  uint64_t v214 = v4;
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v214,  &v213,  1LL));
  v228[6] = v36;
  v227[7] = @"CollectDocFailed";
  uint64_t v211 = v3;
  uint64_t v212 = v4;
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v212,  &v211,  1LL));
  v228[7] = v35;
  v227[8] = @"CollectDocNotRequired";
  uint64_t v209 = v3;
  uint64_t v210 = v4;
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v210,  &v209,  1LL));
  v228[8] = v34;
  v227[9] = @"CollectDocSuccess";
  uint64_t v207 = v3;
  uint64_t v208 = v4;
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v208,  &v207,  1LL));
  v228[9] = v33;
  v227[10] = @"ScanCanceled";
  v205[0] = v2;
  v205[1] = v3;
  v206[0] = @"PurgingRemoving";
  v206[1] = @"RemoveAllDocForPurge";
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v206,  v205,  2LL));
  v228[10] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v228,  v227,  11LL));
  v454[14] = v31;
  v453[15] = @"CancelingPending";
  v203[0] = @"ManualScan";
  uint64_t v201 = v3;
  v202 = @"RampManual";
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v202,  &v201,  1LL));
  v204[0] = v30;
  v203[1] = @"AutoScan";
  uint64_t v199 = v3;
  v200 = @"WillDownload";
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v200,  &v199,  1LL));
  v204[1] = v29;
  v203[2] = @"UpdateAcceptingTerms";
  uint64_t v197 = v3;
  v198 = @"WillUATC";
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v198,  &v197,  1LL));
  v204[2] = v28;
  v203[3] = @"PurgeScan";
  uint64_t v195 = v3;
  v196 = @"FailPurgeAlreadyPurging";
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v196,  &v195,  1LL));
  v204[3] = v27;
  v203[4] = @"ScanFailed";
  uint64_t v193 = v3;
  uint64_t v194 = v4;
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v194,  &v193,  1LL));
  v204[4] = v26;
  v203[5] = @"UpdateFound";
  uint64_t v191 = v3;
  uint64_t v192 = v4;
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v192,  &v191,  1LL));
  v204[5] = v25;
  v203[6] = @"NoUpdateFound";
  uint64_t v189 = v3;
  uint64_t v190 = v4;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v190,  &v189,  1LL));
  v204[6] = v24;
  v203[7] = @"CollectDocFailed";
  uint64_t v187 = v3;
  uint64_t v188 = v4;
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v188,  &v187,  1LL));
  v204[7] = v23;
  v203[8] = @"CollectDocNotRequired";
  uint64_t v185 = v3;
  uint64_t v186 = v4;
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v186,  &v185,  1LL));
  v204[8] = v22;
  v203[9] = @"CollectDocSuccess";
  uint64_t v183 = v3;
  uint64_t v184 = v4;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v184,  &v183,  1LL));
  v204[9] = v21;
  v203[10] = @"ScanCanceled";
  v181[0] = v2;
  v181[1] = v3;
  v182[0] = @"PurgingRemovingPending";
  v182[1] = @"RemoveAllDoc";
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v182,  v181,  2LL));
  v204[10] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v204,  v203,  11LL));
  v454[15] = v19;
  v453[16] = @"PurgingRemoving";
  v179[0] = @"ManualScan";
  v177[0] = v2;
  v177[1] = v3;
  v178[0] = @"PurgingRemovingPending";
  v178[1] = @"RampManual";
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v178,  v177,  2LL));
  v180[0] = v18;
  v179[1] = @"AutoScan";
  v175[0] = v2;
  v175[1] = v3;
  v176[0] = @"PurgingRemovingPending";
  v176[1] = @"WillDownload";
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v176,  v175,  2LL));
  v180[1] = v17;
  v179[2] = @"UpdateAcceptingTerms";
  v173[0] = v2;
  v173[1] = v3;
  v174[0] = @"PurgingRemovingPending";
  v174[1] = @"WillUATC";
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v174,  v173,  2LL));
  v180[2] = v16;
  v179[3] = @"PurgeScan";
  uint64_t v171 = v3;
  v172 = @"FailPurgeAlreadyPurging";
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v172,  &v171,  1LL));
  v180[3] = v5;
  v179[4] = @"Removed";
  v169[0] = v2;
  v169[1] = v3;
  v170[0] = v155;
  v170[1] = @"PurgeComplete";
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v170,  v169,  2LL));
  v180[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v180,  v179,  5LL));
  v454[16] = v7;
  v453[17] = @"PurgingRemovingPending";
  v167[0] = @"ManualScan";
  uint64_t v165 = v3;
  v166 = @"RampManual";
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v166,  &v165,  1LL));
  v168[0] = v8;
  v167[1] = @"AutoScan";
  uint64_t v163 = v3;
  v164 = @"WillDownload";
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v164,  &v163,  1LL));
  v168[1] = v9;
  v167[2] = @"UpdateAcceptingTerms";
  uint64_t v161 = v3;
  v162 = @"WillUATC";
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v162,  &v161,  1LL));
  v168[2] = v10;
  v167[3] = @"PurgeScan";
  uint64_t v159 = v3;
  v160 = @"FailPurgeAlreadyPurging";
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v160,  &v159,  1LL));
  v168[3] = v11;
  v167[4] = @"Removed";
  v157[0] = v2;
  v157[1] = v3;
  v158[0] = @"NoNewerScanning";
  v158[1] = @"PurgeCompleteScan";
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v158,  v157,  2LL));
  v168[4] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v168,  v167,  5LL));
  v454[17] = v13;
  v156 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v454,  v453,  18LL));

  v14 = -[NSDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:copyItems:",  v156,  1LL);
  return v14;
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
    if ([v11 isEqualToString:@"RemoveAllDoc"])
    {
      int64_t v14 = -[SUControllerScanManager action_RemoveAllDoc:error:](self, "action_RemoveAllDoc:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"RemoveAllDocForPurge"])
    {
      int64_t v14 = -[SUControllerScanManager action_RemoveAllDocForPurge:error:]( self,  "action_RemoveAllDocForPurge:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"RemoveOlder"])
    {
      int64_t v14 = -[SUControllerScanManager action_RemoveOlder:error:](self, "action_RemoveOlder:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"SetRamp"])
    {
      int64_t v14 = -[SUControllerScanManager action_SetRamp:error:](self, "action_SetRamp:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"SetRampScan"])
    {
      int64_t v14 = -[SUControllerScanManager action_SetRampScan:error:](self, "action_SetRampScan:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"SetRampRemoveAllDocForPurge"])
    {
      int64_t v14 = -[SUControllerScanManager action_SetRampRemoveAllDocForPurge:error:]( self,  "action_SetRampRemoveAllDocForPurge:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ScanForUpdate"])
    {
      int64_t v14 = -[SUControllerScanManager action_ScanForUpdate:error:](self, "action_ScanForUpdate:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ScanForUpdateWillDownload"])
    {
      int64_t v14 = -[SUControllerScanManager action_ScanForUpdateWillDownload:error:]( self,  "action_ScanForUpdateWillDownload:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ScanWillUATC"])
    {
      int64_t v14 = -[SUControllerScanManager action_ScanWillUATC:error:](self, "action_ScanWillUATC:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"DecideAutoScanForUpdate"])
    {
      int64_t v14 = -[SUControllerScanManager action_DecideAutoScanForUpdate:error:]( self,  "action_DecideAutoScanForUpdate:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"WillUATC"])
    {
      int64_t v14 = -[SUControllerScanManager action_WillUATC:error:](self, "action_WillUATC:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"WillUATCDecidePromote"])
    {
      int64_t v14 = -[SUControllerScanManager action_WillUATCDecidePromote:error:]( self,  "action_WillUATCDecidePromote:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ForgetTriggers"])
    {
      int64_t v14 = -[SUControllerScanManager action_ForgetTriggers:error:](self, "action_ForgetTriggers:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"CancelForgetTriggers"])
    {
      int64_t v14 = -[SUControllerScanManager action_CancelForgetTriggers:error:]( self,  "action_CancelForgetTriggers:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"WillDownload"])
    {
      int64_t v14 = -[SUControllerScanManager action_WillDownload:error:](self, "action_WillDownload:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"RampManual"])
    {
      int64_t v14 = -[SUControllerScanManager action_RampManual:error:](self, "action_RampManual:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"RampManualScanForUpdate"])
    {
      int64_t v14 = -[SUControllerScanManager action_RampManualScanForUpdate:error:]( self,  "action_RampManualScanForUpdate:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"RampManualDecidePromote"])
    {
      int64_t v14 = -[SUControllerScanManager action_RampManualDecidePromote:error:]( self,  "action_RampManualDecidePromote:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"CollectDocMetadata"])
    {
      int64_t v14 = -[SUControllerScanManager action_CollectDocMetadata:error:]( self,  "action_CollectDocMetadata:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"NotifyScanFailed"])
    {
      int64_t v14 = -[SUControllerScanManager action_NotifyScanFailed:error:](self, "action_NotifyScanFailed:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"NotifyScanFailedRemoveAll"])
    {
      int64_t v14 = -[SUControllerScanManager action_NotifyScanFailedRemoveAll:error:]( self,  "action_NotifyScanFailedRemoveAll:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"NotifyUpdateFound"])
    {
      int64_t v14 = -[SUControllerScanManager action_NotifyUpdateFound:error:](self, "action_NotifyUpdateFound:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"NotifyNoUpdateFound"])
    {
      int64_t v14 = -[SUControllerScanManager action_NotifyNoUpdateFound:error:]( self,  "action_NotifyNoUpdateFound:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"NotifyFoundSame"])
    {
      int64_t v14 = -[SUControllerScanManager action_NotifyFoundSame:error:](self, "action_NotifyFoundSame:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"NotifyPulledRemoveAll"])
    {
      int64_t v14 = -[SUControllerScanManager action_NotifyPulledRemoveAll:error:]( self,  "action_NotifyPulledRemoveAll:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"RemovedNotifyUpdateFound"])
    {
      int64_t v14 = -[SUControllerScanManager action_RemovedNotifyUpdateFound:error:]( self,  "action_RemovedNotifyUpdateFound:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"DecideNewer"])
    {
      int64_t v14 = -[SUControllerScanManager action_DecideNewer:error:](self, "action_DecideNewer:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"FailPurgeAlreadyPurging"])
    {
      int64_t v14 = -[SUControllerScanManager action_FailPurgeAlreadyPurging:error:]( self,  "action_FailPurgeAlreadyPurging:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"PurgeComplete"])
    {
      int64_t v14 = -[SUControllerScanManager action_PurgeComplete:error:](self, "action_PurgeComplete:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"PurgeCompleteScan"])
    {
      int64_t v14 = -[SUControllerScanManager action_PurgeCompleteScan:error:](self, "action_PurgeCompleteScan:error:", v12, a8);
    }

    else
    {
      int64_t v14 = -[SUControllerScanManager actionUnknownAction:error:](self, "actionUnknownAction:error:", v11, a8);
    }

    int64_t v13 = v14;
  }

  return v13;
}

- (int64_t)action_RemoveAllDoc:(id)a3 error:(id *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM", a3, a4));
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerScanManager removeAllDocumentationContent](self, "removeAllDocumentationContent");
  return 0LL;
}

- (int64_t)action_RemoveAllDocForPurge:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerScanManager rememberPurgeCompletion:withEventInfo:]( self,  "rememberPurgeCompletion:withEventInfo:",  @"removing all doc for purge",  v5);
  -[SUControllerScanManager removeAllDocumentationContent](self, "removeAllDocumentationContent");
  -[SUControllerScanManager forgetAllPendingTriggers:](self, "forgetAllPendingTriggers:", @"purge requested");
  return 0LL;
}

- (int64_t)action_RemoveOlder:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM", a3, a4));
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerScanManager removeAllDocumentationContent](self, "removeAllDocumentationContent");
  return 0LL;
}

- (int64_t)action_SetRamp:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerScanManager setRampFromPersisted:](self, "setRampFromPersisted:", v5);
  return 0LL;
}

- (int64_t)action_SetRampScan:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerScanManager setRampFromPersisted:](self, "setRampFromPersisted:", v5);
  -[SUControllerScanManager scanForUpdate](self, "scanForUpdate");
  return 0LL;
}

- (int64_t)action_SetRampRemoveAllDocForPurge:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerScanManager setRampFromPersisted:](self, "setRampFromPersisted:", v5);
  -[SUControllerScanManager rememberPurgeCompletion:withEventInfo:]( self,  "rememberPurgeCompletion:withEventInfo:",  @"removing all doc for purge",  v5);

  -[SUControllerScanManager removeAllDocumentationContent](self, "removeAllDocumentationContent");
  return 0LL;
}

- (int64_t)action_ScanForUpdate:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM", a3, a4));
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerScanManager scanForUpdate](self, "scanForUpdate");
  return 0LL;
}

- (int64_t)action_ScanForUpdateWillDownload:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM", a3, a4));
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerScanManager plantDowloadAndPrepareTrigger:]( self,  "plantDowloadAndPrepareTrigger:",  @"issuing auto-scan");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
  v16 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000793C0));
  v17 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 delegateCallbackQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100027B24;
  block[3] = &unk_100065250;
  block[4] = self;
  id v15 = v9;
  id v12 = v9;
  dispatch_async(v11, block);

  -[SUControllerScanManager scanForUpdate](self, "scanForUpdate");
  return 0LL;
}

- (int64_t)action_DecideAutoScanForUpdate:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM", a3, a4));
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanConfig](self, "scanConfig"));
  LODWORD(v6) = [v7 performAutoScan];

  if ((_DWORD)v6)
  {
    -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[DECIDE-AUTO-SCAN] AutoScan will be performed because performAutoScan is set to YES.");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
    v9 = objc_alloc_init(&OBJC_CLASS___SUControllerScanManagerParam);
    [v8 followupEvent:@"ShouldAutoScan" withInfo:v9];
  }

  else
  {
    -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[DECIDE-AUTO-SCAN] AutoScan is skipped because performAutoScan is set to NO.");
  }

  return 0LL;
}

- (int64_t)action_ScanWillUATC:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager updateAcceptingTerms](self, "updateAcceptingTerms"));
  if (v8) {
    -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[UPDATE-ACCEPTING-TERMS] replaced older update attempt info with most recent info");
  }
  -[SUControllerScanManager setUpdateAcceptingTerms:](self, "setUpdateAcceptingTerms:", v5);
  -[SUControllerScanManager scanForUpdate](self, "scanForUpdate");

  return 0LL;
}

- (int64_t)action_WillUATC:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerScanManager willUpdateAcceptingTerms:](self, "willUpdateAcceptingTerms:", v5);
  return 0LL;
}

- (int64_t)action_WillUATCDecidePromote:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  LOBYTE(v6) = -[SUControllerScanManager rampingForeground](self, "rampingForeground");
  -[SUControllerScanManager willUpdateAcceptingTerms:](self, "willUpdateAcceptingTerms:", v5);

  if ((v6 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
    v9 = objc_alloc_init(&OBJC_CLASS___SUControllerScanManagerParam);
    [v8 postEvent:@"PromoteToUserInitiated" withInfo:v9];
  }

  return 0LL;
}

- (int64_t)action_ForgetTriggers:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerScanManager rememberPurgeCompletion:withEventInfo:]( self,  "rememberPurgeCompletion:withEventInfo:",  @"forgetting triggers (due to purge)",  v5);
  -[SUControllerScanManager forgetAllPendingTriggers:]( self,  "forgetAllPendingTriggers:",  @"purge requested (before any triggers could engage)");
  return 0LL;
}

- (int64_t)action_CancelForgetTriggers:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanner](self, "scanner"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100027F38;
  v10[3] = &unk_1000652C8;
  v10[4] = self;
  [v8 cancelCurrentScan:v10];

  -[SUControllerScanManager rememberPurgeCompletion:withEventInfo:]( self,  "rememberPurgeCompletion:withEventInfo:",  @"canceling and forgetting triggers (due to purge)",  v5);
  -[SUControllerScanManager forgetAllPendingTriggers:]( self,  "forgetAllPendingTriggers:",  @"purge requested when scanning (before any triggers could engage)");
  return 0LL;
}

- (int64_t)action_WillDownload:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerScanManager plantDowloadAndPrepareTrigger:]( self,  "plantDowloadAndPrepareTrigger:",  @"auto-scan requested");
  return 0LL;
}

- (int64_t)action_RampManual:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerScanManager adoptClientScanOptions:](self, "adoptClientScanOptions:", v5);
  return 0LL;
}

- (int64_t)action_RampManualScanForUpdate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerScanManager adoptClientScanOptions:](self, "adoptClientScanOptions:", v5);
  -[SUControllerScanManager scanForUpdate](self, "scanForUpdate");
  return 0LL;
}

- (int64_t)action_RampManualDecidePromote:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  LOBYTE(v6) = -[SUControllerScanManager rampingForeground](self, "rampingForeground");
  -[SUControllerScanManager adoptClientScanOptions:](self, "adoptClientScanOptions:", v5);

  if ((v6 & 1) == 0 && -[SUControllerScanManager rampingForeground](self, "rampingForeground"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
    v9 = objc_alloc_init(&OBJC_CLASS___SUControllerScanManagerParam);
    [v8 postEvent:@"PromoteToUserInitiated" withInfo:v9];
  }

  return 0LL;
}

- (int64_t)action_CollectDocMetadata:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  if ((sub_1000384C4() & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanner](self, "scanner"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanPolicy](self, "scanPolicy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryDescriptor]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanConfig](self, "scanConfig"));
    id v12 = [v11 downloadDocAsset];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100028330;
    v17[3] = &unk_1000650E8;
    v17[4] = self;
    id v18 = v5;
    [v8 collectDocumentationMetadataWithPolicy:v9 descriptor:v10 downloadDocumentation:v12 completion:v17];
  }

  else
  {
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceClass]);
    -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[SCAN-FOUND] Not requiring documentation asset for %@ platform",  v14);

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
    [v15 followupEvent:@"CollectDocNotRequired" withInfo:v5];
  }

  return 0LL;
}

- (int64_t)action_NotifyScanFailed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerScanManager clearUnlatchedRamp](self, "clearUnlatchedRamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
  -[SUControllerScanManager notifyScanFailed:](self, "notifyScanFailed:", v8);

  -[SUControllerScanManager forgetAllPendingTriggers:](self, "forgetAllPendingTriggers:", @"scan failed");
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);

  -[SUControllerScanManager scanLogError:message:]( self,  "scanLogError:message:",  v9,  @"%@:[SCAN-ERROR] Failed to scan for update | scanUUID cleared",  @"[__MILESTONE__]");
  -[SUControllerScanManager setScanUUID:](self, "setScanUUID:", 0LL);
  return 0LL;
}

- (int64_t)action_NotifyScanFailedRemoveAll:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerScanManager clearUnlatchedRamp](self, "clearUnlatchedRamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
  -[SUControllerScanManager notifyScanFailed:](self, "notifyScanFailed:", v8);

  -[SUControllerScanManager removeAllDocumentationContent](self, "removeAllDocumentationContent");
  -[SUControllerScanManager forgetAllPendingTriggers:]( self,  "forgetAllPendingTriggers:",  @"scan failed (remove all)");
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);

  -[SUControllerScanManager scanLogError:message:]( self,  "scanLogError:message:",  v9,  @"%@:[SCAN-ERROR] Failed to scan for update (removing all doc content) | scanUUID cleared",  @"[__MILESTONE__]");
  -[SUControllerScanManager setScanUUID:](self, "setScanUUID:", 0LL);
  return 0LL;
}

- (int64_t)action_NotifyUpdateFound:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 scanPolicy]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryDescriptor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 secondaryDescriptor]);

  -[SUControllerScanManager notifyUpdateFoundUsingPolicy:locatedPrimaryDescriptor:locatedSecondaryDescrtiptor:]( self,  "notifyUpdateFoundUsingPolicy:locatedPrimaryDescriptor:locatedSecondaryDescrtiptor:",  v8,  v9,  v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 productBuildVersion]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 releaseType]);
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 updateTypeName]);
  int64_t v14 = (void *)v13;
  if (v10)
  {
    v19 = v8;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 productBuildVersion]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v10 releaseType]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v10 updateTypeName]);
    -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"%@:[SCAN-FOUND] scan found an available update (newer / different than any last reported) | primary: %@(%@)(%@), secondary: %@(%@)(%@)",  @"[__MILESTONE__]",  v11,  v12,  v14,  v15,  v16,  v17);

    v8 = v19;
    -[SUControllerScanManager scanLog:](self, "scanLog:", @"primaryDescriptor details: %@", v9);
    -[SUControllerScanManager scanLog:](self, "scanLog:", @"secondaryDescriptor details: %@", v10);
  }

  else
  {
    -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"%@:[SCAN-FOUND] scan found an available update (newer / different than any last reported) | descriptor: %@(%@)(%@)",  @"[__MILESTONE__]",  v11,  v12,  v13);

    -[SUControllerScanManager scanLog:](self, "scanLog:", @"primaryDescriptor details: %@", v9);
  }

  return 0LL;
}

- (int64_t)action_NotifyNoUpdateFound:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerScanManager clearUnlatchedRamp](self, "clearUnlatchedRamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);

  -[SUControllerScanManager notifyNoUpdateFound:](self, "notifyNoUpdateFound:", v8);
  -[SUControllerScanManager forgetAllPendingTriggers:](self, "forgetAllPendingTriggers:", @"no update found");
  -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[SCAN_FOUND] scan found no current update available | scanUUID cleared");
  -[SUControllerScanManager setScanUUID:](self, "setScanUUID:", 0LL);
  return 0LL;
}

- (int64_t)action_NotifyFoundSame:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 scanPolicy]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryDescriptor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 secondaryDescriptor]);

  -[SUControllerScanManager notifyUpdateFoundUsingPolicy:locatedPrimaryDescriptor:locatedSecondaryDescrtiptor:]( self,  "notifyUpdateFoundUsingPolicy:locatedPrimaryDescriptor:locatedSecondaryDescrtiptor:",  v8,  v9,  v10);
  -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[SCAN_FOUND] scan found same update already reported | scanUUID cleared");
  -[SUControllerScanManager setScanUUID:](self, "setScanUUID:", 0LL);

  return 0LL;
}

- (int64_t)action_NotifyPulledRemoveAll:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[SUControllerScanManager clearUnlatchedRamp](self, "clearUnlatchedRamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);

  -[SUControllerScanManager notifyNoUpdateFound:](self, "notifyNoUpdateFound:", v8);
  -[SUControllerScanManager removeAllDocumentationContent](self, "removeAllDocumentationContent");
  -[SUControllerScanManager forgetAllPendingTriggers:]( self,  "forgetAllPendingTriggers:",  @"previously found update has been pulled");
  -[SUControllerScanManager scanLog:](self, "scanLog:", @"[SCAN_PULLED] previously found update has been pulled");
  return 0LL;
}

- (int64_t)action_RemovedNotifyUpdateFound:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager newerScanPolicy](self, "newerScanPolicy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager newerFoundPrimary](self, "newerFoundPrimary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager newerFoundSecondary](self, "newerFoundSecondary"));
  -[SUControllerScanManager setNewerScanPolicy:](self, "setNewerScanPolicy:", 0LL);
  -[SUControllerScanManager setNewerFoundPrimary:](self, "setNewerFoundPrimary:", 0LL);
  -[SUControllerScanManager setNewerFoundSecondary:](self, "setNewerFoundSecondary:", 0LL);
  -[SUControllerScanManager notifyUpdateFoundUsingPolicy:locatedPrimaryDescriptor:locatedSecondaryDescrtiptor:]( self,  "notifyUpdateFoundUsingPolicy:locatedPrimaryDescriptor:locatedSecondaryDescrtiptor:",  v7,  v8,  v9);
  -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[SCAN_FOUND] scan found an available update (just removed older scan content)");

  return 0LL;
}

- (int64_t)action_DecideNewer:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 scanPolicy]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryDescriptor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 secondaryDescriptor]);
  if (!v9)
  {
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    [v14 trackAnomaly:@"[SCAN_DECIDE]" forReason:@"found available update yet no primary descriptor provided - treating as if just found same update as already found" withResult:8101 withError:0];

    goto LABEL_6;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager latestFoundPrimary](self, "latestFoundPrimary"));

  if (!v11)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    [v18 trackAnomaly:@"[SCAN_DECIDE]" forReason:@"found available update when no latest found primary - assuming older doc must be removed" withResult:8101 withError:0];

LABEL_8:
    -[SUControllerScanManager setNewerScanPolicy:](self, "setNewerScanPolicy:", v8);
    -[SUControllerScanManager setNewerFoundPrimary:](self, "setNewerFoundPrimary:", v9);
    -[SUControllerScanManager setNewerFoundSecondary:](self, "setNewerFoundSecondary:", v10);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
    v16 = v15;
    v17 = @"FoundNewerDiffDoc";
    goto LABEL_16;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager latestFoundPrimary](self, "latestFoundPrimary"));
  unsigned int v13 = [v12 isEqual:v9];

  if (!v13)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager latestFoundPrimary](self, "latestFoundPrimary"));
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 documentation]);
    if (v20)
    {
      v21 = (void *)v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager latestFoundPrimary](self, "latestFoundPrimary"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 documentation]);
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 localBundleURL]);
      if (v24)
      {
        v34 = (void *)v24;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager latestFoundPrimary](self, "latestFoundPrimary"));
        v29 = (void *)objc_claimAutoreleasedReturnValue([v31 documentation]);
        v33 = v23;
        v25 = (void *)objc_claimAutoreleasedReturnValue([v29 localBundleURL]);
        v32 = v22;
        v26 = (void *)objc_claimAutoreleasedReturnValue([v9 documentation]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 localBundleURL]);
        unsigned __int8 v30 = [v25 isEqual:v27];

        if ((v30 & 1) == 0)
        {
          -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[SCAN_DECIDE] found newer update when older doc to be removed");
          goto LABEL_8;
        }

- (int64_t)action_FailPurgeAlreadyPurging:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
  [v8 trackAnomaly:@"[SCAN_PURGE]" forReason:@"request to purge when already purging - triggering completion of previous stale purge" withResult:8111 withError:0];

  -[SUControllerScanManager issuePurgeCompletion](self, "issuePurgeCompletion");
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 purgeCompletion]);

  -[SUControllerScanManager setPurgeCompletion:](self, "setPurgeCompletion:", v9);
  return 0LL;
}

- (int64_t)action_PurgeComplete:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerScanManager clearAllScanTracking](self, "clearAllScanTracking");
  -[SUControllerScanManager issuePurgeCompletion](self, "issuePurgeCompletion");
  return 0LL;
}

- (int64_t)action_PurgeCompleteScan:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM", a3, a4));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerScanManager clearAllScanTracking](self, "clearAllScanTracking");
  -[SUControllerScanManager issuePurgeCompletion](self, "issuePurgeCompletion");
  -[SUControllerScanManager scanForUpdate](self, "scanForUpdate");
  return 0LL;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
  v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"unknown action(%@)",  v5);
  [v6 trackAnomaly:@"[SCAN_MANAGER]" forReason:v7 withResult:8116 withError:0];

  -[SUControllerScanManager scanLogError:message:]( self,  "scanLogError:message:",  0LL,  @"[SCAN_MANAGER] unknown action(%@)",  v5);
  return 0LL;
}

- (SUControllerScanManager)initWithAttachedClients:(id)a3 withConfig:(id)a4 withPolicyEngine:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___SUControllerScanManager;
  id v12 = -[SUControllerScanManager init](&v38, "init");
  unsigned int v13 = v12;
  if (!v12) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v12->_attachedClients, a3);
  int64_t v14 = (SUControllerConfig *)[v10 copy];
  scanConfig = v13->_scanConfig;
  v13->_scanConfig = v14;

  objc_storeStrong((id *)&v13->_policyEngine, a5);
  scanPolicy = v13->_scanPolicy;
  v13->_scanPolicy = 0LL;

  scanner = v13->_scanner;
  v13->_scanner = 0LL;

  id v18 = -[SUCoreLog initWithCategory:](objc_alloc(&OBJC_CLASS___SUCoreLog), "initWithCategory:", @"SM");
  scanLogCategory = v13->_scanLogCategory;
  v13->_scanLogCategory = v18;

  latestFoundPrimary = v13->_latestFoundPrimary;
  v13->_latestFoundPrimary = 0LL;

  *(_WORD *)&v13->_rampingForeground = 0;
  scanOptions = v13->_scanOptions;
  v13->_scanOptions = 0LL;

  v13->_triggerDownloadAndPrepare = 0;
  scanName = v13->_scanName;
  v13->_scanName = (NSString *)@"ScanManager";

  latestFoundSecondary = v13->_latestFoundSecondary;
  v13->_latestFoundSecondary = 0LL;

  newerScanPolicy = v13->_newerScanPolicy;
  v13->_newerScanPolicy = 0LL;

  newerFoundPrimary = v13->_newerFoundPrimary;
  v13->_newerFoundPrimary = 0LL;

  newerFoundSecondary = v13->_newerFoundSecondary;
  v13->_newerFoundSecondary = 0LL;

  id purgeCompletion = v13->_purgeCompletion;
  v13->_id purgeCompletion = 0LL;

  scanUUIDBasePortion = v13->_scanUUIDBasePortion;
  v13->_scanUUIDBasePortion = 0LL;

  scanUUID = v13->_scanUUID;
  v13->_scanUUID = 0LL;

  id v30 = [(id)objc_opt_class(SUControllerScanManager) _generateStateTable];
  uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
  stateTable = v13->_stateTable;
  v13->_stateTable = (NSDictionary *)v31;

  v33 = objc_alloc(&OBJC_CLASS___SUCoreFSM);
  v34 = (SUCoreFSM *)-[SUCoreFSM initMachine:withTable:startingIn:usingDelegate:registeringAllInfoClass:]( v33,  "initMachine:withTable:startingIn:usingDelegate:registeringAllInfoClass:",  @"ScanManager",  v13->_stateTable,  kSU_S_Startup,  v13,  objc_opt_class(&OBJC_CLASS___SUControllerScanManagerParam));
  scanFSM = v13->_scanFSM;
  v13->_scanFSM = v34;

  if (!v13->_scanFSM) {
    v36 = 0LL;
  }
  else {
LABEL_3:
  }
    v36 = v13;

  return v36;
}

- (void)activateWithBaseUUID:(id)a3 rampingForeground:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  v7 = -[SUControllerScanManagerParam initWithBaseUUID:rampingForeground:]( objc_alloc(&OBJC_CLASS___SUControllerScanManagerParam),  "initWithBaseUUID:rampingForeground:",  v6,  v4);

  [v8 postEvent:@"Activate" withInfo:v7];
}

- (void)scanForUpdatesForClient:(id)a3 withScanOptions:(id)a4
{
  id v5 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v6 = -[SUControllerScanManagerParam initWithScanOptions:]( objc_alloc(&OBJC_CLASS___SUControllerScanManagerParam),  "initWithScanOptions:",  v5);

  [v7 postEvent:@"ManualScan" withInfo:v6];
}

- (void)autoScanTrigger
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___SUControllerScanManagerParam);
  [v3 postEvent:@"AutoScan" withInfo:v2];
}

- (void)updateAcceptingTermsForClient:(id)a3 forDescriptor:(id)a4 usingSSOToken:(id)a5
{
  id v6 = a5;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v7 = -[SUControllerScanManagerParam initWithSSOToken:]( objc_alloc(&OBJC_CLASS___SUControllerScanManagerParam),  "initWithSSOToken:",  v6);

  [v8 postEvent:@"UpdateAcceptingTerms" withInfo:v7];
}

- (void)modifyConfigForClient:(id)a3 alteringConfig:(id)a4 forChangeMask:(int64_t)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
    unsigned int v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 extendedStateQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000295E4;
    block[3] = &unk_1000656A8;
    id v19 = v10;
    id v20 = v9;
    v21 = self;
    id v22 = v11;
    dispatch_async(v13, block);
  }

  else
  {
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    id v15 = objc_alloc(&OBJC_CLASS___NSString);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v9 summary]);
    v17 = -[NSString initWithFormat:]( v15,  "initWithFormat:",  @"%@ {modifyConfigForClient} invalid request - no completion provided",  v16);
    [v14 trackAnomaly:@"[SCAN_MANAGER]" forReason:v17 withResult:8101 withError:0];
  }
}

- (void)purgeScanContentWithBaseUUID:(id)a3 rampingForeground:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v10 = -[SUControllerScanManagerParam initWithBaseUUID:rampingForeground:completion:]( objc_alloc(&OBJC_CLASS___SUControllerScanManagerParam),  "initWithBaseUUID:rampingForeground:completion:",  v9,  v5,  v8);

  [v11 postEvent:@"PurgeScan" withInfo:v10];
}

- (void)adoptClientScanOptions:(id)a3
{
  id v9 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  if ([v9 paramType] == (id)2
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 scanOptions]), v6, v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 scanOptions]);
    if ([v7 downloadWhenFound]) {
      -[SUControllerScanManager plantDowloadAndPrepareTrigger:]( self,  "plantDowloadAndPrepareTrigger:",  @"client scan with downloadWhenFound=YES");
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 scanOptions]);
    -[SUControllerScanManager setScanOptions:](self, "setScanOptions:", v8);
  }

  else
  {
    -[SUControllerScanManager setRampingForeground:](self, "setRampingForeground:", 1LL);
    -[SUControllerScanManager plantDowloadAndPrepareTrigger:]( self,  "plantDowloadAndPrepareTrigger:",  @"client scan with default options [most aggressive scan]");
  }
}

- (void)scanForUpdate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  -[SUControllerScanManager setNewerScanPolicy:](self, "setNewerScanPolicy:", 0LL);
  -[SUControllerScanManager setNewerFoundPrimary:](self, "setNewerFoundPrimary:", 0LL);
  -[SUControllerScanManager setNewerFoundSecondary:](self, "setNewerFoundSecondary:", 0LL);
  id v5 = -[SUControllerScanManager newSessionID](self, "newSessionID");
  -[SUControllerScanManager setScanUUID:](self, "setScanUUID:", v5);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanConfig](self, "scanConfig"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUID](self, "scanUUID"));
  id v8 = +[SUControllerScanManager allocScanPolicyUsingConfig:withScanUUID:rampingForeground:]( &OBJC_CLASS___SUControllerScanManager,  "allocScanPolicyUsingConfig:withScanUUID:rampingForeground:",  v6,  v7,  -[SUControllerScanManager rampingForeground](self, "rampingForeground"));
  -[SUControllerScanManager setScanPolicy:](self, "setScanPolicy:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanConfig](self, "scanConfig"));
  LOBYTE(v6) = [v9 ignoreRamping];

  if ((v6 & 1) != 0)
  {
    id v10 = @"no ramping control specified";
  }

  else if (-[SUControllerScanManager rampingForeground](self, "rampingForeground"))
  {
    id v10 = @"foreground - server should not limit indicated available update as postponed due to ramping";
  }

  else
  {
    id v10 = @"background - server to determine whether to consider the update as being available for installation";
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUID](self, "scanUUID"));
  -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[SCAN_FOR_UPDATE] scanning for available update | ramping:(%@) | scanUUID:%@",  v10,  v11);

  id v12 = objc_alloc(&OBJC_CLASS___SUCoreScan);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUID](self, "scanUUID"));
  int64_t v14 = -[SUCoreScan initWithUUID:](v12, "initWithUUID:", v13);
  -[SUControllerScanManager setScanner:](self, "setScanner:", v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanner](self, "scanner"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanPolicy](self, "scanPolicy"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100029B04;
  v17[3] = &unk_1000656D0;
  v17[4] = self;
  [v15 checkForAvailableUpdateWithPolicy:v16 completion:v17];
}

- (void)clearAllScanTracking
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  -[SUControllerScanManager setLatestFoundPrimary:](self, "setLatestFoundPrimary:", 0LL);
  -[SUControllerScanManager setLatestFoundSecondary:](self, "setLatestFoundSecondary:", 0LL);
  -[SUControllerScanManager setNewerScanPolicy:](self, "setNewerScanPolicy:", 0LL);
  -[SUControllerScanManager setNewerFoundPrimary:](self, "setNewerFoundPrimary:", 0LL);
  -[SUControllerScanManager setNewerFoundSecondary:](self, "setNewerFoundSecondary:", 0LL);
  -[SUControllerScanManager setScanUUID:](self, "setScanUUID:", 0LL);
}

- (void)forgetUpdateAcceptingTerms:(id)a3
{
  id v7 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager updateAcceptingTerms](self, "updateAcceptingTerms"));
  if (v6)
  {
    -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[UPDATE_ACCEPTING_TERMS] unable to trigger full update attempt (%@)",  v7);
    -[SUControllerScanManager setUpdateAcceptingTerms:](self, "setUpdateAcceptingTerms:", 0LL);
  }
}

- (void)plantDowloadAndPrepareTrigger:(id)a3
{
  id v6 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  if (!-[SUControllerScanManager triggerDownloadAndPrepare](self, "triggerDownloadAndPrepare"))
  {
    -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[TRIGGER_DOWNLOAD] will trigger download-and-prepare (%@)",  v6);
    -[SUControllerScanManager setTriggerDownloadAndPrepare:](self, "setTriggerDownloadAndPrepare:", 1LL);
  }
}

- (void)forgetDowloadAndPrepareTrigger:(id)a3
{
  id v6 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  if (-[SUControllerScanManager triggerDownloadAndPrepare](self, "triggerDownloadAndPrepare"))
  {
    -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[TRIGGER_DOWNLOAD] clearing trigger to download-and-prepare (%@)",  v6);
    -[SUControllerScanManager setTriggerDownloadAndPrepare:](self, "setTriggerDownloadAndPrepare:", 0LL);
  }
}

- (void)forgetAllPendingTriggers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[SUControllerScanManager forgetUpdateAcceptingTerms:](self, "forgetUpdateAcceptingTerms:", v4);
  -[SUControllerScanManager forgetDowloadAndPrepareTrigger:](self, "forgetDowloadAndPrepareTrigger:", v4);

  -[SUControllerScanManager setScanOptions:](self, "setScanOptions:", 0LL);
  -[SUControllerScanManager setNewerScanPolicy:](self, "setNewerScanPolicy:", 0LL);
  -[SUControllerScanManager setNewerFoundPrimary:](self, "setNewerFoundPrimary:", 0LL);
  -[SUControllerScanManager setNewerFoundSecondary:](self, "setNewerFoundSecondary:", 0LL);
}

- (void)rememberPurgeCompletion:(id)a3 withEventInfo:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 extendedStateQueue]);
  dispatch_assert_queue_V2(v8);

  if ([v6 paramType] == (id)6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager purgeCompletion](self, "purgeCompletion"));

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
      id v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ when already holding purge completion - replacing stale completion",  v14);
      [v10 trackAnomaly:@"[SCAN_PURGE]" forReason:v11 withResult:8111 withError:0];
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 purgeCompletion]);
    -[SUControllerScanManager setPurgeCompletion:](self, "setPurgeCompletion:", v12);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    unsigned int v13 = -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"%@ with event info type(%ld) != SCAN_PARAM_TYPE_PURGE(%ld)",  v14,  [v6 paramType],  6);
    [v12 trackAnomaly:@"[SCAN_PURGE]" forReason:v13 withResult:8112 withError:0];
  }
}

- (void)notifyUpdateFoundUsingPolicy:(id)a3 locatedPrimaryDescriptor:(id)a4 locatedSecondaryDescrtiptor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 extendedStateQueue]);
  dispatch_assert_queue_V2(v12);

  if (!v9)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    [v25 trackAnomaly:@"[SCAN_MANAGER]" forReason:@"scan determined update found without any primary descriptor - indication ignored" withResult:8101 withError:0];

    v26 = @"scan determined update found without any primary descriptor";
    v27 = self;
    goto LABEL_21;
  }

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanPolicy](self, "scanPolicy"));
  unsigned __int8 v14 = [v8 isEqual:v13];

  if ((v14 & 1) == 0)
  {
    -[SUControllerScanManager scanLog:](self, "scanLog:", @"[SCAN_POLICY] adopting policy that found the update");
    -[SUControllerScanManager setScanPolicy:](self, "setScanPolicy:", v8);
  }

  -[SUControllerScanManager setLatestFoundPrimary:](self, "setLatestFoundPrimary:", v9);
  -[SUControllerScanManager setLatestFoundSecondary:](self, "setLatestFoundSecondary:", v10);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanConfig](self, "scanConfig"));
  if (([v15 ignoreRamping] & 1) == 0
    && !-[SUControllerScanManager rampingForeground](self, "rampingForeground"))
  {
    if (-[SUControllerScanManager rampingForeground](self, "rampingForeground"))
    {
    }

    else
    {
      unsigned __int8 v38 = [v9 rampEnabled];

      if ((v38 & 1) == 0) {
        goto LABEL_7;
      }
    }

    -[SUControllerScanManager notifyScanPostponedForReason:locatedPrimaryDescriptor:locatedSecondaryDescrtiptor:scanPolicy:]( self,  "notifyScanPostponedForReason:locatedPrimaryDescriptor:locatedSecondaryDescrtiptor:scanPolicy:",  @"scan found update that is to be postponed due to ramping",  v9,  v10,  v8);
    v27 = self;
    v26 = @"scan found update that is to be postponed due to ramping";
LABEL_21:
    -[SUControllerScanManager forgetAllPendingTriggers:](v27, "forgetAllPendingTriggers:", v26);
    goto LABEL_22;
  }

LABEL_7:
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v9 summary]);
  v17 = (void *)v16;
  id v18 = @"present";
  if (!v10) {
    id v18 = @"none";
  }
  -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[SCAN_NOTIFY] update found | primary:%@, secondary:%@",  v16,  v18);

  if (-[SUControllerScanManager rampingForeground](self, "rampingForeground")
    && !-[SUControllerScanManager rampingForegroundLatched](self, "rampingForegroundLatched"))
  {
    -[SUControllerScanManager setRampingForegroundLatched:](self, "setRampingForegroundLatched:", 1LL);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager updateAcceptingTerms](self, "updateAcceptingTerms"));

  if (v19)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager updateAcceptingTerms](self, "updateAcceptingTerms"));
    -[SUControllerScanManager setUpdateAcceptingTerms:](self, "setUpdateAcceptingTerms:", 0LL);
    -[SUControllerScanManager forgetAllPendingTriggers:]( self,  "forgetAllPendingTriggers:",  @"scan found for update accepting T&C, triggering download-and-prepare");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager policyEngine](self, "policyEngine"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUID](self, "scanUUID"));
    BOOL v23 = -[SUControllerScanManager rampingForeground](self, "rampingForeground");
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v20 ssoToken]);
    [v21 scanFoundUpdateImmediateAttempt:v8 scanUUID:v22 rampingForeground:v23 primaryDescriptor:v9 secondaryDescriptor:v10 withSSOToken:v24];
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanOptions](self, "scanOptions"));
    -[SUControllerScanManager forgetAllPendingTriggers:]( self,  "forgetAllPendingTriggers:",  @"scan found update, triggering download-and-prepare");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager policyEngine](self, "policyEngine"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUID](self, "scanUUID"));
    objc_msgSend( v21,  "scanFoundUpdate:scanUUID:rampingForeground:primaryDescriptor:secondaryDescriptor:scanOptions:",  v8,  v22,  -[SUControllerScanManager rampingForeground](self, "rampingForeground"),  v9,  v10,  v20);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
  v41[0] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000793C8));
  v42[0] = v29;
  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079490));
  v41[1] = v30;
  id v31 = +[SUControllerSUCore newDescriptorFromCoreDescriptor:corePolicy:]( &OBJC_CLASS___SUControllerSUCore,  "newDescriptorFromCoreDescriptor:corePolicy:",  v9,  v8);
  id v32 = sub_100034E04(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v42[1] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  2LL));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v35 delegateCallbackQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002A5A0;
  block[3] = &unk_100065250;
  void block[4] = self;
  id v40 = v34;
  id v37 = v34;
  dispatch_async(v36, block);

LABEL_22:
}

- (void)notifyScanPostponedForReason:(id)a3 locatedPrimaryDescriptor:(id)a4 locatedSecondaryDescrtiptor:(id)a5 scanPolicy:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 extendedStateQueue]);
  dispatch_assert_queue_V2(v15);

  if (v11)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 buildError:8410 underlying:0 description:v10]);
    v39 = (void *)v17;

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v11 summary]);
    id v19 = (void *)v18;
    id v20 = @"present";
    if (!v12) {
      id v20 = @"none";
    }
    -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[SCAN_NOTIFY] (POSTPONED) located update to be postponed (%@) | primary:%@, secondary:%@",  v10,  v18,  v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager policyEngine](self, "policyEngine"));
    id v42 = v13;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanPolicy](self, "scanPolicy"));
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUID](self, "scanUUID"));
    objc_msgSend( v21,  "scanFoundPostponedUpdate:controllerStatus:scanUUID:rampingForeground:primaryDescriptor:secondaryDescriptor:error:",  v22,  @"delayedRamping",  v23,  -[SUControllerScanManager rampingForeground](self, "rampingForeground"),  v11,  v12,  v17);

    id v41 = v10;
    unsigned __int8 v38 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerSUCore errorFromCoreError:]( &OBJC_CLASS___SUControllerSUCore,  "errorFromCoreError:",  v17));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
    v45[0] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000793D0));
    v46[0] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079490));
    v45[1] = v26;
    id v27 = +[SUControllerSUCore newDescriptorFromCoreDescriptor:corePolicy:]( &OBJC_CLASS___SUControllerSUCore,  "newDescriptorFromCoreDescriptor:corePolicy:",  v11,  v42);
    id v28 = sub_100034E04(v27);
    id v40 = v12;
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v46[1] = v29;
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079478));
    v45[2] = v30;
    id v31 = sub_100034E04(v38);
    id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v46[2] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  3LL));

    id v13 = v42;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    v35 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v34 delegateCallbackQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002A988;
    block[3] = &unk_100065250;
    void block[4] = self;
    id v44 = v33;
    id v36 = v33;
    dispatch_async(v35, block);

    id v12 = v40;
    id v10 = v41;
  }

  else
  {
    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    [v37 trackAnomaly:@"[SCAN_MANAGER]" forReason:@"scan located update to be postponed without any primary descriptor - indication ignored" withResult:8101 withError:0];
  }
}

- (void)notifyNoUpdateFound:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    id v4 = (id)objc_claimAutoreleasedReturnValue( [v7 buildError:8406 underlying:0 description:@"scan found no update available (details unknown)"]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    [v8 trackAnomaly:@"[SCAN_NOTIFY]" forReason:@"scan determined no update found without any error provided - indicating generic error" withResult:8101 withError:v4];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  id v10 = [v4 code];

  if (v10 == (id)8406)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager policyEngine](self, "policyEngine"));
    [v9 scanFoundNoUpdateAvailable];
LABEL_6:
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerSUCore errorFromCoreError:](&OBJC_CLASS___SUControllerSUCore, "errorFromCoreError:", v4));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
  v23[0] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000793C8));
  v24[0] = v13;
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079478));
  v23[1] = v14;
  id v15 = sub_100034E04(v11);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v24[1] = v16;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v18 delegateCallbackQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002AC68;
  block[3] = &unk_100065250;
  void block[4] = self;
  id v22 = v17;
  id v20 = v17;
  dispatch_async(v19, block);
}

- (void)notifyScanFailed:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    id v4 = (id)objc_claimAutoreleasedReturnValue( [v7 buildError:8402 underlying:0 description:@"scan failed (details unknown)"]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    [v8 trackAnomaly:@"[SCAN_NOTIFY]" forReason:@"scan failed without any error provided - indicating generic error" withResult:8101 withError:v4];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerSUCore errorFromCoreError:](&OBJC_CLASS___SUControllerSUCore, "errorFromCoreError:", v4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079388));
  v21[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000793C8));
  v22[0] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_100079478));
  v21[1] = v12;
  id v13 = sub_100034E04(v9);
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v22[1] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
  uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 delegateCallbackQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002AEF0;
  block[3] = &unk_100065250;
  void block[4] = self;
  id v20 = v15;
  id v18 = v15;
  dispatch_async(v17, block);
}

- (void)setRampFromPersisted:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 baseScanUUID]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 baseScanUUID]);
    -[SUControllerScanManager setScanUUIDBasePortion:](self, "setScanUUIDBasePortion:", v5);
  }

  if ([v6 rampingForeground])
  {
    -[SUControllerScanManager setRampingForeground:](self, "setRampingForeground:", 1LL);
    -[SUControllerScanManager setRampingForegroundLatched:](self, "setRampingForegroundLatched:", 1LL);
  }
}

- (void)clearUnlatchedRamp
{
  if (-[SUControllerScanManager rampingForeground](self, "rampingForeground"))
  {
    if (!-[SUControllerScanManager rampingForegroundLatched](self, "rampingForegroundLatched")) {
      -[SUControllerScanManager setRampingForeground:](self, "setRampingForeground:", 0LL);
    }
  }

- (void)clearLatchedRamp
{
}

- (id)newSessionID
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUIDBasePortion](self, "scanUUIDBasePortion"));
  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    -[SUControllerScanManager setScanUUIDBasePortion:](self, "setScanUUIDBasePortion:", v7);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUIDBasePortion](self, "scanUUIDBasePortion"));
    -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[SCAN_SESSION_ID] created base portion for session ID creation | scanUUIDBasePortion:%@",  v8);
  }

  if ((unint64_t)[v4 length] < 4
    || (id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUIDBasePortion](self, "scanUUIDBasePortion")),
        id v10 = [v9 length],
        v9,
        (unint64_t)v10 < 4))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
    [v16 trackAnomaly:@"[SCAN_SESSION_ID]" forReason:@"unable to create blended session ID (for ramping support) - using un-blended ID" withResult:8101 withError:0];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v15 = (NSString *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", 0, (char *)objc_msgSend(v4, "length") - 3));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUIDBasePortion](self, "scanUUIDBasePortion"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUIDBasePortion](self, "scanUUIDBasePortion"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", (char *)objc_msgSend(v13, "length") - 3, 3));

    id v15 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@%@", v11, v14);
  }

  if (!v5)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager policyEngine](self, "policyEngine"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUIDBasePortion](self, "scanUUIDBasePortion"));
    objc_msgSend( v17,  "scanGeneratedBaseUUID:rampingForeground:",  v18,  -[SUControllerScanManager rampingForeground](self, "rampingForeground"));
  }

  -[SUControllerScanManager scanLog:](self, "scanLog:", @"[SCAN_SESSION_ID] new sessionID:%@", v15);

  return v15;
}

- (void)willUpdateAcceptingTerms:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager updateAcceptingTerms](self, "updateAcceptingTerms"));
  if (v6) {
    -[SUControllerScanManager scanLog:]( self,  "scanLog:",  @"[UPDATE-ACCEPTING-TERMS] replaced older update attempt info with most recent info");
  }
  -[SUControllerScanManager setUpdateAcceptingTerms:](self, "setUpdateAcceptingTerms:", v7);
  -[SUControllerScanManager setRampingForeground:](self, "setRampingForeground:", 1LL);
  -[SUControllerScanManager plantDowloadAndPrepareTrigger:]( self,  "plantDowloadAndPrepareTrigger:",  @"update accepting T&C");
}

- (void)removeAllDocumentationContent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002B3B8;
  v5[3] = &unk_1000652C8;
  v5[4] = self;
  +[SUCorePurge removeAllAssetsOfType:completion:]( &OBJC_CLASS___SUCorePurge,  "removeAllAssetsOfType:completion:",  kSUAssetTypeUpdateDocumentation,  v5);
}

- (void)issuePurgeCompletion
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager purgeCompletion](self, "purgeCompletion"));
  -[SUControllerScanManager setPurgeCompletion:](self, "setPurgeCompletion:", 0LL);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore"));
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 completionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002B558;
    block[3] = &unk_100064888;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

- (void)setRampingForeground:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (self->_rampingForeground != v3)
  {
    if (self->_rampingForegroundLatched
      && (id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanConfig](self, "scanConfig")),
          unsigned int v8 = [v7 ignoreRamping],
          v7,
          !v8))
    {
      id v9 = @"[SCAN_RAMP] attempt to change rampingForeground when already latched";
    }

    else
    {
      self->_rampingForeground = v3;
      -[SUControllerScanManager updateScanName](self, "updateScanName");
      id v9 = @"[SCAN_RAMP] altered rampingForeground";
    }

    -[SUControllerScanManager scanLog:](self, "scanLog:", v9);
  }

- (void)setRampingForegroundLatched:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (self->_rampingForegroundLatched != v3)
  {
    if (self->_rampingForegroundLatched
      && (id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanConfig](self, "scanConfig")),
          unsigned __int8 v8 = [v7 ignoreRamping],
          v7,
          (v8 & 1) == 0))
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue(+[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag"));
      [v9 trackAnomaly:@"[SCAN_RAMP]" forReason:@"rampingForegroundLatch should never un-latch" withResult:8117 withError:0];
    }

    else
    {
      self->_rampingForegroundLatched = v3;
      -[SUControllerScanManager updateScanName](self, "updateScanName");
      -[SUControllerScanManager scanLog:](self, "scanLog:", @"[SCAN_RAMP] altered rampingForegroundLatched");
    }
  }

- (void)setTriggerDownloadAndPrepare:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanFSM](self, "scanFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (self->_triggerDownloadAndPrepare != v3)
  {
    self->_triggerDownloadAndPrepare = v3;
    -[SUControllerScanManager updateScanName](self, "updateScanName");
    -[SUControllerScanManager scanLog:](self, "scanLog:", @"[SCAN_RAMP] altered triggerDownloadAndPrepare");
  }

- (void)scanLog:(id)a3
{
  id v4 = a3;
  id v5 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v4, &v19);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUID](self, "scanUUID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanLogCategory](self, "scanLogCategory"));
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanName](self, "scanName"));
      id v11 = (NSString *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUID](self, "scanUUID"));
      *(_DWORD *)buf = 138543874;
      unsigned __int8 v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      id v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@[%{public}@] %{public}@",  buf,  0x20u);
    }
  }

  else if (v9)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanName](self, "scanName"));
    *(_DWORD *)buf = 138543618;
    unsigned __int8 v14 = v12;
    __int16 v15 = 2114;
    uint64_t v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }
}

- (void)scanLogError:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v7, &v26);

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUID](self, "scanUUID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanLogCategory](self, "scanLogCategory"));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v9)
    {
      if (v12)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanName](self, "scanName"));
        unsigned __int8 v14 = (NSString *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanUUID](self, "scanUUID"));
        id v15 = +[SUControllerSUCore newSafeErrorDescription:]( &OBJC_CLASS___SUControllerSUCore,  "newSafeErrorDescription:",  v6);
        *(_DWORD *)buf = 138544130;
        uint64_t v19 = v13;
        __int16 v20 = 2114;
        v21 = v14;
        __int16 v22 = 2114;
        BOOL v23 = v8;
        __int16 v24 = 2114;
        id v25 = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}@[%{public}@] %{public}@ | error:%{public}@",  buf,  0x2Au);
      }
    }

    else if (v12)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManager scanName](self, "scanName"));
      __int16 v17 = +[SUControllerSUCore newSafeErrorDescription:]( &OBJC_CLASS___SUControllerSUCore,  "newSafeErrorDescription:",  v6);
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = v16;
      __int16 v20 = 2114;
      v21 = v8;
      __int16 v22 = 2114;
      BOOL v23 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}@ %{public}@ | error:%{public}@",  buf,  0x20u);
    }
  }

  else if (v9)
  {
    if (v12) {
      sub_10003E268(self, (uint64_t)v8, v11);
    }
  }

  else if (v12)
  {
    sub_10003E1BC(self, (uint64_t)v8, v11);
  }
}

- (void)updateScanName
{
  BOOL v3 = objc_alloc(&OBJC_CLASS___NSString);
  if (-[SUControllerScanManager rampingForeground](self, "rampingForeground")) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  if (-[SUControllerScanManager rampingForegroundLatched](self, "rampingForegroundLatched")) {
    id v5 = @"(Latched)";
  }
  else {
    id v5 = &stru_100066480;
  }
  if (-[SUControllerScanManager triggerDownloadAndPrepare](self, "triggerDownloadAndPrepare")) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  id v7 = -[NSString initWithFormat:](v3, "initWithFormat:", @"ScanManager[ramp Fg:%@%@, D&P:%@]", v4, v5, v6);
  -[SUControllerScanManager setScanName:](self, "setScanName:", v7);
}

- (id)summary
{
  return @"scanManager";
}

+ (id)allocScanPolicyUsingConfig:(id)a3 withScanUUID:(id)a4 rampingForeground:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if ([v7 supervisedMDM])
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___SUCorePolicyExtensionManagedUpdates);
    [v9 setSupervised:1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 requestedPMV]);
    [v9 setRequestedPMV:v10];

    objc_msgSend(v9, "setMDMUseDelayPeriod:", (uint64_t)objc_msgSend(v7, "delayPeriod") > 0);
    id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[NSMutableArray addObject:](v11, "addObject:", v9);
  }

  else
  {
    id v11 = 0LL;
    id v9 = 0LL;
  }

  BOOL v12 = objc_alloc(&OBJC_CLASS___SUCorePolicy);
  id v13 = -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:]( v12,  "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:",  kSUAssetTypeSoftwareUpdate,  kSUAssetTypeUpdateDocumentation,  127LL,  v11);
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateScanPolicy](v13, "softwareUpdateScanPolicy"));
  [v14 setAllowsCellular:1];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateScanPolicy](v13, "softwareUpdateScanPolicy"));
  [v15 setDiscretionary:0];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateScanPolicy](v13, "softwareUpdateScanPolicy"));
  [v16 setRequiresPowerPluggedIn:0];

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateScanPolicy](v13, "softwareUpdateScanPolicy"));
  [v17 setRestrictToIncremental:0];

  id v18 = [v7 restrictToFullReplacement];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateScanPolicy](v13, "softwareUpdateScanPolicy"));
  [v19 setRestrictToFull:v18];

  id v20 = [v7 allowSameVersionUpdates];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateScanPolicy](v13, "softwareUpdateScanPolicy"));
  [v21 setAllowSameVersion:v20];

  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateScanPolicy](v13, "softwareUpdateScanPolicy"));
  [v22 setDownloadTimeoutSecs:60];

  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateScanPolicy](v13, "softwareUpdateScanPolicy"));
  [v23 setSessionId:v8];

  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateScanPolicy](v13, "softwareUpdateScanPolicy"));
  [v24 setRampingScanType:0];

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateScanPolicy](v13, "softwareUpdateScanPolicy"));
  [v25 setAdditionalServerParams:0];

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateScanPolicy](v13, "softwareUpdateScanPolicy"));
  [v26 setAdditionalOptions:0];

  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy documentationScanPolicy](v13, "documentationScanPolicy"));
  [v27 setAllowsCellular:1];

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy documentationScanPolicy](v13, "documentationScanPolicy"));
  [v28 setDiscretionary:0];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy documentationScanPolicy](v13, "documentationScanPolicy"));
  [v29 setRequiresPowerPluggedIn:0];

  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy documentationScanPolicy](v13, "documentationScanPolicy"));
  [v30 setDownloadTimeoutSecs:120];

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy documentationScanPolicy](v13, "documentationScanPolicy"));
  [v31 setAdditionalOptions:0];

  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy documentationDownloadPolicy](v13, "documentationDownloadPolicy"));
  [v32 setAllowsCellular:1];

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy documentationDownloadPolicy](v13, "documentationDownloadPolicy"));
  [v33 setDiscretionary:0];

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy documentationDownloadPolicy](v13, "documentationDownloadPolicy"));
  [v34 setRequiresPowerPluggedIn:0];

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy documentationDownloadPolicy](v13, "documentationDownloadPolicy"));
  [v35 setRequiresInexpensiveAccess:0];

  id v36 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy documentationDownloadPolicy](v13, "documentationDownloadPolicy"));
  [v36 setAdditionalOptions:0];

  id v37 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
  LODWORD(v23) = [v37 isBootedOSSecureInternal];

  if ((_DWORD)v23)
  {
    unsigned __int8 v38 = (void *)objc_claimAutoreleasedReturnValue([v7 prerequisiteBuildVersion]);

    if (v38)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue([v7 prerequisiteBuildVersion]);
      -[SUCorePolicy setPrerequisiteBuildVersion:](v13, "setPrerequisiteBuildVersion:", v39);
    }

    id v40 = (void *)objc_claimAutoreleasedReturnValue([v7 prerequisiteProductVersion]);

    if (v40)
    {
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v7 prerequisiteProductVersion]);
      -[SUCorePolicy setPrerequisiteProductVersion:](v13, "setPrerequisiteProductVersion:", v41);
    }

    id v42 = (void *)objc_claimAutoreleasedReturnValue([v7 asReleaseType]);

    if (v42)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue([v7 asReleaseType]);
      unsigned int v44 = [v43 isEqualToString:@"customer"];

      if (v44)
      {
        -[SUCorePolicy setReleaseType:](v13, "setReleaseType:", 0LL);
      }

      else
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue([v7 asReleaseType]);
        -[SUCorePolicy setReleaseType:](v13, "setReleaseType:", v45);
      }
    }
  }

  if (([v7 ignoreRamping] & 1) == 0)
  {
    if (v5) {
      v46 = (uint64_t *)&kSUCoreRampingScanTypeForeground;
    }
    else {
      v46 = (uint64_t *)&kSUCoreRampingScanTypeBackground;
    }
    uint64_t v47 = *v46;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicy softwareUpdateScanPolicy](v13, "softwareUpdateScanPolicy"));
    [v48 setRampingScanType:v47];
  }

  return v13;
}

- (NSString)scanName
{
  return self->_scanName;
}

- (void)setScanName:(id)a3
{
}

- (SUCoreLog)scanLogCategory
{
  return self->_scanLogCategory;
}

- (SUControllerAttachedClients)attachedClients
{
  return self->_attachedClients;
}

- (SUControllerConfig)scanConfig
{
  return self->_scanConfig;
}

- (void)setScanConfig:(id)a3
{
}

- (SUControllerPolicyEngine)policyEngine
{
  return self->_policyEngine;
}

- (SUCorePolicy)scanPolicy
{
  return self->_scanPolicy;
}

- (void)setScanPolicy:(id)a3
{
}

- (SUCoreScan)scanner
{
  return self->_scanner;
}

- (void)setScanner:(id)a3
{
}

- (BOOL)rampingForeground
{
  return self->_rampingForeground;
}

- (BOOL)rampingForegroundLatched
{
  return self->_rampingForegroundLatched;
}

- (BOOL)triggerDownloadAndPrepare
{
  return self->_triggerDownloadAndPrepare;
}

- (SUControllerScanOptions)scanOptions
{
  return self->_scanOptions;
}

- (void)setScanOptions:(id)a3
{
}

- (SUCoreDescriptor)latestFoundPrimary
{
  return self->_latestFoundPrimary;
}

- (void)setLatestFoundPrimary:(id)a3
{
}

- (SUCoreDescriptor)latestFoundSecondary
{
  return self->_latestFoundSecondary;
}

- (void)setLatestFoundSecondary:(id)a3
{
}

- (SUCorePolicy)newerScanPolicy
{
  return self->_newerScanPolicy;
}

- (void)setNewerScanPolicy:(id)a3
{
}

- (SUCoreDescriptor)newerFoundPrimary
{
  return self->_newerFoundPrimary;
}

- (void)setNewerFoundPrimary:(id)a3
{
}

- (SUCoreDescriptor)newerFoundSecondary
{
  return self->_newerFoundSecondary;
}

- (void)setNewerFoundSecondary:(id)a3
{
}

- (NSString)scanUUIDBasePortion
{
  return self->_scanUUIDBasePortion;
}

- (void)setScanUUIDBasePortion:(id)a3
{
}

- (NSString)scanUUID
{
  return self->_scanUUID;
}

- (void)setScanUUID:(id)a3
{
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (SUCoreFSM)scanFSM
{
  return self->_scanFSM;
}

- (void)setScanFSM:(id)a3
{
}

- (id)purgeCompletion
{
  return self->_purgeCompletion;
}

- (void)setPurgeCompletion:(id)a3
{
}

- (SUControllerScanManagerParam)updateAcceptingTerms
{
  return self->_updateAcceptingTerms;
}

- (void)setUpdateAcceptingTerms:(id)a3
{
}

- (void).cxx_destruct
{
}

@end