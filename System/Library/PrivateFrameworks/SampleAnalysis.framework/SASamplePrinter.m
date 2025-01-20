@interface SASamplePrinter
- (BOOL)frame:(void *)a3 matchesFrame:;
- (BOOL)hasTimeIndexes;
- (BOOL)shareWithAppDevs;
- (BOOL)taskHasSwallowedAnExceptionNotedByHIException:(BOOL)a1;
- (NSString)headerNote;
- (NSUUID)incidentUUID;
- (SABinaryLoadInfoToDisplay)displayedBinaryLoadInfoForBinary:(void *)a1 segment:(void *)a2 desiredLoadAddress:(uint64_t)a3 offsetIntoLoadInfo:(unint64_t)a4 isInKernelAddressSpace:(BOOL)a5 exclave:(void *)a6 binariesToDisplay:(void *)a7 extraBinariesToDisplay:(void *)a8;
- (SASamplePrintOptions)options;
- (SASamplePrinter)initWithSampleStore:(id)a3;
- (SASampleStore)sampleStore;
- (SAStack)stackForThread:(void *)a3 threadStateIndexes:(void *)a4 task:(uint64_t)a5 taskSampleCount:(BOOL)a6 isTarget:;
- (__CFString)displayNameForDispatchQueue:(void *)a1;
- (__CFString)displayNameForPid:(id *)a1 aroundTimestamp:(uint64_t)a2 includePid:(void *)a3;
- (__CFString)displayStringForResourceCoalition:(void *)a1;
- (__CFString)timeIndexDescriptionForStartSampleIndex:(unint64_t)a3 endSampleIndex:(unsigned int)a4 formattedToLength:;
- (__CFString)timeIndexDescriptionForTimestamp:(uint64_t)a1;
- (double)timeSpentAsleepBetweenStartTimestamp:(void *)a3 endTimestamp:;
- (id)_findIOBefore:(void *)a3 during:(void *)a4 after:(void *)a5 thread:(unint64_t)a6 stateIndex:(void *)a7 inIO:(void *)a8 nextIO:;
- (id)architectureStringForTask:(uint64_t)a1;
- (id)binaryImagesHitByTask:(uint64_t)a1;
- (id)callTreeForDispatchQueue:(id)a3 andThread:(id)a4 inTask:(id)a5;
- (id)callTreeForDispatchQueue:(id)a3 swiftTask:(id)a4 thread:(id)a5 inTask:(id)a6;
- (id)callTreeForExecutable:(id)a3;
- (id)callTreeForSwiftTask:(id)a3 thread:(id)a4 inTask:(id)a5;
- (id)callTreeForTask:(id)a3;
- (id)callTreeForThread:(id)a3 inTask:(id)a4;
- (id)callTreesForThreadsInTask:(id)a3;
- (id)copyDescriptionForTimeRanges:(uint64_t)a1;
- (id)displayNameForPid:(uint64_t)a3 threadId:(void *)a4 timestamp:;
- (id)displayNameForTask:(int)a3 includePid:;
- (id)displayNameForTask:(uint64_t)a3 threadId:;
- (id)displayNameForTask:(void *)a1;
- (id)displayNameForTask:(void *)a3 thread:(void *)a4 threadState:;
- (id)displayStringForOnBehalfOfForTasks:(uint64_t)a1 includePid:(void *)a2;
- (id)displayedBinaryLoadInfoForLoadInfo:(uint64_t)a1 offsetIntoLoadInfo:(void *)a2 binariesToDisplay:(unint64_t)a3 extraBinariesToDisplay:(void *)a4;
- (id)eventEndTimeWithWallTime;
- (id)eventStartTimeWithWallTime;
- (id)indexForBinary:(uint64_t)a1;
- (id)sortedLoadInfosForBinaryImages:(uint64_t)a1;
- (id)stacksForTask:(uint64_t)a3 taskSampleCount:;
- (id)stateChangeStringForThreadState:(void *)a3 serialDispatchQueue:(void *)a4 swiftTaskStates:(void *)a5 thread:(void *)a6 threadStateIndexes:(void *)a7 taskState:(void *)a8 task:(uint64_t)a9 iteratorIndex:(char)a10 missingStateIsInAnotherStack:(uint64_t)a11 numSamplesOmittedSincePreviousDisplayedSample:(void *)a12 sampleTimestamp:(void *)a13 previousSampleTimestamp:(void *)a14 previousDisplayedTimestamp:(void *)a15 previousTaskState:(void *)a16 previousThread:(void *)a17 previousThreadState:(char)a18 dispatchQueueChanges:(char)a19 swiftTaskChanges:(char)a20 priorityChanges:(char)a21 nameChanges:(char)a22 threadChanges:(char)a23 isTimeJump:(void *)a24 ioEventsSincePreviousThreadState:;
- (uint64_t)aggregateByDispatchQueue:(uint64_t)a1;
- (uint64_t)checkForBadOptions;
- (uint64_t)complainAboutSamplingGapBetweenStartTimestamp:(void *)a3 endTimestamp:;
- (uint64_t)copyDescriptionForIOEvent:(void *)a1;
- (uint64_t)copyDescriptionForIOEvents:(id *)a1;
- (uint64_t)copyDescriptionForTruncatedLeafFrame:(void *)a3 otherCallTreeDescription:(void *)a4 binariesToDisplay:(void *)a5 extraBinariesToDisplay:;
- (uint64_t)displayTimeIndexForSampleIndex:(uint64_t)result;
- (uint64_t)highestPriorityInTask:(char)a3 useBasePriority:;
- (uint64_t)numIOsForTask:(void *)a3 ioSize:;
- (uint64_t)printTaskHeaderForTask:(unint64_t)a3 specialDispatchQueueId:(uint64_t)a4 specialThreadId:(char *)a5 omitSpecial:(int)a6 omitOther:;
- (uint64_t)shouldPrintTask:(void *)a3 thread:(void *)a4 dispatchQueue:;
- (uint64_t)shouldPrintTimeOutsideSamplingRange:(uint64_t)a1;
- (void)addHeaderForDispatchQueue:(void *)a3 orSwiftTaskStates:(void *)a4 orThread:(void *)a5 andThreadStateIndexes:(void *)a6 toStack:(void *)a7 task:(uint64_t)a8 taskSampleCount:;
- (void)addStack:(void *)a3 toStream:(unint64_t)a4 sampleCount:(void *)a5 binariesToDisplay:(uint64_t)a6 primaryState:(int)a7 primaryMicrostackshotState:(char)a8 onlyHeaviestStack:;
- (void)addStackForDispatchQueue:(void *)a3 orSwiftTaskStates:(void *)a4 orThread:(void *)a5 andThreadStateIndexes:(void *)a6 task:(void *)a7 toRootObjects:(char)a8 nameChanges:(char)a9 dispatchQueueChanges:(char)a10 swiftTaskChanges:(char)a11 threadChanges:(char)a12 priorityChanges:(void *)a13 microstackshotSummary:(unsigned __int8)a14 onlyHeaviestStack:(unsigned __int8)a15 includeState:;
- (void)addStackForSwiftTask:(void *)a3 andThread:(void *)a4 task:(void *)a5 toRootObjects:;
- (void)addTaskHeaderToStream:(void *)a3 displayName:(uint64_t)a4 pid:(void *)a5 mainBinary:(void *)a6 mainBinaryPath:(void *)a7 sharedCaches:(uint64_t)a8 uid:(double)a9 bundleIdentifier:(void *)a10 bundleVersion:(void *)a11 bundleShortVersion:(void *)a12 bundleBuildVersion:(void *)a13 bundleProjectName:(void *)a14 bundleSourceVersion:(void *)a15 bundleProductBuildVersion:(void *)a16 adamID:(uint64_t)a17 installerVersionID:(void *)a18 developerType:(char)a19 appType:(void *)a20 isBeta:(unsigned __int8)a21 cohortID:(void *)a22 vendorID:(void *)a23 distributorID:(void *)a24 codesigningID:(void *)a25 teamID:(void *)a26 resourceCoalitionSampleCounts:(void *)a27 onBehalfOfProcesses:(void *)a28 architectureString:(void *)a29 kernelVersion:(void *)a30 parentName:(void *)a31 responsibleName:(void *)a32 taskExecedFromName:(void *)a33 taskExecedToName:(void *)a34 pidStartTimestamp:(void *)a35 startTimestamp:(void *)a36 endTimestamp:(void *)a37 startSampleIndex:(unint64_t)a38 endSampleIndex:(unint64_t)a39 numSamples:(unint64_t)a40 totalNumSamples:(unint64_t)a41 numSamplesSuspended:(uint64_t)a42 numSamplesTerminated:(uint64_t)a43 startingTaskSize:(unint64_t)a44 endingTaskSize:(unint64_t)a45 maxTaskSize:(unint64_t)a46 startSampleIndexOfMaxTaskSize:(unint64_t)a47 endSampleIndexOfMaxTaskSize:(unint64_t)a48 numPageins:(unsigned int)a49 cpuTimeNs:(unint64_t)a50 cpuInstructions:(unint64_t)a51 cpuCycles:(unint64_t)a52 nonThreadCpuTimeNs:(unint64_t)a53 nonThreadCpuInstructions:(unint64_t)a54 nonThreadCpuCycles:(unint64_t)a55 usesSuddenTermination:(char)a56 allowsIdleExit:(char)a57 isTranslocated:(char)a58 isUnresponsive:(char)a59 timeOfLastResponse:(uint64_t)a60 numThreads:(uint64_t)a61 numIdleWorkQueueThreads:(uint64_t)a62 numOtherHiddenThreads:(char)a63 hieSwallowedException:wqExceededConstrainedThreadLimit:wqExceededTotalThreadLimit:threadsDeadlocked:threadsBlockedByADeadlock:ioSize:numIOs:isReportHeader:;
- (void)avoidOverlapInBinaryLoadInfos:(int)a3 onlyExclaves:(void *)a4 inTask:;
- (void)copyDescriptionsForFrame:(void *)a3 binariesToDisplay:(void *)a4 extraBinariesToDisplay:;
- (void)filterToDisplayTimeIndexStart:(unint64_t)a3 end:(unint64_t)a4;
- (void)filterToMachAbsTimeRangeStart:(unint64_t)a3 end:(unint64_t)a4;
- (void)filterToTimestampRangeStart:(id)a3 end:(id)a4;
- (void)filterToWallTimeRangeStart:(double)a3 end:(double)a4;
- (void)iterateDispatchQueue:(void *)a3 orSwiftTaskStates:(void *)a4 orThread:(void *)a5 threadStateIndexes:(unint64_t)a6 startingAtIndex:(void *)a7 endingAfterTimestamp:(void *)a8 task:(char)a9 stopAtTimeJumps:(void *)a10 callback:;
- (void)largestFootprintInTask:(void *)a1;
- (void)printBinaryImagesForTask:(uint64_t)a1;
- (void)printHIDEvent:(uint64_t)a1;
- (void)printHeader;
- (void)printLoadInfos:(id *)a1;
- (void)printReport;
- (void)printSingleStackForTasks:(void *)a3 limitToDispatchQueueIds:(void *)a4 limitToThreadIds:(char)a5 intersection:(unint64_t)a6 sampleCount:;
- (void)printStack:(void *)a3 stream:;
- (void)printTask:(unint64_t)a3 specialDispatchQueueId:(uint64_t)a4 specialThreadId:(char *)a5 omitSpecial:(int)a6 omitOther:;
- (void)printToMutableData:(id)a3;
- (void)printToStream:(__sFILE *)a3;
- (void)setHeaderNote:(id)a3;
- (void)setIncidentUUID:(id)a3;
- (void)setOptions:(id)a3;
- (void)setShareWithAppDevs:(BOOL)a3;
- (void)updateIndexes;
@end

@implementation SASamplePrinter

- (id)indexForBinary:(uint64_t)a1
{
  if (a1)
  {
    [*(id *)(a1 + 80) objectForKeyedSubscript:a2];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      [MEMORY[0x189603FE8] null];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 objectForKeyedSubscript:v3];
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        [v2 allValues];
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 firstObject];
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      v4 = 0LL;
    }
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (void)setOptions:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    v5 = (SASamplePrintOptions *)v4;
  }
  else {
    v5 = objc_alloc_init(&OBJC_CLASS___SASamplePrintOptions);
  }
  options = self->_options;
  self->_options = v5;
}

- (SASamplePrintOptions)options
{
  return self->_options;
}

- (SASamplePrinter)initWithSampleStore:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SASamplePrinter;
  v6 = -[SASamplePrinter init](&v19, sel_init);
  if (v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___SASamplePrintOptions);
    options = v6->_options;
    v6->_options = v7;

    objc_storeStrong((id *)&v6->_sampleStore, a3);
    id v9 = objc_alloc(MEMORY[0x189603FC8]);
    [v5 tasksByPid];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));
    binaryImagesHit = v6->_binaryImagesHit;
    v6->_binaryImagesHit = (NSMutableDictionary *)v11;

    uint64_t v13 = -[SASampleStore startTime](v6->_sampleStore, "startTime");
    reportStartTime = v6->_reportStartTime;
    v6->_reportStartTime = (SATimestamp *)v13;

    uint64_t v15 = -[SASampleStore endTime](v6->_sampleStore, "endTime");
    reportEndTime = v6->_reportEndTime;
    v6->_reportEndTime = (SATimestamp *)v15;

    if (-[SASamplePrinter hasTimeIndexes]((uint64_t)v6))
    {
      v6->_reportStartSampleIndex = 0LL;
      v17 = -[SASampleStore sampleTimestamps](v6->_sampleStore, "sampleTimestamps");
      v6->_reportEndSampleIndex = [v17 count] - 1;
    }

    else
    {
      *(int64x2_t *)&v6->_reportStartSampleIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    }

    v6->_numSamples = -[SASampleStore numSamples](v6->_sampleStore, "numSamples");
  }

  return v6;
}

- (BOOL)hasTimeIndexes
{
  if (!a1) {
    return 0LL;
  }
  [*(id *)(a1 + 160) sampleTimestamps];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (double)timeSpentAsleepBetweenStartTimestamp:(void *)a3 endTimestamp:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  double v8 = 0.0;
  if (a1)
  {
    [v6 machContTimeSeconds];
    if (v9 > 0.0)
    {
      [v5 machContTimeSeconds];
      if (v10 > 0.0)
      {
        [v7 machContTimeSeconds];
        double v12 = v11;
        [v5 machContTimeSeconds];
        goto LABEL_8;
      }
    }

    [v7 wallTime];
    if (v14 > 0.0)
    {
      [v5 wallTime];
      if (v15 > 0.0)
      {
        [v7 wallTime];
        double v12 = v16;
        [v5 wallTime];
LABEL_8:
        double v17 = v12 - v13;
        [v7 machAbsTimeSeconds];
        double v19 = v18;
        [v5 machAbsTimeSeconds];
        double v21 = v17 - (v19 - v20);
        if (v21 >= 1.0) {
          double v8 = v21;
        }
        else {
          double v8 = 0.0;
        }
      }
    }
  }

  return v8;
}

- (uint64_t)complainAboutSamplingGapBetweenStartTimestamp:(void *)a3 endTimestamp:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1) {
    a1 = *(double *)(a1 + 88) > 0.0
  }
      && ([v6 machAbsTimeSeconds],
          double v9 = v8,
          [v5 machAbsTimeSeconds],
          v9 - v10 >= *(double *)(a1 + 88) * 10.0);

  return a1;
}

void __37__SASamplePrinter_calculateTimeJumps__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v6
    && (-[SASamplePrinter timeSpentAsleepBetweenStartTimestamp:endTimestamp:](*(void *)(a1 + 32), v6, v5) > 0.0
     || -[SASamplePrinter complainAboutSamplingGapBetweenStartTimestamp:endTimestamp:]( *(void *)(a1 + 32),  *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  v5)))
  {
    id v7 = *(void **)(*(void *)(a1 + 32) + 96LL);
    [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
    double v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 addObject:v8];
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (void)updateIndexes
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  v3 = (id *)(a1 + 32);
  BOOL v2 = *(void **)(a1 + 32);
  if (v2 && *(void *)(a1 + 40) && (objc_msgSend(v2, "le:") & 1) == 0)
  {
    int v27 = *__error();
    _sa_logt();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = [*(id *)(a1 + 32) debugDescription];
      uint64_t v30 = [v29 UTF8String];
      id v31 = [*(id *)(a1 + 40) debugDescription];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = [v31 UTF8String];
      _os_log_error_impl(&dword_186C92000, v28, OS_LOG_TYPE_ERROR, "reportStartTime %s > reportEndTime %s", buf, 0x16u);
    }

    *__error() = v27;
    id v32 = [*(id *)(a1 + 32) debugDescription];
    char v33 = [v32 UTF8String];
    id v34 = [*(id *)(a1 + 40) debugDescription];
    [v34 UTF8String];
    _SASetCrashLogMessage(1530, "reportStartTime %s > reportEndTime %s", v35, v36, v37, v38, v39, v40, v33);

    _os_crash();
    __break(1u);
  }

  if (!-[SASamplePrinter hasTimeIndexes](a1))
  {
    *(int64x2_t *)(a1 + 48) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v49 = __Block_byref_object_copy__4;
    v50 = __Block_byref_object_dispose__4;
    id v51 = 0LL;
    uint64_t v42 = 0LL;
    v43 = &v42;
    uint64_t v44 = 0x3032000000LL;
    v45 = __Block_byref_object_copy__4;
    v46 = __Block_byref_object_dispose__4;
    id v47 = 0LL;
    *(void *)(a1 + 64) = 0LL;
    double v10 = *(void **)(a1 + 160);
    v41[0] = MEMORY[0x1895F87A8];
    v41[1] = 3221225472LL;
    v41[2] = __32__SASamplePrinter_updateIndexes__block_invoke;
    v41[3] = &unk_189F637C8;
    v41[4] = a1;
    v41[5] = buf;
    v41[6] = &v42;
    [v10 enumerateTasks:v41];
    double v11 = *(void **)(*(void *)&buf[8] + 40LL);
    if (v11) {
      objc_storeStrong(v3, v11);
    }
    double v12 = (void *)v43[5];
    if (v12) {
      objc_storeStrong((id *)(a1 + 40), v12);
    }
    _Block_object_dispose(&v42, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_32;
  }

  [*(id *)(a1 + 160) startTime];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 160) endTime];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = *(void **)(a1 + 32);
  if (!v6 || !v4 || ![v6 gt:v4])
  {
    *(void *)(a1 + 48) = 0LL;
    [*(id *)(a1 + 160) sampleTimestamps];
    double v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 firstObject];
    goto LABEL_17;
  }

  uint64_t v7 = [*(id *)(a1 + 160) indexOfFirstSampleOnOrAfterTimestamp:*(void *)(a1 + 32)];
  *(void *)(a1 + 48) = v7;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 160) sampleTimestamps];
    double v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 objectAtIndexedSubscript:*(void *)(a1 + 48)];
LABEL_17:
    id v13 = *v3;
    id *v3 = (id)v9;
  }

  double v14 = *(void **)(a1 + 40);
  if (!v14 || !v5 || ![v14 lt:v5])
  {
    [*(id *)(a1 + 160) sampleTimestamps];
    double v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)(a1 + 56) = [v18 count] - 1;

    [*(id *)(a1 + 160) sampleTimestamps];
    double v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 lastObject];
    goto LABEL_24;
  }

  uint64_t v15 = [*(id *)(a1 + 160) indexOfLastSampleOnOrBeforeTimestamp:*(void *)(a1 + 40)];
  *(void *)(a1 + 56) = v15;
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 160) sampleTimestamps];
    double v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 objectAtIndexedSubscript:*(void *)(a1 + 56)];
LABEL_24:
    double v19 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v17;
  }

  unint64_t v20 = *(void *)(a1 + 48);
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v21 = 0LL;
  }

  else
  {
    unint64_t v21 = 0LL;
    unint64_t v22 = *(void *)(a1 + 56);
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v23 = v22 >= v20;
      unint64_t v24 = v22 - v20;
      if (v23) {
        unint64_t v21 = v24 + 1;
      }
    }
  }

  *(void *)(a1 + 64) = v21;

LABEL_32:
  if (*v3 && *(void *)(a1 + 40))
  {
    if (objc_msgSend(*v3, "le:"))
    {
      uint64_t v25 = *(void *)(a1 + 160);
      v26 = +[SATimeRange timeRangeStart:end:]( &OBJC_CLASS___SATimeRange,  "timeRangeStart:end:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
      -[SASampleStore findTargetProcessInTimeRange:](v25, v26);
    }
  }

void __32__SASamplePrinter_updateIndexes__block_invoke(uint64_t a1, void *a2)
{
  id v20 = a2;
  [v20 taskStates];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    [v20 threads];
    double v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __32__SASamplePrinter_updateIndexes__block_invoke_2;
    v21[3] = &unk_189F637A0;
    __int128 v22 = *(_OWORD *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 48);
    [v12 enumerateKeysAndObjectsUsingBlock:v21];
    goto LABEL_18;
  }

  uint64_t v5 = [v20 indexOfFirstTaskStateOnOrAfterTime:*(void *)(*(void *)(a1 + 32) + 32) sampleIndex:0x7FFFFFFFFFFFFFFFLL];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v5;
    unint64_t v7 = [v20 indexOfLastTaskStateOnOrBeforeTime:*(void *)(*(void *)(a1 + 32) + 40) sampleIndex:0x7FFFFFFFFFFFFFFFLL];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 >= v6)
    {
      unint64_t v9 = v7;
      *(void *)(*(void *)(a1 + 32) + 64LL) += v7 - v6 + 1;
      [v20 taskStates];
      double v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 objectAtIndexedSubscript:v6];
      double v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 startTimestamp];
      double v12 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
      double v14 = *(void **)(v13 + 40);
      if (v14)
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
      }

      objc_storeStrong((id *)(v13 + 40), v12);
LABEL_12:
      [v20 taskStates];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 objectAtIndexedSubscript:v9];
      double v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 endTimestamp];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8LL);
      double v19 = *(void **)(v18 + 40);
      if (v19)
      {
        if (![v19 lt:v17])
        {
LABEL_16:

LABEL_18:
          goto LABEL_19;
        }

        uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8LL);
      }

      objc_storeStrong((id *)(v18 + 40), v17);
      goto LABEL_16;
    }
  }

void __32__SASamplePrinter_updateIndexes__block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  id v19 = a3;
  uint64_t v4 = [v19 indexOfFirstThreadStateOnOrAfterTime:*(void *)(a1[4] + 32) sampleIndex:0x7FFFFFFFFFFFFFFFLL];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    unint64_t v6 = [v19 indexOfLastThreadStateOnOrBeforeTime:*(void *)(a1[4] + 40) sampleIndex:0x7FFFFFFFFFFFFFFFLL];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL && v6 >= v5)
    {
      unint64_t v8 = v6;
      *(void *)(a1[4] + 64LL) += v6 - v5 + 1;
      [v19 threadStates];
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 objectAtIndexedSubscript:v5];
      double v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 startTimestamp];
      double v11 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v12 = *(void *)(a1[5] + 8LL);
      uint64_t v13 = *(void **)(v12 + 40);
      if (v13)
      {
        uint64_t v12 = *(void *)(a1[5] + 8LL);
      }

      objc_storeStrong((id *)(v12 + 40), v11);
LABEL_11:
      [v19 threadStates];
      double v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 objectAtIndexedSubscript:v8];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 endTimestamp];
      double v16 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v17 = *(void *)(a1[6] + 8LL);
      uint64_t v18 = *(void **)(v17 + 40);
      if (v18)
      {
        if (![v18 lt:v16])
        {
LABEL_15:

          goto LABEL_16;
        }

        uint64_t v17 = *(void *)(a1[6] + 8LL);
      }

      objc_storeStrong((id *)(v17 + 40), v16);
      goto LABEL_15;
    }
  }

- (void)filterToTimestampRangeStart:(id)a3 end:(id)a4
{
  unint64_t v6 = (SATimestamp *)a3;
  unint64_t v7 = (SATimestamp *)a4;
  self->_hasFilterApplied = 1;
  reportStartTime = self->_reportStartTime;
  self->_reportStartTime = v6;
  unint64_t v9 = v6;

  reportEndTime = self->_reportEndTime;
  self->_reportEndTime = v7;

  -[SASamplePrinter updateIndexes]((uint64_t)self);
}

- (void)filterToMachAbsTimeRangeStart:(unint64_t)a3 end:(unint64_t)a4
{
  self->_hasFilterApplied = 1;
  if (a3)
  {
    +[SATimestamp timestampWithMachAbsTime:machContTime:wallTime:machTimebase:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:",  a3,  0LL,  -[SASampleStore machTimebase](self->_sampleStore, "machTimebase"),  0.0);
    unint64_t v6 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
    reportStartTime = self->_reportStartTime;
    self->_reportStartTime = v6;
  }

  if (a4)
  {
    +[SATimestamp timestampWithMachAbsTime:machContTime:wallTime:machTimebase:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:",  a4,  0LL,  -[SASampleStore machTimebase](self->_sampleStore, "machTimebase"),  0.0);
    unint64_t v8 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
    reportEndTime = self->_reportEndTime;
    self->_reportEndTime = v8;
  }

  -[SASamplePrinter updateIndexes]((uint64_t)self);
}

- (void)filterToWallTimeRangeStart:(double)a3 end:(double)a4
{
  self->_hasFilterApplied = 1;
  if (a3 != 0.0)
  {
    +[SATimestamp timestampWithMachAbsTime:machContTime:wallTime:machTimebase:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:",  0LL,  0LL,  -[SASampleStore machTimebase](self->_sampleStore, "machTimebase"),  a3);
    unint64_t v6 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
    reportStartTime = self->_reportStartTime;
    self->_reportStartTime = v6;
  }

  if (a4 != 0.0)
  {
    +[SATimestamp timestampWithMachAbsTime:machContTime:wallTime:machTimebase:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:",  0LL,  0LL,  -[SASampleStore machTimebase](self->_sampleStore, "machTimebase"),  a4);
    unint64_t v8 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
    reportEndTime = self->_reportEndTime;
    self->_reportEndTime = v8;
  }

  -[SASamplePrinter updateIndexes]((uint64_t)self);
}

- (void)filterToDisplayTimeIndexStart:(unint64_t)a3 end:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (a4 && a4 < a3)
  {
    int v7 = *__error();
    _sa_logt();
    unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v28 = a3;
      __int16 v29 = 2048;
      unint64_t v30 = a4;
      _os_log_error_impl( &dword_186C92000,  v8,  OS_LOG_TYPE_ERROR,  "Passed invalid sample index range %lu-%lu",  buf,  0x16u);
    }

    *__error() = v7;
    return;
  }

  if (-[SASamplePrinter hasTimeIndexes]((uint64_t)self))
  {
    self->_hasFilterApplied = 1;
    if (a3)
    {
      else {
        unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (a4) {
        goto LABEL_12;
      }
    }

    else
    {
      unint64_t v9 = 0LL;
      if (a4)
      {
LABEL_12:
        else {
          unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        }
LABEL_20:
        -[SASampleStore sampleTimestamps](self->_sampleStore, "sampleTimestamps");
        double v14 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v15 = [v14 count];

        if (v10 >= v15)
        {
          int v23 = *__error();
          _sa_logt();
          unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            -[SASampleStore sampleTimestamps](self->_sampleStore, "sampleTimestamps");
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218496;
            unint64_t v28 = a3;
            __int16 v29 = 2048;
            unint64_t v30 = a4;
            __int16 v31 = 2048;
            uint64_t v32 = [v25 count];
            _os_log_error_impl( &dword_186C92000,  v24,  OS_LOG_TYPE_ERROR,  "Requested sample index range %lu-%lu outside valid range 1-%lu",  buf,  0x20u);
          }

          *__error() = v23;
        }

        else
        {
          self->_reportStartSampleIndex = v9;
          -[SASampleStore sampleTimestamps](self->_sampleStore, "sampleTimestamps");
          double v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 objectAtIndexedSubscript:v9];
          uint64_t v17 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
          reportStartTime = self->_reportStartTime;
          self->_reportStartTime = v17;

          self->_reportEndSampleIndex = v10;
          -[SASampleStore sampleTimestamps](self->_sampleStore, "sampleTimestamps");
          id v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 objectAtIndexedSubscript:v10];
          id v20 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
          reportEndTime = self->_reportEndTime;
          self->_reportEndTime = v20;

          self->_numSamples = self->_reportEndSampleIndex - self->_reportStartSampleIndex + 1;
          if (self->_reportStartTime && self->_reportEndTime)
          {
            sampleStore = self->_sampleStore;
            +[SATimeRange timeRangeStart:end:](&OBJC_CLASS___SATimeRange, "timeRangeStart:end:");
            id v26 = (id)objc_claimAutoreleasedReturnValue();
            -[SASampleStore findTargetProcessInTimeRange:]((uint64_t)sampleStore, v26);
          }
        }

        return;
      }
    }

    -[SASampleStore sampleTimestamps](self->_sampleStore, "sampleTimestamps");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v10 = [v13 count] - 1;

    goto LABEL_20;
  }

  int v11 = *__error();
  _sa_logt();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( &dword_186C92000,  v12,  OS_LOG_TYPE_ERROR,  "Requested sample index range on sample store without sample indexes",  buf,  2u);
  }

  *__error() = v11;
}

- (id)eventStartTimeWithWallTime
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 startTime];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || ([v3 wallTime], v4 == 0.0))
  {
    id v5 = *(id *)(a1 + 32);

    if (!v5 || ([v5 wallTime], v6 == 0.0))
    {
      id v7 = 0LL;
      goto LABEL_8;
    }

    v3 = v5;
  }

  id v7 = v3;
  id v5 = v7;
LABEL_8:

  return v7;
}

- (id)eventEndTimeWithWallTime
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 endTime];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || ([v3 wallTime], v4 == 0.0))
  {
    id v5 = *(id *)(a1 + 40);

    if (!v5 || ([v5 wallTime], v6 == 0.0))
    {
      id v7 = 0LL;
      goto LABEL_8;
    }

    v3 = v5;
  }

  id v7 = v3;
  id v5 = v7;
LABEL_8:

  return v7;
}

- (void)printToStream:(__sFILE *)a3
{
  double v4 = (SAOutputStream *)-[SAFileOutputStream initWithFileStream:]( objc_alloc(&OBJC_CLASS___SAFileOutputStream),  (uint64_t)a3);
  stream = self->_stream;
  self->_stream = v4;

  -[SASamplePrinter printReport]((uint64_t)self);
  double v6 = self->_stream;
  self->_stream = 0LL;
}

- (void)printReport
{
  uint64_t v614 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  context = (void *)MEMORY[0x186E47ACC]();
  if (!*(void *)(a1 + 8))
  {
    int v432 = *__error();
    _sa_logt();
    v230 = (__int128 *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v230, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v604 = 0;
      _os_log_error_impl(&dword_186C92000, (os_log_t)v230, OS_LOG_TYPE_ERROR, "nil stream", v604, 2u);
    }

    *__error() = v432;
    _SASetCrashLogMessage(1968, "nil stream", v433, v434, v435, v436, v437, v438, v465);
    _os_crash();
    __break(1u);
LABEL_477:
    uint64_t v408 = *__error();
    _sa_logt();
    v439 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v439, OS_LOG_TYPE_ERROR))
    {
      id v440 = [v497 debugDescription];
      uint64_t v441 = [v440 UTF8String];
      *(_DWORD *)v580 = 136315138;
      *(void *)((char *)v230 + 196) = v441;
      _os_log_error_impl( &dword_186C92000,  v439,  OS_LOG_TYPE_ERROR,  "%s: No main binary printing multiple tasks",  v580,  0xCu);
    }

    *__error() = v408;
    id v407 = [v497 debugDescription];
    char v442 = [v407 UTF8String];
    _SASetCrashLogMessage(5865, "%s: No main binary printing multiple tasks", v443, v444, v445, v446, v447, v448, v442);

    _os_crash();
    __break(1u);
    goto LABEL_480;
  }

  if ([*(id *)(a1 + 160) isEmpty])
  {
    BOOL v2 = *(void **)(a1 + 8);
    v3 = @"No samples\n";
LABEL_11:
    [v2 appendString:v3];
    goto LABEL_12;
  }

  if (-[SASamplePrinter hasTimeIndexes](a1))
  {
    unint64_t v4 = *(void *)(a1 + 48);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_10;
    }
    unint64_t v5 = *(void *)(a1 + 56);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL || v4 > v5) {
      goto LABEL_10;
    }
  }

  else if (!*(void *)(a1 + 64))
  {
LABEL_10:
    BOOL v2 = *(void **)(a1 + 8);
    v3 = @"No samples for specified time interval\n";
    goto LABEL_11;
  }

  if (!*(void *)(a1 + 32))
  {
    int v449 = *__error();
    _sa_logt();
    v450 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v450, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v604 = 0;
      _os_log_error_impl(&dword_186C92000, v450, OS_LOG_TYPE_ERROR, "nil reportStartTime", v604, 2u);
    }

    *__error() = v449;
    _SASetCrashLogMessage(1990, "nil reportStartTime", v451, v452, v453, v454, v455, v456, v465);
    _os_crash();
    __break(1u);
LABEL_484:
    int v457 = *__error();
    _sa_logt();
    v458 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v458, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v604 = 0;
      _os_log_error_impl(&dword_186C92000, v458, OS_LOG_TYPE_ERROR, "nil reportEndTime", v604, 2u);
    }

    *__error() = v457;
    _SASetCrashLogMessage(1991, "nil reportEndTime", v459, v460, v461, v462, v463, v464, v465);
    _os_crash();
    __break(1u);
  }

  if (!*(void *)(a1 + 40)) {
    goto LABEL_484;
  }
  [*(id *)(a1 + 160) symbolicate];
  double v6 = *(void **)(a1 + 160);
  uint64_t v541 = MEMORY[0x1895F87A8];
  uint64_t v542 = 3221225472LL;
  v543 = __29__SASamplePrinter_preprocess__block_invoke;
  v544 = &unk_189F61C78;
  uint64_t v540 = a1;
  uint64_t v545 = a1;
  [v6 enumerateTasks:&v541];
  [*(id *)(a1 + 160) exclaves];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = v7 == 0LL;

  if (!v8)
  {
    -[SASampleStore lastTaskWithPid:](*(void **)(a1 + 160), 0LL);
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[SASamplePrinter binaryImagesHitByTask:](a1, v9);
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(void *)v562 = MEMORY[0x1895F87A8];
      uint64_t v563 = 3221225472LL;
      uint64_t v564 = (uint64_t)__29__SASamplePrinter_preprocess__block_invoke_2;
      v565 = (uint64_t (*)(uint64_t, uint64_t))&unk_189F639E8;
      v566 = (void (*)(uint64_t))a1;
      id v11 = v10;
      id v567 = v11;
      -[SATask enumerateFrames:]((uint64_t)v9, v562);
      __int128 v578 = 0u;
      __int128 v579 = 0u;
      __int128 v576 = 0u;
      __int128 v577 = 0u;
      [*(id *)(a1 + 160) exclaves];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v12 countByEnumeratingWithState:&v576 objects:&v600 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v577;
        do
        {
          for (uint64_t i = 0LL; i != v13; ++i)
          {
            if (*(void *)v577 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void *)(*((void *)&v576 + 1) + 8 * i);
            uint64_t v556 = MEMORY[0x1895F87A8];
            uint64_t v557 = 3221225472LL;
            uint64_t v558 = (uint64_t)__29__SASamplePrinter_preprocess__block_invoke_3;
            v559 = (uint64_t (*)(uint64_t, uint64_t))&unk_189F639E8;
            v560 = (void (*)(uint64_t))a1;
            id v561 = v11;
            -[SAExclave enumerateFrames:](v16, &v556);
          }

          uint64_t v13 = [v12 countByEnumeratingWithState:&v576 objects:&v600 count:16];
        }

        while (v13);
      }

      -[SASamplePrinter sortedLoadInfosForBinaryImages:](a1, v11);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASamplePrinter avoidOverlapInBinaryLoadInfos:onlyExclaves:inTask:](a1, v17, 1, v9);
    }

    else
    {
      int v18 = *__error();
      _sa_logt();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v604 = 0;
        _os_log_fault_impl( &dword_186C92000,  v19,  OS_LOG_TYPE_FAULT,  "no kernel task, though there are exclaves",  v604,  2u);
      }

      *__error() = v18;
    }
  }

  [*(id *)(v540 + 160) cpuSignalHandlerStackLeafKernelFrame];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v21 = v20 == 0LL;

  if (v21) {
    [*(id *)(v540 + 160) findCpuSignalHandlerStackLeafKernelFrame];
  }
  [*(id *)(v540 + 160) attemptedSamplingInterval];
  if (v22 != 0.0
    && -[SASamplePrinter hasTimeIndexes](v540)
    && ([*(id *)(v540 + 160) sampleTimestamps],
        int v23 = (void *)objc_claimAutoreleasedReturnValue(),
        BOOL v24 = (unint64_t)[v23 count] > 1,
        v23,
        v24))
  {
    id v25 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v26 = *(void **)(v540 + 96);
    *(void *)(v540 + 96) = v25;

    *(void *)(v540 + 88) = 0LL;
    __int128 v593 = 0u;
    __int128 v594 = 0u;
    __int128 v595 = 0u;
    __int128 v596 = 0u;
    [*(id *)(v540 + 160) sampleTimestamps];
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [v27 countByEnumeratingWithState:&v593 objects:v604 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v594;
      double v30 = 0.0;
      do
      {
        for (uint64_t j = 0LL; j != v28; ++j)
        {
          if (*(void *)v594 != v29) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void **)(*((void *)&v593 + 1) + 8 * j);
          [v32 machAbsTimeSeconds];
          if (v30 > 0.0)
          {
            double v34 = v33 - v30;
            double v35 = *(double *)(v540 + 88);
            if (v35 > v34 || v35 == 0.0) {
              *(double *)(v540 + 88) = v34;
            }
          }

          [v32 machAbsTimeSeconds];
          double v30 = v36;
        }

        uint64_t v28 = [v27 countByEnumeratingWithState:&v593 objects:v604 count:16];
      }

      while (v28);
    }

    double v37 = *(double *)(v540 + 88);
    [*(id *)(v540 + 160) attemptedSamplingInterval];
    if (v37 < v38)
    {
      [*(id *)(v540 + 160) attemptedSamplingInterval];
      *(void *)(v540 + 88) = v39;
    }

    *(void *)&__int128 v586 = 0LL;
    *((void *)&v586 + 1) = &v586;
    *(void *)&__int128 v587 = 0x3032000000LL;
    *((void *)&v587 + 1) = __Block_byref_object_copy__4;
    *(void *)&__int128 v588 = __Block_byref_object_dispose__4;
    *((void *)&v588 + 1) = 0LL;
    [*(id *)(v540 + 160) sampleTimestamps];
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)&__int128 v572 = MEMORY[0x1895F87A8];
    *((void *)&v572 + 1) = 3221225472LL;
    *(void *)&__int128 v573 = __37__SASamplePrinter_calculateTimeJumps__block_invoke;
    *((void *)&v573 + 1) = &unk_189F63778;
    *((void *)&v574 + 1) = &v586;
    *(void *)&__int128 v574 = v540;
    [v40 enumerateObjectsUsingBlock:&v572];

    _Block_object_dispose(&v586, 8);
  }

  else
  {
    v41 = *(void **)(v540 + 96);
    *(void *)(v540 + 96) = 0LL;
  }

  uint64_t v42 = *(void **)(v540 + 128);
  location = (id *)(v540 + 128);
  *(void *)(v540 + 128) = 0LL;

  v43 = *(void **)(v540 + 136);
  *(void *)(v540 + 136) = 0LL;

  if ([*(id *)(v540 + 160) targetHIDEventMachAbs])
  {
    __int128 v574 = 0u;
    __int128 v575 = 0u;
    __int128 v572 = 0u;
    __int128 v573 = 0u;
    [*(id *)(v540 + 160) hidEvents];
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v44 = [obj countByEnumeratingWithState:&v572 objects:v604 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v573;
      while (2)
      {
        for (uint64_t k = 0LL; k != v44; ++k)
        {
          if (*(void *)v573 != v45) {
            objc_enumerationMutation(obj);
          }
          id v47 = *(void **)(*((void *)&v572 + 1) + 8 * k);
          [v47 hidEventTimestamp];
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v49 = [v48 machAbsTime];
          if (v49 == [*(id *)(v540 + 160) targetHIDEventMachAbs])
          {
            if (!*location && ([*(id *)(v540 + 160) targetProcessId] & 0x80000000) != 0)
            {

LABEL_67:
              objc_storeStrong((id *)(v540 + 112), v47);
              uint64_t v54 = *(void *)(v540 + 160);
              if (v54 && (*(_BYTE *)(v54 + 326) & 1) != 0)
              {
                id v55 = objc_alloc_init(MEMORY[0x189603FA8]);
                v56 = *(void **)(v540 + 120);
                *(void *)(v540 + 120) = v55;

                id v504 = objc_alloc_init(MEMORY[0x189603FC8]);
                [v47 hidEventTimestamp];
                v57 = (char *)objc_claimAutoreleasedReturnValue();
                unint64_t v58 = [*(id *)(v540 + 160) indexOfLastSampleOnOrBeforeTimestamp:v57];
                __int128 v598 = 0u;
                __int128 v599 = 0u;
                memset(v597, 0, sizeof(v597));
                [*(id *)(v540 + 112) steps];
                id v510 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v516 = [v510 countByEnumeratingWithState:v597 objects:&v593 count:16];
                if (v516)
                {
                  unint64_t v501 = 0LL;
                  id v513 = **(id **)&v597[16];
                  do
                  {
                    uint64_t v59 = 0LL;
                    inited = v57;
                    do
                    {
                      if (**(id **)&v597[16] != v513)
                      {
                        uint64_t v60 = v59;
                        objc_enumerationMutation(v510);
                        uint64_t v59 = v60;
                      }

                      uint64_t v522 = v59;
                      v61 = *(void **)(*(void *)&v597[8] + 8 * v59);
                      v62 = *(void **)(v540 + 160);
                      [v61 timestamp];
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      id v525 = (id)[v62 indexOfLastSampleOnOrBeforeTimestamp:v63];

                      if (v525 != (id)0x7FFFFFFFFFFFFFFFLL
                        && (v58 == 0x7FFFFFFFFFFFFFFFLL || v58 < (unint64_t)v525))
                      {
                        v64 = *(void **)(v540 + 160);
                        uint64_t v65 = [v61 pid];
                        uint64_t v66 = [v61 tid];
                        [v61 timestamp];
                        v67 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SASampleStore taskWithPid:orTid:atTimestamp:](v64, v65, v66, v67);
                        id v519 = (id)objc_claimAutoreleasedReturnValue();

                        if (v519)
                        {
                          if (v58 == 0x7FFFFFFFFFFFFFFFLL) {
                            unint64_t v68 = 0LL;
                          }
                          else {
                            unint64_t v68 = v58 + 1;
                          }
                          unint64_t v507 = v68;
                          if ([v61 tid])
                          {
                            [v519 threads];
                            v69 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v61, "tid"));
                            v70 = (void *)objc_claimAutoreleasedReturnValue();
                            [v69 objectForKeyedSubscript:v70];
                            id v531 = (id)objc_claimAutoreleasedReturnValue();

                            if (!v531)
                            {
                              int v71 = *__error();
                              _sa_logt();
                              v72 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                              {
                                uint64_t v105 = [v61 tid];
                                [v519 debugDescription];
                                v106 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 134218242;
                                *(void *)&uint8_t buf[4] = v105;
                                *(_WORD *)&buf[12] = 2112;
                                *(void *)&buf[14] = v106;
                                _os_log_error_impl( &dword_186C92000,  v72,  OS_LOG_TYPE_ERROR,  "No thread %llu in %@ for hid event",  buf,  0x16u);
                              }

                              id v531 = 0LL;
                              *__error() = v71;
                            }
                          }

                          else
                          {
                            [v519 mainThread];
                            id v531 = (id)objc_claimAutoreleasedReturnValue();
                            if (!v531)
                            {
                              __int128 v570 = 0u;
                              __int128 v571 = 0u;
                              __int128 v568 = 0u;
                              __int128 v569 = 0u;
                              [v519 threads];
                              v77 = (void *)objc_claimAutoreleasedReturnValue();
                              uint64_t v78 = [v77 countByEnumeratingWithState:&v568 objects:&v586 count:16];
                              if (v78)
                              {
                                id v531 = 0LL;
                                unint64_t v79 = 0LL;
                                uint64_t v80 = *(void *)v569;
                                do
                                {
                                  for (uint64_t m = 0LL; m != v78; ++m)
                                  {
                                    if (*(void *)v569 != v80) {
                                      objc_enumerationMutation(v77);
                                    }
                                    v82 = *(void **)(*((void *)&v568 + 1) + 8 * m);
                                    [v82 firstThreadStateOnOrAfterTime:inited sampleIndex:0x7FFFFFFFFFFFFFFFLL];
                                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                                    [v61 timestamp];
                                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                                    [v82 lastThreadStateOnOrBeforeTime:v84 sampleIndex:0x7FFFFFFFFFFFFFFFLL];
                                    v85 = (void *)objc_claimAutoreleasedReturnValue();

                                    if (v85) {
                                      BOOL v86 = v83 == 0LL;
                                    }
                                    else {
                                      BOOL v86 = 1;
                                    }
                                    if (!v86)
                                    {
                                      unint64_t v87 = [v85 cpuTimeNs];
                                      if (v87 > [v83 cpuTimeNs])
                                      {
                                        uint64_t v88 = [v85 cpuTimeNs];
                                        if (v79 < v88 - [v83 cpuTimeNs])
                                        {
                                          uint64_t v89 = [v85 cpuTimeNs];
                                          uint64_t v90 = [v83 cpuTimeNs];
                                          id v91 = v82;

                                          unint64_t v79 = v89 - v90;
                                          id v531 = v91;
                                        }
                                      }
                                    }
                                  }

                                  uint64_t v78 = [v77 countByEnumeratingWithState:&v568 objects:&v586 count:16];
                                }

                                while (v78);
                              }

                              else
                              {
                                id v531 = 0LL;
                              }
                            }
                          }

                          v92 = objc_alloc(&OBJC_CLASS___SAHIDStepSample);
                          uint64_t v93 = [v61 tid];
                          [v61 timestamp];
                          v94 = (void *)objc_claimAutoreleasedReturnValue();
                          id v95 = v519;
                          v96 = inited;
                          id v97 = v94;
                          if (v92)
                          {
                            *(void *)buf = v92;
                            *(void *)&buf[8] = &OBJC_CLASS___SAHIDStepSample;
                            v98 = (SAHIDStepSample *)objc_msgSendSuper2((objc_super *)buf, sel_init);
                            v92 = v98;
                            if (v98)
                            {
                              objc_storeStrong((id *)&v98->_task, v519);
                              v92->_threadId = v93;
                              objc_storeStrong((id *)&v92->_startTimestamp, inited);
                              objc_storeStrong((id *)&v92->_endTimestamp, v94);
                              v92->_startSampleIndex = v507;
                              v92->_endSampleIndex = (unint64_t)v525;
                            }
                          }

                          [*(id *)(v540 + 120) addObject:v92];
                          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v61, "tid"));
                          v99 = (void *)objc_claimAutoreleasedReturnValue();
                          [v504 objectForKeyedSubscript:v99];
                          v100 = (void *)objc_claimAutoreleasedReturnValue();
                          uint64_t v101 = [v100 unsignedLongValue];

                          unint64_t v102 = (unint64_t)v525 + v101 - v507 + 1;
                          [MEMORY[0x189607968] numberWithUnsignedInteger:v102];
                          v103 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v61, "tid"));
                          v104 = (void *)objc_claimAutoreleasedReturnValue();
                          [v504 setObject:v103 forKeyedSubscript:v104];

                          if (v102 > v501)
                          {
                            objc_storeStrong(location, v519);
                            objc_storeStrong((id *)(v540 + 136), v531);
                            unint64_t v501 = v102;
                          }
                        }

                        else
                        {
                          int v73 = *__error();
                          _sa_logt();
                          v74 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
                          {
                            int v75 = [v61 pid];
                            uint64_t v76 = [v61 tid];
                            *(_DWORD *)buf = 67109376;
                            *(_DWORD *)&uint8_t buf[4] = v75;
                            *(_WORD *)&buf[8] = 2048;
                            *(void *)&buf[10] = v76;
                            _os_log_impl( &dword_186C92000,  v74,  OS_LOG_TYPE_INFO,  "No process [%d] with thread %llu for hid event",  buf,  0x12u);
                          }

                          *__error() = v73;
                        }

                        unint64_t v58 = (unint64_t)v525;
                      }

                      [v61 timestamp];
                      v57 = (char *)objc_claimAutoreleasedReturnValue();

                      uint64_t v59 = v522 + 1;
                      inited = v57;
                    }

                    while (v522 + 1 != v516);
                    uint64_t v516 = [v510 countByEnumeratingWithState:v597 objects:&v593 count:16];
                  }

                  while (v516);
                }
              }

              goto LABEL_117;
            }

            [v47 steps];
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            [v50 lastObject];
            id v51 = (void *)objc_claimAutoreleasedReturnValue();
            int v52 = [v51 pid];
            BOOL v53 = v52 == [*(id *)(v540 + 160) targetProcessId];

            if (v53) {
              goto LABEL_67;
            }
          }

          else
          {
          }
        }

        uint64_t v44 = [obj countByEnumeratingWithState:&v572 objects:v604 count:16];
        if (v44) {
          continue;
        }
        break;
      }
    }

- (void)printToMutableData:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (SAOutputStream *)-[SAMutableDataOutputStream initWithMutableData:]( (id *)objc_alloc(&OBJC_CLASS___SAMutableDataOutputStream),  v4);

  streauint64_t m = self->_stream;
  self->_streauint64_t m = v5;

  -[SASamplePrinter printReport]((uint64_t)self);
  id v7 = self->_stream;
  self->_streauint64_t m = 0LL;
}

- (uint64_t)checkForBadOptions
{
  uint64_t v108 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if ((unint64_t)[*(id *)(a1 + 16) callTreeAggregation] >= 4)
  {
    uint64_t v12 = *(void **)(a1 + 8);
    if (!v12)
    {
      int v15 = *__error();
      _sa_logt();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = [*(id *)(a1 + 16) callTreeAggregation];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v43;
        _os_log_error_impl(&dword_186C92000, v16, OS_LOG_TYPE_ERROR, "unknown callTreeAggregation %llu", buf, 0xCu);
      }

      goto LABEL_27;
    }

    uint64_t v93 = [*(id *)(a1 + 16) callTreeAggregation];
    uint64_t v13 = @"unknown callTreeAggregation %llu";
  }

  else
  {
    if ((unint64_t)[*(id *)(a1 + 16) swiftAsyncCallTreeAggregation] < 6)
    {
      uint64_t v2 = *(void *)(a1 + 16);
      if (!v2
        || (uint64_t v3 = *(void *)(v2 + 168), v3 == 1)
        || !v3 && !*(_BYTE *)(v2 + 11)
        || (uint64_t v4 = *(void *)(v2 + 152), v4 == 3)
        || !v4 && *(_BYTE *)(v2 + 11))
      {
        [*(id *)(a1 + 160) targetProcess];
        unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
        if ([*(id *)(a1 + 160) targetDispatchQueueId])
        {
          if (!v5)
          {
            uint64_t v29 = *(void **)(a1 + 8);
            if (v29)
            {
              objc_msgSend( v29,  "printWithFormat:",  @"targeting dispatch queue %llu, but no target task",  objc_msgSend(*(id *)(a1 + 160), "targetDispatchQueueId"));
            }

            else
            {
              int v40 = *__error();
              _sa_logt();
              v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                uint64_t v70 = [*(id *)(a1 + 160) targetDispatchQueueId];
                *(_DWORD *)buf = 134217984;
                *(void *)&uint8_t buf[4] = v70;
                _os_log_error_impl( &dword_186C92000,  v41,  OS_LOG_TYPE_ERROR,  "targeting dispatch queue %llu, but no target task",  buf,  0xCu);
              }

              *__error() = v40;
            }

            goto LABEL_76;
          }

          [v5 dispatchQueues];
          double v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  objc_msgSend(*(id *)(a1 + 160), "targetDispatchQueueId"));
          id v7 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 objectForKeyedSubscript:v7];
          BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v8)
          {
            unint64_t v9 = *(void **)(a1 + 8);
            if (v9)
            {
              uint64_t v10 = [*(id *)(a1 + 160) targetDispatchQueueId];
              -[SASamplePrinter displayNameForTask:]((void *)a1, v5);
              id v11 = (void *)objc_claimAutoreleasedReturnValue();
              [v9 printWithFormat:@"targeting dispatch queue %llu in %@ but no such dispatch queue found", v10, v11];
            }

            else
            {
              int v44 = *__error();
              _sa_logt();
              uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                uint64_t v73 = [*(id *)(a1 + 160) targetDispatchQueueId];
                v74 = -[SASamplePrinter displayNameForTask:]((void *)a1, v5);
                *(_DWORD *)buf = 134218242;
                *(void *)&uint8_t buf[4] = v73;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v74;
                _os_log_error_impl( &dword_186C92000,  v45,  OS_LOG_TYPE_ERROR,  "targeting dispatch queue %llu in %@ but no such dispatch queue found",  buf,  0x16u);
              }

              *__error() = v44;
            }

- (id)displayNameForTask:(void *)a1
{
  if (a1)
  {
    a1 = -[SASamplePrinter displayNameForTask:includePid:](a1, a2, 1);
  }

  return a1;
}

void __37__SASamplePrinter_checkForBadOptions__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

void __37__SASamplePrinter_checkForBadOptions__block_invoke_275(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  double v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  id v14 = v5;
  if (v6)
  {
    [v5 threadState];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 startTimestamp];
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = [v6 gt:v8];

    id v5 = v14;
    if (v9)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      *a3 = 1;
    }
  }

  [v5 threadState];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 endTimestamp];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

- (__CFString)displayNameForDispatchQueue:(void *)a1
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    [v1 dispatchQueueLabel];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

    id v4 = objc_alloc(NSString);
    if (v3)
    {
      [v2 dispatchQueueLabel];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      SACopySanitizedString(v5, 1, 0LL);
      double v6 = (void *)objc_claimAutoreleasedReturnValue();
      id v7 = (__CFString *)[v4 initWithFormat:@"%@(%llu)", v6, objc_msgSend(v2, "identifier")];
    }

    else
    {
      id v7 = (__CFString *)objc_msgSend(v4, "initWithFormat:", @"%llu", objc_msgSend(v2, "identifier"));
    }
  }

  else
  {
    id v7 = @"none";
  }

  return v7;
}

- (void)printHeader
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v1381 = *MEMORY[0x1895F89C0];
  uint64_t v1256 = v0;
  int v1208 = [*(id *)(v0 + 16) printJson];
  if (v1208)
  {
    id v1 = *(void **)(v0 + 8);
    [MEMORY[0x189607968] numberWithUnsignedInt:55];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryFirstEntry(v1, (uint64_t)@"reportVersion", v2);

    uint64_t v0 = v1256;
  }
  v1192 = -[SASamplePrinter eventStartTimeWithWallTime](v0);
  if (v1192 && ([*(id *)(v1256 + 16) omitAbsoluteWallTimes] & 1) == 0)
  {
    id v20 = *(void **)(v1256 + 8);
    if (v1208)
    {
      SAJSONWriteDictionaryEntry(*(void **)(v1256 + 8), @"startTime", v1192);
    }

    else
    {
      [v1192 wallTime];
      double v22 = v21;
      else {
        int v23 = 3;
      }
      uint64_t v24 = (__CFString *)_CopyStringForTime(v23, v22);
      [v20 printWithFormat:@"%-*s%@\n", 18, "Date/Time: ", v24];
    }
  }

  else
  {
    objc_msgSend(*(id *)(v1256 + 8), "printWithFormat:", @"%-*sUNKNOWN\n", 18, "Date/Time: ");
  }
  v1183 = -[SASamplePrinter eventEndTimeWithWallTime](v1256);
  BOOL v3 = v1192 == 0LL;
  if (!v1183) {
    BOOL v3 = 1;
  }
  if (v3
    || ([v1183 wallTime], double v5 = v4, objc_msgSend(v1192, "wallTime"), v5 <= v6)
    || ([*(id *)(v1256 + 16) omitAbsoluteWallTimes] & 1) != 0)
  {
    if (v1208) {
      goto LABEL_12;
    }
LABEL_32:
    double v30 = (id *)(v1256 + 160);
    uint64_t v31 = [*(id *)(v1256 + 160) osProductName];
    uint64_t v32 = (void *)v31;
    uint64_t v33 = @"???";
    if (v31) {
      uint64_t v33 = (__CFString *)v31;
    }
    uint64_t v19 = v33;

    uint64_t v34 = [*v30 osProductVersion];
    double v35 = (void *)v34;
    double v36 = @"???";
    if (v34) {
      double v36 = (__CFString *)v34;
    }
    double v37 = v36;

    uint64_t v38 = [*v30 osBuildVersion];
    uint64_t v39 = (void *)v38;
    int v40 = @"???";
    if (v38) {
      int v40 = (__CFString *)v38;
    }
    v41 = v40;

    uint64_t v17 = v1256;
    [*(id *)(v1256 + 8) printWithFormat:@"%-*s%@ %@", 18, "OS Version: ", v19, v37];
    [*(id *)(v1256 + 8) printWithFormat:@" (Build %@)\n", v41];

    goto LABEL_39;
  }

  uint64_t v25 = *(void **)(v1256 + 8);
  if (!v1208)
  {
    [v1183 wallTime];
    double v27 = v26;
    else {
      int v28 = 3;
    }
    uint64_t v29 = (__CFString *)_CopyStringForTime(v28, v27);
    [v25 printWithFormat:@"%-*s%@\n", 18, "End time: ", v29];

    goto LABEL_32;
  }

  SAJSONWriteDictionaryEntry(*(void **)(v1256 + 8), @"endTime", v1183);
LABEL_12:
  [*(id *)(v1256 + 160) osProductName];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    BOOL v8 = *(void **)(v1256 + 8);
    [*(id *)(v1256 + 160) osProductName];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v8, @"osProductName", v9);
  }

  [*(id *)(v1256 + 160) osProductVersion];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    uint64_t v11 = *(void **)(v1256 + 8);
    [*(id *)(v1256 + 160) osProductVersion];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v11, @"osProductVersion", v12);
  }

  [*(id *)(v1256 + 160) osProductVersionExtra];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    id v14 = *(void **)(v1256 + 8);
    [*(id *)(v1256 + 160) osProductVersionExtra];
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v14, @"osProductVersionExtra", v15);
  }

  [*(id *)(v1256 + 160) osBuildVersion];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = v1256;
  if (v16)
  {
    int v18 = *(void **)(v1256 + 8);
    [*(id *)(v1256 + 160) osBuildVersion];
    uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v18, @"osBuildVersion", v19);
    uint64_t v17 = v1256;
LABEL_39:
  }

  v1217 = (id *)(v17 + 160);
  [*(id *)(v17 + 160) machineArchitecture];
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  v1178 = v42;
  if (v42 && [v42 length])
  {
    uint64_t v43 = v1256;
    int v44 = *(void **)(v1256 + 8);
    if (v1208)
    {
      SAJSONWriteDictionaryEntry(v44, @"arch", v1178);
      goto LABEL_49;
    }

    [v44 printWithFormat:@"%-*s%@\n", 18, "Architecture: ", v1178];
  }

  else
  {
    uint64_t v43 = v1256;
    if ((v1208 & 1) != 0) {
      goto LABEL_49;
    }
  }

  objc_msgSend(*(id *)(v43 + 8), "printWithFormat:", @"%-*s%d\n", 18, "Report Version: ", 55);
LABEL_49:
  uint64_t v45 = *(void **)(v43 + 176);
  if (v45)
  {
    int v46 = *(void **)(v43 + 8);
    [v45 UUIDString];
    id v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if ((v1208 & 1) != 0)
    {
      SAJSONWriteDictionaryEntry(v46, @"incidentIdentifier", v47);

      uint64_t v43 = v1256;
      uint64_t v49 = (id *)(v17 + 160);
      if (!*(_BYTE *)(v1256 + 152)) {
        goto LABEL_59;
      }
LABEL_55:
      SAJSONWriteDictionaryEntry(*(void **)(v43 + 8), @"shareWithAppDevs", MEMORY[0x189604A88]);
      goto LABEL_59;
    }

    [v46 printWithFormat:@"%-*s%@\n", 18, "Incident Identifier: ", v47];

    uint64_t v43 = v1256;
    uint64_t v49 = (id *)(v17 + 160);
    if (!*(_BYTE *)(v1256 + 152))
    {
LABEL_58:
      [*(id *)(v43 + 8) appendString:@"\n"];
      goto LABEL_59;
    }

- (BOOL)taskHasSwallowedAnExceptionNotedByHIException:(BOOL)a1
{
  id v3 = a2;
  double v4 = v3;
  if (a1)
  {
    uint64_t v8 = 0LL;
    int v9 = &v8;
    uint64_t v10 = 0x2020000000LL;
    char v11 = 0;
    [v3 threads];
    double v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __65__SASamplePrinter_taskHasSwallowedAnExceptionNotedByHIException___block_invoke;
    v7[3] = &unk_189F61C28;
    v7[4] = a1;
    v7[5] = &v8;
    [v5 enumerateKeysAndObjectsUsingBlock:v7];

    a1 = *((_BYTE *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }

  return a1;
}

void __65__SASamplePrinter_taskHasSwallowedAnExceptionNotedByHIException___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  _BYTE *a4)
{
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v9 = v6;
    [v6 name];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = [v7 hasPrefix:@"HIE: "];

    double v6 = v9;
    if (v8)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      *a4 = 1;
    }
  }
}

void __60__SASamplePrinter_printProcessesWithHIESwallowedExceptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = v3;
  if (*(id *)(a1 + 32) != v3)
  {
    id v9 = v3;
    if ([v3 rpid] == *(_DWORD *)(a1 + 56)
      || (v5 = [v9 ppid], double v4 = v9, v5 == *(_DWORD *)(a1 + 56)))
    {
      BOOL v6 = -[SASamplePrinter taskHasSwallowedAnExceptionNotedByHIException:](*(void *)(a1 + 40), v9);
      double v4 = v9;
      if (v6)
      {
        id v7 = *(void **)(a1 + 48);
        -[SASamplePrinter displayNameForTask:](*(void **)(a1 + 40), v9);
        int v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 addObject:v8];

        double v4 = v9;
      }
    }
  }
}

void __58__SASamplePrinter_printLaunchdThrottledProcessesToStream___block_invoke(uint64_t a1, void *a2)
{
  id v25 = a2;
  uint64_t v3 = [v25 name];
  double v4 = (void *)v3;
  if (*(_BYTE *)(a1 + 64))
  {
    unint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48LL);
    unint64_t v6 = [v25 startSampleIndex];
    if (v5 <= v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = v5;
    }
    unint64_t v8 = *(void *)(*(void *)(a1 + 32) + 56LL);
    unint64_t v9 = [v25 endSampleIndex];
    if (v8 >= v9) {
      unint64_t v8 = v9;
    }
    if (!v4) {
      goto LABEL_14;
    }
  }

  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v3)
    {
LABEL_14:
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8LL);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = 0LL;

      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8LL);
      int v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = 0LL;

      goto LABEL_19;
    }
  }

  if (([v4 containsString:@"throttled"] & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (v10 && [v10 isEqual:v4])
  {
    [v25 endTimestamp];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setEndTime:v11];

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setEndSampleIndex:v8];
  }

  else
  {
    uint64_t v16 = objc_alloc(&OBJC_CLASS___SATimeRangeOfSamples);
    [v25 startTimestamp];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 endTimestamp];
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = -[SATimeRangeOfSamples initWithStartTime:endTime:startSampleIndex:endSampleIndex:]( v16,  "initWithStartTime:endTime:startSampleIndex:endSampleIndex:",  v17,  v18,  v7,  v8);
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8LL);
    double v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v4);
    [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
    double v22 = (void *)objc_claimAutoreleasedReturnValue();
    int v23 = v22;
    if (v22)
    {
      [v22 addObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    }

    else
    {
      uint64_t v24 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithObjects:",  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40),  0);
      [*(id *)(a1 + 40) setObject:v24 forKeyedSubscript:v4];
    }
  }

void __58__SASamplePrinter_printLaunchdThrottledProcessesToStream___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  [v7 appendFormat:@"%@", v5];
  if (*(_BYTE *)(a1 + 48))
  {
    id v44 = v5;
    [v7 appendFormat:@":"];
    uint64_t v8 = *(void *)(a1 + 32);
    id v45 = v6;
    uint64_t v46 = a1;
    if (*(_BYTE *)(a1 + 49))
    {
      unint64_t v9 = *(void *)(v8 + 48);
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        int v13 = 0;
        uint64_t v14 = *(void *)v54;
        do
        {
          for (uint64_t i = 0LL; i != v12; ++i)
          {
            if (*(void *)v54 != v14) {
              objc_enumerationMutation(v10);
            }
            uint64_t v16 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            if ([v16 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL
              && [v16 endSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
            {
              obuint64_t j = v13;
              if (v13 >= 1) {
                [v7 appendFormat:@","];
              }
              if (v9 < [v16 startSampleIndex])
              {
                uint64_t v17 = [v16 startSampleIndex] - 1;
                uint64_t v18 = -[SASamplePrinter displayTimeIndexForSampleIndex:](*(void *)(v46 + 32), v9);
                if (v9 == v17) {
                  objc_msgSend(v7, "appendFormat:", @" not throttled sample %lu,", v18, v43);
                }
                else {
                  objc_msgSend( v7,  "appendFormat:",  @" not throttled samples %lu-%lu,",  v18,  -[SASamplePrinter displayTimeIndexForSampleIndex:]( *(void *)(v46 + 32),  objc_msgSend(v16, "startSampleIndex") - 1));
                }
              }

              unint64_t v19 = [v16 startSampleIndex];
              unint64_t v20 = [v16 endSampleIndex];
              uint64_t v21 = -[SASamplePrinter displayTimeIndexForSampleIndex:]( *(void *)(v46 + 32),  [v16 startSampleIndex]);
              uint64_t v22 = v21;
              if (v19 >= v20)
              {
                objc_msgSend(v7, "appendFormat:", @" throttled sample %lu", v21);
              }

              else
              {
                uint64_t v43 = -[SASamplePrinter displayTimeIndexForSampleIndex:]( *(void *)(v46 + 32),  [v16 endSampleIndex]);
                objc_msgSend(v7, "appendFormat:", @" throttled samples %lu-%lu", v22);
              }

              unint64_t v9 = [v16 endSampleIndex] + 1;
              int v13 = obj + 1;
            }
          }

          uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v58 count:16];
        }

        while (v12);
      }

      id v6 = v45;
      a1 = v46;
      uint64_t v23 = *(void *)(v46 + 32);
      unint64_t v24 = *(void *)(v23 + 56);
      id v5 = v44;
      if (v9 <= v24)
      {
        if (-[SASamplePrinter hasTimeIndexes](*(void *)(v46 + 32)))
        {
          uint64_t v25 = v9 + 1;
        }

        else
        {
          uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
        }

        if (v9 == v24) {
          objc_msgSend(v7, "appendFormat:", @", not throttled sample %lu", v25, v43);
        }
        else {
          objc_msgSend( v7,  "appendFormat:",  @", not throttled samples %lu-%lu",  v25,  -[SASamplePrinter displayTimeIndexForSampleIndex:]( *(void *)(v46 + 32),  *(void *)(*(void *)(v46 + 32) + 56)));
        }
        id v6 = v45;
      }
    }

    else
    {
      id v26 = *(id *)(v8 + 32);
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      id obja = v6;
      uint64_t v27 = [obja countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        int v29 = 0;
        uint64_t v30 = *(void *)v50;
        do
        {
          uint64_t v31 = 0LL;
          int v32 = v29;
          uint64_t v33 = v26;
          do
          {
            if (*(void *)v50 != v30) {
              objc_enumerationMutation(obja);
            }
            uint64_t v34 = *(void **)(*((void *)&v49 + 1) + 8 * v31);
            [v34 startTime];
            double v35 = (void *)objc_claimAutoreleasedReturnValue();
            [v33 deltaSecondsTo:v35 timeDomainPriorityList:&unk_189F825E8 timeDomainUsed:0];
            double v37 = v36;

            if (v37 > 0.0) {
              [v7 appendFormat:@" not throttled %.2fs,", *(void *)&v37];
            }
            [v34 startTime];
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
            [v34 endTime];
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
            [v38 deltaSecondsTo:v39 timeDomainPriorityList:&unk_189F82600 timeDomainUsed:0];
            double v41 = v40;

            if (v41 > 0.0) {
              [v7 appendFormat:@" throttled %.2fs", *(void *)&v41];
            }
            [v34 endTime];
            id v26 = (id)objc_claimAutoreleasedReturnValue();

            ++v31;
            uint64_t v33 = v26;
          }

          while (v28 != v31);
          int v29 = v32 + v28;
          uint64_t v28 = [obja countByEnumeratingWithState:&v49 objects:v57 count:16];
        }

        while (v28);
      }

      [v26 deltaSecondsTo:*(void *)(*(void *)(v46 + 32) + 40) timeDomainPriorityList:&unk_189F82618 timeDomainUsed:0];
      if (v42 > 0.0) {
        [v7 appendFormat:@", not throttled %.2fs", *(void *)&v42];
      }

      id v5 = v44;
      id v6 = v45;
      a1 = v46;
    }
  }

  [*(id *)(a1 + 40) printWithFormat:@"  %@\n", v7];
}

- (uint64_t)displayTimeIndexForSampleIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (-[SASamplePrinter hasTimeIndexes](result))
    {
      int v4 = [*(id *)(v3 + 16) forceOneBasedTimeIndexes];
      result = a2 + 1;
      if (v4) {
        result -= *(void *)(v3 + 48);
      }
    }

    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return result;
}

void __63__SASamplePrinter_printProcessesHittingWQThreadLimitsToStream___block_invoke(void **a1, void *a2)
{
  id v6 = a2;
  [v6 lastTaskStateOnOrBeforeTime:*((void *)a1[4] + 5) sampleIndex:*((void *)a1[4] + 7)];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = v3;
  if (v3
    && (([v3 wqExceededTotalThreadLimit] & 1) != 0
     || [v4 wqExceededConstrainedThreadLimit]))
  {
    -[SASamplePrinter displayNameForTask:](a1[4], v6);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
}

- (id)displayNameForPid:(uint64_t)a3 threadId:(void *)a4 timestamp:
{
  id v7 = a4;
  if (!a1)
  {
    unint64_t v9 = 0LL;
    goto LABEL_11;
  }

  if ((_DWORD)a2 != -1 || a3)
  {
    id v10 = (void *)a1[20];
    if (v7) {
      -[SASampleStore taskWithPid:orTid:atTimestamp:](v10, a2, a3, v7);
    }
    else {
      -[SASampleStore lastTaskWithPid:orTid:](v10, a2, a3);
    }
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[SASamplePrinter displayNameForTask:threadId:](a1, v11, a3);
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }

    if (a3)
    {
      id v13 = objc_alloc(NSString);
      if ((_DWORD)a2 == -1)
      {
        uint64_t v8 = objc_msgSend(v13, "initWithFormat:", @"UNKNOWN TASK thread 0x%llx", a3, v18, v19);
      }

      else
      {
        uint64_t v14 = @"UNKNOWN";
        if (!(_DWORD)a2) {
          uint64_t v14 = @"kernel_task";
        }
        uint64_t v8 = [v13 initWithFormat:@"%@ [%d] thread 0x%llx", v14, a2, a3];
      }

      goto LABEL_5;
    }

    if ((_DWORD)a2 != -1)
    {
      id v15 = objc_alloc(NSString);
      uint64_t v16 = @"UNKNOWN";
      if (!(_DWORD)a2) {
        uint64_t v16 = @"kernel_task";
      }
      uint64_t v8 = [v15 initWithFormat:@"%@ [%d]", v16, a2, v19];
      goto LABEL_5;
    }
  }

  uint64_t v8 = objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"UNKNOWN TASK", v17, v18, v19);
LABEL_5:
  unint64_t v9 = (void *)v8;
LABEL_11:

  return v9;
}

- (__CFString)displayStringForResourceCoalition:(void *)a1
{
  id v1 = a1;
  if ([v1 resourceCoalitionID])
  {
    [v1 resourceCoalitionName];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

    id v3 = objc_alloc(NSString);
    if (v2)
    {
      [v1 resourceCoalitionName];
      int v4 = (void *)objc_claimAutoreleasedReturnValue();
      id v5 = (__CFString *)[v3 initWithFormat:@"%@(%llu)", v4, objc_msgSend(v1, "resourceCoalitionID")];
    }

    else
    {
      id v5 = (__CFString *)objc_msgSend(v3, "initWithFormat:", @"%llu", objc_msgSend(v1, "resourceCoalitionID"));
    }
  }

  else
  {
    id v5 = @"none";
  }

  return v5;
}

- (id)displayStringForOnBehalfOfForTasks:(uint64_t)a1 includePid:(void *)a2
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  double v37 = objc_alloc_init(&OBJC_CLASS___SAOnBehalfOfMultiple);
  uint64_t v49 = 0LL;
  __int128 v50 = &v49;
  uint64_t v51 = 0x3032000000LL;
  __int128 v52 = __Block_byref_object_copy__4;
  __int128 v53 = __Block_byref_object_dispose__4;
  id v54 = 0LL;
  [*(id *)(a1 + 160) sampleTimestamps];
  double v36 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v36 count];
  id v5 = *(void **)(a1 + 160);
  if ((v4 & 7) != 0)
  {
    [v5 sampleTimestamps];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v7 = ((unint64_t)[v6 count] >> 3) + 1;
  }

  else
  {
    [v5 sampleTimestamps];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v7 = (unint64_t)[v6 count] >> 3;
  }

  uint64_t v8 = *(void **)(a1 + 160);
  if ((v7 & 7) != 0)
  {
    [v8 sampleTimestamps];
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v10 = [v9 count];
    uint64_t v11 = *(void **)(a1 + 160);
    if ((v10 & 7) != 0)
    {
      [v11 sampleTimestamps];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v13 = ((unint64_t)[v12 count] >> 3) + 1;
    }

    else
    {
      [v11 sampleTimestamps];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v13 = (unint64_t)[v12 count] >> 3;
    }

    [*(id *)(a1 + 160) sampleTimestamps];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    char v18 = [v17 count];
    uint64_t v19 = *(void **)(a1 + 160);
    if ((v18 & 7) != 0)
    {
      [v19 sampleTimestamps];
      unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      unsigned int v21 = [v20 count];

      uint64_t v22 = ((v21 >> 3) + 1) & 7;
    }

    else
    {
      [v19 sampleTimestamps];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v24 = [v23 count];

      uint64_t v22 = (v24 >> 3) & 7;
    }

    unint64_t v16 = v13 - v22 + 8;
  }

  else
  {
    [v8 sampleTimestamps];
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v14 = [v9 count];
    id v15 = *(void **)(a1 + 160);
    if ((v14 & 7) != 0)
    {
      [v15 sampleTimestamps];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v16 = ((unint64_t)[v12 count] >> 3) + 1;
    }

    else
    {
      [v15 sampleTimestamps];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v16 = (unint64_t)[v12 count] >> 3;
    }
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v25 = v3;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v55 count:16];
  uint64_t v27 = MEMORY[0x1895F87A8];
  if (v26)
  {
    uint64_t v28 = *(void *)v46;
    do
    {
      for (uint64_t i = 0LL; i != v26; ++i)
      {
        if (*(void *)v46 != v28) {
          objc_enumerationMutation(v25);
        }
        [*(id *)(*((void *)&v45 + 1) + 8 * i) threads];
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v27;
        v41[1] = 3221225472LL;
        v41[2] = __65__SASamplePrinter_displayStringForOnBehalfOfForTasks_includePid___block_invoke;
        v41[3] = &unk_189F643F0;
        v41[4] = a1;
        double v42 = v37;
        uint64_t v43 = &v49;
        unint64_t v44 = v16;
        [v30 enumerateKeysAndObjectsUsingBlock:v41];
      }

      uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v55 count:16];
    }

    while (v26);
  }

  if ([(id)v50[5] count])
  {
    uint64_t v31 = (void *)v50[5];
    v38[0] = v27;
    v38[1] = 3221225472LL;
    v38[2] = __65__SASamplePrinter_displayStringForOnBehalfOfForTasks_includePid___block_invoke_3;
    v38[3] = &unk_189F64418;
    unint64_t v40 = v16;
    uint64_t v39 = v37;
    [v31 enumerateKeysAndObjectsUsingBlock:v38];
  }

  if (v37 && v37->_count)
  {
    int v32 = v37;
    uint64_t v33 = v32;
    if (v37->_count)
    {
      -[SAOnBehalfOfMultiple displayString](v32);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v34 = 0LL;
    }
  }

  else
  {
    uint64_t v34 = 0LL;
  }

  _Block_object_dispose(&v49, 8);

  return v34;
}

- (id)displayNameForTask:(void *)a3 thread:(void *)a4 threadState:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if (v7)
    {
      uint64_t v10 = -[SASamplePrinter displayNameForTask:threadId:](a1, v7, [v8 threadId]);
    }

    else
    {
      uint64_t v10 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Thread 0x%llx",  objc_msgSend(v8, "threadId"));
    }

    a1 = (void *)v10;
    uint64_t v11 = [v9 name];
    uint64_t v12 = (void *)v11;
    if (v11)
    {
      uint64_t v13 = [a1 stringByAppendingFormat:@" \"%@\"", v11];

      a1 = (void *)v13;
    }

    [v9 dispatchQueue];
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v14;
    if (v14)
    {
      -[SASamplePrinter displayNameForDispatchQueue:](v14);
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [a1 stringByAppendingFormat:@" %@ %@", @"DispatchQueue", v16];

      a1 = (void *)v17;
    }

    [v9 swiftTask];
    char v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = v18;
    if (v18)
    {
      if ([v18 identifier] == -1) {
        [a1 stringByAppendingFormat:@" %@ %@", @"Swift Task", @"UNKNOWN"];
      }
      else {
      uint64_t v20 = [a1 stringByAppendingFormat:@" %@ %llu", @"Swift Task", objc_msgSend(v19, "identifier")];
      }

      a1 = (void *)v20;
    }
  }

  return a1;
}

- (id)architectureStringForTask:(uint64_t)a1
{
  id v3 = a2;
  [v3 architectureString];
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = *(void *)(a1 + 160);
  if (!v5)
  {
    uint64_t v6 = 0LL;
    if (v3) {
      goto LABEL_3;
    }
LABEL_10:
    id v9 = 0LL;
    goto LABEL_7;
  }

  uint64_t v6 = *(void *)(v5 + 192);
  if (!v3) {
    goto LABEL_10;
  }
LABEL_3:
  objc_copyStruct(&dest, v3 + 288, 8LL, 1, 0);
  uint64_t v7 = dest;

  if (v6)
  {
    if (v7)
    {
      CSArchitectureGetFamily();
      CSArchitectureGetFamily();
      if ((CSArchitectureMatchesArchitecture() & 1) == 0)
      {
        uint64_t v8 = [v4 stringByAppendingString:@" (translated)"];
        id v9 = v4;
        char v4 = (void *)v8;
LABEL_7:
      }
    }
  }

  return v4;
}

- (void)addTaskHeaderToStream:(void *)a3 displayName:(uint64_t)a4 pid:(void *)a5 mainBinary:(void *)a6 mainBinaryPath:(void *)a7 sharedCaches:(uint64_t)a8 uid:(double)a9 bundleIdentifier:(void *)a10 bundleVersion:(void *)a11 bundleShortVersion:(void *)a12 bundleBuildVersion:(void *)a13 bundleProjectName:(void *)a14 bundleSourceVersion:(void *)a15 bundleProductBuildVersion:(void *)a16 adamID:(uint64_t)a17 installerVersionID:(void *)a18 developerType:(char)a19 appType:(void *)a20 isBeta:(unsigned __int8)a21 cohortID:(void *)a22 vendorID:(void *)a23 distributorID:(void *)a24 codesigningID:(void *)a25 teamID:(void *)a26 resourceCoalitionSampleCounts:(void *)a27 onBehalfOfProcesses:(void *)a28 architectureString:(void *)a29 kernelVersion:(void *)a30 parentName:(void *)a31 responsibleName:(void *)a32 taskExecedFromName:(void *)a33 taskExecedToName:(void *)a34 pidStartTimestamp:(void *)a35 startTimestamp:(void *)a36 endTimestamp:(void *)a37 startSampleIndex:(unint64_t)a38 endSampleIndex:(unint64_t)a39 numSamples:(unint64_t)a40 totalNumSamples:(unint64_t)a41 numSamplesSuspended:(uint64_t)a42 numSamplesTerminated:(uint64_t)a43 startingTaskSize:(unint64_t)a44 endingTaskSize:(unint64_t)a45 maxTaskSize:(unint64_t)a46 startSampleIndexOfMaxTaskSize:(unint64_t)a47 endSampleIndexOfMaxTaskSize:(unint64_t)a48 numPageins:(unsigned int)a49 cpuTimeNs:(unint64_t)a50 cpuInstructions:(unint64_t)a51 cpuCycles:(unint64_t)a52 nonThreadCpuTimeNs:(unint64_t)a53 nonThreadCpuInstructions:(unint64_t)a54 nonThreadCpuCycles:(unint64_t)a55 usesSuddenTermination:(char)a56 allowsIdleExit:(char)a57 isTranslocated:(char)a58 isUnresponsive:(char)a59 timeOfLastResponse:(uint64_t)a60 numThreads:(uint64_t)a61 numIdleWorkQueueThreads:(uint64_t)a62 numOtherHiddenThreads:(char)a63 hieSwallowedException:wqExceededConstrainedThreadLimit:wqExceededTotalThreadLimit:threadsDeadlocked:threadsBlockedByADeadlock:ioSize:numIOs:isReportHeader:
{
  uint64_t v390 = *MEMORY[0x1895F89C0];
  id v371 = a2;
  id v362 = a3;
  id v340 = a5;
  id v75 = a6;
  id v356 = a7;
  id v366 = a10;
  *((void *)&v344 + 1) = a11;
  *(void *)&__int128 v344 = a12;
  id v76 = a13;
  id v77 = a14;
  id v78 = a15;
  id v79 = a16;
  id v80 = a18;
  id v81 = a20;
  id v351 = a22;
  id v361 = a23;
  id v82 = a24;
  id v367 = a25;
  id v360 = a26;
  id v83 = a27;
  id v352 = a28;
  id v350 = a29;
  id v359 = a30;
  id v349 = a31;
  id v348 = a32;
  id v347 = a33;
  id v346 = a34;
  id v341 = a35;
  id v353 = a36;
  id v84 = a37;
  id v357 = a66;
  id v354 = a67;
  if (a70)
  {
    if ([*(id *)(a1 + 16) printJson])
    {
      int v291 = *__error();
      _sa_logt();
      double v292 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_error_impl( &dword_186C92000,  v292,  OS_LOG_TYPE_ERROR,  "printing report target task header with json",  buf,  2u);
      }

      *__error() = v291;
      _SASetCrashLogMessage( 6696,  "printing report target task header with json",  v293,  v294,  v295,  v296,  v297,  v298,  v331);
      _os_crash();
      __break(1u);
    }

    else if (![*(id *)(a1 + 16) systemstatsFormat])
    {
      goto LABEL_4;
    }

    int v299 = *__error();
    _sa_logt();
    BOOL v300 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v300, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( &dword_186C92000,  v300,  OS_LOG_TYPE_ERROR,  "printing report target task header with systemstats format",  buf,  2u);
    }

    *__error() = v299;
    _SASetCrashLogMessage( 6697,  "printing report target task header with systemstats format",  v301,  v302,  v303,  v304,  v305,  v306,  v331);
    _os_crash();
    __break(1u);
    goto LABEL_441;
  }

- (uint64_t)shouldPrintTimeOutsideSamplingRange:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a2 < 0.0)
  {
    int v6 = *__error();
    _sa_logt();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 134217984;
      double v15 = a2;
      _os_log_error_impl(&dword_186C92000, v7, OS_LOG_TYPE_ERROR, "negative timeOutsideSamplingRange %f", buf, 0xCu);
    }

    *__error() = v6;
    _SASetCrashLogMessage(12583, "negative timeOutsideSamplingRange %f", v8, v9, v10, v11, v12, v13, SLOBYTE(a2));
    _os_crash();
    __break(1u);
  }

  [*(id *)(a1 + 160) attemptedSamplingInterval];
  BOOL v4 = v3 != 0.0;
  if (v3 >= a2) {
    BOOL v4 = 0;
  }
  return a2 > 0.2 || v4;
}

uint64_t __30__SASamplePrinter_printHeader__block_invoke(void *a1, void *a2, _BYTE *a3)
{
  *a3 = 0;
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v5 = 0LL;
  uint64_t result = [a2 cpuTimeNs:&v7 cpuInstructions:&v6 cpuCycles:&v5 betweenStartTime:a1[4] endTime:a1[5]];
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) += v7;
  *(void *)(*(void *)(a1[7] + 8LL) + 24LL) += v6;
  *(void *)(*(void *)(a1[8] + 8LL) + 24LL) += v5;
  return result;
}

void __30__SASamplePrinter_printHeader__block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v7 = (objc_class *)NSString;
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = (void *)[[v7 alloc] initWithFormat:@"systemAdvisoryLevel%@", v9];

  SAJSONWriteDictionaryEntry(v6, v10, v8);
  *a4 = 0;
}

uint64_t __30__SASamplePrinter_printHeader__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result = [*(id *)(a1 + 32) appendFormat:@"%@ -> %@, ", a2, a3];
  *a4 = 0;
  return result;
}

void __30__SASamplePrinter_printHeader__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v32 = a2;
  id v5 = a3;
  if (([v5 isPartOfADeadlock] & 1) != 0 || objc_msgSend(v5, "isBlockedByADeadlock"))
  {
    [v5 threadState];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 startTimestamp];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v7 gt:*(void *)(*(void *)(a1 + 32) + 40)])
    {

LABEL_5:
      goto LABEL_11;
    }

    [v5 threadState];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 endTimestamp];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v10 = [v9 lt:*(void *)(*(void *)(a1 + 32) + 32)];

    if ((v10 & 1) == 0)
    {
      if ([v5 isBlockedByADeadlock])
      {
        uint64_t v12 = *(void **)(a1 + 32);
        uint64_t v11 = *(void **)(a1 + 40);
        [v5 task];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SASamplePrinter displayNameForTask:](v12, v13);
        char v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 addObject:v14];
      }

      if ([v5 isPartOfADeadlock]
        && ([*(id *)(a1 + 48) containsObject:v32] & 1) == 0)
      {
        [*(id *)(a1 + 48) addObject:v32];
        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
        double v15 = *(void **)(a1 + 32);
        [v5 task];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 thread];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 threadState];
        char v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SASamplePrinter displayNameForTask:thread:threadState:](v15, v16, v17, v18);
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

        [*(id *)(*(void *)(a1 + 32) + 8) printWithFormat:@"%-*s%@", 18, "Deadlock: ", v6];
        uint64_t v19 = [v5 dependency];
        id v20 = (id)v19;
        while (v20 && v20 != v5)
        {
          unsigned int v21 = v20;
          uint64_t v22 = *(void **)(a1 + 48);
          uint64_t v23 = (void *)MEMORY[0x189607968];
          [v21 thread];
          unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "numberWithUnsignedLongLong:", objc_msgSend(v24, "threadId"));
          id v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 addObject:v25];

          uint64_t v26 = *(void **)(a1 + 32);
          uint64_t v27 = (void *)v26[1];
          [v21 task];
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
          [v21 thread];
          int v29 = (void *)objc_claimAutoreleasedReturnValue();
          [v21 threadState];
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[SASamplePrinter displayNameForTask:thread:threadState:](v26, v28, v29, v30);
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
          [v27 printWithFormat:@" -> %@", v31];

          [v21 dependency];
          id v20 = (id)objc_claimAutoreleasedReturnValue();
        }

        [*(id *)(*(void *)(a1 + 32) + 8) printWithFormat:@" -> %@\n", v6];
        goto LABEL_5;
      }
    }
  }

void __30__SASamplePrinter_printHeader__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
}

void __30__SASamplePrinter_printHeader__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  int v5 = [a3 BOOLValue];
  uint64_t v6 = 40LL;
  if (v5) {
    uint64_t v6 = 32LL;
  }
  [*(id *)(a1 + v6) appendFormat:@"%@, ", v7];
}

void __30__SASamplePrinter_printHeader__block_invoke_872(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v9 count])
  {
    id v28 = v8;
    [v9 sortedArrayUsingComparator:&__block_literal_global_875];
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:32];
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = 0LL;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = [*(id *)(*((void *)&v29 + 1) + 8 * i) unsignedLongLongValue];
          if (-v15 == i) {
            uint64_t v19 = @"0x%llx";
          }
          else {
            uint64_t v19 = @", 0x%llx";
          }
          objc_msgSend(v11, "appendFormat:", v19, v18);
        }

        v15 += v14;
        uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }

      while (v14);
    }

    id v8 = v28;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "printWithFormat:", @"%-*s", 18, "Network mount: ");
  if (!*(_BYTE *)(a1 + 48))
  {
    id v20 = *(void **)(*(void *)(a1 + 32) + 8LL);
    SACopySanitizedString(v7, 1, 0LL);
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 printWithFormat:@"%@ ", v21];
  }

  uint64_t v22 = *(void **)(*(void *)(a1 + 32) + 8LL);
  SACopySanitizedString(v8, 1, 0LL);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 printWithFormat:@"(%@)", v23];

  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = *(void **)(v24 + 8);
  if (v11)
  {
    uint64_t v26 = [v9 count];
    uint64_t v27 = "s";
    if (v26 == 1) {
      uint64_t v27 = "";
    }
    [v25 printWithFormat:@" blocking thread%s %@", v27, v11];
  }

  else
  {
    [*(id *)(v24 + 8) appendString:@" unresponsive"];
  }

  [*(id *)(*(void *)(a1 + 32) + 8) appendString:@"\n"];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
}

uint64_t __30__SASamplePrinter_printHeader__block_invoke_2_873(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __30__SASamplePrinter_printHeader__block_invoke_894(void *a1, void *a2, uint64_t a3)
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)a1[4];

  if (v5 == v6)
  {
    id v7 = (void *)a1[5];
    [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v7 addObject:v8];
  }

  else
  {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 0;
  }

- (void)addStackForDispatchQueue:(void *)a3 orSwiftTaskStates:(void *)a4 orThread:(void *)a5 andThreadStateIndexes:(void *)a6 task:(void *)a7 toRootObjects:(char)a8 nameChanges:(char)a9 dispatchQueueChanges:(char)a10 swiftTaskChanges:(char)a11 threadChanges:(char)a12 priorityChanges:(void *)a13 microstackshotSummary:(unsigned __int8)a14 onlyHeaviestStack:(unsigned __int8)a15 includeState:
{
  uint64_t v189 = *MEMORY[0x1895F89C0];
  id v100 = a2;
  id v99 = a3;
  id v22 = a4;
  id v23 = a5;
  id v98 = a6;
  id v96 = a7;
  id v97 = a13;
  if (a1)
  {
    LODWORD(v24) = a14;
    context = (void *)MEMORY[0x186E47ACC]();
    if ((a14 & 1) != 0) {
      int v25 = 1;
    }
    else {
      int v25 = [*(id *)(a1 + 16) printHeavyStacks];
    }
    uint64_t v26 = buf;
    if ((v99 || v100 || !v22) && (v99 || !v100 || v22) && (!v99 || v100 || v22))
    {
      uint64_t v37 = *__error();
      _sa_logt();
      __int128 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        if (v22) {
          __int128 v47 = "y";
        }
        else {
          __int128 v47 = "n";
        }
        if (v100) {
          __int128 v48 = "y";
        }
        else {
          __int128 v48 = "n";
        }
        *(_DWORD *)__int128 buf = 136315650;
        *(void *)&uint8_t buf[4] = v47;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v48;
        if (v99) {
          uint64_t v26 = "y";
        }
        else {
          uint64_t v26 = "n";
        }
        *(_WORD *)&buf[22] = 2080;
        double v186 = (uint64_t (*)(uint64_t, uint64_t))v26;
        _os_log_error_impl( &dword_186C92000,  v46,  OS_LOG_TYPE_ERROR,  "aThread %s, dispatchQueue %s, swiftTaskStates %s",  buf,  0x20u);
      }

      else
      {
        if (v22) {
          __int128 v47 = "y";
        }
        else {
          __int128 v47 = "n";
        }
        if (v99) {
          uint64_t v26 = "y";
        }
        else {
          uint64_t v26 = "n";
        }
      }

      *__error() = v37;
      _SASetCrashLogMessage( 10391,  "aThread %s, dispatchQueue %s, swiftTaskStates %s",  v49,  v50,  v51,  v52,  v53,  v54,  (char)v47);
      _os_crash();
      __break(1u);
      goto LABEL_71;
    }

    int v27 = [*(id *)(a1 + 16) displayBlockedReasons];
    if (v27)
    {
      uint64_t v28 = [*(id *)(a1 + 16) displayBlockedReasonsLackingProcessOwners];
    }

    else
    {
      uint64_t v28 = 0LL;
    }

    char v29 = [*(id *)(a1 + 16) patchTruncatedStacks];
    char v86 = [*(id *)(a1 + 16) displayBlockedThreads];
    char v84 = [*(id *)(a1 + 16) displayRunnableThreads];
    char v81 = [*(id *)(a1 + 16) displayRunningThreads];
    char v89 = [*(id *)(a1 + 16) displayKernelFrames];
    char v88 = [*(id *)(a1 + 16) displayExclaveFrames];
    char v85 = [*(id *)(a1 + 16) displayUserFrames];
    char v80 = [*(id *)(a1 + 16) displayIOInCallTrees];
    BOOL v87 = [*(id *)(a1 + 16) callTreeTimestampsTimeDomain] != 0;
    char v83 = [*(id *)(a1 + 16) displayOnBehalfOfInCallTrees];
    char v95 = [*(id *)(a1 + 16) showThreadStateAsLeafFrame];
    char v82 = [*(id *)(a1 + 16) includeUserIdleAndBatteryStateInStacks];
    char v79 = [*(id *)(a1 + 16) omitStacksOnAC];
    char v78 = [*(id *)(a1 + 16) omitStacksOnBattery];
    char v77 = [*(id *)(a1 + 16) omitStacksWithUserIdle];
    char v76 = [*(id *)(a1 + 16) omitStacksWithUserActive];
    char v75 = [*(id *)(a1 + 16) omitStacksWithPCore];
    char v74 = [*(id *)(a1 + 16) omitStacksWithECore];
    int v73 = [*(id *)(a1 + 16) omitStacksBelowBasePriority];
    int v72 = [*(id *)(a1 + 16) omitStacksAboveBasePriority];
    if ([*(id *)(a1 + 16) swiftAsyncDisplayCRootCallstacks]) {
      char v71 = 1;
    }
    else {
      char v71 = [*(id *)(a1 + 16) swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways];
    }
    uint64_t v30 = *(void *)(a1 + 16);
    if (!v30) {
      goto LABEL_74;
    }
    uint64_t v31 = *(void *)(v30 + 152);
    if (!v31)
    {
      uint64_t v31 = 3LL;
      if (!*(_BYTE *)(v30 + 11)) {
        uint64_t v31 = 1LL;
      }
    }

    uint64_t v70 = v31;
    uint64_t v32 = *(void *)(v30 + 160);
    if (!v32)
    {
      uint64_t v32 = 2LL;
      if (!*(_BYTE *)(v30 + 14)) {
        uint64_t v32 = 3LL;
      }
    }

    for (uint64_t i = v32; ; uint64_t i = 0LL)
    {
      uint64_t v91 = v28;
      char v90 = v29;
      BOOL v68 = (([(id)v30 printTargetThreadOnly] & 1) != 0 || (_DWORD)v24)
         && (uint64_t v33 = *(void *)(a1 + 160)) != 0
         && (*(_BYTE *)(v33 + 326) & 1) != 0
         && *(void *)(a1 + 112) != 0LL;
      [(id)a1 options];
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 tidsToPrint];
      id v94 = (void *)objc_claimAutoreleasedReturnValue();

      int v35 = a15;
      id v36 = v98;
      if ((_DWORD)v24) {
        id v36 = 0LL;
      }
      v67 = v36;
      if (v100) {
        break;
      }
      if (v99)
      {
        uint64_t v37 = 0LL;
        goto LABEL_45;
      }

      uint64_t v43 = [v22 indexOfFirstThreadStateOnOrAfterTime:*(void *)(a1 + 32) sampleIndex:*(void *)(a1 + 48)];
      if (v43 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_53;
      }
      uint64_t v37 = v43;
      if (!v23) {
        goto LABEL_45;
      }
      [MEMORY[0x189607968] numberWithUnsignedInteger:v43];
      unint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v45 = objc_msgSend( v23,  "indexOfObject:inSortedRange:options:usingComparator:",  v44,  0,  objc_msgSend(v23, "count"),  1280,  &__block_literal_global_1541);

      uint64_t v37 = v45;
      if (v45 < [v23 count])
      {
        int v35 = a15;
        goto LABEL_45;
      }

void __30__SASamplePrinter_printHeader__block_invoke_2_903(uint64_t a1, uint64_t a2, void *a3)
{
}

- (id)binaryImagesHitByTask:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    BOOL v4 = *(void **)(a1 + 128);
    id v5 = v4;
    if (!v4)
    {
      [*(id *)(a1 + 160) targetProcess];
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v6 = v3;
    id v7 = v6;
    if (v5 != v3
      && (uint64_t v8 = *(void *)(a1 + 16)) != 0
      && (uint64_t v9 = *(void *)(v8 + 168), v9 != 1)
      && (v9 || *(_BYTE *)(v8 + 11))
      && ([v6 mainBinary], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v11 = (void *)v10;
      if ([*(id *)(a1 + 16) taskAggregation] == 3)
      {
        id v12 = (void *)[v7 resourceCoalitionID];
        if (v12)
        {
          [v7 sharedCache];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v13 = 0LL;
        }
      }

      else
      {
        uint64_t v13 = 0LL;
        id v12 = 0LL;
      }

      uint64_t v14 = -[SATaskAggregationIdentifier initWithBinary:sharedCache:rcid:]( (id *)objc_alloc(&OBJC_CLASS___SATaskAggregationIdentifier),  v11,  v13,  v12);
    }

    else
    {
      [MEMORY[0x189607968] numberWithUnsignedLong:v7];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v4) {
    [*(id *)(a1 + 72) objectForKeyedSubscript:v14];
    }
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      uint64_t v15 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:10];
      [*(id *)(a1 + 72) setObject:v15 forKeyedSubscript:v14];
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return v15;
}

- (void)addStack:(void *)a3 toStream:(unint64_t)a4 sampleCount:(void *)a5 binariesToDisplay:(uint64_t)a6 primaryState:(int)a7 primaryMicrostackshotState:(char)a8 onlyHeaviestStack:
{
  id v15 = a2;
  id v42 = a3;
  id v41 = a5;
  uint64_t v16 = (void *)MEMORY[0x186E47ACC]();
  BOOL v17 = 1;
  char v40 = a8;
  int v18 = [*(id *)(a1 + 16) printJson];
  if ([*(id *)(a1 + 16) displayBlockedReasons])
  {
    uint64_t v19 = [*(id *)(a1 + 16) displayBlockedReasonsLackingProcessOwners];
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  char v39 = [*(id *)(a1 + 16) showThreadStateAsLeafFrame];
  BOOL v38 = [*(id *)(a1 + 16) callTreeTimestampsTimeDomain] != 0;
  char v37 = [*(id *)(a1 + 16) displayOnBehalfOfInCallTrees];
  if (v17)
  {
    id v20 = &__block_literal_global_1575;
    [v15 sortUsingComparator:&__block_literal_global_1575];
    id v36 = &__block_literal_global_1583;
  }

  else
  {
    id v36 = 0LL;
    id v20 = 0LL;
  }

  v106[0] = 0LL;
  v106[1] = v106;
  v106[2] = 0x2020000000LL;
  char v107 = 1;
  if (v18) {
    [v42 appendString:@",\n\nstack:["];
  }
  uint64_t v35 = v19;
  double v21 = log10((double)a4 + 1.0);
  -[SASampleStore lastTaskWithPid:](*(void **)(a1 + 160), 0LL);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  if ([*(id *)(a1 + 16) omitFramesBelowSampleCount] < 1) {
    unint64_t v22 = 0LL;
  }
  else {
    unint64_t v22 = [*(id *)(a1 + 16) omitFramesBelowSampleCount];
  }
  if ((int)[*(id *)(a1 + 16) omitFramesBelowPercentOfStackSamples] >= 1)
  {
    int v23 = [*(id *)(a1 + 16) omitFramesBelowPercentOfStackSamples];
    if (v22 <= v23 * a4 / 0x64) {
      unint64_t v22 = v23 * a4 / 0x64;
    }
  }

  uint64_t v33 = a6;
  int v32 = a7;
  if ([*(id *)(a1 + 16) omitFramesAfterLineCount] < 1) {
    uint64_t v24 = 0LL;
  }
  else {
    uint64_t v24 = [*(id *)(a1 + 16) omitFramesAfterLineCount];
  }
  v105[0] = 0LL;
  v105[1] = v105;
  v105[2] = 0x2020000000LL;
  v105[3] = 0LL;
  v103[0] = 0LL;
  v103[1] = v103;
  v103[2] = 0x2020000000LL;
  int v104 = -1;
  uint64_t v99 = 0LL;
  id v100 = &v99;
  uint64_t v101 = 0x2020000000LL;
  uint64_t v102 = 0LL;
  v97[0] = 0LL;
  v97[1] = v97;
  v97[2] = 0x2020000000LL;
  int v98 = 0;
  v95[0] = 0LL;
  v95[1] = v95;
  v95[2] = 0x2020000000LL;
  char v96 = 0;
  uint64_t v91 = 0LL;
  char v92 = &v91;
  uint64_t v93 = 0x2020000000LL;
  char v94 = 0;
  uint64_t v87 = 0LL;
  char v88 = &v87;
  uint64_t v89 = 0x2020000000LL;
  int v90 = 0;
  uint64_t v81 = 0LL;
  char v82 = &v81;
  uint64_t v83 = 0x3032000000LL;
  char v84 = __Block_byref_object_copy__4;
  char v85 = __Block_byref_object_dispose__4;
  id v86 = 0LL;
  uint64_t v77 = 0LL;
  char v78 = &v77;
  uint64_t v79 = 0x2020000000LL;
  uint64_t v80 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v73 = 0LL;
  char v74 = &v73;
  uint64_t v75 = 0x2020000000LL;
  uint64_t v76 = 0x7FFFFFFFFFFFFFFFLL;
  v44[0] = MEMORY[0x1895F87A8];
  v44[1] = 3221225472LL;
  v44[2] = __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_1588;
  v44[3] = &unk_189F64270;
  char v67 = v40;
  uint64_t v50 = v105;
  uint64_t v51 = v103;
  uint64_t v52 = v97;
  uint64_t v53 = &v99;
  uint64_t v61 = v24;
  unint64_t v62 = v22;
  v44[4] = a1;
  id v48 = v20;
  char v68 = v18;
  uint64_t v54 = v95;
  __int128 v55 = v106;
  id v25 = v42;
  BOOL v69 = v17;
  id v45 = v25;
  id v56 = &v73;
  uint64_t v57 = &v87;
  unsigned int v43 = vcvtpd_u64_f64(v21);
  unsigned int v65 = v43;
  uint64_t v58 = &v77;
  uint64_t v59 = &v91;
  uint64_t v60 = &v81;
  id v26 = v34;
  id v46 = v26;
  id v27 = v41;
  char v70 = v39;
  id v47 = v27;
  id v49 = v36;
  char v71 = v37;
  int v66 = v32;
  uint64_t v63 = v33;
  uint64_t v64 = v35;
  BOOL v72 = v38;
  +[SACallTreeFrame enumerateTree:block:]((uint64_t)&OBJC_CLASS___SACallTreeFrame, v15, v44);
  uint64_t v28 = (void *)v100[3];
  if (v28)
  {
    free(v28);
    v100[3] = 0LL;
  }

  uint64_t v29 = v74[3];
  if (v29 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v17)
    {
      saos_printf_frame( v25,  *((unsigned int *)v88 + 6),  v43,  v29 - v78[3] + 1,  *((unsigned __int8 *)v92 + 24),  (void *)v82[5]);
    }

    else
    {
      if (-[SASamplePrinter hasTimeIndexes](a1))
      {
        int v30 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
        unint64_t v31 = v29 + 1;
        if (v30) {
          v31 -= *(void *)(a1 + 48);
        }
      }

      else
      {
        unint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
      }

      saos_printf_timeline_frame( v25,  *((unsigned int *)v88 + 6),  v43,  v74[3] - v78[3] + 1,  *((unsigned __int8 *)v92 + 24),  (void *)v82[5],  v31);
    }
  }

  if (v18) {
    [v25 appendString:@"]\n"];
  }

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);

  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(v95, 8);
  _Block_object_dispose(v97, 8);
  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(v103, 8);
  _Block_object_dispose(v105, 8);

  _Block_object_dispose(v106, 8);
  objc_autoreleasePoolPop(v16);
}

- (void)printBinaryImagesForTask:(uint64_t)a1
{
  id v3 = a2;
  -[SASamplePrinter binaryImagesHitByTask:](a1, v3);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v3 mainBinaryLoadInfo];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if ([v4 loadAddress])
    {
      [v4 binary];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 objectForKeyedSubscript:v5];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [v6 count];

      if (!v7) {
        id v8 =  -[SASamplePrinter displayedBinaryLoadInfoForLoadInfo:offsetIntoLoadInfo:binariesToDisplay:extraBinariesToDisplay:]( a1,  v4,  0LL,  v14);
      }
    }
  }

  if ([v14 count])
  {
    -[SASamplePrinter sortedLoadInfosForBinaryImages:](a1, v14);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v9 count])
    {
      uint64_t v10 = *(void **)(a1 + 16);
      id v11 = v9;
      int v12 = [v10 printJson];
      uint64_t v13 = *(void **)(a1 + 8);
      if (v12) {
        [v13 appendString:@",binaryImages:"];
      }
      else {
        objc_msgSend(v13, "printWithFormat:", @"\n%*sBinary Images:\n", 2, "");
      }
      -[SASamplePrinter printLoadInfos:]((id *)a1, v11);
    }
  }
}

- (void)printHIDEvent:(uint64_t)a1
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 hidEventTimestamp];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = *(void **)(a1 + 8);
  [v3 hidEventTypeString];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 printWithFormat:@"HID event %@", v6];

  if (-[SASamplePrinter hasTimeIndexes](a1))
  {
    uint64_t v7 = *(void **)(a1 + 8);
    -[SASamplePrinter timeIndexDescriptionForTimestamp:](a1, v4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 printWithFormat:@" started %@\n", v8];

    goto LABEL_18;
  }

  [v4 machAbsTimeSeconds];
  double v9 = 0.0;
  if (v10 == 0.0 || ([*(id *)(a1 + 32) machAbsTimeSeconds], v11 == 0.0))
  {
    int v15 = 0;
  }

  else
  {
    [v4 machAbsTimeSeconds];
    double v13 = v12;
    [*(id *)(a1 + 32) machAbsTimeSeconds];
    double v9 = v13 - v14;
    int v15 = 1;
  }

  [v4 machContTimeSeconds];
  if (v16 != 0.0)
  {
    [*(id *)(a1 + 32) machContTimeSeconds];
    if (v17 != 0.0)
    {
      [v4 machContTimeSeconds];
      double v19 = v18;
      [*(id *)(a1 + 32) machContTimeSeconds];
      double v9 = v19 - v20;
      int v15 = 1;
    }
  }

  [v4 wallTime];
  if (v21 == 0.0 || ([*(id *)(a1 + 32) wallTime], v22 == 0.0))
  {
    if (!v15)
    {
      objc_msgSend(*(id *)(a1 + 8), "printWithFormat:", @"\n", v60);
      goto LABEL_18;
    }
  }

  else
  {
    [v4 wallTime];
    double v24 = v23;
    [*(id *)(a1 + 32) wallTime];
    double v9 = v24 - v25;
  }

  id v26 = *(void **)(a1 + 8);
  if (v9 >= 0.0) {
    objc_msgSend(v26, "printWithFormat:", @" started %.1f seconds after start of sampling\n", *(void *)&v9);
  }
  else {
    objc_msgSend(v26, "printWithFormat:", @" started %.1f seconds before sampling\n", -v9);
  }
LABEL_18:
  objc_msgSend( *(id *)(a1 + 8),  "printWithFormat:",  @"%-48s %-11s %11s  %s\n",  "Event",  "Time Index",  "Delay",  "Process/Thread");
  id v27 = *(void **)(a1 + 8);
  id v28 = -[SASamplePrinter displayNameForPid:threadId:timestamp:]((void *)a1, 0LL, 0LL, *(void **)(a1 + 32));
  objc_msgSend( v27,  "printWithFormat:",  @"%-48s %-11s %11s  %s\n",  "handleReport",  "No samples",  "N/A",  objc_msgSend(v28, "UTF8String"));

  id v29 = v4;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  [v3 steps];
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v61 = v29;
  uint64_t v64 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v64)
  {
    uint64_t v63 = *(void *)v66;
    do
    {
      for (uint64_t i = 0LL; i != v64; ++i)
      {
        if (*(void *)v66 != v63) {
          objc_enumerationMutation(obj);
        }
        unint64_t v31 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        [v31 timestamp];
        int v32 = (void *)objc_claimAutoreleasedReturnValue();
        [v31 debugidString];
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        [v32 machAbsTimeSeconds];
        double v35 = v34;
        [v29 machAbsTimeSeconds];
        double v37 = ReduceToSignificantDigits(2, 0LL, (v35 - v36) * 1000.0);
        id v38 = v29;
        id v29 = v32;
        char v39 = &stru_189F64BD8;
        if (-[SASamplePrinter hasTimeIndexes](a1))
        {
          unint64_t v40 = [*(id *)(a1 + 160) indexOfFirstSampleOnOrAfterTimestamp:v38];
          unint64_t v41 = [*(id *)(a1 + 160) indexOfLastSampleOnOrBeforeTimestamp:v29];
          unint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
          if (v40 != 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v44 = *(void *)(a1 + 48);
            unint64_t v43 = *(void *)(a1 + 56);
            BOOL v45 = v44 <= v40 || v44 == 0x7FFFFFFFFFFFFFFFLL;
            unint64_t v42 = v45 ? v40 : *(void *)(a1 + 48);
            if (v43 != 0x7FFFFFFFFFFFFFFFLL && v43 < v42) {
              unint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
            }
          }

          char v39 = @"No samples";
          if (v41 != 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v47 = *(void *)(a1 + 48);
            unint64_t v46 = *(void *)(a1 + 56);
            if (v46 >= v41 || v46 == 0x7FFFFFFFFFFFFFFFLL) {
              unint64_t v46 = v41;
            }
            if (v47 <= v46) {
              uint64_t v49 = v46;
            }
            else {
              uint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
            }
            if (v47 == 0x7FFFFFFFFFFFFFFFLL) {
              unint64_t v50 = v46;
            }
            else {
              unint64_t v50 = v49;
            }
            if (v42 != 0x7FFFFFFFFFFFFFFFLL && v50 != 0x7FFFFFFFFFFFFFFFLL && v42 <= v50)
            {
              -[SASamplePrinter timeIndexDescriptionForStartSampleIndex:endSampleIndex:formattedToLength:]( a1,  v42,  v50,  0xBu);
              char v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
        }

        uint64_t v52 = [v31 pid];
        uint64_t v53 = [v31 tid];
        [v31 timestamp];
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[SASamplePrinter displayNameForPid:threadId:timestamp:]((void *)a1, v52, v53, v54);
        __int128 v55 = (void *)objc_claimAutoreleasedReturnValue();

        id v56 = *(void **)(a1 + 8);
        id v57 = v33;
        uint64_t v58 = [v57 UTF8String];
        uint64_t v59 = v39;
        [v56 printWithFormat:@"%-48s %-11s %9.3fms  %@\n", v58, -[__CFString UTF8String](v59, "UTF8String"), *(void *)&v37, v55];
      }

      uint64_t v64 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
    }

    while (v64);
  }
}

- (void)printLoadInfos:(id *)a1
{
  uint64_t v134 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (![a1[2] printJson])
  {
    id v101 = v3;
    if ([a1[2] tabDelineateBinaryImageSections])
    {
      uint64_t v106 = 0LL;
      uint64_t v107 = 0LL;
      uint64_t v108 = 0LL;
      goto LABEL_58;
    }

    __int128 v123 = 0u;
    __int128 v124 = 0u;
    __int128 v121 = 0u;
    __int128 v122 = 0u;
    obuint64_t j = v3;
    uint64_t v111 = [obj countByEnumeratingWithState:&v121 objects:v133 count:16];
    if (!v111)
    {
      uint64_t v106 = 0LL;
      uint64_t v107 = 0LL;
      uint64_t v108 = 0LL;
      goto LABEL_57;
    }

    uint64_t v106 = 0LL;
    uint64_t v107 = 0LL;
    uint64_t v108 = 0LL;
    uint64_t v109 = *(void *)v122;
    int v4 = 1;
    while (1)
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v122 != v109) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v121 + 1) + 8 * v5);
        [v6 binary];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 bundleIdentifier];
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        double v9 = v8;
        if (v8)
        {
          id v10 = v8;
        }

        else
        {
          [v7 name];
          id v10 = (id)objc_claimAutoreleasedReturnValue();
        }

        if (([a1[2] displayBinaryImagesLackingNameOrPath] & 1) == 0 && !v10)
        {
LABEL_19:
          id v113 = v10;
          int v12 = [@"???" length];
          goto LABEL_20;
        }

        if (!v10) {
          goto LABEL_19;
        }
        id v113 = v10;
        SACopySanitizedString(v10, 1, 0LL);
        double v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v11 length];

LABEL_20:
        uint64_t v13 = [v7 bundleVersion];
        [v7 bundleShortVersion];
        double v14 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = [v7 binaryVersion];
        v115 = (void *)v15;
        if (v14 || v13 || v15)
        {
          ++v12;
          if (v14)
          {
            uint64_t v16 = v13 | v15;
            SACopySanitizedString(v14, 1, 0LL);
            double v17 = (void *)objc_claimAutoreleasedReturnValue();
            int v18 = [v17 length];

            if (v16) {
              int v19 = v12 + 1;
            }
            else {
              int v19 = v12;
            }
            int v12 = v19 + v18;
            if (!v16) {
              goto LABEL_32;
            }
LABEL_28:
            if (v13) {
              double v20 = (void *)v13;
            }
            else {
              double v20 = v115;
            }
            SACopySanitizedString(v20, 1, 0LL);
            double v21 = (void *)objc_claimAutoreleasedReturnValue();
            v12 += [v21 length] + 2;

            goto LABEL_32;
          }

          if (v13 | v15) {
            goto LABEL_28;
          }
        }

- (void)avoidOverlapInBinaryLoadInfos:(int)a3 onlyExclaves:(void *)a4 inTask:
{
  uint64_t v90 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v46 = a4;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v67 objects:v89 count:16];
  if (!v7)
  {
    id v10 = 0LL;
    goto LABEL_47;
  }

  uint64_t v9 = v7;
  id v10 = 0LL;
  unint64_t v11 = 0LL;
  int v12 = (unint64_t *)MEMORY[0x1895FD590];
  uint64_t v66 = *(void *)v68;
  *(void *)&__int128 v8 = 138414338LL;
  __int128 v45 = v8;
  do
  {
    uint64_t v13 = 0LL;
    uint64_t v63 = v9;
    do
    {
      if (*(void *)v68 != v66) {
        objc_enumerationMutation(obj);
      }
      double v14 = *(void **)(*((void *)&v67 + 1) + 8 * v13);
      objc_msgSend(v14, "segment", v45);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v15 length];
      if (v16)
      {
        unint64_t v17 = v16;
      }

      else
      {
        [v14 binary];
        int v18 = v10;
        int v19 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v17 = [v19 length];

        id v10 = v18;
        if (!v17)
        {
          if ([v14 highestOffset])
          {
            unint64_t v20 = [v14 highestOffset];
            if (v20 >= 0x10000000) {
              unint64_t v17 = 0x10000000LL;
            }
            else {
              unint64_t v17 = v20;
            }
          }

          else
          {
            unsigned int v21 = [*(id *)(a1 + 160) vmPageSize];
            if (v21) {
              unint64_t v17 = v21;
            }
            else {
              unint64_t v17 = *v12;
            }
          }
        }
      }

      unsigned int v22 = [*(id *)(a1 + 160) vmPageSize];
      unint64_t v23 = v22;
      if (!v22) {
        unint64_t v23 = *v12;
      }
      if (v17 % v23)
      {
        unsigned int v24 = [*(id *)(a1 + 160) vmPageSize];
        if (v24) {
          unint64_t v25 = v24;
        }
        else {
          unint64_t v25 = *v12;
        }
        unsigned int v26 = [*(id *)(a1 + 160) vmPageSize];
        unint64_t v27 = v26;
        if (!v26) {
          unint64_t v27 = *v12;
        }
        unint64_t v17 = v25 + v17 / v27 * v27;
      }

      unint64_t v28 = [v14 loadAddress] + v17;
      if ([v14 loadAddress] < v11)
      {
        if (!a3
          || ([v14 exclave], id v29 = (void *)objc_claimAutoreleasedReturnValue(), v29, v29))
        {
          int v30 = *__error();
          _sa_logt();
          int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            [v46 debugDescription];
            uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 binary];
            __int128 v55 = (void *)objc_claimAutoreleasedReturnValue();
            [v55 name];
            id v59 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 binary];
            uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
            [v53 uuid];
            id v57 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v47 = [v14 loadAddress];
            [v10 binary];
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            [v51 name];
            double v37 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 binary];
            uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
            [v49 uuid];
            id v38 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v39 = [v10 loadAddress];
            *(_DWORD *)__int128 buf = v45;
            char v72 = v61;
            __int16 v73 = 2112;
            uint64_t v74 = v59;
            __int16 v75 = 2112;
            id v76 = v57;
            __int16 v77 = 2048;
            uint64_t v78 = v47;
            __int16 v79 = 2048;
            unint64_t v80 = v11;
            __int16 v81 = 2112;
            uint64_t v82 = v37;
            __int16 v83 = 2112;
            char v84 = v38;
            __int16 v85 = 2048;
            uint64_t v86 = v39;
            __int16 v87 = 2048;
            unint64_t v88 = v11;
            _os_log_debug_impl( &dword_186C92000,  v31,  OS_LOG_TYPE_DEBUG,  "%@: adjusted load address of %@ <%@> from 0x%llx to 0x%llx to avoid overlapping with %@ <%@> 0x%llx - 0x%llx",  buf,  0x5Cu);
          }

          *__error() = v30;
          if (v14) {
            v14[3] = v11;
          }
          unint64_t v28 = v17 + v11;
LABEL_33:
          uint64_t v9 = v63;
          goto LABEL_34;
        }

        [v10 exclave];
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          int v34 = *__error();
          _sa_logt();
          uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            [v46 debugDescription];
            unint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 binary];
            id v56 = (void *)objc_claimAutoreleasedReturnValue();
            [v56 name];
            id v60 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 binary];
            uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
            [v54 uuid];
            unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v48 = [v10 loadAddress];
            [v14 binary];
            uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
            [v52 name];
            id v58 = v10;
            id v41 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 binary];
            int v50 = (void *)objc_claimAutoreleasedReturnValue();
            [v50 uuid];
            uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v43 = [v14 loadAddress];
            *(_DWORD *)__int128 buf = v45;
            char v72 = v62;
            __int16 v73 = 2112;
            uint64_t v74 = v60;
            __int16 v75 = 2112;
            id v76 = v40;
            __int16 v77 = 2048;
            uint64_t v78 = v48;
            __int16 v79 = 2048;
            unint64_t v80 = v28;
            __int16 v81 = 2112;
            uint64_t v82 = v41;
            __int16 v83 = 2112;
            char v84 = v42;
            __int16 v85 = 2048;
            uint64_t v86 = v43;
            __int16 v87 = 2048;
            unint64_t v88 = v28;
            _os_log_debug_impl( &dword_186C92000,  v35,  OS_LOG_TYPE_DEBUG,  "%@: adjusted load address of %@ <%@> from 0x%llx to 0x%llx to avoid overlapping with %@ <%@> 0x%llx - 0x%llx",  buf,  0x5Cu);

            id v10 = v58;
          }

          *__error() = v34;
          uint64_t v36 = [v10 loadAddress];
          if (v10) {
            v10[3] = v28;
          }
          unint64_t v11 = v28 + v11 - v36;
          goto LABEL_33;
        }
      }

void __29__SASamplePrinter_preprocess__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  if (v2)
  {
    -[SASamplePrinter binaryImagesHitByTask:](v2, v3);
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ([*(id *)(v2 + 16) displayAllBinaries])
    {
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      [v3 binaryLoadInfos];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v22;
        do
        {
          for (uint64_t i = 0LL; i != v7; ++i)
          {
            if (*(void *)v22 != v8) {
              objc_enumerationMutation(v5);
            }
            id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if ([v10 loadAddress]) {
              id v11 =  -[SASamplePrinter displayedBinaryLoadInfoForLoadInfo:offsetIntoLoadInfo:binariesToDisplay:extraBinariesToDisplay:]( v2,  v10,  0LL,  v4);
            }
          }

          uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }

        while (v7);
      }
    }

    uint64_t v12 = *(void *)(v2 + 16);
    if (v12)
    {
      uint64_t v13 = *(void *)(v12 + 168);
      if (v13 != 1 && (v13 || *(_BYTE *)(v12 + 11)))
      {
        v17[0] = MEMORY[0x1895F87A8];
        v17[1] = 3221225472LL;
        v17[2] = __34__SASamplePrinter_preprocessTask___block_invoke;
        v17[3] = &unk_189F63A10;
        id v14 = v3;
        id v18 = v14;
        uint64_t v19 = v2;
        id v15 = v4;
        id v20 = v15;
        -[SATask enumerateFrames:]((uint64_t)v14, v17);
        -[SASamplePrinter sortedLoadInfosForBinaryImages:](v2, v15);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SASamplePrinter avoidOverlapInBinaryLoadInfos:onlyExclaves:inTask:](v2, v16, 0, v14);
      }
    }
  }
}

void __29__SASamplePrinter_preprocess__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = v3;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained(v3 + 3);
    if (WeakRetained) {
      id v5 =  -[SASamplePrinter displayedBinaryLoadInfoForLoadInfo:offsetIntoLoadInfo:binariesToDisplay:extraBinariesToDisplay:]( *(void *)(a1 + 32),  WeakRetained,  [v6 address] - objc_msgSend(WeakRetained, "loadAddress"),  *(void **)(a1 + 40));
    }
  }

  else
  {
    id WeakRetained = 0LL;
  }
}

- (id)displayedBinaryLoadInfoForLoadInfo:(uint64_t)a1 offsetIntoLoadInfo:(void *)a2 binariesToDisplay:(unint64_t)a3 extraBinariesToDisplay:(void *)a4
{
  if (a1)
  {
    id v6 = a4;
    id v7 = a2;
    [v7 binary];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 segment];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v7 loadAddress];
    char v11 = [v7 isInKernelAddressSpace];
    [v7 exclave];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[SASamplePrinter displayedBinaryLoadInfoForBinary:segment:desiredLoadAddress:offsetIntoLoadInfo:isInKernelAddressSpace:exclave:binariesToDisplay:extraBinariesToDisplay:]( v8,  v9,  v10,  a3,  v11,  v12,  v6,  0LL);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return v13;
}

void __29__SASamplePrinter_preprocess__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained(v3 + 3);
    if (WeakRetained) {
      id v5 =  -[SASamplePrinter displayedBinaryLoadInfoForLoadInfo:offsetIntoLoadInfo:binariesToDisplay:extraBinariesToDisplay:]( *(void *)(a1 + 32),  WeakRetained,  [v6 address] - objc_msgSend(WeakRetained, "loadAddress"),  *(void **)(a1 + 40));
    }
  }

  else
  {
    id WeakRetained = 0LL;
  }
}

- (id)sortedLoadInfosForBinaryImages:(uint64_t)a1
{
  id v3 = (objc_class *)MEMORY[0x189603FA8];
  id v4 = a2;
  id v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v10 = MEMORY[0x1895F87A8];
  uint64_t v11 = 3221225472LL;
  uint64_t v12 = __50__SASamplePrinter_sortedLoadInfosForBinaryImages___block_invoke;
  uint64_t v13 = &unk_189F63D80;
  uint64_t v14 = a1;
  id v6 = v5;
  id v15 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:&v10];

  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_1229, v10, v11, v12, v13, v14);
  id v7 = v15;
  id v8 = v6;

  return v8;
}

void __34__SASamplePrinter_preprocessTask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v14 = v3;
  if (!v3)
  {
    id WeakRetained = 0LL;
    goto LABEL_7;
  }

  id WeakRetained = objc_loadWeakRetained(v3 + 3);
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) binaryLoadInfos];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 indexOfObjectIdenticalTo:WeakRetained];

    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[SASamplePrinter displayedBinaryLoadInfoForLoadInfo:offsetIntoLoadInfo:binariesToDisplay:extraBinariesToDisplay:]( *(void *)(a1 + 40),  WeakRetained,  [v14 address] - objc_msgSend(WeakRetained, "loadAddress"),  *(void **)(a1 + 48));
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) mainBinaryLoadInfo];
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8 == WeakRetained)
      {
        int v9 = [*(id *)(a1 + 32) pid];

        if (!v9) {
          goto LABEL_6;
        }
        unint64_t v10 = [v7 loadAddress];
        [*(id *)(a1 + 32) mainBinaryLoadInfo];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v12 = [v11 loadAddress];

        if (v10 <= v12) {
          goto LABEL_6;
        }
        [*(id *)(a1 + 32) mainBinaryLoadInfo];
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v8 loadAddress];
        if (v7) {
          v7[3] = v13;
        }
      }

LABEL_6:
    }
  }

- (uint64_t)shouldPrintTask:(void *)a3 thread:(void *)a4 dispatchQueue:
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  unint64_t v8 = a3;
  unint64_t v9 = a4;
  if (!a1) {
    goto LABEL_97;
  }
  [(id)a1 options];
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 pidsToPrint];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  [(id)a1 options];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 uniquePidsToPrint];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  [(id)a1 options];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 processNamesToPrint];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  [(id)a1 options];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 processUUIDsToPrint];
  __int16 v73 = (void *)objc_claimAutoreleasedReturnValue();

  [(id)a1 options];
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 tidsToPrint];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 && !v13 && !v18 && !v15 && !v73)
  {
    [(id)a1 options];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    int v20 = [v19 printTargetThreadOnly];

    if (!v20)
    {
LABEL_95:
      a1 = 1LL;
      goto LABEL_96;
    }
  }

  [*(id *)(a1 + 160) targetProcess];
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21 == v7)
  {
    if (!(v8 | v9)) {
      goto LABEL_95;
    }
    [(id)a1 options];
    int v34 = (void *)objc_claimAutoreleasedReturnValue();
    int v35 = [v34 printTargetThreadOnly];

    if (!v35) {
      goto LABEL_95;
    }
    if ([*(id *)(a1 + 160) targetThreadId] && objc_msgSend(*(id *)(a1 + 160), "targetDispatchQueueId"))
    {
      if (!v8) {
        goto LABEL_9;
      }
      if (!v9) {
        goto LABEL_9;
      }
      uint64_t v36 = [(id)v8 threadId];
      if (v36 != [*(id *)(a1 + 160) targetThreadId]) {
        goto LABEL_9;
      }
    }

    else
    {
      if ([*(id *)(a1 + 160) targetThreadId])
      {
        if (!v8) {
          goto LABEL_9;
        }
        uint64_t v37 = [(id)v8 threadId];
        uint64_t v38 = [*(id *)(a1 + 160) targetThreadId];
        goto LABEL_42;
      }

      if (![*(id *)(a1 + 160) targetDispatchQueueId])
      {
        if ([(id)v8 isMainThread]) {
          goto LABEL_95;
        }
        goto LABEL_9;
      }

      if (!v9) {
        goto LABEL_9;
      }
    }

    uint64_t v37 = [(id)v9 identifier];
    uint64_t v38 = [*(id *)(a1 + 160) targetDispatchQueueId];
LABEL_42:
    if (v37 == v38) {
      goto LABEL_95;
    }
  }

void __59__SASamplePrinter_highestPriorityInThread_useBasePriority___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    BOOL v4 = (int)[v3 basePriority] <= *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    id v5 = v7;
    if (!v4)
    {
      int v6 = [v7 basePriority];
LABEL_6:
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v6;
      id v5 = v7;
    }
  }

  else
  {
    BOOL v4 = (int)[v3 scheduledPriority] <= *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    id v5 = v7;
    if (!v4)
    {
      int v6 = [v7 scheduledPriority];
      goto LABEL_6;
    }
  }
}

- (uint64_t)highestPriorityInTask:(char)a3 useBasePriority:
{
  id v5 = a2;
  int v6 = v5;
  if (a1)
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000LL;
    int v15 = 0;
    [v5 threads];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __57__SASamplePrinter_highestPriorityInTask_useBasePriority___block_invoke;
    v10[3] = &unk_189F63A60;
    char v11 = a3;
    v10[4] = a1;
    v10[5] = &v12;
    [v7 enumerateKeysAndObjectsUsingBlock:v10];

    uint64_t v8 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

void __57__SASamplePrinter_highestPriorityInTask_useBasePriority___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  char v5 = *(_BYTE *)(a1 + 48);
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    uint64_t v16 = 0LL;
    unint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000LL;
    int v19 = 0;
    uint64_t v8 = v4[4];
    uint64_t v9 = v4[5];
    uint64_t v10 = v4[6];
    uint64_t v11 = v4[7];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __59__SASamplePrinter_highestPriorityInThread_useBasePriority___block_invoke;
    v14[3] = &unk_189F63A38;
    char v15 = v5;
    v14[4] = &v16;
    [v6 enumerateThreadStatesBetweenStartTime:v8 startSampleIndex:v10 endTime:v9 endSampleIndex:v11 reverseOrder:0 block:v14];
    int v12 = *((_DWORD *)v17 + 6);
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    int v12 = 0;
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (v12 > *(_DWORD *)(v13 + 24)) {
    *(_DWORD *)(v13 + 24) = v12;
  }
}

- (void)largestFootprintInTask:(void *)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (a1)
  {
    uint64_t v11 = 0LL;
    int v12 = &v11;
    uint64_t v13 = 0x2020000000LL;
    uint64_t v14 = 0LL;
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[7];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __42__SASamplePrinter_largestFootprintInTask___block_invoke;
    v10[3] = &unk_189F63A88;
    v10[4] = &v11;
    [v3 enumerateTaskStatesBetweenStartTime:v5 startSampleIndex:v7 endTime:v6 endSampleIndex:v8 reverseOrder:0 block:v10];
    a1 = (void *)v12[3];
    _Block_object_dispose(&v11, 8);
  }

  return a1;
}

void __42__SASamplePrinter_largestFootprintInTask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
}

void __41__SASamplePrinter_printTasksIndividually__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(id *)(a1 + 32) != v3)
  {
    id v5 = v3;
    int v4 = -[SASamplePrinter shouldPrintTask:thread:dispatchQueue:](*(void *)(a1 + 40), v3, 0LL, 0LL);
    id v3 = v5;
    if (v4)
    {
      [*(id *)(a1 + 48) addObject:v5];
      id v3 = v5;
    }
  }
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v70[0] = MEMORY[0x1895F87A8];
  v70[1] = 3221225472LL;
  v70[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_3;
  v70[3] = &unk_189F63AB0;
  id v8 = v5;
  id v71 = v8;
  id v9 = v6;
  id v72 = v9;
  uint64_t v42 = (uint64_t (**)(void))MEMORY[0x186E47C94](v70);
  v67[0] = v7;
  v67[1] = 3221225472LL;
  v67[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_4;
  v67[3] = &unk_189F63AB0;
  id v10 = v8;
  id v68 = v10;
  id v11 = v9;
  id v69 = v11;
  uint64_t v41 = (uint64_t (**)(void))MEMORY[0x186E47C94](v67);
  v64[0] = v7;
  v64[1] = 3221225472LL;
  v64[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_5;
  v64[3] = &unk_189F63AB0;
  id v12 = v10;
  id v65 = v12;
  id v13 = v11;
  id v66 = v13;
  uint64_t v40 = (uint64_t (**)(void))MEMORY[0x186E47C94](v64);
  v61[0] = v7;
  v61[1] = 3221225472LL;
  v61[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_6;
  v61[3] = &unk_189F63AD8;
  v61[4] = *(void *)(a1 + 32);
  id v14 = v12;
  id v62 = v14;
  id v15 = v13;
  id v63 = v15;
  uint64_t v39 = (uint64_t (**)(void))MEMORY[0x186E47C94](v61);
  v58[0] = v7;
  v58[1] = 3221225472LL;
  v58[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_7;
  v58[3] = &unk_189F63AB0;
  id v16 = v14;
  id v59 = v16;
  id v17 = v15;
  id v60 = v17;
  uint64_t v43 = (uint64_t (**)(void))MEMORY[0x186E47C94](v58);
  v55[0] = v7;
  v55[1] = 3221225472LL;
  v55[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_8;
  v55[3] = &unk_189F63B00;
  v55[4] = *(void *)(a1 + 32);
  id v18 = v16;
  id v56 = v18;
  id v19 = v17;
  id v57 = v19;
  int v20 = (uint64_t (**)(void, void))MEMORY[0x186E47C94](v55);
  v52[0] = v7;
  v52[1] = 3221225472LL;
  v52[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_9;
  v52[3] = &unk_189F63AD8;
  v52[4] = *(void *)(a1 + 32);
  id v21 = v18;
  id v53 = v21;
  id v22 = v19;
  id v54 = v22;
  char v23 = (uint64_t (**)(void))MEMORY[0x186E47C94](v52);
  v48[0] = v7;
  v48[1] = 3221225472LL;
  v48[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_10;
  v48[3] = &unk_189F63B28;
  id v24 = v21;
  uint64_t v25 = *(void *)(a1 + 32);
  id v38 = v24;
  id v49 = v24;
  uint64_t v50 = v25;
  id v37 = v22;
  id v51 = v37;
  uint64_t v26 = (uint64_t (**)(void))MEMORY[0x186E47C94](v48);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v27 = *(id *)(a1 + 40);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v73 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v45;
LABEL_3:
    uint64_t v31 = 0LL;
    while (2)
    {
      if (*(void *)v45 != v30) {
        objc_enumerationMutation(v27);
      }
      uint64_t v32 = [*(id *)(*((void *)&v44 + 1) + 8 * v31) unsignedLongLongValue];
      switch(v32 & 0x7FFFFFFFFFFFFFFFLL)
      {
        case 1LL:
          int v34 = v42;
          goto LABEL_17;
        case 2LL:
          int v34 = v41;
          goto LABEL_17;
        case 3LL:
          uint64_t v33 = v20[2](v20, 1LL);
          goto LABEL_18;
        case 4LL:
          uint64_t v33 = v20[2](v20, 0LL);
          goto LABEL_18;
        case 5LL:
          uint64_t v33 = v23[2](v23);
          goto LABEL_18;
        case 6LL:
        case 7LL:
        case 8LL:
        case 9LL:
          uint64_t v33 = v26[2](v26);
          goto LABEL_18;
        case 0xALL:
          int v34 = v43;
          goto LABEL_17;
        case 0xBLL:
          int v34 = v39;
          goto LABEL_17;
        case 0xCLL:
          int v34 = v40;
LABEL_17:
          uint64_t v33 = ((uint64_t (*)(uint64_t (**)(void)))v34[2])(v34);
LABEL_18:
          if (!v33) {
            goto LABEL_19;
          }
          if (v32 >= 0) {
            uint64_t v35 = v33;
          }
          else {
            uint64_t v35 = -v33;
          }

          goto LABEL_36;
        default:
LABEL_19:
          if (v29 != ++v31) {
            continue;
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v44 objects:v73 count:16];
          if (!v29) {
            goto LABEL_21;
          }
          goto LABEL_3;
      }
    }
  }

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) name];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v2 length])
  {

    uint64_t v2 = 0LL;
  }

  if ([v3 length])
  {
    BOOL v4 = v2 != 0LL;
    if (v2 && v3)
    {
      uint64_t v5 = [v2 compare:v3 options:577];
      goto LABEL_11;
    }
  }

  else
  {

    id v3 = 0LL;
    BOOL v4 = v2 != 0LL;
  }

  if (v4) {
    uint64_t v5 = -1LL;
  }
  else {
    uint64_t v5 = 1LL;
  }
LABEL_11:

  return v5;
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_4(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) uniquePid];
  if (v2 < [*(id *)(a1 + 40) uniquePid]) {
    return -1LL;
  }
  unint64_t v3 = [*(id *)(a1 + 32) uniquePid];
  if (v3 > [*(id *)(a1 + 40) uniquePid]) {
    return 1LL;
  }
  int v5 = [*(id *)(a1 + 32) pid];
  int v6 = [*(id *)(a1 + 32) pid];
  return v6 > (int)[*(id *)(a1 + 40) pid];
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_5(uint64_t a1)
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [*(id *)(a1 + 40) startTimestamp];
  BOOL v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (v2) {
      uint64_t v6 = -1LL;
    }
    else {
      uint64_t v6 = v3 != 0;
    }
  }

  else
  {
    uint64_t v6 = [v2 compare:v3];
  }

  return v6;
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_6(uint64_t a1)
{
  BOOL v2 = -[SASamplePrinter hasTimeIndexes](*(void *)(a1 + 32));
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  if (v2)
  {
    unint64_t v5 = [v3 sampleCountInSampleIndexRangeStart:v4[6] end:v4[7]];
    unint64_t v6 = [*(id *)(a1 + 48) sampleCountInSampleIndexRangeStart:*(void *)(*(void *)(a1 + 32) + 48) end:*(void *)(*(void *)(a1 + 32) + 56)];
  }

  else
  {
    unint64_t v5 = [v3 sampleCountInTimestampRangeStart:v4[4] end:v4[5]];
    unint64_t v6 = [*(id *)(a1 + 48) sampleCountInTimestampRangeStart:*(void *)(*(void *)(a1 + 32) + 32) end:*(void *)(*(void *)(a1 + 32) + 40)];
  }

  if (v5 > v6) {
    return -1LL;
  }
  else {
    return v5 < v6;
  }
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_7(uint64_t a1)
{
  if ([*(id *)(a1 + 32) uniquePid]) {
    int v2 = [*(id *)(a1 + 32) pid] == 0;
  }
  else {
    int v2 = 1;
  }
  if ([*(id *)(a1 + 40) uniquePid]) {
    int v3 = [*(id *)(a1 + 40) pid] == 0;
  }
  else {
    int v3 = 1;
  }
  uint64_t v4 = 1LL;
  if (!v2) {
    uint64_t v4 = -1LL;
  }
  if (v3 == v2) {
    return 0LL;
  }
  else {
    return v4;
  }
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_8(uint64_t a1, char a2)
{
  int v4 = -[SASamplePrinter highestPriorityInTask:useBasePriority:](*(void *)(a1 + 32), *(void **)(a1 + 40), a2);
  int v5 = -[SASamplePrinter highestPriorityInTask:useBasePriority:](*(void *)(a1 + 32), *(void **)(a1 + 48), a2);
  if (v4 <= v5) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = -1LL;
  }
  if (v4 < v5) {
    return 1LL;
  }
  else {
    return v6;
  }
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_9(uint64_t a1)
{
  int v2 = -[SASamplePrinter largestFootprintInTask:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  int v3 = -[SASamplePrinter largestFootprintInTask:](*(void **)(a1 + 32), *(void **)(a1 + 48));
  if (v2 <= v3) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = -1LL;
  }
  if (v2 < v3) {
    return 1LL;
  }
  else {
    return v4;
  }
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_10(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  unint64_t v21 = 0LL;
  unint64_t v22 = 0LL;
  unint64_t v20 = 0LL;
  [*(id *)(a1 + 32) cpuTimeNs:&v22 cpuInstructions:&v21 cpuCycles:&v20 betweenStartTime:*(void *)(*(void *)(a1 + 40) + 32) endTime:*(void *)(*(void *)(a1 + 40) + 40)];
  unint64_t v18 = 0LL;
  unint64_t v19 = 0LL;
  unint64_t v17 = 0LL;
  [*(id *)(a1 + 48) cpuTimeNs:&v19 cpuInstructions:&v18 cpuCycles:&v17 betweenStartTime:*(void *)(*(void *)(a1 + 40) + 32) endTime:*(void *)(*(void *)(a1 + 40) + 40)];
  switch(a2)
  {
    case 6LL:
      unint64_t v4 = v22;
      unint64_t v5 = v19;
      goto LABEL_12;
    case 7LL:
      unint64_t v4 = v21;
      unint64_t v5 = v18;
      goto LABEL_12;
    case 8LL:
      unint64_t v4 = v20;
      unint64_t v5 = v17;
LABEL_12:
      if (v4 < v5) {
        return 1LL;
      }
      if (v4 <= v5) {
        return 0LL;
      }
      return -1LL;
    case 9LL:
      double v6 = 0.0;
      double v7 = 0.0;
      if (v21) {
        double v7 = (double)v20 / (double)v21;
      }
      if (v18) {
        double v6 = (double)v17 / (double)v18;
      }
      if (v7 < v6) {
        return 1LL;
      }
      if (v7 <= v6) {
        return 0LL;
      }
      return -1LL;
    default:
      int v9 = *__error();
      _sa_logt();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 134217984;
        uint64_t v24 = a2;
        _os_log_error_impl(&dword_186C92000, v10, OS_LOG_TYPE_ERROR, "invalid sort option 0x%llx", buf, 0xCu);
      }

      *__error() = v9;
      _SASetCrashLogMessage(5122, "invalid sort option 0x%llx", v11, v12, v13, v14, v15, v16, a2);
      _os_crash();
      __break(1u);
      JUMPOUT(0x186D31F74LL);
  }

void __41__SASamplePrinter_printTasksIndividually__block_invoke_957(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v25 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 16) printJson])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
    if (!*(_BYTE *)(v3 + 24))
    {
      [*(id *)(*(void *)(a1 + 32) + 8) appendString:@","];
      uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
    }

    *(_BYTE *)(v3 + 24) = 0;
    [*(id *)(*(void *)(a1 + 32) + 8) appendString:@"\n\n\n{"];
  }

  if (*(id *)(a1 + 40) != v25
    || ![*(id *)(*(void *)(a1 + 32) + 16) printTargetThreadOnly])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (!v4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 160);
  if (v5 && (*(_BYTE *)(v5 + 326) & 1) != 0 && *(void *)(v4 + 112))
  {
LABEL_13:
    -[SASamplePrinter printTask:specialDispatchQueueId:specialThreadId:omitSpecial:omitOther:]( (id *)v4,  v25,  0LL,  0LL,  0LL,  0);
    goto LABEL_14;
  }

  uint64_t v6 = [*(id *)(v4 + 160) targetDispatchQueueId];
  if (v6)
  {
    [v25 dispatchQueues];
    double v7 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithUnsignedLongLong:v6];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 160) targetThreadId];
  if (v10)
  {
    [v25 threads];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithUnsignedLongLong:v10];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  if (!(v10 | v6))
  {
    uint64_t v14 = [v25 mainThread];

    uint64_t v13 = v14;
  }

  if (!(v9 | v13))
  {
    int v15 = *__error();
    _sa_logt();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v25 debugDescription];
      *(_DWORD *)__int128 buf = 134218498;
      uint64_t v27 = v6;
      __int16 v28 = 2048;
      uint64_t v29 = v10;
      __int16 v30 = 2080;
      uint64_t v31 = [v17 UTF8String];
      _os_log_error_impl( &dword_186C92000,  v16,  OS_LOG_TYPE_ERROR,  "target dispatch queue %llu, thread id 0x%llx, target task %s: no target dispatch queue nor thread",  buf,  0x20u);
    }

    *__error() = v15;
    id v18 = [v25 debugDescription];
    [v18 UTF8String];
    _SASetCrashLogMessage( 5248,  "target dispatch queue %llu, thread id 0x%llx, target task %s: no target dispatch queue nor thread",  v19,  v20,  v21,  v22,  v23,  v24,  v6);

    _os_crash();
    __break(1u);
  }

  -[SASamplePrinter printTask:specialDispatchQueueId:specialThreadId:omitSpecial:omitOther:]( *(id **)(a1 + 32),  v25,  [(id)v9 identifier],  objc_msgSend((id)v13, "threadId"),  0,  0);

LABEL_14:
}

- (void)printTask:(unint64_t)a3 specialDispatchQueueId:(uint64_t)a4 specialThreadId:(char *)a5 omitSpecial:(int)a6 omitOther:
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  id v11 = a2;
  if (a1)
  {
    uint64_t v12 = (void *)MEMORY[0x186E47ACC]();
    if ((_DWORD)a5 && a6)
    {
      int v52 = *__error();
      _sa_logt();
      id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_error_impl(&dword_186C92000, v53, OS_LOG_TYPE_ERROR, "Omitting special and other", buf, 2u);
      }

      *__error() = v52;
      _SASetCrashLogMessage(5961, "Omitting special and other", v54, v55, v56, v57, v58, v59, v60);
      _os_crash();
      __break(1u);
    }

    uint64_t v13 = -[SASamplePrinter printTaskHeaderForTask:specialDispatchQueueId:specialThreadId:omitSpecial:omitOther:]( (uint64_t)a1,  v11,  a3,  a4,  a5,  a6);
    if (v13 < 0) {
      goto LABEL_49;
    }
    unint64_t v14 = v13;
    int v15 = a1[2];
    if (!v15 || (uint64_t v16 = v15[19], v16 != 3) && (v16 || !*((_BYTE *)v15 + 11)))
    {
      id v23 = v11;
      context = (void *)MEMORY[0x186E47ACC]();
      -[SASamplePrinter stacksForTask:taskSampleCount:](a1, v23, v14);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      id v62 = v23;
      id v65 = v12;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v66 objects:buf count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = 0LL;
        uint64_t v29 = *(void *)v67;
        do
        {
          for (uint64_t i = 0LL; i != v27; ++i)
          {
            if (*(void *)v67 != v29) {
              objc_enumerationMutation(v25);
            }
            uint64_t v31 = *(_BYTE **)(*((void *)&v66 + 1) + 8 * i);
            if (!v31 || (v31[8] & 1) == 0)
            {
              int v32 = [a1[2] printJson];
              uint64_t v33 = @"\n";
              if (v32)
              {
                if (v28) {
                  [a1[1] appendString:@","];
                }
                uint64_t v33 = @"{";
              }

              [a1[1] appendString:v33];
              -[SASamplePrinter printStack:stream:]((uint64_t)a1, v31, a1[1]);
              ++v28;
            }
          }

          uint64_t v27 = [v25 countByEnumeratingWithState:&v66 objects:buf count:16];
        }

        while (v27);
      }

      else
      {
        uint64_t v28 = 0LL;
      }

      if ([a1[2] printJson])
      {
        [a1[1] appendString:@"]\n\n"];
        uint64_t v12 = v65;
      }

      else
      {
        uint64_t v12 = v65;
        if (!v28)
        {
          [v62 taskStates];
          id v37 = (void *)objc_claimAutoreleasedReturnValue();
          [v37 firstObject];
          id v38 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v39 = [v38 endSampleIndex];
          [v62 taskStates];
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
          [v40 lastObject];
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v42 = [v41 endSampleIndex];

          BOOL v43 = v39 >= v42;
          uint64_t v12 = v65;
          if (!v43)
          {
LABEL_40:
            [a1[1] appendString:@"\n"];
            objc_msgSend(a1[1], "printWithFormat:", @"%*sNo threads sampled\n", 2, "", context);
          }
        }
      }

      objc_autoreleasePoolPop(context);
      goto LABEL_47;
    }

    if (!(a4 | a3))
    {
      *(void *)__int128 buf = v11;
      int v34 = (void *)MEMORY[0x189603F18];
      id v35 = v11;
      [v34 arrayWithObjects:buf count:1];
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();

      -[SASamplePrinter printSingleStackForTasks:limitToDispatchQueueIds:limitToThreadIds:intersection:sampleCount:]( (uint64_t)a1,  v36,  0LL,  0LL,  0,  v14);
      goto LABEL_47;
    }

    uint64_t v64 = v12;
    if (a6)
    {
      id v17 = objc_alloc(MEMORY[0x189604010]);
      [MEMORY[0x189607968] numberWithUnsignedLongLong:a4];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = (void *)objc_msgSend(v17, "initWithObjects:", v18, 0);

      id v20 = objc_alloc(MEMORY[0x189604010]);
      [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = (void *)objc_msgSend(v20, "initWithObjects:", v21, 0);
    }

    else
    {
      id v44 = objc_alloc(MEMORY[0x189603FE0]);
      [v11 threads];
      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue();
      [v45 allKeys];
      __int128 v46 = (void *)objc_claimAutoreleasedReturnValue();
      id v63 = (void *)[v44 initWithArray:v46];

      id v47 = objc_alloc(MEMORY[0x189603FE0]);
      [v11 dispatchQueues];
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
      [v48 allKeys];
      id v49 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = (void *)[v47 initWithArray:v49];

      if (!(_DWORD)a5)
      {
        uint64_t v19 = v63;
        uint64_t v12 = v64;
        goto LABEL_46;
      }

      [MEMORY[0x189607968] numberWithUnsignedLongLong:a4];
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = v63;
      [v63 removeObject:v50];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 removeObject:v21];
    }

    uint64_t v12 = v64;

LABEL_46:
    id v70 = v11;
    [MEMORY[0x189603F18] arrayWithObjects:&v70 count:1];
    id v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASamplePrinter printSingleStackForTasks:limitToDispatchQueueIds:limitToThreadIds:intersection:sampleCount:]( (uint64_t)a1,  v51,  v22,  v19,  a6,  v14);

LABEL_47:
    if (([a1[2] binaryImagesBeforeStacks] & 1) == 0) {
      -[SASamplePrinter printBinaryImagesForTask:]((uint64_t)a1, v11);
    }
LABEL_49:
    objc_autoreleasePoolPop(v12);
  }
}

void __44__SASamplePrinter_printTasksWithAggregation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(id *)(a1 + 32) != v3)
  {
    [v3 mainBinary];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (-[SASamplePrinter shouldPrintTask:thread:dispatchQueue:](*(void *)(a1 + 40), v4, 0LL, 0LL))
      {
        if (*(_BYTE *)(a1 + 56))
        {
          uint64_t v6 = (void *)[v4 resourceCoalitionID];
          if (v6)
          {
            [v4 sharedCache];
            double v7 = (void *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            double v7 = 0LL;
          }
        }

        else
        {
          double v7 = 0LL;
          uint64_t v6 = 0LL;
        }

        id v11 = -[SATaskAggregationIdentifier initWithBinary:sharedCache:rcid:]( (id *)objc_alloc(&OBJC_CLASS___SATaskAggregationIdentifier),  v5,  v7,  v6);
        [*(id *)(a1 + 48) objectForKeyedSubscript:v11];
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
          [*(id *)(a1 + 48) setObject:v12 forKeyedSubscript:v11];
        }

        [v12 addObject:v4];
      }
    }

    else
    {
      int v8 = *__error();
      _sa_logt();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[SASamplePrinter displayNameForTask:includePid:](*(void **)(a1 + 40), v4, 1);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        int v13 = 138412290;
        unint64_t v14 = v10;
        _os_log_impl( &dword_186C92000,  v9,  OS_LOG_TYPE_DEFAULT,  "WARNING: No main binary for %@, not including in report",  (uint8_t *)&v13,  0xCu);
      }

      *__error() = v8;
    }
  }
}

- (id)displayNameForTask:(int)a3 includePid:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:64];
    [v5 name];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      [v5 name];
      double v7 = (void *)objc_claimAutoreleasedReturnValue();
      SACopySanitizedString(v7, 1, 0LL);
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 appendString:v8];
    }

    else
    {
      else {
        uint64_t v9 = @"kernel_task";
      }
      [a1 appendString:v9];
    }

    [v5 bundleName];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      [v5 bundleName];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      SACopySanitizedString(v11, 1, 0LL);
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 appendFormat:@" (%@)", v12];
    }

    if (a3)
    {
      objc_msgSend(a1, "appendFormat:", @" [%d]", objc_msgSend(v5, "pid"));
      if ([v5 uniquePid] != -1)
      {
        uint64_t v13 = [v5 uniquePid];
      }
    }
  }

  return a1;
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_963(uint64_t a1, void *a2, void *a3)
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v74[0] = MEMORY[0x1895F87A8];
  v74[1] = 3221225472LL;
  v74[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_2;
  v74[3] = &unk_189F63AB0;
  id v8 = v5;
  id v75 = v8;
  id v9 = v6;
  id v76 = v9;
  BOOL v43 = (uint64_t (**)(void))MEMORY[0x186E47C94](v74);
  v71[0] = v7;
  v71[1] = 3221225472LL;
  v71[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_3;
  v71[3] = &unk_189F63AB0;
  id v10 = v8;
  id v72 = v10;
  id v11 = v9;
  id v73 = v11;
  uint64_t v41 = (uint64_t (**)(void))MEMORY[0x186E47C94](v71);
  v68[0] = v7;
  v68[1] = 3221225472LL;
  v68[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_4;
  v68[3] = &unk_189F63AB0;
  id v12 = v10;
  id v69 = v12;
  id v13 = v11;
  id v70 = v13;
  unint64_t v42 = (uint64_t (**)(void))MEMORY[0x186E47C94](v68);
  v65[0] = v7;
  v65[1] = 3221225472LL;
  v65[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_5;
  v65[3] = &unk_189F63AD8;
  v65[4] = *(void *)(a1 + 32);
  id v14 = v12;
  id v66 = v14;
  id v15 = v13;
  id v67 = v15;
  id v44 = (uint64_t (**)(void))MEMORY[0x186E47C94](v65);
  v62[0] = v7;
  v62[1] = 3221225472LL;
  v62[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_6;
  v62[3] = &unk_189F63AB0;
  id v16 = v14;
  id v63 = v16;
  id v17 = v15;
  id v64 = v17;
  __int128 v45 = (uint64_t (**)(void))MEMORY[0x186E47C94](v62);
  v58[0] = v7;
  v58[1] = 3221225472LL;
  v58[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_7;
  v58[3] = &unk_189F63B00;
  id v18 = v16;
  uint64_t v19 = *(void *)(a1 + 32);
  id v59 = v18;
  uint64_t v60 = v19;
  id v20 = v17;
  id v61 = v20;
  uint64_t v21 = (uint64_t (**)(void, void))MEMORY[0x186E47C94](v58);
  v54[0] = v7;
  v54[1] = 3221225472LL;
  v54[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_8;
  v54[3] = &unk_189F63AD8;
  id v22 = v18;
  uint64_t v23 = *(void *)(a1 + 32);
  id v55 = v22;
  uint64_t v56 = v23;
  id v24 = v20;
  id v57 = v24;
  id v25 = (uint64_t (**)(void))MEMORY[0x186E47C94](v54);
  v50[0] = v7;
  v50[1] = 3221225472LL;
  v50[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_9;
  v50[3] = &unk_189F63B28;
  id v26 = v22;
  uint64_t v27 = *(void *)(a1 + 32);
  id v40 = v26;
  id v51 = v26;
  uint64_t v52 = v27;
  id v39 = v24;
  id v53 = v39;
  uint64_t v28 = (uint64_t (**)(void))MEMORY[0x186E47C94](v50);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v29 = *(id *)(a1 + 40);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v77 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v47;
LABEL_3:
    uint64_t v33 = 0LL;
    while (2)
    {
      if (*(void *)v47 != v32) {
        objc_enumerationMutation(v29);
      }
      uint64_t v34 = [*(id *)(*((void *)&v46 + 1) + 8 * v33) unsignedLongLongValue];
      switch(v34 & 0x7FFFFFFFFFFFFFFFLL)
      {
        case 1LL:
          uint64_t v36 = v43;
          goto LABEL_17;
        case 2LL:
          uint64_t v36 = v41;
          goto LABEL_17;
        case 3LL:
          uint64_t v35 = v21[2](v21, 1LL);
          goto LABEL_18;
        case 4LL:
          uint64_t v35 = v21[2](v21, 0LL);
          goto LABEL_18;
        case 5LL:
          uint64_t v35 = v25[2](v25);
          goto LABEL_18;
        case 6LL:
        case 7LL:
        case 8LL:
        case 9LL:
          uint64_t v35 = v28[2](v28);
          goto LABEL_18;
        case 0xALL:
          uint64_t v36 = v45;
          goto LABEL_17;
        case 0xBLL:
          uint64_t v36 = v44;
          goto LABEL_17;
        case 0xCLL:
          uint64_t v36 = v42;
LABEL_17:
          uint64_t v35 = ((uint64_t (*)(uint64_t (**)(void)))v36[2])(v36);
LABEL_18:
          if (!v35) {
            goto LABEL_19;
          }
          if (v34 >= 0) {
            uint64_t v37 = v35;
          }
          else {
            uint64_t v37 = -v35;
          }

          goto LABEL_34;
        default:
LABEL_19:
          if (v31 != ++v33) {
            continue;
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v77 count:16];
          if (!v31) {
            goto LABEL_21;
          }
          goto LABEL_3;
      }
    }
  }

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_2(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 name];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) firstObject];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 name];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (![v3 length])
  {

    id v3 = 0LL;
  }

  if ([v5 length])
  {
    BOOL v6 = v3 != 0LL;
    if (v3 && v5)
    {
      uint64_t v7 = [v3 compare:v5 options:577];
      goto LABEL_11;
    }
  }

  else
  {

    id v5 = 0LL;
    BOOL v6 = v3 != 0LL;
  }

  if (v6) {
    uint64_t v7 = -1LL;
  }
  else {
    uint64_t v7 = 1LL;
  }
LABEL_11:

  return v7;
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_3(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) firstObject];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = [v2 uniquePid];
  if (v4 < [v3 uniquePid])
  {
LABEL_5:
    uint64_t v6 = -1LL;
    goto LABEL_6;
  }

  unint64_t v5 = [v2 uniquePid];
  if (v5 <= [v3 uniquePid])
  {
    int v7 = [v2 pid];
    if (v7 >= (int)[v3 pid])
    {
      int v9 = [v2 pid];
      uint64_t v6 = v9 > (int)[v3 pid];
      goto LABEL_6;
    }

    goto LABEL_5;
  }

  uint64_t v6 = 1LL;
LABEL_6:

  return v6;
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_4(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 startTimestamp];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) firstObject];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 startTimestamp];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (v3) {
      uint64_t v7 = -1LL;
    }
    else {
      uint64_t v7 = v5 != 0LL;
    }
  }

  else
  {
    uint64_t v7 = [v3 compare:v5];
  }

  return v7;
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_5(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (-[SASamplePrinter hasTimeIndexes](*(void *)(a1 + 32)))
  {
    __int128 v38 = 0uLL;
    __int128 v39 = 0uLL;
    __int128 v36 = 0uLL;
    __int128 v37 = 0uLL;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      unint64_t v5 = 0LL;
      uint64_t v6 = *(void *)v37;
      do
      {
        for (uint64_t i = 0LL; i != v4; ++i)
        {
          if (*(void *)v37 != v6) {
            objc_enumerationMutation(v2);
          }
          v5 += [*(id *)(*((void *)&v36 + 1) + 8 * i) sampleCountInSampleIndexRangeStart:*(void *)(*(void *)(a1 + 32) + 48) end:*(void *)(*(void *)(a1 + 32) + 56)];
        }

        uint64_t v4 = [v2 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }

      while (v4);
    }

    else
    {
      unint64_t v5 = 0LL;
    }

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      unint64_t v16 = 0LL;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (uint64_t j = 0LL; j != v15; ++j)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v13);
          }
          v16 += [*(id *)(*((void *)&v32 + 1) + 8 * j) sampleCountInSampleIndexRangeStart:*(void *)(*(void *)(a1 + 32) + 48) end:*(void *)(*(void *)(a1 + 32) + 56)];
        }

        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }

      while (v15);
      goto LABEL_37;
    }

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_6(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) firstObject];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 uniquePid]) {
    int v4 = [v2 pid] == 0;
  }
  else {
    int v4 = 1;
  }
  if ([v3 uniquePid]) {
    int v5 = [v3 pid] == 0;
  }
  else {
    int v5 = 1;
  }
  uint64_t v6 = 1LL;
  if (!v4) {
    uint64_t v6 = -1LL;
  }
  if (v5 == v4) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = v6;
  }

  return v7;
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_7(uint64_t a1, char a2)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v4);
        }
        int v10 = -[SASamplePrinter highestPriorityInTask:useBasePriority:]( *(void *)(a1 + 40),  *(void **)(*((void *)&v24 + 1) + 8 * i),  a2);
        if (v10 > v7) {
          int v7 = v10;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v6);
  }

  else
  {
    int v7 = 0;
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    int v14 = 0;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t j = 0LL; j != v13; ++j)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v11);
        }
        int v17 = -[SASamplePrinter highestPriorityInTask:useBasePriority:]( *(void *)(a1 + 40),  *(void **)(*((void *)&v20 + 1) + 8 * j),  a2);
        if (v17 > v14) {
          int v14 = v17;
        }
      }

      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v13);
  }

  else
  {
    int v14 = 0;
  }

  if (v7 <= v14) {
    uint64_t v18 = 0LL;
  }
  else {
    uint64_t v18 = -1LL;
  }
  if (v7 < v14) {
    return 1LL;
  }
  else {
    return v18;
  }
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_8(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = -[SASamplePrinter largestFootprintInTask:]( *(void **)(a1 + 40),  *(void **)(*((void *)&v22 + 1) + 8 * i));
        if (v8 > v5) {
          uint64_t v5 = v8;
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v4);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0LL;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t j = 0LL; j != v11; ++j)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = -[SASamplePrinter largestFootprintInTask:]( *(void **)(a1 + 40),  *(void **)(*((void *)&v18 + 1) + 8 * j));
        if (v15 > v12) {
          uint64_t v12 = v15;
        }
      }

      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v11);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  if (v5 <= v12) {
    uint64_t v16 = 0LL;
  }
  else {
    uint64_t v16 = -1LL;
  }
  if (v5 < v12) {
    return 1LL;
  }
  else {
    return v16;
  }
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_9(uint64_t a1, uint64_t a2)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    unint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v41;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        *(void *)__int128 buf = 0LL;
        uint64_t v38 = 0LL;
        uint64_t v39 = 0LL;
        [v11 cpuTimeNs:buf cpuInstructions:&v39 cpuCycles:&v38 betweenStartTime:*(void *)(*(void *)(a1 + 40) + 32) endTime:*(void *)(*(void *)(a1 + 40) + 40)];
        v8 += *(void *)buf;
        v7 += v39;
        v6 += v38;
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }

    while (v5);
  }

  else
  {
    unint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    unint64_t v8 = 0LL;
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  obuint64_t j = *(id *)(a1 + 48);
  uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unint64_t v14 = 0LL;
    unint64_t v15 = 0LL;
    unint64_t v16 = 0LL;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (uint64_t j = 0LL; j != v13; ++j)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(obj);
        }
        __int128 v19 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        *(void *)__int128 buf = 0LL;
        uint64_t v38 = 0LL;
        uint64_t v39 = 0LL;
        [v19 cpuTimeNs:buf cpuInstructions:&v39 cpuCycles:&v38 betweenStartTime:*(void *)(*(void *)(a1 + 40) + 32) endTime:*(void *)(*(void *)(a1 + 40) + 40)];
        v16 += *(void *)buf;
        v15 += v39;
        v14 += v38;
      }

      uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
    }

    while (v13);
  }

  else
  {
    unint64_t v14 = 0LL;
    unint64_t v15 = 0LL;
    unint64_t v16 = 0LL;
  }

  switch(a2)
  {
    case 6LL:
      BOOL v20 = v8 > v16;
      if (v8 >= v16) {
        goto LABEL_33;
      }
      return 1LL;
    case 7LL:
      BOOL v20 = v7 > v15;
      if (v7 < v15) {
        return 1LL;
      }
      goto LABEL_33;
    case 8LL:
      BOOL v20 = v6 > v14;
      if (v6 < v14) {
        return 1LL;
      }
LABEL_33:
      if (!v20) {
        return 0LL;
      }
      return -1LL;
    case 9LL:
      double v21 = 0.0;
      double v22 = 0.0;
      if (v7) {
        double v22 = (double)v6 / (double)v7;
      }
      if (v15) {
        double v21 = (double)v14 / (double)v15;
      }
      if (v22 < v21) {
        return 1LL;
      }
      if (v22 <= v21) {
        return 0LL;
      }
      return -1LL;
    default:
      int v24 = *__error();
      _sa_logt();
      __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)&uint8_t buf[4] = a2;
        _os_log_error_impl(&dword_186C92000, v25, OS_LOG_TYPE_ERROR, "invalid sort option 0x%llx", buf, 0xCu);
      }

      *__error() = v24;
      _SASetCrashLogMessage(5508, "invalid sort option 0x%llx", v26, v27, v28, v29, v30, v31, a2);
      _os_crash();
      __break(1u);
      JUMPOUT(0x186D33E24LL);
  }

- (void)printSingleStackForTasks:(void *)a3 limitToDispatchQueueIds:(void *)a4 limitToThreadIds:(char)a5 intersection:(unint64_t)a6 sampleCount:
{
  uint64_t v182 = *MEMORY[0x1895F89C0];
  id v11 = a2;
  *((void *)&v133 + 1) = a3;
  *(void *)&__int128 v133 = a4;
  uint64_t v135 = a1;
  if (([*(id *)(a1 + 16) printHeavyStacks] & 1) == 0)
  {
    int v81 = *__error();
    _sa_logt();
    __int128 v82 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      LOWORD(dest.receiver) = 0;
      _os_log_error_impl(&dword_186C92000, v82, OS_LOG_TYPE_ERROR, "!printHeavyStacks", (uint8_t *)&dest, 2u);
    }

    *__error() = v81;
    _SASetCrashLogMessage(7975, "!printHeavyStacks", v83, v84, v85, v86, v87, v88, v122);
    _os_crash();
    __break(1u);
    goto LABEL_93;
  }

  if (![v11 count])
  {
LABEL_93:
    int v89 = *__error();
    _sa_logt();
    uint64_t v90 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      LOWORD(dest.receiver) = 0;
      _os_log_error_impl( &dword_186C92000,  v90,  OS_LOG_TYPE_ERROR,  "Printing single stack for 0 tasks",  (uint8_t *)&dest,  2u);
    }

    *__error() = v89;
    _SASetCrashLogMessage(7976, "Printing single stack for 0 tasks", v91, v92, v93, v94, v95, v96, v122);
    _os_crash();
    __break(1u);
    goto LABEL_96;
  }

  if (v133 != 0 && [v11 count] != 1)
  {
LABEL_96:
    int v97 = *__error();
    _sa_logt();
    uint64_t v98 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
    {
      LOWORD(dest.receiver) = 0;
      _os_log_error_impl( &dword_186C92000,  v98,  OS_LOG_TYPE_ERROR,  "Limiting to specific dispatch queues/threads, but with multiple tasks",  (uint8_t *)&dest,  2u);
    }

    *__error() = v97;
    _SASetCrashLogMessage( 7977,  "Limiting to specific dispatch queues/threads, but with multiple tasks",  v99,  v100,  v101,  v102,  v103,  v104,  v122);
    _os_crash();
    __break(1u);
    goto LABEL_99;
  }

  id v132 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (([*(id *)(a1 + 16) microstackshotsFormat] & 1) != 0
    || [*(id *)(a1 + 16) systemstatsFormat])
  {
    self = objc_alloc_init(&OBJC_CLASS___SAMicrostackshotSummary);
  }

  else
  {
    self = 0LL;
  }

  __int128 v173 = 0u;
  __int128 v174 = 0u;
  __int128 v171 = 0u;
  __int128 v172 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v171 objects:v181 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v172;
    do
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        if (*(void *)v172 != v14) {
          objc_enumerationMutation(v12);
        }
        unint64_t v16 = *(void **)(*((void *)&v171 + 1) + 8 * i);
        [v16 threads];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        v163[0] = MEMORY[0x1895F87A8];
        v163[1] = 3221225472LL;
        v163[2] = __110__SASamplePrinter_printSingleStackForTasks_limitToDispatchQueueIds_limitToThreadIds_intersection_sampleCount___block_invoke;
        v163[3] = &unk_189F63EE8;
        id v164 = *((id *)&v133 + 1);
        id v18 = (id)v133;
        char v170 = a5;
        id v165 = v18;
        uint64_t v166 = v135;
        uint64_t v167 = v16;
        id v168 = v132;
        double v169 = self;
        [v17 enumerateKeysAndObjectsUsingBlock:v163];
      }

      uint64_t v13 = [v12 countByEnumeratingWithState:&v171 objects:v181 count:16];
    }

    while (v13);
  }

  [v12 firstObject];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASamplePrinter binaryImagesHitByTask:](v135, v19);
  uint64_t v126 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v127 = [v12 firstObject];
  if ([(id)v127 pid])
  {
    int v20 = 0;
  }

  else
  {
    if (v127) {
      objc_copyStruct(&dest, (const void *)(v127 + 288), 8LL, 1, 0);
    }
    int v20 = CSArchitectureIs32Bit() ^ 1;
  }

  __int128 v161 = 0u;
  __int128 v162 = 0u;
  __int128 v159 = 0u;
  __int128 v160 = 0u;
  obuint64_t j = v12;
  uint64_t v21 = [obj countByEnumeratingWithState:&v159 objects:v180 count:16];
  if (!v21)
  {
    char v136 = 0LL;
    __int128 v45 = obj;
    goto LABEL_69;
  }

  char v136 = 0LL;
  p_objc_super dest = &dest;
  uint64_t v22 = *(void *)v160;
  do
  {
    for (uint64_t j = 0LL; j != v21; ++j)
    {
      if (*(void *)v160 != v22) {
        objc_enumerationMutation(obj);
      }
      int v24 = *(void **)(*((void *)&v159 + 1) + 8 * j);
      [v24 mainBinaryLoadInfo];
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = v25;
      if (v25)
      {
        if (!v136) {
          goto LABEL_32;
        }
        unint64_t v27 = [v25 loadAddress];
        [v136 mainBinaryLoadInfo];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v29 = [v28 loadAddress];

        if (!v20)
        {
          if (v27 >= v29) {
            goto LABEL_33;
          }
LABEL_32:
          id v30 = v24;

          char v136 = v30;
          goto LABEL_33;
        }

        if (v27 > v29) {
          goto LABEL_32;
        }
      }

void __51__SASamplePrinter_printTaskHeaderForMultipleTasks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v38 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 indexOfFirstThreadStateOnOrAfterTime:*(void *)(*(void *)(a1 + 32) + 32) sampleIndex:*(void *)(*(void *)(a1 + 32) + 48)];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = v6;
    unint64_t v8 = [v5 indexOfLastThreadStateOnOrBeforeTime:*(void *)(*(void *)(a1 + 32) + 40) sampleIndex:*(void *)(*(void *)(a1 + 32) + 56)];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v9 = v8;
      unint64_t v10 = v8 - v7;
      if (v8 < v7)
      {
        int v25 = *__error();
        _sa_logt();
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          id v27 = [*(id *)(*(void *)(a1 + 32) + 32) debugDescription];
          uint64_t v28 = [v27 UTF8String];
          id v29 = [*(id *)(*(void *)(a1 + 32) + 40) debugDescription];
          *(_DWORD *)__int128 buf = 134218754;
          unint64_t v40 = v7;
          __int16 v41 = 2080;
          uint64_t v42 = v28;
          __int16 v43 = 2048;
          unint64_t v44 = v9;
          __int16 v45 = 2080;
          uint64_t v46 = [v29 UTF8String];
          _os_log_error_impl( &dword_186C92000,  v26,  OS_LOG_TYPE_ERROR,  "firstThreadStateIndex %lu after reportStartTime %s > lastThreadStateIndex %lu before reportEndTime %s",  buf,  0x2Au);
        }

        *__error() = v25;
        id v30 = [*(id *)(*(void *)(a1 + 32) + 32) debugDescription];
        [v30 UTF8String];
        id v31 = [*(id *)(*(void *)(a1 + 32) + 40) debugDescription];
        [v31 UTF8String];
        _SASetCrashLogMessage( 5802,  "firstThreadStateIndex %lu after reportStartTime %s > lastThreadStateIndex %lu before reportEndTime %s",  v32,  v33,  v34,  v35,  v36,  v37,  v7);

        _os_crash();
        __break(1u);
      }

      [v5 threadStates];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 objectAtIndexedSubscript:v7];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)
        || ([v12 startTimestamp],
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(),
            int v14 = [v13 lt:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)],
            v13,
            v14))
      {
        uint64_t v15 = [v12 startTimestamp];
        uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8LL);
        uint64_t v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        if (*(_BYTE *)(a1 + 80))
        {
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v12 startSampleIndex];
          if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) == 0x7FFFFFFFFFFFFFFFLL) {
            *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v12 endSampleIndex] + 1;
          }
        }
      }

      [v5 threadStates];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 objectAtIndexedSubscript:v9];
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)
        || ([v19 endTimestamp],
            int v20 = (void *)objc_claimAutoreleasedReturnValue(),
            int v21 = [v20 gt:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)],
            v20,
            v21))
      {
        uint64_t v22 = [v19 endTimestamp];
        uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8LL);
        int v24 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = v22;

        if (*(_BYTE *)(a1 + 80)) {
          *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v19 endSampleIndex];
        }
      }

      *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) += v10 + 1;
    }
  }
}

- (uint64_t)numIOsForTask:(void *)a3 ioSize:
{
  id v5 = a2;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  uint64_t v17 = 0LL;
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  uint64_t v13 = 0LL;
  [v5 threads];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __40__SASamplePrinter_numIOsForTask_ioSize___block_invoke;
  v9[3] = &unk_189F637A0;
  v9[4] = a1;
  v9[5] = &v14;
  v9[6] = &v10;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];

  *a3 = v15[3];
  uint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (uint64_t)printTaskHeaderForTask:(unint64_t)a3 specialDispatchQueueId:(uint64_t)a4 specialThreadId:(char *)a5 omitSpecial:(int)a6 omitOther:
{
  unint64_t v11 = (unint64_t)buf;
  uint64_t v455 = *MEMORY[0x1895F89C0];
  uint64_t v326 = a2;
  if ((_DWORD)a5 && a6)
  {
    int v192 = *__error();
    _sa_logt();
    double v193 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR))
    {
      id v194 = [v326 debugDescription];
      uint64_t v195 = [v194 UTF8String];
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v195;
      _os_log_error_impl( &dword_186C92000,  v193,  OS_LOG_TYPE_ERROR,  "%s: omitSpecialThreadId and omitOtherThreads",  buf,  0xCu);
    }

    *__error() = v192;
    id v196 = [v326 debugDescription];
    char v197 = [v196 UTF8String];
    _SASetCrashLogMessage( 6031,  "%s: omitSpecialThreadId and omitOtherThreads",  v198,  v199,  v200,  v201,  v202,  v203,  v197);

    _os_crash();
    __break(1u);
    goto LABEL_251;
  }

  int v330 = a6;
  BOOL v12 = -[SASamplePrinter hasTimeIndexes](a1);
  if (!a3) {
    goto LABEL_10;
  }
  [v326 dispatchQueues];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v334 = [v13 objectForKeyedSubscript:v14];

  if (!v334) {
    goto LABEL_260;
  }
  if (a4)
  {
    while (1)
    {
      [v326 threads];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607968] numberWithUnsignedLongLong:a4];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v324 = [v15 objectForKeyedSubscript:v16];

      if (v324) {
        break;
      }
      LODWORD(a5) = *__error();
      _sa_logt();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = [v326 debugDescription];
        uint64_t v19 = [v18 UTF8String];
        *(_DWORD *)__int128 buf = 136315394;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a4;
        _os_log_error_impl( &dword_186C92000,  v17,  OS_LOG_TYPE_ERROR,  "%s: specialThreadId 0x%llx doesn't exist",  buf,  0x16u);
      }

      *__error() = (int)a5;
      id v20 = [v326 debugDescription];
      char v21 = [v20 UTF8String];
      _SASetCrashLogMessage(6044, "%s: specialThreadId 0x%llx doesn't exist", v22, v23, v24, v25, v26, v27, v21);

      _os_crash();
      __break(1u);
LABEL_10:
      uint64_t v334 = 0LL;
      if (!a4) {
        goto LABEL_11;
      }
    }
  }

  else
  {
LABEL_11:
    uint64_t v324 = 0LL;
  }

  unint64_t v318 = a4 | a3;
  if (a4 | a3)
  {
    if ((_DWORD)a5)
    {
      uint64_t v28 = @"(other dispatch queues/threads)";
      if (!a3) {
        uint64_t v28 = @"(other threads)";
      }
      int v321 = (void *)v28;
    }

    else
    {
      id v29 = objc_alloc(NSString);
      id v30 = v29;
      if (a3)
      {
        uint64_t v31 = -[SASamplePrinter displayNameForDispatchQueue:]((void *)v334);
        uint64_t v32 = (void *)v31;
        if (a4) {
          uint64_t v33 = [v30 initWithFormat:@"%@ 0x%llx, %@ %@", @"Thread", a4, @"DispatchQueue", v31];
        }
        else {
          uint64_t v33 = [v30 initWithFormat:@"%@ %@", @"DispatchQueue", v31, v271, v272];
        }
        int v321 = (void *)v33;
      }

      else
      {
        int v321 = (void *)[v29 initWithFormat:@"%@ 0x%llx", @"Thread", a4];
      }
    }
  }

  else
  {
    int v321 = 0LL;
  }

  uint64_t v432 = 0LL;
  id v433 = &v432;
  uint64_t v434 = 0x2020000000LL;
  uint64_t v435 = 0LL;
  uint64_t v428 = 0LL;
  v429 = &v428;
  uint64_t v430 = 0x2020000000LL;
  uint64_t v431 = 0LL;
  uint64_t v424 = 0LL;
  double v425 = &v424;
  uint64_t v426 = 0x2020000000LL;
  uint64_t v427 = 0LL;
  a3 = (unint64_t)v422;
  v422[0] = 0LL;
  v422[1] = v422;
  v422[2] = 0x2020000000LL;
  char v423 = 0;
  v420[0] = 0LL;
  v420[1] = v420;
  v420[2] = 0x2020000000LL;
  char v421 = 0;
  uint64_t v416 = 0LL;
  v417 = &v416;
  uint64_t v418 = 0x2020000000LL;
  uint64_t v419 = 0LL;
  uint64_t v412 = 0LL;
  uint64_t v413 = &v412;
  uint64_t v414 = 0x2020000000LL;
  uint64_t v415 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v408 = 0LL;
  v409 = &v408;
  uint64_t v410 = 0x2020000000LL;
  uint64_t v411 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v402 = 0LL;
  double v403 = &v402;
  uint64_t v404 = 0x3032000000LL;
  id v405 = __Block_byref_object_copy__4;
  size_t v406 = __Block_byref_object_dispose__4;
  id v407 = 0LL;
  uint64_t v396 = 0LL;
  id v397 = &v396;
  uint64_t v398 = 0x3032000000LL;
  double v399 = __Block_byref_object_copy__4;
  double v400 = __Block_byref_object_dispose__4;
  id v401 = 0LL;
  uint64_t v392 = 0LL;
  double v393 = &v392;
  uint64_t v394 = 0x2020000000LL;
  uint64_t v395 = 0LL;
  uint64_t v388 = 0LL;
  v389 = &v388;
  uint64_t v390 = 0x2020000000LL;
  uint64_t v391 = 0LL;
  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3810000000LL;
  id v451 = &unk_186DA1DC3;
  uint64_t v452 = 0LL;
  uint64_t v453 = 0LL;
  uint64_t v454 = 0LL;
  uint64_t v34 = MEMORY[0x1895F87A8];
  obuint64_t j = (v324 | v334) != 0;
  if (v324 | v334)
  {
    uint64_t v35 = *(void **)(a1 + 32);
    uint64_t v36 = *(void **)(a1 + 40);
    unint64_t v37 = *(void *)(a1 + 48);
    unint64_t v38 = *(void *)(a1 + 56);
    uint64_t v39 = MEMORY[0x1895F87A8];
    v387[0] = MEMORY[0x1895F87A8];
    v387[1] = 3221225472LL;
    v387[2] = __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke;
    v387[3] = &unk_189F63C18;
    v387[4] = a1;
    v387[5] = &v392;
    v387[6] = &v388;
    v387[7] = buf;
    -[SATask enumerateThreadStatesForThread:dispatchQueue:betweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:]( (uint64_t)v326,  (void *)v324,  (void *)v334,  v35,  v37,  v36,  v38,  0LL,  v387);
    uint64_t v34 = v39;
  }

  uint64_t v40 = *(void *)(a1 + 32);
  uint64_t v41 = *(void *)(a1 + 40);
  uint64_t v42 = *(void *)(a1 + 48);
  uint64_t v43 = *(void *)(a1 + 56);
  v386[0] = v34;
  v386[1] = 3221225472LL;
  v386[2] = __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_2;
  v386[3] = &unk_189F63C40;
  v386[4] = a1;
  v386[5] = &v402;
  v386[6] = &v396;
  v386[7] = &v416;
  v386[8] = &v412;
  v386[9] = &v408;
  v386[10] = v422;
  v386[11] = v420;
  v386[12] = &v424;
  v386[13] = &v432;
  v386[14] = &v428;
  [v326 enumerateTaskStatesBetweenStartTime:v40 startSampleIndex:v42 endTime:v41 endSampleIndex:v43 reverseOrder:0 block:v386];
  uint64_t v6 = v438;
  if ((v403[5] != 0) != (v397[5] != 0))
  {
LABEL_251:
    unint64_t v11 = *__error();
    _sa_logt();
    uint64_t v204 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    a5 = "n";
    if (os_log_type_enabled(v204, OS_LOG_TYPE_ERROR))
    {
      id v205 = [v326 debugDescription];
      uint64_t v206 = [v205 UTF8String];
      if (v403[5]) {
        id v207 = "y";
      }
      else {
        id v207 = "n";
      }
      if (v397[5]) {
        uint64_t v208 = "y";
      }
      else {
        uint64_t v208 = "n";
      }
      *(_DWORD *)double v438 = 136315650;
      *(void *)(v6 + 4) = v206;
      WORD2(v439) = 2080;
      *(void *)(v6 + 14) = v207;
      HIWORD(v440) = 2080;
      uint64_t v441 = (uint64_t (*)(uint64_t, uint64_t))v208;
      _os_log_error_impl( &dword_186C92000,  v204,  OS_LOG_TYPE_ERROR,  "%s: firstTaskState %s, lastTaskState %s",  v438,  0x20u);
    }

    *__error() = v11;
    id v209 = [v326 debugDescription];
    char v210 = [v209 UTF8String];
    _SASetCrashLogMessage(6135, "%s: firstTaskState %s, lastTaskState %s", v211, v212, v213, v214, v215, v216, v210);

    _os_crash();
    __break(1u);
LABEL_260:
    int v217 = *__error();
    _sa_logt();
    double v218 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v218, OS_LOG_TYPE_ERROR))
    {
      id v219 = [v326 debugDescription];
      uint64_t v220 = [v219 UTF8String];
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)(v11 + 4) = v220;
      *(_WORD *)&buf[12] = 2048;
      *(void *)(v11 + 14) = a3;
      _os_log_error_impl( &dword_186C92000,  v218,  OS_LOG_TYPE_ERROR,  "%s: specialDispatchQueue %llu doesn't exist",  buf,  0x16u);
    }

    *__error() = v217;
    id v221 = [v326 debugDescription];
    char v222 = [v221 UTF8String];
    _SASetCrashLogMessage(6038, "%s: specialDispatchQueue %llu doesn't exist", v223, v224, v225, v226, v227, v228, v222);

    _os_crash();
    __break(1u);
    goto LABEL_263;
  }

  [v326 startTimestamp];
  uint64_t v323 = (void *)objc_claimAutoreleasedReturnValue();
  [v326 endTimestamp];
  double v322 = (void *)objc_claimAutoreleasedReturnValue();
  int v44 = v330;
  int v45 = (int)a5;
  if (!v403[5])
  {
    uint64_t v54 = -1LL;
    if (!v323
      || !v322
      || ([v323 gt:*(void *)(a1 + 40)] & 1) != 0
      || ([v322 lt:*(void *)(a1 + 32)] & 1) != 0)
    {
      goto LABEL_245;
    }
  }

  if (v12
    || ([v326 taskStates],
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(),
        BOOL v47 = [v46 count] == 0,
        v46,
        int v44 = v330,
        !v47))
  {
    if (!v318) {
      goto LABEL_50;
    }
    if ((_DWORD)a5)
    {
      if (v12) {
        goto LABEL_50;
      }
      unint64_t v48 = v425[3];
      unint64_t v49 = v393[3];
      BOOL v50 = v48 >= v49;
      unint64_t v51 = v48 - v49;
      if (!v50) {
        goto LABEL_270;
      }
      v425[3] = v51;
      uint64_t v52 = v433;
      uint64_t v53 = v433[3] - v389[3];
      goto LABEL_48;
    }

    if (!v44) {
      goto LABEL_50;
    }
    v425[3] = v393[3];
LABEL_47:
    uint64_t v53 = v389[3];
    uint64_t v52 = v433;
LABEL_48:
    v52[3] = v53;
    v429[3] = 0LL;
    goto LABEL_50;
  }

  if (v425[3]) {
    goto LABEL_267;
  }
  if (v318 && (v330 & 1) != 0)
  {
    v425[3] = v393[3];
    goto LABEL_47;
  }

  [v326 threads];
  id v55 = (void *)objc_claimAutoreleasedReturnValue();
  v380[0] = MEMORY[0x1895F87A8];
  v380[1] = 3221225472LL;
  v380[2] = __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_1002;
  v380[3] = &unk_189F63C90;
  v380[4] = a1;
  char v385 = (char)a5;
  id v381 = (id)v334;
  id v382 = (id)v324;
  uint64_t v383 = &v424;
  __int16 v384 = &v432;
  [v55 enumerateKeysAndObjectsUsingBlock:v380];

LABEL_50:
  SEL v56 = *(void **)(a1 + 128);
  if (v56)
  {
    if (v56 == v326 && !(_DWORD)a5) {
      goto LABEL_68;
    }
  }

  else
  {
    [*(id *)(a1 + 160) targetProcess];
    id v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57 == v326) {
      char v58 = (char)a5;
    }
    else {
      char v58 = 1;
    }

    if ((v58 & 1) == 0) {
      goto LABEL_68;
    }
  }

  if ([*(id *)(a1 + 16) omitTasksBelowSampleCount] < 1) {
    unint64_t v59 = 0LL;
  }
  else {
    unint64_t v59 = [*(id *)(a1 + 16) omitTasksBelowSampleCount];
  }
  if ((int)[*(id *)(a1 + 16) omitTasksBelowPercentOfTotalSamples] >= 1)
  {
    uint64_t v60 = *(void *)(a1 + 64);
    int v61 = [*(id *)(a1 + 16) omitTasksBelowPercentOfTotalSamples];
    if (v59 <= v60 * v61 / 0x64uLL) {
      unint64_t v59 = v60 * v61 / 0x64uLL;
    }
  }

  if (v59 && v425[3] <= v59)
  {
LABEL_75:
    uint64_t v54 = -1LL;
    goto LABEL_245;
  }

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke( void *a1,  void *a2,  void *a3,  unint64_t a4)
{
  uint64_t v7 = a1[4];
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = *(void *)(v7 + 56);
  id v10 = a3;
  id v11 = a2;
  uint64_t v12 = [v10 sampleCountInSampleIndexRangeStart:v8 end:v9];
  *(void *)(*(void *)(a1[5] + 8LL) + 24LL) += v12;
  LODWORD(v9) = [v10 isSuspended];

  if ((_DWORD)v9) {
    *(void *)(*(void *)(a1[6] + 8LL) + 24LL) += v12;
  }
  -[SAThread cpuTimeForThreadStateIndex:inTimestampRangeStart:end:]( v11,  a4,  *(void **)(a1[4] + 32LL),  *(void **)(a1[4] + 40LL),  v14);

  uint64_t v13 = v14[1];
  *(void *)(*(void *)(a1[7] + 8LL) + 32LL) += v14[0];
  *(void *)(*(void *)(a1[7] + 8LL) + 40LL) += v13;
  *(void *)(*(void *)(a1[7] + 8LL) + 48LL) += v14[2];
}

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_2( void *a1,  void *a2)
{
  id v22 = a2;
  uint64_t v4 = [v22 sampleCountInSampleIndexRangeStart:*(void *)(a1[4] + 48) end:*(void *)(a1[4] + 56)];
  if (!v4) {
    goto LABEL_21;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(a1[5] + 8LL);
  uint64_t v8 = *(void *)(v6 + 40);
  uint64_t v7 = (id *)(v6 + 40);
  if (!v8) {
    objc_storeStrong(v7, a2);
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a2);
  unint64_t v9 = *(void *)(*(void *)(a1[7] + 8LL) + 24LL);
  id v10 = v22;
  if (v9 && (BOOL v11 = v9 >= [v22 taskSizeInBytes], v10 = v22, v11))
  {
    uint64_t v18 = *(void *)(*(void *)(a1[7] + 8LL) + 24LL);
    BOOL v19 = v18 == [v22 taskSizeInBytes];
    uint64_t v17 = v22;
    if (!v19) {
      goto LABEL_12;
    }
    uint64_t v16 = a1 + 9;
    uint64_t v20 = *(void *)(*(void *)(a1[9] + 8LL) + 24LL) + 1LL;
    BOOL v19 = v20 == [v22 startSampleIndex];
    uint64_t v17 = v22;
    if (!v19) {
      goto LABEL_12;
    }
    unint64_t v21 = [v22 endSampleIndex];
    unint64_t v15 = *(void *)(a1[4] + 56LL);
    if (v21 < v15) {
      unint64_t v15 = v21;
    }
  }

  else
  {
    *(void *)(*(void *)(a1[7] + 8) + 24) = [v10 taskSizeInBytes];
    unint64_t v12 = [v22 startSampleIndex];
    unint64_t v13 = *(void *)(a1[4] + 48LL);
    if (v12 > v13) {
      unint64_t v13 = v12;
    }
    *(void *)(*(void *)(a1[8] + 8LL) + 24LL) = v13;
    unint64_t v14 = [v22 endSampleIndex];
    unint64_t v15 = *(void *)(a1[4] + 56LL);
    if (v14 < v15) {
      unint64_t v15 = v14;
    }
    uint64_t v16 = a1 + 9;
  }

  *(void *)(*(void *)(*v16 + 8LL) + 24LL) = v15;
  uint64_t v17 = v22;
LABEL_12:
  *(void *)(*(void *)(a1[12] + 8LL) + 24LL) += v5;
LABEL_21:
}

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_1002( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = v5[4];
  uint64_t v8 = v5[5];
  v12[0] = MEMORY[0x1895F87A8];
  v12[2] = __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_2_1003;
  v12[3] = &unk_189F63C68;
  char v18 = *(_BYTE *)(a1 + 72);
  uint64_t v9 = v5[6];
  uint64_t v10 = v5[7];
  v12[1] = 3221225472LL;
  id v13 = v6;
  id v14 = *(id *)(a1 + 48);
  id v15 = v4;
  uint64_t v16 = *(void *)(a1 + 32);
  __int128 v17 = *(_OWORD *)(a1 + 56);
  id v11 = v4;
  [v11 enumerateThreadStatesBetweenStartTime:v7 startSampleIndex:v9 endTime:v8 endSampleIndex:v10 reverseOrder:0 block:v12];
}

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_2_1003( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v10 = v3;
  if (!*(_BYTE *)(a1 + 80)) {
    goto LABEL_9;
  }
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (!v6)
  {
    if (v5 && v5 == *(void *)(a1 + 48)) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  if (v5 && v5 != *(void *)(a1 + 48)
    || ([v3 dispatchQueue],
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        id v4 = v10,
        v6 != v7))
  {
LABEL_9:
    uint64_t v8 = [v4 sampleCountInSampleIndexRangeStart:*(void *)(*(void *)(a1 + 56) + 48) end:*(void *)(*(void *)(a1 + 56) + 56)];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) += v8;
    int v9 = [v10 isSuspended];
    id v4 = v10;
    if (v9) {
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) += v8;
    }
  }

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_1006( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v19 = a3;
  [v19 threadStates];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 count];

  uint64_t v6 = v19;
  if (v5)
  {
    [v19 threadStates];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 firstObject];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    unint64_t v9 = [v8 startSampleIndex];
    [v19 threadStates];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 lastObject];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    unint64_t v12 = [v11 endSampleIndex];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8LL);
      unint64_t v14 = *(void *)(v13 + 24);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL || v14 > v9) {
        *(void *)(v13 + 24) = v9;
      }
    }

    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8LL);
    unint64_t v17 = *(void *)(v16 + 24);
    if (v17 == 0x7FFFFFFFFFFFFFFFLL || v17 < v12) {
      *(void *)(v16 + 24) = v12;
    }

    uint64_t v6 = v19;
  }
}

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_1009( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v6 = a2;
  if ([v6 taskSizeInBytes])
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 taskSizeInBytes];
    *a4 = 1;
  }
}

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_2_1010( uint64_t a1,  void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x189607968];
  [a2 thread];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v5, "threadId"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v4];
}

uint64_t __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_3( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = v4[4];
  uint64_t v7 = v4[5];
  uint64_t v8 = v4[6];
  uint64_t v9 = v4[7];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_4;
  v11[3] = &unk_189F63D08;
  v11[4] = v5;
  return [a3 enumerateThreadStatesBetweenStartTime:v6 startSampleIndex:v8 endTime:v7 endSampleIndex:v9 reverseOrder:0 block:v11];
}

uint64_t __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_4( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t result = [a2 isIdleWorkQueue];
  if ((_DWORD)result)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    *a4 = 1;
  }

  return result;
}

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_5( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v17 = a3;
  uint64_t v4 = [v17 originPid];
  uint64_t v5 = [v17 proximatePid];
  uint64_t v6 = v5;
  if ((_DWORD)v4 != -1 || (_DWORD)v5 != -1)
  {
    uint64_t v7 = *(id **)(a1 + 32);
    [v17 endTimestamp];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASamplePrinter displayNameForPid:aroundTimestamp:includePid:](v7, v4, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = *(id **)(a1 + 32);
    [v17 endTimestamp];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASamplePrinter displayNameForPid:aroundTimestamp:includePid:](v10, v6, v11);
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v13 = *(_DWORD **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (!v13)
    {
      unint64_t v14 = objc_alloc_init(&OBJC_CLASS___SAOnBehalfOfMultiple);
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      uint64_t v13 = *(_DWORD **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    }

    -[SAOnBehalfOfMultiple addProximateName:proximatePid:originName:originPid:count:](v13, v12, v6, v9, v4, 1);
  }
}

- (__CFString)displayNameForPid:(id *)a1 aroundTimestamp:(uint64_t)a2 includePid:(void *)a3
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!a1)
  {
LABEL_85:
    uint64_t v28 = 0LL;
    goto LABEL_31;
  }

  [a1[20] tasksByPid];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = 0x189607000uLL;
  [MEMORY[0x189607968] numberWithInt:a2];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v8];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v74 objects:v80 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      unsigned int v72 = a2;
      id v73 = v9;
      uint64_t v13 = 0LL;
      id v14 = 0LL;
      uint64_t v15 = *(void *)v75;
LABEL_5:
      uint64_t v16 = 0LL;
      id v17 = v13;
      id v18 = v14;
      while (1)
      {
        if (*(void *)v75 != v15) {
          objc_enumerationMutation(v10);
        }
        id v19 = *(void **)(*((void *)&v74 + 1) + 8 * v16);
        [v19 endTimestamp];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (([v13 ge:v5] & 1) == 0) {
          break;
        }
        id v14 = v19;

        ++v16;
        id v17 = v13;
        id v18 = v14;
        if (v12 == v16)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v74 objects:v80 count:16];
          if (v12) {
            goto LABEL_5;
          }
          goto LABEL_27;
        }
      }

      if (!v18)
      {
        id v18 = v19;
        goto LABEL_26;
      }

      [v19 startTimestamp];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v20 le:v5]) {
        goto LABEL_14;
      }
      if (v17)
      {
        [v17 machContTimeSeconds];
        if (v30 == 0.0 || ([v5 machContTimeSeconds], v31 == 0.0))
        {
          [v17 machAbsTimeSeconds];
          if (v35 == 0.0 || ([v5 machAbsTimeSeconds], v36 == 0.0))
          {
            [v17 wallTime];
            if (v38 == 0.0) {
              goto LABEL_58;
            }
            [v5 wallTime];
            if (v39 == 0.0) {
              goto LABEL_58;
            }
            [v17 wallTime];
            double v33 = v40;
            [v5 wallTime];
          }

          else
          {
            [v17 machAbsTimeSeconds];
            double v33 = v37;
            [v5 machAbsTimeSeconds];
          }
        }

        else
        {
          [v17 machContTimeSeconds];
          double v33 = v32;
          [v5 machContTimeSeconds];
        }

        double v41 = v33 - v34;
        if (v41 >= 0.0) {
          double v42 = v41;
        }
        else {
          double v42 = -v41;
        }
        if (v42 != 0.0)
        {
          [v20 machContTimeSeconds];
          if (v43 == 0.0 || ([v5 machContTimeSeconds], v44 == 0.0))
          {
            [v20 machAbsTimeSeconds];
            if (v48 == 0.0 || ([v5 machAbsTimeSeconds], v49 == 0.0))
            {
              [v20 wallTime];
              if (v51 == 0.0) {
                goto LABEL_58;
              }
              [v5 wallTime];
              if (v52 == 0.0) {
                goto LABEL_58;
              }
              [v20 wallTime];
              double v46 = v53;
              [v5 wallTime];
            }

            else
            {
              [v20 machAbsTimeSeconds];
              double v46 = v50;
              [v5 machAbsTimeSeconds];
            }
          }

          else
          {
            [v20 machContTimeSeconds];
            double v46 = v45;
            [v5 machContTimeSeconds];
          }

          double v54 = v46 - v47;
          if (v54 < 0.0) {
            double v54 = -v54;
          }
          if (v54 != 0.0)
          {
            if (v42 < v54) {
              goto LABEL_15;
            }
            goto LABEL_14;
          }
        }

uint64_t __1143__SASamplePrinter_addTaskHeaderToStream_displayName_pid_mainBinary_mainBinaryPath_sharedCaches_uid_bundleIdentifier_bundleVersion_bundleShortVersion_bundleBuildVersion_bundleProjectName_bundleSourceVersion_bundleProductBuildVersion_adamID_installerVersionID_developerType_appType_isBeta_cohortID_vendorID_distributorID_codesigningID_teamID_resourceCoalitionSampleCounts_onBehalfOfProcesses_architectureString_kernelVersion_parentName_responsibleName_taskExecedFromName_taskExecedToName_pidStartTimestamp_startTimestamp_endTimestamp_startSampleIndex_endSampleIndex_numSamples_totalNumSamples_numSamplesSuspended_numSamplesTerminated_startingTaskSize_endingTaskSize_maxTaskSize_startSampleIndexOfMaxTaskSize_endSampleIndexOfMaxTaskSize_numPageins_cpuTimeNs_cpuInstructions_cpuCycles_nonThreadCpuTimeNs_nonThreadCpuInstructions_nonThreadCpuCycles_usesSuddenTermination_allowsIdleExit_isTranslocated_isUnresponsive_timeOfLastResponse_numThreads_numIdleWorkQueueThreads_numOtherHiddenThreads_hieSwallowedException_wqExceededConstrainedThreadLimit_wqExceededTotalThreadLimit_threadsDeadlocked_threadsBlockedByADeadlock_ioSize_numIOs_isReportHeader___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 objectForKeyedSubscript:a3];
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (__CFString)timeIndexDescriptionForStartSampleIndex:(unint64_t)a3 endSampleIndex:(unsigned int)a4 formattedToLength:
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return &stru_189F64BD8;
  }
  if (a2 != 0x7FFFFFFFFFFFFFFFLL && a2 > a3)
  {
    int v40 = *__error();
    _sa_logt();
    double v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 134218240;
      unint64_t v53 = a2;
      __int16 v54 = 2048;
      unint64_t v55 = a3;
      _os_log_error_impl( &dword_186C92000,  v41,  OS_LOG_TYPE_ERROR,  "startSampleIndex %lu > endSampleIndex %lu",  buf,  0x16u);
    }

    *__error() = v40;
    _SASetCrashLogMessage(12602, "startSampleIndex %lu > endSampleIndex %lu", v42, v43, v44, v45, v46, v47, a2);
    _os_crash();
    __break(1u);
  }

  unint64_t v8 = *(void *)(a1 + 56);
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8 <= a3) {
      goto LABEL_7;
    }
LABEL_12:
    if (*(void *)(a1 + 48) <= a3)
    {
      if (a2 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a4)
        {
          if (a4 >> 1 <= 1) {
            uint64_t v16 = 1LL;
          }
          else {
            uint64_t v16 = a4 >> 1;
          }
          BOOL v18 = (a4 & 1) == 0 && v16 > 1;
          uint64_t v19 = (v16 - v18);
          id v20 = objc_alloc(NSString);
          BOOL v21 = -[SASamplePrinter hasTimeIndexes](a1);
          if (a2 == a3)
          {
            if (v21)
            {
              int v22 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
              uint64_t v23 = a3 + 1;
              if (v22) {
                v23 -= *(void *)(a1 + 48);
              }
            }

            else
            {
              uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
            }

            uint64_t v50 = v16;
            uint64_t v51 = v23;
            uint64_t v48 = v19;
            double v49 = "";
            id v24 = @"%*s %-*lu";
          }

          else
          {
            if (v21)
            {
              uint64_t v31 = a2 + 1;
            }

            else
            {
              uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
            }

            if (-[SASamplePrinter hasTimeIndexes](a1))
            {
              int v36 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
              uint64_t v37 = a3 + 1;
              if (v36) {
                v37 -= *(void *)(a1 + 48);
              }
            }

            else
            {
              uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
            }

            uint64_t v50 = v16;
            uint64_t v51 = v37;
            uint64_t v48 = v19;
            double v49 = (const char *)v31;
            id v24 = @"%*lu-%-*lu";
          }
        }

        else
        {
          id v20 = objc_alloc(NSString);
          BOOL v26 = -[SASamplePrinter hasTimeIndexes](a1);
          if (a2 == a3)
          {
            if (v26)
            {
              int v27 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
              uint64_t v28 = a3 + 1;
              if (v27) {
                v28 -= *(void *)(a1 + 48);
              }
            }

            else
            {
              uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
            }

            uint64_t v48 = v28;
            id v24 = @"at time index %lu";
          }

          else
          {
            if (v26)
            {
              uint64_t v32 = a2 + 1;
            }

            else
            {
              uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
            }

            if (-[SASamplePrinter hasTimeIndexes](a1))
            {
              int v38 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
              uint64_t v39 = a3 + 1;
              if (v38) {
                v39 -= *(void *)(a1 + 48);
              }
            }

            else
            {
              uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
            }

            uint64_t v48 = v32;
            double v49 = (const char *)v39;
            id v24 = @"at time indexes %lu-%lu";
          }
        }

        uint64_t v25 = v20;
        goto LABEL_75;
      }

      if (!a4)
      {
        id v29 = objc_alloc(NSString);
        if (-[SASamplePrinter hasTimeIndexes](a1))
        {
          uint64_t v30 = a3 + 1;
        }

        else
        {
          uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
        }

        if (-[SASamplePrinter hasTimeIndexes](a1))
        {
          int v33 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
          uint64_t v34 = a3 + 2;
          if (v33) {
            v34 -= *(void *)(a1 + 48);
          }
        }

        else
        {
          uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
        }

        double v35 = (void *)objc_msgSend( v29,  "initWithFormat:",  @"between time indexes %lu and %lu",  v30,  v34,  v50,  v51);
        return (__CFString *)v35;
      }
    }

    else if (!a4)
    {
      id v9 = objc_alloc(NSString);
      uint64_t v13 = *(void *)(a1 + 48);
      if (-[SASamplePrinter hasTimeIndexes](a1))
      {
        int v14 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
        uint64_t v15 = v13 + 1;
        if (v14) {
          v15 -= *(void *)(a1 + 48);
        }
      }

      else
      {
        uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      }

      uint64_t v48 = v15;
      id v24 = @"before time index %lu";
      goto LABEL_38;
    }

    return @"No samples";
  }

  if (v8 >= a2) {
    goto LABEL_12;
  }
LABEL_7:
  if (a4) {
    return @"No samples";
  }
  id v9 = objc_alloc(NSString);
  uint64_t v10 = *(void *)(a1 + 56);
  if (-[SASamplePrinter hasTimeIndexes](a1))
  {
    int v11 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
    uint64_t v12 = v10 + 1;
    if (v11) {
      v12 -= *(void *)(a1 + 48);
    }
  }

  else
  {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  uint64_t v48 = v12;
  id v24 = @"after time index %lu";
LABEL_38:
  uint64_t v25 = v9;
LABEL_75:
  double v35 = (void *)objc_msgSend(v25, "initWithFormat:", v24, v48, v49, v50, v51);
  return (__CFString *)v35;
}

- (__CFString)timeIndexDescriptionForTimestamp:(uint64_t)a1
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (-[SASamplePrinter hasTimeIndexes](a1))
  {
    if ([v3 lt:*(void *)(a1 + 32)])
    {
      [*(id *)(a1 + 32) machAbsTimeSeconds];
      double v5 = v4;
      [v3 machAbsTimeSeconds];
      double v7 = v5 - v6;
      id v8 = objc_alloc(NSString);
      uint64_t v9 = *(void *)(a1 + 48);
      BOOL v10 = -[SASamplePrinter hasTimeIndexes](a1);
      if (v7 >= 0.1)
      {
        if (v10)
        {
          int v22 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
          uint64_t v23 = v9 + 1;
          if (v22) {
            v23 -= *(void *)(a1 + 48);
          }
        }

        else
        {
          uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
        }

        uint64_t v49 = v23;
        double v48 = v7;
        uint64_t v30 = @"%.1fs before time index %lu";
      }

      else
      {
        if (v10)
        {
          int v11 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
          uint64_t v12 = v9 + 1;
          if (v11) {
            v12 -= *(void *)(a1 + 48);
          }
        }

        else
        {
          uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        }

        double v48 = *(double *)&v12;
        uint64_t v30 = @"<0.1s before time index %lu";
      }
    }

    else
    {
      if (![v3 gt:*(void *)(a1 + 40)])
      {
        unint64_t v24 = [*(id *)(a1 + 160) indexOfLastSampleOnOrBeforeTimestamp:v3];
        unint64_t v25 = [*(id *)(a1 + 160) indexOfFirstSampleOnOrAfterTimestamp:v3];
        if (v24 > v25)
        {
          int v38 = *__error();
          _sa_logt();
          uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            id v40 = [v3 debugDescription];
            *(_DWORD *)__int128 buf = 134218498;
            unint64_t v51 = v24;
            __int16 v52 = 2048;
            unint64_t v53 = v25;
            __int16 v54 = 2080;
            uint64_t v55 = [v40 UTF8String];
            _os_log_error_impl( &dword_186C92000,  v39,  OS_LOG_TYPE_ERROR,  "indexBefore %lu > indexAfter %lu for %s",  buf,  0x20u);
          }

          *__error() = v38;
          id v41 = [v3 debugDescription];
          [v41 UTF8String];
          _SASetCrashLogMessage(12741, "indexBefore %lu > indexAfter %lu for %s", v42, v43, v44, v45, v46, v47, v24);

          _os_crash();
          __break(1u);
        }

        id v26 = objc_alloc(NSString);
        BOOL v27 = -[SASamplePrinter hasTimeIndexes](a1);
        if (v25 == v24)
        {
          if (v27)
          {
            int v28 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
            uint64_t v29 = v24 + 1;
            if (v28) {
              v29 -= *(void *)(a1 + 48);
            }
          }

          else
          {
            uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
          }

          double v48 = *(double *)&v29;
          uint64_t v30 = @"at time index %lu";
        }

        else
        {
          if (v27)
          {
            uint64_t v33 = v24 + 1;
          }

          else
          {
            uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
          }

          if (-[SASamplePrinter hasTimeIndexes](a1))
          {
            int v35 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
            uint64_t v36 = v25 + 1;
            if (v35) {
              v36 -= *(void *)(a1 + 48);
            }
          }

          else
          {
            uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
          }

          double v48 = *(double *)&v33;
          uint64_t v49 = v36;
          uint64_t v30 = @"between time indexes %lu and %lu";
        }

        uint64_t v34 = v26;
        goto LABEL_45;
      }

      [v3 machAbsTimeSeconds];
      double v15 = v14;
      [*(id *)(a1 + 40) machAbsTimeSeconds];
      double v17 = v15 - v16;
      id v8 = objc_alloc(NSString);
      uint64_t v18 = *(void *)(a1 + 56);
      BOOL v19 = -[SASamplePrinter hasTimeIndexes](a1);
      if (v17 >= 0.1)
      {
        if (v19)
        {
          int v31 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
          uint64_t v32 = v18 + 1;
          if (v31) {
            v32 -= *(void *)(a1 + 48);
          }
        }

        else
        {
          uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
        }

        uint64_t v49 = v32;
        double v48 = v17;
        uint64_t v30 = @"%.1fs after time index %lu";
      }

      else
      {
        if (v19)
        {
          int v20 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
          uint64_t v21 = v18 + 1;
          if (v20) {
            v21 -= *(void *)(a1 + 48);
          }
        }

        else
        {
          uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        }

        double v48 = *(double *)&v21;
        uint64_t v30 = @"<0.1s after time index %lu";
      }
    }

    uint64_t v34 = v8;
LABEL_45:
    uint64_t v13 = (__CFString *)objc_msgSend(v34, "initWithFormat:", v30, *(void *)&v48, v49);
    goto LABEL_46;
  }

  uint64_t v13 = &stru_189F64BD8;
LABEL_46:

  return v13;
}

- (SABinaryLoadInfoToDisplay)displayedBinaryLoadInfoForBinary:(void *)a1 segment:(void *)a2 desiredLoadAddress:(uint64_t)a3 offsetIntoLoadInfo:(unint64_t)a4 isInKernelAddressSpace:(BOOL)a5 exclave:(void *)a6 binariesToDisplay:(void *)a7 extraBinariesToDisplay:(void *)a8
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  id v12 = a1;
  id v13 = a2;
  obuint64_t j = a6;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = v15;
  id v18 = v16;
  if (v17 == v16)
  {

    id v18 = 0LL;
  }

  [v17 objectForKeyedSubscript:v12];
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
  id v68 = v18;
  id v69 = v12;
  [v18 objectForKeyedSubscript:v12];
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v74 objects:v80 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v75;
    while (2)
    {
      for (uint64_t i = 0LL; i != v23; ++i)
      {
        if (*(void *)v75 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        [v26 segment];
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        if (v27 == v13)
        {
          [v26 exclave];
          id v28 = (id)objc_claimAutoreleasedReturnValue();

          if (v28 == v14)
          {
            uint64_t v29 = v26;
            char v66 = 1;
            goto LABEL_15;
          }
        }

        else
        {
        }
      }

      uint64_t v23 = [v21 countByEnumeratingWithState:&v74 objects:v80 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }

  char v66 = 0;
  uint64_t v29 = 0LL;
LABEL_15:

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  id v30 = v20;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v70 objects:v79 count:16];
  if (!v31)
  {
    char v38 = 0;
    uint64_t v39 = v69;
LABEL_32:
    id v40 = v68;

    if (!v29)
    {
      uint64_t v29 = objc_alloc(&OBJC_CLASS___SABinaryLoadInfoToDisplay);
      id v41 = v14;
      if (v29)
      {
        *(void *)unint64_t v78 = v29;
        *(void *)&v78[8] = &OBJC_CLASS___SABinaryLoadInfoToDisplay;
        uint64_t v42 = (SABinaryLoadInfoToDisplay *)objc_msgSendSuper2( (objc_super *)v78,  sel_initWithBinary_segment_loadAddress_,  v69,  v13,  a3);
        uint64_t v29 = v42;
        if (v42)
        {
          v42->_isInKernelAddressSpace = a5;
          objc_storeStrong((id *)&v42->_exclave, obj);
        }
      }

      id v40 = v68;
      uint64_t v39 = v69;
    }

    goto LABEL_37;
  }

  uint64_t v32 = v31;
  char v65 = v17;
  uint64_t v33 = *(void *)v71;
LABEL_17:
  uint64_t v34 = 0LL;
  while (1)
  {
    if (*(void *)v71 != v33) {
      objc_enumerationMutation(v30);
    }
    int v35 = *(SABinaryLoadInfoToDisplay **)(*((void *)&v70 + 1) + 8 * v34);
    -[SABinaryLoadInfo segment](v35, "segment");
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    if (v36 == v13) {
      break;
    }

LABEL_23:
    if (v32 == ++v34)
    {
      uint64_t v32 = [v30 countByEnumeratingWithState:&v70 objects:v79 count:16];
      if (v32) {
        goto LABEL_17;
      }
      char v38 = 0;
      goto LABEL_31;
    }
  }

  -[SABinaryLoadInfoToDisplay exclave](v35, "exclave");
  id v37 = (id)objc_claimAutoreleasedReturnValue();

  if (v37 != v14) {
    goto LABEL_23;
  }
  if (!v29)
  {
    uint64_t v29 = v35;
    char v38 = 1;
LABEL_31:
    uint64_t v39 = v69;
    id v17 = v65;
    goto LABEL_32;
  }

  id v40 = v68;
  uint64_t v39 = v69;
  id v17 = v65;
  if (v29 != v35)
  {
    int v47 = *__error();
    _sa_logt();
    double v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      id v49 = -[SABinaryLoadInfoToDisplay debugDescription](v29, "debugDescription");
      uint64_t v50 = [v49 UTF8String];
      id v51 = -[SABinaryLoadInfoToDisplay debugDescription](v35, "debugDescription");
      uint64_t v52 = [v51 UTF8String];
      *(_DWORD *)unint64_t v78 = 136315394;
      *(void *)&v78[4] = v50;
      *(_WORD *)&v78[12] = 2080;
      *(void *)&v78[14] = v52;
      _os_log_error_impl( &dword_186C92000,  v48,  OS_LOG_TYPE_ERROR,  "mismatch between binaries and extra binaries: %s vs %s",  v78,  0x16u);
    }

    *__error() = v47;
    id v53 = -[SABinaryLoadInfoToDisplay debugDescription](v29, "debugDescription");
    char v54 = [v53 UTF8String];
    id v55 = -[SABinaryLoadInfoToDisplay debugDescription](v35, "debugDescription");
    [v55 UTF8String];
    _SASetCrashLogMessage( 7399,  "mismatch between binaries and extra binaries: %s vs %s",  v56,  v57,  v58,  v59,  v60,  v61,  v54);

    _os_crash();
    __break(1u);
  }

  char v38 = 1;
LABEL_37:
  if (-[SABinaryLoadInfoToDisplay highestOffset](v29, "highestOffset") < a4) {
    -[SABinaryLoadInfoToDisplay setHighestOffset:](v29, "setHighestOffset:");
  }
  if ((v66 & 1) == 0)
  {
    if (v21)
    {
      [v21 addObject:v29];
    }

    else
    {
      uint64_t v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v29, 0);
      [v17 setObject:v43 forKeyedSubscript:v39];
    }
  }

  if (v40) {
    char v44 = v38;
  }
  else {
    char v44 = 1;
  }
  if ((v44 & 1) == 0)
  {
    if (v30)
    {
      [v30 addObject:v29];
    }

    else
    {
      uint64_t v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v29, 0);
      [v40 setObject:v45 forKeyedSubscript:v39];
    }
  }

  return v29;
}

void __50__SASamplePrinter_sortedLoadInfosForBinaryImages___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ([v4 count] == 1)
  {
    [v4 firstObject];
    double v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (([*(id *)(*(void *)(a1 + 32) + 16) displayAllBinaries] & 1) == 0)
    {
      uint64_t v6 = [v5 segment];
      if (v6)
      {
        double v7 = (void *)v6;
        [v5 segment];
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v8 hasOffsetIntoBinary])
        {
          [v5 segment];
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v10 = [v9 offsetIntoBinary];

          if (!v10)
          {
            uint64_t v11 = 1LL;
LABEL_17:
            [v5 setIsZerothAndOnlySegment:v11];
            [*(id *)(a1 + 40) addObject:v5];

            goto LABEL_18;
          }
        }

        else
        {
        }
      }
    }

    uint64_t v11 = 0LL;
    goto LABEL_17;
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "setIsZerothAndOnlySegment:", 0, (void)v17);
      }

      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v14);
  }

  [*(id *)(a1 + 40) addObjectsFromArray:v12];
LABEL_18:
}

uint64_t __50__SASamplePrinter_sortedLoadInfosForBinaryImages___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = a3;
  if ([v4 isInKernelAddressSpace]
    && ![v5 isInKernelAddressSpace])
  {
    goto LABEL_10;
  }

  if ([v4 isInKernelAddressSpace] & 1) == 0 && (objc_msgSend(v5, "isInKernelAddressSpace")) {
    goto LABEL_12;
  }
  unint64_t v6 = [v4 loadAddress];
  unint64_t v7 = [v5 loadAddress];
  if (v6)
  {
    if (v7 - 1 >= v6)
    {
LABEL_12:
      uint64_t v8 = -1LL;
      goto LABEL_13;
    }

    if (v6 > v7) {
      goto LABEL_10;
    }
  }

  else if (v7)
  {
    goto LABEL_10;
  }

  *(void *)uu1 = 0LL;
  uint64_t v23 = 0LL;
  *(void *)uu2 = 0LL;
  uint64_t v21 = 0LL;
  [v4 binary];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 uuid];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 getUUIDBytes:uu1];

  [v5 binary];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 uuid];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 getUUIDBytes:uu2];

  int v13 = uuid_compare(uu1, uu2);
  if (v13 > 0) {
    goto LABEL_12;
  }
  if ((v13 & 0x80000000) == 0)
  {
    [v4 segment];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 name];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    [v5 segment];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 name];
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (![v16 length])
    {

      uint64_t v16 = 0LL;
    }

    if ([v18 length])
    {
      BOOL v19 = v16 != 0LL;
      if (v16 && v18)
      {
        uint64_t v8 = [v16 compare:v18 options:577];
LABEL_25:

        goto LABEL_13;
      }
    }

    else
    {

      __int128 v18 = 0LL;
      BOOL v19 = v16 != 0LL;
    }

    if (v19) {
      uint64_t v8 = -1LL;
    }
    else {
      uint64_t v8 = 1LL;
    }
    goto LABEL_25;
  }

void __52__SASamplePrinter_printSystemStatsStyleBinaryImages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 binary];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
  }

  [v3 segment];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "segment", (void)v13);
        id v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v6)
        {

          goto LABEL_13;
        }

        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  [v7 addObject:v3];
LABEL_13:
}

void __52__SASamplePrinter_printSystemStatsStyleBinaryImages__block_invoke_2(uint64_t a1, void *a2)
{
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __52__SASamplePrinter_printSystemStatsStyleBinaryImages__block_invoke_3;
  v9[3] = &unk_189F63E10;
  id v10 = *(id *)(a1 + 40);
  id v4 = a2;
  -[SATask enumerateFrames:]((uint64_t)v4, v9);
  [v4 mainBinaryLoadInfo];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    [v5 binary];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASamplePrinter indexForBinary:](v6, (uint64_t)v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }
}

void __52__SASamplePrinter_printSystemStatsStyleBinaryImages__block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a2 + 24));
    if (WeakRetained)
    {
      id v4 = WeakRetained;
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
      id WeakRetained = v4;
    }
  }

  else
  {
  }

uint64_t __52__SASamplePrinter_printSystemStatsStyleBinaryImages__block_invoke_4( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)uu1 = 0LL;
  uint64_t v13 = 0LL;
  *(void *)uu2 = 0LL;
  uint64_t v11 = 0LL;
  id v4 = a3;
  [a2 uuid];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 getUUIDBytes:uu1];

  [v4 uuid];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 getUUIDBytes:uu2];
  int v7 = uuid_compare(uu1, uu2);
  int v8 = v7 >> 31;
  if (v7 >= 1) {
    return 1;
  }
  return v8;
}

uint64_t __52__SASamplePrinter_printSystemStatsStyleBinaryImages__block_invoke_5( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 segment];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 segment];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    uint64_t v9 = 0LL;
  }

  else if (v5)
  {
    if (v6)
    {
      [v5 name];
      int v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 name];
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v7 compare:v8];
    }

    else
    {
      uint64_t v9 = 1LL;
    }
  }

  else
  {
    uint64_t v9 = -1LL;
  }

  return v9;
}

void __110__SASamplePrinter_printSingleStackForTasks_limitToDispatchQueueIds_limitToThreadIds_intersection_sampleCount___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    if (!v7) {
      goto LABEL_14;
    }
    int v8 = *(unsigned __int8 *)(a1 + 80);
    int v9 = [v7 containsObject:v5];
    if (v8)
    {
      if ((v9 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }

    if (!v9
      || !-[SASamplePrinter shouldPrintTask:thread:dispatchQueue:]( *(void *)(a1 + 48),  *(void **)(a1 + 56),  v6,  0LL))
    {
LABEL_14:
      uint64_t v11 = *(void **)(a1 + 48);
      uint64_t v12 = v11[4];
      uint64_t v13 = v11[5];
      uint64_t v14 = v11[6];
      uint64_t v15 = v11[7];
      v21[0] = MEMORY[0x1895F87A8];
      v21[1] = 3221225472LL;
      v21[2] = __110__SASamplePrinter_printSingleStackForTasks_limitToDispatchQueueIds_limitToThreadIds_intersection_sampleCount___block_invoke_2;
      v21[3] = &unk_189F63EC0;
      id v16 = *(id *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 48);
      id v22 = v16;
      uint64_t v23 = v17;
      id v18 = v6;
      uint64_t v19 = *(void *)(a1 + 56);
      __int128 v20 = *(void **)(a1 + 64);
      id v24 = v18;
      uint64_t v25 = v19;
      id v26 = v20;
      id v27 = *(id *)(a1 + 72);
      [v18 enumerateThreadStatesBetweenStartTime:v12 startSampleIndex:v14 endTime:v13 endSampleIndex:v15 reverseOrder:0 block:v21];

      goto LABEL_15;
    }

    goto LABEL_12;
  }

  if ((!v7 || [v7 containsObject:v5])
    && -[SASamplePrinter shouldPrintTask:thread:dispatchQueue:]( *(void *)(a1 + 48),  *(void **)(a1 + 56),  v6,  0LL))
  {
LABEL_12:
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]( v10,  0LL,  0LL,  v6,  0LL,  *(void **)(a1 + 56),  *(void **)(a1 + 64),  1,  1,  1,  1,  1,  *(void **)(a1 + 72),  0,  1u);
    }
  }

void __110__SASamplePrinter_printSingleStackForTasks_limitToDispatchQueueIds_limitToThreadIds_intersection_sampleCount___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v5 = *(void **)(a1 + 32);
  id v6 = (void *)MEMORY[0x189607968];
  [a2 dispatchQueue];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v7, "identifier"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = [v5 containsObject:v8];

  if ((_DWORD)v5)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    int v9 = *(void **)(a1 + 48);
    [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v11;
    [MEMORY[0x189603F18] arrayWithObjects:v13 count:1];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10) {
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]( v10,  0LL,  0LL,  v9,  v12,  *(void **)(a1 + 56),  *(void **)(a1 + 64),  1,  1,  1,  1,  1,  *(void **)(a1 + 72),  0,  1u);
    }
  }

void __110__SASamplePrinter_printSingleStackForTasks_limitToDispatchQueueIds_limitToThreadIds_intersection_sampleCount___block_invoke_1281( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a3;
  int v6 = [a2 unsignedIntValue];
  unint64_t v7 = [v5 unsignedLongValue];

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(void *)(v8 + 24) < v7)
  {
    *(void *)(v8 + 24) = v7;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v6;
  }

void __110__SASamplePrinter_printSingleStackForTasks_limitToDispatchQueueIds_limitToThreadIds_intersection_sampleCount___block_invoke_2_1283( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 unsignedLongLongValue];
  unint64_t v7 = [v5 unsignedLongValue];

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(void *)(v8 + 24) < v7)
  {
    *(void *)(v8 + 24) = v7;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v6;
  }

- (id)stacksForTask:(uint64_t)a3 taskSampleCount:
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  uint64_t v61 = v4;
  if (a1)
  {
    id v5 = (os_log_s *)v4;
    uint64_t v6 = (void *)MEMORY[0x186E47ACC]();
    unint64_t v7 = a1[2];
    if (v7)
    {
      uint64_t v8 = v7[19];
      if (v8) {
        goto LABEL_8;
      }
      if (*((_BYTE *)v7 + 11))
      {
        do
        {
          int v9 = *__error();
          _sa_logt();
          id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            id v10 = [a1[2] debugDescription];
            uint64_t v11 = [v10 UTF8String];
            *(_DWORD *)__int128 buf = 136315138;
            *(void *)&uint8_t buf[4] = v11;
            _os_log_error_impl( &dword_186C92000,  v5,  OS_LOG_TYPE_ERROR,  "stacksForTask without kSAAggregateCallTreesByProcess: %s",  buf,  0xCu);
          }

          *__error() = v9;
          [a1[2] debugDescription];
          a1 = (id *) objc_claimAutoreleasedReturnValue();
          char v12 = [a1 UTF8String];
          _SASetCrashLogMessage( 0x2000,  "stacksForTask without kSAAggregateCallTreesByProcess: %s",  v13,  v14,  v15,  v16,  v17,  v18,  v12);

          _os_crash();
          __break(1u);
LABEL_8:
          ;
        }

        while (v8 == 3);
      }
    }

    id v19 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v20 = a1[2];
    uint64_t v21 = MEMORY[0x1895F87A8];
    if (!v20 || v20[20] != 1LL && (uint64_t v22 = v20[19], v22 != 3) && (v22 || !*((_BYTE *)v20 + 11)))
    {
      uint64_t v23 = v6;
      id v24 = v5;
      id v25 = objc_alloc_init(MEMORY[0x189603FC8]);
      -[os_log_s swiftTasks](v24, "swiftTasks");
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = v21;
      v75[1] = 3221225472LL;
      v75[2] = __61__SASamplePrinter_stacksForSwiftAsyncInTask_taskSampleCount___block_invoke;
      v75[3] = &unk_189F642C0;
      v75[4] = a1;
      id v76 = v25;
      id v27 = v25;
      [v26 enumerateKeysAndObjectsUsingBlock:v75];

      id v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v27, "count"));
      *(void *)__int128 buf = v21;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&uint8_t buf[16] = __61__SASamplePrinter_stacksForSwiftAsyncInTask_taskSampleCount___block_invoke_3;
      unint64_t v78 = &unk_189F64328;
      uint64_t v79 = a1;
      id v29 = v28;
      id v80 = v29;
      id v30 = v24;
      uint64_t v81 = v30;
      uint64_t v82 = a3;
      [v27 enumerateKeysAndObjectsUsingBlock:buf];
      uint64_t v31 = v81;
      id v32 = v29;

      uint64_t v6 = v23;
      [v19 addObjectsFromArray:v32];

      __int128 v20 = a1[2];
      if (!v20) {
        goto LABEL_23;
      }
    }

    uint64_t v33 = v20[19];
    if (v33)
    {
      if (v33 != 1)
      {
        if (v33 == 2)
        {
          -[os_log_s threads](v5, "threads");
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
          v72[0] = v21;
          v72[1] = 3221225472LL;
          v72[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke;
          v72[3] = &unk_189F63F38;
          v72[4] = a1;
          int v35 = (id *)&v73;
          __int128 v73 = v5;
          id v36 = (id *)v74;
          v74[0] = v19;
          v74[1] = a3;
          [v34 enumerateKeysAndObjectsUsingBlock:v72];

LABEL_21:
          [a1[2] callTreeSortAttributes];
          v63[0] = v21;
          v63[1] = 3221225472LL;
          v63[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_1318;
          v63[3] = &unk_189F63FD8;
          id v64 = (id)objc_claimAutoreleasedReturnValue();
          id v44 = v64;
          [v19 sortUsingComparator:v63];
          a1 = (id *)[v19 copy];

          objc_autoreleasePoolPop(v6);
          goto LABEL_22;
        }

- (void)printStack:(void *)a3 stream:
{
  uint64_t v251 = *MEMORY[0x1895F89C0];
  self = a2;
  unint64_t v5 = a3;
  if (!self) {
    goto LABEL_288;
  }
  id v6 = objc_getProperty(self, (SEL)self, 56LL, 1);
  id v8 = objc_getProperty(self, v7, 40LL, 1);
  id v10 = objc_getProperty(self, v9, 48LL, 1);
  int v11 = *((_BYTE *)self + 11) & 1;
  id v13 = objc_getProperty(self, v12, 64LL, 1);
  int v209 = self[3] & 1;
  unint64_t v203 = *((void *)self + 4);
  unint64_t v204 = *((void *)self + 9);
  uint64_t v200 = *((void *)self + 10);
  id v15 = objc_getProperty(self, v14, 88LL, 1);
  uint64_t v214 = self[4];
  uint64_t v205 = self[5];
  uint64_t v212 = self[6];
  uint64_t v201 = self[7];
  unint64_t v215 = *((void *)self + 12);
  unint64_t v202 = *((void *)self + 13);
  LODWORD(v206) = *((_BYTE *)self + 14) & 1;
  HIDWORD(v206) = *((_BYTE *)self + 13) & 1;
  unint64_t v207 = *((void *)self + 14);
  unint64_t v208 = *((void *)self + 17);
  uint64_t v217 = *((void *)self + 18);
  for (double i = *((double *)self + 19); ; double i = 0.0)
  {
    id v17 = (id)v5;
    id v18 = v6;
    id v19 = v8;
    id v20 = v10;
    id v221 = v13;
    id v216 = v15;
    context = (void *)MEMORY[0x186E47ACC]();
    uint64_t v225 = v17;
    id v218 = v18;
    id v219 = v19;
    id v220 = v20;
    if ([*(id *)(a1 + 16) printJson])
    {
      [v17 appendString:@"\n\n"];
      if (![v18 count] && (objc_msgSend(v19, "count") || objc_msgSend(v20, "count")))
      {
        if (![v19 count])
        {
          if (![v20 count])
          {
LABEL_170:
            if (v215)
            {
              objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
              BOOL v121 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v122 = @"cpuTimeNs";
              if ((_DWORD)v206) {
                uint64_t v122 = @"cpuForcedIdleTimeNs";
              }
              if (HIDWORD(v206)) {
                uint64_t v123 = @"cpuIdleTimeNs";
              }
              else {
                uint64_t v123 = (__CFString *)v122;
              }
              SAJSONWriteDictionaryEntry(v17, v123, v121);

              [MEMORY[0x189607968] numberWithUnsignedLongLong:v207];
              __int128 v124 = (void *)objc_claimAutoreleasedReturnValue();
              SAJSONWriteDictionaryEntry(v17, @"cycles", v124);

              [MEMORY[0x189607968] numberWithUnsignedLongLong:v202];
              uint64_t v125 = (void *)objc_claimAutoreleasedReturnValue();
              SAJSONWriteDictionaryEntry(v17, @"intructions", v125);
            }

            if ((v214 & 0x80000000) == 0)
            {
              objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
              id v126 = (void *)objc_claimAutoreleasedReturnValue();
              SAJSONWriteDictionaryEntry(v17, @"minPriority", v126);

              [MEMORY[0x189607968] numberWithInt:v205];
              uint64_t v127 = (void *)objc_claimAutoreleasedReturnValue();
              SAJSONWriteDictionaryEntry(v17, @"maxPriority", v127);

              if ((v212 & 0x80000000) == 0)
              {
                [MEMORY[0x189607968] numberWithInt:v212];
                id v128 = (void *)objc_claimAutoreleasedReturnValue();
                SAJSONWriteDictionaryEntry(v17, @"minBasePriority", v128);

                [MEMORY[0x189607968] numberWithInt:v201];
                unint64_t v129 = (void *)objc_claimAutoreleasedReturnValue();
                SAJSONWriteDictionaryEntry(v17, @"maxBasePriority", v129);
              }
            }

            if (v221)
            {
              SAJSONWriteDictionaryEntry(v17, @"threadName", v221);
              if (v209) {
                SAJSONWriteDictionaryEntry(v17, @"threadNameChanges", MEMORY[0x189604A88]);
              }
            }

            if ([v19 count])
            {
              unint64_t v130 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend(v19, "count"));
              __int128 v226 = 0u;
              __int128 v227 = 0u;
              __int128 v228 = 0u;
              __int128 v229 = 0u;
              id v131 = v19;
              uint64_t v132 = [v131 countByEnumeratingWithState:&v226 objects:v244 count:16];
              if (v132)
              {
                uint64_t v133 = v132;
                uint64_t v134 = *(void *)v227;
                do
                {
                  for (uint64_t j = 0LL; j != v133; ++j)
                  {
                    if (*(void *)v227 != v134) {
                      objc_enumerationMutation(v131);
                    }
                    uint64_t v136 = *(void **)(*((void *)&v226 + 1) + 8 * j);
                    [MEMORY[0x189603FE8] null];
                    char v137 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v136 != v137)
                    {
                      [v136 dispatchQueueLabel];
                      uint64_t v138 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v138) {
                        [v130 addObject:v138];
                      }
                    }
                  }

                  uint64_t v133 = [v131 countByEnumeratingWithState:&v226 objects:v244 count:16];
                }

                while (v133);
              }

              id v17 = v225;
              id v18 = v218;
              id v20 = v220;
              if ([v130 count])
              {
                if ([v130 count] == 1)
                {
                  [v130 firstObject];
                  char v139 = (void *)objc_claimAutoreleasedReturnValue();
                  SAJSONWriteDictionaryEntry(v225, @"dispatchQueueLabel", v139);
                }

                else
                {
                  SAJSONWriteDictionaryEntry(v225, @"dispatchQueueLabel", v130);
                }
              }

              id v19 = v219;
            }

            if (-[SASamplePrinter hasTimeIndexes](a1))
            {
              [MEMORY[0x189607968] numberWithUnsignedInteger:v203];
              uint64_t v140 = (void *)objc_claimAutoreleasedReturnValue();
              SAJSONWriteDictionaryEntry(v17, @"numSamples", v140);

              uint64_t v141 = (void *)MEMORY[0x189607968];
              if (-[SASamplePrinter hasTimeIndexes](a1))
              {
                int v142 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
                uint64_t v143 = v204 + 1;
                if (v142) {
                  v143 -= *(void *)(a1 + 48);
                }
              }

              else
              {
                uint64_t v143 = 0x7FFFFFFFFFFFFFFFLL;
              }

              [v141 numberWithUnsignedInteger:v143];
              BOOL v144 = (void *)objc_claimAutoreleasedReturnValue();
              SAJSONWriteDictionaryEntry(v17, @"firstSampleIndex", v144);

              id v145 = (void *)MEMORY[0x189607968];
              if (-[SASamplePrinter hasTimeIndexes](a1))
              {
                int v146 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
                uint64_t v147 = v200 + 1;
                if (v146) {
                  v147 -= *(void *)(a1 + 48);
                }
              }

              else
              {
                uint64_t v147 = 0x7FFFFFFFFFFFFFFFLL;
              }

              [v145 numberWithUnsignedInteger:v147];
              char v148 = (void *)objc_claimAutoreleasedReturnValue();
              SAJSONWriteDictionaryEntry(v17, @"lastSampleIndex", v148);
            }

            if (v217)
            {
              objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:");
              id v149 = (void *)objc_claimAutoreleasedReturnValue();
              SAJSONWriteDictionaryEntry(v17, @"numIOs", v149);

              [MEMORY[0x189607968] numberWithUnsignedLongLong:v208];
              uint64_t v150 = (void *)objc_claimAutoreleasedReturnValue();
              SAJSONWriteDictionaryEntry(v17, @"ioSize", v150);
            }

            goto LABEL_279;
          }

          if ([v20 count] == 1)
          {
            [v20 firstObject];
            id v99 = (void *)objc_claimAutoreleasedReturnValue();
            [MEMORY[0x189603FE8] null];
            uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue();

            if (v99 == v100) {
              goto LABEL_155;
            }
            uint64_t v101 = [v99 identifier];
            if (!v101) {
              goto LABEL_155;
            }
            [MEMORY[0x189607968] numberWithUnsignedLongLong:v101];
            uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue();
            SAJSONWriteDictionaryFirstEntry(v17, (uint64_t)@"swiftTaskID", v102);
            goto LABEL_154;
          }

          uint64_t v211 = a1;
          uint64_t v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v20, "count"));
          __int128 v245 = 0u;
          __int128 v246 = 0u;
          __int128 v247 = 0u;
          __int128 v248 = 0u;
          id v155 = v20;
          uint64_t v156 = [v155 countByEnumeratingWithState:&v245 objects:v249 count:16];
          if (v156)
          {
            uint64_t v157 = v156;
            uint64_t v158 = *(void *)v246;
            do
            {
              for (uint64_t k = 0LL; k != v157; ++k)
              {
                if (*(void *)v246 != v158) {
                  objc_enumerationMutation(v155);
                }
                __int128 v160 = *(void **)(*((void *)&v245 + 1) + 8 * k);
                [MEMORY[0x189603FE8] null];
                __int128 v161 = (void *)objc_claimAutoreleasedReturnValue();

                if (v160 == v161)
                {
                  [v86 addObject:&unk_189F823D0];
                }

                else
                {
                  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v160, "identifier"));
                  uint64_t v162 = (void *)objc_claimAutoreleasedReturnValue();
                  [v86 addObject:v162];
                }
              }

              uint64_t v157 = [v155 countByEnumeratingWithState:&v245 objects:v249 count:16];
            }

            while (v157);
          }

          id v17 = v225;
          SAJSONWriteDictionaryFirstEntry(v225, (uint64_t)@"swiftTaskID", v86);
LABEL_169:

          a1 = v211;
          id v18 = v218;
          id v19 = v219;
          goto LABEL_170;
        }

        if ([v19 count] == 1)
        {
          [v19 firstObject];
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189603FE8] null];
          id v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31 != v32)
          {
            uint64_t v33 = [v31 identifier];
            if (v33)
            {
              [MEMORY[0x189607968] numberWithUnsignedLongLong:v33];
              uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
              SAJSONWriteDictionaryFirstEntry(v17, (uint64_t)@"dispatchQueueID", v34);
            }
          }
        }

        else
        {
          uint64_t v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v19, "count"));
          __int128 v234 = 0u;
          __int128 v235 = 0u;
          __int128 v236 = 0u;
          __int128 v237 = 0u;
          id v104 = v19;
          uint64_t v105 = [v104 countByEnumeratingWithState:&v234 objects:v249 count:16];
          if (v105)
          {
            uint64_t v106 = v105;
            uint64_t v107 = *(void *)v235;
            do
            {
              for (uint64_t m = 0LL; m != v106; ++m)
              {
                if (*(void *)v235 != v107) {
                  objc_enumerationMutation(v104);
                }
                uint64_t v109 = *(void **)(*((void *)&v234 + 1) + 8 * m);
                [MEMORY[0x189603FE8] null];
                uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue();

                if (v109 == v110)
                {
                  [v103 addObject:&unk_189F823D0];
                }

                else
                {
                  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v109, "identifier"));
                  int v111 = (void *)objc_claimAutoreleasedReturnValue();
                  [v103 addObject:v111];
                }
              }

              uint64_t v106 = [v104 countByEnumeratingWithState:&v234 objects:v249 count:16];
            }

            while (v106);
          }

          id v17 = v225;
          SAJSONWriteDictionaryFirstEntry(v225, (uint64_t)@"dispatchQueueID", v103);

          id v18 = v218;
          id v19 = v219;
        }

        if (![v20 count]) {
          goto LABEL_170;
        }
        if ([v20 count] == 1) {
          goto LABEL_151;
        }
        uint64_t v211 = a1;
        uint64_t v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v20, "count"));
        __int128 v230 = 0u;
        __int128 v231 = 0u;
        __int128 v232 = 0u;
        __int128 v233 = 0u;
        id v87 = v20;
        uint64_t v114 = [v87 countByEnumeratingWithState:&v230 objects:&v245 count:16];
        if (v114)
        {
          uint64_t v115 = v114;
          uint64_t v116 = *(void *)v231;
          do
          {
            for (uint64_t n = 0LL; n != v115; ++n)
            {
              if (*(void *)v231 != v116) {
                objc_enumerationMutation(v87);
              }
              uint64_t v118 = *(void **)(*((void *)&v230 + 1) + 8 * n);
              [MEMORY[0x189603FE8] null];
              uint64_t v119 = (void *)objc_claimAutoreleasedReturnValue();

              if (v118 == v119)
              {
                [v86 addObject:&unk_189F823D0];
              }

              else
              {
                objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v118, "identifier"));
                uint64_t v120 = (void *)objc_claimAutoreleasedReturnValue();
                [v86 addObject:v120];
              }
            }

            uint64_t v115 = [v87 countByEnumeratingWithState:&v230 objects:&v245 count:16];
          }

          while (v115);
        }
      }

      else
      {
        if ([v18 count] == 1)
        {
          [v18 firstObject];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          SAJSONWriteDictionaryFirstEntry(v17, (uint64_t)@"threadID", v21);
        }

        else
        {
          SAJSONWriteDictionaryFirstEntry(v17, (uint64_t)@"threadID", v18);
        }

        if ([v19 count])
        {
          if ([v19 count] == 1)
          {
            [v19 firstObject];
            int v35 = (void *)objc_claimAutoreleasedReturnValue();
            [MEMORY[0x189603FE8] null];
            id v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35 != v36)
            {
              uint64_t v37 = [v35 identifier];
              if (v37)
              {
                [MEMORY[0x189607968] numberWithUnsignedLongLong:v37];
                uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
                SAJSONWriteDictionaryEntry(v17, @"dispatchQueueID", v38);
              }
            }
          }

          else
          {
            __int128 v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v19, "count"));
            __int128 v234 = 0u;
            __int128 v235 = 0u;
            __int128 v236 = 0u;
            __int128 v237 = 0u;
            id v78 = v19;
            uint64_t v79 = [v78 countByEnumeratingWithState:&v234 objects:v249 count:16];
            if (v79)
            {
              uint64_t v80 = v79;
              uint64_t v81 = *(void *)v235;
              do
              {
                for (idouble i = 0LL; ii != v80; ++ii)
                {
                  if (*(void *)v235 != v81) {
                    objc_enumerationMutation(v78);
                  }
                  uint64_t v83 = *(void **)(*((void *)&v234 + 1) + 8 * ii);
                  [MEMORY[0x189603FE8] null];
                  uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v83 == v84)
                  {
                    [v77 addObject:&unk_189F823D0];
                  }

                  else
                  {
                    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v83, "identifier"));
                    uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
                    [v77 addObject:v85];
                  }
                }

                uint64_t v80 = [v78 countByEnumeratingWithState:&v234 objects:v249 count:16];
              }

              while (v80);
            }

            id v17 = v225;
            SAJSONWriteDictionaryEntry(v225, @"dispatchQueueID", v77);

            id v18 = v218;
            id v19 = v219;
          }
        }

        if (![v20 count]) {
          goto LABEL_170;
        }
        if ([v20 count] == 1)
        {
LABEL_151:
          [v20 firstObject];
          id v99 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189603FE8] null];
          uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue();

          if (v99 == v112) {
            goto LABEL_155;
          }
          uint64_t v113 = [v99 identifier];
          if (!v113) {
            goto LABEL_155;
          }
          [MEMORY[0x189607968] numberWithUnsignedLongLong:v113];
          uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue();
          SAJSONWriteDictionaryEntry(v17, @"swiftTaskID", v102);
LABEL_154:

LABEL_155:
          goto LABEL_170;
        }

        uint64_t v211 = a1;
        uint64_t v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v20, "count"));
        __int128 v230 = 0u;
        __int128 v231 = 0u;
        __int128 v232 = 0u;
        __int128 v233 = 0u;
        id v87 = v20;
        uint64_t v88 = [v87 countByEnumeratingWithState:&v230 objects:&v245 count:16];
        if (v88)
        {
          uint64_t v89 = v88;
          uint64_t v90 = *(void *)v231;
          do
          {
            for (juint64_t j = 0LL; jj != v89; ++jj)
            {
              if (*(void *)v231 != v90) {
                objc_enumerationMutation(v87);
              }
              int v92 = *(void **)(*((void *)&v230 + 1) + 8 * jj);
              [MEMORY[0x189603FE8] null];
              uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue();

              if (v92 == v93)
              {
                [v86 addObject:&unk_189F823D0];
              }

              else
              {
                objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v92, "identifier"));
                uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
                [v86 addObject:v94];
              }
            }

            uint64_t v89 = [v87 countByEnumeratingWithState:&v230 objects:&v245 count:16];
          }

          while (v89);
        }
      }

      id v17 = v225;
      SAJSONWriteDictionaryEntry(v225, @"swiftTaskID", v86);
      goto LABEL_169;
    }

    objc_msgSend(v17, "printWithFormat:", @"%*s", 2, "");
    uint64_t v210 = a1;
    if ([v18 count])
    {
      __int128 v236 = 0u;
      __int128 v237 = 0u;
      __int128 v234 = 0u;
      __int128 v235 = 0u;
      obuint64_t j = v18;
      uint64_t v22 = [obj countByEnumeratingWithState:&v234 objects:v249 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        int v24 = 0;
        uint64_t v25 = *(void *)v235;
        char v26 = 1;
        do
        {
          for (kuint64_t k = 0LL; kk != v23; ++kk)
          {
            if (*(void *)v235 != v25) {
              objc_enumerationMutation(obj);
            }
            id v28 = *(void **)(*((void *)&v234 + 1) + 8 * kk);
            if ((v26 & 1) != 0) {
              id v29 = @"Thread ";
            }
            else {
              id v29 = @",";
            }
            int v30 = [v225 appendString:v29];
            char v26 = 0;
            v24 += v30
                 + objc_msgSend(v225, "printWithFormat:", @"0x%llx", objc_msgSend(v28, "unsignedLongLongValue"));
          }

          uint64_t v23 = [obj countByEnumeratingWithState:&v234 objects:v249 count:16];
          char v26 = 0;
        }

        while (v23);
      }

      else
      {
        int v24 = 0;
      }

      id v17 = v225;
      if (v11) {
        v24 += [v225 appendString:@" (idle work queue)"];
      }
      id v18 = v218;
      id v19 = v219;
    }

    else
    {
      int v24 = 0;
    }

    if ((unint64_t)[v20 count] > 1
      || [v20 count] == 1
      && ([v20 firstObject],
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(),
          [MEMORY[0x189603FE8] null],
          id v40 = (void *)objc_claimAutoreleasedReturnValue(),
          v40,
          v39,
          v39 != v40))
    {
      if (v24) {
        objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
      }
      uint64_t v41 = a1;
      __int128 v232 = 0u;
      __int128 v233 = 0u;
      __int128 v230 = 0u;
      __int128 v231 = 0u;
      id v42 = v20;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v230 objects:&v245 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        int v24 = 0;
        uint64_t v45 = *(void *)v231;
        char v46 = 1;
        do
        {
          for (muint64_t m = 0LL; mm != v44; ++mm)
          {
            if (*(void *)v231 != v45) {
              objc_enumerationMutation(v42);
            }
            double v48 = *(void **)(*((void *)&v230 + 1) + 8 * mm);
            if ((v46 & 1) != 0)
            {
              int v49 = [v225 appendString:@"Swift Task"] + v24;
              int v24 = [v225 appendString:@" "];
            }

            else
            {
              int v49 = [v225 appendString:@","];
            }

            [MEMORY[0x189603FE8] null];
            id v50 = (void *)objc_claimAutoreleasedReturnValue();

            if (v48 == v50)
            {
              int v51 = [v225 appendString:@"none"];
            }

            else if ([v48 identifier] == -1)
            {
              int v51 = [v225 printWithFormat:@"%@", @"UNKNOWN"];
            }

            else
            {
              int v51 = objc_msgSend(v225, "printWithFormat:", @"%llu", objc_msgSend(v48, "identifier"));
            }

            char v46 = 0;
            v24 += v49 + v51;
          }

          uint64_t v44 = [v42 countByEnumeratingWithState:&v230 objects:&v245 count:16];
          char v46 = 0;
        }

        while (v44);
      }

      else
      {
        int v24 = 0;
      }

      a1 = v41;
      id v17 = v225;
      id v18 = v218;
      id v19 = v219;
    }

    if ((unint64_t)[v19 count] > 1
      || [v19 count] == 1
      && ([v19 firstObject],
          id v52 = (void *)objc_claimAutoreleasedReturnValue(),
          [MEMORY[0x189603FE8] null],
          char v53 = (void *)objc_claimAutoreleasedReturnValue(),
          v53,
          v52,
          v52 != v53))
    {
      if (v24) {
        objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
      }
      __int128 v228 = 0u;
      __int128 v229 = 0u;
      __int128 v226 = 0u;
      __int128 v227 = 0u;
      id obja = v19;
      uint64_t v54 = [obja countByEnumeratingWithState:&v226 objects:v244 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        int v24 = 0;
        char v56 = 1;
        uint64_t v57 = *(void *)v227;
        do
        {
          for (uint64_t nn = 0LL; nn != v55; ++nn)
          {
            if (*(void *)v227 != v57) {
              objc_enumerationMutation(obja);
            }
            uint64_t v59 = *(void **)(*((void *)&v226 + 1) + 8 * nn);
            [MEMORY[0x189603FE8] null];
            uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
            if (v59 == v60) {
              uint64_t v61 = 0LL;
            }
            else {
              uint64_t v61 = v59;
            }
            id v62 = v61;

            if ((v56 & 1) != 0)
            {
              int v63 = [v225 appendString:@"DispatchQueue"] + v24;
              int v24 = [v225 appendString:@" "];
            }

            else
            {
              int v63 = [v225 appendString:@","];
            }

            int v64 = v63 + v24;
            -[SASamplePrinter displayNameForDispatchQueue:](v62);
            char v65 = (void *)objc_claimAutoreleasedReturnValue();
            int v24 = v64 + [v225 printWithFormat:@"%@", v65];

            char v56 = 0;
          }

          uint64_t v55 = [obja countByEnumeratingWithState:&v226 objects:v244 count:16];
          char v56 = 0;
        }

        while (v55);
      }

      else
      {
        int v24 = 0;
      }

      a1 = v210;
      id v17 = v225;
      id v18 = v218;
      id v19 = v219;
    }

    if (v221)
    {
      if (v24) {
        objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
      }
      uint64_t v66 = SACopySanitizedString(v221, 1, 0LL);
      id v67 = (void *)v66;
      if (v209) {
        uint64_t v68 = @"Thread name %@ (changed)";
      }
      else {
        uint64_t v68 = @"Thread name \"%@\"";
      }
      int v24 = objc_msgSend(v17, "printWithFormat:", v68, v66);
    }

    if (!-[SASamplePrinter hasTimeIndexes](a1))
    {
      if (v216)
      {
        [v216 machAbsTimeSeconds];
        double v73 = v72;
        [*(id *)(a1 + 32) machAbsTimeSeconds];
        double v75 = v73 - v74;
        if (v75 > 0.0)
        {
          if (v75 >= 0.01) {
            int v76 = [v17 printWithFormat:@"(not sampled for first %.2fs)", *(void *)&v75];
          }
          else {
            int v76 = [v17 appendString:@"(not sampled for first <0.01s)"];
          }
          v24 += v76;
        }
      }

      goto LABEL_239;
    }

    if (v24) {
      objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
    }
    if (v203 == 1) {
      id v69 = "";
    }
    else {
      id v69 = "s";
    }
    int v24 = objc_msgSend(v17, "printWithFormat:", @"%lu sample%s", v203, v69, v199);
    if (v204 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_239;
    }
    if (-[SASamplePrinter hasTimeIndexes](a1))
    {
      int v70 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
      uint64_t v71 = v204 + 1;
      if (v70) {
        v71 -= *(void *)(a1 + 48);
      }
    }

    else
    {
      uint64_t v71 = 0x7FFFFFFFFFFFFFFFLL;
    }

    int v95 = objc_msgSend(v17, "printWithFormat:", @" (%lu"), v71 + v24;
    uint64_t v96 = v200 - v204;
    if (v200 != v204)
    {
      if (-[SASamplePrinter hasTimeIndexes](a1))
      {
        int v97 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
        uint64_t v98 = v200 + 1;
        if (v97) {
          v98 -= *(void *)(a1 + 48);
        }
      }

      else
      {
        uint64_t v98 = 0x7FFFFFFFFFFFFFFFLL;
      }

      v95 += objc_msgSend(v17, "printWithFormat:", @"-%lu", v98);
    }

    if (v96 + 1 >= v203) {
      break;
    }
    unint64_t v5 = *__error();
    _sa_logt();
    unint64_t v183 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 134218496;
      uint64_t v239 = v200;
      __int16 v240 = 2048;
      unint64_t v241 = v204;
      __int16 v242 = 2048;
      unint64_t v243 = v203;
      _os_log_error_impl( &dword_186C92000,  v183,  OS_LOG_TYPE_ERROR,  "lastSampleIndex %lu - firstSampleIndex %lu + 1 < count %lu",  buf,  0x20u);
    }

    *__error() = v5;
    unint64_t v199 = v203;
    _SASetCrashLogMessage( 9447,  "lastSampleIndex %lu - firstSampleIndex %lu + 1 < count %lu",  v184,  v185,  v186,  v187,  v188,  v189,  v200);
    _os_crash();
    __break(1u);
LABEL_288:
    uint64_t v217 = 0LL;
    uint64_t v206 = 0LL;
    unint64_t v207 = 0LL;
    uint64_t v214 = 0LL;
    unint64_t v215 = 0LL;
    uint64_t v212 = 0LL;
    uint64_t v200 = 0LL;
    uint64_t v201 = 0LL;
    unint64_t v203 = 0LL;
    unint64_t v204 = 0LL;
    id v13 = 0LL;
    id v10 = 0LL;
    id v6 = 0LL;
    id v8 = 0LL;
    int v11 = 0;
    int v209 = 0;
    id v15 = 0LL;
    uint64_t v205 = 0LL;
    unint64_t v202 = 0LL;
    unint64_t v208 = 0LL;
  }

  if (v96 + 1 != v203) {
    v95 += objc_msgSend(v17, "printWithFormat:", @" with gaps of %d", v96 + 1 - v203);
  }
LABEL_218:
  if (v216)
  {
    unint64_t v151 = objc_msgSend(*(id *)(a1 + 160), "indexOfFirstSampleOnOrAfterTimestamp:");
    if (v151)
    {
      unint64_t v152 = v151;
      if (v151 != 0x7FFFFFFFFFFFFFFFLL && v151 <= v204)
      {
        if (-[SASamplePrinter hasTimeIndexes](a1))
        {
          int v153 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
          uint64_t v154 = v152 + 1;
          if (v153) {
            v154 -= *(void *)(a1 + 48);
          }
        }

        else
        {
          uint64_t v154 = 0x7FFFFFFFFFFFFFFFLL;
        }

        v95 += objc_msgSend(v17, "printWithFormat:", @", not sampled before %lu", v154);
      }
    }
  }

  int v24 = [v17 appendString:@""]) + v95;
LABEL_239:
  uint64_t v163 = v214;
  if ((v214 & 0x80000000) == 0)
  {
    if (v24)
    {
      objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
      uint64_t v163 = v214;
    }

    int v164 = v163;
    int v24 = objc_msgSend(v17, "printWithFormat:", @"priority %d", v163);
    if (v164 != (_DWORD)v205) {
      v24 += objc_msgSend(v17, "printWithFormat:", @"-%d", v205);
    }
    if ((v212 & 0x80000000) == 0)
    {
      int v165 = objc_msgSend(v17, "printWithFormat:", @" (base %d"), v212 + v24;
      if ((_DWORD)v212 != (_DWORD)v201) {
        v165 += objc_msgSend(v17, "printWithFormat:", @"-%d", v201);
      }
      int v24 = [v17 appendString:@""]) + v165;
    }
  }

  if (i > 0.0
    && (([*(id *)(a1 + 16) displayDetailedCpuTime] & 1) != 0
     || -[SASamplePrinter shouldPrintTimeOutsideSamplingRange:](a1, i)))
  {
    if (v24) {
      objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
    }
    int v166 = [v17 appendString:@"runnable before first sample for "];
    else {
      uint64_t v167 = 3LL;
    }
    int v24 = saos_printf_seconds(v17, (unint64_t)(i * 1000000000.0), v167) + v166;
  }

  uint64_t v168 = v217;
  if (v215)
  {
    if (v24) {
      objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
    }
    double v169 = @"cpu time ";
    if ((_DWORD)v206) {
      double v169 = @"forced idle time ";
    }
    if (HIDWORD(v206)) {
      char v170 = @"idle time ";
    }
    else {
      char v170 = v169;
    }
    int v171 = [v17 appendString:v170];
    else {
      uint64_t v172 = 3LL;
    }
    int v24 = saos_printf_seconds(v17, v215, v172) + v171;
    if (v207) {
      v24 += saos_printf_cycles_instructions(v17, v207, v202, [*(id *)(a1 + 16) displayDetailedCpuTime]);
    }
    uint64_t v168 = v217;
  }

  if (v168)
  {
    if (v24)
    {
      objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
      uint64_t v168 = v217;
    }

    if (v168 == 1) {
      __int128 v173 = "";
    }
    else {
      __int128 v173 = "s";
    }
    uint64_t v174 = v168;
    SAFormattedBytesEx(v208, 1, 0, 1, 0LL);
    uint64_t v175 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 printWithFormat:@"%lu I/O%s (%@)", v174, v173, v175];

    id v19 = v219;
  }

  [v17 appendString:@"\n"];
  id v20 = v220;
LABEL_279:
  objc_autoreleasePoolPop(context);

  uint64_t v176 = self;
  if (self)
  {
    if (!*((void *)self + 4) || (v177 = objc_getProperty(self, (SEL)self, 120LL, 1), uint64_t v176 = self, v177))
    {
      if (objc_getProperty(v176, (SEL)v176, 120LL, 1))
      {
        id v179 = objc_getProperty(self, v178, 120LL, 1);
        unint64_t v180 = *((void *)self + 4);
        id Property = objc_getProperty(self, v181, 128LL, 1);
        -[SASamplePrinter addStack:toStream:sampleCount:binariesToDisplay:primaryState:primaryMicrostackshotState:onlyHeaviestStack:]( a1,  v179,  v17,  v180,  Property,  0LL,  0,  0);
      }

      goto LABEL_284;
    }

    int v190 = *__error();
    _sa_logt();
    int v191 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
    {
      uint64_t v192 = *((void *)self + 4);
      *(_DWORD *)id v249 = 134217984;
      uint64_t v250 = v192;
      _os_log_error_impl(&dword_186C92000, v191, OS_LOG_TYPE_ERROR, "%lu count, but no rootObjects", v249, 0xCu);
    }

    *__error() = v190;
    _SASetCrashLogMessage( 8747,  "%lu count, but no rootObjects",  v193,  v194,  v195,  v196,  v197,  v198,  *((void *)self + 4));
    _os_crash();
    __break(1u);
  }

  else
  {
LABEL_284:
  }

void __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (-[SASamplePrinter shouldPrintTask:thread:dispatchQueue:]( *(void *)(a1 + 32),  *(void **)(a1 + 40),  v6,  0LL))
  {
    id v4 = *(void **)(a1 + 48);
    -[SASamplePrinter stackForThread:threadStateIndexes:task:taskSampleCount:isTarget:]( *(const char **)(a1 + 32),  v6,  0,  *(void **)(a1 + 40),  *(void *)(a1 + 56),  [v6 threadId] == objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "targetThreadId"));
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addObject:v5];
  }
}

- (SAStack)stackForThread:(void *)a3 threadStateIndexes:(void *)a4 task:(uint64_t)a5 taskSampleCount:(BOOL)a6 isTarget:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  if (a1)
  {
    SEL v14 = objc_alloc_init(&OBJC_CLASS___SAStack);
    char v15 = [v11 isMainThread];
    if (v14)
    {
      v14->_isMainThread = v15;
      v14->_isTargetCallTree = a6;
    }

    id v16 = objc_alloc(MEMORY[0x189603FA8]);
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v11, "threadId"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v19 = (void *)objc_msgSend(v16, "initWithObjects:", v17, 0);
    if (v14) {
      objc_setProperty_atomic(v14, v18, v19, 56LL);
    }

    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:2];
    if (v14) {
      objc_setProperty_atomic(v14, v20, v21, 40LL);
    }

    id v23 = objc_alloc_init(MEMORY[0x189603FA8]);
    if (v14) {
      objc_setProperty_atomic(v14, v22, v23, 48LL);
    }

    -[SASamplePrinter binaryImagesHitByTask:]((uint64_t)a1, v13);
    int v24 = (void *)objc_claimAutoreleasedReturnValue();
    char v26 = v24;
    if (v14)
    {
      objc_setProperty_atomic(v14, v25, v24, 128LL);

      -[SASamplePrinter addHeaderForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:toStack:task:taskSampleCount:]( a1,  0LL,  0LL,  v11,  v12,  v14,  v13,  a5);
      if (!v14->_omit && v14->_count)
      {
        id v27 = objc_alloc_init(MEMORY[0x189603FA8]);
        BOOL threadNameChanges = v14->_threadNameChanges;
        unint64_t v29 = -[NSMutableArray count](v14->_dispatchQueues, "count");
        unint64_t v30 = -[NSMutableArray count](v14->_swiftTasks, "count");
        unint64_t v31 = -[NSMutableArray count](v14->_threadIds, "count");
        char v32 = v14->_minPriority != v14->_maxPriority || v14->_minBasePriority != v14->_maxBasePriority;
        -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]( (uint64_t)a1,  0LL,  0LL,  v11,  v12,  v13,  v27,  threadNameChanges,  v29 > 1,  v30 > 1,  v31 > 1,  v32,  0LL,  0,  1u);
        objc_setProperty_atomic(v14, v33, v27, 120LL);
        uint64_t v34 = v14;

        goto LABEL_20;
      }
    }

    else
    {

      -[SASamplePrinter addHeaderForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:toStack:task:taskSampleCount:]( a1,  0LL,  0LL,  v11,  v12,  0LL,  v13,  a5);
    }

    int v35 = v14;
LABEL_20:

    goto LABEL_21;
  }

  SEL v14 = 0LL;
LABEL_21:

  return v14;
}

void __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_2(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v47 = a3;
  if (-[SASamplePrinter aggregateByDispatchQueue:](a1[4], v47))
  {
    id v4 = (void *)a1[5];
    [*(id *)(a1[4] + 160) targetProcess];
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 == v5)
    {
      uint64_t v7 = [v47 identifier];
      BOOL v6 = v7 == [*(id *)(a1[4] + 160) targetDispatchQueueId];
    }

    else
    {
      BOOL v6 = 0;
    }

    uint64_t v8 = a1[4];
    SEL v9 = (void *)a1[5];
    id v10 = (void *)a1[6];
    uint64_t v11 = a1[7];
    id v12 = v47;
    unint64_t v13 = v9;
    if (v8)
    {
      uint64_t v14 = *(void *)(v8 + 16);
      if (v14)
      {
        uint64_t v15 = *(void *)(v14 + 152);
        if (v15 == 1 || !v15 && !*(_BYTE *)(v14 + 11))
        {
          id v16 = objc_alloc_init(&OBJC_CLASS___SAStack);
          id v17 = v16;
          if (v16) {
            v16->_isTargetCallTree = v6;
          }
          id v19 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
          if (v17) {
            objc_setProperty_atomic(v17, v18, v19, 56LL);
          }

          uint64_t v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v12, 0);
          if (v17) {
            objc_setProperty_atomic(v17, v20, v21, 40LL);
          }

          id v23 = objc_alloc_init(MEMORY[0x189603FA8]);
          if (v17) {
            objc_setProperty_atomic(v17, v22, v23, 48LL);
          }

          -[SASamplePrinter binaryImagesHitByTask:](v8, (void *)v13);
          int v24 = (void *)objc_claimAutoreleasedReturnValue();
          char v26 = v24;
          if (v17)
          {
            objc_setProperty_atomic(v17, v25, v24, 128LL);

            -[SASamplePrinter addHeaderForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:toStack:task:taskSampleCount:]( (const char *)v8,  v12,  0LL,  0LL,  0LL,  v17,  (void *)v13,  v11);
            if (!v17->_omit && v17->_count)
            {
              id v27 = objc_alloc_init(MEMORY[0x189603FA8]);
              BOOL threadNameChanges = v17->_threadNameChanges;
              unint64_t v29 = -[NSMutableArray count](v17->_dispatchQueues, "count");
              unint64_t v30 = -[NSMutableArray count](v17->_swiftTasks, "count");
              unint64_t v31 = -[NSMutableArray count](v17->_threadIds, "count");
              char v32 = v17->_minPriority != v17->_maxPriority || v17->_minBasePriority != v17->_maxBasePriority;
              -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]( v8,  v12,  0LL,  0LL,  0LL,  (void *)v13,  v27,  threadNameChanges,  v29 > 1,  v30 > 1,  v31 > 1,  v32,  0LL,  0,  1u);
              objc_setProperty_atomic(v17, v33, v27, 120LL);
              uint64_t v34 = v17;

              goto LABEL_36;
            }
          }

          else
          {

            -[SASamplePrinter addHeaderForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:toStack:task:taskSampleCount:]( (const char *)v8,  v12,  0LL,  0LL,  0LL,  0LL,  (void *)v13,  v11);
          }

          char v46 = v17;
LABEL_36:

          goto LABEL_37;
        }
      }

      unint64_t v13 = *__error();
      _sa_logt();
      int v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = *(void *)(v8 + 16);
        if (v36)
        {
          uint64_t v37 = *(void *)(v36 + 152);
          if (!v37)
          {
            if (*(_BYTE *)(v36 + 11)) {
              uint64_t v37 = 3LL;
            }
            else {
              uint64_t v37 = 1LL;
            }
          }
        }

        else
        {
          uint64_t v37 = 0LL;
        }

        id v12 = [(id)v36 debugDescription];
        *(_DWORD *)__int128 buf = 134218242;
        uint64_t v49 = v37;
        __int16 v50 = 2080;
        uint64_t v51 = [v12 UTF8String];
        _os_log_error_impl( &dword_186C92000,  v35,  OS_LOG_TYPE_ERROR,  "stackForDispatchQueue, but not kSAAggregateCallTreesByDispatchQueue %llu: %s",  buf,  0x16u);
      }

      *__error() = v13;
      uint64_t v38 = *(void **)(v8 + 16);
      id v10 = (void *)-[SASamplePrintOptions callTreeAggregationResolved]((uint64_t)v38);
      id v39 = [v38 debugDescription];
      [v39 UTF8String];
      _SASetCrashLogMessage( 11936,  "stackForDispatchQueue, but not kSAAggregateCallTreesByDispatchQueue %llu: %s",  v40,  v41,  v42,  v43,  v44,  v45,  (char)v10);

      _os_crash();
      __break(1u);
    }

    id v17 = 0LL;
LABEL_37:

    [v10 addObject:v17];
  }
}

- (uint64_t)aggregateByDispatchQueue:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    else {
      a1 = 1LL;
    }
  }

  return a1;
}

void __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  id v55 = a3;
  if (-[SASamplePrinter shouldPrintTask:thread:dispatchQueue:]( *(void *)(a1 + 32),  *(void **)(a1 + 40),  v55,  0LL))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    BOOL v6 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    id v10 = v55;
    unint64_t v11 = v6;
    uint64_t v54 = (void *)v8;
    if (!v7)
    {
LABEL_42:

      [v54 addObjectsFromArray:v7];
      goto LABEL_43;
    }

    uint64_t v12 = *(void *)(v7 + 16);
    if (!v12 || (uint64_t v13 = *(void *)(v12 + 152), v13 != 1) && (v13 || *(_BYTE *)(v12 + 11)))
    {
      unint64_t v11 = *__error();
      _sa_logt();
      uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = *(void *)(v7 + 16);
        if (v39)
        {
          uint64_t v8 = *(void *)(v39 + 152);
          if (!v8)
          {
            if (*(_BYTE *)(v39 + 11)) {
              uint64_t v8 = 3LL;
            }
            else {
              uint64_t v8 = 1LL;
            }
          }
        }

        else
        {
          uint64_t v8 = 0LL;
        }

        id v40 = [(id)v39 debugDescription];
        *(_DWORD *)__int128 buf = 134218242;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = [v40 UTF8String];
        _os_log_error_impl( &dword_186C92000,  v38,  OS_LOG_TYPE_ERROR,  "stacksForThread, but not kSAAggregateCallTreesByDispatchQueue %llu: %s",  buf,  0x16u);
      }

      *__error() = v11;
      uint64_t v41 = *(void **)(v7 + 16);
      unint64_t v29 = (void *)-[SASamplePrintOptions callTreeAggregationResolved]((uint64_t)v41);
      id v10 = [v41 debugDescription];
      [v10 UTF8String];
      _SASetCrashLogMessage( 8566,  "stacksForThread, but not kSAAggregateCallTreesByDispatchQueue %llu: %s",  v42,  v43,  v44,  v45,  v46,  v47,  (char)v29);

      _os_crash();
      __break(1u);
      goto LABEL_38;
    }

    uint64_t v53 = (uint64_t)v9;
    uint64_t v14 = [*(id *)(v7 + 160) targetDispatchQueueId];
    if (v14)
    {
      [*(id *)(v7 + 160) targetProcess];
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      if (v3 == (id)v11)
      {

        goto LABEL_17;
      }

      if ([v10 isMainThread])
      {

LABEL_15:
        id v17 = objc_alloc(MEMORY[0x189603F18]);
        -[SASamplePrinter stackForThread:threadStateIndexes:task:taskSampleCount:isTarget:]( (const char *)v7,  v10,  0,  (void *)v11,  v53,  [v10 threadId] == objc_msgSend(*(id *)(v7 + 160), "targetThreadId"));
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v7 = objc_msgSend(v17, "initWithObjects:", v18, 0);

        goto LABEL_42;
      }
    }

    else if ([v10 isMainThread])
    {
      goto LABEL_15;
    }

    uint64_t v15 = [v10 threadId];
    uint64_t v16 = [*(id *)(v7 + 160) targetThreadId];
    if (v14) {

    }
    if (v15 == v16) {
      goto LABEL_15;
    }
LABEL_17:
    id v19 = objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v61 = 0LL;
    id v62 = &v61;
    uint64_t v63 = 0x2020000000LL;
    char v64 = 1;
    uint64_t v20 = *(void *)(v7 + 32);
    uint64_t v21 = *(void *)(v7 + 40);
    uint64_t v22 = *(void *)(v7 + 48);
    uint64_t v23 = *(void *)(v7 + 56);
    *(void *)__int128 buf = MEMORY[0x1895F87A8];
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&uint8_t buf[16] = __56__SASamplePrinter_stacksForThread_task_taskSampleCount___block_invoke;
    uint64_t v66 = &unk_189F64000;
    uint64_t v67 = v7;
    uint64_t v71 = &v61;
    int v24 = v10;
    unint64_t v25 = v11;
    id v26 = (id)v11;
    id v68 = v26;
    uint64_t v52 = v24;
    id v27 = v24;
    id v69 = v27;
    id v9 = v19;
    id v70 = v9;
    uint64_t v8 = (uint64_t)v27;
    [v27 enumerateThreadStatesBetweenStartTime:v20 startSampleIndex:v22 endTime:v21 endSampleIndex:v23 reverseOrder:0 block:buf];
    if ([v9 count] != 1 || !*((_BYTE *)v62 + 24))
    {
      id v33 = objc_alloc_init(MEMORY[0x189603FA8]);
      unint64_t v11 = v25;
      v56[0] = MEMORY[0x1895F87A8];
      v56[1] = 3221225472LL;
      v56[2] = __56__SASamplePrinter_stacksForThread_task_taskSampleCount___block_invoke_2;
      v56[3] = &unk_189F64028;
      v56[4] = v7;
      id v57 = v26;
      id v58 = (id)v8;
      id v34 = v33;
      id v59 = v34;
      uint64_t v60 = v53;
      [v9 enumerateKeysAndObjectsUsingBlock:v56];
      int v35 = v59;
      id v36 = v34;

      id v10 = v52;
      uint64_t v7 = (uint64_t)v36;
LABEL_41:

      _Block_object_dispose(&v61, 8);
      goto LABEL_42;
    }

    unint64_t v11 = v25;
    id v10 = v52;
    uint64_t v28 = [*(id *)(v7 + 160) targetThreadId];
    unint64_t v29 = v26;
    unint64_t v30 = *(void **)(v7 + 160);
    if (v28)
    {
      if (![v30 targetDispatchQueueId])
      {
        uint64_t v37 = [(id)v8 threadId];
        BOOL v32 = v37 == [*(id *)(v7 + 160) targetThreadId];
        goto LABEL_40;
      }

      uint64_t v31 = [(id)v8 threadId];
      if (v31 == [*(id *)(v7 + 160) targetThreadId])
      {
        [*(id *)(v7 + 160) targetProcess];
        id v4 = (id)objc_claimAutoreleasedReturnValue();
        if (v4 != v26)
        {
          BOOL v32 = 0;
LABEL_39:

          goto LABEL_40;
        }

        goto LABEL_38;
      }
    }

    else if ([v30 targetDispatchQueueId])
    {
      [*(id *)(v7 + 160) targetProcess];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (v4 != v26)
      {
        BOOL v32 = 0;
        goto LABEL_39;
      }

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_1318( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  unint64_t v5 = a2;
  BOOL v6 = a3;
  uint64_t v7 = MEMORY[0x186E47ACC]();
  uint64_t v8 = (void *)v7;
  if (v5 && (v5[10] & 1) != 0)
  {
    if (!v6 || (v6[10] & 1) == 0)
    {
      uint64_t v9 = -1LL;
      goto LABEL_44;
    }
  }

  else if (v6 && (v6[10] & 1) != 0)
  {
    uint64_t v9 = 1LL;
    goto LABEL_44;
  }

  int v35 = (void *)v7;
  uint64_t v10 = MEMORY[0x1895F87A8];
  v63[0] = MEMORY[0x1895F87A8];
  v63[1] = 3221225472LL;
  v63[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_2_1319;
  v63[3] = &unk_189F63AB0;
  unint64_t v11 = v5;
  id v64 = v11;
  uint64_t v12 = v6;
  id v65 = v12;
  id v40 = (uint64_t (**)(void))MEMORY[0x186E47C94](v63);
  v60[0] = v10;
  v60[1] = 3221225472LL;
  v60[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_3_1320;
  v60[3] = &unk_189F63AB0;
  uint64_t v13 = v11;
  id v61 = v13;
  uint64_t v14 = v12;
  id v62 = v14;
  uint64_t v39 = (uint64_t (**)(void))MEMORY[0x186E47C94](v60);
  v57[0] = v10;
  v57[1] = 3221225472LL;
  v57[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_4;
  v57[3] = &unk_189F63AB0;
  uint64_t v15 = v13;
  id v58 = v15;
  uint64_t v16 = v14;
  id v59 = v16;
  uint64_t v37 = (uint64_t (**)(void))MEMORY[0x186E47C94](v57);
  v54[0] = v10;
  v54[1] = 3221225472LL;
  v54[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_5;
  v54[3] = &unk_189F63AB0;
  id v17 = v15;
  id v55 = v17;
  id v18 = v16;
  id v56 = v18;
  uint64_t v38 = (uint64_t (**)(void))MEMORY[0x186E47C94](v54);
  v51[0] = v10;
  v51[1] = 3221225472LL;
  v51[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_6;
  v51[3] = &unk_189F63AB0;
  id v19 = v17;
  id v52 = v19;
  uint64_t v20 = v18;
  id v53 = v20;
  id v36 = (uint64_t (**)(void))MEMORY[0x186E47C94](v51);
  v48[0] = v10;
  v48[1] = 3221225472LL;
  v48[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_7;
  v48[3] = &unk_189F63F88;
  uint64_t v21 = v19;
  id v49 = v21;
  uint64_t v22 = v20;
  id v50 = v22;
  uint64_t v23 = (uint64_t (**)(void, void))MEMORY[0x186E47C94](v48);
  v45[0] = v10;
  v45[1] = 3221225472LL;
  v45[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_8;
  v45[3] = &unk_189F63FB0;
  uint64_t v46 = v21;
  uint64_t v47 = v22;
  int v24 = (uint64_t (**)(void))MEMORY[0x186E47C94](v45);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  uint64_t v34 = a1;
  id v25 = *(id *)(a1 + 32);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v66 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v42;
LABEL_11:
    uint64_t v29 = 0LL;
    while (2)
    {
      if (*(void *)v42 != v28) {
        objc_enumerationMutation(v25);
      }
      uint64_t v30 = [*(id *)(*((void *)&v41 + 1) + 8 * v29) unsignedLongLongValue];
      switch(v30 & 0x7FFFFFFFFFFFFFFFLL)
      {
        case 1LL:
          BOOL v32 = v40;
          goto LABEL_24;
        case 2LL:
          BOOL v32 = v39;
          goto LABEL_24;
        case 3LL:
          BOOL v32 = v37;
          goto LABEL_24;
        case 4LL:
          BOOL v32 = v36;
          goto LABEL_24;
        case 5LL:
          uint64_t v31 = v23[2](v23, 1LL);
          goto LABEL_25;
        case 6LL:
          uint64_t v31 = v23[2](v23, 0LL);
          goto LABEL_25;
        case 7LL:
        case 8LL:
        case 9LL:
        case 0xALL:
          uint64_t v31 = v24[2](v24);
          goto LABEL_25;
        case 0xBLL:
          BOOL v32 = v38;
LABEL_24:
          uint64_t v31 = v32[2]();
LABEL_25:
          if (!v31) {
            goto LABEL_26;
          }
          if (v30 >= 0) {
            uint64_t v9 = v31;
          }
          else {
            uint64_t v9 = -v31;
          }

          uint64_t v8 = v35;
          goto LABEL_43;
        default:
LABEL_26:
          if (v27 != ++v29) {
            continue;
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v66 count:16];
          if (!v27) {
            goto LABEL_28;
          }
          goto LABEL_11;
      }
    }
  }

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_2_1319(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 && (*(_BYTE *)(v1 + 9) & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (!v4 || (*(_BYTE *)(v4 + 9) & 1) == 0) {
      return -1LL;
    }
  }

  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2 && (*(_BYTE *)(v2 + 9) & 1) != 0) {
      return 1LL;
    }
  }

  return 0LL;
}

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_3_1320(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void *)(v1 + 32);
  }
  else {
    uint64_t v2 = 0LL;
  }
  unint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 32);
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (v2 == v4) {
    return 0LL;
  }
  if (v1) {
    unint64_t v1 = *(void *)(v1 + 32);
  }
  if (v3) {
    unint64_t v3 = *(void *)(v3 + 32);
  }
  if (v1 > v3) {
    return -1LL;
  }
  else {
    return 1LL;
  }
}

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_4(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 40LL, 1);
  }
  id v5 = Property;
  id v6 = *(id *)(a1 + 40);
  if (v6) {
    id v6 = objc_getProperty(v6, v4, 40LL, 1);
  }
  id v7 = v6;
  unint64_t v8 = [v5 count];
  uint64_t v9 = [v7 count];
  if (!(v8 | v9)) {
    goto LABEL_16;
  }
  unint64_t v10 = v9;
  if ([v5 count])
  {
    if ([v5 count] == 1)
    {
      [v5 firstObject];
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189603FE8] null];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v13 = v11 == v12;
    }

    else
    {
      BOOL v13 = 0;
    }
  }

  else
  {
    BOOL v13 = 1;
  }

  if ([v7 count])
  {
    if ([v7 count] != 1)
    {
      if (v13) {
        goto LABEL_27;
      }
      goto LABEL_24;
    }

    [v7 firstObject];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE8] null];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v16 = v14 == v15;
  }

  else
  {
    BOOL v16 = 1;
  }

  if (v13 && v16)
  {
LABEL_16:
    uint64_t v17 = 0LL;
    goto LABEL_17;
  }

  if (v16) {
    uint64_t v17 = -1LL;
  }
  else {
    uint64_t v17 = 1LL;
  }
  if (!v16 && !v13)
  {
LABEL_24:
    if (v10 < v8)
    {
      uint64_t v17 = -1LL;
      goto LABEL_17;
    }

    if (v8 < v10)
    {
LABEL_27:
      uint64_t v17 = 1LL;
      goto LABEL_17;
    }

    if (!v8) {
      goto LABEL_16;
    }
    for (uint64_t i = 0LL; v8 != i; ++i)
    {
      [v5 objectAtIndexedSubscript:i];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189603FE8] null];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20 == v21)
      {

        uint64_t v20 = 0LL;
      }

      [v7 objectAtIndexedSubscript:i];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189603FE8] null];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 == v23)
      {

        uint64_t v22 = 0LL;
      }

      uint64_t v24 = [v20 dispatchQueueLabel];
      uint64_t v25 = [v22 dispatchQueueLabel];
      uint64_t v26 = (void *)v25;
      if (v24 && v25)
      {
        uint64_t v27 = [(id)v24 compare:v25 options:577];
        if (v27)
        {
          char v28 = 0;
          uint64_t v32 = v27;
          goto LABEL_53;
        }
      }

      else
      {
        uint64_t v29 = -1LL;
        if (!v24) {
          uint64_t v29 = 1LL;
        }
        if (v24 | v25)
        {
LABEL_48:
          char v28 = 0;
          goto LABEL_49;
        }
      }

      unint64_t v30 = [v20 identifier];
      unint64_t v31 = [v22 identifier];
      if (v30 && v31)
      {
        if (v30 < v31)
        {
          char v28 = 0;
          uint64_t v29 = -1LL;
LABEL_49:
          uint64_t v32 = v29;
          goto LABEL_53;
        }

        if (v30 > v31)
        {
          char v28 = 0;
          uint64_t v29 = 1LL;
          goto LABEL_49;
        }
      }

      else
      {
        uint64_t v29 = -1LL;
        if (!v30) {
          uint64_t v29 = 1LL;
        }
        if (v30 | v31) {
          goto LABEL_48;
        }
      }

      char v28 = 1;
LABEL_53:

      if ((v28 & 1) == 0)
      {
        uint64_t v17 = v32;
        break;
      }

      uint64_t v17 = 0LL;
    }
  }

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_5(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 48LL, 1);
  }
  id v5 = Property;
  id v6 = *(id *)(a1 + 40);
  if (v6) {
    id v6 = objc_getProperty(v6, v4, 48LL, 1);
  }
  id v7 = v6;
  unint64_t v8 = [v5 count];
  uint64_t v9 = [v7 count];
  if (!(v8 | v9)) {
    goto LABEL_16;
  }
  unint64_t v10 = v9;
  if ([v5 count])
  {
    if ([v5 count] == 1)
    {
      [v5 firstObject];
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189603FE8] null];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v13 = v11 == v12;
    }

    else
    {
      BOOL v13 = 0;
    }
  }

  else
  {
    BOOL v13 = 1;
  }

  if ([v7 count])
  {
    if ([v7 count] != 1)
    {
      if (v13) {
        goto LABEL_27;
      }
      goto LABEL_24;
    }

    [v7 firstObject];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE8] null];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v16 = v14 == v15;
  }

  else
  {
    BOOL v16 = 1;
  }

  if (v13 && v16)
  {
LABEL_16:
    uint64_t v17 = 0LL;
    goto LABEL_17;
  }

  BOOL v19 = v16 || v13;
  if (v16) {
    uint64_t v17 = -1LL;
  }
  else {
    uint64_t v17 = 1LL;
  }
  if (v19) {
    goto LABEL_17;
  }
LABEL_24:
  if (v10 < v8)
  {
    uint64_t v17 = -1LL;
    goto LABEL_17;
  }

  if (v8 < v10)
  {
LABEL_27:
    uint64_t v17 = 1LL;
    goto LABEL_17;
  }

  if (!v8) {
    goto LABEL_16;
  }
  uint64_t v20 = 0LL;
  while (1)
  {
    [v5 objectAtIndexedSubscript:v20];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE8] null];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21 == v22)
    {

      uint64_t v21 = 0LL;
    }

    [v7 objectAtIndexedSubscript:v20];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE8] null];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 == v24)
    {

      uint64_t v23 = 0LL;
    }

    unint64_t v25 = [v21 identifier];
    unint64_t v26 = [v23 identifier];
    if (!v25 || !v26) {
      break;
    }
    if (v25 < v26)
    {
      uint64_t v17 = -1LL;
      goto LABEL_46;
    }

    if (v25 > v26)
    {
      uint64_t v17 = 1LL;
      goto LABEL_46;
    }

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_6(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 56LL, 1);
  }
  id v5 = Property;
  id v6 = *(id *)(a1 + 40);
  if (v6) {
    id v6 = objc_getProperty(v6, v4, 56LL, 1);
  }
  id v7 = v6;
  unint64_t v8 = [v5 count];
  unint64_t v9 = [v7 count];
  if (!(v8 | v9)) {
    goto LABEL_16;
  }
  if (v9 >= v8)
  {
    if (v8 < v9)
    {
LABEL_9:
      uint64_t v10 = 1LL;
      goto LABEL_17;
    }

    if (v8)
    {
      uint64_t v11 = 0LL;
      while (1)
      {
        [v5 objectAtIndexedSubscript:v11];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 objectAtIndexedSubscript:v11];
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v14 = [v12 unsignedLongLongValue];
        if (v14 < [v13 unsignedLongLongValue]) {
          break;
        }
        unint64_t v15 = [v12 unsignedLongLongValue];
        unint64_t v16 = [v13 unsignedLongLongValue];

        if (v15 > v16) {
          goto LABEL_9;
        }
        uint64_t v10 = 0LL;
        if (v8 == ++v11) {
          goto LABEL_17;
        }
      }

      goto LABEL_7;
    }

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_7(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    if (v2) {
      LODWORD(v2) = *(_DWORD *)(v2 + 28);
    }
    unint64_t v3 = *(_DWORD **)(a1 + 40);
    if (v3)
    {
      v3 += 7;
LABEL_10:
      LODWORD(v3) = *v3;
    }
  }

  else
  {
    if (v2) {
      LODWORD(v2) = *(_DWORD *)(v2 + 20);
    }
    unint64_t v3 = *(_DWORD **)(a1 + 40);
    if (v3)
    {
      v3 += 5;
      goto LABEL_10;
    }
  }

  BOOL v4 = (int)v2 < (int)v3;
  else {
    uint64_t v5 = -1LL;
  }
  if (v4) {
    return 1LL;
  }
  else {
    return v5;
  }
}

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  switch(a2)
  {
    case 7LL:
      uint64_t v2 = *(void **)(a1 + 32);
      if (!v2) {
        goto LABEL_45;
      }
      unint64_t v3 = v2[12];
      goto LABEL_4;
    case 8LL:
      uint64_t v2 = *(void **)(a1 + 32);
      if (v2) {
        unint64_t v15 = v2[13];
      }
      else {
        unint64_t v15 = 0LL;
      }
      BOOL v4 = *(void **)(a1 + 40);
      if (v4) {
        unint64_t v16 = v4[13];
      }
      else {
        unint64_t v16 = 0LL;
      }
      if (v15 < v16) {
        return 1LL;
      }
      if (v2) {
        uint64_t v2 = (void *)v2[13];
      }
      if (v4) {
        BOOL v4 = (void *)v4[13];
      }
      goto LABEL_39;
    case 9LL:
      uint64_t v2 = *(void **)(a1 + 32);
      if (v2) {
        unint64_t v6 = v2[14];
      }
      else {
        unint64_t v6 = 0LL;
      }
      BOOL v4 = *(void **)(a1 + 40);
      if (v4) {
        unint64_t v7 = v4[14];
      }
      else {
        unint64_t v7 = 0LL;
      }
      if (v6 < v7) {
        return 1LL;
      }
      if (v2) {
        uint64_t v2 = (void *)v2[14];
      }
      if (v4) {
        BOOL v4 = (void *)v4[14];
      }
      goto LABEL_39;
    case 10LL:
      uint64_t v8 = *(void *)(a1 + 32);
      double v9 = 0.0;
      double v10 = 0.0;
      if (v8)
      {
        unint64_t v11 = *(void *)(v8 + 104);
        if (v11) {
          double v10 = (double)*(unint64_t *)(v8 + 112) / (double)v11;
        }
      }

      uint64_t v12 = *(void *)(a1 + 40);
      if (v12)
      {
        unint64_t v13 = *(void *)(v12 + 104);
        if (v13) {
          double v9 = (double)*(unint64_t *)(v12 + 112) / (double)v13;
        }
      }

      if (v10 < v9) {
        return 1LL;
      }
      if (v10 > v9) {
        return -1LL;
      }
      return 0LL;
    default:
      int v17 = *__error();
      _sa_logt();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 134217984;
        uint64_t v27 = a2;
        _os_log_error_impl(&dword_186C92000, v18, OS_LOG_TYPE_ERROR, "invalid sort option 0x%llx", buf, 0xCu);
      }

      *__error() = v17;
      _SASetCrashLogMessage(8459, "invalid sort option 0x%llx", v19, v20, v21, v22, v23, v24, a2);
      a1 = _os_crash();
      __break(1u);
LABEL_45:
      unint64_t v3 = 0LL;
LABEL_4:
      BOOL v4 = *(void **)(a1 + 40);
      if (v4) {
        unint64_t v5 = v4[12];
      }
      else {
        unint64_t v5 = 0LL;
      }
      if (v3 < v5) {
        return 1LL;
      }
      if (v2) {
        uint64_t v2 = (void *)v2[12];
      }
      if (v4) {
        BOOL v4 = (void *)v4[12];
      }
LABEL_39:
      if (v2 > v4) {
        return -1LL;
      }
      else {
        return 0LL;
      }
  }

void __56__SASamplePrinter_stacksForThread_task_taskSampleCount___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v24 = a2;
  if (![v24 isIdleWorkQueue]
    || ([*(id *)(*(void *)(a1 + 32) + 16) displayIdleWorkQueueThreads] & 1) != 0)
  {
    [v24 dispatchQueue];
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5) {
      int v6 = -[SASamplePrinter aggregateByDispatchQueue:](*(void *)(a1 + 32), v5);
    }
    else {
      int v6 = 0;
    }
    if ([v24 isIdleWorkQueue]) {
      uint64_t v7 = -3LL;
    }
    else {
      uint64_t v7 = [v5 identifier];
    }
    if (![*(id *)(*(void *)(a1 + 32) + 160) targetDispatchQueueId]
      || (uint64_t v8 = *(void **)(a1 + 40),
          [*(id *)(*(void *)(a1 + 32) + 160) targetProcess],
          double v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v8 != v9))
    {
      if ([*(id *)(a1 + 48) isMainThread])
      {
        uint64_t v7 = 0LL;
LABEL_31:
        int v17 = *(void **)(a1 + 56);
        [MEMORY[0x189607968] numberWithUnsignedLongLong:v7];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 objectForKeyedSubscript:v18];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 addObject:v20];
        }

        else
        {
          id v21 = objc_alloc(MEMORY[0x189603FA8]);
          [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = (void *)objc_msgSend(v21, "initWithObjects:", v22, 0);

          uint64_t v23 = *(void **)(a1 + 56);
          [MEMORY[0x189607968] numberWithUnsignedLongLong:v7];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 setObject:v19 forKeyedSubscript:v20];
        }

        goto LABEL_35;
      }

      uint64_t v10 = [*(id *)(a1 + 48) threadId];
      uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 160) targetThreadId];
      if (v10 == v11) {
        char v12 = 0;
      }
      else {
        char v12 = v6;
      }
      if (v10 == v11) {
        uint64_t v7 = 0LL;
      }
      if ((v12 & 1) == 0) {
        goto LABEL_31;
      }
      goto LABEL_29;
    }

    if ([*(id *)(*(void *)(a1 + 32) + 160) targetThreadId])
    {
      uint64_t v13 = [*(id *)(a1 + 48) threadId];
      if (v13 == [*(id *)(*(void *)(a1 + 32) + 160) targetThreadId])
      {
        uint64_t v14 = [v5 identifier];
        if (v14 == [*(id *)(*(void *)(a1 + 32) + 160) targetDispatchQueueId])
        {
          uint64_t v7 = [v5 identifier];
          goto LABEL_31;
        }

        if (!v6) {
          goto LABEL_31;
        }
LABEL_29:
        *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
LABEL_35:

        goto LABEL_36;
      }
    }

    else
    {
      uint64_t v15 = [v5 identifier];
      if (v15 == [*(id *)(*(void *)(a1 + 32) + 160) targetDispatchQueueId]) {
        goto LABEL_29;
      }
    }

    int v16 = [*(id *)(a1 + 48) isMainThread];
    if (v16) {
      uint64_t v7 = 0LL;
    }
    goto LABEL_29;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
LABEL_36:
}

void __56__SASamplePrinter_stacksForThread_task_taskSampleCount___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if ([*(id *)(*(void *)(a1 + 32) + 160) targetThreadId]
    && [*(id *)(*(void *)(a1 + 32) + 160) targetDispatchQueueId]
    && (int v6 = *(void **)(a1 + 40),
        [*(id *)(*(void *)(a1 + 32) + 160) targetProcess],
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6 == v7)
    && (uint64_t v8 = [*(id *)(a1 + 48) threadId],
        v8 == [*(id *)(*(void *)(a1 + 32) + 160) targetThreadId]))
  {
    uint64_t v9 = [v13 unsignedLongLongValue];
    BOOL v10 = v9 == [*(id *)(*(void *)(a1 + 32) + 160) targetDispatchQueueId];
  }

  else
  {
    BOOL v10 = 0;
  }

  uint64_t v11 = *(void **)(a1 + 56);
  -[SASamplePrinter stackForThread:threadStateIndexes:task:taskSampleCount:isTarget:]( *(const char **)(a1 + 32),  *(void **)(a1 + 48),  v5,  *(void **)(a1 + 40),  *(void *)(a1 + 64),  v10);
  char v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 addObject:v12];
}

- (void)addHeaderForDispatchQueue:(void *)a3 orSwiftTaskStates:(void *)a4 orThread:(void *)a5 andThreadStateIndexes:(void *)a6 toStack:(void *)a7 task:(uint64_t)a8 taskSampleCount:
{
  uint64_t v258 = *MEMORY[0x1895F89C0];
  id v15 = a2;
  id v16 = a3;
  int v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  uint64_t v21 = MEMORY[0x186E47ACC]();
  if ((v16 || v15 || !v17) && (v16 || !v15 || v17) && (!v16 || v15 || v17))
  {
    int v89 = *__error();
    _sa_logt();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      if (v17) {
        a1 = "y";
      }
      else {
        a1 = "n";
      }
      if (v15) {
        uint64_t v90 = "y";
      }
      else {
        uint64_t v90 = "n";
      }
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v90;
      if (v16) {
        int v17 = "y";
      }
      else {
        int v17 = "n";
      }
      *(_WORD *)&buf[22] = 2080;
      uint64_t v255 = (uint64_t (*)(uint64_t, uint64_t))v17;
      _os_log_error_impl( &dword_186C92000,  v22,  OS_LOG_TYPE_ERROR,  "aThread %s, aDispatchQueue %s, swiftTaskStates %s",  buf,  0x20u);
    }

    else
    {
      if (v17) {
        a1 = "y";
      }
      else {
        a1 = "n";
      }
      if (v16) {
        int v17 = "y";
      }
      else {
        int v17 = "n";
      }
    }

    *__error() = v89;
    _SASetCrashLogMessage( 8788,  "aThread %s, aDispatchQueue %s, swiftTaskStates %s",  v91,  v92,  v93,  v94,  v95,  v96,  (char)a1);
    _os_crash();
    __break(1u);
    goto LABEL_137;
  }

  context = (void *)v21;
  LOBYTE(v22) = [*((id *)a1 + 2) omitStacksOnAC];
  char v115 = [*((id *)a1 + 2) omitStacksOnBattery];
  char v111 = [*((id *)a1 + 2) omitStacksWithUserIdle];
  char v107 = [*((id *)a1 + 2) omitStacksWithUserActive];
  char v106 = [*((id *)a1 + 2) omitStacksWithPCore];
  char v105 = [*((id *)a1 + 2) omitStacksWithECore];
  int v104 = [*((id *)a1 + 2) omitStacksBelowBasePriority];
  int v103 = [*((id *)a1 + 2) omitStacksAboveBasePriority];
  if ([*((id *)a1 + 2) swiftAsyncDisplayCRootCallstacks]) {
    char v102 = 1;
  }
  else {
    char v102 = [*((id *)a1 + 2) swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways];
  }
  uint64_t v24 = *((void *)a1 + 2);
  uint64_t v109 = v16;
  uint64_t v110 = v18;
  self = v19;
  uint64_t v97 = a8;
  if (!v24)
  {
LABEL_137:
    uint64_t v25 = 0LL;
    uint64_t v26 = 0LL;
    goto LABEL_22;
  }

  uint64_t v25 = *(void *)(v24 + 152);
  if (!v25)
  {
    if (*(_BYTE *)(v24 + 11)) {
      uint64_t v25 = 3LL;
    }
    else {
      uint64_t v25 = 1LL;
    }
  }

  uint64_t v26 = *(void *)(v24 + 160);
  if (!v26)
  {
    if (*(_BYTE *)(v24 + 14)) {
      uint64_t v26 = 2LL;
    }
    else {
      uint64_t v26 = 3LL;
    }
  }

void __123__SASamplePrinter_addHeaderForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_toStack_task_taskSampleCount___block_invoke( uint64_t a1,  void *a2,  void *a3,  unint64_t a4)
{
  uint64_t v108 = *MEMORY[0x1895F89C0];
  id v8 = a2;
  id v9 = a3;
  if (!*(void *)(a1 + 32)) {
    goto LABEL_10;
  }
  if ([*(id *)(*(void *)(a1 + 40) + 160) targetDispatchQueueId])
  {
    BOOL v10 = *(void **)(a1 + 48);
    [*(id *)(*(void *)(a1 + 40) + 160) targetProcess];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {
      uint64_t v12 = [*(id *)(a1 + 32) identifier];
      uint64_t v13 = [*(id *)(*(void *)(a1 + 40) + 160) targetDispatchQueueId];

      if (v12 == v13)
      {
        if (![*(id *)(*(void *)(a1 + 40) + 160) targetThreadId]) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }

    else
    {
    }
  }

  if ([v8 isMainThread]) {
    goto LABEL_139;
  }
LABEL_9:
  uint64_t v14 = [v8 threadId];
  if (v14 == [*(id *)(*(void *)(a1 + 40) + 160) targetThreadId]) {
    goto LABEL_139;
  }
LABEL_10:
  *(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL) = 1;
  int v15 = *(_DWORD *)(a1 + 288);
  int v16 = *(_DWORD *)(a1 + 292);
  if (v16)
  {
  }

  if (*(_BYTE *)(a1 + 296)
    && [v9 isBatteryAndUserActivityValid]
    && ([v9 isUserActive] & 1) != 0)
  {
    goto LABEL_139;
  }

  if (*(_BYTE *)(a1 + 297)
    && [v9 isBatteryAndUserActivityValid]
    && ![v9 isUserActive])
  {
    goto LABEL_139;
  }

  if (*(_BYTE *)(a1 + 298)
    && [v9 isBatteryAndUserActivityValid]
    && ![v9 isOnBattery])
  {
    goto LABEL_139;
  }

  if (*(_BYTE *)(a1 + 299)
    && [v9 isBatteryAndUserActivityValid]
    && ([v9 isOnBattery] & 1) != 0)
  {
    goto LABEL_139;
  }

  if (*(_BYTE *)(a1 + 300) || *(_BYTE *)(a1 + 301))
  {
    if ([v9 isRunning])
    {
      int v17 = (const char *)[v9 cpuNum];
      if ((_DWORD)v17 != -1)
      {
        id v18 = v17;
        if (*(_BYTE *)(a1 + 300))
        {
        }

        if (*(_BYTE *)(a1 + 301)
          && (-[SASampleStore clusterFlagsForCPUNum:](*(void **)(*(void *)(a1 + 40) + 160LL), v18) & 1) != 0)
        {
          goto LABEL_139;
        }
      }
    }
  }

  if ([v9 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL
    && (unint64_t)[v9 startSampleIndex] > *(void *)(*(void *)(a1 + 40) + 56))
  {
    goto LABEL_139;
  }

  if ([v9 endSampleIndex] != 0x7FFFFFFFFFFFFFFFLL
    && (unint64_t)[v9 endSampleIndex] < *(void *)(*(void *)(a1 + 40) + 48))
  {
    goto LABEL_139;
  }

  if (!*(_BYTE *)(a1 + 302) && *(void *)(a1 + 272) != 1LL && *(void *)(a1 + 280) != 3LL && !*(void *)(a1 + 56))
  {
    if ([v9 hasSwiftTask])
    {
      if (([v8 isMainThread] & 1) == 0)
      {
        uint64_t v19 = [v8 threadId];
        if (v19 != [*(id *)(*(void *)(a1 + 40) + 160) targetThreadId]) {
          goto LABEL_139;
        }
      }
    }
  }

  uint64_t v20 = *(void *)(a1 + 40);
  uint64_t v21 = *(void **)(a1 + 48);
  [v9 dispatchQueue];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = -[SASamplePrinter shouldPrintTask:thread:dispatchQueue:](v20, v21, v8, v22);

  if (!(_DWORD)v20) {
    goto LABEL_139;
  }
  if (!*(void *)(a1 + 32)
    && !*(void *)(a1 + 56)
    && *(_BYTE *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL)
    && [v9 isIdleWorkQueue])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL) = 1;
  }

  if (!*(void *)(a1 + 64))
  {
    uint64_t v23 = *(void **)(a1 + 72);
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v8, "threadId"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = [v23 containsObject:v24];

    if ((v23 & 1) == 0)
    {
      uint64_t v25 = *(void **)(a1 + 72);
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v8, "threadId"));
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 addObject:v26];
    }
  }

  if (!*(void *)(a1 + 32))
  {
    [v9 dispatchQueue];
    SEL v27 = (void *)objc_claimAutoreleasedReturnValue();
    SEL v28 = *(void **)(a1 + 80);
    if (v27)
    {
      if (([*(id *)(a1 + 80) containsObject:v27] & 1) == 0) {
        [*(id *)(a1 + 80) addObject:v27];
      }
    }

    else
    {
      [MEMORY[0x189603FE8] null];
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      char v30 = [v28 containsObject:v29];

      if ((v30 & 1) == 0)
      {
        unint64_t v31 = *(void **)(a1 + 80);
        [MEMORY[0x189603FE8] null];
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
        [v31 addObject:v32];
      }
    }
  }

  [v9 swiftTask];
  id v33 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = *(void **)(a1 + 88);
  if (v33)
  {
    if (([*(id *)(a1 + 88) containsObject:v33] & 1) == 0) {
      [*(id *)(a1 + 88) addObject:v33];
    }
  }

  else
  {
    [MEMORY[0x189603FE8] null];
    int v35 = (void *)objc_claimAutoreleasedReturnValue();
    char v36 = [v34 containsObject:v35];

    if ((v36 & 1) == 0)
    {
      unint64_t v37 = *(void **)(a1 + 88);
      [MEMORY[0x189603FE8] null];
      id v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v37 addObject:v38];
    }
  }

  if ([v9 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 120) + 8LL) + 24LL);
    if (v39 == 0x7FFFFFFFFFFFFFFFLL || v39 > [v9 startSampleIndex])
    {
      *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = [v9 startSampleIndex];
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 128) + 8LL) + 40LL), a2);
    }

    unint64_t v40 = *(void *)(*(void *)(*(void *)(a1 + 136) + 8LL) + 24LL);
    if (v40 == 0x7FFFFFFFFFFFFFFFLL || v40 < [v9 endSampleIndex]) {
      *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = [v9 endSampleIndex];
    }
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 144) + 8LL) + 24LL)) {
    goto LABEL_84;
  }
  [v9 name];
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v42 = *(void *)(*(void *)(*(void *)(a1 + 152) + 8LL) + 40LL);
  if (!v41)
  {
    if (!v42) {
      goto LABEL_84;
    }
    goto LABEL_82;
  }

  [v9 name];
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v44 = v43;
  uint64_t v45 = *(void *)(*(void *)(a1 + 152) + 8LL);
  uint64_t v46 = *(void **)(v45 + 40);
  if (!v42)
  {
    *(void *)(v45 + 40) = v43;

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL)) {
      goto LABEL_84;
    }
    goto LABEL_82;
  }

  if (v43 == v46)
  {

    goto LABEL_84;
  }

  [v9 name];
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  char v48 = [v47 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40)];

  if ((v48 & 1) == 0) {
LABEL_82:
  }
    *(_BYTE *)(*(void *)(*(void *)(a1 + 144) + 8LL) + 24LL) = 1;
LABEL_84:
  *(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 24) += [v9 sampleCountInSampleIndexRangeStart:*(void *)(*(void *)(a1 + 40) + 48) end:*(void *)(*(void *)(a1 + 40) + 56)];
  if ([*(id *)(*(void *)(a1 + 40) + 160) dataSource] != 8
    || [*(id *)(*(void *)(a1 + 40) + 160) haveKPerfSched])
  {
    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 168) + 8LL) + 24LL) & 0x80000000) != 0
      || (int)[v9 scheduledPriority] < *(_DWORD *)(*(void *)(*(void *)(a1 + 168) + 8) + 24))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 168) + 8) + 24) = [v9 scheduledPriority];
    }

    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 176) + 8LL) + 24LL) & 0x80000000) != 0
      || (int)[v9 scheduledPriority] > *(_DWORD *)(*(void *)(*(void *)(a1 + 176) + 8) + 24))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 176) + 8) + 24) = [v9 scheduledPriority];
    }

    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 184) + 8LL) + 24LL) & 0x80000000) != 0
      || (int)[v9 basePriority] < *(_DWORD *)(*(void *)(*(void *)(a1 + 184) + 8) + 24))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 184) + 8) + 24) = [v9 basePriority];
    }

    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 192) + 8LL) + 24LL) & 0x80000000) != 0
      || (int)[v9 basePriority] > *(_DWORD *)(*(void *)(*(void *)(a1 + 192) + 8) + 24))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 192) + 8) + 24) = [v9 basePriority];
    }

    -[SAThread cpuTimeForThreadStateIndex:inTimestampRangeStart:end:]( v8,  a4,  *(void **)(*(void *)(a1 + 40) + 32LL),  *(void **)(*(void *)(a1 + 40) + 40LL),  v104);
    id v49 = v104[1];
    *(void *)(*(void *)(*(void *)(a1 + 200) + 8LL) + 24LL) += v104[0];
    *(void *)(*(void *)(*(void *)(a1 + 208) + 8LL) + 24LL) += v49;
    *(void *)(*(void *)(*(void *)(a1 + 216) + 8LL) + 24LL) += v104[2];
  }

  int v103 = 0LL;
  v104[0] = 0LL;
  char v102 = 0LL;
  uint64_t v50 = *(void *)(*(void *)(*(void *)(a1 + 224) + 8LL) + 24LL);
  if (v50 != [v8 threadId])
  {
    *(void *)(*(void *)(*(void *)(a1 + 224) + 8) + 24) = [v8 threadId];
    id Property = *(id *)(*(void *)(a1 + 40) + 160LL);
    if (Property) {
      id Property = objc_getProperty(Property, v51, 968LL, 1);
    }
    id v53 = Property;
    [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(*(void *)(*(void *)(a1 + 224) + 8) + 24)];
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
    [v53 objectForKeyedSubscript:v54];
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v56 = [v55 objectEnumerator];
    uint64_t v57 = *(void *)(*(void *)(a1 + 232) + 8LL);
    uint64_t v58 = *(void **)(v57 + 40);
    *(void *)(v57 + 40) = v56;

    uint64_t v59 = [*(id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40) nextObject];
    uint64_t v60 = *(void *)(*(void *)(a1 + 240) + 8LL);
    id v61 = *(void **)(v60 + 40);
    *(void *)(v60 + 40) = v59;
  }

  id v62 = *(void **)(*(void *)(*(void *)(a1 + 240) + 8LL) + 40LL);
  if (v62)
  {
    uint64_t v63 = -[SASamplePrinter _findIOBefore:during:after:thread:stateIndex:inIO:nextIO:]( *(void *)(a1 + 40),  v104,  &v103,  &v102,  v8,  a4,  *(void **)(*(void *)(*(void *)(a1 + 232) + 8LL) + 40LL),  v62);
    uint64_t v64 = *(void *)(*(void *)(a1 + 240) + 8LL);
    id v65 = *(void **)(v64 + 40);
    *(void *)(v64 + 40) = v63;

    uint64_t v66 = v104[0];
  }

  else
  {
    uint64_t v66 = 0LL;
  }

  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  id v67 = v66;
  uint64_t v68 = [v67 countByEnumeratingWithState:&v98 objects:v107 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v99;
    do
    {
      for (uint64_t i = 0LL; i != v69; ++i)
      {
        if (*(void *)v99 != v70) {
          objc_enumerationMutation(v67);
        }
        *(void *)(*(void *)(*(void *)(a1 + 248) + 8) + 24) += [*(id *)(*((void *)&v98 + 1) + 8 * i) size];
      }

      uint64_t v69 = [v67 countByEnumeratingWithState:&v98 objects:v107 count:16];
    }

    while (v69);
  }

  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  uint64_t v72 = v103;
  uint64_t v73 = [v72 countByEnumeratingWithState:&v94 objects:v106 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v95;
    do
    {
      for (uint64_t j = 0LL; j != v74; ++j)
      {
        if (*(void *)v95 != v75) {
          objc_enumerationMutation(v72);
        }
        *(void *)(*(void *)(*(void *)(a1 + 248) + 8) + 24) += [*(id *)(*((void *)&v94 + 1) + 8 * j) size];
      }

      uint64_t v74 = [v72 countByEnumeratingWithState:&v94 objects:v106 count:16];
    }

    while (v74);
  }

  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v77 = v102;
  uint64_t v78 = [v77 countByEnumeratingWithState:&v90 objects:v105 count:16];
  if (v78)
  {
    uint64_t v79 = v78;
    uint64_t v80 = *(void *)v91;
    do
    {
      for (uint64_t k = 0LL; k != v79; ++k)
      {
        if (*(void *)v91 != v80) {
          objc_enumerationMutation(v77);
        }
        *(void *)(*(void *)(*(void *)(a1 + 248) + 8) + 24) += objc_msgSend( *(id *)(*((void *)&v90 + 1) + 8 * k),  "size",  (void)v90);
      }

      uint64_t v79 = [v77 countByEnumeratingWithState:&v90 objects:v105 count:16];
    }

    while (v79);
  }

  uint64_t v82 = [v67 count];
  uint64_t v83 = [v72 count] + v82;
  *(void *)(*(void *)(*(void *)(a1 + 256) + 8) + 24) += v83 + [v77 count];
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL))
  {
    if ([v9 isRunnable])
    {
      if (([v9 isRunning] & 1) == 0)
      {
        [v9 timestampLastMadeRunnable];
        char v84 = (void *)objc_claimAutoreleasedReturnValue();

        if (v84)
        {
          [v9 startTimestamp];
          char v85 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v85 gt:*(void *)(*(void *)(a1 + 40) + 32)])
          {
            [v9 startTimestamp];
            id v86 = (id)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            id v86 = *(id *)(*(void *)(a1 + 40) + 32LL);
          }

          if (v86)
          {
            [v9 timestampLastMadeRunnable];
            id v87 = (void *)objc_claimAutoreleasedReturnValue();
            [v87 deltaSecondsTo:v86 timeDomainPriorityList:&unk_189F82720 timeDomainUsed:0];
            *(void *)(*(void *)(*(void *)(a1 + 264) + 8LL) + 24LL) = v88;

            uint64_t v89 = *(void *)(*(void *)(a1 + 264) + 8LL);
          }
        }
      }
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 24LL) = 0;

LABEL_139:
}

- (id)_findIOBefore:(void *)a3 during:(void *)a4 after:(void *)a5 thread:(unint64_t)a6 stateIndex:(void *)a7 inIO:(void *)a8 nextIO:
{
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  uint64_t v70 = v17;
  uint64_t v71 = v15;
  if (!a1)
  {
    uint64_t v29 = 0LL;
    goto LABEL_61;
  }

  id v18 = v17;
  id v67 = a2;
  [v15 threadStates];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 objectAtIndexedSubscript:a6];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  unint64_t v65 = a6;
  if (a6)
  {
    [v15 threadStates];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 objectAtIndexedSubscript:a6 - 1];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

    [v22 endTimestamp];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v22 isIdleWorkQueue]) {
      char v24 = 0;
    }
    else {
      char v24 = [v20 isIdleWorkQueue];
    }
  }

  else
  {
    [v15 creationTimestamp];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    char v24 = 0;
  }

  uint64_t v68 = a3;
  uint64_t v69 = a4;
  if (!v23 || *(void *)(a1 + 32) && (objc_msgSend(v23, "lt:") & 1) != 0)
  {
    id v25 = *(id *)(a1 + 32);

    id v26 = v18;
    if (!v25)
    {
      uint64_t v29 = v26;
      uint64_t v23 = 0LL;
LABEL_35:
      char v36 = 0LL;
      uint64_t v45 = 0LL;
      int v35 = 0LL;
      goto LABEL_60;
    }

    int v27 = 0;
    uint64_t v23 = v25;
  }

  else
  {
    id v28 = v18;
    int v27 = 1;
  }

  uint64_t v29 = v18;
  while (1)
  {
    if (v27)
    {
      [v29 startTimestamp];
      char v30 = (void *)objc_claimAutoreleasedReturnValue();
      char v31 = [v30 lt:v23];

      if ((v31 & 1) == 0) {
        break;
      }
      goto LABEL_19;
    }

    [v29 endTimestamp];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    int v33 = [v32 le:v23];

    if (!v33) {
      break;
    }
LABEL_19:
    uint64_t v34 = [v16 nextObject];

    uint64_t v29 = (void *)v34;
    if (!v34) {
      goto LABEL_35;
    }
  }

  uint64_t v64 = a1;
  int v35 = 0LL;
  char v36 = 0LL;
  while (1)
  {
    [v29 startTimestamp];
    unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 endTimestamp];
    id v38 = (void *)objc_claimAutoreleasedReturnValue();
    int v39 = [v37 lt:v38];

    if (!v39) {
      break;
    }
    [v29 endTimestamp];
    unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 startTimestamp];
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    int v42 = [v40 le:v41];

    if (!v42)
    {
      if (!v36)
      {
        char v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v29, 0);
        goto LABEL_32;
      }

      uint64_t v43 = v36;
      goto LABEL_29;
    }

    if ((v24 & 1) == 0)
    {
      if (!v35)
      {
        int v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v29, 0);
        goto LABEL_32;
      }

      uint64_t v43 = v35;
LABEL_29:
      [v43 addObject:v29];
    }

void __123__SASamplePrinter_addHeaderForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_toStack_task_taskSampleCount___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 thread];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v3 threadState];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 threadStateIndex];

  (*(void (**)(uint64_t, id, void *, uint64_t))(v2 + 16))(v2, v6, v4, v5);
}

uint64_t __123__SASamplePrinter_addHeaderForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_toStack_task_taskSampleCount___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  a2,  a3);
}

- (void)iterateDispatchQueue:(void *)a3 orSwiftTaskStates:(void *)a4 orThread:(void *)a5 threadStateIndexes:(unint64_t)a6 startingAtIndex:(void *)a7 endingAfterTimestamp:(void *)a8 task:(char)a9 stopAtTimeJumps:(void *)a10 callback:
{
  uint64_t v129 = *MEMORY[0x1895F89C0];
  id v17 = a2;
  id v18 = a3;
  id v19 = a4;
  id v110 = a5;
  id v117 = a7;
  id v20 = a8;
  char v115 = a10;
  id v112 = v18;
  if (v18 || v17 || !v19)
  {
    if (!v18 && v17 && !v19)
    {
      [v17 states];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }

    if (!v18 || v17 || v19) {
      goto LABEL_122;
    }
    uint64_t v21 = v18;
  }

  else
  {
    uint64_t v21 = v110;
    if (!v110)
    {
      [v19 threadStates];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      uint64_t v23 = v22;
      unint64_t v24 = [v22 count];

      goto LABEL_16;
    }
  }

  unint64_t v24 = [v21 count];
LABEL_16:
  if (v24 > a6)
  {
    uint64_t v108 = v19;
    unint64_t v109 = 0LL;
    unint64_t v25 = 0LL;
    id v26 = 0LL;
    int v121 = 0;
    char v111 = 1;
    unint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    id v113 = v17;
    unint64_t v114 = v24;
    while (1)
    {
      context = (void *)MEMORY[0x186E47ACC]();
      if (v17) {
        break;
      }
      if (v112)
      {
        [v112 objectAtIndexedSubscript:a6];
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v29 thread];
        id v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
        uint64_t v32 = [v29 threadStateIndex];
        goto LABEL_26;
      }

      id v30 = v108;
      if (!v110)
      {
        uint64_t v119 = a6;
        goto LABEL_27;
      }

      [v110 objectAtIndexedSubscript:a6];
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = [v29 unsignedLongValue];
LABEL_26:
      uint64_t v119 = v32;

LABEL_27:
      [v30 threadStates];
      int v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v33 objectAtIndexedSubscript:v119];
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

      unint64_t v34 = [v29 startSampleIndex];
      id v120 = v30;
      uint64_t v122 = v29;
      if (-[SASamplePrinter hasTimeIndexes](a1))
      {
        if (v34 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v17 = 0LL;
          goto LABEL_111;
        }

        if (v34 <= *(void *)(a1 + 48)) {
          unint64_t v34 = *(void *)(a1 + 48);
        }
        [*(id *)(a1 + 160) sampleTimestamps];
        int v35 = (void *)objc_claimAutoreleasedReturnValue();
        [v35 objectAtIndexedSubscript:v34];
        id v17 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v29 = v122;
      }

      else
      {
        [v29 startTimestamp];
        id v17 = (id)objc_claimAutoreleasedReturnValue();
      }

      unint64_t v36 = v27;
      unint64_t v118 = a6;
      [v29 endTimestamp];
      unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (![v17 le:v37])
      {
        id v67 = v17;
        int v77 = v121;
        goto LABEL_102;
      }

      do
      {
        int v38 = [v17 le:v117];

        if (!v38) {
          goto LABEL_103;
        }
        unint64_t v27 = v36;
        if (!v20) {
          goto LABEL_47;
        }
        [v20 taskStates];
        int v39 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v40 = [v39 count];

        if (!v40) {
          goto LABEL_47;
        }
        if (v26)
        {
          [v26 endTimestamp];
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
          int v42 = [v41 lt:v17];

          if (!v42) {
            goto LABEL_47;
          }
        }

        unint64_t v43 = v25 + ((v111 & 1) == 0);
        [v20 taskStates];
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v45 = [v44 count];

        if (v43 >= v45)
        {
          id v26 = 0LL;
LABEL_47:
          uint64_t v29 = v122;
          goto LABEL_48;
        }

        while (1)
        {
          [v20 taskStates];
          uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
          [v46 objectAtIndexedSubscript:v43];
          id v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!-[SASamplePrinter hasTimeIndexes](a1) || [v26 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
          {
            [v26 endTimestamp];
            unint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
            int v48 = [v47 ge:v17];

            if (v48) {
              break;
            }
          }

          ++v43;
          [v20 taskStates];
          id v49 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v50 = [v49 count];

          if (v43 >= v50)
          {
            id v26 = 0LL;
            char v111 = 0;
            unint64_t v27 = v36;
            goto LABEL_47;
          }
        }

        [v26 startTimestamp];
        uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
        char v79 = [v78 le:v17];

        uint64_t v29 = v122;
        if ((v79 & 1) == 0)
        {
          int v80 = *__error();
          _sa_logt();
          uint64_t v81 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            [v26 startTimestamp];
            uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();
            id v83 = [v82 debugDescription];
            uint64_t v84 = [v83 UTF8String];
            id v85 = [v17 debugDescription];
            uint64_t v86 = [v85 UTF8String];
            *(_DWORD *)__int128 buf = 136315394;
            uint64_t v124 = v84;
            __int16 v125 = 2080;
            uint64_t v126 = v86;
            _os_log_error_impl( &dword_186C92000,  v81,  OS_LOG_TYPE_ERROR,  "tempTaskState.startTimestamp %s > timestamp %s",  buf,  0x16u);
          }

          *__error() = v80;
          [v26 startTimestamp];
          id v87 = (void *)objc_claimAutoreleasedReturnValue();
          id v88 = [v87 debugDescription];
          char v89 = [v88 UTF8String];
          id v19 = [v17 debugDescription];
          [v19 UTF8String];
          _SASetCrashLogMessage( 9637,  "tempTaskState.startTimestamp %s > timestamp %s",  v90,  v91,  v92,  v93,  v94,  v95,  v89);

          _os_crash();
          __break(1u);
LABEL_122:
          int v96 = *__error();
          _sa_logt();
          __int128 v97 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          {
            if (v19) {
              __int128 v98 = "y";
            }
            else {
              __int128 v98 = "n";
            }
            if (v17) {
              __int128 v99 = "y";
            }
            else {
              __int128 v99 = "n";
            }
            *(_DWORD *)__int128 buf = 136315650;
            uint64_t v124 = (uint64_t)v98;
            __int16 v125 = 2080;
            uint64_t v126 = (uint64_t)v99;
            if (v112) {
              __int128 v100 = "y";
            }
            else {
              __int128 v100 = "n";
            }
            __int16 v127 = 2080;
            __int128 v128 = v100;
            _os_log_error_impl( &dword_186C92000,  v97,  OS_LOG_TYPE_ERROR,  "thread %s, dispatchQueue %s, swiftTaskStates %s",  buf,  0x20u);
          }

          else if (v19)
          {
            __int128 v98 = "y";
          }

          else
          {
            __int128 v98 = "n";
          }

          *__error() = v96;
          _SASetCrashLogMessage( 9560,  "thread %s, dispatchQueue %s, swiftTaskStates %s",  v101,  v102,  v103,  v104,  v105,  v106,  (char)v98);
          _os_crash();
          __break(1u);
        }

        char v111 = 0;
        unint64_t v25 = v43;
        unint64_t v27 = v36;
LABEL_48:
        buf[0] = 0;
        BOOL v52 = v27 != 0x7FFFFFFFFFFFFFFFLL && v27 == v34;
        LOBYTE(v107) = v121;
        a6 = v118;
        id v30 = v120;
        v115[2](v115, v118, v34, v26, v120, v119, v29, v52, v107, buf);
        if (buf[0]) {
          goto LABEL_116;
        }
        if (a9 && *(void *)(a1 + 96))
        {
          BOOL v53 = -[SASamplePrinter hasTimeIndexes](a1);
          BOOL v54 = v27 != 0x7FFFFFFFFFFFFFFFLL && v27 > v34;
          BOOL v55 = v54;
          if (v53 && !v55)
          {
            unint64_t v56 = v109;
            if (v109 < [*(id *)(a1 + 96) count])
            {
              if (v27 == 0x7FFFFFFFFFFFFFFFLL)
              {
                [*(id *)(a1 + 96) objectAtIndexedSubscript:v109];
                uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v58 = [v57 unsignedLongValue];

                unint64_t v27 = v58;
                unint64_t v56 = v109;
              }

              if (v27 <= v34)
              {
                do
                {
                  if (++v56 >= [*(id *)(a1 + 96) count]) {
                    break;
                  }
                  [*(id *)(a1 + 96) objectAtIndexedSubscript:v56];
                  uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
                  unint64_t v60 = [v59 unsignedLongValue];

                  unint64_t v27 = v60;
                }

                while (v60 <= v34);
              }

              unint64_t v109 = v56;
              if (v56 >= [*(id *)(a1 + 96) count]) {
                unint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
              }
              id v30 = v120;
            }
          }
        }

        if (!v26) {
          goto LABEL_79;
        }
        if (-[SASamplePrinter hasTimeIndexes](a1))
        {
          unint64_t v61 = [v26 endSampleIndex];
          if (v61 >= [v122 endSampleIndex]) {
            goto LABEL_79;
          }
        }

        if (!-[SASamplePrinter hasTimeIndexes](a1))
        {
          [v26 endTimestamp];
          id v62 = (void *)objc_claimAutoreleasedReturnValue();
          [v122 endTimestamp];
          unint64_t v63 = v27;
          uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
          int v65 = [v62 ge:v64];

          unint64_t v27 = v63;
          id v30 = v120;

          if (v65)
          {
LABEL_79:
            if (v27 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v29 = v122;
              if (-[SASamplePrinter hasTimeIndexes](a1) && v27 < [v122 endSampleIndex] + 1)
              {
                [*(id *)(a1 + 160) sampleTimestamps];
                int v66 = (void *)objc_claimAutoreleasedReturnValue();
                [v66 objectAtIndexedSubscript:v27];
                id v67 = (void *)objc_claimAutoreleasedReturnValue();

                id v17 = v66;
                unint64_t v36 = v27;
                unint64_t v34 = v27;
                goto LABEL_97;
              }

              goto LABEL_109;
            }

            unint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_108:
            uint64_t v29 = v122;
LABEL_109:
            int v121 = 0;
            goto LABEL_110;
          }
        }

        if (v27 != 0x7FFFFFFFFFFFFFFFLL
          && -[SASamplePrinter hasTimeIndexes](a1)
          && v27 < [v26 endSampleIndex] + 1)
        {
          [*(id *)(a1 + 160) sampleTimestamps];
          uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
          [v68 objectAtIndexedSubscript:v27];
          id v67 = (void *)objc_claimAutoreleasedReturnValue();

          id v17 = v68;
          unint64_t v36 = v27;
          unint64_t v34 = v27;
          goto LABEL_96;
        }

        unint64_t v36 = v27;
        unint64_t v69 = v25 + 1;
        do
        {
          unint64_t v25 = v69;
          [v20 taskStates];
          uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v71 = [v70 count];

          if (v25 >= v71)
          {

LABEL_107:
            id v26 = 0LL;
            unint64_t v27 = v36;
            id v30 = v120;
            goto LABEL_108;
          }

          [v20 taskStates];
          uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
          [v72 objectAtIndexedSubscript:v25];
          uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();

          uint64_t v74 = [v73 startSampleIndex];
          unint64_t v69 = v25 + 1;
          id v26 = v73;
        }

        while (v74 == 0x7FFFFFFFFFFFFFFFLL);
        if (!v73) {
          goto LABEL_107;
        }
        uint64_t v75 = [v73 startSampleIndex];
        if (v75 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v73 startTimestamp];
          id v67 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
        }

        else
        {
          unint64_t v34 = v75;
          [*(id *)(a1 + 160) sampleTimestamps];
          BOOL v76 = (void *)objc_claimAutoreleasedReturnValue();
          [v76 objectAtIndexedSubscript:v34];
          id v67 = (void *)objc_claimAutoreleasedReturnValue();

          id v17 = v76;
        }

        id v26 = v73;
LABEL_96:
        uint64_t v29 = v122;
LABEL_97:

        [v29 endTimestamp];
        unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
        int v121 = 0;
        int v77 = 0;
        id v17 = v67;
      }

      while (([v67 le:v37] & 1) != 0);
LABEL_102:

      id v17 = v67;
      int v121 = v77;
LABEL_103:
      a6 = v118;
      unint64_t v27 = v36;
      id v30 = v120;
      uint64_t v29 = v122;
LABEL_110:
      if ([v17 gt:v117])
      {
LABEL_116:

        objc_autoreleasePoolPop(context);
        id v17 = v113;
        goto LABEL_117;
      }

- (id)stateChangeStringForThreadState:(void *)a3 serialDispatchQueue:(void *)a4 swiftTaskStates:(void *)a5 thread:(void *)a6 threadStateIndexes:(void *)a7 taskState:(void *)a8 task:(uint64_t)a9 iteratorIndex:(char)a10 missingStateIsInAnotherStack:(uint64_t)a11 numSamplesOmittedSincePreviousDisplayedSample:(void *)a12 sampleTimestamp:(void *)a13 previousSampleTimestamp:(void *)a14 previousDisplayedTimestamp:(void *)a15 previousTaskState:(void *)a16 previousThread:(void *)a17 previousThreadState:(char)a18 dispatchQueueChanges:(char)a19 swiftTaskChanges:(char)a20 priorityChanges:(char)a21 nameChanges:(char)a22 threadChanges:(char)a23 isTimeJump:(void *)a24 ioEventsSincePreviousThreadState:
{
  uint64_t v378 = *MEMORY[0x1895F89C0];
  id v352 = a2;
  unint64_t v338 = a3;
  unint64_t v336 = a4;
  id v347 = a5;
  id v335 = a6;
  id v350 = a7;
  id v337 = a8;
  id v344 = a12;
  id v341 = a13;
  id v31 = a14;
  id v349 = a15;
  id v339 = a16;
  id v351 = a17;
  id v343 = a24;
  uint64_t v348 = a1;
  uint64_t v340 = v31;
  if (!a1)
  {
LABEL_430:
    id v273 = 0LL;
LABEL_418:

    return v273;
  }

  uint64_t v367 = 0LL;
  __int128 v368 = &v367;
  uint64_t v369 = 0x3032000000LL;
  __int128 v370 = __Block_byref_object_copy__4;
  id v371 = __Block_byref_object_dispose__4;
  id v372 = 0LL;
  if (v31 && a23)
  {
    if (!v344 || !v341)
    {
LABEL_424:
      int v289 = *__error();
      _sa_logt();
      unsigned int v290 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v290, OS_LOG_TYPE_ERROR))
      {
        id v291 = [v341 debugDescription];
        a6 = (void *)[v291 UTF8String];
        id v292 = [v344 debugDescription];
        uint64_t v293 = [v292 UTF8String];
        *(_DWORD *)__int128 buf = 136315394;
        *(void *)&uint8_t buf[4] = a6;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v293;
        _os_log_error_impl( &dword_186C92000,  v290,  OS_LOG_TYPE_ERROR,  "timeJump, but previousSampleTimestamp %s and sampleTimestamp %s",  buf,  0x16u);
      }

      *__error() = v289;
      id v294 = [v341 debugDescription];
      unint64_t v50 = [v294 UTF8String];
      id v295 = [v344 debugDescription];
      [v295 UTF8String];
      _SASetCrashLogMessage( 9778,  "timeJump, but previousSampleTimestamp %s and sampleTimestamp %s",  v296,  v297,  v298,  v299,  v300,  v301,  v50);

      _os_crash();
      __break(1u);
LABEL_427:
      LODWORD(v349) = *__error();
      _sa_logt();
      uint64_t v302 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v302, OS_LOG_TYPE_ERROR))
      {
        id v350 = [v339 debugDescription];
        uint64_t v303 = [v350 UTF8String];
        id v304 = [v351 debugDescription];
        uint64_t v305 = [v304 UTF8String];
        id v306 = [v347 debugDescription];
        uint64_t v307 = [v306 UTF8String];
        id v308 = [v352 debugDescription];
        uint64_t v309 = [v308 UTF8String];
        *(_DWORD *)__int128 buf = 134219266;
        *(void *)&uint8_t buf[4] = a6;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v50;
        *(_WORD *)&buf[22] = 2080;
        uint64_t v374 = (uint64_t (*)(uint64_t, uint64_t))v303;
        *(_WORD *)uint64_t v375 = 2080;
        *(void *)&v375[2] = v305;
        *(_WORD *)&v375[10] = 2080;
        *(void *)&v375[12] = v307;
        __int16 v376 = 2080;
        uint64_t v377 = v309;
        _os_log_error_impl( &dword_186C92000,  v302,  OS_LOG_TYPE_ERROR,  "expected index %lu, actual is %lu, previousThread:%s previousThreadState:%s thread:%s threadState:%s",  buf,  0x3Eu);
      }

      *__error() = (int)v349;
      id v310 = [v339 debugDescription];
      [v310 UTF8String];
      id v311 = [v351 debugDescription];
      [v311 UTF8String];
      id v312 = [v347 debugDescription];
      [v312 UTF8String];
      id v313 = [v352 debugDescription];
      [v313 UTF8String];
      _SASetCrashLogMessage( 9839,  "expected index %lu, actual is %lu, previousThread:%s previousThreadState:%s thread:%s threadState:%s",  v314,  v315,  v316,  v317,  v318,  v319,  (char)a6);

      _os_crash();
      __break(1u);
      goto LABEL_430;
    }

    double v32 = -[SASamplePrinter timeSpentAsleepBetweenStartTimestamp:endTimestamp:](a1, v31, v344);
    if (v32 > 0.0)
    {
      int v33 = (void *)v368[5];
      if (v33)
      {
        objc_msgSend(v33, "appendString:", @", ");
      }

      else
      {
        uint64_t v34 = [objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
        int v35 = (void *)v368[5];
        v368[5] = v34;
      }

      objc_msgSend((id)v368[5], "appendFormat:", @"machine asleep for %.0fs", *(void *)&v32);
    }

    if (-[SASamplePrinter complainAboutSamplingGapBetweenStartTimestamp:endTimestamp:](a1, v341, v344))
    {
      unint64_t v36 = (void *)v368[5];
      if (v36)
      {
        objc_msgSend(v36, "appendString:", @", ");
      }

      else
      {
        uint64_t v37 = [objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
        int v38 = (void *)v368[5];
        v368[5] = v37;
      }

      int v39 = (void *)v368[5];
      [v344 machAbsTimeSeconds];
      double v41 = v40;
      [v341 machAbsTimeSeconds];
      objc_msgSend(v39, "appendFormat:", @"%.0fms gap with no samples", (v41 - v42) * 1000.0);
    }
  }

  if (v338)
  {
    unint64_t v43 = @"DispatchQueue";
LABEL_19:
    if (a11)
    {
      uint64_t v44 = (void *)v368[5];
      if (v44)
      {
        objc_msgSend(v44, "appendString:", @", ");
      }

      else
      {
        uint64_t v46 = [objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
        unint64_t v47 = (void *)v368[5];
        v368[5] = v46;
      }

      int v48 = @"s";
      if (a11 == 1) {
        int v48 = &stru_189F64BD8;
      }
      [(id)v368[5] appendFormat:@"%@ omitted via filtering for %lu sample%@", v43, a11, v48];
    }

    if (!v352 || v351 == v352)
    {
LABEL_64:
      if (v347) {
        BOOL v63 = v339 == v347;
      }
      else {
        BOOL v63 = 1;
      }
      char v64 = v63;
      char v334 = v64;
      if (!v63 && a22)
      {
        int v65 = (void *)v368[5];
        if (v65)
        {
          objc_msgSend(v65, "appendString:", @", ");
        }

        else
        {
          uint64_t v66 = [objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
          id v67 = (void *)v368[5];
          v368[5] = v66;
        }

        [(id)v368[5] appendFormat:@"%@ 0x%llx", @"Thread", objc_msgSend(v347, "threadId")];
      }

      if (v352) {
        BOOL v68 = v351 == v352;
      }
      else {
        BOOL v68 = 1;
      }
      char v69 = v68;
      char v342 = v69;
      if (v68) {
        goto LABEL_135;
      }
      if (v351)
      {
        [v351 swiftTask];
        uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
        [v352 swiftTask];
        unint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (v70 == v71)
        {

LABEL_103:
          [v351 dispatchQueue];
          id v83 = (void *)objc_claimAutoreleasedReturnValue();
          [v352 dispatchQueue];
          uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
          if (v83 == v84)
          {

            if ((a21 & 1) == 0) {
              goto LABEL_135;
            }
LABEL_113:
            [v351 name];
            uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue();
            [v352 name];
            uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v93 = v91 == v92;

            if (v93) {
              goto LABEL_135;
            }
            [v351 name];
            uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
            if (v94)
            {
              [v352 name];
              uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue();
              if (v95)
              {
                [v351 name];
                int v96 = (void *)objc_claimAutoreleasedReturnValue();
                [v352 name];
                __int128 v97 = (void *)objc_claimAutoreleasedReturnValue();
                char v98 = [v96 isEqualToString:v97];

                if ((v98 & 1) != 0) {
                  goto LABEL_135;
                }
              }

              else
              {
              }
            }

            goto LABEL_121;
          }

          goto LABEL_106;
        }
      }

      else if ((a19 & 1) == 0)
      {
        goto LABEL_105;
      }

      [v352 swiftTask];
      uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v73 = v72;
      if (v72)
      {
        uint64_t v74 = [v72 identifier];
        uint64_t v75 = (void *)v368[5];
        if (v74 == -1)
        {
          if (v75)
          {
            objc_msgSend(v75, "appendString:", @", ");
          }

          else
          {
            uint64_t v81 = [objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
            uint64_t v82 = (void *)v368[5];
            v368[5] = v81;
          }

          [(id)v368[5] appendFormat:@"%@ %@", @"Swift Task", @"UNKNOWN"];
        }

        else
        {
          if (v75)
          {
            objc_msgSend(v75, "appendString:", @", ");
          }

          else
          {
            uint64_t v77 = [objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
            uint64_t v78 = (void *)v368[5];
            v368[5] = v77;
          }

          [(id)v368[5] appendFormat:@"%@ %llu", @"Swift Task", objc_msgSend(v73, "identifier")];
        }
      }

      else
      {
        BOOL v76 = (void *)v368[5];
        if (v76)
        {
          objc_msgSend(v76, "appendString:", @", ");
        }

        else
        {
          uint64_t v79 = [objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
          int v80 = (void *)v368[5];
          v368[5] = v79;
        }

        [(id)v368[5] appendFormat:@"%@ none", @"Swift Task"];
      }

      if (v351) {
        goto LABEL_103;
      }
LABEL_105:
      if (!a18)
      {
        if ((a21 & 1) == 0) {
          goto LABEL_135;
        }
LABEL_121:
        [v352 name];
        __int128 v99 = (void *)objc_claimAutoreleasedReturnValue();

        __int128 v100 = (void *)v368[5];
        if (v99)
        {
          if (v100)
          {
            objc_msgSend(v100, "appendString:", @", ");
          }

          else
          {
            uint64_t v102 = [objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
            uint64_t v103 = (void *)v368[5];
            v368[5] = v102;
          }

          uint64_t v104 = (void *)v368[5];
          [v352 name];
          uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue();
          SACopySanitizedString(v105, 1, 0LL);
          uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue();
          [v104 appendFormat:@"Thread name \"%@\"", v106];

          goto LABEL_135;
        }

        if (v351)
        {
          if (v100)
          {
            objc_msgSend(v100, "appendString:", @", ");
            uint64_t v101 = @"Thread name cleared";
LABEL_134:
            [(id)v368[5] appendFormat:v101];
            goto LABEL_135;
          }

          uint64_t v107 = [objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
          uint64_t v108 = (void *)v368[5];
          v368[5] = v107;
          uint64_t v101 = @"Thread name cleared";
        }

        else
        {
          if (v100)
          {
            objc_msgSend(v100, "appendString:", @", ");
            uint64_t v101 = @"Thread name unset";
            goto LABEL_134;
          }

          uint64_t v109 = [objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
          uint64_t v108 = (void *)v368[5];
          v368[5] = v109;
          uint64_t v101 = @"Thread name unset";
        }

        goto LABEL_134;
      }

uint64_t __461__SASamplePrinter_stateChangeStringForThreadState_serialDispatchQueue_swiftTaskStates_thread_threadStateIndexes_taskState_task_iteratorIndex_missingStateIsInAnotherStack_numSamplesOmittedSincePreviousDisplayedSample_sampleTimestamp_previousSampleTimestamp_previousDisplayedTimestamp_previousTaskState_previousThread_previousThreadState_dispatchQueueChanges_swiftTaskChanges_priorityChanges_nameChanges_threadChanges_isTimeJump_ioEventsSincePreviousThreadState___block_invoke( uint64_t a1,  int a2)
{
  if (a2) {
    BOOL v2 = a2 == 125;
  }
  else {
    BOOL v2 = 1;
  }
  unsigned int v3 = !v2;
  if (*(_BYTE *)(a1 + 32)) {
    return 1LL;
  }
  else {
    return v3;
  }
}

BOOL __461__SASamplePrinter_stateChangeStringForThreadState_serialDispatchQueue_swiftTaskStates_thread_threadStateIndexes_taskState_task_iteratorIndex_missingStateIsInAnotherStack_numSamplesOmittedSincePreviousDisplayedSample_sampleTimestamp_previousSampleTimestamp_previousDisplayedTimestamp_previousTaskState_previousThread_previousThreadState_dispatchQueueChanges_swiftTaskChanges_priorityChanges_nameChanges_threadChanges_isTimeJump_ioEventsSincePreviousThreadState___block_invoke_2( uint64_t a1,  int a2,  int a3)
{
  if (a2 == a3) {
    return 0LL;
  }
  if (*(_BYTE *)(a1 + 32) || a3 != 125 && a3) {
    return 1LL;
  }
  if (a2) {
    BOOL v4 = a2 == 125;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

void __461__SASamplePrinter_stateChangeStringForThreadState_serialDispatchQueue_swiftTaskStates_thread_threadStateIndexes_taskState_task_iteratorIndex_missingStateIsInAnotherStack_numSamplesOmittedSincePreviousDisplayedSample_sampleTimestamp_previousSampleTimestamp_previousDisplayedTimestamp_previousTaskState_previousThread_previousThreadState_dispatchQueueChanges_swiftTaskChanges_priorityChanges_nameChanges_threadChanges_isTimeJump_ioEventsSincePreviousThreadState___block_invoke_3( uint64_t a1,  void *a2,  void *a3,  void *a4,  void *a5)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v30 = a4;
  id v10 = a5;
  [a2 allObjects];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 sortedArrayUsingSelector:sel_compare_];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v19 = [v18 unsignedLongLongValue];
        if (v19 != [*(id *)(a1 + 32) uniquePid] && (objc_msgSend(v9, "containsObject:", v18) & 1) == 0)
        {
          -[SASampleStore taskWithUniquePid:atTimestamp:]( *(void **)(*(void *)(a1 + 40) + 160),  [v18 unsignedLongLongValue],  v10);
          id v20 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
          if (v20)
          {
            if (v21)
            {
              objc_msgSend(v21, "appendString:", @", ");
            }

            else
            {
              uint64_t v22 = [objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
              uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8LL);
              unint64_t v24 = *(void **)(v23 + 40);
              *(void *)(v23 + 40) = v22;
            }

            unint64_t v25 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
            -[SASamplePrinter displayNameForTask:](*(void **)(a1 + 40), v20);
            id v26 = (void *)objc_claimAutoreleasedReturnValue();
            [v25 appendFormat:@"process %@ importance donation from %@", v30, v26];
          }

          else
          {
            if (v21)
            {
              objc_msgSend(v21, "appendString:", @", ");
            }

            else
            {
              uint64_t v27 = [objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
              uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8LL);
              uint64_t v29 = *(void **)(v28 + 40);
              *(void *)(v28 + 40) = v27;
            }

            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:@"process %@ importance donation from %@ [%llu]", v30, @"UNKNOWN", objc_msgSend(v18, "unsignedLongLongValue")];
          }
        }
      }

      uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v15);
  }
}

- (uint64_t)copyDescriptionForIOEvents:(id *)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (!a1) {
    goto LABEL_26;
  }
  if ([v3 count])
  {
    if ([v4 count] == 1)
    {
      [v4 firstObject];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = (id *)-[SASamplePrinter copyDescriptionForIOEvent:](v5);
    }

    else
    {
      else {
        int v6 = [a1[2] displayEachIndividualIOInCallTrees] ^ 1;
      }
      id v7 = objc_alloc(MEMORY[0x189607940]);
      unint64_t v8 = [v4 count];
      uint64_t v9 = 5LL;
      if (v8 > 5) {
        uint64_t v9 = v8;
      }
      a1 = (id *)[v7 initWithCapacity:16 * v9];
      if ([v4 count])
      {
        unint64_t v10 = 0LL;
        unint64_t v11 = 0LL;
        do
        {
          [v4 objectAtIndexedSubscript:v10];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          id v13 = v12;
          if (v10 > 2) {
            char v14 = v6;
          }
          else {
            char v14 = 0;
          }
          if ((v14 & 1) != 0)
          {
            v11 += [v12 size];
          }

          else
          {
            if (v10) {
              objc_msgSend(a1, "appendString:", @", ");
            }
            uint64_t v15 = (void *)-[SASamplePrinter copyDescriptionForIOEvent:](v13);
            [a1 appendString:v15];
          }

          ++v10;
        }

        while (v10 < [v4 count]);
        if ((v6 & 1) == 0) {
          goto LABEL_26;
        }
      }

      else
      {
        unint64_t v11 = 0LL;
        if ((v6 & 1) == 0)
        {
LABEL_26:

          return (uint64_t)a1;
        }
      }

      uint64_t v16 = [v4 count] - 3;
      SAFormattedBytesEx(v11, 1, 0, 0, 0x1000uLL);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 appendFormat:@"... and %lu more I/Os totaling %@", v16, v5];
    }

    goto LABEL_26;
  }

  int v18 = *__error();
  _sa_logt();
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_error_impl(&dword_186C92000, v19, OS_LOG_TYPE_ERROR, "No IO events", buf, 2u);
  }

  *__error() = v18;
  _SASetCrashLogMessage(12272, "No IO events", v20, v21, v22, v23, v24, v25, v26);
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

void __461__SASamplePrinter_stateChangeStringForThreadState_serialDispatchQueue_swiftTaskStates_thread_threadStateIndexes_taskState_task_iteratorIndex_missingStateIsInAnotherStack_numSamplesOmittedSincePreviousDisplayedSample_sampleTimestamp_previousSampleTimestamp_previousDisplayedTimestamp_previousTaskState_previousThread_previousThreadState_dispatchQueueChanges_swiftTaskChanges_priorityChanges_nameChanges_threadChanges_isTimeJump_ioEventsSincePreviousThreadState___block_invoke_4( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9,  _BYTE *a10)
{
  if (*(void *)(a1 + 32) == a5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), *(id *)(a1 + 40));
  }
  else {
    *a10 = 1;
  }
}

void __461__SASamplePrinter_stateChangeStringForThreadState_serialDispatchQueue_swiftTaskStates_thread_threadStateIndexes_taskState_task_iteratorIndex_missingStateIsInAnotherStack_numSamplesOmittedSincePreviousDisplayedSample_sampleTimestamp_previousSampleTimestamp_previousDisplayedTimestamp_previousTaskState_previousThread_previousThreadState_dispatchQueueChanges_swiftTaskChanges_priorityChanges_nameChanges_threadChanges_isTimeJump_ioEventsSincePreviousThreadState___block_invoke_5( uint64_t a1,  void *a2,  void *a3)
{
  id v17 = a2;
  id v5 = a3;
  int v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  if (*(_BYTE *)(a1 + 40))
  {
    if (v6)
    {
      objc_msgSend(v6, "appendString:", @", ");
    }

    else
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }

    unint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    SACopySanitizedString(v5, 1, 0LL);
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 appendFormat:@"Thread becomes blocked by network mount (%@)", v11];
  }

  else
  {
    if (v6)
    {
      objc_msgSend(v6, "appendString:", @", ");
    }

    else
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8LL);
      char v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }

    uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    SACopySanitizedString(v17, 1, 0LL);
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    SACopySanitizedString(v5, 1, 0LL);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 appendFormat:@"Thread becomes blocked by network mount %@ (%@)", v11, v16];
  }
}

- (BOOL)frame:(void *)a3 matchesFrame:
{
  id v5 = a2;
  int v6 = a3;
  uint64_t v7 = v6;
  if (!a1)
  {
LABEL_12:
    BOOL v18 = 0LL;
    goto LABEL_17;
  }

  if (v5 != v6)
  {
    if (v5 && *((unsigned __int8 *)v5 + 8) == *((unsigned __int8 *)v6 + 8))
    {
      if ([*(id *)(a1 + 16) aggregateFramesByOffsetIntoBinary])
      {
        unint64_t WeakRetained = (unint64_t)objc_loadWeakRetained(v5 + 3);
        unint64_t v9 = (unint64_t)objc_loadWeakRetained(v7 + 3);
        unint64_t v10 = (void *)v9;
        if (WeakRetained && v9)
        {
          [(id)WeakRetained binary];
          unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 binary];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 == v12)
          {
            [(id)WeakRetained segment];
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 segment];
            char v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13 == v14)
            {
              uint64_t v15 = [v5 address];
              uint64_t v16 = v15 - [(id)WeakRetained loadAddress];
              uint64_t v17 = [v7 address];
              BOOL v18 = v16 == v17 - [v10 loadAddress];
LABEL_15:

              goto LABEL_17;
            }
          }

uint64_t __245__SASamplePrinter_addStackForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_task_toRootObjects_nameChanges_dispatchQueueChanges_swiftTaskChanges_threadChanges_priorityChanges_microstackshotSummary_onlyHeaviestStack_includeState___block_invoke( uint64_t a1,  void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __245__SASamplePrinter_addStackForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_task_toRootObjects_nameChanges_dispatchQueueChanges_swiftTaskChanges_threadChanges_priorityChanges_microstackshotSummary_onlyHeaviestStack_includeState___block_invoke_1544( uint64_t a1,  uint64_t a2,  unint64_t a3,  void *a4,  void *a5,  char *a6,  void *a7,  int a8,  char a9)
{
  LODWORD(v598) = a8;
  uint64_t v656 = *MEMORY[0x1895F89C0];
  uint64_t v16 = a4;
  v584 = a5;
  id v17 = a5;
  id v582 = a7;
  BOOL v18 = a7;
  uint64_t v19 = v18;
  double v585 = v16;
  double v587 = v18;
  id v611 = v17;
  uint64_t v594 = a2;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(*(void *)(a1 + 32) + 160) sampleTimestamps];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v23 objectAtIndexedSubscript:a3];

    unint64_t v24 = [v19 endSampleIndex];
    unint64_t v25 = *(void *)(*(void *)(a1 + 32) + 56LL);
    if (v24 < v25) {
      unint64_t v25 = v24;
    }
    unint64_t v606 = v25;
    if (v16 && *(_BYTE *)(a1 + 248))
    {
      unint64_t v26 = [v16 endSampleIndex];
      unint64_t v27 = v606;
      if (v606 >= v26) {
        unint64_t v27 = v26;
      }
      unint64_t v606 = v27;
    }

    uint64_t v9 = v606;
    if (v606 < a3)
    {
      int v374 = *__error();
      _sa_logt();
      uint64_t v375 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v375, OS_LOG_TYPE_FAULT))
      {
LABEL_613:

        int v96 = 0LL;
        *__error() = v374;
        uint64_t v95 = v611;
        goto LABEL_590;
      }

uint64_t __245__SASamplePrinter_addStackForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_task_toRootObjects_nameChanges_dispatchQueueChanges_swiftTaskChanges_threadChanges_priorityChanges_microstackshotSummary_onlyHeaviestStack_includeState___block_invoke_1553( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 startTimestamp];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 startTimestamp];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v96 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unint64_t v47 = *__error();
    _sa_logt();
    int v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      id v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      unint64_t v3 = (unint64_t) objc_claimAutoreleasedReturnValue();
      uint64_t v50 = [(id)v3 UTF8String];
      unint64_t v51 = (objc_class *)objc_opt_class();
      id v52 = NSStringFromClass(v51);
      *(_DWORD *)__int128 buf = 136315394;
      uint64_t v93 = v50;
      __int16 v94 = 2080;
      uint64_t v95 = [v52 UTF8String];
      _os_log_error_impl(&dword_186C92000, v48, OS_LOG_TYPE_ERROR, "first is a %s, second is a %s", buf, 0x16u);
    }

    *__error() = v47;
    unint64_t v53 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v53);
    id v12 = (id)[v6 UTF8String];
    id v54 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v54);
    [v7 UTF8String];
    _SASetCrashLogMessage(11159, "first is a %s, second is a %s", v55, v56, v57, v58, v59, v60, (char)v12);

    _os_crash();
    __break(1u);
LABEL_57:
    if (v47)
    {
      id v43 = 0LL;
      uint64_t v10 = 1LL;
LABEL_96:

      goto LABEL_33;
    }

    if (v12)
    {
      id v61 = objc_getProperty(v12, v46, 56LL, 1);
      if ((v4 & 1) != 0)
      {
        id v62 = 0LL;
        char v91 = v61;
        if (v61)
        {
          uint64_t v10 = -1LL;
          id v4 = 0LL;
          goto LABEL_95;
        }

        goto LABEL_94;
      }

uint64_t __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_1582( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    int v16 = *__error();
    _sa_logt();
    unint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      BOOL v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      uint64_t v20 = [v19 UTF8String];
      unint64_t v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      *(_DWORD *)__int128 buf = 136315394;
      uint64_t v35 = v20;
      __int16 v36 = 2080;
      uint64_t v37 = [v22 UTF8String];
      _os_log_error_impl(&dword_186C92000, v17, OS_LOG_TYPE_ERROR, "first is a %s, second is a %s", buf, 0x16u);
    }

    *__error() = v16;
    unint64_t v23 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v23);
    char v25 = [v24 UTF8String];
    uint64_t v26 = (objc_class *)objc_opt_class();
    id v27 = NSStringFromClass(v26);
    [v27 UTF8String];
    _SASetCrashLogMessage(11278, "first is a %s, second is a %s", v28, v29, v30, v31, v32, v33, v25);

    _os_crash();
    __break(1u);
  }

  unint64_t v6 = [v4 size];
  if (v6 < [v5 size]) {
    goto LABEL_4;
  }
  unint64_t v8 = [v4 size];
  if (v8 > [v5 size] || (unsigned int v9 = objc_msgSend(v4, "tier"), v9 < objc_msgSend(v5, "tier")))
  {
LABEL_7:
    uint64_t v7 = -1LL;
    goto LABEL_8;
  }

  unsigned int v11 = [v4 tier];
  if (v11 <= [v5 tier])
  {
    if (v4)
    {
      unsigned int v12 = v4[3];
      if (v5)
      {
LABEL_12:
        unsigned int v13 = v5[3];
        goto LABEL_13;
      }
    }

    else
    {
      unsigned int v12 = 0;
      if (v5) {
        goto LABEL_12;
      }
    }

    unsigned int v13 = 0;
LABEL_13:
    if (v12 < v13) {
      goto LABEL_7;
    }
    if (v4)
    {
      unsigned int v14 = v4[3];
      if (v5)
      {
LABEL_16:
        unsigned int v15 = v5[3];
LABEL_17:
        uint64_t v7 = v14 > v15;
        goto LABEL_8;
      }
    }

    else
    {
      unsigned int v14 = 0;
      if (v5) {
        goto LABEL_16;
      }
    }

    unsigned int v15 = 0;
    goto LABEL_17;
  }

void __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_1588( uint64_t a1,  void *a2,  unsigned int a3,  _BYTE *a4)
{
  uint64_t v414 = *MEMORY[0x1895F89C0];
  id v380 = a2;
  unsigned int v9 = (void *)MEMORY[0x186E47ACC]();
  if (a3 >= 0x7FFFFFFF)
  {
    int v19 = *__error();
    _sa_logt();
    BOOL v262 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v262, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)char v410 = 67109120;
      *(_DWORD *)&v410[4] = a3;
      _os_log_error_impl(&dword_186C92000, v262, OS_LOG_TYPE_ERROR, "unmodifed depth %u", v410, 8u);
    }

    *__error() = v19;
    _SASetCrashLogMessage(11343, "unmodifed depth %u", v263, v264, v265, v266, v267, v268, a3);
    _os_crash();
    __break(1u);
    goto LABEL_315;
  }

  unint64_t v10 = *(void *)(a1 + 168);
  if (v10 && *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) >= v10) {
    goto LABEL_7;
  }
  int v11 = *(unsigned __int8 *)(a1 + 208);
  if (!*(_BYTE *)(a1 + 208))
  {
LABEL_9:
    uint64_t v14 = *(void *)(a1 + 96);
    uint64_t v15 = *(unsigned int *)(*(void *)(v14 + 8) + 24LL);
    if ((int)v15 >= 1)
    {
      unint64_t v16 = v15 + 1;
      do
      {
        --v16;
      }

      while (v16 > 1);
      uint64_t v14 = *(void *)(a1 + 96);
    }

    *(void *)char v410 = 0LL;
    int v411 = v410;
    uint64_t v412 = 0x2020000000LL;
    unsigned int v413 = a3;
    int v17 = *(_DWORD *)(*(void *)(v14 + 8) + 24LL);
    uint64_t v18 = *(void *)(a1 + 104);
    int v19 = a3;
    uint64_t v382 = a1;
    if (v17 <= 0)
    {
LABEL_18:
      context = v9;
      *(void *)uint64_t v406 = 0LL;
      uint64_t v407 = v406;
      uint64_t v408 = 0x2020000000LL;
      int v20 = 2 * v19 + 2;
      if (v11) {
        int v20 = 2;
      }
      int v409 = v20;
      v395[0] = MEMORY[0x1895F87A8];
      v395[1] = 3221225472LL;
      v395[2] = __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_1593;
      v395[3] = &unk_189F64220;
      v395[4] = v14;
      v395[5] = v18;
      unsigned int v396 = a3;
      v395[6] = v410;
      v395[7] = v406;
      char v397 = v11;
      id v379 = (void (**)(void, void))MEMORY[0x186E47C94](v395);
      objc_opt_class();
      uint64_t v21 = a1;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v22 = v380;
        id v4 = v22;
        self = v22;
        if (!*(void *)(a1 + 176) || (unint64_t)[v22 sampleCount] > *(void *)(a1 + 176))
        {
          if ([*(id *)(*(void *)(a1 + 32) + 16) systemstatsFormat]
            && ([v4 isTruncatedLeafCallstack] & 1) != 0)
          {
            goto LABEL_379;
          }

          if (!a3)
          {
            [v4 frame];
            uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();
            int v87 = [v86 isTruncatedBacktraceFrame];

            uint64_t v21 = v382;
            uint64_t v88 = *(void *)(*(void *)(v382 + 112) + 8LL);
            LODWORD(v377) = 0;
            if (v87) {
              *(_BYTE *)(v88 + 24) = 1;
            }
            else {
              *(_BYTE *)(v88 + 24) = 0;
            }
LABEL_135:
            id v4 = self;
LABEL_136:
            if (!*(void *)(v21 + 64)) {
              goto LABEL_140;
            }
            if (!v4) {
              goto LABEL_333;
            }
            for (id i = objc_getProperty(v4, v24, 40LL, 1); ; id i = 0LL)
            {
              id v128 = i;
              [v128 sortUsingComparator:*(void *)(v382 + 64)];

              id v4 = self;
              uint64_t v21 = v382;
LABEL_140:
              if (*(_BYTE *)(v21 + 209))
              {
                uint64_t v129 = *(void *)(*(void *)(v21 + 120) + 8LL);
                if (*(_BYTE *)(v129 + 24)) {
                  *(_BYTE *)(v129 + 24) = 0;
                }
                else {
                  [*(id *)(v21 + 40) appendString:@","];
                }
                [*(id *)(v382 + 40) appendString:@"{"];
                [self writeJSONDictionaryEntriesToStream:*(void *)(v382 + 40)];
                uint64_t v131 = *(void **)(v382 + 40);
                [MEMORY[0x189607968] numberWithUnsignedInt:*((unsigned int *)v411 + 6)];
                BOOL v132 = (void *)objc_claimAutoreleasedReturnValue();
                SAJSONWriteDictionaryEntry(v131, @"depth", v132);

                if (!*(_BYTE *)(v382 + 210))
                {
                  uint64_t v133 = *(void **)(v382 + 40);
                  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[SASamplePrinter displayTimeIndexForSampleIndex:]( *(void *)(v382 + 32),  objc_msgSend(self, "startSampleIndex") + objc_msgSend(self, "sampleCount") - 1));
                  uint64_t v134 = (void *)objc_claimAutoreleasedReturnValue();
                  SAJSONWriteDictionaryEntry(v133, @"endIndex", v134);
                }

                if ((_DWORD)v377) {
                  SAJSONWriteDictionaryEntry(*(void **)(v382 + 40), @"patched", MEMORY[0x189604A88]);
                }
                [*(id *)(v382 + 40) appendString:@"}"];
                uint64_t v77 = *(void *)(v382 + 80);
                goto LABEL_152;
              }

              uint64_t v130 = *(void *)(*(void *)(*(void *)(v21 + 128) + 8LL) + 24LL);
              if (v130 != 0x7FFFFFFFFFFFFFFFLL)
              {
                if (*(_BYTE *)(v21 + 210))
                {
                  saos_printf_frame( *(void **)(v21 + 40),  *(unsigned int *)(*(void *)(*(void *)(v21 + 136) + 8LL) + 24LL),  *(unsigned int *)(v21 + 200),  v130 - *(void *)(*(void *)(*(void *)(v21 + 144) + 8LL) + 24LL) + 1,  *(unsigned __int8 *)(*(void *)(*(void *)(v21 + 152) + 8LL) + 24LL),  *(void **)(*(void *)(*(void *)(v21 + 160) + 8LL) + 40LL));
                }

                else
                {
                  unint64_t v153 = -[SASamplePrinter displayTimeIndexForSampleIndex:](*(void *)(v21 + 32), v130);
                  saos_printf_timeline_frame( *(void **)(v382 + 40),  *(unsigned int *)(*(void *)(*(void *)(v382 + 136) + 8LL) + 24LL),  *(unsigned int *)(v382 + 200),  *(void *)(*(void *)(*(void *)(v382 + 128) + 8LL) + 24LL)
                  - *(void *)(*(void *)(*(void *)(v382 + 144) + 8LL) + 24LL)
                  + 1LL,
                    *(unsigned __int8 *)(*(void *)(*(void *)(v382 + 152) + 8LL) + 24LL),
                    *(void **)(*(void *)(*(void *)(v382 + 160) + 8LL) + 40LL),
                    v153);
                }

                ++*(void *)(*(void *)(*(void *)(v382 + 80) + 8LL) + 24LL);
                *(_BYTE *)(*(void *)(*(void *)(v382 + 152) + 8LL) + 24LL) = 0;
                *(_DWORD *)(*(void *)(*(void *)(v382 + 136) + 8LL) + 24LL) = 0;
                uint64_t v154 = *(void *)(*(void *)(v382 + 160) + 8LL);
                uint64_t v155 = *(void **)(v154 + 40);
                *(void *)(v154 + 40) = 0LL;

                id v4 = self;
                uint64_t v21 = v382;
                *(void *)(*(void *)(*(void *)(v382 + 144) + 8LL) + 24LL) = 0x7FFFFFFFFFFFFFFFLL;
                *(void *)(*(void *)(*(void *)(v382 + 128) + 8LL) + 24LL) = 0x7FFFFFFFFFFFFFFFLL;
              }

              uint64_t v156 = *(void *)(v21 + 32);
              [v4 frame];
              int v157 = (id *)(id)objc_claimAutoreleasedReturnValue();
              unint64_t v158 = v157;
              if (!v156)
              {
                uint64_t v171 = 0LL;
                goto LABEL_350;
              }

              if (!v157)
              {
                id v5 = 0LL;
LABEL_348:
                uint64_t v171 = @"???";
LABEL_349:

LABEL_350:
                uint64_t v405 = v171;
                [MEMORY[0x189603F18] arrayWithObjects:&v405 count:1];
                uint64_t v180 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_351;
              }

              unint64_t WeakRetained = (int *)objc_loadWeakRetained(v157 + 3);
              id v5 = WeakRetained;
              if (!WeakRetained) {
                goto LABEL_348;
              }
              [WeakRetained binary];
              uint64_t v160 = (void *)objc_claimAutoreleasedReturnValue();
              [v5 segment];
              __int128 v161 = (void *)objc_claimAutoreleasedReturnValue();
              [v161 name];
              id v162 = (id)objc_claimAutoreleasedReturnValue();
              [*(id *)(v156 + 80) objectForKeyedSubscript:v160];
              uint64_t v163 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v164 = v163;
              if (v162)
              {
                [v163 objectForKeyedSubscript:v162];
                uint64_t v165 = (void *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                [MEMORY[0x189603FE8] null];
                uint64_t v182 = (void *)objc_claimAutoreleasedReturnValue();
                [v164 objectForKeyedSubscript:v182];
                uint64_t v165 = (void *)objc_claimAutoreleasedReturnValue();
              }

              if (v165)
              {
                uint64_t v171 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lu + %llu",  objc_msgSend(v165, "unsignedLongValue"),  objc_msgSend(v158, "address") - objc_msgSend(v5, "loadAddress"));

                goto LABEL_349;
              }

void *__125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_1593( void *result,  int a2)
{
  unint64_t v3 = result;
  uint64_t v4 = *(void *)(result[4] + 8LL);
  uint64_t v5 = *(int *)(v4 + 24);
  if (!(_DWORD)v5
    || (uint64_t v6 = *(void *)(*(void *)(result[5] + 8LL) + 24LL),
        uint64_t v7 = v5 - 1,
        *(_DWORD *)(v6 + 8 * (v5 - 1)) != *((_DWORD *)result + 16)))
  {
    *(_DWORD *)(v4 + 24) = v5 + 1;
    uint64_t result = realloc( *(void **)(*(void *)(result[5] + 8LL) + 24LL),  8LL * *(int *)(*(void *)(result[4] + 8LL) + 24LL));
    *(void *)(*(void *)(v3[5] + 8LL) + 24LL) = result;
    *(_DWORD *)(*(void *)(*(void *)(v3[5] + 8LL) + 24LL) + 8LL * *(int *)(*(void *)(v3[4] + 8LL) + 24LL) - 8) = *((_DWORD *)v3 + 16);
    uint64_t v8 = *(int *)(*(void *)(v3[4] + 8LL) + 24LL);
    uint64_t v9 = *(void *)(*(void *)(v3[5] + 8LL) + 24LL);
    if ((int)v8 < 2)
    {
      int v10 = 0;
      uint64_t v11 = v8 - 1;
    }

    else
    {
      int v10 = *(_DWORD *)(v9 + 8LL * (v8 - 2) + 4);
      uint64_t v11 = (v8 - 1);
    }

    *(_DWORD *)(v9 + 8 * v11 + 4) = v10;
    uint64_t v6 = *(void *)(*(void *)(v3[5] + 8LL) + 24LL);
    uint64_t v7 = *(int *)(*(void *)(v3[4] + 8LL) + 24LL) - 1LL;
  }

  *(_DWORD *)(v6 + 8 * v7 + 4) += a2;
  *(_DWORD *)(*(void *)(v3[6] + 8LL) + 24LL) += a2;
  if (*((_BYTE *)v3 + 68)) {
    int v12 = 2;
  }
  else {
    int v12 = 2 * *(_DWORD *)(*(void *)(v3[6] + 8LL) + 24LL) + 2;
  }
  *(_DWORD *)(*(void *)(v3[7] + 8LL) + 24LL) = v12;
  return result;
}

- (uint64_t)copyDescriptionForTruncatedLeafFrame:(void *)a3 otherCallTreeDescription:(void *)a4 binariesToDisplay:(void *)a5 extraBinariesToDisplay:
{
  if (result)
  {
    uint64_t v8 = result;
    id v9 = a3;
    int v10 = -[SASamplePrinter copyDescriptionsForFrame:binariesToDisplay:extraBinariesToDisplay:](v8, a2, a4, a5);
    if ([v10 count])
    {
      [v10 firstObject];
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    id v12 = objc_alloc(NSString);
    unsigned int v13 = @"???";
    if (v11) {
      unsigned int v13 = v11;
    }
    uint64_t v14 = [v12 initWithFormat:@"<callstack in another call tree for %@: %@>", v9, v13];

    return v14;
  }

  return result;
}

- (void)copyDescriptionsForFrame:(void *)a3 binariesToDisplay:(void *)a4 extraBinariesToDisplay:
{
  uint64_t v91 = *MEMORY[0x1895F89C0];
  uint64_t v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1)
  {
    unint64_t v16 = 0LL;
    goto LABEL_56;
  }

  if (!v7)
  {
    unint64_t v16 = &unk_189F82738;
    goto LABEL_56;
  }

  if (![v7 isTruncatedBacktraceFrame])
  {
    uint64_t v17 = [v7 address];
    uint64_t v18 = v7 + 3;
    id WeakRetained = objc_loadWeakRetained(v7 + 3);
    uint64_t v76 = a1;
    uint64_t v73 = WeakRetained;
    if (WeakRetained)
    {
      int v20 = WeakRetained;
      uint64_t v74 = v7 + 3;
      [WeakRetained binary];
      uint64_t v21 = v7;
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 segment];
      unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = [v20 loadAddress];
      uint64_t v25 = [v21 address];
      unint64_t v26 = v25 - [v20 loadAddress];
      id v27 = v9;
      id v28 = v8;
      char v29 = [v21 isKernel];
      id v68 = v21;
      [v21 exclave];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v31 = v29;
      id v8 = v28;
      id v9 = v27;
      -[SASamplePrinter displayedBinaryLoadInfoForBinary:segment:desiredLoadAddress:offsetIntoLoadInfo:isInKernelAddressSpace:exclave:binariesToDisplay:extraBinariesToDisplay:]( v22,  v23,  v24,  v26,  v31,  v30,  v8,  v27);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v33 = [v32 loadAddress];

      if (v33 != [v20 loadAddress]) {
        uint64_t v17 = v33 + v17 - [v73 loadAddress];
      }

      uint64_t v18 = v74;
      a1 = v76;
      uint64_t v7 = v68;
    }

    id v34 = v7;
    id v72 = v8;
    if ([v34 isExclave])
    {
      [v34 exclave];
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      __int16 v36 = v35;
      if (v35)
      {
        [v35 name];
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();

        id v38 = objc_alloc(NSString);
        if (v37)
        {
          [v36 name];
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
          id v40 = (__CFString *)[v38 initWithFormat:@"exclave %@", v39];
        }

        else
        {
          id v40 = (__CFString *)objc_msgSend( v38,  "initWithFormat:",  @"exclave %#18llx",  objc_msgSend(v36, "identifier"));
        }

        a1 = v76;
      }

      else
      {
        id v40 = @"exclave UNKNOWN";
      }
    }

    else
    {
      id v40 = 0LL;
    }

    [v34 instruction];
    uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
    id v41 = objc_loadWeakRetained(v18);
    id v71 = v9;
    if (!v41)
    {
      if (v40)
      {
        unsigned int v42 = (void *)[objc_alloc(NSString) initWithFormat:@"??? (%@)", v40];
        v84[0] = v42;
        [MEMORY[0x189603F18] arrayWithObjects:v84 count:1];
        id v43 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v84[0] = @"???";
        [MEMORY[0x189603F18] arrayWithObjects:v84 count:1];
        id v43 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_43;
    }

    if (v40) {
      id v69 = (__CFString *)[objc_alloc(NSString) initWithFormat:@" %@", v40];
    }
    else {
      id v69 = &stru_189F64BD8;
    }
    uint64_t v44 = [v34 address];
    uint64_t v45 = v44 - [v41 loadAddress];
    [v41 binary];
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ([*(id *)(a1 + 16) displaySymbolInformation])
    {
      uint64_t v67 = v45;
      [v46 name];
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        [v46 name];
        int v48 = (void *)objc_claimAutoreleasedReturnValue();
        SACopySanitizedString(v48, 1, 0LL);
        id v70 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v57 = objc_alloc(NSString);
        [v46 uuid];
        int v48 = (void *)objc_claimAutoreleasedReturnValue();
        [v48 UUIDString];
        id v58 = (void *)objc_claimAutoreleasedReturnValue();
        id v70 = (id)[v57 initWithFormat:@"<%@>", v58];

        a1 = v76;
      }

      id v43 = (id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
      if (v75 && v75[1])
      {
        v84[0] = MEMORY[0x1895F87A8];
        v84[1] = 3221225472LL;
        v84[2] = __45__SASamplePrinter_copySymbolStringsForFrame___block_invoke;
        v84[3] = &unk_189F643A0;
        v84[4] = a1;
        BOOL v85 = v75;
        uint64_t v86 = v34;
        id v70 = v70;
        id v87 = v70;
        uint64_t v59 = v69;
        uint64_t v90 = v67;
        uint64_t v88 = v69;
        id v43 = v43;
        id v89 = v43;
        [v85 enumerateSymbols:v84];

LABEL_42:
        a1 = v76;
LABEL_43:

        if ([*(id *)(a1 + 16) displayFrameAddresses])
        {
          uint64_t v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v43, "count"));
          __int128 v77 = 0u;
          __int128 v78 = 0u;
          __int128 v79 = 0u;
          __int128 v80 = 0u;
          id v14 = v43;
          uint64_t v61 = [v14 countByEnumeratingWithState:&v77 objects:v81 count:16];
          if (v61)
          {
            uint64_t v62 = v61;
            uint64_t v63 = *(void *)v78;
            do
            {
              for (uint64_t i = 0LL; i != v62; ++i)
              {
                if (*(void *)v78 != v63) {
                  objc_enumerationMutation(v14);
                }
                id v65 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ [0x%llx]", *(void *)(*((void *)&v77 + 1) + 8 * i), v17];
                [v60 addObject:v65];
              }

              uint64_t v62 = [v14 countByEnumeratingWithState:&v77 objects:v81 count:16];
            }

            while (v62);
          }

          unint64_t v16 = (void *)[v60 copy];
          id v9 = v71;
          id v8 = v72;
        }

        else
        {
          id v14 = v43;
          unint64_t v16 = v14;
          id v8 = v72;
        }

        uint64_t v11 = v73;
        goto LABEL_54;
      }

      id v51 = v41;
      id v52 = v46;
      id v53 = v34;
      id v54 = v40;
      uint64_t v55 = v69;
      id v50 = (void *)[objc_alloc(NSString) initWithFormat:@"??? (%@ + %llu%@)", v70, v67, v69];
      uint64_t v56 = (void *)[v50 copy];
      [v43 addObject:v56];
    }

    else
    {
      id v49 = objc_alloc(NSString);
      [v46 uuid];
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      [v70 UUIDString];
      id v50 = (void *)objc_claimAutoreleasedReturnValue();
      id v51 = v41;
      id v52 = v46;
      id v53 = v34;
      id v54 = v40;
      uint64_t v55 = v69;
      uint64_t v56 = (void *)[v49 initWithFormat:@"%@ + %llu%@", v50, v45, v69];
      v84[0] = v56;
      [MEMORY[0x189603F18] arrayWithObjects:v84 count:1];
      id v43 = (id)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v59 = v55;
    id v40 = v54;
    id v34 = v53;
    uint64_t v46 = v52;
    id v41 = v51;
    id v9 = v71;

    goto LABEL_42;
  }

  if ([v7 isKernel])
  {
    if ([v7 isExclave])
    {
      [v7 exclave];
      int v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = v10;
      if (!v10)
      {
        unint64_t v16 = &unk_189F82750;
        goto LABEL_55;
      }

      [v10 name];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();

      id v13 = objc_alloc(NSString);
      if (v12)
      {
        [v11 name];
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = (void *)[v13 initWithFormat:@"<exclave %@>", v14];
        uint64_t v83 = v15;
        [MEMORY[0x189603F18] arrayWithObjects:&v83 count:1];
        unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v14 = (id)objc_msgSend(v13, "initWithFormat:", @"<exclave 0x%llx>", objc_msgSend(v11, "identifier"));
        id v82 = v14;
        [MEMORY[0x189603F18] arrayWithObjects:&v82 count:1];
        unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      }

id __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_1605( uint64_t a1,  const char *a2,  uint64_t a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 88LL, 1);
  }
  id v7 = Property;
  [v7 firstObject];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 startTime];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASamplePrinter displayNameForPid:threadId:timestamp:](v6, (uint64_t)a2, a3, v9);
  int v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_2( uint64_t a1,  const char *a2,  uint64_t a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 88LL, 1);
  }
  id v7 = Property;
  [v7 firstObject];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 startTime];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASamplePrinter displayNameForPid:threadId:timestamp:](v6, (uint64_t)a2, a3, v9);
  int v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)copyDescriptionForTimeRanges:(uint64_t)a1
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (!a1)
  {
LABEL_24:
    id v31 = 0LL;
    goto LABEL_20;
  }

  if (![*(id *)(a1 + 16) callTreeTimestampsTimeDomain])
  {
    int v33 = *__error();
    _sa_logt();
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl(&dword_186C92000, v34, OS_LOG_TYPE_ERROR, "Displaying timestamp with no time domain", buf, 2u);
    }

    *__error() = v33;
    _SASetCrashLogMessage(12137, "Displaying timestamp with no time domain", v35, v36, v37, v38, v39, v40, v41);
    _os_crash();
    __break(1u);
    goto LABEL_24;
  }

  uint64_t v4 = [*(id *)(a1 + 16) callTreeTimestampsTimeDomain];
  uint64_t v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189607940]), "initWithCapacity:", 16 * objc_msgSend(v3, "count"));
  -[SASamplePrinter eventStartTimeWithWallTime](a1);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASamplePrinter eventEndTimeWithWallTime](a1);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = MEMORY[0x1895F87A8];
  BOOL v9 = (v4 & (v4 - 1)) != 0;
  v57[0] = MEMORY[0x1895F87A8];
  v57[1] = 3221225472LL;
  v57[2] = __48__SASamplePrinter_copyDescriptionForTimeRanges___block_invoke;
  v57[3] = &unk_189F64350;
  uint64_t v61 = v4;
  id v10 = v5;
  id v58 = v10;
  BOOL v62 = v9;
  id v11 = v6;
  id v59 = v11;
  uint64_t v60 = a1;
  id v12 = (void *)MEMORY[0x186E47C94](v57);
  v51[0] = v8;
  v51[1] = 3221225472LL;
  v51[2] = __48__SASamplePrinter_copyDescriptionForTimeRanges___block_invoke_2;
  v51[3] = &unk_189F64378;
  id v13 = v10;
  id v52 = v13;
  id v14 = v11;
  id v53 = v14;
  id v15 = v7;
  id v54 = v15;
  id v16 = v12;
  id v55 = v16;
  BOOL v56 = v9;
  uint64_t v17 = (void (**)(void, void))MEMORY[0x186E47C94](v51);
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v18 = v3;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v47 objects:v64 count:16];
  if (!v19)
  {

    uint64_t v21 = 0LL;
    goto LABEL_19;
  }

  uint64_t v20 = v19;
  id v42 = v13;
  id v43 = v16;
  id v44 = v15;
  id v45 = v14;
  id v46 = v3;
  uint64_t v21 = 0LL;
  uint64_t v22 = *(void *)v48;
  do
  {
    for (uint64_t i = 0LL; i != v20; ++i)
    {
      if (*(void *)v48 != v22) {
        objc_enumerationMutation(v18);
      }
      uint64_t v24 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      if (v21)
      {
        [v21 endTime];
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 startTime];
        unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        int v27 = [v25 eq:v26];

        if (v27)
        {
          [v24 endTime];
          id v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_atomic(v21, v29, v28, 16LL);
          goto LABEL_13;
        }

        ((void (**)(void, void *))v17)[2](v17, v21);
      }

      uint64_t v30 = [v24 copy];
      id v28 = v21;
      uint64_t v21 = (void *)v30;
LABEL_13:
    }

    uint64_t v20 = [v18 countByEnumeratingWithState:&v47 objects:v64 count:16];
  }

  while (v20);

  if (v21) {
    ((void (**)(void, void *))v17)[2](v17, v21);
  }
  id v14 = v45;
  id v3 = v46;
  id v16 = v43;
  id v15 = v44;
  id v13 = v42;
LABEL_19:
  id v31 = v13;

LABEL_20:
  return v31;
}

void __61__SASamplePrinter_stacksForSwiftAsyncInTask_taskSampleCount___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = (void *)v5[4];
  uint64_t v8 = (void *)v5[5];
  unint64_t v9 = v5[6];
  unint64_t v10 = v5[7];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __61__SASamplePrinter_stacksForSwiftAsyncInTask_taskSampleCount___block_invoke_2;
  v12[3] = &unk_189F64298;
  void v12[4] = v5;
  id v13 = v4;
  id v14 = v6;
  id v11 = v4;
  -[SARecipe enumerateStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:]( (uint64_t)v11,  v7,  v9,  v8,  v10,  0,  v12);
}

void __61__SASamplePrinter_stacksForSwiftAsyncInTask_taskSampleCount___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = v3;
  id v7 = v5;
  if (v4)
  {
    uint64_t v8 = *(void *)(v4 + 16);
    if (!v8)
    {
      int v18 = *__error();
      _sa_logt();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = [*(id *)(v4 + 16) debugDescription];
        *(_DWORD *)__int128 buf = 136315138;
        uint64_t v42 = [v20 UTF8String];
        _os_log_error_impl( &dword_186C92000,  v19,  OS_LOG_TYPE_ERROR,  "swiftAsyncCallTreeAggregationResolved returned default: %s",  buf,  0xCu);
      }

      *__error() = v18;
      id v21 = [*(id *)(v4 + 16) debugDescription];
      char v22 = [v21 UTF8String];
      _SASetCrashLogMessage( 11991,  "swiftAsyncCallTreeAggregationResolved returned default: %s",  v23,  v24,  v25,  v26,  v27,  v28,  v22);

      _os_crash();
      __break(1u);
    }

    id v40 = &unk_189F823D0;
    switch(*(void *)(v8 + 160))
    {
      case 0LL:
        if (*(_BYTE *)(v8 + 14)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 1LL:
        int v29 = *__error();
        _sa_logt();
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          id v31 = [*(id *)(v4 + 16) debugDescription];
          *(_DWORD *)__int128 buf = 136315138;
          uint64_t v42 = [v31 UTF8String];
          _os_log_error_impl( &dword_186C92000,  v30,  OS_LOG_TYPE_ERROR,  "aggregationPointForSwiftTask, but kSAAggregateSwiftAsyncTogetherWithOtherCallTrees: %s",  buf,  0xCu);
        }

        *__error() = v29;
        id v32 = [*(id *)(v4 + 16) debugDescription];
        char v33 = [v32 UTF8String];
        _SASetCrashLogMessage( 11968,  "aggregationPointForSwiftTask, but kSAAggregateSwiftAsyncTogetherWithOtherCallTrees: %s",  v34,  v35,  v36,  v37,  v38,  v39,  v33);

        _os_crash();
        __break(1u);
        JUMPOUT(0x186D4DD78LL);
      case 2LL:
LABEL_5:
        unint64_t v9 = (void *)MEMORY[0x189607968];
        unint64_t v10 = -[SASwiftTaskState baseFunctionAddress](v7);
        goto LABEL_11;
      case 3LL:
LABEL_6:
        id v11 = (void *)MEMORY[0x189607968];
        [v7 thread];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = objc_msgSend(v11, "numberWithUnsignedLongLong:", objc_msgSend(v12, "threadId"));
        goto LABEL_7;
      case 5LL:
        if (([(id)v8 printHeavyStacks] & 1) == 0 && objc_msgSend(v6, "identifier") == -1)
        {
          uint64_t v17 = (void *)MEMORY[0x189607968];
          [v7 thread];
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = [v17 numberWithUnsignedLong:v12];
LABEL_7:
          id v40 = (id)v13;
        }

        else
        {
          unint64_t v9 = (void *)MEMORY[0x189607968];
          unint64_t v10 = (void *)[v6 identifier];
LABEL_11:
          [v9 numberWithUnsignedLongLong:v10];
          id v40 = (id)objc_claimAutoreleasedReturnValue();
        }

        break;
      default:
        break;
    }
  }

  else
  {
    id v40 = 0LL;
  }

  uint64_t v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:v40];
  if (v14)
  {
    id v15 = (void *)v14;
    [*(id *)(a1 + 48) objectForKeyedSubscript:v40];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 addObject:v7];
  }

  else
  {
    id v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v7, 0);

    [*(id *)(a1 + 48) setObject:v15 forKeyedSubscript:v40];
  }
}

void __61__SASamplePrinter_stacksForSwiftAsyncInTask_taskSampleCount___block_invoke_3( void *a1,  uint64_t a2,  void *a3)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v6 = a1[4];
  id v5 = (id)a1[5];
  uint64_t v8 = (void *)a1[6];
  uint64_t v7 = a1[7];
  id v41 = v4;
  id v9 = v8;
  if (v6)
  {
    uint64_t v10 = *(void *)(v6 + 16);
    if (v10)
    {
      if (*(void *)(v10 + 160) == 1LL) {
        goto LABEL_32;
      }
      uint64_t v11 = *(void *)(v10 + 152);
      if (v11) {
        goto LABEL_11;
      }
      if (*(_BYTE *)(v10 + 11))
      {
LABEL_32:
        do
        {
          int v12 = *__error();
          _sa_logt();
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            id v9 = [*(id *)(v6 + 16) debugDescription];
            uint64_t v14 = [v9 UTF8String];
            *(_DWORD *)__int128 buf = 136315138;
            uint64_t v43 = v14;
            _os_log_error_impl( &dword_186C92000,  v13,  OS_LOG_TYPE_ERROR,  "stackForSwiftTasks, but kSAAggregateSwiftAsyncTogetherWithOtherCallTrees: %s",  buf,  0xCu);
          }

          *__error() = v12;
          id v5 = [*(id *)(v6 + 16) debugDescription];
          char v15 = [v5 UTF8String];
          _SASetCrashLogMessage( 12036,  "stackForSwiftTasks, but kSAAggregateSwiftAsyncTogetherWithOtherCallTrees: %s",  v16,  v17,  v18,  v19,  v20,  v21,  v15);

          _os_crash();
          __break(1u);
LABEL_11:
          ;
        }

        while (v11 == 3);
      }
    }

    char v22 = objc_alloc_init(&OBJC_CLASS___SAStack);
    uint64_t v24 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
    if (v22) {
      objc_setProperty_atomic(v22, v23, v24, 56LL);
    }

    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
    if (v22) {
      objc_setProperty_atomic(v22, v25, v26, 40LL);
    }

    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
    if (v22) {
      objc_setProperty_atomic(v22, v27, v28, 48LL);
    }

    -[SASamplePrinter binaryImagesHitByTask:](v6, v9);
    int v29 = (void *)objc_claimAutoreleasedReturnValue();
    id v31 = v29;
    if (v22)
    {
      objc_setProperty_atomic(v22, v30, v29, 128LL);

      -[SASamplePrinter addHeaderForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:toStack:task:taskSampleCount:]( (const char *)v6,  0LL,  v41,  0LL,  0LL,  v22,  v9,  v7);
      if (!v22->_omit && v22->_count)
      {
        id v32 = objc_alloc_init(MEMORY[0x189603FA8]);
        BOOL threadNameChanges = v22->_threadNameChanges;
        unint64_t v34 = -[NSMutableArray count](v22->_dispatchQueues, "count");
        unint64_t v35 = -[NSMutableArray count](v22->_swiftTasks, "count");
        unint64_t v36 = -[NSMutableArray count](v22->_threadIds, "count");
        char v37 = v22->_minPriority != v22->_maxPriority || v22->_minBasePriority != v22->_maxBasePriority;
        -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]( v6,  0LL,  v41,  0LL,  0LL,  v9,  v32,  threadNameChanges,  v34 > 1,  v35 > 1,  v36 > 1,  v37,  0LL,  0,  1u);
        objc_setProperty_atomic(v22, v38, v32, 120LL);
        uint64_t v39 = v22;

        goto LABEL_28;
      }
    }

    else
    {

      -[SASamplePrinter addHeaderForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:toStack:task:taskSampleCount:]( (const char *)v6,  0LL,  v41,  0LL,  0LL,  0LL,  v9,  v7);
    }

    id v40 = v22;
LABEL_28:

    goto LABEL_29;
  }

  char v22 = 0LL;
LABEL_29:

  [v5 addObject:v22];
}

uint64_t __61__SASamplePrinter_stacksForSwiftAsyncInTask_taskSampleCount___block_invoke_4( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 threadState];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 startTimestamp];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 threadState];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 startTimestamp];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

void __48__SASamplePrinter_copyDescriptionForTimeRanges___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 56);
  id v26 = v3;
  if ((v4 & 1) == 0)
  {
    if ((v4 & 2) == 0)
    {
      if ((v4 & 4) == 0)
      {
        if ((v4 & 8) == 0)
        {
          if ((v4 & 0x10) == 0) {
            goto LABEL_46;
          }
          goto LABEL_41;
        }

        goto LABEL_34;
      }

      goto LABEL_27;
    }

    goto LABEL_20;
  }

  if (*(_BYTE *)(a1 + 64))
  {
    [*(id *)(a1 + 32) appendString:@"wall:"];
    id v3 = v26;
  }

  [v3 wallTime];
  if (v5 == 0.0)
  {
    uint64_t v13 = *(void **)(a1 + 32);
    goto LABEL_17;
  }

  [*(id *)(a1 + 40) wallTime];
  if (v6 == 0.0)
  {
    char v14 = [*(id *)(*(void *)(a1 + 48) + 16) omitAbsoluteWallTimes];
    char v15 = *(void **)(a1 + 32);
    if ((v14 & 1) == 0)
    {
      [v26 wallTime];
      double v23 = v22;
      else {
        int v24 = 3;
      }
      uint64_t v25 = (__CFString *)_CopyStringForTime(v24, v23);
      [v15 appendString:v25];

      goto LABEL_18;
    }

    uint64_t v13 = *(void **)(a1 + 32);
LABEL_17:
    [v13 appendString:@"???"];
    goto LABEL_18;
  }

  uint64_t v7 = *(void **)(a1 + 32);
  int v8 = [*(id *)(*(void *)(a1 + 48) + 16) displayDetailedWallTime];
  [v26 wallTime];
  double v10 = v9;
  [*(id *)(a1 + 40) wallTime];
  uint64_t v12 = 3LL;
  if (v8) {
    uint64_t v12 = 9LL;
  }
  objc_msgSend(v7, "appendFormat:", @"%.*fs", v12, v10 - v11);
LABEL_18:
  if ((*(_BYTE *)(a1 + 56) & 2) != 0)
  {
    [*(id *)(a1 + 32) appendString:@" "];
    id v3 = v26;
LABEL_20:
    if (*(_BYTE *)(a1 + 64))
    {
      [*(id *)(a1 + 32) appendString:@"machabs:"];
      id v3 = v26;
    }

    if ([v3 machAbsTime]) {
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%llu", objc_msgSend(v26, "machAbsTime"));
    }
    else {
      [*(id *)(a1 + 32) appendString:@"???"];
    }
  }

  if ((*(_BYTE *)(a1 + 56) & 4) == 0) {
    goto LABEL_32;
  }
  [*(id *)(a1 + 32) appendString:@" "];
  id v3 = v26;
LABEL_27:
  if (*(_BYTE *)(a1 + 64))
  {
    [*(id *)(a1 + 32) appendString:@"machabssec:"];
    id v3 = v26;
  }

  [v3 machAbsTimeSeconds];
  uint64_t v16 = *(void **)(a1 + 32);
  if (v17 == 0.0)
  {
    [*(id *)(a1 + 32) appendString:@"???"];
  }

  else
  {
    [v26 machAbsTimeSeconds];
    objc_msgSend(v16, "appendFormat:", @"%fs", v18);
  }

void __48__SASamplePrinter_copyDescriptionForTimeRanges___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) length]) {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", @", ");
  }
  [v8 startTime];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([*(id *)(a1 + 40) isComparable:v3]
    && [*(id *)(a1 + 40) gt:v3])
  {
    id v4 = *(id *)(a1 + 40);

    id v3 = v4;
  }

  [v8 endTime];
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([*(id *)(a1 + 48) isComparable:v5]
    && [*(id *)(a1 + 48) lt:v5])
  {
    id v6 = *(id *)(a1 + 48);

    double v5 = v6;
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  if ([v3 ne:v5])
  {
    if (*(_BYTE *)(a1 + 64)) {
      uint64_t v7 = @" - ";
    }
    else {
      uint64_t v7 = @"-";
    }
    [*(id *)(a1 + 32) appendString:v7];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

- (uint64_t)copyDescriptionForIOEvent:(void *)a1
{
  unint64_t v1 = (objc_class *)NSString;
  id v2 = a1;
  id v3 = objc_alloc(v1);
  SAFormattedBytesEx([v2 size], 1, 0, 0, 0x1000uLL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 type];
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v2 tier];

  uint64_t v7 = [v3 initWithFormat:@"%@ %@T%u", v4, v5, v6];
  return v7;
}

void __45__SASamplePrinter_copySymbolStringsForFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
  [v20 name];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v7)
  {
    SACopySanitizedString(v7, 1, 0LL);
    double v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 appendString:v9];
  }

  else
  {
    [v6 appendString:@"???"];
  }

  objc_msgSend( v6,  "appendFormat:",  @" + %llu",  objc_msgSend(*(id *)(a1 + 40), "offsetIntoSegment")
  - [v20 offsetIntoSegment]
  + [*(id *)(a1 + 48) isSymbolicationOffByOne]);
LABEL_5:
  objc_msgSend(v6, "appendString:", @" (");
  if (v5)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 16) displayFullSourcePaths])
    {
      [v5 filePath];
      double v10 = (void *)objc_claimAutoreleasedReturnValue();
      double v11 = v10;
      if (v10)
      {
        id v12 = v10;
      }

      else
      {
        [v5 fileName];
        id v12 = (id)objc_claimAutoreleasedReturnValue();
      }

      uint64_t v13 = v12;
    }

    else
    {
      [v5 fileName];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v14 = [v5 lineNum];
    uint64_t v15 = [v5 columnNum];
    if (v13)
    {
      uint64_t v16 = v15;
      SACopySanitizedString(v13, 1, 0LL);
      double v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 appendString:v17];

      if ((_DWORD)v14)
      {
        objc_msgSend(v6, "appendFormat:", @":%u", v14);
        if ((_DWORD)v16) {
          objc_msgSend(v6, "appendFormat:", @",%u", v16);
        }
      }
    }

    [v6 appendString:@" in "];
  }

  [v6 appendFormat:@"%@ + %llu%@"],  *(void *)(a1 + 56),  *(void *)(a1 + 80),  *(void *)(a1 + 64));
  uint64_t v18 = *(void **)(a1 + 72);
  uint64_t v19 = (void *)[v6 copy];
  [v18 addObject:v19];
}

- (id)displayNameForTask:(uint64_t)a3 threadId:
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (a3) {
    id v6 = (id)[objc_alloc(NSString) initWithFormat:@"%@ thread 0x%llx", v4, a3];
  }
  else {
    id v6 = v4;
  }
  uint64_t v7 = v6;

  return v7;
}

void __65__SASamplePrinter_displayStringForOnBehalfOfForTasks_includePid___block_invoke( void *a1,  uint64_t a2,  void *a3)
{
  id v5 = (void *)a1[4];
  id v6 = (void *)a1[5];
  uint64_t v7 = v5[4];
  uint64_t v8 = v5[5];
  v14[0] = MEMORY[0x1895F87A8];
  v14[2] = __65__SASamplePrinter_displayStringForOnBehalfOfForTasks_includePid___block_invoke_2;
  void v14[3] = &unk_189F643C8;
  uint64_t v9 = v5[6];
  uint64_t v10 = v5[7];
  v14[1] = 3221225472LL;
  v14[4] = v5;
  id v11 = v6;
  uint64_t v12 = a1[6];
  uint64_t v13 = a1[7];
  id v15 = v11;
  uint64_t v16 = v12;
  uint64_t v17 = v13;
  [a3 enumerateThreadStatesBetweenStartTime:v7 startSampleIndex:v9 endTime:v8 endSampleIndex:v10 reverseOrder:0 block:v14];
}

void __65__SASamplePrinter_displayStringForOnBehalfOfForTasks_includePid___block_invoke_2( uint64_t a1,  void *a2)
{
  id v33 = a2;
  uint64_t v3 = [v33 originPid];
  uint64_t v4 = [v33 proximatePid];
  uint64_t v5 = v4;
  if ((_DWORD)v3 != -1 || (_DWORD)v4 != -1)
  {
    id v6 = *(id **)(a1 + 32);
    [v33 endTimestamp];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASamplePrinter displayNameForPid:aroundTimestamp:includePid:](v6, v3, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v9 = *(id **)(a1 + 32);
    [v33 endTimestamp];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASamplePrinter displayNameForPid:aroundTimestamp:includePid:](v9, v5, v10);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    unint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 160) dataStyle];
    if (v12 - 2 >= 3)
    {
      if (v12 <= 1) {
        -[SAOnBehalfOfMultiple addProximateName:proximatePid:originName:originPid:count:]( *(_DWORD **)(a1 + 40),  v11,  v5,  v8,  v3,  [v33 sampleCountInSampleIndexRangeStart:*(void *)(*(void *)(a1 + 32) + 48) end:*(void *)(*(void *)(a1 + 32) + 56)]);
      }
    }

    else if ([v33 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
      {
        id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
        uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
        id v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;
      }

      uint64_t v16 = objc_alloc(&OBJC_CLASS___SAOnBehalfOfSingle);
      id v17 = v11;
      id v18 = v8;
      if (v16)
      {
        v34.receiver = v16;
        v34.super_class = (Class)&OBJC_CLASS___SAOnBehalfOfSingle;
        uint64_t v16 = (SAOnBehalfOfSingle *)objc_msgSendSuper2(&v34, sel_init);
        if (v16)
        {
          uint64_t v19 = [v17 copy];
          proximateName = v16->_proximateName;
          v16->_proximateName = (NSString *)v19;

          uint64_t v21 = [v18 copy];
          originName = v16->_originName;
          v16->_originName = (NSString *)v21;

          v16->_proximatePid = v5;
          v16->_originPid = v3;
        }
      }

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v16];
      double v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        double v23 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithLength:*(void *)(a1 + 56)];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v23 forKeyedSubscript:v16];
      }

      unint64_t v24 = *(void *)(*(void *)(a1 + 32) + 48LL);
      unint64_t v25 = [v33 startSampleIndex];
      if (v24 <= v25) {
        unint64_t v24 = v25;
      }
      unint64_t v26 = *(void *)(*(void *)(a1 + 32) + 56LL);
      unint64_t v27 = [v33 endSampleIndex];
      if (v26 >= v27) {
        unint64_t v28 = v27;
      }
      else {
        unint64_t v28 = v26;
      }
      if (v24 < v28)
      {
        do
        {
          uint64_t v29 = [v23 mutableBytes];
          *(_BYTE *)(v29 + (v24 >> 3)) |= 1 << (v24 & 7);
          ++v24;
          unint64_t v30 = *(void *)(*(void *)(a1 + 32) + 56LL);
          unint64_t v31 = [v33 endSampleIndex];
          if (v30 >= v31) {
            unint64_t v32 = v31;
          }
          else {
            unint64_t v32 = v30;
          }
        }

        while (v24 < v32);
      }
    }
  }
}

void __65__SASamplePrinter_displayStringForOnBehalfOfForTasks_includePid___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  self = a2;
  id v5 = a3;
  id v6 = (int8x8_t *)[v5 bytes];
  unint64_t v7 = [v5 length];
  if (v7 != *(void *)(a1 + 40))
  {
    int v19 = *__error();
    _sa_logt();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v5 length];
      uint64_t v21 = *(void *)(a1 + 40);
      *(_DWORD *)__int128 buf = 134218240;
      uint64_t v31 = v20;
      __int16 v32 = 2048;
      uint64_t v33 = v21;
      _os_log_error_impl( &dword_186C92000,  v9,  OS_LOG_TYPE_ERROR,  "sampleIndexBitfield.length %lu != bitfieldSize %llu",  buf,  0x16u);
    }

    *__error() = v19;
    char v22 = [v5 length];
    _SASetCrashLogMessage( 13054,  "sampleIndexBitfield.length %lu != bitfieldSize %llu",  v23,  v24,  v25,  v26,  v27,  v28,  v22);
    _os_crash();
    __break(1u);
    goto LABEL_12;
  }

  if (v7 >= 8)
  {
    LODWORD(v9) = 0;
    unint64_t v11 = v7 >> 3;
    uint64_t v10 = self;
    do
    {
      int8x8_t v12 = *v6++;
      uint8x8_t v13 = (uint8x8_t)vcnt_s8(v12);
      v13.i16[0] = vaddlv_u8(v13);
      LODWORD(v9) = (_DWORD)v9 + v13.i32[0];
      --v11;
    }

    while (v11);
  }

  else
  {
    LODWORD(v9) = 0;
    uint64_t v10 = self;
  }

  a1 = *(void *)(a1 + 32);
  if (!v10)
  {
LABEL_12:
    id v17 = 0LL;
    id v14 = 0LL;
    uint64_t v15 = 0LL;
    int v18 = 0;
    goto LABEL_8;
  }

  id v14 = objc_getProperty(v10, v8, 16LL, 1);
  uint64_t v15 = self[2];
  id v17 = objc_getProperty(self, v16, 24LL, 1);
  int v18 = self[3];
LABEL_8:
  -[SAOnBehalfOfMultiple addProximateName:proximatePid:originName:originPid:count:]( (_DWORD *)a1,  v14,  v15,  v17,  v18,  (int)v9);
}

uint64_t __44__SASamplePrinter_displayStringForHIDEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v5 hidEventTimestamp];
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (v5) {
      id Property = objc_getProperty(v5, v6, 32LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v9 = Property;

    [v9 startTime];
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = v9;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v4 hidEventTimestamp];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (v4) {
      id v12 = objc_getProperty(v4, v10, 32LL, 1);
    }
    else {
      id v12 = 0LL;
    }
    id v13 = v12;
    [v13 startTime];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v14 = [v7 compare:v11];

  return v14;
}

void __40__SASamplePrinter_numIOsForTask_ioSize___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v7 = a3;
  id Property = *(id *)(a1[4] + 160LL);
  if (Property) {
    id Property = objc_getProperty(Property, v6, 968LL, 1);
  }
  id v9 = Property;
  [v9 objectForKeyedSubscript:v5];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [v7 creationTimestamp];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v11;
    if (!v11 || [v11 lt:*(void *)(a1[4] + 32)])
    {
      id v13 = *(id *)(a1[4] + 32LL);

      id v12 = v13;
    }

    [v7 exitTimestamp];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = v14;
    id v28 = v7;
    id v29 = v5;
    if (!v14 || [v14 gt:*(void *)(a1[4] + 40)])
    {
      id v16 = *(id *)(a1[4] + 40LL);

      uint64_t v15 = v16;
    }

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v27 = v10;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t i = 0LL; i != v19; ++i)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          char v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          [v22 endTimestamp];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          char v24 = [v12 gt:v23];

          if ((v24 & 1) == 0)
          {
            [v22 endTimestamp];
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            char v26 = [v15 lt:v25];

            if ((v26 & 1) != 0) {
              goto LABEL_20;
            }
            *(void *)(*(void *)(a1[5] + 8) + 24) += [v22 size];
            ++*(void *)(*(void *)(a1[6] + 8LL) + 24LL);
          }
        }

        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v19);
    }

void __73__SASamplePrinter_addStackForDispatchQueue_andThread_task_toRootObjects___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    id v7 = *(void **)(a1 + 40);
    [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v7 addObject:v8];
  }

- (void)addStackForSwiftTask:(void *)a3 andThread:(void *)a4 task:(void *)a5 toRootObjects:
{
  unint64_t v9 = a2;
  unint64_t v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a1)
  {
LABEL_7:

    return;
  }

  if (v9 | v10)
  {
    if (v10)
    {
      id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v14 = a1[4];
      uint64_t v15 = a1[5];
      uint64_t v16 = a1[6];
      uint64_t v17 = a1[7];
      v28[0] = MEMORY[0x1895F87A8];
      v28[1] = 3221225472LL;
      v28[2] = __69__SASamplePrinter_addStackForSwiftTask_andThread_task_toRootObjects___block_invoke;
      v28[3] = &unk_189F63310;
      id v29 = (id)v9;
      id v30 = v13;
      id v18 = v13;
      [(id)v10 enumerateThreadStatesBetweenStartTime:v14 startSampleIndex:v16 endTime:v15 endSampleIndex:v17 reverseOrder:0 block:v28];
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]( (uint64_t)a1,  0LL,  0LL,  (void *)v10,  v18,  v11,  v12,  0,  0,  0,  0,  0,  0LL,  0,  0);
    }

    else
    {
      [(id)v9 states];
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]( (uint64_t)a1,  0LL,  v18,  0LL,  0LL,  v11,  v12,  0,  0,  0,  0,  0,  0LL,  0,  0);
    }

    goto LABEL_7;
  }

  int v19 = *__error();
  _sa_logt();
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_error_impl(&dword_186C92000, v20, OS_LOG_TYPE_ERROR, "Neither thread nor swiftTask provided", buf, 2u);
  }

  *__error() = v19;
  _SASetCrashLogMessage(13454, "Neither thread nor swiftTask provided", v21, v22, v23, v24, v25, v26, v27);
  _os_crash();
  __break(1u);
}

void __69__SASamplePrinter_addStackForSwiftTask_andThread_task_toRootObjects___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    id v7 = *(void **)(a1 + 40);
    [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v7 addObject:v8];
  }

void __49__SASamplePrinter_addStackForTask_toRootObjects___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (-[SASamplePrinter shouldPrintTask:thread:dispatchQueue:]( *(void *)(a1 + 32),  *(void **)(a1 + 40),  v5,  0LL))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]( v4,  0LL,  0LL,  v5,  0LL,  *(void **)(a1 + 40),  *(void **)(a1 + 48),  1,  1,  1,  1,  1,  0LL,  0,  1u);
    }
  }
}

void __55__SASamplePrinter_addStackForExecutable_toRootObjects___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 mainBinary];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    [*(id *)(a1 + 40) addObject:v6];
    [v6 threads];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __55__SASamplePrinter_addStackForExecutable_toRootObjects___block_invoke_2;
    v7[3] = &unk_189F644D8;
    v7[4] = *(void *)(a1 + 48);
    id v8 = v6;
    id v9 = *(id *)(a1 + 56);
    [v5 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

void __55__SASamplePrinter_addStackForExecutable_toRootObjects___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  if (-[SASamplePrinter shouldPrintTask:thread:dispatchQueue:]( *(void *)(a1 + 32),  *(void **)(a1 + 40),  v5,  0LL))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]( v4,  0LL,  0LL,  v5,  0LL,  *(void **)(a1 + 40),  *(void **)(a1 + 48),  1,  1,  1,  1,  1,  0LL,  0,  1u);
    }
  }
}

- (id)callTreesForThreadsInTask:(id)a3
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ((-[SASamplePrinter checkForBadOptions]((uint64_t)self) & 1) == 0)
  {
    if (-[SASamplePrinter hasTimeIndexes]((uint64_t)self)) {
      uint64_t v6 = [v4 sampleCountInSampleIndexRangeStart:self->_reportStartSampleIndex end:self->_reportEndSampleIndex];
    }
    else {
      uint64_t v6 = [v4 sampleCountInTimestampRangeStart:self->_reportStartTime end:self->_reportEndTime];
    }
    uint64_t v34 = v4;
    -[SASamplePrinter stacksForTask:taskSampleCount:]((id *)&self->super.isa, v4, v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (!v10)
    {
LABEL_36:

      id v4 = v34;
      id v5 = -[SATaskThreadCallTrees initWithTask:threadCallTrees:]( objc_alloc(&OBJC_CLASS___SATaskThreadCallTrees),  v34,  v8);

      goto LABEL_37;
    }

    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
LABEL_8:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v36 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(id **)(*((void *)&v35 + 1) + 8 * v13);
      if (v14)
      {
        if ((unint64_t)[v14[7] count] > 1)
        {
          uint64_t v15 = 0LL;
          goto LABEL_16;
        }

        [v34 threads];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        id Property = objc_getProperty(v14, v17, 56LL, 1);
      }

      else
      {
        [v34 threads];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        id Property = 0LL;
      }

      [Property firstObject];
      int v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 objectForKeyedSubscript:v19];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        id v22 = 0LL;
        goto LABEL_19;
      }

- (id)callTreeForTask:(id)a3
{
  id v4 = a3;
  if ((-[SASamplePrinter checkForBadOptions]((uint64_t)self) & 1) != 0)
  {
    id v5 = 0LL;
  }

  else
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
    id v7 = v4;
    id v8 = v6;
    if (self)
    {
      [v7 threads];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __49__SASamplePrinter_addStackForTask_toRootObjects___block_invoke;
      v11[3] = &unk_189F644D8;
      v11[4] = self;
      id v12 = v7;
      id v13 = v8;
      [v9 enumerateKeysAndObjectsUsingBlock:v11];
    }

    id v5 = -[SATaskCallTree initWithTask:rootObjects:](objc_alloc(&OBJC_CLASS___SATaskCallTree), v7, (uint64_t)v8);
  }

  return v5;
}

- (id)callTreeForDispatchQueue:(id)a3 andThread:(id)a4 inTask:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((-[SASamplePrinter checkForBadOptions]((uint64_t)self) & 1) != 0)
  {
    uint64_t v11 = 0LL;
LABEL_9:

    return v11;
  }

  id v12 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
  unint64_t v13 = (unint64_t)v8;
  unint64_t v14 = (unint64_t)v9;
  id v15 = v10;
  id v16 = v12;
  if (!self)
  {
LABEL_8:

    uint64_t v11 = (void *)-[SAThreadCallTree initWithThread:dispatchQueue:swiftTask:rootObjects:]( (id *)objc_alloc(&OBJC_CLASS___SAThreadCallTree),  (void *)v14,  (void *)v13,  0LL,  v16);
    goto LABEL_9;
  }

  if (v13 | v14)
  {
    if (v14)
    {
      id v17 = objc_alloc_init(MEMORY[0x189603FA8]);
      reportEndTime = self->_reportEndTime;
      reportStartTime = self->_reportStartTime;
      id v18 = v15;
      id v36 = v8;
      unint64_t reportStartSampleIndex = self->_reportStartSampleIndex;
      unint64_t reportEndSampleIndex = self->_reportEndSampleIndex;
      *(void *)__int128 buf = MEMORY[0x1895F87A8];
      uint64_t v38 = 3221225472LL;
      uint64_t v39 = __73__SASamplePrinter_addStackForDispatchQueue_andThread_task_toRootObjects___block_invoke;
      uint64_t v40 = &unk_189F63310;
      id v41 = (id)v13;
      id v42 = v17;
      id v21 = v17;
      unint64_t v22 = reportStartSampleIndex;
      id v15 = v18;
      unint64_t v23 = reportEndSampleIndex;
      id v8 = v36;
      [(id)v14 enumerateThreadStatesBetweenStartTime:reportStartTime startSampleIndex:v22 endTime:reportEndTime endSampleIndex:v23 reverseOrder:0 block:buf];
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]( (uint64_t)self,  0LL,  0LL,  (void *)v14,  v21,  v18,  v16,  0,  0,  0,  0,  0,  0LL,  0,  0);
    }

    else
    {
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]( (uint64_t)self,  (void *)v13,  0LL,  0LL,  0LL,  v15,  v16,  0,  0,  0,  0,  0,  0LL,  0,  0);
    }

    goto LABEL_8;
  }

  int v25 = *__error();
  _sa_logt();
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_error_impl(&dword_186C92000, v26, OS_LOG_TYPE_ERROR, "Neither thread nor dispatchQueue provided", buf, 2u);
  }

  *__error() = v25;
  _SASetCrashLogMessage(13438, "Neither thread nor dispatchQueue provided", v27, v28, v29, v30, v31, v32, v33);
  id result = (id)_os_crash();
  __break(1u);
  return result;
}

- (id)callTreeForSwiftTask:(id)a3 thread:(id)a4 inTask:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((-[SASamplePrinter checkForBadOptions]((uint64_t)self) & 1) != 0)
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
    -[SASamplePrinter addStackForSwiftTask:andThread:task:toRootObjects:](self, v8, v9, v10, v12);
    uint64_t v11 = (void *)-[SAThreadCallTree initWithThread:dispatchQueue:swiftTask:rootObjects:]( (id *)objc_alloc(&OBJC_CLASS___SAThreadCallTree),  v9,  0LL,  v8,  v12);
  }

  return v11;
}

- (id)callTreeForDispatchQueue:(id)a3 swiftTask:(id)a4 thread:(id)a5 inTask:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ((-[SASamplePrinter checkForBadOptions]((uint64_t)self) & 1) != 0)
  {
    unint64_t v14 = 0LL;
  }

  else
  {
    id v15 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
    -[SASamplePrinter addStackForSwiftTask:andThread:task:toRootObjects:](self, v11, v12, v13, v15);
    unint64_t v14 = (void *)-[SAThreadCallTree initWithThread:dispatchQueue:swiftTask:rootObjects:]( (id *)objc_alloc(&OBJC_CLASS___SAThreadCallTree),  v12,  v10,  v11,  v15);
  }

  return v14;
}

- (id)callTreeForThread:(id)a3 inTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((-[SASamplePrinter checkForBadOptions]((uint64_t)self) & 1) != 0)
  {
    id v8 = 0LL;
  }

  else
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
    if (self) {
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]( (uint64_t)self,  0LL,  0LL,  v6,  0LL,  v7,  v9,  0,  0,  0,  0,  0,  0LL,  0,  0);
    }
    id v8 = (void *)-[SAThreadCallTree initWithThread:dispatchQueue:swiftTask:rootObjects:]( (id *)objc_alloc(&OBJC_CLASS___SAThreadCallTree),  v6,  0LL,  0LL,  v9);
  }

  return v8;
}

- (id)callTreeForExecutable:(id)a3
{
  id v4 = a3;
  if ((-[SASamplePrinter checkForBadOptions]((uint64_t)self) & 1) != 0)
  {
    id v5 = 0LL;
  }

  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
    id v7 = v4;
    id v8 = v6;
    if (self)
    {
      id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
      sampleStore = self->_sampleStore;
      uint64_t v13 = MEMORY[0x1895F87A8];
      uint64_t v14 = 3221225472LL;
      id v15 = __55__SASamplePrinter_addStackForExecutable_toRootObjects___block_invoke;
      id v16 = &unk_189F64460;
      id v17 = v7;
      id v18 = v9;
      int v19 = self;
      id v20 = v8;
      id v11 = v9;
      -[SASampleStore enumerateTasks:](sampleStore, "enumerateTasks:", &v13);
      self = (SASamplePrinter *)objc_msgSend(v11, "copy", v13, v14, v15, v16);
    }

    id v5 = -[SAExecutableCallTree initWithTasks:rootObjects:]( objc_alloc(&OBJC_CLASS___SAExecutableCallTree),  self,  (uint64_t)v8);
  }

  return v5;
}

- (SASampleStore)sampleStore
{
  return (SASampleStore *)objc_getProperty(self, a2, 160LL, 1);
}

- (NSString)headerNote
{
  return (NSString *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setHeaderNote:(id)a3
{
}

- (NSUUID)incidentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setIncidentUUID:(id)a3
{
}

- (BOOL)shareWithAppDevs
{
  return self->_shareWithAppDevs;
}

- (void)setShareWithAppDevs:(BOOL)a3
{
  self->_shareWithAppDevs = a3;
}

- (void).cxx_destruct
{
}

@end