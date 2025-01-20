@interface AKAppleIDCodeGenerator
+ (id)generateLoginCode:(id *)a3;
@end

@implementation AKAppleIDCodeGenerator

+ (id)generateLoginCode:(id *)a3
{
  uint64_t v5 = v4;
  uint64_t v6 = _AKLogSystem(v4);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if ((_DWORD)v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10012B594(v5, v8);
    }

    if (a3)
    {
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError ak_wrappedAnisetteError:]( &OBJC_CLASS___NSError,  "ak_wrappedAnisetteError:",  v5));
      return 0LL;
    }

    v10 = 0LL;
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10012B554(v8);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v11));
  }

  return v10;
}

@end