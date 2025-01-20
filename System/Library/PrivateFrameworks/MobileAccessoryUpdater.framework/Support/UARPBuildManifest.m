@interface UARPBuildManifest
- (BOOL)isChipEntryKey:(id)a3;
- (BOOL)parseBuildManifest:(id)a3;
- (NSArray)bundleIdentities;
- (UARPBuildManifest)initWithPlist:(id)a3;
- (id)chipNameForKey:(id)a3;
- (id)createBundleIdentity:(id)a3;
- (id)createChipEntryFromChipEntryDict:(id)a3 chipName:(id)a4;
- (id)createManifestEntryForKey:(id)a3 dictionary:(id)a4;
- (id)createNumberTupleForKey:(id)a3 object:(id)a4;
- (id)generateChipEntries:(id)a3;
- (id)numberForObject:(id)a3;
@end

@implementation UARPBuildManifest

- (UARPBuildManifest)initWithPlist:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPBuildManifest;
  v4 = -[UARPBuildManifest init](&v7, "init");
  if (!v4
    || (v5 = +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  a3)) == 0LL || !-[UARPBuildManifest parseBuildManifest:](v4, "parseBuildManifest:", v5))
  {

    return 0LL;
  }

  return v4;
}

- (BOOL)isChipEntryKey:(id)a3
{
  unint64_t v5 = 0LL;
  do
  {
    unint64_t v6 = v5;
    if (v5 == 3) {
      break;
    }
    unsigned int v7 = [a3 hasSuffix:off_100075B58[v5 + 1]];
    unint64_t v5 = v6 + 1;
  }

  while (!v7);
  return v6 < 3;
}

- (BOOL)parseBuildManifest:(id)a3
{
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v6 = [a3 objectForKeyedSubscript:@"BuildIdentities"];
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (!v8)
    {
LABEL_11:
      self->_bundleIdentities = -[NSArray initWithArray:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:", v5);
      LOBYTE(v14) = 1;
      return (char)v14;
    }

    id v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_4:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0) {
        break;
      }
      id v14 = -[UARPBuildManifest createBundleIdentity:](self, "createBundleIdentity:", v12);
      if (!v14) {
        return (char)v14;
      }
      v15 = v14;
      [v5 addObject:v14];

      if (v9 == (id)++v11)
      {
        id v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_4;
        }
        goto LABEL_11;
      }
    }
  }

  LOBYTE(v14) = 0;
  return (char)v14;
}

- (id)chipNameForKey:(id)a3
{
  id v3 = objc_msgSend( a3,  "componentsSeparatedByCharactersInSet:",  +[NSCharacterSet characterSetWithCharactersInString:]( NSCharacterSet,  "characterSetWithCharactersInString:",  @","));
  if ([v3 count] == (id)1) {
    return @"Ap";
  }
  else {
    return [v3 firstObject];
  }
}

- (id)createBundleIdentity:(id)a3
{
  id v37 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v42 objects:v47 count:16];
  id v6 = &ADClientAddValueForScalarKey_ptr;
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v43;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v43 != v8) {
        objc_enumerationMutation(a3);
      }
      uint64_t v10 = *(void *)(*((void *)&v42 + 1) + 8 * v9);
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0) {
        break;
      }
      if (-[UARPBuildManifest isChipEntryKey:](self, "isChipEntryKey:", v10))
      {
        id v12 = -[UARPBuildManifest chipNameForKey:](self, "chipNameForKey:", v10);
        id v13 = [v37 objectForKeyedSubscript:v12];
        if (!v13)
        {
          id v13 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
          [v37 setObject:v13 forKeyedSubscript:v12];
        }

        objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", v10), v10);
      }

      if (v7 == (id)++v9)
      {
        id v7 = [a3 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
  }

  else
  {
LABEL_13:
    id v14 = [a3 objectForKeyedSubscript:@"Manifest"];
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      id v35 = a3;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id v16 = [v14 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v39;
        __int128 v19 = @"Info";
        v36 = self;
LABEL_16:
        uint64_t v20 = 0LL;
        while (1)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v14);
          }
          uint64_t v21 = *(void *)(*((void *)&v38 + 1) + 8 * v20);
          uint64_t v22 = objc_opt_class(v6[138]);
          if ((objc_opt_isKindOfClass(v21, v22) & 1) == 0) {
            break;
          }
          id result = objc_msgSend(objc_msgSend(v14, "objectForKeyedSubscript:", v21), "objectForKeyedSubscript:", v19);
          if (!result) {
            return result;
          }
          if (objc_msgSend( objc_msgSend(result, "objectForKeyedSubscript:", @"Personalize"),  "BOOLValue"))
          {
            v24 = v6;
            id result = objc_msgSend( v37,  "objectForKeyedSubscript:",  -[UARPBuildManifest chipNameForKey:](self, "chipNameForKey:", v21));
            if (!result) {
              return result;
            }
            id v25 = result;
            v26 = v19;
            id v27 = [result objectForKeyedSubscript:@"Manifest"];
            if (!v27)
            {
              id v27 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
              [v25 setObject:v27 forKeyedSubscript:@"Manifest"];
            }

            objc_msgSend(v27, "setObject:forKeyedSubscript:", objc_msgSend(v14, "objectForKeyedSubscript:", v21), v21);
            id v6 = v24;
            __int128 v19 = v26;
            self = v36;
          }

          if (v17 == (id)++v20)
          {
            id v17 = [v14 countByEnumeratingWithState:&v38 objects:v46 count:16];
            if (v17) {
              goto LABEL_16;
            }
            goto LABEL_28;
          }
        }
      }

      else
      {
LABEL_28:
        id v28 = -[UARPBuildManifest generateChipEntries:](self, "generateChipEntries:", v37);
        id result = [v28 count];
        if (!result) {
          return result;
        }
        id v29 = [v35 objectForKeyedSubscript:@"Info"];
        uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
        {
          id v31 = [v29 objectForKeyedSubscript:@"BuildTrain"];
          uint64_t v32 = objc_opt_class(v6[138]);
          if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0)
          {
            id v33 = [v29 objectForKeyedSubscript:@"BuildNumber"];
            uint64_t v34 = objc_opt_class(v6[138]);
            if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0) {
              return -[UARPBundleIdentity initWithBuild:chipEntries:]( [UARPBundleIdentity alloc],  "initWithBuild:chipEntries:",  [v6[138] stringWithFormat:@"%@%@", v31, v33],  v28);
            }
          }
        }
      }
    }
  }

  return 0LL;
}

- (id)numberForObject:(id)a3
{
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(a3, v4) & 1) != 0)
  {
    else {
      return 0LL;
    }
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(a3, v6) & 1) != 0) {
      return a3;
    }
    else {
      return 0LL;
    }
  }

- (id)createNumberTupleForKey:(id)a3 object:(id)a4
{
  id result = -[UARPBuildManifest numberForObject:](self, "numberForObject:", a4);
  if (result) {
    return -[UARPPersonalizationNumberTuple32 initWithKey:value:]( [UARPPersonalizationNumberTuple32 alloc],  "initWithKey:value:",  a3,  [result unsignedIntValue]);
  }
  return result;
}

- (id)createManifestEntryForKey:(id)a3 dictionary:(id)a4
{
  id result = [a4 objectForKeyedSubscript:@"Digest"];
  if (result) {
    return -[UARPBundleIdentityManifestEntry initWithName:digest:trusted:]( [UARPBundleIdentityManifestEntry alloc],  "initWithName:digest:trusted:",  a3,  result,  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"Trusted"), "BOOLValue"));
  }
  return result;
}

- (id)createChipEntryFromChipEntryDict:(id)a3 chipName:(id)a4
{
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v30 = [a3 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (!v30)
  {
    id v11 = 0LL;
    id v10 = 0LL;
    id v9 = 0LL;
    id v8 = 0LL;
LABEL_45:
    v23 = 0LL;
    goto LABEL_46;
  }

  id v25 = a4;
  id v8 = 0LL;
  id v9 = 0LL;
  id v10 = 0LL;
  id v11 = 0LL;
  uint64_t v29 = *(void *)v36;
  do
  {
    for (i = 0LL; i != v30; i = (char *)i + 1)
    {
      if (*(void *)v36 != v29) {
        objc_enumerationMutation(a3);
      }
      id v13 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
      id v14 = objc_msgSend(a3, "objectForKeyedSubscript:", v13, v25);
      if ([v13 hasSuffix:@"BoardID"])
      {
        if (v11) {
          goto LABEL_45;
        }
        id v11 = -[UARPBuildManifest createNumberTupleForKey:object:](self, "createNumberTupleForKey:object:", v13, v14);
        if (!v11) {
          goto LABEL_45;
        }
      }

      else if ([v13 hasSuffix:@"ChipID"])
      {
        if (v10) {
          goto LABEL_45;
        }
        id v10 = -[UARPBuildManifest createNumberTupleForKey:object:](self, "createNumberTupleForKey:object:", v13, v14);
        if (!v10) {
          goto LABEL_45;
        }
      }

      else if ([v13 hasSuffix:@"ManifestEpoch"])
      {
        if (v9) {
          goto LABEL_45;
        }
        id v9 = -[UARPBuildManifest createNumberTupleForKey:object:](self, "createNumberTupleForKey:object:", v13, v14);
        if (!v9) {
          goto LABEL_45;
        }
      }

      else if ([v13 hasSuffix:@"SecurityDomain"])
      {
        if (v8) {
          goto LABEL_45;
        }
        id v8 = -[UARPBuildManifest createNumberTupleForKey:object:](self, "createNumberTupleForKey:object:", v13, v14);
        if (!v8) {
          goto LABEL_45;
        }
      }

      else if ([v13 isEqual:@"Manifest"])
      {
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        id v15 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v15)
        {
          id v16 = v15;
          id v26 = v10;
          id v27 = v9;
          id v28 = v8;
          uint64_t v17 = *(void *)v32;
          while (2)
          {
            for (j = 0LL; j != v16; j = (char *)j + 1)
            {
              if (*(void *)v32 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = -[UARPBuildManifest createManifestEntryForKey:dictionary:]( self,  "createManifestEntryForKey:dictionary:",  *(void *)(*((void *)&v31 + 1) + 8 * (void)j),  [v14 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * (void)j)]);
              if (!v19)
              {
                v23 = 0LL;
                id v9 = v27;
                id v8 = v28;
                id v10 = v26;
                goto LABEL_46;
              }

              uint64_t v20 = v19;
              [v7 addObject:v19];
            }

            id v16 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v16) {
              continue;
            }
            break;
          }

          id v9 = v27;
          id v8 = v28;
          id v10 = v26;
        }
      }
    }

    id v30 = [a3 countByEnumeratingWithState:&v35 objects:v40 count:16];
  }

  while (v30);
  if (v11) {
    BOOL v21 = v10 == 0LL;
  }
  else {
    BOOL v21 = 1;
  }
  BOOL v22 = v21 || v8 == 0LL;
  if (v22 || ![v7 count]) {
    goto LABEL_45;
  }
  v23 = -[UARPBundleIdentityChipEntry initWithChipName:boardID:chipID:securityDomain:manifest:]( objc_alloc(&OBJC_CLASS___UARPBundleIdentityChipEntry),  "initWithChipName:boardID:chipID:securityDomain:manifest:",  v25,  v11,  v10,  v8,  v7);
  -[UARPBundleIdentityChipEntry setManifestEpoch:](v23, "setManifestEpoch:", v9);
LABEL_46:

  return v23;
}

- (id)generateChipEntries:(id)a3
{
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5);
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0LL;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(a3);
    }
    id result = -[UARPBuildManifest createChipEntryFromChipEntryDict:chipName:]( self,  "createChipEntryFromChipEntryDict:chipName:",  [a3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * v9)],  *(void *)(*((void *)&v12 + 1) + 8 * v9));
    if (!result) {
      return result;
    }
    id v11 = result;
    [v5 addObject:result];

    if (v7 == (id)++v9)
    {
      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5);
    }
  }

- (NSArray)bundleIdentities
{
  return self->_bundleIdentities;
}

@end