@interface TLSMessageClass
- (BOOL)encodeBool:(BOOL)a3 buffer:(id)a4;
- (BOOL)encodeByte:(unsigned __int8)a3 buffer:(id)a4;
- (BOOL)encodeByteArray:(id)a3 minLength:(unint64_t)a4 maxLength:(unint64_t)a5 buffer:(id)a6;
- (BOOL)encodeExtensions:(id)a3 buffer:(id)a4;
- (BOOL)encodeHashValue:(id)a3 buffer:(id)a4;
- (BOOL)encodeUint64:(unint64_t)a3 buffer:(id)a4;
- (BOOL)encodeVRFOutput:(id)a3 buffer:(id)a4;
- (const)parseBool:(const char *)a3 end:(const char *)a4 result:(BOOL *)a5;
- (const)parseByte:(const char *)a3 end:(const char *)a4 result:(char *)a5;
- (const)parseByteArray:(const char *)a3 end:(const char *)a4 minLength:(unint64_t)a5 maxLength:(unint64_t)a6 result:(id *)a7;
- (const)parseExtensions:(const char *)a3 end:(const char *)a4 result:(id *)a5;
- (const)parseHashValue:(const char *)a3 end:(const char *)a4 result:(id *)a5;
- (const)parseUint64:(const char *)a3 end:(const char *)a4 result:(unint64_t *)a5;
- (const)parseVRFOutput:(const char *)a3 end:(const char *)a4 result:(id *)a5;
@end

@implementation TLSMessageClass

- (const)parseBool:(const char *)a3 end:(const char *)a4 result:(BOOL *)a5
{
  result = 0LL;
  if (a3 && a4 > a3)
  {
    int v6 = *(unsigned __int8 *)a3;
    if (v6 == 255 || v6 == 0)
    {
      if (a5) {
        *a5 = v6 == 255;
      }
      return a3 + 1;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (const)parseByte:(const char *)a3 end:(const char *)a4 result:(char *)a5
{
  result = 0LL;
  if (a3 && a4 > a3)
  {
    if (a5) {
      *a5 = *a3;
    }
    return a3 + 1;
  }

  return result;
}

- (const)parseUint64:(const char *)a3 end:(const char *)a4 result:(unint64_t *)a5
{
  result = 0LL;
  if (a4 >= a3 && a3 && a4 && (unint64_t)(a4 - a3) >= 8)
  {
    uint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    do
      unint64_t v7 = a3[v6++] | (v7 << 8);
    while (v6 != 8);
    if (a5) {
      *a5 = v7;
    }
    return a3 + 8;
  }

  return result;
}

- (const)parseByteArray:(const char *)a3 end:(const char *)a4 minLength:(unint64_t)a5 maxLength:(unint64_t)a6 result:(id *)a7
{
  unint64_t v7 = 0LL;
  if (a3 && a4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    v14 = v13;
    uint64_t v15 = 0LL;
    if (a6)
    {
      do
      {
        ++v15;
        BOOL v16 = a6 > 0xFF;
        a6 >>= 8;
      }

      while (v16);
      unint64_t v7 = 0LL;
      if (a4 >= a3 && a4 - a3 > (unint64_t)(v15 - 1))
      {
        uint64_t v17 = 0LL;
        a6 = 0LL;
        do
          a6 = a3[v17++] | (a6 << 8);
        while (v15 != v17);
LABEL_11:
        if (!a5 || a6)
        {
          unint64_t v18 = (unint64_t)&a3[v15];
          if (a6 | a5)
          {
            unint64_t v7 = 0LL;
            if (v18 <= (unint64_t)a4 && (unint64_t)&a4[-v18] >= a6)
            {
              [v13 appendBytes:v18 length:a6];
              if (a7) {
                *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](&OBJC_CLASS___NSData, "dataWithData:", v14));
              }
              unint64_t v7 = (const char *)(v18 + a6);
            }
          }

          else
          {
            if (a7) {
              *a7 = 0LL;
            }
            unint64_t v7 = (const char *)v18;
          }
        }

        else
        {
          unint64_t v7 = 0LL;
        }
      }
    }

    else
    {
      unint64_t v7 = 0LL;
      if (a4 >= a3) {
        goto LABEL_11;
      }
    }
  }

  return v7;
}

- (const)parseVRFOutput:(const char *)a3 end:(const char *)a4 result:(id *)a5
{
  return -[TLSMessageClass parseByteArray:end:minLength:maxLength:result:]( self,  "parseByteArray:end:minLength:maxLength:result:",  a3,  a4,  1LL,  255LL,  a5);
}

- (const)parseHashValue:(const char *)a3 end:(const char *)a4 result:(id *)a5
{
  return -[TLSMessageClass parseByteArray:end:minLength:maxLength:result:]( self,  "parseByteArray:end:minLength:maxLength:result:",  a3,  a4,  1LL,  255LL,  a5);
}

- (const)parseExtensions:(const char *)a3 end:(const char *)a4 result:(id *)a5
{
  id v19 = 0LL;
  uint64_t v6 = -[TLSMessageClass parseByteArray:end:minLength:maxLength:result:]( self,  "parseByteArray:end:minLength:maxLength:result:",  a3,  a4,  0LL,  0xFFFFLL,  &v19);
  id v7 = v19;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v17 = v6;
    if ([v7 length])
    {
      while (1)
      {
        id v18 = 0LL;
        v9 = (void *)objc_claimAutoreleasedReturnValue( +[TLSExtension parseFromData:error:]( &OBJC_CLASS___TLSExtension,  "parseFromData:error:",  v7,  &v18,  v17));
        id v10 = v18;
        if (!v9) {
          break;
        }
        [v8 addObject:v9];
        id v11 = v7;
        id v12 = [v11 bytes];
        v13 = (char *)[v9 parsedLength];
        v14 = [v11 length];
        uint64_t v15 = [v9 parsedLength];
        if (v14 < v15) {
          break;
        }
        id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v13[(void)v12],  v14 - v15));

        if (![v7 length]) {
          goto LABEL_6;
        }
      }

      uint64_t v6 = 0LL;
    }

    else
    {
LABEL_6:
      if (a5 && [v8 count]) {
        *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v8));
      }
      uint64_t v6 = v17;
    }
  }

  return v6;
}

- (BOOL)encodeBool:(BOOL)a3 buffer:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6 && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSMutableData, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    char v12 = -1;
    char v11 = 0;
    if (v4) {
      v8 = &v12;
    }
    else {
      v8 = &v11;
    }
    BOOL v9 = 1;
    [v6 appendBytes:v8 length:1];
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)encodeByte:(unsigned __int8)a3 buffer:(id)a4
{
  unsigned __int8 v9 = a3;
  id v5 = a4;
  if (v5 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSMutableData, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    BOOL v7 = 1;
    [v5 appendBytes:&v9 length:1];
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)encodeUint64:(unint64_t)a3 buffer:(id)a4
{
  id v6 = a4;
  if (v6 && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSMutableData, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    for (uint64_t i = 56LL; i != -8; i -= 8LL)
    {
      char v11 = a3 >> i;
      BOOL v9 = 1;
      [v6 appendBytes:&v11 length:1];
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)encodeByteArray:(id)a3 minLength:(unint64_t)a4 maxLength:(unint64_t)a5 buffer:(id)a6
{
  id v9 = a3;
  id v11 = a6;
  if (v11
    && (uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSMutableData, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    && (unint64_t)[v9 length] >= a4)
  {
    if (a5)
    {
      uint64_t v15 = -8LL;
      do
      {
        v15 += 8LL;
        BOOL v16 = a5 > 0xFF;
        a5 >>= 8;
      }

      while (v16);
      uint64_t v17 = v15 - 8;
      do
      {
        char v18 = 0;
        char v18 = (unint64_t)[v9 length] >> v15;
        [v11 appendBytes:&v18 length:1];
        v17 -= 8LL;
        LOBYTE(v15) = v15 - 8;
      }

      while (v17 != -16);
    }

    [v11 appendData:v9];
    BOOL v13 = 1;
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)encodeVRFOutput:(id)a3 buffer:(id)a4
{
  return -[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:]( self,  "encodeByteArray:minLength:maxLength:buffer:",  a3,  1LL,  255LL,  a4);
}

- (BOOL)encodeHashValue:(id)a3 buffer:(id)a4
{
  return -[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:]( self,  "encodeByteArray:minLength:maxLength:buffer:",  a3,  1LL,  255LL,  a4);
}

- (BOOL)encodeExtensions:(id)a3 buffer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)i), "data", (void)v18));
          if (!v14)
          {

            BOOL v16 = 0;
            goto LABEL_14;
          }

          uint64_t v15 = (void *)v14;
          [v8 appendData:v14];
        }

        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }

  BOOL v16 = -[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:]( self,  "encodeByteArray:minLength:maxLength:buffer:",  v8,  0LL,  0xFFFFLL,  v7,  (void)v18);
LABEL_14:

  return v16;
}

@end