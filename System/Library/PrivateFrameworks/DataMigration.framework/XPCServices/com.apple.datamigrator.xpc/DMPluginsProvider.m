@interface DMPluginsProvider
- (DMPluginsProvider)initWithReps:(id)a3 categories:(unsigned int)a4 pluginAllowedList:(id)a5;
- (NSArray)allPluginsInRunOrder;
- (NSArray)serialPluginsInRunOrder;
- (NSSet)allPlugins;
- (NSSet)concurrentPlugins;
@end

@implementation DMPluginsProvider

- (DMPluginsProvider)initWithReps:(id)a3 categories:(unsigned int)a4 pluginAllowedList:(id)a5
{
  char v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v112.receiver = self;
  v112.super_class = (Class)&OBJC_CLASS___DMPluginsProvider;
  v10 = -[DMPluginsProvider init](&v112, "init");
  if (v10)
  {
    id obj = (id)objc_claimAutoreleasedReturnValue([v9 orderedUserAgnosticPluginSpecifiers]);
    v84 = (void *)objc_claimAutoreleasedReturnValue([v9 orderedUserSpecificPluginSpecifiers]);
    id v79 = (id)objc_claimAutoreleasedReturnValue([v9 concurrentUserSpecificPluginSpecifiers]);
    if ((v6 & 1) != 0) {
      _DMLogFunc(v86, 6LL);
    }
    v76 = v10;
    id v77 = v9;
    if ((v6 & 2) != 0) {
      _DMLogFunc(v86, 6LL);
    }
    v87 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v8 count]);
    __int128 v108 = 0u;
    __int128 v109 = 0u;
    __int128 v110 = 0u;
    __int128 v111 = 0u;
    id v78 = v8;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v108 objects:v118 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v109;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v109 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v108 + 1) + 8LL * (void)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name", v74));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
          unsigned int v19 = [v18 hasSuffix:@".migrator"];

          if (v19)
          {
            if ([v16 isBundleValid])
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);

              if (v20)
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);
                -[NSMutableDictionary setObject:forKey:](v87, "setObject:forKey:", v16, v21);
                goto LABEL_19;
              }
            }

            v17 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
            v74 = v17;
            _DMLogFunc(v86, 3LL);
LABEL_17:
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name", v74));
          v74 = v21;
          _DMLogFunc(v86, 7LL);
LABEL_19:
        }

        id v13 = [v11 countByEnumeratingWithState:&v108 objects:v118 count:16];
      }

      while (v13);
    }

    v22 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  (char *)[obj count] + (void)objc_msgSend(v84, "count"));
    __int128 v104 = 0u;
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    __int128 v107 = 0u;
    id obja = obj;
    id v23 = [obja countByEnumeratingWithState:&v104 objects:v117 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v105;
      do
      {
        for (j = 0LL; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v105 != v25) {
            objc_enumerationMutation(obja);
          }
          v27 = *(void **)(*((void *)&v104 + 1) + 8LL * (void)j);
          if ((v6 & 1) != 0)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v104 + 1) + 8 * (void)j), "dmps_identifier"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v87, "objectForKeyedSubscript:", v29));
          }

          else
          {
            v28 = 0LL;
          }

          v30 = objc_alloc(&OBJC_CLASS___DataMigrationPlugin);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dmps_identifier"));
          v32 = -[DataMigrationPlugin initWithIdentifier:fileSystemRep:isUserAgnostic:]( v30,  "initWithIdentifier:fileSystemRep:isUserAgnostic:",  v31,  v28,  1LL);

          objc_msgSend(v27, "dmps_estimate");
          -[DataMigrationPlugin setTimeEstimate:](v32, "setTimeEstimate:");
          objc_msgSend(v27, "dmps_timeIntervalBeforeWatchdog");
          -[DataMigrationPlugin setTimeIntervalBeforeWatchdog:](v32, "setTimeIntervalBeforeWatchdog:");
          objc_msgSend(v27, "dmps_timeIntervalBeforeReboot");
          -[DataMigrationPlugin setTimeIntervalBeforeReboot:](v32, "setTimeIntervalBeforeReboot:");
          -[NSMutableArray addObject:](v22, "addObject:", v32);
        }

        id v24 = [obja countByEnumeratingWithState:&v104 objects:v117 count:16];
      }

      while (v24);
    }

    __int128 v102 = 0u;
    __int128 v103 = 0u;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    id v81 = v84;
    id v33 = [v81 countByEnumeratingWithState:&v100 objects:v116 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v101;
      do
      {
        for (k = 0LL; k != v34; k = (char *)k + 1)
        {
          if (*(void *)v101 != v35) {
            objc_enumerationMutation(v81);
          }
          v37 = *(void **)(*((void *)&v100 + 1) + 8LL * (void)k);
          if ((v6 & 2) != 0
            || (objc_msgSend( *(id *)(*((void *)&v100 + 1) + 8 * (void)k),  "dmps_excludedFromFirstLogin") & 1) == 0)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "dmps_identifier", v74));
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v87, "objectForKeyedSubscript:", v39));
          }

          else
          {
            v38 = 0LL;
          }

          v40 = objc_alloc(&OBJC_CLASS___DataMigrationPlugin);
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "dmps_identifier"));
          v42 = -[DataMigrationPlugin initWithIdentifier:fileSystemRep:isUserAgnostic:]( v40,  "initWithIdentifier:fileSystemRep:isUserAgnostic:",  v41,  v38,  0LL);

          objc_msgSend(v37, "dmps_estimate");
          -[DataMigrationPlugin setTimeEstimate:](v42, "setTimeEstimate:");
          objc_msgSend(v37, "dmps_timeIntervalBeforeWatchdog");
          -[DataMigrationPlugin setTimeIntervalBeforeWatchdog:](v42, "setTimeIntervalBeforeWatchdog:");
          objc_msgSend(v37, "dmps_timeIntervalBeforeReboot");
          -[DataMigrationPlugin setTimeIntervalBeforeReboot:](v42, "setTimeIntervalBeforeReboot:");
          -[NSMutableArray addObject:](v22, "addObject:", v42);
        }

        id v34 = [v81 countByEnumeratingWithState:&v100 objects:v116 count:16];
      }

      while (v34);
    }

    v85 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v79 count]);
    __int128 v96 = 0u;
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    id v80 = v79;
    id v43 = [v80 countByEnumeratingWithState:&v96 objects:v115 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v97;
      do
      {
        for (m = 0LL; m != v44; m = (char *)m + 1)
        {
          if (*(void *)v97 != v45) {
            objc_enumerationMutation(v80);
          }
          v47 = *(void **)(*((void *)&v96 + 1) + 8LL * (void)m);
          if ((v6 & 2) != 0
            || (objc_msgSend( *(id *)(*((void *)&v96 + 1) + 8 * (void)m),  "dmps_excludedFromFirstLogin") & 1) == 0)
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "dmps_identifier", v74));
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v87, "objectForKeyedSubscript:", v49));
          }

          else
          {
            v48 = 0LL;
          }

          v50 = objc_alloc(&OBJC_CLASS___DataMigrationPlugin);
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "dmps_identifier"));
          v52 = -[DataMigrationPlugin initWithIdentifier:fileSystemRep:isUserAgnostic:]( v50,  "initWithIdentifier:fileSystemRep:isUserAgnostic:",  v51,  v48,  0LL);

          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "dmps_concurrentPluginDependencyIdentifier"));
          -[DataMigrationPlugin setIdentifierOfDependency:](v52, "setIdentifierOfDependency:", v53);

          objc_msgSend(v47, "dmps_estimate");
          -[DataMigrationPlugin setTimeEstimate:](v52, "setTimeEstimate:");
          objc_msgSend(v47, "dmps_timeIntervalBeforeWatchdog");
          -[DataMigrationPlugin setTimeIntervalBeforeWatchdog:](v52, "setTimeIntervalBeforeWatchdog:");
          objc_msgSend(v47, "dmps_timeIntervalBeforeReboot");
          -[DataMigrationPlugin setTimeIntervalBeforeReboot:](v52, "setTimeIntervalBeforeReboot:");
          -[NSMutableSet addObject:](v85, "addObject:", v52);
        }

        id v44 = [v80 countByEnumeratingWithState:&v96 objects:v115 count:16];
      }

      while (v44);
    }

    __int128 v94 = 0u;
    __int128 v95 = 0u;
    __int128 v92 = 0u;
    __int128 v93 = 0u;
    v54 = v22;
    id v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v54,  "countByEnumeratingWithState:objects:count:",  &v92,  v114,  16LL);
    if (v55)
    {
      id v56 = v55;
      uint64_t v57 = 0LL;
      uint64_t v58 = *(void *)v93;
      do
      {
        for (n = 0LL; n != v56; n = (char *)n + 1)
        {
          if (*(void *)v93 != v58) {
            objc_enumerationMutation(v54);
          }
          v60 = *(void **)(*((void *)&v92 + 1) + 8LL * (void)n);
          if (objc_msgSend(v60, "existsAndShouldRun", v74))
          {
            ++v57;
          }

          else
          {
            LODWORD(v61) = 0;
            [v60 setTimeEstimate:v61];
          }
        }

        id v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v54,  "countByEnumeratingWithState:objects:count:",  &v92,  v114,  16LL);
      }

      while (v56);
    }

    else
    {
      uint64_t v57 = 0LL;
    }

    __int128 v90 = 0u;
    __int128 v91 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    v62 = v85;
    id v63 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v62,  "countByEnumeratingWithState:objects:count:",  &v88,  v113,  16LL);
    if (v63)
    {
      id v64 = v63;
      uint64_t v65 = *(void *)v89;
      do
      {
        for (ii = 0LL; ii != v64; ii = (char *)ii + 1)
        {
          if (*(void *)v89 != v65) {
            objc_enumerationMutation(v62);
          }
          v67 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)ii);
          if (objc_msgSend(v67, "existsAndShouldRun", v74))
          {
            ++v57;
          }

          else
          {
            LODWORD(v68) = 0;
            [v67 setTimeEstimate:v68];
          }
        }

        id v64 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v62,  "countByEnumeratingWithState:objects:count:",  &v88,  v113,  16LL);
      }

      while (v64);
    }

    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v57));
    _DMLogFunc(v86, 7LL);

    v69 = (NSArray *)-[NSMutableArray copy](v54, "copy", v75);
    v10 = v76;
    serialPluginsInRunOrder = v76->_serialPluginsInRunOrder;
    v76->_serialPluginsInRunOrder = v69;

    v71 = (NSSet *)-[NSMutableSet copy](v62, "copy");
    concurrentPlugins = v76->_concurrentPlugins;
    v76->_concurrentPlugins = v71;

    id v9 = v77;
    id v8 = v78;
  }

  return v10;
}

- (NSSet)allPlugins
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_allPlugins)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( -[NSSet setByAddingObjectsFromArray:]( v2->_concurrentPlugins,  "setByAddingObjectsFromArray:",  v2->_serialPluginsInRunOrder));
    allPlugins = v2->_allPlugins;
    v2->_allPlugins = (NSSet *)v3;
  }

  objc_sync_exit(v2);

  return v2->_allPlugins;
}

- (NSArray)allPluginsInRunOrder
{
  v2 = self;
  objc_sync_enter(v2);
  v16 = v2;
  if (!v2->_allPluginsInRunOrder)
  {
    v21 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  (char *)-[NSArray count](v2->_serialPluginsInRunOrder, "count")
          + -[NSSet count](v2->_concurrentPlugins, "count"));
    id v3 = -[NSSet mutableCopy](v2->_concurrentPlugins, "mutableCopy");
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id obj = v2->_serialPluginsInRunOrder;
    id v19 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v31,  16LL);
    if (v19)
    {
      uint64_t v18 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(obj);
          }
          v4 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          -[NSMutableArray addObject:](v21, "addObject:", v4, v16);
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          id v5 = [v3 copy];
          id v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v6)
          {
            uint64_t v7 = *(void *)v23;
            do
            {
              for (j = 0LL; j != v6; j = (char *)j + 1)
              {
                if (*(void *)v23 != v7) {
                  objc_enumerationMutation(v5);
                }
                id v9 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)j);
                v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifierOfDependency]);
                id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
                unsigned int v12 = [v10 isEqualToString:v11];

                if (v12)
                {
                  -[NSMutableArray addObject:](v21, "addObject:", v9);
                  [v3 removeObject:v9];
                }
              }

              id v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }

            while (v6);
          }
        }

        id v19 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v31,  16LL);
      }

      while (v19);
    }

    id v13 = (NSArray *)-[NSMutableArray copy](v21, "copy");
    allPluginsInRunOrder = v16->_allPluginsInRunOrder;
    v16->_allPluginsInRunOrder = v13;

    v2 = v16;
  }

  objc_sync_exit(v2);

  return v16->_allPluginsInRunOrder;
}

- (NSArray)serialPluginsInRunOrder
{
  return self->_serialPluginsInRunOrder;
}

- (NSSet)concurrentPlugins
{
  return self->_concurrentPlugins;
}

- (void).cxx_destruct
{
}

@end