@interface CKKSExternalTLKShare
+ (BOOL)supportsSecureCoding;
+ (id)parseFromJSONDict:(id)a3 error:(id *)a4;
+ (id)unstringifyPeerID:(id)a3;
- (CKKSExternalTLKShare)initWithCoder:(id)a3;
- (CKKSExternalTLKShare)initWithView:(id)a3 tlkUUID:(id)a4 receiverPeerID:(id)a5 senderPeerID:(id)a6 wrappedTLK:(id)a7 signature:(id)a8;
- (NSData)receiverPeerID;
- (NSData)senderPeerID;
- (NSData)signature;
- (NSData)wrappedTLK;
- (NSString)tlkUUID;
- (NSString)view;
- (id)description;
- (id)jsonDictionary;
- (id)stringifyPeerID:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKKSExternalTLKShare

- (CKKSExternalTLKShare)initWithView:(id)a3 tlkUUID:(id)a4 receiverPeerID:(id)a5 senderPeerID:(id)a6 wrappedTLK:(id)a7 signature:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CKKSExternalTLKShare;
  v18 = -[CKKSExternalTLKShare init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_view, a3);
    objc_storeStrong((id *)&v19->_tlkUUID, a4);
    objc_storeStrong((id *)&v19->_receiverPeerID, a5);
    objc_storeStrong((id *)&v19->_senderPeerID, a6);
    objc_storeStrong((id *)&v19->_wrappedTLK, a7);
    objc_storeStrong((id *)&v19->_signature, a8);
  }

  return v19;
}

- (id)stringifyPeerID:(id)a3
{
  v3 = (void *)NSString;
  [a3 base64EncodedStringWithOptions:0];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"spid-%@", v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[CKKSExternalTLKShare tlkUUID](self, "tlkUUID");
  v5 = -[CKKSExternalTLKShare receiverPeerID](self, "receiverPeerID");
  v6 = -[CKKSExternalTLKShare stringifyPeerID:](self, "stringifyPeerID:", v5);
  v7 = -[CKKSExternalTLKShare senderPeerID](self, "senderPeerID");
  v8 = -[CKKSExternalTLKShare stringifyPeerID:](self, "stringifyPeerID:", v7);
  [v3 stringWithFormat:@"<CKKSExternalTLKShare(%@): recv:%@ send:%@@>", v4, v6, v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CKKSExternalTLKShare)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CKKSExternalTLKShare;
  v5 = -[CKKSExternalTLKShare init](&v19, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"view"];
    view = v5->_view;
    v5->_view = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tlkUUID"];
    tlkUUID = v5->_tlkUUID;
    v5->_tlkUUID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiverPeerID"];
    receiverPeerID = v5->_receiverPeerID;
    v5->_receiverPeerID = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderPeerID"];
    senderPeerID = v5->_senderPeerID;
    v5->_senderPeerID = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappedTLK"];
    wrappedTLK = v5->_wrappedTLK;
    v5->_wrappedTLK = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v5->_signature;
    v5->_signature = (NSData *)v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[CKKSExternalTLKShare view](self, "view");
  [v4 encodeObject:v5 forKey:@"view"];

  -[CKKSExternalTLKShare tlkUUID](self, "tlkUUID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"tlkUUID"];
  v7 = -[CKKSExternalTLKShare receiverPeerID](self, "receiverPeerID");
  [v4 encodeObject:v7 forKey:@"receiverPeerID"];

  -[CKKSExternalTLKShare senderPeerID](self, "senderPeerID");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"senderPeerID"];
  v9 = -[CKKSExternalTLKShare wrappedTLK](self, "wrappedTLK");
  [v4 encodeObject:v9 forKey:@"wrappedTLK"];

  -[CKKSExternalTLKShare signature](self, "signature");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"signature"];
}

- (id)jsonDictionary
{
  v16[6] = *MEMORY[0x1895F89C0];
  v15[0] = @"view";
  -[CKKSExternalTLKShare view](self, "view");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = @"tlkUUID";
  v3 = -[CKKSExternalTLKShare tlkUUID](self, "tlkUUID");
  v16[1] = v3;
  v15[2] = @"receiverPeerID";
  -[CKKSExternalTLKShare receiverPeerID](self, "receiverPeerID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKKSExternalTLKShare stringifyPeerID:](self, "stringifyPeerID:", v4);
  v16[2] = v5;
  v15[3] = @"senderPeerID";
  -[CKKSExternalTLKShare senderPeerID](self, "senderPeerID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKKSExternalTLKShare stringifyPeerID:](self, "stringifyPeerID:", v6);
  v16[3] = v7;
  v15[4] = @"wrappedTLK";
  -[CKKSExternalTLKShare wrappedTLK](self, "wrappedTLK");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 base64EncodedStringWithOptions:0];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v9;
  v15[5] = @"signature";
  -[CKKSExternalTLKShare signature](self, "signature");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 base64EncodedStringWithOptions:0];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:6];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)view
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)tlkUUID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSData)receiverPeerID
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSData)senderPeerID
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSData)wrappedTLK
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 48LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)unstringifyPeerID:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"spid-"])
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(@"spid-", "length"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v4 = v3;
  }

  v5 = v4;
  if (v4) {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBase64EncodedString:v4 options:0];
  }
  else {
    uint64_t v6 = 0LL;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)parseFromJSONDict:(id)a3 error:(id *)a4
{
  v29[2] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [v6 objectForKeyedSubscript:@"view"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"tlkUUID"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"receiverPeerID"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 unstringifyPeerID:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 objectForKeyedSubscript:@"senderPeerID"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 unstringifyPeerID:v11];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  id v13 = objc_alloc(MEMORY[0x189603F48]);
  [v6 objectForKeyedSubscript:@"wrappedTLK"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = (void *)[v13 initWithBase64EncodedString:v14 options:0];

  id v16 = objc_alloc(MEMORY[0x189603F48]);
  [v6 objectForKeyedSubscript:@"signature"];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)[v16 initWithBase64EncodedString:v17 options:0];
  if (!v7 || !v8 || !v10 || !v12 || !v15 || !v18)
  {
    [MEMORY[0x189603FA8] array];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    id v21 = v20;
    if (v7)
    {
      if (v8) {
        goto LABEL_10;
      }
    }

    else
    {
      [v20 addObject:@"view"];
      if (v8)
      {
LABEL_10:
        if (v10) {
          goto LABEL_11;
        }
        goto LABEL_20;
      }
    }

    [v21 addObject:@"tlkUUID"];
    if (v10)
    {
LABEL_11:
      if (v12) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }

@end