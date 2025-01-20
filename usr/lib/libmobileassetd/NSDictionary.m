@interface NSDictionary
- (BOOL)areRequirementsMetByBrain;
- (BOOL)areRequirementsMetByBrain:(id *)a3 error:(id *)a4;
- (BOOL)areRequirementsMetByBrainFeatures:(id)a3;
- (BOOL)areRequirementsMetByBrainFeatures:(id)a3 missingRequirements:(id *)a4 error:(id *)a5;
- (id)safeObjectForKey:(id)a3 ofClass:(Class)a4;
@end

@implementation NSDictionary

- (id)safeObjectForKey:(id)a3 ofClass:(Class)a4
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  v6 = (void *)v5;
  if (v5 && (objc_opt_isKindOfClass(v5, a4) & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)areRequirementsMetByBrain
{
  id v3 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Brain features: %@", _brainSupportedFeatures));
  id v4 = [v3 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[NSDictionary(MABrainFeatures) areRequirementsMetByBrain]",  @"[MAB] %s",  v5,  v6,  v7,  v8,  (uint64_t)v4);

  return -[NSDictionary areRequirementsMetByBrainFeatures:]( self,  "areRequirementsMetByBrainFeatures:",  _brainSupportedFeatures);
}

- (BOOL)areRequirementsMetByBrain:(id *)a3 error:(id *)a4
{
  id v7 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Brain features: %@", _brainSupportedFeatures));
  id v8 = [v7 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[NSDictionary(MABrainFeatures) areRequirementsMetByBrain:error:]",  @"[MAB] %s",  v9,  v10,  v11,  v12,  (uint64_t)v8);

  return -[NSDictionary areRequirementsMetByBrainFeatures:missingRequirements:error:]( self,  "areRequirementsMetByBrainFeatures:missingRequirements:error:",  _brainSupportedFeatures,  a3,  a4);
}

- (BOOL)areRequirementsMetByBrainFeatures:(id)a3
{
  return -[NSDictionary areRequirementsMetByBrainFeatures:missingRequirements:error:]( self,  "areRequirementsMetByBrainFeatures:missingRequirements:error:",  a3,  0LL,  0LL);
}

- (BOOL)areRequirementsMetByBrainFeatures:(id)a3 missingRequirements:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = &__NSDictionary0__struct;
  }
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  uint64_t v10 = self;
  id v11 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v58,  v66,  16LL);
  if (!v11)
  {

    v30 = 0LL;
LABEL_24:
    id v29 = 0LL;
    BOOL v28 = 1;
    if (a4) {
      goto LABEL_33;
    }
    goto LABEL_35;
  }

  id v12 = v11;
  v53 = a5;
  v54 = a4;
  v56 = v9;
  v57 = 0LL;
  uint64_t v13 = *(void *)v59;
  p_ivars = &MobileAssetKeyManager__metaData.ivars;
  v15 = &off_38EED8;
  while (2)
  {
    v16 = 0LL;
    id v55 = v12;
    do
    {
      if (*(void *)v59 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v17 = *(void *)(*((void *)&v58 + 1) + 8LL * (void)v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v10, "objectForKey:", v17));
      if (!v18)
      {
        id v31 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Internal Error - no value for required feature: %@", v17));
        id v32 = [v31 UTF8String];
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[NSDictionary(MABrainFeatures) areRequirementsMetByBrainFeatures:missingRequirements:error:]",  @"[MAB] %s",  v33,  v34,  v35,  v36,  (uint64_t)v32);

        NSErrorUserInfoKey v64 = NSDebugDescriptionErrorKey;
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"no value for required feature: %@",  v17));
        v65 = v37;
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
        id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileAssetBrainErrorDomain",  902LL,  v38));
        goto LABEL_28;
      }

      uint64_t v19 = objc_opt_class(p_ivars[149]);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
      {
        v39 = (objc_class *)objc_opt_class(v18);
        v40 = NSStringFromClass(v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Required feature '%@' is not a number: %@ [%@]",  v17,  v18,  v41));

        id v43 = v42;
        id v44 = [v43 UTF8String];
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[NSDictionary(MABrainFeatures) areRequirementsMetByBrainFeatures:missingRequirements:error:]",  @"[MAB] %s",  v45,  v46,  v47,  v48,  (uint64_t)v44);

        NSErrorUserInfoKey v62 = NSDebugDescriptionErrorKey;
        v49 = (objc_class *)objc_opt_class(v18);
        v50 = NSStringFromClass(v49);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v50);
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Required feature '%@' is not a number: %@ [%@]",  v17,  v18,  v37));
        v63 = v38;
        v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v63,  &v62,  1LL));
        id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileAssetBrainErrorDomain",  903LL,  v51));

        uint64_t v9 = v56;
LABEL_28:

        BOOL v28 = 0;
        if (v53)
        {
          a4 = v54;
          if (v29)
          {
            id v29 = v29;
            BOOL v28 = 0;
            id *v53 = v29;
          }
        }

        else
        {
          a4 = v54;
        }

        goto LABEL_32;
      }

      uint64_t v20 = objc_claimAutoreleasedReturnValue([v9 objectForKey:v17]);
      if (v20) {
        v21 = (void *)v20;
      }
      else {
        v21 = v15;
      }
      if ([v21 compare:v18] == (id)-1)
      {
        uint64_t v22 = v13;
        v23 = v10;
        v24 = p_ivars;
        v25 = v15;
        v26 = v57;
        if (!v57) {
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL));
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v18, v21, 0LL));
        v57 = v26;
        [v26 setObject:v27 forKey:v17];

        v15 = v25;
        p_ivars = v24;
        uint64_t v10 = v23;
        uint64_t v13 = v22;
        id v12 = v55;
        uint64_t v9 = v56;
      }

      v16 = (char *)v16 + 1;
    }

    while (v12 != v16);
    id v12 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v58,  v66,  16LL);
    if (v12) {
      continue;
    }
    break;
  }

  if (!v57)
  {
    v30 = 0LL;
    a4 = v54;
    goto LABEL_24;
  }

  a4 = v54;
  if (![v57 count])
  {
    v30 = v57;
    goto LABEL_24;
  }

  BOOL v28 = 0;
  id v29 = 0LL;
LABEL_32:
  v30 = v57;
  if (!a4) {
    goto LABEL_35;
  }
LABEL_33:
  if (v30) {
    *a4 = v30;
  }
LABEL_35:

  return v28;
}

@end