@interface CUPairedPeer
+ (BOOL)supportsSecureCoding;
- (CUPairedPeer)initWithCoder:(id)a3;
- (NSData)altIRK;
- (NSData)publicKey;
- (NSDate)dateModified;
- (NSDictionary)acl;
- (NSDictionary)groupInfo;
- (NSDictionary)info;
- (NSString)identifierStr;
- (NSString)label;
- (NSString)model;
- (NSString)name;
- (NSUUID)identifier;
- (id)description;
- (id)detailedDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setAcl:(id)a3;
- (void)setAltIRK:(id)a3;
- (void)setDateModified:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierStr:(id)a3;
- (void)setInfo:(id)a3;
- (void)setLabel:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setPublicKey:(id)a3;
@end

@implementation CUPairedPeer

- (CUPairedPeer)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CUPairedPeer;
  v5 = -[CUPairedPeer init](&v26, sel_init);
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = objc_opt_class();
    NSDecodeStandardContainerIfPresent(v6, @"acl", v7, (void **)&v5->_acl);

    id v8 = v6;
    uint64_t v9 = objc_opt_class();
    NSDecodeObjectIfPresent(v8, @"altIRK", v9, (void **)&v5->_altIRK);

    id v10 = v8;
    uint64_t v11 = objc_opt_class();
    NSDecodeObjectIfPresent(v10, @"dateModified", v11, (void **)&v5->_dateModified);

    id v12 = v10;
    uint64_t v13 = objc_opt_class();
    NSDecodeObjectIfPresent(v12, @"ident", v13, (void **)&v5->_identifier);

    id v14 = v12;
    uint64_t v15 = objc_opt_class();
    NSDecodeObjectIfPresent(v14, @"idStr", v15, (void **)&v5->_identifierStr);

    id v16 = v14;
    uint64_t v17 = objc_opt_class();
    NSDecodeStandardContainerIfPresent(v16, @"info", v17, (void **)&v5->_info);

    id v18 = v16;
    uint64_t v19 = objc_opt_class();
    NSDecodeObjectIfPresent(v18, @"model", v19, (void **)&v5->_model);

    id v20 = v18;
    uint64_t v21 = objc_opt_class();
    NSDecodeObjectIfPresent(v20, @"name", v21, (void **)&v5->_name);

    id v22 = v20;
    uint64_t v23 = objc_opt_class();
    NSDecodeObjectIfPresent(v22, @"pk", v23, (void **)&v5->_publicKey);

    objc_storeStrong((id *)&v5->_label, v5->_name);
    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  acl = self->_acl;
  id v14 = v4;
  if (acl)
  {
    [v4 encodeObject:acl forKey:@"acl"];
    id v4 = v14;
  }

  altIRK = self->_altIRK;
  if (altIRK)
  {
    [v14 encodeObject:altIRK forKey:@"altIRK"];
    id v4 = v14;
  }

  dateModified = self->_dateModified;
  if (dateModified)
  {
    [v14 encodeObject:dateModified forKey:@"dateModified"];
    id v4 = v14;
  }

  identifier = self->_identifier;
  if (identifier)
  {
    [v14 encodeObject:identifier forKey:@"ident"];
    id v4 = v14;
  }

  identifierStr = self->_identifierStr;
  if (identifierStr)
  {
    [v14 encodeObject:identifierStr forKey:@"idStr"];
    id v4 = v14;
  }

  info = self->_info;
  if (info)
  {
    [v14 encodeObject:info forKey:@"info"];
    id v4 = v14;
  }

  if (self->_label && !self->_name)
  {
    objc_msgSend(v14, "encodeObject:forKey:");
    id v4 = v14;
  }

  model = self->_model;
  if (model)
  {
    [v14 encodeObject:model forKey:@"model"];
    id v4 = v14;
  }

  name = self->_name;
  if (name)
  {
    [v14 encodeObject:name forKey:@"name"];
    id v4 = v14;
  }

  publicKey = self->_publicKey;
  if (publicKey)
  {
    [v14 encodeObject:publicKey forKey:@"pk"];
    id v4 = v14;
  }
}

- (id)description
{
  CFMutableStringRef v34 = 0LL;
  NSAppendPrintF(&v34);
  v3 = v34;
  id v4 = v3;
  identifierStr = self->_identifierStr;
  if (identifierStr)
  {
    v33 = v3;
    uint64_t v23 = identifierStr;
    id v6 = (id *)&v33;
    uint64_t v7 = &v33;
  }

  else
  {
    identifier = self->_identifier;
    if (!identifier) {
      goto LABEL_6;
    }
    v32 = v3;
    uint64_t v23 = identifier;
    id v6 = (id *)&v32;
    uint64_t v7 = &v32;
  }

  NSAppendPrintF(v7);
  uint64_t v9 = (__CFString *)*v6;

  id v4 = v9;
LABEL_6:
  name = self->_name;
  if (name)
  {
    CFMutableStringRef v31 = v4;
    uint64_t v23 = name;
    NSAppendPrintF(&v31);
    uint64_t v11 = v31;

    id v4 = v11;
  }

  model = self->_model;
  if (model)
  {
    CFMutableStringRef v30 = v4;
    uint64_t v23 = model;
    NSAppendPrintF(&v30);
    uint64_t v13 = v30;

    id v4 = v13;
  }

  publicKey = self->_publicKey;
  if (publicKey)
  {
    CFMutableStringRef v29 = v4;
    uint64_t v23 = publicKey;
    NSAppendPrintF(&v29);
    uint64_t v15 = v29;

    id v4 = v15;
  }

  if (-[NSDictionary count](self->_acl, "count", v23))
  {
    CFMutableStringRef v28 = v4;
    NSUInteger v24 = -[NSDictionary count](self->_acl, "count");
    NSAppendPrintF(&v28);
    id v16 = v28;

    id v4 = v16;
  }

  altIRK = self->_altIRK;
  if (altIRK)
  {
    CFMutableStringRef v27 = v4;
    NSUInteger v24 = (NSUInteger)altIRK;
    NSAppendPrintF(&v27);
    id v18 = v27;

    id v4 = v18;
  }

  dateModified = self->_dateModified;
  if (dateModified)
  {
    CFMutableStringRef v26 = v4;
    NSUInteger v24 = (NSUInteger)dateModified;
    NSAppendPrintF(&v26);
    id v20 = v26;

    id v4 = v20;
  }

  if (-[NSDictionary count](self->_info, "count", v24))
  {
    CFMutableStringRef v25 = v4;
    -[NSDictionary count](self->_info, "count");
    NSAppendPrintF(&v25);
    uint64_t v21 = v25;

    id v4 = v21;
  }

  return v4;
}

- (id)detailedDescription
{
  CFMutableStringRef v31 = 0LL;
  NSAppendPrintF(&v31);
  v3 = v31;
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier)
  {
    CFMutableStringRef v30 = v3;
    acl = (NSDictionary *)identifier;
    NSAppendPrintF(&v30);
    id v6 = v30;

    id v4 = v6;
  }

  name = self->_name;
  if (name)
  {
    CFMutableStringRef v29 = v4;
    acl = (NSDictionary *)name;
    NSAppendPrintF(&v29);
    id v8 = v29;

    id v4 = v8;
  }

  model = self->_model;
  if (model)
  {
    CFMutableStringRef v28 = v4;
    acl = (NSDictionary *)model;
    NSAppendPrintF(&v28);
    id v10 = v28;

    id v4 = v10;
  }

  publicKey = self->_publicKey;
  if (publicKey)
  {
    CFMutableStringRef v27 = v4;
    acl = (NSDictionary *)publicKey;
    NSAppendPrintF(&v27);
    id v12 = v27;

    id v4 = v12;
  }

  altIRK = self->_altIRK;
  if (altIRK)
  {
    CFMutableStringRef v26 = v4;
    acl = (NSDictionary *)altIRK;
    NSAppendPrintF(&v26);
    id v14 = v26;

    id v4 = v14;
  }

  dateModified = self->_dateModified;
  if (dateModified)
  {
    CFMutableStringRef v25 = v4;
    acl = (NSDictionary *)dateModified;
    NSAppendPrintF(&v25);
    id v16 = v25;

    id v4 = v16;
  }

  CFMutableStringRef v24 = v4;
  NSAppendPrintF(&v24);
  uint64_t v17 = v24;

  if (-[NSDictionary count](self->_acl, "count"))
  {
    CFMutableStringRef v23 = v17;
    acl = self->_acl;
    NSAppendPrintF(&v23);
    id v18 = v23;

    uint64_t v17 = v18;
  }

  if (-[NSDictionary count](self->_info, "count", acl))
  {
    CFMutableStringRef v22 = v17;
    NSAppendPrintF(&v22);
    uint64_t v19 = v22;

    uint64_t v17 = v19;
  }

  return v17;
}

- (NSDictionary)groupInfo
{
  info = self->_info;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  return (NSDictionary *)CFDictionaryGetTypedValue((const __CFDictionary *)info, @"groupInfo", TypeID, 0LL);
}

- (NSDictionary)acl
{
  return self->_acl;
}

- (void)setAcl:(id)a3
{
}

- (NSData)altIRK
{
  return self->_altIRK;
}

- (void)setAltIRK:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSDate)dateModified
{
  return self->_dateModified;
}

- (void)setDateModified:(id)a3
{
}

- (NSString)identifierStr
{
  return self->_identifierStr;
}

- (void)setIdentifierStr:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end