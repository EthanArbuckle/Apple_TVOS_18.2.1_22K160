@interface NSURL(NSURLExtrasInternal)
+ (uint64_t)_URLWithData:()NSURLExtrasInternal relativeToURL:;
+ (uint64_t)_URLWithDataAsString:()NSURLExtrasInternal relativeToURL:;
- (const)_URLByEscapingSpacesAndControlChars;
- (const)_hostString;
- (const)_web_URLByRemovingLastPathComponent_nowarn;
- (const)_web_URLByRemovingUserAndQueryAndFragment_nowarn;
- (id)_web_URLByRemovingUserAndPath_nowarn;
@end

@implementation NSURL(NSURLExtrasInternal)

- (const)_web_URLByRemovingLastPathComponent_nowarn
{
  v1 = a1;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v2 = buffer;
  if (CFURLGetBytes(a1, buffer, 2048LL) == -1)
  {
    CFIndex v3 = CFURLGetBytes(v1, 0LL, 0LL);
    v2 = (UInt8 *)malloc(v3);
    CFURLGetBytes(v1, v2, v3);
  }

  CFRange v4 = CFURLGetByteRangeForComponent(v1, kCFURLComponentParameterString, 0LL);
  CFRange v5 = CFURLGetByteRangeForComponent(v1, kCFURLComponentPath, 0LL);
  CFIndex length = v4.location + v4.length - v5.location;
  if (v4.location == -1) {
    CFIndex length = v5.length;
  }
  if (v5.location == -1) {
    CFIndex v7 = v4.length;
  }
  else {
    CFIndex v7 = length;
  }
  if (v5.location == -1) {
    CFIndex location = v4.location;
  }
  else {
    CFIndex location = v5.location;
  }
  if (location == -1 || !v7)
  {
    if (v2 != buffer) {
      free(v2);
    }
    return 0LL;
  }

  else
  {
    v9 = &v2[location];
    CFIndex v10 = location + v7;
    do
    {
      CFIndex v11 = v10;
      v12 = &v2[v10];
      if (v12 <= v9) {
        break;
      }
      int v13 = *(v12 - 1);
      CFIndex v10 = v11 - 1;
    }

    while (v13 == 47);
    do
    {
      CFIndex v15 = v11;
      v16 = &v2[v11];
      if (v16 <= v9) {
        break;
      }
      int v14 = *(v16 - 1);
      CFIndex v11 = v15 - 1;
    }

    while (v14 != 47);
    CFStringEncoding v17 = _CFURLGetEncoding();
    CFURLRef v18 = CFURLCreateWithBytes(0LL, v2, v15, v17, 0LL);
    if (v2 != buffer) {
      free(v2);
    }
    if (v18) {
      return v18;
    }
  }

  return v1;
}

- (id)_web_URLByRemovingUserAndPath_nowarn
{
  CFStringRef cf = CFURLCopyScheme(a1);
  CFStringRef v5 = CFURLCopyHostName(a1);
  CFURLGetPortNumber(a1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", &stru_189CA6A28, 0);
  id v2 = (id)_CFURLCreateFromComponents();
  if (cf) {
    CFRelease(cf);
  }
  if (v5) {
    CFRelease(v5);
  }

  return v2;
}

- (const)_web_URLByRemovingUserAndQueryAndFragment_nowarn
{
  v1 = a1;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  CFRange v2 = CFURLGetByteRangeForComponent(a1, kCFURLComponentUserInfo, 0LL);
  CFIndex location = CFURLGetByteRangeForComponent(v1, kCFURLComponentQuery, 0LL).location;
  CFIndex v4 = CFURLGetByteRangeForComponent(v1, kCFURLComponentFragment, 0LL).location;
  CFIndex v5 = v4;
  if (v2.location != -1 || location != -1 || v4 != -1)
  {
    v6 = buffer;
    CFIndex v7 = CFURLGetBytes(v1, buffer, 2048LL);
    if (v7 == -1)
    {
      CFIndex v8 = CFURLGetBytes(v1, 0LL, 0LL);
      v6 = (UInt8 *)malloc(v8);
      CFURLGetBytes(v1, v6, v8);
    }

    else
    {
      CFIndex v8 = v7;
    }

    CFIndex v9 = v5 - 1;
    if (v5 == -1) {
      CFIndex v9 = v8;
    }
    if (location == -1) {
      CFIndex v10 = v9;
    }
    else {
      CFIndex v10 = location - 1;
    }
    if (v2.location != -1)
    {
      memmove(&v6[v2.location], &v6[v2.location + 1 + v2.length], v10 + ~(v2.location + v2.length));
      v10 += ~v2.length;
    }

    CFStringEncoding v11 = _CFURLGetEncoding();
    CFURLRef v12 = CFURLCreateWithBytes(0LL, v6, v10, v11, 0LL);
    if (v6 != buffer) {
      free(v6);
    }
    if (v12) {
      return v12;
    }
  }

  return v1;
}

- (const)_URLByEscapingSpacesAndControlChars
{
  v1 = a1;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v2 = CFURLGetBytes(a1, 0LL, 0LL);
  uint64_t v3 = v2;
  if (v2 < 2049)
  {
    CFIndex v4 = buffer;
    CFURLGetBytes(v1, buffer, v2);
    if (v3 < 1) {
      return v1;
    }
  }

  else
  {
    CFIndex v4 = (UInt8 *)malloc(3 * v2);
    CFURLGetBytes(v1, v4, v3);
  }

  uint64_t v5 = 0LL;
  v6 = &v4[v3];
  while (v4[v5] - 127 >= 0xFFFFFFA2)
  {
    if (&v4[++v5] >= v6) {
      goto LABEL_12;
    }
  }

  CFIndex v7 = &v4[v5];
  if (v3 >= 683 && v4 == buffer)
  {
    CFIndex v8 = (char *)malloc(3 * v3);
    memmove(v8, buffer, v3);
    CFIndex v7 = (unsigned __int8 *)&v8[v4 - buffer + v5];
    v6 = (UInt8 *)&v8[v3];
    CFIndex v4 = (UInt8 *)v8;
  }

  int64_t v9 = v7 - v4;
  unint64_t v10 = escapeChars(v7, v6 - v7);
  v1 = CFURLCreateAbsoluteURLWithBytes(0LL, v4, v9 + v10, 0x600u, 0LL, 1u);
  CFStringEncoding v11 = v1;
LABEL_12:
  if (buffer != v4) {
    free(v4);
  }
  return v1;
}

+ (uint64_t)_URLWithDataAsString:()NSURLExtrasInternal relativeToURL:
{
  if (a3) {
    return objc_msgSend( a1,  "_URLWithData:relativeToURL:",  objc_msgSend((id)objc_msgSend(a3, "_web_stringByTrimmingWhitespace"), "dataUsingEncoding:", 5),  a4);
  }
  else {
    return 0LL;
  }
}

+ (uint64_t)_URLWithData:()NSURLExtrasInternal relativeToURL:
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v6 = [a3 length];
  if (v6 >= 1)
  {
    CFIndex v7 = v6;
    CFIndex v8 = (const UInt8 *)[a3 bytes];
    int64_t v9 = v8;
    if (a4 && *v8 == 59) {
      a4 = (void *)objc_msgSend(a4, "_web_URLByRemovingLastPathComponent_nowarn");
    }
    CFURLRef v10 = CFURLCreateAbsoluteURLWithBytes(0LL, v9, v7, 0x8000100u, (CFURLRef)a4, 1u);
    if (!v10) {
      CFURLRef v10 = CFURLCreateAbsoluteURLWithBytes(0LL, v9, v7, 0x201u, (CFURLRef)a4, 1u);
    }
    CFStringEncoding v11 = v10;
    return (uint64_t)v10;
  }

  return [MEMORY[0x189604030] URLWithString:&stru_189CA6A28];
}

- (const)_hostString
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  CFRange v2 = CFURLGetByteRangeForComponent(a1, kCFURLComponentHost, 0LL);
  if (v2.location == -1) {
    return &stru_189CA6A28;
  }
  CFIndex location = v2.location;
  CFIndex length = v2.length;
  CFIndex v5 = 2048LL;
  MEMORY[0x1895F8858](v2.location);
  uint64_t v6 = v11;
  if (CFURLGetBytes(a1, v11, 2048LL) == -1)
  {
    CFIndex v5 = CFURLGetBytes(a1, 0LL, 0LL);
    uint64_t v6 = (UInt8 *)malloc(v5);
    CFURLGetBytes(a1, v6, v5);
    if (!v2.length) {
      goto LABEL_10;
    }
  }

  else if (!v2.length)
  {
    goto LABEL_10;
  }

  if (v2.length == 9)
  {
    if (objc_msgSend((id)-[__CFURL scheme](a1, "scheme"), "caseInsensitiveCompare:", @"file")
      && !strncasecmp_l("localhost", (const char *)&v6[v2.location], 9uLL, 0LL))
    {
LABEL_10:
      if (v6 != v11) {
        free(v6);
      }
      return &stru_189CA6A28;
    }

    goto LABEL_14;
  }

  if (v2.length >= 1)
  {
LABEL_14:
    CFIndex v8 = v2.location;
    while (v6[v8] - 127 >= 0xFFFFFFA2)
    {
      if (&v6[++v8] >= &v6[v2.location + v2.length]) {
        goto LABEL_17;
      }
    }

    int64_t v9 = v6;
    if (v5 < 3 * v2.length) {
      int64_t v9 = (UInt8 *)malloc(3 * v2.length);
    }
    memmove(v9, &v6[v2.location], v2.length);
    if (v6 != v11 && v6 != v9) {
      free(v6);
    }
    CFIndex location = 0LL;
    CFIndex length = escapeChars(&v9[v8], v2.length - v8) + v8;
    goto LABEL_24;
  }

@end