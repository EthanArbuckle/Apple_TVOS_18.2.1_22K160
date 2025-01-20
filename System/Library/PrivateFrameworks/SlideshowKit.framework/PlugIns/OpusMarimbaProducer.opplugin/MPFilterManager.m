@interface MPFilterManager
+ (id)sharedManager;
+ (void)loadFilterManagerWithPaths:(id)a3;
+ (void)releaseSharedManager;
- (MPFilterManager)initWithPaths:(id)a3;
- (id)allFilterIDs;
- (id)animationsForFilterID:(id)a3 andPresetID:(id)a4;
- (id)attributesForFilterID:(id)a3 andPresetID:(id)a4;
- (id)constraintsForFilterPresetsMatchingList:(id)a3 andCriteria:(id)a4;
- (id)filterCategoryIDs;
- (id)filterIDsForCategoryID:(id)a3;
- (id)filterPresetsMatchingCriteria:(id)a3;
- (id)presetIDsForFilterID:(id)a3;
- (id)randomFilter:(BOOL)a3;
- (id)randomFilterPresetFromList:(id)a3 abidingWithConstraints:(id)a4;
- (id)versionOfFilterID:(id)a3;
- (void)dealloc;
@end

@implementation MPFilterManager

+ (id)sharedManager
{
  id result = (id)qword_2AE660;
  if (!qword_2AE660)
  {
    objc_sync_enter(a1);
    if (!qword_2AE660) {
      qword_2AE660 = -[MPFilterManager initWithPaths:](objc_alloc(&OBJC_CLASS___MPFilterManager), "initWithPaths:", 0LL);
    }
    objc_sync_exit(a1);
    return (id)qword_2AE660;
  }

  return result;
}

+ (void)releaseSharedManager
{
  if (qword_2AE660)
  {
    objc_sync_enter(a1);

    qword_2AE660 = 0LL;
    objc_sync_exit(a1);
  }

- (void)dealloc
{
  self->mFilterPresets = 0LL;
  self->mFilters = 0LL;

  self->mFilterCategories = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPFilterManager;
  -[MPFilterManager dealloc](&v3, "dealloc");
}

- (id)allFilterIDs
{
  return -[NSMutableDictionary allKeys](self->mFilters, "allKeys");
}

- (id)versionOfFilterID:(id)a3
{
  return objc_msgSend( -[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:", a3),  "objectForKey:",  @"version");
}

- (id)filterIDsForCategoryID:(id)a3
{
  return 0LL;
}

- (id)filterCategoryIDs
{
  return self->mFilterCategories;
}

- (id)presetIDsForFilterID:(id)a3
{
  return objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:", a3),  "objectForKey:",  @"presets"),  "allKeys");
}

- (id)attributesForFilterID:(id)a3 andPresetID:(id)a4
{
  id v6 = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:"),  "objectForKey:",  @"presets"),  "objectForKey:",  a4);
  if (!v6) {
    id v6 = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:", a3),  "objectForKey:",  @"presets"),  "objectForKey:",  @"Default");
  }
  return objc_msgSend(objc_msgSend(v6, "objectForKey:", @"attributes"), "copy");
}

- (id)animationsForFilterID:(id)a3 andPresetID:(id)a4
{
  id v6 = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:"),  "objectForKey:",  @"presets"),  "objectForKey:",  a4);
  if (!v6) {
    id v6 = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:", a3),  "objectForKey:",  @"presets"),  "objectForKey:",  @"Default");
  }
  id v7 = [v6 objectForKey:@"animations"];
  if (v7 && (v8 = v7, [v7 count])) {
    return [v8 copy];
  }
  else {
    return 0LL;
  }
}

- (id)constraintsForFilterPresetsMatchingList:(id)a3 andCriteria:(id)a4
{
  id v32 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if (!a3) {
    a3 = -[NSMutableDictionary allKeys](self->mFilters, "allKeys");
  }
  if (!objc_msgSend(a3, "count", v32)) {
    return 0LL;
  }
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v53;
    id obj = a3;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v53 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
        if ([v11 rangeOfString:@"/"] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v12 = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:", v11),  "objectForKey:",  @"presets"),  "allKeys");
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          id v13 = [v12 countByEnumeratingWithState:&v48 objects:v58 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v49;
            do
            {
              for (j = 0LL; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v49 != v15) {
                  objc_enumerationMutation(v12);
                }
                -[NSMutableSet addObject:]( v6,  "addObject:",  [v11 stringByAppendingPathComponent:*(void *)(*((void *)&v48 + 1) + 8 * (void)j)]);
              }

              id v14 = [v12 countByEnumeratingWithState:&v48 objects:v58 count:16];
            }

            while (v14);
          }
        }

        else
        {
          -[NSMutableSet addObject:](v6, "addObject:", v11);
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
    }

    while (v8);
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v44,  v57,  16LL);
  if (v35)
  {
    uint64_t v34 = *(void *)v45;
    do
    {
      for (k = 0LL; k != v35; k = (char *)k + 1)
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(v6);
        }
        v18 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)k);
        id v19 = [v18 stringByDeletingLastPathComponent];
        id v20 = [v18 lastPathComponent];
        id v21 = -[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:", v19);
        id v22 = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mFilters, "objectForKey:", v19),  "objectForKey:",  @"presets"),  "objectForKey:",  v20);
        id obja = v21;
        id v23 = [v21 objectForKey:@"tags"];
        v37 = v22;
        id v24 = [v22 objectForKey:@"tags"];
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        id v25 = [a4 countByEnumeratingWithState:&v40 objects:v56 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v41;
LABEL_28:
          uint64_t v28 = 0LL;
          while (1)
          {
            if (*(void *)v41 != v27) {
              objc_enumerationMutation(a4);
            }
            uint64_t v29 = *(void *)(*((void *)&v40 + 1) + 8 * v28);
            if (([v24 containsObject:v29] & 1) == 0
              && ![v23 containsObject:v29])
            {
              break;
            }

            if (v26 == (id)++v28)
            {
              id v26 = [a4 countByEnumeratingWithState:&v40 objects:v56 count:16];
              if (v26) {
                goto LABEL_28;
              }
              goto LABEL_37;
            }
          }

          if (v29) {
            continue;
          }
        }

- (id)randomFilterPresetFromList:(id)a3 abidingWithConstraints:(id)a4
{
  if (a4)
  {
    id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v22 = [a3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v22)
    {
      id v20 = v6;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(a3);
          }
          uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
          id v9 = [a3 objectForKey:v8];
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          id v10 = [a4 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v24;
LABEL_9:
            uint64_t v13 = 0LL;
            while (1)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(a4);
              }
              uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v13);
              if ([v9 objectForKey:v14])
              {
                objc_msgSend(objc_msgSend(a4, "objectForKey:", v14), "floatValue");
                NSUInteger v16 = (unint64_t)v15;
                NSRange v17 = NSRangeFromString((NSString *)[v9 objectForKey:v14]);
                if (v16 < v17.location || v16 - v17.location >= v17.length) {
                  break;
                }
              }

              if (v11 == (id)++v13)
              {
                id v11 = [a4 countByEnumeratingWithState:&v23 objects:v31 count:16];
                if (v11) {
                  goto LABEL_9;
                }
                goto LABEL_21;
              }
            }

            if (v14) {
              continue;
            }
          }

- (id)filterPresetsMatchingCriteria:(id)a3
{
  id v28 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v23 = self;
  id obj = self->mFilters;
  id v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v41,  v47,  16LL);
  if (v26)
  {
    uint64_t v25 = *(void *)v42;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v42 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v5;
        __int128 v29 = *(void **)(*((void *)&v41 + 1) + 8 * v5);
        if (([v29 isEqualToString:@"Default"] & 1) == 0)
        {
          id v6 = -[NSMutableDictionary objectForKey:](v23->mFilters, "objectForKey:", v29);
          id v7 = (NSDictionary *)[v6 objectForKey:@"presets"];
          if (!v7) {
            id v7 = +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"),  @"Default");
          }
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          id v32 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v37,  v46,  16LL);
          if (v32)
          {
            uint64_t v30 = *(void *)v38;
            v31 = v7;
            do
            {
              for (i = 0LL; i != v32; i = (char *)i + 1)
              {
                if (*(void *)v38 != v30) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v9 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)i);
                id v10 = -[NSDictionary objectForKey:](v7, "objectForKey:", v9);
                __int128 v33 = 0u;
                __int128 v34 = 0u;
                __int128 v35 = 0u;
                __int128 v36 = 0u;
                id v11 = [a3 countByEnumeratingWithState:&v33 objects:v45 count:16];
                if (v11)
                {
                  id v12 = v11;
                  uint64_t v13 = *(void *)v34;
LABEL_16:
                  uint64_t v14 = 0LL;
                  while (1)
                  {
                    if (*(void *)v34 != v13) {
                      objc_enumerationMutation(a3);
                    }
                    uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * v14);
                    if ([v10 objectForKey:v15])
                    {
                      objc_msgSend(objc_msgSend(a3, "objectForKey:", v15), "floatValue");
                      NSUInteger v17 = (unint64_t)v16;
                      v18 = v10;
                    }

                    else
                    {
                      if (![v6 objectForKey:v15]) {
                        goto LABEL_27;
                      }
                      objc_msgSend(objc_msgSend(a3, "objectForKey:", v15), "floatValue");
                      NSUInteger v17 = (unint64_t)v19;
                      v18 = v6;
                    }

                    NSRange v20 = NSRangeFromString((NSString *)[v18 objectForKey:v15]);
                    if (v17 < v20.location || v17 - v20.location >= v20.length)
                    {
                      if (v15) {
                        goto LABEL_32;
                      }
                      break;
                    }

- (id)randomFilter:(BOOL)a3
{
  id v3 = -[NSMutableDictionary allKeys](self->mFilters, "allKeys", a3);
  return objc_msgSend(v3, "objectAtIndex:", rand() % (unint64_t)objc_msgSend(v3, "count"));
}

+ (void)loadFilterManagerWithPaths:(id)a3
{
  if (qword_2AE660)
  {

    qword_2AE660 = 0LL;
  }

  qword_2AE660 = -[MPFilterManager initWithPaths:](objc_alloc(&OBJC_CLASS___MPFilterManager), "initWithPaths:", a3);
}

- (MPFilterManager)initWithPaths:(id)a3
{
  v69.receiver = self;
  v69.super_class = (Class)&OBJC_CLASS___MPFilterManager;
  __int128 v52 = -[MPFilterManager init](&v69, "init");
  if (v52)
  {
    v52->mFilters = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    id v6 = v4;
    id v7 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
    if (a3) {
      [v4 addObjectsFromArray:a3];
    }
    else {
      objc_msgSend( v4,  "addObject:",  -[NSString stringByAppendingPathComponent:]( -[NSBundle resourcePath]( +[NSBundle bundleForClass:]( NSBundle,  "bundleForClass:",  objc_opt_class(MPFilterManager, v5)),  "resourcePath"),  "stringByAppendingPathComponent:",  @"Content"));
    }
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    id obj = v6;
    id v45 = [v6 countByEnumeratingWithState:&v65 objects:v73 count:16];
    if (v45)
    {
      uint64_t v44 = *(void *)v66;
      uint64_t v8 = @"/Filters/%@";
      uint64_t v9 = @"mrbFilter";
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v66 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v46 = v10;
          id v11 = *(void **)(*((void *)&v65 + 1) + 8 * v10);
          id v12 = +[NSData dataWithContentsOfFile:]( NSData,  "dataWithContentsOfFile:",  [v11 stringByAppendingPathComponent:@"FilterDescriptions.plist"]);
          if (v12)
          {
            id v13 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v12,  2LL,  0LL,  0LL);
            if (v13) {
              -[NSMutableDictionary addEntriesFromDictionary:](v52->mFilters, "addEntriesFromDictionary:", v13);
            }
          }

          uint64_t v14 = -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  [v11 stringByAppendingPathComponent:@"Filters/"],  0);
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          __int128 v50 = v14;
          id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v61,  v72,  16LL);
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v62;
            __int128 v47 = v11;
            do
            {
              for (i = 0LL; i != v16; i = (char *)i + 1)
              {
                if (*(void *)v62 != v17) {
                  objc_enumerationMutation(v50);
                }
                id v19 = objc_msgSend( v11,  "stringByAppendingFormat:",  v8,  *(void *)(*((void *)&v61 + 1) + 8 * (void)i));
                if (objc_msgSend(objc_msgSend(v19, "pathExtension"), "isEqualToString:", v9))
                {
                  id v20 = [objc_alloc((Class)v7[206]) initWithPath:v19];
                  if (v20)
                  {
                    uint64_t v21 = v20;
                    id v22 = v9;
                    __int128 v23 = v8;
                    __int128 v24 = v7;
                    id v48 = objc_msgSend(objc_msgSend(v19, "lastPathComponent"), "stringByDeletingPathExtension");
                    id v25 = [v21 pathForResource:@"FilterDescription" ofType:@"plist"];
                    id v26 = [v21 pathForResource:@"LocalizedDescription" ofType:@"plist"];
                    if (v25)
                    {
                      id v27 = v26;
                      id v28 = +[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v25);
                      if (v28)
                      {
                        id v29 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v28,  2LL,  0LL,  0LL);
                        if (v29)
                        {
                          uint64_t v30 = v29;
                          objc_msgSend( v29,  "setObject:forKey:",  objc_msgSend(objc_msgSend(v21, "infoDictionary"), "objectForKey:", @"CFBundleVersion"),  @"version");
                          if (v27)
                          {
                            v31 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v27);
                            if (v31) {
                              objc_msgSend( v30,  "addEntriesFromDictionary:",  -[NSDictionary objectForKey:](v31, "objectForKey:", @"_LOCALIZABLE_"));
                            }
                          }

                          [v30 setObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v19, @"Icon.tiff"), @"thumbnail" forKey];
                          [v30 setObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v19, objc_msgSend(v30, "objectForKey:", @"patchName")), @"patchPath" forKey];
                          -[NSMutableDictionary setObject:forKey:](v52->mFilters, "setObject:forKey:", v30, v48);
                        }
                      }
                    }

                    id v7 = v24;
                    uint64_t v8 = v23;
                    uint64_t v9 = v22;
                    id v11 = v47;
                  }
                }
              }

              id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v50,  "countByEnumeratingWithState:objects:count:",  &v61,  v72,  16LL);
            }

            while (v16);
          }

          uint64_t v10 = v46 + 1;
        }

        while ((id)(v46 + 1) != v45);
        id v45 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
      }

      while (v45);
    }

    v52->mFilterPresets = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    mFilters = v52->mFilters;
    id v32 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mFilters,  "countByEnumeratingWithState:objects:count:",  &v57,  v71,  16LL);
    if (v32)
    {
      id v33 = v32;
      id v51 = *(id *)v58;
      do
      {
        for (j = 0LL; j != v33; j = (char *)j + 1)
        {
          if (*(id *)v58 != v51) {
            objc_enumerationMutation(mFilters);
          }
          __int128 v35 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)j);
          id v36 = objc_msgSend( -[NSMutableDictionary objectForKey:](v52->mFilters, "objectForKey:", v35),  "objectForKey:",  @"presets");
          if (v36)
          {
            __int128 v37 = v36;
            __int128 v55 = 0u;
            __int128 v56 = 0u;
            __int128 v53 = 0u;
            __int128 v54 = 0u;
            id v38 = [v36 countByEnumeratingWithState:&v53 objects:v70 count:16];
            if (v38)
            {
              id v39 = v38;
              uint64_t v40 = *(void *)v54;
              do
              {
                for (k = 0LL; k != v39; k = (char *)k + 1)
                {
                  if (*(void *)v54 != v40) {
                    objc_enumerationMutation(v37);
                  }
                  -[NSMutableDictionary setObject:forKey:]( v52->mFilterPresets,  "setObject:forKey:",  [v37 objectForKey:*(void *)(*((void *)&v53 + 1) + 8 * (void)k)],  objc_msgSend( v35,  "stringByAppendingPathComponent:",  *(void *)(*((void *)&v53 + 1) + 8 * (void)k)));
                }

                id v39 = [v37 countByEnumeratingWithState:&v53 objects:v70 count:16];
              }

              while (v39);
            }
          }

          else
          {
            -[NSMutableDictionary setObject:forKey:]( v52->mFilterPresets,  "setObject:forKey:",  +[NSDictionary dictionary](NSDictionary, "dictionary"),  [v35 stringByAppendingPathComponent:@"Default"]);
          }
        }

        id v33 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mFilters,  "countByEnumeratingWithState:objects:count:",  &v57,  v71,  16LL);
      }

      while (v33);
    }
  }

  return v52;
}

@end