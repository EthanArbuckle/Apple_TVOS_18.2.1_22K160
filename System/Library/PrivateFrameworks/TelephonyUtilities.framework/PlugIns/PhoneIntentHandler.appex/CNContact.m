@interface CNContact
- (BOOL)tu_labeledValue:(id)a3 matchesPersonHandleLabel:(id)a4;
- (id)tu_emailAddressesMatchingPersonHandleLabel:(id)a3;
- (id)tu_personHandleMatchingHandle:(id)a3 isoCountryCodes:(id)a4;
- (id)tu_phoneNumbersMatchingPersonHandleLabel:(id)a3;
@end

@implementation CNContact

- (id)tu_phoneNumbersMatchingPersonHandleLabel:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact phoneNumbers](self, "phoneNumbers", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
        if (![v4 length]
          || -[CNContact tu_labeledValue:matchesPersonHandleLabel:]( self,  "tu_labeledValue:matchesPersonHandleLabel:",  v11,  v4))
        {
          -[NSMutableArray addObject:](v5, "addObject:", v11);
        }

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  id v12 = -[NSMutableArray copy](v5, "copy");
  return v12;
}

- (id)tu_emailAddressesMatchingPersonHandleLabel:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact emailAddresses](self, "emailAddresses", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
        if (![v4 length]
          || -[CNContact tu_labeledValue:matchesPersonHandleLabel:]( self,  "tu_labeledValue:matchesPersonHandleLabel:",  v11,  v4))
        {
          -[NSMutableArray addObject:](v5, "addObject:", v11);
        }

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  id v12 = -[NSMutableArray copy](v5, "copy");
  return v12;
}

- (BOOL)tu_labeledValue:(id)a3 matchesPersonHandleLabel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = INPersonHandleLabelForCNLabeledValue(v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if ([v8 length] && !objc_msgSend(v8, "caseInsensitiveCompare:", v6))
  {
    BOOL v11 = 1;
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 label]);
    if ([v9 length] && !objc_msgSend(v9, "caseInsensitiveCompare:", v6))
    {
      BOOL v11 = 1;
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[CNLabeledValue localizedStringForLabel:]( &OBJC_CLASS___CNLabeledValue,  "localizedStringForLabel:",  v9));
      BOOL v11 = [v10 length] && !objc_msgSend(v10, "caseInsensitiveCompare:", v6);
    }
  }

  return v11;
}

- (id)tu_personHandleMatchingHandle:(id)a3 isoCountryCodes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = &_sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ_ptr;
  uint64_t v9 = objc_alloc(&OBJC_CLASS___INPersonHandle);
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[INPersonHandle tu_initUnlabledPersonHandleWithTUHandle:isoCountryCodes:]( v9,  "tu_initUnlabledPersonHandleWithTUHandle:isoCountryCodes:",  v6,  v7));

  if ([v10 type] == (id)2)
  {
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact phoneNumbers](self, "phoneNumbers"));
    id v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v12)
    {
      id v29 = v7;
      v30 = v10;
      uint64_t v13 = *(void *)v36;
      while (2)
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v11);
          }
          __int128 v15 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
          __int128 v16 = objc_alloc(&OBJC_CLASS___TUHandle);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 value]);
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringValue]);
          v19 = -[TUHandle initWithType:value:](v16, "initWithType:value:", 2LL, v18);

          if ((TUHandlesAreCanonicallyEqual(v19, v6) & 1) != 0)
          {
            id v7 = v29;
            goto LABEL_22;
          }
        }

        id v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v12) {
          continue;
        }
        break;
      }

      id v7 = v29;
LABEL_23:
      v10 = v30;
      id v8 = &_sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ_ptr;
    }
  }

  else
  {
    if ([v10 type] != (id)1)
    {
      id v12 = 0LL;
      goto LABEL_26;
    }

    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact emailAddresses](self, "emailAddresses"));
    id v12 = [v11 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v12)
    {
      v30 = v10;
      uint64_t v20 = *(void *)v32;
      while (2)
      {
        for (j = 0LL; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v11);
          }
          __int128 v15 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
          v22 = objc_alloc(&OBJC_CLASS___TUHandle);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v15 value]);
          v19 = -[TUHandle initWithType:value:](v22, "initWithType:value:", 3LL, v23);

          if ((TUHandlesAreCanonicallyEqual(v19, v6) & 1) != 0)
          {
LABEL_22:
            uint64_t v24 = INPersonHandleLabelForCNLabeledValue(v15);
            id v12 = (id)objc_claimAutoreleasedReturnValue(v24);

            goto LABEL_23;
          }
        }

        id v12 = [v11 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v12) {
          continue;
        }
        goto LABEL_23;
      }
    }
  }

LABEL_26:
  id v25 = objc_alloc((Class)v8[43]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v10 value]);
  id v27 = objc_msgSend(v25, "initWithValue:type:label:", v26, objc_msgSend(v10, "type"), v12);

  return v27;
}

@end