@interface MASAutoAssetSetAtomicEntry
+ (id)newServerMessageClasses:(id)a3;
+ (id)newShimmedArrayFromFramework:(id)a3;
+ (id)newShimmedArrayToFramework:(id)a3;
+ (id)newShimmedDictionaryFromFramework:(id)a3;
+ (id)newShimmedDictionaryToFramework:(id)a3;
+ (id)newShimmedFromFramework:(id)a3;
+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4;
+ (id)newShimmedToFramework:(id)a3;
@end

@implementation MASAutoAssetSetAtomicEntry

+ (id)newShimmedArrayToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && (p_ivars = &MobileAssetKeyManager__metaData.ivars, objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry))
    && (id v5 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetAtomicEntry),
        char v6 = objc_opt_respondsToSelector( v5,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:"),  v5,  (v6 & 1) != 0))
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v8 = (char *)[v3 count];
    if ((uint64_t)v8 >= 1)
    {
      v9 = v8;
      v20 = v7;
      for (i = 0LL; i != v9; ++i)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:i]);
        if (v11)
        {
          v12 = p_ivars;
          id v13 = objc_alloc((Class)p_ivars[190]);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v11 fullAssetSelector]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v11 assetID]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v11 localContentURL]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v11 assetAttributes]);
          id v18 = objc_msgSend( v13,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:",  v14,  v15,  v16,  v17,  objc_msgSend(v11, "inhibitedFromEmergencyRemoval"));

          if (v18) {
            -[NSMutableArray addObject:](v20, "addObject:", v18);
          }

          p_ivars = v12;
        }
      }

      v7 = v20;
    }
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

+ (id)newServerMessageClasses:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [v3 setByAddingObject:objc_opt_class(MAAutoAssetSelector)];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (__isPlatformVersionAtLeast(3, 17, 0, 0)
      && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry))
    {
      id v6 = [v5 setByAddingObject:objc_opt_class(MASAutoAssetSetAtomicEntry)];
      uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

      id v5 = (void *)v7;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)newShimmedToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry)
    && (id v4 = objc_alloc(&OBJC_CLASS___MASAutoAssetSetAtomicEntry),
        char v5 = objc_opt_respondsToSelector( v4,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:"),  v4,  (v5 & 1) != 0))
  {
    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetAtomicEntry);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 fullAssetSelector]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 assetID]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 localContentURL]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 assetAttributes]);
    id v11 = objc_msgSend( v6,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:",  v7,  v8,  v9,  v10,  objc_msgSend(v3, "inhibitedFromEmergencyRemoval"));
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

+ (id)newShimmedFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetAtomicEntry),
        char v5 = objc_opt_respondsToSelector( v4,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:"),  v4,  (v5 & 1) != 0))
  {
    id v6 = v3;
    uint64_t v7 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetAtomicEntry);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 fullAssetSelector]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 assetID]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 localContentURL]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 assetAttributes]);
    id v12 = [v6 inhibitedFromEmergencyRemoval];

    id v13 = -[MANAutoAssetSetAtomicEntry initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:]( v7,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:",  v8,  v9,  v10,  v11,  v12);
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

+ (id)newShimmedFromFrameworkMessage:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  id v8 = 0LL;
  if (v5 && v6)
  {
    if (__isPlatformVersionAtLeast(3, 17, 0, 0)
      && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry)
      && (id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetAtomicEntry),
          char v10 = objc_opt_respondsToSelector( v9,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:"),  v9,  (v10 & 1) != 0))
    {
      id v11 = [v5 safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetSetAtomicEntry)];
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v8 = +[MASAutoAssetSetAtomicEntry newShimmedFromFramework:]( &OBJC_CLASS___MASAutoAssetSetAtomicEntry,  "newShimmedFromFramework:",  v12);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

+ (id)newShimmedArrayFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && (p_ivars = &MobileAssetKeyManager__metaData.ivars, objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry))
    && (id v5 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetAtomicEntry),
        char v6 = objc_opt_respondsToSelector( v5,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:"),  v5,  (v6 & 1) != 0))
  {
    id v7 = v3;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      char v10 = (char *)[v7 count];
      if ((uint64_t)v10 >= 1)
      {
        id v11 = v10;
        id v12 = 0LL;
        id v22 = v7;
        do
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v12]);
          if (v13)
          {
            uint64_t v14 = objc_opt_class(p_ivars[190]);
            if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
            {
              v15 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetAtomicEntry);
              v16 = (void *)objc_claimAutoreleasedReturnValue([v13 fullAssetSelector]);
              v17 = (void *)objc_claimAutoreleasedReturnValue([v13 assetID]);
              id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 localContentURL]);
              v19 = (void *)objc_claimAutoreleasedReturnValue([v13 assetAttributes]);
              v20 = -[MANAutoAssetSetAtomicEntry initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:]( v15,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:",  v16,  v17,  v18,  v19,  [v13 inhibitedFromEmergencyRemoval]);

              if (v20) {
                -[NSMutableArray addObject:](v9, "addObject:", v20);
              }

              p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
              id v7 = v22;
            }
          }

          ++v12;
        }

        while (v11 != v12);
      }
    }

    else
    {
      id v9 = 0LL;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

+ (id)newShimmedDictionaryToFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry)
    && (id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetAtomicEntry),
        char v5 = objc_opt_respondsToSelector( v4,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:"),  v4,  (v5 & 1) != 0))
  {
    id v18 = v3;
    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v6 = v3;
    id v21 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v21)
    {
      uint64_t v20 = *(void *)v23;
      do
      {
        id v7 = 0LL;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v6);
          }
          uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v7);
          id v9 = [v6 safeObjectForKey:v8 ofClass:objc_opt_class(MANAutoAssetSetAtomicEntry)];
          char v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
          if (v10)
          {
            id v11 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetAtomicEntry);
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 fullAssetSelector]);
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 assetID]);
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 localContentURL]);
            v15 = (void *)objc_claimAutoreleasedReturnValue([v10 assetAttributes]);
            id v16 = objc_msgSend( v11,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:",  v12,  v13,  v14,  v15,  objc_msgSend(v10, "inhibitedFromEmergencyRemoval"));

            -[NSMutableDictionary setSafeObject:forKey:](v19, "setSafeObject:forKey:", v16, v8);
          }

          id v7 = (char *)v7 + 1;
        }

        while (v21 != v7);
        id v21 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v21);
    }

    id v3 = v18;
  }

  else
  {
    v19 = 0LL;
  }

  return v19;
}

+ (id)newShimmedDictionaryFromFramework:(id)a3
{
  id v3 = a3;
  if (v3
    && __isPlatformVersionAtLeast(3, 17, 0, 0)
    && (p_ivars = &MobileAssetKeyManager__metaData.ivars, objc_opt_class(&OBJC_CLASS___MAAutoAssetSetAtomicEntry))
    && (id v5 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetAtomicEntry),
        char v6 = objc_opt_respondsToSelector( v5,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:"),  v5,  (v6 & 1) != 0))
  {
    id v7 = v3;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      id v28 = v3;
      v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      id v27 = v7;
      id v9 = v7;
      id v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v32;
        id v29 = v9;
        do
        {
          id v13 = 0LL;
          do
          {
            if (*(void *)v32 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)v13);
            id v15 = [v9 safeObjectForKey:v14 ofClass:objc_opt_class(p_ivars[190])];
            id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
            if (v16)
            {
              uint64_t v17 = objc_opt_class(p_ivars[190]);
              if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
              {
                id v18 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetAtomicEntry);
                v19 = (void *)objc_claimAutoreleasedReturnValue([v16 fullAssetSelector]);
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v16 assetID]);
                id v21 = v11;
                __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v16 localContentURL]);
                uint64_t v23 = v12;
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v16 assetAttributes]);
                __int128 v25 = -[MANAutoAssetSetAtomicEntry initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:]( v18,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:",  v19,  v20,  v22,  v24,  [v16 inhibitedFromEmergencyRemoval]);

                uint64_t v12 = v23;
                id v11 = v21;
                id v9 = v29;

                -[NSMutableDictionary setSafeObject:forKey:](v30, "setSafeObject:forKey:", v25, v14);
                p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
              }
            }

            id v13 = (char *)v13 + 1;
          }

          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }

        while (v11);
      }

      id v7 = v27;
      id v3 = v28;
    }

    else
    {
      v30 = 0LL;
    }
  }

  else
  {
    v30 = 0LL;
  }

  return v30;
}

@end