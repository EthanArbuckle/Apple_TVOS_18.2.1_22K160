@interface SASegment
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
+ (id)segmentWithBinary:(void *)a3 name:(uint64_t)a4 length:;
+ (id)segmentWithBinary:(void *)a3 name:(uint64_t)a4 length:(uint64_t)a5 offsetIntoBinary:;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)hasOffsetIntoBinary;
- (BOOL)isEmpty;
- (NSString)debugDescription;
- (NSString)name;
- (SABinary)binary;
- (SASegment)initWithBinary:(id)a3 name:(id)a4 length:(unint64_t)a5 offsetIntoBinary:(int64_t)a6;
- (id)addInlineSymbolWithOffsetIntoSegment:(uint64_t)a3 length:(void *)a4 name:(unint64_t)a5 nonInlineSymbolOffsetIntoSegment:;
- (id)instructionAtOffsetIntoSegment:(unint64_t)a3;
- (id)nonInlineSymbolAtOffsetIntoSegment:(void *)a1;
- (int64_t)offsetIntoBinary;
- (uint64_t)baseAddressInSymbolOwnerWrapper:(void *)a1;
- (unint64_t)length;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addNonInlineSymbolWithOffsetIntoSegment:(unint64_t)a3 length:(void *)a4 name:;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)grabInstructionsFromOtherSegment:(id *)a1;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)setLength:(void *)a1;
- (void)symbolicateOffsetIntoSegment:(uint64_t)a3 symbolOwner:(uint64_t)a4 segmentBaseAddress:(uint64_t)a5 returningSymbols:(id *)a6 sourceInfos:(id *)a7;
- (void)symbolicateWithSymbolOwnerWrapper:(void *)a1;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SASegment

- (BOOL)isEmpty
{
  if (!a1) {
    return 0LL;
  }
  v1 = a1;
  objc_sync_enter(v1);
  if ([v1[7] count]) {
    BOOL v2 = 0LL;
  }
  else {
    BOOL v2 = [v1[1] count] == 0;
  }
  objc_sync_exit(v1);

  return v2;
}

- (SASegment)initWithBinary:(id)a3 name:(id)a4 length:(unint64_t)a5 offsetIntoBinary:(int64_t)a6
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SASegment;
  v12 = -[SASegment init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_binary, v10);
    objc_storeStrong((id *)&v13->_name, a4);
    v13->_length = a5;
    v13->_offsetIntoBinary = a6;
    if (a5 >> 28)
    {
      if ([v11 containsString:@"TEXT"])
      {
        int v15 = *__error();
        _sa_logt();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          -[SASegment debugDescription](v13, "debugDescription");
          id v17 = v19 = v15;
          uint64_t v18 = [v17 UTF8String];
          *(_DWORD *)buf = 136315394;
          uint64_t v22 = v18;
          __int16 v23 = 2048;
          unint64_t v24 = a5;
          _os_log_fault_impl(&dword_186C92000, v16, OS_LOG_TYPE_FAULT, "%s has length above max: 0x%llx", buf, 0x16u);

          int v15 = v19;
        }

        *__error() = v15;
      }
    }
  }

  return v13;
}

+ (id)segmentWithBinary:(void *)a3 name:(uint64_t)a4 length:(uint64_t)a5 offsetIntoBinary:
{
  id v8 = a3;
  id v9 = a2;
  id v10 = (void *)[objc_alloc((Class)objc_opt_self()) initWithBinary:v9 name:v8 length:a4 offsetIntoBinary:a5];

  return v10;
}

+ (id)segmentWithBinary:(void *)a3 name:(uint64_t)a4 length:
{
  id v6 = a3;
  id v7 = a2;
  id v8 = (objc_class *)objc_opt_self();
  id v9 = v6;
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v11 = (void *)[[v8 alloc] initWithBinary:v7 name:v9 length:a4 offsetIntoBinary:v10];

  return v11;
}

- (BOOL)hasOffsetIntoBinary
{
  return self->_offsetIntoBinary != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(void *)a1
{
  uint64_t v84 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  v3 = a1;
  objc_sync_enter(v3);
  if (!a2)
  {
LABEL_31:
    int v43 = *__error();
    _sa_logt();
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      id v45 = [v3 debugDescription];
      uint64_t v46 = [v45 UTF8String];
      *(_DWORD *)buf = 136315138;
      uint64_t v76 = v46;
      _os_log_error_impl(&dword_186C92000, v44, OS_LOG_TYPE_ERROR, "%s: setting length 0", buf, 0xCu);
    }

    *__error() = v43;
    [v3 debugDescription];
    a2 = (unint64_t) objc_claimAutoreleasedReturnValue();
    char v47 = [(id)a2 UTF8String];
    _SASetCrashLogMessage(151, "%s: setting length 0", v48, v49, v50, v51, v52, v53, v47);

    _os_crash();
    __break(1u);
    goto LABEL_34;
  }

  if (v3[3])
  {
LABEL_34:
    int v54 = *__error();
    _sa_logt();
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      id v56 = [v3 debugDescription];
      uint64_t v57 = [v56 UTF8String];
      id v58 = v3[3];
      *(_DWORD *)buf = 136315650;
      uint64_t v76 = v57;
      __int16 v77 = 2048;
      unint64_t v78 = a2;
      __int16 v79 = 2048;
      uint64_t v80 = (uint64_t)v58;
      _os_log_error_impl( &dword_186C92000,  v55,  OS_LOG_TYPE_ERROR,  "%s: setting length to %llu when it was already %llu",  buf,  0x20u);
    }

    *__error() = v54;
    id v59 = [v3 debugDescription];
    char v60 = [v59 UTF8String];
    _SASetCrashLogMessage(152, "%s: setting length to %llu when it was already %llu", v61, v62, v63, v64, v65, v66, v60);

    _os_crash();
    __break(1u);
    goto LABEL_37;
  }

  v3[3] = (id)a2;
  if (a2 >> 28)
  {
LABEL_37:
    int v67 = *__error();
    _sa_logt();
    v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
    {
      id v69 = [v3 debugDescription];
      uint64_t v70 = [v69 UTF8String];
      *(_DWORD *)buf = 136315394;
      uint64_t v76 = v70;
      __int16 v77 = 2048;
      unint64_t v78 = a2;
      _os_log_fault_impl(&dword_186C92000, v68, OS_LOG_TYPE_FAULT, "%s has length above max: 0x%llx", buf, 0x16u);
    }

    *__error() = v67;
  }

  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  [v3[7] allKeys];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v71 objects:v83 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v72;
    while (2)
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v72 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        if ([v8 unsignedLongLongValue] >= (unint64_t)v3[3])
        {
          uint64_t v9 = [v3[7] objectForKeyedSubscript:v8];
          uint64_t v10 = (id *)v9;
          if (v9)
          {
            id v11 = *(id *)(v9 + 8);
            if (v11)
            {
              id v12 = v11;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                [v12 firstObject];
                id v13 = (id)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_28;
                }
                id v13 = v12;
              }

              v14 = v13;
              BOOL v15 = [v13 length] == 0;

              if (!v15)
              {
                int v16 = *__error();
                _sa_logt();
                id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  id v18 = [v3 debugDescription];
                  uint64_t v19 = [v18 UTF8String];
                  id v20 = v3[3];
                  uint64_t v21 = [v8 unsignedLongLongValue];
                  id v22 = [v10 debugDescription];
                  uint64_t v23 = [v22 UTF8String];
                  *(_DWORD *)buf = 136315906;
                  uint64_t v76 = v19;
                  __int16 v77 = 2048;
                  unint64_t v78 = (unint64_t)v20;
                  __int16 v79 = 2048;
                  uint64_t v80 = v21;
                  __int16 v81 = 2080;
                  uint64_t v82 = v23;
                  _os_log_error_impl( &dword_186C92000,  v17,  OS_LOG_TYPE_ERROR,  "%s: setting length to %llu when we have a symbol at offset %llu: %s",  buf,  0x2Au);
                }

                *__error() = v16;
                id v24 = [v3 debugDescription];
                char v25 = [v24 UTF8String];
                id v12 = v3[3];
                [v8 unsignedLongLongValue];
                id v26 = [v10 debugDescription];
                [v26 UTF8String];
                _SASetCrashLogMessage( 166,  "%s: setting length to %llu when we have a symbol at offset %llu: %s",  v27,  v28,  v29,  v30,  v31,  v32,  v25);

                _os_crash();
                __break(1u);
LABEL_28:
                int v33 = *__error();
                _sa_logt();
                v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  ClassName = object_getClassName(v12);
                  *(_DWORD *)buf = 136315138;
                  uint64_t v76 = (uint64_t)ClassName;
                  _os_log_error_impl(&dword_186C92000, v34, OS_LOG_TYPE_ERROR, "symbol is %s", buf, 0xCu);
                }

                *__error() = v33;
                char v36 = object_getClassName(v12);
                _SASetCrashLogMessage(4151, "symbol is %s", v37, v38, v39, v40, v41, v42, v36);
                _os_crash();
                __break(1u);
                goto LABEL_31;
              }
            }

            objc_storeWeak(v10 + 3, 0LL);
            objc_storeWeak(v10 + 4, 0LL);
          }

          [v3[7] setObject:0 forKeyedSubscript:v8];
        }
      }

      uint64_t v5 = [v4 countByEnumeratingWithState:&v71 objects:v83 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  objc_sync_exit(v3);
}

- (void)grabInstructionsFromOtherSegment:(id *)a1
{
  uint64_t v180 = *MEMORY[0x1895F89C0];
  v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    v126 = v3;
    id v5 = objc_loadWeakRetained(v3 + 6);

    if (WeakRetained != v5)
    {
      int v103 = *__error();
      _sa_logt();
      v104 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
        id v105 = [a1 debugDescription];
        uint64_t v106 = [v105 UTF8String];
        id v107 = [v126 debugDescription];
        *(_DWORD *)buf = 136315394;
        uint64_t v167 = v106;
        __int16 v168 = 2080;
        uint64_t v169 = [v107 UTF8String];
        _os_log_error_impl(&dword_186C92000, v104, OS_LOG_TYPE_ERROR, "%s grabbing from %s", buf, 0x16u);
      }

      *__error() = v103;
      id v108 = [a1 debugDescription];
      char v109 = [v108 UTF8String];
      id v110 = [v126 debugDescription];
      [v110 UTF8String];
      _SASetCrashLogMessage(186, "%s grabbing from %s", v111, v112, v113, v114, v115, v116, v109);

      _os_crash();
      __break(1u);
    }

    v3 = v126;
    if ([a1 hasOffsetIntoBinary])
    {
      if ([v126 hasOffsetIntoBinary]
        && ([v126[7] count] || objc_msgSend(v126[1], "count")))
      {
        uint64_t v6 = [v126 offsetIntoBinary];
        id v7 = a1;
        objc_sync_enter(v7);
        [v126[7] allKeys];
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sortedArrayUsingSelector:");
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

        __int128 v164 = 0u;
        __int128 v165 = 0u;
        __int128 v162 = 0u;
        __int128 v163 = 0u;
        obuint64_t j = v9;
        uint64_t v137 = [obj countByEnumeratingWithState:&v162 objects:v179 count:16];
        if (v137)
        {
          id v133 = *(id *)v163;
          do
          {
            for (uint64_t i = 0LL; i != v137; ++i)
            {
              if (*(id *)v163 != v133) {
                objc_enumerationMutation(obj);
              }
              id v11 = *(void **)(*((void *)&v162 + 1) + 8 * i);
              uint64_t v12 = [v11 unsignedLongLongValue] + v6;
              id v13 = v7[5];
              uint64_t v14 = v12 - (void)v13;
              if (v12 >= (uint64_t)v13)
              {
                uint64_t v15 = [v126[7] objectForKeyedSubscript:v11];
                id v16 = v7[7];
                if (!v16)
                {
                  uint64_t v17 = objc_msgSend( objc_alloc(MEMORY[0x189603FC8]),  "initWithCapacity:",  objc_msgSend(v126[7], "count"));
                  id v18 = v7[7];
                  v7[7] = (id)v17;

                  id v16 = v7[7];
                }

                [MEMORY[0x189607968] numberWithUnsignedLongLong:v14];
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
                [v16 objectForKeyedSubscript:v19];
                id v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (v20)
                {
                  int v21 = *__error();
                  _sa_logt();
                  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    [v7 debugDescription];
                    v131 = (void *)objc_claimAutoreleasedReturnValue();
                    [v20 debugDescription];
                    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
                    [(id)v15 debugDescription];
                    id v24 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    uint64_t v167 = (uint64_t)v131;
                    __int16 v168 = 2112;
                    uint64_t v169 = (uint64_t)v23;
                    __int16 v170 = 2112;
                    uint64_t v171 = (uint64_t)v24;
                    _os_log_impl( &dword_186C92000,  v22,  OS_LOG_TYPE_DEFAULT,  "WARNING: %@: have existing instruction %@ when grabbing %@, dropping grabbed instruction",  buf,  0x20u);
                  }

                  *__error() = v21;
                  if (v15)
                  {
                    objc_storeWeak((id *)(v15 + 32), 0LL);
                    objc_storeWeak((id *)(v15 + 24), 0LL);
                  }
                }

                else
                {
                  if (v15)
                  {
                    objc_storeWeak((id *)(v15 + 32), v7);
                    *(void *)(v15 + 40) = v14;
                  }

                  id v25 = v7[7];
                  [MEMORY[0x189607968] numberWithUnsignedLongLong:v14];
                  id v26 = (void *)objc_claimAutoreleasedReturnValue();
                  [v25 setObject:v15 forKeyedSubscript:v26];
                }

                [v126[7] setObject:0 forKeyedSubscript:v11];
              }
            }

            uint64_t v137 = [obj countByEnumeratingWithState:&v162 objects:v179 count:16];
          }

          while (v137);
        }

uint64_t __46__SASegment_grabInstructionsFromOtherSegment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40) + [a2 offsetIntoSegment];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 40LL);
  BOOL v5 = v4 <= v3;
  if (v4 >= v3) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = -1LL;
  }
  if (v5) {
    return v6;
  }
  else {
    return 1LL;
  }
}

uint64_t __46__SASegment_grabInstructionsFromOtherSegment___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40) + [a2 offsetIntoSegment];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24LL) + *(void *)(*(void *)(a1 + 32) + 40LL);
  BOOL v5 = v4 <= v3;
  if (v4 >= v3) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = -1LL;
  }
  if (v5) {
    return v6;
  }
  else {
    return 1LL;
  }
}

- (id)nonInlineSymbolAtOffsetIntoSegment:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v3 = a1;
  objc_sync_enter(v3);
  id v4 = v3[1];
  if (v4
    && (v10[0] = MEMORY[0x1895F87A8],
        v10[1] = 3221225472LL,
        v10[2] = __48__SASegment_nonInlineSymbolAtOffsetIntoSegment___block_invoke,
        v10[3] = &__block_descriptor_40_e18_q16__0__SASymbol_8l,
        v10[4] = a2,
        (uint64_t v5 = SABinarySearchArray(v4, 1536, (uint64_t)v10)) != 0))
  {
    [v3[1] objectAtIndexedSubscript:v5 - 1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v6 length]
      && (uint64_t v7 = [v6 offsetIntoSegment], objc_msgSend(v6, "length") + v7 <= a2))
    {
      id v8 = 0LL;
    }

    else
    {
      id v8 = v6;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  objc_sync_exit(v3);

  return v8;
}

void __32__SASegment_addTailspinSymbols___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v28 = 0LL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189607A08]) initWithString:v5];
    if (([v7 scanUnsignedLongLong:&v28] & 1) == 0)
    {
      int v17 = *__error();
      _sa_logt();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_error_impl(&dword_186C92000, v18, OS_LOG_TYPE_ERROR, "Unable to parse offset %@", (uint8_t *)&buf, 0xCu);
      }

      *__error() = v17;
      goto LABEL_30;
    }
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v14 = *__error();
      _sa_logt();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_186C92000, v15, OS_LOG_TYPE_ERROR, "Bad offset in tailspin file", (uint8_t *)&buf, 2u);
      }

      id v16 = __error();
      goto LABEL_25;
    }

    uint64_t v28 = [v5 unsignedLongLongValue];
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v14 = *__error();
    _sa_logt();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl( &dword_186C92000,  v19,  OS_LOG_TYPE_ERROR,  "Bad symbol dict in tailspin file",  (uint8_t *)&buf,  2u);
    }

    id v16 = __error();
LABEL_25:
    int *v16 = v14;
    goto LABEL_30;
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x2020000000LL;
  uint64_t v32 = -1LL;
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __32__SASegment_addTailspinSymbols___block_invoke_33;
  v27[3] = &unk_189F62670;
  v27[5] = &buf;
  v27[6] = v28;
  v27[4] = *(void *)(a1 + 32);
  id v8 = (void (**)(void, void, void))MEMORY[0x186E47C94](v27);
  ((void (**)(void, id, void))v8)[2](v8, v6, 0LL);
  DictGetArray(v6, @"InlineSymbols");
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v20 = *__error();
          _sa_logt();
          int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)id v22 = 0;
            _os_log_error_impl( &dword_186C92000,  v21,  OS_LOG_TYPE_ERROR,  "Bad inline symbol dict in tailspin file",  v22,  2u);
          }

          *__error() = v20;
          goto LABEL_29;
        }

        v8[2](v8, v13, 1LL);
      }

      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

void __32__SASegment_addTailspinSymbols___block_invoke_33(uint64_t a1, void *a2, int a3)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  DictGetString(v5, @"Name");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  DictGetNumber(v5, @"Offset");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 unsignedLongLongValue];

  DictGetNumber(v5, @"Length");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 unsignedLongLongValue];

  if (v8) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v6 == 0LL;
  }
  if (v11) {
    goto LABEL_14;
  }
  unint64_t v12 = *(void *)(a1 + 48) - v8;
  if (!a3)
  {
    -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](*(void **)(a1 + 32), v12, v10, v6);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v12;
    goto LABEL_9;
  }

  if (v6)
  {
    -[SASegment addInlineSymbolWithOffsetIntoSegment:length:name:nonInlineSymbolOffsetIntoSegment:]( *(void **)(a1 + 32),  v12,  v10,  v6,  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    DictGetString(v5, @"FileName");
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      DictGetNumber(v5, @"SourceOffset");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = [v15 unsignedLongLongValue];

      DictGetNumber(v5, @"SourceLength");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 unsignedLongLongValue];

      DictGetNumber(v5, @"LineNumber");
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      int v19 = [v18 unsignedIntValue];

      DictGetNumber(v5, @"ColNumber");
      int v20 = (void *)objc_claimAutoreleasedReturnValue();
      int v21 = [v20 unsignedIntValue];

      unint64_t v22 = *(void *)(a1 + 48) - v30;
      if (a3) {
        id v23 =  -[SASymbol addInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:]( v13,  v22,  v17,  v19,  v21,  v14);
      }
      else {
        id v24 =  -[SASymbol addNonInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:]( v13,  v22,  v17,  v19,  v21,  v14);
      }
    }

    goto LABEL_14;
  }

  int v25 = *__error();
  _sa_logt();
  __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    -[SASegment nonInlineSymbolAtOffsetIntoSegment:]( *(void **)(a1 + 32),  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 debugDescription];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) debugDescription];
    unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    uint64_t v32 = v28;
    __int16 v33 = 2112;
    uint64_t v34 = v29;
    _os_log_error_impl( &dword_186C92000,  v26,  OS_LOG_TYPE_ERROR,  "No symbol name for inline symbol (after non-inline symbol %@ in %@)",  buf,  0x16u);
  }

  *__error() = v25;
LABEL_14:
}

- (id)addInlineSymbolWithOffsetIntoSegment:(uint64_t)a3 length:(void *)a4 name:(unint64_t)a5 nonInlineSymbolOffsetIntoSegment:
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id newValue = a4;
  if (!a1)
  {
LABEL_27:
    int v20 = 0LL;
    goto LABEL_18;
  }

  if (!a3)
  {
    int v29 = *__error();
    _sa_logt();
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = [a1 debugDescription];
      uint64_t v32 = [v31 UTF8String];
      -[SASegment nonInlineSymbolAtOffsetIntoSegment:](a1, a5);
      __int16 v33 = (void *)objc_claimAutoreleasedReturnValue();
      id v34 = [v33 debugDescription];
      *(_DWORD *)__int128 buf = 136316162;
      uint64_t v48 = v32;
      __int16 v49 = 2080;
      uint64_t v50 = [v34 UTF8String];
      __int16 v51 = 2080;
      uint64_t v52 = [newValue UTF8String];
      __int16 v53 = 2048;
      uint64_t v54 = a2;
      __int16 v55 = 2048;
      uint64_t v56 = a2;
      _os_log_error_impl( &dword_186C92000,  v30,  OS_LOG_TYPE_ERROR,  "%s: inlining into %s: %s (0x%llx-0x%llx) with length 0",  buf,  0x34u);
    }

    *__error() = v29;
    id v35 = [a1 debugDescription];
    char v36 = [v35 UTF8String];
    -[SASegment nonInlineSymbolAtOffsetIntoSegment:](a1, a5);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    id v38 = [v37 debugDescription];
    [v38 UTF8String];
    [newValue UTF8String];
    _SASetCrashLogMessage( 481,  "%s: inlining into %s: %s (0x%llx-0x%llx) with length 0",  v39,  v40,  v41,  v42,  v43,  v44,  v36);

    _os_crash();
    __break(1u);
    goto LABEL_27;
  }

  id v9 = a1;
  objc_sync_enter(v9);
  uint64_t v10 = (void *)v9[2];
  if (!v10)
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:1];
    unint64_t v12 = (void *)v9[2];
    v9[2] = v11;

    uint64_t v10 = (void *)v9[2];
  }

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a5];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 objectForKeyedSubscript:v13];
  int v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    [MEMORY[0x189603FA8] arrayWithCapacity:1];
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = (void *)v9[2];
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a5];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v14 forKeyedSubscript:v16];
  }

  v46[0] = MEMORY[0x1895F87A8];
  v46[1] = 3221225472LL;
  v46[2] = __95__SASegment_addInlineSymbolWithOffsetIntoSegment_length_name_nonInlineSymbolOffsetIntoSegment___block_invoke;
  v46[3] = &__block_descriptor_48_e18_q16__0__SASymbol_8l;
  v46[4] = a2;
  v46[5] = a3;
  uint64_t v17 = SABinarySearchArray(v14, 1536, (uint64_t)v46);
  uint64_t v18 = v17;
  if (v17)
  {
    uint64_t v19 = v17 - 1;
    while (1)
    {
      [v14 objectAtIndexedSubscript:v19];
      int v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v20 offsetIntoSegment] != a2 || objc_msgSend(v20, "length") != a3)
      {

        goto LABEL_16;
      }

      [v20 name];
      int v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21) {
        break;
      }
      [v20 name];
      unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      int v23 = [v22 isEqualToString:newValue];

      if (v23) {
        break;
      }

      if (--v19 == -1) {
        goto LABEL_16;
      }
    }

    [v20 name];
    int v25 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v26 = v25 != 0LL;

    if (v20) {
      char v28 = v26;
    }
    else {
      char v28 = 1;
    }
    if ((v28 & 1) == 0) {
      objc_setProperty_atomic_copy(v20, v27, newValue, 24LL);
    }
  }

  else
  {
LABEL_16:
    +[SASymbol symbolWithOffsetIntoSegment:length:name:]((uint64_t)&OBJC_CLASS___SASymbol, a2, a3, newValue);
    int v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 insertObject:v20 atIndex:v18];
  }

  objc_sync_exit(v9);
LABEL_18:

  return v20;
}

- (void)addNonInlineSymbolWithOffsetIntoSegment:(unint64_t)a3 length:(void *)a4 name:
{
  id v7 = a4;
  if (a1 && a1[3] - 1LL >= a2)
  {
    id v9 = a1;
    objc_sync_enter(v9);
    id v10 = v9[1];
    if (!v10)
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:8];
      id v12 = v9[1];
      v9[1] = (id)v11;

      id v10 = v9[1];
    }

    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __65__SASegment_addNonInlineSymbolWithOffsetIntoSegment_length_name___block_invoke;
    v20[3] = &__block_descriptor_40_e18_q16__0__SASymbol_8l;
    v20[4] = a2;
    unint64_t v13 = SABinarySearchArray(v10, 1280, (uint64_t)v20);
    if (v13 < [v9[1] count])
    {
      [v9[1] objectAtIndexedSubscript:v13];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v8 offsetIntoSegment] == a2)
      {
        if (a3 && (![v8 length] || objc_msgSend(v8, "length") > a3) && v8) {
          v8[2] = a3;
        }
        [v8 name];
        int v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7 && !v14 && v8) {
          objc_setProperty_atomic_copy(v8, v15, v7, 24LL);
        }
LABEL_26:
        objc_sync_exit(v9);

        goto LABEL_27;
      }

      if ([v8 offsetIntoSegment] < a3 + a2) {
        a3 = [v8 offsetIntoSegment] - a2;
      }
    }

    if (v13)
    {
      [v9[1] objectAtIndexedSubscript:v13 - 1];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 offsetIntoSegment];
      if ([v16 length] + v17 > a2)
      {
        uint64_t v18 = [v16 offsetIntoSegment];
        if (v16) {
          v16[2] = a2 - v18;
        }
      }
    }

    +[SASymbol symbolWithOffsetIntoSegment:length:name:]((uint64_t)&OBJC_CLASS___SASymbol, a2, a3, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v9[1] insertObject:v8 atIndex:v13];
    goto LABEL_26;
  }

  uint64_t v8 = 0LL;
LABEL_27:

  return v8;
}

uint64_t __95__SASegment_addInlineSymbolWithOffsetIntoSegment_length_name_nonInlineSymbolOffsetIntoSegment___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 offsetIntoSegment];
  unint64_t v5 = *(void *)(a1 + 32);
  if (v5 <= v4)
  {
    if (v5 >= v4)
    {
      unint64_t v7 = [v3 length];
      unint64_t v8 = *(void *)(a1 + 40);
      BOOL v9 = v8 > v7;
      BOOL v10 = v8 < v7;
      if (v9) {
        uint64_t v6 = -1LL;
      }
      else {
        uint64_t v6 = v10;
      }
    }

    else
    {
      uint64_t v6 = -1LL;
    }
  }

  else
  {
    uint64_t v6 = 1LL;
  }

  return v6;
}

uint64_t __65__SASegment_addNonInlineSymbolWithOffsetIntoSegment_length_name___block_invoke( uint64_t a1,  void *a2)
{
  unint64_t v3 = [a2 offsetIntoSegment];
  unint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = v4 > v3;
  if (v4 >= v3) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = -1LL;
  }
  if (v5) {
    return 1LL;
  }
  else {
    return v6;
  }
}

unint64_t __34__SASegment_addInfoFromCSSegment___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  unint64_t a4)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t Range = CSSymbolGetRange();
  unint64_t v8 = v7;
  Name = (void *)CSSymbolGetName();
  unint64_t v10 = Range - *(void *)(a1 + 40);
  if (!Name)
  {
    if (a4 != -1LL) {
      goto LABEL_7;
    }
    id v12 = 0LL;
LABEL_11:
    -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](*(void **)(a1 + 32), v10, v8, v12);
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }

  SANSStringForCString(Name);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v11;
  if (a4 == -1LL) {
    goto LABEL_11;
  }
  if (v11)
  {
    -[SASegment addInlineSymbolWithOffsetIntoSegment:length:name:nonInlineSymbolOffsetIntoSegment:]( *(void **)(a1 + 32),  v10,  v8,  v11,  a4);
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
LABEL_5:
      id v14 = 0LL;
      goto LABEL_13;
    }

void __34__SASegment_addInfoFromCSSegment___block_invoke_41(void *a1)
{
  Path = (void *)CSSourceInfoGetPath();
  if (Path)
  {
    SANSStringForCString(Path);
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      id v13 = v3;
      int LineNumber = CSSourceInfoGetLineNumber();
      int Column = CSSourceInfoGetColumn();
      uint64_t Range = CSSourceInfoGetRange();
      uint64_t v8 = v7;
      BOOL v9 = (void *)a1[4];
      unint64_t v10 = Range - a1[5];
      if (a1[7] == -1LL) {
        id v12 =  -[SASymbol addNonInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:]( v9,  v10,  v8,  LineNumber,  Column,  v13);
      }
      else {
        id v11 =  -[SASymbol addInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:]( v9,  v10,  v8,  LineNumber,  Column,  v13);
      }
      unint64_t v3 = v13;
    }
  }

void __34__SASegment_addInfoFromCSSegment___block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  CSSymbolForeachInlineRange();
}

uint64_t __34__SASegment_addInfoFromCSSegment___block_invoke_3( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  if (a6)
  {
    uint64_t v8 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
    uint64_t v9 = a6 - 1;
    if (v9)
    {
      uint64_t v10 = a4 + 24;
      do
      {
        result = CSSymbolIsUnnamed();
        if ((result & 1) == 0) {
          result = (*(uint64_t (**)(void))(*(void *)(v8 + 32) + 16LL))();
        }
        v10 += 16LL;
        --v9;
      }

      while (v9);
    }
  }

  return result;
}

- (void)symbolicateOffsetIntoSegment:(uint64_t)a3 symbolOwner:(uint64_t)a4 segmentBaseAddress:(uint64_t)a5 returningSymbols:(id *)a6 sourceInfos:(id *)a7
{
  if (a1)
  {
    uint64_t v33 = 0LL;
    id v34 = &v33;
    uint64_t v35 = 0x3032000000LL;
    char v36 = __Block_byref_object_copy__2;
    uint64_t v37 = __Block_byref_object_dispose__2;
    id v38 = 0LL;
    uint64_t v27 = 0LL;
    char v28 = &v27;
    uint64_t v29 = 0x3032000000LL;
    uint64_t v30 = __Block_byref_object_copy__2;
    id v31 = __Block_byref_object_dispose__2;
    id v32 = 0LL;
    uint64_t v21 = 0LL;
    unint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    id v24 = __Block_byref_object_copy__2;
    uint64_t v25 = __Block_byref_object_dispose__2;
    id v26 = 0LL;
    uint64_t v15 = 0LL;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000LL;
    uint64_t v18 = __Block_byref_object_copy__2;
    uint64_t v19 = __Block_byref_object_dispose__2;
    id v20 = 0LL;
    id v8 = a1;
    objc_sync_enter(v8);
    v13[0] = 0LL;
    v13[1] = v13;
    v13[2] = 0x2020000000LL;
    int v14 = 0;
    v12[0] = 0LL;
    v12[1] = v12;
    v12[2] = 0x2020000000LL;
    v12[3] = 0LL;
    CSSymbolOwnerForEachStackFrameAtAddress();
    _Block_object_dispose(v12, 8);
    _Block_object_dispose(v13, 8);
    objc_sync_exit(v8);

    uint64_t v9 = (void *)v28[5];
    if (!v9) {
      uint64_t v9 = (void *)v34[5];
    }
    objc_storeStrong(a6, v9);
    uint64_t v10 = (void *)v16[5];
    if (!v10) {
      uint64_t v10 = (void *)v22[5];
    }
    objc_storeStrong(a7, v10);
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&v33, 8);
  }

void __102__SASegment_symbolicateOffsetIntoSegment_symbolOwner_segmentBaseAddress_returningSymbols_sourceInfos___block_invoke( uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  if ((CSIsNull() & 1) == 0
    && (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) || (CSSymbolIsUnnamed() & 1) == 0))
  {
    Name = (void *)CSSymbolGetName();
    uint64_t Range = CSSymbolGetRange();
    unint64_t v5 = v4;
    unint64_t v6 = Range - *(void *)(a1 + 88);
    if (Name)
    {
      SANSStringForCString(Name);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      id v8 = v7;
      if (*(int *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) > 0)
      {
        if (v7)
        {
          -[SASegment addInlineSymbolWithOffsetIntoSegment:length:name:nonInlineSymbolOffsetIntoSegment:]( *(void **)(a1 + 32),  v6,  v5,  v7,  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9) {
            goto LABEL_20;
          }
LABEL_15:
          if ((CSIsNull() & 1) != 0 || (uint64_t Path = CSSourceInfoGetPath()) == 0)
          {
            uint64_t v21 = 0LL;
          }

          else
          {
            id v13 = (void *)Path;
            int LineNumber = CSSourceInfoGetLineNumber();
            int Column = CSSourceInfoGetColumn();
            SANSStringForCString(v13);
            id v16 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v17 = CSSourceInfoGetRange();
            if (v16)
            {
              uint64_t v19 = v18;
              unint64_t v20 = v17 - *(void *)(a1 + 88);
              if (*(int *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) < 1) {
                -[SASymbol addNonInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:]( v9,  v20,  v19,  LineNumber,  Column,  v16);
              }
              else {
                -[SASymbol addInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:]( v9,  v20,  v19,  LineNumber,  Column,  v16);
              }
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              uint64_t v21 = 0LL;
            }
          }

          uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8LL);
          uint64_t v25 = *(void **)(v22 + 40);
          uint64_t v23 = (id *)(v22 + 40);
          id v24 = v25;
          if (!v25)
          {
            objc_storeStrong(v23, v9);
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), v21);
            goto LABEL_52;
          }

          id v26 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
          if (v26)
          {
            if (![v26 count])
            {
LABEL_34:
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v9];
              uint64_t v30 = *(void *)(*(void *)(a1 + 80) + 8LL);
              id v31 = *(void **)(v30 + 40);
              if (v21)
              {
                [*(id *)(v30 + 40) addObject:v21];
              }

              else
              {
                [MEMORY[0x189603FE8] null];
                uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
                [v31 addObject:v42];

                uint64_t v21 = 0LL;
              }

              goto LABEL_52;
            }

            uint64_t v27 = 0LL;
            while (1)
            {
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectAtIndexedSubscript:v27];
              char v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (v9 == v28)
              {
                [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) objectAtIndexedSubscript:v27];
                uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

                if (v21 == v29)
                {
                  int v43 = *__error();
                  _sa_logt();
                  uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                  {
LABEL_54:
                    [v9 debugDescription];
                    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
                    [v21 debugDescription];
                    __int16 v49 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)__int128 buf = 138412546;
                    __int16 v51 = v48;
                    __int16 v52 = 2112;
                    __int16 v53 = v49;
                    _os_log_error_impl( &dword_186C92000,  v44,  OS_LOG_TYPE_ERROR,  "Same symbol/source info showed up twice in inlining: %@ %@",  buf,  0x16u);
                  }

- (uint64_t)baseAddressInSymbolOwnerWrapper:(void *)a1
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  unint64_t v3 = a2;
  if (a1)
  {
    unint64_t v4 = a1;
    objc_sync_enter(v4);
    uint64_t v5 = -[SACSSymbolOwnerWrapper symbolOwner]((uint64_t)v3);
    uint64_t v7 = v6;
    if ((v3[8] & 1) != 0 && [v4 hasOffsetIntoBinary])
    {
      CSSymbolOwnerGetBaseAddress();
      [v4 offsetIntoBinary];
      CSSymbolOwnerGetSegmentWithAddress();
      if (CSIsNull())
      {
        int v8 = *__error();
        _sa_logt();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          [v4 debugDescription];
          id v24 = (void *)objc_claimAutoreleasedReturnValue();
          CFUUIDBytes = (const unsigned __int8 *)CSSymbolOwnerGetCFUUIDBytes();
          do
          {
            unsigned int v26 = __ldxr(&uuid_string_index);
            unsigned int v27 = v26 + 1;
          }

          while (__stxr(v27, &uuid_string_index));
          BOOL v19 = (-v27 & 0x80000000) != 0;
          int v28 = -v27 & 3;
          int v29 = v27 & 3;
          if (v19) {
            int v30 = v29;
          }
          else {
            int v30 = -v28;
          }
          id v31 = &uuid_string_string[37 * v30];
          uuid_unparse(CFUUIDBytes, v31);
          *(_DWORD *)uint64_t v39 = 138412546;
          *(void *)&v39[4] = v24;
          *(_WORD *)&v39[12] = 2080;
          *(void *)&v39[14] = v31;
          _os_log_error_impl(&dword_186C92000, v9, OS_LOG_TYPE_ERROR, "%@: segment not found in %s", v39, 0x16u);
        }

        *__error() = v8;
        uint64_t Range = -1LL;
      }

      else
      {
        uint64_t Range = CSRegionGetRange();
      }
    }

    else
    {
      *(void *)uint64_t v39 = 0LL;
      *(void *)&v39[8] = v39;
      *(void *)&v39[16] = 0x2020000000LL;
      uint64_t v40 = -1LL;
      v32[0] = MEMORY[0x1895F87A8];
      v32[1] = 3221225472LL;
      v32[2] = __45__SASegment_baseAddressInSymbolOwnerWrapper___block_invoke;
      v32[3] = &unk_189F627C8;
      v32[4] = v4;
      v32[5] = v39;
      SASymbolOwnerForeachSegment(v5, v7, v32);
      uint64_t Range = *(void *)(*(void *)&v39[8] + 24LL);
      if (Range == -1)
      {
        int v11 = *__error();
        _sa_logt();
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          [v4 debugDescription];
          int v14 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v15 = v4[4];
          id v16 = (const unsigned __int8 *)CSSymbolOwnerGetCFUUIDBytes();
          do
          {
            unsigned int v17 = __ldxr(&uuid_string_index);
            unsigned int v18 = v17 + 1;
          }

          while (__stxr(v18, &uuid_string_index));
          BOOL v19 = (-v18 & 0x80000000) != 0;
          int v20 = -v18 & 3;
          int v21 = v18 & 3;
          if (v19) {
            int v22 = v21;
          }
          else {
            int v22 = -v20;
          }
          uint64_t v23 = &uuid_string_string[37 * v22];
          uuid_unparse(v16, v23);
          *(_DWORD *)__int128 buf = 138412802;
          id v34 = v14;
          __int16 v35 = 2112;
          uint64_t v36 = v15;
          __int16 v37 = 2080;
          id v38 = v23;
          _os_log_error_impl(&dword_186C92000, v12, OS_LOG_TYPE_ERROR, "%@: segment %@ not found in %s", buf, 0x20u);
        }

        *__error() = v11;
        uint64_t Range = *(void *)(*(void *)&v39[8] + 24LL);
      }

      _Block_object_dispose(v39, 8);
    }

    objc_sync_exit(v4);
  }

  else
  {
    uint64_t Range = 0LL;
  }

  return Range;
}

void __45__SASegment_baseAddressInSymbolOwnerWrapper___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == -1LL)
  {
    Name = (void *)CSRegionGetName();
    if (Name)
    {
      SANSStringForCString(Name);
      unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      CopyCleanSegmentName(v3);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

- (void)symbolicateWithSymbolOwnerWrapper:(void *)a1
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    id v4 = (void *)MEMORY[0x186E47ACC]();
    uint64_t v5 = a1;
    objc_sync_enter(v5);
    if (![v5[7] count] || (uint64_t v6 = -[SASegment baseAddressInSymbolOwnerWrapper:](v5, v3), v6 == -1))
    {
      objc_sync_exit(v5);
    }

    else
    {
      uint64_t v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v5[7], "count"));
      uint64_t v8 = -[SACSSymbolOwnerWrapper symbolOwner]((uint64_t)v3);
      id v9 = v5[7];
      v24[0] = MEMORY[0x1895F87A8];
      v24[1] = 3221225472LL;
      v24[2] = __47__SASegment_symbolicateWithSymbolOwnerWrapper___block_invoke;
      v24[3] = &unk_189F627F0;
      v24[4] = v5;
      uint64_t v26 = v8;
      uint64_t v27 = v10;
      uint64_t v28 = v6;
      id v11 = v7;
      id v25 = v11;
      [v9 enumerateKeysAndObjectsUsingBlock:v24];

      objc_sync_exit(v5);
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v29 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v21;
        do
        {
          for (uint64_t i = 0LL; i != v13; ++i)
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v12);
            }
            id v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            objc_msgSend(v16, "objectAtIndexedSubscript:", 0, (void)v20);
            unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v16 objectAtIndexedSubscript:1];
            unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)[v16 count] < 3)
            {
              BOOL v19 = 0LL;
            }

            else
            {
              [v16 objectAtIndexedSubscript:2];
              BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
            }

            -[SAInstruction setSymbol:sourceinfo:](v17, v18, v19);
          }

          uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v29 count:16];
        }

        while (v13);
      }
    }

    objc_autoreleasePoolPop(v4);
  }
}

void __47__SASegment_symbolicateWithSymbolOwnerWrapper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5 || !*((void *)v5 + 2))
  {
    id v13 = 0LL;
    id v14 = 0LL;
    -[SASegment symbolicateOffsetIntoSegment:symbolOwner:segmentBaseAddress:returningSymbols:sourceInfos:]( *(void **)(a1 + 32),  [v12 unsignedLongLongValue],  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  &v14,  &v13);
    id v7 = v14;
    if (v14)
    {
      uint64_t v8 = *(void **)(a1 + 40);
      id v9 = objc_alloc(MEMORY[0x189603F18]);
      id v10 = v13;
      id v11 = (void *)objc_msgSend(v9, "initWithObjects:", v6, v7, v13, 0);
      [v8 addObject:v11];
    }

    else
    {
      id v10 = v13;
    }
  }
}

uint64_t __48__SASegment_nonInlineSymbolAtOffsetIntoSegment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void *)(a1 + 32);
  if (v4 >= [v3 offsetIntoSegment])
  {
    unint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = v6 > [v3 offsetIntoSegment];
  }

  else
  {
    uint64_t v5 = -1LL;
  }

  return v5;
}

- (id)instructionAtOffsetIntoSegment:(unint64_t)a3
{
  if (self->_length - 1 < a3)
  {
    id v3 = 0LL;
    return v3;
  }

  uint64_t v5 = self;
  objc_sync_enter(v5);
  instructions = v5->_instructions;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](instructions, "objectForKeyedSubscript:", v7);
  id v3 = (id *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_sync_exit(v5);
LABEL_5:

    return v3;
  }

  if (!v5->_instructions)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:8];
    id v9 = v5->_instructions;
    v5->_instructions = (NSMutableDictionary *)v8;
  }

  id v10 = v5;
  id v3 = (id *)objc_alloc_init((Class)objc_opt_self());
  [v10 binary];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(v3 + 3, v11);

  objc_storeWeak(v3 + 4, v10);
  v3[5] = (id)a3;
  id v12 = v5->_instructions;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v3, v13);

  objc_sync_exit(v10);
  -[SAInstruction checkForNewSymbol]((unint64_t *)v3);
  if (!v3[2])
  {
    id WeakRetained = (SASegment *)objc_loadWeakRetained(v10 + 6);
    uint64_t v5 = WeakRetained;
    if (WeakRetained) {
      BYTE1(WeakRetained[1].super.isa) = 1;
    }
    goto LABEL_5;
  }

  return v3;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(NSString);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
  [WeakRetained name];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = objc_loadWeakRetained((id *)&self->_binary);
  [v6 uuid];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 UUIDString];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = (void *)[v3 initWithFormat:@"%@ <%@> %@ (offset 0x%llx length 0x%llx, %lu symbols)", v5, v8, self->_name, self->_offsetIntoBinary, self->_length, -[NSMutableArray count](self->_symbols, "count")];

  return (NSString *)v9;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (int64_t)offsetIntoBinary
{
  return self->_offsetIntoBinary;
}

- (SABinary)binary
{
  return (SABinary *)objc_loadWeakRetained((id *)&self->_binary);
}

- (void).cxx_destruct
{
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4 = a3;
  name = self->_name;
  id v8 = v4;
  if (name) {
    SAJSONWriteDictionaryFirstEntry(v4, (uint64_t)@"name", name);
  }
  if (self->_length)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v8, @"length", v6);
  }

  if (-[SASegment hasOffsetIntoBinary](self, "hasOffsetIntoBinary"))
  {
    [MEMORY[0x189607968] numberWithLongLong:self->_offsetIntoBinary];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v8, @"offsetIntoBinary", v7);
  }
}

+ (id)classDictionaryKey
{
  return @"SASegment";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 114LL;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (-[SASegment sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") > a4)
  {
    int v16 = *__error();
    _sa_logt();
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = -[SASegment debugDescription](self, "debugDescription");
      *(_DWORD *)__int128 buf = 136315650;
      uint64_t v39 = [v18 UTF8String];
      __int16 v40 = 2048;
      unint64_t v41 = a4;
      __int16 v42 = 2048;
      unint64_t v43 = -[SASegment sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      _os_log_error_impl(&dword_186C92000, v17, OS_LOG_TYPE_ERROR, "%s: size %lu > buffer length %lu", buf, 0x20u);
    }

    *__error() = v16;
    id v19 = -[SASegment debugDescription](self, "debugDescription");
    char v20 = [v19 UTF8String];
    -[SASegment sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(4931, "%s: size %lu > buffer length %lu", v21, v22, v23, v24, v25, v26, v20);

    _os_crash();
    __break(1u);
    goto LABEL_8;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
  if (!WeakRetained) {
    goto LABEL_11;
  }
  id v10 = WeakRetained;
  *(_WORD *)&a3->var0 = 513;
  *(void *)&a3->var3[64] = self->_offsetIntoBinary;
  *(int64_t *)((char *)&a3->var4 + 2) = self->_length;
  *(unint64_t *)((char *)&a3->var6 + 2) = SASerializableIndexForPointerFromSerializationDictionary( self->_name,  v8);
  id v11 = objc_loadWeakRetained((id *)&self->_binary);
  *(unint64_t *)((char *)&a3->var5 + 2) = SASerializableIndexForPointerFromSerializationDictionary(v11, v8);

  -[NSString dataUsingEncoding:allowLossyConversion:](self->_name, "dataUsingEncoding:allowLossyConversion:", 4LL, 1LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v12 length] >= 0x40)
  {
LABEL_8:
    int v27 = *__error();
    _sa_logt();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v29 = -[NSString UTF8String](self->_name, "UTF8String");
      *(_DWORD *)__int128 buf = 136315394;
      uint64_t v39 = (uint64_t)v29;
      __int16 v40 = 2048;
      unint64_t v41 = 63LL;
      _os_log_error_impl(&dword_186C92000, v28, OS_LOG_TYPE_ERROR, "Segment %s longer than %lu characters", buf, 0x16u);
    }

    *__error() = v27;
    char v30 = (char)-[NSString UTF8String](self->_name, "UTF8String");
    _SASetCrashLogMessage(4950, "Segment %s longer than %lu characters", v31, v32, v33, v34, v35, v36, v30);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Segment with no binary",  0LL);
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v37);
  }

  id v13 = v12;
  memmove(a3->var3, (const void *)[v13 bytes], objc_msgSend(v13, "length"));
  a3->var3[[v13 length]] = 0;
  [v10 uuid];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 getUUIDBytes:a3->var2];

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v7 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v7, self, v4);

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
    [WeakRetained addSelfToSerializationDictionary:v7];

    -[NSString addSelfToSerializationDictionary:](self->_name, "addSelfToSerializationDictionary:", v7);
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v79 = *MEMORY[0x1895F89C0];
  unint64_t v9 = (unint64_t)a5;
  id v10 = a6;
  if (a4 <= 0x61)
  {
    int v29 = *__error();
    _sa_logt();
    char v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 134218240;
      *(void *)unint64_t v78 = a4;
      *(_WORD *)&v78[8] = 2048;
      *(void *)&v78[10] = 98LL;
      _os_log_error_impl( &dword_186C92000,  v30,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SASegment struct %lu",  buf,  0x16u);
    }

    *__error() = v29;
    _SASetCrashLogMessage(4973, "bufferLength %lu < serialized SASegment struct %lu", v31, v32, v33, v34, v35, v36, a4);
    _os_crash();
    __break(1u);
    goto LABEL_24;
  }

  id v11 = v10;
  if (a4 <= 0x71)
  {
LABEL_27:
    int v49 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 134218240;
      *(void *)unint64_t v78 = a4;
      *(_WORD *)&v78[8] = 2048;
      *(void *)&v78[10] = 114LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)a3,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SASegment v2 struct %lu",  buf,  0x16u);
    }

    *__error() = v49;
    _SASetCrashLogMessage( 4980,  "bufferLength %lu < serialized SASegment v2 struct %lu",  v50,  v51,  v52,  v53,  v54,  v55,  a4);
    _os_crash();
    __break(1u);
    goto LABEL_30;
  }

  unint64_t v12 = *(void *)((char *)a3 + 98);
  id v13 = (void *)objc_opt_class();
  a4 = SASerializablePartiallyDecodedNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v12,  (void *)v9,  v11,  v13);
  unint64_t v14 = *(void *)((char *)a3 + 106);
  uint64_t v15 = (void *)objc_opt_class();
  SASerializablePartiallyDecodedNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v14,  (void *)v9,  v11,  v15);
  int v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    unint64_t v9 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)unint64_t v78 = [v16 UTF8String];
      _os_log_error_impl(&dword_186C92000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "No binary for segment %s", buf, 0xCu);
    }

    *__error() = v9;
    char v17 = [v16 UTF8String];
    _SASetCrashLogMessage(4992, "No binary for segment %s", v18, v19, v20, v21, v22, v23, v17);
    _os_crash();
    __break(1u);
LABEL_9:
    a4 = gSASerializationEncodedVersionBeingDecoded();
    if (*(uint64_t *)a4 >= 31)
    {
LABEL_30:
      int v56 = *__error();
      _sa_logt();
      uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        int v58 = *((unsigned __int8 *)a3 + 1);
        uint64_t v59 = *(void *)a4;
        *(_DWORD *)__int128 buf = 67109376;
        *(_DWORD *)unint64_t v78 = v58;
        *(_WORD *)&v78[4] = 2048;
        *(void *)&v78[6] = v59;
        _os_log_error_impl( &dword_186C92000,  v57,  OS_LOG_TYPE_ERROR,  "segment version %d, but encoded version %ld",  buf,  0x12u);
      }

      *__error() = v56;
      _SASetCrashLogMessage( 4985,  "segment version %d, but encoded version %ld",  v60,  v61,  v62,  v63,  v64,  v65,  *((_BYTE *)a3 + 1));
      _os_crash();
      __break(1u);
      goto LABEL_33;
    }

    uint64_t v24 = *(void **)gBinaryBeingDecoded(&gBinaryBeingDecoded);
    if (!v24)
    {
LABEL_33:
      int v66 = *__error();
      _sa_logt();
      uint64_t v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        int v68 = *((unsigned __int8 *)a3 + 1);
        uint64_t v69 = *(void *)a4;
        *(_DWORD *)__int128 buf = 67109376;
        *(_DWORD *)unint64_t v78 = v68;
        *(_WORD *)&v78[4] = 2048;
        *(void *)&v78[6] = v69;
        _os_log_error_impl( &dword_186C92000,  v67,  OS_LOG_TYPE_ERROR,  "Segment version %d, encoded version %ld, no gBinaryBeingDecoded",  buf,  0x12u);
      }

      *__error() = v66;
      _SASetCrashLogMessage( 4986,  "Segment version %d, encoded version %ld, no gBinaryBeingDecoded",  v70,  v71,  v72,  v73,  v74,  v75,  *((_BYTE *)a3 + 1));
      _os_crash();
      __break(1u);
LABEL_36:
      +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SASegment version",  0LL);
      id v76 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v76);
    }

    a4 = v24;
    SANSStringForCString((char *)a3 + 18);
    int v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v16)
  {
LABEL_24:
    int v37 = *__error();
    _sa_logt();
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v39 = [(id)a4 debugDescription];
      uint64_t v40 = [v39 UTF8String];
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)unint64_t v78 = v40;
      _os_log_error_impl(&dword_186C92000, v38, OS_LOG_TYPE_ERROR, "No name for segment in %s", buf, 0xCu);
    }

    *__error() = v37;
    id v41 = [(id)a4 debugDescription];
    char v42 = [v41 UTF8String];
    _SASetCrashLogMessage(4993, "No name for segment in %s", v43, v44, v45, v46, v47, v48, v42);

    _os_crash();
    __break(1u);
    goto LABEL_27;
  }

  -[SABinary segmentWithCleanName:]((void *)a4, v16);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    uint64_t v26 = v25;
    if (![v25 length])
    {
      unint64_t v27 = *(void *)((char *)a3 + 90);
      if (v27) {
        -[SASegment setLength:](v26, v27);
      }
    }

    if (([v26 hasOffsetIntoBinary] & 1) == 0) {
      v26[5] = *(void *)((char *)a3 + 82);
    }
  }

  else
  {
    +[SASegment segmentWithBinary:name:length:offsetIntoBinary:]( (uint64_t)&OBJC_CLASS___SASegment,  (void *)a4,  v16,  *(void *)((char *)a3 + 90),  *(void *)((char *)a3 + 82));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SABinary addSegment:]((void *)a4, v26);
  }

  return v26;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v24 = a5;
  id v9 = a6;
  if (*((unsigned __int8 *)a3 + 1) >= 2u)
  {
    if (a4 <= 0x71)
    {
      int v16 = *__error();
      _sa_logt();
      char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 134218240;
        unint64_t v26 = a4;
        __int16 v27 = 2048;
        uint64_t v28 = 114LL;
        _os_log_error_impl( &dword_186C92000,  v17,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SASegment v2 struct %lu",  buf,  0x16u);
      }

      *__error() = v16;
      _SASetCrashLogMessage( 5015,  "bufferLength %lu < serialized SASegment v2 struct %lu",  v18,  v19,  v20,  v21,  v22,  v23,  a4);
      _os_crash();
      __break(1u);
    }

    unint64_t v10 = *(void *)((char *)a3 + 98);
    id v11 = (void *)objc_opt_class();
    id v12 =  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v10,  v24,  v9,  v11);
    unint64_t v13 = *(void *)((char *)a3 + 106);
    unint64_t v14 = (void *)objc_opt_class();
    id v15 =  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v13,  v24,  v9,  v14);
  }
}

@end