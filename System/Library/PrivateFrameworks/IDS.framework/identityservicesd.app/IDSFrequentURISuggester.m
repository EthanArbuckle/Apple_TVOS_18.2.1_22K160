@interface IDSFrequentURISuggester
- (BOOL)checkContactsForDestination:(id)a3;
- (IDSFrequentURISuggester)init;
- (id)matchingContactsForURI:(id)a3;
- (id)predicateForURI:(id)a3;
@end

@implementation IDSFrequentURISuggester

- (IDSFrequentURISuggester)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSFrequentURISuggester;
  return -[IDSFrequentURISuggester init](&v3, "init");
}

- (id)predicateForURI:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([a3 _stripPotentialTokenURIWithToken:0]);
  id v4 = [v3 _FZIDType];
  v5 = (void *)IMWeakLinkClass(@"CNContact", @"Contacts");
  if (!v4)
  {
    v9 = (void *)IMWeakLinkClass(@"CNPhoneNumber", @"Contacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 _stripFZIDPrefix]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v9 phoneNumberWithStringValue:v10]);

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 predicateForContactsMatchingPhoneNumber:v7]);
    goto LABEL_5;
  }

  v6 = 0LL;
  if (v4 == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 _stripFZIDPrefix]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 predicateForContactsMatchingEmailAddress:v7]);
LABEL_5:
    v6 = (void *)v8;
  }

  return v6;
}

- (id)matchingContactsForURI:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFrequentURISuggester predicateForURI:](self, "predicateForURI:", v4));
  if (v5)
  {
    uint64_t v14 = 0LL;
    v15 = &v14;
    uint64_t v16 = 0x3032000000LL;
    v17 = sub_100032B60;
    v18 = sub_100032B70;
    id v19 = 0LL;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100032B78;
    block[3] = &unk_1008F6878;
    block[4] = &v14;
    if (qword_1009BE5F8 != -1) {
      dispatch_once(&qword_1009BE5F8, block);
    }
    id v6 = objc_alloc_init((Class)IMWeakLinkClass(@"CNContactStore", @"Contacts"));
    uint64_t v22 = v15[5];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    id v12 = 0LL;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 unifiedContactsMatchingPredicate:v5 keysToFetch:v7 error:&v12]);
    id v9 = v12;

    if (v9)
    {
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog opportunistic](&OBJC_CLASS___IDSFoundationLog, "opportunistic"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Error retrieving contacts {error: %@}",  buf,  0xCu);
      }
    }

    _Block_object_dispose(&v14, 8);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (BOOL)checkContactsForDestination:(id)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "destinationURIs", 0));
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSFrequentURISuggester matchingContactsForURI:]( self,  "matchingContactsForURI:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)i)));
        v10 = v9;
        if (!v9 || ![v9 count])
        {

          BOOL v11 = 0;
          goto LABEL_13;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      BOOL v11 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v11 = 1;
  }

@end