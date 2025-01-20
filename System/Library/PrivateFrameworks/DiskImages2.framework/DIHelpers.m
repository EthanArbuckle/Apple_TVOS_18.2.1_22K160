@interface DIHelpers
+ (BOOL)executeWithPath:(id)a3 arguments:(id)a4 error:(id *)a5;
+ (id)copyDevicePathWithStatfs:(statfs *)a3;
+ (id)stringWithImageFormat:(int64_t)a3;
+ (unint64_t)numBlocksWithSizeStr:(id)a3 blockSize:(unint64_t)a4;
@end

@implementation DIHelpers

+ (id)stringWithImageFormat:(int64_t)a3
{
  else {
    return off_18A1CD530[a3 - 1];
  }
}

+ (unint64_t)numBlocksWithSizeStr:(id)a3 blockSize:(unint64_t)a4
{
  id v5 = a3;
  v17 = 0LL;
  [v5 lowercaseString];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend(v6, "characterAtIndex:", objc_msgSend(v5, "length") - 1);

  if ((int)v7 <= 106)
  {
    if ((_DWORD)v7 == 98)
    {
      unint64_t v8 = 1LL;
      goto LABEL_12;
    }

    if ((_DWORD)v7 == 103)
    {
      unint64_t v8 = 0x40000000LL;
      goto LABEL_12;
    }
  }

  else
  {
    switch((_DWORD)v7)
    {
      case 'k':
        unint64_t v8 = 1024LL;
        goto LABEL_12;
      case 'm':
        unint64_t v8 = 0x100000LL;
        goto LABEL_12;
      case 't':
        unint64_t v8 = 0x10000000000LL;
LABEL_12:
        uint64_t v9 = objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);

        id v5 = (id)v9;
        goto LABEL_13;
    }
  }

  [MEMORY[0x189607810] decimalDigitCharacterSet];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  int v16 = [v15 characterIsMember:v7];

  if (!v16)
  {
    unint64_t v13 = 0LL;
    goto LABEL_16;
  }

  unint64_t v8 = a4;
LABEL_13:
  id v5 = v5;
  v10 = (const char *)[v5 UTF8String];
  double v11 = strtod(v10, &v17);
  v12 = (char *)(v17 - v10);
  unint64_t v13 = 0LL;
LABEL_16:

  return v13;
}

+ (BOOL)executeWithPath:(id)a3 arguments:(id)a4 error:(id *)a5
{
  id v7 = a3;
  unint64_t v8 = (void *)MEMORY[0x189607A38];
  uint64_t v9 = (void *)MEMORY[0x189604030];
  id v10 = a4;
  [v9 fileURLWithPath:v7];
  double v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 launchedTaskWithExecutableURL:v11 arguments:v10 error:a5 terminationHandler:0];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    [v12 waitUntilExit];
    if ([v12 terminationStatus])
    {
      unint64_t v13 = (void *)NSString;
      [v7 lastPathComponent];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 stringWithFormat:@"%@ failed with error code %d", v14, objc_msgSend(v12, "terminationStatus")];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v16 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  154LL,  v15,  a5);
    }

    else
    {
      BOOL v16 = 1;
    }
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

+ (id)copyDevicePathWithStatfs:(statfs *)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v4 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"/dev/%s", v7);
  else {
    id v5 = 0LL;
  }
  id v3 = v5;

  return v3;
}

@end