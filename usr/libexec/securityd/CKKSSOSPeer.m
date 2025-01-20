@interface CKKSSOSPeer
+ (BOOL)supportsSecureCoding;
- (BOOL)matchesPeer:(id)a3;
- (BOOL)shouldHaveView:(id)a3;
- (CKKSSOSPeer)initWithCoder:(id)a3;
- (CKKSSOSPeer)initWithSOSPeerID:(id)a3 encryptionPublicKey:(id)a4 signingPublicKey:(id)a5 viewList:(id)a6;
- (NSSet)viewList;
- (NSString)description;
- (NSString)peerID;
- (NSString)spid;
- (_SFECPublicKey)publicEncryptionKey;
- (_SFECPublicKey)publicSigningKey;
- (void)encodeWithCoder:(id)a3;
- (void)setSpid:(id)a3;
- (void)setViewList:(id)a3;
@end

@implementation CKKSSOSPeer

- (NSString)description
{
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer peerID](self, "peerID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer publicEncryptionKey](self, "publicEncryptionKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keyData]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer publicEncryptionKey](self, "publicEncryptionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyData]);
  id v7 = [v6 length];

  else {
    uint64_t v8 = (uint64_t)v7;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subdataWithRange:", 0, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer publicSigningKey](self, "publicSigningKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 keyData]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer publicSigningKey](self, "publicSigningKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 keyData]);
  id v14 = [v13 length];

  else {
    uint64_t v15 = (uint64_t)v14;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subdataWithRange:", 0, v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer viewList](self, "viewList"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<CKKSSOSPeer(%@): pubEnc:%@ pubSign:%@ views:%d>",  v20,  v9,  v16,  [v17 count]));

  return (NSString *)v18;
}

- (CKKSSOSPeer)initWithSOSPeerID:(id)a3 encryptionPublicKey:(id)a4 signingPublicKey:(id)a5 viewList:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CKKSSOSPeer;
  id v14 = -[CKKSSOSPeer init](&v18, "init");
  if (v14)
  {
    else {
      uint64_t v15 = (NSString *)v10;
    }
    spid = v14->_spid;
    v14->_spid = v15;

    objc_storeStrong((id *)&v14->_publicEncryptionKey, a4);
    objc_storeStrong((id *)&v14->_publicSigningKey, a5);
    objc_storeStrong((id *)&v14->_viewList, a6);
  }

  return v14;
}

- (NSString)peerID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer spid](self, "spid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"spid-",  v2));

  return (NSString *)v3;
}

- (BOOL)matchesPeer:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer peerID](self, "peerID"));
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

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer peerID](self, "peerID"));
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
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer viewList](self, "viewList"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer spid](self, "spid"));
  [v4 encodeObject:v5 forKey:@"spid"];

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer publicEncryptionKey](self, "publicEncryptionKey"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 encodeSubjectPublicKeyInfo]);
  [v4 encodeObject:v7 forKey:@"encryptionKey"];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CKKSSOSPeer publicSigningKey](self, "publicSigningKey"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 encodeSubjectPublicKeyInfo]);
  [v4 encodeObject:v8 forKey:@"signingKey"];
}

- (CKKSSOSPeer)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CKKSSOSPeer;
  unsigned __int8 v6 = -[CKKSSOSPeer init](&v21, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"spid");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    spid = v6->_spid;
    v6->_spid = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v10),  @"encryptionKey");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v13)
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[_SFECPublicKey keyWithSubjectPublicKeyInfo:]( &OBJC_CLASS____SFECPublicKey,  "keyWithSubjectPublicKeyInfo:",  v13));
      publicEncryptionKey = v6->_publicEncryptionKey;
      v6->_publicEncryptionKey = (_SFECPublicKey *)v14;
    }

    id v16 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v12),  @"signingKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (v17)
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[_SFECPublicKey keyWithSubjectPublicKeyInfo:]( &OBJC_CLASS____SFECPublicKey,  "keyWithSubjectPublicKeyInfo:",  v17));
      publicSigningKey = v6->_publicSigningKey;
      v6->_publicSigningKey = (_SFECPublicKey *)v18;
    }
  }

  return v6;
}

- (_SFECPublicKey)publicEncryptionKey
{
  return (_SFECPublicKey *)objc_getProperty(self, a2, 8LL, 1);
}

- (_SFECPublicKey)publicSigningKey
{
  return (_SFECPublicKey *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)spid
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSpid:(id)a3
{
}

- (NSSet)viewList
{
  return (NSSet *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setViewList:(id)a3
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