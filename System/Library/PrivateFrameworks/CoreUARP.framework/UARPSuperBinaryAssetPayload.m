@interface UARPSuperBinaryAssetPayload
- (BOOL)allowCompressionHeaders;
- (BOOL)appendCompressedPayloadToFile:(id)a3 error:(id *)a4;
- (BOOL)appendPayloadToFile:(id)a3 bytesWritten:(unint64_t *)a4 error:(id *)a5;
- (BOOL)compressPayloadURLToFileHandle:(id)a3 error:(id *)a4;
- (BOOL)expandDictionaryWithPayloadsFolder:(id)a3 metaDataTable:(id)a4 error:(id *)a5;
- (BOOL)expandPayloadToURL:(id)a3 payloadFilename:(id)a4 superbinary:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 error:(id *)a8;
- (BOOL)expandPayloadToURL:(id)a3 superbinary:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 error:(id *)a7;
- (BOOL)isValid;
- (BOOL)needsCompression;
- (BOOL)parseFromPlistPayloadMetaDataTLVs:(id)a3 payloadsURL:(id)a4 error:(id *)a5;
- (BOOL)parseFromPlistVersion:(id *)a3;
- (BOOL)prepareUarpVersion:(UARPVersion *)a3;
- (BOOL)setPayloadToContentsOfFile:(id)a3 friendlyName:(id)a4 error:(id *)a5;
- (BOOL)setPayloadToContentsOfURL:(id)a3 friendlyName:(id)a4;
- (BOOL)setPayloadToData:(id)a3;
- (BOOL)updateFormatVersion:(unint64_t)a3;
- (BOOL)writePayloadData:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (NSArray)tlvs;
- (NSData)compressionHeaders;
- (NSData)metaData;
- (NSData)payload;
- (UARPAssetTag)payloadTag;
- (UARPSuperBinaryAssetPayload)init;
- (UARPSuperBinaryAssetPayload)initWithDictionary:(id)a3;
- (UARPSuperBinaryAssetPayload)initWithPayloadHeader:(UARPPayloadHeader *)a3;
- (UARPSuperBinaryAssetPayload)initWithPayloadTag:(id)a3 assetVersion:(id)a4;
- (UARPSuperBinaryAssetPayload)initWithPayloadTag:(id)a3 assetVersion:(id)a4 writable:(BOOL)a5;
- (UARPSuperBinaryAssetPayload)initWithPayloadTag:(id)a3 majorVersion:(unint64_t)a4 minorVersion:(unint64_t)a5 releaseVersion:(unint64_t)a6 buildVersion:(unint64_t)a7;
- (UARPSuperBinaryAssetPayload)initWithTag:(id)a3 majorVersion:(id)a4 minorVersion:(id)a5 releaseVersion:(id)a6 buildVersion:(id)a7;
- (_NSRange)rangeMetadata;
- (_NSRange)rangePayload;
- (id)compressPayloadChunk:(id)a3 offset:(unsigned int)a4 error:(id *)a5;
- (id)description;
- (id)hashMetaData;
- (id)hashMetaDataWithAlgorithm:(int)a3 error:(id *)a4;
- (id)hashPayloadWithAlgorithm:(int)a3 error:(id *)a4;
- (id)prepareData;
- (id)prepareMetaData;
- (unint64_t)compressionHeaderIndex;
- (unint64_t)formatVersion;
- (unint64_t)preparePackedTag;
- (unint64_t)preparedDataLength;
- (unint64_t)unpreparedDataLength;
- (void)addMetaDataTLV:(id)a3;
- (void)addMetaDataTLVs:(id)a3;
- (void)prepareData;
- (void)processBVERVersionString:(id)a3;
- (void)processVersionString:(id)a3;
- (void)setSuperBinaryURL:(id)a3;
@end

@implementation UARPSuperBinaryAssetPayload

- (UARPSuperBinaryAssetPayload)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryAssetPayload;
  v2 = -[UARPSuperBinaryAssetPayload init](&v12, sel_init);
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.accessoryupdater.uarp", "superbinarypayload");
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
    v6 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v5;

    id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
    v8 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v7;

    *(void *)(v2 + 92) = 4096LL;
    *((_DWORD *)v2 + 42) = -1;
    id v9 = objc_alloc_init(MEMORY[0x189603FB8]);
    v10 = (void *)*((void *)v2 + 20);
    *((void *)v2 + 20) = v9;

    *((void *)v2 + 25) = 3LL;
    v2[172] = 1;
  }

  return (UARPSuperBinaryAssetPayload *)v2;
}

- (UARPSuperBinaryAssetPayload)initWithPayloadTag:(id)a3 assetVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = -[UARPSuperBinaryAssetPayload init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_payloadTag, a3);
    uint64_t v11 = objc_msgSend( NSString,  "stringWithFormat:",  @"%c%c%c%c",  -[UARPAssetTag char1](v10->_payloadTag, "char1"),  -[UARPAssetTag char2](v10->_payloadTag, "char2"),  -[UARPAssetTag char3](v10->_payloadTag, "char3"),  -[UARPAssetTag char4](v10->_payloadTag, "char4"));
    tag = v10->_tag;
    v10->_tag = (NSString *)v11;

    objc_storeStrong((id *)&v10->_assetVersion, a4);
  }

  return v10;
}

- (UARPSuperBinaryAssetPayload)initWithPayloadTag:(id)a3 assetVersion:(id)a4 writable:(BOOL)a5
{
  id v5 = -[UARPSuperBinaryAssetPayload initWithPayloadTag:assetVersion:]( self,  "initWithPayloadTag:assetVersion:",  a3,  a4,  a5);
  v6 = v5;
  if (v5)
  {
    v5->_isWritable = 1;
    uint64_t v7 = UARPUtilsBuildURLForTemporaryFile();
    url = v6->_url;
    v6->_url = (NSURL *)v7;
  }

  return v6;
}

- (UARPSuperBinaryAssetPayload)initWithPayloadTag:(id)a3 majorVersion:(unint64_t)a4 minorVersion:(unint64_t)a5 releaseVersion:(unint64_t)a6 buildVersion:(unint64_t)a7
{
  id v11 = a3;
  objc_super v12 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( objc_alloc(&OBJC_CLASS___UARPAssetVersion),  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  a4,  a4,  a6,  a7);
  v13 = -[UARPSuperBinaryAssetPayload initWithPayloadTag:assetVersion:]( self,  "initWithPayloadTag:assetVersion:",  v11,  v12);

  return v13;
}

- (UARPSuperBinaryAssetPayload)initWithTag:(id)a3 majorVersion:(id)a4 minorVersion:(id)a5 releaseVersion:(id)a6 buildVersion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if ((unint64_t)[v11 length] >= 4)
  {
    v16 = (char *)[v11 UTF8String];
    v17 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v16,  v16[1],  v16[2],  v16[3]);
    v18 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( [UARPAssetVersion alloc],  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  [v12 unsignedIntegerValue],  objc_msgSend(v12, "unsignedIntegerValue"),  objc_msgSend(v13, "unsignedIntegerValue"),  objc_msgSend(v14, "unsignedIntegerValue"));
    self =  -[UARPSuperBinaryAssetPayload initWithPayloadTag:assetVersion:]( self,  "initWithPayloadTag:assetVersion:",  v17,  v18);

    v15 = self;
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

- (UARPSuperBinaryAssetPayload)initWithPayloadHeader:(UARPPayloadHeader *)a3
{
  v4 = -[UARPSuperBinaryAssetPayload init](self, "init");
  id v5 = v4;
  if (v4)
  {
    __int128 v6 = *(_OWORD *)&a3->payloadHeaderLength;
    __int128 v7 = *(_OWORD *)&a3->payloadVersion.release;
    *(void *)&v4->_payloadHeader.payloadOffset = *(void *)&a3->payloadOffset;
    *(_OWORD *)&v4->_payloadHeader.payloadVersion.release = v7;
    *(_OWORD *)&v4->_payloadHeader.payloadHeaderLength = v6;
    uarpPayloadTagUnpack(v4->_payloadHeader.payloadTag, v13);
    uint64_t v8 = objc_msgSend( NSString,  "stringWithFormat:",  @"%c%c%c%c",  v13[0],  v13[1],  v13[2],  v13[3]);
    tag = v5->_tag;
    v5->_tag = (NSString *)v8;

    v5->_uarpVersion = v5->_payloadHeader.payloadVersion;
    v10 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( objc_alloc(&OBJC_CLASS___UARPAssetVersion),  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  v5->_uarpVersion.major,  v5->_uarpVersion.minor,  v5->_uarpVersion.release,  v5->_uarpVersion.build);
    assetVersion = v5->_assetVersion;
    v5->_assetVersion = v10;
  }

  return v5;
}

- (BOOL)updateFormatVersion:(unint64_t)a3
{
  if (a3 <= 3) {
    self->_formatVersion = a3;
  }
  return a3 < 4;
}

- (UARPAssetTag)payloadTag
{
  tag = self->_tag;
  if (tag)
  {
    if (-[NSString length](tag, "length") == 4)
    {
      payloadTag = self->_payloadTag;
      if (!payloadTag)
      {
        id v5 = -[NSString UTF8String](self->_tag, "UTF8String");
        __int128 v6 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v5,  v5[1],  v5[2],  v5[3]);
        __int128 v7 = self->_payloadTag;
        self->_payloadTag = v6;

        payloadTag = self->_payloadTag;
      }

      tag = payloadTag;
    }

    else
    {
      tag = 0LL;
    }
  }

  return (UARPAssetTag *)tag;
}

- (NSArray)tlvs
{
  return (NSArray *)[MEMORY[0x189603F18] arrayWithArray:self->_tlvs];
}

- (NSData)metaData
{
  return (NSData *)[MEMORY[0x189603F48] dataWithData:self->_metaData];
}

- (void)addMetaDataTLV:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 type] == 3166200577
      || [v5 type] == 3166200578
      || [v5 type] == 3166200576
      || [v5 type] == 3166200579)
    {
      composeTLVs = self->_composeTLVs;
LABEL_7:
      -[NSMutableArray addObject:](composeTLVs, "addObject:", v5);
      goto LABEL_10;
    }

    if ([v5 type] == 3166200581)
    {
      -[UARPSuperBinaryAssetPayload processVersionString:](self, "processVersionString:", v5);
      goto LABEL_10;
    }

    if ([v5 type] == 3166200582)
    {
      -[UARPSuperBinaryAssetPayload processBVERVersionString:](self, "processBVERVersionString:", v5);
      goto LABEL_10;
    }

    if ([v5 type] == 3436347660)
    {
      [v5 valueAsNumber];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_compression = [v14 unsignedLongValue];
    }

    else if ([v5 type] == 3436347659)
    {
      [v5 valueAsNumber];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_blockSize = [v14 unsignedShortValue];
    }

    else if ([v5 type] == 3436347663)
    {
      [v5 valueAsNumber];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_compressionHeaderIndex = [v14 unsignedLongValue];
    }

    else
    {
      if ([v5 type] != 3436347674)
      {
LABEL_24:
        composeTLVs = self->_tlvs;
        goto LABEL_7;
      }

      [v5 valueAsNumber];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_allowCompressionHeaders = [v14 BOOLValue];
    }

    goto LABEL_24;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    -[UARPSuperBinaryAssetPayload addMetaDataTLV:].cold.1((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);
  }
LABEL_10:
}

- (void)addMetaDataTLVs:(id)a3
{
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_tlvs, v10);
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  3436347659LL,  self->_tlvs);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  3436347660LL,  self->_tlvs);
  __int128 v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    [v4 valueAsNumber];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_blockSize = [v8 unsignedIntValue];

    [v6 valueAsNumber];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_compression = [v9 unsignedIntValue];
  }
}

- (BOOL)setPayloadToContentsOfFile:(id)a3 friendlyName:(id)a4 error:(id *)a5
{
  BOOL v7 = (void *)MEMORY[0x189604030];
  id v8 = a4;
  [a3 stringByExpandingTildeInPath];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 fileURLWithPath:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[UARPSuperBinaryAssetPayload setPayloadToContentsOfURL:friendlyName:]( self,  "setPayloadToContentsOfURL:friendlyName:",  v10,  v8);

  return (char)self;
}

- (BOOL)setPayloadToContentsOfURL:(id)a3 friendlyName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_url, a3);
  if (v8)
  {
    uint64_t v9 = (NSString *)[v8 copy];
    friendlyName = self->_friendlyName;
    self->_friendlyName = v9;
  }

  return 1;
}

- (BOOL)setPayloadToData:(id)a3
{
  id v4 = (NSData *)[a3 copy];
  payload = self->_payload;
  self->_payload = v4;

  return 1;
}

- (id)prepareMetaData
{
  os_log_t v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x189603FB8]);
  metaData = self->_metaData;
  self->_metaData = v3;

  if (-[NSMutableArray count](self->_tlvs, "count"))
  {
    unint64_t v5 = 0LL;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_tlvs, "objectAtIndex:", v5);
      __int128 v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 generateTLV:0];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableData appendData:](self->_metaData, "appendData:", v7);

      ++v5;
    }

    while (v5 < -[NSMutableArray count](self->_tlvs, "count"));
  }

  if (self->_compression)
  {
    if (self->_url)
    {
      uint64_t v8 = -[UARPSuperBinaryAssetPayload unpreparedDataLength](self, "unpreparedDataLength");
    }

    else
    {
      payload = self->_payload;
      if (!payload)
      {
        uint64_t v10 = 0LL;
        goto LABEL_10;
      }

      uint64_t v8 = -[NSData length](payload, "length");
    }

    uint64_t v10 = v8;
LABEL_10:
    uint64_t v11 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt32:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:unsignedInt32:",  3436347673LL,  v10);
    -[UARPSuperBinaryAssetTLV generateTLV:](v11, "generateTLV:", 0LL);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableData appendData:](self->_metaData, "appendData:", v12);
  }

  return (id)[MEMORY[0x189603F48] dataWithData:self->_metaData];
}

- (id)hashMetaData
{
  return (id)[MEMORY[0x189603F48] dataWithData:self->_metaData];
}

- (id)compressPayloadChunk:(id)a3 offset:(unsigned int)a4 error:(id *)a5
{
  return a3;
}

- (BOOL)compressPayloadURLToFileHandle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (NSMutableData *)objc_alloc_init(MEMORY[0x189603FB8]);
  compressionHeaders = self->_compressionHeaders;
  self->_compressionHeaders = v7;

  [MEMORY[0x189607898] fileHandleForReadingFromURL:self->_url error:a4];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    uint64_t v10 = 0LL;
    uint64_t blockSize = self->_blockSize;
    while (1)
    {
      [v9 uarpReadDataUpToLength:blockSize error:a4];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = v12;
      if (!v12 || ![v12 length])
      {

LABEL_9:
        [v9 uarpCloseAndReturnError:a4];
        BOOL v16 = 1;
        goto LABEL_12;
      }

      uint64_t v14 = [v13 length];
      v15 = -[UARPSuperBinaryAssetPayload compressPayloadChunk:offset:error:]( self,  "compressPayloadChunk:offset:error:",  v13,  v10,  a4);
      if (([v6 uarpWriteData:v15 error:a4] & 1) == 0) {
        break;
      }
      uint64_t v10 = (v10 + v14);

      uint64_t blockSize = self->_blockSize;
      if (v14 != blockSize) {
        goto LABEL_9;
      }
    }

    [v9 uarpCloseAndReturnError:a4];
  }

  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (id)prepareData
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  os_log_t v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x189603FB8]);
  compressionHeaders = self->_compressionHeaders;
  self->_compressionHeaders = v3;

  UARPUtilsBuildURLForTemporaryFile();
  unint64_t v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
  p_compressedPayloadURL = (id *)&self->_compressedPayloadURL;
  compressedPayloadURL = self->_compressedPayloadURL;
  self->_compressedPayloadURL = v5;

  if (!self->_compressedPayloadURL)
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v8) {
      -[UARPSuperBinaryAssetPayload prepareData].cold.6(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  uint64_t v46 = 0LL;
  objc_msgSend(MEMORY[0x189607898], "fileHandleForWritingToURL:error:");
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = 0LL;
  if (v16)
  {
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    v18 = self->_tlvs;
    uint64_t v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v43;
LABEL_7:
      uint64_t v22 = 0LL;
      while (1)
      {
        if (*(void *)v43 != v21) {
          objc_enumerationMutation(v18);
        }
        if ([*(id *)(*((void *)&v42 + 1) + 8 * v22) type] == 3166200583) {
          break;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
          if (v20) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }

      [MEMORY[0x189603FC8] dictionaryWithContentsOfURL:self->_url];
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23) {
        goto LABEL_21;
      }
      id v41 = v17;
      [MEMORY[0x1896078F8] archivedDataWithRootObject:v23 requiringSecureCoding:0 error:&v41];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      id v25 = v41;

      if (!v24
        || (id v40 = 0LL,
            char v26 = [v16 uarpWriteData:v24 error:&v40],
            id v27 = v40,
            v25,
            id v25 = v27,
            (v26 & 1) == 0))
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          -[UARPSuperBinaryAssetPayload prepareData].cold.5();
        }
        id v28 = *p_compressedPayloadURL;
        id *p_compressedPayloadURL = 0LL;
      }

      goto LABEL_38;
    }

- (unint64_t)unpreparedDataLength
{
  if (!self->_url) {
    return 0LL;
  }
  [MEMORY[0x1896078A8] defaultManager];
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_url, "path");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 attributesOfItemAtPath:v4 error:0];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  unint64_t v6 = [v5 fileSize];
  return v6;
}

- (unint64_t)preparedDataLength
{
  if (!self->_compressedPayloadURL) {
    return 0LL;
  }
  [MEMORY[0x1896078A8] defaultManager];
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_compressedPayloadURL, "path");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 attributesOfItemAtPath:v4 error:0];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  unint64_t v6 = [v5 fileSize];
  return v6;
}

- (unint64_t)preparePackedTag
{
  os_log_t v3 = -[NSString UTF8String](self->_tag, "UTF8String");
  if (-[NSString length](self->_tag, "length") == 4) {
    return uarpPayloadTagPack((unsigned int *)v3);
  }
  else {
    return 0LL;
  }
}

- (BOOL)prepareUarpVersion:(UARPVersion *)a3
{
  a3->major = -[UARPAssetVersion majorVersion](self->_assetVersion, "majorVersion");
  a3->minor = -[UARPAssetVersion minorVersion](self->_assetVersion, "minorVersion");
  a3->release = -[UARPAssetVersion releaseVersion](self->_assetVersion, "releaseVersion");
  a3->build = -[UARPAssetVersion buildVersion](self->_assetVersion, "buildVersion");
  return 1;
}

- (BOOL)appendPayloadToFile:(id)a3 bytesWritten:(unint64_t *)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)appendCompressedPayloadToFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [MEMORY[0x189607898] fileHandleForReadingFromURL:self->_compressedPayloadURL error:a4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    uint64_t blockSize = self->_blockSize;
    while (1)
    {
      [v7 uarpReadDataUpToLength:blockSize error:a4];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 length];
      if (([v6 uarpWriteData:v9 error:a4] & 1) == 0) {
        break;
      }

      uint64_t blockSize = self->_blockSize;
      if (v10 != blockSize)
      {
        [v7 uarpCloseAndReturnError:a4];
        BOOL v11 = 1;
        goto LABEL_12;
      }
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      -[UARPSuperBinaryAssetPayload appendCompressedPayloadToFile:error:].cold.2();
    }
    [v7 uarpCloseAndReturnError:a4];
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryAssetPayload appendCompressedPayloadToFile:error:].cold.1();
  }

  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (id)hashPayloadWithAlgorithm:(int)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (!self->_url) {
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)&a3;
  switch(a3)
  {
    case 1:
      id v7 = (CC_SHA512_CTX *)&v16;
      uint64_t v8 = 32LL;
      break;
    case 3:
      id v7 = (CC_SHA512_CTX *)v15;
      uint64_t v8 = 64LL;
      break;
    case 2:
      id v7 = (CC_SHA512_CTX *)v15;
      uint64_t v8 = 48LL;
      break;
    default:
LABEL_14:
      uint64_t v9 = 0LL;
      return v9;
  }

  uarpPlatformDarwinHashInit(*(uint64_t *)&a3, v7);
  [MEMORY[0x189607898] fileHandleForReadingFromURL:self->_url error:a4];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    uint64_t v10 = v9;
    while (1)
    {
      [v10 uarpReadDataUpToLength:self->_blockSize error:0];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {

        goto LABEL_14;
      }

      id v12 = v11;
      uarpPlatformDarwinHashUpdate(v5, v7, (void *)[v12 bytes], objc_msgSend(v12, "length"));
      unint64_t blockSize = self->_blockSize;
      if ([v12 length] < blockSize) {
        break;
      }
    }

    [v10 uarpCloseAndReturnError:a4];

    uarpPlatformDarwinHashFinal(v5, v7, md, v8);
    [MEMORY[0x189603F48] dataWithBytes:md length:v8];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)hashMetaDataWithAlgorithm:(int)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!self->_url) {
    return 0LL;
  }
  uint64_t v4 = *(void *)&a3;
  if (a3 == 1)
  {
    id v6 = (CC_SHA512_CTX *)&v10;
    uint64_t v7 = 32LL;
    goto LABEL_9;
  }

  if (a3 == 3)
  {
    id v6 = (CC_SHA512_CTX *)v9;
    uint64_t v7 = 64LL;
    goto LABEL_9;
  }

  if (a3 != 2) {
    return 0LL;
  }
  id v6 = (CC_SHA512_CTX *)v9;
  uint64_t v7 = 48LL;
LABEL_9:
  uarpPlatformDarwinHashInit(*(uint64_t *)&a3, v6);
  uarpPlatformDarwinHashUpdate( v4,  v6,  (void *)-[NSMutableData bytes](self->_metaData, "bytes"),  -[NSMutableData length](self->_metaData, "length"));
  uarpPlatformDarwinHashFinal(v4, v6, md, v7);
  [MEMORY[0x189603F48] dataWithBytes:md length:v7];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)processVersionString:(id)a3
{
  uint64_t v4 = (void *)NSString;
  [a3 valueAsURL];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithContentsOfURL:v5 encoding:4 error:0];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = -[UARPAssetVersion initWithVersionString:]( objc_alloc(&OBJC_CLASS___UARPAssetVersion),  "initWithVersionString:",  v8);
  assetVersion = self->_assetVersion;
  self->_assetVersion = v6;
}

- (void)processBVERVersionString:(id)a3
{
  uint64_t v4 = (void *)NSString;
  [a3 valueAsURL];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithContentsOfURL:v5 encoding:4 error:0];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = -[UARPAssetVersion initWithBVERString:](objc_alloc(&OBJC_CLASS___UARPAssetVersion), "initWithBVERString:", v8);
  assetVersion = self->_assetVersion;
  self->_assetVersion = v6;
}

- (UARPSuperBinaryAssetPayload)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[UARPSuperBinaryAssetPayload init](self, "init");
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dict = v5->_dict;
    v5->_dict = (NSDictionary *)v6;
  }

  return v5;
}

- (BOOL)expandDictionaryWithPayloadsFolder:(id)a3 metaDataTable:(id)a4 error:(id *)a5
{
  id v8 = a3;
  dict = self->_dict;
  id v10 = a4;
  -[NSDictionary objectForKey:](dict, "objectForKey:", @"Payload 4CC");
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = (NSString *)[v11 copy];
  tag = self->_tag;
  self->_tag = v12;

  -[NSDictionary objectForKey:](self->_dict, "objectForKey:", @"Payload Filepath");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = (void *)[v14 copy];

  if (v15)
  {
    [MEMORY[0x189604030] fileURLWithPath:v15 relativeToURL:v8];
    char v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    self->_url = v16;
  }

  uint64_t v18 = -[NSDictionary objectForKey:](self->_dict, "objectForKey:", @"Payload Long Name");
  uint64_t v19 = (NSString *)[(id)v18 copy];
  friendlyName = self->_friendlyName;
  self->_friendlyName = v19;

  LOBYTE(v18) = -[UARPSuperBinaryAssetPayload parseFromPlistPayloadMetaDataTLVs:payloadsURL:error:]( self,  "parseFromPlistPayloadMetaDataTLVs:payloadsURL:error:",  v10,  v8,  a5);
  if ((v18 & 1) == 0)
  {
    [NSString stringWithFormat:@"Failed to parse superbinary payload metadata tlvs"];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_opt_new();
    [v23 setObject:v22 forKeyedSubscript:*MEMORY[0x1896075E0]];
    v24 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v23];
    id v25 = v24;
    if (a5) {
      *a5 = v24;
    }
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
LABEL_10:
    -[UARPSuperBinaryAssetPayload expandDictionaryWithPayloadsFolder:metaDataTable:error:].cold.1( (uint64_t)v22,  v26,  v27,  v28,  v29,  v30,  v31,  v32);
LABEL_11:

    BOOL v21 = 0;
    goto LABEL_12;
  }

  if (!self->_assetVersion
    && !-[UARPSuperBinaryAssetPayload parseFromPlistVersion:](self, "parseFromPlistVersion:", a5))
  {
    [NSString stringWithFormat:@"Failed to parse superbinary payload version"];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_opt_new();
    [v23 setObject:v22 forKeyedSubscript:*MEMORY[0x1896075E0]];
    id v34 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v23];
    id v25 = v34;
    if (a5) {
      *a5 = v34;
    }
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  BOOL v21 = 1;
LABEL_12:

  return v21;
}

- (BOOL)parseFromPlistVersion:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && +[UARPSuperBinaryAsset versionFromString:version:]( &OBJC_CLASS___UARPSuperBinaryAsset,  "versionFromString:version:",  v4,  &v9))
  {
    self->_uarpVersion = v9;
    uint64_t v5 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( objc_alloc(&OBJC_CLASS___UARPAssetVersion),  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  self->_uarpVersion.major,  self->_uarpVersion.minor,  self->_uarpVersion.release,  self->_uarpVersion.build);
    assetVersion = self->_assetVersion;
    self->_assetVersion = v5;

    BOOL v7 = 1;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)parseFromPlistPayloadMetaDataTLVs:(id)a3 payloadsURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  id v24 = 0LL;
  -[NSDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", @"Payload MetaData");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __83__UARPSuperBinaryAssetPayload_parseFromPlistPayloadMetaDataTLVs_payloadsURL_error___block_invoke;
  v14[3] = &unk_18A143210;
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  id v17 = self;
  uint64_t v18 = &v19;
  id v16 = v12;
  [v10 enumerateKeysAndObjectsUsingBlock:v14];
  *a5 = (id) v20[5];

  _Block_object_dispose(&v19, 8);
  return 1;
}

void __83__UARPSuperBinaryAssetPayload_parseFromPlistPayloadMetaDataTLVs_payloadsURL_error___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id obj = 0LL;
  [v4 tlvArrayWithKey:a2 keyValue:a3 payloadsURL:v5 error:&obj];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v6, obj);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(a1 + 48), "addMetaDataTLV:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }

      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }

    while (v10);
  }
}

- (BOOL)expandPayloadToURL:(id)a3 superbinary:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 error:(id *)a7
{
  return -[UARPSuperBinaryAssetPayload expandPayloadToURL:payloadFilename:superbinary:offset:length:error:]( self,  "expandPayloadToURL:payloadFilename:superbinary:offset:length:error:",  a3,  0LL,  a4,  a5,  a6,  a7);
}

- (BOOL)expandPayloadToURL:(id)a3 payloadFilename:(id)a4 superbinary:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 error:(id *)a8
{
  uint64_t v82 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  __int128 v15 = (NSString *)a4;
  id v16 = a5;
  id v17 = objc_alloc(MEMORY[0x189604030]);
  if (v15) {
    tag = v15;
  }
  else {
    tag = self->_tag;
  }
  uint64_t v19 = (void *)[v17 initFileURLWithPath:tag relativeToURL:v14];
  [v19 URLByDeletingLastPathComponent];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20
    && (unint64_t v69 = a6,
        unint64_t v70 = a7,
        [MEMORY[0x1896078A8] defaultManager],
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(),
        int v22 = [v21 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:0 error:a8],
        v21,
        v22)
    && [v16 uarpSeekToOffset:v69 error:a8])
  {
    v67 = v16;
    v68 = self;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    v23 = self->_tlvs;
    uint64_t v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v71,  v81,  16LL);
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v72;
      while (2)
      {
        for (uint64_t i = 0LL; i != v25; ++i)
        {
          if (*(void *)v72 != v26) {
            objc_enumerationMutation(v23);
          }
          if ([*(id *)(*((void *)&v71 + 1) + 8 * i) type] == 3166200583)
          {

            id v16 = v67;
            [v67 uarpReadDataUpToLength:v70 error:0];
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v46 = (void *)MEMORY[0x189604010];
            uint64_t v47 = objc_opt_class();
            uint64_t v48 = objc_opt_class();
            uint64_t v49 = objc_opt_class();
            objc_msgSend(v46, "setWithObjects:", v47, v48, v49, objc_opt_class(), 0);
            id v34 = (void *)objc_claimAutoreleasedReturnValue();
            [MEMORY[0x189607908] unarchivedObjectOfClasses:v34 fromData:v30 error:0];
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            [v50 writeToURL:v19 error:0];

            BOOL v59 = 1;
            goto LABEL_36;
          }
        }

        uint64_t v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v71,  v81,  16LL);
        if (v25) {
          continue;
        }
        break;
      }
    }

    uint64_t v28 = (void *)NSString;
    id v29 = v19;
    objc_msgSend(v28, "stringWithUTF8String:", objc_msgSend(v29, "fileSystemRepresentation"));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896078A8] defaultManager];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    char v32 = [v31 createFileAtPath:v30 contents:0 attributes:0];

    if ((v32 & 1) != 0)
    {
      uint64_t v33 = [MEMORY[0x189607898] fileHandleForWritingToURL:v29 error:a8];
      id v34 = (void *)v33;
      if (v33)
      {
        v65 = (void *)v33;
        log = self->_log;
        id v16 = v67;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v76 = v70;
          _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "Decomposing Payload of length <%lu>", buf, 0xCu);
        }

        v64 = v30;
        unint64_t v36 = v70;
        if (v70)
        {
          unint64_t v37 = 0LL;
          unint64_t v66 = 0LL;
          int v38 = 0;
          while (1)
          {
            if (v36 - v37 >= 0x1000) {
              uint64_t v39 = 4096LL;
            }
            else {
              uint64_t v39 = v36 - v37;
            }
            [v67 uarpReadDataUpToLength:v39 error:a8];
            id v40 = (void *)objc_claimAutoreleasedReturnValue();
            id v41 = v40;
            if (!v40 || ![v40 length])
            {
              __int128 v42 = v68->_log;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218496;
                unint64_t v76 = v70;
                __int16 v77 = 2048;
                unint64_t v78 = v69;
                __int16 v79 = 2048;
                unint64_t v80 = v37;
                _os_log_error_impl( &dword_187DC0000,  v42,  OS_LOG_TYPE_ERROR,  "Could not read payload data; payload length is <%lu>, Payload Offset is <%lu>, Bytes Read is <%lu>",
                  buf,
                  0x20u);
              }
            }

            v38 += v39;
            unsigned int v43 = [v41 length];
            if (([v65 uarpWriteData:v41 error:a8] & 1) == 0) {
              break;
            }
            v66 += [v41 length];
            __int128 v44 = v68->_log;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              unint64_t v76 = v66;
              _os_log_impl(&dword_187DC0000, v44, OS_LOG_TYPE_INFO, "Bytes Written <%lu>", buf, 0xCu);
            }

            v37 += v43;

            unint64_t v36 = v70;
            if (v37 >= v70)
            {
              BOOL v59 = 1;
              goto LABEL_44;
            }
          }

          v51 = v68->_log;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            -[UARPSuperBinaryAssetPayload expandPayloadToURL:payloadFilename:superbinary:offset:length:error:].cold.1( v51,  v52,  v53,  v54,  v55,  v56,  v57,  v58);
          }

          BOOL v59 = 0;
LABEL_44:
          id v16 = v67;
        }

        else
        {
          int v38 = 0;
          BOOL v59 = 1;
        }

        [v65 uarpCloseAndReturnError:0];
        v60 = v68->_log;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v76) = 0;
          _os_log_impl(&dword_187DC0000, v60, OS_LOG_TYPE_INFO, "Total Headers <%u>\n", buf, 8u);
        }

        v61 = v68->_log;
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v76) = 0;
          _os_log_impl(&dword_187DC0000, v61, OS_LOG_TYPE_INFO, "Total Header Bytes <%u>\n", buf, 8u);
        }

        v62 = v68->_log;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v76) = 0;
          _os_log_impl(&dword_187DC0000, v62, OS_LOG_TYPE_INFO, "Total Compressed Bytes <%u>\n", buf, 8u);
        }

        v63 = v68->_log;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v76) = v38;
          _os_log_impl(&dword_187DC0000, v63, OS_LOG_TYPE_INFO, "Total Uncompressed Bytes <%u>\n", buf, 8u);
        }

        uint64_t v30 = v64;
        id v34 = v65;
      }

      else
      {
        BOOL v59 = 0;
        id v16 = v67;
      }

- (id)description
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  [v3 appendFormat:@"--------------\n"];
  [v3 appendFormat:@"Payload Header\n"];
  [v3 appendFormat:@"---------------\n"];
  objc_msgSend(v3, "appendFormat:", @"Header Length   - %u\n", self->_payloadHeader.payloadHeaderLength);
  [v3 appendFormat:@"Tag             - "];
  uarpPayloadTagUnpack(self->_payloadHeader.payloadTag, v31);
  objc_msgSend( v3,  "appendFormat:",  @"%c%c%c%c\n",  v31[0],  v31[1],  v31[2],  v31[3]);
  [v3 appendFormat:@"Version         - <"];
  objc_msgSend(v3, "appendFormat:", @"%u.", self->_payloadHeader.payloadVersion.major);
  objc_msgSend(v3, "appendFormat:", @"%u.", self->_payloadHeader.payloadVersion.minor);
  objc_msgSend(v3, "appendFormat:", @"%u.", self->_payloadHeader.payloadVersion.release);
  objc_msgSend(v3, "appendFormat:", @"%u", self->_payloadHeader.payloadVersion.build);
  [v3 appendFormat:@">\n"];
  objc_msgSend(v3, "appendFormat:", @"MetaData Offset - %u\n", self->_payloadHeader.payloadMetadataOffset);
  objc_msgSend(v3, "appendFormat:", @"MetaData Length - %u\n", self->_payloadHeader.payloadMetadataLength);
  objc_msgSend(v3, "appendFormat:", @"Payload Offset  - %u\n", self->_payloadHeader.payloadOffset);
  objc_msgSend(v3, "appendFormat:", @"Payload Length  - %u\n", self->_payloadHeader.payloadLength);
  [v3 appendFormat:@"\n"];
  [v3 appendFormat:@"---------------------\n"];
  [v3 appendFormat:@"Payload MetaData TLVs\n"];
  [v3 appendFormat:@"---------------------\n"];
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = self->_tlvs;
  uint64_t v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v33,  16LL);
  if (v22)
  {
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0LL; i != v22; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v3 appendFormat:@"%@\n", v5];
        if ([v5 type] == 3436347667)
        {
          id v6 = [v5 valueAsData];
          BOOL v7 = (unsigned __int16 *)[v6 bytes];
          unint64_t v8 = [v6 length];
          [v3 appendFormat:@"<Compression Header>\n"];
          if (v8 >= 0xA)
          {
            do
            {
              unsigned int v9 = uarpHtons(*v7);
              uint64_t v10 = uarpHtonl(*(_DWORD *)(v7 + 1));
              unsigned int v11 = uarpHtons(v7[3]);
              objc_msgSend( v3,  "appendFormat:",  @"    Algorithm <%u>, Actual Offset <%u>, Compressed Length <%u>, Uncompressed Length <%u>\n",  v9,  v10,  v11,  uarpHtons(v7[4]));
              v8 -= 10LL;
              v7 += 5;
            }

            while (v8 > 9);
          }

          [v3 appendFormat:@"</Compression Header>\n"];
        }

        if ([v5 type] == 2293403920 || objc_msgSend(v5, "type") == 2293403932)
        {
          [v5 valueAsData];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV decomposeTLVs:](&OBJC_CLASS___UARPSuperBinaryAssetTLV, "decomposeTLVs:", v12);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v3 appendFormat:@"<Nested TLVs>\n"];
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v32 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v24;
            do
            {
              for (uint64_t j = 0LL; j != v16; ++j)
              {
                if (*(void *)v24 != v17) {
                  objc_enumerationMutation(v14);
                }
                [v3 appendFormat:@"    %@\n", *(void *)(*((void *)&v23 + 1) + 8 * j)];
              }

              uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v32 count:16];
            }

            while (v16);
          }

          [v3 appendFormat:@"</Nested TLVs>\n"];
        }
      }

      uint64_t v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v33,  16LL);
    }

    while (v22);
  }

  return v3;
}

- (_NSRange)rangeMetadata
{
  NSUInteger payloadMetadataLength = self->_payloadHeader.payloadMetadataLength;
  NSUInteger payloadMetadataOffset = self->_payloadHeader.payloadMetadataOffset;
  result.length = payloadMetadataLength;
  result.location = payloadMetadataOffset;
  return result;
}

- (_NSRange)rangePayload
{
  NSUInteger payloadLength = self->_payloadHeader.payloadLength;
  NSUInteger payloadOffset = self->_payloadHeader.payloadOffset;
  result.length = payloadLength;
  result.location = payloadOffset;
  return result;
}

- (void)setSuperBinaryURL:(id)a3
{
}

- (BOOL)needsCompression
{
  return self->_compression != 0;
}

- (BOOL)allowCompressionHeaders
{
  return self->_allowCompressionHeaders;
}

- (NSData)compressionHeaders
{
  return (NSData *)[MEMORY[0x189603F48] dataWithData:self->_compressionHeaders];
}

- (unint64_t)compressionHeaderIndex
{
  return self->_compressionHeaderIndex;
}

- (BOOL)writePayloadData:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (self->_isWritable && (url = self->_url) != 0LL)
  {
    [MEMORY[0x189607898] fileHandleForUpdatingURL:url error:a5];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v10 uarpSeekToOffset:a4 error:a5]
      && [v10 uarpWriteData:v8 error:a5])
    {
      char v11 = [v10 uarpCloseAndReturnError:a5];
    }

    else
    {
      char v11 = 0;
    }
  }

  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isValid
{
  if (self->_url)
  {
    [MEMORY[0x1896078A8] defaultManager];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_url, "path");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    char v5 = [v3 fileExistsAtPath:v4];

    return v5;
  }

  payload = self->_payload;
  if (payload)
  {
    BOOL v8 = -[NSData length](payload, "length") == 0;
  }

  else
  {
    if (self->_tlvs) {
      return 1;
    }
    BOOL v8 = self->_composeTLVs == 0LL;
  }

  return !v8;
}

- (NSData)payload
{
  return (NSData *)objc_getProperty(self, a2, 192LL, 1);
}

- (unint64_t)formatVersion
{
  return self->_formatVersion;
}

- (void).cxx_destruct
{
}

- (void)addMetaDataTLV:(uint64_t)a3 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)prepareData
{
  OUTLINED_FUNCTION_0_0( &dword_187DC0000,  MEMORY[0x1895F8DA0],  a3,  "UARPUtilsBuildURLForTemporaryFile() returned nil",  a5,  a6,  a7,  a8,  0);
}

- (void)appendCompressedPayloadToFile:error:.cold.1()
{
}

- (void)appendCompressedPayloadToFile:error:.cold.2()
{
}

- (void)expandDictionaryWithPayloadsFolder:(uint64_t)a3 metaDataTable:(uint64_t)a4 error:(uint64_t)a5 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)expandPayloadToURL:(uint64_t)a3 payloadFilename:(uint64_t)a4 superbinary:(uint64_t)a5 offset:(uint64_t)a6 length:(uint64_t)a7 error:(uint64_t)a8 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end