@interface DIKeyRetriever
+ (BOOL)KKMSKeyWithURL:(id)a3 destKey:(char *)a4 destKeySize:(unint64_t)a5 error:(id *)a6;
+ (BOOL)WKMSKeyWithURL:(id)a3 authData:(const AuthData *)a4 destKey:(char *)a5 destKeySize:(unint64_t)a6 error:(id *)a7;
+ (BOOL)decryptKeyWithData:(id)a3 destKey:(char *)a4 destKeySize:(unint64_t)a5 error:(id *)a6;
+ (BOOL)writeHexKeyToBuffer:(char *)a3 hexKey:(id)a4 error:(id *)a5;
+ (id)getRequestWithURL:(id)a3 error:(id *)a4;
+ (id)hintFormat:(id)a3;
+ (id)jsonResponseWithRequest:(id)a3 session:(id)a4 error:(id *)a5;
+ (id)newACEndpointWithEnvironment:(id)a3 error:(id *)a4;
+ (id)newDawTokenWithError:(id *)a3;
+ (id)newEnvWithDictionary:(id)a3 error:(id *)a4;
+ (id)newSessionWithError:(id *)a3;
+ (id)newUrl:(id)a3;
+ (id)postRequestWithURL:(id)a3 session:(id)a4 data:(id)a5 error:(id *)a6;
+ (id)requestSynchronousDataWithRequest:(id)a3 session:(id)a4;
@end

@implementation DIKeyRetriever

+ (id)newACEndpointWithEnvironment:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 isEqual:@"uat"])
  {
    v6 = @"saks-ac-uat.g.apple.com";
  }

  else if ([v5 isEqual:@"prod"])
  {
    v6 = @"saks-ac-prod.g.apple.com";
  }

  else if ([v5 isEqual:@"dev"])
  {
    v6 = @"saks-ac-dev.g.apple.com";
  }

  else
  {
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Not valid SAKS environment",  a4));
  }

  return (id)v6;
}

+ (id)newDawTokenWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPipe pipe](&OBJC_CLASS___NSPipe, "pipe"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fileHandleForReading]);
  v6 = objc_alloc_init(&OBJC_CLASS___NSTask);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/usr/local/bin/appleconnect"));
  -[NSTask setExecutableURL:](v6, "setExecutableURL:", v7);

  -[NSTask setArguments:](v6, "setArguments:", &off_10018E3A0);
  -[NSTask setStandardOutput:](v6, "setStandardOutput:", v4);
  if (-[NSTask launchAndReturnError:](v6, "launchAndReturnError:", a3))
  {
    -[NSTask waitUntilExit](v6, "waitUntilExit");
    if (-[NSTask terminationStatus](v6, "terminationStatus"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Could not generate daw token - AppleConnect Failure",  a3));
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v5 readDataToEndOfFileAndReturnError:a3]);
      if (v9)
      {
        v10 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v9, 4LL);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByTrimmingCharactersInSet:](v10, "stringByTrimmingCharactersInSet:", v11));
      }

      else
      {
        v8 = 0LL;
      }
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

+ (id)newSessionWithError:(id *)a3
{
  id v3 = [a1 newDawTokenWithError:a3];
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Bearer %@",  v3,  @"Authorization"));
    v10 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    [v4 setHTTPAdditionalHeaders:v6];

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v4));
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

+ (id)hintFormat:(id)a3
{
  else {
    return @"json";
  }
}

+ (id)requestSynchronousDataWithRequest:(id)a3 session:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_10007F560;
  v21 = sub_10007F570;
  id v22 = 0LL;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_10007F578;
  v14 = &unk_100176460;
  v16 = &v17;
  v7 = dispatch_semaphore_create(0LL);
  v15 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 dataTaskWithRequest:v5 completionHandler:&v11]);
  objc_msgSend(v8, "resume", v11, v12, v13, v14);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

+ (id)jsonResponseWithRequest:(id)a3 session:(id)a4 error:(id *)a5
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 requestSynchronousDataWithRequest:a3 session:a4]);
  if (v6) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v6,  0LL,  a5));
  }
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  150LL,  @"AEA key retrieval failed",  a5));
  }
  v8 = (void *)v7;

  return v8;
}

+ (id)postRequestWithURL:(id)a3 session:(id)a4 data:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", a3));
  [v12 setHTTPMethod:@"POST"];
  [v12 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  if (v11) {
    [v12 setHTTPBody:v11];
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 jsonResponseWithRequest:v12 session:v10 error:a6]);

  return v13;
}

+ (id)getRequestWithURL:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", a3));
  [v6 setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](&OBJC_CLASS___NSURLSession, "sharedSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 requestSynchronousDataWithRequest:v6 session:v7]);

  if (!v8) {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  150LL,  @"AEA key retrieval failed",  a4));
  }

  return v8;
}

+ (id)newEnvWithDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Not valid SAKS metadata (json format expected)",  a4));
    goto LABEL_5;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"metadata"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:@"environment"]);

  if (!v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Not valid SAKS metadata (no environment field)",  a4));
LABEL_5:
    v8 = (void *)v9;
  }

  return v8;
}

+ (id)newUrl:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"https://%@/v1/ac/decrypt",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));

  return v4;
}

+ (BOOL)writeHexKeyToBuffer:(char *)a3 hexKey:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = (const char *)[v7 UTF8String];
  size_t v9 = strnlen(v8, 0x41uLL);
  if (v9 == 64)
  {
    if (strlen(v8) != 64)
    {
      id v11 = "Key is not 32 bytes size.";
LABEL_11:
      exception = __cxa_allocate_exception(0x40uLL);
      void *exception = &off_100189E78;
      uint64_t v17 = std::generic_category();
      exception[1] = 22LL;
      exception[2] = v17;
      *((_BYTE *)exception + 24) = 0;
      *((_BYTE *)exception + 48) = 0;
      exception[7] = v11;
    }

    uint64_t v10 = 0LL;
    char v19 = 0;
    id v11 = "Key is not hexadecimal number.";
    do
    {
      *(_WORD *)__str = *(_WORD *)&v8[2 * v10];
      char v12 = strtol(__str, 0LL, 16);
      a3[v10] = v12;
      ++v10;
    }

    while (v10 != 32);
    BOOL v13 = 1;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid size hex key %lu",  v9));
    BOOL v13 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v14,  a5);
  }

  return v13;
}

+ (BOOL)KKMSKeyWithURL:(id)a3 destKey:(char *)a4 destKeySize:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = +[DIKeyRetriever newSessionWithError:](&OBJC_CLASS___DIKeyRetriever, "newSessionWithError:", a6);
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:@"decryption-components"]);
    char v12 = (void *)objc_claimAutoreleasedReturnValue( +[DIKeyRetriever postRequestWithURL:session:data:error:]( &OBJC_CLASS___DIKeyRetriever,  "postRequestWithURL:session:data:error:",  v11,  v10,  0LL,  a6));
    BOOL v13 = v12;
    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"encryption"]);
      v15 = v14;
      if (v14)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"key"]);
        if (v16) {
          unsigned __int8 v17 = [a1 writeHexKeyToBuffer:a4 hexKey:v16 error:a6];
        }
        else {
          unsigned __int8 v17 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Missing key in KKMS response",  a6);
        }
        BOOL v18 = v17;
      }

      else
      {
        BOOL v18 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Missing key in KKMS response",  a6);
      }
    }

    else
    {
      BOOL v18 = 0;
    }
  }

  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (BOOL)WKMSKeyWithURL:(id)a3 authData:(const AuthData *)a4 destKey:(char *)a5 destKeySize:(unint64_t)a6 error:(id *)a7
{
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[DIKeyRetriever getRequestWithURL:error:]( &OBJC_CLASS___DIKeyRetriever,  "getRequestWithURL:error:",  a3,  a7,  a5,  a6));
  if (v10)
  {
    id v11 = frk_metadata_from_aea_auth_data(a4->var0, a7);
    char v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v13 = v12;
    if (v12)
    {
      id v14 = frk_unwrapped_symmetric_key_with_shipping_private_key(v12, v10, a7);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = v15;
      if (v15)
      {
        if ([v15 length] == (id)32)
        {
          unsigned __int8 v17 = [v16 bytes];
          __int128 v18 = v17[1];
          *(_OWORD *)a5 = *v17;
          *((_OWORD *)a5 + 1) = v18;
          BOOL v19 = 1;
        }

        else
        {
          BOOL v19 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Invalid key size",  a7);
        }
      }

      else
      {
        BOOL v19 = 0;
      }
    }

    else
    {
      BOOL v19 = 0;
    }
  }

  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

+ (BOOL)decryptKeyWithData:(id)a3 destKey:(char *)a4 destKeySize:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 hintFormat:v9]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 dataUsingEncoding:4]);
  id v12 = v9;
  if ([v10 isEqual:@"plist"])
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v11,  0LL,  0LL,  a6));
    id v14 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization, "dataWithJSONObject:options:error:", v13, 1LL, a6));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  [v14 bytes]));

    v16 = (void *)v13;
    if (!v13)
    {
LABEL_3:
      BOOL v17 = 0;
      __int128 v18 = @"dev";
      goto LABEL_25;
    }
  }

  else
  {
    v15 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v11,  0LL,  a6));
    if (!v16) {
      goto LABEL_3;
    }
  }

  __int128 v18 = +[DIKeyRetriever newEnvWithDictionary:error:]( &OBJC_CLASS___DIKeyRetriever,  "newEnvWithDictionary:error:",  v16,  a6);
  if (v18)
  {
    v36 = a4;
    id v19 = +[DIKeyRetriever newACEndpointWithEnvironment:error:]( &OBJC_CLASS___DIKeyRetriever,  "newACEndpointWithEnvironment:error:",  v18,  a6);
    if (v19)
    {
      id v20 = +[DIKeyRetriever newSessionWithError:](&OBJC_CLASS___DIKeyRetriever, "newSessionWithError:", a6);
      if (v20)
      {
        id v38 = v20;
        id v35 = v19;
        id v37 = +[DIKeyRetriever newUrl:](&OBJC_CLASS___DIKeyRetriever, "newUrl:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue([v15 dataUsingEncoding:4]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[DIKeyRetriever postRequestWithURL:session:data:error:]( &OBJC_CLASS___DIKeyRetriever,  "postRequestWithURL:session:data:error:",  v37,  v38,  v21,  a6));

        if (v22)
        {
          v34 = v22;
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"key"]);
          if (v23)
          {
            v24 = v23;
            v25 = (const char *)[v23 UTF8String];
            v26 = v25;
            if (v25)
            {
              size_t v27 = strnlen(v25, 0x59uLL);
              if (v27 == 88)
              {
                __int128 v28 = *((_OWORD *)v26 + 1);
                *(_OWORD *)v36 = *(_OWORD *)v26;
                *((_OWORD *)v36 + 1) = v28;
                __int128 v29 = *((_OWORD *)v26 + 2);
                __int128 v30 = *((_OWORD *)v26 + 3);
                __int128 v31 = *((_OWORD *)v26 + 4);
                *((void *)v36 + 10) = *((void *)v26 + 10);
                *((_OWORD *)v36 + 3) = v30;
                *((_OWORD *)v36 + 4) = v31;
                *((_OWORD *)v36 + 2) = v29;
                BOOL v17 = 1;
              }

              else
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid size of saks response %lu",  v27));
                BOOL v17 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v32,  a6);
              }
            }

            else
            {
              BOOL v17 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Missing key in SAKS response",  a6);
            }

            id v19 = v35;
          }

          else
          {
            v24 = 0LL;
            id v19 = v35;
            BOOL v17 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Bad or missing key in SAKS response.",  a6);
          }

          id v22 = v34;
        }

        else
        {
          BOOL v17 = 0;
          id v19 = v35;
        }

        id v20 = v38;
      }

      else
      {
        BOOL v17 = 0;
      }
    }

    else
    {
      BOOL v17 = 0;
    }
  }

  else
  {
    BOOL v17 = 0;
  }

@end