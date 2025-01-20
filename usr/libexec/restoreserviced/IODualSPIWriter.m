@interface IODualSPIWriter
- (BOOL)_crossingRegionChangeBoundary;
- (BOOL)_headerMatchesBootSFRManifestHash:(id)a3;
- (BOOL)_usesExtendediBootRegion;
- (BOOL)headerIsInvalid:(id)a3;
- (BOOL)usesAFUH;
- (BOOL)verifyFirmwareAtIndex:(unint64_t)a3 againstData:(id)a4;
- (BOOL)verifyHeadersAtIndex:(unint64_t)a3;
- (IODualSPIWriter)initWithService:(unsigned int)a3;
- (NSData)regData;
- (NSMutableArray)invalidHeaders;
- (const)regBuffer;
- (const)regStruct;
- (id)_getSFRManifestHashForPayload:(id)a3;
- (id)_loadRegionLayout:(unsigned int)a3;
- (id)findHeaders;
- (id)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4;
- (int)_commitHeader:(id)a3 withError:(id *)a4;
- (int)_writeBytes:(char *)a3 atOffset:(unsigned int)a4 ofLength:(unsigned int)a5 withError:(id *)a6;
- (int)_writeFirmware:(id)a3 toHeader:(id)a4 withError:(id *)a5;
- (int)commitHeaderAtIndex:(unint64_t)a3 withError:(id *)a4;
- (int)commitPreparedHeaderWithError:(id *)a3;
- (int)eraseBytes:(unsigned int)a3 ofLength:(unsigned int)a4 withError:(id *)a5;
- (int)openService;
- (int)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4 intoBuffer:(void *)a5;
- (int)writeData:(id)a3 withError:(id *)a4;
- (int)writeFirstGenerationFirmware:(id)a3 withError:(id *)a4;
- (int)writeNewerGenerationFirmware:(id)a3 withError:(id *)a4;
- (unint64_t)findPreparedHeader;
- (unsigned)_findFirmwareInfoEntry;
- (unsigned)_maxExtendedRegionSize;
- (unsigned)_maxImageSize;
- (unsigned)regSize;
- (unsigned)spiDriverConnect;
- (void)dealloc;
- (void)markHeaderAsInvalid:(id)a3;
- (void)setInvalidHeaders:(id)a3;
- (void)setRegBuffer:(const char *)a3;
- (void)setRegData:(id)a3;
- (void)setRegSize:(unsigned int)a3;
- (void)setRegStruct:(const _reg_format_union *)a3;
- (void)setSpiDriverConnect:(unsigned int)a3;
@end

@implementation IODualSPIWriter

- (IODualSPIWriter)initWithService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IODualSPIWriter;
  v4 = -[IOServiceWriter initWithService:](&v7, "initWithService:");
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->_usesAFUH = 0;
    *((_BYTE *)&v4->super._serviceConnect + 4) = +[MSUBootFirmwareUpdater supportsAFUH]( &OBJC_CLASS___MSUBootFirmwareUpdater,  "supportsAFUH");
    *(const _reg_format_union **)((char *)&v5->_regStruct + 4) = (const _reg_format_union *)objc_msgSend( -[IODualSPIWriter _loadRegionLayout:]( v5,  "_loadRegionLayout:",  v3),  "copy");
    *(NSData **)((char *)&v5->_regData + 4) = (NSData *)objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (![*(id *)((char *)&v5->_regStruct + 4) length])
    {

      return 0LL;
    }
  }

  return v5;
}

- (unsigned)_findFirmwareInfoEntry
{
  io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/product/util");
  if (v2)
  {
    unsigned int v3 = v2;
    if (sub_10000979C(v2)) {
      return v3;
    }
    IOObjectRelease(v3);
  }

  io_iterator_t iterator = 0;
  unsigned int v3 = 0;
  if (!IORegistryCreateIterator(kIOMasterPortDefault, "IODeviceTree", 1u, &iterator))
  {
    do
    {
      io_registry_entry_t v4 = IOIteratorNext(iterator);
      unsigned int v3 = v4;
    }

    while (v4 && !sub_10000979C(v4));
    IOObjectRelease(iterator);
  }

  return v3;
}

- (id)_loadRegionLayout:(unsigned int)a3
{
  io_registry_entry_t v4 = -[IODualSPIWriter _findFirmwareInfoEntry](self, "_findFirmwareInfoEntry");
  if (v4)
  {
    io_object_t v5 = v4;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v4, @"fw-regions", 0LL, 0);
    objc_super v7 = (id)CFMakeCollectable(CFProperty);
    IOObjectRelease(v5);
  }

  else
  {
    objc_super v7 = 0LL;
  }

  if (![v7 length])
  {
    CFTypeRef v8 = IORegistryEntrySearchCFProperty(a3, "IOService", @"reg", 0LL, 3u);
    objc_super v7 = (id)CFMakeCollectable(v8);
    if (![v7 length])
    {
      iBU_LOG_real( (uint64_t)@"Found none of the required DT Properties (looked for 'low-level-fw-device-info' and 'reg')",  "-[IODualSPIWriter _loadRegionLayout:]",  v9,  v10,  v11,  v12,  v13,  v14,  v16);
      return 0LL;
    }
  }

  return v7;
}

- (int)writeData:(id)a3 withError:(id *)a4
{
  if (-[IOServiceWriter isErase](self, "isErase")) {
    return -[IODualSPIWriter writeFirstGenerationFirmware:withError:]( self,  "writeFirstGenerationFirmware:withError:",  a3,  a4);
  }
  else {
    return -[IODualSPIWriter writeNewerGenerationFirmware:withError:]( self,  "writeNewerGenerationFirmware:withError:",  a3,  a4);
  }
}

- (int)openService
{
  kern_return_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFStringRef v3 = IORegistryEntryCopyPath(-[IOServiceWriter service](self, "service"), "IOService");
  if (*(_DWORD *)&self->_usesAFUH) {
    return 0;
  }
  CFStringRef v11 = v3;
  if (v3)
  {
    iBU_LOG_real( (uint64_t)@"Matched service is: %@",  "-[IODualSPIWriter openService]",  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)v3);
    CFRelease(v11);
  }

  io_service_t v12 = -[IOServiceWriter service](self, "service");
  uint64_t v13 = IOServiceOpen(v12, mach_task_self_, 0, (io_connect_t *)&self->_usesAFUH);
  *(void *)(&self->_regSize + 1) = [*(id *)((char *)&self->_regStruct + 4) bytes];
  *(const char **)((char *)&self->_regBuffer + 4) = (const char *)[*(id *)((char *)&self->_regStruct + 4) bytes];
  uint64_t v14 = [*(id *)((char *)&self->_regStruct + 4) length];
  self->_spiDriverConnect = v14;
  iBU_LOG_real( (uint64_t)@"RegSize is: %d",  "-[IODualSPIWriter openService]",  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)v14);
  return v13;
}

- (unsigned)_maxImageSize
{
  unsigned int spiDriverConnect = self->_spiDriverConnect;
  if (spiDriverConnect != 40)
  {
    if (spiDriverConnect == 32) {
      return 0x200000;
    }
    if (spiDriverConnect != 24)
    {
      unsigned int v9 = 0x200000;
      iBU_LOG_real( (uint64_t)@"Unknown reg region size of %d. Returning the default iBootMaxPayloadSize of 0x%x",  "-[IODualSPIWriter _maxImageSize]",  v2,  v3,  v4,  v5,  v6,  v7,  self->_spiDriverConnect);
      return v9;
    }
  }

  return (*(_DWORD **)((char *)&self->_regBuffer + 4))[3];
}

- (unsigned)_maxExtendedRegionSize
{
  if (self->_spiDriverConnect == 40) {
    return (*(_DWORD **)((char *)&self->_regBuffer + 4))[7];
  }
  else {
    return 0;
  }
}

- (BOOL)_usesExtendediBootRegion
{
  return self->_spiDriverConnect == 40;
}

- (BOOL)_crossingRegionChangeBoundary
{
  unsigned int spiDriverConnect = self->_spiDriverConnect;
  io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen");
  CFTypeRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, @"board-id", kCFAllocatorDefault, 0);
  uint64_t v5 = (const __CFData *)IORegistryEntryCreateCFProperty(v3, @"chip-id", kCFAllocatorDefault, 0);
  uint64_t v6 = *(unsigned int *)CFDataGetBytePtr(CFProperty);
  uint64_t v7 = *(unsigned int *)CFDataGetBytePtr(v5);
  v14[0] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 8LL);
  v14[1] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 9LL);
  v14[2] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 10LL);
  v14[3] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 11LL);
  v14[4] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 12LL);
  v14[5] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 13LL);
  v14[6] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 15LL);
  v14[7] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 4LL);
  v14[8] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 5LL);
  v14[9] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 16LL);
  uint64_t v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 10LL);
  v13[1] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  24577LL,  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 24576LL));
  v13[2] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 24578LL);
  unsigned int v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 3LL);
  unsigned int v10 = -[NSArray containsObject:]( v8,  "containsObject:",  +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  unsigned __int8 v11 = 0;
  if (v10) {
    unsigned __int8 v11 = -[NSArray containsObject:]( v9,  "containsObject:",  +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v7));
  }
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v3) {
    IOObjectRelease(v3);
  }
  if (spiDriverConnect == 24) {
    return v11;
  }
  else {
    return 0;
  }
}

- (id)_getSFRManifestHashForPayload:(id)a3
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  uint64_t v6 = objc_autoreleasePoolPush();
  -[NSMutableData appendData:]( v5,  "appendData:",  -[IODualSPIWriter readDataAtOffset:ofLength:]( self,  "readDataAtOffset:ofLength:",  [a3 imageAddress],  -[IODualSPIWriter _maxImageSize](self, "_maxImageSize")));
  if (-[IODualSPIWriter _usesExtendediBootRegion](self, "_usesExtendediBootRegion")) {
    -[NSMutableData appendData:]( v5,  "appendData:",  -[IODualSPIWriter readDataAtOffset:ofLength:]( self,  "readDataAtOffset:ofLength:",  [a3 secondaryPayloadOffset],  -[IODualSPIWriter _maxExtendedRegionSize](self, "_maxExtendedRegionSize")));
  }
  objc_autoreleasePoolPop(v6);
  uint64_t v12 = 0LL;
  uint64_t v17 = 0LL;
  memset(v16, 0, sizeof(v16));
  data = 0LL;
  CC_LONG len = 0;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  *(_OWORD *)md = 0u;
  if (!v5
    || Img4DecodeParseLengthFromBuffer( -[NSMutableData bytes](v5, "bytes"),  -[IODualSPIWriter _maxImageSize](self, "_maxImageSize"),  &v12)
    || (id v7 = -[NSMutableData bytes](v5, "bytes"), Img4DecodeInit(v7, v12, v16)))
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    Img4DecodeGetManifest(v16, &data, &len);
    CC_SHA384(data, len, md);
    uint64_t v8 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", md, 48LL);
  }

  return v8;
}

- (BOOL)_headerMatchesBootSFRManifestHash:(id)a3
{
  uint64_t v5 = objc_autoreleasePoolPush();
  id v6 = -[IODualSPIWriter _getSFRManifestHashForPayload:](self, "_getSFRManifestHashForPayload:", a3);
  io_registry_entry_t v7 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen/secure-boot-hashes");
  LOBYTE(v6) = objc_msgSend( v6,  "isEqualToData:",  IORegistryEntryCreateCFProperty( v7,  @"sfr-manifest-hash",  kCFAllocatorDefault,  0));
  objc_autoreleasePoolPop(v5);
  return (char)v6;
}

- (int)writeNewerGenerationFirmware:(id)a3 withError:(id *)a4
{
  id v6 = 0LL;
  uint64_t v7 = 1LL;
  do
  {
    if (v6) {

    }
    id v6 = -[IODualSPIWriter findHeaders](self, "findHeaders");
    if ((unint64_t)[v6 count] <= 1)
    {
      if (a4)
      {
        id v112 = [v6 count];
        *a4 = MSUBootFirmwareError( -536870167LL,  0LL,  (uint64_t)@"writeNewerGenerationFirmware: couldn't find enough headers (only found %d of %d)",  v113,  v114,  v115,  v116,  v117,  (uint64_t)v112);
      }

      int v111 = -536870167;
      goto LABEL_54;
    }

    id v8 = [v6 objectAtIndex:0];
    id v9 = [v6 objectAtIndex:1];
    unsigned int v10 = [v8 headerGeneration];
    else {
      id v17 = v8;
    }
    if (v8 == v17) {
      v18 = v9;
    }
    else {
      v18 = v8;
    }
    uint64_t v122 = 0LL;
    iBU_LOG_real( (uint64_t)@"Older header: %@",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)v17);
    iBU_LOG_real( (uint64_t)@"Newer header: %@",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)v18);
    unsigned int v25 = [v17 isValid];
    unsigned int v26 = [v18 isValid];
    int v33 = v26 ^ 1;
    if (((v25 ^ 1) & 1) == 0 && (v33 & 1) == 0)
    {
      iBU_LOG_real( (uint64_t)@"Both headers are valid. Checking to see which one we're booted from.",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v27,  v28,  v29,  v30,  v31,  v32,  v119);
      if (!-[IODualSPIWriter usesAFUH](self, "usesAFUH"))
      {
        [v18 headerGeneration];
        iBU_LOG_real( (uint64_t)@"Both headers are valid. Selecting older header %@ (vs gc=0x%x).",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v46,  v47,  v48,  v49,  v50,  v51,  (uint64_t)v17);
        goto LABEL_26;
      }

      if (-[IODualSPIWriter _headerMatchesBootSFRManifestHash:](self, "_headerMatchesBootSFRManifestHash:", v18))
      {
        iBU_LOG_real( (uint64_t)@"Overwriting older header %@ because we're booted from the newer header.",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v34,  v35,  v36,  v37,  v38,  v39,  (uint64_t)v17);
LABEL_26:
        id v8 = v17;
        goto LABEL_27;
      }

      if (!-[IODualSPIWriter _headerMatchesBootSFRManifestHash:](self, "_headerMatchesBootSFRManifestHash:", v17))
      {
        [v18 headerGeneration];
        iBU_LOG_real( (uint64_t)@"Both headers are valid and we're not booted from either? Selecting older header %@ (vs gc=0x%x).",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v58,  v59,  v60,  v61,  v62,  v63,  (uint64_t)v17);
        goto LABEL_26;
      }

      iBU_LOG_real( (uint64_t)@"Overwriting newer header %@ because we're booted from the older header.",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v52,  v53,  v54,  v55,  v56,  v57,  (uint64_t)v18);
      goto LABEL_23;
    }

    if (((v25 ^ 1 | v26) & 1) == 0)
    {
      iBU_LOG_real( (uint64_t)@"Older header is valid, newer is not. Selecting newer header %@",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v27,  v28,  v29,  v30,  v31,  v32,  (uint64_t)v18);
LABEL_23:
      id v8 = v18;
      v18 = v17;
      goto LABEL_27;
    }

    if (((v25 | v33) & 1) == 0)
    {
      iBU_LOG_real( (uint64_t)@"Newer header is valid, older is not. Selecting older header %@",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v27,  v28,  v29,  v30,  v31,  v32,  (uint64_t)v17);
      goto LABEL_26;
    }

    [v8 setHeaderGeneration:0];
    iBU_LOG_real( (uint64_t)@"Neither header is valid. Setting header0 to gen0.",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v40,  v41,  v42,  v43,  v44,  v45,  v119);
    v18 = v9;
LABEL_27:
    if ([v8 headerGeneration] == -1
      && [v18 headerGeneration] == -1)
    {
      unint64_t v65 = 0LL;
    }

    else
    {
      unsigned int v64 = [v8 headerGeneration];
      unint64_t v65 = (unint64_t)[v18 headerGeneration];
      if (v64 != -1)
      {
        id v66 = [v8 headerGeneration];
        unsigned int v67 = v66;
        if ((_DWORD)v65 == -1)
        {
          unint64_t v65 = (unint64_t)v66;
        }

        else
        {
          unsigned int v68 = [v18 headerGeneration];
          if (v67 <= v68) {
            unint64_t v65 = v68;
          }
          else {
            unint64_t v65 = v67;
          }
        }
      }
    }

    [v8 setHeaderGeneration:v65];
    [v8 bumpGeneration];
    [v8 invalidate];
    if (-[IODualSPIWriter _usesExtendediBootRegion](self, "_usesExtendediBootRegion")
      && -[IODualSPIWriter _crossingRegionChangeBoundary](self, "_crossingRegionChangeBoundary"))
    {
      self->_unsigned int spiDriverConnect = 40;
      *(const char **)((char *)&self->_regBuffer + 4) = (const char *)&unk_100019BE4;
      [v8 setImageAddress:0x20000];
      [v8 setSecondaryPayloadOffset:0x400000];
    }

    iBU_LOG_real( (uint64_t)@"Writing updated header and images.",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v69,  v70,  v71,  v72,  v73,  v74,  v120);
    unsigned int v75 = -[IODualSPIWriter _writeFirmware:toHeader:withError:]( self,  "_writeFirmware:toHeader:withError:",  a3,  v8,  &v122);
    id v76 = [v8 headerGeneration];
    [v8 startLocation];
    if (v75)
    {
      iBU_LOG_real( (uint64_t)@"Failed to write newer-generation firmware images to update header with generation 0x%x at offset 0x%x. Invalidating this header, then trying again with a different header.",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v77,  v78,  v79,  v80,  v81,  v82,  (uint64_t)v76);
    }

    else
    {
      iBU_LOG_real( (uint64_t)@"Successfully wrote newer-generation firmware images to update header with generation 0x%x at offset 0x%x.",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v77,  v78,  v79,  v80,  v81,  v82,  (uint64_t)v76);
      if (!-[IOServiceWriter shouldCommit](self, "shouldCommit")) {
        goto LABEL_53;
      }
      id v89 = [v8 headerGeneration];
      iBU_LOG_real( (uint64_t)@"Committing updated header with newer-generation 0x%x",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v90,  v91,  v92,  v93,  v94,  v95,  (uint64_t)v89);
      unsigned int v96 = -[IODualSPIWriter _commitHeader:withError:](self, "_commitHeader:withError:", v8, &v122);
      id v97 = [v8 headerGeneration];
      [v8 startLocation];
      if (!v96)
      {
        iBU_LOG_real( (uint64_t)@"Successfully committed header with newer-generation 0x%x at offset 0x%x.",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v98,  v99,  v100,  v101,  v102,  v103,  (uint64_t)v97);
LABEL_53:
        iBU_LOG_real( (uint64_t)@"Successfully wrote newer-generation firmware after %d retries.",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v83,  v84,  v85,  v86,  v87,  v88,  v7);
        int v111 = 0;
        if (!v6) {
          return v111;
        }
LABEL_54:

        return v111;
      }

      iBU_LOG_real( (uint64_t)@"Failed to commit header with newer-generation 0x%x at offset 0x%x. Invalidating this header, then trying again with a different header.",  "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]",  v98,  v99,  v100,  v101,  v102,  v103,  (uint64_t)v97);
    }

    -[IODualSPIWriter markHeaderAsInvalid:](self, "markHeaderAsInvalid:", v8);
    int v109 = v7 + 1;
    unsigned int v110 = v7 - 1;
    uint64_t v7 = (v7 + 1);
  }

  while (v110 < 0x1F);
  int v111 = -536870167;
  if (a4) {
    *a4 = MSUBootFirmwareError( -536870167LL,  0LL,  (uint64_t)@"writeNewerGenerationFirmware: couldn't find enough headers after %d retries.",  v104,  v105,  v106,  v107,  v108,  (v109 - 1));
  }
  if (v6) {
    goto LABEL_54;
  }
  return v111;
}

- (int)writeFirstGenerationFirmware:(id)a3 withError:(id *)a4
{
  id v4 = a3;
  id v6 = 0LL;
  uint64_t v7 = @"Invalidated header0 in memory. %@";
  id v8 = @"Invalidated header1 in memory. %@";
  id v9 = @"Resetting header0 to Generation 1.";
  uint64_t v10 = 1LL;
  while (1)
  {
    if (v6) {

    }
    id v6 = -[IODualSPIWriter findHeaders](self, "findHeaders");
    if ((unint64_t)[v6 count] <= 1)
    {
      id v76 = a4;
      if (a4)
      {
        uint64_t v77 = (v10 - 1);
        id v78 = [v6 count];
        *a4 = MSUBootFirmwareError( -536870167LL,  0LL,  (uint64_t)@"writeFirstGenerationFirmware: couldn't find enough headers (only found %d of %d)",  v79,  v80,  v81,  v82,  v83,  (uint64_t)v78);
LABEL_18:
        int v84 = -536870167;
        *id v76 = MSUBootFirmwareError( -536870167LL,  0LL,  (uint64_t)@"writeFirstGenerationFirmware: couldn't find enough headers after %d retries.",  v69,  v70,  v71,  v72,  v73,  v77);
        if (!v6) {
          return v84;
        }
        goto LABEL_21;
      }

- (void)markHeaderAsInvalid:(id)a3
{
}

- (BOOL)headerIsInvalid:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v4 = -[IODualSPIWriter invalidHeaders](self, "invalidHeaders", 0LL);
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)v8);
        unsigned int v10 = [a3 startLocation];
        if (v10 == [v9 startLocation])
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }

  return (char)v5;
}

- (int)commitHeaderAtIndex:(unint64_t)a3 withError:(id *)a4
{
  id v7 = -[IODualSPIWriter findHeaders](self, "findHeaders");
  if ((unint64_t)[v7 count] >= a3 + 1)
  {
    int v8 = -[IODualSPIWriter _commitHeader:withError:]( self,  "_commitHeader:withError:",  [v7 objectAtIndex:a3],  a4);
  }

  else
  {
    int v8 = -536870212;
    if (a4)
    {
      id v9 = [v7 count];
      *a4 = MSUBootFirmwareError( -536870212LL,  0LL,  (uint64_t)@"commitHeaderAtIndex: couldn't find enough headers (only found %d of %d)",  v10,  v11,  v12,  v13,  v14,  (uint64_t)v9);
    }
  }

  return v8;
}

- (int)commitPreparedHeaderWithError:(id *)a3
{
  unint64_t v5 = -[IODualSPIWriter findPreparedHeader](self, "findPreparedHeader");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    return -[IODualSPIWriter commitHeaderAtIndex:withError:](self, "commitHeaderAtIndex:withError:", v5, a3);
  }
  if (a3) {
    *a3 = MSUBootFirmwareError( -536870212LL,  0LL,  (uint64_t)@"commitPreparedHeader: couldn't find valid preparedHeader",  v6,  v7,  v8,  v9,  v10,  v12);
  }
  return -536870212;
}

- (unint64_t)findPreparedHeader
{
  id v2 = -[IODualSPIWriter findHeaders](self, "findHeaders");
  if ((unint64_t)[v2 count] > 1)
  {
    id v11 = [v2 objectAtIndexedSubscript:0];
    id v12 = [v2 objectAtIndexedSubscript:1];
    id v13 = [v11 compareTo:v12];
    iBU_LOG_real( (uint64_t)@"Header0: %@",  "-[IODualSPIWriter findPreparedHeader]",  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)v11);
    iBU_LOG_real( (uint64_t)@"Header1: %@",  "-[IODualSPIWriter findPreparedHeader]",  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)v12);
    uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    if (v13 == (id)1) {
      uint64_t v26 = 0LL;
    }
    if (v13 == (id)-1LL) {
      unint64_t v10 = 1LL;
    }
    else {
      unint64_t v10 = v26;
    }
  }

  else
  {
    id v3 = [v2 count];
    iBU_LOG_real( (uint64_t)@"Error: findPreparedHeader: couldn't find enough headers (found %d of 2)",  "-[IODualSPIWriter findPreparedHeader]",  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)v3);
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (id)findHeaders
{
  if (-[IODualSPIWriter usesAFUH](self, "usesAFUH"))
  {
    -[IODualSPIWriter _maxImageSize](self, "_maxImageSize");
    v79[0] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 0x20000LL);
    v79[1] = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[IODualSPIWriter _maxImageSize](self, "_maxImageSize") + 0x20000);
    uint64_t v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v79, 2LL);
    id v10 = -[NSArray mutableCopy](v9, "mutableCopy");
    unsigned int v76 = -[IODualSPIWriter _usesExtendediBootRegion](self, "_usesExtendediBootRegion");
    if (v76)
    {
      v78[0] = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  (*(unsigned int **)((char *)&self->_regBuffer + 4))[6]);
      v78[1] = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  (*(unsigned int **)((char *)&self->_regBuffer + 4))[8]);
      id v77 = -[NSArray mutableCopy]( +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v78, 2LL),  "mutableCopy");
    }

    else
    {
      id v77 = 0LL;
    }

    uint64_t v32 = -[NSArray count](v9, "count");
    uint64_t v33 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 32LL);
    uint64_t v34 = 0LL;
    unint64_t v35 = 0LL;
    do
    {
      uint64_t v36 = -[MSUiBootHeaderV2 initWithIOServiceWriter:]( objc_alloc(&OBJC_CLASS___MSUiBootHeaderV2),  "initWithIOServiceWriter:",  self);
      -[MSUiBootHeaderV2 loadHeaderAtOffset:](v36, "loadHeaderAtOffset:", v34);
      if (-[MSUiBootHeaderV2 validHeaderSignature](v36, "validHeaderSignature")
        && -[NSArray containsObject:]( v9,  "containsObject:",  +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[MSUiBootHeader imageAddress](v36, "imageAddress")))
        && !-[IODualSPIWriter headerIsInvalid:](self, "headerIsInvalid:", v36))
      {
        objc_msgSend( v10,  "removeObject:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  -[MSUiBootHeader imageAddress](v36, "imageAddress")));
        objc_msgSend( v77,  "removeObject:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  -[MSUiBootHeaderV2 secondaryPayloadOffset](v36, "secondaryPayloadOffset")));
        -[NSMutableArray insertObject:atIndex:](v33, "insertObject:atIndex:", v36, v35++);
      }

      else
      {
        -[MSUiBootHeader setImageAddress:](v36, "setImageAddress:", 0LL);
        -[MSUiBootHeaderV2 setSecondaryPayloadOffset:](v36, "setSecondaryPayloadOffset:", 0LL);
        -[NSMutableArray addObject:](v33, "addObject:", v36);
      }

      BOOL v37 = v34 == 126976;
      v34 += 4096LL;
    }

    while (!v37);
    -[NSMutableArray removeObjectsInRange:]( v33,  "removeObjectsInRange:",  v32,  (_BYTE *)-[NSMutableArray count](v33, "count") - v32);
    if (-[NSMutableArray count](v33, "count") < v32)
    {
      id v44 = -[NSMutableArray count](v33, "count");
      iBU_LOG_real( (uint64_t)@"Fatal error: Only found %d of the required %d AFUH-style headers.",  "-[IODualSPIWriter findHeaders]",  v45,  v46,  v47,  v48,  v49,  v50,  (uint64_t)v44);
      return objc_alloc_init(&OBJC_CLASS___NSArray);
    }

    iBU_LOG_real( (uint64_t)@"AFUH style header",  "-[IODualSPIWriter findHeaders]",  v38,  v39,  v40,  v41,  v42,  v43,  v74);
    if (-[NSMutableArray count](v33, "count"))
    {
      for (unint64_t i = 0LL; i < (unint64_t)-[NSMutableArray count](v33, "count"); ++i)
      {
        id v52 = -[NSMutableArray objectAtIndexedSubscript:](v33, "objectAtIndexedSubscript:", i);
        [v52 startLocation];
        iBU_LOG_real( (uint64_t)@"iBootHeader%lu loaded from offset: 0x%08lx (slot %lu)",  "-[IODualSPIWriter findHeaders]",  v53,  v54,  v55,  v56,  v57,  v58,  i);
        if (![v52 imageAddress] || objc_msgSend(v52, "imageAddress") == -1)
        {
          id v59 = objc_msgSend(objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "unsignedIntegerValue");
          [v10 removeObjectAtIndex:0];
          [v52 setImageAddress:v59];
          iBU_LOG_real( (uint64_t)@"iBootHeader%lu payload is missing; using next available: 0x%08lx",
            "-[IODualSPIWriter findHeaders]",
            v60,
            v61,
            v62,
            v63,
            v64,
            v65,
            i);
        }

        if ([v52 secondaryPayloadOffset])
        {
          else {
            char v66 = 0;
          }
          if ((v66 & 1) == 0) {
            continue;
          }
        }

        else if (!v76)
        {
          continue;
        }

        id v67 = objc_msgSend(objc_msgSend(v77, "objectAtIndexedSubscript:", 0), "unsignedIntegerValue");
        [v77 removeObjectAtIndex:0];
        objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:](v33, "objectAtIndexedSubscript:", i),  "setSecondaryPayloadOffset:",  v67);
        iBU_LOG_real( (uint64_t)@"iBootHeader%lu secondary payload is missing, using next available: 0x%08lx",  "-[IODualSPIWriter findHeaders]",  v68,  v69,  v70,  v71,  v72,  v73,  i);
      }
    }

    return -[NSMutableArray copy](v33, "copy");
  }

  else
  {
    iBU_LOG_real((uint64_t)@"Old style header", "-[IODualSPIWriter findHeaders]", v3, v4, v5, v6, v7, v8, v74);
    id v11 = *(unsigned int **)(&self->_regSize + 1);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[2];
    uint64_t v14 = v11[4];
    uint64_t v15 = v11[6];
    uint64_t v16 = -[MSUiBootHeader initWithIOServiceWriter:]( objc_alloc(&OBJC_CLASS___MSUiBootHeaderV1),  "initWithIOServiceWriter:",  self);
    uint64_t v17 = -[MSUiBootHeader initWithIOServiceWriter:]( objc_alloc(&OBJC_CLASS___MSUiBootHeaderV1),  "initWithIOServiceWriter:",  self);
    if (!-[MSUiBootHeaderV1 loadHeaderAtOffset:](v16, "loadHeaderAtOffset:", v14)) {
      iBU_LOG_real( (uint64_t)@"Reading iBoot0 failed?!",  "-[IODualSPIWriter findHeaders]",  v18,  v19,  v20,  v21,  v22,  v23,  v75);
    }
    -[MSUiBootHeader setImageAddress:](v16, "setImageAddress:", v12);
    if (!-[MSUiBootHeaderV1 loadHeaderAtOffset:](v17, "loadHeaderAtOffset:", v15)) {
      iBU_LOG_real( (uint64_t)@"Reading iBoot1 failed?!",  "-[IODualSPIWriter findHeaders]",  v24,  v25,  v26,  v27,  v28,  v29,  v75);
    }
    -[MSUiBootHeader setImageAddress:](v17, "setImageAddress:", v13);
    uint64_t v30 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v16, v17, 0LL);

    return v30;
  }

- (id)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4
{
  __int16 v5 = a3;
  uint64_t v7 = a3 & 0xFFFFF000;
  size_t v8 = ((a3 + a4 + 4095) & 0xFFFFF000) - v7;
  uint64_t v9 = (char *)malloc(v8);
  if (-[IODualSPIWriter readDataAtOffset:ofLength:intoBuffer:]( self,  "readDataAtOffset:ofLength:intoBuffer:",  v7,  v8,  v9))
  {
    id v10 = 0LL;
  }

  else
  {
    id v10 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v9[v5 & 0xFFF], a4);
  }

  free(v9);
  return v10;
}

- (BOOL)verifyHeadersAtIndex:(unint64_t)a3
{
  id v4 = -[IODualSPIWriter findHeaders](self, "findHeaders");
  if ((unint64_t)[v4 count] <= 1)
  {
    id v23 = [v4 count];
    iBU_LOG_real( (uint64_t)@"Only %d of 2 headers found, cannot verify",  "-[IODualSPIWriter verifyHeadersAtIndex:]",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)v23);
LABEL_9:
    BOOL v12 = 0;
    goto LABEL_10;
  }

  id v11 = [v4 objectAtIndexedSubscript:0];
  BOOL v12 = 1;
  id v13 = [v4 objectAtIndexedSubscript:1];
  id v14 = [v4 objectAtIndexedSubscript:a3];
  if (v14 == v11) {
    id v11 = v13;
  }
  if ([v11 isValid])
  {
    unsigned int v15 = [v14 headerGeneration];
    if (v15 <= [v11 headerGeneration])
    {
      [v11 headerGeneration];
      [v14 headerGeneration];
      iBU_LOG_real( (uint64_t)@"Header at partition %lu does not have a larger generation count than existing valid header (%d !> %d)",  "-[IODualSPIWriter verifyHeadersAtIndex:]",  v16,  v17,  v18,  v19,  v20,  v21,  a3);
      goto LABEL_9;
    }

    BOOL v12 = 1;
  }

- (BOOL)verifyFirmwareAtIndex:(unint64_t)a3 againstData:(id)a4
{
  id v7 = -[IODualSPIWriter findHeaders](self, "findHeaders");
  if ((unint64_t)[v7 count] >= a3 + 1)
  {
    id v16 = [v7 objectAtIndexedSubscript:a3];
    uint64_t v17 = objc_autoreleasePoolPush();
    unsigned __int8 v15 = objc_msgSend( -[IODualSPIWriter readDataAtOffset:ofLength:]( self,  "readDataAtOffset:ofLength:",  objc_msgSend(v16, "imageAddress"),  objc_msgSend(a4, "length")),  "isEqual:",  a4);
    if ((v15 & 1) == 0) {
      iBU_LOG_real( (uint64_t)@"Header %lu firmware image did not match reference firmware image (Stored %@ != Reference %@)",  "-[IODualSPIWriter verifyFirmwareAtIndex:againstData:]",  v18,  v19,  v20,  v21,  v22,  v23,  a3);
    }
    objc_autoreleasePoolPop(v17);
  }

  else
  {
    id v8 = [v7 count];
    iBU_LOG_real( (uint64_t)@"Only %d of %d necessary headers found, cannot verify",  "-[IODualSPIWriter verifyFirmwareAtIndex:againstData:]",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)v8);
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (int)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4 intoBuffer:(void *)a5
{
  input[0] = a3;
  input[1] = a4;
  size_t outputStructCnt = a4;
  iBU_LOG_real( (uint64_t)@"inputs[0] = 0x%llx; inputs[1] = 0x%llx; buf = %p; outSize = 0x%lx; &outSize = %p\n",
    "-[IODualSPIWriter readDataAtOffset:ofLength:intoBuffer:]",
    *(uint64_t *)&a3,
    *(uint64_t *)&a4,
    (uint64_t)a5,
    v5,
    v6,
    v7,
    a3);
  uint64_t v10 = IOConnectCallMethod( -[IODualSPIWriter spiDriverConnect](self, "spiDriverConnect"),  2u,  input,  2u,  0LL,  0LL,  0LL,  0LL,  a5,  &outputStructCnt);
  iBU_LOG_real( (uint64_t)@"Got result: 0x%x",  "-[IODualSPIWriter readDataAtOffset:ofLength:intoBuffer:]",  v11,  v12,  v13,  v14,  v15,  v16,  v10);
  return v10;
}

- (int)eraseBytes:(unsigned int)a3 ofLength:(unsigned int)a4 withError:(id *)a5
{
  kern_return_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t input[2];
  uint64_t v9 = *(void *)&a4;
  input[0] = a3;
  input[1] = a4;
  iBU_LOG_real( (uint64_t)@"inputs[0] = 0x%llx; inputs[1] = 0x%llx",
    "-[IODualSPIWriter eraseBytes:ofLength:withError:]",
    *(uint64_t *)&a3,
    *(uint64_t *)&a4,
    (uint64_t)a5,
    v5,
    v6,
    v7,
    a3);
  uint64_t v11 = IOConnectCallMethod(*(_DWORD *)&self->_usesAFUH, 3u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  uint64_t v17 = v11;
  if (a5 && v11) {
    *a5 = MSUBootFirmwareError( v11,  0LL,  (uint64_t)@"_eraseBytes: Failed to erase %d bytes with error %d",  v12,  v13,  v14,  v15,  v16,  v9);
  }
  return v17;
}

- (int)_writeFirmware:(id)a3 toHeader:(id)a4 withError:(id *)a5
{
  id v9 = [a4 packStructure];
  uint64_t v10 = -[NSMutableData initWithData:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithData:", a3);
  id v112 = [v9 bytes];
  uint64_t v113 = 0LL;
  unsigned int v11 = -[IODualSPIWriter _usesExtendediBootRegion](self, "_usesExtendediBootRegion");
  unsigned int v12 = -[IODualSPIWriter _maxImageSize](self, "_maxImageSize");
  uint64_t v13 = -[IODualSPIWriter _maxExtendedRegionSize](self, "_maxExtendedRegionSize") + v12;
  uint64_t v14 = -[IODualSPIWriter _maxImageSize](self, "_maxImageSize");
  -[IODualSPIWriter _maxExtendedRegionSize](self, "_maxExtendedRegionSize");
  if (!-[IODualSPIWriter usesAFUH](self, "usesAFUH")) {
    goto LABEL_8;
  }
  if (-[IODualSPIWriter _usesExtendediBootRegion](self, "_usesExtendediBootRegion")) {
    iBU_LOG_real( (uint64_t)@"Using iBoot extended region. iBootRegionSize (%d) + ExtendedRegionSize (%d) == maxImageSize (%d)",  "-[IODualSPIWriter _writeFirmware:toHeader:withError:]",  v15,  v16,  v17,  v18,  v19,  v20,  v14);
  }
  id v21 = [a3 length];
  id v22 = [a3 length];
  if ((unint64_t)v21 <= v13)
  {
    iBU_LOG_real( (uint64_t)@"Increasing firmware payload length by %lu in order to zero-out remaining segment.",  "-[IODualSPIWriter _writeFirmware:toHeader:withError:]",  v23,  v24,  v25,  v26,  v27,  v28,  v13 - (void)v22);
    id v36 = [a3 length];
    iBU_LOG_real( (uint64_t)@"Old firmware payload size: %lu. New size: %d",  "-[IODualSPIWriter _writeFirmware:toHeader:withError:]",  v37,  v38,  v39,  v40,  v41,  v42,  (uint64_t)v36);
    -[NSMutableData increaseLengthBy:](v10, "increaseLengthBy:", v13 - (void)[a3 length]);
LABEL_8:
    unsigned int v43 = -[NSMutableData length](v10, "length");
    else {
      uint64_t v50 = v14;
    }
    iBU_LOG_real( (uint64_t)@"Writing %d bytes (out of a possible %d) of the header payload: %@.",  "-[IODualSPIWriter _writeFirmware:toHeader:withError:]",  v44,  v45,  v46,  v47,  v48,  v49,  v50);
    id v51 = -[NSMutableData bytes](v10, "bytes");
    id v52 = [a4 imageAddress];
    unsigned int v53 = -[NSMutableData length](v10, "length");
    else {
      uint64_t v54 = v14;
    }
    unsigned int v55 = -[IODualSPIWriter _writeBytes:atOffset:ofLength:withError:]( self,  "_writeBytes:atOffset:ofLength:withError:",  v51,  v52,  v54,  &v113);
    if (v55)
    {
      int v29 = v55;
      id v56 = [a4 imageAddress];
      iBU_LOG_real( (uint64_t)@"Failed to write firmware images to offset 0x%x with error %d",  "-[IODualSPIWriter _writeFirmware:toHeader:withError:]",  v57,  v58,  v59,  v60,  v61,  v62,  (uint64_t)v56);
      if (!a5) {
        return v29;
      }
      uint64_t v63 = v113;
      id v110 = [a4 imageAddress];
      uint64_t v69 = @"Failed to write firmware images to offset 0x%x with error %d";
    }

    else
    {
      uint64_t v71 = v14;
      else {
        unsigned int v72 = 0;
      }
      NSUInteger v73 = -[NSMutableData length](v10, "length");
      if (v72 == 1)
      {
        uint64_t v80 = (v73 - v14);
        iBU_LOG_real( (uint64_t)@"Writing remaining %d bytes of the header payload to the secondary offset: %@.",  "-[IODualSPIWriter _writeFirmware:toHeader:withError:]",  v74,  v75,  v76,  v77,  v78,  v79,  v80);
        unsigned int v81 = -[IODualSPIWriter _writeBytes:atOffset:ofLength:withError:]( self,  "_writeBytes:atOffset:ofLength:withError:",  (char *)-[NSMutableData bytes](v10, "bytes") + v71,  [a4 secondaryPayloadOffset],  v80,  &v113);
        if (v81)
        {
          int v29 = v81;
          [a4 secondaryPayloadOffset];
          iBU_LOG_real( (uint64_t)@"Failed to write remaining %d bytes of firmware images to offset 0x%x with error %d",  "-[IODualSPIWriter _writeFirmware:toHeader:withError:]",  v82,  v83,  v84,  v85,  v86,  v87,  v80);
          if (!a5) {
            return v29;
          }
          uint64_t v63 = v113;
          [a4 secondaryPayloadOffset];
          id v110 = (id)v80;
          uint64_t v69 = @"Failed to write reamining %d bytes firmware images to offset 0x%x with error %d";
          goto LABEL_17;
        }
      }

      else
      {
        else {
          char v88 = v11;
        }
        if ((v88 & 1) == 0)
        {
          int v29 = -536870212;
          int64_t v96 = -[NSMutableData length](v10, "length");
          iBU_LOG_real( (uint64_t)@"State inconsistency detected. Firmware data length (%d) >? iBootRegionSize (%d) and usesIBootExtendedRegion is %d",  "-[IODualSPIWriter _writeFirmware:toHeader:withError:]",  v97,  v98,  v99,  v100,  v101,  v102,  v96);
          if (!a5) {
            return v29;
          }
          uint64_t v103 = v113;
          int64_t v111 = -[NSMutableData length](v10, "length");
          unint64_t v35 = MSUBootFirmwareError( 3LL,  v103,  (uint64_t)@"State inconsistency detected. Firmware data length (%d) >? iBootRegionSize (%d) and usesIBootExtendedRegion is %d",  v104,  v105,  v106,  v107,  v108,  v111);
          goto LABEL_18;
        }
      }

      iBU_LOG_real( (uint64_t)@"Writing header structure: %@.",  "-[IODualSPIWriter _writeFirmware:toHeader:withError:]",  v74,  v75,  v76,  v77,  v78,  v79,  (uint64_t)a4);
      int v29 = -[IODualSPIWriter _writeBytes:atOffset:ofLength:withError:]( self,  "_writeBytes:atOffset:ofLength:withError:",  v112,  [a4 startLocation],  objc_msgSend(v9, "length"),  &v113);
      if (!v29)
      {

        return v29;
      }

      id v89 = [a4 startLocation];
      iBU_LOG_real( (uint64_t)@"Failed to write header structure to offset 0x%x with error %d",  "-[IODualSPIWriter _writeFirmware:toHeader:withError:]",  v90,  v91,  v92,  v93,  v94,  v95,  (uint64_t)v89);
      if (!a5) {
        return v29;
      }
      uint64_t v63 = v113;
      id v110 = [a4 startLocation];
      uint64_t v69 = @"Failed to write header structure to offset 0x%x with error %d";
    }

- (int)_commitHeader:(id)a3 withError:(id *)a4
{
  if ([a3 isValid])
  {
    if (a4) {
      *a4 = MSUBootFirmwareError( 4LL,  0LL,  (uint64_t)@"Header wasn't prepared / invalid at time of commit: %@",  v7,  v8,  v9,  v10,  v11,  (uint64_t)a3);
    }
    return -536870212;
  }

  else
  {
    [a3 makeValid];
    id v13 = [a3 packStructure];
    id v14 = [v13 bytes];
    iBU_LOG_real( (uint64_t)@"Committing valid header via flash as: %@",  "-[IODualSPIWriter _commitHeader:withError:]",  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)a3);
    return -[IODualSPIWriter _writeBytes:atOffset:ofLength:withError:]( self,  "_writeBytes:atOffset:ofLength:withError:",  v14,  [a3 startLocation],  objc_msgSend(v13, "length"),  a4);
  }

- (int)_writeBytes:(char *)a3 atOffset:(unsigned int)a4 ofLength:(unsigned int)a5 withError:(id *)a6
{
  kern_return_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t input[2];
  uint64_t v9 = *(void *)&a5;
  size_t v12 = a5;
  input[0] = a4;
  input[1] = a5;
  iBU_LOG_real( (uint64_t)@"inputs[0] = 0x%llx; inputs[1] = 0x%llx",
    "-[IODualSPIWriter _writeBytes:atOffset:ofLength:withError:]",
    (uint64_t)a3,
    *(uint64_t *)&a4,
    *(uint64_t *)&a5,
    (uint64_t)a6,
    v6,
    v7,
    a4);
  id v13 = IOConnectCallMethod( -[IODualSPIWriter spiDriverConnect](self, "spiDriverConnect"),  1u,  input,  2u,  a3,  v12,  0LL,  0LL,  0LL,  0LL);
  uint64_t v19 = v13;
  if (a6 && v13) {
    *a6 = MSUBootFirmwareError( v13,  0LL,  (uint64_t)@"_writeBytes: Failed writing %d bytes with error %d",  v14,  v15,  v16,  v17,  v18,  v9);
  }
  return v19;
}

- (void)dealloc
{
  io_connect_t v3 = *(_DWORD *)&self->_usesAFUH;
  if (v3) {
    IOServiceClose(v3);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IODualSPIWriter;
  -[IOServiceWriter dealloc](&v4, "dealloc");
}

- (unsigned)spiDriverConnect
{
  return *(_DWORD *)&self->_usesAFUH;
}

- (void)setSpiDriverConnect:(unsigned int)a3
{
  *(_DWORD *)&self->_usesAFUH = a3;
}

- (const)regBuffer
{
  return *(const char **)(&self->_regSize + 1);
}

- (void)setRegBuffer:(const char *)a3
{
  *(void *)(&self->_regSize + 1) = a3;
}

- (BOOL)usesAFUH
{
  return *(_BYTE *)(&self->super._serviceConnect + 1) & 1;
}

- (const)regStruct
{
  return *(const _reg_format_union **)((char *)&self->_regBuffer + 4);
}

- (void)setRegStruct:(const _reg_format_union *)a3
{
  *(const char **)((char *)&self->_regBuffer + 4) = (const char *)a3;
}

- (unsigned)regSize
{
  return self->_spiDriverConnect;
}

- (void)setRegSize:(unsigned int)a3
{
  self->_unsigned int spiDriverConnect = a3;
}

- (NSData)regData
{
  return *(NSData **)((char *)&self->_regStruct + 4);
}

- (void)setRegData:(id)a3
{
  *(const _reg_format_union **)((char *)&self->_regStruct + 4) = (const _reg_format_union *)a3;
}

- (NSMutableArray)invalidHeaders
{
  return *(NSMutableArray **)((char *)&self->_regData + 4);
}

- (void)setInvalidHeaders:(id)a3
{
  *(NSData **)((char *)&self->_regData + 4) = (NSData *)a3;
}

@end