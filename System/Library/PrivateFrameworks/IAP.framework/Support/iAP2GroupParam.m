@interface iAP2GroupParam
+ (id)allocGroupParamID:(unsigned __int16)a3;
- (iAP2GroupParam)init;
- (iAP2GroupParam)initWithGroupIDLen:(unsigned __int16)a3 :(unsigned __int16)a4;
- (id)allocAndAddGroupWithID:(unsigned __int16)a3;
- (id)description;
- (id)getParamArray;
- (int)allocAndAddParamID:(unsigned __int16)a3;
- (int)allocAndAddParamID:(unsigned __int16)a3 withBoolData:(BOOL)a4;
- (int)allocAndAddParamID:(unsigned __int16)a3 withNSData:(id)a4;
- (int)allocAndAddParamID:(unsigned __int16)a3 withNSString:(id)a4;
- (int)allocAndAddParamID:(unsigned __int16)a3 withRawData:(char *)a4 andRawLen:(unsigned __int16)a5;
- (int)allocAndAddParamID:(unsigned __int16)a3 withU16Data:(unsigned __int16)a4;
- (int)allocAndAddParamID:(unsigned __int16)a3 withU32Data:(unsigned int)a4;
- (int)allocAndAddParamID:(unsigned __int16)a3 withU64Data:(unint64_t)a4;
- (int)allocAndAddParamID:(unsigned __int16)a3 withU8Data:(unsigned __int8)a4;
- (int)parseGroupParams:(const char *)a3 :(unsigned __int16)a4 :(unsigned __int16)a5 :(unsigned __int16 *)a6;
- (unsigned)generateRawGroupParamBuffer:(char *)a3;
- (unsigned)getGroupID;
- (unsigned)getGroupLen;
- (unsigned)getRawGroupParamLength;
- (void)addParamArray:(id)a3;
- (void)dealloc;
- (void)setGroupID:(unsigned __int16)a3;
- (void)setParamArray:(id)a3;
@end

@implementation iAP2GroupParam

+ (id)allocGroupParamID:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___iAP2GroupParam);
  -[iAP2GroupParam setGroupID:](v4, "setGroupID:", v3);
  return v4;
}

- (int)allocAndAddParamID:(unsigned __int16)a3
{
  id v4 = +[iAP2Param createParamWithID:](&OBJC_CLASS___iAP2Param, "createParamWithID:", a3);
  if (!v4) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self, "getParamArray"), "addObject:", v4);
  return 0;
}

- (int)allocAndAddParamID:(unsigned __int16)a3 withRawData:(char *)a4 andRawLen:(unsigned __int16)a5
{
  id v6 = +[iAP2Param createParamWithIDAndDataRaw:::]( &OBJC_CLASS___iAP2Param,  "createParamWithIDAndDataRaw:::",  a3,  a4,  a5);
  if (!v6) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self, "getParamArray"), "addObject:", v6);
  return 0;
}

- (int)allocAndAddParamID:(unsigned __int16)a3 withBoolData:(BOOL)a4
{
  id v5 = +[iAP2Param createParamWithIDAndDataBool::](&OBJC_CLASS___iAP2Param, "createParamWithIDAndDataBool::", a3, a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)allocAndAddParamID:(unsigned __int16)a3 withU8Data:(unsigned __int8)a4
{
  id v5 = +[iAP2Param createParamWithIDAndDataU8::](&OBJC_CLASS___iAP2Param, "createParamWithIDAndDataU8::", a3, a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)allocAndAddParamID:(unsigned __int16)a3 withU16Data:(unsigned __int16)a4
{
  id v5 = +[iAP2Param createParamWithIDAndDataU16::](&OBJC_CLASS___iAP2Param, "createParamWithIDAndDataU16::", a3, a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)allocAndAddParamID:(unsigned __int16)a3 withU32Data:(unsigned int)a4
{
  id v5 = +[iAP2Param createParamWithIDAndDataU32::]( &OBJC_CLASS___iAP2Param,  "createParamWithIDAndDataU32::",  a3,  *(void *)&a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)allocAndAddParamID:(unsigned __int16)a3 withU64Data:(unint64_t)a4
{
  id v5 = +[iAP2Param createParamWithIDAndDataU64::](&OBJC_CLASS___iAP2Param, "createParamWithIDAndDataU64::", a3, a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)allocAndAddParamID:(unsigned __int16)a3 withNSData:(id)a4
{
  id v5 = +[iAP2Param createParamWithIDAndNSData::](&OBJC_CLASS___iAP2Param, "createParamWithIDAndNSData::", a3, a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)allocAndAddParamID:(unsigned __int16)a3 withNSString:(id)a4
{
  id v5 = +[iAP2Param createParamWithIDAndNSString::](&OBJC_CLASS___iAP2Param, "createParamWithIDAndNSString::", a3, a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self, "getParamArray"), "addObject:", v5);
  return 0;
}

- (id)allocAndAddGroupWithID:(unsigned __int16)a3
{
  id v4 = +[iAP2GroupParam allocGroupParamID:](&OBJC_CLASS___iAP2GroupParam, "allocGroupParamID:", a3);
  if (v4) {
    -[NSMutableArray addObject:](self->pParamArray, "addObject:", v4);
  }
  return v4;
}

- (iAP2GroupParam)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___iAP2GroupParam;
  v2 = -[iAP2GroupParam init](&v6, "init");
  uint64_t v3 = v2;
  if (v2)
  {
    *(_DWORD *)&v2->groupID = 0;
    v2->groupLenRemain = 0;
    v2->groupParseState = 0;
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v3->pParamArray = v4;
    if (!v4)
    {

      return 0LL;
    }
  }

  return v3;
}

- (iAP2GroupParam)initWithGroupIDLen:(unsigned __int16)a3 :(unsigned __int16)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___iAP2GroupParam;
  objc_super v6 = -[iAP2GroupParam init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    v6->groupID = a3;
    v6->unsigned int groupLen = a4;
    v6->groupLenRemain = a4;
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7->pParamArray = v8;
    if (v8)
    {
      unsigned int groupLen = v7->groupLen;
      if (groupLen < 4)
      {
        syslog(3, "ERROR Line:%04d: Invalid group length:%04X !\n", 1643, groupLen);
      }

      else
      {
        if (v7->groupLenRemain >= 4u)
        {
          v10 = objc_alloc_init(&OBJC_CLASS___iAP2Param);
          if (v10)
          {
            v11 = v10;
            -[NSMutableArray addObject:](v7->pParamArray, "addObject:", v10);

            int v12 = 4;
          }

          else
          {
            syslog(3, "ERROR: Line:%04d: Object alloc fail !\n", 1627);
            int v12 = 226;
          }

          goto LABEL_11;
        }

        if (!v7->groupLenRemain)
        {
          int v12 = 6;
          goto LABEL_11;
        }
      }

      int v12 = 225;
LABEL_11:
      v7->groupParseState = v12;
      return v7;
    }

    return 0LL;
  }

  return v7;
}

- (void)dealloc
{
  self->pParamArray = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___iAP2GroupParam;
  -[iAP2GroupParam dealloc](&v3, "dealloc");
}

- (unsigned)getGroupID
{
  return self->groupID;
}

- (void)setGroupID:(unsigned __int16)a3
{
  self->groupID = a3;
}

- (unsigned)getGroupLen
{
  return self->groupLen;
}

- (id)getParamArray
{
  return self->pParamArray;
}

- (void)setParamArray:(id)a3
{
  id v5 = a3;

  self->pParamArray = (NSMutableArray *)a3;
}

- (void)addParamArray:(id)a3
{
}

- (int)parseGroupParams:(const char *)a3 :(unsigned __int16)a4 :(unsigned __int16)a5 :(unsigned __int16 *)a6
{
  if (!a4)
  {
    LOWORD(v11) = 0;
    int result = 36;
    goto LABEL_45;
  }

  int v8 = a5;
  int v11 = a4;
  while (2)
  {
    int v12 = *(unsigned __int8 *)a3;
    __int16 v13 = v11 - 1;
    int v14 = v8 - 1;
    switch(self->groupParseState)
    {
      case 0:
        self->unsigned int groupLen = (_WORD)v12 << 8;
        int v15 = 1;
        goto LABEL_25;
      case 1:
        unsigned int v16 = self->groupLen | v12;
        self->unsigned int groupLen = v16;
        if (v16 < 4)
        {
          syslog(3, "ERROR Line:%04d: Invalid param length:%04X !\n", 1831, v16);
          self->unsigned int groupLenRemain = self->groupLen - 2;
          int v15 = 5;
LABEL_25:
          self->groupParseState = v15;
LABEL_26:
          int result = 36;
          int v8 = v14;
          ++a3;
          --v11;
LABEL_27:
          if (result != 36 || !(_WORD)v11) {
            goto LABEL_45;
          }
          continue;
        }

        if (v16 - 2 <= (unsigned __int16)v14)
        {
          self->unsigned int groupLenRemain = v16 - 4;
          int v15 = 2;
          goto LABEL_25;
        }

        syslog(3, "ERROR Line:%04d: Invalid param length:%04X, max:%04X !\n");
LABEL_43:
        int result = 40;
        int v32 = 225;
LABEL_44:
        self->groupParseState = v32;
        LOWORD(v11) = v13;
LABEL_45:
        *a6 = a4 - v11;
        return result;
      case 2:
        self->groupID = (_WORD)v12 << 8;
        int v15 = 3;
        goto LABEL_25;
      case 3:
        int v17 = self->groupID | v12;
        self->groupID = v17;
        unsigned int groupLenRemain = self->groupLenRemain;
        if (!self->groupLenRemain)
        {
          int result = 0;
          int v32 = 6;
          goto LABEL_44;
        }

        if (groupLenRemain < 4)
        {
          syslog(3, "groupID = %d, groupLen=%d, groupLenRemain=%d\n", v17, self->groupLen, groupLenRemain);
          syslog(3, "ERROR: Line:%04d: Invalid parameter size:%04X !\n");
          goto LABEL_43;
        }

        v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        self->pParamArray = v19;
        if (!v19)
        {
          int v31 = 1878;
          goto LABEL_41;
        }

        v20 = objc_alloc_init(&OBJC_CLASS___iAP2Param);
        if (!v20)
        {
          int v31 = 1871;
LABEL_41:
          syslog(3, "ERROR: Line:%04d: Object alloc fail !\n", v31);
          int result = 12;
          int v32 = 226;
          goto LABEL_44;
        }

        v21 = v20;
        -[NSMutableArray addObject:](self->pParamArray, "addObject:", v20);

        int v15 = 4;
        goto LABEL_25;
      case 4:
        unsigned __int16 v33 = 0;
        int result = objc_msgSend( -[NSMutableArray lastObject](self->pParamArray, "lastObject"),  "parseParamBuffer::::",  a3,  (unsigned __int16)v11,  (unsigned __int16)v8,  &v33);
        uint64_t v23 = v33;
        int v24 = self->groupLenRemain;
        unsigned __int16 v25 = v24 - v33;
        self->unsigned int groupLenRemain = v24 - v33;
        if (!result)
        {
          if (v24 == (_DWORD)v23)
          {
            int result = 0;
            self->groupParseState = 6;
          }

          else if (v25 < 4u)
          {
            syslog(3, "ERROR Line:%04d: Invalid param length:%04X !\n", 1942, v25);
            self->groupParseState = 225;
            int result = 40;
          }

          else
          {
            v29 = objc_alloc_init(&OBJC_CLASS___iAP2Param);
            if (v29)
            {
              v30 = v29;
              -[NSMutableArray addObject:](self->pParamArray, "addObject:", v29);

              int result = 36;
            }

            else
            {
              syslog(3, "ERROR: Line:%04d: Object alloc fail !\n", 1934);
              self->groupParseState = 226;
              int result = 12;
            }
          }
        }

        a3 += v23;
        v11 -= v23;
        v8 -= v23;
        goto LABEL_27;
      case 5:
        unsigned int v26 = self->groupLenRemain;
        else {
          uint64_t v27 = self->groupLenRemain;
        }
        BOOL v28 = v26 > (unsigned __int16)v11;
        v11 -= v27;
        self->unsigned int groupLenRemain = v26 - v27;
        if (!v28)
        {
          int result = 0;
          int v32 = 6;
          __int16 v13 = v11;
          goto LABEL_44;
        }

        v8 -= v27;
        a3 += v27;
        int result = 36;
        goto LABEL_27;
      default:
        syslog(3, "ERROR Line:%04d: Unknown param parser state !\n", 1982);
        goto LABEL_26;
    }
  }

- (unsigned)getRawGroupParamLength
{
  pParamArray = self->pParamArray;
  if (!pParamArray) {
    return 4;
  }
  id v4 = (char *)-[NSMutableArray count](pParamArray, "count");
  if (!v4) {
    return 4;
  }
  id v5 = v4;
  objc_super v6 = 0LL;
  unsigned int v7 = 4;
  do
  {
    id v8 = -[NSMutableArray objectAtIndex:](self->pParamArray, "objectAtIndex:", v6);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___iAP2Param);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      unsigned int v10 = [v8 getRawParamLength];
LABEL_8:
      v7 += v10;
      goto LABEL_10;
    }

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___iAP2GroupParam);
    if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
    {
      unsigned int v10 = [v8 getRawGroupParamLength];
      goto LABEL_8;
    }

    syslog(3, "ERROR Line:%04d: Unknown parameter object type !\n", 2033);
LABEL_10:
    ++v6;
  }

  while (v5 != v6);
  if (v7 <= 0xFFF9) {
    return v7;
  }
  else {
    return 0;
  }
}

- (unsigned)generateRawGroupParamBuffer:(char *)a3
{
  *(_WORD *)a3 = bswap32(self->groupLen) >> 16;
  *((_WORD *)a3 + 1) = bswap32(self->groupID) >> 16;
  pParamArray = self->pParamArray;
  if (!pParamArray) {
    return 4;
  }
  objc_super v6 = (char *)-[NSMutableArray count](pParamArray, "count");
  if (!v6) {
    return 4;
  }
  unsigned int v7 = v6;
  id v8 = 0LL;
  uint64_t v9 = a3 + 4;
  unsigned __int16 v10 = 4;
  do
  {
    id v11 = -[NSMutableArray objectAtIndex:](self->pParamArray, "objectAtIndex:", v8);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___iAP2Param);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      unsigned int v13 = [v11 generateRawParamBuffer:v9];
    }

    else
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___iAP2GroupParam);
      if ((objc_opt_isKindOfClass(v11, v14) & 1) != 0)
      {
        unsigned int v13 = [v11 generateRawGroupParamBuffer:v9];
        *(_WORD *)uint64_t v9 = __rev16([v11 getRawGroupParamLength]);
      }

      else
      {
        syslog(3, "ERROR Line:%04d: Unknown parameter object type !\n", 2093);
        unsigned int v13 = 0;
      }
    }

    v9 += v13;
    v10 += v13;
    ++v8;
  }

  while (v7 != v8);
  if (v10 <= 0xFFF9u) {
    return v10;
  }
  else {
    return 0;
  }
}

- (id)description
{
  objc_super v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<iAP2GroupParam>(%hhx): ID=0x%04X Len=%u",  self,  self->groupID,  self->groupLen);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  pParamArray = self->pParamArray;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( pParamArray,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(pParamArray);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v8);
        if (v9) {
          -[NSMutableString appendFormat:](v3, "appendFormat:", @"\n    %@", [v9 description]);
        }
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( pParamArray,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  return v3;
}

@end