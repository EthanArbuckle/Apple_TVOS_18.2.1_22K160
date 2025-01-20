@interface CKKSKeychainBackedKeySet
+ (BOOL)supportsSecureCoding;
- (BOOL)newUpload;
- (CKKSKeychainBackedKey)classA;
- (CKKSKeychainBackedKey)classC;
- (CKKSKeychainBackedKey)tlk;
- (CKKSKeychainBackedKeySet)initWithCoder:(id)a3;
- (CKKSKeychainBackedKeySet)initWithTLK:(id)a3 classA:(id)a4 classC:(id)a5 newUpload:(BOOL)a6;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setClassA:(id)a3;
- (void)setClassC:(id)a3;
- (void)setNewUpload:(BOOL)a3;
- (void)setTlk:(id)a3;
@end

@implementation CKKSKeychainBackedKeySet

- (CKKSKeychainBackedKeySet)initWithTLK:(id)a3 classA:(id)a4 classC:(id)a5 newUpload:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CKKSKeychainBackedKeySet;
  v14 = -[CKKSKeychainBackedKeySet init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_tlk, a3);
    objc_storeStrong((id *)&v15->_classA, a4);
    objc_storeStrong((id *)&v15->_classC, a5);
    v15->_newUpload = a6;
  }

  return v15;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKeySet tlk](self, "tlk"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKeySet classA](self, "classA"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKeySet classC](self, "classC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSKeychainBackedKeySet: tlk:%@, classA:%@, classC:%@, newUpload:%d>",  v3,  v4,  v5,  -[CKKSKeychainBackedKeySet newUpload](self, "newUpload")));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKeySet tlk](self, "tlk"));
  [v7 encodeObject:v4 forKey:@"tlk"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKeySet classA](self, "classA"));
  [v7 encodeObject:v5 forKey:@"classA"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKeySet classC](self, "classC"));
  [v7 encodeObject:v6 forKey:@"classC"];

  objc_msgSend(v7, "encodeBool:forKey:", -[CKKSKeychainBackedKeySet newUpload](self, "newUpload"), @"newUpload");
}

- (CKKSKeychainBackedKeySet)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CKKSKeychainBackedKeySet;
  v5 = -[CKKSKeychainBackedKeySet init](&v16, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(CKKSKeychainBackedKey) forKey:@"tlk"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    tlk = v5->_tlk;
    v5->_tlk = (CKKSKeychainBackedKey *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(CKKSKeychainBackedKey) forKey:@"classA"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    classA = v5->_classA;
    v5->_classA = (CKKSKeychainBackedKey *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(CKKSKeychainBackedKey) forKey:@"classC"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    classC = v5->_classC;
    v5->_classC = (CKKSKeychainBackedKey *)v13;

    v5->_newUpload = [v4 decodeBoolForKey:@"newUpload"];
  }

  return v5;
}

- (CKKSKeychainBackedKey)tlk
{
  return (CKKSKeychainBackedKey *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTlk:(id)a3
{
}

- (CKKSKeychainBackedKey)classA
{
  return (CKKSKeychainBackedKey *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setClassA:(id)a3
{
}

- (CKKSKeychainBackedKey)classC
{
  return (CKKSKeychainBackedKey *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setClassC:(id)a3
{
}

- (BOOL)newUpload
{
  return self->_newUpload;
}

- (void)setNewUpload:(BOOL)a3
{
  self->_newUpload = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end