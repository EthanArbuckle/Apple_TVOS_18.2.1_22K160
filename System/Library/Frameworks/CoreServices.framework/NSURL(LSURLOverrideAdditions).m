@interface NSURL(LSURLOverrideAdditions)
- (BOOL)conformsToOverridePatternWithKey:()LSURLOverrideAdditions;
- (BOOL)isiWorkURL;
- (__CFString)iWorkDocumentName;
- (id)fmfURL;
- (id)fmipURL;
- (id)iCloudEmailPrefsURL;
- (id)iTunesStoreURL;
- (id)iWorkApplicationName;
- (id)keynoteLiveURL;
- (id)keynoteLiveURL_noFragment;
- (uint64_t)iCloudSharingURL;
- (uint64_t)iCloudSharingURL_noFragment;
- (uint64_t)mapsURL;
- (uint64_t)photosURL;
@end

@implementation NSURL(LSURLOverrideAdditions)

- (BOOL)conformsToOverridePatternWithKey:()LSURLOverrideAdditions
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    BOOL v5 = 0LL;
  }

  else
  {
    [a1 absoluteString];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithContentsOfFile:@"/var/mobile/Library/Caches/com.apple.itunesstored/url-resolution.plist"];
      v8 = v7;
      if (v7 && ([v7 objectForKey:v4], (v9 = (os_log_s *)objc_claimAutoreleasedReturnValue()) != 0)
        || (v10 = (LaunchServices::URLOverrides *)[objc_alloc(MEMORY[0x189603F68]) initWithContentsOfFile:@"/System/Library/CoreServices/iTunesStoreURLPatterns.plist"],  (v11 = v10) != 0)
        && (-[LaunchServices::URLOverrides objectForKey:](v10, "objectForKey:", v4),
            v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(),
            v11,
            v9))
      {
        [MEMORY[0x189607A00] regularExpressionWithPattern:v9 options:1 error:0];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v5 = objc_msgSend(v12, "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL
          || v13 != 0;
      }

      else
      {
        LaunchServices::URLOverrides::getLog(v10);
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138477827;
          id v17 = v4;
          _os_log_impl( &dword_183E58000,  v9,  OS_LOG_TYPE_DEFAULT,  "No URL pattern found for key %{private}@",  (uint8_t *)&v16,  0xCu);
        }

        BOOL v5 = 0LL;
      }
    }

    else
    {
      BOOL v5 = 0LL;
    }
  }

  return v5;
}

- (BOOL)isiWorkURL
{
  if (v6 | v7) {
    BOOL v1 = v8 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1 || !LaunchServices::URLOverrides::State::pathHasCaseInsensitivePrefix(&v5, @"/iw"))
  {
    BOOL v3 = 0LL;
  }

  else
  {
    [v5 fragment];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v3 = v2 != 0LL;
  }

  return v3;
}

- (id)iWorkApplicationName
{
  if ([a1 isiWorkURL])
  {
    [a1 fragment];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 componentsSeparatedByString:@"/"];
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (![v3 count])
    {
      unsigned __int8 v6 = 0LL;
LABEL_15:

      return v6;
    }

    [v3 objectAtIndex:0];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v4 isEqualToString:@"pages"])
    {
      id v5 = @"com.apple.Pages";
    }

    else if ([v4 isEqualToString:@"keynote"])
    {
      id v5 = @"com.apple.Keynote";
    }

    else
    {
      id v5 = @"com.apple.Numbers";
    }

    +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v7 applicationIsInstalled:v5];

    if ((v8 & 1) != 0)
    {
      v9 = +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v5);
      uint64_t v10 = [v9 localizedName];
LABEL_14:
      unsigned __int8 v6 = (void *)v10;

      goto LABEL_15;
    }

- (__CFString)iWorkDocumentName
{
  if ([a1 isiWorkURL])
  {
    [a1 fragment];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 componentsSeparatedByString:@"/"];
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)[v3 count] < 3)
    {
      id v5 = 0LL;
    }

    else
    {
      id v4 = (const __CFString *)objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v3, "count") - 1);
      id v5 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes( (CFAllocatorRef)*MEMORY[0x189604DB0],  v4,  &stru_189D7B4C8);
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (uint64_t)mapsURL
{
  return 0LL;
}

- (id)fmfURL
{
  if (v4 | v5 && (_os_feature_enabled_impl() & 1) == 0)
  {
    +[_LSURLOverride fmfURL:](&OBJC_CLASS____LSURLOverride, "fmfURL:", &v3);
    BOOL v1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v1 = 0LL;
  }

  return v1;
}

- (id)fmipURL
{
  if (v4 | v5 && (_os_feature_enabled_impl() & 1) == 0)
  {
    +[_LSURLOverride fmipURL:](&OBJC_CLASS____LSURLOverride, "fmipURL:", &v3);
    BOOL v1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v1 = 0LL;
  }

  return v1;
}

- (id)iTunesStoreURL
{
  if (v4 | v5 && (_os_feature_enabled_impl() & 1) == 0)
  {
    +[_LSURLOverride iTunesStoreURL:](&OBJC_CLASS____LSURLOverride, "iTunesStoreURL:", &v3);
    BOOL v1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v1 = 0LL;
  }

  return v1;
}

- (id)iCloudEmailPrefsURL
{
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    BOOL v1 = 0LL;
  }

  else
  {
    +[_LSURLOverride iCloudEmailPrefsURL:](&OBJC_CLASS____LSURLOverride, "iCloudEmailPrefsURL:", v3);
    BOOL v1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (uint64_t)photosURL
{
  return 0LL;
}

- (id)keynoteLiveURL
{
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    BOOL v1 = 0LL;
  }

  else
  {
    +[_LSURLOverride keynoteLiveURL:](&OBJC_CLASS____LSURLOverride, "keynoteLiveURL:", v3);
    BOOL v1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (id)keynoteLiveURL_noFragment
{
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    BOOL v1 = 0LL;
  }

  else
  {
    +[_LSURLOverride keynoteLiveURL_noFragment:](&OBJC_CLASS____LSURLOverride, "keynoteLiveURL_noFragment:", v3);
    BOOL v1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (uint64_t)iCloudSharingURL
{
  return 0LL;
}

- (uint64_t)iCloudSharingURL_noFragment
{
  return 0LL;
}

@end