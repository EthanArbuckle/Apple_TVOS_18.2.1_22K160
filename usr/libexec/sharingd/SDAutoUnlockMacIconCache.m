@interface SDAutoUnlockMacIconCache
- (id)_userDefaultsKeyForHash:(id)a3;
- (id)iconImageDataForHash:(id)a3;
- (void)cacheIconImageData:(id)a3 hash:(id)a4 appName:(id)a5;
@end

@implementation SDAutoUnlockMacIconCache

- (id)iconImageDataForHash:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockMacIconCache _userDefaultsKeyForHash:](self, "_userDefaultsKeyForHash:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);
  if (v7)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      int v19 = 0;
      CFTypeID TypeID = CFDataGetTypeID();
      uint64_t TypedValue = CFDictionaryGetTypedValue(v7, @"AutoUnlockImageData", TypeID, &v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
      int v12 = v19;
      if (v19)
      {
        if (dword_1006439C8 <= 90)
        {
          if (dword_1006439C8 == -1)
          {
            int v12 = v19;
          }

          LogPrintF( &dword_1006439C8,  "-[SDAutoUnlockMacIconCache iconImageDataForHash:]",  90LL,  "### Error getting image data: %x",  v12);
        }

- (void)cacheIconImageData:(id)a3 hash:(id)a4 appName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockMacIconCache _userDefaultsKeyForHash:](self, "_userDefaultsKeyForHash:", v9));
  v14[0] = @"AutoUnlockImageData";
  v14[1] = @"AutoUnlockAppName";
  v15[0] = v8;
  v15[1] = v10;
  int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
  CFTypeID v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v13 setObject:v12 forKey:v11];
  [v13 synchronize];
  if (dword_1006439C8 <= 90 && (dword_1006439C8 != -1 || _LogCategory_Initialize(&dword_1006439C8, 90LL))) {
    LogPrintF( &dword_1006439C8,  "-[SDAutoUnlockMacIconCache cacheIconImageData:hash:appName:]",  90,  "Cached image: %ld bytes, hash: %@, app: %@",  [v8 length],  v9,  v10);
  }
}

- (id)_userDefaultsKeyForHash:(id)a3
{
  uint64_t v3 = SFHexStringForData(a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"AUIconCacheItem",  v4));

  return v5;
}

@end