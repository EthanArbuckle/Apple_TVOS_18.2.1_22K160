@interface NSURL(NSURLExtras)
+ (id)_web_URLWithComponents:()NSURLExtras;
+ (uint64_t)_web_URLWithString:()NSURLExtras relativeToURL:;
- (double)_web_URLComponents;
- (uint64_t)_web_isJavaScriptURL;
- (uint64_t)_web_scriptIfJavaScriptURL;
- (uint64_t)_web_suggestedFilenameWithMIMEType:()NSURLExtras;
@end

@implementation NSURL(NSURLExtras)

+ (uint64_t)_web_URLWithString:()NSURLExtras relativeToURL:
{
  return objc_msgSend(MEMORY[0x189604030], "_URLWithDataAsString:relativeToURL:");
}

+ (id)_web_URLWithComponents:()NSURLExtras
{
  if (!*(void *)a3
    && !*(void *)(a3 + 8)
    && !*(void *)(a3 + 16)
    && !*(void *)(a3 + 24)
    && *(void *)(a3 + 32) == -1LL
    && !*(void *)(a3 + 40)
    && !*(void *)(a3 + 48)
    && !*(void *)(a3 + 56))
  {
    return 0LL;
  }

  if ([*(id *)(a3 + 40) length])
  {
    int v4 = [*(id *)(a3 + 40) characterAtIndex:0];
    id result = 0LL;
    if (v4 != 47) {
      return result;
    }
    if ([*(id *)(a3 + 40) length] != 1) {
      [*(id *)(a3 + 40) componentsSeparatedByString:@"/"];
    }
  }

  else
  {
    [MEMORY[0x189603F18] arrayWithObject:&stru_189CA6A28];
  }

  return (id)_CFURLCreateFromComponents();
}

- (double)_web_URLComponents
{
  *(void *)&double v1 = MEMORY[0x1895F8858](a1).n128_u64[0];
  uint64_t v3 = v2;
  uint64_t v48 = *MEMORY[0x1895F89C0];
  uint64_t v5 = objc_msgSend(v4, "absoluteURL", v1);
  if (!v5) {
    goto LABEL_17;
  }
  v6 = (void *)v5;
  if (!_CFURLCopyComponents())
  {
    v13 = (void *)[v6 scheme];
    if (([v13 isEqualToString:@"http"] & 1) != 0
      || ([v13 isEqualToString:@"https"] & 1) != 0
      || ([v13 isEqualToString:@"file"] & 1) != 0
      || [v13 isEqualToString:@"ftp"])
    {
      if ((v14 = (void *)[v6 absoluteString],
            uint64_t v15 = [v13 length],
            uint64_t v16 = [v14 length],
            v16 > v15)
        && [v14 characterAtIndex:v15] != 47
        || v16 >= v15 + 2 && (++v15, [v14 characterAtIndex:v15] != 47))
      {
        v18 = (void *)objc_msgSend( MEMORY[0x189604030],  "_web_URLWithString:relativeToURL:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@://%@",  v13,  objc_msgSend((id)objc_msgSend(v6, "absoluteString"), "substringFromIndex:", v15)),  0);
        if (v18)
        {
          objc_msgSend(v18, "_web_URLComponents");
        }

        else
        {
          double result = 0.0;
          *(_OWORD *)(v3 + 32) = 0u;
          *(_OWORD *)(v3 + 48) = 0u;
          *(_OWORD *)uint64_t v3 = 0u;
          *(_OWORD *)(v3 + 16) = 0u;
        }

        return result;
      }
    }

- (uint64_t)_web_scriptIfJavaScriptURL
{
  double v1 = (void *)[a1 absoluteString];
  if (objc_msgSend(v1, "_web_hasCaseInsensitivePrefix:", @"javascript:")) {
    return objc_msgSend( (id)objc_msgSend(v1, "substringFromIndex:", 11),  "_web_stringByReplacingValidPercentEscapes_nowarn");
  }
  else {
    return 0LL;
  }
}

- (uint64_t)_web_suggestedFilenameWithMIMEType:()NSURLExtras
{
  uint64_t v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "path"), "lastPathComponent");
  v6 = (void *)objc_msgSend(v5, "_web_filenameByFixingIllegalCharacters");
  if ([v6 length] && !objc_msgSend(v5, "isEqualToString:", @"/"))
  {
    id v7 = (void *)[v6 pathExtension];
    if (!a3) {
      return (uint64_t)v6;
    }
  }

  else
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "_hostString"), "_web_filenameByFixingIllegalCharacters");
    if (![v6 length]) {
      v6 = (void *)NSURLLocalizedString("unknown");
    }
    id v7 = 0LL;
    if (!a3) {
      return (uint64_t)v6;
    }
  }

  if ((([a3 isEqualToString:@"application/tar"] & 1) != 0
     || [a3 isEqualToString:@"application/x-tar"])
    && ([v6 rangeOfString:@".tar" options:1] != 0x7FFFFFFFFFFFFFFFLL
     || [v6 rangeOfString:@".tgz" options:13] != 0x7FFFFFFFFFFFFFFFLL))
  {
    return (uint64_t)v6;
  }

  if ([a3 isEqualToString:@"application/octet-stream"]) {
    return (uint64_t)v6;
  }
  if ([a3 isEqualToString:@"text/plain"]) {
    return (uint64_t)v6;
  }
  id v9 = +[NSURLFileTypeMappings sharedMappings](&OBJC_CLASS___NSURLFileTypeMappings, "sharedMappings");
  unint64_t v10 = (void *)[v9 extensionsForMIMEType:a3];
  if ([v7 length])
  {
    if (!v10 || ([v10 containsObject:v7] & 1) != 0) {
      return (uint64_t)v6;
    }
  }

  uint64_t v11 = (void *)[v9 preferredExtensionForMIMEType:a3];
  if (![v11 length]) {
    return (uint64_t)v6;
  }
  return [v6 stringByAppendingPathExtension:v11];
}

- (uint64_t)_web_isJavaScriptURL
{
  return objc_msgSend((id)objc_msgSend(a1, "absoluteString"), "_web_isJavaScriptURL");
}

@end