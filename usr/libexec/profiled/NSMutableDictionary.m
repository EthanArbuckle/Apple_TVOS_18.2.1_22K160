@interface NSMutableDictionary
- (void)MCDeepCopyEntriesFromDictionary:(id)a3;
- (void)MCDeepCopyMissingEntriesFromDictionary:(id)a3;
- (void)MCDeleteBoolRestriction:(id)a3;
- (void)MCFilterRestrictionPayloadKeys:(id)a3;
- (void)MCFixUpRestrictionsDictionaryForMDMReporting;
- (void)MCSanitizeRestrictions;
- (void)MCSetBoolRestriction:(id)a3 value:(BOOL)a4;
- (void)MCSetIntersectionRestriction:(id)a3 values:(id)a4;
- (void)MCSetIntersectionSetting:(id)a3 values:(id)a4;
- (void)MCSetObjectIfNotNil:(id)a3 forKey:(id)a4;
- (void)MCSetUnionRestriction:(id)a3 values:(id)a4;
- (void)MCSetUnionSetting:(id)a3 values:(id)a4;
- (void)MCSetValueRestriction:(id)a3 value:(id)a4;
@end

@implementation NSMutableDictionary

- (void)MCDeepCopyEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v9]);
        uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self, "objectForKey:", v9));
        v12 = (void *)v11;
        if (v10) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0)
          {
            uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
            if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0)
            {
              [v12 MCDeepCopyEntriesFromDictionary:v10];
              goto LABEL_18;
            }
          }
        }

        uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v10, v16) & 1) != 0)
        {
          id v17 = [v10 MCMutableDeepCopy];
        }

        else
        {
          if (!v10) {
            goto LABEL_18;
          }
          id v17 = [v10 copy];
        }

        v18 = v17;
        -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", v17, v9);

LABEL_18:
      }

      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v6);
  }
}

- (void)MCDeepCopyMissingEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self, "objectForKey:", v9));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v9]);
        if (v11) {
          BOOL v12 = v10 == 0LL;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12)
        {
          if (v10) {
            goto LABEL_20;
          }
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
          {
            id v14 = [v11 MCMutableDeepCopy];
          }

          else
          {
            if (!v11) {
              goto LABEL_20;
            }
            id v14 = [v11 copy];
          }

          v18 = v14;
          -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", v14, v9);
        }

        else
        {
          uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          char isKindOfClass = objc_opt_isKindOfClass(v11, v15);
          if ((isKindOfClass & 1) != 0)
          {
            uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
            if ((objc_opt_isKindOfClass(v10, v17) & 1) != 0) {
              [v10 MCDeepCopyMissingEntriesFromDictionary:v11];
            }
          }
        }

- (void)MCSetObjectIfNotNil:(id)a3 forKey:(id)a4
{
  if (a3) {
    -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", a3, a4);
  }
}

- (void)MCSetBoolRestriction:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 defaultRestrictions]);

  uint64_t v9 = MCRestrictedBoolKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:MCRestrictedBoolKey]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v6]);
  uint64_t v12 = MCRestrictedBoolPreferenceKey;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:MCRestrictedBoolPreferenceKey]);

  if (!v13)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not a BOOL restriction.",  v6));
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v18,  0LL));

    objc_exception_throw(v19);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v9));
  id v15 = [v14 mutableCopy];

  if (!v15) {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  v20[0] = v12;
  v20[1] = MCRestrictedBoolValueKey;
  v21[0] = v13;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  v21[1] = v16;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
  [v15 setObject:v17 forKeyedSubscript:v6];

  -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v15, v9);
}

- (void)MCDeleteBoolRestriction:(id)a3
{
  id v7 = a3;
  uint64_t v4 = MCRestrictedBoolKey;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCRestrictedBoolKey));
  id v6 = [v5 mutableCopy];

  if (v6)
  {
    [v6 removeObjectForKey:v7];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, v4);
  }
}

- (void)MCSetValueRestriction:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v18 = MCRestrictedValueKey;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self,  "objectForKeyedSubscript:",  MCRestrictedValueKey));
    id v20 = [v19 mutableCopy];

    if (v20)
    {
      [v20 removeObjectForKey:v6];
      -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v20, v18);
    }

    goto LABEL_9;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 defaultRestrictions]);

  uint64_t v10 = MCRestrictedValueKey;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:MCRestrictedValueKey]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v6]);
  uint64_t v13 = MCRestrictedValuePreferSmallerValuesKey;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:MCRestrictedValuePreferSmallerValuesKey]);

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v10));
    id v16 = [v15 mutableCopy];

    if (!v16) {
      id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    v27[0] = v13;
    v27[1] = MCRestrictedValueValueKey;
    v28[0] = v14;
    v28[1] = v7;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL));
    [v16 setObject:v17 forKeyedSubscript:v6];

    -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v16, v10);
LABEL_9:

    return;
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not a value restriction.",  v6));
  id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v21,  0LL));

  objc_exception_throw(v22);
  -[NSMutableDictionary MCSetIntersectionRestriction:values:](v23, v24, v25, v26);
}

- (void)MCSetIntersectionRestriction:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v16 = MCIntersectionKey;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCIntersectionKey));
    id v18 = [v17 mutableCopy];

    if (v18)
    {
      [v18 removeObjectForKey:v6];
      -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v18, v16);
    }

    goto LABEL_9;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 defaultRestrictions]);

  uint64_t v10 = MCIntersectionKey;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:MCIntersectionKey]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v6]);

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v10));
    id v14 = [v13 mutableCopy];

    if (!v14) {
      id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    uint64_t v25 = MCIntersectionValuesKey;
    id v26 = v7;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    [v14 setObject:v15 forKeyedSubscript:v6];

    -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v14, v10);
LABEL_9:

    return;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not an intersection restriction.",  v6));
  id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v19,  0LL));

  objc_exception_throw(v20);
  -[NSMutableDictionary MCSetUnionRestriction:values:](v21, v22, v23, v24);
}

- (void)MCSetUnionRestriction:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v16 = MCUnionKey;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCUnionKey));
    id v18 = [v17 mutableCopy];

    if (v18)
    {
      [v18 removeObjectForKey:v6];
      -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v18, v16);
    }

    goto LABEL_9;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 defaultRestrictions]);

  uint64_t v10 = MCUnionKey;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:MCUnionKey]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v6]);

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v10));
    id v14 = [v13 mutableCopy];

    if (!v14) {
      id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    uint64_t v25 = MCUnionValuesKey;
    id v26 = v7;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    [v14 setObject:v15 forKeyedSubscript:v6];

    -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v14, v10);
LABEL_9:

    return;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not an union restriction.",  v6));
  id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v19,  0LL));

  objc_exception_throw(v20);
  -[NSMutableDictionary MCSetIntersectionSetting:values:](v21, v22, v23, v24);
}

- (void)MCSetIntersectionSetting:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v16 = MCIntersectionKey;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCIntersectionKey));
    id v18 = [v17 mutableCopy];

    if (v18)
    {
      [v18 removeObjectForKey:v6];
      -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v18, v16);
    }

    goto LABEL_9;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 defaultSettings]);

  uint64_t v10 = MCIntersectionKey;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:MCIntersectionKey]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v6]);

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v10));
    id v14 = [v13 mutableCopy];

    if (!v14) {
      id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    uint64_t v25 = MCIntersectionValuesKey;
    id v26 = v7;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    [v14 setObject:v15 forKeyedSubscript:v6];

    -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v14, v10);
LABEL_9:

    return;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not an intersection setting.",  v6));
  id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v19,  0LL));

  objc_exception_throw(v20);
  -[NSMutableDictionary MCSetUnionSetting:values:](v21, v22, v23, v24);
}

- (void)MCSetUnionSetting:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v16 = MCUnionKey;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCUnionKey));
    id v18 = [v17 mutableCopy];

    if (v18)
    {
      [v18 removeObjectForKey:v6];
      -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v18, v16);
    }

    goto LABEL_9;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 defaultSettings]);

  uint64_t v10 = MCUnionKey;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:MCUnionKey]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v6]);

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v10));
    id v14 = [v13 mutableCopy];

    if (!v14) {
      id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    uint64_t v24 = MCUnionValuesKey;
    id v25 = v7;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    [v14 setObject:v15 forKeyedSubscript:v6];

    -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v14, v10);
LABEL_9:

    return;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not an union setting.",  v6));
  id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v19,  0LL));

  objc_exception_throw(v20);
  -[NSMutableDictionary MCFilterRestrictionPayloadKeys:](v21, v22, v23);
}

- (void)MCFilterRestrictionPayloadKeys:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100013DE0;
    v7[3] = &unk_1000C31D8;
    v7[4] = self;
    id v8 = v4;
    id v6 = objc_retainBlock(v7);
    ((void (*)(void *, void))v6[2])(v6, MCRestrictedBoolKey);
    ((void (*)(void *, void))v6[2])(v6, MCRestrictedValueKey);
    ((void (*)(void *, void))v6[2])(v6, MCIntersectionKey);
    ((void (*)(void *, void))v6[2])(v6, MCUnionKey);
  }
}

- (void)MCFixUpRestrictionsDictionaryForMDMReporting
{
  v2 = self;
  uint64_t v3 = MCRestrictedValueKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self, "objectForKey:", MCRestrictedValueKey));
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 mutableCopy];
    uint64_t v7 = MCFeaturePasscodeLockGraceTime;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:MCFeaturePasscodeLockGraceTime]);
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = [v8 mutableCopy];
      uint64_t v11 = MCRestrictedValueValueKey;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForKey:MCRestrictedValueValueKey]);
      uint64_t v13 = v12;
      if (v12)
      {
        id v14 = v2;
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  (uint64_t)[v12 longValue] / 60));
        [v10 setObject:v15 forKey:v11];

        v2 = v14;
      }

      [v6 setObject:v10 forKey:v7];
    }

    uint64_t v16 = MCFeatureAutoLockTime;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:MCFeatureAutoLockTime]);
    id v18 = v17;
    if (v17)
    {
      id v19 = [v17 mutableCopy];
      uint64_t v20 = MCRestrictedValueValueKey;
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v19 valueForKey:MCRestrictedValueValueKey]);
      SEL v22 = v21;
      if (v21)
      {
        id v23 = v2;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  (uint64_t)[v21 longValue] / 60));
        [v19 setObject:v24 forKey:v20];

        v2 = v23;
      }

      [v6 setObject:v19 forKey:v16];
    }

    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v6, v3);
  }

  uint64_t v25 = MCIntersectionKey;
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v2, "objectForKey:", MCIntersectionKey));
  if (v26)
  {
    uint64_t v41 = v25;
    id v42 = v26;
    v43 = v2;
    v44 = v5;
    id v27 = [v26 mutableCopy];
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue( +[MCRestrictionUtilities intersectionFeaturesWithPayloadRestictionKeyAlias]( &OBJC_CLASS___MCRestrictionUtilities,  "intersectionFeaturesWithPayloadRestictionKeyAlias"));
    id v28 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v53;
      uint64_t v45 = *(void *)v53;
      do
      {
        v31 = 0LL;
        id v46 = v29;
        do
        {
          if (*(void *)v53 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v52 + 1) + 8LL * (void)v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionUtilities intersectionPayloadRestrictionKeysForFeature:]( &OBJC_CLASS___MCRestrictionUtilities,  "intersectionPayloadRestrictionKeysForFeature:",  v32));
          v34 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:v32]);
          if (v34) {
            BOOL v35 = v33 == 0LL;
          }
          else {
            BOOL v35 = 1;
          }
          if (!v35)
          {
            __int128 v50 = 0u;
            __int128 v51 = 0u;
            __int128 v48 = 0u;
            __int128 v49 = 0u;
            id v36 = v33;
            id v37 = [v36 countByEnumeratingWithState:&v48 objects:v56 count:16];
            if (v37)
            {
              id v38 = v37;
              uint64_t v39 = *(void *)v49;
              do
              {
                for (i = 0LL; i != v38; i = (char *)i + 1)
                {
                  if (*(void *)v49 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  [v27 setObject:v34 forKey:*(void *)(*((void *)&v48 + 1) + 8 * (void)i)];
                }

                id v38 = [v36 countByEnumeratingWithState:&v48 objects:v56 count:16];
              }

              while (v38);
            }

            [v27 removeObjectForKey:v32];
            uint64_t v30 = v45;
            id v29 = v46;
          }

          v31 = (char *)v31 + 1;
        }

        while (v31 != v29);
        id v29 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
      }

      while (v29);
    }

    -[NSMutableDictionary setObject:forKey:](v43, "setObject:forKey:", v27, v41);
    id v5 = v44;
    id v26 = v42;
  }
}

- (void)MCSanitizeRestrictions
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 defaultRestrictions]);

  uint64_t v5 = MCRestrictedBoolKey;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCRestrictedBoolKey));
  id v7 = [v6 mutableCopy];
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v62;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v62 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)i);
        if ((-[NSMutableDictionary MCValidateBoolRestriction:inRestrictions:defaultRestrictions:]( self,  "MCValidateBoolRestriction:inRestrictions:defaultRestrictions:",  v13,  v8,  v4) & 1) == 0) {
          [v7 setObject:0 forKeyedSubscript:v13];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v61 objects:v68 count:16];
    }

    while (v10);
  }

  v47 = v8;

  id v14 = [v7 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v14, v5);

  uint64_t v15 = MCRestrictedValueKey;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self,  "objectForKeyedSubscript:",  MCRestrictedValueKey));
  id v17 = [v16 mutableCopy];
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v18 = v16;
  id v19 = [v18 countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v58;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v58 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)j);
        if ((-[NSMutableDictionary MCValidateValueRestriction:inRestrictions:defaultRestrictions:]( self,  "MCValidateValueRestriction:inRestrictions:defaultRestrictions:",  v23,  v18,  v4) & 1) == 0) {
          [v17 setObject:0 forKeyedSubscript:v23];
        }
      }

      id v20 = [v18 countByEnumeratingWithState:&v57 objects:v67 count:16];
    }

    while (v20);
  }

  __int128 v48 = v7;

  id v46 = v17;
  id v24 = [v17 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v24, v15);

  uint64_t v25 = MCIntersectionKey;
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCIntersectionKey));
  id v27 = [v26 mutableCopy];
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id v28 = v26;
  id v29 = [v28 countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v54;
    do
    {
      for (k = 0LL; k != v30; k = (char *)k + 1)
      {
        if (*(void *)v54 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)k);
        if ((-[NSMutableDictionary MCValidateIntersectionRestriction:inRestrictions:defaultRestrictions:]( self,  "MCValidateIntersectionRestriction:inRestrictions:defaultRestrictions:",  v33,  v28,  v4) & 1) == 0) {
          [v27 setObject:0 forKeyedSubscript:v33];
        }
      }

      id v30 = [v28 countByEnumeratingWithState:&v53 objects:v66 count:16];
    }

    while (v30);
  }

  uint64_t v45 = v27;
  id v34 = [v27 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v34, v25);

  uint64_t v44 = MCUnionKey;
  BOOL v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:"));
  id v36 = [v35 mutableCopy];
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v37 = v35;
  id v38 = [v37 countByEnumeratingWithState:&v49 objects:v65 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v50;
    do
    {
      for (m = 0LL; m != v39; m = (char *)m + 1)
      {
        if (*(void *)v50 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)m);
        if ((-[NSMutableDictionary MCValidateUnionRestriction:inRestrictions:defaultRestrictions:]( self,  "MCValidateUnionRestriction:inRestrictions:defaultRestrictions:",  v42,  v37,  v4) & 1) == 0) {
          [v36 setObject:0 forKeyedSubscript:v42];
        }
      }

      id v39 = [v37 countByEnumeratingWithState:&v49 objects:v65 count:16];
    }

    while (v39);
  }

  id v43 = [v36 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v43, v44);
}

@end