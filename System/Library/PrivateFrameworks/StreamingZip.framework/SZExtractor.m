@interface SZExtractor
+ (BOOL)supportsSecureCoding;
+ (id)knownSZExtractorImplementations;
+ (int)servicePIDWithError:(id *)a3;
- (BOOL)_isValidObject;
- (BOOL)_synchronouslyPrepareForExtractionAtOffset:(unint64_t *)a3;
- (BOOL)doesConsumeExtractedData;
- (BOOL)hasHadPostSetupMethodsCalled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalExtractor;
- (BOOL)needsPreparation;
- (BOOL)privileged;
- (NSDictionary)options;
- (NSError)error;
- (NSString)description;
- (NSString)extractionPath;
- (NSXPCConnection)unzipServiceConnection;
- (OS_dispatch_queue)serialQueue;
- (SZExtractor)init;
- (SZExtractor)initWithCoder:(id)a3;
- (SZExtractor)initWithOptions:(id)a3;
- (SZExtractor)initWithPath:(id)a3 md5Hashes:(id)a4 hashedChunkSize:(unint64_t)a5 resumptionOffset:(unint64_t *)a6;
- (SZExtractor)initWithPath:(id)a3 options:(id)a4;
- (SZExtractor)initWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5;
- (SZExtractor)initWithPath:(id)a3 resumptionOffset:(unint64_t *)a4;
- (SZExtractorDelegate)delegate;
- (SZExtractorDelegate)extractorDelegate;
- (SZExtractorInternalDelegate)internalExtractorDelegate;
- (StreamingUnzipper)inProcessUnzipper;
- (id)_serviceConnectionWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForLocalExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5;
- (id)initForRemoteExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5;
- (unint64_t)hash;
- (unint64_t)lastResumptionOffset;
- (void)_invalidateObject;
- (void)_prepareForExtractionSynchronously:(BOOL)a3 withCompletionBlock:(id)a4;
- (void)_prepareForLocalExtraction:(id)a3;
- (void)_prepareForRemoteExtractionSynchronously:(BOOL)a3 withCompletionBlock:(id)a4;
- (void)_setUpWithPath:(id)a3 options:(id)a4;
- (void)_suspendStreamWithCompletionBlockSynchronously:(BOOL)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)finishStreamWithCompletionBlock:(id)a3;
- (void)prepareForExtraction:(id)a3;
- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4;
- (void)setActiveExtractorDelegateMethods:(int)a3;
- (void)setError:(id)a3;
- (void)setExtractionPath:(id)a3;
- (void)setExtractorDelegate:(id)a3;
- (void)setHasHadPostSetupMethodsCalled:(BOOL)a3;
- (void)setLastResumptionOffset:(unint64_t)a3;
- (void)setNeedsPreparation:(BOOL)a3;
- (void)setPrivileged:(BOOL)a3;
- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4;
- (void)suspendStreamWithCompletionBlock:(id)a3;
- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4;
@end

@implementation SZExtractor

+ (id)knownSZExtractorImplementations
{
  if (knownSZExtractorImplementations_onceToken != -1) {
    dispatch_once(&knownSZExtractorImplementations_onceToken, &__block_literal_global);
  }
  return (id)knownSZExtractorImplementations_result;
}

void __68__SZExtractor_KnownImplementations__knownSZExtractorImplementations__block_invoke()
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FE0] setWithObject:objc_opt_class()];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (dlopen("/System/Library/PrivateFrameworks/InstallCoordination.framework/InstallCoordination", 9))
  {
    uint64_t v2 = 0LL;
    char v3 = 1;
    *(void *)&__int128 v1 = 136315138LL;
    __int128 v11 = v1;
    do
    {
      char v4 = v3;
      v5 = off_189FE11C8[v2];
      Class Class = objc_getClass(v5);
      if (Class)
      {
        [v0 addObject:Class];
      }

      else
      {
        SZGetLoggingHandle();
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v11;
          v13 = (char *)v5;
          _os_log_impl(&dword_1870CA000, v7, OS_LOG_TYPE_DEFAULT, "Unable to find class %s", buf, 0xCu);
        }
      }

      char v3 = 0;
      uint64_t v2 = 1LL;
    }

    while ((v4 & 1) != 0);
  }

  else
  {
    SZGetLoggingHandle();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = dlerror();
      _os_log_impl( &dword_1870CA000,  v8,  OS_LOG_TYPE_DEFAULT,  "Unable to open InstallCoordination library: %s\n",  buf,  0xCu);
    }
  }

  uint64_t v9 = objc_msgSend(v0, "copy", v11);
  v10 = (void *)knownSZExtractorImplementations_result;
  knownSZExtractorImplementations_result = v9;
}

- (SZExtractor)init
{
  result = (SZExtractor *)_os_crash_msg();
  __break(1u);
  return result;
}

- (SZExtractor)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SZExtractor;
  v5 = -[SZExtractor init](&v15, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodePropertyListForKey:@"options"];
    options = v5->_options;
    v5->_options = (NSDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extractionPath"];
    extractionPath = v5->_extractionPath;
    v5->_extractionPath = (NSString *)v8;

    v5->_isLocalExtractor = [v4 decodeBoolForKey:@"isLocalExtractor"];
    v5->_privileged = [v4 decodeBoolForKey:@"privileged"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v4 connection];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_isLocalExtractor = 0;
      [v10 valueForEntitlement:@"com.apple.private.SZExtractor.privileged"];
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
      char v12 = [v11 BOOLValue];

      if ((v12 & 1) == 0) {
        v5->_privileged = 0;
      }
    }

    SZGetLoggingHandle();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1870CA000, v13, OS_LOG_TYPE_DEFAULT, "%@: deserialized", buf, 0xCu);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!-[SZExtractor needsPreparation](self, "needsPreparation")
    && -[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    SZGetLoggingHandle();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = self;
      _os_log_impl( &dword_1870CA000,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: suspending stream in preparation for serializing ourselves",  buf,  0xCu);
    }

    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __31__SZExtractor_encodeWithCoder___block_invoke;
    v8[3] = &unk_189FE1818;
    v8[4] = self;
    -[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]( self,  "_suspendStreamWithCompletionBlockSynchronously:completion:",  1LL,  v8);
  }

  [v4 encodeObject:self->_options forKey:@"options"];
  extractionPath = self->_extractionPath;
  if (extractionPath) {
    [v4 encodeObject:extractionPath forKey:@"extractionPath"];
  }
  [v4 encodeBool:self->_isLocalExtractor forKey:@"isLocalExtractor"];
  [v4 encodeBool:self->_privileged forKey:@"privileged"];
  SZGetLoggingHandle();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_impl(&dword_1870CA000, v7, OS_LOG_TYPE_DEFAULT, "%@: serialized", buf, 0xCu);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    [v5 options];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SZExtractor options](self, "options");
    int v8 = [v6 isEqual:v7];

    if (!v8) {
      goto LABEL_13;
    }
    uint64_t v9 = [v5 extractionPath];
    if (v9)
    {
      v10 = (void *)v9;
      -[SZExtractor extractionPath](self, "extractionPath");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11) {
        goto LABEL_13;
      }
    }

    [v5 extractionPath];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
    }

    else
    {
      v21 = -[SZExtractor extractionPath](self, "extractionPath");
      if (v21) {
        goto LABEL_13;
      }
    }

    uint64_t v13 = [v5 extractionPath];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      uint64_t v15 = -[SZExtractor extractionPath](self, "extractionPath");
      if (v15)
      {
        v16 = (void *)v15;
        [v5 extractionPath];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SZExtractor extractionPath](self, "extractionPath");
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        int v19 = [v17 isEqual:v18];

        if (v19) {
          goto LABEL_15;
        }
LABEL_13:
        LOBYTE(v20) = 0;
LABEL_16:

        goto LABEL_17;
      }
    }

- (unint64_t)hash
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[SZExtractor options](self, "options");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = [v4 hash];
  if (v3)
  {
    -[SZExtractor extractionPath](self, "extractionPath");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 ^= [v6 hash];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  -[SZExtractor extractionPath](self, "extractionPath");
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SZExtractor options](self, "options");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (_BYTE *)[v4 initWithPath:v5 options:v6];

  if (self->_isLocalExtractor) {
    v7[9] = 1;
  }
  if (self->_privileged) {
    v7[8] = 1;
  }
  return v7;
}

- (void)_setUpWithPath:(id)a3 options:(id)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [v7 objectForKeyedSubscript:@"SZExtractorOptionsHashesArray"];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v9 = v8;
      uint64_t v10 = [v7 objectForKeyedSubscript:@"SZExtractorOptionsHashedChunkSize"];
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        [v7 objectForKeyedSubscript:@"SZExtractorOptionsHashedChunkSize"];
        char v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass Class = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
LABEL_6:

          goto LABEL_7;
        }
      }

      v23 = (void *)MEMORY[0x189603F70];
      uint64_t v24 = *MEMORY[0x189603A60];
      v25 = @"SZExtractor requires SZExtractorOptionsHashedChunkSize if passing multiple hashes in SZExtractorOptionsHashesArray";
    }

    else
    {
      int v19 = (void *)NSString;
      int v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v19 stringWithFormat:@"SZExtractorOptionsHashesArray must be an array, but is a %@", v21];

      v23 = (void *)MEMORY[0x189603F70];
      uint64_t v24 = *MEMORY[0x189603A60];
      v25 = (const __CFString *)v22;
    }

    id v26 = [v23 exceptionWithName:v24 reason:v25 userInfo:0];
    objc_exception_throw(v26);
    -[SZExtractor initWithPath:options:](v27, v28, v29, v30);
    return;
  }

- (SZExtractor)initWithPath:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SZExtractor;
  int v8 = -[SZExtractor init](&v11, sel_init);
  id v9 = v8;
  if (v8) {
    -[SZExtractor _setUpWithPath:options:](v8, "_setUpWithPath:options:", v6, v7);
  }

  return v9;
}

- (SZExtractor)initWithOptions:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SZExtractor;
  unint64_t v5 = -[SZExtractor init](&v8, sel_init);
  id v6 = v5;
  if (v5) {
    -[SZExtractor _setUpWithPath:options:](v5, "_setUpWithPath:options:", 0LL, v4);
  }

  return v6;
}

- (SZExtractor)initWithPath:(id)a3 resumptionOffset:(unint64_t *)a4
{
  return -[SZExtractor initWithPath:options:resumptionOffset:]( self,  "initWithPath:options:resumptionOffset:",  a3,  0LL,  a4);
}

- (SZExtractor)initWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5
{
  id v6 = -[SZExtractor initWithPath:options:](self, "initWithPath:options:", a3, a4);
  id v7 = v6;
  if (v6
    && !-[SZExtractor _synchronouslyPrepareForExtractionAtOffset:]( v6,  "_synchronouslyPrepareForExtractionAtOffset:",  a5))
  {
    objc_super v8 = 0LL;
  }

  else
  {
    objc_super v8 = v7;
  }

  return v8;
}

- (SZExtractor)initWithPath:(id)a3 md5Hashes:(id)a4 hashedChunkSize:(unint64_t)a5 resumptionOffset:(unint64_t *)a6
{
  uint64_t v10 = (void *)MEMORY[0x189603F68];
  objc_super v11 = (void *)MEMORY[0x189607968];
  id v12 = a4;
  id v13 = a3;
  [v11 numberWithUnsignedLongLong:a5];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v10,  "dictionaryWithObjectsAndKeys:",  @"SZExtractorHashTypeMD5",  @"SZExtractorOptionsHashType",  v12,  @"SZExtractorOptionsHashesArray",  v14,  @"SZExtractorOptionsHashedChunkSize",  0);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[SZExtractor initWithPath:options:resumptionOffset:]( self,  "initWithPath:options:resumptionOffset:",  v13,  v15,  a6);
  return v16;
}

- (id)initForRemoteExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5
{
  id v6 = -[SZExtractor initWithPath:options:](self, "initWithPath:options:", a3, a4);
  id v7 = v6;
  if (v6
    && (v6->_isLocalExtractor = 0,
        !-[SZExtractor _synchronouslyPrepareForExtractionAtOffset:]( v6,  "_synchronouslyPrepareForExtractionAtOffset:",  a5)))
  {
    objc_super v8 = 0LL;
  }

  else
  {
    objc_super v8 = v7;
  }

  return v8;
}

- (id)initForLocalExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5
{
  id v6 = -[SZExtractor initWithPath:options:](self, "initWithPath:options:", a3, a4);
  id v7 = v6;
  if (v6
    && (v6->_isLocalExtractor = 1,
        !-[SZExtractor _synchronouslyPrepareForExtractionAtOffset:]( v6,  "_synchronouslyPrepareForExtractionAtOffset:",  a5)))
  {
    objc_super v8 = 0LL;
  }

  else
  {
    objc_super v8 = v7;
  }

  return v8;
}

- (BOOL)_synchronouslyPrepareForExtractionAtOffset:(unint64_t *)a3
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __58__SZExtractor__synchronouslyPrepareForExtractionAtOffset___block_invoke;
  v5[3] = &unk_189FE1840;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  -[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]( self,  "_prepareForExtractionSynchronously:withCompletionBlock:",  1LL,  v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_serviceConnectionWithError:(id *)a3
{
  if (-[SZExtractor privileged](self, "privileged")) {
    id v4 = @"com.apple.StreamingUnzipService.privileged";
  }
  else {
    id v4 = @"com.apple.StreamingUnzipService";
  }
  unint64_t v5 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithServiceName:v4];
  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&SZConfiguredStreamingUnzipProtocolInterface_lock);
    WeakRetained = objc_loadWeakRetained(&SZConfiguredStreamingUnzipProtocolInterface_weakInterface);
    if (!WeakRetained)
    {
      [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6BB4E8];
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak(&SZConfiguredStreamingUnzipProtocolInterface_weakInterface, WeakRetained);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&SZConfiguredStreamingUnzipProtocolInterface_lock);
    [v5 setRemoteObjectInterface:WeakRetained];

    id v7 = 0LL;
  }

  else
  {
    SZGetLoggingHandle();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl( &dword_1870CA000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to create NSXPCConnection",  (uint8_t *)&v11,  2u);
    }

    _CreateError( (uint64_t)"-[SZExtractor _serviceConnectionWithError:]",  447LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  0LL,  @"Failed to create NSXPCConnection",  v9,  v11);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      id v7 = v7;
      *a3 = v7;
    }
  }

  return v5;
}

- (void)_prepareForRemoteExtractionSynchronously:(BOOL)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StreamingZip.SZExtractorBufferSubmissionQueue", v7);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v8;

  -[SZExtractor serialQueue](self, "serialQueue");
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke;
  block[3] = &unk_189FE18E0;
  block[4] = self;
  id v13 = v6;
  BOOL v14 = a3;
  id v11 = v6;
  dispatch_sync(v10, block);
}

- (void)_prepareForLocalExtraction:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unint64_t v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  id v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StreamingZip.SZExtractor_in_process", v5);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v6;

  -[SZExtractor serialQueue](self, "serialQueue");
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42__SZExtractor__prepareForLocalExtraction___block_invoke;
  block[3] = &unk_189FE1930;
  block[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(v8, block);
}

- (void)_prepareForExtractionSynchronously:(BOOL)a3 withCompletionBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v6 = (void (**)(id, void, uint64_t))a4;
  SZGetLoggingHandle();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = self;
    _os_log_impl(&dword_1870CA000, v7, OS_LOG_TYPE_DEFAULT, "%@: preparing", buf, 0xCu);
  }

  -[SZExtractor extractionPath](self, "extractionPath");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    SZGetLoggingHandle();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1870CA000,  v11,  OS_LOG_TYPE_ERROR,  "extractionPath was nil. Did you mean to call -prepareForExtractionToPath:completionBlock: instead?",  buf,  2u);
    }

    _CreateError( (uint64_t)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]",  622LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"extractionPath was nil. Did you mean to call -prepareForExtractionToPath:completionBlock: instead?",  v12,  v20);
    goto LABEL_11;
  }

  if (-[SZExtractor hasHadPostSetupMethodsCalled](self, "hasHadPostSetupMethodsCalled"))
  {
    SZGetLoggingHandle();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = (SZExtractor *)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]";
      _os_log_error_impl( &dword_1870CA000,  v9,  OS_LOG_TYPE_ERROR,  "Calling %s after any calls to other non-init methods on this instance is an error.",  buf,  0xCu);
    }

    _CreateError( (uint64_t)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]",  628LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"Calling %s after any calls to other non-init methods on this instance is an error.",  v10,  (uint64_t)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]");
    uint64_t v13 = LABEL_11:;
LABEL_12:
    BOOL v14 = (void *)v13;
    v6[2](v6, 0LL, v13);

    goto LABEL_13;
  }

  if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    if (-[SZExtractor isLocalExtractor](self, "isLocalExtractor")) {
      -[SZExtractor _prepareForLocalExtraction:](self, "_prepareForLocalExtraction:", v6);
    }
    else {
      -[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]( self,  "_prepareForRemoteExtractionSynchronously:withCompletionBlock:",  v4,  v6);
    }
  }

  else
  {
    -[SZExtractor error](self, "error");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

    SZGetLoggingHandle();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        -[SZExtractor error](self, "error");
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = self;
        __int16 v23 = 2112;
        unint64_t v24 = (unint64_t)v18;
        _os_log_impl( &dword_1870CA000,  v16,  OS_LOG_TYPE_DEFAULT,  "%@: prepare called on extractor that had already returned error %@",  buf,  0x16u);
      }

      uint64_t v13 = -[SZExtractor error](self, "error");
      goto LABEL_12;
    }

    if (v17)
    {
      unint64_t v19 = -[SZExtractor lastResumptionOffset](self, "lastResumptionOffset");
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = self;
      __int16 v23 = 2048;
      unint64_t v24 = v19;
      _os_log_impl( &dword_1870CA000,  v16,  OS_LOG_TYPE_DEFAULT,  "%@: prepare called on object that was already prepared; returning resumption offset %llu",
        buf,
        0x16u);
    }

    v6[2](v6, -[SZExtractor lastResumptionOffset](self, "lastResumptionOffset"), 0LL);
  }

- (void)prepareForExtraction:(id)a3
{
}

- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  SZGetLoggingHandle();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl( &dword_1870CA000,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: preparing for extraction to path %@",  (uint8_t *)&v9,  0x16u);
  }

  -[SZExtractor setExtractionPath:](self, "setExtractionPath:", v6);
  -[SZExtractor prepareForExtraction:](self, "prepareForExtraction:", v7);
}

- (void)_invalidateObject
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (-[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    SZGetLoggingHandle();
    char v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = self;
      _os_log_impl(&dword_1870CA000, v3, OS_LOG_TYPE_DEFAULT, "%@: invalidating", (uint8_t *)&v7, 0xCu);
    }

    -[SZExtractor unzipServiceConnection](self, "unzipServiceConnection");
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 invalidate];

    unzipServiceConnection = self->_unzipServiceConnection;
    self->_unzipServiceConnection = 0LL;

    inProcessUnzipper = self->_inProcessUnzipper;
    self->_inProcessUnzipper = 0LL;
  }

- (BOOL)_isValidObject
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    BOOL v4 = 1;
  }

  else
  {
    -[SZExtractor inProcessUnzipper](self, "inProcessUnzipper");
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v4 = v5 != 0LL;
  }

  return v4;
}

- (BOOL)needsPreparation
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 == 0LL;

  return v3;
}

- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  SZGetTraceHandle();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v8;
    _os_signpost_emit_with_name_impl( &dword_1870CA000,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "SUPPLY_BYTES",  "%@: Supply bytes with length %lu began",  buf,  0x16u);
  }

  uint64_t v10 = MEMORY[0x1895F87A8];
  v51[0] = MEMORY[0x1895F87A8];
  v51[1] = 3221225472LL;
  v51[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke;
  v51[3] = &unk_189FE1958;
  uint64_t v53 = v8;
  id v11 = v7;
  id v52 = v11;
  id v12 = (void (**)(void, void, void))MEMORY[0x1895A0FB8](v51);
  -[SZExtractor error](self, "error");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    SZGetLoggingHandle();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[SZExtractor error](self, "error");
      unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      _os_log_error_impl( &dword_1870CA000,  v14,  OS_LOG_TYPE_ERROR,  "%@: supply called on extractor that had already returned error %@",  buf,  0x16u);
    }

    -[SZExtractor error](self, "error");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, uint64_t))v12)[2](v12, v15, 1LL);
  }

  else if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    SZGetLoggingHandle();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SZExtractor supplyBytes:withCompletionBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_error_impl( &dword_1870CA000,  v16,  OS_LOG_TYPE_ERROR,  "%s called before -[SZExtractor prepareForExtraction:] on %@",  buf,  0x16u);
    }

    _CreateError( (uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]",  704LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called before -[SZExtractor prepareForExtraction:] on %@",  v17,  (uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, uint64_t))v12)[2](v12, v15, 1LL);
  }

  else if (-[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    -[SZExtractor setHasHadPostSetupMethodsCalled:](self, "setHasHadPostSetupMethodsCalled:", 1LL);
    uint64_t v15 = (void *)[v6 copy];
    v49[0] = v10;
    v49[1] = 3221225472LL;
    v49[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_133;
    v49[3] = &unk_189FE1980;
    v49[4] = self;
    v50 = v12;
    uint64_t v18 = (void *)MEMORY[0x1895A0FB8](v49);
    -[SZExtractor inProcessUnzipper](self, "inProcessUnzipper");
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[SZExtractor serialQueue](self, "serialQueue");
      uint64_t v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = v10;
      block[1] = 3221225472LL;
      block[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_2;
      block[3] = &unk_189FE19A8;
      block[4] = self;
      id v47 = v15;
      id v48 = v18;
      id v21 = v18;
      dispatch_async(v20, block);
    }

    else
    {
      dispatch_group_t v25 = dispatch_group_create();
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v55 = __Block_byref_object_copy_;
      v56 = __Block_byref_object_dispose_;
      id v57 = 0LL;
      v44[0] = 0LL;
      v44[1] = v44;
      v44[2] = 0x2020000000LL;
      char v45 = 0;
      v40[0] = v10;
      v40[1] = 3221225472LL;
      v40[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_138;
      v40[3] = &unk_189FE19D0;
      v42 = buf;
      v43 = v44;
      id v26 = v25;
      v41 = v26;
      v27 = (void *)MEMORY[0x1895A0FB8](v40);
      -[SZExtractor serialQueue](self, "serialQueue");
      SEL v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v32[0] = v10;
      v32[1] = 3221225472LL;
      v32[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_2_140;
      v32[3] = &unk_189FE1AC0;
      id v33 = v15;
      id v34 = v26;
      __int16 v35 = self;
      id v36 = v27;
      id v37 = v18;
      v38 = buf;
      v39 = v44;
      id v29 = v18;
      id v30 = v27;
      v31 = v26;
      dispatch_async(v28, v32);

      _Block_object_dispose(v44, 8);
      _Block_object_dispose(buf, 8);
    }
  }

  else
  {
    SZGetLoggingHandle();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SZExtractor supplyBytes:withCompletionBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_error_impl(&dword_1870CA000, v22, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    _CreateError( (uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]",  710LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called on an invalidated object: %@",  v23,  (uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, uint64_t))v12)[2](v12, v15, 1LL);
  }
}

- (void)_suspendStreamWithCompletionBlockSynchronously:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v6 = (void (**)(id, void, uint64_t))a4;
  SZGetLoggingHandle();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = self;
    _os_log_impl(&dword_1870CA000, v7, OS_LOG_TYPE_DEFAULT, "%@: suspending stream", buf, 0xCu);
  }

  -[SZExtractor error](self, "error");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    SZGetLoggingHandle();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[SZExtractor error](self, "error");
      id v21 = (SZExtractor *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      id v33 = self;
      __int16 v34 = 2112;
      __int16 v35 = v21;
      _os_log_error_impl( &dword_1870CA000,  v9,  OS_LOG_TYPE_ERROR,  "%@: suspend called on extractor that had already returned error %@",  buf,  0x16u);
    }

    uint64_t v10 = -[SZExtractor error](self, "error");
    goto LABEL_18;
  }

  if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    SZGetLoggingHandle();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v33 = (SZExtractor *)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]";
      __int16 v34 = 2112;
      __int16 v35 = self;
      _os_log_error_impl( &dword_1870CA000,  v11,  OS_LOG_TYPE_ERROR,  "%s called before -[SZExtractor prepareForExtraction:] on %@",  buf,  0x16u);
    }

    _CreateError( (uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]",  891LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called before -[SZExtractor prepareForExtraction:] on %@",  v12,  (uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]");
    uint64_t v10 = LABEL_17:;
LABEL_18:
    uint64_t v20 = (void *)v10;
    v6[2](v6, 0LL, v10);

    goto LABEL_19;
  }

  if (!-[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    SZGetLoggingHandle();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v33 = (SZExtractor *)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]";
      __int16 v34 = 2112;
      __int16 v35 = self;
      _os_log_error_impl(&dword_1870CA000, v18, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    _CreateError( (uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]",  897LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called on an invalidated object: %@",  v19,  (uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]");
    goto LABEL_17;
  }

  -[SZExtractor setHasHadPostSetupMethodsCalled:](self, "setHasHadPostSetupMethodsCalled:", 1LL);
  uint64_t v13 = MEMORY[0x1895F87A8];
  v30[0] = MEMORY[0x1895F87A8];
  v30[1] = 3221225472LL;
  v30[2] = __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke;
  v30[3] = &unk_189FE1AE8;
  v30[4] = self;
  v31 = v6;
  BOOL v14 = (void *)MEMORY[0x1895A0FB8](v30);
  -[SZExtractor inProcessUnzipper](self, "inProcessUnzipper");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SZExtractor serialQueue](self, "serialQueue");
    v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472LL;
    block[2] = __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke_2;
    block[3] = &unk_189FE1930;
    block[4] = self;
    id v29 = v14;
    id v17 = v14;
    dispatch_async(v16, block);
  }

  else
  {
    v26[0] = v13;
    v26[1] = 3221225472LL;
    v26[2] = __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke_3;
    v26[3] = &unk_189FE1B10;
    id v27 = v14;
    id v22 = v14;
    uint64_t v23 = (void *)MEMORY[0x1895A0FB8](v26);
    -[SZExtractor unzipServiceConnection](self, "unzipServiceConnection");
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_t v25 = v24;
    if (v4) {
      [v24 synchronousRemoteObjectProxyWithErrorHandler:v23];
    }
    else {
      [v24 remoteObjectProxyWithErrorHandler:v23];
    }
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    [v17 suspendStreamWithReply:v22];
  }

LABEL_19:
}

- (void)suspendStreamWithCompletionBlock:(id)a3
{
}

- (void)finishStreamWithCompletionBlock:(id)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  BOOL v4 = (void (**)(id, uint64_t))a3;
  SZGetLoggingHandle();
  unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = self;
    _os_log_impl(&dword_1870CA000, v5, OS_LOG_TYPE_DEFAULT, "%@: finishing stream", buf, 0xCu);
  }

  -[SZExtractor error](self, "error");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    SZGetLoggingHandle();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[SZExtractor error](self, "error");
      uint64_t v20 = (SZExtractor *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = self;
      __int16 v32 = 2112;
      id v33 = v20;
      _os_log_error_impl( &dword_1870CA000,  v7,  OS_LOG_TYPE_ERROR,  "%@: finish called on extractor that had already returned error %@",  buf,  0x16u);
    }

    uint64_t v8 = -[SZExtractor error](self, "error");
    goto LABEL_18;
  }

  if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    SZGetLoggingHandle();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = (SZExtractor *)"-[SZExtractor finishStreamWithCompletionBlock:]";
      __int16 v32 = 2112;
      id v33 = self;
      _os_log_error_impl( &dword_1870CA000,  v9,  OS_LOG_TYPE_ERROR,  "%s called before -[SZExtractor prepareForExtraction:] on %@",  buf,  0x16u);
    }

    _CreateError( (uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]",  949LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called before -[SZExtractor prepareForExtraction:] on %@",  v10,  (uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]");
    uint64_t v8 = LABEL_17:;
LABEL_18:
    uint64_t v19 = (void *)v8;
    v4[2](v4, v8);

    goto LABEL_19;
  }

  if (!-[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    SZGetLoggingHandle();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = (SZExtractor *)"-[SZExtractor finishStreamWithCompletionBlock:]";
      __int16 v32 = 2112;
      id v33 = self;
      _os_log_error_impl(&dword_1870CA000, v17, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    _CreateError( (uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]",  955LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called on an invalidated object: %@",  v18,  (uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]");
    goto LABEL_17;
  }

  -[SZExtractor setHasHadPostSetupMethodsCalled:](self, "setHasHadPostSetupMethodsCalled:", 1LL);
  uint64_t v11 = MEMORY[0x1895F87A8];
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke;
  v28[3] = &unk_189FE1890;
  v28[4] = self;
  id v29 = v4;
  uint64_t v12 = (void *)MEMORY[0x1895A0FB8](v28);
  -[SZExtractor inProcessUnzipper](self, "inProcessUnzipper");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SZExtractor serialQueue](self, "serialQueue");
    BOOL v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472LL;
    block[2] = __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke_2;
    block[3] = &unk_189FE1930;
    block[4] = self;
    id v27 = v12;
    id v15 = v12;
    dispatch_async(v14, block);

    v16 = v27;
  }

  else
  {
    -[SZExtractor unzipServiceConnection](self, "unzipServiceConnection");
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    v24[1] = 3221225472LL;
    v24[2] = __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke_3;
    v24[3] = &unk_189FE1B10;
    dispatch_group_t v25 = v12;
    id v22 = v12;
    [v21 remoteObjectProxyWithErrorHandler:v24];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 finishStreamWithReply:v22];

    v16 = v25;
  }

LABEL_19:
}

- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v6 = (SZExtractor *)a3;
  id v7 = (void (**)(id, uint64_t))a4;
  SZGetLoggingHandle();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = self;
    __int16 v35 = 2112;
    uint64_t v36 = v6;
    _os_log_impl(&dword_1870CA000, v8, OS_LOG_TYPE_DEFAULT, "%@: terminating stream with error %@", buf, 0x16u);
  }

  -[SZExtractor error](self, "error");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    SZGetLoggingHandle();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[SZExtractor error](self, "error");
      uint64_t v23 = (SZExtractor *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v34 = self;
      __int16 v35 = 2112;
      uint64_t v36 = v23;
      _os_log_error_impl( &dword_1870CA000,  v10,  OS_LOG_TYPE_ERROR,  "%@: terminate called on extractor that had already returned error %@",  buf,  0x16u);
    }

    uint64_t v11 = -[SZExtractor error](self, "error");
    goto LABEL_18;
  }

  if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    SZGetLoggingHandle();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = (SZExtractor *)"-[SZExtractor terminateStreamWithError:completionBlock:]";
      __int16 v35 = 2112;
      uint64_t v36 = self;
      _os_log_error_impl( &dword_1870CA000,  v12,  OS_LOG_TYPE_ERROR,  "%s called before -[SZExtractor prepareForExtraction:] on %@",  buf,  0x16u);
    }

    _CreateError( (uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]",  993LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called before -[SZExtractor prepareForExtraction:] on %@",  v13,  (uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]");
    uint64_t v11 = LABEL_17:;
LABEL_18:
    id v22 = (void *)v11;
    v7[2](v7, v11);

    goto LABEL_19;
  }

  if (!-[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    SZGetLoggingHandle();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = (SZExtractor *)"-[SZExtractor terminateStreamWithError:completionBlock:]";
      __int16 v35 = 2112;
      uint64_t v36 = self;
      _os_log_error_impl(&dword_1870CA000, v20, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    _CreateError( (uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]",  999LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"%s called on an invalidated object: %@",  v21,  (uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]");
    goto LABEL_17;
  }

  -[SZExtractor setHasHadPostSetupMethodsCalled:](self, "setHasHadPostSetupMethodsCalled:", 1LL);
  -[SZExtractor setError:](self, "setError:", v6);
  uint64_t v14 = MEMORY[0x1895F87A8];
  v31[0] = MEMORY[0x1895F87A8];
  v31[1] = 3221225472LL;
  v31[2] = __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke;
  v31[3] = &unk_189FE1890;
  v31[4] = self;
  __int16 v32 = v7;
  id v15 = (void *)MEMORY[0x1895A0FB8](v31);
  v16 = -[SZExtractor inProcessUnzipper](self, "inProcessUnzipper");
  if (v16)
  {
    -[SZExtractor serialQueue](self, "serialQueue");
    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v14;
    block[1] = 3221225472LL;
    block[2] = __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke_2;
    block[3] = &unk_189FE1930;
    block[4] = self;
    id v30 = v15;
    id v18 = v15;
    dispatch_async(v17, block);

    uint64_t v19 = v30;
  }

  else
  {
    -[SZExtractor unzipServiceConnection](self, "unzipServiceConnection");
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v14;
    v27[1] = 3221225472LL;
    v27[2] = __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke_3;
    v27[3] = &unk_189FE1B10;
    SEL v28 = v15;
    id v25 = v15;
    [v24 remoteObjectProxyWithErrorHandler:v27];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 terminateStreamWithReply:v25];

    uint64_t v19 = v28;
  }

LABEL_19:
}

- (BOOL)doesConsumeExtractedData
{
  return 0;
}

- (void)setExtractorDelegate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  BOOL v4 = (char *)a3;
  if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    SZGetLoggingHandle();
    unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412546;
      uint64_t v14 = self;
      __int16 v15 = 2080;
      v16 = "-[SZExtractor setExtractorDelegate:]";
      id v6 = "%@: %s was called before -[SZExtractor prepareForExtraction:]; this doesn't do anything";
LABEL_20:
      _os_log_error_impl(&dword_1870CA000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v13, 0x16u);
      goto LABEL_17;
    }

    goto LABEL_17;
  }

  BOOL v7 = -[SZExtractor _isValidObject](self, "_isValidObject");
  SZGetLoggingHandle();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412546;
      uint64_t v14 = self;
      __int16 v15 = 2080;
      v16 = "-[SZExtractor setExtractorDelegate:]";
      id v6 = "%@: %s was called on an invalidated object";
      goto LABEL_20;
    }

- (SZExtractorDelegate)delegate
{
  uint64_t v2 = -[SZExtractor internalExtractorDelegate](self, "internalExtractorDelegate");
  BOOL v3 = (void *)v2;
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
  }
  else {
    id WeakRetained = 0LL;
  }

  return (SZExtractorDelegate *)WeakRetained;
}

- (SZExtractorDelegate)extractorDelegate
{
  uint64_t v2 = -[SZExtractor internalExtractorDelegate](self, "internalExtractorDelegate");
  BOOL v3 = (void *)v2;
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
  }
  else {
    id WeakRetained = 0LL;
  }

  return (SZExtractorDelegate *)WeakRetained;
}

- (void)setActiveExtractorDelegateMethods:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  SZGetLoggingHandle();
  unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int v13 = self;
    __int16 v14 = 1024;
    int v15 = v3;
    _os_log_impl( &dword_1870CA000,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: setting active extractor delegate methods to 0x%x",  buf,  0x12u);
  }

  -[SZExtractor inProcessUnzipper](self, "inProcessUnzipper");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SZExtractor serialQueue](self, "serialQueue");
    BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __49__SZExtractor_setActiveExtractorDelegateMethods___block_invoke;
    block[3] = &unk_189FE1B38;
    block[4] = self;
    int v11 = v3;
    dispatch_async(v7, block);
  }

  else
  {
    -[SZExtractor unzipServiceConnection](self, "unzipServiceConnection");
    BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __49__SZExtractor_setActiveExtractorDelegateMethods___block_invoke_2;
    v9[3] = &unk_189FE1B60;
    v9[4] = self;
    -[dispatch_queue_s remoteObjectProxyWithErrorHandler:](v7, "remoteObjectProxyWithErrorHandler:", v9);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setActiveDelegateMethods:v3];
  }
}

- (NSString)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SZExtractor extractionPath](self, "extractionPath");
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 lastPathComponent];
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SZExtractor extractionPath](self, "extractionPath");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringByDeletingLastPathComponent];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 lastPathComponent];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    [NSString stringWithFormat:@"pathEnding:%@/%@", v8, v5];
    char v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    char v9 = @"path:nil";
  }

  uint64_t v10 = (void *)NSString;
  int v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v13 = -[SZExtractor needsPreparation](self, "needsPreparation");
  -[SZExtractor unzipServiceConnection](self, "unzipServiceConnection");
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SZExtractor error](self, "error");
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = 89LL;
  if (v14) {
    uint64_t v17 = 89LL;
  }
  else {
    uint64_t v17 = 78LL;
  }
  if (v13) {
    uint64_t v16 = 78LL;
  }
  [v10 stringWithFormat:@"<%@<%p> prepared:%c valid:%c %@ error:%@>", v12, self, v16, v17, v9, v15];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (NSString)extractionPath
{
  return self->_extractionPath;
}

- (void)setExtractionPath:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (BOOL)privileged
{
  return self->_privileged;
}

- (void)setPrivileged:(BOOL)a3
{
  self->_privileged = a3;
}

- (unint64_t)lastResumptionOffset
{
  return self->_lastResumptionOffset;
}

- (void)setLastResumptionOffset:(unint64_t)a3
{
  self->_lastResumptionOffset = a3;
}

- (NSXPCConnection)unzipServiceConnection
{
  return self->_unzipServiceConnection;
}

- (StreamingUnzipper)inProcessUnzipper
{
  return self->_inProcessUnzipper;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (SZExtractorInternalDelegate)internalExtractorDelegate
{
  return self->_internalExtractorDelegate;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)isLocalExtractor
{
  return self->_isLocalExtractor;
}

- (void)setNeedsPreparation:(BOOL)a3
{
  self->_needsPreparation = a3;
}

- (BOOL)hasHadPostSetupMethodsCalled
{
  return self->_hasHadPostSetupMethodsCalled;
}

- (void)setHasHadPostSetupMethodsCalled:(BOOL)a3
{
  self->_hasHadPostSetupMethodsCalled = a3;
}

- (void).cxx_destruct
{
}

void __49__SZExtractor_setActiveExtractorDelegateMethods___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setActiveDelegateMethods:*(unsigned int *)(a1 + 40)];
}

void __49__SZExtractor_setActiveExtractorDelegateMethods___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SZGetLoggingHandle();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl( &dword_1870CA000,  v4,  OS_LOG_TYPE_ERROR,  "%@: Failed to set delegate methods enabled: %@",  (uint8_t *)&v6,  0x16u);
  }
}

void __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SZGetLoggingHandle();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl( &dword_1870CA000,  v4,  OS_LOG_TYPE_DEFAULT,  "%@: calling completion block with error %@",  (uint8_t *)&v6,  0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 terminateStreamWithReply:*(void *)(a1 + 40)];
}

uint64_t __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SZGetLoggingHandle();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl( &dword_1870CA000,  v4,  OS_LOG_TYPE_DEFAULT,  "%@: calling completion block with error %@",  (uint8_t *)&v6,  0x16u);
  }

  if (v3) {
    [*(id *)(a1 + 32) setError:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 finishStreamWithReply:*(void *)(a1 + 40)];
}

uint64_t __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  SZGetLoggingHandle();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl( &dword_1870CA000,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: calling completion block with offset %llu, error %@",  (uint8_t *)&v8,  0x20u);
  }

  if (v5) {
    [*(id *)(a1 + 32) setError:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke_2( uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 suspendStreamWithReply:*(void *)(a1 + 40)];
}

uint64_t __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke_3( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SZGetTraceHandle();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      int v6 = 78;
    }
    else {
      int v6 = 89;
    }
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 1024;
    int v10 = v6;
    _os_signpost_emit_with_name_impl( &dword_1870CA000,  v4,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "SUPPLY_BYTES",  "Supply bytes with length %lu succeeded: %c",  (uint8_t *)&v7,  0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_133(uint64_t a1, void *a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  SZGetLoggingHandle();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_error_impl( &dword_1870CA000,  v7,  OS_LOG_TYPE_ERROR,  "%@: calling completion block with error %@",  (uint8_t *)&v11,  0x16u);
    }

    [*(id *)(a1 + 32) setError:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    [*(id *)(a1 + 32) _invalidateObject];
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (a3) {
        int v10 = 89;
      }
      else {
        int v10 = 78;
      }
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 1024;
      LODWORD(v14) = v10;
      _os_log_debug_impl( &dword_1870CA000,  v7,  OS_LOG_TYPE_DEBUG,  "%@: calling completion block with no error, dataComplete=%c",  (uint8_t *)&v11,  0x12u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 supplyBytes:*(void *)(a1 + 40) withReply:*(void *)(a1 + 48)];
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_138( uint64_t a1,  void *a2,  char a3,  uint64_t a4)
{
  id v11 = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void *)(v8 + 40);
  uint64_t v9 = (id *)(v8 + 40);
  if (!v10) {
    objc_storeStrong(v9, a2);
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
  _sAvailableExtractionMemory += a4;
  pthread_cond_broadcast(&_sAvailableExtractionMemoryCondition);
  pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_2_140(uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  uint64_t v2 = [*(id *)(a1 + 32) length];
  if ((unint64_t)(v2 - 5242881) >= 0xFFFFFFFFFFB00000LL)
  {
    unint64_t v3 = v2;
    pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
    if (_sAvailableExtractionMemory >= v3) {
      _sAvailableExtractionMemory -= v3;
    }
    else {
      unint64_t v3 = 0LL;
    }
    pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
  }

  else
  {
    unint64_t v3 = 0LL;
  }

  if (v3 == [*(id *)(a1 + 32) length])
  {
    SZGetLoggingHandle();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v3;
      _os_log_debug_impl( &dword_1870CA000,  v4,  OS_LOG_TYPE_DEBUG,  "Supplying entire byte range data of length %lu",  buf,  0xCu);
    }

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    SZGetTraceHandle();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v3;
      _os_signpost_emit_with_name_impl( &dword_1870CA000,  v5,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Sending buffer of size %lu to the unzip service over XPC",  buf,  0xCu);
    }

    [*(id *)(a1 + 48) unzipServiceConnection];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x1895F87A8];
    v61[1] = 3221225472LL;
    v61[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_143;
    v61[3] = &unk_189FE19F8;
    v62 = (os_log_s *)*(id *)(a1 + 56);
    unint64_t v63 = v3;
    [v6 remoteObjectProxyWithErrorHandler:v61];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = *(void *)(a1 + 32);
    v58[0] = MEMORY[0x1895F87A8];
    v58[1] = 3221225472LL;
    v58[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_144;
    v58[3] = &unk_189FE1958;
    id v59 = *(id *)(a1 + 56);
    unint64_t v60 = v3;
    [v7 supplyBytes:v8 withReply:v58];

    uint64_t v9 = v62;
    goto LABEL_62;
  }

  SZGetTraceHandle();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    uint64_t v11 = [*(id *)(a1 + 32) length];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v11;
    _os_signpost_emit_with_name_impl( &dword_1870CA000,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "FRAGMENT_DATA",  "Starting fragmentation of the supplied buffer of length : %lu",  buf,  0xCu);
  }

  if ([*(id *)(a1 + 32) length])
  {
    unint64_t v12 = 0LL;
    unint64_t v41 = 0LL;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      uint64_t v54 = 0LL;
      v55 = &v54;
      uint64_t v56 = 0x2020000000LL;
      uint64_t v57 = 0LL;
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      unint64_t v18 = v13 - v12 + v41;
      if (v18)
      {
        pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
        unint64_t v19 = _sAvailableExtractionMemory;
        if (!((unint64_t)_sAvailableExtractionMemory >> 17))
        {
          do
          {
            pthread_cond_wait(&_sAvailableExtractionMemoryCondition, &_sAvailableExtractionMemoryMutex);
            unint64_t v19 = _sAvailableExtractionMemory;
          }

          while ((unint64_t)_sAvailableExtractionMemory < 0x20000);
        }

        if (v19 < v18) {
          unint64_t v18 = v19;
        }
        _sAvailableExtractionMemory = v19 - v18;
        pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
        uint64_t v20 = (unint64_t *)(v55 + 3);
      }

      else
      {
        uint64_t v20 = (unint64_t *)&v57;
      }

      *uint64_t v20 = v18;
      SZGetLoggingHandle();
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v36 = v55[3];
        *(_DWORD *)buf = 134218752;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2048;
        v71 = (void *)v13;
        LOWORD(v72) = 2048;
        *(void *)((char *)&v72 + 2) = v41;
        _os_log_debug_impl( &dword_1870CA000,  v21,  OS_LOG_TYPE_DEBUG,  "Reserved %ld bytes at %ld for too-big partial range {%lu, %lu}",  buf,  0x2Au);
      }

LABEL_49:
      SZGetLoggingHandle();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v35 = v55[3];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v35;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v12;
        _os_log_debug_impl( &dword_1870CA000,  v25,  OS_LOG_TYPE_DEBUG,  "Supplying byte range data of length %lu at location %lu",  buf,  0x16u);
      }

      id v26 = (void *)MEMORY[0x1895A0E38]();
      objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", v12, v55[3]);
      id v27 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      SZGetTraceHandle();
      SEL v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v28))
      {
        uint64_t v29 = [v27 length];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v29;
        _os_signpost_emit_with_name_impl( &dword_1870CA000,  v28,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Sending buffer of size %lu to the unzip service over XPC",  buf,  0xCu);
      }

      [*(id *)(a1 + 48) unzipServiceConnection];
      id v30 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1895F87A8];
      v49[1] = 3221225472LL;
      v49[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_164;
      v49[3] = &unk_189FE1A48;
      id v51 = *(id *)(a1 + 56);
      id v52 = &v54;
      id v31 = v27;
      id v50 = v31;
      [v30 remoteObjectProxyWithErrorHandler:v49];
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1895F87A8];
      v45[1] = 3221225472LL;
      v45[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_165;
      v45[3] = &unk_189FE1A70;
      id v47 = *(id *)(a1 + 56);
      id v48 = &v54;
      id v33 = v31;
      id v46 = v33;
      [v32 supplyBytes:v33 withReply:v45];

      objc_autoreleasePoolPop(v26);
      v12 += v55[3];
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_58;
      }
      if (v12 >= v41 + v13)
      {
        SZGetLoggingHandle();
        uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = v13;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v41;
          _os_log_debug_impl( &dword_1870CA000,  v34,  OS_LOG_TYPE_DEBUG,  "Active partial range {%lu, %lu} exhausted",  buf,  0x16u);
        }

        unint64_t v41 = 0LL;
LABEL_58:
        uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      }

      _Block_object_dispose(&v54, 8);
      if (v12 >= [*(id *)(a1 + 32) length]) {
        goto LABEL_60;
      }
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3010000000LL;
    v71 = &unk_1870F6FAD;
    __int128 v72 = xmmword_1870ED260;
    id v14 = *(void **)(a1 + 32);
    v53[0] = MEMORY[0x1895F87A8];
    v53[1] = 3221225472LL;
    v53[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_146;
    v53[3] = &unk_189FE1A20;
    v53[5] = buf;
    v53[6] = v12;
    v53[4] = &v54;
    [v14 enumerateByteRangesUsingBlock:v53];
    if (!v55[3])
    {
      uint64_t v13 = *(void *)(*(void *)&buf[8] + 32LL);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        __assert_rtn( "-[SZExtractor supplyBytes:withCompletionBlock:]_block_invoke_2",  "SZExtractor.m",  822,  "NSNotFound != lastByteRange.location");
      }
      unint64_t v15 = *(void *)(*(void *)&buf[8] + 40LL);
      if (v15 > 0x500000)
      {
        pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
        unint64_t v22 = _sAvailableExtractionMemory;
        if (!((unint64_t)_sAvailableExtractionMemory >> 17))
        {
          do
          {
            pthread_cond_wait(&_sAvailableExtractionMemoryCondition, &_sAvailableExtractionMemoryMutex);
            unint64_t v22 = _sAvailableExtractionMemory;
          }

          while ((unint64_t)_sAvailableExtractionMemory < 0x20000);
        }

        if (v22 >= v15) {
          unint64_t v23 = v15;
        }
        else {
          unint64_t v23 = v22;
        }
        _sAvailableExtractionMemory = v22 - v23;
        pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
        v55[3] = v23;
        SZGetLoggingHandle();
        unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v38 = v55[3];
          *(_DWORD *)v64 = 134218496;
          uint64_t v65 = v38;
          __int16 v66 = 2048;
          uint64_t v67 = v13;
          __int16 v68 = 2048;
          unint64_t v69 = v15;
          _os_log_debug_impl( &dword_1870CA000,  v24,  OS_LOG_TYPE_DEBUG,  "Reserved %ld bytes for too-big partial range {%lu, %lu}",  v64,  0x20u);
        }

        unint64_t v41 = v15;
        goto LABEL_48;
      }

      SZGetLoggingHandle();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v37 = *(void *)(*(void *)&buf[8] + 40LL);
        *(_DWORD *)v64 = 134217984;
        uint64_t v65 = v37;
        _os_log_debug_impl( &dword_1870CA000,  v16,  OS_LOG_TYPE_DEBUG,  "Waiting for %lu bytes to become available",  v64,  0xCu);
      }

      unint64_t v17 = *(void *)(*(void *)&buf[8] + 40LL);
      if (v17)
      {
        pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
        while (_sAvailableExtractionMemory < v17)
          pthread_cond_wait(&_sAvailableExtractionMemoryCondition, &_sAvailableExtractionMemoryMutex);
        _sAvailableExtractionMemory -= v17;
        pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
      }

      v55[3] = v17;
    }

    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_48:
    _Block_object_dispose(buf, 8);
    goto LABEL_49;
  }

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_143(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  SZGetTraceHandle();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl( &dword_1870CA000,  v2,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Finished (Succeeded: N) processing buffer of size %lu sent to the unzip service over XPC",  (uint8_t *)&v4,  0xCu);
  }
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_144(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  SZGetTraceHandle();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (a2) {
      int v6 = 78;
    }
    else {
      int v6 = 89;
    }
    v7[0] = 67109376;
    v7[1] = v6;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_signpost_emit_with_name_impl( &dword_1870CA000,  v4,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Finished (Succeeded: %c) processing buffer of size %lu sent to the unzip service over XPC",  (uint8_t *)v7,  0x12u);
  }
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_146( void *a1,  uint64_t a2,  unint64_t a3,  unint64_t a4,  _BYTE *a5)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (a3 + a4 <= a1[6])
  {
    SZGetLoggingHandle();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 134218240;
      unint64_t v16 = a3;
      __int16 v17 = 2048;
      unint64_t v18 = a4;
      _os_log_debug_impl( &dword_1870CA000,  v10,  OS_LOG_TYPE_DEBUG,  "Already processed {%lu, %lu}",  (uint8_t *)&v15,  0x16u);
    }
  }

  else
  {
    if (a4 - 5242881 >= 0xFFFFFFFFFFB00000LL)
    {
      pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
      if (_sAvailableExtractionMemory >= a4)
      {
        _sAvailableExtractionMemory -= a4;
        unint64_t v9 = a4;
      }

      else
      {
        unint64_t v9 = 0LL;
      }

      pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
    }

    else
    {
      unint64_t v9 = 0LL;
    }

    SZGetLoggingHandle();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v9 == a4)
    {
      if (v12)
      {
        unint64_t v14 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
        int v15 = 134218240;
        unint64_t v16 = a4;
        __int16 v17 = 2048;
        unint64_t v18 = v14;
        _os_log_debug_impl( &dword_1870CA000,  v11,  OS_LOG_TYPE_DEBUG,  "Reserved %ld bytes; adding to existing length %ld",
          (uint8_t *)&v15,
          0x16u);
      }

      *(void *)(*(void *)(a1[4] + 8LL) + 24LL) += a4;
    }

    else
    {
      if (v12)
      {
        int v15 = 134218240;
        unint64_t v16 = a3;
        __int16 v17 = 2048;
        unint64_t v18 = a4;
        _os_log_debug_impl( &dword_1870CA000,  v11,  OS_LOG_TYPE_DEBUG,  "Failed to reserve last range; falling out with last range {%lu, %lu}",
          (uint8_t *)&v15,
          0x16u);
      }

      uint64_t v13 = *(void *)(a1[5] + 8LL);
      *(void *)(v13 + 32) = a3;
      *(void *)(v13 + 40) = a4;
      *a5 = 1;
    }
  }

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_164(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  SZGetTraceHandle();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) length];
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl( &dword_1870CA000,  v2,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Finished (Succeeded: N) processing buffer of size %lu sent to the unzip service over XPC",  (uint8_t *)&v4,  0xCu);
  }
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_165(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  SZGetTraceHandle();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    if (v3) {
      int v5 = 78;
    }
    else {
      int v5 = 89;
    }
    uint64_t v6 = [*(id *)(a1 + 32) length];
    v7[0] = 67109376;
    v7[1] = v5;
    __int16 v8 = 2048;
    uint64_t v9 = v6;
    _os_signpost_emit_with_name_impl( &dword_1870CA000,  v4,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Finished (Succeeded: %c) processing buffer of size %lu sent to the unzip service over XPC",  (uint8_t *)v7,  0x12u);
  }
}

uint64_t __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_168(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16LL))( a1[4],  *(void *)(*(void *)(a1[5] + 8LL) + 40LL),  *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL));
}

void __42__SZExtractor__prepareForLocalExtraction___block_invoke(uint64_t a1)
{
  v37[1] = *MEMORY[0x1895F89C0];
  id v2 = -[StreamingUnzipper initForClient:connection:]( objc_alloc(&OBJC_CLASS___StreamingUnzipper),  "initForClient:connection:",  @"In-process unzipper",  0LL);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  int v5 = objc_alloc_init(&OBJC_CLASS___SZExtractorInternalDelegate);
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v5;

  [MEMORY[0x1896078A8] defaultManager];
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) extractionPath];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v10 = [v8 fileExistsAtPath:v9];

  if ((v10 & 1) != 0) {
    goto LABEL_4;
  }
  uint64_t v36 = *MEMORY[0x189607500];
  [MEMORY[0x189607968] numberWithUnsignedShort:16877];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v37 forKeys:&v36 count:1];
  BOOL v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896078A8] defaultManager];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) extractionPath];
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v31 = 0LL;
  int v15 = [v13 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:v12 error:&v31];
  dispatch_queue_t v16 = (dispatch_queue_t)v31;

  if (v15)
  {

LABEL_4:
    [*(id *)(a1 + 32) inProcessUnzipper];
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) extractionPath];
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) options];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = __42__SZExtractor__prepareForLocalExtraction___block_invoke_2;
    v30[3] = &unk_189FE1908;
    v30[4] = *(void *)(a1 + 32);
    [v17 setupUnzipperWithOutputPath:v18 sandboxExtensionToken:0 options:v19 withReply:v30];

    [*(id *)(a1 + 32) internalExtractorDelegate];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) inProcessUnzipper];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setInProcessExtractorDelegate:v20];

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    BOOL v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.StreamingZip.SZExtractor_in_proces_delegate", v12);
    [*(id *)(a1 + 32) inProcessUnzipper];
    unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 setInProcessDelegateQueue:v16];
    goto LABEL_8;
  }

  SZGetLoggingHandle();
  unint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    [*(id *)(a1 + 32) extractionPath];
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v33 = v29;
    __int16 v34 = 2112;
    dispatch_queue_t v35 = v16;
    _os_log_error_impl( &dword_1870CA000,  v23,  OS_LOG_TYPE_ERROR,  "Failed to create extraction directory at path %@: %@",  buf,  0x16u);
  }

  [*(id *)(a1 + 32) extractionPath];
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateError( (uint64_t)"-[SZExtractor _prepareForLocalExtraction:]_block_invoke",  594LL,  @"SZExtractorErrorDomain",  1LL,  v16,  0LL,  @"Failed to create extraction directory at path %@: %@",  v25,  (uint64_t)v24);
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) setError:v22];
LABEL_8:

  uint64_t v26 = *(void *)(a1 + 40);
  uint64_t v27 = [*(id *)(a1 + 32) lastResumptionOffset];
  [*(id *)(a1 + 32) error];
  SEL v28 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v26 + 16))(v26, v27, v28);
}

uint64_t __42__SZExtractor__prepareForLocalExtraction___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setLastResumptionOffset:a3];
}

void __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke( uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  bzero(__s, 0x400uLL);
  id v2 = *(void **)(a1 + 32);
  id v72 = 0LL;
  uint64_t v3 = [v2 _serviceConnectionWithError:&v72];
  int v4 = (char *)v72;
  int v5 = *(void **)(*(void *)(a1 + 32) + 40LL);
  *(void *)(*(void *)(a1 + 32) + 40LL) = v3;

  [*(id *)(a1 + 32) unzipServiceConnection];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = v6 == 0LL;

  if (!(_DWORD)v3)
  {
    int v7 = objc_alloc_init(&OBJC_CLASS___SZExtractorInternalDelegate);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 64);
    *(void *)(v8 + 64) = v7;

    os_unfair_lock_lock((os_unfair_lock_t)&SZConfiguredStreamingUnzipDelegateProtocolInterface_lock);
    id WeakRetained = objc_loadWeakRetained(&SZConfiguredStreamingUnzipDelegateProtocolInterface_weakInterface);
    if (!WeakRetained)
    {
      [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B96C8];
      id WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak(&SZConfiguredStreamingUnzipDelegateProtocolInterface_weakInterface, WeakRetained);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&SZConfiguredStreamingUnzipDelegateProtocolInterface_lock);
    [*(id *)(a1 + 32) unzipServiceConnection];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setExportedInterface:WeakRetained];

    [*(id *)(a1 + 32) internalExtractorDelegate];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) unzipServiceConnection];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setExportedObject:v12];

    objc_initWeak((id *)location, *(id *)(a1 + 32));
    uint64_t v14 = MEMORY[0x1895F87A8];
    v70[0] = MEMORY[0x1895F87A8];
    v70[1] = 3221225472LL;
    v70[2] = __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2;
    v70[3] = &unk_189FE1868;
    objc_copyWeak(&v71, (id *)location);
    uint64_t v15 = [*(id *)(a1 + 32) unzipServiceConnection];
    [(id)v15 setInterruptionHandler:v70];

    v68[0] = v14;
    v68[1] = 3221225472LL;
    v68[2] = __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_87;
    v68[3] = &unk_189FE1868;
    objc_copyWeak(&v69, (id *)location);
    [*(id *)(a1 + 32) unzipServiceConnection];
    dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setInvalidationHandler:v68];

    objc_destroyWeak(&v69);
    objc_destroyWeak(&v71);
    objc_destroyWeak((id *)location);
    [*(id *)(a1 + 32) unzipServiceConnection];
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 resume];

    [MEMORY[0x1896078A8] defaultManager];
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) extractionPath];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = [v18 fileExistsAtPath:v19];

    if ((v15 & 1) != 0)
    {
      uint64_t v20 = v4;
    }

    else
    {
      uint64_t v78 = *MEMORY[0x189607500];
      [MEMORY[0x189607968] numberWithUnsignedShort:16877];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v21;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x1896078A8] defaultManager];
      unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) extractionPath];
      unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v67 = v4;
      int v25 = [v23 createDirectoryAtPath:v24 withIntermediateDirectories:1 attributes:v22 error:&v67];
      uint64_t v20 = v67;

      if (!v25)
      {
        SZGetLoggingHandle();
        unint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          [*(id *)(a1 + 32) extractionPath];
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138412546;
          *(void *)&location[4] = v61;
          __int16 v74 = 2112;
          v75 = v20;
          _os_log_error_impl( &dword_1870CA000,  v41,  OS_LOG_TYPE_ERROR,  "Failed to create extraction directory at path %@: %@",  location,  0x16u);
        }

        [*(id *)(a1 + 32) extractionPath];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError( (uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke",  510LL,  @"SZExtractorErrorDomain",  1LL,  v20,  0LL,  @"Failed to create extraction directory at path %@: %@",  v43,  (uint64_t)v42);
        __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();

        [*(id *)(a1 + 32) setError:v44];
LABEL_22:
        int v4 = v20;
        goto LABEL_23;
      }
    }

    id v26 = [MEMORY[0x1896078A8] defaultManager];
    [*(id *)(a1 + 32) extractionPath];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v28 = realpath_DARWIN_EXTSN((const char *)[v26 fileSystemRepresentationWithPath:v27], __s) == 0;

    if (v28)
    {
      uint64_t v36 = *__error();
      SZGetLoggingHandle();
      uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        [*(id *)(a1 + 32) extractionPath];
        id v59 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v60 = strerror(v36);
        *(_DWORD *)location = 138412802;
        *(void *)&location[4] = v59;
        __int16 v74 = 2080;
        v75 = __s;
        __int16 v76 = 2080;
        v77 = v60;
        _os_log_error_impl( &dword_1870CA000,  v37,  OS_LOG_TYPE_ERROR,  "Failed to realpath %@ at %s: %s",  location,  0x20u);
      }

      [*(id *)(a1 + 32) extractionPath];
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v36);
      _CreateError( (uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke",  517LL,  (void *)*MEMORY[0x189607688],  v36,  0LL,  0LL,  @"Failed to realpath %@ at %s: %s",  v39,  (uint64_t)v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      [*(id *)(a1 + 32) setError:v40];
    }

    else
    {
      uint64_t v29 = (void *)sandbox_extension_issue_file();
      if (v29)
      {
        [MEMORY[0x1896078A8] defaultManager];
        id v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 stringWithFileSystemRepresentation:__s length:strlen(__s)];
        id v31 = (void *)objc_claimAutoreleasedReturnValue();

        v65[0] = v14;
        v65[1] = 3221225472LL;
        v65[2] = __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_99;
        v65[3] = &unk_189FE1890;
        v65[4] = *(void *)(a1 + 32);
        id v66 = *(id *)(a1 + 40);
        __int16 v32 = (void *)MEMORY[0x1895A0FB8](v65);
        BOOL v33 = *(_BYTE *)(a1 + 48) == 0;
        [*(id *)(a1 + 32) unzipServiceConnection];
        __int16 v34 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_queue_t v35 = v34;
        if (v33) {
          [v34 remoteObjectProxyWithErrorHandler:v32];
        }
        else {
          [v34 synchronousRemoteObjectProxyWithErrorHandler:v32];
        }
        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();

        [*(id *)(a1 + 32) options];
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = v14;
        v63[1] = 3221225472LL;
        v63[2] = __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_103;
        v63[3] = &unk_189FE18B8;
        v63[4] = *(void *)(a1 + 32);
        id v64 = *(id *)(a1 + 40);
        [v57 setupUnzipperWithOutputPath:v31 sandboxExtensionToken:v29 options:v58 withReply:v63];

        free(v29);
        goto LABEL_28;
      }

      uint64_t v45 = *__error();
      SZGetLoggingHandle();
      id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v62 = strerror(v45);
        *(_DWORD *)location = 136315394;
        *(void *)&location[4] = __s;
        __int16 v74 = 2080;
        v75 = v62;
        _os_log_error_impl( &dword_1870CA000,  v46,  OS_LOG_TYPE_ERROR,  "Failed to issue sandbox extension for %s : %s",  location,  0x16u);
      }

      strerror(v45);
      _CreateError( (uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke",  525LL,  (void *)*MEMORY[0x189607688],  v45,  0LL,  0LL,  @"Failed to issue sandbox extension for %s : %s",  v47,  (uint64_t)__s);
      id v48 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) setError:v48];
    }

    goto LABEL_22;
  }

  [*(id *)(a1 + 32) setError:v4];
LABEL_23:
  SZGetLoggingHandle();
  v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    id v50 = *(void **)(a1 + 32);
    uint64_t v51 = [v50 lastResumptionOffset];
    [*(id *)(a1 + 32) error];
    id v52 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138412802;
    *(void *)&location[4] = v50;
    __int16 v74 = 2048;
    v75 = (char *)v51;
    __int16 v76 = 2112;
    v77 = v52;
    _os_log_impl( &dword_1870CA000,  v49,  OS_LOG_TYPE_DEFAULT,  "%@: calling prepare completion block with offset %llu, error %@",  location,  0x20u);
  }

  uint64_t v53 = *(void *)(a1 + 40);
  uint64_t v54 = [*(id *)(a1 + 32) lastResumptionOffset];
  [*(id *)(a1 + 32) error];
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v53 + 16))(v53, v54, v55);

  [*(id *)(a1 + 32) error];
  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56) {
    [*(id *)(a1 + 32) _invalidateObject];
  }
  uint64_t v20 = v4;
LABEL_28:
}

void __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SZGetLoggingHandle();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v5) = 0;
    _os_log_error_impl( &dword_1870CA000,  v2,  OS_LOG_TYPE_ERROR,  "Connection interrupted to streaming unzip service.",  (uint8_t *)&v5,  2u);
  }

  _CreateError( (uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke",  490LL,  (void *)*MEMORY[0x189607460],  4097LL,  0LL,  0LL,  @"Connection interrupted to streaming unzip service.",  v3,  v5);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [WeakRetained setError:v4];

  [WeakRetained _invalidateObject];
}

void __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_87( uint64_t a1)
{
  v7[1] = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)MEMORY[0x189607870];
  uint64_t v3 = *MEMORY[0x189607460];
  uint64_t v6 = *MEMORY[0x1896075E0];
  v7[0] = @"Connection invalidated to streaming unzip service.";
  [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 errorWithDomain:v3 code:4099 userInfo:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [WeakRetained setError:v5];

  [WeakRetained _invalidateObject];
}

void __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_99( uint64_t a1,  void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SZGetLoggingHandle();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1870CA000, v4, OS_LOG_TYPE_ERROR, "%@: prepare returning error %@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 32) setError:v3];
  [*(id *)(a1 + 32) setLastResumptionOffset:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_103( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if (v5) {
    [*(id *)(a1 + 32) setError:v5];
  }
  [*(id *)(a1 + 32) setLastResumptionOffset:a3];
  SZGetLoggingHandle();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl( &dword_1870CA000,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: calling prepare completion block with offset %llu, error %@",  (uint8_t *)&v8,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if (v5) {
    [*(id *)(a1 + 32) _invalidateObject];
  }
}

void __58__SZExtractor__synchronouslyPrepareForExtractionAtOffset___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (v5)
  {
    SZGetLoggingHandle();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_error_impl( &dword_1870CA000,  v6,  OS_LOG_TYPE_ERROR,  "%@: prepare for extraction failed: %@",  (uint8_t *)&v8,  0x16u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  else
  {
    **(void **)(a1 + 48) = a2;
  }
}

void __31__SZExtractor_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    SZGetLoggingHandle();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl( &dword_1870CA000,  v5,  OS_LOG_TYPE_ERROR,  "%@: Suspending stream prior to encoding failed with error: %@",  (uint8_t *)&v7,  0x16u);
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)servicePIDWithError:(id *)a3
{
  uint64_t v21 = 0LL;
  unint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  unint64_t v24 = __Block_byref_object_copy_;
  int v25 = __Block_byref_object_dispose_;
  id v26 = 0LL;
  uint64_t v17 = 0LL;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = -1;
  id v4 = objc_alloc(&OBJC_CLASS___SZExtractor);
  id v5 = -[SZExtractor initWithOptions:](v4, "initWithOptions:", MEMORY[0x189604A60]);
  uint64_t v6 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __44__SZExtractor_Testing__servicePIDWithError___block_invoke;
  v16[3] = &unk_189FE1B88;
  v16[4] = &v21;
  int v7 = (void *)MEMORY[0x1895A0FB8](v16);
  uint64_t v8 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  -[SZExtractor _serviceConnectionWithError:](v5, "_serviceConnectionWithError:", &obj);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);
  if (!v9)
  {
    uint64_t v11 = 0LL;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  [v9 resume];
  [v9 synchronousRemoteObjectProxyWithErrorHandler:v7];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = v10;
  if (v10)
  {
    v14[0] = v6;
    v14[1] = 3221225472LL;
    v14[2] = __44__SZExtractor_Testing__servicePIDWithError___block_invoke_2;
    v14[3] = &unk_189FE1BB0;
    v14[4] = &v21;
    v14[5] = &v17;
    [v10 getPidForTestingWithReply:v14];
  }

  if (a3)
  {
LABEL_7:
    if (*((_DWORD *)v18 + 6) == -1) {
      *a3 = (id) v22[5];
    }
  }

void __44__SZExtractor_Testing__servicePIDWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SZGetLoggingHandle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_error_impl( &dword_1870CA000,  v4,  OS_LOG_TYPE_ERROR,  "remoteObjectProxy returning error %@",  (uint8_t *)&v7,  0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __44__SZExtractor_Testing__servicePIDWithError___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2 < 0)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
    id v6 = v7;
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  }
}

@end