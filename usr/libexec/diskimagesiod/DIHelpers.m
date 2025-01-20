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
    return off_100184AF0[a3 - 1];
  }
}

+ (unint64_t)numBlocksWithSizeStr:(id)a3 blockSize:(unint64_t)a4
{
  id v5 = a3;
  v17 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lowercaseString]);
  id v7 = objc_msgSend(v6, "characterAtIndex:", (char *)objc_msgSend(v5, "length") - 1);

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
        uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringToIndex:", (char *)objc_msgSend(v5, "length") - 1));

        id v5 = (id)v9;
        goto LABEL_13;
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet"));
  unsigned int v16 = [v15 characterIsMember:v7];

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
  if (v12 == [v5 length] && v11 > 0.0) {
    unint64_t v13 = (a4 + vcvtpd_u64_f64(v11 * (double)v8) - 1) / a4;
  }
LABEL_16:

  return v13;
}

+ (BOOL)executeWithPath:(id)a3 arguments:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSTask launchedTaskWithExecutableURL:arguments:error:terminationHandler:]( &OBJC_CLASS___NSTask,  "launchedTaskWithExecutableURL:arguments:error:terminationHandler:",  v9,  v8,  a5,  0LL));

  if (v10)
  {
    [v10 waitUntilExit];
    if ([v10 terminationStatus])
    {
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ failed with error code %d",  v11,  [v10 terminationStatus]));
      BOOL v13 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  154LL,  v12,  a5);
    }

    else
    {
      BOOL v13 = 1;
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (id)copyDevicePathWithStatfs:(statfs *)a3
{
  v4 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"/dev/%s", v7);
  if (-[NSString hasPrefix:](v4, "hasPrefix:", @"/dev/disk")) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }
  v3 = v5;

  return v3;
}

@end