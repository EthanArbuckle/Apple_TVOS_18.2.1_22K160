@interface FTABFile
+ (id)longTagName:(id)a3;
- (BOOL)addSubfileWithTagName:(id)a3 contentsOfURL:(id)a4;
- (BOOL)addSubfileWithTagName:(id)a3 subfileData:(id)a4;
- (BOOL)configureFileHandleWriteDestinationForURL:(id)a3;
- (BOOL)fileValidForOffset:(unsigned int)a3 length:(unsigned int)a4;
- (BOOL)initFile;
- (BOOL)parseFileData;
- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4;
- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4 handle:(id)a5;
- (BOOL)writeSubfileToURL:(id)a3 tag:(id)a4;
- (BOOL)writeToDestination;
- (BOOL)writeToURL:(id)a3;
- (FTABFile)init;
- (FTABFile)initWithContentsOfURL:(id)a3;
- (FTABFile)initWithData:(id)a3;
- (FTABSubfile)manifest;
- (NSArray)subfiles;
- (NSData)bootNonce;
- (NSData)magic;
- (NSString)bverString;
- (NSURL)url;
- (const)filePointer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createFileHandleForWritingToURL:(id)a3;
- (id)description;
- (id)subfileWithTag:(id)a3;
- (id)writeToData;
- (unint64_t)fileLength;
- (unsigned)generation;
- (unsigned)valid;
- (void)addSubfiles:(id)a3;
- (void)configureDataWriteDestination;
- (void)parseFileData;
- (void)removeSubfileWithTag:(id)a3;
- (void)setBootNonce:(id)a3;
- (void)setManifest:(id)a3;
- (void)writeToDestination;
@end

@implementation FTABFile

- (NSString)bverString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (int v4 = [v2 dataLength]) != 0)
  {
    LODWORD(v5) = v4;
    else {
      uint64_t v5 = v5;
    }
    v6 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithBytes:length:encoding:",  objc_msgSend(v3, "dataPointer"),  v5,  4);
  }

  else
  {
    v6 = 0LL;
  }

  return (NSString *)v6;
}

+ (id)longTagName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"acib"])
  {
    int v4 = @"ACIBT";
  }

  else if ([v3 isEqualToString:@"aopf"])
  {
    int v4 = @"AOP";
  }

  else if ([v3 isEqualToString:@"lpda"])
  {
    int v4 = @"LeapBinsDigestsArray";
  }

  else if ([v3 isEqualToString:@"phyb"])
  {
    int v4 = @"PhyBlueTooth";
  }

  else if ([v3 isEqualToString:@"rkof"])
  {
    int v4 = @"RTKitOSFeature";
  }

  else if ([v3 isEqualToString:@"rkos"])
  {
    int v4 = @"RTKitOS";
  }

  else if ([v3 isEqualToString:@"rrko"])
  {
    int v4 = @"RestoreRTKitOS";
  }

  else if ([v3 isEqualToString:@"rtpf"])
  {
    int v4 = @"RTP";
  }

  else if ([v3 isEqualToString:@"sbd1"])
  {
    int v4 = @"SoftwareBinaryDsp1";
  }

  else if ([v3 isEqualToString:@"sbd2"])
  {
    int v4 = @"SoftwareBinaryDsp2";
  }

  else
  {
    int v4 = 0LL;
  }

  return (id)v4;
}

- (FTABFile)initWithContentsOfURL:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___FTABFile;
  v6 = -[FTABFile init](&v14, sel_init);
  if (!v6) {
    goto LABEL_5;
  }
  id v13 = 0LL;
  uint64_t v7 = [MEMORY[0x189603F48] dataWithContentsOfURL:v5 options:1 error:&v13];
  id v8 = v13;
  fileData = v6->_fileData;
  v6->_fileData = (NSData *)v7;

  if (!v6->_fileData)
  {
    v11 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FTABFile initWithContentsOfURL:].cold.1();
    }

    goto LABEL_9;
  }

  if (!-[FTABFile initFile](v6, "initFile"))
  {
LABEL_9:

    v10 = 0LL;
    goto LABEL_10;
  }

  objc_storeStrong((id *)&v6->_url, a3);

LABEL_5:
  v10 = v6;
LABEL_10:

  return v10;
}

- (FTABFile)initWithData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___FTABFile;
  id v5 = -[FTABFile init](&v10, sel_init);
  if (v5
    && (uint64_t v6 = [v4 copy],
        fileData = v5->_fileData,
        v5->_fileData = (NSData *)v6,
        fileData,
        !-[FTABFile initFile](v5, "initFile")))
  {
    id v8 = 0LL;
  }

  else
  {
    id v8 = v5;
  }

  return v8;
}

- (BOOL)initFile
{
  self->_filePointer = (const char *)-[NSData bytes](self->_fileData, "bytes");
  self->_fileLength = -[NSData length](self->_fileData, "length");
  [MEMORY[0x189603FA8] array];
  id v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  subFileArray = self->_subFileArray;
  self->_subFileArray = v3;

  return -[FTABFile parseFileData](self, "parseFileData");
}

- (FTABFile)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___FTABFile;
  v2 = -[FTABFile init](&v11, sel_init);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    fileData = v2->_fileData;
    v2->_fileData = (NSData *)v3;

    manifest = v2->_manifest;
    v2->_manifest = 0LL;

    v2->_filePointer = (const char *)-[NSData bytes](v2->_fileData, "bytes");
    v2->_fileLength = -[NSData length](v2->_fileData, "length");
    uint64_t v6 = [MEMORY[0x189603FA8] array];
    subFileArray = v2->_subFileArray;
    v2->_subFileArray = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x189603F48] dataWithBytes:&kFTABMagicLowercase length:8];
    magic = v2->_magic;
    v2->_magic = (NSData *)v8;
  }

  return v2;
}

- (BOOL)parseFileData
{
  if (self->_fileLength > 0x2F)
  {
    filePointer = self->_filePointer;
    uint64_t v7 = filePointer + 32;
    if (*((void *)filePointer + 4) == 0x42415446534F4B52LL || *v7 == 0x62617466736F6B72LL)
    {
      [MEMORY[0x189603F48] dataWithBytes:v7 length:8];
      uint64_t v8 = (NSData *)objc_claimAutoreleasedReturnValue();
      magic = self->_magic;
      self->_magic = v8;

      self->_generation = *(_DWORD *)filePointer;
      self->_valid = *((_DWORD *)filePointer + 1);
      [MEMORY[0x189603F48] dataWithBytes:filePointer + 8 length:8];
      objc_super v10 = (NSData *)objc_claimAutoreleasedReturnValue();
      bootNonce = self->_bootNonce;
      self->_bootNonce = v10;

      uint64_t v12 = *((unsigned int *)filePointer + 5);
      if ((_DWORD)v12)
      {
        uint64_t v13 = *((unsigned int *)filePointer + 4);
        if (!-[FTABFile fileValidForOffset:length:]( self,  "fileValidForOffset:length:",  v13,  *((unsigned int *)filePointer + 5)))
        {
          v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
          if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
            -[FTABFile parseFileData].cold.5(v2, v24, v25);
          }
          goto LABEL_26;
        }

        objc_super v14 = -[FTABSubfile initWithTag:dataPointer:dataLength:]( objc_alloc(&OBJC_CLASS___FTABSubfile),  "initWithTag:dataPointer:dataLength:",  @"Manifest",  &self->_filePointer[v13],  v12);
        manifest = self->_manifest;
        self->_manifest = v14;
      }

      int v16 = *((_DWORD *)filePointer + 10);
      if (!v16) {
        return 1;
      }
      for (uint64_t i = 0LL;
            -[FTABFile fileValidForOffset:length:](self, "fileValidForOffset:length:", (i + 48), 16LL);
            i += 16LL)
      {
        uint64_t v19 = *(unsigned int *)&filePointer[i + 52];
        uint64_t v18 = *(unsigned int *)&filePointer[i + 56];
        if (!-[FTABFile fileValidForOffset:length:](self, "fileValidForOffset:length:", v19, v18))
        {
          v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
          if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
            -[FTABFile parseFileData].cold.3();
          }
          goto LABEL_26;
        }

        uint64_t v20 = [objc_alloc(NSString) initWithBytes:&filePointer[i + 48] length:4 encoding:4];
        if (!v20)
        {
          v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
          if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
            -[FTABFile parseFileData].cold.2((unsigned __int8 *)&filePointer[i + 48], v2);
          }
          goto LABEL_26;
        }

        v21 = (void *)v20;
        v22 = -[FTABSubfile initWithTag:dataPointer:dataLength:]( objc_alloc(&OBJC_CLASS___FTABSubfile),  "initWithTag:dataPointer:dataLength:",  v20,  &self->_filePointer[v19],  v18);
        -[NSMutableArray addObject:](self->_subFileArray, "addObject:", v22);
        --v16;

        if (!v16) {
          return 1;
        }
      }

      v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        -[FTABFile parseFileData].cold.4();
      }
    }

    else
    {
      v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        -[FTABFile parseFileData].cold.6();
      }
    }
  }

  else
  {
    v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[FTABFile parseFileData].cold.1(v2, v3, v4);
    }
  }

- (BOOL)fileValidForOffset:(unsigned int)a3 length:(unsigned int)a4
{
  return self->_fileLength >= a4 + a3;
}

- (id)subfileWithTag:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = self->_subFileArray;
  id v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        objc_msgSend(v9, "tag", (void)v13);
        objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
        char v11 = [v10 isEqual:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)removeSubfileWithTag:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v5 = v4;
    -[NSMutableArray removeObject:](self->_subFileArray, "removeObject:", v4);
    id v4 = v5;
  }
}

- (NSArray)subfiles
{
  return (NSArray *)[MEMORY[0x189603F18] arrayWithArray:self->_subFileArray];
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189607940] string];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (self->_url) {
    [v3 appendFormat:@"FTAB %@:\n", self->_url];
  }
  else {
    objc_msgSend(v3, "appendFormat:", @"FTAB:\n", v15);
  }
  objc_msgSend(v4, "appendFormat:", @"\tGeneration: 0x%08x\n", self->_generation);
  objc_msgSend(v4, "appendFormat:", @"\tValid: %u\n", self->_valid);
  -[NSData byteString](self->_bootNonce, "byteString");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 appendFormat:@"\tBoot Nonce: %@\n", v5];

  if (self->_manifest) {
    [v4 appendFormat:@"\tManifest: %@\n", self->_manifest];
  }
  if (-[NSMutableArray count](self->_subFileArray, "count"))
  {
    [v4 appendFormat:@"\tSubfiles:\n"];
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v6 = self->_subFileArray;
    uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0LL;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if (-v9 != i) {
            [v4 appendString:@"\n"];
          }
          [v4 appendFormat:@"\t\t%@", v12];
        }

        v9 += v8;
        uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v8);
    }
  }

  [NSString stringWithString:v4];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)addSubfileWithTagName:(id)a3 contentsOfURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v13 = 0LL;
  [MEMORY[0x189603F48] dataWithContentsOfURL:v7 options:1 error:&v13];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v13;
  if (v8)
  {
    BOOL v10 = -[FTABFile addSubfileWithTagName:subfileData:](self, "addSubfileWithTagName:subfileData:", v6, v8);
  }

  else
  {
    char v11 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FTABFile addSubfileWithTagName:contentsOfURL:].cold.1();
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)addSubfileWithTagName:(id)a3 subfileData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[FTABFile removeSubfileWithTag:](self, "removeSubfileWithTag:", v7);
  uint64_t v8 = objc_alloc(&OBJC_CLASS___FTABSubfile);
  id v9 = v6;
  uint64_t v10 = [v9 bytes];
  uint64_t v11 = [v9 length];

  uint64_t v12 = -[FTABSubfile initWithTag:dataPointer:dataLength:](v8, "initWithTag:dataPointer:dataLength:", v7, v10, v11);
  -[NSMutableArray addObject:](self->_subFileArray, "addObject:", v12);

  return 1;
}

- (void)addSubfiles:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8) tag];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[FTABFile removeSubfileWithTag:](self, "removeSubfileWithTag:", v9);

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  -[NSMutableArray addObjectsFromArray:](self->_subFileArray, "addObjectsFromArray:", v4);
}

- (void)setManifest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[FTABSubfile initWithTag:data:]( objc_alloc(&OBJC_CLASS___FTABSubfile),  "initWithTag:data:",  @"Manifest",  v4);

  manifest = self->_manifest;
  self->_manifest = v5;
}

- (void)setBootNonce:(id)a3
{
  id v6 = a3;
  if ([v6 length] == 8)
  {
    id v4 = (NSData *)[v6 copy];
    bootNonce = self->_bootNonce;
    self->_bootNonce = v4;
  }
}

- (id)createFileHandleForWritingToURL:(id)a3
{
  id v3 = a3;
  [MEMORY[0x1896078A8] defaultManager];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    [v3 path];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = 0LL;
    char v8 = [v4 removeItemAtPath:v7 error:&v18];
    os_log_t v9 = (os_log_t)v18;

    if ((v8 & 1) == 0)
    {
      uint64_t v15 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[FTABFile createFileHandleForWritingToURL:].cold.3(v3);
      }

      goto LABEL_14;
    }
  }

  [MEMORY[0x1896078A8] defaultManager];
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
  char v12 = [v10 createFileAtPath:v11 contents:0 attributes:0];

  if ((v12 & 1) == 0)
  {
    os_log_t v9 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[FTABFile createFileHandleForWritingToURL:].cold.2(v3);
    }
LABEL_14:
    __int128 v13 = 0LL;
    goto LABEL_15;
  }

  id v17 = 0LL;
  [MEMORY[0x189607898] fileHandleForWritingToURL:v3 error:&v17];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_log_t v9 = (os_log_t)v17;
  if (!v13)
  {
    __int128 v14 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[FTABFile createFileHandleForWritingToURL:].cold.1();
    }
  }

- (BOOL)configureFileHandleWriteDestinationForURL:(id)a3
{
  dataWriteDestination = self->_dataWriteDestination;
  self->_dataWriteDestination = 0LL;
  id v5 = a3;

  -[FTABFile createFileHandleForWritingToURL:](self, "createFileHandleForWritingToURL:", v5);
  int v6 = (NSFileHandle *)objc_claimAutoreleasedReturnValue();

  fileHandleWriteDestination = self->_fileHandleWriteDestination;
  self->_fileHandleWriteDestination = v6;

  return self->_fileHandleWriteDestination != 0LL;
}

- (void)configureDataWriteDestination
{
  fileHandleWriteDestination = self->_fileHandleWriteDestination;
  self->_fileHandleWriteDestination = 0LL;

  [MEMORY[0x189603FB8] data];
  id v4 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  dataWriteDestination = self->_dataWriteDestination;
  self->_dataWriteDestination = v4;
}

- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4
{
  fileHandleWriteDestination = self->_fileHandleWriteDestination;
  if (fileHandleWriteDestination)
  {
    LOBYTE(dataWriteDestination) = -[NSFileHandle writeBytes:length:]( fileHandleWriteDestination,  "writeBytes:length:",  a3,  a4);
  }

  else
  {
    dataWriteDestination = self->_dataWriteDestination;
    if (dataWriteDestination)
    {
      -[NSMutableData appendBytes:length:](dataWriteDestination, "appendBytes:length:", a3, a4);
      LOBYTE(dataWriteDestination) = 1;
    }
  }

  return (char)dataWriteDestination;
}

- (BOOL)writeToDestination
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  uint64_t v53 = 0LL;
  uint64_t v54 = 0LL;
  uint64_t v55 = 0LL;
  v50[0] = *(void *)&self->_generation;
  v50[1] = *(void *)-[NSData bytes](self->_bootNonce, "bytes");
  int v3 = 16 * -[NSMutableArray count](self->_subFileArray, "count");
  manifest = self->_manifest;
  if (manifest)
  {
    int v5 = v3 + 48;
    unsigned int v6 = -[FTABSubfile dataLength](manifest, "dataLength");
  }

  else
  {
    unsigned int v6 = 0;
    int v5 = 0;
  }

  int v51 = v5;
  unsigned int v52 = v6;
  uint64_t v54 = *(void *)-[NSData bytes](self->_magic, "bytes");
  LODWORD(v55) = -[NSMutableArray count](self->_subFileArray, "count");
  if (!-[FTABFile writeBytes:length:](self, "writeBytes:length:", v50, 48LL))
  {
    uint64_t v7 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FTABFile writeToDestination].cold.4(v7, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_31;
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  uint64_t v7 = self->_subFileArray;
  uint64_t v8 = -[os_log_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v44,  v49,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = v3 + v6 + 48;
    uint64_t v11 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v7);
        }
        __int128 v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v42 = 0LL;
        uint64_t v43 = 0LL;
        id v14 = [v13 tag];
        LODWORD(v42) = *(_DWORD *)[v14 UTF8String];

        HIDWORD(v42) = v10;
        LODWORD(v43) = [v13 dataLength];
        if (!-[FTABFile writeBytes:length:](self, "writeBytes:length:", &v42, 16LL))
        {
          v29 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[FTABFile writeToDestination].cold.3(v13);
          }
LABEL_30:

          goto LABEL_31;
        }

        v10 += [v13 dataLength];
      }

      uint64_t v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v44,  v49,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = self->_manifest;
  if (v15
    && !-[FTABFile writeBytes:length:]( self,  "writeBytes:length:",  -[FTABSubfile dataPointer](v15, "dataPointer"),  -[FTABSubfile dataLength](self->_manifest, "dataLength")))
  {
    uint64_t v7 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FTABFile writeToDestination].cold.2(v7, v31, v32, v33, v34, v35, v36, v37);
    }
LABEL_31:
    BOOL v21 = 0;
    goto LABEL_32;
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  uint64_t v7 = self->_subFileArray;
  uint64_t v16 = -[os_log_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v38,  v48,  16LL);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    while (2)
    {
      for (uint64_t j = 0LL; j != v17; ++j)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v7);
        }
        uint64_t v20 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        if (!-[FTABFile writeBytes:length:]( self,  "writeBytes:length:",  objc_msgSend(v20, "dataPointer", (void)v38),  objc_msgSend(v20, "dataLength")))
        {
          v29 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[FTABFile writeToDestination].cold.1(v20);
          }
          goto LABEL_30;
        }
      }

      uint64_t v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v38,  v48,  16LL);
      BOOL v21 = 1;
      if (v17) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v21 = 1;
  }

- (BOOL)writeToURL:(id)a3
{
  id v4 = a3;
  if (-[FTABFile configureFileHandleWriteDestinationForURL:](self, "configureFileHandleWriteDestinationForURL:", v4))
  {
    BOOL v5 = -[FTABFile writeToDestination](self, "writeToDestination");
    fileHandleWriteDestination = self->_fileHandleWriteDestination;
    self->_fileHandleWriteDestination = 0LL;
  }

  else
  {
    uint64_t v7 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FTABFile writeToURL:].cold.1(v4);
    }

    BOOL v5 = 0;
  }

  return v5;
}

- (id)writeToData
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  dataWriteDestination = self->_dataWriteDestination;
  self->_dataWriteDestination = 0LL;

  return v3;
}

- (BOOL)writeSubfileToURL:(id)a3 tag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[FTABFile subfileWithTag:](self, "subfileWithTag:", v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[FTABFile createFileHandleForWritingToURL:](self, "createFileHandleForWritingToURL:", v6);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9) {
      char v10 = objc_msgSend( v9,  "writeBytes:length:",  objc_msgSend(v8, "dataPointer"),  objc_msgSend(v8, "dataLength"));
    }
    else {
      char v10 = 0;
    }
  }

  else
  {
    uint64_t v11 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FTABFile writeSubfileToURL:tag:].cold.1();
    }

    char v10 = 0;
  }

  return v10;
}

- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4 handle:(id)a5
{
  id v7 = (void *)MEMORY[0x189603F48];
  id v8 = a5;
  [v7 dataWithBytes:a3 length:a4];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = [v8 uarpWriteData:v9 error:0];

  return (char)a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = -[FTABFile initWithData:](objc_alloc(&OBJC_CLASS___FTABFile), "initWithData:", v3);

  return v4;
}

- (const)filePointer
{
  return self->_filePointer;
}

- (unint64_t)fileLength
{
  return self->_fileLength;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 64LL, 1);
}

- (unsigned)generation
{
  return self->_generation;
}

- (unsigned)valid
{
  return self->_valid;
}

- (NSData)bootNonce
{
  return (NSData *)objc_getProperty(self, a2, 72LL, 1);
}

- (NSData)magic
{
  return (NSData *)objc_getProperty(self, a2, 80LL, 1);
}

- (FTABSubfile)manifest
{
  return (FTABSubfile *)objc_getProperty(self, a2, 88LL, 1);
}

- (void).cxx_destruct
{
}

- (void)initWithContentsOfURL:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_189540000, v0, v1, "%s: Unable to open file at %@ (%@)", v2);
  OUTLINED_FUNCTION_3_2();
}

- (void)parseFileData
{
}

- (void)addSubfileWithTagName:contentsOfURL:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_189540000, v0, v1, "%s: Unable to open file at %@ (%@)", v2);
  OUTLINED_FUNCTION_3_2();
}

- (void)createFileHandleForWritingToURL:.cold.1()
{
}

- (void)createFileHandleForWritingToURL:(void *)a1 .cold.2(void *a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_2(&dword_189540000, v2, v3, "Unable to create file at %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9_0();
}

- (void)createFileHandleForWritingToURL:(void *)a1 .cold.3(void *a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_2(&dword_189540000, v2, v3, "Unable to delete file at %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9_0();
}

- (void)writeToDestination
{
}

- (void)writeToURL:(void *)a1 .cold.1(void *a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_2(&dword_189540000, v2, v3, "Failed to open file handle for writing to '%@'", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9_0();
}

- (void)writeSubfileToURL:tag:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_2(&dword_189540000, v0, v1, "Unable to locate subfile with tag '%@'", v2);
  OUTLINED_FUNCTION_3();
}

@end