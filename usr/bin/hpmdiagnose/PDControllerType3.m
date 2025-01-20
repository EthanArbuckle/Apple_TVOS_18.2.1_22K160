@interface PDControllerType3
+ (id)PDControllerType3MicroWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4;
- (AppleHPMUserClient)userClient;
- (BOOL)remote;
- (NSDictionary)registerMap;
- (PDControllerType3)initWithAddress:(unsigned __int8)a3 userClient:(id)a4;
- (int)executeIECSCommand:(unsigned int)a3;
- (int)getVDM:(unsigned int *)a3 ofLength:(unint64_t *)a4;
- (int)isPDControllerType3HPM:(BOOL *)a3;
- (int)readIECSRegister:(void *)a3 ofLength:(unint64_t)a4 atRegister:(unsigned int)a5 andOutReadLength:(unint64_t *)a6;
- (int)registerRead32:(unsigned int *)a3 atAddress:(unsigned int)a4;
- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5;
- (int)registerWrite32:(unsigned int)a3 atAddress:(unsigned int)a4;
- (int)sendVDM:(unsigned int *)a3 ofLength:(unint64_t)a4;
- (int)writeIECSRegister:(void *)a3 ofLength:(unint64_t)a4 atRegister:(unsigned int)a5;
- (unsigned)address;
- (unsigned)burstLimit;
- (unsigned)cached_sequence_num;
- (unsigned)streamSequenceNumber;
- (void)dealloc;
- (void)setAddress:(unsigned __int8)a3;
- (void)setBurstLimit:(unsigned __int8)a3;
- (void)setCached_sequence_num:(unsigned __int8)a3;
- (void)setRegisterMap:(id)a3;
- (void)setRemote:(BOOL)a3;
- (void)setStreamSequenceNumber:(unsigned __int8)a3;
- (void)setUserClient:(id)a3;
@end

@implementation PDControllerType3

+ (id)PDControllerType3MicroWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithAddress:v4 userClient:v6];

  return v7;
}

- (PDControllerType3)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  id v5 = a4;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PDControllerType3;
  id v6 = -[PDControllerType3 init](&v10, "init");
  id v7 = v6;
  if (!v6
    || (-[PDControllerType3 setUserClient:](v6, "setUserClient:", v5),
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType3 userClient](v7, "userClient")),
        v8,
        !v8))
  {

    id v7 = 0LL;
  }

  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___PDControllerType3;
  -[PDControllerType3 dealloc](&v2, "dealloc");
}

- (int)sendVDM:(unsigned int *)a3 ofLength:(unint64_t)a4
{
  int v12 = 0;
  if (a4 >= 7) {
    unint64_t v5 = 7LL;
  }
  else {
    unint64_t v5 = a4;
  }
  char v10 = v5;
  __memcpy_chk(v11, a3, 4 * v5, 28LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType3 userClient](self, "userClient"));
  int v7 = [v6 iecsWriteCommandForDevice:[self address] withAddress:9 buffer:&v10 length:(4 * v5) | 1 flags:0];

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType3 userClient](self, "userClient"));
    int v7 = [v8 iecsCommand:1447316851 forDevice:[self address] flags:0];
  }

  return v7;
}

- (int)getVDM:(unsigned int *)a3 ofLength:(unint64_t *)a4
{
  uint64_t v12 = 65LL;
  if (*a4 >= 8) {
    *a4 = 7LL;
  }
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType3 userClient](self, "userClient"));
  int v8 = [v7 iecsReadCommandForDevice:[self address] withAddress:79 buffer:&v13 length:4 * *a4 flags:0 andOutReadLength:&v12];

  if (!v8)
  {
    uint64_t v9 = v13 >> 5;
    if ((_DWORD)v9 == -[PDControllerType3 cached_sequence_num](self, "cached_sequence_num"))
    {
      bzero(a3, 4 * *a4);
      *a4 = 0LL;
    }

    else
    {
      -[PDControllerType3 setCached_sequence_num:](self, "setCached_sequence_num:", v9);
      unint64_t v10 = v13 & 7;
      *a4 = v10;
      memcpy(a3, &v14, 4 * v10);
    }
  }

  return v8;
}

- (int)readIECSRegister:(void *)a3 ofLength:(unint64_t)a4 atRegister:(unsigned int)a5 andOutReadLength:(unint64_t *)a6
{
  if (a4 >= 0x40) {
    unint64_t v10 = 64LL;
  }
  else {
    unint64_t v10 = a4;
  }
LABEL_4:
  unsigned int v27 = 95158787;
  v28[0] = v10 | ((-[PDControllerType3 burstLimit](self, "burstLimit") & 0xF) << 16) | 0x1000000;
  v28[1] = a5;
  unsigned int v11 = -[PDControllerType3 sendVDM:ofLength:](self, "sendVDM:ofLength:", &v27, 3LL);
  if (v11)
  {
    int v13 = v11;
  }

  else
  {
    while (1)
    {
      do
      {
        uint64_t v26 = 7LL;
        unsigned int v12 = -[PDControllerType3 getVDM:ofLength:](self, "getVDM:ofLength:", &v27, &v26);
        int v13 = v12;
      }

      while (!v12 && !v26);
      if (v12) {
        break;
      }
      if (v27 >> 15 == 2904)
      {
        int v14 = (v27 >> 4) & 3;
        if (v14 == 2)
        {
          int v13 = -536870212;
        }

        else
        {
          if (v14 != 1) {
            goto LABEL_4;
          }
          int v13 = 0;
        }

        break;
      }
    }
  }

  BOOL v15 = v10 != 0;
  if (!v13 && v10)
  {
    v25 = (char *)a3;
    unint64_t v16 = 0LL;
    do
    {
      else {
        int v17 = 95159809;
      }
      while (1)
      {
        unsigned int v27 = v17;
        -[PDControllerType3 sendVDM:ofLength:](self, "sendVDM:ofLength:", &v27, 1LL, v25);
        do
        {
          uint64_t v26 = 7LL;
          unsigned int v18 = -[PDControllerType3 getVDM:ofLength:](self, "getVDM:ofLength:", &v27, &v26);
          int v13 = v18;
        }

        while (!v18 && !v26);
        if (v18 || v27 >> 15 != 2904) {
          break;
        }
        int v19 = (v27 >> 4) & 3;
        if (v19 == 2)
        {
          int v13 = 0;
          goto LABEL_34;
        }

        if (v19 == 1)
        {
          size_t v20 = ((unint64_t)v27 >> 6) & 0x1F;
          memcpy(&v25[v16], v28, v20);
          v16 += v20;
          *a6 = v16;
          break;
        }

        BOOL v15 = v10 > v16;
        if (v10 <= v16)
        {
          int v13 = 0;
          BOOL v15 = v10 > v16;
          goto LABEL_34;
        }
      }

      BOOL v15 = v16 < v10;
    }

    while (!v13 && v16 < v10);
  }

- (int)writeIECSRegister:(void *)a3 ofLength:(unint64_t)a4 atRegister:(unsigned int)a5
{
  if (a4 >= 0x40) {
    unint64_t v8 = 64LL;
  }
  else {
    unint64_t v8 = a4;
  }
LABEL_4:
  unsigned int v31 = 95158787;
  v32[0] = v8 | ((-[PDControllerType3 burstLimit](self, "burstLimit") & 0xF) << 16) | 0x1800000;
  v32[1] = a5;
  unsigned int v9 = -[PDControllerType3 sendVDM:ofLength:](self, "sendVDM:ofLength:", &v31, 3LL);
  if (v9)
  {
    int v11 = v9;
  }

  else
  {
    while (1)
    {
      do
      {
        uint64_t v30 = 7LL;
        unsigned int v10 = -[PDControllerType3 getVDM:ofLength:](self, "getVDM:ofLength:", &v31, &v30);
        int v11 = v10;
      }

      while (!v10 && !v30);
      if (v10) {
        break;
      }
      if (v31 >> 15 == 2904)
      {
        int v12 = (v31 >> 4) & 3;
        if (v12 == 2) {
          return -536870212;
        }
        if (v12 != 1) {
          goto LABEL_4;
        }
        int v11 = 0;
        break;
      }
    }
  }

  BOOL v13 = v8 != 0;
  if (!v11 && v8)
  {
    unint64_t v14 = 0LL;
    v28 = a3;
    unint64_t v29 = v8;
    do
    {
      unsigned __int8 v15 = v8 - v14;
      unint64_t v16 = (v8 - v14);
      BOOL v17 = v8 > v14;
      if (v16 > 0x18) {
        unsigned __int8 v15 = 24;
      }
      unsigned int v18 = (char *)a3 + v14;
      uint64_t v19 = v15;
      int v20 = ((v15 & 0x1F) << 6) | 0x5AC0002;
      uint64_t v21 = ((v15 + 3) >> 2) + 1;
      while (1)
      {
        __memcpy_chk(v32, v18, v19, 24LL);
        unsigned int v31 = v20;
        -[PDControllerType3 sendVDM:ofLength:](self, "sendVDM:ofLength:", &v31, v21);
        do
        {
          uint64_t v30 = 7LL;
          unsigned int v22 = -[PDControllerType3 getVDM:ofLength:](self, "getVDM:ofLength:", &v31, &v30);
          int v11 = v22;
        }

        while (!v22 && !v30);
        if (v22 || v31 >> 15 != 2904) {
          break;
        }
        int v23 = (v31 >> 4) & 3;
        if (v23 == 2)
        {
          int v11 = 0;
          goto LABEL_33;
        }

        if (v23 == 1)
        {
          v14 += v19;
          break;
        }

        BOOL v13 = v17;
        if (v29 <= v14)
        {
          int v11 = 0;
          BOOL v13 = v17;
          goto LABEL_33;
        }
      }

      a3 = v28;
      unint64_t v8 = v29;
      BOOL v13 = v14 < v29;
    }

    while (!v22 && v14 < v29);
  }

- (int)executeIECSCommand:(unsigned int)a3
{
  int v10 = 0;
  uint64_t v9 = 4LL;
  int result = -[PDControllerType3 readIECSRegister:ofLength:atRegister:andOutReadLength:]( self,  "readIECSRegister:ofLength:atRegister:andOutReadLength:",  &v10,  4LL,  8LL,  &v9);
  if (!result && v10)
  {
    int v10 = 0;
    int result = -[PDControllerType3 writeIECSRegister:ofLength:atRegister:]( self,  "writeIECSRegister:ofLength:atRegister:",  &v10,  4LL,  8LL);
  }

  if (!result)
  {
    LODWORD(v9) = bswap32(a3);
    int result = -[PDControllerType3 writeIECSRegister:ofLength:atRegister:]( self,  "writeIECSRegister:ofLength:atRegister:",  &v9,  4LL,  8LL);
    if (!result)
    {
      int v6 = 100000;
      while (1)
      {
        uint64_t v9 = 4LL;
        int v7 = -[PDControllerType3 readIECSRegister:ofLength:atRegister:andOutReadLength:]( self,  "readIECSRegister:ofLength:atRegister:andOutReadLength:",  &v10,  4LL,  8LL,  &v9);
        int v8 = v10;
        if (v7 || !v10) {
          break;
        }
        +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.0000999999975);
        if (!--v6)
        {
          int v8 = v10;
          break;
        }
      }

      if (v8) {
        return -536870186;
      }
      else {
        return v7;
      }
    }
  }

  return result;
}

- (int)isPDControllerType3HPM:(BOOL *)a3
{
  *a3 = 0;
  uint64_t v7 = 0LL;
  int result = -[PDControllerType3 registerRead32:atAddress:](self, "registerRead32:atAddress:", (char *)&v7 + 4, 0LL);
  if (!result)
  {
    int result = -[PDControllerType3 registerRead32:atAddress:](self, "registerRead32:atAddress:", &v7, 1LL);
    if (!result)
    {
      int result = 0;
      if (HIDWORD(v7) == 2599 && (_DWORD)v7 == 25) {
        *a3 = 1;
      }
    }
  }

  return result;
}

- (int)registerRead32:(unsigned int *)a3 atAddress:(unsigned int)a4
{
  uint64_t v5 = 0LL;
  return -[PDControllerType3 readIECSRegister:ofLength:atRegister:andOutReadLength:]( self,  "readIECSRegister:ofLength:atRegister:andOutReadLength:",  a3,  4LL,  *(void *)&a4,  &v5);
}

- (int)registerWrite32:(unsigned int)a3 atAddress:(unsigned int)a4
{
  unsigned int v5 = a3;
  return -[PDControllerType3 writeIECSRegister:ofLength:atRegister:]( self,  "writeIECSRegister:ofLength:atRegister:",  &v5,  4LL,  *(void *)&a4);
}

- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  uint64_t v6 = 0LL;
  return -[PDControllerType3 readIECSRegister:ofLength:atRegister:andOutReadLength:]( self,  "readIECSRegister:ofLength:atRegister:andOutReadLength:",  a3,  a4,  *(void *)&a5,  &v6);
}

- (BOOL)remote
{
  return self->_remote;
}

- (void)setRemote:(BOOL)a3
{
  self->_remote = a3;
}

- (AppleHPMUserClient)userClient
{
  return self->_userClient;
}

- (void)setUserClient:(id)a3
{
}

- (NSDictionary)registerMap
{
  return self->_registerMap;
}

- (void)setRegisterMap:(id)a3
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

- (unsigned)cached_sequence_num
{
  return self->_cached_sequence_num;
}

- (void)setCached_sequence_num:(unsigned __int8)a3
{
  self->_cached_sequence_num = a3;
}

- (unsigned)streamSequenceNumber
{
  return self->_streamSequenceNumber;
}

- (void)setStreamSequenceNumber:(unsigned __int8)a3
{
  self->_streamSequenceNumber = a3;
}

- (unsigned)burstLimit
{
  return self->_burstLimit;
}

- (void)setBurstLimit:(unsigned __int8)a3
{
  self->_burstLimit = a3;
}

- (void).cxx_destruct
{
}

@end