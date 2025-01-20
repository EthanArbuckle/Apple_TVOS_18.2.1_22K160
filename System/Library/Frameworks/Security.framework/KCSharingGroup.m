@interface KCSharingGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOwned;
- (KCSharingGroup)initWithCoder:(id)a3;
- (KCSharingGroup)initWithGroupID:(id)a3 participants:(id)a4 displayName:(id)a5 shareURL:(id)a6;
- (KCSharingGroup)initWithParticipants:(id)a3 displayName:(id)a4;
- (KCSharingParticipant)currentUserParticipant;
- (KCSharingParticipant)ownerParticipant;
- (NSArray)participants;
- (NSDictionary)JSONObject;
- (NSString)displayName;
- (NSString)groupID;
- (NSString)longDescription;
- (NSURL)shareURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)joinState;
- (unint64_t)hash;
- (void)addParticipant:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeParticipant:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setParticipants:(id)a3;
@end

@implementation KCSharingGroup

- (KCSharingGroup)initWithParticipants:(id)a3 displayName:(id)a4
{
  v6 = (void *)MEMORY[0x189607AB8];
  id v7 = a4;
  id v8 = a3;
  [v6 UUID];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 UUIDString];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[KCSharingGroup initWithGroupID:participants:displayName:shareURL:]( self,  "initWithGroupID:participants:displayName:shareURL:",  v10,  v8,  v7,  0LL);
  return v11;
}

- (KCSharingGroup)initWithGroupID:(id)a3 participants:(id)a4 displayName:(id)a5 shareURL:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___KCSharingGroup;
  v15 = -[KCSharingGroup init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_groupID, a3);
    if (v12)
    {
      uint64_t v17 = [v12 copy];
    }

    else
    {
      uint64_t v17 = [MEMORY[0x189603F18] array];
    }

    participants = v16->_participants;
    v16->_participants = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_displayName, a5);
    objc_storeStrong((id *)&v16->_shareURL, a6);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc(&OBJC_CLASS___KCSharingGroup);
  v5 = -[KCSharingGroup groupID](self, "groupID");
  v6 = (void *)[v5 copy];
  id v7 = objc_alloc(MEMORY[0x189603F18]);
  -[KCSharingGroup participants](self, "participants");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v7 initWithArray:v8 copyItems:1];
  v10 = -[KCSharingGroup displayName](self, "displayName");
  id v11 = (void *)[v10 copy];
  -[KCSharingGroup shareURL](self, "shareURL");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = (void *)[v12 copy];
  id v14 = -[KCSharingGroup initWithGroupID:participants:displayName:shareURL:]( v4,  "initWithGroupID:participants:displayName:shareURL:",  v6,  v9,  v11,  v13);

  return v14;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[KCSharingGroup groupID](self, "groupID");
  v5 = -[KCSharingGroup displayName](self, "displayName");
  v6 = -[KCSharingGroup participants](self, "participants");
  [v3 stringWithFormat:@"KCSharingGroup(%@, name: %@, participants: %@)", v4, v5, v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)longDescription
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x189607940];
  v4 = -[KCSharingGroup groupID](self, "groupID");
  v5 = -[KCSharingGroup displayName](self, "displayName");
  v6 = -[KCSharingGroup shareURL](self, "shareURL");
  objc_msgSend(v3, "stringWithFormat:", @"KCSharingGroup(%@, name: %@ shareURL: %@ participants:\n"), v4, v5, v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  -[KCSharingGroup participants](self, "participants");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v12) longDescription];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 appendFormat:@"\t%@\n", v13];

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  [v7 appendString:@""]);
  id v14 = (void *)[v7 copy];

  return (NSString *)v14;
}

- (NSDictionary)JSONObject
{
  v14[2] = *MEMORY[0x1895F89C0];
  v13[0] = @"groupID";
  v3 = -[KCSharingGroup groupID](self, "groupID");
  v13[1] = @"participants";
  v14[0] = v3;
  v4 = -[KCSharingGroup participants](self, "participants");
  [v4 valueForKey:@"JSONObject"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v6 mutableCopy];

  -[KCSharingGroup displayName](self, "displayName");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v8 forKeyedSubscript:@"displayName"];

  -[KCSharingGroup shareURL](self, "shareURL");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 absoluteString];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v10 forKeyedSubscript:@"shareURL"];

  uint64_t v11 = (void *)[v7 copy];
  return (NSDictionary *)v11;
}

- (KCSharingGroup)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___KCSharingGroup;
  v5 = -[KCSharingGroup init](&v20, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;

    id v8 = (void *)MEMORY[0x189604010];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v21 count:2];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setWithArray:v9];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    [v4 decodeObjectOfClasses:v10 forKey:@"participants"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }

    else
    {
      [MEMORY[0x189603F18] array];
      id v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }

    participants = v5->_participants;
    v5->_participants = v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareURL"];
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v17;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[KCSharingGroup groupID](self, "groupID");
  [v4 encodeObject:v5 forKey:@"groupID"];

  -[KCSharingGroup participants](self, "participants");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"participants"];

  -[KCSharingGroup displayName](self, "displayName");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"displayName"];

  -[KCSharingGroup shareURL](self, "shareURL");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"shareURL"];
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  v5 = -[KCSharingGroup participants](self, "participants");
  uint64_t v6 = [v5 hash] ^ v4;
  -[KCSharingGroup displayName](self, "displayName");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 hash];
  -[KCSharingGroup shareURL](self, "shareURL");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    -[KCSharingGroup displayName](self, "displayName");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[KCSharingGroup displayName](self, "displayName");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 displayName];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      int v9 = [v7 isEqual:v8];
    }

    else
    {
      [v5 displayName];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      int v9 = v7 == 0LL;
    }

    -[KCSharingGroup shareURL](self, "shareURL");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[KCSharingGroup shareURL](self, "shareURL");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 shareURL];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = [v12 isEqual:v13];
    }

    else
    {
      [v5 shareURL];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = v12 == 0LL;
    }

    -[KCSharingGroup groupID](self, "groupID");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 groupID];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v15 isEqual:v16])
    {
      -[KCSharingGroup participants](self, "participants");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 participants];
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
      int v10 = [v17 isEqual:v18] & v9 & v14;
    }

    else
    {
      LOBYTE(v10) = 0;
    }
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (KCSharingParticipant)currentUserParticipant
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = -[KCSharingGroup participants](self, "participants", 0LL);
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if ([v6 isCurrentUser])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }

      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (KCSharingParticipant)ownerParticipant
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = -[KCSharingGroup participants](self, "participants", 0LL);
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if ([v6 isOwner])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }

      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)isOwned
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingGroup ownerParticipant](self, "ownerParticipant");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v3 isEqual:v4];

  return v5;
}

- (int64_t)joinState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = [v2 inviteStatus];

  return v3;
}

- (void)addParticipant:(id)a3
{
  id v4 = a3;
  -[KCSharingGroup participants](self, "participants");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 arrayByAddingObject:v4];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[KCSharingGroup setParticipants:](self, "setParticipants:", v5);
}

- (void)removeParticipant:(id)a3
{
  id v4 = a3;
  -[KCSharingGroup participants](self, "participants");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = (id)[v5 mutableCopy];

  uint64_t v11 = MEMORY[0x1895F87A8];
  uint64_t v12 = 3221225472LL;
  uint64_t v13 = __36__KCSharingGroup_removeParticipant___block_invoke;
  int v14 = &unk_189664C78;
  id v15 = v4;
  id v6 = v4;
  uint64_t v7 = [v9 indexOfObjectPassingTest:&v11];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [v9 removeObjectAtIndex:v7];
  }
  __int128 v8 = (void *)objc_msgSend(v9, "copy", v9, v11, v12, v13, v14);
  -[KCSharingGroup setParticipants:](self, "setParticipants:", v8);
}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void).cxx_destruct
{
}

uint64_t __36__KCSharingGroup_removeParticipant___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) handle];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end