@interface PKProviderForCapabilityMap
- (NSArray)capabilities;
- (NSMapTable)underlyingMapping;
- (PKProviderForCapabilityMap)init;
- (id)capabilityForIdentifier:(id)a3;
- (id)providerForCapability:(id)a3;
- (unint64_t)count;
- (void)addCapability:(id)a3 provider:(id)a4;
- (void)enumerateCapabilities:(id)a3;
- (void)enumerateInTopologicalOrderWithContext:(id)a3 enumerator:(id)a4;
- (void)removeCapability:(id)a3;
@end

@implementation PKProviderForCapabilityMap

- (PKProviderForCapabilityMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PKProviderForCapabilityMap;
  v2 = -[PKProviderForCapabilityMap init](&v6, "init");
  if (v2)
  {
    v3 = (NSMapTable *)+[NSMapTable pk_createStrongPointerPersonalityToStrongObjects]( &OBJC_CLASS___NSMapTable,  "pk_createStrongPointerPersonalityToStrongObjects");
    mapping = v2->_mapping;
    v2->_mapping = v3;
  }

  return v2;
}

- (void)enumerateCapabilities:(id)a3
{
  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_mapping, "keyEnumerator"));
  objc_super v6 = 0LL;
  do
  {
    v7 = v6;
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nextObject]);

    if (!v6) {
      break;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_mapping, "objectForKey:", v6));
    unsigned __int8 v10 = 0;
    v4[2](v4, v6, v8, &v10);
    int v9 = v10;
  }

  while (!v9);
}

- (void)enumerateInTopologicalOrderWithContext:(id)a3 enumerator:(id)a4
{
  id v39 = a3;
  v38 = (void (**)(id, void *, void *, _BYTE *))a4;
  v42 = self;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKProviderForCapabilityMap capabilities](self, "capabilities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingComparator:&stru_100659BD0]);

  v41 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  id v8 = v7;
  id v43 = [v8 countByEnumeratingWithState:&v75 objects:v82 count:16];
  if (v43)
  {
    uint64_t v40 = *(void *)v76;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v76 != v40)
        {
          uint64_t v10 = v9;
          objc_enumerationMutation(v8);
          uint64_t v9 = v10;
        }

        uint64_t v45 = v9;
        v11 = *(void **)(*((void *)&v75 + 1) + 8 * v9);
        v47 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v41, "setObject:forKeyedSubscript:", v12, v47);
        location = (id *)objc_claimAutoreleasedReturnValue(-[PKProviderForCapabilityMap providerForCapability:](v42, "providerForCapability:", v11));
        if ((objc_opt_respondsToSelector(location, "associatedRequirementsForRequirement:context:") & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([location associatedRequirementsForRequirement:v11 context:v39]);
          v44 = v13;
          v14 = v13;
          if (v13)
          {
            id v15 = [v13 count];
            v14 = v44;
            if (v15)
            {
              __int128 v74 = 0u;
              __int128 v73 = 0u;
              __int128 v72 = 0u;
              __int128 v71 = 0u;
              id v16 = v44;
              id v17 = [v16 countByEnumeratingWithState:&v71 objects:v81 count:16];
              if (v17)
              {
                uint64_t v18 = *(void *)v72;
                do
                {
                  for (i = 0LL; i != v17; i = (char *)i + 1)
                  {
                    if (*(void *)v72 != v18) {
                      objc_enumerationMutation(v16);
                    }
                    uint64_t v20 = *(void *)(*((void *)&v71 + 1) + 8LL * (void)i);
                    v70[0] = _NSConcreteStackBlock;
                    v70[1] = 3221225472LL;
                    v70[2] = sub_100398DB8;
                    v70[3] = &unk_100659BF8;
                    v70[4] = v20;
                    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pk_firstObjectPassingTest:", v70));
                    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
                    -[NSMutableArray safelyAddObject:](v12, "safelyAddObject:", v22);
                  }

                  id v17 = [v16 countByEnumeratingWithState:&v71 objects:v81 count:16];
                }

                while (v17);
              }

              v14 = v44;
            }
          }
        }

        uint64_t v9 = v45 + 1;
      }

      while ((id)(v45 + 1) != v43);
      id v43 = [v8 countByEnumeratingWithState:&v75 objects:v82 count:16];
    }

    while (v43);
  }

  v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v64 = 0LL;
  v65 = (id *)&v64;
  uint64_t v66 = 0x3042000000LL;
  v67 = sub_100398DC4;
  v68 = sub_100398DD0;
  id v69 = 0LL;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_100398DD8;
  v59[3] = &unk_100659C20;
  v48 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v60 = v48;
  v46 = v41;
  v61 = v46;
  v63 = &v64;
  v24 = v23;
  v62 = v24;
  v25 = objc_retainBlock(v59);
  objc_storeWeak(v65 + 5, v25);
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id v26 = v8;
  id v27 = [v26 countByEnumeratingWithState:&v55 objects:v80 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v56;
    do
    {
      for (j = 0LL; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v56 != v28) {
          objc_enumerationMutation(v26);
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v55 + 1) + 8 * (void)j) identifier]);
        ((void (*)(void *, void *))v25[2])(v25, v30);
      }

      id v27 = [v26 countByEnumeratingWithState:&v55 objects:v80 count:16];
    }

    while (v27);
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  v31 = v24;
  id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v51,  v79,  16LL);
  if (v32)
  {
    uint64_t v33 = *(void *)v52;
LABEL_29:
    uint64_t v34 = 0LL;
    while (1)
    {
      if (*(void *)v52 != v33) {
        objc_enumerationMutation(v31);
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue( -[PKProviderForCapabilityMap capabilityForIdentifier:]( v42,  "capabilityForIdentifier:",  *(void *)(*((void *)&v51 + 1) + 8 * v34)));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](v42->_mapping, "objectForKey:", v35));
      char v50 = 0;
      v38[2](v38, v35, v36, &v50);
      BOOL v37 = v50 == 0;

      if (!v37) {
        break;
      }
      if (v32 == (id)++v34)
      {
        id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v51,  v79,  16LL);
        if (v32) {
          goto LABEL_29;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v64, 8);
  objc_destroyWeak(&v69);
}

- (NSMapTable)underlyingMapping
{
  return (NSMapTable *)-[NSMapTable copy](self->_mapping, "copy");
}

- (NSArray)capabilities
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_mapping, "keyEnumerator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);

  return (NSArray *)v3;
}

- (unint64_t)count
{
  return -[NSMapTable count](self->_mapping, "count");
}

- (id)providerForCapability:(id)a3
{
  return -[NSMapTable objectForKey:](self->_mapping, "objectForKey:", a3);
}

- (id)capabilityForIdentifier:(id)a3
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = sub_100399080;
  v14 = sub_100399090;
  id v15 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100399098;
  v7[3] = &unk_100659C48;
  id v4 = a3;
  id v8 = v4;
  uint64_t v9 = &v10;
  -[PKProviderForCapabilityMap enumerateCapabilities:](self, "enumerateCapabilities:", v7);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)addCapability:(id)a3 provider:(id)a4
{
}

- (void)removeCapability:(id)a3
{
}

- (void).cxx_destruct
{
}

@end