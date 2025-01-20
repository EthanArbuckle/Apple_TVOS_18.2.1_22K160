@interface StreamingUnzipState
+ (id)unzipStateWithPath:(id)a3 options:(id)a4 error:(id *)a5;
- ($60BD80F4A9861DCDB4EE597FE3E0B576)hashContext;
- ($822FBFACD4CCD92A3944B2397EA6D836)dataDescriptor;
- ($829F55CE35F6C9608F0923D368613342)currentLFRecord;
- ($D199E5C2C3D9BBBBA45D19FC310E2D7B)cmpState;
- (BOOL)currentLFRequiresDataDescriptor;
- (BOOL)denyInvalidSymlinks;
- (BOOL)performCachedWrites;
- (BOOL)performingExtraction;
- (BOOL)resolveOwnershipWithExtraField:(id *)a3 outUID:(unsigned int *)a4 outGID:(unsigned int *)a5;
- (BOOL)storeCurrentFileInMemory;
- (NSDictionary)streamInfoDict;
- (NSMutableData)inMemoryFileData;
- (NSMutableData)unsureData;
- (NSNumber)overrideGID;
- (NSNumber)overrideUID;
- (NSSet)cachedGIDs;
- (NSString)lastChunkPartialHash;
- (NSString)unzipPath;
- (StreamingFileWriter)fileWriter;
- (StreamingUnzipState)init;
- (char)initWithPath:(void *)a3 options:(void *)a4 error:;
- (id)_checkHashForOffset:(uint64_t)a1;
- (id)checkLastChunkPartialHash;
- (id)finishStream;
- (id)serializeState;
- (id)updateHashFromOffset:(unint64_t)a3 withBytes:(const void *)a4 length:(unint64_t)a5;
- (id)updateHashFromOffset:(unint64_t)a3 withBytes:(const void *)a4 length:(unint64_t)a5 onlyFinishCurrentChunk:(BOOL)a6;
- (unint64_t)bytesHashedInChunk;
- (unint64_t)currentCRC32;
- (unint64_t)currentLFRecordAllocationSize;
- (unint64_t)currentOffset;
- (unint64_t)hashedChunkSize;
- (unint64_t)recordsProcessed;
- (unint64_t)thisStageBytesComplete;
- (unint64_t)totalFileSizeWritten;
- (unint64_t)totalRecordCount;
- (unint64_t)totalUncompressedBytes;
- (unint64_t)uncompressedBytesOutput;
- (unsigned)currentLFMode;
- (unsigned)streamState;
- (void)_internalSetStreamState:(unsigned __int8)a3;
- (void)clearSavedState;
- (void)dealloc;
- (void)setCurrentCRC32:(unint64_t)a3;
- (void)setCurrentLFMode:(unsigned __int16)a3;
- (void)setCurrentLFRecord:(id *)a3;
- (void)setCurrentLFRecordAllocationSize:(unint64_t)a3;
- (void)setCurrentLFRequiresDataDescriptor:(BOOL)a3;
- (void)setCurrentOffset:(unint64_t)a3;
- (void)setDataDescriptor:(id *)a3;
- (void)setDenyInvalidSymlinks:(BOOL)a3;
- (void)setFileWriter:(id)a3;
- (void)setInMemoryFileData:(id)a3;
- (void)setLastChunkPartialHash:(id)a3;
- (void)setPerformCachedWrites:(BOOL)a3;
- (void)setPerformingExtraction:(BOOL)a3;
- (void)setRecordsProcessed:(unint64_t)a3;
- (void)setStoreCurrentFileInMemory:(BOOL)a3;
- (void)setStreamInfoDict:(id)a3;
- (void)setStreamState:(unsigned __int8)a3;
- (void)setThisStageBytesComplete:(unint64_t)a3;
- (void)setTotalFileSizeWritten:(unint64_t)a3;
- (void)setTotalRecordCount:(unint64_t)a3;
- (void)setTotalUncompressedBytes:(unint64_t)a3;
- (void)setUncompressedBytesOutput:(unint64_t)a3;
- (void)setUnsureData:(id)a3;
@end

@implementation StreamingUnzipState

- (StreamingUnzipState)init
{
}

- (void)dealloc
{
  fileWriter = self->_fileWriter;
  if (fileWriter)
  {
    -[StreamingFileWriter closeCurrentOutputFD](fileWriter, "closeCurrentOutputFD");
    v4 = self->_fileWriter;
    self->_fileWriter = 0LL;
  }

  free(self->_dataDescriptor);
  free(self->_currentLFRecord);
  compression_stream_destroy((compression_stream *)&self->_cmpState);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___StreamingUnzipState;
  -[StreamingUnzipState dealloc](&v5, sel_dealloc);
}

- ($D199E5C2C3D9BBBBA45D19FC310E2D7B)cmpState
{
  return ($D199E5C2C3D9BBBBA45D19FC310E2D7B *)&self->_cmpState;
}

- (void)_internalSetStreamState:(unsigned __int8)a3
{
  self->_streamState = a3;
}

- (void)setStreamState:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  uint64_t v23 = *MEMORY[0x1895F89C0];
  self->_thisStageBytesComplete = 0LL;
  SZGetLoggingHandle();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unint64_t streamState = self->_streamState;
    if (streamState > 8) {
      v17 = @"Unknown";
    }
    else {
      v17 = off_189FE1CB8[streamState];
    }
    if (v3 > 8) {
      v18 = @"Unknown";
    }
    else {
      v18 = off_189FE1CB8[v3];
    }
    int v19 = 138412546;
    v20 = v17;
    __int16 v21 = 2112;
    v22 = v18;
    _os_log_debug_impl( &dword_1870CA000,  v5,  OS_LOG_TYPE_DEBUG,  "Updating stream state from %@ to %@",  (uint8_t *)&v19,  0x16u);
  }

  switch(v3)
  {
    case 0u:
      int v6 = self->_streamState;
      if (v6 != 1 && v6 != 4) {
        __assert_rtn( "-[StreamingUnzipState setStreamState:]",  "StreamingUnzipState.m",  208,  "kStreamStateCompleteLFData == _streamState || kStreamStateIncompleteLFRecord == _streamState");
      }
      self->_currentCRC32 = 0LL;
      self->_uncompressedBytesOutput = 0LL;
      fileWriter = self->_fileWriter;
      if (fileWriter)
      {
        -[StreamingFileWriter closeCurrentOutputFD](fileWriter, "closeCurrentOutputFD");
        v8 = self->_fileWriter;
        self->_fileWriter = 0LL;
      }

      dataDescriptor = self->_dataDescriptor;
      if (dataDescriptor)
      {
        *(void *)dataDescriptor->var0 = 0LL;
        *(void *)&dataDescriptor->var1.var0.var0.var0 = 0LL;
        dataDescriptor->var1.var0.var1.var0 = 0LL;
      }

      currentLFRecord = self->_currentLFRecord;
      *(void *)currentLFRecord->var0 = 0LL;
      *(void *)&currentLFRecord->var3.var0 = 0LL;
      *(void *)((char *)&currentLFRecord->var6.var0 + 2) = 0LL;
      *(void *)&currentLFRecord->var5.var0 = 0LL;
      *(_WORD *)&self->_storeCurrentFileInMemory = 0;
      -[NSMutableData setLength:](self->_inMemoryFileData, "setLength:", 0LL);
      self->_currentLFMode = 0;
      ++self->_recordsProcessed;
      break;
    case 1u:
      if (self->_streamState) {
        __assert_rtn( "-[StreamingUnzipState setStreamState:]",  "StreamingUnzipState.m",  233,  "kStreamStateReadNextRecordSignature == _streamState");
      }
      self->_thisStageBytesComplete = 4LL;
      break;
    case 2u:
      if (self->_streamState != 1) {
        __assert_rtn( "-[StreamingUnzipState setStreamState:]",  "StreamingUnzipState.m",  238,  "kStreamStateIncompleteLFRecord == _streamState");
      }
      return;
    case 3u:
      if (self->_streamState != 2) {
        __assert_rtn( "-[StreamingUnzipState setStreamState:]",  "StreamingUnzipState.m",  242,  "kStreamStateIncompleteLFData == _streamState");
      }
      return;
    case 4u:
      if (self->_streamState - 1 >= 3) {
        __assert_rtn( "-[StreamingUnzipState setStreamState:]",  "StreamingUnzipState.m",  246,  "kStreamStateIncompleteDataDescriptor == _streamState|| kStreamStateIncompleteLFData == _streamState || kStream StateIncompleteLFRecord == _streamState");
      }
      return;
    case 5u:
      streamInfoDict = self->_streamInfoDict;
      self->_streamInfoDict = 0LL;

      unsureData = self->_unsureData;
      self->_unsureData = 0LL;

      inMemoryFileData = self->_inMemoryFileData;
      self->_inMemoryFileData = 0LL;

      free(self->_currentLFRecord);
      self->_currentLFRecord = 0LL;
      self->_thisStageBytesComplete = 0LL;
      self->_currentCRC32 = 0LL;
      self->_currentLFMode = 0;
      self->_recordsProcessed = 0LL;
      self->_totalRecordCount = 0LL;
      break;
    case 6u:
      goto LABEL_18;
    case 7u:
      v11 = self->_fileWriter;
      if (v11)
      {
        -[StreamingFileWriter closeCurrentOutputFD](v11, "closeCurrentOutputFD");
        v12 = self->_fileWriter;
        self->_fileWriter = 0LL;
      }

- (void)clearSavedState
{
  if (!stat(-[NSString fileSystemRepresentation](self->_unzipPath, "fileSystemRepresentation"), &v5))
  {
    unzipPath = self->_unzipPath;
    if ((v5.st_mode & 0xF000) == 0x4000)
    {
      id v4 = -[NSString stringByAppendingPathComponent:]( unzipPath,  "stringByAppendingPathComponent:",  @"com.apple.StreamingUnzipResumptionData");
      unlink((const char *)[v4 fileSystemRepresentation]);
    }

    else
    {
      removexattr( -[NSString fileSystemRepresentation](unzipPath, "fileSystemRepresentation"),  "com.apple.StreamingPassthroughResumptionData",  1);
    }
  }

- (id)serializeState
{
  v84[1] = *MEMORY[0x1895F89C0];
  if (!self->_currentOffset) {
    return 0LL;
  }
  fileWriter = self->_fileWriter;
  if (fileWriter)
  {
    id v66 = 0LL;
    BOOL v5 = -[StreamingFileWriter suspendWithError:](fileWriter, "suspendWithError:", &v66);
    id v6 = v66;
    v2 = v6;
    if (!v5) {
      return v2;
    }
  }

  if (self->_streamState == 5)
  {
    hashes = self->_hashes;
    if (hashes && -[NSArray count](hashes, "count"))
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
      [v8 setOutputFormat:200];
      [v8 encodeInt:8 forKey:@"SerializationVersion"];
      [v8 encodeBytes:&self->_hashContext.context length:gHashContextSizes[self->_hashContext.hashType] forKey:@"HashContext"];
      [v8 encodedData];
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
LABEL_9:
        SZGetLoggingHandle();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          unzipPath = self->_unzipPath;
          *(_DWORD *)buf = 138412290;
          v78 = (const char *)unzipPath;
          _os_log_error_impl( &dword_1870CA000,  v10,  OS_LOG_TYPE_ERROR,  "Failed to create archive for passthrough EA on path %@",  buf,  0xCu);
        }

        v11 = self->_unzipPath;
        uint64_t v83 = *MEMORY[0x1896074F8];
        v84[0] = v11;
        [MEMORY[0x189603F68] dictionaryWithObjects:v84 forKeys:&v83 count:1];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError( (uint64_t)"-[StreamingUnzipState serializeState]",  362LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  v12,  @"Failed to create archive for passthrough EA on path %@",  v13,  (uint64_t)self->_unzipPath);
LABEL_38:
        v2 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_53:
        return v2;
      }
    }

    else
    {
      v9 = (void *)objc_opt_new();
      if (!v9) {
        goto LABEL_9;
      }
    }

    v41 = -[NSString fileSystemRepresentation](self->_unzipPath, "fileSystemRepresentation");
    id v42 = v9;
    if (setxattr( v41,  "com.apple.StreamingPassthroughResumptionData",  (const void *)[v42 bytes],  objc_msgSend(v42, "length"),  0,  1))
    {
      uint64_t v43 = *__error();
      SZGetLoggingHandle();
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v57 = self->_unzipPath;
        v58 = strerror(v43);
        *(_DWORD *)buf = 136315650;
        v78 = "com.apple.StreamingPassthroughResumptionData";
        __int16 v79 = 2112;
        unint64_t v80 = (unint64_t)v57;
        __int16 v81 = 2080;
        v82 = v58;
        _os_log_error_impl( &dword_1870CA000,  v44,  OS_LOG_TYPE_ERROR,  "Failed to set passthrough EA %s on path %@: %s",  buf,  0x20u);
      }

      v45 = (void *)*MEMORY[0x189607688];
      v46 = self->_unzipPath;
      uint64_t v75 = *MEMORY[0x1896074F8];
      v76 = v46;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v43);
      _CreateError( (uint64_t)"-[StreamingUnzipState serializeState]",  367LL,  v45,  v43,  0LL,  v12,  @"Failed to set passthrough EA %s on path %@: %s",  v47,  (uint64_t)"com.apple.StreamingPassthroughResumptionData");
      goto LABEL_38;
    }

    return 0LL;
  }

  v9 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
  [v9 setOutputFormat:200];
  [v9 encodeInt:8 forKey:@"SerializationVersion"];
  v14 = self->_hashes;
  if (v14 && -[NSArray count](v14, "count")) {
    [v9 encodeBytes:&self->_hashContext.context length:gHashContextSizes[self->_hashContext.hashType] forKey:@"HashContext"];
  }
  [v9 encodeObject:self->_streamInfoDict forKey:@"StreamInfoDict"];
  [v9 encodeObject:self->_lastChunkPartialHash forKey:@"LastChunkPartialHash"];
  [v9 encodeObject:self->_unsureData forKey:@"UnsureData"];
  [v9 encodeObject:self->_inMemoryFileData forKey:@"InMemoryFileData"];
  currentLFRecord = self->_currentLFRecord;
  if (currentLFRecord)
  {
    else {
      unint64_t currentLFRecordAllocationSize = HIWORD(currentLFRecord->var7.var0)
    }
                                    + (unint64_t)currentLFRecord->var8.var0
                                    + 30;
    [v9 encodeBytes:currentLFRecord length:currentLFRecordAllocationSize forKey:@"LocalFileRecord"];
  }

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_thisStageBytesComplete];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v17 forKey:@"StageBytesComplete"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_currentOffset];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v18 forKey:@"CurrentOffset"];

  int v19 = self->_fileWriter;
  if (v19)
  {
    id v65 = 0LL;
    uint64_t v20 = -[StreamingFileWriter currentOffsetWithError:](v19, "currentOffsetWithError:", &v65);
    id v21 = v65;
    v22 = v21;
    if (v20 == -1)
    {
      SZGetLoggingHandle();
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_1870CA000,  v48,  OS_LOG_TYPE_ERROR,  "Unable to get current output offset from current output file",  buf,  2u);
      }

      uint64_t v73 = *MEMORY[0x1896074F8];
      GetFileNameStringFromLocalFileRecord(self->_currentLFRecord->var0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v49;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = @"Unable to get current output offset from current output file";
      uint64_t v53 = 395LL;
    }

    else
    {
      if (v20 == self->_uncompressedBytesOutput)
      {

        goto LABEL_24;
      }

      SZGetLoggingHandle();
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        unint64_t uncompressedBytesOutput = self->_uncompressedBytesOutput;
        *(_DWORD *)buf = 134218240;
        v78 = (const char *)uncompressedBytesOutput;
        __int16 v79 = 2048;
        unint64_t v80 = v20;
        _os_log_error_impl( &dword_1870CA000,  v56,  OS_LOG_TYPE_ERROR,  "Mismatch between uncompressed bytes output (%llu) and output file offset (%lld)",  buf,  0x16u);
      }

      uint64_t v71 = *MEMORY[0x1896074F8];
      GetFileNameStringFromLocalFileRecord(self->_currentLFRecord->var0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v49;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v63 = self->_uncompressedBytesOutput;
      v52 = @"Mismatch between uncompressed bytes output (%llu) and output file offset (%lld)";
      uint64_t v53 = 397LL;
    }

    _CreateError( (uint64_t)"-[StreamingUnzipState serializeState]",  v53,  @"SZExtractorErrorDomain",  1LL,  v22,  v51,  v52,  v50,  v63);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_53;
  }

- (id)checkLastChunkPartialHash
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v3 = gHashDigestSizes[self->_hashContext.hashType];
  __int128 v4 = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[11];
  v20[10] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[9];
  v20[11] = v4;
  v20[12] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[13];
  CC_LONG64 v21 = self->_hashContext.context.sha384.wbuf[15];
  __int128 v5 = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[3];
  v20[6] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[1];
  v20[7] = v5;
  __int128 v6 = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[7];
  v20[8] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[5];
  v20[9] = v6;
  __int128 v7 = *(_OWORD *)&self->_hashContext.context.sha512.hash[3];
  v20[2] = *(_OWORD *)&self->_hashContext.context.sha512.hash[1];
  v20[3] = v7;
  __int128 v8 = *(_OWORD *)&self->_hashContext.context.sha512.hash[7];
  v20[4] = *(_OWORD *)&self->_hashContext.context.sha512.hash[5];
  v20[5] = v8;
  __int128 v9 = *(_OWORD *)&self->_hashContext.context.sha512.count[1];
  v20[0] = *(_OWORD *)&self->_hashContext.hashType;
  v20[1] = v9;
  GenericHashFinal((unsigned __int8 *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL), (uint64_t)v20);
  StringFromDigest((unsigned __int8 *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL), v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 caseInsensitiveCompare:self->_lastChunkPartialHash];
  SZGetLoggingHandle();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      lastChunkPartialHash = self->_lastChunkPartialHash;
      *(_DWORD *)buf = 138412546;
      v25 = lastChunkPartialHash;
      __int16 v26 = 2112;
      v27 = v10;
      _os_log_error_impl( &dword_1870CA000,  v13,  OS_LOG_TYPE_ERROR,  "Hash mismatch for last partial chunk: expected %@, got %@",  buf,  0x16u);
    }

    v22 = @"SZExtractorFileOffsetErrorKey";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_currentOffset];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError( (uint64_t)"-[StreamingUnzipState checkLastChunkPartialHash]",  491LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v15,  @"Hash mismatch for last partial chunk: expected %@, got %@",  v16,  (uint64_t)self->_lastChunkPartialHash);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v25 = (NSString *)v10;
      _os_log_debug_impl( &dword_1870CA000,  v13,  OS_LOG_TYPE_DEBUG,  "Verified that last chunk partial hash matches: %@",  buf,  0xCu);
    }

    v17 = 0LL;
    self->_bytesHashedInChunk = 0LL;
  }

  return v17;
}

- (id)updateHashFromOffset:(unint64_t)a3 withBytes:(const void *)a4 length:(unint64_t)a5 onlyFinishCurrentChunk:(BOOL)a6
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  hashes = self->_hashes;
  if (hashes)
  {
    hashes = (void *)[hashes count];
    if (hashes)
    {
      if (self->_hashedChunkSize || -[NSArray count](self->_hashes, "count") < 2)
      {
        if (a5)
        {
          while (1)
          {
            unint64_t hashedChunkSize = self->_hashedChunkSize;
            unint64_t v16 = a5;
            if (hashedChunkSize)
            {
              unint64_t v17 = hashedChunkSize - self->_bytesHashedInChunk;
              if (a5 >= v17) {
                unint64_t v16 = v17;
              }
              else {
                unint64_t v16 = a5;
              }
            }

            GenericHashUpdate((uint64_t)&self->_hashContext, (void *)a4, v16);
            unint64_t v18 = self->_hashedChunkSize;
            unint64_t v19 = self->_bytesHashedInChunk + v16;
            self->_bytesHashedInChunk = v19;
            if (!v18) {
              break;
            }
            a5 -= v16;
            if (v19 > v18) {
              __assert_rtn( "-[StreamingUnzipState updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:]",  "StreamingUnzipState.m",  534,  "_bytesHashedInChunk <= _hashedChunkSize");
            }
            a4 = (char *)a4 + v16;
            a3 += v16;
            if (v19 == v18)
            {
              hashes = -[StreamingUnzipState _checkHashForOffset:]((uint64_t)self, a3 - v19);
              if (hashes) {
                return hashes;
              }
              GenericHashInit((uint64_t)&self->_hashContext, self->_hashContext.hashType);
              hashes = 0LL;
              self->_bytesHashedInChunk = 0LL;
              if (a6 || !a5) {
                return hashes;
              }
            }

            else if (!a5)
            {
              break;
            }
          }
        }

        hashes = 0LL;
      }

      else
      {
        SZGetLoggingHandle();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          unint64_t v21 = self->_hashedChunkSize;
          NSUInteger v22 = -[NSArray count](self->_hashes, "count");
          *(_DWORD *)buf = 134218240;
          unint64_t v24 = v21;
          __int16 v25 = 2048;
          NSUInteger v26 = v22;
          _os_log_error_impl( &dword_1870CA000,  v12,  OS_LOG_TYPE_ERROR,  "Ambiguous or missing hash chunk size: chunk size is %llu but have %lu hashes",  buf,  0x16u);
        }

        unint64_t v13 = self->_hashedChunkSize;
        -[NSArray count](self->_hashes, "count");
        _CreateError( (uint64_t)"-[StreamingUnzipState updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:]",  508LL,  @"SZExtractorErrorDomain",  4LL,  0LL,  0LL,  @"Ambiguous or missing hash chunk size: chunk size is %llu but have %lu hashes",  v14,  v13);
        hashes = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return hashes;
}

- (id)updateHashFromOffset:(unint64_t)a3 withBytes:(const void *)a4 length:(unint64_t)a5
{
  return -[StreamingUnzipState updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:]( self,  "updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:",  a3,  a4,  a5,  0LL);
}

- (id)finishStream
{
  if (self->_streamState - 5 >= 3)
  {
    SZGetLoggingHandle();
    __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl( &dword_1870CA000,  v4,  OS_LOG_TYPE_ERROR,  "Finishing an incomplete stream! This stream will not be resumable.",  (uint8_t *)&v8,  2u);
    }

    uint64_t v3 = _CreateError( (uint64_t)"-[StreamingUnzipState finishStream]",  568LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"Finishing an incomplete stream! This stream will not be resumable.",  v5,  v8);
  }

  else
  {
    if (!self->_bytesHashedInChunk)
    {
      __int128 v6 = 0LL;
      goto LABEL_8;
    }

    uint64_t v3 = -[StreamingUnzipState _checkHashForOffset:]((uint64_t)self, self->_currentOffset);
  }

  __int128 v6 = (void *)v3;
LABEL_8:
  -[StreamingUnzipState setStreamState:](self, "setStreamState:", 7LL);
  return v6;
}

- (BOOL)resolveOwnershipWithExtraField:(id *)a3 outUID:(unsigned int *)a4 outGID:(unsigned int *)a5
{
  if (a3 && a3->var1.var0 >= 0xCu)
  {
    int var0 = a3->var4.var0;
    uint64_t v9 = a3->var5.var0;
    int v10 = 1;
  }

  else
  {
    int v10 = 0;
    uint64_t v9 = 0xFFFFFFFFLL;
    int var0 = -1;
  }

  -[StreamingUnzipState overrideUID](self, "overrideUID");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = -[StreamingUnzipState overrideGID](self, "overrideGID");
  unint64_t v13 = (void *)v12;
  if (v11)
  {
    int var0 = [v11 unsignedIntValue];
    if (!v13) {
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v9 = [v13 unsignedIntValue];
    goto LABEL_10;
  }

  if (v12) {
    goto LABEL_9;
  }
  if (!v10) {
    goto LABEL_14;
  }
LABEL_10:
  -[StreamingUnzipState cachedGIDs](self, "cachedGIDs");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uid_t v15 = getuid();
  if (v15)
  {
    if (var0 != -1 && v15 != var0) {
      goto LABEL_13;
    }
    if ((_DWORD)v9 == -1)
    {
      unint64_t v18 = 0LL;
    }

    else
    {
      uint64_t v17 = [MEMORY[0x189607968] numberWithUnsignedInt:v9];
      unint64_t v18 = (void *)v17;
      if (v14 && v17 && ![v14 containsObject:v17])
      {

LABEL_13:
LABEL_14:
        BOOL v16 = 0;
        goto LABEL_32;
      }
    }
  }

  if (a4)
  {
    if (getuid()) {
      unsigned int v19 = -1;
    }
    else {
      unsigned int v19 = var0;
    }
    *a4 = v19;
  }

  if (a5) {
    *a5 = v9;
  }
  BOOL v16 = 1;
LABEL_32:

  return v16;
}

- (NSString)unzipPath
{
  return self->_unzipPath;
}

- ($60BD80F4A9861DCDB4EE597FE3E0B576)hashContext
{
  __int128 v3 = *(_OWORD *)self[1].var1.var5.wbuf;
  *(_OWORD *)&retstr->var1.var5.wbuf[9] = *(_OWORD *)&self[1].var1.var5.hash[6];
  *(_OWORD *)&retstr->var1.var5.wbuf[11] = v3;
  *(_OWORD *)&retstr->var1.var5.wbuf[13] = *(_OWORD *)&self[1].var1.var5.wbuf[2];
  retstr->var1.var4.wbuf[15] = self[1].var1.var4.wbuf[4];
  __int128 v4 = *(_OWORD *)self[1].var1.var5.hash;
  *(_OWORD *)&retstr->var1.var5.wbuf[1] = *(_OWORD *)&self[1].var1.var0.A;
  *(_OWORD *)&retstr->var1.var5.wbuf[3] = v4;
  __int128 v5 = *(_OWORD *)&self[1].var1.var5.hash[4];
  *(_OWORD *)&retstr->var1.var5.wbuf[5] = *(_OWORD *)&self[1].var1.var5.hash[2];
  *(_OWORD *)&retstr->var1.var5.wbuf[7] = v5;
  __int128 v6 = *(_OWORD *)&self->var1.var5.wbuf[11];
  *(_OWORD *)&retstr->var1.var5.hash[1] = *(_OWORD *)&self->var1.var5.wbuf[9];
  *(_OWORD *)&retstr->var1.var5.hash[3] = v6;
  __int128 v7 = *(_OWORD *)&self->var1.var5.wbuf[15];
  *(_OWORD *)&retstr->var1.var5.hash[5] = *(_OWORD *)&self->var1.var5.wbuf[13];
  *(_OWORD *)&retstr->var1.var5.hash[7] = v7;
  __int128 v8 = *(_OWORD *)&self->var1.var5.wbuf[7];
  *(_OWORD *)&retstr->int var0 = *(_OWORD *)&self->var1.var5.wbuf[5];
  *(_OWORD *)&retstr->var1.var5.count[1] = v8;
  return self;
}

- (NSDictionary)streamInfoDict
{
  return self->_streamInfoDict;
}

- (void)setStreamInfoDict:(id)a3
{
}

- (NSString)lastChunkPartialHash
{
  return self->_lastChunkPartialHash;
}

- (void)setLastChunkPartialHash:(id)a3
{
}

- (NSMutableData)unsureData
{
  return self->_unsureData;
}

- (void)setUnsureData:(id)a3
{
}

- (NSMutableData)inMemoryFileData
{
  return self->_inMemoryFileData;
}

- (void)setInMemoryFileData:(id)a3
{
}

- ($829F55CE35F6C9608F0923D368613342)currentLFRecord
{
  return self->_currentLFRecord;
}

- (void)setCurrentLFRecord:(id *)a3
{
  self->_currentLFRecord = a3;
}

- (unint64_t)currentLFRecordAllocationSize
{
  return self->_currentLFRecordAllocationSize;
}

- (void)setCurrentLFRecordAllocationSize:(unint64_t)a3
{
  self->_unint64_t currentLFRecordAllocationSize = a3;
}

- (unint64_t)thisStageBytesComplete
{
  return self->_thisStageBytesComplete;
}

- (void)setThisStageBytesComplete:(unint64_t)a3
{
  self->_thisStageBytesComplete = a3;
}

- (unint64_t)currentOffset
{
  return self->_currentOffset;
}

- (void)setCurrentOffset:(unint64_t)a3
{
  self->_unint64_t currentOffset = a3;
}

- (unint64_t)currentCRC32
{
  return self->_currentCRC32;
}

- (void)setCurrentCRC32:(unint64_t)a3
{
  self->_currentCRC32 = a3;
}

- (unint64_t)recordsProcessed
{
  return self->_recordsProcessed;
}

- (void)setRecordsProcessed:(unint64_t)a3
{
  self->_recordsProcessed = a3;
}

- (unint64_t)totalRecordCount
{
  return self->_totalRecordCount;
}

- (void)setTotalRecordCount:(unint64_t)a3
{
  self->_totalRecordCount = a3;
}

- (unint64_t)totalUncompressedBytes
{
  return self->_totalUncompressedBytes;
}

- (void)setTotalUncompressedBytes:(unint64_t)a3
{
  self->_totalUncompressedBytes = a3;
}

- (unsigned)currentLFMode
{
  return self->_currentLFMode;
}

- (void)setCurrentLFMode:(unsigned __int16)a3
{
  self->_currentLFMode = a3;
}

- (unsigned)streamState
{
  return self->_streamState;
}

- (BOOL)storeCurrentFileInMemory
{
  return self->_storeCurrentFileInMemory;
}

- (void)setStoreCurrentFileInMemory:(BOOL)a3
{
  self->_storeCurrentFileInMemory = a3;
}

- (BOOL)currentLFRequiresDataDescriptor
{
  return self->_currentLFRequiresDataDescriptor;
}

- (void)setCurrentLFRequiresDataDescriptor:(BOOL)a3
{
  self->_currentLFRequiresDataDescriptor = a3;
}

- (unint64_t)bytesHashedInChunk
{
  return self->_bytesHashedInChunk;
}

- (unint64_t)hashedChunkSize
{
  return self->_hashedChunkSize;
}

- (unint64_t)uncompressedBytesOutput
{
  return self->_uncompressedBytesOutput;
}

- (void)setUncompressedBytesOutput:(unint64_t)a3
{
  self->_unint64_t uncompressedBytesOutput = a3;
}

- (unint64_t)totalFileSizeWritten
{
  return self->_totalFileSizeWritten;
}

- (void)setTotalFileSizeWritten:(unint64_t)a3
{
  self->_totalFileSizeWritten = a3;
}

- ($822FBFACD4CCD92A3944B2397EA6D836)dataDescriptor
{
  return self->_dataDescriptor;
}

- (void)setDataDescriptor:(id *)a3
{
  self->_dataDescriptor = a3;
}

- (BOOL)denyInvalidSymlinks
{
  return self->_denyInvalidSymlinks;
}

- (void)setDenyInvalidSymlinks:(BOOL)a3
{
  self->_denyInvalidSymlinks = a3;
}

- (BOOL)performCachedWrites
{
  return self->_performCachedWrites;
}

- (void)setPerformCachedWrites:(BOOL)a3
{
  self->_performCachedWrites = a3;
}

- (BOOL)performingExtraction
{
  return self->_performingExtraction;
}

- (void)setPerformingExtraction:(BOOL)a3
{
  self->_performingExtraction = a3;
}

- (NSNumber)overrideUID
{
  return self->_overrideUID;
}

- (NSNumber)overrideGID
{
  return self->_overrideGID;
}

- (StreamingFileWriter)fileWriter
{
  return self->_fileWriter;
}

- (void)setFileWriter:(id)a3
{
}

- (NSSet)cachedGIDs
{
  return self->_cachedGIDs;
}

- (void).cxx_destruct
{
}

- (id)_checkHashForOffset:(uint64_t)a1
{
  v32[3] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = a1 + 128;
  uint64_t v5 = gHashDigestSizes[*(unsigned int *)(a1 + 128)];
  GenericHashFinal(&buf[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)], a1 + 128);
  StringFromDigest(&buf[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)], v5);
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = *(void *)(v4 - 72);
  if (v7) {
    unint64_t v8 = a2 / v7;
  }
  else {
    unint64_t v8 = 0LL;
  }
  if (v8 >= [*(id *)(a1 + 96) count])
  {
    v31[0] = @"SZExtractorFileOffsetErrorKey";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a2];
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v16;
    v32[1] = v6;
    v31[1] = @"SZExtractorActualHashValueErrorKey";
    v31[2] = @"SZExtractorHashChunkIndexErrorKey";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:v8];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v17;
    [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:v31 count:3];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    SZGetLoggingHandle();
    unint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [*(id *)(a1 + 96) count];
      *(_DWORD *)buf = 134218240;
      unint64_t v24 = v8;
      __int16 v25 = 2048;
      unint64_t v26 = v22;
      _os_log_error_impl( &dword_1870CA000,  v18,  OS_LOG_TYPE_ERROR,  "Cannot validate hash; this chunk is index %llu, but we only have %lu hashes.",
        buf,
        0x16u);
    }

    [*(id *)(a1 + 96) count];
    _CreateError( (uint64_t)"-[StreamingUnzipState _checkHashForOffset:]",  457LL,  @"SZExtractorErrorDomain",  4LL,  0LL,  v9,  @"Cannot validate hash; this chunk is index %llu, but we only have %lu hashes.",
      v19,
      v8);
    uid_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [*(id *)(a1 + 96) objectAtIndex:v8];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v9 caseInsensitiveCompare:v6])
    {
      v29[0] = @"SZExtractorFileOffsetErrorKey";
      [MEMORY[0x189607968] numberWithUnsignedLongLong:a2];
      int v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v10;
      v30[1] = v6;
      v29[1] = @"SZExtractorActualHashValueErrorKey";
      v29[2] = @"SZExtractorHashChunkIndexErrorKey";
      [MEMORY[0x189607968] numberWithUnsignedLongLong:v8];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = v11;
      [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:v29 count:3];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

      SZGetLoggingHandle();
      unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        unint64_t v24 = a2;
        __int16 v25 = 2112;
        unint64_t v26 = (unint64_t)v9;
        __int16 v27 = 2112;
        uint64_t v28 = v6;
        _os_log_error_impl( &dword_1870CA000,  v13,  OS_LOG_TYPE_ERROR,  "Hash mismatch for chunk containing offset %llu: expected %@, got %@",  buf,  0x20u);
      }

      _CreateError( (uint64_t)"-[StreamingUnzipState _checkHashForOffset:]",  466LL,  @"SZExtractorErrorDomain",  4LL,  0LL,  v12,  @"Hash mismatch for chunk containing offset %llu: expected %@, got %@",  v14,  a2);
      uid_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      SZGetLoggingHandle();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        unint64_t v24 = a2;
        __int16 v25 = 2048;
        unint64_t v26 = v8;
        __int16 v27 = 2112;
        uint64_t v28 = v9;
        _os_log_debug_impl( &dword_1870CA000,  v20,  OS_LOG_TYPE_DEBUG,  "Verified that hashed data offset %llu matches index %llu: %@",  buf,  0x20u);
      }

      uid_t v15 = 0LL;
    }
  }

  return v15;
}

+ (id)unzipStateWithPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = -[StreamingUnzipState initWithPath:options:error:](objc_alloc(&OBJC_CLASS___StreamingUnzipState), v7, v8, 0LL);
  if (v9)
  {
    id v10 = 0LL;
  }

  else
  {
    id v15 = 0LL;
    int v11 = _RemoveAndRecreateDirectoryAtPath(v7, &v15);
    id v10 = v15;
    if (v11)
    {
      id v14 = v10;
      uint64_t v9 = -[StreamingUnzipState initWithPath:options:error:]( objc_alloc(&OBJC_CLASS___StreamingUnzipState),  v7,  v8,  &v14);
      id v12 = v14;

      id v10 = v12;
    }

    if (a5 && !v9)
    {
      id v10 = v10;
      *a5 = v10;
    }
  }

  return v9;
}

- (char)initWithPath:(void *)a3 options:(void *)a4 error:
{
  v276[1] = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    v48 = 0LL;
    goto LABEL_42;
  }

  if (a4) {
    *a4 = 0LL;
  }
  v259.receiver = a1;
  v259.super_class = (Class)&OBJC_CLASS___StreamingUnzipState;
  uint64_t v9 = (char *)objc_msgSendSuper2(&v259, sel_init);

  if (!v9)
  {
    SZGetLoggingHandle();
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1870CA000, v45, OS_LOG_TYPE_ERROR, "Failed to init", buf, 2u);
    }

    _CreateError( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  856LL,  (void *)*MEMORY[0x189607688],  12LL,  0LL,  0LL,  @"Failed to init",  v46,  v217);
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
    id v43 = v47;
    if (a4)
    {
      id v44 = v47;
      id v43 = v44;
      uint64_t v9 = 0LL;
      goto LABEL_38;
    }

    uint64_t v9 = 0LL;
LABEL_40:
    v48 = 0LL;
    goto LABEL_41;
  }

  id v10 = v8;
  int v11 = (objc_class *)objc_opt_class();
  if (_ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsHashType", v11)
    && (id v12 = (objc_class *)objc_opt_class(),
        _ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsHashesArray", v12))
    && (unint64_t v13 = (objc_class *)objc_opt_class(),
        _ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsHashedChunkSize", v13))
    && (id v14 = (objc_class *)objc_opt_class(),
        _ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsDenyInvalidSymlinks", v14))
    && (id v15 = (objc_class *)objc_opt_class(),
        _ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsPerformCachedWrites", v15))
    && (unint64_t v16 = 0x189603000uLL,
        uint64_t v17 = (objc_class *)objc_opt_class(),
        _ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsQuarantineInfo", v17))
    && (unint64_t v18 = (objc_class *)objc_opt_class(),
        (_ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsOwnerUserID", v18) & 1) != 0))
  {
    uint64_t v19 = (objc_class *)objc_opt_class();
    char v20 = _ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsOwnerGroupID", v19);

    if ((v20 & 1) != 0)
    {
      uint64_t v21 = objc_msgSend(v7, "SZ_stringByDeletingTrailingSlashes");
      uint64_t v22 = (void *)*((void *)v9 + 11);
      *((void *)v9 + 11) = v21;

      uint64_t v23 = (void *)*((void *)v9 + 49);
      *((void *)v9 + 49) = 0LL;

      *((void *)v9 + 15) = 30LL;
      unint64_t v24 = calloc(1uLL, 0x1EuLL);
      *((void *)v9 + 47) = v24;
      if (!v24)
      {
        SZGetLoggingHandle();
        uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( &dword_1870CA000,  v50,  OS_LOG_TYPE_ERROR,  "Could not allocate memory for local file record",  buf,  2u);
        }

        v52 = (void *)*MEMORY[0x189607688];
        uint64_t v53 = @"Could not allocate memory for local file record";
        uint64_t v54 = 879LL;
        uint64_t v55 = 12LL;
        goto LABEL_54;
      }

      uint64_t v25 = objc_opt_new();
      unint64_t v26 = (void *)*((void *)v9 + 45);
      *((void *)v9 + 45) = v25;

      uint64_t v27 = objc_opt_new();
      uint64_t v28 = (void *)*((void *)v9 + 46);
      *((void *)v9 + 46) = v27;

      [v10 objectForKey:@"SZExtractorOptionsHashedChunkSize"];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *((void *)v9 + 7) = [v29 unsignedLongLongValue];

      uint64_t v30 = [v10 objectForKey:@"SZExtractorOptionsHashesArray"];
      v31 = (void *)*((void *)v9 + 12);
      *((void *)v9 + 12) = v30;

      if ((unint64_t)[*((id *)v9 + 12) count] >= 2 && !*((void *)v9 + 7))
      {
        SZGetLoggingHandle();
        v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( &dword_1870CA000,  v57,  OS_LOG_TYPE_ERROR,  "Ambiguous chunk size (hashes > 1 but chunkSize == 0)",  buf,  2u);
        }

        v52 = (void *)*MEMORY[0x189607688];
        uint64_t v53 = @"Ambiguous chunk size (hashes > 1 but chunkSize == 0)";
        uint64_t v54 = 890LL;
        goto LABEL_53;
      }

      if (![*((id *)v9 + 12) count] && *((void *)v9 + 7))
      {
        SZGetLoggingHandle();
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( &dword_1870CA000,  v56,  OS_LOG_TYPE_ERROR,  "Hash chunk size given as > 0, but no hashes",  buf,  2u);
        }

        v52 = (void *)*MEMORY[0x189607688];
        uint64_t v53 = @"Hash chunk size given as > 0, but no hashes";
        uint64_t v54 = 895LL;
LABEL_53:
        uint64_t v55 = 22LL;
LABEL_54:
        _CreateError( (uint64_t)"-[StreamingUnzipState initWithPath:options:error:]",  v54,  v52,  v55,  0LL,  0LL,  v53,  v51,  v217);
        id v43 = (id)objc_claimAutoreleasedReturnValue();
        v58 = 0LL;
        id v59 = 0LL;
LABEL_70:
        [v59 finishDecoding];
        if (v43)
        {
          if (a4) {
            *a4 = v43;
          }

          uint64_t v9 = 0LL;
        }

        uint64_t v9 = v9;

        v48 = v9;
        goto LABEL_41;
      }

      [v10 objectForKey:@"SZExtractorOptionsDenyInvalidSymlinks"];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v9[453] = [v32 BOOLValue];

      [v10 objectForKey:@"SZExtractorOptionsPerformCachedWrites"];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v9[454] = [v33 BOOLValue];

      if (v9[454])
      {
        SZGetLoggingHandle();
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v267 = v7;
          _os_log_impl( &dword_1870CA000,  v34,  OS_LOG_TYPE_DEFAULT,  "Performing cached writes to extraction under %@",  buf,  0xCu);
        }
      }

      id v258 = 0LL;
      FetchGroupIDs(&v258);
      int v35 = (void *)objc_claimAutoreleasedReturnValue();
      id v233 = v258;
      if (!v35)
      {
        SZGetLoggingHandle();
        char v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v267 = v233;
          _os_log_impl( &dword_1870CA000,  v36,  OS_LOG_TYPE_DEFAULT,  "Failed to fetch current group access list, falling back to always calling chown: %@",  buf,  0xCu);
        }

        id v233 = 0LL;
        int v35 = 0LL;
        unint64_t v16 = 0x189603000LL;
      }

      v229 = v35;
      objc_storeStrong((id *)v9 + 57, v35);
      [v10 objectForKeyedSubscript:@"SZExtractorOptionsOwnerUserID"];
      id v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        if (getuid())
        {
          SZGetLoggingHandle();
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            uid_t v39 = getuid();
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v267 = v39;
            _os_log_impl( &dword_1870CA000,  v38,  OS_LOG_TYPE_DEFAULT,  "Use of SZExtractorOptionsOwnerUserID requires the caller to be running as root, but it was running as uid %d; ignoring.",
              buf,
              8u);
          }
        }

        else
        {
          uint64_t v60 = objc_msgSend( objc_alloc(MEMORY[0x189607968]),  "initWithUnsignedInt:",  objc_msgSend(v37, "unsignedIntValue"));
          v38 = (os_log_s *)*((void *)v9 + 13);
          *((void *)v9 + 13) = v60;
        }

        unint64_t v16 = 0x189603000LL;
      }

      [v10 objectForKeyedSubscript:@"SZExtractorOptionsOwnerGroupID"];
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (v61)
      {
        id v62 = objc_alloc(MEMORY[0x189607968]);
        uint64_t v63 = [v61 unsignedIntValue];
        id v64 = v62;
        unint64_t v16 = 0x189603000uLL;
        uint64_t v65 = [v64 initWithUnsignedInt:v63];
        id v66 = (void *)*((void *)v9 + 14);
        *((void *)v9 + 14) = v65;
      }

      [v10 objectForKey:@"SZExtractorOptionsHashType"];
      id v67 = (id)objc_claimAutoreleasedReturnValue();
      v68 = v67;
      __errnum = (unsigned int *)(v9 + 128);
      if (!v67 || ([v67 isEqualToString:@"SZExtractorHashTypeMD5"] & 1) != 0) {
        goto LABEL_61;
      }
      if ([v68 isEqualToString:@"SZExtractorHashTypeSHA1"])
      {
        int v69 = 1;
      }

      else if ([v68 isEqualToString:@"SZExtractorHashTypeSHA224"])
      {
        int v69 = 4;
      }

      else if ([v68 isEqualToString:@"SZExtractorHashTypeSHA256"])
      {
        int v69 = 5;
      }

      else if ([v68 isEqualToString:@"SZExtractorHashTypeSHA384"])
      {
        int v69 = 6;
      }

      else
      {
        if (([v68 isEqualToString:@"SZExtractorHashTypeSHA512"] & 1) == 0)
        {
          SZGetLoggingHandle();
          v138 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v267 = v68;
            _os_log_error_impl( &dword_1870CA000,  v138,  OS_LOG_TYPE_ERROR,  "Unsupported hash type: %@. Defaulting to MD5",  buf,  0xCu);
          }

LABEL_61:
          int v69 = 0;
          goto LABEL_62;
        }

        int v69 = 7;
      }

@end