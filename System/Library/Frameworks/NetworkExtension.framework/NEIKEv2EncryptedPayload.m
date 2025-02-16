@interface NEIKEv2EncryptedPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2EncryptedPayload

- (unint64_t)type
{
  return 46LL;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v6 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  v7 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v6 appendPrettyObject:v7 withName:@"Payload Type" andIndent:v5 options:a4];

  return v6;
}

- (id)description
{
  return -[NEIKEv2EncryptedPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (BOOL)hasRequiredFields
{
  if (self) {
    self = (NEIKEv2EncryptedPayload *)objc_getProperty(self, a2, 16LL, 1);
  }
  return self != 0LL;
}

- (BOOL)generatePayloadData
{
  if (self) {
    self = (NEIKEv2EncryptedPayload *)objc_getProperty(self, a2, 16LL, 1);
  }
  return self != 0LL;
}

- (BOOL)parsePayloadData
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (self && objc_getProperty(self, a2, 16LL, 1)) {
    return -[NEIKEv2EncryptedPayload hasRequiredFields](self, "hasRequiredFields");
  }
  ne_log_obj();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315138;
    v6 = "-[NEIKEv2EncryptedPayload parsePayloadData]";
    _os_log_fault_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_FAULT,  "%s called with null self.payloadData",  (uint8_t *)&v5,  0xCu);
  }

  return 0;
}

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"Encrypted";
}

@end