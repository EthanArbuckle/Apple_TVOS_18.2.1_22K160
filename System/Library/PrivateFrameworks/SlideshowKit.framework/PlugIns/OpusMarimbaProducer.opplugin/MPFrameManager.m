@interface MPFrameManager
+ (id)sharedManager;
+ (void)loadFrameManagerWithPaths:(id)a3;
+ (void)releaseSharedManager;
- (MPFrameManager)initWithPaths:(id)a3;
- (id)allCategoryIDs;
- (id)allFrameIDs;
- (id)attributesForFrameID:(id)a3 andPresetID:(id)a4;
- (id)categoryIDsForFrameID:(id)a3;
- (id)constraintsForFramesMatchingList:(id)a3 andCriteria:(id)a4;
- (id)descriptionForFrameID:(id)a3;
- (id)framesForCategoryID:(id)a3;
- (id)localizedCategoryNameFromCategoryID:(id)a3;
- (id)localizedFrameNameForFrameID:(id)a3;
- (id)randomFrameFromList:(id)a3 abidingWithConstraints:(id)a4;
- (id)versionOfFrameID:(id)a3;
- (void)dealloc;
@end

@implementation MPFrameManager

+ (id)sharedManager
{
  id result = (id)qword_2B04D8;
  if (!qword_2B04D8)
  {
    objc_sync_enter(a1);
    if (!qword_2B04D8) {
      qword_2B04D8 = -[MPFrameManager initWithPaths:](objc_alloc(&OBJC_CLASS___MPFrameManager), "initWithPaths:", 0LL);
    }
    objc_sync_exit(a1);
    return (id)qword_2B04D8;
  }

  return result;
}

+ (void)releaseSharedManager
{
  if (qword_2B04D8)
  {
    objc_sync_enter(a1);

    qword_2B04D8 = 0LL;
    objc_sync_exit(a1);
  }

- (void)dealloc
{
  self->mFrames = 0LL;
  self->mCategories = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPFrameManager;
  -[MPFrameManager dealloc](&v3, "dealloc");
}

- (id)allFrameIDs
{
  return -[NSMutableDictionary allKeys](self->mFrames, "allKeys");
}

- (id)allCategoryIDs
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  objc_msgSend(v3, "addObjectsFromArray:", -[NSMutableDictionary allKeys](self->mCategories, "allKeys"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  obj = self->mFrames;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = -[MPFrameManager categoryIDsForFrameID:]( self,  "categoryIDsForFrameID:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)i));
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        id v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            for (j = 0LL; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)j);
            }

            id v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }

          while (v10);
        }
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v5);
  }

  return v3;
}

- (id)versionOfFrameID:(id)a3
{
  return objc_msgSend( -[NSMutableDictionary objectForKey:](self->mFrames, "objectForKey:", a3),  "objectForKey:",  @"version");
}

- (id)localizedFrameNameForFrameID:(id)a3
{
  id result = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mFrames, "objectForKey:"),  "objectForKey:",  @"localizedFrameName");
  if (!result) {
    return a3;
  }
  return result;
}

- (id)localizedCategoryNameFromCategoryID:(id)a3
{
  id result = -[NSMutableDictionary objectForKey:](self->mCategories, "objectForKey:");
  if (!result)
  {
    id v6 = -[MPFrameManager framesForCategoryID:](self, "framesForCategoryID:", a3);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
LABEL_5:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        id result = objc_msgSend( -[NSMutableDictionary objectForKey:]( self->mFrames,  "objectForKey:",  *(void *)(*((void *)&v11 + 1) + 8 * v10)),  "objectForKey:",  @"localizedCategoryName");
        if (result) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v8) {
            goto LABEL_5;
          }
          return a3;
        }
      }
    }

    else
    {
      return a3;
    }
  }

  return result;
}

- (id)categoryIDsForFrameID:(id)a3
{
  return  objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mFrames, "objectForKey:", a3),  "objectForKey:",  @"categories"),  "copy");
}

- (id)framesForCategoryID:(id)a3
{
  id v5 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  mFrames = self->mFrames;
  id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mFrames,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(mFrames);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_msgSend( -[MPFrameManager categoryIDsForFrameID:](self, "categoryIDsForFrameID:", v11),  "containsObject:",  a3) & 1) != 0 || objc_msgSend(a3, "isEqualToString:", @"all"))
        {
          [v5 addObject:v11];
        }
      }

      id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mFrames,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  return v5;
}

- (id)descriptionForFrameID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mFrames, "objectForKey:", a3);
}

- (id)attributesForFrameID:(id)a3 andPresetID:(id)a4
{
  id v5 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mFrames, "objectForKey:", a3),  "objectForKey:",  @"presets");
  objc_sync_enter(v5);
  id v6 = (NSMutableDictionary *)[v5 objectForKey:a4];
  if (!v6)
  {
    id v6 = (NSMutableDictionary *)[v5 objectForKey:@"Default"];
    if (!v6)
    {
      id v6 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  0LL);
      [v5 setObject:v6 forKey:@"Default"];
    }
  }

  objc_sync_exit(v5);
  return v6;
}

+ (void)loadFrameManagerWithPaths:(id)a3
{
  if (qword_2B04D8)
  {

    qword_2B04D8 = 0LL;
  }

  qword_2B04D8 = -[MPFrameManager initWithPaths:](objc_alloc(&OBJC_CLASS___MPFrameManager), "initWithPaths:", a3);
}

- (id)randomFrameFromList:(id)a3 abidingWithConstraints:(id)a4
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
      __int128 v20 = v6;
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

- (id)constraintsForFramesMatchingList:(id)a3 andCriteria:(id)a4
{
  id v22 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if (!a4) {
    return 0LL;
  }
  if (!a3) {
    a3 = -[MPFrameManager allFrameIDs](self, "allFrameIDs");
  }
  if (!objc_msgSend(a3, "count", v22)) {
    return 0LL;
  }
  obj = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(a3);
        }
        -[NSMutableSet addObject:](obj, "addObject:", *(void *)(*((void *)&v35 + 1) + 8LL * (void)i));
      }

      id v7 = [a3 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }

    while (v7);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v31,  v40,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)j);
        id v14 = -[NSMutableDictionary objectForKey:](self->mFrames, "objectForKey:", v13);
        id v15 = [v14 objectForKey:@"tags"];
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        id v16 = [a4 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v28;
LABEL_19:
          uint64_t v19 = 0LL;
          while (1)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(a4);
            }
            uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * v19);
            if (v17 == (id)++v19)
            {
              id v17 = [a4 countByEnumeratingWithState:&v27 objects:v39 count:16];
              if (v17) {
                goto LABEL_19;
              }
              goto LABEL_27;
            }
          }

          if (v20) {
            continue;
          }
        }

- (MPFrameManager)initWithPaths:(id)a3
{
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___MPFrameManager;
  id v4 = -[MPFrameManager init](&v59, "init");
  if (v4)
  {
    id v5 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
    v4->mFrames = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4->mCategories = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v46 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
    id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    uint64_t v8 = v6;
    if (a3) {
      [v6 addObjectsFromArray:a3];
    }
    else {
      objc_msgSend( v6,  "addObject:",  -[NSString stringByAppendingPathComponent:]( -[NSBundle resourcePath]( +[NSBundle bundleForClass:]( NSBundle,  "bundleForClass:",  objc_opt_class(MPFrameManager, v7)),  "resourcePath"),  "stringByAppendingPathComponent:",  @"Content"));
    }
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    id obj = v8;
    id v42 = [v8 countByEnumeratingWithState:&v55 objects:v62 count:16];
    if (v42)
    {
      uint64_t v41 = *(void *)v56;
      v45 = v4;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v56 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v43 = v9;
          id v10 = *(void **)(*((void *)&v55 + 1) + 8 * v9);
          id v11 = +[NSData dataWithContentsOfFile:]( NSData,  "dataWithContentsOfFile:",  [v10 stringByAppendingPathComponent:@"FrameDescriptions.plist"]);
          if (v11)
          {
            id v12 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v11,  2LL,  0LL,  0LL);
            if (v12)
            {
              uint64_t v13 = v12;
              __int128 v53 = 0u;
              __int128 v54 = 0u;
              __int128 v51 = 0u;
              __int128 v52 = 0u;
              id v14 = [v12 countByEnumeratingWithState:&v51 objects:v61 count:16];
              if (v14)
              {
                id v15 = v14;
                uint64_t v16 = *(void *)v52;
                do
                {
                  for (i = 0LL; i != v15; i = (char *)i + 1)
                  {
                    if (*(void *)v52 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    uint64_t v18 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)i);
                    id v19 = objc_msgSend( objc_msgSend( objc_msgSend(v10, "stringByAppendingPathComponent:", @"Frames"),  "stringByAppendingPathComponent:",  v18),  "stringByAppendingPathExtension:",  @"qtz");
                    if (v19)
                    {
                      id v20 = v19;
                      if (-[NSFileManager fileExistsAtPath:](v46, "fileExistsAtPath:", v19))
                      {
                        id v21 = objc_msgSend( objc_alloc((Class)v5[228]),  "initWithDictionary:",  objc_msgSend(v13, "objectForKey:", v18));
                        [v21 setObject:v20 forKey:@"patchPath"];
                        -[NSMutableDictionary setObject:forKey:](v4->mFrames, "setObject:forKey:", v21, v18);
                      }
                    }
                  }

                  id v15 = [v13 countByEnumeratingWithState:&v51 objects:v61 count:16];
                }

                while (v15);
              }
            }
          }

          id v22 = -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  [v10 stringByAppendingPathComponent:@"Frames/"],  0);
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          id v23 = -[NSArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v47,  v60,  16LL);
          uint64_t v24 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
          if (v23)
          {
            id v25 = v23;
            uint64_t v26 = *(void *)v48;
            v44 = v22;
            do
            {
              for (j = 0LL; j != v25; j = (char *)j + 1)
              {
                if (*(void *)v48 != v26) {
                  objc_enumerationMutation(v22);
                }
                id v28 = [v10 stringByAppendingFormat:@"/Frames/%@", *(void *)(*((void *)&v47 + 1) + 8 * (void)j)];
                if (objc_msgSend( objc_msgSend(v28, "pathExtension"),  "isEqualToString:",  @"mrbFrame"))
                {
                  id v29 = [objc_alloc((Class)v24[206]) initWithPath:v28];
                  if (v29)
                  {
                    __int128 v30 = v29;
                    id v31 = objc_msgSend(objc_msgSend(v28, "lastPathComponent"), "stringByDeletingPathExtension");
                    id v32 = [v30 pathForResource:@"FrameDescription" ofType:@"plist"];
                    id v33 = [v30 pathForResource:@"LocalizedDescription" ofType:@"plist"];
                    if (v32)
                    {
                      id v34 = v33;
                      __int128 v35 = +[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v32);
                      if (v35)
                      {
                        id v36 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v35,  2LL,  0LL,  0LL);
                        if (v36)
                        {
                          __int128 v37 = v36;
                          if (v34)
                          {
                            __int128 v38 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v34);
                            if (v38) {
                              objc_msgSend( v37,  "addEntriesFromDictionary:",  -[NSDictionary objectForKey:](v38, "objectForKey:", @"_LOCALIZABLE_"));
                            }
                          }

                          objc_msgSend( v37,  "setObject:forKey:",  objc_msgSend(objc_msgSend(v30, "infoDictionary"), "objectForKey:", @"CFBundleVersion"),  @"version");
                          [v37 setObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@/Contents/Resources", v28), @"resourceFolderPath" forKey];
                          [v37 setObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v28, @"Icon.tiff"), @"thumbnail" forKey];
                          [v37 setObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v28, objc_msgSend(v37, "objectForKey:", @"patchName")), @"patchPath" forKey];
                          -[NSMutableDictionary setObject:forKey:](v45->mFrames, "setObject:forKey:", v37, v31);
                          id v22 = v44;
                        }
                      }
                    }

                    uint64_t v24 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
                  }
                }
              }

              id v25 = -[NSArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v47,  v60,  16LL);
            }

            while (v25);
          }

          id v4 = v45;
          -[NSMutableDictionary addEntriesFromDictionary:]( v45->mCategories,  "addEntriesFromDictionary:",  +[NSDictionary dictionaryWithContentsOfFile:]( NSDictionary,  "dictionaryWithContentsOfFile:",  [v10 stringByAppendingPathComponent:@"LocalizedFrameCategories.plist"]));
          uint64_t v9 = v43 + 1;
          id v5 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
        }

        while ((id)(v43 + 1) != v42);
        id v42 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
      }

      while (v42);
    }
  }

  return v4;
}

@end