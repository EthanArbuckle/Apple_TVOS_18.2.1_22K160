@interface NSScanner
+ (NSScanner)allocWithZone:(_NSZone *)a3;
+ (NSScanner)scannerWithString:(NSString *)string;
+ (id)localizedScannerWithString:(NSString *)string;
- (BOOL)_scanDecimal:(unint64_t)a3 into:(int64_t *)a4;
- (BOOL)caseSensitive;
- (BOOL)isAtEnd;
- (BOOL)scanCharactersFromSet:(NSCharacterSet *)set intoString:(NSString *)result;
- (BOOL)scanDecimal:(NSDecimal *)dcm;
- (BOOL)scanDouble:(double *)result;
- (BOOL)scanFloat:(float *)result;
- (BOOL)scanHexDouble:(double *)result;
- (BOOL)scanHexFloat:(float *)result;
- (BOOL)scanHexInt:(unsigned int *)result;
- (BOOL)scanHexLongLong:(unint64_t *)result;
- (BOOL)scanInt:(int *)result;
- (BOOL)scanLongLong:(uint64_t *)result;
- (BOOL)scanString:(NSString *)string intoString:(NSString *)result;
- (BOOL)scanUnsignedLongLong:(unint64_t *)result;
- (BOOL)scanUpToCharactersFromSet:(NSCharacterSet *)set intoString:(NSString *)result;
- (BOOL)scanUpToString:(NSString *)string intoString:(NSString *)result;
- (NSCharacterSet)charactersToBeSkipped;
- (NSScanner)initWithString:(NSString *)string;
- (NSString)string;
- (NSUInteger)scanLocation;
- (id)_invertedSkipSet;
- (id)_remainingString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)locale;
- (void)setCaseSensitive:(BOOL)caseSensitive;
- (void)setCharactersToBeSkipped:(NSCharacterSet *)charactersToBeSkipped;
- (void)setLocale:(id)locale;
- (void)setScanLocation:(NSUInteger)scanLocation;
@end

@implementation NSScanner

- (id)_remainingString
{
  v3 = -[NSScanner string](self, "string");
  NSUInteger v4 = -[NSScanner scanLocation](self, "scanLocation");
  return -[NSString substringWithRange:](v3, "substringWithRange:", v4, -[NSString length](v3, "length") - v4);
}

- (BOOL)_scanDecimal:(unint64_t)a3 into:(int64_t *)a4
{
  NSUInteger v7 = -[NSScanner scanLocation](self, "scanLocation");
  v8 = -[NSScanner string](self, "string");
  unint64_t v9 = -[NSString length](v8, "length");
  if (a3)
  {
    unint64_t v10 = 0LL;
    int64_t v11 = 0LL;
    if (v9 >= v7) {
      unint64_t v12 = v9 - v7;
    }
    else {
      unint64_t v12 = 0LL;
    }
    while (1)
    {
      if (v12 == v10) {
        goto LABEL_9;
      }
      unsigned int v13 = -[NSString characterAtIndex:](v8, "characterAtIndex:", v7 + v10);
      if (v13 - 58 < 0xFFFFFFF6) {
        break;
      }
      int64_t v11 = 10 * v11 + v13 - 48;
      if (a3 == ++v10)
      {
        unint64_t v12 = a3;
LABEL_9:
        if (!v12) {
          return 0;
        }
LABEL_10:
        -[NSScanner setScanLocation:](self, "setScanLocation:", v12 + v7);
        *a4 = v11;
        return 1;
      }
    }

    unint64_t v12 = v10;
    if (v10) {
      goto LABEL_10;
    }
  }

  return 0;
}

- (BOOL)scanDecimal:(NSDecimal *)dcm
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  __int128 v44 = 0uLL;
  int v45 = 0;
  NSUInteger v4 = -[NSScanner scanLocation](self, "scanLocation");
  v5 = -[NSScanner string](self, "string");
  v6 = -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped");
  v41 = self;
  id v7 = -[NSScanner locale](self, "locale");
  v43 = (char *)&v49 + 15;
  __int128 v46 = 0uLL;
  int v47 = 0;
  uint64_t v8 = [v7 objectForKey:*MEMORY[0x189603AB0]];
  if (!v8) {
    uint64_t v8 = [v7 objectForKey:@"NSDecimalSeparator"];
  }
  if (v8) {
    unint64_t v9 = (__CFString *)v8;
  }
  else {
    unint64_t v9 = @".";
  }
  if (-[__CFString length](v9, "length")) {
    uint64_t v10 = -[__CFString characterAtIndex:](v9, "characterAtIndex:", 0LL);
  }
  else {
    uint64_t v10 = 46LL;
  }
  unint64_t v11 = -[NSString length](v5, "length");
  unint64_t v53 = v11;
  NSUInteger v54 = v4;
  v52 = v5;
  if (v11 <= v4)
  {
    unint64_t v50 = 0LL;
    uint64_t v13 = 0xFFFFLL;
  }

  else
  {
    if (v11 - v4 >= 0x20) {
      unint64_t v12 = 32LL;
    }
    else {
      unint64_t v12 = v11 - v4;
    }
    unint64_t v50 = v12;
    objc_msgSend(v5, sel_getUid("getCharacters:range:"), v55, v4, v12);
    uint64_t v13 = v55[0];
  }

  unsigned __int16 v56 = v13;
  unint64_t v51 = 1LL;
  if (v6)
  {
    if (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:", v13))
    {
      do
      {
        unint64_t v14 = v51;
        if (v51 - 1 >= v50) {
          break;
        }
        if (v51 >= v50)
        {
          NSUInteger v16 = v54 + v50;
          unint64_t v17 = v53 - (v54 + v50);
          if (v53 > v54 + v50)
          {
            v54 += v50;
            if (v17 >= 0x20) {
              unint64_t v18 = 32LL;
            }
            else {
              unint64_t v18 = v53 - v16;
            }
            unint64_t v50 = v18;
            objc_msgSend(v52, sel_getUid("getCharacters:range:"), v55, v16, v18);
            unsigned __int16 v56 = v55[0];
            unint64_t v51 = 1LL;
            continue;
          }

          unint64_t v51 = v50 + 1;
          __int16 v15 = -1;
        }

        else
        {
          ++v51;
          __int16 v15 = v55[v14];
        }

        unsigned __int16 v56 = v15;
      }

      while (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:"));
    }

    LODWORD(v13) = v56;
    unint64_t v39 = v51 - 1;
  }

  else
  {
    unint64_t v39 = 0LL;
  }

  NSUInteger v38 = v54;
  __int16 v42 = v13;
  v19 = 0LL;
  size_t v20 = 0LL;
  v21 = (unsigned __int8 *)&__NSNumberSet;
  v22 = (char *)v48;
  v23 = (char *)v48;
  while ((unsigned __int16)v13 <= 0x7Fu && ((v21[(unsigned __int16)v13 >> 3] >> (v13 & 7)) & 1) != 0)
  {
LABEL_38:
    if (v23 >= v43)
    {
      v20 += 128LL;
      if (v19)
      {
        uint64_t v24 = __CFSafelyReallocate();
        if (!v24) {
          return 0;
        }
        v22 = (char *)v24;
        LOBYTE(v13) = v42;
      }

      else
      {
        v22 = (char *)malloc(v20);
        __int128 v25 = v48[1];
        *(_OWORD *)v22 = v48[0];
        *((_OWORD *)v22 + 1) = v25;
        __int128 v26 = v49;
        *((_OWORD *)v22 + 2) = v48[2];
        *((_OWORD *)v22 + 3) = v26;
        v19 = (char *)v48;
      }

      v23 = &v22[v23 - v19];
      v43 = &v22[v20 - 1];
      v19 = v22;
    }

    *v23++ = v13;
    unint64_t v27 = v51;
    if (v51 < v50)
    {
      ++v51;
      LOWORD(v13) = v55[v27];
LABEL_52:
      unsigned __int16 v56 = v13;
      goto LABEL_53;
    }

    uint64_t v13 = v54 + v50;
    unint64_t v28 = v53 - (v54 + v50);
    if (v53 <= v54 + v50)
    {
      unint64_t v51 = v50 + 1;
      LOWORD(v13) = -1;
      goto LABEL_52;
    }

    v54 += v50;
    v29 = v9;
    uint64_t v30 = v10;
    v31 = v21;
    if (v28 >= 0x20) {
      unint64_t v32 = 32LL;
    }
    else {
      unint64_t v32 = v28;
    }
    unint64_t v50 = v32;
    v33 = v52;
    Uid = sel_getUid("getCharacters:range:");
    unint64_t v35 = v32;
    v21 = v31;
    uint64_t v10 = v30;
    unint64_t v9 = v29;
    objc_msgSend(v33, Uid, v55, v13, v35);
    LOWORD(v13) = v55[0];
    unsigned __int16 v56 = v55[0];
    unint64_t v51 = 1LL;
LABEL_53:
    __int16 v42 = v13;
  }

  if (_NSCheckDecimalSeparator((uint64_t *)&v50, &v42, v10, v9))
  {
    LOBYTE(v13) = 46;
    __int16 v42 = 46;
    goto LABEL_38;
  }

  char *v23 = 0;
  _NSCStringToDecimal((uint64_t)v22, &v43, (uint64_t)&v46);
  if (v19) {
    free(v19);
  }
  if (v43 == v22) {
    return 0;
  }
  v36 = &v43[v39 + v38 - (void)v22];
  __int128 v44 = v46;
  int v45 = v47;
  if (dcm)
  {
    *(_OWORD *)dcm = v44;
    *(_DWORD *)&dcm->_mantissa[6] = v45;
  }

  -[NSScanner setScanLocation:](v41, "setScanLocation:", v36);
  return 1;
}

+ (NSScanner)allocWithZone:(_NSZone *)a3
{
  NSUInteger v4 = (objc_class *)a1;
  if ((id)objc_opt_self() == a1) {
    NSUInteger v4 = (objc_class *)objc_opt_self();
  }
  return (NSScanner *)NSAllocateObject(v4, 0LL, a3);
}

- (NSScanner)initWithString:(NSString *)string
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSScanner;
  return -[NSScanner init](&v4, sel_init, string);
}

+ (NSScanner)scannerWithString:(NSString *)string
{
  return (NSScanner *)(id)[objc_allocWithZone((Class)NSConcreteScanner) initWithString:string];
}

+ (id)localizedScannerWithString:(NSString *)string
{
  id v3 = (id)[objc_allocWithZone((Class)NSConcreteScanner) initWithString:string];
  objc_msgSend(v3, "setLocale:", objc_msgSend(MEMORY[0x189603F90], "currentLocale"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)objc_msgSend( objc_allocWithZone((Class)NSConcreteScanner),  "initWithString:",  -[NSScanner string](self, "string"));
  objc_msgSend(v4, "setCharactersToBeSkipped:", -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"));
  objc_msgSend(v4, "setScanLocation:", -[NSScanner scanLocation](self, "scanLocation"));
  objc_msgSend(v4, "setCaseSensitive:", -[NSScanner caseSensitive](self, "caseSensitive"));
  objc_msgSend(v4, "setLocale:", -[NSScanner locale](self, "locale"));
  return v4;
}

- (id)_invertedSkipSet
{
  return -[NSCharacterSet invertedSet](-[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"), "invertedSet");
}

- (BOOL)scanDouble:(double *)result
{
  v7[1] = *MEMORY[0x1895F89C0];
  v7[0] = -[NSScanner scanLocation](self, "scanLocation");
  int v5 = _NSScanDoubleFromString( -[NSScanner string](self, "string"),  -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"),  result,  v7,  -[NSScanner locale](self, "locale"));
  if (v5) {
    -[NSScanner setScanLocation:](self, "setScanLocation:", v7[0]);
  }
  return v5;
}

- (BOOL)scanFloat:(float *)result
{
  v9[1] = *(double *)MEMORY[0x1895F89C0];
  NSUInteger v8 = -[NSScanner scanLocation](self, "scanLocation");
  int v5 = _NSScanDoubleFromString( -[NSScanner string](self, "string"),  -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"),  v9,  &v8,  -[NSScanner locale](self, "locale"));
  if (v5)
  {
    if (result)
    {
      float v6 = v9[0];
      *result = v6;
    }

    -[NSScanner setScanLocation:](self, "setScanLocation:", v8);
  }

  return v5;
}

- (BOOL)scanHexDouble:(double *)result
{
  v7[1] = *MEMORY[0x1895F89C0];
  v7[0] = -[NSScanner scanLocation](self, "scanLocation");
  int v5 = _NSScanHexDoubleFromString( -[NSScanner string](self, "string"),  -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"),  result,  v7,  -[NSScanner locale](self, "locale"));
  if (v5) {
    -[NSScanner setScanLocation:](self, "setScanLocation:", v7[0]);
  }
  return v5;
}

- (BOOL)scanHexFloat:(float *)result
{
  v9[1] = *(double *)MEMORY[0x1895F89C0];
  NSUInteger v8 = -[NSScanner scanLocation](self, "scanLocation");
  int v5 = _NSScanHexDoubleFromString( -[NSScanner string](self, "string"),  -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"),  v9,  &v8,  -[NSScanner locale](self, "locale"));
  if (v5)
  {
    if (result)
    {
      float v6 = v9[0];
      *result = v6;
    }

    -[NSScanner setScanLocation:](self, "setScanLocation:", v8);
  }

  return v5;
}

- (BOOL)scanUnsignedLongLong:(unint64_t *)result
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  NSUInteger v4 = -[NSScanner scanLocation](self, "scanLocation");
  int v5 = -[NSScanner string](self, "string");
  float v6 = -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped");
  unint64_t v7 = -[NSString length](v5, "length");
  unint64_t v43 = v7;
  NSUInteger v44 = v4;
  __int16 v42 = v5;
  if (v7 <= v4)
  {
    unint64_t v40 = 0LL;
    int v9 = 0xFFFF;
  }

  else
  {
    if (v7 - v4 >= 0x20) {
      uint64_t v8 = 32LL;
    }
    else {
      uint64_t v8 = v7 - v4;
    }
    unint64_t v40 = v8;
    objc_msgSend(v5, sel_getUid("getCharacters:range:"), v45, v4, v8);
    int v9 = v45[0];
  }

  LOWORD(c) = v9;
  unint64_t v41 = 1LL;
  if (v6)
  {
    if (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:"))
    {
      do
      {
        unint64_t v10 = v41;
        if (v41 - 1 >= v40) {
          break;
        }
        if (v41 >= v40)
        {
          NSUInteger v12 = v44 + v40;
          if (v43 > v44 + v40)
          {
            if (v43 - (v44 + v40) >= 0x20) {
              uint64_t v13 = 32LL;
            }
            else {
              uint64_t v13 = v43 - (v44 + v40);
            }
            v44 += v40;
            unint64_t v40 = v13;
            objc_msgSend(v42, sel_getUid("getCharacters:range:"), v45, v12, v13);
            LOWORD(c) = v45[0];
            unint64_t v41 = 1LL;
            continue;
          }

          unint64_t v41 = v40 + 1;
          __int16 v11 = -1;
        }

        else
        {
          ++v41;
          __int16 v11 = v45[v10];
        }

        LOWORD(c) = v11;
      }

      while (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:"));
    }

    int v9 = (unsigned __int16)c;
  }

  if (v9 != 43) {
    goto LABEL_44;
  }
  unint64_t v14 = v41;
  if (v41 >= v40)
  {
    NSUInteger v16 = v44 + v40;
    if (v43 > v44 + v40)
    {
      if (v43 - (v44 + v40) >= 0x20) {
        uint64_t v17 = 32LL;
      }
      else {
        uint64_t v17 = v43 - (v44 + v40);
      }
      v44 += v40;
      unint64_t v40 = v17;
      objc_msgSend(v42, sel_getUid("getCharacters:range:"), v45, v16, v17);
      LOWORD(c) = v45[0];
      unint64_t v41 = 1LL;
      if (!v6) {
        goto LABEL_44;
      }
      goto LABEL_32;
    }

    unint64_t v41 = v40 + 1;
    __int16 v15 = -1;
  }

  else
  {
    ++v41;
    __int16 v15 = v45[v14];
  }

  LOWORD(c) = v15;
  if (!v6) {
    goto LABEL_44;
  }
LABEL_32:
  if (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:"))
  {
    do
    {
      unint64_t v18 = v41;
      if (v41 - 1 >= v40) {
        break;
      }
      if (v41 >= v40)
      {
        NSUInteger v20 = v44 + v40;
        if (v43 > v44 + v40)
        {
          if (v43 - (v44 + v40) >= 0x20) {
            uint64_t v21 = 32LL;
          }
          else {
            uint64_t v21 = v43 - (v44 + v40);
          }
          v44 += v40;
          unint64_t v40 = v21;
          objc_msgSend(v42, sel_getUid("getCharacters:range:"), v45, v20, v21);
          LOWORD(c) = v45[0];
          unint64_t v41 = 1LL;
          continue;
        }

        unint64_t v41 = v40 + 1;
        __int16 v19 = -1;
      }

      else
      {
        ++v41;
        __int16 v19 = v45[v18];
      }

      LOWORD(c) = v19;
    }

    while (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:"));
  }

- (BOOL)scanLongLong:(uint64_t *)result
{
  v7[1] = *MEMORY[0x1895F89C0];
  v7[0] = -[NSScanner scanLocation](self, "scanLocation");
  int v5 = _NSScanLongLongFromString( -[NSScanner string](self, "string"),  -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"),  result,  v7);
  if (v5) {
    -[NSScanner setScanLocation:](self, "setScanLocation:", v7[0]);
  }
  return v5;
}

- (BOOL)scanInt:(int *)result
{
  v7[1] = *MEMORY[0x1895F89C0];
  v7[0] = -[NSScanner scanLocation](self, "scanLocation");
  int v5 = _NSScanIntFromString( -[NSScanner string](self, "string"),  -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"),  result,  v7);
  if (v5) {
    -[NSScanner setScanLocation:](self, "setScanLocation:", v7[0]);
  }
  return v5;
}

- (BOOL)scanHexLongLong:(unint64_t *)result
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  NSUInteger v4 = -[NSScanner string](self, "string");
  NSUInteger v5 = -[NSScanner scanLocation](self, "scanLocation");
  unint64_t v6 = -[NSString length](v4, "length");
  unint64_t v41 = v6;
  NSUInteger v42 = v5;
  unint64_t v40 = v4;
  if (v6 <= v5)
  {
    unint64_t v38 = 0LL;
    __int16 v8 = -1;
  }

  else
  {
    if (v6 - v5 >= 0x20) {
      uint64_t v7 = 32LL;
    }
    else {
      uint64_t v7 = v6 - v5;
    }
    unint64_t v38 = v7;
    objc_msgSend(v4, sel_getUid("getCharacters:range:"), v43, v5, v7);
    __int16 v8 = v43[0];
  }

  unsigned __int16 v44 = v8;
  unint64_t v39 = 1LL;
  int v9 = -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped");
  if (v9)
  {
    unint64_t v10 = v9;
    if (-[NSCharacterSet characterIsMember:](v9, "characterIsMember:", v44))
    {
      do
      {
        unint64_t v11 = v39;
        if (v39 - 1 >= v38) {
          break;
        }
        if (v39 >= v38)
        {
          NSUInteger v13 = v42 + v38;
          if (v41 > v42 + v38)
          {
            if (v41 - (v42 + v38) >= 0x20) {
              uint64_t v14 = 32LL;
            }
            else {
              uint64_t v14 = v41 - (v42 + v38);
            }
            v42 += v38;
            unint64_t v38 = v14;
            objc_msgSend(v40, sel_getUid("getCharacters:range:"), v43, v13, v14);
            unsigned __int16 v44 = v43[0];
            unint64_t v39 = 1LL;
            continue;
          }

          unint64_t v39 = v38 + 1;
          __int16 v12 = -1;
        }

        else
        {
          ++v39;
          __int16 v12 = v43[v11];
        }

        unsigned __int16 v44 = v12;
      }

      while (-[NSCharacterSet characterIsMember:](v10, "characterIsMember:"));
    }
  }

  int v15 = v44;
  if (v44 != 48)
  {
    if (v44 - 48 > 9)
    {
      if (v44 - 65 > 5)
      {
        goto LABEL_36;
      }

- (BOOL)scanHexInt:(unsigned int *)result
{
  v7[1] = *MEMORY[0x1895F89C0];
  if (result)
  {
    v7[0] = 0LL;
    BOOL v4 = -[NSScanner scanHexLongLong:](self, "scanHexLongLong:", v7);
    if (v4)
    {
      unsigned int v5 = v7[0];
      if (v7[0] >= 0xFFFFFFFFuLL) {
        unsigned int v5 = -1;
      }
      *result = v5;
      goto LABEL_7;
    }
  }

  else
  {
    BOOL v4 = -[NSScanner scanHexLongLong:](self, "scanHexLongLong:");
    if (v4) {
LABEL_7:
    }
      LOBYTE(v4) = 1;
  }

  return v4;
}

- (BOOL)scanCharactersFromSet:(NSCharacterSet *)set intoString:(NSString *)result
{
  uint64_t v7 = -[NSScanner string](self, "string");
  NSUInteger v8 = -[NSScanner scanLocation](self, "scanLocation");
  uint64_t v9 = -[NSString length](v7, "length");
  id v10 = -[NSScanner _invertedSkipSet](self, "_invertedSkipSet");
  uint64_t v11 = -[NSScanner caseSensitive](self, "caseSensitive") ^ 1;
  if (v10)
  {
    uint64_t v12 = -[NSString rangeOfCharacterFromSet:options:range:]( v7,  "rangeOfCharacterFromSet:options:range:",  v10,  0LL,  v8,  v9 - v8);
    if (v13) {
      NSUInteger v8 = v12;
    }
    else {
      NSUInteger v8 = v9;
    }
  }

  uint64_t v14 = -[NSString rangeOfCharacterFromSet:options:range:]( v7,  "rangeOfCharacterFromSet:options:range:",  -[NSCharacterSet invertedSet](set, "invertedSet"),  v11,  v8,  v9 - v8);
  if (v15) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v9;
  }
  NSUInteger v17 = v16 - v8;
  if (v16 != v8)
  {
    if (result) {
      *result = -[NSString substringWithRange:](v7, "substringWithRange:", v8, v17);
    }
    -[NSScanner setScanLocation:](self, "setScanLocation:", v16, v17);
  }

  return v16 != v8;
}

- (BOOL)scanUpToCharactersFromSet:(NSCharacterSet *)set intoString:(NSString *)result
{
  uint64_t v7 = -[NSScanner string](self, "string");
  NSUInteger v8 = -[NSScanner scanLocation](self, "scanLocation");
  uint64_t v9 = -[NSString length](v7, "length");
  id v10 = -[NSScanner _invertedSkipSet](self, "_invertedSkipSet");
  uint64_t v11 = -[NSScanner caseSensitive](self, "caseSensitive") ^ 1;
  if (v10)
  {
    uint64_t v12 = -[NSString rangeOfCharacterFromSet:options:range:]( v7,  "rangeOfCharacterFromSet:options:range:",  v10,  0LL,  v8,  v9 - v8);
    if (v13) {
      NSUInteger v8 = v12;
    }
    else {
      NSUInteger v8 = v9;
    }
  }

  uint64_t v14 = -[NSString rangeOfCharacterFromSet:options:range:]( v7,  "rangeOfCharacterFromSet:options:range:",  set,  v11,  v8,  v9 - v8);
  if (v15) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v9;
  }
  NSUInteger v17 = v16 - v8;
  if (v16 != v8)
  {
    if (result) {
      *result = -[NSString substringWithRange:](v7, "substringWithRange:", v8, v17);
    }
    -[NSScanner setScanLocation:](self, "setScanLocation:", v16, v17);
  }

  return v16 != v8;
}

- (BOOL)scanString:(NSString *)string intoString:(NSString *)result
{
  uint64_t v7 = -[NSScanner string](self, "string");
  NSUInteger v8 = -[NSScanner scanLocation](self, "scanLocation");
  uint64_t v9 = -[NSString length](v7, "length");
  id v10 = -[NSScanner _invertedSkipSet](self, "_invertedSkipSet");
  uint64_t v11 = -[NSScanner caseSensitive](self, "caseSensitive") ^ 1 | 8LL;
  if (v10)
  {
    uint64_t v12 = -[NSString rangeOfCharacterFromSet:options:range:]( v7,  "rangeOfCharacterFromSet:options:range:",  v10,  0LL,  v8,  v9 - v8);
    if (v13) {
      NSUInteger v8 = v12;
    }
    else {
      NSUInteger v8 = v9;
    }
  }

  uint64_t v14 = -[NSString rangeOfString:options:range:](v7, "rangeOfString:options:range:", string, v11, v8, v9 - v8);
  uint64_t v16 = v15;
  if (v15)
  {
    uint64_t v17 = v14 + v15;
    if (result) {
      *result = -[NSString substringWithRange:](v7, "substringWithRange:", v8, v17 - v8);
    }
    -[NSScanner setScanLocation:](self, "setScanLocation:", v17);
  }

  return v16 != 0;
}

- (BOOL)scanUpToString:(NSString *)string intoString:(NSString *)result
{
  uint64_t v7 = -[NSScanner string](self, "string");
  NSUInteger v8 = -[NSScanner scanLocation](self, "scanLocation");
  uint64_t v9 = -[NSString length](v7, "length");
  id v10 = -[NSScanner _invertedSkipSet](self, "_invertedSkipSet");
  uint64_t v11 = -[NSScanner caseSensitive](self, "caseSensitive") ^ 1;
  if (v10)
  {
    uint64_t v12 = -[NSString rangeOfCharacterFromSet:options:range:]( v7,  "rangeOfCharacterFromSet:options:range:",  v10,  0LL,  v8,  v9 - v8);
    if (v13) {
      NSUInteger v8 = v12;
    }
    else {
      NSUInteger v8 = v9;
    }
  }

  uint64_t v14 = -[NSString rangeOfString:options:range:](v7, "rangeOfString:options:range:", string, v11, v8, v9 - v8);
  if (v15) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v9;
  }
  NSUInteger v17 = v16 - v8;
  if (v16 != v8)
  {
    if (result) {
      *result = -[NSString substringWithRange:](v7, "substringWithRange:", v8, v17);
    }
    -[NSScanner setScanLocation:](self, "setScanLocation:", v16, v17);
  }

  return v16 != v8;
}

- (BOOL)isAtEnd
{
  id v3 = -[NSScanner string](self, "string");
  NSUInteger v4 = -[NSScanner scanLocation](self, "scanLocation");
  uint64_t v5 = -[NSString length](v3, "length");
  id v6 = -[NSScanner _invertedSkipSet](self, "_invertedSkipSet");
  if (v6)
  {
    uint64_t v7 = -[NSString rangeOfCharacterFromSet:options:range:]( v3,  "rangeOfCharacterFromSet:options:range:",  v6,  0LL,  v4,  v5 - v4);
    if (v8) {
      NSUInteger v4 = v7;
    }
    else {
      NSUInteger v4 = v5;
    }
  }

  return v4 == v5;
}

- (NSCharacterSet)charactersToBeSkipped
{
  return +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet");
}

- (BOOL)caseSensitive
{
  return 0;
}

- (id)locale
{
  return 0LL;
}

- (NSString)string
{
  NSUInteger v4 = NSClassFromString((NSString *)@"NSScanner");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setScanLocation:(NSUInteger)scanLocation
{
  uint64_t v5 = NSClassFromString((NSString *)@"NSScanner");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSUInteger)scanLocation
{
  NSUInteger v4 = NSClassFromString((NSString *)@"NSScanner");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setCharactersToBeSkipped:(NSCharacterSet *)charactersToBeSkipped
{
  uint64_t v5 = NSClassFromString((NSString *)@"NSScanner");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setCaseSensitive:(BOOL)caseSensitive
{
  uint64_t v5 = NSClassFromString((NSString *)@"NSScanner");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setLocale:(id)locale
{
  uint64_t v5 = NSClassFromString((NSString *)@"NSScanner");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

@end