@interface CKKSExternalKey
+ (BOOL)supportsSecureCoding;
+ (id)parseFromJSONDict:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (CKKSExternalKey)initWithCoder:(id)a3;
- (CKKSExternalKey)initWithView:(id)a3 uuid:(id)a4 parentTLKUUID:(id)a5 keyData:(id)a6;
- (NSData)keyData;
- (NSString)parentKeyUUID;
- (NSString)uuid;
- (NSString)view;
- (id)description;
- (id)jsonDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKKSExternalKey

- (CKKSExternalKey)initWithView:(id)a3 uuid:(id)a4 parentTLKUUID:(id)a5 keyData:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CKKSExternalKey;
  v15 = -[CKKSExternalKey init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_view, a3);
    objc_storeStrong((id *)&v16->_uuid, a4);
    if (v13) {
      v17 = v13;
    }
    else {
      v17 = v12;
    }
    objc_storeStrong((id *)&v16->_parentKeyUUID, v17);
    objc_storeStrong((id *)&v16->_keyData, a6);
  }

  return v16;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[CKKSExternalKey uuid](self, "uuid");
  v5 = -[CKKSExternalKey parentKeyUUID](self, "parentKeyUUID");
  [v3 stringWithFormat:@"<CKKSExternalKey: %@ (%@)>", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKKSExternalKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CKKSExternalKey;
  v5 = -[CKKSExternalKey init](&v15, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"view"];
    view = v5->_view;
    v5->_view = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentKeyUUID"];
    parentKeyUUID = v5->_parentKeyUUID;
    v5->_parentKeyUUID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyData"];
    keyData = v5->_keyData;
    v5->_keyData = (NSData *)v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[CKKSExternalKey view](self, "view");
  [v4 encodeObject:v5 forKey:@"view"];

  -[CKKSExternalKey uuid](self, "uuid");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"uuid"];
  v7 = -[CKKSExternalKey parentKeyUUID](self, "parentKeyUUID");
  [v4 encodeObject:v7 forKey:@"parentKeyUUID"];

  -[CKKSExternalKey keyData](self, "keyData");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"keyData"];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if ([v5 isMemberOfClass:objc_opt_class()])
  {
    -[CKKSExternalKey view](self, "view");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 view];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v6 isEqualToString:v7])
    {
      char v12 = 0;
LABEL_20:

      goto LABEL_21;
    }

    -[CKKSExternalKey uuid](self, "uuid");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 uuid];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v8 isEqualToString:v9])
    {
      char v12 = 0;
LABEL_19:

      goto LABEL_20;
    }

    -[CKKSExternalKey parentKeyUUID](self, "parentKeyUUID");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || ([v5 parentKeyUUID], (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CKKSExternalKey parentKeyUUID](self, "parentKeyUUID");
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 parentKeyUUID];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (![v11 isEqualToString:v3])
      {
        char v12 = 0;
        goto LABEL_15;
      }

      v16 = v11;
      int v18 = 1;
    }

    else
    {
      v17 = 0LL;
      int v18 = 0;
    }

    -[CKKSExternalKey keyData](self, "keyData");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 keyData];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    char v12 = [v13 isEqualToData:v14];

    if (!v18)
    {
LABEL_16:
      if (!v10) {

      }
      goto LABEL_19;
    }

    id v11 = v16;
LABEL_15:

    goto LABEL_16;
  }

  char v12 = 0;
LABEL_21:

  return v12;
}

- (id)jsonDictionary
{
  v11[4] = *MEMORY[0x1895F89C0];
  v10[0] = @"view";
  v3 = -[CKKSExternalKey view](self, "view");
  v11[0] = v3;
  v10[1] = @"uuid";
  -[CKKSExternalKey uuid](self, "uuid");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = @"parentKeyUUID";
  -[CKKSExternalKey parentKeyUUID](self, "parentKeyUUID");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = @"keyData";
  -[CKKSExternalKey keyData](self, "keyData");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 base64EncodedStringWithOptions:0];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:4];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)view
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)parentKeyUUID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSData)keyData
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)parseFromJSONDict:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [v5 objectForKeyedSubscript:@"view"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"uuid"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"parentKeyUUID"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"keyData"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x189603F48]) initWithBase64EncodedString:v9 options:0];
    id v11 = (void *)v10;
    if (v6 && v7 && v8 && v10)
    {
      char v12 = -[CKKSExternalKey initWithView:uuid:parentTLKUUID:keyData:]( objc_alloc(&OBJC_CLASS___CKKSExternalKey),  "initWithView:uuid:parentTLKUUID:keyData:",  v6,  v7,  v8,  v10);
      goto LABEL_16;
    }

    if (!a4)
    {
LABEL_15:
      char v12 = 0LL;
      goto LABEL_16;
    }

    [MEMORY[0x189603FA8] array];
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v6)
    {
      if (v7) {
        goto LABEL_12;
      }
    }

    else
    {
      [v15 addObject:@"view"];
      if (v7)
      {
LABEL_12:
        if (v8) {
          goto LABEL_13;
        }
        goto LABEL_21;
      }
    }

    [v16 addObject:@"uuid"];
    if (v8)
    {
LABEL_13:
      if (v11)
      {
LABEL_14:
        v17 = (void *)MEMORY[0x189607870];
        uint64_t v18 = *MEMORY[0x189607670];
        v21[0] = *MEMORY[0x1896075E0];
        v21[1] = @"missingkeys";
        v22[0] = @"Missing some required field";
        v22[1] = v16;
        [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:2];
        objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 errorWithDomain:v18 code:-50 userInfo:v19];
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }

@end