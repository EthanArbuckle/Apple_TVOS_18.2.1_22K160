@interface PDControllerType4
+ (id)createForDecode;
+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4;
- (BOOL)isSPIMaster;
- (BOOL)supportsRemote;
- (NSDictionary)dpmrConfigs;
- (PDControllerType4)initWithAddress:(unsigned __int8)a3 userClient:(id)a4;
- (id)dpmrSubCommandFormatterHexDumpWithBuffer:(void *)a3 length:(unint64_t)a4 inputBuffer:(void *)a5 andInputLength:(unint64_t)a6;
- (id)getDeviceInfoNameWithConfigOnly:(BOOL)a3;
- (id)readFullVersion;
- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5;
- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5 prefixString:(id)a6;
- (id)stringForTitle:(id)a3 valueString:(id)a4;
- (id)stringForValue:(unsigned int)a3 table:(id)a4;
- (id)stringForValue:(unsigned int)a3 table:(id)a4 prefixString:(id)a5;
- (int)dataBuffer:(char *)a3 fromHexString:(id)a4 ofLengthString:(id)a5;
- (int)printAll;
- (int)printAllDPMrSubcommands;
- (int)printDBStateHistory;
- (int)printDPMrSubCommand:(id)a3 withDeviceConfig:(id)a4;
- (int)printDPMrSubCommand:(id)a3 withDeviceConfig:(id)a4 writeBuffer:(void *)a5 writeLength:(unint64_t)a6 readBuffer:(void *)a7 readLength:(unint64_t)a8;
- (int)printDPMrSubCommand:(id)a3 withTitle:(id)a4 andDescription:(id)a5;
- (int)printIECSAceSpecificInfo;
- (int)printIECSStandardInfo;
- (int)printInfo;
- (int)printPDStateHistory;
- (int)printStateHistory;
- (int)printTBRrIfIntelRetimerPresent;
- (int)printTitle;
- (unsigned)chrisTracy:(id)a3;
- (unsigned)majorVersionNumber;
- (void)setDPMrConfigs;
- (void)setDpmrConfigs:(id)a3;
@end

@implementation PDControllerType4

+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithAddress:v4 userClient:v6];

  return v7;
}

- (BOOL)supportsRemote
{
  return 1;
}

+ (id)createForDecode
{
  return 0LL;
}

- (PDControllerType4)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PDControllerType4;
  uint64_t v4 = -[PDControllerType2 initWithAddress:userClient:](&v6, "initWithAddress:userClient:", a3, a4);
  -[PDControllerType4 setDPMrConfigs](v4, "setDPMrConfigs");
  return v4;
}

- (int)printIECSStandardInfo
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = [&off_10001CD88 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v11;
  do
  {
    for (i = 0LL; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(&off_10001CD88);
      }
      unsigned int v7 = -[PDController printRegister:]( self,  "printRegister:",  [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) unsignedCharValue]);
    }

    int v8 = v7;
    id v4 = [&off_10001CD88 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }

  while (v4);
  return v8;
}

- (int)printIECSAceSpecificInfo
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = [&off_10001CDA0 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v11;
  do
  {
    for (i = 0LL; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(&off_10001CDA0);
      }
      unsigned int v7 = -[PDController printRegister:]( self,  "printRegister:",  [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) unsignedCharValue]);
    }

    int v8 = v7;
    id v4 = [&off_10001CDA0 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }

  while (v4);
  return v8;
}

- (int)printTitle
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  unsigned int v4 = [v3 routerID];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  printf( "HPM at RID 0x%x Route 0x%llx Address 0x%02x :\n",  v4,  [v5 routeString],  -[PDController address](self, "address"));

  return 0;
}

- (int)printInfo
{
  int result = -[PDControllerType4 printTitle](self, "printTitle");
  if (!result)
  {
    putchar(10);
    int result = -[PDControllerType4 printIECSStandardInfo](self, "printIECSStandardInfo");
    if (!result)
    {
      id v4 = objc_claimAutoreleasedReturnValue( -[PDControllerType2 readFullVersionWithConfig]( self, "readFullVersionWithConfig"));
      printf("0x0f %-22s %s\n", "FW Versions", (const char *)[v4 UTF8String]);

      putchar(10);
      return -[PDControllerType4 printIECSAceSpecificInfo](self, "printIECSAceSpecificInfo");
    }
  }

  return result;
}

- (int)printAll
{
  int result = -[PDControllerType4 printTitle](self, "printTitle");
  if (!result)
  {
    putchar(10);
    unsigned __int8 v4 = 0;
    while (1)
    {
      int result = -[PDController printRegister:](self, "printRegister:", v4);
      if (result) {
        break;
      }
      if ((++v4 & 0x80) != 0)
      {
        *(void *)&__int128 v5 = 0xFEFEFEFEFEFEFEFELL;
        *((void *)&v5 + 1) = 0xFEFEFEFEFEFEFEFELL;
        v6[2] = v5;
        v6[3] = v5;
        v6[0] = v5;
        v6[1] = v5;
        -[PDController printCommand:withWriteData:withWriteLength:]( self,  "printCommand:withWriteData:withWriteLength:",  1212377195LL,  v6,  64LL);
        LODWORD(v6[0]) = 0;
        -[PDController printCommand:withWriteData:withWriteLength:]( self,  "printCommand:withWriteData:withWriteLength:",  1094992754LL,  v6,  4LL);
        -[PDControllerType4 printAllDPMrSubcommands](self, "printAllDPMrSubcommands");
        -[PDControllerType4 printTBRrIfIntelRetimerPresent](self, "printTBRrIfIntelRetimerPresent");
        return 0;
      }
    }
  }

  return result;
}

- (int)printTBRrIfIntelRetimerPresent
{
  unint64_t v7 = 0LL;
  int result = -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v8,  64LL,  41LL,  &v7);
  if (!result)
  {
    int result = -536870160;
    if (v7 >= 0x3F)
    {
      if ((v9 & 0xF) != 0 && (v9 & 0xF) != 14)
      {
        char v6 = 4;
        __int16 v5 = 48;
        return -[PDController printCommand:withWriteData:withWriteLength:]( self,  "printCommand:withWriteData:withWriteLength:",  1413632626LL,  &v5,  3LL);
      }
    }

    else
    {
      return -536870212;
    }
  }

  return result;
}

- (int)printAllDPMrSubcommands
{
  uint64_t v27 = 0LL;
  id v3 = (char *)malloc(0x40uLL);
  if (v3)
  {
    unsigned __int8 v4 = v3;
    -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v3,  64LL,  41LL,  &v27);
    int v22 = *(unsigned __int16 *)(v4 + 61);
    free(v4);
  }

  else
  {
    int v22 = 0;
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      int v8 = 0LL;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v8);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"mask"]);
        unsigned int v13 = [v12 unsignedIntegerValue];

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v9]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"match"]);
        unsigned __int16 v17 = (unsigned __int16)[v16 unsignedIntegerValue];

        if ((v22 & v13) == v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v9]);
          -[PDControllerType4 printDPMrSubCommand:withDeviceConfig:]( self,  "printDPMrSubCommand:withDeviceConfig:",  v9,  v19);
        }

        int v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v6);
  }

  return 0;
}

- (unsigned)majorVersionNumber
{
  id v3 = (unsigned __int8 *)malloc(4uLL);
  if (!v3) {
    return 0;
  }
  unsigned __int8 v4 = v3;
  -[PDController registerRead:ofLength:atAddress:](self, "registerRead:ofLength:atAddress:", v3, 4LL, 15LL);
  unsigned __int16 v5 = v4[2];
  free(v4);
  return v5;
}

- (int)dataBuffer:(char *)a3 fromHexString:(id)a4 ofLengthString:(id)a5
{
  id v7 = a4;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", a5));
  [v8 scanHexInt:&v17];
  if (v7)
  {
    unint64_t v9 = (unint64_t)[v7 length];
    if (v17 == v9 >> 1 && v17 != 0)
    {
      uint64_t v11 = 0LL;
      unint64_t v12 = 0LL;
      do
      {
        unsigned int v13 = (void *)[v7 substringWithRange:v11];
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v13));
        [v14 scanHexInt:&v16];
        a3[v12] = v16;

        ++v12;
        v11 += 2LL;
      }

      while (v12 < v17);
    }
  }

  return 0;
}

- (int)printPDStateHistory
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned __int8 v4 = malloc(0x40uLL);
  -[PDControllerType4 majorVersionNumber](self, "majorVersionNumber");
  uint64_t v5 = 0LL;
  int v24 = 0;
  int v27 = 1346655092;
  LOBYTE(v6) = 1;
  int v26 = 1;
  if (v4) {
    int v7 = 0;
  }
  else {
    int v7 = -536870211;
  }
  while (2)
  {
    if (!v7)
    {
      unsigned int v8 = -[PDController registerWrite32:atAddress:](self, "registerWrite32:atAddress:", 1LL, 9LL);
      if (v8
        || (unsigned int v8 = -[PDController executeIECSCommand:](self, "executeIECSCommand:", 1346655092LL)) != 0
        || (unsigned int v8 = -[PDController registerRead:ofLength:atAddress:]( self,  "registerRead:ofLength:atAddress:",  v4,  64LL,  9LL)) != 0)
      {
        int v7 = v8;
      }

      else
      {
        LODWORD(v22) = 4194368;
        int v7 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDat aLength:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v27,  &v26,  0LL,  v4,  0LL,  v22,  10LL);
        if (!v7)
        {
          uint64_t v5 = *(unsigned __int16 *)v4;
          LOBYTE(v6) = v4[2];
        }
      }
    }

    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  v4,  4LL));
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:0]);
    -[PDController printRegisterTitle:andDescription:]( self,  "printRegisterTitle:andDescription:",  @"PDSt(0)",  v10);

    else {
      int v6 = v6;
    }
    unsigned int v11 = v6 + 2;
    unsigned __int16 v25 = 2;
    do
    {
      while (1)
      {
        if (!v7)
        {
          LODWORD(v22) = 4194368;
          int v7 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputD ataLength:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v27,  &v25,  0LL,  v4,  0LL,  v22,  10LL);
          if (!v7) {
            break;
          }
        }

        if (v11 <= ++v25) {
          goto LABEL_25;
        }
      }

      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  v4,  64LL));
      [v3 addObjectsFromArray:v12];

      int v7 = 0;
      ++v25;
    }

    while (v11 > v25);
    LODWORD(v22) = 4194368;
    unsigned int v13 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLe ngth:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v27,  &v26,  0LL,  v4,  0LL,  v22,  10LL);
    if (v13)
    {
      int v7 = v13;
LABEL_25:
      if (v4) {
        free(v4);
      }
      goto LABEL_36;
    }

    if (*(unsigned __int16 *)v4 == (_DWORD)v5)
    {
      v14 = v3;
    }

    else
    {
      [v23 addObjectsFromArray:v3];
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));

      ++v24;
      uint64_t v15 = *(unsigned __int16 *)v4;
      int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PDSt mismatch %d",  v24));
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Start ptr = 0x%04x | End ptr = 0x%04x",  v5,  v15));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", v16, v17));
      [v23 addObject:v18];

      if (v24 < 5u)
      {

        int v7 = 0;
        id v3 = v14;
        continue;
      }

      [v14 addObjectsFromArray:v23];
    }

    break;
  }

  free(v4);
  if ([v14 count])
  {
    unint64_t v19 = 0LL;
    do
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:v19]);
      if (v19) {
        -[PDController printRegisterDescription:](self, "printRegisterDescription:", v20);
      }
      else {
        -[PDController printRegisterTitle:andDescription:]( self,  "printRegisterTitle:andDescription:",  @"'PDSt'",  v20);
      }

      ++v19;
    }

    while ((unint64_t)[v14 count] > v19);
  }

  int v7 = 0;
  id v3 = v14;
LABEL_36:

  return v7;
}

- (int)printDBStateHistory
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  int v18 = 0;
  int v19 = 1145197428;
  unsigned __int8 v4 = (unsigned __int8 *)malloc(0x40uLL);
  -[PDControllerType4 majorVersionNumber](self, "majorVersionNumber");
  if (v4)
  {
    LODWORD(v16) = 4194368;
    unsigned int v5 = 1;
    int v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLen gth:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v19,  &v18,  0LL,  v4,  0LL,  v16,  10LL);
    if (!v6) {
      unsigned int v5 = v4[2];
    }
  }

  else
  {
    int v6 = -536870211;
    unsigned int v5 = 1;
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  v4,  8LL));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);
  -[PDController printRegisterTitle:andDescription:](self, "printRegisterTitle:andDescription:", @"DBSt(0)", v8);

  if (v5 <= 4) {
    unsigned int v9 = 4;
  }
  else {
    unsigned int v9 = v5;
  }
  for (unsigned __int16 i = 1; i <= v9; ++i)
  {
    while (1)
    {
      if (!v6)
      {
        LODWORD(v16) = 4194368;
        int v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDat aLength:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v19,  &i,  0LL,  v4,  0LL,  v16,  10LL);
        if (!v6) {
          break;
        }
      }

      if (v9 < ++i) {
        goto LABEL_15;
      }
    }

    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  v4,  64LL));
    [v3 addObjectsFromArray:v10];

    int v6 = 0;
  }

  LODWORD(v16) = 4194368;
  int v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLengt h:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v19,  &v18,  0LL,  v4,  0LL,  v16,  10LL);
  if (v6)
  {
LABEL_15:
    if (!v4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  v4,  2LL));
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);
  -[PDController printRegisterDescription:](self, "printRegisterDescription:", v13);

  if ([v3 count])
  {
    unint64_t v14 = 0LL;
    do
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v14]);
      if (v14) {
        -[PDController printRegisterDescription:](self, "printRegisterDescription:", v15);
      }
      else {
        -[PDController printRegisterTitle:andDescription:]( self,  "printRegisterTitle:andDescription:",  @"'DBSt'",  v15);
      }

      ++v14;
    }

    while ((unint64_t)[v3 count] > v14);
  }

  int v6 = 0;
  if (v4) {
LABEL_16:
  }
    free(v4);
LABEL_17:

  return v6;
}

- (int)printStateHistory
{
  return -[PDControllerType4 printDBStateHistory](self, "printDBStateHistory");
}

- (id)stringForValue:(unsigned int)a3 table:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  if (!v7) {
    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown (0x%x)",  v4));
  }
  return v7;
}

- (id)stringForValue:(unsigned int)a3 table:(id)a4 prefixString:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if (v10)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v7, v10));
  }

  else
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown (0x%x)",  v6));
  }

  return v11;
}

- (id)stringForTitle:(id)a3 valueString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%-22s %@",  [v5 UTF8String],  v6));

  return v7;
}

- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForValue:table:](self, "stringForValue:table:", v6, a5));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", v8, v9));

  return v10;
}

- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5 prefixString:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForValue:table:prefixString:]( self,  "stringForValue:table:prefixString:",  v8,  a5,  a6));
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", v10, v11));

  return v12;
}

- (unsigned)chrisTracy:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v13[0] = &off_10001B618;
    v13[1] = &off_10001B720;
    v14[0] = &off_10001B618;
    v14[1] = &off_10001B618;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
    id v5 = v3;
    id v6 = [v5 cStringUsingEncoding:1];
    else {
      uint64_t v7 = 8LL;
    }
    __memcpy_chk(&v12, v6, v7, 8LL);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v12));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v9]);

    if (v10) {
      unsigned int v8 = [v10 unsignedLongValue];
    }
    else {
      unsigned int v8 = *(_DWORD *)[v5 cStringUsingEncoding:1];
    }
  }

  else
  {
    unsigned int v8 = 0;
  }

  return bswap32(v8);
}

- (id)readFullVersion
{
  unint64_t v13 = 0LL;
  id v3 = (unsigned __int8 *)malloc(0x40uLL);
  if (v3)
  {
    unsigned int v4 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v3,  64LL,  15LL,  &v13);
    BOOL v5 = v13 > 4;
  }

  else
  {
    BOOL v5 = 0;
    unsigned int v4 = -536870210;
  }

  if (v4 == 0 && v5) {
    int v6 = -536870169;
  }
  else {
    int v6 = v4;
  }
  if (v6)
  {
    unsigned int v7 = 0;
LABEL_11:
    uint64_t v9 = 0LL;
    goto LABEL_12;
  }

  unsigned int v7 = *(_DWORD *)v3;
  unsigned int v8 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v3,  64LL,  44LL,  &v13);
  if (v8)
  {
    int v6 = v8;
    goto LABEL_11;
  }

  if (v13 <= 2)
  {
    int v6 = 0;
    uint64_t v9 = v3[1];
  }

  else
  {
    uint64_t v9 = 0LL;
    int v6 = -536870169;
  }

- (BOOL)isSPIMaster
{
  uint64_t v6 = 0LL;
  id v3 = (char *)malloc(0x40uLL);
  if (!v3) {
    return 1;
  }
  unsigned int v4 = v3;
  -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v3,  64LL,  45LL,  &v6);
  return *v4 < 0;
}

- (id)getDeviceInfoNameWithConfigOnly:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v21 = 0LL;
  BOOL v5 = malloc(0x40uLL);
  if (v5)
  {
    uint64_t v6 = v5;
    -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v5,  64LL,  47LL,  &v21);
    if (v21)
    {
      uint64_t v7 = 0LL;
      int v8 = 0;
      int v9 = 0;
      while (1)
      {
        if (v6[v7] == 32)
        {
          unint64_t v10 = v8;
          uint64_t v11 = ((uint64_t)v8 << 32) - 0x100000000LL;
          uint64_t v12 = ((uint64_t)v8 << 32) + 0x500000000LL;
          v8 -= 2;
          do
          {
            BOOL v13 = v6[v10] == 32 && v21 > v10;
            ++v10;
            v11 += (uint64_t)&_mh_execute_header;
            v12 += (uint64_t)&_mh_execute_header;
            ++v8;
          }

          while (v13);
          if (++v9 == 3) {
            break;
          }
        }

        uint64_t v7 = ++v8;
        if (v21 <= v8) {
          return 0LL;
        }
      }

      if (v3) {
        uint64_t v16 = &v6[v12 >> 32];
      }
      else {
        uint64_t v16 = &v6[v11 >> 32];
      }
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v16));
      int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
      int v19 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByTrimmingCharactersInSet:v18]);

      return v19;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___PDControllerType4;
    id v15 = -[PDControllerType2 getDeviceInfoNameWithConfigOnly:](&v20, "getDeviceInfoNameWithConfigOnly:", v3);
    return (id)objc_claimAutoreleasedReturnValue(v15);
  }

- (int)printDPMrSubCommand:(id)a3 withDeviceConfig:(id)a4 writeBuffer:(void *)a5 writeLength:(unint64_t)a6 readBuffer:(void *)a7 readLength:(unint64_t)a8
{
  id v13 = a3;
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 dpmrSubCommandFormatterHexDumpWithBuffer:length:inputBuffer:andInputLength:]( self,  "dpmrSubCommandFormatterHexDumpWithBuffer:length:inputBuffer:andInputLength:",  a7,  a8,  a5,  a6));
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
  {
    id v16 = v14;
    if ([v16 count])
    {
      if ([v16 count])
      {
        unint64_t v17 = 0LL;
        do
        {
          int v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:v17]);
          int v19 = v18;
          if (v17) {
            printf("\t%s\n", (const char *)[v18 UTF8String]);
          }
          else {
            -[PDControllerType4 printDPMrSubCommand:withTitle:andDescription:]( self,  "printDPMrSubCommand:withTitle:andDescription:",  v13,  v13,  v18);
          }

          ++v17;
        }

        while ((unint64_t)[v16 count] > v17);
      }
    }

    else
    {
      -[PDControllerType4 printDPMrSubCommand:withTitle:andDescription:]( self,  "printDPMrSubCommand:withTitle:andDescription:",  v13,  v13,  &stru_1000186C8);
    }
  }

  else
  {
    -[PDControllerType4 printDPMrSubCommand:withTitle:andDescription:]( self,  "printDPMrSubCommand:withTitle:andDescription:",  v13,  v13,  v14);
  }

  return 0;
}

- (int)printDPMrSubCommand:(id)a3 withDeviceConfig:(id)a4
{
  id v45 = a3;
  id v5 = a4;
  uint64_t v6 = malloc(0x40uLL);
  *uint64_t v6 = 0u;
  v6[1] = 0u;
  v6[2] = 0u;
  v6[3] = 0u;
  v46 = v6;
  int v60 = 1146113394;
  uint64_t v7 = malloc(0x40uLL);
  *uint64_t v7 = 0u;
  v7[1] = 0u;
  v7[2] = 0u;
  v7[3] = 0u;
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"iecs_style"]);
  unsigned int v9 = [v8 BOOLValue];

  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"i2c_addr"]);
  *(_BYTE *)uint64_t v7 = [v10 unsignedCharValue];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"registers"]);
  unsigned __int8 v12 = [v11 count];

  *((_BYTE *)v7 + 1) = v12 - 1;
  if (v9)
  {
    __int128 v58 = 0uLL;
    __int128 v59 = 0uLL;
    __int128 v56 = 0uLL;
    __int128 v57 = 0uLL;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"registers"]);
    id v14 = [v13 countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (!v14) {
      goto LABEL_23;
    }
    id v15 = v14;
    id v44 = v5;
    uint64_t v16 = *(void *)v57;
    LODWORD(v17) = 2;
LABEL_4:
    uint64_t v18 = 0LL;
    uint64_t v17 = (int)v17;
    while (1)
    {
      if (*(void *)v57 != v16) {
        objc_enumerationMutation(v13);
      }
      int v19 = *(void **)(*((void *)&v56 + 1) + 8 * v18);
      objc_super v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"address"]);
      *((_BYTE *)v7 + v17) = [v20 unsignedCharValue];

      unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"length"]);
      *((_BYTE *)v7 + v17 + 1) = [v21 unsignedCharValue] | 0x80;

      if (v17 > 61) {
        break;
      }
      v17 += 2LL;
      if (v15 == (id)++v18)
      {
        id v15 = [v13 countByEnumeratingWithState:&v56 objects:v63 count:16];
        if (v15) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  else
  {
    __int128 v54 = 0uLL;
    __int128 v55 = 0uLL;
    __int128 v52 = 0uLL;
    __int128 v53 = 0uLL;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"registers"]);
    id v22 = [v13 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (!v22) {
      goto LABEL_23;
    }
    id v23 = v22;
    id v44 = v5;
    uint64_t v24 = *(void *)v53;
    int v25 = 2;
LABEL_13:
    uint64_t v26 = 0LL;
    if (v25 <= 63) {
      int v27 = 63;
    }
    else {
      int v27 = v25;
    }
    uint64_t v28 = (v27 - v25);
    while (1)
    {
      if (*(void *)v53 != v24) {
        objc_enumerationMutation(v13);
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v52 + 1) + 8 * v26) objectForKeyedSubscript:@"address"]);
      *((_BYTE *)v7 + v25 + v26) = [v29 unsignedCharValue];

      if (v28 == v26) {
        break;
      }
      if (v23 == (id)++v26)
      {
        v25 += v26;
        id v23 = [v13 countByEnumeratingWithState:&v52 objects:v62 count:16];
        if (v23) {
          goto LABEL_13;
        }
        break;
      }
    }
  }

  id v5 = v44;
LABEL_23:

  LODWORD(v43) = 4194368;
  -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:ret urnDataBufferLength:timeoutInSeconds:",  1LL,  &v60,  v7,  0LL,  v46,  0LL,  v43,  10LL);
  *uint64_t v7 = 0u;
  v7[1] = 0u;
  v7[2] = 0u;
  v7[3] = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  v30 = v5;
  v31 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"registers"]);
  id v32 = [v31 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v32)
  {
    id v33 = v32;
    int v34 = 0;
    uint64_t v35 = *(void *)v49;
    do
    {
      v36 = 0LL;
      int v37 = v34;
      v38 = (char *)v7 + v34;
      do
      {
        if (*(void *)v49 != v35) {
          objc_enumerationMutation(v31);
        }
        v39 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v48 + 1) + 8 * (void)v36) objectForKeyedSubscript:@"address"]);
        *((_BYTE *)v36 + (void)v38) = [v39 unsignedCharValue];

        v36 = (char *)v36 + 1;
      }

      while (v33 != v36);
      id v33 = [v31 countByEnumeratingWithState:&v48 objects:v61 count:16];
      int v34 = v37 + (_DWORD)v36;
    }

    while (v33);
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"registers"]);
  int v41 = -[PDControllerType4 printDPMrSubCommand:withDeviceConfig:writeBuffer:writeLength:readBuffer:readLength:]( self,  "printDPMrSubCommand:withDeviceConfig:writeBuffer:writeLength:readBuffer:readLength:",  v45,  v30,  v7,  [v40 count],  v46,  64);

  free(v46);
  free(v7);

  return v41;
}

- (int)printDPMrSubCommand:(id)a3 withTitle:(id)a4 andDescription:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  int v8 = (const char *)[v6 UTF8String];
  id v9 = v7;
  unint64_t v10 = (const char *)[v9 UTF8String];

  printf("'%s'\t%s\n", v8, v10);
  return 0;
}

- (id)dpmrSubCommandFormatterHexDumpWithBuffer:(void *)a3 length:(unint64_t)a4 inputBuffer:(void *)a5 andInputLength:(unint64_t)a6
{
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  [v11 appendFormat:@"0x%02llX\t0x", a6];
  for (; a6; --a6)
  {
    unsigned int v12 = *(unsigned __int8 *)a5;
    a5 = (char *)a5 + 1;
    [v11 appendFormat:@"%02X" v12];
  }

  [v10 addObject:v11];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));

  [v13 appendFormat:@"0x%02llX\t0x", a4];
  for (; a4; --a4)
  {
    unsigned int v14 = *(unsigned __int8 *)a3;
    a3 = (char *)a3 + 1;
    [v13 appendFormat:@"%02x" v14];
  }

  [v10 addObject:v13];

  return v10;
}

- (void)setDPMrConfigs
{
}

- (NSDictionary)dpmrConfigs
{
  return *(NSDictionary **)&self->PDOSourceType[9];
}

- (void)setDpmrConfigs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end