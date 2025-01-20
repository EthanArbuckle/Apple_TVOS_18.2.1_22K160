uint64_t sleepMS(int a1)
{
  return usleep(1000 * a1);
}

LABEL_27:
        v12 = 0;
LABEL_28:

        goto LABEL_29;
      }

      v18 = (PS190Device *)objc_loadWeakRetained((id *)&self->_delegate);
      -[PS190Device log:](v18, "log:", @"Unable to locate chip after loading firmware.");
      v12 = 0;
LABEL_29:

      goto LABEL_33;
    }

LABEL_7:
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    [v13 log:@"%@: Attemping to boot firmware from recovery mode.", self->_ps190Instance];
    goto LABEL_8;
  }

  if (self->_recoveryModeActive) {
    goto LABEL_7;
  }
  WeakRetained = -[PS190Device initWithHandle:](objc_alloc(&OBJC_CLASS___PS190Device), "initWithHandle:", v10);
  -[PS190RecoveryDevice setDelegate:](WeakRetained, "setDelegate:", self);
  v12 = -[PS190UpdaterInstance programOTPForDevice:withInputParameters:]( self,  "programOTPForDevice:withInputParameters:",  WeakRetained,  v9);
LABEL_33:

  return v12;
}
}

LABEL_26:
  v18 = 0LL;
LABEL_27:

LABEL_21:
  return v18;
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

uint64_t SoCUpdaterShouldSkipSameVersion(void *a1)
{
  id v1 = (id)[a1 objectForKeyedSubscript:@"Options"];
  id v2 = (id)[v1 objectForKeyedSubscript:@"RestoreInternal"];
  int v3 = [v2 BOOLValue];
  id v4 = (id)[v1 objectForKeyedSubscript:@"SkipSameVersion"];
  unsigned int v5 = [v4 BOOLValue];
  if ((v5 & 1) != 0 || !v3)
  {
    if (v4) {
      int v7 = v3;
    }
    else {
      int v7 = 1;
    }
    uint64_t v6 = v7 | v5;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

uint64_t SoCUpdaterRunningInTetheredMode(void *a1)
{
  id v1 = (id)[a1 objectForKeyedSubscript:@"Options"];
  id v2 = (id)[v1 objectForKeyedSubscript:@"PreflightRequired"];
  uint64_t v3 = [v2 BOOLValue] ^ 1;

  return v3;
}

uint64_t SoCUpdaterDeferredCommitEnabled(void *a1)
{
  id v1 = (id)[a1 objectForKeyedSubscript:@"Options"];
  id v2 = (id)[v1 objectForKeyedSubscript:@"DeferredCommit"];
  uint64_t v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 BOOLValue];
  }
  else {
    uint64_t v4 = 0LL;
  }

  return v4;
}

uint64_t SoCUpdaterGetMode(void *a1)
{
  id v1 = a1;
  id v2 = (id)[v1 objectForKeyedSubscript:@"Options"];
  id v3 = (id)[v2 objectForKeyedSubscript:@"PreflightContext"];
  int v4 = SoCUpdaterDeferredCommitEnabled(v1);

  if ([v3 isEqual:@"Limited"])
  {
    id v5 = (id)[v2 objectForKeyedSubscript:@"PreflightTickets"];
    if (v5) {
      int v4 = 1;
    }

    if (v4 == 1)
    {
      else {
        uint64_t v6 = 4LL;
      }
    }

    else
    {
      uint64_t v6 = 1LL;
    }
  }

  else if ([v3 isEqual:@"BootedOS"])
  {
    id v7 = (id)[v2 objectForKeyedSubscript:@"PreflightTickets"];

    if (v7)
    {
      uint64_t v6 = 3LL;
    }

    else
    {
      id v8 = (id)[v2 objectForKeyedSubscript:@"PreflightRequired"];
      else {
        uint64_t v6 = 3LL;
      }
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

const char *StringForSoCRestoreUpdateMode(unsigned int a1)
{
  if (a1 > 8) {
    return "Unrecognized";
  }
  else {
    return off_18A332050[a1];
  }
}

LABEL_33:
    id v2 = 0;
    goto LABEL_34;
  }

  return 1;
}

void OUTLINED_FUNCTION_2_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_4_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t computeCRC8WithInitialValue(char *a1, int a2, uint64_t a3)
{
  {
    char v3 = *a1++;
    a3 = CRC8_MAP[(v3 ^ a3)];
  }

  return a3;
}

uint64_t computeCRC8(char *a1, int a2)
{
  for (uint64_t i = 0LL; a2; --a2)
  {
    char v3 = *a1++;
    uint64_t i = CRC8_MAP[(v3 ^ i)];
  }

  return i;
}

uLong computeCRC32(const Bytef *a1, uInt a2)
{
  uLong v4 = crc32(0LL, 0LL, 0);
  return crc32(v4, a1, a2);
}

id FormatHex(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v6 = (id)[MEMORY[0x189607940] stringWithCapacity:0];
  id v7 = v6;
  char v43 = 0;
  uint64_t v42 = 0LL;
  if (a3) {
    id v8 = @"00000000  ";
  }
  else {
    id v8 = @"0000  ";
  }
  [v6 appendFormat:v8];
  if (a2)
  {
    unint64_t v9 = 0LL;
    v10 = "%s %s\n%04x  ";
    if (a3) {
      v10 = "%s %s\n%08x  ";
    }
    __format = (char *)v10;
    do
    {
      if (v9)
      {
        unint64_t v11 = v9 & 0xF;
        if ((v9 & 0xF) == 0)
        {
          char v41 = 0;
          uint64_t v40 = *(void *)(v9 + a1 - 16);
          do
          {
            int v12 = *((char *)&v40 + v11);
            if (v12 < 32 || v12 == 127 || *((_BYTE *)&v40 + v11) == 32) {
              *((_BYTE *)&v40 + v11) = 46;
            }
            ++v11;
          }

          while (v11 != 8);
          uint64_t v13 = 0LL;
          char v39 = 0;
          uint64_t v38 = *(void *)(v9 + a1 - 8);
          do
          {
            int v14 = *((char *)&v38 + v13);
            if (v14 < 32 || v14 == 127 || *((_BYTE *)&v38 + v13) == 32) {
              *((_BYTE *)&v38 + v13) = 46;
            }
            ++v13;
          }

          while (v13 != 8);
          snprintf(__str, 0x20uLL, __format, &v40, &v38, v9);
          objc_msgSend(v7, "appendFormat:", @"%s", __str);
        }
      }

      if (v9 + 8 >= a2)
      {
        objc_msgSend(v7, "appendFormat:", @"%02x ", *(unsigned __int8 *)(a1 + v9++));
      }

      else
      {
        uint64_t v15 = *(unsigned __int8 *)(a1 + v9);
        uint64_t v16 = *(unsigned __int8 *)(a1 + v9 + 1);
        if ((((_BYTE)v9 + 8) & 0xF) != 0) {
          snprintf(__str, 0x20uLL, "%02x %02x %02x %02x %02x %02x %02x %02x  ", v15, v16);
        }
        else {
          snprintf(__str, 0x20uLL, "%02x %02x %02x %02x %02x %02x %02x %02x    ", v15, v16);
        }
        objc_msgSend(v7, "appendFormat:", @"%s", __str);
        v9 += 8LL;
      }
    }

    while (v9 < a2);
    uint64_t v17 = 16LL;
    if ((a2 & 0xF) != 0) {
      uint64_t v17 = a2 & 0xF;
    }
    if (a2 <= 0xF) {
      unint64_t v18 = a2;
    }
    else {
      unint64_t v18 = v17;
    }
    if (a2 >= 0x10 && (a2 & 0xF) == 0)
    {
      [v7 appendString:@"   "];
      uint64_t v19 = 0LL;
      uint64_t v42 = *(void *)(v9 + a1 - 16);
      do
      {
        int v20 = *((char *)&v42 + v19);
        if (v20 < 32 || v20 == 127 || *((_BYTE *)&v42 + v19) == 32) {
          *((_BYTE *)&v42 + v19) = 46;
        }
        ++v19;
      }

      while (v19 != 8);
      id v21 = (id)[NSString stringWithUTF8String:&v42];
      [v7 appendString:v21];

      [v7 appendString:@" "];
      uint64_t v22 = 0LL;
      uint64_t v42 = *(void *)(v9 + a1 - 8);
      do
      {
        int v23 = *((char *)&v42 + v22);
        if (v23 < 32 || v23 == 127 || *((_BYTE *)&v42 + v22) == 32) {
          *((_BYTE *)&v42 + v22) = 46;
        }
        ++v22;
      }

      while (v22 != 8);
LABEL_77:
      id v34 = (id)[NSString stringWithUTF8String:&v42];
      [v7 appendString:v34];

      return v7;
    }
  }

  else
  {
    unint64_t v18 = 0LL;
    unint64_t v9 = 0LL;
  }

  uint64_t v24 = 3LL;
  if (v18 < 9) {
    uint64_t v24 = 4LL;
  }
  unint64_t v25 = 3 * (16 - v18) + v24;
  do
  {
    [v7 appendString:@" "];
    --v25;
  }

  while (v25);
  unint64_t v26 = v18 - 8;
  if (v18 >= 8)
  {
    uint64_t v29 = 0LL;
    uint64_t v42 = *(void *)(a1 + v9 - v18);
    do
    {
      int v30 = *((char *)&v42 + v29);
      if (v30 < 32 || v30 == 127 || *((_BYTE *)&v42 + v29) == 32) {
        *((_BYTE *)&v42 + v29) = 46;
      }
      ++v29;
    }

    while (v29 != 8);
  }

  else
  {
    __memcpy_chk();
    *((_BYTE *)&v42 + v18) = 0;
    if (v18)
    {
      uint64_t v27 = 0LL;
      do
      {
        int v28 = *((char *)&v42 + v27);
        if (v28 < 32 || v28 == 127 || *((_BYTE *)&v42 + v27) == 32) {
          *((_BYTE *)&v42 + v27) = 46;
        }
        ++v27;
      }

      while (v27 < v18);
    }

    unint64_t v26 = 0LL;
  }

  id v31 = (id)[NSString stringWithUTF8String:&v42];
  [v7 appendString:v31];

  if (v26)
  {
    [v7 appendString:@" "];
    __memcpy_chk();
    uint64_t v32 = 0LL;
    *((_BYTE *)&v42 + v26) = 0;
    do
    {
      int v33 = *((char *)&v42 + v32);
      if (v33 < 32 || v33 == 127 || *((_BYTE *)&v42 + v32) == 32) {
        *((_BYTE *)&v42 + v32) = 46;
      }
      ++v32;
    }

    while (v26 > v32);
    goto LABEL_77;
  }

  return v7;
}

const char *PS190StringForErrorCode(unsigned int a1)
{
  if (a1 > 0x16) {
    return "unrecognized";
  }
  else {
    return off_18A332098[(char)a1];
  }
}

const char *PS190StringForCommandType(int a1)
{
  if (a1 > 28)
  {
    switch(a1)
    {
      case 151:
        result = "Init Firmware Update";
        break;
      case 152:
        result = "Download Firmware";
        break;
      case 153:
        result = "Commit Firmware Update";
        break;
      case 154:
        result = "Calculate CRC32";
        break;
      default:
        if (a1 == 29) {
          result = "Get Boot Nonce Hash";
        }
        else {
LABEL_15:
        }
          result = "unrecognized";
        break;
    }
  }

  else
  {
    int v1 = a1 - 1;
    result = "Get Version";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        result = "Get Info";
        break;
      case 2:
        result = "Reset or Boot Status";
        break;
      case 3:
      case 4:
        goto LABEL_15;
      case 5:
        result = "Get Serial Number";
        break;
      default:
        result = "Get ECID";
        break;
    }
  }

  return result;
}

const char *PS190StringForGetVersionSubcommand(unsigned int a1)
{
  if (a1 > 4) {
    return "unrecognized";
  }
  else {
    return off_18A332150[(char)a1];
  }
}

const char *PS190StringForGetInfoSubcommand(int a1)
{
  else {
    return off_18A332178[(char)(a1 - 1)];
  }
}

const char *PS190StringForResetOrBootStatusSubcommand(unsigned int a1)
{
  if (a1 > 2) {
    return "unrecognized";
  }
  else {
    return off_18A3321A0[(char)a1];
  }
}

const char *PS190StringForGetSerialNumberSubcommand(int a1)
{
  int v1 = "unrecognized";
  if (a1 == 1) {
    int v1 = "Silicon ID";
  }
  if (a1) {
    return v1;
  }
  else {
    return "OTP Serial Number";
  }
}

const char *PS190StringForInitFirmwareUpdateSubcommand(unsigned int a1)
{
  if (a1 > 2) {
    return "unrecognized";
  }
  else {
    return off_18A3321B8[(char)a1];
  }
}

const char *PS190StringForCommitFirmwareUpdateSubcommand(int a1)
{
  int v1 = "unrecognized";
  if (a1 == 1) {
    int v1 = "With Reset";
  }
  if (a1) {
    return v1;
  }
  else {
    return "Without Reset";
  }
}

const char *PS190StringForReadOTPSubcommand(char a1)
{
  else {
    return off_18A3321D0[(char)(a1 + 2)];
  }
}

const char *PS190StringForBootStatus(int a1)
{
  switch(a1)
  {
    case 128:
      result = "certificate validation failed";
      break;
    case 129:
      result = "invalid manifest format";
      break;
    case 130:
      result = "invalid certificate format";
      break;
    case 131:
      result = "other failure";
      break;
    default:
      if (a1 == 1) {
        result = "booted";
      }
      else {
        result = "unrecognized";
      }
      break;
  }

  return result;
}

const char *PS190StringForCommandStatusCode(int a1)
{
  if (a1 > 63)
  {
    switch(a1)
    {
      case 64:
        return "busy";
      case 128:
        return "submit command";
      case 136:
        return "submit data";
    }
  }

  else
  {
    switch(a1)
    {
      case 8:
        return "data ready";
      case 16:
        return "completed";
      case 32:
        return "error";
    }
  }

  return "unrecognized";
}

uint64_t PS190StringForRawAppFirmwareVersion(char *a1)
{
  if (*a1 < 0) {
    int v1 = "Test";
  }
  else {
    int v1 = "Formal";
  }
  return objc_msgSend( NSString,  "stringWithFormat:",  @"%02x.%02x.%02x [%s Release]",  *a1 & 0x7F,  a1[1],  a1[2],  v1);
}

BOOL PS190RawAppFirmwareVersionsEqual(int a1, int a2)
{
  return (unsigned __int16)a1 == (unsigned __int16)a2 && BYTE2(a1) == BYTE2(a2);
}

uint64_t PS190StringForRawBootloaderVersion(unsigned __int8 *a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%02x.%02x", *a1, a1[1]);
}

uint64_t PS190StringForCMDIFVersion(unsigned __int8 *a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%02x.%02x", *a1, a1[1]);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

id PS190GenerateDigest(void *a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  CC_SHA256_Init(&v6);
  id v2 = v1;
  char v3 = (const void *)[v2 bytes];
  CC_LONG v4 = [v2 length];

  CC_SHA256_Update(&v6, v3, v4);
  CC_SHA256_Final(md, &v6);
  return (id)[MEMORY[0x189603F48] dataWithBytes:md length:32];
}

PS190UpdaterController *PS190UpdaterCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[PS190UpdaterController initWithOptions:logFunction:logContext:]( objc_alloc(&OBJC_CLASS___PS190UpdaterController),  "initWithOptions:logFunction:logContext:",  a1,  a2,  a3);
}

uint64_t PS190UpdaterExecCommand(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  if ([v8 isEqualToString:@"queryInfo"])
  {
    id v9 = (id)[v7 queryInfo];
    v10 = v9;
    if (v9)
    {
      *a4 = v9;
      uint64_t v11 = 1LL;
    }

    else
    {
      uint64_t v11 = 0LL;
    }
  }

  else if ([v8 isEqualToString:@"performNextStage"])
  {
    uint64_t v11 = [v7 performUpdateWithDictionary:a3];
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

uint64_t PS190UpdaterIsDone(void *a1)
{
  if (a1) {
    return [a1 isDone];
  }
  id v2 = +[PS190IODPDevice first](&OBJC_CLASS___PS190IODPDevice, "first");
  if (v2)
  {
    BOOL v1 = 0LL;
  }

  else
  {
    id v3 = +[PS190IICDevice first](&OBJC_CLASS___PS190IICDevice, "first");
    BOOL v1 = v3 == 0LL;
  }

  return v1;
}

void OUTLINED_FUNCTION_0_1(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

id _getAllInstanceIDs()
{
  id v0 = (id)[MEMORY[0x189603FA8] array];
  io_iterator_t existing = 0;
  mach_port_t v1 = *MEMORY[0x1896086B0];
  id v2 = IOServiceMatching("AppleARMIICDevice");
  if (!IOServiceGetMatchingServices(v1, v2, &existing))
  {
    io_object_t v3 = IOIteratorNext(existing);
    if (v3)
    {
      io_registry_entry_t v4 = v3;
      id v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      do
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, @"name", v5, 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v7 = (void *)[objc_alloc(NSString) initWithData:CFProperty encoding:4];
          unsigned int v11 = 0;
          if ([v7 hasPrefix:@"pcon"]
            && sscanf((const char *)[v7 UTF8String], "pcon%u", &v11) == 1)
          {
            id v8 = (id)[MEMORY[0x189607968] numberWithUnsignedInt:v11];
            [v0 addObject:v8];
          }
        }

        IOObjectRelease(v4);

        io_registry_entry_t v4 = IOIteratorNext(existing);
      }

      while (v4);
    }

    IOObjectRelease(existing);
  }

  id v9 = (id)[MEMORY[0x189603F18] arrayWithArray:v0];

  return v9;
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

uint64_t IODPDeviceCreateWithService()
{
  return MEMORY[0x189607D48]();
}

uint64_t IODPDeviceReadDPCD()
{
  return MEMORY[0x189607D58]();
}

uint64_t IODPDeviceWriteDPCD()
{
  return MEMORY[0x189607D60]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1896082F0](*(void *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1896083A0](*(void *)&object);
}

CFStringRef IORegistryEntryCopyPath(io_registry_entry_t entry, const io_name_t plane)
{
  return (CFStringRef)MEMORY[0x189608450](*(void *)&entry, plane);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetParentEntry( io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1896084D0](*(void *)&entry, plane, parent);
}

BOOLean_t IORegistryEntryInPlane(io_registry_entry_t entry, const io_name_t plane)
{
  return MEMORY[0x189608510](*(void *)&entry, plane);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices( mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x189608578](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608590](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __IOAVClassMatching()
{
  return MEMORY[0x189608670]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x189617578](crc, buf, *(void *)&len);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x1895FC6E0]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1895FCFD0](a1, a2);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
}

uint64_t objc_msgSend_initWithBoardID_certficateEpoch_chipID_debugDisable_ecid_nonce_productionMode_realHDCPKeysPresent_securityDomain_securityMode_hardwareRevision_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithBoardID_certficateEpoch_chipID_debugDisable_ecid_nonce_productionMode_realHDCPKeysPresent_securityDomain_securityMode_hardwareRevision_);
}