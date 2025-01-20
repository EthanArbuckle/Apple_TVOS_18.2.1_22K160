@interface SAPerson
- (BOOL)ad_transcriptionResultRequiresAddressBook;
- (id)_ad_personContactHandlesWithAddressBookManager:(id)a3;
- (id)ad_transcriptionResultWithAddressBookManager:(id)a3;
@end

@implementation SAPerson

- (id)ad_transcriptionResultWithAddressBookManager:(id)a3
{
  v4 = (ADAddressBookManager *)a3;
  if (!v4) {
    v4 = objc_alloc_init(&OBJC_CLASS___ADAddressBookManager);
  }
  id v5 = objc_alloc_init(&OBJC_CLASS___STPerson);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAPerson fullName](self, "fullName"));
  [v5 setFullName:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue( -[SAPerson _ad_personContactHandlesWithAddressBookManager:]( self,  "_ad_personContactHandlesWithAddressBookManager:",  v4));
  [v5 setContactHandles:v7];

  return v5;
}

- (BOOL)ad_transcriptionResultRequiresAddressBook
{
  return 1;
}

- (id)_ad_personContactHandlesWithAddressBookManager:(id)a3
{
  id v25 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAPerson emails](self, "emails"));
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 label]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v10 emailAddress]);
        if (v12)
        {
          id v13 = objc_alloc_init(&OBJC_CLASS___STPersonContactHandle);
          [v13 setType:0];
          [v13 setLabel:v11];
          [v13 setHandle:v12];
          -[NSMutableSet addObject:](v4, "addObject:", v13);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v7);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SAPerson phones](self, "phones"));
  id v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)j);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 label]);
        v21 = (void *)objc_claimAutoreleasedReturnValue([v19 number]);
        if (v21)
        {
          id v22 = objc_alloc_init(&OBJC_CLASS___STPersonContactHandle);
          [v22 setType:1];
          [v22 setLabel:v20];
          [v22 setHandle:v21];
          -[NSMutableSet addObject:](v4, "addObject:", v22);
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }

    while (v16);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v25 contactHandlesForPerson:self]);
  -[NSMutableSet unionSet:](v4, "unionSet:", v23);

  return v4;
}

@end