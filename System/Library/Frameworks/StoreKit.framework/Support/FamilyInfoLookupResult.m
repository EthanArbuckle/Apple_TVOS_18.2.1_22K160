@interface FamilyInfoLookupResult
+ (id)_familyMembersFromDictionaryRepresentation:(id)a3;
- (BOOL)isCached;
- (FamilyInfoLookupResult)initWithDictionaryRepresentation:(id)a3 cached:(BOOL)a4;
- (NSArray)familyMembers;
- (NSDictionary)dictionaryRepresentation;
- (id)description;
@end

@implementation FamilyInfoLookupResult

- (FamilyInfoLookupResult)initWithDictionaryRepresentation:(id)a3 cached:(BOOL)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___FamilyInfoLookupResult;
  v7 = -[FamilyInfoLookupResult init](&v13, "init");
  v8 = v7;
  if (v7)
  {
    v7->_cached = a4;
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[FamilyInfoLookupResult _familyMembersFromDictionaryRepresentation:]( &OBJC_CLASS___FamilyInfoLookupResult,  "_familyMembersFromDictionaryRepresentation:",  v6));
    v10 = (void *)v9;
    if (v9) {
      v11 = (void *)v9;
    }
    else {
      v11 = &__NSArray0__struct;
    }
    objc_storeStrong((id *)&v8->_familyMembers, v11);
  }

  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyInfoLookupResult familyMembers](self, "familyMembers", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v8) dictionaryRepresentation]);
        if (v9) {
          -[NSMutableArray addObject:](v3, "addObject:", v9);
        }

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }

    while (v6);
  }

  v18 = v3;
  v19 = @"family";
  v17 = @"members";
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  v20 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));

  return (NSDictionary *)v11;
}

- (id)description
{
  unsigned int v3 = -[FamilyInfoLookupResult isCached](self, "isCached");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyInfoLookupResult familyMembers](self, "familyMembers"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ cached: %d familyMembers: %@ }",  v3,  v4));

  return v5;
}

+ (id)_familyMembersFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_activeiCloudAccount"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_DSID"));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_activeiTunesAccount"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_DSID"));

  v37 = v3;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKeyPath:@"family.members"]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
    id v12 = v10;
  }
  else {
    id v12 = 0LL;
  }

  v40 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
  v41 = v6;
  v39 = v13;
  if (!v14)
  {

    goto LABEL_26;
  }

  id v15 = v14;
  v38 = 0LL;
  uint64_t v16 = *(void *)v47;
  do
  {
    for (i = 0LL; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v47 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)i);
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
      {
        v20 = -[FamilyMember initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___FamilyMember),  "initWithDictionaryRepresentation:",  v18);
        if (v20)
        {
          -[NSMutableArray addObject:](v40, "addObject:", v20);
          if (v6)
          {
            v21 = (FamilyMember *)objc_claimAutoreleasedReturnValue(-[FamilyMember iCloudDSID](v20, "iCloudDSID"));
            else {
              BOOL v22 = 1;
            }
            if (v22)
            {
LABEL_18:
            }

            else
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyMember iTunesDSID](v20, "iTunesDSID"));
              unsigned int v24 = [v23 isEqualToNumber:v9];

              if (v24)
              {
                v21 = v38;
                id v13 = v39;
                v38 = v20;
                id v6 = v41;
                goto LABEL_18;
              }

              id v6 = v41;
              id v13 = v39;
            }
          }
        }

        continue;
      }
    }

    id v15 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
  }

  while (v15);

  v25 = v38;
  if (!v38)
  {
LABEL_26:
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    v26 = v40;
    id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v42,  v50,  16LL);
    if (v27)
    {
      id v28 = v27;
      v25 = 0LL;
      uint64_t v29 = *(void *)v43;
      do
      {
        for (j = 0LL; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(v26);
          }
          if (v9)
          {
            v31 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)j);
            v32 = (void *)objc_claimAutoreleasedReturnValue([v31 iTunesDSID]);
            unsigned int v33 = [v32 isEqualToNumber:v9];

            if (v33)
            {
              v34 = v31;

              v25 = v34;
            }

            id v6 = v41;
          }
        }

        id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v42,  v50,  16LL);
      }

      while (v28);
    }

    else
    {
      v25 = 0LL;
    }
  }

  -[FamilyMember setCurrentSignedInUser:](v25, "setCurrentSignedInUser:", 1LL);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v40, "sortedArrayUsingComparator:", &stru_1002E9FF8));

  return v35;
}

- (BOOL)isCached
{
  return self->_cached;
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void).cxx_destruct
{
}

@end