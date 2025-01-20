@interface MTEntityUpdaterCache
- (MTEntityUpdaterCache)initWithPredicate:(id)a3 entityName:(id)a4 ctx:(id)a5 properties:(id)a6 fetchProperties:(id)a7;
- (id)allowKeyForValue;
- (id)indexingBlock;
- (id)propertyDictionaryForSearchItem:(id)a3;
- (void)_addDictionary:(id)a3;
- (void)_buildMap;
- (void)addEntityToCache:(id)a3;
- (void)enumerateUnvisitedItemUuids:(id)a3;
- (void)setAllowKeyForValue:(id)a3;
- (void)setIndexingBlock:(id)a3;
@end

@implementation MTEntityUpdaterCache

- (MTEntityUpdaterCache)initWithPredicate:(id)a3 entityName:(id)a4 ctx:(id)a5 properties:(id)a6 fetchProperties:(id)a7
{
  id v21 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MTEntityUpdaterCache;
  v17 = -[MTEntityUpdaterCache init](&v22, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_properties, a6);
    objc_storeStrong((id *)&v18->_propertiesToFetch, a7);
    objc_storeStrong((id *)&v18->_ctx, a5);
    objc_storeStrong((id *)&v18->_predicate, a3);
    objc_storeStrong((id *)&v18->_entityName, a4);
    v19 = v18;
  }

  return v18;
}

- (id)propertyDictionaryForSearchItem:(id)a3
{
  id v4 = a3;
  if (!self->_objectsByProperty) {
    -[MTEntityUpdaterCache _buildMap](self, "_buildMap");
  }
  uint64_t v5 = -[NSArray count](self->_properties, "count");
  if (v5 < 1)
  {
LABEL_12:
    id v13 = 0LL;
    goto LABEL_13;
  }

  uint64_t v6 = v5;
  uint64_t v7 = 0LL;
  while (1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_properties, "objectAtIndexedSubscript:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v8]);
    allowKeyForValue = (unsigned int (**)(id, void *, void *))self->_allowKeyForValue;
    if (allowKeyForValue && !allowKeyForValue[2](allowKeyForValue, v8, v9)) {
      goto LABEL_10;
    }
    if (v9) {
      break;
    }
LABEL_11:

    if (v6 == ++v7) {
      goto LABEL_12;
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_objectsByProperty, "objectAtIndexedSubscript:", v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v9]);
  if (!v12)
  {

LABEL_10:
    goto LABEL_11;
  }

  id v13 = v12;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"uuid"]);
  if (v15) {
    -[NSMutableSet removeObject:](self->_unvisited, "removeObject:", v15);
  }

LABEL_13:
  return v13;
}

- (void)_buildMap
{
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", self->_properties));
  [v17 addObject:@"uuid"];
  if (-[NSArray count](self->_propertiesToFetch, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", self->_propertiesToFetch));
    [v17 unionSet:v3];
  }

  entityName = self->_entityName;
  ctx = self->_ctx;
  predicate = self->_predicate;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v17 allObjects]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSManagedObjectContext objectsInEntity:predicate:propertiesToFetch:limit:]( ctx,  "objectsInEntity:predicate:propertiesToFetch:limit:",  entityName,  predicate,  v7,  0LL));

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"uuid"]);
  v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v9));
  unvisited = self->_unvisited;
  self->_unvisited = v10;

  v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  objectsByProperty = self->_objectsByProperty;
  self->_objectsByProperty = v12;

  if (-[NSArray count](self->_properties, "count"))
  {
    unint64_t v14 = 0LL;
    do
    {
      id v15 = self->_objectsByProperty;
      id v16 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableArray addObject:](v15, "addObject:", v16);

      ++v14;
    }

    while (v14 < -[NSArray count](self->_properties, "count"));
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100067EA8;
  v18[3] = &unk_100242378;
  v18[4] = self;
  [v8 enumerateObjectsUsingBlock:v18];
}

- (void)addEntityToCache:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionaryRepresentation]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEntityUpdaterCache indexingBlock](self, "indexingBlock"));

  if (v5)
  {
    uint64_t v6 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(-[MTEntityUpdaterCache indexingBlock](self, "indexingBlock"));
    uint64_t v7 = ((uint64_t (**)(void, id))v6)[2](v6, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_dictionaryByAddingEntriesFromDictionary:", v8));

    id v4 = (void *)v9;
  }

  -[MTEntityUpdaterCache _addDictionary:](self, "_addDictionary:", v4);
}

- (void)_addDictionary:(id)a3
{
  id v8 = a3;
  if (-[NSArray count](self->_properties, "count"))
  {
    unint64_t v4 = 0LL;
    do
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_properties, "objectAtIndexedSubscript:", v4));
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v5]);
      if (v6)
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_objectsByProperty,  "objectAtIndexedSubscript:",  v4));
        [v7 setObject:v8 forKey:v6];
      }

      ++v4;
    }

    while (v4 < -[NSArray count](self->_properties, "count"));
  }
}

- (void)enumerateUnvisitedItemUuids:(id)a3
{
  unint64_t v4 = (void (**)(id, uint64_t, char *))a3;
  unvisited = self->_unvisited;
  if (!unvisited)
  {
    -[MTEntityUpdaterCache _buildMap](self, "_buildMap");
    unvisited = self->_unvisited;
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v6 = unvisited;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_5:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      char v12 = 0;
      v4[2](v4, v11, &v12);
      if (v12) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

- (id)allowKeyForValue
{
  return self->_allowKeyForValue;
}

- (void)setAllowKeyForValue:(id)a3
{
}

- (id)indexingBlock
{
  return self->_indexingBlock;
}

- (void)setIndexingBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end