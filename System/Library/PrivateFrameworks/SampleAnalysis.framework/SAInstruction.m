@interface SAInstruction
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)hasOffsetIntoBinary;
- (BOOL)hasSourceInfo;
- (BOOL)symbolicateWithOptions:(unint64_t)a3 pid:(int)a4;
- (BOOL)symbolicateWithOptions:(unint64_t)a3 pid:(int)a4 additionalCSSymbolicatorFlags:(unsigned int)a5;
- (NSString)debugDescription;
- (SABinary)binary;
- (SASegment)segment;
- (SASourceInfo)sourceInfo;
- (SASymbol)symbol;
- (id)realSegment;
- (int64_t)offsetIntoBinary;
- (uint64_t)enumerateSymbolsNullable:(void *)a1;
- (unint64_t)enumerateSymbols:(id)a3;
- (unint64_t)numSymbols;
- (unint64_t)offsetIntoSegment;
- (unint64_t)offsetIntoTextSegment;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)checkForNewSymbol;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)setSymbol:(void *)a3 sourceinfo:;
@end

@implementation SAInstruction

- (void)checkForNewSymbol
{
  v80[16] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    unint64_t v1 = a1[5];
    uint64_t v65 = 0LL;
    v66 = &v65;
    uint64_t v67 = 0x3032000000LL;
    v68 = __Block_byref_object_copy__2;
    v69 = __Block_byref_object_dispose__2;
    id v70 = 0LL;
    uint64_t v59 = 0LL;
    v60 = &v59;
    uint64_t v61 = 0x3032000000LL;
    v62 = __Block_byref_object_copy__2;
    v63 = __Block_byref_object_dispose__2;
    id v64 = 0LL;
    uint64_t v53 = 0LL;
    v54 = &v53;
    uint64_t v55 = 0x3032000000LL;
    v56 = __Block_byref_object_copy__2;
    v57 = __Block_byref_object_dispose__2;
    id v58 = 0LL;
    uint64_t v47 = 0LL;
    v48 = &v47;
    uint64_t v49 = 0x3032000000LL;
    v50 = __Block_byref_object_copy__2;
    v51 = __Block_byref_object_dispose__2;
    id v52 = 0LL;
    v32 = a1;
    v2 = -[SAInstruction realSegment]((id *)a1);
    uint64_t v3 = MEMORY[0x1895F87A8];
    v40[0] = MEMORY[0x1895F87A8];
    v40[1] = 3221225472LL;
    v41 = __34__SAInstruction_checkForNewSymbol__block_invoke;
    v42 = &unk_189F62F90;
    v43 = &v65;
    v44 = &v53;
    v45 = &v59;
    v46 = &v47;
    v39 = v40;
    v4 = v2;
    if (v2)
    {
      v5 = v2;
      objc_sync_enter(v5);
      id obj = v5;
      v6 = -[SASegment nonInlineSymbolAtOffsetIntoSegment:](v5, v1);
      v7 = v6;
      if (v6)
      {
        v8 = v6;
        objc_sync_enter(v8);
        id v9 = v8[4];
        if (v9
          && (v80[0] = v3,
              v80[1] = 3221225472LL,
              v80[2] = __51__SASymbol_nonInlineSourceInfoAtOffsetIntoSegment___block_invoke,
              v80[3] = &__block_descriptor_40_e22_q16__0__SASourceInfo_8l,
              v80[4] = v1,
              uint64_t v10 = SABinarySearchArray(v9, 0, (uint64_t)v80),
              v10 != 0x7FFFFFFFFFFFFFFFLL))
        {
          objc_msgSend(v8[4], "objectAtIndexedSubscript:", v10, v32);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          v11 = 0LL;
        }

        objc_sync_exit(v8);

        v41(v39, v8, v11);
        v12 = (void *)v5[2];
        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v8, "offsetIntoSegment"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 objectForKeyedSubscript:v13];
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        __int128 v77 = 0u;
        __int128 v78 = 0u;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        id v15 = v14;
        uint64_t v38 = [v15 countByEnumeratingWithState:&v75 objects:v80 count:16];
        if (v38)
        {
          uint64_t v16 = *(void *)v76;
          v36 = v7;
          v37 = v4;
          uint64_t v34 = *(void *)v76;
          id v35 = v15;
          do
          {
            uint64_t v17 = 0LL;
            do
            {
              if (*(void *)v76 != v16) {
                objc_enumerationMutation(v15);
              }
              v18 = *(void **)(*((void *)&v75 + 1) + 8 * v17);
              uint64_t v19 = objc_msgSend(v18, "offsetIntoSegment", v32);
              if ([v18 length] + v19 > v1)
              {
                if ([v18 offsetIntoSegment] > v1) {
                  goto LABEL_35;
                }
                __int128 v73 = 0u;
                __int128 v74 = 0u;
                __int128 v71 = 0u;
                __int128 v72 = 0u;
                if (v18) {
                  id Property = objc_getProperty(v18, v20, 32LL, 1);
                }
                else {
                  id Property = 0LL;
                }
                id v22 = Property;
                uint64_t v23 = [v22 countByEnumeratingWithState:&v71 objects:v79 count:16];
                if (!v23)
                {

LABEL_30:
                  v41(v39, v18, 0LL);
                  goto LABEL_31;
                }

                char v24 = 0;
                uint64_t v25 = *(void *)v72;
                do
                {
                  for (uint64_t i = 0LL; i != v23; ++i)
                  {
                    if (*(void *)v72 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    v27 = *(void **)(*((void *)&v71 + 1) + 8 * i);
                    uint64_t v28 = [v27 offsetIntoSegment];
                    if ([v27 length] + v28 > v1)
                    {
                      if ([v27 offsetIntoSegment] > v1) {
                        goto LABEL_27;
                      }
                      v41(v39, v18, v27);
                      char v24 = 1;
                    }
                  }

                  uint64_t v23 = [v22 countByEnumeratingWithState:&v71 objects:v79 count:16];
                }

                while (v23);
LABEL_27:

                v7 = v36;
                v4 = v37;
                uint64_t v16 = v34;
                id v15 = v35;
                if ((v24 & 1) == 0) {
                  goto LABEL_30;
                }
              }

- (void)setSymbol:(void *)a3 sourceinfo:
{
  id v8 = a2;
  id v6 = a3;
  if (a1)
  {
    v7 = a1;
    objc_sync_enter(v7);
    objc_storeStrong(v7 + 1, a2);
    objc_storeStrong(v7 + 2, a3);
    objc_sync_exit(v7);
  }
}

- (BOOL)hasOffsetIntoBinary
{
  p_segment = &self->_segment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_segment);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_segment);
    char v5 = [v4 hasOffsetIntoBinary];
  }

  else
  {
    char v5 = 1;
  }

  return v5;
}

- (int64_t)offsetIntoBinary
{
  p_segment = &self->_segment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_segment);

  if (!WeakRetained) {
    return self->_offsetIntoSegment;
  }
  id v5 = objc_loadWeakRetained((id *)p_segment);
  int v6 = [v5 hasOffsetIntoBinary];

  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t offsetIntoSegment = self->_offsetIntoSegment;
  id v8 = objc_loadWeakRetained((id *)p_segment);
  int64_t v9 = [v8 offsetIntoBinary] + offsetIntoSegment;

  return v9;
}

- (id)realSegment
{
  unint64_t v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 4);
    uint64_t v3 = WeakRetained;
    if (WeakRetained)
    {
      unint64_t v1 = (id *)WeakRetained;
    }

    else
    {
      id v4 = objc_loadWeakRetained(v1 + 3);
      -[SABinary createFakeEntireBinarySegment](v4);
      unint64_t v1 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v1;
}

- (BOOL)symbolicateWithOptions:(unint64_t)a3 pid:(int)a4
{
  return -[SAInstruction symbolicateWithOptions:pid:additionalCSSymbolicatorFlags:]( self,  "symbolicateWithOptions:pid:additionalCSSymbolicatorFlags:",  a3,  *(void *)&a4,  0LL);
}

- (BOOL)symbolicateWithOptions:(unint64_t)a3 pid:(int)a4 additionalCSSymbolicatorFlags:(unsigned int)a5
{
  if (self)
  {
    if (self->_sourceInfoOrSourceInfos) {
      return 0;
    }
    BOOL v10 = self->_symbolOrSymbols != 0LL;
  }

  else
  {
    BOOL v10 = 0;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
  if (!WeakRetained) {
    return 0;
  }
  v12 = WeakRetained;
  uint64_t v13 = -[SABinary symbolOwnerWrapperWithOptions:pid:checkExclave:additionalCSSymbolicatorFlags:](WeakRetained, a3, a4, 1, a5);
  if (v13)
  {
    v14 = -[SAInstruction realSegment]((id *)&self->super.isa);
    uint64_t v15 = -[SASegment baseAddressInSymbolOwnerWrapper:](v14, (void *)v13);
    if (v15 == -1)
    {
      BOOL v9 = 0;
    }

    else
    {
      uint64_t v16 = v15;
      id v23 = 0LL;
      id v24 = 0LL;
      unint64_t offsetIntoSegment = self->_offsetIntoSegment;
      objc_copyStruct(dest, (const void *)(v13 + 16), 16LL, 1, 0);
      -[SASegment symbolicateOffsetIntoSegment:symbolOwner:segmentBaseAddress:returningSymbols:sourceInfos:]( v14,  offsetIntoSegment,  dest[0],  dest[1],  v16,  &v24,  &v23);
      id v19 = v23;
      id v18 = v24;
      -[SAInstruction setSymbol:sourceinfo:](self, v24, v23);
      id sourceInfoOrSourceInfos = self->_sourceInfoOrSourceInfos;
      BOOL v9 = sourceInfoOrSourceInfos != 0LL;
      if (sourceInfoOrSourceInfos) {
        char v21 = 1;
      }
      else {
        char v21 = v10;
      }
      if ((v21 & 1) == 0) {
        BOOL v9 = self->_symbolOrSymbols != 0LL;
      }
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __34__SAInstruction_checkForNewSymbol__block_invoke(void *a1, void *a2, void *a3)
{
  id v23 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[4] + 8LL);
  uint64_t v9 = *(void *)(v7 + 40);
  id v8 = (id *)(v7 + 40);
  if (!v9)
  {
    objc_storeStrong(v8, a2);
    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), a3);
    goto LABEL_16;
  }

  BOOL v10 = *(void **)(*(void *)(a1[6] + 8LL) + 40LL);
  if (v10)
  {
    [v10 addObject:v23];
    uint64_t v11 = *(void *)(a1[7] + 8LL);
    v12 = *(void **)(v11 + 40);
    if (v6)
    {
      [*(id *)(v11 + 40) addObject:v6];
      goto LABEL_16;
    }

    [MEMORY[0x189603FE8] null];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 addObject:v18];
LABEL_15:

    goto LABEL_16;
  }

  uint64_t v13 = objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithObjects:",  *(void *)(*(void *)(a1[4] + 8) + 40),  v23,  0);
  uint64_t v14 = *(void *)(a1[6] + 8LL);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  id v16 = objc_alloc(MEMORY[0x189603FA8]);
  uint64_t v17 = *(void **)(*(void *)(a1[5] + 8LL) + 40LL);
  id v18 = v17;
  if (!v17)
  {
    [MEMORY[0x189603FE8] null];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  id v19 = v6;
  if (!v6)
  {
    [MEMORY[0x189603FE8] null];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v20 = objc_msgSend(v16, "initWithObjects:", v18, v19, 0);
  uint64_t v21 = *(void *)(a1[7] + 8LL);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  if (!v6) {
  if (!v17)
  }
    goto LABEL_15;
LABEL_16:
}

- (unint64_t)numSymbols
{
  return -[SAInstruction enumerateSymbolsNullable:](self, 0LL);
}

- (uint64_t)enumerateSymbolsNullable:(void *)a1
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  unint64_t v4 = a2;
  if (!a1)
  {
LABEL_38:
    uint64_t v14 = 0LL;
    goto LABEL_25;
  }

  id v5 = a1;
  objc_sync_enter(v5);
  id v6 = v5[1];
  uint64_t v7 = (os_log_s *)v5[2];
  objc_sync_exit(v5);

  if (!v6)
  {
    uint64_t v14 = 0LL;
    goto LABEL_24;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (v4) {
          (*(void (**)(unint64_t, id, os_log_s *, void))(v4 + 16))(v4, v6, v7, 0LL);
        }
        uint64_t v14 = 1LL;
        goto LABEL_24;
      }
    }

    else
    {
      int v16 = *__error();
      _sa_logt();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        ClassName = object_getClassName(v6);
        _os_log_error_impl(&dword_186C92000, v7, OS_LOG_TYPE_ERROR, "symbol is %s", buf, 0xCu);
      }

      *__error() = v16;
      char v17 = object_getClassName(v6);
      _SASetCrashLogMessage(4305, "symbol is %s", v18, v19, v20, v21, v22, v23, v17);
      _os_crash();
      __break(1u);
    }

    int v24 = *__error();
    _sa_logt();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = [v6 debugDescription];
      v2 = (char *)[v26 UTF8String];
      uint64_t v27 = -[os_log_s count](v7, "count");
      uint64_t v28 = object_getClassName(v7);
      *(_DWORD *)buf = 136315650;
      ClassName = v2;
      __int16 v59 = 2048;
      uint64_t v60 = v27;
      __int16 v61 = 2080;
      v62 = v28;
      _os_log_error_impl(&dword_186C92000, v25, OS_LOG_TYPE_ERROR, "1 symbol %s, but %lu source infos (%s)", buf, 0x20u);
    }

    *__error() = v24;
    id v29 = [v6 debugDescription];
    char v30 = [v29 UTF8String];
    id v8 = (os_log_s *)-[os_log_s count](v7, "count");
    object_getClassName(v7);
    _SASetCrashLogMessage(4306, "1 symbol %s, but %lu source infos (%s)", v31, v32, v33, v34, v35, v36, v30);

    _os_crash();
    __break(1u);
    goto LABEL_32;
  }

  v2 = (char *)v6;
  if (v4)
  {
    id v8 = v7;
    if (!v8)
    {
LABEL_8:
      if ([v2 count])
      {
        uint64_t v10 = 0LL;
        while (1)
        {
          if (!v8) {
            goto LABEL_13;
          }
          -[os_log_s objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", v10);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189603FE8] null];
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 == v12) {
            break;
          }
LABEL_14:
          [v2 objectAtIndexedSubscript:v10];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(unint64_t, void *, void *, uint64_t))(v4 + 16))(v4, v13, v11, v10);
        }

LABEL_13:
        uint64_t v11 = 0LL;
        goto LABEL_14;
      }

- (BOOL)hasSourceInfo
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v2 = self->_sourceInfoOrSourceInfos;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }

  else
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v4 = v2;
    uint64_t v3 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0LL; i != v3; ++i)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v4);
          }
          uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x189603FE8], "null", (void)v10);
          id v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7 != v8)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }

        uint64_t v3 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }

- (unint64_t)enumerateSymbols:(id)a3
{
  return -[SAInstruction enumerateSymbolsNullable:](self, a3);
}

- (NSString)debugDescription
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
  uint64_t v28 = MEMORY[0x1895F87A8];
  uint64_t v29 = 3221225472LL;
  char v30 = __33__SAInstruction_debugDescription__block_invoke;
  uint64_t v31 = &unk_189F62FB8;
  id v4 = v3;
  id v32 = v4;
  uint64_t v33 = self;
  uint64_t v5 = (void (**)(void, void, void))MEMORY[0x186E47C94](&v28);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ([self->_symbolOrSymbols count])
    {
      unint64_t v6 = 0LL;
      char v7 = 1;
      do
      {
        if ((v7 & 1) == 0) {
          objc_msgSend(v4, "appendString:", @", ");
        }
        [self->_symbolOrSymbols objectAtIndexedSubscript:v6];
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        [self->_sourceInfoOrSourceInfos objectAtIndexedSubscript:v6];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189603FE8] null];
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 == v10)
        {

          uint64_t v9 = 0LL;
        }

        ((void (**)(void, void *, void *))v5)[2](v5, v8, v9);

        ++v6;
        unint64_t v11 = [self->_symbolOrSymbols count];
        char v7 = 0;
      }

      while (v6 < v11);
    }
  }

  else if (self->_symbolOrSymbols)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v18 = *__error();
      _sa_logt();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        ClassName = object_getClassName(self->_symbolOrSymbols);
        *(_DWORD *)buf = 136315138;
        uint64_t v35 = ClassName;
        _os_log_error_impl(&dword_186C92000, v19, OS_LOG_TYPE_ERROR, "symbol is %s", buf, 0xCu);
      }

      *__error() = v18;
      char v21 = object_getClassName(self->_symbolOrSymbols);
      _SASetCrashLogMessage(4340, "symbol is %s", v22, v23, v24, v25, v26, v27, v21);
      _os_crash();
      __break(1u);
    }

    ((void (**)(void, id, id))v5)[2](v5, self->_symbolOrSymbols, self->_sourceInfoOrSourceInfos);
  }

  else
  {
    [v4 appendFormat:@"???"];
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_segment);

  if (WeakRetained) {
    p_segment = (id *)&self->_segment;
  }
  else {
    p_segment = (id *)&self->_binary;
  }
  id v14 = objc_loadWeakRetained(p_segment);
  [v14 debugDescription];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 appendFormat:@" (%@ + %llu)", v15, self->_offsetIntoSegment, v28, v29, v30, v31];

  id v16 = v4;
  return (NSString *)v16;
}

void __33__SAInstruction_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v6 debugDescription];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 40LL);
  uint64_t v9 = [v6 offsetIntoSegment];

  [v5 appendFormat:@"%@ + %llu", v7, v8 - v9];
  if (v12)
  {
    __int128 v10 = *(void **)(a1 + 32);
    [v12 debugDescription];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 appendFormat:@" (%@ + %llu)", v11, *(void *)(*(void *)(a1 + 40) + 40) - objc_msgSend(v12, "offsetIntoSegment")];
  }
}

- (unint64_t)offsetIntoTextSegment
{
  return self->_offsetIntoSegment;
}

- (SASourceInfo)sourceInfo
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v2 = self;
  objc_sync_enter(v2);
  if (v2->_sourceInfoOrSourceInfos)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v2->_sourceInfoOrSourceInfos firstObject];
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189603FE8] null];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3 == v4) {
        id v5 = 0LL;
      }
      else {
        id v5 = v3;
      }
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v7 = *__error();
        _sa_logt();
        uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          ClassName = object_getClassName(v2->_sourceInfoOrSourceInfos);
          *(_DWORD *)buf = 136315138;
          int v18 = ClassName;
          _os_log_error_impl(&dword_186C92000, v8, OS_LOG_TYPE_ERROR, "source info is %s", buf, 0xCu);
        }

        *__error() = v7;
        char v10 = object_getClassName(v2->_sourceInfoOrSourceInfos);
        _SASetCrashLogMessage(4371, "source info is %s", v11, v12, v13, v14, v15, v16, v10);
        _os_crash();
        __break(1u);
      }

      id v5 = v2->_sourceInfoOrSourceInfos;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  objc_sync_exit(v2);

  return (SASourceInfo *)v5;
}

- (SASymbol)symbol
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v2 = self;
  objc_sync_enter(v2);
  id symbolOrSymbols = v2->_symbolOrSymbols;
  if (symbolOrSymbols)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v2->_symbolOrSymbols firstObject];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v6 = *__error();
        _sa_logt();
        int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          ClassName = object_getClassName(v2->_symbolOrSymbols);
          *(_DWORD *)buf = 136315138;
          char v17 = ClassName;
          _os_log_error_impl(&dword_186C92000, v7, OS_LOG_TYPE_ERROR, "symbol is %s", buf, 0xCu);
        }

        *__error() = v6;
        char v9 = object_getClassName(v2->_symbolOrSymbols);
        _SASetCrashLogMessage(4385, "symbol is %s", v10, v11, v12, v13, v14, v15, v9);
        _os_crash();
        __break(1u);
      }

      id v4 = v2->_symbolOrSymbols;
    }

    id symbolOrSymbols = v4;
  }

  objc_sync_exit(v2);

  return (SASymbol *)symbolOrSymbols;
}

- (SABinary)binary
{
  return (SABinary *)objc_loadWeakRetained((id *)&self->_binary);
}

- (SASegment)segment
{
  return (SASegment *)objc_loadWeakRetained((id *)&self->_segment);
}

- (unint64_t)offsetIntoSegment
{
  return self->_offsetIntoSegment;
}

- (void).cxx_destruct
{
}

+ (id)classDictionaryKey
{
  return @"SAInstruction";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  unint64_t v2 = -[SAInstruction numSymbols](self, "numSymbols");
  if (v2 <= 1) {
    return 99LL;
  }
  else {
    return 56 * v2 + 43;
  }
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (-[SAInstruction sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v19 = *__error();
    _sa_logt();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = -[SAInstruction debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v34 = [v21 UTF8String];
      __int16 v35 = 2048;
      unint64_t v36 = -[SAInstruction sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v37 = 2048;
      unint64_t v38 = a4;
      _os_log_error_impl(&dword_186C92000, v20, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v19;
    id v22 = -[SAInstruction debugDescription](self, "debugDescription");
    char v23 = [v22 UTF8String];
    -[SAInstruction sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(5505, "%s: size %lu != buffer length %lu", v24, v25, v26, v27, v28, v29, v23);

    _os_crash();
    __break(1u);
  }

  *(_WORD *)&a3->var0 = 1025;
  *(void *)(&a3->var1 + 1) = self->_offsetIntoSegment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
  [WeakRetained uuid];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10) {
    [v10 getUUIDBytes:(char *)&a3->var2 + 2];
  }
  else {
    uuid_clear((unsigned __int8 *)&a3->var2 + 2);
  }
  id v11 = objc_loadWeakRetained((id *)&self->_segment);

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_segment);
    *(void *)((char *)&a3->var4.var6 + 2) = SASerializableIndexForPointerFromSerializationDictionary(v12, v8);
  }

  else
  {
    *(void *)((char *)&a3->var4.var6 + 2) = -1LL;
  }

  v30[0] = MEMORY[0x1895F87A8];
  v30[1] = 3221225472LL;
  v30[2] = __98__SAInstruction_Serialization__addSelfToBuffer_bufferLength_withCompletedSerializationDictionary___block_invoke;
  v30[3] = &unk_189F63048;
  id v31 = v8;
  id v32 = a3;
  id v13 = v8;
  unint64_t v14 = -[SAInstruction enumerateSymbols:](self, "enumerateSymbols:", v30);
  if (v14 != 1)
  {
    if (v14)
    {
      BYTE2(a3->var5) = v14 - 1;
      unsigned int v15 = (v14 - 1);
      goto LABEL_13;
    }

    *(unint64_t *)((char *)&a3->var4.var1 + 2) = -1LL;
    *(unint64_t *)((char *)&a3->var4.var4 + 2) = -1LL;
  }

  unsigned int v15 = 0;
  BYTE2(a3->var5) = 0;
LABEL_13:
  uint64_t v16 = (char *)a3 + 56 * v15;
  id v17 = objc_loadWeakRetained((id *)&self->_binary);
  *(void *)(v16 + 91) = SASerializableIndexForPointerFromSerializationDictionary(v17, v13);

  return 1;
}

void __98__SAInstruction_Serialization__addSelfToBuffer_bufferLength_withCompletedSerializationDictionary___block_invoke( uint64_t a1,  void *a2,  void *a3,  uint64_t a4)
{
  id v15 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = v7 + 26;
  uint64_t v9 = v7 + 56 * a4 + 35;
  if (a4) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = v8;
  }
  id v11 = a2;
  *(void *)uint64_t v10 = [v11 offsetIntoSegment];
  *(void *)(v10 + 8) = [v11 length];
  [v11 name];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  *(void *)(v10 + 16) = SASerializableIndexForPointerFromSerializationDictionary(v12, *(void **)(a1 + 32));
  id v13 = v15;
  if (v15)
  {
    *(void *)(v10 + 24) = [v15 offsetIntoSegment];
    *(_DWORD *)(v10 + 48) = [v15 lineNum];
    *(_DWORD *)(v10 + 52) = [v15 columnNum];
    *(void *)(v10 + 32) = [v15 length];
    [v15 filePath];
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)(v10 + 40) = SASerializableIndexForPointerFromSerializationDictionary(v14, *(void **)(a1 + 32));

    id v13 = v15;
  }

  else
  {
    *(void *)(v10 + 40) = -1LL;
  }
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_binary);

    if (WeakRetained)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_binary);
      [v8 addSelfToSerializationDictionary:v4];
    }

    id v9 = objc_loadWeakRetained((id *)&self->_segment);

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_segment);
      [v10 addSelfToSerializationDictionary:v4];
    }

    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __65__SAInstruction_Serialization__addSelfToSerializationDictionary___block_invoke;
    v11[3] = &unk_189F63070;
    id v12 = v4;
    -[SAInstruction enumerateSymbols:](self, "enumerateSymbols:", v11);
  }
}

void __65__SAInstruction_Serialization__addSelfToSerializationDictionary___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v8 = a3;
  [a2 name];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 addSelfToSerializationDictionary:*(void *)(a1 + 32)];

  BOOL v6 = v8;
  if (v8)
  {
    [v8 filePath];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 addSelfToSerializationDictionary:*(void *)(a1 + 32)];

    BOOL v6 = v8;
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_self());
  objc_storeWeak(v4 + 3, 0LL);
  v4[5] = 0LL;
  return v4;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  id v10 = a6;
  if (a4 <= 0x19)
  {
    int v29 = *__error();
    _sa_logt();
    char v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v52 = a4;
      __int16 v53 = 2048;
      uint64_t v54 = 26LL;
      _os_log_error_impl( &dword_186C92000,  v30,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAInstruction struct %lu",  buf,  0x16u);
    }

    *__error() = v29;
    _SASetCrashLogMessage( 5596,  "bufferLength %lu < serialized SAInstruction struct %lu",  v31,  v32,  v33,  v34,  v35,  v36,  a4);
    _os_crash();
    __break(1u);
LABEL_29:
    int v37 = *__error();
    _sa_logt();
    unint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v52 = a4;
      __int16 v53 = 2048;
      uint64_t v54 = 91LL;
      _os_log_error_impl( &dword_186C92000,  v38,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAInstruction struct v3 %lu",  buf,  0x16u);
    }

    *__error() = v37;
    _SASetCrashLogMessage( 5626,  "bufferLength %lu < serialized SAInstruction struct v3 %lu",  v39,  v40,  v41,  v42,  v43,  v44,  a4);
    _os_crash();
    __break(1u);
LABEL_32:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAInstruction version",  0LL);
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v45);
  }

  id v11 = v10;
  if (*((unsigned __int8 *)a3 + 1) < 4u)
  {
    if (uuid_is_null((const unsigned __int8 *)a3 + 10))
    {
      id v14 = 0LL;
      goto LABEL_25;
    }

    uuidForBytes((uint64_t)a3 + 10);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SABinary binaryWithUUID:absolutePath:](&OBJC_CLASS___SABinary, "binaryWithUUID:absolutePath:", v15, 0LL);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unint64_t v12 = *(void *)((char *)a3 + 56 * *((unsigned __int8 *)a3 + 90) + 91);
    id v13 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v9, v11, v13, 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14) {
      goto LABEL_25;
    }
  }

  unsigned int v16 = *((unsigned __int8 *)a3 + 1);
  if (v16 < 2) {
    goto LABEL_25;
  }
  if (v16 != 2)
  {
    if (a4 > 0x5A)
    {
      uint64_t v20 = (uint64_t *)gSASerializationEncodedVersionBeingDecoded();
      if (*v20 <= 30) {
        *(void *)gBinaryBeingDecoded(&gBinaryBeingDecoded) = v14;
      }
      unint64_t v21 = *(void *)((char *)a3 + 82);
      id v22 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v21, v9, v11, v22, 0);
      char v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (*v20 <= 30) {
        *(void *)gBinaryBeingDecoded(&gBinaryBeingDecoded) = 0LL;
      }
      LODWORD(v24) = *((unsigned __int8 *)a3 + 90);
      goto LABEL_21;
    }

    goto LABEL_29;
  }

  -[SABinary segmentWithCleanName:](v14, @"__TEXT_EXEC");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }

  else
  {
    -[SABinary segmentWithCleanName:](v14, @"__TEXT");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }

  char v23 = v19;

  LODWORD(v24) = 0;
LABEL_21:
  v46[0] = MEMORY[0x1895F87A8];
  v46[1] = 3221225472LL;
  v46[2] = __128__SAInstruction_Serialization__populateReferencesUsingBuffer_bufferLength_andDeserializationDictionary_andDataBufferDictionary___block_invoke;
  v46[3] = &unk_189F63098;
  id v47 = v9;
  id v48 = v11;
  id v25 = v23;
  id v49 = v25;
  id v14 = v14;
  id v50 = v14;
  uint64_t v26 = (void (**)(void, void, void))MEMORY[0x186E47C94](v46);
  ((void (**)(void, char *, uint64_t))v26)[2](v26, (char *)a3 + 26, -1LL);
  if ((_DWORD)v24)
  {
    uint64_t v27 = *(void *)((char *)a3 + 26);
    uint64_t v28 = (char *)a3 + 91;
    uint64_t v24 = v24;
    do
    {
      ((void (**)(void, char *, uint64_t))v26)[2](v26, v28, v27);
      v28 += 56;
      --v24;
    }

    while (v24);
  }

LABEL_25:
}

void __128__SAInstruction_Serialization__populateReferencesUsingBuffer_bufferLength_andDeserializationDictionary_andDataBufferDictionary___block_invoke( uint64_t a1,  uint64_t a2,  unint64_t a3)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  unint64_t v6 = *(void *)(a2 + 16);
  if (v6 != -1LL || *(void *)a2 || *(void *)(a2 + 8))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = *(void **)(a1 + 40);
    id v9 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v6, v7, v8, v9, 0);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = *(void **)(a1 + 48);
    if (v11)
    {
      if (a3 == -1LL)
      {
        uint64_t v12 = -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](v11, *(void *)a2, *(void *)(a2 + 8), v10);
      }

      else
      {
        if (!v10)
        {
          int v25 = *__error();
          _sa_logt();
          uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            -[SASegment nonInlineSymbolAtOffsetIntoSegment:](*(void **)(a1 + 48), a3);
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
            [v27 debugDescription];
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
            [*(id *)(a1 + 48) debugDescription];
            int v29 = (void *)objc_claimAutoreleasedReturnValue();
            int v30 = 138412546;
            uint64_t v31 = v28;
            __int16 v32 = 2112;
            uint64_t v33 = v29;
            _os_log_error_impl( &dword_186C92000,  v26,  OS_LOG_TYPE_ERROR,  "No symbol name for inline symbol (after non-inline symbol %@ in %@)",  (uint8_t *)&v30,  0x16u);
          }

          id v13 = 0LL;
          *__error() = v25;
          goto LABEL_18;
        }

        uint64_t v12 = -[SASegment addInlineSymbolWithOffsetIntoSegment:length:name:nonInlineSymbolOffsetIntoSegment:]( v11,  *(void *)a2,  *(void *)(a2 + 8),  v10,  a3);
      }
    }

    else
    {
      uint64_t v12 = -[SABinary addSymbolWithOffsetIntoBinary:length:name:]( *(void **)(a1 + 56),  *(void *)a2,  *(void *)(a2 + 8),  v10);
    }

    id v13 = (void *)v12;
    unint64_t v14 = *(void *)(a2 + 40);
    if (v14 != -1LL)
    {
      unsigned int v16 = *(void **)(a1 + 32);
      id v15 = *(void **)(a1 + 40);
      id v17 = (void *)objc_opt_class();
      SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v14,  v16,  v15,  v17);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v19 = *(void *)(a2 + 24);
      uint64_t v20 = *(void *)(a2 + 32);
      int v21 = *(_DWORD *)(a2 + 48);
      int v22 = *(_DWORD *)(a2 + 52);
      if (a3 == -1LL) {
        id v24 =  -[SASymbol addNonInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:]( v13,  v19,  v20,  v21,  v22,  v18);
      }
      else {
        id v23 =  -[SASymbol addInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:]( v13,  v19,  v20,  v21,  v22,  v18);
      }
    }

@end