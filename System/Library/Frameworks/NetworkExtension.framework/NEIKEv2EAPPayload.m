@interface NEIKEv2EAPPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2EAPPayload

- (unint64_t)type
{
  return 48LL;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self && objc_getProperty(self, v9, 24LL, 1))
  {
    id Property = objc_getProperty(self, v10, 24LL, 1);
    int v12 = +[NEIKEv2EAP typeForPayload:]((uint64_t)&OBJC_CLASS___NEIKEv2EAP, Property);
    if (v12)
    {
      int v13 = v12;
      if (!EAPClientModuleLookup()) {
        +[NEIKEv2EAP loadModuleForType:]((uint64_t)&OBJC_CLASS___NEIKEv2EAP, v13);
      }
    }

    CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
    objc_msgSend(objc_getProperty(self, v15, 24, 1), "bytes");
    objc_msgSend(objc_getProperty(self, v16, 24, 1), "length");
    EAPPacketIsValid();
    [v7 appendPrettyObject:Mutable withName:@"EAP Message" andIndent:v5 options:a4];
  }

  return v7;
}

- (id)description
{
  return -[NEIKEv2EAPPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (BOOL)hasRequiredFields
{
  if (self) {
    self = (NEIKEv2EAPPayload *)objc_getProperty(self, a2, 24LL, 1);
  }
  return self != 0LL;
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

    if (-[NEIKEv2EAPPayload hasRequiredFields](self, "hasRequiredFields"))
    {
      id v5 = objc_getProperty(self, v4, 24LL, 1);
      objc_setProperty_atomic(self, v6, v5, 16LL);

      goto LABEL_5;
    }
  }

  else
  {
    char v9 = [0 hasRequiredFields];
    id Property = 0LL;
    if ((v9 & 1) != 0) {
      return Property != 0LL;
    }
  }

  ne_log_obj();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, "EAP payload missing required fields", v11, 2u);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (self && objc_getProperty(self, a2, 16LL, 1))
  {
    id v4 = objc_getProperty(self, v3, 16LL, 1);
    objc_setProperty_atomic(self, v5, v4, 24LL);

    return -[NEIKEv2EAPPayload hasRequiredFields](self, "hasRequiredFields");
  }

  else
  {
    ne_log_obj();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      char v9 = "-[NEIKEv2EAPPayload parsePayloadData]";
      _os_log_fault_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_FAULT,  "%s called with null self.payloadData",  (uint8_t *)&v8,  0xCu);
    }

    return 0;
  }

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"EAP";
}

@end