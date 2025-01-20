@interface NEIKEv2DeletePayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2DeletePayload

- (unint64_t)type
{
  return 42LL;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self)
  {
    [v7 appendPrettyInt:self->_protocol withName:@"Protocol" andIndent:v5 options:a4];
    id Property = objc_getProperty(self, v9, 32LL, 1);
  }

  else
  {
    [v7 appendPrettyInt:0 withName:@"Protocol" andIndent:v5 options:a4];
    id Property = 0LL;
  }

  [v7 appendPrettyObject:Property withName:@"SPIs" andIndent:v5 options:a4];
  return v7;
}

- (id)description
{
  return -[NEIKEv2DeletePayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (BOOL)hasRequiredFields
{
  if (self) {
    LOBYTE(self) = self->_protocol != 0;
  }
  return (char)self;
}

- (BOOL)generatePayloadData
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (self)
  {
    if (objc_getProperty(self, a2, 16LL, 1)) {
      return objc_getProperty(self, v3, 16LL, 1) != 0LL;
    }
    if (-[NEIKEv2DeletePayload hasRequiredFields](self, "hasRequiredFields"))
    {
      int v23 = 0;
      unint64_t protocol = self->_protocol;
      int v23 = protocol;
      if (protocol == 3)
      {
        BYTE1(v23) = 4;
        HIWORD(v23) = bswap32(objc_msgSend(objc_getProperty(self, v5, 32, 1), "count")) >> 16;
        v8 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FB8]),  "initWithCapacity:",  4 * objc_msgSend(objc_getProperty(self, v9, 32, 1), "count") + 4);
        [v8 appendBytes:&v23 length:4];
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        id v11 = objc_getProperty(self, v10, 32LL, 1);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            for (uint64_t i = 0LL; i != v13; ++i)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              *(_DWORD *)buf = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "value", (void)v19);
              [v8 appendBytes:buf length:4];
            }

            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v26 count:16];
          }

          while (v13);
        }

        goto LABEL_16;
      }

      if (protocol == 1)
      {
        BYTE1(v23) = 0;
        HIWORD(v23) = 0;
        v8 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v23 length:4];
LABEL_16:
        objc_setProperty_atomic(self, v7, v8, 16LL);

        return objc_getProperty(self, v3, 16LL, 1) != 0LL;
      }

      goto LABEL_19;
    }

- (BOOL)parsePayloadData
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!self || !objc_getProperty(self, a2, 16LL, 1))
  {
    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v23 = "-[NEIKEv2DeletePayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_23;
    }

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"Delete";
}

@end