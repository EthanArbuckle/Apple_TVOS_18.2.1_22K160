@interface KCSharingGroupUpdateInfo
+ (BOOL)supportsSecureCoding;
- (KCSharingGroup)updatedGroup;
- (KCSharingGroupUpdateInfo)initWithCoder:(id)a3;
- (KCSharingGroupUpdateInfo)initWithDepartedGroupID:(id)a3;
- (KCSharingGroupUpdateInfo)initWithGroup:(id)a3 addedParticipants:(id)a4;
- (NSArray)addedParticipants;
- (NSString)departedGroupID;
- (id)description;
- (int64_t)updateType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation KCSharingGroupUpdateInfo

- (KCSharingGroupUpdateInfo)initWithGroup:(id)a3 addedParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___KCSharingGroupUpdateInfo;
  v8 = -[KCSharingGroupUpdateInfo init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_updateType = 0LL;
    uint64_t v10 = [v6 copy];
    updatedGroup = v9->_updatedGroup;
    v9->_updatedGroup = (KCSharingGroup *)v10;

    uint64_t v12 = [v7 copy];
    addedParticipants = v9->_addedParticipants;
    v9->_addedParticipants = (NSArray *)v12;
  }

  return v9;
}

- (KCSharingGroupUpdateInfo)initWithDepartedGroupID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___KCSharingGroupUpdateInfo;
  v5 = -[KCSharingGroupUpdateInfo init](&v10, sel_init);
  id v6 = v5;
  if (v5)
  {
    v5->_updateType = 1LL;
    uint64_t v7 = [v4 copy];
    departedGroupID = v6->_departedGroupID;
    v6->_departedGroupID = (NSString *)v7;
  }

  return v6;
}

- (id)description
{
  int64_t updateType = self->_updateType;
  if (updateType == 1)
  {
    [NSString stringWithFormat:@"KCSharingGroupUpdateInfo(%@, departed group)", self->_departedGroupID];
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else if (updateType)
  {
    uint64_t v7 = @"KCSharingGroupUpdateInfo(Unknown update type)";
  }

  else
  {
    id v4 = (void *)NSString;
    v5 = -[KCSharingGroup groupID](self->_updatedGroup, "groupID");
    -[KCSharingGroup displayName](self->_updatedGroup, "displayName");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringWithFormat:@"KCSharingGroupUpdateInfo(%@, name: %@, new participants: %@)", v5, v6, self->_addedParticipants];
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (KCSharingGroupUpdateInfo)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___KCSharingGroupUpdateInfo;
  v5 = -[KCSharingGroupUpdateInfo init](&v17, sel_init);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateType"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_int64_t updateType = [v6 integerValue];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updatedGroup"];
    updatedGroup = v5->_updatedGroup;
    v5->_updatedGroup = (KCSharingGroup *)v7;

    v9 = (void *)MEMORY[0x189604010];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v18 count:2];
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setWithArray:v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"addedParticipants"];
    addedParticipants = v5->_addedParticipants;
    v5->_addedParticipants = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"departedGroupID"];
    departedGroupID = v5->_departedGroupID;
    v5->_departedGroupID = (NSString *)v14;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x189607968];
  int64_t updateType = self->_updateType;
  id v7 = a3;
  [v4 numberWithLongLong:updateType];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v6 forKey:@"updateType"];

  [v7 encodeObject:self->_updatedGroup forKey:@"updatedGroup"];
  [v7 encodeObject:self->_addedParticipants forKey:@"addedParticipants"];
  [v7 encodeObject:self->_departedGroupID forKey:@"departedGroupID"];
}

- (int64_t)updateType
{
  return self->_updateType;
}

- (KCSharingGroup)updatedGroup
{
  return self->_updatedGroup;
}

- (NSArray)addedParticipants
{
  return self->_addedParticipants;
}

- (NSString)departedGroupID
{
  return self->_departedGroupID;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end