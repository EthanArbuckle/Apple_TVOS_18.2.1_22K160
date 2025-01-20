@interface NSManagedObjectModelBundle
- (NSManagedObjectModelBundle)initWithPath:(id)a3;
- (id)_modelForVersionHashes:(id)a3;
- (id)_modelForVersionHashes:(id)a3 inStyle:(unint64_t)a4;
- (id)currentVersion;
- (id)currentVersionURL;
- (id)modelVersions;
- (id)optimizedVersionURL;
- (id)urlForModelVersionWithName:(id)a3;
- (id)versionChecksums;
- (void)dealloc;
@end

@implementation NSManagedObjectModelBundle

- (NSManagedObjectModelBundle)initWithPath:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSManagedObjectModelBundle;
  v4 = -[NSManagedObjectModelBundle init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSBundle *)[objc_alloc(MEMORY[0x1896077F8]) initWithPath:a3];
    v4->_bundle = v5;
    if (v5)
    {
      uint64_t v6 = -[NSBundle pathForResource:ofType:](v5, "pathForResource:ofType:", @"VersionInfo", @"plist");
      if (v6
        || (uint64_t v6 = -[NSBundle pathForResource:ofType:]( v4->_bundle,  "pathForResource:ofType:",  @"Info",  @"plist")) != 0)
      {
        v4->_versionInfoDictionary = (NSDictionary *)(id)[MEMORY[0x189603F68] dictionaryWithContentsOfFile:v6];
      }
    }
  }

  return v4;
}

- (void)dealloc
{
  self->_bundle = 0LL;
  self->_versionInfoDictionary = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSManagedObjectModelBundle;
  -[NSManagedObjectModelBundle dealloc](&v3, sel_dealloc);
}

- (id)currentVersion
{
  if (self) {
    self = (NSManagedObjectModelBundle *)self->_versionInfoDictionary;
  }
  return (id)-[NSManagedObjectModelBundle objectForKey:]( self,  "objectForKey:",  @"NSManagedObjectModel_CurrentVersionName");
}

- (id)modelVersions
{
  if (self) {
    self = -[NSDictionary objectForKey:]( self->_versionInfoDictionary,  "objectForKey:",  @"NSManagedObjectModel_VersionHashes");
  }
  return (id)-[NSManagedObjectModelBundle allKeys](self, "allKeys");
}

- (id)versionChecksums
{
  if (self) {
    self = (NSManagedObjectModelBundle *)self->_versionInfoDictionary;
  }
  return (id)-[NSManagedObjectModelBundle objectForKey:]( self,  "objectForKey:",  @"NSManagedObjectModel_VersionChecksums");
}

- (id)urlForModelVersionWithName:(id)a3
{
  if (self) {
    self = (NSManagedObjectModelBundle *)self->_bundle;
  }
  id result = (id)-[NSManagedObjectModelBundle pathForResource:ofType:](self, "pathForResource:ofType:", a3, @"mom");
  if (result) {
    return (id)[MEMORY[0x189604030] fileURLWithPath:result isDirectory:0];
  }
  return result;
}

- (id)currentVersionURL
{
  return -[NSManagedObjectModelBundle urlForModelVersionWithName:]( self,  "urlForModelVersionWithName:",  -[NSManagedObjectModelBundle currentVersion](self, "currentVersion"));
}

- (id)optimizedVersionURL
{
  if (self) {
    bundle = self->_bundle;
  }
  else {
    bundle = 0LL;
  }
  id result = -[NSBundle pathForResource:ofType:]( bundle,  "pathForResource:ofType:",  -[NSManagedObjectModelBundle currentVersion](self, "currentVersion"),  @"omo");
  if (result) {
    return (id)[MEMORY[0x189604030] fileURLWithPath:result isDirectory:0];
  }
  return result;
}

- (id)_modelForVersionHashes:(id)a3 inStyle:(unint64_t)a4
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  if (a4 != 1) {
    return -[NSManagedObjectModelBundle _modelForVersionHashes:](self, "_modelForVersionHashes:", a3);
  }
  id v6 = objc_alloc_init(MEMORY[0x1896077E8]);
  v56 = (void *)[a3 allKeys];
  v7 = -[NSBundle URLsForResourcesWithExtension:subdirectory:]( self->_bundle,  "URLsForResourcesWithExtension:subdirectory:",  @"mom",  0LL);
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  obuint64_t j = v7;
  uint64_t v61 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v88,  v97,  16LL);
  if (v61)
  {
    id v55 = v6;
    id v65 = 0LL;
    v58 = 0LL;
    uint64_t v59 = *(void *)v89;
    while (2)
    {
      for (uint64_t i = 0LL; i != v61; ++i)
      {
        if (*(void *)v89 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v88 + 1) + 8 * i);
        context = (void *)MEMORY[0x186E3E5D8]();
        v63 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  v9);
        id v10 = -[NSManagedObjectModel _entityVersionHashesByNameInStyle:](v63, 1LL);
        __int128 v84 = 0u;
        __int128 v85 = 0u;
        __int128 v86 = 0u;
        __int128 v87 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v84 objects:v96 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          v13 = 0LL;
          uint64_t v14 = *(void *)v85;
          do
          {
            for (uint64_t j = 0LL; j != v12; ++j)
            {
              if (*(void *)v85 != v14) {
                objc_enumerationMutation(v10);
              }
              uint64_t v16 = *(void *)(*((void *)&v84 + 1) + 8 * j);
              if (objc_msgSend( (id)objc_msgSend(v10, "objectForKey:", v16),  "isEqual:",  objc_msgSend(a3, "objectForKey:", v16)))
              {
                if (!v13) {
                  v13 = (void *)[MEMORY[0x189603FA8] array];
                }
                [v13 addObject:v16];
              }
            }

            uint64_t v12 = [v10 countByEnumeratingWithState:&v84 objects:v96 count:16];
          }

          while (v12);
        }

        else
        {
          v13 = 0LL;
        }

        if ([v13 count])
        {
          unint64_t v17 = [v13 count];
          v18 = v63;
          if (v17 > [v65 count])
          {

            v58 = v63;
            id v65 = v13;
            uint64_t v19 = [v56 count];
            if (v19 == [v13 count])
            {

              objc_autoreleasePoolPop(context);
              goto LABEL_30;
            }
          }

          v20 = context;
        }

        else
        {
          v20 = context;
          v18 = v63;
        }

        objc_autoreleasePoolPop(v20);
      }

      uint64_t v61 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v88,  v97,  16LL);
      if (v61) {
        continue;
      }
      break;
    }

- (id)_modelForVersionHashes:(id)a3
{
  uint64_t v92 = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v59 = (void *)[a3 allKeys];
  if (self) {
    id v6 = -[NSDictionary objectForKey:]( self->_versionInfoDictionary,  "objectForKey:",  @"NSManagedObjectModel_VersionHashes");
  }
  else {
    id v6 = 0LL;
  }
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  uint64_t v55 = [v6 countByEnumeratingWithState:&v82 objects:v91 count:16];
  if (v55)
  {
    uint64_t v49 = self;
    id v50 = v5;
    id v61 = 0LL;
    id v51 = 0LL;
    id v52 = v6;
    uint64_t v53 = *(void *)v83;
    do
    {
      for (uint64_t i = 0LL; i != v55; ++i)
      {
        if (*(void *)v83 != v53) {
          objc_enumerationMutation(v6);
        }
        v57 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        objc_super v8 = (void *)objc_msgSend((id)objc_msgSend(v6, "objectForKey:"), "dictionaryWithValuesForKeys:", v59);
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        __int128 v81 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v78 objects:v90 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = 0LL;
          uint64_t v12 = *(void *)v79;
          do
          {
            for (uint64_t j = 0LL; j != v10; ++j)
            {
              if (*(void *)v79 != v12) {
                objc_enumerationMutation(v8);
              }
              uint64_t v14 = *(void *)(*((void *)&v78 + 1) + 8 * j);
              if (objc_msgSend( (id)objc_msgSend(v8, "objectForKey:", v14),  "isEqual:",  objc_msgSend(a3, "objectForKey:", v14)))
              {
                if (!v11) {
                  uint64_t v11 = (void *)[MEMORY[0x189603FA8] array];
                }
                [v11 addObject:v14];
              }
            }

            uint64_t v10 = [v8 countByEnumeratingWithState:&v78 objects:v90 count:16];
          }

          while (v10);
        }

        else
        {
          uint64_t v11 = 0LL;
        }

        if ([v11 count] && (unint64_t v15 = objc_msgSend(v11, "count"), v15 > objc_msgSend(v61, "count")))
        {

          id v51 = v57;
          id v61 = v11;
          uint64_t v16 = [v59 count];
          id v6 = v52;
          if (v16 == [v11 count]) {
            goto LABEL_28;
          }
        }

        else
        {
          id v6 = v52;
        }
      }

      uint64_t v55 = [v6 countByEnumeratingWithState:&v82 objects:v91 count:16];
    }

    while (v55);
LABEL_28:
    id v17 = 0LL;
    v18 = v51;
    if (v51)
    {
      uint64_t v19 = v61;
      if (v61)
      {
        id v54 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  -[NSManagedObjectModelBundle urlForModelVersionWithName:](v49, "urlForModelVersionWithName:", v51));
        v20 = -[NSManagedObjectModel entitiesByName](v54, "entitiesByName");
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v61, "count"));
        id v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FE0]), "initWithCapacity:", objc_msgSend(v61, "count"));
        __int128 v74 = 0u;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        uint64_t v23 = [v61 countByEnumeratingWithState:&v74 objects:v89 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v75;
          uint64_t v56 = *(void *)v75;
          v58 = v20;
          do
          {
            uint64_t v26 = 0LL;
            uint64_t v60 = v24;
            do
            {
              if (*(void *)v75 != v25) {
                objc_enumerationMutation(v19);
              }
              for (id k = -[NSDictionary objectForKey:]( v20,  "objectForKey:",  *(void *)(*((void *)&v74 + 1) + 8 * v26)); ; id k = (id)[v28 superentity])
              {
                uint64_t v28 = k;
                objc_msgSend(v22, "addObject:", objc_msgSend(k, "name"));
                if (![v28 superentity]) {
                  break;
                }
              }

              if (!objc_msgSend(v21, "valueForKey:", objc_msgSend(v28, "name")))
              {
                uint64_t v29 = (void *)[v28 copy];
                id v30 = objc_alloc_init(MEMORY[0x189603FA8]);
                +[NSManagedObjectModel _deepCollectEntitiesInArray:entity:]( (uint64_t)&OBJC_CLASS___NSManagedObjectModel,  v30,  v29);
                __int128 v72 = 0u;
                __int128 v73 = 0u;
                __int128 v70 = 0u;
                __int128 v71 = 0u;
                uint64_t v31 = [v30 countByEnumeratingWithState:&v70 objects:v88 count:16];
                if (v31)
                {
                  uint64_t v32 = v31;
                  uint64_t v33 = *(void *)v71;
                  do
                  {
                    for (uint64_t m = 0LL; m != v32; ++m)
                    {
                      if (*(void *)v71 != v33) {
                        objc_enumerationMutation(v30);
                      }
                      objc_msgSend( v21,  "setObject:forKey:",  *(void *)(*((void *)&v70 + 1) + 8 * m),  objc_msgSend(*(id *)(*((void *)&v70 + 1) + 8 * m), "name"));
                    }

                    uint64_t v32 = [v30 countByEnumeratingWithState:&v70 objects:v88 count:16];
                  }

                  while (v32);
                }

                uint64_t v24 = v60;
                uint64_t v19 = v61;
                uint64_t v25 = v56;
                v20 = v58;
              }

              ++v26;
            }

            while (v26 != v24);
            uint64_t v24 = [v19 countByEnumeratingWithState:&v74 objects:v89 count:16];
          }

          while (v24);
        }

        __int128 v68 = 0u;
        __int128 v69 = 0u;
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        v35 = (void *)[v21 allValues];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v66 objects:v87 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v67;
          do
          {
            for (uint64_t n = 0LL; n != v37; ++n)
            {
              if (*(void *)v67 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = *(void **)(*((void *)&v66 + 1) + 8 * n);
              if ((objc_msgSend(v22, "containsObject:", objc_msgSend(v40, "name")) & 1) == 0)
              {
                -[NSEntityDescription _removeSubentity:]((id *)[v40 superentity], v40);
                objc_msgSend(v21, "removeObjectForKey:", objc_msgSend(v40, "name"));
              }
            }

            uint64_t v37 = [v35 countByEnumeratingWithState:&v66 objects:v87 count:16];
          }

          while (v37);
        }

        id v17 = -[NSManagedObjectModel _initWithEntities:]( [NSManagedObjectModel alloc],  "_initWithEntities:",  [v21 allValues]);
        objc_msgSend( v17,  "setVersionIdentifiers:",  -[NSManagedObjectModel versionIdentifiers](v54, "versionIdentifiers"));
        v41 = -[NSManagedObjectModel fetchRequestTemplatesByName](v54, "fetchRequestTemplatesByName");
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        uint64_t v42 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v62,  v86,  16LL);
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v63;
          do
          {
            for (iuint64_t i = 0LL; ii != v43; ++ii)
            {
              if (*(void *)v63 != v44) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void *)(*((void *)&v62 + 1) + 8 * ii);
              id v47 = -[NSDictionary objectForKey:](v41, "objectForKey:", v46);
              if (objc_msgSend(v21, "objectForKey:", objc_msgSend((id)objc_msgSend(v47, "entity"), "name"))) {
                [v17 setFetchRequestTemplate:v47 forName:v46];
              }
            }

            uint64_t v43 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v62,  v86,  16LL);
          }

          while (v43);
        }

        id v5 = v50;
        v18 = v51;
      }

      else
      {
        id v5 = v50;
      }
    }

    else
    {
      id v5 = v50;
      uint64_t v19 = v61;
    }
  }

  else
  {
    v18 = 0LL;
    uint64_t v19 = 0LL;
    id v17 = 0LL;
  }

  [v5 drain];
  return v17;
}

@end