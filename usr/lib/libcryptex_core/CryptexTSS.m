@interface CryptexTSS
- (BOOL)isSSOAvailable;
- (CryptexTSS)initWithFlags:(unint64_t)a3;
- (NSData)c411_content;
- (NSDictionary)response;
- (NSError)nserr;
- (NSString)tssURL;
- (NSString)tssUsage;
- (OS_cryptex_signature)tssp_sign;
- (OS_dispatch_queue)dq;
- (OS_os_log)log;
- (OS_xpc_object)im4m_array;
- (OS_xpc_object)tss_request;
- (id)generateDiavloRequest:(id)a3;
- (id)generatePackedSignatures;
- (id)tssFormatRequest:(id)a3 withHeaders:(id)a4 withURL:(id)a5;
- (id)tssFormatResponse:(id)a3 withHeaderData:(id)a4 withCode:(int64_t)a5;
- (id)tssSendRequest;
- (id)tssSerializeRequest;
- (unint64_t)flags;
- (void)activate;
- (void)setC411_content:(id)a3;
- (void)setIm4m_array:(id)a3;
- (void)setNserr:(id)a3;
- (void)setResponse:(id)a3;
- (void)setTssURL:(id)a3;
- (void)setTssp_sign:(id)a3;
- (void)tssSerializeRequest;
- (void)tssStampRequest;
- (void)tssSubmit;
@end

@implementation CryptexTSS

- (CryptexTSS)initWithFlags:(unint64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CryptexTSS;
  v4 = -[CryptexTSS init](&v22, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_flags = a3;
    tssURL = v4->_tssURL;
    v4->_tssURL = (NSString *)@"http://gs.apple.com";

    os_log_t v7 = os_log_create("com.apple.libcryptex", "tss");
    log = v5->_log;
    v5->_log = v7;

    dispatch_queue_attr_make_initially_inactive(0LL);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.security.libcryptex.core.tss", v9);

    dq = v5->_dq;
    v5->_dq = (OS_dispatch_queue *)v10;

    nserr = v5->_nserr;
    v5->_nserr = 0LL;

    v13 = (OS_xpc_object *)xpc_dictionary_create(0LL, 0LL, 0LL);
    tss_request = v5->_tss_request;
    v5->_tss_request = v13;

    tssp_sign = v5->_tssp_sign;
    v5->_tssp_sign = 0LL;

    response = v5->_response;
    v5->_response = 0LL;

    tssUsage = v5->_tssUsage;
    v5->_tssUsage = (NSString *)&stru_18A169328;

    c411_content = v5->_c411_content;
    v5->_c411_content = 0LL;

    im4m_array = v5->_im4m_array;
    v5->_im4m_array = 0LL;

    if ((a3 & 1) != 0)
    {
      v20 = v5->_tssURL;
      v5->_tssURL = (NSString *)@"https://gs.apple.com:443";
    }
  }

  return v5;
}

- (void)tssStampRequest
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  memset(out, 0, sizeof(out));
  memset(v7, 0, 37);
  uuid_generate_random(out);
  uuid_unparse_lower(out, v7);
  uint64_t v3 = -[CryptexTSS tss_request](self, "tss_request", *(_OWORD *)v7, *(void *)&v7[16], *(_OWORD *)&v7[24]);
  xpc_dictionary_set_string((xpc_object_t)v3, "@UUID", v7);

  LOBYTE(v3) = -[CryptexTSS flags](self, "flags");
  v4 = -[CryptexTSS tss_request](self, "tss_request");
  v5 = v4;
  if ((v3 & 4) != 0) {
    v6 = "@Cryptex1,Ticket";
  }
  else {
    v6 = "@ApImg4Ticket";
  }
  xpc_dictionary_set_BOOL(v4, v6, 1);
}

- (id)generatePackedSignatures
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CryptexTSS im4m_array](self, "im4m_array");
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  if (!v5)
  {
    v6 = -[CryptexTSS log](self, "log");
    if (v6)
    {
      -[CryptexTSS log](self, "log");
      os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      int v31 = 67109120;
      int v32 = 22;
      LODWORD(v25) = 8;
      v8 = (char *)_os_log_send_and_compose_impl();
    }

    else
    {
      int v31 = 67109120;
      int v32 = 22;
      LODWORD(v25) = 8;
      v8 = (char *)_os_log_send_and_compose_impl();
    }

    CFErrorRef Error = createError( "-[CryptexTSS generatePackedSignatures]",  "tss.m",  178,  "com.apple.security.cryptex.posix",  22LL,  0LL,  v8);
    free(v8);
    -[CryptexTSS setNserr:](self, "setNserr:", Error, &v31, v25);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * i) base64EncodedStringWithOptions:0];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607810] URLQueryAllowedCharacterSet];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 stringByAddingPercentEncodingWithAllowedCharacters:v15];
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        [v3 addObject:v16];
      }

      uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v11);
  }
  v17 = -[CryptexTSS im4m_array](self, "im4m_array");
  size_t count = xpc_array_get_count(v17);
  LOBYTE(count) = count == [v3 count];

  if ((count & 1) != 0)
  {
    id v19 = v3;
  }

  else
  {
    v20 = -[CryptexTSS log](self, "log");
    if (v20)
    {
      -[CryptexTSS log](self, "log");
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
      int v31 = 67109120;
      int v32 = 33;
      LODWORD(v25) = 8;
      objc_super v22 = (char *)_os_log_send_and_compose_impl();
    }

    else
    {
      int v31 = 67109120;
      int v32 = 33;
      LODWORD(v25) = 8;
      objc_super v22 = (char *)_os_log_send_and_compose_impl();
    }

    CFErrorRef v23 = createError( "-[CryptexTSS generatePackedSignatures]",  "tss.m",  190,  "com.apple.security.cryptex.posix",  33LL,  0LL,  v22);
    free(v22);
    -[CryptexTSS setNserr:](self, "setNserr:", v23, &v31, v25, (void)v26);

    id v19 = 0LL;
  }

  return v19;
}

- (id)generateDiavloRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  v6 = -[CryptexTSS generatePackedSignatures](self, "generatePackedSignatures");
  -[CryptexTSS c411_content](self, "c411_content");
  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 base64EncodedStringWithOptions:0];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v8 forKeyedSubscript:@"info"];

  [v4 base64EncodedStringWithOptions:0];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v9 forKeyedSubscript:@"sign_request"];

  [v5 setObject:v6 forKeyedSubscript:@"signatures"];
  -[CryptexTSS tssUsage](self, "tssUsage");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v10 forKeyedSubscript:@"usage"];

  -[CryptexTSS log](self, "log");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CryptexTSS generateDiavloRequest:].cold.1();
  }

  id v23 = 0LL;
  [MEMORY[0x1896078D8] dataWithJSONObject:v5 options:2 error:&v23];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v23;
  if (!v12)
  {
    v14 = -[CryptexTSS log](self, "log");
    if (v14)
    {
      -[CryptexTSS log](self, "log");
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      [v13 localizedDescription];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      int v24 = 138412546;
      uint64_t v25 = v16;
      __int16 v26 = 1024;
      int v27 = 22;
      LODWORD(v22) = 18;
      v17 = (char *)_os_log_send_and_compose_impl();
    }

    else
    {
      id v18 = MEMORY[0x1895F8DA0];
      [v13 localizedDescription];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      int v24 = 138412546;
      uint64_t v25 = v19;
      __int16 v26 = 1024;
      int v27 = 22;
      LODWORD(v22) = 18;
      v17 = (char *)_os_log_send_and_compose_impl();

      v15 = (os_log_s *)MEMORY[0x1895F8DA0];
    }

    CFErrorRef Error = createError( "-[CryptexTSS generateDiavloRequest:]",  "tss.m",  217,  "com.apple.security.cryptex.posix",  22LL,  0LL,  v17);
    free(v17);
    -[CryptexTSS setNserr:](self, "setNserr:", Error, &v24, v22);
  }

  return v12;
}

- (id)tssSerializeRequest
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  -[CryptexTSS tss_request](self, "tss_request");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  -[CryptexTSS log](self, "log");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl(&dword_187E97000, v5, OS_LOG_TYPE_INFO, "tss request dictionary:\n%@", buf, 0xCu);
  }

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v4;
    id v15 = 0LL;
    [MEMORY[0x1896079E8] dataWithPropertyList:v6 format:100 options:0 error:&v15];
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v15;
    if (!v7)
    {
      -[CryptexTSS log](self, "log");
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CryptexTSS tssSerializeRequest].cold.2((uint64_t)v6, v8, v9);
      }
    }
  }

  else
  {
    id v8 = 0LL;
    os_log_t v7 = 0LL;
  }

  if ((-[CryptexTSS flags](self, "flags") & 2) != 0)
  {
    -[CryptexTSS generateDiavloRequest:](self, "generateDiavloRequest:", v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = v7;
  }

  uint64_t v11 = v10;
  -[CryptexTSS log](self, "log");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CryptexTSS tssSerializeRequest].cold.1();
  }

  id v13 = v11;
  return v13;
}

- (id)tssFormatRequest:(id)a3 withHeaders:(id)a4 withURL:(id)a5
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x189607940]);
  [v10 appendFormat:@"---------REQUEST START---------\n"];
  [v10 appendFormat:@"URL: %@\n", v9];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        [v10 appendFormat:@"%@\n", *(void *)(*((void *)&v19 + 1) + 8 * v15++)];
      }

      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v13);
  }

  [v7 base64EncodedStringWithOptions:0];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 appendFormat:@"BODY:\n%@\n", v16];

  [v10 appendFormat:@"---------REQUEST END---------\n"];
  v17 = (void *)[v10 copy];

  return v17;
}

- (id)tssFormatResponse:(id)a3 withHeaderData:(id)a4 withCode:(int64_t)a5
{
  id v7 = (objc_class *)MEMORY[0x189607940];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  [v10 appendFormat:@"---------RESPONSE START---------\n"];
  objc_msgSend(v10, "appendFormat:", @"HTTP Status Code: %ld\n", a5);
  id v11 = (void *)[objc_alloc(NSString) initWithData:v8 encoding:4];

  [v10 appendFormat:@"%@\n", v11];
  [v9 base64EncodedStringWithOptions:0];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  [v10 appendFormat:@"BODY:\n%@\n", v12];
  [v10 appendFormat:@"---------RESPONSE END---------\n"];
  uint64_t v13 = (void *)[v10 copy];

  return v13;
}

- (id)tssSendRequest
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CryptexTSS log](self, "log");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    id v5 = (char *)_os_log_send_and_compose_impl();
  }

  else
  {
    id v5 = (char *)_os_log_send_and_compose_impl();
  }

  CFErrorRef Error = createError("-[CryptexTSS tssSendRequest]", "tss.m", 400, "com.apple.security.cryptex", 10LL, 0LL, v5);
  free(v5);
  return Error;
}

- (BOOL)isSSOAvailable
{
  return 0;
}

- (void)tssSubmit
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  [a1 flags];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_187E97000, a2, v3, "tss flags = %#llx", v4);
  OUTLINED_FUNCTION_3_0();
}

- (void)activate
{
  uint64_t v3 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
  dispatch_activate(v3);

  -[CryptexTSS dq](self, "dq");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __22__CryptexTSS_activate__block_invoke;
  block[3] = &unk_18A168988;
  block[4] = self;
  dispatch_barrier_sync(v4, block);
}

void __22__CryptexTSS_activate__block_invoke(uint64_t a1)
{
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_187E97000, v1, OS_LOG_TYPE_DEFAULT, "Drained queue", v2, 2u);
  }
}

- (unint64_t)flags
{
  return self->_flags;
}

- (OS_os_log)log
{
  return self->_log;
}

- (NSError)nserr
{
  return self->_nserr;
}

- (void)setNserr:(id)a3
{
}

- (OS_dispatch_queue)dq
{
  return self->_dq;
}

- (NSString)tssUsage
{
  return self->_tssUsage;
}

- (NSString)tssURL
{
  return self->_tssURL;
}

- (void)setTssURL:(id)a3
{
}

- (OS_xpc_object)tss_request
{
  return self->_tss_request;
}

- (NSDictionary)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (OS_cryptex_signature)tssp_sign
{
  return self->_tssp_sign;
}

- (void)setTssp_sign:(id)a3
{
}

- (OS_xpc_object)im4m_array
{
  return self->_im4m_array;
}

- (void)setIm4m_array:(id)a3
{
}

- (NSData)c411_content
{
  return self->_c411_content;
}

- (void)setC411_content:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)generateDiavloRequest:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_187E97000, v0, v1, "tss request=%@", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)tssSerializeRequest
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [a2 localizedDescription];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl( &dword_187E97000,  a3,  OS_LOG_TYPE_ERROR,  "Failed to serialize %@ with error %@",  (uint8_t *)&v6,  0x16u);

  OUTLINED_FUNCTION_1_1();
}

@end