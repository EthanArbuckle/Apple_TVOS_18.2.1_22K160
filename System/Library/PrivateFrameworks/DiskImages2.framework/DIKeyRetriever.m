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
    +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Not valid SAKS environment",  a4);
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }

  return (id)v6;
}

+ (id)newDawTokenWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 fileHandleForReading];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = objc_alloc_init(MEMORY[0x189607A38]);
  [MEMORY[0x189604030] fileURLWithPath:@"/usr/local/bin/appleconnect"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setExecutableURL:v7];

  [v6 setArguments:&unk_18A1FC2A8];
  [v6 setStandardOutput:v4];
  if ([v6 launchAndReturnError:a3])
  {
    [v6 waitUntilExit];
    if ([v6 terminationStatus])
    {
      v8 = +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Could not generate daw token - AppleConnect Failure",  a3);
    }

    else
    {
      [v5 readDataToEndOfFileAndReturnError:a3];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)[objc_alloc(NSString) initWithData:v9 encoding:4];
        [MEMORY[0x189607810] newlineCharacterSet];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 stringByTrimmingCharactersInSet:v11];
        v8 = (void *)objc_claimAutoreleasedReturnValue();
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
  v10[1] = *MEMORY[0x1895F89C0];
  v3 = (void *)[a1 newDawTokenWithError:a3];
  if (v3)
  {
    [MEMORY[0x189601F00] ephemeralSessionConfiguration];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithFormat:@"Bearer %@", v3, @"Authorization"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setHTTPAdditionalHeaders:v6];

    [MEMORY[0x189601EF8] sessionWithConfiguration:v4];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  id v23 = 0LL;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  uint64_t v12 = MEMORY[0x1895F87A8];
  uint64_t v13 = 3221225472LL;
  v14 = __60__DIKeyRetriever_requestSynchronousDataWithRequest_session___block_invoke;
  v15 = &unk_18A1CA388;
  v17 = &v18;
  v8 = v7;
  v16 = v8;
  [v6 dataTaskWithRequest:v5 completionHandler:&v12];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume", v12, v13, v14, v15);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __60__DIKeyRetriever_requestSynchronousDataWithRequest_session___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    int v8 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68158210;
      int v16 = 73;
      __int16 v17 = 2080;
      uint64_t v18 = "+[DIKeyRetriever requestSynchronousDataWithRequest:session:]_block_invoke";
      __int16 v19 = 2112;
      id v20 = v7;
      id v10 = (char *)_os_log_send_and_compose_impl();

      if (v10)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v10);
        free(v10);
      }
    }

    else
    {
      getDIOSLog();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158210;
        int v16 = 73;
        __int16 v17 = 2080;
        uint64_t v18 = "+[DIKeyRetriever requestSynchronousDataWithRequest:session:]_block_invoke";
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl(&dword_188046000, v11, OS_LOG_TYPE_ERROR, "%.*s: %@", buf, 0x1Cu);
      }
    }

    *__error() = v8;
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
  id v14 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)jsonResponseWithRequest:(id)a3 session:(id)a4 error:(id *)a5
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    [MEMORY[0x1896078D8] JSONObjectWithData:v6 options:0 error:a5];
  }
  else {
    +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  150LL,  @"AEA key retrieval failed",  a5);
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)postRequestWithURL:(id)a3 session:(id)a4 data:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  [MEMORY[0x189601EB0] requestWithURL:a3];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setHTTPMethod:@"POST"];
  [v12 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  if (v11) {
    [v12 setHTTPBody:v11];
  }
  [a1 jsonResponseWithRequest:v12 session:v10 error:a6];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)getRequestWithURL:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
  [MEMORY[0x189601EF8] sharedSession];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 requestSynchronousDataWithRequest:v6 session:v7];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  150LL,  @"AEA key retrieval failed",  a4);
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)newEnvWithDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    uint64_t v9 = +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Not valid SAKS metadata (json format expected)",  a4);
    goto LABEL_5;
  }

  [v5 objectForKey:@"metadata"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 valueForKey:@"environment"];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    uint64_t v9 = +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Not valid SAKS metadata (no environment field)",  a4);
LABEL_5:
    int v8 = (void *)v9;
  }

  return v8;
}

+ (id)newUrl:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604030] URLWithString:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)writeHexKeyToBuffer:(char *)a3 hexKey:(id)a4 error:(id *)a5
{
  id v7 = a4;
  int v8 = (const char *)[v7 UTF8String];
  size_t v9 = strnlen(v8, 0x41uLL);
  if (v9 == 64)
  {
    if (strlen(v8) != 64)
    {
      id v11 = "Key is not 32 bytes size.";
LABEL_11:
      exception = __cxa_allocate_exception(0x40uLL);
      void *exception = off_18A1E43B0;
      __int16 v17 = std::generic_category();
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
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid size hex key %lu", v9);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
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
    [v9 URLByAppendingPathComponent:@"decryption-components"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DIKeyRetriever postRequestWithURL:session:data:error:]( &OBJC_CLASS___DIKeyRetriever,  "postRequestWithURL:session:data:error:",  v11,  v10,  0LL,  a6);
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v13 = v12;
    if (v12)
    {
      [v12 objectForKeyedSubscript:@"encryption"];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        [v14 objectForKeyedSubscript:@"key"];
        int v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16) {
          char v17 = [a1 writeHexKeyToBuffer:a4 hexKey:v16 error:a6];
        }
        else {
          char v17 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Missing key in KKMS response",  a6);
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
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    frk_metadata_from_aea_auth_data(a4->var0, a7);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    char v12 = v11;
    if (v11)
    {
      frk_unwrapped_symmetric_key_with_shipping_private_key(v11, v10, a7);
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v14 = v13;
      if (v13)
      {
        if ([v13 length] == 32)
        {
          v15 = (_OWORD *)[v14 bytes];
          __int128 v16 = v15[1];
          *(_OWORD *)a5 = *v15;
          *((_OWORD *)a5 + 1) = v16;
          BOOL v17 = 1;
        }

        else
        {
          BOOL v17 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Invalid key size",  a7);
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
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (BOOL)decryptKeyWithData:(id)a3 destKey:(char *)a4 destKeySize:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  [a1 hintFormat:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 dataUsingEncoding:4];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v9;
  if ([v10 isEqual:@"plist"])
  {
    uint64_t v13 = [MEMORY[0x1896079E8] propertyListWithData:v11 options:0 format:0 error:a6];
    [MEMORY[0x1896078D8] dataWithJSONObject:v13 options:1 error:a6];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)NSString;
    id v16 = v14;
    objc_msgSend(v15, "stringWithUTF8String:", objc_msgSend(v16, "bytes"));
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v18 = (void *)v13;
    if (!v13)
    {
LABEL_3:
      BOOL v19 = 0;
      id v20 = @"dev";
      goto LABEL_25;
    }
  }

  else
  {
    [MEMORY[0x1896078D8] JSONObjectWithData:v11 options:0 error:a6];
    BOOL v17 = v12;
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18) {
      goto LABEL_3;
    }
  }

  id v20 = +[DIKeyRetriever newEnvWithDictionary:error:]( &OBJC_CLASS___DIKeyRetriever,  "newEnvWithDictionary:error:",  v18,  a6);
  if (v20)
  {
    v38 = a4;
    id v21 = +[DIKeyRetriever newACEndpointWithEnvironment:error:]( &OBJC_CLASS___DIKeyRetriever,  "newACEndpointWithEnvironment:error:",  v20,  a6);
    if (v21)
    {
      id v22 = +[DIKeyRetriever newSessionWithError:](&OBJC_CLASS___DIKeyRetriever, "newSessionWithError:", a6);
      if (v22)
      {
        id v40 = v22;
        id v37 = v21;
        id v39 = +[DIKeyRetriever newUrl:](&OBJC_CLASS___DIKeyRetriever, "newUrl:", v21);
        [v17 dataUsingEncoding:4];
        id v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = +[DIKeyRetriever postRequestWithURL:session:data:error:]( &OBJC_CLASS___DIKeyRetriever,  "postRequestWithURL:session:data:error:",  v39,  v40,  v23,  a6);
        if (v24)
        {
          v36 = v24;
          [v24 objectForKeyedSubscript:@"key"];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = v25;
            v27 = (const char *)[v25 UTF8String];
            v28 = v27;
            if (v27)
            {
              size_t v29 = strnlen(v27, 0x59uLL);
              if (v29 == 88)
              {
                __int128 v30 = *((_OWORD *)v28 + 1);
                *(_OWORD *)v38 = *(_OWORD *)v28;
                *((_OWORD *)v38 + 1) = v30;
                __int128 v31 = *((_OWORD *)v28 + 2);
                __int128 v32 = *((_OWORD *)v28 + 3);
                __int128 v33 = *((_OWORD *)v28 + 4);
                *((void *)v38 + 10) = *((void *)v28 + 10);
                *((_OWORD *)v38 + 3) = v32;
                *((_OWORD *)v38 + 4) = v33;
                *((_OWORD *)v38 + 2) = v31;
                BOOL v19 = 1;
              }

              else
              {
                objc_msgSend(NSString, "stringWithFormat:", @"Invalid size of saks response %lu", v29);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                BOOL v19 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v34,  a6);
              }
            }

            else
            {
              BOOL v19 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Missing key in SAKS response",  a6);
            }

            id v21 = v37;
          }

          else
          {
            v26 = 0LL;
            id v21 = v37;
            BOOL v19 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Bad or missing key in SAKS response.",  a6);
          }

          v24 = v36;
        }

        else
        {
          BOOL v19 = 0;
          id v21 = v37;
        }

        id v22 = v40;
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

@end