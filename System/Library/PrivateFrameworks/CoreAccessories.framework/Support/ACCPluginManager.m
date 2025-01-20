@interface ACCPluginManager
- (ACCPluginManager)init;
- (BOOL)allowDuplicateClassTypes;
- (NSMutableSet)pluginBundleSearchPathsMutable;
- (NSMutableSet)pluginBundlesMutable;
- (NSMutableSet)pluginInstancesMutable;
- (NSSet)pluginBundleSearchPaths;
- (NSSet)pluginBundles;
- (NSSet)pluginInstances;
- (id)initClass:(Class)a3;
- (id)pluginInstancesWithClasses:(id)a3;
- (id)pluginInstancesWithProtocols:(id)a3 matchAny:(BOOL)a4;
- (unint64_t)addBundleSearchPath:(id)a3 recursive:(BOOL)a4;
- (unint64_t)addBundleSearchPathsForDirectory:(unint64_t)a3 inDomain:(unint64_t)a4 subpath:(id)a5 recursive:(BOOL)a6;
- (unint64_t)initAllPlugIns;
- (unint64_t)initPlugInsWithBundleNames:(id)a3;
- (unint64_t)initPlugInsWithBundleNames:(id)a3 orClasses:(id)a4 orProtocols:(id)a5 matchAny:(BOOL)a6;
- (unint64_t)initPlugInsWithClasses:(id)a3;
- (unint64_t)initPlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4;
- (unint64_t)loadAllBundles;
- (unint64_t)loadBundlesWithClasses:(id)a3;
- (unint64_t)loadBundlesWithClasses:(id)a3 orProtocols:(id)a4 matchAny:(BOOL)a5;
- (unint64_t)loadBundlesWithExtension:(id)a3;
- (unint64_t)loadBundlesWithExtension:(id)a3 andClasses:(id)a4;
- (unint64_t)loadBundlesWithExtension:(id)a3 andClasses:(id)a4 orProtocols:(id)a5 matchAny:(BOOL)a6;
- (unint64_t)loadBundlesWithExtension:(id)a3 andNames:(id)a4;
- (unint64_t)loadBundlesWithExtension:(id)a3 andProtocols:(id)a4 matchAny:(BOOL)a5;
- (unint64_t)loadBundlesWithIdentifiers:(id)a3;
- (unint64_t)loadBundlesWithNames:(id)a3;
- (unint64_t)loadBundlesWithPaths:(id)a3;
- (unint64_t)loadBundlesWithPaths:(id)a3 andIdentifiers:(id)a4 orClasses:(id)a5 orProtocols:(id)a6 matchAny:(BOOL)a7;
- (unint64_t)loadBundlesWithProtocols:(id)a3 matchAny:(BOOL)a4;
- (unint64_t)removeAllBundleSearchPaths;
- (unint64_t)removeAllBundles;
- (unint64_t)removeAllPlugIns;
- (unint64_t)removeBundleSearchPath:(id)a3;
- (unint64_t)removePlugIns:(id)a3;
- (unint64_t)removePlugInsWithClasses:(id)a3;
- (unint64_t)removePlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4;
- (unint64_t)startAllPlugIns;
- (unint64_t)startPlugIns:(id)a3;
- (unint64_t)startPlugInsWithClasses:(id)a3;
- (unint64_t)startPlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4;
- (unint64_t)stopAllPlugIns;
- (unint64_t)stopPlugIns:(id)a3;
- (unint64_t)stopPlugInsWithClasses:(id)a3;
- (unint64_t)stopPlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4;
- (void)setAllowDuplicateClassTypes:(BOOL)a3;
- (void)setPluginBundleSearchPathsMutable:(id)a3;
- (void)setPluginBundlesMutable:(id)a3;
- (void)setPluginInstancesMutable:(id)a3;
@end

@implementation ACCPluginManager

- (ACCPluginManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ACCPluginManager;
  v2 = -[ACCPluginManager init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    pluginBundleSearchPathsMutable = v2->_pluginBundleSearchPathsMutable;
    v2->_pluginBundleSearchPathsMutable = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    pluginBundlesMutable = v2->_pluginBundlesMutable;
    v2->_pluginBundlesMutable = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    pluginInstancesMutable = v2->_pluginInstancesMutable;
    v2->_pluginInstancesMutable = v7;

    v2->_allowDuplicateClassTypes = 0;
  }

  return v2;
}

- (unint64_t)addBundleSearchPath:(id)a3 recursive:(BOOL)a4
{
  if (!a3) {
    return 0LL;
  }
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PathEntry entryWithPath:recursive:](&OBJC_CLASS___PathEntry, "entryWithPath:recursive:", v6, v4));

  [v7 addObject:v8];
  return 1LL;
}

- (unint64_t)addBundleSearchPathsForDirectory:(unint64_t)a3 inDomain:(unint64_t)a4 subpath:(id)a5 recursive:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  v11 = NSSearchPathForDirectoriesInDomains((NSSearchPathDirectory)a3, a4, 1);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(v11);
  id v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    unint64_t v14 = 0LL;
    uint64_t v15 = *(void *)v25;
    do
    {
      unint64_t v22 = v14;
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable", v22));
        v19 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingPathComponent:v10]);
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[PathEntry entryWithPath:recursive:]( &OBJC_CLASS___PathEntry,  "entryWithPath:recursive:",  v19,  v6));
        [v18 addObject:v20];
      }

      unint64_t v14 = (unint64_t)v13 + v22;
      id v13 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v13);
  }

  else
  {
    unint64_t v14 = 0LL;
  }

  return v14;
}

- (unint64_t)removeBundleSearchPath:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPaths](self, "pluginBundleSearchPaths", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
        unsigned int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
          [v14 removeObject:v11];

          ++v8;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  return v8;
}

- (unint64_t)removeAllBundleSearchPaths
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
  id v4 = [v3 count];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
  [v5 removeAllObjects];

  return (unint64_t)v4;
}

- (unint64_t)loadAllBundles
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PathEntry bundlePathsWithinEntries:](&OBJC_CLASS___PathEntry, "bundlePathsWithinEntries:", v3));
  unint64_t v5 = -[ACCPluginManager loadBundlesWithPaths:](self, "loadBundlesWithPaths:", v4);

  return v5;
}

- (unint64_t)loadBundlesWithExtension:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PathEntry bundlePathsWithinEntries:withExtension:]( &OBJC_CLASS___PathEntry,  "bundlePathsWithinEntries:withExtension:",  v5,  v4));

  unint64_t v7 = -[ACCPluginManager loadBundlesWithPaths:](self, "loadBundlesWithPaths:", v6);
  return v7;
}

- (unint64_t)loadBundlesWithExtension:(id)a3 andNames:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[PathEntry bundlePathsWithinEntries:withExtension:andNames:]( &OBJC_CLASS___PathEntry,  "bundlePathsWithinEntries:withExtension:andNames:",  v8,  v7,  v6));

  unint64_t v10 = -[ACCPluginManager loadBundlesWithPaths:](self, "loadBundlesWithPaths:", v9);
  return v10;
}

- (unint64_t)loadBundlesWithExtension:(id)a3 andClasses:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[PathEntry bundlePathsWithinEntries:withExtension:]( &OBJC_CLASS___PathEntry,  "bundlePathsWithinEntries:withExtension:",  v8,  v7));

  unint64_t v10 = -[ACCPluginManager loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:]( self,  "loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:",  v9,  0LL,  v6,  0LL,  1LL);
  return v10;
}

- (unint64_t)loadBundlesWithExtension:(id)a3 andProtocols:(id)a4 matchAny:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[PathEntry bundlePathsWithinEntries:withExtension:]( &OBJC_CLASS___PathEntry,  "bundlePathsWithinEntries:withExtension:",  v10,  v9));

  unint64_t v12 = -[ACCPluginManager loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:]( self,  "loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:",  v11,  0LL,  0LL,  v8,  v5);
  return v12;
}

- (unint64_t)loadBundlesWithExtension:(id)a3 andClasses:(id)a4 orProtocols:(id)a5 matchAny:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[PathEntry bundlePathsWithinEntries:withExtension:]( &OBJC_CLASS___PathEntry,  "bundlePathsWithinEntries:withExtension:",  v13,  v12));

  unint64_t v15 = -[ACCPluginManager loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:]( self,  "loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:",  v14,  0LL,  v11,  v10,  v6);
  return v15;
}

- (unint64_t)loadBundlesWithNames:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[PathEntry bundlePathsWithinEntries:withExtension:andNames:]( &OBJC_CLASS___PathEntry,  "bundlePathsWithinEntries:withExtension:andNames:",  v5,  0LL,  v4));

  unint64_t v7 = -[ACCPluginManager loadBundlesWithPaths:](self, "loadBundlesWithPaths:", v6);
  return v7;
}

- (unint64_t)loadBundlesWithIdentifiers:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[PathEntry bundlePathsWithinEntries:](&OBJC_CLASS___PathEntry, "bundlePathsWithinEntries:", v5));
  unint64_t v7 = -[ACCPluginManager loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:]( self,  "loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:",  v6,  v4,  0LL,  0LL,  1LL);

  return v7;
}

- (unint64_t)loadBundlesWithClasses:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[PathEntry bundlePathsWithinEntries:](&OBJC_CLASS___PathEntry, "bundlePathsWithinEntries:", v5));
  unint64_t v7 = -[ACCPluginManager loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:]( self,  "loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:",  v6,  0LL,  v4,  0LL,  1LL);

  return v7;
}

- (unint64_t)loadBundlesWithProtocols:(id)a3 matchAny:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PathEntry bundlePathsWithinEntries:](&OBJC_CLASS___PathEntry, "bundlePathsWithinEntries:", v7));
  unint64_t v9 = -[ACCPluginManager loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:]( self,  "loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:",  v8,  0LL,  0LL,  v6,  v4);

  return v9;
}

- (unint64_t)loadBundlesWithClasses:(id)a3 orProtocols:(id)a4 matchAny:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PathEntry bundlePathsWithinEntries:](&OBJC_CLASS___PathEntry, "bundlePathsWithinEntries:", v10));
  unint64_t v12 = -[ACCPluginManager loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:]( self,  "loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:",  v11,  0LL,  v9,  v8,  v5);

  return v12;
}

- (unint64_t)loadBundlesWithPaths:(id)a3
{
  return -[ACCPluginManager loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:]( self,  "loadBundlesWithPaths:andIdentifiers:orClasses:orProtocols:matchAny:",  a3,  0LL,  0LL,  0LL,  1LL);
}

- (unint64_t)loadBundlesWithPaths:(id)a3 andIdentifiers:(id)a4 orClasses:(id)a5 orProtocols:(id)a6 matchAny:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v56 = a6;
  v52 = self;
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundlesMutable](self, "pluginBundlesMutable"));
  __int128 v16 = [v15 count];

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id obj = v12;
  id v55 = [obj countByEnumeratingWithState:&v66 objects:v80 count:16];
  if (v55)
  {
    __int128 v18 = 0LL;
    uint64_t v54 = *(void *)v67;
    v49 = v16;
    __int128 v19 = @"MediaLibraryUID";
    *(void *)&__int128 v17 = 138412802LL;
    __int128 v48 = v17;
    id v50 = v13;
    id v51 = v14;
    while (1)
    {
      v20 = 0LL;
      do
      {
        v21 = v18;
        if (*(void *)v67 != v54) {
          objc_enumerationMutation(obj);
        }
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  *(void *)(*((void *)&v66 + 1) + 8LL * (void)v20),  v48));

        if (v18)
        {
          [v18 load];
          if ([v18 isLoaded])
          {
            unint64_t v22 = (objc_class *)[v18 principalClass];
            info = (void *)v19[49].info;
            id v65 = 0LL;
            char v24 = classImplementsMethodsInProtocol(v22, info, 1, 1, &v65);
            id v25 = v65;
            if ((v24 & 1) != 0)
            {
              if (!v13
                || ![v13 count]
                || (__int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleIdentifier]),
                    unsigned int v27 = [v13 containsObject:v26],
                    v26,
                    v27))
              {
                if (v14 && [v14 count])
                {
                  __int128 v63 = 0u;
                  __int128 v64 = 0u;
                  __int128 v61 = 0u;
                  __int128 v62 = 0u;
                  id v28 = v14;
                  id v29 = [v28 countByEnumeratingWithState:&v61 objects:v71 count:16];
                  if (v29)
                  {
                    id v30 = v29;
                    uint64_t v31 = *(void *)v62;
                    while (2)
                    {
                      for (i = 0LL; i != v30; i = (char *)i + 1)
                      {
                        if (*(void *)v62 != v31) {
                          objc_enumerationMutation(v28);
                        }
                        Class v33 = NSClassFromString(*(NSString **)(*((void *)&v61 + 1) + 8LL * (void)i));
                        if (v33 && -[objc_class isSubclassOfClass:](v22, "isSubclassOfClass:", v33))
                        {

                          id v14 = v51;
                          goto LABEL_26;
                        }
                      }

                      id v30 = [v28 countByEnumeratingWithState:&v61 objects:v71 count:16];
                      if (v30) {
                        continue;
                      }
                      break;
                    }

                    id v14 = v51;
                    goto LABEL_46;
                  }

- (unint64_t)removeAllBundles
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundlesMutable](self, "pluginBundlesMutable"));
  id v4 = [v3 count];

  if (!v4) {
    return 0LL;
  }
  -[ACCPluginManager removeAllPlugIns](self, "removeAllPlugIns");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundlesMutable](self, "pluginBundlesMutable"));
  id v6 = [v5 count];

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundlesMutable](self, "pluginBundlesMutable"));
  [v7 removeAllObjects];

  return (unint64_t)v6;
}

- (unint64_t)initAllPlugIns
{
  return -[ACCPluginManager initPlugInsWithBundleNames:orClasses:orProtocols:matchAny:]( self,  "initPlugInsWithBundleNames:orClasses:orProtocols:matchAny:",  0LL,  0LL,  0LL,  1LL);
}

- (unint64_t)initPlugInsWithClasses:(id)a3
{
  return -[ACCPluginManager initPlugInsWithBundleNames:orClasses:orProtocols:matchAny:]( self,  "initPlugInsWithBundleNames:orClasses:orProtocols:matchAny:",  0LL,  a3,  0LL,  1LL);
}

- (unint64_t)initPlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4
{
  return -[ACCPluginManager initPlugInsWithBundleNames:orClasses:orProtocols:matchAny:]( self,  "initPlugInsWithBundleNames:orClasses:orProtocols:matchAny:",  0LL,  0LL,  a3,  a4);
}

- (unint64_t)initPlugInsWithBundleNames:(id)a3
{
  return -[ACCPluginManager initPlugInsWithBundleNames:orClasses:orProtocols:matchAny:]( self,  "initPlugInsWithBundleNames:orClasses:orProtocols:matchAny:",  a3,  0LL,  0LL,  1LL);
}

- (unint64_t)initPlugInsWithBundleNames:(id)a3 orClasses:(id)a4 orProtocols:(id)a5 matchAny:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundlesMutable](self, "pluginBundlesMutable"));

  if (v13)
  {
    BOOL v58 = (!v10 || ![v10 count])
       && (!v11 || ![v11 count])
       && (!v12 || ![v12 count]);
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundlesMutable](self, "pluginBundlesMutable"));
    id v59 = [obj countByEnumeratingWithState:&v77 objects:v84 count:16];
    if (!v59)
    {
      __int128 v61 = 0LL;
      unint64_t v54 = 0LL;
      goto LABEL_78;
    }

    __int128 v61 = 0LL;
    unint64_t v54 = 0LL;
    uint64_t v55 = *(void *)v78;
    id v53 = v11;
    __int128 v60 = self;
    id v51 = v10;
    __int128 v57 = v12;
    BOOL v56 = v6;
    while (1)
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v78 != v55) {
          objc_enumerationMutation(obj);
        }
        __int128 v16 = *(void **)(*((void *)&v77 + 1) + 8 * v15);
        uint64_t v62 = v15;
        id v63 = objc_msgSend(v16, "principalClass", v51);
        if (v10 && [v10 count])
        {
          __int128 v75 = 0u;
          __int128 v76 = 0u;
          __int128 v73 = 0u;
          __int128 v74 = 0u;
          id v17 = v10;
          id v18 = [v17 countByEnumeratingWithState:&v73 objects:v83 count:16];
          if (v18)
          {
            id v19 = v18;
            char v20 = 0;
            uint64_t v21 = *(void *)v74;
            do
            {
              for (i = 0LL; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v74 != v21) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v23 = *(void *)(*((void *)&v73 + 1) + 8LL * (void)i);
                char v24 = (void *)objc_claimAutoreleasedReturnValue([v16 bundlePath]);
                id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 lastPathComponent]);
                __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 stringByDeletingPathExtension]);
                LODWORD(v23) = [v26 isEqualToString:v23];

                if ((_DWORD)v23) {
                  char v20 = 1;
                }
              }

              id v19 = [v17 countByEnumeratingWithState:&v73 objects:v83 count:16];
            }

            while (v19);
          }

          else
          {
            char v20 = 0;
          }

          int v27 = v20 & 1;
          id v10 = v51;
          id v11 = v53;
          self = v60;
          if (!v53)
          {
LABEL_44:
            int v35 = 0;
            goto LABEL_47;
          }
        }

        else
        {
          int v27 = 0;
          if (!v11) {
            goto LABEL_44;
          }
        }

        if (![v11 count]) {
          goto LABEL_44;
        }
        __int128 v71 = 0u;
        __int128 v72 = 0u;
        __int128 v69 = 0u;
        __int128 v70 = 0u;
        id v28 = v11;
        id v29 = [v28 countByEnumeratingWithState:&v69 objects:v82 count:16];
        if (v29)
        {
          id v30 = v29;
          char v31 = 0;
          uint64_t v32 = *(void *)v70;
          do
          {
            for (j = 0LL; j != v30; j = (char *)j + 1)
            {
              if (*(void *)v70 != v32) {
                objc_enumerationMutation(v28);
              }
              Class v34 = NSClassFromString(*(NSString **)(*((void *)&v69 + 1) + 8LL * (void)j));
            }

            id v30 = [v28 countByEnumeratingWithState:&v69 objects:v82 count:16];
          }

          while (v30);
        }

        else
        {
          char v31 = 0;
        }

        int v35 = v31 & 1;
        self = v60;
LABEL_47:
        id v12 = v57;
        if (v57 && [v57 count])
        {
          __int128 v67 = 0u;
          __int128 v68 = 0u;
          __int128 v65 = 0u;
          __int128 v66 = 0u;
          id v36 = v57;
          id v37 = [v36 countByEnumeratingWithState:&v65 objects:v81 count:16];
          if (v37)
          {
            id v38 = v37;
            uint64_t v39 = 0LL;
            uint64_t v40 = *(void *)v66;
LABEL_51:
            uint64_t v41 = 0LL;
            while (1)
            {
              if (*(void *)v66 != v40) {
                objc_enumerationMutation(v36);
              }
              if ([v63 conformsToProtocol:*(void *)(*((void *)&v65 + 1) + 8 * v41)])
              {
                ++v39;
                if (v56) {
                  break;
                }
              }

              if (v38 == (id)++v41)
              {
                id v38 = [v36 countByEnumeratingWithState:&v65 objects:v81 count:16];
                if (v38) {
                  goto LABEL_51;
                }
                break;
              }
            }
          }

          else
          {
            uint64_t v39 = 0LL;
          }

          v43 = (char *)[v36 count];
          if (v39) {
            int v42 = v56;
          }
          else {
            int v42 = 0;
          }
          if (v39 == v43) {
            int v42 = 1;
          }
          id v11 = v53;
          self = v60;
        }

        else
        {
          int v42 = 0;
        }

        if (((v58 | v27 | v35) & 1) != 0 || v42)
        {
          if (-[ACCPluginManager allowDuplicateClassTypes](self, "allowDuplicateClassTypes")) {
            goto LABEL_71;
          }
          id v44 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginInstancesMutable](self, "pluginInstancesMutable"));
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472LL;
          v64[2] = __78__ACCPluginManager_initPlugInsWithBundleNames_orClasses_orProtocols_matchAny___block_invoke;
          v64[3] = &__block_descriptor_40_e33_B24__0___ACCPluginProtocol__8_B16lu32l8;
          v64[4] = v63;
          v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectsPassingTest:v64]);
          id v46 = [v45 count];

          if (!v46)
          {
LABEL_71:
            v47 = self;
            id v48 = -[ACCPluginManager initClass:](v47, "initClass:", v63);

            if (v48)
            {
              [v48 initPlugin];
              v49 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginInstancesMutable](v47, "pluginInstancesMutable"));
              [v49 addObject:v48];

              ++v54;
              __int128 v61 = v48;
            }

            else
            {
              __int128 v61 = 0LL;
            }
          }
        }

        uint64_t v15 = v62 + 1;
      }

      while ((id)(v62 + 1) != v59);
      id v59 = [obj countByEnumeratingWithState:&v77 objects:v84 count:16];
      if (!v59)
      {
LABEL_78:

        unint64_t v14 = v54;
        goto LABEL_79;
      }
    }
  }

  unint64_t v14 = 0LL;
LABEL_79:

  return v14;
}

uint64_t __78__ACCPluginManager_initPlugInsWithBundleNames_orClasses_orProtocols_matchAny___block_invoke( uint64_t a1,  uint64_t a2,  _BYTE *a3)
{
  char isKindOfClass = objc_opt_isKindOfClass(a2, *(void *)(a1 + 32));
  if ((isKindOfClass & 1) != 0) {
    *a3 = 1;
  }
  return isKindOfClass & 1;
}

- (unint64_t)startAllPlugIns
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginInstancesMutable](self, "pluginInstancesMutable"));
  unint64_t v4 = -[ACCPluginManager startPlugIns:](self, "startPlugIns:", v3);

  return v4;
}

- (unint64_t)startPlugInsWithClasses:(id)a3
{
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginInstancesWithClasses:](self, "pluginInstancesWithClasses:", a3));
  unint64_t v5 = -[ACCPluginManager startPlugIns:](self, "startPlugIns:", v4);

  return v5;
}

- (unint64_t)startPlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[ACCPluginManager pluginInstancesWithProtocols:matchAny:]( self,  "pluginInstancesWithProtocols:matchAny:",  a3,  a4));
  unint64_t v6 = -[ACCPluginManager startPlugIns:](self, "startPlugIns:", v5);

  return v6;
}

- (unint64_t)startPlugIns:(id)a3
{
  id v3 = a3;
  unint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      unint64_t v8 = 0LL;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          if ((objc_msgSend(v11, "isRunning", (void)v13) & 1) == 0)
          {
            [v11 startPlugin];
            v8 += [v11 isRunning];
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v7);
    }

    else
    {
      unint64_t v8 = 0LL;
    }
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  return v8;
}

- (unint64_t)stopAllPlugIns
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginInstancesMutable](self, "pluginInstancesMutable"));
  unint64_t v4 = -[ACCPluginManager stopPlugIns:](self, "stopPlugIns:", v3);

  return v4;
}

- (unint64_t)stopPlugInsWithClasses:(id)a3
{
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginInstancesWithClasses:](self, "pluginInstancesWithClasses:", a3));
  unint64_t v5 = -[ACCPluginManager stopPlugIns:](self, "stopPlugIns:", v4);

  return v5;
}

- (unint64_t)stopPlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[ACCPluginManager pluginInstancesWithProtocols:matchAny:]( self,  "pluginInstancesWithProtocols:matchAny:",  a3,  a4));
  unint64_t v6 = -[ACCPluginManager stopPlugIns:](self, "stopPlugIns:", v5);

  return v6;
}

- (unint64_t)stopPlugIns:(id)a3
{
  id v3 = a3;
  unint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      unint64_t v8 = 0LL;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          if (objc_msgSend(v11, "isRunning", (void)v13))
          {
            [v11 stopPlugin];
            v8 += [v11 isRunning] ^ 1;
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v7);
    }

    else
    {
      unint64_t v8 = 0LL;
    }
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  return v8;
}

- (unint64_t)removeAllPlugIns
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginInstancesMutable](self, "pluginInstancesMutable"));
  unint64_t v4 = -[ACCPluginManager removePlugIns:](self, "removePlugIns:", v3);

  return v4;
}

- (unint64_t)removePlugInsWithClasses:(id)a3
{
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginInstancesWithClasses:](self, "pluginInstancesWithClasses:", a3));
  unint64_t v5 = -[ACCPluginManager removePlugIns:](self, "removePlugIns:", v4);

  return v5;
}

- (unint64_t)removePlugInsWithProtocols:(id)a3 matchAny:(BOOL)a4
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[ACCPluginManager pluginInstancesWithProtocols:matchAny:]( self,  "pluginInstancesWithProtocols:matchAny:",  a3,  a4));
  unint64_t v6 = -[ACCPluginManager removePlugIns:](self, "removePlugIns:", v5);

  return v6;
}

- (unint64_t)removePlugIns:(id)a3
{
  id v4 = a3;
  -[ACCPluginManager stopPlugIns:](self, "stopPlugIns:", v4);
  id v5 = [v4 count];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginInstancesMutable](self, "pluginInstancesMutable"));
  [v6 minusSet:v4];

  return (unint64_t)v5;
}

- (id)pluginInstancesWithClasses:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginInstancesMutable](self, "pluginInstancesMutable"));
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    __int128 v13 = __47__ACCPluginManager_pluginInstancesWithClasses___block_invoke;
    __int128 v14 = &unk_1001FE080;
    id v15 = v5;
    id v16 = v6;
    id v8 = v6;
    [v7 enumerateObjectsUsingBlock:&v11];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v8, v11, v12, v13, v14));
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginInstances](self, "pluginInstances"));
  }

  return v9;
}

void __47__ACCPluginManager_pluginInstancesWithClasses___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v8 = v3;
  id v5 = (objc_class *)objc_opt_class(v3);
  unint64_t v6 = NSStringFromClass(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  LODWORD(v4) = [v4 containsObject:v7];

  if ((_DWORD)v4) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (id)pluginInstancesWithProtocols:(id)a3 matchAny:(BOOL)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginInstancesMutable](self, "pluginInstancesMutable"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = __58__ACCPluginManager_pluginInstancesWithProtocols_matchAny___block_invoke;
    v13[3] = &unk_1001FE0A8;
    BOOL v16 = a4;
    id v14 = v7;
    id v15 = v8;
    id v10 = v8;
    [v9 enumerateObjectsUsingBlock:v13];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v10));
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginInstances](self, "pluginInstances"));
  }

  return v11;
}

void __58__ACCPluginManager_pluginInstancesWithProtocols_matchAny___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v4);
      }
      if (objc_msgSend( v3,  "conformsToProtocol:",  *(void *)(*((void *)&v10 + 1) + 8 * v9),  (void)v10))
      {
        ++v7;
        if (*(_BYTE *)(a1 + 48)) {
          break;
        }
      }

      if (v6 == (id)++v9)
      {
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  else
  {
    id v7 = 0LL;
  }

  if (v7 == [*(id *)(a1 + 32) count] || *(_BYTE *)(a1 + 48) && v7) {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3, (void)v10);
  }
}

- (id)initClass:(Class)a3
{
  id v4 = objc_alloc_init(a3);

  return v4;
}

- (NSSet)pluginBundleSearchPaths
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundleSearchPathsMutable](self, "pluginBundleSearchPathsMutable"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v2));

  return (NSSet *)v3;
}

- (NSSet)pluginBundles
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginBundlesMutable](self, "pluginBundlesMutable"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v2));

  return (NSSet *)v3;
}

- (NSSet)pluginInstances
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPluginManager pluginInstancesMutable](self, "pluginInstancesMutable"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v2));

  return (NSSet *)v3;
}

- (BOOL)allowDuplicateClassTypes
{
  return self->_allowDuplicateClassTypes;
}

- (void)setAllowDuplicateClassTypes:(BOOL)a3
{
  self->_allowDuplicateClassTypes = a3;
}

- (NSMutableSet)pluginBundleSearchPathsMutable
{
  return self->_pluginBundleSearchPathsMutable;
}

- (void)setPluginBundleSearchPathsMutable:(id)a3
{
}

- (NSMutableSet)pluginBundlesMutable
{
  return self->_pluginBundlesMutable;
}

- (void)setPluginBundlesMutable:(id)a3
{
}

- (NSMutableSet)pluginInstancesMutable
{
  return self->_pluginInstancesMutable;
}

- (void)setPluginInstancesMutable:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)loadBundlesWithPaths:(void *)a3 andIdentifiers:orClasses:orProtocols:matchAny:.cold.1( uint8_t *a1,  void *a2,  void *a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a2 bundlePath]);
  *(_DWORD *)a1 = 138412290;
  *a3 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error loading bundle: %@",  a1,  0xCu);
}

@end