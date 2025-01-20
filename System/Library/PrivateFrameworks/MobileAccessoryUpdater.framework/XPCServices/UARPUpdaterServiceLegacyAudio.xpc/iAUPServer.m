@interface iAUPServer
- (BOOL)ackAppReentry;
- (BOOL)byteEscape;
- (BOOL)personalizationComplete;
- (BOOL)restartRequired;
- (BOOL)sleepWakeRequired;
- (BOOL)urgentUpdate;
- (FirmwareBundle)firmwareBundle;
- (OS_dispatch_queue)dispatchQ;
- (char)assetTypeString:(int)a3;
- (char)commandString:(int)a3;
- (char)parserStateString:(int)a3;
- (char)serverStateString:(int)a3;
- (iAUPServerDelegate)delegate;
- (id)getNumberOfBytesDownloadedInCurrentSession;
- (id)initInstanceWithByteEscape:(BOOL)a3;
- (id)processManifestProperties:(char *)a3 length:(unsigned int)a4;
- (id)sendCommand:(unsigned __int8)a3 payload:(char *)a4 payload_length:(unsigned __int16)a5;
- (int)parserState;
- (int)serverState;
- (unsigned)appendByteWithEscaping:(unsigned __int8)a3 toObject:(id *)a4;
- (unsigned)currentAsset;
- (unsigned)iAUPVersion;
- (unsigned)supportedTargetProductIDCode;
- (void)accessoryDisconnected;
- (void)appendToLog:(id)a3;
- (void)dealloc;
- (void)logCommand:(unsigned __int8)a3 payload:(char *)a4 length:(unsigned int)a5;
- (void)processDataFromAccessory:(id)a3;
- (void)processDownloadCompleteCommand:(char *)a3 length:(unsigned int)a4;
- (void)processIdentifyCommand:(char *)a3 length:(unsigned int)a4;
- (void)processInByte:(unsigned __int8)a3;
- (void)processInTelegram;
- (void)processNotifyAccessoryErrorCommand:(char *)a3 length:(unsigned int)a4;
- (void)processPersonalizationInfo:(char *)a3 length:(unsigned int)a4;
- (void)processRequestDownloadCommand:(char *)a3 length:(unsigned int)a4;
- (void)resetParser;
- (void)setAckAppReentry:(BOOL)a3;
- (void)setBootloaderEntry;
- (void)setByteEscape:(BOOL)a3;
- (void)setCurrentAsset:(unsigned __int8)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQ:(id)a3;
- (void)setFirmwareBundle:(id)a3;
- (void)setHSModel:(id)a3 fallbackModel:(id)a4 error:(id)a5;
- (void)setIAUPVersion:(unsigned __int8)a3;
- (void)setParserState:(int)a3;
- (void)setResumeInfo:(char *)a3 length:(unsigned int)a4;
- (void)setServerState:(int)a3;
@end

@implementation iAUPServer

- (id)initInstanceWithByteEscape:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___iAUPServer;
  v4 = -[iAUPServer init](&v6, "init");
  if (v4)
  {
    *((void *)v4 + 7) = -[NSMutableData initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithCapacity:",  32LL);
    *((void *)v4 + 1) = 0LL;
    *((void *)v4 + 4) = 0LL;
    v4[25] = a3;
    v4[26] = 0;
    *((_WORD *)v4 + 42) = 0;
    *(_WORD *)(v4 + 87) = 256;
    [v4 resetParser];
    [v4 setServerState:1];
    *((_DWORD *)v4 + 20) = 0;
    *((_DWORD *)v4 + 18) = 0;
    memset_pattern16(v4 + 64, &unk_100025610, 8uLL);
    NSLog( @"%s(): iAUPServer init byteEscape=%d serverState=%s parserState=%s\n",  "-[iAUPServer initInstanceWithByteEscape:]",  v4[25],  [v4 serverStateString:*((unsigned int *)v4 + 4)],  objc_msgSend(v4, "parserStateString:", *((unsigned int *)v4 + 5)));
  }

  return v4;
}

- (id)getNumberOfBytesDownloadedInCurrentSession
{
  return +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_totalBytesDownloadedInCurrentSession);
}

- (void)dealloc
{
  self->_telegramDataIn = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___iAUPServer;
  -[iAUPServer dealloc](&v3, "dealloc");
}

- (unsigned)supportedTargetProductIDCode
{
  return -[FirmwareBundle productIDCode](self->_firmwareBundle, "productIDCode");
}

- (void)resetParser
{
  self->_escapeInProgress = 0;
  -[NSMutableData setLength:](self->_telegramDataIn, "setLength:", 0LL);
  if (self->_byteEscape) {
    uint64_t v3 = 4294967294LL;
  }
  else {
    uint64_t v3 = 0xFFFFFFFFLL;
  }
  -[iAUPServer setParserState:](self, "setParserState:", v3);
}

- (void)setServerState:(int)a3
{
  self->_serverState = a3;
}

- (void)setParserState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = -[iAUPServer parserState](self, "parserState");
  if ((int)v3 < 1 || v5 <= 0) {
    NSLog( @"[Parser State]: %s -> %s",  -[iAUPServer parserStateString:](self, "parserStateString:", self->_parserState),  -[iAUPServer parserStateString:](self, "parserStateString:", v3));
  }
  self->_parserState = v3;
}

- (void)appendToLog:(id)a3
{
}

- (void)setFirmwareBundle:(id)a3
{
  firmwareBundle = self->_firmwareBundle;
  if (firmwareBundle)
  {

    self->_firmwareBundle = 0LL;
  }

  self->_firmwareBundle = (FirmwareBundle *)a3;
  if (-[iAUPServer serverState](self, "serverState") != 1 && -[iAUPServer serverState](self, "serverState") != 7)
  {
    -[iAUPServer resetParser](self, "resetParser");
    -[iAUPServer setServerState:](self, "setServerState:", 6LL);
  }

- (void)logCommand:(unsigned __int8)a3 payload:(char *)a4 length:(unsigned int)a5
{
  if ((int)a3 > 95)
  {
    if ((int)a3 <= 191)
    {
      if ((a3 - 128) >= 8)
      {
        goto LABEL_24;
      }
    }

    else
    {
      if (a3 == 192)
      {
        v7 = @"Bootloader entry command acknowledged";
        goto LABEL_27;
      }

      if (a3 == 193)
      {
        v7 = @"App re-entry command acknowledged";
        goto LABEL_27;
      }

      if (a3 != 194) {
        goto LABEL_30;
      }
    }

- (void)processDataFromAccessory:(id)a3
{
  int v5 = (unsigned __int8 *)[a3 bytes];
  if ([a3 length])
  {
    uint64_t v6 = 0LL;
    do
      -[iAUPServer processInByte:](self, "processInByte:", v5[v6++]);
    while ((unint64_t)[a3 length] > v6);
  }

- (void)processInByte:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  char v13 = a3;
  if (self->_byteEscape)
  {
    if (a3 == 125)
    {
      unsigned int parserState = self->_parserState;
      uint64_t v6 = -[iAUPServer parserStateString:](self, "parserStateString:", parserState);
      if (parserState < 0xFFFFFFFE)
      {
        NSLog(@"[Parser] escaping %s\n", v6);
        self->_escapeInProgress = 1;
        return;
      }

      NSLog(@"[Parser] Invalid StartByte in %s & byteEscape=YES\n", v6);
      goto LABEL_27;
    }

    if (self->_escapeInProgress)
    {
      if (self->_parserState >= 0xFFFFFFFE)
      {
        NSLog( @"[Parser] ??? %s when byteEscape=YES c=0x%02x\n",  -[iAUPServer parserStateString:](self, "parserStateString:"),  a3);
LABEL_27:
        -[iAUPServer resetParser](self, "resetParser");
        return;
      }

      NSLog( @"[Parser] De-escaped [0x%02x -> 0x%02x] %s\n",  a3,  a3 ^ 0x20u,  -[iAUPServer parserStateString:](self, "parserStateString:"));
      char v13 = v3 ^ 0x20;
      self->_escapeInProgress = 0;
      v3 ^= 0x20u;
    }
  }

  switch(self->_parserState)
  {
    case 0xFFFFFFFC:
      self->_telegramChecksum += v3;
      uint64_t v7 = self->_telegramLength | v3;
      self->_telegramLength = v7;
      v8 = self;
      goto LABEL_24;
    case 0xFFFFFFFD:
      self->_telegramChecksum = v3;
      self->_telegramLength = v3 << 8;
      v8 = self;
      uint64_t v7 = 4294967292LL;
      goto LABEL_24;
    case 0xFFFFFFFE:
      if (self->_byteEscape) {
        int v9 = 126;
      }
      else {
        int v9 = 92;
      }
      if (v3 == v9)
      {
        v8 = self;
        uint64_t v7 = 4294967293LL;
        goto LABEL_24;
      }

      NSLog( @"[Parser] Invalid 0x%02x byte in %s & byteEscape=%d\n",  v3,  -[iAUPServer parserStateString:](self, "parserStateString:", 4294967294LL),  self->_byteEscape);
      goto LABEL_27;
    case 0xFFFFFFFF:
      if (self->_byteEscape)
      {
        NSLog( @"[Parser] %s when byteEscaping=YES. Why?\n",  -[iAUPServer parserStateString:](self, "parserStateString:", 0xFFFFFFFFLL),  v11,  v12);
        goto LABEL_27;
      }

      if (v3 != 255)
      {
        NSLog( @"[Parser] Invalid byte 0x%02x in %s\n",  v3,  -[iAUPServer parserStateString:](self, "parserStateString:", 0xFFFFFFFFLL),  v12);
        goto LABEL_27;
      }

      v8 = self;
      uint64_t v7 = 4294967294LL;
LABEL_24:
      -[iAUPServer setParserState:](v8, "setParserState:", v7);
      break;
    case 0:
      unsigned __int8 v10 = self->_telegramChecksum + v3;
      self->_telegramChecksum = v10;
      if (v10) {
        NSLog(@"[Parser] Invalid Checksum c=0x%02x\n", v3, v11, v12);
      }
      else {
        -[iAUPServer processInTelegram](self, "processInTelegram");
      }
      goto LABEL_27;
    default:
      -[NSMutableData appendBytes:length:](self->_telegramDataIn, "appendBytes:length:", &v13, 1LL);
      self->_telegramChecksum += v13;
      -[iAUPServer setParserState:]( self,  "setParserState:",  -[iAUPServer parserState](self, "parserState") - 1);
      return;
  }

- (void)processInTelegram
{
  unsigned int v3 = -[NSMutableData mutableBytes](self->_telegramDataIn, "mutableBytes");
  v4 = (unsigned __int8 *)v3 + 1;
  uint64_t v5 = *(unsigned __int8 *)v3;
  uint64_t v6 = -[NSMutableData length](self->_telegramDataIn, "length") - 1;
  -[iAUPServer logCommand:payload:length:](self, "logCommand:payload:length:", v5, (char *)v3 + 1, v6);
  if ((int)v5 > 31)
  {
    switch((int)v5)
    {
      case ' ':
        -[iAUPServer processIdentifyCommand:length:](self, "processIdentifyCommand:length:", v4, v6);
        break;
      case '!':
        -[iAUPServer processRequestDownloadCommand:length:](self, "processRequestDownloadCommand:length:", v4, v6);
        break;
      case '""':
        -[iAUPServer processDownloadCompleteCommand:length:](self, "processDownloadCompleteCommand:length:", v4, v6);
        break;
      case '#':
        -[iAUPServer processNotifyAccessoryErrorCommand:length:]( self,  "processNotifyAccessoryErrorCommand:length:",  v4,  v6);
        break;
      default:
        if ((_DWORD)v5 == 193)
        {
          if (self->_ackAppReentry) {
LABEL_41:
          }
            -[iAUPServerDelegate firmwareUpdateComplete:error:]( self->_delegate,  "firmwareUpdateComplete:error:",  0LL,  0LL);
        }

        else if ((_DWORD)v5 == 194)
        {
          -[iAUPServer processPersonalizationInfo:length:](self, "processPersonalizationInfo:length:", v4, v6);
        }

        break;
    }

    return;
  }

  switch((int)v5)
  {
    case 0:
      unsigned __int8 v46 = *v4;
      if (v46 == 1) {
        unsigned int v7 = bswap32(-[FirmwareBundle productIDCode](self->_firmwareBundle, "productIDCode"));
      }
      else {
        unsigned int v7 = 0;
      }
      unsigned int v47 = v7;
      v26 = self;
      uint64_t v27 = 128LL;
      goto LABEL_62;
    case 1:
      if (*v4 == 136)
      {
        -[iAUPServer appendToLog:]( self,  "appendToLog:",  @"ProcessAbort_GeneralFailure from accessory. Cleaning up.");
        v8 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.iAUPServer.ErrorDomain",  -1LL,  0LL);
        v64 = @"Event";
        v65 = @"com.apple.fud.updateFailed";
        int v9 = &v65;
        unsigned __int8 v10 = &v64;
        goto LABEL_89;
      }

      -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 129LL, v4, 1LL);
      if (*v4 == 8 && self->_iAUPVersion == 1)
      {
        -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 65LL, 0LL, 0LL);
        if (!self->_ackAppReentry) {
          goto LABEL_41;
        }
      }

      return;
    case 2:
      unint64_t v11 = *v4;
      if (v11 > 3) {
        return;
      }
      self->objectBlockTransferSizes[v11] = bswap32(v3[1]) >> 16;
      uint64_t v12 = self;
      uint64_t v13 = 130LL;
      v14 = (char *)v3 + 1;
      uint64_t v15 = 3LL;
      goto LABEL_35;
    case 3:
      unsigned int v16 = bswap32(*(_DWORD *)v4);
      self->_unsigned int firmwareImageBaseTransferAddress = v16;
      if (v16 < -[FirmwareBundle firmwareImageBaseAddress](self->_firmwareBundle, "firmwareImageBaseAddress")
        || (unsigned int firmwareImageBaseTransferAddress = self->_firmwareImageBaseTransferAddress,
            unsigned int v18 = firmwareImageBaseTransferAddress
                - -[FirmwareBundle firmwareImageBaseAddress](self->_firmwareBundle, "firmwareImageBaseAddress"),
            v18 >= -[FirmwareBundle firmwareImageSize](self->_firmwareBundle, "firmwareImageSize")))
      {
        -[iAUPServer appendToLog:]( self,  "appendToLog:",  @"COMMAND_SetBaseImageTransferAddress: Bound check failed");
        v8 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.iAUPServer.ErrorDomain",  -2LL,  0LL);
        v62 = @"Event";
        v63 = @"com.apple.fud.updateFailed";
        int v9 = &v63;
        unsigned __int8 v10 = &v62;
        goto LABEL_89;
      }

      uint64_t v12 = self;
      uint64_t v13 = 131LL;
      v14 = (char *)v3 + 1;
      uint64_t v15 = 4LL;
LABEL_35:
      -[iAUPServer sendCommand:payload:payload_length:](v12, "sendCommand:payload:payload_length:", v13, v14, v15);
      return;
    case 4:
      int v19 = *v4;
      if (*v4) {
        goto LABEL_18;
      }
      if (-[FirmwareBundle firmwareImage](self->_firmwareBundle, "firmwareImage")
        || -[FirmwareBundle firmwareLocalURL](self->_firmwareBundle, "firmwareLocalURL"))
      {
        goto LABEL_51;
      }

      int v19 = *v4;
LABEL_18:
      if (v19 != 2) {
        goto LABEL_21;
      }
      if (-[FirmwareBundle hash](self->_firmwareBundle, "hash")) {
        goto LABEL_51;
      }
      int v19 = *v4;
LABEL_21:
      if (v19 != 1) {
        goto LABEL_24;
      }
      if (!-[FirmwareBundle certificate](self->_firmwareBundle, "certificate"))
      {
        int v19 = *v4;
LABEL_24:
        if (v19 != 3 || !-[FirmwareBundle signature](self->_firmwareBundle, "signature"))
        {
          -[iAUPServer appendToLog:](self, "appendToLog:", @"COMMAND_GetObjectSize: request for empty object.");
          v8 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.iAUPServer.ErrorDomain",  -4LL,  0LL);
          v60 = @"Event";
          v61 = @"com.apple.fud.updateFailed";
          int v9 = &v61;
          unsigned __int8 v10 = &v60;
          goto LABEL_89;
        }
      }

- (unsigned)appendByteWithEscaping:(unsigned __int8)a3 toObject:(id *)a4
{
  unsigned __int8 v8 = a3;
  if ((a3 - 125) > 1 || !self->_byteEscape)
  {
    [*a4 appendBytes:&v8 length:1];
    return v8;
  }

  else
  {
    unsigned __int8 v5 = a3;
    v7[0] = 125;
    v7[1] = a3 ^ 0x20;
    [*a4 appendBytes:v7 length:2];
  }

  return v5;
}

- (id)sendCommand:(unsigned __int8)a3 payload:(char *)a4 payload_length:(unsigned __int16)a5
{
  LODWORD(v5) = a5;
  uint64_t v7 = a3;
  -[iAUPServer logCommand:payload:length:](self, "logCommand:payload:length:");
  int v9 = -[NSMutableData initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithCapacity:",  (v5 + 4));
  unsigned __int8 v10 = v9;
  unsigned int v18 = v9;
  if (self->_byteEscape)
  {
    char v11 = 126;
  }

  else
  {
    char v19 = -1;
    -[NSMutableData appendBytes:length:](v9, "appendBytes:length:", &v19, 1LL);
    char v11 = 92;
  }

  char v19 = v11;
  -[NSMutableData appendBytes:length:](v10, "appendBytes:length:", &v19, 1LL, v18);
  unsigned int v12 = -[iAUPServer appendByteWithEscaping:toObject:]( self,  "appendByteWithEscaping:toObject:",  ((unsigned __int16)(v5 + 1) >> 8),  &v18);
  unsigned int v13 = -[iAUPServer appendByteWithEscaping:toObject:]( self,  "appendByteWithEscaping:toObject:",  (v5 + 1),  &v18)
      + v12;
  unsigned int v14 = v13 + -[iAUPServer appendByteWithEscaping:toObject:](self, "appendByteWithEscaping:toObject:", v7, &v18);
  if ((_DWORD)v5)
  {
    uint64_t v5 = v5;
    do
    {
      unsigned int v15 = *a4++;
      v14 += -[iAUPServer appendByteWithEscaping:toObject:](self, "appendByteWithEscaping:toObject:", v15, &v18);
      --v5;
    }

    while (v5);
  }

  -[iAUPServer appendByteWithEscaping:toObject:]( self,  "appendByteWithEscaping:toObject:",  -(char)v14,  &v18);
  id v16 = -[iAUPServerDelegate writeData:](self->_delegate, "writeData:", v18);

  return v16;
}

- (void)setBootloaderEntry
{
}

- (id)processManifestProperties:(char *)a3 length:(unsigned int)a4
{
  uint64_t serverState = self->_serverState;
  if ((_DWORD)serverState != 7)
  {
    NSLog( @"[ProcessManifest] Invalid State=%s\n",  -[iAUPServer serverStateString:](self, "serverStateString:", serverState, *(void *)&a4));
    return 0LL;
  }

  if (a4 - 1 <= 3)
  {
    NSLog(@"%s: Invalid payload length=%d\n", "-[iAUPServer processManifestProperties:length:]", a4);
    return 0LL;
  }

  unsigned int v7 = bswap32(*(_DWORD *)(a3 + 1));
  unsigned int v8 = -[iAUPServerDelegate getWhitelistedPersonalizationFields]( self->_delegate,  "getWhitelistedPersonalizationFields");
  __int16 v9 = v7 & v8;
  if ((~(v7 & v8) & 0x5F) != 0)
  {
    NSLog( @"%s: Invalid personalization properties from accessory = %08x\n",  "-[iAUPServer processManifestProperties:length:]",  v7 & v8);
    return 0LL;
  }

  if (a4 - 5 <= 3)
  {
    NSLog( @"%s: BoardId not present in remaining bytes=%d\n",  "-[iAUPServer processManifestProperties:length:]",  a4 - 5);
    return 0LL;
  }

  uint64_t v10 = bswap32(*(_DWORD *)(a3 + 5));
  if (!(_DWORD)v10)
  {
    NSLog(@"%s: Invalid boardID = %d\n", "-[iAUPServer processManifestProperties:length:]", 0LL);
    return 0LL;
  }

  if (a4 - 9 <= 3)
  {
    NSLog( @"%s: ChipId not present in remaining bytes=%d\n",  "-[iAUPServer processManifestProperties:length:]",  a4 - 9);
    return 0LL;
  }

  uint64_t v11 = bswap32(*(_DWORD *)(a3 + 9));
  if (!(_DWORD)v11)
  {
    NSLog(@"%s: Invalid chipID = %d\n", "-[iAUPServer processManifestProperties:length:]", 0LL);
    return 0LL;
  }

  if (a4 - 13 <= 7)
  {
    NSLog( @"%s: Ecid not present in remaining bytes=%d\n",  "-[iAUPServer processManifestProperties:length:]",  a4 - 13);
    return 0LL;
  }

  unint64_t v12 = bswap64(*(void *)(a3 + 13));
  if (!v12)
  {
    NSLog(@"%s: Invalid ecID = %llu\n", "-[iAUPServer processManifestProperties:length:]", 0LL);
    return 0LL;
  }

  if (a4 == 21)
  {
    NSLog( @"%s: SecurityDomain not present in remaining bytes=%d\n",  "-[iAUPServer processManifestProperties:length:]",  0LL);
    return 0LL;
  }

  if (a4 == 22)
  {
    NSLog( @"%s: ProductionMode not present in remaining bytes=%d\n",  "-[iAUPServer processManifestProperties:length:]",  0LL);
    return 0LL;
  }

  uint64_t v13 = a3[21];
  int v14 = a3[22];
  if ((v9 & 0x20) != 0)
  {
    if (a4 == 23)
    {
LABEL_46:
      NSLog( @"%s: SecurityMode not present in remaining bytes=%d\n",  "-[iAUPServer processManifestProperties:length:]",  0LL);
      return 0LL;
    }

    BOOL v15 = a3[23] != 0;
    unsigned int v16 = 24;
  }

  else
  {
    BOOL v15 = 0;
    unsigned int v16 = 23;
  }

  if (a4 - v16 <= 0x1F)
  {
    NSLog( @"%s: Nonce not present in remaining bytes=%d\n",  "-[iAUPServer processManifestProperties:length:]",  a4 - v16);
    return 0LL;
  }

  BOOL v27 = v15;
  v17 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &a3[v16], 32LL);
  if (!v17)
  {
    NSLog(@"%s: Invalid nonce from accessory", "-[iAUPServer processManifestProperties:length:]");
    return 0LL;
  }

  unsigned int v18 = v17;
  uint64_t v19 = v16 | 0x20LL;
  if ((v9 & 0x80) != 0)
  {
    if ((_DWORD)v19 == a4)
    {
      NSLog( @"%s: ChipEpoch not present in remaining bytes=%d\n",  "-[iAUPServer processManifestProperties:length:]",  0LL);
      return 0LL;
    }

    uint64_t v22 = a3[v19];
    LODWORD(v19) = v16 + 33;
    uint64_t v20 = v22;
    if ((v9 & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }

  uint64_t v20 = 0LL;
  if ((v9 & 0x100) != 0)
  {
LABEL_23:
    if ((_DWORD)v19 != a4)
    {
      BOOL v21 = a3[v19] != 0;
      goto LABEL_25;
    }

    goto LABEL_46;
  }

- (void)processPersonalizationInfo:(char *)a3 length:(unsigned int)a4
{
  if (!a3 || !a4)
  {
    NSLog(@"[processPersonalizationInfo] Invalid payload length=%d\n", a2, a4);
    goto LABEL_6;
  }

  if ((*a3 & 0xF) != 1)
  {
    NSLog(@"[processPersonalizationInfo] Unsupported infoType = %d\n", a2, *a3);
LABEL_6:
    id v5 = 0LL;
    goto LABEL_7;
  }

  id v5 = -[iAUPServer processManifestProperties:length:](self, "processManifestProperties:length:");
LABEL_7:
  -[iAUPServerDelegate processPersonalizationInfoFromAccessory:]( self->_delegate,  "processPersonalizationInfoFromAccessory:",  v5);
}

- (BOOL)personalizationComplete
{
  if (!self->_firmwareBundle)
  {
    NSLog(@"[personalizationComplete] Invalid state: firmwareBundle = NULL", a2);
    goto LABEL_12;
  }

  if (self->_currentAsset != 1)
  {
    NSLog(@"[personalizationComplete] Invalid asset for processing personalization", a2);
    goto LABEL_12;
  }

  if (-[iAUPServerDelegate getPersonalizationID](self->_delegate, "getPersonalizationID") >= 0x10)
  {
    unsigned __int8 currentAsset = -[iAUPServerDelegate getPersonalizationID](self->_delegate, "getPersonalizationID");
    NSLog(@"[RequestDownload] Sending COMMAND_GetPersonalizationInfo");
    BOOL v4 = 1;
    if (!-[iAUPServer sendCommand:payload:payload_length:]( self,  "sendCommand:payload:payload_length:",  66LL,  &currentAsset,  1LL)) {
      return v4;
    }
    NSLog(@"[personalizationComplete] Failed to send next Personalization request", v5);
LABEL_12:
    unsigned __int8 currentAsset = -1;
    -[iAUPServer sendCommand:payload:payload_length:]( self,  "sendCommand:payload:payload_length:",  99LL,  &currentAsset,  1LL);
    return 0;
  }

  unsigned __int8 currentAsset = self->_currentAsset;
  if (-[iAUPServer sendCommand:payload:payload_length:]( self,  "sendCommand:payload:payload_length:",  97LL,  &currentAsset,  1LL))
  {
    NSLog(@"[personalizationComplete] Failed to send AckRequestDownload", v3);
    goto LABEL_12;
  }

  -[iAUPServer setServerState:](self, "setServerState:", 6LL);
  return 1;
}

- (void)setResumeInfo:(char *)a3 length:(unsigned int)a4
{
  if ((self->_accessoryCapabilities & 1) != 0)
  {
    if (self->_startEventSent)
    {
      NSLog(@"[setResumeInfo] Information already sent to delegate, skipping this\n", a2, a3, *(void *)&a4);
    }

    else if (a4 == 18)
    {
      unsigned int v6 = *(unsigned __int16 *)a3;
      unsigned int v7 = *(_DWORD *)(a3 + 2);
      unsigned int v8 = *(_DWORD *)(a3 + 6);
      uint64_t v9 = bswap32(*(_DWORD *)(a3 + 10));
      if (v9 > -[FirmwareBundle firmwareImageSize](self->_firmwareBundle, "firmwareImageSize"))
      {
        uint64_t v21 = -[FirmwareBundle firmwareImageSize](self->_firmwareBundle, "firmwareImageSize");
        NSLog( @"[setResumeInfo] Invalid totalBytesForCompleteUpdate = %lu, firmwareImageSize = %lu\n",  v18,  v19,  v20,  v9,  v21);
      }

      else
      {
        uint64_t v13 = bswap32(*(_DWORD *)(a3 + 14));
        if (v13 >= v9)
        {
          NSLog( @"[setResumeInfo] Invalid totalBytesDownloadedSoFar = %lu, totalBytesForCompleteUpdate = %lu\n",  v10,  v11,  v12,  v13,  v9);
        }

        else
        {
          uint64_t v14 = __rev16(v6);
          v22[0] = @"resumeCount";
          v23[0] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v14);
          v22[1] = @"cumulativeUpdateTime";
          v23[1] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", bswap32(v7));
          v22[2] = @"cumulativeCloakTime";
          v23[2] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", bswap32(v8));
          v22[3] = @"totalBytesForCompleteUpdate";
          v23[3] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v9);
          v22[4] = @"totalBytesDownloadedSoFar";
          v23[4] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v13);
          BOOL v15 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  5LL));
          unsigned int v16 = v15;
          if ((_DWORD)v14) {
            v17 = @"com.apple.fud.updateResumed";
          }
          else {
            v17 = @"com.apple.fud.updateStarted";
          }
          -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v17, @"Event");
          -[iAUPServerDelegate handleFirmwareUpdateStatus:](self->_delegate, "handleFirmwareUpdateStatus:", v16);
          self->_startEventSent = 1;
          -[iAUPServer sendCommand:payload:payload_length:]( self,  "sendCommand:payload:payload_length:",  135LL,  0LL,  0LL);
        }
      }
    }

    else
    {
      NSLog(@"[setResumeInfo] Invalid payload length=%d\n", a2, a3, *(void *)&a4, a4);
    }
  }

  else
  {
    NSLog(@"[setResumeInfo] accessory capabilities not set to allow resume\n", a2, a3, *(void *)&a4);
  }

- (void)processIdentifyCommand:(char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned int v7 = "valid";
  if (!a3) {
    unsigned int v7 = "nil";
  }
  NSLog(@"%s(): payload=%s length=%d \n", a2, "-[iAUPServer processIdentifyCommand:length:]", v7, a4);
  if (self->_serverState == 1)
  {
    if ((_DWORD)v4 == 1)
    {
      if (*a3 == 2)
      {
        -[iAUPServer setIAUPVersion:](self, "setIAUPVersion:", 2LL);
        -[iAUPServer setServerState:](self, "setServerState:", 2LL);
        -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 96LL, 0LL, 0LL);
        -[iAUPServer setServerState:](self, "setServerState:", 3LL);
        return;
      }

      NSLog(@"[Identify] Invalid protocol version=%d\n", *a3);
    }

    else
    {
      NSLog(@"[Identify] Invalid payload length=%d\n", v4);
    }
  }

  else
  {
    NSLog(@"[Identify] Invalid State=%s\n", -[iAUPServer serverStateString:](self, "serverStateString:"));
  }

  -[iAUPServer setIAUPVersion:](self, "setIAUPVersion:", 2LL);
  -[iAUPServer setServerState:](self, "setServerState:", 0LL);
  unsigned int v8 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.iAUPServer.ErrorDomain",  -1LL,  0LL);
  uint64_t v9 = @"Event";
  uint64_t v10 = @"com.apple.fud.updateFailed";
  -[iAUPServerDelegate firmwareUpdateComplete:error:]( self->_delegate,  "firmwareUpdateComplete:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL),  v8);
}

- (void)processRequestDownloadCommand:(char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned int v7 = "valid";
  if (!a3) {
    unsigned int v7 = "nil";
  }
  NSLog(@"%s(): payload=%s length=%d \n", a2, "-[iAUPServer processRequestDownloadCommand:length:]", v7, a4);
  if (!(_DWORD)v4)
  {
    NSLog(@"[RequestDownload] Invalid payload length=%d\n", 0LL);
    return;
  }

  if (*a3 >= 2u)
  {
    NSLog(@"[RequestDownload] Unsupported asset type=%d\n", *a3);
    return;
  }

  if (self->_serverState != 3)
  {
    NSLog( @"[RequestDownload] Invalid State=%s\n",  -[iAUPServer serverStateString:](self, "serverStateString:"));
    goto LABEL_27;
  }

  -[iAUPServer setServerState:](self, "setServerState:", 4LL);
  if (*a3 != 1)
  {
    if (!*a3)
    {
      if (v4 <= 5)
      {
        NSLog(@"[RequestDownload] Invalid HS Asset payload length=%d\n", v4);
      }

      else
      {
        uint64_t serverState = self->_serverState;
        uint64_t v9 = a3[1];
        uint64_t v10 = a3[2];
        uint64_t v11 = a3[3];
        uint64_t v12 = a3[4];
        uint64_t v13 = a3[5];
        uint64_t v14 = objc_alloc_init(&OBJC_CLASS___HSModel);
        self->_hsModel = v14;
        if (v14)
        {
          -[HSModel setDelegate:](v14, "setDelegate:", self);
          -[iAUPServer setServerState:](self, "setServerState:", 5LL);
          -[iAUPServer setCurrentAsset:](self, "setCurrentAsset:", 0LL);
          if (-[HSModel getHSModelForEngineMajorVersion:minorVersion:numHSModels:modelBuffer:length:]( self->_hsModel,  "getHSModelForEngineMajorVersion:minorVersion:numHSModels:modelBuffer:length:",  v10 | (v9 << 8),  v12 | (v11 << 8),  v13,  a3 + 6,  (v4 - 6)))
          {
            return;
          }

          NSLog(@"[RequestDownload] Failed to create HS Model instance\n");
          -[iAUPServer setServerState:](self, "setServerState:", serverState);
        }

        else
        {
          NSLog(@"[RequestDownload] Failed to create HS Model instance\n", v18);
        }
      }
    }

    goto LABEL_27;
  }

  if (-[iAUPServer iAUPVersion](self, "iAUPVersion") <= 1)
  {
    NSLog(@"[RequestDownload] RequestDownload not supported in this protocol version", v18);
    goto LABEL_27;
  }

  if (-[iAUPServer iAUPVersion](self, "iAUPVersion") != 2)
  {
LABEL_27:
    uint64_t v16 = 0LL;
    v17 = 0LL;
    goto LABEL_28;
  }

  if (-[iAUPServerDelegate updateRequiresPersonalization]( self->_delegate,  "updateRequiresPersonalization"))
  {
    unsigned __int8 v19 = -[iAUPServerDelegate getPersonalizationID](self->_delegate, "getPersonalizationID");
    NSLog(@"[RequestDownload] Sending COMMAND_GetPersonalizationInfo");
    if (!-[iAUPServer sendCommand:payload:payload_length:]( self,  "sendCommand:payload:payload_length:",  66LL,  &v19,  1LL))
    {
      uint64_t v15 = 7LL;
LABEL_19:
      -[iAUPServer setServerState:](self, "setServerState:", v15);
      -[iAUPServer setCurrentAsset:](self, "setCurrentAsset:", 1LL);
      return;
    }

    uint64_t v16 = 4294967291LL;
    v17 = @"Failed to send Personalization Request";
  }

  else
  {
    unsigned __int8 v19 = 1;
    if (!-[iAUPServer sendCommand:payload:payload_length:]( self,  "sendCommand:payload:payload_length:",  97LL,  &v19,  1LL))
    {
      uint64_t v15 = 6LL;
      goto LABEL_19;
    }

    NSLog(@"[RequestDownload] Failed to send AckRequestDownload");
    v17 = 0LL;
    uint64_t v16 = 0LL;
  }

- (void)processDownloadCompleteCommand:(char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned int v7 = "valid";
  if (!a3) {
    unsigned int v7 = "nil";
  }
  NSLog(@"%s(): payload=%s length=%d \n", a2, "-[iAUPServer processDownloadCompleteCommand:length:]", v7, a4);
  int serverState = self->_serverState;
  if (serverState != 3 && serverState != 6)
  {
    NSLog( @"[DownloadComplete] Invalid State=%s\n",  -[iAUPServer serverStateString:](self, "serverStateString:"));
LABEL_11:
    -[iAUPServer setServerState:](self, "setServerState:", 0LL);
    uint64_t v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.iAUPServer.ErrorDomain",  -1LL,  0LL);
    uint64_t v13 = @"Event";
    uint64_t v14 = @"com.apple.fud.updateFailed";
    -[iAUPServerDelegate firmwareUpdateComplete:error:]( self->_delegate,  "firmwareUpdateComplete:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL),  v12);

    return;
  }

  if ((_DWORD)v4 != 2)
  {
    NSLog(@"[DownloadComplete] Invalid payload length=%d\n", v4);
    goto LABEL_11;
  }

  unsigned __int8 v10 = a3[1];
  self->_restartRequired |= v10 >> 7;
  self->_sleepWakeRequired |= (a3[1] & 0x40) != 0;
  uint64_t v11 = (a3[1] >> 5) & 1 | self->_urgentUpdate;
  self->_urgentUpdate |= (a3[1] & 0x20) != 0;
  NSLog( @"[DownloadComplete] downloadStatus=%d noMoreDownloads=%d urgentUpdateRequest=%d\n",  *a3,  v10 & 1,  v11);
  if ((v10 & 1) != 0)
  {
    -[iAUPServer setServerState:](self, "setServerState:", 0LL);
    uint64_t v15 = @"Event";
    uint64_t v16 = @"com.apple.fud.updateCompleted";
    -[iAUPServerDelegate firmwareUpdateComplete:error:]( self->_delegate,  "firmwareUpdateComplete:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL),  0LL);
  }

  else
  {
    -[iAUPServer setServerState:](self, "setServerState:", 3LL);
    -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 98LL, 0LL, 0LL);
  }

  self->_unsigned __int8 currentAsset = 4;

  self->_firmwareBundle = 0LL;
}

- (void)processNotifyAccessoryErrorCommand:(char *)a3 length:(unsigned int)a4
{
  unsigned int v6 = "valid";
  if (!a3) {
    unsigned int v6 = "nil";
  }
  NSLog( @"%s(): payload=%s length=%d \n",  a2,  "-[iAUPServer processNotifyAccessoryErrorCommand:length:]",  v6,  a4);
  NSLog(@"[NotifyAccessoryError] Accessory notified error reason=%d\n", *a3);
  -[iAUPServer setServerState:](self, "setServerState:", 0LL);
  unsigned int v7 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.iAUPServer.ErrorDomain",  -1LL,  0LL);
  unsigned int v8 = @"Event";
  uint64_t v9 = @"com.apple.fud.updateFailed";
  -[iAUPServerDelegate firmwareUpdateComplete:error:]( self->_delegate,  "firmwareUpdateComplete:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL),  v7);

  self->_firmwareBundle = 0LL;
}

- (void)accessoryDisconnected
{
  hsModel = self->_hsModel;
  if (hsModel)
  {
    -[HSModel setDelegate:](hsModel, "setDelegate:", 0LL);

    self->_hsModel = 0LL;
  }

- (void)setHSModel:(id)a3 fallbackModel:(id)a4 error:(id)a5
{
  dispatchQ = (dispatch_queue_s *)self->_dispatchQ;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001116C;
  v6[3] = &unk_10002D8A8;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = self;
  dispatch_async(dispatchQ, v6);
}

- (char)commandString:(int)a3
{
  if (a3 <= 65)
  {
    switch(a3)
    {
      case 0:
        result = "COMMAND_GetMetadata";
        break;
      case 1:
        result = "COMMAND_NotifyProcessStatus";
        break;
      case 2:
        result = "COMMAND_SetBlockTransferSize";
        break;
      case 3:
        result = "COMMAND_SetBaseImageTransferAddress";
        break;
      case 4:
        result = "COMMAND_GetObjectSize";
        break;
      case 5:
        result = "COMMAND_GetObjectBlock";
        break;
      case 6:
        result = "COMMAND_SetAccessoryCapabilities";
        break;
      case 7:
        result = "COMMAND_SetResumeInfo";
        break;
      default:
        result = "COMMAND_iAUPv2_Identify";
        switch(a3)
        {
          case ' ':
            return result;
          case '!':
            result = "COMMAND_iAUPv2_RequestDownload";
            break;
          case '""':
            result = "COMMAND_iAUPv2_DownloadComplete";
            break;
          case '#':
            result = "COMMAND_iAUPv2_NotifyAccessoryError";
            break;
          default:
LABEL_31:
            result = "unknown";
            break;
        }

        break;
    }
  }

  else
  {
    switch(a3)
    {
      case 128:
        result = "COMMAND_RetMetadata";
        break;
      case 129:
        result = "COMMAND_AckNotifyProcessStatus";
        break;
      case 130:
        result = "COMMAND_AckSetBlockTransferSize";
        break;
      case 131:
        result = "COMMAND_AckSetBaseImageTransferAddress";
        break;
      case 132:
        result = "COMMAND_RetObjectSize";
        break;
      case 133:
        result = "COMMAND_RetObjectBlock";
        break;
      case 134:
        result = "COMMAND_AckAccessoryCapabilities";
        break;
      case 135:
        result = "COMMAND_AckResumeInfo";
        break;
      default:
        switch(a3)
        {
            result = "COMMAND_iAUPv2_AckIdentify";
            break;
          case 'a':
            result = "COMMAND_iAUPv2_AckRequestDownload";
            break;
          case 'b':
            result = "COMMAND_iAUPv2_AckDownloadComplete";
            break;
          case 'c':
            result = "COMMAND_iAUPv2_NotifyDeviceError";
            break;
          default:
            if (a3 != 66) {
              goto LABEL_31;
            }
            result = "COMMAND_GetPersonalizationInfo";
            break;
        }

        break;
    }
  }

  return result;
}

- (char)assetTypeString:(int)a3
{
  else {
    return off_10002D8C8[a3];
  }
}

- (char)serverStateString:(int)a3
{
  else {
    return off_10002D8E0[a3];
  }
}

- (char)parserStateString:(int)a3
{
  else {
    return off_10002D920[a3 + 4];
  }
}

- (iAUPServerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (iAUPServerDelegate *)a3;
}

- (FirmwareBundle)firmwareBundle
{
  return self->_firmwareBundle;
}

- (BOOL)byteEscape
{
  return self->_byteEscape;
}

- (void)setByteEscape:(BOOL)a3
{
  self->_byteEscape = a3;
}

- (int)serverState
{
  return self->_serverState;
}

- (int)parserState
{
  return self->_parserState;
}

- (BOOL)restartRequired
{
  return self->_restartRequired;
}

- (BOOL)sleepWakeRequired
{
  return self->_sleepWakeRequired;
}

- (BOOL)urgentUpdate
{
  return self->_urgentUpdate;
}

- (BOOL)ackAppReentry
{
  return self->_ackAppReentry;
}

- (void)setAckAppReentry:(BOOL)a3
{
  self->_ackAppReentry = a3;
}

- (OS_dispatch_queue)dispatchQ
{
  return self->_dispatchQ;
}

- (void)setDispatchQ:(id)a3
{
}

- (unsigned)iAUPVersion
{
  return self->_iAUPVersion;
}

- (void)setIAUPVersion:(unsigned __int8)a3
{
  self->_iAUPVersion = a3;
}

- (unsigned)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(unsigned __int8)a3
{
  self->_unsigned __int8 currentAsset = a3;
}

@end