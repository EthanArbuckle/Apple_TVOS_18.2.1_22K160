@interface CKKSActualPeer
+ (BOOL)supportsSecureCoding;
- (BOOL)matchesPeer:(id)a3;
- (BOOL)shouldHaveView:(id)a3;
- (CKKSActualPeer)initWithCoder:(id)a3;
- (CKKSActualPeer)initWithPeerID:(id)a3 encryptionPublicKey:(id)a4 signingPublicKey:(id)a5 viewList:(id)a6;
- (NSSet)viewList;
- (NSString)description;
- (NSString)peerID;
- (_SFECPublicKey)publicEncryptionKey;
- (_SFECPublicKey)publicSigningKey;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKKSActualPeer

- (NSString)description
{
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSActualPeer peerID](self, "peerID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSActualPeer publicEncryptionKey](self, "publicEncryptionKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keyData]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSActualPeer publicEncryptionKey](self, "publicEncryptionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyData]);
  id v7 = [v6 length];

  else {
    uint64_t v8 = (uint64_t)v7;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subdataWithRange:", 0, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSActualPeer publicSigningKey](self, "publicSigningKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 keyData]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSActualPeer publicSigningKey](self, "publicSigningKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 keyData]);
  id v14 = [v13 length];

  else {
    uint64_t v15 = (uint64_t)v14;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subdataWithRange:", 0, v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSActualPeer viewList](self, "viewList"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<CKKSActualPeer(%@): pubEnc:%@ pubSign:%@ views:%d>",  v20,  v9,  v16,  [v17 count]));

  return (NSString *)v18;
}

- (CKKSActualPeer)initWithPeerID:(id)a3 encryptionPublicKey:(id)a4 signingPublicKey:(id)a5 viewList:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CKKSActualPeer;
  uint64_t v15 = -[CKKSActualPeer init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_peerID, a3);
    objc_storeStrong((id *)&v16->_publicEncryptionKey, a4);
    objc_storeStrong((id *)&v16->_publicSigningKey, a5);
    objc_storeStrong((id *)&v16->_viewList, a6);
  }

  return v16;
}

- (BOOL)matchesPeer:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSActualPeer peerID](self, "peerID"));
  if (!v6)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([v5 peerID]);
    if (!v3)
    {
      unsigned __int8 v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSActualPeer peerID](self, "peerID"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 peerID]);
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  if (!v6) {
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (BOOL)shouldHaveView:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSActualPeer viewList](self, "viewList"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSActualPeer peerID](self, "peerID"));
  [v4 encodeObject:v5 forKey:@"peerID"];

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSActualPeer publicEncryptionKey](self, "publicEncryptionKey"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 encodeSubjectPublicKeyInfo]);
  [v4 encodeObject:v7 forKey:@"encryptionKey"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSActualPeer publicSigningKey](self, "publicSigningKey"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 encodeSubjectPublicKeyInfo]);
  [v4 encodeObject:v9 forKey:@"signingKey"];

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[CKKSActualPeer viewList](self, "viewList"));
  [v4 encodeObject:v10 forKey:@"viewList"];
}

- (CKKSActualPeer)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CKKSActualPeer;
  id v5 = -[CKKSActualPeer init](&v22, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"peerID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    peerID = v5->_peerID;
    v5->_peerID = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"encryptionKey"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (v10)
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue( +[_SFECPublicKey keyWithSubjectPublicKeyInfo:]( &OBJC_CLASS____SFECPublicKey,  "keyWithSubjectPublicKeyInfo:",  v10));
      publicEncryptionKey = v5->_publicEncryptionKey;
      v5->_publicEncryptionKey = (_SFECPublicKey *)v11;
    }

    id v13 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"signingKey"];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (v14)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[_SFECPublicKey keyWithSubjectPublicKeyInfo:]( &OBJC_CLASS____SFECPublicKey,  "keyWithSubjectPublicKeyInfo:",  v14));
      publicSigningKey = v5->_publicSigningKey;
      v5->_publicSigningKey = (_SFECPublicKey *)v15;
    }

    v23[0] = objc_opt_class(&OBJC_CLASS___NSSet);
    v23[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v17));
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v18 forKey:@"viewList"]);
    viewList = v5->_viewList;
    v5->_viewList = (NSSet *)v19;
  }

  return v5;
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (_SFECPublicKey)publicEncryptionKey
{
  return (_SFECPublicKey *)objc_getProperty(self, a2, 16LL, 1);
}

- (_SFECPublicKey)publicSigningKey
{
  return (_SFECPublicKey *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSSet)viewList
{
  return (NSSet *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end