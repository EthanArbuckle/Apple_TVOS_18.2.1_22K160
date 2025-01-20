@interface SATimestamp
+ (SATimestamp)timestampWithMachAbsTime:(unint64_t)a3 machAbsTimeSec:(double)a4 machContTime:(unint64_t)a5 machContTimeSec:(double)a6 wallTime:(double)a7;
+ (SATimestamp)timestampWithMachAbsTime:(unint64_t)a3 machContTime:(unint64_t)a4 wallTime:(double)a5 machTimebase:(mach_timebase_info)a6;
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)now;
+ (id)timestampWithKTraceEvent:(uint64_t)a1 fromSession:(uint64_t)a2;
+ (id)timestampWithMachAbsTime:(uint64_t)a1 fromKtraceSession:(uint64_t)a2;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)eq:(id)a3;
- (BOOL)ge:(id)a3;
- (BOOL)gt:(id)a3;
- (BOOL)isComparable:(id)a3;
- (BOOL)isEqualToTimestamp:(id)a3;
- (BOOL)le:(id)a3;
- (BOOL)lt:(id)a3;
- (BOOL)ne:(id)a3;
- (NSString)debugDescription;
- (SATimestamp)initWithMachAbsTime:(unint64_t)a3 machAbsTimeSec:(double)a4 machContTime:(unint64_t)a5 machContTimeSec:(double)a6 wallTime:(double)a7;
- (double)deltaSecondsTo:(id)a3 timeDomainPriorityList:(id)a4 timeDomainUsed:(unint64_t *)a5;
- (double)machAbsTimeSeconds;
- (double)machContTimeSeconds;
- (double)wallTime;
- (id)copyDate;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compare:(id)a3;
- (int64_t)deltaMachTo:(id)a3 timeDomainPriorityList:(id)a4 timeDomainUsed:(unint64_t *)a5;
- (uint64_t)applyMachTimebase:(uint64_t)result;
- (unint64_t)machAbsTime;
- (unint64_t)machContTime;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)guessMissingTimesBasedOnCurrentTime;
- (void)guessMissingTimesBasedOnTimestamp:(id)a3;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SATimestamp

- (SATimestamp)initWithMachAbsTime:(unint64_t)a3 machAbsTimeSec:(double)a4 machContTime:(unint64_t)a5 machContTimeSec:(double)a6 wallTime:(double)a7
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SATimestamp;
  result = -[SATimestamp init](&v13, sel_init);
  if (result)
  {
    result->_machAbsTime = a3;
    result->_machAbsTimeSeconds = a4;
    result->_machContTime = a5;
    result->_machContTimeSeconds = a6;
    result->_wallTime = a7;
  }

  return result;
}

+ (SATimestamp)timestampWithMachAbsTime:(unint64_t)a3 machAbsTimeSec:(double)a4 machContTime:(unint64_t)a5 machContTimeSec:(double)a6 wallTime:(double)a7
{
  return (SATimestamp *)(id)[objc_alloc((Class)a1) initWithMachAbsTime:a3 machAbsTimeSec:a5 machContTime:a4 machContTimeSec:a6 wallTime:a7];
}

+ (SATimestamp)timestampWithMachAbsTime:(unint64_t)a3 machContTime:(unint64_t)a4 wallTime:(double)a5 machTimebase:(mach_timebase_info)a6
{
  unint64_t v10 = 0LL;
  double v11 = 0.0;
  if (a6.numer && a6.denom)
  {
    if (a6.numer == a6.denom)
    {
      double v11 = (double)a3 / 1000000000.0;
      unint64_t v10 = a4;
    }

    else
    {
      double v11 = (double)(unint64_t)__udivti3() / 1000000000.0;
      unint64_t v10 = __udivti3();
    }
  }

  return (SATimestamp *)[a1 timestampWithMachAbsTime:a3 machAbsTimeSec:a4 machContTime:v11 machContTimeSec:(double)v10 / 1000000000.0 wallTime:a5];
}

+ (id)timestampWithKTraceEvent:(uint64_t)a1 fromSession:(uint64_t)a2
{
  v3 = (void *)objc_opt_self();
  uint64_t absolute_from_timestamp = ktrace_get_absolute_from_timestamp();
  uint64_t continuous_from_timestamp = ktrace_get_continuous_from_timestamp();
  uint64_t ns_from_timestamp = ktrace_get_ns_from_timestamp();
  uint64_t v7 = ktrace_get_ns_from_timestamp();
  uint64_t v8 = *(void *)(a2 + 56);
  if (v8)
  {
    double v9 = (double)v8;
    double v10 = (double)*(int *)(a2 + 64);
    double v11 = 1000000.0;
  }

  else
  {
    int v13 = ktrace_convert_timestamp_to_walltime();
    double v12 = 0.0;
    if (v13) {
      goto LABEL_5;
    }
    double v9 = (double)v15;
    double v10 = (double)v16;
    double v11 = 1000000000.0;
  }

  double v12 = v10 / v11 + v9 - *MEMORY[0x189604DA8];
LABEL_5:
  [v3 timestampWithMachAbsTime:absolute_from_timestamp machAbsTimeSec:continuous_from_timestamp machContTime:(double)(unint64_t)ns_from_timestamp / 1000000000.0 machContTimeSec:(double)(unint64_t)v7 / 1000000000.0 wallTime:v12];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)timestampWithMachAbsTime:(uint64_t)a1 fromKtraceSession:(uint64_t)a2
{
  uint64_t ns_from_timestamp = ktrace_get_ns_from_timestamp();
  uint64_t continuous_from_absolute = ktrace_get_continuous_from_absolute();
  uint64_t v5 = ktrace_get_ns_from_timestamp();
  int v6 = ktrace_convert_absolute_to_walltime();
  double v7 = 0.0;
  if (!v6) {
    double v7 = (double)0LL - *MEMORY[0x189604DA8] + (double)0LL / 1000000000.0;
  }
  +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:",  a2,  continuous_from_absolute,  (double)(unint64_t)ns_from_timestamp / 1000000000.0,  (double)(unint64_t)v5 / 1000000000.0,  v7,  0LL,  0LL);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)now
{
  double v3 = *MEMORY[0x189604DA8];
  if (_MergedGlobals_7 != -1) {
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_9);
  }
  objc_msgSend( a1,  "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:",  0,  0,  qword_18C4B16B0,  (double)0 - v3 + (double)0 / 1000000000.0,  0,  0,  0,  0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isComparable:(id)a3
{
  v4 = (SATimestamp *)a3;
  BOOL v5 = self == v4
    || self->_machAbsTime && v4->_machAbsTime
    || self->_machContTime && v4->_machContTime
    || self->_machAbsTimeSeconds != 0.0 && v4->_machAbsTimeSeconds != 0.0
    || self->_machContTimeSeconds != 0.0 && v4->_machContTimeSeconds != 0.0
    || self->_wallTime != 0.0 && v4->_wallTime != 0.0;

  return v5;
}

- (int64_t)compare:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (self == a3) {
    return 0LL;
  }
  unint64_t machAbsTime = self->_machAbsTime;
  if (machAbsTime && (unint64_t v4 = *((void *)a3 + 1)) != 0
    || (unint64_t machAbsTime = self->_machContTime) != 0 && (v4 = *((void *)a3 + 3)) != 0)
  {
    BOOL v5 = machAbsTime > v4;
    if (machAbsTime >= v4) {
      int64_t v6 = 0LL;
    }
    else {
      int64_t v6 = -1LL;
    }
    if (v5) {
      return 1LL;
    }
    else {
      return v6;
    }
  }

  else
  {
    double machAbsTimeSeconds = self->_machAbsTimeSeconds;
    if ((machAbsTimeSeconds == 0.0 || (double v9 = *((double *)a3 + 2), v9 == 0.0))
      && ((double machAbsTimeSeconds = self->_machContTimeSeconds, machAbsTimeSeconds == 0.0)
       || (double v9 = *((double *)a3 + 4), v9 == 0.0))
      && ((machAbsTimeSeconds = self->_wallTime, machAbsTimeSeconds == 0.0) || (double v9 = *((double *)a3 + 5), v9 == 0.0)))
    {
      int v11 = *__error();
      _sa_logt();
      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = -[SATimestamp debugDescription](self, "debugDescription");
        uint64_t v14 = [v13 UTF8String];
        id v15 = [a3 debugDescription];
        *(_DWORD *)buf = 136315394;
        uint64_t v28 = v14;
        __int16 v29 = 2080;
        uint64_t v30 = [v15 UTF8String];
        _os_log_error_impl(&dword_186C92000, v12, OS_LOG_TYPE_ERROR, "Incomparable timestamps: %s vs %s", buf, 0x16u);
      }

      *__error() = v11;
      id v16 = -[SATimestamp debugDescription](self, "debugDescription");
      char v17 = [v16 UTF8String];
      id v18 = [a3 debugDescription];
      [v18 UTF8String];
      _SASetCrashLogMessage(173, "Incomparable timestamps: %s vs %s", v19, v20, v21, v22, v23, v24, v17);

      int64_t result = _os_crash();
      __break(1u);
    }

    else
    {
      if (machAbsTimeSeconds >= v9) {
        int64_t v10 = 0LL;
      }
      else {
        int64_t v10 = -1LL;
      }
      if (machAbsTimeSeconds <= v9) {
        return v10;
      }
      else {
        return 1LL;
      }
    }
  }

  return result;
}

- (double)deltaSecondsTo:(id)a3 timeDomainPriorityList:(id)a4 timeDomainUsed:(unint64_t *)a5
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v9 = a4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v35;
    *(void *)&__int128 v11 = 134217984LL;
    __int128 v33 = v11;
    while (2)
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "unsignedLongLongValue", v33, (void)v34);
        switch(v16)
        {
          case 16LL:
            -[SATimestamp machContTimeSeconds](self, "machContTimeSeconds");
            if (v19 != 0.0)
            {
              [v8 machContTimeSeconds];
              if (v20 != 0.0)
              {
                if (a5) {
                  *a5 = 16LL;
                }
                [v8 machContTimeSeconds];
                double v28 = v30;
                -[SATimestamp machContTimeSeconds](self, "machContTimeSeconds");
                goto LABEL_34;
              }
            }

            break;
          case 4LL:
            -[SATimestamp machAbsTimeSeconds](self, "machAbsTimeSeconds");
            if (v21 != 0.0)
            {
              [v8 machAbsTimeSeconds];
              if (v22 != 0.0)
              {
                if (a5) {
                  *a5 = 4LL;
                }
                [v8 machAbsTimeSeconds];
                double v28 = v31;
                -[SATimestamp machAbsTimeSeconds](self, "machAbsTimeSeconds");
                goto LABEL_34;
              }
            }

            break;
          case 1LL:
            -[SATimestamp wallTime](self, "wallTime");
            if (v17 != 0.0)
            {
              [v8 wallTime];
              if (v18 != 0.0)
              {
                if (a5) {
                  *a5 = 1LL;
                }
                [v8 wallTime];
                double v28 = v27;
                -[SATimestamp wallTime](self, "wallTime");
LABEL_34:
                double v26 = v28 - v29;

                goto LABEL_35;
              }
            }

            break;
          default:
            int v23 = *__error();
            _sa_logt();
            uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              uint64_t v25 = [v15 unsignedLongLongValue];
              *(_DWORD *)buf = v33;
              uint64_t v39 = v25;
              _os_log_fault_impl(&dword_186C92000, v24, OS_LOG_TYPE_FAULT, "Invalid time domain 0x%llx", buf, 0xCu);
            }

            *__error() = v23;
            break;
        }
      }

      uint64_t v12 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  double v26 = 0.0;
  if (a5) {
    *a5 = 0LL;
  }
LABEL_35:

  return v26;
}

- (int64_t)deltaMachTo:(id)a3 timeDomainPriorityList:(id)a4 timeDomainUsed:(unint64_t *)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v9 = a4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v26;
    *(void *)&__int128 v11 = 134217984LL;
    __int128 v24 = v11;
    while (2)
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "unsignedLongLongValue", v24, (void)v25);
        if (v16 == 2)
        {
          if (-[SATimestamp machAbsTime](self, "machAbsTime") && [v8 machAbsTime])
          {
            if (a5) {
              *a5 = 2LL;
            }
            uint64_t v21 = [v8 machAbsTime];
            unint64_t v22 = -[SATimestamp machAbsTime](self, "machAbsTime");
            goto LABEL_27;
          }
        }

        else if (v16 == 8)
        {
          if (-[SATimestamp machContTime](self, "machContTime") && [v8 machContTime])
          {
            if (a5) {
              *a5 = 8LL;
            }
            uint64_t v21 = [v8 machContTime];
            unint64_t v22 = -[SATimestamp machContTime](self, "machContTime");
LABEL_27:
            int64_t v20 = v21 - v22;

            goto LABEL_28;
          }
        }

        else
        {
          int v17 = *__error();
          _sa_logt();
          double v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            uint64_t v19 = [v15 unsignedLongLongValue];
            *(_DWORD *)buf = v24;
            uint64_t v30 = v19;
            _os_log_fault_impl(&dword_186C92000, v18, OS_LOG_TYPE_FAULT, "Invalid time domain 0x%llx", buf, 0xCu);
          }

          *__error() = v17;
        }
      }

      uint64_t v12 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  int64_t v20 = 0LL;
  if (a5) {
    *a5 = 0LL;
  }
LABEL_28:

  return v20;
}

- (BOOL)lt:(id)a3
{
  return -[SATimestamp compare:](self, "compare:", a3) == -1;
}

- (BOOL)le:(id)a3
{
  return -[SATimestamp compare:](self, "compare:", a3) != 1;
}

- (BOOL)gt:(id)a3
{
  return -[SATimestamp compare:](self, "compare:", a3) == 1;
}

- (BOOL)ge:(id)a3
{
  return -[SATimestamp compare:](self, "compare:", a3) != -1;
}

- (BOOL)eq:(id)a3
{
  return -[SATimestamp compare:](self, "compare:", a3) == 0;
}

- (BOOL)ne:(id)a3
{
  return -[SATimestamp compare:](self, "compare:", a3) != 0;
}

- (BOOL)isEqualToTimestamp:(id)a3
{
  unint64_t v4 = (SATimestamp *)a3;
  BOOL v5 = self == v4
    || self->_machAbsTime == v4->_machAbsTime
    && self->_machContTime == v4->_machContTime
    && self->_wallTime == v4->_wallTime;

  return v5;
}

- (void)guessMissingTimesBasedOnTimestamp:(id)a3
{
  uint64_t v133 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!self->_machAbsTime
    || self->_machAbsTimeSeconds == 0.0
    || !self->_machContTime
    || self->_machContTimeSeconds == 0.0
    || self->_wallTime == 0.0)
  {
    uint64_t v122 = 0LL;
    v123 = &v122;
    uint64_t v124 = 0x2810000000LL;
    v125 = &unk_186DA1DC3;
    uint64_t v126 = 0LL;
    uint64_t v118 = 0LL;
    v119 = (double *)&v118;
    uint64_t v120 = 0x2020000000LL;
    uint64_t v5 = MEMORY[0x1895F87A8];
    uint64_t v121 = 0LL;
    v113[0] = MEMORY[0x1895F87A8];
    v113[1] = 3221225472LL;
    v113[2] = __49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke;
    v113[3] = &unk_189F63550;
    v116 = &v118;
    id v88 = v4;
    id v6 = v4;
    id v114 = v6;
    v115 = self;
    v117 = &v122;
    double v7 = (void (**)(void))MEMORY[0x186E47C94](v113);
    v7[2]();
    uint64_t v109 = 0LL;
    v110 = (double *)&v109;
    uint64_t v111 = 0x2020000000LL;
    uint64_t v112 = 0LL;
    uint64_t v105 = 0LL;
    v106 = &v105;
    uint64_t v107 = 0x2020000000LL;
    char v108 = 0;
    v101[0] = v5;
    v101[1] = 3221225472LL;
    v101[2] = __49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke_4;
    v101[3] = &unk_189F63550;
    v103 = &v105;
    v101[4] = self;
    id v8 = v6;
    id v102 = v8;
    v104 = &v109;
    id v9 = (void (**)(void))MEMORY[0x186E47C94](v101);
    v9[2]();
    uint64_t v97 = 0LL;
    v98 = &v97;
    uint64_t v99 = 0x2020000000LL;
    uint64_t v100 = 0LL;
    uint64_t v93 = 0LL;
    v94 = &v93;
    uint64_t v95 = 0x2020000000LL;
    char v96 = 0;
    v89[0] = v5;
    v89[1] = 3221225472LL;
    v89[2] = __49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke_2;
    v89[3] = &unk_189F63550;
    v91 = &v93;
    v89[4] = self;
    uint64_t v10 = (double *)v8;
    v90 = v10;
    v92 = &v97;
    __int128 v11 = (void (**)(void))MEMORY[0x186E47C94](v89);
    v11[2]();
    uint64_t v12 = 0LL;
    while (1)
    {
      if (v119[3] == 0.0)
      {
        char v17 = 0;
        goto LABEL_84;
      }

      double machAbsTimeSeconds = self->_machAbsTimeSeconds;
      if (!self->_machAbsTime)
      {
        if (machAbsTimeSeconds == 0.0)
        {
LABEL_32:
          char v17 = 0;
          goto LABEL_51;
        }

        if (!v12) {
          uint64_t v12 = (SATimestamp *)-[SATimestamp copy](self, "copy");
        }
        double v18 = v123;
        if (*((_DWORD *)v123 + 8))
        {
          double v19 = self->_machAbsTimeSeconds;
          if (*((_DWORD *)v123 + 9))
          {
            uint64_t v20 = v123[4];
            if ((_DWORD)v20) {
              BOOL v21 = HIDWORD(v20) == 0;
            }
            else {
              BOOL v21 = 1;
            }
            if (v21)
            {
              unint64_t v22 = 0LL;
            }

            else
            {
              unint64_t v22 = (unint64_t)(v19 * 1000000000.0);
              if (HIDWORD(v20) != (_DWORD)v20) {
                unint64_t v22 = __udivti3();
              }
            }

            unint64_t v25 = 0LL;
            self->_unint64_t machAbsTime = v22;
            uint64_t v26 = v18[4];
            if ((_DWORD)v26)
            {
              double v24 = 1000000000.0;
              if (HIDWORD(v26))
              {
                if ((_DWORD)v26 != HIDWORD(v26)) {
                  unint64_t v22 = __udivti3();
                }
                unint64_t v25 = v22;
                goto LABEL_48;
              }
            }

            else
            {
LABEL_48:
              double v24 = 1000000000.0;
            }

int *__49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke( int *result,  double a2,  double a3,  double a4,  double a5)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(void *)(*((void *)result + 6) + 8LL);
  double v6 = *(double *)(v5 + 24);
  if (v6 == 0.0)
  {
    double v7 = result;
    uint64_t v8 = *((void *)result + 4);
    unint64_t v9 = *(void *)(v8 + 8);
    if (v9)
    {
      double v10 = *(double *)(v8 + 16);
      if (v10 != 0.0) {
        goto LABEL_10;
      }
    }

    if ((v9 = *(void *)(v8 + 24)) != 0 && (double v10 = *(double *)(v8 + 32), v10 != 0.0)
      || (v11 = *((void *)result + 5), (v9 = *(void *)(v11 + 8)) != 0) && (double v10 = *(double *)(v11 + 16), v10 != 0.0)
      || (v9 = *(void *)(v11 + 24)) != 0 && (double v10 = *(double *)(v11 + 32), v10 != 0.0))
    {
LABEL_10:
      *(double *)(v5 + 24) = (double)v9 / v10;
      double v6 = *(double *)(*(void *)(*((void *)result + 6) + 8LL) + 24LL);
    }

    uint64_t v12 = 0LL;
    char v13 = 1;
    while (1)
    {
      uint64_t v14 = &TRIGeneralErrorDomain_block_invoke_knownMachTimebases[v12];
      LODWORD(a5) = *(_DWORD *)v14;
      LODWORD(a4) = *((_DWORD *)v14 + 1);
      double v15 = (double)*(unint64_t *)&a4 * 1000000000.0 / (double)*(unint64_t *)&a5;
      a5 = vabdd_f64(v15, v6);
      a4 = a5 / v15;
      if (a4 < 0.0000001) {
        break;
      }
      char v16 = v13;
      char v13 = 0;
      uint64_t v12 = 1LL;
      if ((v16 & 1) == 0) {
        goto LABEL_16;
      }
    }

    *(void *)(*(void *)(*((void *)result + 7) + 8LL) + 32LL) = *v14;
LABEL_16:
    uint64_t v17 = *(void *)(*((void *)result + 7) + 8LL);
    if (!*(_DWORD *)(v17 + 32) || !*(_DWORD *)(v17 + 36))
    {
      int v18 = *__error();
      _sa_logt();
      double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        double v20 = *(double *)(*(void *)(*((void *)v7 + 6) + 8LL) + 24LL) / 1000000000.0;
        int v21 = 134217984;
        double v22 = v20;
        _os_log_fault_impl( &dword_186C92000,  v19,  OS_LOG_TYPE_FAULT,  "Using unknown mach timebase %f",  (uint8_t *)&v21,  0xCu);
      }

      int64_t result = __error();
      SATimestamp *result = v18;
    }
  }

  return result;
}

double __49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke_4(void *a1)
{
  uint64_t v1 = *(void *)(a1[6] + 8LL);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = (double *)a1[4];
    if (v2[4] == 0.0 || *(double *)(a1[5] + 32LL) == 0.0)
    {
      if (v2[5] == 0.0 || *(double *)(a1[5] + 40LL) == 0.0)
      {
        double result = v2[2];
        if (result == 0.0) {
          return result;
        }
        double result = *(double *)(a1[5] + 16LL);
        if (result == 0.0) {
          return result;
        }
        uint64_t v3 = 16LL;
      }

      else
      {
        uint64_t v3 = 40LL;
      }
    }

    else
    {
      uint64_t v3 = 32LL;
    }

    *(_BYTE *)(v1 + 24) = 1;
    double result = *(double *)(a1[4] + v3) - *(double *)(a1[5] + v3);
    *(double *)(*(void *)(a1[7] + 8LL) + 24LL) = result;
  }

  return result;
}

void *__49__SATimestamp_guessMissingTimesBasedOnTimestamp___block_invoke_2(void *result)
{
  uint64_t v1 = *(void *)(result[6] + 8LL);
  if (!*(_BYTE *)(v1 + 24))
  {
    uint64_t v2 = result[4];
    if (*(void *)(v2 + 8) && *(void *)(result[5] + 8LL))
    {
      uint64_t v3 = 8LL;
    }

    else
    {
      if (!*(void *)(v2 + 24) || !*(void *)(result[5] + 24LL)) {
        return result;
      }
      uint64_t v3 = 24LL;
    }

    *(_BYTE *)(v1 + 24) = 1;
    *(void *)(*(void *)(result[7] + 8LL) + 24LL) = *(void *)(result[4] + v3) - *(void *)(result[5] + v3);
  }

  return result;
}

- (void)guessMissingTimesBasedOnCurrentTime
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SATimestamp guessMissingTimesBasedOnTimestamp:](self, "guessMissingTimesBasedOnTimestamp:", v3);
}

- (NSString)debugDescription
{
  id v3 = (__CFString *)_CopyStringForTime(3, self->_wallTime);
  id v4 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ machabs:%llu (%fs) machcont:%llu (%fs)", v3, self->_machAbsTime, *(void *)&self->_machAbsTimeSeconds, self->_machContTime, *(void *)&self->_machContTimeSeconds];

  return (NSString *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend( (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3),  "initWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:",  self->_machAbsTime,  self->_machContTime,  self->_machAbsTimeSeconds,  self->_machContTimeSeconds,  self->_wallTime);
}

- (id)copyDate
{
  if (self->_wallTime == 0.0) {
    return 0LL;
  }
  else {
    return (id)[objc_alloc(MEMORY[0x189603F50]) initWithTimeIntervalSinceReferenceDate:self->_wallTime];
  }
}

- (unint64_t)machAbsTime
{
  return self->_machAbsTime;
}

- (double)machAbsTimeSeconds
{
  return self->_machAbsTimeSeconds;
}

- (unint64_t)machContTime
{
  return self->_machContTime;
}

- (double)machContTimeSeconds
{
  return self->_machContTimeSeconds;
}

- (double)wallTime
{
  return self->_wallTime;
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v7 = a3;
  if (self->_wallTime == 0.0)
  {
    if (!self->_machAbsTime)
    {
      if (!self->_machContTime) {
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
      double v6 = (void *)objc_claimAutoreleasedReturnValue();
      SAJSONWriteDictionaryFirstEntry(v7, (uint64_t)@"machContTime", v6);
      goto LABEL_9;
    }

    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryFirstEntry(v7, (uint64_t)@"machAbsTime", v5);
  }

  else
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithDouble:");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryFirstEntry(v7, (uint64_t)@"wallTimeCF", v4);

    if (!self->_machAbsTime) {
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v7, @"machAbsTime", v5);
  }

LABEL_7:
  if (self->_machContTime)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    double v6 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v7, @"machContTime", v6);
LABEL_9:
  }

+ (id)classDictionaryKey
{
  return @"SATimestamp";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 26LL;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (-[SATimestamp sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v11 = *__error();
    _sa_logt();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = -[SATimestamp debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v43 = [v13 UTF8String];
      __int16 v44 = 2048;
      unint64_t v45 = -[SATimestamp sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v46 = 2048;
      unint64_t v47 = a4;
      _os_log_error_impl(&dword_186C92000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v11;
    id v14 = -[SATimestamp debugDescription](self, "debugDescription");
    char v15 = [v14 UTF8String];
    -[SATimestamp sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(765, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
    goto LABEL_10;
  }

  *(_WORD *)&a3->var0 = 257;
  unint64_t machAbsTime = self->_machAbsTime;
  if (!machAbsTime && self->_machAbsTimeSeconds != 0.0)
  {
LABEL_10:
    int v22 = *__error();
    _sa_logt();
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      unint64_t v24 = self->_machAbsTime;
      double machAbsTimeSeconds = self->_machAbsTimeSeconds;
      *(_DWORD *)buf = 134218240;
      uint64_t v43 = v24;
      __int16 v44 = 2048;
      unint64_t v45 = *(void *)&machAbsTimeSeconds;
      _os_log_error_impl(&dword_186C92000, v23, OS_LOG_TYPE_ERROR, "machAbs %llu and machAbsSec %f", buf, 0x16u);
    }

    *__error() = v22;
    _SASetCrashLogMessage(771, "machAbs %llu and machAbsSec %f", v26, v27, v28, v29, v30, v31, self->_machAbsTime);
    _os_crash();
    __break(1u);
LABEL_13:
    int v32 = *__error();
    _sa_logt();
    double v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      unint64_t machContTime = self->_machContTime;
      double machContTimeSeconds = self->_machContTimeSeconds;
      *(_DWORD *)buf = 134218240;
      uint64_t v43 = machContTime;
      __int16 v44 = 2048;
      unint64_t v45 = *(void *)&machContTimeSeconds;
      _os_log_error_impl(&dword_186C92000, v33, OS_LOG_TYPE_ERROR, "machCont %llu and machContSec %f", buf, 0x16u);
    }

    *__error() = v32;
    _SASetCrashLogMessage(772, "machCont %llu and machContSec %f", v36, v37, v38, v39, v40, v41, self->_machContTime);
    _os_crash();
    __break(1u);
  }

  if (!self->_machContTime && self->_machContTimeSeconds != 0.0) {
    goto LABEL_13;
  }
  *(void *)(&a3->var1 + 1) = machAbsTime;
  *(unint64_t *)((char *)&a3->var2 + 2) = self->_machContTime;
  *(unint64_t *)((char *)&a3->var3 + 2) = *(void *)&self->_wallTime;

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (a4 <= 0x19)
  {
    int v6 = *__error();
    _sa_logt();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v16 = a4;
      __int16 v17 = 2048;
      uint64_t v18 = 26LL;
      _os_log_error_impl( &dword_186C92000,  v7,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SATimestamp struct %lu",  buf,  0x16u);
    }

    *__error() = v6;
    _SASetCrashLogMessage(790, "bufferLength %lu < serialized SATimestamp struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SATimestamp version",  0LL);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }

  +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:",  *(void *)((char *)a3 + 2),  *(void *)((char *)a3 + 10),  0.0,  0.0,  *(double *)((char *)a3 + 18));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)applyMachTimebase:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 8);
    double v5 = *(double *)(result + 16);
    if (v4)
    {
      if (v5 == 0.0)
      {
        double result = 0LL;
        if ((_DWORD)a2)
        {
          if (HIDWORD(a2))
          {
            double result = v4;
            if ((_DWORD)a2 != HIDWORD(a2)) {
              double result = __udivti3();
            }
          }
        }

        *(double *)(v3 + 16) = (double)(unint64_t)result / 1000000000.0;
      }
    }

    else if (v5 != 0.0)
    {
      double result = 0LL;
      if ((_DWORD)a2)
      {
        if (HIDWORD(a2))
        {
          double result = (unint64_t)(v5 * 1000000000.0);
          if (HIDWORD(a2) != (_DWORD)a2) {
            double result = __udivti3();
          }
        }
      }

      *(void *)(v3 + 8) = result;
    }

    double v6 = *(double *)(v3 + 32);
    if (*(void *)(v3 + 24))
    {
      if (v6 == 0.0)
      {
        double result = 0LL;
        if ((_DWORD)a2 && HIDWORD(a2))
        {
          double result = *(void *)(v3 + 24);
          if ((_DWORD)a2 != HIDWORD(a2)) {
            double result = __udivti3();
          }
        }

        *(double *)(v3 + 32) = (double)(unint64_t)result / 1000000000.0;
      }
    }

    else if (v6 != 0.0)
    {
      double result = 0LL;
      if ((_DWORD)a2)
      {
        if (HIDWORD(a2))
        {
          double result = (unint64_t)(v6 * 1000000000.0);
          if (HIDWORD(a2) != (_DWORD)a2) {
            double result = __udivti3();
          }
        }
      }

      *(void *)(v3 + 24) = result;
    }
  }

  return result;
}

@end