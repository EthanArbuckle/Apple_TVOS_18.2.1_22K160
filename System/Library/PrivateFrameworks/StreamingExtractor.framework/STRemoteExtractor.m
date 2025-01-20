@interface STRemoteExtractor
+ (BOOL)supportsSecureCoding;
+ (id)STAEAExtractorWithOptions:(id)a3;
+ (id)fullReplacementSTAEAExtractor:(id)a3;
+ (id)incrementalPatchSTAEAExtractor:(id)a3 srcDirectory:(id)a4;
- (BOOL)dataStreamStarted;
- (BOOL)doesConsumeExtractedData;
- (BOOL)finalBytesSent;
- (BOOL)isInvalid;
- (BOOL)isPrepared;
- (BOOL)privileged;
- (BOOL)setSourceDirectory:(id)a3 sandboxExtension:(id)a4;
- (BOOL)suppressCompletionsDuringShutdown;
- (ExtractionServiceInfo)extractionServiceInfo;
- (NSData)archiveID;
- (NSData)asymmetricDecryptionKey;
- (NSData)signingPublicKey;
- (NSData)symmetricDecryptionKey;
- (NSDictionary)options;
- (NSError)error;
- (NSString)pluginBundlePath;
- (NSString)pluginDirectory;
- (NSString)sessionID;
- (NSString)sourceDirectory;
- (NSXPCConnection)extractionServiceConnection;
- (OS_dispatch_queue)ioQueue;
- (OS_dispatch_queue)reservationQueue;
- (STExtractionOriginator)internalExtractionOriginator;
- (STExtractorDelegate)extractorDelegate;
- (STRemoteExtractor)init;
- (STRemoteExtractor)initWithCoder:(id)a3;
- (STRemoteExtractor)initWithOptions:(id)a3;
- (id)_reserveExtractionMemory;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createOutputDir:(id)a3;
- (unint64_t)lastResumptionOffset;
- (unint64_t)requiredExtractionMemory;
- (unint64_t)reservedExtractionMemory;
- (void)_checkForInvalidExtractionMemoryReservation;
- (void)_invalidate;
- (void)_releaseExtractionMemory;
- (void)_sendData:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)doesConsumeExtractedData;
- (void)encodeWithCoder:(id)a3;
- (void)finishStreamWithCompletionBlock:(id)a3;
- (void)init;
- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4;
- (void)remote_extractionCompleteAtArchivePath:(id)a3;
- (void)remote_extractionEnteredPassthroughMode;
- (void)remote_setExtractionProgress:(double)a3;
- (void)setArchiveID:(id)a3;
- (void)setAsymmetricDecryptionKey:(id)a3;
- (void)setDataStreamStarted:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setExtractorDelegate:(id)a3;
- (void)setFinalBytesSent:(BOOL)a3;
- (void)setIsInvalid:(BOOL)a3;
- (void)setIsPrepared:(BOOL)a3;
- (void)setLastResumptionOffset:(unint64_t)a3;
- (void)setOption:(id)a3 forKey:(id)a4;
- (void)setPluginBundlePath:(id)a3;
- (void)setPluginDirectory:(id)a3;
- (void)setPrivileged:(BOOL)a3;
- (void)setRequiredExtractionMemory:(unint64_t)a3;
- (void)setReservedExtractionMemory:(unint64_t)a3;
- (void)setSessionID:(id)a3;
- (void)setSigningPublicKey:(id)a3;
- (void)setSourceDirectory:(id)a3;
- (void)setSymmetricDecryptionKey:(id)a3;
- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4;
- (void)suppressCompletionsDuringShutdown;
- (void)suspendStreamWithCompletionBlock:(id)a3;
- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4;
@end

@implementation STRemoteExtractor

+ (id)STAEAExtractorWithOptions:(id)a3
{
  id v3 = a3;
  v4 = -[STRemoteExtractor initWithOptions:](objc_alloc(&OBJC_CLASS___STRemoteExtractor), "initWithOptions:", v3);
  if (v3)
  {
    [v3 objectForKeyedSubscript:@"STAEAExtractorSourceDirectory"];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        STGetLogHandle();
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          +[STRemoteExtractor(STAEAExtractor) STAEAExtractorWithOptions:].cold.2();
        }
        v6 = v4;
        goto LABEL_16;
      }

      [v3 objectForKeyedSubscript:@"STAEAExtractorSourceDirectorySandboxExtension<Private>"];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          STGetLogHandle();
          v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            +[STRemoteExtractor(STAEAExtractor) STAEAExtractorWithOptions:].cold.1();
          }

          v8 = (os_log_s *)v4;
LABEL_16:

          v4 = 0LL;
          goto LABEL_11;
        }
      }

      else
      {
        -[STRemoteExtractor setSourceDirectory:sandboxExtension:](v4, "setSourceDirectory:sandboxExtension:", v5, 0LL);
      }
    }

+ (id)fullReplacementSTAEAExtractor:(id)a3
{
  v10[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = @"STRemoteExtractorPluginBundleName";
    v9[1] = @"STRemoteExtractorSessionID";
    v10[0] = @"STAEAExtractionPlugin";
    v10[1] = v4;
    [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:v9 count:2];
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    [a1 STAEAExtractorWithOptions:v6];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    STGetLogHandle();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[STRemoteExtractor(STAEAExtractor) fullReplacementSTAEAExtractor:].cold.1();
    }
    v7 = 0LL;
  }

  return v7;
}

+ (id)incrementalPatchSTAEAExtractor:(id)a3 srcDirectory:(id)a4
{
  v14[3] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    STGetLogHandle();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[STRemoteExtractor(STAEAExtractor) incrementalPatchSTAEAExtractor:srcDirectory:].cold.1();
    }
    goto LABEL_9;
  }

  if (!v7)
  {
    STGetLogHandle();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[STRemoteExtractor(STAEAExtractor) incrementalPatchSTAEAExtractor:srcDirectory:].cold.2();
    }
LABEL_9:

    v9 = 0LL;
    v10 = 0LL;
    goto LABEL_4;
  }

  v13[0] = @"STRemoteExtractorPluginBundleName";
  v13[1] = @"STRemoteExtractorSessionID";
  v14[0] = @"STAEAExtractionPlugin";
  v14[1] = v6;
  v13[2] = @"STAEAExtractorSourceDirectory";
  v14[2] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 STAEAExtractorWithOptions:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

  return v10;
}

- (NSData)symmetricDecryptionKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"STAEAExtractorSymmetricEncryptionKey<Private>"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setSymmetricDecryptionKey:(id)a3
{
}

- (NSData)asymmetricDecryptionKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"STAEAExtractorAsymmetricDecryptionKey<Private>"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setAsymmetricDecryptionKey:(id)a3
{
}

- (NSData)signingPublicKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"STAEAExtractorSigningPublicKey<Private>"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setSigningPublicKey:(id)a3
{
}

- (NSString)sourceDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"STAEAExtractorSourceDirectory"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSourceDirectory:(id)a3
{
}

- (BOOL)setSourceDirectory:(id)a3 sandboxExtension:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  bzero(__s, 0x400uLL);
  id v6 = (void *)MEMORY[0x1896078A8];
  id v7 = a3;
  id v8 = [v6 defaultManager];
  v9 = (const char *)[v8 fileSystemRepresentationWithPath:v7];

  v10 = realpath_DARWIN_EXTSN(v9, __s);
  if (!v10)
  {
    STGetLogHandle();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor(STAEAExtractor) setSourceDirectory:sandboxExtension:].cold.1();
    }
    goto LABEL_9;
  }

  [MEMORY[0x1896078A8] defaultManager];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 stringWithFileSystemRepresentation:__s length:strlen(__s)];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRemoteExtractor setOption:forKey:](self, "setOption:forKey:", v12, @"STAEAExtractorSourceDirectory");

  uint64_t v13 = sandbox_extension_issue_file();
  if (!v13)
  {
    STGetLogHandle();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor(STAEAExtractor) setSourceDirectory:sandboxExtension:].cold.2((uint64_t)__s, v14);
    }
LABEL_9:
    BOOL v15 = 0;
    goto LABEL_4;
  }

  [NSString stringWithCString:v13 encoding:4];
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  -[STRemoteExtractor setOption:forKey:]( self,  "setOption:forKey:",  v14,  @"STAEAExtractorSourceDirectorySandboxExtension<Private>");
  BOOL v15 = 1;
LABEL_4:

  return v15;
}

- (NSData)archiveID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"STAEAExtractorArchiveID"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setArchiveID:(id)a3
{
}

  ;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STRemoteExtractor)init
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[STRemoteExtractor init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  return 0LL;
}

- (STRemoteExtractor)initWithOptions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___STRemoteExtractor;
  uint64_t v5 = -[STRemoteExtractor init](&v9, sel_init);
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 mutableCopy];
    }

    else
    {
      uint64_t v6 = [MEMORY[0x189603FC8] dictionary];
    }

    options = v5->_options;
    v5->_options = (NSMutableDictionary *)v6;
  }

  -[STRemoteExtractor setIsPrepared:](v5, "setIsPrepared:", 0LL);
  -[STRemoteExtractor setIsInvalid:](v5, "setIsInvalid:", 0LL);
  -[STRemoteExtractor setDataStreamStarted:](v5, "setDataStreamStarted:", 0LL);
  -[STRemoteExtractor setFinalBytesSent:](v5, "setFinalBytesSent:", 0LL);

  return v5;
}

- (STRemoteExtractor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[STRemoteExtractor initWithOptions:](self, "initWithOptions:", 0LL);
  if (v5)
  {
    uint64_t v6 = [v4 decodePropertyListForKey:@"options"];
    options = v5->_options;
    v5->_options = (NSMutableDictionary *)v6;

    v5->_privileged = [v4 decodeBoolForKey:@"privileged"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v4 connection];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 valueForEntitlement:@"com.apple.private.STRemoteExtractor.privileged"];
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
      char v10 = [v9 BOOLValue];

      if ((v10 & 1) == 0) {
        v5->_privileged = 0;
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  -[STRemoteExtractor options](self, "options");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v4 forKey:@"options"];

  objc_msgSend(v5, "encodeBool:forKey:", -[STRemoteExtractor privileged](self, "privileged"), @"privileged");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  -[STRemoteExtractor options](self, "options");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v4 initWithOptions:v5];

  objc_msgSend(v6, "setPrivileged:", -[STRemoteExtractor privileged](self, "privileged"));
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___STRemoteExtractor;
  -[STRemoteExtractor dealloc](&v3, sel_dealloc);
}

- (void)setOption:(id)a3 forKey:(id)a4
{
}

- (id)createOutputDir:(id)a3
{
  v21[1] = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uint64_t v20 = *MEMORY[0x189607500];
  [MEMORY[0x189607968] numberWithUnsignedShort:16877];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  STGetLogHandle();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v17 = "-[STRemoteExtractor createOutputDir:]";
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_1884F9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: Creating output dir: %@", buf, 0x16u);
  }

  [MEMORY[0x1896078A8] defaultManager];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = 0LL;
  char v8 = [v7 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:v5 error:&v15];
  id v9 = v15;

  char v10 = 0LL;
  if ((v8 & 1) == 0)
  {
    STGetLogHandle();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor createOutputDir:].cold.1();
    }

    uint64_t v13 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"Failed to create extraction directory at path %@: %@", v3, 0];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError( v13,  4LL,  v14,  v9,  (uint64_t)"-[STRemoteExtractor createOutputDir:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  363LL);
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (NSString)pluginBundlePath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"STRemoteExtractorPluginBundlePath"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPluginBundlePath:(id)a3
{
}

- (NSString)pluginDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"STRemoteExtractorPluginDirectory"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPluginDirectory:(id)a3
{
}

- (NSString)sessionID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"STRemoteExtractorSessionID"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSessionID:(id)a3
{
}

- (BOOL)suppressCompletionsDuringShutdown
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"STRemoteExtractorSuppressCompletionsDuringShutdown"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_7:
    char v4 = 1;
    goto LABEL_8;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    STGetLogHandle();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor suppressCompletionsDuringShutdown].cold.1();
    }

    goto LABEL_7;
  }

  char v4 = [v3 BOOLValue];
LABEL_8:

  return v4;
}

- (id)_reserveExtractionMemory
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 reserveExtractionMemory:self];
  char v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_releaseExtractionMemory
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 releaseExtractionMemory:self];
}

- (void)_checkForInvalidExtractionMemoryReservation
{
  if (-[STRemoteExtractor isInvalid](self, "isInvalid"))
  {
    -[STRemoteExtractor extractionServiceInfo](self, "extractionServiceInfo");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 extractionBecameInvalid];
  }

- (BOOL)doesConsumeExtractedData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"STRemoteExtractorDoesConsumeExtractedData"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_7:
    char v4 = 0;
    goto LABEL_8;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    STGetLogHandle();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor doesConsumeExtractedData].cold.1();
    }

    goto LABEL_7;
  }

  char v4 = [v3 BOOLValue];
LABEL_8:

  return v4;
}

- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    STGetLogHandle();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor prepareForExtractionToPath:completionBlock:].cold.1();
    }

    id v15 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"No path to extract to"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    uint64_t v17 = 3LL;
    __int16 v18 = v13;
    uint64_t v19 = 505LL;
    goto LABEL_15;
  }

  char v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StreamingExtractor.STRemoteExtractorIOQueue", 0LL);
  ioQueue = self->_ioQueue;
  self->_ioQueue = v8;

  if (!self->_ioQueue)
  {
    STGetLogHandle();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor prepareForExtractionToPath:completionBlock:].cold.2();
    }

    v21 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"Failed to create displatch queue for I/O"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21;
    uint64_t v17 = 1LL;
    __int16 v18 = v13;
    uint64_t v19 = 508LL;
    goto LABEL_15;
  }

  dispatch_get_global_queue(21LL, 0LL);
  char v10 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  reservationQueue = self->_reservationQueue;
  self->_reservationQueue = v10;

  if (!self->_reservationQueue)
  {
    STGetLogHandle();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor prepareForExtractionToPath:completionBlock:].cold.3();
    }

    v23 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"Failed to get global concurrent queue for extraction memory reservations"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v23;
    uint64_t v17 = 1LL;
    __int16 v18 = v13;
    uint64_t v19 = 511LL;
LABEL_15:
    STCreateError( v16,  v17,  v18,  0LL,  (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[STRemoteExtractor setError:](self, "setError:", v24);

    goto LABEL_5;
  }

  -[STRemoteExtractor ioQueue](self, "ioQueue");
  v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke;
  block[3] = &unk_18A24BE78;
  id v26 = v6;
  v27 = self;
  id v28 = v7;
  dispatch_async(v12, block);

  uint64_t v13 = v26;
LABEL_5:
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v119 = *MEMORY[0x1895F89C0];
  bzero(__s, 0x400uLL);
  STGetLogHandle();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(char **)(a1 + 32);
    *(_DWORD *)buf = 136446466;
    v107 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
    __int16 v108 = 2112;
    v109 = v3;
    _os_log_impl(&dword_1884F9000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: path: %@", buf, 0x16u);
  }

  if ([*(id *)(a1 + 40) isPrepared])
  {
    STGetLogHandle();
    v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_1();
    }

    v71 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"-prepare... called on already prepared extractor"];
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    STCreateError( v71,  8LL,  v50,  0LL,  (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  528LL);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) setError:v72];

    goto LABEL_47;
  }

  [*(id *)(a1 + 40) pluginBundlePath];
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v95)
  {
    [*(id *)(a1 + 40) pluginDirectory];
    char v4 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v5 = v4 == 0LL;

    if (v5)
    {
      [*(id *)(a1 + 40) options];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 objectForKeyedSubscript:@"STRemoteExtractorPluginBundleName"];
      v95 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v6 = (void *)NSString;
      [*(id *)(a1 + 40) pluginDirectory];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = v7;
      char v8 = (void *)NSString;
      [*(id *)(a1 + 40) options];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 objectForKeyedSubscript:@"STRemoteExtractorPluginBundleName"];
      char v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 stringWithFormat:@"%@.bundle", v10];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v116[1] = v11;
      [MEMORY[0x189603F18] arrayWithObjects:v116 count:2];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 pathWithComponents:v12];
      v95 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v95)
    {
      STGetLogHandle();
      v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
        __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_2();
      }

      v74 = STExtractorErrorDomain;
      [NSString stringWithFormat:@"-prepare... called without valid plugin bundle/path"];
      id v50 = (id)objc_claimAutoreleasedReturnValue();
      STCreateError( v74,  8LL,  v50,  0LL,  (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  538LL);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) setError:v75];

LABEL_47:
      v95 = 0LL;
LABEL_57:
      v49 = 0LL;
      goto LABEL_58;
    }
  }

  uint64_t v13 = (id *)(a1 + 40);
  else {
    v14 = @"com.apple.STExtractionService";
  }
  uint64_t v15 = [objc_alloc(MEMORY[0x189607B30]) initWithServiceName:v14];
  v16 = (void *)*((void *)*v13 + 7);
  *((void *)*v13 + 7) = v15;

  [*v13 extractionServiceConnection];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v18 = v17 == 0LL;

  if (v18)
  {
    STGetLogHandle();
    v76 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
      __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_3();
    }

    v77 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"Failed to create NSXPCConnection"];
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    STCreateError( v77,  2LL,  v50,  0LL,  (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  550LL);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) setError:v78];

    goto LABEL_57;
  }

  uint64_t v19 = objc_alloc_init(&OBJC_CLASS___STExtractionOriginator);
  uint64_t v20 = *(void *)(a1 + 40);
  v21 = *(void **)(v20 + 72);
  *(void *)(v20 + 72) = v19;

  v22 = *(void **)(a1 + 40);
  [v22 internalExtractionOriginator];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 setOriginator:v22];

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C71FC90];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) extractionServiceConnection];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 setRemoteObjectInterface:v24];

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C71E6D0];
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) extractionServiceConnection];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 setExportedInterface:v26];

  [*(id *)(a1 + 40) internalExtractionOriginator];
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) extractionServiceConnection];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 setExportedObject:v28];

  uint64_t v30 = +[ExtractionServiceInfo extractionServiceInfoForPluginBundlePath:]( &OBJC_CLASS___ExtractionServiceInfo,  "extractionServiceInfoForPluginBundlePath:",  v95);
  v31 = *(void **)(*(void *)(a1 + 40) + 64LL);
  *(void *)(*(void *)(a1 + 40) + 64LL) = v30;

  [*(id *)(a1 + 40) extractionServiceInfo];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v33 = v32 == 0LL;

  if (v33)
  {
    STGetLogHandle();
    v79 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
      __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_4();
    }

    v80 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"Unable to create internal ExtractionServiceInfo object to track extraction service"];
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    STCreateError( v80,  1LL,  v50,  0LL,  (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  561LL);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) setError:v81];

    goto LABEL_57;
  }

  [*(id *)(a1 + 40) extractionServiceInfo];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v34 uuid];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v35 getUUIDBytes:v117];

  [*(id *)(a1 + 40) extractionServiceConnection];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v36 _xpcConnection];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_connection_set_oneshot_instance();

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  uint64_t v38 = MEMORY[0x1895F87A8];
  v103[0] = MEMORY[0x1895F87A8];
  v103[1] = 3221225472LL;
  v103[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_2;
  v103[3] = &unk_18A24BE50;
  objc_copyWeak(&v104, (id *)buf);
  uint64_t v39 = [*(id *)(a1 + 40) extractionServiceConnection];
  [(id)v39 setInterruptionHandler:v103];

  v101[0] = v38;
  v101[1] = 3221225472LL;
  v101[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_4;
  v101[3] = &unk_18A24BE50;
  objc_copyWeak(&v102, (id *)buf);
  [*(id *)(a1 + 40) extractionServiceConnection];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v40 setInvalidationHandler:v101];

  objc_destroyWeak(&v102);
  objc_destroyWeak(&v104);
  objc_destroyWeak((id *)buf);
  [*(id *)(a1 + 40) extractionServiceConnection];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v41 resume];

  [MEMORY[0x1896078A8] defaultManager];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v39) = [v42 fileExistsAtPath:*(void *)(a1 + 32)];

  if ((v39 & 1) == 0)
  {
    [*(id *)(a1 + 40) createOutputDir:*(void *)(a1 + 32)];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) setError:v43];

    [*(id *)(a1 + 40) error];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v45 = v44 == 0LL;

    if (!v45)
    {
      STGetLogHandle();
      id v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_ERROR)) {
        __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_10();
      }
      goto LABEL_57;
    }
  }

  id v46 = [MEMORY[0x1896078A8] defaultManager];
  v47 = realpath_DARWIN_EXTSN( (const char *)[v46 fileSystemRepresentationWithPath:*(void *)(a1 + 32)],  __s);

  if (!v47)
  {
    STGetLogHandle();
    v82 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
      __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_5();
    }

    int v83 = *__error();
    [NSString stringWithFormat:@"Failed to realpath %@ at %s: %s", *(void *)(a1 + 32), __s, strerror(v83)];
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    STCreateError( (void *)*MEMORY[0x189607688],  v83,  v50,  0LL,  (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  607LL);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) setError:v84];

    goto LABEL_57;
  }

  [MEMORY[0x1896078A8] defaultManager];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v48 stringWithFileSystemRepresentation:__s length:strlen(__s)];
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v105.st_mode = 0;
  if (stat(__s, &v105))
  {
    id v50 = 0LL;
  }

  else
  {
    if ((v105.st_mode & 0xF000) == 0x4000) {
      goto LABEL_21;
    }
    STGetLogHandle();
    v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v107 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
      __int16 v108 = 2080;
      v109 = __s;
      _os_log_impl( &dword_1884F9000,  v64,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Existing path is not a directory - removing and recreating: %s",  buf,  0x16u);
    }

    [MEMORY[0x1896078A8] defaultManager];
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    id v100 = 0LL;
    char v66 = [v65 removeItemAtPath:v49 error:&v100];
    id v50 = v100;

    if ((v66 & 1) == 0)
    {
      STGetLogHandle();
      v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_9( (uint64_t)__s,  (uint64_t)v50,  v67);
      }

      STGetLogHandle();
      v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
        __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_8(v68);
      }
    }
  }

  [*(id *)(a1 + 40) createOutputDir:v49];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) setError:v51];

  [*(id *)(a1 + 40) error];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v53 = v52 == 0LL;

  if (v53)
  {

LABEL_21:
    v54 = (void *)sandbox_extension_issue_file();
    if (!v54)
    {
      STGetLogHandle();
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_6((uint64_t)__s, v55);
      }
    }

    [*(id *)(a1 + 40) extractionServiceConnection];
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v38;
    v98[1] = 3221225472LL;
    v98[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_88;
    v98[3] = &unk_18A24BEA0;
    v98[4] = *(void *)(a1 + 40);
    id v99 = *(id *)(a1 + 48);
    [v56 remoteObjectProxyWithErrorHandler:v98];
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 40) setIsPrepared:1];
    [*(id *)(a1 + 40) options];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)[v58 mutableCopy];

    v114 = @"STRemoteExtractorFrameworkPath";
    [MEMORY[0x1896077F8] bundleForClass:objc_opt_class()];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    [v60 bundlePath];
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v61;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    [v59 addEntriesFromDictionary:v62];

    if (v54)
    {
      [NSString stringWithCString:v54 encoding:4];
      v63 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v63 = 0LL;
    }

    v96[0] = v38;
    v96[1] = 3221225472LL;
    v96[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_2_92;
    v96[3] = &unk_18A24BEF0;
    v69 = *(void **)(a1 + 48);
    v96[4] = *(void *)(a1 + 40);
    id v97 = v69;
    objc_msgSend( v57,  "remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:",  v49,  v63,  v59,  v96);
    if (v54)
    {

      free(v54);
    }

    else
    {
    }

    goto LABEL_40;
  }

  STGetLogHandle();
  v94 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
    __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_7();
  }

LABEL_58:
  STGetLogHandle();
  v85 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    v86 = *(void **)(a1 + 40);
    uint64_t v87 = [v86 lastResumptionOffset];
    [*(id *)(a1 + 40) error];
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446978;
    v107 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
    __int16 v108 = 2112;
    v109 = (char *)v86;
    __int16 v110 = 2048;
    uint64_t v111 = v87;
    __int16 v112 = 2112;
    v113 = v88;
    _os_log_impl( &dword_1884F9000,  v85,  OS_LOG_TYPE_DEFAULT,  "%{public}s: %@: calling prepare completion block with offset %llu, error %@",  buf,  0x2Au);
  }

  uint64_t v89 = *(void *)(a1 + 48);
  uint64_t v90 = [*(id *)(a1 + 40) lastResumptionOffset];
  [*(id *)(a1 + 40) error];
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v89 + 16))(v89, v90, v91);

  [*(id *)(a1 + 40) error];
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v93 = v92 == 0LL;

  if (!v93) {
    [*(id *)(a1 + 40) _invalidate];
  }
LABEL_40:
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained ioQueue];
    char v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_3;
    block[3] = &unk_18A24BE50;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
  }
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = WeakRetained;
    char v3 = [WeakRetained isInvalid];
    v2 = v5;
    if ((v3 & 1) == 0)
    {
      STCreateError( (void *)*MEMORY[0x189607460],  4097LL,  @"Connection interrupted to streaming extraction service",  0LL,  (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke_3",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  575LL);
      char v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setError:v4];

      [v5 _invalidate];
      v2 = v5;
    }
  }
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained ioQueue];
    char v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_5;
    block[3] = &unk_18A24BE50;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
  }
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = WeakRetained;
    char v3 = [WeakRetained isInvalid];
    v2 = v5;
    if ((v3 & 1) == 0)
    {
      STCreateError( (void *)*MEMORY[0x189607460],  4099LL,  @"Connection invalidated to streaming extraction service",  0LL,  (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke_5",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  590LL);
      char v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setError:v4];

      [v5 _invalidate];
      v2 = v5;
    }
  }
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_88( uint64_t a1,  void *a2)
{
  id v3 = a2;
  STGetLogHandle();
  char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_88_cold_1();
  }

  [*(id *)(a1 + 32) ioQueue];
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_89;
  block[3] = &unk_18A24BE78;
  id v6 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

uint64_t __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_89(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0LL, *(void *)(a1 + 40));
  }
  return result;
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_2_92( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a4;
  STGetLogHandle();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136446978;
    v23 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke_2";
    __int16 v24 = 2112;
    uint64_t v25 = v10;
    __int16 v26 = 2048;
    uint64_t v27 = a3;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl( &dword_1884F9000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s: %@: prepare completed with offset %llu, error %@",  buf,  0x2Au);
  }

  [*(id *)(a1 + 32) ioQueue];
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_93;
  block[3] = &unk_18A24BEC8;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(a1 + 40);
  id v17 = v8;
  uint64_t v18 = v12;
  uint64_t v21 = a3;
  id v19 = v7;
  id v20 = v13;
  id v14 = v7;
  id v15 = v8;
  dispatch_async(v11, block);
}

uint64_t __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_93(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:");
    [*(id *)(a1 + 40) _invalidate];
  }

  [*(id *)(a1 + 40) setLastResumptionOffset:*(void *)(a1 + 64)];
  [*(id *)(a1 + 40) setRequiredExtractionMemory:1024];
  if (*(void *)(a1 + 48))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [*(id *)(a1 + 48) objectForKeyedSubscript:@"STRemoteExtractorMemoryFootprint"];
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          objc_msgSend(*(id *)(a1 + 40), "setRequiredExtractionMemory:", objc_msgSend(v2, "unsignedLongLongValue"));
        }
      }
    }
  }

  STGetLogHandle();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = *(void **)(a1 + 40);
    int v10 = 136446722;
    v11 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = [v4 requiredExtractionMemory];
    _os_log_impl( &dword_1884F9000,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}s: %@: extractor requires %zu bytes extraction memory",  (uint8_t *)&v10,  0x20u);
  }

  STGetLogHandle();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    int v10 = 136446978;
    v11 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl( &dword_1884F9000,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s: %@: calling prepare completion block with offset %llu, error %@",  (uint8_t *)&v10,  0x2Au);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)_invalidate
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (!-[STRemoteExtractor isInvalid](self, "isInvalid"))
  {
    STGetLogHandle();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446466;
      uint64_t v8 = "-[STRemoteExtractor _invalidate]";
      __int16 v9 = 2112;
      int v10 = self;
      _os_log_impl(&dword_1884F9000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: invalidating", (uint8_t *)&v7, 0x16u);
    }
  }

  -[STRemoteExtractor setIsInvalid:](self, "setIsInvalid:", 1LL);
  -[STRemoteExtractor extractionServiceConnection](self, "extractionServiceConnection");
  char v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[STRemoteExtractor extractionServiceConnection](self, "extractionServiceConnection");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 invalidate];

    extractionServiceConnection = self->_extractionServiceConnection;
    self->_extractionServiceConnection = 0LL;
  }

  -[STRemoteExtractor _releaseExtractionMemory](self, "_releaseExtractionMemory");
  -[STRemoteExtractor _checkForInvalidExtractionMemoryReservation](self, "_checkForInvalidExtractionMemoryReservation");
}

- (void)_sendData:(id)a3 completion:(id)a4
{
  uint64_t v110 = *MEMORY[0x1895F89C0];
  id v66 = a3;
  id v61 = a4;
  v64 = self;
  -[STRemoteExtractor error](self, "error");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    STGetLogHandle();
    v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor _sendData:completion:].cold.7(self, v51);
    }
    v47 = -[STRemoteExtractor error](self, "error");
    if (v47) {
      goto LABEL_71;
    }
    goto LABEL_72;
  }

  if (!-[STRemoteExtractor isPrepared](self, "isPrepared"))
  {
    STGetLogHandle();
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor _sendData:completion:].cold.6();
    }

    BOOL v53 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"%s called before -prepareForExtraction on %@", "-[STRemoteExtractor _sendData:completion:]", self];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError( v53,  7LL,  v54,  0LL,  (uint64_t)"-[STRemoteExtractor _sendData:completion:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  739LL);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_70;
  }

  if (-[STRemoteExtractor isInvalid](self, "isInvalid"))
  {
    STGetLogHandle();
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor _sendData:completion:].cold.1();
    }

    v56 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"-supplyBytes: called on invalid extractor"];
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError( v56,  8LL,  v57,  0LL,  (uint64_t)"-[STRemoteExtractor _sendData:completion:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  740LL);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_70;
  }

  -[STRemoteExtractor extractionServiceConnection](self, "extractionServiceConnection");
  int v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    STGetLogHandle();
    v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor _sendData:completion:].cold.2();
    }

    v59 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"no service connection for extraction service"];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError( v59,  1LL,  v60,  0LL,  (uint64_t)"-[STRemoteExtractor _sendData:completion:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  742LL);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_70;
  }

  dispatch_group_t v8 = dispatch_group_create();
  v96[0] = 0LL;
  v96[1] = v96;
  v96[2] = 0x3032000000LL;
  v96[3] = __Block_byref_object_copy_;
  v96[4] = __Block_byref_object_dispose_;
  id v97 = 0LL;
  v94[0] = 0LL;
  v94[1] = v94;
  v94[2] = 0x2020000000LL;
  char v95 = 0;
  v90[0] = MEMORY[0x1895F87A8];
  v90[1] = 3221225472LL;
  v90[2] = __42__STRemoteExtractor__sendData_completion___block_invoke;
  v90[3] = &unk_18A24BF18;
  v92 = v96;
  BOOL v93 = v94;
  dispatch_group_t group = v8;
  dispatch_group_t v91 = group;
  v62 = (void *)MEMORY[0x1895C7F60](v90);
  unint64_t v9 = [v66 length];
  if (v9 - 4194305 >= 0xFFFFFFFFFFC00000LL)
  {
    pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
    if (_sAvailableExtractionBuffer >= v9) {
      _sAvailableExtractionBuffer -= v9;
    }
    else {
      unint64_t v9 = 0LL;
    }
    pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  if (v9 != [v66 length])
  {
    STGetLogHandle();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[STRemoteExtractor _sendData:completion:].cold.5((uint64_t)v109, [v66 length], v17);
    }

    STGetSignpostHandle();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      uint64_t v19 = [v66 length];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v19;
      _os_signpost_emit_with_name_impl( &dword_1884F9000,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "FRAGMENT_DATA",  "Starting fragmentation of supplied buffer (%lu bytes)",  buf,  0xCu);
    }

    v65 = 0LL;
    unint64_t v20 = 0LL;
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if (v20 >= [v66 length])
      {
        STGetSignpostHandle();
        __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v16))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1884F9000,  v16,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "FRAGMENT_DATA",  "Ending fragmentation of the supplied buffer",  buf,  2u);
        }

        goto LABEL_68;
      }

      uint64_t v80 = 0LL;
      v81 = &v80;
      uint64_t v82 = 0x2020000000LL;
      uint64_t v83 = 0LL;
      if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      unint64_t v25 = (unint64_t)v65 + v21 - v20;
      if (v25)
      {
        pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
        unint64_t v26 = _sAvailableExtractionBuffer;
        if (!((unint64_t)_sAvailableExtractionBuffer >> 17))
        {
          do
          {
            pthread_cond_wait(&_sAvailableExtractionBufferCondition, &_sAvailableExtractionBufferMutex);
            unint64_t v26 = _sAvailableExtractionBuffer;
          }

          while ((unint64_t)_sAvailableExtractionBuffer < 0x20000);
        }

        if (v26 < v25) {
          unint64_t v25 = v26;
        }
        _sAvailableExtractionBuffer = v26 - v25;
        pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
        uint64_t v27 = v81;
      }

      else
      {
        uint64_t v27 = &v80;
      }

      v27[3] = v25;
      STGetLogHandle();
      __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v43 = v81[3];
        *(_DWORD *)buf = 136447234;
        *(void *)&uint8_t buf[4] = "-[STRemoteExtractor _sendData:completion:]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v43;
        *(_WORD *)&buf[22] = 2048;
        id v99 = (void *)v20;
        *(_WORD *)id v100 = 2048;
        *(void *)&v100[2] = v21;
        *(_WORD *)&v100[10] = 2048;
        *(void *)&v100[12] = v65;
        _os_log_debug_impl( &dword_1884F9000,  v28,  OS_LOG_TYPE_DEBUG,  "%{public}s: Reserved %ld bytes at %ld for too-big partial range {%lu, %lu}",  buf,  0x34u);
      }

LABEL_55:
      STGetLogHandle();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v42 = (void *)v81[3];
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[STRemoteExtractor _sendData:completion:]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v20;
        *(_WORD *)&buf[22] = 2048;
        id v99 = v42;
        _os_log_debug_impl( &dword_1884F9000,  v32,  OS_LOG_TYPE_DEBUG,  "%{public}s: Supplying byte range {%lu, %lu}",  buf,  0x20u);
      }

      objc_msgSend(v66, "subdataWithRange:", v20, v81[3]);
      BOOL v33 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(group);
      STGetSignpostHandle();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v34))
      {
        uint64_t v35 = [v33 length];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v35;
        _os_signpost_emit_with_name_impl( &dword_1884F9000,  v34,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Sending buffer (%lu bytes) to the extraction service over XPC",  buf,  0xCu);
      }
      v36 = -[STRemoteExtractor extractionServiceConnection](v64, "extractionServiceConnection");
      v75[0] = MEMORY[0x1895F87A8];
      v75[1] = 3221225472LL;
      v75[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_117;
      v75[3] = &unk_18A24BFB8;
      id v37 = v62;
      id v77 = v37;
      v78 = &v80;
      id v38 = v33;
      id v76 = v38;
      [v36 remoteObjectProxyWithErrorHandler:v75];
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = MEMORY[0x1895F87A8];
      v71[1] = 3221225472LL;
      v71[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_118;
      v71[3] = &unk_18A24BFE0;
      id v73 = v37;
      v74 = &v80;
      id v40 = v38;
      id v72 = v40;
      objc_msgSend(v39, "remote_supplyBytes:withCompletionBlock:", v40, v71);

      v20 += v81[3];
      if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      {
        STGetLogHandle();
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[STRemoteExtractor _sendData:completion:]";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v21;
          *(_WORD *)&buf[22] = 2048;
          id v99 = v65;
          _os_log_debug_impl( &dword_1884F9000,  v41,  OS_LOG_TYPE_DEBUG,  "%{public}s: Active partial range {%lu, %lu} exhausted",  buf,  0x20u);
        }

        v65 = 0LL;
      }

      uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_65:

      _Block_object_dispose(&v80, 8);
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3010000000LL;
    id v99 = &unk_188506A17;
    *(_OWORD *)id v100 = xmmword_188504470;
    v79[0] = MEMORY[0x1895F87A8];
    v79[1] = 3221225472LL;
    v79[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_112;
    v79[3] = &unk_18A24BF90;
    v79[5] = buf;
    v79[6] = v20;
    v79[4] = &v80;
    [v66 enumerateByteRangesUsingBlock:v79];
    if (!v81[3])
    {
      uint64_t v21 = *(void *)(*(void *)&buf[8] + 32LL);
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
        STGetLogHandle();
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          -[STRemoteExtractor _sendData:completion:].cold.4();
        }

        v49 = STExtractorErrorDomain;
        [NSString stringWithFormat:@"internal error processing byte ranges"];
        id v50 = (void *)objc_claimAutoreleasedReturnValue();
        STCreateError( v49,  1LL,  v50,  0LL,  (uint64_t)"-[STRemoteExtractor _sendData:completion:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  836LL);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(&v80, 8);
        goto LABEL_69;
      }

      unint64_t v22 = *(void *)(*(void *)&buf[8] + 40LL);
      if (v22 > 0x400000)
      {
        pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
        unint64_t v29 = _sAvailableExtractionBuffer;
        if (!((unint64_t)_sAvailableExtractionBuffer >> 17))
        {
          do
          {
            pthread_cond_wait(&_sAvailableExtractionBufferCondition, &_sAvailableExtractionBufferMutex);
            unint64_t v29 = _sAvailableExtractionBuffer;
          }

          while ((unint64_t)_sAvailableExtractionBuffer < 0x20000);
        }

        if (v29 >= v22) {
          unint64_t v30 = v22;
        }
        else {
          unint64_t v30 = v29;
        }
        _sAvailableExtractionBuffer = v29 - v30;
        pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
        v81[3] = v30;
        STGetLogHandle();
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v45 = v81[3];
          *(_DWORD *)v101 = 136446978;
          id v102 = "-[STRemoteExtractor _sendData:completion:]";
          __int16 v103 = 2048;
          uint64_t v104 = v45;
          __int16 v105 = 2048;
          uint64_t v106 = v21;
          __int16 v107 = 2048;
          unint64_t v108 = v22;
          _os_log_debug_impl( &dword_1884F9000,  v31,  OS_LOG_TYPE_DEBUG,  "%{public}s: Reserved %ld bytes for too-big partial range {%lu, %lu}",  v101,  0x2Au);
        }

        v65 = (void *)v22;
        goto LABEL_54;
      }

      STGetLogHandle();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v44 = *(void *)(*(void *)&buf[8] + 40LL);
        *(_DWORD *)v101 = 136446466;
        id v102 = "-[STRemoteExtractor _sendData:completion:]";
        __int16 v103 = 2048;
        uint64_t v104 = v44;
        _os_log_debug_impl( &dword_1884F9000,  v23,  OS_LOG_TYPE_DEBUG,  "%{public}s: Waiting for %lu bytes to become available",  v101,  0x16u);
      }

      unint64_t v24 = *(void *)(*(void *)&buf[8] + 40LL);
      if (v24)
      {
        pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
        while (_sAvailableExtractionBuffer < v24)
          pthread_cond_wait(&_sAvailableExtractionBufferCondition, &_sAvailableExtractionBufferMutex);
        _sAvailableExtractionBuffer -= v24;
        pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
      }

      v81[3] = v24;
    }

    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_54:
    _Block_object_dispose(buf, 8);
    goto LABEL_55;
  }

  STGetLogHandle();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[STRemoteExtractor _sendData:completion:].cold.3(v9, v10, v11);
  }

  dispatch_group_enter(group);
  STGetSignpostHandle();
  __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v9;
    _os_signpost_emit_with_name_impl( &dword_1884F9000,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Sending buffer (%lu bytes) to extraction service over XPC",  buf,  0xCu);
  }

  -[STRemoteExtractor extractionServiceConnection](self, "extractionServiceConnection");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = MEMORY[0x1895F87A8];
  v87[1] = 3221225472LL;
  v87[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_106;
  v87[3] = &unk_18A24BF40;
  __int16 v14 = v62;
  v88 = v14;
  unint64_t v89 = v9;
  [v13 remoteObjectProxyWithErrorHandler:v87];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = MEMORY[0x1895F87A8];
  v84[1] = 3221225472LL;
  v84[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_107;
  v84[3] = &unk_18A24BF68;
  v85 = v14;
  unint64_t v86 = v9;
  objc_msgSend(v15, "remote_supplyBytes:withCompletionBlock:", v66, v84);

  __int16 v16 = v88;
LABEL_68:

  -[STRemoteExtractor ioQueue](v64, "ioQueue");
  id v46 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_119;
  block[3] = &unk_18A24C008;
  v69 = v96;
  void block[4] = v64;
  id v68 = v61;
  v70 = v94;
  dispatch_group_notify(group, v46, block);

  v47 = 0LL;
LABEL_69:

  _Block_object_dispose(v94, 8);
  _Block_object_dispose(v96, 8);

LABEL_70:
  if (v47) {
LABEL_71:
  }
    (*((void (**)(id, void *, uint64_t))v61 + 2))(v61, v47, 1LL);
LABEL_72:
}

void __42__STRemoteExtractor__sendData_completion___block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  id v11 = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void *)(v8 + 40);
  unint64_t v9 = (id *)(v8 + 40);
  if (!v10) {
    objc_storeStrong(v9, a2);
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
  _sAvailableExtractionBuffer += a4;
  pthread_cond_signal(&_sAvailableExtractionBufferCondition);
  pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_106(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  STGetLogHandle();
  char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __42__STRemoteExtractor__sendData_completion___block_invoke_106_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  STGetSignpostHandle();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = 134217984;
    uint64_t v14 = v12;
    _os_signpost_emit_with_name_impl( &dword_1884F9000,  v11,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Finished (FAILED) processing buffer (%lu bytes) sent to extraction service over XPC",  (uint8_t *)&v13,  0xCu);
  }
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_107(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  STGetSignpostHandle();
  char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    uint64_t v5 = "FAILED";
    uint64_t v6 = *(void *)(a1 + 40);
    if (!a2) {
      uint64_t v5 = "SUCCEEDED";
    }
    int v7 = 136315394;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_signpost_emit_with_name_impl( &dword_1884F9000,  v4,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Finished (%s) processing buffer (%lu bytes) sent to extraction service over XPC",  (uint8_t *)&v7,  0x16u);
  }
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_112( void *a1,  uint64_t a2,  uint64_t a3,  unint64_t a4,  _BYTE *a5)
{
  if (a3 + a4 <= a1[6])
  {
    STGetLogHandle();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __42__STRemoteExtractor__sendData_completion___block_invoke_112_cold_3();
    }
  }

  else
  {
    if (a4 - 4194305 >= 0xFFFFFFFFFFC00000LL)
    {
      pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
      if (_sAvailableExtractionBuffer >= a4)
      {
        _sAvailableExtractionBuffer -= a4;
        unint64_t v9 = a4;
      }

      else
      {
        unint64_t v9 = 0LL;
      }

      pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
    }

    else
    {
      unint64_t v9 = 0LL;
    }

    STGetLogHandle();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v9 == a4)
    {
      if (v12) {
        __42__STRemoteExtractor__sendData_completion___block_invoke_112_cold_1();
      }

      *(void *)(*(void *)(a1[4] + 8LL) + 24LL) += a4;
    }

    else
    {
      if (v12) {
        __42__STRemoteExtractor__sendData_completion___block_invoke_112_cold_2();
      }

      uint64_t v13 = *(void *)(a1[5] + 8LL);
      *(void *)(v13 + 32) = a3;
      *(void *)(v13 + 40) = a4;
      *a5 = 1;
    }
  }

void __42__STRemoteExtractor__sendData_completion___block_invoke_117(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  STGetSignpostHandle();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) length];
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl( &dword_1884F9000,  v2,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Finished (FAILED) processing buffer (%lu bytes) sent to extraction service over XPC",  (uint8_t *)&v4,  0xCu);
  }
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_118(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  STGetSignpostHandle();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    if (v3) {
      uint64_t v5 = "FAILED";
    }
    else {
      uint64_t v5 = "SUCCEEDED";
    }
    uint64_t v6 = [*(id *)(a1 + 32) length];
    int v7 = 136315394;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_signpost_emit_with_name_impl( &dword_1884F9000,  v4,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "DATA_OVER_XPC",  "Finished (%s) processing buffer (%lu bytes) sent to extraction service over XPC",  (uint8_t *)&v7,  0x16u);
  }
}

uint64_t __42__STRemoteExtractor__sendData_completion___block_invoke_119(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  STGetLogHandle();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__STRemoteExtractor__sendData_completion___block_invoke_119_cold_2();
    }

    [*(id *)(a1 + 32) setError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [*(id *)(a1 + 32) _invalidate];
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __42__STRemoteExtractor__sendData_completion___block_invoke_119_cold_1();
    }

    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  return v5();
}

- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  uint64_t v9 = MEMORY[0x1895F87A8];
  v44[0] = MEMORY[0x1895F87A8];
  v44[1] = 3221225472LL;
  v44[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke;
  v44[3] = &unk_18A24C030;
  v44[4] = self;
  uint64_t v46 = v8;
  id v10 = v7;
  id v45 = v10;
  uint64_t v11 = (void (**)(void, void, void))MEMORY[0x1895C7F60](v44);
  STGetLogHandle();
  BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v48 = (STRemoteExtractor *)"-[STRemoteExtractor supplyBytes:withCompletionBlock:]";
    __int16 v49 = 2112;
    id v50 = self;
    __int16 v51 = 2048;
    uint64_t v52 = v8;
    _os_log_impl(&dword_1884F9000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: -supplyBytes:[%lu bytes]", buf, 0x20u);
  }

  STGetSignpostHandle();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412546;
    v48 = self;
    __int16 v49 = 2048;
    id v50 = (STRemoteExtractor *)v8;
    _os_signpost_emit_with_name_impl( &dword_1884F9000,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "SUPPLY_BYTES",  "%@: -supplyBytes:[%lu bytes] began",  buf,  0x16u);
  }

  if (v6)
  {
    -[STRemoteExtractor error](self, "error");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      STGetLogHandle();
      unint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.7(self, v29);
      }

      -[STRemoteExtractor error](self, "error");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }

    if (!-[STRemoteExtractor isPrepared](self, "isPrepared"))
    {
      STGetLogHandle();
      unint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.6();
      }

      v31 = STExtractorErrorDomain;
      [NSString stringWithFormat:@"%s called before -prepareForExtraction on %@", "-[STRemoteExtractor supplyBytes:withCompletionBlock:]", self];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      STCreateError( v31,  7LL,  v32,  0LL,  (uint64_t)"-[STRemoteExtractor supplyBytes:withCompletionBlock:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  953LL);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_36;
    }

    if (-[STRemoteExtractor isInvalid](self, "isInvalid"))
    {
      STGetLogHandle();
      BOOL v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.2();
      }

      v34 = STExtractorErrorDomain;
      [NSString stringWithFormat:@"-supplyBytes: called on invalid extractor"];
      unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v25 = v34;
      uint64_t v26 = 8LL;
      uint64_t v27 = v24;
      uint64_t v28 = 954LL;
    }

    else
    {
      -[STRemoteExtractor ioQueue](self, "ioQueue");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[STRemoteExtractor extractionServiceConnection](self, "extractionServiceConnection");
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          uint64_t v17 = [v6 copy];
          if (v17)
          {
            uint64_t v18 = (void *)v17;
            -[STRemoteExtractor ioQueue](self, "ioQueue");
            uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
            block[0] = v9;
            block[1] = 3221225472LL;
            block[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135;
            block[3] = &unk_18A24BE78;
            void block[4] = self;
            id v20 = v18;
            id v42 = v20;
            uint64_t v43 = v11;
            dispatch_async(v19, block);

            uint64_t v21 = 0LL;
            goto LABEL_13;
          }

          STGetLogHandle();
          uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.5();
          }

          id v40 = STExtractorErrorDomain;
          [NSString stringWithFormat:@"unable to copy bytes"];
          unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v25 = v40;
          uint64_t v26 = 1LL;
          uint64_t v27 = v24;
          uint64_t v28 = 961LL;
        }

        else
        {
          STGetLogHandle();
          id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.4();
          }

          id v38 = STExtractorErrorDomain;
          [NSString stringWithFormat:@"no service connection for extraction service"];
          unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v25 = v38;
          uint64_t v26 = 1LL;
          uint64_t v27 = v24;
          uint64_t v28 = 957LL;
        }
      }

      else
      {
        STGetLogHandle();
        uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.3();
        }

        v36 = STExtractorErrorDomain;
        [NSString stringWithFormat:@"no ioQueue"];
        unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v25 = v36;
        uint64_t v26 = 1LL;
        uint64_t v27 = v24;
        uint64_t v28 = 956LL;
      }
    }
  }

  else
  {
    STGetLogHandle();
    unint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.1();
    }

    v23 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"no bytes supplied to -supplyBytes"];
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v25 = v23;
    uint64_t v26 = 3LL;
    uint64_t v27 = v24;
    uint64_t v28 = 950LL;
  }

  STCreateError( v25,  v26,  v27,  0LL,  (uint64_t)"-[STRemoteExtractor supplyBytes:withCompletionBlock:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  v28);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_36:
  if (v21) {
    ((void (**)(void, void *, uint64_t))v11)[2](v11, v21, 1LL);
  }
  id v20 = 0LL;
LABEL_13:
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  STGetSignpostHandle();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = "failed";
    if (!v3) {
      id v7 = "succeeded";
    }
    int v12 = 138412802;
    uint64_t v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2080;
    uint64_t v17 = v7;
    _os_signpost_emit_with_name_impl( &dword_1884F9000,  v4,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "SUPPLY_BYTES",  "%@: -supplyBytes:[%lu bytes] %s",  (uint8_t *)&v12,  0x20u);
  }

  if (!v3) {
    goto LABEL_13;
  }
  [v3 userInfo];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8) {
    goto LABEL_13;
  }
  [v3 userInfo];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:@"ErrorCausedBySystemShuttingDown"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_13:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    goto LABEL_14;
  }

  int v11 = [v10 BOOLValue];

  if (!v11 || ([*(id *)(a1 + 32) suppressCompletionsDuringShutdown] & 1) == 0) {
    goto LABEL_13;
  }
LABEL_14:
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) error];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    STGetLogHandle();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_4(v2, v9);
    }

    [*v2 error];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else if ([*v2 isPrepared])
  {
    if ([*v2 isInvalid])
    {
      STGetLogHandle();
      __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_1();
      }

      uint64_t v15 = STExtractorErrorDomain;
      [NSString stringWithFormat:@"-supplyBytes: called on invalid extractor"];
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = v15;
      uint64_t v18 = 8LL;
      uint64_t v19 = v16;
      uint64_t v20 = 970LL;
    }

    else
    {
      [*v2 extractionServiceConnection];
      int v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        uint64_t v5 = MEMORY[0x1895F87A8];
        v26[0] = MEMORY[0x1895F87A8];
        v26[1] = 3221225472LL;
        v26[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_2;
        v26[3] = &unk_18A24BE78;
        uint64_t v6 = *(void **)(a1 + 40);
        v26[4] = *(void *)(a1 + 32);
        id v27 = v6;
        id v28 = *(id *)(a1 + 48);
        id v7 = (void (**)(void))MEMORY[0x1895C7F60](v26);
        if ([*(id *)(a1 + 32) dataStreamStarted])
        {
          v7[2](v7);
        }

        else
        {
          [*(id *)(a1 + 32) reservationQueue];
          uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
          block[0] = v5;
          block[1] = 3221225472LL;
          block[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_4;
          block[3] = &unk_18A24C0A8;
          void block[4] = *(void *)(a1 + 32);
          unint64_t v24 = v7;
          id v25 = *(id *)(a1 + 48);
          dispatch_async(v8, block);
        }

        return;
      }

      STGetLogHandle();
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_2();
      }

      unint64_t v22 = STExtractorErrorDomain;
      [NSString stringWithFormat:@"no service connection for extraction service"];
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = v22;
      uint64_t v18 = 1LL;
      uint64_t v19 = v16;
      uint64_t v20 = 972LL;
    }

    STCreateError( v17,  v18,  v19,  0LL,  (uint64_t)"-[STRemoteExtractor supplyBytes:withCompletionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  v20);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    STGetLogHandle();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_3();
    }

    int v12 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"%s called before -prepareForExtraction on %@", "-[STRemoteExtractor supplyBytes:withCompletionBlock:]_block_invoke", *v2];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError( v12,  7LL,  v13,  0LL,  (uint64_t)"-[STRemoteExtractor supplyBytes:withCompletionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  969LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v10)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_3;
  v3[3] = &unk_18A24C058;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 _sendData:v2 completion:v3];
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5 || a3) {
    [*(id *)(a1 + 32) _releaseExtractionMemory];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) ioQueue];
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_5;
  v7[3] = &unk_18A24C080;
  id v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  dispatch_async(v3, v7);

  if (v2) {
    (*(void (**)(void, void *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  v2,  1LL,  v5,  v6);
  }
}

uint64_t __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)suspendStreamWithCompletionBlock:(id)a3
{
  id v4 = a3;
  -[STRemoteExtractor ioQueue](self, "ioQueue");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[STRemoteExtractor ioQueue](self, "ioQueue");
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke;
    v11[3] = &unk_18A24C080;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(v6, v11);
  }

  else
  {
    STGetLogHandle();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor suspendStreamWithCompletionBlock:].cold.1();
    }

    id v8 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"no ioQueue"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError( v8,  1LL,  v9,  0LL,  (uint64_t)"-[STRemoteExtractor suspendStreamWithCompletionBlock:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  1034LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v10);
    }
  }
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) error];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    STGetLogHandle();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_4((uint64_t)v2, v4);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) error];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0LL, v6);
    goto LABEL_9;
  }

  if ([*v2 isPrepared])
  {
    if ([*v2 isInvalid])
    {
      STGetLogHandle();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_1();
      }

      uint64_t v21 = STExtractorErrorDomain;
      [NSString stringWithFormat:@"-suspendStreamWithCompletionBlock: called on invalid extractor"];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      __int16 v16 = v21;
      uint64_t v17 = 8LL;
      uint64_t v18 = v15;
      uint64_t v19 = 1047LL;
    }

    else
    {
      [*v2 extractionServiceConnection];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        uint64_t v8 = MEMORY[0x1895F87A8];
        v26[0] = MEMORY[0x1895F87A8];
        v26[1] = 3221225472LL;
        v26[2] = __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_2;
        v26[3] = &unk_18A24C0F8;
        uint64_t v9 = *(void **)(a1 + 40);
        v26[4] = *(void *)(a1 + 32);
        id v27 = v9;
        id v10 = (void *)MEMORY[0x1895C7F60](v26);
        [*(id *)(a1 + 32) extractionServiceConnection];
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v8;
        v24[1] = 3221225472LL;
        v24[2] = __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_143;
        v24[3] = &unk_18A24C120;
        id v25 = v10;
        id v12 = v10;
        [v11 remoteObjectProxyWithErrorHandler:v24];
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "remote_suspendStreamWithCompletionBlock:", v12);
LABEL_9:

        return;
      }

      STGetLogHandle();
      unint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_2();
      }

      v23 = STExtractorErrorDomain;
      [NSString stringWithFormat:@"%@: no connection to extraction service", *v2];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      __int16 v16 = v23;
      uint64_t v17 = 5LL;
      uint64_t v18 = v15;
      uint64_t v19 = 1049LL;
    }
  }

  else
  {
    STGetLogHandle();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_3();
    }

    __int16 v14 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"%s called before prepare on %@", "-[STRemoteExtractor suspendStreamWithCompletionBlock:]_block_invoke", *v2];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v16 = v14;
    uint64_t v17 = 5LL;
    uint64_t v18 = v15;
    uint64_t v19 = 1046LL;
  }

  STCreateError( v16,  v17,  v18,  0LL,  (uint64_t)"-[STRemoteExtractor suspendStreamWithCompletionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  v19);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void, void, void *))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), 0LL, v6);
    goto LABEL_9;
  }

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) ioQueue];
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  void v9[2] = __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_3;
  v9[3] = &unk_18A24C0D0;
  uint64_t v12 = a2;
  id v7 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, v9);
}

uint64_t __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  STGetLogHandle();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 136446978;
    id v8 = "-[STRemoteExtractor suspendStreamWithCompletionBlock:]_block_invoke_3";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl( &dword_1884F9000,  v2,  OS_LOG_TYPE_DEFAULT,  "%{public}s: %@: calling suspend completion block with offset %llu, error %@",  (uint8_t *)&v7,  0x2Au);
  }

  if (*(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "setError:");
  }
  [*(id *)(a1 + 32) _invalidate];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_143(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)finishStreamWithCompletionBlock:(id)a3
{
  id v4 = a3;
  -[STRemoteExtractor ioQueue](self, "ioQueue");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[STRemoteExtractor ioQueue](self, "ioQueue");
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke;
    v11[3] = &unk_18A24C080;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(v6, v11);
  }

  else
  {
    STGetLogHandle();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor finishStreamWithCompletionBlock:].cold.1();
    }

    id v8 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"no ioQueue"];
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError( v8,  1LL,  v9,  0LL,  (uint64_t)"-[STRemoteExtractor finishStreamWithCompletionBlock:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  1098LL);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      (*((void (**)(id, void *))v4 + 2))(v4, v10);
    }
  }
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) error];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    STGetLogHandle();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_4((uint64_t)v2, v4);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) error];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    goto LABEL_9;
  }

  if ([*v2 isPrepared])
  {
    if ([*v2 isInvalid])
    {
      STGetLogHandle();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_1();
      }

      uint64_t v21 = STExtractorErrorDomain;
      [NSString stringWithFormat:@"-supplyBytes: called on invalid extractor"];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      __int16 v16 = v21;
      uint64_t v17 = 8LL;
      uint64_t v18 = v15;
      uint64_t v19 = 1111LL;
    }

    else
    {
      [*v2 extractionServiceConnection];
      int v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        uint64_t v8 = MEMORY[0x1895F87A8];
        v26[0] = MEMORY[0x1895F87A8];
        v26[1] = 3221225472LL;
        v26[2] = __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_2;
        v26[3] = &unk_18A24BEA0;
        __int16 v9 = *(void **)(a1 + 40);
        v26[4] = *(void *)(a1 + 32);
        id v27 = v9;
        uint64_t v10 = (void *)MEMORY[0x1895C7F60](v26);
        [*(id *)(a1 + 32) extractionServiceConnection];
        __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v8;
        v24[1] = 3221225472LL;
        v24[2] = __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_144;
        v24[3] = &unk_18A24C120;
        id v25 = v10;
        id v12 = v10;
        [v11 remoteObjectProxyWithErrorHandler:v24];
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "remote_finishStreamWithCompletionBlock:", v12);
LABEL_9:

        return;
      }

      STGetLogHandle();
      unint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_2();
      }

      v23 = STExtractorErrorDomain;
      [NSString stringWithFormat:@"%@: no connection to extraction service", *v2];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      __int16 v16 = v23;
      uint64_t v17 = 5LL;
      uint64_t v18 = v15;
      uint64_t v19 = 1113LL;
    }
  }

  else
  {
    STGetLogHandle();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_3();
    }

    uint64_t v14 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"%s called before prepare on %@", "-[STRemoteExtractor finishStreamWithCompletionBlock:]_block_invoke", *v2];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v16 = v14;
    uint64_t v17 = 5LL;
    uint64_t v18 = v15;
    uint64_t v19 = 1110LL;
  }

  STCreateError( v16,  v17,  v18,  0LL,  (uint64_t)"-[STRemoteExtractor finishStreamWithCompletionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  v19);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void, void *))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v6);
    goto LABEL_9;
  }

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) ioQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_3;
  block[3] = &unk_18A24BE78;
  uint64_t v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  STGetLogHandle();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 136446722;
    int v7 = "-[STRemoteExtractor finishStreamWithCompletionBlock:]_block_invoke_3";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl( &dword_1884F9000,  v2,  OS_LOG_TYPE_DEFAULT,  "%{public}s: %@: calling finish completion block - error %@",  (uint8_t *)&v6,  0x20u);
  }

  if (*(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "setError:");
  }
  [*(id *)(a1 + 32) _invalidate];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[STRemoteExtractor ioQueue](self, "ioQueue");
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[STRemoteExtractor ioQueue](self, "ioQueue");
    uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke;
    block[3] = &unk_18A24C148;
    void block[4] = self;
    id v16 = v7;
    id v15 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    STGetLogHandle();
    __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[STRemoteExtractor terminateStreamWithError:completionBlock:].cold.1();
    }

    uint64_t v11 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"no ioQueue"];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError( v11,  1LL,  v12,  0LL,  (uint64_t)"-[STRemoteExtractor terminateStreamWithError:completionBlock:]",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  1161LL);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v13);
    }
  }
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) error];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    STGetLogHandle();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_4((uint64_t)v2, v4);
    }

    uint64_t v5 = *(void *)(a1 + 48);
    [*(id *)(a1 + 32) error];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    goto LABEL_9;
  }

  if ([*v2 isPrepared])
  {
    if ([*v2 isInvalid])
    {
      STGetLogHandle();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_1();
      }

      uint64_t v20 = STExtractorErrorDomain;
      [NSString stringWithFormat:@"-supplyBytes: called on invalid extractor"];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      id v15 = v20;
      uint64_t v16 = 8LL;
      uint64_t v17 = v14;
      uint64_t v18 = 1174LL;
    }

    else
    {
      [*v2 extractionServiceConnection];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        uint64_t v8 = MEMORY[0x1895F87A8];
        v25[0] = MEMORY[0x1895F87A8];
        v25[1] = 3221225472LL;
        v25[2] = __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_2;
        v25[3] = &unk_18A24BEA0;
        v25[4] = *(void *)(a1 + 32);
        id v26 = *(id *)(a1 + 48);
        uint64_t v9 = (void *)MEMORY[0x1895C7F60](v25);
        [*(id *)(a1 + 32) extractionServiceConnection];
        __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v8;
        v23[1] = 3221225472LL;
        v23[2] = __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_145;
        v23[3] = &unk_18A24C120;
        id v24 = v9;
        id v11 = v9;
        [v10 remoteObjectProxyWithErrorHandler:v23];
        id v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "remote_terminateStreamWithError:completionBlock:", *(void *)(a1 + 40), v11);
LABEL_9:

        return;
      }

      STGetLogHandle();
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_2();
      }

      unint64_t v22 = STExtractorErrorDomain;
      [NSString stringWithFormat:@"%@: no connection to extraction service", *v2];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      id v15 = v22;
      uint64_t v16 = 5LL;
      uint64_t v17 = v14;
      uint64_t v18 = 1176LL;
    }
  }

  else
  {
    STGetLogHandle();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_3();
    }

    __int16 v13 = STExtractorErrorDomain;
    [NSString stringWithFormat:@"%s called before prepare on %@", "-[STRemoteExtractor terminateStreamWithError:completionBlock:]_block_invoke", *v2];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v13;
    uint64_t v16 = 5LL;
    uint64_t v17 = v14;
    uint64_t v18 = 1173LL;
  }

  STCreateError( v15,  v16,  v17,  0LL,  (uint64_t)"-[STRemoteExtractor terminateStreamWithError:completionBlock:]_block_invoke",  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m",  v18);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void, void *))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), v6);
    goto LABEL_9;
  }

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) ioQueue];
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_3;
  block[3] = &unk_18A24BE78;
  uint64_t v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  STGetLogHandle();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 136446722;
    id v7 = "-[STRemoteExtractor terminateStreamWithError:completionBlock:]_block_invoke_3";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl( &dword_1884F9000,  v2,  OS_LOG_TYPE_DEFAULT,  "%{public}s: %@: calling terminate completion block - error %@",  (uint8_t *)&v6,  0x20u);
  }

  if (*(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "setError:");
  }
  [*(id *)(a1 + 32) _invalidate];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_145(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)remote_setExtractionProgress:(double)a3
{
  uint64_t v4 = -[STRemoteExtractor extractorDelegate](self, "extractorDelegate");
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    id v7 = (void *)v4;
    char v6 = objc_opt_respondsToSelector();
    uint64_t v5 = v7;
    if ((v6 & 1) != 0)
    {
      [v7 setExtractionProgress:a3];
      uint64_t v5 = v7;
    }
  }
}

- (void)remote_extractionCompleteAtArchivePath:(id)a3
{
  id v5 = a3;
  -[STRemoteExtractor extractorDelegate](self, "extractorDelegate");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 extractionCompleteAtArchivePath:v5];
  }
}

- (void)remote_extractionEnteredPassthroughMode
{
  uint64_t v2 = -[STRemoteExtractor extractorDelegate](self, "extractorDelegate");
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    id v5 = (void *)v2;
    char v4 = objc_opt_respondsToSelector();
    uint64_t v3 = v5;
    if ((v4 & 1) != 0)
    {
      [v5 extractionEnteredPassthroughMode];
      uint64_t v3 = v5;
    }
  }
}

- (NSDictionary)options
{
  return &self->_options->super;
}

- (STExtractorDelegate)extractorDelegate
{
  return (STExtractorDelegate *)objc_loadWeakRetained((id *)&self->_extractorDelegate);
}

- (void)setExtractorDelegate:(id)a3
{
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

- (OS_dispatch_queue)ioQueue
{
  return self->_ioQueue;
}

- (OS_dispatch_queue)reservationQueue
{
  return self->_reservationQueue;
}

- (NSXPCConnection)extractionServiceConnection
{
  return self->_extractionServiceConnection;
}

- (ExtractionServiceInfo)extractionServiceInfo
{
  return self->_extractionServiceInfo;
}

- (STExtractionOriginator)internalExtractionOriginator
{
  return self->_internalExtractionOriginator;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)isPrepared
{
  return self->_isPrepared;
}

- (void)setIsPrepared:(BOOL)a3
{
  self->_isPrepared = a3;
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (BOOL)dataStreamStarted
{
  return self->_dataStreamStarted;
}

- (void)setDataStreamStarted:(BOOL)a3
{
  self->_dataStreamStarted = a3;
}

- (BOOL)finalBytesSent
{
  return self->_finalBytesSent;
}

- (void)setFinalBytesSent:(BOOL)a3
{
  self->_finalBytesSent = a3;
}

- (unint64_t)requiredExtractionMemory
{
  return self->_requiredExtractionMemory;
}

- (void)setRequiredExtractionMemory:(unint64_t)a3
{
  self->_requiredExtractionMemory = a3;
}

- (unint64_t)reservedExtractionMemory
{
  return self->_reservedExtractionMemory;
}

- (void)setReservedExtractionMemory:(unint64_t)a3
{
  self->_reservedExtractionMemory = a3;
}

- (void).cxx_destruct
{
}

- (void)init
{
}

- (void)createOutputDir:.cold.1()
{
}

- (void)suppressCompletionsDuringShutdown
{
}

- (void)doesConsumeExtractedData
{
}

- (void)prepareForExtractionToPath:completionBlock:.cold.1()
{
}

- (void)prepareForExtractionToPath:completionBlock:.cold.2()
{
}

- (void)prepareForExtractionToPath:completionBlock:.cold.3()
{
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_1()
{
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_2()
{
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_3()
{
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_4()
{
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_5()
{
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_6( uint64_t a1,  os_log_s *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  int v4 = *__error();
  uint64_t v5 = __error();
  char v6 = strerror(*v5);
  int v7 = 136446978;
  __int16 v8 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
  __int16 v9 = 2080;
  uint64_t v10 = a1;
  __int16 v11 = 1024;
  int v12 = v4;
  __int16 v13 = 2080;
  uint64_t v14 = v6;
  _os_log_error_impl( &dword_1884F9000,  a2,  OS_LOG_TYPE_ERROR,  "%{public}s: Failed to issue sandbox extension for %s : %d (%s)",  (uint8_t *)&v7,  0x26u);
  OUTLINED_FUNCTION_4();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_7()
{
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_8(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 136446210;
  uint64_t v2 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
  _os_log_error_impl( &dword_1884F9000,  log,  OS_LOG_TYPE_ERROR,  "%{public}s: Trying to create it anyway.",  (uint8_t *)&v1,  0xCu);
  OUTLINED_FUNCTION_17();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_9( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v3 = 136446722;
  uint64_t v4 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
  __int16 v5 = 2080;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  OUTLINED_FUNCTION_6( &dword_1884F9000,  a3,  (uint64_t)a3,  "%{public}s: Failed to remove existing path: %s (%@)",  (uint8_t *)&v3);
  OUTLINED_FUNCTION_9();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_10()
{
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_88_cold_1()
{
  int v3 = 136446722;
  uint64_t v4 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  __int16 v7 = 2112;
  uint64_t v8 = v1;
  OUTLINED_FUNCTION_6(&dword_1884F9000, v2, (uint64_t)v2, "%{public}s: %@: prepare returning error %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_9();
}

- (void)_sendData:completion:.cold.1()
{
}

- (void)_sendData:completion:.cold.2()
{
}

- (void)_sendData:(uint64_t)a3 completion:.cold.3(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 136446466;
  uint64_t v4 = "-[STRemoteExtractor _sendData:completion:]";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_20( &dword_1884F9000,  a2,  a3,  "%{public}s: Supplying entire byte range of data (%lu bytes)",  (uint8_t *)&v3);
  OUTLINED_FUNCTION_17();
}

- (void)_sendData:completion:.cold.4()
{
}

- (void)_sendData:(os_log_s *)a3 completion:.cold.5(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136446466;
  *(void *)(a1 + 4) = "-[STRemoteExtractor _sendData:completion:]";
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a2;
  OUTLINED_FUNCTION_20( &dword_1884F9000,  a3,  (uint64_t)a3,  "%{public}s: Starting to send %lu bytes to extractor in chunks",  (uint8_t *)a1);
}

- (void)_sendData:completion:.cold.6()
{
}

- (void)_sendData:(void *)a1 completion:(os_log_s *)a2 .cold.7(void *a1, os_log_s *a2)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = [v2 stringWithFormat:@"-supplyBytes called on extractor that has already returned an error: %@", v7];
  uint64_t v10 = OUTLINED_FUNCTION_23(v8, v9);
  if (v10)
  {
    uint64_t v3 = (void *)v3[325];
    [a1 error];
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = [v3 stringWithFormat:@"-supplyBytes called on extractor that has already returned an error: %@", a1];
    OUTLINED_FUNCTION_21(v11, v12);
  }

  v14[0] = 136447490;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10();
  *(_DWORD *)((char *)&v14[13] + 2) = 737;
  OUTLINED_FUNCTION_3_0( &dword_1884F9000,  a2,  v13,  "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n",  (uint8_t *)v14);
  if (v10)
  {
  }

  OUTLINED_FUNCTION_8();
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_106_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_112_cold_1()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 8) + 24LL);
  int v4 = 136446978;
  uint64_t v5 = "-[STRemoteExtractor _sendData:completion:]_block_invoke";
  __int16 v6 = 2048;
  uint64_t v7 = v2;
  __int16 v8 = 2048;
  uint64_t v9 = v1;
  __int16 v10 = 2048;
  uint64_t v11 = v1 + v2;
  _os_log_debug_impl( &dword_1884F9000,  v3,  OS_LOG_TYPE_DEBUG,  "%{public}s: Reserved %ld bytes; adding to existing length: %ld bytes; total reserved: %lu bytes",
    (uint8_t *)&v4,
    0x2Au);
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_112_cold_2()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 136446722;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13( &dword_1884F9000,  v0,  (uint64_t)v0,  "%{public}s: Failed to reserve last range; falling out with last range {%lu, %lu}",
    (uint8_t *)v1);
  OUTLINED_FUNCTION_9();
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_112_cold_3()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 136446722;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1884F9000, v0, (uint64_t)v0, "%{public}s: Already processed {%lu, %lu}", (uint8_t *)v1);
  OUTLINED_FUNCTION_9();
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_119_cold_1()
{
  v3[0] = 136446722;
  OUTLINED_FUNCTION_19();
  __int16 v4 = 2080;
  uint64_t v5 = v0;
  OUTLINED_FUNCTION_13( &dword_1884F9000,  v1,  v2,  "%{public}s: %@: calling supplyBytes: completion block with no error; dataComplete = %s",
    (uint8_t *)v3);
  OUTLINED_FUNCTION_9();
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_119_cold_2()
{
  v3[0] = 136446722;
  OUTLINED_FUNCTION_19();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_6( &dword_1884F9000,  v2,  (uint64_t)v2,  "%{public}s: %@: calling supplyBytes: completion block with error %@",  (uint8_t *)v3);
  OUTLINED_FUNCTION_9();
}

- (void)supplyBytes:withCompletionBlock:.cold.1()
{
}

- (void)supplyBytes:withCompletionBlock:.cold.2()
{
}

- (void)supplyBytes:withCompletionBlock:.cold.3()
{
}

- (void)supplyBytes:withCompletionBlock:.cold.4()
{
}

- (void)supplyBytes:withCompletionBlock:.cold.5()
{
}

- (void)supplyBytes:withCompletionBlock:.cold.6()
{
}

- (void)supplyBytes:(void *)a1 withCompletionBlock:(os_log_s *)a2 .cold.7(void *a1, os_log_s *a2)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = [v2 stringWithFormat:@"-supplyBytes called on extractor that has already returned an error: %@", v7];
  uint64_t v10 = OUTLINED_FUNCTION_23(v8, v9);
  if (v10)
  {
    uint64_t v3 = (void *)v3[325];
    [a1 error];
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = [v3 stringWithFormat:@"-supplyBytes called on extractor that has already returned an error: %@", a1];
    OUTLINED_FUNCTION_21(v11, v12);
  }

  v14[0] = 136447490;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10();
  *(_DWORD *)((char *)&v14[13] + 2) = 951;
  OUTLINED_FUNCTION_3_0( &dword_1884F9000,  a2,  v13,  "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n",  (uint8_t *)v14);
  if (v10)
  {
  }

  OUTLINED_FUNCTION_8();
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_1()
{
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_2()
{
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_3()
{
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_4(id *a1, os_log_s *a2)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = [v2 stringWithFormat:@"-supplyBytes called on extractor that has already returned an error: %@", v7];
  uint64_t v10 = OUTLINED_FUNCTION_23(v8, v9);
  if (v10)
  {
    uint64_t v3 = (void *)v3[325];
    [*a1 error];
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    id v11 = [v3 stringWithFormat:@"-supplyBytes called on extractor that has already returned an error: %@", a1];
    OUTLINED_FUNCTION_21(v11, v12);
  }

  v14[0] = 136447490;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10();
  *(_DWORD *)((char *)&v14[13] + 2) = 967;
  OUTLINED_FUNCTION_3_0( &dword_1884F9000,  a2,  v13,  "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n",  (uint8_t *)v14);
  if (v10)
  {
  }

  OUTLINED_FUNCTION_8();
}

- (void)suspendStreamWithCompletionBlock:.cold.1()
{
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_1()
{
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_2()
{
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_3()
{
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_4( uint64_t a1,  os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136446722;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6( &dword_1884F9000,  a2,  v4,  "%{public}s: %@: suspend called on extractor that has already returned an error %@",  (uint8_t *)v5);

  OUTLINED_FUNCTION_4();
}

- (void)finishStreamWithCompletionBlock:.cold.1()
{
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_1()
{
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_2()
{
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_3()
{
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_4(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136446722;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6( &dword_1884F9000,  a2,  v4,  "%{public}s: %@: finish called on extractor that has already returned an error %@",  (uint8_t *)v5);

  OUTLINED_FUNCTION_4();
}

- (void)terminateStreamWithError:completionBlock:.cold.1()
{
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_1()
{
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_2()
{
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_3()
{
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_4( uint64_t a1,  os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136446722;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6( &dword_1884F9000,  a2,  v4,  "%{public}s: %@: terminate called on extractor that has already returned an error: %@",  (uint8_t *)v5);

  OUTLINED_FUNCTION_4();
}

@end