@interface PDController
+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4;
+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4 VID:(unsigned int)a5 DID:(unsigned int)a6;
+ (id)knownPDControllers:(int64_t)a3;
+ (id)pdControllerForAddress:(unsigned int)a3 userClient:(id)a4;
+ (id)pdControllerForVID:(unsigned int)a3 DID:(unsigned int)a4 address:(unsigned int)a5 userClient:(id)a6;
- (AppleHPMUserClient)userClient;
- (BOOL)isSPIMaster;
- (BOOL)remote;
- (BOOL)supportsRemote;
- (NSDictionary)commandMap;
- (NSDictionary)registerMap;
- (PDController)initWithAddress:(unsigned __int8)a3 userClient:(id)a4;
- (PDController)initWithAddress:(unsigned __int8)a3 userClient:(id)a4 VID:(unsigned int)a5 DID:(unsigned int)a6;
- (id)commandFormatterHexDumpWithBuffer:(void *)a3 length:(unint64_t)a4 inputBuffer:(void *)a5 andInputLength:(unint64_t)a6;
- (id)getDeviceInfoNameWithConfigOnly:(BOOL)a3;
- (id)readFullVersion;
- (id)registerFormatter4CCWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterBCDVersionWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterDIDWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterDecimal16WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterDecimal32MillisecondsWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterDecimal32WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterDecimal64WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterDecimal8WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterHex16WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterHex32WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterHexDumpNarrowWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterHexDumpWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterRxVDMWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterStringWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterUUIDWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterVIDWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (int)disc:(unsigned __int8)a3;
- (int)executeIECSAtomicCommand:(unsigned __int8)a3 cmdBuffer:(void *)a4 dataBuffer:(void *)a5 extDataBuffer:(void *)a6 returnDataBuffer:(void *)a7 returnExtDataBuffer:(void *)a8 inputDataLength:(unsigned __int16)a9 returnDataBufferLength:(unsigned __int16)a10 timeoutInSeconds:(unint64_t)a11;
- (int)executeIECSCommand:(unsigned int)a3;
- (int)executeIECSCommand:(unsigned int)a3 withData:(void *)a4 ofLength:(unint64_t)a5;
- (int)forceMode:(unsigned __int8)a3 withDataStatus:(unsigned int)a4 andStatus:(unsigned int)a5;
- (int)forceUpdateMode:(unsigned __int8)a3;
- (int)printAll;
- (int)printAll:(id)a3;
- (int)printCommand:(unsigned int)a3;
- (int)printCommand:(unsigned int)a3 dataBuffer:(void *)a4 andLength:(unint64_t)a5;
- (int)printCommand:(unsigned int)a3 withTitle:(id)a4 andFormatter:(SEL)a5;
- (int)printCommand:(unsigned int)a3 withTitle:(id)a4 andFormatter:(SEL)a5 andData:(void *)a6 andLength:(unint64_t)a7;
- (int)printCommand:(unsigned int)a3 withTitle:(id)a4 andFormatter:(SEL)a5 andWriteData:(void *)a6 andWriteDataLength:(unint64_t)a7;
- (int)printCommand:(unsigned int)a3 withWriteData:(void *)a4 withWriteLength:(unint64_t)a5;
- (int)printInfo;
- (int)printRegister:(unsigned __int8)a3;
- (int)printRegister:(unsigned __int8)a3 dataBuffer:(void *)a4 andLength:(unint64_t)a5;
- (int)printRegister:(unsigned __int8)a3 withTitle:(id)a4 andFormatter:(SEL)a5;
- (int)printRegister:(unsigned __int8)a3 withTitle:(id)a4 andFormatter:(SEL)a5 andData:(void *)a6 andLength:(unint64_t)a7;
- (int)printStateHistory;
- (int)printTriage:(id)a3;
- (int)receiveVDM:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7;
- (int)receiveVDMAttention:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7;
- (int)registerRead32:(unsigned int *)a3 atAddress:(unsigned int)a4;
- (int)registerRead8:(char *)a3 atAddress:(unsigned int)a4;
- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5;
- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6;
- (int)registerReadRemote:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6;
- (int)registerWrite32:(unsigned int)a3 atAddress:(unsigned int)a4;
- (int)registerWrite8:(unsigned __int8)a3 atAddress:(unsigned int)a4;
- (int)registerWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5;
- (int)registerWriteRemote:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5;
- (int)runLivePDLog;
- (int)sendVDM:(void *)a3 length:(unint64_t)a4 sop:(int)a5;
- (int)setupForLivePDLog;
- (int)stress:(unsigned int)a3;
- (int64_t)compare:(id)a3;
- (unsigned)address;
- (unsigned)did;
- (unsigned)readUUIDIntoBuffer:(char *)a3 ofLength:(unsigned __int8)a4;
- (unsigned)vid;
- (void)printCommand:(unsigned int)a3 withTitle:(id)a4 andDescription:(id)a5;
- (void)printCommandDescription:(id)a3;
- (void)printRegister:(unsigned __int8)a3 withTitle:(id)a4 andDescription:(id)a5;
- (void)printRegisterDescription:(id)a3;
- (void)printRegisterDescription:(id)a3 withIndex:(int)a4;
- (void)printRegisterTitle:(id)a3 andDescription:(id)a4;
- (void)setAddress:(unsigned __int8)a3;
- (void)setCommandMap:(id)a3;
- (void)setDid:(unsigned int)a3;
- (void)setRegisterMap:(id)a3;
- (void)setRemote:(BOOL)a3;
- (void)setUserClient:(id)a3;
- (void)setVid:(unsigned int)a3;
@end

@implementation PDController

+ (id)knownPDControllers:(int64_t)a3
{
  kern_return_t ChildIterator;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  int64_t v22;
  uint64_t v23;
  unsigned int v24;
  io_iterator_t iterator;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AppleHPMUserClientManager sharedInstance](&OBJC_CLASS___AppleHPMUserClientManager, "sharedInstance"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userClientSet]);
    if (v6)
    {
      v7 = v6;
      v20 = v5;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8)
      {
        id v9 = v8;
        ChildIterator = 0;
        v11 = *(void *)v27;
        v22 = a3;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(v7);
            }
            v13 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
            iterator = 0;
            if (!ChildIterator)
            {
              ChildIterator = IORegistryEntryGetChildIterator( (io_registry_entry_t)[v13 service],  "IOService",  &iterator);
              if (!ChildIterator)
              {
                v14 = IOIteratorNext(iterator);
                if ((_DWORD)v14)
                {
                  v15 = v14;
                  do
                  {
                    if (IOObjectConformsTo(v15, "AppleHPMDevice"))
                    {
                      v24 = 0;
                      v23 = 0LL;
                      if (!+[IOKitUtilities uint32ForRegistryEntry:andKey:outValue:]( &OBJC_CLASS___IOKitUtilities,  "uint32ForRegistryEntry:andKey:outValue:",  v15,  @"Address",  &v24)
                        && !+[IOKitUtilities uint32ForRegistryEntry:andKey:outValue:]( &OBJC_CLASS___IOKitUtilities,  "uint32ForRegistryEntry:andKey:outValue:",  v15,  @"Vendor ID",  (char *)&v23 + 4)
                        && !+[IOKitUtilities uint32ForRegistryEntry:andKey:outValue:]( &OBJC_CLASS___IOKitUtilities,  "uint32ForRegistryEntry:andKey:outValue:",  v15,  @"Device ID",  &v23))
                      {
                        if (a3 < 0)
                        {
                          v16 = HIDWORD(v23);
                        }

                        else
                        {
                          HIDWORD(v23) = a3;
                          v16 = a3;
                        }

                        v17 = (void *)objc_claimAutoreleasedReturnValue( +[PDController pdControllerForVID:DID:address:userClient:]( &OBJC_CLASS___PDController,  "pdControllerForVID:DID:address:userClient:",  v16,  v23,  v24,  v13));
                        if (v17) {
                          [v21 addObject:v17];
                        }

                        a3 = v22;
                      }
                    }

                    IOObjectRelease(v15);
                    v15 = IOIteratorNext(iterator);
                  }

                  while ((_DWORD)v15);
                }

                if (iterator) {
                  IOObjectRelease(iterator);
                }
                ChildIterator = 0;
              }
            }
          }

          id v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }

        while (v9);
      }

      v5 = v20;
    }
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v21 sortedArrayUsingSelector:"compare:"]);

  return v18;
}

+ (id)pdControllerForAddress:(unsigned int)a3 userClient:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  v6 = 0LL;
  if (![v5 iecsReadCommandForDevice:v4 withAddress:0 buffer:(char *)&v9 + 4 length:4 flags:0 andOutReadLength:&v8])
  {
    uint64_t v8 = 0LL;
    v6 = 0LL;
    if (![v5 iecsReadCommandForDevice:v4 withAddress:1 buffer:&v9 length:4 flags:0 andOutReadLength:&v8]) {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[PDController pdControllerForVID:DID:address:userClient:]( &OBJC_CLASS___PDController,  "pdControllerForVID:DID:address:userClient:",  HIDWORD(v9),  v9,  v4,  v5));
    }
  }

  return v6;
}

+ (id)pdControllerForVID:(unsigned int)a3 DID:(unsigned int)a4 address:(unsigned int)a5 userClient:(id)a6
{
  unsigned __int8 v6 = a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v9 = a6;
  if ((_DWORD)v8 == 40)
  {
    if ((int)v7 > 389205247)
    {
      if ((_DWORD)v7 == 826622785)
      {
        v11 = &OBJC_CLASS___PDControllerType2;
        goto LABEL_11;
      }
    }

    else if ((v7 - 33628196) < 4)
    {
      v11 = &OBJC_CLASS___PDControllerType5;
LABEL_11:
      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[__objc2_class createWithDeviceAddress:userClient:](v11, "createWithDeviceAddress:userClient:", v6, v9));
      goto LABEL_12;
    }

    v11 = &OBJC_CLASS___PDControllerType4;
    goto LABEL_11;
  }

  if ((_DWORD)v8 == 2599) {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[PDControllerType1 PDControllerType1WithDeviceAddress:userClient:]( &OBJC_CLASS___PDControllerType1,  "PDControllerType1WithDeviceAddress:userClient:",  v6,  v9));
  }
  else {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[PDController createWithDeviceAddress:userClient:VID:DID:]( &OBJC_CLASS___PDController,  "createWithDeviceAddress:userClient:VID:DID:",  v6,  v9,  v8,  v7));
  }
LABEL_12:
  v12 = (void *)v10;

  return v12;
}

+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4 VID:(unsigned int)a5 DID:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = [objc_alloc((Class)a1) initWithAddress:v8 userClient:v10 VID:v7 DID:v6];

  return v11;
}

+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithAddress:v4 userClient:v6];

  return v7;
}

- (PDController)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDController;
  id v7 = -[PDController init](&v12, "init");
  uint64_t v8 = v7;
  if (v7
    && (-[PDController setAddress:](v7, "setAddress:", v4),
        -[PDController setUserClient:](v8, "setUserClient:", v6),
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](v8, "userClient")),
        v9,
        v9))
  {
    unsigned int v11 = 0;
    -[PDController registerRead32:atAddress:](v8, "registerRead32:atAddress:", &v11, 1LL);
    -[PDController setDid:](v8, "setDid:", v11);
  }

  else
  {

    uint64_t v8 = 0LL;
  }

  return v8;
}

- (PDController)initWithAddress:(unsigned __int8)a3 userClient:(id)a4 VID:(unsigned int)a5 DID:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDController;
  unsigned int v11 = -[PDController init](&v15, "init");
  objc_super v12 = v11;
  if (!v11
    || (-[PDController setAddress:](v11, "setAddress:", v8),
        -[PDController setVid:](v12, "setVid:", v7),
        -[PDController setDid:](v12, "setDid:", v6),
        -[PDController setUserClient:](v12, "setUserClient:", v10),
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](v12, "userClient")),
        v13,
        !v13))
  {

    objc_super v12 = 0LL;
  }

  return v12;
}

- (BOOL)supportsRemote
{
  return 0;
}

- (int)printInfo
{
  return 0;
}

- (int)printAll:(id)a3
{
  return 0;
}

- (int)printAll
{
  return 0;
}

- (int)printTriage:(id)a3
{
  return 0;
}

- (int)printStateHistory
{
  return 0;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___PDController);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = v4;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
      unsigned int v8 = [v7 routerID];
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 userClient]);
      unsigned int v10 = [v9 routerID];

      if (v8 > v10)
      {
LABEL_4:
        int64_t v11 = 1LL;
LABEL_9:

        goto LABEL_10;
      }

      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
      unsigned int v13 = [v12 routerID];
      v14 = (void *)objc_claimAutoreleasedReturnValue([v6 userClient]);
      unsigned int v15 = [v14 routerID];

      if (v13 >= v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
        id v18 = [v17 routeString];
        v19 = (void *)objc_claimAutoreleasedReturnValue([v6 userClient]);
        id v20 = [v19 routeString];

        if (v18 > v20) {
          goto LABEL_4;
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
        id v22 = [v21 routeString];
        v23 = (void *)objc_claimAutoreleasedReturnValue([v6 userClient]);
        id v24 = [v23 routeString];

        if (v22 >= v24)
        {
          unsigned int v25 = -[PDController address](self, "address");
          if (v25 <= [v6 address])
          {
            unsigned int v26 = -[PDController address](self, "address");
            else {
              int64_t v11 = -1LL;
            }
            goto LABEL_9;
          }

          goto LABEL_4;
        }
      }

      int64_t v11 = -1LL;
      goto LABEL_9;
    }

    int64_t v11 = (int64_t)[v4 compare:self];
  }

  else
  {
    int64_t v11 = 1LL;
  }

- (int)registerRead8:(char *)a3 atAddress:(unsigned int)a4
{
  uint64_t v5 = 0LL;
  return -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  a3,  1LL,  *(void *)&a4,  &v5);
}

- (int)registerWrite8:(unsigned __int8)a3 atAddress:(unsigned int)a4
{
  unsigned __int8 v5 = a3;
  return -[PDController registerWrite:ofLength:atAddress:]( self,  "registerWrite:ofLength:atAddress:",  &v5,  1LL,  *(void *)&a4);
}

- (int)registerRead32:(unsigned int *)a3 atAddress:(unsigned int)a4
{
  uint64_t v5 = 0LL;
  return -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  a3,  4LL,  *(void *)&a4,  &v5);
}

- (int)registerWrite32:(unsigned int)a3 atAddress:(unsigned int)a4
{
  unsigned int v5 = a3;
  return -[PDController registerWrite:ofLength:atAddress:]( self,  "registerWrite:ofLength:atAddress:",  &v5,  4LL,  *(void *)&a4);
}

- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  uint64_t v6 = 0LL;
  return -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  a3,  a4,  *(void *)&a5,  &v6);
}

- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6
{
  uint64_t v7 = *(void *)&a5;
  if (-[PDController remote](self, "remote")) {
    return -[PDController registerReadRemote:ofLength:atAddress:andOutReadLength:]( self,  "registerReadRemote:ofLength:atAddress:andOutReadLength:",  a3,  a4,  v7,  a6);
  }
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  int v13 = [v12 iecsReadCommandForDevice:[self address] withAddress:v7 buffer:a3 length:a4 flags:0 andOutReadLength:a6];

  return v13;
}

- (int)registerReadRemote:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6
{
  HIDWORD(v22) = 0;
  LODWORD(v22) = 1396917577;
  int64_t v11 = malloc(0x40uLL);
  *(void *)((char *)&v22 + 4) = (a5 << 8) | ((_DWORD)a4 << 24) | 0x10000;
  if (!v11) {
    return -536870211;
  }
  objc_super v12 = v11;
  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient", (void)v22, *((void *)&v22 + 1)));
  int v14 = [v13 iecsWriteCommandForDevice:[self address] withAddress:19 buffer:(char *)&v22 + 4 length:4 flags:0];

  if (!v14)
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
    [v15 iecsWriteCommandForDevice:[self address] withAddress:8 buffer:&v22 length:4 flags:0];

    int v16 = 99;
    do
    {
      usleep(0x64u);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
      int v14 = [v17 iecsReadCommandForDevice:[self address] withAddress:8 buffer:v12 length:a4 flags:0 andOutReadLength:a6];
    }

    while (*v12 == 73 && v16-- != 0);
    if (!v14)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
      int v14 = [v19 iecsReadCommandForDevice:[self address] withAddress:19 buffer:v12 length:a4 flags:0 andOutReadLength:0];

      if (!v14)
      {
        if ((v12[2] & 0x7C) != 0)
        {
          puts("remote read failed");
          -[PDController setRemote:](self, "setRemote:", 0LL);
          int v14 = -536870165;
        }

        else
        {
          *a6 = v12[3] & 0x7F;
          id v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
          int v14 = [v20 iecsReadCommandForDevice:[self address] withAddress:9 buffer:a3 length:a4 flags:0 andOutReadLength:(char *)&v22 + 8];
        }
      }
    }
  }

  free(v12);
  return v14;
}

- (int)registerWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (-[PDController remote](self, "remote")) {
    return -[PDController registerWriteRemote:ofLength:atAddress:]( self,  "registerWriteRemote:ofLength:atAddress:",  a3,  a4,  v5);
  }
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  int v11 = [v10 iecsWriteCommandForDevice:[self address] withAddress:v5 buffer:a3 length:a4 flags:0];

  return v11;
}

- (int)registerWriteRemote:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  unsigned __int8 v5 = a5;
  int v19 = 1396917577;
  id v9 = malloc(0x40uLL);
  int v20 = ((_DWORD)a4 << 24) | (v5 << 8);
  if (!v9) {
    return -536870211;
  }
  unsigned int v10 = v9;
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  int v12 = [v11 iecsWriteCommandForDevice:[self address] withAddress:19 buffer:&v20 length:a4 flags:0];

  if (!v12)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
    int v12 = [v13 iecsWriteCommandForDevice:[self address] withAddress:9 buffer:a3 length:a4 flags:0];

    if (!v12)
    {
      int v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
      [v14 iecsWriteCommandForDevice:[self address] withAddress:8 buffer:&v19 length:4 flags:0];

      int v15 = 99;
      do
      {
        usleep(0x64u);
        int v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
        int v12 = [v16 iecsReadCommandForDevice:[self address] withAddress:8 buffer:v10 length:a4 flags:0 andOutReadLength:0];
      }

      while (*v10 == 73 && v15-- != 0);
    }
  }

  free(v10);
  return v12;
}

- (int)executeIECSCommand:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v13 = 0LL;
  unsigned __int8 v5 = malloc(0x40uLL);
  if (-[PDController remote](self, "remote"))
  {
    unsigned int v12 = bswap32(v3);
    int v6 = -[PDController registerWriteRemote:ofLength:atAddress:]( self,  "registerWriteRemote:ofLength:atAddress:",  &v12,  4LL,  8LL);
    if (!v6)
    {
      int v7 = 99;
      do
      {
        usleep(0x64u);
        unsigned int v8 = -[PDController registerReadRemote:ofLength:atAddress:andOutReadLength:]( self,  "registerReadRemote:ofLength:atAddress:andOutReadLength:",  v5,  4LL,  8LL,  &v13);
      }

      while (*v5 == v12 && v7-- != 0);
      int v6 = v8;
    }
  }

  else
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
    int v6 = [v10 iecsCommand:v3 forDevice:[self address] flags:0];
  }

  if (v5) {
    free(v5);
  }
  return v6;
}

- (int)executeIECSCommand:(unsigned int)a3 withData:(void *)a4 ofLength:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  if (-[PDController remote](self, "remote", 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL))
  {
    -[PDController registerWriteRemote:ofLength:atAddress:]( self,  "registerWriteRemote:ofLength:atAddress:",  &v10,  64LL,  9LL);
    int result = -[PDController registerWriteRemote:ofLength:atAddress:]( self,  "registerWriteRemote:ofLength:atAddress:",  a4,  a5,  9LL);
    if (result) {
      return result;
    }
  }

  else
  {
    -[PDController registerWrite:ofLength:atAddress:](self, "registerWrite:ofLength:atAddress:", &v10, 64LL, 9LL);
    int result = -[PDController registerWrite:ofLength:atAddress:](self, "registerWrite:ofLength:atAddress:", a4, a5, 9LL);
    if (result) {
      return result;
    }
  }

  return -[PDController executeIECSCommand:](self, "executeIECSCommand:", v7);
}

- (int)sendVDM:(void *)a3 length:(unint64_t)a4 sop:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  LODWORD(v5) = [v9 sendVDMForDevice:[self address] sop:v5 buffer:a3 length:a4 flags:0];

  return v5;
}

- (int)receiveVDM:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7
{
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  LODWORD(a7) = [v13 receiveVDMForDevice:[self address] buffer:a3 length:a4 flags:0 outSOP:a5 outSequence:a6 outLength:a7];

  return (int)a7;
}

- (int)receiveVDMAttention:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7
{
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  LODWORD(a7) = [v13 receiveVDMAttentionForDevice:[self address] buffer:a3 length:a4 flags:0 outSOP:a5 outSequence:a6 outLength:a7];

  return (int)a7;
}

- (int)stress:(unsigned int)a3
{
  uint64_t v5 = malloc(0x40uLL);
  if (v5)
  {
    int v6 = v5;
    int v7 = -536870211;
    unsigned int v8 = malloc(0x40uLL);
    id v9 = objc_autoreleasePoolPush();
    if (v8)
    {
      if (a3)
      {
        int v10 = 0;
        qmemcpy(v19, "/.-,+*)('&%$#! ?>=<;:9876543210", sizeof(v19));
        while (1)
        {
          printf("Stress cycle %d\n", v10);
          _OWORD *v6 = v19[1];
          v6[1] = v19[0];
          v6[2] = xmmword_100013410;
          v6[3] = xmmword_100013420;
          unsigned int v11 = -[PDController registerWrite:ofLength:atAddress:]( self,  "registerWrite:ofLength:atAddress:",  v6,  64LL,  9LL);
          if (v11
            || (unsigned int v11 = -[PDController registerRead:ofLength:atAddress:]( self,  "registerRead:ofLength:atAddress:",  v8,  64LL,  9LL)) != 0)
          {
            int v7 = v11;
            goto LABEL_19;
          }

          if (bcmp(v6, v8, 0x40uLL)) {
            break;
          }
          if (a3 == ++v10) {
            goto LABEL_9;
          }
        }

        printf("Mismatch on cycle %d\n", v10);
        puts("Write buffer:");
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  v6,  64LL));
        if ([v12 count])
        {
          unint64_t v13 = 0LL;
          do
          {
            id v14 = objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v13]);
            puts((const char *)[v14 UTF8String]);

            ++v13;
          }

          while ((unint64_t)[v12 count] > v13);
        }

        puts("Read buffer:");
        int v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  v8,  64LL));
        if ([v15 count])
        {
          unint64_t v16 = 0LL;
          do
          {
            id v17 = objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:v16]);
            puts((const char *)[v17 UTF8String]);

            ++v16;
          }

          while ((unint64_t)[v15 count] > v16);
        }

        int v7 = -536870198;
      }

      else
      {
LABEL_9:
        int v7 = 0;
      }
    }

- (int)printCommand:(unsigned int)a3
{
  return -[PDController printCommand:withTitle:andFormatter:]( self,  "printCommand:withTitle:andFormatter:",  *(void *)&a3,  &stru_1000186C8,  "commandFormatterHexDumpWithBuffer:length:inputBuffer:andInputLength:");
}

- (int)printCommand:(unsigned int)a3 withTitle:(id)a4 andFormatter:(SEL)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = malloc(0x40uLL);
  if (!v9)
  {
    int v10 = 0LL;
    uint64_t v12 = 3758097085LL;
    uint64_t v22 = 0LL;
    goto LABEL_7;
  }

  int v10 = malloc(0x40uLL);
  uint64_t v22 = 0LL;
  if (!v10)
  {
    uint64_t v12 = 3758097085LL;
    goto LABEL_7;
  }

  uint64_t v11 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v10,  64LL,  9LL,  &v22);
  if ((_DWORD)v11)
  {
    uint64_t v12 = v11;
LABEL_7:
    unint64_t v21 = 0LL;
LABEL_8:
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Status = 0x%08x",  v12));
    -[PDController printCommand:withTitle:andDescription:](self, "printCommand:withTitle:andDescription:", v6, v8, v13);
    goto LABEL_9;
  }

  uint64_t v15 = -[PDController executeIECSCommand:](self, "executeIECSCommand:", v6);
  unint64_t v21 = 0LL;
  if ((_DWORD)v15
    || (uint64_t v15 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v9,  64LL,  9LL,  &v21),  (_DWORD)v15))
  {
    uint64_t v12 = v15;
    goto LABEL_8;
  }

  uint64_t v16 = v21;
  if (v21 >= 0x40) {
    uint64_t v16 = 64LL;
  }
  unint64_t v21 = v16;
  id v17 = off_1000217F8(self, a5, v9, 64LL, v10, 64LL);
  id v13 = (id)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v13, v18) & 1) != 0)
  {
    id v13 = v13;
    if ([v13 count])
    {
      if ([v13 count])
      {
        unint64_t v19 = 0LL;
        do
        {
          int v20 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v19]);
          if (v19) {
            -[PDController printCommandDescription:](self, "printCommandDescription:", v20);
          }
          else {
            -[PDController printCommand:withTitle:andDescription:]( self,  "printCommand:withTitle:andDescription:",  v6,  v8,  v20);
          }

          ++v19;
        }

        while ((unint64_t)[v13 count] > v19);
      }
    }

    else
    {
      -[PDController printCommand:withTitle:andDescription:]( self,  "printCommand:withTitle:andDescription:",  v6,  v8,  &stru_1000186C8);
    }
  }

  else
  {
    -[PDController printCommand:withTitle:andDescription:](self, "printCommand:withTitle:andDescription:", v6, v8, v13);
  }

  LODWORD(v12) = 0;
LABEL_9:

  if (v9) {
    free(v9);
  }
  if (v10) {
    free(v10);
  }

  return v12;
}

- (void)printCommand:(unsigned int)a3 withTitle:(id)a4 andDescription:(id)a5
{
}

- (int)printCommand:(unsigned int)a3 dataBuffer:(void *)a4 andLength:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDController commandMap](self, "commandMap"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v7));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  if (v11)
  {
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"title"]);
    id v13 = (NSString *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"formatter"]);
    SEL v14 = NSSelectorFromString(v13);
  }

  else
  {
    SEL v14 = "registerFormatterHexDumpWithBuffer:andLength:";
    uint64_t v12 = &stru_1000186C8;
  }

  uint64_t v15 = malloc(a5);
  bzero(v15, a5);
  memcpy(v15, a4, a5);
  int v16 = -[PDController printCommand:withTitle:andFormatter:andData:andLength:]( self,  "printCommand:withTitle:andFormatter:andData:andLength:",  v7,  v12,  v14,  v15,  a5);
  free(v15);

  return v16;
}

- (int)printCommand:(unsigned int)a3 withTitle:(id)a4 andFormatter:(SEL)a5 andData:(void *)a6 andLength:(unint64_t)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  if (a7 >= 0x40) {
    unint64_t v13 = 64LL;
  }
  else {
    unint64_t v13 = a7;
  }
  id v14 = off_1000217F8(self, a5, a6, 64LL, a6, v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
  {
    id v17 = v15;
    if ([v17 count])
    {
      if ([v17 count])
      {
        unint64_t v18 = 0LL;
        do
        {
          unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:v18]);
          if (v18) {
            -[PDController printCommandDescription:](self, "printCommandDescription:", v19);
          }
          else {
            -[PDController printCommand:withTitle:andDescription:]( self,  "printCommand:withTitle:andDescription:",  v10,  v12,  v19);
          }

          ++v18;
        }

        while ((unint64_t)[v17 count] > v18);
      }
    }

    else
    {
      -[PDController printCommand:withTitle:andDescription:]( self,  "printCommand:withTitle:andDescription:",  v10,  v12,  &stru_1000186C8);
    }
  }

  else
  {
    -[PDController printCommand:withTitle:andDescription:]( self,  "printCommand:withTitle:andDescription:",  v10,  v12,  v15);
  }

  return 0;
}

- (int)printCommand:(unsigned int)a3 withWriteData:(void *)a4 withWriteLength:(unint64_t)a5
{
  return -[PDController printCommand:withTitle:andFormatter:andWriteData:andWriteDataLength:]( self,  "printCommand:withTitle:andFormatter:andWriteData:andWriteDataLength:",  *(void *)&a3,  &stru_1000186C8,  "commandFormatterHexDumpWithBuffer:length:inputBuffer:andInputLength:",  a4,  a5);
}

- (int)printCommand:(unsigned int)a3 withTitle:(id)a4 andFormatter:(SEL)a5 andWriteData:(void *)a6 andWriteDataLength:(unint64_t)a7
{
  __int16 v7 = a7;
  unsigned int v21 = a3;
  id v11 = a4;
  id v12 = malloc(0x40uLL);
  if (!v12)
  {
    uint64_t v13 = 3758097085LL;
    goto LABEL_13;
  }

  WORD1(v20) = 64;
  LOWORD(v20) = v7;
  uint64_t v13 = -[PDController executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLeng th:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v21,  a6,  0LL,  v12,  0LL,  v20,  10LL);
  if ((_DWORD)v13)
  {
LABEL_13:
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Status = 0x%08x",  v13));
    goto LABEL_14;
  }

  id v14 = off_1000217F8(self, a5, v12, 64LL, a6, 64LL);
  id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
  {
LABEL_14:
    -[PDController printCommand:withTitle:andDescription:]( self,  "printCommand:withTitle:andDescription:",  v21,  v11,  v15);
    goto LABEL_15;
  }

  id v15 = v15;
  if ([v15 count])
  {
    if ([v15 count])
    {
      unint64_t v17 = 0LL;
      do
      {
        unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:v17]);
        if (v17) {
          -[PDController printCommandDescription:](self, "printCommandDescription:", v18);
        }
        else {
          -[PDController printCommand:withTitle:andDescription:]( self,  "printCommand:withTitle:andDescription:",  v21,  v11,  v18);
        }

        ++v17;
      }

      while ((unint64_t)[v15 count] > v17);
    }
  }

  else
  {
    -[PDController printCommand:withTitle:andDescription:]( self,  "printCommand:withTitle:andDescription:",  v21,  v11,  &stru_1000186C8);
  }

LABEL_15:
  if (v12) {
    free(v12);
  }

  return v13;
}

- (void)printCommandDescription:(id)a3
{
}

- (int)printRegister:(unsigned __int8)a3 dataBuffer:(void *)a4 andLength:(unint64_t)a5
{
  uint64_t v7 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerMap](self, "registerMap"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v7));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  if (v11)
  {
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"title"]);
    uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"formatter"]);
    SEL v14 = NSSelectorFromString(v13);
  }

  else
  {
    SEL v14 = "registerFormatterHexDumpWithBuffer:andLength:";
    id v12 = &stru_1000186C8;
  }

  id v15 = malloc(a5);
  bzero(v15, a5);
  memcpy(v15, a4, a5);
  int v16 = -[PDController printRegister:withTitle:andFormatter:andData:andLength:]( self,  "printRegister:withTitle:andFormatter:andData:andLength:",  v7,  v12,  v14,  v15,  a5);
  free(v15);

  return v16;
}

- (int)printRegister:(unsigned __int8)a3 withTitle:(id)a4 andFormatter:(SEL)a5 andData:(void *)a6 andLength:(unint64_t)a7
{
  uint64_t v10 = a3;
  id v12 = a4;
  if (a7 >= 0x40) {
    unint64_t v13 = 64LL;
  }
  else {
    unint64_t v13 = a7;
  }
  id v14 = off_1000217F0(self, a5, a6, v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
  {
    id v17 = v15;
    if ([v17 count])
    {
      if ([v17 count])
      {
        unint64_t v18 = 0LL;
        do
        {
          unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:v18]);
          if (v18) {
            -[PDController printRegisterDescription:](self, "printRegisterDescription:", v19);
          }
          else {
            -[PDController printRegister:withTitle:andDescription:]( self,  "printRegister:withTitle:andDescription:",  v10,  v12,  v19);
          }

          ++v18;
        }

        while ((unint64_t)[v17 count] > v18);
      }
    }

    else
    {
      -[PDController printRegister:withTitle:andDescription:]( self,  "printRegister:withTitle:andDescription:",  v10,  v12,  &stru_1000186C8);
    }
  }

  else
  {
    -[PDController printRegister:withTitle:andDescription:]( self,  "printRegister:withTitle:andDescription:",  v10,  v12,  v15);
  }

  return 0;
}

- (int)printRegister:(unsigned __int8)a3
{
  return -[PDController printRegister:withTitle:andFormatter:]( self,  "printRegister:withTitle:andFormatter:",  a3,  &stru_1000186C8,  "registerFormatterHexDumpWithBuffer:andLength:");
}

- (int)printRegister:(unsigned __int8)a3 withTitle:(id)a4 andFormatter:(SEL)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = malloc(0x40uLL);
  unint64_t v18 = 0LL;
  if (!v9)
  {
    uint64_t v10 = 3758097085LL;
    goto LABEL_16;
  }

  uint64_t v10 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v9,  64LL,  v6,  &v18);
  if ((_DWORD)v10)
  {
LABEL_16:
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Status = 0x%08x\n",  v10));
LABEL_17:
    -[PDController printRegister:withTitle:andDescription:]( self,  "printRegister:withTitle:andDescription:",  v6,  v8,  v13);
    goto LABEL_18;
  }

  if (v18 >= 0x40) {
    uint64_t v11 = 64LL;
  }
  else {
    uint64_t v11 = v18;
  }
  unint64_t v18 = v11;
  id v12 = off_1000217F0(self, a5, v9);
  id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0) {
    goto LABEL_17;
  }
  id v13 = v13;
  if ([v13 count])
  {
    if ([v13 count])
    {
      unint64_t v15 = 0LL;
      do
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v15]);
        if (v15) {
          -[PDController printRegisterDescription:](self, "printRegisterDescription:", v16);
        }
        else {
          -[PDController printRegister:withTitle:andDescription:]( self,  "printRegister:withTitle:andDescription:",  v6,  v8,  v16);
        }

        ++v15;
      }

      while ((unint64_t)[v13 count] > v15);
    }
  }

  else
  {
    -[PDController printRegister:withTitle:andDescription:]( self,  "printRegister:withTitle:andDescription:",  v6,  v8,  &stru_1000186C8);
  }

LABEL_18:
  if (v9) {
    free(v9);
  }

  return v10;
}

- (void)printRegister:(unsigned __int8)a3 withTitle:(id)a4 andDescription:(id)a5
{
}

- (void)printRegisterTitle:(id)a3 andDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (const char *)[v5 UTF8String];
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  printf("%s\t%s\n", v7, v9);
}

- (void)printRegisterDescription:(id)a3
{
}

- (void)printRegisterDescription:(id)a3 withIndex:(int)a4
{
}

- (id)registerFormatterDecimal8WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 1) {
    id v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", *(unsigned __int8 *)a3);
  }
  else {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld != 1",  a4);
  }
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterDecimal16WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 2) {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  *(unsigned __int16 *)a3);
  }
  else {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld != 2",  a4);
  }
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterDecimal32WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 4) {
    id v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", *(unsigned int *)a3);
  }
  else {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld != 4",  a4);
  }
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterDecimal64WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 8) {
    id v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lld", *(void *)a3);
  }
  else {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld != 8",  a4);
  }
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterHex16WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 2) {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%04x",  *(unsigned int *)a3);
  }
  else {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld != 2",  a4);
  }
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterHex32WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 4) {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%08x",  *(unsigned int *)a3);
  }
  else {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld != 4",  a4);
  }
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatter4CCWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 4) {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%c%c%c%c",  *(unsigned __int8 *)a3,  *((unsigned __int8 *)a3 + 1),  *((unsigned __int8 *)a3 + 2),  *((unsigned __int8 *)a3 + 3));
  }
  else {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld != 4",  a4,  v6,  v7,  v8);
  }
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterUUIDWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 16)
  {
    uuid_unparse((const unsigned __int8 *)a3, out);
    id v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", out);
  }

  else
  {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld != 4",  a4);
  }

  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterStringWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  *((char *)a3 + a4 - 1) = 0;
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"\"%s\"", a3);
}

- (id)registerFormatterHexDumpWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (!a4) {
    goto LABEL_7;
  }
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  do
  {
    if (!v8)
    {
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
      -[__CFString appendFormat:](v8, "appendFormat:", @"0x%02llX\t", a4);
      -[__CFString appendString:](v8, "appendString:", @"0x");
    }

    -[__CFString appendFormat:](v8, "appendFormat:", @"%02X", *((unsigned __int8 *)a3 + v7++));
  }

  while (a4 != v7);
  id v9 = v8;
  if (!v8)
  {
LABEL_7:
    id v9 = 0LL;
    uint64_t v8 = @"0x00";
  }

  [v6 addObject:v8];

  return v6;
}

- (id)commandFormatterHexDumpWithBuffer:(void *)a3 length:(unint64_t)a4 inputBuffer:(void *)a5 andInputLength:(unint64_t)a6
{
  return -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  a3,  64LL,  a5,  a6);
}

- (id)registerFormatterHexDumpNarrowWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (a4)
  {
    unint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    do
    {
      if (!v8) {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
      }
      [v8 appendFormat:@"0x%02X "];
      if ((v7 & 7) == 0 || v7 >= a4)
      {
        [v6 addObject:v8];

        uint64_t v8 = 0LL;
      }
    }

    while (a4 != v7);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v6;
}

- (id)registerFormatterDecimal32MillisecondsWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 4) {
    id v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d ms", *(unsigned int *)a3);
  }
  else {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld != 4",  a4);
  }
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterBCDVersionWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 4) {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%X.%X.%X",  *((unsigned __int16 *)a3 + 1),  *((unsigned __int8 *)a3 + 1),  *(unsigned __int8 *)a3);
  }
  else {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld != 4",  a4,  v6,  v7);
  }
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterRxVDMWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  uint64_t v7 = v6;
  if (a4 == 29)
  {
    unsigned int v9 = *(unsigned __int8 *)a3;
    uint64_t v8 = (unsigned int *)((char *)a3 + 1);
    uint64_t v10 = v9 & 7;
    [v6 appendFormat:@"seq=%d cnt=%d ", (v9 >> 5) & 3, v10];
    if ((_DWORD)v10)
    {
      do
      {
        unsigned int v11 = *v8++;
        [v7 appendFormat:@"0x%08X "];
        --v10;
      }

      while (v10);
    }
  }

  else
  {
    [v6 appendFormat:@"ERROR: length %lld != 29" a4];
  }

  return v7;
}

- (id)registerFormatterVIDWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 4)
  {
    if (*(_DWORD *)a3 == 40)
    {
      id v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"0x%08X (TI)", 40LL);
    }

    else if (*(_DWORD *)a3 == 2599)
    {
      id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%08X (Apple Inc.)",  2599LL);
    }

    else
    {
      id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%08X",  *(unsigned int *)a3);
    }
  }

  else
  {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld != 4",  a4);
  }

  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterDIDWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 4)
  {
    if (*(_DWORD *)a3 == 24) {
      id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%08X (PDControllerType1[USB-C])",  24LL);
    }
    else {
      id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%08X",  *(unsigned int *)a3);
    }
  }

  else
  {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld != 4",  a4);
  }

  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)readFullVersion
{
  return &stru_1000186C8;
}

- (unsigned)readUUIDIntoBuffer:(char *)a3 ofLength:(unsigned __int8)a4
{
  return 0;
}

- (BOOL)isSPIMaster
{
  return 1;
}

- (id)getDeviceInfoNameWithConfigOnly:(BOOL)a3
{
  return @"Unknown";
}

- (int)disc:(unsigned __int8)a3
{
  return -536870201;
}

- (int)forceMode:(unsigned __int8)a3 withDataStatus:(unsigned int)a4 andStatus:(unsigned int)a5
{
  return -536870201;
}

- (int)forceUpdateMode:(unsigned __int8)a3
{
  return -536870201;
}

- (int)executeIECSAtomicCommand:(unsigned __int8)a3 cmdBuffer:(void *)a4 dataBuffer:(void *)a5 extDataBuffer:(void *)a6 returnDataBuffer:(void *)a7 returnExtDataBuffer:(void *)a8 inputDataLength:(unsigned __int16)a9 returnDataBufferLength:(unsigned __int16)a10 timeoutInSeconds:(unint64_t)a11
{
  return -536870201;
}

- (int)setupForLivePDLog
{
  return -536870201;
}

- (int)runLivePDLog
{
  return -536870201;
}

- (NSDictionary)registerMap
{
  return self->_registerMap;
}

- (void)setRegisterMap:(id)a3
{
}

- (NSDictionary)commandMap
{
  return self->_commandMap;
}

- (void)setCommandMap:(id)a3
{
}

- (unsigned)address
{
  return self->_address;
}

- (void)setAddress:(unsigned __int8)a3
{
  self->_address = a3;
}

- (unsigned)vid
{
  return self->_vid;
}

- (void)setVid:(unsigned int)a3
{
  self->_vid = a3;
}

- (unsigned)did
{
  return self->_did;
}

- (void)setDid:(unsigned int)a3
{
  self->_did = a3;
}

- (AppleHPMUserClient)userClient
{
  return self->_userClient;
}

- (void)setUserClient:(id)a3
{
}

- (BOOL)remote
{
  return self->_remote;
}

- (void)setRemote:(BOOL)a3
{
  self->_remote = a3;
}

- (void).cxx_destruct
{
}

@end