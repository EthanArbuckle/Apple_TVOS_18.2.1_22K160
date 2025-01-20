@interface PS190FirmwareFile
- (BOOL)parseBundle;
- (BOOL)setIMG4Data:(id)a3;
- (NSArray)blocks;
- (NSData)bundleData;
- (NSString)dumpBlocksString;
- (NSString)dumpString;
- (NSString)versionString;
- (PS190FirmwareFile)initWithData:(id)a3;
- (PS190FirmwareFile)initWithFile:(id)a3;
- (PS190RawAppFirmwareVersion)version;
- (const)dmemImage;
- (const)imemImage;
- (const)img4Object;
- (id)generateDigest;
- (unsigned)checksum;
- (unsigned)crc32ForBlocksInRange:(_NSRange)a3;
- (unsigned)dmemSize;
- (unsigned)imemSize;
- (void)clearIMG4Data;
- (void)initBlocks;
- (void)parseBundle;
- (void)setEmptyIMG4Data;
@end

@implementation PS190FirmwareFile

- (PS190FirmwareFile)initWithData:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PS190FirmwareFile;
  v5 = -[PS190FirmwareFile init](&v14, sel_init);
  if (v5)
  {
    os_log_t v6 = os_log_create("com.apple.accessoryupdater.ps190", "firmwareFile");
    log = v5->_log;
    v5->_log = v6;

    uint64_t v8 = [v4 copy];
    bundleData = v5->_bundleData;
    v5->_bundleData = (NSData *)v8;

    if (!-[PS190FirmwareFile parseBundle](v5, "parseBundle"))
    {
      v12 = 0LL;
      goto LABEL_6;
    }

    v10 = (NSArray *)(id)[MEMORY[0x189603F18] array];
    blocks = v5->_blocks;
    v5->_blocks = v10;
  }

  v12 = v5;
LABEL_6:

  return v12;
}

- (PS190FirmwareFile)initWithFile:(id)a3
{
  id v4 = (id)[a3 stringByExpandingTildeInPath];
  id v5 = (id)[MEMORY[0x1896078A8] defaultManager];
  id v6 = (id)[v5 contentsAtPath:v4];

  if (v6)
  {
    self = -[PS190FirmwareFile initWithData:](self, "initWithData:", v6);
    v7 = self;
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (void)initBlocks
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  NSUInteger v3 = -[NSData length](self->_personalizedBundleData, "length");
  id v4 = -[NSData bytes](self->_personalizedBundleData, "bytes");
  id v5 = (id)[MEMORY[0x189603FA8] array];
  if (v3)
  {
    unsigned __int8 v6 = 0;
    do
    {
      if (v3 <= 0xFFF) {
        uint64_t v7 = v3;
      }
      else {
        uint64_t v7 = 4096LL;
      }
      if (v3 < 0x1000)
      {
        bzero(v14, 0x1000uLL);
        __memcpy_chk();
        memset(&v14[v3], 255, 4096 - v3);
        uint64_t v8 = objc_alloc(&OBJC_CLASS___PS190FirmwareBlock);
        uint64_t v9 = v6;
        v10 = v14;
      }

      else
      {
        uint64_t v8 = objc_alloc(&OBJC_CLASS___PS190FirmwareBlock);
        uint64_t v9 = v6;
        v10 = v4;
      }

      v11 = -[PS190FirmwareBlock initWithNumber:bytes:](v8, "initWithNumber:bytes:", v9, v10);
      [v5 addObject:v11];
      v3 -= v7;
      v4 += v7;
      ++v6;
    }

    while (v3);
  }

  v12 = (NSArray *)(id)[MEMORY[0x189603F18] arrayWithArray:v5];
  blocks = self->_blocks;
  self->_blocks = v12;
}

- (BOOL)setIMG4Data:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5 >= 0xC01)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PS190FirmwareFile setIMG4Data:].cold.1(log, v12, v13);
    }
  }

  else
  {
    id v6 = (id)[MEMORY[0x189603FB8] dataWithData:v4];
    size_t v7 = 4096 - [v4 length];
    uint64_t v8 = malloc(v7);
    memset(v8, 255, v7);
    [v6 appendBytes:v8 length:v7];
    free(v8);
    [v6 appendData:self->_bundleData];
    uint64_t v9 = (NSData *)(id)[MEMORY[0x189603F48] dataWithData:v6];
    personalizedBundleData = self->_personalizedBundleData;
    self->_personalizedBundleData = v9;

    self->_img4Object = (const char *)-[NSData bytes](self->_personalizedBundleData, "bytes");
    -[PS190FirmwareFile initBlocks](self, "initBlocks");
  }

  return v5 < 0xC01;
}

- (void)setEmptyIMG4Data
{
  NSUInteger v3 = malloc(0xC00uLL);
  memset(v3, 255, 0xC00uLL);
  id v4 = (id)[MEMORY[0x189603F48] dataWithBytes:v3 length:3072];
  -[PS190FirmwareFile setIMG4Data:](self, "setIMG4Data:", v4);
  free(v3);
}

- (void)clearIMG4Data
{
  self->_img4Object = 0LL;
  personalizedBundleData = self->_personalizedBundleData;
  self->_personalizedBundleData = 0LL;

  id v4 = (NSArray *)(id)[MEMORY[0x189603F18] array];
  blocks = self->_blocks;
  self->_blocks = v4;
}

- (unsigned)crc32ForBlocksInRange:(_NSRange)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  NSUInteger v3 = -[NSArray subarrayWithRange:](self->_blocks, "subarrayWithRange:", a3.location, a3.length);
  id v4 = (id)[MEMORY[0x189603FB8] data];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  unint64_t v5 = v3;
  uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend( v4,  "appendBytes:length:",  objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8++), "bytes", (void)v12),  4096);
      }

      while (v6 != v8);
      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  id v9 = v4;
  unsigned int v10 = computeCRC32((const Bytef *)[v9 bytes], objc_msgSend(v9, "length"));

  return v10;
}

- (BOOL)parseBundle
{
  NSUInteger v3 = -[NSData length](self->_bundleData, "length");
  id v4 = -[NSData bytes](self->_bundleData, "bytes");
  if (v3 > 0x20A)
  {
    self->_version.majorField = *((_BYTE *)v4 + 520);
    self->_version.minor = *((_BYTE *)v4 + 521);
    unsigned __int8 v9 = *((_BYTE *)v4 + 522);
    unint64_t v10 = bswap32(*v4);
    self->_imemSize = v10;
    uint64_t v11 = bswap32(v4[1]);
    self->_dmemSize = v11;
    self->_version.sub = v9;
    BOOL v12 = v3 - 8 >= v10;
    unint64_t v13 = v3 - 8 - v10;
    if (v12)
    {
      self->_imemImage = (const char *)(v4 + 2);
      if (v13 >= v11)
      {
        __int128 v14 = (char *)v4 + v10 + 8;
        self->_dmemImage = v14;
        if (v13 != v11)
        {
          self->_checksum = v14[v11];
          LOBYTE(v6) = 1;
          return v6;
        }

        log = self->_log;
        BOOL v6 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
        if (v6)
        {
          -[PS190FirmwareFile parseBundle].cold.4(log, v16, v17);
          goto LABEL_13;
        }
      }

      else
      {
        BOOL v6 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
        if (v6)
        {
          -[PS190FirmwareFile parseBundle].cold.3();
          goto LABEL_13;
        }
      }
    }

    else
    {
      BOOL v6 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
      if (v6)
      {
        -[PS190FirmwareFile parseBundle].cold.2();
        goto LABEL_13;
      }
    }
  }

  else
  {
    unint64_t v5 = self->_log;
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      -[PS190FirmwareFile parseBundle].cold.1(v5, v7, v8);
LABEL_13:
      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

- (id)generateDigest
{
  return PS190GenerateDigest(self->_bundleData);
}

- (NSString)dumpString
{
  NSUInteger v3 = (void *)MEMORY[0x189607940];
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  id v6 = (id)[v3 stringWithFormat:@"%@\n", v5];

  uint64_t v7 = -[PS190FirmwareFile versionString](self, "versionString");
  [v6 appendFormat:@"Version: %@\n\n", v7];

  if (self->_img4Object)
  {
    [v6 appendString:@"IMG4 Object:\n"];
    id v8 = FormatHex((uint64_t)self->_img4Object, 0xC00uLL, 0);
    [v6 appendFormat:@"%@\n\n", v8];
  }

  objc_msgSend(v6, "appendFormat:", @"IMEM Image (%u bytes):\n", self->_imemSize);
  id v9 = FormatHex((uint64_t)self->_imemImage, self->_imemSize, 0);
  [v6 appendFormat:@"%@\n\n", v9];
  objc_msgSend(v6, "appendFormat:", @"DMEM Image: (%u bytes):\n", self->_dmemSize);
  id v10 = FormatHex((uint64_t)self->_dmemImage, self->_dmemSize, 0);
  [v6 appendFormat:@"%@\n\n", v10];
  objc_msgSend(v6, "appendFormat:", @"Checksum: 0x%02x", self->_checksum);
  id v11 = (id)[NSString stringWithString:v6];

  return (NSString *)v11;
}

- (NSString)dumpBlocksString
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = (id)[MEMORY[0x189607940] string];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = self->_blocks;
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (id)[*(id *)(*((void *)&v12 + 1) + 8 * v8) dumpString];
        [v3 appendFormat:@"%@\n", v9];

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  id v10 = (id)[NSString stringWithString:v3];
  return (NSString *)v10;
}

- (NSString)versionString
{
  return (NSString *)PS190StringForRawAppFirmwareVersion((char *)&self->_version);
}

- (PS190RawAppFirmwareVersion)version
{
  return (PS190RawAppFirmwareVersion)(dest | (v4 << 16));
}

- (NSData)bundleData
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSArray)blocks
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (const)img4Object
{
  return self->_img4Object;
}

- (unsigned)imemSize
{
  return self->_imemSize;
}

- (unsigned)dmemSize
{
  return self->_dmemSize;
}

- (const)imemImage
{
  return self->_imemImage;
}

- (const)dmemImage
{
  return self->_dmemImage;
}

- (unsigned)checksum
{
  return self->_checksum;
}

- (void).cxx_destruct
{
}

- (void)setIMG4Data:(uint64_t)a3 .cold.1(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 136315138;
  unsigned __int8 v4 = "-[PS190FirmwareFile setIMG4Data:]";
  OUTLINED_FUNCTION_0_1(&dword_188FDB000, a1, a3, "%s: IMG4 data too large", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)crc32ForBlocksInRange:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  objc_begin_catch(a1);
  unsigned __int8 v4 = *(os_log_s **)(a3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[PS190FirmwareFile crc32ForBlocksInRange:]";
    OUTLINED_FUNCTION_0_1(&dword_188FDB000, v4, v5, "%s: Invalid range specified", (uint8_t *)&v6);
  }

  objc_end_catch();
  OUTLINED_FUNCTION_3_0();
}

- (void)parseBundle
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 136315138;
  unsigned __int8 v4 = "-[PS190FirmwareFile parseBundle]";
  OUTLINED_FUNCTION_0_1(&dword_188FDB000, a1, a3, "%s: Firmware file is too small (checksum)", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end