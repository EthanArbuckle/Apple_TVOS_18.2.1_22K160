@interface PDControllerType2
+ (id)createForDecode;
+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4;
- (BOOL)isSPIMaster;
- (BOOL)supportsRemote;
- (PDControllerType2)initWithAddress:(unsigned __int8)a3 userClient:(id)a4;
- (id)getDeviceInfoNameWithConfigOnly:(BOOL)a3;
- (id)readFullVersion;
- (id)readFullVersionWithConfig;
- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5;
- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5 prefixString:(id)a6;
- (id)stringForTitle:(id)a3 valueString:(id)a4;
- (id)stringForValue:(unsigned int)a3 table:(id)a4;
- (id)stringForValue:(unsigned int)a3 table:(id)a4 prefixString:(id)a5;
- (int)disc:(unsigned __int8)a3;
- (int)executeIECSAtomicCommand:(unsigned __int8)a3 cmdBuffer:(void *)a4 dataBuffer:(void *)a5 extDataBuffer:(void *)a6 returnDataBuffer:(void *)a7 returnExtDataBuffer:(void *)a8 inputDataLength:(unsigned __int16)a9 returnDataBufferLength:(unsigned __int16)a10 timeoutInSeconds:(unint64_t)a11;
- (int)printAll;
- (int)printDBStateHistory;
- (int)printIECSAceSpecificInfo;
- (int)printIECSStandardInfo;
- (int)printInfo;
- (int)printPDStateHistory;
- (int)printStateHistory;
- (int)printTitle;
- (unsigned)chrisTracy:(id)a3;
- (unsigned)majorVersionNumber;
- (unsigned)readUUIDIntoBuffer:(char *)a3 ofLength:(unsigned __int8)a4;
@end

@implementation PDControllerType2

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

- (PDControllerType2)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDControllerType2;
  return -[PDController initWithAddress:userClient:](&v5, "initWithAddress:userClient:", a3, a4);
}

- (int)printIECSStandardInfo
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = [&off_10001CCC8 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_enumerationMutation(&off_10001CCC8);
      }
      unsigned int v7 = -[PDController printRegister:]( self,  "printRegister:",  [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) unsignedCharValue]);
    }

    int v8 = v7;
    id v4 = [&off_10001CCC8 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
  id v3 = [&off_10001CCE0 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_enumerationMutation(&off_10001CCE0);
      }
      unsigned int v7 = -[PDController printRegister:]( self,  "printRegister:",  [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) unsignedCharValue]);
    }

    int v8 = v7;
    id v4 = [&off_10001CCE0 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
  int result = -[PDControllerType2 printTitle](self, "printTitle");
  if (!result)
  {
    putchar(10);
    int result = -[PDControllerType2 printIECSStandardInfo](self, "printIECSStandardInfo");
    if (!result)
    {
      id v4 = objc_claimAutoreleasedReturnValue( -[PDControllerType2 readFullVersionWithConfig]( self, "readFullVersionWithConfig"));
      printf("0x0f %-22s %s\n", "FW Versions", (const char *)[v4 UTF8String]);

      putchar(10);
      return -[PDControllerType2 printIECSAceSpecificInfo](self, "printIECSAceSpecificInfo");
    }
  }

  return result;
}

- (int)printAll
{
  if (!-[PDControllerType2 printTitle](self, "printTitle"))
  {
    putchar(10);
    LOBYTE(v3) = 0;
    do
    {
      int v3 = (char)(v3 + 1);
    }

    while ((v3 & 0x80000000) == 0);
  }

  -[PDController printCommand:withWriteData:withWriteLength:]( self,  "printCommand:withWriteData:withWriteLength:",  1212377195LL,  0LL,  0LL);
  int v10 = 0;
  -[PDController printCommand:withWriteData:withWriteLength:]( self,  "printCommand:withWriteData:withWriteLength:",  1094992754LL,  &v10,  4LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  *(void *)&__int128 v11 = 0LL;
  uint64_t v5 = (unsigned __int8 *)malloc(0x40uLL);
  int v6 = 0;
  if (!v5)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Malloc failed for rdo object pull"));
    [v4 addObject:v7];

    int v6 = -536870211;
  }

  -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v5,  64LL,  41LL,  &v11);
  unsigned int v8 = v5[55];
  self->mux_type = v8 & 7;
  self->debug_mux = (v8 >> 4) & 3;

  if (self->mux_type == 2)
  {
    __int128 v11 = xmmword_100013430;
    *(_OWORD *)__int128 v12 = unk_100013440;
    *(void *)&v12[13] = 0xF3F2F1F04D4A4948LL;
    -[PDController printCommand:withWriteData:withWriteLength:]( self,  "printCommand:withWriteData:withWriteLength:",  1146113394LL,  &v11,  37LL);
  }

  return v6;
}

- (unsigned)majorVersionNumber
{
  int v3 = (unsigned __int8 *)malloc(4uLL);
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  -[PDController registerRead:ofLength:atAddress:](self, "registerRead:ofLength:atAddress:", v3, 4LL, 15LL);
  unsigned __int16 v5 = v4[2];
  free(v4);
  return v5;
}

- (int)printPDStateHistory
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = malloc(0x40uLL);
  -[PDControllerType2 majorVersionNumber](self, "majorVersionNumber");
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
      LODWORD(v22) = 4194368;
      int v7 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataL ength:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v27,  &v26,  0LL,  v4,  0LL,  v22,  10LL);
      if (!v7)
      {
        uint64_t v5 = *(unsigned __int16 *)v4;
        LOBYTE(v6) = v4[2];
      }
    }

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  v4,  4LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
    -[PDController printRegisterTitle:andDescription:](self, "printRegisterTitle:andDescription:", @"PDSt(0)", v9);

    else {
      int v6 = v6;
    }
    unsigned int v10 = v6 + 2;
    LOBYTE(v11) = 2;
    __int16 v25 = 2;
    do
    {
      while (1)
      {
        if (!v7)
        {
          int v7 = -[PDController registerWrite8:atAddress:](self, "registerWrite8:atAddress:", v11, 9LL);
          if (!v7)
          {
            int v7 = -[PDController executeIECSCommand:](self, "executeIECSCommand:", 1346655092LL);
            if (!v7)
            {
              int v7 = -[PDController registerRead:ofLength:atAddress:]( self,  "registerRead:ofLength:atAddress:",  v4,  64LL,  9LL);
              if (!v7)
              {
                LODWORD(v22) = 4194306;
                int v7 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer: inputDataLength:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v27,  &v25,  0LL,  v4,  0LL,  v22,  10LL);
                if (!v7) {
                  break;
                }
              }
            }
          }
        }

        unsigned __int16 v11 = v25 + 1;
        __int16 v25 = v11;
        if (v10 <= v11) {
          goto LABEL_24;
        }
      }

      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  v4,  64LL));
      [v3 addObjectsFromArray:v12];

      int v7 = 0;
      unsigned __int16 v11 = v25 + 1;
      __int16 v25 = v11;
    }

    while (v10 > v11);
    LODWORD(v22) = 4194368;
    unsigned int v13 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLe ngth:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v27,  &v26,  0LL,  v4,  0LL,  v22,  10LL);
    if (v13)
    {
      int v7 = v13;
LABEL_24:
      if (v4) {
        free(v4);
      }
      goto LABEL_35;
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
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PDSt mismatch %d",  v24));
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Start ptr = 0x%04x | End ptr = 0x%04x",  v5,  v15));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType2 stringForTitle:valueString:](self, "stringForTitle:valueString:", v16, v17));
      [v23 addObject:v18];

      if (v24 < 5u)
      {

        int v7 = 0;
        int v3 = v14;
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
  int v3 = v14;
LABEL_35:

  return v7;
}

- (int)printDBStateHistory
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  int v16 = 0;
  int v17 = 1145197428;
  id v4 = (unsigned __int8 *)malloc(0x40uLL);
  -[PDControllerType2 majorVersionNumber](self, "majorVersionNumber");
  if (v4)
  {
    LODWORD(v14) = 4194368;
    unsigned int v5 = 1;
    int v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLen gth:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v17,  &v16,  0LL,  v4,  0LL,  v14,  10LL);
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
    if (!v6)
    {
      LODWORD(v14) = 4194306;
      int v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataL ength:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v17,  &i,  0LL,  v4,  0LL,  v14,  10LL);
      if (!v6)
      {
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  v4,  64LL));
        [v3 addObjectsFromArray:v10];

        int v6 = 0;
      }
    }
  }

  if (v4) {
    free(v4);
  }
  if (!v6 && [v3 count])
  {
    unint64_t v11 = 0LL;
    do
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v11]);
      if (v11) {
        -[PDController printRegisterDescription:](self, "printRegisterDescription:", v12);
      }
      else {
        -[PDController printRegisterTitle:andDescription:]( self,  "printRegisterTitle:andDescription:",  @"'DBSt'",  v12);
      }

      ++v11;
    }

    while ((unint64_t)[v3 count] > v11);
  }

  return v6;
}

- (int)printStateHistory
{
  if (-[PDControllerType2 majorVersionNumber](self, "majorVersionNumber") == 6) {
    return -[PDControllerType2 printDBStateHistory](self, "printDBStateHistory");
  }
  else {
    return -[PDControllerType2 printPDStateHistory](self, "printPDStateHistory");
  }
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
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if (v10)
  {
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v7, v10));
  }

  else
  {
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown (0x%x)",  v6));
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
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType2 stringForValue:table:](self, "stringForValue:table:", v6, a5));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType2 stringForTitle:valueString:](self, "stringForTitle:valueString:", v8, v9));

  return v10;
}

- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5 prefixString:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType2 stringForValue:table:prefixString:]( self,  "stringForValue:table:prefixString:",  v8,  a5,  a6));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType2 stringForTitle:valueString:](self, "stringForTitle:valueString:", v10, v11));

  return v12;
}

- (int)disc:(unsigned __int8)a3
{
  unsigned __int8 v14 = a3;
  if (-[PDController remote](self, "remote") && !-[PDControllerType2 supportsRemote](self, "supportsRemote"))
  {
    printf("pd controller at 0x%02x does not support remote access\n", -[PDController address](self, "address"));
    return -536870170;
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType2 getDeviceInfoNameWithConfigOnly:](self, "getDeviceInfoNameWithConfigOnly:", 1LL));
  unsigned int v5 = -[PDControllerType2 chrisTracy:](self, "chrisTracy:", v4);

  int v12 = 1280262987;
  unsigned int v13 = v5;
  if (v5)
  {
    LODWORD(v10) = 4;
    int v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLen gth:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v12,  &v13,  0LL,  0LL,  0LL,  v10,  10LL);
    int v11 = 1145656131;
    if (v6) {
      return v6;
    }
  }

  else
  {
    int v11 = 1145656131;
  }

  id v7 = malloc(0x40uLL);
  if (!v7) {
    return -536870211;
  }
  uint64_t v8 = v7;
  LODWORD(v10) = 4194305;
  int v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLengt h:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v11,  &v14,  0LL,  v7,  0LL,  v10,  10LL);
  free(v8);
  return v6;
}

- (id)readFullVersion
{
  unint64_t v13 = 0LL;
  int v3 = (unsigned int *)malloc(0x40uLL);
  if (v3)
  {
    unsigned int v4 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v3,  64LL,  15LL,  &v13);
    int v5 = v13 > 4;
    BOOL v6 = v4 == 0;
  }

  else
  {
    int v5 = 0;
    BOOL v6 = 0;
  }

  if ((v6 & ~v5) == 0)
  {
LABEL_8:
    unsigned int v9 = &stru_1000186C8;
    return v9;
  }

  unsigned int v7 = *v3;
  unsigned int v8 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v3,  64LL,  44LL,  &v13);
  unsigned int v9 = &stru_1000186C8;
  if (!v8 && v13 <= 2)
  {
    unsigned __int8 v12 = 0;
    uint64_t v11 = 0LL;
    if (!-[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  &v12,  1LL,  44LL,  &v11))
    {
      unsigned int v9 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%X.%X.%X.%d",  HIWORD(v7),  BYTE1(v7),  v7,  v12));
      return v9;
    }

    goto LABEL_8;
  }

  return v9;
}

- (id)readFullVersionWithConfig
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType2 readFullVersion](self, "readFullVersion"));
  id v4 = objc_claimAutoreleasedReturnValue( -[PDControllerType2 getDeviceInfoNameWithConfigOnly:]( self, "getDeviceInfoNameWithConfigOnly:", 1LL));
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (%s)",  v3,  [v4 UTF8String]));

  return v5;
}

- (unsigned)readUUIDIntoBuffer:(char *)a3 ofLength:(unsigned __int8)a4
{
  uint64_t v6 = 0LL;
  if (a4 >= 0x40u) {
    *(void *)&a4 = 64LL;
  }
  else {
    uint64_t v4 = a4;
  }
  -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  a3,  a4,  5LL,  &v6);
  return v6;
}

- (BOOL)isSPIMaster
{
  uint64_t v7 = 0LL;
  int v3 = (unsigned __int8 *)malloc(0x40uLL);
  if (v3)
  {
    uint64_t v4 = v3;
    -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v3,  64LL,  45LL,  &v7);
    return (*v4 >> 3) & 1;
  }

  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (id)getDeviceInfoNameWithConfigOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = 0LL;
  BOOL v5 = malloc(0x40uLL);
  if (v5)
  {
    uint64_t v6 = v5;
    -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v5,  64LL,  47LL,  &v14);
    if (!v14) {
      return 0LL;
    }
    uint64_t v7 = 0LL;
    int v8 = 0;
    while (1)
    {
      if (v6[v7] == 32) {
        ++v8;
      }
      if (v8 == 3) {
        break;
      }
      if (v14 == ++v7) {
        return 0LL;
      }
    }

    if (v3) {
      uint64_t v12 = (v7 + 2);
    }
    else {
      uint64_t v12 = (v7 + 1);
    }
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", &v6[v12]));
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___PDControllerType2;
    id v10 = -[PDController getDeviceInfoNameWithConfigOnly:](&v13, "getDeviceInfoNameWithConfigOnly:", v3);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  return v11;
}

- (unsigned)chrisTracy:(id)a3
{
  return 827609923;
}

- (int)executeIECSAtomicCommand:(unsigned __int8)a3 cmdBuffer:(void *)a4 dataBuffer:(void *)a5 extDataBuffer:(void *)a6 returnDataBuffer:(void *)a7 returnExtDataBuffer:(void *)a8 inputDataLength:(unsigned __int16)a9 returnDataBufferLength:(unsigned __int16)a10 timeoutInSeconds:(unint64_t)a11
{
  uint64_t v16 = a3;
  if (-[PDController remote](self, "remote")) {
    return -536870201;
  }
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  LODWORD(v22) = 0;
  LODWORD(v21) = __PAIR32__(a10, a9);
  int v20 = [v19 IECSAtomicCommand:v16 cmdBuffer:a4 dataBuffer:a5 extDataBuffer:a6 returnDataBuffer:a7 returnExtDataBuffer:a8 inputD ataLength:v21 returnDataBufferLength:a11 timeoutInSeconds:-[PDController address](self forDevice:"address") flags:v22];

  return v20;
}

@end