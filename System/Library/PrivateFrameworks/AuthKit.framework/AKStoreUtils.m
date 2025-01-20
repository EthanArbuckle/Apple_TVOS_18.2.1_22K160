@interface AKStoreUtils
+ (id)hash:(id)a3;
@end

@implementation AKStoreUtils

+ (id)hash:(id)a3
{
  id v3 = a3;
  v4 = (const char *)[v3 UTF8String];
  if (v4)
  {
    v5 = v4;
    CC_LONG v6 = strlen(v4);
    CC_SHA256(v5, v6, md);
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    for (uint64_t i = 0LL; i != 32; ++i)
      -[NSMutableString appendFormat:](v7, "appendFormat:", @"%02x", md[i]);
    id v9 = -[NSMutableString copy](v7, "copy");

    return v9;
  }

  else
  {
    uint64_t v11 = _AKLogSystem(0LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100139AD8((uint64_t)v3, v12);
    }

    return v3;
  }

@end