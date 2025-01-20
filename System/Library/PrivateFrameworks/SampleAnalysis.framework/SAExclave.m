@interface SAExclave
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)synthetic;
- (BOOL)unslid;
- (NSArray)loadInfos;
- (NSString)debugDescription;
- (NSString)name;
- (unint64_t)identifier;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)enumerateFrames:(uint64_t)a1;
- (void)fillInName:(void *)a3 textLayout:;
- (void)fixupFrameInstructionsWithNewInstructions:(_BYTE *)a3 foundNewBinaryInfo:;
- (void)initWithIdentifier:(void *)a1;
- (void)initWithKCData:(void *)a3 name:(void *)a4 textLayout:;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAExclave

- (void)initWithIdentifier:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_CLASS___SAExclave;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[2] = a2;
    id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
    v6 = (void *)v4[5];
    v4[5] = v5;
  }

  return v4;
}

- (void)initWithKCData:(void *)a3 name:(void *)a4 textLayout:
{
  id v7 = a4;
  if (a1)
  {
    objc_super v8 = -[SAExclave initWithIdentifier:](a1, *a2);
    a1 = v8;
    if (v8) {
      -[SAExclave fillInName:textLayout:]((uint64_t)v8, a3, v7);
    }
  }

  return a1;
}

- (void)fillInName:(void *)a3 textLayout:
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  v6 = a3;
  if (a1)
  {
    if (a2 && !*(void *)(a1 + 8))
    {
      uint64_t v7 = SANSStringForCString(a2);
      objc_super v8 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v7;
    }

    if (v6)
    {
      unint64_t v9 = objc_msgSend(objc_getProperty(v6, v5, 16, 1), "count");
      if (v9 > [*(id *)(a1 + 24) count])
      {
        *(void *)(a1 + 32) = *(void *)(v6[1] + 8LL);
        if (objc_msgSend(objc_getProperty(v6, v10, 16, 1), "count"))
        {
          id v11 = objc_alloc(MEMORY[0x189603FA8]);
          v13 = (void *)objc_msgSend( v11,  "initWithCapacity:",  objc_msgSend(objc_getProperty(v6, v12, 16, 1), "count"));
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          v30 = v6;
          id obj = objc_getProperty(v6, v14, 16LL, 1);
          uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v33;
            do
            {
              uint64_t v18 = 0LL;
              do
              {
                if (*(void *)v33 != v17) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * v18);
                if (v19)
                {
                  uint64_t v20 = *(void *)(v19 + 8);
                  uint64_t v21 = v20 + 16;
                }

                else
                {
                  uint64_t v20 = 0LL;
                  uint64_t v21 = 16LL;
                }

                uint64_t v22 = *(void *)v21;
                uuidForBytes(v20);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = +[SABinary binaryWithUUID:absolutePath:]( &OBJC_CLASS___SABinary,  "binaryWithUUID:absolutePath:",  v23,  0LL);
                v25 = -[SABinary segmentWithCleanName:](v24, @"__TEXT");
                if (!v25)
                {
                  v25 = +[SASegment segmentWithBinary:name:length:]( (uint64_t)&OBJC_CLASS___SASegment,  v24,  @"__TEXT",  0LL);
                  -[SABinary addSegment:](v24, v25);
                }
                v26 = +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:]( &OBJC_CLASS___SABinaryLoadInfo,  v25,  v22,  1,  (void *)a1);
                [v13 addObject:v26];

                ++v18;
              }

              while (v16 != v18);
              uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
              uint64_t v16 = v27;
            }

            while (v27);
          }

          +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)&OBJC_CLASS___SABinaryLoadInfo, v13);
          uint64_t v28 = [v13 copy];
          v29 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v28;

          v6 = v30;
        }
      }
    }
  }
}

- (BOOL)synthetic
{
  return self->_textlayout_flags & 1;
}

- (BOOL)unslid
{
  return (LOBYTE(self->_textlayout_flags) >> 1) & 1;
}

- (void)enumerateFrames:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    if (v4)
    {
      id v5 = v3;
      +[SAFrame enumerateFrameTree:block:]((uint64_t)&OBJC_CLASS___SAFrame, v4, v3);
      id v3 = v5;
    }
  }
}

- (void)fixupFrameInstructionsWithNewInstructions:(_BYTE *)a3 foundNewBinaryInfo:
{
  id v5 = a2;
  if (a1)
  {
    if (a3) {
      *a3 = 0;
    }
    v6 = *(void **)(a1 + 40);
    if (v6)
    {
      id v7 = v5;
      +[SAFrame fixupLoadInfosInFrameTree:binaryLoadInfos:libraryCache:uuidsWithNewInstructions:]( (uint64_t)&OBJC_CLASS___SAFrame,  v6,  *(void **)(a1 + 24),  0LL,  v5);
      id v5 = v7;
    }
  }
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(NSString);
  unint64_t v4 = -[SAExclave identifier](self, "identifier");
  -[SAExclave name](self, "name");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)[v3 initWithFormat:@"exclave 0x%llx %@", v4, v5];

  return (NSString *)v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSArray)loadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)classDictionaryKey
{
  return @"SAExclave";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  v2 = self;
  if (self) {
    self = (SAExclave *)objc_getProperty(self, a2, 40LL, 1);
  }
  uint64_t v3 = -[SAExclave count](self, "count");
  -[SAExclave loadInfos](v2, "loadInfos");
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = 8 * ([v4 count] + v3) + 34;

  return v5;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  if (-[SAExclave sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v16 = *__error();
    _sa_logt();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = -[SAExclave debugDescription](self, "debugDescription");
      a3 = ($D4B2CDE5810726702A84729949394ECB *)[v18 UTF8String];
      *(_DWORD *)buf = 136315650;
      v46 = a3;
      __int16 v47 = 2048;
      unint64_t v48 = -[SAExclave sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v49 = 2048;
      unint64_t v50 = a4;
      _os_log_error_impl(&dword_186C92000, v17, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v16;
    id v19 = -[SAExclave debugDescription](self, "debugDescription");
    id v5 = (id)[v19 UTF8String];
    -[SAExclave sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(327, "%s: size %lu != buffer length %lu", v20, v21, v22, v23, v24, v25, (char)v5);

    _os_crash();
    __break(1u);
    goto LABEL_10;
  }

  *(_WORD *)&a3->var0 = 257;
  v10 = -[SAExclave name](self, "name");
  *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(v10, v9);

  *(unint64_t *)((char *)&a3->var2 + 2) = -[SAExclave identifier](self, "identifier");
  if (!self) {
    goto LABEL_16;
  }
  *(unint64_t *)((char *)&a3->var3 + 2) = self->_textlayout_flags;
  for (id i = objc_getProperty(self, v11, 40LL, 1); ; id i = 0LL)
  {
    a4 = (unint64_t)i;
    if ((unint64_t)[(id)a4 count] >= 0xFFFFFFFF)
    {
LABEL_10:
      int v26 = *__error();
      _sa_logt();
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v5 = -[SAExclave debugDescription](self, "debugDescription");
        a3 = ($D4B2CDE5810726702A84729949394ECB *)[v5 UTF8String];
        uint64_t v28 = [(id)a4 count];
        *(_DWORD *)buf = 136315394;
        v46 = a3;
        __int16 v47 = 2048;
        unint64_t v48 = v28;
        _os_log_error_impl(&dword_186C92000, v27, OS_LOG_TYPE_ERROR, "%s: %lu rootFrames", buf, 0x16u);
      }

      *__error() = v26;
      -[SAExclave debugDescription](self, "debugDescription");
      self = (SAExclave *) objc_claimAutoreleasedReturnValue();
      id v9 = (id)-[SAExclave UTF8String](self, "UTF8String");
      [(id)a4 count];
      _SASetCrashLogMessage(337, "%s: %lu rootFrames", v29, v30, v31, v32, v33, v34, (char)v9);

      _os_crash();
      __break(1u);
      goto LABEL_13;
    }

    unsigned int v13 = [(id)a4 count];
    *(_DWORD *)((char *)&a3->var4 + 2) = v13;
    SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var5 + 2, v13, (void *)a4, v9);
    -[SAExclave loadInfos](self, "loadInfos");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    int v35 = *__error();
    _sa_logt();
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v9 = -[SAExclave debugDescription](self, "debugDescription");
      a3 = ($D4B2CDE5810726702A84729949394ECB *)[v9 UTF8String];
      uint64_t v37 = [v5 count];
      *(_DWORD *)buf = 136315394;
      v46 = a3;
      __int16 v47 = 2048;
      unint64_t v48 = v37;
      _os_log_error_impl(&dword_186C92000, v36, OS_LOG_TYPE_ERROR, "%s: %lu loadInfos", buf, 0x16u);
    }

    *__error() = v35;
    -[SAExclave debugDescription](self, "debugDescription");
    self = (SAExclave *) objc_claimAutoreleasedReturnValue();
    char v38 = -[SAExclave UTF8String](self, "UTF8String");
    [v5 count];
    _SASetCrashLogMessage(343, "%s: %lu loadInfos", v39, v40, v41, v42, v43, v44, v38);

    _os_crash();
    __break(1u);
LABEL_16:
    *(unint64_t *)((char *)&a3->var3 + 2) = 0LL;
  }

  unsigned int v14 = [v5 count];
  *(_DWORD *)((char *)&a3->var4 + 6) = v14;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances( (char *)&a3->var5 + 8 * *(unsigned int *)((char *)&a3->var4 + 2) + 2,  v14,  v5,  v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    -[SAExclave name](self, "name");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 addSelfToSerializationDictionary:v4];

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    if (self) {
      id Property = objc_getProperty(self, v8, 40LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v10 = Property;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * v14++) addSelfToSerializationDictionary:v4];
        }

        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v12);
    }

    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    -[SAExclave loadInfos](self, "loadInfos", 0LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0LL;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * v19++) addSelfToSerializationDictionary:v4];
        }

        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }

      while (v17);
    }
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a4 <= 0x21)
  {
    int v7 = *__error();
    _sa_logt();
    objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v17 = a4;
      __int16 v18 = 2048;
      uint64_t v19 = 34LL;
      _os_log_error_impl( &dword_186C92000,  v8,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAExclave struct %lu",  buf,  0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(372, "bufferLength %lu < serialized SAExclave struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAExclave version",  0LL);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }

  id result = objc_alloc_init(&OBJC_CLASS___SAExclave);
  *((void *)result + 2) = *(void *)((char *)a3 + 10);
  *((void *)result + 4) = *(void *)((char *)a3 + 18);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  *(void *)&v49[5] = *MEMORY[0x1895F89C0];
  id v45 = a5;
  id v10 = a6;
  if (a4 <= 0x21)
  {
    int v27 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v47 = a4;
      __int16 v48 = 2048;
      *(void *)__int16 v49 = 34LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)a3,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAExclave struct %lu",  buf,  0x16u);
    }

    *__error() = v27;
    _SASetCrashLogMessage(387, "bufferLength %lu < serialized SAExclave struct %lu", v28, v29, v30, v31, v32, v33, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }

  if (8 * (unint64_t)(*(_DWORD *)((char *)a3 + 30) + *(_DWORD *)((char *)a3 + 26)) + 34 > a4)
  {
LABEL_8:
    int v34 = *__error();
    _sa_logt();
    int v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      int v36 = *(_DWORD *)((char *)a3 + 26);
      int v37 = *(_DWORD *)((char *)a3 + 30);
      *(_DWORD *)buf = 134218496;
      unint64_t v47 = a4;
      __int16 v48 = 1024;
      *(_DWORD *)__int16 v49 = v36;
      v49[2] = 1024;
      *(_DWORD *)&v49[3] = v37;
      _os_log_error_impl( &dword_186C92000,  v35,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAExclave struct with %u root frames, %u image infos",  buf,  0x18u);
    }

    *__error() = v34;
    _SASetCrashLogMessage( 389,  "bufferLength %lu < serialized SAExclave struct with %u root frames, %u image infos",  v38,  v39,  v40,  v41,  v42,  v43,  a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAExclave version",  0LL);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v44);
  }

  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v45, v11, v13, 0);
  uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v14;

  uint64_t v16 = (char *)a3 + 34;
  unint64_t v17 = (char *)a3 + 8 * *(unsigned int *)((char *)a3 + 26) + 34;
  uint64_t v18 = *(unsigned int *)((char *)a3 + 30);
  uint64_t v19 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)v17, v18, v45, v11, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v21 = (NSArray *)[v20 copy];
  loadInfos = self->_loadInfos;
  self->_loadInfos = v21;

  uint64_t v23 = *(unsigned int *)((char *)a3 + 26);
  __int128 v24 = (void *)objc_opt_class();
  SASerializableNewMutableSetFromIndexList((uint64_t)v16, v23, v45, v11, v24);
  __int128 v25 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  rootFrames = self->_rootFrames;
  self->_rootFrames = v25;
}

@end