@interface MADCacheDeleteManagerError
+ (id)buildError:(int64_t)a3 fromOperation:(id)a4 underlyingError:(id)a5 withDescription:(id)a6;
+ (id)summaryForCode:(int64_t)a3 fromOperation:(id)a4;
@end

@implementation MADCacheDeleteManagerError

+ (id)summaryForCode:(int64_t)a3 fromOperation:(id)a4
{
  else {
    v4 = *(&off_34FBE8 + a3);
  }
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@(%lld)", a4, v4, a3);
}

+ (id)buildError:(int64_t)a3 fromOperation:(id)a4 underlyingError:(id)a5 withDescription:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[MADCacheDeleteManagerError summaryForCode:fromOperation:]( &OBJC_CLASS___MADCacheDeleteManagerError,  "summaryForCode:fromOperation:",  a3,  v11));

  v14 = objc_alloc(&OBJC_CLASS___NSString);
  if (v10) {
    v15 = -[NSString initWithFormat:](v14, "initWithFormat:", @"[%@] %@", v13, v10);
  }
  else {
    v15 = -[NSString initWithFormat:](v14, "initWithFormat:", @"[%@]", v13, v19);
  }
  v16 = v15;
  if (v15) {
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v15, NSLocalizedDescriptionKey);
  }
  if (v9) {
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v9, NSUnderlyingErrorKey);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.MobileAssetError",  a3,  v12));

  return v17;
}

@end