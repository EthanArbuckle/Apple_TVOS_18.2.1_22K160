@interface CPLShare
- (CPLShare)initWithCKShare:(id)a3 currentUserID:(id)a4;
@end

@implementation CPLShare

- (CPLShare)initWithCKShare:(id)a3 currentUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[CPLShare init](self, "init");
  if (v8)
  {
    v9 = (char *)[v6 publicPermission];
    else {
      v10 = v9;
    }
    -[CPLShare setPublicPermission:](v8, "setPublicPermission:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 URL]);
    -[CPLShare setURL:](v8, "setURL:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 participants]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[CPLShareParticipant shareParticipantsFromCKShareParticipants:currentUserID:]( &OBJC_CLASS___CPLShareParticipant,  "shareParticipantsFromCKShareParticipants:currentUserID:",  v12,  v7));
    -[CPLShare setParticipants:](v8, "setParticipants:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 creationDate]);
    -[CPLShare setCreationDate:](v8, "setCreationDate:", v14);
  }

  return v8;
}

@end