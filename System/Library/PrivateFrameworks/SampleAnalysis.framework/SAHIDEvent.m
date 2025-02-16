@interface SAHIDEvent
+ (id)classDictionaryKey;
+ (id)hidEventWithoutReferencesFromPAStyleSerializedHIDEvent:(uint64_t)a1;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (void)hidEventWithHIDEventType:(void *)a3 atTimestamp:;
+ (void)parseKTrace:(ktrace_session *)a3 findingHIDEvents:(id)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (NSArray)steps;
- (NSString)debugDescription;
- (NSString)hidEventTypeString;
- (SATimestamp)hidEventTimestamp;
- (double)thresholdToGroupSameEventType;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unsigned)hidEventType;
- (void)addKTraceEvent:(uint64_t)a1 fromSession:(uint64_t)a2;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAHIDEvent

- (double)thresholdToGroupSameEventType
{
  return 0.0;
}

- (NSString)hidEventTypeString
{
  unsigned int v2 = self->_hidEventType - 1;
  if (v2 <= 0xB && ((0xE0Fu >> v2) & 1) != 0) {
    v3 = (void *)*((void *)&off_189F649B0 + (int)v2);
  }
  else {
    v3 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"UNKNOWN(%d)",  self->_hidEventType);
  }
  return (NSString *)v3;
}

+ (void)hidEventWithHIDEventType:(void *)a3 atTimestamp:
{
  id v5 = a3;
  objc_opt_self();
  v6 = objc_alloc((Class)objc_opt_class());
  id v7 = v5;
  if (v6)
  {
    v12.receiver = v6;
    v12.super_class = (Class)&OBJC_CLASS___SAHIDEvent;
    id v8 = objc_msgSendSuper2(&v12, sel_init);
    v6 = v8;
    if (v8)
    {
      *((_DWORD *)v8 + 4) = a2;
      objc_storeStrong((id *)v8 + 3, a3);
      uint64_t v9 = [MEMORY[0x189604A58] mutableCopy];
      v10 = (void *)v6[1];
      v6[1] = v9;
    }
  }

  return v6;
}

- (void)addKTraceEvent:(uint64_t)a1 fromSession:(uint64_t)a2
{
  if (a1)
  {
    objc_opt_self();
    v4 = objc_alloc(&OBJC_CLASS___SAHIDStep);
    if (!v4)
    {
LABEL_37:

      return;
    }

    id v5 = v4;
    v6 = +[SATimestamp timestampWithKTraceEvent:fromSession:]((uint64_t)&OBJC_CLASS___SATimestamp, a2);
    int v7 = *(_DWORD *)(a2 + 48);
    int pid_for_thread = -1;
    if (v7 > 736428035)
    {
      if ((v7 - 736428036) <= 0x1C)
      {
        if (((1 << (v7 - 4)) & 0x1111111) != 0) {
          goto LABEL_18;
        }
        if (v7 == 736428064)
        {
          uint64_t v9 = 0LL;
          int pid_for_thread = *(_DWORD *)(a2 + 24);
LABEL_34:
          id v14 = v6;
          v19.receiver = v5;
          v19.super_class = (Class)&OBJC_CLASS___SAHIDStep;
          v15 = (id *)objc_msgSendSuper2(&v19, sel_init);
          v16 = v15;
          if (v15)
          {
            *((_DWORD *)v15 + 2) = v7;
            objc_storeStrong(v15 + 2, v6);
            *((_DWORD *)v16 + 3) = pid_for_thread;
            v16[3] = v9;

            v18 = v16;
            [*(id *)(a1 + 8) addObject:v18];

            return;
          }

          id v17 = 0LL;
          v4 = 0LL;
          goto LABEL_37;
        }
      }

      if ((v7 - 736493572) > 0xC)
      {
        int v11 = *(_DWORD *)(a2 + 48);
        goto LABEL_20;
      }

      int v11 = *(_DWORD *)(a2 + 48);
      if (((1 << (v7 - 4)) & 0x1111) == 0)
      {
LABEL_20:
        uint64_t v9 = 0LL;
        if (v11 > 736428035)
        {
          if ((v11 - 736428036) > 0x18 || ((1 << (v11 - 4)) & 0x1111111) == 0)
          {
            unsigned int v12 = v11 - 736493572;
            if (v12 > 0xC || ((1 << v12) & 0x1111) == 0) {
              goto LABEL_34;
            }
          }

          goto LABEL_33;
        }

        if (v11 > 730268059)
        {
          unsigned __int16 v13 = 412;
        }

        else
        {
          unsigned __int16 v13 = 408;
        }

        if (v11 != (v13 | 0x2B870000)) {
          goto LABEL_34;
        }
LABEL_33:
        uint64_t v9 = *(void **)(a2 + 40);
        goto LABEL_34;
      }

+ (void)parseKTrace:(ktrace_session *)a3 findingHIDEvents:(id)a4
{
  id v5 = a4;
  v6 = (void *)[MEMORY[0x189604A60] mutableCopy];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __43__SAHIDEvent_parseKTrace_findingHIDEvents___block_invoke;
  v10[3] = &unk_189F61288;
  id v12 = v5;
  unsigned __int16 v13 = a3;
  id v11 = v6;
  id v7 = v5;
  id v8 = v6;
  uint64_t v9 = (void *)MEMORY[0x186E47C94](v10);
  ktrace_events_range();
  ktrace_events_range();
  ktrace_events_range();
  ktrace_events_range();
  ktrace_events_range();
}

void __43__SAHIDEvent_parseKTrace_findingHIDEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = HIDEventTimestampForKTraceEvent(a2);
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = *(_DWORD *)(a2 + 48);
    BOOL v7 = (v6 - 736428036) > 0x1C || ((1 << (v6 - 4)) & 0x11111111) == 0;
    if (!v7
      || ((v6 - 736493572) <= 0xC ? (BOOL v8 = ((1 << (v6 - 4)) & 0x1111) == 0) : (BOOL v8 = 1),
          (unsigned int v9 = v6 - 735576101, v8) ? (v10 = v9 >= 2) : (v10 = 0),
          !v10))
    {
      int v11 = *(_DWORD *)(a2 + 16);
      if (v11)
      {
        id v12 = *(void **)(a1 + 32);
        [MEMORY[0x189607968] numberWithUnsignedLongLong:v4];
        unsigned __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 objectForKeyedSubscript:v13];
        id v23 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v14 = (uint64_t)v23;
        if (!v23)
        {
          if (*(_DWORD *)(a2 + 48) == 735576102)
          {
            v15 = 0LL;
LABEL_27:

            return;
          }
          v16 = +[SATimestamp timestampWithMachAbsTime:fromKtraceSession:]((uint64_t)&OBJC_CLASS___SATimestamp, v5);
          +[SAHIDEvent hidEventWithHIDEventType:atTimestamp:]((uint64_t)&OBJC_CLASS___SAHIDEvent, v11, v16);
          id v24 = (id)objc_claimAutoreleasedReturnValue();
          id v17 = *(void **)(a1 + 32);
          [MEMORY[0x189607968] numberWithUnsignedLongLong:v5];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 setObject:v24 forKeyedSubscript:v18];

          (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
          uint64_t v14 = (uint64_t)v24;
        }

        id v25 = (id)v14;
        -[SAHIDEvent addKTraceEvent:fromSession:](v14, a2);
        int v19 = *(_DWORD *)(a2 + 48);
        if (v19 == 730267896
          || v19 == 730268060
          || v19 == 736493584 && (v20 = *(const char **)(a2 + 80)) != 0LL && strcmp(v20, "UIKitHostApp"))
        {
          v21 = *(void **)(a1 + 32);
          [MEMORY[0x189607968] numberWithUnsignedLongLong:v5];
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v21 setObject:0 forKeyedSubscript:v22];
        }

        v15 = v25;
        goto LABEL_27;
      }
    }
  }

- (NSString)debugDescription
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc(MEMORY[0x189607940]);
  -[SATimestamp debugDescription](self->_hidEventTimestamp, "debugDescription");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@ HID event type %d\n", v4, self->_hidEventType];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  int v6 = self->_steps;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v10) debugDescription];
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 appendFormat:@"%@\n", v11];

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  return (NSString *)v5;
}

- (NSArray)steps
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (SATimestamp)hidEventTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 24LL, 1);
}

- (unsigned)hidEventType
{
  return self->_hidEventType;
}

- (void).cxx_destruct
{
}

+ (id)classDictionaryKey
{
  return @"SAHIDEvent";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 24 * -[NSMutableArray count](self->_steps, "count") + 18;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  if (-[SAHIDEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    uint64_t v5 = *__error();
    _sa_logt();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = -[SAHIDEvent debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v55 = [v22 UTF8String];
      __int16 v56 = 2048;
      *(void *)v57 = -[SAHIDEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_WORD *)&v57[8] = 2048;
      *(void *)&v57[10] = a4;
      _os_log_error_impl(&dword_186C92000, v21, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v5;
    id v23 = -[SAHIDEvent debugDescription](self, "debugDescription");
    char v24 = [v23 UTF8String];
    -[SAHIDEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(779, "%s: size %lu != buffer length %lu", v25, v26, v27, v28, v29, v30, v24);

    _os_crash();
    __break(1u);
    goto LABEL_13;
  }

  *(_WORD *)&a3->var0 = 513;
  a3->var3 = self->_hidEventType;
  a3->var4 = SASerializableIndexForPointerFromSerializationDictionary(self->_hidEventTimestamp, v9);
  if ((unint64_t)-[NSMutableArray count](self->_steps, "count") >= 0xFFFF)
  {
LABEL_13:
    int v31 = *__error();
    _sa_logt();
    a3 = ($1CB927D85F2FFBE2DD68615DF00AAEE4 *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = -[NSMutableArray count](self->_steps, "count");
      *(_DWORD *)buf = 134217984;
      uint64_t v55 = v32;
      _os_log_error_impl(&dword_186C92000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "hid event with %lu steps", buf, 0xCu);
    }

    *__error() = v31;
    char v33 = -[NSMutableArray count](self->_steps, "count");
    _SASetCrashLogMessage(787, "hid event with %lu steps", v34, v35, v36, v37, v38, v39, v33);
    _os_crash();
    __break(1u);
LABEL_16:
    int v40 = *__error();
    _sa_logt();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      id v42 = -[SAHIDEvent debugDescription](self, "debugDescription");
      uint64_t v43 = [v42 UTF8String];
      int var2 = a3->var2;
      unint64_t v45 = -[SAHIDEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_DWORD *)buf = 136315906;
      uint64_t v55 = v43;
      __int16 v56 = 1024;
      *(_DWORD *)v57 = var2;
      *(_WORD *)&v57[4] = 2048;
      *(void *)&v57[6] = v5;
      *(_WORD *)&v57[14] = 2048;
      *(void *)&v57[16] = v45;
      _os_log_error_impl( &dword_186C92000,  v41,  OS_LOG_TYPE_ERROR,  "%s: after serializing (with %u steps), ended with length %ld, should be %lu",  buf,  0x26u);
    }

    *__error() = v40;
    id v46 = -[SAHIDEvent debugDescription](self, "debugDescription");
    char v47 = [v46 UTF8String];
    -[SAHIDEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage( 798,  "%s: after serializing (with %u steps), ended with length %ld, should be %lu",  v48,  v49,  v50,  v51,  v52,  v53,  v47);

    _os_crash();
    __break(1u);
  }

  unsigned __int16 v10 = -[NSMutableArray count](self->_steps, "count");
  a3->int var2 = v10;
  if (v10)
  {
    unint64_t v11 = 0LL;
    id v12 = a3 + 2;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", v11);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v12[-1].var0 = [v13 debugid];

      -[NSMutableArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", v11);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12[-1].var3 = [v14 pid];

      -[NSMutableArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", v11);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12[-1].var4 = [v15 tid];

      -[NSMutableArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", v11);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 timestamp];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(void *)&v12->var0 = SASerializableIndexForPointerFromSerializationDictionary(v17, v9);
      id v12 = ($1CB927D85F2FFBE2DD68615DF00AAEE4 *)((char *)v12 + 24);

      ++v11;
      unint64_t v18 = a3->var2;
    }

    while (v11 < v18);
  }

  else
  {
    LODWORD(v18) = 0;
  }

  int v19 = &a3[1].var0 + 24 * v18;
  uint64_t v5 = 24LL * v18 + 18;
  if (v5 != -[SAHIDEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion")) {
    goto LABEL_16;
  }
  objc_opt_class();
  *int v19 = *v19 & 0xFE | objc_opt_isKindOfClass() & 1;

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    -[SATimestamp addSelfToSerializationDictionary:](self->_hidEventTimestamp, "addSelfToSerializationDictionary:", v4);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v7 = self->_steps;
    uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "timestamp", (void)v13);
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 addSelfToSerializationDictionary:v4];

          ++v11;
        }

        while (v9 != v11);
        uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v9);
    }
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  *(void *)&v48[13] = *MEMORY[0x1895F89C0];
  if (a4 <= 0xF)
  {
    int v19 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v46 = a4;
      __int16 v47 = 2048;
      *(void *)uint64_t v48 = 16LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAHIDEvent struct %lu",  buf,  0x16u);
    }

    *__error() = v19;
    _SASetCrashLogMessage(821, "bufferLength %lu < serialized SAHIDEvent struct %lu", v20, v21, v22, v23, v24, v25, a4);
    _os_crash();
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v5 = (uint64_t)a3;
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 1) + 16 > a4)
  {
LABEL_18:
    int v26 = *__error();
    _sa_logt();
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = *(unsigned __int16 *)(v5 + 2);
      *(_DWORD *)buf = 134218496;
      unint64_t v46 = a4;
      __int16 v47 = 1024;
      *(_DWORD *)uint64_t v48 = v28;
      v48[2] = 2048;
      *(void *)&v48[3] = 8 * v28 + 16;
      _os_log_error_impl( &dword_186C92000,  v27,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAHIDEvent struct plus %u children %lu",  buf,  0x1Cu);
    }

    *__error() = v26;
    _SASetCrashLogMessage( 822,  "bufferLength %lu < serialized SAHIDEvent struct plus %u children %lu",  v29,  v30,  v31,  v32,  v33,  v34,  a4);
    _os_crash();
    __break(1u);
LABEL_21:
    int v35 = *__error();
    _sa_logt();
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      int v37 = *(unsigned __int16 *)(v5 + 2);
      *(_DWORD *)buf = 134218240;
      unint64_t v46 = a4;
      __int16 v47 = 1024;
      *(_DWORD *)uint64_t v48 = v37;
      _os_log_error_impl( &dword_186C92000,  v36,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAThread v2 struct with %u thread states",  buf,  0x12u);
    }

    *__error() = v35;
    _SASetCrashLogMessage( 829,  "bufferLength %lu < serialized SAThread v2 struct with %u thread states",  v38,  v39,  v40,  v41,  v42,  v43,  a4);
    _os_crash();
    __break(1u);
LABEL_24:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAHIDEvent version",  0LL);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v44);
  }

  if (*((unsigned __int8 *)a3 + 1) >= 2u)
  {
    if (24 * (unint64_t)*((unsigned __int16 *)a3 + 1) + 18 <= a4)
    {
      int v6 = *((_BYTE *)a3 + 24 * *((unsigned __int16 *)a3 + 1) + 16) & 1;
      goto LABEL_8;
    }

    goto LABEL_21;
  }

  int v6 = *(unsigned __int8 *)gSASerializationEncodedDataIsEmbedded();
LABEL_8:
  if (v6) {
    uint64_t v7 = off_189F604A8;
  }
  else {
    uint64_t v7 = off_189F604A0;
  }
  uint64_t v8 = objc_alloc_init(*v7);
  v8[4] = *(_DWORD *)(v5 + 4);
  uint64_t v9 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:*(unsigned __int16 *)(v5 + 2)];
  uint64_t v10 = (void *)*((void *)v8 + 1);
  *((void *)v8 + 1) = v9;

  if (*(_WORD *)(v5 + 2))
  {
    unint64_t v11 = 0LL;
    id v12 = (unint64_t *)(v5 + 24);
    do
    {
      __int128 v13 = (void *)*((void *)v8 + 1);
      unsigned int v14 = *((_DWORD *)v12 - 2);
      int v15 = *((_DWORD *)v12 - 1);
      unint64_t v16 = *v12;
      v12 += 3;
      +[SAHIDStep hidStepWithDebugId:pid:tid:]((uint64_t)&OBJC_CLASS___SAHIDStep, v14, v15, v16);
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 addObject:v17];

      ++v11;
    }

    while (v11 < *(unsigned __int16 *)(v5 + 2));
  }

  return v8;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  *(void *)&v45[13] = *MEMORY[0x1895F89C0];
  id v41 = a5;
  id v10 = a6;
  if (a4 <= 0xF)
  {
    int v24 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v43 = a4;
      __int16 v44 = 2048;
      *(void *)unint64_t v45 = 16LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)a3,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAHIDEvent struct %lu",  buf,  0x16u);
    }

    *__error() = v24;
    _SASetCrashLogMessage(860, "bufferLength %lu < serialized SAHIDEvent struct %lu", v25, v26, v27, v28, v29, v30, a4);
    _os_crash();
    __break(1u);
    goto LABEL_13;
  }

  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 1) + 16 > a4)
  {
LABEL_13:
    int v31 = *__error();
    _sa_logt();
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = *((unsigned __int16 *)a3 + 1);
      *(_DWORD *)buf = 134218496;
      unint64_t v43 = a4;
      __int16 v44 = 1024;
      *(_DWORD *)unint64_t v45 = v33;
      v45[2] = 2048;
      *(void *)&v45[3] = 8 * v33 + 16;
      _os_log_error_impl( &dword_186C92000,  v32,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAHIDEvent struct plus %u children %lu",  buf,  0x1Cu);
    }

    *__error() = v31;
    _SASetCrashLogMessage( 861,  "bufferLength %lu < serialized SAHIDEvent struct plus %u children %lu",  v34,  v35,  v36,  v37,  v38,  v39,  a4);
    _os_crash();
    __break(1u);
LABEL_16:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAHIDEvent version",  0LL);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v40);
  }

  unint64_t v11 = v10;
  unint64_t v12 = *((void *)a3 + 1);
  __int128 v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v41, v11, v13);
  unsigned int v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  hidEventTimestamp = self->_hidEventTimestamp;
  self->_hidEventTimestamp = v14;

  if (*((_WORD *)a3 + 1))
  {
    unint64_t v16 = 0LL;
    id v17 = (unint64_t *)((char *)a3 + 32);
    do
    {
      unint64_t v18 = *v17;
      v17 += 3;
      int v19 = (void *)objc_opt_class();
      SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v18,  v41,  v11,  v19);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", v16);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = v21;
      if (v21) {
        objc_setProperty_atomic(v21, v22, v20, 16LL);
      }

      ++v16;
    }

    while (v16 < *((unsigned __int16 *)a3 + 1));
  }
}

+ (id)hidEventWithoutReferencesFromPAStyleSerializedHIDEvent:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:",  *(void *)(a2 + 16),  0LL,  *(double *)(a2 + 8),  0.0,  0.0);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = +[SAHIDEvent hidEventWithHIDEventType:atTimestamp:]((uint64_t)&OBJC_CLASS___SAHIDEvent, *(_DWORD *)(a2 + 24), v3);
  if (*(_DWORD *)(a2 + 28) >= 0xFFFFu)
  {
    int v14 = *__error();
    _sa_logt();
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *(_DWORD *)(a2 + 28);
      *(_DWORD *)buf = 67109120;
      int v24 = v16;
      _os_log_error_impl(&dword_186C92000, v15, OS_LOG_TYPE_ERROR, "hid event with %u steps", buf, 8u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(875, "hid event with %u steps", v17, v18, v19, v20, v21, v22, *(_DWORD *)(a2 + 28));
    _os_crash();
    __break(1u);
  }

  uint64_t v5 = (id *)v4;
  uint64_t v6 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:*(unsigned int *)(a2 + 28)];
  id v7 = v5[1];
  v5[1] = (id)v6;

  if (*(_WORD *)(a2 + 28))
  {
    unint64_t v8 = 0LL;
    uint64_t v9 = (unsigned int *)(a2 + 52);
    do
    {
      +[SAHIDStep hidStepWithDebugId:pid:tid:]((uint64_t)&OBJC_CLASS___SAHIDStep, *v9, *(v9 - 1), *(void *)(v9 - 3));
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:",  0LL,  0LL,  *(double *)(a2 + 32),  0.0,  0.0);
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10) {
        objc_setProperty_atomic(v10, v11, v12, 16LL);
      }
      v9 += 6;

      [v5[1] addObject:v10];
      ++v8;
    }

    while (v8 < *(unsigned __int16 *)(a2 + 28));
  }

  return v5;
}

@end