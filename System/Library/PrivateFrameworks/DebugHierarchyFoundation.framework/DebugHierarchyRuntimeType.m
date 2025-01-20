@interface DebugHierarchyRuntimeType
+ (id)typeWithDictionaryRepresentation:(id)a3;
+ (id)typeWithName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfTypeWithName:(id)a3;
- (DebugHierarchyRuntimeType)initWithDictionaryRepresentation:(id)a3;
- (DebugHierarchyRuntimeType)initWithName:(id)a3;
- (DebugHierarchyRuntimeType)parentType;
- (NSArray)additionalGroupingIDs;
- (NSMutableDictionary)instanceProperties;
- (NSSet)subtypes;
- (NSString)childGroupingID;
- (NSString)moduleName;
- (NSString)name;
- (NSString)nameIncludingModules;
- (id)closestTypeVendingAChildGroupingID;
- (id)debugDescription;
- (id)dictionaryRepresentation;
- (id)namesOfInheritanceChain;
- (id)propertyWithName:(id)a3;
- (int64_t)sourceLanguage;
- (void)addInstanceProperty:(id)a3;
- (void)addSubtype:(id)a3;
- (void)setAdditionalGroupingIDs:(id)a3;
- (void)setChildGroupingID:(id)a3;
- (void)setModuleName:(id)a3;
- (void)setName:(id)a3;
- (void)setNameIncludingModules:(id)a3;
- (void)setParentType:(id)a3;
- (void)setSubtypes:(id)a3;
@end

@implementation DebugHierarchyRuntimeType

+ (id)typeWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDictionaryRepresentation:v4];

  return v5;
}

- (DebugHierarchyRuntimeType)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___DebugHierarchyRuntimeType;
  id v5 = -[DebugHierarchyRuntimeType init](&v33, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"className"]);
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"typeAndModuleName"]);
    nameIncludingModules = v5->_nameIncludingModules;
    v5->_nameIncludingModules = (NSString *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"moduleName"]);
    moduleName = v5->_moduleName;
    v5->_moduleName = (NSString *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"subclasses"]);
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v13 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        v16 = 0LL;
        do
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = -[DebugHierarchyRuntimeType initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___DebugHierarchyRuntimeType),  "initWithDictionaryRepresentation:",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)v16));
          -[DebugHierarchyRuntimeType addSubtype:](v5, "addSubtype:", v17);

          v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }

      while (v14);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"instanceProperties"]);
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v19 = [v18 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        v22 = 0LL;
        do
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = -[DebugHierarchyProperty initWithPropertyDescription:]( objc_alloc(&OBJC_CLASS___DebugHierarchyProperty),  "initWithPropertyDescription:",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)v22));
          -[DebugHierarchyRuntimeType addInstanceProperty:](v5, "addInstanceProperty:", v23);

          v22 = (char *)v22 + 1;
        }

        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }

      while (v20);
    }
  }

  return v5;
}

+ (id)typeWithName:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithName:v4];

  return v5;
}

- (DebugHierarchyRuntimeType)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DebugHierarchyRuntimeType;
  uint64_t v6 = -[DebugHierarchyRuntimeType init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (void)addSubtype:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType subtypes](self, "subtypes"));
  uint64_t v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
  id v9 = v7;

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 setByAddingObject:v4]);
  -[DebugHierarchyRuntimeType setSubtypes:](self, "setSubtypes:", v8);

  [v4 setParentType:self];
}

- (BOOL)isKindOfTypeWithName:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      unsigned __int8 v8 = [v7 isEqualToString:v4];

      if ((v8 & 1) != 0) {
        break;
      }
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 parentType]);

      uint64_t v6 = (void *)v9;
    }

    while (v9);
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)propertyWithName:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if (v5)
  {
    do
    {
      uint64_t v6 = v5;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType instanceProperties](v5, "instanceProperties"));
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v4]);

      id v5 = (DebugHierarchyRuntimeType *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType parentType](v6, "parentType"));
    }

    while (!v8 && v5);
  }

  else
  {
    unsigned __int8 v8 = 0LL;
  }

  return v8;
}

- (id)namesOfInheritanceChain
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v2)
  {
    do
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType name](v2, "name"));
      [v3 addObject:v4];

      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType parentType](v2, "parentType"));
      v2 = (DebugHierarchyRuntimeType *)v5;
    }

    while (v5);
  }

  id v6 = [v3 copy];

  return v6;
}

- (id)closestTypeVendingAChildGroupingID
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType childGroupingID](v2, "childGroupingID"));

  if (v2 && !v3)
  {
    do
    {
      id v4 = v2;
      v2 = (DebugHierarchyRuntimeType *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType parentType](v2, "parentType"));

      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType childGroupingID](v2, "childGroupingID"));
    }

    while (v2 && !v5);
  }

  return v2;
}

- (NSMutableDictionary)instanceProperties
{
  instanceProperties = self->_instanceProperties;
  if (!instanceProperties)
  {
    id v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v5 = self->_instanceProperties;
    self->_instanceProperties = v4;

    instanceProperties = self->_instanceProperties;
  }

  return instanceProperties;
}

- (void)addInstanceProperty:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType instanceProperties](self, "instanceProperties"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  [v6 setObject:v4 forKeyedSubscript:v5];
}

- (int64_t)sourceLanguage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType moduleName](self, "moduleName"));
  if ([v3 length])
  {
    int64_t v4 = 2LL;
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType name](self, "name"));
    else {
      int64_t v4 = 1LL;
    }
  }

  return v4;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType subtypes](self, "subtypes"));
  id v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType subtypes](self, "subtypes"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType subtypes](self, "subtypes"));
    id v8 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v37;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v36 + 1) + 8 * (void)v11) dictionaryRepresentation]);
          [v6 addObject:v12];

          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }

      while (v9);
    }
  }

  else
  {
    id v6 = 0LL;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  4LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType name](self, "name"));
  [v13 setObject:v14 forKeyedSubscript:@"className"];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType nameIncludingModules](self, "nameIncludingModules"));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType nameIncludingModules](self, "nameIncludingModules"));
    [v13 setObject:v16 forKeyedSubscript:@"typeAndModuleName"];
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType moduleName](self, "moduleName"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType moduleName](self, "moduleName"));
    [v13 setObject:v18 forKeyedSubscript:@"moduleName"];
  }

  if (v6)
  {
    id v19 = [v6 copy];
    [v13 setObject:v19 forKeyedSubscript:@"subclasses"];
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType instanceProperties](self, "instanceProperties"));
  id v21 = [v20 count];

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v21));
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType instanceProperties](self, "instanceProperties", 0LL));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectEnumerator]);

    id v25 = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v33;
      do
      {
        __int128 v28 = 0LL;
        do
        {
          if (*(void *)v33 != v27) {
            objc_enumerationMutation(v24);
          }
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v32 + 1) + 8 * (void)v28) dictionaryRepresentation]);
          if (v29) {
            [v22 addObject:v29];
          }

          __int128 v28 = (char *)v28 + 1;
        }

        while (v26 != v28);
        id v26 = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }

      while (v26);
    }

    id v30 = [v22 copy];
    [v13 setObject:v30 forKeyedSubscript:@"instanceProperties"];
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___DebugHierarchyRuntimeType, v5);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);
  id v8 = v4;
  if ((isKindOfClass & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType name](self, "name"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    unsigned int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType moduleName](self, "moduleName"));
      if (v12 || (uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 moduleName])) != 0)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType moduleName](self, "moduleName"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 moduleName]);
        unsigned __int8 v15 = [v13 isEqualToString:v14];

        if (v12)
        {
LABEL_10:

          goto LABEL_11;
        }
      }

      else
      {
        unsigned __int8 v15 = 1;
      }

      goto LABEL_10;
    }
  }

  unsigned __int8 v15 = 0;
LABEL_11:

  return v15;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType name](self, "name"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeType instanceProperties](self, "instanceProperties"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<%@: %p, represents: %@, properties: %lu>",  v5,  self,  v6,  [v7 count]));

  return v8;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)nameIncludingModules
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setNameIncludingModules:(id)a3
{
}

- (NSString)moduleName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setModuleName:(id)a3
{
}

- (DebugHierarchyRuntimeType)parentType
{
  return (DebugHierarchyRuntimeType *)objc_loadWeakRetained((id *)&self->_parentType);
}

- (void)setParentType:(id)a3
{
}

- (NSSet)subtypes
{
  return (NSSet *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSubtypes:(id)a3
{
}

- (NSString)childGroupingID
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setChildGroupingID:(id)a3
{
}

- (NSArray)additionalGroupingIDs
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setAdditionalGroupingIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end