@interface SAFrameIterator
- (BOOL)assumeUserBinaryLoadInfosContainMainBinary;
- (BOOL)checkLR;
- (BOOL)hasKernelStack;
- (BOOL)hasStack;
- (BOOL)hasSwiftAsyncStack;
- (BOOL)hasUserStack;
- (BOOL)isKernelStackTruncated;
- (BOOL)isSwiftAsyncStackTruncated;
- (BOOL)isUserStackTruncated;
- (NSArray)kernelBinaryLoadInfos;
- (NSArray)userBinaryLoadInfos;
- (NSMutableDictionary)addressTranslations;
- (NSString)debugDescription;
- (SAFrameIterator)init;
- (SASharedCache)sharedCache;
- (uint64_t)addressForStackDepth:(uint64_t *)a3 frames:(uint64_t)a4 numFrames:(int)a5 isUserspace:(int)a6 isSwiftAsync:(BOOL *)a7 isLeaf:(_DWORD *)a8 frameIndexUsed:;
- (uint64_t)translatedAddressForNativeAddress:(uint64_t)a1;
- (unint64_t)backtracer;
- (unint64_t)continuation;
- (unint64_t)kernelFrames;
- (unint64_t)swiftAsyncFrames;
- (unint64_t)userFrames;
- (unsigned)exclaveInsertionIndex;
- (unsigned)numKernelFrames;
- (unsigned)numSwiftAsyncFrames;
- (unsigned)numUserFrames;
- (unsigned)swiftAsyncStitchIndex;
- (void)binaryLoadInfoForUserAddress:(void *)a1;
- (void)clearTaskData;
- (void)clearThreadData;
- (void)dealloc;
- (void)iterateFramesWithBacktraceStyle:(unint64_t)a3 block:(id)a4;
- (void)setAddressTranslations:(id)a3;
- (void)setAssumeUserBinaryLoadInfosContainMainBinary:(BOOL)a3;
- (void)setBacktracer:(unint64_t)a3;
- (void)setCheckLR:(BOOL)a3;
- (void)setContinuation:(unint64_t)a3;
- (void)setExclaveInsertionIndex:(unsigned int)a3;
- (void)setIsKernelStackTruncated:(BOOL)a3;
- (void)setIsSwiftAsyncStackTruncated:(BOOL)a3;
- (void)setIsUserStackTruncated:(BOOL)a3;
- (void)setKernelBinaryLoadInfos:(id)a3;
- (void)setKernelFrames:(unint64_t *)a3;
- (void)setNumKernelFrames:(unsigned int)a3;
- (void)setNumSwiftAsyncFrames:(unsigned int)a3;
- (void)setNumUserFrames:(unsigned int)a3;
- (void)setSharedCache:(id)a3;
- (void)setSwiftAsyncFrames:(unint64_t *)a3;
- (void)setSwiftAsyncStitchIndex:(unsigned int)a3;
- (void)setUserBinaryLoadInfos:(id)a3;
- (void)setUserFrames:(unint64_t *)a3;
@end

@implementation SAFrameIterator

- (SAFrameIterator)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SAFrameIterator;
  v2 = -[SAFrameIterator init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SAFrame);
    frame = v2->_frame;
    v2->_frame = v3;

    v5 = (SAExclaveFrame *)-[SAExclaveFrame initWithExclave:](objc_alloc(&OBJC_CLASS___SAExclaveFrame), 0LL);
    exclaveFrame = v2->_exclaveFrame;
    v2->_exclaveFrame = v5;

    v7 = v2->_exclaveFrame;
    if (v7) {
      v7->super._BOOLs.bits |= 8u;
    }
    v2->_exclaveInsertionIndex = -1;
  }

  return v2;
}

- (void)binaryLoadInfoForUserAddress:(void *)a1
{
  if (a1)
  {
    a1 = +[SABinaryLoadInfo binaryLoadInfoForAddress:inBinaryLoadInfos:libraryCache:]( &OBJC_CLASS___SABinaryLoadInfo,  "binaryLoadInfoForAddress:inBinaryLoadInfos:libraryCache:",  a2,  a1[8],  a1[10]);
  }

  return a1;
}

- (uint64_t)translatedAddressForNativeAddress:(uint64_t)a1
{
  uint64_t v2 = a2;
  v3 = *(void **)(a1 + 120);
  if (v3)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a2];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v5];
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      uint64_t v7 = [v6 unsignedLongLongValue];
      if (v7)
      {
LABEL_7:

        return v7;
      }
    }

    else
    {
      [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_super v9 = *(void **)(a1 + 120);
      [MEMORY[0x189607968] numberWithUnsignedLongLong:v2];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setObject:v8 forKeyedSubscript:v10];
    }

    uint64_t v7 = v2;
    goto LABEL_7;
  }

  return v2;
}

- (uint64_t)addressForStackDepth:(uint64_t *)a3 frames:(uint64_t)a4 numFrames:(int)a5 isUserspace:(int)a6 isSwiftAsync:(BOOL *)a7 isLeaf:(_DWORD *)a8 frameIndexUsed:
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (!a3 || (uint64_t v9 = a4, !(_DWORD)a4))
  {
    int v24 = *__error();
    _sa_logt();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_186C92000, v25, OS_LOG_TYPE_ERROR, "No frames", buf, 2u);
    }

    *__error() = v24;
    _SASetCrashLogMessage(643, "No frames", v26, v27, v28, v29, v30, v31, v40);
    _os_crash();
    __break(1u);
LABEL_61:
    int v32 = *__error();
    _sa_logt();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v42 = v8;
      __int16 v43 = 1024;
      int v44 = v9;
      _os_log_error_impl(&dword_186C92000, v33, OS_LOG_TYPE_ERROR, "stack depth %d, but only %d frames", buf, 0xEu);
    }

    *__error() = v32;
    _SASetCrashLogMessage(644, "stack depth %d, but only %d frames", v34, v35, v36, v37, v38, v39, v8);
    _os_crash();
    __break(1u);
  }

  unsigned int v8 = a2;
  if (a6)
  {
    int v12 = ~a2 + a4;
    if (!a8) {
      return a3[v12];
    }
    goto LABEL_27;
  }

  switch(*(void *)(a1 + 56))
  {
    case 0LL:
      goto LABEL_26;
    case 1LL:
      int v15 = a4 - 1;
      if ((_DWORD)a4 - 1 == a2)
      {
        if ((_DWORD)a4 != 1) {
          goto LABEL_42;
        }
        *a7 = 1;
        if (a8) {
          *a8 = 0;
        }
        if (!a5 || !*(void *)(a1 + 120)) {
          return *a3;
        }
        return -[SAFrameIterator translatedAddressForNativeAddress:](a1, *a3);
      }

      int v12 = a4 - 2 - a2;
      *a7 = (_DWORD)a4 - 2 == a2;
      if (a8) {
        *a8 = v12;
      }
      if (a5 && (_DWORD)a4 - 2 == a2 && *(void *)(a1 + 120))
      {
        uint64_t v19 = *a3;
        uint64_t v9 = -[SAFrameIterator translatedAddressForNativeAddress:](a1, *a3);
        if (v9 == v19)
        {
          if (*(_BYTE *)(a1 + 28))
          {
            uint64_t v20 = a3[v15];
            uint64_t v21 = -[SAFrameIterator translatedAddressForNativeAddress:](a1, v20);
            if (v21 == v20) {
              return v19;
            }
            else {
              return v21;
            }
          }

          else
          {
            return v19;
          }
        }

        return v9;
      }

      return a3[v12];
    case 2LL:
      int v12 = ~a2 + a4;
      *a7 = v12 == 0;
      if (a8) {
        *a8 = v12;
      }
      if (!a5 || v12 || !*(void *)(a1 + 120)) {
        return a3[v12];
      }
      return -[SAFrameIterator translatedAddressForNativeAddress:](a1, *a3);
    case 3LL:
      if (!a5 || !*(void *)(a1 + 120) || (int v17 = a4 - 2, v18 = a4 - 1, (_DWORD)a4 - 2 != a2) && v18 != a2)
      {
LABEL_26:
        int v12 = ~a2 + a4;
        *a7 = v12 == 0;
        if (!a8) {
          return a3[v12];
        }
LABEL_27:
        *a8 = v12;
        return a3[v12];
      }

      uint64_t v9 = *a3;
      uint64_t v22 = -[SAFrameIterator translatedAddressForNativeAddress:](a1, *a3);
      if (v22 != v9)
      {
        if (v17 == v8)
        {
          *a7 = 0;
          if (a8) {
            *a8 = 1;
          }
          return a3[1];
        }

        *a7 = 1;
        if (a8) {
          *a8 = 0;
        }
        return v22;
      }

      if (v18 != v8)
      {
        *a7 = 1;
        uint64_t v23 = a3[1];
        uint64_t v22 = -[SAFrameIterator translatedAddressForNativeAddress:](a1, v23);
        if (v22 == v23)
        {
          if (a8) {
            *a8 = 0;
          }
          return v9;
        }

        if (a8) {
          *a8 = 1;
        }
        return v22;
      }

- (void)iterateFramesWithBacktraceStyle:(unint64_t)a3 block:(id)a4
{
  uint64_t v127 = *MEMORY[0x1895F89C0];
  unsigned int v8 = (void (**)(id, SAFrame *))a4;
  if ((a3 & 2) != 0) {
    goto LABEL_70;
  }
  if ((a3 & 8) != 0 && (a3 & 0x14) != 0)
  {
    int v63 = *__error();
    _sa_logt();
    self = (SAFrameIterator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v122 = a3;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)self,  OS_LOG_TYPE_ERROR,  "backtrace style specified both swift async only and prefer/only C root frames: 0x%llx",  buf,  0xCu);
    }

    *__error() = v63;
    _SASetCrashLogMessage( 850,  "backtrace style specified both swift async only and prefer/only C root frames: 0x%llx",  v64,  v65,  v66,  v67,  v68,  v69,  a3);
    _os_crash();
    __break(1u);
    goto LABEL_115;
  }

  unsigned int numUserFrames = self->_numUserFrames;
  unint64_t backtracer = self->_backtracer;
  if (backtracer - 2 < 2) {
    goto LABEL_7;
  }
  if (backtracer == 1)
  {
    BOOL v11 = numUserFrames >= 2;
    unsigned int v12 = numUserFrames - 2;
LABEL_9:
    if (v11) {
      LODWORD(v4) = v12;
    }
    else {
      LODWORD(v4) = 0;
    }
    goto LABEL_12;
  }

  if (!backtracer)
  {
LABEL_7:
    BOOL v11 = numUserFrames != 0;
    unsigned int v12 = numUserFrames - 1;
    goto LABEL_9;
  }

- (void)clearThreadData
{
  userFrames = self->_userFrames;
  if (userFrames) {
    free(userFrames);
  }
  self->_userFrames = 0LL;
  self->_unsigned int numUserFrames = 0;
  self->_isUserStackTruncated = 0;
  swiftAsyncFrames = self->_swiftAsyncFrames;
  if (swiftAsyncFrames) {
    free(swiftAsyncFrames);
  }
  self->_swiftAsyncFrames = 0LL;
  self->_unsigned int isSwiftAsyncStackTruncated = 0;
  self->_uint64_t numSwiftAsyncFrames = 0;
  self->_unsigned int swiftAsyncStitchIndex = 0;
  kernelFrames = self->_kernelFrames;
  if (kernelFrames) {
    free(kernelFrames);
  }
  self->_kernelFrames = 0LL;
  self->_unint64_t continuation = 0LL;
  *(void *)&self->_unsigned int numKernelFrames = 0xFFFFFFFF00000000LL;
  *(_WORD *)&self->_isKernelStackTruncated = 0;
}

- (void)clearTaskData
{
  userBinaryLoadInfos = self->_userBinaryLoadInfos;
  self->_userBinaryLoadInfos = 0LL;

  self->_assumeUserBinaryLoadInfosContainMainBinary = 0;
  sharedCache = self->_sharedCache;
  self->_sharedCache = 0LL;

  addressTranslations = self->_addressTranslations;
  self->_addressTranslations = 0LL;
}

- (BOOL)hasStack
{
  return -[SAFrameIterator hasUserStack](self, "hasUserStack")
      || -[SAFrameIterator hasKernelStack](self, "hasKernelStack");
}

- (BOOL)hasUserStack
{
  return self->_numUserFrames != 0;
}

- (BOOL)hasSwiftAsyncStack
{
  return self->_numSwiftAsyncFrames || self->_isSwiftAsyncStackTruncated;
}

- (BOOL)hasKernelStack
{
  return self->_numKernelFrames || self->_continuation != 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SAFrameIterator;
  -[SAFrameIterator dealloc](&v3, sel_dealloc);
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(NSString);
  uint64_t numKernelFrames = self->_numKernelFrames;
  if ((_DWORD)numKernelFrames) {
    unint64_t v5 = *self->_kernelFrames;
  }
  else {
    unint64_t v5 = 0LL;
  }
  uint64_t numUserFrames = self->_numUserFrames;
  if ((_DWORD)numUserFrames) {
    unint64_t v7 = *self->_userFrames;
  }
  else {
    unint64_t v7 = 0LL;
  }
  uint64_t numSwiftAsyncFrames = self->_numSwiftAsyncFrames;
  if ((_DWORD)numSwiftAsyncFrames) {
    unint64_t v9 = *self->_swiftAsyncFrames;
  }
  else {
    unint64_t v9 = 0LL;
  }
  return (NSString *)(id)objc_msgSend( v3,  "initWithFormat:",  @"stack with %d kernel frames (leaf 0x%llx), %d user (leaf 0x%llx), %d swift async (leaf 0x%llx), backtracer %llu, exclave@%u",  numKernelFrames,  v5,  numUserFrames,  v7,  numSwiftAsyncFrames,  v9,  self->_backtracer,  self->_exclaveInsertionIndex);
}

- (unint64_t)backtracer
{
  return self->_backtracer;
}

- (void)setBacktracer:(unint64_t)a3
{
  self->_unint64_t backtracer = a3;
}

- (BOOL)assumeUserBinaryLoadInfosContainMainBinary
{
  return self->_assumeUserBinaryLoadInfosContainMainBinary;
}

- (void)setAssumeUserBinaryLoadInfosContainMainBinary:(BOOL)a3
{
  self->_assumeUserBinaryLoadInfosContainMainBinary = a3;
}

- (NSArray)userBinaryLoadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setUserBinaryLoadInfos:(id)a3
{
}

- (NSArray)kernelBinaryLoadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setKernelBinaryLoadInfos:(id)a3
{
}

- (SASharedCache)sharedCache
{
  return (SASharedCache *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setSharedCache:(id)a3
{
}

- (unint64_t)userFrames
{
  return self->_userFrames;
}

- (void)setUserFrames:(unint64_t *)a3
{
  self->_userFrames = a3;
}

- (unsigned)numUserFrames
{
  return self->_numUserFrames;
}

- (void)setNumUserFrames:(unsigned int)a3
{
  self->_uint64_t numUserFrames = a3;
}

- (BOOL)isUserStackTruncated
{
  return self->_isUserStackTruncated;
}

- (void)setIsUserStackTruncated:(BOOL)a3
{
  self->_isUserStackTruncated = a3;
}

- (unint64_t)swiftAsyncFrames
{
  return self->_swiftAsyncFrames;
}

- (void)setSwiftAsyncFrames:(unint64_t *)a3
{
  self->_swiftAsyncFrames = a3;
}

- (unsigned)numSwiftAsyncFrames
{
  return self->_numSwiftAsyncFrames;
}

- (void)setNumSwiftAsyncFrames:(unsigned int)a3
{
  self->_uint64_t numSwiftAsyncFrames = a3;
}

- (unsigned)swiftAsyncStitchIndex
{
  return self->_swiftAsyncStitchIndex;
}

- (void)setSwiftAsyncStitchIndex:(unsigned int)a3
{
  self->_unsigned int swiftAsyncStitchIndex = a3;
}

- (BOOL)isSwiftAsyncStackTruncated
{
  return self->_isSwiftAsyncStackTruncated;
}

- (void)setIsSwiftAsyncStackTruncated:(BOOL)a3
{
  self->_unsigned int isSwiftAsyncStackTruncated = a3;
}

- (unint64_t)kernelFrames
{
  return self->_kernelFrames;
}

- (void)setKernelFrames:(unint64_t *)a3
{
  self->_kernelFrames = a3;
}

- (unsigned)numKernelFrames
{
  return self->_numKernelFrames;
}

- (void)setNumKernelFrames:(unsigned int)a3
{
  self->_uint64_t numKernelFrames = a3;
}

- (unint64_t)continuation
{
  return self->_continuation;
}

- (void)setContinuation:(unint64_t)a3
{
  self->_unint64_t continuation = a3;
}

- (unsigned)exclaveInsertionIndex
{
  return self->_exclaveInsertionIndex;
}

- (void)setExclaveInsertionIndex:(unsigned int)a3
{
  self->_exclaveInsertionIndex = a3;
}

- (BOOL)isKernelStackTruncated
{
  return self->_isKernelStackTruncated;
}

- (void)setIsKernelStackTruncated:(BOOL)a3
{
  self->_isKernelStackTruncated = a3;
}

- (NSMutableDictionary)addressTranslations
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setAddressTranslations:(id)a3
{
}

- (BOOL)checkLR
{
  return self->_checkLR;
}

- (void)setCheckLR:(BOOL)a3
{
  self->_checkLR = a3;
}

- (void).cxx_destruct
{
}

@end