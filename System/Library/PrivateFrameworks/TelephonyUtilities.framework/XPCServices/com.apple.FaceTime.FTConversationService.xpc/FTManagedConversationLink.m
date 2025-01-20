@interface FTManagedConversationLink
+ (id)managedConversationLinkForTUConversationLinkDescriptor:(id)a3 inManagedObjectContext:(id)a4;
- (FTManagedConversationLink)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (NSSet)tuInvitedHandles;
- (TUConversationLinkDescriptor)tuConversationLinkDescriptor;
- (id)description;
- (void)updateWithDescriptor:(id)a3;
@end

@implementation FTManagedConversationLink

+ (id)managedConversationLinkForTUConversationLinkDescriptor:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentStoreCoordinator]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 managedObjectModel]);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 entitiesByName]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"ConversationLink"]);

    if (v11)
    {
      id v12 = [objc_alloc((Class)objc_opt_class(a1)) initWithEntity:v11 insertIntoManagedObjectContext:v7];
    }

    else
    {
      uint64_t v14 = FTCServiceLog();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 138412546;
        v34 = @"ConversationLink";
        __int16 v35 = 2112;
        id v36 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Could not find entity description with name %@ in managed object context %@. Falling back to convenience initializer.",  (uint8_t *)&v33,  0x16u);
      }

      id v12 = [objc_alloc((Class)objc_opt_class(a1)) initWithContext:v7];
    }

    v13 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 invitedHandles]);
    if (v16) {
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[FTManagedHandle managedHandlesForTUHandles:inManagedObjectContext:]( &OBJC_CLASS___FTManagedHandle,  "managedHandlesForTUHandles:inManagedObjectContext:",  v16,  v7));
    }
    else {
      v17 = 0LL;
    }
    objc_msgSend(v13, "setActivated:", objc_msgSend(v6, "isActivated"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 creationDate]);
    [v13 setCreationDate:v18];

    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 deletionDate]);
    [v13 setDeletionDate:v19];

    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 expirationDate]);
    [v13 setExpirationDate:v20];

    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 groupUUID]);
    [v13 setGroupUUID:v21];

    [v13 setInvitedHandles:v17];
    v22 = (void *)objc_claimAutoreleasedReturnValue([v6 originator]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
    [v13 setOriginatorIdentifier:v23];

    v24 = (void *)objc_claimAutoreleasedReturnValue([v6 originator]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 handle]);
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[FTManagedHandle managedHandleForTUHandle:inManagedObjectContext:]( &OBJC_CLASS___FTManagedHandle,  "managedHandleForTUHandle:inManagedObjectContext:",  v25,  v7));
    [v13 setOriginatorHandle:v26];

    v27 = (void *)objc_claimAutoreleasedReturnValue([v6 originator]);
    objc_msgSend(v13, "setOriginatorRevision:", objc_msgSend(v27, "revision"));

    v28 = (void *)objc_claimAutoreleasedReturnValue([v6 pseudonym]);
    [v13 setPseudonym:v28];

    v29 = (void *)objc_claimAutoreleasedReturnValue([v6 publicKey]);
    [v13 setPublicKey:v29];

    v30 = (void *)objc_claimAutoreleasedReturnValue([v6 privateKey]);
    [v13 setPrivateKey:v30];

    v31 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    [v13 setName:v31];

    objc_msgSend(v13, "setLifetimeType:", objc_msgSend(v6, "linkLifetimeScope"));
    objc_msgSend(v13, "setDeleteReason:", (__int16)objc_msgSend(v6, "deleteReason"));
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p ",  objc_opt_class(self),  self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend( v4,  "appendFormat:",  @" isActivated=%d",  -[FTManagedConversationLink activated](self, "activated"));
  uint64_t v5 = objc_opt_self(self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pseudonym]);

  if (v7)
  {
    uint64_t v8 = objc_opt_self(self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pseudonym]);
    [v4 appendFormat:@" self.pseudonym=%@", v10];
  }

  uint64_t v11 = objc_opt_self(self);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 creationDate]);

  if (v13)
  {
    uint64_t v14 = objc_opt_self(self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 creationDate]);
    [v4 appendFormat:@" self.creationDate=%@", v16];
  }

  uint64_t v17 = objc_opt_self(self);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 deletionDate]);

  if (v19)
  {
    uint64_t v20 = objc_opt_self(self);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 deletionDate]);
    [v4 appendFormat:@" self.deletionDate=%@", v22];
  }

  uint64_t v23 = objc_opt_self(self);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 privateKey]);

  if (v25)
  {
    uint64_t v26 = objc_opt_self(self);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 privateKey]);
    [v4 appendFormat:@" self.privateKey=%@", v28];
  }

  uint64_t v29 = objc_opt_self(self);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 expirationDate]);

  if (v31)
  {
    uint64_t v32 = objc_opt_self(self);
    int v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 expirationDate]);
    [v4 appendFormat:@" self.expirationDate=%@", v34];
  }

  __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink groupUUID](self, "groupUUID"));
  [v4 appendFormat:@" groupUUID=%@", v35];

  id v36 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink originatorIdentifier](self, "originatorIdentifier"));
  [v4 appendFormat:@" originatorIdentifier=%@", v36];

  uint64_t v37 = objc_opt_self(self);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue([v38 name]);

  if (v39)
  {
    uint64_t v40 = objc_opt_self(self);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 name]);
    [v4 appendFormat:@" self.name=%@", v42];
  }

  objc_msgSend( v4,  "appendFormat:",  @" deleteReason=%hd",  (int)-[FTManagedConversationLink deleteReason](self, "deleteReason"));
  [v4 appendString:@">"];
  id v43 = [v4 copy];

  return v43;
}

- (void)updateWithDescriptor:(id)a3
{
  id v32 = a3;
  -[FTManagedConversationLink setActivated:](self, "setActivated:", [v32 isActivated]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v32 creationDate]);
  -[FTManagedConversationLink setCreationDate:](self, "setCreationDate:", v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v32 deletionDate]);
  -[FTManagedConversationLink setDeletionDate:](self, "setDeletionDate:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v32 expirationDate]);
  -[FTManagedConversationLink setExpirationDate:](self, "setExpirationDate:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v32 groupUUID]);
  -[FTManagedConversationLink setGroupUUID:](self, "setGroupUUID:", v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v32 originator]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  -[FTManagedConversationLink setOriginatorIdentifier:](self, "setOriginatorIdentifier:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v32 originator]);
  -[FTManagedConversationLink setOriginatorRevision:](self, "setOriginatorRevision:", [v10 revision]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v32 pseudonym]);
  -[FTManagedConversationLink setPseudonym:](self, "setPseudonym:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v32 publicKey]);
  -[FTManagedConversationLink setPublicKey:](self, "setPublicKey:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v32 privateKey]);
  -[FTManagedConversationLink setPrivateKey:](self, "setPrivateKey:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v32 name]);
  -[FTManagedConversationLink setName:](self, "setName:", v14);

  -[FTManagedConversationLink setLifetimeType:](self, "setLifetimeType:", [v32 linkLifetimeScope]);
  -[FTManagedConversationLink setDeleteReason:]( self,  "setDeleteReason:",  (__int16)[v32 deleteReason]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v32 originator]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 handle]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink originatorHandle](self, "originatorHandle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 tuHandle]);
  unsigned __int8 v19 = [v16 isEqualToHandle:v18];

  if ((v19 & 1) == 0)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v32 originator]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 handle]);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink managedObjectContext](self, "managedObjectContext"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[FTManagedHandle managedHandleForTUHandle:inManagedObjectContext:]( &OBJC_CLASS___FTManagedHandle,  "managedHandleForTUHandle:inManagedObjectContext:",  v21,  v22));
    -[FTManagedConversationLink setOriginatorHandle:](self, "setOriginatorHandle:", v23);
  }

  uint64_t v24 = objc_claimAutoreleasedReturnValue([v32 invitedHandles]);
  if (v24)
  {
    v25 = (void *)v24;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink tuInvitedHandles](self, "tuInvitedHandles"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v32 invitedHandles]);
    unsigned __int8 v28 = [v26 isEqualToSet:v27];

    if ((v28 & 1) == 0)
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v32 invitedHandles]);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink managedObjectContext](self, "managedObjectContext"));
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[FTManagedHandle managedHandlesForTUHandles:inManagedObjectContext:]( &OBJC_CLASS___FTManagedHandle,  "managedHandlesForTUHandles:inManagedObjectContext:",  v29,  v30));

      -[FTManagedConversationLink setInvitedHandles:](self, "setInvitedHandles:", v31);
    }
  }
}

- (TUConversationLinkDescriptor)tuConversationLinkDescriptor
{
  id v3 = objc_alloc(&OBJC_CLASS___TUConversationLinkOriginator);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink originatorIdentifier](self, "originatorIdentifier"));
  id v5 = -[FTManagedConversationLink originatorRevision](self, "originatorRevision");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink originatorHandle](self, "originatorHandle"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 tuHandle]);
  id v8 = [v3 initWithIdentifier:v4 revision:v5 handle:v7];

  id v9 = objc_alloc(&OBJC_CLASS___TUMutableConversationLinkDescriptor);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink groupUUID](self, "groupUUID"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink pseudonym](self, "pseudonym"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink publicKey](self, "publicKey"));
  id v13 = [v9 initWithGroupUUID:v10 originator:v8 pseudonym:v11 publicKey:v12];

  objc_msgSend(v13, "setActivated:", -[FTManagedConversationLink activated](self, "activated"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink creationDate](self, "creationDate"));
  [v13 setCreationDate:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink deletionDate](self, "deletionDate"));
  [v13 setDeletionDate:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink expirationDate](self, "expirationDate"));
  [v13 setExpirationDate:v16];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink tuInvitedHandles](self, "tuInvitedHandles"));
  [v13 setInvitedHandles:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink name](self, "name"));
  [v13 setName:v18];

  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink privateKey](self, "privateKey"));
  [v13 setPrivateKey:v19];

  objc_msgSend(v13, "setLinkLifetimeScope:", -[FTManagedConversationLink lifetimeType](self, "lifetimeType"));
  objc_msgSend(v13, "setDeleteReason:", (int)-[FTManagedConversationLink deleteReason](self, "deleteReason"));
  id v20 = [v13 copy];

  return (TUConversationLinkDescriptor *)v20;
}

- (NSSet)tuInvitedHandles
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedConversationLink invitedHandles](self, "invitedHandles"));
  id v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v2 count]));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)i), "tuHandle", (void)v13));
          if (v10) {
            [v4 addObject:v10];
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v7);
    }
  }

  else
  {
    v4 = 0LL;
  }

  id v11 = objc_msgSend(v4, "copy", (void)v13);

  return (NSSet *)v11;
}

- (FTManagedConversationLink)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FTManagedConversationLink();
  return -[FTManagedConversationLink initWithEntity:insertIntoManagedObjectContext:]( &v7,  "initWithEntity:insertIntoManagedObjectContext:",  a3,  a4);
}

@end