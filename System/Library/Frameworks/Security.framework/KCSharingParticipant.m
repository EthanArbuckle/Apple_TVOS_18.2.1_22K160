@interface KCSharingParticipant
+ (BOOL)supportsSecureCoding;
- (BOOL)isCurrentUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOwner;
- (KCSharingParticipant)initWithCoder:(id)a3;
- (KCSharingParticipant)initWithHandle:(id)a3 permissionLevel:(int64_t)a4;
- (KCSharingParticipant)initWithParticipantID:(id)a3 handle:(id)a4 permissionLevel:(int64_t)a5 isCurrentUser:(BOOL)a6 inviteStatus:(int64_t)a7 sharingInvitationData:(id)a8;
- (KCSharingParticipant)invitedBy;
- (NSData)sharingInvitationData;
- (NSDictionary)JSONObject;
- (NSString)handle;
- (NSString)longDescription;
- (NSString)participantID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)inviteStatus;
- (int64_t)permissionLevel;
- (unint64_t)hash;
- (void)_setInvitedBy:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPermissionLevel:(int64_t)a3;
@end

@implementation KCSharingParticipant

- (KCSharingParticipant)initWithHandle:(id)a3 permissionLevel:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___KCSharingParticipant;
  v8 = -[KCSharingParticipant init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_handle, a3);
    v9->_permissionLevel = a4;
  }

  return v9;
}

- (KCSharingParticipant)initWithParticipantID:(id)a3 handle:(id)a4 permissionLevel:(int64_t)a5 isCurrentUser:(BOOL)a6 inviteStatus:(int64_t)a7 sharingInvitationData:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___KCSharingParticipant;
  v17 = -[KCSharingParticipant init](&v25, sel_init);
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    participantID = v17->_participantID;
    v17->_participantID = (NSString *)v18;

    uint64_t v20 = [v15 copy];
    handle = v17->_handle;
    v17->_handle = (NSString *)v20;

    v17->_isCurrentUser = a6;
    v17->_permissionLevel = a5;
    v17->_inviteStatus = a7;
    uint64_t v22 = [v16 copy];
    sharingInvitationData = v17->_sharingInvitationData;
    v17->_sharingInvitationData = (NSData *)v22;
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc(&OBJC_CLASS___KCSharingParticipant);
  v5 = -[KCSharingParticipant participantID](self, "participantID");
  v6 = -[KCSharingParticipant handle](self, "handle");
  int64_t v7 = -[KCSharingParticipant permissionLevel](self, "permissionLevel");
  BOOL v8 = -[KCSharingParticipant isCurrentUser](self, "isCurrentUser");
  int64_t v9 = -[KCSharingParticipant inviteStatus](self, "inviteStatus");
  v10 = -[KCSharingParticipant sharingInvitationData](self, "sharingInvitationData");
  objc_super v11 = -[KCSharingParticipant initWithParticipantID:handle:permissionLevel:isCurrentUser:inviteStatus:sharingInvitationData:]( v4,  "initWithParticipantID:handle:permissionLevel:isCurrentUser:inviteStatus:sharingInvitationData:",  v5,  v6,  v7,  v8,  v9,  v10);

  return v11;
}

- (BOOL)isOwner
{
  return -[KCSharingParticipant permissionLevel](self, "permissionLevel") == 2;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[KCSharingParticipant participantID](self, "participantID");
  v5 = -[KCSharingParticipant handle](self, "handle");
  int64_t v6 = -[KCSharingParticipant permissionLevel](self, "permissionLevel");
  int64_t v7 = @"readOnly";
  if (v6 == 1) {
    int64_t v7 = @"readWrite";
  }
  if (v6 == 2) {
    int64_t v7 = @"owner";
  }
  BOOL v8 = v7;
  unint64_t v9 = -[KCSharingParticipant inviteStatus](self, "inviteStatus") - 1;
  if (v9 > 2) {
    v10 = @"unknown";
  }
  else {
    v10 = off_189665770[v9];
  }
  if (-[KCSharingParticipant isCurrentUser](self, "isCurrentUser")) {
    objc_super v11 = @"YES";
  }
  else {
    objc_super v11 = @"NO";
  }
  if (-[KCSharingParticipant isOwner](self, "isOwner")) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  [v3 stringWithFormat:@"KCSharingParticipant(%@, handle:%@ permissionLevel:%@ inviteStatus: %@ isCurrentUser:%@ isOwner:%@)", v4, v5, v8, v10, v11, v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)longDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)[v3 mutableCopy];

  v5 = (void *)NSString;
  -[KCSharingParticipant sharingInvitationData](self, "sharingInvitationData");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 base64EncodedStringWithOptions:0];
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringWithFormat:@" inviteToken:%@", v7];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "insertString:atIndex:", v8, objc_msgSend(v4, "length") - 1);
  return (NSString *)v4;
}

- (NSDictionary)JSONObject
{
  v18[4] = *MEMORY[0x1895F89C0];
  v17[0] = @"handle";
  v3 = -[KCSharingParticipant handle](self, "handle");
  v18[0] = v3;
  v17[1] = @"permissionLevel";
  int64_t v4 = -[KCSharingParticipant permissionLevel](self, "permissionLevel");
  v5 = @"readOnly";
  if (v4 == 1) {
    v5 = @"readWrite";
  }
  if (v4 == 2) {
    v5 = @"owner";
  }
  int64_t v6 = v5;
  v18[1] = v6;
  v17[2] = @"isCurrentUser";
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[KCSharingParticipant isCurrentUser](self, "isCurrentUser"));
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v7;
  v17[3] = @"inviteStatus";
  int64_t v8 = -[KCSharingParticipant inviteStatus](self, "inviteStatus");
  else {
    unint64_t v9 = off_189665770[v8 - 1];
  }
  v18[3] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:4];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v11 = (void *)[v10 mutableCopy];
  v12 = -[KCSharingParticipant participantID](self, "participantID");
  [v11 setObject:v12 forKeyedSubscript:@"participantID"];
  v13 = -[KCSharingParticipant sharingInvitationData](self, "sharingInvitationData");
  [v13 base64EncodedStringWithOptions:0];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setObject:v14 forKeyedSubscript:@"inviteToken"];

  id v15 = (void *)[v11 copy];
  return (NSDictionary *)v15;
}

- (KCSharingParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___KCSharingParticipant;
  v5 = -[KCSharingParticipant init](&v13, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"participantID"];
    participantID = v5->_participantID;
    v5->_participantID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v8;

    v5->_permissionLevel = [v4 decodeInt64ForKey:@"permissionLevel"];
    v5->_isCurrentUser = [v4 decodeBoolForKey:@"isCurrentUser"];
    v5->_inviteStatus = [v4 decodeInt64ForKey:@"inviteStatus"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inviteData"];
    sharingInvitationData = v5->_sharingInvitationData;
    v5->_sharingInvitationData = (NSData *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[KCSharingParticipant participantID](self, "participantID");
  [v4 encodeObject:v5 forKey:@"participantID"];

  -[KCSharingParticipant handle](self, "handle");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"handle"];

  objc_msgSend( v4,  "encodeInt64:forKey:",  -[KCSharingParticipant permissionLevel](self, "permissionLevel"),  @"permissionLevel");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[KCSharingParticipant isCurrentUser](self, "isCurrentUser"),  @"isCurrentUser");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[KCSharingParticipant inviteStatus](self, "inviteStatus"),  @"inviteStatus");
  -[KCSharingParticipant sharingInvitationData](self, "sharingInvitationData");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"inviteData"];
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  v5 = -[KCSharingParticipant handle](self, "handle");
  uint64_t v6 = [v5 hash] ^ v4;
  int64_t v7 = v6 ^ -[KCSharingParticipant permissionLevel](self, "permissionLevel");
  uint64_t v8 = -[KCSharingParticipant isCurrentUser](self, "isCurrentUser");
  int64_t v9 = v7 ^ v8 ^ -[KCSharingParticipant inviteStatus](self, "inviteStatus");
  -[KCSharingParticipant sharingInvitationData](self, "sharingInvitationData");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v11 = v9 ^ [v10 hash];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  if ([v6 isMemberOfClass:objc_opt_class()])
  {
    id v7 = v6;
    -[KCSharingParticipant sharingInvitationData](self, "sharingInvitationData");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[KCSharingParticipant sharingInvitationData](self, "sharingInvitationData");
      int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 sharingInvitationData];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      char v10 = [v9 isEqualToData:v3];
    }

    else
    {
      [v7 sharingInvitationData];
      int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      char v10 = v9 == 0LL;
    }
    v12 = -[KCSharingParticipant participantID](self, "participantID");
    [v7 participantID];
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v13
      || (-[KCSharingParticipant participantID](self, "participantID"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          [v7 participantID],
          uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(),
          [v3 isEqualToString:v4]))
    {
      -[KCSharingParticipant handle](self, "handle");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 handle];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v14 isEqual:v15]
        && (BOOL v20 = v10,
            int64_t v16 = -[KCSharingParticipant permissionLevel](self, "permissionLevel"),
            v16 == [v7 permissionLevel])
        && (int v17 = -[KCSharingParticipant isCurrentUser](self, "isCurrentUser"),
            v17 == [v7 isCurrentUser]))
      {
        int64_t v19 = -[KCSharingParticipant inviteStatus](self, "inviteStatus");
        BOOL v11 = v19 == [v7 inviteStatus] && v20;
      }

      else
      {
        BOOL v11 = 0;
      }

      if (v12 == v13) {
        goto LABEL_15;
      }
    }

    else
    {
      BOOL v11 = 0;
    }

LABEL_15:
    goto LABEL_16;
  }

  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (void)_setInvitedBy:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (NSString)handle
{
  return self->_handle;
}

- (int64_t)permissionLevel
{
  return self->_permissionLevel;
}

- (void)setPermissionLevel:(int64_t)a3
{
  self->_permissionLevel = a3;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (int64_t)inviteStatus
{
  return self->_inviteStatus;
}

- (KCSharingParticipant)invitedBy
{
  return (KCSharingParticipant *)objc_loadWeakRetained((id *)&self->_invitedBy);
}

- (NSData)sharingInvitationData
{
  return self->_sharingInvitationData;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end