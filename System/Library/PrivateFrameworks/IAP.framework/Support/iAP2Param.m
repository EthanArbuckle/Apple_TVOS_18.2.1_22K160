@interface iAP2Param
+ (id)createParamWithID:(unsigned __int16)a3;
+ (id)createParamWithIDAndDataBool:(unsigned __int16)a3 :(BOOL)a4;
+ (id)createParamWithIDAndDataInt16:(unsigned __int16)a3 :(signed __int16)a4;
+ (id)createParamWithIDAndDataInt32:(unsigned __int16)a3 :(int)a4;
+ (id)createParamWithIDAndDataInt64:(unsigned __int16)a3 :(int64_t)a4;
+ (id)createParamWithIDAndDataInt8:(unsigned __int16)a3 :(char)a4;
+ (id)createParamWithIDAndDataRaw:(unsigned __int16)a3 :(char *)a4 :(unsigned __int16)a5;
+ (id)createParamWithIDAndDataU16:(unsigned __int16)a3 :(unsigned __int16)a4;
+ (id)createParamWithIDAndDataU32:(unsigned __int16)a3 :(unsigned int)a4;
+ (id)createParamWithIDAndDataU64:(unsigned __int16)a3 :(unint64_t)a4;
+ (id)createParamWithIDAndDataU8:(unsigned __int16)a3 :(unsigned __int8)a4;
+ (id)createParamWithIDAndNSData:(unsigned __int16)a3 :(id)a4;
+ (id)createParamWithIDAndNSString:(unsigned __int16)a3 :(id)a4;
- (BOOL)getParamDataAsBool:(int *)a3;
- (const)getParamDataAsRaw:(unsigned __int16 *)a3 :(int *)a4;
- (iAP2Param)init;
- (id)description;
- (id)getParamDataAsNSData:(int *)a3;
- (id)getParamDataAsNSString:(int *)a3;
- (id)getParamDataPtr;
- (int)parseParamBuffer:(const char *)a3 :(unsigned __int16)a4 :(unsigned __int16)a5 :(unsigned __int16 *)a6;
- (unint64_t)getParamDataAsU64:(int *)a3;
- (unsigned)generateRawParamBuffer:(char *)a3;
- (unsigned)getGrpParamID;
- (unsigned)getGrpParamLen;
- (unsigned)getParamDataAsU16:(int *)a3;
- (unsigned)getParamDataAsU32:(int *)a3;
- (unsigned)getParamDataAsU8:(int *)a3;
- (unsigned)getRawParamLength;
- (void)dealloc;
- (void)getParamDataAsNone:(int *)a3;
- (void)setGrpParamID:(unsigned __int16)a3;
- (void)setParamDataPtr:(id)a3;
@end

@implementation iAP2Param

+ (id)createParamWithID:(unsigned __int16)a3
{
  id result = objc_alloc_init(&OBJC_CLASS___iAP2Param);
  if (result) {
    *((_WORD *)result + 4) = a3;
  }
  return result;
}

+ (id)createParamWithIDAndDataRaw:(unsigned __int16)a3 :(char *)a4 :(unsigned __int16)a5
{
  unsigned int v5 = a5;
  v8 = objc_alloc_init(&OBJC_CLASS___iAP2Param);
  v9 = v8;
  if (v5 && a4 && v8)
  {
    v8->paramID = a3;
    if (v5 > 8)
    {
      v10 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", a4, v5);
      v9->pNSParamData = v10;
      if (v10) {
        v9->paramType = 11;
      }
      else {
        syslog(3, "[iAP2Param createParamWithIDAndDataRaw] pNSParamData alloc error !\n");
      }
    }

    else
    {
      v8->paramType = 1;
      v8->paramRawLen = v5;
      memcpy(&v8->paramInteger, a4, v5);
    }
  }

  return v9;
}

+ (id)createParamWithIDAndDataBool:(unsigned __int16)a3 :(BOOL)a4
{
  id result = objc_alloc_init(&OBJC_CLASS___iAP2Param);
  if (result)
  {
    *((_WORD *)result + 4) = a3;
    *((_BYTE *)result + 24) = a4;
    *((_DWORD *)result + 4) = 2;
  }

  return result;
}

+ (id)createParamWithIDAndDataU8:(unsigned __int16)a3 :(unsigned __int8)a4
{
  id result = objc_alloc_init(&OBJC_CLASS___iAP2Param);
  if (result)
  {
    *((_WORD *)result + 4) = a3;
    *((_BYTE *)result + 24) = a4;
    *((_DWORD *)result + 4) = 3;
  }

  return result;
}

+ (id)createParamWithIDAndDataU16:(unsigned __int16)a3 :(unsigned __int16)a4
{
  id result = objc_alloc_init(&OBJC_CLASS___iAP2Param);
  if (result)
  {
    *((_WORD *)result + 4) = a3;
    *((_WORD *)result + 12) = a4;
    *((_DWORD *)result + 4) = 4;
  }

  return result;
}

+ (id)createParamWithIDAndDataU32:(unsigned __int16)a3 :(unsigned int)a4
{
  id result = objc_alloc_init(&OBJC_CLASS___iAP2Param);
  if (result)
  {
    *((_WORD *)result + 4) = a3;
    *((_DWORD *)result + 6) = a4;
    *((_DWORD *)result + 4) = 5;
  }

  return result;
}

+ (id)createParamWithIDAndDataU64:(unsigned __int16)a3 :(unint64_t)a4
{
  id result = objc_alloc_init(&OBJC_CLASS___iAP2Param);
  if (result)
  {
    *((_WORD *)result + 4) = a3;
    *((void *)result + 3) = a4;
    *((_DWORD *)result + 4) = 6;
  }

  return result;
}

+ (id)createParamWithIDAndDataInt8:(unsigned __int16)a3 :(char)a4
{
  id result = objc_alloc_init(&OBJC_CLASS___iAP2Param);
  if (result)
  {
    *((_WORD *)result + 4) = a3;
    *((_BYTE *)result + 24) = a4;
    *((_DWORD *)result + 4) = 7;
  }

  return result;
}

+ (id)createParamWithIDAndDataInt16:(unsigned __int16)a3 :(signed __int16)a4
{
  id result = objc_alloc_init(&OBJC_CLASS___iAP2Param);
  if (result)
  {
    *((_WORD *)result + 4) = a3;
    *((_WORD *)result + 12) = a4;
    *((_DWORD *)result + 4) = 8;
  }

  return result;
}

+ (id)createParamWithIDAndDataInt32:(unsigned __int16)a3 :(int)a4
{
  id result = objc_alloc_init(&OBJC_CLASS___iAP2Param);
  if (result)
  {
    *((_WORD *)result + 4) = a3;
    *((_DWORD *)result + 6) = a4;
    *((_DWORD *)result + 4) = 9;
  }

  return result;
}

+ (id)createParamWithIDAndDataInt64:(unsigned __int16)a3 :(int64_t)a4
{
  id result = objc_alloc_init(&OBJC_CLASS___iAP2Param);
  if (result)
  {
    *((_WORD *)result + 4) = a3;
    *((void *)result + 3) = a4;
    *((_DWORD *)result + 4) = 10;
  }

  return result;
}

+ (id)createParamWithIDAndNSData:(unsigned __int16)a3 :(id)a4
{
  v6 = objc_alloc_init(&OBJC_CLASS___iAP2Param);
  v7 = v6;
  if (v6)
  {
    v6->paramID = a3;
    v6->paramType = 11;
    v6->pNSParamData = a4;
  }

  return v7;
}

+ (id)createParamWithIDAndNSString:(unsigned __int16)a3 :(id)a4
{
  v6 = objc_alloc_init(&OBJC_CLASS___iAP2Param);
  v7 = v6;
  if (v6)
  {
    v6->paramID = a3;
    v6->paramType = 12;
    v6->pNSParamData = a4;
  }

  return v7;
}

- (void)getParamDataAsNone:(int *)a3
{
  int paramType = self->paramType;
  if (paramType)
  {
    if (paramType == 11)
    {
      if ([self->pNSParamData length]) {
        int paramType = 96;
      }
      else {
        int paramType = 0;
      }
    }

    else
    {
      int paramType = 96;
    }
  }

  *a3 = paramType;
}

- (const)getParamDataAsRaw:(unsigned __int16 *)a3 :(int *)a4
{
  int paramType = self->paramType;
  if (paramType == 11)
  {
    p_paramInteger = (iAP2ParamDataInteger_ *)[self->pNSParamData bytes];
    unsigned __int16 paramRawLen = (unsigned __int16)[self->pNSParamData length];
    int v8 = 0;
  }

  else if (paramType == 1)
  {
    int v8 = 0;
    p_paramInteger = &self->paramInteger;
    unsigned __int16 paramRawLen = self->paramRawLen;
  }

  else
  {
    p_paramInteger = 0LL;
    unsigned __int16 paramRawLen = 0;
    int v8 = 96;
  }

  *a3 = paramRawLen;
  *a4 = v8;
  return (const char *)p_paramInteger;
}

- (BOOL)getParamDataAsBool:(int *)a3
{
  int paramType = self->paramType;
  if (paramType == 11)
  {
    if ([self->pNSParamData length] == (id)1)
    {
      int v6 = *(unsigned __int8 *)[self->pNSParamData bytes];
      self->paramInteger.u8 = v6;
      BOOL v7 = v6 != 0;
      self->int paramType = 2;

      int v8 = 0;
      self->pNSParamData = 0LL;
      goto LABEL_8;
    }

    int paramType = self->paramType;
  }

  if (paramType == 2)
  {
    int v8 = 0;
    BOOL v7 = self->paramInteger.u8 != 0;
  }

  else
  {
    BOOL v7 = 0;
    int v8 = 96;
  }

- (unsigned)getParamDataAsU8:(int *)a3
{
  int paramType = self->paramType;
  if (paramType == 11)
  {
    if ([self->pNSParamData length] == (id)1)
    {
      unsigned __int8 u8 = *(_BYTE *)[self->pNSParamData bytes];
      self->paramInteger.unsigned __int8 u8 = u8;
      self->int paramType = 3;

      int v7 = 0;
      self->pNSParamData = 0LL;
      goto LABEL_8;
    }

    int paramType = self->paramType;
  }

  if (paramType == 3)
  {
    int v7 = 0;
    unsigned __int8 u8 = self->paramInteger.u8;
  }

  else
  {
    unsigned __int8 u8 = 0;
    int v7 = 96;
  }

- (unsigned)getParamDataAsU16:(int *)a3
{
  int paramType = self->paramType;
  if (paramType == 11)
  {
    if ([self->pNSParamData length] == (id)2)
    {
      unsigned int v6 = bswap32(*(unsigned __int16 *)[self->pNSParamData bytes]);
      unsigned int v7 = HIWORD(v6);
      self->paramInteger.u16 = HIWORD(v6);
      self->int paramType = 4;

      int v8 = 0;
      self->pNSParamData = 0LL;
      goto LABEL_8;
    }

    int paramType = self->paramType;
  }

  if (paramType == 4)
  {
    int v8 = 0;
    LOWORD(v7) = self->paramInteger.u16;
  }

  else
  {
    LOWORD(v7) = 0;
    int v8 = 96;
  }

- (unsigned)getParamDataAsU32:(int *)a3
{
  int paramType = self->paramType;
  if (paramType == 11)
  {
    if ([self->pNSParamData length] == (id)4)
    {
      unsigned int u32 = bswap32(*(_DWORD *)[self->pNSParamData bytes]);
      self->paramInteger.unsigned int u32 = u32;
      self->int paramType = 5;

      int v7 = 0;
      self->pNSParamData = 0LL;
      goto LABEL_8;
    }

    int paramType = self->paramType;
  }

  if (paramType == 5)
  {
    int v7 = 0;
    unsigned int u32 = self->paramInteger.u32;
  }

  else
  {
    unsigned int u32 = 0;
    int v7 = 96;
  }

- (unint64_t)getParamDataAsU64:(int *)a3
{
  int paramType = self->paramType;
  if (paramType == 11)
  {
    if ([self->pNSParamData length] == (id)8)
    {
      v6.u64 = bswap64(*(void *)[self->pNSParamData bytes]);
      self->paramInteger = v6;
      self->int paramType = 6;

      int v7 = 0;
      self->pNSParamData = 0LL;
      goto LABEL_8;
    }

    int paramType = self->paramType;
  }

  if (paramType == 5)
  {
    int v7 = 0;
    v6.u64 = (unint64_t)self->paramInteger;
  }

  else
  {
    v6.u64 = 0LL;
    int v7 = 96;
  }

- (id)getParamDataAsNSData:(int *)a3
{
  int paramType = self->paramType;
  if (paramType == 11 || paramType == 0)
  {
    int v6 = 0;
    id result = self->pNSParamData;
  }

  else
  {
    id result = 0LL;
    int v6 = 96;
  }

  *a3 = v6;
  return result;
}

- (id)getParamDataAsNSString:(int *)a3
{
  int paramType = self->paramType;
  if (paramType == 12)
  {
    int v9 = 0;
    pNSParamData = (NSString *)self->pNSParamData;
  }

  else
  {
    if (paramType == 11
      && (id v6 = self->pNSParamData) != 0LL
      && (int v7 = (char *)[v6 bytes], !v7[(unsigned __int16)objc_msgSend(self->pNSParamData, "length") - 1]))
    {
      pNSParamData = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7);
      if (pNSParamData)
      {

        self->pNSParamData = pNSParamData;
        v11 = pNSParamData;
        int v9 = 0;
        self->int paramType = 12;
        goto LABEL_8;
      }
    }

    else
    {
      pNSParamData = 0LL;
    }

    int v9 = 96;
  }

- (iAP2Param)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___iAP2Param;
  id result = -[iAP2Param init](&v3, "init");
  if (result)
  {
    *(_DWORD *)&result->paramID = 0;
    result->paramLenRemain = 0;
    result->int paramType = 0;
    result->paramInteger.u64 = 0LL;
    result->unsigned __int16 paramRawLen = 0;
    result->paramParseState = 0;
    result->pNSParamData = 0LL;
  }

  return result;
}

- (void)dealloc
{
  self->pNSParamData = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___iAP2Param;
  -[iAP2Param dealloc](&v3, "dealloc");
}

- (int)parseParamBuffer:(const char *)a3 :(unsigned __int16)a4 :(unsigned __int16)a5 :(unsigned __int16 *)a6
{
  if (a4)
  {
    int v8 = a5;
    int v11 = a4;
    while (1)
    {
      int v12 = v11 - 1;
      int v13 = *(unsigned __int8 *)a3;
      int v14 = v8 - 1;
      switch(self->paramParseState)
      {
        case 0:
          self->paramLen = (_WORD)v13 << 8;
          int result = 36;
          int v16 = 1;
          goto LABEL_25;
        case 1:
          unsigned int v17 = self->paramLen | v13;
          self->paramLen = v17;
          if (v17 < 4)
          {
            syslog(3, "ERROR Line:%04d: Invalid param length:%04X !\n");
LABEL_34:
            int result = 40;
            goto LABEL_35;
          }

          if (v17 - 2 > (unsigned __int16)v14)
          {
            syslog(3, "ERROR Line:%04d: Invalid param length:%04X, max:%04X !\n");
            goto LABEL_34;
          }

          self->uint64_t paramLenRemain = v17 - 4;
          int result = 36;
          int v16 = 2;
LABEL_25:
          self->paramParseState = v16;
          int v8 = v14;
          ++a3;
LABEL_26:
          if (result != 36) {
            goto LABEL_35;
          }
          int v11 = v12;
          if (!(_WORD)v12) {
            goto LABEL_35;
          }
          break;
        case 2:
          self->paramID = (_WORD)v13 << 8;
          int result = 36;
          int v16 = 3;
          goto LABEL_25;
        case 3:
          self->paramID |= v13;
          if (self->paramLen == 4) {
            goto LABEL_30;
          }
          v18 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
          if (v18)
          {
            v19 = v18;

            self->pNSParamData = v19;
            int result = 36;
            int v16 = 4;
            int v20 = 11;
          }

          else
          {
            syslog(3, "ERROR: Line:%04d: Object alloc fail !\n", 814);
            int v20 = 0;
            int result = 12;
            int v16 = 226;
          }

          self->int paramType = v20;
          goto LABEL_25;
        case 4:
          else {
            uint64_t paramLenRemain = (unsigned __int16)v11;
          }
          [self->pNSParamData appendBytes:a3 length:paramLenRemain];
          int v12 = v11 - paramLenRemain;
          int v22 = self->paramLenRemain - (_DWORD)paramLenRemain;
          self->uint64_t paramLenRemain = v22;
          if (!v22) {
            goto LABEL_30;
          }
          a3 += paramLenRemain;
          v8 -= paramLenRemain;
          goto LABEL_22;
        case 5:
          unsigned int v23 = self->paramLenRemain;
          else {
            uint64_t v24 = self->paramLenRemain;
          }
          int v12 = v11 - v24;
          self->uint64_t paramLenRemain = v23 - v24;
          if (v23 <= (unsigned __int16)v11)
          {
LABEL_30:
            int result = 0;
            self->paramParseState = 6;
            goto LABEL_35;
          }

          v8 -= v24;
          a3 += v24;
LABEL_22:
          int result = 36;
          goto LABEL_26;
        default:
          syslog(3, "ERROR Line:%04d: Unknown param parser state !\n", 877);
          int result = 102;
          goto LABEL_35;
      }
    }
  }

  LOWORD(v12) = 0;
  int result = 36;
LABEL_35:
  *a6 = a4 - v12;
  return result;
}

- (unsigned)getGrpParamID
{
  return self->paramID;
}

- (void)setGrpParamID:(unsigned __int16)a3
{
  self->paramID = a3;
}

- (unsigned)getGrpParamLen
{
  return self->paramLen;
}

- (id)getParamDataPtr
{
  return self->pNSParamData;
}

- (void)setParamDataPtr:(id)a3
{
  id v5 = a3;

  self->id pNSParamData = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSMutableData);
  if ((objc_opt_isKindOfClass(a3, v6) & 1) != 0)
  {
    int v7 = 11;
  }

  else
  {
    id pNSParamData = self->pNSParamData;
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(pNSParamData, v9) & 1) != 0)
    {
      int v7 = 12;
    }

    else
    {
      syslog(6, "INFO: [iAP2Param setParamDataPtr] Unknown data type !\n");

      int v7 = 0;
      self->id pNSParamData = 0LL;
    }
  }

  self->int paramType = v7;
}

- (unsigned)getRawParamLength
{
  unsigned __int16 v2 = 4;
  switch(self->paramType)
  {
    case 0:
      return v2;
    case 1:
      unsigned __int16 v2 = self->paramRawLen + 4;
      break;
    case 2:
    case 3:
    case 7:
      unsigned __int16 v2 = 5;
      break;
    case 4:
    case 8:
      unsigned __int16 v2 = 6;
      break;
    case 5:
    case 9:
      unsigned __int16 v2 = 8;
      break;
    case 6:
    case 0xA:
      unsigned __int16 v2 = 12;
      break;
    case 0xB:
      unsigned __int16 v2 = (unsigned __int16)[self->pNSParamData length] + 4;
      break;
    case 0xC:
      unsigned __int16 v2 = (unsigned __int16)[self->pNSParamData lengthOfBytesUsingEncoding:4] + 5;
      break;
    default:
      syslog(6, "[iAP2Param getRawParamLength] Unknown param type:%02X\n", self->paramType);
      unsigned __int16 v2 = 4;
      break;
  }

  return v2;
}

- (unsigned)generateRawParamBuffer:(char *)a3
{
  unsigned int v5 = -[iAP2Param getRawParamLength](self, "getRawParamLength");
  *(_WORD *)a3 = __rev16(v5);
  *((_WORD *)a3 + 1) = bswap32(self->paramID) >> 16;
  __int16 v6 = (_WORD)a3 + 4;
  unsigned __int16 v7 = v5 - 4;
  switch(self->paramType)
  {
    case 0:
      break;
    case 1:
      memcpy(a3 + 4, &self->paramInteger, self->paramRawLen);
      __int16 paramRawLen = self->paramRawLen;
      v6 += paramRawLen;
      v7 -= paramRawLen;
      break;
    case 2:
    case 3:
    case 7:
      a3[4] = self->paramInteger.int8;
      __int16 v6 = (_WORD)a3 + 5;
      unsigned __int16 v7 = v5 - 5;
      break;
    case 4:
    case 8:
      *((_WORD *)a3 + 2) = bswap32(self->paramInteger.u16) >> 16;
      __int16 v6 = (_WORD)a3 + 6;
      unsigned __int16 v7 = v5 - 6;
      break;
    case 5:
    case 9:
      *((_DWORD *)a3 + 1) = bswap32(self->paramInteger.u32);
      __int16 v6 = (_WORD)a3 + 8;
      unsigned __int16 v7 = v5 - 8;
      break;
    case 6:
    case 0xA:
      *(void *)(a3 + 4) = bswap64(self->paramInteger.u64);
      __int16 v6 = (_WORD)a3 + 12;
      unsigned __int16 v7 = v5 - 12;
      break;
    case 0xB:
      unsigned __int16 v9 = (unsigned __int16)[self->pNSParamData length];
      memcpy(a3 + 4, [self->pNSParamData bytes], v9);
      v6 += v9;
      v7 -= v9;
      break;
    case 0xC:
      id v10 = [self->pNSParamData UTF8String];
      unsigned __int16 v11 = (unsigned __int16)[self->pNSParamData lengthOfBytesUsingEncoding:4] + 1;
      memcpy(a3 + 4, v10, v11);
      v6 += v11;
      v7 -= v11;
      break;
    default:
      syslog(6, "[iAP2Param getRawParamLength] Unknown param type:%02X\n", self->paramType);
      break;
  }

  if (v7) {
    syslog(3, "ERROR: Line:%04d: rawLen != 0: %04X\n", 1190, v7);
  }
  return v6 - (_WORD)a3;
}

- (id)description
{
  uint64_t paramType = self->paramType;
  switch((int)paramType)
  {
    case 0:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    <iAP2Param>(%hhx): ID=0x%04X Len=%u Type='None'",  self,  self->paramID,  self->paramLen,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13);
      break;
    case 1:
      uint64_t paramLen = self->paramLen;
      uint64_t paramID = self->paramID;
      if (paramLen > 8) {
        id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    <iAP2Param>(%hhx): ID=0x%04X Len=%u Type='Raw' data=%@",  self,  paramID,  self->paramLen,  self->pNSParamData,  v7,  v8,  v9,  v10,  v11,  v12,  v13);
      }
      else {
        id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    <iAP2Param>(%hhx): ID=0x%04X Len=%u Type='Raw' data=0x%02X 0x%02X 0x%02X 0x%02X 0x%02X 0x%02X 0x%02X 0x%02X",  self,  paramID,  paramLen,  self->paramInteger.u8,  self->paramInteger.u8Raw[1],  self->paramInteger.u8Raw[2],  self->paramInteger.u8Raw[3],  self->paramInteger.u8Raw[4],  self->paramInteger.u8Raw[5],  self->paramInteger.u8Raw[6],  self->paramInteger.u8Raw[7]);
      }
      break;
    case 2:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    <iAP2Param>(%hhx): ID=0x%04X Len=%u Type='Bool' val=%u",  self,  self->paramID,  self->paramLen,  self->paramInteger.u8,  v7,  v8,  v9,  v10,  v11,  v12,  v13);
      break;
    case 3:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    <iAP2Param>(%hhx): ID=0x%04X Len=%u Type='U8' val=%u(0x%x)",  self,  self->paramID,  self->paramLen,  self->paramInteger.u8,  self->paramInteger.u8,  v8,  v9,  v10,  v11,  v12,  v13);
      break;
    case 4:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    <iAP2Param>(%hhx): ID=0x%04X Len=%u Type='U16' val=%u(0x%x)",  self,  self->paramID,  self->paramLen,  self->paramInteger.u16,  self->paramInteger.u16,  v8,  v9,  v10,  v11,  v12,  v13);
      break;
    case 5:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    <iAP2Param>(%hhx): ID=0x%04X Len=%u Type='U32' val=%u(0x%x)",  self,  self->paramID,  self->paramLen,  self->paramInteger.u32,  self->paramInteger.u32,  v8,  v9,  v10,  v11,  v12,  v13);
      break;
    case 6:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    <iAP2Param>(%hhx): ID=0x%04X Len=%u Type='U64' val=%llu(0x%llx)",  self,  self->paramID,  self->paramLen,  self->paramInteger.u64,  self->paramInteger.u64,  v8,  v9,  v10,  v11,  v12,  v13);
      break;
    case 7:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    <iAP2Param>(%hhx): ID=0x%04X Len=%u Type='Int8' val=%d(0x%x)",  self,  self->paramID,  self->paramLen,  self->paramInteger.int8,  self->paramInteger.int8,  v8,  v9,  v10,  v11,  v12,  v13);
      break;
    case 8:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    <iAP2Param>(%hhx): ID=0x%04X Len=%u Type='Int16' val=%d(0x%x)",  self,  self->paramID,  self->paramLen,  self->paramInteger.int16,  self->paramInteger.int16,  v8,  v9,  v10,  v11,  v12,  v13);
      break;
    case 9:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    <iAP2Param>(%hhx): ID=0x%04X Len=%u Type='Int32' val=%d(0x%x)",  self,  self->paramID,  self->paramLen,  self->paramInteger.u32,  self->paramInteger.u32,  v8,  v9,  v10,  v11,  v12,  v13);
      break;
    case 10:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    <iAP2Param>(%hhx): ID=0x%04X Len=%u Type='Int64' val=%lld(0x%llx)",  self,  self->paramID,  self->paramLen,  self->paramInteger.u64,  self->paramInteger.u64,  v8,  v9,  v10,  v11,  v12,  v13);
      break;
    case 11:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    <iAP2Param>(%hhx): ID=0x%04X Len=%u Type='NSData' data=%@",  self,  self->paramID,  self->paramLen,  self->pNSParamData,  v7,  v8,  v9,  v10,  v11,  v12,  v13);
      break;
    case 12:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    <iAP2Param>(%hhx): ID=0x%04X Len=%u Type='NSString' data=%@",  self,  self->paramID,  self->paramLen,  self->pNSParamData,  v7,  v8,  v9,  v10,  v11,  v12,  v13);
      break;
    default:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    <iAP2Param>(%hhx): ID=0x%04X Len=%u Type=ERROR: Unknown Type(0x%u)!",  self,  self->paramID,  self->paramLen,  paramType,  v7,  v8,  v9,  v10,  v11,  v12,  v13);
      break;
  }

  return result;
}

@end