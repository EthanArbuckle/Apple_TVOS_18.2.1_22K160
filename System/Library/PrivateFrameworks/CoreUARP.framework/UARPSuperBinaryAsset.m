@interface UARPSuperBinaryAsset
+ (BOOL)versionFromBNIString:(id)a3 version:(UARPVersion *)a4;
+ (BOOL)versionFromString:(id)a3 version:(UARPVersion *)a4;
- (BOOL)decomposeToURL:(id)a3 error:(id *)a4;
- (BOOL)expandHeadersAndTLVs:(id *)a3;
- (BOOL)expandPlistWithPayloadsFolder:(id)a3 error:(id *)a4;
- (BOOL)exportSuperBinaryContentToFilepath:(id)a3 range:(_NSRange)a4 error:(id *)a5;
- (BOOL)parseFromPlistFormatVersion:(id)a3 error:(id *)a4;
- (BOOL)parseFromPlistSuperBinaryMetaDataTLVs:(id)a3 payloadsURL:(id)a4 error:(id *)a5;
- (BOOL)parseFromPlistSuperBinaryMetaDataValuesTable:(id *)a3;
- (BOOL)parseFromPlistSuperBinaryPayloads:(id)a3 payloadsURL:(id)a4 error:(id *)a5;
- (BOOL)parseFromPlistSuperBinaryVersion:(id)a3 error:(id *)a4;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (BOOL)writeToURL:(id)a3 payloadStartOffset:(unint64_t)a4 error:(id *)a5;
- (NSArray)payloads;
- (NSArray)tlvs;
- (NSDate)timeCreated;
- (NSURL)url;
- (UARPAssetTag)assetTag;
- (UARPAssetVersion)assetVersion;
- (UARPSuperBinaryAsset)init;
- (UARPSuperBinaryAsset)initWithFormatVersion:(id)a3 majorVersion:(id)a4 minorVersion:(id)a5 releaseVersion:(id)a6 buildVersion:(id)a7;
- (UARPSuperBinaryAsset)initWithFormatVersion:(unint64_t)a3 assetVersion:(id)a4;
- (UARPSuperBinaryAsset)initWithPlist:(id)a3 metadataPlist:(id)a4;
- (UARPSuperBinaryAsset)initWithURL:(id)a3;
- (UARPSuperBinaryAsset)initWithURL:(id)a3 assetTag:(id)a4;
- (_NSRange)rangeMetadata;
- (id)computeHash;
- (id)description;
- (id)payloadData:(id)a3 range:(_NSRange)a4 error:(id *)a5;
- (id)prepareMetaData;
- (void)addMetaDataTLV:(id)a3;
- (void)addPayload:(id)a3;
- (void)processBVERVersionString:(id)a3;
- (void)processVersionString:(id)a3;
@end

@implementation UARPSuperBinaryAsset

- (UARPSuperBinaryAsset)init
{
  return -[UARPSuperBinaryAsset initWithFormatVersion:majorVersion:minorVersion:releaseVersion:buildVersion:]( self,  "initWithFormatVersion:majorVersion:minorVersion:releaseVersion:buildVersion:",  &unk_18A160A40,  &unk_18A160A58,  &unk_18A160A58,  &unk_18A160A58,  &unk_18A160A58);
}

- (UARPSuperBinaryAsset)initWithFormatVersion:(id)a3 majorVersion:(id)a4 minorVersion:(id)a5 releaseVersion:(id)a6 buildVersion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = objc_alloc(&OBJC_CLASS___UARPAssetVersion);
  uint64_t v16 = [v13 unsignedIntegerValue];
  uint64_t v17 = [v13 unsignedIntegerValue];

  uint64_t v18 = [v12 unsignedIntegerValue];
  uint64_t v19 = [v11 unsignedIntegerValue];

  v20 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( v15,  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  v16,  v17,  v18,  v19);
  uint64_t v21 = [v14 unsignedIntegerValue];

  v22 = -[UARPSuperBinaryAsset initWithFormatVersion:assetVersion:]( self,  "initWithFormatVersion:assetVersion:",  v21,  v20);
  return v22;
}

- (UARPSuperBinaryAsset)initWithFormatVersion:(unint64_t)a3 assetVersion:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryAsset;
  v8 = -[UARPSuperBinaryAsset init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_formatVersion = a3;
    objc_storeStrong((id *)&v8->_assetVersion, a4);
  }

  return v9;
}

- (UARPSuperBinaryAsset)initWithPlist:(id)a3 metadataPlist:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryAsset;
  v8 = -[UARPSuperBinaryAsset init](&v14, sel_init);
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    plist = v8->_plist;
    v8->_plist = (NSURL *)v9;

    if (v7)
    {
      uint64_t v11 = [v7 copy];
      plistMetaData = v8->_plistMetaData;
      v8->_plistMetaData = (NSURL *)v11;
    }
  }

  return v8;
}

- (UARPSuperBinaryAsset)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryAsset;
  v5 = -[UARPSuperBinaryAsset init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;
  }

  return v5;
}

- (UARPSuperBinaryAsset)initWithURL:(id)a3 assetTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryAsset;
  v8 = -[UARPSuperBinaryAsset init](&v16, sel_init);
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    uint64_t v11 = [v7 copy];
    assetTag = v8->_assetTag;
    v8->_assetTag = (UARPAssetTag *)v11;

    uint64_t v13 = [MEMORY[0x189603F50] date];
    timeCreated = v8->_timeCreated;
    v8->_timeCreated = (NSDate *)v13;
  }

  return v8;
}

- (NSArray)tlvs
{
  return (NSArray *)[MEMORY[0x189603F18] arrayWithArray:self->_tlvs];
}

- (NSArray)payloads
{
  return (NSArray *)[MEMORY[0x189603F18] arrayWithArray:self->_payloads];
}

- (void)addMetaDataTLV:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!self->_tlvs)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
      tlvs = self->_tlvs;
      self->_tlvs = v5;
    }

    if ([v4 type] == 3166200581)
    {
      -[UARPSuperBinaryAsset processVersionString:](self, "processVersionString:", v4);
    }

    else if ([v4 type] == 3166200582)
    {
      -[UARPSuperBinaryAsset processBVERVersionString:](self, "processBVERVersionString:", v4);
    }

    else
    {
      -[NSMutableArray addObject:](self->_tlvs, "addObject:", v4);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryAsset addMetaDataTLV:].cold.1();
  }
}

- (void)addPayload:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    payloads = self->_payloads;
    if (!payloads)
    {
      id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
      id v7 = self->_payloads;
      self->_payloads = v6;

      payloads = self->_payloads;
    }

    -[NSMutableArray addObject:](payloads, "addObject:", v4);
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryAsset addPayload:].cold.1();
  }
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  return -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:]( self,  "writeToURL:payloadStartOffset:error:",  a3,  0LL,  a4);
}

- (BOOL)writeToURL:(id)a3 payloadStartOffset:(unint64_t)a4 error:(id *)a5
{
  *(void *)((char *)&v145[1] + 4) = *MEMORY[0x1895F89C0];
  id v7 = a3;
  v130 = a5;
  if (self->_plist)
  {
    objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithContentsOfURL:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:@"SuperBinary Payloads"];
    v131 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v131 = 0LL;
    v8 = 0LL;
  }

  id obj = (id)objc_opt_new();
  v129 = self;
  payloads = self->_payloads;
  p_payloads = &self->_payloads;
  if (-[NSMutableArray count](payloads, "count"))
  {
    unint64_t v11 = 0LL;
    id v12 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v13 = MEMORY[0x189604A88];
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](*p_payloads, "objectAtIndexedSubscript:", v11);
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
      char v15 = [v14 isValid];

      if ((v15 & 1) != 0)
      {
        -[NSMutableArray objectAtIndexedSubscript:](*p_payloads, "objectAtIndexedSubscript:", v11);
        objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
        [obj addObject:v16];
      }

      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.12(v144, (id *)p_payloads, v11, v145);
        }
        [v131 objectAtIndexedSubscript:v11];
        objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 setObject:v13 forKeyedSubscript:@"Payload Missing"];
      }

      ++v11;
    }

    while (v11 < -[NSMutableArray count](*p_payloads, "count"));
  }

  objc_storeStrong((id *)p_payloads, obj);
  uint64_t v17 = v7;
  if (!v7)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to create file for composing superbinary, url is nil");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_opt_new();
    [v27 setObject:v21 forKeyedSubscript:*MEMORY[0x1896075E0]];
    v44 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v27];
    v25 = v44;
    if (v130) {
      id *v130 = v44;
    }
    v24 = v8;
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }

  id v18 = v7;
  uint64_t v19 = (const char *)[v18 fileSystemRepresentation];
  if (v19)
  {
    v20 = v19;
    if (*v19)
    {
      [NSString stringWithUTF8String:v19];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x1896078A8] defaultManager];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      char v23 = [v22 createFileAtPath:v21 contents:0 attributes:0];

      v24 = v8;
      if ((v23 & 1) != 0)
      {
        id v143 = 0LL;
        [MEMORY[0x189607898] fileHandleForWritingToURL:v18 error:&v143];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (const __CFString *)v143;
        v27 = (void *)v26;
        if (v25)
        {
          v126 = v25;
          v123 = v21;
          v124 = v26;
          v121 = v17;
          int v142 = 0;
          __int128 v141 = 0u;
          __int128 v140 = 0u;
          v28 = v129;
          v139[0] = v129->_formatVersion;
          v139[1] = 44;
          DWORD1(v140) = -[UARPAssetVersion majorVersion](v129->_assetVersion, "majorVersion");
          DWORD2(v140) = -[UARPAssetVersion minorVersion](v129->_assetVersion, "minorVersion");
          HIDWORD(v140) = -[UARPAssetVersion releaseVersion](v129->_assetVersion, "releaseVersion");
          LODWORD(v141) = -[UARPAssetVersion buildVersion](v129->_assetVersion, "buildVersion");
          LODWORD(v140) = 44;
          int v29 = 40 * -[NSMutableArray count](v129->_payloads, "count");
          v125 = calloc(-[NSMutableArray count](v129->_payloads, "count"), 0x28uLL);
          if (-[NSMutableArray count](v129->_payloads, "count"))
          {
            unint64_t v30 = 0LL;
            v31 = v125 + 7;
            do
            {
              v32 = -[NSMutableArray objectAtIndex:](*p_payloads, "objectAtIndex:", v30);
              *(v31 - 7) = 40;
              *(v31 - 6) = [v32 preparePackedTag];
              [v32 prepareUarpVersion:v31 - 5];
              [v32 prepareMetaData];
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              _DWORD *v31 = [v33 length];
              id v34 = (id)[v32 prepareData];
              v31[2] = [v32 preparedDataLength];
              [v32 hashMetaData];
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              _DWORD *v31 = [v35 length];
              if ([v32 needsCompression]
                && [v32 allowCompressionHeaders])
              {
                if (v28->_formatVersion <= 2)
                {
                  v36 = -[NSMutableArray objectAtIndex:]( *p_payloads,  "objectAtIndex:",  [v32 compressionHeaderIndex]);
                  [v32 compressionHeaders];
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  [v36 setPayloadToData:v37];

                  v28 = v129;
                }

                [v32 metaData];
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                _DWORD *v31 = [v38 length];
              }

              ++v30;
              v31 += 10;
            }

            while (v30 < -[NSMutableArray count](*p_payloads, "count"));
          }

          HIDWORD(v141) = v140;
          int v142 = v29;
          DWORD1(v141) = v140 + v29;
          v120 = -[UARPSuperBinaryAsset prepareMetaData](v28, "prepareMetaData");
          DWORD2(v141) = [v120 length];
          LODWORD(v140) = v140 + v29 + DWORD2(v141);
          if (-[NSMutableArray count](v28->_payloads, "count"))
          {
            unint64_t v39 = 0LL;
            v40 = v125 + 7;
            do
            {
              int v41 = v140;
              *(v40 - 1) = v140;
              int v42 = *v40;
              v40 += 10;
              LODWORD(v140) = v42 + v41;
              ++v39;
            }

            while (v39 < -[NSMutableArray count](*p_payloads, "count"));
          }

          if (a4)
          {
            [MEMORY[0x189603FB8] dataWithLength:a4 - v140];
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v140) = v140 + [v43 length];
          }

          else
          {
            v43 = 0LL;
          }

          uint64_t v21 = v123;
          v25 = v126;
          v27 = (void *)v124;
          if (-[NSMutableArray count](*p_payloads, "count"))
          {
            unint64_t v53 = 0LL;
            v54 = v125 + 9;
            do
            {
              int v55 = v140;
              *(v54 - 1) = v140;
              int v56 = *v54;
              v54 += 10;
              LODWORD(v140) = v56 + v55;
              ++v53;
            }

            while (v53 < -[NSMutableArray count](*p_payloads, "count"));
          }

          v128 = v43;
          uarpSuperBinaryHeaderEndianSwap(v139, v139);
          [MEMORY[0x189603F48] dataWithBytes:v139 length:44];
          v138[1] = 0LL;
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          int v57 = objc_msgSend(v126, "uarpWriteData:error:");
          v58 = (const __CFString *)0LL;
          v122 = (__CFString *)v58;
          if (!v57)
          {
            v80 = v58;
            free(v125);
            v81 = @"<unknown>";
            if (v80) {
              v81 = v80;
            }
            objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to write to superbinary header at %@; %@",
              v123,
              v81);
            v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v82 = (void *)objc_opt_new();
            [v82 setObject:v61 forKeyedSubscript:*MEMORY[0x1896075E0]];
            v83 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v82];
            v84 = v83;
            if (v130) {
              id *v130 = v83;
            }
            uint64_t v17 = v121;
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
              -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.1();
            }

            BOOL v46 = 0;
            goto LABEL_135;
          }

          if (-[NSMutableArray count](*p_payloads, "count"))
          {
            unint64_t v59 = 0LL;
            v60 = v125;
            while (1)
            {
              uarpPayloadHeaderEndianSwap(v60, v60);
              [MEMORY[0x189603F48] dataWithBytes:v60 length:40];
              v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v138[0] = 0LL;
              char v62 = [v126 uarpWriteData:v61 error:v138];
              v63 = (__CFString *)v138[0];
              v64 = v63;
              if ((v62 & 1) == 0) {
                break;
              }

              ++v59;
              v60 += 10;
              if (v59 >= -[NSMutableArray count](*p_payloads, "count")) {
                goto LABEL_62;
              }
            }

            free(v125);
            v90 = @"<unknown>";
            if (v64) {
              v90 = v64;
            }
            objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to write to superbinary payload header index %lu at %@; %@",
              v59,
              v123,
              v90);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = (void *)objc_opt_new();
            [v92 setObject:v91 forKeyedSubscript:*MEMORY[0x1896075E0]];
            v93 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v92];
            v94 = v93;
            if (v130) {
              id *v130 = v93;
            }
            uint64_t v17 = v121;
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
              -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.1();
            }
            goto LABEL_97;
          }

+ (BOOL)versionFromString:(id)a3 version:(UARPVersion *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v5 count] < 4)
  {
    a4->build = 0;
  }

  else
  {
    [v5 objectAtIndex:3];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    a4->build = [v6 integerValue];
  }

  if ((unint64_t)[v5 count] < 3)
  {
    a4->release = 0;
  }

  else
  {
    [v5 objectAtIndex:2];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    a4->release = [v7 integerValue];
  }

  if ((unint64_t)[v5 count] < 2)
  {
    a4->minor = 0;
  }

  else
  {
    [v5 objectAtIndex:1];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    a4->minor = [v8 integerValue];
  }

  uint64_t v9 = [v5 count];
  if (v9)
  {
    [v5 objectAtIndex:0];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    a4->major = [v10 integerValue];
  }

  else
  {
    a4->major = 0;
  }

  return v9 != 0;
}

+ (BOOL)versionFromBNIString:(id)a3 version:(UARPVersion *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 count] == 3)
  {
    [v5 objectAtIndexedSubscript:1];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v7 = [v6 longLongValue];

    v8 = (void *)NSString;
    [v5 objectAtIndexedSubscript:0];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectAtIndexedSubscript:2];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 stringWithFormat:@"%@.%d.%d.%@", v9, HIDWORD(v7), v7, v10];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v12 = +[UARPSuperBinaryAsset versionFromString:version:]( &OBJC_CLASS___UARPSuperBinaryAsset,  "versionFromString:version:",  v11,  a4);
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)expandPlistWithPayloadsFolder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [MEMORY[0x189603FC8] dictionaryWithContentsOfURL:self->_plist];
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = -[UARPSuperBinaryAsset parseFromPlistFormatVersion:error:](self, "parseFromPlistFormatVersion:error:", v7, a4)
    && -[UARPSuperBinaryAsset parseFromPlistSuperBinaryMetaDataValuesTable:]( self,  "parseFromPlistSuperBinaryMetaDataValuesTable:",  a4)
    && -[UARPSuperBinaryAsset parseFromPlistSuperBinaryMetaDataTLVs:payloadsURL:error:]( self,  "parseFromPlistSuperBinaryMetaDataTLVs:payloadsURL:error:",  v7,  v6,  a4)
    && (self->_assetVersion
     || -[UARPSuperBinaryAsset parseFromPlistSuperBinaryVersion:error:]( self,  "parseFromPlistSuperBinaryVersion:error:",  v7,  a4))
    && -[UARPSuperBinaryAsset parseFromPlistSuperBinaryPayloads:payloadsURL:error:]( self,  "parseFromPlistSuperBinaryPayloads:payloadsURL:error:",  v7,  v6,  a4);

  return v8;
}

- (BOOL)parseFromPlistFormatVersion:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = v6;
  if (v6)
  {
    self->_formatVersion = [v6 unsignedIntegerValue];
  }

  else
  {
    [NSString stringWithFormat:@"superbinary format version is nil"];
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (void *)objc_opt_new();
    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1896075E0]];
    v10 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v9];
    unint64_t v11 = v10;
    if (a4) {
      *a4 = v10;
    }
  }

  return v7 != 0LL;
}

- (BOOL)parseFromPlistSuperBinaryVersion:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    BOOL v7 = +[UARPSuperBinaryAsset versionFromString:version:]( &OBJC_CLASS___UARPSuperBinaryAsset,  "versionFromString:version:",  v6,  v19);
    if (v7)
    {
      BOOL v8 = objc_alloc(&OBJC_CLASS___UARPAssetVersion);
      uint64_t v9 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( v8,  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  v19[0],  v19[1],  v19[2],  v19[3]);
      assetVersion = self->_assetVersion;
      self->_assetVersion = v9;
    }

    else
    {
      [NSString stringWithFormat:@"cannot convert superbinary version string to object"];
      assetVersion = (void *)objc_claimAutoreleasedReturnValue();
      char v15 = (void *)objc_opt_new();
      [v15 setObject:assetVersion forKeyedSubscript:*MEMORY[0x1896075E0]];
      objc_super v16 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v15];
      uint64_t v17 = v16;
      if (a4) {
        *a4 = v16;
      }
    }
  }

  else
  {
    [NSString stringWithFormat:@"superbinary plist does not contain superbinary version"];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = (void *)objc_opt_new();
    [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x1896075E0]];
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v12];
    objc_super v14 = v13;
    if (a4) {
      *a4 = v13;
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)parseFromPlistSuperBinaryMetaDataValuesTable:(id *)a3
{
  plistMetaData = self->_plistMetaData;
  id v6 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryMetaDataTable);
  BOOL v7 = v6;
  if (plistMetaData)
  {
    BOOL v8 = -[UARPSuperBinaryMetaDataTable initWithPlist:](v6, "initWithPlist:", self->_plistMetaData);
    metaDataTable = self->_metaDataTable;
    self->_metaDataTable = v8;

    return -[UARPSuperBinaryMetaDataTable expandPlist:](self->_metaDataTable, "expandPlist:", a3);
  }

  else
  {
    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_formatVersion];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = -[UARPSuperBinaryMetaDataTable initAppleSpecificWithFormatVersion:]( v7,  "initAppleSpecificWithFormatVersion:",  v11);
    uint64_t v13 = self->_metaDataTable;
    self->_metaDataTable = v12;

    return 1;
  }

- (BOOL)parseFromPlistSuperBinaryMetaDataTLVs:(id)a3 payloadsURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  id v21 = 0LL;
  [v8 objectForKeyedSubscript:@"SuperBinary MetaData"];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __80__UARPSuperBinaryAsset_parseFromPlistSuperBinaryMetaDataTLVs_payloadsURL_error___block_invoke;
  v13[3] = &unk_18A1430B0;
  v13[4] = self;
  id v11 = v9;
  id v14 = v11;
  char v15 = &v16;
  [v10 enumerateKeysAndObjectsUsingBlock:v13];
  *a5 = (id) v17[5];

  _Block_object_dispose(&v16, 8);
  return 1;
}

void __80__UARPSuperBinaryAsset_parseFromPlistSuperBinaryMetaDataTLVs_payloadsURL_error___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 40);
  BOOL v7 = *(void **)(*(void *)(a1 + 32) + 48LL);
  id v8 = (id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  id obj = 0LL;
  [v7 tlvArrayWithKey:a2 keyValue:a3 payloadsURL:v6 error:&obj];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(a1 + 32), "addMetaDataTLV:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }

      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }

    while (v12);
  }

  if (!v10 || ![v10 count]) {
    *a4 = 1;
  }
}

- (BOOL)parseFromPlistSuperBinaryPayloads:(id)a3 payloadsURL:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  [a3 objectForKeyedSubscript:@"SuperBinary Payloads"];
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v37;
LABEL_3:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v37 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = -[UARPSuperBinaryAssetPayload initWithDictionary:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetPayload),  "initWithDictionary:",  *(void *)(*((void *)&v36 + 1) + 8 * v13));
      __int128 v15 = v14;
      if (!v14) {
        break;
      }
      -[UARPSuperBinaryAssetPayload updateFormatVersion:](v14, "updateFormatVersion:", self->_formatVersion);
      -[UARPSuperBinaryAsset addPayload:](self, "addPayload:", v15);
      if (!-[UARPSuperBinaryAssetPayload expandDictionaryWithPayloadsFolder:metaDataTable:error:]( v15,  "expandDictionaryWithPayloadsFolder:metaDataTable:error:",  v8,  self->_metaDataTable,  a5))
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          -[UARPSuperBinaryAsset parseFromPlistSuperBinaryPayloads:payloadsURL:error:].cold.2();
        }
LABEL_30:

        BOOL v25 = 0;
        id v16 = v9;
        goto LABEL_31;
      }

      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v43 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }

    [NSString stringWithFormat:@"could not expand payload while parsing plist"];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_opt_new();
    [v27 setObject:v26 forKeyedSubscript:*MEMORY[0x1896075E0]];
    v28 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v27];
    int v29 = v28;
    if (a5) {
      *a5 = v28;
    }

    goto LABEL_30;
  }

- (BOOL)expandHeadersAndTLVs:(id *)a3
{
  return -[UARPSuperBinaryAsset decomposeToURL:error:](self, "decomposeToURL:error:", 0LL, a3);
}

- (BOOL)decomposeToURL:(id)a3 error:(id *)a4
{
  uint64_t v110 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  url = self->_url;
  p_url = (uint64_t *)&self->_url;
  id v104 = 0LL;
  [MEMORY[0x189607898] fileHandleForReadingFromURL:url error:&v104];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v104;
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      -[UARPSuperBinaryAsset decomposeToURL:error:].cold.1(p_url, (uint64_t)v9);
      if (a4) {
        goto LABEL_84;
      }
    }

    else if (a4)
    {
LABEL_84:
      char v74 = 0;
      *a4 = v9;
      goto LABEL_87;
    }

    char v74 = 0;
    goto LABEL_87;
  }

  [v8 uarpReadDataUpToLength:44 error:a4];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 getBytes:&self->_superBinaryHeader length:44];
  uarpSuperBinaryHeaderEndianSwap( &self->_superBinaryHeader.superBinaryFormatVersion,  &self->_superBinaryHeader.superBinaryFormatVersion);
  self->_formatVersion = self->_superBinaryHeader.superBinaryFormatVersion;
  v94 = a4;
  uint64_t v11 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( objc_alloc(&OBJC_CLASS___UARPAssetVersion),  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  self->_superBinaryHeader.superBinaryVersion.major,  self->_superBinaryHeader.superBinaryVersion.minor,  self->_superBinaryHeader.superBinaryVersion.release,  self->_superBinaryHeader.superBinaryVersion.build);
  assetVersion = self->_assetVersion;
  self->_assetVersion = v11;

  if (self->_superBinaryHeader.superBinaryMetadataLength)
  {
    if (![v8 uarpSeekToOffset:self->_superBinaryHeader.superBinaryMetadataOffset error:a4])
    {
      char v74 = 0;
      goto LABEL_86;
    }

    [v8 uarpReadDataUpToLength:self->_superBinaryHeader.superBinaryMetadataLength error:a4];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSuperBinaryAssetTLV decomposeTLVs:](&OBJC_CLASS___UARPSuperBinaryAssetTLV, "decomposeTLVs:", v13);
    uint64_t v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    tlvs = self->_tlvs;
    self->_tlvs = v14;
  }

  [v8 uarpSeekToOffset:self->_superBinaryHeader.superBinaryLength error:a4];
  v83 = v8;
  [v8 uarpReadDataToEndOfFileAndReturnError:a4];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v17 = (void *)MEMORY[0x189604010];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607908] unarchivedObjectOfClasses:v21 fromData:v16 error:0];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 objectForKeyedSubscript:@"MetaData plist"];
  id v81 = v9;
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    char v23 = v22;
    if (v6)
    {
      v24 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:@"MetaData.plist" relativeToURL:v6];
      int v25 = [v82 writeToURL:v24 error:v94];

      if (!v25)
      {
        char v74 = 0;
        v22 = v23;
        id v9 = v81;
        goto LABEL_81;
      }
    }

    v26 = -[UARPSuperBinaryMetaDataTable initWithDictionary:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryMetaDataTable),  "initWithDictionary:",  v82);
    metaDataTable = self->_metaDataTable;
    self->_metaDataTable = v26;

    v22 = v23;
    id v9 = v81;
  }

  [MEMORY[0x189603FC8] dictionaryWithDictionary:v22];
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    [v80 removeObjectForKey:@"MetaData plist"];
    [MEMORY[0x189603F68] dictionaryWithDictionary:v80];
    v28 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    plistDictionary = self->_plistDictionary;
    self->_plistDictionary = v28;

    if (v6)
    {
      unint64_t v30 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:@"SuperBinary.plist" relativeToURL:v6];
      BOOL v31 = -[NSDictionary writeToURL:error:](self->_plistDictionary, "writeToURL:error:", v30, v94);

      if (!v31)
      {
        char v74 = 0;
        goto LABEL_80;
      }
    }
  }

  v77 = v21;
  v78 = v16;
  id v79 = v10;
  id v91 = v6;
  __int128 v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  payloads = self->_payloads;
  self->_payloads = v32;

  unsigned int payloadHeadersLength = self->_superBinaryHeader.payloadHeadersLength;
  char v76 = v22;
  [v22 objectForKeyedSubscript:@"SuperBinary Payloads"];
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] arrayWithArray:v35];
  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  id v37 = v35;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v100 objects:v109 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v101;
    do
    {
      for (uint64_t i = 0LL; i != v39; ++i)
      {
        if (*(void *)v101 != v40) {
          objc_enumerationMutation(v37);
        }
        int v42 = *(void **)(*((void *)&v100 + 1) + 8 * i);
        [v42 objectForKeyedSubscript:@"Payload Missing"];
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }

      uint64_t v39 = [v37 countByEnumeratingWithState:&v100 objects:v109 count:16];
    }

    while (v39);
  }

  uint64_t v44 = [MEMORY[0x189603F18] arrayWithArray:v36];

  v45 = (void *)v44;
  id v6 = v91;
  id v8 = v83;
  BOOL v46 = v94;
  v92 = v45;
  if (payloadHeadersLength < 0x28)
  {
LABEL_78:
    char v74 = [v8 uarpCloseAndReturnError:v46];
    goto LABEL_79;
  }

  uint64_t v47 = 0LL;
  uint64_t v48 = 0LL;
  LODWORD(v49) = payloadHeadersLength / 0x28;
  if (payloadHeadersLength / 0x28 <= 1) {
    uint64_t v49 = 1LL;
  }
  else {
    uint64_t v49 = v49;
  }
  uint64_t v93 = v49;
  while (1)
  {
    [v8 uarpSeekToOffset:v47 + self->_superBinaryHeader.payloadHeadersOffset error:v46];
    uint64_t v99 = 0LL;
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    [v8 uarpReadDataUpToLength:40 error:v46];
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    [v50 getBytes:&v97 length:40];
    uarpPayloadHeaderEndianSwap((unsigned int *)&v97, &v97);
    v51 = -[UARPSuperBinaryAssetPayload initWithPayloadHeader:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetPayload),  "initWithPayloadHeader:",  &v97);
    if (!v51)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        -[UARPSuperBinaryAsset decomposeToURL:error:].cold.2(v107, (uint64_t)self, &v108);
      }
      goto LABEL_77;
    }

    v52 = v51;
    uarpTagStructUnpack32(DWORD1(v97), &v96);
    int v95 = 1380206659;
    if (uarp4ccCompare((unsigned __int8 *)&v96, (unsigned __int8 *)&v95))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        -[UARPSuperBinaryAsset decomposeToURL:error:].cold.3(v105, (uint64_t)self, &v106);
      }
      goto LABEL_76;
    }

    -[UARPSuperBinaryAssetPayload setSuperBinaryURL:](v52, "setSuperBinaryURL:", *p_url);
    if (HIDWORD(v98))
    {
      [v8 uarpReadDataUpToLength:HIDWORD(v98) error:v46];
      unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPSuperBinaryAssetPayload addMetaDataTLVs:](v52, "addMetaDataTLVs:", v53);

      v45 = v92;
    }

    if (v6) {
      break;
    }
LABEL_75:
    -[NSMutableArray addObject:](self->_payloads, "addObject:", v52);
LABEL_76:

LABEL_77:
    ++v48;
    v47 += 40LL;
    if (v93 == v48) {
      goto LABEL_78;
    }
  }

  if ([v45 count])
  {
    [v45 objectAtIndex:v48];
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    [v89 objectForKeyedSubscript:@"Payload Filepath"];
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (v88) {
      goto LABEL_44;
    }
  }

  else
  {
    v89 = 0LL;
  }
  v54 = -[UARPSuperBinaryAssetPayload tlvs](v52, "tlvs");
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  3436347665LL,  v54);
  int v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    [v55 valueAsString];
    v88 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v88 = 0LL;
  }

  BOOL v46 = v94;
  v45 = v92;
LABEL_44:
  if (!HIDWORD(v99)
    || -[UARPSuperBinaryAssetPayload expandPayloadToURL:payloadFilename:superbinary:offset:length:error:]( v52,  "expandPayloadToURL:payloadFilename:superbinary:offset:length:error:",  v6,  v88,  v8,  v99))
  {
    [v89 objectForKeyedSubscript:@"Payload MetaData"];
    int v56 = (void *)objc_claimAutoreleasedReturnValue();
    [v56 objectForKeyedSubscript:@"Payload Signature"];
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v56;
    if (v86)
    {
      -[UARPSuperBinaryAssetPayload tlvs](v52, "tlvs");
      int v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  3436347654LL,  v57);
      if (v58)
      {
        [v58 valueAsData];
        unint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189604030] URLWithString:v86 relativeToURL:v91];
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (v60 && v59) {
          [v59 writeToURL:v60 atomically:1];
        }

        int v56 = v87;
      }

      BOOL v46 = v94;
      v45 = v92;
    }

    [v56 objectForKeyedSubscript:@"Payload Signature (Development)"];
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (v85)
    {
      v61 = -[UARPSuperBinaryAssetPayload tlvs](v52, "tlvs");
      +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  3436347669LL,  v61);
      char v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v62)
      {
        [v62 valueAsData];
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189604030] URLWithString:v85 relativeToURL:v91];
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (v64 && v63) {
          [v63 writeToURL:v64 atomically:1];
        }

        int v56 = v87;
      }

      BOOL v46 = v94;
      v45 = v92;
    }

    [v56 objectForKeyedSubscript:@"Payload Hash"];
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (v84)
    {
      v65 = -[UARPSuperBinaryAssetPayload tlvs](v52, "tlvs");
      +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  3436347655LL,  v65);
      int v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        [v66 valueAsData];
        uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189604030] URLWithString:v84 relativeToURL:v91];
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if (v68 && v67) {
          [v67 writeToURL:v68 atomically:1];
        }

        int v56 = v87;
      }

      BOOL v46 = v94;
      v45 = v92;
    }

    [v56 objectForKeyedSubscript:@"Payload Certificate"];
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      -[UARPSuperBinaryAssetPayload tlvs](v52, "tlvs");
      char v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  3436347653LL,  v70);
      if (v71)
      {
        [v71 valueAsData];
        char v72 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189604030] URLWithString:v69 relativeToURL:v91];
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (v73 && v72) {
          [v72 writeToURL:v73 atomically:1];
        }
      }

      BOOL v46 = v94;
      v45 = v92;
      int v56 = v87;
    }

    id v6 = v91;
    id v8 = v83;
    goto LABEL_75;
  }

LABEL_93:
  char v74 = 0;
LABEL_79:

  id v9 = v81;
  id v16 = v78;
  uint64_t v10 = v79;
  v22 = v76;
  uint64_t v21 = v77;
LABEL_80:

LABEL_81:
LABEL_86:

LABEL_87:
  return v74;
}

- (id)description
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  [v3 appendFormat:@"------------------\n"];
  [v3 appendFormat:@"SuperBinary Header\n"];
  [v3 appendFormat:@"------------------\n"];
  objc_msgSend(v3, "appendFormat:", @"Format Version  - %u\n", self->_superBinaryHeader.superBinaryFormatVersion);
  objc_msgSend(v3, "appendFormat:", @"Header Length   - %u\n", self->_superBinaryHeader.superBinaryHeaderLength);
  objc_msgSend(v3, "appendFormat:", @"Length          - %u\n", self->_superBinaryHeader.superBinaryLength);
  [v3 appendFormat:@"Version         - <"];
  objc_msgSend(v3, "appendFormat:", @"%u.", self->_superBinaryHeader.superBinaryVersion.major);
  objc_msgSend(v3, "appendFormat:", @"%u.", self->_superBinaryHeader.superBinaryVersion.minor);
  objc_msgSend(v3, "appendFormat:", @"%u.", self->_superBinaryHeader.superBinaryVersion.release);
  objc_msgSend(v3, "appendFormat:", @"%u", self->_superBinaryHeader.superBinaryVersion.build);
  [v3 appendFormat:@">\n"];
  objc_msgSend( v3,  "appendFormat:",  @"SuperBinary MetaData Offset - %u\n",  self->_superBinaryHeader.superBinaryMetadataOffset);
  objc_msgSend( v3,  "appendFormat:",  @"SuperBinary MetaData Length - %u\n",  self->_superBinaryHeader.superBinaryMetadataLength);
  objc_msgSend( v3,  "appendFormat:",  @"Payloads Headers Offset - %u\n",  self->_superBinaryHeader.payloadHeadersOffset);
  objc_msgSend( v3,  "appendFormat:",  @"Payloads Headers Length - %u\n",  self->_superBinaryHeader.payloadHeadersLength);
  [v3 appendFormat:@"\n"];
  [v3 appendFormat:@"-------------------------\n"];
  [v3 appendFormat:@"SuperBinary MetaData TLVs\n"];
  [v3 appendFormat:@"-------------------------\n"];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v4 = self->_tlvs;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@\n", *(void *)(*((void *)&v20 + 1) + 8 * v8++)];
      }

      while (v6 != v8);
      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v6);
  }

  [v3 appendFormat:@"\n"];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = self->_payloads;
  uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        [v3 appendFormat:@"%@\n", *(void *)(*((void *)&v16 + 1) + 8 * v13++)];
      }

      while (v11 != v13);
      uint64_t v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
    }

    while (v11);
  }

  [v3 appendFormat:@"-----------------\n"];
  [v3 appendFormat:@"SuperBinary Plist\n"];
  [v3 appendFormat:@"-----------------\n"];
  [v3 appendFormat:@"%@\n", self->_plistDictionary];
  [v3 appendFormat:@"\n"];
  [v3 appendFormat:@"--------------\n"];
  [v3 appendFormat:@"MetaData Plist\n"];
  [v3 appendFormat:@"--------------\n"];
  -[UARPSuperBinaryMetaDataTable dict](self->_metaDataTable, "dict");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendFormat:@"%@\n", v14];

  [v3 appendFormat:@"\n"];
  return v3;
}

- (id)computeHash
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = (void *)objc_opt_new();
  url = self->_url;
  id v19 = 0LL;
  [MEMORY[0x189607898] fileHandleForReadingFromURL:url error:&v19];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v19;
  id v18 = 0LL;
  int v7 = [v5 uarpSeekToOffset:0 error:&v18];
  id v8 = v18;

  if (v7)
  {
    CC_SHA256_Init(&c);
    id v9 = 0LL;
    do
    {
      uint64_t v10 = v8;
      id v16 = 0LL;
      [v5 uarpReadDataUpToLength:4096 error:&v16];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v8 = v16;

      id v9 = v11;
      CC_SHA256_Update(&c, (const void *)[v9 bytes], objc_msgSend(v9, "length"));
    }

    while ([v9 length] == 4096);
    id v15 = 0LL;
    [v5 uarpCloseAndReturnError:&v15];
    id v12 = v15;

    CC_SHA256_Final(md, &c);
    for (uint64_t i = 0LL; i != 32; ++i)
      objc_msgSend(v3, "appendFormat:", @"%02x", md[i]);
  }

  else
  {
    id v12 = v8;
  }

  return v3;
}

- (_NSRange)rangeMetadata
{
  NSUInteger superBinaryMetadataLength = self->_superBinaryHeader.superBinaryMetadataLength;
  NSUInteger superBinaryMetadataOffset = self->_superBinaryHeader.superBinaryMetadataOffset;
  result.length = superBinaryMetadataLength;
  result.location = superBinaryMetadataOffset;
  return result;
}

- (BOOL)exportSuperBinaryContentToFilepath:(id)a3 range:(_NSRange)a4 error:(id *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  [MEMORY[0x189607898] fileHandleForReadingFromURL:self->_url error:a5];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = v10;
  if (v10 && [v10 uarpSeekToOffset:location error:a5])
  {
    [MEMORY[0x189607898] fileHandleForWritingToURL:v9 error:a5];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v13 = v12 != 0LL;
    if (v12)
    {
      do
      {
        if (length >= 0x1000) {
          uint64_t v14 = 4096LL;
        }
        else {
          uint64_t v14 = length;
        }
        uint64_t v15 = [v11 uarpReadDataUpToLength:v14 error:a5];
        if (!v15) {
          break;
        }
        id v16 = (void *)v15;
        int v17 = [v12 uarpWriteData:v15 error:a5];
        if (!v17) {
          uint64_t v14 = 0LL;
        }

        if (!v17) {
          break;
        }
        length -= v14;
      }

      while (length);
      [v11 uarpCloseAndReturnError:a5];
      [v12 uarpCloseAndReturnError:a5];
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)prepareMetaData
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x189603FB8]);
  metaData = self->_metaData;
  self->_metaData = v3;

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v5 = self->_tlvs;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "generateTLV:", 0, (void)v12);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableData appendData:](self->_metaData, "appendData:", v10);

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v7);
  }

  [MEMORY[0x189603F48] dataWithData:self->_metaData];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)payloadData:(id)a3 range:(_NSRange)a4 error:(id *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  if (-[NSMutableArray containsObject:](self->_payloads, "containsObject:", v9))
  {
    [MEMORY[0x189607898] fileHandleForReadingFromURL:self->_url error:a5];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      && objc_msgSend(v10, "uarpSeekToOffset:error:", objc_msgSend(v9, "rangePayload") + location, a5))
    {
      [v10 uarpReadDataUpToLength:length error:a5];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      else {
        id v12 = 0LL;
      }
    }

    else
    {
      id v12 = 0LL;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (void)processVersionString:(id)a3
{
  id v4 = (void *)NSString;
  [a3 valueAsURL];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithContentsOfURL:v5 encoding:4 error:0];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = -[UARPAssetVersion initWithVersionString:]( objc_alloc(&OBJC_CLASS___UARPAssetVersion),  "initWithVersionString:",  v8);
  assetVersion = self->_assetVersion;
  self->_assetVersion = v6;
}

- (void)processBVERVersionString:(id)a3
{
  id v4 = (void *)NSString;
  [a3 valueAsURL];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithContentsOfURL:v5 encoding:4 error:0];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = -[UARPAssetVersion initWithBVERString:](objc_alloc(&OBJC_CLASS___UARPAssetVersion), "initWithBVERString:", v8);
  assetVersion = self->_assetVersion;
  self->_assetVersion = v6;
}

- (UARPAssetVersion)assetVersion
{
  return (UARPAssetVersion *)objc_getProperty(self, a2, 120LL, 1);
}

- (UARPAssetTag)assetTag
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 128LL, 1);
}

- (NSDate)timeCreated
{
  return (NSDate *)objc_getProperty(self, a2, 136LL, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 144LL, 1);
}

- (void).cxx_destruct
{
}

- (void)addMetaDataTLV:.cold.1()
{
}

- (void)addPayload:.cold.1()
{
}

- (void)writeToURL:payloadStartOffset:error:.cold.1()
{
}

- (void)writeToURL:(uint64_t)a3 payloadStartOffset:(void *)a4 error:.cold.12( uint8_t *a1,  id *a2,  uint64_t a3,  void *a4)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a4 = v6;
  _os_log_error_impl(&dword_187DC0000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "Missing payload\n%@", a1, 0xCu);
}

- (void)parseFromPlistSuperBinaryPayloads:(uint8_t *)a1 payloadsURL:(uint64_t)a2 error:(void *)a3 .cold.1( uint8_t *a1,  uint64_t a2,  void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_3( &dword_187DC0000,  MEMORY[0x1895F8DA0],  (uint64_t)a3,  "attempting to add a nil header payload to payload %@",  a1);
}

- (void)parseFromPlistSuperBinaryPayloads:payloadsURL:error:.cold.2()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Failed to expand superbinary payload",  v0,  2u);
}

- (void)decomposeToURL:(uint64_t *)a1 error:(uint64_t)a2 .cold.1(uint64_t *a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *a1;
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Error opening URL %@ to decompose superbinary; error is %@",
    (uint8_t *)&v3,
    0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)decomposeToURL:(void *)a3 error:.cold.2(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_3( &dword_187DC0000,  MEMORY[0x1895F8DA0],  (uint64_t)a3,  "attempting to decompose a nil payload for superbinary %@",  a1);
}

- (void)decomposeToURL:(void *)a3 error:.cold.3(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_3( &dword_187DC0000,  MEMORY[0x1895F8DA0],  (uint64_t)a3,  "skipping CHDR payload for superbinary %@",  a1);
}

@end