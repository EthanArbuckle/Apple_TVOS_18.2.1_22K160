@interface ACTKeyboardLayoutUtils
- (ACTKeyboardLayoutUtils)initWithLocale:(id)a3;
- (NSMutableDictionary)keyOverrides;
- (id)alternativeKeyForString:(id)a3 keyplane:(id)a4 preferBaseKeyVariants:(BOOL)a5 preferManualShift:(BOOL)a6 substituteUpperCaseForLowerCase:(BOOL)a7;
- (id)anyKeyForString:(id)a3 keyplane:(id)a4 wantSecondaryString:(BOOL)a5 isRetyping:(BOOL)a6 preferBaseKeyVariants:(BOOL)a7 preferManualShift:(BOOL)a8 substituteUpperCaseForLowerCase:(BOOL)a9;
- (id)baseKeyForString:(id)a3;
- (id)createTTKPlane:(id)a3;
- (id)exactKeyForString:(id)a3 keyplane:(id)a4;
- (id)exactKeyForString:(id)a3 keyplane:(id)a4 includeSecondaryStrings:(BOOL)a5;
- (id)representedStringForKey:(id)a3 shifted:(BOOL)a4;
- (id)representedStringForKey:(id)a3 shifted:(BOOL)a4 includeSecondaryStrings:(BOOL)a5;
- (id)substitutesForKey:(id)a3 preferBaseKeyVariants:(BOOL)a4 preferManualShift:(BOOL)a5 substituteUpperCaseForLowerCase:(BOOL)a6;
- (void)setLayoutKeyOverride:(id)a3 forKey:(id)a4 uiKeyboardStringNothing:(id)a5;
@end

@implementation ACTKeyboardLayoutUtils

- (ACTKeyboardLayoutUtils)initWithLocale:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ACTKeyboardLayoutUtils;
  v6 = -[ACTKeyboardLayoutUtils init](&v10, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    keyOverrides = v6->_keyOverrides;
    v6->_keyOverrides = v7;

    objc_storeStrong((id *)&v6->_locale, a3);
  }

  return v6;
}

- (void)setLayoutKeyOverride:(id)a3 forKey:(id)a4 uiKeyboardStringNothing:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v12)
  {
    unsigned int v10 = [v12 isEqualToString:v9];
    keyOverrides = self->_keyOverrides;
    if (v10) {
      -[NSMutableDictionary removeObjectForKey:](keyOverrides, "removeObjectForKey:", v8);
    }
    else {
      -[NSMutableDictionary setObject:forKey:](keyOverrides, "setObject:forKey:", v12, v8);
    }
  }
}

- (id)createTTKPlane:(id)a3
{
  id v4 = a3;
  id v5 = -[TTKKeyboardPlane initWithUIKBTree:layoutUtils:]( objc_alloc(&OBJC_CLASS___TTKKeyboardPlane),  "initWithUIKBTree:layoutUtils:",  v4,  self);

  return v5;
}

- (id)baseKeyForString:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 decomposedStringWithCanonicalMapping]);
  else {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 substringToIndex:1]);
  }

  return v4;
}

- (id)substitutesForKey:(id)a3 preferBaseKeyVariants:(BOOL)a4 preferManualShift:(BOOL)a5 substituteUpperCaseForLowerCase:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v10 length] == (char *)&dword_0 + 1)
  {
    if (v8)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardLayoutUtils baseKeyForString:](self, "baseKeyForString:", v10));
      if (v12) {
        [v11 addObject:v12];
      }
    }

    id v13 = [v10 characterAtIndex:0];
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet uppercaseLetterCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "uppercaseLetterCharacterSet"));
    LODWORD(v13) = [v14 characterIsMember:v13];

    if ((_DWORD)v13 && !a5)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v10 lowercaseStringWithLocale:self->_locale]);
      [v11 addObject:v15];
      if (v8)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardLayoutUtils baseKeyForString:](self, "baseKeyForString:", v15));
        if (v16) {
          [v11 addObject:v16];
        }
      }
    }

    if (v6)
    {
      id v17 = [v10 characterAtIndex:0];
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet lowercaseLetterCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "lowercaseLetterCharacterSet"));
      LODWORD(v17) = [v18 characterIsMember:v17];

      if ((_DWORD)v17)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v10 uppercaseStringWithLocale:self->_locale]);
        [v11 addObject:v19];
        if (v8)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardLayoutUtils baseKeyForString:](self, "baseKeyForString:", v19));
          if (v20) {
            [v11 addObject:v20];
          }
        }
      }
    }

    if (v8)
    {
      if ([v10 isEqualToString:@"ı"])
      {
        v21 = @"i";
LABEL_25:
        [v11 addObject:v21];
        goto LABEL_26;
      }

      if ([v10 isEqualToString:@"İ"])
      {
        v21 = @"I";
        goto LABEL_25;
      }
    }
  }

- (id)representedStringForKey:(id)a3 shifted:(BOOL)a4 includeSecondaryStrings:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 representedString]);
  if ([v8 displayType] == 7 && (unint64_t)objc_msgSend(v9, "length") >= 2)
  {
    if (a4) {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 substringFromIndex:1]);
    }
    else {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 substringToIndex:1]);
    }
    v14 = v9;
    id v9 = (void *)v10;
    goto LABEL_19;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
  unsigned int v12 = [v11 isEqualToString:@"Latin-Accents"];

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_keyOverrides,  "objectForKeyedSubscript:",  UIKeyboardKeyAccent));
    v14 = v13;
    if (!v13)
    {
LABEL_19:

      goto LABEL_20;
    }

    else {
      id v15 = v14;
    }
LABEL_18:
    id v20 = v15;

    id v9 = v20;
    goto LABEL_19;
  }

  if (v5)
  {
    if ([v8 displayType] == 7
      && (v16 = (void *)objc_claimAutoreleasedReturnValue([v8 secondaryRepresentedStrings]),
          id v17 = [v16 count],
          v16,
          v17)
      || ![v8 displayType]
      && (v18 = (void *)objc_claimAutoreleasedReturnValue([v8 secondaryRepresentedStrings]),
          id v19 = [v18 count],
          v18,
          v19))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v8 secondaryRepresentedStrings]);
      id v15 = (id)objc_claimAutoreleasedReturnValue([v14 firstObject]);
      goto LABEL_18;
    }
  }

- (id)representedStringForKey:(id)a3 shifted:(BOOL)a4
{
  return -[ACTKeyboardLayoutUtils representedStringForKey:shifted:includeSecondaryStrings:]( self,  "representedStringForKey:shifted:includeSecondaryStrings:",  a3,  a4,  0LL);
}

- (id)exactKeyForString:(id)a3 keyplane:(id)a4 includeSecondaryStrings:(BOOL)a5
{
  BOOL v23 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v8 keys]);
    id v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        id v13 = 0LL;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v13);
          id v15 = (void *)objc_claimAutoreleasedReturnValue( -[ACTKeyboardLayoutUtils representedStringForKey:shifted:includeSecondaryStrings:]( self,  "representedStringForKey:shifted:includeSecondaryStrings:",  v14,  [v9 isShiftKeyplane],  v23));
          if (([v7 isEqualToString:v15] & 1) != 0
            || (v16 = (void *)objc_claimAutoreleasedReturnValue([v14 name]),
                unsigned int v17 = [v16 hasPrefix:@"TenKey-Chinese-Pinyin"],
                v16,
                v17)
            && (v18 = (void *)objc_claimAutoreleasedReturnValue([v14 displayString]),
                id v19 = [v18 rangeOfString:v7 options:1],
                v18,
                v19 != (id)0x7FFFFFFFFFFFFFFFLL))
          {
            id v20 = v14;

            goto LABEL_14;
          }

          id v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v20 = 0LL;
LABEL_14:
  }

  else
  {
    id v20 = 0LL;
  }

  return v20;
}

- (id)exactKeyForString:(id)a3 keyplane:(id)a4
{
  return -[ACTKeyboardLayoutUtils exactKeyForString:keyplane:includeSecondaryStrings:]( self,  "exactKeyForString:keyplane:includeSecondaryStrings:",  a3,  a4,  0LL);
}

- (id)alternativeKeyForString:(id)a3 keyplane:(id)a4 preferBaseKeyVariants:(BOOL)a5 preferManualShift:(BOOL)a6 substituteUpperCaseForLowerCase:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a4;
  if (a3)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue( -[ACTKeyboardLayoutUtils substitutesForKey:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:]( self,  "substitutesForKey:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:",  a3,  v9,  v8,  v7));
    id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v22;
      while (2)
      {
        unsigned int v17 = 0LL;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_claimAutoreleasedReturnValue( -[ACTKeyboardLayoutUtils exactKeyForString:keyplane:]( self,  "exactKeyForString:keyplane:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v17),  v12,  (void)v21));
          if (v18)
          {
            id v19 = (void *)v18;
            goto LABEL_12;
          }

          unsigned int v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v19 = 0LL;
LABEL_12:
  }

  else
  {
    id v19 = 0LL;
  }

  return v19;
}

- (id)anyKeyForString:(id)a3 keyplane:(id)a4 wantSecondaryString:(BOOL)a5 isRetyping:(BOOL)a6 preferBaseKeyVariants:(BOOL)a7 preferManualShift:(BOOL)a8 substituteUpperCaseForLowerCase:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( -[ACTKeyboardLayoutUtils exactKeyForString:keyplane:includeSecondaryStrings:]( self,  "exactKeyForString:keyplane:includeSecondaryStrings:",  v15,  v16,  v12));
  if (!v17 && !a6) {
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( -[ACTKeyboardLayoutUtils alternativeKeyForString:keyplane:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:]( self,  "alternativeKeyForString:keyplane:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:",  v15,  v16,  v10,  v9,  a9));
  }

  return v17;
}

- (NSMutableDictionary)keyOverrides
{
  return self->_keyOverrides;
}

- (void).cxx_destruct
{
}

@end