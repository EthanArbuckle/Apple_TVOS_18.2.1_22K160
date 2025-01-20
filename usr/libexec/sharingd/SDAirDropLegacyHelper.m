@interface SDAirDropLegacyHelper
+ (__SecKey)copyReceiverPublicKeyForIdentifier:(id)a3;
+ (id)internetLocationFile:(__CFURL *)a3;
+ (id)preprocessItems:(id)a3 forClientBundleID:(id)a4 receiverIdentifier:(id)a5 receiverSupportsURLs:(BOOL)a6 receiverIsUnknown:(BOOL)a7;
+ (id)realPathURL:(__CFURL *)a3;
+ (id)temporaryWeblocURL:(__CFURL *)a3;
+ (id)webURLFromInternetLocationFile:(id)a3;
@end

@implementation SDAirDropLegacyHelper

+ (id)realPathURL:(__CFURL *)a3
{
  CFTypeRef cf = 0LL;
  CFURLRef v3 = CFURLCreateFilePathURL(0LL, a3, (CFErrorRef *)&cf);
  if (v3)
  {
    v4 = v3;
    bzero(buffer, 0x400uLL);
    uint64_t v5 = CFURLGetFileSystemRepresentation(v4, 1u, buffer, 1024LL);
    if ((_DWORD)v5)
    {
      bzero(__s, 0x400uLL);
      if (realpath_DARWIN_EXTSN((const char *)buffer, __s))
      {
        size_t v6 = strlen(__s);
        Boolean v7 = sub_1001144B0(v4);
        CFURLRef v8 = CFURLCreateFromFileSystemRepresentation(0LL, (const UInt8 *)__s, v6, v7);
        if (v8)
        {
LABEL_15:
          CFRelease(v4);
          return v8;
        }

        uint64_t v9 = airdrop_log(0LL);
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100114088((uint64_t)__s, v10, v11, v12, v13, v14, v15, v16);
        }
      }

      else
      {
        uint64_t v33 = airdrop_log(0LL);
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100113FEC((uint64_t)buffer, v10);
        }
      }
    }

    else
    {
      uint64_t v26 = airdrop_log(v5);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100113F88((uint64_t)v4, v10, v27, v28, v29, v30, v31, v32);
      }
    }

    CFURLRef v8 = 0LL;
    goto LABEL_15;
  }

  uint64_t v17 = airdrop_log(0LL);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_100113F20((uint64_t)&cf, v18, v19, v20, v21, v22, v23, v24);
  }

  CFRelease(cf);
  return 0LL;
}

+ (id)preprocessItems:(id)a3 forClientBundleID:(id)a4 receiverIdentifier:(id)a5 receiverSupportsURLs:(BOOL)a6 receiverIsUnknown:(BOOL)a7
{
  BOOL v42 = a6;
  id v7 = a3;
  CFURLRef v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v10 = objc_alloc_init(&OBJC_CLASS___SDAirDropPreprocessItemsResult);
  -[SDAirDropPreprocessItemsResult setSuccess:](v10, "setSuccess:", 1LL);
  uint64_t v11 = (uint64_t)[v7 count];
  if (v11 >= 1)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0LL;
    CFTypeRef cf2 = (CFTypeRef)kSFNodeProtocolFile;
    do
    {
      if (!-[SDAirDropPreprocessItemsResult success](v10, "success")) {
        break;
      }
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v13]);

      CFTypeID v15 = CFURLGetTypeID();
      if (v15 != CFGetTypeID(v14))
      {
        id v23 = [v9 addObject:v14];
        if (v14)
        {
          [v45 addObject:v14];
        }

        else
        {
          uint64_t v29 = airdrop_log(v23);
          uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = 0LL;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "### Could not create URL from item %@",  buf,  0xCu);
          }
        }

        goto LABEL_38;
      }

      CFStringRef v16 = CFURLCopyScheme((CFURLRef)v14);
      if (!v16)
      {
        id v24 = objc_claimAutoreleasedReturnValue([v14 absoluteString]);
        id v25 = [v24 UTF8String];

        uint64_t v27 = airdrop_log(v26);
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          id v49 = v25;
          _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "SDAirDropClient: splitOutFileURLs url %s has no scheme",  buf,  0xCu);
        }

        -[SDAirDropPreprocessItemsResult setSuccess:](v10, "setSuccess:", 0LL);
        goto LABEL_38;
      }

      CFStringRef v17 = v16;
      if (CFEqual(v16, cf2))
      {
        id v18 = v14;
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pathExtension]);
        unsigned int v20 = [v19 isEqualToString:@"webloc"];

        if (v20)
        {
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropLegacyHelper webURLFromInternetLocationFile:]( &OBJC_CLASS___SDAirDropLegacyHelper,  "webURLFromInternetLocationFile:",  v18));
          if (v21)
          {
            v41 = v8;
            [v9 addObject:v21];
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v21));
            if (v22)
            {
              [v45 addObject:v22];
            }

            else
            {
              uint64_t v37 = airdrop_log(0LL);
              v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v49 = v21;
                _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "### Could not create URL from webloc string: %@",  buf,  0xCu);
              }
            }

            CFURLRef v8 = v41;
          }

          else
          {
            [v8 addObject:v18];
          }
        }

        else
        {
          [v8 addObject:v18];
        }

        goto LABEL_37;
      }

      if (v42
        && (uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor")),
            unsigned __int8 v32 = [v31 enableWebloc],
            v31,
            (v32 & 1) == 0))
      {
        id v36 = [v9 addObject:CFURLGetString((CFURLRef)v14)];
        if (v14)
        {
          [v45 addObject:v14];
          goto LABEL_37;
        }

        uint64_t v39 = airdrop_log(v36);
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = 0LL;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "### Could not create URL from item %@",  buf,  0xCu);
        }
      }

      else
      {
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[SDAirDropLegacyHelper internetLocationFile:]( &OBJC_CLASS___SDAirDropLegacyHelper,  "internetLocationFile:",  v14));
        if (v33)
        {
          [v8 addObject:v33];
          [v43 addObject:v33];
        }

        else
        {
          uint64_t v34 = airdrop_log(0LL);
          v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            sub_1001140EC(&v46, v47, v35);
          }

          -[SDAirDropPreprocessItemsResult setSuccess:](v10, "setSuccess:", 0LL);
        }
      }

LABEL_37:
      CFRelease(v17);
LABEL_38:
      ++v13;
    }

    while (v12 != v13);
  }

  if (-[SDAirDropPreprocessItemsResult success](v10, "success"))
  {
    -[SDAirDropPreprocessItemsResult setFiles:](v10, "setFiles:", v8);
    -[SDAirDropPreprocessItemsResult setLinks:](v10, "setLinks:", v45);
    -[SDAirDropPreprocessItemsResult setOtherStuff:](v10, "setOtherStuff:", v9);
    -[SDAirDropPreprocessItemsResult setFilesToCleanup:](v10, "setFilesToCleanup:", v43);
  }

  return v10;
}

+ (id)temporaryWeblocURL:(__CFURL *)a3
{
  CFURLRef v4 = sub_1001156C4(0LL, 65537);
  if (v4)
  {
    uint64_t v5 = v4;
    size_t v6 = CFURLCopyHostName(a3);
    if (v6)
    {
      id v7 = v6;
      CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0LL, 0LL, v6);
      if (!CFStringHasSuffix(MutableCopy, @".")) {
        CFStringTrim(MutableCopy, @".");
      }
      v21.length = CFStringGetLength(MutableCopy);
      v21.location = 0LL;
      CFStringFindAndReplace(MutableCopy, @".", @"-", v21, 0LL);
      uint64_t v9 = CFStringCreateWithFormat(0LL, 0LL, @"%@.webloc", MutableCopy);
      if (v9)
      {
        v10 = v9;
        uint64_t v11 = CFURLCreateWithFileSystemPathRelativeToBase(0LL, v9, kCFURLPOSIXPathStyle, 0, v5);
        if (v11)
        {
          uint64_t v12 = v11;
          CFURLRef v13 = CFURLCopyAbsoluteURL(v11);
          CFRelease(v12);
        }

        else
        {
          uint64_t v18 = airdrop_log(0LL);
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_100114180();
          }

          CFURLRef v13 = 0LL;
        }

        CFRelease(v10);
      }

      else
      {
        CFURLRef v13 = 0LL;
      }

      CFRelease(MutableCopy);
      CFRelease(v7);
    }

    else
    {
      uint64_t v16 = airdrop_log(0LL);
      CFStringRef v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100114154();
      }

      CFURLRef v13 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    uint64_t v14 = airdrop_log(0LL);
    CFTypeID v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100114128();
    }

    CFURLRef v13 = 0LL;
  }

  return v13;
}

+ (id)internetLocationFile:(__CFURL *)a3
{
  CFURLRef v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue( +[SDAirDropLegacyHelper temporaryWeblocURL:]( &OBJC_CLASS___SDAirDropLegacyHelper,  "temporaryWeblocURL:"));
  if (v4)
  {
    CFStringRef v5 = CFURLGetString(a3);
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, @"URL", v5);
    id v7 = CFWriteStreamCreateWithFile(0LL, v4);
    if (v7)
    {
      CFURLRef v8 = v7;
      uint64_t v9 = CFWriteStreamOpen(v7);
      if ((_DWORD)v9)
      {
        CFErrorRef error = 0LL;
        if (!CFPropertyListWrite(Mutable, v8, kCFPropertyListBinaryFormat_v1_0, 0LL, &error))
        {
          uint64_t v10 = airdrop_log(0LL);
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            sub_100114204((uint64_t)&error, v11, v12, v13, v14, v15, v16, v17);
          }

          CFRelease(error);
        }

        CFWriteStreamClose(v8);
      }

      else
      {
        uint64_t v20 = airdrop_log(v9);
        CFRange v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1001141D8();
        }
      }

      CFRelease(v8);
    }

    else
    {
      uint64_t v18 = airdrop_log(0LL);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1001141AC();
      }
    }

    CFRelease(Mutable);
  }

  return v4;
}

+ (id)webURLFromInternetLocationFile:(id)a3
{
  CFURLRef v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", a3));
  CFURLRef v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v3,  0LL,  0LL,  0LL));

  CFStringRef v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"URL"]);
  size_t v6 = v5;
  if (v5) {
    id v7 = v5;
  }

  return v6;
}

+ (__SecKey)copyReceiverPublicKeyForIdentifier:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    uint64_t v10 = airdrop_log(0LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10011426C();
    }
    goto LABEL_12;
  }

  CFURLRef v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  CFStringRef v5 = (__SecCertificate *)[v4 copyCertificateForRealName:v3];

  if (!v5)
  {
    uint64_t v12 = airdrop_log(v6);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100114298();
    }
LABEL_12:

    id v7 = 0LL;
    goto LABEL_13;
  }

  id v7 = SecCertificateCopyKey(v5);
  if (!v7)
  {
    uint64_t v8 = airdrop_log(0LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001142C4();
    }
  }

  CFRelease(v5);
LABEL_13:

  return v7;
}

@end