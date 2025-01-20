@interface NEFilterBrowserFlow
+ (BOOL)supportsSecureCoding;
- (BOOL)createDataCompleteReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7;
- (BOOL)createDataReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7;
- (BOOL)createDropReply:(void *)a3 verdict:(void *)a4 context:;
- (BOOL)createNewFlowReply:(id)a3 controlSocket:(int)a4 verdict:(id)a5 context:(id)a6;
- (NEFilterBrowserFlow)initWithCoder:(id)a3;
- (NSURL)parentURL;
- (NSURLRequest)request;
- (NSURLResponse)response;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setParentURL:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation NEFilterBrowserFlow

- (NEFilterBrowserFlow)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEFilterBrowserFlow;
  v5 = -[NEFilterFlow initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ParentURL"];
    parentURL = v5->_parentURL;
    v5->_parentURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URLRequest"];
    request = v5->_request;
    v5->_request = (NSURLRequest *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URLResponse"];
    response = v5->_response;
    v5->_response = (NSURLResponse *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEFilterBrowserFlow;
  id v4 = a3;
  -[NEFilterFlow encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  v5 = -[NEFilterBrowserFlow parentURL](self, "parentURL", v8.receiver, v8.super_class);
  [v4 encodeObject:v5 forKey:@"ParentURL"];

  -[NEFilterBrowserFlow request](self, "request");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"URLRequest"];
  v7 = -[NEFilterBrowserFlow response](self, "response");
  [v4 encodeObject:v7 forKey:@"URLResponse"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEFilterBrowserFlow;
  id v4 = -[NEFilterFlow copyWithZone:](&v12, sel_copyWithZone_, a3);
  uint64_t v5 = -[NEFilterBrowserFlow parentURL](self, "parentURL");
  uint64_t v6 = (void *)v4[21];
  v4[21] = v5;

  uint64_t v7 = -[NEFilterBrowserFlow request](self, "request");
  objc_super v8 = (void *)v4[19];
  v4[19] = v7;

  uint64_t v9 = -[NEFilterBrowserFlow response](self, "response");
  uint64_t v10 = (void *)v4[20];
  v4[20] = v9;

  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEFilterBrowserFlow;
  -[NEFilterFlow descriptionWithIndent:options:](&v13, sel_descriptionWithIndent_options_);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterBrowserFlow parentURL](self, "parentURL");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 host];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  a4 |= 1uLL;
  [v7 appendPrettyObject:v9 withName:@"parentHostname" andIndent:v5 options:a4];

  -[NEFilterBrowserFlow request](self, "request");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"request" andIndent:v5 options:a4];
  v11 = -[NEFilterBrowserFlow response](self, "response");
  [v7 appendPrettyObject:v11 withName:@"response" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)createNewFlowReply:(id)a3 controlSocket:(int)a4 verdict:(id)a5 context:(id)a6
{
  id v9 = a3;
  uint64_t v10 = a5;
  id v12 = a6;
  if (v10
    || (+[NEFilterNewFlowVerdict allowVerdict](&OBJC_CLASS___NEFilterNewFlowVerdict, "allowVerdict"),
        (uint64_t v10 = (_BYTE *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    if ((v10[12] & 1) != 0)
    {
      id v14 = objc_getProperty(v10, v11, 32LL, 1);
      int v15 = isa_nsstring(v14);

      if (v15)
      {
        [v12 URLAppendStringMap];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        id v18 = objc_getProperty(v10, v17, 32LL, 1);
        [v16 objectForKeyedSubscript:v18];
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (isa_nsstring(v19))
        {
          v20 = (const char *)[v19 UTF8String];
          if (v20) {
            xpc_dictionary_set_string(v9, "url-append-string", v20);
          }
        }
      }

      xpc_dictionary_set_uint64(v9, "verdict-peek", 0LL);
      xpc_dictionary_set_uint64(v9, "verdict-pass", 0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_12;
    }
  }

  if ([v10 drop])
  {
    BOOL v13 = -[NEFilterBrowserFlow createDropReply:verdict:context:]((BOOL)self, v9, v10, v12);
    goto LABEL_13;
  }

  xpc_dictionary_set_uint64(v9, "verdict-peek", [v10 peekInboundBytes]);
  xpc_dictionary_set_uint64(v9, "verdict-pass", [v10 filterInbound] - 1);
  if ([v10 filterOutbound])
  {
    ne_log_obj();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl( &dword_1876B1000,  v22,  OS_LOG_TYPE_INFO,  "Filtering outbound data is not currently supported for browser flows.",  v25,  2u);
    }
  }

  if (![v10 filterInbound])
  {
LABEL_12:
    BOOL v13 = 1;
    goto LABEL_13;
  }

  v24 = -[NEFilterAbsoluteVerdict initWithDrop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:]( [NEFilterAbsoluteVerdict alloc],  "initWithDrop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:",  0,  0,  [v10 peekInboundBytes],  -1,  0);
  if (self) {
    objc_setProperty_atomic(self, v23, v24, 112LL);
  }

  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)createDataReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  char v15 = -[NEFilterFlow updateCurrentVerdictFromDataVerdict:direction:](self, v12, a5);
  if (self) {
    id Property = objc_getProperty(self, v14, 112LL, 1);
  }
  else {
    id Property = 0LL;
  }
  if ([Property drop])
  {
    char v15 = -[NEFilterBrowserFlow createDropReply:verdict:context:]((BOOL)self, v11, v12, v13);
  }

  else
  {
    id v18 = v11;
    if (self)
    {
      id v19 = objc_getProperty(self, v17, 112LL, 1);
      if (a5 == 2)
      {
        xpc_dictionary_set_uint64(v18, "verdict-peek", [v19 inboundPeekOffset]);
        uint64_t v21 = objc_msgSend(objc_getProperty(self, v20, 112, 1), "inboundPassOffset");
      }

      else
      {
        xpc_dictionary_set_uint64(v18, "verdict-peek", [v19 outboundPeekOffset]);
        uint64_t v21 = objc_msgSend(objc_getProperty(self, v22, 112, 1), "outboundPassOffset");
      }

      xpc_dictionary_set_uint64(v18, "verdict-pass", v21);
    }
  }

  return v15;
}

- (BOOL)createDataCompleteReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if ([v13 drop])
  {
    id v15 = v13;
  }

  else
  {
    +[NEFilterDataVerdict allowVerdict](&OBJC_CLASS___NEFilterDataVerdict, "allowVerdict");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }

  v16 = v15;
  BOOL v17 = -[NEFilterBrowserFlow createDataReply:controlSocket:direction:verdict:context:]( self,  "createDataReply:controlSocket:direction:verdict:context:",  v12,  v10,  a5,  v15,  v14);
  char v18 = [v16 drop] ^ 1 | v17;

  return v18;
}

- (NSURLRequest)request
{
  return (NSURLRequest *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setRequest:(id)a3
{
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setResponse:(id)a3
{
}

- (NSURL)parentURL
{
  return (NSURL *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setParentURL:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)createDropReply:(void *)a3 verdict:(void *)a4 context:
{
  id v7 = a2;
  objc_super v8 = a3;
  id v9 = a4;
  if (a1)
  {
    xpc_dictionary_set_BOOL(v7, "verdict-drop", 1);
    [v9 _principalObject];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 filterConfiguration];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 organization];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      [v10 filterConfiguration];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      id v15 = [v14 organization];
      v16 = (const char *)[v15 UTF8String];

      if (v16) {
        xpc_dictionary_set_string(v7, "organization", v16);
      }
    }

    if (!v8 || (v8[11] & 1) == 0)
    {
      a1 = 1LL;
LABEL_56:

      goto LABEL_57;
    }

    objc_getProperty(v8, v13, 16LL, 1);
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = isa_nsstring(v17);

    if (!v18)
    {
      a1 = 0LL;
      v33 = "x-apple-content-filter://nefilter-unblock";
LABEL_42:
      objc_getProperty(v8, v19, 24LL, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      int v57 = isa_nsstring(v56);

      if (v57)
      {
        [v9 remediationMap];
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        [v58 objectForKeyedSubscript:NEFilterProviderRemediationMapRemediationButtonTexts];
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        if (isa_nsdictionary(v59))
        {
          objc_getProperty(v8, v60, 24LL, 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          [v59 objectForKeyedSubscript:v61];
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          id v63 = v62;
          if ((isa_nsstring(v63) & 1) != 0)
          {
            [MEMORY[0x189607810] alphanumericCharacterSet];
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            [v63 stringByAddingPercentEncodingWithAllowedCharacters:v64];
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            [v65 stringByReplacingOccurrencesOfString:@"%20" withString:@" "];
            id v81 = (id)objc_claimAutoreleasedReturnValue();

            v66 = "Request Access";
            if (v81)
            {
              id v67 = v81;
              uint64_t v68 = [v67 UTF8String];
              if (v68) {
                v66 = (const char *)v68;
              }
            }

            else
            {
              id v67 = 0LL;
            }
          }

          else
          {

            id v67 = 0LL;
            v66 = "Request Access";
          }
        }

        else
        {
          v66 = "Request Access";
        }
      }

      else
      {
        v66 = "Request Access";
      }

      xpc_dictionary_set_string(v7, "remediation-url", v33);
      xpc_dictionary_set_string(v7, "remediation-button-text", v66);
      goto LABEL_56;
    }

    [v9 remediationMap];
    SEL v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 objectForKeyedSubscript:NEFilterProviderRemediationMapRemediationURLs];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!isa_nsdictionary(v21))
    {
      a1 = 0LL;
      v33 = "x-apple-content-filter://nefilter-unblock";
LABEL_41:

      goto LABEL_42;
    }

    objc_getProperty(v8, v22, 16LL, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 objectForKeyedSubscript:v23];
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 filterConfiguration];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    id v26 = v24;
    id v27 = (id)a1;
    id v28 = v25;
    id v80 = v27;
    if (!isa_nsstring(v26))
    {
      id v34 = 0LL;
LABEL_35:

      v33 = "x-apple-content-filter://nefilter-unblock";
      if (v34)
      {
        uint64_t v55 = [v34 UTF8String];
        a1 = v55 != 0;
        if (v55) {
          v33 = (const char *)v55;
        }
      }

      else
      {
        a1 = 0LL;
      }

      goto LABEL_41;
    }

    v78 = v21;
    uint64_t v29 = [v26 mutableCopy];
    [v27 URL];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)v29;
    if (v30)
    {
      [v27 URL];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 absoluteString];
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v32 = &stru_18A0915E8;
    }

    v77 = v32;
    v35 = (void *)-[__CFString mutableCopy](v32, "mutableCopy");
    [v27 URL];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 scheme];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v35,  "replaceOccurrencesOfString:withString:options:range:",  v37,  &stru_18A0915E8,  0,  0,  objc_msgSend(v35, "length"));

    objc_msgSend( v35,  "replaceOccurrencesOfString:withString:options:range:",  @"://",  &stru_18A0915E8,  0,  0,  objc_msgSend(v35, "length"));
    v76 = v35;
    objc_msgSend( v72,  "replaceOccurrencesOfString:withString:options:range:",  @"NE_FLOW_URL",  v35,  0,  0,  objc_msgSend(v72, "length"));
    [v27 URL];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 host];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      [v27 URL];
      id v40 = v28;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v41 host];
      v42 = (const __CFString *)objc_claimAutoreleasedReturnValue();

      id v28 = v40;
    }

    else
    {
      v42 = &stru_18A0915E8;
    }

    objc_msgSend( v72,  "replaceOccurrencesOfString:withString:options:range:",  @"NE_FLOW_HOSTNAME",  v42,  0,  0,  objc_msgSend(v72, "length"));
    [v28 organization];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      [v28 organization];
      v44 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v44 = &stru_18A0915E8;
    }

    objc_msgSend( v72,  "replaceOccurrencesOfString:withString:options:range:",  @"NE_ORGANIZATION",  v44,  0,  0,  objc_msgSend(v72, "length"));
    [v28 username];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    id v79 = v28;
    v74 = (__CFString *)v42;
    v75 = (__CFString *)v44;
    if (v45)
    {
      [v28 username];
      v46 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v46 = &stru_18A0915E8;
    }

    v73 = (__CFString *)v46;
    objc_msgSend( v72,  "replaceOccurrencesOfString:withString:options:range:",  @"NE_USERNAME",  v46,  0,  0,  objc_msgSend(v72, "length"));
    [MEMORY[0x189607810] URLQueryAllowedCharacterSet];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    [v72 stringByAddingPercentEncodingWithAllowedCharacters:v47];
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189604030] URLWithString:v48];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (v49)
    {
      [v49 scheme];
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      [v51 lowercaseString];
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v52 isEqualToString:@"http"])
      {

LABEL_30:
        id v34 = v48;
LABEL_34:

        id v28 = v79;
        uint64_t v21 = v78;
        goto LABEL_35;
      }

      [v50 scheme];
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      [v70 lowercaseString];
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      char v71 = [v53 isEqualToString:@"https"];

      if ((v71 & 1) != 0) {
        goto LABEL_30;
      }
    }

    ne_log_obj();
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1876B1000, v54, OS_LOG_TYPE_ERROR, "URL is not http or https", buf, 2u);
    }

    id v34 = 0LL;
    goto LABEL_34;
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end