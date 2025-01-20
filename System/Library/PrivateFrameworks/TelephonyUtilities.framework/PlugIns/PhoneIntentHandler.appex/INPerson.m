@interface INPerson
+ (id)tu_personMatchingHandle:(id)a3 contactsDataSource:(id)a4 isoCountryCodes:(id)a5;
- (BOOL)usesScoreBasedEncoding;
- (id)extractRecommendation;
- (id)tu_allContactIdentifiers;
- (id)tu_contactsMatchingIdentifiers:(id)a3 contactsDataSource:(id)a4 identifierToContactCache:(id)a5;
- (id)tu_handlesMatchingPersonWithContactsDataSource:(id)a3 identifierToContactCache:(id)a4;
- (id)tu_matchingINPersonHandlesByContactIdentifier;
- (id)tu_personWithFormattedHandleForISOCountryCodes:(id)a3;
@end

@implementation INPerson

- (id)tu_allContactIdentifiers
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson contactIdentifier](self, "contactIdentifier"));
  id v5 = [v4 length];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson contactIdentifier](self, "contactIdentifier"));
    -[NSMutableOrderedSet addObject:](v3, "addObject:", v6);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson siriMatches](self, "siriMatches", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 contactIdentifier]);
        id v14 = [v13 length];

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v12 contactIdentifier]);
          -[NSMutableOrderedSet addObject:](v3, "addObject:", v15);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v3, "array"));
  return v16;
}

- (id)tu_matchingINPersonHandlesByContactIdentifier
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson siriMatches](self, "siriMatches", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v9 contactIdentifier]);
        if (-[NSMutableArray length](v10, "length"))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue([v9 personHandle]);

          if (!v11) {
            continue;
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue([v9 contactIdentifier]);
          uint64_t v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v12));

          if (!v10)
          {
            uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            v13 = (void *)objc_claimAutoreleasedReturnValue([v9 contactIdentifier]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, v13);
          }

          id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 personHandle]);
          -[NSMutableArray addObject:](v10, "addObject:", v14);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v6);
  }

  id v15 = -[NSMutableDictionary copy](v3, "copy");
  return v15;
}

- (id)tu_personWithFormattedHandleForISOCountryCodes:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson personHandle](self, "personHandle"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
  if ([v5 type] == (id)2
    || ![v5 type] && objc_msgSend(v6, "_appearsToBePhoneNumber"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CNPhoneNumber phoneNumberWithDigits:countryCode:]( &OBJC_CLASS___CNPhoneNumber,  "phoneNumberWithDigits:countryCode:",  v6,  v7));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 formattedStringValue]);

    [v5 setValue:v9 forKey:@"value"];
  }

  id v10 = -[INPerson mutableCopy](self, "mutableCopy");
  [v10 setPersonHandle:v5];

  return v10;
}

- (id)tu_handlesMatchingPersonWithContactsDataSource:(id)a3 identifierToContactCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = IntentHandlerDefaultLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = IntentHandlerDefaultLog();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "handlesMatchingPerson",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson personHandle](self, "personHandle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 value]);
  id v17 = [v16 length];

  if (v17)
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithPerson:](&OBJC_CLASS___TUHandle, "handleWithPerson:", self));
    -[NSMutableArray addObject:](v14, "addObject:", v18);
  }

  else
  {
    uint64_t v55 = objc_claimAutoreleasedReturnValue(-[INPerson tu_allContactIdentifiers](self, "tu_allContactIdentifiers"));
    id v56 = v7;
    id v57 = v6;
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( -[INPerson tu_contactsMatchingIdentifiers:contactsDataSource:identifierToContactCache:]( self,  "tu_contactsMatchingIdentifiers:contactsDataSource:identifierToContactCache:"));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson personHandle](self, "personHandle"));
    unint64_t v21 = (unint64_t)[v20 type];

    __int128 v75 = 0u;
    __int128 v76 = 0u;
    BOOL v22 = (v21 & 1) == 0 && v21 < 3;
    BOOL v63 = v22;
    __int128 v73 = 0uLL;
    __int128 v74 = 0uLL;
    id obj = v19;
    id v64 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
    if (v64)
    {
      unsigned int v62 = (v21 < 3) & (3u >> (v21 & 7));
      uint64_t v61 = *(void *)v74;
      v58 = self;
      do
      {
        for (i = 0LL; i != v64; i = (char *)i + 1)
        {
          if (*(void *)v74 != v61) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
          if (v63)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson personHandle](self, "personHandle"));
            v26 = (void *)objc_claimAutoreleasedReturnValue([v25 label]);
            v60 = v24;
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "tu_phoneNumbersMatchingPersonHandleLabel:", v26));

            __int128 v71 = 0u;
            __int128 v72 = 0u;
            __int128 v69 = 0u;
            __int128 v70 = 0u;
            id v28 = v27;
            id v29 = [v28 countByEnumeratingWithState:&v69 objects:v79 count:16];
            if (v29)
            {
              id v30 = v29;
              uint64_t v31 = *(void *)v70;
              do
              {
                for (j = 0LL; j != v30; j = (char *)j + 1)
                {
                  if (*(void *)v70 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  v33 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)j);
                  v34 = objc_alloc(&OBJC_CLASS___TUHandle);
                  v35 = (void *)objc_claimAutoreleasedReturnValue([v33 value]);
                  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 stringValue]);
                  v37 = -[TUHandle initWithType:value:](v34, "initWithType:value:", 2LL, v36);

                  -[NSMutableArray addObject:](v14, "addObject:", v37);
                }

                id v30 = [v28 countByEnumeratingWithState:&v69 objects:v79 count:16];
              }

              while (v30);
            }

            self = v58;
            v24 = v60;
          }

          if (v62)
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson personHandle](self, "personHandle"));
            v39 = (void *)objc_claimAutoreleasedReturnValue([v38 label]);
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "tu_emailAddressesMatchingPersonHandleLabel:", v39));

            __int128 v67 = 0u;
            __int128 v68 = 0u;
            __int128 v65 = 0u;
            __int128 v66 = 0u;
            id v41 = v40;
            id v42 = [v41 countByEnumeratingWithState:&v65 objects:v78 count:16];
            if (v42)
            {
              id v43 = v42;
              uint64_t v44 = *(void *)v66;
              do
              {
                for (k = 0LL; k != v43; k = (char *)k + 1)
                {
                  if (*(void *)v66 != v44) {
                    objc_enumerationMutation(v41);
                  }
                  v46 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)k);
                  v47 = objc_alloc(&OBJC_CLASS___TUHandle);
                  v48 = (void *)objc_claimAutoreleasedReturnValue([v46 value]);
                  v49 = -[TUHandle initWithType:value:](v47, "initWithType:value:", 3LL, v48);

                  -[NSMutableArray addObject:](v14, "addObject:", v49);
                }

                id v43 = [v41 countByEnumeratingWithState:&v65 objects:v78 count:16];
              }

              while (v43);
            }
          }
        }

        id v64 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
      }

      while (v64);
    }

    id v7 = v56;
    id v6 = v57;
    __int128 v18 = (void *)v55;
  }

  id v50 = IntentHandlerDefaultLog();
  v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
  v52 = v51;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v52,  OS_SIGNPOST_INTERVAL_END,  v10,  "handlesMatchingPerson",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  id v53 = -[NSMutableArray copy](v14, "copy");
  return v53;
}

- (id)tu_contactsMatchingIdentifiers:(id)a3 contactsDataSource:(id)a4 identifierToContactCache:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    id v57 = v8;
    id v10 = IntentHandlerDefaultLog();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_signpost_id_t v12 = os_signpost_id_generate(v11);

    id v13 = IntentHandlerDefaultLog();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = v14;
    unint64_t v55 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v12,  "contactsMatchingIdentifiers",  (const char *)&unk_1000275CF,  buf,  2u);
    }

    os_signpost_id_t spid = v12;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    id v56 = v7;
    id v18 = v7;
    id v19 = [v18 countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v64;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v64 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v23]);
          if (v24)
          {
            v25 = v17;
            v26 = v24;
          }

          else
          {
            v25 = v16;
            v26 = v23;
          }

          -[NSMutableArray addObject:](v25, "addObject:", v26);
        }

        id v20 = [v18 countByEnumeratingWithState:&v63 objects:v71 count:16];
      }

      while (v20);
    }

    id v8 = v57;
    if (-[NSMutableArray count](v16, "count"))
    {
      id v27 = IntentHandlerDefaultLog();
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v70 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Looking up contact in the contact store matching identifiers: %@",  buf,  0xCu);
      }

      uint64_t v29 = objc_claimAutoreleasedReturnValue( +[CNContact predicateForContactsWithIdentifiers:]( &OBJC_CLASS___CNContact,  "predicateForContactsWithIdentifiers:",  v16));
      v68[0] = CNContactPhoneNumbersKey;
      v68[1] = CNContactEmailAddressesKey;
      uint64_t v62 = 0LL;
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v68, 2LL));
      id v53 = (void *)v29;
      id v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "unifiedContactsMatchingPredicate:keysToFetch:error:", v29));
      id v31 = 0LL;
      if (v31)
      {
        id v32 = IntentHandlerDefaultLog();
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_1000200C0((uint64_t)v31, v33, v34, v35, v36, v37, v38, v39);
        }
      }

      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      id v40 = v30;
      id v41 = [v40 countByEnumeratingWithState:&v58 objects:v67 count:16];
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v59;
        do
        {
          for (j = 0LL; j != v42; j = (char *)j + 1)
          {
            if (*(void *)v59 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)j);
            v46 = (void *)objc_claimAutoreleasedReturnValue([v45 identifier]);
            [v9 setObject:v45 forKey:v46];

            -[NSMutableArray addObject:](v17, "addObject:", v45);
          }

          id v42 = [v40 countByEnumeratingWithState:&v58 objects:v67 count:16];
        }

        while (v42);
      }

      id v8 = v57;
    }

    id v47 = IntentHandlerDefaultLog();
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    v49 = v48;
    if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v49,  OS_SIGNPOST_INTERVAL_END,  spid,  "contactsMatchingIdentifiers",  (const char *)&unk_1000275CF,  buf,  2u);
    }

    id v50 = -[NSMutableArray copy](v17, "copy");
    id v7 = v56;
  }

  else
  {
    id v50 = &__NSArray0__struct;
  }

  return v50;
}

+ (id)tu_personMatchingHandle:(id)a3 contactsDataSource:(id)a4 isoCountryCodes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = IntentHandlerDefaultLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  id v13 = IntentHandlerDefaultLog();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  unint64_t v16 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v12,  "personMatchingHandle",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  id v17 = IntentHandlerDefaultLog();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v71 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Looking up contact in the contact store matching handle: %@",  buf,  0xCu);
  }

  id v19 = [v7 type];
  if (v19 == (id)1)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 value]);
    unsigned int v21 = [v20 _appearsToBePhoneNumber];

    if (!v21)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v7 value]);
      unsigned int v26 = [v25 _appearsToBeEmail];

      if (!v26)
      {
LABEL_23:
        id v42 = IntentHandlerDefaultLog();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_100020124((uint64_t)v7, v24, v43, v44, v45, v46, v47, v48);
        }
        v49 = 0LL;
        goto LABEL_37;
      }

      goto LABEL_13;
    }

- (BOOL)usesScoreBasedEncoding
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson scoredAlternatives](self, "scoredAlternatives"));
  if ([v3 count])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson scoredAlternatives](self, "scoredAlternatives"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 score]);
    BOOL v7 = v6 != 0LL;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)extractRecommendation
{
  if (-[INPerson usesScoreBasedEncoding](self, "usesScoreBasedEncoding"))
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson scoredAlternatives](self, "scoredAlternatives", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v43 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 person]);
          os_signpost_id_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 contactIdentifier]);

          if ([v12 length])
          {
            -[NSMutableOrderedSet addObject:](v4, "addObject:", v12);
            id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v3, "valueForKey:", v12));
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 score]);
            unint64_t v16 = v14;
            if (v14)
            {
              id v17 = v14;
            }

            else
            {
              LODWORD(v15) = 0;
              id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v15));
            }

            id v18 = v17;

            if (!v13 || [v18 compare:v13] == (id)1) {
              -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v18, v12);
            }
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }

      while (v7);
    }

    id v19 = -[NSMutableDictionary copy](v3, "copy");
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v4, "array"));

    if ([v20 count])
    {
      if ([v19 count] == (id)1)
      {
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v19 allValues]);
        BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);

        [v22 floatValue];
        if (v23 >= 0.7) {
          uint64_t v24 = 1LL;
        }
        else {
          uint64_t v24 = 2LL;
        }
      }

      else
      {
        uint64_t v24 = 3LL;
      }
    }

    else
    {
      uint64_t v24 = 0LL;
    }
  }

  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson contactIdentifier](self, "contactIdentifier"));
    id v26 = [v25 length];

    if (v26)
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson contactIdentifier](self, "contactIdentifier"));
      uint64_t v47 = v27;
      uint64_t v24 = 1LL;
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL));
    }

    else
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson siriMatches](self, "siriMatches"));
      if ([v28 count] == (id)1)
      {
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson siriMatches](self, "siriMatches"));
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 firstObject]);
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 contactIdentifier]);

        if (v31)
        {
          id v32 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson siriMatches](self, "siriMatches"));
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 firstObject]);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 contactIdentifier]);
          uint64_t v46 = v34;
          id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v46,  1LL));

          uint64_t v24 = 2LL;
          goto LABEL_31;
        }
      }

      else
      {
      }

      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson siriMatches](self, "siriMatches"));
      id v38 = [v37 count];

      if ((unint64_t)v38 < 2)
      {
        uint64_t v24 = 0LL;
        id v20 = &__NSArray0__struct;
      }

      else
      {
        id v39 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson siriMatches](self, "siriMatches"));
        id v40 = NSStringFromSelector("contactIdentifier");
        id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v39 valueForKey:v41]);

        uint64_t v24 = 3LL;
      }
    }
  }

@end