@interface TrustedPeersHelperPeerState
+ (BOOL)supportsSecureCoding;
- (BOOL)identityIsPreapproved;
- (BOOL)memberChanges;
- (BOOL)unknownMachineIDsPresent;
- (NSString)osVersion;
- (NSString)peerID;
- (TPPBPeerStableInfoSetting)walrus;
- (TPPBPeerStableInfoSetting)webAccess;
- (TrustedPeersHelperPeerState)initWithCoder:(id)a3;
- (TrustedPeersHelperPeerState)initWithPeerID:(id)a3 isPreapproved:(BOOL)a4 status:(unint64_t)a5 memberChanges:(BOOL)a6 unknownMachineIDs:(BOOL)a7 osVersion:(id)a8 walrus:(id)a9 webAccess:(id)a10;
- (id)description;
- (unint64_t)peerStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentityIsPreapproved:(BOOL)a3;
- (void)setMemberChanges:(BOOL)a3;
- (void)setOsVersion:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPeerStatus:(unint64_t)a3;
- (void)setUnknownMachineIDsPresent:(BOOL)a3;
- (void)setWalrus:(id)a3;
- (void)setWebAccess:(id)a3;
@end

@implementation TrustedPeersHelperPeerState

- (TrustedPeersHelperPeerState)initWithPeerID:(id)a3 isPreapproved:(BOOL)a4 status:(unint64_t)a5 memberChanges:(BOOL)a6 unknownMachineIDs:(BOOL)a7 osVersion:(id)a8 walrus:(id)a9 webAccess:(id)a10
{
  id v23 = a3;
  id v15 = a8;
  id v16 = a9;
  id v17 = a10;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TrustedPeersHelperPeerState;
  v18 = -[TrustedPeersHelperPeerState init](&v24, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_peerID, a3);
    v19->_identityIsPreapproved = a4;
    v19->_peerStatus = a5;
    v19->_memberChanges = a6;
    v19->_unknownMachineIDsPresent = a7;
    objc_storeStrong((id *)&v19->_osVersion, a8);
    objc_storeStrong((id *)&v19->_walrus, a9);
    objc_storeStrong((id *)&v19->_webAccess, a10);
  }

  return v19;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState peerID](self, "peerID"));
  unsigned int v4 = -[TrustedPeersHelperPeerState identityIsPreapproved](self, "identityIsPreapproved");
  uint64_t v5 = TPPeerStatusToString(-[TrustedPeersHelperPeerState peerStatus](self, "peerStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (-[TrustedPeersHelperPeerState memberChanges](self, "memberChanges")) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if (-[TrustedPeersHelperPeerState unknownMachineIDsPresent](self, "unknownMachineIDsPresent")) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState osVersion](self, "osVersion"));
  v10 = (void *)v9;
  if (v9) {
    v11 = (const __CFString *)v9;
  }
  else {
    v11 = @"unknown";
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState walrus](self, "walrus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState webAccess](self, "webAccess"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<TPHPeerState: %@ preapproved:%d status:%@ memberChanges: %@ unk. mIDs: %@ osVersion: %@ walrus: %@ webAccess: %@>",  v3,  v4,  v6,  v7,  v8,  v11,  v12,  v13));

  return v14;
}

- (TrustedPeersHelperPeerState)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TrustedPeersHelperPeerState;
  uint64_t v5 = -[TrustedPeersHelperPeerState init](&v19, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"peerID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    peerID = v5->_peerID;
    v5->_peerID = (NSString *)v7;

    v5->_identityIsPreapproved = [v4 decodeBoolForKey:@"identityIsPreapproved"];
    v5->_peerStatus = (unint64_t)[v4 decodeInt64ForKey:@"peerStatus"];
    v5->_memberChanges = [v4 decodeInt64ForKey:@"memberChanges"] != 0;
    v5->_unknownMachineIDsPresent = [v4 decodeInt64ForKey:@"unknownMachineIDs"] != 0;
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"osVersion"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(TPPBPeerStableInfoSetting) forKey:@"walrus"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    walrus = v5->_walrus;
    v5->_walrus = (TPPBPeerStableInfoSetting *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(TPPBPeerStableInfoSetting) forKey:@"webAccess"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    webAccess = v5->_webAccess;
    v5->_webAccess = (TPPBPeerStableInfoSetting *)v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState peerID](self, "peerID"));
  [v4 encodeObject:v5 forKey:@"peerID"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[TrustedPeersHelperPeerState identityIsPreapproved](self, "identityIsPreapproved"),  @"identityIsPreapproved");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[TrustedPeersHelperPeerState peerStatus](self, "peerStatus"),  @"peerStatus");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[TrustedPeersHelperPeerState memberChanges](self, "memberChanges"),  @"memberChanges");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[TrustedPeersHelperPeerState unknownMachineIDsPresent](self, "unknownMachineIDsPresent"),  @"unknownMachineIDs");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState osVersion](self, "osVersion"));
  [v4 encodeObject:v6 forKey:@"osVersion"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState walrus](self, "walrus"));
  [v4 encodeObject:v7 forKey:@"walrus"];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperPeerState webAccess](self, "webAccess"));
  [v4 encodeObject:v8 forKey:@"webAccess"];
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPeerID:(id)a3
{
}

- (BOOL)identityIsPreapproved
{
  return self->_identityIsPreapproved;
}

- (void)setIdentityIsPreapproved:(BOOL)a3
{
  self->_identityIsPreapproved = a3;
}

- (unint64_t)peerStatus
{
  return self->_peerStatus;
}

- (void)setPeerStatus:(unint64_t)a3
{
  self->_peerStatus = a3;
}

- (BOOL)memberChanges
{
  return self->_memberChanges;
}

- (void)setMemberChanges:(BOOL)a3
{
  self->_memberChanges = a3;
}

- (BOOL)unknownMachineIDsPresent
{
  return self->_unknownMachineIDsPresent;
}

- (void)setUnknownMachineIDsPresent:(BOOL)a3
{
  self->_unknownMachineIDsPresent = a3;
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (TPPBPeerStableInfoSetting)walrus
{
  return (TPPBPeerStableInfoSetting *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setWalrus:(id)a3
{
}

- (TPPBPeerStableInfoSetting)webAccess
{
  return (TPPBPeerStableInfoSetting *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setWebAccess:(id)a3
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