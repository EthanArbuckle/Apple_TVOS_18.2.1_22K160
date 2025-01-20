@interface NSNumber(ZhuGe)
+ (id)BOOLFromData:()ZhuGe needNegate:;
+ (id)integerFromCInt:()ZhuGe size:isSigned:needSwap:;
+ (id)integerFromData:()ZhuGe size:truncate:isSigned:needSwap:;
@end

@implementation NSNumber(ZhuGe)

+ (id)integerFromCInt:()ZhuGe size:isSigned:needSwap:
{
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
    [MEMORY[0x189607968] numberWithUnsignedLong:a4];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 524800,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSNumber+ZhuGe.m",  "+[NSNumber(ZhuGe) integerFromCInt:size:isSigned:needSwap:]",  31LL,  @"Required size is %@, while usually it should be %@ or %@ or %@ or %@",  v14,  v15,  v16,  (uint64_t)v13);
  }

  if (v10 > a4)
  {
    [MEMORY[0x189607968] numberWithUnsignedLong:v10];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithUnsignedLong:a4];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 524800,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSNumber+ZhuGe.m",  "+[NSNumber(ZhuGe) integerFromCInt:size:isSigned:needSwap:]",  36LL,  @"Bits will be truncated since real size is %@, while required size is %@",  v18,  v19,  v20,  (uint64_t)v17);

    v9 &= 0xFFFFFFFFFFFFFFFFLL >> (-8 * a4);
  }

  v21 = &unk_18A31F0A0;
  switch(a4)
  {
    case 0uLL:
      return v21;
    case 1uLL:
      if ((a5 & 1) != 0) {
        [MEMORY[0x189607968] numberWithChar:(char)v9];
      }
      else {
        [MEMORY[0x189607968] numberWithUnsignedChar:v9];
      }
      goto LABEL_27;
    case 2uLL:
      unsigned int v24 = bswap32(v9) >> 16;
      if (!a6) {
        LOWORD(v24) = v9;
      }
      if ((a5 & 1) != 0) {
        [MEMORY[0x189607968] numberWithShort:(__int16)v24];
      }
      else {
        [MEMORY[0x189607968] numberWithUnsignedShort:(unsigned __int16)v24];
      }
      goto LABEL_27;
    case 3uLL:
    case 4uLL:
      unsigned int v22 = bswap32(v9);
      if (a6) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = v9;
      }
      if ((a5 & 1) != 0) {
        [MEMORY[0x189607968] numberWithInt:v23];
      }
      else {
        [MEMORY[0x189607968] numberWithUnsignedInt:v23];
      }
      goto LABEL_27;
    default:
      unint64_t v25 = bswap64(v9);
      if (a6) {
        unint64_t v26 = v25;
      }
      else {
        unint64_t v26 = v9;
      }
      if ((a5 & 1) != 0) {
        [MEMORY[0x189607968] numberWithLongLong:v26];
      }
      else {
        [MEMORY[0x189607968] numberWithUnsignedLongLong:v26];
      }
LABEL_27:
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      return v21;
  }

+ (id)integerFromData:()ZhuGe size:truncate:isSigned:needSwap:
{
  id v12 = a3;
  v13 = v12;
  uint64_t v32 = 0LL;
  if (v12)
  {
    unint64_t v14 = [v12 length];
    unint64_t v15 = v14;
    BOOL v17 = v14 > 8 || v14 > a4;
    if (v17)
    {
      uint64_t v18 = @"LSB";
      if (!a5) {
        uint64_t v18 = @"MSB";
      }
      uint64_t v30 = (uint64_t)v18;
      [MEMORY[0x189607968] numberWithUnsignedLong:v14];
      unsigned int v31 = a7;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607968] numberWithUnsignedLong:a4];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607968] numberWithUnsignedLong:8];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog( 524800,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSNumber+ZhuGe.m",  "+[NSNumber(ZhuGe) integerFromData:size:truncate:isSigned:needSwap:]",  122LL,  @"Data %@ might be truncated(data size %@, required size %@, maximum supported size %@)",  v21,  v22,  v23,  v30);

      a7 = v31;
    }

    uint64_t v24 = 8LL;
    if (a4 < 8) {
      uint64_t v24 = a4;
    }
    if (v17) {
      uint64_t v25 = v24;
    }
    else {
      uint64_t v25 = v15;
    }
    if (a5 == 1) {
      unint64_t v26 = v15 - v25;
    }
    else {
      unint64_t v26 = 0LL;
    }
    [v13 getBytes:&v32 range:v26];
    [a1 integerFromCInt:v32 size:a4 isSigned:a6 needSwap:a7];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v27 = 0LL;
  }

  return v27;
}

+ (id)BOOLFromData:()ZhuGe needNegate:
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    v8 = (_BYTE *)[v7 bytes];
    uint64_t v9 = [v7 length];
    if (*v8) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = memcmp(v8, v8 + 1, v9 - 1) != 0;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  [MEMORY[0x189607968] numberWithBool:v10 ^ a4];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end