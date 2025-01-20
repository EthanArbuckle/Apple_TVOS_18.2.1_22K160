@interface ConversationPersonFilter
- (BOOL)_matchesCallerFilter:(id)a3;
- (BOOL)_matchesParticipantsFilter:(id)a3;
- (BOOL)matches:(id)a3;
- (ConversationPersonFilter)initWithCaller:(id)a3 participants:(id)a4 dataSource:(id)a5;
- (INPerson)caller;
- (NSArray)participants;
- (TUContactsDataSource)contactsDataSource;
- (id)_contactPoolForConversation:(id)a3;
- (id)_identifiersForRecommendedPerson:(id)a3;
@end

@implementation ConversationPersonFilter

- (ConversationPersonFilter)initWithCaller:(id)a3 participants:(id)a4 dataSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ConversationPersonFilter;
  v12 = -[ConversationPersonFilter init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_caller, a3);
    objc_storeStrong((id *)&v13->_participants, a4);
    objc_storeStrong((id *)&v13->_contactsDataSource, a5);
  }

  return v13;
}

- (BOOL)matches:(id)a3
{
  v3 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationPersonFilter _contactPoolForConversation:](self, "_contactPoolForConversation:", a3));
  unsigned __int8 v5 = -[ConversationPersonFilter _matchesCallerFilter:](v3, "_matchesCallerFilter:", v4);
  LOBYTE(v3) = v5 & -[ConversationPersonFilter _matchesParticipantsFilter:](v3, "_matchesParticipantsFilter:", v4);

  return (char)v3;
}

- (BOOL)_matchesCallerFilter:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationPersonFilter caller](self, "caller"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationPersonFilter caller](self, "caller"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[ConversationPersonFilter _identifiersForRecommendedPerson:]( self,  "_identifiersForRecommendedPerson:",  v6));

    unsigned int v8 = [v4 callerPoolContainsOneOf:v7];
    id v9 = IntentHandlerDefaultLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = @"NO";
      if (v8) {
        id v11 = @"YES";
      }
      int v13 = 138412290;
      v14 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "ConversationPersonFilter: matchesCaller=%@",  (uint8_t *)&v13,  0xCu);
    }
  }

  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (BOOL)_matchesParticipantsFilter:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationPersonFilter participants](self, "participants"));
  id v6 = [v5 count];

  if (v6)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationPersonFilter participants](self, "participants", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue( -[ConversationPersonFilter _identifiersForRecommendedPerson:]( self,  "_identifiersForRecommendedPerson:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)i)));
          unsigned int v13 = [v4 participantsPoolContainsOneOf:v12];

          if (!v13)
          {
            BOOL v14 = 0;
            goto LABEL_12;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    BOOL v14 = 1;
LABEL_12:
  }

  else
  {
    BOOL v14 = 1;
  }

  id v15 = IntentHandlerDefaultLog();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = @"NO";
    if (v14) {
      v17 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v24 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "ConversationPersonFilter: matchesParticipants=%@",  buf,  0xCu);
  }

  return v14;
}

- (id)_contactPoolForConversation:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteMembers]);
  id v7 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v35 + 1) + 8 * (void)i) handle]);
        -[NSMutableArray addObject:](v5, "addObject:", v11);
      }

      id v8 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }

    while (v8);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationPersonFilter contactsDataSource](self, "contactsDataSource"));
  v40 = CNContactIdentifierKey;
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tu_contactsForHandles:keyDescriptors:error:", v5, v13, 0));

  id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allValues", 0));
  id v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        -[NSMutableArray addObjectsFromArray:]( v15,  "addObjectsFromArray:",  *(void *)(*((void *)&v31 + 1) + 8LL * (void)j));
      }

      id v18 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }

    while (v18);
  }

  __int128 v21 = -[ContactPool initWithContacts:](objc_alloc(&OBJC_CLASS___ContactPool), "initWithContacts:", v15);
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v4 initiator]);

  id v23 = &__NSArray0__struct;
  if (v22)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v4 initiator]);
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v24]);
    v26 = (void *)v25;
    if (v25) {
      v27 = (void *)v25;
    }
    else {
      v27 = &__NSArray0__struct;
    }
    id v23 = v27;
  }

  v28 = -[ContactPool initWithContacts:](objc_alloc(&OBJC_CLASS___ContactPool), "initWithContacts:", v23);
  v29 = objc_alloc_init(&OBJC_CLASS___ConversationContactPool);
  -[ConversationContactPool setCallerPool:](v29, "setCallerPool:", v28);
  -[ConversationContactPool setParticipantsPool:](v29, "setParticipantsPool:", v21);

  return v29;
}

- (id)_identifiersForRecommendedPerson:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 extractRecommendation]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 contactIdentifiers]);

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));
  return v5;
}

- (INPerson)caller
{
  return self->_caller;
}

- (NSArray)participants
{
  return self->_participants;
}

- (TUContactsDataSource)contactsDataSource
{
  return self->_contactsDataSource;
}

- (void).cxx_destruct
{
}

@end