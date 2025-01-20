@interface SystemDiagnostic
+ (BOOL)_runBlock:(id)a3 withTimeout:(double)a4;
- (BOOL)_processIsTargeted:(id)a3;
- (BOOL)canDisplayTarBall;
- (BOOL)coSysdiagnoseOnly;
- (BOOL)deShowFeedback;
- (BOOL)didComplete;
- (BOOL)disableStreamTar;
- (BOOL)disableUIFeedback;
- (BOOL)earlyPrompt;
- (BOOL)generatePlist;
- (BOOL)isDeviceUnlockedSinceBoot;
- (BOOL)isPromptEligible;
- (BOOL)isTestingMode;
- (BOOL)logCollectionContainer:(id)a3 shouldContinueAfterEncounteringError:(id)a4 path:(id)a5;
- (BOOL)mailIsTargeted;
- (BOOL)makeOutputDirectory;
- (BOOL)makeTargetDirectory:(id)a3;
- (BOOL)prepareOutput;
- (BOOL)prepareOutputDirectory;
- (BOOL)preparePaths;
- (BOOL)previouslyRunningInstancesOfDiagnostic;
- (BOOL)quickMode;
- (BOOL)safariIsTargeted;
- (BOOL)shouldCreateTarBall;
- (BOOL)shouldDisplayTarBall;
- (BOOL)shouldGetFeedbackData;
- (BOOL)shouldPostProcess;
- (BOOL)shouldRemoveTemporaryDirectory;
- (BOOL)shouldRunIDSDump;
- (BOOL)shouldRunLogCopyTasks;
- (BOOL)shouldRunLogGenerationTasks;
- (BOOL)shouldRunOSLogArchive;
- (BOOL)shouldRunTimeSensitiveTasks;
- (BOOL)shouldStreamToTar;
- (BOOL)useParallelCompression;
- (BOOL)verbose;
- (BOOL)waitUntilComplete:(unint64_t)a3;
- (NSArray)onlyRunContainersWithNames;
- (NSArray)targetPIDs;
- (NSDate)oldestDateCreatedCutoff;
- (NSDate)startDiagnosticTime;
- (NSDictionary)capOverride;
- (NSDictionary)overrideContainers;
- (NSFileHandle)summaryHandle;
- (NSMutableArray)pidIndices;
- (NSMutableDictionary)executedContainers;
- (NSMutableDictionary)metricsDict;
- (NSNumber)totalTime;
- (NSString)archiveName;
- (NSString)baseDirectory;
- (NSString)brctl_dir;
- (NSString)changedDiagnosticProperties;
- (NSString)completedOutputDirectory;
- (NSString)completedTarballPath;
- (NSString)defaultBaseDirectory;
- (NSString)diagnosticID;
- (NSString)frontmostBundleID;
- (NSString)outputDirectory;
- (NSString)providedPIDorProcess;
- (NSString)remoteSysdiagnoseID;
- (NSString)rootPath;
- (NSString)tarballPath;
- (NSString)tmpOutputDirectory;
- (NSString)warnProcessAllowlist;
- (OS_dispatch_group)completionDispatchGroup;
- (OS_xpc_object)coSysdiagnoseParameters;
- (SDArchive)archive;
- (SystemDiagnostic)init;
- (__sFILE)summaryFD;
- (id)_copyAccessibilityPreferences;
- (id)_copyAppInstallationLogsContainer;
- (id)_copyAstroLogsContainer;
- (id)_copyBTLogsContainer;
- (id)_copyCompanionSyncContainer;
- (id)_copyCoreCaptureBTLogsContainer;
- (id)_copyHangTracerTailspinsContainer;
- (id)_copyMCLogs;
- (id)_copyMobileActivationLogsContainer;
- (id)_copyMobileAssetHistoryLogs;
- (id)_copyMobileInstallationLogsContainer;
- (id)_copyNanoPreferencesSyncLogs;
- (id)_copyOnDemandDaemonLogsContainer;
- (id)_copyParsecdBagLogs;
- (id)_copyProxiedDeviceCrashLogsContainer;
- (id)_copySentryPlistsContainer;
- (id)_copySiriAnalyticsDB;
- (id)_copySiriLogsContainer;
- (id)_copySplunkHistoryLogs;
- (id)_copyTCCLogs;
- (id)_copyThermalLogs;
- (id)_copyVideoProcessingLogs;
- (id)_copyWatchdogTailspins;
- (id)_copyWatchdogdDDTs;
- (id)_createTailspinContainerHelper:(id)a3 isRecent:(BOOL)a4 withSizeMB:(unint64_t)a5 forGlobsBlock:(id)a6;
- (id)_getAGXMTLCompilerCrashLogs;
- (id)_getCalendarPrefLogs;
- (id)_getCloudKitBookmarksContainer;
- (id)_getCrashesAndSpinsContainer;
- (id)_getMapsSyncJournalContainer;
- (id)_getSpindumpMetaContainer:(id)a3;
- (id)_iOSGetTimeSensitiveContainers;
- (id)_iOSgetLogCopyingContainers;
- (id)_iOSgetLogGenerationContainers;
- (id)_internalSpindumpContainers;
- (id)copyCoreaudioReportingLogs;
- (id)createTailspinContainer:(id)a3 withSizeMB:(unint64_t)a4 forGlobsBlock:(id)a5;
- (id)filterDiagnosticContainers:(id)a3;
- (id)getAHSToolContainer;
- (id)getAOPFirmwareStateContainer;
- (id)getASPMagazineContainer;
- (id)getASPSnapshotContainer;
- (id)getASPSnapshotsContainers;
- (id)getASPTraceContainers;
- (id)getAccessibilityPrefContainer;
- (id)getAirPlayContainer;
- (id)getAopaudctlContainer;
- (id)getApfsStatsContainer;
- (id)getAppleInternalPreferencesLogs;
- (id)getArchiveExtension;
- (id)getAutogenLogCopyingContainers;
- (id)getAutogenLogGenerationContainers;
- (id)getAutogenTimeSensitiveContainers;
- (id)getBTPHYLogsContainer;
- (id)getBaseBandContainer;
- (id)getBatteryUIContainer;
- (id)getCADebugContainer;
- (id)getCDDebugContainer;
- (id)getCKKSCTLContainer;
- (id)getCoreCaptureSPIContainer;
- (id)getCoreDuetLogs;
- (id)getDSCSYMContainer;
- (id)getDefaultArchiveName;
- (id)getDiagnosticContainers:(int)a3;
- (id)getDiskTasksContainer;
- (id)getEarcutilContainer;
- (id)getEnumerateCrashReporterContainer;
- (id)getExcResourceContainer;
- (id)getExposureNotificationContainer;
- (id)getFDRDiagnosticContainer;
- (id)getFreezerctlContainer;
- (id)getGMSAvailabilityContainer;
- (id)getGNIContainer;
- (id)getGestaltQueryContainer;
- (id)getHIDRecorderdContainer;
- (id)getHIDReportContainers;
- (id)getHomeUtilAccessoryStateContainer;
- (id)getHomeUtilDumpAllContainer;
- (id)getIDSContainer;
- (id)getIOLogsContainer;
- (id)getIOREGContainer;
- (id)getInternalLogsContainer;
- (id)getKeyboardPrefContainer;
- (id)getLGSystemInfoContainer;
- (id)getLGUtilitiesContainer;
- (id)getLibnotifyContainer;
- (id)getLibtraceContainers;
- (id)getLogCopyingContainers;
- (id)getLogGenerationContainers;
- (id)getLogStreamFilterContainer;
- (id)getLogarchiveCollectionContainer;
- (id)getLogarchiveSummaryContainer;
- (id)getMediaContainer;
- (id)getMicrostackshotsWithPostContainers;
- (id)getMultiTouchContainer;
- (id)getOTCTLContainer;
- (id)getPbctlUserprofilesContainer;
- (id)getPersonalizationLogs;
- (id)getPowerLogContainer;
- (id)getPredicateForFileTypes:(id)a3 withExcludedPrefixes:(id)a4;
- (id)getPreferencesLogs;
- (id)getProcessesInfoContainer;
- (id)getProximityContainers;
- (id)getRemotectlContainer;
- (id)getRunningBoardLogs;
- (id)getSPIContainers;
- (id)getSampleContainer;
- (id)getSelfCtlContainer;
- (id)getSimpleDirectoryContainer:(id)a3 withContainerName:(id)a4 andDestination:(id)a5;
- (id)getSimplePathArrayContainer:(id)a3 withContainerName:(id)a4 andDestination:(id)a5;
- (id)getSimplePathArrayContainer:(id)a3 withContainerName:(id)a4 andDestination:(id)a5 withOffsets:(id)a6 sizes:(id)a7;
- (id)getSoundAutoConfigContainer;
- (id)getSoundBoardContainer;
- (id)getSpindumpContainers;
- (id)getSpuctlContainer;
- (id)getStackshotContainer;
- (id)getStoreServicesContainer;
- (id)getStspContainer;
- (id)getSubPredicateForFileTypes:(id)a3;
- (id)getSubPredicateForPrefixes:(id)a3;
- (id)getSysCfgContainer;
- (id)getTSProcessSpecificContainers;
- (id)getTSSystemInfoContainer;
- (id)getTailspinContainers;
- (id)getThermHIDContainers;
- (id)getTimeSensitiveContainers;
- (id)getTimezoneDBLogs;
- (id)getTrialRolloutsContainer;
- (id)getUptimeContainer;
- (id)getaccountsInternalLogsContainer;
- (id)getc26ToolContainer;
- (id)getclpcContainer;
- (id)getclpcctrlContainer;
- (id)getcontrolbitsContainer;
- (id)getlaunchdAndCTSContainers;
- (id)getlaunchdContainer;
- (id)getmiscInternalLogsContainer;
- (id)getosvariantUtilContainer;
- (id)getsmcDiagnoseContainer;
- (id)getswcutilContainer;
- (id)getsysconfigInternalLogsContainer;
- (id)includeSyncedExtensionForFileTypes:(id)a3;
- (id)prepareCoSysdiagnoseParams;
- (int)dpClass;
- (int)pidForProcessName:(id)a3;
- (int)processCount;
- (int64_t)_sizeOutputDirectoryAndGenerateDiagnosticSummary;
- (int64_t)coSysdiagnose;
- (int64_t)startDiagnosticTimeClockNS;
- (proc_bsdinfo)processes;
- (unsigned)requestSource;
- (void)TSProcessSpecific_preprocess:(id)a3;
- (void)closeTaskSummaryHandle;
- (void)completeTarball;
- (void)createOnlyRunContainersWithNamesArray:(id)a3;
- (void)dealloc;
- (void)endDiagnostics;
- (void)endTaskDepotForPhase:(int)a3;
- (void)executeContainers:(id)a3 inPhase:(int)a4 withCompletionBlock:(id)a5;
- (void)executeContainersInPhase:(int)a3 withCompletionBlock:(id)a4;
- (void)executeDiagnosticContainers;
- (void)executeOSLogArchiveContainers;
- (void)filecoordination_postprocess:(id)a3 withContainerArray:(id)a4;
- (void)footprintAll_postprocess:(id)a3 withContainerArray:(id)a4;
- (void)gatherDiagnostic;
- (void)getCaseInsensitiveMatches:(id)a3 forString:(const char *)a4;
- (void)initStreaming;
- (void)logContainerAsExecuted:(id)a3 inPhase:(int)a4;
- (void)markFoldersAsComplete;
- (void)outputMetrics;
- (void)populateProcessInfoForInput;
- (void)populateProcesses;
- (void)prompt;
- (void)recordDiagnosticsMetrics:(id)a3;
- (void)run;
- (void)sendCoreAnalytics;
- (void)setArchive:(id)a3;
- (void)setArchiveName:(id)a3;
- (void)setBaseDirectory:(id)a3;
- (void)setBrctl_dir:(id)a3;
- (void)setCanDisplayTarBall:(BOOL)a3;
- (void)setCapOverride:(id)a3;
- (void)setChangedDiagnosticProperties:(id)a3;
- (void)setCoSysdiagnose:(int64_t)a3;
- (void)setCoSysdiagnoseOnly:(BOOL)a3;
- (void)setCoSysdiagnoseParameters:(id)a3;
- (void)setCompletedOutputDirectory:(id)a3;
- (void)setCompletedTarballPath:(id)a3;
- (void)setCompletionDispatchGroup:(id)a3;
- (void)setDeShowFeedback:(BOOL)a3;
- (void)setDiagnosticID:(id)a3;
- (void)setDidComplete:(BOOL)a3;
- (void)setDisableStreamTar:(BOOL)a3;
- (void)setDisableUIFeedback:(BOOL)a3;
- (void)setDpClass:(int)a3;
- (void)setEarlyPrompt:(BOOL)a3;
- (void)setExecutedContainers:(id)a3;
- (void)setFrontmostBundleID:(id)a3;
- (void)setGeneratePlist:(BOOL)a3;
- (void)setIsTestingMode:(BOOL)a3;
- (void)setOldestDateCreatedCutoff:(id)a3;
- (void)setOnlyRunContainersWithNames:(id)a3;
- (void)setOutputDirectory:(id)a3;
- (void)setOverrideContainers:(id)a3;
- (void)setPidIndices:(id)a3;
- (void)setProcessCount:(int)a3;
- (void)setProcesses:(proc_bsdinfo *)a3;
- (void)setProvidedPIDorProcess:(id)a3;
- (void)setQuickMode:(BOOL)a3;
- (void)setRemoteSysdiagnoseID:(id)a3;
- (void)setRequestSource:(unsigned __int16)a3;
- (void)setRootPath:(id)a3;
- (void)setShouldCreateTarBall:(BOOL)a3;
- (void)setShouldDisplayTarBall:(BOOL)a3;
- (void)setShouldGetFeedbackData:(BOOL)a3;
- (void)setShouldPostProcess:(BOOL)a3;
- (void)setShouldRemoveTemporaryDirectory:(BOOL)a3;
- (void)setShouldRunIDSDump:(BOOL)a3;
- (void)setShouldRunLogCopyTasks:(BOOL)a3;
- (void)setShouldRunLogGenerationTasks:(BOOL)a3;
- (void)setShouldRunOSLogArchive:(BOOL)a3;
- (void)setShouldRunTimeSensitiveTasks:(BOOL)a3;
- (void)setShouldStreamToTar:(BOOL)a3;
- (void)setSkipBTLogs;
- (void)setStartDiagnosticTime:(id)a3;
- (void)setStartDiagnosticTimeClockNS:(int64_t)a3;
- (void)setSummaryFD:(__sFILE *)a3;
- (void)setSummaryHandle:(id)a3;
- (void)setTarballPath:(id)a3;
- (void)setTargetPIDs:(id)a3;
- (void)setTmpOutputDirectory:(id)a3;
- (void)setTotalTime:(id)a3;
- (void)setUseParallelCompression:(BOOL)a3;
- (void)setVerbose:(BOOL)a3;
- (void)setWarnProcessAllowlist:(id)a3;
- (void)setupTaskDepotForPhase:(int)a3;
- (void)streamArchiveFile:(id)a3;
- (void)summarizeErrorsAcrossSDTasks:(id)a3;
- (void)summarizeErrorsForExecutedContainers;
- (void)summarizeErrorsWithinSDTask:(id)a3;
- (void)waitAndCollectAirPodLogs;
- (void)waitForRemoteLogs;
- (void)writeReportForTasks:(id)a3 withTimeout:(double)a4 concurrently:(BOOL)a5 withDepotName:(id)a6;
@end

@implementation SystemDiagnostic

- (id)getAutogenTimeSensitiveContainers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  53LL,  @"logs/CoreThread/topology",  self,  5.0));
  v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:33];
    [v3 addObject:v5];
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/ltop",  0LL,  @"ltop.txt"));
  v13 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:",  v7,  &__NSArray0__struct,  0LL,  self,  1LL,  10.0));
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 taskContainer]);
    [v10 setName:@"utilities-timeSensitive-embedded"];

    [v9 setRuntimeChecks:32];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 collectionContainer]);
    [v11 setMaximumSizeMB:25];

    [v3 addObject:v9];
  }

  return v3;
}

- (id)getAutogenLogGenerationContainers
{
  id v140 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"SEP Util",  0LL,  1LL,  self,  5.0));
  v4 = v3;
  if (v3)
  {
    [v3 setRuntimeChecks:17];
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/libexec/seputil",  &off_100099340,  @"sep_util.log"));
    v164 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v164, 1LL));
    [v4 addSDTasksToContainer:v6];

    [v140 addObject:v4];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"umtool",  @"logs/UserManagement",  1LL,  self,  5.0));
  v8 = v7;
  if (v7)
  {
    [v7 setRuntimeChecks:16];
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/umtool",  &off_100099358,  @"umtool.txt"));
    v163 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v163, 1LL));
    [v8 addSDTasksToContainer:v10];

    [v140 addObject:v8];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"testIOMFBGPO",  @"logs",  1LL,  self,  1.0));
  v12 = v11;
  if (v11)
  {
    [v11 setRuntimeChecks:17];
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/testIOMFBGPO",  0LL,  @"testIOMFBGPO.txt"));
    v162 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v162, 1LL));
    [v12 addSDTasksToContainer:v14];

    [v140 addObject:v12];
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/afktool",  &off_100099370,  0LL));
  v161 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v161, 1LL));

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:",  v16,  &__NSArray0__struct,  @"logs/AFK",  self,  1LL,  5.0));
  v18 = v17;
  if (v17)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v17 taskContainer]);
    [v19 setName:@"AFK"];

    [v18 setRuntimeChecks:16];
    [v140 addObject:v18];
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  9LL,  @"logs/BatteryHealth",  self,  5.0));
  v21 = v20;
  if (v20)
  {
    [v20 setRuntimeChecks:16];
    [v140 addObject:v21];
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"HomePodSettings",  @"logs/HomePodSettings",  1LL,  self,  5.0));
  v23 = v22;
  if (v22)
  {
    [v22 setRuntimeChecks:17];
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/homepodsettingstool",  &off_100099388,  @"homepodsettingstool.txt"));
    v160 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v160, 1LL));
    [v23 addSDTasksToContainer:v25];

    [v140 addObject:v23];
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"AMSToolCookieExports",  @"logs/AMSTool",  1LL,  self,  2.0));
  v27 = v26;
  if (v26)
  {
    [v26 setRuntimeChecks:17];
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/amstool",  &off_1000993A0,  @"amstool_cookies_list.txt"));
    v159 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v159, 1LL));
    [v27 addSDTasksToContainer:v29];

    [v140 addObject:v27];
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  28LL,  @"crashes_and_spins/MemoryExceptions",  self,  5.0));
  v31 = v30;
  if (v30)
  {
    [v30 setRuntimeChecks:16];
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 collectionContainer]);
    [v32 setMaximumSizeMB:45];

    [v140 addObject:v31];
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"usbctl",  @"logs/usbctl",  1LL,  self,  1.0));
  v34 = v33;
  if (v33)
  {
    [v33 setRuntimeChecks:17];
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/usbctl",  &off_1000993B8,  @"usbctl_list.txt"));
    v158 = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v158, 1LL));
    [v34 addSDTasksToContainer:v36];

    [v140 addObject:v34];
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"assistantd state dump",  @"logs/assistantd",  1LL,  self,  1.0));
  v38 = v37;
  if (v37)
  {
    [v37 setRuntimeChecks:17];
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/assistant_tool",  &off_1000993D0,  @"assistant_tool_dump_state.txt"));
    v157 = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v157, 1LL));
    [v38 addSDTasksToContainer:v40];

    [v140 addObject:v38];
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  54LL,  @"logs/UnifiedAsset",  self,  2.0));
  v42 = v41;
  if (v41)
  {
    [v41 setRuntimeChecks:16];
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 collectionContainer]);
    [v43 setMaximumSizeMB:1];

    [v140 addObject:v42];
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  29LL,  @"crashes_and_spins/MemoryExceptions",  self,  2.0));
  v45 = v44;
  if (v44)
  {
    [v44 setRuntimeChecks:16];
    v46 = (void *)objc_claimAutoreleasedReturnValue([v45 collectionContainer]);
    [v46 setMaximumSizeMB:1];

    [v140 addObject:v45];
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"benchrun_validate",  @"logs/benchrun",  1LL,  self,  2.0));
  v48 = v47;
  if (v47)
  {
    [v47 setRuntimeChecks:17];
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/benchrun",  &off_1000993E8,  @"benchrun_validate.txt"));
    v156 = v49;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v156, 1LL));
    [v48 addSDTasksToContainer:v50];

    [v140 addObject:v48];
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"pmudiagnose",  @"logs/pmudiagnose",  1LL,  self,  2.0));
  v52 = v51;
  if (v51)
  {
    [v51 setRuntimeChecks:16];
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/libexec/pmudiagnose/pmudiagnose",  0LL,  @"pmudiagnose.txt"));
    v155 = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v155, 1LL));
    [v52 addSDTasksToContainer:v54];

    [v140 addObject:v52];
  }

  v55 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"IOSADiagnose",  @"logs/IOSADiagnose",  1LL,  self,  5.0));
  v56 = v55;
  if (v55)
  {
    [v55 setRuntimeChecks:16];
    v57 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/System/Library/PrivateFrameworks/IOSurfaceAccelerator.framework/Resources/IOSADiagnose",  0LL,  @"IOSADiagnose.log"));
    v154 = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v154, 1LL));
    [v56 addSDTasksToContainer:v58];

    [v140 addObject:v56];
  }

  v59 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"IOPowerSources",  @"logs/IOPowerSources",  1LL,  self,  1.0));
  v60 = v59;
  if (v59)
  {
    [v59 setRuntimeChecks:17];
    v61 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/iopsutil",  &off_100099400,  @"iopsutil-all-dump.txt"));
    v153 = v61;
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v153, 1LL));
    [v60 addSDTasksToContainer:v62];

    [v140 addObject:v60];
  }

  v63 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"CoreAnalytics",  @"logs/CoreAnalytics",  1LL,  self,  1.0));
  v64 = v63;
  if (v63)
  {
    [v63 setRuntimeChecks:17];
    v65 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/analytics_tool",  &off_100099418,  @"analytics_transform_counts.txt"));
    v152 = v65;
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v152, 1LL));
    [v64 addSDTasksToContainer:v66];

    [v140 addObject:v64];
  }

  v67 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  55LL,  @"logs/IntelligencePlatform",  self,  2.0));
  v68 = v67;
  if (v67)
  {
    [v67 setRuntimeChecks:17];
    v69 = (void *)objc_claimAutoreleasedReturnValue([v68 collectionContainer]);
    [v69 setMaximumSizeMB:1];

    [v140 addObject:v68];
  }

  v70 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"profilectl",  @"logs",  1LL,  self,  5.0));
  v71 = v70;
  if (v70)
  {
    [v70 setRuntimeChecks:17];
    v72 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/profilectl",  &off_100099430,  @"profilectl_list.txt"));
    v151 = v72;
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v151, 1LL));
    [v71 addSDTasksToContainer:v73];

    [v140 addObject:v71];
  }

  v74 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"dastool",  0LL,  1LL,  self,  5.0));
  v75 = v74;
  if (v74)
  {
    [v74 setRuntimeChecks:17];
    v76 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/dastool",  &off_100099448,  @"dastool.txt"));
    v150[0] = v76;
    v77 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/dastool",  &off_100099460,  @"dastool_evaluate_all_activities.txt"));
    v150[1] = v77;
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v150, 2LL));
    [v75 addSDTasksToContainer:v78];

    [v140 addObject:v75];
  }

  v79 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"suggestToolTasks",  @"logs/suggest_tool",  0LL,  self,  10.0));
  v80 = v79;
  if (v79)
  {
    [v79 setRuntimeChecks:16];
    v139 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool",  &off_100099478,  @"dbStats.txt"));
    v149[0] = v139;
    v81 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool",  &off_100099490,  @"fileSystemMetadata.txt"));
    v149[1] = v81;
    v82 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool",  &off_1000994A8,  @"dbSchema.txt"));
    v149[2] = v82;
    v83 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool",  &off_1000994C0,  @"assetVersion.txt"));
    v149[3] = v83;
    v84 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool",  &off_1000994D8,  @"DictionaryExtractions.txt"));
    v149[4] = v84;
    v85 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool",  &off_1000994F0,  @"DictionaryInteractions.txt"));
    v149[5] = v85;
    v86 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool",  &off_100099508,  @"DictionaryInteractionsSummary.txt"));
    v149[6] = v86;
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v149, 7LL));
    [v80 addSDTasksToContainer:v87];

    [v140 addObject:v80];
  }

  v88 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"diagpipectl",  @"logs/diagpipectl",  1LL,  self,  5.0));
  v89 = v88;
  if (v88)
  {
    [v88 setRuntimeChecks:17];
    v90 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/diagpipectl",  &off_100099520,  @"diagpipectl.txt"));
    v148 = v90;
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v148, 1LL));
    [v89 addSDTasksToContainer:v91];

    [v140 addObject:v89];
  }

  v92 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"ppmctrl",  @"logs/ppmctrl",  1LL,  self,  1.0));
  v93 = v92;
  if (v92)
  {
    [v92 setRuntimeChecks:17];
    v94 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/ppmctrl",  &off_100099538,  @"ppmctrl_getClientState.txt"));
    v147 = v94;
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v147, 1LL));
    [v93 addSDTasksToContainer:v95];

    [v140 addObject:v93];
  }

  v96 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  31LL,  @"logs/OSEligibility",  self,  2.0));
  v97 = v96;
  if (v96)
  {
    [v96 setRuntimeChecks:16];
    v98 = (void *)objc_claimAutoreleasedReturnValue([v97 collectionContainer]);
    [v98 setMaximumSizeMB:1];

    [v140 addObject:v97];
  }

  v99 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"ffctl",  0LL,  1LL,  self,  5.0));
  v100 = v99;
  if (v99)
  {
    [v99 setRuntimeChecks:17];
    v101 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/ffctl",  &off_100099550,  @"ffctl.json"));
    v146[0] = v101;
    v102 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/ffctl",  &off_100099568,  @"ffctl.txt"));
    v146[1] = v102;
    v103 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/ffctl",  &off_100099580,  @"ffctl_changed.txt"));
    v146[2] = v103;
    v104 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/ffctl",  &off_100099598,  @"ffctl_featureset_list.txt"));
    v146[3] = v104;
    v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v146, 4LL));
    [v100 addSDTasksToContainer:v105];

    [v140 addObject:v100];
  }

  v106 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"ModelManager",  @"logs/ModelManager",  1LL,  self,  2.0));
  v107 = v106;
  if (v106)
  {
    [v106 setRuntimeChecks:16];
    v108 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/modelmanagerdump",  0LL,  @"model_manager_dump.json"));
    v145 = v108;
    v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v145, 1LL));
    [v107 addSDTasksToContainer:v109];

    [v140 addObject:v107];
  }

  v110 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  12LL,  @"Preferences",  self,  1.0));
  v111 = v110;
  if (v110)
  {
    [v110 setRuntimeChecks:17];
    v112 = (void *)objc_claimAutoreleasedReturnValue([v111 collectionContainer]);
    [v112 setMaximumSizeMB:1];

    [v140 addObject:v111];
  }

  v113 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"agx_util",  0LL,  1LL,  self,  5.0));
  v114 = v113;
  if (v113)
  {
    [v113 setRuntimeChecks:17];
    v115 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/agx_util",  &off_1000995B0,  @"agx_util.txt"));
    v144[0] = v115;
    v116 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/agx_util",  &off_1000995C8,  @"agx_diagnosis_report.txt"));
    v144[1] = v116;
    v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v144, 2LL));
    [v114 addSDTasksToContainer:v117];

    [v140 addObject:v114];
  }

  v118 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/sigmonctl",  &off_1000995E0,  @"sigmondctl_stdout.txt"));
  v143 = v118;
  v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v143, 1LL));

  v120 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:",  v119,  &__NSArray0__struct,  @"logs/Sigmond",  self,  1LL,  5.0));
  v121 = v120;
  if (v120)
  {
    v122 = (void *)objc_claimAutoreleasedReturnValue([v120 taskContainer]);
    [v122 setName:@"SigmondMcap"];

    [v121 setRuntimeChecks:17];
    v123 = (void *)objc_claimAutoreleasedReturnValue([v121 collectionContainer]);
    [v123 setMaximumSizeMB:25];

    [v140 addObject:v121];
  }

  v124 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"ModelCatalog",  @"logs/ModelCatalog",  1LL,  self,  2.0));
  v125 = v124;
  if (v124)
  {
    [v124 setRuntimeChecks:16];
    v126 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/modelcatalogdump",  0LL,  @"model_catalog_dump.txt"));
    v142 = v126;
    v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v142, 1LL));
    [v125 addSDTasksToContainer:v127];

    [v140 addObject:v125];
  }

  v128 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  23LL,  @"logs/GenerativeExperiences",  self,  3.0));
  v129 = v128;
  if (v128)
  {
    [v128 setRuntimeChecks:16];
    v130 = (void *)objc_claimAutoreleasedReturnValue([v129 collectionContainer]);
    [v130 setMaximumSizeMB:1];

    [v140 addObject:v129];
  }

  v131 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/IOAccelMemory",  &off_1000995F8,  @"IOAccelMemory.txt"));
  v141 = v131;
  v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v141, 1LL));

  v133 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:",  v132,  &__NSArray0__struct,  @"logs/IOAccelMemory",  self,  1LL,  5.0));
  v134 = v133;
  if (v133)
  {
    v135 = (void *)objc_claimAutoreleasedReturnValue([v133 taskContainer]);
    [v135 setName:@"IOAccelMemory"];

    [v134 setRuntimeChecks:17];
    v136 = (void *)objc_claimAutoreleasedReturnValue([v134 collectionContainer]);
    [v136 setMaximumSizeMB:2];

    [v140 addObject:v134];
  }

  id v137 = v140;
  return v137;
}

- (id)getAutogenLogCopyingContainers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"MSU",  @"logs/MSU",  self));
  v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099610));
    v368 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v368, 1LL));
    [v5 addRules:v7];

    [v3 addObject:v5];
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"CoreThread crash logs",  @"logs/CoreThread/crashes",  self));
  v9 = v8;
  if (v8)
  {
    [v8 setRuntimeChecks:9];
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/CrashReporter/CoreThread/crashes"));
    v367 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v367, 1LL));
    [v9 addRules:v11];

    [v3 addObject:v9];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"MobileKeybagLogs",  @"logs/MobileKeybag",  self));
  v13 = v12;
  if (v12)
  {
    [v12 setRuntimeChecks:9];
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/logs/keybagd.log.*"));
    v366 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v366, 1LL));
    [v13 addRules:v15];

    [v3 addObject:v13];
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"usermanagerd logs",  @"logs/UserManagement",  self));
  v17 = v16;
  if (v16)
  {
    [v16 setRuntimeChecks:8];
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/logs/usermanagerd*.log*"));
    v365 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v365, 1LL));
    [v17 addRules:v19];

    [v3 addObject:v17];
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"MailErrorConditions",  @"logs/MailErrorConditions",  self));
  v21 = v20;
  if (v20)
  {
    [v20 setRuntimeChecks:9];
    [v21 setMaximumSizeMB:30];
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/CoreAnimation/mailspin*tailspin"));
    v364 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v364, 1LL));
    [v21 addRules:v23];

    [v3 addObject:v21];
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"keyboard cache",  @"logs/keyboards",  self));
  v25 = v24;
  if (v24)
  {
    [v24 setRuntimeChecks:8];
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099628));
    v363 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v363, 1LL));
    [v25 addRules:v27];

    [v3 addObject:v25];
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"AVConference",  @"logs/AVConference",  self));
  v29 = v28;
  if (v28)
  {
    [v28 setRuntimeChecks:8];
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Caches/com.apple.VideoConference/logs/"));
    v362 = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v362, 1LL));
    [v29 addRules:v31];

    [v3 addObject:v29];
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"avconferenced-embedded",  @"logs/AVConference",  self));
  v33 = v32;
  if (v32)
  {
    [v32 setRuntimeChecks:9];
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/mobile/Library/Logs/CrashReporter/avconferenced.*.spindump.txt.gz"));
    v361 = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v361, 1LL));
    [v33 addRules:v35];

    [v3 addObject:v33];
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"NSURLSession logs",  @"logs/NSURLSessiond",  self));
  v37 = v36;
  if (v36)
  {
    [v36 setRuntimeChecks:9];
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/com.apple.nsurlsessiond"));
    v360 = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v360, 1LL));
    [v37 addRules:v39];

    [v3 addObject:v37];
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"CoreThread sniffer logs",  @"logs/CoreThread/sniffer",  self));
  v41 = v40;
  if (v40)
  {
    [v40 setRuntimeChecks:9];
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/CrashReporter/CoreThread/sniffer"));
    v359 = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v359, 1LL));
    [v41 addRules:v43];

    [v3 addObject:v41];
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"CoreThread topology logs",  @"logs/CoreThread/topology",  self));
  v45 = v44;
  if (v44)
  {
    [v44 setRuntimeChecks:9];
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/CrashReporter/CoreThread/topology"));
    v358 = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v358, 1LL));
    [v45 addRules:v47];

    [v3 addObject:v45];
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"Panics",  @"crashes_and_spins/Panics",  self));
  v49 = v48;
  if (v48)
  {
    [v48 setRuntimeChecks:8];
    v50 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/mobile/Library/Logs/CrashReporter/panic-*.ips"));
    v357[0] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/mobile/Library/Logs/CrashReporter/Retired/panic-*.ips"));
    v357[1] = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v357, 2LL));
    [v49 addRules:v52];

    [v3 addObject:v49];
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"stackshots",  @"crashes_and_spins",  self));
  v54 = v53;
  v302 = v3;
  if (v53)
  {
    [v53 setRuntimeChecks:8];
    [v54 setMaximumSizeMB:0];
    v300 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v298 = (void *)objc_claimAutoreleasedReturnValue([v300 dateByAddingTimeInterval:-30.0]);
    v55 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/logs/CrashReporter/stacks-*",  v298,  0LL,  0LL,  0LL,  0LL));
    v356[0] = v55;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v57 = (void *)objc_claimAutoreleasedReturnValue([v56 dateByAddingTimeInterval:-30.0]);
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter/stacks-*",  v57,  0LL,  0LL,  0LL,  0LL));
    v356[1] = v58;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v60 = (void *)objc_claimAutoreleasedReturnValue([v59 dateByAddingTimeInterval:-30.0]);
    v61 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter/Retired/stacks-*",  v60,  0LL,  0LL,  0LL,  0LL));
    v356[2] = v61;
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v356, 3LL));
    [v54 addRules:v62];

    v3 = v302;
    [v302 addObject:v54];
  }

  v63 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"BluetoothAccessory",  @"logs/Bluetooth",  self));
  v64 = v63;
  if (v63)
  {
    [v63 setRuntimeChecks:9];
    v65 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099640));
    v355 = v65;
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v355, 1LL));
    [v64 addRules:v66];

    [v3 addObject:v64];
  }

  v67 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"BluetoothCoreDump",  @"logs/Bluetooth/CoreDump",  self));
  v68 = v67;
  if (v67)
  {
    [v67 setRuntimeChecks:9];
    v69 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/mobile/Library/Logs/Bluetooth/bluetoothd-FWCOREDUMP*log"));
    v354 = v69;
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v354, 1LL));
    [v68 addRules:v70];

    [v3 addObject:v68];
  }

  v71 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"HCI",  @"logs/Bluetooth",  self));
  v72 = v71;
  if (v71)
  {
    [v71 setRuntimeChecks:8];
    [v72 setMaximumSizeMB:10];
    v73 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/Bluetooth/bluetoothd-hci*.pklg",  0LL,  0LL,  2LL,  0LL,  0LL));
    v353 = v73;
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v353, 1LL));
    [v72 addRules:v74];

    [v3 addObject:v72];
  }

  v75 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"DataMigration",  @"logs/DataMigration",  self));
  v76 = v75;
  if (v75)
  {
    [v75 setRuntimeChecks:9];
    v77 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/DataMigration",  0LL,  0LL,  0LL,  1LL,  0LL,  0LL));
    v352 = v77;
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v352, 1LL));
    [v76 addRules:v78];

    [v3 addObject:v76];
  }

  v79 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"MobileLockdown",  @"logs/MobileLockdown",  self));
  v80 = v79;
  if (v79)
  {
    [v79 setRuntimeChecks:8];
    v81 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/logs/lockdownd.log*"));
    v351 = v81;
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v351, 1LL));
    [v80 addRules:v82];

    [v3 addObject:v80];
  }

  v83 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"CoreLocation",  @"logs/CoreLocation",  self));
  v84 = v83;
  if (v83)
  {
    [v83 setRuntimeChecks:9];
    v85 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099658));
    v350 = v85;
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v350, 1LL));
    [v84 addRules:v86];

    [v3 addObject:v84];
  }

  v87 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"syslog",  @"logs/system",  self));
  v88 = v87;
  if (v87)
  {
    [v87 setRuntimeChecks:9];
    v89 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/db/diagnostics/system.log{,.[01].gz}"));
    v349[0] = v89;
    v90 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/db/diagnostics/system{,.[01]}.log{,.gz}"));
    v349[1] = v90;
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v349, 2LL));
    [v88 addRules:v91];

    [v3 addObject:v88];
  }

  v92 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"Networking",  @"logs/Networking",  self));
  v93 = v92;
  if (v92)
  {
    [v92 setRuntimeChecks:8];
    v94 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099670));
    v348 = v94;
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v348, 1LL));
    [v93 addRules:v95];

    [v3 addObject:v93];
  }

  v96 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"FindMyDevice",  @"logs/FindMyDevice",  self));
  v97 = v96;
  if (v96)
  {
    [v96 setRuntimeChecks:9];
    v98 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/tmp/findmydeviced-sysdiagnose"));
    v347 = v98;
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v347, 1LL));
    [v97 addRules:v99];

    [v3 addObject:v97];
  }

  v100 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"itunesstored",  @"logs/itunesstored",  self));
  v101 = v100;
  if (v100)
  {
    [v100 setRuntimeChecks:8];
    v102 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099688));
    v346[0] = v102;
    v103 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/com.apple.itunesstored",  0LL,  0LL,  0LL,  0LL,  @"com.apple.itunesstored",  0LL));
    v346[1] = v103;
    v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v346, 2LL));
    [v101 addRules:v104];

    [v3 addObject:v101];
  }

  v105 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"OTA",  @"logs/OTA",  self));
  v106 = v105;
  if (v105)
  {
    [v105 setRuntimeChecks:9];
    v107 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_1000996A0));
    v345[0] = v107;
    v108 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/SoftwareUpdateServices.log*",  0LL,  0LL,  3LL,  0LL,  0LL));
    v345[1] = v108;
    v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v345, 2LL));
    [v106 addRules:v109];

    [v3 addObject:v106];
  }

  v110 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"LaunchServices",  @"logs/LaunchServices",  self));
  v111 = v110;
  if (v110)
  {
    [v110 setRuntimeChecks:8];
    v112 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/LaunchServices"));
    v344 = v112;
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v344, 1LL));
    [v111 addRules:v113];

    [v3 addObject:v111];
  }

  v114 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"AppConduit",  @"logs/AppConduit",  self));
  v115 = v114;
  if (v114)
  {
    [v114 setRuntimeChecks:8];
    v116 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/mobile/Library/Logs/AppConduit/AppConduit.log.[0-4]"));
    v343 = v116;
    v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v343, 1LL));
    [v115 addRules:v117];

    [v3 addObject:v115];
  }

  v118 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"Accounts",  @"logs/Accounts",  self));
  v119 = v118;
  if (v118)
  {
    [v118 setRuntimeChecks:8];
    v120 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Accounts"));
    v342 = v120;
    v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v342, 1LL));
    [v119 addRules:v121];

    [v3 addObject:v119];
  }

  v122 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"Harmony",  @"/logs/harmony",  self));
  v123 = v122;
  if (v122)
  {
    [v122 setRuntimeChecks:9];
    v124 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter/harmony/*.csv",  0LL,  0LL,  5LL,  0LL,  0LL));
    v341 = v124;
    v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v341, 1LL));
    [v123 addRules:v125];

    [v3 addObject:v123];
  }

  v126 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"Contacts",  @"logs",  self));
  v127 = v126;
  if (v126)
  {
    [v126 setRuntimeChecks:9];
    v128 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/com.apple.AddressBook*",  0LL,  0LL,  0LL,  @"Contacts",  0LL));
    v340[0] = v128;
    v129 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/DataAccess/CardDAVHTTPTraffic*",  0LL,  0LL,  0LL,  @"DataAccess",  0LL));
    v340[1] = v129;
    v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v340, 2LL));
    [v127 addRules:v130];

    [v3 addObject:v127];
  }

  v131 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"Burnin",  @"logs/Burnin",  self));
  v132 = v131;
  if (v131)
  {
    [v131 setRuntimeChecks:11];
    [v132 setMaximumSizeMB:0];
    v301 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_1000996B8));
    v339[0] = v301;
    v299 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/logs/BurnIn"));
    v339[1] = v299;
    v297 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/logs/Earthbound",  0LL,  0LL,  0LL,  0LL,  @"Earthbound",  0LL));
    v339[2] = v297;
    v296 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/logs/AppleSupport",  0LL,  0LL,  0LL,  0LL,  @"AppleSupport",  0LL));
    v339[3] = v296;
    v133 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/db/Earthbound",  0LL,  0LL,  0LL,  0LL,  @"Earthbound/db",  0LL));
    v339[4] = v133;
    v134 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/AppleInternal/Diags/Logs",  0LL,  0LL,  0LL,  0LL,  @"AppleInternal/Diags",  0LL));
    v339[5] = v134;
    v135 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
    v136 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"NOT SELF contains %@",  v135));
    id v137 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter",  0LL,  0LL,  v136,  0LL,  @"mobile/Library/CrashReporter",  0LL));
    v339[6] = v137;
    v138 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/logs/CrashReporter",  0LL,  0LL,  0LL,  0LL,  @"CrashReporter",  0LL));
    v339[7] = v138;
    v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v339, 8LL));
    [v132 addRules:v139];

    v3 = v302;
    [v302 addObject:v132];
  }

  id v140 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"Buddy",  @"logs/Buddy",  self));
  v141 = v140;
  if (v140)
  {
    [v140 setRuntimeChecks:9];
    v142 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Buddy_*"));
    v338 = v142;
    v143 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v338, 1LL));
    [v141 addRules:v143];

    [v3 addObject:v141];
  }

  v144 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"ProtectedCloudStorage",  @"logs/ProtectedCloudStorage",  self));
  v145 = v144;
  if (v144)
  {
    [v144 setRuntimeChecks:8];
    v146 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/ProtectedCloudStorage*.log"));
    v337 = v146;
    v147 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v337, 1LL));
    [v145 addRules:v147];

    [v3 addObject:v145];
  }

  v148 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"MobileBackup",  @"logs/MobileBackup",  self));
  v149 = v148;
  if (v148)
  {
    [v148 setRuntimeChecks:8];
    v150 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_1000996D0));
    v336[0] = v150;
    v151 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  &off_1000996E8,  0LL,  0LL,  0LL,  0LL,  1LL));
    v336[1] = v151;
    v152 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v336, 2LL));
    [v149 addRules:v152];

    [v3 addObject:v149];
  }

  v153 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"ATVUpdateLog",  @"logs/ATVUpdateLog",  self));
  v154 = v153;
  if (v153)
  {
    [v153 setRuntimeChecks:8];
    v155 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099700));
    v335 = v155;
    v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v335, 1LL));
    [v154 addRules:v156];

    [v3 addObject:v154];
  }

  v157 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"SUInfo",  @"logs",  self));
  v158 = v157;
  if (v157)
  {
    [v157 setRuntimeChecks:9];
    v159 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099718));
    v334 = v159;
    v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v334, 1LL));
    [v158 addRules:v160];

    [v3 addObject:v158];
  }

  v161 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"demod",  @"logs/demod",  self));
  v162 = v161;
  if (v161)
  {
    [v161 setRuntimeChecks:8];
    v163 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/logs/demod/demod-*"));
    v333[0] = v163;
    v164 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/logs/demod/demod_helper-*"));
    v333[1] = v164;
    v165 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v333, 2LL));
    [v162 addRules:v165];

    [v3 addObject:v162];
  }

  v166 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"WatchConnectivity",  @"logs/WatchConnectivity",  self));
  v167 = v166;
  if (v166)
  {
    [v166 setRuntimeChecks:8];
    v168 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/WatchConnectivity",  0LL,  0LL,  0LL,  10LL,  0LL,  0LL));
    v332 = v168;
    v169 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v332, 1LL));
    [v167 addRules:v169];

    [v3 addObject:v167];
  }

  v170 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"coremediacapture-afdebug",  @"logs/coremediacapture",  self));
  v171 = v170;
  if (v170)
  {
    [v170 setRuntimeChecks:9];
    v172 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/mobile/Library/Logs/CrashReporter/mediaserverd-capture-NOT-A-CRASH.afdebug-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9].txt"));
    v331 = v172;
    v173 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v331, 1LL));
    [v171 addRules:v173];

    [v3 addObject:v171];
  }

  v174 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"BridgeActivation",  @"logs/BridgeActivation",  self));
  v175 = v174;
  if (v174)
  {
    [v174 setRuntimeChecks:9];
    v176 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-Activation-Re[quest\\|sponse]*.txt"));
    v330 = v176;
    v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v330, 1LL));
    [v175 addRules:v177];

    [v3 addObject:v175];
  }

  v178 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"HomePodSetUp",  @"logs/HomePodSetUp",  self));
  v179 = v178;
  if (v178)
  {
    [v178 setRuntimeChecks:9];
    v180 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/mobile/Library/Logs/com.apple.HomePodLEDPairingData*.bin"));
    v329 = v180;
    v181 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v329, 1LL));
    [v179 addRules:v181];

    [v3 addObject:v179];
  }

  v182 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"Frametracer",  @"logs/Frametracer",  self));
  v183 = v182;
  if (v182)
  {
    [v182 setRuntimeChecks:9];
    v184 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/mobile/Library/Logs/CrashReporter/CoreAnimation/*tailspin"));
    v328 = v184;
    v185 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v328, 1LL));
    [v183 addRules:v185];

    [v3 addObject:v183];
  }

  v186 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"MatchTailspins",  @"logs/MatchTailspins",  self));
  v187 = v186;
  if (v186)
  {
    [v186 setRuntimeChecks:9];
    v188 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/BioLog/BL*/*seq/*tailspin",  0LL,  0LL,  10LL,  0LL,  0LL));
    v327 = v188;
    v189 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v327, 1LL));
    [v187 addRules:v189];

    [v3 addObject:v187];
  }

  v190 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"ForceResetTailspins",  @"logs/ForceResetTailspins",  self));
  v191 = v190;
  if (v190)
  {
    [v190 setRuntimeChecks:8];
    v192 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins"));
    v326 = v192;
    v193 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v326, 1LL));
    [v191 addRules:v193];

    [v3 addObject:v191];
  }

  v194 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"TetheredRestore",  @"logs/TetheredRestore",  self));
  v195 = v194;
  if (v194)
  {
    [v194 setRuntimeChecks:9];
    v196 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099730));
    v325 = v196;
    v197 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v325, 1LL));
    [v195 addRules:v197];

    [v3 addObject:v195];
  }

  v198 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"TVIdleScreen",  @"logs/TVIdleScreen",  self));
  v199 = v198;
  if (v198)
  {
    [v198 setRuntimeChecks:8];
    v200 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099748));
    v324 = v200;
    v201 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v324, 1LL));
    [v199 addRules:v201];

    [v3 addObject:v199];
  }

  v202 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"TVColorCalibration",  @"logs/TVColorCalibration",  self));
  v203 = v202;
  if (v202)
  {
    [v202 setRuntimeChecks:8];
    v204 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/mobile/Library/Caches/com.apple.tvlatency/ColorCalibrations/*.plist"));
    v323 = v204;
    v205 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v323, 1LL));
    [v203 addRules:v205];

    [v3 addObject:v203];
  }

  v206 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"MobileObliteration",  @"logs/MobileObliteration",  self));
  v207 = v206;
  if (v206)
  {
    [v206 setRuntimeChecks:9];
    v208 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v209 = (void *)objc_claimAutoreleasedReturnValue([v208 dateByAddingTimeInterval:-432000.0]);
    v210 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  &off_100099760,  v209,  0LL,  0LL,  0LL,  0LL));
    v322 = v210;
    v211 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v322, 1LL));
    [v207 addRules:v211];

    [v3 addObject:v207];
  }

  v212 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"OTAUpdateLogs",  @"logs/OTAUpdateLogs",  self));
  v213 = v212;
  if (v212)
  {
    [v212 setRuntimeChecks:8];
    v214 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099778));
    v321 = v214;
    v215 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v321, 1LL));
    [v213 addRules:v215];

    [v3 addObject:v213];
  }

  v216 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"CommandAndControl",  @"logs/AccessibilityPrefs",  self));
  v217 = v216;
  if (v216)
  {
    [v216 setRuntimeChecks:8];
    v218 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099790));
    v320 = v218;
    v219 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v320, 1LL));
    [v217 addRules:v219];

    [v3 addObject:v217];
  }

  v220 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"SiriTextToSpeech",  @"logs/SiriTextToSpeech",  self));
  v221 = v220;
  if (v220)
  {
    [v220 setRuntimeChecks:9];
    v222 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/CrashReporter/SiriTTS_AudioDump"));
    v319 = v222;
    v223 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v319, 1LL));
    [v221 addRules:v223];

    [v3 addObject:v221];
  }

  v224 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"LivabilityApp",  @"logs/LivabilityApp",  self));
  v225 = v224;
  if (v224)
  {
    [v224 setRuntimeChecks:9];
    v226 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Preferences/com.apple.Livability.plist"));
    v318 = v226;
    v227 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v318, 1LL));
    [v225 addRules:v227];

    [v3 addObject:v225];
  }

  v228 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"MobileSlideShow",  @"logs/MobileSlideShow",  self));
  v229 = v228;
  if (v228)
  {
    [v228 setRuntimeChecks:9];
    v230 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Preferences/com.apple.mobileslideshow.plist"));
    v317 = v230;
    v231 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v317, 1LL));
    [v229 addRules:v231];

    [v3 addObject:v229];
  }

  v232 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"MobileStoreDemo",  @"logs/MobileStoreDemo",  self));
  v233 = v232;
  if (v232)
  {
    [v232 setRuntimeChecks:8];
    v234 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_1000997A8));
    v316 = v234;
    v235 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v316, 1LL));
    [v233 addRules:v235];

    [v3 addObject:v233];
  }

  v236 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"SleepCycler",  @"logs/SleepCycler",  self));
  v237 = v236;
  if (v236)
  {
    [v236 setRuntimeChecks:9];
    v238 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_1000997C0));
    v315 = v238;
    v239 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v315, 1LL));
    [v237 addRules:v239];

    [v3 addObject:v237];
  }

  v240 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"Resource Exhaustion",  @"resource_exhaustion",  self));
  v241 = v240;
  if (v240)
  {
    [v240 setRuntimeChecks:9];
    v242 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v243 = (void *)objc_claimAutoreleasedReturnValue([v242 dateByAddingTimeInterval:-3600.0]);
    v244 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/db/spindump/Exhaustion*",  v243,  0LL,  0LL,  0LL,  0LL));
    v314 = v244;
    v245 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v314, 1LL));
    [v241 addRules:v245];

    [v3 addObject:v241];
  }

  v246 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"SystemVersion",  @"logs/SystemVersion",  self));
  v247 = v246;
  if (v246)
  {
    [v246 setRuntimeChecks:8];
    v248 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_1000997D8));
    v313 = v248;
    v249 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v313, 1LL));
    [v247 addRules:v249];

    [v3 addObject:v247];
  }

  v250 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"Recoverylogd",  @"logs/recoverylogd",  self));
  v251 = v250;
  if (v250)
  {
    [v250 setRuntimeChecks:8];
    v252 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/recoverylogd"));
    v312[0] = v252;
    v253 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/System/Volumes/Hardware/recoverylogd"));
    v312[1] = v253;
    v254 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v312, 2LL));
    [v251 addRules:v254];

    [v3 addObject:v251];
  }

  v255 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"RunningBoard",  @"logs/RunningBoard",  self));
  v256 = v255;
  if (v255)
  {
    [v255 setRuntimeChecks:9];
    [v256 setMaximumSizeMB:10];
    v257 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/tmp/com.apple.runningboardd/ts-*.tailspin"));
    v311 = v257;
    v258 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v311, 1LL));
    [v256 addRules:v258];

    [v3 addObject:v256];
  }

  v259 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"CacheDeleteHistory",  @"logs/CacheDelete",  self));
  v260 = v259;
  if (v259)
  {
    [v259 setRuntimeChecks:8];
    [v260 setMaximumSizeMB:10];
    v261 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_1000997F0));
    v310 = v261;
    v262 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v310, 1LL));
    [v260 addRules:v262];

    [v3 addObject:v260];
  }

  v263 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"PersistedLog",  @"logs/PersistedLog",  self));
  v264 = v263;
  if (v263)
  {
    [v263 setRuntimeChecks:8];
    [v264 setMaximumSizeMB:2];
    v265 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/PersistedLog/"));
    v309[0] = v265;
    v266 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/PersistedLog/"));
    v309[1] = v266;
    v267 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v309, 2LL));
    [v264 addRules:v267];

    [v3 addObject:v264];
  }

  v268 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"SpaceAttributionTelemetry",  @"logs/SpaceAttribution",  self));
  v269 = v268;
  if (v268)
  {
    [v268 setRuntimeChecks:9];
    [v269 setMaximumSizeMB:2];
    v270 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099808));
    v308 = v270;
    v271 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v308, 1LL));
    [v269 addRules:v271];

    [v3 addObject:v269];
  }

  v272 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"AUDeveloperSettings",  @"logs/AUDeveloperSettings",  self));
  v273 = v272;
  if (v272)
  {
    [v272 setRuntimeChecks:9];
    [v273 setMaximumSizeMB:1];
    v274 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099820));
    v307 = v274;
    v275 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v307, 1LL));
    [v273 addRules:v275];

    [v3 addObject:v273];
  }

  v276 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"WindowServerHangs",  @"logs/WindowServer",  self));
  v277 = v276;
  if (v276)
  {
    [v276 setRuntimeChecks:9];
    [v277 setMaximumSizeMB:50];
    v278 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v279 = (void *)objc_claimAutoreleasedReturnValue([v278 dateByAddingTimeInterval:-1800.0]);
    v280 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/Library/Logs/WindowServer",  0LL,  v279,  0LL,  0LL,  0LL,  0LL));
    v306 = v280;
    v281 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v306, 1LL));
    [v277 addRules:v281];

    [v3 addObject:v277];
  }

  v282 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"UARPEndpointPacketCaptures",  @"logs/UARPEndpointPacketCaptures",  self));
  v283 = v282;
  if (v282)
  {
    [v282 setRuntimeChecks:8];
    [v283 setMaximumSizeMB:10];
    v284 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/db/accessoryupdater/uarp/pcapfiles"));
    v305 = v284;
    v285 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v305, 1LL));
    [v283 addRules:v285];

    [v3 addObject:v283];
  }

  v286 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"DarwinInit",  @"logs/DarwinInit",  self));
  v287 = v286;
  if (v286)
  {
    [v286 setRuntimeChecks:8200];
    [v287 setMaximumSizeMB:1];
    v288 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099838));
    v304 = v288;
    v289 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v304, 1LL));
    [v287 addRules:v289];

    [v3 addObject:v287];
  }

  v290 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"NERDArchive",  @"logs/MSU",  self));
  v291 = v290;
  if (v290)
  {
    [v290 setRuntimeChecks:8];
    [v291 setMaximumSizeMB:20];
    v292 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/MobileSoftwareUpdate/Controller/NeRD/RecoveryOS-[0-9-]*.logarchive.zip",  0LL,  0LL,  1LL,  0LL,  0LL));
    v303 = v292;
    v293 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v303, 1LL));
    [v291 addRules:v293];

    [v3 addObject:v291];
  }

  id v294 = v3;
  return v294;
}

- (void)TSProcessSpecific_preprocess:(id)a3
{
  id v60 = a3;
  unsigned int v4 = -[SystemDiagnostic requestSource](self, "requestSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
  id v6 = [v5 count];

  if (v6)
  {
    if (-[SystemDiagnostic quickMode](self, "quickMode")
      || -[SystemDiagnostic requestSource](self, "requestSource") == 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  @"-v",  @"-w",  0LL));
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
      id v9 = [v8 countByEnumeratingWithState:&v77 objects:v89 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v78;
        do
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v78 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v77 + 1) + 8 * (void)i) stringValue]);
            [v7 addObject:v13];
          }

          id v10 = [v8 countByEnumeratingWithState:&v77 objects:v89 count:16];
        }

        while (v10);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"process footprint",  0LL,  0LL,  self,  25.0));
      v15 = v14;
      if (v14)
      {
        [v14 setRuntimeChecks:32];
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/footprint",  v7,  @"footprint.txt"));
        v88 = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v88, 1LL));
        [v15 addSDTasksToContainer:v17];

        [v60 addObject:v15];
      }
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
    unint64_t v19 = (unint64_t)[v18 count];
    unint64_t v20 = v19 >> 2;

    unint64_t v21 = v19 & 0xFFFFFFFFFFFFFFFCLL;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
    id v23 = [v22 count];

    else {
      unint64_t v24 = v20 + 1;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v87 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Number of process specific time-sensitive groups: %lu",  buf,  0xCu);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v25, "log:", @"Number of process specific time-sensitive groups: %lu", v24);

    if (v24)
    {
      uint64_t v26 = 0LL;
      uint64_t v27 = 30LL;
      if (v4 == 2) {
        uint64_t v27 = 120LL;
      }
      uint64_t v61 = v27;
      v28 = (void **)&AnalyticsSendEventLazy_ptr;
      v66 = self;
      unint64_t v62 = v24;
      do
      {
        uint64_t v29 = (4 * v26);
        v30 = (char *)(v29 + 4);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
        id v32 = [v31 count];

        if (v29 + 4 > (unint64_t)v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
          v30 = (char *)[v33 count];
        }

        unint64_t v67 = (unint64_t)v30;
        v63 = &v30[-v29];
        uint64_t v65 = v26 + 1;
        v64 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v28[73],  "stringWithFormat:",  @"Process specific container group: %d",  v26 + 1));
        v34 = &__NSArray0__struct;
        do
        {
          v35 = v34;
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
          v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectAtIndex:v29]);
          id v38 = [v37 intValue];

          uint64_t v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28[73], "stringWithFormat:", @"%d", v38));
          uint64_t v40 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices"));
          uint64_t v75 = v29;
          v76 = v35;
          if (v40
            && (v41 = (void *)v40,
                v42 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices")),
                id v43 = [v42 count],
                v42,
                v41,
                v43))
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices"));
            v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectAtIndex:v29]);
            unsigned int v46 = [v45 intValue];

            v47 = (__CFString *)objc_claimAutoreleasedReturnValue( objc_msgSend( &stru_10008D288,  "stringByAppendingFormat:",  @"%s",  (char *)-[SystemDiagnostic processes](self, "processes") + 136 * (int)v46 + 48));
          }

          else
          {
            v47 = &stru_10008D288;
          }

          v74 = (void *)objc_claimAutoreleasedReturnValue( [v28[73] stringWithFormat:@"<TMPOUTPUTDIR>/graph-%d-%@.memgraph", v38, v47]);
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28[73], "stringWithFormat:", @"errors/leaks_ts_%d_errors.txt", v38));
          v84[0] = @"-outputGraph";
          v84[1] = v74;
          v84[2] = v39;
          v84[3] = @"-forkCorpse";
          v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v84, 4LL));
          v71 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/leaks",  v72,  v73));
          v85[0] = v71;
          v83[0] = @"-v";
          v83[1] = @"-k";
          v83[2] = v39;
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v83, 3LL));
          v68 = (void *)objc_claimAutoreleasedReturnValue([v28[73] stringWithFormat:@"ddt-%u-%@.txt", v38, v47]);
          v48 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/local/bin/ddt",  v69,  v68,  1LL));
          v85[1] = v48;
          v82[0] = @"procinfo";
          v82[1] = v39;
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v82, 2LL));
          uint64_t v50 = v39;
          v70 = (void *)v39;
          v51 = v28;
          v52 = (void *)objc_claimAutoreleasedReturnValue([v28[73] stringWithFormat:@"launchctl-procinfo-%u-%@.txt", v38, v47]);
          v53 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/bin/launchctl",  v49,  v52));
          v85[2] = v53;
          v81[0] = @"dump-concurrency";
          v81[1] = v50;
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v81, 2LL));
          v55 = (void *)objc_claimAutoreleasedReturnValue([v51[73] stringWithFormat:@"swift-inspect-%u-%@.txt", v38, v47]);
          v56 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/swift-inspect",  v54,  v55));
          v85[3] = v56;
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v85, 4LL));

          v28 = v51;
          v34 = (void *)objc_claimAutoreleasedReturnValue([v76 arrayByAddingObjectsFromArray:v57]);

          uint64_t v29 = v75 + 1;
          self = v66;
        }

        while (v75 + 1 < v67);
        v58 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:",  v34,  &__NSArray0__struct,  &stru_10008D288,  v66,  1LL,  (double)(unint64_t)((void)v63 * v61)));
        v59 = v58;
        if (v58)
        {
          [v58 setName:v64];
          [v60 addObject:v59];
        }

        uint64_t v26 = v65;
      }

      while (v65 != v62);
    }
  }
}

- (void)filecoordination_postprocess:(id)a3 withContainerArray:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (v8)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 collectionContainer]);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v8 collectionContainer]);
      [v7 setDestination:0];
    }
  }
}

- (void)footprintAll_postprocess:(id)a3 withContainerArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[SystemDiagnostic quickMode](self, "quickMode") || -[SystemDiagnostic requestSource](self, "requestSource") == 1)
  {
    if (v6) {
      [v7 removeObject:v6];
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Creating footprint...",  v9,  2u);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v8 log:@"Creating footprint..."];
  }
}

- (id)_iOSgetLogCopyingContainers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _getCrashesAndSpinsContainer](self, "_getCrashesAndSpinsContainer"));
  [v3 addObjectsFromArray:v4];

  id v5 = -[SystemDiagnostic _copyOnDemandDaemonLogsContainer](self, "_copyOnDemandDaemonLogsContainer");
  [v3 addObjectsFromArray:v5];

  id v6 = -[SystemDiagnostic _copyVideoProcessingLogs](self, "_copyVideoProcessingLogs");
  [v3 addObjectsFromArray:v6];

  id v7 = -[SystemDiagnostic _copyThermalLogs](self, "_copyThermalLogs");
  [v3 addObjectsFromArray:v7];

  id v8 = -[SystemDiagnostic copyCoreaudioReportingLogs](self, "copyCoreaudioReportingLogs");
  [v3 addObjectsFromArray:v8];

  id v9 = -[SystemDiagnostic _copyAccessibilityPreferences](self, "_copyAccessibilityPreferences");
  [v3 addObjectsFromArray:v9];

  id v10 = -[SystemDiagnostic _copyAstroLogsContainer](self, "_copyAstroLogsContainer");
  [v3 addObjectsFromArray:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _getMapsSyncJournalContainer](self, "_getMapsSyncJournalContainer"));
  [v3 addObjectsFromArray:v11];

  id v12 = -[SystemDiagnostic _copyCompanionSyncContainer](self, "_copyCompanionSyncContainer");
  [v3 addObjectsFromArray:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _getAGXMTLCompilerCrashLogs](self, "_getAGXMTLCompilerCrashLogs"));
  [v3 addObjectsFromArray:v13];

  id v14 = -[SystemDiagnostic _copyNanoPreferencesSyncLogs](self, "_copyNanoPreferencesSyncLogs");
  [v3 addObjectsFromArray:v14];

  id v15 = -[SystemDiagnostic _copyCoreCaptureBTLogsContainer](self, "_copyCoreCaptureBTLogsContainer");
  [v3 addObjectsFromArray:v15];

  id v16 = -[SystemDiagnostic _copyMobileInstallationLogsContainer](self, "_copyMobileInstallationLogsContainer");
  [v3 addObjectsFromArray:v16];

  id v17 = -[SystemDiagnostic _copyMobileActivationLogsContainer](self, "_copyMobileActivationLogsContainer");
  [v3 addObjectsFromArray:v17];

  id v18 = -[SystemDiagnostic _copyAppInstallationLogsContainer](self, "_copyAppInstallationLogsContainer");
  [v3 addObjectsFromArray:v18];

  id v19 = -[SystemDiagnostic _copyProxiedDeviceCrashLogsContainer](self, "_copyProxiedDeviceCrashLogsContainer");
  [v3 addObjectsFromArray:v19];

  id v20 = -[SystemDiagnostic _copySiriLogsContainer](self, "_copySiriLogsContainer");
  [v3 addObjectsFromArray:v20];

  id v21 = -[SystemDiagnostic _copyMobileAssetHistoryLogs](self, "_copyMobileAssetHistoryLogs");
  [v3 addObjectsFromArray:v21];

  id v22 = -[SystemDiagnostic _copySplunkHistoryLogs](self, "_copySplunkHistoryLogs");
  [v3 addObjectsFromArray:v22];

  id v23 = -[SystemDiagnostic _copyParsecdBagLogs](self, "_copyParsecdBagLogs");
  [v3 addObjectsFromArray:v23];

  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _getCloudKitBookmarksContainer](self, "_getCloudKitBookmarksContainer"));
  [v3 addObjectsFromArray:v24];

  id v25 = -[SystemDiagnostic _copySiriAnalyticsDB](self, "_copySiriAnalyticsDB");
  [v3 addObjectsFromArray:v25];

  id v26 = -[SystemDiagnostic _copyHangTracerTailspinsContainer](self, "_copyHangTracerTailspinsContainer");
  [v3 addObjectsFromArray:v26];

  id v27 = -[SystemDiagnostic _copySentryPlistsContainer](self, "_copySentryPlistsContainer");
  [v3 addObjectsFromArray:v27];

  id v28 = -[SystemDiagnostic _copyMCLogs](self, "_copyMCLogs");
  [v3 addObjectsFromArray:v28];

  id v29 = -[SystemDiagnostic _copyWatchdogTailspins](self, "_copyWatchdogTailspins");
  [v3 addObjectsFromArray:v29];

  id v30 = -[SystemDiagnostic _copyWatchdogdDDTs](self, "_copyWatchdogdDDTs");
  [v3 addObjectsFromArray:v30];

  id v31 = -[SystemDiagnostic _copyTCCLogs](self, "_copyTCCLogs");
  [v3 addObjectsFromArray:v31];

  return v3;
}

- (id)_copyProxiedDeviceCrashLogsContainer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"process proxied device logs",  @"logs/ProxiedDevice",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/mobile/Library/Logs/CrashReporter/ProxiedDevice-*/*"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:-86400.0]);
    [v6 setCreatedSince:v8];

    uint64_t v11 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    [v5 addRules:v9];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_createTailspinContainerHelper:(id)a3 isRecent:(BOOL)a4 withSizeMB:(unint64_t)a5 forGlobsBlock:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v11 = (uint64_t (**)(id, id))a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dateByAddingTimeInterval:-86400.0]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dateByAddingTimeInterval:-180.0]);

  id v16 = v13;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([@"crashes_and_spins" stringByAppendingPathComponent:v10]);
  if (v8)
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue([@"Recent" stringByAppendingString:v10]);

    id v19 = v15;
    a5 = 0LL;
    id v10 = (id)v18;
  }

  else
  {
    id v19 = v16;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  v10,  v17,  self));
  id v21 = v20;
  if (v20)
  {
    [v20 setMaximumSizeMB:a5];
    [v21 setRuntimeChecks:8];
    id v30 = v11;
    uint64_t v22 = v11[2](v11, v19);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    unint64_t v24 = v23;
    if (!v8)
    {
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v25 = [v23 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v32;
        do
        {
          id v28 = 0LL;
          do
          {
            if (*(void *)v32 != v27) {
              objc_enumerationMutation(v24);
            }
            [*(id *)(*((void *)&v31 + 1) + 8 * (void)v28) setCreatedUntil:v15];
            id v28 = (char *)v28 + 1;
          }

          while (v26 != v28);
          id v26 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }

        while (v26);
      }
    }

    [v21 addRules:v24];

    uint64_t v11 = v30;
  }

  return v21;
}

- (id)createTailspinContainer:(id)a3 withSizeMB:(unint64_t)a4 forGlobsBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[SystemDiagnostic _createTailspinContainerHelper:isRecent:withSizeMB:forGlobsBlock:]( self,  "_createTailspinContainerHelper:isRecent:withSizeMB:forGlobsBlock:",  v8,  0LL,  a4,  v9));
  if (v11) {
    [v10 addObject:v11];
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[SystemDiagnostic _createTailspinContainerHelper:isRecent:withSizeMB:forGlobsBlock:]( self,  "_createTailspinContainerHelper:isRecent:withSizeMB:forGlobsBlock:",  v8,  1LL,  a4,  v9));
  if (v12) {
    [v10 addObject:v12];
  }

  return v10;
}

- (id)_copyHangTracerTailspinsContainer
{
  return (id)objc_claimAutoreleasedReturnValue( -[SystemDiagnostic createTailspinContainer:withSizeMB:forGlobsBlock:]( self,  "createTailspinContainer:withSizeMB:forGlobsBlock:",  @"HangTracerTailspins",  15LL,  &stru_1000890A0));
}

- (id)_copyOnDemandDaemonLogsContainer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"ondemandd",  @"logs/OnDemandDaemon/",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/ondemandd/"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:-86400.0]);
    [v6 setCreatedSince:v8];

    uint64_t v11 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    [v5 addRules:v9];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyCoreCaptureBTLogsContainer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"CoreCaptureBT",  @"logs/MarconiBT",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    objc_msgSend(v5, "setRuntimeChecks:", (unint64_t)objc_msgSend(v5, "runtimeChecks") | 1);
    [v5 setGenerateSummary:1];
    [v5 setResolveHomeDirs:0];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:atInternalDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:atInternalDirectory:",  @"/private/var/log/CoreCapture/com.apple.driver.AppleMarconiBTDriver",  @"com.apple.driver.AppleMarconiBTDriver"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/CrashReporter/CoreCapture/MarconiBT",  v6));
    v11[1] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/logs/CrashReporter/CoreCapture/MarconiBT"));
    v11[2] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 3LL));
    [v5 addRules:v9];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyAppInstallationLogsContainer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"appinstallation",  @"logs/appinstallation",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099898));
    [v6 setMobileContainer:@"com.apple.appstored"];
    [v6 setMobileContainerClass:3];
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/com.apple.appstored"));
    v10[0] = v7;
    v10[1] = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
    [v5 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyCompanionSyncContainer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  BOOL v11 = 0;
  sub_100040418(@"LogStatistics", @"com.apple.companionsync", &v11);
  if (v11)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"CompanionSync",  @"logs/CompanionSync/defaults",  self));
    id v5 = v4;
    if (v4)
    {
      [v4 setRuntimeChecks:8];
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_1000998B0));
      v13 = v6;
      id v7 = &v13;
LABEL_6:
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 1LL));
      [v5 addRules:v9];

      [v3 addObject:v5];
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"CompanionSync",  @"logs/CompanionSync/internal",  self));
    id v5 = v8;
    if (v8)
    {
      [v8 setRuntimeChecks:9];
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_1000998C8));
      id v12 = v6;
      id v7 = &v12;
      goto LABEL_6;
    }
  }

  return v3;
}

- (id)_copyNanoPreferencesSyncLogs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"NanoPreferencesSync",  @"logs/NanoPreferencesSync",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyMCLogs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"MCState",  @"logs/MCState",  self));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = [&off_1000998E0 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(&off_1000998E0);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"NOT SELF CONTAINS %@",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v9)));
        [v5 addObject:v10];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [&off_1000998E0 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v7);
  }

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v5));
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/Library/ConfigurationProfiles/",  0LL,  0LL,  v11,  0LL,  @"Shared",  0LL));
    v20[0] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:atInternalDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:atInternalDirectory:",  @"/private/var/mobile/Library/UserConfigurationProfiles",  @"User"));
    v20[1] = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
    [v4 addRules:v14];

    [v3 addObject:v4];
  }

  return v3;
}

- (id)_copyMobileAssetHistoryLogs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"MobileAssetHistory",  @"logs/MobileAsset/history",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/MobileAsset/AssetsV2/history" stringByAppendingPathComponent:@"MAAutoAsset_{Filesystem,Locker,Atomic,Error,Secure,Stager,Scheduler}_History"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@".txt"]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](&OBJC_CLASS___SDUnitLogGlob, "logRuleWithGlob:", v7));
    v13[0] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"_0[0-9].log"]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](&OBJC_CLASS___SDUnitLogGlob, "logRuleWithGlob:", v9));
    v13[1] = v10;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
    [v5 addRules:v11];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copySplunkHistoryLogs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"SplunkHistory",  @"logs/MobileSoftwareUpdate",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    [v5 setMaximumSizeMB:2];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/" stringByAppendingPathComponent:@"SUCoreSplunkHistory.log*"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](&OBJC_CLASS___SDUnitLogGlob, "logRuleWithGlob:", v6));
    id v10 = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    [v5 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copySiriLogsContainer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"Siri",  @"logs/Siri",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self.lastPathComponent MATCHES 'OPUS_.+\\.opx|PCM-.+\\.wav'"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter/Assistant/SpeechLogs",  0LL,  0LL,  v6,  0LL,  @"SpeechLogs",  0LL));
    v12[0] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter/VoiceTrigger/audio/*.json",  0LL,  0LL,  0LL,  @"VoiceTrigger",  0LL));
    v12[1] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter/VoiceTrigger/audio/*.wav",  0LL,  0LL,  0LL,  @"VoiceTrigger",  1LL));
    v12[2] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 3LL));
    [v5 addRules:v10];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyParsecdBagLogs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v5 = sub_100024534(@"group.com.apple.PegasusConfiguration", 0);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Identified app group container path for parsecd: %@",  buf,  0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"config.plist"]);
    -[NSMutableArray addObject:](v4, "addObject:", v7);
  }

  if (-[NSMutableArray count](v4, "count"))
  {
    id v8 = -[NSMutableArray copy](v4, "copy");
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"parsecd",  @"logs/parsecd",  self));
    id v10 = v9;
    if (v9)
    {
      [v9 setRuntimeChecks:8];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](&OBJC_CLASS___SDUnitLogPathArray, "logRuleWithPaths:", v8));
      id v14 = v11;
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
      [v10 addRules:v12];

      [v3 addObject:v10];
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "No parsecd paths to collect - exiting",  buf,  2u);
  }

  return v3;
}

- (id)_copyAccessibilityPreferences
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"AccessibilityPrefs",  @"logs/AccessibilityPrefs",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    [v5 setMaximumSizeMB:1];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_1000998F8));
    id v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addRules:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyVideoProcessingLogs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"VideoProcessing",  @"logs/VideoProcessing",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/CrashReporter/VideoProcessing/Stats"));
    id v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addRules:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyThermalLogs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"ThermalLogs",  @"logs/Thermal",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    [v5 setMaximumSizeMB:10];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099910));
    v10[0] = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  &off_100099928,  0LL,  0LL,  0LL,  0LL,  1LL));
    v10[1] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
    [v5 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)copyCoreaudioReportingLogs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"coreaudio reporting",  @"logs/CoreaudioReporting",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:-21600.0]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Audio/Reporting",  1LL,  v7,  0LL,  0LL,  0LL,  0LL));
    BOOL v11 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    [v5 addRules:v9];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getSimplePathArrayContainer:(id)a3 withContainerName:(id)a4 andDestination:(id)a5 withOffsets:(id)a6 sizes:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  v16,  v15,  self));

  if (v18)
  {
    [v18 setMaximumSizeMB:0];
    [v18 setRuntimeChecks:8];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](&OBJC_CLASS___SDUnitLogPathArray, "logRuleWithPaths:", v12));
    [v19 setOffsets:v13];
    [v19 setSizes:v14];
    uint64_t v22 = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    [v18 addRules:v20];

    [v17 addObject:v18];
  }

  return v17;
}

- (id)getSimplePathArrayContainer:(id)a3 withContainerName:(id)a4 andDestination:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 0LL));
  __int128 v18 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 5242880LL));
  __int128 v17 = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[SystemDiagnostic getSimplePathArrayContainer:withContainerName:andDestination:withOffsets:sizes:]( self,  "getSimplePathArrayContainer:withContainerName:andDestination:withOffsets:sizes:",  v10,  v9,  v8,  v12,  v14));
  return v15;
}

- (id)getSimpleDirectoryContainer:(id)a3 withContainerName:(id)a4 andDestination:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  v10,  v9,  self));

  if (v12)
  {
    [v12 setRuntimeChecks:8];
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  v8));
    id v16 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
    [v12 addRules:v14];

    [v11 addObject:v12];
  }

  return v11;
}

- (id)_copyAstroLogsContainer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"astro",  @"logs/Astro",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:11];
    [v5 setMaximumSizeMB:100];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/logs/Astro"));
    id v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addRules:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_getCalendarPrefLogs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"CalendarPreferences",  @"logs/CalendarPreferences",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    [v5 addRules:&__NSArray0__struct];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)_getAGXMTLCompilerCrashLogs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"AGXMTLCompilerCrash",  @"logs/AGXMTLCompiler",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/AGX"));
    v10[0] = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/MTLCompiler/"));
    v10[1] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
    [v5 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyTCCLogs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"Accessibility",  @"logs/Accessibility",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/TCC"));
    id v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addRules:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copySiriAnalyticsDB
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"SiriAnalytics",  @"logs/SiriAnalytics",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setMaximumSizeMB:7];
    [v5 setRuntimeChecks:8];
    id v10 = @"/private/var/mobile/Library/Assistant/SiriAnalytics.db";
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](&OBJC_CLASS___SDUnitLogPathArray, "logRuleWithPaths:", v6));
    BOOL v11 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    [v5 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_getCloudKitBookmarksContainer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dateByAddingTimeInterval:-518400.0]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(pathExtension IN %@)",  &off_100099940));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"CloudKitBookmarks",  @"logs",  self));
  id v8 = v7;
  if (v7)
  {
    [v7 setRuntimeChecks:8];
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"~/Library/Safari/CloudBookmarksMigrationCoordinator",  0LL,  v5,  v6,  0LL,  @"CloudKitBookmarks",  0LL));
    [v9 setResolveHomeDirs:0];
    id v12 = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    [v8 addRules:v10];

    [v3 addObject:v8];
  }

  return v3;
}

- (id)_getMapsSyncJournalContainer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"MapsSyncJournal",  @"logs",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099958));
    id v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addRules:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyMobileActivationLogsContainer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"MobileActivation",  @"logs/MobileActivation",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:8];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"ucrt_oob_request.txt"]);
    v26[0] = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"ucrt_oob_response.txt"]);
    v26[1] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"collection_oob_request.txt"]);
    v26[2] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"collection_oob_response.txt"]);
    v26[3] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 4LL));
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](&OBJC_CLASS___SDUnitLogPathArray, "logRuleWithPaths:", v10));

    v25[0] = v23;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"mobileactivationd.log.*"]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](&OBJC_CLASS___SDUnitLogGlob, "logRuleWithGlob:", v22));
    v25[1] = v21;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"*baa_request.txt"]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](&OBJC_CLASS___SDUnitLogGlob, "logRuleWithGlob:", v11));
    v25[2] = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"*baa_response.txt"]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](&OBJC_CLASS___SDUnitLogGlob, "logRuleWithGlob:", v13));
    v25[3] = v14;
    unint64_t v24 = v3;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"*baa_su_request.txt"]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](&OBJC_CLASS___SDUnitLogGlob, "logRuleWithGlob:", v15));
    v25[4] = v16;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mobile/Library/Logs/mobileactivationd" stringByAppendingPathComponent:@"*baa_su_response.txt"]);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](&OBJC_CLASS___SDUnitLogGlob, "logRuleWithGlob:", v17));
    v25[5] = v18;
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 6LL));
    [v5 addRules:v19];

    v3 = v24;
    [v24 addObject:v5];
  }

  return v3;
}

- (id)_copySentryPlistsContainer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"Sentry",  @"logs/Sentry/",  self));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](&OBJC_CLASS___SDUnitLogPathArray, "logRuleWithPaths:", 0LL));
    id v8 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    [v4 addRules:v6];

    [v4 setRuntimeChecks:8];
    [v3 addObject:v4];
  }

  return v3;
}

- (id)_copyWatchdogTailspins
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"watchdog",  @"logs/watchdog",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    [v5 setMaximumSizeMB:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:-3600.0]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter/watchdog*.tailspin",  v7,  0LL,  1LL,  0LL,  0LL));
    BOOL v11 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    [v5 addRules:v9];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyWatchdogdDDTs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"watchdogd ddts",  @"logs/watchdog",  self));
  id v5 = sub_100023F88(@"watchdog-*-ddt-*.txt");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    [v4 setMaximumSizeMB:10];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:-86400.0]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  v6,  v8,  0LL,  0LL,  0LL,  0LL));
    id v12 = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    [v4 addRules:v10];

    [v3 addObject:v4];
  }

  return v3;
}

- (id)_getCrashesAndSpinsContainer
{
  id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dateByAddingTimeInterval:-86400.0]);

  if (sub_10004024C())
  {
    id v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([&off_100099988 arrayByAddingObject:@"ips.ca"]);
    id v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([&off_1000999A0 arrayByAddingObject:@"ips.ca"]);
  }

  else
  {
    id v5 = &off_100099988;
    id v6 = &off_1000999A0;
  }

  uint64_t v22 = v5;
  id v25 = (void *)objc_claimAutoreleasedReturnValue( -[SystemDiagnostic getPredicateForFileTypes:withExcludedPrefixes:]( self,  "getPredicateForFileTypes:withExcludedPrefixes:",  v5,  &off_100099970));
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[SystemDiagnostic getPredicateForFileTypes:withExcludedPrefixes:]( self,  "getPredicateForFileTypes:withExcludedPrefixes:",  v6,  &off_100099970));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mobile/Library/Logs/CrashReporter" stringByAppendingPathComponent:@"Retired"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:@"crashes_and_spins"]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v10 createDirectoryAtPath:v9 withIntermediateDirectories:0 attributes:0 error:0];

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:@"README.txt"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [@"The summary of all the files collected is located in <sysdiagnose_dir>/summaries/crashes_and_spins.log" dataUsingEncoding:4]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSFileAttributeKey v27 = NSFilePosixPermissions;
  id v28 = &off_10009A3D8;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  [v13 createFileAtPath:v11 contents:v12 attributes:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"crashes and spins",  @"crashes_and_spins",  self));
  id v16 = v15;
  if (v15)
  {
    [v15 setResolveHomeDirs:0];
    [v16 setMaximumSizeMB:20];
    [v16 setMaxVariety:1];
    [v16 setRuntimeChecks:8];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter",  1LL,  v4,  v25,  0LL,  0LL,  0LL));
    v26[0] = v17;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  v7,  1LL,  v4,  v24,  0LL,  @"Retired",  0LL));
    v26[1] = v18;
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/CrashReporter/MemoryGraph_SpringBoard*.memgraph",  0LL,  0LL,  1LL,  0LL,  1LL));
    v26[2] = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 3LL));
    [v16 addRules:v20];

    [v23 addObject:v16];
  }

  return v23;
}

- (id)includeSyncedExtensionForFileTypes:(id)a3
{
  id v3 = [a3 mutableCopy];
  unsigned int v4 = (char *)[v3 count];
  if (v4)
  {
    id v5 = v4;
    for (i = 0LL; i != v5; ++i)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:i]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathExtension:@"synced"]);
      [v3 addObject:v8];
    }
  }

  return v3;
}

- (id)getPredicateForFileTypes:(id)a3 withExcludedPrefixes:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 arrayByAddingObjectsFromArray:&off_1000999B8]);
  if ((sub_10004024C() & 1) == 0)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 arrayByAddingObjectsFromArray:&off_1000999D0]);

    id v7 = (void *)v8;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSubPredicateForPrefixes:](self, "getSubPredicateForPrefixes:", v7));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSubPredicateForFileTypes:](self, "getSubPredicateForFileTypes:", v6));

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ AND %@",  v9,  v10));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", v11));

  return v12;
}

- (id)getSubPredicateForPrefixes:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  __int128 v17 = sub_100015EC4;
  __int128 v18 = sub_100015ED4;
  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_100015EDC;
  id v10 = &unk_1000890C8;
  id v13 = &v14;
  BOOL v11 = @"(NOT (SELF.lastPathComponent BEGINSWITH '%@'))";
  id v4 = v3;
  id v12 = v4;
  [v4 enumerateObjectsUsingBlock:&v7];
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(%@)",  v15[5],  v7,  v8,  v9,  v10));

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (id)getSubPredicateForFileTypes:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SystemDiagnostic includeSyncedExtensionForFileTypes:]( self,  "includeSyncedExtensionForFileTypes:",  a3));
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  __int128 v17 = sub_100015EC4;
  __int128 v18 = sub_100015ED4;
  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_100016078;
  id v10 = &unk_1000890C8;
  id v13 = &v14;
  BOOL v11 = @"SELF.lastPathComponent ENDSWITH '%@'";
  id v4 = v3;
  id v12 = v4;
  [v4 enumerateObjectsUsingBlock:&v7];
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(%@)",  v15[5],  v7,  v8,  v9,  v10));

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (id)_copyMobileInstallationLogsContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"Library/Logs"));
  [v4 setMobileContainer:@"systemgroup.com.apple.mobile.installationhelperlogs"];
  [v4 setMobileContainerClass:1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"MobileInstallation",  @"logs/MobileInstallation",  self));
  id v6 = v5;
  if (v5)
  {
    [v5 setRuntimeChecks:8];
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/installd/Library/Logs/MobileInstallation/mobile_installation{,_helper}.log.[01234]"));
    v10[0] = v7;
    v10[1] = v4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
    [v6 addRules:v8];

    [v3 addObject:v6];
  }

  return v3;
}

- (id)getLogCopyingContainers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _iOSgetLogCopyingContainers](self, "_iOSgetLogCopyingContainers"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAutogenLogCopyingContainers](self, "getAutogenLogCopyingContainers"));
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (id)_iOSgetLogGenerationContainers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v72 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Log Generation start\n",  v72,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v4 log:@"Log Generation start\n"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getRemotectlContainer](self, "getRemotectlContainer"));
  [v3 addObjectsFromArray:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getInternalLogsContainer](self, "getInternalLogsContainer"));
  [v3 addObjectsFromArray:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getclpcContainer](self, "getclpcContainer"));
  [v3 addObjectsFromArray:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getclpcctrlContainer](self, "getclpcctrlContainer"));
  [v3 addObjectsFromArray:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLGSystemInfoContainer](self, "getLGSystemInfoContainer"));
  [v3 addObjectsFromArray:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getGNIContainer](self, "getGNIContainer"));
  [v3 addObjectsFromArray:v10];

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getCoreDuetLogs](self, "getCoreDuetLogs"));
  [v3 addObjectsFromArray:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getASPSnapshotsContainers](self, "getASPSnapshotsContainers"));
  [v3 addObjectsFromArray:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getProximityContainers](self, "getProximityContainers"));
  [v3 addObjectsFromArray:v13];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSpuctlContainer](self, "getSpuctlContainer"));
  [v3 addObjectsFromArray:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getASPTraceContainers](self, "getASPTraceContainers"));
  [v3 addObjectsFromArray:v15];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getGestaltQueryContainer](self, "getGestaltQueryContainer"));
  [v3 addObjectsFromArray:v16];

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getc26ToolContainer](self, "getc26ToolContainer"));
  [v3 addObjectsFromArray:v17];

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLibnotifyContainer](self, "getLibnotifyContainer"));
  [v3 addObjectsFromArray:v18];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAopaudctlContainer](self, "getAopaudctlContainer"));
  [v3 addObjectsFromArray:v19];

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAHSToolContainer](self, "getAHSToolContainer"));
  [v3 addObjectsFromArray:v20];

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSysCfgContainer](self, "getSysCfgContainer"));
  [v3 addObjectsFromArray:v21];

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getMediaContainer](self, "getMediaContainer"));
  [v3 addObjectsFromArray:v22];

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSoundBoardContainer](self, "getSoundBoardContainer"));
  [v3 addObjectsFromArray:v23];

  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getosvariantUtilContainer](self, "getosvariantUtilContainer"));
  [v3 addObjectsFromArray:v24];

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getFreezerctlContainer](self, "getFreezerctlContainer"));
  [v3 addObjectsFromArray:v25];

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getcontrolbitsContainer](self, "getcontrolbitsContainer"));
  [v3 addObjectsFromArray:v26];

  NSFileAttributeKey v27 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAOPFirmwareStateContainer](self, "getAOPFirmwareStateContainer"));
  [v3 addObjectsFromArray:v27];

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getCADebugContainer](self, "getCADebugContainer"));
  [v3 addObjectsFromArray:v28];

  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getEnumerateCrashReporterContainer](self, "getEnumerateCrashReporterContainer"));
  [v3 addObjectsFromArray:v29];

  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSelfCtlContainer](self, "getSelfCtlContainer"));
  [v3 addObjectsFromArray:v30];

  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getHomeUtilDumpAllContainer](self, "getHomeUtilDumpAllContainer"));
  [v3 addObjectsFromArray:v31];

  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getHomeUtilAccessoryStateContainer](self, "getHomeUtilAccessoryStateContainer"));
  [v3 addObjectsFromArray:v32];

  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getEarcutilContainer](self, "getEarcutilContainer"));
  [v3 addObjectsFromArray:v33];

  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getPbctlUserprofilesContainer](self, "getPbctlUserprofilesContainer"));
  [v3 addObjectsFromArray:v34];

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getExposureNotificationContainer](self, "getExposureNotificationContainer"));
  [v3 addObjectsFromArray:v35];

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLGUtilitiesContainer](self, "getLGUtilitiesContainer"));
  [v3 addObjectsFromArray:v36];

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getIDSContainer](self, "getIDSContainer"));
  [v3 addObjectsFromArray:v37];

  id v38 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getIOREGContainer](self, "getIOREGContainer"));
  [v3 addObjectsFromArray:v38];

  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getHIDReportContainers](self, "getHIDReportContainers"));
  [v3 addObjectsFromArray:v39];

  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getHIDRecorderdContainer](self, "getHIDRecorderdContainer"));
  [v3 addObjectsFromArray:v40];

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getStoreServicesContainer](self, "getStoreServicesContainer"));
  [v3 addObjectsFromArray:v41];

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSPIContainers](self, "getSPIContainers"));
  [v3 addObjectsFromArray:v42];

  id v43 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getCoreCaptureSPIContainer](self, "getCoreCaptureSPIContainer"));
  [v3 addObjectsFromArray:v43];

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getBaseBandContainer](self, "getBaseBandContainer"));
  [v3 addObjectsFromArray:v44];

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSoundAutoConfigContainer](self, "getSoundAutoConfigContainer"));
  [v3 addObjectsFromArray:v45];

  unsigned int v46 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getMicrostackshotsWithPostContainers](self, "getMicrostackshotsWithPostContainers"));
  [v3 addObjectsFromArray:v46];

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getDSCSYMContainer](self, "getDSCSYMContainer"));
  [v3 addObjectsFromArray:v47];

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAirPlayContainer](self, "getAirPlayContainer"));
  [v3 addObjectsFromArray:v48];

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getGMSAvailabilityContainer](self, "getGMSAvailabilityContainer"));
  [v3 addObjectsFromArray:v49];

  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getStspContainer](self, "getStspContainer"));
  [v3 addObjectsFromArray:v50];

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getCKKSCTLContainer](self, "getCKKSCTLContainer"));
  [v3 addObjectsFromArray:v51];

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getOTCTLContainer](self, "getOTCTLContainer"));
  [v3 addObjectsFromArray:v52];

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getPreferencesLogs](self, "getPreferencesLogs"));
  [v3 addObjectsFromArray:v53];

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAppleInternalPreferencesLogs](self, "getAppleInternalPreferencesLogs"));
  [v3 addObjectsFromArray:v54];

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getExcResourceContainer](self, "getExcResourceContainer"));
  [v3 addObjectsFromArray:v55];

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getTimezoneDBLogs](self, "getTimezoneDBLogs"));
  [v3 addObjectsFromArray:v56];

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getPersonalizationLogs](self, "getPersonalizationLogs"));
  [v3 addObjectsFromArray:v57];

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getlaunchdAndCTSContainers](self, "getlaunchdAndCTSContainers"));
  [v3 addObjectsFromArray:v58];

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getApfsStatsContainer](self, "getApfsStatsContainer"));
  [v3 addObjectsFromArray:v59];

  id v60 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getRunningBoardLogs](self, "getRunningBoardLogs"));
  [v3 addObjectsFromArray:v60];

  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getKeyboardPrefContainer](self, "getKeyboardPrefContainer"));
  [v3 addObjectsFromArray:v61];

  unint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAccessibilityPrefContainer](self, "getAccessibilityPrefContainer"));
  [v3 addObjectsFromArray:v62];

  id v63 = -[SystemDiagnostic _copyBTLogsContainer](self, "_copyBTLogsContainer");
  [v3 addObjectsFromArray:v63];

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getFDRDiagnosticContainer](self, "getFDRDiagnosticContainer"));
  [v3 addObjectsFromArray:v64];

  uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getASPMagazineContainer](self, "getASPMagazineContainer"));
  [v3 addObjectsFromArray:v65];

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getBTPHYLogsContainer](self, "getBTPHYLogsContainer"));
  [v3 addObjectsFromArray:v66];

  unint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getswcutilContainer](self, "getswcutilContainer"));
  [v3 addObjectsFromArray:v67];

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getTrialRolloutsContainer](self, "getTrialRolloutsContainer"));
  [v3 addObjectsFromArray:v68];

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getDiskTasksContainer](self, "getDiskTasksContainer"));
  [v3 addObjectsFromArray:v69];

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getPowerLogContainer](self, "getPowerLogContainer"));
  [v3 addObjectsFromArray:v70];

  return v3;
}

- (id)getSelfCtlContainer
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v16[0] = @"tail";
  v16[1] = @"-r";
  v16[2] = @"1h";
  v16[3] = @"-f";
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([@"<TMPOUTPUTDIR>" stringByAppendingPathComponent:@"selfctl_tail.json"]);
  v16[4] = v14;
  v16[5] = @"--redact-tier1";
  v16[6] = @"--mobile-stream";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 7LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/selfctl",  v3,  @"selfctl_tail_stdout.txt"));
  v17[0] = v4;
  v15[0] = @"turns";
  v15[1] = @"-r";
  v15[2] = @"1h";
  v15[3] = @"-d";
  v15[4] = @"<TMPOUTPUTDIR>";
  v15[5] = @"--redact-tier1";
  v15[6] = @"--mobile-stream";
  id v5 = (void *)v2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 7LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/selfctl",  v6,  @"selfctl_turns_stdout.txt"));
  v17[1] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:",  v8,  &__NSArray0__struct,  @"logs/selfctl",  self,  1LL,  3.0));
  id v10 = v9;
  if (v9)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v9 taskContainer]);
    [v11 setName:@"selfctl"];

    [v10 setRuntimeChecks:17];
    [v5 addObject:v10];
  }

  return v5;
}

- (id)getEarcutilContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"earcutil",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = +[SDTask taskWithCommand:arguments:asUID:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:asUID:outputFile:",  @"/usr/local/bin/earcutil",  &off_1000999E8,  sub_1000207FC(),  @"earcutil.txt");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v10 = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    [v5 addSDTasksToContainer:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getSPIContainers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  7LL,  @"logs/AWD",  self,  10.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getHIDRecorderdContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/libexec/hidrecorderd.internal",  &off_100099A00,  0LL));
  id v13 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/logs/CrashReporter/hidrecorderd"));
  id v12 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:",  v5,  v7,  @"logs/hidrecorderd",  self,  5.0));
  if (v8)
  {
    else {
      uint64_t v9 = 2048LL;
    }
    else {
      uint64_t v10 = v9;
    }
    [v8 setRuntimeChecks:v10];
    [v3 addObject:v8];
  }

  return v3;
}

- (id)getStspContainer
{
  return +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
}

- (id)getExposureNotificationContainer
{
  return +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
}

- (id)getBaseBandContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (-[SystemDiagnostic requestSource](self, "requestSource") == 1)
  {
    uint64_t v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    BOOL v11 = sub_1000197D8;
    id v12 = &unk_100089138;
    id v13 = self;
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/abmlite",  &off_100099A18,  @"ambtool_output.log"));
    id v14 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:withCompletionBlock:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:withCompletionBlock:",  @"basebandMeta",  @"logs/Baseband",  1LL,  self,  &v9,  7.0));
    if (v5)
    {
      id v15 = v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v15,  1LL,  v9,  v10,  v11,  v12,  v13));
      [v5 addSDTasksToContainer:v6];

      else {
        uint64_t v7 = 16LL;
      }
      [v5 setRuntimeChecks:v7];
      [v3 addObject:v5];
    }
  }

  return v3;
}

- (id)getSoundAutoConfigContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithBlock:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithBlock:withTimeout:atDestination:withDelegate:",  &stru_100089178,  @"logs/SoundAutoConfig",  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    objc_msgSend(v5, "setRuntimeChecks:", (unint64_t)objc_msgSend(v5, "runtimeChecks") | 0x1000);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/mobile/Library/Logs/CrashReporter/SoundAutoConfig/SoundAutoConfig_StateDump*.plist"));
    uint64_t v10 = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    [v6 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getStoreServicesContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/asclient",  &off_100099A30,  0LL));
  v14[0] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/bin/sleep",  &off_100099A48,  0LL));
  v14[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/asclient",  &off_100099A60,  @"asclient_dump.txt"));
  v14[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 3LL));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"pathExtension IN %@",  @"har"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/mobile/Library/Logs/com.apple.StoreServices/HTTPArchives",  0LL,  0LL,  v8,  0LL,  0LL,  1LL));
  id v13 = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:",  v7,  v10,  @"logs/StoreServices",  self,  10.0));
  objc_msgSend(v11, "setRuntimeChecks:", (unint64_t)objc_msgSend(v11, "runtimeChecks") | 0x10);
  if (v11) {
    [v3 addObject:v11];
  }

  return v3;
}

- (id)getHIDReportContainers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"hidreport",  0LL,  0LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    __int128 v18 = v4;
    [v4 setRuntimeChecks:17];
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v6 = [&off_100099A78 countByEnumeratingWithState:&v19 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(&off_100099A78);
          }
          uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:@": \n"]);
          unint64_t v24 = v10;
          BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v24,  1LL));
          id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/bin/echo",  v11,  @"hidreport.log"));
          v25[0] = v12;
          v23[0] = @"--pid";
          v23[1] = @"619";
          v23[2] = @"-u";
          v23[3] = @"0xff00,0x000b";
          v23[4] = @"get";
          v23[5] = v9;
          id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 6LL));
          id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/hidreport",  v13,  @"hidreport.log"));
          v25[1] = v14;
          id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
          [v18 addSDTasksToContainer:v15];
        }

        id v7 = [&off_100099A78 countByEnumeratingWithState:&v19 objects:v26 count:16];
      }

      while (v7);
    }

    id v5 = v18;
    [v3 addObject:v18];
  }

  return v3;
}

- (id)getProximityContainers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  38LL,  @"Proximity",  self,  5.0));
  if (v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/mobile/Library/Logs/CrashReporter/Rose/"));
    v18[0] = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/db/nearbyd/nearbyd-*.protobuf.log"));
    v18[1] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
    uint64_t v9 = -[NSMutableArray initWithArray:](v5, "initWithArray:", v8);

    id v10 = sub_10002447C(@"systemgroup.com.apple.nearbyd.datastore");
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = v11;
    if (v11)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingString:@"/Library/nearbyd-*.protobuf.log"]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](&OBJC_CLASS___SDUnitLogGlob, "logRuleWithGlob:", v13));
      -[NSMutableArray addObject:](v9, "addObject:", v14);
    }

    [v4 setRuntimeChecks:16];
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 collectionContainer]);
    [v15 addRules:v9];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 collectionContainer]);
    [v16 setGenerateSummary:1];

    [v3 addObject:v4];
  }

  return v3;
}

- (id)getSpuctlContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"spuctl",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/spuctl",  &off_100099A90,  @"spuctl.txt"));
    uint64_t v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getBTPHYLogsContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  11LL,  @"BTPHY",  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/logs/CrashReporter/CoreCapture/AppleBTC-BTPHY-sysdiagnose"));
    BOOL v11 = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    [v6 addRules:v8];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    [v9 setGenerateSummary:1];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getHomeUtilDumpAllContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"HomeUtilDumpAll",  0LL,  1LL,  self,  10.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/homeutil",  &off_100099AA8,  @"homeutil_dump_all.txt"));
    uint64_t v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getHomeUtilAccessoryStateContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"HomeUtilDumpAccessoryState",  0LL,  1LL,  self,  10.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/homeutil",  &off_100099AC0,  @"homeutil_dump_accessory_state.txt"));
    uint64_t v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getASPTraceContainers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  6LL,  @"ASPSnapshots",  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    [v6 setGenerateSummary:1];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getc26ToolContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"c26tool",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/c26tool",  &off_100099AD8,  @"c26tool.txt"));
    uint64_t v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getAHSToolContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"AHSTool",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/AHSTool",  &off_100099AF0,  @"ahstool.txt"));
    uint64_t v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getMediaContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"mediaremotetool",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/mediaremotetool",  &off_100099B08,  @"mediaremote.txt"));
    uint64_t v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getSoundBoardContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"SoundBoard",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/soundboardtool",  &off_100099B20,  @"soundboard_state.txt"));
    uint64_t v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getFreezerctlContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"Freezerctl",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/freezerctl",  0LL,  @"freezerctl_status.txt"));
    uint64_t v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getAOPFirmwareStateContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"AOPFirmwareState",  0LL,  0LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/aopvtctl",  &off_100099B38,  @"aopvtctl_dump.txt"));
    v10[0] = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/aopenvsctl",  &off_100099B50,  @"aopenvsctl_dump.txt"));
    v10[1] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
    [v5 addSDTasksToContainer:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getPbctlUserprofilesContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"pbctl",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/pbctl",  &off_100099B68,  @"pbctl_userprofiles_list.txt"));
    uint64_t v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getAccessibilityPrefContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  1LL,  @"Preferences",  self,  10.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getExcResourceContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  20LL,  @"crashes_and_spins",  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    [v6 setMaximumSizeMB:10];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getEnumerateCrashReporterContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"Enumerate CrashReporter",  @"crashes_and_spins",  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = sub_100023F88(0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v12[0] = v7;
    v12[1] = @"-ls";
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/find",  v8,  @"enumerated_CrashReporter.txt"));
    id v13 = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    [v5 addSDTasksToContainer:v10];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getDiskTasksContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"disks-concurrent",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/diskutil",  &off_100099B80,  @"diskutil_list.txt"));
    uint64_t v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getAopaudctlContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"aopaudctl",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/aopaudctl",  &off_100099B98,  @"aopaudctl_dump.txt"));
    uint64_t v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyBTLogsContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  13LL,  @"logs/Bluetooth/CoreCapture",  self,  10.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    [v6 setGenerateSummary:1];

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    [v7 setMaximumSizeMB:15];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getSysCfgContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"syscfg",  0LL,  0LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/sysconfig",  &off_100099BB0,  @"sysconfig.log"));
    v10[0] = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/sysconfig",  &off_100099BC8,  @"sysconfig_debug.log"));
    v10[1] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
    [v5 addSDTasksToContainer:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getLibnotifyContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  27LL,  @"logs/libnotify",  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getBatteryUIContainer
{
  return +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
}

- (id)getTrialRolloutsContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  52LL,  @"logs/Trial",  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getTimezoneDBLogs
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  51LL,  @"TimezoneDB",  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    [v6 setGenerateSummary:1];

    [v3 addObject:v5];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"timezonedb",  @"TimezoneDB",  1LL,  self,  5.0));
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 setRuntimeChecks:17];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/bin/ls",  &off_100099BE0,  @"timezone_db.log"));
    id v12 = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    [v8 addSDTasksToContainer:v10];

    [v3 addObject:v8];
  }

  return v3;
}

- (id)getPreferencesLogs
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  34LL,  @"Preferences",  self,  20.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    [v6 setGenerateSummary:1];

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099BF8));
    BOOL v11 = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    [v7 addRules:v9];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getAppleInternalPreferencesLogs
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  35LL,  @"Preferences",  self,  20.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    [v6 setGenerateSummary:1];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getPersonalizationLogs
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  32LL,  @"Personalization",  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    [v6 setGenerateSummary:1];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getRunningBoardLogs
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  39LL,  @"RunningBoard",  self,  10.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    [v6 setGenerateSummary:1];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getRemotectlContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"remotectl",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/libexec/remotectl",  &off_100099C10,  @"remotectl_dumpstate.txt"));
    uint64_t v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getCoreDuetLogs
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"coreduet",  @"logs/coreduet",  1LL,  self,  8.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/cdknowledgetool",  &off_100099C28,  @"cdknowledgetool.log"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/cdknowledgetool",  &off_100099C40,  @"cdknowledgetool_syncstream.log",  v6));
    v14[1] = v7;
    uint64_t v8 = +[SDTask taskWithCommand:arguments:asUID:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:asUID:outputFile:",  @"/usr/local/bin/cdknowledgetool",  &off_100099C58,  sub_1000207FC(),  @"cdknowledgetool_stats.log");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v14[2] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/cdcontexttool",  &off_100099C70,  @"cdcontexttool_dumpregistrations.log"));
    void v14[3] = v10;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask shellTaskWithCommand:outputFile:]( &OBJC_CLASS___SDTask,  "shellTaskWithCommand:outputFile:",  @"/usr/local/bin/cdinteracttool summarizeData | /usr/bin/grep -E -v \"Accounts:|Data\",  @"cdinteracttool.log""));
    v14[4] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 5LL));
    [v5 addSDTasksToContainer:v12];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getlaunchdContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"launchdLogs",  @"logs/launchd",  self));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    [v5 setMaximumSizeMB:20];
    id v25 = v3;
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"*.crash"]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](&OBJC_CLASS___SDUnitLogGlob, "logRuleWithGlob:", v24));
    v27[0] = v23;
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"*.ips"]);
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](&OBJC_CLASS___SDUnitLogGlob, "logRuleWithGlob:", v22));
    v27[1] = v21;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"*.shutdowntimeout"]);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](&OBJC_CLASS___SDUnitLogGlob, "logRuleWithGlob:", v20));
    v27[2] = v19;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"launchd.log"]);
    v26[0] = v18;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"launchd.log.1"]);
    v26[1] = v17;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"launchd.log.2"]);
    v26[2] = v16;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 3LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](&OBJC_CLASS___SDUnitLogPathArray, "logRuleWithPaths:", v6));
    v27[3] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF.lastPathComponent MATCHES %@",  @"launches\\.\\d{4}(-\\d{2}){2}(.\\d{2}){3}\\.log"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/log/com.apple.xpc.launchd",  0LL,  0LL,  v8,  0LL,  0LL,  0LL));
    v27[4] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"*.shutdownstall"]);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](&OBJC_CLASS___SDUnitLogGlob, "logRuleWithGlob:", v10));
    v27[5] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/log/com.apple.xpc.launchd" stringByAppendingPathComponent:@"*.tailspin"]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](&OBJC_CLASS___SDUnitLogGlob, "logRuleWithGlob:", v12));
    v27[6] = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 7LL));
    [v5 addRules:v14];

    id v3 = v25;
    [v25 addObject:v5];
  }

  return v3;
}

- (id)getlaunchdAndCTSContainers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"launchCTL",  0LL,  0LL,  self,  10.0));
  [v4 setRuntimeChecks:16];
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:",  @"/bin/launchctl",  &off_100099C88,  0LL,  @"launchctl-list-0.txt"));
  v18[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/bin/launchctl",  &off_100099CA0,  @"launchctl-print-system.txt"));
  v18[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/bin/launchctl",  &off_100099CB8,  @"launchctl-dumpstate.txt"));
  void v18[2] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 3LL));
  [v4 addSDTasksToContainer:v8];

  if (v4) {
    [v3 addObject:v4];
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getlaunchdContainer](self, "getlaunchdContainer"));
  [v3 addObjectsFromArray:v9];

  if (sub_10004024C())
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:",  @"/usr/local/bin/ctsctl",  &off_100099CD0,  0LL,  @"ctsctl-list-0.txt"));
    uint64_t v17 = v10;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  }

  else
  {
    BOOL v11 = &__NSArray0__struct;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  @"/private/var/log/module/com.apple.xpc.activity"));
  uint64_t v16 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:",  v11,  v13,  &stru_10008D288,  self,  6.0));
  [v14 setRuntimeChecks:16];
  if (v14)
  {
    [v14 setName:@"cts"];
    [v3 addObject:v14];
  }

  return v3;
}

- (id)getMicrostackshotsWithPostContainers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dateByAddingTimeInterval:-259200.0]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  [v6 timeIntervalSince1970];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", (uint64_t)v7));

  [v5 timeIntervalSince1970];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", (uint64_t)v9));
  v18[0] = @"-oslog";
  v18[1] = @"-microstackshots_only";
  void v18[2] = @"-microstackshots_save";
  void v18[3] = @"-microstackshots_datastore";
  v18[4] = @"<TMPOUTPUTDIR>/microstackshots";
  v18[5] = @"-microstackshots_starttime";
  v18[6] = v10;
  v18[7] = @"-microstackshots_endtime";
  v18[8] = v8;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 9LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/sbin/spindump",  v11,  @"errors/microstackshots_errors.txt"));
  __int128 v19 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:",  v13,  &__NSArray0__struct,  &stru_10008D288,  self,  45.0));
  id v15 = v14;
  if (v14)
  {
    [v14 setName:@"microstackshots"];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 collectionContainer]);
    [v16 setMaximumSizeMB:200];

    [v15 setRuntimeChecks:16];
    [v3 addObject:v15];
  }

  return v3;
}

- (id)getIOREGContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"ioreg",  @"ioreg",  0LL,  self,  30.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/sbin/ioreg",  &off_100099CE8,  @"IOService.txt"));
    v16[0] = v15;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/sbin/ioreg",  &off_100099D00,  @"IOACPIPlane.txt"));
    v16[1] = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/sbin/ioreg",  &off_100099D18,  @"IOPower.txt"));
    v16[2] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/sbin/ioreg",  &off_100099D30,  @"IODeviceTree.txt"));
    v16[3] = v8;
    double v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/sbin/ioreg",  &off_100099D48,  @"IOUSB.txt"));
    v16[4] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/sbin/ioreg",  &off_100099D60,  @"IOFireWire.txt"));
    v16[5] = v10;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/sbin/ioreg",  &off_100099D78,  @"IOPort.txt"));
    v16[6] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/sbin/ioreg",  &off_100099D90,  @"IOReg.xml"));
    void v16[7] = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 8LL));
    [v5 addSDTasksToContainer:v13];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getGNIContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  [v4 addObject:@"-s"];
  [v4 addObject:@"<TMPOUTPUTDIR>"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/System/Library/Frameworks/SystemConfiguration.framework/get-network-info",  v4,  @"errors/get_network_info_errors.txt"));
  BOOL v11 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));

  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:",  v6,  &__NSArray0__struct,  @"logs/Networking",  self,  100.0));
  uint64_t v8 = v7;
  if (v7)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 collectionContainer]);
    [v9 setMaximumSizeMB:10];

    [v8 setRuntimeChecks:17];
    [v3 addObject:v8];
  }

  return v3;
}

- (id)getsysconfigInternalLogsContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"sysconfigInternalLogs",  0LL,  1LL,  self,  15.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/sbin/sysctl",  &off_100099DA8,  @"sysctl.txt",  17LL));
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/sbin/nvram",  &off_100099DC0,  @"nvram.txt",  17LL,  v6));
    v13[1] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/bin/sw_vers",  0LL,  @"sw_vers.txt",  17LL));
    void v13[2] = v8;
    double v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/local/bin/cdcontexttool",  &off_100099DD8,  @"cdcontexttool.txt",  17LL));
    v13[3] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/local/bin/darwinup",  &off_100099DF0,  @"darwinup.txt",  17LL));
    v13[4] = v10;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 5LL));
    [v5 addSDTasksToContainer:v11];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getIOLogsContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"IOLogs",  0LL,  1LL,  self,  10.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/local/bin/iordump",  0LL,  @"iordump.txt",  17LL));
    v12[0] = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/sbin/ioalloccount",  0LL,  @"ioalloccount.txt",  17LL));
    v12[1] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/sbin/ioclasscount",  0LL,  @"ioclasscount.txt",  17LL));
    void v12[2] = v8;
    double v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/hpmdiagnose",  0LL,  @"hpmDiagnose.txt"));
    void v12[3] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 4LL));
    [v5 addSDTasksToContainer:v10];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getPowerLogContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  33LL,  @"logs/powerlogs/",  self,  20.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    [v6 setMaximumSizeMB:0];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getaccountsInternalLogsContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"accountInternalLogs",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/accctl",  &off_100099E08,  @"accctl.txt"));
    v10[0] = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/accounts_tool",  &off_100099E20,  @"accounts_list.txt"));
    v10[1] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
    [v5 addSDTasksToContainer:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getmiscInternalLogsContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"miscInternalLogs",  0LL,  1LL,  self,  20.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/local/bin/keystorectl",  &off_100099E38,  @"lock_state.txt",  17LL));
    v17[0] = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/local/bin/findmydevicetool",  &off_100099E50,  0LL,  17LL));
    v17[1] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/local/bin/BacklightdTester",  &off_100099E68,  0LL,  17LL));
    void v17[2] = v8;
    double v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/local/bin/mbtool",  &off_100099E80,  @"mbtool.txt",  17LL));
    v17[3] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 4LL));
    [v5 addSDTasksToContainer:v10];

    [v3 addObject:v5];
  }

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"lsawLogs",  0LL,  1LL,  self,  60.0));
  id v12 = v11;
  if (v11)
  {
    [v11 setRuntimeChecks:16];
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/bin/lsdiagnose",  &__NSArray0__struct,  @"lsaw.csstoredump",  16LL));
    uint64_t v16 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
    [v12 addSDTasksToContainer:v14];

    [v3 addObject:v12];
  }

  return v3;
}

- (id)getInternalLogsContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getsysconfigInternalLogsContainer](self, "getsysconfigInternalLogsContainer"));
  [v3 addObjectsFromArray:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getIOLogsContainer](self, "getIOLogsContainer"));
  [v3 addObjectsFromArray:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getaccountsInternalLogsContainer](self, "getaccountsInternalLogsContainer"));
  [v3 addObjectsFromArray:v6];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getmiscInternalLogsContainer](self, "getmiscInternalLogsContainer"));
  [v3 addObjectsFromArray:v7];

  return v3;
}

- (id)getLGUtilitiesContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = sub_1000207FC();
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"utilities-logGen",  0LL,  1LL,  self,  25.0));
  id v6 = v5;
  if (v5)
  {
    [v5 setRuntimeChecks:16];
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:",  @"/usr/libexec/security-sysdiagnose",  &__NSArray0__struct,  v4,  @"security-sysdiagnose.txt"));
    [v7 setRuntimeChecks:0];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/bin/buttontool",  &off_100099E98,  @"buttontool.txt",  1LL));
    __int128 v18 = v8;
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    [v6 addSDTasksToContainer:v9];

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/codecctl",  &off_100099EB0,  @"codecctl.txt"));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/local/bin/apsclient",  &off_100099EC8,  @"apsclient.txt",  1LL,  v10));
    v17[1] = v11;
    void v17[2] = v7;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/local/bin/audioDeviceDump",  &__NSArray0__struct,  @"audioDeviceDump.txt",  1LL));
    v17[3] = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:",  @"/usr/libexec/pcsstatus",  &off_100099EE0,  v4,  @"pcsstatus.txt"));
    void v17[4] = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/hidutil",  &off_100099EF8,  @"hidutil.plist"));
    v17[5] = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 6LL));
    [v6 addSDTasksToContainer:v15];

    [v3 addObject:v6];
  }

  return v3;
}

- (id)getLGSystemInfoContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"systemInfo-logGen",  0LL,  1LL,  self,  10.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/sbin/kextstat",  0LL,  @"kextstat.txt"));
    v10[0] = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/bin/pmset",  &off_100099F10,  @"pmset_everything.txt",  1LL));
    v10[1] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
    [v5 addSDTasksToContainer:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getIDSContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = sub_1000207FC();
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"idsTasks",  0LL,  0LL,  self,  20.0));
  id v6 = v5;
  if (v5)
  {
    [v5 setRuntimeChecks:144];
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/imtool",  &off_100099F28,  @"imtool_list.txt"));
    v13[0] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/idstool",  &off_100099F40,  @"idstool_list.txt"));
    v13[1] = v8;
    double v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:",  @"/usr/local/bin/imtool",  &off_100099F58,  v4,  @"imtool_info.txt"));
    void v13[2] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:",  @"/usr/local/bin/idstool",  &off_100099F70,  v4,  @"idstool_info.txt"));
    v13[3] = v10;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));
    [v6 addSDTasksToContainer:v11];

    [v3 addObject:v6];
  }

  return v3;
}

- (id)getGestaltQueryContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"gestalt query",  0LL,  1LL,  self,  10.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    if (-[SystemDiagnostic isTestingMode](self, "isTestingMode")) {
      id v6 = @"-plist";
    }
    else {
      id v6 = @" ";
    }
    double v7 = (void *)objc_claimAutoreleasedReturnValue([&off_100099F88 componentsJoinedByString:@" || "]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ $(%@ -listKeys | %@ 'NR == 1 || NR == 2 || %@ {next}; {print $1}')",
                     @"/usr/local/bin/gestalt_query",
                     v6,
                     @"/usr/local/bin/gestalt_query",
                     @"/usr/bin/awk",
                     v7));
    double v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask shellTaskWithCommand:outputFile:]( &OBJC_CLASS___SDTask,  "shellTaskWithCommand:outputFile:",  v8,  @"gestalt_query.txt"));
    id v12 = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    [v5 addSDTasksToContainer:v10];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getDSCSYMContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  18LL,  @"logs/olddsc",  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    [v6 setMaximumSizeMB:10];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getCoreCaptureSPIContainer
{
  uint64_t v21 = 0LL;
  __int128 v22 = (double *)&v21;
  uint64_t v23 = 0x2020000000LL;
  uint64_t v24 = 0x4030000000000000LL;
  uint64_t v17 = 0LL;
  __int128 v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 10LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  15LL,  @"/WiFi",  self,  v22[3]));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    [v6 setGenerateSummary:1];

    double v7 = v22[3];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 taskContainer]);
    [v8 setTimeout:v7];

    uint64_t v9 = v18[3];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    [v10 setMaximumSizeMB:v9];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    void v13[2] = sub_10001E1AC;
    v13[3] = &unk_1000891A0;
    id v14 = v5;
    id v15 = &v21;
    uint64_t v16 = &v17;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogAgentContainer containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:]( &OBJC_CLASS___SDLogAgentContainer,  "containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:",  @"CoreCaptureConfig",  14LL,  self,  0LL,  v13,  5.0));
    if (v11) {
      [v3 addObject:v11];
    }
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v3;
}

- (id)getCDDebugContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/cddebug",  &off_100099FA0,  0LL));
  id v12 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_100099FB8));
  BOOL v11 = v6;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:",  v5,  v7,  &stru_10008D288,  self,  3.0));
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 setName:@"cdDebug"];
    [v9 setRuntimeChecks:17];
    [v3 addObject:v9];
  }

  return v3;
}

- (id)getAirPlayContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"AirPlay",  @"logs/AirPlay",  0LL,  self,  8.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/airplayutil",  &off_100099FD0,  @"AirPlay.txt"));
    v12[0] = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/airplayutil",  &off_100099FE8,  @"AirPlay.txt"));
    v12[1] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/airplayutil",  &off_10009A000,  @"AirPlay.txt"));
    void v12[2] = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/airplayutil",  &off_10009A018,  @"AirPlayPrefs.txt"));
    void v12[3] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 4LL));
    [v5 addSDTasksToContainer:v10];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getGMSAvailabilityContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"GMSAvailability",  @"logs/GenerativeExperiences",  1LL,  self,  2.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = +[SDTask taskWithCommand:arguments:asUID:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:asUID:outputFile:",  @"/usr/local/bin/gmstool",  &off_10009A030,  sub_1000207FC(),  @"gms_availability.txt");
    double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v10 = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    [v5 addSDTasksToContainer:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getCKKSCTLContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"CKKSCTL",  0LL,  1LL,  self,  3.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/sbin/ckksctl",  &off_10009A048,  @"ckksctl_status.txt"));
    uint64_t v9 = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getOTCTLContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"OTCTL",  0LL,  1LL,  self,  3.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/sbin/otctl",  &off_10009A060,  @"otctl_status.txt"));
    uint64_t v9 = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getApfsStatsContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"APFS_STATS",  0LL,  1LL,  self,  3.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/System/Library/Filesystems/apfs.fs/apfs_stats",  0LL,  @"apfs_stats.txt"));
    uint64_t v9 = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getKeyboardPrefContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  26LL,  @"Preferences",  self,  10.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getswcutilContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"SWCUTIL",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/System/Library/PrivateFrameworks/SharedWebCredentials.framework/Support/swcutil",  &off_10009A078,  @"swcutil_show.txt"));
    uint64_t v9 = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getosvariantUtilContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"OSVARIANTUTIL",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/osvariantutil",  &off_10009A090,  @"osvariantutil_status.txt"));
    uint64_t v9 = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getcontrolbitsContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"controlbits",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/controlbits",  &off_10009A0A8,  @"controlbits.txt"));
    uint64_t v9 = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getclpcContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"clpc",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/clpc",  &off_10009A0C0,  @"clpc.txt"));
    id v14 = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"clpctop",  0LL,  1LL,  self,  5.0));
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 setRuntimeChecks:17];
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/clpctop",  &off_10009A0D8,  @"clpctop.txt"));
    id v13 = v10;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    [v9 addSDTasksToContainer:v11];

    [v3 addObject:v9];
  }

  return v3;
}

- (id)getclpcctrlContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"clpcctrl",  0LL,  1LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/clpcctrl",  &off_10009A0F0,  @"clpcctrl.txt"));
    uint64_t v9 = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getASPSnapshotsContainers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  3LL,  @"ASPSnapshots",  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionContainer]);
    [v6 setGenerateSummary:1];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getCADebugContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"cadebug",  0LL,  0LL,  self,  9.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:17];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/CADebug",  &off_10009A108,  @"CADebug_layers.txt"));
    v12[0] = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/CADebug",  &off_10009A120,  @"CADebug_contexts.txt"));
    v12[1] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/CADebug",  &off_10009A138,  @"CADebug_displays.txt"));
    void v12[2] = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/CADebug",  &off_10009A150,  @"CADebug_display_trace.txt"));
    void v12[3] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 4LL));
    [v5 addSDTasksToContainer:v10];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getFDRDiagnosticContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  21LL,  @"logs/FDR",  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getASPMagazineContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  4LL,  @"ASPSnapshots",  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)getLogGenerationContainers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _iOSgetLogGenerationContainers](self, "_iOSgetLogGenerationContainers"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAutogenLogGenerationContainers](self, "getAutogenLogGenerationContainers"));
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (BOOL)isDeviceUnlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

- (id)_iOSGetTimeSensitiveContainers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSpindumpContainers](self, "getSpindumpContainers"));
  [v3 addObjectsFromArray:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getProcessesInfoContainer](self, "getProcessesInfoContainer"));
  [v3 addObjectsFromArray:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getTSSystemInfoContainer](self, "getTSSystemInfoContainer"));
  [v3 addObjectsFromArray:v6];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSampleContainer](self, "getSampleContainer"));
  [v3 addObjectsFromArray:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getTSProcessSpecificContainers](self, "getTSProcessSpecificContainers"));
  [v3 addObjectsFromArray:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getMultiTouchContainer](self, "getMultiTouchContainer"));
  [v3 addObjectsFromArray:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getsmcDiagnoseContainer](self, "getsmcDiagnoseContainer"));
  [v3 addObjectsFromArray:v10];

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getThermHIDContainers](self, "getThermHIDContainers"));
  [v3 addObjectsFromArray:v11];

  return v3;
}

- (id)getThermHIDContainers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"thermhid",  0LL,  0LL,  self,  5.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:33];
    [v5 setRunByItself:1];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask shellTaskWithCommand:outputFile:]( &OBJC_CLASS___SDTask,  "shellTaskWithCommand:outputFile:",  @"/usr/local/bin/thermhid | /usr/bin/sort",  @"thermhid.log"));
    v10[0] = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask shellTaskWithCommand:outputFile:]( &OBJC_CLASS___SDTask,  "shellTaskWithCommand:outputFile:",  @"/usr/local/bin/thermhid -t -p | /usr/bin/sort",  @"thermhid.log"));
    v10[1] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
    [v5 addSDTasksToContainer:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getUptimeContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"Uptime",  0LL,  1LL,  self,  1.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:16];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/uptime",  0LL,  @"uptime.txt"));
    uint64_t v9 = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)_internalSpindumpContainers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getStackshotContainer](self, "getStackshotContainer"));
  [v3 addObjectsFromArray:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getUptimeContainer](self, "getUptimeContainer"));
  [v3 addObjectsFromArray:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getTailspinContainers](self, "getTailspinContainers"));
  [v3 addObjectsFromArray:v6];
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  [v7 addObjectsFromArray:&off_10009A1F8];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _getSpindumpMetaContainer:](self, "_getSpindumpMetaContainer:", v7));
  if (v8) {
    [v3 addObject:v8];
  }

  return v3;
}

- (id)getsmcDiagnoseContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"smcdiagnose",  0LL,  1LL,  self,  15.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:32];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/libexec/smcDiagnose",  &__NSArray0__struct,  @"smcDiagnose.txt"));
    uint64_t v9 = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    [v5 addSDTasksToContainer:v7];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getProcessesInfoContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"processesInfo",  0LL,  1LL,  self,  15.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:32];
    [v5 setBlockUntilFinished:1];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/bin/ps",  &off_10009A210,  @"ps.txt"));
    v14[0] = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/bin/ps",  &off_10009A228,  @"ps_thread.txt"));
    v14[1] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/libexec/jetsam_priority",  &off_10009A240,  @"jetsam_priority.txt"));
    v14[2] = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/libexec/jetsam_priority",  &off_10009A258,  @"jetsam_priority.csv"));
    void v14[3] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/vm_stat",  &off_10009A270,  @"vm_stat.txt"));
    v14[4] = v10;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/taskinfo",  &off_10009A288,  @"taskinfo.txt"));
    void v14[5] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 6LL));
    [v5 addSDTasksToContainer:v12];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getTSSystemInfoContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"systemInfo-timeSensitive",  0LL,  1LL,  self,  38.0));
  id v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:32];
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/sbin/mount",  0LL,  @"mount.txt"));
    v16[0] = v15;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/bin/df",  &off_10009A2A0,  @"disks.txt"));
    v16[1] = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/sbin/lsof",  &off_10009A2B8,  @"lsof_parsable.txt",  1LL));
    v16[2] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/sbin/lsof",  &off_10009A2D0,  @"lsof.txt",  1LL));
    v16[3] = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/bin/lsmp",  &off_10009A2E8,  @"lsmp.txt",  1LL));
    v16[4] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/bin/lskq",  &off_10009A300,  @"lskq.txt",  1LL));
    v16[5] = v10;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/local/bin/IOSDebug",  &__NSArray0__struct,  @"IOSDebug.txt",  1LL));
    v16[6] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/zprint",  &off_10009A318,  @"zprint.txt"));
    void v16[7] = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 8LL));
    [v5 addSDTasksToContainer:v13];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getTSProcessSpecificContainers
{
  id v60 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v3 = -[SystemDiagnostic requestSource](self, "requestSource");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
  id v5 = [v4 count];

  if (v5)
  {
    if (-[SystemDiagnostic quickMode](self, "quickMode")
      || -[SystemDiagnostic requestSource](self, "requestSource") == 1)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  @"-v",  @"-w",  0LL));
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
      id v8 = [v7 countByEnumeratingWithState:&v77 objects:v89 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v78;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v78 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v77 + 1) + 8 * (void)i) stringValue]);
            [v6 addObject:v12];
          }

          id v9 = [v7 countByEnumeratingWithState:&v77 objects:v89 count:16];
        }

        while (v9);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"process footprint",  0LL,  1LL,  self,  25.0));
      id v14 = v13;
      if (v13)
      {
        [v13 setRuntimeChecks:32];
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/local/bin/footprint",  v6,  @"footprint.txt"));
        v88 = v15;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v88, 1LL));
        [v14 addSDTasksToContainer:v16];

        [v60 addObject:v14];
      }
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
    unint64_t v18 = (unint64_t)[v17 count];
    unint64_t v19 = v18 >> 2;

    unint64_t v20 = v18 & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
    id v22 = [v21 count];

    else {
      unint64_t v23 = v19 + 1;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v87 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Number of process specific time-sensitive groups: %lu",  buf,  0xCu);
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v24, "log:", @"Number of process specific time-sensitive groups: %lu", v23);

    if (v23)
    {
      uint64_t v25 = 0LL;
      uint64_t v26 = 30LL;
      if (v3 == 2) {
        uint64_t v26 = 120LL;
      }
      uint64_t v61 = v26;
      NSFileAttributeKey v27 = (void **)&AnalyticsSendEventLazy_ptr;
      v66 = self;
      unint64_t v62 = v23;
      do
      {
        uint64_t v28 = (4 * v25);
        id v29 = (char *)(v28 + 4);
        id v30 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
        id v31 = [v30 count];

        if (v28 + 4 > (unint64_t)v31)
        {
          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
          id v29 = (char *)[v32 count];
        }

        unint64_t v67 = (unint64_t)v29;
        id v63 = &v29[-v28];
        uint64_t v65 = v25 + 1;
        v64 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v27[73],  "stringWithFormat:",  @"Process specific container group: %d",  v25 + 1));
        __int128 v33 = &__NSArray0__struct;
        do
        {
          __int128 v34 = v33;
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
          v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectAtIndex:v28]);
          id v37 = [v36 intValue];

          uint64_t v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27[73], "stringWithFormat:", @"%d", v37));
          uint64_t v39 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices"));
          uint64_t v75 = v28;
          v76 = v34;
          if (v39
            && (uint64_t v40 = (void *)v39,
                v41 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices")),
                id v42 = [v41 count],
                v41,
                v40,
                v42))
          {
            id v43 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices"));
            v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectAtIndex:v28]);
            unsigned int v45 = [v44 intValue];

            unsigned int v46 = (__CFString *)objc_claimAutoreleasedReturnValue( objc_msgSend( &stru_10008D288,  "stringByAppendingFormat:",  @"%s",  (char *)-[SystemDiagnostic processes](self, "processes") + 136 * (int)v45 + 48));
          }

          else
          {
            unsigned int v46 = &stru_10008D288;
          }

          v74 = (void *)objc_claimAutoreleasedReturnValue( [v27[73] stringWithFormat:@"<TMPOUTPUTDIR>/graph-%d-%@.memgraph", v37, v46]);
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27[73], "stringWithFormat:", @"errors/leaks_highmem_%d_errors.txt", v37));
          v84[0] = @"-outputGraph";
          v84[1] = v74;
          v84[2] = v38;
          v84[3] = @"-forkCorpse";
          v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v84, 4LL));
          v71 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/leaks",  v72,  v73));
          v85[0] = v71;
          v83[0] = @"-v";
          v83[1] = @"-k";
          v83[2] = v38;
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v83, 3LL));
          v68 = (void *)objc_claimAutoreleasedReturnValue([v27[73] stringWithFormat:@"ddt-%u-%@.txt", v37, v46]);
          v47 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:withRuntimeChecks:",  @"/usr/local/bin/ddt",  v69,  v68,  1LL));
          v85[1] = v47;
          v82[0] = @"procinfo";
          v82[1] = v38;
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v82, 2LL));
          uint64_t v49 = v38;
          v70 = (void *)v38;
          uint64_t v50 = v27;
          v51 = (void *)objc_claimAutoreleasedReturnValue([v27[73] stringWithFormat:@"launchctl-procinfo-%u-%@.txt", v37, v46]);
          v52 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/bin/launchctl",  v48,  v51));
          v85[2] = v52;
          v81[0] = @"dump-concurrency";
          v81[1] = v49;
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v81, 2LL));
          v54 = (void *)objc_claimAutoreleasedReturnValue([v50[73] stringWithFormat:@"swift-inspect-%u-%@.txt", v37, v46]);
          v55 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/swift-inspect",  v53,  v54));
          v85[3] = v55;
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v85, 4LL));

          NSFileAttributeKey v27 = v50;
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v76 arrayByAddingObjectsFromArray:v56]);

          uint64_t v28 = v75 + 1;
          self = v66;
        }

        while (v75 + 1 < v67);
        v57 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:",  v33,  &__NSArray0__struct,  &stru_10008D288,  v66,  1LL,  (double)(unint64_t)((void)v63 * v61)));
        v58 = v57;
        if (v57)
        {
          [v57 setName:v64];
          [v60 addObject:v58];
        }

        uint64_t v25 = v65;
      }

      while (v65 != v62);
    }
  }

  return v60;
}

- (id)getSampleContainer
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"sample-%@.txt", v4));

  v14[0] = @"<PID>";
  v14[1] = @"2";
  v14[2] = @"-f";
  id v6 = (void *)objc_claimAutoreleasedReturnValue([@"<TMPOUTPUTDIR>" stringByAppendingPathComponent:v5]);
  void v14[3] = v6;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 4LL));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/sample",  v7,  v5));
  id v13 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:",  v9,  &__NSArray0__struct,  &stru_10008D288,  self,  5.0));
  BOOL v11 = v10;
  if (v10)
  {
    [v10 setName:@"sample-targeted"];
    [v11 setRuntimeChecks:544];
    [v3 addObject:v11];
  }

  return v3;
}

- (id)getMultiTouchContainer
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100027DF4;
  v9[3] = &unk_100089808;
  v9[4] = self;
  uint64_t v4 = objc_retainBlock(v9);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithBlock:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithBlock:withTimeout:atDestination:withDelegate:",  v4,  @"mtrecorder",  self,  6.0));
  id v6 = v5;
  if (v5)
  {
    [v5 setRuntimeChecks:33];
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 collectionContainer]);
    [v7 setMaximumSizeMB:15];

    [v3 addObject:v6];
  }

  return v3;
}

- (id)getSpindumpContainers
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getASPSnapshotContainer](self, "getASPSnapshotContainer"));
  if (v4) {
    [v3 addObject:v4];
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _internalSpindumpContainers](self, "_internalSpindumpContainers"));
  [v3 addObjectsFromArray:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"tailspin-history",  @"logs/tailspindb",  self));
  double v7 = v6;
  if (v6)
  {
    [v6 setMaximumSizeMB:0];
    [v7 setRuntimeChecks:32];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dateByAddingTimeInterval:-120.0]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:",  @"/private/var/db/spindump/tailspin-trace*",  v9,  0LL,  0LL,  0LL,  0LL));
    id v13 = v10;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    [v7 addRules:v11];

    [v3 addObject:v7];
  }

  return v3;
}

- (id)getASPSnapshotContainer
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  5LL,  @"ASPSnapshots",  self,  5.0));
  unsigned int v3 = v2;
  if (v2)
  {
    [v2 setRuntimeChecks:32];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 collectionContainer]);
    [v4 setGenerateSummary:1];
  }

  return v3;
}

- (id)getTimeSensitiveContainers
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _iOSGetTimeSensitiveContainers](self, "_iOSGetTimeSensitiveContainers"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAutogenTimeSensitiveContainers](self, "getAutogenTimeSensitiveContainers"));
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (id)getTailspinContainers
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"tailspin-save/"]);

  NSFileAttributeKey v23 = NSFilePosixPermissions;
  uint64_t v24 = &off_10009A480;
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
  id v22 = 0LL;
  unsigned __int8 v8 = [v4 createDirectoryAtPath:v6 withIntermediateDirectories:0 attributes:v7 error:&v22];
  id v9 = v22;

  if ((v8 & 1) != 0)
  {
    double v10 = (double)sub_10002298C(0LL);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    void v20[2] = sub_100028830;
    v20[3] = &unk_100089830;
    v20[4] = self;
    id v21 = v6;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogAgentContainer containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:]( &OBJC_CLASS___SDLogAgentContainer,  "containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:",  v21,  50LL,  self,  0LL,  v20,  v10));
    id v12 = v11;
    if (v11)
    {
      [v11 setRuntimeChecks:32];
      [v12 setName:@"tailspin-save-ts"];
      [v12 setBlockUntilFinished:1];
      [v3 addObject:v12];
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  46LL,  &stru_10008D288,  self,  10.0));
    id v14 = v13;
    if (v13)
    {
      [v13 setRuntimeChecks:32];
      [v14 setName:@"tailspin-info-ts"];
      unint64_t v15 = sub_1000225C0(0LL);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 collectionContainer]);
      [v16 setMaximumSizeMB:v15];

      [v3 addObject:v14];
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100055284();
    }
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v17 stderrWrite:@"Unable to create intermediate tailspin save directory %@: %@", v6, v9];

    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v18 log:@"Unable to create intermediate tailspin save directory %@: %@", v6, v9];
  }

  return v3;
}

- (id)getStackshotContainer
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (-[SystemDiagnostic requestSource](self, "requestSource") == 1) {
    uint64_t v4 = 41LL;
  }
  else {
    uint64_t v4 = 40LL;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:",  v4,  &stru_10008D288,  self,  5.0));
  id v6 = v5;
  if (v5)
  {
    [v5 setName:@"time-sensitive-stackshot"];
    [v6 setRuntimeChecks:32];
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 taskContainer]);
    [v7 setBlockUntilFinished:1];

    [v3 addObject:v6];
  }

  return v3;
}

- (id)_getSpindumpMetaContainer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"spindump/"]);

  NSFileAttributeKey v25 = NSFilePosixPermissions;
  uint64_t v26 = &off_10009A480;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
  id v22 = 0LL;
  unsigned __int8 v9 = [v5 createDirectoryAtPath:v7 withIntermediateDirectories:0 attributes:v8 error:&v22];
  id v10 = v22;

  if ((v9 & 1) != 0)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( [@"<TMPOUTPUTDIR>" stringByAppendingPathComponent:@"spindump-nosymbols.txt"]);
    v24[0] = @"-file";
    v24[1] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
    [v4 addObjectsFromArray:v12];

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/sbin/spindump",  v4,  @"errors/spindump_nosym_errors.txt"));
    [v13 setSlowTimeout:1];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    void v20[2] = sub_100028D08;
    v20[3] = &unk_100089138;
    v20[4] = self;
    id v14 = v7;
    id v21 = v14;
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:withCompletionBlock:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:withCompletionBlock:",  @"spindump-meta",  &stru_10008D288,  1LL,  self,  v20,  30.0));
    uint64_t v16 = v15;
    if (v15)
    {
      [v15 setRuntimeChecks:32];
      [v16 setBlockUntilFinished:1];
      NSFileAttributeKey v23 = v13;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
      [v16 addSDTasksToContainer:v17 withTmpOutputDir:v14];
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000552F0();
    }
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v18 stderrWrite:@"Unable to create intermediate spindump directory %@: %@", v7, v10];

    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v11 log:@"Unable to create intermediate spindump directory %@: %@", v7, v10];
    uint64_t v16 = 0LL;
  }

  return v16;
}

- (SystemDiagnostic)init
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___SystemDiagnostic;
  uint64_t v2 = -[SystemDiagnostic init](&v32, "init");
  unsigned int v3 = v2;
  if (v2)
  {
    rootPath = v2->_rootPath;
    v2->_rootPath = (NSString *)@"/";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic defaultBaseDirectory](v3, "defaultBaseDirectory"));
    baseDirectory = v3->_baseDirectory;
    v3->_baseDirectory = (NSString *)v5;

    v3->_quickMode = 0;
    *(_DWORD *)&v3->_shouldRunTimeSensitiveTasks = 16843009;
    *(_WORD *)&v3->_shouldGetFeedbackData = 0;
    v3->_verbose = 0;
    *(_DWORD *)&v3->_earlyPrompt = 16843009;
    *(_WORD *)&v3->_shouldRemoveTemporaryDirectory = 1;
    v3->_requestSource = 0;
    archive = v3->_archive;
    v3->_archive = 0LL;

    v3->_shouldStreamToTar = 1;
    unsigned __int8 v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    metricsDict = v3->_metricsDict;
    v3->_metricsDict = v8;

    overrideContainers = v3->_overrideContainers;
    v3->_overrideContainers = 0LL;

    BOOL v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    executedContainers = v3->_executedContainers;
    v3->_executedContainers = v11;

    v3->_disableStreamTar = 0;
    v3->_coSysdiagnose = 0LL;
    v3->_coSysdiagnoseOnly = 0;
    v3->_disableUIFeedback = 0;
    summaryHandle = v3->_summaryHandle;
    v3->_summaryHandle = 0LL;

    frontmostBundleID = v3->_frontmostBundleID;
    v3->_frontmostBundleID = 0LL;

    v3->_shouldPostProcess = 1;
    capOverride = v3->_capOverride;
    v3->_capOverride = 0LL;

    v3->_didComplete = 0;
    id v16 = sub_1000211D4();
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    diagnosticID = v3->_diagnosticID;
    v3->_diagnosticID = (NSString *)v17;

    coSysdiagnoseParameters = v3->_coSysdiagnoseParameters;
    v3->_coSysdiagnoseParameters = 0LL;

    changedDiagnosticProperties = v3->_changedDiagnosticProperties;
    v3->_changedDiagnosticProperties = (NSString *)&stru_10008D288;

    v3->_summaryFD = 0LL;
    v3->_isTestingMode = 0;
    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pidIndices = v3->_pidIndices;
    v3->_pidIndices = (NSMutableArray *)v21;

    v3->_useParallelCompression = 0;
    v3->_deShowFeedback = 0;
    onlyRunContainersWithNames = v3->_onlyRunContainersWithNames;
    v3->_onlyRunContainersWithNames = 0LL;

    completedOutputDirectory = v3->_completedOutputDirectory;
    v3->_completedOutputDirectory = 0LL;

    completedTarballPath = v3->_completedTarballPath;
    v3->_completedTarballPath = 0LL;

    totalTime = v3->_totalTime;
    v3->_totalTime = 0LL;

    dispatch_group_t v27 = dispatch_group_create();
    completionDispatchGroup = v3->_completionDispatchGroup;
    v3->_completionDispatchGroup = (OS_dispatch_group *)v27;

    sub_10003FE7C(v33, 0x400uLL, "/private/var/mobile/Library/Logs/CrashReporter/Cloud/clouddocs", 0LL, 0LL);
    uint64_t v29 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v33));
    brctl_dir = v3->_brctl_dir;
    v3->_brctl_dir = (NSString *)v29;

    -[SystemDiagnostic populateProcesses](v3, "populateProcesses");
  }

  return v3;
}

- (void)prompt
{
}

- (void)setSkipBTLogs
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](&OBJC_CLASS___SystemDiagnosticBT, "sharedInstance"));
  [v2 setShouldGatherBTLogs:0];
}

- (id)prepareCoSysdiagnoseParams
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic coSysdiagnoseParameters](self, "coSysdiagnoseParameters"));

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"stdout",  @"stdin",  @"stderr",  @"coSysdiagnose",  @"coSysdiagnoseOnly",  @"clientPID",  @"SDRequestSourceShell",  @"baseDirectory",  @"shouldCreateTarBall",  @"warnProcAllowlist",  @"archiveName",  @"remoteUUIDs",  0LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic coSysdiagnoseParameters](self, "coSysdiagnoseParameters"));
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = sub_1000419E8;
    applier[3] = &unk_100089B68;
    id v12 = v5;
    id v13 = v3;
    id v7 = v5;
    xpc_dictionary_apply(v6, applier);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "No co-sysdiagnose paramateres exist. Creating now",  buf,  2u);
    }

    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v8 log:@"No co-sysdiagnose paramateres exist. Creating now"];

    xpc_dictionary_set_BOOL(v3, "generatePlist", -[SystemDiagnostic generatePlist](self, "generatePlist"));
    xpc_dictionary_set_BOOL(v3, "quickMode", -[SystemDiagnostic quickMode](self, "quickMode"));
    xpc_dictionary_set_BOOL( v3,  "shouldRunLogCopyTasks",  -[SystemDiagnostic shouldRunLogCopyTasks](self, "shouldRunLogCopyTasks"));
    xpc_dictionary_set_BOOL( v3,  "shouldRunLogGenerationTasks",  -[SystemDiagnostic shouldRunLogGenerationTasks](self, "shouldRunLogGenerationTasks"));
    xpc_dictionary_set_BOOL( v3,  "shouldRunTimeSensitiveTasks",  -[SystemDiagnostic shouldRunTimeSensitiveTasks](self, "shouldRunTimeSensitiveTasks"));
    xpc_dictionary_set_BOOL( v3,  "shouldRunOSLogArchive",  -[SystemDiagnostic shouldRunOSLogArchive](self, "shouldRunOSLogArchive"));
    xpc_dictionary_set_BOOL(v3, "disableStreamTar", -[SystemDiagnostic disableStreamTar](self, "disableStreamTar"));
  }

  return v3;
}

- (NSString)defaultBaseDirectory
{
}

- (BOOL)makeOutputDirectory
{
}

- (void)gatherDiagnostic
{
}

- (void)populateProcesses
{
  *(void *)unint64_t v18 = 0x600000001LL;
  if (-[SystemDiagnostic processes](self, "processes", 4LL)) {
    return;
  }
  if (sysctl(v18, 2u, &v17, &v16, 0LL, 0LL) == -1)
  {
    unint64_t v15 = "sysctl(... kern.maxproc ...)";
LABEL_17:
    perror(v15);
    return;
  }

  int v3 = v17;
  id v4 = malloc(4LL * v17);
  if (!v4)
  {
    unint64_t v15 = "malloc";
    goto LABEL_17;
  }

  uint64_t v5 = v4;
  int v6 = proc_listallpids(v4, 4 * v3);
  if (v6 == -1)
  {
    perror("proc_listallpids");
    free(v5);
  }

  else
  {
    LODWORD(v7) = v6;
    unsigned __int8 v8 = (char *)malloc(136LL * v6);
    unsigned __int8 v9 = v8;
    if ((int)v7 < 1)
    {
      uint64_t v10 = 0LL;
    }

    else
    {
      LODWORD(v10) = 0;
      BOOL v11 = (int *)v5;
      id v12 = v8;
      uint64_t v7 = v7;
      do
      {
        int v13 = *v11++;
        unsigned int v14 = proc_pidinfo(v13, 3, 0LL, v12, 136);
        if (v14 <= 0x87) {
          uint64_t v10 = v10;
        }
        else {
          uint64_t v10 = (v10 + 1);
        }
        v12 += 136 * (v14 > 0x87);
        --v7;
      }

      while (v7);
    }

    free(v5);
    -[SystemDiagnostic setProcesses:](self, "setProcesses:", v9);
    -[SystemDiagnostic setProcessCount:](self, "setProcessCount:", v10);
  }

- (int)pidForProcessName:(id)a3
{
  id v4 = (const char *)[a3 UTF8String];
  if (!-[SystemDiagnostic processCount](self, "processCount")) {
    -[SystemDiagnostic populateProcesses](self, "populateProcesses");
  }
  if (-[SystemDiagnostic processCount](self, "processCount") < 1) {
    return -1;
  }
  uint64_t v5 = 0LL;
  uint64_t v6 = 0LL;
  while (strncmp((const char *)-[SystemDiagnostic processes](self, "processes") + v5 + 48, v4, 0xFuLL))
  {
    ++v6;
    v5 += 136LL;
    if (v6 >= -[SystemDiagnostic processCount](self, "processCount")) {
      return -1;
    }
  }

  return *(_DWORD *)((char *)-[SystemDiagnostic processes](self, "processes") + v5 + 12);
}

- (BOOL)_processIsTargeted:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (sub_10004061C(*(void **)(*((void *)&v10 + 1) + 8LL * (void)i), v4))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (BOOL)mailIsTargeted
{
  return -[SystemDiagnostic _processIsTargeted:]( self,  "_processIsTargeted:",  @"/Applications/Mail.app/Contents/MacOS/Mail");
}

- (BOOL)safariIsTargeted
{
  return -[SystemDiagnostic _processIsTargeted:]( self,  "_processIsTargeted:",  @"/Applications/Safari.app/Contents/MacOS/Safari");
}

- (BOOL)prepareOutput
{
  BOOL v3 = -[SystemDiagnostic prepareOutputDirectory](self, "prepareOutputDirectory");
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
    unsigned __int8 v7 = [v4 setUpSysdiagnoseLog:v5 withID:v6];

    if ((v7 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to set up sysdiagnose.log with SDResourceManager.",  buf,  2u);
      }

      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v8 log:@"Failed to set up sysdiagnose.log with SDResourceManager."];
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic changedDiagnosticProperties](self, "changedDiagnosticProperties"));
      *(_DWORD *)buf = 138412290;
      id v37 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "The following properties were changed from default:\n%@",  buf,  0xCu);
    }

    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic changedDiagnosticProperties](self, "changedDiagnosticProperties"));
    [v10 log:@"The following properties were changed from default:\n%@", v11];

    if (sub_10004024C())
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic warnProcessAllowlist](self, "warnProcessAllowlist"));

      if (v12)
      {
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic warnProcessAllowlist](self, "warnProcessAllowlist"));
        unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathComponent:v14]);
        size_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingString:@"_WARNING.log"]);

        id v17 = v16;
        unint64_t v18 = fopen((const char *)[v17 fileSystemRepresentation], "wx");
        if (v18)
        {
          unint64_t v19 = v18;
          fputs(off_1000A4F80, v18);
          fclose(v19);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unable to create warning for disallowed process",  buf,  2u);
          }

          unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          [v20 stdoutWrite:@"Unable to create warning for disallowed process"];

          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          [v21 log:@"Unable to create warning for disallowed process"];
        }
      }

      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
      id v23 = objc_claimAutoreleasedReturnValue( [v22 stringByAppendingPathComponent:@"tailspin-README.txt"]);
      uint64_t v24 = (const char *)[v23 fileSystemRepresentation];

      NSFileAttributeKey v25 = fopen("/AppleInternal/tailspin/tailspin-README.txt", "r");
      if (v25)
      {
        uint64_t v26 = fopen(v24, "wx");
        if (v26)
        {
          dispatch_group_t v27 = v26;
          size_t v28 = fread(v35, 1uLL, 0x400uLL, v25);
          if (v28)
          {
            size_t v29 = v28;
            id v30 = v35;
            do
            {
              do
              {
                size_t v31 = fwrite(v30, 1uLL, v29, v27);
                v30 += v31;
                v29 -= v31;
              }

              while (v29);
              size_t v29 = fread(v35, 1uLL, 0x400uLL, v25);
              id v30 = v35;
            }

            while (v29);
          }

          fclose(v27);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unable to create tailspin-README.rtf",  buf,  2u);
          }

          objc_super v32 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          [v32 stdoutWrite:@"Unable to create tailspin-README.rtf"];

          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          [v33 log:@"Unable to create tailspin-README.rtf"];
        }
      }

      fclose(v25);
    }
  }

  return v3;
}

- (void)completeTarball
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));

    if (!v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "The tarball wasn't safely created. Something's wrong.",  buf,  2u);
      }

      size_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v28 stdoutWrite:@"The tarball wasn't safely created. Something's wrong."];

      id v17 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
      [v17 log:@"The tarball wasn't safely created. Something's wrong."];
      goto LABEL_16;
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
    unsigned __int8 v6 = [v3 fileExistsAtPath:v5 isDirectory:0];

    if ((v6 & 1) != 0)
    {
      unsigned __int8 v7 = -[SystemDiagnostic didComplete](self, "didComplete");
      BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if ((v7 & 1) != 0)
      {
        if (v8)
        {
          unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
          *(_DWORD *)buf = 138412546;
          id v42 = v9;
          __int16 v43 = 2112;
          v44 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Moving tarball '%@' to final location '%@'",  buf,  0x16u);
        }

        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
        [v11 log:@"Moving tarball '%@' to final location '%@'", v12, v13];

        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
        unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
        id v39 = 0LL;
        unsigned __int8 v16 = [v3 moveItemAtPath:v14 toPath:v15 error:&v39];
        id v17 = v39;

        if ((v16 & 1) != 0) {
          goto LABEL_12;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000570A4(self, v17);
        }
        unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
        unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedDescription]);
        [v18 log:@"Failed to move tarball '%@' to final location '%@': %@", v19, v20, v21];

        id v22 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
        int v23 = sub_100022E38( (const char *)[v22 fileSystemRepresentation],  -[SystemDiagnostic isDeviceUnlockedSinceBoot](self, "isDeviceUnlockedSinceBoot"));

        if (v23 == -1) {
          goto LABEL_26;
        }
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));
        char v25 = sub_100022BAC((int)[v24 archiveFD], v23);

        if ((v25 & 1) != 0)
        {
LABEL_12:
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
          -[SystemDiagnostic setTarballPath:](self, "setTarballPath:", v26);

          dispatch_group_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
          sub_100024254();
        }

        else
        {
LABEL_26:
          -[SystemDiagnostic setCanDisplayTarBall:](self, "setCanDisplayTarBall:", 0LL);
        }

- (void)markFoldersAsComplete
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
  id v41 = 0LL;
  unsigned __int8 v5 = [v3 removeItemAtPath:v4 error:&v41];
  id v6 = v41;

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = (char *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
      *(_DWORD *)buf = 138412546;
      __int16 v43 = v7;
      __int16 v44 = 2112;
      id v45 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to remove tmpOutputDir %@ upon completion: %@",  buf,  0x16u);
    }

    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
    [v8 log:@"Failed to remove tmpOutputDir %@ upon completion: %@", v9, v6];

    id v6 = 0LL;
  }

  if (-[SystemDiagnostic shouldRemoveTemporaryDirectory](self, "shouldRemoveTemporaryDirectory")) {
    unsigned int v10 = -[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall");
  }
  else {
    unsigned int v10 = 0;
  }
  if (!-[SystemDiagnostic didComplete](self, "didComplete") || v10)
  {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    id v40 = v6;
    unsigned __int8 v12 = [v3 removeItemAtPath:v11 error:&v40];
    id v13 = v40;

    if ((v12 & 1) != 0)
    {
      id v6 = v13;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v14 = (char *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
        *(_DWORD *)buf = 138412546;
        __int16 v43 = v14;
        __int16 v44 = 2112;
        id v45 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to remove outputDir %@ upon completion: %@",  buf,  0x16u);
      }

      unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
      [v15 log:@"Failed to remove outputDir %@ upon completion: %@", v16, v13];

      id v6 = 0LL;
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  unsigned int v18 = [v3 fileExistsAtPath:v17 isDirectory:0];

  if (v18)
  {
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedOutputDirectory](self, "completedOutputDirectory"));
    id v39 = v6;
    unsigned __int8 v21 = [v3 moveItemAtPath:v19 toPath:v20 error:&v39];
    id v22 = v39;

    if ((v21 & 1) != 0)
    {
      int v23 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedOutputDirectory](self, "completedOutputDirectory"));
      -[SystemDiagnostic setOutputDirectory:](self, "setOutputDirectory:", v23);

      id v6 = v22;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_group_t v27 = (char *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
        *(_DWORD *)buf = 138412546;
        __int16 v43 = v27;
        __int16 v44 = 2112;
        id v45 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to rename outputDir %@ upon completion: %@",  buf,  0x16u);
      }

      size_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      size_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
      [v28 log:@"Failed to rename outputDir %@ upon completion: %@", v29, v22];

      -[SystemDiagnostic setCanDisplayTarBall:](self, "setCanDisplayTarBall:", 0LL);
      id v6 = 0LL;
    }
  }

  else if (((!-[SystemDiagnostic didComplete](self, "didComplete") | v10) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = (char *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
      *(_DWORD *)buf = 138412290;
      __int16 v43 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Output dir at %@ doesn't exist. Something's wrong",  buf,  0xCu);
    }

    char v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    [v25 log:@"Output dir at %@ doesn't exist. Something's wrong", v26];

    -[SystemDiagnostic setCanDisplayTarBall:](self, "setCanDisplayTarBall:", 0LL);
  }

  -[SystemDiagnostic completeTarball](self, "completeTarball");
  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
  size_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic defaultBaseDirectory](self, "defaultBaseDirectory"));
  unsigned int v32 = [v30 isEqualToString:v31];

  if (v32)
  {
    id v33 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
    int v34 = sub_10004D690((const char *)[v33 UTF8String], 0x1F5u, 0x1F5u);

    if (v34 == -1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v35 = __error();
        id v36 = strerror(*v35);
        *(_DWORD *)buf = 136315138;
        __int16 v43 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to set permissions for base directory: %s",  buf,  0xCu);
      }

      id v37 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      uint64_t v38 = __error();
      objc_msgSend(v37, "log:", @"Failed to set permissions for base directory: %s", strerror(*v38));
    }
  }
}

- (BOOL)isPromptEligible
{
  return !-[SystemDiagnostic disableUIFeedback](self, "disableUIFeedback")
      && (-[SystemDiagnostic requestSource](self, "requestSource") == 1
       || -[SystemDiagnostic requestSource](self, "requestSource") == 4);
}

- (void)run
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v3 registerDiagnosticObject:self];

  id v4 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completionDispatchGroup](self, "completionDispatchGroup"));
  dispatch_group_enter(v4);

  unsigned __int8 v5 = sub_100024174();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "SDObjSetup",  "[run] run function begins",  buf,  2u);
  }

  sub_100023FF4(1);
  sub_100023B04(300.0);
  unsigned __int8 v7 = _os_activity_create( (void *)&_mh_execute_header,  "Directory setup",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  *(void *)buf = 0LL;
  v54 = buf;
  uint64_t v55 = 0x2020000000LL;
  char v56 = 0;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_100043808;
  v52[3] = &unk_100088ED0;
  v52[4] = self;
  v52[5] = buf;
  unsigned int v8 = +[SystemDiagnostic _runBlock:withTimeout:](&OBJC_CLASS___SystemDiagnostic, "_runBlock:withTimeout:", v52, 3.0);
  if (v54[24])
  {
    unsigned int v9 = v8;
    id v10 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v11 = sub_1000407BC();
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)v58 = 138412290;
      id v59 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", v58, 0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    unsigned int v14 = sub_1000407BC();
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v13 stdoutWrite:@"%@", v15];

    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id v17 = sub_1000407BC();
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v16 log:@"%@", v18];

    +[SystemDiagnostic _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnostic,  "_runBlock:withTimeout:",  &stru_100089B88,  0.25);
    id v19 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v20 = sub_100020F88(-[SystemDiagnostic requestSource](self, "requestSource"));
      unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)v58 = 138412290;
      id v59 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Request source: %@",  v58,  0xCu);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    int v23 = sub_100020F88(-[SystemDiagnostic requestSource](self, "requestSource"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    [v22 log:@"Request source: %@", v24];

    char v25 = sub_100024174();
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)v58 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "SDObjSetup",  "[run] setup ended! gather diagnostic logs...",  v58,  2u);
    }

    if (v9)
    {
      if (!-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall"))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v58 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Disabling streaming into tar as we are not creating tarball",  v58,  2u);
        }

        dispatch_group_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v27 log:@"Disabling streaming into tar as we are not creating tarball"];

        -[SystemDiagnostic setDisableStreamTar:](self, "setDisableStreamTar:", 1LL);
      }

      if (!-[SystemDiagnostic shouldRunIDSDump](self, "shouldRunIDSDump")) {
        -[SystemDiagnostic setShouldRunIDSDump:](self, "setShouldRunIDSDump:", sub_1000203BC());
      }
      size_t v28 = sub_100024174();
      size_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_signpost_enabled(v29))
      {
        *(_WORD *)v58 = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v29,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "SDObjGatherDiagnostic",  "[run] gather diagnostic phase function begins",  v58,  2u);
      }

      kdebug_trace(27525125LL, 0LL, 0LL, 0LL, 0LL);
      -[SystemDiagnostic initStreaming](self, "initStreaming");
      -[SystemDiagnostic gatherDiagnostic](self, "gatherDiagnostic");
      kdebug_trace(27525126LL, 0LL, 0LL, 0LL, 0LL);
      -[SystemDiagnostic markFoldersAsComplete](self, "markFoldersAsComplete");
      -[SystemDiagnostic sendCoreAnalytics](self, "sendCoreAnalytics");
      -[SystemDiagnostic closeTaskSummaryHandle](self, "closeTaskSummaryHandle");
      if (-[SystemDiagnostic requestSource](self, "requestSource") == 2)
      {
        id v30 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v30 closeCLI];
      }

      size_t v31 = sub_100024174();
      unsigned int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_signpost_enabled(v32))
      {
        *(_WORD *)v58 = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v32,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "SDObjGatherDiagnostic",  "[run] gather diagnostic ended!",  v58,  2u);
      }

      if (!-[SystemDiagnostic earlyPrompt](self, "earlyPrompt")
        && -[SystemDiagnostic isPromptEligible](self, "isPromptEligible"))
      {
        -[SystemDiagnostic prompt](self, "prompt");
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v58 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Timed out preparing sysdiagnose output. Cleaning up",  v58,  2u);
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      id v36 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
      [v35 setUpDiagnosticID:v36];

      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
      [v38 setOutputDirectory:v37];

      id v39 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](&OBJC_CLASS___SDCacheEnumerator, "sysdiagnoseDirectory"));
      id v40 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogAgentContainer containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:]( &OBJC_CLASS___SDLogAgentContainer,  "containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:",  v39,  49LL,  self,  0LL,  0LL,  10.0));
      id v41 = v40;
      if (v40)
      {
        [v40 setRuntimeChecks:0];
        [v41 setName:@"tailspin-save-output-dir-timeout"];
        [v41 execute];
      }

      id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 paths]);
      id v43 = [v42 count];

      if (v43 == (id)1)
      {
        __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v41 paths]);
        id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectAtIndexedSubscript:0]);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v58 = 134217984;
          id v59 = v43;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "output dir timeout tailspin task returned wrong number of paths (%ld)",  v58,  0xCu);
        }

        id v45 = 0LL;
      }

      -[SystemDiagnostic setShouldCreateTarBall:](self, "setShouldCreateTarBall:", 1LL);
      -[SystemDiagnostic setDidComplete:](self, "setDidComplete:", 1LL);
      -[SystemDiagnostic setTarballPath:](self, "setTarballPath:", v45);
      if (-[SystemDiagnostic requestSource](self, "requestSource") == 2)
      {
        unsigned int v46 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v46 closeCLI];
      }

      v47 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v47 closeSysdiagnoseLog];
    }

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v48 closeSysdiagnoseSession];

    sub_100023BC4();
    int v34 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
    [v34 transferFileToHostIfNecessary:v49 forDiagnosticID:v50];
  }

  else
  {
    id v33 = sub_100024174();
    int v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    if (os_signpost_enabled((os_log_t)v34))
    {
      *(_WORD *)v58 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)v34,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "SDObjSetup",  "[run] setup ended! gather diagnostic logs...",  v58,  2u);
    }
  }

  v51 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completionDispatchGroup](self, "completionDispatchGroup"));
  dispatch_group_leave(v51);

  sub_100023FF4(0);
  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);
}

- (id)getDefaultArchiveName
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));

  if (v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", v3, v6));

    BOOL v3 = (void *)v7;
  }

  unsigned int v8 = (const __CFDictionary *)_CFCopySupplementalVersionDictionary();
  if (v8)
  {
    unsigned int v9 = v8;
    Value = CFDictionaryGetValue(v8, _kCFSystemVersionProductNameKey);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(Value);
    unsigned __int8 v12 = CFDictionaryGetValue(v9, _kCFSystemVersionBuildVersionKey);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v3));
    if (v11)
    {
      unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
      [v14 addObject:v15];
    }

    unsigned __int8 v16 = (__CFString *)MGCopyAnswer(@"DeviceClass", 0LL);
    if (-[__CFString isEqualToString:](v16, "isEqualToString:", @"AudioAccessory"))
    {

      unsigned __int8 v16 = @"HomePod";
    }

    else if (!v16)
    {
LABEL_10:
      if (-[__CFString isEqualToString:](v16, "isEqualToString:", @"HomePod"))
      {
        id v17 = sub_10002558C(8);
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        [v14 addObject:v18];
      }

      if (v13) {
        [v14 addObject:v13];
      }
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v14 componentsJoinedByString:@"_"]);

      CFRelease(v9);
      BOOL v3 = (void *)v19;
      return v3;
    }

    [v14 addObject:v16];
    goto LABEL_10;
  }

  return v3;
}

- (id)getArchiveExtension
{
  if (-[SystemDiagnostic useParallelCompression](self, "useParallelCompression")) {
    return @".aar";
  }
  else {
    return @".tar.gz";
  }
}

- (BOOL)preparePaths
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getDefaultArchiveName](self, "getDefaultArchiveName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([@"IN_PROGRESS_" stringByAppendingString:v3]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getArchiveExtension](self, "getArchiveExtension"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/db/sysdiagnose/com.apple.sysdiagnose" stringByAppendingPathComponent:v4]);
  -[SystemDiagnostic setOutputDirectory:](self, "setOutputDirectory:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](&OBJC_CLASS___SDCacheEnumerator, "sysdiagnoseDirectory"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@.tmp", v7, v4));
  -[SystemDiagnostic setTmpOutputDirectory:](self, "setTmpOutputDirectory:", v8);

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:v5]);
  -[SystemDiagnostic setTarballPath:](self, "setTarballPath:", v10);

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
  if (!v11)
  {
    -[SystemDiagnostic setArchiveName:](self, "setArchiveName:", v3);
LABEL_9:
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
    dispatch_group_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
    size_t v28 = (void *)objc_claimAutoreleasedReturnValue([v26 stringByAppendingPathComponent:v27]);
    -[SystemDiagnostic setCompletedOutputDirectory:](self, "setCompletedOutputDirectory:", v28);

    size_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 stringByAppendingString:v5]);

    size_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
    unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v31 stringByAppendingPathComponent:v30]);
    -[SystemDiagnostic setCompletedTarballPath:](self, "setCompletedTarballPath:", v32);

    BOOL v25 = 1;
    goto LABEL_10;
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
  unsigned int v13 = [v12 hasSuffix:v5];

  if (v13)
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v14,  "substringToIndex:",  (_BYTE *)objc_msgSend(v15, "length") - (_BYTE *)objc_msgSend(v5, "length")));
    -[SystemDiagnostic setArchiveName:](self, "setArchiveName:", v16);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 lastPathComponent]);
  unsigned __int8 v20 = [v17 isEqualToString:v19];

  if ((v20 & 1) != 0) {
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100057184(self);
  }
  unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
  [v21 stderrWrite:@"Archive name invalid: %@", v22];

  int v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
  [v23 log:@"Archive name invalid: %@", v24];

  BOOL v25 = 0;
LABEL_10:

  return v25;
}

- (BOOL)makeTargetDirectory:(id)a3
{
  BOOL v3 = (const char *)[a3 UTF8String];
  int v4 = mkpath_np(v3, 0x1E8u);
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      unsigned int v9 = v3;
      __int16 v10 = 2080;
      __int128 v11 = strerror(v4);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create %s: %s",  buf,  0x16u);
    }

    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v5, "stdoutWrite:", @"Failed to create %s: %s", v3, strerror(v4));

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v6, "log:", @"Failed to create %s: %s", v3, strerror(v4));
  }

  return v4 == 0;
}

- (BOOL)prepareOutputDirectory
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));

  if (!v3)
  {
    if (!-[SystemDiagnostic preparePaths](self, "preparePaths")) {
      return 0;
    }
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
    [v4 setUpDiagnosticID:v5];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  unsigned int v8 = [v6 fileExistsAtPath:v7 isDirectory:0];

  if (!v8)
  {
    if (-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall"))
    {
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
      unsigned int v15 = [v6 fileExistsAtPath:v14 isDirectory:0];

      if (v15)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10005727C(self);
        }
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
        __int128 v11 = @"Output archive already exists: %@\n";
        [v16 stderrWrite:@"Output archive already exists: %@\n", v17];

        id v12 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
        uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
        goto LABEL_17;
      }
    }

    else
    {
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedOutputDirectory](self, "completedOutputDirectory"));
      unsigned int v19 = [v6 fileExistsAtPath:v18 isDirectory:0];

      if (v19)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100057444(self);
        }
        unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedOutputDirectory](self, "completedOutputDirectory"));
        __int128 v11 = @"Output directory already exists: %@\n";
        [v20 stderrWrite:@"Output directory already exists: %@\n", v21];

        id v12 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
        uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedOutputDirectory](self, "completedOutputDirectory"));
        goto LABEL_17;
      }
    }

    if (!-[SystemDiagnostic makeOutputDirectory](self, "makeOutputDirectory"))
    {
      BOOL v23 = 0;
      goto LABEL_20;
    }

    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 stringByAppendingPathComponent:@"errors"]);
    NSFileAttributeKey v71 = NSFilePosixPermissions;
    v72 = &off_10009A510;
    dispatch_group_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v72,  &v71,  1LL));
    id v62 = 0LL;
    unsigned __int8 v28 = [v6 createDirectoryAtPath:v26 withIntermediateDirectories:0 attributes:v27 error:&v62];
    id v12 = v62;

    if ((v28 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000573DC();
      }
      v53 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v53 stderrWrite:@"Unable to create errors directory: %@", v12];

      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v22 log:@"Unable to create errors directory: %@", v12];
      goto LABEL_18;
    }

    size_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 stringByAppendingPathComponent:@"summaries"]);
    NSFileAttributeKey v69 = NSFilePosixPermissions;
    v70 = &off_10009A510;
    size_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
    id v61 = v12;
    unsigned __int8 v32 = [v6 createDirectoryAtPath:v30 withIntermediateDirectories:0 attributes:v31 error:&v61];
    id v33 = v61;

    if ((v32 & 1) != 0)
    {
      int v34 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic defaultBaseDirectory](self, "defaultBaseDirectory"));
      unsigned int v36 = [v34 isEqualToString:v35];

      if (!v36
        || (id v37 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory")),
            int v38 = sub_10004D690((const char *)[v37 UTF8String], 0, 0x1F5u),
            v37,
            v38 != -1))
      {
        id v39 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v39 stringByAppendingPathComponent:@"README.txt"]);

        id v40 = +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  off_1000A4F78,  strlen(off_1000A4F78));
        id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        NSFileAttributeKey v67 = NSFilePosixPermissions;
        v68 = &off_10009A528;
        id v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL));
        unsigned __int8 v43 = [v6 createFileAtPath:v22 contents:v41 attributes:v42];

        if ((v43 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v44 = __error();
            id v45 = strerror(*v44);
            *(_DWORD *)buf = 136315138;
            v66 = v45;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create README file: %s",  buf,  0xCu);
          }

          unsigned int v46 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          v47 = __error();
          objc_msgSend(v46, "log:", @"Failed to create README file: %s", strerror(*v47));
        }

        v48 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v48 stringByAppendingPathComponent:@"taskSummary.csv"]);

        NSFileAttributeKey v63 = NSFilePosixPermissions;
        v64 = &off_10009A528;
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v64,  &v63,  1LL));
        unsigned __int8 v51 = [v6 createFileAtPath:v49 contents:0 attributes:v50];

        if ((v51 & 1) != 0)
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingAtPath:",  v49));
          -[SystemDiagnostic setSummaryHandle:](self, "setSummaryHandle:", v52);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Summary file couldn't be created",  buf,  2u);
          }

          v52 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          [v52 log:@"Summary file couldn't be created"];
        }

        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic summaryHandle](self, "summaryHandle"));
        if (v55)
        {
          char v56 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic summaryHandle](self, "summaryHandle"));
          [v56 seekToEndOfFile];

          v57 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic summaryHandle](self, "summaryHandle"));
          sub_100023CA4( v57,  0LL,  @"Command,Exit description,Execution Time,Intended Timeout, MAX RSS (MB)\n",  @"writing summary file header");
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Couldn't get a valid file handle to write to task summary",  buf,  2u);
          }

          v57 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          [v57 log:@"Couldn't get a valid file handle to write to task summary"];
        }

        BOOL v23 = 1;
        goto LABEL_51;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000572F8(self);
      }
      v58 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      id v59 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
      [v58 stderrWrite:@"Failed to set attributes on %@", v59];

      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      id v60 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
      [v22 log:@"Failed to set attributes on %@", v60];
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100057374();
      }
      v54 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v54 stderrWrite:@"Unable to create summaries directory: %@", v33];

      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v22 log:@"Unable to create summaries directory: %@", v33];
    }

    BOOL v23 = 0;
LABEL_51:
    id v12 = v33;
    goto LABEL_19;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100057200(self);
  }
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  __int128 v11 = @"Internal output directory already exists: %@\n";
  [v9 stderrWrite:@"Internal output directory already exists: %@\n", v10];

  id v12 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
LABEL_17:
  id v22 = (void *)v13;
  objc_msgSend(v12, "log:", v11, v13);
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

LABEL_20:
  return v23;
}

- (void)closeTaskSummaryHandle
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  id v7 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( @"\nTotal tasks:",  "stringByAppendingFormat:",  @"%lu\n",  objc_msgSend(v3, "totalTasks")));

  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic summaryHandle](self, "summaryHandle"));
  sub_100023CA4(v4, 0LL, v7, @"writing summary file footer");

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic summaryHandle](self, "summaryHandle"));
  [v5 closeFile];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  [v6 setPushBufferDelegate:0];

  -[SystemDiagnostic setSummaryHandle:](self, "setSummaryHandle:", 0LL);
}

- (BOOL)previouslyRunningInstancesOfDiagnostic
{
  BOOL v3 = getprogname();
  if (-[SystemDiagnostic processCount](self, "processCount") < 1) {
    return 0;
  }
  uint64_t v4 = 0LL;
  uint64_t v5 = 48LL;
  do
  {
    int v6 = strncmp((const char *)-[SystemDiagnostic processes](self, "processes") + v5, v3, 0x10uLL);
    BOOL v7 = v6 == 0;
    if (!v6) {
      break;
    }
    ++v4;
    v5 += 136LL;
  }

  while (v4 < -[SystemDiagnostic processCount](self, "processCount"));
  return v7;
}

- (void)getCaseInsensitiveMatches:(id)a3 forString:(const char *)a4
{
  id v6 = a3;
  if (-[SystemDiagnostic processCount](self, "processCount") >= 1)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    do
    {
      if (sub_1000405A8(a4, (const char *)-[SystemDiagnostic processes](self, "processes") + v7 + 48))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v9 = (char *)-[SystemDiagnostic processes](self, "processes") + v7 + 48;
          int v10 = *(_DWORD *)((char *)-[SystemDiagnostic processes](self, "processes") + v7 + 12);
          *(_DWORD *)buf = 136315394;
          id v17 = v9;
          __int16 v18 = 1024;
          int v19 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Found partial match %s, targeting pid [%d]",  buf,  0x12u);
        }

        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        objc_msgSend( v11,  "stdoutWrite:",  @"Found partial match %s, targeting pid [%d]",  (char *)-[SystemDiagnostic processes](self, "processes") + v7 + 48,  *(unsigned int *)((char *)-[SystemDiagnostic processes](self, "processes") + v7 + 12));

        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        objc_msgSend( v12,  "log:",  @"Found partial match %s, targeting pid [%d]",  (char *)-[SystemDiagnostic processes](self, "processes") + v7 + 48,  *(unsigned int *)((char *)-[SystemDiagnostic processes](self, "processes") + v7 + 12));

        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)((char *)-[SystemDiagnostic processes](self, "processes") + v7 + 12)));
        [v6 addObject:v13];

        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices"));
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
        [v14 addObject:v15];
      }

      ++v8;
      v7 += 136LL;
    }

    while (v8 < -[SystemDiagnostic processCount](self, "processCount"));
  }
}

- (void)populateProcessInfoForInput
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
  if ([v3 isEqualToString:@"0"])
  {

LABEL_4:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Provided kernel_task as target. Ignored.",  buf,  2u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v6 log:@"Provided kernel_task as target. Ignored."];

    -[SystemDiagnostic setTargetPIDs:](self, "setTargetPIDs:", &off_10009A348);
    return;
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
  unsigned int v5 = [v4 isEqualToString:@"kernel_task"];

  if (v5) {
    goto LABEL_4;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
  if ([v7 hasPrefix:@"launchd"])
  {

LABEL_10:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v45 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Warning: Provided no target or launchd and/or its children as targets. Ignored.",  v45,  2u);
    }

    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v10 log:@"Warning: Provided no target or launchd and/or its children as targets. Ignored."];

    return;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
  unsigned int v9 = [v8 isEqualToString:&stru_10008D288];

  if (v9) {
    goto LABEL_10;
  }
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v12 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
  uint64_t v13 = (unsigned __int8 *)[v12 cStringUsingEncoding:4];

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
  id v15 = [v14 length];

  if (v15)
  {
    unint64_t v16 = 0LL;
    do
    {
      unsigned int v17 = v13[v16] - 58;
      BOOL v18 = v17 < 0xFFFFFFF6;
      if (v17 <= 0xFFFFFFF5) {
        break;
      }
      ++v16;
      int v19 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
      id v20 = [v19 length];
    }

    while ((unint64_t)v20 > v16);
  }

  else
  {
    BOOL v18 = 0;
  }

  unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
  id v22 = [v21 intValue];

  if ((_DWORD)v22 && !v18)
  {
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v22));
    [v11 addObject:v23];
  }

  if ([v11 count])
  {
    if (-[SystemDiagnostic processCount](self, "processCount") >= 1)
    {
      uint64_t v24 = 0LL;
      uint64_t v25 = 0LL;
      char v26 = 0;
      do
      {
        if (*(_DWORD *)((char *)-[SystemDiagnostic processes](self, "processes") + v24 + 12) == (_DWORD)v22)
        {
          dispatch_group_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices"));
          unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v25));
          [v27 addObject:v28];

          if (!strncmp((const char *)-[SystemDiagnostic processes](self, "processes") + v24 + 48, "launchd", 7uLL))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int16 v44 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Warning: Targeting launchd or its children. Ignored.",  v44,  2u);
            }

            size_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            id v30 = v29;
            size_t v31 = @"Warning: Targeting launchd or its children. Ignored.";
            goto LABEL_46;
          }

          char v26 = 1;
        }

        ++v25;
        v24 += 136LL;
      }

      while (v25 < -[SystemDiagnostic processCount](self, "processCount"));
      if ((v26 & 1) != 0) {
        goto LABEL_36;
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v43 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Warning: Supplied invalid target pid.",  v43,  2u);
    }

    size_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id v30 = v29;
    size_t v31 = @"Warning: Supplied invalid target pid.";
LABEL_46:
    [v29 log:v31];
  }

  else
  {
    id v32 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
    id v33 = [v32 cStringUsingEncoding:4];

    -[SystemDiagnostic getCaseInsensitiveMatches:forString:](self, "getCaseInsensitiveMatches:forString:", v11, v33);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v42 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  (const char *)&unk_100084B66,  v42,  2u);
    }

    int v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v34 stdoutWrite:&stru_10008D288];

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v35 log:&stru_10008D288];

LABEL_36:
    if ([v11 count] && -[SystemDiagnostic requestSource](self, "requestSource") != 1) {
      -[SystemDiagnostic setTargetPIDs:](self, "setTargetPIDs:", v11);
    }
    unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices"));
    id v37 = [v36 count];
    int v38 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
    id v39 = [v38 count];

    if (v37 != v39)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v41 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "pindIndices mismatch with targetpids.",  v41,  2u);
      }

      id v40 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v40 log:@"pindIndices mismatch with targetpids."];

      -[SystemDiagnostic setPidIndices:](self, "setPidIndices:", 0LL);
    }
  }
}

+ (BOOL)_runBlock:(id)a3 withTimeout:(double)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045370;
  block[3] = &unk_100089BB0;
  id v12 = a3;
  id v5 = v12;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v8, v6);

  dispatch_time_t v9 = dispatch_time(0LL, (uint64_t)(a4 * 1000000000.0));
  LOBYTE(v8) = dispatch_block_wait(v6, v9) == 0;

  return (char)v8;
}

- (BOOL)waitUntilComplete:(unint64_t)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  dispatch_time_t v5 = dispatch_time(0LL, 1000000000 * a3);
  dispatch_block_t v6 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completionDispatchGroup](v4, "completionDispatchGroup"));
  uint64_t v7 = dispatch_group_wait(v6, v5);

  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000574C0();
    }
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v8, "log:", @"Timed out waiting for sysdiagnose to complete. Timeout: %llus", a3);
  }

  objc_sync_exit(v4);

  return v7 == 0;
}

- (int64_t)_sizeOutputDirectoryAndGenerateDiagnosticSummary
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v2, 1LL));

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v44[0] = NSURLTotalFileSizeKey;
  v44[1] = NSURLIsDirectoryKey;
  v44[2] = NSURLNameKey;
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 3LL));
  unsigned __int8 v28 = (void *)v3;
  dispatch_block_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 enumeratorAtURL:v3 includingPropertiesForKeys:v5 options:0 errorHandler:0]);

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v8)
  {
    id v9 = v8;
    int64_t v10 = 0LL;
    uint64_t v11 = *(void *)v38;
    uint64_t v29 = *(void *)v38;
    id v30 = v7;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        unsigned int v14 = objc_autoreleasePoolPush();
        id v36 = 0LL;
        [v13 getResourceValue:&v36 forKey:NSURLIsDirectoryKey error:0];
        id v15 = v36;
        id v16 = v13;
        if (sub_10004D690((const char *)[v16 fileSystemRepresentation], 0x1F5u, 0x1F5u) == -1)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [v16 fileSystemRepresentation];
            *(_DWORD *)buf = 136315138;
            id v42 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to set attributes on %s",  buf,  0xCu);
          }

          BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          objc_msgSend( v18, "log:", @"Failed to set attributes on %s", objc_msgSend(v16, "fileSystemRepresentation"));
        }

        if (([v15 BOOLValue] & 1) == 0)
        {
          id v33 = v14;
          id v35 = 0LL;
          [v16 getResourceValue:&v35 forKey:NSURLTotalFileSizeKey error:0];
          id v19 = v35;
          id v20 = v19;
          if (v19)
          {
            v10 += (int64_t)[v19 longValue];
            id v34 = 0LL;
            [v16 getResourceValue:&v34 forKey:NSURLNameKey error:0];
            if (v34)
            {
              id v32 = v34;
              unsigned __int8 v21 = (char *)[v20 longLongValue];
              id v22 = &v21[v10];
              BOOL v23 = -[SystemDiagnostic summaryFD](self, "summaryFD");
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);

              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
              char v26 = v23;
              int64_t v10 = (int64_t)v22;
              uint64_t v11 = v29;
              sub_100023608(v26, v24, v25, v21, 0LL);

              id v7 = v30;
            }
          }

          unsigned int v14 = v33;
        }

        objc_autoreleasePoolPop(v14);
      }

      id v9 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }

    while (v9);
  }

  else
  {
    int64_t v10 = 0LL;
  }

  return v10;
}

- (void)waitAndCollectAirPodLogs
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](&OBJC_CLASS___SystemDiagnosticBT, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 waitForAirPodLogsIfAvailable]);

  if (v4)
  {
    dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    dispatch_block_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"AirPodLogs"]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    if (([v7 fileExistsAtPath:v6 isDirectory:&v30] & 1) == 0
      && ([v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0] & 1) == 0)
    {
      NSLog(@"Error: Create folder failed %@", v6);
    }

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    BOOL v23 = v4;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v26 objects:v37 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
      id v24 = v8;
      uint64_t v25 = v7;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          if ([v7 fileExistsAtPath:v13])
          {
            unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v14]);

            id v16 = v13;
            id v17 = (const char *)[v16 fileSystemRepresentation];
            id v18 = v15;
            if (sub_10004D748(v17, (const char *)[v18 fileSystemRepresentation], 0xFu) == -1)
            {
              int v19 = *__error();
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                id v22 = strerror(v19);
                *(_DWORD *)buf = 138412802;
                id v32 = v16;
                __int16 v33 = 2112;
                id v34 = v18;
                __int16 v35 = 2080;
                id v36 = v22;
                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to copy file %@ -> %@: %s",  buf,  0x20u);
              }

              id v20 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              [v20 stderrWrite:@"Unable to copy file %@ -> %@: %s", v16, v18, strerror(v19)];

              unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              [v21 log:@"Unable to copy file %@ -> %@: %s", v16, v18, strerror(v19)];

              id v8 = v24;
              id v7 = v25;
            }
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v26 objects:v37 count:16];
      }

      while (v10);
    }

    uint64_t v4 = v23;
  }
}

- (void)waitForRemoteLogs
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  [v3 waitForCoSysdiagnosesForDiagnosticID:v4];

  -[SystemDiagnostic waitAndCollectAirPodLogs](self, "waitAndCollectAirPodLogs");
}

- (void)initStreaming
{
  if (!-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall")
    || -[SystemDiagnostic disableStreamTar](self, "disableStreamTar"))
  {
    uint64_t v3 = self;
    uint64_t v4 = 0LL;
LABEL_4:
    -[SystemDiagnostic setShouldStreamToTar:](v3, "setShouldStreamToTar:", v4);
    goto LABEL_5;
  }

  id v8 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
  uint64_t v9 = sub_100022E38( (const char *)[v8 fileSystemRepresentation],  -[SystemDiagnostic isDeviceUnlockedSinceBoot](self, "isDeviceUnlockedSinceBoot"));

  BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v9 != -1)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Streaming to tar enabled",  buf,  2u);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v11 log:@"Streaming to tar enabled"];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
    uint64_t v13 = sub_1000229D4(v9, 0LL, v12, 1, -[SystemDiagnostic useParallelCompression](self, "useParallelCompression"));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[SystemDiagnostic setArchive:](self, "setArchive:", v14);

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));
    -[SystemDiagnostic setDpClass:](self, "setDpClass:", [v15 getProtectionClass]);

    uint64_t v3 = self;
    uint64_t v4 = 1LL;
    goto LABEL_4;
  }

  if (v10)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
    *(_DWORD *)buf = 138412290;
    id v20 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Couldn't create archive at location %@",  buf,  0xCu);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
  [v17 log:@"Couldn't create archive at location %@", v18];

  -[SystemDiagnostic setShouldStreamToTar:](self, "setShouldStreamToTar:", 0LL);
  -[SystemDiagnostic setArchive:](self, "setArchive:", 0LL);
LABEL_5:
  if (!-[SystemDiagnostic shouldStreamToTar](self, "shouldStreamToTar"))
  {
    dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    dispatch_block_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"/summaries/diagnostic_summary.log"]);

    id v7 = v6;
    self->_summaryFD = fopen((const char *)[v7 fileSystemRepresentation], "wx");
  }

- (void)executeOSLogArchiveContainers
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100045E94;
  v2[3] = &unk_100089BD8;
  v2[4] = self;
  -[SystemDiagnostic executeContainersInPhase:withCompletionBlock:]( self,  "executeContainersInPhase:withCompletionBlock:",  3LL,  v2);
}

- (void)sendCoreAnalytics
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  unint64_t v5 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:metricTotalSize]);
  unint64_t v6 = v5 / 0x3E8;

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic totalTime](self, "totalTime"));
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v7, @"totalDuration");

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:metricTimeSensitive]);
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v9, @"timeSensitiveDuration");

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:metricLogGeneration]);
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v11, @"generationDuration");

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:metricLogCopying]);
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v13, @"copyingDuration");

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:metricOSLogarchiveGeneration]);
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v15, @"libtraceDuration");

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v6));
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v16, @"size");

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall")));
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v17, @"isArchived");

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SystemDiagnostic didComplete](self, "didComplete") ^ 1));
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v18, @"isCancelled");

  int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[SystemDiagnostic requestSource](self, "requestSource")));
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v19, @"startedBy");

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v20 totalFailedTasks]));
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v21, @"numberOfFailedTasks");

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v22 totalTimeouts]));
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v23, @"numberOfTimeouts");

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:metricPersistLookback]);
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v25, @"peristLookback");

  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:metricSpecialLookback]);
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v27, @"specialLookback");

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:metricSignpostLookback]);
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v29, @"signpostLookback");

  char v30 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  size_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:metricPersistSize]);
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v31, @"peristSize");

  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:metricSpecialSize]);
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v33, @"specialSize");

  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:metricSignpostSize]);
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v35, @"signpostSize");

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000464D8;
  v37[3] = &unk_100089C00;
  __int128 v38 = v3;
  id v36 = v3;
  AnalyticsSendEventLazy(@"com.apple.sysdiagnose", v37);
}

- (void)outputMetrics
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
  -[SystemDiagnostic setTotalTime:](self, "setTotalTime:", v7);

  if (-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));
    id v9 = [v8 getUncompressedSize];
  }

  else
  {
    id v9 = -[SystemDiagnostic _sizeOutputDirectoryAndGenerateDiagnosticSummary]( self,  "_sizeOutputDirectoryAndGenerateDiagnosticSummary");
  }

  id v94 = v9;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v9));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  uint64_t v12 = metricTotalSize;
  [v11 setObject:v10 forKeyedSubscript:metricTotalSize];

  uint64_t v93 = v12;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    uint64_t v13 = metricGetTimeSensitive;
    v88 = (void *)objc_claimAutoreleasedReturnValue([v90 objectForKeyedSubscript:metricGetTimeSensitive]);
    [v88 doubleValue];
    double v15 = v14;
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    uint64_t v16 = metricGetLogGeneration;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v86 objectForKeyedSubscript:metricGetLogGeneration]);
    [v17 doubleValue];
    int v19 = v18;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    uint64_t v21 = metricGetLogCopying;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:metricGetLogCopying]);
    [v22 doubleValue];
    uint64_t v24 = v23;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    uint64_t v26 = metricGetOSLogArchive;
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:metricGetOSLogArchive]);
    [v27 doubleValue];
    *(_DWORD *)buf = 134218752;
    double v96 = v15;
    __int16 v97 = 2048;
    id v98 = v19;
    __int16 v99 = 2048;
    uint64_t v100 = v24;
    __int16 v101 = 2048;
    uint64_t v102 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "\n Getting time sensitive containers: %0.2f\n Getting log generation containers: %0.2f\n Getting log copying containers: %0.2f\n Getting OS log archive containers: %0.2f\n",  buf,  0x2Au);
  }

  else
  {
    uint64_t v13 = metricGetTimeSensitive;
    uint64_t v16 = metricGetLogGeneration;
    uint64_t v21 = metricGetLogCopying;
    uint64_t v26 = metricGetOSLogArchive;
  }

  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  char v30 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  size_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v13]);
  [v31 doubleValue];
  uint64_t v33 = v32;
  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:v16]);
  [v35 doubleValue];
  uint64_t v37 = v36;
  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:v21]);
  [v39 doubleValue];
  uint64_t v41 = v40;
  id v42 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  unsigned __int8 v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:v26]);
  [v43 doubleValue];
  objc_msgSend( v29,  "log:",  @"\nGetting time sensitive containers: %0.2f\nGetting log generation containers: %0.2f\nGetting log copying containers: %0.2f\nGetting OS log archive containers: %0.2f\n",  v33,  v37,  v41,  v44);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    uint64_t v85 = metricTimeSensitive;
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKeyedSubscript:"));
    [v89 doubleValue];
    double v46 = v45;
    unint64_t v87 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    uint64_t v47 = metricLogCopying;
    v84 = (void *)objc_claimAutoreleasedReturnValue([v87 objectForKeyedSubscript:metricLogCopying]);
    [v84 doubleValue];
    uint64_t v49 = v48;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    uint64_t v50 = metricLogGeneration;
    unsigned __int8 v51 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKeyedSubscript:metricLogGeneration]);
    [v51 doubleValue];
    uint64_t v53 = v52;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    uint64_t v55 = metricOSLogarchiveGeneration;
    char v56 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:metricOSLogarchiveGeneration]);
    [v56 doubleValue];
    uint64_t v58 = v57;
    id v59 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    uint64_t v60 = v93;
    id v61 = (void *)objc_claimAutoreleasedReturnValue([v59 objectForKeyedSubscript:v93]);
    id v62 = [v61 longLongValue];
    *(_DWORD *)buf = 134219264;
    double v96 = v46;
    __int16 v97 = 2048;
    id v98 = v49;
    __int16 v99 = 2048;
    uint64_t v100 = v53;
    __int16 v101 = 2048;
    uint64_t v102 = v58;
    __int16 v103 = 2048;
    double v104 = v6;
    __int16 v105 = 2048;
    id v106 = v62;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "\n Time Sensitive: %0.2f \n Log Copying: %0.2f \n Log Generation: %0.2f \n OSLogArchive Generation: %0.2f \n Total: %0.2f seconds, %llu bytes",  buf,  0x3Eu);

    uint64_t v63 = v85;
  }

  else
  {
    uint64_t v63 = metricTimeSensitive;
    uint64_t v47 = metricLogCopying;
    uint64_t v50 = metricLogGeneration;
    uint64_t v55 = metricOSLogarchiveGeneration;
    uint64_t v60 = v93;
  }

  v64 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v92 objectForKeyedSubscript:v63]);
  [v65 doubleValue];
  uint64_t v67 = v66;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  NSFileAttributeKey v69 = (void *)objc_claimAutoreleasedReturnValue([v68 objectForKeyedSubscript:v47]);
  [v69 doubleValue];
  uint64_t v71 = v70;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v73 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKeyedSubscript:v50]);
  [v73 doubleValue];
  uint64_t v75 = v74;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  __int128 v77 = (void *)objc_claimAutoreleasedReturnValue([v76 objectForKeyedSubscript:v55]);
  [v77 doubleValue];
  uint64_t v79 = v78;
  __int128 v80 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v81 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKeyedSubscript:v60]);
  objc_msgSend( v64,  "log:",  @"\nTime Sensitive: %0.2f \nLog Copying: %0.2f \nLog Generation: %0.2f \nOSLogArchive Generation: %0.2f \nTotal: %0.2f seconds, %llu bytes",  v67,  v71,  v75,  v79,  *(void *)&v6,  objc_msgSend(v81, "longLongValue"));

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v96 = v6;
    __int16 v97 = 2048;
    id v98 = v94;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Resource Usage: Gathering diagnostics took %f.1 seconds for %lld bytes (uncompressed)",  buf,  0x16u);
  }

  v82 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend( v82,  "log:",  @"Resource Usage: Gathering diagnostics took %f.1 seconds for %lld bytes (uncompressed)",  *(void *)&v6,  v94);
}

- (void)createOnlyRunContainersWithNamesArray:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic onlyRunContainersWithNames](self, "onlyRunContainersWithNames"));

    if (v5)
    {
      BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v6) {
        sub_10005759C(v6, v7, v8);
      }
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v9 stderrWrite:@"Resetting only run containers with names array"];

      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v10 log:@"Resetting only run containers with names array"];
    }

    uint64_t v28 = self;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsSeparatedByString:@","]);
    id v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v16);
          id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
          int v19 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByTrimmingCharactersInSet:v18]);

          if ([v19 length])
          {
            [v11 addObject:v19];
          }

          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100057564(&v29, v30, v20);
            }
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v21 stderrWrite:@"Invalid name passed to onlyRunContainersWithNames"];

            id v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v22 log:@"Invalid name passed to onlyRunContainersWithNames"];
          }

          uint64_t v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v14);
    }

    id v23 = [v11 copy];
    -[SystemDiagnostic setOnlyRunContainersWithNames:](v28, "setOnlyRunContainersWithNames:", v23);
  }

  else
  {
    BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v24) {
      sub_100057528(v24, v25, v26);
    }
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v27 stderrWrite:@"Nil names string passed to setOnlyRunContainersWithNames"];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v11 log:@"Nil names string passed to setOnlyRunContainersWithNames"];
  }
}

- (id)filterDiagnosticContainers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic onlyRunContainersWithNames](self, "onlyRunContainersWithNames"));
  if (v5
    && (BOOL v6 = (void *)v5,
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic onlyRunContainersWithNames](self, "onlyRunContainersWithNames")),
        id v8 = [v7 count],
        v7,
        v6,
        v8))
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v20 = v4;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        id v14 = 0LL;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v14);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic onlyRunContainersWithNames](self, "onlyRunContainersWithNames"));
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
          unsigned int v18 = [v16 containsObject:v17];

          if (v18) {
            [v9 addObject:v15];
          }
          id v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v12);
    }

    id v4 = v20;
  }

  else
  {
    id v9 = v4;
  }

  return v9;
}

- (id)getDiagnosticContainers:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic overrideContainers](self, "overrideContainers"));

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringForPhaseID:v3]);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      unsigned int v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "getDiagnosticContainers found override containers. Returning new values for phase '%@'",  (uint8_t *)&v17,  0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic overrideContainers](self, "overrideContainers"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);

    if (v11) {
      id v12 = [v11 mutableCopy];
    }
    else {
      id v12 = v5;
    }
    id v14 = v12;
  }

  else
  {
    switch((int)v3)
    {
      case 0:
        uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getTimeSensitiveContainers](self, "getTimeSensitiveContainers"));
        goto LABEL_14;
      case 1:
        uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLogGenerationContainers](self, "getLogGenerationContainers"));
        goto LABEL_14;
      case 2:
        uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLogCopyingContainers](self, "getLogCopyingContainers"));
        goto LABEL_14;
      case 3:
        uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLibtraceContainers](self, "getLibtraceContainers"));
LABEL_14:
        uint64_t v15 = (void *)v13;

        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic filterDiagnosticContainers:](self, "filterDiagnosticContainers:", v15));
        id v5 = v15;
        break;
      default:
        id v5 = v5;
        id v14 = v5;
        break;
    }
  }

  return v14;
}

- (void)logContainerAsExecuted:(id)a3 inPhase:(int)a4
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___SDComplexContainer, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v8 = v4;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 taskContainer]);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___SDTaskDepotContainer, v10);
    char isKindOfClass = objc_opt_isKindOfClass(v9, v11);

    if ((isKindOfClass & 1) != 0) {
      id v13 = (id)objc_claimAutoreleasedReturnValue([v8 taskContainer]);
    }
    else {
      id v13 = 0LL;
    }

    if (!v13) {
      goto LABEL_26;
    }
  }

  else
  {
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___SDTaskDepotContainer, v7);
    if ((objc_opt_isKindOfClass(v4, v14) & 1) == 0) {
      goto LABEL_26;
    }
    id v13 = v4;
    if (!v13) {
      goto LABEL_26;
    }
  }

  uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 destination]);
  uint64_t v16 = v15;
  if (!v15 || -[__CFString isEqualToString:](v15, "isEqualToString:", @"."))
  {

    uint64_t v16 = &stru_10008D288;
  }

  int v17 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v13 units]);
  id v19 = [v18 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(v18);
        }
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v34 + 1) + 8 * (void)i) stdoutPath]);
        if (v22)
        {
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v16, "stringByAppendingPathComponent:", v22));

          if ([v23 characterAtIndex:0] == 47)
          {
            do
            {
              __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 substringFromIndex:1]);

              __int128 v23 = v24;
            }

            while ([v24 characterAtIndex:0] == 47);
          }

          else
          {
            __int128 v24 = v23;
          }

          -[NSMutableArray addObject:](v17, "addObject:", v24);
        }
      }

      id v19 = [v18 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }

    while (v19);
  }

  v38[0] = @"paths";
  id v25 = -[NSMutableArray copy](v17, "copy");
  v39[0] = v25;
  v38[1] = @"isConcurrent";
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v13 isConcurrent]));
  v39[1] = v26;
  v38[2] = @"phase";
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a4));
  v39[2] = v27;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  3LL));

  uint8_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic executedContainers](self, "executedContainers"));
  objc_sync_enter(v29);
  char v30 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic executedContainers](self, "executedContainers"));
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  [v30 setObject:v28 forKeyedSubscript:v31];

  objc_sync_exit(v29);
LABEL_26:
}

- (void)setupTaskDepotForPhase:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  id v13 = sub_1000477BC;
  uint64_t v14 = &unk_100089C28;
  os_activity_t v15 = _os_activity_create( (void *)&_mh_execute_header,  "Ending task",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  id v7 = v6;
  id v16 = v7;
  int v17 = self;
  int v18 = v3;
  id v8 = v15;
  [v5 setTaskCompletionBlock:&v11];
  unsigned __int8 v9 = -[SystemDiagnostic isTestingMode](self, "isTestingMode", v11, v12, v13, v14);
  double v10 = 0.0;
  if ((v9 & 1) == 0) {
    objc_msgSend(v7, "getMinimumTimeBeforeTimeoutsForPhaseID:", v3, 0.0);
  }
  [v5 setMinimumTimeBeforeTimeouts:v10];
}

- (void)endTaskDepotForPhase:(int)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot", *(void *)&a3));
  [v3 setMinimumTimeBeforeTimeouts:0.0];
  [v3 setTaskCompletionBlock:0];
}

- (void)executeContainers:(id)a3 inPhase:(int)a4 withCompletionBlock:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  unsigned __int8 v9 = (void (**)(id, void *, id))a5;
  if ([v8 count])
  {
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v30 = v8;
    id obj = v8;
    id v10 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v35;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
          -[SystemDiagnostic logContainerAsExecuted:inPhase:](self, "logContainerAsExecuted:inPhase:", v14, v6);
          os_activity_t v15 = objc_autoreleasePoolPush();
          if (![v32 mayStartExecuting])
          {
            objc_autoreleasePoolPop(v15);
            goto LABEL_23;
          }

          id v16 = [v14 execute];
          uint64_t v18 = objc_opt_class(&OBJC_CLASS___SDTaskContainer, v17);
          if ((objc_opt_isKindOfClass(v14, v18) & 1) == 0)
          {
            uint64_t v20 = objc_opt_class(&OBJC_CLASS___SDComplexContainer, v19);
            if ((objc_opt_isKindOfClass(v14, v20) & 1) == 0)
            {
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v32 taskCompletionBlock]);

              if (v21)
              {
                __int128 v22 = (void (**)(void))objc_claimAutoreleasedReturnValue([v32 taskCompletionBlock]);
                v22[2]();
              }
            }
          }

          if (v9) {
            v9[2](v9, v14, v16);
          }
          objc_autoreleasePoolPop(v15);
        }

        id v11 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    id obj = (id)objc_claimAutoreleasedReturnValue([v23 stringForPhaseID:v6]);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Main thread waiting for tasks to finish",  buf,  2u);
    }

    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v24 stdoutWrite:@"Main thread waiting for tasks to finish"];

    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v25 log:@"Main thread waiting for tasks to finish"];

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
    unsigned __int8 v27 = [v26 waitUntilAllTasksComplete:600];

    if ((v27 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000575D8();
      }
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v28 stderrWrite:@"[%@ phase] failed to complete in time. The tasks may continue to run, but continuing to the next phase.", obj];

      uint8_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v29 log:@"[%@ phase] failed to complete in time. The tasks may continue to run, but continuing to the next phase.", obj];
    }

- (void)executeContainersInPhase:(int)a3 withCompletionBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v28 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringForPhaseID:v4]);
  uint8_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v8 = sub_100024174();
  unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v31 = v7;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Phase",  "%@",  buf,  0xCu);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v31 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Begin %@ Phase",  buf,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v10 stdoutWrite:@"Begin %@ Phase", v7];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v11 log:@"Begin %@ Phase", v7];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getDiagnosticContainers:](self, "getDiagnosticContainers:", v4));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 getContainersMetricForPhaseId:v4]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v14 timeIntervalSinceDate:v29];
  os_activity_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  [v16 setObject:v15 forKeyedSubscript:v13];

  objc_msgSend(v6, "setupProgressTotal:forPhase:", objc_msgSend(v12, "count"), v4);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  [v6 registerActivityWithID:v17];

  -[SystemDiagnostic setupTaskDepotForPhase:](self, "setupTaskDepotForPhase:", v4);
  -[SystemDiagnostic executeContainers:inPhase:withCompletionBlock:]( self,  "executeContainers:inPhase:withCompletionBlock:",  v12,  v4,  v28);

  -[SystemDiagnostic endTaskDepotForPhase:](self, "endTaskDepotForPhase:", v4);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 elapsedMetricForPhaseID:v4]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v19 timeIntervalSinceDate:v29];
  double v21 = v20;

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v21));
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  [v23 setObject:v22 forKeyedSubscript:v18];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v31 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "End %@ Phase",  buf,  0xCu);
  }

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v24 stdoutWrite:@"End %@ Phase", v7];

  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v25 log:@"End %@ Phase", v7];

  uint64_t v26 = sub_100024174();
  unsigned __int8 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v27,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Phase",  (const char *)&unk_100084B66,  buf,  2u);
  }
}

- (void)summarizeErrorsWithinSDTask:(id)a3
{
  id v4 = a3;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic executedContainers](self, "executedContainers"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 allKeys]);

  id obj = (id)v6;
  id v7 = (void *)v6;
  id v8 = self;
  id v9 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v37;
    uint64_t v27 = *(void *)v37;
    id v28 = self;
    do
    {
      uint64_t v12 = 0LL;
      id v29 = v10;
      do
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v12;
        uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * v12);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic executedContainers](v8, "executedContainers"));
        os_activity_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v13]);

        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"isConcurrent"]);
        unsigned int v17 = [v16 BOOLValue];

        if (v17)
        {
          uint64_t v18 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"paths"]);
          id v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
          double v21 = v15;
          if (v20)
          {
            id v22 = v20;
            uint64_t v23 = *(void *)v33;
            do
            {
              for (i = 0LL; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v33 != v23) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
                if (-[NSMutableSet containsObject:](v18, "containsObject:", v25))
                {
                  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Non-serial container '%@' writes to '%@' in parallel",  v13,  v25));
                  [v4 addObject:v26];
                }

                else
                {
                  -[NSMutableSet addObject:](v18, "addObject:", v25);
                }
              }

              id v22 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }

            while (v22);
          }

          uint64_t v11 = v27;
          id v10 = v29;
          os_activity_t v15 = v21;
          id v8 = v28;
        }

        uint64_t v12 = v31 + 1;
      }

      while ((id)(v31 + 1) != v10);
      id v10 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }

    while (v10);
  }
}

- (void)summarizeErrorsAcrossSDTasks:(id)a3
{
  id v4 = a3;
  __int128 v37 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic executedContainers](self, "executedContainers"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v56 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic executedContainers](self, "executedContainers"));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"phase"]);
        unsigned int v15 = [v14 intValue];

        if (v15)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"paths"]);
          unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v17, v11);
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    }

    while (v8);
  }

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v32 = -[NSMutableDictionary copy](v37, "copy");
  id v30 = (id)objc_claimAutoreleasedReturnValue([v32 allKeys]);
  id v33 = [v30 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v52;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v52 != v31) {
          objc_enumerationMutation(v30);
        }
        uint64_t v34 = v18;
        uint64_t v19 = *(void *)(*((void *)&v51 + 1) + 8 * v18);
        __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v19]);
        -[NSMutableDictionary removeObjectForKey:](v37, "removeObjectForKey:", v19);
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        id v35 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v37, "allKeys"));
        __int128 v39 = (char *)[v35 countByEnumeratingWithState:&v47 objects:v60 count:16];
        if (v39)
        {
          uint64_t v36 = *(void *)v48;
          do
          {
            id v20 = 0LL;
            do
            {
              if (*(void *)v48 != v36) {
                objc_enumerationMutation(v35);
              }
              obja = v20;
              uint64_t v21 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)v20);
              uint64_t v22 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", v21));
              id v23 = [v38 mutableCopy];
              uint64_t v40 = (void *)v22;
              [v23 intersectSet:v22];
              __int128 v45 = 0u;
              __int128 v46 = 0u;
              __int128 v43 = 0u;
              __int128 v44 = 0u;
              id v24 = v23;
              id v25 = [v24 countByEnumeratingWithState:&v43 objects:v59 count:16];
              if (v25)
              {
                id v26 = v25;
                uint64_t v27 = *(void *)v44;
                do
                {
                  for (j = 0LL; j != v26; j = (char *)j + 1)
                  {
                    if (*(void *)v44 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Container '%@' writes to file '%@', which is also written by container '%@'",  v19,  *(void *)(*((void *)&v43 + 1) + 8LL * (void)j),  v21));
                    [v4 addObject:v29];
                  }

                  id v26 = [v24 countByEnumeratingWithState:&v43 objects:v59 count:16];
                }

                while (v26);
              }

              id v20 = obja + 1;
            }

            while (obja + 1 != v39);
            __int128 v39 = (char *)[v35 countByEnumeratingWithState:&v47 objects:v60 count:16];
          }

          while (v39);
        }

        uint64_t v18 = v34 + 1;
      }

      while ((id)(v34 + 1) != v33);
      id v33 = [v30 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }

    while (v33);
  }
}

- (void)summarizeErrorsForExecutedContainers
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  -[SystemDiagnostic summarizeErrorsWithinSDTask:](self, "summarizeErrorsWithinSDTask:", v3);
  -[SystemDiagnostic summarizeErrorsAcrossSDTasks:](self, "summarizeErrorsAcrossSDTasks:", v3);
  id v4 = -[NSMutableArray count](v3, "count");
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"errors/SDTaskWriteErrors.txt"]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @"\n"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v15 = v5;
      __int16 v16 = 2080;
      id v17 = [v7 fileSystemRepresentation];
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Found %lu SDTask write errors. Adding to error file %s",  buf,  0x16u);
    }

    id v13 = 0LL;
    [v9 writeToFile:v7 options:0 error:&v13];
    id v10 = v13;
    if (v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
      id v12 = [v11 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v15 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create error file for writing with error: %s",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "No executed container errors found, not writing error file",  buf,  2u);
  }
}

- (void)executeDiagnosticContainers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[SystemDiagnostic setStartDiagnosticTime:](self, "setStartDiagnosticTime:", v4);

  -[SystemDiagnostic setStartDiagnosticTimeClockNS:]( self,  "setStartDiagnosticTimeClockNS:",  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW));
  if (!-[SystemDiagnostic startDiagnosticTimeClockNS](self, "startDiagnosticTimeClockNS")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100057640();
  }

  [v3 initPeerProgressHandler];
  if (-[SystemDiagnostic shouldRunTimeSensitiveTasks](self, "shouldRunTimeSensitiveTasks")) {
    -[SystemDiagnostic executeContainersInPhase:withCompletionBlock:]( self,  "executeContainersInPhase:withCompletionBlock:",  0LL,  0LL);
  }
  if (-[SystemDiagnostic earlyPrompt](self, "earlyPrompt")
    && -[SystemDiagnostic isPromptEligible](self, "isPromptEligible"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100048B58;
    block[3] = &unk_100088EA8;
    void block[4] = self;
    dispatch_async(v6, block);
  }

  if (-[SystemDiagnostic shouldRunLogGenerationTasks](self, "shouldRunLogGenerationTasks")) {
    -[SystemDiagnostic executeContainersInPhase:withCompletionBlock:]( self,  "executeContainersInPhase:withCompletionBlock:",  1LL,  0LL);
  }
  if (-[SystemDiagnostic shouldRunLogCopyTasks](self, "shouldRunLogCopyTasks")) {
    -[SystemDiagnostic executeContainersInPhase:withCompletionBlock:]( self,  "executeContainersInPhase:withCompletionBlock:",  2LL,  0LL);
  }
  if (-[SystemDiagnostic shouldRunOSLogArchive](self, "shouldRunOSLogArchive")) {
    -[SystemDiagnostic executeOSLogArchiveContainers](self, "executeOSLogArchiveContainers");
  }
  -[SystemDiagnostic waitForRemoteLogs](self, "waitForRemoteLogs");
  -[SystemDiagnostic summarizeErrorsForExecutedContainers](self, "summarizeErrorsForExecutedContainers");
  [v3 sendProgress:3 phase:0 toPeers:100.0];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "\nCompleted all phases. Wrapping up.",  v9,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v7 stdoutWrite:@"\nCompleted all phases. Wrapping up."];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  [v8 log:@"\nCompleted all phases. Wrapping up."];

  -[SystemDiagnostic outputMetrics](self, "outputMetrics");
  -[SystemDiagnostic endDiagnostics](self, "endDiagnostics");
}

- (void)recordDiagnosticsMetrics:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  [v5 timeIntervalSinceDate:v8];
  double v10 = v9;

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  [v12 setObject:v11 forKeyedSubscript:metricCompression];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  [v14 setObject:v13 forKeyedSubscript:metricStartToTar];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v32 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Took %f seconds for finishing the tar\n",  buf,  0xCu);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v15, "log:", @"Took %f seconds for finishing the tar\n", *(void *)&v7);

  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
  id v30 = 0LL;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 attributesOfItemAtPath:v17 error:&v30]);
  id v19 = v30;

  if (v18)
  {
    id v20 = [v18 fileSize];
    if (v20)
    {
      unint64_t v21 = (unint64_t)v20;
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:metricTotalSize]);
      id v24 = [v23 longLongValue];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v32 = *(double *)&v21;
        __int16 v33 = 2048;
        double v34 = (double)(uint64_t)v24 / (double)v21;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Resource Usage - post tarring: Gathering diagnostics is %lld bytes (compressed) with %.1fX compression ratio",  buf,  0x16u);
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend( v25,  "log:",  @"Resource Usage - post tarring: Gathering diagnostics is %lld bytes (compressed) with %.1fX compression ratio",  v21,  (double)(uint64_t)v24 / (double)v21);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unable to read tarball file size post tarring",  buf,  2u);
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend(v25, "log:", @"Unable to read tarball file size post tarring", v28, v29);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedDescription]);
      *(_DWORD *)buf = 138412290;
      double v32 = *(double *)&v26;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unable to read tarball file attributes post tarring: %@",  buf,  0xCu);
    }

    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedDescription]);
    [v25 log:@"Unable to read tarball file attributes post tarring: %@", v27];
  }
}

- (void)endDiagnostics
{
  if (-[SystemDiagnostic coSysdiagnoseOnly](self, "coSysdiagnoseOnly"))
  {
    -[SystemDiagnostic setDidComplete:](self, "setDidComplete:", 1LL);
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
    -[SystemDiagnostic setDidComplete:](self, "setDidComplete:", [v3 mayStartExecuting]);
  }

  if (!-[SystemDiagnostic coSysdiagnoseOnly](self, "coSysdiagnoseOnly"))
  {
    unint64_t v4 = +[SDTaskDepot stopTasks](&OBJC_CLASS___SDTaskDepot, "stopTasks");
    if (v4)
    {
      unint64_t v5 = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000576DC();
      }
      double v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend(v6, "log:", @"%lu tasks were still running after the generation phases ended.", v5);
    }
  }

  if (-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall"))
  {
    unsigned int v7 = -[SystemDiagnostic useParallelCompression](self, "useParallelCompression");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));
    if (v7) {
      unsigned int v12 = 5;
    }
    else {
      unsigned int v12 = 1;
    }
    -[SystemDiagnostic setDpClass:](self, "setDpClass:", sub_100022FE4(v9, v10, v12, v11));

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v13 closeSysdiagnoseLog];

    -[SystemDiagnostic recordDiagnosticsMetrics:](self, "recordDiagnosticsMetrics:", v8);
  }

  else
  {
    if (-[SystemDiagnostic summaryFD](self, "summaryFD")) {
      fclose(-[SystemDiagnostic summaryFD](self, "summaryFD"));
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v8 closeSysdiagnoseLog];
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  unsigned int v16 = [v14 fileExistsAtPath:v15 isDirectory:0];

  if (v16)
  {
    id v17 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    if (sub_10004D690((const char *)[v17 UTF8String], 0x1F5u, 0x1F5u) == -1)
    {
    }

    else
    {
      id v18 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
      int v19 = sub_10004D6F4((const char *)[v18 UTF8String], 0x1EDu);

      if (v19 != -1) {
        goto LABEL_25;
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to set file attributes on %@",  buf,  0xCu);
    }

    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    [v21 log:@"Failed to set file attributes on %@", v22];
  }

- (id)getLogarchiveSummaryContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:",  @"logarchive summary",  0LL,  1LL,  self,  35.0));
  unint64_t v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", (unint64_t)objc_msgSend(v4, "runtimeChecks") | 0x40);
    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/usr/bin/log",  &off_10009A360,  @"libtrace/oslog_status.log"));
    v12[0] = @"-lRsh";
    v12[1] = @"/private/var/db/diagnostics";
    v13[0] = v6;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/bin/ls",  v7,  @"libtrace/oslog_contents.log"));
    v13[1] = v8;
    double v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDTask taskWithCommand:arguments:outputFile:]( &OBJC_CLASS___SDTask,  "taskWithCommand:arguments:outputFile:",  @"/bin/ls",  &off_10009A378,  @"libtrace/oslog_uuidtext.log"));
    void v13[2] = v9;
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 3LL));
    [v5 addSDTasksToContainer:v10];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getLogarchiveCollectionContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogArchiveContainer containerWithName:destination:withTimeout:withTargetArchive:withDelegate:]( &OBJC_CLASS___SDLogArchiveContainer,  "containerWithName:destination:withTimeout:withTargetArchive:withDelegate:",  @"logarchive",  v4,  v5,  self,  300.0));

  if (v6)
  {
    [v6 setRuntimeChecks:64];
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v7 setValue:&off_10009A558 forKey:OSLogConstructHighVolumeSizeLimit];
    [v7 setValue:&off_10009A570 forKey:OSLogConstructSignpostSizeLimit];
    [v7 setValue:&off_10009A588 forKey:OSLogConstructSpecialSizeLimit];
    [v7 setValue:&off_10009A5A0 forKey:OSLogConstructPersistSizeLimit];
    [v7 setValue:&off_10009A5B8 forKey:OSLogConstructHighVolumeAgeLimit];
    [v7 setValue:&off_10009A5D0 forKey:OSLogConstructSignpostAgeLimit];
    [v7 setValue:&off_10009A5E8 forKey:OSLogConstructSpecialAgeLimit];
    [v7 setValue:&off_10009A600 forKey:OSLogConstructPersistAgeLimit];
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogArchiveUnit logArchiveUnitWithDictionary:]( &OBJC_CLASS___SDLogArchiveUnit,  "logArchiveUnitWithDictionary:",  v7));
    [v6 setLogArchiveUnit:v8];

    [v3 addObject:v6];
  }

  return v3;
}

- (id)getLogStreamFilterContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  @"LogStreamFilter",  @"libtrace",  self));
  unint64_t v5 = v4;
  if (v4)
  {
    [v4 setRuntimeChecks:9];
    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithPaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithPaths:",  &off_10009A390));
    v10[0] = v6;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogGlob logRuleWithGlob:]( &OBJC_CLASS___SDUnitLogGlob,  "logRuleWithGlob:",  @"/private/var/db/diagnostics/logd.[01].log"));
    v10[1] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
    [v5 addRules:v8];

    [v3 addObject:v5];
  }

  return v3;
}

- (id)getLibtraceContainers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLogarchiveSummaryContainer](self, "getLogarchiveSummaryContainer"));
  [v3 addObjectsFromArray:v4];

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLogarchiveCollectionContainer](self, "getLogarchiveCollectionContainer"));
  [v3 addObjectsFromArray:v5];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLogStreamFilterContainer](self, "getLogStreamFilterContainer"));
  [v3 addObjectsFromArray:v6];

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SystemDiagnostic;
  -[SystemDiagnostic dealloc](&v3, "dealloc");
}

- (void)writeReportForTasks:(id)a3 withTimeout:(double)a4 concurrently:(BOOL)a5 withDepotName:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  __int128 v55 = (__CFString *)a6;
  double v10 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  &stru_10008D288);
  if ((unint64_t)[v9 count] >= 2)
  {
    if (v7) {
      id v11 = @"\nConcurrent ";
    }
    else {
      id v11 = @"\nSequential ";
    }
    -[NSMutableString appendString:](v10, "appendString:", v11);
    -[NSMutableString appendFormat:](v10, "appendFormat:", @"group with total timeout %f sec\n", *(void *)&a4);
  }

  __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v73 objects:v78 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = @"%@,";
    uint64_t v15 = *(void *)v74;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v74 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
        if (([v17 started] & 1) == 0)
        {
          unint64_t v21 = v14;
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v17 arguments]);
          if (v22
            && (__int128 v58 = (void *)objc_claimAutoreleasedReturnValue([v17 arguments]),
                ([v58 isEqualToArray:&__NSArray0__struct] & 1) == 0))
          {
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v17 launchPath]);
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v17 arguments]);
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 componentsJoinedByString:@" "]);
            id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  v25,  v27));
          }

          else
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v17 launchPath]);
            if (!v22) {
              goto LABEL_25;
            }
          }

LABEL_25:
          uint64_t v14 = v21;
          -[NSMutableString appendFormat:](v10, "appendFormat:", v21, v23);
          -[NSMutableString appendString:](v10, "appendString:", @"Never got executed,");
          -[NSMutableString appendFormat:](v10, "appendFormat:", @"0.00,%f\n", *(void *)&a4, v52, v53);
          goto LABEL_33;
        }

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 executionLine]);
        -[NSMutableString appendFormat:](v10, "appendFormat:", v14, v18);

        id v19 = [v17 endStatus];
        if ((v19 & 0x7F) != 0)
        {
          if ((v19 & 0x7F) == 0x7F)
          {
            if ((int)v19 >> 8 == 19) {
              id v20 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown status %04x",  v19);
            }
            else {
              id v20 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"stopped due to signal: %s",  strsignal((int)v19 >> 8));
            }
          }

          else
          {
            id v20 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"terminated due to signal: %s",  strsignal(v19 & 0x7F));
          }

          id v23 = (void *)objc_claimAutoreleasedReturnValue(v20);
          -[NSMutableString appendFormat:](v10, "appendFormat:", v14, v23);
        }

        else
        {
          int v24 = BYTE1(v19);
          id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"exited with status %d",  BYTE1(v19)));
          -[NSMutableString appendFormat:](v10, "appendFormat:", v14, v23);
          if (!v24) {
            goto LABEL_29;
          }
        }

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v17 executionLine]);
        [v17 executionTime];
        id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ in %.1f seconds.\n",  v28,  v23,  v29));

        [v56 addObject:v30];
LABEL_29:
        [v17 executionTime];
        uint64_t v32 = v31;
        if (v17)
        {
          objc_msgSend(v17, "rusage_details");
          uint64_t v33 = v66;
        }

        else
        {
          uint64_t v33 = 0LL;
          __int128 v71 = 0u;
          __int128 v72 = 0u;
          __int128 v69 = 0u;
          __int128 v70 = 0u;
          __int128 v67 = 0u;
          __int128 v68 = 0u;
          __int128 v65 = 0u;
          __int128 v66 = 0u;
          __int128 v64 = 0u;
        }

        -[NSMutableString appendFormat:]( v10,  "appendFormat:",  @"%f,%f,%f\n",  v32,  *(void *)&a4,  (float)((float)((float)v33 * 0.00097656) * 0.00097656));
LABEL_33:
      }

      id v13 = [obj countByEnumeratingWithState:&v73 objects:v78 count:16];
    }

    while (v13);
  }

  double v34 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic summaryHandle](self, "summaryHandle"));
  sub_100023CA4(v34, 0LL, v10, @"writing summary file report");

  if ([v56 count])
  {
    id v35 = v55;
    if (!v55) {
      id v35 = @"unnamed";
    }
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    __int128 v55 = v35;
    id v37 = sub_100024B10(v36, v35);
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

    id v39 = v38;
    uint64_t v40 = sub_10004D5C8((const char *)[v39 fileSystemRepresentation], 1, 0x1A4u);
    if ((_DWORD)v40 == -1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100057744((uint64_t)v39);
      }
      __int128 v49 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      __int128 v50 = __error();
      [v49 stderrWrite:@"Unable to create %@: %s", v39, strerror(*v50)];

      uint64_t v41 = (NSFileHandle *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      __int128 v51 = __error();
      -[NSFileHandle log:](v41, "log:", @"Unable to create %@: %s", v39, strerror(*v51));
    }

    else
    {
      id v59 = v39;
      uint64_t v41 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:closeOnDealloc:",  v40,  1LL);
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      id v42 = v56;
      id v43 = [v42 countByEnumeratingWithState:&v60 objects:v77 count:16];
      if (v43)
      {
        id v44 = v43;
        uint64_t v45 = *(void *)v61;
LABEL_43:
        uint64_t v46 = 0LL;
        while (1)
        {
          if (*(void *)v61 != v45) {
            objc_enumerationMutation(v42);
          }
          __int128 v47 = *(void **)(*((void *)&v60 + 1) + 8 * v46);
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"writing %@'s error report",  v55));
          LODWORD(v47) = sub_100023CA4(v41, 0LL, v47, v48);

          if (!(_DWORD)v47) {
            break;
          }
          if (v44 == (id)++v46)
          {
            id v44 = [v42 countByEnumeratingWithState:&v60 objects:v77 count:16];
            if (v44) {
              goto LABEL_43;
            }
            break;
          }
        }
      }

      id v39 = v59;
    }
  }
}

- (void)streamArchiveFile:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid archive file",  buf,  2u);
    }

    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
    BOOL v7 = v11;
    id v12 = @"Invalid archive file";
    goto LABEL_21;
  }

  if (!-[SystemDiagnostic shouldStreamToTar](self, "shouldStreamToTar"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Should not stream to tar, something's wrong",  buf,  2u);
    }

    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
    BOOL v7 = v11;
    id v12 = @"Should not stream to tar, something's wrong";
    goto LABEL_21;
  }

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Archive not created before",  buf,  2u);
    }

    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
    BOOL v7 = v11;
    id v12 = @"Archive not created before";
LABEL_21:
    -[dispatch_queue_s log:](v11, "log:", v12);
    goto LABEL_22;
  }

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));
  BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 tarQueue]);

  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000577DC(v4);
    }
    uint64_t v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    unsigned int v16 = sub_10004A2B8;
    id v17 = &unk_100089138;
    id v18 = self;
    id v19 = v4;
    dispatch_async(v7, &v14);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive", v14, v15, v16, v17, v18));
    id v9 = [v8 archiveStatus];

    if (v9 == (id)-30LL)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive failed, will not remove outputDirectory",  buf,  2u);
      }

      double v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend(v10, "log:", @"SDArchive failed, will not remove outputDirectory");

      -[SystemDiagnostic setShouldRemoveTemporaryDirectory:](self, "setShouldRemoveTemporaryDirectory:", 0LL);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Can't add files to archive, dispatch queue not created\n",  buf,  2u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v13, "log:", @"Can't add files to archive, dispatch queue not created\n");
  }

- (BOOL)logCollectionContainer:(id)a3 shouldContinueAfterEncounteringError:(id)a4 path:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  NSErrorDomain v10 = (NSErrorDomain)objc_claimAutoreleasedReturnValue([v8 domain]);
  NSErrorDomain v11 = v10;
  if (v10 != NSCocoaErrorDomain)
  {

LABEL_3:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
      *(_DWORD *)buf = 138412802;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "LOGS: %@: error: %@, path: %@",  buf,  0x20u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    [v13 log:@"LOGS: %@: error: %@, path: %@", v14, v8, v9];
    goto LABEL_12;
  }

  if ([v8 code] == (id)4)
  {
  }

  else
  {
    id v15 = [v8 code];

    if (v15 != (id)260) {
      goto LABEL_3;
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    *(_DWORD *)buf = 138412546;
    id v20 = v16;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "LOGS: %@: file at path '%@' does not exist",  buf,  0x16u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  [v13 log:@"LOGS: %@: file at path '%@' does not exist", v14, v9, v18];
LABEL_12:

  return 1;
}

- (NSDate)startDiagnosticTime
{
  return self->_startDiagnosticTime;
}

- (void)setStartDiagnosticTime:(id)a3
{
  self->_startDiagnosticTime = (NSDate *)a3;
}

- (int64_t)startDiagnosticTimeClockNS
{
  return self->_startDiagnosticTimeClockNS;
}

- (void)setStartDiagnosticTimeClockNS:(int64_t)a3
{
  self->_startDiagnosticTimeClockNS = a3;
}

- (NSDate)oldestDateCreatedCutoff
{
  return self->_oldestDateCreatedCutoff;
}

- (void)setOldestDateCreatedCutoff:(id)a3
{
  self->_oldestDateCreatedCutoff = (NSDate *)a3;
}

- (__sFILE)summaryFD
{
  return self->_summaryFD;
}

- (void)setSummaryFD:(__sFILE *)a3
{
  self->_summaryFD = a3;
}

- (NSString)outputDirectory
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setOutputDirectory:(id)a3
{
}

- (NSString)tmpOutputDirectory
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setTmpOutputDirectory:(id)a3
{
}

- (NSString)baseDirectory
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setBaseDirectory:(id)a3
{
}

- (NSString)diagnosticID
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setDiagnosticID:(id)a3
{
}

- (NSString)archiveName
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setArchiveName:(id)a3
{
}

- (NSArray)onlyRunContainersWithNames
{
  return (NSArray *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setOnlyRunContainersWithNames:(id)a3
{
}

- (NSString)tarballPath
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setTarballPath:(id)a3
{
}

- (NSString)completedOutputDirectory
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setCompletedOutputDirectory:(id)a3
{
}

- (NSString)completedTarballPath
{
  return (NSString *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setCompletedTarballPath:(id)a3
{
}

- (NSString)rootPath
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setRootPath:(id)a3
{
}

- (NSFileHandle)summaryHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setSummaryHandle:(id)a3
{
}

- (NSString)frontmostBundleID
{
  return (NSString *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setFrontmostBundleID:(id)a3
{
}

- (NSString)changedDiagnosticProperties
{
  return (NSString *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setChangedDiagnosticProperties:(id)a3
{
}

- (OS_dispatch_group)completionDispatchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setCompletionDispatchGroup:(id)a3
{
}

- (NSArray)targetPIDs
{
  return (NSArray *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setTargetPIDs:(id)a3
{
}

- (NSMutableArray)pidIndices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setPidIndices:(id)a3
{
}

- (NSString)warnProcessAllowlist
{
  return (NSString *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setWarnProcessAllowlist:(id)a3
{
}

- (NSString)providedPIDorProcess
{
  return (NSString *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setProvidedPIDorProcess:(id)a3
{
}

- (NSString)remoteSysdiagnoseID
{
  return (NSString *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setRemoteSysdiagnoseID:(id)a3
{
}

- (unsigned)requestSource
{
  return self->_requestSource;
}

- (void)setRequestSource:(unsigned __int16)a3
{
  self->_requestSource = a3;
}

- (NSDictionary)capOverride
{
  return (NSDictionary *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setCapOverride:(id)a3
{
}

- (NSNumber)totalTime
{
  return (NSNumber *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setTotalTime:(id)a3
{
}

- (NSMutableDictionary)metricsDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 248LL, 1);
}

- (NSDictionary)overrideContainers
{
  return (NSDictionary *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setOverrideContainers:(id)a3
{
}

- (SDArchive)archive
{
  return (SDArchive *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setArchive:(id)a3
{
}

- (BOOL)didComplete
{
  return self->_didComplete;
}

- (void)setDidComplete:(BOOL)a3
{
  self->_didComplete = a3;
}

- (BOOL)shouldStreamToTar
{
  return self->_shouldStreamToTar;
}

- (void)setShouldStreamToTar:(BOOL)a3
{
  self->_shouldStreamToTar = a3;
}

- (BOOL)disableStreamTar
{
  return self->_disableStreamTar;
}

- (void)setDisableStreamTar:(BOOL)a3
{
  self->_disableStreamTar = a3;
}

- (BOOL)shouldPostProcess
{
  return self->_shouldPostProcess;
}

- (void)setShouldPostProcess:(BOOL)a3
{
  self->_shouldPostProcess = a3;
}

- (BOOL)isTestingMode
{
  return self->_isTestingMode;
}

- (void)setIsTestingMode:(BOOL)a3
{
  self->_isTestingMode = a3;
}

- (BOOL)disableUIFeedback
{
  return self->_disableUIFeedback;
}

- (void)setDisableUIFeedback:(BOOL)a3
{
  self->_disableUIFeedback = a3;
}

- (BOOL)deShowFeedback
{
  return self->_deShowFeedback;
}

- (void)setDeShowFeedback:(BOOL)a3
{
  self->_deShowFeedback = a3;
}

- (proc_bsdinfo)processes
{
  return self->_processes;
}

- (void)setProcesses:(proc_bsdinfo *)a3
{
  self->_processes = a3;
}

- (int)processCount
{
  return self->_processCount;
}

- (void)setProcessCount:(int)a3
{
  self->_processCount = a3;
}

- (OS_xpc_object)coSysdiagnoseParameters
{
  return self->_coSysdiagnoseParameters;
}

- (void)setCoSysdiagnoseParameters:(id)a3
{
}

- (BOOL)quickMode
{
  return self->_quickMode;
}

- (void)setQuickMode:(BOOL)a3
{
  self->_quickMode = a3;
}

- (BOOL)useParallelCompression
{
  return self->_useParallelCompression;
}

- (void)setUseParallelCompression:(BOOL)a3
{
  self->_useParallelCompression = a3;
}

- (BOOL)shouldRunTimeSensitiveTasks
{
  return self->_shouldRunTimeSensitiveTasks;
}

- (void)setShouldRunTimeSensitiveTasks:(BOOL)a3
{
  self->_shouldRunTimeSensitiveTasks = a3;
}

- (BOOL)shouldRunLogGenerationTasks
{
  return self->_shouldRunLogGenerationTasks;
}

- (void)setShouldRunLogGenerationTasks:(BOOL)a3
{
  self->_shouldRunLogGenerationTasks = a3;
}

- (BOOL)shouldRunLogCopyTasks
{
  return self->_shouldRunLogCopyTasks;
}

- (void)setShouldRunLogCopyTasks:(BOOL)a3
{
  self->_shouldRunLogCopyTasks = a3;
}

- (BOOL)shouldRunOSLogArchive
{
  return self->_shouldRunOSLogArchive;
}

- (void)setShouldRunOSLogArchive:(BOOL)a3
{
  self->_shouldRunOSLogArchive = a3;
}

- (BOOL)shouldGetFeedbackData
{
  return self->_shouldGetFeedbackData;
}

- (void)setShouldGetFeedbackData:(BOOL)a3
{
  self->_shouldGetFeedbackData = a3;
}

- (BOOL)shouldRunIDSDump
{
  return self->_shouldRunIDSDump;
}

- (void)setShouldRunIDSDump:(BOOL)a3
{
  self->_shouldRunIDSDump = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (BOOL)earlyPrompt
{
  return self->_earlyPrompt;
}

- (void)setEarlyPrompt:(BOOL)a3
{
  self->_earlyPrompt = a3;
}

- (BOOL)shouldCreateTarBall
{
  return self->_shouldCreateTarBall;
}

- (void)setShouldCreateTarBall:(BOOL)a3
{
  self->_shouldCreateTarBall = a3;
}

- (BOOL)shouldDisplayTarBall
{
  return self->_shouldDisplayTarBall;
}

- (void)setShouldDisplayTarBall:(BOOL)a3
{
  self->_shouldDisplayTarBall = a3;
}

- (BOOL)canDisplayTarBall
{
  return self->_canDisplayTarBall;
}

- (void)setCanDisplayTarBall:(BOOL)a3
{
  self->_canDisplayTarBall = a3;
}

- (BOOL)shouldRemoveTemporaryDirectory
{
  return self->_shouldRemoveTemporaryDirectory;
}

- (void)setShouldRemoveTemporaryDirectory:(BOOL)a3
{
  self->_shouldRemoveTemporaryDirectory = a3;
}

- (BOOL)generatePlist
{
  return self->_generatePlist;
}

- (void)setGeneratePlist:(BOOL)a3
{
  self->_generatePlist = a3;
}

- (int64_t)coSysdiagnose
{
  return self->_coSysdiagnose;
}

- (void)setCoSysdiagnose:(int64_t)a3
{
  self->_coSysdiagnose = a3;
}

- (BOOL)coSysdiagnoseOnly
{
  return self->_coSysdiagnoseOnly;
}

- (void)setCoSysdiagnoseOnly:(BOOL)a3
{
  self->_coSysdiagnoseOnly = a3;
}

- (int)dpClass
{
  return self->_dpClass;
}

- (void)setDpClass:(int)a3
{
  self->_dpClass = a3;
}

- (NSString)brctl_dir
{
  return (NSString *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setBrctl_dir:(id)a3
{
}

- (NSMutableDictionary)executedContainers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 304LL, 1);
}

- (void)setExecutedContainers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end