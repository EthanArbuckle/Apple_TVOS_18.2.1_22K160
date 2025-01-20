@interface NSNumber
+ (id)BOOLFromData:(id)a3 needNegate:(BOOL)a4;
+ (id)integerFromCInt:(unint64_t)a3 size:(unint64_t)a4 isSigned:(BOOL)a5 needSwap:(BOOL)a6;
+ (id)integerFromData:(id)a3 size:(unint64_t)a4 truncate:(int64_t)a5 isSigned:(BOOL)a6 needSwap:(BOOL)a7;
@end

@implementation NSNumber

+ (id)integerFromCInt:(unint64_t)a3 size:(unint64_t)a4 isSigned:(BOOL)a5 needSwap:(BOOL)a6
{
  BOOL v6 = a6;
  unint64_t v9 = a3;
  unint64_t v10 = 0LL;
  if (a3)
  {
    unint64_t v11 = a3;
    do
    {
      ++v10;
      BOOL v12 = v11 >= 0x100;
      v11 >>= 8;
    }

    while (v12);
  }

  if (a4 > 8 || ((1LL << a4) & 0x116) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a4));
    ZhuGeLog( 524800,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSNumber+ZhuGe.m",  "+[NSNumber(ZhuGe) integerFromCInt:size:isSigned:needSwap:]",  31LL,  @"Required size is %@, while usually it should be %@ or %@ or %@ or %@",  v14,  v15,  v16,  (uint64_t)v13);
  }

  if (v10 > a4)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v10));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a4));
    ZhuGeLog( 524800,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSNumber+ZhuGe.m",  "+[NSNumber(ZhuGe) integerFromCInt:size:isSigned:needSwap:]",  36LL,  @"Bits will be truncated since real size is %@, while required size is %@",  v18,  v19,  v20,  (uint64_t)v17);

    v9 &= 0xFFFFFFFFFFFFFFFFLL >> (-8 * a4);
  }

  v21 = &off_1000176F8;
  switch(a4)
  {
    case 0uLL:
      return v21;
    case 1uLL:
      if (a5) {
        v21 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithChar:]( &OBJC_CLASS___NSNumber,  "numberWithChar:",  (char)v9));
      }
      else {
        v21 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v9));
      }
      break;
    case 2uLL:
      unsigned int v24 = bswap32(v9) >> 16;
      if (!v6) {
        LOWORD(v24) = v9;
      }
      if (a5) {
        v21 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  (__int16)v24));
      }
      else {
        v21 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)v24));
      }
      break;
    case 3uLL:
    case 4uLL:
      unsigned int v22 = bswap32(v9);
      if (v6) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = v9;
      }
      if (a5) {
        v21 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v23));
      }
      else {
        v21 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v23));
      }
      break;
    default:
      unint64_t v25 = bswap64(v9);
      if (v6) {
        unint64_t v26 = v25;
      }
      else {
        unint64_t v26 = v9;
      }
      if (a5) {
        v21 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v26));
      }
      else {
        v21 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v26));
      }
      break;
  }

  return v21;
}

+ (id)integerFromData:(id)a3 size:(unint64_t)a4 truncate:(int64_t)a5 isSigned:(BOOL)a6 needSwap:(BOOL)a7
{
  uint64_t v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  v13 = v12;
  uint64_t v32 = 0LL;
  if (v12)
  {
    uint64_t v14 = (char *)[v12 length];
    uint64_t v15 = v14;
    BOOL v17 = (unint64_t)v14 > 8 || (unint64_t)v14 > a4;
    if (v17)
    {
      uint64_t v18 = @"LSB";
      if (!a5) {
        uint64_t v18 = @"MSB";
      }
      uint64_t v30 = (uint64_t)v18;
      unsigned int v31 = v7;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v14));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a4));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", 8LL));
      ZhuGeLog( 524800,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSNumber+ZhuGe.m",  "+[NSNumber(ZhuGe) integerFromData:size:truncate:isSigned:needSwap:]",  122LL,  @"Data %@ might be truncated(data size %@, required size %@, maximum supported size %@)",  v20,  v21,  v22,  v30);

      uint64_t v7 = v31;
    }

    unint64_t v23 = 8LL;
    if (a4 < 8) {
      unint64_t v23 = a4;
    }
    if (v17) {
      unint64_t v24 = v23;
    }
    else {
      unint64_t v24 = (unint64_t)v15;
    }
    if (a5 == 1) {
      unint64_t v25 = &v15[-v24];
    }
    else {
      unint64_t v25 = 0LL;
    }
    [v13 getBytes:&v32 range:v25];
    unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([a1 integerFromCInt:v32 size:a4 isSigned:v8 needSwap:v7]);
  }

  else
  {
    unint64_t v26 = 0LL;
  }

  return v26;
}

+ (id)BOOLFromData:(id)a3 needNegate:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = v5;
    BOOL v8 = [v7 bytes];
    id v9 = [v7 length];
    if (*v8) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = memcmp(v8, v8 + 1, (size_t)v9 - 1) != 0;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10 ^ v4));

  return v11;
}

@end