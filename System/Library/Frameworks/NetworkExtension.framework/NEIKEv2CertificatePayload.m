@interface NEIKEv2CertificatePayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2CertificatePayload

- (unint64_t)type
{
  return 37LL;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend( v7,  "appendPrettyObject:withName:andIndent:options:",  objc_getProperty(self, v9, 32, 1),  @"Certificate Data",  v5,  a4);
    uint64_t encoding = self->_encoding;
  }

  else
  {
    [v7 appendPrettyObject:0 withName:@"Certificate Data" andIndent:v5 options:a4];
    uint64_t encoding = 0LL;
  }

  [v7 appendPrettyInt:encoding withName:@"Encoding" andIndent:v5 options:a4];
  return v7;
}

- (id)description
{
  return -[NEIKEv2CertificatePayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (BOOL)hasRequiredFields
{
  v2 = self;
  if (self)
  {
    id v3 = objc_getProperty(self, a2, 32LL, 1);
    if (v3)
    {
      LOBYTE(v2) = v2->_encoding != 0;
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
    if (-[NEIKEv2CertificatePayload hasRequiredFields](self, "hasRequiredFields"))
    {
      char encoding = self->_encoding;
      id Property = objc_getProperty(self, v4, 32LL, 1);
LABEL_5:
      id v6 = Property;
      uint64_t v7 = [v6 length] + 1;
      v8 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:v7];
      [v8 appendBytes:&encoding length:1];
      [v8 appendData:v6];

      if (!self)
      {

        id v10 = 0LL;
        return v10 != 0LL;
      }

      objc_setProperty_atomic(self, v9, v8, 16LL);

LABEL_7:
      id v10 = objc_getProperty(self, v3, 16LL, 1);
      return v10 != 0LL;
    }
  }

  else if ([0 hasRequiredFields])
  {
    id Property = 0LL;
    char encoding = 0;
    goto LABEL_5;
  }

  ne_log_obj();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1876B1000, v12, OS_LOG_TYPE_ERROR, "Certificate payload missing required fields", buf, 2u);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!self || !objc_getProperty(self, a2, 16LL, 1))
  {
    ne_log_obj();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v14 = 136315138;
    v15 = "-[NEIKEv2CertificatePayload parsePayloadData]";
    v13 = "%s called with null self.payloadData";
LABEL_11:
    _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v14, 0xCu);
    goto LABEL_8;
  }

  if (objc_msgSend(objc_getProperty(self, v3, 16, 1), "length"))
  {
    LOBYTE(v14) = 0;
    objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v14, 1);
    self->_char encoding = v14;
    id v6 = objc_getProperty(self, v5, 16LL, 1);
    id v8 = objc_getProperty(self, v7, 16LL, 1);
    objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v8, "length") - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_setProperty_atomic(self, v10, v9, 32LL);
    return -[NEIKEv2CertificatePayload hasRequiredFields](self, "hasRequiredFields");
  }

  ne_log_obj();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    int v14 = 136315138;
    v15 = "-[NEIKEv2CertificatePayload parsePayloadData]";
    v13 = "%s called with null (self.payloadData.length >= sizeof(ikev2_payload_cert_hdr_t))";
    goto LABEL_11;
  }

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"CERT";
}

@end