@interface MRDMediaUserState
+ (BOOL)groupSessionsSupportedForAccountRegion;
- (BOOL)groupSessionsSupportedForAccountRegion;
- (BOOL)hasAcceptedDisplayNameAcknowledgement;
- (BOOL)hasAcceptedPrivacyAcknowledgement;
- (BOOL)identitySupportsCollaboration;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUserState:(id)a3;
- (BOOL)isFullSubscriber;
- (BOOL)isMinor;
- (ICMediaUserState)userState;
- (MRDMediaUserState)initWithUserState:(id)a3;
- (MRUserIdentity)userIdentity;
- (NSString)identifier;
- (NSString)storefrontCountryCode;
- (id)frameworkState;
- (id)userIdentityWithDisplayName:(id)a3;
- (unint64_t)hash;
- (void)setUserState:(id)a3;
@end

@implementation MRDMediaUserState

+ (BOOL)groupSessionsSupportedForAccountRegion
{
  return +[ICMusicUserState groupSessionCapableStatus](&OBJC_CLASS___ICMusicUserState, "groupSessionCapableStatus") != 0LL;
}

- (MRDMediaUserState)initWithUserState:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___MRDMediaUserState;
    v6 = -[MRDMediaUserState init](&v10, "init");
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_userState, a3);
    }
    self = v7;
    v8 = self;
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (BOOL)hasAcceptedPrivacyAcknowledgement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaUserState userState](self, "userState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dsid]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[ICUserIdentity specificAccountWithDSID:]( &OBJC_CLASS___ICUserIdentity,  "specificAccountWithDSID:",  v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:]( &OBJC_CLASS___ICPrivacyInfo,  "sharedPrivacyInfoForUserIdentity:",  v4));
  char v6 = [v5 privacyAcknowledgementRequiredForMusic] ^ 1;

  return v6;
}

- (BOOL)hasAcceptedDisplayNameAcknowledgement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaUserState userState](self, "userState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 music]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userProfile]);
  unsigned __int8 v5 = [v4 displayNameAccepted];

  return v5;
}

- (BOOL)isMinor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaUserState userState](self, "userState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 music]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 subscriptionStatus]);

  if (v4) {
    unsigned __int8 v5 = [v4 isMinorAccountHolder];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (BOOL)isFullSubscriber
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaUserState userState](self, "userState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 music]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 subscriptionStatus]);

  if (v4) {
    unsigned __int8 v5 = [v4 hasCapability:1];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)identitySupportsCollaboration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaUserState userState](self, "userState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 music]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userProfile]);

  if (v4) {
    unsigned __int8 v5 = [v4 collaborationAllowed];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)groupSessionsSupportedForAccountRegion
{
  return [(id)objc_opt_class(self) groupSessionsSupportedForAccountRegion];
}

- (NSString)storefrontCountryCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaUserState userState](self, "userState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 countryCode]);

  return (NSString *)v3;
}

- (id)userIdentityWithDisplayName:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025BEC;
  block[3] = &unk_100399250;
  block[4] = self;
  uint64_t v3 = qword_1003FDC00;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1003FDC00, block);
  }
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[MRUserIdentity basicIdentityWithIdentifier:displayName:]( &OBJC_CLASS___MRUserIdentity,  "basicIdentityWithIdentifier:displayName:",  qword_1003FDC08,  v4));

  return v5;
}

- (MRUserIdentity)userIdentity
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDeviceInfoRequest localDeviceInfo](&OBJC_CLASS___MRDeviceInfoRequest, "localDeviceInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 groupName]);
  unsigned __int8 v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue([v3 name]);
  }
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaUserState userIdentityWithDisplayName:](self, "userIdentityWithDisplayName:", v7));
  return (MRUserIdentity *)v8;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaUserState userState](self, "userState"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRDMediaUserState *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___MRDMediaUserState);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
      BOOL v6 = -[MRDMediaUserState isEqualToUserState:](self, "isEqualToUserState:", v4);
    }
    else {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isEqualToUserState:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaUserState userState](self, "userState"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userState]);

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (ICMediaUserState)userState
{
  return self->_userState;
}

- (void)setUserState:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)frameworkState
{
  id v3 = objc_alloc_init(&OBJC_CLASS___MRMediaUserState);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaUserState identifier](self, "identifier"));
  [v3 setIdentifier:v4];

  objc_msgSend(v3, "setIsMinor:", -[MRDMediaUserState isMinor](self, "isMinor"));
  objc_msgSend(v3, "setIsFullSubscriber:", -[MRDMediaUserState isFullSubscriber](self, "isFullSubscriber"));
  objc_msgSend( v3,  "setHasAcceptedPrivacyAcknowledgement:",  -[MRDMediaUserState hasAcceptedPrivacyAcknowledgement](self, "hasAcceptedPrivacyAcknowledgement"));
  objc_msgSend( v3,  "setHasAcceptedDisplayNameAcknowledgement:",  -[MRDMediaUserState hasAcceptedDisplayNameAcknowledgement](self, "hasAcceptedDisplayNameAcknowledgement"));
  objc_msgSend( v3,  "setIdentitySupportsCollaboration:",  -[MRDMediaUserState identitySupportsCollaboration](self, "identitySupportsCollaboration"));
  objc_msgSend( v3,  "setGroupSessionsSupportedForAccountRegion:",  -[MRDMediaUserState groupSessionsSupportedForAccountRegion](self, "groupSessionsSupportedForAccountRegion"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaUserState storefrontCountryCode](self, "storefrontCountryCode"));
  [v3 setStorefrontCountryCode:v5];

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaUserState userIdentity](self, "userIdentity"));
  [v3 setUserIdentity:v6];

  return v3;
}

@end