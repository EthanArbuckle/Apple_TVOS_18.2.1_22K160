@interface SAFrame
+ (SAFrame)frameWithPAStyleSerializedFrame:(uint64_t)a1;
+ (id)addStack:(uint64_t)a3 backtraceStyle:(void *)a4 toSetOfRootFrames:;
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (uint64_t)fixupLoadInfosInFrameTree:(void *)a3 binaryLoadInfos:(void *)a4 libraryCache:(void *)a5 uuidsWithNewInstructions:;
+ (void)enumerateFrameTree:(void *)a3 block:;
+ (void)printFrameTree:(id)a3;
+ (void)releaseFrameTree:(uint64_t)a1;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExclave;
- (BOOL)isFakeFrame;
- (BOOL)isKernel;
- (BOOL)isLeafyCallstackIsInAnotherCallTreeFrame;
- (BOOL)isRootFrame;
- (BOOL)isSwiftAsync;
- (BOOL)isSymbolicationOffByOne;
- (BOOL)isTruncatedBacktraceFrame;
- (NSString)debugDescription;
- (SAExclave)exclave;
- (SAInstruction)instruction;
- (id)copyWithNewParent:(id)a3;
- (id)initCopyingFrame:(id)a3 withParent:(id)a4;
- (unint64_t)address;
- (unint64_t)hash;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)_addChildFrame:(uint64_t)a1;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)populateReferencesUsingPAStyleSerializedFrame:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:;
- (void)reset;
- (void)setChildFrameOrFrames:(uint64_t)a1;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SAFrame

- (BOOL)isSwiftAsync
{
  return (self->_BOOLs.bits >> 1) & 1;
}

- (BOOL)isKernel
{
  return (self->_BOOLs.bits >> 2) & 1;
}

- (BOOL)isExclave
{
  return 0;
}

- (SAExclave)exclave
{
  return 0LL;
}

- (BOOL)isSymbolicationOffByOne
{
  if ((self->_BOOLs.bits & 1) == 0) {
    return 0;
  }
  p_binaryLoadInfo = &self->_binaryLoadInfo;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_binaryLoadInfo);
    BOOL v2 = [v6 loadAddress] != self->_address;
  }

  else
  {
    BOOL v2 = 1;
  }

  return v2;
}

- (BOOL)isTruncatedBacktraceFrame
{
  return (self->_BOOLs.bits >> 3) & 1;
}

- (BOOL)isLeafyCallstackIsInAnotherCallTreeFrame
{
  return (self->_BOOLs.bits >> 4) & 1;
}

- (void)reset
{
  self->_BOOLs.bits = 0;
  self->_address = 0LL;
  self->_parentFrame = 0LL;
  objc_storeWeak((id *)&self->_binaryLoadInfo, 0LL);
  id childFrameOrFrames = self->_childFrameOrFrames;
  self->_id childFrameOrFrames = 0LL;
}

- (SAInstruction)instruction
{
  p_binaryLoadInfo = &self->_binaryLoadInfo;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_binaryLoadInfo);
    unint64_t address = self->_address;
    unint64_t v7 = address - -[SAFrame isSymbolicationOffByOne](self, "isSymbolicationOffByOne");
    id v8 = objc_loadWeakRetained((id *)p_binaryLoadInfo);
    objc_msgSend(v5, "instructionAtOffsetIntoLoadInfo:", v7 - objc_msgSend(v8, "loadAddress"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9) {
      objc_storeWeak((id *)p_binaryLoadInfo, 0LL);
    }
  }

  else
  {
    v9 = 0LL;
  }

  return (SAInstruction *)v9;
}

- (id)initCopyingFrame:(id)a3 withParent:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SAFrame;
  unint64_t v7 = -[SAFrame init](&v11, sel_init);
  id v8 = v7;
  if (v7)
  {
    v7->_unint64_t address = *((void *)v6 + 2);
    v7->_parentFrame = (SAFrame *)a4;
    id WeakRetained = objc_loadWeakRetained((id *)v6 + 3);
    objc_storeWeak((id *)&v8->_binaryLoadInfo, WeakRetained);

    v8->_BOOLs.bits = *((_BYTE *)v6 + 8);
  }

  return v8;
}

- (id)copyWithNewParent:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initCopyingFrame:self withParent:v4];

  return v5;
}

- (BOOL)isRootFrame
{
  return self->_parentFrame == 0LL;
}

- (BOOL)isFakeFrame
{
  return -[SAFrame isTruncatedBacktraceFrame](self, "isTruncatedBacktraceFrame")
      || -[SAFrame isLeafyCallstackIsInAnotherCallTreeFrame](self, "isLeafyCallstackIsInAnotherCallTreeFrame");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (self) {
    LOBYTE(self) = self->_BOOLs.bits == *((unsigned __int8 *)v4 + 8) && self->_address == v4[2];
  }

  return (char)self;
}

- (unint64_t)hash
{
  return self->_address;
}

- (void)_addChildFrame:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1 && v4)
  {
    id v21 = v4;
    uint64_t v6 = *(void *)(a1 + 40);
    id v5 = (id *)(a1 + 40);
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        [*v5 addObject:v21];
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v11 = *__error();
          _sa_logt();
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            ClassName = object_getClassName(*v5);
            *(_DWORD *)buf = 136315138;
            v23 = ClassName;
            _os_log_error_impl(&dword_186C92000, v12, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
          }

          *__error() = v11;
          char v14 = object_getClassName(*v5);
          _SASetCrashLogMessage(155, "child is %s", v15, v16, v17, v18, v19, v20, v14);
          _os_crash();
          __break(1u);
        }

        unint64_t v7 = (objc_class *)MEMORY[0x189603FE0];
        id v8 = *v5;
        uint64_t v9 = objc_msgSend([v7 alloc], "initWithObjects:", v8, v21, 0);
        id v10 = *v5;
        *id v5 = (id)v9;
      }
    }

    else
    {
      objc_storeStrong(v5, a2);
    }

    id v4 = v21;
  }
}

+ (id)addStack:(uint64_t)a3 backtraceStyle:(void *)a4 toSetOfRootFrames:
{
  id v6 = a2;
  id v7 = a4;
  objc_opt_self();
  if (v6)
  {
    if (v7)
    {
      *(void *)buf = 0LL;
      v31 = buf;
      uint64_t v32 = 0x3032000000LL;
      v33 = __Block_byref_object_copy_;
      v34 = __Block_byref_object_dispose_;
      id v35 = 0LL;
      v27[0] = MEMORY[0x1895F87A8];
      v27[1] = 3221225472LL;
      v27[2] = __53__SAFrame_addStack_backtraceStyle_toSetOfRootFrames___block_invoke;
      v27[3] = &unk_189F60FC8;
      v29 = buf;
      id v8 = v7;
      id v28 = v8;
      [v6 iterateFramesWithBacktraceStyle:a3 block:v27];
      id v9 = *((id *)v31 + 5);

      _Block_object_dispose(buf, 8);
      return v9;
    }
  }

  else
  {
    int v11 = *__error();
    _sa_logt();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_186C92000, v12, OS_LOG_TYPE_ERROR, "nil frameIterator", buf, 2u);
    }

    *__error() = v11;
    _SASetCrashLogMessage(165, "nil frameIterator", v13, v14, v15, v16, v17, v18, v27[0]);
    _os_crash();
    __break(1u);
  }

  int v19 = *__error();
  _sa_logt();
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_186C92000, v20, OS_LOG_TYPE_ERROR, "nil rootFrames", buf, 2u);
  }

  *__error() = v19;
  _SASetCrashLogMessage(166, "nil rootFrames", v21, v22, v23, v24, v25, v26, v27[0]);
  id result = (id)_os_crash();
  __break(1u);
  return result;
}

void __53__SAFrame_addStack_backtraceStyle_toSetOfRootFrames___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v21 = v3;
  if (!v4)
  {
    [*(id *)(a1 + 32) member:v3];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }

  id v5 = *(id *)(v4 + 40);
  if (!v5)
  {
    id v8 = 0LL;
    goto LABEL_14;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v6 = v5;
    [v6 member:v21];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v12 = *__error();
      _sa_logt();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        ClassName = object_getClassName(v5);
        _os_log_error_impl(&dword_186C92000, v13, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
      }

      *__error() = v12;
      char v14 = object_getClassName(v5);
      _SASetCrashLogMessage(180, "child is %s", v15, v16, v17, v18, v19, v20, v14);
      _os_crash();
      __break(1u);
    }

    id v6 = v5;
    if (![v21 isEqual:v6])
    {
      id v8 = 0LL;
      goto LABEL_13;
    }

    id v7 = v6;
  }

  id v8 = v7;
LABEL_13:

LABEL_14:
  if (v8) {
    goto LABEL_18;
  }
LABEL_15:
  id v8 = (void *)[v21 copyWithNewParent:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v9) {
    -[SAFrame _addChildFrame:](v9, v8);
  }
  else {
    [*(id *)(a1 + 32) addObject:v8];
  }
LABEL_18:
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;
}

+ (void)printFrameTree:(id)a3
{
}

int *__26__SAFrame_printFrameTree___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v4 = a2;
  int v5 = *__error();
  id v6 = (FILE *)*MEMORY[0x1895F89E0];
  int v7 = 2 * a3 - 2;
  id v8 = [v4 debugDescription];
  fprintf(v6, "%*s%p %s\n", v7, ", v4, (const char *)[v8 UTF8String]);

  id result = __error();
  *id result = v5;
  return result;
}

+ (void)enumerateFrameTree:(void *)a3 block:
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  int v5 = a3;
  objc_opt_self();
  if (![v4 count]) {
    goto LABEL_27;
  }
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  int v7 = (void *)[v4 mutableCopy];
  [v6 addObject:v7];

  uint64_t v8 = [v6 lastObject];
  if (!v8) {
    goto LABEL_26;
  }
  uint64_t v9 = v8;
  while (1)
  {
    id v10 = (id)[v6 count];
    [MEMORY[0x189603FE8] null];
    int v11 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 removeLastObject];
LABEL_23:
    uint64_t v19 = [v6 lastObject];

    uint64_t v9 = v19;
    if (!v19) {
      goto LABEL_26;
    }
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v12 = (id)v9;
    uint64_t v13 = [v12 anyObject];
    if (!v13)
    {
      uint64_t v9 = *__error();
      _sa_logt();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_186C92000, v20, OS_LOG_TYPE_ERROR, "No frame in child frames", buf, 2u);
      }

      *__error() = v9;
      _SASetCrashLogMessage(288, "No frame in child frames", v21, v22, v23, v24, v25, v26, v47);
      _os_crash();
      __break(1u);
LABEL_31:
      int v27 = *__error();
      _sa_logt();
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        ClassName = object_getClassName((id)v9);
        *(_DWORD *)buf = 136315138;
        v49 = ClassName;
        _os_log_error_impl(&dword_186C92000, v28, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
      }

      *__error() = v27;
      char v30 = object_getClassName((id)v9);
      _SASetCrashLogMessage(295, "child is %s", v31, v32, v33, v34, v35, v36, v30);
      _os_crash();
      __break(1u);
LABEL_34:
      int v37 = *__error();
      _sa_logt();
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = object_getClassName(v10);
        *(_DWORD *)buf = 136315138;
        v49 = v39;
        _os_log_error_impl(&dword_186C92000, v38, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
      }

      *__error() = v37;
      char v40 = object_getClassName(v10);
      _SASetCrashLogMessage(320, "child is %s", v41, v42, v43, v44, v45, v46, v40);
      _os_crash();
      __break(1u);
    }

    char v14 = (id *)v13;
    [v12 removeObject:v13];
    uint64_t v15 = [v12 count];
    BOOL v16 = v15 == 0;
    if (!v15) {
      [v6 removeLastObject];
    }

    if (!v5) {
      goto LABEL_15;
    }
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_31;
    }
    char v14 = (id *)(id)v9;
    [v6 removeLastObject];
    BOOL v16 = 1;
    if (!v5) {
      goto LABEL_15;
    }
  }

  buf[0] = 0;
  v5[2](v5, v14, v10, buf);
  if (!buf[0])
  {
LABEL_15:
    id v10 = v14[5];
    if (v10)
    {
      if (v16)
      {
        [MEMORY[0x189603FE8] null];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 addObject:v17];
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v18 = (void *)[v10 mutableCopy];
        [v6 addObject:v18];
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_34;
        }
        [v6 addObject:v10];
      }
    }

    goto LABEL_23;
  }

LABEL_26:
LABEL_27:
}

+ (void)releaseFrameTree:(uint64_t)a1
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  id v3 = v2;
  id v4 = v3;
  if (v3)
  {
    int v5 = (id *)v3;
    do
    {
      id v6 = v5[5];
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v7 = v6;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          id v8 = v7;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v58 count:16];
          if (!v9) {
            goto LABEL_14;
          }
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v49;
LABEL_7:
          uint64_t v12 = 0LL;
          while (1)
          {
            if (*(void *)v49 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
            if (v13)
            {
              if (v13[5]) {
                break;
              }
            }

            if (v10 == ++v12)
            {
              uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v58 count:16];
              if (!v10)
              {
LABEL_14:

                goto LABEL_18;
              }

              goto LABEL_7;
            }
          }

          uint64_t v15 = v13;

          goto LABEL_21;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_28;
        }
        char v14 = v6;
        if (v14[5])
        {
          uint64_t v15 = v14;
LABEL_21:

          if (v5 != v15[4])
          {
            int v19 = *__error();
            _sa_logt();
            uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              id v21 = [v5 debugDescription];
              uint64_t v22 = [v21 UTF8String];
              id v23 = [v15 debugDescription];
              uint64_t v24 = [v23 UTF8String];
              id v25 = v15[4];
              id v26 = [v25 debugDescription];
              uint64_t v27 = [v26 UTF8String];
              *(_DWORD *)buf = 136315650;
              uint64_t v53 = v22;
              __int16 v54 = 2080;
              uint64_t v55 = v24;
              __int16 v56 = 2080;
              uint64_t v57 = v27;
              _os_log_error_impl( &dword_186C92000,  v20,  OS_LOG_TYPE_ERROR,  "Frame %s child %s has different parent %s",  buf,  0x20u);
            }

            *__error() = v19;
            id v28 = [v5 debugDescription];
            id v6 = (id)[v28 UTF8String];
            id v29 = [v15 debugDescription];
            [v29 UTF8String];
            id v30 = v15[4];
            id v31 = [v30 debugDescription];
            [v31 UTF8String];
            _SASetCrashLogMessage( 249,  "Frame %s child %s has different parent %s",  v32,  v33,  v34,  v35,  v36,  v37,  (char)v6);

            _os_crash();
            __break(1u);
LABEL_28:
            int v38 = *__error();
            _sa_logt();
            v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              ClassName = object_getClassName(v6);
              *(_DWORD *)buf = 136315138;
              uint64_t v53 = (uint64_t)ClassName;
              _os_log_error_impl(&dword_186C92000, v39, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
            }

            *__error() = v38;
            char v41 = object_getClassName(v6);
            _SASetCrashLogMessage(240, "child is %s", v42, v43, v44, v45, v46, v47, v41);
            _os_crash();
            __break(1u);
          }

          uint64_t v18 = v15;
          uint64_t v17 = v18;
          goto LABEL_23;
        }

- (void)setChildFrameOrFrames:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

+ (uint64_t)fixupLoadInfosInFrameTree:(void *)a3 binaryLoadInfos:(void *)a4 libraryCache:(void *)a5 uuidsWithNewInstructions:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_self();
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  uint64_t v25 = 0LL;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __91__SAFrame_fixupLoadInfosInFrameTree_binaryLoadInfos_libraryCache_uuidsWithNewInstructions___block_invoke;
  v17[3] = &unk_189F61030;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  id v21 = &v22;
  id v14 = v11;
  id v20 = v14;
  +[SAFrame enumerateFrameTree:block:]((uint64_t)&OBJC_CLASS___SAFrame, v8, v17);
  uint64_t v15 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __91__SAFrame_fixupLoadInfosInFrameTree_binaryLoadInfos_libraryCache_uuidsWithNewInstructions___block_invoke( void *a1,  void *a2)
{
  id v18 = a2;
  char v3 = [v18 isFakeFrame];
  id v4 = v18;
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = [v18 address];
    if (v18) {
      id WeakRetained = objc_loadWeakRetained(v18 + 3);
    }
    else {
      id WeakRetained = 0LL;
    }
    +[SABinaryLoadInfo binaryLoadInfoForAddress:inBinaryLoadInfos:libraryCache:]( &OBJC_CLASS___SABinaryLoadInfo,  "binaryLoadInfoForAddress:inBinaryLoadInfos:libraryCache:",  v5,  a1[4],  a1[5]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v18;
    if (v18)
    {
      objc_storeWeak(v18 + 3, v7);
      id v8 = v18;
    }

    [v8 instruction];

    if (v7)
    {
      if (a1[6])
      {
        if (!WeakRetained) {
          goto LABEL_11;
        }
        uint64_t v9 = [v7 loadAddress];
        if (v9 != [WeakRetained loadAddress]) {
          goto LABEL_11;
        }
        [v7 binary];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 uuid];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [WeakRetained binary];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 uuid];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        char v14 = [v11 isEqual:v13];

        if ((v14 & 1) == 0)
        {
LABEL_11:
          uint64_t v15 = (void *)a1[6];
          [v7 binary];
          id v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 uuid];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 addObject:v17];
        }
      }
    }

    else
    {
      ++*(void *)(*(void *)(a1[7] + 8LL) + 24LL);
    }

    id v4 = v18;
  }
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(NSString);
  -[SAFrame instruction](self, "instruction");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 debugDescription];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t address = self->_address;
  BOOL v7 = -[SAFrame isSwiftAsync](self, "isSwiftAsync");
  BOOL v8 = -[SAFrame isKernel](self, "isKernel");
  BOOL v9 = -[SAFrame isExclave](self, "isExclave");
  uint64_t v24 = v4;
  BOOL v23 = v8;
  if (v9)
  {
    uint64_t v10 = -[SAFrame exclave](self, "exclave");
    BOOL v11 = v7;
    if (v10)
    {
      id v21 = (void *)v10;
      -[SAFrame exclave](self, "exclave");
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v22 name];
      if (v12)
      {
        int v13 = 0;
        int v14 = 1;
        id v20 = (void *)v12;
        uint64_t v15 = (__CFString *)v12;
      }

      else
      {
        id v16 = objc_alloc(NSString);
        -[SAFrame exclave](self, "exclave");
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = (__CFString *)objc_msgSend(v16, "initWithFormat:", @"0x%llx", objc_msgSend(v19, "identifier"));
        id v20 = 0LL;
        int v14 = 1;
        int v13 = 1;
      }
    }

    else
    {
      id v21 = 0LL;
      int v14 = 0;
      int v13 = 0;
      uint64_t v15 = @"yes";
    }
  }

  else
  {
    BOOL v11 = v7;
    int v14 = 0;
    int v13 = 0;
    uint64_t v15 = @"no";
  }

  uint64_t v17 = (void *)[v3 initWithFormat:@"%@ [0x%llx] (swift:%d kernel:%d exclave:%@ offByOne:%d trunc:%d anotherCallTree:%d)", v5, address, v11, v23, v15, self->_BOOLs.bits & 1, -[SAFrame isTruncatedBacktraceFrame](self, "isTruncatedBacktraceFrame"), -[SAFrame isLeafyCallstackIsInAnotherCallTreeFrame](self, "isLeafyCallstackIsInAnotherCallTreeFrame")];
  if (v13)
  {
  }

  if (v14)
  {
  }

  if (v9) {

  }
  return (NSString *)v17;
}

- (unint64_t)address
{
  return self->_address;
}

- (void).cxx_destruct
{
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_address];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryFirstEntry(v4, (uint64_t)@"address", v5);

  -[SAFrame instruction](self, "instruction");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);

  if (!WeakRetained) {
    goto LABEL_24;
  }
  unint64_t address = self->_address;
  id v9 = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);
  unint64_t v10 = address - [v9 loadAddress];

  id v11 = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);
  [v11 binary];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  id v13 = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);
  [v13 segment];
  int v14 = (void *)objc_claimAutoreleasedReturnValue();

  [v12 uuid];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 UUIDString];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v4, @"binary", v16);

  if (v14)
  {
    uint64_t v17 = (void *)MEMORY[0x189607968];
    uint64_t v18 = [v14 offsetIntoBinary];
  }

  else
  {
    uint64_t v18 = 0LL;
    uint64_t v17 = (void *)MEMORY[0x189607968];
  }

  [v17 numberWithUnsignedLongLong:v18 + v10];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v4, @"offsetIntoBinary", v19);

LABEL_7:
  uint64_t v20 = [v12 path];
  if (v20)
  {
    id v21 = (void *)v20;
    [v12 uuid];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    int v23 = +[SABinary haveMultipleBinariesWithUUID:]((uint64_t)&OBJC_CLASS___SABinary, v22);

    if (v23)
    {
      [v12 path];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      SAJSONWriteDictionaryEntry(v4, @"binaryPath", v24);
    }
  }

  if (v14)
  {
    [v14 name];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v4, @"segment", v25);

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v10];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v4, @"offsetIntoSegment", v26);
  }

  if (-[SAFrame isSwiftAsync](self, "isSwiftAsync")) {
    SAJSONWriteDictionaryEntry(v4, @"isSwiftAsync", MEMORY[0x189604A88]);
  }
  if (-[SAFrame isKernel](self, "isKernel")) {
    SAJSONWriteDictionaryEntry(v4, @"isKernelFrame", MEMORY[0x189604A88]);
  }
  if (-[SAFrame isExclave](self, "isExclave"))
  {
    -[SAFrame exclave](self, "exclave");
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 name];
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      SAJSONWriteDictionaryEntry(v4, @"exclave", v28);
    }

    else
    {
      id v29 = (void *)MEMORY[0x189607968];
      -[SAFrame exclave](self, "exclave");
      id v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "numberWithUnsignedLongLong:", objc_msgSend(v30, "identifier"));
      id v31 = (void *)objc_claimAutoreleasedReturnValue();
      SAJSONWriteDictionaryEntry(v4, @"exclave", v31);
    }
  }

  if ([v6 numSymbols])
  {
    [v4 appendString:@",symbols:["];
    v33[0] = MEMORY[0x1895F87A8];
    v33[1] = 3221225472LL;
    v33[2] = __65__SAFrame_JSONSerialization__writeJSONDictionaryEntriesToStream___block_invoke;
    v33[3] = &unk_189F61058;
    id v32 = v4;
    id v34 = v32;
    id v35 = v6;
    uint64_t v36 = self;
    [v35 enumerateSymbols:v33];
    [v32 appendString:@"]"];
  }

LABEL_24:
}

void __65__SAFrame_JSONSerialization__writeJSONDictionaryEntriesToStream___block_invoke( id *a1,  void *a2,  void *a3,  uint64_t a4)
{
  id v17 = a2;
  id v7 = a3;
  if (a4) {
    [a1[4] appendString:@","];
  }
  [a1[4] appendString:@"{"];
  id v8 = a1[4];
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  objc_msgSend(a1[5], "offsetIntoSegment")
  - [v17 offsetIntoSegment]
  + [a1[6] isSymbolicationOffByOne]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryFirstEntry(v8, (uint64_t)@"offsetIntoSymbol", v9);

  [v17 name];
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10) {
    SAJSONWriteDictionaryEntry(a1[4], @"symbolName", v10);
  }
  if (v7)
  {
    id v11 = a1[4];
    [v7 filePath];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v11, @"sourceFilepath", v12);

    id v13 = a1[4];
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend(v7, "lineNum"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v13, @"sourceLineNum", v14);

    if ([v7 columnNum])
    {
      id v15 = a1[4];
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend(v7, "columnNum"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      SAJSONWriteDictionaryEntry(v15, @"sourceColumnNum", v16);
    }
  }

  [a1[4] appendString:@"}"];
}

+ (id)classDictionaryKey
{
  return @"SAFrame";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  if (!self->_childFrameOrFrames) {
    return 39LL;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return 8 * [self->_childFrameOrFrames count] + 39;
  }
  else {
    return 47LL;
  }
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (-[SAFrame sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v19 = *__error();
    _sa_logt();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = -[SAFrame debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v65 = [v21 UTF8String];
      __int16 v66 = 2048;
      *(void *)v67 = -[SAFrame sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_WORD *)&v67[8] = 2048;
      *(void *)&v67[10] = a4;
      _os_log_error_impl(&dword_186C92000, v20, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v19;
    -[SAFrame debugDescription](self, "debugDescription");
    a3 = ($EFA45576BF6DEE313F13E7E768BFDECF *) objc_claimAutoreleasedReturnValue();
    char v22 = -[$EFA45576BF6DEE313F13E7E768BFDECF UTF8String](a3, "UTF8String");
    -[SAFrame sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(1276, "%s: size %lu != buffer length %lu", v23, v24, v25, v26, v27, v28, v22);

    _os_crash();
    __break(1u);
    goto LABEL_21;
  }

  *(_WORD *)&a3->var0 = 1025;
  *(void *)(&a3->var1 + 1) = self->_address;
  *((_BYTE *)&a3->var4 + 6) = *((_BYTE *)&a3->var4 + 6) & 0xFE | -[SAFrame isKernel](self, "isKernel");
  if (-[SAFrame isSwiftAsync](self, "isSwiftAsync")) {
    char v9 = 2;
  }
  else {
    char v9 = 0;
  }
  char v10 = *((_BYTE *)&a3->var4 + 6) & 0xFD | v9;
  *((_BYTE *)&a3->var4 + 6) = v10;
  *((_BYTE *)&a3->var4 + 6) = (4 * (self->_BOOLs.bits & 1)) | v10 & 0xFB;
  if (-[SAFrame isExclave](self, "isExclave")) {
    char v11 = 8;
  }
  else {
    char v11 = 0;
  }
  *((_BYTE *)&a3->var4 + 6) = *((_BYTE *)&a3->var4 + 6) & 0xF7 | v11;
  -[SAFrame instruction](self, "instruction");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(v12, v8);

  *(unint64_t *)((char *)&a3->var3 + 6) = SASerializableIndexForPointerFromSerializationDictionary( self->_parentFrame,  v8);
  a4 = (unint64_t)&a3->var4 + 7;
  if (self->_childFrameOrFrames)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v13 = self->_childFrameOrFrames;
      if ((unint64_t)[v13 count] >= 0xFFFFFFFF)
      {
LABEL_24:
        int v42 = *__error();
        _sa_logt();
        uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v44 = -[SAFrame debugDescription](self, "debugDescription");
          uint64_t v45 = [v44 UTF8String];
          uint64_t v46 = [v13 count];
          *(_DWORD *)buf = 136315394;
          uint64_t v65 = v45;
          __int16 v66 = 2048;
          *(void *)v67 = v46;
          _os_log_error_impl(&dword_186C92000, v43, OS_LOG_TYPE_ERROR, "%s has %lu children", buf, 0x16u);
        }

        *__error() = v42;
        -[SAFrame debugDescription](self, "debugDescription");
        self = (SAFrame *) objc_claimAutoreleasedReturnValue();
        char v47 = -[SAFrame UTF8String](self, "UTF8String");
        [v13 count];
        _SASetCrashLogMessage(1294, "%s has %lu children", v48, v49, v50, v51, v52, v53, v47);

        _os_crash();
        __break(1u);
LABEL_27:
        int v54 = *__error();
        _sa_logt();
        uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          ClassName = object_getClassName(self->_childFrameOrFrames);
          *(_DWORD *)buf = 136315138;
          uint64_t v65 = (uint64_t)ClassName;
          _os_log_error_impl(&dword_186C92000, v55, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
        }

        *__error() = v54;
        char v57 = object_getClassName(self->_childFrameOrFrames);
        _SASetCrashLogMessage(1298, "child is %s", v58, v59, v60, v61, v62, v63, v57);
        _os_crash();
        __break(1u);
      }

      unsigned int v14 = [v13 count];
      *(_DWORD *)((char *)&a3->var3 + 2) = v14;
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var4 + 7, v14, v13, v8);
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_27;
      }
      id childFrameOrFrames = self->_childFrameOrFrames;
      *(_DWORD *)((char *)&a3->var3 + 2) = 1;
      id v13 = childFrameOrFrames;
      *(void *)((char *)&a3->var4 + 7) = SASerializableIndexForPointerFromSerializationDictionary(v13, v8);
    }
  }

  else
  {
    *(_DWORD *)((char *)&a3->var3 + 2) = 0;
  }

  id v16 = (uint64_t *)(a4 + 8LL * *(unsigned int *)((char *)&a3->var3 + 2));
  -[SAFrame exclave](self, "exclave");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  *id v16 = SASerializableIndexForPointerFromSerializationDictionary(v17, v8);

  if ((char *)v16 - (char *)a3 + 8 != -[SAFrame sizeInBytesForSerializedVersion]( self,  "sizeInBytesForSerializedVersion"))
  {
LABEL_21:
    int v29 = *__error();
    _sa_logt();
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = -[SAFrame debugDescription](self, "debugDescription");
      uint64_t v32 = [v31 UTF8String];
      uint64_t v33 = *(unsigned int *)((char *)&a3->var3 + 2);
      unint64_t v34 = -[SAFrame sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_DWORD *)buf = 136315906;
      uint64_t v65 = v32;
      __int16 v66 = 1024;
      *(_DWORD *)v67 = v33;
      *(_WORD *)&v67[4] = 2048;
      *(void *)&v67[6] = a4 + 8 * v33 - (void)a3;
      *(_WORD *)&v67[14] = 2048;
      *(void *)&v67[16] = v34;
      _os_log_error_impl( &dword_186C92000,  v30,  OS_LOG_TYPE_ERROR,  "%s: after serializing (with %u children), ended with length %ld, should be %lu",  buf,  0x26u);
    }

    *__error() = v29;
    id v35 = -[SAFrame debugDescription](self, "debugDescription");
    id v13 = (id)[v35 UTF8String];
    -[SAFrame sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage( 1311,  "%s: after serializing (with %u children), ended with length %ld, should be %lu",  v36,  v37,  v38,  v39,  v40,  v41,  (char)v13);

    _os_crash();
    __break(1u);
    goto LABEL_24;
  }

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v26 = a3;
  id v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", self, 0);
  while ([v4 count])
  {
    uint64_t v5 = (void *)MEMORY[0x186E47ACC]();
    uint64_t v6 = [v4 lastObject];
    [v4 removeLastObject];
    [(id)objc_opt_class() classDictionaryKey];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v8 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v26, (void *)v6, v7);

    if (v8)
    {
      [(id)v6 instruction];
      char v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 addSelfToSerializationDictionary:v26];

      if (v6)
      {
        char v10 = *(void **)(v6 + 32);
        id v11 = v10;
        if (v10) {
          [v4 addObject:v11];
        }
        id WeakRetained = objc_loadWeakRetained((id *)(v6 + 24));
      }

      else
      {
        id v11 = 0LL;
        id WeakRetained = 0LL;
      }

      [WeakRetained addSelfToSerializationDictionary:v26];

      [(id)v6 exclave];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 addSelfToSerializationDictionary:v26];

      if (v6)
      {
        id v14 = *(id *)(v6 + 40);
        if (v14)
        {
          id v15 = v14;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v15 allObjects];
            id v16 = (void *)objc_claimAutoreleasedReturnValue();
            [v4 addObjectsFromArray:v16];
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              int v17 = *__error();
              _sa_logt();
              uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                ClassName = object_getClassName(v15);
                _os_log_error_impl(&dword_186C92000, v18, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
              }

              *__error() = v17;
              char v19 = object_getClassName(v15);
              _SASetCrashLogMessage(1343, "child is %s", v20, v21, v22, v23, v24, v25, v19);
              _os_crash();
              __break(1u);
            }

            [v4 addObject:v15];
          }
        }
      }
    }

    objc_autoreleasePoolPop(v5);
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  *(void *)&v35[13] = *MEMORY[0x1895F89C0];
  if (*(unsigned __int8 *)a3 >= 5u)
  {
LABEL_32:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAFrame version",  0LL);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v30);
    goto LABEL_33;
  }

  uint64_t v5 = (SAFrame *)a4;
  if (a4 <= 0x1E)
  {
    int v14 = *__error();
    uint64_t v4 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v33 = v5;
      __int16 v34 = 2048;
      *(void *)id v35 = 31LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)v4,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAFrame struct %lu",  buf,  0x16u);
    }

    *__error() = v14;
    _SASetCrashLogMessage( 1358,  "bufferLength %lu < serialized SAFrame struct %lu",  v15,  v16,  v17,  v18,  v19,  v20,  (char)v5);
    _os_crash();
    __break(1u);
    goto LABEL_29;
  }

  uint64_t v4 = (uint64_t)a3;
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 18) + 31 > a4)
  {
LABEL_29:
    int v21 = *__error();
    _sa_logt();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(unsigned int *)(v4 + 18);
      *(_DWORD *)buf = 134218496;
      uint64_t v33 = v5;
      __int16 v34 = 1024;
      *(_DWORD *)id v35 = v23;
      v35[2] = 2048;
      *(void *)&v35[3] = 8 * v23 + 31;
      _os_log_error_impl( &dword_186C92000,  v22,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAFrame struct plus %u children %lu",  buf,  0x1Cu);
    }

    *__error() = v21;
    _SASetCrashLogMessage( 1359,  "bufferLength %lu < serialized SAFrame struct plus %u children %lu",  v24,  v25,  v26,  v27,  v28,  v29,  (char)v5);
    _os_crash();
    __break(1u);
    goto LABEL_32;
  }

  if (*((unsigned __int8 *)a3 + 1) >= 4u && (*((_BYTE *)a3 + 30) & 8) != 0)
  {
    uint64_t v5 = (SAFrame *)-[SAExclaveFrame initWithExclave:](objc_alloc(&OBJC_CLASS___SAExclaveFrame), 0LL);
    int v6 = 1;
  }

  else
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___SAFrame);
    int v6 = 0;
  }

  unint64_t v7 = *(void *)(v4 + 2);
  if (v5)
  {
    v5->_unint64_t address = v7;
    v5->_BOOLs.unsigned __int8 bits = v5->_BOOLs.bits & 0xFB | (4 * (*(_BYTE *)(v4 + 30) & 1));
    unint64_t v7 = *(void *)(v4 + 2);
  }

  if (v7)
  {
    char v8 = 0;
    if (!v5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  if (*(void *)(v4 + 22) == -1LL) {
    int v6 = 1;
  }
  if (v6) {
    char v8 = 8;
  }
  else {
    char v8 = 0;
  }
  if (v5) {
LABEL_12:
  }
    v5->_BOOLs.unsigned __int8 bits = v5->_BOOLs.bits & 0xF7 | v8;
LABEL_13:
  unsigned int v9 = *(unsigned __int8 *)(v4 + 1);
  if (v9 < 2) {
    char v10 = 0;
  }
  else {
    char v10 = *(_BYTE *)(v4 + 30) & 2;
  }
  if (!v5)
  {
LABEL_33:
    if (v9 > 2) {
      return v5;
    }
    goto LABEL_34;
  }

  p_BOOLs = &v5->_BOOLs;
  unsigned __int8 bits = v5->_BOOLs.bits & 0xFD | v10;
  v5->_BOOLs.unsigned __int8 bits = bits;
  if (*(unsigned __int8 *)(v4 + 1) >= 3u)
  {
    int v13 = (*(unsigned __int8 *)(v4 + 30) >> 2) & 1;
LABEL_39:
    p_BOOLs->unsigned __int8 bits = bits & 0xFE | v13;
    return v5;
  }

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v153 = *MEMORY[0x1895F89C0];
  id v11 = a5;
  unint64_t v12 = (unint64_t)a6;
  int v13 = (_BYTE *)gFrameTreeBeingDecoded();
  if (!*v13)
  {
    v143 = v13;
    *int v13 = 1;
    if (*(unsigned __int8 *)a3 <= 4u)
    {
      unint64_t v6 = -1LL;
      while (1)
      {
        if (a4 <= 0x1E) {
          goto LABEL_51;
        }
        unint64_t v14 = *(void *)((char *)a3 + 22);
        if (v14 == -1LL) {
          goto LABEL_14;
        }
        uint64_t v15 = (void *)objc_opt_class();
        uint64_t v16 = (unsigned __int8 *)SASerializableBufferForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v14,  v11,  (void *)v12,  v15);
        if (v16) {
          BOOL v18 = v17 > 0x1E;
        }
        else {
          BOOL v18 = 0;
        }
        if (!v18) {
          goto LABEL_57;
        }
        a4 = v17;
        unint64_t v6 = *(void *)((char *)a3 + 22);
        a3 = v16;
        if (*v16 > 4u) {
          goto LABEL_13;
        }
      }

+ (SAFrame)frameWithPAStyleSerializedFrame:(uint64_t)a1
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SAFrame);
  unint64_t v4 = *(void *)(a2 + 8);
  if (v3)
  {
    v3->_unint64_t address = v4;
    v3->_BOOLs.unsigned __int8 bits = v3->_BOOLs.bits & 0xFB | (4 * (*(_BYTE *)(a2 + 17) != 0));
    unint64_t v4 = *(void *)(a2 + 8);
  }

  if (!v4)
  {
    uint64_t v5 = (8 * (*(void *)(a2 + 26) == -1LL));
    if (!v3) {
      return v3;
    }
    goto LABEL_5;
  }

  LOBYTE(v5) = 0;
  if (v3)
  {
LABEL_5:
    unsigned __int8 v6 = v3->_BOOLs.bits & 0xF7 | v5;
    v3->_BOOLs.unsigned __int8 bits = v6;
    v3->_BOOLs.unsigned __int8 bits = v6 & 0xFE | (*(void *)(a2 + 18) != 0LL);
  }

  return v3;
}

- (void)populateReferencesUsingPAStyleSerializedFrame:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    unint64_t v9 = *(void *)(a2 + 26);
    char v10 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v9, v7, v8, v10, 0);
    Property = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = Property;
    if (Property) {
      Property = objc_getProperty(Property, v12, 8LL, 1);
    }
    *(void *)(a1 + 32) = Property;
    uint64_t v14 = a2 + 34;
    uint64_t v15 = *(void *)(a2 + 18);
    uint64_t v16 = (void *)objc_opt_class();
    SASerializableNewMutableSetFromIndexList(v14, v15, v7, v8, v16);
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v17 count] == 1)
    {
      [v17 anyObject];
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = v18;
      if (v18) {
        id v21 = objc_getProperty(v18, v19, 8LL, 1);
      }
      else {
        id v21 = 0LL;
      }
      objc_storeStrong((id *)(a1 + 40), v21);
    }

    else if ((unint64_t)[v17 count] < 2)
    {
      uint64_t v33 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0LL;
    }

    else
    {
      id v34 = v7;
      uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x189603FE0]), "initWithCapacity:", objc_msgSend(v17, "count"));
      uint64_t v23 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v22;

      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      id v24 = v17;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v25)
      {
        uint64_t v27 = v25;
        uint64_t v28 = *(void *)v36;
        do
        {
          for (uint64_t i = 0LL; i != v27; ++i)
          {
            if (*(void *)v36 != v28) {
              objc_enumerationMutation(v24);
            }
            id v30 = *(id *)(*((void *)&v35 + 1) + 8 * i);
            id v31 = *(void **)(a1 + 40);
            if (v30) {
              id v30 = objc_getProperty(v30, v26, 8LL, 1);
            }
            id v32 = v30;
            [v31 addObject:v32];
          }

          uint64_t v27 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }

        while (v27);
      }

      id v7 = v34;
    }
  }
}

@end