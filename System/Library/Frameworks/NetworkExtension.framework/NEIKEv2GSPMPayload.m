@interface NEIKEv2GSPMPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
- (void)setGspmData:(uint64_t)a1;
@end

@implementation NEIKEv2GSPMPayload

- (unint64_t)type
{
  return 49LL;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self) {
    gspmData = self->_gspmData;
  }
  else {
    gspmData = 0LL;
  }
  [v7 appendPrettyObject:gspmData withName:@"GSPM Data" andIndent:v5 options:a4];
  return v7;
}

- (id)description
{
  return -[NEIKEv2GSPMPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (BOOL)hasRequiredFields
{
  if (self) {
    gspmData = self->_gspmData;
  }
  else {
    gspmData = 0LL;
  }
  return gspmData != 0LL;
}

- (BOOL)generatePayloadData
{
  if (self)
  {
    if (objc_getProperty(self, a2, 16LL, 1))
    {
LABEL_5:
      id Property = objc_getProperty(self, v3, 16LL, 1);
      return Property != 0LL;
    }

    if (-[NEIKEv2GSPMPayload hasRequiredFields](self, "hasRequiredFields"))
    {
      v4 = self->_gspmData;
      objc_setProperty_atomic(self, v5, v4, 16LL);

      goto LABEL_5;
    }
  }

  else
  {
    char v8 = [0 hasRequiredFields];
    id Property = 0LL;
    if ((v8 & 1) != 0) {
      return Property != 0LL;
    }
  }

  ne_log_obj();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_error_impl(&dword_1876B1000, v9, OS_LOG_TYPE_ERROR, "GSPM payload missing required fields", v10, 2u);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (self && objc_getProperty(self, a2, 16LL, 1))
  {
    id Property = objc_getProperty(self, v3, 16LL, 1);
    objc_storeStrong((id *)&self->_gspmData, Property);
    return -[NEIKEv2GSPMPayload hasRequiredFields](self, "hasRequiredFields");
  }

  else
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136315138;
      char v8 = "-[NEIKEv2GSPMPayload parsePayloadData]";
      _os_log_fault_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_FAULT,  "%s called with null self.payloadData",  (uint8_t *)&v7,  0xCu);
    }

    return 0;
  }

- (void).cxx_destruct
{
}

- (void)setGspmData:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

+ (id)copyTypeDescription
{
  return @"GSPM";
}

@end