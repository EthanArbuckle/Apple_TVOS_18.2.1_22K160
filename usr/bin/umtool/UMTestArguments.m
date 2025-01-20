@interface UMTestArguments
+ (id)_personaAttributes;
+ (id)_userAttributes;
+ (id)getImagePathAttribute;
+ (id)getLayoutAttributes;
+ (id)getNextArgument;
+ (id)getPasscodeData;
+ (id)getPersonaAttributes;
+ (id)getPersonaStringAttribute;
+ (id)getPersonaTypeAttribute;
+ (id)getProvisionAttributes;
+ (id)getSharedDataVolumePathAttribute;
+ (id)getSystemVolumePathAttribute;
+ (id)getUser;
+ (id)getUserAttributes;
+ (id)getUserIfExists;
+ (id)getUserVolumePathAttribute;
+ (id)getbundleIDAttribute;
+ (id)remainingArguments;
+ (int)getPersonaTestCount;
+ (int)getProvisionNumUsers;
+ (int)getProvisionQuotaSize;
+ (int)getUserGID;
+ (int)getUserUID;
+ (unint64_t)_passcodeIndex;
+ (void)applyAttributes:(id)a3 toUser:(id)a4;
+ (void)goToPreviousArgument;
+ (void)initialize;
@end

@implementation UMTestArguments

+ (void)initialize
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v4 arguments]);
  v3 = (void *)qword_100010BF0;
  qword_100010BF0 = v2;
}

+ (id)getNextArgument
{
  unint64_t v2 = qword_100010BE8;
  if (v2 >= (unint64_t)[(id)qword_100010BF0 count])
  {
    v3 = 0LL;
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100010BF0 objectAtIndexedSubscript:qword_100010BE8]);
    ++qword_100010BE8;
  }

  return v3;
}

+ (void)goToPreviousArgument
{
}

+ (id)remainingArguments
{
  unint64_t v2 = (void *)qword_100010BF0;
  uint64_t v3 = qword_100010BE8;
  id v4 = (char *)[(id)qword_100010BF0 count];
  return [v2 subarrayWithRange:v3, &v4[-qword_100010BE8]];
}

+ (id)getUserAttributes
{
  uint64_t v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _userAttributes]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](&OBJC_CLASS___UMTestArguments, "getNextArgument"));
  if (v5)
  {
    v6 = (void *)v5;
    while (1)
    {
      if (![v4 containsObject:v6])
      {
LABEL_6:

        goto LABEL_7;
      }

      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](&OBJC_CLASS___UMTestArguments, "getNextArgument"));
      if (!v7) {
        break;
      }
      v8 = (void *)v7;
      [v3 setObject:v7 forKeyedSubscript:v6];

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](&OBJC_CLASS___UMTestArguments, "getNextArgument"));
      if (!v6) {
        goto LABEL_6;
      }
    }
  }

  else
  {
LABEL_7:
    +[UMTestArguments goToPreviousArgument](&OBJC_CLASS___UMTestArguments, "goToPreviousArgument");
  }

  id v9 = [v3 copy];

  return v9;
}

+ (int)getUserUID
{
  uint64_t v3 = (void *)objc_opt_new(&OBJC_CLASS___UMMutableUser, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 getUserAttributes]);
  [a1 applyAttributes:v4 toUser:v3];
  else {
    int v5 = [v3 uid];
  }

  return v5;
}

+ (int)getUserGID
{
  uint64_t v3 = (void *)objc_opt_new(&OBJC_CLASS___UMMutableUser, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 getUserAttributes]);
  [a1 applyAttributes:v4 toUser:v3];
  [v3 uid];
  LODWORD(a1) = [v3 uid];

  return (int)a1;
}

+ (void)applyAttributes:(id)a3 toUser:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v11]);
        if ([v11 isEqualToString:@"uid"])
        {
          [v6 setUid:[v12 intValue]];
        }

        else if ([v11 isEqualToString:@"alternateDSID"])
        {
          [v6 setAlternateDSID:v12];
        }

        else if ([v11 isEqualToString:@"username"])
        {
          [v6 setUsername:v12];
        }

        else if ([v11 isEqualToString:@"givenName"])
        {
          [v6 setGivenName:v12];
        }

        else if ([v11 isEqualToString:@"familyName"])
        {
          [v6 setFamilyName:v12];
        }

        else if ([v11 isEqualToString:@"displayName"])
        {
          [v6 setDisplayName:v12];
        }

        else if ([v11 isEqualToString:@"photoURL"])
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v12));
          [v6 setPhotoURL:v13];
        }

        else if ([v11 isEqualToString:@"userAuxiliaryString"])
        {
          [v6 setUserAuxiliaryString:v12];
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }
}

+ (id)getUser
{
  uint64_t v3 = (void *)objc_opt_new(&OBJC_CLASS___UMMutableUser, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 getUserAttributes]);
  [a1 applyAttributes:v4 toUser:v3];

  return v3;
}

+ (id)getUserIfExists
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 getUser]);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allUsers]);

  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if ([v8 isEqualToUser:v2])
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

+ (id)_userAttributes
{
  if (qword_100010C00 != -1) {
    dispatch_once(&qword_100010C00, &stru_10000C260);
  }
  return (id)qword_100010BF8;
}

+ (id)getPasscodeData
{
  unint64_t v2 = (char *)[a1 _passcodeIndex];
  if (v2 == (char *)0x7FFFFFFFFFFFFFFFLL || (uint64_t v3 = v2, v2 >= [(id)qword_100010BF0 count]))
  {
    id v5 = 0LL;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100010BF0 objectAtIndexedSubscript:v3 + 1]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);
  }

  return v5;
}

+ (unint64_t)_passcodeIndex
{
  return (unint64_t)[(id)qword_100010BF0 indexOfObject:@"passcode"];
}

+ (id)_personaAttributes
{
  if (qword_100010C10 != -1) {
    dispatch_once(&qword_100010C10, &stru_10000C280);
  }
  return (id)qword_100010C08;
}

+ (id)getPersonaAttributes
{
  uint64_t v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _personaAttributes]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](&OBJC_CLASS___UMTestArguments, "getNextArgument"));
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    while (1)
    {
      if (![v4 containsObject:v6])
      {
LABEL_6:

        goto LABEL_7;
      }

      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](&OBJC_CLASS___UMTestArguments, "getNextArgument"));
      if (!v7) {
        break;
      }
      id v8 = (void *)v7;
      [v3 setObject:v7 forKeyedSubscript:v6];

      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](&OBJC_CLASS___UMTestArguments, "getNextArgument"));
      if (!v6) {
        goto LABEL_6;
      }
    }
  }

  else
  {
LABEL_7:
    +[UMTestArguments goToPreviousArgument](&OBJC_CLASS___UMTestArguments, "goToPreviousArgument");
  }

  id v9 = [v3 copy];

  return v9;
}

+ (id)getProvisionAttributes
{
  unint64_t v2 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  v10[0] = @"quotasize";
  v10[1] = @"numusers";
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](&OBJC_CLASS___UMTestArguments, "getNextArgument"));
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    while (1)
    {
      if (![v3 containsObject:v5])
      {
LABEL_6:

        goto LABEL_7;
      }

      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](&OBJC_CLASS___UMTestArguments, "getNextArgument"));
      if (!v6) {
        break;
      }
      uint64_t v7 = (void *)v6;
      [v2 setObject:v6 forKeyedSubscript:v5];

      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](&OBJC_CLASS___UMTestArguments, "getNextArgument"));
      if (!v5) {
        goto LABEL_6;
      }
    }
  }

  else
  {
LABEL_7:
    +[UMTestArguments goToPreviousArgument](&OBJC_CLASS___UMTestArguments, "goToPreviousArgument");
  }

  id v8 = [v2 copy];

  return v8;
}

+ (id)getLayoutAttributes
{
  unint64_t v2 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  v10[0] = @"sdvpath";
  v10[1] = @"userpath";
  void v10[2] = @"systempath";
  v10[3] = @"disknode";
  v10[4] = @"volumeuuid";
  v10[5] = @"volumename";
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 6LL));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](&OBJC_CLASS___UMTestArguments, "getNextArgument"));
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    while (1)
    {
      if (![v3 containsObject:v5])
      {
LABEL_6:

        goto LABEL_7;
      }

      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](&OBJC_CLASS___UMTestArguments, "getNextArgument"));
      if (!v6) {
        break;
      }
      uint64_t v7 = (void *)v6;
      [v2 setObject:v6 forKeyedSubscript:v5];

      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](&OBJC_CLASS___UMTestArguments, "getNextArgument"));
      if (!v5) {
        goto LABEL_6;
      }
    }
  }

  else
  {
LABEL_7:
    +[UMTestArguments goToPreviousArgument](&OBJC_CLASS___UMTestArguments, "goToPreviousArgument");
  }

  id v8 = [v2 copy];

  return v8;
}

+ (id)getPersonaStringAttribute
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 getPersonaAttributes]);
  uint64_t v3 = v2;
  if (v2
    && (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"personastring"])) != 0)
  {
    uint64_t v5 = v4;
    id v6 = [v4 copy];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)getbundleIDAttribute
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 getPersonaAttributes]);
  uint64_t v3 = v2;
  if (v2
    && (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"bundleid"])) != 0)
  {
    uint64_t v5 = v4;
    id v6 = [v4 copy];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)getPersonaTypeAttribute
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 getPersonaAttributes]);
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"personatype"]);
    if ([v4 isEqualToString:@"personal"])
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
      +[UMTestPrint println:]( &OBJC_CLASS___UMTestPrint,  "println:",  @"getPersonaTypeAttribute validated Personal type");
    }

    else if ([v4 isEqualToString:@"guest"])
    {
      +[UMTestPrint println:]( &OBJC_CLASS___UMTestPrint,  "println:",  @"getPersonaTypeAttribute validated guest type");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 6LL));
    }

    else
    {
      +[UMTestPrint println:]( &OBJC_CLASS___UMTestPrint,  "println:",  @"getPersonaTypeAttribute invalid string is %@",  v4);
      uint64_t v5 = 0LL;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

+ (id)getImagePathAttribute
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 getPersonaAttributes]);
  uint64_t v3 = v2;
  if (v2
    && (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"imagepath"])) != 0)
  {
    uint64_t v5 = v4;
    id v6 = [v4 copy];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

+ (int)getPersonaTestCount
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 getPersonaAttributes]);
  uint64_t v3 = v2;
  if (v2
    && (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ptestcount"])) != 0)
  {
    uint64_t v5 = v4;
    int v6 = [v4 intValue];
  }

  else
  {
    int v6 = 1;
  }

  return v6;
}

+ (int)getProvisionQuotaSize
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 getProvisionAttributes]);
  uint64_t v3 = v2;
  if (v2
    && (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"quotasize"])) != 0)
  {
    uint64_t v5 = v4;
    int v6 = [v4 intValue];
  }

  else
  {
    int v6 = 10;
  }

  return v6;
}

+ (int)getProvisionNumUsers
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 getProvisionAttributes]);
  uint64_t v3 = v2;
  if (v2
    && (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"numusers"])) != 0)
  {
    uint64_t v5 = v4;
    int v6 = [v4 intValue];
  }

  else
  {
    int v6 = 10;
  }

  return v6;
}

+ (id)getSharedDataVolumePathAttribute
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 getLayoutAttributes]);
  uint64_t v3 = v2;
  if (v2
    && (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"sdvpath"])) != 0)
  {
    uint64_t v5 = v4;
    id v6 = [v4 copy];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)getUserVolumePathAttribute
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 getLayoutAttributes]);
  uint64_t v3 = v2;
  if (v2
    && (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"userpath"])) != 0)
  {
    uint64_t v5 = v4;
    id v6 = [v4 copy];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)getSystemVolumePathAttribute
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 getLayoutAttributes]);
  uint64_t v3 = v2;
  if (v2
    && (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"systempath"])) != 0)
  {
    uint64_t v5 = v4;
    id v6 = [v4 copy];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

@end