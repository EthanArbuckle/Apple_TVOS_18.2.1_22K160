@interface NEIKEv2IdentifierPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
@end

@implementation NEIKEv2IdentifierPayload

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self) {
    id Property = objc_getProperty(self, v9, 24LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v7 appendPrettyObject:Property withName:@"Identifier" andIndent:v5 options:a4];
  return v7;
}

- (id)description
{
  return -[NEIKEv2IdentifierPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (BOOL)hasRequiredFields
{
  if (self) {
    self = (NEIKEv2IdentifierPayload *)objc_getProperty(self, a2, 24LL, 1);
  }
  return self != 0LL;
}

- (BOOL)generatePayloadData
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  if (self)
  {
    if (objc_getProperty(self, a2, 16LL, 1)) {
      goto LABEL_3;
    }
    if (-[NEIKEv2IdentifierPayload hasRequiredFields](self, "hasRequiredFields"))
    {
      int v57 = objc_msgSend(objc_getProperty(self, v6, 24, 1), "identifierType");
      id Property = objc_getProperty(self, v7, 24LL, 1);
      goto LABEL_7;
    }

- (BOOL)parsePayloadData
{
  *(void *)&v20[5] = *MEMORY[0x1895F89C0];
  if (!self || !objc_getProperty(self, a2, 16LL, 1))
  {
    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)uint64_t v20 = "-[NEIKEv2IdentifierPayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_16;
    }

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"ID";
}

@end