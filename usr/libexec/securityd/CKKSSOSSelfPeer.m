@interface CKKSSOSSelfPeer
- (BOOL)matchesPeer:(id)a3;
- (BOOL)shouldHaveView:(id)a3;
- (CKKSSOSSelfPeer)initWithSOSPeerID:(id)a3 encryptionKey:(id)a4 signingKey:(id)a5 viewList:(id)a6;
- (NSSet)viewList;
- (NSString)description;
- (NSString)peerID;
- (NSString)spid;
- (_SFECKeyPair)encryptionKey;
- (_SFECKeyPair)signingKey;
- (_SFECPublicKey)publicEncryptionKey;
- (_SFECPublicKey)publicSigningKey;
- (void)setEncryptionKey:(id)a3;
- (void)setSigningKey:(id)a3;
- (void)setSpid:(id)a3;
@end

@implementation CKKSSOSSelfPeer

- (NSString)description
{
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer peerID](self, "peerID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer publicEncryptionKey](self, "publicEncryptionKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keyData]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer publicEncryptionKey](self, "publicEncryptionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyData]);
  id v7 = [v6 length];

  else {
    uint64_t v8 = (uint64_t)v7;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subdataWithRange:", 0, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer publicSigningKey](self, "publicSigningKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 keyData]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer publicSigningKey](self, "publicSigningKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 keyData]);
  id v14 = [v13 length];

  else {
    uint64_t v15 = (uint64_t)v14;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subdataWithRange:", 0, v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer viewList](self, "viewList"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<CKKSSOSSelfPeer(%@): pubEnc:%@ pubSign:%@ views:%d>",  v20,  v9,  v16,  [v17 count]));

  return (NSString *)v18;
}

- (CKKSSOSSelfPeer)initWithSOSPeerID:(id)a3 encryptionKey:(id)a4 signingKey:(id)a5 viewList:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CKKSSOSSelfPeer;
  id v14 = -[CKKSSOSSelfPeer init](&v18, "init");
  if (v14)
  {
    else {
      uint64_t v15 = (NSString *)v10;
    }
    spid = v14->_spid;
    v14->_spid = v15;

    objc_storeStrong((id *)&v14->_encryptionKey, a4);
    objc_storeStrong((id *)&v14->_signingKey, a5);
    objc_storeStrong((id *)&v14->_viewList, a6);
  }

  return v14;
}

- (_SFECPublicKey)publicEncryptionKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer encryptionKey](self, "encryptionKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 publicKey]);

  return (_SFECPublicKey *)v3;
}

- (_SFECPublicKey)publicSigningKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer signingKey](self, "signingKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 publicKey]);

  return (_SFECPublicKey *)v3;
}

- (NSString)peerID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer spid](self, "spid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"spid-",  v2));

  return (NSString *)v3;
}

- (BOOL)matchesPeer:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer peerID](self, "peerID"));
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

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer peerID](self, "peerID"));
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
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSOSSelfPeer viewList](self, "viewList"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (NSSet)viewList
{
  return (NSSet *)objc_getProperty(self, a2, 8LL, 1);
}

- (_SFECKeyPair)encryptionKey
{
  return (_SFECKeyPair *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setEncryptionKey:(id)a3
{
}

- (_SFECKeyPair)signingKey
{
  return (_SFECKeyPair *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSigningKey:(id)a3
{
}

- (NSString)spid
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setSpid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end