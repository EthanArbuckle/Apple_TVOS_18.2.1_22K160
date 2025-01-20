@interface SASampleStore
+ (BOOL)canOpenFileAsKTraceFile:(const char *)a3 errorOut:(id *)a4;
+ (BOOL)supportsSecureCoding;
+ (id)sampleStoreForBinaryFormat:(id)a3;
+ (id)sampleStoreForSpindumpFile:(const char *)a3;
- (BOOL)appleInternalIsKnown;
- (BOOL)cacheLoadInfoForProcess:(int)a3;
- (BOOL)findCpuSignalHandlerStackLeafKernelFrame;
- (BOOL)hardwareKeyboard;
- (BOOL)hasEnterprisePersona;
- (BOOL)hasHardwareKeyboardInfo;
- (BOOL)hasInternalCarryDeviceDistinction;
- (BOOL)haveCPUClusterInfo;
- (BOOL)haveKPerfSched;
- (BOOL)isAppleInternal;
- (BOOL)isECoreForCPUNum:(unsigned int)a3;
- (BOOL)isEmpty;
- (BOOL)isInternalCarryDevice;
- (BOOL)isPCoreForCPUNum:(unsigned int)a3;
- (BOOL)isRootInstalled;
- (BOOL)kPerfPETParsePastLastStackshot;
- (BOOL)keepMicrostackshotsWithoutLoadInfo;
- (BOOL)keepStateBetweenSampleIndexes;
- (BOOL)omitSensitiveStrings;
- (BOOL)parseKTraceFile:(const char *)a3 warningsOut:(id)a4 errorOut:(id *)a5;
- (BOOL)parseStackshotsFromKTraceFile:(const char *)a3 warningsOut:(id)a4 errorOut:(id *)a5;
- (BOOL)sampleOnlyMainThreads;
- (BOOL)sanitizePaths;
- (BOOL)saveBinaryFormatToStream:(__sFILE *)a3;
- (BOOL)setTargetProcessWithHint:(id)a3;
- (BOOL)shouldGatherKextStat;
- (BOOL)stackshotsOnlyIncludeSpecificProcesses;
- (NSArray)exclaves;
- (NSArray)hidEvents;
- (NSArray)installedRootNames;
- (NSArray)ioEvents;
- (NSArray)kernelCaches;
- (NSArray)keyboardLanguages;
- (NSArray)kperfTriggers;
- (NSArray)memoryPressureEvents;
- (NSArray)models;
- (NSArray)powerModeTransitions;
- (NSArray)preferredLanguages;
- (NSArray)sampleTimestamps;
- (NSArray)sharedCaches;
- (NSDictionary)activeTrials;
- (NSDictionary)homeVolumeSpace;
- (NSDictionary)nonDefaultFeatureFlags;
- (NSDictionary)systemAdvisoryLevels;
- (NSDictionary)tasksByPid;
- (NSDictionary)tasksByUniquePid;
- (NSError)wrError;
- (NSString)actionTaken;
- (NSString)automatedDeviceGroup;
- (NSString)bootArgs;
- (NSString)countryCode;
- (NSString)customOutput;
- (NSString)durationNote;
- (NSString)event;
- (NSString)eventNote;
- (NSString)hardwareModel;
- (NSString)kernelVersion;
- (NSString)kextStat;
- (NSString)machineArchitecture;
- (NSString)osBuildVersion;
- (NSString)osProductName;
- (NSString)osProductVersion;
- (NSString)osProductVersionExtra;
- (NSString)reason;
- (NSString)signature;
- (NSString)stepsNote;
- (NSString)targetProcessAbsolutePath;
- (NSString)targetProcessBundleBuildVersion;
- (NSString)targetProcessBundleId;
- (NSString)targetProcessBundleName;
- (NSString)targetProcessBundleProductBuildVersion;
- (NSString)targetProcessBundleProjectName;
- (NSString)targetProcessBundleShortVersion;
- (NSString)targetProcessBundleSourceVersion;
- (NSString)targetProcessBundleVersion;
- (NSString)targetProcessCommerceAppID;
- (NSString)targetProcessCommerceExternalID;
- (NSString)targetProcessName;
- (NSString)targetProcessVendorID;
- (NSString)wrDiagnosticName;
- (NSString)wrSignpostCategory;
- (NSString)wrSignpostName;
- (NSString)wrSignpostSubsystem;
- (NSString)wrTriggeringSignpostCategory;
- (NSString)wrTriggeringSignpostName;
- (NSString)wrTriggeringSignpostSubsystem;
- (NSString)wrWorkflowName;
- (SAFrame)cpuSignalHandlerStackLeafKernelFrame;
- (SAMountStatusTracker)mountStatusTracker;
- (SASampleStore)init;
- (SASampleStore)initWithCoder:(id)a3;
- (SATask)targetProcess;
- (SATimeRange)eventTimeRange;
- (SATimestamp)endTime;
- (SATimestamp)startTime;
- (SATimestamp)timeWhenTransitionedToSamplingAllProcesses;
- (SATimestamp)timeWhenTransitionedToSamplingAllThreads;
- (SATimestamp)timestampOfLastStackshot;
- (double)_getLastWakeTime;
- (double)attemptedSamplingInterval;
- (double)cpuDuration;
- (double)cpuLimit;
- (double)cpuLimitDuration;
- (double)cpuUsed;
- (double)extraDuration;
- (double)kPerfPETSampleIntervalLimit;
- (double)lastWakeTime;
- (double)reportTimeThreshold;
- (double)wakeupsDuration;
- (double)wakeupsLimitDuration;
- (double)wrSignpostDurationSingle;
- (double)wrSignpostDurationSingleThreshold;
- (double)wrSignpostDurationSum;
- (double)wrSignpostDurationSumThreshold;
- (double)wrSignpostDurationUnion;
- (double)wrSignpostDurationUnionThreshold;
- (double)wrWorkflowDuration;
- (double)wrWorkflowDurationOmittingNetworkBoundIntervals;
- (double)wrWorkflowDurationOmittingNetworkBoundIntervalsThreshold;
- (double)wrWorkflowDurationThreshold;
- (double)wrWorkflowTimeoutDuration;
- (double)writeDuration;
- (double)writeLimitDuration;
- (id)_firstTaskOnOrAfterTimestamp:(void *)a1 inTasks:(void *)a2;
- (id)_lastTaskOnOrBeforeTimestamp:(void *)a3 inTasks:;
- (id)_taskForPid:(uint64_t)a3 uniquePid:(char *)a4 name:(uint64_t)a5 pidStartTime:(os_log_s *)a6 loadInfos:(unsigned int)a7 numLoadInfos:(char)a8 loadInfosIsPartial:(os_log_s *)a9 textExecLoadInfos:(unsigned int)a10 numTextExecLoadInfos:(char)a11 textExecLoadInfosIsPartial:(uint64_t)a12 architecture:(void *)a13 timestamp:(void *)a14 sharedCache:(char)a15 needAOTInfo:;
- (id)addPowerModeTransition:(id *)a1;
- (id)addressTranslationsForPid:(uint64_t)a1;
- (id)applySharedCacheToTask:(uint64_t)a3 uuid:(uint64_t)a4 slide:(uint64_t)a5 slidBaseAddress:;
- (id)binaryFormat;
- (id)callTreeForDispatchQueue:(id)a3 andThread:(id)a4 inTask:(id)a5 options:(id)a6;
- (id)callTreeForDispatchQueue:(id)a3 swiftTask:(id)a4 thread:(id)a5 inTask:(id)a6 options:(id)a7;
- (id)callTreeForExecutable:(id)a3 options:(id)a4;
- (id)callTreeForSwiftTask:(id)a3 thread:(id)a4 inTask:(id)a5 options:(id)a6;
- (id)callTreeForTask:(id)a3 options:(id)a4;
- (id)callTreeForThread:(id)a3 inTask:(id)a4 options:(id)a5;
- (id)callTreesForThreadsInTask:(id)a3 options:(id)a4;
- (id)fanSpeedClosestToTimestamp:(id)a3;
- (id)fixupAllFrames;
- (id)idleThreadSet;
- (id)initForFileParsing;
- (id)initForLiveSampling;
- (id)lastTaskWithPid:(uint64_t)a3 orTid:;
- (id)loadInfosForKTSymbolOwners:(int)a3 isKernelSpace:(uint64_t)a4 excludeRange:(unint64_t)a5;
- (id)sharedCacheWithUUID:(uint64_t)a3 slide:(uint64_t)a4 slidBaseAddress:;
- (id)taskForKCDataDeltaTask:(os_log_s *)a3 loadInfos:(unsigned int)a4 numLoadInfos:(char)a5 loadInfosIsPartial:(os_log_s *)a6 textExecLoadInfos:(unsigned int)a7 numTextExecLoadInfos:(char)a8 textExecLoadInfosIsPartial:(void *)a9 timestamp:(void *)a10 sharedCache:(char)a11 needAOTInfo:;
- (id)taskForKCDataTask:(os_log_s *)a3 loadInfos:(unsigned int)a4 numLoadInfos:(char)a5 loadInfosIsPartial:(os_log_s *)a6 textExecLoadInfos:(unsigned int)a7 numTextExecLoadInfos:(char)a8 textExecLoadInfosIsPartial:(uint64_t)a9 architecture:(void *)a10 timestamp:(void *)a11 sharedCache:(char)a12 needAOTInfo:;
- (id)taskForKCDataTransitioningTask:(void *)a1 loadInfos:(uint64_t)a2 numLoadInfos:(os_log_s *)a3 loadInfosIsPartial:(unsigned int)a4 textExecLoadInfos:(char)a5 numTextExecLoadInfos:(os_log_s *)a6 textExecLoadInfosIsPartial:(unsigned int)a7 architecture:(char)a8 timestamp:(void *)a9 sharedCache:(void *)a10 needAOTInfo:(char)a11;
- (id)taskForMicrostackshotTask:(char *)a3 taskName:(os_log_s *)a4 loadInfos:(unsigned int)a5 numLoadInfos:(void *)a6 sharedCache:(int)a7 loadInfosIsPartial:(void *)a8 timestamp:(uint64_t)a9 architecture:(char)a10 needAOTInfo:(char)a11 isFromCurrentBoot:;
- (id)taskForPid:(void *)a3 andName:(void *)a4 didExecAtTimestamp:;
- (id)taskWithPid:(uint64_t)a3 orTid:(void *)a4 atTimestamp:;
- (id)taskWithPid:(void *)a3 atTimestamp:;
- (id)tidToPidDict;
- (id)tidsForPid:(int)a3;
- (int)addMicrostackshotsFromFile:(id)a3 ofTypes:(unsigned int)a4 inTimeRangeStart:(double)a5 end:(double)a6 onlyPid:(int)a7 onlyTid:(unint64_t)a8;
- (int)addMicrostackshotsFromFile:(id)a3 ofTypes:(unsigned int)a4 inTimeRangeStart:(double)a5 end:(double)a6 onlyPid:(int)a7 onlyTid:(unint64_t)a8 statistics:(id)a9;
- (int)gatherHWPageSize;
- (int)gatherVMPageSize;
- (int)targetProcessId;
- (int64_t)addMicrostackshotsFromData:(id)a3 ofTypes:(unsigned int)a4 inTimeRangeStart:(double)a5 end:(double)a6 onlyPid:(int)a7 onlyTid:(unint64_t)a8;
- (int64_t)addMicrostackshotsFromData:(id)a3 ofTypes:(unsigned int)a4 inTimeRangeStart:(double)a5 end:(double)a6 onlyPid:(int)a7 onlyTid:(unint64_t)a8 statistics:(id)a9;
- (int64_t)numOSCryptexFileExtents;
- (mach_timebase_info)machTimebase;
- (uint64_t)_addKCDataStackshot:(void *)a3 timestamp:(unint64_t)a4 sampleIndex:(_BYTE *)a5 shouldSkipSampleOut:(unsigned int)a6 primaryDataIsKPerf:(char)a7 addStaticInfoOnly:;
- (uint64_t)_parseKCDataSharedCacheContainer:(void *)a3 sharedCaches:;
- (uint64_t)_parseKCDataTaskContainer:(void *)a3 timestampOfSample:(unint64_t)a4 sampleIndex:(void *)a5 sharedCaches:(void *)a6 frameIterator:(uint64_t)a7 primaryDataIsKPerf:(char)a8 addStaticInfoOnly:(void *)a9 taskUniquePidsInThisSample:(void *)a10 taskPidsInThisSample:(void *)a11 importanceDonations:(void *)a12 rPidForJetsamCoalitionId:(os_log_s *)a13 port_label_info_array:(os_log_s *)a14 exclaveInfo:(void *)a15;
- (uint64_t)_parseKCDataThreadContainer:(void *)a3 timestampOfSample:(unint64_t)a4 sampleIndex:(void *)a5 task:(void *)a6 kernelTask:(void *)a7 frameIterator:(os_log_s *)a8 mainThreadID:(char)a9 primaryDataIsKPerf:(char)a10 addStaticInfoOnly:(os_log_s *)a11 threadIDsInThisTaskThisSample:(void *)a12 dispatchQueueIDsInThisTaskThisSample:(char)a13 taskIsSuspended:(uint64_t)a14 waitInfos:(unsigned int)a15 numWaitInfos:(uint64_t)a16 turnstileInfos:(unsigned int)a17 numTurnstileInfos:(int)a18 port_label_info_array:(unsigned int)a19 exclaveInfo:(void *)a20;
- (uint64_t)_parseKTraceFile:(int)a3 stackshotsOnly:(void *)a4 warningsOut:(void *)a5 errorOut:;
- (uint64_t)addKCDataThreadV4:(uint64_t)a3 threadV2:(uint64_t)a4 deltaThreadV3:(uint64_t)a5 deltaThreadV2:(void *)a6 timestamp:(unint64_t)a7 sampleIndex:(void *)a8 stack:(void *)a9 threadExclavesInfo:(char *)a10 threadName:(id *)a11 dispatchQueueLabel:(uint64_t)a12 waitInfo:(void *)a13 waitInfoPortLabelInfo:(uint64_t)a14 turnstileInfo:(void *)a15 turnstileInfoPortLabelInfo:(uint64_t *)a16 instructionCycles:(void *)a17 task:(void *)a18 kernelTask:(char)a19 taskIsSuspended:;
- (uint64_t)checkDyldInfoCompletion:(uint64_t)a1;
- (uint64_t)parseKCDataExclavesContainer:(void *)a3 exclaveInfo:(uint64_t)a4 primaryDataIsKPerf:;
- (unint64_t)_addMicrostackshotFromData:(int)a3 ofTypes:(int)a4 inTimeRangeStart:(uint64_t)a5 end:(void *)a6 onlyPid:(double)a7 onlyTid:(double)a8 statistics:;
- (unint64_t)addKCDataStackshot:(id)a3;
- (unint64_t)addKCDataStackshot:(id)a3 returningTimestamp:(id *)a4;
- (unint64_t)addKCDataStackshots:(id)a3 createSeparateSamplePerStackshot:(BOOL)a4;
- (unint64_t)bytesWritten;
- (unint64_t)bytesWrittenLimit;
- (unint64_t)dataGatheringOptions;
- (unint64_t)dataSource;
- (unint64_t)dataStyle;
- (unint64_t)gpuRestartCount;
- (unint64_t)gpuRestartLastMachAbs;
- (unint64_t)indexOfFirstSampleOnOrAfterTimestamp:(id)a3;
- (unint64_t)indexOfLastSampleOnOrBeforeTimestamp:(id)a3;
- (unint64_t)numSamples;
- (unint64_t)numWakeups;
- (unint64_t)numWakeupsLimit;
- (unint64_t)targetDispatchQueueId;
- (unint64_t)targetHIDEventEndMachAbs;
- (unint64_t)targetHIDEventMachAbs;
- (unint64_t)targetThreadId;
- (unint64_t)wrSignpostCount;
- (unint64_t)wrSignpostCountThreshold;
- (unsigned)additionalCSSymbolicatorFlags;
- (unsigned)hwPageSize;
- (unsigned)numActiveCPUs;
- (unsigned)vmPageSize;
- (unsigned)workQueueHardThreadLimit;
- (unsigned)workQueueSoftThreadLimit;
- (void)_addKPerfDataFromKTraceSession:(uint64_t)a3 beforeMachAbsTime:(int)a4 petTimerID:;
- (void)_backfillPidStartTimestamp:(void *)a1 toPreviousTasksEnumerator:(void *)a2 execTimestampOfNextTask:(void *)a3;
- (void)_populateFromKtraceMachineInfo:(int)a3 is64bit:;
- (void)addAddressTranslations:(uint64_t)a1;
- (void)addAuxiliaryData:(id)a3;
- (void)addIOEvent:(uint64_t)a1;
- (void)addNewImageInfos:(unsigned int)a3 numLoadInfos:(const char *)a4 name:(void *)a5 sharedCache:(uint64_t)a6 architecture:(void *)a7 toTask:;
- (void)addProcessInfoFromTailspin:(id)a3;
- (void)addSharedCache:(uint64_t)a1;
- (void)addTask:(uint64_t)a1;
- (void)addUserCallstack:(unint64_t *)a3 numUserFrames:(unsigned int)a4 swiftAsyncCallstack:(unint64_t *)a5 numSwiftAsyncFrames:(unsigned int)a6 swiftAsyncStartIndex:(unsigned int)a7 kernelCallstack:(unint64_t *)a8 numKernelFrames:(unsigned int)a9 loadInfos:(const dyld_uuid_info_64 *)a10 numLoadInfos:(unsigned int)a11 textExecLoadInfos:(const dyld_uuid_info_64 *)a12 numTextExecLoadInfos:(unsigned int)a13 uniquePid:(unint64_t)a14 pid:(int)a15 processName:(id)a16 tid:(unint64_t)a17 timestamp:(id)a18 sharedCache:(id)a19;
- (void)addUserCallstack:(unint64_t *)a3 numUserFrames:(unsigned int)a4 swiftAsyncCallstack:(unint64_t *)a5 numSwiftAsyncFrames:(unsigned int)a6 swiftAsyncStartIndex:(unsigned int)a7 kernelCallstack:(unint64_t *)a8 numKernelFrames:(unsigned int)a9 uniquePid:(unint64_t)a10 pid:(int)a11 tid:(unint64_t)a12 timestamp:(id)a13;
- (void)backfillTask:(unint64_t)a3 lastSampleIndex:(void *)a4 timestamp:(char)a5 haveSnap:(uint64_t)a6 terminatedThreadsUserTimeInNs:(uint64_t)a7 terminatedThreadsSystemTimeInNs:(uint64_t)a8 terminatedThreadsCycles:(uint64_t)a9 terminatedThreadsInstructions:(int)a10 suspendCount:(int)a11 pageins:(char)a12 isDarwinBG:(char)a13 isForeground:(char)a14 isBoosted:(char)a15 isDirty:(char)a16 haveWQFlags:(char)a17 wqExceededTotalThreadLimit:(char)a18 wqExceededConstrainedThreadLimit:(char)a19 haveMem:(uint64_t)a20 taskSizeInBytes:(char)a21 haveLatencyQos:(int)a22 latencyQos:;
- (void)backfillThread:(void *)a3 inTask:(unint64_t)a4 lastSampleIndex:(void *)a5 timestamp:(char)a6 haveName:(_BYTE *)a7 name:(int)a8 haveDispatchQueueId:(uint64_t)a9 dispatchQueueId:(void *)a10 dispatchQueueLabel:(void *)a11 leafKernelFrame:(unsigned __int8)a12 hasExclaveInKernelStack:(char)a13 haveUserStack:(void *)a14 leafUserFrame:(uint64_t)a15 swiftTaskId:(void *)a16 leafOfCRootFramesReplacedBySwiftAsync:(void *)a17 threadExclavesInfo:(char)a18 haveSched:(uint64_t)a19 systemCpuTimeNs:(uint64_t)a20 userCpuTimeNs:(int)a21 basePriority:(int)a22 scheduledPriority:(int)a23 state:(char)a24 threadQos:(char)a25 threadRequestedQos:(char)a26 threadRequestedQosOverride:(char)a27 threadQosPromote:(char)a28 haveCycIns:(uint64_t)a29 instructions:(uint64_t)a30 cycles:(char)a31 haveSnap:(char)a32 ioTier:(char)a33 isIOPassive:(char)a34 isDarwinBG:(char)a35 isSuspended:(char)a36 isGlobalForcedIdle:(char)a37 isIdleWorkQueue:(void *)a38 lastMadeRunnableTime:(char)a39 isOnCore:(unsigned __int8)a40 isOnCoreForLastSampleIndex:(unsigned int)a41 cpuNum:;
- (void)clusterFlagsForCPUNum:(void *)result;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateTasks:(id)a3;
- (void)enumerateTasksWithLiveness:(uint64_t)a1;
- (void)exclaveWithIdentifier:(uint64_t)a1;
- (void)existingTaskForEvent:(uint64_t)a3 inSession:(_DWORD *)a4 returningPid:;
- (void)findTargetProcessInTimeRange:(uint64_t)a1;
- (void)firstTaskWithPid:(void *)a1;
- (void)firstTaskWithPid:(void *)a3 onOrAfterTimestamp:;
- (void)firstTaskWithUniquePid:(void *)a3 onOrAfterTimestamp:;
- (void)forwardFillFromLastStackshot:(void *)a1;
- (void)gatherBootArgs;
- (void)gatherMachineArchitecture;
- (void)iterateAllTimestamps:(uint64_t)a1;
- (void)kperfRecord:(void *)a3 state:(void *)a4 frameIterator:;
- (void)lastTaskWithPid:(void *)a1;
- (void)lastTaskWithPid:(void *)a3 onOrBeforeTimestamp:;
- (void)lastTaskWithUniquePid:(void *)a1;
- (void)lastTaskWithUniquePid:(void *)a3 onOrBeforeTimestamp:;
- (void)postprocess;
- (void)removeAllData;
- (void)resampleTruncatedBacktraces;
- (void)setActionTaken:(id)a3;
- (void)setAdditionalCSSymbolicatorFlags:(unsigned int)a3;
- (void)setAttemptedSamplingInterval:(double)a3;
- (void)setBootArgs:(id)a3;
- (void)setBytesWritten:(unint64_t)a3;
- (void)setBytesWrittenLimit:(unint64_t)a3;
- (void)setCpuDuration:(double)a3;
- (void)setCpuLimit:(double)a3;
- (void)setCpuLimitDuration:(double)a3;
- (void)setCpuUsed:(double)a3;
- (void)setCustomOutput:(id)a3;
- (void)setDataGatheringOptions:(unint64_t)a3;
- (void)setDurationNote:(id)a3;
- (void)setEndTime:(uint64_t)a1;
- (void)setEvent:(id)a3;
- (void)setEventNote:(id)a3;
- (void)setEventTimeRange:(id)a3;
- (void)setExtraDuration:(double)a3;
- (void)setHardwareModel:(id)a3;
- (void)setHaveKPerfSched:(BOOL)a3;
- (void)setHwPageSize:(unsigned int)a3;
- (void)setKPerfPETParsePastLastStackshot:(BOOL)a3;
- (void)setKPerfPETSampleIntervalLimit:(double)a3;
- (void)setKeepMicrostackshotsWithoutLoadInfo:(BOOL)a3;
- (void)setKeepStateBetweenSampleIndexes:(BOOL)a3;
- (void)setKperfTriggers:(id)a3;
- (void)setMachTimebase:(mach_timebase_info)a3;
- (void)setMachineArchitecture:(id)a3;
- (void)setNumActiveCPUs:(unsigned int)a3;
- (void)setNumWakeups:(unint64_t)a3;
- (void)setNumWakeupsLimit:(unint64_t)a3;
- (void)setOmitSensitiveStrings:(BOOL)a3;
- (void)setOsBuildVersion:(id)a3;
- (void)setOsProductName:(id)a3;
- (void)setOsProductVersion:(id)a3;
- (void)setOsProductVersionExtra:(id)a3;
- (void)setReason:(id)a3;
- (void)setReportTimeThreshold:(double)a3;
- (void)setSampleOnlyMainThreads:(BOOL)a3;
- (void)setSanitizePaths:(BOOL)a3;
- (void)setShouldGatherKextStat:(BOOL)a3;
- (void)setSignature:(id)a3;
- (void)setStackshotsOnlyIncludeSpecificProcesses:(BOOL)a3;
- (void)setStartTime:(uint64_t)a1;
- (void)setStepsNote:(id)a3;
- (void)setTargetDispatchQueueId:(unint64_t)a3;
- (void)setTargetHIDEventEndMachAbs:(unint64_t)a3;
- (void)setTargetHIDEventMachAbs:(unint64_t)a3;
- (void)setTargetProcess:(id)a3;
- (void)setTargetProcessId:(int)a3;
- (void)setTargetThreadId:(unint64_t)a3;
- (void)setVmPageSize:(unsigned int)a3;
- (void)setWakeupsDuration:(double)a3;
- (void)setWakeupsLimitDuration:(double)a3;
- (void)setWrDiagnosticName:(id)a3;
- (void)setWrError:(id)a3;
- (void)setWrSignpostCategory:(id)a3;
- (void)setWrSignpostCount:(unint64_t)a3;
- (void)setWrSignpostCountThreshold:(unint64_t)a3;
- (void)setWrSignpostDurationSingle:(double)a3;
- (void)setWrSignpostDurationSingleThreshold:(double)a3;
- (void)setWrSignpostDurationSum:(double)a3;
- (void)setWrSignpostDurationSumThreshold:(double)a3;
- (void)setWrSignpostDurationUnion:(double)a3;
- (void)setWrSignpostDurationUnionThreshold:(double)a3;
- (void)setWrSignpostName:(id)a3;
- (void)setWrSignpostSubsystem:(id)a3;
- (void)setWrTriggeringSignpostCategory:(id)a3;
- (void)setWrTriggeringSignpostName:(id)a3;
- (void)setWrTriggeringSignpostSubsystem:(id)a3;
- (void)setWrWorkflowDuration:(double)a3;
- (void)setWrWorkflowDurationOmittingNetworkBoundIntervals:(double)a3;
- (void)setWrWorkflowDurationOmittingNetworkBoundIntervalsThreshold:(double)a3;
- (void)setWrWorkflowDurationThreshold:(double)a3;
- (void)setWrWorkflowName:(id)a3;
- (void)setWrWorkflowTimeoutDuration:(double)a3;
- (void)setWriteDuration:(double)a3;
- (void)setWriteLimitDuration:(double)a3;
- (void)startingSamplingLiveSystem;
- (void)symbolicate;
- (void)task:(void *)a3 exitedAtTimestamp:;
- (void)taskWithUniquePid:(void *)a3 atTimestamp:;
- (void)useDsymForUUIDFor:(id)a3;
@end

@implementation SASampleStore

- (unint64_t)targetHIDEventMachAbs
{
  return self->_targetHIDEventMachAbs;
}

- (void)setTargetHIDEventMachAbs:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  self->_targetHIDEventMachAbs = a3;
  if (a3 && !self->_eventTimeRange)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    obj = self->_hidEvents;
    uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          [v8 hidEventTimestamp];
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v9 machAbsTime] == self->_targetHIDEventMachAbs)
          {
            if (self->_targetProcessId < 0)
            {

LABEL_17:
              [v8 hidEventTimestamp];
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 steps];
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              [v15 lastObject];
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              [v16 timestamp];
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              +[SATimeRange timeRangeStart:end:](&OBJC_CLASS___SATimeRange, "timeRangeStart:end:", v14, v17);
              v18 = (SATimeRange *)objc_claimAutoreleasedReturnValue();
              eventTimeRange = self->_eventTimeRange;
              self->_eventTimeRange = v18;

              goto LABEL_18;
            }

            [v8 steps];
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 lastObject];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = [v11 pid];
            int targetProcessId = self->_targetProcessId;

            if (v12 == targetProcessId) {
              goto LABEL_17;
            }
          }

          else
          {
          }
        }

        uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
        if (v5) {
          continue;
        }
        break;
      }
    }

- (BOOL)haveKPerfSched
{
  return self->_haveKPerfSched;
}

- (void)setHaveKPerfSched:(BOOL)a3
{
  self->_haveKPerfSched = a3;
}

- (NSArray)kperfTriggers
{
  return self->_kperfTriggers;
}

- (void)setKperfTriggers:(id)a3
{
  uint64_t v4 = (NSArray *)[a3 copy];
  kperfTriggers = self->_kperfTriggers;
  self->_kperfTriggers = v4;
}

- (double)kPerfPETSampleIntervalLimit
{
  return self->_sampleIntervalLimit;
}

- (void)setKPerfPETSampleIntervalLimit:(double)a3
{
  self->_sampleIntervalLimit = a3;
}

- (BOOL)kPerfPETParsePastLastStackshot
{
  return self->_kPerfPETParsePastLastStackshot;
}

- (void)setKPerfPETParsePastLastStackshot:(BOOL)a3
{
  self->_kPerfPETParsePastLastStackshot = a3;
}

- (void)addSharedCache:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v5 = v3;
    char v4 = [*(id *)(a1 + 112) containsObject:v3];
    id v3 = v5;
    if ((v4 & 1) == 0)
    {
      [*(id *)(a1 + 112) addObject:v5];
      id v3 = v5;
    }
  }
}

- (void)addTask:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    id v26 = v3;
    uint64_t v4 = [v3 uniquePid];
    id v5 = *(void **)(a1 + 8);
    if (v4 == -1)
    {
      if ([*(id *)(a1 + 8) count])
      {
        int v15 = *__error();
        _sa_logt();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = [v26 debugDescription];
          *(_DWORD *)buf = 136315138;
          uint64_t v28 = [v17 UTF8String];
          _os_log_error_impl(&dword_186C92000, v16, OS_LOG_TYPE_ERROR, "%s has no uniquePid", buf, 0xCu);
        }

        *__error() = v15;
        id v18 = [v26 debugDescription];
        char v19 = [v18 UTF8String];
        _SASetCrashLogMessage(488, "%s has no uniquePid", v20, v21, v22, v23, v24, v25, v19);

        _os_crash();
        __break(1u);
      }
    }

    else
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v26, "uniquePid"));
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 objectForKeyedSubscript:v6];
      id v7 = (id)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
        v8 = *(void **)(a1 + 8);
        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v26, "uniquePid"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v7 forKeyedSubscript:v9];
      }

      [v7 addObject:v26];
    }

    v10 = *(void **)(a1 + 16);
    objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v26, "pid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectForKeyedSubscript:v11];
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
      v13 = *(void **)(a1 + 16);
      objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v26, "pid"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 setObject:v12 forKeyedSubscript:v14];
    }

    [v12 addObject:v26];

    id v3 = v26;
  }
}

- (unint64_t)numSamples
{
  unint64_t result = -[NSMutableArray count](self->_sampleTimestamps, "count");
  if (!result) {
    return self->_numSamples;
  }
  return result;
}

- (SATimestamp)startTime
{
  startTime = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = startTime;
  if (!startTime) {
    startTime = self->_startTime;
  }
  id v5 = startTime;

  return v5;
}

- (void)setStartTime:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (SATimestamp)endTime
{
  endTime = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = endTime;
  if (!endTime) {
    endTime = self->_endTime;
  }
  id v5 = endTime;

  return v5;
}

- (void)setEndTime:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)addIOEvent:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v10 = v3;
    [*(id *)(a1 + 88) addObject:v3];
    id v4 = *(void **)(a1 + 968);
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v10, "threadID"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v5];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      [v6 addObject:v10];
    }

    else
    {
      id v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v10, 0);
      v8 = *(void **)(a1 + 968);
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v10, "threadID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 setObject:v7 forKeyedSubscript:v9];
    }

    id v3 = v10;
  }
}

- (void)removeAllData
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v3 = (void *)a1[3];
    a1[3] = v2;

    id v4 = (void *)a1[5];
    a1[4] = 0LL;
    a1[5] = 0LL;

    id v5 = (void *)a1[6];
    a1[6] = 0LL;

    id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v7 = (void *)a1[2];
    a1[2] = v6;

    id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
    v9 = (void *)a1[1];
    a1[1] = v8;

    id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
    v11 = (void *)a1[7];
    a1[7] = v10;

    id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
    v13 = (void *)a1[8];
    a1[8] = v12;

    id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
    int v15 = (void *)a1[11];
    a1[11] = v14;

    id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v17 = (void *)a1[121];
    a1[121] = v16;

    id v18 = objc_alloc_init(MEMORY[0x189603FA8]);
    char v19 = (void *)a1[12];
    a1[12] = v18;

    id v20 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v21 = (void *)a1[9];
    a1[9] = v20;
  }

- (BOOL)isEmpty
{
  return -[SASampleStore numSamples](self, "numSamples") == 0;
}

- (void)enumerateTasks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[NSMutableDictionary count](self->_tasksByUniquePid, "count");
  uint64_t v6 = 1LL;
  if (!v5) {
    uint64_t v6 = 2LL;
  }
  Class v7 = (&self->super.isa)[v6];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __32__SASampleStore_enumerateTasks___block_invoke;
  v9[3] = &unk_189F61328;
  id v10 = v4;
  id v8 = v4;
  -[objc_class enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", v9);
}

void __32__SASampleStore_enumerateTasks___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v12 != v9) {
        objc_enumerationMutation(v6);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32));
      if (*a4) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)useDsymForUUIDFor:(id)a3
{
  id v16 = a3;
  id v4 = (const char *)[v16 UTF8String];
  if (v4 && (__endptr = 0LL, unint64_t v5 = strtoull(v4, &__endptr, 0), __endptr) && !*__endptr)
  {
    unint64_t v10 = v5;
    id v6 = self;
    objc_sync_enter(v6);
    idsToUseDsymForUUID = v6->_idsToUseDsymForUUID;
    if (idsToUseDsymForUUID)
    {
      [MEMORY[0x189607968] numberWithUnsignedLongLong:v10];
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](idsToUseDsymForUUID, "addObject:", v12);
    }

    else
    {
      id v13 = objc_alloc(MEMORY[0x189603FA8]);
      [MEMORY[0x189607968] numberWithUnsignedLongLong:v10];
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = objc_msgSend(v13, "initWithObjects:", v12, 0);
      int v15 = v6->_idsToUseDsymForUUID;
      v6->_idsToUseDsymForUUID = (NSMutableArray *)v14;
    }
  }

  else
  {
    id v6 = self;
    objc_sync_enter(v6);
    namesToUseDsymForUUID = v6->_namesToUseDsymForUUID;
    if (namesToUseDsymForUUID)
    {
      -[NSMutableArray addObject:](namesToUseDsymForUUID, "addObject:", v16);
    }

    else
    {
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v16, 0);
      uint64_t v9 = v6->_namesToUseDsymForUUID;
      v6->_namesToUseDsymForUUID = (NSMutableArray *)v8;
    }
  }

  objc_sync_exit(v6);
}

- (id)fanSpeedClosestToTimestamp:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  unint64_t v5 = self->_fanSpeeds;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v27;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v27 != v9) {
        objc_enumerationMutation(v5);
      }
      __int128 v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
      if (!v8) {
        goto LABEL_8;
      }
      objc_msgSend(v8, "timestamp", (void)v26);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 machAbsTimeSeconds];
      double v14 = v13;
      [v4 machAbsTimeSeconds];
      double v16 = vabdd_f64(v14, v15);
      [v11 timestamp];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 machAbsTimeSeconds];
      double v19 = v18;
      [v4 machAbsTimeSeconds];
      double v21 = vabdd_f64(v19, v20);

      if (v16 > v21)
      {
LABEL_8:
        id v22 = v11;

        uint64_t v8 = v22;
      }

      objc_msgSend(v8, "timestamp", (void)v26);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      char v24 = [v23 ge:v4];

      if ((v24 & 1) != 0) {
        break;
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (BOOL)haveCPUClusterInfo
{
  if (self) {
    self = (SASampleStore *)objc_getProperty(self, a2, 1032LL, 1);
  }
  return self != 0LL;
}

- (BOOL)isECoreForCPUNum:(unsigned int)a3
{
  return -[SASampleStore clusterFlagsForCPUNum:](self, *(const char **)&a3) & 1;
}

- (void)clusterFlagsForCPUNum:(void *)result
{
  if (result)
  {
    id Property = objc_getProperty(result, a2, 1032LL, 1);
    id v4 = (void *)MEMORY[0x189607968];
    id v5 = Property;
    [v4 numberWithUnsignedInt:a2];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:v6];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = [v7 unsignedLongLongValue];
    return (void *)v8;
  }

  return result;
}

- (BOOL)isPCoreForCPUNum:(unsigned int)a3
{
  return ((unint64_t)-[SASampleStore clusterFlagsForCPUNum:](self, *(const char **)&a3) >> 1) & 1;
}

- (BOOL)setTargetProcessWithHint:(id)a3
{
  uint64_t v94 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = v4;
  if (!v4 || ![v4 length])
  {
    self->_int targetProcessId = -1;
    self->_targetThreadId = 0LL;
    -[SASampleStore findTargetProcessInTimeRange:]((uint64_t)self, 0LL);
    BOOL v11 = 1;
    goto LABEL_75;
  }

  id v68 = objc_alloc_init(MEMORY[0x189607978]);
  [v68 numberFromString:v5];
  uint64_t v6 = (const __CFNumber *)objc_claimAutoreleasedReturnValue();
  v80 = self;
  v69 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v7 = v6;
  if (CFNumberIsFloatType(v6)) {
    goto LABEL_5;
  }
  v46 = self->_eventTimeRange;
  uint64_t v47 = -[__CFNumber intValue](v7, "intValue");
  if (v46)
  {
    v48 = -[SATimeRange endTime](v46, "endTime");
    uint64_t v49 = -[SASampleStore lastTaskWithPid:onOrBeforeTimestamp:](self, v47, v48);
    if (v49)
    {
      v40 = (SATask *)v49;

LABEL_64:
      v50 = v69;
      goto LABEL_65;
    }

    uint64_t v51 = -[__CFNumber intValue](v69, "intValue");
    v52 = -[SATimeRange endTime](v46, "endTime");
    -[SASampleStore firstTaskWithPid:onOrAfterTimestamp:](self, v51, v52);
    v40 = (SATask *)objc_claimAutoreleasedReturnValue();

    if (v40) {
      goto LABEL_64;
    }
    uint64_t v61 = -[__CFNumber unsignedLongLongValue](v69, "unsignedLongLongValue");
    v62 = -[SATimeRange endTime](v46, "endTime");
    v63 = -[SASampleStore lastTaskWithUniquePid:onOrBeforeTimestamp:](self, v61, v62);
    v64 = v63;
    if (v63)
    {
      v40 = v63;
    }

    else
    {
      uint64_t v65 = -[__CFNumber unsignedLongLongValue](v69, "unsignedLongLongValue");
      -[SATimeRange endTime](v46, "endTime");
      v66 = v5;
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASampleStore firstTaskWithUniquePid:onOrAfterTimestamp:](v80, v65, v67);
      v40 = (SATask *)objc_claimAutoreleasedReturnValue();

      id v5 = v66;
    }
  }

  else
  {
    -[SASampleStore lastTaskWithPid:](self, v47);
    v40 = (SATask *)objc_claimAutoreleasedReturnValue();
    if (v40) {
      goto LABEL_64;
    }
    -[SASampleStore lastTaskWithUniquePid:](self, -[__CFNumber unsignedLongLongValue](v69, "unsignedLongLongValue"));
    v40 = (SATask *)objc_claimAutoreleasedReturnValue();
  }

  self = v80;
  v50 = v69;
  if (v40) {
    goto LABEL_65;
  }
LABEL_5:
  if (-[NSMutableDictionary count](self->_tasksByUniquePid, "count"))
  {
    -[NSMutableDictionary allValues](self->_tasksByUniquePid, "allValues");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = v8;
    uint64_t v10 = &__block_literal_global_1;
  }

  else
  {
    -[NSMutableDictionary allValues](self->_tasksByPid, "allValues");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = v8;
    uint64_t v10 = &__block_literal_global_144;
  }

  [v8 sortedArrayUsingComparator:v10];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  id v13 = v12;
  uint64_t v72 = [v13 countByEnumeratingWithState:&v88 objects:v93 count:16];
  if (!v72)
  {

    v41 = 0LL;
    v43 = 0LL;
    v44 = 0LL;
    v45 = 0LL;
    v42 = 0LL;
    v39 = 0LL;
    v40 = 0LL;
    goto LABEL_57;
  }

  id v77 = 0LL;
  v78 = 0LL;
  v74 = 0LL;
  v75 = 0LL;
  v79 = 0LL;
  v76 = 0LL;
  id obj = v13;
  uint64_t v71 = *(void *)v89;
  double v14 = v80;
  do
  {
    uint64_t v15 = 0LL;
    do
    {
      if (*(void *)v89 != v71) {
        objc_enumerationMutation(obj);
      }
      uint64_t v73 = v15;
      double v16 = *(void **)(*((void *)&v88 + 1) + 8 * v15);
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      id v81 = v16;
      uint64_t v83 = [v81 countByEnumeratingWithState:&v84 objects:v92 count:16];
      if (v83)
      {
        uint64_t v82 = *(void *)v85;
        do
        {
          for (uint64_t i = 0LL; i != v83; ++i)
          {
            if (*(void *)v85 != v82) {
              objc_enumerationMutation(v81);
            }
            double v18 = *(void **)(*((void *)&v84 + 1) + 8 * i);
            [v18 name];
            double v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              double v20 = v14->_eventTimeRange;
              if (v20)
              {
                [v18 startTimestamp];
                double v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[SATimeRange endTime](v20, "endTime");
                id v22 = (void *)objc_claimAutoreleasedReturnValue();
                if ([v21 gt:v22])
                {

LABEL_42:
                  goto LABEL_43;
                }

                [v18 endTimestamp];
                uint64_t v23 = v5;
                char v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[SATimeRange startTime](v20, "startTime");
                uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
                char v26 = [v24 lt:v25];

                id v5 = v23;
                double v14 = v80;

                if ((v26 & 1) != 0) {
                  goto LABEL_42;
                }
              }

              [v18 name];
              __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v28 = [v27 rangeOfString:v5];
              uint64_t v30 = v29;

              if (v28 == 0x7FFFFFFFFFFFFFFFLL)
              {
                [v18 name];
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v34 = [v33 rangeOfString:v5 options:1];
                uint64_t v36 = v35;

                if (v34 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  if (v34)
                  {
                    if (!v76) {
                      v76 = v18;
                    }
                  }

                  else
                  {
                    [v18 name];
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v38 = [v37 length];

                    if (v36 == v38)
                    {
                      if (!v75) {
                        v75 = v18;
                      }
                    }

                    else if (!v74)
                    {
                      v74 = v18;
                    }
                  }
                }
              }

              else if (v28)
              {
                if (!v79) {
                  v79 = v18;
                }
              }

              else
              {
                [v18 name];
                uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v32 = [v31 length];

                if (v30 == v32)
                {
                  if (!v77) {
                    id v77 = v18;
                  }
                }

                else if (!v78)
                {
                  v78 = v18;
                }
              }

              goto LABEL_42;
            }

- (void)lastTaskWithPid:(void *)a3 onOrBeforeTimestamp:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = (void *)a1[2];
    [MEMORY[0x189607968] numberWithInt:a2];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:v7];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (v5) {
        -[SASampleStore _lastTaskOnOrBeforeTimestamp:inTasks:]((uint64_t)a1, v5, v8);
      }
      else {
        [v8 lastObject];
      }
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      a1 = 0LL;
    }
  }

  return a1;
}

- (void)firstTaskWithPid:(void *)a3 onOrAfterTimestamp:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = (void *)a1[2];
    [MEMORY[0x189607968] numberWithInt:a2];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:v7];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (v5) {
        -[SASampleStore _firstTaskOnOrAfterTimestamp:inTasks:](v5, v8);
      }
      else {
        [v8 firstObject];
      }
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      a1 = 0LL;
    }
  }

  return a1;
}

- (void)lastTaskWithPid:(void *)a1
{
  if (a1)
  {
    a1 = -[SASampleStore lastTaskWithPid:onOrBeforeTimestamp:](a1, a2, 0LL);
  }

  return a1;
}

- (void)lastTaskWithUniquePid:(void *)a3 onOrBeforeTimestamp:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = (void *)a1[1];
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a2];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:v7];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5) {
      -[SASampleStore _lastTaskOnOrBeforeTimestamp:inTasks:]((uint64_t)a1, v5, v8);
    }
    else {
      [v8 lastObject];
    }
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (void)firstTaskWithUniquePid:(void *)a3 onOrAfterTimestamp:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = (void *)a1[1];
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a2];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:v7];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5) {
      -[SASampleStore _firstTaskOnOrAfterTimestamp:inTasks:](v5, v8);
    }
    else {
      [v8 firstObject];
    }
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (void)lastTaskWithUniquePid:(void *)a1
{
  if (a1)
  {
    a1 = -[SASampleStore lastTaskWithUniquePid:onOrBeforeTimestamp:](a1, a2, 0LL);
  }

  return a1;
}

uint64_t __42__SASampleStore_setTargetProcessWithHint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 lastObject];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = [v6 uniquePid];
  [v5 lastObject];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = [v8 uniquePid];

  if (v7 <= v9)
  {
    [v4 lastObject];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v12 = [v11 uniquePid];
    [v5 lastObject];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = v12 < [v13 uniquePid];
  }

  else
  {
    uint64_t v10 = -1LL;
  }

  return v10;
}

uint64_t __42__SASampleStore_setTargetProcessWithHint___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 lastObject];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 pid];
  [v4 lastObject];
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = (int)(v6 - [v7 pid]);
  return v8;
}

- (unint64_t)targetThreadId
{
  return self->_targetThreadId;
}

- (void)setTargetThreadId:(unint64_t)a3
{
  if (self->_targetThreadId != a3)
  {
    self->_targetThreadId = a3;
    -[SASampleStore findTargetProcessInTimeRange:]((uint64_t)self, 0LL);
  }

- (unint64_t)targetDispatchQueueId
{
  return self->_targetDispatchQueueId;
}

- (void)setTargetDispatchQueueId:(unint64_t)a3
{
  if (self->_targetDispatchQueueId != a3)
  {
    unint64_t v3 = a3;
    if (a3)
    {
      targetProcess = self->_targetProcess;
      if (targetProcess)
      {
        -[SATask dispatchQueues](targetProcess, "dispatchQueues");
        int v6 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607968] numberWithUnsignedLongLong:v3];
        unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 objectForKeyedSubscript:v7];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8) {
          unint64_t v3 = 0LL;
        }
      }
    }

    self->_targetDispatchQueueId = v3;
  }

- (int)targetProcessId
{
  return self->_targetProcessId;
}

- (void)setTargetProcessId:(int)a3
{
  if (self->_targetProcessId != a3)
  {
    self->_int targetProcessId = a3;
    self->_targetThreadId = 0LL;
    -[SASampleStore findTargetProcessInTimeRange:]((uint64_t)self, 0LL);
  }

- (SATask)targetProcess
{
  return self->_targetProcess;
}

- (void)setTargetProcess:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v5 = (SATask *)a3;
  targetProcess = self->_targetProcess;
  if (targetProcess != v5)
  {
    uint64_t v28 = v5;
    if (v5)
    {
      tasksByPid = self->_tasksByPid;
      objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[SATask pid](v5, "pid"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](tasksByPid, "objectForKeyedSubscript:", v8);
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 indexOfObjectIdenticalTo:v28];

      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        int v17 = *__error();
        _sa_logt();
        double v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          id v19 = -[SATask debugDescription](v28, "debugDescription");
          *(_DWORD *)buf = 136315138;
          uint64_t v30 = [v19 UTF8String];
          _os_log_error_impl( &dword_186C92000,  v18,  OS_LOG_TYPE_ERROR,  "Setting target process %s which isn't in this SASampleStore",  buf,  0xCu);
        }

        *__error() = v17;
        id v20 = -[SATask debugDescription](v28, "debugDescription");
        char v21 = [v20 UTF8String];
        _SASetCrashLogMessage( 859,  "Setting target process %s which isn't in this SASampleStore",  v22,  v23,  v24,  v25,  v26,  v27,  v21);

        _os_crash();
        __break(1u);
      }

      objc_storeStrong((id *)&self->_targetProcess, a3);
      self->_int targetProcessId = -[SATask pid](v28, "pid");
      if (self->_targetThreadId)
      {
        -[SATask threads](v28, "threads");
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_targetThreadId];
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 objectForKeyedSubscript:v12];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13) {
          self->_targetThreadId = 0LL;
        }
      }

      id v5 = v28;
      if (self->_targetDispatchQueueId)
      {
        -[SATask dispatchQueues](v28, "dispatchQueues");
        double v14 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_targetDispatchQueueId];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 objectForKeyedSubscript:v15];
        double v16 = (void *)objc_claimAutoreleasedReturnValue();

        id v5 = v28;
        if (!v16) {
          self->_targetDispatchQueueId = 0LL;
        }
      }
    }

    else
    {
      self->_targetProcess = 0LL;

      id v5 = 0LL;
      self->_int targetProcessId = -1;
      self->_targetThreadId = 0LL;
      self->_targetDispatchQueueId = 0LL;
    }
  }
}

- (void)findTargetProcessInTimeRange:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (!a1) {
    goto LABEL_15;
  }
  id v4 = *(void **)(a1 + 160);
  *(void *)(a1 + 160) = 0LL;

  uint64_t v5 = *(void *)(a1 + 168);
  if (v5)
  {
    if (v3)
    {
      [v3 endTime];
      int v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASampleStore taskWithPid:orTid:atTimestamp:]((id)a1, 0xFFFFFFFFLL, v5, v6);
      unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = v7;
        uint64_t v10 = *(void **)(a1 + 160);
        *(void *)(a1 + 160) = v9;
      }

      else
      {
        uint64_t v18 = *(void *)(a1 + 168);
        [v3 startTime];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = -[SASampleStore taskWithPid:orTid:atTimestamp:]((id)a1, 0xFFFFFFFFLL, v18, v10);
        id v20 = *(void **)(a1 + 160);
        *(void *)(a1 + 160) = v19;
      }

      id v13 = *(void **)(a1 + 160);
      if (v13) {
        goto LABEL_11;
      }
      int v14 = *__error();
      _sa_logt();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      uint64_t v36 = *(void *)(a1 + 168);
      int v38 = 134217984;
      uint64_t v39 = v36;
      int v17 = "No task with thread 0x%llx in event time range, clearing target thread";
    }

    else
    {
      uint64_t v11 = -[SASampleStore lastTaskWithPid:orTid:]((void *)a1, 0xFFFFFFFFLL, *(void *)(a1 + 168));
      unint64_t v12 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = v11;

      id v13 = *(void **)(a1 + 160);
      if (v13)
      {
LABEL_11:
        *(_DWORD *)(a1 + 152) = [v13 pid];
        goto LABEL_14;
      }

      int v14 = *__error();
      _sa_logt();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_13:

        *__error() = v14;
        *(void *)(a1 + 168) = 0LL;
        goto LABEL_14;
      }

      uint64_t v16 = *(void *)(a1 + 168);
      int v38 = 134217984;
      uint64_t v39 = v16;
      int v17 = "No task with thread 0x%llx, clearing target thread";
    }

    _os_log_error_impl(&dword_186C92000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v38, 0xCu);
    goto LABEL_13;
  }

- (id)taskWithPid:(uint64_t)a3 orTid:(void *)a4 atTimestamp:
{
  id v7 = a4;
  if (!a1)
  {
LABEL_14:

    return a1;
  }

  if ((_DWORD)a2 != -1 || a3)
  {
    [a1 startTime];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && [v7 lt:v8])
    {
      id v9 = v7;
      id v7 = v8;
    }

    else
    {
      [a1 endTime];
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9 && [v7 gt:v9])
      {
        id v9 = v9;

        id v7 = v9;
      }
    }

    if ((_DWORD)a2 == -1)
    {
      *(void *)buf = 0LL;
      id v25 = buf;
      uint64_t v26 = 0x3032000000LL;
      uint64_t v27 = __Block_byref_object_copy__0;
      uint64_t v28 = __Block_byref_object_dispose__0;
      id v29 = 0LL;
      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __47__SASampleStore_taskWithPid_orTid_atTimestamp___block_invoke;
      v20[3] = &unk_189F615A8;
      uint64_t v23 = a3;
      id v21 = v7;
      uint64_t v22 = buf;
      [a1 enumerateTasks:v20];
      a1 = *((id *)v25 + 5);

      _Block_object_dispose(buf, 8);
    }

    else
    {
      -[SASampleStore taskWithPid:atTimestamp:]((uint64_t)a1, a2, v7);
      a1 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_14;
  }

  int v11 = *__error();
  _sa_logt();
  unint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_186C92000, v12, OS_LOG_TYPE_ERROR, "neither pid nor tid provided", buf, 2u);
  }

  *__error() = v11;
  _SASetCrashLogMessage(1870, "neither pid nor tid provided", v13, v14, v15, v16, v17, v18, v19);
  id result = (id)_os_crash();
  __break(1u);
  return result;
}

- (id)lastTaskWithPid:(uint64_t)a3 orTid:
{
  if (!a1) {
    return 0LL;
  }
  if ((_DWORD)a2 == -1 && !a3)
  {
    int v5 = *__error();
    _sa_logt();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_186C92000, v6, OS_LOG_TYPE_ERROR, "neither pid nor tid provided", buf, 2u);
    }

    *__error() = v5;
    _SASetCrashLogMessage(1901, "neither pid nor tid provided", v7, v8, v9, v10, v11, v12, v13[0]);
    _os_crash();
    __break(1u);
    return 0LL;
  }

  if ((_DWORD)a2 == -1)
  {
    *(void *)buf = 0LL;
    uint64_t v15 = buf;
    uint64_t v16 = 0x3032000000LL;
    uint64_t v17 = __Block_byref_object_copy__0;
    uint64_t v18 = __Block_byref_object_dispose__0;
    id v19 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __39__SASampleStore_lastTaskWithPid_orTid___block_invoke;
    v13[3] = &unk_189F615D0;
    v13[4] = buf;
    v13[5] = a3;
    [a1 enumerateTasks:v13];
    id v4 = *((id *)v15 + 5);
    _Block_object_dispose(buf, 8);

    return v4;
  }

  else
  {
    -[SASampleStore lastTaskWithPid:](a1, a2);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (id)taskWithPid:(void *)a3 atTimestamp:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  int v6 = *(void **)(a1 + 16);
  [MEMORY[0x189607968] numberWithInt:a2];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v9 = v8;
  id v10 = (id)[v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((-[SATask isAliveAtTimestamp:](v13, v5) & 1) != 0)
        {
          id v10 = v13;
          goto LABEL_11;
        }
      }

      id v10 = (id)[v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

- (NSString)targetProcessName
{
  return -[SATask name](self->_targetProcess, "name");
}

- (NSString)targetProcessAbsolutePath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    id v3 = 0LL;
  }

  return (NSString *)v3;
}

- (NSString)targetProcessBundleName
{
  return -[SATask bundleName](self->_targetProcess, "bundleName");
}

- (NSString)targetProcessBundleVersion
{
  return -[SATask bundleVersion](self->_targetProcess, "bundleVersion");
}

- (NSString)targetProcessBundleShortVersion
{
  return -[SATask bundleShortVersion](self->_targetProcess, "bundleShortVersion");
}

- (NSString)targetProcessBundleBuildVersion
{
  return -[SATask bundleBuildVersion](self->_targetProcess, "bundleBuildVersion");
}

- (NSString)targetProcessBundleProjectName
{
  return -[SATask bundleProjectName](self->_targetProcess, "bundleProjectName");
}

- (NSString)targetProcessBundleSourceVersion
{
  return -[SATask bundleSourceVersion](self->_targetProcess, "bundleSourceVersion");
}

- (NSString)targetProcessBundleProductBuildVersion
{
  return -[SATask bundleProductBuildVersion](self->_targetProcess, "bundleProductBuildVersion");
}

- (NSString)targetProcessBundleId
{
  return -[SATask bundleIdentifier](self->_targetProcess, "bundleIdentifier");
}

- (NSString)targetProcessCommerceAppID
{
  return (NSString *)objc_msgSend( NSString,  "stringWithFormat:",  @"%llu",  -[SATask adamID](self->_targetProcess, "adamID"));
}

- (NSString)targetProcessCommerceExternalID
{
  return -[SATask installerVersionID](self->_targetProcess, "installerVersionID");
}

- (NSString)targetProcessVendorID
{
  return -[SATask vendorID](self->_targetProcess, "vendorID");
}

- (BOOL)cacheLoadInfoForProcess:(int)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v4 && (unint64_t dataGatheringOptions = self->_dataGatheringOptions, (dataGatheringOptions & 2) != 0))
  {
    char v8 = -[SATask gatherLoadInfoFromLiveProcessWithDataGatheringOptions:additionalCSSymbolicatorFlags:]( (uint64_t)v4,  dataGatheringOptions,  self->_additionalCSSymbolicatorFlags);
  }

  else
  {
    [v4 binaryLoadInfos];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v7 count] != 0;
  }

  return v8;
}

- (void)addAuxiliaryData:(id)a3
{
  id v4 = a3;
  selfa = v4;
  if (v4)
  {
    id v7 = objc_getProperty(v4, v5, 8LL, 1);
    if (v7) {
      -[NSMutableArray addObject:](self->_fanSpeeds, "addObject:", v7);
    }
    char v8 = (void *)selfa[2];
    if (v8)
    {
      mountStatusTracker = self->_mountStatusTracker;
      id Property = objc_getProperty(selfa, v6, 24LL, 1);
      -[SAMountStatusTracker addMountStatus:forTimestamp:]((uint64_t)mountStatusTracker, v8, Property);
    }
  }

  else
  {
    id v7 = 0LL;
  }
}

- (void)startingSamplingLiveSystem
{
  if (self)
  {
    if (self->_lastWakeTime == 0.0) {
      self->_lastWakeTime = -[SASampleStore _getLastWakeTime]((uint64_t)self);
    }
  }

- (void)enumerateTasksWithLiveness:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    v6[1] = 3221225472LL;
    v6[2] = __44__SASampleStore_enumerateTasksWithLiveness___block_invoke;
    v6[3] = &unk_189F613B0;
    v6[4] = a1;
    id v5 = v3;
    v6[0] = MEMORY[0x1895F87A8];
    id v7 = v3;
    [v4 enumerateKeysAndObjectsUsingBlock:v6];

    id v3 = v5;
  }
}

void __44__SASampleStore_enumerateTasksWithLiveness___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  unint64_t v4 = *(void *)(*(void *)(a1 + 32) + 408LL);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  objc_msgSend(a3, "reverseObjectEnumerator", 0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v13;
    uint64_t v10 = (v4 >> 1) & 1;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        if ((v10 & 1) != 0 && (*(_BYTE *)(*(void *)(a1 + 32) + 352LL) & 4) != 0) {
          -[SATask isFromCurrentBootCycle](*(id *)(*((void *)&v12 + 1) + 8 * i), v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
        LOBYTE(v10) = 0;
      }

      uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      LOBYTE(v10) = 0;
    }

    while (v8);
  }
}

- (id)fixupAllFrames
{
  v1 = a1;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x189603FE0]);
    uint64_t v26 = 0LL;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000LL;
    uint64_t v3 = mach_absolute_time();
    double v4 = SASecondsFromMachTimeUsingLiveTimebase(v3);
    int v5 = 0;
    uint64_t v6 = v27;
    do
    {
      int v7 = v5;
      *((_BYTE *)v6 + 24) = 0;
      v23[0] = MEMORY[0x1895F87A8];
      v23[1] = 3221225472LL;
      v23[2] = __31__SASampleStore_fixupAllFrames__block_invoke;
      v23[3] = &unk_189F613D8;
      v23[4] = v1;
      id v8 = v2;
      id v24 = v8;
      id v25 = &v26;
      -[SASampleStore enumerateTasksWithLiveness:]((uint64_t)v1, v23);
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      id v9 = v1[15];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v33 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0LL; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v9);
            }
            uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            buf[0] = 0;
            -[SAExclave fixupFrameInstructionsWithNewInstructions:foundNewBinaryInfo:](v13, v8, buf);
            if (buf[0]) {
              *((_BYTE *)v27 + 24) = 1;
            }
          }

          uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v33 count:16];
        }

        while (v10);
      }

      int v5 = v7 + 1;
      uint64_t v6 = v27;
    }

    while (*((_BYTE *)v27 + 24));
    if (v7)
    {
      int v14 = *__error();
      _sa_logt();
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = mach_absolute_time();
        double v18 = SASecondsFromMachTimeUsingLiveTimebase(v17);
        *(_DWORD *)buf = 67109376;
        int v30 = v7 + 1;
        __int16 v31 = 2048;
        double v32 = v18 - v4;
        _os_log_debug_impl( &dword_186C92000,  v15,  OS_LOG_TYPE_DEBUG,  "Iterated frame fixup %d times (in %.3fs)",  buf,  0x12u);
      }

      *__error() = v14;
    }

    v1 = (id *)[v8 copy];
    _Block_object_dispose(&v26, 8);
  }

  return v1;
}

void __31__SASampleStore_fixupAllFrames__block_invoke(uint64_t a1, id *a2, int a3)
{
  char v4 = 0;
  -[SATask fixupFrameInstructionsWithDataGatheringOptions:mightBeAlive:foundNewBinaryInfo:uuidsWithNewInstructions:additionalCSSymbolicatorFlags:]( a2,  *(void *)(*(void *)(a1 + 32) + 408LL),  a3,  &v4,  *(void **)(a1 + 40),  *(_DWORD *)(*(void *)(a1 + 32) + 328LL));
  if (v4) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }
}

- (void)postprocess
{
  uint64_t v325 = *MEMORY[0x1895F89C0];
  if (self->_numMicrostackshotsSkippedDueToMissingLoadInfos)
  {
    int v3 = *__error();
    _sa_logt();
    char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unint64_t numMicrostackshotsSkippedDueToMissingLoadInfos = self->_numMicrostackshotsSkippedDueToMissingLoadInfos;
      buf.uint64_t f_bsize = 134217984;
      *(void *)&buf.f_iosize = numMicrostackshotsSkippedDueToMissingLoadInfos;
      _os_log_error_impl( &dword_186C92000,  v4,  OS_LOG_TYPE_ERROR,  "%llu microstackshots were skipped due to having no load infos",  (uint8_t *)&buf,  0xCu);
    }

    *__error() = v3;
  }

  if (self->_nextSampleIsFirstSamplingAllThreads)
  {
    int v5 = *__error();
    _sa_logt();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_impl( &dword_186C92000,  v6,  OS_LOG_TYPE_DEFAULT,  "WARNING: No stackshot provided after sampleOnlyMainThreads set to NO",  (uint8_t *)&buf,  2u);
    }

    *__error() = v5;
    *(_WORD *)&self->_sampleOnlyMainThreads = 1;
  }

  if (self->_nextSampleIsFirstSamplingAllProcesses)
  {
    int v7 = *__error();
    _sa_logt();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_impl( &dword_186C92000,  v8,  OS_LOG_TYPE_DEFAULT,  "WARNING: No stackshot provided after stackshotsOnlyIncludeSpecificProcesses set to NO",  (uint8_t *)&buf,  2u);
    }

    *__error() = v7;
    *(_WORD *)&self->_stackshotsOnlyIncludeSpecificProcesses = 1;
  }

  if (self->_mostRecentNativeSharedCache || (~LODWORD(self->_dataGatheringOptions) & 3LL) != 0)
  {
    uint64_t v10 = 0LL;
    id v9 = 0LL;
  }

  else
  {
    +[SASharedCache currentSharedCache](&OBJC_CLASS___SASharedCache, "currentSharedCache");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      uint64_t v10 = MEMORY[0x186E47040]();
      -[SASampleStore addSharedCache:]((uint64_t)self, v9);
    }

    else
    {
      uint64_t v10 = 0LL;
    }
  }

  if ((~LODWORD(self->_dataGatheringOptions) & 0x502LL) == 0) {
    -[SASampleStore resampleTruncatedBacktraces]((uint64_t)self);
  }
  v303[0] = MEMORY[0x1895F87A8];
  v303[1] = 3221225472LL;
  v303[2] = __28__SASampleStore_postprocess__block_invoke;
  v303[3] = &unk_189F61400;
  v303[4] = self;
  uint64_t v305 = v10;
  id v255 = v9;
  id v304 = v255;
  -[SASampleStore enumerateTasksWithLiveness:]((uint64_t)self, v303);
  uint64_t v299 = 0LL;
  v300 = &v299;
  uint64_t v301 = 0x2020000000LL;
  char v302 = 0;
  uint64_t v295 = 0LL;
  v296 = &v295;
  uint64_t v297 = 0x2020000000LL;
  char v298 = 0;
  uint64_t v291 = 0LL;
  v292 = &v291;
  uint64_t v293 = 0x2020000000LL;
  char v294 = 0;
  uint64_t v287 = 0LL;
  v288 = &v287;
  uint64_t v289 = 0x2020000000LL;
  char v290 = 0;
  v286[0] = MEMORY[0x1895F87A8];
  v286[1] = 3221225472LL;
  v286[2] = __28__SASampleStore_postprocess__block_invoke_2;
  v286[3] = &unk_189F61450;
  v286[4] = &v291;
  v286[5] = &v299;
  v286[6] = &v287;
  v286[7] = &v295;
  -[SASampleStore enumerateTasks:](self, "enumerateTasks:", v286);
  if (*((_BYTE *)v292 + 24)) {
    int32_t v11 = *((_BYTE *)v300 + 24) == 0;
  }
  else {
    int32_t v11 = 0;
  }
  if (*((_BYTE *)v288 + 24))
  {
    BOOL v12 = *((_BYTE *)v296 + 24) == 0;
    if ((v11 & 1) != 0) {
      goto LABEL_28;
    }
LABEL_27:
    if (!v12) {
      goto LABEL_31;
    }
    goto LABEL_28;
  }

  BOOL v12 = 0;
  if ((v11 & 1) == 0) {
    goto LABEL_27;
  }
LABEL_28:
  int v13 = *__error();
  _sa_logt();
  int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    buf.uint64_t f_bsize = 67109376;
    buf.f_iosize = v11;
    LOWORD(buf.f_blocks) = 1024;
    *(_DWORD *)((char *)&buf.f_blocks + 2) = v12;
    _os_log_debug_impl( &dword_186C92000,  v14,  OS_LOG_TYPE_DEBUG,  "No valid originPid:%d or proximatePid:%d, clearing it all out",  (uint8_t *)&buf,  0xEu);
  }

  *__error() = v13;
  v283[0] = MEMORY[0x1895F87A8];
  v283[1] = 3221225472LL;
  v283[2] = __28__SASampleStore_postprocess__block_invoke_154;
  v283[3] = &__block_descriptor_34_e20_v24__0__SATask_8_B16l;
  char v284 = v11;
  BOOL v285 = v12;
  -[SASampleStore enumerateTasks:](self, "enumerateTasks:", v283);
LABEL_31:
  unint64_t dataGatheringOptions = self->_dataGatheringOptions;
  if ((dataGatheringOptions & 1) == 0) {
    goto LABEL_335;
  }
  if ((dataGatheringOptions & 2) == 0)
  {
    -[SASampleStore lastTaskWithPid:](self, 0LL);
    __int128 v277 = 0u;
    __int128 v278 = 0u;
    __int128 v275 = 0u;
    __int128 v276 = 0u;
    id v254 = (id)objc_claimAutoreleasedReturnValue();
    [v254 binaryLoadInfos];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 countByEnumeratingWithState:&v275 objects:v313 count:16];
    if (!v17)
    {
LABEL_45:

      __int128 v273 = 0u;
      __int128 v274 = 0u;
      __int128 v271 = 0u;
      __int128 v272 = 0u;
      id obj = self->_exclaves;
      id v258 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v271,  v312,  16LL);
      if (v258)
      {
        uint64_t v257 = *(void *)v272;
        do
        {
          for (uint64_t i = 0LL; i != v258; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v272 != v257) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = *(void **)(*((void *)&v271 + 1) + 8LL * (void)i);
            __int128 v267 = 0u;
            __int128 v268 = 0u;
            __int128 v269 = 0u;
            __int128 v270 = 0u;
            [v27 loadInfos];
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v29 = [v28 countByEnumeratingWithState:&v267 objects:v311 count:16];
            if (v29)
            {
              uint64_t v30 = *(void *)v268;
              do
              {
                for (uint64_t j = 0LL; j != v29; ++j)
                {
                  if (*(void *)v268 != v30) {
                    objc_enumerationMutation(v28);
                  }
                  double v32 = *(void **)(*((void *)&v267 + 1) + 8 * j);
                  [v32 binary];
                  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
                  [v33 path];
                  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
                  BOOL v35 = v34 == 0LL;

                  if (v35)
                  {
                    [v32 binary];
                    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
                    [v36 uuid];
                    int v37 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t SymbolOwnerForExclaveUUID = CreateSymbolOwnerForExclaveUUID(v37);
                    uint64_t v40 = v39;

                    if ((CSIsNull() & 1) == 0)
                    {
                      uint64_t v41 = [v32 binary];
                      v42 = (void *)v41;
                      if (v41) {
                        -[SABinary addInfoFromSymbolOwner:fromDisk:includeExpensiveInfo:]( v41,  SymbolOwnerForExclaveUUID,  v40,  0,  0);
                      }

                      CSRelease();
                      [v32 binary];
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      [v43 gatherInfoWithDataGatheringOptions:self->_dataGatheringOptions pid:0xFFFFFFFFLL];
                    }
                  }
                }

                uint64_t v29 = [v28 countByEnumeratingWithState:&v267 objects:v311 count:16];
              }

              while (v29);
            }
          }

          id v258 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v271,  v312,  16LL);
        }

        while (v258);
      }

- (void)resampleTruncatedBacktraces
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (a1 && (~*(_DWORD *)(a1 + 408) & 0x402LL) == 0 && !*(_BYTE *)(a1 + 312))
  {
    *(_BYTE *)(a1 + 312) = 1;
    uint64_t v2 = mach_absolute_time();
    double v3 = SASecondsFromMachTimeUsingLiveTimebase(v2);
    uint64_t v22 = 0LL;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2020000000LL;
    int v25 = 0;
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000LL;
    int v21 = 0;
    char v4 = objc_alloc_init(&OBJC_CLASS___SAFrameIterator);
    -[SAFrameIterator setBacktracer:](v4, "setBacktracer:", 3LL);
    [(id)a1 tasksByPid];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __44__SASampleStore_resampleTruncatedBacktraces__block_invoke;
    v13[3] = &unk_189F61898;
    uint64_t v6 = v4;
    int v14 = v6;
    uint64_t v15 = a1;
    __int128 v16 = &v18;
    uint64_t v17 = &v22;
    [v5 enumerateKeysAndObjectsUsingBlock:v13];

    uint64_t v7 = mach_absolute_time();
    double v8 = SASecondsFromMachTimeUsingLiveTimebase(v7);
    int v9 = *__error();
    _sa_logt();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = *((_DWORD *)v23 + 6);
      int v12 = *((_DWORD *)v19 + 6);
      *(_DWORD *)statfs buf = 67109632;
      int v27 = v11;
      __int16 v28 = 1024;
      int v29 = v12;
      __int16 v30 = 2048;
      double v31 = v8 - v3;
      _os_log_debug_impl( &dword_186C92000,  v10,  OS_LOG_TYPE_DEBUG,  "Resampling %d tasks (%d threads) took %.3fs",  buf,  0x18u);
    }

    *__error() = v9;
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }

void __28__SASampleStore_postprocess__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
}

void __28__SASampleStore_postprocess__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __28__SASampleStore_postprocess__block_invoke_3;
  v7[3] = &unk_189F61428;
  __int128 v5 = *(_OWORD *)(a1 + 48);
  __int128 v8 = *(_OWORD *)(a1 + 32);
  __int128 v9 = v5;
  uint64_t v10 = a3;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

void __28__SASampleStore_postprocess__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  objc_msgSend(a3, "threadStates", 0);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v11 originPid] != -1)
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
        }

        if ([v11 proximatePid] != -1)
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
        }

        if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)
          && *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
        {
          *a4 = 1;
          **(_BYTE **)(a1 + 64) = 1;
          goto LABEL_18;
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

void __28__SASampleStore_postprocess__block_invoke_154(uint64_t a1, void *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __28__SASampleStore_postprocess__block_invoke_2_155;
  v4[3] = &__block_descriptor_34_e35_v32__0__NSNumber_8__SAThread_16_B24l;
  __int16 v5 = *(_WORD *)(a1 + 32);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __28__SASampleStore_postprocess__block_invoke_2_155(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  objc_msgSend(a3, "threadStates", 0);
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        if (*(_BYTE *)(a1 + 32))
        {
          if (!v9) {
            goto LABEL_14;
          }
          *(_DWORD *)(v9 + 28) = -1;
        }

        if (*(_BYTE *)(a1 + 33)) {
          BOOL v10 = v9 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10) {
          *(_DWORD *)(v9 + 32) = -1;
        }
LABEL_14:
        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

- (void)gatherBootArgs
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a1 && !*(void *)(a1 + 496))
  {
    size_t v2 = *MEMORY[0x1895FD590];
    id v3 = (char *)&v11 - ((*MEMORY[0x1895FD590] + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
    *id v3 = 0;
    size_t v12 = v2;
    if (sysctlbyname("kern.bootargs", v3, &v12, 0LL, 0LL))
    {
      int v4 = *__error();
      _sa_logt();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v8 = *__error();
        uint64_t v9 = __error();
        BOOL v10 = strerror(*v9);
        *(_DWORD *)statfs buf = 67109378;
        int v14 = v8;
        __int16 v15 = 2080;
        uint64_t v16 = v10;
        _os_log_error_impl(&dword_186C92000, v5, OS_LOG_TYPE_ERROR, "Unable to get kern.bootargs: %d %s", buf, 0x12u);
      }

      *__error() = v4;
    }

    else
    {
      uint64_t v6 = SANSStringForCString(v3);
      uint64_t v7 = *(void **)(a1 + 496);
      *(void *)(a1 + 496) = v6;
    }
  }

- (double)_getLastWakeTime
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    int WakeTime = IOPMGetLastWakeTime();
    if (WakeTime == -536870184) {
      return -1.0;
    }
    int v2 = WakeTime;
    if (!WakeTime) {
      return v6;
    }
    int v4 = *__error();
    _sa_logt();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)statfs buf = 67109120;
      int v8 = v2;
      _os_log_error_impl(&dword_186C92000, v5, OS_LOG_TYPE_ERROR, "Unable to get last wake time: %d", buf, 8u);
    }

    *__error() = v4;
  }

  return 0.0;
}

void __28__SASampleStore_postprocess__block_invoke_3_158(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 wallTime];
  if (v3 == 0.0 || ([v6 wallTime], v4 >= *(double *)(a1 + 48)))
  {
    uint64_t v5 = *(void **)(a1 + 32);
  }
}

- (void)iterateAllTimestamps:(uint64_t)a1
{
  uint64_t v178 = *MEMORY[0x1895F89C0];
  double v3 = a2;
  double v4 = v3;
  if (a1)
  {
    if (*(void *)(a1 + 40)) {
      v3[2](v3);
    }
    if (*(void *)(a1 + 48)) {
      v4[2](v4);
    }
    uint64_t v5 = *(void **)(a1 + 736);
    if (v5)
    {
      [v5 startTime];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(void), void *))v4[2])(v4, v6);

      [*(id *)(a1 + 736) endTime];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(void), void *))v4[2])(v4, v7);
    }

    __int128 v163 = 0u;
    __int128 v164 = 0u;
    __int128 v161 = 0u;
    __int128 v162 = 0u;
    uint64_t v103 = a1;
    id v8 = *(id *)(a1 + 24);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v161 objects:v177 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v162;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v162 != v11) {
            objc_enumerationMutation(v8);
          }
          ((void (*)(void (**)(void), void))v4[2])( v4,  *(void *)(*((void *)&v161 + 1) + 8 * i));
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v161 objects:v177 count:16];
      }

      while (v10);
    }

    __int128 v159 = 0u;
    __int128 v160 = 0u;
    __int128 v157 = 0u;
    __int128 v158 = 0u;
    id v13 = *(id *)(v103 + 56);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v157 objects:v176 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v158;
      do
      {
        for (uint64_t j = 0LL; j != v15; ++j)
        {
          if (*(void *)v158 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v157 + 1) + 8 * j);
          [v18 hidEventTimestamp];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (*)(void (**)(void), void *))v4[2])(v4, v19);

          __int128 v155 = 0u;
          __int128 v156 = 0u;
          __int128 v153 = 0u;
          __int128 v154 = 0u;
          [v18 steps];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v21 = [v20 countByEnumeratingWithState:&v153 objects:v175 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v154;
            do
            {
              for (uint64_t k = 0LL; k != v22; ++k)
              {
                if (*(void *)v154 != v23) {
                  objc_enumerationMutation(v20);
                }
                [*(id *)(*((void *)&v153 + 1) + 8 * k) timestamp];
                int v25 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (*)(void (**)(void), void *))v4[2])(v4, v25);
              }

              uint64_t v22 = [v20 countByEnumeratingWithState:&v153 objects:v175 count:16];
            }

            while (v22);
          }
        }

        uint64_t v15 = [v13 countByEnumeratingWithState:&v157 objects:v176 count:16];
      }

      while (v15);
    }

    __int128 v151 = 0u;
    __int128 v152 = 0u;
    __int128 v149 = 0u;
    __int128 v150 = 0u;
    id obj = *(id *)(v103 + 64);
    uint64_t v107 = [obj countByEnumeratingWithState:&v149 objects:v174 count:16];
    if (v107)
    {
      id v105 = *(id *)v150;
      do
      {
        uint64_t v27 = 0LL;
        do
        {
          if (*(id *)v150 != v105) {
            objc_enumerationMutation(obj);
          }
          __int16 v28 = *(void **)(*((void *)&v149 + 1) + 8 * v27);
          if (v28)
          {
            id v29 = objc_getProperty(*(id *)(*((void *)&v149 + 1) + 8 * v27), v26, 32LL, 1);
            [v29 startTime];
            __int16 v30 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (*)(void (**)(void), void *))v4[2])(v4, v30);

            id Property = objc_getProperty(v28, v31, 32LL, 1);
          }

          else
          {
            [0 startTime];
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (*)(void (**)(void), void *))v4[2])(v4, v50);

            id Property = 0LL;
          }

          id v33 = Property;
          [v33 endTime];
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (*)(void (**)(void), void *))v4[2])(v4, v34);

          __int128 v147 = 0u;
          __int128 v148 = 0u;
          __int128 v145 = 0u;
          __int128 v146 = 0u;
          uint64_t v109 = v27;
          if (v28) {
            id v36 = objc_getProperty(v28, v35, 8LL, 1);
          }
          else {
            id v36 = 0LL;
          }
          id v37 = v36;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v145 objects:v173 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v146;
            do
            {
              for (uint64_t m = 0LL; m != v39; ++m)
              {
                if (*(void *)v146 != v40) {
                  objc_enumerationMutation(v37);
                }
                v42 = *(void **)(*((void *)&v145 + 1) + 8 * m);
                [v42 hidEventTimestamp];
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (*)(void (**)(void), void *))v4[2])(v4, v43);

                __int128 v143 = 0u;
                __int128 v144 = 0u;
                __int128 v141 = 0u;
                __int128 v142 = 0u;
                [v42 steps];
                id v44 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v45 = [v44 countByEnumeratingWithState:&v141 objects:v172 count:16];
                if (v45)
                {
                  uint64_t v46 = v45;
                  uint64_t v47 = *(void *)v142;
                  do
                  {
                    for (uint64_t n = 0LL; n != v46; ++n)
                    {
                      if (*(void *)v142 != v47) {
                        objc_enumerationMutation(v44);
                      }
                      [*(id *)(*((void *)&v141 + 1) + 8 * n) timestamp];
                      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
                      ((void (*)(void (**)(void), void *))v4[2])(v4, v49);
                    }

                    uint64_t v46 = [v44 countByEnumeratingWithState:&v141 objects:v172 count:16];
                  }

                  while (v46);
                }
              }

              uint64_t v39 = [v37 countByEnumeratingWithState:&v145 objects:v173 count:16];
            }

            while (v39);
          }

          uint64_t v27 = v109 + 1;
        }

        while (v109 + 1 != v107);
        uint64_t v51 = [obj countByEnumeratingWithState:&v149 objects:v174 count:16];
        uint64_t v107 = v51;
      }

      while (v51);
    }

    __int128 v139 = 0u;
    __int128 v140 = 0u;
    __int128 v137 = 0u;
    __int128 v138 = 0u;
    id v52 = *(id *)(v103 + 88);
    uint64_t v53 = [v52 countByEnumeratingWithState:&v137 objects:v171 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v138;
      do
      {
        for (iuint64_t i = 0LL; ii != v54; ++ii)
        {
          if (*(void *)v138 != v55) {
            objc_enumerationMutation(v52);
          }
          SEL v57 = *(void **)(*((void *)&v137 + 1) + 8 * ii);
          [v57 startTimestamp];
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (*)(void (**)(void), void *))v4[2])(v4, v58);

          [v57 endTimestamp];
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (*)(void (**)(void), void *))v4[2])(v4, v59);
        }

        uint64_t v54 = [v52 countByEnumeratingWithState:&v137 objects:v171 count:16];
      }

      while (v54);
    }

    __int128 v135 = 0u;
    __int128 v136 = 0u;
    __int128 v133 = 0u;
    __int128 v134 = 0u;
    id v60 = *(id *)(v103 + 96);
    uint64_t v61 = [v60 countByEnumeratingWithState:&v133 objects:v170 count:16];
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v63 = *(void *)v134;
      do
      {
        for (juint64_t j = 0LL; jj != v62; ++jj)
        {
          if (*(void *)v134 != v63) {
            objc_enumerationMutation(v60);
          }
          [*(id *)(*((void *)&v133 + 1) + 8 * jj) timestamp];
          uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (*)(void (**)(void), void *))v4[2])(v4, v65);
        }

        uint64_t v62 = [v60 countByEnumeratingWithState:&v133 objects:v170 count:16];
      }

      while (v62);
    }

    -[SAMountStatusTracker iterateAllTimestamps:](*(void *)(v103 + 400), v4);
    __int128 v131 = 0u;
    __int128 v132 = 0u;
    __int128 v129 = 0u;
    __int128 v130 = 0u;
    id v66 = *(id *)(v103 + 72);
    uint64_t v67 = [v66 countByEnumeratingWithState:&v129 objects:v169 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v130;
      do
      {
        for (kuint64_t k = 0LL; kk != v68; ++kk)
        {
          if (*(void *)v130 != v69) {
            objc_enumerationMutation(v66);
          }
          [*(id *)(*((void *)&v129 + 1) + 8 * kk) timestamp];
          uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (*)(void (**)(void), void *))v4[2])(v4, v71);
        }

        uint64_t v68 = [v66 countByEnumeratingWithState:&v129 objects:v169 count:16];
      }

      while (v68);
    }

    __int128 v127 = 0u;
    __int128 v128 = 0u;
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    id v72 = *(id *)(v103 + 80);
    uint64_t v73 = [v72 countByEnumeratingWithState:&v125 objects:v168 count:16];
    if (v73)
    {
      uint64_t v74 = v73;
      uint64_t v75 = *(void *)v126;
      do
      {
        for (muint64_t m = 0LL; mm != v74; ++mm)
        {
          if (*(void *)v126 != v75) {
            objc_enumerationMutation(v72);
          }
          double v77 = *(void **)(*((void *)&v125 + 1) + 8 * mm);
          [v77 timestamp];
          double v78 = (void *)objc_claimAutoreleasedReturnValue();

          if (v78)
          {
            [v77 timestamp];
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (*)(void (**)(void), void *))v4[2])(v4, v79);
          }
        }

        uint64_t v74 = [v72 countByEnumeratingWithState:&v125 objects:v168 count:16];
      }

      while (v74);
    }

    if (*(void *)(v103 + 424)) {
      v4[2](v4);
    }
    if (*(void *)(v103 + 432)) {
      v4[2](v4);
    }
    v123[0] = MEMORY[0x1895F87A8];
    v123[1] = 3221225472LL;
    v123[2] = __38__SASampleStore_iterateAllTimestamps___block_invoke;
    v123[3] = &unk_189F61D38;
    int v80 = v4;
    id v124 = v80;
    [(id)v103 enumerateTasks:v123];
    __int128 v121 = 0u;
    __int128 v122 = 0u;
    __int128 v119 = 0u;
    __int128 v120 = 0u;
    [(id)v103 models];
    id v106 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v110 = [v106 countByEnumeratingWithState:&v119 objects:v167 count:16];
    if (v110)
    {
      uint64_t v108 = *(void *)v120;
      do
      {
        for (nuint64_t n = 0LL; nn != v110; ++nn)
        {
          if (*(void *)v120 != v108) {
            objc_enumerationMutation(v106);
          }
          uint64_t v82 = *(void **)(*((void *)&v119 + 1) + 8 * nn);
          __int128 v115 = 0u;
          __int128 v116 = 0u;
          __int128 v117 = 0u;
          __int128 v118 = 0u;
          [v82 loadedChanges];
          uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v84 = [v83 countByEnumeratingWithState:&v115 objects:v166 count:16];
          if (v84)
          {
            uint64_t v85 = v84;
            uint64_t v86 = *(void *)v116;
            do
            {
              for (uint64_t i1 = 0LL; i1 != v85; ++i1)
              {
                if (*(void *)v116 != v86) {
                  objc_enumerationMutation(v83);
                }
                __int128 v88 = *(void **)(*((void *)&v115 + 1) + 8 * i1);
                [v88 timestamp];
                __int128 v89 = (void *)objc_claimAutoreleasedReturnValue();

                if (v89)
                {
                  [v88 timestamp];
                  id v90 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (*)(void (**)(void), void *))v80[2])(v80, v90);
                }

                [v88 endTime];
                __int128 v91 = (void *)objc_claimAutoreleasedReturnValue();

                if (v91)
                {
                  [v88 endTime];
                  id v92 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (*)(void (**)(void), void *))v80[2])(v80, v92);
                }
              }

              uint64_t v85 = [v83 countByEnumeratingWithState:&v115 objects:v166 count:16];
            }

            while (v85);
          }

          __int128 v113 = 0u;
          __int128 v114 = 0u;
          __int128 v111 = 0u;
          __int128 v112 = 0u;
          [v82 executions];
          dispatch_semaphore_t v93 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v94 = [v93 countByEnumeratingWithState:&v111 objects:v165 count:16];
          if (v94)
          {
            uint64_t v95 = v94;
            uint64_t v96 = *(void *)v112;
            do
            {
              for (uint64_t i2 = 0LL; i2 != v95; ++i2)
              {
                if (*(void *)v112 != v96) {
                  objc_enumerationMutation(v93);
                }
                v98 = *(void **)(*((void *)&v111 + 1) + 8 * i2);
                [v98 startTime];
                v99 = (void *)objc_claimAutoreleasedReturnValue();

                if (v99)
                {
                  [v98 startTime];
                  id v100 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (*)(void (**)(void), void *))v80[2])(v80, v100);
                }

                [v98 endTime];
                uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue();

                if (v101)
                {
                  [v98 endTime];
                  uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (*)(void (**)(void), void *))v80[2])(v80, v102);
                }
              }

              uint64_t v95 = [v93 countByEnumeratingWithState:&v111 objects:v165 count:16];
            }

            while (v95);
          }
        }

        uint64_t v110 = [v106 countByEnumeratingWithState:&v119 objects:v167 count:16];
      }

      while (v110);
    }
  }
}

- (int)gatherHWPageSize
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (result)
  {
    if (!result[86])
    {
      size_t v6 = 4LL;
      id result = (int *)sysctlbyname("hw.pagesize", result + 86, &v6, 0LL, 0LL);
      if ((_DWORD)result)
      {
        int v1 = *__error();
        _sa_logt();
        int v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        {
          int v3 = *__error();
          double v4 = __error();
          uint64_t v5 = strerror(*v4);
          *(_DWORD *)statfs buf = 67109378;
          int v8 = v3;
          __int16 v9 = 2080;
          uint64_t v10 = v5;
          _os_log_error_impl(&dword_186C92000, v2, OS_LOG_TYPE_ERROR, "Unable to get hw.pagesize: %d %s", buf, 0x12u);
        }

        id result = __error();
        *id result = v1;
      }
    }
  }

  return result;
}

- (int)gatherVMPageSize
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (result)
  {
    if (!result[87])
    {
      size_t v6 = 4LL;
      id result = (int *)sysctlbyname("vm.pagesize", result + 87, &v6, 0LL, 0LL);
      if ((_DWORD)result)
      {
        int v1 = *__error();
        _sa_logt();
        int v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        {
          int v3 = *__error();
          double v4 = __error();
          uint64_t v5 = strerror(*v4);
          *(_DWORD *)statfs buf = 67109378;
          int v8 = v3;
          __int16 v9 = 2080;
          uint64_t v10 = v5;
          _os_log_error_impl(&dword_186C92000, v2, OS_LOG_TYPE_ERROR, "Unable to get vm.pagesize: %d %s", buf, 0x12u);
        }

        id result = __error();
        *id result = v1;
      }
    }
  }

  return result;
}

uint64_t __28__SASampleStore_postprocess__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 startTimestamp];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 startTimestamp];
  size_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __28__SASampleStore_postprocess__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 sortUsingComparator:&__block_literal_global_164];
}

uint64_t __28__SASampleStore_postprocess__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 startTimestamp];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 startTimestamp];
  size_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __28__SASampleStore_postprocess__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return -[SATimestamp applyMachTimebase:](a2, *(void *)(*(void *)(a1 + 32) + 184LL));
}

- (void)task:(void *)a3 exitedAtTimestamp:
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  self = a2;
  id v5 = a3;
  if (a1)
  {
    [self exitTimestamp];
    size_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      int v9 = *__error();
      _sa_logt();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [self debugDescription];
        uint64_t v12 = [v11 UTF8String];
        [self exitTimestamp];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        id v14 = [v13 debugDescription];
        uint64_t v15 = [v14 UTF8String];
        id v16 = [v5 debugDescription];
        *(_DWORD *)statfs buf = 136315650;
        uint64_t v32 = v12;
        __int16 v33 = 2080;
        uint64_t v34 = v15;
        __int16 v35 = 2080;
        uint64_t v36 = [v16 UTF8String];
        _os_log_error_impl(&dword_186C92000, v10, OS_LOG_TYPE_ERROR, "%s exited at %s, updating to %s", buf, 0x20u);
      }

      *__error() = v9;
      id v17 = [self debugDescription];
      char v18 = [v17 UTF8String];
      [self exitTimestamp];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      id v20 = [v19 debugDescription];
      [v20 UTF8String];
      id v21 = [v5 debugDescription];
      [v21 UTF8String];
      _SASetCrashLogMessage(1315, "%s exited at %s, updating to %s", v22, v23, v24, v25, v26, v27, v18);

      _os_crash();
      __break(1u);
    }

    if (self) {
      objc_setProperty_atomic(self, v7, v5, 232LL);
    }
    if (*(void *)(a1 + 360) >= 2uLL)
    {
      [self threads];
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1895F87A8];
      v29[1] = 3221225472LL;
      v29[2] = __40__SASampleStore_task_exitedAtTimestamp___block_invoke;
      v29[3] = &unk_189F61FD8;
      id v30 = v5;
      [v8 enumerateKeysAndObjectsUsingBlock:v29];
    }
  }
}

void __40__SASampleStore_task_exitedAtTimestamp___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  self = a3;
  [self exitTimestamp];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  size_t v6 = self;
  if (self && !v4)
  {
    objc_setProperty_atomic(self, v5, *(id *)(a1 + 32), 40LL);
    size_t v6 = self;
  }
}

- (void)_backfillPidStartTimestamp:(void *)a1 toPreviousTasksEnumerator:(void *)a2 execTimestampOfNextTask:(void *)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0LL;
      id v14 = v7;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * v13);
        if (v15) {
          id Property = objc_getProperty(*(id *)(*((void *)&v25 + 1) + 8 * v13), v10, 272LL, 1);
        }
        else {
          id Property = 0LL;
        }
        id v17 = Property;

        if (v17) {
          goto LABEL_19;
        }
        uint64_t v18 = objc_msgSend(v15, "exitTimestamp", (void)v25);
        if (!v18) {
          goto LABEL_19;
        }
        uint64_t v19 = (void *)v18;
        [v15 exitTimestamp];
        id v20 = (void *)objc_claimAutoreleasedReturnValue();
        char v21 = [v20 ne:v14];

        if ((v21 & 1) != 0) {
          goto LABEL_19;
        }
        if (v15) {
          objc_setProperty_atomic(v15, v22, v5, 272LL);
        }
        [v15 execTimestamp];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
LABEL_19:
          id v7 = v14;
          goto LABEL_20;
        }

        [v15 execTimestamp];
        id v7 = (id)objc_claimAutoreleasedReturnValue();

        ++v13;
        id v14 = v7;
      }

      while (v11 != v13);
      uint64_t v24 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v11 = v24;
    }

    while (v24);
  }

- (void)addNewImageInfos:(unsigned int)a3 numLoadInfos:(const char *)a4 name:(void *)a5 sharedCache:(uint64_t)a6 architecture:(void *)a7 toTask:
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v13 = a5;
  id v14 = a7;
  [v14 sharedCache];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && v13 && !v15)
  {
    if ((v14[72] & 1) != 0)
    {
      int v17 = *__error();
      _sa_logt();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        [v13 debugDescription];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 debugDescription];
        *(_DWORD *)dest = 138412546;
        *(void *)&dest[4] = v23;
        uint64_t v26 = v25 = 2112;
        uint64_t v22 = (void *)v26;
        _os_log_fault_impl( &dword_186C92000,  v18,  OS_LOG_TYPE_FAULT,  "shared cache %@, though task %@ has no shared cache",  dest,  0x16u);
      }

      *__error() = v17;
    }

    else
    {
      objc_setProperty_atomic(v14, v16, v13, 256LL);
    }
  }

  [v14 binaryLoadInfos];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3) {
    goto LABEL_20;
  }
  if (!v14)
  {
LABEL_10:

LABEL_14:
    if ((*(_BYTE *)(a1 + 408) & 2) != 0)
    {
      SAExecutablePath([v14 pid], a4);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v19 = 0LL;
    }

    _SABinaryCreateLoadInfoArrayFromDyldImageInfos(a2, a3, v19, 0LL, 0, 0);
    char v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SATask addImageInfos:]((uint64_t)v14, v21);
    if (v14) {
      v14[73] = 1;
    }

LABEL_20:
    if (!v14) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }

  char v20 = v14[73];

  if ((v20 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_21:
  objc_copyStruct(dest, v14 + 288, 8LL, 1, 0);
  if (!*(void *)dest)
  {
    *(void *)dest = a6;
    objc_copyStruct(v14 + 288, dest, 8LL, 1, 0);
  }

- (id)_taskForPid:(uint64_t)a3 uniquePid:(char *)a4 name:(uint64_t)a5 pidStartTime:(os_log_s *)a6 loadInfos:(unsigned int)a7 numLoadInfos:(char)a8 loadInfosIsPartial:(os_log_s *)a9 textExecLoadInfos:(unsigned int)a10 numTextExecLoadInfos:(char)a11 textExecLoadInfosIsPartial:(uint64_t)a12 architecture:(void *)a13 timestamp:(void *)a14 sharedCache:(char)a15 needAOTInfo:
{
  char v20 = a9;
  uint64_t v192 = *MEMORY[0x1895F89C0];
  char v21 = a13;
  id v174 = a14;
  if (!a1)
  {
LABEL_90:
    SEL v57 = 0LL;
    goto LABEL_73;
  }

  newValue = v21;
  if (a4)
  {
    if (*a4) {
      char v21 = a4;
    }
    else {
      char v21 = 0LL;
    }
  }

  else
  {
    char v21 = 0LL;
  }

  char v158 = a8;
  if (a3 != -1)
  {
    __int128 v163 = (char *)a2;
    uint64_t v22 = (void *)*((void *)a1 + 1);
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 objectForKeyedSubscript:v23];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      uint64_t v26 = 0LL;
      char v44 = 1;
      goto LABEL_42;
    }

    [v24 lastObject];
    __int16 v25 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = v25;
    if ((_DWORD)v163 != -1)
    {
      __int128 v156 = v24;
      uint64_t v27 = (void *)*((void *)a1 + 2);
      objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 objectForKeyedSubscript:v28];
      id v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 lastObject];
      uint64_t v30 = (_DWORD *)objc_claimAutoreleasedReturnValue();

      if (v30 == v26)
      {
LABEL_18:
        if (v26)
        {
          uint64_t v24 = v156;
          a2 = (uint64_t)v163;
          goto LABEL_29;
        }

        char v44 = 1;
        uint64_t v24 = v156;
LABEL_42:
        a2 = (uint64_t)v163;
        goto LABEL_48;
      }

      if ([v26 pid] == -1)
      {
        if (v26) {
          v26[19] = (_DWORD)v163;
        }
        [*((id *)a1 + 2) objectForKeyedSubscript:&unk_189F82310];
        SEL v31 = (void *)objc_claimAutoreleasedReturnValue();
        char v32 = [v31 containsObject:v26];

        if ((v32 & 1) != 0)
        {
          [*((id *)a1 + 2) objectForKeyedSubscript:&unk_189F82310];
          __int16 v33 = (void *)objc_claimAutoreleasedReturnValue();
          [v33 removeObject:v26];

          uint64_t v34 = (void *)*((void *)a1 + 2);
          objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v26, "pid"));
          __int16 v35 = (void *)objc_claimAutoreleasedReturnValue();
          [v34 objectForKeyedSubscript:v35];
          id v36 = (id)objc_claimAutoreleasedReturnValue();

          if (!v36)
          {
            id v36 = objc_alloc_init(MEMORY[0x189603FA8]);
            uint64_t v37 = (void *)*((void *)a1 + 2);
            objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v26, "pid"));
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
            [v37 setObject:v36 forKeyedSubscript:v38];
          }

          [v36 addObject:v26];

          goto LABEL_18;
        }

        goto LABEL_87;
      }

- (id)taskForKCDataTask:(os_log_s *)a3 loadInfos:(unsigned int)a4 numLoadInfos:(char)a5 loadInfosIsPartial:(os_log_s *)a6 textExecLoadInfos:(unsigned int)a7 numTextExecLoadInfos:(char)a8 textExecLoadInfosIsPartial:(uint64_t)a9 architecture:(void *)a10 timestamp:(void *)a11 sharedCache:(char)a12 needAOTInfo:
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)taskForKCDataDeltaTask:(os_log_s *)a3 loadInfos:(unsigned int)a4 numLoadInfos:(char)a5 loadInfosIsPartial:(os_log_s *)a6 textExecLoadInfos:(unsigned int)a7 numTextExecLoadInfos:(char)a8 textExecLoadInfosIsPartial:(void *)a9 timestamp:(void *)a10 sharedCache:(char)a11 needAOTInfo:
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)taskForKCDataTransitioningTask:(void *)a1 loadInfos:(uint64_t)a2 numLoadInfos:(os_log_s *)a3 loadInfosIsPartial:(unsigned int)a4 textExecLoadInfos:(char)a5 numTextExecLoadInfos:(os_log_s *)a6 textExecLoadInfosIsPartial:(unsigned int)a7 architecture:(char)a8 timestamp:(void *)a9 sharedCache:(void *)a10 needAOTInfo:(char)a11
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)taskForMicrostackshotTask:(char *)a3 taskName:(os_log_s *)a4 loadInfos:(unsigned int)a5 numLoadInfos:(void *)a6 sharedCache:(int)a7 loadInfosIsPartial:(void *)a8 timestamp:(uint64_t)a9 architecture:(char)a10 needAOTInfo:(char)a11 isFromCurrentBoot:
{
  uint64_t v88 = *MEMORY[0x1895F89C0];
  id v18 = a6;
  id v19 = a8;
  if (*(void *)(a2 + 8) == -1LL)
  {
    int v72 = a7;
    SEL v31 = a4;
    unsigned int v32 = a5;
    id v33 = v19;
    uint64_t v34 = *(void **)(a1 + 16);
    [MEMORY[0x189607968] numberWithInt:*(unsigned int *)(a2 + 4)];
    __int16 v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 objectForKeyedSubscript:v35];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      uint64_t v36 = [v22 lastObject];
      id v24 = (id)v36;
      id v19 = v33;
      if (v36)
      {
        a5 = v32;
        if ((-[SATask correspondsToPid:name:loadInfos:numLoadInfos:textExecLoadInfos:numTextExecLoadInfos:architecture:sharedCache:]( v36,  *(_DWORD *)(a2 + 4),  a3,  v31,  v32,  0LL,  0,  a9,  v18) & 1) != 0)
        {
          -[SASampleStore addNewImageInfos:numLoadInfos:name:sharedCache:architecture:toTask:]( a1,  (uint64_t)v31,  v32,  a3,  v18,  a9,  v24);
          id v24 = v24;
          uint64_t v30 = v24;
          goto LABEL_34;
        }

        [v24 exitTimestamp];
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
        a4 = v31;
        a7 = v72;
        if (v37) {
          goto LABEL_19;
        }
LABEL_17:
        uint64_t v38 = *(void *)(a1 + 360);
        if (!v38) {
          goto LABEL_20;
        }
        if (v38 != 1)
        {
          -[SASampleStore task:exitedAtTimestamp:](a1, v24, v19);
LABEL_20:

          if ((*(_BYTE *)(a1 + 408) & 2) != 0)
          {
            SAExecutablePath(*(_DWORD *)(a2 + 4), a3);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            uint64_t v22 = 0LL;
          }

          +[SATask taskWithPid:uniquePid:name:mainBinaryPath:pidStartTime:loadInfos:numLoadInfos:textExecLoadInfos:numTextExecLoadInfos:architecture:sharedCache:]( (uint64_t)&OBJC_CLASS___SATask,  *(unsigned int *)(a2 + 4),  *(void *)(a2 + 8),  (uint64_t)a3,  v22,  0LL,  (uint64_t)a4,  a5,  0LL,  0,  a9,  v18);
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[SASampleStore addTask:](a1, v30);
          uint64_t v39 = *(void *)(a1 + 408);
          if ((v39 & 2) == 0 || !a11) {
            goto LABEL_34;
          }
          id v40 = v19;
          if ((a10 & 1) != 0) {
            goto LABEL_32;
          }
          if ((v39 & 0x80) != 0)
          {
            [v30 binaryLoadInfos];
            uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (![v41 count] || a7)
            {

LABEL_32:
              -[SATask gatherLoadInfoFromLiveProcessWithDataGatheringOptions:additionalCSSymbolicatorFlags:]( (uint64_t)v30,  *(void *)(a1 + 408),  *(_DWORD *)(a1 + 328));
              goto LABEL_33;
            }

            int v42 = [v30 pid];

            if (!v42) {
              goto LABEL_32;
            }
          }

- (id)_lastTaskOnOrBeforeTimestamp:(void *)a3 inTasks:
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    objc_msgSend(v6, "reverseObjectEnumerator", 0);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = (id)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          [v12 startTimestamp];
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          id v14 = v13;
          if (v13)
          {
          }

          else
          {
            [v7 firstObject];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12 == v15)
            {
LABEL_14:
              id v9 = v12;

              goto LABEL_15;
            }
          }
        }

        id v9 = (id)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (void)firstTaskWithPid:(void *)a1
{
  if (a1)
  {
    a1 = -[SASampleStore firstTaskWithPid:onOrAfterTimestamp:](a1, a2, 0LL);
  }

  return a1;
}

- (id)_firstTaskOnOrAfterTimestamp:(void *)a1 inTasks:(void *)a2
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = a2;
  id v5 = (id)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        objc_msgSend(v8, "endTimestamp", (void)v13);
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = v9;
        if (v9)
        {
        }

        else
        {
          [v4 lastObject];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8 == v11)
          {
LABEL_13:
            id v5 = v8;

            goto LABEL_14;
          }
        }
      }

      id v5 = (id)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (void)taskWithUniquePid:(void *)a3 atTimestamp:
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = (void *)a1[1];
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a2];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v9 = v8;
    a1 = (void *)[v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (a1)
    {
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v9);
          }
          uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v11);
          if ((-[SATask isAliveAtTimestamp:](v12, v5) & 1) != 0)
          {
            a1 = v12;
            goto LABEL_12;
          }

          uint64_t v11 = (void *)((char *)v11 + 1);
        }

        while (a1 != v11);
        a1 = (void *)[v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (a1) {
          continue;
        }
        break;
      }
    }

void __47__SASampleStore_taskWithPid_orTid_atTimestamp___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v11 = a2;
  [v11 threads];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  if (v8)
  {
    id v9 = (void *)v8;
    unsigned int v10 = -[SATask isAliveAtTimestamp:](v11, *(void **)(a1 + 32));

    if (v10)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
      *a3 = 1;
    }
  }

  else
  {
  }
}

void __39__SASampleStore_lastTaskWithPid_orTid___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v11 = a2;
  [v11 threads];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  id v9 = (id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  if (v8)
  {
    objc_storeStrong(v9, a2);
  }

  else if (*v9)
  {
    int v10 = [v11 pid];
  }
}

- (SASampleStore)init
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___SASampleStore;
  int v2 = -[SASampleStore init](&v32, sel_init);
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    tasksByPid = v2->_tasksByPid;
    v2->_tasksByPid = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    tasksByUniquePid = v2->_tasksByUniquePid;
    v2->_tasksByUniquePid = v5;

    v2->_int targetProcessId = -1;
    targetProcess = v2->_targetProcess;
    v2->_targetProcess = 0LL;

    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    sampleTimestamps = v2->_sampleTimestamps;
    v2->_sampleTimestamps = v8;

    int v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    hidEvents = v2->_hidEvents;
    v2->_hidEvents = v10;

    uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    gestures = v2->_gestures;
    v2->_gestures = v12;

    __int128 v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    ioEvents = v2->_ioEvents;
    v2->_ioEvents = v14;

    __int128 v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    ioEventsByTid = v2->_ioEventsByTid;
    v2->_ioEventsByTid = v16;

    uint64_t v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    memoryPressureEvents = v2->_memoryPressureEvents;
    v2->_memoryPressureEvents = v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
    kernelCaches = v2->_kernelCaches;
    v2->_kernelCaches = (NSMutableArray *)v20;

    uint64_t v22 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
    sharedCaches = v2->_sharedCaches;
    v2->_sharedCaches = (NSMutableArray *)v22;

    id v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    fanSpeeds = v2->_fanSpeeds;
    v2->_fanSpeeds = v24;

    uint64_t v26 = objc_alloc_init(&OBJC_CLASS___SAMountStatusTracker);
    mountStatusTracker = v2->_mountStatusTracker;
    v2->_mountStatusTracker = v26;

    wsDataStore = v2->_wsDataStore;
    v2->_wsDataStore = 0LL;

    id v29 = +[SABinaryLocator sharedBinaryLocator](&OBJC_CLASS___SABinaryLocator, "sharedBinaryLocator");
    binaryLocator = v2->_binaryLocator;
    v2->_binaryLocator = v29;

    v2->_additionalCSSymbolicatorFlags = 0;
    v2->_sampleOnlyMainThreads = 0;
    v2->_stackshotsOnlyIncludeSpecificProcesses = 0;
  }

  return v2;
}

- (id)initForLiveSampling
{
  id result = -[SASampleStore init](self, "init");
  if (result)
  {
    *((_BYTE *)result + 317) = 1;
    *((void *)result + 51) = 1415LL;
  }

  return result;
}

- (id)initForFileParsing
{
  id result = -[SASampleStore init](self, "init");
  if (result)
  {
    *((_BYTE *)result + 317) = 0;
    *((void *)result + 51) = 1652LL;
  }

  return result;
}

- (void)setSampleOnlyMainThreads:(BOOL)a3
{
  if (self->_sampleOnlyMainThreads == a3) {
    return;
  }
  BOOL v3 = a3;
  if (!-[NSMutableArray count](self->_sampleTimestamps, "count"))
  {
LABEL_8:
    self->_sampleOnlyMainThreads = v3;
    return;
  }

  if (!v3)
  {
    self->_nextSampleIsFirstSamplingAllThreads = 1;
    goto LABEL_8;
  }

  int v5 = *__error();
  _sa_logt();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v7 = 0;
    _os_log_error_impl( &dword_186C92000,  v6,  OS_LOG_TYPE_ERROR,  "Cannot set sampleOnlyMainThreads to YES after parsing any data",  v7,  2u);
  }

  *__error() = v5;
}

- (BOOL)sampleOnlyMainThreads
{
  return self->_sampleOnlyMainThreads;
}

- (void)setStackshotsOnlyIncludeSpecificProcesses:(BOOL)a3
{
  if (self->_stackshotsOnlyIncludeSpecificProcesses == a3) {
    return;
  }
  BOOL v3 = a3;
  if (!-[NSMutableArray count](self->_sampleTimestamps, "count"))
  {
LABEL_8:
    self->_stackshotsOnlyIncludeSpecificProcesses = v3;
    return;
  }

  if (!v3)
  {
    self->_nextSampleIsFirstSamplingAllProcesses = 1;
    goto LABEL_8;
  }

  int v5 = *__error();
  _sa_logt();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v7 = 0;
    _os_log_error_impl( &dword_186C92000,  v6,  OS_LOG_TYPE_ERROR,  "Cannot set stackshotsOnlyIncludeSpecificProcesses to YES after parsing any data",  v7,  2u);
  }

  *__error() = v5;
}

- (BOOL)stackshotsOnlyIncludeSpecificProcesses
{
  return self->_stackshotsOnlyIncludeSpecificProcesses;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SASampleStore;
  -[SASampleStore dealloc](&v3, sel_dealloc);
}

- (unint64_t)indexOfFirstSampleOnOrAfterTimestamp:(id)a3
{
  id v4 = a3;
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[NSMutableArray count](self->_sampleTimestamps, "count"))
  {
    unint64_t v6 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:]( self->_sampleTimestamps,  "indexOfObject:inSortedRange:options:usingComparator:",  v4,  0LL,  -[NSMutableArray count](self->_sampleTimestamps, "count"),  1280LL,  &__block_literal_global_186);
    if (v6 < -[NSMutableArray count](self->_sampleTimestamps, "count")) {
      unint64_t v5 = v6;
    }
  }

  return v5;
}

uint64_t __54__SASampleStore_indexOfFirstSampleOnOrAfterTimestamp___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (unint64_t)indexOfLastSampleOnOrBeforeTimestamp:(id)a3
{
  id v4 = a3;
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[NSMutableArray count](self->_sampleTimestamps, "count"))
  {
    uint64_t v6 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:]( self->_sampleTimestamps,  "indexOfObject:inSortedRange:options:usingComparator:",  v4,  0LL,  -[NSMutableArray count](self->_sampleTimestamps, "count"),  1536LL,  &__block_literal_global_187);
    if (v6) {
      unint64_t v5 = v6 - 1;
    }
  }

  return v5;
}

uint64_t __54__SASampleStore_indexOfLastSampleOnOrBeforeTimestamp___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)sharedCacheWithUUID:(uint64_t)a3 slide:(uint64_t)a4 slidBaseAddress:
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  objc_msgSend(*(id *)(a1 + 112), "reverseObjectEnumerator", 0);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v13 matchesUUID:a2 slide:a3 slidBaseAddress:a4])
        {
          id v17 = v13;

          return v17;
        }
      }

      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uuidForBytes(a2);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SASharedCache sharedCacheWithUUID:slide:slidBaseAddress:]( &OBJC_CLASS___SASharedCache,  "sharedCacheWithUUID:slide:slidBaseAddress:",  v14,  a3,  a4);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 112) addObject:v15];
  return v15;
}

- (void)exclaveWithIdentifier:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = *(id *)(a1 + 120);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "identifier", (void)v15) == a2)
        {
          uint64_t v10 = v9;

          return v10;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v10 = -[SAExclave initWithIdentifier:](objc_alloc(&OBJC_CLASS___SAExclave), a2);
  uint64_t v11 = *(void **)(a1 + 120);
  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v13 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = v12;

    uint64_t v11 = *(void **)(a1 + 120);
  }

  objc_msgSend(v11, "addObject:", v10, (void)v15);
  return v10;
}

- (uint64_t)parseKCDataExclavesContainer:(void *)a3 exclaveInfo:(uint64_t)a4 primaryDataIsKPerf:
{
  uint64_t v340 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  int cache = (int)a2->isa->cache;
  if (cache != 2377)
  {
    int v237 = *__error();
    _sa_logt();
    int32_t v238 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v238, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)statfs buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = cache;
      _os_log_error_impl(&dword_186C92000, v238, OS_LOG_TYPE_ERROR, "bad container type %u", buf, 8u);
    }

    *__error() = v237;
    _SASetCrashLogMessage(5782, "bad container type %u", v239, v240, v241, v242, v243, v244, cache);
    _os_crash();
    __break(1u);
LABEL_433:
    int v245 = *__error();
    _sa_logt();
    v246 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)statfs buf = v304;
      *(_DWORD *)&uint8_t buf[4] = cache;
      _os_log_error_impl(&dword_186C92000, v246, OS_LOG_TYPE_ERROR, "bad container type %u", buf, 8u);
    }

    *__error() = v245;
    _SASetCrashLogMessage(6224, "bad container type %u", v247, v248, v249, v250, v251, v252, cache);
    _os_crash();
    __break(1u);
    goto LABEL_436;
  }

  id v9 = v7;
  uint64_t v315 = a4;
  uint64_t v294 = a1;
  uint64_t superclass = (uint64_t)a2->isa->superclass;
  uint64_t v11 = 0x189603000uLL;
  id v295 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v293 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v12 = objc_alloc_init(MEMORY[0x189603FC8]);
  v292 = v12;
  __int128 v13 = a2->superclass;
  __int128 v14 = (char *)a2->isa + HIDWORD(a2->isa->isa);
  __int128 v15 = v14 + 16;
  a2->isa = (__objc2_class *)(v14 + 16);
  __int128 v16 = v14 + 32;
  unint64_t v17 = 0x189607000uLL;
  __int128 v18 = &off_186D74000;
LABEL_89:
  int v304 = 67109120;
  uint64_t v85 = *((void *)v18 + 286);
  while (2)
  {
    if (&v16[v15[1]] > (char *)v13 || *v15 == -242132755)
    {
LABEL_3:
      id v306 = objc_alloc_init(*(Class *)(v11 + 4040));
      __int128 v327 = 0u;
      __int128 v328 = 0u;
      __int128 v329 = 0u;
      __int128 v330 = 0u;
      [v292 allValues];
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v285 = [obj countByEnumeratingWithState:&v327 objects:v333 count:16];
      if (!v285) {
        goto LABEL_85;
      }
      uint64_t v20 = *(void *)v328;
      uint64_t v284 = v315 << 63 >> 63;
      uint64_t v21 = *((void *)v18 + 286);
      __int128 v277 = v9;
      uint64_t v282 = *(void *)v328;
LABEL_5:
      uint64_t v22 = 0LL;
LABEL_6:
      if (*(void *)v328 != v20)
      {
        uint64_t v23 = v22;
        objc_enumerationMutation(obj);
        uint64_t v22 = v23;
      }

      uint64_t v287 = v22;
      id Property = *(void ***)(*((void *)&v327 + 1) + 8 * v22);
      __int128 v323 = 0u;
      __int128 v324 = 0u;
      __int128 v325 = 0u;
      __int128 v326 = 0u;
      context = Property;
      if (Property) {
        id Property = (void **)objc_getProperty(Property, v19, 16LL, 1);
      }
      __int16 v25 = Property;
      uint64_t v305 = [v25 countByEnumeratingWithState:&v323 objects:v332 count:16];
      if (!v305)
      {
LABEL_82:

        goto LABEL_83;
      }

      uint64_t v299 = *(void *)v324;
      v303 = 0LL;
      v296 = v25;
LABEL_12:
      uint64_t v26 = 0LL;
LABEL_13:
      if (*(void *)v324 != v299) {
        objc_enumerationMutation(v25);
      }
      a2 = *(__objc2_class **)(*((void *)&v323 + 1) + 8 * v26);
      isa = a2->superclass->isa;
      [*(id *)(v17 + 2408) numberWithUnsignedLongLong:isa];
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v306 objectForKeyedSubscript:v28];
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        [*(id *)(v17 + 2408) numberWithUnsignedLongLong:isa];
        id v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v295 objectForKeyedSubscript:v29];
        uint64_t v30 = (uint64_t **)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          v310 = a2;
          uint64_t v316 = v26;
          [*(id *)(v17 + 2408) numberWithUnsignedLongLong:v30[1][2]];
          SEL v31 = (void *)objc_claimAutoreleasedReturnValue();
          [v293 objectForKeyedSubscript:v31];
          objc_super v32 = (void *)objc_claimAutoreleasedReturnValue();

          id v33 = v30;
          id v34 = v32;
          memset(v337, 0, sizeof(v337));
          __int128 v338 = 0u;
          __int128 v339 = 0u;
          id v35 = *(id *)(v294 + 120);
          uint64_t v36 = [v35 countByEnumeratingWithState:v337 objects:buf count:16];
          if (!v36) {
            goto LABEL_25;
          }
          uint64_t v37 = v36;
          uint64_t v38 = **(void **)&v337[16];
          do
          {
            for (uint64_t i = 0LL; i != v37; ++i)
            {
              if (**(void **)&v337[16] != v38) {
                objc_enumerationMutation(v35);
              }
              id v40 = *(void **)(*(void *)&v337[8] + 8 * i);
              if ([v40 identifier] == *v30[1])
              {
                -[SAExclave fillInName:textLayout:]((uint64_t)v40, v33[2], v34);
                id v9 = v40;
                goto LABEL_30;
              }
            }

            uint64_t v37 = [v35 countByEnumeratingWithState:v337 objects:buf count:16];
          }

          while (v37);
LABEL_25:

          id v9 = -[SAExclave initWithKCData:name:textLayout:](objc_alloc(&OBJC_CLASS___SAExclave), v30[1], v33[2], v34);
          uint64_t v41 = *(void **)(v294 + 120);
          if (!v41)
          {
            id v42 = objc_alloc_init(MEMORY[0x189603FA8]);
            v43 = *(void **)(v294 + 120);
            *(void *)(v294 + 120) = v42;

            uint64_t v41 = *(void **)(v294 + 120);
          }

          [v41 addObject:v9];
          uint64_t v44 = -[SASampleStore lastTaskWithPid:]((void *)v294, 0LL);
          if (v44)
          {
            id v35 = (id)v44;
          }

          else
          {
            +[SATask taskWithPid:uniquePid:name:sharedCache:]((uint64_t)&OBJC_CLASS___SATask, 0LL, v284, 0LL, 0LL);
            id v35 = (id)objc_claimAutoreleasedReturnValue();
            -[SASampleStore addTask:](v294, v35);
          }

- (uint64_t)addKCDataThreadV4:(uint64_t)a3 threadV2:(uint64_t)a4 deltaThreadV3:(uint64_t)a5 deltaThreadV2:(void *)a6 timestamp:(unint64_t)a7 sampleIndex:(void *)a8 stack:(void *)a9 threadExclavesInfo:(char *)a10 threadName:(id *)a11 dispatchQueueLabel:(uint64_t)a12 waitInfo:(void *)a13 waitInfoPortLabelInfo:(uint64_t)a14 turnstileInfo:(void *)a15 turnstileInfoPortLabelInfo:(uint64_t *)a16 instructionCycles:(void *)a17 task:(void *)a18 kernelTask:(char)a19 taskIsSuspended:
{
  uint64_t v196 = *MEMORY[0x1895F89C0];
  id v190 = a6;
  id v189 = a8;
  id v192 = a9;
  id v25 = a17;
  id v188 = a18;
  int v191 = v25;
  if (!a1)
  {
LABEL_258:
    uint64_t v46 = 0LL;
    uint64_t v51 = v189;
    goto LABEL_251;
  }

  if (a2) {
    uint64_t v26 = a2;
  }
  else {
    uint64_t v26 = a3;
  }
  if (a4) {
    uint64_t v27 = a4;
  }
  else {
    uint64_t v27 = a5;
  }
  if (!a4 && !a2 && !a3 && !a5)
  {
    int v147 = *__error();
    _sa_logt();
    __int128 v148 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)statfs buf = 0;
      _os_log_error_impl(&dword_186C92000, v148, OS_LOG_TYPE_ERROR, "no thread snap", buf, 2u);
    }

    *__error() = v147;
    _SASetCrashLogMessage(3067, "no thread snap", v149, v150, v151, v152, v153, v154, v171);
    _os_crash();
    __break(1u);
LABEL_255:
    int v155 = *__error();
    _sa_logt();
    __int128 v156 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)statfs buf = 136315138;
      uint64_t v195 = (uint64_t)a1;
      _os_log_error_impl( &dword_186C92000,  v156,  OS_LOG_TYPE_ERROR,  "dispatchQueueId 0, but dispatchQueueLabel %s",  buf,  0xCu);
    }

    *__error() = v155;
    _SASetCrashLogMessage( 3347,  "dispatchQueueId 0, but dispatchQueueLabel %s",  v157,  v158,  v159,  v160,  v161,  v162,  (char)a1);
    _os_crash();
    __break(1u);
    goto LABEL_258;
  }

  uint64_t v183 = a3;
  uint64_t v179 = a5;
  if (v26) {
    __int128 v28 = (uint64_t *)v26;
  }
  else {
    __int128 v28 = (uint64_t *)v27;
  }
  uint64_t v29 = [MEMORY[0x189607968] numberWithUnsignedLongLong:*v28];
  [v25 threads];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  id v187 = (void *)v29;
  [v30 objectForKeyedSubscript:v29];
  SEL v31 = (id *)objc_claimAutoreleasedReturnValue();

  __int16 v184 = a1;
  if (!v31)
  {
    +[SAThread threadWithId:]((uint64_t)&OBJC_CLASS___SAThread, *v28);
    objc_super v32 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    id v33 = v32;
    if (v26) {
      uint64_t v34 = v26 + 64;
    }
    else {
      uint64_t v34 = v27 + 16;
    }
    if (v32) {
      v32[16] = *(_BYTE *)(v34 + 1) & 1;
    }
    -[SATask addThread:]((uint64_t)v25, v32);
    if ((*(_BYTE *)(v34 + 1) & 0x20) != 0)
    {
      [v25 mainThread];
      id v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
      {
        if (v33) {
          v33[17] = 1;
        }
        if (v25) {
          objc_setProperty_atomic(v25, v36, v33, 264LL);
        }
      }
    }

    if (![a1[3] count]) {
      goto LABEL_41;
    }
    if (*((_BYTE *)a1 + 223))
    {
      [v25 taskStates];
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)[v38 count] < 2)
      {
        [v25 taskStates];
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
        [v39 firstObject];
        id v40 = (void *)objc_claimAutoreleasedReturnValue();
        [v40 startTimestamp];
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
        int v42 = [v41 lt:v190];

        a1 = v184;
        if (!v42) {
          goto LABEL_41;
        }
      }

      else
      {
      }
    }

    if (*((_BYTE *)a1 + 221))
    {
      int v43 = [v33 isMainThread];
      if (v43) {
        SEL v31 = 0LL;
      }
      else {
        SEL v31 = (id *)v33;
      }
      if (!v33 || (v43 & 1) == 0) {
        goto LABEL_42;
      }
    }

    else if (!v33)
    {
      SEL v31 = 0LL;
      goto LABEL_42;
    }

    objc_setProperty_atomic(v33, v37, v190, 32LL);
LABEL_41:
    SEL v31 = (id *)v33;
  }

- (void)addProcessInfoFromTailspin:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectForKeyedSubscript:0x189F65598];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASampleStore lastTaskWithPid:](self, [v26 intValue]);
  uint64_t v5 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    [v4 objectForKeyedSubscript:0x189F655B8];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      id v23 = v4;
      else {
        int v7 = CSArchitectureIsArm64() ^ 1;
      }
      char v24 = v7;
      id v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v6, "count"));
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      uint64_t v22 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v28;
        do
        {
          uint64_t v12 = 0LL;
          do
          {
            if (*(void *)v28 != v11) {
              objc_enumerationMutation(v8);
            }
            __int128 v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
            objc_msgSend(v8, "objectForKeyedSubscript:", v13, v22);
            __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
            uuidForString(v13);
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              +[SABinary binaryWithUUID:absolutePath:](&OBJC_CLASS___SABinary, "binaryWithUUID:absolutePath:", v15, 0LL);
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[SABinary segmentWithCleanName:](v16, @"__TEXT_EXEC");
              unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
              char v18 = v24;
              if (v17) {
                char v18 = 1;
              }
              if ((v18 & 1) == 0)
              {
                if (addProcessInfoFromTailspin__onceToken != -1) {
                  dispatch_once(&addProcessInfoFromTailspin__onceToken, &__block_literal_global_206);
                }
                +[SASegment segmentWithBinary:name:length:]( (uint64_t)&OBJC_CLASS___SASegment,  v16,  @"__TEXT_EXEC",  0LL);
                unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[SABinary addSegment:](v16, v17);
              }

              uint64_t v19 = [v14 unsignedLongLongValue];
              BOOL v20 = [v26 intValue] == 0;
              if (v17) {
                +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:]( &OBJC_CLASS___SABinaryLoadInfo,  v17,  v19,  v20,  0LL);
              }
              else {
                +[SABinaryLoadInfo binaryLoadInfoWithBinary:loadAddress:isInKernelAddressSpace:exclave:]( (uint64_t)&OBJC_CLASS___SABinaryLoadInfo,  v16,  v19,  v20,  0LL);
              }
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
              [v25 addObject:v21];
            }

            ++v12;
          }

          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }

        while (v10);
      }

      -[SATask addImageInfos:]((uint64_t)v5, v25);
      v5[73] = 1;

      id v4 = v23;
      uint64_t v6 = v22;
    }
  }
}

size_t __44__SASampleStore_addProcessInfoFromTailspin___block_invoke()
{
  return fwrite( "Assuming 64-bit arm kernel binaries all have TEXT_EXEC segments...\n",  0x43uLL,  1uLL,  (FILE *)*MEMORY[0x1895F89D0]);
}

- (unint64_t)addKCDataStackshots:(id)a3 createSeparateSamplePerStackshot:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  int v7 = 0LL;
  unint64_t v8 = 0LL;
  unint64_t v9 = 0LL;
  locatiouint64_t n = (id *)&self->_startTime;
  p_endTime = (id *)&self->_endTime;
  p_timeWhenTransitionedToSamplingAllThreads = (id *)&self->_timeWhenTransitionedToSamplingAllThreads;
  p_timeWhenTransitionedToSamplingAllProcesses = (id *)&self->_timeWhenTransitionedToSamplingAllProcesses;
  unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)&__int128 v11 = 134218242LL;
  __int128 v23 = v11;
  __int128 v28 = self;
  do
  {
    if (v8 >= objc_msgSend(v6, "length", v23)) {
      break;
    }
    if (v4 || !v7)
    {
      uint64_t v12 = +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:",  0LL,  0LL,  0.0,  0.0,  0.0);

      if (-[SASampleStore dataStyle](self, "dataStyle") == 1) {
        unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v10 = -[NSMutableArray count](self->_sampleTimestamps, "count");
      }
      int v7 = (void *)v12;
    }

    id v13 = objc_alloc(MEMORY[0x189603F48]);
    id v14 = v6;
    __int128 v15 = (void *)objc_msgSend( v13,  "initWithBytesNoCopy:length:freeWhenDone:",  objc_msgSend(v14, "bytes") + v8,  objc_msgSend(v14, "length") - v8,  0);
    uint64_t v16 = -[SASampleStore _addKCDataStackshot:timestamp:sampleIndex:shouldSkipSampleOut:primaryDataIsKPerf:addStaticInfoOnly:]( (uint64_t)self,  v15,  v7,  v10,  &v30,  0,  0);
    if (!v16 || v30)
    {
      unint64_t v29 = v10;
      int v18 = *__error();
      _sa_logt();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        BOOL v20 = ", and should skip";
        if (!v30) {
          BOOL v20 = "";
        }
        *(_DWORD *)statfs buf = v23;
        uint64_t v32 = v16;
        __int16 v33 = 2080;
        uint64_t v34 = v20;
        _os_log_debug_impl(&dword_186C92000, v19, OS_LOG_TYPE_DEBUG, "KCData stackshot parsed %ld bytes%s", buf, 0x16u);
      }

      *__error() = v18;
      self = v28;
      unint64_t v10 = v29;
    }

    else
    {
      ++v9;
      if (v4)
      {
        if (-[SASampleStore dataStyle](self, "dataStyle") == 1)
        {
          startTime = self->_startTime;
          ++self->_numSamples;
          if (!startTime) {
            objc_storeStrong(location, v7);
          }
          objc_storeStrong(p_endTime, v7);
        }

        else
        {
          -[NSMutableArray addObject:](self->_sampleTimestamps, "addObject:", v7);
        }

        if (self->_nextSampleIsFirstSamplingAllThreads)
        {
          objc_storeStrong(p_timeWhenTransitionedToSamplingAllThreads, v7);
          self->_nextSampleIsFirstSamplingAllThreads = 0;
        }

        if (self->_nextSampleIsFirstSamplingAllProcesses)
        {
          objc_storeStrong(p_timeWhenTransitionedToSamplingAllProcesses, v7);
          self->_nextSampleIsFirstSamplingAllProcesses = 0;
        }
      }
    }

    v8 += v16;
  }

  while (v16);
  if (!v4 && v9)
  {
    if (-[SASampleStore dataStyle](self, "dataStyle") != 1)
    {
      -[NSMutableArray addObject:](self->_sampleTimestamps, "addObject:", v7);
      uint64_t v21 = self->_startTime;
      ++self->_numSamples;
      if (!v21) {
        objc_storeStrong(location, v7);
      }
      objc_storeStrong(p_endTime, v7);
    }

    if (self->_nextSampleIsFirstSamplingAllThreads)
    {
      objc_storeStrong(p_timeWhenTransitionedToSamplingAllThreads, v7);
      self->_nextSampleIsFirstSamplingAllThreads = 0;
    }

    if (self->_nextSampleIsFirstSamplingAllProcesses)
    {
      objc_storeStrong(p_timeWhenTransitionedToSamplingAllProcesses, v7);
      self->_nextSampleIsFirstSamplingAllProcesses = 0;
    }
  }

  return v9;
}

- (uint64_t)_addKCDataStackshot:(void *)a3 timestamp:(unint64_t)a4 sampleIndex:(_BYTE *)a5 shouldSkipSampleOut:(unsigned int)a6 primaryDataIsKPerf:(char)a7 addStaticInfoOnly:
{
  uint64_t v337 = *MEMORY[0x1895F89C0];
  id v12 = a2;
  id v13 = a3;
  id v306 = v12;
  if (!a1)
  {
    id v25 = 0LL;
    goto LABEL_19;
  }

  uint64_t v307 = v13;
  if (!v12 || (unint64_t)[v12 length] <= 0xF)
  {
    int v14 = *__error();
    _sa_logt();
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.isa) = 0;
      _os_log_impl(&dword_186C92000, v15, OS_LOG_TYPE_DEFAULT, "WARNING: No buffer", (uint8_t *)&buf, 2u);
    }

- (unint64_t)addKCDataStackshot:(id)a3 returningTimestamp:(id *)a4
{
  id v6 = a3;
  +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:",  0LL,  0LL,  0.0,  0.0,  0.0);
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SASampleStore dataStyle](self, "dataStyle") == 1) {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v8 = -[NSMutableArray count](self->_sampleTimestamps, "count");
  }
  unint64_t v9 = -[SASampleStore _addKCDataStackshot:timestamp:sampleIndex:shouldSkipSampleOut:primaryDataIsKPerf:addStaticInfoOnly:]( (uint64_t)self,  v6,  v7,  v8,  &v13,  0,  0);
  if (v9) {
    BOOL v10 = v13 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    if (-[SASampleStore dataStyle](self, "dataStyle") == 1)
    {
      startTime = self->_startTime;
      ++self->_numSamples;
      if (!startTime) {
        objc_storeStrong((id *)&self->_startTime, v7);
      }
      objc_storeStrong((id *)&self->_endTime, v7);
    }

    else
    {
      -[NSMutableArray addObject:](self->_sampleTimestamps, "addObject:", v7);
    }

    if (self->_nextSampleIsFirstSamplingAllThreads)
    {
      objc_storeStrong((id *)&self->_timeWhenTransitionedToSamplingAllThreads, v7);
      self->_nextSampleIsFirstSamplingAllThreads = 0;
    }

    if (self->_nextSampleIsFirstSamplingAllProcesses)
    {
      objc_storeStrong((id *)&self->_timeWhenTransitionedToSamplingAllProcesses, v7);
      self->_nextSampleIsFirstSamplingAllProcesses = 0;
    }
  }

  if (a4) {
    *a4 = v7;
  }

  return v9;
}

- (unint64_t)addKCDataStackshot:(id)a3
{
  return -[SASampleStore addKCDataStackshot:returningTimestamp:]( self,  "addKCDataStackshot:returningTimestamp:",  a3,  0LL);
}

- (uint64_t)_parseKCDataTaskContainer:(void *)a3 timestampOfSample:(unint64_t)a4 sampleIndex:(void *)a5 sharedCaches:(void *)a6 frameIterator:(uint64_t)a7 primaryDataIsKPerf:(char)a8 addStaticInfoOnly:(void *)a9 taskUniquePidsInThisSample:(void *)a10 taskPidsInThisSample:(void *)a11 importanceDonations:(void *)a12 rPidForJetsamCoalitionId:(os_log_s *)a13 port_label_info_array:(os_log_s *)a14 exclaveInfo:(void *)a15
{
  LOBYTE(v20) = (_BYTE)a11;
  unint64_t v19 = (unint64_t)a12;
  LOBYTE(v21) = (_BYTE)a10;
  uint64_t v549 = *MEMORY[0x1895F89C0];
  uint64_t v22 = a3;
  id v484 = a5;
  id v489 = a6;
  __int128 v23 = a9;
  id v487 = a10;
  id v485 = a11;
  id v486 = a12;
  id v483 = a15;
  LODWORD(a6) = (*a2)[4];
  uint64_t v467 = *((void *)*a2 + 1);
  if ((_DWORD)a6 != 2307 && (_DWORD)a6 != 2353) {
    goto LABEL_643;
  }
  v493 = (os_log_s *)objc_alloc_init(MEMORY[0x189603FE0]);
  id v494 = objc_alloc_init(MEMORY[0x189607838]);
  id v25 = *a2;
  unint64_t v20 = (unint64_t)a2[1];
  uint64_t v530 = 0LL;
  __int128 v536 = 0u;
  __int128 v537 = 0u;
  uint64_t v538 = 0LL;
  uint64_t v26 = v25 + 2;
  uint64_t v481 = (uint64_t)a1;
  newValue = v22;
  int v466 = (int)a6;
  if ((unint64_t)(v25 + 2) > v20
    || (v27 = *((unsigned int *)v25 + 1), unint64_t v19 = (unint64_t)v26 + v27, (unint64_t)v26 + v27 > v20))
  {
    int v28 = *__error();
    _sa_logt();
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
    {
LABEL_6:
      v480 = 0LL;
      v474 = 0LL;
      v477 = 0LL;
      v491 = 0LL;
      v492 = 0LL;
      uint64_t v470 = 0LL;
      v471 = 0LL;
      v495 = 0LL;
      id context = 0LL;
      uint64_t v30 = 0LL;
      uint64_t v21 = 0LL;
      v490 = 0LL;
      LODWORD(self) = 0;
      uint64_t v22 = 0LL;
      v468 = 0LL;
LABEL_7:

      *__error() = v28;
      goto LABEL_8;
    }

    *(_WORD *)__objc2_class buf = 0;
    int v42 = "Bad kcdataiter";
LABEL_36:
    _os_log_error_impl(&dword_186C92000, (os_log_t)v29, OS_LOG_TYPE_ERROR, v42, buf, 2u);
    goto LABEL_6;
  }

  if (*(_DWORD *)v25 != 19)
  {
    int v28 = *__error();
    _sa_logt();
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_WORD *)__objc2_class buf = 0;
    int v42 = "Not a container";
    goto LABEL_36;
  }

  if (v27 <= 3)
  {
    int v28 = *__error();
    _sa_logt();
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_WORD *)__objc2_class buf = 0;
    int v42 = "invalid container";
    goto LABEL_36;
  }

  int v43 = *((_DWORD *)v25 + 4);
  if (v43 != 2307 && v43 != 2353)
  {
    int v28 = *__error();
    _sa_logt();
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_WORD *)__objc2_class buf = 0;
    int v42 = "Not a task container";
    goto LABEL_36;
  }

  unint64_t v44 = v19 + 16;
  if (v19 + 16 > v20)
  {
    v480 = 0LL;
    int v45 = 0LL;
    v491 = 0LL;
    v492 = 0LL;
    uint64_t v470 = 0LL;
    int v46 = 0LL;
    id context = 0LL;
    uint64_t v30 = 0LL;
    uint64_t v21 = 0LL;
    v490 = 0LL;
    LODWORD(self) = 0;
    BOOL v47 = 0LL;
    uint64_t v22 = 0LL;
    v468 = 0LL;
    v477 = 0LL;
LABEL_32:
    v471 = v47;
    v474 = v45;
    v495 = v46;
    int v28 = *__error();
    _sa_logt();
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)__objc2_class buf = 0;
    int v48 = "Hit end of kcdata before end of container";
LABEL_34:
    _os_log_error_impl(&dword_186C92000, (os_log_t)v29, OS_LOG_TYPE_ERROR, v48, buf, 2u);
    goto LABEL_7;
  }

  v480 = 0LL;
  int v45 = 0LL;
  v491 = 0LL;
  v492 = 0LL;
  uint64_t v470 = 0LL;
  int v46 = 0LL;
  id context = 0LL;
  uint64_t v30 = 0LL;
  uint64_t v21 = 0LL;
  v490 = 0LL;
  LODWORD(self) = 0;
  BOOL v47 = 0LL;
  uint64_t v22 = 0LL;
  v468 = 0LL;
  v477 = 0LL;
  BOOL v49 = 0;
  uint64_t v32 = 0LL;
  uint64_t __src = v25[1];
  id v50 = (unsigned __int8 *)&v536 + 8;
  uint64_t v31 = (char *)&v537 + 8;
  p_info = &OBJC_METACLASS___SARecipeState.info;
  uint64_t v34 = &OBJC_METACLASS___SARecipeState.info;
  while (1)
  {
    uint64_t v51 = *(unsigned int *)(v19 + 4);
    if (v44 + v51 > v20) {
      goto LABEL_32;
    }
    int v52 = *(_DWORD *)v19;
    if (*(_DWORD *)v19 == -242132755) {
      goto LABEL_32;
    }
    int v53 = (v52 & 0xFFFFFFF0) == 0x20 ? 17 : *(_DWORD *)v19;
    if (v53 > 2309)
    {
      if (v53 == 2312)
      {
        if ((_DWORD)v51 == 32 && (*(_BYTE *)(v19 + 8) & 0x8F) == 0)
        {
          unsigned int v57 = 24;
          goto LABEL_90;
        }
      }

      else if (v53 == 2310 && (_DWORD)v51 == 112 && (*(_BYTE *)(v19 + 8) & 0x8F) == 0)
      {
        unsigned int v57 = 104;
        goto LABEL_90;
      }
    }

    else
    {
      BOOL v58 = v53 == 17 || v53 == 19;
      unsigned int v57 = *(_DWORD *)(v19 + 4);
      if (v58) {
        goto LABEL_90;
      }
    }

    unsigned int v61 = *(_DWORD *)(v19 + 8) & 0xF;
    BOOL v55 = v51 >= v61;
    unsigned int v57 = v51 - v61;
    if (!v55) {
      unsigned int v57 = 0;
    }
LABEL_90:
    unint64_t v35 = v19 + 16;
    if (!v49) {
      goto LABEL_49;
    }
LABEL_91:
    if (v53 == 2310)
    {
      if ((*(_BYTE *)(v35 + 65) & 0x20) != 0) {
        v480 = *(os_log_s **)v35;
      }
LABEL_96:
      BOOL v49 = 1;
      goto LABEL_97;
    }

    if (v53 != 20) {
      goto LABEL_96;
    }
    BOOL v49 = v32 != *(uint64_t **)(v19 + 8);
LABEL_97:
    unint64_t v19 = v44 + *(unsigned int *)(v19 + 4);
    unint64_t v44 = v19 + 16;
    if (v19 + 16 > v20) {
      goto LABEL_32;
    }
  }

  unint64_t v35 = v19 + 48;
  unsigned int v54 = *(_DWORD *)(v19 + 8) & 0xF;
  BOOL v55 = v51 >= v54;
  int v56 = v51 - v54;
  if (!v55) {
    int v56 = 0;
  }
  unsigned int v57 = v56 - 32;
  if (v49) {
    goto LABEL_91;
  }
LABEL_49:
  if (v53 > 2338)
  {
    if (v53 <= 2351)
    {
      if ((_DWORD)a7) {
        unsigned int v59 = v45;
      }
      else {
        unsigned int v59 = (void *)v35;
      }
      if (v53 == 2346) {
        unsigned int v60 = (unsigned int *)v35;
      }
      else {
        unsigned int v60 = v47;
      }
      if (v53 == 2339) {
        int v45 = v59;
      }
      else {
        BOOL v47 = v60;
      }
      BOOL v49 = 0;
      goto LABEL_97;
    }

    switch(v53)
    {
      case 2352:
        BOOL v49 = 0;
        uint64_t v21 = (void *)v35;
        break;
      case 2368:
        BOOL v49 = 0;
        uint64_t v30 = (uint64_t *)v35;
        break;
      case 2373:
        BOOL v49 = 0;
        LODWORD(self) = *(_DWORD *)v35;
        break;
      default:
        goto LABEL_185;
    }

    goto LABEL_97;
  }

  if (v53 > 2308)
  {
    switch(v53)
    {
      case 2309:
        BOOL v49 = 0;
        id context = (_BYTE *)v35;
        break;
      case 2312:
        if (v57 < 0x28) {
          goto LABEL_104;
        }
        if (p_info[109] != (__objc2_class_ro *)-1LL)
        {
          v497 = v46;
          v476 = v45;
          v447 = v22;
          __s1a = v31;
          v465 = v50;
          v457 = v32;
          uint64_t v121 = v47;
          unint64_t v122 = v35;
          dispatch_once(&qword_18C4B1368, &__block_literal_global_1450);
          unint64_t v35 = v122;
          BOOL v47 = v121;
          uint64_t v34 = (__objc2_class_ro **)(&OBJC_METACLASS___SARecipeState + 32);
          p_info = (__objc2_class_ro **)(&OBJC_METACLASS___SARecipeState + 32);
          uint64_t v32 = v457;
          uint64_t v31 = __s1a;
          id v50 = v465;
          int v45 = v476;
          uint64_t v22 = v447;
          int v46 = v497;
        }

        if ((*((_BYTE *)v34 + 770) & 1) != 0)
        {
LABEL_104:
          v456 = v32;
          __s1b = v31;
          v464 = v50;
          v475 = v45;
          v496 = v46;
          *(void *)&__int128 v536 = *(void *)v35;
          uint64_t v62 = v47;
          uuid_copy(v50, (const unsigned __int8 *)(v35 + 8));
          BOOL v47 = v62;
          uint64_t v34 = (__objc2_class_ro **)(&OBJC_METACLASS___SARecipeState + 32);
          p_info = (__objc2_class_ro **)(&OBJC_METACLASS___SARecipeState + 32);
          uint64_t v32 = v456;
          uint64_t v31 = __s1b;
          id v50 = v464;
          int v45 = v475;
          int v46 = v496;
          BOOL v49 = 0;
          *(void *)__s1b = -1LL;
          *((void *)__s1b + 1) = -1LL;
        }

        else
        {
          BOOL v49 = 0;
          __int128 v68 = *(_OWORD *)v35;
          __int128 v69 = *(_OWORD *)(v35 + 16);
          uint64_t v538 = *(void *)(v35 + 32);
          __int128 v537 = v69;
          __int128 v536 = v68;
        }

        goto LABEL_97;
      case 2337:
        BOOL v49 = 0;
        v477 = *(id **)v35;
        break;
      default:
        goto LABEL_185;
    }

    goto LABEL_97;
  }

  if (v53 != 17)
  {
    if (v53 != 19)
    {
      if (v53 == 20)
      {
        v495 = v46;
        if (*(void *)(v19 + 8) != __src)
        {
          v471 = v47;
          v474 = v45;
          int v28 = *__error();
          _sa_logt();
          id v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR)) {
            goto LABEL_7;
          }
          *(_WORD *)__objc2_class buf = 0;
          int v48 = "Unmatched end container";
          goto LABEL_34;
        }

        LODWORD(v20) = v30 == 0LL;
        BOOL v36 = v21 == 0LL;
        if (context || v30 || v21)
        {
          v471 = v47;
          v474 = v45;
          if (!context)
          {
            int v37 = 1;
            goto LABEL_225;
          }

          int v128 = 0;
          uint64_t v129 = *((unsigned int *)context + 21);
          if (context[88]) {
            int v130 = context + 88;
          }
          else {
            int v130 = 0LL;
          }
          uint64_t v132 = *(void *)context;
          unint64_t v131 = *((void *)context + 1);
          goto LABEL_247;
        }

        int v123 = *__error();
        _sa_logt();
        unint64_t v124 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__objc2_class buf = 134217984;
          *(void *)&uint8_t buf[4] = v467;
          uint64_t v125 = "No task struct for task container %llu, treating as an unknown container";
          unint64_t v126 = v124;
          uint32_t v127 = 12;
          goto LABEL_402;
        }

        goto LABEL_292;
      }

- (uint64_t)_parseKCDataSharedCacheContainer:(void *)a3 sharedCaches:
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  unint64_t v8 = *a2;
  uint64_t v9 = (*a2)[4];
  if ((_DWORD)v9 == 2370)
  {
    BOOL v10 = v7;
    __int128 v11 = a2[1];
    uint64_t v12 = *((void *)v8 + 1);
    char v13 = (char *)v8 + v8[1];
    int v14 = v13 + 16;
    *a2 = (unsigned int *)(v13 + 16);
    uint64_t v15 = v13 + 32;
    objc_super v3 = 0LL;
    while (1)
    {
      if (&v15[v14[1]] > (char *)v11 || *v14 == -242132755)
      {
LABEL_28:
        if (!v3) {
          goto LABEL_45;
        }
        goto LABEL_29;
      }

      id v16 = (void *)MEMORY[0x186E47ACC]();
      KCLogIter(*a2, (unint64_t)a2[1], 0);
      uint64_t v17 = *a2;
      unsigned int v18 = **a2;
      if ((v18 & 0xFFFFFFF0) == 0x20) {
        int v19 = 17;
      }
      else {
        int v19 = **a2;
      }
      switch(v19)
      {
        case 19:
          unint64_t v20 = (unint64_t)a2[1];
          uint64_t v21 = v17 + 4;
          if ((unint64_t)(v17 + 4) > v20
            || (uint64_t v22 = v17[1], (unint64_t)v21 + v22 > v20)
            || ((v18 & 0xFFFFFFF0) != 0x20 ? (BOOL v23 = v18 == 19) : (BOOL v23 = 0),
                v23 ? (BOOL v24 = v22 > 3) : (BOOL v24 = 0),
                !v24))
          {
            int v29 = *__error();
            _sa_logt();
            uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__objc2_class buf = 67109120;
              *(_DWORD *)BOOL v49 = 2370;
              _os_log_error_impl( &dword_186C92000,  v30,  OS_LOG_TYPE_ERROR,  "Error parsing kcdata buffer: subcontainer of container type %u is invalid",  buf,  8u);
            }

            uint64_t v25 = 1LL;
            goto LABEL_36;
          }

          uint64_t v25 = SkipToContainerEnd((int **)a2, 1);
          objc_autoreleasePoolPop(v16);
          if ((_DWORD)v25) {
            goto LABEL_48;
          }
          break;
        case 2371:
          objc_super v3 = v17 + 4;
          break;
        case 20:
          uint64_t v33 = *((void *)v17 + 1);
          if (v12 != v33)
          {
            int v29 = *__error();
            _sa_logt();
            uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__objc2_class buf = 134218240;
              *(void *)BOOL v49 = v12;
              *(_WORD *)&v49[8] = 2048;
              *(void *)id v50 = v33;
              _os_log_error_impl( &dword_186C92000,  v30,  OS_LOG_TYPE_ERROR,  "Container end with wrong ID (%llu != %llu)",  buf,  0x16u);
            }

            uint64_t v25 = 7LL;
LABEL_36:

            *__error() = v29;
            objc_autoreleasePoolPop(v16);
            goto LABEL_48;
          }

          objc_autoreleasePoolPop(v16);
          if (!v3)
          {
LABEL_45:
            int v34 = *__error();
            _sa_logt();
            unint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)__objc2_class buf = 0;
              _os_log_error_impl( &dword_186C92000,  v35,  OS_LOG_TYPE_ERROR,  "no shared cache info at shared cache container end",  buf,  2u);
            }

            uint64_t v25 = 0LL;
            *__error() = v34;
            goto LABEL_48;
          }

void __116__SASampleStore__addKCDataStackshot_timestamp_sampleIndex_shouldSkipSampleOut_primaryDataIsKPerf_addStaticInfoOnly___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t *a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  -[SASampleStore lastTaskWithUniquePid:](*(void **)(a1 + 32), *a3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5)
  {
    [v5 taskStates];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 lastObject];
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_setProperty_atomic(v8, v9, *(id *)(a1 + 40), 40LL);
      v8[7] = *(void *)(a1 + 56);
    }

    [v6 threads];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = MEMORY[0x1895F87A8];
    uint64_t v19 = 3221225472LL;
    unint64_t v20 = __116__SASampleStore__addKCDataStackshot_timestamp_sampleIndex_shouldSkipSampleOut_primaryDataIsKPerf_addStaticInfoOnly___block_invoke_2;
    uint64_t v21 = &unk_189F61678;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 56);
    id v22 = v11;
    uint64_t v23 = v12;
    [v10 enumerateKeysAndObjectsUsingBlock:&v18];
  }

  else
  {
    int v13 = *__error();
    _sa_logt();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *a3;
      *(_DWORD *)__objc2_class buf = 134217984;
      uint64_t v25 = v17;
      _os_log_error_impl( &dword_186C92000,  v14,  OS_LOG_TYPE_ERROR,  "Non-runnable task %llu from stackshot before any regular task struct",  buf,  0xCu);
    }

    *__error() = v13;
  }

  uint64_t v15 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", *a3, v18, v19, v20, v21);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 addObject:v16];
}

void __116__SASampleStore__addKCDataStackshot_timestamp_sampleIndex_shouldSkipSampleOut_primaryDataIsKPerf_addStaticInfoOnly___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v9 = a3;
  [v9 exitTimestamp];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = v9;
  if (!v4)
  {
    [v9 threadStates];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 lastObject];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_setProperty_atomic(v7, v8, *(id *)(a1 + 32), 56LL);
      -[SAThreadState setEndSampleIndex:]((uint64_t)v7, *(void *)(a1 + 40));
    }

    uint64_t v5 = v9;
  }
}

uint64_t __116__SASampleStore__addKCDataStackshot_timestamp_sampleIndex_shouldSkipSampleOut_primaryDataIsKPerf_addStaticInfoOnly___block_invoke_226( uint64_t a1)
{
  return fprintf( (FILE *)*MEMORY[0x1895F89D0],  "Warning: Unable to infer machine architecture from kernel version %s\n",  (const char *)[*(id *)(*(void *)(a1 + 32) + 448) UTF8String]);
}

void __116__SASampleStore__addKCDataStackshot_timestamp_sampleIndex_shouldSkipSampleOut_primaryDataIsKPerf_addStaticInfoOnly___block_invoke_228( uint64_t a1,  void *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __116__SASampleStore__addKCDataStackshot_timestamp_sampleIndex_shouldSkipSampleOut_primaryDataIsKPerf_addStaticInfoOnly___block_invoke_2_229;
  v4[3] = &__block_descriptor_40_e35_v32__0__NSNumber_8__SAThread_16_B24l;
  void v4[4] = *(void *)(a1 + 32);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __116__SASampleStore__addKCDataStackshot_timestamp_sampleIndex_shouldSkipSampleOut_primaryDataIsKPerf_addStaticInfoOnly___block_invoke_2_229( uint64_t a1,  uint64_t a2,  void *a3)
{
  self = a3;
  [self exitTimestamp];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = self;
  if (!v4)
  {
    [self threadStates];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 lastObject];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && (unint64_t)[v7 endSampleIndex] < *(void *)(a1 + 32))
    {
      [v7 endTimestamp];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (self) {
        objc_setProperty_atomic(self, v8, v9, 40LL);
      }
    }

    uint64_t v5 = self;
  }
}

void __116__SASampleStore__addKCDataStackshot_timestamp_sampleIndex_shouldSkipSampleOut_primaryDataIsKPerf_addStaticInfoOnly___block_invoke_3( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v9 = a3;
  [v9 exitTimestamp];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    goto LABEL_3;
  }
  [v9 threadStates];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 lastObject];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 endTimestamp];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
LABEL_3:
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
    unint64_t v8 = *(void **)(v7 + 40);
    if (!v8)
    {
LABEL_6:
      objc_storeStrong((id *)(v7 + 40), v4);
      goto LABEL_7;
    }

    if ([v8 lt:v4])
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
      goto LABEL_6;
    }
  }

BOOL __264__SASampleStore__parseKCDataTaskContainer_timestampOfSample_sampleIndex_sharedCaches_frameIterator_primaryDataIsKPerf_addStaticInfoOnly_taskUniquePidsInThisSample_taskPidsInThisSample_importanceDonations_rPidForJetsamCoalitionId_port_label_info_array_exclaveInfo___block_invoke( uint64_t a1,  unsigned __int8 *__base,  unsigned int *a3)
{
  unsigned int v3 = *a3;
  if (!*a3) {
    return 0LL;
  }
  unint64_t v7 = 0LL;
  unsigned int v8 = 0;
  id v9 = __base + 8;
  do
  {
    uint64_t v10 = *((void *)v9 - 1);
    if (v10)
    {
      if (v7 != v8)
      {
        id v11 = &__base[24 * v8];
        *(void *)id v11 = v10;
        uuid_copy(v11 + 8, v9);
        unsigned int v3 = *a3;
      }

      ++v8;
    }

    ++v7;
    v9 += 24;
  }

  while (v7 < v3);
  if (v3 == v8)
  {
    BOOL v12 = 0LL;
    if (!v8) {
      return v12;
    }
  }

  else
  {
    BOOL v12 = v8 != 0;
    *a3 = v8;
    if (!v8) {
      return v12;
    }
  }

  if (!*(_BYTE *)(a1 + 32)) {
    mergesort_b(__base, v8, 0x18uLL, &__block_literal_global_261);
  }
  return v12;
}

uint64_t __264__SASampleStore__parseKCDataTaskContainer_timestampOfSample_sampleIndex_sharedCaches_frameIterator_primaryDataIsKPerf_addStaticInfoOnly_taskUniquePidsInThisSample_taskPidsInThisSample_importanceDonations_rPidForJetsamCoalitionId_port_label_info_array_exclaveInfo___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  if (*a3 <= *a2) {
    unsigned int v3 = 0;
  }
  else {
    unsigned int v3 = -1;
  }
  if (*a3 < *a2) {
    return 1LL;
  }
  else {
    return v3;
  }
}

uint64_t __264__SASampleStore__parseKCDataTaskContainer_timestampOfSample_sampleIndex_sharedCaches_frameIterator_primaryDataIsKPerf_addStaticInfoOnly_taskUniquePidsInThisSample_taskPidsInThisSample_importanceDonations_rPidForJetsamCoalitionId_port_label_info_array_exclaveInfo___block_invoke_266( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  unint64_t v3 = *(void *)(a3 + 8);
  unint64_t v4 = *(void *)(a2 + 8);
  BOOL v5 = v3 >= v4;
  if (v3 <= v4) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = -1;
  }
  if (v5) {
    return v6;
  }
  else {
    return 1LL;
  }
}

- (id)addressTranslationsForPid:(uint64_t)a1
{
  if (a1)
  {
    unint64_t v4 = *(void **)(a1 + 304);
    [MEMORY[0x189607968] numberWithInt:a2];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v5];
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      if (!*(void *)(a1 + 304))
      {
        uint64_t v7 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:1];
        unsigned int v8 = *(void **)(a1 + 304);
        *(void *)(a1 + 304) = v7;
      }

      unsigned int v6 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:8];
      id v9 = *(void **)(a1 + 304);
      [MEMORY[0x189607968] numberWithInt:a2];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setObject:v6 forKeyedSubscript:v10];
    }
  }

  else
  {
    unsigned int v6 = 0LL;
  }

  return v6;
}

void __264__SASampleStore__parseKCDataTaskContainer_timestampOfSample_sampleIndex_sharedCaches_frameIterator_primaryDataIsKPerf_addStaticInfoOnly_taskUniquePidsInThisSample_taskPidsInThisSample_importanceDonations_rPidForJetsamCoalitionId_port_label_info_array_exclaveInfo___block_invoke_275( uint64_t a1,  uint64_t a2,  uint64_t *a3)
{
  if (*(_DWORD *)(a1 + 128) <= 0x3Fu) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = (uint64_t)a3;
  }
  uint64_t v6 = *a3;
  if (!*(_BYTE *)(*(void *)(a1 + 32) + 220LL) || v6 == *(void *)(a1 + 80))
  {
    uint64_t v7 = *(unsigned int *)(a1 + 132);
    if ((_DWORD)v7)
    {
      uint64_t v8 = *(void *)(a1 + 88);
      while (*(void *)(v8 + 8) != v6)
      {
        v8 += 31LL;
        if (!--v7) {
          goto LABEL_10;
        }
      }

      if (*(_WORD *)(v8 + 25))
      {
        uint64_t v17 = *(unsigned int *)(a1 + 96);
        if ((_DWORD)v17)
        {
          id v9 = *(void **)(a1 + 104);
          while (*(unsigned __int16 *)*v9 != *(unsigned __int16 *)(v8 + 25))
          {
            v9 += 2;
            if (!--v17) {
              goto LABEL_11;
            }
          }

void __264__SASampleStore__parseKCDataTaskContainer_timestampOfSample_sampleIndex_sharedCaches_frameIterator_primaryDataIsKPerf_addStaticInfoOnly_taskUniquePidsInThisSample_taskPidsInThisSample_importanceDonations_rPidForJetsamCoalitionId_port_label_info_array_exclaveInfo___block_invoke_279( uint64_t a1,  uint64_t a2,  uint64_t *a3)
{
  uint64_t v5 = *a3;
  if (!*(_BYTE *)(*(void *)(a1 + 32) + 220LL) || v5 == *(void *)(a1 + 72))
  {
    uint64_t v6 = *(void **)(a1 + 40);
    [MEMORY[0x189607968] numberWithUnsignedLongLong:v5];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 addObject:v7];

    [*(id *)(a1 + 48) threads];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithUnsignedLongLong:*a3];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:v9];
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = v18;
    if (v18)
    {
      [v18 threadStates];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 lastObject];
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_setProperty_atomic(v12, v13, *(id *)(a1 + 56), 56LL);
        -[SAThreadState setEndSampleIndex:]((uint64_t)v12, *(void *)(a1 + 80));
        [v12 dispatchQueue];
        int v14 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = [v14 identifier];

        if (v15)
        {
          id v16 = *(void **)(a1 + 64);
          [MEMORY[0x189607968] numberWithUnsignedLongLong:v15];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 addObject:v17];
        }
      }

      uint64_t v10 = v18;
    }
  }

- (uint64_t)_parseKCDataThreadContainer:(void *)a3 timestampOfSample:(unint64_t)a4 sampleIndex:(void *)a5 task:(void *)a6 kernelTask:(void *)a7 frameIterator:(os_log_s *)a8 mainThreadID:(char)a9 primaryDataIsKPerf:(char)a10 addStaticInfoOnly:(os_log_s *)a11 threadIDsInThisTaskThisSample:(void *)a12 dispatchQueueIDsInThisTaskThisSample:(char)a13 taskIsSuspended:(uint64_t)a14 waitInfos:(unsigned int)a15 numWaitInfos:(uint64_t)a16 turnstileInfos:(unsigned int)a17 numTurnstileInfos:(int)a18 port_label_info_array:(unsigned int)a19 exclaveInfo:(void *)a20
{
  uint64_t v27 = a11;
  uint64_t v246 = *MEMORY[0x1895F89C0];
  id v28 = a3;
  id v29 = a5;
  char v234 = a6;
  id v30 = a7;
  unint64_t v31 = a11;
  uint64_t v32 = a12;
  id v235 = a21;
  uint64_t v33 = *a2;
  uint64_t v34 = (*a2)[4];
  if ((_DWORD)v34 != 2308)
  {
    unint64_t v31 = *__error();
    _sa_logt();
    uint64_t v149 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__objc2_class buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v34;
      _os_log_error_impl(&dword_186C92000, v149, OS_LOG_TYPE_ERROR, "bad container type %u", buf, 8u);
    }

    *__error() = v31;
    _SASetCrashLogMessage(5056, "bad container type %u", v189, v190, v191, v192, v193, v194, v34);
    _os_crash();
    __break(1u);
    goto LABEL_320;
  }

  unint64_t v35 = a2[1];
  uint64_t v27 = (os_log_s *)*((void *)v33 + 1);
  if (a1[220] && v27 != a8)
  {
    uint64_t v36 = SkipToContainerEnd(a2, 1);
    a1 = v234;
    goto LABEL_313;
  }

  id v227 = v32;
  v228 = v28;
  self = v29;
  uint64_t v37 = (char *)v33 + v33[1];
  uint64_t v38 = v37 + 16;
  *a2 = (int *)(v37 + 16);
  uint64_t v39 = v37 + 32;
  char v219 = a1;
  if (v39 > (char *)v35)
  {
    uint64_t v230 = 0LL;
    uint64_t v40 = 0LL;
    uint64_t v41 = 0LL;
    uint64_t v233 = 0LL;
    char v218 = 0;
    uint64_t v220 = 0LL;
    uint64_t v221 = 0LL;
    int v224 = 0LL;
    char v225 = 0LL;
LABEL_7:
    uint64_t v42 = v230;
    if (!(v40 | v230) && !v233 && !v41)
    {
      int v43 = *__error();
      _sa_logt();
      uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      a1 = v234;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__objc2_class buf = 0;
        _os_log_error_impl(&dword_186C92000, v44, OS_LOG_TYPE_ERROR, "no thread_snap at thread container end", buf, 2u);
      }

      *__error() = v43;
      [v30 clearThreadData];
      uint64_t v36 = 2LL;
      uint64_t v32 = v227;
      id v28 = v228;
      id v29 = self;
      goto LABEL_313;
    }

    uint64_t v223 = (void *)v31;
    unint64_t v114 = (uint64_t *)v233;
    uint64_t v217 = (uint64_t)v41;
    if (!v233) {
      unint64_t v114 = v41;
    }
    if (v230) {
      unint64_t v114 = (uint64_t *)v230;
    }
    if (v40) {
      unint64_t v114 = (uint64_t *)v40;
    }
    uint64_t v115 = *v114;
    if (v225)
    {
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)v225];
      int v116 = (void *)objc_claimAutoreleasedReturnValue();
      [v235 objectForKeyedSubscript:v116];
      unsigned int v117 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v118 = objc_alloc(&OBJC_CLASS___SAThreadExclavesInfo);
      if (v118)
      {
        int v119 = -[SAThreadExclavesInfo initWithCallstacks:](v118, v117);
        __int128 v120 = v119;
        if (v119) {
          *((_DWORD *)v119 + 2) = v225[3];
        }
      }

      else
      {
        __int128 v120 = 0LL;
      }
    }

    else
    {
      __int128 v120 = 0LL;
    }

    int v121 = [v30 exclaveInsertionIndex];
    int v226 = v120;
    if (!a9) {
      goto LABEL_277;
    }
    if (v40 | v230)
    {
      if (!v40 || buf == (uint8_t *)v40)
      {
        if (v230 && buf != (uint8_t *)v230)
        {
          __int128 v244 = 0u;
          __int128 v245 = 0u;
          __int128 v242 = 0u;
          __int128 v243 = 0u;
          __int128 v240 = 0u;
          __int128 v241 = 0u;
          memset(buf, 0, sizeof(buf));
          memmove(buf, (const void *)v230, 0x68uLL);
          uint64_t v42 = (uint64_t)buf;
        }
      }

      else
      {
        memmove(buf, (const void *)v40, 0x80uLL);
        uint64_t v40 = (uint64_t)buf;
      }

      v245 &= 0xE000000u;
      *(void *)&__int128 v240 = 0LL;
      *(void *)&__int128 v242 = v242 & 0x1EFFC;
      *((void *)&v243 + 1) = DWORD2(v243) & 0xFFFFFFFB;
      if (v40 | v42)
      {
        if (v40) {
          uint64_t v122 = v40;
        }
        else {
          uint64_t v122 = v42;
        }
        uint64_t v123 = *(void *)(v122 + 40);
        if (v221)
        {
          [self dispatchQueues];
          unint64_t v124 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189607968] numberWithUnsignedLongLong:v123];
          uint64_t v125 = (void *)objc_claimAutoreleasedReturnValue();
          [v124 objectForKeyedSubscript:v125];
          unint64_t v126 = (void *)objc_claimAutoreleasedReturnValue();

          if (v126)
          {
            [v126 dispatchQueueLabel];
            uint32_t v127 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v127)
            {
              SANSStringForCString(v221);
              uint64_t v129 = (void *)objc_claimAutoreleasedReturnValue();
              if (v129) {
                objc_setProperty_atomic_copy(v126, v128, v129, 32LL);
              }
            }
          }
        }

        uint64_t v231 = v123;
        [self threads];
        int v130 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607968] numberWithUnsignedLongLong:v115];
        unint64_t v131 = (void *)objc_claimAutoreleasedReturnValue();
        [v130 objectForKeyedSubscript:v131];
        uint64_t v132 = (_BYTE *)objc_claimAutoreleasedReturnValue();

        if (!v132 && (a10 & 1) == 0)
        {
          +[SAThread threadWithId:]((uint64_t)&OBJC_CLASS___SAThread, v115);
          uint64_t v132 = (_BYTE *)objc_claimAutoreleasedReturnValue();
          uint64_t v133 = (uint64_t)self;
          [self execTimestamp];
          unsigned int v134 = (void *)objc_claimAutoreleasedReturnValue();

          if (v134)
          {
            [self execTimestamp];
            uint64_t v136 = (void *)objc_claimAutoreleasedReturnValue();
            if (v132) {
              objc_setProperty_atomic(v132, v135, v136, 32LL);
            }

            uint64_t v133 = (uint64_t)self;
          }

          -[SATask addThread:](v133, v132);
        }

        if (v40) {
          uint64_t v137 = v40;
        }
        else {
          uint64_t v137 = v42;
        }
        unint64_t v138 = *(void *)(v137 + 64);
        if (v132)
        {
          if ((v138 & 0x2000) != 0)
          {
            [self mainThread];
            unsigned int v139 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v139)
            {
              v132[17] = 1;
              if (self) {
                objc_setProperty_atomic(self, v140, v132, 264LL);
              }
            }
          }
        }

        if (a10)
        {
          [v30 clearThreadData];

          uint64_t v32 = v227;
          id v28 = v228;
          id v29 = self;
          a1 = v234;
          unint64_t v31 = (unint64_t)v223;
          int v141 = v226;
LABEL_312:

          uint64_t v36 = 0LL;
          goto LABEL_313;
        }

        if (v40) {
          uint64_t v142 = v40;
        }
        else {
          uint64_t v142 = v42;
        }
        [v30 setContinuation:*(void *)(v142 + 16)];
        BOOL v143 = (v138 & 0x8080) != 0
            || [self pid] && !objc_msgSend(v30, "hasUserStack");
        [v30 setIsUserStackTruncated:v143];
        [v30 setIsSwiftAsyncStackTruncated:(v138 >> 16) & 1];
        [v30 setIsKernelStackTruncated:(v138 >> 14) & 1];
        if ([self pid])
        {
          id v236 = 0LL;
          -[SATask leafFrameAfterAddingStack:leafOfCRootFramesReplacedBySwiftAsync:]((uint64_t)self, v30, &v236);
          __int128 v144 = (void *)objc_claimAutoreleasedReturnValue();
          id v145 = v236;
        }

        else
        {
          __int128 v144 = 0LL;
          id v145 = 0LL;
        }

        -[SATask leafFrameAfterAddingStack:leafOfCRootFramesReplacedBySwiftAsync:]((uint64_t)v234, v30, 0LL);
        int v146 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          int v147 = *((_DWORD *)v219 + 50);
          LOBYTE(v148) = 125;
          switch(v147)
          {
            case 0:
              break;
            case 4:
            case 5:
            case 6:
            case 7:
              int v148 = (*(_DWORD *)(v40 + 112) >> 25) & 7;
              break;
            default:
              SAComplainAboutUnknownThreadPolicyVersion(v147);
              goto LABEL_247;
          }
        }

        else
        {
LABEL_247:
          LOBYTE(v148) = 125;
        }

        if (v145) {
          uint64_t v150 = -1LL;
        }
        else {
          uint64_t v150 = 0LL;
        }
        if (a4)
        {
          uint64_t v214 = v150;
          uint64_t v216 = v145;
          uint64_t v151 = 0LL;
          uint64_t v152 = a4 - 1;
          if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v152 = 0x7FFFFFFFFFFFFFFFLL;
          }
          unint64_t v215 = v152;
          if (v40) {
            uint64_t v153 = v40;
          }
          else {
            uint64_t v153 = v42;
          }
          uint64_t v154 = *((void *)v219 + 23);
          if ((_DWORD)v154)
          {
            uint64_t v155 = 0LL;
            if (HIDWORD(v154))
            {
              uint64_t v151 = *(void *)(v153 + 56);
              if ((_DWORD)v154 == HIDWORD(v154))
              {
                if (v40) {
                  uint64_t v156 = v40;
                }
                else {
                  uint64_t v156 = v42;
                }
                uint64_t v155 = *(void *)(v156 + 48);
              }

              else
              {
                uint64_t v151 = __udivti3();
                uint64_t v155 = __udivti3();
              }
            }
          }

          else
          {
            uint64_t v155 = 0LL;
          }

          if (v40) {
            uint64_t v157 = v40;
          }
          else {
            uint64_t v157 = v42;
          }
          int v158 = *(__int16 *)(v157 + 96);
          int v159 = *(__int16 *)(v157 + 98);
          int v160 = *(_DWORD *)(v157 + 88);
          char v161 = *(_BYTE *)(v157 + 100);
          char v162 = *(_BYTE *)(v157 + 101);
          char v163 = *(_BYTE *)(v157 + 102);
          if (v224)
          {
            uint64_t v164 = *v224;
            uint64_t v165 = v224[1];
          }

          else
          {
            uint64_t v164 = 0LL;
            uint64_t v165 = 0LL;
          }

          if (v40) {
            uint64_t v166 = v40;
          }
          else {
            uint64_t v166 = v42;
          }
          uint64_t v213 = v151;
          id v145 = v216;
          -[SASampleStore backfillThread:inTask:lastSampleIndex:timestamp:haveName:name:haveDispatchQueueId:dispatchQueueId:dispatchQueueLabel:leafKernelFrame:hasExclaveInKernelStack:haveUserStack:leafUserFrame:swiftTaskId:leafOfCRootFramesReplacedBySwiftAsync:threadExclavesInfo:haveSched:systemCpuTimeNs:userCpuTimeNs:basePriority:scheduledPriority:state:threadQos:threadRequestedQos:threadRequestedQosOverride:threadQosPromote:haveCycIns:instructions:cycles:haveSnap:ioTier:isIOPassive:isDarwinBG:isSuspended:isGlobalForcedIdle:isIdleWorkQueue:lastMadeRunnableTime:isOnCore:isOnCoreForLastSampleIndex:cpuNum:]( v219,  v132,  self,  v215,  v228,  v218 & 1,  v220,  1,  v231,  v221,  v146,  v226 != 0LL,  1,  v144,  v214,  v216,  v226,  1,  v213,  v155,  v158,  v159,  v160,  v161,  v162,  v163,  v148,  v224 != 0LL,  v164,  v165,  1,  *(_BYTE *)(v166 + 103),  (*(_DWORD *)(v137 + 64) & 0x20) != 0,  (*(_DWORD *)(v137 + 64) & 0x10) != 0,  a13 | ((*(_DWORD *)(v137 + 64) & 0x40u) >> 6),  BYTE1(*(_DWORD *)(v137 + 64)) & 1,  0,  0LL,  0,  0,  0xFFFFFFFF);
        }

LABEL_277:
        uint64_t v167 = 0LL;
        unsigned int v169 = a19;
        unsigned int v168 = a20;
        if (a14)
        {
          uint64_t v170 = a15;
          unsigned int v171 = 0LL;
          if (a15)
          {
            uint64_t v167 = a14;
            while (*(void *)(v167 + 8) != v115)
            {
              v167 += 31LL;
              if (!--v170)
              {
                uint64_t v167 = 0LL;
LABEL_291:
                unsigned int v171 = 0LL;
                goto LABEL_293;
              }
            }

            int v172 = *(__int16 *)(v167 + 25);
            if (!*(_WORD *)(v167 + 25)) {
              goto LABEL_291;
            }
            if (a19)
            {
              uint64_t v173 = a19;
              unsigned int v171 = a20;
              while (*(unsigned __int16 *)*v171 != (unsigned __int16)v172)
              {
                v171 += 2;
                if (!--v173) {
                  goto LABEL_288;
                }
              }
            }

            else
            {
LABEL_288:
              int v174 = *__error();
              _sa_logt();
              uint64_t v175 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v175, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)int v237 = 67109120;
                int v238 = v172;
                _os_log_error_impl(&dword_186C92000, v175, OS_LOG_TYPE_ERROR, "No port label info for id %d", v237, 8u);
              }

              unsigned int v171 = 0LL;
              *__error() = v174;
              unsigned int v168 = a20;
              unsigned int v169 = a19;
            }
          }
        }

        else
        {
          unsigned int v171 = 0LL;
        }

BOOL __77__SASampleStore_parseKCDataExclavesContainer_exclaveInfo_primaryDataIsKPerf___block_invoke( uint64_t a1,  void *a2,  _BYTE *a3)
{
  uint64_t v5 = [a2 address];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5 == v6) {
    *a3 = 1;
  }
  return v5 == v6;
}

BOOL __77__SASampleStore_parseKCDataExclavesContainer_exclaveInfo_primaryDataIsKPerf___block_invoke_301( uint64_t a1,  void *a2,  _BYTE *a3)
{
  uint64_t v5 = [a2 address];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5 == v6) {
    *a3 = 1;
  }
  return v5 == v6;
}

void __65__SASampleStore_parseKCDataExclavesIPCStackContainer_callstacks___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  if (*a3)
  {
    unint64_t v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v3 insertObject:v6 atIndex:0];
  }

  else
  {
    int v4 = *__error();
    _sa_logt();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__objc2_class buf = 0;
      _os_log_error_impl(&dword_186C92000, v5, OS_LOG_TYPE_ERROR, "0 frame in exclave stack, ignoring", buf, 2u);
    }

    *__error() = v4;
  }

void __68__SASampleStore_parseKCDataExclavesTextLayoutContainer_textLayouts___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  unint64_t v3 = *(void **)(a1 + 32);
  int v4 = -[SAKCDataExclaveTextLayoutSegment initWithInfo:](objc_alloc(&OBJC_CLASS___SAKCDataExclaveTextLayoutSegment), a3);
  [v3 addObject:v4];
}

void __44__SASampleStore_resampleTruncatedBacktraces__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v6 lastObject];
  uint64_t v7 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if ([v7 pid] != -1 && objc_msgSend(v7, "pid"))
  {
    [v7 exitTimestamp];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (pid_t v9 = getpid(), v9 == [v7 pid]))
    {

      goto LABEL_6;
    }

    uint64_t v32 = 0LL;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x3032000000LL;
    unint64_t v35 = __Block_byref_object_copy__0;
    uint64_t v36 = __Block_byref_object_dispose__0;
    id v37 = 0LL;
    [v7 threads];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = MEMORY[0x1895F87A8];
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __44__SASampleStore_resampleTruncatedBacktraces__block_invoke_2;
    v31[3] = &unk_189F61FB0;
    v31[4] = &v32;
    [v10 enumerateKeysAndObjectsUsingBlock:v31];

    if (!v33[5])
    {
LABEL_20:
      _Block_object_dispose(&v32, 8);

      goto LABEL_6;
    }

    [v7 binaryLoadInfos];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setUserBinaryLoadInfos:v12];

    if (v7) {
      uint64_t v13 = v7[73] & 1;
    }
    else {
      uint64_t v13 = 0LL;
    }
    [*(id *)(a1 + 32) setAssumeUserBinaryLoadInfosContainMainBinary:v13];
    [v7 sharedCache];
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setSharedCache:v14];

    uint64_t v15 = *(void *)(a1 + 40);
    if (v15)
    {
      uint64_t v16 = *(void *)(v15 + 192);
      if (v7)
      {
LABEL_13:
        objc_copyStruct(&dest, v7 + 288, 8LL, 1, 0);
        if (v16)
        {
          if (dest)
          {
            CSArchitectureGetFamily();
            CSArchitectureGetFamily();
            if ((CSArchitectureMatchesArchitecture() & 1) == 0)
            {
              -[SASampleStore addressTranslationsForPid:](*(void *)(a1 + 40), [v7 pid]);
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
              [*(id *)(a1 + 32) setAddressTranslations:v17];
            }
          }
        }
      }
    }

    else
    {
      uint64_t v16 = 0LL;
      if (v7) {
        goto LABEL_13;
      }
    }

    pid_t v18 = [v7 pid];
    [(id)v33[5] allKeys];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = v11;
    uint64_t v24 = 3221225472LL;
    uint64_t v25 = __44__SASampleStore_resampleTruncatedBacktraces__block_invoke_3;
    uint64_t v26 = &unk_189F61870;
    id v29 = &v32;
    id v27 = *(id *)(a1 + 32);
    unint64_t v20 = v7;
    uint64_t v21 = *(void *)(a1 + 48);
    id v28 = v20;
    uint64_t v30 = v21;
    int v22 = SAResampleThreads(v18, v19, &v23);

    if (!v22) {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    }
    objc_msgSend(*(id *)(a1 + 32), "clearTaskData", v23, v24, v25, v26);

    goto LABEL_20;
  }

void __44__SASampleStore_resampleTruncatedBacktraces__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v28 = a2;
  id v5 = a3;
  uint64_t v7 = v5;
  if (!v5)
  {
    id Property = 0LL;
LABEL_5:
    id v11 = Property;

    if (v11) {
      goto LABEL_6;
    }
    [v7 threadStates];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 lastObject];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 leafUserFrame];
    pid_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
LABEL_8:
      for (uint64_t i = (void *)v9[4]; ; uint64_t i = 0LL)
      {
        id v15 = i;

        if (!v15) {
          break;
        }
        if (v9) {
          uint64_t v16 = (void *)v9[4];
        }
        else {
          uint64_t v16 = 0LL;
        }
        uint64_t v17 = v16;

        pid_t v9 = v17;
        if (v17) {
          goto LABEL_8;
        }
      }

      if ([v9 isTruncatedBacktraceFrame]) {
        goto LABEL_26;
      }
    }

    [v7 threadStates];
    pid_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 lastObject];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 leafOfCRootFramesReplacedBySwiftAsync];
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      pid_t v9 = 0LL;
      goto LABEL_3;
    }

    while (1)
    {
      pid_t v9 = v20;
      uint64_t v21 = v20 ? (void *)v20[4] : 0LL;
      id v22 = v21;

      if (!v22) {
        break;
      }
      if (v9) {
        uint64_t v23 = (void *)v9[4];
      }
      else {
        uint64_t v23 = 0LL;
      }
      unint64_t v20 = v23;
    }

void __44__SASampleStore_resampleTruncatedBacktraces__block_invoke_3( uint64_t a1,  void *a2,  const void *a3,  uint64_t a4)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a2];
  pid_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    int v22 = *__error();
    _sa_logt();
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__objc2_class buf = 134217984;
      uint64_t v32 = a2;
      _os_log_error_impl(&dword_186C92000, v23, OS_LOG_TYPE_ERROR, "bad tid 0x%llx", buf, 0xCu);
    }

    *__error() = v22;
    _SASetCrashLogMessage(6692, "bad tid 0x%llx", v24, v25, v26, v27, v28, v29, (char)a2);
    _os_crash();
    __break(1u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setUserFrames:", calloc(a4, 8uLL));
  memcpy((void *)[*(id *)(a1 + 32) userFrames], a3, 8 * a4);
  [*(id *)(a1 + 32) setNumUserFrames:a4];
  BOOL v12 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v30 = 0LL;
  -[SATask leafFrameAfterAddingStack:leafOfCRootFramesReplacedBySwiftAsync:](v11, v12, &v30);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v30;
  if (v13)
  {
    objc_setProperty_atomic(v10, v14, v13, 48LL);
    objc_setProperty_atomic(v10, v16, v15, 56LL);
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
  }

  else
  {
    int v17 = *__error();
    _sa_logt();
    pid_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 40) debugDescription];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 debugDescription];
      unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      unsigned int v21 = [*(id *)(a1 + 32) numUserFrames];
      *(_DWORD *)__objc2_class buf = 138412802;
      uint64_t v32 = v19;
      __int16 v33 = 2112;
      uint64_t v34 = v20;
      __int16 v35 = 2048;
      uint64_t v36 = v21;
      _os_log_error_impl( &dword_186C92000,  v18,  OS_LOG_TYPE_ERROR,  "%@ %@ unable to add resampled stack with %lu frames",  buf,  0x20u);
    }

    *__error() = v17;
  }

  [*(id *)(a1 + 32) clearThreadData];
}

- (int)addMicrostackshotsFromFile:(id)a3 ofTypes:(unsigned int)a4 inTimeRangeStart:(double)a5 end:(double)a6 onlyPid:(int)a7 onlyTid:(unint64_t)a8
{
  return -[SASampleStore addMicrostackshotsFromFile:ofTypes:inTimeRangeStart:end:onlyPid:onlyTid:statistics:]( self,  "addMicrostackshotsFromFile:ofTypes:inTimeRangeStart:end:onlyPid:onlyTid:statistics:",  a3,  *(void *)&a4,  *(void *)&a7,  a8,  0LL,  a5,  a6);
}

- (int)addMicrostackshotsFromFile:(id)a3 ofTypes:(unsigned int)a4 inTimeRangeStart:(double)a5 end:(double)a6 onlyPid:(int)a7 onlyTid:(unint64_t)a8 statistics:(id)a9
{
  uint64_t v79 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v75 = a9;
  id v17 = v16;
  pid_t v18 = (const char *)[v17 UTF8String];
  if (!v18)
  {
    *__error() = 22;
    int v32 = *__error();
    _sa_logt();
    __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__objc2_class buf = 0;
      uint64_t v34 = "Unable to convert microstackshots path to C string";
LABEL_31:
      uint64_t v36 = v33;
      uint32_t v37 = 2;
      goto LABEL_32;
    }

- (unint64_t)_addMicrostackshotFromData:(int)a3 ofTypes:(int)a4 inTimeRangeStart:(uint64_t)a5 end:(void *)a6 onlyPid:(double)a7 onlyTid:(double)a8 statistics:
{
  uint64_t v181 = *MEMORY[0x1895F89C0];
  id v15 = a2;
  id v16 = a6;
  if (!a1)
  {
    unint64_t v22 = 0LL;
    goto LABEL_7;
  }

  id context = (void *)MEMORY[0x186E47ACC]();
  id v17 = v15;
  uint64_t v18 = [v17 bytes];
  uint64_t v19 = [v17 length];
  unint64_t v20 = v19;
  if (!*(void *)(a1 + 360)) {
    *(void *)(a1 + 360) = 1LL;
  }
  *(void *)(a1 + 352) |= 4uLL;
  unint64_t v21 = v18 + v19;
  if (*(_DWORD *)v18 != 835010577)
  {
    int v28 = *__error();
    _sa_logt();
    unint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__objc2_class buf = 0;
      _os_log_error_impl( &dword_186C92000,  v29,  OS_LOG_TYPE_ERROR,  "Microstackshot buffer doesn't start with micro_snapshot",  buf,  2u);
    }

    *__error() = v28;
    unint64_t v30 = v20 - 1;
    if (v20 - 1 >= 5)
    {
      unint64_t v31 = 0LL;
      while (*(_DWORD *)(v18 + 1 + v31) != 835010577)
      {
        if (v20 - 5 == ++v31) {
          goto LABEL_22;
        }
      }

      unint64_t v30 = v31;
    }

- (int64_t)addMicrostackshotsFromData:(id)a3 ofTypes:(unsigned int)a4 inTimeRangeStart:(double)a5 end:(double)a6 onlyPid:(int)a7 onlyTid:(unint64_t)a8
{
  return -[SASampleStore addMicrostackshotsFromData:ofTypes:inTimeRangeStart:end:onlyPid:onlyTid:statistics:]( self,  "addMicrostackshotsFromData:ofTypes:inTimeRangeStart:end:onlyPid:onlyTid:statistics:",  a3,  *(void *)&a4,  *(void *)&a7,  a8,  0LL,  a5,  a6);
}

- (int64_t)addMicrostackshotsFromData:(id)a3 ofTypes:(unsigned int)a4 inTimeRangeStart:(double)a5 end:(double)a6 onlyPid:(int)a7 onlyTid:(unint64_t)a8 statistics:(id)a9
{
  id v16 = a3;
  id v17 = a9;
  unint64_t v18 = 0LL;
  if ([v16 length])
  {
    while (1)
    {
      id v19 = objc_alloc(MEMORY[0x189603F48]);
      id v20 = v16;
      unint64_t v21 = (void *)objc_msgSend( v19,  "initWithBytesNoCopy:length:freeWhenDone:",  objc_msgSend(v20, "bytes") + v18,  objc_msgSend(v20, "length") - v18,  0);
      int64_t v22 = -[SASampleStore _addMicrostackshotFromData:ofTypes:inTimeRangeStart:end:onlyPid:onlyTid:statistics:]( (uint64_t)self,  v21,  a4,  a7,  a8,  v17,  a5,  a6);
      unint64_t v23 = v22;
      if (v22 <= 0) {
        break;
      }
      v18 += v22;

      if (v18 >= [v20 length]) {
        goto LABEL_10;
      }
    }

    if (v23) {
      BOOL v24 = v18 == 0;
    }
    else {
      BOOL v24 = 0;
    }
    if (v24) {
      unint64_t v18 = v23;
    }
  }

uint64_t __100__SASampleStore__addMicrostackshotFromData_ofTypes_inTimeRangeStart_end_onlyPid_onlyTid_statistics___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  if (*a3 <= *a2) {
    unsigned int v3 = 0;
  }
  else {
    unsigned int v3 = -1;
  }
  if (*a3 < *a2) {
    return 1LL;
  }
  else {
    return v3;
  }
}

- (void)addUserCallstack:(unint64_t *)a3 numUserFrames:(unsigned int)a4 swiftAsyncCallstack:(unint64_t *)a5 numSwiftAsyncFrames:(unsigned int)a6 swiftAsyncStartIndex:(unsigned int)a7 kernelCallstack:(unint64_t *)a8 numKernelFrames:(unsigned int)a9 uniquePid:(unint64_t)a10 pid:(int)a11 tid:(unint64_t)a12 timestamp:(id)a13
{
  LODWORD(v16) = a11;
  LODWORD(v15) = 0;
  LODWORD(v14) = 0;
  LODWORD(v13) = a9;
  -[SASampleStore addUserCallstack:numUserFrames:swiftAsyncCallstack:numSwiftAsyncFrames:swiftAsyncStartIndex:kernelCallstack:numKernelFrames:loadInfos:numLoadInfos:textExecLoadInfos:numTextExecLoadInfos:uniquePid:pid:processName:tid:timestamp:sharedCache:]( self,  "addUserCallstack:numUserFrames:swiftAsyncCallstack:numSwiftAsyncFrames:swiftAsyncStartIndex:kernelCallstack:numKerne lFrames:loadInfos:numLoadInfos:textExecLoadInfos:numTextExecLoadInfos:uniquePid:pid:processName:tid:timestamp:sharedCache:",  a3,  *(void *)&a4,  a5,  *(void *)&a6,  *(void *)&a7,  a8,  v13,  0LL,  v14,  0LL,  v15,  a10,  v16,  0LL,  a12,  a13,  0LL);
}

- (void)addUserCallstack:(unint64_t *)a3 numUserFrames:(unsigned int)a4 swiftAsyncCallstack:(unint64_t *)a5 numSwiftAsyncFrames:(unsigned int)a6 swiftAsyncStartIndex:(unsigned int)a7 kernelCallstack:(unint64_t *)a8 numKernelFrames:(unsigned int)a9 loadInfos:(const dyld_uuid_info_64 *)a10 numLoadInfos:(unsigned int)a11 textExecLoadInfos:(const dyld_uuid_info_64 *)a12 numTextExecLoadInfos:(unsigned int)a13 uniquePid:(unint64_t)a14 pid:(int)a15 processName:(id)a16 tid:(unint64_t)a17 timestamp:(id)a18 sharedCache:(id)a19
{
  uint64_t v19 = *(void *)&a6;
  uint64_t v20 = *(void *)&a4;
  id v22 = a16;
  id v66 = a18;
  id v64 = a19;
  uint64_t v23 = MEMORY[0x186E47ACC]();
  self->_dataSource |= 0x10uLL;
  char v63 = (void *)v23;
  if ((self->_dataGatheringOptions & 1) != 0)
  {
    if (!*(void *)&self->_arch) {
      -[SASampleStore gatherMachineArchitecture](self, "gatherMachineArchitecture");
    }
    if (!self->_machTimebase.numer || !self->_machTimebase.denom) {
      mach_timebase_info(&self->_machTimebase);
    }
    if (!self->_hwPageSize || !self->_vmPageSize)
    {
      -[SASampleStore gatherHWPageSize]((int *)self);
      -[SASampleStore gatherVMPageSize]((int *)self);
    }
  }

  else if (!self->_reportedMissingMachineInfoForCustomCallstacks)
  {
    BOOL v24 = (FILE **)MEMORY[0x1895F89D0];
    if (!*(void *)&self->_arch)
    {
      int v25 = *__error();
      _sa_logt();
      char v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__objc2_class buf = 0;
        _os_log_impl( &dword_186C92000,  v26,  OS_LOG_TYPE_DEFAULT,  "WARNING: Machine architecture unknown, task architectures will be unknown",  buf,  2u);
      }

      *__error() = v25;
      fwrite("Machine architecture unknown, task architectures will be unknown\n", 0x41uLL, 1uLL, *v24);
      self->_reportedMissingMachineInfoForCustomCallstacks = 1;
    }

    if (!self->_machTimebase.numer || !self->_machTimebase.denom)
    {
      int v27 = *__error();
      _sa_logt();
      int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v69 = 0;
        _os_log_impl( &dword_186C92000,  v28,  OS_LOG_TYPE_DEFAULT,  "WARNING: Mach timebase unknown, cpu times will be unknown",  v69,  2u);
      }

      *__error() = v27;
      fwrite("Mach timebase unknown, cpu times will be unknown\n", 0x31uLL, 1uLL, *v24);
      self->_reportedMissingMachineInfoForCustomCallstacks = 1;
    }

    if (!self->_hwPageSize || !self->_vmPageSize)
    {
      int v29 = *__error();
      _sa_logt();
      unint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v68 = 0;
        _os_log_impl( &dword_186C92000,  v30,  OS_LOG_TYPE_DEFAULT,  "WARNING: Page sizes unknown, task footprints will be unknown",  v68,  2u);
      }

      *__error() = v29;
      fwrite("Page sizes unknown, task footprints will be unknown\n", 0x34uLL, 1uLL, *v24);
      self->_reportedMissingMachineInfoForCustomCallstacks = 1;
    }
  }

  if (!self->_startTime) {
    objc_storeStrong((id *)&self->_startTime, a18);
  }
  objc_storeStrong((id *)&self->_endTime, a18);
  ++self->_numSamples;
  id v62 = v22;
  -[SASampleStore _taskForPid:uniquePid:name:pidStartTime:loadInfos:numLoadInfos:loadInfosIsPartial:textExecLoadInfos:numTextExecLoadInfos:textExecLoadInfosIsPartial:architecture:timestamp:sharedCache:needAOTInfo:]( self,  a15,  a14,  (char *)[v62 UTF8String],  0,  (os_log_s *)a10,  a11,  0,  (os_log_s *)a12,  a13,  0,  0,  v66,  v64,  0);
  unint64_t v31 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  [v31 threads];
  int v32 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a17];
  __int16 v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 objectForKeyedSubscript:v33];
  uint64_t v34 = (id *)objc_claimAutoreleasedReturnValue();

  if (!v34)
  {
    +[SAThread threadWithId:]((uint64_t)&OBJC_CLASS___SAThread, a17);
    uint64_t v34 = (id *)objc_claimAutoreleasedReturnValue();
    -[SATask addThread:]((uint64_t)v31, v34);
  }

  int v35 = objc_alloc_init(&OBJC_CLASS___SAFrameIterator);
  -[SAFrameIterator setBacktracer:](v35, "setBacktracer:", 0LL);
  [v31 binaryLoadInfos];
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (a15)
  {
    -[SAFrameIterator setUserBinaryLoadInfos:](v35, "setUserBinaryLoadInfos:", v36);

    if (v31) {
      uint64_t v37 = v31[73] & 1;
    }
    else {
      uint64_t v37 = 0LL;
    }
    -[SAFrameIterator setAssumeUserBinaryLoadInfosContainMainBinary:]( v35,  "setAssumeUserBinaryLoadInfosContainMainBinary:",  v37);
    [v31 sharedCache];
    unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAFrameIterator setSharedCache:](v35, "setSharedCache:", v38);

    -[SASampleStore lastTaskWithPid:](self, 0LL);
    int v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v65)
    {
      if (a14 == -1LL) {
        uint64_t v39 = -1LL;
      }
      else {
        uint64_t v39 = 0LL;
      }
      +[SATask taskWithPid:uniquePid:name:sharedCache:]((uint64_t)&OBJC_CLASS___SATask, 0LL, v39, 0LL, 0LL);
      int v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASampleStore addTask:]((uint64_t)self, v65);
    }
  }

  else
  {
    -[SAFrameIterator setKernelBinaryLoadInfos:](v35, "setKernelBinaryLoadInfos:", v36);

    int v65 = 0LL;
  }

  if ((_DWORD)v20)
  {
    -[SAFrameIterator setUserFrames:](v35, "setUserFrames:", malloc(8LL * v20));
    memmove(-[SAFrameIterator userFrames](v35, "userFrames"), a3, 8LL * v20);
    -[SAFrameIterator setNumUserFrames:](v35, "setNumUserFrames:", v20);
  }

  if ((_DWORD)v19)
  {
    -[SAFrameIterator setSwiftAsyncFrames:](v35, "setSwiftAsyncFrames:", malloc(8LL * v19));
    memmove(-[SAFrameIterator swiftAsyncFrames](v35, "swiftAsyncFrames"), a5, 8LL * v19);
    -[SAFrameIterator setNumSwiftAsyncFrames:](v35, "setNumSwiftAsyncFrames:", v19);
    -[SAFrameIterator setSwiftAsyncStitchIndex:](v35, "setSwiftAsyncStitchIndex:", a7);
  }

  if (a9)
  {
    -[SAFrameIterator setKernelFrames:](v35, "setKernelFrames:", malloc(8LL * a9));
    memmove(-[SAFrameIterator kernelFrames](v35, "kernelFrames"), a8, 8LL * a9);
    -[SAFrameIterator setNumKernelFrames:](v35, "setNumKernelFrames:", a9);
  }

  if (a15)
  {
    id v67 = 0LL;
    -[SATask leafFrameAfterAddingStack:leafOfCRootFramesReplacedBySwiftAsync:]((uint64_t)v31, v35, &v67);
    unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    id v41 = v67;
  }

  else
  {
    unint64_t v40 = 0LL;
    id v41 = 0LL;
  }

  -[SATask leafFrameAfterAddingStack:leafOfCRootFramesReplacedBySwiftAsync:]((uint64_t)v65, v35, 0LL);
  BOOL v42 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v19) {
    uint64_t v43 = -1LL;
  }
  else {
    uint64_t v43 = 0LL;
  }
  +[SAThreadState stateWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:]( &OBJC_CLASS___SAThreadState,  "stateWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:",  v66,  v66,  0x7FFFFFFFFFFFFFFFLL,  0x7FFFFFFFFFFFFFFFLL);
  char v44 = (id *)objc_claimAutoreleasedReturnValue();
  unint64_t v46 = v44;
  if (v44)
  {
    objc_setProperty_atomic(v44, v45, v40, 64LL);
    objc_setProperty_atomic(v46, v47, v41, 72LL);
    objc_setProperty_atomic(v46, v48, v42, 80LL);
  }

  if (v34)
  {
    [v34[1] addObject:v46];
    uint64_t v49 = [v34[1] count] - 1;
    if ((_DWORD)v19)
    {
LABEL_54:
      uint64_t v60 = v41;
      uint64_t v61 = v40;
      [MEMORY[0x189607968] numberWithUnsignedLongLong:v43];
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 swiftTasks];
      unint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
      [v51 objectForKeyedSubscript:v50];
      unint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v52)
      {
        +[SADispatchQueue dispatchQueueWithId:]((uint64_t)&OBJC_CLASS___SASwiftTask, v43);
        unint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[SATask addSwiftTask:]((uint64_t)v31, v52);
      }

      if (v46) {
        objc_storeWeak(v46 + 15, v52);
      }
      +[SARecipeState stateWithThread:threadStateIndex:]((uint64_t)&OBJC_CLASS___SASwiftTaskState, v34, v49);
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
      id v41 = v60;
      if (v52) {
        -[SARecipe addState:hasConcurrentExecution:]((uint64_t)v52, v53, 0LL);
      }

      int v55 = v62;
      BOOL v54 = v63;
      unint64_t v40 = v61;
      goto LABEL_64;
    }
  }

  else
  {
    uint64_t v49 = 0LL;
    if ((_DWORD)v19) {
      goto LABEL_54;
    }
  }

  int v55 = v62;
  BOOL v54 = v63;
  if (v46) {
    objc_storeWeak(v46 + 15, 0LL);
  }
LABEL_64:

  objc_autoreleasePoolPop(v54);
}

- (BOOL)findCpuSignalHandlerStackLeafKernelFrame
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if (!self->_cpuSignalHandlerStackLeafKernelFrame)
  {
    uint64_t v4 = -[SASampleStore lastTaskWithPid:](self, 0LL);
    id v5 = (void *)v4;
    if (v4)
    {
      uint64_t v29 = 0LL;
      unint64_t v30 = &v29;
      uint64_t v31 = 0x3032000000LL;
      int v32 = __Block_byref_object_copy__0;
      __int16 v33 = __Block_byref_object_dispose__0;
      id v34 = 0LL;
      v28[0] = MEMORY[0x1895F87A8];
      v28[1] = 3221225472LL;
      v28[2] = __57__SASampleStore_findCpuSignalHandlerStackLeafKernelFrame__block_invoke;
      v28[3] = &unk_189F61F88;
      v28[4] = &v29;
      -[SATask enumerateFrames:](v4, v28);
      id v6 = (void *)v30[5];
      if (v6)
      {
        p_cpuSignalHandlerStackLeafKernelFrame = &self->_cpuSignalHandlerStackLeafKernelFrame;
LABEL_6:
        id v6 = (void *)v6[5];
        while (1)
        {
          uint64_t v8 = v6;
          BOOL v9 = v8 == 0LL;

          uint64_t v10 = (void *)v30[5];
          if (v9) {
            break;
          }
          if (v10) {
            uint64_t v11 = (void *)v10[5];
          }
          else {
            uint64_t v11 = 0LL;
          }
          id v12 = v11;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            id v13 = v12;
            uint64_t v14 = [v13 anyObject];
            uint64_t v15 = (void *)v30[5];
            v30[5] = v14;
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              int v18 = *__error();
              _sa_logt();
              uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                ClassName = object_getClassName(v12);
                *(_DWORD *)__objc2_class buf = 136315138;
                uint64_t v36 = ClassName;
                _os_log_error_impl(&dword_186C92000, v19, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
              }

              *__error() = v18;
              char v21 = object_getClassName(v12);
              _SASetCrashLogMessage(7598, "child is %s", v22, v23, v24, v25, v26, v27, v21);
              _os_crash();
              __break(1u);
            }

            id v16 = v12;
            id v13 = (id)v30[5];
            v30[5] = (uint64_t)v16;
          }

          id v6 = (void *)v30[5];
          if (v6) {
            goto LABEL_6;
          }
        }

        objc_storeStrong((id *)p_cpuSignalHandlerStackLeafKernelFrame, v10);
        _Block_object_dispose(&v29, 8);

        BOOL v2 = 1;
        goto LABEL_20;
      }

      _Block_object_dispose(&v29, 8);
    }

    BOOL v2 = 0;
LABEL_20:

    return v2;
  }

  return 1;
}

void __57__SASampleStore_findCpuSignalHandlerStackLeafKernelFrame__block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4)
{
  id v6 = a2;
  [v6 instruction];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __57__SASampleStore_findCpuSignalHandlerStackLeafKernelFrame__block_invoke_2;
  v10[3] = &unk_189F618E0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v8;
  uint64_t v13 = a4;
  id v9 = v6;
  [v7 enumerateSymbols:v10];
}

void __57__SASampleStore_findCpuSignalHandlerStackLeafKernelFrame__block_invoke_2(uint64_t a1, void *a2)
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v3;
  if (v3)
  {
    id v6 = v3;
    if (([v3 isEqualToString:@"cpu_signal_handler"] & 1) != 0
      || (v5 = [v6 isEqualToString:@"sync_iss_to_iks"], uint64_t v4 = v6, v5))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), *(id *)(a1 + 32));
      uint64_t v4 = v6;
      **(_BYTE **)(a1 + 48) = 1;
    }
  }
}

- (void)symbolicate
{
  BOOL v2 = self;
  uint64_t v98 = *MEMORY[0x1895F89C0];
  if ((self->_dataGatheringOptions & 0x78) == 0 && !self->_idsToUseDsymForUUID && !self->_namesToUseDsymForUUID) {
    return;
  }
  uint64_t v3 = mach_absolute_time();
  double v4 = SASecondsFromMachTimeUsingLiveTimebase(v3);
  int v5 = *__error();
  _sa_logt();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__objc2_class buf = 0;
    _os_log_impl(&dword_186C92000, v6, OS_LOG_TYPE_INFO, "Symbolication starting", buf, 2u);
  }

  uint64_t v7 = 0LL;
  unsigned int v8 = 0;
  *__error() = v5;
  uint64_t v66 = v2->_dataGatheringOptions & 8;
  id v9 = (void *)((v2->_dataGatheringOptions >> 3) & 1);
  char v10 = 1;
  *(void *)&__int128 v11 = 134218498LL;
  __int128 v60 = v11;
  id v64 = v2;
  char v65 = (char)v9;
  do
  {
    unsigned int v62 = v8;
    if ((v10 & 1) == 0) {
      break;
    }
    char v63 = v7;
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:2000];
    uint64_t v13 = MEMORY[0x1895F87A8];
    v87[0] = MEMORY[0x1895F87A8];
    v87[1] = 3221225472LL;
    v87[2] = __28__SASampleStore_symbolicate__block_invoke;
    v87[3] = &unk_189F61908;
    id v61 = v12;
    id v88 = v61;
    uint64_t v89 = v2;
    uint64_t v70 = (void *)MEMORY[0x186E47C94](v87);
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    id obj = v2->_exclaves;
    uint64_t v14 = v66;
    uint64_t v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v83,  v97,  16LL);
    if (!v71) {
      goto LABEL_42;
    }
    uint64_t v69 = *(void *)v84;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v84 != v69) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v83 + 1) + 8 * v16);
        if (v14)
        {
LABEL_18:
          char v19 = 1;
          goto LABEL_19;
        }

        idsToUseDsymForUUID = v2->_idsToUseDsymForUUID;
        if (!idsToUseDsymForUUID && !v2->_namesToUseDsymForUUID) {
          goto LABEL_35;
        }
        if ((-[NSMutableArray containsObject:](idsToUseDsymForUUID, "containsObject:", &unk_189F82328, v60) & 1) != 0
          || (-[NSMutableArray containsObject:](v2->_namesToUseDsymForUUID, "containsObject:", @"exclaves") & 1) != 0)
        {
          goto LABEL_18;
        }

        if (v2->_namesToUseDsymForUUID)
        {
          -[SASampleStore lastTaskWithPid:](v2, 0LL);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          char v19 = (char)v9;
          if (v23)
          {
            __int128 v81 = 0u;
            __int128 v82 = 0u;
            __int128 v79 = 0u;
            __int128 v80 = 0u;
            uint64_t v68 = v2->_namesToUseDsymForUUID;
            uint64_t v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v68,  "countByEnumeratingWithState:objects:count:",  &v79,  v96,  16LL);
            char v19 = (char)v9;
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v80;
              while (2)
              {
                for (uint64_t i = 0LL; i != v25; ++i)
                {
                  if (*(void *)v80 != v26) {
                    objc_enumerationMutation(v68);
                  }
                  uint64_t v28 = *(void *)(*((void *)&v79 + 1) + 8 * i);
                  uint64_t v29 = [v23 name];
                  if (v29)
                  {
                    unint64_t v30 = (void *)v29;
                    [v23 name];
                    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
                    char v19 = 1;
                    uint64_t v32 = [v31 rangeOfString:v28 options:1];

                    if (v32 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      BOOL v2 = v64;
                      LOBYTE(v9) = v65;
                      goto LABEL_37;
                    }
                  }
                }

                uint64_t v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v68,  "countByEnumeratingWithState:objects:count:",  &v79,  v96,  16LL);
                if (v25) {
                  continue;
                }
                break;
              }

              BOOL v2 = v64;
              LOBYTE(v9) = v65;
              char v19 = v65;
LABEL_37:
              uint64_t v14 = v66;
              uint64_t v13 = MEMORY[0x1895F87A8];
            }
          }
        }

        else
        {
LABEL_35:
          char v19 = 0;
        }

void __28__SASampleStore_symbolicate__block_invoke(uint64_t a1, void *a2, int a3, BOOL a4, int a5)
{
  id v9 = a2;
  [v9 uuid];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (!v10)
  {
    id v13 = v9;
    objc_opt_self();
    __int128 v11 = objc_alloc_init(&OBJC_CLASS___SAUUIDToSymbolicate);
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v13, 0);

    binaries = v11->_binaries;
    v11->_binaries = (NSMutableArray *)v14;

    v11->_livePid = -1;
    v11->_unint64_t dataGatheringOptions = *(void *)(*(void *)(a1 + 40) + 408LL);
    v11->_livePid = a3;
    v11->_isInExclave = a4;
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v16];
    goto LABEL_11;
  }

  __int128 v11 = (SAUUIDToSymbolicate *)v10;
  id v12 = v9;
  if ((-[NSMutableArray containsObject:](v11->_binaries, "containsObject:", v12) & 1) == 0) {
    -[NSMutableArray addObject:](v11->_binaries, "addObject:", v12);
  }

  if (a3 != -1 && v11->_livePid == -1)
  {
    v11->_livePid = a3;
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  if (a4) {
LABEL_10:
  }
    v11->_isInExclave = 1;
LABEL_11:
  if (a5) {
    v11->_dataGatheringOptions |= 0x48uLL;
  }
}

void __28__SASampleStore_symbolicate__block_invoke_341(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 binary];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  double v4 = v5;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    double v4 = v5;
  }
}

void __28__SASampleStore_symbolicate__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = v4;
  if ((~*(_DWORD *)(*(void *)(a1 + 32) + 408) & 0x402) != 0 || kill([v4 pid], 0)) {
    int v6 = -1;
  }
  else {
    int v6 = [v5 pid];
  }
  if (*(_BYTE *)(a1 + 48)) {
    goto LABEL_5;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (*(void *)(v12 + 264))
  {
    int v13 = [v5 pid];
    if (v13 == -1)
    {
      if ([v5 uniquePid] == -1) {
        goto LABEL_25;
      }
    }

    else
    {
      uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 264LL);
      objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v5, "pid"));
      BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v14 containsObject:v2])
      {

LABEL_5:
        int v7 = 1;
        goto LABEL_6;
      }

      if ([v5 uniquePid] == -1)
      {

        goto LABEL_25;
      }
    }

    uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 264LL);
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v5, "uniquePid"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    char v17 = [v15 containsObject:v16];

    if (v13 != -1) {
    if ((v17 & 1) != 0)
    }
      goto LABEL_5;
  }

  else if (!*(void *)(v12 + 256))
  {
    goto LABEL_37;
  }

void __28__SASampleStore_symbolicate__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 binary];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = v5;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    id v4 = v5;
  }
}

void __28__SASampleStore_symbolicate__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  [a3 threadStates];
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v32 = *(void *)v38;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v38 != v32) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v37 + 1) + 8 * v6);
        [v7 leafKernelFrame];
        int v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          do
          {
            [v9 instruction];
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 binary];
            id v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11) {
              (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
            }

            uint64_t v12 = (void *)v9[4];
            int v13 = v12;

            int v9 = v13;
          }

          while (v12);
        }

        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        if (v7)
        {
          id Property = objc_getProperty(v7, v8, 176LL, 1);
          id v16 = Property;
          if (Property) {
            id Property = objc_getProperty(Property, v15, 16LL, 1);
          }
        }

        else
        {
          id v16 = 0LL;
          id Property = 0LL;
        }

        id v17 = Property;

        uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v18)
        {
          uint64_t v20 = v18;
          uint64_t v21 = *(void *)v34;
          do
          {
            uint64_t v22 = 0LL;
            do
            {
              if (*(void *)v34 != v21) {
                objc_enumerationMutation(v17);
              }
              uint64_t v23 = *(void **)(*((void *)&v33 + 1) + 8 * v22);
              if (v23)
              {
                uint64_t v24 = objc_getProperty(v23, v19, 16LL, 1);
                if (v24)
                {
                  do
                  {
                    [v24 instruction];
                    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
                    [v25 binary];
                    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v26) {
                      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
                    }

                    uint64_t v27 = (void *)v24[4];
                    uint64_t v28 = v27;

                    uint64_t v24 = v28;
                  }

                  while (v27);
                }
              }

              ++v22;
            }

            while (v22 != v20);
            uint64_t v29 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
            uint64_t v20 = v29;
          }

          while (v29);
        }

        ++v6;
      }

      while (v6 != v5);
      uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      uint64_t v5 = v30;
    }

    while (v30);
  }
}

void __28__SASampleStore_symbolicate__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id Property = a3;
  id v8 = Property;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  if (Property) {
    id Property = objc_getProperty(Property, v7, 16LL, 1);
  }
  id v9 = Property;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        if (v8)
        {
          unint64_t v14 = *((void *)v8 + 3);
          int v15 = *((_DWORD *)v8 + 3);
          int v16 = *((_BYTE *)v8 + 8) & 1;
        }

        else
        {
          int v15 = 0;
          unint64_t v14 = 0LL;
          int v16 = 0;
        }

        -[SABinary symbolicateAllInstructionsWithOptions:pid:checkExclave:onlyDsym:additionalCSSymbolicatorFlags:]( *(void **)(*((void *)&v30 + 1) + 8 * v13++),  v14,  v15,  v16,  0,  *(_DWORD *)(*(void *)(a1 + 32) + 328LL));
      }

      while (v11 != v13);
      uint64_t v17 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
      uint64_t v11 = v17;
    }

    while (v17);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  if (v8) {
    id v19 = objc_getProperty(v8, v18, 16LL, 1);
  }
  else {
    id v19 = 0LL;
  }
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t i = 0LL; i != v22; ++i)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "clearCoreSymbolicationCache", (void)v26);
      }

      uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }

    while (v22);
  }

  +[SABinary dataFillingQueue]();
  uint64_t v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_sync(v25, &__block_literal_global_342);
}

- (void)addAddressTranslations:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    if (!*(void *)(a1 + 304))
    {
      uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v3, "count"));
      id v5 = *(void **)(a1 + 304);
      *(void *)(a1 + 304) = v4;
    }

    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __40__SASampleStore_addAddressTranslations___block_invoke;
    v8[3] = &unk_189F61A40;
    v8[4] = a1;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8, v6);
    id v3 = v7;
  }
}

void __40__SASampleStore_addAddressTranslations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  -[SASampleStore addressTranslationsForPid:](v6, [v5 intValue]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __40__SASampleStore_addAddressTranslations___block_invoke_2;
  v12[3] = &unk_189F61A18;
  uint64_t v9 = *(void *)(a1 + 32);
  id v13 = v8;
  uint64_t v14 = v9;
  id v15 = v5;
  id v10 = v5;
  id v11 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];
}

void __40__SASampleStore_addAddressTranslations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (![v6 unsignedLongLongValue]) {
    goto LABEL_10;
  }
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!v7) {
    goto LABEL_9;
  }
  id v8 = (void *)v7;
  [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v9 unsignedLongLongValue])
  {

    goto LABEL_9;
  }

  [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = [v10 isEqual:v6];

  if ((v11 & 1) != 0)
  {
LABEL_9:
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
    goto LABEL_10;
  }

  int v12 = *__error();
  _sa_logt();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    -[SASampleStore lastTaskWithPid:](*(void **)(a1 + 40), [*(id *)(a1 + 48) intValue]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 debugDescription];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v5 unsignedLongLongValue];
    uint64_t v17 = [v6 unsignedLongLongValue];
    [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    int v19 = 138413058;
    id v20 = v15;
    __int16 v21 = 2048;
    uint64_t v22 = v16;
    __int16 v23 = 2048;
    uint64_t v24 = v17;
    __int16 v25 = 2048;
    uint64_t v26 = [v18 unsignedLongLongValue];
    _os_log_fault_impl( &dword_186C92000,  v13,  OS_LOG_TYPE_FAULT,  "%@: libktrace translation 0x%llx -> 0x%llx mismatch with existing translation -> 0x%llx",  (uint8_t *)&v19,  0x2Au);
  }

  *__error() = v12;
LABEL_10:
}

void __31__SASampleStore_gatherKextStat__block_invoke()
{
  dispatch_block_t v0 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_347);
  qos_class_t v1 = qos_class_self();
  dispatch_get_global_queue(v1, 0LL);
  BOOL v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, v0);

  dispatch_time_t v3 = dispatch_time(0LL, 2000000000LL);
  if (dispatch_block_wait(v0, v3))
  {
    int v4 = *__error();
    _sa_logt();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_186C92000, v5, OS_LOG_TYPE_DEFAULT, "WARNING: Timed out waiting for kextstat", v6, 2u);
    }

    *__error() = v4;
  }
}

void __31__SASampleStore_gatherKextStat__block_invoke_2()
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  int v16 = -1;
  __int128 v21 = xmmword_189F61AA0;
  int v0 = SASpawnPlatformBinaryWithSigningIdentifier( "/usr/sbin/kextstat",  "com.apple.kextstat",  (char *const *)&v21,  0LL,  0LL,  0,  &v16,  0,  0LL,  0,  0LL);
  if (v0 < 1)
  {
    int v10 = *__error();
    _sa_logt();
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v12 = *__error();
      id v13 = __error();
      uint64_t v14 = strerror(*v13);
      *(_DWORD *)__objc2_class buf = 67109378;
      int v18 = v12;
      __int16 v19 = 2080;
      id v20 = v14;
      _os_log_debug_impl(&dword_186C92000, v11, OS_LOG_TYPE_DEBUG, "Unable to run kextstat: %d %s", buf, 0x12u);
    }

    *__error() = v10;
  }

  else
  {
    pid_t v1 = v0;
    id v2 = objc_alloc_init(MEMORY[0x189607940]);
    dispatch_time_t v3 = calloc(0x40uLL, 0x400uLL);
    int v4 = (void *)MEMORY[0x1895FD590];
    ssize_t v5 = read(v16, v3, *MEMORY[0x1895FD590] - 1LL);
    if (v5 >= 1)
    {
      uint64_t v6 = MEMORY[0x1895F87A8];
      do
      {
        *((_BYTE *)v3 + v5) = 0;
        SANSStringForCString(v3);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          [v2 appendString:v7];
        }

        else
        {
          block[0] = v6;
          block[1] = 3221225472LL;
          block[2] = __31__SASampleStore_gatherKextStat__block_invoke_3;
          block[3] = &__block_descriptor_40_e5_v8__0l;
          block[4] = v3;
          if (qword_18C4B1320 != -1) {
            dispatch_once(&qword_18C4B1320, block);
          }
        }

        ssize_t v5 = read(v16, v3, *v4 - 1LL);
      }

      while (v5 > 0);
    }

    waitpid(v1, 0LL, 0);
    free(v3);
    if ([v2 length])
    {
      uint64_t v8 = [v2 copy];
      uint64_t v9 = (void *)qword_18C4B1310;
      qword_18C4B1310 = v8;
    }
  }

int *__31__SASampleStore_gatherKextStat__block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v2 = *__error();
  _sa_logt();
  dispatch_time_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315138;
    uint64_t v7 = v5;
    _os_log_error_impl( &dword_186C92000,  v3,  OS_LOG_TYPE_ERROR,  "Unable to convert kextstat output to NSString: %s",  (uint8_t *)&v6,  0xCu);
  }

  uint64_t result = __error();
  *uint64_t result = v2;
  return result;
}

- (NSString)machineArchitecture
{
  arch = (void *)self->_arch;
  if (arch)
  {
    arch = (void *)CSArchitectureGetFamilyName();
    if (arch)
    {
      SANSStringForCString(arch);
      arch = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return (NSString *)arch;
}

- (void)setMachineArchitecture:(id)a3
{
  id v5 = a3;
  uint64_t ArchitectureForName = [v5 UTF8String];
  if (ArchitectureForName)
  {
    [v5 UTF8String];
    uint64_t ArchitectureForName = CSArchitectureGetArchitectureForName();
  }

  self->_arch = (_CSArchitecture)ArchitectureForName;
}

- (void)gatherMachineArchitecture
{
  self->_arch = (_CSArchitecture)MEMORY[0x186E47040](self, a2);
}

- (mach_timebase_info)machTimebase
{
  return self->_machTimebase;
}

- (void)setMachTimebase:(mach_timebase_info)a3
{
  self->_machTimebase = a3;
}

void __36__SASampleStore_gatherHardwareModel__block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(0LL);
  dispatch_get_global_queue(0LL, 0LL);
  pid_t v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __36__SASampleStore_gatherHardwareModel__block_invoke_2;
  block[3] = &unk_189F616C8;
  int v2 = v0;
  uint64_t v8 = v2;
  dispatch_async(v1, block);

  dispatch_time_t v3 = dispatch_time(0LL, 1000000000LL);
  if (dispatch_semaphore_wait(v2, v3))
  {
    int v4 = *__error();
    _sa_logt();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v6 = 0;
      _os_log_error_impl(&dword_186C92000, v5, OS_LOG_TYPE_ERROR, "Timed out waiting for MobileGestalt", v6, 2u);
    }

    *__error() = v4;
  }
}

uint64_t __36__SASampleStore_gatherHardwareModel__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  int v2 = (const void *)MGCopyAnswerWithError();
  if (v2)
  {
    dispatch_time_t v3 = v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFStringGetTypeID())
    {
      id v5 = (void *)qword_18C4B1328;
      qword_18C4B1328 = (uint64_t)v3;
    }

    else
    {
      int v8 = *__error();
      _sa_logt();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        CFTypeID v11 = CFGetTypeID(v3);
        int v12 = (__CFString *)CFCopyTypeIDDescription(v11);
        *(_DWORD *)__objc2_class buf = 138412290;
        uint64_t v14 = v12;
        _os_log_fault_impl(&dword_186C92000, v9, OS_LOG_TYPE_FAULT, "Product type not a string (%@)", buf, 0xCu);
      }

      *__error() = v8;
      CFRelease(v3);
    }
  }

  else
  {
    int v6 = *__error();
    _sa_logt();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__objc2_class buf = 67109120;
      LODWORD(v14) = 0;
      _os_log_fault_impl(&dword_186C92000, v7, OS_LOG_TYPE_FAULT, "Unable to get product type: %d", buf, 8u);
    }

    *__error() = v6;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_populateFromKtraceMachineInfo:(int)a3 is64bit:
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    [(id)a1 hardwareModel];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      int v6 = (void *)ktrace_machine_model();
      if (v6)
      {
        SANSStringForCString(v6);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        [(id)a1 setHardwareModel:v7];
      }
    }

    if (![(id)a1 numActiveCPUs])
    {
      uint64_t active = ktrace_machine_active_cpus();
      if ((_DWORD)active) {
        [(id)a1 setNumActiveCPUs:active];
      }
    }

    if (![(id)a1 hwPageSize])
    {
      uint64_t v9 = ktrace_machine_hw_page_size();
      if ((_DWORD)v9) {
        [(id)a1 setHwPageSize:v9];
      }
    }

    if (![(id)a1 vmPageSize])
    {
      uint64_t v10 = ktrace_machine_vm_page_size();
      if ((_DWORD)v10) {
        [(id)a1 setVmPageSize:v10];
      }
    }

    [(id)a1 osProductName];
    CFTypeID v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      int v12 = (void *)ktrace_machine_os_name();
      if (v12)
      {
        SANSStringForCString(v12);
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [(id)a1 setOsProductName:v13];
      }
    }

    [(id)a1 osProductVersion];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      uint64_t v15 = (void *)ktrace_machine_os_version();
      if (v15)
      {
        SANSStringForCString(v15);
        int v16 = (void *)objc_claimAutoreleasedReturnValue();
        [(id)a1 setOsProductVersion:v16];
      }
    }

    [(id)a1 osProductVersionExtra];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      int v18 = (void *)ktrace_machine_os_version_extra();
      if (v18)
      {
        SANSStringForCString(v18);
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
        [(id)a1 setOsProductVersionExtra:v19];
      }
    }

    [(id)a1 osBuildVersion];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      uint64_t v22 = (void *)ktrace_machine_os_build();
      if (v22)
      {
        SANSStringForCString(v22);
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
        [(id)a1 setOsBuildVersion:v23];
      }
    }

    if (!*(void *)(a1 + 192))
    {
      int v24 = ktrace_machine_cpu_type();
      uint64_t v25 = ktrace_machine_cpu_subtype();
      uint64_t v26 = v24 & 0xFEFFFFFF;
      if (a3) {
        v26 |= 0x1000000uLL;
      }
      *(void *)(a1 + 192) = v26 | ((unint64_t)(v25 & 0xFFFFFF) << 32);
    }

    if (!objc_getProperty((id)a1, v21, 1032LL, 1))
    {
      uint64_t v27 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:*(unsigned int *)(a1 + 340)];
      if (*(_DWORD *)(a1 + 340))
      {
        uint64_t v29 = 0LL;
        *(void *)&__int128 v28 = 67109376LL;
        __int128 v41 = v28;
        do
        {
          int v30 = ktrace_machine_cpu_cluster();
          if (v30)
          {
            int v31 = v30;
            int v32 = *__error();
            _sa_logt();
            __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__objc2_class buf = v41;
              int v43 = v29;
              __int16 v44 = 1024;
              int v45 = v31;
              __int128 v34 = v33;
              __int128 v35 = "Unable to determine cluster for cpu %u: %{errno}d";
LABEL_43:
              _os_log_error_impl(&dword_186C92000, v34, OS_LOG_TYPE_ERROR, v35, buf, 0xEu);
            }
          }

          else
          {
            int v36 = ktrace_machine_cluster_flags();
            if (!v36)
            {
              [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
              __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();
              [MEMORY[0x189607968] numberWithUnsignedInt:v29];
              __int128 v39 = (void *)objc_claimAutoreleasedReturnValue();
              [v27 setObject:v38 forKeyedSubscript:v39];

              goto LABEL_39;
            }

            int v37 = v36;
            int v32 = *__error();
            _sa_logt();
            __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__objc2_class buf = v41;
              int v43 = 0;
              __int16 v44 = 1024;
              int v45 = v37;
              __int128 v34 = v33;
              __int128 v35 = "Unable to determine flags for cluster %u: %{errno}d";
              goto LABEL_43;
            }
          }

          *__error() = v32;
LABEL_39:
          uint64_t v29 = (v29 + 1);
        }

        while (v29 < *(_DWORD *)(a1 + 340));
      }

      if (objc_msgSend(v27, "count", v41)) {
        objc_setProperty_atomic_copy((id)a1, v40, v27, 1032LL);
      }
    }
  }

void __45__SASampleStore_gatherNonDefaultFeatureFlags__block_invoke()
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  if (objc_opt_class())
  {
    id v0 = objc_alloc_init(MEMORY[0x189603FC8]);
    pid_t v1 = (void *)qword_18C4B1340;
    qword_18C4B1340 = (uint64_t)v0;

    [MEMORY[0x18960F3B8] shared];
    int v2 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    [v2 domains];
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v26)
    {
      uint64_t v25 = *(void *)v36;
      do
      {
        uint64_t v3 = 0LL;
        do
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = v3;
          uint64_t v4 = *(void *)(*((void *)&v35 + 1) + 8 * v3);
          id context = (void *)MEMORY[0x186E47ACC]();
          [v2 featuresForDomain:v4];
          id v5 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          id v29 = v5;
          uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = *(void *)v32;
            do
            {
              for (uint64_t i = 0LL; i != v7; ++i)
              {
                if (*(void *)v32 != v8) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
                [v2 stateForFeature:v10 domain:v4 level:4];
                CFTypeID v11 = (void *)objc_claimAutoreleasedReturnValue();
                if (v11)
                {
                  [v2 defaultStateForFeature:v10 domain:v4];
                  int v12 = (void *)objc_claimAutoreleasedReturnValue();
                  id v13 = v12;
                  if (!v12 || (uint64_t v14 = [v12 value], v14 != objc_msgSend(v11, "value")))
                  {
                    uint64_t v15 = [v11 value];
                    uint64_t v16 = MEMORY[0x189604A80];
                    if (v15 == 1) {
                      uint64_t v16 = MEMORY[0x189604A88];
                    }
                    uint64_t v30 = v16;
                    uint64_t v17 = v7;
                    uint64_t v18 = v8;
                    __int16 v19 = v2;
                    uint64_t v20 = qword_18C4B1340;
                    __int128 v21 = (void *)[objc_alloc(NSString) initWithFormat:@"%@.%@", v4, v10];
                    uint64_t v22 = (void *)v20;
                    int v2 = v19;
                    uint64_t v8 = v18;
                    uint64_t v7 = v17;
                    [v22 setObject:v30 forKeyedSubscript:v21];
                  }
                }
              }

              uint64_t v7 = [v29 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }

            while (v7);
          }

          objc_autoreleasePoolPop(context);
          uint64_t v3 = v28 + 1;
        }

        while (v28 + 1 != v26);
        uint64_t v26 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }

      while (v26);
    }

    [v2 invalidateCache];
    if (![(id)qword_18C4B1340 count])
    {
      __int16 v23 = (void *)qword_18C4B1340;
      qword_18C4B1340 = 0LL;
    }
  }

uint64_t __29__SASampleStore_gatherTrials__block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  uint64_t v36 = 0LL;
  __int128 v37 = &v36;
  uint64_t v38 = 0x2050000000LL;
  int v2 = (void *)qword_18C4B1378;
  uint64_t v39 = qword_18C4B1378;
  if (!qword_18C4B1378)
  {
    *(void *)&__int128 buf = MEMORY[0x1895F87A8];
    *((void *)&buf + 1) = 3221225472LL;
    uint64_t v41 = __getTRIAllocationStatusClass_block_invoke;
    uint64_t v42 = &unk_189F61EF0;
    int v43 = &v36;
    __getTRIAllocationStatusClass_block_invoke((uint64_t)&buf);
    int v2 = (void *)v37[3];
  }

  id v3 = v2;
  _Block_object_dispose(&v36, 8);
  if (objc_opt_class())
  {
    [v3 defaultProvider];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v35 = 0LL;
    uint64_t v6 = MEMORY[0x1895F87A8];
    v33[0] = MEMORY[0x1895F87A8];
    v33[1] = 3221225472LL;
    v33[2] = __29__SASampleStore_gatherTrials__block_invoke_2;
    v33[3] = &unk_189F61AF8;
    id v7 = v5;
    id v34 = v7;
    char v8 = [v4 enumerateActiveExperimentsForEnvironment:0 error:&v35 block:v33];
    id v9 = v35;
    int v10 = *__error();
    _sa_logt();
    CFTypeID v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v12 = v11;
    if ((v8 & 1) != 0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = [v7 count];
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v13;
        _os_log_debug_impl( &dword_186C92000,  v12,  OS_LOG_TYPE_DEBUG,  "Found %lu active trial experiments",  (uint8_t *)&buf,  0xCu);
      }
    }

    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_error_impl( &dword_186C92000,  v12,  OS_LOG_TYPE_ERROR,  "Unable to determine active trial experiments: %@",  (uint8_t *)&buf,  0xCu);
    }

    *__error() = v10;
    id v14 = objc_alloc_init(MEMORY[0x189603FA8]);

    id v32 = 0LL;
    uint64_t v27 = v6;
    uint64_t v28 = 3221225472LL;
    id v29 = __29__SASampleStore_gatherTrials__block_invoke_372;
    uint64_t v30 = &unk_189F61B48;
    id v15 = v14;
    id v31 = v15;
    char v16 = [v4 enumerateActiveRolloutsWithError:&v32 block:&v27];
    id v17 = v32;
    int v18 = *__error();
    _sa_logt();
    __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = v19;
    if ((v16 & 1) != 0)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = objc_msgSend(v15, "count", v27, v28, v29, v30);
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v21;
        _os_log_debug_impl( &dword_186C92000,  v20,  OS_LOG_TYPE_DEBUG,  "Found %lu active trial rollouts",  (uint8_t *)&buf,  0xCu);
      }
    }

    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_error_impl( &dword_186C92000,  v20,  OS_LOG_TYPE_ERROR,  "Unable to determine active trial rollouts: %@",  (uint8_t *)&buf,  0xCu);
    }

    *__error() = v18;
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:2];
    [v22 setObject:v7 forKeyedSubscript:0x189F674F8];
    [v22 setObject:v15 forKeyedSubscript:0x189F67518];
    int v24 = (void *)[v22 copy];
    uint64_t v25 = *(void **)(a1 + 32);
    if (v25) {
      objc_setProperty_atomic(v25, v23, v24, 528LL);
    }
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __29__SASampleStore_gatherTrials__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v2 experimentId];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[v4 copy];
  [v3 setObject:v5 forKeyedSubscript:0x189F67538];

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v2, "deploymentId"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v6 forKeyedSubscript:0x189F67558];

  [v2 treatmentId];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = (void *)[v7 copy];
  [v3 setObject:v8 forKeyedSubscript:0x189F67598];

  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  [v2 namespaces];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend(v15, "compatibilityVersion"));
        char v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 name];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 setObject:v16 forKeyedSubscript:v17];
      }

      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v12);
  }

  int v18 = (void *)[v9 copy];
  [v3 setObject:v18 forKeyedSubscript:0x189F67578];

  __int16 v19 = *(void **)(a1 + 32);
  uint64_t v20 = (void *)[v3 copy];
  [v19 addObject:v20];
}

void __29__SASampleStore_gatherTrials__block_invoke_372(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x189603FC8];
  id v4 = a2;
  id v16 = objc_alloc_init(v3);
  [v4 rolloutId];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v5 copy];
  [v16 setObject:v6 forKeyedSubscript:0x189F675B8];

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v4, "deploymentId"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setObject:v7 forKeyedSubscript:0x189F67558];

  [v4 rampId];
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = (void *)[v8 copy];
  [v16 setObject:v9 forKeyedSubscript:0x189F675D8];

  id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v4 factorPackIds];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __29__SASampleStore_gatherTrials__block_invoke_2_373;
  v17[3] = &unk_189F61B20;
  id v18 = v10;
  id v12 = v10;
  [v11 enumerateKeysAndObjectsUsingBlock:v17];

  uint64_t v13 = (void *)[v12 copy];
  [v16 setObject:v13 forKeyedSubscript:0x189F675F8];

  id v14 = *(void **)(a1 + 32);
  id v15 = (void *)[v16 copy];
  [v14 addObject:v15];
}

uint64_t __29__SASampleStore_gatherTrials__block_invoke_2_373(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

- (id)addPowerModeTransition:(id *)a1
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    if (!a1[10])
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
      id v5 = a1[10];
      a1[10] = (id)v4;
    }

    [v3 timestamp];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 wallTime];
    double v8 = v7;

    id v9 = a1[10];
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __40__SASampleStore_addPowerModeTransition___block_invoke;
    v22[3] = &__block_descriptor_40_e31_q16__0__SAPowerModeTransition_8l;
    *(double *)&v22[4] = v8;
    unint64_t v10 = SABinarySearchArray(v9, 1280, (uint64_t)v22);
    if (v10 >= [a1[10] count]) {
      goto LABEL_9;
    }
    [a1[10] objectAtIndexedSubscript:v10];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 timestamp];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 wallTime];
    double v14 = v13;

    if (v14 == v8)
    {
      int v15 = *__error();
      _sa_logt();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        [a1[10] objectAtIndexedSubscript:v10];
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 timestamp];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 debugDescription];
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 138543362;
        __int128 v24 = v21;
        _os_log_debug_impl( &dword_186C92000,  v16,  OS_LOG_TYPE_DEBUG,  "Already have a power mode transition at %{public}@",  buf,  0xCu);
      }

      *__error() = v15;
      [a1[10] objectAtIndexedSubscript:v10];
      id v17 = (id *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
LABEL_9:
      [a1[10] insertObject:v3 atIndex:v10];
      id v17 = (id *)v3;
    }

    a1 = v17;
  }

  return a1;
}

uint64_t __40__SASampleStore_addPowerModeTransition___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 wallTime];
  double v5 = v4;

  double v6 = *(double *)(a1 + 32);
  if (v5 <= v6) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = -1LL;
  }
  if (v5 < v6) {
    return 1LL;
  }
  else {
    return v7;
  }
}

uint64_t __30__SASampleStore_gatherGPUInfo__block_invoke(void *a1)
{
  Group = (const __CFString *)IOReportChannelGetGroup();
  if (IOReportChannelGetFormat() == 1
    && CFStringCompare(Group, @"Internal Statistics", 0LL) == kCFCompareEqualTo)
  {
    ChannelName = (const void *)IOReportChannelGetChannelName();
    if (CFEqual(ChannelName, @"GPU Restart Count"))
    {
      *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = IOReportSimpleGetIntegerValue();
      uint64_t v4 = a1[5];
LABEL_7:
      *(_BYTE *)(*(void *)(v4 + 8) + 24LL) = 1;
      goto LABEL_8;
    }

    if (CFEqual(ChannelName, @"Last GPU Restart"))
    {
      *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = IOReportSimpleGetIntegerValue();
      uint64_t v4 = a1[7];
      goto LABEL_7;
    }
  }

void __42__SASampleStore_gatherUnknownProcessNames__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __42__SASampleStore_gatherUnknownProcessNames__block_invoke_2;
  v4[3] = &unk_189F61C28;
  __int128 v5 = *(_OWORD *)(a1 + 32);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __42__SASampleStore_gatherUnknownProcessNames__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  [a3 threadStates];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = MEMORY[0x1895F87A8];
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        v12[0] = v8;
        v12[1] = 3221225472LL;
        v12[2] = __42__SASampleStore_gatherUnknownProcessNames__block_invoke_3;
        v12[3] = &unk_189F61C00;
        __int128 v13 = *(_OWORD *)(a1 + 32);
        uint64_t v11 = (void (**)(void, void))MEMORY[0x186E47C94](v12);
        v11[2](v11, [v10 originPid]);
        v11[2](v11, [v10 proximatePid]);

        ++v9;
      }

      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }
}

void __42__SASampleStore_gatherUnknownProcessNames__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if ((_DWORD)a2 != -1)
  {
    [*(id *)(a1 + 32) tasksByPid];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithInt:a2];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v5];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      char v12 = 0;
      memset(v11, 0, sizeof(v11));
      if (qword_18C4B1348 != -1) {
        dispatch_once(&qword_18C4B1348, &__block_literal_global_393);
      }
      if ((_MergedGlobals_3 & 1) == 0)
      {
        proc_name(a2, v11, 0x21u);
        if (LOBYTE(v11[0]))
        {
          SANSStringForCString(v11);
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
          [MEMORY[0x189607968] numberWithInt:a2];
          unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 setObject:v8 forKeyedSubscript:v10];
        }
      }
    }
  }

void __52__SASampleStore_gatherUnknownResourceCoalitionNames__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = [v3 resourceCoalitionID];
  if (v4)
  {
    uint64_t v5 = v4;
    [v3 resourceCoalitionName];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

      goto LABEL_26;
    }

    uint64_t v8 = *(void **)(a1 + 32);
    [MEMORY[0x189607968] numberWithUnsignedLongLong:v5];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:v9];
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v3) {
        objc_setProperty_atomic(v3, v11, v10, 152LL);
      }
      goto LABEL_25;
    }

    char v12 = (void *)xpc_coalition_copy_info();
    uint64_t v13 = v12;
    if (!v12)
    {
      int v19 = *__error();
      _sa_logt();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        [v3 name];
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)uint64_t v28 = 134218498;
        *(void *)&v28[4] = v5;
        *(_WORD *)&v28[12] = 2112;
        *(void *)&v28[14] = v27;
        *(_WORD *)&v28[22] = 1024;
        int v29 = [v3 pid];
        _os_log_debug_impl( &dword_186C92000,  v20,  OS_LOG_TYPE_DEBUG,  "No info for rcid %llu (used by %@ [%d])",  v28,  0x1Cu);
      }

      *__error() = v19;
      goto LABEL_24;
    }

    string = xpc_dictionary_get_string(v12, (const char *)*MEMORY[0x1895F8708]);
    if (string)
    {
      __int128 v15 = (char *)string;
      int v16 = *__error();
      _sa_logt();
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      *(_DWORD *)uint64_t v28 = 134218242;
      *(void *)&v28[4] = v5;
      *(_WORD *)&v28[12] = 2080;
      *(void *)&v28[14] = v15;
      id v18 = "RCID %llu has bundleid:%s";
    }

    else
    {
      __int128 v15 = (char *)xpc_dictionary_get_string(v13, (const char *)*MEMORY[0x1895F8710]);
      int v16 = *__error();
      _sa_logt();
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v21 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
      if (!v15)
      {
        if (v21)
        {
          *(_DWORD *)uint64_t v28 = 134217984;
          *(void *)&v28[4] = v5;
          _os_log_debug_impl(&dword_186C92000, v17, OS_LOG_TYPE_DEBUG, "RCID %llu has no bundleid/name", v28, 0xCu);
        }

        *__error() = v16;
        goto LABEL_24;
      }

      if (!v21)
      {
LABEL_17:

        *__error() = v16;
        SANSStringForCString(v15);
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          __int128 v24 = v22;
          if (v3) {
            objc_setProperty_atomic(v3, v23, v22, 152LL);
          }
          uint64_t v25 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", v5, *(_OWORD *)v28, *(void *)&v28[16]);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 setObject:v24 forKeyedSubscript:v26];
        }

void __43__SASampleStore_gatherOSCryptexFileExtents__block_invoke()
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  if (objc_opt_class())
  {
    [MEMORY[0x189610B70] sharedDataAccessor];
    id v0 = (void *)objc_claimAutoreleasedReturnValue();
    id v32 = 0LL;
    pid_t v1 = (void *)[v0 copyPathForPersonalizedData:11 error:&v32];
    id v2 = v32;

    if (v1)
    {
      id v3 = v1;
      uint64_t v4 = (const char *)[v3 fileSystemRepresentation];
      if (!v4)
      {
        int v14 = *__error();
        _sa_logt();
        __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v40.st_dev = 138412290;
          *(void *)&v40.st_mode = v3;
          _os_log_error_impl( &dword_186C92000,  v15,  OS_LOG_TYPE_ERROR,  "Unable to get fileSystemRepresentation for cryptex path %@",  (uint8_t *)&v40,  0xCu);
        }

        *__error() = v14;
        goto LABEL_23;
      }

      __darwin_ino64_t v5 = (__darwin_ino64_t)v4;
      int v6 = open(v4, 0, 0LL);
      if (v6 < 0)
      {
        int v16 = *__error();
        _sa_logt();
        __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v31 = *__error();
          v40.st_dev = 136315394;
          *(void *)&v40.st_mode = v5;
          WORD2(v40.st_ino) = 1024;
          *(_DWORD *)((char *)&v40.st_ino + 6) = v31;
          _os_log_error_impl( &dword_186C92000,  v17,  OS_LOG_TYPE_ERROR,  "FileExtent: error opening %s: %{errno}d",  (uint8_t *)&v40,  0x12u);
        }

        int v11 = 0;
        *__error() = v16;
        goto LABEL_20;
      }

      int v7 = v6;
      if (fstat(v6, &v40))
      {
        int v8 = *__error();
        _sa_logt();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_7;
        }
        int v30 = *__error();
        *(_DWORD *)__int128 buf = 136315394;
        __darwin_ino64_t v37 = v5;
        __int16 v38 = 1024;
        LODWORD(v39) = v30;
        __int128 v22 = "FileExtent: failed to get file size for %s: %{errno}d";
        __int128 v23 = v9;
        uint32_t v24 = 18;
      }

      else
      {
        off_t st_size = v40.st_size;
        if (v40.st_size)
        {
          if (v40.st_size < 1)
          {
            int v11 = 0;
            goto LABEL_9;
          }

          int v11 = 0;
          off_t v21 = 0LL;
          while (1)
          {
            int v33 = 0;
            off_t v34 = st_size - v21;
            off_t v35 = v21;
            if (fcntl(v7, 65, &v33))
            {
              int v8 = *__error();
              _sa_logt();
              uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                goto LABEL_38;
              }
              int v26 = *__error();
              *(_DWORD *)__int128 buf = 67109120;
              LODWORD(v37) = v26;
              uint64_t v27 = "FileExtent: error in fcntl(): %{errno}d";
              uint64_t v28 = v25;
              uint32_t v29 = 8;
              goto LABEL_42;
            }

            if (!v34) {
              break;
            }
            v21 += v34;
            ++v11;
            if (v21 >= st_size) {
              goto LABEL_9;
            }
          }

          int v8 = *__error();
          _sa_logt();
          uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            goto LABEL_38;
          }
          *(_DWORD *)__int128 buf = 134218240;
          __darwin_ino64_t v37 = v21;
          __int16 v38 = 2048;
          off_t v39 = st_size;
          uint64_t v27 = "FileExtent: 0 contigbytes fcntl() at offset %lld out of %lld";
          uint64_t v28 = v25;
          uint32_t v29 = 22;
LABEL_42:
          _os_log_error_impl(&dword_186C92000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
LABEL_38:

          unint64_t v10 = __error();
LABEL_8:
          int *v10 = v8;
LABEL_9:
          close(v7);
LABEL_20:
          qword_18C4B1358 = v11;
          int v18 = *__error();
          _sa_logt();
          int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v40.st_dev = 67109378;
            *(_DWORD *)&v40.st_mode = qword_18C4B1358;
            LOWORD(v40.st_ino) = 2080;
            *(__darwin_ino64_t *)((char *)&v40.st_ino + 2) = v5;
            _os_log_impl( &dword_186C92000,  v19,  OS_LOG_TYPE_INFO,  "Shared cache fragmentation OS Cryptex File Extents count is %d for file: (%s)",  (uint8_t *)&v40,  0x12u);
          }

          *__error() = v18;
LABEL_23:

          goto LABEL_24;
        }

        int v8 = *__error();
        _sa_logt();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
LABEL_7:

          unint64_t v10 = __error();
          int v11 = 0;
          goto LABEL_8;
        }

        *(_DWORD *)__int128 buf = 136315138;
        __darwin_ino64_t v37 = v5;
        __int128 v22 = "FileExtent: no extents for %s (empty file)\n";
        __int128 v23 = v9;
        uint32_t v24 = 12;
      }

      _os_log_error_impl(&dword_186C92000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
      goto LABEL_7;
    }
  }

  else
  {
    id v2 = 0LL;
  }

  int v12 = *__error();
  _sa_logt();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v40.st_dev = 138412290;
    *(void *)&v40.st_mode = v2;
    _os_log_impl( &dword_186C92000,  v13,  OS_LOG_TYPE_INFO,  "Unable to get path for MSUDA_CRYPTEX1_OS_CRYPTEX: (%@)",  (uint8_t *)&v40,  0xCu);
  }

  *__error() = v12;
LABEL_24:
}

void __40__SASampleStore_gatherRootInstalledInfo__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(*(Class *)(a1 + 48));
  id v26 = 0LL;
  int v3 = [v2 openAndReturnError:&v26];
  id v4 = v26;
  __darwin_ino64_t v5 = v4;
  if (v3)
  {
    id v25 = v4;
    [v2 allInstalledRootsAndReturnError:&v25];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v25;

    id v8 = objc_alloc_init(MEMORY[0x189603FD0]);
    if (v6)
    {
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v22;
        do
        {
          uint64_t v13 = 0LL;
          do
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v13), "name", (void)v21);
            int v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v8 addObject:v14];

            ++v13;
          }

          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }

        while (v11);
      }
    }

    id v15 = (id)objc_msgSend(v2, "closeAndReturnError:", 0, (void)v21);
    uint64_t v16 = [v8 array];
    uint64_t v17 = *(void *)(a1 + 32);
    int v18 = *(void **)(v17 + 552);
    *(void *)(v17 + 552) = v16;

    if ([*(id *)(*(void *)(a1 + 32) + 552) count]) {
      *(_BYTE *)(*(void *)(a1 + 32) + 318LL) = 1;
    }

    __darwin_ino64_t v5 = v7;
  }

  else
  {
    int v19 = *__error();
    _sa_logt();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v28 = v5;
      _os_log_error_impl(&dword_186C92000, v20, OS_LOG_TYPE_ERROR, "Error opening Darwinup session: %@", buf, 0xCu);
    }

    *__error() = v19;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __32__SASampleStore_gatherModelInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  int v7 = *__error();
  _sa_logt();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (v5)
  {
    id v34 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 134217984;
      uint64_t v54 = [v5 count];
      _os_log_impl(&dword_186C92000, v9, OS_LOG_TYPE_INFO, "Got information on %lu models", buf, 0xCu);
    }

    *__error() = v7;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v35 = v5;
    id obj = v5;
    uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v37 = *(void *)v47;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v47 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          objc_msgSend(v13, "loadedChanges", v34);
          int v14 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v51 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v43;
            do
            {
              for (uint64_t j = 0LL; j != v16; ++j)
              {
                if (*(void *)v43 != v17) {
                  objc_enumerationMutation(v14);
                }
                int v19 = *(void **)(*((void *)&v42 + 1) + 8 * j);
                [v19 timestamp];
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[SATimestamp applyMachTimebase:]((uint64_t)v20, [*(id *)(a1 + 32) machTimebase]);

                [v19 endTime];
                __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[SATimestamp applyMachTimebase:]((uint64_t)v21, [*(id *)(a1 + 32) machTimebase]);
              }

              uint64_t v16 = [v14 countByEnumeratingWithState:&v42 objects:v51 count:16];
            }

            while (v16);
          }

          __int128 v40 = 0u;
          __int128 v41 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          [v13 executions];
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v50 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v39;
            do
            {
              for (uint64_t k = 0LL; k != v24; ++k)
              {
                if (*(void *)v39 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = *(void **)(*((void *)&v38 + 1) + 8 * k);
                [v27 startTime];
                uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[SATimestamp applyMachTimebase:]((uint64_t)v28, [*(id *)(a1 + 32) machTimebase]);

                [v27 endTime];
                uint32_t v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[SATimestamp applyMachTimebase:]((uint64_t)v29, [*(id *)(a1 + 32) machTimebase]);
              }

              uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v50 count:16];
            }

            while (v24);
          }
        }

        uint64_t v11 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      }

      while (v11);
    }

    uint64_t v30 = [obj copy];
    uint64_t v31 = *(void *)(a1 + 32);
    id v32 = *(void **)(v31 + 536);
    *(void *)(v31 + 536) = v30;

    id v6 = v34;
    id v5 = v35;
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [v6 debugDescription];
      int v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v54 = (uint64_t)v33;
      _os_log_error_impl(&dword_186C92000, v9, OS_LOG_TYPE_ERROR, "Unable to get model information: %@", buf, 0xCu);
    }

    *__error() = v7;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __38__SASampleStore_iterateAllTimestamps___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 execTimestamp];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    [v3 execTimestamp];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }

  [v3 exitTimestamp];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    [v3 exitTimestamp];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  [v3 taskStates];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v16 = *(void *)(a1 + 32);
        [v15 startTimestamp];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

        uint64_t v18 = *(void *)(a1 + 32);
        [v15 endTimestamp];
        int v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
      }

      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v12);
  }

  [v3 threads];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __38__SASampleStore_iterateAllTimestamps___block_invoke_2;
  v21[3] = &unk_189F61D10;
  id v22 = *(id *)(a1 + 32);
  [v20 enumerateKeysAndObjectsUsingBlock:v21];
}

void __38__SASampleStore_iterateAllTimestamps___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 creationTimestamp];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    [v4 creationTimestamp];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }

  [v4 exitTimestamp];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    [v4 exitTimestamp];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  objc_msgSend(v4, "threadStates", 0);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v17 = *(void *)(a1 + 32);
        [v16 startTimestamp];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

        uint64_t v19 = *(void *)(a1 + 32);
        [v16 endTimestamp];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);

        [v16 timestampLastMadeRunnable];
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          uint64_t v22 = *(void *)(a1 + 32);
          [v16 timestampLastMadeRunnable];
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);
        }
      }

      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v13);
  }
}

- (id)callTreeForTask:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[SASamplePrinter initWithSampleStore:](objc_alloc(&OBJC_CLASS___SASamplePrinter), "initWithSampleStore:", self);
  -[SASamplePrinter setOptions:](v8, "setOptions:", v6);

  -[SASamplePrinter callTreeForTask:](v8, "callTreeForTask:", v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)callTreesForThreadsInTask:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[SASamplePrinter initWithSampleStore:](objc_alloc(&OBJC_CLASS___SASamplePrinter), "initWithSampleStore:", self);
  -[SASamplePrinter setOptions:](v8, "setOptions:", v6);

  -[SASamplePrinter callTreesForThreadsInTask:](v8, "callTreesForThreadsInTask:", v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)callTreeForThread:(id)a3 inTask:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = -[SASamplePrinter initWithSampleStore:](objc_alloc(&OBJC_CLASS___SASamplePrinter), "initWithSampleStore:", self);
  -[SASamplePrinter setOptions:](v11, "setOptions:", v8);

  -[SASamplePrinter callTreeForThread:inTask:](v11, "callTreeForThread:inTask:", v10, v9);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)callTreeForDispatchQueue:(id)a3 andThread:(id)a4 inTask:(id)a5 options:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = -[SASamplePrinter initWithSampleStore:](objc_alloc(&OBJC_CLASS___SASamplePrinter), "initWithSampleStore:", self);
  -[SASamplePrinter setOptions:](v14, "setOptions:", v10);

  -[SASamplePrinter callTreeForDispatchQueue:andThread:inTask:]( v14,  "callTreeForDispatchQueue:andThread:inTask:",  v13,  v12,  v11);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)callTreeForSwiftTask:(id)a3 thread:(id)a4 inTask:(id)a5 options:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = -[SASamplePrinter initWithSampleStore:](objc_alloc(&OBJC_CLASS___SASamplePrinter), "initWithSampleStore:", self);
  -[SASamplePrinter setOptions:](v14, "setOptions:", v10);

  -[SASamplePrinter callTreeForSwiftTask:thread:inTask:](v14, "callTreeForSwiftTask:thread:inTask:", v13, v12, v11);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)callTreeForDispatchQueue:(id)a3 swiftTask:(id)a4 thread:(id)a5 inTask:(id)a6 options:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = -[SASamplePrinter initWithSampleStore:](objc_alloc(&OBJC_CLASS___SASamplePrinter), "initWithSampleStore:", self);
  -[SASamplePrinter setOptions:](v17, "setOptions:", v12);

  -[SASamplePrinter callTreeForDispatchQueue:swiftTask:thread:inTask:]( v17,  "callTreeForDispatchQueue:swiftTask:thread:inTask:",  v16,  v15,  v14,  v13);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)callTreeForExecutable:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[SASamplePrinter initWithSampleStore:](objc_alloc(&OBJC_CLASS___SASamplePrinter), "initWithSampleStore:", self);
  -[SASamplePrinter setOptions:](v8, "setOptions:", v6);

  -[SASamplePrinter callTreeForExecutable:](v8, "callTreeForExecutable:", v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDictionary)tasksByUniquePid
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSDictionary)tasksByPid
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSArray)sampleTimestamps
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSArray)hidEvents
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (NSArray)ioEvents
{
  return (NSArray *)objc_getProperty(self, a2, 88LL, 1);
}

- (NSArray)memoryPressureEvents
{
  return (NSArray *)objc_getProperty(self, a2, 96LL, 1);
}

- (NSArray)kernelCaches
{
  return (NSArray *)objc_getProperty(self, a2, 104LL, 1);
}

- (NSArray)sharedCaches
{
  return (NSArray *)objc_getProperty(self, a2, 112LL, 1);
}

- (NSArray)exclaves
{
  return (NSArray *)objc_getProperty(self, a2, 120LL, 1);
}

- (NSArray)powerModeTransitions
{
  return (NSArray *)objc_getProperty(self, a2, 80LL, 1);
}

- (unint64_t)dataSource
{
  return self->_dataSource;
}

- (unint64_t)dataStyle
{
  return self->_dataStyle;
}

- (double)attemptedSamplingInterval
{
  return self->_attemptedSamplingInterval;
}

- (void)setAttemptedSamplingInterval:(double)a3
{
  self->_attemptedSamplingInterval = a3;
}

- (SATimestamp)timestampOfLastStackshot
{
  return (SATimestamp *)objc_getProperty(self, a2, 376LL, 1);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 384LL, 1);
}

- (void)setReason:(id)a3
{
}

- (double)lastWakeTime
{
  return self->_lastWakeTime;
}

- (SAMountStatusTracker)mountStatusTracker
{
  return (SAMountStatusTracker *)objc_getProperty(self, a2, 400LL, 1);
}

- (BOOL)keepMicrostackshotsWithoutLoadInfo
{
  return self->_keepMicrostackshotsWithoutLoadInfo;
}

- (void)setKeepMicrostackshotsWithoutLoadInfo:(BOOL)a3
{
  self->_keepMicrostackshotsWithoutLoadInfo = a3;
}

- (unint64_t)dataGatheringOptions
{
  return self->_dataGatheringOptions;
}

- (void)setDataGatheringOptions:(unint64_t)a3
{
  self->_unint64_t dataGatheringOptions = a3;
}

- (unsigned)additionalCSSymbolicatorFlags
{
  return self->_additionalCSSymbolicatorFlags;
}

- (void)setAdditionalCSSymbolicatorFlags:(unsigned int)a3
{
  self->_additionalCSSymbolicatorFlags = a3;
}

- (SAFrame)cpuSignalHandlerStackLeafKernelFrame
{
  return (SAFrame *)objc_getProperty(self, a2, 416LL, 1);
}

- (SATimestamp)timeWhenTransitionedToSamplingAllThreads
{
  return (SATimestamp *)objc_getProperty(self, a2, 424LL, 1);
}

- (SATimestamp)timeWhenTransitionedToSamplingAllProcesses
{
  return (SATimestamp *)objc_getProperty(self, a2, 432LL, 1);
}

- (BOOL)sanitizePaths
{
  return self->_sanitizePaths;
}

- (void)setSanitizePaths:(BOOL)a3
{
  self->_sanitizePaths = a3;
}

- (BOOL)omitSensitiveStrings
{
  return self->_omitSensitiveStrings;
}

- (void)setOmitSensitiveStrings:(BOOL)a3
{
  self->_omitSensitiveStrings = a3;
}

- (BOOL)shouldGatherKextStat
{
  return self->_shouldGatherKextStat;
}

- (void)setShouldGatherKextStat:(BOOL)a3
{
  self->_shouldGatherKextStat = a3;
}

- (NSString)kextStat
{
  return (NSString *)objc_getProperty(self, a2, 440LL, 1);
}

- (NSString)kernelVersion
{
  return (NSString *)objc_getProperty(self, a2, 448LL, 1);
}

- (NSString)osProductName
{
  return (NSString *)objc_getProperty(self, a2, 456LL, 1);
}

- (void)setOsProductName:(id)a3
{
}

- (NSString)osProductVersion
{
  return (NSString *)objc_getProperty(self, a2, 464LL, 1);
}

- (void)setOsProductVersion:(id)a3
{
}

- (NSString)osProductVersionExtra
{
  return (NSString *)objc_getProperty(self, a2, 472LL, 1);
}

- (void)setOsProductVersionExtra:(id)a3
{
}

- (NSString)osBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 480LL, 1);
}

- (void)setOsBuildVersion:(id)a3
{
}

- (unsigned)workQueueSoftThreadLimit
{
  return self->_workQueueSoftThreadLimit;
}

- (unsigned)workQueueHardThreadLimit
{
  return self->_workQueueHardThreadLimit;
}

- (NSString)hardwareModel
{
  return (NSString *)objc_getProperty(self, a2, 488LL, 1);
}

- (void)setHardwareModel:(id)a3
{
}

- (unsigned)numActiveCPUs
{
  return self->_numActiveCPUs;
}

- (void)setNumActiveCPUs:(unsigned int)a3
{
  self->_numActiveCPUs = a3;
}

- (unsigned)hwPageSize
{
  return self->_hwPageSize;
}

- (void)setHwPageSize:(unsigned int)a3
{
  self->_hwPageSize = a3;
}

- (unsigned)vmPageSize
{
  return self->_vmPageSize;
}

- (void)setVmPageSize:(unsigned int)a3
{
  self->_vmPageSize = a3;
}

- (NSString)bootArgs
{
  return (NSString *)objc_getProperty(self, a2, 496LL, 1);
}

- (void)setBootArgs:(id)a3
{
}

- (NSDictionary)systemAdvisoryLevels
{
  return (NSDictionary *)objc_getProperty(self, a2, 504LL, 1);
}

- (NSDictionary)homeVolumeSpace
{
  return (NSDictionary *)objc_getProperty(self, a2, 512LL, 1);
}

- (NSDictionary)nonDefaultFeatureFlags
{
  return (NSDictionary *)objc_getProperty(self, a2, 520LL, 1);
}

- (NSDictionary)activeTrials
{
  return (NSDictionary *)objc_getProperty(self, a2, 528LL, 1);
}

- (NSArray)models
{
  return (NSArray *)objc_getProperty(self, a2, 536LL, 1);
}

- (int64_t)numOSCryptexFileExtents
{
  return self->_numOSCryptexFileExtents;
}

- (BOOL)isRootInstalled
{
  return self->_isRootInstalled;
}

- (NSArray)installedRootNames
{
  return (NSArray *)objc_getProperty(self, a2, 552LL, 1);
}

- (BOOL)isAppleInternal
{
  return self->_isAppleInternal;
}

- (BOOL)appleInternalIsKnown
{
  return self->_appleInternalIsKnown;
}

- (BOOL)isInternalCarryDevice
{
  return self->_isInternalCarryDevice;
}

- (BOOL)hasInternalCarryDeviceDistinction
{
  return self->_hasInternalCarryDeviceDistinction;
}

- (NSString)automatedDeviceGroup
{
  return (NSString *)objc_getProperty(self, a2, 560LL, 1);
}

- (NSArray)keyboardLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 568LL, 1);
}

- (NSArray)preferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 576LL, 1);
}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 584LL, 1);
}

- (BOOL)hasHardwareKeyboardInfo
{
  return self->_hasHardwareKeyboardInfo;
}

- (BOOL)hardwareKeyboard
{
  return self->_hardwareKeyboard;
}

- (unint64_t)gpuRestartCount
{
  return self->_gpuRestartCount;
}

- (unint64_t)gpuRestartLastMachAbs
{
  return self->_gpuRestartLastMachAbs;
}

- (BOOL)hasEnterprisePersona
{
  return self->_hasEnterprisePersona;
}

- (unint64_t)targetHIDEventEndMachAbs
{
  return self->_targetHIDEventEndMachAbs;
}

- (void)setTargetHIDEventEndMachAbs:(unint64_t)a3
{
  self->_targetHIDEventEndMachAbs = a3;
}

- (NSString)customOutput
{
  return (NSString *)objc_getProperty(self, a2, 616LL, 1);
}

- (void)setCustomOutput:(id)a3
{
}

- (double)cpuUsed
{
  return self->_cpuUsed;
}

- (void)setCpuUsed:(double)a3
{
  self->_cpuUsed = a3;
}

- (double)cpuDuration
{
  return self->_cpuDuration;
}

- (void)setCpuDuration:(double)a3
{
  self->_cpuDuratiouint64_t n = a3;
}

- (double)cpuLimit
{
  return self->_cpuLimit;
}

- (void)setCpuLimit:(double)a3
{
  self->_cpuLimit = a3;
}

- (double)cpuLimitDuration
{
  return self->_cpuLimitDuration;
}

- (void)setCpuLimitDuration:(double)a3
{
  self->_cpuLimitDuratiouint64_t n = a3;
}

- (unint64_t)numWakeups
{
  return self->_numWakeups;
}

- (void)setNumWakeups:(unint64_t)a3
{
  self->_numWakeups = a3;
}

- (double)wakeupsDuration
{
  return self->_wakeupsDuration;
}

- (void)setWakeupsDuration:(double)a3
{
  self->_wakeupsDuratiouint64_t n = a3;
}

- (unint64_t)numWakeupsLimit
{
  return self->_numWakeupsLimit;
}

- (void)setNumWakeupsLimit:(unint64_t)a3
{
  self->_numWakeupsLimit = a3;
}

- (double)wakeupsLimitDuration
{
  return self->_wakeupsLimitDuration;
}

- (void)setWakeupsLimitDuration:(double)a3
{
  self->_wakeupsLimitDuratiouint64_t n = a3;
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setBytesWritten:(unint64_t)a3
{
  self->_bytesWritteuint64_t n = a3;
}

- (double)writeDuration
{
  return self->_writeDuration;
}

- (void)setWriteDuration:(double)a3
{
  self->_writeDuratiouint64_t n = a3;
}

- (unint64_t)bytesWrittenLimit
{
  return self->_bytesWrittenLimit;
}

- (void)setBytesWrittenLimit:(unint64_t)a3
{
  self->_bytesWrittenLimit = a3;
}

- (double)writeLimitDuration
{
  return self->_writeLimitDuration;
}

- (void)setWriteLimitDuration:(double)a3
{
  self->_writeLimitDuratiouint64_t n = a3;
}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 720LL, 1);
}

- (void)setEvent:(id)a3
{
}

- (NSString)eventNote
{
  return (NSString *)objc_getProperty(self, a2, 728LL, 1);
}

- (void)setEventNote:(id)a3
{
}

- (SATimeRange)eventTimeRange
{
  return (SATimeRange *)objc_getProperty(self, a2, 736LL, 1);
}

- (void)setEventTimeRange:(id)a3
{
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 744LL, 1);
}

- (void)setSignature:(id)a3
{
}

- (NSString)actionTaken
{
  return (NSString *)objc_getProperty(self, a2, 752LL, 1);
}

- (void)setActionTaken:(id)a3
{
}

- (double)extraDuration
{
  return self->_extraDuration;
}

- (void)setExtraDuration:(double)a3
{
  self->_extraDuratiouint64_t n = a3;
}

- (NSString)durationNote
{
  return (NSString *)objc_getProperty(self, a2, 768LL, 1);
}

- (void)setDurationNote:(id)a3
{
}

- (NSString)stepsNote
{
  return (NSString *)objc_getProperty(self, a2, 776LL, 1);
}

- (void)setStepsNote:(id)a3
{
}

- (double)reportTimeThreshold
{
  return self->_reportTimeThreshold;
}

- (void)setReportTimeThreshold:(double)a3
{
  self->_reportTimeThreshold = a3;
}

- (NSString)wrWorkflowName
{
  return (NSString *)objc_getProperty(self, a2, 792LL, 1);
}

- (void)setWrWorkflowName:(id)a3
{
}

- (NSError)wrError
{
  return (NSError *)objc_getProperty(self, a2, 800LL, 1);
}

- (void)setWrError:(id)a3
{
}

- (NSString)wrDiagnosticName
{
  return (NSString *)objc_getProperty(self, a2, 808LL, 1);
}

- (void)setWrDiagnosticName:(id)a3
{
}

- (double)wrWorkflowTimeoutDuration
{
  return self->_wrWorkflowTimeoutDuration;
}

- (void)setWrWorkflowTimeoutDuration:(double)a3
{
  self->_wrWorkflowTimeoutDuratiouint64_t n = a3;
}

- (double)wrWorkflowDurationThreshold
{
  return self->_wrWorkflowDurationThreshold;
}

- (void)setWrWorkflowDurationThreshold:(double)a3
{
  self->_wrWorkflowDurationThreshold = a3;
}

- (double)wrWorkflowDuration
{
  return self->_wrWorkflowDuration;
}

- (void)setWrWorkflowDuration:(double)a3
{
  self->_wrWorkflowDuratiouint64_t n = a3;
}

- (double)wrWorkflowDurationOmittingNetworkBoundIntervalsThreshold
{
  return self->_wrWorkflowDurationOmittingNetworkBoundIntervalsThreshold;
}

- (void)setWrWorkflowDurationOmittingNetworkBoundIntervalsThreshold:(double)a3
{
  self->_wrWorkflowDurationOmittingNetworkBoundIntervalsThreshold = a3;
}

- (double)wrWorkflowDurationOmittingNetworkBoundIntervals
{
  return self->_wrWorkflowDurationOmittingNetworkBoundIntervals;
}

- (void)setWrWorkflowDurationOmittingNetworkBoundIntervals:(double)a3
{
  self->_wrWorkflowDurationOmittingNetworkBoundIntervals = a3;
}

- (NSString)wrSignpostName
{
  return (NSString *)objc_getProperty(self, a2, 856LL, 1);
}

- (void)setWrSignpostName:(id)a3
{
}

- (NSString)wrSignpostSubsystem
{
  return (NSString *)objc_getProperty(self, a2, 864LL, 1);
}

- (void)setWrSignpostSubsystem:(id)a3
{
}

- (NSString)wrSignpostCategory
{
  return (NSString *)objc_getProperty(self, a2, 872LL, 1);
}

- (void)setWrSignpostCategory:(id)a3
{
}

- (NSString)wrTriggeringSignpostName
{
  return (NSString *)objc_getProperty(self, a2, 880LL, 1);
}

- (void)setWrTriggeringSignpostName:(id)a3
{
}

- (NSString)wrTriggeringSignpostSubsystem
{
  return (NSString *)objc_getProperty(self, a2, 888LL, 1);
}

- (void)setWrTriggeringSignpostSubsystem:(id)a3
{
}

- (NSString)wrTriggeringSignpostCategory
{
  return (NSString *)objc_getProperty(self, a2, 896LL, 1);
}

- (void)setWrTriggeringSignpostCategory:(id)a3
{
}

- (unint64_t)wrSignpostCountThreshold
{
  return self->_wrSignpostCountThreshold;
}

- (void)setWrSignpostCountThreshold:(unint64_t)a3
{
  self->_wrSignpostCountThreshold = a3;
}

- (unint64_t)wrSignpostCount
{
  return self->_wrSignpostCount;
}

- (void)setWrSignpostCount:(unint64_t)a3
{
  self->_wrSignpostCount = a3;
}

- (double)wrSignpostDurationUnionThreshold
{
  return self->_wrSignpostDurationUnionThreshold;
}

- (void)setWrSignpostDurationUnionThreshold:(double)a3
{
  self->_wrSignpostDurationUnionThreshold = a3;
}

- (double)wrSignpostDurationUnion
{
  return self->_wrSignpostDurationUnion;
}

- (void)setWrSignpostDurationUnion:(double)a3
{
  self->_wrSignpostDurationUniouint64_t n = a3;
}

- (double)wrSignpostDurationSumThreshold
{
  return self->_wrSignpostDurationSumThreshold;
}

- (void)setWrSignpostDurationSumThreshold:(double)a3
{
  self->_wrSignpostDurationSumThreshold = a3;
}

- (double)wrSignpostDurationSum
{
  return self->_wrSignpostDurationSum;
}

- (void)setWrSignpostDurationSum:(double)a3
{
  self->_wrSignpostDurationSuuint64_t m = a3;
}

- (double)wrSignpostDurationSingleThreshold
{
  return self->_wrSignpostDurationSingleThreshold;
}

- (void)setWrSignpostDurationSingleThreshold:(double)a3
{
  self->_wrSignpostDurationSingleThreshold = a3;
}

- (double)wrSignpostDurationSingle
{
  return self->_wrSignpostDurationSingle;
}

- (void)setWrSignpostDurationSingle:(double)a3
{
  self->_wrSignpostDurationSingle = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v220 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x186E47ACC]();
    -[SASampleStore symbolicate](self, "symbolicate");
    objc_autoreleasePoolPop(v5);
    id v6 = (void *)MEMORY[0x186E47ACC]();
    [v4 encodeInteger:36 forKey:@"_PASampleTimeSeriesDataStore_Serialized_Version"];
    [v4 encodeInteger:36 forKey:@"_SASampleStore_Serialized_Version"];
    id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
    *(void *)__int128 buf = 0LL;
    uint64_t v204 = buf;
    uint64_t v205 = 0x2020000000LL;
    uint64_t v8 = MEMORY[0x1895F87A8];
    uint64_t v206 = 0LL;
    v202[0] = MEMORY[0x1895F87A8];
    v202[1] = 3221225472LL;
    v202[2] = __56__SASampleStore_SASampleStoreNSCoding__encodeWithCoder___block_invoke;
    v202[3] = &unk_189F61D60;
    v202[4] = buf;
    -[SASampleStore enumerateTasks:](self, "enumerateTasks:", v202);
    uint64_t v9 = *((void *)v204 + 3);
    if (v9)
    {
      uint64_t v10 = 8 * v9;
      id v11 = malloc(8 * v9);
      v201[0] = 0LL;
      v201[1] = v201;
      v201[2] = 0x2020000000LL;
      v201[3] = 0LL;
      v197[0] = v8;
      v197[1] = 3221225472LL;
      v197[2] = __56__SASampleStore_SASampleStoreNSCoding__encodeWithCoder___block_invoke_2;
      v197[3] = &unk_189F615A8;
      uint64_t v200 = v11;
      id v198 = v7;
      uint64_t v199 = v201;
      -[SASampleStore enumerateTasks:](self, "enumerateTasks:", v197);
      [v4 encodeBytes:v11 length:v10 forKey:@"_tasks"];
      free(v11);

      _Block_object_dispose(v201, 8);
    }

    -[SASampleStore lastTaskWithPid:](self, 0LL);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = v12;
    if (v12) {
      id Property = objc_getProperty(v12, v13, 280LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v16 = Property;

    if (v16)
    {
      unint64_t v17 = [v16 count];
      if (v17)
      {
        __int128 v195 = 0u;
        __int128 v196 = 0u;
        __int128 v193 = 0u;
        __int128 v194 = 0u;
        id v18 = v16;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v193 objects:v219 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v194;
          do
          {
            for (uint64_t i = 0LL; i != v19; ++i)
            {
              if (*(void *)v194 != v20) {
                objc_enumerationMutation(v18);
              }
              [*(id *)(*((void *)&v193 + 1) + 8 * i) addSelfToSerializationDictionary:v7];
            }

            uint64_t v19 = [v18 countByEnumeratingWithState:&v193 objects:v219 count:16];
          }

          while (v19);
        }

        uint64_t v22 = malloc(8 * v17);
        SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v22, v17, v18, v7);
        [v4 encodeBytes:v22 length:8 * v17 forKey:@"_rootKernelFrames"];
        free(v22);
      }
    }

    fanSpeeds = self->_fanSpeeds;
    if (fanSpeeds)
    {
      unint64_t v24 = -[NSMutableArray count](fanSpeeds, "count");
      __int128 v191 = 0u;
      __int128 v192 = 0u;
      __int128 v189 = 0u;
      __int128 v190 = 0u;
      __int128 v25 = self->_fanSpeeds;
      uint64_t v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v189,  v218,  16LL);
      if (v26)
      {
        uint64_t v27 = *(void *)v190;
        do
        {
          for (uint64_t j = 0LL; j != v26; ++j)
          {
            if (*(void *)v190 != v27) {
              objc_enumerationMutation(v25);
            }
            [*(id *)(*((void *)&v189 + 1) + 8 * j) addSelfToSerializationDictionary:v7];
          }

          uint64_t v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v189,  v218,  16LL);
        }

        while (v26);
      }

      uint64_t v29 = malloc(8 * v24);
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v29, v24, self->_fanSpeeds, v7);
      [v4 encodeBytes:v29 length:8 * v24 forKey:@"_fanSpeeds"];
      free(v29);
    }

    powerModeTransitions = self->_powerModeTransitions;
    if (powerModeTransitions)
    {
      unint64_t v31 = -[NSMutableArray count](powerModeTransitions, "count");
      __int128 v187 = 0u;
      __int128 v188 = 0u;
      __int128 v185 = 0u;
      __int128 v186 = 0u;
      id v32 = self->_powerModeTransitions;
      uint64_t v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v185,  v217,  16LL);
      if (v33)
      {
        uint64_t v34 = *(void *)v186;
        do
        {
          for (uint64_t k = 0LL; k != v33; ++k)
          {
            if (*(void *)v186 != v34) {
              objc_enumerationMutation(v32);
            }
            [*(id *)(*((void *)&v185 + 1) + 8 * k) addSelfToSerializationDictionary:v7];
          }

          uint64_t v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v185,  v217,  16LL);
        }

        while (v33);
      }

      uint64_t v36 = malloc(8 * v31);
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances( v36,  v31,  self->_powerModeTransitions,  v7);
      [v4 encodeBytes:v36 length:8 * v31 forKey:@"_powerModeTransitions"];
      free(v36);
    }

    hidEvents = self->_hidEvents;
    if (hidEvents)
    {
      unint64_t v38 = -[NSMutableArray count](hidEvents, "count");
      __int128 v183 = 0u;
      __int128 v184 = 0u;
      __int128 v181 = 0u;
      __int128 v182 = 0u;
      __int128 v39 = self->_hidEvents;
      uint64_t v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v181,  v216,  16LL);
      if (v40)
      {
        uint64_t v41 = *(void *)v182;
        do
        {
          for (uint64_t m = 0LL; m != v40; ++m)
          {
            if (*(void *)v182 != v41) {
              objc_enumerationMutation(v39);
            }
            [*(id *)(*((void *)&v181 + 1) + 8 * m) addSelfToSerializationDictionary:v7];
          }

          uint64_t v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v181,  v216,  16LL);
        }

        while (v40);
      }

      __int128 v43 = malloc(8 * v38);
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v43, v38, self->_hidEvents, v7);
      [v4 encodeBytes:v43 length:8 * v38 forKey:@"_hidEvents"];
      free(v43);
    }

    gestures = self->_gestures;
    if (gestures)
    {
      unint64_t v45 = -[NSMutableArray count](gestures, "count");
      __int128 v179 = 0u;
      __int128 v180 = 0u;
      __int128 v177 = 0u;
      __int128 v178 = 0u;
      __int128 v46 = self->_gestures;
      uint64_t v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v177,  v215,  16LL);
      if (v47)
      {
        uint64_t v48 = *(void *)v178;
        do
        {
          for (uint64_t n = 0LL; n != v47; ++n)
          {
            if (*(void *)v178 != v48) {
              objc_enumerationMutation(v46);
            }
            [*(id *)(*((void *)&v177 + 1) + 8 * n) addSelfToSerializationDictionary:v7];
          }

          uint64_t v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v177,  v215,  16LL);
        }

        while (v47);
      }

      uint64_t v50 = malloc(8 * v45);
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v50, v45, self->_gestures, v7);
      [v4 encodeBytes:v50 length:8 * v45 forKey:@"_gestures"];
      free(v50);
    }

    ioEvents = self->_ioEvents;
    if (ioEvents)
    {
      unint64_t v52 = -[NSMutableArray count](ioEvents, "count");
      __int128 v175 = 0u;
      __int128 v176 = 0u;
      __int128 v173 = 0u;
      __int128 v174 = 0u;
      uint64_t v53 = self->_ioEvents;
      uint64_t v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v173,  v214,  16LL);
      if (v54)
      {
        uint64_t v55 = *(void *)v174;
        do
        {
          for (iuint64_t i = 0LL; ii != v54; ++ii)
          {
            if (*(void *)v174 != v55) {
              objc_enumerationMutation(v53);
            }
            [*(id *)(*((void *)&v173 + 1) + 8 * ii) addSelfToSerializationDictionary:v7];
          }

          uint64_t v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v173,  v214,  16LL);
        }

        while (v54);
      }

      uint64_t v57 = malloc(8 * v52);
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v57, v52, self->_ioEvents, v7);
      [v4 encodeBytes:v57 length:8 * v52 forKey:@"_ioEvents"];
      free(v57);
    }

    memoryPressureEvents = self->_memoryPressureEvents;
    if (memoryPressureEvents)
    {
      unint64_t v59 = -[NSMutableArray count](memoryPressureEvents, "count");
      __int128 v171 = 0u;
      __int128 v172 = 0u;
      __int128 v169 = 0u;
      __int128 v170 = 0u;
      __int128 v60 = self->_memoryPressureEvents;
      uint64_t v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v60,  "countByEnumeratingWithState:objects:count:",  &v169,  v213,  16LL);
      if (v61)
      {
        uint64_t v62 = *(void *)v170;
        do
        {
          for (juint64_t j = 0LL; jj != v61; ++jj)
          {
            if (*(void *)v170 != v62) {
              objc_enumerationMutation(v60);
            }
            [*(id *)(*((void *)&v169 + 1) + 8 * jj) addSelfToSerializationDictionary:v7];
          }

          uint64_t v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v60,  "countByEnumeratingWithState:objects:count:",  &v169,  v213,  16LL);
        }

        while (v61);
      }

      id v64 = malloc(8 * v59);
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances( v64,  v59,  self->_memoryPressureEvents,  v7);
      [v4 encodeBytes:v64 length:8 * v59 forKey:@"_memoryPressureEvents"];
      free(v64);
    }

    sharedCaches = self->_sharedCaches;
    if (sharedCaches)
    {
      unint64_t v66 = -[NSMutableArray count](sharedCaches, "count");
      __int128 v167 = 0u;
      __int128 v168 = 0u;
      __int128 v165 = 0u;
      __int128 v166 = 0u;
      id v67 = self->_sharedCaches;
      uint64_t v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v67,  "countByEnumeratingWithState:objects:count:",  &v165,  v212,  16LL);
      if (v68)
      {
        uint64_t v69 = *(void *)v166;
        do
        {
          for (kuint64_t k = 0LL; kk != v68; ++kk)
          {
            if (*(void *)v166 != v69) {
              objc_enumerationMutation(v67);
            }
            [*(id *)(*((void *)&v165 + 1) + 8 * kk) addSelfToSerializationDictionary:v7];
          }

          uint64_t v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v67,  "countByEnumeratingWithState:objects:count:",  &v165,  v212,  16LL);
        }

        while (v68);
      }

      uint64_t v71 = malloc(8 * v66);
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v71, v66, self->_sharedCaches, v7);
      [v4 encodeBytes:v71 length:8 * v66 forKey:@"_sharedCaches"];
      free(v71);
    }

    kernelCaches = self->_kernelCaches;
    if (kernelCaches)
    {
      unint64_t v73 = -[NSMutableArray count](kernelCaches, "count");
      __int128 v163 = 0u;
      __int128 v164 = 0u;
      __int128 v161 = 0u;
      __int128 v162 = 0u;
      id v74 = self->_kernelCaches;
      uint64_t v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v74,  "countByEnumeratingWithState:objects:count:",  &v161,  v211,  16LL);
      if (v75)
      {
        uint64_t v76 = *(void *)v162;
        do
        {
          for (muint64_t m = 0LL; mm != v75; ++mm)
          {
            if (*(void *)v162 != v76) {
              objc_enumerationMutation(v74);
            }
            [*(id *)(*((void *)&v161 + 1) + 8 * mm) addSelfToSerializationDictionary:v7];
          }

          uint64_t v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v74,  "countByEnumeratingWithState:objects:count:",  &v161,  v211,  16LL);
        }

        while (v75);
      }

      char v78 = malloc(8 * v73);
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v78, v73, self->_kernelCaches, v7);
      [v4 encodeBytes:v78 length:8 * v73 forKey:@"_kernelCaches"];
      free(v78);
    }

    exclaves = self->_exclaves;
    if (exclaves)
    {
      unint64_t v80 = -[NSMutableArray count](exclaves, "count");
      __int128 v159 = 0u;
      __int128 v160 = 0u;
      __int128 v157 = 0u;
      __int128 v158 = 0u;
      __int128 v81 = self->_exclaves;
      uint64_t v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v81,  "countByEnumeratingWithState:objects:count:",  &v157,  v210,  16LL);
      if (v82)
      {
        uint64_t v83 = *(void *)v158;
        do
        {
          for (nuint64_t n = 0LL; nn != v82; ++nn)
          {
            if (*(void *)v158 != v83) {
              objc_enumerationMutation(v81);
            }
            [*(id *)(*((void *)&v157 + 1) + 8 * nn) addSelfToSerializationDictionary:v7];
          }

          uint64_t v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v81,  "countByEnumeratingWithState:objects:count:",  &v157,  v210,  16LL);
        }

        while (v82);
      }

      __int128 v85 = malloc(8 * v80);
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v85, v80, self->_exclaves, v7);
      [v4 encodeBytes:v85 length:8 * v80 forKey:@"_exclaves"];
      free(v85);
    }

    kperfTriggers = self->_kperfTriggers;
    if (kperfTriggers)
    {
      unint64_t v87 = -[NSArray count](kperfTriggers, "count");
      __int128 v155 = 0u;
      __int128 v156 = 0u;
      __int128 v153 = 0u;
      __int128 v154 = 0u;
      id v88 = self->_kperfTriggers;
      uint64_t v89 = -[NSArray countByEnumeratingWithState:objects:count:]( v88,  "countByEnumeratingWithState:objects:count:",  &v153,  v209,  16LL);
      if (v89)
      {
        uint64_t v90 = *(void *)v154;
        do
        {
          for (uint64_t i1 = 0LL; i1 != v89; ++i1)
          {
            if (*(void *)v154 != v90) {
              objc_enumerationMutation(v88);
            }
            [*(id *)(*((void *)&v153 + 1) + 8 * i1) addSelfToSerializationDictionary:v7];
          }

          uint64_t v89 = -[NSArray countByEnumeratingWithState:objects:count:]( v88,  "countByEnumeratingWithState:objects:count:",  &v153,  v209,  16LL);
        }

        while (v89);
      }

      __int16 v92 = malloc(8 * v87);
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v92, v87, self->_kperfTriggers, v7);
      [v4 encodeBytes:v92 length:8 * v87 forKey:@"_kperfTriggers"];
      free(v92);
    }

    models = self->_models;
    if (models)
    {
      unint64_t v94 = -[NSArray count](models, "count");
      __int128 v151 = 0u;
      __int128 v152 = 0u;
      __int128 v149 = 0u;
      __int128 v150 = 0u;
      unsigned int v95 = self->_models;
      uint64_t v96 = -[NSArray countByEnumeratingWithState:objects:count:]( v95,  "countByEnumeratingWithState:objects:count:",  &v149,  v208,  16LL);
      if (v96)
      {
        uint64_t v97 = *(void *)v150;
        do
        {
          for (uint64_t i2 = 0LL; i2 != v96; ++i2)
          {
            if (*(void *)v150 != v97) {
              objc_enumerationMutation(v95);
            }
            [*(id *)(*((void *)&v149 + 1) + 8 * i2) addSelfToSerializationDictionary:v7];
          }

          uint64_t v96 = -[NSArray countByEnumeratingWithState:objects:count:]( v95,  "countByEnumeratingWithState:objects:count:",  &v149,  v208,  16LL);
        }

        while (v96);
      }

      unsigned int v99 = malloc(8 * v94);
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v99, v94, self->_models, v7);
      [v4 encodeBytes:v99 length:8 * v94 forKey:@"_models"];
      free(v99);
    }

    unsigned int v100 = self->_mountStatusTracker;
    uint64_t v101 = v100;
    if (v100)
    {
      -[SAMountStatusTracker addSelfToSerializationDictionary:](v100, "addSelfToSerializationDictionary:", v7);
      objc_msgSend( v4,  "encodeInt64:forKey:",  SASerializableIndexForPointerFromSerializationDictionary(v101, v7),  @"_mountStatusTracker");
    }

    uint64_t v102 = self->_wsDataStore;
    size_t v103 = v102;
    if (v102)
    {
      -[SAWSUpdateDataStore addSelfToSerializationDictionary:](v102, "addSelfToSerializationDictionary:", v7);
      objc_msgSend( v4,  "encodeInt64:forKey:",  SASerializableIndexForPointerFromSerializationDictionary(v103, v7),  @"_wsDataStore");
    }

    size_t v104 = self->_timeWhenTransitionedToSamplingAllProcesses;
    uint64_t v105 = v104;
    if (v104)
    {
      -[SATimestamp addSelfToSerializationDictionary:](v104, "addSelfToSerializationDictionary:", v7);
      objc_msgSend( v4,  "encodeInt64:forKey:",  SASerializableIndexForPointerFromSerializationDictionary(v105, v7),  @"_timeWhenTransitionedToSamplingAllProcesses");
    }

    uint64_t v106 = self->_timeWhenTransitionedToSamplingAllThreads;
    unsigned int v107 = v106;
    if (v106)
    {
      -[SATimestamp addSelfToSerializationDictionary:](v106, "addSelfToSerializationDictionary:", v7);
      objc_msgSend( v4,  "encodeInt64:forKey:",  SASerializableIndexForPointerFromSerializationDictionary(v107, v7),  @"_timeWhenTransitionedToSamplingAllThreads");
    }

    unint64_t v108 = self->_cpuSignalHandlerStackLeafKernelFrame;
    size_t v109 = v108;
    if (v108)
    {
      -[SAFrame addSelfToSerializationDictionary:](v108, "addSelfToSerializationDictionary:", v7);
      objc_msgSend( v4,  "encodeInt64:forKey:",  SASerializableIndexForPointerFromSerializationDictionary(v109, v7),  @"_cpuSignalHandlerStackLeafKernelFrame");
    }

    unsigned int v110 = self->_eventTimeRange;
    unsigned int v111 = v110;
    if (v110)
    {
      -[SATimeRange addSelfToSerializationDictionary:](v110, "addSelfToSerializationDictionary:", v7);
      objc_msgSend( v4,  "encodeInt64:forKey:",  SASerializableIndexForPointerFromSerializationDictionary(v111, v7),  @"_eventTimeRange");
    }

    int v112 = self->_timestampOfLastStackshot;
    id v113 = v112;
    if (v112)
    {
      -[SATimestamp addSelfToSerializationDictionary:](v112, "addSelfToSerializationDictionary:", v7);
      objc_msgSend( v4,  "encodeInt64:forKey:",  SASerializableIndexForPointerFromSerializationDictionary(v113, v7),  @"_timestampOfLastStackshot");
    }

    sampleTimestamps = self->_sampleTimestamps;
    if (sampleTimestamps)
    {
      unint64_t v115 = -[NSMutableArray count](sampleTimestamps, "count");
      __int128 v147 = 0u;
      __int128 v148 = 0u;
      __int128 v145 = 0u;
      __int128 v146 = 0u;
      unsigned int v116 = self->_sampleTimestamps;
      uint64_t v117 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v116,  "countByEnumeratingWithState:objects:count:",  &v145,  v207,  16LL);
      if (v117)
      {
        uint64_t v118 = *(void *)v146;
        do
        {
          for (uint64_t i3 = 0LL; i3 != v117; ++i3)
          {
            if (*(void *)v146 != v118) {
              objc_enumerationMutation(v116);
            }
            [*(id *)(*((void *)&v145 + 1) + 8 * i3) addSelfToSerializationDictionary:v7];
          }

          uint64_t v117 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v116,  "countByEnumeratingWithState:objects:count:",  &v145,  v207,  16LL);
        }

        while (v117);
      }

      __int128 v120 = malloc(8 * v115);
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v120, v115, self->_sampleTimestamps, v7);
      [v4 encodeBytes:v120 length:8 * v115 forKey:@"_sampleTimestamps"];
      free(v120);
      sampleTimestamps = self->_sampleTimestamps;
    }

    if (!-[NSMutableArray count](sampleTimestamps, "count"))
    {
      [v4 encodeInt64:self->_numSamples forKey:@"_numSamples"];
      uint64_t v121 = self->_startTime;
      uint64_t v122 = v121;
      if (v121)
      {
        -[SATimestamp addSelfToSerializationDictionary:](v121, "addSelfToSerializationDictionary:", v7);
        objc_msgSend( v4,  "encodeInt64:forKey:",  SASerializableIndexForPointerFromSerializationDictionary(v122, v7),  @"_startTime");
      }

      uint64_t v123 = self->_endTime;
      unsigned int v124 = v123;
      if (v123)
      {
        -[SATimestamp addSelfToSerializationDictionary:](v123, "addSelfToSerializationDictionary:", v7);
        objc_msgSend( v4,  "encodeInt64:forKey:",  SASerializableIndexForPointerFromSerializationDictionary(v124, v7),  @"_endTime");
      }
    }

    SASerializableNewDataBufferDictionaryFromSerializationDictionary(v7);
    uint64_t v125 = (void *)objc_claimAutoreleasedReturnValue();

    [v4 encodeObject:v125 forKey:@"SerializedDataDictionary"];
    [v4 encodeDouble:@"_lastWakeTime" forKey:self->_lastWakeTime];
    [v4 encodeDouble:@"_attemptedSamplingInterval" forKey:self->_attemptedSamplingInterval];
    [v4 encodeObject:self->_kextStat forKey:@"_kextStat"];
    [v4 encodeObject:self->_customOutput forKey:@"_customOutput"];
    [v4 encodeObject:self->_kernelVersion forKey:@"_kernelVersion"];
    [v4 encodeObject:self->_osProductName forKey:@"_osProductName"];
    [v4 encodeObject:self->_osProductVersion forKey:@"_osProductVersion"];
    [v4 encodeObject:self->_osProductVersionExtra forKey:@"_osProductVersionExtra"];
    [v4 encodeObject:self->_osBuildVersion forKey:@"_osBuildVersion"];
    [v4 encodeInt32:self->_arch.cpu_type forKey:@"cpu_type"];
    [v4 encodeInt32:self->_arch.cpu_subtype forKey:@"cpu_subtype"];
    [v4 encodeInt32:self->_machTimebase.numer forKey:@"_machTimebase_numer"];
    [v4 encodeInt32:self->_machTimebase.denom forKey:@"_machTimebase_denom"];
    [v4 encodeInt32:self->_workQueueSoftThreadLimit forKey:@"_workQueueSoftThreadLimit"];
    [v4 encodeInt32:self->_workQueueHardThreadLimit forKey:@"_workQueueHardThreadLimit"];
    [v4 encodeObject:self->_hardwareModel forKey:@"_hardwareModel"];
    [v4 encodeInt32:self->_numActiveCPUs forKey:@"_numActiveCPUs"];
    id v127 = objc_getProperty(self, v126, 1032LL, 1);
    [v4 encodeObject:v127 forKey:@"_clusterFlagsForCPUNumMapping"];

    [v4 encodeInt32:self->_hwPageSize forKey:@"_hwPageSize"];
    [v4 encodeInt32:self->_vmPageSize forKey:@"_vmPageSize"];
    [v4 encodeObject:self->_bootArgs forKey:@"_bootArgs"];
    [v4 encodeObject:self->_systemAdvisoryLevels forKey:@"_systemAdvisoryLevels"];
    [v4 encodeObject:self->_homeVolumeSpace forKey:@"_homeVolumeSpace"];
    [v4 encodeObject:self->_nonDefaultFeatureFlags forKey:@"_nonDefaultFeatureFlags"];
    [v4 encodeInt32:LODWORD(self->_numOSCryptexFileExtents) forKey:@"_numOSCryptexFileExtents"];
    [v4 encodeBool:self->_isRootInstalled forKey:@"_isRootInstalled"];
    [v4 encodeObject:self->_installedRootNames forKey:@"_installedRootNames"];
    if (self->_appleInternalIsKnown)
    {
      [v4 encodeBool:self->_isAppleInternal forKey:@"_isAppleInternal"];
      if (self->_hasInternalCarryDeviceDistinction) {
        [v4 encodeBool:self->_isInternalCarryDevice forKey:@"_isInternalCarryDevice"];
      }
    }

    [v4 encodeObject:self->_automatedDeviceGroup forKey:@"_automatedDeviceGroup"];
    [v4 encodeObject:self->_keyboardLanguages forKey:@"_keyboardLanguages"];
    [v4 encodeObject:self->_preferredLanguages forKey:@"_preferredLanguages"];
    [v4 encodeObject:self->_countryCode forKey:@"_countryCode"];
    if (self->_hasHardwareKeyboardInfo) {
      [v4 encodeBool:self->_hardwareKeyboard forKey:@"_hardwareKeyboard"];
    }
    [v4 encodeInt64:self->_numVnodesAllocated forKey:@"_numVnodesAllocated"];
    [v4 encodeInt64:self->_numVnodesFree forKey:@"_numVnodesFree"];
    [v4 encodeInt64:self->_numVnodesSoftLimit forKey:@"_numVnodesSoftLimit"];
    [v4 encodeInt64:self->_numVnodesHardLimit forKey:@"_numVnodesHardLimit"];
    [v4 encodeObject:self->_activeTrials forKey:@"_activeTrials"];
    [v4 encodeObject:self->_event forKey:@"_event"];
    [v4 encodeObject:self->_eventNote forKey:@"_eventNote"];
    [v4 encodeObject:self->_signature forKey:@"_signature"];
    [v4 encodeObject:self->_actionTaken forKey:@"_actionTaken"];
    [v4 encodeDouble:@"_extraDuration" forKey:self->_extraDuration];
    [v4 encodeObject:self->_durationNote forKey:@"_durationNote"];
    [v4 encodeObject:self->_stepsNote forKey:@"_stepsNote"];
    [v4 encodeInt64:self->_targetThreadId forKey:@"_targetThreadId"];
    [v4 encodeInt64:self->_targetDispatchQueueId forKey:@"_targetDispatchQueueId"];
    [v4 encodeDouble:@"_cpuUsed" forKey:self->_cpuUsed];
    [v4 encodeDouble:@"_cpuDuration" forKey:self->_cpuDuration];
    [v4 encodeDouble:@"_cpuLimit" forKey:self->_cpuLimit];
    [v4 encodeDouble:@"_cpuLimitDuration" forKey:self->_cpuLimitDuration];
    [v4 encodeInt64:self->_numWakeups forKey:@"_numWakeups"];
    [v4 encodeDouble:@"_wakeupsDuration" forKey:self->_wakeupsDuration];
    [v4 encodeInt64:self->_numWakeupsLimit forKey:@"_numWakeupsLimit"];
    [v4 encodeDouble:@"_wakeupsLimitDuration" forKey:self->_wakeupsLimitDuration];
    [v4 encodeDouble:@"_reportTimeThreshold" forKey:self->_reportTimeThreshold];
    wrWorkflowName = self->_wrWorkflowName;
    if (wrWorkflowName)
    {
      [v4 encodeObject:wrWorkflowName forKey:@"_wrWorkflowName"];
      [v4 encodeObject:self->_wrError forKey:@"_wrError"];
      [v4 encodeObject:self->_wrDiagnosticName forKey:@"_wrDiagnosticName"];
      [v4 encodeDouble:@"_wrWorkflowTimeoutDuration" forKey:self->_wrWorkflowTimeoutDuration];
      [v4 encodeDouble:@"_wrWorkflowDurationThreshold" forKey:self->_wrWorkflowDurationThreshold];
      [v4 encodeDouble:@"_wrWorkflowDuration" forKey:self->_wrWorkflowDuration];
      [v4 encodeDouble:@"_wrWorkflowDurationOmittingNetworkBoundIntervalsThreshold" forKey:self->_wrWorkflowDurationOmittingNetworkBoundIntervalsThreshold];
      [v4 encodeDouble:@"_wrWorkflowDurationOmittingNetworkBoundIntervals" forKey:self->_wrWorkflowDurationOmittingNetworkBoundIntervals];
      [v4 encodeObject:self->_wrSignpostName forKey:@"_wrSignpostName"];
      [v4 encodeObject:self->_wrSignpostSubsystem forKey:@"_wrSignpostSubsystem"];
      [v4 encodeObject:self->_wrSignpostCategory forKey:@"_wrSignpostCategory"];
      [v4 encodeObject:self->_wrTriggeringSignpostName forKey:@"_wrTriggeringSignpostName"];
      [v4 encodeObject:self->_wrTriggeringSignpostSubsystem forKey:@"_wrTriggeringSignpostSubsystem"];
      [v4 encodeObject:self->_wrTriggeringSignpostCategory forKey:@"_wrTriggeringSignpostCategory"];
      [v4 encodeInt64:self->_wrSignpostCountThreshold forKey:@"_wrSignpostCountThreshold"];
      [v4 encodeInt64:self->_wrSignpostCount forKey:@"_wrSignpostCount"];
      [v4 encodeDouble:@"_wrSignpostDurationUnionThreshold" forKey:self->_wrSignpostDurationUnionThreshold];
      [v4 encodeDouble:@"_wrSignpostDurationUnion" forKey:self->_wrSignpostDurationUnion];
      [v4 encodeDouble:@"_wrSignpostDurationSumThreshold" forKey:self->_wrSignpostDurationSumThreshold];
      [v4 encodeDouble:@"_wrSignpostDurationSum" forKey:self->_wrSignpostDurationSum];
      [v4 encodeDouble:@"_wrSignpostDurationSingleThreshold" forKey:self->_wrSignpostDurationSingleThreshold];
      [v4 encodeDouble:@"_wrSignpostDurationSingle" forKey:self->_wrSignpostDurationSingle];
    }

    [v4 encodeInt32:self->_targetProcessId forKey:@"_targetProcessId"];
    [v4 encodeInt64:self->_targetHIDEventMachAbs forKey:@"_targetHIDEventMachAbs"];
    [v4 encodeInt64:self->_targetHIDEventEndMachAbs forKey:@"_targetHIDEventEndMachAbs"];
    [v4 encodeInt64:self->_dataSource forKey:@"_dataSource"];
    [v4 encodeInt64:self->_dataStyle forKey:@"_dataStyle"];
    [v4 encodeObject:self->_reason forKey:@"_reason"];
    [v4 encodeBool:self->_hidEventsHaveHighFidelityTimelines forKey:@"_hidEventsHaveHighFidelityTimelines"];
    previousSAVersions = self->_previousSAVersions;
    if (previousSAVersions)
    {
      uint64_t v130 = -[NSArray mutableCopy](previousSAVersions, "mutableCopy");
    }

    else
    {
      uint64_t v130 = [MEMORY[0x189603FA8] arrayWithCapacity:1];
    }

    uint64_t v133 = (void *)v130;
    [MEMORY[0x189607968] numberWithDouble:382.0];
    unsigned int v134 = (void *)objc_claimAutoreleasedReturnValue();
    [v133 addObject:v134];

    [v4 encodeObject:v133 forKey:@"_previousSAVersions"];
    [v4 encodeInt64:self->_gpuRestartCount forKey:@"_gpuRestartCount"];
    [v4 encodeInt64:self->_gpuRestartLastMachAbs forKey:@"_gpuRestartLastMachAbs"];
    [v4 encodeBool:self->_hasEnterprisePersona forKey:@"_hasEnterprisePersona"];
    -[SATask bundleBuildVersion](self->_targetProcess, "bundleBuildVersion");
    unsigned int v135 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v135 forKey:@"_targetProcessBundleVersion"];

    -[SATask bundleShortVersion](self->_targetProcess, "bundleShortVersion");
    uint64_t v136 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v136 forKey:@"_targetProcessBundleShortVersion"];

    -[SATask bundleBuildVersion](self->_targetProcess, "bundleBuildVersion");
    uint64_t v137 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v137 forKey:@"_targetProcessBundleBuildVersion"];

    -[SATask bundleProjectName](self->_targetProcess, "bundleProjectName");
    double v138 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v138 forKey:@"_targetProcessBundleProjectName"];

    -[SATask bundleSourceVersion](self->_targetProcess, "bundleSourceVersion");
    uint64_t v139 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v139 forKey:@"_targetProcessBundleSourceVersion"];

    -[SATask bundleProductBuildVersion](self->_targetProcess, "bundleProductBuildVersion");
    int v140 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v140 forKey:@"_targetProcessBundleProductBuildVersion"];

    -[SATask bundleIdentifier](self->_targetProcess, "bundleIdentifier");
    int v141 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v141 forKey:@"_targetProcessBundleId"];

    objc_msgSend( NSString,  "stringWithFormat:",  @"%llu",  -[SATask adamID](self->_targetProcess, "adamID"));
    uint64_t v142 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v142 forKey:@"_targetProcessCommerceAppID"];

    -[SATask installerVersionID](self->_targetProcess, "installerVersionID");
    BOOL v143 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v143 forKey:@"_targetProcessCommerceExternalID"];

    -[SATask vendorID](self->_targetProcess, "vendorID");
    char v144 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v144 forKey:@"_targetProcessVendorID"];

    _Block_object_dispose(buf, 8);
    objc_autoreleasePoolPop(v6);
  }

  else
  {
    int v131 = *__error();
    _sa_logt();
    uint64_t v132 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl(&dword_186C92000, v132, OS_LOG_TYPE_ERROR, "Invalid encoder", buf, 2u);
    }

    *__error() = v131;
  }
}

uint64_t __56__SASampleStore_SASampleStoreNSCoding__encodeWithCoder___block_invoke(uint64_t result)
{
  return result;
}

void __56__SASampleStore_SASampleStoreNSCoding__encodeWithCoder___block_invoke_2(uint64_t *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 addSelfToSerializationDictionary:v3];
  uint64_t v5 = SASerializableIndexForPointerFromSerializationDictionary(v4, (void *)a1[4]);

  *(void *)(a1[6] + 8LL * (*(void *)(*(void *)(a1[5] + 8) + 24LL))++) = v5;
}

- (SASampleStore)initWithCoder:(id)a3
{
  uint64_t v623 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v558 = (void *)MEMORY[0x186E47ACC]();
  id v563 = v4;
  if (!v4)
  {
    v565 = self;
    int v106 = *__error();
    _sa_logt();
    unsigned int v107 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl(&dword_186C92000, v107, OS_LOG_TYPE_ERROR, "Invalid decoder", buf, 2u);
    }

    unint64_t v108 = 0LL;
    *__error() = v106;
    goto LABEL_193;
  }

  v580.receiver = self;
  v580.super_class = (Class)&OBJC_CLASS___SASampleStore;
  v564 = -[SASampleStore init](&v580, sel_init);

  if (!v564)
  {
    gSASerializationEncodedVersionBeingDecoded();
    IsEmbedded = (_BYTE *)gSASerializationEncodedDataIsEmbedded();
    unsigned int v111 = v558;
LABEL_300:
    *unsigned int v110 = 0LL;
    _BYTE *IsEmbedded = 0;
    unint64_t v108 = v564;
    v565 = v108;
    goto LABEL_301;
  }

  v564->_unint64_t dataGatheringOptions = 0LL;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_osProductVersion"];
  osProductVersiouint64_t n = v564->_osProductVersion;
  v564->_osProductVersiouint64_t n = (NSString *)v5;

  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_osProductVersionExtra"];
  osProductVersionExtra = v564->_osProductVersionExtra;
  v564->_osProductVersionExtra = (NSString *)v7;

  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_osBuildVersion"];
  osBuildVersiouint64_t n = v564->_osBuildVersion;
  v564->_osBuildVersiouint64_t n = (NSString *)v9;

  if ([v4 containsValueForKey:@"_SASampleStore_Serialized_Version"])
  {
    uint64_t v556 = [v4 decodeIntegerForKey:@"_SASampleStore_Serialized_Version"];
    v554 = (uint64_t *)gSASerializationEncodedVersionBeingDecoded();
    uint64_t *v554 = v556;
    v564->_dataSource = [v4 decodeInt64ForKey:@"_dataSource"];
    v564->_dataStyle = [v4 decodeInt64ForKey:@"_dataStyle"];
    id v11 = (void *)MEMORY[0x189604010];
    uint64_t v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v4 decodeArrayOfObjectsOfClasses:v13 forKey:@"_previousSAVersions"];
    previousSAVersions = v564->_previousSAVersions;
    v564->_previousSAVersions = (NSArray *)v14;

    if (!v564->_previousSAVersions)
    {
      id v16 = (void *)MEMORY[0x189603F18];
      [MEMORY[0x189603FE8] null];
      unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = [v16 arrayWithObject:v17];
      uint64_t v19 = v564->_previousSAVersions;
      v564->_previousSAVersions = (NSArray *)v18;
    }

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_osProductName"];
    osProductName = v564->_osProductName;
    v564->_osProductName = (NSString *)v20;

    SAIsEmbeddedPlatform(v564->_osProductName);
    v550 = (_BYTE *)gSASerializationEncodedDataIsEmbedded();
    _BYTE *v550 = v22;
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_reason"];
    reasouint64_t n = v564->_reason;
    v564->_reasouint64_t n = (NSString *)v23;

    [v4 decodeDoubleForKey:@"_lastWakeTime"];
    v564->_lastint WakeTime = v25;
    [v4 decodeDoubleForKey:@"_attemptedSamplingInterval"];
    v564->_attemptedSamplingInterval = v26;
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_kextStat"];
    kextStat = v564->_kextStat;
    v564->_kextStat = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_customOutput"];
    customOutput = v564->_customOutput;
    v564->_customOutput = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_kernelVersion"];
    kernelVersiouint64_t n = v564->_kernelVersion;
    v564->_kernelVersiouint64_t n = (NSString *)v31;

    v564->_arch.cpu_type = [v4 decodeInt32ForKey:@"cpu_type"];
    v564->_arch.cpu_subtype = [v4 decodeInt32ForKey:@"cpu_subtype"];
    v564->_machTimebase.numer = [v4 decodeInt32ForKey:@"_machTimebase_numer"];
    v564->_machTimebase.denouint64_t m = [v4 decodeInt32ForKey:@"_machTimebase_denom"];
    v564->_workQueueSoftThreadLimit = [v4 decodeInt32ForKey:@"_workQueueSoftThreadLimit"];
    v564->_workQueueHardThreadLimit = [v4 decodeInt32ForKey:@"_workQueueHardThreadLimit"];
    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hardwareModel"];
    hardwareModel = v564->_hardwareModel;
    v564->_hardwareModel = (NSString *)v33;

    v564->_numActiveCPUs = [v4 decodeInt32ForKey:@"_numActiveCPUs"];
    id v35 = (void *)MEMORY[0x189604010];
    uint64_t v36 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"_clusterFlagsForCPUNumMapping"];
    clusterFlagsForCPUNumMapping = v564->_clusterFlagsForCPUNumMapping;
    v564->_clusterFlagsForCPUNumMapping = (NSDictionary *)v38;

    v564->_hwPageSize = [v4 decodeInt32ForKey:@"_hwPageSize"];
    v564->_vmPageSize = [v4 decodeInt32ForKey:@"_vmPageSize"];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bootArgs"];
    bootArgs = v564->_bootArgs;
    v564->_bootArgs = (NSString *)v40;

    __int128 v42 = (void *)MEMORY[0x189604010];
    uint64_t v43 = objc_opt_class();
    uint64_t v44 = objc_opt_class();
    objc_msgSend(v42, "setWithObjects:", v43, v44, objc_opt_class(), 0);
    unint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"_systemAdvisoryLevels"];
    systemAdvisoryLevels = v564->_systemAdvisoryLevels;
    v564->_systemAdvisoryLevels = (NSDictionary *)v46;

    uint64_t v48 = (void *)MEMORY[0x189604010];
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_opt_class();
    objc_msgSend(v48, "setWithObjects:", v49, v50, objc_opt_class(), 0);
    unint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v52 = [v4 decodeObjectOfClasses:v51 forKey:@"_homeVolumeSpace"];
    homeVolumeSpace = v564->_homeVolumeSpace;
    v564->_homeVolumeSpace = (NSDictionary *)v52;

    uint64_t v54 = (void *)MEMORY[0x189604010];
    uint64_t v55 = objc_opt_class();
    uint64_t v56 = objc_opt_class();
    objc_msgSend(v54, "setWithObjects:", v55, v56, objc_opt_class(), 0);
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v58 = [v4 decodeObjectOfClasses:v57 forKey:@"_nonDefaultFeatureFlags"];
    nonDefaultFeatureFlags = v564->_nonDefaultFeatureFlags;
    v564->_nonDefaultFeatureFlags = (NSDictionary *)v58;

    v564->_numOSCryptexFileExtents = (int)[v4 decodeInt32ForKey:@"_numOSCryptexFileExtents"];
    __int128 v60 = (void *)MEMORY[0x189604010];
    uint64_t v61 = objc_opt_class();
    objc_msgSend(v60, "setWithObjects:", v61, objc_opt_class(), 0);
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v63 = [v4 decodeObjectOfClasses:v62 forKey:@"_keyboardLanguages"];
    keyboardLanguages = v564->_keyboardLanguages;
    v564->_keyboardLanguages = (NSArray *)v63;

    char v65 = (void *)MEMORY[0x189604010];
    uint64_t v66 = objc_opt_class();
    objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
    id v67 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v68 = [v4 decodeObjectOfClasses:v67 forKey:@"_preferredLanguages"];
    preferredLanguages = v564->_preferredLanguages;
    v564->_preferredLanguages = (NSArray *)v68;

    uint64_t v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_countryCode"];
    countryCode = v564->_countryCode;
    v564->_countryCode = (NSString *)v70;

    v564->_isRootInstalled = [v4 decodeBoolForKey:@"_isRootInstalled"];
    uint64_t v72 = (void *)MEMORY[0x189604010];
    uint64_t v73 = objc_opt_class();
    objc_msgSend(v72, "setWithObjects:", v73, objc_opt_class(), 0);
    id v74 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v75 = [v4 decodeObjectOfClasses:v74 forKey:@"_installedRootNames"];
    installedRootNames = v564->_installedRootNames;
    v564->_installedRootNames = (NSArray *)v75;

    if (-[NSArray count](v564->_installedRootNames, "count")) {
      v564->_isRootInstalled = 1;
    }
    id v77 = (void *)MEMORY[0x189604010];
    uint64_t v78 = objc_opt_class();
    uint64_t v79 = objc_opt_class();
    uint64_t v80 = objc_opt_class();
    objc_msgSend(v77, "setWithObjects:", v78, v79, v80, objc_opt_class(), 0);
    __int128 v81 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v82 = [v4 decodeObjectOfClasses:v81 forKey:@"_activeTrials"];
    activeTrials = v564->_activeTrials;
    v564->_activeTrials = (NSDictionary *)v82;

    if ([v4 containsValueForKey:@"_isAppleInternal"])
    {
      v564->_appleInternalIsKnowuint64_t n = 1;
      v564->_isAppleInternal = [v4 decodeBoolForKey:@"_isAppleInternal"];
      if ([v4 containsValueForKey:@"_isInternalCarryDevice"])
      {
        v564->_hasInternalCarryDeviceDistinctiouint64_t n = 1;
        v564->_isInternalCarryDevice = [v4 decodeBoolForKey:@"_isInternalCarryDevice"];
      }
    }

    uint64_t v84 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_automatedDeviceGroup"];
    automatedDeviceGroup = v564->_automatedDeviceGroup;
    v564->_automatedDeviceGroup = (NSString *)v84;

    if ([v4 containsValueForKey:@"_hardwareKeyboard"])
    {
      v564->_hardwareKeyboard = [v4 decodeBoolForKey:@"_hardwareKeyboard"];
      v564->_hasHardwareKeyboardInfo = 1;
    }

    v564->_numVnodesAllocated = [v4 decodeInt64ForKey:@"_numVnodesAllocated"];
    v564->_numVnodesFree = [v4 decodeInt64ForKey:@"_numVnodesFree"];
    v564->_numVnodesSoftLimit = [v4 decodeInt64ForKey:@"_numVnodesSoftLimit"];
    v564->_numVnodesHardLimit = [v4 decodeInt64ForKey:@"_numVnodesHardLimit"];
    [v4 decodeDoubleForKey:@"_cpuUsed"];
    v564->_cpuUsed = v86;
    [v4 decodeDoubleForKey:@"_cpuDuration"];
    v564->_cpuDuratiouint64_t n = v87;
    [v4 decodeDoubleForKey:@"_cpuLimit"];
    v564->_cpuLimit = v88;
    [v4 decodeDoubleForKey:@"_cpuLimitDuration"];
    v564->_cpuLimitDuratiouint64_t n = v89;
    v564->_numWakeups = [v4 decodeInt64ForKey:@"_numWakeups"];
    [v4 decodeDoubleForKey:@"_wakeupsDuration"];
    v564->_wakeupsDuratiouint64_t n = v90;
    v564->_numWakeupsLimit = [v4 decodeInt64ForKey:@"_numWakeupsLimit"];
    [v4 decodeDoubleForKey:@"_wakeupsLimitDuration"];
    v564->_wakeupsLimitDuratiouint64_t n = v91;
    [v4 decodeDoubleForKey:@"_reportTimeThreshold"];
    v564->_reportTimeThreshold = v92;
    uint64_t v93 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_event"];
    event = v564->_event;
    v564->_event = (NSString *)v93;

    uint64_t v95 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_eventNote"];
    eventNote = v564->_eventNote;
    v564->_eventNote = (NSString *)v95;

    uint64_t v97 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_signature"];
    signature = v564->_signature;
    v564->_signature = (NSString *)v97;

    uint64_t v99 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_actionTaken"];
    actionTakeuint64_t n = v564->_actionTaken;
    v564->_actionTakeuint64_t n = (NSString *)v99;

    [v4 decodeDoubleForKey:@"_extraDuration"];
    v564->_extraDuratiouint64_t n = v101;
    uint64_t v102 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_durationNote"];
    durationNote = v564->_durationNote;
    v564->_durationNote = (NSString *)v102;

    uint64_t v104 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_stepsNote"];
    stepsNote = v564->_stepsNote;
    v564->_stepsNote = (NSString *)v104;

    v564->_int targetProcessId = [v4 decodeInt32ForKey:@"_targetProcessId"];
    v564->_targetHIDEventMachAbs = [v4 decodeInt64ForKey:@"_targetHIDEventMachAbs"];
    v564->_targetHIDEventEndMachAbs = [v4 decodeInt64ForKey:@"_targetHIDEventEndMachAbs"];
    v564->_targetThreadId = [v4 decodeInt64ForKey:@"_targetThreadId"];
    v564->_targetDispatchQueueId = [v4 decodeInt64ForKey:@"_targetDispatchQueueId"];
    if ([v4 containsValueForKey:@"_hidEventsHaveHighFidelityTimelines"])
    {
      v564->_hidEventsHaveHighFidelityTimelines = [v4 decodeBoolForKey:@"_hidEventsHaveHighFidelityTimelines"];
    }

    else
    {
      -[SASampleStore osProductName](v564, "osProductName");
      unint64_t v115 = (void *)objc_claimAutoreleasedReturnValue();
      int v116 = SAIsEmbeddedPlatform(v115);

      if (v116) {
        v564->_hidEventsHaveHighFidelityTimelines = 0;
      }
      else {
        v564->_hidEventsHaveHighFidelityTimelines = 1;
      }
    }

    if ([v4 containsValueForKey:@"_wrWorkflowName"])
    {
      uint64_t v228 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrWorkflowName"];
      wrWorkflowName = v564->_wrWorkflowName;
      v564->_wrWorkflowName = (NSString *)v228;

      uint64_t v230 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrError"];
      wrError = v564->_wrError;
      v564->_wrError = (NSError *)v230;

      uint64_t v232 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrDiagnosticName"];
      wrDiagnosticName = v564->_wrDiagnosticName;
      v564->_wrDiagnosticName = (NSString *)v232;

      [v4 decodeDoubleForKey:@"_wrWorkflowTimeoutDuration"];
      v564->_wrWorkflowTimeoutDuratiouint64_t n = v234;
      [v4 decodeDoubleForKey:@"_wrWorkflowDurationThreshold"];
      v564->_wrWorkflowDurationThreshold = v235;
      [v4 decodeDoubleForKey:@"_wrWorkflowDuration"];
      v564->_wrWorkflowDuratiouint64_t n = v236;
      [v4 decodeDoubleForKey:@"_wrWorkflowDurationOmittingNetworkBoundIntervalsThreshold"];
      v564->_wrWorkflowDurationOmittingNetworkBoundIntervalsThreshold = v237;
      [v4 decodeDoubleForKey:@"_wrWorkflowDurationOmittingNetworkBoundIntervals"];
      v564->_wrWorkflowDurationOmittingNetworkBoundIntervals = v238;
      uint64_t v239 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrSignpostName"];
      wrSignpostName = v564->_wrSignpostName;
      v564->_wrSignpostName = (NSString *)v239;

      uint64_t v241 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrSignpostSubsystem"];
      wrSignpostSubsysteuint64_t m = v564->_wrSignpostSubsystem;
      v564->_wrSignpostSubsysteuint64_t m = (NSString *)v241;

      uint64_t v243 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrSignpostCategory"];
      wrSignpostCategory = v564->_wrSignpostCategory;
      v564->_wrSignpostCategory = (NSString *)v243;

      uint64_t v245 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrTriggeringSignpostName"];
      wrTriggeringSignpostName = v564->_wrTriggeringSignpostName;
      v564->_wrTriggeringSignpostName = (NSString *)v245;

      uint64_t v247 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrTriggeringSignpostSubsystem"];
      wrTriggeringSignpostSubsysteuint64_t m = v564->_wrTriggeringSignpostSubsystem;
      v564->_wrTriggeringSignpostSubsysteuint64_t m = (NSString *)v247;

      uint64_t v249 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_wrTriggeringSignpostCategory"];
      wrTriggeringSignpostCategory = v564->_wrTriggeringSignpostCategory;
      v564->_wrTriggeringSignpostCategory = (NSString *)v249;

      v564->_wrSignpostCountThreshold = [v4 decodeInt64ForKey:@"_wrSignpostCountThreshold"];
      v564->_wrSignpostCount = [v4 decodeInt64ForKey:@"_wrSignpostCount"];
      [v4 decodeDoubleForKey:@"_wrSignpostDurationUnionThreshold"];
      v564->_wrSignpostDurationUnionThreshold = v251;
      [v4 decodeDoubleForKey:@"_wrSignpostDurationUnion"];
      v564->_wrSignpostDurationUniouint64_t n = v252;
      [v4 decodeDoubleForKey:@"_wrSignpostDurationSumThreshold"];
      v564->_wrSignpostDurationSumThreshold = v253;
      [v4 decodeDoubleForKey:@"_wrSignpostDurationSum"];
      v564->_wrSignpostDurationSuuint64_t m = v254;
      [v4 decodeDoubleForKey:@"_wrSignpostDurationSingleThreshold"];
      v564->_wrSignpostDurationSingleThreshold = v255;
      [v4 decodeDoubleForKey:@"_wrSignpostDurationSingle"];
      v564->_wrSignpostDurationSingle = v256;
    }

    v564->_gpuRestartCount = [v4 decodeInt64ForKey:@"_gpuRestartCount"];
    v564->_gpuRestartLastMachAbs = [v4 decodeInt64ForKey:@"_gpuRestartLastMachAbs"];
    v564->_hasEnterprisePersona = [v4 decodeBoolForKey:@"_hasEnterprisePersona"];
    uint64_t v257 = (void *)MEMORY[0x189604010];
    uint64_t v258 = objc_opt_class();
    uint64_t v259 = objc_opt_class();
    objc_msgSend(v257, "setWithObjects:", v258, v259, objc_opt_class(), 0);
    uint64_t v260 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 decodeObjectOfClasses:v260 forKey:@"SerializedDataDictionary"];
    v562 = (void *)objc_claimAutoreleasedReturnValue();

    if (v562)
    {
      id v560 = objc_alloc_init(MEMORY[0x189603FC8]);
      id v261 = v4;
      uint64_t v262 = [v261 decodeBytesForKey:@"_tasks" returnedLength:buf];
      if (v262)
      {
        unint64_t v263 = *(void *)buf;
        uint64_t v264 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:*(void *)buf >> 3];
        tasksByPid = v564->_tasksByPid;
        v564->_tasksByPid = (NSMutableDictionary *)v264;

        uint64_t v266 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v263 >> 3];
        tasksByUniquePid = v564->_tasksByUniquePid;
        v564->_tasksByUniquePid = (NSMutableDictionary *)v266;

        uint64_t v268 = (void *)objc_opt_class();
        SASerializableNewMutableArrayFromIndexList(v262, v263 >> 3, v560, v562, v268);
        __int128 v578 = 0u;
        __int128 v579 = 0u;
        __int128 v576 = 0u;
        __int128 v577 = 0u;
        uint64_t v269 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue();
        uint64_t v270 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v269,  "countByEnumeratingWithState:objects:count:",  &v576,  v612,  16LL);
        if (v270)
        {
          uint64_t v271 = *(void *)v577;
          do
          {
            for (uint64_t i = 0LL; i != v270; ++i)
            {
              if (*(void *)v577 != v271) {
                objc_enumerationMutation(v269);
              }
              uint64_t v273 = *(void **)(*((void *)&v576 + 1) + 8 * i);
              -[SASampleStore addTask:]((uint64_t)v564, v273);
              -[SATask fixupFrameInstructionsWithDataGatheringOptions:mightBeAlive:foundNewBinaryInfo:uuidsWithNewInstructions:additionalCSSymbolicatorFlags:]( (id *)v273,  v564->_dataGatheringOptions,  0,  0LL,  0LL,  v564->_additionalCSSymbolicatorFlags);
            }

            uint64_t v270 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v269,  "countByEnumeratingWithState:objects:count:",  &v576,  v612,  16LL);
          }

          while (v270);
        }
      }

      else
      {
        uint64_t v274 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:0];
        int v275 = v564->_tasksByPid;
        v564->_tasksByPid = (NSMutableDictionary *)v274;

        uint64_t v276 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:0];
        uint64_t v269 = v564->_tasksByUniquePid;
        v564->_tasksByUniquePid = (NSMutableDictionary *)v276;
      }

      -[SASampleStore findTargetProcessInTimeRange:]((uint64_t)v564, 0LL);
      -[SASampleStore lastTaskWithPid:](v564, 0LL);
      __int128 v277 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v279 = v277;
      if (v277) {
        id Property = objc_getProperty(v277, v278, 280LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id v281 = Property;
      BOOL v282 = [v281 count] == 0;

      if (v282)
      {
        uint64_t v283 = [v261 decodeBytesForKey:@"_rootKernelFrames" returnedLength:buf];
        if (v283)
        {
          unint64_t v284 = *(void *)buf;
          uint64_t v285 = (void *)objc_opt_class();
          SASerializableNewMutableSetFromIndexList(v283, v284 >> 3, v560, v562, v285);
          uint64_t v287 = (void *)objc_claimAutoreleasedReturnValue();
          if (v279
            || (-[NSMutableDictionary count](v564->_tasksByUniquePid, "count") ? (uint64_t v288 = 0LL) : (uint64_t v288 = -1LL),
                +[SATask taskWithPid:uniquePid:name:sharedCache:]((uint64_t)&OBJC_CLASS___SATask, 0LL, v288, 0LL, 0LL),
                uint64_t v279 = (void *)objc_claimAutoreleasedReturnValue(),
                -[SASampleStore addTask:]((uint64_t)v564, v279),
                v279))
          {
            objc_setProperty_atomic(v279, v286, v287, 280LL);
          }

          -[SATask fixupFrameInstructionsWithDataGatheringOptions:mightBeAlive:foundNewBinaryInfo:uuidsWithNewInstructions:additionalCSSymbolicatorFlags:]( (id *)v279,  v564->_dataGatheringOptions,  0,  0LL,  0LL,  v564->_additionalCSSymbolicatorFlags);
        }
      }

      if (v556 <= 19 && v564->_targetProcess)
      {
        [v261 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessBundleVersion"];
        char v289 = (void *)objc_claimAutoreleasedReturnValue();
        -[SATask mainBinary](v564->_targetProcess, "mainBinary");
        char v290 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v292 = v290;
        if (v290) {
          objc_setProperty_atomic_copy(v290, v291, v289, 96LL);
        }

        [v261 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessBundleShortVersion"];
        id v293 = (void *)objc_claimAutoreleasedReturnValue();
        -[SATask mainBinary](v564->_targetProcess, "mainBinary");
        uint64_t v294 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v296 = v294;
        if (v294) {
          objc_setProperty_atomic_copy(v294, v295, v293, 104LL);
        }

        [v261 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessBundleBuildVersion"];
        uint64_t v298 = (void *)objc_claimAutoreleasedReturnValue();
        targetProcess = v564->_targetProcess;
        if (targetProcess) {
          objc_setProperty_atomic_copy(targetProcess, v297, v298, 112LL);
        }

        [v261 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessBundleProjectName"];
        uint64_t v301 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v302 = v564->_targetProcess;
        if (v302) {
          objc_setProperty_atomic_copy(v302, v300, v301, 120LL);
        }

        [v261 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessBundleSourceVersion"];
        int v304 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v305 = v564->_targetProcess;
        if (v305) {
          objc_setProperty_atomic_copy(v305, v303, v304, 128LL);
        }

        [v261 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessBundleProductBuildVersion"];
        uint64_t v307 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v308 = v564->_targetProcess;
        if (v308) {
          objc_setProperty_atomic_copy(v308, v306, v307, 136LL);
        }

        [v261 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessBundleId"];
        uint64_t v309 = (void *)objc_claimAutoreleasedReturnValue();
        -[SATask mainBinary](v564->_targetProcess, "mainBinary");
        uint64_t v310 = (void *)objc_claimAutoreleasedReturnValue();
        int v312 = v310;
        if (v310) {
          objc_setProperty_atomic_copy(v310, v311, v309, 88LL);
        }

        [v261 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessCommerceAppID"];
        uint64_t v313 = (void *)objc_claimAutoreleasedReturnValue();
        if (v313)
        {
          id v314 = objc_alloc_init(MEMORY[0x189607978]);
          [v314 numberFromString:v313];
          uint64_t v315 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v316 = v315;
          if (v315)
          {
            uint64_t v317 = [v315 unsignedLongLongValue];
            uint64_t v318 = v564->_targetProcess;
            if (v318) {
              v318->_adamID = v317;
            }
          }

          else
          {
            int v393 = *__error();
            _sa_logt();
            uint64_t v394 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v394, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)__int128 buf = 138412290;
              *(void *)&uint8_t buf[4] = v313;
              _os_log_fault_impl( &dword_186C92000,  v394,  OS_LOG_TYPE_FAULT,  "Unable to parse commerceAppID %@",  buf,  0xCu);
            }

            *__error() = v393;
          }
        }

        [v261 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessCommerceExternalID"];
        uint64_t v396 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v397 = v564->_targetProcess;
        if (v397) {
          objc_setProperty_atomic_copy(v397, v395, v396, 168LL);
        }

        [v261 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessVendorID"];
        uint64_t v399 = (void *)objc_claimAutoreleasedReturnValue();
        int v400 = v564->_targetProcess;
        if (v400) {
          objc_setProperty_atomic_copy(v400, v398, v399, 176LL);
        }
      }

      id v401 = v261;
      uint64_t v402 = [v401 decodeBytesForKey:@"_fanSpeeds" returnedLength:buf];
      if (v402)
      {
        unint64_t v403 = *(void *)buf;
        uint64_t v404 = (void *)objc_opt_class();
        uint64_t v405 = SASerializableNewMutableArrayFromIndexList(v402, v403 >> 3, v560, v562, v404);
        fanSpeeds = v564->_fanSpeeds;
        v564->_fanSpeeds = (NSMutableArray *)v405;
      }

      else
      {
        fanSpeeds = v564->_fanSpeeds;
        v564->_fanSpeeds = 0LL;
      }

      id v407 = v401;
      uint64_t v408 = [v407 decodeBytesForKey:@"_powerModeTransitions" returnedLength:buf];
      if (v408)
      {
        unint64_t v409 = *(void *)buf;
        uint64_t v410 = (void *)objc_opt_class();
        uint64_t v411 = SASerializableNewMutableArrayFromIndexList(v408, v409 >> 3, v560, v562, v410);
        powerModeTransitions = v564->_powerModeTransitions;
        v564->_powerModeTransitions = (NSMutableArray *)v411;
      }

      else
      {
        powerModeTransitions = v564->_powerModeTransitions;
        v564->_powerModeTransitions = 0LL;
      }

      if (*v554 <= 33 && *v550)
      {
        uint64_t v413 = [v407 decodeBytesForKey:@"_hidEvents" returnedLength:buf];
        if (!v413)
        {
          hidEvents = v564->_hidEvents;
          v564->_hidEvents = 0LL;
          goto LABEL_216;
        }
      }

      else
      {
        uint64_t v413 = [v407 decodeBytesForKey:@"_hidEvents" returnedLength:buf];
        if (!v413)
        {
          hidEvents = v564->_hidEvents;
          v564->_hidEvents = 0LL;
          goto LABEL_216;
        }
      }

      unint64_t v414 = *(void *)buf;
      uint64_t v415 = (void *)objc_opt_class();
      uint64_t v416 = SASerializableNewMutableArrayFromIndexList(v413, v414 >> 3, v560, v562, v415);
      hidEvents = v564->_hidEvents;
      v564->_hidEvents = (NSMutableArray *)v416;
LABEL_216:

      id v418 = v407;
      uint64_t v419 = [v418 decodeBytesForKey:@"_gestures" returnedLength:buf];
      if (v419)
      {
        unint64_t v420 = *(void *)buf;
        uint64_t v421 = (void *)objc_opt_class();
        uint64_t v422 = SASerializableNewMutableArrayFromIndexList(v419, v420 >> 3, v560, v562, v421);
        gestures = v564->_gestures;
        v564->_gestures = (NSMutableArray *)v422;
      }

      else
      {
        gestures = v564->_gestures;
        v564->_gestures = 0LL;
      }

      if (!v564->_gestures)
      {
        int v424 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
        v425 = v564->_gestures;
        v564->_gestures = v424;
      }

      id v553 = v418;
      uint64_t v426 = [v553 decodeBytesForKey:@"_ioEvents" returnedLength:buf];
      if (v426)
      {
        unint64_t v427 = *(void *)buf;
        uint64_t v428 = (void *)objc_opt_class();
        uint64_t v429 = SASerializableNewMutableArrayFromIndexList(v426, v427 >> 3, v560, v562, v428);
        ioEvents = v564->_ioEvents;
        v564->_ioEvents = (NSMutableArray *)v429;
      }

      else
      {
        ioEvents = v564->_ioEvents;
        v564->_ioEvents = 0LL;
      }

      uint64_t v431 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      ioEventsByTid = v564->_ioEventsByTid;
      v564->_ioEventsByTid = v431;

      __int128 v574 = 0u;
      __int128 v575 = 0u;
      __int128 v572 = 0u;
      __int128 v573 = 0u;
      uint64_t v433 = v564->_ioEvents;
      uint64_t v434 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v433,  "countByEnumeratingWithState:objects:count:",  &v572,  v611,  16LL);
      if (v434)
      {
        uint64_t v435 = *(void *)v573;
        do
        {
          for (uint64_t j = 0LL; j != v434; ++j)
          {
            if (*(void *)v573 != v435) {
              objc_enumerationMutation(v433);
            }
            uint64_t v437 = *(void **)(*((void *)&v572 + 1) + 8 * j);
            uint64_t v438 = v564->_ioEventsByTid;
            objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v437, "threadID"));
            char v439 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](v438, "objectForKeyedSubscript:", v439);
            char v440 = (void *)objc_claimAutoreleasedReturnValue();

            if (v440)
            {
              [v440 addObject:v437];
            }

            else
            {
              int v441 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v437, 0);
              v442 = v564->_ioEventsByTid;
              objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v437, "threadID"));
              unint64_t v443 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v442, "setObject:forKeyedSubscript:", v441, v443);
            }
          }

          uint64_t v434 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v433,  "countByEnumeratingWithState:objects:count:",  &v572,  v611,  16LL);
        }

        while (v434);
      }

      id v444 = v553;
      uint64_t v445 = [v444 decodeBytesForKey:@"_memoryPressureEvents" returnedLength:buf];
      if (v445)
      {
        unint64_t v446 = *(void *)buf;
        v447 = (void *)objc_opt_class();
        uint64_t v448 = SASerializableNewMutableArrayFromIndexList(v445, v446 >> 3, v560, v562, v447);
        memoryPressureEvents = v564->_memoryPressureEvents;
        v564->_memoryPressureEvents = (NSMutableArray *)v448;
      }

      else
      {
        memoryPressureEvents = v564->_memoryPressureEvents;
        v564->_memoryPressureEvents = 0LL;
      }

      id v450 = v444;
      uint64_t v451 = [v450 decodeBytesForKey:@"_sharedCaches" returnedLength:buf];
      if (v451)
      {
        unint64_t v452 = *(void *)buf;
        v453 = (void *)objc_opt_class();
        uint64_t v454 = SASerializableNewMutableArrayFromIndexList(v451, v452 >> 3, v560, v562, v453);
        sharedCaches = v564->_sharedCaches;
        v564->_sharedCaches = (NSMutableArray *)v454;
      }

      else
      {
        sharedCaches = v564->_sharedCaches;
        v564->_sharedCaches = 0LL;
      }

      id v456 = v450;
      uint64_t v457 = [v456 decodeBytesForKey:@"_kernelCaches" returnedLength:buf];
      if (v457)
      {
        unint64_t v458 = *(void *)buf;
        v459 = (void *)objc_opt_class();
        uint64_t v460 = SASerializableNewMutableArrayFromIndexList(v457, v458 >> 3, v560, v562, v459);
        kernelCaches = v564->_kernelCaches;
        v564->_kernelCaches = (NSMutableArray *)v460;
      }

      else
      {
        kernelCaches = v564->_kernelCaches;
        v564->_kernelCaches = 0LL;
      }

      id v462 = v456;
      uint64_t v463 = [v462 decodeBytesForKey:@"_exclaves" returnedLength:buf];
      if (v463)
      {
        unint64_t v464 = *(void *)buf;
        v465 = (void *)objc_opt_class();
        uint64_t v466 = SASerializableNewMutableArrayFromIndexList(v463, v464 >> 3, v560, v562, v465);
        exclaves = v564->_exclaves;
        v564->_exclaves = (NSMutableArray *)v466;
      }

      else
      {
        exclaves = v564->_exclaves;
        v564->_exclaves = 0LL;
      }

      v468 = v564->_exclaves;
      if (v468)
      {
        __int128 v570 = 0u;
        __int128 v571 = 0u;
        __int128 v568 = 0u;
        __int128 v569 = 0u;
        v469 = v468;
        uint64_t v470 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v469,  "countByEnumeratingWithState:objects:count:",  &v568,  v610,  16LL);
        if (v470)
        {
          uint64_t v471 = *(void *)v569;
          do
          {
            for (uint64_t k = 0LL; k != v470; ++k)
            {
              if (*(void *)v569 != v471) {
                objc_enumerationMutation(v469);
              }
              -[SAExclave fixupFrameInstructionsWithNewInstructions:foundNewBinaryInfo:]( *(void *)(*((void *)&v568 + 1) + 8 * k),  0LL,  0LL);
            }

            uint64_t v470 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v469,  "countByEnumeratingWithState:objects:count:",  &v568,  v610,  16LL);
          }

          while (v470);
        }
      }

      id v473 = v462;
      uint64_t v474 = [v473 decodeBytesForKey:@"_kperfTriggers" returnedLength:buf];
      if (v474)
      {
        unint64_t v475 = *(void *)buf;
        v476 = (void *)objc_opt_class();
        uint64_t v477 = SASerializableNewMutableArrayFromIndexList(v474, v475 >> 3, v560, v562, v476);
        kperfTriggers = v564->_kperfTriggers;
        v564->_kperfTriggers = (NSArray *)v477;
      }

      else
      {
        kperfTriggers = v564->_kperfTriggers;
        v564->_kperfTriggers = 0LL;
      }

      uint64_t v479 = -[NSArray copy](v564->_kperfTriggers, "copy");
      v480 = v564->_kperfTriggers;
      v564->_kperfTriggers = (NSArray *)v479;

      id v481 = v473;
      uint64_t v482 = [v481 decodeBytesForKey:@"_models" returnedLength:buf];
      if (v482)
      {
        unint64_t v483 = *(void *)buf;
        id v484 = (void *)objc_opt_class();
        uint64_t v485 = SASerializableNewMutableArrayFromIndexList(v482, v483 >> 3, v560, v562, v484);
        models = v564->_models;
        v564->_models = (NSArray *)v485;
      }

      else
      {
        models = v564->_models;
        v564->_models = 0LL;
      }

      uint64_t v487 = -[NSArray copy](v564->_models, "copy");
      v488 = v564->_models;
      v564->_models = (NSArray *)v487;

      if (![v481 containsValueForKey:@"_mountStatusTracker"]
        || (unint64_t v489 = [v481 decodeInt64ForKey:@"_mountStatusTracker"], v489 == -1))
      {
        v491 = objc_alloc_init(&OBJC_CLASS___SAMountStatusTracker);
      }

      else
      {
        v490 = (void *)objc_opt_class();
        SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v489,  v560,  v562,  v490);
        v491 = (SAMountStatusTracker *)objc_claimAutoreleasedReturnValue();
      }

      mountStatusTracker = v564->_mountStatusTracker;
      v564->_mountStatusTracker = v491;

      if ([v481 containsValueForKey:@"_wsDataStore"])
      {
        unint64_t v493 = [v481 decodeInt64ForKey:@"_wsDataStore"];
        id v494 = (void *)objc_opt_class();
        uint64_t v495 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v493,  v560,  v562,  v494,  0);
        wsDataStore = v564->_wsDataStore;
        v564->_wsDataStore = (SAWSUpdateDataStore *)v495;
      }

      else
      {
        wsDataStore = v564->_wsDataStore;
        v564->_wsDataStore = 0LL;
      }

      if ([v481 containsValueForKey:@"_timeWhenTransitionedToSamplingAllProcesses"])
      {
        unint64_t v497 = [v481 decodeInt64ForKey:@"_timeWhenTransitionedToSamplingAllProcesses"];
        v498 = (void *)objc_opt_class();
        uint64_t v499 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v497,  v560,  v562,  v498,  0);
        timeWhenTransitionedToSamplingAllProcesses = v564->_timeWhenTransitionedToSamplingAllProcesses;
        v564->_timeWhenTransitionedToSamplingAllProcesses = (SATimestamp *)v499;
      }

      else
      {
        timeWhenTransitionedToSamplingAllProcesses = v564->_timeWhenTransitionedToSamplingAllProcesses;
        v564->_timeWhenTransitionedToSamplingAllProcesses = 0LL;
      }

      if ([v481 containsValueForKey:@"_timeWhenTransitionedToSamplingAllThreads"])
      {
        unint64_t v501 = [v481 decodeInt64ForKey:@"_timeWhenTransitionedToSamplingAllThreads"];
        __int128 v502 = (void *)objc_opt_class();
        uint64_t v503 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v501,  v560,  v562,  v502,  0);
        timeWhenTransitionedToSamplingAllThreads = v564->_timeWhenTransitionedToSamplingAllThreads;
        v564->_timeWhenTransitionedToSamplingAllThreads = (SATimestamp *)v503;
      }

      else
      {
        timeWhenTransitionedToSamplingAllThreads = v564->_timeWhenTransitionedToSamplingAllThreads;
        v564->_timeWhenTransitionedToSamplingAllThreads = 0LL;
      }

      if ([v481 containsValueForKey:@"_cpuSignalHandlerStackLeafKernelFrame"])
      {
        unint64_t v505 = [v481 decodeInt64ForKey:@"_cpuSignalHandlerStackLeafKernelFrame"];
        __int128 v506 = (void *)objc_opt_class();
        uint64_t v507 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v505,  v560,  v562,  v506,  0);
        cpuSignalHandlerStackLeafKernelFrame = v564->_cpuSignalHandlerStackLeafKernelFrame;
        v564->_cpuSignalHandlerStackLeafKernelFrame = (SAFrame *)v507;
      }

      else
      {
        cpuSignalHandlerStackLeafKernelFrame = v564->_cpuSignalHandlerStackLeafKernelFrame;
        v564->_cpuSignalHandlerStackLeafKernelFrame = 0LL;
      }

      if ([v481 containsValueForKey:@"_eventTimeRange"])
      {
        unint64_t v509 = [v481 decodeInt64ForKey:@"_eventTimeRange"];
        v510 = (void *)objc_opt_class();
        uint64_t v511 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v509,  v560,  v562,  v510,  0);
        eventTimeRange = v564->_eventTimeRange;
        v564->_eventTimeRange = (SATimeRange *)v511;
      }

      else
      {
        eventTimeRange = v564->_eventTimeRange;
        v564->_eventTimeRange = 0LL;
      }

      if ([v481 containsValueForKey:@"_timestampOfLastStackshot"])
      {
        unint64_t v513 = [v481 decodeInt64ForKey:@"_timestampOfLastStackshot"];
        v514 = (void *)objc_opt_class();
        uint64_t v515 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v513,  v560,  v562,  v514,  0);
        timestampOfLastStackshot = v564->_timestampOfLastStackshot;
        v564->_timestampOfLastStackshot = (SATimestamp *)v515;
      }

      else
      {
        timestampOfLastStackshot = v564->_timestampOfLastStackshot;
        v564->_timestampOfLastStackshot = 0LL;
      }

      id v517 = v481;
      uint64_t v518 = [v517 decodeBytesForKey:@"_sampleTimestamps" returnedLength:buf];
      if (v518)
      {
        unint64_t v519 = *(void *)buf;
        int v520 = (void *)objc_opt_class();
        uint64_t v521 = SASerializableNewMutableArrayFromIndexList(v518, v519 >> 3, v560, v562, v520);
        sampleTimestamps = v564->_sampleTimestamps;
        v564->_sampleTimestamps = (NSMutableArray *)v521;
      }

      else
      {
        sampleTimestamps = v564->_sampleTimestamps;
        v564->_sampleTimestamps = 0LL;
      }

      if (!-[NSMutableArray count](v564->_sampleTimestamps, "count"))
      {
        if ([v517 containsValueForKey:@"_startTime"])
        {
          unint64_t v523 = [v517 decodeInt64ForKey:@"_startTime"];
          __int128 v524 = (void *)objc_opt_class();
          uint64_t v525 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v523,  v560,  v562,  v524,  0);
          startTime = v564->_startTime;
          v564->_startTime = (SATimestamp *)v525;
        }

        else
        {
          startTime = v564->_startTime;
          v564->_startTime = 0LL;
        }

        if ([v517 containsValueForKey:@"_endTime"])
        {
          unint64_t v527 = [v517 decodeInt64ForKey:@"_endTime"];
          v528 = (void *)objc_opt_class();
          uint64_t v529 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v527,  v560,  v562,  v528,  0);
          endTime = v564->_endTime;
          v564->_endTime = (SATimestamp *)v529;
        }

        else
        {
          endTime = v564->_endTime;
          v564->_endTime = 0LL;
        }

        v564->_numSamples = [v517 decodeInt64ForKey:@"_numSamples"];
      }

      v564->_sampleOnlyMainThreads = 0;
      v564->_shouldGatherKextStat = 0;
      v531 = +[SABinaryLocator sharedBinaryLocator](&OBJC_CLASS___SABinaryLocator, "sharedBinaryLocator");
      binaryLocator = v564->_binaryLocator;
      v564->_binaryLocator = v531;

      if (v564->_machTimebase.denom && v564->_machTimebase.numer)
      {
        v566[0] = MEMORY[0x1895F87A8];
        v566[1] = 3221225472LL;
        v566[2] = __54__SASampleStore_SASampleStoreNSCoding__initWithCoder___block_invoke;
        v566[3] = &unk_189F61580;
        v567 = v564;
        -[SASampleStore iterateAllTimestamps:]((uint64_t)v567, v566);
      }

      [v560 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_7];

      if (v556 >= 37) {
        fprintf( (FILE *)*MEMORY[0x1895F89D0],  "WARNING: Binary version %lu is newer than SASampleStore's decoder version %lu. Some data in the original repor t may not be available in the reparsed report\n",  v556,  36LL);
      }
      unsigned int v111 = v558;
      unsigned int v110 = v554;
      IsEmbedded = v550;
      goto LABEL_300;
    }

    goto LABEL_307;
  }

  id v112 = v4;
  id context = (void *)MEMORY[0x186E47ACC]();
  v564->_unint64_t dataGatheringOptions = 0LL;
  if (([v112 containsValueForKey:@"_PASampleTimeSeriesDataStore_Serialized_Version"] & 1) == 0)
  {
    *(void *)gSASerializationEncodedVersionBeingDecoded() = 1LL;
LABEL_306:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Encoded version too old",  0LL);
    id v542 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v542);
LABEL_318:
    __break(1u);
    JUMPOUT(0x186CBF88CLL);
  }

  uint64_t v559 = [v112 decodeIntegerForKey:@"_PASampleTimeSeriesDataStore_Serialized_Version"];
  if (v559 >= 16)
  {
    int v534 = *__error();
    _sa_logt();
    v535 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v535, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v613) = 134217984;
      *(void *)((char *)&v613 + 4) = v559;
      _os_log_error_impl( &dword_186C92000,  v535,  OS_LOG_TYPE_ERROR,  "encodedVersion %ld for PAStyleCoder",  (uint8_t *)&v613,  0xCu);
    }

    *__error() = v534;
    _SASetCrashLogMessage(11314, "encodedVersion %ld for PAStyleCoder", v536, v537, v538, v539, v540, v541, v559);
    _os_crash();
    __break(1u);
  }

  __int128 v548 = (uint64_t *)gSASerializationEncodedVersionBeingDecoded();
  *__int128 v548 = v559;
  if (v559 <= 7) {
    goto LABEL_306;
  }
  if ([v112 containsValueForKey:@"_osProductName"])
  {
    uint64_t v113 = [v112 decodeObjectOfClass:objc_opt_class() forKey:@"_osProductName"];
    unint64_t v114 = v564->_osProductName;
    v564->_osProductName = (NSString *)v113;
  }

  else
  {
    unint64_t v114 = v564->_osProductName;
    v564->_osProductName = (NSString *)@"Mac OS X";
  }

  SAIsEmbeddedPlatform(v564->_osProductName);
  __int128 v547 = (_BYTE *)gSASerializationEncodedDataIsEmbedded();
  *__int128 v547 = v117;
  if (![v112 containsValueForKey:@"_dataSource"])
  {
    uint64_t v120 = 1LL;
    int v119 = v564;
    goto LABEL_33;
  }

  char v118 = [v112 decodeInt64ForKey:@"_dataSource"];
  if ((v118 & 2) != 0) {
    v564->_dataSource |= 1uLL;
  }
  int v119 = v564;
  if ((v118 & 4) != 0)
  {
    uint64_t v120 = v564->_dataSource | 2;
LABEL_33:
    v119->_dataSource = v120;
  }

  v119->_dataStyle = 2LL;
  uint64_t v121 = [v112 decodeObjectOfClass:objc_opt_class() forKey:@"_reason"];
  uint64_t v122 = v564->_reason;
  v564->_reasouint64_t n = (NSString *)v121;

  double v123 = 0.0;
  v564->_lastint WakeTime = v123;
  [v112 decodeDoubleForKey:@"_attemptedSamplingInterval"];
  v564->_attemptedSamplingInterval = v124;
  uint64_t v125 = [v112 decodeObjectOfClass:objc_opt_class() forKey:@"_kextStat"];
  SEL v126 = v564->_kextStat;
  v564->_kextStat = (NSString *)v125;

  uint64_t v127 = [v112 decodeObjectOfClass:objc_opt_class() forKey:@"_kernelVersion"];
  uint64_t v128 = v564->_kernelVersion;
  v564->_kernelVersiouint64_t n = (NSString *)v127;

  uint64_t v129 = [v112 decodeObjectOfClass:objc_opt_class() forKey:@"_osProductVersion"];
  uint64_t v130 = v564->_osProductVersion;
  v564->_osProductVersiouint64_t n = (NSString *)v129;

  uint64_t v131 = [v112 decodeObjectOfClass:objc_opt_class() forKey:@"_osProductVersionExtra"];
  uint64_t v132 = v564->_osProductVersionExtra;
  v564->_osProductVersionExtra = (NSString *)v131;

  uint64_t v133 = [v112 decodeObjectOfClass:objc_opt_class() forKey:@"_osBuildVersion"];
  unsigned int v134 = v564->_osBuildVersion;
  v564->_osBuildVersiouint64_t n = (NSString *)v133;

  id v557 = [v112 decodeObjectOfClass:objc_opt_class() forKey:@"_machineArchitecture"];
  [v557 UTF8String];
  v564->_arch = (_CSArchitecture)CSArchitectureGetArchitectureForName();
  v564->_workQueueSoftThreadLimit = [v112 decodeInt32ForKey:@"_workQueueSoftThreadLimit"];
  v564->_workQueueHardThreadLimit = [v112 decodeInt32ForKey:@"_workQueueHardThreadLimit"];
  uint64_t v135 = [v112 decodeObjectOfClass:objc_opt_class() forKey:@"_hardwareModel"];
  uint64_t v136 = v564->_hardwareModel;
  v564->_hardwareModel = (NSString *)v135;

  v564->_numActiveCPUs = [v112 decodeInt32ForKey:@"_numActiveCPUs"];
  uint64_t v137 = [v112 decodeObjectOfClass:objc_opt_class() forKey:@"_bootArgs"];
  double v138 = v564->_bootArgs;
  v564->_bootArgs = (NSString *)v137;

  v564->_targetThreadId = [v112 decodeInt64ForKey:@"_targetThreadId"];
  unsigned int v139 = [v112 decodeInt32ForKey:@"_cpuPercent"];
  int v140 = [v112 decodeInt32ForKey:@"_cpuDuration"];
  v564->_cpuDuratiouint64_t n = (double)v140;
  v564->_cpuUsed = (double)v139 * (double)v140 / 100.0;
  v564->_numWakeups = (int)[v112 decodeInt32ForKey:@"_wakeupsPerSec"];
  v564->_wakeupsDuratiouint64_t n = (double)(int)[v112 decodeInt32ForKey:@"_wakeupsDuration"];
  uint64_t v141 = [v112 decodeObjectOfClass:objc_opt_class() forKey:@"_event"];
  uint64_t v142 = v564->_event;
  v564->_event = (NSString *)v141;

  uint64_t v143 = [v112 decodeObjectOfClass:objc_opt_class() forKey:@"_eventNote"];
  char v144 = v564->_eventNote;
  v564->_eventNote = (NSString *)v143;

  __int128 v145 = v564->_eventTimeRange;
  v564->_eventTimeRange = 0LL;

  __int128 v146 = v564->_timestampOfLastStackshot;
  v564->_timestampOfLastStackshot = 0LL;

  uint64_t v147 = [v112 decodeObjectOfClass:objc_opt_class() forKey:@"_signature"];
  __int128 v148 = v564->_signature;
  v564->_signature = (NSString *)v147;

  __int128 v149 = v564->_actionTaken;
  v564->_actionTakeuint64_t n = 0LL;

  [v112 decodeDoubleForKey:@"_extraDuration"];
  v564->_extraDuratiouint64_t n = v150;
  uint64_t v151 = [v112 decodeObjectOfClass:objc_opt_class() forKey:@"_durationNote"];
  __int128 v152 = v564->_durationNote;
  v564->_durationNote = (NSString *)v151;

  uint64_t v153 = [v112 decodeObjectOfClass:objc_opt_class() forKey:@"_stepsNote"];
  __int128 v154 = v564->_stepsNote;
  v564->_stepsNote = (NSString *)v153;

  v564->_int targetProcessId = [v112 decodeInt32ForKey:@"_targetProcessId"];
  [v112 decodeDoubleForKey:@"_timeWhenTransitionedToSamplingAllProcesses"];
  if (v155 != 0.0)
  {
    uint64_t v156 = +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:",  0LL,  0LL,  v155,  0.0,  0.0);
    __int128 v157 = v564->_timeWhenTransitionedToSamplingAllThreads;
    v564->_timeWhenTransitionedToSamplingAllThreads = (SATimestamp *)v156;
  }

  __int128 v158 = (void *)MEMORY[0x189604010];
  uint64_t v159 = objc_opt_class();
  uint64_t v160 = objc_opt_class();
  objc_msgSend(v158, "setWithObjects:", v159, v160, objc_opt_class(), 0);
  __int128 v161 = (void *)objc_claimAutoreleasedReturnValue();
  [v112 decodeObjectOfClasses:v161 forKey:@"SerializedDataDictionary"];
  v561 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v561)
  {
LABEL_307:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"nil dataDictionary",  0LL);
    id v543 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v543);
    goto LABEL_318;
  }

  id v162 = v112;
  uint64_t v163 = [v162 decodeBytesForKey:@"TimeInsensitiveTaskIndices" returnedLength:&v609];
  if ([v162 containsValueForKey:@"RootKernelFrames"])
  {
    uint64_t v164 = [v162 decodeBytesForKey:@"RootKernelFrames" returnedLength:&v608];
  }

  else
  {
    uint64_t v164 = 0LL;
    unint64_t v608 = 0LL;
  }

  id v165 = v162;
  uint64_t v551 = [v165 decodeBytesForKey:@"SampleDataIndices" returnedLength:&v607];
  id v166 = v165;
  uint64_t v555 = [v166 decodeBytesForKey:@"FanSpeedIndices" returnedLength:&v606];
  id v167 = v166;
  id v552 = (id)[v167 decodeBytesForKey:@"HIDEventIndices" returnedLength:&v605];
  if ((v609 & 7) != 0)
  {
    uint64_t v544 = @"Unexpected task index array length";
LABEL_313:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  v544,  0LL);
    id v545 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v545);
    goto LABEL_318;
  }

  if ((v607 & 7) != 0)
  {
    uint64_t v544 = @"Unexpected sample index array length";
    goto LABEL_313;
  }

  if ((v606 & 7) != 0)
  {
    uint64_t v544 = @"Unexpected fan index array length";
    goto LABEL_313;
  }

  if ((v605 & 7) != 0)
  {
    uint64_t v544 = @"Unexpected hid event array length";
    goto LABEL_313;
  }

  id v168 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (v163)
  {
    unint64_t v169 = v609;
    if (v609)
    {
      uint64_t v170 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v609 >> 3];
      __int128 v171 = v564->_tasksByPid;
      v564->_tasksByPid = (NSMutableDictionary *)v170;

      uint64_t v172 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v169 >> 3];
      __int128 v173 = v564->_tasksByUniquePid;
      v564->_tasksByUniquePid = (NSMutableDictionary *)v172;

      unint64_t v174 = v609;
      __int128 v175 = (void *)objc_opt_class();
      SASerializableNewMutableArrayFromIndexList(v163, v174 >> 3, v168, v561, v175);
      __int128 v176 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v603 = 0u;
      __int128 v604 = 0u;
      __int128 v601 = 0u;
      __int128 v602 = 0u;
      id v177 = v176;
      uint64_t v179 = [v177 countByEnumeratingWithState:&v601 objects:buf count:16];
      if (v179)
      {
        uint64_t v180 = *(void *)v602;
        do
        {
          for (uint64_t m = 0LL; m != v179; ++m)
          {
            if (*(void *)v602 != v180) {
              objc_enumerationMutation(v177);
            }
            id v182 = *(id *)(*((void *)&v601 + 1) + 8 * m);
            if (v182) {
              id v182 = objc_getProperty(v182, v178, 8LL, 1);
            }
            id v183 = v182;
            -[SASampleStore addTask:]((uint64_t)v564, v183);
          }

          uint64_t v179 = [v177 countByEnumeratingWithState:&v601 objects:buf count:16];
        }

        while (v179);
      }

      -[SASampleStore findTargetProcessInTimeRange:]((uint64_t)v564, 0LL);
    }
  }

  if (v164)
  {
    unint64_t v184 = v608;
    __int128 v185 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:v608 >> 3];
    __int128 v186 = (void *)objc_opt_class();
    SASerializableNewMutableSetFromIndexList(v164, v184 >> 3, v168, v561, v186);
    __int128 v187 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v599 = 0u;
    __int128 v600 = 0u;
    __int128 v597 = 0u;
    __int128 v598 = 0u;
    id v188 = v187;
    uint64_t v190 = [v188 countByEnumeratingWithState:&v597 objects:v621 count:16];
    if (v190)
    {
      uint64_t v191 = *(void *)v598;
      do
      {
        for (uint64_t n = 0LL; n != v190; ++n)
        {
          if (*(void *)v598 != v191) {
            objc_enumerationMutation(v188);
          }
          id v193 = *(id *)(*((void *)&v597 + 1) + 8 * n);
          if (v193) {
            id v193 = objc_getProperty(v193, v189, 8LL, 1);
          }
          id v194 = v193;
          [v185 addObject:v194];
        }

        uint64_t v190 = [v188 countByEnumeratingWithState:&v597 objects:v621 count:16];
      }

      while (v190);
    }

    -[SASampleStore lastTaskWithPid:](v564, 0LL);
    __int128 v196 = (void *)objc_claimAutoreleasedReturnValue();
    if (v196
      || (-[NSMutableDictionary count](v564->_tasksByUniquePid, "count") ? (uint64_t v197 = 0LL) : (uint64_t v197 = -1LL),
          +[SATask taskWithPid:uniquePid:name:sharedCache:]((uint64_t)&OBJC_CLASS___SATask, 0LL, v197, 0LL, 0LL),
          __int128 v196 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SASampleStore addTask:]((uint64_t)v564, v196),
          v196))
    {
      objc_setProperty_atomic(v196, v195, v185, 280LL);
    }
  }

  if (v564->_targetProcess)
  {
    [v167 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessBundleVersion"];
    id v198 = (void *)objc_claimAutoreleasedReturnValue();
    -[SATask mainBinary](v564->_targetProcess, "mainBinary");
    uint64_t v199 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v201 = v199;
    if (v199) {
      objc_setProperty_atomic_copy(v199, v200, v198, 96LL);
    }

    [v167 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessBundleShortVersion"];
    uint64_t v202 = (void *)objc_claimAutoreleasedReturnValue();
    -[SATask mainBinary](v564->_targetProcess, "mainBinary");
    int v203 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v205 = v203;
    if (v203) {
      objc_setProperty_atomic_copy(v203, v204, v202, 104LL);
    }

    [v167 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessBundleBuildVersion"];
    uint64_t v207 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v208 = v564->_targetProcess;
    if (v208) {
      objc_setProperty_atomic_copy(v208, v206, v207, 112LL);
    }

    [v167 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessBundleProjectName"];
    uint64_t v210 = (void *)objc_claimAutoreleasedReturnValue();
    char v211 = v564->_targetProcess;
    if (v211) {
      objc_setProperty_atomic_copy(v211, v209, v210, 120LL);
    }

    [v167 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessBundleSourceVersion"];
    uint64_t v213 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v214 = v564->_targetProcess;
    if (v214) {
      objc_setProperty_atomic_copy(v214, v212, v213, 128LL);
    }

    [v167 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessBundleProductBuildVersion"];
    uint64_t v216 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v217 = v564->_targetProcess;
    if (v217) {
      objc_setProperty_atomic_copy(v217, v215, v216, 136LL);
    }

    [v167 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessBundleId"];
    char v218 = (void *)objc_claimAutoreleasedReturnValue();
    -[SATask mainBinary](v564->_targetProcess, "mainBinary");
    char v219 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v221 = v219;
    if (v219) {
      objc_setProperty_atomic_copy(v219, v220, v218, 88LL);
    }

    [v167 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessCommerceAppID"];
    unint64_t v222 = (void *)objc_claimAutoreleasedReturnValue();
    if (v222)
    {
      id v223 = objc_alloc_init(MEMORY[0x189607978]);
      [v223 numberFromString:v222];
      int v224 = (void *)objc_claimAutoreleasedReturnValue();
      char v225 = v224;
      if (v224)
      {
        uint64_t v226 = [v224 unsignedLongLongValue];
        id v227 = v564->_targetProcess;
        if (v227) {
          v227->_adamID = v226;
        }
      }

      else
      {
        int v319 = *__error();
        _sa_logt();
        int v320 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v320, OS_LOG_TYPE_FAULT))
        {
          LODWORD(v613) = 138412290;
          *(void *)((char *)&v613 + 4) = v222;
          _os_log_fault_impl( &dword_186C92000,  v320,  OS_LOG_TYPE_FAULT,  "Unable to parse commerceAppID %@",  (uint8_t *)&v613,  0xCu);
        }

        *__error() = v319;
      }
    }

    [v167 decodeObjectOfClass:objc_opt_class() forKey:@"_targetProcessCommerceExternalID"];
    __int128 v322 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v323 = v564->_targetProcess;
    if (v323) {
      objc_setProperty_atomic_copy(v323, v321, v322, 168LL);
    }
  }

  if (v551)
  {
    unint64_t v324 = v607;
    if (v607)
    {
      uint64_t v325 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v607 >> 3];
      uint64_t v326 = v564->_sampleTimestamps;
      v564->_sampleTimestamps = (NSMutableArray *)v325;

      uint64_t v327 = (void *)objc_opt_class();
      SASerializableNewMutableArrayFromIndexList(v551, v324 >> 3, v168, v561, v327);
      uint64_t v328 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v595 = 0u;
      __int128 v596 = 0u;
      __int128 v593 = 0u;
      __int128 v594 = 0u;
      id v329 = v328;
      uint64_t v331 = [v329 countByEnumeratingWithState:&v593 objects:v620 count:16];
      if (v331)
      {
        uint64_t v332 = *(void *)v594;
        do
        {
          for (iuint64_t i = 0LL; ii != v331; ++ii)
          {
            if (*(void *)v594 != v332) {
              objc_enumerationMutation(v329);
            }
            id v334 = *(id *)(*((void *)&v593 + 1) + 8 * ii);
            uint64_t v335 = v564->_sampleTimestamps;
            if (v334) {
              id v334 = objc_getProperty(v334, v330, 8LL, 1);
            }
            id v336 = v334;
            -[NSMutableArray addObject:](v335, "addObject:", v336);
          }

          uint64_t v331 = [v329 countByEnumeratingWithState:&v593 objects:v620 count:16];
        }

        while (v331);
      }
    }
  }

  if (v555)
  {
    unint64_t v337 = v606;
    uint64_t v338 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v606 >> 3];
    uint64_t v339 = v564->_fanSpeeds;
    v564->_fanSpeeds = (NSMutableArray *)v338;

    uint64_t v340 = (void *)objc_opt_class();
    SASerializableNewMutableArrayFromIndexList(v555, v337 >> 3, v168, v561, v340);
    uint64_t v341 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v591 = 0u;
    __int128 v592 = 0u;
    __int128 v589 = 0u;
    __int128 v590 = 0u;
    id v342 = v341;
    uint64_t v344 = [v342 countByEnumeratingWithState:&v589 objects:v619 count:16];
    if (v344)
    {
      uint64_t v345 = *(void *)v590;
      do
      {
        for (juint64_t j = 0LL; jj != v344; ++jj)
        {
          if (*(void *)v590 != v345) {
            objc_enumerationMutation(v342);
          }
          id v347 = *(id *)(*((void *)&v589 + 1) + 8 * jj);
          uint64_t v348 = v564->_fanSpeeds;
          if (v347) {
            id v347 = objc_getProperty(v347, v343, 8LL, 1);
          }
          id v349 = v347;
          -[NSMutableArray addObject:](v348, "addObject:", v349);
        }

        uint64_t v344 = [v342 countByEnumeratingWithState:&v589 objects:v619 count:16];
      }

      while (v344);
    }
  }

  if (v552)
  {
    uint64_t v350 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v605 >> 3];
    uint64_t v351 = v564->_hidEvents;
    v564->_hidEvents = (NSMutableArray *)v350;

    unint64_t v352 = v605;
    int v353 = (void *)objc_opt_class();
    SASerializableNewMutableArrayFromIndexList((uint64_t)v552, v352 >> 3, v168, v561, v353);
    v354 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v587 = 0u;
    __int128 v588 = 0u;
    __int128 v585 = 0u;
    __int128 v586 = 0u;
    id v355 = v354;
    uint64_t v357 = [v355 countByEnumeratingWithState:&v585 objects:v618 count:16];
    if (v357)
    {
      uint64_t v358 = *(void *)v586;
      do
      {
        for (kuint64_t k = 0LL; kk != v357; ++kk)
        {
          if (*(void *)v586 != v358) {
            objc_enumerationMutation(v355);
          }
          id v360 = *(id *)(*((void *)&v585 + 1) + 8 * kk);
          int v361 = v564->_hidEvents;
          if (v360) {
            id v360 = objc_getProperty(v360, v356, 8LL, 1);
          }
          id v362 = v360;
          -[NSMutableArray addObject:](v361, "addObject:", v362);
        }

        uint64_t v357 = [v355 countByEnumeratingWithState:&v585 objects:v618 count:16];
      }

      while (v357);
    }
  }

  uint64_t v363 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v364 = v564->_gestures;
  v564->_gestures = v363;

  unint64_t v365 = [v167 decodeInt64ForKey:@"SymbolDataStoreIndex"];
  uint64_t v366 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v365,  v168,  v561,  v366,  0);
  uint64_t v367 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v368 = [v167 decodeInt64ForKey:@"MountStatusTrackerIndex"];
  v369 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v368,  v168,  v561,  v369,  0);
  uint64_t v370 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v372 = v370;
  if (!v370)
  {
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Could not deserialize mount status",  0LL);
    id v546 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v546);
    goto LABEL_318;
  }

  id v373 = objc_getProperty(v370, v371, 8LL, 1);
  objc_storeStrong((id *)&v564->_mountStatusTracker, v373);
  if ([v167 containsValueForKey:@"WSUpdateDataStoreIndex"])
  {
    unint64_t v374 = [v167 decodeInt64ForKey:@"WSUpdateDataStoreIndex"];
    uint64_t v375 = (void *)objc_opt_class();
    uint64_t v376 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v374,  v168,  v561,  v375,  0);
    v377 = v564->_wsDataStore;
    v564->_wsDataStore = (SAWSUpdateDataStore *)v376;
  }

  else
  {
    v377 = v564->_wsDataStore;
    v564->_wsDataStore = 0LL;
  }

  v564->_sampleOnlyMainThreads = 0;
  v564->_shouldGatherKextStat = 0;
  uint64_t v378 = +[SABinaryLocator sharedBinaryLocator](&OBJC_CLASS___SABinaryLocator, "sharedBinaryLocator");
  uint64_t v379 = v564->_binaryLocator;
  v564->_binaryLocator = v378;

  uint64_t v380 = MEMORY[0x1895F87A8];
  v564->_machTimebase = (mach_timebase_info)0x100000001LL;
  v584[0] = v380;
  v584[1] = 3221225472LL;
  v584[2] = __61__SASampleStore_SASampleStoreNSCoding__initWithPAStyleCoder___block_invoke;
  v584[3] = &unk_189F61580;
  v584[4] = v564;
  -[SASampleStore iterateAllTimestamps:]((uint64_t)v564, v584);
  if (v367) {
    id v382 = objc_getProperty(v367, v381, 24LL, 1);
  }
  else {
    id v382 = 0LL;
  }
  id v383 = v382;

  if (v383)
  {
    id v385 = objc_alloc(MEMORY[0x189603FA8]);
    if (v367) {
      id v386 = objc_getProperty(v367, v384, 24LL, 1);
    }
    else {
      id v386 = 0LL;
    }
    id v387 = v386;
    uint64_t v388 = objc_msgSend(v385, "initWithObjects:", v387, 0);
    uint64_t v389 = v564->_kernelCaches;
    v564->_kernelCaches = (NSMutableArray *)v388;
  }

  *(void *)&__int128 v613 = 0LL;
  *((void *)&v613 + 1) = &v613;
  uint64_t v614 = 0x3032000000LL;
  v615 = __Block_byref_object_copy__0;
  v616 = __Block_byref_object_dispose__0;
  id v617 = 0LL;
  v581[0] = v380;
  v581[1] = 3221225472LL;
  v581[2] = __61__SASampleStore_SASampleStoreNSCoding__initWithPAStyleCoder___block_invoke_2;
  v581[3] = &unk_189F61E00;
  v581[4] = v564;
  id v390 = v367;
  id v582 = v390;
  v583 = &v613;
  -[SASampleStore enumerateTasks:](v564, "enumerateTasks:", v581);
  if (*(void *)(*((void *)&v613 + 1) + 40LL))
  {
    id v391 = objc_alloc(MEMORY[0x189604010]);
    uint64_t v392 = (void *)objc_msgSend(v391, "initWithObjects:", *(void *)(*((void *)&v613 + 1) + 40), 0);
    +[SAFrame enumerateFrameTree:block:]((uint64_t)&OBJC_CLASS___SAFrame, v392, &__block_literal_global_1434);
  }

  [v168 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_7];

  _Block_object_dispose(&v613, 8);
  objc_autoreleasePoolPop(context);
  *__int128 v548 = 0LL;
  *__int128 v547 = 0;

  unint64_t v108 = v564;
  v565 = v108;
LABEL_193:
  unsigned int v111 = v558;
LABEL_301:
  objc_autoreleasePoolPop(v111);

  return v108;
}

uint64_t __54__SASampleStore_SASampleStoreNSCoding__initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[SATimestamp applyMachTimebase:](a2, *(void *)(*(void *)(a1 + 32) + 184LL));
}

uint64_t __61__SASampleStore_SASampleStoreNSCoding__initWithPAStyleCoder___block_invoke( uint64_t a1,  uint64_t a2)
{
  return -[SATimestamp applyMachTimebase:](a2, *(void *)(*(void *)(a1 + 32) + 184LL));
}

void __61__SASampleStore_SASampleStoreNSCoding__initWithPAStyleCoder___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a2;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  v17[3] = 0LL;
  uint64_t v4 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __61__SASampleStore_SASampleStoreNSCoding__initWithPAStyleCoder___block_invoke_3;
  v16[3] = &unk_189F61D88;
  v16[4] = a1[4];
  v16[5] = v17;
  [v3 enumerateTaskStatesBetweenStartTime:0 startSampleIndex:0x7FFFFFFFFFFFFFFFLL endTime:0 endSampleIndex:0x7FFFFFFFFFFFFFFFLL reverseOrder:0 block:v16];
  [v3 threads];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v15[1] = 3221225472LL;
  v15[2] = __61__SASampleStore_SASampleStoreNSCoding__initWithPAStyleCoder___block_invoke_4;
  v15[3] = &unk_189F61DD8;
  v15[4] = a1[4];
  v15[5] = v17;
  [v5 enumerateKeysAndObjectsUsingBlock:v15];

  if (v3 && (objc_copyStruct(&dest, v3 + 288, 8LL, 1, 0), dest)
    || (-[SATask guessArchitectureGivenMachineArchitecture:dataSource:]( (uint64_t)v3,  *(id *)(a1[4] + 192LL),  *(void *)(a1[4] + 352LL)),  v3))
  {
    objc_copyStruct(&dest, v3 + 288, 8LL, 1, 0);
  }

  char v7 = CSArchitectureIs32Bit();
  id Property = (id)a1[5];
  if ((v7 & 1) != 0)
  {
    if (Property) {
      id Property = objc_getProperty(Property, v6, 16LL, 1);
    }
    id v10 = Property;
    if (v3) {
LABEL_13:
    }
      objc_setProperty_atomic(v3, v9, v10, 256LL);
  }

  else
  {
    if (Property) {
      id Property = objc_getProperty(Property, v6, 8LL, 1);
    }
    id v10 = Property;
    if (v3) {
      goto LABEL_13;
    }
  }

  -[SATask removeStacksOutsideThisProcess]((uint64_t)v3);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    uint64_t v12 = *(void *)(a1[6] + 8LL);
    uint64_t v14 = *(void *)(v12 + 40);
    id v13 = (id *)(v12 + 40);
    if (!v14) {
      objc_storeStrong(v13, v11);
    }
  }

  -[SATask fixupFrameInstructionsWithDataGatheringOptions:mightBeAlive:foundNewBinaryInfo:uuidsWithNewInstructions:additionalCSSymbolicatorFlags:]( (id *)v3,  *(void *)(a1[4] + 408LL),  0,  0LL,  0LL,  *(_DWORD *)(a1[4] + 328LL));

  _Block_object_dispose(v17, 8);
}

void __61__SASampleStore_SASampleStoreNSCoding__initWithPAStyleCoder___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  for (uint64_t i = v3; ; v3 = i)
  {
    [v3 startTimestamp];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v7 = *(void *)(v6 + 24);
    if (v4 == v5) {
      break;
    }
    *(void *)(v6 + 24) = v7 + 1;
  }

  uint64_t v8 = i;
  if (i) {
    i[6] = v7;
  }
  while (1)
  {
    [v8 endTimestamp];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v12 = *(void *)(v11 + 24);
    if (v9 == v10) {
      break;
    }
    *(void *)(v11 + 24) = v12 + 1;
    uint64_t v8 = i;
  }

  if (i) {
    i[7] = v12;
  }
}

uint64_t __61__SASampleStore_SASampleStoreNSCoding__initWithPAStyleCoder___block_invoke_4( uint64_t a1,  uint64_t a2,  void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __61__SASampleStore_SASampleStoreNSCoding__initWithPAStyleCoder___block_invoke_5;
  v4[3] = &unk_189F61DB0;
  __int128 v5 = *(_OWORD *)(a1 + 32);
  return [a3 enumerateThreadStatesBetweenStartTime:0 startSampleIndex:0x7FFFFFFFFFFFFFFFLL endTime:0 endSampleIndex:0x7FFFFFFFFFFFFFFFLL reverseOrder:0 block:v4];
}

void __61__SASampleStore_SASampleStoreNSCoding__initWithPAStyleCoder___block_invoke_5(uint64_t a1, void *a2)
{
  id v11 = a2;
  while (1)
  {
    [v11 startTimestamp];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
    unint64_t v6 = *(void *)(v5 + 24);
    if (v3 == v4) {
      break;
    }
    *(void *)(v5 + 24) = v6 + 1;
  }

  -[SAThreadState setStartSampleIndex:]((uint64_t)v11, v6);
  while (1)
  {
    [v11 endTimestamp];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
    unint64_t v10 = *(void *)(v9 + 24);
    if (v7 == v8) {
      break;
    }
    *(void *)(v9 + 24) = v10 + 1;
  }

  -[SAThreadState setEndSampleIndex:]((uint64_t)v11, v10);
}

void __61__SASampleStore_SASampleStoreNSCoding__initWithPAStyleCoder___block_invoke_6( uint64_t a1,  uint64_t a2)
{
  if (a2) {
    *(void *)(a2 + 32) = 0LL;
  }
}

- (BOOL)keepStateBetweenSampleIndexes
{
  return 0;
}

- (void)setKeepStateBetweenSampleIndexes:(BOOL)a3
{
  if (a3)
  {
    int v3 = *__error();
    _sa_logt();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_fault_impl( &dword_186C92000,  v4,  OS_LOG_TYPE_FAULT,  "keepStateBetweenSampleIndexes is no longer supported",  v5,  2u);
    }

    *__error() = v3;
  }

- (id)tidToPidDict
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __36__SASampleStore_KPerf__tidToPidDict__block_invoke;
  v6[3] = &unk_189F62048;
  id v4 = v3;
  id v7 = v4;
  -[SASampleStore enumerateTasks:](self, "enumerateTasks:", v6);

  return v4;
}

void __36__SASampleStore_KPerf__tidToPidDict__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 threads];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __36__SASampleStore_KPerf__tidToPidDict__block_invoke_2;
  v6[3] = &unk_189F62020;
  id v7 = *(id *)(a1 + 32);
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __36__SASampleStore_KPerf__tidToPidDict__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "pid"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v7, "threadId"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v4 forKeyedSubscript:v6];
}

- (id)tidsForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  -[SASampleStore tasksByPid](self, "tasksByPid", 0LL);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:v3];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v11) threads];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 allKeys];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 addObjectsFromArray:v13];

        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  return v5;
}

- (id)idleThreadSet
{
  id v3 = objc_alloc_init(MEMORY[0x189603FE0]);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __37__SASampleStore_KPerf__idleThreadSet__block_invoke;
  v6[3] = &unk_189F62048;
  id v4 = v3;
  id v7 = v4;
  -[SASampleStore enumerateTasks:](self, "enumerateTasks:", v6);

  return v4;
}

void __37__SASampleStore_KPerf__idleThreadSet__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __37__SASampleStore_KPerf__idleThreadSet__block_invoke_2;
  v4[3] = &unk_189F62070;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __37__SASampleStore_KPerf__idleThreadSet__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  [v5 threadStates];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 count];

  if (v7 == 1) {
    [*(id *)(a1 + 32) addObject:v8];
  }
}

- (void)existingTaskForEvent:(uint64_t)a3 inSession:(_DWORD *)a4 returningPid:
{
  id v4 = a1;
  if (a1)
  {
    uint64_t v7 = *(unsigned int *)(a2 + 88);
    if ((v7 & 0x80000000) != 0)
    {
      int pid_for_thread = ktrace_get_pid_for_thread();
      uint64_t v7 = pid_for_thread < 0 ? 0xFFFFFFFFLL : pid_for_thread;
      if (pid_for_thread < 0 && !*(void *)(a2 + 40))
      {
        id v4 = 0LL;
        if (!a4) {
          return v4;
        }
        goto LABEL_11;
      }
    }

    -[SASampleStore lastTaskWithPid:orTid:](v4, v7, *(void *)(a2 + 40));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = v9;
    if (v9) {
      LODWORD(v7) = [v9 pid];
    }
    if (a4) {
LABEL_11:
    }
      *a4 = v7;
  }

  return v4;
}

- (id)taskForPid:(void *)a3 andName:(void *)a4 didExecAtTimestamp:
{
  id v7 = a3;
  id v8 = a4;
  if (!a1)
  {
    id v14 = 0LL;
    goto LABEL_23;
  }

  -[SASampleStore lastTaskWithPid:](a1, a2);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  if (v9)
  {
    if (!v8)
    {
      if (v7)
      {
        if (!v9[7])
        {
          [v9 name];
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17
            || ([v10 name],
                __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(),
                char v19 = [v18 hasPrefix:v7],
                v18,
                v17,
                (v19 & 1) == 0))
          {
            -[SATask setName:]((uint64_t)v10, v7);
          }
        }
      }

      id v14 = v10;
      goto LABEL_22;
    }

    [v9 exitTimestamp];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11) {
      -[SASampleStore task:exitedAtTimestamp:]((uint64_t)a1, v10, v8);
    }
  }

  +[SATask taskWithPid:uniquePid:name:sharedCache:]((uint64_t)&OBJC_CLASS___SATask, a2, -1LL, v7, 0LL);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = v12;
  if (v12) {
    objc_setProperty_atomic(v12, v13, v8, 224LL);
  }
  -[SASampleStore addTask:]((uint64_t)a1, v14);
  if (([a1 dataGatheringOptions] & 2) != 0)
  {
    if (([a1 dataGatheringOptions] & 0x80) != 0)
    {
      [v14 binaryLoadInfos];
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (![v15 count])
      {

LABEL_20:
        -[SATask gatherLoadInfoFromLiveProcessWithDataGatheringOptions:additionalCSSymbolicatorFlags:]( (uint64_t)v14,  [a1 dataGatheringOptions],  objc_msgSend(a1, "additionalCSSymbolicatorFlags"));
        goto LABEL_21;
      }

      int v16 = [v14 pid];

      if (!v16) {
        goto LABEL_20;
      }
    }

BOOL __55__SASampleStore_KPerf__backfillExclaveFromKPerf_state___block_invoke( uint64_t a1,  void *a2,  _BYTE *a3)
{
  uint64_t v5 = [a2 address];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5 == v6) {
    *a3 = 1;
  }
  return v5 == v6;
}

BOOL __55__SASampleStore_KPerf__backfillExclaveFromKPerf_state___block_invoke_67( uint64_t a1,  void *a2,  _BYTE *a3)
{
  uint64_t v5 = [a2 address];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5 == v6) {
    *a3 = 1;
  }
  return v5 == v6;
}

void __55__SASampleStore_KPerf__backfillExclaveFromKPerf_state___block_invoke_72( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v45 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v7 = v45;
    if ([v7 needsExclave])
    {
      [v7 setNeedsExclave:0];
      if (v7) {
        objc_setProperty_atomic(v7, v8, *(id *)(a1 + 40), 176LL);
      }
      if (!a3 && qword_18C4B13C0)
      {
        int v9 = *__error();
        uint64_t v10 = (FILE *)qword_18C4B13C0;
        uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8LL);
        uint64_t v13 = [*(id *)(a1 + 32) threadId];
        id Property = *(id *)(a1 + 40);
        if (Property) {
          id Property = objc_getProperty(Property, v12, 16LL, 1);
        }
        id v43 = Property;
        uint64_t v16 = [v43 count];
        id v17 = *(id *)(a1 + 40);
        if (v17) {
          id v17 = objc_getProperty(v17, v15, 16LL, 1);
        }
        id v18 = v17;
        [v18 lastObject];
        char v19 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v21 = v19;
        if (v19)
        {
          id v22 = objc_getProperty(v19, v20, 16LL, 1);
          int v23 = v9;
        }

        else
        {
          int v23 = v9;
          id v22 = 0LL;
        }

        id v24 = v22;
        fprintf( v10,  "%'llu Thread 0x%llx exclave info (%lu exclaves, leaf frame 0x%llx) backfilled to all (%d) thread states (indexes %lu-%lu)\n",  v11,  v13,  v16,  [v24 address],  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 1,  0,  *(int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));

        *__error() = v23;
      }

      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    }

    else
    {
      if (*(int *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) >= 1 && qword_18C4B13C0 != 0)
      {
        int v27 = *__error();
        uint64_t v28 = (FILE *)qword_18C4B13C0;
        uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8LL);
        uint64_t v31 = [*(id *)(a1 + 32) threadId];
        id v32 = *(id *)(a1 + 40);
        if (v32) {
          id v32 = objc_getProperty(v32, v30, 16LL, 1);
        }
        id v44 = v32;
        uint64_t v34 = [v44 count];
        id v35 = *(id *)(a1 + 40);
        if (v35) {
          id v35 = objc_getProperty(v35, v33, 16LL, 1);
        }
        id v42 = v35;
        [v42 lastObject];
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v38 = v36;
        int v41 = v27;
        if (v36) {
          id v39 = objc_getProperty(v36, v37, 16LL, 1);
        }
        else {
          id v39 = 0LL;
        }
        id v40 = v39;
        fprintf( v28,  "%'llu Thread 0x%llx exclave info (%lu exclaves, leaf frame 0x%llx) backfilled to %d thread states (indexes %lu-%lu)\n",  v29,  v31,  v34,  [v40 address],  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24),  a3 + 1,  *(int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + a3);

        *__error() = v41;
      }

      *a4 = 1;
    }
  }

  else
  {
    if (qword_18C4B13C0)
    {
      int v25 = *__error();
      fprintf( (FILE *)qword_18C4B13C0,  "%'llu Thread 0x%llx ran into non-kperf state at index %lu, stopping\n",  *(void *)(*(void *)(a1 + 56) + 8),  [*(id *)(a1 + 32) threadId],  a3);
      *__error() = v25;
    }

    *a4 = 1;
  }
}

- (void)kperfRecord:(void *)a3 state:(void *)a4 frameIterator:
{
  uint64_t v326 = *MEMORY[0x1895F89C0];
  self = a3;
  id v300 = a4;
  uint64_t v305 = a1;
  if (a1)
  {
    id context = (void *)MEMORY[0x186E47ACC]();
    if ((*(void *)a2 & 0x200000000LL) == 0)
    {
      if ((~*(_WORD *)a2 & 0x2005) == 0)
      {
        uint64_t v7 = *(void *)(a2 + 16);
        if (!v7)
        {
          int v239 = *__error();
          _sa_logt();
          __int128 v240 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v240, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_error_impl(&dword_186C92000, v240, OS_LOG_TYPE_ERROR, "0 tid", buf, 2u);
          }

          *__error() = v239;
          _SASetCrashLogMessage(773, "0 tid", v241, v242, v243, v244, v245, v246, v272);
          _os_crash();
          __break(1u);
          goto LABEL_267;
        }

        uint64_t v8 = [a1 dataSource];
        uint64_t v9 = *(void *)a2;
        if (v8 == 2)
        {
          if ((v9 & 0x20) == 0)
          {
            if (!qword_18C4B13C0) {
              goto LABEL_262;
            }
            uint64_t v10 = __error();
            if ((*(_BYTE *)a2 & 2) != 0) {
              int v11 = *(_DWORD *)(a2 + 24);
            }
            else {
              int v11 = -1;
            }
            int v103 = *v10;
            fprintf( (FILE *)qword_18C4B13C0,  "%'llu WARNING: Thread 0x%llx core %d ignoring record without thread info\n",  *(void *)(a2 + 8),  v7,  v11);
            uint64_t v104 = __error();
LABEL_131:
            int *v104 = v103;
            goto LABEL_262;
          }
        }

        else if ((v9 & 0x1000000C0LL) == 0)
        {
          if (!qword_18C4B13C0) {
            goto LABEL_262;
          }
          double v88 = __error();
          if ((*(_BYTE *)a2 & 2) != 0) {
            int v89 = *(_DWORD *)(a2 + 24);
          }
          else {
            int v89 = -1;
          }
          int v103 = *v88;
          fprintf( (FILE *)qword_18C4B13C0,  "%'llu WARNING: Thread 0x%llx core %d ignoring record without a stack\n",  *(void *)(a2 + 8),  v7,  v89);
          uint64_t v104 = __error();
          goto LABEL_131;
        }

        if (self
          && (uint64_t v58 = (void *)self[1],
              [MEMORY[0x189607968] numberWithUnsignedLongLong:v7],
              unint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(),
              LODWORD(v58) = [v58 containsObject:v59],
              v59,
              (_DWORD)v58))
        {
          -[SAKPerfState nextSampleForThread:isOnCore:]((uint64_t)self, v7, 0);
          int v304 = 1;
        }

        else
        {
          int v304 = 0;
        }

        if ([v305 dataStyle] != 1)
        {
          if ([v305 dataStyle])
          {
            [v305 sampleTimestamps];
            id v67 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v68 = [v67 count];

            if (!v68)
            {
              if (!qword_18C4B13C0) {
                goto LABEL_262;
              }
              int v103 = *__error();
              fprintf((FILE *)qword_18C4B13C0, "%'llu No sampling point before kperfdata\n", *(void *)(a2 + 8));
              uint64_t v104 = __error();
              goto LABEL_131;
            }
          }
        }

        if ((*(_BYTE *)a2 & 2) != 0) {
          int v69 = *(_DWORD *)(a2 + 24);
        }
        else {
          int v69 = -1;
        }
        unsigned int v288 = v69;
        unint64_t absolute_from_timestamp = ktrace_get_absolute_from_timestamp();
        unint64_t v72 = absolute_from_timestamp;
        if (self)
        {
          unint64_t v73 = self[4];
          if (absolute_from_timestamp > v73)
          {
LABEL_88:
            unint64_t v73 = absolute_from_timestamp;
            goto LABEL_94;
          }

          if ((v304 & 1) == 0)
          {
            id v74 = objc_getProperty(self, v71, 40LL, 1);
            if (v74)
            {
              uint64_t v76 = v74;
              id v77 = objc_getProperty(self, v75, 40LL, 1);
              unint64_t v78 = [v77 machAbsTime];

              if (v72 <= v78)
              {
                if (qword_18C4B13C0)
                {
                  int v115 = *__error();
                  int v116 = (FILE *)qword_18C4B13C0;
                  uint64_t v117 = *(void *)(a2 + 8);
                  id v119 = objc_getProperty(self, v118, 40LL, 1);
                  fprintf( v116,  "%'llu Adjusting forward record timestamp %lld to %lld, and making on-core for most recent timer %lld \n",  v117,  v72,  v73,  [v119 machAbsTime]);

                  *__error() = v115;
                  int v304 = 1;
LABEL_94:
                  if (qword_18C4B13C0)
                  {
                    int v80 = *__error();
                    __int128 v81 = (FILE *)qword_18C4B13C0;
                    uint64_t v83 = *(void *)a2;
                    uint64_t v82 = *(void *)(a2 + 8);
                    StringForKPDecodeContentBits((uint64_t *)a2);
                    uint64_t v84 = "off";
                    if (v304) {
                      uint64_t v84 = "on";
                    }
                    fprintf( v81,  "%'llu Thread 0x%llx core %d parsing %s-core kperf with content 0x%llx: %s\n",  v82,  v7,  v288,  v84,  v83,  (const char *)&qword_18C4B13D0);
                    *__error() = v80;
                  }

                  goto LABEL_98;
                }

                int v304 = 1;
LABEL_98:
                uint64_t pid_for_thread = ktrace_get_pid_for_thread();
                if ((pid_for_thread & 0x80000000) != 0)
                {
                  if ((*(_BYTE *)a2 & 0x20) == 0)
                  {
                    if (!qword_18C4B13C0) {
                      goto LABEL_262;
                    }
                    double v86 = __error();
                    if ((*(_BYTE *)a2 & 2) != 0) {
                      int v87 = *(_DWORD *)(a2 + 24);
                    }
                    else {
                      int v87 = -1;
                    }
                    int v103 = *v86;
                    fprintf( (FILE *)qword_18C4B13C0,  "%'llu WARNING: Thread 0x%llx core %d unable to determine pid for thread: %d\n",  *(void *)(a2 + 8),  v7,  v87,  pid_for_thread);
                    uint64_t v104 = __error();
                    goto LABEL_131;
                  }

                  uint64_t pid_for_thread = *(unsigned int *)(a2 + 88);
                  if ((pid_for_thread & 0x80000000) != 0)
                  {
LABEL_273:
                    int v263 = *__error();
                    _sa_logt();
                    uint64_t v264 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v264, OS_LOG_TYPE_ERROR))
                    {
                      int v265 = *(_DWORD *)(a2 + 88);
                      *(_DWORD *)__int128 buf = 67109120;
                      *(_DWORD *)&uint8_t buf[4] = v265;
                      _os_log_error_impl( &dword_186C92000,  v264,  OS_LOG_TYPE_ERROR,  "rec->thread_info.pid is %d",  buf,  8u);
                    }

                    *__error() = v263;
                    _SASetCrashLogMessage( 838,  "rec->thread_info.pid is %d",  v266,  v267,  v268,  v269,  v270,  v271,  *(_DWORD *)(a2 + 88));
                    _os_crash();
                    __break(1u);
                  }
                }

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v7];
                uint64_t v296 = (void *)objc_claimAutoreleasedReturnValue();
                -[SASampleStore lastTaskWithPid:](v305, pid_for_thread);
                double v90 = (_BYTE *)objc_claimAutoreleasedReturnValue();
                if (!v90)
                {
                  execname_for_thread = (_BYTE *)ktrace_get_execname_for_thread();
                  if (execname_for_thread && *execname_for_thread)
                  {
                    SANSStringForCString(execname_for_thread);
                    double v92 = (void *)objc_claimAutoreleasedReturnValue();
                  }

                  else
                  {
                    double v92 = 0LL;
                  }

                  uint64_t v93 = -[SASampleStore taskForPid:andName:didExecAtTimestamp:](v305, pid_for_thread, v92, 0LL);

                  double v90 = (_BYTE *)v93;
                }

                uint64_t v309 = v90;
                [v90 threads];
                unint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v95 = [v94 objectForKeyedSubscript:v296];

                uint64_t v307 = (_BYTE *)v95;
                if (v95)
                {
LABEL_139:
                  [v309 binaryLoadInfos];
                  double v123 = (void *)objc_claimAutoreleasedReturnValue();
                  [v300 setUserBinaryLoadInfos:v123];

                  if (v309) {
                    uint64_t v124 = v309[73] & 1;
                  }
                  else {
                    uint64_t v124 = 0LL;
                  }
                  [v300 setAssumeUserBinaryLoadInfosContainMainBinary:v124];
                  [v309 sharedCache];
                  uint64_t v125 = (void *)objc_claimAutoreleasedReturnValue();
                  [v300 setSharedCache:v125];

                  [v305 sampleTimestamps];
                  SEL v126 = (void *)objc_claimAutoreleasedReturnValue();
                  if ([v126 count])
                  {
                    [v305 sampleTimestamps];
                    uint64_t v127 = (void *)objc_claimAutoreleasedReturnValue();
                    unint64_t v287 = [v127 count] - 1;
                  }

                  else
                  {
                    unint64_t v287 = 0x7FFFFFFFFFFFFFFFLL;
                  }

                  if (!v304) {
                    goto LABEL_156;
                  }
                  id Property = self;
                  if (self) {
                    id Property = objc_getProperty(self, v128, 40LL, 1);
                  }
                  id v130 = Property;

                  if (!v130)
                  {
LABEL_156:
                    +[SATimestamp timestampWithMachAbsTime:fromKtraceSession:]((uint64_t)&OBJC_CLASS___SATimestamp, v73);
                    id v298 = (id)objc_claimAutoreleasedReturnValue();
                    unsigned __int8 v140 = 0;
                    goto LABEL_188;
                  }

                  [v305 sampleTimestamps];
                  uint64_t v131 = (void *)objc_claimAutoreleasedReturnValue();
                  [v131 lastObject];
                  id v132 = (id)objc_claimAutoreleasedReturnValue();

                  if (!v132) {
                    goto LABEL_152;
                  }
                  if (self)
                  {
                    id v134 = objc_getProperty(self, v133, 40LL, 1);
                    if (v132 == v134)
                    {

                      id v141 = v132;
                      id v143 = self;
                      goto LABEL_160;
                    }
                  }

                  else
                  {
                    id v134 = 0LL;
                  }

                  unint64_t v135 = [v132 machAbsTime];

                  if (v135 < v72)
                  {
LABEL_152:
                    id v136 = self;
                    if (self) {
                      id v136 = objc_getProperty(self, v133, 40LL, 1);
                    }
                    id v137 = v136;
                    if (qword_18C4B13C0)
                    {
                      int v138 = *__error();
                      fprintf( (FILE *)qword_18C4B13C0,  "%'llu Adjusting backward record timestamp %lld to %lld, to match the non-PET timer that triggered it\n",  *(void *)(a2 + 8),  v72,  [v137 machAbsTime]);
                      int v139 = 0;
                      *__error() = v138;
                    }

                    else
                    {
                      int v139 = 0;
                    }

- (void)backfillTask:(unint64_t)a3 lastSampleIndex:(void *)a4 timestamp:(char)a5 haveSnap:(uint64_t)a6 terminatedThreadsUserTimeInNs:(uint64_t)a7 terminatedThreadsSystemTimeInNs:(uint64_t)a8 terminatedThreadsCycles:(uint64_t)a9 terminatedThreadsInstructions:(int)a10 suspendCount:(int)a11 pageins:(char)a12 isDarwinBG:(char)a13 isForeground:(char)a14 isBoosted:(char)a15 isDirty:(char)a16 haveWQFlags:(char)a17 wqExceededTotalThreadLimit:(char)a18 wqExceededConstrainedThreadLimit:(char)a19 haveMem:(uint64_t)a20 taskSizeInBytes:(char)a21 haveLatencyQos:(int)a22 latencyQos:
{
  int v25 = a2;
  id v26 = a4;
  char v65 = a1;
  if (a1)
  {
    uint64_t v66 = v25;
    id v67 = v26;
    [v25 exitTimestamp];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      [v25 exitTimestamp];
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      char v29 = [v28 lt:v26];

      char v31 = v29 ^ 1;
      if (!v25) {
        char v31 = 1;
      }
      if ((v31 & 1) == 0) {
        objc_setProperty_atomic(v25, v30, v26, 232LL);
      }
    }

    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v32 = v26;
      unint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_25:
      +[SATaskState stateWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:]( &OBJC_CLASS___SATaskStateKPerf,  "stateWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:",  v32,  v26,  v33,  a3);
      id v43 = (void *)objc_claimAutoreleasedReturnValue();
      int v60 = v32;
      if (v25)
      {
        [v25[1] addObject:v43];
        uint64_t v44 = [v25[1] count] - 1;
      }

      else
      {
        uint64_t v44 = 0LL;
      }

      if (qword_18C4B13C0)
      {
        int v59 = *__error();
        id v45 = (FILE *)qword_18C4B13C0;
        uint64_t v46 = [v67 machAbsTime];
        int v47 = [v25 pid];
        uint64_t v48 = [v43 startSampleIndex];
        uint64_t v49 = [v43 endSampleIndex];
        [v43 startTimestamp];
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v51 = [v50 machAbsTime];
        [v43 endTimestamp];
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
        fprintf( v45,  "%'llu Created taskState (index %lu) for task [%d] (sample index %ld-%ld, machabs %llu-%llu)\n",  v46,  v44,  v47,  v48,  v49,  v51,  [v52 machAbsTime]);

        *__error() = v59;
      }

LABEL_30:
      v97[0] = 0LL;
      v97[1] = v97;
      v97[2] = 0x2020000000LL;
      char v98 = a5;
      v95[0] = 0LL;
      v95[1] = v95;
      v95[2] = 0x2020000000LL;
      char v96 = a19;
      v93[0] = 0LL;
      v93[1] = v93;
      v93[2] = 0x2020000000LL;
      char v94 = a21;
      v91[0] = 0LL;
      v91[1] = v91;
      v91[2] = 0x2020000000LL;
      int v92 = 0;
      v68[0] = MEMORY[0x1895F87A8];
      v68[1] = 3221225472LL;
      v68[2] = __380__SASampleStore_KPerfPrivate__backfillTask_lastSampleIndex_timestamp_haveSnap_terminatedThreadsUserTimeInNs_terminatedThreadsSystemTimeInNs_terminatedThreadsCycles_terminatedThreadsInstructions_suspendCount_pageins_isDarwinBG_isForeground_isBoosted_isDirty_haveWQFlags_wqExceededTotalThreadLimit_wqExceededConstrainedThreadLimit_haveMem_taskSizeInBytes_haveLatencyQos_latencyQos___block_invoke;
      v68[3] = &unk_189F625D8;
      id v69 = v67;
      uint64_t v76 = a6;
      uint64_t v77 = a7;
      uint64_t v78 = a8;
      uint64_t v79 = a9;
      int v81 = a10;
      int v82 = a11;
      char v84 = a12;
      char v85 = a13;
      char v86 = a14;
      char v87 = a15;
      char v88 = a16;
      char v89 = a17;
      char v90 = a18;
      unint64_t v72 = v97;
      unint64_t v73 = v91;
      uint64_t v80 = a20;
      id v74 = v95;
      uint64_t v75 = v93;
      int v83 = a22;
      uint64_t v70 = v66;
      uint64_t v71 = v65;
      [v70 enumerateTaskStatesBetweenStartTime:0 startSampleIndex:0x7FFFFFFFFFFFFFFFLL endTime:0 endSampleIndex:0x7FFFFFFFFFFFFFFFLL reverseOrder:1 block:v68];

      _Block_object_dispose(v91, 8);
      _Block_object_dispose(v93, 8);
      _Block_object_dispose(v95, 8);
      _Block_object_dispose(v97, 8);

      int v25 = v66;
      id v26 = v67;
      goto LABEL_31;
    }

    [v25 taskStates];
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 lastObject];
    id v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      if ([v35 endSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v33 = 0LL;
LABEL_18:
        [v65 sampleTimestamps];
        id v38 = (id)objc_claimAutoreleasedReturnValue();
        [v38 objectAtIndexedSubscript:v33];
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }

      unint64_t v33 = [v35 endSampleIndex] + 1;
      if (v33 <= a3) {
        goto LABEL_18;
      }
      id v38 = v26;
    }

    else
    {
      [v25 execTimestamp];
      id v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
      {
        [v65 sampleTimestamps];
        id v39 = (void *)objc_claimAutoreleasedReturnValue();
        [v39 objectAtIndexedSubscript:0];
        id v32 = (id)objc_claimAutoreleasedReturnValue();

        unint64_t v33 = 0LL;
        goto LABEL_25;
      }

      unint64_t v33 = [v65 indexOfFirstSampleOnOrAfterTimestamp:v36];
      id v37 = v36;
      id v38 = v37;
      if (v33 <= a3)
      {
        id v32 = v37;
LABEL_21:

        if (v33 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_25;
        }
LABEL_22:
        [v25 taskStates];
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v41 = [v40 count];

        int v60 = v32;
        if (v41)
        {
          if (qword_18C4B13C0)
          {
            int v42 = *__error();
            fprintf( (FILE *)qword_18C4B13C0,  "%'llu Not creating taskState for task [%d] at machabs %llu due to already having a task state for sample index %lu\n",  [v67 machAbsTime],  objc_msgSend(v25, "pid"),  objc_msgSend(v67, "machAbsTime"),  a3);
            *__error() = v42;
          }
        }

        else if (qword_18C4B13C0)
        {
          int v53 = *__error();
          int v54 = (FILE *)qword_18C4B13C0;
          uint64_t v55 = [v26 machAbsTime];
          int v56 = [v25 pid];
          uint64_t v57 = [v26 machAbsTime];
          [v25 execTimestamp];
          uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
          fprintf( v54,  "%'llu Not creating taskState for task [%d] at machabs %llu due to the task being created after sample index %lu at machabs %llu\n",  v55,  v56,  v57,  a3,  [v58 machAbsTime]);

          *__error() = v53;
        }

        goto LABEL_30;
      }

      id v35 = 0LL;
    }

    id v32 = v38;
    goto LABEL_22;
  }

- (void)backfillThread:(void *)a3 inTask:(unint64_t)a4 lastSampleIndex:(void *)a5 timestamp:(char)a6 haveName:(_BYTE *)a7 name:(int)a8 haveDispatchQueueId:(uint64_t)a9 dispatchQueueId:(void *)a10 dispatchQueueLabel:(void *)a11 leafKernelFrame:(unsigned __int8)a12 hasExclaveInKernelStack:(char)a13 haveUserStack:(void *)a14 leafUserFrame:(uint64_t)a15 swiftTaskId:(void *)a16 leafOfCRootFramesReplacedBySwiftAsync:(void *)a17 threadExclavesInfo:(char)a18 haveSched:(uint64_t)a19 systemCpuTimeNs:(uint64_t)a20 userCpuTimeNs:(int)a21 basePriority:(int)a22 scheduledPriority:(int)a23 state:(char)a24 threadQos:(char)a25 threadRequestedQos:(char)a26 threadRequestedQosOverride:(char)a27 threadQosPromote:(char)a28 haveCycIns:(uint64_t)a29 instructions:(uint64_t)a30 cycles:(char)a31 haveSnap:(char)a32 ioTier:(char)a33 isIOPassive:(char)a34 isDarwinBG:(char)a35 isSuspended:(char)a36 isGlobalForcedIdle:(char)a37 isIdleWorkQueue:(void *)a38 lastMadeRunnableTime:(char)a39 isOnCore:(unsigned __int8)a40 isOnCoreForLastSampleIndex:(unsigned int)a41 cpuNum:
{
  uint64_t v202 = *MEMORY[0x1895F89C0];
  id v143 = a2;
  id v141 = a3;
  id v142 = a5;
  id newValue = a11;
  id v138 = a14;
  id v134 = a16;
  id v140 = a17;
  id v135 = a38;
  uint64_t v131 = a1;
  if (!a1) {
    goto LABEL_99;
  }
  [v143 exitTimestamp];
  id v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v143 && v45) {
    objc_setProperty_atomic(v143, v46, v142, 40LL);
  }
  [v141 exitTimestamp];
  int v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    [v141 exitTimestamp];
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
    char v49 = [v48 lt:v142];

    char v51 = v49 ^ 1;
    if (!v141) {
      char v51 = 1;
    }
    if ((v51 & 1) == 0) {
      objc_setProperty_atomic(v141, v50, v142, 232LL);
    }
  }

  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v136 = v142;
    unint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_48;
  }

  [v143 threadStates];
  int v53 = (void *)objc_claimAutoreleasedReturnValue();
  [v53 lastObject];
  int v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v54)
  {
    [v143 creationTimestamp];
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      unint64_t v52 = [a1 indexOfFirstSampleOnOrAfterTimestamp:v55];
      if (v52 > a4)
      {
        id v136 = v142;

        int v54 = 0LL;
        goto LABEL_20;
      }

      [v131 sampleTimestamps];
      int v56 = (void *)objc_claimAutoreleasedReturnValue();
      [v56 objectAtIndexedSubscript:v52];
      id v136 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [a1 sampleTimestamps];
      int v56 = (void *)objc_claimAutoreleasedReturnValue();
      [v56 objectAtIndexedSubscript:0];
      id v136 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v55 = 0LL;
      unint64_t v52 = 0LL;
    }

    goto LABEL_25;
  }

  if ([v54 endSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v52 = [v54 endSampleIndex] + 1;
    if (v52 <= a4) {
      goto LABEL_21;
    }
    id v136 = v142;
LABEL_20:

    goto LABEL_45;
  }

  unint64_t v52 = 0LL;
LABEL_21:
  [v131 sampleTimestamps];
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
  [v55 objectAtIndexedSubscript:v52];
  id v136 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

  if (!a39 || v52 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v57 = v136;
    goto LABEL_44;
  }

  if (v52 < a4 || (a40 & 1) == 0)
  {
    +[SAThreadState stateWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:]( &OBJC_CLASS___SAThreadStateKPerf,  "stateWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:",  v136,  v142,  v52,  a4 - a40);
    uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
    int v60 = v58;
    if (v58) {
      objc_setProperty_atomic(v58, v59, newValue, 80LL);
    }
    if (a12) {
      [v60 setNeedsExclave:1];
    }
    -[SAThreadState setCpuNum:]((uint64_t)v60, a41);
    if (v143)
    {
      [v143[1] addObject:v60];
      uint64_t v126 = [v143[1] count] - 1;
    }

    else
    {
      uint64_t v126 = 0LL;
    }

    if (a40) {
      unint64_t v52 = a4;
    }
    else {
      unint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
    }
    id v57 = v142;

    if (qword_18C4B13C0)
    {
      int v120 = *__error();
      uint64_t v124 = (FILE *)qword_18C4B13C0;
      uint64_t v122 = [v57 machAbsTime];
      uint64_t v119 = [v143 threadId];
      uint64_t v117 = [v60 startSampleIndex];
      uint64_t v116 = [v60 endSampleIndex];
      [v60 startTimestamp];
      id v137 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v115 = [v137 machAbsTime];
      [v60 endTimestamp];
      uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v62 = [v61 machAbsTime];
      [v60 leafKernelFrame];
      uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
      fprintf( v124,  "%'llu Created off-core threadState (index %lu) for thread 0x%llx (sample index %ld-%ld, machabs %llu-%llu) with kernel stack (leaf frame 0x%llx) exclaves:%d due to on-core thread state applying to multiple sample indexes\n",  v122,  v126,  v119,  v117,  v116,  v115,  v62,  [v63 address],  a12);

      *__error() = v120;
    }

LABEL_44:
    id v136 = v57;
    if (v52 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_48;
    }
LABEL_45:
    [v143 threadStates];
    int v64 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v65 = [v64 count];

    if (v65)
    {
      if (qword_18C4B13C0)
      {
        int v66 = *__error();
        fprintf( (FILE *)qword_18C4B13C0,  "%'llu Not creating threadState for thread 0x%llx at machabs %llu due to already having a thread state for samp le index %lu (kernel leaf frame 0x%llx, user leaf frame 0x%llx)\n",  [v142 machAbsTime],  objc_msgSend(v143, "threadId"),  objc_msgSend(v142, "machAbsTime"),  a4,  objc_msgSend(newValue, "address"),  objc_msgSend(v138, "address"));
        *__error() = v66;
      }
    }

    else if (qword_18C4B13C0)
    {
      int v94 = *__error();
      uint64_t v95 = (FILE *)qword_18C4B13C0;
      uint64_t v96 = [v142 machAbsTime];
      uint64_t v97 = [v143 threadId];
      uint64_t v98 = [v142 machAbsTime];
      [v143 creationTimestamp];
      uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
      fprintf( v95,  "%'llu Not creating threadState for thread 0x%llx at machabs %llu due to the thread being created after sample in dex %lu at machabs %llu (kernel leaf frame 0x%llx, user leaf frame 0x%llx)\n",  v96,  v97,  v98,  a4,  [v99 machAbsTime],  objc_msgSend(newValue, "address"),  objc_msgSend(v138, "address"));

      *__error() = v94;
    }

    goto LABEL_68;
  }

  if (![v136 eq:v142])
  {
    int v100 = *__error();
    _sa_logt();
    uint64_t v101 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      id v102 = [v136 debugDescription];
      uint64_t v103 = [v102 UTF8String];
      id v104 = [v142 debugDescription];
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = v103;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = [v104 UTF8String];
      _os_log_error_impl(&dword_186C92000, v101, OS_LOG_TYPE_ERROR, "Start timestamp %s vs %s", buf, 0x16u);
    }

    *__error() = v100;
    id v105 = [v136 debugDescription];
    char v106 = [v105 UTF8String];
    id v107 = [v142 debugDescription];
    [v107 UTF8String];
    _SASetCrashLogMessage(3974, "Start timestamp %s vs %s", v108, v109, v110, v111, v112, v113, v106);

    _os_crash();
    __break(1u);
  }

LABEL_48:
  if (newValue || !v140 || a39)
  {
    +[SAThreadState stateWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:]( &OBJC_CLASS___SAThreadStateKPerf,  "stateWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:",  v136,  v142,  v52,  a4);
    uint64_t v68 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    -[SAThreadState setCpuNum:]((uint64_t)v68, a41);
    if (a39)
    {
      if (v68)
      {
        v68[19] |= 0x40u;
LABEL_57:
        objc_setProperty_atomic(v68, v69, newValue, 80LL);
      }
    }

    else if (v68)
    {
      goto LABEL_57;
    }

    if (a12) {
      [v68 setNeedsExclave:1];
    }
    if (v143)
    {
      [v143[1] addObject:v68];
      uint64_t v127 = [v143[1] count] - 1;
    }

    else
    {
      uint64_t v127 = 0LL;
    }

    if (qword_18C4B13C0)
    {
      int v121 = *__error();
      uint64_t v125 = (FILE *)qword_18C4B13C0;
      uint64_t v123 = [v142 machAbsTime];
      else {
        uint64_t v70 = "off";
      }
      uint64_t v71 = [v143 threadId];
      uint64_t v72 = [v68 startSampleIndex];
      uint64_t v73 = [v68 endSampleIndex];
      [v68 startTimestamp];
      id v74 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v75 = [v74 machAbsTime];
      [v68 endTimestamp];
      uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v77 = [v76 machAbsTime];
      [v68 leafKernelFrame];
      uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
      fprintf( v125,  "%'llu Created %s-core threadState (index %lu) for thread 0x%llx (sample index %ld-%ld, machabs %llu-%llu) with k ernel leaf frame 0x%llx) exclaves:%d\n",  v123,  v70,  v127,  v71,  v72,  v73,  v75,  v77,  [v78 address],  a12);

      *__error() = v121;
    }

    goto LABEL_68;
  }

  if (qword_18C4B13C0)
  {
    int v67 = *__error();
    fprintf( (FILE *)qword_18C4B13C0,  "%'llu Not creating threadState for thread 0x%llx at machabs %llu due to only have exclave info to backfill\n",  [v142 machAbsTime],  objc_msgSend(v143, "threadId"),  objc_msgSend(v142, "machAbsTime"));
    *__error() = v67;
  }

- (id)applySharedCacheToTask:(uint64_t)a3 uuid:(uint64_t)a4 slide:(uint64_t)a5 slidBaseAddress:
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  uint64_t v9 = a2;
  uint64_t v10 = v9;
  if (!a1)
  {
    uint64_t v21 = 0LL;
    goto LABEL_25;
  }

  [v9 sharedCache];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  if (v11)
  {
    if ([v11 matchesUUID:a3 slide:a4 slidBaseAddress:a5])
    {
      uint64_t v13 = 0LL;
LABEL_22:
      __int128 v15 = v12;
      goto LABEL_23;
    }

    uuidForBytes(a3);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 uuid];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    int v17 = [v16 isEqual:v13];

    if (v17)
    {
      uint64_t v18 = [v12 slidBaseAddress];
      if (a5 != -1 && v18 == -1)
      {
        -[SASharedCache setSlidBaseAddress:](v12, a5);
        goto LABEL_22;
      }

      uint64_t v22 = [v12 slide];
      if (a4 != -1 && v22 == -1)
      {
        -[SASharedCache setSlide:](v12, a4);
        goto LABEL_22;
      }

      int v23 = *__error();
      _sa_logt();
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        [v10 sharedCache];
        id v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v28 debugDescription];
        char v29 = (void *)objc_claimAutoreleasedReturnValue();
        int v32 = 68158722;
        *(_DWORD *)unint64_t v33 = 16;
        *(_WORD *)&void v33[4] = 2096;
        *(void *)&v33[6] = a3;
        *(_WORD *)&v33[14] = 2048;
        *(void *)&v33[16] = a4;
        __int16 v34 = 2048;
        uint64_t v35 = a5;
        __int16 v36 = 2112;
        id v37 = v29;
        _os_log_fault_impl( &dword_186C92000,  v24,  OS_LOG_TYPE_FAULT,  "Mismatching shared cache %{uuid_t}.16P slide 0x%llx slideBaseAddress 0x%llx, but task already has %@",  (uint8_t *)&v32,  0x30u);
      }
    }

    else
    {
      int v23 = *__error();
      _sa_logt();
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        [v10 sharedCache];
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 debugDescription];
        char v31 = (void *)objc_claimAutoreleasedReturnValue();
        int v32 = 68158722;
        *(_DWORD *)unint64_t v33 = 16;
        *(_WORD *)&void v33[4] = 2096;
        *(void *)&v33[6] = a3;
        *(_WORD *)&v33[14] = 2048;
        *(void *)&v33[16] = a4;
        __int16 v34 = 2048;
        uint64_t v35 = a5;
        __int16 v36 = 2112;
        id v37 = v31;
        _os_log_fault_impl( &dword_186C92000,  v24,  OS_LOG_TYPE_FAULT,  "Mismatching shared cache %{uuid_t}.16P slide 0x%llx slideBaseAddress 0x%llx, but task already has %@",  (uint8_t *)&v32,  0x30u);
      }
    }

    *__error() = v23;
    goto LABEL_22;
  }

  -[SASampleStore sharedCacheWithUUID:slide:slidBaseAddress:](a1, a3, a4, a5);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if ((v10[72] & 1) != 0)
    {
      int v19 = *__error();
      _sa_logt();
      int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        [v13 debugDescription];
        id v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 debugDescription];
        id v27 = (void *)objc_claimAutoreleasedReturnValue();
        int v32 = 138412546;
        *(void *)unint64_t v33 = v26;
        *(_WORD *)&v33[8] = 2112;
        *(void *)&v33[10] = v27;
        _os_log_fault_impl( &dword_186C92000,  v20,  OS_LOG_TYPE_FAULT,  "shared cache %@, though task %@ has no shared cache",  (uint8_t *)&v32,  0x16u);
      }

      uint64_t v21 = 0LL;
      *__error() = v19;
      goto LABEL_24;
    }

    objc_setProperty_atomic(v10, v14, v13, 256LL);
  }

  __int128 v15 = v13;
  uint64_t v13 = v15;
LABEL_23:
  uint64_t v21 = v15;
LABEL_24:

LABEL_25:
  return v21;
}

- (uint64_t)checkDyldInfoCompletion:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v5 = v3;
  uint64_t v6 = 0LL;
  if (a1 && v3)
  {
    if (*((_BYTE *)v3 + 9) && (*((_BYTE *)v3 + 10) || v3[5] + 1 < 2))
    {
      id v7 = objc_getProperty(v3, v4, 48LL, 1);
      if (v7 || v5[5] + 1 < 2)
      {
      }

      else
      {
        id v27 = objc_getProperty(v5, v8, 24LL, 1);
        if (v27)
        {
          unint64_t v28 = v5[4];

          if (v28)
          {
            int v29 = *__error();
            _sa_logt();
            uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              id v38 = [v5 debugDescription];
              *(_DWORD *)__int128 buf = 136315138;
              uint64_t v40 = [v38 UTF8String];
              _os_log_error_impl(&dword_186C92000, v30, OS_LOG_TYPE_ERROR, "bad complete dyld info: %s", buf, 0xCu);
            }

            *__error() = v29;
            goto LABEL_37;
          }
        }
      }

      if (qword_18C4B13C0)
      {
        int v10 = *__error();
        int v11 = (FILE *)qword_18C4B13C0;
        id v12 = [v5 debugDescription];
        fprintf(v11, "%'llu %s\n\n", 0, (const char *)[v12 UTF8String]);

        *__error() = v10;
      }

      id v13 = objc_getProperty(v5, v9, 16LL, 1);
      unint64_t v14 = v5[4];
      id v16 = objc_getProperty(v5, v15, 24LL, 1);
      int v17 = v16;
      if ((v5[1] & 1) != 0)
      {
        [v16 getUUIDBytes:buf];
        id v26 = -[SASampleStore applySharedCacheToTask:uuid:slide:slidBaseAddress:](a1, v13, (uint64_t)buf, -1LL, v14);
      }

      else
      {
        [v13 sharedCache];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        int v20 = v18;
        if (!v18
          || [v18 startAddress] == -1
          || v14 < [v20 startAddress]
          || v14 >= [v20 endAddress])
        {
          id v22 = objc_getProperty(v5, v19, 48LL, 1);
          if (v22)
          {
            uint64_t v23 = objc_msgSend(objc_getProperty(v5, v21, 48, 1), "length");

            if (v23)
            {
              id Property = objc_getProperty(v5, v24, 48LL, 1);
              SACachedNSString(Property);
              id v22 = (id)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              id v22 = 0LL;
            }
          }

          else {
            id v31 = 0LL;
          }
          +[SABinary binaryWithUUID:absolutePath:](&OBJC_CLASS___SABinary, "binaryWithUUID:absolutePath:", v17, v31);
          int v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[SABinaryLoadInfo binaryLoadInfoWithBinary:loadAddress:isInKernelAddressSpace:exclave:]( (uint64_t)SABinaryLoadInfo,  v32,  v14,  [v13 pid] == 0,  0);
          unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
          [v32 path];
          __int16 v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22 && !v34 && v32) {
            objc_setProperty_atomic_copy(v32, v35, v22, 80LL);
          }
          __int16 v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v33, 0);
          -[SATask addImageInfos:]((uint64_t)v13, v36);
        }
      }

LABEL_37:
      uint64_t v6 = 1LL;
      goto LABEL_38;
    }

    uint64_t v6 = 0LL;
  }

- (void)_addKPerfDataFromKTraceSession:(uint64_t)a3 beforeMachAbsTime:(int)a4 petTimerID:
{
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___SAFrameIterator);
  -[SAFrameIterator setBacktracer:](v8, "setBacktracer:", 1LL);
  objc_opt_self();
  uint64_t v9 = objc_alloc(&OBJC_CLASS___SAKPerfState);
  if (v9)
  {
    v123.receiver = v9;
    v123.super_class = (Class)&OBJC_CLASS___SAKPerfState;
    int v10 = objc_msgSendSuper2(&v123, sel_init);
    int v11 = v10;
    if (v10)
    {
      v10[3] = a2;
      *((_DWORD *)v10 + 5) = a4;
      id v12 = objc_alloc_init(MEMORY[0x189603FE0]);
      id v13 = (void *)v11[1];
      v11[1] = v12;
    }
  }

  else
  {
    int v11 = 0LL;
  }

  id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
  v123.receiver = 0LL;
  v123.super_class = (Class)&v123;
  uint64_t v124 = 0x2020000000LL;
  uint64_t v125 = 0LL;
  [a1 kPerfPETSampleIntervalLimit];
  double v16 = v15;
  uint64_t v17 = [a1 machTimebase];
  uint64_t v18 = 0LL;
  if ((_DWORD)v17)
  {
    if (HIDWORD(v17))
    {
      uint64_t v18 = (unint64_t)(v16 * 1000000000.0);
      if (HIDWORD(v17) != (_DWORD)v17) {
        uint64_t v18 = __udivti3();
      }
    }
  }

  uint64_t v19 = MEMORY[0x1895F87A8];
  uint64_t v113 = MEMORY[0x1895F87A8];
  uint64_t v114 = 3221225472LL;
  uint64_t v115 = __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke;
  uint64_t v116 = &unk_189F620C0;
  uint64_t v120 = a2;
  uint64_t v121 = a3;
  uint64_t v122 = v18;
  uint64_t v119 = &v123;
  uint64_t v117 = a1;
  id v118 = v11;
  ktrace_events_single();
  uint64_t v105 = v19;
  uint64_t v106 = 3221225472LL;
  id v107 = __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_2;
  uint64_t v108 = &unk_189F620E8;
  uint64_t v112 = a3;
  uint64_t v111 = a2;
  uint64_t v109 = a1;
  uint64_t v110 = v118;
  ktrace_events_single();
  uint64_t v97 = v19;
  uint64_t v98 = 3221225472LL;
  uint64_t v99 = __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_3;
  int v100 = &unk_189F62110;
  id v101 = v14;
  id v102 = a1;
  uint64_t v103 = v110;
  uint64_t v104 = a2;
  ktrace_events_single();
  uint64_t v88 = v19;
  uint64_t v89 = 3221225472LL;
  id v90 = __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_128;
  id v91 = &unk_189F62138;
  uint64_t v96 = a3;
  uint64_t v95 = a2;
  id v92 = a1;
  uint64_t v93 = v103;
  id v26 = v8;
  int v94 = v26;
  ktrace_kperf();
  uint64_t v82 = v19;
  uint64_t v83 = 3221225472LL;
  char v84 = __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_132;
  char v85 = &unk_189F62160;
  char v86 = a1;
  char v87 = v93;
  ktrace_events_single();
  id v27 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:1];
  uint64_t v72 = v19;
  uint64_t v73 = 3221225472LL;
  id v74 = __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_2_133;
  uint64_t v75 = &unk_189F62188;
  uint64_t v81 = a3;
  uint64_t v80 = a2;
  uint64_t v76 = a1;
  id v77 = (id)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:1];
  id v78 = v27;
  uint64_t v79 = v87;
  ktrace_events_single();
  uint64_t v63 = v19;
  uint64_t v64 = 3221225472LL;
  uint64_t v65 = __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_3_136;
  int v66 = &unk_189F621B0;
  uint64_t v70 = a2;
  uint64_t v71 = a3;
  id v25 = v78;
  id v67 = v25;
  uint64_t v68 = a1;
  id v69 = v79;
  ktrace_events_single();
  uint64_t v54 = v19;
  uint64_t v55 = 3221225472LL;
  int v56 = __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_4;
  id v57 = &unk_189F621B0;
  uint64_t v61 = a2;
  uint64_t v62 = a3;
  id v58 = v77;
  int v59 = a1;
  int v60 = v69;
  ktrace_events_single();
  uint64_t v45 = v19;
  uint64_t v46 = 3221225472LL;
  int v47 = __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_5;
  uint64_t v48 = &unk_189F621B0;
  uint64_t v52 = a2;
  uint64_t v53 = a3;
  id v20 = v58;
  id v49 = v20;
  uint64_t v50 = a1;
  char v51 = v60;
  ktrace_events_single();
  uint64_t v37 = v19;
  uint64_t v38 = 3221225472LL;
  id v39 = __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_6;
  uint64_t v40 = &unk_189F620E8;
  uint64_t v43 = a2;
  uint64_t v44 = a3;
  uint64_t v41 = a1;
  id v42 = v51;
  ktrace_events_single();
  v32[5] = v19;
  v32[6] = 3221225472LL;
  v32[7] = __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_7;
  v32[8] = &unk_189F621B0;
  uint64_t v35 = a2;
  uint64_t v36 = a3;
  v32[9] = a1;
  id v21 = v42;
  id v33 = v21;
  id v22 = v101;
  id v34 = v22;
  ktrace_events_range();
  [a1 osProductName];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  char v24 = SAIsEmbeddedPlatform(v23);

  if (a1) {
    a1[326] = v24 ^ 1;
  }
  v32[0] = v19;
  v32[1] = 3221225472LL;
  v32[2] = __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_8;
  v32[3] = &unk_189F621D8;
  v32[4] = a1;
  +[SAGesture parseKTrace:embedded:findingGestureAndHIDEvents:]((uint64_t)&OBJC_CLASS___SAGesture, a2, v24, v32);
  v31[0] = v19;
  v31[1] = 3221225472LL;
  v31[2] = __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_9;
  v31[3] = &unk_189F62200;
  v31[4] = a1;
  +[SAIOEvent parseKTrace:findingIOEvents:]((uint64_t)&OBJC_CLASS___SAIOEvent, a2, v31);
  v30[0] = v19;
  v30[1] = 3221225472LL;
  v30[2] = __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_10;
  v30[3] = &unk_189F62228;
  v30[4] = a1;
  +[SAMemoryPressureEvent parseKTrace:findingMemoryPressureEvents:]( (uint64_t)&OBJC_CLASS___SAMemoryPressureEvent,  a2,  v30);
  id v28 = v21;
  id v29 = v22;
  ktrace_events_single();

  _Block_object_dispose(&v123, 8);
}

void __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke( uint64_t a1,  uint64_t *a2)
{
  unint64_t absolute_from_timestamp = ktrace_get_absolute_from_timestamp();
  if (absolute_from_timestamp < *(void *)(a1 + 64))
  {
    unint64_t v5 = absolute_from_timestamp;
    if (a2[2] && (uint64_t v6 = *(void *)(a1 + 72)) != 0)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
      unint64_t v8 = *(void *)(v7 + 24);
      if (absolute_from_timestamp >= v8)
      {
        if (!v8)
        {
          *(void *)(v7 + 24) = absolute_from_timestamp;
          uint64_t v6 = *(void *)(a1 + 72);
          uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
          unint64_t v8 = *(void *)(v7 + 24);
        }

        int v35 = 0;
        *(void *)(v7 + 24) = v6 + v8;
      }

      else
      {
        int v35 = 1;
      }
    }

    else
    {
      int v35 = 0;
    }

    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = *(id *)(a1 + 40);
    int v11 = v10;
    if (!v9) {
      goto LABEL_47;
    }
    if (a2[2])
    {
      BOOL v12 = 1;
      if (!v10) {
        goto LABEL_20;
      }
    }

    else
    {
      if (!v10)
      {
        BOOL v12 = 1;
        goto LABEL_20;
      }

      uint64_t v13 = *((unsigned int *)v10 + 5);
      BOOL v12 = (v13 & 0x80000000) == 0 && a2[1] == v13;
    }

    v10[16] = v12;
    BOOL v12 = 0;
LABEL_20:
    +[SATimestamp timestampWithKTraceEvent:fromSession:]((uint64_t)&OBJC_CLASS___SATimestamp, (uint64_t)a2);
    double v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12) {
      objc_setProperty_atomic(v11, v14, v15, 40LL);
    }

    if ((v35 & 1) != 0) {
      goto LABEL_38;
    }
    if ([(id)v9 dataStyle] == 1 || !objc_msgSend((id)v9, "dataStyle"))
    {
      *(void *)(v9 + 32) = [(id)v9 numSamples] + 1;
      [(id)v9 startTime];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        if (v12) {
          id Property = 0LL;
        }
        else {
          id Property = objc_getProperty(v11, v19, 40LL, 1);
        }
        -[SASampleStore setStartTime:](v9, Property);
      }

      if (v12) {
        id v21 = 0LL;
      }
      else {
        id v21 = objc_getProperty(v11, v19, 40LL, 1);
      }
      -[SASampleStore setEndTime:](v9, v21);
      goto LABEL_38;
    }

    if (!v12 && (v11[16] & 1) != 0) {
      goto LABEL_29;
    }
    if ([(id)v9 dataSource] == 2) {
      goto LABEL_38;
    }
    if (v12) {
      id v17 = 0LL;
    }
    else {
LABEL_29:
    }
      id v17 = objc_getProperty(v11, v16, 40LL, 1);
    [*(id *)(v9 + 24) addObject:v17];
LABEL_38:
    if (qword_18C4B13C0)
    {
      id v22 = __error();
      uint64_t v23 = "non-PET";
      if (!v12 && (v11[16] & 1) != 0) {
        uint64_t v23 = "PET";
      }
      char v24 = (FILE *)qword_18C4B13C0;
      int v25 = *v22;
      uint64_t v26 = *a2;
      [(id)v9 sampleTimestamps];
      id v27 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v29 = [v27 count];
      if (v12) {
        id v30 = 0LL;
      }
      else {
        id v30 = objc_getProperty(v11, v28, 40LL, 1);
      }
      id v31 = [v30 debugDescription];
      int v32 = (const char *)[v31 UTF8String];
      id v33 = "";
      if (v35) {
        id v33 = " (ignored)";
      }
      fprintf(v24, "%'llu \n\n%s Sample %ld at %s%s\n\n", v26, v23, v29 - 1, v32, v33);

      *__error() = v25;
    }

void __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  unint64_t absolute_from_timestamp = ktrace_get_absolute_from_timestamp();
  if (absolute_from_timestamp < *(void *)(a1 + 56))
  {
    unint64_t v5 = absolute_from_timestamp;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    unint64_t v8 = v7;
    if (v6)
    {
      -[SAKPerfState nextSampleForThread:isOnCore:]((uint64_t)v7, *(void *)(a2 + 40), 1);
      if (qword_18C4B13C0)
      {
        int v9 = *__error();
        fprintf( (FILE *)qword_18C4B13C0,  "%'llu PERF_TMR_Handler on thread 0x%llx core %d\n",  *(void *)a2,  *(void *)(a2 + 40),  *(_DWORD *)(a2 + 52));
        *__error() = v9;
      }
    }

    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      *(void *)(v10 + 32) = v5;
    }
  }

void __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_3( void *a1,  uint64_t a2)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v4 = (void *)a1[4];
  [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a2 + 40)];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  int v8 = *(_DWORD *)(a2 + 48);
  if ((v8 & 1) == 0)
  {
    if (!v6) {
      goto LABEL_49;
    }
    if (objc_getProperty((id)v6, v7, 48LL, 1))
    {
      KTraceStringFromArguments(a1[7], a2, 1u);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(objc_getProperty((id)v6, v9, 48, 1), "appendString:", v10);
      }

      else if (qword_18C4B13C0)
      {
        int v15 = *__error();
        double v16 = (FILE *)qword_18C4B13C0;
        uint64_t v17 = *(void *)a2;
        uint64_t v18 = *(void *)(a2 + 40);
        id v19 = [(id)v6 debugDescription];
        fprintf( v16,  "%'llu WARNING: Continuation for dyld info is empty string on thread 0x%llx: %s\n",  v17,  v18,  (const char *)[v19 UTF8String]);

        *__error() = v15;
      }
    }

    goto LABEL_45;
  }

  if ((!*(void *)(a2 + 8) || (*(void *)(a2 + 8) & 0xFFFF0000LL) == 0x1F050000)
    && ((v8 & 2) == 0 || *(void *)(a2 + 24)))
  {
    int v11 = *(void **)(a2 + 16);
    if (v6)
    {
      BOOL v12 = *(void **)(v6 + 40);
      if (v12) {
        BOOL v13 = v12 == v11;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13)
      {
        id v14 = (id *)v6;
        goto LABEL_33;
      }

      id v20 = (void *)a1[4];
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a2 + 40)];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 setObject:0 forKeyedSubscript:v21];
    }

    *(_DWORD *)__int128 buf = -1;
    uint64_t v22 = a1[6];
    if (v22) {
      uint64_t v23 = *(void *)(v22 + 24);
    }
    else {
      uint64_t v23 = 0LL;
    }
    uint64_t v24 = -[SASampleStore existingTaskForEvent:inSession:returningPid:]((void *)a1[5], a2, v23, buf);
    int v25 = (void *)v24;
    if ((*(_DWORD *)buf & 0x80000000) == 0)
    {
      if (!v24)
      {
        execname_for_thread = (_BYTE *)ktrace_get_execname_for_thread();
        if (execname_for_thread && *execname_for_thread)
        {
          SANSStringForCString(execname_for_thread);
          id v27 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          id v27 = 0LL;
        }

        -[SASampleStore taskForPid:andName:didExecAtTimestamp:]((void *)a1[5], *(unsigned int *)buf, v27, 0LL);
        int v25 = (void *)objc_claimAutoreleasedReturnValue();
      }

      id v14 = -[SADyldInfo initWithTask:]((id *)objc_alloc(&OBJC_CLASS___SADyldInfo), v25);
      uint64_t v29 = (void *)a1[4];
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a2 + 40)];
      id v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 setObject:v14 forKeyedSubscript:v30];

      if (!v14)
      {
        uint64_t v6 = 0LL;
        char v31 = 1;
        goto LABEL_34;
      }

void __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_128( uint64_t a1,  _BYTE *a2)
{
  if (a2)
  {
    if ((*a2 & 1) != 0)
    {
      unint64_t absolute_from_timestamp = ktrace_get_absolute_from_timestamp();
      if (absolute_from_timestamp < *(void *)(a1 + 64))
      {
        unint64_t v5 = absolute_from_timestamp;
        -[SASampleStore kperfRecord:state:frameIterator:]( *(void **)(a1 + 32),  (uint64_t)a2,  *(void **)(a1 + 40),  *(void **)(a1 + 48));
        uint64_t v6 = *(void *)(a1 + 40);
        if (v6)
        {
          if (v5 > *(void *)(v6 + 32)) {
            *(void *)(v6 + 32) = v5;
          }
        }
      }
    }
  }

  else
  {
    int v7 = *__error();
    _sa_logt();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v15 = 0;
      _os_log_error_impl(&dword_186C92000, v8, OS_LOG_TYPE_ERROR, "NULL rec", v15, 2u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(1852, "NULL rec", v9, v10, v11, v12, v13, v14, v15[0]);
    _os_crash();
    __break(1u);
  }

void __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_132( uint64_t a1,  uint64_t a2)
{
  if ((*(_BYTE *)(a2 + 8) & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    if (v3)
    {
      uint64_t v17 = v4;
      if (v4) {
        uint64_t v5 = v4[3];
      }
      else {
        uint64_t v5 = 0LL;
      }
      -[SASampleStore existingTaskForEvent:inSession:returningPid:](v3, a2, v5, 0LL);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      int v7 = v6;
      if (v6)
      {
        [v6 threads];
        int v8 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a2 + 40)];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 objectForKeyedSubscript:v9];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          [v10 threadStates];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 lastObject];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && ([v12 filledUserStack] & 1) == 0)
            {
              if (qword_18C4B13C0)
              {
                int v13 = *__error();
                uint64_t v14 = (FILE *)qword_18C4B13C0;
                uint64_t v15 = *(void *)a2;
                id v16 = [v7 debugDescription];
                fprintf( v14,  "%'llu WARNING: KPerf had an error getting user stack for task %s thread 0x%llx\n",  v15,  (const char *)[v16 UTF8String],  *(void *)(a2 + 40));

                *__error() = v13;
              }

              [v12 setFilledUserStack:1];
            }
          }
        }
      }

      id v4 = v17;
    }
  }

void __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_2_133( uint64_t a1,  uint64_t a2)
{
  unint64_t absolute_from_timestamp = ktrace_get_absolute_from_timestamp();
  if (absolute_from_timestamp < *(void *)(a1 + 72))
  {
    unint64_t v5 = absolute_from_timestamp;
    unsigned int v19 = -1;
    id v6 =  -[SASampleStore existingTaskForEvent:inSession:returningPid:]( *(void **)(a1 + 32),  a2,  *(void *)(a1 + 64),  &v19);
    unsigned int v7 = v19;
    if ((v19 & 0x80000000) != 0)
    {
      if (qword_18C4B13C0)
      {
        int v18 = *__error();
        fprintf( (FILE *)qword_18C4B13C0,  "%'llu WARNING: Unable to determine old pid for TRACE_DATA_NEWTHREAD on thread 0x%llx: %d\n",  *(void *)a2,  *(void *)(a2 + 40),  v19);
        *__error() = v18;
      }
    }

    else
    {
      unint64_t v8 = *(void *)(a2 + 8);
      int v9 = *(_DWORD *)(a2 + 16);
      if (v19 == v9 && *(void *)(a2 + 24))
      {
        [MEMORY[0x189607968] numberWithInt:v19];
        uint64_t v10 = (SANewThreadInfo *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = *(void **)(a1 + 40);
        [MEMORY[0x189607968] numberWithUnsignedLongLong:v8];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 setObject:v10 forKeyedSubscript:v12];
      }

      else
      {
        uint64_t v10 = objc_alloc_init(&OBJC_CLASS___SANewThreadInfo);
        +[SATimestamp timestampWithKTraceEvent:fromSession:]((uint64_t)&OBJC_CLASS___SATimestamp, a2);
        int v13 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = v13;
        if (v10)
        {
          objc_setProperty_atomic(v10, v14, v13, 16LL);

          v10->_newTid = v8;
          v10->_oldPid = v7;
          v10->_newPid = v9;
        }

        else
        {
        }

        id v16 = *(void **)(a1 + 48);
        [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a2 + 40)];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 setObject:v10 forKeyedSubscript:v12];
      }

      uint64_t v17 = *(void *)(a1 + 56);
      if (v17) {
        *(void *)(v17 + 32) = v5;
      }
    }
  }

void __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_3_136( void *a1,  uint64_t a2)
{
  unint64_t absolute_from_timestamp = ktrace_get_absolute_from_timestamp();
  if (absolute_from_timestamp >= a1[8]) {
    return;
  }
  unint64_t v5 = absolute_from_timestamp;
  id v6 = (void *)a1[4];
  [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a2 + 40)];
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v7];
  id v48 = (id)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    KTraceStringFromArguments(a1[7], a2, 1u);
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = v8;
    if (v8)
    {
      SACachedNSString(v8);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    uint64_t v11 = (void *)a1[5];
    uint64_t v12 = (uint64_t *)v48;
    id v14 = v10;
    if (!v11)
    {
LABEL_36:

      id v39 = (void *)a1[4];
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a2 + 40)];
      int v40 = (void *)objc_claimAutoreleasedReturnValue();
      [v39 setObject:0 forKeyedSubscript:v40];

      goto LABEL_37;
    }

    uint64_t v46 = v12[3];
    uint64_t v16 = *((unsigned int *)v12 + 2);
    uint64_t v15 = *((unsigned int *)v12 + 3);
    id newValue = objc_getProperty(v12, v13, 16LL, 1);
    if ((_DWORD)v16 == (_DWORD)v15)
    {
      uint64_t v17 = -[SASampleStore taskForPid:andName:didExecAtTimestamp:](v11, v16, v14, 0LL);
      if (!qword_18C4B13C0)
      {
        int v25 = (_DWORD *)v17;
LABEL_31:
        [v25 threads];
        id v33 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607968] numberWithUnsignedLongLong:v46];
        int v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 objectForKeyedSubscript:v34];
        int v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v35)
        {
          +[SAThread threadWithId:]((uint64_t)&OBJC_CLASS___SAThread, v46);
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
          id v38 = v36;
          if (v36) {
            objc_setProperty_atomic(v36, v37, newValue, 32LL);
          }
          -[SATask addThread:]((uint64_t)v25, v38);
        }

        goto LABEL_36;
      }

      uint64_t v44 = (void *)v17;
      int v18 = *__error();
      unsigned int v19 = (FILE *)qword_18C4B13C0;
      uint64_t v20 = [newValue machAbsTime];
      id v21 = [v44 debugDescription];
      fprintf(v19, "%'llu %s creating thread 0x%llx\n", v20, (const char *)[v21 UTF8String], v46);

      *__error() = v18;
LABEL_30:
      int v25 = v44;
      goto LABEL_31;
    }

    -[SASampleStore lastTaskWithPid:](v11, v15);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = (uint64_t)v22;
    if (v22)
    {
      [v22 exitTimestamp];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {

        if ((_DWORD)v15)
        {
          uint64_t v45 = (void *)v23;
          BOOL v43 = (_DWORD)v16 == 0;
          goto LABEL_19;
        }
      }
    }

    else
    {
      if ((_DWORD)v15)
      {
        uint64_t v45 = 0LL;
        if (!(_DWORD)v16)
        {
          if (qword_18C4B13C0)
          {
            int v42 = *__error();
            fprintf( (FILE *)qword_18C4B13C0,  "%'llu kernel creating thread 0x%llx in process [%d]\n",  [newValue machAbsTime],  v46,  v15);
            id v27 = 0LL;
            *__error() = v42;
          }

          else
          {
            id v27 = 0LL;
          }

          BOOL v43 = 1;
LABEL_22:
          -[SASampleStore taskForPid:andName:didExecAtTimestamp:](v11, v15, v14, v27);
          int v25 = (_DWORD *)objc_claimAutoreleasedReturnValue();

          char v28 = v43;
          if (!v25) {
            char v28 = 1;
          }
          if ((v28 & 1) == 0) {
            v25[20] = v16;
          }

          goto LABEL_31;
        }

        BOOL v43 = 0;
LABEL_19:
        if (qword_18C4B13C0)
        {
          int v26 = *__error();
          fprintf( (FILE *)qword_18C4B13C0,  "%'llu [%d] creating thread 0x%llx in new process [%d]\n",  [newValue machAbsTime],  v16,  v46,  v15);
          *__error() = v26;
        }

        id v27 = newValue;
        goto LABEL_22;
      }

      uint64_t v23 = -[SASampleStore taskForPid:andName:didExecAtTimestamp:](v11, 0LL, v14, 0LL);
    }

    if (!qword_18C4B13C0)
    {
      int v25 = (_DWORD *)v23;
      goto LABEL_31;
    }

    uint64_t v44 = (void *)v23;
    int v29 = *__error();
    id v30 = (FILE *)qword_18C4B13C0;
    uint64_t v31 = [newValue machAbsTime];
    id v32 = [v44 debugDescription];
    fprintf( v30,  "%'llu Task [%d] creating thread 0x%llx in other process %s\n",  v31,  v16,  v46,  (const char *)[v32 UTF8String]);

    *__error() = v29;
    goto LABEL_30;
  }

void __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_4( uint64_t a1,  uint64_t *a2)
{
  unint64_t absolute_from_timestamp = ktrace_get_absolute_from_timestamp();
  if (absolute_from_timestamp < *(void *)(a1 + 64))
  {
    unint64_t v5 = absolute_from_timestamp;
    id v6 = *(void **)(a1 + 32);
    unint64_t v7 = 0x189607000uLL;
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a2[5]];
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:v8];
    id v37 = (id)objc_claimAutoreleasedReturnValue();

    if (v37) {
      uint64_t v9 = [v37 intValue];
    }
    else {
      uint64_t v9 = 0xFFFFFFFFLL;
    }
    uint64_t v10 = *(void **)(a1 + 40);
    uint64_t v11 = *(id *)(a1 + 48);
    uint64_t v12 = v11;
    unsigned int v38 = v9;
    if (v10)
    {
      if ((_DWORD)v9 == -1)
      {
        if (v11) {
          uint64_t v14 = v11[3];
        }
        else {
          uint64_t v14 = 0LL;
        }
        uint64_t v13 = -[SASampleStore existingTaskForEvent:inSession:returningPid:](v10, (uint64_t)a2, v14, &v38);
      }

      else
      {
        uint64_t v13 = -[SASampleStore lastTaskWithPid:](v10, v9);
      }

      uint64_t v15 = (void *)v13;
      if ((v38 & 0x80000000) != 0)
      {
        if (qword_18C4B13C0)
        {
          int v28 = *__error();
          fprintf( (FILE *)qword_18C4B13C0,  "%'llu WARNING: Unable to determine pid for exec on thread 0x%llx: %d\n",  *a2,  a2[5],  v38);
          *__error() = v28;
        }
      }

      else
      {
        if (v12) {
          uint64_t v16 = v12[3];
        }
        else {
          uint64_t v16 = 0LL;
        }
        KTraceStringFromArguments(v16, (uint64_t)a2, 1u);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[SATimestamp timestampWithKTraceEvent:fromSession:]((uint64_t)&OBJC_CLASS___SATimestamp, (uint64_t)a2);
        id newValue = (id)objc_claimAutoreleasedReturnValue();
        -[SASampleStore taskForPid:andName:didExecAtTimestamp:](v10, v38, v17, newValue);
        int v18 = (_DWORD *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          int v19 = [v15 ppid];
          if (v18) {
            v18[20] = v19;
          }
        }

        +[SAThread threadWithId:]((uint64_t)&OBJC_CLASS___SAThread, a2[5]);
        uint64_t v20 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = v20;
        if (v20)
        {
          v20[17] = 1;
          objc_setProperty_atomic(v20, v21, newValue, 32LL);
        }

        -[SATask addThread:]((uint64_t)v18, v22);
        if (v18) {
          objc_setProperty_atomic(v18, v23, v22, 264LL);
        }
        if (qword_18C4B13C0)
        {
          int v34 = v17;
          int v35 = v15;
          int v32 = *__error();
          id v33 = (FILE *)qword_18C4B13C0;
          uint64_t v24 = *a2;
          id v25 = [v15 debugDescription];
          int v26 = (const char *)[v25 UTF8String];
          id v27 = [v18 debugDescription];
          fprintf(v33, "%'llu %s exec'ed %s\n", v24, v26, (const char *)[v27 UTF8String]);

          uint64_t v15 = v35;
          *__error() = v32;
          unint64_t v7 = 0x189607000LL;
          uint64_t v17 = v34;
        }
      }
    }

    int v29 = *(void **)(a1 + 32);
    [*(id *)(v7 + 2408) numberWithUnsignedLongLong:a2[5]];
    id v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 setObject:0 forKeyedSubscript:v30];

    uint64_t v31 = *(void *)(a1 + 48);
    if (v31) {
      *(void *)(v31 + 32) = v5;
    }
  }

void __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_5( uint64_t a1,  uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  unint64_t absolute_from_timestamp = ktrace_get_absolute_from_timestamp();
  if (absolute_from_timestamp < *(void *)(a1 + 64))
  {
    unint64_t v5 = absolute_from_timestamp;
    id v6 = *(void **)(a1 + 32);
    [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a2 + 40)];
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:v7];
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      uint64_t v9 = *(void **)(a1 + 32);
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a2 + 40)];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setObject:0 forKeyedSubscript:v10];

      goto LABEL_23;
    }

    uint64_t v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(id *)(a1 + 48);
    if (!v11)
    {
LABEL_22:

LABEL_23:
      uint64_t v22 = *(void *)(a1 + 48);
      if (v22) {
        *(void *)(v22 + 32) = v5;
      }
      return;
    }

    -[SASampleStore lastTaskWithPid:orTid:](v11, 0xFFFFFFFFLL, *(void *)(a2 + 40));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      int v18 = *__error();
      _sa_logt();
      int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        if (v12) {
          uint64_t v23 = v12[3];
        }
        else {
          uint64_t v23 = 0LL;
        }
        uint64_t v24 = *(void *)(a2 + 40);
        KTraceStringFromArguments(v23, a2, 1u);
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        int v26 = 134218242;
        uint64_t v27 = v24;
        __int16 v28 = 2112;
        int v29 = v25;
        _os_log_debug_impl( &dword_186C92000,  v19,  OS_LOG_TYPE_DEBUG,  "No task with thread 0x%llx at exit for name %@",  (uint8_t *)&v26,  0x16u);
      }

      *__error() = v18;
      goto LABEL_21;
    }

    if (v12) {
      uint64_t v14 = v12[3];
    }
    else {
      uint64_t v14 = 0LL;
    }
    KTraceStringFromArguments(v14, a2, 1u);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v13 name];
    uint64_t v17 = (void *)v16;
    if (v15)
    {
      if (v13[7] && v16)
      {
        if (([v15 hasPrefix:v16] & 1) == 0) {
          goto LABEL_18;
        }
      }

      else if (!v16)
      {
LABEL_17:
        -[SATask setName:]((uint64_t)v13, v15);
        goto LABEL_18;
      }

      if (([v17 hasPrefix:v15] & 1) == 0) {
        goto LABEL_17;
      }
    }

void __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_6( uint64_t a1,  void *a2)
{
  unint64_t absolute_from_timestamp = ktrace_get_absolute_from_timestamp();
  if (absolute_from_timestamp < *(void *)(a1 + 56))
  {
    unint64_t v5 = absolute_from_timestamp;
    id v6 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    if (v6)
    {
      uint64_t v8 = a2[1];
      +[SATimestamp timestampWithKTraceEvent:fromSession:]((uint64_t)&OBJC_CLASS___SATimestamp, (uint64_t)a2);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASampleStore lastTaskWithPid:orTid:](v6, 0xFFFFFFFFLL, v8);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = v10;
      if (v10)
      {
        [v10 exitTimestamp];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          [v11 threads];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189607968] numberWithUnsignedLongLong:v8];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 objectForKeyedSubscript:v14];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15) {
            objc_setProperty_atomic(v15, v16, v9, 40LL);
          }
        }
      }

      else if (qword_18C4B13C0)
      {
        int v17 = *__error();
        fprintf( (FILE *)qword_18C4B13C0,  "%'llu Thread 0x%llx exited, but we don't have a task with that thread!\n",  *a2,  v8);
        *__error() = v17;
      }
    }

    uint64_t v18 = *(void *)(a1 + 40);
    if (v18) {
      *(void *)(v18 + 32) = v5;
    }
  }

void __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_7( uint64_t a1,  __int32 *a2)
{
  uint64_t v85 = *MEMORY[0x1895F89C0];
  unint64_t absolute_from_timestamp = ktrace_get_absolute_from_timestamp();
  if (absolute_from_timestamp < *(void *)(a1 + 64))
  {
    id v5 = (id)absolute_from_timestamp;
    id v6 = *(void **)(a1 + 32);
    id v7 = *(void **)(a1 + 48);
    uint64_t v80 = *(id *)(a1 + 40);
    id v81 = v7;
    if (!v6) {
      goto LABEL_97;
    }
    [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)a2 + 5)];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v81 objectForKeyedSubscript:v8];

    char v11 = 0;
    int v12 = 0;
    LOBYTE(v13) = 0;
    int v14 = 0;
    int v15 = 0;
    switch((unsigned __int16)a2[12] >> 2)
    {
      case 0:
      case 5:
        goto LABEL_36;
      case 1:
      case 6:
        if (!v9) {
          goto LABEL_59;
        }
        goto LABEL_7;
      case 2:
      case 7:
        goto LABEL_23;
      case 3:
      case 8:
        goto LABEL_49;
      case 4:
      case 9:
        goto LABEL_14;
      case 10:
        char v11 = 1;
LABEL_36:
        int32x4_t uu = *(int32x4_t *)(a2 + 2);
        if (uuid_is_null((const unsigned __int8 *)&uu))
        {
          if (!qword_18C4B13C0) {
            goto LABEL_96;
          }
          goto LABEL_25;
        }

        if (v9 && !objc_getProperty((id)v9, v33, 24LL, 1)) {
          goto LABEL_80;
        }
        *(_DWORD *)__int128 buf = -1;
        if (v80) {
          uint64_t v35 = v80[3];
        }
        else {
          uint64_t v35 = 0LL;
        }
        uint64_t v36 = -[SASampleStore existingTaskForEvent:inSession:returningPid:](v6, (uint64_t)a2, v35, buf);
        id v37 = (void *)v36;
        if ((*(_DWORD *)buf & 0x80000000) == 0)
        {
          if (!v36)
          {
            execname_for_thread = (_BYTE *)ktrace_get_execname_for_thread();
            if (execname_for_thread && *execname_for_thread)
            {
              SANSStringForCString(execname_for_thread);
              id v39 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              id v39 = 0LL;
            }

            -[SASampleStore taskForPid:andName:didExecAtTimestamp:](v6, *(unsigned int *)buf, v39, 0LL);
            id v37 = (void *)objc_claimAutoreleasedReturnValue();
          }

          uint64_t v73 = -[SADyldInfo initWithTask:]((id *)objc_alloc(&OBJC_CLASS___SADyldInfo), v37);

          [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)a2 + 5)];
          id v74 = (void *)objc_claimAutoreleasedReturnValue();
          [v81 setObject:v73 forKeyedSubscript:v74];

          uint64_t v9 = (uint64_t)v73;
          goto LABEL_92;
        }

        if (qword_18C4B13C0)
        {
          id v48 = (void *)v36;
          int v49 = *__error();
          fprintf( (FILE *)qword_18C4B13C0,  "%'llu WARNING: Unable to determine pid for dyld on thread 0x%llx: %d\n",  *(void *)a2,  *((void *)a2 + 5),  *(_DWORD *)buf);
          *__error() = v49;
          id v37 = v48;
        }

        goto LABEL_96;
      case 11:
        int v12 = 1;
        if (!v9) {
          goto LABEL_59;
        }
LABEL_7:
        id v16 = objc_getProperty((id)v9, v10, 24LL, 1);
        if (!v16) {
          goto LABEL_59;
        }
        char v17 = *(_BYTE *)(v9 + 8);

        if (v12)
        {
          if ((v17 & 1) != 0)
          {
LABEL_10:
            uint64_t v19 = *((void *)a2 + 2);
            uint64_t v20 = *(void *)(v9 + 40);
            if (!v20 || v20 == v19) {
              goto LABEL_21;
            }
            goto LABEL_20;
          }
        }

        else if ((v17 & 1) == 0)
        {
          goto LABEL_10;
        }

void __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_8( uint64_t a1,  void *a2,  void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      [*(id *)(v6 + 64) addObject:v8];
    }
  }

  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      [*(id *)(v7 + 56) addObject:v5];
    }
  }
}

void __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_9( uint64_t a1,  void *a2)
{
}

uint64_t __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_10( uint64_t result,  uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [*(id *)(v2 + 96) addObject:a2];
  }
  return result;
}

unint64_t __84__SASampleStore_KPerf___addKPerfDataFromKTraceSession_beforeMachAbsTime_petTimerID___block_invoke_11( uint64_t a1,  uint64_t a2)
{
  unint64_t result = ktrace_get_absolute_from_timestamp();
  if (result < *(void *)(a1 + 64))
  {
    unint64_t v5 = result;
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    if (v6)
    {
      [v6 startTime];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        +[SATimestamp timestampWithKTraceEvent:fromSession:]((uint64_t)&OBJC_CLASS___SATimestamp, a2);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 wallTime];
        uint64_t v30 = (__CFString *)_CopyStringForTime(3, v10);
        if ([v6 dataStyle] == 1 || !objc_msgSend(v6, "dataStyle"))
        {
          uint64_t v19 = (FILE *)*MEMORY[0x1895F89D0];
          [v9 machAbsTimeSeconds];
          double v21 = v20;
          [v8 machAbsTimeSeconds];
          double v23 = v22;
          uint64_t v24 = (const char *)-[__CFString UTF8String](v30, "UTF8String");
          uint64_t absolute_from_timestamp = ktrace_get_absolute_from_timestamp();
          uint64_t continuous_from_timestamp = ktrace_get_continuous_from_timestamp();
          fprintf( v19,  "Warning: Lost trace events, dropping all samples (%.2fs) before %s (machabs %llu / machcont %llu)\n",  v21 - v23,  v24,  absolute_from_timestamp,  continuous_from_timestamp);
        }

        else
        {
          uint64_t v29 = (FILE *)*MEMORY[0x1895F89D0];
          [v6 sampleTimestamps];
          char v11 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v28 = [v11 count];
          [v9 machAbsTimeSeconds];
          double v13 = v12;
          [v8 machAbsTimeSeconds];
          double v15 = v14;
          id v16 = (const char *)-[__CFString UTF8String](v30, "UTF8String");
          uint64_t v17 = ktrace_get_absolute_from_timestamp();
          uint64_t v18 = ktrace_get_continuous_from_timestamp();
          fprintf( v29,  "Warning: Lost trace events, dropping first %lu samples (%.2fs) before %s (machabs %llu / machcont %llu)\n",  v28,  v13 - v15,  v16,  v17,  v18);
        }
      }

      -[SASampleStore removeAllData](v6);
    }

    unint64_t result = [*(id *)(a1 + 48) removeAllObjects];
    uint64_t v27 = *(void *)(a1 + 40);
    if (v27) {
      *(void *)(v27 + 32) = v5;
    }
  }

  return result;
}

- (id)loadInfosForKTSymbolOwners:(int)a3 isKernelSpace:(uint64_t)a4 excludeRange:(unint64_t)a5
{
  uint64_t v211 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  unint64_t v5 = a2;
  char v196 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:*a2];
  id v7 = v5 + 1;
  uint64_t v6 = *v5;
  if ((_DWORD)v6)
  {
    int v194 = 0;
    int v189 = 0;
    int v200 = &v7[v6];
    while (1)
    {
      uint64_t v8 = *v7;
      uint64_t v9 = (void *)MEMORY[0x186E47ACC]();
      double v10 = (int *)((char *)v7 + v8);
      char v11 = (unsigned __int16 *)((char *)v7 + v8 - *(int *)((char *)v7 + v8));
      unsigned int v12 = *v11;
      if (v12 < 5
        || !v11[2]
        || (v12 >= 7 ? (v13 = *((_BYTE *)v10 + v11[2]) == 1) : (v13 = 0), !v13 || (uint64_t v14 = v11[3]) == 0))
      {
        if (_MergedGlobals_4[0] == 1)
        {
          int v20 = *__error();
          _sa_logt();
          double v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            int v25 = (unsigned __int16 *)((char *)v10 - *v10);
            if (*v25 >= 0xBu && (uint64_t v26 = v25[5]) != 0) {
              uint64_t v27 = *(void *)((char *)v10 + v26);
            }
            else {
              uint64_t v27 = -1LL;
            }
            *(_DWORD *)int32x4_t uu = 134217984;
            *(void *)&uu[4] = v27;
            _os_log_debug_impl( &dword_186C92000,  v21,  OS_LOG_TYPE_DEBUG,  "SAKTSYM No macho for symbol owner at 0x%llx",  uu,  0xCu);
          }

          *__error() = v20;
        }

        goto LABEL_20;
      }

      BOOL v197 = (char *)v10 + v14 + *(unsigned int *)((char *)v10 + v14);
      double v15 = &v197[-*(int *)v197];
      if (*(unsigned __int16 *)v15 < 5u || (uint64_t v16 = *((unsigned __int16 *)v15 + 2)) == 0)
      {
        if (_MergedGlobals_4[0] == 1)
        {
          int v22 = *__error();
          _sa_logt();
          double v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            int v49 = (unsigned __int16 *)((char *)v10 - *v10);
            if (*v49 >= 0xBu && (uint64_t v50 = v49[5]) != 0) {
              uint64_t v51 = *(void *)((char *)v10 + v50);
            }
            else {
              uint64_t v51 = -1LL;
            }
            *(_DWORD *)int32x4_t uu = 134217984;
            *(void *)&uu[4] = v51;
            _os_log_debug_impl( &dword_186C92000,  v23,  OS_LOG_TYPE_DEBUG,  "SAKTSYM No UUID for symbol owner at 0x%llx",  uu,  0xCu);
          }

          uint64_t v24 = 0LL;
          *__error() = v22;
        }

        else
        {
          uint64_t v24 = 0LL;
        }

        goto LABEL_242;
      }

      *(void *)int32x4_t uu = 0LL;
      *(void *)&uu[8] = 0LL;
      uuid_parse(&v197[v16 + 4 + *(unsigned int *)&v197[v16]], uu);
      uint64_t v17 = &v197[-*(int *)v197];
      if (*(unsigned __int16 *)v17 >= 7u && (uint64_t v18 = *((unsigned __int16 *)v17 + 3)) != 0)
      {
        SANSStringForCString((void *)&v197[v18 + 4 + *(unsigned int *)&v197[v18]]);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v19 = 0LL;
      }

      uuidForBytes((uint64_t)uu);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      else {
        uint64_t v29 = 0LL;
      }
      +[SABinary binaryWithUUID:absolutePath:](&OBJC_CLASS___SABinary, "binaryWithUUID:absolutePath:", v28, v29, log);
      self = (id)objc_claimAutoreleasedReturnValue();

      [self path];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30) {
        BOOL v31 = 1;
      }
      else {
        BOOL v31 = v19 == 0LL;
      }
      int v32 = !v31;

      if (v32)
      {
        if (self) {
          objc_setProperty_atomic_copy(self, v33, v19, 80LL);
        }
        if (_MergedGlobals_4[0] == 1)
        {
          int v34 = *__error();
          _sa_logt();
          uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            [self debugDescription];
            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)__int128 buf = 138412290;
            uint64_t v210 = v36;
            _os_log_impl( &dword_186C92000,  v35,  OS_LOG_TYPE_DEFAULT,  "WARNING: SAKTSYM Used relative path for binary %@",  buf,  0xCu);
          }

          *__error() = v34;
        }
      }

      uint64_t v24 = self;
      if (!self) {
        goto LABEL_242;
      }
      id v37 = &v197[-*(int *)v197];
      if (*(unsigned __int16 *)v37 >= 0x15u)
      {
        uint64_t v38 = *((unsigned __int16 *)v37 + 10);
        if (v38)
        {
          id v39 = (char *)&v197[v38 + 4 + *(unsigned int *)&v197[v38]];
          SANSStringForCString(v39);
          id v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            [self bundleIdentifier];
            char v41 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v42 = v41 == 0LL;

            if (v42)
            {
              SANSStringForCString(v39);
              char v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_setProperty_atomic_copy(self, v53, v52, 88LL);
            }

            else
            {
              [self bundleIdentifier];
              int v43 = (void *)objc_claimAutoreleasedReturnValue();
              char v44 = [v43 isEqualToString:v40];

              if ((v44 & 1) == 0)
              {
                int v45 = *__error();
                _sa_logt();
                uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
                {
                  [self debugDescription];
                  uint64_t v169 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)int32x4_t uu = 136315394;
                  *(void *)&uu[4] = v39;
                  *(_WORD *)&uu[12] = 2112;
                  *(void *)&uu[14] = v169;
                  _os_log_fault_impl( &dword_186C92000,  v46,  OS_LOG_TYPE_FAULT,  "SAKTSYM Mismatched bundle id %s with existing binary %@",  uu,  0x16u);
                }

                *__error() = v45;
              }
            }
          }

          else
          {
            int v47 = *__error();
            _sa_logt();
            id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)int32x4_t uu = 136315138;
              *(void *)&uu[4] = v39;
              _os_log_fault_impl( &dword_186C92000,  v48,  OS_LOG_TYPE_FAULT,  "SAKTSYM Unable to get string for bundle id %s",  uu,  0xCu);
            }

            *__error() = v47;
          }

          uint64_t v24 = self;
        }
      }

      uint64_t v54 = (unsigned __int16 *)((char *)v10 - *v10);
      unsigned int v55 = *v54;
      if (v55 < 0xD)
      {
        char v181 = 1;
        if (v55 < 9) {
          break;
        }
        BOOL v56 = 0;
      }

      else
      {
        BOOL v56 = v54[6] && *((_BYTE *)v10 + v54[6]) != 0;
        char v181 = !v56;
      }

      uint64_t v57 = v54[4];
      if (!v57) {
        break;
      }
      if (!*(int *)((char *)v10 + v57 + *(unsigned int *)((char *)v10 + v57)))
      {
        if (_MergedGlobals_4[0] != 1)
        {
LABEL_218:
          uint64_t v190 = -1LL;
          uint64_t v193 = -1LL;
LABEL_223:
          if ((v181 & 1) != 0) {
            goto LABEL_242;
          }
          goto LABEL_224;
        }

        int v148 = *__error();
        _sa_logt();
        id v149 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v149, OS_LOG_TYPE_DEBUG))
        {
          [self debugDescription];
          uint64_t v168 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)int32x4_t uu = 138412290;
          *(void *)&uu[4] = v168;
          _os_log_debug_impl( &dword_186C92000,  v149,  OS_LOG_TYPE_DEBUG,  "SAKTSYM symbol owner %@ not contiguous, but has zero segments",  uu,  0xCu);
        }

        goto LABEL_216;
      }

      uint64_t v178 = [v196 count];
      BOOL v179 = v56;
      uint64_t v58 = *(unsigned __int16 *)((char *)v10 - *v10 + 8);
      uint64_t v59 = *(unsigned int *)((char *)v10 + v58);
      uint64_t v60 = *(unsigned int *)((char *)v10 + v58 + v59);
      if ((_DWORD)v60)
      {
        uint64_t v61 = 0LL;
        int v188 = 0;
        uint64_t v195 = 4 * v60;
        uint64_t v198 = (char *)v5 + v58 + v8 + v59;
        uint64_t v193 = -1LL;
        uint64_t v190 = -1LL;
        while (1)
        {
          uint64_t v62 = *(unsigned int *)&v198[v61 + 8];
          uint64_t v63 = &v198[v61 + v62];
          uint64_t v64 = v62 - *((int *)v63 + 2);
          uint64_t v65 = &v198[v61 + v64];
          unsigned int v66 = *((unsigned __int16 *)v65 + 4);
          else {
            uint64_t v68 = 0LL;
          }
          id v69 = (unsigned int *)((char *)v10 + *(unsigned __int16 *)((char *)v10 - *v10 + 8));
          if (v193 != -1) {
            break;
          }
          else {
            uint64_t v78 = -1LL;
          }
          uint64_t v193 = v78;
          if (v68) {
            goto LABEL_85;
          }
LABEL_99:
          if (!a3
            || !CSArchitectureIsArm64()
            || (__int32 v79 = (unsigned int *)((char *)v10 + *(unsigned __int16 *)((char *)v10 - *v10 + 8)),
                *(unsigned int *)((char *)v79 + *v79) != 1))
          {
            if (_MergedGlobals_4[0] == 1)
            {
              int v82 = *__error();
              _sa_logt();
              uint64_t v83 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v125 = &v198[v61 + v62 - *((int *)v63 + 2)];
                else {
                  uint64_t v127 = -1LL;
                }
                objc_msgSend(self, "debugDescription", log);
                id v133 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)int32x4_t uu = 134218242;
                *(void *)&uu[4] = v127;
                *(_WORD *)&uu[12] = 2112;
                *(void *)&uu[14] = v133;
                _os_log_debug_impl( &dword_186C92000,  v83,  OS_LOG_TYPE_DEBUG,  "SAKTSYM No name for segment at offset 0x%llx into %@",  uu,  0x16u);
              }

              *__error() = v82;
              goto LABEL_183;
            }

            goto LABEL_184;
          }

          if (qword_18C4B13C8 != -1) {
            dispatch_once(&qword_18C4B13C8, &__block_literal_global_2);
          }
          uint64_t v68 = "__TEXT_EXEC";
          if (_MergedGlobals_4[0] == 1)
          {
            int v80 = *__error();
            _sa_logt();
            id v81 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
            {
              id v135 = &v198[v61 + v62 - *((int *)v63 + 2)];
              else {
                uint64_t v137 = -1LL;
              }
              uint64_t v187 = v137;
              objc_msgSend(self, "debugDescription", log);
              id v147 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)int32x4_t uu = 134218242;
              *(void *)&uu[4] = v187;
              *(_WORD *)&uu[12] = 2112;
              *(void *)&uu[14] = v147;
              _os_log_debug_impl( &dword_186C92000,  v81,  OS_LOG_TYPE_DEBUG,  "SAKTSYM No name for segment at offset 0x%llx into %@, assuming TEXT_EXEC",  uu,  0x16u);
            }

            *__error() = v80;
            uint64_t v68 = "__TEXT_EXEC";
            uint64_t v24 = self;
          }

size_t __78__SASampleStore_KPerf__loadInfosForKTSymbolOwners_isKernelSpace_excludeRange___block_invoke()
{
  return fwrite( "Ktrace load info for 64-bit arm kernel binary segment has no name, assuming TEXT_EXEC segment...\n",  0x61uLL,  1uLL,  (FILE *)*MEMORY[0x1895F89D0]);
}

void __116__SASampleStore_KPerf__addLoadInfoFromKTrace_lastKTraceEventTimestamp_checkForNewLoadInfosEvenWithExistingLoadInfo___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v514 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  -[SASampleStore _lastTaskOnOrBeforeTimestamp:inTasks:](*(void *)(a1 + 32), *(void **)(a1 + 40), v6);
  id v7 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (!v7)
  {
    if (_MergedGlobals_4[0] == 1)
    {
      int v13 = *__error();
      _sa_logt();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v368 = [v5 intValue];
        [*(id *)(a1 + 40) debugDescription];
        v369 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__int128 buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v368;
        *(_WORD *)&uint8_t buf[8] = 2112;
        *(void *)&buf[10] = v369;
        _os_log_debug_impl( &dword_186C92000,  v14,  OS_LOG_TYPE_DEBUG,  "SAKTSYM No tasks with pid %d before last ktrace timestamp %@",  buf,  0x12u);
      }

      *__error() = v13;
    }

    goto LABEL_27;
  }

  if ([v7 pid])
  {
    [v8 binaryLoadInfos];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v9 count])
    {
      int v10 = *(unsigned __int8 *)(a1 + 56);

      if (!v10)
      {
        if (_MergedGlobals_4[0] == 1)
        {
          int v11 = *__error();
          _sa_logt();
          unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            [v8 name];
            uint64_t v371 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)__int128 buf = 138412546;
            *(void *)&uint8_t buf[4] = v371;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = [v8 pid];
            _os_log_debug_impl( &dword_186C92000,  v12,  OS_LOG_TYPE_DEBUG,  "SAKTSYM %@ [%d] Already have load info, not checking libktrace",  buf,  0x12u);
          }

          *__error() = v11;
        }

+ (BOOL)canOpenFileAsKTraceFile:(const char *)a3 errorOut:(id *)a4
{
  if (!ktrace_session_create())
  {
    if (a4)
    {
      id v6 = @"Unable to allocate ktrace_session";
      goto LABEL_7;
    }

    return 0;
  }

  uint64_t v5 = ktrace_set_file();
  ktrace_session_destroy();
  if ((_DWORD)v5)
  {
    if (a4)
    {
      id v6 = (__CFString *)(id)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Unable set file as ktrace: %d",  v5);
LABEL_7:
      BOOL result = 0;
      *a4 = v6;
      return result;
    }

    return 0;
  }

  return 1;
}

- (BOOL)parseStackshotsFromKTraceFile:(const char *)a3 warningsOut:(id)a4 errorOut:(id *)a5
{
  id v9 = 0LL;
  if (a5) {
    id v6 = &v9;
  }
  else {
    id v6 = 0LL;
  }
  char v7 = -[SASampleStore _parseKTraceFile:stackshotsOnly:warningsOut:errorOut:](self, (uint64_t)a3, 1, a4, v6);
  if (a5) {
    *a5 = v9;
  }

  return v7;
}

- (uint64_t)_parseKTraceFile:(int)a3 stackshotsOnly:(void *)a4 warningsOut:(void *)a5 errorOut:
{
  uint64_t v291 = *MEMORY[0x1895F89C0];
  id v148 = a4;
  if (!a1)
  {
LABEL_168:
    uint64_t v12 = 0LL;
    goto LABEL_129;
  }

  id context = (void *)MEMORY[0x186E47ACC]();
  if (-[SASampleStore(KPerf) _parseKTraceFile:stackshotsOnly:warningsOut:errorOut:]::onceToken != -1) {
    dispatch_once( &-[SASampleStore(KPerf) _parseKTraceFile:stackshotsOnly:warningsOut:errorOut:]::onceToken,  &__block_literal_global_156);
  }
  id v147 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v275 = 0LL;
  int v276 = &v275;
  uint64_t v277 = 0x3032000000LL;
  uint64_t v278 = __Block_byref_object_copy__1;
  uint64_t v279 = __Block_byref_object_dispose__1;
  id v280 = (id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:2];
  v273[0] = 0LL;
  v273[1] = v273;
  v273[2] = 0x3032000000LL;
  v273[3] = __Block_byref_object_copy__1;
  v273[4] = __Block_byref_object_dispose__1;
  id v274 = 0LL;
  uint64_t v269 = 0LL;
  unsigned int v270 = &v269;
  uint64_t v271 = 0x2020000000LL;
  char v272 = 0;
  uint64_t v265 = 0LL;
  uint64_t v266 = &v265;
  uint64_t v267 = 0x2020000000LL;
  char v268 = 0;
  uint64_t v261 = 0LL;
  BOOL v262 = &v261;
  uint64_t v263 = 0x2020000000LL;
  char v264 = 0;
  uint64_t v257 = 0LL;
  int v258 = &v257;
  uint64_t v259 = 0x2020000000LL;
  int v260 = -1;
  uint64_t v251 = 0LL;
  uint64_t v252 = &v251;
  uint64_t v253 = 0x3032000000LL;
  uint64_t v254 = __Block_byref_object_copy__1;
  int v255 = __Block_byref_object_dispose__1;
  id v256 = 0LL;
  uint64_t v8 = ktrace_session_create();
  if (!v8)
  {
    if (a5)
    {
      uint64_t v12 = 0LL;
      int v13 = *a5;
      *a5 = @"Unable to allocate ktrace_session";
      goto LABEL_127;
    }

- (BOOL)parseKTraceFile:(const char *)a3 warningsOut:(id)a4 errorOut:(id *)a5
{
  id v9 = 0LL;
  if (a5) {
    id v6 = &v9;
  }
  else {
    id v6 = 0LL;
  }
  char v7 = -[SASampleStore _parseKTraceFile:stackshotsOnly:warningsOut:errorOut:](self, (uint64_t)a3, 0, a4, v6);
  if (a5) {
    *a5 = v9;
  }

  return v7;
}

const char *__77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke()
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v0 = getenv("SA_PRINT_KPERF");
  if (v0 || (id v0 = getenv("SA_DEBUG_KPERF")) != 0LL)
  {
    if (strcmp(v0, "0"))
    {
      strcpy(__filename, "/var/tmp/SAKPerfLog.");
      time_t v9 = time(0LL);
      localtime_r(&v9, &v10);
      size_t v1 = strftime(&__filename[20], 0x3ECuLL, "%Y-%m-%d-%T", &v10);
      pid_t v2 = getpid();
      snprintf(&__filename[v1 + 20], 1004 - v1, ".%d.txt", v2);
      qword_18C4B13C0 = (uint64_t)fopen(__filename, "w");
      if (qword_18C4B13C0)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "Logging kperf parsing to %s\n", __filename);
        int v3 = *__error();
        _sa_logt();
        id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 136446210;
          uint64_t v12 = __filename;
          _os_log_impl(&dword_186C92000, v4, OS_LOG_TYPE_DEFAULT, "Logging kperf parsing to %{public}s", buf, 0xCu);
        }
      }

      else
      {
        int v3 = *__error();
        _sa_logt();
        id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          int v6 = *__error();
          char v7 = __error();
          uint64_t v8 = strerror(*v7);
          *(_DWORD *)__int128 buf = 136446722;
          uint64_t v12 = __filename;
          __int16 v13 = 1024;
          int v14 = v6;
          __int16 v15 = 2080;
          uint64_t v16 = v8;
          _os_log_error_impl(&dword_186C92000, v4, OS_LOG_TYPE_ERROR, "Unable to open %{public}s: %d %s", buf, 0x1Cu);
        }
      }

      *__error() = v3;
    }
  }

  uint64_t result = getenv("SA_LOG_KTSYM");
  if (result || (uint64_t result = getenv("SA_DEBUG_KTSYM")) != 0LL)
  {
    uint64_t result = (const char *)strcmp(result, "0");
    if ((_DWORD)result) {
      _MergedGlobals_4[0] = 1;
    }
  }

  return result;
}

uint64_t __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_169( uint64_t a1)
{
  uint64_t machine = ktrace_get_machine();
  if (machine)
  {
    uint64_t v3 = machine;
    uint64_t v4 = *(void *)(a1 + 32);
    int is_kernel_64_bit = ktrace_is_kernel_64_bit();
    -[SASampleStore _populateFromKtraceMachineInfo:is64bit:](v4, v3, is_kernel_64_bit);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_2( uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  uint64_t v2 = DictForChunkViaNSPropertyList();
  id v4 = (id)v2;
  if (v2)
  {
    +[SABinary addSymbolsFromTailspin:](&OBJC_CLASS___SABinary, "addSymbolsFromTailspin:", v2);
  }

  else
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3) {
      [v3 addObject:@"Unable to get dict for tailspin symbols chunk"];
    }
  }
}

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_3( void *a1)
{
  uint64_t v109 = *MEMORY[0x1895F89C0];
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  *(_BYTE *)(*(void *)(a1[7] + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  DictForChunkViaNSPropertyList();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:0x189F64F58];
    uint64_t v5 = *(void *)(a1[8] + 8LL);
    int v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    DictGetNumber(v3, @"IsShutdownTrace");
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v7;
    if (v7) {
      *(_BYTE *)(*(void *)(a1[9] + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = [v7 BOOLValue];
    }
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    DictGetDictOfClasses(v3, @"SystemAdvisoryLevels", v9, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      __int16 v13 = (void *)a1[4];
      if (v13) {
        objc_setProperty_atomic(v13, v11, v12, 504LL);
      }
    }

    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    DictGetDictOfClasses(v3, @"HomeVolumeSpace", v14, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      uint64_t v18 = (void *)a1[4];
      if (v18) {
        objc_setProperty_atomic(v18, v17, v16, 512LL);
      }
    }

    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    DictGetDictOfClasses(v3, @"NonDefaultFeatureFlags", v19, v20);
    int v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      qos_class_t v23 = (void *)a1[4];
      if (v23) {
        objc_setProperty_atomic(v23, v22, v21, 520LL);
      }
    }

    DictGetNumber(v3, @"IsRootInstalled");
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      char v25 = [v24 BOOLValue];
      uint64_t v26 = a1[4];
      if (v26) {
        *(_BYTE *)(v26 + 318) = v25;
      }
    }

    objc_opt_class();
    DictGetArrayOfClass(v3, @"InstalledRootNames");
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      uint64_t v29 = (void *)a1[4];
      if (v29)
      {
        objc_setProperty_atomic(v29, v27, v28, 552LL);
        uint64_t v29 = (void *)a1[4];
      }

      [v29 installedRootNames];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = [v30 count];

      if (v31)
      {
        uint64_t v32 = a1[4];
        if (v32) {
          *(_BYTE *)(v32 + 318) = 1;
        }
      }
    }

    DictGetNumber(v3, @"OSCryptexFileExtents");
    char v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      int v34 = [v33 intValue];
      uint64_t v35 = a1[4];
      if (v35) {
        *(void *)(v35 + 544) = v34;
      }
    }

    DictGetNumber(v3, @"IsAppleInternal");
    id v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      char v37 = [v36 BOOLValue];
      uint64_t v38 = a1[4];
      if (v38)
      {
        *(_BYTE *)(v38 + 319) = v37;
        uint64_t v39 = a1[4];
        if (v39) {
          *(_BYTE *)(v39 + 320) = 1;
        }
      }
    }

    DictGetNumber(v3, @"IsInternalCarryDevice");
    id v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      char v41 = [v40 BOOLValue];
      uint64_t v42 = a1[4];
      if (v42)
      {
        *(_BYTE *)(v42 + 321) = v41;
        uint64_t v43 = a1[4];
        if (v43) {
          *(_BYTE *)(v43 + 322) = 1;
        }
      }
    }

    DictGetString(v3, @"AutomatedDeviceGroup");
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      uint64_t v46 = (void *)a1[4];
      if (v46) {
        objc_setProperty_atomic(v46, v44, v45, 560LL);
      }
    }

    DictGetDict(v3, @"MostRecentLowPowerModeTransition");
    int v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      DictGetNumber(v47, @"LowPowerMode");
      uint64_t v104 = (void *)objc_claimAutoreleasedReturnValue();
      DictGetNumber(v47, @"PowerModeTransitionTimestamp");
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
      int v49 = v48;
      if (v104)
      {
        if (!v48 || ([v48 doubleValue], v50 == 0.0))
        {
          uint64_t v52 = 0LL;
        }

        else
        {
          [v49 doubleValue];
          +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:",  0LL,  0LL,  0.0,  0.0,  v51);
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
        }

        uint64_t v54 = (id *)a1[4];
        unsigned int v55 = -[SAPowerModeTransition initWithLowPowerMode:timestamp:]( (id *)[SAPowerModeTransition alloc],  [v104 BOOLValue],  v52);
        id v56 = -[SASampleStore addPowerModeTransition:](v54, v55);
      }

      else
      {
        int v57 = *__error();
        _sa_logt();
        id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          [0 debugDescription];
          uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue();
          [v49 debugDescription];
          *(_DWORD *)__int128 buf = 138412546;
          uint64_t v106 = v103;
          v108 = __int16 v107 = 2112;
          unint64_t v102 = (void *)v108;
          _os_log_error_impl( &dword_186C92000,  v58,  OS_LOG_TYPE_ERROR,  "Invalid power mode transition from tailspin. lowPowerModeNum:%@ transitionTimeNum:%@",  buf,  0x16u);
        }

        *__error() = v57;
      }
    }

    objc_opt_class();
    DictGetArrayOfClass(v3, @"KeyboardLanguages");
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v61 = v59;
    if (v59)
    {
      uint64_t v62 = (void *)a1[4];
      if (v62) {
        objc_setProperty_atomic(v62, v60, v59, 568LL);
      }
    }

    objc_opt_class();
    DictGetArrayOfClass(v3, @"PreferredLanguages");
    uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v65 = v63;
    if (v63)
    {
      qos_class_t v66 = (void *)a1[4];
      if (v66) {
        objc_setProperty_atomic(v66, v64, v63, 576LL);
      }
    }

    DictGetString(v3, @"CountryCode");
    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v69 = v67;
    if (v67)
    {
      uint64_t v70 = (void *)a1[4];
      if (v70) {
        objc_setProperty_atomic(v70, v68, v67, 584LL);
      }
    }

    DictGetNumber(v3, @"HardwareKeyboard");
    uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v72 = v71;
    if (v71)
    {
      char v73 = [v71 BOOLValue];
      uint64_t v74 = a1[4];
      if (v74)
      {
        *(_BYTE *)(v74 + 324) = v73;
        uint64_t v75 = a1[4];
        if (v75) {
          *(_BYTE *)(v75 + 323) = 1;
        }
      }
    }

    DictGetDict(v3, @"VnodeInfo");
    uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v77 = v76;
    if (!v76) {
      goto LABEL_81;
    }
    DictGetNumber(v76, @"NumVnodesAllocated");
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
    DictGetNumber(v77, @"NumVnodesFree");
    char v79 = (void *)objc_claimAutoreleasedReturnValue();
    DictGetNumber(v77, @"NumVnodesMax");
    unsigned int v80 = (void *)objc_claimAutoreleasedReturnValue();
    DictGetNumber(v77, @"VnodeDeallocLevel");
    BOOL v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v78 || !v79 || !v80) {
      goto LABEL_80;
    }
    uint64_t v82 = [v78 unsignedLongLongValue];
    uint64_t v83 = a1[4];
    if (v83) {
      *(void *)(v83 + 984) = v82;
    }
    uint64_t v84 = [v79 unsignedLongLongValue];
    uint64_t v85 = a1[4];
    if (v85) {
      *(void *)(v85 + 992) = v84;
    }
    uint64_t v86 = [v80 unsignedLongLongValue];
    uint64_t v87 = a1[4];
    if (v87) {
      *(void *)(v87 + 1000) = v86;
    }
    if (v81)
    {
      int v88 = [v81 unsignedIntValue];
      uint64_t v89 = a1[4];
      if (v88)
      {
        if (v89)
        {
          uint64_t v90 = 2LL * *(void *)(v89 + 1000);
LABEL_79:
          *(void *)(v89 + 1008) = v90;
          goto LABEL_80;
        }

        goto LABEL_80;
      }
    }

    else
    {
      uint64_t v89 = a1[4];
    }

    if (v89)
    {
      uint64_t v90 = *(void *)(v89 + 1000);
      goto LABEL_79;
    }

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_178( uint64_t a1)
{
  uint64_t v108 = *MEMORY[0x1895F89C0];
  DictForChunkViaNSPropertyList();
  id newValue = (id)objc_claimAutoreleasedReturnValue();
  if (!newValue)
  {
    int v32 = *__error();
    _sa_logt();
    char v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( &dword_186C92000,  v33,  OS_LOG_TYPE_ERROR,  "Unable to get dict for tailspin metadata chunk",  buf,  2u);
    }

    *__error() = v32;
    int v34 = *(void **)(a1 + 32);
    if (v34) {
      [v34 addObject:@"Unable to get dict for tailspin metadata chunk"];
    }
    goto LABEL_116;
  }

  objc_opt_class();
  DictGetArrayOfClass(newValue, @"experiments");
  unsigned int v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    __int128 v96 = 0u;
    __int128 v97 = 0u;
    id obj = v80;
    uint64_t v74 = [obj countByEnumeratingWithState:&v96 objects:v107 count:16];
    if (v74)
    {
      uint64_t v76 = *(void *)v97;
      do
      {
        for (uint64_t i = 0LL; i != v74; ++i)
        {
          if (*(void *)v97 != v76) {
            objc_enumerationMutation(obj);
          }
          size_t v1 = *(void **)(*((void *)&v96 + 1) + 8 * i);
          __int128 v92 = 0u;
          __int128 v93 = 0u;
          __int128 v94 = 0u;
          __int128 v95 = 0u;
          id v2 = v1;
          uint64_t v3 = [v2 countByEnumeratingWithState:&v92 objects:v106 count:16];
          if (v3)
          {
            uint64_t v4 = *(void *)v93;
            do
            {
              uint64_t v5 = 0LL;
              do
              {
                if (*(void *)v93 != v4) {
                  objc_enumerationMutation(v2);
                }
                int v6 = *(char **)(*((void *)&v92 + 1) + 8 * v5);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  [v2 objectForKeyedSubscript:v6];
                  id v7 = (id)objc_claimAutoreleasedReturnValue();
                  if ([v6 isEqualToString:@"namespace_ids"])
                  {
                    uint64_t v8 = objc_opt_class();
                    uint64_t v9 = objc_opt_class();
                    DictGetDictOfClasses(v2, @"namespace_ids", v8, v9);
                    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v8) = v10 == 0LL;

                    if ((_DWORD)v8)
                    {
                      int v35 = *__error();
                      _sa_logt();
                      id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_error_impl( &dword_186C92000,  v36,  OS_LOG_TYPE_ERROR,  "Bad type in trial experiments dict: namespaces value is invalid",  buf,  2u);
                      }

                      *__error() = v35;
                      uint64_t v38 = *(void **)(a1 + 32);
                      if (v38) {
                        [v38 addObject:@"Bad type in trial experiments dict: namespaces value is invalid"];
                      }
                      goto LABEL_114;
                    }
                  }

                  else if ([v6 isEqualToString:@"experiment_id"])
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      int v43 = *__error();
                      _sa_logt();
                      int v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                      {
                        ClassName = object_getClassName(v7);
                        *(_DWORD *)__int128 buf = 136315138;
                        uint64_t v103 = ClassName;
                        _os_log_error_impl( &dword_186C92000,  v44,  OS_LOG_TYPE_ERROR,  "Bad type in trial experiments dict: experiment is %s",  buf,  0xCu);
                      }

                      *__error() = v43;
                      uint64_t v46 = *(void **)(a1 + 32);
                      if (v46)
                      {
                        uint64_t v22 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Bad type in trial experiments dict: experiment is %s",  object_getClassName(v7));
                        [v46 addObject:v22];
                        goto LABEL_113;
                      }

                      goto LABEL_114;
                    }
                  }

                  else if ([v6 isEqualToString:@"deployment_id"])
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      int v52 = *__error();
                      _sa_logt();
                      uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v70 = object_getClassName(v7);
                        *(_DWORD *)__int128 buf = 136315138;
                        uint64_t v103 = v70;
                        _os_log_error_impl( &dword_186C92000,  v53,  OS_LOG_TYPE_ERROR,  "Bad type in trial experiments dict: deployment is %s",  buf,  0xCu);
                      }

                      *__error() = v52;
                      unsigned int v55 = *(void **)(a1 + 32);
                      if (v55)
                      {
                        uint64_t v22 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Bad type in trial experiments dict: deployment is %s",  object_getClassName(v7));
                        [v55 addObject:v22];
                        goto LABEL_113;
                      }

                      goto LABEL_114;
                    }
                  }

                  else if ([v6 isEqualToString:@"treatment_id"])
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      int v60 = *__error();
                      _sa_logt();
                      uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v72 = object_getClassName(v7);
                        *(_DWORD *)__int128 buf = 136315138;
                        uint64_t v103 = v72;
                        _os_log_error_impl( &dword_186C92000,  v61,  OS_LOG_TYPE_ERROR,  "Bad type in trial experiments dict: treatment is %s",  buf,  0xCu);
                      }

                      *__error() = v60;
                      uint64_t v63 = *(void **)(a1 + 32);
                      if (v63)
                      {
                        uint64_t v22 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Bad type in trial experiments dict: treatment is %s",  object_getClassName(v7));
                        [v63 addObject:v22];
                        goto LABEL_113;
                      }

                      goto LABEL_114;
                    }
                  }

                  else
                  {
                    int v13 = *__error();
                    _sa_logt();
                    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)__int128 buf = 138412290;
                      uint64_t v103 = v6;
                      _os_log_debug_impl( &dword_186C92000,  v14,  OS_LOG_TYPE_DEBUG,  "Unknown key in experiments dict %@, ignoring",  buf,  0xCu);
                    }

                    *__error() = v13;
                  }
                }

                else
                {
                  int v11 = *__error();
                  _sa_logt();
                  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v15 = object_getClassName(v6);
                    *(_DWORD *)__int128 buf = 138412546;
                    uint64_t v103 = v6;
                    __int16 v104 = 2080;
                    uint64_t v105 = v15;
                    _os_log_debug_impl( &dword_186C92000,  v12,  OS_LOG_TYPE_DEBUG,  "Unknown key in experiments dict %@ (%s), ignoring",  buf,  0x16u);
                  }

                  *__error() = v11;
                }

                ++v5;
              }

              while (v3 != v5);
              uint64_t v3 = [v2 countByEnumeratingWithState:&v92 objects:v106 count:16];
            }

            while (v3);
          }
        }

        uint64_t v74 = [obj countByEnumeratingWithState:&v96 objects:v107 count:16];
      }

      while (v74);
    }
  }

  objc_opt_class();
  DictGetArrayOfClass(newValue, @"rollouts");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  if (!obj)
  {
LABEL_74:
    uint64_t v31 = *(void **)(a1 + 40);
    if (v31) {
      objc_setProperty_atomic(v31, v16, newValue, 528LL);
    }
    goto LABEL_115;
  }

  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  id v2 = obj;
  uint64_t v75 = [v2 countByEnumeratingWithState:&v88 objects:v101 count:16];
  if (!v75) {
    goto LABEL_73;
  }
  uint64_t v77 = *(void *)v89;
LABEL_41:
  uint64_t v79 = 0LL;
LABEL_42:
  if (*(void *)v89 != v77) {
    objc_enumerationMutation(v2);
  }
  id v17 = *(void **)(*((void *)&v88 + 1) + 8 * v79);
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  id v7 = v17;
  uint64_t v18 = [v7 countByEnumeratingWithState:&v84 objects:v100 count:16];
  if (!v18) {
    goto LABEL_71;
  }
  uint64_t v19 = *(void *)v85;
LABEL_46:
  uint64_t v20 = 0LL;
  while (1)
  {
    if (*(void *)v85 != v19) {
      objc_enumerationMutation(v7);
    }
    int v21 = *(void **)(*((void *)&v84 + 1) + 8 * v20);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v26 = *__error();
      _sa_logt();
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v30 = object_getClassName(v21);
        *(_DWORD *)__int128 buf = 138412546;
        uint64_t v103 = (const char *)v21;
        __int16 v104 = 2080;
        uint64_t v105 = v30;
        _os_log_debug_impl( &dword_186C92000,  v27,  OS_LOG_TYPE_DEBUG,  "Unknown key in rollouts dict %@ (%s), ignoring",  buf,  0x16u);
      }

      *__error() = v26;
      goto LABEL_69;
    }

    [v7 objectForKeyedSubscript:v21];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v21 isEqualToString:@"factor_pack_ids"])
    {
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = objc_opt_class();
      DictGetDictOfClasses(v7, @"factor_pack_ids", v23, v24);
      char v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23) = v25 == 0LL;

      if ((_DWORD)v23)
      {
        int v39 = *__error();
        _sa_logt();
        id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_error_impl( &dword_186C92000,  v40,  OS_LOG_TYPE_ERROR,  "Bad type in trial rollouts dict: trial factor packs value is invalid",  buf,  2u);
        }

        *__error() = v39;
        uint64_t v42 = *(void **)(a1 + 32);
        if (v42) {
          [v42 addObject:@"Bad type in trial rollouts dict: trial factor packs value is invalid"];
        }
        goto LABEL_113;
      }

      goto LABEL_68;
    }

    if ([v21 isEqualToString:@"rollout_id"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v47 = *__error();
        _sa_logt();
        uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          uint64_t v69 = object_getClassName(v22);
          *(_DWORD *)__int128 buf = 136315138;
          uint64_t v103 = v69;
          _os_log_error_impl( &dword_186C92000,  v48,  OS_LOG_TYPE_ERROR,  "Bad type in trial rollouts dict: rollout is %s",  buf,  0xCu);
        }

        *__error() = v47;
        double v50 = *(void **)(a1 + 32);
        if (!v50) {
          goto LABEL_113;
        }
        double v51 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Bad type in trial rollouts dict: rollout is %s",  object_getClassName(v22));
        [v50 addObject:v51];
        goto LABEL_112;
      }

      goto LABEL_68;
    }

    if ([v21 isEqualToString:@"deployment_id"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v56 = *__error();
        _sa_logt();
        int v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          uint64_t v71 = object_getClassName(v22);
          *(_DWORD *)__int128 buf = 136315138;
          uint64_t v103 = v71;
          _os_log_error_impl( &dword_186C92000,  v57,  OS_LOG_TYPE_ERROR,  "Bad type in trial rollouts dict: deployment is %s",  buf,  0xCu);
        }

        *__error() = v56;
        uint64_t v59 = *(void **)(a1 + 32);
        if (!v59) {
          goto LABEL_113;
        }
        double v51 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Bad type in trial rollouts dict: deployment is %s",  object_getClassName(v22));
        [v59 addObject:v51];
LABEL_112:

        goto LABEL_113;
      }

      goto LABEL_68;
    }

    if (![v21 isEqualToString:@"ramp_id"])
    {
      int v28 = *__error();
      _sa_logt();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v103 = (const char *)v21;
        _os_log_debug_impl( &dword_186C92000,  v29,  OS_LOG_TYPE_DEBUG,  "Unknown key in experiments dict %@, ignoring",  buf,  0xCu);
      }

      *__error() = v28;
      goto LABEL_68;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
LABEL_68:

LABEL_69:
    if (v18 == ++v20)
    {
      uint64_t v18 = [v7 countByEnumeratingWithState:&v84 objects:v100 count:16];
      if (v18) {
        goto LABEL_46;
      }
LABEL_71:

      if (++v79 == v75)
      {
        uint64_t v75 = [v2 countByEnumeratingWithState:&v88 objects:v101 count:16];
        if (!v75)
        {
LABEL_73:

          goto LABEL_74;
        }

        goto LABEL_41;
      }

      goto LABEL_42;
    }
  }

  int v64 = *__error();
  _sa_logt();
  uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
  {
    char v73 = object_getClassName(v22);
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v103 = v73;
    _os_log_error_impl( &dword_186C92000,  v65,  OS_LOG_TYPE_ERROR,  "Bad type in trial rollouts dict: ramp is %s",  buf,  0xCu);
  }

  *__error() = v64;
  uint64_t v67 = *(void **)(a1 + 32);
  if (v67)
  {
    double v51 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Bad type in trial rollouts dict: ramp is %s",  object_getClassName(v22));
    [v67 addObject:v51];
    goto LABEL_112;
  }

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_196( uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  ktrace_chunk_size();
  uint64_t v2 = ktrace_chunk_copy_cfdata();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    [MEMORY[0x1896079E8] propertyListWithData:v2 options:0 format:0 error:0];
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:");
    }

    else
    {
      uint64_t v5 = *(void **)(a1 + 32);
      if (v5) {
        [v5 addObject:@"Unable to deserialize dictionary from tailspin process info chunk"];
      }
    }
  }

  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    if (v4) {
      [v4 addObject:@"Unable to get data for tailspin process info chunk"];
    }
  }

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_2_204( uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  if (!ktrace_config_create())
  {
    uint64_t v8 = *(void **)(a1 + 32);
    if (v8) {
      [v8 addObject:@"Unable to parse ktrace config chunk"];
    }
    return;
  }

  reasouint64_t n = (_BYTE *)ktrace_config_get_reason();
  if (reason && *reason)
  {
    SANSStringForCString(reason);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) setReason:v3];
  }

  id v45 = objc_alloc_init(MEMORY[0x189603FA8]);
  int pet_mode = ktrace_config_kperf_get_pet_mode();
  if (pet_mode)
  {
    if (pet_mode == 2)
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = ktrace_config_kperf_get_pet_timer_id();
      if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) & 0x80000000) != 0)
      {
        int v5 = *__error();
        _sa_logt();
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v46.receiver) = 0;
          _os_log_error_impl( &dword_186C92000,  v6,  OS_LOG_TYPE_ERROR,  "Unable to get lightweight PET timer, treating as non-PET",  (uint8_t *)&v46,  2u);
        }

        *__error() = v5;
        id v7 = *(void **)(a1 + 32);
        if (v7) {
          objc_msgSend(v7, "addObject:", @"Unable to get lightweight PET timer, treating ktrace data as non-PET");
        }
      }
    }

    else
    {
      int v12 = *__error();
      _sa_logt();
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v46.receiver) = 0;
        _os_log_error_impl( &dword_186C92000,  v13,  OS_LOG_TYPE_ERROR,  "Non-lightweight PET not supported, treating as non-PET",  (uint8_t *)&v46,  2u);
      }

      *__error() = v12;
    }
  }

  else
  {
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = [v9 dataSource];
    if (v9) {
      v9[44] = v10 | 8;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      *(void *)(v11 + 360) = 1LL;
    }
  }

  int timer_count = ktrace_config_kperf_get_timer_count();
  if (!timer_count) {
    goto LABEL_63;
  }
  uint64_t v16 = 0LL;
  unsigned int v17 = 0;
  *(void *)&__int128 v15 = 67109120LL;
  __int128 v44 = v15;
  do
  {
    unint64_t timer_period_ns = ktrace_config_kperf_get_timer_period_ns();
    if (!timer_period_ns)
    {
      int v28 = *__error();
      _sa_logt();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v46.receiver = (id)__PAIR64__(v17, v44);
        _os_log_error_impl( &dword_186C92000,  v29,  OS_LOG_TYPE_ERROR,  "KPerf timer %d has 0 period, ignoring",  (uint8_t *)&v46,  8u);
      }

      goto LABEL_37;
    }

    int timer_action_id = ktrace_config_kperf_get_timer_action_id();
    if (!timer_action_id)
    {
      int v28 = *__error();
      _sa_logt();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v46.receiver = (id)__PAIR64__(v17, v44);
        _os_log_error_impl( &dword_186C92000,  v29,  OS_LOG_TYPE_ERROR,  "KPerf timer %d  has no action, ignoring",  (uint8_t *)&v46,  8u);
      }

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_210( uint64_t a1)
{
  uint64_t v2 = ktrace_chunk_copy_cfdata();
  if (v2)
  {
    id v4 = (id)v2;
    +[SASharedCache addDSCSymData:](&OBJC_CLASS___SASharedCache, "addDSCSymData:", v2);
  }

  else
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3) {
      [v3 addObject:@"Unable to get data for dscsym chunk"];
    }
  }

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_2_215( void *a1)
{
  uint64_t v2 = ktrace_chunk_copy_cfdata();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    if (ktrace_chunk_tag() == 36864)
    {
      uint64_t v4 = SAGetStackshotDataFromTailspinStackshotChunk(v3);

      uint64_t v3 = (void *)v4;
    }

    if ([v3 length])
    {
      [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v3];
    }

    else
    {
      int v6 = *__error();
      _sa_logt();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_error_impl(&dword_186C92000, v7, OS_LOG_TYPE_ERROR, "0-length stackshot chunk", v8, 2u);
      }

      *__error() = v6;
    }
  }

  else
  {
    int v5 = (void *)a1[4];
    if (v5) {
      [v5 addObject:@"Unable to get data for stackshot chunk"];
    }
  }

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_220( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v2;
  if (v2)
  {
    -[SASampleStore addAddressTranslations:](*(void *)(a1 + 40), v2);
  }

  else
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3) {
      [v3 addObject:@"Unable to get data for address translation chunk"];
    }
  }
}

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_2_223( void *a1)
{
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  uint64_t v2 = DictForChunkViaNSUnarchiver();
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8LL) + 40LL))
  {
    int v5 = (void *)a1[4];
    if (v5) {
      [v5 addObject:@"Unable to get data for resampled stacks chunk"];
    }
  }

uint64_t __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_3_232( uint64_t a1)
{
  uint64_t result = ktrace_get_absolute_from_timestamp();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = result;
  return result;
}

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_4( uint64_t a1)
{
  uint64_t v124 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) dataStyle] == 1 || !objc_msgSend(*(id *)(a1 + 32), "dataStyle"))
  {
LABEL_28:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    return;
  }

  [*(id *)(a1 + 32) sampleTimestamps];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 count];

  if (!v3) {
    goto LABEL_28;
  }
LABEL_4:
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  __int128 v110 = 0u;
  __int128 v111 = 0u;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v110 objects:v123 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v111;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v111 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 32) addProcessInfoFromTailspin:*(void *)(*((void *)&v110 + 1) + 8 * i)];
      }

      uint64_t v5 = [v4 countByEnumeratingWithState:&v110 objects:v123 count:16];
    }

    while (v5);
  }

  uint64_t v8 = MEMORY[0x1895F87A8];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___SAFrameIterator);
    -[SAFrameIterator setBacktracer:](v9, "setBacktracer:", 3LL);
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    v108[0] = v8;
    v108[1] = 3221225472LL;
    v108[2] = __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_5;
    v108[3] = &unk_189F623F8;
    v108[4] = *(void *)(a1 + 32);
    uint64_t v11 = v9;
    uint64_t v109 = v11;
    [v10 enumerateKeysAndObjectsUsingBlock:v108];
  }

  if (!*(_BYTE *)(a1 + 104))
  {
    if ([*(id *)(a1 + 32) dataStyle] == 3 || objc_msgSend(*(id *)(a1 + 32), "dataStyle") == 4) {
      [*(id *)(a1 + 32) enumerateTasks:&__block_literal_global_235];
    }
    [*(id *)(a1 + 32) enumerateTasks:&__block_literal_global_237];
    unint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    if (v12 < [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count])
    {
      unint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
      unint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count];
      while (v13 < v14)
      {
        +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:",  0LL,  0LL,  0.0,  0.0,  0.0);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ([*(id *)(a1 + 32) dataStyle] != 3
          || ([*(id *)(a1 + 32) sampleTimestamps],
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(),
              BOOL v17 = [v16 count] == 0,
              v16,
              v17))
        {
          unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
        }

        else
        {
          [*(id *)(a1 + 32) sampleTimestamps];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = [v18 count];

          unint64_t v20 = v19 - 1;
        }

        uint64_t v21 = *(void *)(a1 + 32);
        [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectAtIndexedSubscript:v13];
        double v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SASampleStore _addKCDataStackshot:timestamp:sampleIndex:shouldSkipSampleOut:primaryDataIsKPerf:addStaticInfoOnly:]( v21,  v22,  v15,  v20,  0LL,  1u,  1);

        [*(id *)(a1 + 32) endTime];
        double v23 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v24 = v23 == 0LL;

        if (!v24)
        {
          [*(id *)(a1 + 32) endTime];
          char v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 guessMissingTimesBasedOnTimestamp:v25];
        }

        unint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count];
        ++v13;
      }
    }
  }

  +[SATimestamp timestampWithMachAbsTime:machContTime:wallTime:machTimebase:]( SATimestamp,  "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:",  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24),  0,  [*(id *)(a1 + 32) machTimebase],  0.0);
  int v26 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = *(void **)(a1 + 32);
  uint64_t v28 = *(void *)(a1 + 96);
  char v29 = *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL);
  id v78 = v26;
  if (v27)
  {
    uint64_t v30 = (void *)MEMORY[0x186E47ACC]();
    [v27 tasksByPid];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    v114[0] = v8;
    v114[1] = 3221225472LL;
    v114[2] = __116__SASampleStore_KPerf__addLoadInfoFromKTrace_lastKTraceEventTimestamp_checkForNewLoadInfosEvenWithExistingLoadInfo___block_invoke;
    v114[3] = &unk_189F62270;
    v114[4] = v27;
    id v32 = v78;
    char v117 = v29 ^ 1;
    id v115 = v32;
    uint64_t v116 = v28;
    [v31 enumerateKeysAndObjectsUsingBlock:v114];

    objc_autoreleasePoolPop(v30);
  }

  [*(id *)(a1 + 32) sharedCaches];
  char v33 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v34 = [v33 count] == 0;

  if (!v34)
  {
    [*(id *)(a1 + 32) tasksByPid];
    int v35 = (void *)objc_claimAutoreleasedReturnValue();
    v107[0] = v8;
    v107[1] = 3221225472LL;
    v107[2] = __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_5_240;
    v107[3] = &unk_189F624A8;
    v107[4] = *(void *)(a1 + 32);
    [v35 enumerateKeysAndObjectsUsingBlock:v107];
  }

  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  [*(id *)(a1 + 32) hidEvents];
  id v36 = (void *)objc_claimAutoreleasedReturnValue();
  id obj = v36;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v103 objects:v122 count:16];
  if (v37)
  {
    uint64_t v83 = *(void *)v104;
    do
    {
      uint64_t v85 = v37;
      for (uint64_t j = 0LL; j != v85; ++j)
      {
        if (*(void *)v104 != v83) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = *(void **)(*((void *)&v103 + 1) + 8 * j);
        __int128 v99 = 0u;
        __int128 v100 = 0u;
        __int128 v101 = 0u;
        __int128 v102 = 0u;
        [v39 steps];
        id v40 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v41 = [v40 countByEnumeratingWithState:&v99 objects:v121 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v100;
          do
          {
            for (uint64_t k = 0LL; k != v41; ++k)
            {
              if (*(void *)v100 != v42) {
                objc_enumerationMutation(v40);
              }
              __int128 v44 = *(_DWORD **)(*((void *)&v99 + 1) + 8 * k);
              if ([v44 pid] == -1 && objc_msgSend(v44, "tid"))
              {
                id v45 = *(void **)(a1 + 32);
                uint64_t v46 = [v44 tid];
                [v44 timestamp];
                uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
                -[SASampleStore taskWithPid:orTid:atTimestamp:](v45, 0xFFFFFFFFLL, v46, v47);
                uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();

                if (v48)
                {
                  int v49 = [v48 pid];
                  if (v44) {
                    v44[3] = v49;
                  }
                }
              }
            }

            uint64_t v41 = [v40 countByEnumeratingWithState:&v99 objects:v121 count:16];
          }

          while (v41);
        }
      }

      id v36 = obj;
      uint64_t v37 = [obj countByEnumeratingWithState:&v103 objects:v122 count:16];
    }

    while (v37);
  }

  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v50, 64LL, 1);
  }
  id v76 = Property;
  uint64_t v74 = [v76 countByEnumeratingWithState:&v95 objects:v120 count:16];
  if (v74)
  {
    uint64_t v75 = *(void *)v96;
    do
    {
      uint64_t v77 = 0LL;
      do
      {
        if (*(void *)v96 != v75) {
          objc_enumerationMutation(v76);
        }
        uint64_t v53 = *(void **)(*((void *)&v95 + 1) + 8 * v77);
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        __int128 v93 = 0u;
        __int128 v94 = 0u;
        if (v53) {
          id v54 = objc_getProperty(v53, v52, 8LL, 1);
        }
        else {
          id v54 = 0LL;
        }
        __int128 v86 = v53;
        id v79 = v54;
        uint64_t v55 = [v79 countByEnumeratingWithState:&v91 objects:v119 count:16];
        if (v55)
        {
          uint64_t v80 = *(void *)v92;
          do
          {
            id obja = (id)v55;
            for (uint64_t m = 0LL; m != obja; uint64_t m = (char *)m + 1)
            {
              if (*(void *)v92 != v80) {
                objc_enumerationMutation(v79);
              }
              int v57 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)m);
              __int128 v87 = 0u;
              __int128 v88 = 0u;
              __int128 v89 = 0u;
              __int128 v90 = 0u;
              __int128 v84 = v57;
              objc_msgSend(v57, "steps", v74);
              id v58 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v59 = [v58 countByEnumeratingWithState:&v87 objects:v118 count:16];
              if (v59)
              {
                uint64_t v60 = *(void *)v88;
                do
                {
                  for (uint64_t n = 0LL; n != v59; ++n)
                  {
                    if (*(void *)v88 != v60) {
                      objc_enumerationMutation(v58);
                    }
                    uint64_t v62 = *(_DWORD **)(*((void *)&v87 + 1) + 8 * n);
                    if ([v62 pid] == -1 && objc_msgSend(v62, "tid"))
                    {
                      uint64_t v63 = *(void **)(a1 + 32);
                      uint64_t v64 = [v62 tid];
                      [v62 timestamp];
                      uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SASampleStore taskWithPid:orTid:atTimestamp:](v63, 0xFFFFFFFFLL, v64, v65);
                      qos_class_t v66 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v66)
                      {
                        int v67 = [v66 pid];
                        if (v62) {
                          v62[3] = v67;
                        }
                      }
                    }
                  }

                  uint64_t v59 = [v58 countByEnumeratingWithState:&v87 objects:v118 count:16];
                }

                while (v59);
              }

              if (v86)
              {
                if (v86[4] == -1)
                {
                  [v84 steps];
                  uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
                  [v68 lastObject];
                  uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
                  BOOL v70 = [v69 pid] == -1;

                  if (!v70)
                  {
                    [v84 steps];
                    uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
                    [v71 lastObject];
                    uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
                    v86[4] = [v72 pid];
                  }
                }
              }
            }

            uint64_t v55 = [v79 countByEnumeratingWithState:&v91 objects:v119 count:16];
          }

          while (v55);
        }

        ++v77;
      }

      while (v77 != v74);
      uint64_t v73 = [v76 countByEnumeratingWithState:&v95 objects:v120 count:16];
      uint64_t v74 = v73;
    }

    while (v73);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_5( uint64_t a1,  void *a2,  void *a3)
{
  id v13 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SASampleStore lastTaskWithPid:](*(void **)(a1 + 32), [v13 intValue]);
      uint64_t v6 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      id v7 = v6;
      if (v6)
      {
        [v6 binaryLoadInfos];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 40) setUserBinaryLoadInfos:v8];

        [*(id *)(a1 + 40) setAssumeUserBinaryLoadInfosContainMainBinary:v7[73] & 1];
        [v7 sharedCache];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 40) setSharedCache:v9];

        uint64_t v10 = *(void *)(a1 + 32);
        if (v10) {
          uint64_t v11 = *(void *)(v10 + 192);
        }
        else {
          uint64_t v11 = 0LL;
        }
        objc_copyStruct(&dest, v7 + 288, 8LL, 1, 0);
        if (v11)
        {
          if (dest)
          {
            CSArchitectureGetFamily();
            CSArchitectureGetFamily();
            if ((CSArchitectureMatchesArchitecture() & 1) == 0)
            {
              -[SASampleStore addressTranslationsForPid:](*(void *)(a1 + 32), [v7 pid]);
              unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
              [*(id *)(a1 + 40) setAddressTranslations:v12];
            }
          }
        }

        v14[0] = MEMORY[0x1895F87A8];
        v14[1] = 3221225472LL;
        v14[2] = __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_6;
        v14[3] = &unk_189F623D0;
        __int128 v15 = v7;
        id v16 = *(id *)(a1 + 40);
        [v5 enumerateKeysAndObjectsUsingBlock:v14];
        [*(id *)(a1 + 40) clearTaskData];
      }
    }
  }
}

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_6( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [*(id *)(a1 + 32) threads];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 objectForKeyedSubscript:v5];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8) {
        id Property = objc_getProperty(v8, v9, 48LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id v11 = Property;

      if (!v11)
      {
        unint64_t v12 = calloc([v6 count], 8uLL);
        for (unint64_t i = 0; i < [v6 count]; ++i)
        {
          [v6 objectAtIndexedSubscript:i];
          unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            free(v12);

            goto LABEL_18;
          }

          *((void *)v12 + i) = [v14 unsignedLongLongValue];
        }

        [*(id *)(a1 + 40) setUserFrames:v12];
        objc_msgSend(*(id *)(a1 + 40), "setNumUserFrames:", objc_msgSend(v6, "count"));
        -[SATask leafFrameAfterAddingStack:leafOfCRootFramesReplacedBySwiftAsync:]( *(void *)(a1 + 32),  *(void **)(a1 + 40),  0LL);
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          if (v8) {
            objc_setProperty_atomic(v8, v15, v16, 48LL);
          }
        }

        else
        {
          int v17 = *__error();
          _sa_logt();
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            id v23 = [*(id *)(a1 + 32) debugDescription];
            uint64_t v19 = [v23 UTF8String];
            id v20 = [v8 debugDescription];
            uint64_t v21 = [v20 UTF8String];
            unsigned int v22 = [*(id *)(a1 + 40) numUserFrames];
            *(_DWORD *)__int128 buf = 136315650;
            uint64_t v25 = v19;
            __int16 v26 = 2080;
            uint64_t v27 = v21;
            __int16 v28 = 2048;
            uint64_t v29 = v22;
            _os_log_error_impl( &dword_186C92000,  v18,  OS_LOG_TYPE_ERROR,  "%s %s unable to add resampled stack with %lu frames",  buf,  0x20u);
          }

          *__error() = v17;
        }

        [*(id *)(a1 + 40) clearThreadData];
      }

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_234( uint64_t a1,  uint64_t a2)
{
}

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_2_236( uint64_t a1,  void *a2)
{
  id v2 = a2;
  [v2 threads];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_3_238;
  v5[3] = &unk_189F62070;
  id v4 = v2;
  id v6 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
}

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_3_238( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  if ([*(id *)(a1 + 32) pid])
  {
    v8[0] = 0LL;
    v8[1] = v8;
    v8[2] = 0x3032000000LL;
    v8[3] = __Block_byref_object_copy__1;
    v8[4] = __Block_byref_object_dispose__1;
    id v9 = 0LL;
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_4_239;
    v5[3] = &unk_189F62480;
    id v7 = v8;
    id v6 = *(id *)(a1 + 32);
    [v4 enumerateThreadStatesBetweenStartTime:0 startSampleIndex:0x7FFFFFFFFFFFFFFFLL endTime:0 endSampleIndex:0x7FFFFFFFFFFFFFFFLL reverseOrder:1 block:v5];

    _Block_object_dispose(v8, 8);
  }
}

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_4_239( uint64_t a1,  void *a2)
{
  self = a2;
  [self leafUserFrame];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (!v5)
    {
      uint64_t v6 = -[SATask truncatedUserStackFrameSwiftAsync:](*(SAFrame **)(a1 + 32), 0);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    }

    if (self) {
      objc_setProperty_atomic(self, v4, v5, 64LL);
    }
  }
}

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_5_240( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v75 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v49 = a3;
  double v50 = v4;
  if ([v4 intValue] && objc_msgSend(v4, "intValue") != -1)
  {
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    [v49 reverseObjectEnumerator];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = 0LL;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v63 objects:v74 count:16];
    if (!v7) {
      goto LABEL_50;
    }
    char v55 = 0;
    uint64_t v8 = *(void *)v64;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v64 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(_BYTE **)(*((void *)&v63 + 1) + 8 * i);
        if (!v10 || (v10[72] & 1) == 0)
        {
          [*(id *)(*((void *)&v63 + 1) + 8 * i) sharedCache];
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v12 = v11 == 0LL;

          if (v12)
          {
            if (v6)
            {
              int v14 = *__error();
              _sa_logt();
              __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                [v10 debugDescription];
                double v51 = (void *)objc_claimAutoreleasedReturnValue();
                [v6 uuid];
                int v17 = (void *)objc_claimAutoreleasedReturnValue();
                [v17 UUIDString];
                uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v19 = [v6 slide];
                *(_DWORD *)__int128 buf = 138412802;
                uint64_t v69 = v51;
                __int16 v70 = 2112;
                uint64_t v71 = v18;
                __int16 v72 = 2048;
                uint64_t v73 = v19;
                _os_log_debug_impl( &dword_186C92000,  v15,  OS_LOG_TYPE_DEBUG,  "%@: guessing shared cache based on later tasks with the same pid: UUID:%@ slide=0x%0llX",  buf,  0x20u);
              }

              *__error() = v14;
              if (v10) {
                objc_setProperty_atomic(v10, v16, v6, 256LL);
              }
            }

            else
            {
              char v55 = 1;
            }
          }

          else
          {
            uint64_t v13 = [v10 sharedCache];

            uint64_t v6 = (void *)v13;
          }
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v63 objects:v74 count:16];
    }

    while (v7);

    if ((v55 & 1) != 0)
    {
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id v5 = v49;
      uint64_t v20 = [v5 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (!v20) {
        goto LABEL_50;
      }
      uint64_t v21 = *(void *)v60;
      while (1)
      {
        for (uint64_t j = 0LL; j != v20; ++j)
        {
          if (*(void *)v60 != v21) {
            objc_enumerationMutation(v5);
          }
          id v23 = *(_BYTE **)(*((void *)&v59 + 1) + 8 * j);
          if (!v23 || (v23[72] & 1) == 0)
          {
            [*(id *)(*((void *)&v59 + 1) + 8 * j) sharedCache];
            BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v25 = v24 == 0LL;

            if (v25)
            {
              if (!v6)
              {
                id Property = *(id *)(a1 + 32);
                if (Property) {
                  id Property = objc_getProperty(Property, v26, 1024LL, 1);
                }
                id v31 = Property;
                BOOL v32 = v31 == 0LL;

                id v34 = *(id *)(a1 + 32);
                if (v32)
                {
                  [v34 sharedCaches];
                  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
                  [v39 firstObject];
                  id v35 = (id)objc_claimAutoreleasedReturnValue();

                  int v40 = *__error();
                  _sa_logt();
                  uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                  {
                    [v23 debugDescription];
                    id v58 = (void *)objc_claimAutoreleasedReturnValue();
                    [v35 uuid];
                    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
                    [v53 UUIDString];
                    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v48 = [v35 slide];
                    *(_DWORD *)__int128 buf = 138412802;
                    uint64_t v69 = v58;
                    __int16 v70 = 2112;
                    uint64_t v71 = v47;
                    __int16 v72 = 2048;
                    uint64_t v73 = v48;
                    _os_log_debug_impl( &dword_186C92000,  v41,  OS_LOG_TYPE_DEBUG,  "%@: guessing first shared cache: UUID:%@ slide=0x%0llX",  buf,  0x20u);
                  }

                  *__error() = v40;
                  if (v23) {
LABEL_46:
                  }
                    objc_setProperty_atomic(v23, v38, v35, 256LL);
                }

                else
                {
                  if (v34) {
                    id v34 = objc_getProperty(v34, v33, 1024LL, 1);
                  }
                  id v35 = v34;
                  int v36 = *__error();
                  _sa_logt();
                  uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                  {
                    [v23 debugDescription];
                    int v57 = (void *)objc_claimAutoreleasedReturnValue();
                    [v35 uuid];
                    int v52 = (void *)objc_claimAutoreleasedReturnValue();
                    [v52 UUIDString];
                    id v45 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v46 = [v35 slide];
                    *(_DWORD *)__int128 buf = 138412802;
                    uint64_t v69 = v57;
                    __int16 v70 = 2112;
                    uint64_t v71 = v45;
                    __int16 v72 = 2048;
                    uint64_t v73 = v46;
                    _os_log_debug_impl( &dword_186C92000,  v37,  OS_LOG_TYPE_DEBUG,  "%@: guessing native shared cache: UUID:%@ slide=0x%0llX",  buf,  0x20u);
                  }

                  *__error() = v36;
                  if (v23) {
                    goto LABEL_46;
                  }
                }

                continue;
              }

              int v27 = *__error();
              _sa_logt();
              __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                [v23 debugDescription];
                int v56 = (void *)objc_claimAutoreleasedReturnValue();
                [v6 uuid];
                uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
                [v42 UUIDString];
                int v43 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v44 = [v6 slide];
                *(_DWORD *)__int128 buf = 138412802;
                uint64_t v69 = v56;
                __int16 v70 = 2112;
                uint64_t v71 = v43;
                __int16 v72 = 2048;
                uint64_t v73 = v44;
                _os_log_debug_impl( &dword_186C92000,  v28,  OS_LOG_TYPE_DEBUG,  "%@: guessing shared cache based on earlier tasks with the same pid: UUID:%@ slide=0x%0llX",  buf,  0x20u);
              }

              *__error() = v27;
              if (v23) {
                objc_setProperty_atomic(v23, v29, v6, 256LL);
              }
            }
          }
        }

        uint64_t v20 = [v5 countByEnumeratingWithState:&v59 objects:v67 count:16];
        if (!v20)
        {
LABEL_50:

          break;
        }
      }
    }
  }
}

void __77__SASampleStore_KPerf___parseKTraceFile_stackshotsOnly_warningsOut_errorOut___block_invoke_241( uint64_t a1)
{
  if ((unint64_t)ktrace_get_absolute_from_timestamp() >= *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL)
                                                                           + 24LL))
  {
    +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:",  0LL,  0LL,  0.0,  0.0,  0.0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [*(id *)(a1 + 32) dataStyle];
    if (v2 == 3)
    {
      [*(id *)(a1 + 32) sampleTimestamps];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v3 = [v4 count];
    }

    else
    {
      unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
    }

    uint64_t v5 = *(void *)(a1 + 32);
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = -[SASampleStore _addKCDataStackshot:timestamp:sampleIndex:shouldSkipSampleOut:primaryDataIsKPerf:addStaticInfoOnly:]( v5,  v6,  v13,  v3,  0LL,  1u,  v2 != 3);

    [*(id *)(a1 + 32) endTime];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [*(id *)(a1 + 32) endTime];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 guessMissingTimesBasedOnTimestamp:v9];
    }

    if (v2 == 3)
    {
      if (v7)
      {
        uint64_t v10 = *(void *)(a1 + 32);
        if (v10) {
          [*(id *)(v10 + 24) addObject:v13];
        }
      }
    }

    unint64_t v11 = ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    if (v11 >= [*(id *)(a1 + 40) count])
    {
      if (*(_BYTE *)(a1 + 80)) {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = -1LL;
      }
      else {
        ktrace_end();
      }
    }

    else
    {
      [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = [v12 unsignedLongLongValue];
    }
  }

- (void)forwardFillFromLastStackshot:(void *)a1
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if ([a1 dataSource] != 2)
  {
    int v20 = *__error();
    _sa_logt();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 134217984;
      uint64_t v36 = [a1 dataSource];
      _os_log_error_impl(&dword_186C92000, v21, OS_LOG_TYPE_ERROR, "data source 0x%llx", buf, 0xCu);
    }

    *__error() = v20;
    char v22 = [a1 dataSource];
    _SASetCrashLogMessage(3686, "data source 0x%llx", v23, v24, v25, v26, v27, v28, v22);
    _os_crash();
    __break(1u);
  }

  [a1 sampleTimestamps];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [a1 sampleTimestamps];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 count];

    [a1 sampleTimestamps];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 lastObject];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v9 machAbsTime] <= a2)
    {
LABEL_14:

      return;
    }

    +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:",  a2,  0LL,  0.0,  0.0,  0.0);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [a1 indexOfLastSampleOnOrBeforeTimestamp:v10];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v12 = *__error();
      _sa_logt();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( &dword_186C92000,  v13,  OS_LOG_TYPE_DEFAULT,  "WARNING: Cannot forward-fill from last stackshot because there was no KPerf sample before the stackshot",  buf,  2u);
      }

      *__error() = v12;
      goto LABEL_13;
    }

    [a1 sampleTimestamps];
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 objectAtIndexedSubscript:v11];
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if ([v15 machAbsTime] == a2)
    {
      if (!v11)
      {
        int v18 = *__error();
        _sa_logt();
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( &dword_186C92000,  v19,  OS_LOG_TYPE_DEFAULT,  "WARNING: Cannot forward-fill from last stackshot because there was no KPerf sample before the stackshot",  buf,  2u);
        }

        *__error() = v18;
        goto LABEL_12;
      }

      [a1 sampleTimestamps];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 objectAtIndexedSubscript:v11 - 1];

      id v15 = (id)v17;
    }

    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = __53__SASampleStore_KPerf__forwardFillFromLastStackshot___block_invoke;
    v29[3] = &unk_189F62588;
    unint64_t v33 = a2;
    id v30 = v9;
    id v31 = a1;
    uint64_t v34 = v7 - 1;
    id v15 = v15;
    id v32 = v15;
    [a1 enumerateTasks:v29];

LABEL_12:
LABEL_13:

    goto LABEL_14;
  }

void __53__SASampleStore_KPerf__forwardFillFromLastStackshot___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v26 = a2;
  [v26 exitTimestamp];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  if ((unint64_t)[v3 machAbsTime] <= *(void *)(a1 + 56))
  {
    id v5 = 0LL;
    goto LABEL_15;
  }

  id v5 = v4;
  unint64_t v6 = [*(id *)(a1 + 40) indexOfLastSampleOnOrBeforeTimestamp:v5];
  unint64_t v7 = v6;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_15;
  }
  if (v6 > *(void *)(a1 + 64))
  {
    int v8 = *__error();
    _sa_logt();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 64);
      *(_DWORD *)__int128 buf = 134218240;
      unint64_t v36 = v7;
      __int16 v37 = 2048;
      uint64_t v38 = v10;
      _os_log_error_impl(&dword_186C92000, v9, OS_LOG_TYPE_ERROR, "%lu < %lu", buf, 0x16u);
    }

    *__error() = v8;
    _SASetCrashLogMessage(3736, "%lu < %lu", v11, v12, v13, v14, v15, v16, v7);
    _os_crash();
    __break(1u);
LABEL_9:
    unint64_t v7 = *(void *)(a1 + 64);
    id v5 = *(id *)(a1 + 32);
  }

  [v26 taskStates];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 lastObject];
  int v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    [v18 startTimestamp];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    int v20 = [v19 lt:*(void *)(a1 + 48)];

    if (v20)
    {
      v18[7] = v7;
      objc_setProperty_atomic(v18, v21, v5, 40LL);
    }
  }

  [v26 threads];
  char v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __53__SASampleStore_KPerf__forwardFillFromLastStackshot___block_invoke_266;
  v27[3] = &unk_189F62560;
  uint64_t v32 = *(void *)(a1 + 56);
  id v23 = v5;
  uint64_t v24 = *(void *)(a1 + 40);
  uint64_t v25 = *(void **)(a1 + 48);
  id v28 = v23;
  uint64_t v29 = v24;
  uint64_t v33 = *(void *)(a1 + 64);
  unint64_t v34 = v7;
  id v30 = v25;
  id v31 = v26;
  [v22 enumerateKeysAndObjectsUsingBlock:v27];

  id v5 = v23;
LABEL_15:
}

void __53__SASampleStore_KPerf__forwardFillFromLastStackshot___block_invoke_266( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v114 = *MEMORY[0x1895F89C0];
  id v107 = a2;
  id v5 = a3;
  [v5 exitTimestamp];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  if ((unint64_t)[v6 machAbsTime] <= *(void *)(a1 + 64))
  {
    id v8 = 0LL;
    goto LABEL_20;
  }

  id v8 = v7;
  unint64_t v9 = [*(id *)(a1 + 40) indexOfLastSampleOnOrBeforeTimestamp:v8];
  unint64_t v10 = v9;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9 <= *(void *)(a1 + 72) && v9 <= *(void *)(a1 + 80))
    {
LABEL_11:
      [v5 threadStates];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 lastObject];
      char v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22
        && ([v22 startTimestamp],
            id v23 = (void *)objc_claimAutoreleasedReturnValue(),
            int v24 = [v23 lt:*(void *)(a1 + 48)],
            v23,
            v24))
      {
        -[SAThreadState setEndSampleIndex:]((uint64_t)v22, v10);
        objc_setProperty_atomic(v22, v25, v8, 56LL);
      }

      else
      {
        [v5 threadStates];
        id v26 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)[v26 count] >= 2)
        {
          [v22 leafUserFrame];
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v27)
          {
            int v28 = [*(id *)(a1 + 56) pid];

            if (v28)
            {
              unint64_t v29 = [v22 cpuTimeNs];
              if (v29)
              {
                [v5 threadStates];
                id v30 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v31 = [v30 count];

                while (1)
                {
                  unint64_t v32 = v31 - 1;
                  if (v31 == 1) {
                    break;
                  }
                  [v5 threadStates];
                  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v34 = v31 - 2;
                  [v33 objectAtIndexedSubscript:v34];
                  id v35 = (void *)objc_claimAutoreleasedReturnValue();
                  unint64_t v36 = [v35 cpuTimeNs];

                  if (v36 < v29) {
                    break;
                  }
                  [v5 threadStates];
                  __int16 v37 = (void *)objc_claimAutoreleasedReturnValue();
                  [v37 objectAtIndexedSubscript:v34];
                  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
                  [v38 leafUserFrame];
                  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();

                  uint64_t v31 = v32;
                  if (v39)
                  {
                    if (v32 == 0x8000000000000000LL) {
                      goto LABEL_18;
                    }
                    [v5 threadStates];
                    int v40 = (void *)objc_claimAutoreleasedReturnValue();
                    [v40 objectAtIndexedSubscript:v32 - 1];
                    id v26 = (void *)objc_claimAutoreleasedReturnValue();

                    [v26 leafUserFrame];
                    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
                    [v26 leafOfCRootFramesReplacedBySwiftAsync];
                    id newValue = (id)objc_claimAutoreleasedReturnValue();
                    [v26 dispatchQueue];
                    id obj = (id)objc_claimAutoreleasedReturnValue();
                    [v26 swiftTask];
                    id v105 = (id)objc_claimAutoreleasedReturnValue();
                    while (1)
                    {
                      [v5 threadStates];
                      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
                      unint64_t v42 = [v41 count];

                      if (v32 >= v42) {
                        break;
                      }
                      [v5 threadStates];
                      int v43 = (void *)objc_claimAutoreleasedReturnValue();
                      [v43 objectAtIndexedSubscript:v32];
                      uint64_t v44 = (id *)objc_claimAutoreleasedReturnValue();

                      [v44 leafUserFrame];
                      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v46)
                      {
                        [v44 leafUserFrame];
                        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v47 != v27)
                        {
                          int v92 = *__error();
                          _sa_logt();
                          uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                          {
                            [v44 leafUserFrame];
                            __int128 v95 = (void *)objc_claimAutoreleasedReturnValue();
                            id v54 = [v95 debugDescription];
                            uint64_t v98 = [v54 UTF8String];
                            id v55 = [v27 debugDescription];
                            uint64_t v56 = [v55 UTF8String];
                            *(_DWORD *)__int128 buf = 136315394;
                            unint64_t v109 = v98;
                            __int16 v110 = 2080;
                            uint64_t v111 = v56;
                            _os_log_error_impl( &dword_186C92000,  v53,  OS_LOG_TYPE_ERROR,  "threadState.leafUserFrame %s != leafUserFrame %s",  buf,  0x16u);
                          }

                          *__error() = v92;
                          [v44 leafUserFrame];
                          int v57 = (void *)objc_claimAutoreleasedReturnValue();
                          id v58 = [v57 debugDescription];
                          char v99 = [v58 UTF8String];
                          id v59 = [v27 debugDescription];
                          [v59 UTF8String];
                          _SASetCrashLogMessage( 3821,  "threadState.leafUserFrame %s != leafUserFrame %s",  v60,  v61,  v62,  v63,  v64,  v65,  v99);

                          _os_crash();
                          __break(1u);
LABEL_47:
                          int v93 = *__error();
                          _sa_logt();
                          __int128 v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                          {
                            [v44 dispatchQueue];
                            __int128 v96 = (void *)objc_claimAutoreleasedReturnValue();
                            id v67 = [v96 debugDescription];
                            uint64_t v100 = [v67 UTF8String];
                            id v68 = [obj debugDescription];
                            uint64_t v69 = [v68 UTF8String];
                            *(_DWORD *)__int128 buf = 136315394;
                            unint64_t v109 = v100;
                            __int16 v110 = 2080;
                            uint64_t v111 = v69;
                            _os_log_error_impl( &dword_186C92000,  v66,  OS_LOG_TYPE_ERROR,  "threadState.dispatchQueue %s != dispatchQueue %s",  buf,  0x16u);
                          }

                          *__error() = v93;
                          [v44 dispatchQueue];
                          __int16 v70 = (void *)objc_claimAutoreleasedReturnValue();
                          id v71 = [v70 debugDescription];
                          char v101 = [v71 UTF8String];
                          id v72 = [obj debugDescription];
                          [v72 UTF8String];
                          _SASetCrashLogMessage( 3824,  "threadState.dispatchQueue %s != dispatchQueue %s",  v73,  v74,  v75,  v76,  v77,  v78,  v101);

                          _os_crash();
                          __break(1u);
LABEL_50:
                          int v94 = *__error();
                          _sa_logt();
                          id v79 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                          {
                            [v44 swiftTask];
                            __int128 v97 = (void *)objc_claimAutoreleasedReturnValue();
                            id v80 = [v97 debugDescription];
                            uint64_t v102 = [v80 UTF8String];
                            id v81 = [v105 debugDescription];
                            uint64_t v82 = [v81 UTF8String];
                            *(_DWORD *)__int128 buf = 136315394;
                            unint64_t v109 = v102;
                            __int16 v110 = 2080;
                            uint64_t v111 = v82;
                            _os_log_error_impl( &dword_186C92000,  v79,  OS_LOG_TYPE_ERROR,  "threadState.swiftTask %s != swiftTask %s",  buf,  0x16u);
                          }

                          *__error() = v94;
                          [v44 swiftTask];
                          uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
                          id v84 = [v83 debugDescription];
                          char v103 = [v84 UTF8String];
                          id v85 = [v105 debugDescription];
                          [v85 UTF8String];
                          _SASetCrashLogMessage( 3826,  "threadState.swiftTask %s != swiftTask %s",  v86,  v87,  v88,  v89,  v90,  v91,  v103);

                          _os_crash();
                          __break(1u);
                        }
                      }

                      if (v44)
                      {
                        objc_setProperty_atomic(v44, v45, v27, 64LL);
                        objc_setProperty_atomic(v44, v48, newValue, 72LL);
                      }

                      [v44 dispatchQueue];
                      id v49 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v49)
                      {
                        [v44 dispatchQueue];
                        id v50 = (id)objc_claimAutoreleasedReturnValue();

                        if (v50 != obj) {
                          goto LABEL_47;
                        }
                      }

                      if (v44) {
                        objc_storeWeak(v44 + 14, obj);
                      }
                      [v44 swiftTask];
                      double v51 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v51)
                      {
                        [v44 swiftTask];
                        id v52 = (id)objc_claimAutoreleasedReturnValue();

                        if (v52 != v105) {
                          goto LABEL_50;
                        }
                      }

                      if (v44) {
                        objc_storeWeak(v44 + 15, v105);
                      }

                      ++v32;
                    }

                    goto LABEL_16;
                  }
                }
              }
            }

            goto LABEL_18;
          }

void __616__SASampleStore_KPerfPrivate__backfillThread_inTask_lastSampleIndex_timestamp_haveName_name_haveDispatchQueueId_dispatchQueueId_dispatchQueueLabel_leafKernelFrame_hasExclaveInKernelStack_haveUserStack_leafUserFrame_swiftTaskId_leafOfCRootFramesReplacedBySwiftAsync_threadExclavesInfo_haveSched_systemCpuTimeNs_userCpuTimeNs_basePriority_scheduledPriority_state_threadQos_threadRequestedQos_threadRequestedQosOverride_threadQosPromote_haveCycIns_instructions_cycles_haveSnap_ioTier_isIOPassive_isDarwinBG_isSuspended_isGlobalForcedIdle_isIdleWorkQueue_lastMadeRunnableTime_isOnCore_isOnCoreForLastSampleIndex_cpuNum___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v136 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v7 = v136;
    uint64_t v8 = (uint64_t)v7;
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 128) + 8LL) + 24LL))
    {
      if ([v7 filledName])
      {
        if (*(int *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL) >= 1 && qword_18C4B13C0 != 0)
        {
          int v10 = *__error();
          int v11 = (FILE *)qword_18C4B13C0;
          uint64_t v12 = [*(id *)(a1 + 32) machAbsTime];
          uint64_t v13 = [*(id *)(a1 + 40) threadId];
          id v14 = [(id)v8 name];
          uint64_t v15 = [v14 UTF8String];
          uint64_t v16 = "no name";
          if (v15) {
            uint64_t v16 = (const char *)v15;
          }
          fprintf( v11,  "%'llu Thread 0x%llx thread name %s backfilled to %d thread states (indexes %lu-%lu)\n",  v12,  v13,  v16,  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL),  a3 + 1,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL) + a3);

          *__error() = v10;
        }

        char v17 = 0;
        *(_BYTE *)(*(void *)(*(void *)(a1 + 128) + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
      }

      else
      {
        [(id)v8 setFilledName:1];
        if (v8) {
          objc_setProperty_atomic_copy((id)v8, v20, *(id *)(a1 + 48), 104LL);
        }
        char v17 = 1;
        if (!a3 && qword_18C4B13C0)
        {
          int v21 = *__error();
          char v22 = (FILE *)qword_18C4B13C0;
          uint64_t v23 = [*(id *)(a1 + 32) machAbsTime];
          uint64_t v24 = [*(id *)(a1 + 40) threadId];
          id v25 = [(id)v8 name];
          uint64_t v26 = [v25 UTF8String];
          uint64_t v27 = "no name";
          if (v26) {
            uint64_t v27 = (const char *)v26;
          }
          fprintf( v22,  "%'llu Thread 0x%llx thread name %s backfilled to all (%d) thread states (indexes %lu-%lu)\n",  v23,  v24,  v27,  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL) + 1,  0LL,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL));

          *__error() = v21;
          char v17 = 1;
        }
      }
    }

    else
    {
      char v17 = 0;
    }

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 144) + 8LL) + 24LL))
    {
      if ([(id)v8 filledDispatchQueue])
      {
        if (*(int *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL) >= 1 && qword_18C4B13C0 != 0)
        {
          int v29 = *__error();
          id v30 = (FILE *)qword_18C4B13C0;
          uint64_t v31 = [*(id *)(a1 + 32) machAbsTime];
          uint64_t v32 = [*(id *)(a1 + 40) threadId];
          uint64_t v33 = *(void **)(a1 + 56);
          if (v33) {
            uint64_t v33 = (void *)[v33 identifier];
          }
          fprintf( v30,  "%'llu Thread 0x%llx dispatch queue %lld backfilled to %d thread states (indexes %lu-%lu)\n",  v31,  v32,  v33,  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL),  a3 + 1,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL) + a3);
          *__error() = v29;
        }

        *(_BYTE *)(*(void *)(*(void *)(a1 + 144) + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
      }

      else
      {
        [(id)v8 setFilledDispatchQueue:1];
        uint64_t v34 = *(void **)(a1 + 56);
        if (v8)
        {
          objc_storeWeak((id *)(v8 + 112), v34);
          uint64_t v34 = *(void **)(a1 + 56);
        }

        if (v34)
        {
          +[SARecipeState stateWithThread:threadStateIndex:]( (uint64_t)&OBJC_CLASS___SADispatchQueueState,  *(void **)(a1 + 40),  a3);
          id v35 = (void *)objc_claimAutoreleasedReturnValue();
          [*(id *)(a1 + 64) insertObject:v35 atIndex:0];
        }

        char v17 = 1;
        if (!a3 && qword_18C4B13C0)
        {
          int v36 = *__error();
          __int16 v37 = (FILE *)qword_18C4B13C0;
          uint64_t v38 = [*(id *)(a1 + 32) machAbsTime];
          uint64_t v39 = [*(id *)(a1 + 40) threadId];
          int v40 = *(void **)(a1 + 56);
          if (v40) {
            int v40 = (void *)[v40 identifier];
          }
          fprintf( v37,  "%'llu Thread 0x%llx dispatch queue %lld backfilled to all (%d) thread states (indexes %lu-%lu)\n",  v38,  v39,  v40,  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL) + 1,  0LL,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL));
          *__error() = v36;
        }
      }
    }

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 152) + 8LL) + 24LL))
    {
      if ([(id)v8 filledUserStack])
      {
        if (*(int *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL) >= 1 && qword_18C4B13C0 != 0)
        {
          int v42 = *__error();
          fprintf( (FILE *)qword_18C4B13C0,  "%'llu Thread 0x%llx user stack (leaf frame 0x%llx, swift async leaf 0x%llx) backfilled to %d thread states(indexes %lu-%lu)\n",  [*(id *)(a1 + 32) machAbsTime],  objc_msgSend(*(id *)(a1 + 40), "threadId"),  objc_msgSend(*(id *)(a1 + 72), "address"),  objc_msgSend(*(id *)(a1 + 80), "address"),  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8) + 24),  a3 + 1,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) + a3);
          *__error() = v42;
        }

        *(_BYTE *)(*(void *)(*(void *)(a1 + 152) + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
        uint64_t v43 = *(void *)(*(void *)(a1 + 160) + 8LL);
        if (*(_BYTE *)(v43 + 24) && *(void *)(a1 + 200) == -1LL) {
          *(_BYTE *)(v43 + 24) = 0;
        }
      }

      else
      {
        [(id)v8 setFilledUserStack:1];
        if (v8)
        {
          objc_setProperty_atomic((id)v8, v44, *(id *)(a1 + 72), 64LL);
          id v45 = (id *)(a1 + 80);
          objc_setProperty_atomic((id)v8, v46, *(id *)(a1 + 80), 72LL);
        }

        else
        {
          id v45 = (id *)(a1 + 80);
        }

        char v17 = 1;
        if (!a3 && qword_18C4B13C0)
        {
          int v47 = *__error();
          fprintf( (FILE *)qword_18C4B13C0,  "%'llu Thread 0x%llx user stack (leaf frame 0x%llx, swift async leaf 0x%llx) backfilled to all (%d) thread st ates (indexes %lu-%lu)\n",  [*(id *)(a1 + 32) machAbsTime],  objc_msgSend(*(id *)(a1 + 40), "threadId"),  objc_msgSend(*(id *)(a1 + 72), "address"),  objc_msgSend(*v45, "address"),  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) + 1,  0,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8) + 24));
          *__error() = v47;
          char v17 = 1;
        }
      }
    }

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 160) + 8LL) + 24LL))
    {
      if ([(id)v8 filledSwiftTask])
      {
        if (*(int *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL) >= 1 && qword_18C4B13C0 != 0)
        {
          int v49 = *__error();
          id v50 = (FILE *)qword_18C4B13C0;
          uint64_t v51 = [*(id *)(a1 + 32) machAbsTime];
          uint64_t v52 = [*(id *)(a1 + 40) threadId];
          uint64_t v53 = *(void **)(a1 + 88);
          if (v53) {
            uint64_t v53 = (void *)[v53 identifier];
          }
          fprintf( v50,  "%'llu Thread 0x%llx swift task %lld backfilled to %d thread states (indexes %lu-%lu)\n",  v51,  v52,  v53,  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL),  a3 + 1,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL) + a3);
          *__error() = v49;
        }

        *(_BYTE *)(*(void *)(*(void *)(a1 + 160) + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
      }

      else
      {
        [(id)v8 setFilledSwiftTask:1];
        id v54 = *(void **)(a1 + 88);
        if (v8)
        {
          objc_storeWeak((id *)(v8 + 120), v54);
          id v54 = *(void **)(a1 + 88);
        }

        if (v54)
        {
          +[SARecipeState stateWithThread:threadStateIndex:]( (uint64_t)&OBJC_CLASS___SASwiftTaskState,  *(void **)(a1 + 40),  a3);
          id v55 = (void *)objc_claimAutoreleasedReturnValue();
          [*(id *)(a1 + 96) insertObject:v55 atIndex:0];
        }

        char v17 = 1;
        if (!a3 && qword_18C4B13C0)
        {
          int v56 = *__error();
          int v57 = (FILE *)qword_18C4B13C0;
          uint64_t v58 = [*(id *)(a1 + 32) machAbsTime];
          uint64_t v59 = [*(id *)(a1 + 40) threadId];
          uint64_t v60 = *(void **)(a1 + 88);
          if (v60) {
            uint64_t v60 = (void *)[v60 identifier];
          }
          fprintf( v57,  "%'llu Thread 0x%llx swift task %lld backfilled to all (%d) thread states (indexes %lu-%lu)\n",  v58,  v59,  v60,  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL) + 1,  0LL,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL));
          *__error() = v56;
        }
      }
    }

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 168) + 8LL) + 24LL))
    {
      if ([(id)v8 filledScheduling])
      {
        if (*(int *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL) >= 1 && qword_18C4B13C0 != 0)
        {
          int v62 = *__error();
          fprintf( (FILE *)qword_18C4B13C0,  "%'llu Thread 0x%llx sched info (cpu time %lld (%lld + %lld), state 0x%x, priority %d (%d), qos %d, rqos %d, qoso %d, qosp %d) backfilled to %d thread states (indexes %lu-%lu)\n",  [*(id *)(a1 + 32) machAbsTime],  objc_msgSend(*(id *)(a1 + 40), "threadId"),  *(void *)(a1 + 216) + *(void *)(a1 + 208),  *(void *)(a1 + 208),  *(void *)(a1 + 216),  *(_DWORD *)(a1 + 240),  *(_DWORD *)(a1 + 248),  *(_DWORD *)(a1 + 244),  *(unsigned __int8 *)(a1 + 252),  *(unsigned __int8 *)(a1 + 253),  *(unsigned __int8 *)(a1 + 254),  *(unsigned __int8 *)(a1 + 255),  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8) + 24),  a3 + 1,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) + a3);
          *__error() = v62;
        }

        *(_BYTE *)(*(void *)(*(void *)(a1 + 168) + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
      }

      else
      {
        [(id)v8 setFilledScheduling:1];
        if (v8)
        {
          *(void *)(v8 + 144) = *(void *)(a1 + 208);
          *(void *)(v8 + 136) = *(void *)(a1 + 216);
          *(_DWORD *)(v8 + 40) = *(_DWORD *)(a1 + 240);
        }

        -[SAThreadState setBasePriority:]((int *)v8, *(_DWORD *)(a1 + 244));
        -[SAThreadState setScheduledPriority:]((int *)v8, *(_DWORD *)(a1 + 248));
        unsigned int v63 = *(unsigned __int8 *)(a1 + 252);
        if (v63 != 125) {
          -[SAThreadState setThreadQos:](v8, v63);
        }
        unsigned int v64 = *(unsigned __int8 *)(a1 + 253);
        if (v64 != 125) {
          -[SAThreadState setThreadRequestedQos:](v8, v64);
        }
        unsigned int v65 = *(unsigned __int8 *)(a1 + 254);
        if (v65 != 125) {
          -[SAThreadState setThreadRequestedQosOverride:](v8, v65);
        }
        unsigned int v66 = *(unsigned __int8 *)(a1 + 255);
        if (v66 != 125) {
          -[SAThreadState setThreadQosPromote:](v8, v66);
        }
        char v17 = 1;
        if (!a3 && qword_18C4B13C0)
        {
          int v67 = *__error();
          fprintf( (FILE *)qword_18C4B13C0,  "%'llu Thread 0x%llx sched info (cpu time %lld (%lld + %lld), state 0x%x, priority %d (%d), qos %d, rqos %d, qoso %d, qosp %d) backfilled to all (%d) thread states (indexes %lu-%lu)\n",  [*(id *)(a1 + 32) machAbsTime],  objc_msgSend(*(id *)(a1 + 40), "threadId"),  *(void *)(a1 + 216) + *(void *)(a1 + 208),  *(void *)(a1 + 208),  *(void *)(a1 + 216),  *(_DWORD *)(a1 + 240),  *(_DWORD *)(a1 + 248),  *(_DWORD *)(a1 + 244),  *(unsigned __int8 *)(a1 + 252),  *(unsigned __int8 *)(a1 + 253),  *(unsigned __int8 *)(a1 + 254),  *(unsigned __int8 *)(a1 + 255),  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) + 1,  0,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8) + 24));
          *__error() = v67;
        }
      }
    }

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 176) + 8LL) + 24LL))
    {
      if ([(id)v8 filledCyclesInstructions])
      {
        if (*(int *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL) >= 1 && qword_18C4B13C0)
        {
          int v68 = *__error();
          fprintf( (FILE *)qword_18C4B13C0,  "%'llu Thread 0x%llx thread instructions (%llu) cycles (%llu) backfilled to %d thread states (indexes %lu-%lu)\n",  [*(id *)(a1 + 32) machAbsTime],  objc_msgSend(*(id *)(a1 + 40), "threadId"),  *(void *)(a1 + 224),  *(void *)(a1 + 232),  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8) + 24),  a3 + 1,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) + a3);
          *__error() = v68;
        }

        *(_BYTE *)(*(void *)(*(void *)(a1 + 176) + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
      }

      else
      {
        [(id)v8 setFilledCyclesInstructions:1];
        if (v8)
        {
          *(void *)(v8 + 152) = *(void *)(a1 + 224);
          *(void *)(v8 + 160) = *(void *)(a1 + 232);
        }

        char v17 = 1;
        if (!a3 && qword_18C4B13C0)
        {
          int v69 = *__error();
          fprintf( (FILE *)qword_18C4B13C0,  "%'llu Thread 0x%llx thread instructions (%llu) cycles (%llu) backfilled to all (%d) thread states (indexes %lu-%lu)\n",  [*(id *)(a1 + 32) machAbsTime],  objc_msgSend(*(id *)(a1 + 40), "threadId"),  *(void *)(a1 + 224),  *(void *)(a1 + 232),  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) + 1,  0,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8) + 24));
          *__error() = v69;
        }
      }
    }

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 184) + 8LL) + 24LL))
    {
      if ([(id)v8 filledSnapshot])
      {
        if (*(int *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL) >= 1 && qword_18C4B13C0)
        {
          uint64_t v130 = a3;
          uint64_t v132 = a4;
          int v122 = *__error();
          int v127 = (FILE *)qword_18C4B13C0;
          uint64_t v124 = [*(id *)(a1 + 32) machAbsTime];
          uint64_t v121 = [*(id *)(a1 + 40) threadId];
          int v70 = *(unsigned __int8 *)(a1 + 256);
          int v71 = *(unsigned __int8 *)(a1 + 257);
          int v72 = *(unsigned __int8 *)(a1 + 258);
          int v73 = *(unsigned __int8 *)(a1 + 259);
          int v74 = *(unsigned __int8 *)(a1 + 260);
          int v75 = *(unsigned __int8 *)(a1 + 261);
          id v76 = [*(id *)(a1 + 104) debugDescription];
          fprintf( v127,  "%'llu Thread 0x%llx snapshot info (io tier %d, passive %d, suspended %d, darwinbg %d, idlewq %d, gfi %d, run nable %s) backfilled to %d thread states (indexes %lu-%lu)\n",  v124,  v121,  v70,  v71,  v72,  v73,  v74,  v75,  (const char *)[v76 UTF8String],  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8) + 24),  v130 + 1,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) + v130);

          *__error() = v122;
          a3 = v130;
          a4 = v132;
        }

        *(_BYTE *)(*(void *)(*(void *)(a1 + 184) + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
      }

      else
      {
        [(id)v8 setFilledSnapshot:1];
        if (v8)
        {
          *(_BYTE *)(v8 + 24) = *(_BYTE *)(a1 + 256);
          char v78 = *(_BYTE *)(v8 + 11) & 0x7F | ((*(_BYTE *)(a1 + 257) != 0) << 7);
          *(_BYTE *)(v8 + 11) = v78;
          *(_BYTE *)(v8 + 11) = v78 & 0xBF | (*(_BYTE *)(a1 + 258) << 6);
          char v79 = *(_BYTE *)(v8 + 15) & 0xBF | (*(_BYTE *)(a1 + 259) << 6);
          *(_BYTE *)(v8 + 15) = v79;
          *(_BYTE *)(v8 + 15) = v79 & 0x7F | ((*(_BYTE *)(a1 + 260) != 0) << 7);
        }

        if (*(_BYTE *)(a1 + 261))
        {
          uint64_t v80 = *(void *)(a1 + 40);
          if (v80) {
            *(_BYTE *)(v80 + 16) = 1;
          }
        }

        if (v8)
        {
          id v81 = *(void **)(a1 + 104);
          if (v81) {
            objc_setProperty_atomic((id)v8, v77, v81, 168LL);
          }
        }

        char v17 = 1;
        if (!a3 && qword_18C4B13C0)
        {
          uint64_t v133 = a4;
          int v123 = *__error();
          uint64_t v128 = (FILE *)qword_18C4B13C0;
          uint64_t v125 = [*(id *)(a1 + 32) machAbsTime];
          uint64_t v82 = [*(id *)(a1 + 40) threadId];
          int v83 = *(unsigned __int8 *)(a1 + 256);
          int v84 = *(unsigned __int8 *)(a1 + 257);
          int v85 = *(unsigned __int8 *)(a1 + 258);
          int v86 = *(unsigned __int8 *)(a1 + 259);
          int v87 = *(unsigned __int8 *)(a1 + 260);
          int v88 = *(unsigned __int8 *)(a1 + 261);
          id v89 = [*(id *)(a1 + 104) debugDescription];
          fprintf( v128,  "%'llu Thread 0x%llx snapshot info (io tier %d, passive %d, suspended %d, darwinbg %d, idlewq %d, gfi %d, run nable %s) backfilled to all (%d) thread states (indexes %lu-%lu)\n",  v125,  v82,  v83,  v84,  v85,  v86,  v87,  v88,  (const char *)[v89 UTF8String],  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) + 1,  0,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8) + 24));

          *__error() = v123;
          char v17 = 1;
          a3 = 0LL;
          a4 = v133;
        }
      }
    }

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 192) + 8LL) + 24LL))
    {
      if ([(id)v8 needsExclave])
      {
        [(id)v8 setNeedsExclave:0];
        if (v8) {
          objc_setProperty_atomic((id)v8, v90, *(id *)(a1 + 112), 176LL);
        }
        if (!a3 && qword_18C4B13C0)
        {
          int v91 = *__error();
          int v92 = (FILE *)qword_18C4B13C0;
          uint64_t v93 = [*(id *)(a1 + 32) machAbsTime];
          uint64_t v95 = [*(id *)(a1 + 40) threadId];
          id Property = *(id *)(a1 + 112);
          if (Property) {
            id Property = objc_getProperty(Property, v94, 16LL, 1);
          }
          id v134 = Property;
          uint64_t v98 = [v134 count];
          id v99 = *(id *)(a1 + 112);
          if (v99) {
            id v99 = objc_getProperty(v99, v97, 16LL, 1);
          }
          id v100 = v99;
          [v100 lastObject];
          char v101 = (void *)objc_claimAutoreleasedReturnValue();
          char v103 = v101;
          if (v101)
          {
            id v104 = objc_getProperty(v101, v102, 16LL, 1);
            int v105 = v91;
          }

          else
          {
            int v105 = v91;
            id v104 = 0LL;
          }

          id v106 = v104;
          fprintf( v92,  "%'llu Thread 0x%llx exclave info (%lu exclaves, leaf frame 0x%llx) backfilled to all (%d) thread states (indexes %lu-%lu)\n",  v93,  v95,  v98,  [v106 address],  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) + 1,  0,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8) + 24));

          *__error() = v105;
        }

        goto LABEL_149;
      }

      if (*(int *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL) >= 1 && qword_18C4B13C0)
      {
        int v107 = *__error();
        uint64_t v108 = (FILE *)qword_18C4B13C0;
        uint64_t v109 = [*(id *)(a1 + 32) machAbsTime];
        uint64_t v111 = [*(id *)(a1 + 40) threadId];
        id v112 = *(id *)(a1 + 112);
        uint64_t v135 = a4;
        if (v112) {
          id v112 = objc_getProperty(v112, v110, 16LL, 1);
        }
        id v131 = v112;
        uint64_t v114 = [v131 count];
        id v115 = *(id *)(a1 + 112);
        uint64_t v126 = v111;
        if (v115) {
          id v115 = objc_getProperty(v115, v113, 16LL, 1);
        }
        id v129 = v115;
        [v129 lastObject];
        uint64_t v116 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v118 = v116;
        if (v116) {
          id v119 = objc_getProperty(v116, v117, 16LL, 1);
        }
        else {
          id v119 = 0LL;
        }
        id v120 = v119;
        fprintf( v108,  "%'llu Thread 0x%llx exclave info (%lu exclaves, leaf frame 0x%llx) backfilled to %d thread states (indexes %lu-%lu)\n",  v109,  v126,  v114,  [v120 address],  *(_DWORD *)(*(void *)(*(void *)(a1 + 136) + 8) + 24),  a3 + 1,  *(int *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) + a3);

        a4 = v135;
        *__error() = v107;
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 192) + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
    }

    if ((v17 & 1) == 0)
    {
      *a4 = 1;
LABEL_153:

      goto LABEL_154;
    }

void __380__SASampleStore_KPerfPrivate__backfillTask_lastSampleIndex_timestamp_haveSnap_terminatedThreadsUserTimeInNs_terminatedThreadsSystemTimeInNs_terminatedThreadsCycles_terminatedThreadsInstructions_suspendCount_pageins_isDarwinBG_isForeground_isBoosted_isDirty_haveWQFlags_wqExceededTotalThreadLimit_wqExceededConstrainedThreadLimit_haveMem_taskSizeInBytes_haveLatencyQos_latencyQos___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v40 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v7 = v40;
    id v8 = v7;
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8LL);
    if (!*(_BYTE *)(v9 + 24))
    {
      int v17 = 0;
      goto LABEL_46;
    }

    if (v7)
    {
      if ((v7[120] & 1) != 0)
      {
        if (*(int *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) >= 1 && qword_18C4B13C0 != 0)
        {
          int v26 = *__error();
          uint64_t v27 = (FILE *)qword_18C4B13C0;
          uint64_t v28 = [*(id *)(a1 + 32) machAbsTime];
          int v29 = [*(id *)(a1 + 40) pid];
          int v30 = *(unsigned __int8 *)(a1 + 144);
          if (*(_BYTE *)(a1 + 144))
          {
            int v30 = *(unsigned __int8 *)(a1 + 145);
            int v31 = *(unsigned __int8 *)(a1 + 146);
          }

          else
          {
            int v31 = 0;
          }

          fprintf( v27,  "%'llu task [%d] state (terminated cpu %llu, terminated instruction %llu, terminated cycles %llu, suspend cou nt %d, pageins %u, darwinBG %d, foreground %d, boosted %d, dirty %d, wq total %d, wq constrained %d) backfil led to %d task states (indexes %lu-%lu)\n",  v28,  v29,  *(void *)(a1 + 96) + *(void *)(a1 + 88),  *(void *)(a1 + 112),  *(void *)(a1 + 104),  *(_DWORD *)(a1 + 128),  *(_DWORD *)(a1 + 132),  *(unsigned __int8 *)(a1 + 140),  *(unsigned __int8 *)(a1 + 141),  *(unsigned __int8 *)(a1 + 142),  *(unsigned __int8 *)(a1 + 143),  v30,  v31,  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL),  a3 + 1,  *(int *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) + a3);
          *__error() = v26;
          uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8LL);
        }

        int v17 = 0;
        *(_BYTE *)(v9 + 24) = 0;
LABEL_46:
        uint64_t v32 = *(void *)(*(void *)(a1 + 72) + 8LL);
        if (!*(_BYTE *)(v32 + 24)) {
          goto LABEL_59;
        }
        if (v8)
        {
          if ((*((_BYTE *)v8 + 121) & 1) != 0)
          {
            if (*(int *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) >= 1 && qword_18C4B13C0 != 0)
            {
              int v35 = *__error();
              fprintf( (FILE *)qword_18C4B13C0,  "%'llu task [%d] size %llu backfilled to %d task states (indexes %lu-%lu)\n",  [*(id *)(a1 + 32) machAbsTime],  objc_msgSend(*(id *)(a1 + 40), "pid"),  *(void *)(a1 + 120),  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24),  a3 + 1,  *(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) + a3);
              *__error() = v35;
              uint64_t v32 = *(void *)(*(void *)(a1 + 72) + 8LL);
            }

            *(_BYTE *)(v32 + 24) = 0;
LABEL_59:
            uint64_t v36 = *(void *)(*(void *)(a1 + 80) + 8LL);
            if (*(_BYTE *)(v36 + 24))
            {
              if (!v8)
              {
LABEL_63:
                if (!a3 && qword_18C4B13C0)
                {
                  int v37 = *__error();
                  fprintf( (FILE *)qword_18C4B13C0,  "%'llu task [%d] latency qos %d backfilled to all (%d) task states (indexes %lu-%lu)\n",  [*(id *)(a1 + 32) machAbsTime],  objc_msgSend(*(id *)(a1 + 40), "pid"),  *(_DWORD *)(a1 + 136),  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) + 1,  0,  *(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
                  *__error() = v37;
                }

- (id)binaryFormat
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  uint64_t v2 = -[PASampleTimeSeriesDataStore initWithSampleStore:]( objc_alloc(&OBJC_CLASS___PASampleTimeSeriesDataStore),  "initWithSampleStore:",  self);
  id v29 = 0LL;
  [MEMORY[0x1896078F8] archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v29];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v29;
  if (![v3 length])
  {
    int v15 = *__error();
    _sa_logt();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v26 = [v4 description];
      uint64_t v27 = [v26 UTF8String];
      *(_DWORD *)__int128 buf = 136315138;
      uLong v31 = v27;
      _os_log_error_impl( &dword_186C92000,  v16,  OS_LOG_TYPE_ERROR,  "Unable to archive samples for binary format: %s",  buf,  0xCu);
    }

    *__error() = v15;
    goto LABEL_13;
  }

  uLong v5 = [v3 length];
  id v6 = v3;
  uint64_t v7 = [v6 bytes];
  if (!v7)
  {
    int v17 = *__error();
    _sa_logt();
    int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl(&dword_186C92000, v18, OS_LOG_TYPE_ERROR, "Unable to get bytes for binary format", buf, 2u);
    }

    *__error() = v17;
    goto LABEL_13;
  }

  id v8 = (const Bytef *)v7;
  uLong v9 = compressBound(v5);
  uLongf v28 = v9;
  uint64_t v10 = (Bytef *)malloc(v9 + 8);
  int v11 = compress(v10 + 8, &v28, v8, v5);

  int v12 = *__error();
  _sa_logt();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 134218496;
      uLong v31 = v5;
      __int16 v32 = 2048;
      uLongf v33 = v9;
      __int16 v34 = 1024;
      LODWORD(v35) = v11;
      _os_log_error_impl( &dword_186C92000,  v14,  OS_LOG_TYPE_ERROR,  "Unable to compress binary format of size %lu to estimated compressed size %lu: %d",  buf,  0x1Cu);
    }

    *__error() = v12;
    free(v10);
LABEL_13:
    int v19 = 0LL;
    return v19;
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 134218496;
    uLong v31 = v5;
    __int16 v32 = 2048;
    uLongf v33 = v28;
    __int16 v34 = 2048;
    double v35 = (double)(v5 - v28) * 100.0 / (double)v5;
    _os_log_debug_impl( &dword_186C92000,  v14,  OS_LOG_TYPE_DEBUG,  "Compressed %lu binary data into %lu (%.0f%% savings)",  buf,  0x20u);
  }

  *__error() = v12;
  *(void *)uint64_t v10 = v5;
  v28 += 8LL;
  id v21 = objc_alloc(MEMORY[0x189603FB8]);
  int v22 = (void *)[v21 initWithBytesNoCopy:v10 length:v28 freeWhenDone:1];
  int v19 = v22;
  if (v22)
  {
    id v23 = v22;
  }

  else
  {
    int v24 = *__error();
    _sa_logt();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( &dword_186C92000,  v25,  OS_LOG_TYPE_ERROR,  "Unable to create NSData for compressed binary format",  buf,  2u);
    }

    *__error() = v24;
    free(v10);
  }

  return v19;
}

- (BOOL)saveBinaryFormatToStream:(__sFILE *)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  -[SASampleStore binaryFormat](self, "binaryFormat");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uLong v5 = v4;
  if (v4)
  {
    [v4 base64EncodedDataWithOptions:34];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      size_t v7 = [v6 length];
      id v8 = (const void *)[v6 bytes];
      LOBYTE(v5) = 1;
      fwrite("Spindump binary format\n", 0x17uLL, 1uLL, a3);
      if (fwrite(v8, v7, 1uLL, a3) == 1)
      {
LABEL_8:

        return (char)v5;
      }

      int v9 = *__error();
      _sa_logt();
      uLong v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
      {
        v14[0] = 67109120;
        v14[1] = ferror(a3);
        uint64_t v10 = "Unable to save binary format: %d";
        int v11 = (os_log_s *)v5;
        uint32_t v12 = 8;
LABEL_11:
        _os_log_error_impl(&dword_186C92000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)v14, v12);
      }
    }

    else
    {
      int v9 = *__error();
      _sa_logt();
      uLong v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14[0]) = 0;
        uint64_t v10 = "Unable to get bytes for binary format";
        int v11 = (os_log_s *)v5;
        uint32_t v12 = 2;
        goto LABEL_11;
      }
    }

    LOBYTE(v5) = 0;
    *__error() = v9;
    goto LABEL_8;
  }

  return (char)v5;
}

+ (id)sampleStoreForSpindumpFile:(const char *)a3
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 0LL;
  }
  int v5 = open(a3, 0);
  if (v5 == -1)
  {
    int v15 = *__error();
    _sa_logt();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      *__error() = v15;
      return 0LL;
    }

    int v23 = *__error();
    v63.st_dev = 136315394;
    *(void *)&v63.st_mode = a3;
    WORD2(v63.st_ino) = 1024;
    *(_DWORD *)((char *)&v63.st_ino + 6) = v23;
    int v24 = "Unable to open %s: %{errno}d";
    id v25 = &v63;
    id v26 = (os_log_s *)v16;
    uint32_t v27 = 18;
LABEL_26:
    _os_log_error_impl(&dword_186C92000, v26, OS_LOG_TYPE_ERROR, v24, (uint8_t *)v25, v27);
    goto LABEL_12;
  }

  int v6 = v5;
  size_t v7 = fdopen(v5, "r");
  if (!v7)
  {
    int v18 = *__error();
    _sa_logt();
    int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v28 = *__error();
      v63.st_dev = 136315394;
      *(void *)&v63.st_mode = a3;
      WORD2(v63.st_ino) = 1024;
      *(_DWORD *)((char *)&v63.st_ino + 6) = v28;
      _os_log_error_impl( &dword_186C92000,  v19,  OS_LOG_TYPE_ERROR,  "Unable to fopen %s: %{errno}d",  (uint8_t *)&v63,  0x12u);
    }

    *__error() = v18;
    close(v6);
    return 0LL;
  }

  id v8 = v7;
  int v9 = malloc(0x800uLL);
  do
  {
    if (!fgets((char *)v9, 2048, v8))
    {
      free(v9);
      int v11 = *__error();
      _sa_logt();
      uint32_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      v63.st_dev = 136315138;
      *(void *)&v63.st_mode = a3;
      int v22 = &v63;
LABEL_50:
      _os_log_debug_impl( &dword_186C92000,  v12,  OS_LOG_TYPE_DEBUG,  "Input file %s does not contain a binary format for spindump",  (uint8_t *)v22,  0xCu);
      goto LABEL_17;
    }
  }

  while (strncmp("Spindump binary format", (const char *)v9, 0x16uLL));
  free(v9);
  uint64_t v10 = MEMORY[0x186E476A0](v8);
  if (fstat(v6, &v63))
  {
    int v11 = *__error();
    _sa_logt();
    uint32_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = *__error();
      int v61 = 136315394;
      *(void *)int v62 = a3;
      *(_WORD *)&v62[8] = 1024;
      *(_DWORD *)&v62[10] = v13;
      uint64_t v14 = "Unable to fstat %s: %{errno}d";
      goto LABEL_10;
    }

    goto LABEL_17;
  }

  if (v63.st_size <= v10)
  {
    int v11 = *__error();
    _sa_logt();
    uint32_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    int v61 = 136315138;
    *(void *)int v62 = a3;
    int v22 = (stat *)&v61;
    goto LABEL_50;
  }

  uint64_t v20 = mmap(0LL, v63.st_size, 1, 1, v6, 0LL);
  if ((unint64_t)(v20 + 1) <= 1)
  {
    int v11 = *__error();
    _sa_logt();
    uint32_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v21 = *__error();
      int v61 = 136315394;
      *(void *)int v62 = a3;
      *(_WORD *)&v62[8] = 1024;
      *(_DWORD *)&v62[10] = v21;
      uint64_t v14 = "Unable to mmap %s: %{errno}d";
LABEL_10:
      _os_log_error_impl(&dword_186C92000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v61, 0x12u);
    }

+ (id)sampleStoreForBinaryFormat:(id)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    int v15 = *__error();
    _sa_logt();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)__int128 buf = 0;
    int v17 = "Nil data";
    int v18 = v16;
    uint32_t v19 = 2;
LABEL_14:
    _os_log_error_impl(&dword_186C92000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_15;
  }

  uint64_t v5 = [v3 length];
  int v6 = (size_t *)[v4 bytes];
  id v8 = (const Bytef *)(v6 + 1);
  uLongf v7 = *v6;
  if (*v6 == -1LL)
  {
    int v15 = *__error();
    _sa_logt();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)__int128 buf = 134217984;
    uLongf v40 = -1LL;
    int v17 = "Bad uncompressed size %llu";
    int v18 = v16;
    uint32_t v19 = 12;
    goto LABEL_14;
  }

  int v9 = (Bytef *)malloc(*v6);
  if (!v9)
  {
    int v15 = *__error();
    _sa_logt();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v20 = *__error();
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v40) = v20;
      int v17 = "Unable to allocate buffer for binary format: %{errno}d";
      int v18 = v16;
      uint32_t v19 = 8;
      goto LABEL_14;
    }

@end