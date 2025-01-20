@interface NSHTTPCookieStorageUtils
+ (__CFString)copyStringAndLowerCase:(uint64_t)a1;
+ (id)getEffectiveTLDPlusOne:(uint64_t)a1;
+ (uint64_t)isURLInMainDocumentDomain:(const __CFURL *)a3 withMainDocumentURL:(int)a4 ignoringTLD:;
+ (uint64_t)looksLikeIPAddress:(uint64_t)a1;
@end

@implementation NSHTTPCookieStorageUtils

+ (id)getEffectiveTLDPlusOne:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  if (v2)
  {
    [v2 componentsSeparatedByString:@"."];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(@".", "stringByAppendingString:", *(void *)(*((void *)&v16 + 1) + 8 * v8), (void)v16);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 addObject:v9];

          ++v8;
        }

        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v6);
    }

    uint64_t v10 = [v4 count];
    v11 = &stru_189C1D1D8;
    while ((int)v10 > 0)
    {
      [v4 objectAtIndexedSubscript:--v10];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 stringByAppendingString:v11];
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v11 = v13;
      if (!isTopLevelDomain(v13, 1))
      {
        v14 = -[__CFString lowercaseString](v13, "lowercaseString");
        v11 = v13;
        goto LABEL_15;
      }
    }

    v14 = 0LL;
LABEL_15:
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

+ (uint64_t)looksLikeIPAddress:(uint64_t)a1
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  CFIndex Length = CFStringGetLength(a2);
  uint64_t result = 0LL;
  if (Length && Length <= 23)
  {
    if (CFStringGetCharacterAtIndex(a2, 0LL) == 46
      && Length == 1
      && (*(_DWORD *)(MEMORY[0x1895F8770] + 244LL) & 0x10000) == 0)
    {
      return 0LL;
    }

    else
    {
      uint64_t result = CFStringGetCString(a2, buffer, 24LL, 0x600u);
      if ((_DWORD)result)
      {
        uint64_t result = inet_pton(2, buffer, v6);
        if ((_DWORD)result != 1) {
          return inet_pton(30, buffer, v6) == 1;
        }
      }
    }
  }

  return result;
}

+ (__CFString)copyStringAndLowerCase:(uint64_t)a1
{
  v3 = CFGetAllocator(a2);
  MutableCopy = CFStringCreateMutableCopy(v3, 0LL, a2);
  System = CFLocaleGetSystem();
  CFStringLowercase(MutableCopy, System);
  return MutableCopy;
}

+ (uint64_t)isURLInMainDocumentDomain:(const __CFURL *)a3 withMainDocumentURL:(int)a4 ignoringTLD:
{
  uint64_t v7 = CFURLCopyHostName(a2);
  uint64_t v8 = CFURLCopyHostName(a3);
  if (!((unint64_t)v7 | (unint64_t)v8))
  {
    uint64_t v7 = (const __CFString *)CFRetain(@".^filecookies^");
    uint64_t v8 = (const __CFString *)CFRetain(@".^filecookies^");
  }

  v9 = v8;
  if (v7 && v8)
  {
    uint64_t v10 = +[NSHTTPCookieStorageUtils copyStringAndLowerCase:]((uint64_t)&OBJC_CLASS___NSHTTPCookieStorageUtils, v7);
    v11 = +[NSHTTPCookieStorageUtils copyStringAndLowerCase:]((uint64_t)&OBJC_CLASS___NSHTTPCookieStorageUtils, v9);
    if (CFStringCompare(v10, v11, 0LL) == kCFCompareEqualTo)
    {
      uint64_t v22 = 1LL;
      if (!v10) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }

    v24 = a3;
    v26 = v7;
    objc_opt_self();
    alloc = CFGetAllocator(v10);
    CFStringFind(v10, @".", 8uLL);
    CFStringFind(v11, @".", 8uLL);
    CFIndex location = CFStringFind(v10, @".", 4uLL).location;
    if (location == -1 || (CFIndex Length = location, location != CFStringGetLength(v10) - 1)) {
      CFIndex Length = CFStringGetLength(v10);
    }
    v25 = v9;
    CFRange v14 = CFStringFind(v11, @".", 4uLL);
    CFRange result = v14;
    if (v14.location == -1 || (CFIndex v15 = v14.location, v14.location != CFStringGetLength(v11) - 1)) {
      CFIndex v15 = CFStringGetLength(v11);
    }
    if (Length < 1)
    {
LABEL_23:
      v9 = v25;
      uint64_t v7 = v26;
    }

    else
    {
      CFIndex v16 = 0LL;
      CFIndex v17 = Length;
      while (1)
      {
        CFIndex v18 = v15 >= v17 ? v17 : v15;
        v29.CFIndex location = v16;
        v29.length = v17;
        __int128 v19 = CFStringCreateWithSubstring(alloc, v10, v29);
        v30.CFIndex location = (v15 - v17) & ~((v15 - v17) >> 63);
        v30.length = v18;
        if (CFStringCompareWithOptions(v11, v19, v30, 1uLL) == kCFCompareEqualTo) {
          break;
        }
        v31.CFIndex location = v16;
        v31.length = v17;
        int v20 = CFStringFindWithOptions(v10, @".", v31, 0LL, &result);
        CFIndex v21 = result.location;
        CFRelease(v19);
        if (v20) {
          CFIndex v16 = v21 + 1;
        }
        else {
          CFIndex v16 = -1LL;
        }
        if (v20)
        {
          CFIndex v17 = Length + ~v21;
          if (v17 > 0) {
            continue;
          }
        }

        goto LABEL_23;
      }

      v9 = v25;
      uint64_t v7 = v26;
      if (v19)
      {
        uint64_t v22 = a4 | !isTopLevelDomain(v19, 1);
        CFRelease(v19);
        if (!v10)
        {
LABEL_31:
          if (v11) {
            CFRelease(v11);
          }
          goto LABEL_33;
        }

@end