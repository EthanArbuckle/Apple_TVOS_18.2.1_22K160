@interface MAStringUtilities
+ (BOOL)convertFromString:(id)a3 usingBase:(int)a4 toI64:(int64_t *)a5;
+ (BOOL)writeToByte:(char *)a3 fromHexByteString:(id)a4;
@end

@implementation MAStringUtilities

+ (BOOL)writeToByte:(char *)a3 fromHexByteString:(id)a4
{
  id v6 = a4;
  if ([v6 length] == (char *)&dword_0 + 2)
  {
    _MobileAssetLog( 0LL,  4,  (uint64_t)"+[MAStringUtilities writeToByte:fromHexByteString:]",  @"Unexpected byte string length",  v7,  v8,  v9,  v10,  v13);
  }

  else
  {
    unint64_t v14 = 0LL;
    if ([(id)objc_opt_class(a1) convertFromString:v6 usingBase:16 toI64:&v14]
      && v14 <= 0xFF)
    {
      *a3 = v14;
      BOOL v11 = 1;
      goto LABEL_6;
    }
  }

  BOOL v11 = 0;
LABEL_6:

  return v11;
}

+ (BOOL)convertFromString:(id)a3 usingBase:(int)a4 toI64:(int64_t *)a5
{
  id v9 = a3;
  uint64_t v10 = objc_autoreleasePoolPush();
  if (!v9)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v21 handleFailureInMethod:a2, a1, @"MAStringUtilities.m", 46, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];
  }

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByTrimmingCharactersInSet:v11]);

  id v13 = v12;
  unint64_t v14 = (const char *)[v13 UTF8String];
  if (v14)
  {
    v15 = v14;
    size_t v16 = strlen(v14);
    *__error() = 0;
    __endptr = 0LL;
    int64_t v17 = strtoll(v15, &__endptr, a4);
    if (*__error()) {
      BOOL v18 = 0;
    }
    else {
      BOOL v18 = __endptr == &v15[v16];
    }
    BOOL v19 = v18;
    if (a5 && v19) {
      *a5 = v17;
    }
  }

  else
  {
    LOBYTE(v19) = 0;
  }

  objc_autoreleasePoolPop(v10);

  return v19;
}

@end