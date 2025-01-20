@interface CPLShareParticipant
+ (id)shareParticipantsFromCKShareParticipants:(id)a3 currentUserID:(id)a4;
- (id)initWithCKShareParticipant:(id)a3 currentUserID:(id)a4;
- (void)updateCKShareParticipant:(id)a3;
@end

@implementation CPLShareParticipant

+ (id)shareParticipantsFromCKShareParticipants:(id)a3 currentUserID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v12);
        v14 = objc_alloc(&OBJC_CLASS___CPLShareParticipant);
        v15 = -[CPLShareParticipant initWithCKShareParticipant:currentUserID:]( v14,  "initWithCKShareParticipant:currentUserID:",  v13,  v6,  (void)v17);
        -[NSMutableArray addObject:](v7, "addObject:", v15);

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v10);
  }

  return v7;
}

- (id)initWithCKShareParticipant:(id)a3 currentUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userRecordID]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 recordName]);

  if (!v10 || !CKCurrentUserDefaultName)
  {
    goto LABEL_6;
  }

  if ([(id)v10 isEqual:CKCurrentUserDefaultName])
  {
LABEL_6:
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 recordName]);

    uint64_t v10 = v11;
  }

- (void)updateCKShareParticipant:(id)a3
{
  id v6 = a3;
  v4 = (char *)-[CPLShareParticipant permission](self, "permission");
  else {
    id v5 = v4;
  }
  [v6 setPermission:v5];
}

@end