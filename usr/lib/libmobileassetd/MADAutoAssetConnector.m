@interface MADAutoAssetConnector
+ (id)_getAutoAssetConnectorStateTable;
+ (id)autoAssetConnector;
+ (id)backoffRetryLevelDefaultTimes;
+ (void)alteredMonitoringMarkers:(id)a3 withTriggeredNoRetry:(id)a4 withTriggeredRequiringRetry:(id)a5;
+ (void)observedNetworkPathToServerDown:(id)a3;
+ (void)observedNetworkPathToServerUp:(id)a3;
+ (void)resumeMonitoringMarkers:(id)a3 withMarkersRequiringRetry:(id)a4;
+ (void)scheduledMarkerFinished:(id)a3 withPotentialNetworkFailure:(BOOL)a4;
+ (void)simulateNetworkPathDown:(id)a3;
+ (void)simulateNetworkPathUp:(id)a3;
- (BOOL)_isAnyServerUpForJobsToBeAttempted:(id)a3;
- (BOOL)_isBackoffRetryRequired:(id)a3;
- (BOOL)_isMarker:(id)a3 trackedByArray:(id)a4;
- (BOOL)_isMarkerBeingMonitored:(id)a3;
- (BOOL)_isPathToServerForMarkerUp:(id)a3;
- (BOOL)_triggerNextMarker;
- (MADAutoAssetConnector)init;
- (MADMarker)activeJobMarker;
- (NSDictionary)stateTable;
- (NSMutableArray)currentAttemptRemainingMarkers;
- (NSMutableArray)markersRequiringRetry;
- (NSMutableArray)monitorMarkers;
- (NSMutableArray)triggeredMarkersNoRetry;
- (NSMutableArray)triggeredMarkersRequiringRetry;
- (NSMutableDictionary)catalogServerNetworkPathObservers;
- (NSMutableDictionary)catalogServerNetworkPathStatus;
- (NSString)latestSafeSummary;
- (NSTimer)backoffRetryTimer;
- (NSTimer)initialWaitTimer;
- (NSTimer)waitBeforeRetryTimer;
- (SUCoreFSM)autoConnectorFSM;
- (SUCoreLog)logger;
- (id)_followupInUseServerStatus:(id)a3;
- (id)_startTimer:(id)a3 ofTimerCategory:(id)a4 forOneShotSecs:(int64_t)a5 withFiredMessage:(id)a6 postingEvent:(id)a7;
- (id)_updateLatestSummary;
- (id)summary;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)action_AlteredJobsDecidePreemptBackoff:(id)a3 error:(id *)a4;
- (int64_t)action_AlteredJobsDecideStillActiveJob:(id)a3 error:(id *)a4;
- (int64_t)action_AlteredJobsReplaceDecideHaveJobs:(id)a3 error:(id *)a4;
- (int64_t)action_DecideServerApplicableToJobs:(id)a3 error:(id *)a4;
- (int64_t)action_FiredBackoffDecideServerApplicableToJobs:(id)a3 error:(id *)a4;
- (int64_t)action_FiredBackoffIgnored:(id)a3 error:(id *)a4;
- (int64_t)action_FiredInitial:(id)a3 error:(id *)a4;
- (int64_t)action_FiredInitialDecideServerApplicableToJobs:(id)a3 error:(id *)a4;
- (int64_t)action_FiredRetryWait:(id)a3 error:(id *)a4;
- (int64_t)action_FiredRetryWaitIgnored:(id)a3 error:(id *)a4;
- (int64_t)action_FiredRetryWaitOrderAttemptFirstJobActive:(id)a3 error:(id *)a4;
- (int64_t)action_JobFinishedDecideHaveJobs:(id)a3 error:(id *)a4;
- (int64_t)action_JobFinishedDecideStillActiveJob:(id)a3 error:(id *)a4;
- (int64_t)action_NextScheduledJobNowActive:(id)a3 error:(id *)a4;
- (int64_t)action_OrderAttemptFirstJobActive:(id)a3 error:(id *)a4;
- (int64_t)action_ResumeDecideRequiringRetry:(id)a3 error:(id *)a4;
- (int64_t)action_StartBackoffAndRetryWaitTimers:(id)a3 error:(id *)a4;
- (int64_t)action_StartInitialWaitTimer:(id)a3 error:(id *)a4;
- (int64_t)action_StartupAlteredJobsReplaceDecideHaveJobs:(id)a3 error:(id *)a4;
- (int64_t)action_StopBackoffOrderAttemptFirstJobActive:(id)a3 error:(id *)a4;
- (int64_t)action_StopBackoffTimer:(id)a3 error:(id *)a4;
- (int64_t)action_TrackServerDown:(id)a3 error:(id *)a4;
- (int64_t)action_TrackServerDownDecideApplicableToJobs:(id)a3 error:(id *)a4;
- (int64_t)action_TrackServerDownDecideInUseActiveJob:(id)a3 error:(id *)a4;
- (int64_t)action_TrackServerUp:(id)a3 error:(id *)a4;
- (int64_t)action_TrackServerUpDecideApplicableToJobs:(id)a3 error:(id *)a4;
- (int64_t)action_TrackServerUpDecideInUseActiveJob:(id)a3 error:(id *)a4;
- (int64_t)backoffRetryLevel;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (void)_addObserverForMarker:(id)a3;
- (void)_adoptAlteredMarkers:(id)a3;
- (void)_chooseOrderForNextAttemptAndStartFirstJob:(id)a3;
- (void)_firedTimer:(id)a3 ofTimerCategory:(id)a4;
- (void)_issueFollowupApplicableServersUpDown:(id)a3;
- (void)_issueFollowupWhetherHaveJobs:(id)a3 notifyingWhenNoJobs:(BOOL)a4;
- (void)_logClearedActiveJobAndAttemptRemainingMarkers:(id)a3;
- (void)_logClearedActiveJobMarker:(id)a3;
- (void)_logClearedAttemptRemainingMarkers:(id)a3;
- (void)_logCurrentAttemptRemainingMarkers:(id)a3;
- (void)_logMarkerRequiringRetry:(id)a3 addedMarker:(id)a4;
- (void)_logMarkerRequiringRetry:(id)a3 removedMarker:(id)a4;
- (void)_logMarkersBeingMonitored:(id)a3;
- (void)_logMarkersRequiringRetry:(id)a3;
- (void)_logNextActiveJobForAttemptRemainingMarkers:(id)a3;
- (void)_logTriggeredMarkerNoRetry:(id)a3 addedMarker:(id)a4;
- (void)_logTriggeredMarkerNoRetry:(id)a3 removedMarker:(id)a4;
- (void)_logTriggeredMarkerRequiringRetry:(id)a3 addedMarker:(id)a4;
- (void)_logTriggeredMarkerRequiringRetry:(id)a3 removedMarker:(id)a4;
- (void)_logTriggeredMarkersCleared:(id)a3;
- (void)_logTriggeredMarkersNoRetry:(id)a3;
- (void)_logTriggeredMarkersRequiringRetry:(id)a3;
- (void)_refreshTrackingOfFinishedMarker:(id)a3 withPotentialNetworkFailure:(BOOL)a4;
- (void)_removeObserverForMarker:(id)a3;
- (void)_setBackoffRetryLevel:(int64_t)a3 forReason:(id)a4;
- (void)_stoppedTimer:(id)a3 ofTimerCategory:(id)a4;
- (void)_trackServerDown:(id)a3 fromLocation:(id)a4;
- (void)_trackServerUp:(id)a3 fromLocation:(id)a4;
- (void)init;
- (void)setActiveJobMarker:(id)a3;
- (void)setAutoConnectorFSM:(id)a3;
- (void)setBackoffRetryLevel:(int64_t)a3;
- (void)setBackoffRetryTimer:(id)a3;
- (void)setCatalogServerNetworkPathObservers:(id)a3;
- (void)setCatalogServerNetworkPathStatus:(id)a3;
- (void)setCurrentAttemptRemainingMarkers:(id)a3;
- (void)setInitialWaitTimer:(id)a3;
- (void)setLatestSafeSummary:(id)a3;
- (void)setMarkersRequiringRetry:(id)a3;
- (void)setMonitorMarkers:(id)a3;
- (void)setTriggeredMarkersNoRetry:(id)a3;
- (void)setTriggeredMarkersRequiringRetry:(id)a3;
- (void)setWaitBeforeRetryTimer:(id)a3;
@end

@implementation MADAutoAssetConnector

+ (id)_getAutoAssetConnectorStateTable
{
  v423[0] = @"ReadyToResume";
  v421[0] = @"ResumeMonitoringMarkers";
  uint64_t v2 = kSUCoreActionKey;
  uint64_t v419 = kSUCoreActionKey;
  v420 = @"ResumeDecideRequiringRetry";
  v146 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v420,  &v419,  1LL));
  v422[0] = v146;
  v421[1] = @"ResumeNothingRequiringRetry";
  uint64_t v3 = kSUCoreNextStateKey;
  v417[0] = kSUCoreNextStateKey;
  v417[1] = v2;
  v418[0] = @"IdleStartup";
  v418[1] = @"StartInitialWaitTimer";
  v145 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v418,  v417,  2LL));
  v422[1] = v145;
  v421[2] = @"ResumeHaveJobsRequiringRetry";
  v415[0] = v3;
  v415[1] = v2;
  v416[0] = @"DetermineConnectivityStartup";
  v416[1] = @"StartInitialWaitTimer";
  v144 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v416,  v415,  2LL));
  v422[2] = v144;
  v143 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v422,  v421,  3LL));
  v424[0] = v143;
  v423[1] = @"IdleStartup";
  v413[0] = @"AlteredTriggeredMarkers";
  uint64_t v411 = v2;
  v412 = @"StartupAlteredJobsReplaceDecideHaveJobs";
  v142 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v412,  &v411,  1LL));
  v414[0] = v142;
  v413[1] = @"JobFinishedForMarker";
  uint64_t v409 = v2;
  uint64_t v4 = kSUCoreFSMActionNoOp;
  uint64_t v410 = kSUCoreFSMActionNoOp;
  v141 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v410,  &v409,  1LL));
  v414[1] = v141;
  v413[2] = @"NetworkPathToServerUp";
  uint64_t v407 = v2;
  v408 = @"TrackServerUp";
  v140 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v408,  &v407,  1LL));
  v414[2] = v140;
  v413[3] = @"NetworkPathToServerDown";
  uint64_t v405 = v2;
  v406 = @"TrackServerDown";
  v139 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v406,  &v405,  1LL));
  v414[3] = v139;
  v413[4] = @"TimeoutInitialStartup";
  v403[0] = v3;
  v403[1] = v2;
  v404[0] = @"Idle";
  v404[1] = @"FiredInitial";
  v138 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v404,  v403,  2LL));
  v414[4] = v138;
  v413[5] = @"AttemptAbandoned";
  uint64_t v401 = v2;
  uint64_t v402 = v4;
  v137 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v402,  &v401,  1LL));
  v414[5] = v137;
  v413[6] = @"AlteredHaveJobs";
  uint64_t v399 = v3;
  v400 = @"DetermineConnectivityStartup";
  v136 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v400,  &v399,  1LL));
  v414[6] = v136;
  v413[7] = @"AlteredNoJobs";
  uint64_t v397 = v2;
  uint64_t v398 = v4;
  v135 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v398,  &v397,  1LL));
  v414[7] = v135;
  v134 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v414,  v413,  8LL));
  v424[1] = v134;
  v423[2] = @"DetermineConnectivityStartup";
  v395[0] = @"AlteredTriggeredMarkers";
  uint64_t v393 = v2;
  v394 = @"StartupAlteredJobsReplaceDecideHaveJobs";
  v133 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v394,  &v393,  1LL));
  v396[0] = v133;
  v395[1] = @"JobFinishedForMarker";
  uint64_t v391 = v2;
  v392 = @"JobFinishedDecideHaveJobs";
  v132 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v392,  &v391,  1LL));
  v396[1] = v132;
  v395[2] = @"NetworkPathToServerUp";
  uint64_t v389 = v2;
  v390 = @"TrackServerUp";
  v131 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v390,  &v389,  1LL));
  v396[2] = v131;
  v395[3] = @"NetworkPathToServerDown";
  uint64_t v387 = v2;
  v388 = @"TrackServerDown";
  v130 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v388,  &v387,  1LL));
  v396[3] = v130;
  v395[4] = @"TimeoutInitialStartup";
  uint64_t v385 = v2;
  v386 = @"FiredInitialDecideServerApplicableToJobs";
  v129 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v386,  &v385,  1LL));
  v396[4] = v129;
  v395[5] = @"AttemptAbandoned";
  uint64_t v383 = v2;
  uint64_t v384 = v4;
  v128 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v384,  &v383,  1LL));
  v396[5] = v128;
  v395[6] = @"AlteredHaveJobs";
  uint64_t v381 = v2;
  uint64_t v382 = v4;
  v127 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v382,  &v381,  1LL));
  v396[6] = v127;
  v395[7] = @"AlteredNoJobs";
  uint64_t v379 = v3;
  v380 = @"IdleStartup";
  v126 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v380,  &v379,  1LL));
  v396[7] = v126;
  v395[8] = @"ApplicableServersUp";
  v377[0] = v3;
  v377[1] = v2;
  v378[0] = @"ConnectedActiveJob";
  v378[1] = @"OrderAttemptFirstJobActive";
  v125 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v378,  v377,  2LL));
  v396[8] = v125;
  v395[9] = @"ApplicableServersDown";
  v375[0] = v3;
  v375[1] = v2;
  v376[0] = @"DisconnectedActiveJob";
  v376[1] = @"OrderAttemptFirstJobActive";
  v124 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v376,  v375,  2LL));
  v396[9] = v124;
  v123 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v396,  v395,  10LL));
  v424[2] = v123;
  v423[3] = @"Idle";
  v373[0] = @"AlteredTriggeredMarkers";
  uint64_t v371 = v2;
  v372 = @"AlteredJobsReplaceDecideHaveJobs";
  v122 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v372,  &v371,  1LL));
  v374[0] = v122;
  v373[1] = @"JobFinishedForMarker";
  uint64_t v369 = v2;
  uint64_t v370 = v4;
  v121 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v370,  &v369,  1LL));
  v374[1] = v121;
  v373[2] = @"NetworkPathToServerUp";
  uint64_t v367 = v2;
  v368 = @"TrackServerUp";
  v120 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v368,  &v367,  1LL));
  v374[2] = v120;
  v373[3] = @"NetworkPathToServerDown";
  uint64_t v365 = v2;
  v366 = @"TrackServerDown";
  v119 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v366,  &v365,  1LL));
  v374[3] = v119;
  v373[4] = @"TimeoutRetryWait";
  uint64_t v363 = v2;
  v364 = @"FiredRetryWaitIgnored";
  v118 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v364,  &v363,  1LL));
  v374[4] = v118;
  v373[5] = @"TimeoutBackoffRetry";
  uint64_t v361 = v2;
  v362 = @"FiredBackoffIgnored";
  v117 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v362,  &v361,  1LL));
  v374[5] = v117;
  v373[6] = @"AttemptAbandoned";
  uint64_t v359 = v2;
  uint64_t v360 = v4;
  v116 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v360,  &v359,  1LL));
  v374[6] = v116;
  v373[7] = @"AlteredHaveJobs";
  uint64_t v357 = v2;
  v358 = @"DecideServerApplicableToJobs";
  v115 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v358,  &v357,  1LL));
  v374[7] = v115;
  v373[8] = @"AlteredNoJobs";
  uint64_t v355 = v2;
  uint64_t v356 = v4;
  v114 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v356,  &v355,  1LL));
  v374[8] = v114;
  v373[9] = @"ApplicableServersUp";
  v353[0] = v3;
  v353[1] = v2;
  v354[0] = @"ConnectedActiveJob";
  v354[1] = @"OrderAttemptFirstJobActive";
  v113 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v354,  v353,  2LL));
  v374[9] = v113;
  v373[10] = @"ApplicableServersDown";
  v351[0] = v3;
  v351[1] = v2;
  v352[0] = @"DisconnectedActiveJob";
  v352[1] = @"OrderAttemptFirstJobActive";
  v112 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v352,  v351,  2LL));
  v374[10] = v112;
  v111 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v374,  v373,  11LL));
  v424[3] = v111;
  v423[4] = @"DisconnectedActiveJob";
  v349[0] = @"AlteredTriggeredMarkers";
  uint64_t v347 = v2;
  v348 = @"AlteredJobsDecideStillActiveJob";
  v110 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v348,  &v347,  1LL));
  v350[0] = v110;
  v349[1] = @"JobFinishedForMarker";
  uint64_t v345 = v2;
  v346 = @"JobFinishedDecideStillActiveJob";
  v109 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v346,  &v345,  1LL));
  v350[1] = v109;
  v349[2] = @"NetworkPathToServerUp";
  uint64_t v343 = v2;
  v344 = @"TrackServerUpDecideInUseActiveJob";
  v108 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v344,  &v343,  1LL));
  v350[2] = v108;
  v349[3] = @"NetworkPathToServerDown";
  uint64_t v341 = v2;
  v342 = @"TrackServerDown";
  v107 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v342,  &v341,  1LL));
  v350[3] = v107;
  v349[4] = @"TimeoutRetryWait";
  uint64_t v339 = v2;
  v340 = @"FiredRetryWaitIgnored";
  v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v340,  &v339,  1LL));
  v350[4] = v106;
  v349[5] = @"TimeoutBackoffRetry";
  uint64_t v337 = v2;
  v338 = @"FiredBackoffIgnored";
  v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v338,  &v337,  1LL));
  v350[5] = v105;
  v349[6] = @"AttemptAbandoned";
  v335[0] = v3;
  v335[1] = v2;
  v336[0] = @"BackoffWait";
  v336[1] = @"StartBackoffAndRetryWaitTimers";
  v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v336,  v335,  2LL));
  v350[6] = v104;
  v349[7] = @"AlteredStillActiveJob";
  uint64_t v333 = v2;
  uint64_t v334 = v4;
  v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v334,  &v333,  1LL));
  v350[7] = v103;
  v349[8] = @"AlteredActiveGoneConnected";
  v331[0] = v3;
  v331[1] = v2;
  v332[0] = @"ConnectedActiveJob";
  v332[1] = @"NextScheduledJobNowActive";
  v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v332,  v331,  2LL));
  v350[8] = v102;
  v349[9] = @"AlteredActiveGoneDisconnected";
  uint64_t v329 = v2;
  v330 = @"NextScheduledJobNowActive";
  v101 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v330,  &v329,  1LL));
  v350[9] = v101;
  v349[10] = @"AlteredAttemptDoneNoJobs";
  uint64_t v327 = v3;
  v328 = @"Idle";
  v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v328,  &v327,  1LL));
  v350[10] = v100;
  v349[11] = @"AlteredAttemptDoneBackoff";
  v325[0] = v3;
  v325[1] = v2;
  v326[0] = @"BackoffWait";
  v326[1] = @"StartBackoffAndRetryWaitTimers";
  v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v326,  v325,  2LL));
  v350[11] = v99;
  v349[12] = @"JobFinishedNextConnected";
  v323[0] = v3;
  v323[1] = v2;
  v324[0] = @"ConnectedActiveJob";
  v324[1] = @"NextScheduledJobNowActive";
  v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v324,  v323,  2LL));
  v350[12] = v98;
  v349[13] = @"JobFinishedNextDisconnected";
  uint64_t v321 = v2;
  v322 = @"NextScheduledJobNowActive";
  v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v322,  &v321,  1LL));
  v350[13] = v97;
  v349[14] = @"JobFinishedAttemptDoneNoJobs";
  uint64_t v319 = v3;
  v320 = @"Idle";
  v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v320,  &v319,  1LL));
  v350[14] = v96;
  v349[15] = @"JobFinishedAttemptDoneBackoff";
  v317[0] = v3;
  v317[1] = v2;
  v318[0] = @"BackoffWait";
  v318[1] = @"StartBackoffAndRetryWaitTimers";
  v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v318,  v317,  2LL));
  v350[15] = v95;
  v349[16] = @"InUseServerUp";
  uint64_t v315 = v3;
  v316 = @"ConnectedActiveJob";
  v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v316,  &v315,  1LL));
  v350[16] = v94;
  v349[17] = @"InUseServerDown";
  uint64_t v313 = v2;
  uint64_t v314 = v4;
  v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v314,  &v313,  1LL));
  v350[17] = v93;
  v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v350,  v349,  18LL));
  v424[4] = v92;
  v423[5] = @"ConnectedActiveJob";
  v311[0] = @"AlteredTriggeredMarkers";
  uint64_t v309 = v2;
  v310 = @"AlteredJobsDecideStillActiveJob";
  v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v310,  &v309,  1LL));
  v312[0] = v91;
  v311[1] = @"JobFinishedForMarker";
  uint64_t v307 = v2;
  v308 = @"JobFinishedDecideStillActiveJob";
  v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v308,  &v307,  1LL));
  v312[1] = v90;
  v311[2] = @"NetworkPathToServerUp";
  uint64_t v305 = v2;
  v306 = @"TrackServerUp";
  v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v306,  &v305,  1LL));
  v312[2] = v89;
  v311[3] = @"NetworkPathToServerDown";
  uint64_t v303 = v2;
  v304 = @"TrackServerDownDecideInUseActiveJob";
  v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v304,  &v303,  1LL));
  v312[3] = v88;
  v311[4] = @"TimeoutRetryWait";
  uint64_t v301 = v2;
  v302 = @"FiredRetryWaitIgnored";
  v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v302,  &v301,  1LL));
  v312[4] = v87;
  v311[5] = @"TimeoutBackoffRetry";
  uint64_t v299 = v2;
  v300 = @"FiredBackoffIgnored";
  v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v300,  &v299,  1LL));
  v312[5] = v86;
  v311[6] = @"AttemptAbandoned";
  v297[0] = v3;
  v297[1] = v2;
  v298[0] = @"BackoffWait";
  v298[1] = @"StartBackoffAndRetryWaitTimers";
  v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v298,  v297,  2LL));
  v312[6] = v85;
  v311[7] = @"AlteredStillActiveJob";
  uint64_t v295 = v2;
  uint64_t v296 = v4;
  v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v296,  &v295,  1LL));
  v312[7] = v84;
  v311[8] = @"AlteredActiveGoneConnected";
  uint64_t v293 = v2;
  v294 = @"NextScheduledJobNowActive";
  v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v294,  &v293,  1LL));
  v312[8] = v83;
  v311[9] = @"AlteredActiveGoneDisconnected";
  v291[0] = v3;
  v291[1] = v2;
  v292[0] = @"DisconnectedActiveJob";
  v292[1] = @"NextScheduledJobNowActive";
  v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v292,  v291,  2LL));
  v312[9] = v82;
  v311[10] = @"AlteredAttemptDoneNoJobs";
  uint64_t v289 = v3;
  v290 = @"Idle";
  v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v290,  &v289,  1LL));
  v312[10] = v81;
  v311[11] = @"AlteredAttemptDoneBackoff";
  v287[0] = v3;
  v287[1] = v2;
  v288[0] = @"BackoffWait";
  v288[1] = @"StartBackoffAndRetryWaitTimers";
  v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v288,  v287,  2LL));
  v312[11] = v80;
  v311[12] = @"JobFinishedNextConnected";
  uint64_t v285 = v2;
  v286 = @"NextScheduledJobNowActive";
  v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v286,  &v285,  1LL));
  v312[12] = v79;
  v311[13] = @"JobFinishedNextDisconnected";
  v283[0] = v3;
  v283[1] = v2;
  v284[0] = @"DisconnectedActiveJob";
  v284[1] = @"NextScheduledJobNowActive";
  v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v284,  v283,  2LL));
  v312[13] = v78;
  v311[14] = @"JobFinishedAttemptDoneNoJobs";
  uint64_t v281 = v3;
  v282 = @"Idle";
  v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v282,  &v281,  1LL));
  v312[14] = v77;
  v311[15] = @"JobFinishedAttemptDoneBackoff";
  v279[0] = v3;
  v279[1] = v2;
  v280[0] = @"BackoffWait";
  v280[1] = @"StartBackoffAndRetryWaitTimers";
  v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v280,  v279,  2LL));
  v312[15] = v76;
  v311[16] = @"InUseServerUp";
  uint64_t v277 = v2;
  uint64_t v278 = v4;
  v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v278,  &v277,  1LL));
  v312[16] = v75;
  v311[17] = @"InUseServerDown";
  uint64_t v275 = v3;
  v276 = @"DisconnectedActiveJob";
  v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v276,  &v275,  1LL));
  v312[17] = v74;
  v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v312,  v311,  18LL));
  v424[5] = v73;
  v423[6] = @"BackoffWait";
  v273[0] = @"AlteredTriggeredMarkers";
  uint64_t v271 = v2;
  v272 = @"AlteredJobsDecidePreemptBackoff";
  v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v272,  &v271,  1LL));
  v274[0] = v72;
  v273[1] = @"JobFinishedForMarker";
  uint64_t v269 = v2;
  v270 = @"JobFinishedDecideHaveJobs";
  v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v270,  &v269,  1LL));
  v274[1] = v71;
  v273[2] = @"NetworkPathToServerUp";
  uint64_t v267 = v2;
  v268 = @"TrackServerUpDecideApplicableToJobs";
  v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v268,  &v267,  1LL));
  v274[2] = v70;
  v273[3] = @"NetworkPathToServerDown";
  uint64_t v265 = v2;
  v266 = @"TrackServerDown";
  v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v266,  &v265,  1LL));
  v274[3] = v69;
  v273[4] = @"TimeoutRetryWait";
  v263[0] = v3;
  v263[1] = v2;
  v264[0] = @"Backoff";
  v264[1] = @"FiredRetryWait";
  v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v264,  v263,  2LL));
  v274[4] = v68;
  v273[5] = @"TimeoutBackoffRetry";
  uint64_t v261 = v2;
  v262 = @"FiredBackoffDecideServerApplicableToJobs";
  v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v262,  &v261,  1LL));
  v274[5] = v67;
  v273[6] = @"AttemptAbandoned";
  uint64_t v259 = v2;
  uint64_t v260 = v4;
  v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v260,  &v259,  1LL));
  v274[6] = v66;
  v273[7] = @"AlteredPreemptConnected";
  v257[0] = v3;
  v257[1] = v2;
  v258[0] = @"RetryConnectedWait";
  v258[1] = @"StopBackoffTimer";
  v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v258,  v257,  2LL));
  v274[7] = v65;
  v273[8] = @"AlteredPreemptDisconnected";
  uint64_t v255 = v2;
  uint64_t v256 = v4;
  v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v256,  &v255,  1LL));
  v274[8] = v64;
  v273[9] = @"AlteredHaveJobs";
  uint64_t v253 = v2;
  uint64_t v254 = v4;
  v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v254,  &v253,  1LL));
  v274[9] = v63;
  v273[10] = @"AlteredNoJobs";
  v251[0] = v3;
  v251[1] = v2;
  v252[0] = @"IdleWait";
  v252[1] = @"StopBackoffTimer";
  v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v252,  v251,  2LL));
  v274[10] = v62;
  v273[11] = @"ApplicableServersUp";
  v249[0] = v3;
  v249[1] = v2;
  v250[0] = @"RetryConnectedWait";
  v250[1] = @"StopBackoffTimer";
  v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v250,  v249,  2LL));
  v274[11] = v61;
  v273[12] = @"ApplicableServersDown";
  uint64_t v247 = v2;
  uint64_t v248 = v4;
  v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v248,  &v247,  1LL));
  v274[12] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v274,  v273,  13LL));
  v424[6] = v59;
  v423[7] = @"IdleWait";
  v245[0] = @"AlteredTriggeredMarkers";
  uint64_t v243 = v2;
  v244 = @"AlteredJobsReplaceDecideHaveJobs";
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v244,  &v243,  1LL));
  v246[0] = v58;
  v245[1] = @"JobFinishedForMarker";
  uint64_t v241 = v2;
  v242 = @"JobFinishedDecideHaveJobs";
  v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v242,  &v241,  1LL));
  v246[1] = v57;
  v245[2] = @"NetworkPathToServerUp";
  uint64_t v239 = v2;
  v240 = @"TrackServerUp";
  v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v240,  &v239,  1LL));
  v246[2] = v56;
  v245[3] = @"NetworkPathToServerDown";
  uint64_t v237 = v2;
  v238 = @"TrackServerDown";
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v238,  &v237,  1LL));
  v246[3] = v55;
  v245[4] = @"TimeoutRetryWait";
  v235[0] = v3;
  v235[1] = v2;
  v236[0] = @"Idle";
  v236[1] = @"FiredRetryWait";
  v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v236,  v235,  2LL));
  v246[4] = v54;
  v245[5] = @"TimeoutBackoffRetry";
  uint64_t v233 = v2;
  v234 = @"FiredBackoffIgnored";
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v234,  &v233,  1LL));
  v246[5] = v53;
  v245[6] = @"AttemptAbandoned";
  uint64_t v231 = v2;
  uint64_t v232 = v4;
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v232,  &v231,  1LL));
  v246[6] = v52;
  v245[7] = @"AlteredHaveJobs";
  uint64_t v229 = v2;
  v230 = @"DecideServerApplicableToJobs";
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v230,  &v229,  1LL));
  v246[7] = v51;
  v245[8] = @"AlteredNoJobs";
  uint64_t v227 = v2;
  uint64_t v228 = v4;
  v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v228,  &v227,  1LL));
  v246[8] = v50;
  v245[9] = @"ApplicableServersUp";
  uint64_t v225 = v3;
  v226 = @"RetryConnectedWait";
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v226,  &v225,  1LL));
  v246[9] = v49;
  v245[10] = @"ApplicableServersDown";
  uint64_t v223 = v3;
  v224 = @"RetryDisconnectedWait";
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v224,  &v223,  1LL));
  v246[10] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v246,  v245,  11LL));
  v424[7] = v47;
  v423[8] = @"RetryDisconnectedWait";
  v221[0] = @"AlteredTriggeredMarkers";
  uint64_t v219 = v2;
  v220 = @"AlteredJobsReplaceDecideHaveJobs";
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v220,  &v219,  1LL));
  v222[0] = v46;
  v221[1] = @"JobFinishedForMarker";
  uint64_t v217 = v2;
  v218 = @"JobFinishedDecideHaveJobs";
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v218,  &v217,  1LL));
  v222[1] = v45;
  v221[2] = @"NetworkPathToServerUp";
  uint64_t v215 = v2;
  v216 = @"TrackServerUpDecideApplicableToJobs";
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v216,  &v215,  1LL));
  v222[2] = v44;
  v221[3] = @"NetworkPathToServerDown";
  uint64_t v213 = v2;
  v214 = @"TrackServerDown";
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v214,  &v213,  1LL));
  v222[3] = v43;
  v221[4] = @"TimeoutRetryWait";
  v211[0] = v3;
  v211[1] = v2;
  v212[0] = @"DisconnectedActiveJob";
  v212[1] = @"FiredRetryWaitOrderAttemptFirstJobActive";
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v212,  v211,  2LL));
  v222[4] = v42;
  v221[5] = @"TimeoutBackoffRetry";
  uint64_t v209 = v2;
  v210 = @"FiredBackoffIgnored";
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v210,  &v209,  1LL));
  v222[5] = v41;
  v221[6] = @"AttemptAbandoned";
  uint64_t v207 = v2;
  uint64_t v208 = v4;
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v208,  &v207,  1LL));
  v222[6] = v40;
  v221[7] = @"AlteredHaveJobs";
  uint64_t v205 = v2;
  v206 = @"DecideServerApplicableToJobs";
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v206,  &v205,  1LL));
  v222[7] = v39;
  v221[8] = @"AlteredNoJobs";
  uint64_t v203 = v3;
  v204 = @"IdleWait";
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v204,  &v203,  1LL));
  v222[8] = v38;
  v221[9] = @"ApplicableServersUp";
  uint64_t v201 = v3;
  v202 = @"RetryConnectedWait";
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v202,  &v201,  1LL));
  v222[9] = v37;
  v221[10] = @"ApplicableServersDown";
  uint64_t v199 = v2;
  uint64_t v200 = v4;
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v200,  &v199,  1LL));
  v222[10] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v222,  v221,  11LL));
  v424[8] = v35;
  v423[9] = @"RetryConnectedWait";
  v197[0] = @"AlteredTriggeredMarkers";
  uint64_t v195 = v2;
  v196 = @"AlteredJobsReplaceDecideHaveJobs";
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v196,  &v195,  1LL));
  v198[0] = v34;
  v197[1] = @"JobFinishedForMarker";
  uint64_t v193 = v2;
  v194 = @"JobFinishedDecideHaveJobs";
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v194,  &v193,  1LL));
  v198[1] = v33;
  v197[2] = @"NetworkPathToServerUp";
  uint64_t v191 = v2;
  v192 = @"TrackServerUp";
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v192,  &v191,  1LL));
  v198[2] = v32;
  v197[3] = @"NetworkPathToServerDown";
  uint64_t v189 = v2;
  v190 = @"TrackServerDownDecideApplicableToJobs";
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v190,  &v189,  1LL));
  v198[3] = v31;
  v197[4] = @"TimeoutRetryWait";
  v187[0] = v3;
  v187[1] = v2;
  v188[0] = @"ConnectedActiveJob";
  v188[1] = @"FiredRetryWaitOrderAttemptFirstJobActive";
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v188,  v187,  2LL));
  v198[4] = v30;
  v197[5] = @"TimeoutBackoffRetry";
  uint64_t v185 = v2;
  v186 = @"FiredBackoffIgnored";
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v186,  &v185,  1LL));
  v198[5] = v29;
  v197[6] = @"AttemptAbandoned";
  uint64_t v183 = v2;
  uint64_t v184 = v4;
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v184,  &v183,  1LL));
  v198[6] = v28;
  v197[7] = @"AlteredHaveJobs";
  uint64_t v181 = v2;
  v182 = @"DecideServerApplicableToJobs";
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v182,  &v181,  1LL));
  v198[7] = v27;
  v197[8] = @"AlteredNoJobs";
  uint64_t v179 = v3;
  v180 = @"IdleWait";
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v180,  &v179,  1LL));
  v198[8] = v26;
  v197[9] = @"ApplicableServersUp";
  uint64_t v177 = v2;
  uint64_t v178 = v4;
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v178,  &v177,  1LL));
  v198[9] = v25;
  v197[10] = @"ApplicableServersDown";
  uint64_t v175 = v3;
  v176 = @"RetryDisconnectedWait";
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v176,  &v175,  1LL));
  v198[10] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v198,  v197,  11LL));
  v424[9] = v23;
  v423[10] = @"Backoff";
  v173[0] = @"AlteredTriggeredMarkers";
  uint64_t v171 = v2;
  v172 = @"AlteredJobsDecidePreemptBackoff";
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v172,  &v171,  1LL));
  v174[0] = v22;
  v173[1] = @"JobFinishedForMarker";
  uint64_t v169 = v2;
  v170 = @"JobFinishedDecideHaveJobs";
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v170,  &v169,  1LL));
  v174[1] = v21;
  v173[2] = @"NetworkPathToServerUp";
  uint64_t v167 = v2;
  v168 = @"TrackServerUpDecideApplicableToJobs";
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v168,  &v167,  1LL));
  v174[2] = v20;
  v173[3] = @"NetworkPathToServerDown";
  uint64_t v165 = v2;
  v166 = @"TrackServerDown";
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v166,  &v165,  1LL));
  v174[3] = v19;
  v173[4] = @"TimeoutRetryWait";
  uint64_t v163 = v2;
  v164 = @"FiredRetryWaitIgnored";
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v164,  &v163,  1LL));
  v174[4] = v18;
  v173[5] = @"TimeoutBackoffRetry";
  uint64_t v161 = v2;
  v162 = @"FiredBackoffDecideServerApplicableToJobs";
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v162,  &v161,  1LL));
  v174[5] = v17;
  v173[6] = @"AttemptAbandoned";
  uint64_t v159 = v2;
  uint64_t v160 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v160,  &v159,  1LL));
  v174[6] = v5;
  v173[7] = @"AlteredPreemptConnected";
  v157[0] = v3;
  v157[1] = v2;
  v158[0] = @"ConnectedActiveJob";
  v158[1] = @"StopBackoffOrderAttemptFirstJobActive";
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v158,  v157,  2LL));
  v174[7] = v6;
  v173[8] = @"AlteredPreemptDisconnected";
  v155[0] = v3;
  v155[1] = v2;
  v156[0] = @"DisconnectedActiveJob";
  v156[1] = @"StopBackoffOrderAttemptFirstJobActive";
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v156,  v155,  2LL));
  v174[8] = v7;
  v173[9] = @"AlteredHaveJobs";
  uint64_t v153 = v2;
  uint64_t v154 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v154,  &v153,  1LL));
  v174[9] = v8;
  v173[10] = @"AlteredNoJobs";
  v151[0] = v3;
  v151[1] = v2;
  v152[0] = @"Idle";
  v152[1] = @"StopBackoffTimer";
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v152,  v151,  2LL));
  v174[10] = v9;
  v173[11] = @"ApplicableServersUp";
  v149[0] = v3;
  v149[1] = v2;
  v150[0] = @"ConnectedActiveJob";
  v150[1] = @"OrderAttemptFirstJobActive";
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v150,  v149,  2LL));
  v174[11] = v10;
  v173[12] = @"ApplicableServersDown";
  v147[0] = v3;
  v147[1] = v2;
  v148[0] = @"DisconnectedActiveJob";
  v148[1] = @"OrderAttemptFirstJobActive";
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v148,  v147,  2LL));
  v174[12] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v174,  v173,  13LL));
  v424[10] = v12;
  uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v424,  v423,  11LL));

  v14 = (void *)v13;
  v15 = -[NSDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:copyItems:",  v13,  1LL);

  return v15;
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
    if ([v11 isEqualToString:@"ResumeDecideRequiringRetry"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_ResumeDecideRequiringRetry:error:]( self,  "action_ResumeDecideRequiringRetry:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"StartInitialWaitTimer"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_StartInitialWaitTimer:error:]( self,  "action_StartInitialWaitTimer:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"StartBackoffAndRetryWaitTimers"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_StartBackoffAndRetryWaitTimers:error:]( self,  "action_StartBackoffAndRetryWaitTimers:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"StopBackoffTimer"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_StopBackoffTimer:error:](self, "action_StopBackoffTimer:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"StopBackoffOrderAttemptFirstJobActive"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_StopBackoffOrderAttemptFirstJobActive:error:]( self,  "action_StopBackoffOrderAttemptFirstJobActive:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"FiredInitial"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_FiredInitial:error:](self, "action_FiredInitial:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"FiredInitialDecideServerApplicableToJobs"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_FiredInitialDecideServerApplicableToJobs:error:]( self,  "action_FiredInitialDecideServerApplicableToJobs:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"FiredRetryWaitIgnored"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_FiredRetryWaitIgnored:error:]( self,  "action_FiredRetryWaitIgnored:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"FiredBackoffIgnored"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_FiredBackoffIgnored:error:]( self,  "action_FiredBackoffIgnored:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"FiredRetryWait"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_FiredRetryWait:error:](self, "action_FiredRetryWait:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"FiredBackoffDecideServerApplicableToJobs"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_FiredBackoffDecideServerApplicableToJobs:error:]( self,  "action_FiredBackoffDecideServerApplicableToJobs:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"FiredRetryWaitOrderAttemptFirstJobActive"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_FiredRetryWaitOrderAttemptFirstJobActive:error:]( self,  "action_FiredRetryWaitOrderAttemptFirstJobActive:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"TrackServerUp"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_TrackServerUp:error:](self, "action_TrackServerUp:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"TrackServerDown"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_TrackServerDown:error:](self, "action_TrackServerDown:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"TrackServerUpDecideApplicableToJobs"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_TrackServerUpDecideApplicableToJobs:error:]( self,  "action_TrackServerUpDecideApplicableToJobs:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"TrackServerDownDecideApplicableToJobs"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_TrackServerDownDecideApplicableToJobs:error:]( self,  "action_TrackServerDownDecideApplicableToJobs:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"TrackServerUpDecideInUseActiveJob"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_TrackServerUpDecideInUseActiveJob:error:]( self,  "action_TrackServerUpDecideInUseActiveJob:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"TrackServerDownDecideInUseActiveJob"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_TrackServerDownDecideInUseActiveJob:error:]( self,  "action_TrackServerDownDecideInUseActiveJob:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"StartupAlteredJobsReplaceDecideHaveJobs"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_StartupAlteredJobsReplaceDecideHaveJobs:error:]( self,  "action_StartupAlteredJobsReplaceDecideHaveJobs:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"AlteredJobsReplaceDecideHaveJobs"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_AlteredJobsReplaceDecideHaveJobs:error:]( self,  "action_AlteredJobsReplaceDecideHaveJobs:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"AlteredJobsDecideStillActiveJob"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_AlteredJobsDecideStillActiveJob:error:]( self,  "action_AlteredJobsDecideStillActiveJob:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"AlteredJobsDecidePreemptBackoff"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_AlteredJobsDecidePreemptBackoff:error:]( self,  "action_AlteredJobsDecidePreemptBackoff:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"DecideServerApplicableToJobs"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_DecideServerApplicableToJobs:error:]( self,  "action_DecideServerApplicableToJobs:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"OrderAttemptFirstJobActive"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_OrderAttemptFirstJobActive:error:]( self,  "action_OrderAttemptFirstJobActive:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"NextScheduledJobNowActive"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_NextScheduledJobNowActive:error:]( self,  "action_NextScheduledJobNowActive:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"JobFinishedDecideHaveJobs"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_JobFinishedDecideHaveJobs:error:]( self,  "action_JobFinishedDecideHaveJobs:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"JobFinishedDecideStillActiveJob"])
    {
      int64_t v14 = -[MADAutoAssetConnector action_JobFinishedDecideStillActiveJob:error:]( self,  "action_JobFinishedDecideStillActiveJob:error:",  v12,  a8);
    }

    else
    {
      int64_t v14 = -[MADAutoAssetConnector actionUnknownAction:error:](self, "actionUnknownAction:error:", v11, a8);
    }

    int64_t v13 = v14;
  }

  return v13;
}

- (MADAutoAssetConnector)init
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___MADAutoAssetConnector;
  uint64_t v2 = -[MADAutoAssetConnector init](&v31, "init");
  if (v2)
  {
    uint64_t v3 = -[SUCoreLog initWithCategory:]( objc_alloc(&OBJC_CLASS___SUCoreLog),  "initWithCategory:",  @"AUTO-CONNECTOR");
    logger = v2->_logger;
    v2->_logger = v3;

    id v5 = [(id)objc_opt_class(MADAutoAssetConnector) _getAutoAssetConnectorStateTable];
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    stateTable = v2->_stateTable;
    v2->_stateTable = (NSDictionary *)v6;

    latestSafeSummary = v2->_latestSafeSummary;
    v2->_latestSafeSummary = (NSString *)@"INIT";

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    monitorMarkers = v2->_monitorMarkers;
    v2->_monitorMarkers = v9;

    id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    markersRequiringRetry = v2->_markersRequiringRetry;
    v2->_markersRequiringRetry = v11;

    int64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    triggeredMarkersNoRetry = v2->_triggeredMarkersNoRetry;
    v2->_triggeredMarkersNoRetry = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    triggeredMarkersRequiringRetry = v2->_triggeredMarkersRequiringRetry;
    v2->_triggeredMarkersRequiringRetry = v15;

    initialWaitTimer = v2->_initialWaitTimer;
    v2->_initialWaitTimer = 0LL;

    backoffRetryTimer = v2->_backoffRetryTimer;
    v2->_backoffRetryLevel = 0LL;
    v2->_backoffRetryTimer = 0LL;

    waitBeforeRetryTimer = v2->_waitBeforeRetryTimer;
    v2->_waitBeforeRetryTimer = 0LL;

    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    catalogServerNetworkPathObservers = v2->_catalogServerNetworkPathObservers;
    v2->_catalogServerNetworkPathObservers = v20;

    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    catalogServerNetworkPathStatus = v2->_catalogServerNetworkPathStatus;
    v2->_catalogServerNetworkPathStatus = v22;

    activeJobMarker = v2->_activeJobMarker;
    v2->_activeJobMarker = 0LL;

    v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    currentAttemptRemainingMarkers = v2->_currentAttemptRemainingMarkers;
    v2->_currentAttemptRemainingMarkers = v25;

    v27 = (SUCoreFSM *)-[SUCoreFSM initMachine:withTable:startingIn:usingDelegate:registeringAllInfoClass:]( objc_alloc(&OBJC_CLASS___SUCoreFSM),  "initMachine:withTable:startingIn:usingDelegate:registeringAllInfoClass:",  @"AutoAssetConnector",  v2->_stateTable,  @"ReadyToResume",  v2,  objc_opt_class(&OBJC_CLASS___MADAutoAssetConnectorParam));
    autoConnectorFSM = v2->_autoConnectorFSM;
    v2->_autoConnectorFSM = v27;

    if (!v2->_autoConnectorFSM)
    {
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SUCoreLog oslog](v2->_logger, "oslog"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[MADAutoAssetConnector init].cold.1();
      }
    }
  }

  return v2;
}

+ (id)autoAssetConnector
{
  if (autoAssetConnector_dispatchOnceAutoAssetConnector != -1) {
    dispatch_once(&autoAssetConnector_dispatchOnceAutoAssetConnector, &__block_literal_global_2);
  }
  return (id)autoAssetConnector___autoAssetConnector;
}

void __43__MADAutoAssetConnector_autoAssetConnector__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MADAutoAssetConnector);
  uint64_t v2 = (void *)autoAssetConnector___autoAssetConnector;
  autoAssetConnector___autoAssetConnector = (uint64_t)v1;
}

+ (void)resumeMonitoringMarkers:(id)a3 withMarkersRequiringRetry:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetConnector autoAssetConnector](&OBJC_CLASS___MADAutoAssetConnector, "autoAssetConnector"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 autoConnectorFSM]);
    v10 = -[MADAutoAssetConnectorParam initWithMonitorMarkers:withMarkersNoRetry:withMarkersRequiringRetry:]( objc_alloc(&OBJC_CLASS___MADAutoAssetConnectorParam),  "initWithMonitorMarkers:withMarkersNoRetry:withMarkersRequiringRetry:",  v5,  0LL,  v6);
    [v9 postEvent:@"ResumeMonitoringMarkers" withInfo:v10];
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v11 oslog]);

    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetConnector resumeMonitoringMarkers:withMarkersRequiringRetry:].cold.1();
    }
  }
}

+ (void)alteredMonitoringMarkers:(id)a3 withTriggeredNoRetry:(id)a4 withTriggeredRequiringRetry:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetConnector autoAssetConnector](&OBJC_CLASS___MADAutoAssetConnector, "autoAssetConnector"));
  id v11 = v10;
  if (v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 autoConnectorFSM]);
    int64_t v13 = -[MADAutoAssetConnectorParam initWithMonitorMarkers:withMarkersNoRetry:withMarkersRequiringRetry:]( objc_alloc(&OBJC_CLASS___MADAutoAssetConnectorParam),  "initWithMonitorMarkers:withMarkersNoRetry:withMarkersRequiringRetry:",  v7,  v8,  v9);
    [v12 postEvent:@"AlteredTriggeredMarkers" withInfo:v13];
  }

  else
  {
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v14 oslog]);

    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetConnector alteredMonitoringMarkers:withTriggeredNoRetry:withTriggeredRequiringRetry:].cold.1();
    }
  }
}

+ (void)scheduledMarkerFinished:(id)a3 withPotentialNetworkFailure:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetConnector autoAssetConnector](&OBJC_CLASS___MADAutoAssetConnector, "autoAssetConnector"));
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 autoConnectorFSM]);
    id v9 = -[MADAutoAssetConnectorParam initWithScheduledMarkerFinished:withPotentialNetworkFailure:]( objc_alloc(&OBJC_CLASS___MADAutoAssetConnectorParam),  "initWithScheduledMarkerFinished:withPotentialNetworkFailure:",  v5,  v4);
    [v8 postEvent:@"JobFinishedForMarker" withInfo:v9];
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetConnector scheduledMarkerFinished:withPotentialNetworkFailure:].cold.1();
    }
  }
}

+ (void)observedNetworkPathToServerUp:(id)a3
{
  id v3 = a3;
  if (!+[MADAutoAssetControlManager preferenceAutoAssetObserverIgnoreNetworkStatus]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceAutoAssetObserverIgnoreNetworkStatus"))
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetConnector autoAssetConnector]( &OBJC_CLASS___MADAutoAssetConnector,  "autoAssetConnector"));
    id v5 = v4;
    if (v4)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 autoConnectorFSM]);
      id v7 = -[MADAutoAssetConnectorParam initWithObservedNetworkPath:]( objc_alloc(&OBJC_CLASS___MADAutoAssetConnectorParam),  "initWithObservedNetworkPath:",  v3);
      [v6 postEvent:@"NetworkPathToServerUp" withInfo:v7];
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 oslog]);

      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
        +[MADAutoAssetConnector observedNetworkPathToServerUp:].cold.1();
      }
    }
  }
}

+ (void)observedNetworkPathToServerDown:(id)a3
{
  id v3 = a3;
  if (!+[MADAutoAssetControlManager preferenceAutoAssetObserverIgnoreNetworkStatus]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceAutoAssetObserverIgnoreNetworkStatus"))
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetConnector autoAssetConnector]( &OBJC_CLASS___MADAutoAssetConnector,  "autoAssetConnector"));
    id v5 = v4;
    if (v4)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 autoConnectorFSM]);
      id v7 = -[MADAutoAssetConnectorParam initWithObservedNetworkPath:]( objc_alloc(&OBJC_CLASS___MADAutoAssetConnectorParam),  "initWithObservedNetworkPath:",  v3);
      [v6 postEvent:@"NetworkPathToServerDown" withInfo:v7];
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 oslog]);

      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
        +[MADAutoAssetConnector observedNetworkPathToServerDown:].cold.1();
      }
    }
  }
}

+ (id)backoffRetryLevelDefaultTimes
{
  return &off_38FA60;
}

+ (void)simulateNetworkPathUp:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetConnector autoAssetConnector](&OBJC_CLASS___MADAutoAssetConnector, "autoAssetConnector"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 assetType]);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[DownloadManager pathToCatalogLookupServer:usingDownloadOptions:]( &OBJC_CLASS___DownloadManager,  "pathToCatalogLookupServer:usingDownloadOptions:",  v5,  0LL));

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 autoConnectorFSM]);
    id v8 = -[MADAutoAssetConnectorParam initWithObservedNetworkPath:]( objc_alloc(&OBJC_CLASS___MADAutoAssetConnectorParam),  "initWithObservedNetworkPath:",  v6);
    [v7 postEvent:@"NetworkPathToServerUp" withInfo:v8];
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetConnector observedNetworkPathToServerDown:].cold.1();
    }
  }
}

+ (void)simulateNetworkPathDown:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetConnector autoAssetConnector](&OBJC_CLASS___MADAutoAssetConnector, "autoAssetConnector"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 assetType]);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[DownloadManager pathToCatalogLookupServer:usingDownloadOptions:]( &OBJC_CLASS___DownloadManager,  "pathToCatalogLookupServer:usingDownloadOptions:",  v5,  0LL));

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 autoConnectorFSM]);
    id v8 = -[MADAutoAssetConnectorParam initWithObservedNetworkPath:]( objc_alloc(&OBJC_CLASS___MADAutoAssetConnectorParam),  "initWithObservedNetworkPath:",  v6);
    [v7 postEvent:@"NetworkPathToServerDown" withInfo:v8];
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetConnector observedNetworkPathToServerDown:].cold.1();
    }
  }
}

- (int64_t)action_ResumeDecideRequiringRetry:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 monitorMarkers]);
  if (v8)
  {
    id v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 monitorMarkers]);
    id v11 = [v10 count];

    if (v11)
    {
      id v12 = objc_alloc(&OBJC_CLASS___NSMutableArray);
      int64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 monitorMarkers]);
      int64_t v14 = -[NSMutableArray initWithArray:](v12, "initWithArray:", v13);
      -[MADAutoAssetConnector setMonitorMarkers:](self, "setMonitorMarkers:", v14);

      -[MADAutoAssetConnector _logMarkersBeingMonitored:]( self,  "_logMarkersBeingMonitored:",  @"ResumeDecideRequiringRetry");
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "monitorMarkers", 0));
      id v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v31;
        do
        {
          v19 = 0LL;
          do
          {
            if (*(void *)v31 != v18) {
              objc_enumerationMutation(v15);
            }
            -[MADAutoAssetConnector _addObserverForMarker:]( self,  "_addObserverForMarker:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)v19));
            v19 = (char *)v19 + 1;
          }

          while (v17 != v19);
          id v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }

        while (v17);
      }
    }
  }

  uint64_t v20 = objc_claimAutoreleasedReturnValue([v5 markersRequiringRetry]);
  if (v20
    && (v21 = (void *)v20,
        v22 = (void *)objc_claimAutoreleasedReturnValue([v5 markersRequiringRetry]),
        id v23 = [v22 count],
        v22,
        v21,
        v23))
  {
    v24 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v5 markersRequiringRetry]);
    v26 = -[NSMutableArray initWithArray:](v24, "initWithArray:", v25);
    -[MADAutoAssetConnector setMarkersRequiringRetry:](self, "setMarkersRequiringRetry:", v26);

    -[MADAutoAssetConnector _logMarkersRequiringRetry:]( self,  "_logMarkersRequiringRetry:",  @"ResumeDecideRequiringRetry");
    v27 = @"ResumeHaveJobsRequiringRetry";
  }

  else
  {
    v27 = @"ResumeNothingRequiringRetry";
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  [v28 followupEvent:v27 withInfo:v5];

  return 0LL;
}

- (int64_t)action_StartInitialWaitTimer:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = +[MADAutoAssetControlManager preferenceConnectorInitialWaitSecs]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceConnectorInitialWaitSecs");
  if (v7 == -1) {
    uint64_t v8 = 600LL;
  }
  else {
    uint64_t v8 = v7;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetConnector _startTimer:ofTimerCategory:forOneShotSecs:withFiredMessage:postingEvent:]( self,  "_startTimer:ofTimerCategory:forOneShotSecs:withFiredMessage:postingEvent:",  @"StartInitialWaitTimer",  @"INITIAL_WAIT_TIMER",  v8,  @"INITIAL_WAIT_TIMER",  @"TimeoutInitialStartup"));
  -[MADAutoAssetConnector setInitialWaitTimer:](self, "setInitialWaitTimer:", v9);

  return 0LL;
}

- (int64_t)action_StartBackoffAndRetryWaitTimers:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager preferenceConnectorBackoffRetryTimes]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceConnectorBackoffRetryTimes"));
  int64_t v8 = +[MADAutoAssetControlManager preferenceConnectorWaitBeforeRetrySecs]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceConnectorWaitBeforeRetrySecs");
  if (!v7) {
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetConnector backoffRetryLevelDefaultTimes]( &OBJC_CLASS___MADAutoAssetConnector,  "backoffRetryLevelDefaultTimes"));
  }
  if (-[MADAutoAssetConnector backoffRetryLevel](self, "backoffRetryLevel") <= 6) {
    -[MADAutoAssetConnector _setBackoffRetryLevel:forReason:]( self,  "_setBackoffRetryLevel:forReason:",  (char *)-[MADAutoAssetConnector backoffRetryLevel](self, "backoffRetryLevel") + 1,  @"starting backoff-retry delay period");
  }
  id v9 = [v7 count];
  if (v9 <= (id)-[MADAutoAssetConnector backoffRetryLevel](self, "backoffRetryLevel"))
  {
    id v11 = &loc_93A80;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "objectAtIndex:",  -[MADAutoAssetConnector backoffRetryLevel](self, "backoffRetryLevel")));
    id v11 = [v10 integerValue];
  }

  if (v8 == -1) {
    int64_t v8 = 30LL;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetConnector _startTimer:ofTimerCategory:forOneShotSecs:withFiredMessage:postingEvent:]( self,  "_startTimer:ofTimerCategory:forOneShotSecs:withFiredMessage:postingEvent:",  @"StartBackoffAndRetryWaitTimers",  @"BACKOFF_RETRY_TIMER",  v11,  @"BACKOFF_RETRY_TIMER",  @"TimeoutBackoffRetry"));
  -[MADAutoAssetConnector setBackoffRetryTimer:](self, "setBackoffRetryTimer:", v12);

  int64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetConnector _startTimer:ofTimerCategory:forOneShotSecs:withFiredMessage:postingEvent:]( self,  "_startTimer:ofTimerCategory:forOneShotSecs:withFiredMessage:postingEvent:",  @"StartBackoffAndRetryWaitTimers",  @"WAIT_BEFORE_RETRY_TIMER",  v8,  @"WAIT_BEFORE_RETRY_TIMER",  @"TimeoutRetryWait"));
  -[MADAutoAssetConnector setWaitBeforeRetryTimer:](self, "setWaitBeforeRetryTimer:", v13);

  return 0LL;
}

- (int64_t)action_StopBackoffTimer:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector backoffRetryTimer](self, "backoffRetryTimer"));
  if (v7)
  {
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector backoffRetryTimer](self, "backoffRetryTimer"));
    [v8 invalidate];

    -[MADAutoAssetConnector setBackoffRetryTimer:](self, "setBackoffRetryTimer:", 0LL);
    -[MADAutoAssetConnector _stoppedTimer:ofTimerCategory:]( self,  "_stoppedTimer:ofTimerCategory:",  @"StopBackoffTimer",  @"BACKOFF_RETRY_TIMER");
  }

  return 0LL;
}

- (int64_t)action_StopBackoffOrderAttemptFirstJobActive:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector backoffRetryTimer](self, "backoffRetryTimer"));
  if (v7)
  {
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector backoffRetryTimer](self, "backoffRetryTimer"));
    [v8 invalidate];

    -[MADAutoAssetConnector setBackoffRetryTimer:](self, "setBackoffRetryTimer:", 0LL);
    -[MADAutoAssetConnector _stoppedTimer:ofTimerCategory:]( self,  "_stoppedTimer:ofTimerCategory:",  @"StopBackoffOrderAttemptFirstJobActive",  @"WAIT_BEFORE_RETRY_TIMER");
  }

  -[MADAutoAssetConnector _chooseOrderForNextAttemptAndStartFirstJob:]( self,  "_chooseOrderForNextAttemptAndStartFirstJob:",  @"StopBackoffOrderAttemptFirstJobActive");
  return 0LL;
}

- (int64_t)action_FiredInitial:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector initialWaitTimer](self, "initialWaitTimer"));
  if (v7)
  {
    -[MADAutoAssetConnector setInitialWaitTimer:](self, "setInitialWaitTimer:", 0LL);
    -[MADAutoAssetConnector _firedTimer:ofTimerCategory:]( self,  "_firedTimer:ofTimerCategory:",  @"FiredInitial",  @"INITIAL_WAIT_TIMER");
  }

  return 0LL;
}

- (int64_t)action_FiredInitialDecideServerApplicableToJobs:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector initialWaitTimer](self, "initialWaitTimer"));
  if (v7)
  {
    -[MADAutoAssetConnector setInitialWaitTimer:](self, "setInitialWaitTimer:", 0LL);
    -[MADAutoAssetConnector _firedTimer:ofTimerCategory:]( self,  "_firedTimer:ofTimerCategory:",  @"FiredInitialDecideServerApplicableToJobs",  @"INITIAL_WAIT_TIMER");
  }

  -[MADAutoAssetConnector _issueFollowupApplicableServersUpDown:]( self,  "_issueFollowupApplicableServersUpDown:",  @"FiredInitialDecideServerApplicableToJobs");
  return 0LL;
}

- (int64_t)action_FiredRetryWaitIgnored:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector initialWaitTimer](self, "initialWaitTimer"));
  if (v7)
  {
    -[MADAutoAssetConnector setInitialWaitTimer:](self, "setInitialWaitTimer:", 0LL);
    -[MADAutoAssetConnector _firedTimer:ofTimerCategory:]( self,  "_firedTimer:ofTimerCategory:",  @"FiredRetryWaitIgnored",  @"WAIT_BEFORE_RETRY_TIMER");
  }

  return 0LL;
}

- (int64_t)action_FiredBackoffIgnored:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector initialWaitTimer](self, "initialWaitTimer"));
  if (v7)
  {
    -[MADAutoAssetConnector setInitialWaitTimer:](self, "setInitialWaitTimer:", 0LL);
    -[MADAutoAssetConnector _firedTimer:ofTimerCategory:]( self,  "_firedTimer:ofTimerCategory:",  @"FiredBackoffIgnored",  @"BACKOFF_RETRY_TIMER");
  }

  return 0LL;
}

- (int64_t)action_FiredRetryWait:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector initialWaitTimer](self, "initialWaitTimer"));
  if (v7)
  {
    -[MADAutoAssetConnector setInitialWaitTimer:](self, "setInitialWaitTimer:", 0LL);
    -[MADAutoAssetConnector _firedTimer:ofTimerCategory:]( self,  "_firedTimer:ofTimerCategory:",  @"FiredRetryWait",  @"WAIT_BEFORE_RETRY_TIMER");
  }

  return 0LL;
}

- (int64_t)action_FiredBackoffDecideServerApplicableToJobs:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector initialWaitTimer](self, "initialWaitTimer"));
  if (v7)
  {
    -[MADAutoAssetConnector setInitialWaitTimer:](self, "setInitialWaitTimer:", 0LL);
    -[MADAutoAssetConnector _firedTimer:ofTimerCategory:]( self,  "_firedTimer:ofTimerCategory:",  @"FiredBackoffDecideServerApplicableToJobs",  @"BACKOFF_RETRY_TIMER");
  }

  -[MADAutoAssetConnector _issueFollowupApplicableServersUpDown:]( self,  "_issueFollowupApplicableServersUpDown:",  @"FiredBackoffDecideServerApplicableToJobs");
  return 0LL;
}

- (int64_t)action_FiredRetryWaitOrderAttemptFirstJobActive:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector initialWaitTimer](self, "initialWaitTimer"));
  if (v7)
  {
    -[MADAutoAssetConnector setInitialWaitTimer:](self, "setInitialWaitTimer:", 0LL);
    -[MADAutoAssetConnector _firedTimer:ofTimerCategory:]( self,  "_firedTimer:ofTimerCategory:",  @"FiredRetryWaitOrderAttemptFirstJobActive",  @"WAIT_BEFORE_RETRY_TIMER");
  }

  -[MADAutoAssetConnector _chooseOrderForNextAttemptAndStartFirstJob:]( self,  "_chooseOrderForNextAttemptAndStartFirstJob:",  @"StopBackoffOrderAttemptFirstJobActive");
  return 0LL;
}

- (int64_t)action_TrackServerUp:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 observedNetworkPath]);
  -[MADAutoAssetConnector _trackServerUp:fromLocation:]( self,  "_trackServerUp:fromLocation:",  v8,  @"TrackServerUp");

  return 0LL;
}

- (int64_t)action_TrackServerDown:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 observedNetworkPath]);
  -[MADAutoAssetConnector _trackServerDown:fromLocation:]( self,  "_trackServerDown:fromLocation:",  v8,  @"TrackServerDown");

  return 0LL;
}

- (int64_t)action_TrackServerUpDecideApplicableToJobs:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 observedNetworkPath]);
  -[MADAutoAssetConnector _trackServerUp:fromLocation:]( self,  "_trackServerUp:fromLocation:",  v8,  @"TrackServerUpDecideApplicableToJobs");

  if (-[MADAutoAssetConnector _isAnyServerUpForJobsToBeAttempted:]( self,  "_isAnyServerUpForJobsToBeAttempted:",  @"TrackServerUpDecideApplicableToJobs"))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
    [v9 followupEvent:@"ApplicableServersUp" withInfo:v5];
  }

  return 0LL;
}

- (int64_t)action_TrackServerDownDecideApplicableToJobs:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 observedNetworkPath]);
  -[MADAutoAssetConnector _trackServerDown:fromLocation:]( self,  "_trackServerDown:fromLocation:",  v8,  @"TrackServerDownDecideApplicableToJobs");

  if (!-[MADAutoAssetConnector _isAnyServerUpForJobsToBeAttempted:]( self,  "_isAnyServerUpForJobsToBeAttempted:",  @"TrackServerUpDecideApplicableToJobs"))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
    [v9 followupEvent:@"ApplicableServersDown" withInfo:v5];
  }

  return 0LL;
}

- (int64_t)action_TrackServerUpDecideInUseActiveJob:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetConnector _followupInUseServerStatus:]( self,  "_followupInUseServerStatus:",  @"TrackServerUpDecideInUseActiveJob"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 observedNetworkPath]);
  -[MADAutoAssetConnector _trackServerUp:fromLocation:]( self,  "_trackServerUp:fromLocation:",  v9,  @"TrackServerUpDecideInUseActiveJob");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  [v10 followupEvent:v8 withInfo:v5];

  return 0LL;
}

- (int64_t)action_TrackServerDownDecideInUseActiveJob:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetConnector _followupInUseServerStatus:]( self,  "_followupInUseServerStatus:",  @"TrackServerUpDecideInUseActiveJob"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 observedNetworkPath]);
  -[MADAutoAssetConnector _trackServerDown:fromLocation:]( self,  "_trackServerDown:fromLocation:",  v9,  @"TrackServerDownDecideInUseActiveJob");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  [v10 followupEvent:v8 withInfo:v5];

  return 0LL;
}

- (int64_t)action_StartupAlteredJobsReplaceDecideHaveJobs:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetConnector _adoptAlteredMarkers:](self, "_adoptAlteredMarkers:", v5);
  -[MADAutoAssetConnector _issueFollowupWhetherHaveJobs:notifyingWhenNoJobs:]( self,  "_issueFollowupWhetherHaveJobs:notifyingWhenNoJobs:",  @"[STARTUP] set of monitored markers replaced",  0LL);
  return 0LL;
}

- (int64_t)action_AlteredJobsReplaceDecideHaveJobs:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetConnector _adoptAlteredMarkers:](self, "_adoptAlteredMarkers:", v5);
  -[MADAutoAssetConnector _issueFollowupWhetherHaveJobs:notifyingWhenNoJobs:]( self,  "_issueFollowupWhetherHaveJobs:notifyingWhenNoJobs:",  @"set of monitored markers replaced",  1LL);
  return 0LL;
}

- (int64_t)action_AlteredJobsDecideStillActiveJob:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  int64_t v8 = -[MADAutoAssetConnectorParam initWithSafeSummary:]( objc_alloc(&OBJC_CLASS___MADAutoAssetConnectorParam),  "initWithSafeSummary:",  @"set of monitored markers altered mid-attempt");
  -[MADAutoAssetConnector _adoptAlteredMarkers:](self, "_adoptAlteredMarkers:", v5);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
    unsigned __int8 v11 = -[MADAutoAssetConnector _isMarkerBeingMonitored:](self, "_isMarkerBeingMonitored:", v10);

    if ((v11 & 1) != 0)
    {
      id v12 = @"AlteredStillActiveJob";
      goto LABEL_15;
    }
  }

  else
  {
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 diag]);
    [v14 trackAnomaly:@"AUTO-CONNECTOR" forReason:@"{AlteredJobsDecideStillActiveJob} no active-job-marker when deciding whether still active job" withResult:6111 withError:0];
  }

  -[MADAutoAssetConnector setActiveJobMarker:](self, "setActiveJobMarker:", 0LL);
  -[MADAutoAssetConnector _logClearedActiveJobMarker:]( self,  "_logClearedActiveJobMarker:",  @"AlteredJobsDecideStillActiveJob");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
  id v16 = [v15 count];

  if (!v16)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector markersRequiringRetry](self, "markersRequiringRetry"));
    if (![v19 count])
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
      if (![v20 count])
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersRequiringRetry](self, "triggeredMarkersRequiringRetry"));
        id v24 = [v23 count];

        if (!v24)
        {
          -[MADAutoAssetConnector _setBackoffRetryLevel:forReason:]( self,  "_setBackoffRetryLevel:forReason:",  0LL,  @"auto-asset-scheduler altered scheduled-jobs mid-attempt - no more jobs to be attempted");
          id v12 = @"AlteredAttemptDoneNoJobs";
          goto LABEL_15;
        }

        goto LABEL_14;
      }
    }

LABEL_14:
    id v12 = @"AlteredAttemptDoneBackoff";
    goto LABEL_15;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndex:0]);

  if (-[MADAutoAssetConnector _isPathToServerForMarkerUp:](self, "_isPathToServerForMarkerUp:", v18)) {
    id v12 = @"AlteredActiveGoneConnected";
  }
  else {
    id v12 = @"AlteredActiveGoneDisconnected";
  }

LABEL_15:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  [v21 followupEvent:v12 withInfo:v8];

  return 0LL;
}

- (int64_t)action_AlteredJobsDecidePreemptBackoff:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 markersNoRetry]);
  if ([v8 count])
  {

    -[MADAutoAssetConnector _adoptAlteredMarkers:](self, "_adoptAlteredMarkers:", v5);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 markersRequiringRetry]);
    id v10 = [v9 count];

    -[MADAutoAssetConnector _adoptAlteredMarkers:](self, "_adoptAlteredMarkers:", v5);
    if (!v10) {
      goto LABEL_8;
    }
  }

  unsigned int v11 = -[MADAutoAssetConnector _isAnyServerUpForJobsToBeAttempted:]( self,  "_isAnyServerUpForJobsToBeAttempted:",  @"AlteredJobsDecidePreemptBackoff");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  int64_t v13 = v12;
  if (v11) {
    int64_t v14 = @"AlteredPreemptConnected";
  }
  else {
    int64_t v14 = @"AlteredPreemptDisconnected";
  }
  [v12 followupEvent:v14 withInfo:v5];

LABEL_8:
  return 0LL;
}

- (int64_t)action_DecideServerApplicableToJobs:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetConnector _issueFollowupApplicableServersUpDown:]( self,  "_issueFollowupApplicableServersUpDown:",  @"DecideServerApplicableToJobs");
  return 0LL;
}

- (int64_t)action_OrderAttemptFirstJobActive:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetConnector _chooseOrderForNextAttemptAndStartFirstJob:]( self,  "_chooseOrderForNextAttemptAndStartFirstJob:",  @"OrderAttemptFirstJobActive");
  return 0LL;
}

- (int64_t)action_NextScheduledJobNowActive:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
  if (v7)
  {
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 diag]);
    [v9 trackAnomaly:@"AUTO-CONNECTOR" forReason:@"{NextScheduledJobNowActive} active-job-marker when not expected" withResult:6103 withError:0];

    -[MADAutoAssetConnector setActiveJobMarker:](self, "setActiveJobMarker:", 0LL);
    -[MADAutoAssetConnector _logClearedActiveJobMarker:]( self,  "_logClearedActiveJobMarker:",  @"NextScheduledJobNowActive");
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
  if (!v10
    || (unsigned int v11 = (void *)v10,
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers")),
        id v13 = [v12 count],
        v12,
        v11,
        !v13))
  {
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 diag]);
    id v16 = v15;
    id v17 = @"{NextScheduledJobNowActive} no [more] jobs remaining for current attempt when jobs expected";
    goto LABEL_8;
  }

  if (!-[MADAutoAssetConnector _triggerNextMarker](self, "_triggerNextMarker"))
  {
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 diag]);
    id v16 = v15;
    id v17 = @"{NextScheduledJobNowActive} unable to start next triggered job";
LABEL_8:
    [v15 trackAnomaly:@"AUTO-CONNECTOR" forReason:v17 withResult:6110 withError:0];

    uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[MADAutoAssetConnector setCurrentAttemptRemainingMarkers:](self, "setCurrentAttemptRemainingMarkers:", v18);

    -[MADAutoAssetConnector _logClearedAttemptRemainingMarkers:](self, "_logClearedAttemptRemainingMarkers:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
    uint64_t v20 = -[MADAutoAssetConnectorParam initWithSafeSummary:]( objc_alloc(&OBJC_CLASS___MADAutoAssetConnectorParam),  "initWithSafeSummary:",  v17);
    [v19 postEvent:@"AttemptAbandoned" withInfo:v20];
  }

  return 0LL;
}

- (int64_t)action_JobFinishedDecideHaveJobs:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedMarker]);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedMarker]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
    unsigned int v11 = [v9 isEqual:v10];

    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 diag]);
      [v13 trackAnomaly:@"AUTO-CONNECTOR" forReason:@"{JobFinishedDecideHaveJobs} finishedMarker = activeJobMarker (when no attempt in progress)" withResult:6102 withError:0];

      -[MADAutoAssetConnector setActiveJobMarker:](self, "setActiveJobMarker:", 0LL);
      int64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      -[MADAutoAssetConnector setCurrentAttemptRemainingMarkers:](self, "setCurrentAttemptRemainingMarkers:", v14);

      -[MADAutoAssetConnector _logClearedActiveJobAndAttemptRemainingMarkers:]( self,  "_logClearedActiveJobAndAttemptRemainingMarkers:",  @"JobFinishedDecideHaveJobs");
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedMarker]);
    -[MADAutoAssetConnector _refreshTrackingOfFinishedMarker:withPotentialNetworkFailure:]( self,  "_refreshTrackingOfFinishedMarker:withPotentialNetworkFailure:",  v15,  [v5 potentialNetworkFailure]);
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 diag]);
    [v16 trackAnomaly:@"AUTO-CONNECTOR" forReason:@"{JobFinishedDecideHaveJobs} no finishedMarker" withResult:6102 withError:0];
  }

  -[MADAutoAssetConnector _issueFollowupWhetherHaveJobs:notifyingWhenNoJobs:]( self,  "_issueFollowupWhetherHaveJobs:notifyingWhenNoJobs:",  @"active-job (known to marker) finished",  0LL);
  return 0LL;
}

- (int64_t)action_JobFinishedDecideStillActiveJob:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedMarker]);
  if (!v8)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
    v19 = (MADAutoAssetConnectorParam *)objc_claimAutoreleasedReturnValue([v18 diag]);
    -[MADAutoAssetConnectorParam trackAnomaly:forReason:withResult:withError:]( v19,  "trackAnomaly:forReason:withResult:withError:",  @"AUTO-CONNECTOR",  @"{JobFinishedDecideStillActiveJob} no finishedMarker",  6102LL,  0LL);
LABEL_14:

    goto LABEL_15;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedMarker]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
  unsigned int v11 = [v9 isEqual:v10];

  if (v11)
  {
    -[MADAutoAssetConnector setActiveJobMarker:](self, "setActiveJobMarker:", 0LL);
    -[MADAutoAssetConnector _logClearedActiveJobMarker:]( self,  "_logClearedActiveJobMarker:",  @"JobFinishedDecideStillActiveJob");
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedMarker]);
    -[MADAutoAssetConnector _refreshTrackingOfFinishedMarker:withPotentialNetworkFailure:]( self,  "_refreshTrackingOfFinishedMarker:withPotentialNetworkFailure:",  v12,  [v5 potentialNetworkFailure]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
    id v14 = [v13 count];

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:0]);

      if (-[MADAutoAssetConnector _isPathToServerForMarkerUp:](self, "_isPathToServerForMarkerUp:", v16)) {
        id v17 = @"JobFinishedNextConnected";
      }
      else {
        id v17 = @"JobFinishedNextDisconnected";
      }
    }

    else if (-[MADAutoAssetConnector _isBackoffRetryRequired:]( self,  "_isBackoffRetryRequired:",  @"JobFinishedDecideStillActiveJob"))
    {
      id v17 = @"JobFinishedAttemptDoneBackoff";
    }

    else
    {
      id v17 = @"JobFinishedAttemptDoneNoJobs";
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
    v19 = -[MADAutoAssetConnectorParam initWithSafeSummary:]( objc_alloc(&OBJC_CLASS___MADAutoAssetConnectorParam),  "initWithSafeSummary:",  @"JobFinishedDecideStillActiveJob");
    [v18 followupEvent:v17 withInfo:v19];
    goto LABEL_14;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedMarker]);
  -[MADAutoAssetConnector _refreshTrackingOfFinishedMarker:withPotentialNetworkFailure:]( self,  "_refreshTrackingOfFinishedMarker:withPotentialNetworkFailure:",  v18,  [v5 potentialNetworkFailure]);
LABEL_15:

  return 0LL;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"unknown action(%@)",  v5);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 diag]);
  [v8 dumpTracked:v6 dumpingTo:5 usingFilename:0 clearingStatistics:0 clearingHistory:0];

  return 0LL;
}

- (void)_adoptAlteredMarkers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 monitorMarkers]);
  id v82 = v4;
  if (v7)
  {
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector monitorMarkers](self, "monitorMarkers"));
    id v9 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 monitorMarkers]);
    unsigned int v11 = -[NSMutableArray initWithArray:](v9, "initWithArray:", v10);
    -[MADAutoAssetConnector setMonitorMarkers:](self, "setMonitorMarkers:", v11);

    __int128 v109 = 0u;
    __int128 v110 = 0u;
    __int128 v107 = 0u;
    __int128 v108 = 0u;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v107 objects:v117 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v108;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v108 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v107 + 1) + 8LL * (void)i);
          if (!-[MADAutoAssetConnector _isMarkerBeingMonitored:](self, "_isMarkerBeingMonitored:", v17)) {
            -[MADAutoAssetConnector _removeObserverForMarker:](self, "_removeObserverForMarker:", v17);
          }
        }

        id v14 = [v12 countByEnumeratingWithState:&v107 objects:v117 count:16];
      }

      while (v14);
    }

    __int128 v105 = 0u;
    __int128 v106 = 0u;
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector monitorMarkers](self, "monitorMarkers"));
    id v19 = [v18 countByEnumeratingWithState:&v103 objects:v116 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v104;
      do
      {
        for (j = 0LL; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v104 != v21) {
            objc_enumerationMutation(v18);
          }
          -[MADAutoAssetConnector _addObserverForMarker:]( self,  "_addObserverForMarker:",  *(void *)(*((void *)&v103 + 1) + 8LL * (void)j));
        }

        id v20 = [v18 countByEnumeratingWithState:&v103 objects:v116 count:16];
      }

      while (v20);
    }

    -[MADAutoAssetConnector _logMarkersBeingMonitored:]( self,  "_logMarkersBeingMonitored:",  @"_adoptAlteredMarkers");
    id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
    id v25 = [v24 countByEnumeratingWithState:&v99 objects:v115 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v100;
      do
      {
        for (k = 0LL; k != v26; k = (char *)k + 1)
        {
          if (*(void *)v100 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v99 + 1) + 8LL * (void)k);
          if (-[MADAutoAssetConnector _isMarkerBeingMonitored:](self, "_isMarkerBeingMonitored:", v29)) {
            -[NSMutableArray addObject:](v23, "addObject:", v29);
          }
        }

        id v26 = [v24 countByEnumeratingWithState:&v99 objects:v115 count:16];
      }

      while (v26);
    }

    id v30 = -[NSMutableArray count](v23, "count");
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
    id v32 = [v31 count];

    if (v30 != v32)
    {
      -[MADAutoAssetConnector setTriggeredMarkersNoRetry:](self, "setTriggeredMarkersNoRetry:", v23);
      -[MADAutoAssetConnector _logTriggeredMarkersNoRetry:]( self,  "_logTriggeredMarkersNoRetry:",  @"_adoptAlteredMarkers");
    }

    __int128 v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);

    __int128 v97 = 0u;
    __int128 v98 = 0u;
    __int128 v95 = 0u;
    __int128 v96 = 0u;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersRequiringRetry](self, "triggeredMarkersRequiringRetry"));
    id v35 = [v34 countByEnumeratingWithState:&v95 objects:v114 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v96;
      do
      {
        for (m = 0LL; m != v36; m = (char *)m + 1)
        {
          if (*(void *)v96 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v95 + 1) + 8LL * (void)m);
          if (-[MADAutoAssetConnector _isMarkerBeingMonitored:](self, "_isMarkerBeingMonitored:", v39)) {
            -[NSMutableArray addObject:](v33, "addObject:", v39);
          }
        }

        id v36 = [v34 countByEnumeratingWithState:&v95 objects:v114 count:16];
      }

      while (v36);
    }

    id v40 = -[NSMutableArray count](v33, "count");
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersRequiringRetry](self, "triggeredMarkersRequiringRetry"));
    id v42 = [v41 count];

    if (v40 != v42)
    {
      -[MADAutoAssetConnector setTriggeredMarkersRequiringRetry:](self, "setTriggeredMarkersRequiringRetry:", v33);
      -[MADAutoAssetConnector _logTriggeredMarkersRequiringRetry:]( self,  "_logTriggeredMarkersRequiringRetry:",  @"_adoptAlteredMarkers");
    }

    v43 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);

    __int128 v93 = 0u;
    __int128 v94 = 0u;
    __int128 v91 = 0u;
    __int128 v92 = 0u;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector markersRequiringRetry](self, "markersRequiringRetry"));
    id v45 = [v44 countByEnumeratingWithState:&v91 objects:v113 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v92;
      do
      {
        for (n = 0LL; n != v46; n = (char *)n + 1)
        {
          if (*(void *)v92 != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v49 = *(void *)(*((void *)&v91 + 1) + 8LL * (void)n);
          if (-[MADAutoAssetConnector _isMarkerBeingMonitored:](self, "_isMarkerBeingMonitored:", v49)) {
            -[NSMutableArray addObject:](v43, "addObject:", v49);
          }
        }

        id v46 = [v44 countByEnumeratingWithState:&v91 objects:v113 count:16];
      }

      while (v46);
    }

    id v50 = -[NSMutableArray count](v43, "count");
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector markersRequiringRetry](self, "markersRequiringRetry"));
    id v52 = [v51 count];

    if (v50 != v52)
    {
      -[MADAutoAssetConnector setMarkersRequiringRetry:](self, "setMarkersRequiringRetry:", v43);
      -[MADAutoAssetConnector _logMarkersRequiringRetry:]( self,  "_logMarkersRequiringRetry:",  @"_adoptAlteredMarkers");
    }

    id v4 = v82;
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue([v4 markersNoRetry]);

  if (v53)
  {
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    v54 = (void *)objc_claimAutoreleasedReturnValue([v4 markersNoRetry]);
    id v55 = [v54 countByEnumeratingWithState:&v87 objects:v112 count:16];
    if (v55)
    {
      id v56 = v55;
      uint64_t v57 = *(void *)v88;
      do
      {
        for (ii = 0LL; ii != v56; ii = (char *)ii + 1)
        {
          if (*(void *)v88 != v57) {
            objc_enumerationMutation(v54);
          }
          uint64_t v59 = *(void *)(*((void *)&v87 + 1) + 8LL * (void)ii);
          if (-[MADAutoAssetConnector _isMarkerBeingMonitored:](self, "_isMarkerBeingMonitored:", v59))
          {
            v60 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
            unsigned __int8 v61 = -[MADAutoAssetConnector _isMarker:trackedByArray:](self, "_isMarker:trackedByArray:", v59, v60);

            if ((v61 & 1) == 0)
            {
              v62 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
              [v62 addObject:v59];

              -[MADAutoAssetConnector _logTriggeredMarkerNoRetry:addedMarker:]( self,  "_logTriggeredMarkerNoRetry:addedMarker:",  @"_adoptAlteredMarkers",  v59);
            }
          }

          else
          {
            v63 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
            v64 = (void *)objc_claimAutoreleasedReturnValue([v63 diag]);
            v65 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{_adoptAlteredMarkers} auto-asset-scheduled provided markersNoRetry entry not being monitored | marker:%@",  v59);
            [v64 trackAnomaly:@"AUTO-CONNECTOR" forReason:v65 withResult:6103 withError:0];
          }
        }

        id v56 = [v54 countByEnumeratingWithState:&v87 objects:v112 count:16];
      }

      while (v56);
    }

    id v4 = v82;
  }

  v66 = (void *)objc_claimAutoreleasedReturnValue([v4 markersRequiringRetry]);

  if (v66)
  {
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    v67 = (void *)objc_claimAutoreleasedReturnValue([v4 markersRequiringRetry]);
    id v68 = [v67 countByEnumeratingWithState:&v83 objects:v111 count:16];
    if (v68)
    {
      id v69 = v68;
      uint64_t v70 = *(void *)v84;
      do
      {
        for (jj = 0LL; jj != v69; jj = (char *)jj + 1)
        {
          if (*(void *)v84 != v70) {
            objc_enumerationMutation(v67);
          }
          uint64_t v72 = *(void *)(*((void *)&v83 + 1) + 8LL * (void)jj);
          if (-[MADAutoAssetConnector _isMarkerBeingMonitored:](self, "_isMarkerBeingMonitored:", v72))
          {
            v73 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetConnector triggeredMarkersRequiringRetry]( self,  "triggeredMarkersRequiringRetry"));
            unsigned __int8 v74 = -[MADAutoAssetConnector _isMarker:trackedByArray:](self, "_isMarker:trackedByArray:", v72, v73);

            if ((v74 & 1) == 0)
            {
              v75 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetConnector triggeredMarkersRequiringRetry]( self,  "triggeredMarkersRequiringRetry"));
              [v75 addObject:v72];

              -[MADAutoAssetConnector _logTriggeredMarkerRequiringRetry:addedMarker:]( self,  "_logTriggeredMarkerRequiringRetry:addedMarker:",  @"_adoptAlteredMarkers",  v72);
              v76 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector markersRequiringRetry](self, "markersRequiringRetry"));
              unsigned __int8 v77 = -[MADAutoAssetConnector _isMarker:trackedByArray:](self, "_isMarker:trackedByArray:", v72, v76);

              if ((v77 & 1) == 0)
              {
                v78 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector markersRequiringRetry](self, "markersRequiringRetry"));
                [v78 addObject:v72];

                -[MADAutoAssetConnector _logMarkerRequiringRetry:addedMarker:]( self,  "_logMarkerRequiringRetry:addedMarker:",  @"_adoptAlteredMarkers",  v72);
              }
            }
          }

          else
          {
            v79 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
            v80 = (void *)objc_claimAutoreleasedReturnValue([v79 diag]);
            v81 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{_adoptAlteredMarkers} auto-asset-scheduled provided markersRequiringRetry entry not being monitored | marker:%@",  v72);
            [v80 trackAnomaly:@"AUTO-CONNECTOR" forReason:v81 withResult:6103 withError:0];
          }
        }

        id v69 = [v67 countByEnumeratingWithState:&v83 objects:v111 count:16];
      }

      while (v69);
    }

    id v4 = v82;
  }
}

- (BOOL)_isMarkerBeingMonitored:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector monitorMarkers](self, "monitorMarkers", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if ([v4 isEqual:*(void *)(*((void *)&v12 + 1) + 8 * (void)i)])
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (BOOL)_isMarker:(id)a3 trackedByArray:(id)a4
{
  id v5 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend( v5,  "isEqual:",  *(void *)(*((void *)&v11 + 1) + 8 * (void)i),  (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)_issueFollowupWhetherHaveJobs:(id)a3 notifyingWhenNoJobs:(BOOL)a4
{
  BOOL v4 = a4;
  id v18 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = -[MADAutoAssetConnectorParam initWithSafeSummary:]( objc_alloc(&OBJC_CLASS___MADAutoAssetConnectorParam),  "initWithSafeSummary:",  v18);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector monitorMarkers](self, "monitorMarkers"));
  if ([v9 count])
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector markersRequiringRetry](self, "markersRequiringRetry"));
    if ([v10 count])
    {
LABEL_5:

LABEL_6:
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
      __int128 v13 = v12;
      __int128 v14 = @"AlteredHaveJobs";
      goto LABEL_11;
    }

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
    if ([v11 count])
    {

      goto LABEL_5;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersRequiringRetry](self, "triggeredMarkersRequiringRetry"));
    id v17 = [v16 count];

    if (v17) {
      goto LABEL_6;
    }
  }

  else
  {
  }

  __int128 v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"no [more] jobs triggered or requiring retry (%@)",  v18);
  -[MADAutoAssetConnector _setBackoffRetryLevel:forReason:](self, "_setBackoffRetryLevel:forReason:", 0LL, v15);

  if (v4) {
    +[MADAutoAssetControlManager schedulerTriggeredNoActivity]( &OBJC_CLASS___MADAutoAssetControlManager,  "schedulerTriggeredNoActivity");
  }
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  __int128 v13 = v12;
  __int128 v14 = @"AlteredNoJobs";
LABEL_11:
  [v12 followupEvent:v14 withInfo:v8];
}

- (void)_refreshTrackingOfFinishedMarker:(id)a3 withPotentialNetworkFailure:(BOOL)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 extendedStateQueue]);
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
  id v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0LL;
    while (1)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([(id)v12 objectAtIndex:v11]);

      LOBYTE(v12) = [v13 isEqual:v6];
      if ((v12 & 1) != 0) {
        break;
      }
      ++v11;
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
      id v15 = [v14 count];
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
    id v17 = [v16 count];

    if (v11 < (unint64_t)v17)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
      [v18 removeObjectAtIndex:v11];

      -[MADAutoAssetConnector _logTriggeredMarkerNoRetry:removedMarker:]( self,  "_logTriggeredMarkerNoRetry:removedMarker:",  @"_refreshTrackingOfFinishedMarker",  v6);
    }
  }

- (void)_chooseOrderForNextAttemptAndStartFirstJob:(id)a3
{
  id v75 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  v76 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned __int8 v77 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v78 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector markersRequiringRetry](self, "markersRequiringRetry"));
  id v7 = [v6 countByEnumeratingWithState:&v95 objects:v115 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v96;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v96 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 assetType]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadManager pathToCatalogLookupServer:usingDownloadOptions:]( &OBJC_CLASS___DownloadManager,  "pathToCatalogLookupServer:usingDownloadOptions:",  v12,  0LL));

        if (!v13)
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
            *(_DWORD *)buf = 138544642;
            __int128 v104 = v21;
            __int16 v105 = 2114;
            __int128 v106 = @">----->";
            __int16 v107 = 2114;
            id v108 = v75;
            __int16 v109 = 2114;
            __int128 v110 = @"MARKERS_REQUIRING_RETRY";
            __int16 v111 = 2114;
            v112 = v22;
            __int16 v113 = 2114;
            v114 = @"<-----<";
            _os_log_error_impl( &dword_0,  v20,  OS_LOG_TYPE_ERROR,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | unable to determine path to catalog lookup server\n #_CONNR:(%{public}@) markerRequiringRetry:%{public}@\n #_CONNR:%{public}@",  buf,  0x3Eu);
          }

LABEL_13:
          -[NSMutableArray addObject:](v78, "addObject:", v11);
          goto LABEL_16;
        }

        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 absoluteString]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector catalogServerNetworkPathStatus](self, "catalogServerNetworkPathStatus"));
        id v16 = [v15 safeObjectForKey:v14 ofClass:objc_opt_class(NSNumber)];
        id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

        if (!v17) {
          goto LABEL_13;
        }
        else {
          id v18 = v77;
        }
        -[NSMutableArray addObject:](v18, "addObject:", v11);

LABEL_16:
      }

      id v8 = [v6 countByEnumeratingWithState:&v95 objects:v115 count:16];
    }

    while (v8);
  }

  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
  id v24 = [v23 countByEnumeratingWithState:&v91 objects:v102 count:16];
  if (!v24) {
    goto LABEL_35;
  }
  id v25 = v24;
  uint64_t v26 = *(void *)v92;
  do
  {
    for (j = 0LL; j != v25; j = (char *)j + 1)
    {
      if (*(void *)v92 != v26) {
        objc_enumerationMutation(v23);
      }
      v28 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)j);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 assetType]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadManager pathToCatalogLookupServer:usingDownloadOptions:]( &OBJC_CLASS___DownloadManager,  "pathToCatalogLookupServer:usingDownloadOptions:",  v29,  0LL));

      if (!v30)
      {
        id v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
        unint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 oslog]);

        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v28 summary]);
          *(_DWORD *)buf = 138544642;
          __int128 v104 = v38;
          __int16 v105 = 2114;
          __int128 v106 = @">----->";
          __int16 v107 = 2114;
          id v108 = v75;
          __int16 v109 = 2114;
          __int128 v110 = @"TRIGGERED_MARKERS_NO_RETRY";
          __int16 v111 = 2114;
          v112 = v39;
          __int16 v113 = 2114;
          v114 = @"<-----<";
          _os_log_error_impl( &dword_0,  v37,  OS_LOG_TYPE_ERROR,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | unable to determine path to catalog lookup server\n #_CONNR:(%{public}@) triggeredNoRetry:%{public}@\n #_CONNR:%{public}@",  buf,  0x3Eu);
        }

LABEL_30:
        -[NSMutableArray addObject:](v78, "addObject:", v28);
        goto LABEL_33;
      }

      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 absoluteString]);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector catalogServerNetworkPathStatus](self, "catalogServerNetworkPathStatus"));
      id v33 = [v32 safeObjectForKey:v31 ofClass:objc_opt_class(NSNumber)];
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

      if (!v34) {
        goto LABEL_30;
      }
      else {
        id v35 = v77;
      }
      -[NSMutableArray addObject:](v35, "addObject:", v28);

LABEL_33:
    }

    id v25 = [v23 countByEnumeratingWithState:&v91 objects:v102 count:16];
  }

  while (v25);
LABEL_35:

  p_ivars = &MobileAssetKeyManager__metaData.ivars;
  id v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[MADAutoAssetConnector setCurrentAttemptRemainingMarkers:](self, "setCurrentAttemptRemainingMarkers:", v41);

  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  id v42 = v76;
  id v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v87,  v101,  16LL);
  if (v43)
  {
    id v44 = v43;
    id v45 = 0LL;
    uint64_t v46 = *(void *)v88;
    do
    {
      __int128 v47 = 0LL;
      __int128 v48 = v45;
      do
      {
        if (*(void *)v88 != v46) {
          objc_enumerationMutation(v42);
        }
        id v45 = *(id *)(*((void *)&v87 + 1) + 8LL * (void)v47);

        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
        [v49 addObject:v45];

        __int128 v47 = (char *)v47 + 1;
        __int128 v48 = v45;
      }

      while (v44 != v47);
      id v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v87,  v101,  16LL);
    }

    while (v44);

    p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
  }

  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  id v50 = v78;
  id v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v50,  "countByEnumeratingWithState:objects:count:",  &v83,  v100,  16LL);
  if (v51)
  {
    id v52 = v51;
    id v53 = 0LL;
    uint64_t v54 = *(void *)v84;
    do
    {
      id v55 = 0LL;
      id v56 = v53;
      do
      {
        if (*(void *)v84 != v54) {
          objc_enumerationMutation(v50);
        }
        id v53 = *(id *)(*((void *)&v83 + 1) + 8LL * (void)v55);

        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
        [v57 addObject:v53];

        id v55 = (char *)v55 + 1;
        id v56 = v53;
      }

      while (v52 != v55);
      id v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v50,  "countByEnumeratingWithState:objects:count:",  &v83,  v100,  16LL);
    }

    while (v52);

    p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
  }

  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  v58 = v77;
  id v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v58,  "countByEnumeratingWithState:objects:count:",  &v79,  v99,  16LL);
  if (v59)
  {
    id v60 = v59;
    id v61 = 0LL;
    uint64_t v62 = *(void *)v80;
    do
    {
      v63 = 0LL;
      v64 = v61;
      do
      {
        if (*(void *)v80 != v62) {
          objc_enumerationMutation(v58);
        }
        id v61 = *(id *)(*((void *)&v79 + 1) + 8LL * (void)v63);

        v65 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
        [v65 addObject:v61];

        v63 = (char *)v63 + 1;
        v64 = v61;
      }

      while (v60 != v63);
      id v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v58,  "countByEnumeratingWithState:objects:count:",  &v79,  v99,  16LL);
    }

    while (v60);

    p_ivars = &MobileAssetKeyManager__metaData.ivars;
  }

  id v66 = objc_alloc_init((Class)p_ivars[139]);
  -[MADAutoAssetConnector setTriggeredMarkersNoRetry:](self, "setTriggeredMarkersNoRetry:", v66);

  id v67 = objc_alloc_init((Class)p_ivars[139]);
  -[MADAutoAssetConnector setTriggeredMarkersRequiringRetry:](self, "setTriggeredMarkersRequiringRetry:", v67);

  -[MADAutoAssetConnector _logTriggeredMarkersCleared:](self, "_logTriggeredMarkersCleared:", v75);
  if (-[MADAutoAssetConnector _triggerNextMarker](self, "_triggerNextMarker"))
  {
    -[MADAutoAssetConnector _logCurrentAttemptRemainingMarkers:](self, "_logCurrentAttemptRemainingMarkers:", v75);
  }

  else
  {
    id v68 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{%@} unable to start first triggered job",  v75);
    id v69 = p_ivars;
    uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
    v71 = (void *)objc_claimAutoreleasedReturnValue([v70 diag]);
    [v71 trackAnomaly:@"AUTO-CONNECTOR" forReason:v68 withResult:6110 withError:0];

    -[MADAutoAssetConnector setActiveJobMarker:](self, "setActiveJobMarker:", 0LL);
    id v72 = objc_alloc_init((Class)v69[139]);
    -[MADAutoAssetConnector setCurrentAttemptRemainingMarkers:](self, "setCurrentAttemptRemainingMarkers:", v72);

    -[MADAutoAssetConnector _logClearedActiveJobAndAttemptRemainingMarkers:]( self,  "_logClearedActiveJobAndAttemptRemainingMarkers:",  v75);
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
    unsigned __int8 v74 = -[MADAutoAssetConnectorParam initWithSafeSummary:]( objc_alloc(&OBJC_CLASS___MADAutoAssetConnectorParam),  "initWithSafeSummary:",  v68);
    [v73 postEvent:@"AttemptAbandoned" withInfo:v74];
  }
}

- (BOOL)_triggerNextMarker
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);
    -[MADAutoAssetConnector setActiveJobMarker:](self, "setActiveJobMarker:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
    [v7 removeObjectAtIndex:0];

    -[MADAutoAssetConnector _logNextActiveJobForAttemptRemainingMarkers:]( self,  "_logNextActiveJobForAttemptRemainingMarkers:",  @"_triggerNextMarker");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
    LODWORD(v6) = [v8 isSetJob];

    if ((_DWORD)v6)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 setPolicy]);

      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pushedPolicy]);

      if (v12)
      {
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 pushedPolicy]);

        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
        [v15 setPushedPolicy:0];

        id v10 = (void *)v14;
      }

      id v16 = objc_alloc(&OBJC_CLASS___MADAutoSetSchedulerTriggered);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 clientDomainName]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 assetSetIdentifier]);
      id v21 = -[MADAutoSetSchedulerTriggered initForClientDomainName:forAssetSetIdentifier:withSchedulerPolicy:]( v16,  "initForClientDomainName:forAssetSetIdentifier:withSchedulerPolicy:",  v18,  v20,  v10);
      id v25 = v21;
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
      +[MADAutoAssetControlManager schedulerTriggeredSets:]( &OBJC_CLASS___MADAutoAssetControlManager,  "schedulerTriggeredSets:",  v22);
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSelector]);
      id v24 = v17;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
      +[MADAutoAssetControlManager schedulerTriggeredSelectors:]( &OBJC_CLASS___MADAutoAssetControlManager,  "schedulerTriggeredSelectors:",  v18);
    }
  }

  return v4 != 0LL;
}

- (void)_setBackoffRetryLevel:(int64_t)a3 forReason:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 extendedStateQueue]);
  dispatch_assert_queue_V2(v8);

  if (-[MADAutoAssetConnector backoffRetryLevel](self, "backoffRetryLevel") != a3)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
      int v12 = 138544898;
      __int128 v13 = v11;
      __int16 v14 = 2114;
      id v15 = @">----->";
      __int16 v16 = 2114;
      id v17 = v6;
      __int16 v18 = 2114;
      id v19 = @"BACKOFF_RETRY_LEVEL";
      __int16 v20 = 2048;
      int64_t v21 = -[MADAutoAssetConnector backoffRetryLevel](self, "backoffRetryLevel");
      __int16 v22 = 2048;
      int64_t v23 = a3;
      __int16 v24 = 2114;
      id v25 = @"<-----<";
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {_setBackoffRetryLevel} | %{public}@\n #_CONNR:(%{public}@) backoff-retry level change: %ld => %ld\n #_CONNR:%{public}@",  (uint8_t *)&v12,  0x48u);
    }

    -[MADAutoAssetConnector setBackoffRetryLevel:](self, "setBackoffRetryLevel:", a3);
  }
}

- (BOOL)_isBackoffRetryRequired:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector markersRequiringRetry](self, "markersRequiringRetry"));
  if (-[NSString count](v7, "count")) {
    goto LABEL_4;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
  if ([v8 count])
  {

LABEL_4:
    BOOL v9 = 1;
    goto LABEL_5;
  }

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersRequiringRetry](self, "triggeredMarkersRequiringRetry"));
  id v12 = [v11 count];

  if (v12)
  {
    BOOL v9 = 1;
    goto LABEL_6;
  }

  id v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{%@} no [more] backoff-retry required",  v4);
  -[MADAutoAssetConnector _setBackoffRetryLevel:forReason:](self, "_setBackoffRetryLevel:forReason:", 0LL, v7);
  BOOL v9 = 0;
LABEL_5:

LABEL_6:
  return v9;
}

- (void)_addObserverForMarker:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 assetType]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadManager pathToCatalogLookupServer:usingDownloadOptions:]( &OBJC_CLASS___DownloadManager,  "pathToCatalogLookupServer:usingDownloadOptions:",  v7,  0LL));

  if (v8)
  {
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 absoluteString]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetConnector catalogServerNetworkPathObservers]( self,  "catalogServerNetworkPathObservers"));
    id v11 = [v10 safeObjectForKey:v9 ofClass:objc_opt_class(MADAutoAssetConnectorObserver)];
    id v12 = (id)objc_claimAutoreleasedReturnValue(v11);

    if (v12)
    {
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
      __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
        int v21 = 138544642;
        __int16 v22 = v15;
        __int16 v23 = 2114;
        __int16 v24 = @">----->";
        __int16 v25 = 2114;
        uint64_t v26 = @"NETWORK_PATH_OBSERVERS";
        __int16 v27 = 2114;
        v28 = v16;
        __int16 v29 = 2114;
        id v30 = v9;
        __int16 v31 = 2114;
        uint64_t v32 = @"<-----<";
        id v17 = "%{public}@\n"
              "#_CONNR:%{public}@ {_addObserverForMarker} | additional marker for catalog lookup server already being obs"
              "erved\n"
              "#_CONNR:(%{public}@) markerToObserve:%{public}@ | pathToServer:%{public}@\n"
              "#_CONNR:%{public}@";
LABEL_9:
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v21, 0x3Eu);
      }
    }

    else
    {
      id v12 = -[MADAutoAssetConnectorObserver initForServerPath:]( objc_alloc(&OBJC_CLASS___MADAutoAssetConnectorObserver),  "initForServerPath:",  v8);
      id v19 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetConnector catalogServerNetworkPathObservers]( self,  "catalogServerNetworkPathObservers"));
      [v19 setSafeObject:v12 forKey:v9];

      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
      __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
        int v21 = 138544642;
        __int16 v22 = v15;
        __int16 v23 = 2114;
        __int16 v24 = @">----->";
        __int16 v25 = 2114;
        uint64_t v26 = @"NETWORK_PATH_OBSERVERS";
        __int16 v27 = 2114;
        v28 = v16;
        __int16 v29 = 2114;
        id v30 = v9;
        __int16 v31 = 2114;
        uint64_t v32 = @"<-----<";
        id v17 = "%{public}@\n"
              "#_CONNR:%{public}@ {_addObserverForMarker} | observing path to catalog lookup server\n"
              "#_CONNR:(%{public}@) [+] markerToObserve:%{public}@ | pathToServer:%{public}@\n"
              "#_CONNR:%{public}@";
        goto LABEL_9;
      }
    }

    goto LABEL_11;
  }

  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[MADAutoAssetConnector _addObserverForMarker:].cold.1(self, v4);
  }
LABEL_11:
}

- (void)_removeObserverForMarker:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 assetType]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadManager pathToCatalogLookupServer:usingDownloadOptions:]( &OBJC_CLASS___DownloadManager,  "pathToCatalogLookupServer:usingDownloadOptions:",  v7,  0LL));

  if (v8)
  {
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 absoluteString]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetConnector catalogServerNetworkPathObservers]( self,  "catalogServerNetworkPathObservers"));
    id v11 = [v10 safeObjectForKey:v9 ofClass:objc_opt_class(MADAutoAssetConnectorObserver)];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    if (v12)
    {
      __int16 v31 = v12;
      uint64_t v32 = v9;
      id v33 = v4;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector monitorMarkers](self, "monitorMarkers"));
      id v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v35;
        while (2)
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v34 + 1) + 8 * (void)i) assetType]);
            id v19 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadManager pathToCatalogLookupServer:usingDownloadOptions:]( &OBJC_CLASS___DownloadManager,  "pathToCatalogLookupServer:usingDownloadOptions:",  v18,  0LL));

            __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 absoluteString]);
            int v21 = (void *)objc_claimAutoreleasedReturnValue([v8 absoluteString]);
            LOBYTE(v18) = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v20,  v21);

            if ((v18 & 1) != 0)
            {
              BOOL v9 = v32;
              id v4 = v33;
              id v12 = v31;
              __int16 v24 = (os_log_s *)v13;
              goto LABEL_20;
            }
          }

          id v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetConnector catalogServerNetworkPathObservers]( self,  "catalogServerNetworkPathObservers"));
      BOOL v9 = v32;
      [v22 removeObjectForKey:v32];

      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
      __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
        id v4 = v33;
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v33 summary]);
        *(_DWORD *)buf = 138544642;
        id v40 = v25;
        __int16 v41 = 2114;
        id v42 = @">----->";
        __int16 v43 = 2114;
        id v44 = @"NETWORK_PATH_OBSERVERS";
        __int16 v45 = 2114;
        uint64_t v46 = v26;
        __int16 v47 = 2114;
        __int128 v48 = v32;
        __int16 v49 = 2114;
        id v50 = @"<-----<";
        _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {_removeObserverForMarker} | no longer observing path to catalog lookup server\n #_CONNR:(%{public}@) [-] markerToRemove:%{public}@ | pathToServer:%{public}@\n #_CONNR:%{public}@",  buf,  0x3Eu);
      }

      else
      {
        id v4 = v33;
      }

      id v12 = v31;
    }

    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
      __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 oslog]);

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
        *(_DWORD *)buf = 138544642;
        id v40 = v29;
        __int16 v41 = 2114;
        id v42 = @">----->";
        __int16 v43 = 2114;
        id v44 = @"NETWORK_PATH_OBSERVERS";
        __int16 v45 = 2114;
        uint64_t v46 = v30;
        __int16 v47 = 2114;
        __int128 v48 = v9;
        __int16 v49 = 2114;
        id v50 = @"<-----<";
        _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {_removeObserverForMarker} | marker for catalog lookup server was not being observed\n #_CONNR:(%{public}@) markerToRemove:%{public}@ | pathToServer:%{public}@\n #_CONNR:%{public}@",  buf,  0x3Eu);
      }
    }

- (void)_trackServerUp:(id)a3 fromLocation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 absoluteString]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector catalogServerNetworkPathObservers](self, "catalogServerNetworkPathObservers"));
  id v12 = [v11 safeObjectForKey:v10 ofClass:objc_opt_class(MADAutoAssetConnectorObserver)];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13)
  {
    id v14 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", 2LL);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector catalogServerNetworkPathStatus](self, "catalogServerNetworkPathStatus"));
    [v15 setSafeObject:v14 forKey:v10];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
      int v21 = 138544642;
      __int16 v22 = v18;
      __int16 v23 = 2114;
      __int16 v24 = @">----->";
      __int16 v25 = 2114;
      id v26 = v6;
      __int16 v27 = 2114;
      v28 = @"NETWORK_PATH_OBSERVERS";
      __int16 v29 = 2114;
      id v30 = v10;
      __int16 v31 = 2114;
      uint64_t v32 = @"<-----<";
      _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | observed path to catalog lookup server now UP\n #_CONNR:(%{public}@) observedNetworkPath:%{public}@ | UP\n #_CONNR:%{public}@",  (uint8_t *)&v21,  0x3Eu);
    }
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 diag]);
    [v20 trackAnomaly:@"AUTO-CONNECTOR" forReason:@"{_trackServerUp} network path observer is missing" withResult:6103 withError:0];
  }
}

- (void)_trackServerDown:(id)a3 fromLocation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 absoluteString]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector catalogServerNetworkPathObservers](self, "catalogServerNetworkPathObservers"));
  id v12 = [v11 safeObjectForKey:v10 ofClass:objc_opt_class(MADAutoAssetConnectorObserver)];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13)
  {
    id v14 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", 1LL);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector catalogServerNetworkPathStatus](self, "catalogServerNetworkPathStatus"));
    [v15 setSafeObject:v14 forKey:v10];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
      int v21 = 138544642;
      __int16 v22 = v18;
      __int16 v23 = 2114;
      __int16 v24 = @">----->";
      __int16 v25 = 2114;
      id v26 = v6;
      __int16 v27 = 2114;
      v28 = @"NETWORK_PATH_STATUS";
      __int16 v29 = 2114;
      id v30 = v10;
      __int16 v31 = 2114;
      uint64_t v32 = @"<-----<";
      _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | observed path to catalog lookup server now DOWN\n #_CONNR:(%{public}@) observedNetworkPath:%{public}@ | DOWN\n #_CONNR:%{public}@",  (uint8_t *)&v21,  0x3Eu);
    }
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 diag]);
    [v20 trackAnomaly:@"AUTO-CONNECTOR" forReason:@"{_trackServerDown} network path observer is missing" withResult:6103 withError:0];
  }
}

- (BOOL)_isPathToServerForMarkerUp:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 assetType]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadManager pathToCatalogLookupServer:usingDownloadOptions:]( &OBJC_CLASS___DownloadManager,  "pathToCatalogLookupServer:usingDownloadOptions:",  v7,  0LL));

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 absoluteString]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector catalogServerNetworkPathStatus](self, "catalogServerNetworkPathStatus"));
  id v11 = [v10 safeObjectForKey:v9 ofClass:objc_opt_class(NSNumber)];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12) {
    BOOL v13 = [v12 integerValue] == (char *)&dword_0 + 2;
  }
  else {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_isAnyServerUpForJobsToBeAttempted:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM", a3));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector markersRequiringRetry](self, "markersRequiringRetry"));
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v6);
      }
      if (-[MADAutoAssetConnector _isPathToServerForMarkerUp:]( self,  "_isPathToServerForMarkerUp:",  *(void *)(*((void *)&v21 + 1) + 8 * v10)))
      {
        goto LABEL_18;
      }

      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry", 0LL));
  id v11 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
LABEL_11:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(v6);
      }
      if (-[MADAutoAssetConnector _isPathToServerForMarkerUp:]( self,  "_isPathToServerForMarkerUp:",  *(void *)(*((void *)&v17 + 1) + 8 * v14)))
      {
        break;
      }

      if (v12 == (id)++v14)
      {
        id v12 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v12) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }

- (id)_followupInUseServerStatus:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assetType]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadManager pathToCatalogLookupServer:usingDownloadOptions:]( &OBJC_CLASS___DownloadManager,  "pathToCatalogLookupServer:usingDownloadOptions:",  v9,  0LL));

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 absoluteString]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector catalogServerNetworkPathStatus](self, "catalogServerNetworkPathStatus"));
      id v13 = [v12 safeObjectForKey:v11 ofClass:objc_opt_class(NSNumber)];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

      BOOL v15 = @"InUseServerDown";
    }

    else
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MADAutoAssetConnector _followupInUseServerStatus:].cold.1(self, (uint64_t)v4, v17);
      }

      BOOL v15 = @"InUseServerDown";
    }
  }

  else
  {
    BOOL v15 = @"InUseServerDown";
  }

  return (id)v15;
}

- (void)_issueFollowupApplicableServersUpDown:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  LODWORD(v4) = -[MADAutoAssetConnector _isAnyServerUpForJobsToBeAttempted:]( self,  "_isAnyServerUpForJobsToBeAttempted:",  v9);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v7 = -[MADAutoAssetConnectorParam initWithSafeSummary:]( objc_alloc(&OBJC_CLASS___MADAutoAssetConnectorParam),  "initWithSafeSummary:",  v9);
  if ((_DWORD)v4) {
    id v8 = @"ApplicableServersUp";
  }
  else {
    id v8 = @"ApplicableServersDown";
  }
  [v6 followupEvent:v8 withInfo:v7];
}

- (id)_startTimer:(id)a3 ofTimerCategory:(id)a4 forOneShotSecs:(int64_t)a5 withFiredMessage:(id)a6 postingEvent:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  __int128 v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 extendedStateQueue]);
  dispatch_assert_queue_V2(v17);

  __int16 v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472LL;
  __int16 v29 = __98__MADAutoAssetConnector__startTimer_ofTimerCategory_forOneShotSecs_withFiredMessage_postingEvent___block_invoke;
  id v30 = &unk_34DC30;
  __int128 v18 = (__CFString *)v14;
  __int16 v31 = v18;
  id v19 = v15;
  id v32 = v19;
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:repeats:block:",  0LL,  &v27,  (double)a5));
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger", v27, v28, v29, v30));
  __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 oslog]);

  if (v20)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
      __int128 v24 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  a5);
      *(_DWORD *)buf = 138544898;
      __int128 v34 = v23;
      __int16 v35 = 2114;
      __int128 v36 = @">----->";
      __int16 v37 = 2114;
      id v38 = v12;
      __int16 v39 = 2114;
      id v40 = v13;
      __int16 v41 = 2114;
      id v42 = v24;
      __int16 v43 = 2114;
      id v44 = v18;
      __int16 v45 = 2114;
      uint64_t v46 = @"<-----<";
      _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@}\n #_CONNR:(%{public}@) [+] timer started (%{public}@) [%{public}@]\n #_CONNR:%{public}@",  buf,  0x48u);
    }

    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    -[os_log_s addTimer:forMode:](v22, "addTimer:forMode:", v20, NSDefaultRunLoopMode);
  }

  else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    *(_DWORD *)buf = 138544642;
    __int128 v34 = v26;
    __int16 v35 = 2114;
    __int128 v36 = @">----->";
    __int16 v37 = 2114;
    id v38 = v12;
    __int16 v39 = 2114;
    id v40 = v13;
    __int16 v41 = 2114;
    id v42 = v18;
    __int16 v43 = 2114;
    id v44 = @"<-----<";
    _os_log_error_impl( &dword_0,  v22,  OS_LOG_TYPE_ERROR,  "%{public}@\n #_CONNR:%{public}@ {%{public}@}\n #_CONNR:(%{public}@) unable to start timer [%{public}@]\n #_CONNR:%{public}@",  buf,  0x3Eu);
  }

  return v20;
}

void __98__MADAutoAssetConnector__startTimer_ofTimerCategory_forOneShotSecs_withFiredMessage_postingEvent___block_invoke( uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MADAutoAssetConnector autoAssetConnector](&OBJC_CLASS___MADAutoAssetConnector, "autoAssetConnector"));
  uint64_t v2 = -[MADAutoAssetConnectorParam initWithSafeSummary:]( objc_alloc(&OBJC_CLASS___MADAutoAssetConnectorParam),  "initWithSafeSummary:",  *(void *)(a1 + 32));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 autoConnectorFSM]);
  [v3 postEvent:*(void *)(a1 + 40) withInfo:v2];
}

- (void)_stoppedTimer:(id)a3 ofTimerCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    int v13 = 138544386;
    id v14 = v12;
    __int16 v15 = 2114;
    uint64_t v16 = @">----->";
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2114;
    id v20 = v7;
    __int16 v21 = 2114;
    __int128 v22 = @"<-----<";
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n#_CONNR:%{public}@ {%{public}@}\n#_CONNR:(%{public}@) [-] timer stopped\n#_CONNR:%{public}@",  (uint8_t *)&v13,  0x34u);
  }
}

- (void)_firedTimer:(id)a3 ofTimerCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    int v13 = 138544386;
    id v14 = v12;
    __int16 v15 = 2114;
    uint64_t v16 = @">----->";
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2114;
    id v20 = v7;
    __int16 v21 = 2114;
    __int128 v22 = @"<-----<";
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n#_CONNR:%{public}@ {%{public}@}\n#_CONNR:(%{public}@) [!] timer fired\n#_CONNR:%{public}@",  (uint8_t *)&v13,  0x34u);
  }
}

- (void)_logMarkersBeingMonitored:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector monitorMarkers](self, "monitorMarkers"));
  id v8 = (const __CFString *)[v7 count];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector monitorMarkers](self, "monitorMarkers"));
    *(_DWORD *)buf = 138544386;
    __int128 v23 = v11;
    __int16 v24 = 2114;
    __int16 v25 = @">----->";
    __int16 v26 = 2114;
    __int16 v27 = v4;
    __int16 v28 = 2114;
    __int16 v29 = @"MONITORED_MARKERS";
    __int16 v30 = 2048;
    id v31 = [v12 count];
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | all markers being monitored\n #_CONNR:(%{public}@) monitorMarkers:%ld",  buf,  0x34u);
  }

  if ((uint64_t)v8 >= 1)
  {
    int v13 = 0LL;
    do
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector monitorMarkers](self, "monitorMarkers"));
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndex:v13]);

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

      int v13 = (const __CFString *)((char *)v13 + 1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 summary]);
        *(_DWORD *)buf = 138544130;
        __int128 v23 = @"MONITORED_MARKERS";
        __int16 v24 = 2048;
        __int16 v25 = v13;
        __int16 v26 = 2048;
        __int16 v27 = v8;
        __int16 v28 = 2114;
        __int16 v29 = v18;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "\n#_CONNR:(%{public}@) %ld of %ld | monitorMarker:%{public}@",  buf,  0x2Au);
      }
    }

    while (v13 != v8);
  }

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    *(_DWORD *)buf = 138543618;
    __int128 v23 = v21;
    __int16 v24 = 2114;
    __int16 v25 = @"<-----<";
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "%{public}@\n#_CONNR:%{public}@", buf, 0x16u);
  }
}

- (void)_logMarkersRequiringRetry:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector markersRequiringRetry](self, "markersRequiringRetry"));
  id v8 = (const __CFString *)[v7 count];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector markersRequiringRetry](self, "markersRequiringRetry"));
    *(_DWORD *)buf = 138544386;
    __int128 v23 = v11;
    __int16 v24 = 2114;
    __int16 v25 = @">----->";
    __int16 v26 = 2114;
    __int16 v27 = v4;
    __int16 v28 = 2114;
    __int16 v29 = @"MARKERS_REQUIRING_RETRY";
    __int16 v30 = 2048;
    id v31 = [v12 count];
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n#_CONNR:%{public}@ {%{public}@} | all requiring retry\n#_CONNR:(%{public}@) requiringRetry:%ld",  buf,  0x34u);
  }

  if ((uint64_t)v8 >= 1)
  {
    int v13 = 0LL;
    do
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector markersRequiringRetry](self, "markersRequiringRetry"));
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndex:v13]);

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

      int v13 = (const __CFString *)((char *)v13 + 1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 summary]);
        *(_DWORD *)buf = 138544130;
        __int128 v23 = @"MARKERS_REQUIRING_RETRY";
        __int16 v24 = 2048;
        __int16 v25 = v13;
        __int16 v26 = 2048;
        __int16 v27 = v8;
        __int16 v28 = 2114;
        __int16 v29 = v18;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "\n#_CONNR:(%{public}@) %ld of %ld | requiringRetry:%{public}@",  buf,  0x2Au);
      }
    }

    while (v13 != v8);
  }

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    *(_DWORD *)buf = 138543618;
    __int128 v23 = v21;
    __int16 v24 = 2114;
    __int16 v25 = @"<-----<";
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "%{public}@\n#_CONNR:%{public}@", buf, 0x16u);
  }
}

- (void)_logMarkerRequiringRetry:(id)a3 addedMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector markersRequiringRetry](self, "markersRequiringRetry"));
    int v15 = 138544898;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    id v18 = @">----->";
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    __int128 v22 = @"MARKERS_REQUIRING_RETRY";
    __int16 v23 = 2114;
    __int16 v24 = v13;
    __int16 v25 = 2048;
    id v26 = [v14 count];
    __int16 v27 = 2114;
    __int16 v28 = @"<-----<";
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | marker just added to the set requiring retry\n #_CONNR:(%{public}@) [+] addedMarker:%{public}@ | markersRequiringRetry:%ld\n #_CONNR:%{public}@",  (uint8_t *)&v15,  0x48u);
  }
}

- (void)_logMarkerRequiringRetry:(id)a3 removedMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector markersRequiringRetry](self, "markersRequiringRetry"));
    int v15 = 138544898;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    id v18 = @">----->";
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    __int128 v22 = @"MARKERS_REQUIRING_RETRY";
    __int16 v23 = 2114;
    __int16 v24 = v13;
    __int16 v25 = 2048;
    id v26 = [v14 count];
    __int16 v27 = 2114;
    __int16 v28 = @"<-----<";
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | marker just removed from the set requiring retry\n #_CONNR:(%{public}@) [-] removedMarker:%{public}@ | markersRequiringRetry:%ld\n #_CONNR:%{public}@",  (uint8_t *)&v15,  0x48u);
  }
}

- (void)_logTriggeredMarkersNoRetry:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
  id v8 = (const __CFString *)[v7 count];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
    *(_DWORD *)buf = 138544386;
    __int16 v23 = v11;
    __int16 v24 = 2114;
    __int16 v25 = @">----->";
    __int16 v26 = 2114;
    __int16 v27 = v4;
    __int16 v28 = 2114;
    __int16 v29 = @"TRIGGERED_MARKERS_NO_RETRY";
    __int16 v30 = 2048;
    id v31 = [v12 count];
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | all triggered (which do not require retry)\n #_CONNR:(%{public}@) triggeredNoRetry:%ld",  buf,  0x34u);
  }

  if ((uint64_t)v8 >= 1)
  {
    int v13 = 0LL;
    do
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
      int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndex:v13]);

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

      int v13 = (const __CFString *)((char *)v13 + 1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 summary]);
        *(_DWORD *)buf = 138544130;
        __int16 v23 = @"TRIGGERED_MARKERS_NO_RETRY";
        __int16 v24 = 2048;
        __int16 v25 = v13;
        __int16 v26 = 2048;
        __int16 v27 = v8;
        __int16 v28 = 2114;
        __int16 v29 = v18;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "\n#_CONNR:(%{public}@) %ld of %ld | triggeredNoRetry:%{public}@",  buf,  0x2Au);
      }
    }

    while (v13 != v8);
  }

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    *(_DWORD *)buf = 138543618;
    __int16 v23 = v21;
    __int16 v24 = 2114;
    __int16 v25 = @"<-----<";
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "%{public}@\n#_CONNR:%{public}@", buf, 0x16u);
  }
}

- (void)_logTriggeredMarkerNoRetry:(id)a3 addedMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
    int v15 = 138544898;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    id v18 = @">----->";
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    __int128 v22 = @"TRIGGERED_MARKERS_NO_RETRY";
    __int16 v23 = 2114;
    __int16 v24 = v13;
    __int16 v25 = 2048;
    id v26 = [v14 count];
    __int16 v27 = 2114;
    __int16 v28 = @"<-----<";
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | marker just added to triggered (which do not require retry)\n #_CONNR:(%{public}@) [+] addedMarker:%{public}@ | triggeredNoRetry:%ld\n #_CONNR:%{public}@",  (uint8_t *)&v15,  0x48u);
  }
}

- (void)_logTriggeredMarkerNoRetry:(id)a3 removedMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
    int v15 = 138544898;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    id v18 = @">----->";
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    __int128 v22 = @"TRIGGERED_MARKERS_NO_RETRY";
    __int16 v23 = 2114;
    __int16 v24 = v13;
    __int16 v25 = 2048;
    id v26 = [v14 count];
    __int16 v27 = 2114;
    __int16 v28 = @"<-----<";
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | marker just removed from triggered (which do not require retry)\n #_CONNR:(%{public}@) [-] removedMarker:%{public}@ | triggeredNoRetry:%ld\n #_CONNR:%{public}@",  (uint8_t *)&v15,  0x48u);
  }
}

- (void)_logTriggeredMarkersRequiringRetry:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersRequiringRetry](self, "triggeredMarkersRequiringRetry"));
  id v8 = (const __CFString *)[v7 count];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersRequiringRetry](self, "triggeredMarkersRequiringRetry"));
    *(_DWORD *)buf = 138544386;
    __int16 v23 = v11;
    __int16 v24 = 2114;
    __int16 v25 = @">----->";
    __int16 v26 = 2114;
    __int16 v27 = v4;
    __int16 v28 = 2114;
    __int16 v29 = @"TRIGGERED_MARKERS_REQUIRING_RETRY";
    __int16 v30 = 2048;
    id v31 = [v12 count];
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | all triggered (which require retry)\n #_CONNR:(%{public}@) triggeredRequiringRetry:%ld",  buf,  0x34u);
  }

  if ((uint64_t)v8 >= 1)
  {
    int v13 = 0LL;
    do
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersRequiringRetry](self, "triggeredMarkersRequiringRetry"));
      int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndex:v13]);

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

      int v13 = (const __CFString *)((char *)v13 + 1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 summary]);
        *(_DWORD *)buf = 138544130;
        __int16 v23 = @"TRIGGERED_MARKERS_REQUIRING_RETRY";
        __int16 v24 = 2048;
        __int16 v25 = v13;
        __int16 v26 = 2048;
        __int16 v27 = v8;
        __int16 v28 = 2114;
        __int16 v29 = v18;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "\n#_CONNR:(%{public}@) %ld of %ld | triggeredRequiringRetry:%{public}@",  buf,  0x2Au);
      }
    }

    while (v13 != v8);
  }

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    *(_DWORD *)buf = 138543618;
    __int16 v23 = v21;
    __int16 v24 = 2114;
    __int16 v25 = @"<-----<";
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "%{public}@\n#_CONNR:%{public}@", buf, 0x16u);
  }
}

- (void)_logTriggeredMarkerRequiringRetry:(id)a3 addedMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersRequiringRetry](self, "triggeredMarkersRequiringRetry"));
    int v15 = 138544898;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    id v18 = @">----->";
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    __int128 v22 = @"TRIGGERED_MARKERS_REQUIRING_RETRY";
    __int16 v23 = 2114;
    __int16 v24 = v13;
    __int16 v25 = 2048;
    id v26 = [v14 count];
    __int16 v27 = 2114;
    __int16 v28 = @"<-----<";
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | marker just added to triggered (which require retry)\n #_CONNR:(%{public}@) [+] addedMarker:%{public}@ | triggeredMarkersRequiringRetry:%ld\n #_CONNR:%{public}@",  (uint8_t *)&v15,  0x48u);
  }
}

- (void)_logTriggeredMarkerRequiringRetry:(id)a3 removedMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersRequiringRetry](self, "triggeredMarkersRequiringRetry"));
    int v15 = 138544898;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    id v18 = @">----->";
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    __int128 v22 = @"TRIGGERED_MARKERS_REQUIRING_RETRY";
    __int16 v23 = 2114;
    __int16 v24 = v13;
    __int16 v25 = 2048;
    id v26 = [v14 count];
    __int16 v27 = 2114;
    __int16 v28 = @"<-----<";
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | marker just removed from triggered (which require retry)\n #_CONNR:(%{public}@) [-] removedMarker:%{public}@ | triggeredMarkersRequiringRetry:%ld\n #_CONNR:%{public}@",  (uint8_t *)&v15,  0x48u);
  }
}

- (void)_logTriggeredMarkersCleared:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
    id v11 = [v10 count];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersRequiringRetry](self, "triggeredMarkersRequiringRetry"));
    int v13 = 138545154;
    id v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = @">----->";
    __int16 v17 = 2114;
    id v18 = v4;
    __int16 v19 = 2114;
    id v20 = @"TRIGGERED_MARKERS_NO_RETRY";
    __int16 v21 = 2048;
    id v22 = v11;
    __int16 v23 = 2114;
    __int16 v24 = @"TRIGGERED_MARKERS_REQUIRING_RETRY";
    __int16 v25 = 2048;
    id v26 = [v12 count];
    __int16 v27 = 2114;
    __int16 v28 = @"<-----<";
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | triggered markers cleared (all now part of current attempt set)\n #_CONNR:(%{public}@) [!] triggeredMarkersNoRetry:%ld\n #_CONNR:(%{public}@) [!] triggeredMarkersRequiringRetry:%ld\n #_CONNR:%{public}@",  (uint8_t *)&v13,  0x52u);
  }
}

- (void)_logCurrentAttemptRemainingMarkers:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
  id v8 = (const __CFString *)[v7 count];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
    *(_DWORD *)buf = 138544386;
    __int16 v23 = v11;
    __int16 v24 = 2114;
    __int16 v25 = @">----->";
    __int16 v26 = 2114;
    __int16 v27 = v4;
    __int16 v28 = 2114;
    __int16 v29 = @"CURRENT_ATTEMPT_REMAINING_MARKERS";
    __int16 v30 = 2048;
    id v31 = [v12 count];
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | markers for next attempt determined\n #_CONNR:(%{public}@) currentAttemptRemainingMarkers:%ld",  buf,  0x34u);
  }

  if ((uint64_t)v8 >= 1)
  {
    int v13 = 0LL;
    do
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndex:v13]);

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

      int v13 = (const __CFString *)((char *)v13 + 1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 summary]);
        *(_DWORD *)buf = 138544130;
        __int16 v23 = @"CURRENT_ATTEMPT_REMAINING_MARKERS";
        __int16 v24 = 2048;
        __int16 v25 = v13;
        __int16 v26 = 2048;
        __int16 v27 = v8;
        __int16 v28 = 2114;
        __int16 v29 = v18;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "\n#_CONNR:(%{public}@) %ld of %ld | currentAttemptRemainingMarker:%{public}@",  buf,  0x2Au);
      }
    }

    while (v13 != v8);
  }

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    *(_DWORD *)buf = 138543618;
    __int16 v23 = v21;
    __int16 v24 = 2114;
    __int16 v25 = @"<-----<";
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "%{public}@\n#_CONNR:%{public}@", buf, 0x16u);
  }
}

- (void)_logClearedActiveJobMarker:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    int v10 = 138544386;
    id v11 = v9;
    __int16 v12 = 2114;
    int v13 = @">----->";
    __int16 v14 = 2114;
    id v15 = v4;
    __int16 v16 = 2114;
    __int16 v17 = @"ACTIVE_MARKER";
    __int16 v18 = 2114;
    __int16 v19 = @"<-----<";
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n#_CONNR:%{public}@ {%{public}@}\n#_CONNR:(%{public}@) activeJobMarker:NONE\n#_CONNR:%{public}@",  (uint8_t *)&v10,  0x34u);
  }
}

- (void)_logClearedAttemptRemainingMarkers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    int v10 = 138544386;
    id v11 = v9;
    __int16 v12 = 2114;
    int v13 = @">----->";
    __int16 v14 = 2114;
    id v15 = v4;
    __int16 v16 = 2114;
    __int16 v17 = @"CURRENT_ATTEMPT_REMAINING_MARKERS";
    __int16 v18 = 2114;
    __int16 v19 = @"<-----<";
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@}\n #_CONNR:(%{public}@) currentAttemptRemainingMarkers:NONE\n #_CONNR:%{public}@",  (uint8_t *)&v10,  0x34u);
  }
}

- (void)_logClearedActiveJobAndAttemptRemainingMarkers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    int v10 = 138544386;
    id v11 = v9;
    __int16 v12 = 2114;
    int v13 = @">----->";
    __int16 v14 = 2114;
    id v15 = v4;
    __int16 v16 = 2114;
    __int16 v17 = @"CURRENT_ATTEMPT_REMAINING_MARKERS";
    __int16 v18 = 2114;
    __int16 v19 = @"<-----<";
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@}\n #_CONNR:(%{public}@) activeJobMarker:NONE | currentAttemptRemainingMarkers:NONE\n #_CONNR:%{public}@",  (uint8_t *)&v10,  0x34u);
  }
}

- (void)_logNextActiveJobForAttemptRemainingMarkers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector logger](self, "logger"));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector _updateLatestSummary](self, "_updateLatestSummary"));
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
    int v13 = 138544898;
    __int16 v14 = v9;
    __int16 v15 = 2114;
    __int16 v16 = @">----->";
    __int16 v17 = 2114;
    id v18 = v4;
    __int16 v19 = 2114;
    id v20 = @"CURRENT_ATTEMPT_REMAINING_MARKERS";
    __int16 v21 = 2114;
    id v22 = v11;
    __int16 v23 = 2048;
    id v24 = [v12 count];
    __int16 v25 = 2114;
    __int16 v26 = @"<-----<";
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | advanced to next marker\n #_CONNR:(%{public}@) [~] activeJobMarker:%{public}@ | currentAttemptRemainingMarkers:%ld\n #_CONNR:%{public}@",  (uint8_t *)&v13,  0x48u);
  }
}

- (id)summary
{
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector monitorMarkers](self, "monitorMarkers"));
  id v16 = [v18 count];
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector markersRequiringRetry](self, "markersRequiringRetry"));
  id v15 = [v17 count];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersNoRetry](self, "triggeredMarkersNoRetry"));
  id v4 = [v3 count];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector triggeredMarkersRequiringRetry](self, "triggeredMarkersRequiringRetry"));
  id v6 = [v5 count];
  int64_t v7 = -[MADAutoAssetConnector backoffRetryLevel](self, "backoffRetryLevel");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector catalogServerNetworkPathObservers](self, "catalogServerNetworkPathObservers"));
  id v9 = [v8 count];
  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector activeJobMarker](self, "activeJobMarker"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector currentAttemptRemainingMarkers](self, "currentAttemptRemainingMarkers"));
  int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"[monitor:%ld,requiringRetry:%ld|triggered(noRetry:%ld,retryRequired:%ld)|backoffLevel:%ld|observers:%ld|attempt(activeMarker:%@,remaining:%ld)]",  v16,  v15,  v4,  v6,  v7,  v9,  v11,  [v12 count]));

  return v13;
}

- (id)_updateLatestSummary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector autoConnectorFSM](self, "autoConnectorFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnector summary](self, "summary"));
  -[MADAutoAssetConnector setLatestSafeSummary:](self, "setLatestSafeSummary:", v5);

  return -[MADAutoAssetConnector latestSafeSummary](self, "latestSafeSummary");
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (SUCoreFSM)autoConnectorFSM
{
  return self->_autoConnectorFSM;
}

- (void)setAutoConnectorFSM:(id)a3
{
}

- (NSString)latestSafeSummary
{
  return self->_latestSafeSummary;
}

- (void)setLatestSafeSummary:(id)a3
{
}

- (NSMutableArray)monitorMarkers
{
  return self->_monitorMarkers;
}

- (void)setMonitorMarkers:(id)a3
{
}

- (NSMutableArray)markersRequiringRetry
{
  return self->_markersRequiringRetry;
}

- (void)setMarkersRequiringRetry:(id)a3
{
}

- (NSMutableArray)triggeredMarkersNoRetry
{
  return self->_triggeredMarkersNoRetry;
}

- (void)setTriggeredMarkersNoRetry:(id)a3
{
}

- (NSMutableArray)triggeredMarkersRequiringRetry
{
  return self->_triggeredMarkersRequiringRetry;
}

- (void)setTriggeredMarkersRequiringRetry:(id)a3
{
}

- (NSTimer)initialWaitTimer
{
  return self->_initialWaitTimer;
}

- (void)setInitialWaitTimer:(id)a3
{
}

- (int64_t)backoffRetryLevel
{
  return self->_backoffRetryLevel;
}

- (void)setBackoffRetryLevel:(int64_t)a3
{
  self->_backoffRetryLevel = a3;
}

- (NSTimer)backoffRetryTimer
{
  return self->_backoffRetryTimer;
}

- (void)setBackoffRetryTimer:(id)a3
{
}

- (NSTimer)waitBeforeRetryTimer
{
  return self->_waitBeforeRetryTimer;
}

- (void)setWaitBeforeRetryTimer:(id)a3
{
}

- (NSMutableDictionary)catalogServerNetworkPathObservers
{
  return self->_catalogServerNetworkPathObservers;
}

- (void)setCatalogServerNetworkPathObservers:(id)a3
{
}

- (NSMutableDictionary)catalogServerNetworkPathStatus
{
  return self->_catalogServerNetworkPathStatus;
}

- (void)setCatalogServerNetworkPathStatus:(id)a3
{
}

- (MADMarker)activeJobMarker
{
  return self->_activeJobMarker;
}

- (void)setActiveJobMarker:(id)a3
{
}

- (NSMutableArray)currentAttemptRemainingMarkers
{
  return self->_currentAttemptRemainingMarkers;
}

- (void)setCurrentAttemptRemainingMarkers:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
}

+ (void)resumeMonitoringMarkers:withMarkersRequiringRetry:.cold.1()
{
}

+ (void)alteredMonitoringMarkers:withTriggeredNoRetry:withTriggeredRequiringRetry:.cold.1()
{
}

+ (void)scheduledMarkerFinished:withPotentialNetworkFailure:.cold.1()
{
}

+ (void)observedNetworkPathToServerUp:.cold.1()
{
}

+ (void)observedNetworkPathToServerDown:.cold.1()
{
}

- (void)_addObserverForMarker:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _updateLatestSummary]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 summary]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3( &dword_0,  v5,  v6,  "%{public}@\n #_CONNR:%{public}@ {_addObserverForMarker} | unable to determine path to catalog lookup server\n #_CONNR:(%{public}@) markerToObserve:%{public}@\n #_CONNR:%{public}@",  v7,  v8,  v9,  v10,  2u);

  OUTLINED_FUNCTION_4();
}

- (void)_removeObserverForMarker:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _updateLatestSummary]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 summary]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3( &dword_0,  v5,  v6,  "%{public}@\n #_CONNR:%{public}@ {_removeObserverForMarker} | unable to determine path to catalog lookup server\n #_CONNR:(%{public}@) markerToRemove:%{public}@\n #_CONNR:%{public}@",  v7,  v8,  v9,  v10,  2u);

  OUTLINED_FUNCTION_4();
}

- (void)_followupInUseServerStatus:(os_log_s *)a3 .cold.1(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _updateLatestSummary]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 activeJobMarker]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
  int v9 = 138544642;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  __int16 v12 = @">----->";
  __int16 v13 = 2114;
  uint64_t v14 = a2;
  __int16 v15 = 2114;
  id v16 = @"ACTIVE_MARKER";
  __int16 v17 = 2114;
  id v18 = v8;
  __int16 v19 = 2114;
  id v20 = @"<-----<";
  _os_log_error_impl( &dword_0,  a3,  OS_LOG_TYPE_ERROR,  "%{public}@\n #_CONNR:%{public}@ {%{public}@} | unable to determine path to catalog lookup server\n #_CONNR:(%{public}@) activeJobMarker:%{public}@\n #_CONNR:%{public}@",  (uint8_t *)&v9,  0x3Eu);
}

@end