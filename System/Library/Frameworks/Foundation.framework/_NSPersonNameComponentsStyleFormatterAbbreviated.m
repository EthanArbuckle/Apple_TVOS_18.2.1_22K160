@interface _NSPersonNameComponentsStyleFormatterAbbreviated
- (BOOL)shouldIgnoreComponentsContainingSpecialCharacters;
- (id)_delimiterBetweenString:(id)a3 andString:(id)a4 isPhonetic:(BOOL)a5;
- (id)_formattedStringFromOrderedKeys:(id)a3 components:(id)a4 attributesByRange:(id)a5;
- (id)abbreviatedKeys;
- (id)fallbackStyleFormatter;
- (id)keysOfInterest;
@end

@implementation _NSPersonNameComponentsStyleFormatterAbbreviated

- (id)abbreviatedKeys
{
  v5[2] = *MEMORY[0x1895F89C0];
  id result = self->super._abbreviatedKeys;
  if (!result)
  {
    id v4 = objc_alloc(MEMORY[0x189604010]);
    v5[0] = @"givenName";
    v5[1] = @"familyName";
    id result = (id)objc_msgSend( v4,  "initWithArray:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v5, 2));
    self->super._abbreviatedKeys = (NSSet *)result;
  }

  return result;
}

- (id)keysOfInterest
{
  id result = self->super._keysOfInterest;
  if (!result)
  {
    id result = (id)objc_msgSend( objc_alloc(MEMORY[0x189604010]),  "initWithObjects:",  @"givenName",  @"familyName",  0);
    self->super._keysOfInterest = (NSSet *)result;
  }

  return result;
}

- (BOOL)shouldIgnoreComponentsContainingSpecialCharacters
{
  return 1;
}

- (id)fallbackStyleFormatter
{
  return  -[_NSPersonNameComponentsStyleFormatterShort initWithMasterFormatter:]( objc_alloc(&OBJC_CLASS____NSPersonNameComponentsStyleFormatterShort),  "initWithMasterFormatter:",  -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
}

- (id)_delimiterBetweenString:(id)a3 andString:(id)a4 isPhonetic:(BOOL)a5
{
  return 0LL;
}

- (id)_formattedStringFromOrderedKeys:(id)a3 components:(id)a4 attributesByRange:(id)a5
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  int64_t v7 = +[NSPersonNameComponentsFormatter __abbreviatedNameFormatForPersonNameComponents:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__abbreviatedNameFormatForPersonNameComponents:",  a4);
  id v8 = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend(a3, "count"));
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v46 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v47;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(a3);
        }
        uint64_t v13 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        if (+[NSPersonNameComponentsFormatter __inferredScriptIndexFromString:]( NSPersonNameComponentsFormatter,  "__inferredScriptIndexFromString:",  [a4 valueForKey:v13]) != 1) {
          [v8 addObject:v13];
        }
      }

      uint64_t v10 = [a3 countByEnumeratingWithState:&v46 objects:v45 count:16];
    }

    while (v10);
  }

  if ((unint64_t)(v7 - 1) < 4)
  {
    -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter");
    char v14 = objc_msgSend((id)objc_opt_class(), "__shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly");
    char v15 = v14;
    if ((v7 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v44[0] = @"givenName";
      v44[1] = @"familyName";
      v16 = (void *)MEMORY[0x189603F18];
      v17 = (const __CFString **)v44;
    }

    else
    {
      if (v7 == 2) {
        char v19 = v14;
      }
      else {
        char v19 = 1;
      }
      if ((v19 & 1) == 0)
      {
        v43 = @"familyName";
        v16 = (void *)MEMORY[0x189603F18];
        v17 = &v43;
        uint64_t v20 = 1LL;
LABEL_23:
        v22 = (void *)[v16 arrayWithObjects:v17 count:v20];
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v37 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          char v33 = v15;
          uint64_t v25 = *(void *)v39;
LABEL_25:
          uint64_t v26 = 0LL;
          while (1)
          {
            if (*(void *)v39 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v38 + 1) + 8 * v26);
            if ([v8 containsObject:v27])
            {
              id v28 = (id)[a4 valueForKeyPath:v27];
              if ([v28 length]) {
                break;
              }
            }

            if (v24 == ++v26)
            {
              uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v37 count:16];
              if (v24) {
                goto LABEL_25;
              }
              uint64_t v27 = 0LL;
              id v28 = 0LL;
              break;
            }
          }

          char v15 = v33;
        }

        else
        {
          uint64_t v27 = 0LL;
          id v28 = 0LL;
        }

        if (v7 == 2) {
          char v29 = v15;
        }
        else {
          char v29 = 1;
        }
        if ((v29 & 1) != 0)
        {
        }

        else if ((unint64_t)-[NSString __graphemeCount](v28) > 2)
        {
          id v28 = 0LL;
          goto LABEL_45;
        }

        if ((unint64_t)-[NSString __graphemeCount](v28) >= 3) {
LABEL_44:
        }
          id v28 = +[NSPersonNameComponentsFormatter __initialsForString:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__initialsForString:",  v28);
LABEL_45:
        v30 = objc_alloc_init(&OBJC_CLASS___NSPersonNameComponents);
        v31 = v30;
        if (v27) {
          -[NSPersonNameComponents setValue:forKey:](v30, "setValue:forKey:", v28, v27);
        }
        id v21 = -[_NSPersonNameComponentsStyleFormatter _formattedStringFromOrderedKeys:components:attributesByRange:](  -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]( objc_alloc(&OBJC_CLASS____NSPersonNameComponentsStyleFormatterLong),  "initWithMasterFormatter:",  -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter")),  "_formattedStringFromOrderedKeys:components:attributesByRange:",  v8,  v31,  a5);
        goto LABEL_48;
      }

      v42[0] = @"familyName";
      v42[1] = @"givenName";
      v16 = (void *)MEMORY[0x189603F18];
      v17 = (const __CFString **)v42;
    }

    uint64_t v20 = 2LL;
    goto LABEL_23;
  }

  if (v7 != 6)
  {
    v36.receiver = self;
    v36.super_class = (Class)&OBJC_CLASS____NSPersonNameComponentsStyleFormatterAbbreviated;
    id v21 = -[_NSPersonNameComponentsStyleFormatter _formattedStringFromOrderedKeys:components:attributesByRange:]( &v36,  sel__formattedStringFromOrderedKeys_components_attributesByRange_,  v8,  a4,  a5);
LABEL_48:
    v18 = v21;
    return (id)objc_msgSend( v18,  "uppercaseStringWithLocale:",  +[NSPersonNameComponentsFormatter __currentLocale]( NSPersonNameComponentsFormatter,  "__currentLocale"));
  }

  v18 = 0LL;
  return (id)objc_msgSend( v18,  "uppercaseStringWithLocale:",  +[NSPersonNameComponentsFormatter __currentLocale]( NSPersonNameComponentsFormatter,  "__currentLocale"));
}

@end