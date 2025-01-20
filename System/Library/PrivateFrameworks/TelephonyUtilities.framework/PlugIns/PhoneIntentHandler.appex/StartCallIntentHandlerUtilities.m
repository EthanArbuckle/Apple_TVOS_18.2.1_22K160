@interface StartCallIntentHandlerUtilities
+ (BOOL)contactsShareHandleValue:(id)a3;
+ (id)contactWithMostHandles:(id)a3;
+ (id)inPersonFromContact:(id)a3 handleValue:(id)a4 handleType:(int64_t)a5 handleLabel:(id)a6;
+ (id)sortContacts:(id)a3 withIdentifiers:(id)a4;
+ (void)populatePersonsByTUHandleFrom:(id)a3 personsByTUHandle:(id)a4 tuHandleOrderedSet:(id)a5;
@end

@implementation StartCallIntentHandlerUtilities

+ (id)sortContacts:(id)a3 withIdentifiers:(id)a4
{
  id v46 = a3;
  id v5 = a4;
  id v6 = IntentHandlerDefaultLog();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = IntentHandlerDefaultLog();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "sortMatchingContactsWithIdentifiers",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  if (v46)
  {
    os_signpost_id_t spid = v8;
    unint64_t v41 = v8 - 1;
    v44 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    id v42 = v5;
    id obj = v5;
    id v12 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v45 = *(void *)v56;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v56 != v45) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          id v16 = v46;
          id v17 = [v16 countByEnumeratingWithState:&v51 objects:v61 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v52;
            while (2)
            {
              for (j = 0LL; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v52 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)j);
                v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
                unsigned int v23 = [v15 isEqualToString:v22];

                if (v23)
                {
                  -[NSMutableArray addObject:](v44, "addObject:", v21);
                  goto LABEL_20;
                }
              }

              id v18 = [v16 countByEnumeratingWithState:&v51 objects:v61 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

+ (id)inPersonFromContact:(id)a3 handleValue:(id)a4 handleType:(int64_t)a5 handleLabel:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = -[INPersonHandle initWithValue:type:label:]( objc_alloc(&OBJC_CLASS___INPersonHandle),  "initWithValue:type:label:",  v10,  a5,  v9);

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CNContactFormatter stringFromContact:style:]( &OBJC_CLASS___CNContactFormatter,  "stringFromContact:style:",  v11,  0LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersonNameComponents componentsForContact:]( &OBJC_CLASS___NSPersonNameComponents,  "componentsForContact:",  v11));
  v15 = objc_alloc(&OBJC_CLASS___INPerson);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  LOBYTE(v20) = 0;
  id v17 = -[INPerson initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:]( v15,  "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:",  v12,  v14,  v13,  0LL,  v16,  0LL,  v20);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 phonemeData]);
  -[INPerson setPhonemeData:](v17, "setPhonemeData:", v18);

  return v17;
}

+ (BOOL)contactsShareHandleValue:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v38 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v3 count]);
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v35 = v3;
    id obj = v3;
    id v4 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v37 = *(void *)v52;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v52 != v37) {
            objc_enumerationMutation(obj);
          }
          v7 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
          os_signpost_id_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 phoneNumbers]);
          id v10 = [v9 countByEnumeratingWithState:&v47 objects:v57 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v48;
            do
            {
              for (j = 0LL; j != v11; j = (char *)j + 1)
              {
                if (*(void *)v48 != v12) {
                  objc_enumerationMutation(v9);
                }
                v15 = (void *)objc_claimAutoreleasedReturnValue([v14 unformattedInternationalStringValue]);

                -[NSMutableSet addObject:](v8, "addObject:", v15);
              }

              id v11 = [v9 countByEnumeratingWithState:&v47 objects:v57 count:16];
            }

            while (v11);
          }

          __int128 v45 = 0u;
          __int128 v46 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 emailAddresses]);
          id v17 = [v16 countByEnumeratingWithState:&v43 objects:v56 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v44;
            do
            {
              for (k = 0LL; k != v18; k = (char *)k + 1)
              {
                if (*(void *)v44 != v19) {
                  objc_enumerationMutation(v16);
                }
                v22 = (void *)objc_claimAutoreleasedReturnValue([v21 lowercaseString]);
                -[NSMutableSet addObject:](v8, "addObject:", v22);
              }

              id v18 = [v16 countByEnumeratingWithState:&v43 objects:v56 count:16];
            }

            while (v18);
          }

          id v23 = -[NSMutableSet copy](v8, "copy");
          -[NSMutableDictionary setObject:forKey:](v38, "setObject:forKey:", v23, v7);
        }

        id v5 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
      }

      while (v5);
    }

    v24 = objc_alloc(&OBJC_CLASS___NSMutableSet);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v38, "allValues"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 firstObject]);
    id v27 = -[NSMutableSet initWithSet:](v24, "initWithSet:", v26);

    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v38, "allValues"));
    id v29 = [v28 countByEnumeratingWithState:&v39 objects:v55 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v40;
      do
      {
        for (m = 0LL; m != v30; m = (char *)m + 1)
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(v28);
          }
          -[NSMutableSet intersectSet:](v27, "intersectSet:", *(void *)(*((void *)&v39 + 1) + 8LL * (void)m), v35);
        }

        id v30 = [v28 countByEnumeratingWithState:&v39 objects:v55 count:16];
      }

      while (v30);
    }

    BOOL v33 = -[NSMutableSet count](v27, "count") != 0LL;
    id v3 = v35;
  }

  else
  {
    BOOL v33 = 1;
  }

  return v33;
}

+ (id)contactWithMostHandles:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 emailAddresses]);
  id v6 = (char *)[v5 count];
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 phoneNumbers]);
  id v8 = [v7 count];

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v9 = v3;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = &v6[(void)v8];
    uint64_t v13 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "emailAddresses", (void)v22));
        id v17 = (char *)[v16 count];
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 phoneNumbers]);
        uint64_t v19 = &v17[(void)[v18 count]];

        if (v19 > v12)
        {
          id v20 = v15;

          uint64_t v12 = v19;
          id v4 = v20;
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v11);
  }

  return v4;
}

+ (void)populatePersonsByTUHandleFrom:(id)a3 personsByTUHandle:(id)a4 tuHandleOrderedSet:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithPerson:](&OBJC_CLASS___TUHandle, "handleWithPerson:", v14));
        if (v15)
        {
          [v9 addObject:v15];
          id v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v15]);
          if (!v16)
          {
            id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            [v8 setObject:v16 forKeyedSubscript:v15];
          }

          -[NSMutableArray addObject:](v16, "addObject:", v14);
        }
      }

      id v11 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }
}

@end