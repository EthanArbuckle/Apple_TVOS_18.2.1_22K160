@interface TrustedPeersHelperPeer
+ (BOOL)supportsSecureCoding;
- (NSData)encryptionSPKI;
- (NSData)signingSPKI;
- (NSSet)viewList;
- (NSString)peerID;
- (TPPBSecureElementIdentity)secureElementIdentity;
- (TrustedPeersHelperPeer)initWithCoder:(id)a3;
- (TrustedPeersHelperPeer)initWithPeerID:(id)a3 signingSPKI:(id)a4 encryptionSPKI:(id)a5 secureElementIdentity:(id)a6 viewList:(id)a7;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEncryptionSPKI:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setSecureElementIdentity:(id)a3;
- (void)setSigningSPKI:(id)a3;
- (void)setViewList:(id)a3;
@end

@implementation TrustedPeersHelperPeer

- (TrustedPeersHelperPeer)initWithPeerID:(id)a3 signingSPKI:(id)a4 encryptionSPKI:(id)a5 secureElementIdentity:(id)a6 viewList:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TrustedPeersHelperPeer;
  v17 = -[TrustedPeersHelperPeer init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_peerID, a3);
    objc_storeStrong((id *)&v18->_signingSPKI, a4);
    objc_storeStrong((id *)&v18->_encryptionSPKI, a5);
    objc_storeStrong((id *)&v18->_secureElementIdentity, a6);
    objc_storeStrong((id *)&v18->_viewList, a7);
  }

  return v18;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer peerID](self, "peerID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer signingSPKI](self, "signingSPKI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer encryptionSPKI](self, "encryptionSPKI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer secureElementIdentity](self, "secureElementIdentity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 peerIdentifier]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 base64EncodedStringWithOptions:0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer viewList](self, "viewList"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<TPHPeer: %@ %@ %@ se:%@ (%lu views)>",  v3,  v4,  v5,  v8,  [v9 count]));

  return v10;
}

- (TrustedPeersHelperPeer)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TrustedPeersHelperPeer;
  v5 = -[TrustedPeersHelperPeer init](&v23, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"peerID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    peerID = v5->_peerID;
    v5->_peerID = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"signingSPKI"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    signingSPKI = v5->_signingSPKI;
    v5->_signingSPKI = (NSData *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"encryptionSPKI"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    encryptionSPKI = v5->_encryptionSPKI;
    v5->_encryptionSPKI = (NSData *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(TPPBSecureElementIdentity) forKey:@"seIdentity"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    secureElementIdentity = v5->_secureElementIdentity;
    v5->_secureElementIdentity = (TPPBSecureElementIdentity *)v16;

    v24[0] = objc_opt_class(&OBJC_CLASS___NSSet);
    v24[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v18));
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v19 forKey:@"viewList"]);
    viewList = v5->_viewList;
    v5->_viewList = (NSSet *)v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer peerID](self, "peerID"));
  [v4 encodeObject:v5 forKey:@"peerID"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer signingSPKI](self, "signingSPKI"));
  [v4 encodeObject:v6 forKey:@"signingSPKI"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer encryptionSPKI](self, "encryptionSPKI"));
  [v4 encodeObject:v7 forKey:@"encryptionSPKI"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer secureElementIdentity](self, "secureElementIdentity"));
  [v4 encodeObject:v8 forKey:@"seIdentity"];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeer viewList](self, "viewList"));
  [v4 encodeObject:v9 forKey:@"viewList"];
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSData)signingSPKI
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSigningSPKI:(id)a3
{
}

- (NSData)encryptionSPKI
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setEncryptionSPKI:(id)a3
{
}

- (NSSet)viewList
{
  return (NSSet *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setViewList:(id)a3
{
}

- (TPPBSecureElementIdentity)secureElementIdentity
{
  return (TPPBSecureElementIdentity *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSecureElementIdentity:(id)a3
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