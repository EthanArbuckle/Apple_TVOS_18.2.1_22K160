@interface SPProcessEvent
- (BOOL)forceOneBasedTimeIndexes;
- (BOOL)headerOnly;
- (BOOL)includeBinaryFormatInReport;
- (BOOL)includeTextualFormatInReport;
- (BOOL)isUrgent;
- (BOOL)isWSBased;
- (BOOL)omitSensitiveStrings;
- (BOOL)omitThirdPartyProcessStacks;
- (BOOL)sanitizePaths;
- (BOOL)shouldSymbolicate;
- (BOOL)shouldUseBulkSymbolication;
- (BOOL)targetProcessIsThirdParty;
- (BOOL)useDsymForUUIDForEverything;
- (NSArray)dsymPaths;
- (NSArray)findDsymsForIDs;
- (NSString)customOutput;
- (NSString)durationNote;
- (NSString)event;
- (NSString)eventNote;
- (NSString)hardwareModel;
- (NSString)reason;
- (NSString)signature;
- (NSString)stepsNote;
- (NSString)targetProcessAbsolutePath;
- (NSString)targetProcessAdamId;
- (NSString)targetProcessBundleId;
- (NSString)targetProcessBundleName;
- (NSString)targetProcessName;
- (NSString)targetProcessVersion;
- (NSUUID)incidentUUID;
- (NSUUID)targetProcessMainBinaryUUID;
- (SASamplePrintOptions)printOptions;
- (SATimeRange)dataTimeRange;
- (SATimeRange)eventTimeRange;
- (SATimestamp)reportTimeEnd;
- (SATimestamp)reportTimeStart;
- (SPProcessEvent)init;
- (double)dataDuration;
- (double)eventDuration;
- (double)extraDuration;
- (double)overlapDuration;
- (double)targetProcessTimeOfLastResponse;
- (id)_samplePrinterForSampleStore:(id)a3;
- (int)numSamples;
- (int)numSamplesAvoidedDueToAudio;
- (int)numSamplesSuspended;
- (int)targetProcessId;
- (unint64_t)targetHIDEventEndMachAbs;
- (unint64_t)targetHIDEventMachAbs;
- (unint64_t)targetThreadId;
- (void)_performSamplePrinterWork:(id)a3;
- (void)_saveReportToStream:(__sFILE *)a3;
- (void)_saveReportToStream:(__sFILE *)a3 withSampleStore:(id)a4;
- (void)_setupSampleStore:(id)a3;
- (void)dealloc;
- (void)dropTransaction;
- (void)filterToStartTime:(id)a3 endTime:(id)a4;
- (void)filterToStartTimeIndex:(unint64_t)a3 endTimeIndex:(unint64_t)a4;
- (void)performSamplePrinterWork:(id)a3;
- (void)saveReportToStream:(__sFILE *)a3;
- (void)setCustomOutput:(id)a3;
- (void)setDataTimeRange:(id)a3;
- (void)setDsymPaths:(id)a3;
- (void)setDurationNote:(id)a3;
- (void)setEvent:(id)a3;
- (void)setEventNote:(id)a3;
- (void)setEventTimeRange:(id)a3;
- (void)setExtraDuration:(double)a3;
- (void)setFindDsymsForIDs:(id)a3;
- (void)setForceOneBasedTimeIndexes:(BOOL)a3;
- (void)setHeaderOnly:(BOOL)a3;
- (void)setIncidentUUID:(id)a3;
- (void)setIncludeBinaryFormatInReport:(BOOL)a3;
- (void)setIncludeTextualFormatInReport:(BOOL)a3;
- (void)setIsUrgent:(BOOL)a3;
- (void)setOmitSensitiveStrings:(BOOL)a3;
- (void)setOmitThirdPartyProcessStacks:(BOOL)a3;
- (void)setPrintOptions:(id)a3;
- (void)setReason:(id)a3;
- (void)setReportTimeEnd:(id)a3;
- (void)setReportTimeStart:(id)a3;
- (void)setSanitizePaths:(BOOL)a3;
- (void)setShouldSymbolicate:(BOOL)a3;
- (void)setShouldUseBulkSymbolication:(BOOL)a3;
- (void)setSignature:(id)a3;
- (void)setStepsNote:(id)a3;
- (void)setTargetHIDEventEndMachAbs:(unint64_t)a3;
- (void)setTargetHIDEventMachAbs:(unint64_t)a3;
- (void)setTargetProcessAbsolutePath:(id)a3;
- (void)setTargetThreadId:(unint64_t)a3;
- (void)setUseDsymForUUIDForEverything:(BOOL)a3;
- (void)takeTransaction;
@end

@implementation SPProcessEvent

- (void)takeTransaction
{
  p_transaction = (unint64_t *)&self->_transaction;
  if (!self->_transaction)
  {
    v3 = (void *)sub_100029784("Process Event [%d]", self->_targetProcessId);
    while (!__ldxr(p_transaction))
    {
    }

    __clrex();
  }

- (void)dropTransaction
{
  transaction = self->_transaction;
  p_transaction = (unint64_t *)&self->_transaction;
  v3 = transaction;
  if (transaction)
  {
    while (1)
    {
      unint64_t v5 = __ldxr(p_transaction);
      if ((OS_os_transaction *)v5 != v3) {
        break;
      }
      if (!__stxr(0LL, p_transaction))
      {

        return;
      }
    }

    __clrex();
  }

- (SPProcessEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SPProcessEvent;
  v2 = -[SPProcessEvent init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_useDsymForUUIDForEverything = 0;
    v2->_includeTextualFormatInReport = 1;
    v2->_headerOnly = 0;
    v2->_printOptions = objc_alloc_init(&OBJC_CLASS___SASamplePrintOptions);
    unsigned int v4 = byte_1000DFCFC;
    v3->_shouldSymbolicate = (byte_1000DFCFC & 8) != 0;
    v3->_shouldUseBulkSymbolication = ((v4 >> 4) & 1) == 0;
  }

  return v3;
}

- (void)dealloc
{
  p_targetProcessId = &self->_targetProcessId;
  if ((self->_targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000DFD38)
    {
      int v4 = *__error();
      unint64_t v5 = (os_log_s *)sub_10005C68C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_10007A7C4(p_targetProcessId);
      }
      *__error() = v4;
    }

    if (byte_1000DFD39) {
      BOOL v6 = dword_1000DF4B8 <= 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (!v6) {
      goto LABEL_50;
    }
    int v7 = *__error();
    v8 = sub_10005C628(self->_targetProcessId);
    v9 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: dealloc with %p transaction",  v8,  self->_targetProcessId,  self->_transaction);
    if (v9)
    {
      v10 = v9;
      CStringPtr = CFStringGetCStringPtr(v9, 0x8000100u);
      if (CStringPtr)
      {
        v12 = (char *)CStringPtr;
        v13 = 0LL;
      }

      else
      {
        v12 = (char *)calloc(0x400uLL, 1uLL);
        CFStringGetCString(v10, v12, 1024LL, 0x8000100u);
        v13 = v12;
      }

      if (qword_1000DFD40) {
        v24 = (FILE *)qword_1000DFD40;
      }
      else {
        v24 = __stderrp;
      }
      fprintf(v24, "%s\n", v12);
      if (v13) {
        free(v13);
      }
      v25 = v10;
LABEL_48:
      CFRelease(v25);
LABEL_49:
      *__error() = v7;
      goto LABEL_50;
    }

    v23 = (os_log_s *)sub_10005C68C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      sub_10007A744(p_targetProcessId);
    }
    goto LABEL_37;
  }

  if (byte_1000DFD38)
  {
    int v14 = *__error();
    v15 = (os_log_s *)sub_10005C68C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_10007A8AC((uint64_t)self, v15, v16);
    }
    *__error() = v14;
  }

  if (byte_1000DFD39) {
    BOOL v17 = dword_1000DF4B8 <= 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17)
  {
    int v7 = *__error();
    v18 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"dealloc with %p transaction", self->_transaction);
    if (v18)
    {
      v19 = v18;
      v20 = CFStringGetCStringPtr(v18, 0x8000100u);
      if (v20)
      {
        v21 = (char *)v20;
        v22 = 0LL;
      }

      else
      {
        v21 = (char *)calloc(0x400uLL, 1uLL);
        CFStringGetCString(v19, v21, 1024LL, 0x8000100u);
        v22 = v21;
      }

      if (qword_1000DFD40) {
        v34 = (FILE *)qword_1000DFD40;
      }
      else {
        v34 = __stderrp;
      }
      fprintf(v34, "%s\n", v21);
      if (v22) {
        free(v22);
      }
      v25 = v19;
      goto LABEL_48;
    }

    v26 = (os_log_s *)sub_10005C68C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      sub_10007A844((uint64_t)&self->_transaction, v26, v27, v28, v29, v30, v31, v32);
    }
LABEL_37:
    if (qword_1000DFD40) {
      v33 = (FILE *)qword_1000DFD40;
    }
    else {
      v33 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v33);
    goto LABEL_49;
  }

- (int)numSamples
{
  if (self->_isSampling) {
    int numSamplesAtEnd = -[SPStackshotProvider numSamples](self->_sampleProvider, "numSamples");
  }
  else {
    int numSamplesAtEnd = self->_numSamplesAtEnd;
  }
  return numSamplesAtEnd - self->_numSamplesAtStart;
}

- (int)numSamplesAvoidedDueToAudio
{
  if (self->_isSampling) {
    int numSamplesAvoidedDueToAudioAtEnd = -[SPStackshotProvider numSamplesAvoidedDueToAudio]( self->_sampleProvider,  "numSamplesAvoidedDueToAudio");
  }
  else {
    int numSamplesAvoidedDueToAudioAtEnd = self->_numSamplesAvoidedDueToAudioAtEnd;
  }
  return numSamplesAvoidedDueToAudioAtEnd - self->_numSamplesAvoidedDueToAudioAtStart;
}

- (double)dataDuration
{
  dataTimeRange = self->_dataTimeRange;
  if (dataTimeRange) {
    return sub_100029E40( -[SATimeRange startTime](dataTimeRange, "startTime"),  -[SATimeRange endTime](self->_dataTimeRange, "endTime"));
  }
  else {
    return 0.0;
  }
}

- (double)eventDuration
{
  eventTimeRange = self->_eventTimeRange;
  if (eventTimeRange) {
    return sub_100029E40( -[SATimeRange startTime](eventTimeRange, "startTime"),  -[SATimeRange endTime](self->_eventTimeRange, "endTime"));
  }
  else {
    return 0.0;
  }
}

- (double)overlapDuration
{
  p_eventTimeRange = &self->_eventTimeRange;
  dataTimeRange = self->_dataTimeRange;
  eventTimeRange = self->_eventTimeRange;
  if (dataTimeRange)
  {
    p_dataTimeRange = &self->_dataTimeRange;
    id v7 = -[SATimeRange startTime](dataTimeRange, "startTime");
    if (eventTimeRange)
    {
      if (objc_msgSend(v7, "compare:", -[SATimeRange startTime](*p_eventTimeRange, "startTime")) == (id)-1) {
        v8 = (id *)p_eventTimeRange;
      }
      else {
        v8 = (id *)p_dataTimeRange;
      }
      id v7 = [*v8 startTime];
      if (objc_msgSend( -[SATimeRange endTime](*p_dataTimeRange, "endTime"),  "compare:",  -[SATimeRange endTime](*p_eventTimeRange, "endTime")) != (id)1) {
        p_eventTimeRange = p_dataTimeRange;
      }
    }

    else
    {
      p_eventTimeRange = p_dataTimeRange;
    }

    return sub_100029E40(v7, -[SATimeRange endTime](*p_eventTimeRange, "endTime"));
  }

  if (eventTimeRange)
  {
    id v7 = -[SATimeRange startTime](self->_eventTimeRange, "startTime");
    return sub_100029E40(v7, -[SATimeRange endTime](*p_eventTimeRange, "endTime"));
  }

  return 0.0;
}

- (void)filterToStartTimeIndex:(unint64_t)a3 endTimeIndex:(unint64_t)a4
{
  self->_startTimeIndex = a3;
  self->_endTimeIndex = a4;
}

- (void)filterToStartTime:(id)a3 endTime:(id)a4
{
  self->_reportTimeStart = (SATimestamp *)a3;
  self->_reportTimeEnd = (SATimestamp *)a4;
}

- (void)_setupSampleStore:(id)a3
{
  p_int targetProcessId = (unsigned int *)&self->_targetProcessId;
  int targetProcessId = self->_targetProcessId;
  if (!a3)
  {
    if (targetProcessId < 0)
    {
      if (byte_1000DFD38)
      {
        int v61 = *__error();
        v62 = (os_log_s *)sub_10005C68C();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
          sub_10007AA80(v62, v63, v64, v65, v66, v67, v68, v69);
        }
        *__error() = v61;
      }

      if (byte_1000DFD39) {
        BOOL v70 = dword_1000DF4B8 <= 3;
      }
      else {
        BOOL v70 = 0;
      }
      if (v70)
      {
        int v71 = *__error();
        v72 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%s: nil sampleStore", "sampleStore");
        if (v72)
        {
          v86 = v72;
          CStringPtr = CFStringGetCStringPtr(v72, 0x8000100u);
          if (CStringPtr)
          {
            v88 = (char *)CStringPtr;
            v89 = 0LL;
          }

          else
          {
            v88 = (char *)calloc(0x400uLL, 1uLL);
            CFStringGetCString(v86, v88, 1024LL, 0x8000100u);
            v89 = v88;
          }

          if (qword_1000DFD40) {
            v96 = (FILE *)qword_1000DFD40;
          }
          else {
            v96 = __stderrp;
          }
          fprintf(v96, "%s\n", v88);
          if (v89) {
            free(v89);
          }
          CFRelease(v86);
        }

        else
        {
          v73 = (os_log_s *)sub_10005C68C();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
            sub_10007AA10(v73, v74, v75, v76, v77, v78, v79, v80);
          }
          if (qword_1000DFD40) {
            v81 = (FILE *)qword_1000DFD40;
          }
          else {
            v81 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v81);
        }

        *__error() = v71;
      }

      sub_10005C564( "-[SPProcessEvent _setupSampleStore:]",  "SPProcessEvent.m",  267,  "%s: nil sampleStore",  v3,  v4,  v5,  v6,  (char)"sampleStore");
    }

    else
    {
      if (byte_1000DFD38)
      {
        int v53 = *__error();
        v54 = (os_log_s *)sub_10005C68C();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          sub_10007A994();
        }
        *__error() = v53;
      }

      if (byte_1000DFD39) {
        BOOL v55 = dword_1000DF4B8 <= 3;
      }
      else {
        BOOL v55 = 0;
      }
      if (v55)
      {
        int v56 = *__error();
        v57 = sub_10005C628(*p_targetProcessId);
        v58 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: %s: nil sampleStore",  v57,  *p_targetProcessId,  "sampleStore");
        if (v58)
        {
          v82 = v58;
          v83 = CFStringGetCStringPtr(v58, 0x8000100u);
          if (v83)
          {
            v84 = (char *)v83;
            v85 = 0LL;
          }

          else
          {
            v84 = (char *)calloc(0x400uLL, 1uLL);
            CFStringGetCString(v82, v84, 1024LL, 0x8000100u);
            v85 = v84;
          }

          if (qword_1000DFD40) {
            v90 = (FILE *)qword_1000DFD40;
          }
          else {
            v90 = __stderrp;
          }
          fprintf(v90, "%s\n", v84);
          if (v85) {
            free(v85);
          }
          CFRelease(v82);
        }

        else
        {
          v59 = (os_log_s *)sub_10005C68C();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
            sub_10007A918();
          }
          if (qword_1000DFD40) {
            v60 = (FILE *)qword_1000DFD40;
          }
          else {
            v60 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v60);
        }

        *__error() = v56;
      }

      char v91 = sub_10005C628(*p_targetProcessId);
      sub_10005C564( "-[SPProcessEvent _setupSampleStore:]",  "SPProcessEvent.m",  267,  "%s [%d]: %s: nil sampleStore",  v92,  v93,  v94,  v95,  v91);
    }

    abort();
  }

  if ((targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000DFD38)
    {
      int v11 = *__error();
      v12 = (os_log_s *)sub_10005C68C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = sub_10005C628(*p_targetProcessId);
        int v14 = *p_targetProcessId;
        *(_DWORD *)buf = 136446466;
        v104 = v13;
        __int16 v105 = 1024;
        int v106 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%{public}s [%d]: Generating report",  buf,  0x12u);
      }

      *__error() = v11;
    }

    if (byte_1000DFD39) {
      BOOL v15 = dword_1000DF4B8 <= 1;
    }
    else {
      BOOL v15 = 0;
    }
    if (!v15) {
      goto LABEL_48;
    }
    int v16 = *__error();
    BOOL v17 = sub_10005C628(*p_targetProcessId);
    v18 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: Generating report",  v17,  *p_targetProcessId);
    if (v18)
    {
      v19 = v18;
      v20 = CFStringGetCStringPtr(v18, 0x8000100u);
      if (v20)
      {
        v21 = (char *)v20;
        v22 = 0LL;
      }

      else
      {
        v21 = (char *)calloc(0x400uLL, 1uLL);
        CFStringGetCString(v19, v21, 1024LL, 0x8000100u);
        v22 = v21;
      }

      uint64_t v31 = qword_1000DFD40;
      uint64_t v32 = __stderrp;
LABEL_41:
      if (v31) {
        v35 = (FILE *)v31;
      }
      else {
        v35 = v32;
      }
      fprintf(v35, "%s\n", v21);
      if (v22) {
        free(v22);
      }
      CFRelease(v19);
      goto LABEL_47;
    }

    uint64_t v28 = (os_log_s *)sub_10005C68C();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      sub_10007AAF0();
    }
    uint64_t v29 = qword_1000DFD40;
    uint64_t v30 = __stderrp;
    goto LABEL_35;
  }

  if (byte_1000DFD38)
  {
    int v23 = *__error();
    v24 = (os_log_s *)sub_10005C68C();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Generating report", buf, 2u);
    }

    *__error() = v23;
  }

  if (byte_1000DFD39) {
    BOOL v25 = dword_1000DF4B8 <= 1;
  }
  else {
    BOOL v25 = 0;
  }
  if (v25)
  {
    int v16 = *__error();
    v26 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Generating report");
    if (v26)
    {
      v19 = v26;
      uint64_t v27 = CFStringGetCStringPtr(v26, 0x8000100u);
      if (v27)
      {
        v21 = (char *)v27;
        v22 = 0LL;
      }

      else
      {
        v21 = (char *)calloc(0x400uLL, 1uLL);
        CFStringGetCString(v19, v21, 1024LL, 0x8000100u);
        v22 = v21;
      }

      uint64_t v31 = qword_1000DFD40;
      uint64_t v32 = __stderrp;
      goto LABEL_41;
    }

    v33 = (os_log_s *)sub_10005C68C();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      sub_10007AB5C();
    }
    uint64_t v29 = qword_1000DFD40;
    uint64_t v30 = __stderrp;
LABEL_35:
    if (v29) {
      v34 = (FILE *)v29;
    }
    else {
      v34 = v30;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v34);
LABEL_47:
    *__error() = v16;
  }

- (id)_samplePrinterForSampleStore:(id)a3
{
  uint64_t v5 = -[SASamplePrinter initWithSampleStore:](objc_alloc(&OBJC_CLASS___SASamplePrinter), "initWithSampleStore:", a3);
  if (!v5)
  {
    int targetProcessId = self->_targetProcessId;
    p_int targetProcessId = &self->_targetProcessId;
    if (targetProcessId < 0)
    {
      if (byte_1000DFD38)
      {
        int v21 = *__error();
        v22 = (os_log_s *)sub_10005C68C();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10007AC8C();
        }
        *__error() = v21;
      }

      if (byte_1000DFD39) {
        BOOL v23 = dword_1000DF4B8 <= 3;
      }
      else {
        BOOL v23 = 0;
      }
      if (!v23) {
        return 0LL;
      }
      int v13 = *__error();
      v24 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Unable to create sample printer");
      if (v24)
      {
        BOOL v25 = v24;
        CStringPtr = CFStringGetCStringPtr(v24, 0x8000100u);
        if (CStringPtr)
        {
          uint64_t v27 = (char *)CStringPtr;
          uint64_t v28 = 0LL;
        }

        else
        {
          uint64_t v27 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v25, v27, 1024LL, 0x8000100u);
          uint64_t v28 = v27;
        }

        if (qword_1000DFD40) {
          v34 = (FILE *)qword_1000DFD40;
        }
        else {
          v34 = __stderrp;
        }
        fprintf(v34, "%s\n", v27);
        if (v28) {
          free(v28);
        }
        uint64_t v31 = v25;
        goto LABEL_63;
      }

      uint64_t v32 = (os_log_s *)sub_10005C68C();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        sub_10007AC60();
      }
    }

    else
    {
      if (byte_1000DFD38)
      {
        int v10 = *__error();
        int v11 = (os_log_s *)sub_10005C68C();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_10007ABF4();
        }
        *__error() = v10;
      }

      if (byte_1000DFD39) {
        BOOL v12 = dword_1000DF4B8 <= 3;
      }
      else {
        BOOL v12 = 0;
      }
      if (!v12) {
        return 0LL;
      }
      int v13 = *__error();
      int v14 = sub_10005C628(*p_targetProcessId);
      BOOL v15 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: Unable to create sample printer",  v14,  *p_targetProcessId);
      if (v15)
      {
        int v16 = v15;
        BOOL v17 = CFStringGetCStringPtr(v15, 0x8000100u);
        if (v17)
        {
          v18 = (char *)v17;
          v19 = 0LL;
        }

        else
        {
          v18 = (char *)calloc(0x400uLL, 1uLL);
          CFStringGetCString(v16, v18, 1024LL, 0x8000100u);
          v19 = v18;
        }

        if (qword_1000DFD40) {
          uint64_t v30 = (FILE *)qword_1000DFD40;
        }
        else {
          uint64_t v30 = __stderrp;
        }
        fprintf(v30, "%s\n", v18);
        if (v19) {
          free(v19);
        }
        uint64_t v31 = v16;
LABEL_63:
        CFRelease(v31);
LABEL_64:
        *__error() = v13;
        return 0LL;
      }

      uint64_t v29 = (os_log_s *)sub_10005C68C();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        sub_10007AB88();
      }
    }

    if (qword_1000DFD40) {
      v33 = (FILE *)qword_1000DFD40;
    }
    else {
      v33 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v33);
    goto LABEL_64;
  }

  uint64_t v6 = v5;
  -[SASamplePrinter setOptions:](v5, "setOptions:", self->_printOptions);
  if (self->_includeBinaryFormatInReport) {
    goto LABEL_3;
  }
  if (self->_headerOnly) {
    goto LABEL_19;
  }
  if (!-[SASamplePrintOptions printHeavyStacks](self->_printOptions, "printHeavyStacks"))
  {
LABEL_3:
    int v7 = 1;
  }

  else
  {
    if (self->_headerOnly) {
      goto LABEL_19;
    }
    int v7 = 0;
  }

  -[SASamplePrinter setHeaderNote:]( v6,  "setHeaderNote:",  sub_10006E098((int)-[SASamplePrintOptions printHeavyStacks](self->_printOptions, "printHeavyStacks"), v7));
LABEL_19:
  [v6 options].printTargetThreadOnly = self->_headerOnly;
  -[SASamplePrinter setShareWithAppDevs:]( v6,  "setShareWithAppDevs:",  AppAnalyticsEnabled(objc_msgSend(-[SASamplePrinter options](v6, "options"), "setDisplayFooter:", !self->_headerOnly)));
  if (*(_OWORD *)&self->_startTimeIndex == 0LL)
  {
    if (*(_OWORD *)&self->_reportTimeStart != 0LL) {
      -[SASamplePrinter filterToTimestampRangeStart:end:](v6, "filterToTimestampRangeStart:end:");
    }
  }

  else
  {
    -[SASamplePrinter filterToDisplayTimeIndexStart:end:](v6, "filterToDisplayTimeIndexStart:end:");
  }

  [v6 options].forceOneBasedTimeIndexes = self->_forceOneBasedTimeIndexes;
  if (self->_incidentUUID) {
    -[SASamplePrinter setIncidentUUID:](v6, "setIncidentUUID:");
  }
  return v6;
}

- (void)_saveReportToStream:(__sFILE *)a3 withSampleStore:(id)a4
{
  int v7 = objc_autoreleasePoolPush();
  -[SPProcessEvent _setupSampleStore:](self, "_setupSampleStore:", a4);
  if (self->_includeTextualFormatInReport) {
    [ -[SPProcessEvent _samplePrinterForSampleStore:](self, "_samplePrinterForSampleStore:", a4) printToStream:a3];
  }
  if (self->_includeBinaryFormatInReport)
  {
    if (self->_includeTextualFormatInReport)
    {
      v8 = "\n\n";
      size_t v9 = 2LL;
    }

    else
    {
      v8 = "Use spindump -i to generate textual report\n";
      size_t v9 = 43LL;
    }

    fwrite(v8, v9, 1uLL, a3);
    if (([a4 saveBinaryFormatToStream:a3] & 1) == 0)
    {
      p_int targetProcessId = &self->_targetProcessId;
      if (self->_targetProcessId < 0)
      {
        if (byte_1000DFD38)
        {
          int v20 = *__error();
          int v21 = (os_log_s *)sub_10005C68C();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_10007AE54();
          }
          *__error() = v20;
        }

        if (byte_1000DFD39 && dword_1000DF4B8 <= 3)
        {
          int v13 = *__error();
          v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Unable to save spindump binary format");
          if (v22)
          {
            BOOL v23 = v22;
            CStringPtr = CFStringGetCStringPtr(v22, 0x8000100u);
            if (CStringPtr)
            {
              BOOL v25 = (char *)CStringPtr;
              v26 = 0LL;
            }

            else
            {
              BOOL v25 = (char *)calloc(0x400uLL, 1uLL);
              CFStringGetCString(v23, v25, 1024LL, 0x8000100u);
              v26 = v25;
            }

            if (qword_1000DFD40) {
              uint64_t v32 = (FILE *)qword_1000DFD40;
            }
            else {
              uint64_t v32 = __stderrp;
            }
            fprintf(v32, "%s\n", v25);
            if (v26) {
              free(v26);
            }
            uint64_t v29 = v23;
            goto LABEL_49;
          }

          uint64_t v30 = (os_log_s *)sub_10005C68C();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
            sub_10007AE28();
          }
LABEL_38:
          if (qword_1000DFD40) {
            uint64_t v31 = (FILE *)qword_1000DFD40;
          }
          else {
            uint64_t v31 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v31);
          goto LABEL_50;
        }
      }

      else
      {
        if (byte_1000DFD38)
        {
          int v11 = *__error();
          BOOL v12 = (os_log_s *)sub_10005C68C();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_10007ADBC();
          }
          *__error() = v11;
        }

        if (byte_1000DFD39 && dword_1000DF4B8 <= 3)
        {
          int v13 = *__error();
          int v14 = sub_10005C628(*p_targetProcessId);
          BOOL v15 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%s [%d]: Unable to save spindump binary format",  v14,  *p_targetProcessId);
          if (v15)
          {
            int v16 = v15;
            BOOL v17 = CFStringGetCStringPtr(v15, 0x8000100u);
            if (v17)
            {
              v18 = (char *)v17;
              v19 = 0LL;
            }

            else
            {
              v18 = (char *)calloc(0x400uLL, 1uLL);
              CFStringGetCString(v16, v18, 1024LL, 0x8000100u);
              v19 = v18;
            }

            if (qword_1000DFD40) {
              uint64_t v28 = (FILE *)qword_1000DFD40;
            }
            else {
              uint64_t v28 = __stderrp;
            }
            fprintf(v28, "%s\n", v18);
            if (v19) {
              free(v19);
            }
            uint64_t v29 = v16;
LABEL_49:
            CFRelease(v29);
LABEL_50:
            *__error() = v13;
            goto LABEL_51;
          }

          uint64_t v27 = (os_log_s *)sub_10005C68C();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
            sub_10007AD50();
          }
          goto LABEL_38;
        }
      }
    }
  }

- (void)_saveReportToStream:(__sFILE *)a3
{
}

- (void)saveReportToStream:(__sFILE *)a3
{
}

- (void)performSamplePrinterWork:(id)a3
{
  uint64_t v5 = objc_autoreleasePoolPush();
  -[SPProcessEvent _performSamplePrinterWork:](self, "_performSamplePrinterWork:", a3);
  -[SPProcessEvent dropTransaction](self, "dropTransaction");
  objc_autoreleasePoolPop(v5);
}

- (void)_performSamplePrinterWork:(id)a3
{
}

- (BOOL)targetProcessIsThirdParty
{
  targetProcessBundleId = self->_targetProcessBundleId;
  if (targetProcessBundleId && -[NSString hasPrefix:](targetProcessBundleId, "hasPrefix:", @"com.apple.")) {
    return 0;
  }
  if (!self->_targetProcessAbsolutePath) {
    return 1;
  }
  uint64_t v5 = 0LL;
  do
  {
    unsigned __int8 v6 = -[NSString hasPrefix:]( self->_targetProcessAbsolutePath,  "hasPrefix:",  *(__CFString **)((char *)&off_1000D0B50 + v5));
    if ((v6 & 1) != 0) {
      break;
    }
    BOOL v7 = v5 == 40;
    v5 += 8LL;
  }

  while (!v7);
  return v6 ^ 1;
}

- (int)targetProcessId
{
  return self->_targetProcessId;
}

- (NSString)targetProcessName
{
  return self->_targetProcessName;
}

- (NSUUID)targetProcessMainBinaryUUID
{
  return self->_targetProcessMainBinaryUUID;
}

- (NSString)targetProcessBundleName
{
  return self->_targetProcessBundleName;
}

- (NSString)targetProcessBundleId
{
  return self->_targetProcessBundleId;
}

- (NSString)targetProcessVersion
{
  return self->_targetProcessVersion;
}

- (NSString)targetProcessAbsolutePath
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setTargetProcessAbsolutePath:(id)a3
{
}

- (NSString)targetProcessAdamId
{
  return self->_targetProcessAdamId;
}

- (unint64_t)targetThreadId
{
  return self->_targetThreadId;
}

- (void)setTargetThreadId:(unint64_t)a3
{
  self->_targetThreadId = a3;
}

- (unint64_t)targetHIDEventMachAbs
{
  return self->_targetHIDEventMachAbs;
}

- (void)setTargetHIDEventMachAbs:(unint64_t)a3
{
  self->_targetHIDEventMachAbs = a3;
}

- (unint64_t)targetHIDEventEndMachAbs
{
  return self->_targetHIDEventEndMachAbs;
}

- (void)setTargetHIDEventEndMachAbs:(unint64_t)a3
{
  self->_targetHIDEventEndMachAbs = a3;
}

- (double)targetProcessTimeOfLastResponse
{
  return self->_targetProcessTimeOfLastResponse;
}

- (NSString)hardwareModel
{
  return self->_hardwareModel;
}

- (BOOL)isWSBased
{
  return self->_isWSBased;
}

- (BOOL)isUrgent
{
  return self->_isUrgent;
}

- (void)setIsUrgent:(BOOL)a3
{
  self->_isUrgent = a3;
}

- (BOOL)useDsymForUUIDForEverything
{
  return self->_useDsymForUUIDForEverything;
}

- (void)setUseDsymForUUIDForEverything:(BOOL)a3
{
  self->_useDsymForUUIDForEverything = a3;
}

- (NSArray)dsymPaths
{
  return (NSArray *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setDsymPaths:(id)a3
{
}

- (NSArray)findDsymsForIDs
{
  return (NSArray *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setFindDsymsForIDs:(id)a3
{
}

- (BOOL)includeBinaryFormatInReport
{
  return self->_includeBinaryFormatInReport;
}

- (void)setIncludeBinaryFormatInReport:(BOOL)a3
{
  self->_includeBinaryFormatInReport = a3;
}

- (BOOL)shouldSymbolicate
{
  return self->_shouldSymbolicate;
}

- (void)setShouldSymbolicate:(BOOL)a3
{
  self->_shouldSymbolicate = a3;
}

- (BOOL)shouldUseBulkSymbolication
{
  return self->_shouldUseBulkSymbolication;
}

- (void)setShouldUseBulkSymbolication:(BOOL)a3
{
  self->_shouldUseBulkSymbolication = a3;
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setReason:(id)a3
{
}

- (int)numSamplesSuspended
{
  return self->_numSamplesSuspended;
}

- (BOOL)forceOneBasedTimeIndexes
{
  return self->_forceOneBasedTimeIndexes;
}

- (void)setForceOneBasedTimeIndexes:(BOOL)a3
{
  self->_forceOneBasedTimeIndexes = a3;
}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setEvent:(id)a3
{
}

- (NSString)eventNote
{
  return (NSString *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setEventNote:(id)a3
{
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setSignature:(id)a3
{
}

- (double)extraDuration
{
  return self->_extraDuration;
}

- (void)setExtraDuration:(double)a3
{
  self->_extraDuration = a3;
}

- (NSString)durationNote
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setDurationNote:(id)a3
{
}

- (NSString)stepsNote
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setStepsNote:(id)a3
{
}

- (BOOL)sanitizePaths
{
  return self->_sanitizePaths;
}

- (void)setSanitizePaths:(BOOL)a3
{
  self->_sanitizePaths = a3;
}

- (BOOL)omitThirdPartyProcessStacks
{
  return self->_omitThirdPartyProcessStacks;
}

- (void)setOmitThirdPartyProcessStacks:(BOOL)a3
{
  self->_omitThirdPartyProcessStacks = a3;
}

- (BOOL)omitSensitiveStrings
{
  return self->_omitSensitiveStrings;
}

- (void)setOmitSensitiveStrings:(BOOL)a3
{
  self->_omitSensitiveStrings = a3;
}

- (BOOL)includeTextualFormatInReport
{
  return self->_includeTextualFormatInReport;
}

- (void)setIncludeTextualFormatInReport:(BOOL)a3
{
  self->_includeTextualFormatInReport = a3;
}

- (BOOL)headerOnly
{
  return self->_headerOnly;
}

- (void)setHeaderOnly:(BOOL)a3
{
  self->_headerOnly = a3;
}

- (NSString)customOutput
{
  return (NSString *)objc_getProperty(self, a2, 328LL, 1);
}

- (void)setCustomOutput:(id)a3
{
}

- (NSUUID)incidentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setIncidentUUID:(id)a3
{
}

- (SATimeRange)eventTimeRange
{
  return (SATimeRange *)objc_getProperty(self, a2, 344LL, 1);
}

- (void)setEventTimeRange:(id)a3
{
}

- (SATimeRange)dataTimeRange
{
  return (SATimeRange *)objc_getProperty(self, a2, 352LL, 1);
}

- (void)setDataTimeRange:(id)a3
{
}

- (SATimestamp)reportTimeStart
{
  return (SATimestamp *)objc_getProperty(self, a2, 360LL, 1);
}

- (void)setReportTimeStart:(id)a3
{
}

- (SATimestamp)reportTimeEnd
{
  return (SATimestamp *)objc_getProperty(self, a2, 368LL, 1);
}

- (void)setReportTimeEnd:(id)a3
{
}

- (SASamplePrintOptions)printOptions
{
  return (SASamplePrintOptions *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)setPrintOptions:(id)a3
{
}

@end