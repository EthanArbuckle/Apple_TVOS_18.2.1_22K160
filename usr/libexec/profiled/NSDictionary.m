@interface NSDictionary
+ (id)MCDictionaryFromFile:(id)a3;
+ (id)MCShortenedArray:(id)a3;
+ (id)MCShortenedData:(id)a3;
+ (id)MCShortenedDictionary:(id)a3;
+ (id)MCShortenedObject:(id)a3;
- (BOOL)MCValidateBoolRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5;
- (BOOL)MCValidateIntersectionRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5;
- (BOOL)MCValidateRestrictions;
- (BOOL)MCValidateUnionRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5;
- (BOOL)MCValidateValueRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5;
- (BOOL)MCWriteToBinaryFile:(id)a3;
- (BOOL)MCWriteToBinaryFile:(id)a3 atomically:(BOOL)a4;
- (id)MCDeepCopy;
- (id)MCDictionaryAdditiveDeltaToCreateDictionary:(id)a3;
- (id)MCDictionarySubtractiveDeltaToCreateDictionary:(id)a3;
- (id)MCDictionaryWithLeafValuesSetToValue:(id)a3;
- (id)MCInsertedKeysFromDictionary:(id)a3 withNewLeafValue:(id)a4;
- (id)MCMutableDeepCopy;
- (id)MCMutableDeepCopyWithZone:(_NSZone *)a3;
- (id)MCRemovedKeysFromDictionary:(id)a3;
- (id)MCRetainOptionalNonZeroLengthStringKey:(id)a3 errorDomain:(id)a4 invalidDataCode:(int64_t)a5 invalidDataErrorString:(id)a6 outError:(id *)a7;
- (id)MCRetainOptionalObjectKey:(id)a3 type:(Class)a4 errorDomain:(id)a5 invalidDataCode:(int64_t)a6 invalidDataErrorString:(id)a7 outError:(id *)a8;
- (id)MCRetainRequiredNonZeroLengthStringKey:(id)a3 errorDomain:(id)a4 missingDataCode:(int64_t)a5 missingDataErrorString:(id)a6 invalidDataCode:(int64_t)a7 invalidDataErrorString:(id)a8 outError:(id *)a9;
- (id)MCRetainRequiredObjectKey:(id)a3 type:(Class)a4 errorDomain:(id)a5 missingDataCode:(int64_t)a6 missingDataErrorString:(id)a7 invalidDataCode:(int64_t)a8 invalidDataErrorString:(id)a9 outError:(id *)a10;
- (id)MCShortenedPlistDescription;
@end

@implementation NSDictionary

- (BOOL)MCWriteToBinaryFile:(id)a3
{
  id v4 = a3;
  id v5 = [[MCDictionaryWriter alloc] initWithDictionary:self path:v4];

  unsigned __int8 v6 = [v5 write];
  return v6;
}

- (BOOL)MCWriteToBinaryFile:(id)a3 atomically:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = objc_autoreleasePoolPush();
  id v17 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  self,  200LL,  0LL,  &v17));
  id v9 = v17;
  if (v8)
  {
    id v16 = 0LL;
    unsigned __int8 v10 = [v8 writeToFile:v6 options:v4 error:&v16];
    id v11 = v16;
    if ((v10 & 1) != 0)
    {
      BOOL v12 = 1;
      goto LABEL_10;
    }
  }

  else
  {
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v6;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Could not serialize data for %{public}@: %{public}@",  buf,  0x16u);
    }

    id v11 = 0LL;
  }

  v14 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = v6;
    __int16 v20 = 2114;
    id v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Could not write data to path %{public}@: %{public}@",  buf,  0x16u);
  }

  BOOL v12 = 0;
LABEL_10:

  objc_autoreleasePoolPop(v7);
  return v12;
}

+ (id)MCDictionaryFromFile:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
  id v9 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v4,  &v9));
  id v6 = v9;
  if (!v5)
  {
    v7 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v11 = v3;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to make dictionary from file at path: %{public}@ with error: %{public}@",  buf,  0x16u);
    }
  }

  return v5;
}

- (id)MCMutableDeepCopyWithZone:(_NSZone *)a3
{
  id v5 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSDictionary count](self, "count"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary keyEnumerator](self, "keyEnumerator"));
  id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v20 + 1) + 8LL * (void)v9);
        id v11 = v10;
        if ([v10 conformsToProtocol:&OBJC_PROTOCOL___NSMutableCopying])
        {
          id v11 = [v10 mutableCopyWithZone:a3];
        }

        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", v10));
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          id v14 = [v12 MCMutableDeepCopyWithZone:a3];
LABEL_13:
          id v16 = v14;
          -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v14, v11);

          goto LABEL_14;
        }

        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0
          || [v12 conformsToProtocol:&OBJC_PROTOCOL___NSMutableCopying])
        {
          id v14 = [v12 mutableCopyWithZone:a3];
          goto LABEL_13;
        }

        if ([v12 conformsToProtocol:&OBJC_PROTOCOL___NSCopying])
        {
          id v14 = [v12 copyWithZone:a3];
          goto LABEL_13;
        }

        -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v12, v11);
LABEL_14:

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v17 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      id v7 = v17;
    }

    while (v17);
  }

  return v5;
}

- (id)MCMutableDeepCopy
{
  return -[NSDictionary MCMutableDeepCopyWithZone:](self, "MCMutableDeepCopyWithZone:", 0LL);
}

- (id)MCDeepCopy
{
  return -[NSDictionary MCDeepCopyWithZone:](self, "MCDeepCopyWithZone:", 0LL);
}

- (id)MCRetainRequiredObjectKey:(id)a3 type:(Class)a4 errorDomain:(id)a5 missingDataCode:(int64_t)a6 missingDataErrorString:(id)a7 invalidDataCode:(int64_t)a8 invalidDataErrorString:(id)a9 outError:(id *)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a7;
  id v19 = a9;
  uint64_t v20 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", v16));
  __int128 v21 = (void *)v20;
  if (!v20)
  {
    if (a10)
    {
      id v30 = v16;
      uint64_t v23 = MCErrorArray(v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      uint64_t v25 = MCErrorTypeFatal;
      id v26 = v17;
      int64_t v27 = a6;
LABEL_8:
      *a10 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v26,  v27,  v24,  v25,  v30,  0LL));
    }

- (id)MCRetainOptionalObjectKey:(id)a3 type:(Class)a4 errorDomain:(id)a5 invalidDataCode:(int64_t)a6 invalidDataErrorString:(id)a7 outError:(id *)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", v14));
  id v18 = (void *)v17;
  if (v17 && (objc_opt_isKindOfClass(v17, a4) & 1) == 0)
  {
    if (a8)
    {
      uint64_t v19 = MCErrorArray(v16);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *a8 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v15,  a6,  v20,  MCErrorTypeFatal,  v14,  0LL));

      a8 = 0LL;
    }
  }

  else
  {
    a8 = v18;
  }

  return a8;
}

- (id)MCRetainRequiredNonZeroLengthStringKey:(id)a3 errorDomain:(id)a4 missingDataCode:(int64_t)a5 missingDataErrorString:(id)a6 invalidDataCode:(int64_t)a7 invalidDataErrorString:(id)a8 outError:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", v15));
  if (v19)
  {
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
    {
      if (a9)
      {
        id v29 = v15;
        uint64_t v22 = MCErrorArray(v18);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        uint64_t v24 = MCErrorTypeFatal;
        id v25 = v16;
        int64_t v26 = a7;
LABEL_9:
        *a9 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v25,  v26,  v23,  v24,  v29,  0LL));
      }

- (id)MCRetainOptionalNonZeroLengthStringKey:(id)a3 errorDomain:(id)a4 invalidDataCode:(int64_t)a5 invalidDataErrorString:(id)a6 outError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", v12));
  if (!v15) {
    goto LABEL_4;
  }
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
  {
    if (!a7) {
      goto LABEL_8;
    }
    uint64_t v17 = MCErrorArray(v14);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *a7 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v13,  a5,  v18,  MCErrorTypeFatal,  v12,  0LL));

LABEL_7:
    a7 = 0LL;
    goto LABEL_8;
  }

  if (![v15 length]) {
    goto LABEL_7;
  }
LABEL_4:
  a7 = v15;
LABEL_8:

  return a7;
}

- (id)MCShortenedPlistDescription
{
  id v2 = [(id)objc_opt_class(self) MCShortenedDictionary:self];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);

  return v4;
}

+ (id)MCShortenedObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue([a1 MCShortenedArray:v4]);
  }

  else
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue([a1 MCShortenedDictionary:v4]);
    }

    else
    {
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0) {
        id v6 = (id)objc_claimAutoreleasedReturnValue([a1 MCShortenedData:v4]);
      }
      else {
        id v6 = v4;
      }
    }
  }

  id v9 = v6;

  return v9;
}

+ (id)MCShortenedData:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    if ((unint64_t)[v3 length] > 0x10)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subdataWithRange:", 0, 8));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 MCHexString]);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subdataWithRange:", (char *)objc_msgSend( v3,  "length") - 8, 8));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 MCHexString]);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%@ ... 0x%@",  v6,  v8));
    }

    else
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 MCHexString]);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"0x%@", v4));
    }
  }

  else
  {
    uint64_t v5 = @"<empty>";
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Data { length = %lu, bytes = %@ }",  [v3 length],  v5));

  return v9;
}

+ (id)MCShortenedArray:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "MCShortenedObject:",  *(void *)(*((void *)&v13 + 1) + 8 * (void)v10),  (void)v13));
        [v5 addObject:v11];

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  return v5;
}

+ (id)MCShortenedDictionary:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100011A14;
  v7[3] = &unk_1000C31B0;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v4 count]));
  id v8 = v5;
  id v9 = a1;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (BOOL)MCValidateRestrictions
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 defaultRestrictions]);

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCRestrictedBoolKey));
  id v6 = [v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v40;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!-[NSDictionary MCValidateBoolRestriction:inRestrictions:defaultRestrictions:]( self,  "MCValidateBoolRestriction:inRestrictions:defaultRestrictions:",  *(void *)(*((void *)&v39 + 1) + 8LL * (void)i),  v5,  v4))
        {
          BOOL v25 = 0;
          id v10 = v5;
          goto LABEL_41;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self,  "objectForKeyedSubscript:",  MCRestrictedValueKey));
  id v11 = [v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v36;
    while (2)
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        if (!-[NSDictionary MCValidateValueRestriction:inRestrictions:defaultRestrictions:]( self,  "MCValidateValueRestriction:inRestrictions:defaultRestrictions:",  *(void *)(*((void *)&v35 + 1) + 8LL * (void)j),  v10,  v4))
        {
          BOOL v25 = 0;
          id v15 = v10;
          goto LABEL_40;
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCIntersectionKey));
  id v16 = [v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v32;
    while (2)
    {
      for (k = 0LL; k != v17; k = (char *)k + 1)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        if (!-[NSDictionary MCValidateIntersectionRestriction:inRestrictions:defaultRestrictions:]( self,  "MCValidateIntersectionRestriction:inRestrictions:defaultRestrictions:",  *(void *)(*((void *)&v31 + 1) + 8LL * (void)k),  v15,  v4))
        {
          BOOL v25 = 0;
          id v20 = v15;
          goto LABEL_39;
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v20 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", MCUnionKey));
  id v21 = [v20 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v28;
    while (2)
    {
      for (m = 0LL; m != v22; m = (char *)m + 1)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        if (!-[NSDictionary MCValidateUnionRestriction:inRestrictions:defaultRestrictions:]( self,  "MCValidateUnionRestriction:inRestrictions:defaultRestrictions:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)m),  v20,  v4,  (void)v27))
        {
          BOOL v25 = 0;
          goto LABEL_38;
        }
      }

      id v22 = [v20 countByEnumeratingWithState:&v27 objects:v43 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  BOOL v25 = 1;
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
  return v25;
}

- (BOOL)MCValidateBoolRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:MCRestrictedBoolKey]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:MCRestrictedBoolPreferenceKey]);

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([(id)v10 objectForKeyedSubscript:MCRestrictedBoolValueKey]);

      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
      LOBYTE(v10) = objc_opt_isKindOfClass(v14, v15);
    }

    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10 & 1;
}

- (BOOL)MCValidateValueRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:MCRestrictedValueKey]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:MCRestrictedValuePreferSmallerValuesKey]);

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([(id)v10 objectForKeyedSubscript:MCRestrictedValueValueKey]);

      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
      LOBYTE(v10) = objc_opt_isKindOfClass(v14, v15);
    }

    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10 & 1;
}

- (BOOL)MCValidateIntersectionRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:MCIntersectionKey]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:MCIntersectionValuesKey]);

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray);
    char isKindOfClass = objc_opt_isKindOfClass(v12, v13);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)MCValidateUnionRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:MCUnionKey]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:MCUnionValuesKey]);

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray);
    char isKindOfClass = objc_opt_isKindOfClass(v12, v13);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)MCDictionaryAdditiveDeltaToCreateDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = &MailAccountHostname_ptr;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v12, (void)v19));
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v12]);
        if (!v13) {
          goto LABEL_11;
        }
        uint64_t v15 = objc_opt_class(v13);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0) {
          goto LABEL_11;
        }
        uint64_t v16 = objc_opt_class(v10[136]);
        if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 MCDictionaryAdditiveDeltaToCreateDictionary:v14]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v17, v12);

          uint64_t v10 = &MailAccountHostname_ptr;
        }

        else
        {
LABEL_11:
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v14, v12);
        }

- (id)MCDictionarySubtractiveDeltaToCreateDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v6 = self;
  id v7 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = &MailAccountHostname_ptr;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v12, (void)v19));
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v12]);
        if (v14)
        {
          uint64_t v15 = objc_opt_class(v13);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0
            && ([v14 isEqual:v13] & 1) == 0)
          {
            uint64_t v16 = objc_opt_class(v10[136]);
            if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0)
            {
              id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 MCDictionarySubtractiveDeltaToCreateDictionary:v14]);
              if ([v17 count]) {
                -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v17, v12);
              }

              uint64_t v10 = &MailAccountHostname_ptr;
            }
          }
        }

        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, v12);
        }
      }

      id v8 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    }

    while (v8);
  }

  return v5;
}

- (id)MCRemovedKeysFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  self));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    uint64_t v10 = &MailAccountHostname_ptr;
    __int128 v21 = self;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v12));
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v12]);
        if (v13)
        {
          uint64_t v15 = objc_opt_class(v10[136]);
          if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0
            && (uint64_t v16 = objc_opt_class(v10[136]), (objc_opt_isKindOfClass(v14, v16) & 1) != 0))
          {
            id v17 = v5;
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v13));
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 MCRemovedKeysFromDictionary:v14]);

            id v5 = v17;
            if ([v19 count]) {
              [v17 setObject:v19 forKeyedSubscript:v12];
            }
            else {
              [v17 removeObjectForKey:v12];
            }

            self = v21;
            uint64_t v10 = &MailAccountHostname_ptr;
          }

          else
          {
            [v5 removeObjectForKey:v12];
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v8);
  }

  return v5;
}

- (id)MCInsertedKeysFromDictionary:(id)a3 withNewLeafValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v26 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  self));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v8 = v6;
  id v27 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v27)
  {
    __int128 v24 = self;
    uint64_t v25 = *(void *)v29;
    id v23 = v8;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v8);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v10));
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v10]);
        uint64_t v13 = (void *)v12;
        if (v7) {
          __int128 v14 = v7;
        }
        else {
          __int128 v14 = (void *)v12;
        }
        id v15 = v14;
        uint64_t v16 = v13;
        if (v7)
        {
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          uint64_t v16 = v7;
          if ((objc_opt_isKindOfClass(v13, v17) & 1) != 0)
          {
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 MCDictionaryWithLeafValuesSetToValue:v7]);
          }
        }

        if (v11
          && (uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v13, v18) & 1) != 0)
          && (uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v11, v19) & 1) != 0))
        {
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v11));
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 MCInsertedKeysFromDictionary:v13 withNewLeafValue:v7]);

          id v8 = v23;
          [v26 setObject:v21 forKeyedSubscript:v10];

          self = v24;
        }

        else
        {
          [v26 setObject:v16 forKeyedSubscript:v10];
        }
      }

      id v27 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v27);
  }

  return v26;
}

- (id)MCDictionaryWithLeafValuesSetToValue:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  self));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = self;
  id v7 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v11, (void)v16));
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 MCDictionaryWithLeafValuesSetToValue:v4]);
          [v5 setObject:v14 forKeyedSubscript:v11];
        }

        else
        {
          [v5 setObject:v4 forKeyedSubscript:v11];
        }
      }

      id v8 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v8);
  }

  return v5;
}

@end