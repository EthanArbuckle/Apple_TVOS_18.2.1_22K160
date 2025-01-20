@interface NEIKEv2Identifier
+ (id)copyTypeDescription;
+ (id)createIdentifierWithType:(unint64_t)a3 data:(id)a4;
+ (id)createIdentifierWithType:(unint64_t)a3 data:(id)a4 zone:(_NSZone *)a5;
- (BOOL)isEqual:(id)a3;
- (NSData)identifierData;
- (NSString)stringValue;
- (id)copyShortDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)identifierType;
- (void)setIdentifierData:(id)a3;
@end

@implementation NEIKEv2Identifier

- (id)copyShortDescription
{
  v3 = (void *)[(id)objc_opt_class() copyTypeDescription];
  if (-[NEIKEv2Identifier identifierType](self, "identifierType") == 13)
  {
    id v4 = v3;
  }

  else
  {
    v5 = -[NEIKEv2Identifier stringValue](self, "stringValue");
    if (!v5)
    {
      v6 = -[NEIKEv2Identifier identifierData](self, "identifierData");
      [v6 base64EncodedStringWithOptions:0];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    id v4 = (id)[objc_alloc(NSString) initWithFormat:@"%@:%@", v3, v5];
  }

  return v4;
}

- (unint64_t)identifierType
{
  return 0LL;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (-[NEIKEv2Identifier identifierType](self, "identifierType") != 13)
  {
    v9 = -[NEIKEv2Identifier stringValue](self, "stringValue");
    if (!v9)
    {
      v10 = -[NEIKEv2Identifier identifierData](self, "identifierData");
      [v10 base64EncodedStringWithOptions:0];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    [v7 appendPrettyObject:v9 withName:@"Value" andIndent:v5 options:a4];
  }

  return v7;
}

- (id)description
{
  return -[NEIKEv2Identifier descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (void *)objc_opt_class();
  unint64_t v6 = -[NEIKEv2Identifier identifierType](self, "identifierType");
  v7 = -[NEIKEv2Identifier identifierData](self, "identifierData");
  v8 = (void *)[v7 copy];
  v9 = (void *)[v5 createIdentifierWithType:v6 data:v8 zone:a3];

  return v9;
}

- (NSString)stringValue
{
  id v3 = objc_alloc(NSString);
  -[NEIKEv2Identifier identifierData](self, "identifierData");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithData:v4 encoding:4];

  return (NSString *)v5;
}

- (unint64_t)hash
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  unint64_t v5 = -[NEIKEv2Identifier identifierType](self, "identifierType") + v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = -[NEIKEv2Identifier identifierType](self, "identifierType");
    if (v6 == [v5 identifierType])
    {
      v7 = -[NEIKEv2Identifier identifierData](self, "identifierData");
      [v5 identifierData];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      char v9 = [v7 isEqual:v8];
    }

    else
    {
      char v9 = 0;
    }
  }

  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSData)identifierData
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setIdentifierData:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"Invalid";
}

+ (id)createIdentifierWithType:(unint64_t)a3 data:(id)a4 zone:(_NSZone *)a5
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  v8 = v7;
  switch(a3)
  {
    case 1uLL:
      if (objc_msgSend(v7, "length", 0, 0) == 4)
      {
        LOWORD(v23) = 528;
        char v9 = (char *)&v23 + 4;
        v10 = v8;
        uint64_t v11 = 4LL;
        goto LABEL_11;
      }

      ne_log_obj();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      goto LABEL_27;
    case 2uLL:
      v12 = +[NEIKEv2FQDNIdentifier allocWithZone:](&OBJC_CLASS___NEIKEv2FQDNIdentifier, "allocWithZone:", a5);
      v13 = (os_log_s *)[objc_alloc(NSString) initWithData:v8 encoding:4];
      v14 = -[NEIKEv2FQDNIdentifier initWithFQDN:](v12, "initWithFQDN:", v13);
      goto LABEL_12;
    case 3uLL:
      v20 = +[NEIKEv2UserFQDNIdentifier allocWithZone:](&OBJC_CLASS___NEIKEv2UserFQDNIdentifier, "allocWithZone:", a5);
      v13 = (os_log_s *)[objc_alloc(NSString) initWithData:v8 encoding:4];
      v14 = -[NEIKEv2UserFQDNIdentifier initWithUserFQDN:](v20, "initWithUserFQDN:", v13);
      goto LABEL_12;
    case 5uLL:
      LODWORD(v25) = 0;
      if (objc_msgSend(v7, "length", 0, 0, 0, v25) == 16)
      {
        LOWORD(v23) = 7708;
        char v9 = (char *)&v24;
        v10 = v8;
        uint64_t v11 = 16LL;
LABEL_11:
        objc_msgSend(v10, "getBytes:length:", v9, v11, v23);
        [MEMORY[0x189608DE8] endpointWithAddress:&v23];
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v14 = -[NEIKEv2AddressIdentifier initWithAddress:]( +[NEIKEv2AddressIdentifier allocWithZone:](&OBJC_CLASS___NEIKEv2AddressIdentifier, "allocWithZone:", a5),  "initWithAddress:",  v13);
LABEL_12:
        v21 = v14;
      }

      else
      {
        ne_log_obj();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
LABEL_27:
          *(_DWORD *)buf = 67109120;
          int v27 = [v8 length];
          _os_log_error_impl(&dword_1876B1000, v13, OS_LOG_TYPE_ERROR, "Invalid address length %u", buf, 8u);
        }

+ (id)createIdentifierWithType:(unint64_t)a3 data:(id)a4
{
  return (id)[a1 createIdentifierWithType:a3 data:a4 zone:0];
}

@end