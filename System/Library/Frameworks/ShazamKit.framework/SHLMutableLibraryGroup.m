@interface SHLMutableLibraryGroup
- (id)copyWithZone:(_NSZone *)a3;
- (void)addTracks:(id)a3;
- (void)removeTracks:(id)a3;
@end

@implementation SHLMutableLibraryGroup

- (void)addTracks:(id)a3
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 associatedGroupIdentifier]);

        if (v10)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v9 associatedGroupIdentifier]);
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Track with identifier %@ is already associated to a group (%@), try removing it before.",  v14,  v15,  (void)v18));
          id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSException shl_exceptionWithName:reason:]( &OBJC_CLASS___NSException,  "shl_exceptionWithName:reason:",  NSInvalidArgumentException,  v16));

          objc_exception_throw(v17);
        }

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryGroup identifier](self, "identifier"));
        [v9 setAssociatedGroupIdentifier:v11];

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryGroup tracksToSave](self, "tracksToSave"));
        id v13 = [v9 copy];
        [v12 addObject:v13];
      }

      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v6);
  }
}

- (void)removeTracks:(id)a3
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 associatedGroupIdentifier]);

        if (!v10)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
          v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Track with identifier %@ cannot be removed, try adding it before.",  v13));
          id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSException shl_exceptionWithName:reason:]( &OBJC_CLASS___NSException,  "shl_exceptionWithName:reason:",  NSInvalidArgumentException,  v14));

          objc_exception_throw(v15);
        }

        [v9 setAssociatedGroupIdentifier:0];
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryGroup tracksToSave](self, "tracksToSave"));
        id v12 = [v9 copy];
        [v11 addObject:v12];
      }

      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SHLLibraryGroup initWithLibraryGroup:]( +[SHLLibraryGroup allocWithZone:](&OBJC_CLASS___SHLLibraryGroup, "allocWithZone:", a3),  "initWithLibraryGroup:",  self);
}

@end