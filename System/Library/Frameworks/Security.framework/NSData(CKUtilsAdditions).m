@interface NSData(CKUtilsAdditions)
+ (id)CKDataWithHexString:()CKUtilsAdditions stringIsUppercase:;
+ (uint64_t)CKDataWithHexString:()CKUtilsAdditions;
- (id)CKHexString;
- (id)CKLowercaseHexStringWithoutSpaces;
- (id)CKUppercaseHexStringWithoutSpaces;
@end

@implementation NSData(CKUtilsAdditions)

- (id)CKHexString
{
  id v1 = a1;
  uint64_t v2 = [v1 bytes];
  unint64_t v3 = [v1 length];
  if (v3 <= 0x5555555555555555LL)
  {
    unint64_t v6 = v3;
    v7 = calloc(1uLL, ((9 * v3) >> 2) & 0x1FFFFFFFFFFFFFFFLL);
    v5 = v7;
    if (v6 < 5)
    {
      uint64_t v8 = 0LL;
      v17 = v7;
      if (!v6)
      {
LABEL_26:
        uint64_t v4 = v17 - v7;
        goto LABEL_27;
      }
    }

    else
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = v2;
      v10 = v7;
      do
      {
        for (uint64_t i = 0LL; i != 4; ++i)
        {
          v12 = v10;
          else {
            char v13 = 87;
          }
          _BYTE *v10 = v13 + (*(_BYTE *)(v9 + i) >> 4);
          unsigned int v14 = *(_BYTE *)(v9 + i) & 0xF;
          if (v14 <= 9) {
            char v15 = 48;
          }
          else {
            char v15 = 87;
          }
          char v16 = v15 + v14;
          v10 = v12 + 2;
          v12[1] = v16;
        }

        v17 = v12 + 3;
        _BYTE *v10 = 32;
        v8 += 4LL;
        v6 -= 4LL;
        v9 += 4LL;
        v10 = v12 + 3;
      }

      while (v6 > 4);
      if (!v6) {
        goto LABEL_26;
      }
    }

    v18 = (char *)(v2 + v8);
    do
    {
      else {
        char v19 = 87;
      }
      _BYTE *v17 = v19 + (*v18 >> 4);
      char v20 = *v18++;
      unsigned int v21 = v20 & 0xF;
      if (v21 <= 9) {
        char v22 = 48;
      }
      else {
        char v22 = 87;
      }
      char v23 = v22 + v21;
      v24 = v17 + 2;
      v17[1] = v23;
      v17 += 2;
      --v6;
    }

    while (v6);
    v17 = v24;
    goto LABEL_26;
  }

  uint64_t v4 = 0LL;
  v5 = 0LL;
LABEL_27:
  v25 = (void *)[objc_alloc(NSString) initWithBytesNoCopy:v5 length:v4 encoding:1 freeWhenDone:1];

  return v25;
}

- (id)CKLowercaseHexStringWithoutSpaces
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (void *)[v1 mutableCopy];

  objc_msgSend( v2,  "replaceOccurrencesOfString:withString:options:range:",  @" ",  &stru_1896794C8,  0,  0,  objc_msgSend(v2, "length"));
  return v2;
}

- (id)CKUppercaseHexStringWithoutSpaces
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 uppercaseString];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = (void *)[v2 mutableCopy];

  objc_msgSend( v3,  "replaceOccurrencesOfString:withString:options:range:",  @" ",  &stru_1896794C8,  0,  0,  objc_msgSend(v3, "length"));
  return v3;
}

+ (id)CKDataWithHexString:()CKUtilsAdditions stringIsUppercase:
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x189603FB8]);
  if (a4) {
    v7 = @"0123456789ABCDEF";
  }
  else {
    v7 = @"0123456789abcdef";
  }
  if (a4) {
    char v8 = -65;
  }
  else {
    char v8 = -97;
  }
  [MEMORY[0x189607810] characterSetWithCharactersInString:v7];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 length])
  {
    LODWORD(v10) = 0;
LABEL_9:
    unint64_t v11 = v10;
    if ([v5 length] <= (unint64_t)v10)
    {
      LODWORD(v13) = 0;
      char v16 = 1;
    }

    else
    {
      int v12 = v10 + 1;
      do
      {
        LODWORD(v10) = v12;
        uint64_t v13 = [v5 characterAtIndex:v11];
        char v14 = [v9 characterIsMember:v13];
        unint64_t v11 = v10;
        if ((v14 & 1) != 0) {
          break;
        }
        unint64_t v15 = [v5 length];
        int v12 = v10 + 1;
      }

      while (v15 > v10);
      char v16 = v14 ^ 1;
    }

    unint64_t v17 = [v5 length];
    while (v17 > v11)
    {
      uint64_t v18 = [v5 characterAtIndex:v11];
      if ([v9 characterIsMember:v18])
      {
        if ((v16 & 1) == 0)
        {
          unint64_t v10 = (v10 + 1);
          char v19 = v18 - 48;
          char v20 = (v13 - 48) >= 0xA ? 16 * v13 - 112 : 16 * v13;
          char v22 = v19 + v20;
          [v6 appendBytes:&v22 length:1];
          if ([v5 length] > v10) {
            goto LABEL_9;
          }
        }

        break;
      }

      unint64_t v11 = (v10 + 1);
      unint64_t v17 = [v5 length];
      LODWORD(v10) = v10 + 1;
    }
  }

  return v6;
}

+ (uint64_t)CKDataWithHexString:()CKUtilsAdditions
{
  return [a1 CKDataWithHexString:a3 stringIsUppercase:0];
}

@end