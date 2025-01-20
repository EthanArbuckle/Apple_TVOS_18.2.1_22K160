@interface NEIKEv2KeyExchangePayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2KeyExchangePayload

- (unint64_t)type
{
  return 34LL;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend( v7,  "appendPrettyObject:withName:andIndent:options:",  objc_getProperty(self, v9, 24, 1),  @"Method",  v5,  a4);
    id Property = objc_getProperty(self, v10, 32LL, 1);
  }

  else
  {
    [v7 appendPrettyObject:0 withName:@"Method" andIndent:v5 options:a4];
    id Property = 0LL;
  }

  [v7 appendPrettyObject:Property withName:@"Data" andIndent:v5 options:a4];
  return v7;
}

- (id)description
{
  return -[NEIKEv2KeyExchangePayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (BOOL)hasRequiredFields
{
  v2 = self;
  if (self)
  {
    id v3 = objc_getProperty(self, a2, 24LL, 1);
    if (v3)
    {
      uint64_t v5 = v3;
      LOBYTE(v2) = objc_getProperty(v2, v4, 32LL, 1) != 0LL;
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
    if (-[NEIKEv2KeyExchangePayload hasRequiredFields](self, "hasRequiredFields"))
    {
      __int16 v16 = 0;
      __int16 v15 = bswap32(objc_msgSend(objc_getProperty(self, v4, 24, 1), "method")) >> 16;
      id Property = objc_getProperty(self, v5, 32LL, 1);
LABEL_5:
      uint64_t v7 = [Property length] + 4;
      v8 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:v7];
      [v8 appendBytes:&v15 length:4];
      if (!self)
      {
        [v8 appendData:0];

        id v11 = 0LL;
        return v11 != 0LL;
      }

      objc_msgSend(v8, "appendData:", objc_getProperty(self, v9, 32, 1));
      objc_setProperty_atomic(self, v10, v8, 16LL);

LABEL_7:
      id v11 = objc_getProperty(self, v3, 16LL, 1);
      return v11 != 0LL;
    }
  }

  else if ([0 hasRequiredFields])
  {
    __int16 v16 = 0;
    unsigned int v13 = [0 method];
    id Property = 0LL;
    __int16 v15 = bswap32(v13) >> 16;
    goto LABEL_5;
  }

  ne_log_obj();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1876B1000, v14, OS_LOG_TYPE_ERROR, "KE payload missing required fields", buf, 2u);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!self || !objc_getProperty(self, a2, 16LL, 1))
  {
    ne_log_obj();
    SEL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136315138;
      v18 = "-[NEIKEv2KeyExchangePayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_11;
    }

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"KE";
}

@end