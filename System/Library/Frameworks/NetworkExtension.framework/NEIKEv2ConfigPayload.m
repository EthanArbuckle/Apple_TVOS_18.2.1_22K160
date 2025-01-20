@interface NEIKEv2ConfigPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)createConfigAttributeFromData:(void *)a3 attributeName:(unsigned int)a4 attributeLen:(uint64_t)a5 attributeType:(uint64_t)a6 customType:;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2ConfigPayload

- (unint64_t)type
{
  return 47LL;
}

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
  [v7 appendPrettyObject:Property withName:@"Configuration" andIndent:v5 options:a4];
  return v7;
}

- (id)description
{
  return -[NEIKEv2ConfigPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (BOOL)hasRequiredFields
{
  if (self)
  {
    self = (NEIKEv2ConfigPayload *)objc_getProperty(self, a2, 24LL, 1);
    if (self) {
      LOBYTE(self) = *(void *)&self->super._isInbound != 0LL;
    }
  }

  return (char)self;
}

- (BOOL)generatePayloadData
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  if (self && objc_getProperty(self, a2, 16LL, 1))
  {
LABEL_71:
    id Property = objc_getProperty(self, v3, 16LL, 1);
    return Property != 0LL;
  }

  if (!-[NEIKEv2ConfigPayload hasRequiredFields](self, "hasRequiredFields"))
  {
    ne_log_obj();
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v69 = self;
      _os_log_fault_impl( &dword_1876B1000,  v43,  OS_LOG_TYPE_FAULT,  "Configuration payload missing required fields %@",  buf,  0xCu);
    }

    return 0;
  }

  id v5 = objc_alloc(MEMORY[0x189603FA8]);
  v6 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
  if (self)
  {
    id v7 = objc_getProperty(self, v4, 24LL, 1);
    if (v7) {
      id v7 = objc_getProperty(v7, v8, 16LL, 1);
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v9 = v7;
  v10 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v9, "count"));

  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  if (self)
  {
    id v12 = objc_getProperty(self, v11, 24LL, 1);
    if (v12) {
      id v12 = objc_getProperty(v12, v13, 16LL, 1);
    }
  }

  else
  {
    id v12 = 0LL;
  }

  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (!v15)
  {
    uint64_t v18 = 0LL;
    goto LABEL_59;
  }

  unint64_t v17 = v15;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v20 = *(void *)v63;
  *(void *)&__int128 v16 = 138412290LL;
  __int128 v56 = v16;
  for (uint64_t i = *(void *)v63; ; uint64_t i = *(void *)v63)
  {
    if (i != v20) {
      objc_enumerationMutation(v14);
    }
    v22 = *(NEIKEv2ConfigPayload **)(*((void *)&v62 + 1) + 8 * v19);
    if (!-[NEIKEv2ConfigPayload attributeType](v22, "attributeType", v56))
    {
      ne_log_obj();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = v56;
        v69 = v22;
        _os_log_fault_impl(&dword_1876B1000, v25, OS_LOG_TYPE_FAULT, "AttributeType 0 invalid in %@", buf, 0xCu);
      }

      goto LABEL_26;
    }

    if (-[NEIKEv2ConfigPayload valueType](v22, "valueType") == 5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = -[NEIKEv2ConfigPayload stringValue](v22, "stringValue");
        if (v23)
        {
          v24 = -[NEIKEv2ConfigPayload stringValue](v22, "stringValue");
          [v24 dataUsingEncoding:4];
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 0;
          unsigned int v26 = -[NEIKEv2ConfigPayload attributeType](v22, "attributeType");
          unsigned int v27 = -[os_log_s length](v25, "length");
          *(_WORD *)buf = bswap32(v26) >> 16;
          *(_WORD *)&buf[2] = bswap32(v27) >> 16;
          uint64_t v28 = -[os_log_s length](v25, "length") + 4;
          v18 += v28;
          v29 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:v28];
          [v29 appendBytes:buf length:4];
          [v29 appendData:v25];
          [v10 addObject:v29];

LABEL_26:
          goto LABEL_50;
        }

- (BOOL)parsePayloadData
{
  *(void *)&v38[5] = *MEMORY[0x1895F89C0];
  if (!self || !objc_getProperty(self, a2, 16LL, 1))
  {
    ne_log_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)unsigned int v38 = "-[NEIKEv2ConfigPayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_26;
    }

- (void).cxx_destruct
{
}

- (id)createConfigAttributeFromData:(void *)a3 attributeName:(unsigned int)a4 attributeLen:(uint64_t)a5 attributeType:(uint64_t)a6 customType:
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v11 = a2;
  id v12 = a3;
  if (a1)
  {
    switch(a5)
    {
      case 1LL:
      case 2LL:
      case 3LL:
      case 6LL:
      case 20LL:
        *(_DWORD *)&v32[12] = 0;
        *(void *)&v32[4] = 0LL;
        *(_DWORD *)id v32 = 528;
        if (a4 == 4) {
          *(_DWORD *)&v32[4] = *(_DWORD *)objc_msgSend(v11, "bytes", *(_OWORD *)v32);
        }
        id v13 = 0LL;
        switch(a5)
        {
          case 1LL:
          case 2LL:
          case 3LL:
          case 6LL:
            goto LABEL_34;
          case 4LL:
          case 5LL:
            break;
          default:
            if (a5 == 20) {
LABEL_34:
            }
              id v13 = (objc_class *)objc_opt_class();
            break;
        }

        id v22 = objc_alloc(v13);
        [MEMORY[0x189608DE8] endpointWithAddress:v32];
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (a6) {
          uint64_t v24 = [v22 initCustomWithAttributeType:a6 attributeName:v12 addressValue:v23];
        }
        else {
          uint64_t v24 = [v22 initWithAddress:v23];
        }
        unsigned int v18 = (void *)v24;

        break;
      case 4LL:
      case 5LL:
      case 9LL:
      case 11LL:
      case 16LL:
      case 17LL:
      case 18LL:
      case 19LL:
      case 22LL:
      case 23LL:
      case 24LL:
        goto LABEL_24;
      case 7LL:
      case 14LL:
      case 25LL:
        SEL v14 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithBytes:length:encoding:",  objc_msgSend(v11, "bytes"),  a4,  4);
        if (a5 == 25 || a5 == 14 || a5 == 7) {
          uint64_t v26 = (objc_class *)objc_opt_class();
        }
        else {
          uint64_t v26 = 0LL;
        }
        uint64_t v21 = [[v26 alloc] initWithStringValue:v14];
        goto LABEL_46;
      case 8LL:
      case 15LL:
        memset(&v32[4], 0, 24);
        *(_DWORD *)id v32 = 7708;
        if (a4 == 16)
        {
          uint64_t v16 = 0LL;
          *(_OWORD *)&v32[8] = *(_OWORD *)objc_msgSend( v11,  "bytes",  *(void *)v32,  *(void *)&v32[8],  *(void *)&v32[16],  *(void *)&v32[24]);
        }

        else if (a4 == 17)
        {
          *(_OWORD *)&v32[8] = *(_OWORD *)objc_msgSend( v11,  "bytes",  *(void *)v32,  *(void *)&v32[8],  *(void *)&v32[16],  *(void *)&v32[24]);
          uint64_t v16 = *(unsigned __int8 *)([v11 bytes] + 16);
        }

        else
        {
          uint64_t v16 = 0LL;
        }

        [MEMORY[0x189608DE8] endpointWithAddress:v32];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (a5 == 8 || a5 == 15) {
          v29 = (objc_class *)objc_opt_class();
        }
        else {
          v29 = 0LL;
        }
        id v30 = objc_alloc(v29);
        if (a6) {
          uint64_t v31 = [v30 initCustomWithAttributeType:a6 attributeName:v12 addressValue:v28 prefix:v16];
        }
        else {
          uint64_t v31 = [v30 initWithAddress:v28 prefix:v16];
        }
        unsigned int v18 = (void *)v31;

        break;
      case 10LL:
      case 12LL:
      case 21LL:
        goto LABEL_11;
      case 13LL:
        uint64_t v19 = 0LL;
        *(_DWORD *)&v32[12] = 0;
        *(void *)&v32[4] = 0LL;
        *(_DWORD *)id v32 = 528;
        if (a4 == 8)
        {
          *(_DWORD *)&v32[4] = *(_DWORD *)objc_msgSend(v11, "bytes", *(void *)v32, *(void *)&v32[8]);
          uint64_t v19 = *(unsigned int *)([v11 bytes] + 4);
        }

        __int128 v20 = objc_alloc(&OBJC_CLASS___NEIKEv2IPv4SubnetAttribute);
        [MEMORY[0x189608DE8] endpointWithAddress:v32];
        SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (a6) {
          uint64_t v21 = -[NEIKEv2SubnetAttribute initCustomWithAttributeType:attributeName:addressValue:ipv4SubnetMask:]( v20,  "initCustomWithAttributeType:attributeName:addressValue:ipv4SubnetMask:",  a6,  v12,  v14,  v19);
        }
        else {
          uint64_t v21 = -[NEIKEv2SubnetAttribute initWithAddress:ipv4SubnetMask:]( v20,  "initWithAddress:ipv4SubnetMask:",  v14,  v19);
        }
        goto LABEL_46;
      default:
        if ((unint64_t)(a5 - 25958) >= 2)
        {
LABEL_24:
          ne_log_obj();
          SEL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id v32 = 67109376;
            *(_DWORD *)&v32[4] = (unsigned __int16)a5;
            *(_WORD *)&v32[8] = 1024;
            *(_DWORD *)&v32[10] = a4;
            _os_log_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_INFO,  "Received unknown attribute of type %u length %u",  v32,  0xEu);
          }

          goto LABEL_27;
        }

+ (id)copyTypeDescription
{
  return @"CONFIG";
}

@end