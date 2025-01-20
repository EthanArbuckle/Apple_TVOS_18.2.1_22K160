@interface NSData(NSURLExtras)
- (__CFString)_web_guessedMIMEType;
- (const)_web_guessedMIMETypeForXML;
- (uint64_t)_web_guessedMIMETypeForExtension:()NSURLExtras;
- (void)_replaceCString:()NSURLExtras withCString:;
- (void)_web_parseRFC822HeaderFields;
@end

@implementation NSData(NSURLExtras)

- (const)_web_guessedMIMETypeForXML
{
  uint64_t v2 = [a1 length];
  uint64_t v3 = [a1 bytes];
  uint64_t v4 = 1024LL;
  if (v2 < 1024) {
    uint64_t v4 = v2;
  }
  if (v4 >= 7)
  {
    v5 = (char *)v3;
    char v6 = 0;
    int64_t v7 = v4 - 6;
    v8 = @"application/rss+xml";
    while (1)
    {
      v9 = (const char *)memchr(v5, 60, v7);
      if (!v9) {
        return 0LL;
      }
      v10 = v9;
      if ((v6 & 1) != 0) {
        break;
      }
      if (!strncasecmp_l(v9, "<rdf", 4uLL, 0LL)) {
        goto LABEL_15;
      }
      if (!strncasecmp_l(v10, "<rss", 4uLL, 0LL)) {
        return v8;
      }
      if (!strncasecmp_l(v10, "<feed", 5uLL, 0LL)) {
        return @"application/atom+xml";
      }
      if (strncasecmp_l(v10, "<?", 2uLL, 0LL) && strncasecmp_l(v10, "<!", 2uLL, 0LL)) {
        return 0LL;
      }
      char v6 = 0;
LABEL_16:
      v11 = &v5[v7];
      v5 = (char *)(v10 + 1);
      int64_t v7 = v11 - (v10 + 1);
      if (v7 <= 0) {
        return 0LL;
      }
    }

    if (!strncasecmp_l(v9, "<channel", 8uLL, 0LL)) {
      return v8;
    }
LABEL_15:
    char v6 = 1;
    goto LABEL_16;
  }

  return 0LL;
}

- (__CFString)_web_guessedMIMEType
{
  uint64_t v2 = (__CFString *)objc_msgSend(a1, "_web_guessedMIMETypeForXML");
  if (-[__CFString length](v2, "length")) {
    return v2;
  }
  uint64_t v4 = [a1 length];
  uint64_t v5 = [a1 bytes];
  char v6 = (const char *)v5;
  if (v4 >= 1024) {
    uint64_t v7 = 1024LL;
  }
  else {
    uint64_t v7 = v4;
  }
  if (v7 >= 7)
  {
    uint64_t v2 = @"text/html";
    int64_t v8 = v7 - 6;
    v9 = (char *)v5;
    do
    {
      v10 = (const char *)memchr(v9, 60, v8);
      if (!v10) {
        break;
      }
      v11 = v10;
      if (!strncasecmp_l(v10, "<html>", 6uLL, 0LL)
        || !strncasecmp_l(v11, "<a ", 3uLL, 0LL)
        || !strncasecmp_l(v11, "<script", 7uLL, 0LL)
        || !strncasecmp_l(v11, "<title>", 7uLL, 0LL))
      {
        return v2;
      }

      v12 = &v9[v8];
      v9 = (char *)(v11 + 1);
      int64_t v8 = v12 - (v11 + 1);
    }

    while (v8 > 0);
  }

  int64_t v13 = v7 - 8;
  if (v13 >= 1)
  {
    v14 = v6;
    uint64_t v2 = @"text/html";
    do
    {
      unint64_t v15 = (unint64_t)memchr(v14, 116, v13);
      v16 = (const char *)memchr(v14, 84, v13);
      else {
        v17 = (const char *)v15;
      }
      if (!v16) {
        v17 = (const char *)v15;
      }
      if (v15) {
        v18 = v17;
      }
      else {
        v18 = v16;
      }
      if (!strncasecmp_l(v18, "text/html", 9uLL, 0LL)) {
        return v2;
      }
      v19 = &v14[v13];
      v14 = v18 + 1;
      int64_t v13 = v19 - (v18 + 1);
    }

    while (v13 > 0);
  }

  if (v4 >= 11)
  {
    if (!strncmp(v6, "BEGIN:VCARD", 0xBuLL)) {
      return @"text/vcard";
    }
    goto LABEL_33;
  }

  if (v4 >= 1)
  {
LABEL_33:
    uint64_t v20 = 0LL;
    uint64_t v2 = @"text/plain";
    while (1)
    {
      if ((v6[v20] - 127) <= 0xA0u)
      {
        unsigned int v21 = v6[v20];
        BOOL v22 = v21 > 0xD;
        int v23 = (1 << v21) & 0x2600;
        if (v22 || v23 == 0) {
          break;
        }
      }

      if (v4 == ++v20) {
        return v2;
      }
    }

    goto LABEL_43;
  }

  uint64_t v20 = 0LL;
LABEL_43:
  if (v20 == v4) {
    return @"text/plain";
  }
  if (v4 >= 4 && !strncmp(v6, "\xFF\xD8\xFF\xE0mage/jpeg", 4uLL)) {
    return &stru_189CAA928;
  }
  return 0LL;
}

- (uint64_t)_web_guessedMIMETypeForExtension:()NSURLExtras
{
  uint64_t v4 = (void *)objc_msgSend(a1, "_web_guessedMIMEType");
  uint64_t v5 = v4;
  if ((!v4 || [v4 isEqualToString:@"text/plain"]) && objc_msgSend(a3, "length")) {
    return objc_msgSend( +[NSURLFileTypeMappings sharedMappings](NSURLFileTypeMappings, "sharedMappings"),  "MIMETypeForExtension:",  a3);
  }
  else {
    return (uint64_t)v5;
  }
}

- (void)_web_parseRFC822HeaderFields
{
  uint64_t v2 = (void *)[MEMORY[0x189603FC8] dictionary];
  uint64_t v3 = [a1 bytes];
  uint64_t v4 = [a1 length];
  if (v4 >= 1)
  {
    uint64_t v5 = v4;
    char v6 = 0LL;
LABEL_3:
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    while (1)
    {
      int v9 = *(unsigned __int8 *)(v3 + v8);
      if (v9 == 10) {
        break;
      }
      if (v9 == 13)
      {
        if (v5 - 1 == v8) {
          return v2;
        }
        v10 = (unsigned __int8 *)(v3 + v8);
        v11 = (_BYTE *)(v3 + v8 + 1);
        if (*v11 == 10) {
          v11 = (_BYTE *)(v3 + v8 + 2);
        }
        if (!(_DWORD)v8) {
          return v2;
        }
LABEL_14:
        int v12 = *(unsigned __int8 *)v3;
        v43 = v11;
        if (v12 == 9 || v12 == 32)
        {
          if (v6)
          {
            uint64_t v13 = [v2 objectForKey:v6];
            v14 = (void *)[objc_allocWithZone((Class)NSString) initWithBytes:v3 length:v7 >> 32 encoding:CFStringConvertEncodingToNSStringEncoding(0x201u)];
            unint64_t v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@%@",  v13,  v14);
            [v2 setObject:v15 forKey:v6];
          }

          goto LABEL_58;
        }

        uint64_t v16 = 0LL;
        do
        {
          uint64_t v17 = v16;
          v18 = (unsigned __int8 *)(v3 + v16++);
        }

        while (v18 != v10 && *v18 != 58);
        v19 = (unsigned __int8 *)(v3 + v16);
        if ((unsigned __int8 *)(v3 + v16 - 1) != v10)
        {
          uint64_t v20 = (__CFString *)[objc_allocWithZone((Class)NSString) initWithBytes:v3 length:v16 - 1 encoding:CFStringConvertEncodingToNSStringEncoding(0x201u)];
          unsigned int v21 = v20;
          theString = v20;
          uint64_t numChars = CFStringGetLength(v20);
          if (numChars < 1) {
            goto LABEL_44;
          }
          CFIndex v22 = 0LL;
          v44 = 0LL;
          chars = 0LL;
          int v23 = 0;
          int v24 = 0;
          v41 = v2;
          CFIndex v42 = numChars + 1;
          BOOL v25 = 1;
          while (1)
          {
            unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(theString, v22);
            UniChar v27 = CharacterAtIndex;
            if (v25 && CharacterAtIndex >= 0x61 && CharacterAtIndex <= 0x7A)
            {
              UniChar v27 = CharacterAtIndex - 32;
              if (v23) {
                goto LABEL_28;
              }
            }

            else
            {
              if (v25 || CharacterAtIndex < 0x41 || CharacterAtIndex > 0x5A) {
                goto LABEL_40;
              }
              UniChar v27 = CharacterAtIndex + 32;
              if (v23)
              {
LABEL_28:
                if (v24) {
                  goto LABEL_38;
                }
                v28 = v44;
                goto LABEL_36;
              }
            }

            v48.location = 0LL;
            v48.length = numChars;
            if (CFStringGetBytes(theString, v48, 0x201u, 0, 0, 0LL, 0LL, 0LL) != numChars)
            {
              v29 = (UniChar *)MEMORY[0x186E1D20C](0LL, 2 * numChars, 0LL);
              v49.location = 0LL;
              v49.length = numChars;
              chars = v29;
              CFStringGetCharacters(theString, v49, v29);
LABEL_38:
              chars[v22] = v27;
              int v24 = 1;
              goto LABEL_39;
            }

            v28 = (char *)MEMORY[0x186E1D20C](0LL, v42, 0LL);
            CFStringGetCString(theString, v28, v42, 0x201u);
LABEL_36:
            int v24 = 0;
            v44 = v28;
            v28[v22] = v27;
LABEL_39:
            int v23 = 1;
LABEL_40:
            BOOL v25 = v27 == 45;
            if (numChars == ++v22)
            {
              uint64_t v2 = v41;
              if (v23)
              {
                if (v24) {
                  v30 = (NSString *)CFStringCreateWithCharacters(0LL, chars, numChars);
                }
                else {
                  v30 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  v44,  CFStringConvertEncodingToNSStringEncoding(0x201u));
                }
LABEL_46:
                char v6 = v30;
                if (v19 == v10)
                {
LABEL_54:
                  v34 = -[NSString initWithString:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithString:",  &stru_189CA6A28);
                }

                else
                {
                  v31 = &v10[~v3 - v17];
                  while (1)
                  {
                    int v32 = *v19;
                    if (v32 != 32 && v32 != 9) {
                      break;
                    }
                    ++v19;
                    --v31;
                    if (v19 == v10) {
                      goto LABEL_54;
                    }
                  }

                  v34 = (NSString *)[objc_allocWithZone((Class)NSString) initWithBytes:v19 length:v31 encoding:CFStringConvertEncodingToNSStringEncoding(0x201u)];
                }

                v35 = v34;
                v36 = v34;
                uint64_t v37 = [v2 objectForKey:v6];
                if (v37)
                {
                  v35 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@, %@",  v37,  v35);
                  v38 = v35;
                }

                [v2 setObject:v35 forKey:v6];
                break;
              }

- (void)_replaceCString:()NSURLExtras withCString:
{
  size_t v7 = strlen(__s);
  size_t v18 = strlen(a4);
  uint64_t v8 = (char *)[a1 bytes];
  int64_t v9 = [a1 length];
  char v10 = *__s;
  v11 = memchr(v8, *__s, v9);
  if (v11)
  {
    uint64_t v17 = a1;
    int v12 = 0LL;
    int64_t v13 = 0LL;
    do
    {
      int64_t v14 = v11 - v8;
      int64_t v15 = v11 - v8 + v7;
      if (v15 > v9) {
        break;
      }
      if (!memcmp(v11, __s, v7))
      {
        if (!v12) {
          int v12 = (void *)[MEMORY[0x189603FB8] data];
        }
        objc_msgSend(v12, "appendBytes:length:", &v8[v13], v14 - v13, v17);
        [v12 appendBytes:a4 length:v18];
        char v10 = *__s;
        int64_t v13 = v15;
      }

      else
      {
        int64_t v15 = v14 + 1;
      }

      v11 = memchr(&v8[v15], v10, v9 - v15);
    }

    while (v11);
    a1 = v17;
    if (v12)
    {
      if (v9 > v13) {
        [v12 appendBytes:&v8[v13] length:v9 - v13];
      }
      return v12;
    }
  }

  return a1;
}

@end