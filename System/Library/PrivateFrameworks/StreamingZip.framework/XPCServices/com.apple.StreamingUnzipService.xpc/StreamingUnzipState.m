@interface StreamingUnzipState
+ (id)unzipStateWithPath:(id)a3 options:(id)a4 error:(id *)a5;
- ($3BE01BB4ACEBA336A60D57AE9133694B)dataDescriptor;
- ($D199E5C2C3D9BBBBA45D19FC310E2D7B)cmpState;
- ($E12B09C6DA44079ED8E00E43666982BA)hashContext;
- ($FA057BA13E3E0707CF88FF8174230D18)currentLFRecord;
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
  -[StreamingUnzipState dealloc](&v5, "dealloc");
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
  self->_thisStageBytesComplete = 0LL;
  objc_super v5 = sub_100004680();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    unint64_t streamState = self->_streamState;
    if (streamState > 8) {
      v18 = @"Unknown";
    }
    else {
      v18 = off_100028B70[streamState];
    }
    if (v3 > 8) {
      v19 = @"Unknown";
    }
    else {
      v19 = off_100028B70[v3];
    }
    int v20 = 138412546;
    v21 = v18;
    __int16 v22 = 2112;
    v23 = v19;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Updating stream state from %@ to %@",  (uint8_t *)&v20,  0x16u);
  }

  switch(v3)
  {
    case 0u:
      int v7 = self->_streamState;
      if (v7 != 1 && v7 != 4) {
        __assert_rtn( "-[StreamingUnzipState setStreamState:]",  "StreamingUnzipState.m",  208,  "kStreamStateCompleteLFData == _streamState || kStreamStateIncompleteLFRecord == _streamState");
      }
      self->_currentCRC32 = 0LL;
      self->_uncompressedBytesOutput = 0LL;
      fileWriter = self->_fileWriter;
      if (fileWriter)
      {
        -[StreamingFileWriter closeCurrentOutputFD](fileWriter, "closeCurrentOutputFD");
        v9 = self->_fileWriter;
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
      v12 = self->_fileWriter;
      if (v12)
      {
        -[StreamingFileWriter closeCurrentOutputFD](v12, "closeCurrentOutputFD");
        v13 = self->_fileWriter;
        self->_fileWriter = 0LL;
      }

- (void)clearSavedState
{
  if (!stat(-[NSString fileSystemRepresentation](self->_unzipPath, "fileSystemRepresentation"), &v5))
  {
    unzipPath = self->_unzipPath;
    if ((v5.st_mode & 0xF000) == 0x4000)
    {
      id v4 = objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( unzipPath, "stringByAppendingPathComponent:", @"com.apple.StreamingUnzipResumptionData"));
      unlink((const char *)[v4 fileSystemRepresentation]);
    }

    else
    {
      removexattr( -[NSString fileSystemRepresentation](unzipPath, "fileSystemRepresentation"),  "com.apple.StreamingPassthroughResumptionData",  1);
    }
  }

- (id)serializeState
{
  if (!self->_currentOffset) {
    return 0LL;
  }
  fileWriter = self->_fileWriter;
  if (fileWriter)
  {
    id v78 = 0LL;
    unsigned int v5 = -[StreamingFileWriter suspendWithError:](fileWriter, "suspendWithError:", &v78);
    id v6 = v78;
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
      v8 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
      -[NSKeyedArchiver setOutputFormat:](v8, "setOutputFormat:", 200LL);
      -[NSKeyedArchiver encodeInt:forKey:](v8, "encodeInt:forKey:", 8LL, @"SerializationVersion");
      -[NSKeyedArchiver encodeBytes:length:forKey:]( v8,  "encodeBytes:length:forKey:",  &self->_hashContext.context,  qword_10001DB48[self->_hashContext.hashType],  @"HashContext");
      v9 = (NSData *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v8, "encodedData"));

      if (!v9)
      {
LABEL_9:
        v10 = sub_100004680();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          unzipPath = self->_unzipPath;
          *(_DWORD *)buf = 138412290;
          v90 = (const char *)unzipPath;
          _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to create archive for passthrough EA on path %@",  buf,  0xCu);
        }

        v12 = self->_unzipPath;
        NSErrorUserInfoKey v95 = NSFilePathErrorKey;
        v96 = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v96,  &v95,  1LL));
        id v15 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState serializeState]",  362LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  v13,  @"Failed to create archive for passthrough EA on path %@",  v14,  (uint64_t)self->_unzipPath);
LABEL_38:
        v2 = (void *)objc_claimAutoreleasedReturnValue(v15);

LABEL_53:
        return v2;
      }
    }

    else
    {
      v9 = objc_opt_new(&OBJC_CLASS___NSData);
      if (!v9) {
        goto LABEL_9;
      }
    }

    v47 = -[NSString fileSystemRepresentation](self->_unzipPath, "fileSystemRepresentation");
    v48 = v9;
    if (setxattr( v47,  "com.apple.StreamingPassthroughResumptionData",  -[NSData bytes](v48, "bytes"),  -[NSData length](v48, "length"),  0,  1))
    {
      uint64_t v49 = *__error();
      v50 = sub_100004680();
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v69 = self->_unzipPath;
        v70 = strerror(v49);
        *(_DWORD *)buf = 136315650;
        v90 = "com.apple.StreamingPassthroughResumptionData";
        __int16 v91 = 2112;
        unint64_t v92 = (unint64_t)v69;
        __int16 v93 = 2080;
        v94 = v70;
        _os_log_error_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "Failed to set passthrough EA %s on path %@: %s",  buf,  0x20u);
      }

      v52 = self->_unzipPath;
      NSErrorUserInfoKey v87 = NSFilePathErrorKey;
      v88 = v52;
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v88,  &v87,  1LL));
      strerror(v49);
      id v15 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState serializeState]",  367LL,  NSPOSIXErrorDomain,  v49,  0LL,  v13,  @"Failed to set passthrough EA %s on path %@: %s",  v53,  (uint64_t)"com.apple.StreamingPassthroughResumptionData");
      goto LABEL_38;
    }

    return 0LL;
  }

  v9 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  -[NSData setOutputFormat:](v9, "setOutputFormat:", 200LL);
  -[NSData encodeInt:forKey:](v9, "encodeInt:forKey:", 8LL, @"SerializationVersion");
  v16 = self->_hashes;
  if (v16 && -[NSArray count](v16, "count")) {
    -[NSData encodeBytes:length:forKey:]( v9,  "encodeBytes:length:forKey:",  &self->_hashContext.context,  qword_10001DB48[self->_hashContext.hashType],  @"HashContext");
  }
  -[NSData encodeObject:forKey:](v9, "encodeObject:forKey:", self->_streamInfoDict, @"StreamInfoDict");
  -[NSData encodeObject:forKey:](v9, "encodeObject:forKey:", self->_lastChunkPartialHash, @"LastChunkPartialHash");
  -[NSData encodeObject:forKey:](v9, "encodeObject:forKey:", self->_unsureData, @"UnsureData");
  -[NSData encodeObject:forKey:](v9, "encodeObject:forKey:", self->_inMemoryFileData, @"InMemoryFileData");
  currentLFRecord = self->_currentLFRecord;
  if (currentLFRecord)
  {
    else {
      unint64_t currentLFRecordAllocationSize = HIWORD(currentLFRecord->var7.var0)
    }
                                    + (unint64_t)currentLFRecord->var8.var0
                                    + 30;
    -[NSData encodeBytes:length:forKey:]( v9,  "encodeBytes:length:forKey:",  currentLFRecord,  currentLFRecordAllocationSize,  @"LocalFileRecord");
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_thisStageBytesComplete));
  -[NSData encodeObject:forKey:](v9, "encodeObject:forKey:", v19, @"StageBytesComplete");

  int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_currentOffset));
  -[NSData encodeObject:forKey:](v9, "encodeObject:forKey:", v20, @"CurrentOffset");

  v21 = self->_fileWriter;
  if (v21)
  {
    id v77 = 0LL;
    id v22 = -[StreamingFileWriter currentOffsetWithError:](v21, "currentOffsetWithError:", &v77);
    id v23 = v77;
    v24 = v23;
    if (v22 == (id)-1LL)
    {
      v54 = sub_100004680();
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_ERROR,  "Unable to get current output offset from current output file",  buf,  2u);
      }

      NSErrorUserInfoKey v85 = NSFilePathErrorKey;
      v56 = sub_100010E30(self->_currentLFRecord->var0);
      v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
      v86 = v57;
      v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v86,  &v85,  1LL));
      v60 = @"Unable to get current output offset from current output file";
      uint64_t v61 = 395LL;
    }

    else
    {
      if (v22 == (id)self->_uncompressedBytesOutput)
      {

        goto LABEL_24;
      }

      v65 = sub_100004680();
      v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        unint64_t uncompressedBytesOutput = self->_uncompressedBytesOutput;
        *(_DWORD *)buf = 134218240;
        v90 = (const char *)uncompressedBytesOutput;
        __int16 v91 = 2048;
        unint64_t v92 = (unint64_t)v22;
        _os_log_error_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "Mismatch between uncompressed bytes output (%llu) and output file offset (%lld)",  buf,  0x16u);
      }

      NSErrorUserInfoKey v83 = NSFilePathErrorKey;
      v67 = sub_100010E30(self->_currentLFRecord->var0);
      v57 = (void *)objc_claimAutoreleasedReturnValue(v67);
      v84 = v57;
      v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v84,  &v83,  1LL));
      unint64_t v75 = self->_uncompressedBytesOutput;
      v60 = @"Mismatch between uncompressed bytes output (%llu) and output file offset (%lld)";
      uint64_t v61 = 397LL;
    }

    id v68 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState serializeState]",  v61,  @"SZExtractorErrorDomain",  1LL,  v24,  v59,  v60,  v58,  v75);
    v2 = (void *)objc_claimAutoreleasedReturnValue(v68);

    goto LABEL_53;
  }

- (id)checkLastChunkPartialHash
{
  uint64_t v3 = qword_10001DB88[self->_hashContext.hashType];
  __int128 v4 = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[11];
  v23[10] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[9];
  v23[11] = v4;
  v23[12] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[13];
  CC_LONG64 v24 = self->_hashContext.context.sha384.wbuf[15];
  __int128 v5 = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[3];
  v23[6] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[1];
  v23[7] = v5;
  __int128 v6 = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[7];
  v23[8] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[5];
  v23[9] = v6;
  __int128 v7 = *(_OWORD *)&self->_hashContext.context.sha512.hash[3];
  v23[2] = *(_OWORD *)&self->_hashContext.context.sha512.hash[1];
  v23[3] = v7;
  __int128 v8 = *(_OWORD *)&self->_hashContext.context.sha512.hash[7];
  v23[4] = *(_OWORD *)&self->_hashContext.context.sha512.hash[5];
  v23[5] = v8;
  __int128 v9 = *(_OWORD *)&self->_hashContext.context.sha512.count[1];
  v23[0] = *(_OWORD *)&self->_hashContext.hashType;
  v23[1] = v9;
  sub_100004A48((unsigned __int8 *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL), (uint64_t)v23);
  id v10 = sub_100011498((unsigned __int8 *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL), v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = [v11 caseInsensitiveCompare:self->_lastChunkPartialHash];
  v13 = sub_100004680();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      lastChunkPartialHash = self->_lastChunkPartialHash;
      *(_DWORD *)buf = 138412546;
      v28 = lastChunkPartialHash;
      __int16 v29 = 2112;
      v30 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Hash mismatch for last partial chunk: expected %@, got %@",  buf,  0x16u);
    }

    v25 = @"SZExtractorFileOffsetErrorKey";
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_currentOffset));
    v26 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    id v19 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState checkLastChunkPartialHash]",  491LL,  @"SZExtractorErrorDomain",  2LL,  0LL,  v17,  @"Hash mismatch for last partial chunk: expected %@, got %@",  v18,  (uint64_t)self->_lastChunkPartialHash);
    int v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v28 = (NSString *)v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Verified that last chunk partial hash matches: %@",  buf,  0xCu);
    }

    int v20 = 0LL;
    self->_bytesHashedInChunk = 0LL;
  }

  return v20;
}

- (id)updateHashFromOffset:(unint64_t)a3 withBytes:(const void *)a4 length:(unint64_t)a5 onlyFinishCurrentChunk:(BOOL)a6
{
  hashes = self->_hashes;
  if (hashes)
  {
    hashes = -[NSArray count](hashes, "count");
    if (hashes)
    {
      if (self->_hashedChunkSize || -[NSArray count](self->_hashes, "count") < 2)
      {
        if (a5)
        {
          while (1)
          {
            unint64_t hashedChunkSize = self->_hashedChunkSize;
            unint64_t v17 = a5;
            if (hashedChunkSize
              && ((unint64_t bytesHashedInChunk = self->_bytesHashedInChunk, a5 >= hashedChunkSize - bytesHashedInChunk)
                ? (unint64_t v17 = hashedChunkSize - bytesHashedInChunk)
                : (unint64_t v17 = a5),
                  !v17))
            {
              self->_unint64_t bytesHashedInChunk = bytesHashedInChunk;
            }

            else
            {
              unint64_t v26 = a3;
              unint64_t v19 = v17;
              do
              {
                if (v19 >= 0xFFFFFFFF) {
                  uint64_t v20 = 0xFFFFFFFFLL;
                }
                else {
                  uint64_t v20 = v19;
                }
                switch(self->_hashContext.hashType)
                {
                  case 0:
                    CC_MD5_Update(&self->_hashContext.context.md5, a4, v20);
                    break;
                  case 1:
                    CC_SHA1_Update((CC_SHA1_CTX *)&self->_hashContext.context, a4, v20);
                    break;
                  case 4:
                    CC_SHA224_Update((CC_SHA256_CTX *)&self->_hashContext.context, a4, v20);
                    break;
                  case 5:
                    CC_SHA256_Update((CC_SHA256_CTX *)&self->_hashContext.context, a4, v20);
                    break;
                  case 6:
                    CC_SHA384_Update((CC_SHA512_CTX *)&self->_hashContext.context, a4, v20);
                    break;
                  case 7:
                    CC_SHA512_Update((CC_SHA512_CTX *)&self->_hashContext.context, a4, v20);
                    break;
                  default:
                    break;
                }

                v19 -= v20;
              }

              while (v19);
              unint64_t hashedChunkSize = self->_hashedChunkSize;
              unint64_t bytesHashedInChunk = self->_bytesHashedInChunk + v17;
              self->_unint64_t bytesHashedInChunk = bytesHashedInChunk;
              if (!hashedChunkSize) {
                break;
              }
              a4 = (char *)a4 + v17;
              a5 -= v17;
              a3 = v17 + v26;
            }

            if (bytesHashedInChunk > hashedChunkSize) {
              __assert_rtn( "-[StreamingUnzipState updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:]",  "StreamingUnzipState.m",  534,  "_bytesHashedInChunk <= _hashedChunkSize");
            }
            if (bytesHashedInChunk == hashedChunkSize)
            {
              id v21 = sub_100015F8C((uint64_t)self, a3 - hashedChunkSize);
              hashes = (NSArray *)objc_claimAutoreleasedReturnValue(v21);
              if (hashes) {
                return hashes;
              }
              sub_1000049B0((uint64_t)&self->_hashContext, self->_hashContext.hashType);
              hashes = 0LL;
              self->_unint64_t bytesHashedInChunk = 0LL;
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
        v11 = sub_100004680();
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          unint64_t v23 = self->_hashedChunkSize;
          NSUInteger v24 = -[NSArray count](self->_hashes, "count");
          *(_DWORD *)buf = 134218240;
          unint64_t v28 = v23;
          __int16 v29 = 2048;
          NSUInteger v30 = v24;
          _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Ambiguous or missing hash chunk size: chunk size is %llu but have %lu hashes",  buf,  0x16u);
        }

        unint64_t v13 = self->_hashedChunkSize;
        -[NSArray count](self->_hashes, "count");
        id v15 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:]",  508LL,  @"SZExtractorErrorDomain",  4LL,  0LL,  0LL,  @"Ambiguous or missing hash chunk size: chunk size is %llu but have %lu hashes",  v14,  v13);
        hashes = (NSArray *)objc_claimAutoreleasedReturnValue(v15);
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
    __int128 v5 = sub_100004680();
    __int128 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Finishing an incomplete stream! This stream will not be resumable.",  (uint8_t *)&v11,  2u);
    }

    id v8 = sub_100007A7C( (uint64_t)"-[StreamingUnzipState finishStream]",  568LL,  @"SZExtractorErrorDomain",  3LL,  0LL,  0LL,  @"Finishing an incomplete stream! This stream will not be resumable.",  v7,  v11);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    if (!self->_bytesHashedInChunk)
    {
      __int128 v9 = 0LL;
      goto LABEL_8;
    }

    id v3 = sub_100015F8C((uint64_t)self, self->_currentOffset);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  }

  __int128 v9 = (void *)v4;
LABEL_8:
  -[StreamingUnzipState setStreamState:](self, "setStreamState:", 7LL);
  return v9;
}

- (BOOL)resolveOwnershipWithExtraField:(id *)a3 outUID:(unsigned int *)a4 outGID:(unsigned int *)a5
{
  if (a3 && a3->var1.var0 >= 0xCu)
  {
    unsigned int var0 = a3->var4.var0;
    uint64_t v9 = a3->var5.var0;
    int v10 = 1;
  }

  else
  {
    int v10 = 0;
    uint64_t v9 = 0xFFFFFFFFLL;
    unsigned int var0 = -1;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingUnzipState overrideUID](self, "overrideUID"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[StreamingUnzipState overrideGID](self, "overrideGID"));
  unint64_t v13 = (void *)v12;
  if (v11)
  {
    unsigned int var0 = [v11 unsignedIntValue];
    if (!v13) {
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v9 = (uint64_t)[v13 unsignedIntValue];
    goto LABEL_10;
  }

  if (v12) {
    goto LABEL_9;
  }
  if (!v10) {
    goto LABEL_14;
  }
LABEL_10:
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[StreamingUnzipState cachedGIDs](self, "cachedGIDs"));
  uid_t v15 = getuid();
  if (v15)
  {
    if (var0 != -1 && v15 != var0) {
      goto LABEL_13;
    }
    if ((_DWORD)v9 == -1)
    {
      uint64_t v18 = 0LL;
    }

    else
    {
      uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v9));
      uint64_t v18 = (void *)v17;
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

- ($E12B09C6DA44079ED8E00E43666982BA)hashContext
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
  *(_OWORD *)&retstr->unsigned int var0 = *(_OWORD *)&self->var1.var5.wbuf[5];
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

- ($FA057BA13E3E0707CF88FF8174230D18)currentLFRecord
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

- ($3BE01BB4ACEBA336A60D57AE9133694B)dataDescriptor
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

+ (id)unzipStateWithPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = sub_100016470(objc_alloc(&OBJC_CLASS___StreamingUnzipState), v7, v8, 0LL);
  if (v9)
  {
    id v10 = 0LL;
  }

  else
  {
    id v15 = 0LL;
    int v11 = sub_100018718(v7, &v15);
    id v10 = v15;
    if (v11)
    {
      id v14 = v10;
      uint64_t v9 = sub_100016470(objc_alloc(&OBJC_CLASS___StreamingUnzipState), v7, v8, &v14);
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

@end