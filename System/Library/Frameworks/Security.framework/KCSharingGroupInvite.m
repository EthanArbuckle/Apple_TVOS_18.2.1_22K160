@interface KCSharingGroupInvite
+ (BOOL)supportsSecureCoding;
- (KCSharingGroupInvite)initWithCoder:(id)a3;
- (KCSharingGroupInvite)initWithGroupID:(id)a3 shareURL:(id)a4 senderHandle:(id)a5 inviteeHandle:(id)a6 inviteToken:(id)a7 sentTime:(id)a8 displayName:(id)a9;
- (NSData)inviteToken;
- (NSDate)sentTime;
- (NSString)displayName;
- (NSString)groupID;
- (NSString)inviteeHandle;
- (NSString)senderHandle;
- (NSURL)shareURL;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
@end

@implementation KCSharingGroupInvite

- (KCSharingGroupInvite)initWithGroupID:(id)a3 shareURL:(id)a4 senderHandle:(id)a5 inviteeHandle:(id)a6 inviteToken:(id)a7 sentTime:(id)a8 displayName:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___KCSharingGroupInvite;
  v18 = -[KCSharingGroupInvite init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_groupID, a3);
    objc_storeStrong((id *)&v19->_shareURL, a4);
    objc_storeStrong((id *)&v19->_senderHandle, a5);
    objc_storeStrong((id *)&v19->_inviteeHandle, a6);
    objc_storeStrong((id *)&v19->_inviteToken, a7);
    objc_storeStrong((id *)&v19->_sentTime, a8);
    objc_storeStrong((id *)&v19->_displayName, a9);
  }

  return v19;
}

- (KCSharingGroupInvite)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___KCSharingGroupInvite;
  v5 = -[KCSharingGroupInvite init](&v21, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareURL"];
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderHandle"];
    senderHandle = v5->_senderHandle;
    v5->_senderHandle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inviteeHandle"];
    inviteeHandle = v5->_inviteeHandle;
    v5->_inviteeHandle = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inviteToken"];
    inviteToken = v5->_inviteToken;
    v5->_inviteToken = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sentTime"];
    sentTime = v5->_sentTime;
    v5->_sentTime = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v18;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[KCSharingGroupInvite groupID](self, "groupID");
  [v4 encodeObject:v5 forKey:@"groupID"];

  -[KCSharingGroupInvite shareURL](self, "shareURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"shareURL"];
  v7 = -[KCSharingGroupInvite senderHandle](self, "senderHandle");
  [v4 encodeObject:v7 forKey:@"senderHandle"];

  -[KCSharingGroupInvite inviteeHandle](self, "inviteeHandle");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"inviteeHandle"];
  v9 = -[KCSharingGroupInvite inviteToken](self, "inviteToken");
  [v4 encodeObject:v9 forKey:@"inviteToken"];

  -[KCSharingGroupInvite sentTime](self, "sentTime");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"sentTime"];

  -[KCSharingGroupInvite displayName](self, "displayName");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v11 forKey:@"displayName"];
}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (NSData)inviteToken
{
  return self->_inviteToken;
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (NSString)inviteeHandle
{
  return self->_inviteeHandle;
}

- (NSDate)sentTime
{
  return self->_sentTime;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
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