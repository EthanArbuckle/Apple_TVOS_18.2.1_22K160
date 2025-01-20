@interface NEIKEv2AuthPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
- (void)setAuthProtocol:(uint64_t)a1;
- (void)setAuthenticationData:(uint64_t)a1;
@end

@implementation NEIKEv2AuthPayload

- (unint64_t)type
{
  return 39LL;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self)
  {
    [v7 appendPrettyObject:self->_authProtocol withName:@"Authentication Protocol" andIndent:v5 options:a4];
    authenticationData = self->_authenticationData;
  }

  else
  {
    [v7 appendPrettyObject:0 withName:@"Authentication Protocol" andIndent:v5 options:a4];
    authenticationData = 0LL;
  }

  [v7 appendPrettyObject:authenticationData withName:@"Authentication Data" andIndent:v5 options:a4];
  return v7;
}

- (id)description
{
  return -[NEIKEv2AuthPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (BOOL)hasRequiredFields
{
  v2 = self;
  if (self)
  {
    v3 = self->_authenticationData;
    if (v3)
    {
      v4 = v3;
      authProtocol = v2->_authProtocol;
      if (authProtocol)
      {
        v6 = authProtocol;
        LOBYTE(v2) = -[NEIKEv2AuthenticationProtocol method](v6, "method") != 0;
      }

      else
      {
        LOBYTE(v2) = 0;
      }
    }

    else
    {
      LOBYTE(v2) = 0;
    }
  }

  return (char)v2;
}

- (BOOL)generatePayloadData
{
  if (self)
  {
    if (objc_getProperty(self, a2, 16LL, 1)) {
      goto LABEL_7;
    }
    if (-[NEIKEv2AuthPayload hasRequiredFields](self, "hasRequiredFields"))
    {
      int v13 = 0;
      char v4 = -[NEIKEv2AuthenticationProtocol method](self->_authProtocol, "method");
      authenticationData = self->_authenticationData;
LABEL_5:
      LOBYTE(v13) = v4;
      v6 = authenticationData;
      uint64_t v7 = -[NSData length](v6, "length") + 4;
      v8 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:v7];
      [v8 appendBytes:&v13 length:4];
      [v8 appendData:v6];

      if (!self)
      {

        id Property = 0LL;
        return Property != 0LL;
      }

      objc_setProperty_atomic(self, v9, v8, 16LL);

LABEL_7:
      id Property = objc_getProperty(self, v3, 16LL, 1);
      return Property != 0LL;
    }
  }

  else if ([0 hasRequiredFields])
  {
    char v4 = 0;
    authenticationData = 0LL;
    int v13 = 0;
    goto LABEL_5;
  }

  ne_log_obj();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1876B1000, v12, OS_LOG_TYPE_ERROR, "Auth payload missing required fields", buf, 2u);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (self && objc_getProperty(self, a2, 16LL, 1))
  {
    int v17 = 0;
    if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") > 3)
    {
      objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v17, 4);
      if (objc_msgSend(objc_getProperty(self, v7, 16, 1), "length") == 4)
      {
        ne_log_obj();
        uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        String = (__CFString *)NEIKEv2AuthenticationMethodCreateString(v17);
        *(_DWORD *)buf = 138412290;
        v19 = (const char *)String;
        v10 = "Auth payload with method %@ does not have any data";
      }

      else
      {
        id v11 = objc_getProperty(self, v8, 16LL, 1);
        id v13 = objc_getProperty(self, v12, 16LL, 1);
        objc_msgSend(v11, "subdataWithRange:", 4, objc_msgSend(v13, "length") - 4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[NEIKEv2AuthPayload setAuthenticationData:]((uint64_t)self, v14);
        v15 = +[NEIKEv2Crypto copyAuthenticationProtocolForAuthMethod:authData:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v17,  self->_authenticationData);
        objc_storeStrong((id *)&self->_authProtocol, v15);

        if (self->_authProtocol) {
          return -[NEIKEv2AuthPayload hasRequiredFields](self, "hasRequiredFields");
        }
        ne_log_obj();
        uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        String = (__CFString *)NEIKEv2AuthenticationMethodCreateString(v17);
        *(_DWORD *)buf = 138412290;
        v19 = (const char *)String;
        v10 = "Failed to parse authentication protocol for method %@";
      }

      _os_log_error_impl(&dword_1876B1000, v5, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);

      goto LABEL_15;
    }

    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[NEIKEv2AuthPayload parsePayloadData]";
      v6 = "%s called with null (self.payloadData.length >= sizeof(header))";
LABEL_8:
      _os_log_fault_impl(&dword_1876B1000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
    }
  }

  else
  {
    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[NEIKEv2AuthPayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_8;
    }
  }

- (void).cxx_destruct
{
}

- (void)setAuthenticationData:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setAuthProtocol:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

+ (id)copyTypeDescription
{
  return @"Auth";
}

@end