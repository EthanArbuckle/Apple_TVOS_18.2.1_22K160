@interface NEIKEv2Payload
+ (id)copyTypeDescription;
+ (os_log_s)createPayloadWithType:(void *)a3 fromData:;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (NEIKEv2Payload)init;
- (id)copyPayloadData;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (uint64_t)isValid;
- (unint64_t)type;
@end

@implementation NEIKEv2Payload

- (NEIKEv2Payload)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEIKEv2Payload;
  v2 = -[NEIKEv2Payload init](&v8, sel_init);
  if (!v2)
  {
    ne_log_obj();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_WORD *)v7 = 0;
    v6 = "[super init] failed";
    goto LABEL_8;
  }

  if (!-[NEIKEv2Payload isMemberOfClass:](v2, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = v2;
    goto LABEL_6;
  }

  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    v6 = "Must use a subclass of NEIKEv2Payload to init";
LABEL_8:
    _os_log_fault_impl(&dword_1876B1000, v3, OS_LOG_TYPE_FAULT, v6, v7, 2u);
  }

- (unint64_t)type
{
  return 0LL;
}

- (BOOL)hasRequiredFields
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_error_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_ERROR,  "Cannot check for required fields on generic payload %@",  (uint8_t *)&v5,  0xCu);
  }

  return 0;
}

- (BOOL)generatePayloadData
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_error_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_ERROR,  "Cannot generate payload data for %@",  (uint8_t *)&v5,  0xCu);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_error_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_ERROR,  "Cannot parse payload data for %@",  (uint8_t *)&v5,  0xCu);
  }

  return 0;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v6 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  uint64_t v7 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v6 appendPrettyObject:v7 withName:@"Payload Type" andIndent:v5 options:a4];

  return v6;
}

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"Invalid";
}

- (uint64_t)isValid
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  if ((*(_BYTE *)(result + 8) & 1) != 0)
  {
    if (([(id)result hasRequiredFields] & 1) == 0) {
      goto LABEL_4;
    }
    return 1LL;
  }

  if ([(id)result generatePayloadData]) {
    return 1LL;
  }
LABEL_4:
  ne_log_obj();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    uint64_t v4 = v1;
    _os_log_error_impl(&dword_1876B1000, v2, OS_LOG_TYPE_ERROR, "Failed to validate %@", (uint8_t *)&v3, 0xCu);
  }

  return 0LL;
}

+ (os_log_s)createPayloadWithType:(void *)a3 fromData:
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_opt_self();
  uint64_t v5 = off_18A087A78;
  switch(a2)
  {
    case '!':
      if ((unint64_t)[v4 length] <= 7)
      {
        ne_log_obj();
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        int v17 = 67109120;
        LODWORD(v18) = [v4 length];
        uint64_t v7 = "Failed to parse SA, length %u";
        goto LABEL_39;
      }

      uint64_t v13 = [v4 bytes];
      int v14 = *(unsigned __int8 *)(v13 + 5);
      if (v14 == 1)
      {
        uint64_t v5 = off_18A087AD8;
        goto LABEL_25;
      }

      if (v14 == 3)
      {
        uint64_t v5 = off_18A0879E8;
        goto LABEL_25;
      }

      uint64_t v15 = v13;
      ne_log_obj();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v16 = *(unsigned __int8 *)(v15 + 5);
        int v17 = 67109120;
        LODWORD(v18) = v16;
        uint64_t v7 = "Failed to parse unknown SA type %u";
LABEL_39:
        _os_log_error_impl(&dword_1876B1000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v17, 8u);
      }

- (id)copyPayloadData
{
  else {
    return 0LL;
  }
}

@end