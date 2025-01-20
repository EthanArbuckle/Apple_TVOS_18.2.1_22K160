@interface SACallTreeState
+ (id)treeCountedStateWithWaitInfo:(uint64_t)a1 turnstileInfo:(void *)a2 isPartOfADeadlock:(void *)a3 isBlockedByADeadlock:(unsigned int)a4 state:(unsigned int)a5 microstackshotState:(uint64_t)a6 pid:(unsigned int)a7 threadId:(int)a8 threadPriority:(uint64_t)a9 timeRange:(char)a10 originPid:(void *)a11 proximatePid:(uint64_t)a12 startSampleIndex:(uint64_t)a13 sampleCount:(uint64_t)a14;
+ (void)writeJSONDictionaryEntriesToStream:(__int16)a3 microstackshotState:(__int16)a4 primaryMicrostackshotState:(int)a5 includeIdleAndBattery:;
+ (void)writeJSONDictionaryEntriesToStream:(uint64_t)a3 state:(uint64_t *)a4 primaryState:;
- (NSString)debugDescription;
- (SACallTreeState)initWithWaitInfo:(id)a3 turnstileInfo:(id)a4 isPartOfADeadlock:(BOOL)a5 isBlockedByADeadlock:(BOOL)a6 state:(unint64_t)a7 microstackshotState:(unsigned int)a8 pid:(int)a9 threadId:(unint64_t)a10 threadPriority:(unsigned __int8)a11 timeRange:(id)a12 originPid:(int)a13 proximatePid:(int)a14 startSampleIndex:(unint64_t)a15 sampleCount:(unint64_t)a16;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SACallTreeState

- (SACallTreeState)initWithWaitInfo:(id)a3 turnstileInfo:(id)a4 isPartOfADeadlock:(BOOL)a5 isBlockedByADeadlock:(BOOL)a6 state:(unint64_t)a7 microstackshotState:(unsigned int)a8 pid:(int)a9 threadId:(unint64_t)a10 threadPriority:(unsigned __int8)a11 timeRange:(id)a12 originPid:(int)a13 proximatePid:(int)a14 startSampleIndex:(unint64_t)a15 sampleCount:(unint64_t)a16
{
  id v21 = a3;
  id v22 = a4;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___SACallTreeState;
  id v23 = a12;
  v24 = -[SACallTreeNode initWithStartSampleIndex:sampleCount:]( &v31,  sel_initWithStartSampleIndex_sampleCount_,  a15,  a16);
  if (v24)
  {
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v23, 0);
    timeRanges = v24->_timeRanges;
    v24->_timeRanges = (NSMutableArray *)v25;

    v24->_pid = a9;
    v24->_threadId = a10;
    v24->_threadPriority = a11;
    objc_storeStrong((id *)&v24->_waitInfo, a3);
    objc_storeStrong((id *)&v24->_turnstileInfo, a4);
    v24->_isPartOfADeadlock = a5;
    v24->_isBlockedByADeadlock = a6;
    v24->_state = a7;
    v24->_microstackshotState = a8;
    unint64_t v27 = a15 + a16 - 1;
    if (a15 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v24->_endSampleIndex = v27;
    v24->_originPid = a13;
    v24->_proximatePid = a14;
  }

  return v24;
}

+ (id)treeCountedStateWithWaitInfo:(uint64_t)a1 turnstileInfo:(void *)a2 isPartOfADeadlock:(void *)a3 isBlockedByADeadlock:(unsigned int)a4 state:(unsigned int)a5 microstackshotState:(uint64_t)a6 pid:(unsigned int)a7 threadId:(int)a8 threadPriority:(uint64_t)a9 timeRange:(char)a10 originPid:(void *)a11 proximatePid:(uint64_t)a12 startSampleIndex:(uint64_t)a13 sampleCount:(uint64_t)a14
{
  id v16 = a11;
  id v17 = a3;
  id v18 = a2;
  LOBYTE(v22) = a10;
  LODWORD(v21) = a8;
  v19 = (void *)objc_msgSend( objc_alloc((Class)objc_opt_self()),  "initWithWaitInfo:turnstileInfo:isPartOfADeadlock:isBlockedByADeadlock:state:microstackshotState:pid:th readId:threadPriority:timeRange:originPid:proximatePid:startSampleIndex:sampleCount:",  v18,  v17,  a4,  a5,  a6,  a7,  v21,  a9,  v22,  v16,  a12,  a13,  a14);

  return v19;
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x189604A88];
  v6 = (void *)MEMORY[0x189604A80];
  if ((self->_microstackshotState & 2) != 0) {
    v7 = (void *)MEMORY[0x189604A88];
  }
  else {
    v7 = (void *)MEMORY[0x189604A80];
  }
  id v30 = v4;
  SAJSONWriteDictionaryFirstEntry(v4, (uint64_t)@"foreground", v7);
  unsigned int microstackshotState = self->_microstackshotState;
  if ((microstackshotState & 0x10) != 0)
  {
    if ((microstackshotState & 4) != 0) {
      v9 = v6;
    }
    else {
      v9 = v5;
    }
    SAJSONWriteDictionaryEntry(v30, @"userActive", v9);
    if ((self->_microstackshotState & 8) != 0) {
      v10 = v5;
    }
    else {
      v10 = v6;
    }
    SAJSONWriteDictionaryEntry(v30, @"onBattery", v10);
    unsigned int microstackshotState = self->_microstackshotState;
  }

  if ((microstackshotState & 0x20) != 0) {
    v11 = v5;
  }
  else {
    v11 = v6;
  }
  SAJSONWriteDictionaryEntry(v30, @"suppressed", v11);
  if ((self->_microstackshotState & 0x80) != 0) {
    v12 = v5;
  }
  else {
    v12 = v6;
  }
  SAJSONWriteDictionaryEntry(v30, @"kernelMode", v12);
  unint64_t v13 = (((unint64_t)self->_microstackshotState >> 8) & 7) - 1;
  else {
    v14 = off_189F63510[v13];
  }
  [NSString stringWithUTF8String:v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v30, @"effectiveQos", v15);

  unint64_t v16 = (((unint64_t)self->_microstackshotState >> 11) & 7) - 1;
  else {
    id v17 = off_189F63510[v16];
  }
  [NSString stringWithUTF8String:v17];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v30, @"requestedQos", v18);

  unint64_t state = self->_state;
  if (state)
  {
    if ((state & 4) != 0) {
      v20 = v5;
    }
    else {
      v20 = v6;
    }
    SAJSONWriteDictionaryEntry(v30, @"running", v20);
    if ((self->_state & 2) != 0) {
      uint64_t v21 = v5;
    }
    else {
      uint64_t v21 = v6;
    }
    SAJSONWriteDictionaryEntry(v30, @"runnable", v21);
    if ((self->_state & 1) != 0) {
      uint64_t v22 = v5;
    }
    else {
      uint64_t v22 = v6;
    }
    SAJSONWriteDictionaryEntry(v30, @"suspended", v22);
  }

  waitInfo = self->_waitInfo;
  if (waitInfo)
  {
    v24 = -[SAWaitInfo descriptionForPid:tid:options:nameCallback:]( waitInfo,  "descriptionForPid:tid:options:nameCallback:",  self->_pid,  self->_threadId,  3LL,  &__block_literal_global_8);
    if (v24) {
      SAJSONWriteDictionaryEntry(v30, @"waitInfo", v24);
    }
  }

  turnstileInfo = self->_turnstileInfo;
  if (turnstileInfo)
  {
    v26 = -[SATurnstileInfo descriptionForPid:tid:threadPriority:options:nameCallback:]( turnstileInfo,  "descriptionForPid:tid:threadPriority:options:nameCallback:",  self->_pid,  self->_threadId,  self->_threadPriority,  3LL,  &__block_literal_global_130);
    if (v26) {
      SAJSONWriteDictionaryEntry(v30, @"turnstileInfo", v26);
    }
  }

  if (self->_isPartOfADeadlock)
  {
    [MEMORY[0x189607968] numberWithBool:1];
    unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v30, @"isPartOfADeadlock", v27);
  }

  if (self->_isBlockedByADeadlock)
  {
    [MEMORY[0x189607968] numberWithBool:1];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v30, @"isBlockedByADeadlock", v28);
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[SACallTreeNode sampleCount](self, "sampleCount"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v30, @"count", v29);
}

id __54__SACallTreeState_writeJSONDictionaryEntriesToStream___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if ((_DWORD)a2 == -1)
  {
    v6 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"0x%llx", a3, v8);
  }

  else
  {
    id v5 = objc_alloc(NSString);
    if (a3) {
      v6 = (void *)objc_msgSend(v5, "initWithFormat:", @"[%d] 0x%llx", a2, a3);
    }
    else {
      v6 = (void *)objc_msgSend(v5, "initWithFormat:", @"[%d]", a2, v8);
    }
  }

  return v6;
}

id __54__SACallTreeState_writeJSONDictionaryEntriesToStream___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if ((_DWORD)a2 == -1)
  {
    v6 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"0x%llx", a3, v8);
  }

  else
  {
    id v5 = objc_alloc(NSString);
    if (a3) {
      v6 = (void *)objc_msgSend(v5, "initWithFormat:", @"[%d] 0x%llx", a2, a3);
    }
    else {
      v6 = (void *)objc_msgSend(v5, "initWithFormat:", @"[%d]", a2, v8);
    }
  }

  return v6;
}

+ (void)writeJSONDictionaryEntriesToStream:(__int16)a3 microstackshotState:(__int16)a4 primaryMicrostackshotState:(int)a5 includeIdleAndBattery:
{
  id v23 = a2;
  objc_opt_self();
  uint64_t v8 = (void *)MEMORY[0x189604A88];
  v9 = (void *)MEMORY[0x189604A80];
  if ((a3 & 2) != (a4 & 2))
  {
    if ((a3 & 2) != 0) {
      v10 = (void *)MEMORY[0x189604A88];
    }
    else {
      v10 = (void *)MEMORY[0x189604A80];
    }
    SAJSONWriteDictionaryEntry(v23, @"foreground", v10);
  }

  if ((a3 & 0x20) != (a4 & 0x20))
  {
    if ((a3 & 0x20) != 0) {
      v11 = v8;
    }
    else {
      v11 = v9;
    }
    SAJSONWriteDictionaryEntry(v23, @"suppressed", v11);
  }

  if ((a3 & 0x80) != (a4 & 0x80))
  {
    if ((a3 & 0x80) != 0) {
      v12 = v8;
    }
    else {
      v12 = v9;
    }
    SAJSONWriteDictionaryEntry(v23, @"kernelMode", v12);
  }

  if (a5)
  {
    if ((a3 & 0x10) == 0)
    {
      if ((a4 & 0x10) == 0) {
        goto LABEL_36;
      }
      unint64_t v13 = @"idleBatteryInvalid";
      v14 = (void *)MEMORY[0x189604A88];
      goto LABEL_35;
    }

    if ((a4 & 0x10) == 0)
    {
      if ((a3 & 4) != 0) {
        v15 = v9;
      }
      else {
        v15 = v8;
      }
      SAJSONWriteDictionaryEntry(v23, @"userActive", v15);
LABEL_31:
      if ((a3 & 8) != 0) {
        v14 = v8;
      }
      else {
        v14 = v9;
      }
      unint64_t v13 = @"onBattery";
LABEL_35:
      SAJSONWriteDictionaryEntry(v23, v13, v14);
      goto LABEL_36;
    }

    if (((a4 ^ a3) & 4) != 0)
    {
      if ((a3 & 4) != 0) {
        unint64_t v16 = v9;
      }
      else {
        unint64_t v16 = v8;
      }
      SAJSONWriteDictionaryEntry(v23, @"userActive", v16);
    }
  }

+ (void)writeJSONDictionaryEntriesToStream:(uint64_t)a3 state:(uint64_t *)a4 primaryState:
{
  id v18 = a2;
  objc_opt_self();
  if (!a4)
  {
    if ((a3 & 1) != 0) {
      SAJSONWriteDictionaryEntry(v18, @"suspended", MEMORY[0x189604A88]);
    }
    if ((a3 & 4) != 0)
    {
      SAJSONWriteDictionaryEntry(v18, @"running", MEMORY[0x189604A88]);
    }

    else if ((a3 & 6) == 2)
    {
LABEL_21:
      if ((a3 & 2) != 0) {
        v10 = (void *)MEMORY[0x189604A88];
      }
      else {
        v10 = (void *)MEMORY[0x189604A80];
      }
      SAJSONWriteDictionaryEntry(v18, @"runnable", v10);
      unint64_t v11 = a3 & 0x7F8;
      BOOL v12 = v11 != 0;
      if (!a4)
      {
        if ((a3 & 0x7F8) == 0) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }

      goto LABEL_32;
    }

    unint64_t v11 = a3 & 0x7F8;
    if ((a3 & 0x7F8) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }

  uint64_t v6 = *a4;
  uint64_t v7 = *a4 ^ a3;
  if ((v7 & 1) != 0)
  {
    if ((a3 & 1) != 0) {
      uint64_t v8 = (void *)MEMORY[0x189604A88];
    }
    else {
      uint64_t v8 = (void *)MEMORY[0x189604A80];
    }
    SAJSONWriteDictionaryEntry(v18, @"suspended", v8);
    uint64_t v6 = *a4;
    uint64_t v7 = *a4 ^ a3;
  }

  if ((v7 & 4) == 0)
  {
    if ((a3 & 4) != 0) {
      goto LABEL_27;
    }
LABEL_20:
    if (!(v6 & 4 | v7 & 2))
    {
LABEL_27:
      unint64_t v11 = a3 & 0x7F8;
      BOOL v12 = v11 != 0;
      goto LABEL_33;
    }

    goto LABEL_21;
  }

  if ((a3 & 4) != 0) {
    v9 = (void *)MEMORY[0x189604A88];
  }
  else {
    v9 = (void *)MEMORY[0x189604A80];
  }
  SAJSONWriteDictionaryEntry(v18, @"running", v9);
  if ((a3 & 4) == 0)
  {
    uint64_t v6 = *a4;
    uint64_t v7 = *a4 ^ a3;
    goto LABEL_20;
  }

  unint64_t v11 = a3 & 0x7F8;
  BOOL v12 = v11 != 0;
LABEL_32:
  uint64_t v6 = *a4;
LABEL_33:
  if (((v12 ^ ((v6 & 0x7F8) != 0)) & 1) == 0)
  {
    char v14 = !v12;
    if ((v6 & 0x7F8) == 0) {
      char v14 = 1;
    }
    if ((v14 & 1) != 0 || (v11 >> 3) == (v6 >> 3))
    {
LABEL_46:
      uint64_t v15 = *a4 ^ a3;
      if ((v15 & 0x800) != 0)
      {
        if ((a3 & 0x800) != 0) {
          unint64_t v16 = (void *)MEMORY[0x189604A88];
        }
        else {
          unint64_t v16 = (void *)MEMORY[0x189604A80];
        }
        SAJSONWriteDictionaryEntry(v18, @"eCore", v16);
        uint64_t v15 = *a4 ^ a3;
      }

      if ((v15 & 0x1000) != 0) {
        goto LABEL_52;
      }
      goto LABEL_56;
    }
  }

  if (!v12)
  {
    SAJSONWriteDictionaryEntry(v18, @"cpuNum", &unk_189F82358);
    goto LABEL_46;
  }

- (NSString)debugDescription
{
  id v20 = objc_alloc(NSString);
  unint64_t v19 = -[SACallTreeNode startSampleIndex](self, "startSampleIndex");
  if (self) {
    unint64_t endSampleIndex = self->_endSampleIndex;
  }
  else {
    unint64_t endSampleIndex = 0LL;
  }
  unint64_t v3 = -[SACallTreeNode sampleCount](self, "sampleCount");
  unint64_t threadId = self->_threadId;
  unint64_t v17 = v3;
  uint64_t threadPriority = self->_threadPriority;
  unint64_t state = self->_state;
  uint64_t pid = self->_pid;
  uint64_t microstackshotState = self->_microstackshotState;
  -[SAWaitInfo debugDescription](self->_waitInfo, "debugDescription");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SATurnstileInfo debugDescription](self->_turnstileInfo, "debugDescription");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL isPartOfADeadlock = self->_isPartOfADeadlock;
  BOOL isBlockedByADeadlock = self->_isBlockedByADeadlock;
  -[NSMutableArray debugDescription](self->_childIOEvents, "debugDescription");
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray debugDescription](self->_timeRanges, "debugDescription");
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v13 = (void *)[v20 initWithFormat:@"tree state %lu-%lu (%lu) [%d] thread 0x%llx priority:%d state:0x%llx microState:0x%x waitInfo:%@ turnstileInfo:%@ deadlocked:%d indirectly_deadlocked:%d io:%@ timeRanges:%@ originPid:%d proximatePid:%d", v19, endSampleIndex, v17, pid, threadId, threadPriority, state, microstackshotState, v7, v8, isPartOfADeadlock, isBlockedByADeadlock, v11, v12, self->_originPid, self->_proximatePid];

  return (NSString *)v13;
}

- (void).cxx_destruct
{
}

@end