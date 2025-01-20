@interface DebugHierarchyPropertyAction
- (BOOL)_isTargetingProperty:(id)a3;
- (BOOL)exactTypesAreExclusive;
- (BOOL)isTargetingObject:(id)a3;
- (BOOL)objectIdentifiersAreExclusive;
- (BOOL)propertyNamesAreExclusive;
- (BOOL)targetsObjectIdentifiers:(id *)a3;
- (BOOL)typesAreExclusive;
- (DebugHierarchyPropertyAction)init;
- (NSArray)exactTypes;
- (NSArray)objectIdentifiers;
- (NSArray)propertyNames;
- (NSArray)types;
- (NSString)debugDescription;
- (id)keysToArchiveViaKVC;
- (int64_t)options;
- (int64_t)optionsComparisonStyle;
- (int64_t)visibility;
- (void)_fetchValuesForPropertiesWithNames:(id)a3 onObject:(id)a4 inContext:(id)a5;
- (void)addPropertyNames:(id)a3;
- (void)performInContext:(id)a3 withObject:(id)a4;
- (void)setExactTypes:(id)a3;
- (void)setExactTypes:(id)a3 exlusive:(BOOL)a4;
- (void)setExactTypesAreExclusive:(BOOL)a3;
- (void)setObjectIdentifiers:(id)a3;
- (void)setObjectIdentifiers:(id)a3 exlusive:(BOOL)a4;
- (void)setObjectIdentifiersAreExclusive:(BOOL)a3;
- (void)setOptions:(int64_t)a3;
- (void)setOptions:(int64_t)a3 comparisonStyle:(int64_t)a4;
- (void)setOptionsComparisonStyle:(int64_t)a3;
- (void)setPropertyNames:(id)a3;
- (void)setPropertyNames:(id)a3 exlusive:(BOOL)a4;
- (void)setPropertyNamesAreExclusive:(BOOL)a3;
- (void)setTypes:(id)a3;
- (void)setTypes:(id)a3 exlusive:(BOOL)a4;
- (void)setTypesAreExclusive:(BOOL)a3;
- (void)setVisibility:(int64_t)a3;
@end

@implementation DebugHierarchyPropertyAction

- (DebugHierarchyPropertyAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DebugHierarchyPropertyAction;
  result = -[DebugHierarchyPropertyAction init](&v3, "init");
  if (result)
  {
    result->_visibility = 15LL;
    result->_optionsComparisonStyle = 0LL;
  }

  return result;
}

- (void)setObjectIdentifiers:(id)a3 exlusive:(BOOL)a4
{
  BOOL v4 = a4;
  -[DebugHierarchyPropertyAction setObjectIdentifiers:](self, "setObjectIdentifiers:", a3);
  -[DebugHierarchyPropertyAction setObjectIdentifiersAreExclusive:](self, "setObjectIdentifiersAreExclusive:", v4);
}

- (void)setTypes:(id)a3 exlusive:(BOOL)a4
{
  BOOL v4 = a4;
  -[DebugHierarchyPropertyAction setTypes:](self, "setTypes:", a3);
  -[DebugHierarchyPropertyAction setTypesAreExclusive:](self, "setTypesAreExclusive:", v4);
}

- (void)setExactTypes:(id)a3 exlusive:(BOOL)a4
{
  BOOL v4 = a4;
  -[DebugHierarchyPropertyAction setExactTypes:](self, "setExactTypes:", a3);
  -[DebugHierarchyPropertyAction setExactTypesAreExclusive:](self, "setExactTypesAreExclusive:", v4);
}

- (void)setPropertyNames:(id)a3 exlusive:(BOOL)a4
{
  BOOL v4 = a4;
  -[DebugHierarchyPropertyAction setPropertyNames:](self, "setPropertyNames:", a3);
  -[DebugHierarchyPropertyAction setPropertyNamesAreExclusive:](self, "setPropertyNamesAreExclusive:", v4);
}

- (void)addPropertyNames:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction propertyNames](self, "propertyNames"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v6 arrayByAddingObjectsFromArray:v4]);

  -[DebugHierarchyPropertyAction setPropertyNames:](self, "setPropertyNames:", v5);
}

- (void)setOptions:(int64_t)a3 comparisonStyle:(int64_t)a4
{
}

- (id)keysToArchiveViaKVC
{
  v3[0] = @"objectIdentifiers";
  v3[1] = @"objectIdentifiersAreExclusive";
  v3[2] = @"propertyNames";
  v3[3] = @"propertyNamesAreExclusive";
  v3[4] = @"types";
  v3[5] = @"typesAreExclusive";
  v3[6] = @"exactTypes";
  v3[7] = @"exactTypesAreExclusive";
  v3[8] = @"visibility";
  v3[9] = @"options";
  v3[10] = @"optionsComparisonStyle";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  11LL));
}

- (void)performInContext:(id)a3 withObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[DebugHierarchyPropertyAction isTargetingObject:](self, "isTargetingObject:", v7))
  {
    unsigned __int8 v8 = -[DebugHierarchyPropertyAction visibility](self, "visibility");
    int64_t v9 = -[DebugHierarchyPropertyAction optionsComparisonStyle](self, "optionsComparisonStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction propertyNames](self, "propertyNames"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction propertyNames](self, "propertyNames"));
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction propertyNames](self, "propertyNames"));
        if ([v12 count]) {
          unsigned __int8 v13 = 0;
        }
        else {
          unsigned __int8 v13 = -[DebugHierarchyPropertyAction propertyNamesAreExclusive](self, "propertyNamesAreExclusive");
        }
      }

      else
      {
        unsigned __int8 v13 = 0;
      }
    }

    else
    {
      unsigned __int8 v13 = 1;
    }

    uint64_t v14 = v8 & 0xF;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction propertyNames](self, "propertyNames"));
    if ([v15 count]) {
      unsigned int v16 = -[DebugHierarchyPropertyAction propertyNamesAreExclusive](self, "propertyNamesAreExclusive");
    }
    else {
      unsigned int v16 = 0;
    }

    if (v14 == 15 && v9 == 0) {
      char v19 = v13;
    }
    else {
      char v19 = 1;
    }
    if ((v19 & 1) != 0 || v16)
    {
      v21 = (objc_class *)objc_opt_class(v7, v17);
      if (v21 && (v22 = v21, object_isClass(v21)))
      {
        v23 = NSStringFromClass(v22);
        uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
      }

      else
      {
        uint64_t v24 = 0LL;
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "runtimeTypeWithName:", v24, v24));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      id v38 = v25;
      if (v38)
      {
        v27 = v38;
        do
        {
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          v28 = (void *)objc_claimAutoreleasedReturnValue([v27 instanceProperties]);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectEnumerator]);

          id v30 = [v29 countByEnumeratingWithState:&v39 objects:v43 count:16];
          if (v30)
          {
            id v31 = v30;
            uint64_t v32 = *(void *)v40;
            do
            {
              for (i = 0LL; i != v31; i = (char *)i + 1)
              {
                if (*(void *)v40 != v32) {
                  objc_enumerationMutation(v29);
                }
                v34 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
                if (-[DebugHierarchyPropertyAction _isTargetingProperty:](self, "_isTargetingProperty:", v34))
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 name]);
                  [v26 addObject:v35];
                }
              }

              id v31 = [v29 countByEnumeratingWithState:&v39 objects:v43 count:16];
            }

            while (v31);
          }

          uint64_t v36 = objc_claimAutoreleasedReturnValue([v27 parentType]);
          v27 = (void *)v36;
        }

        while (v36);
      }

      if ([v26 count]) {
        id v20 = [v26 copy];
      }
      else {
        id v20 = 0LL;
      }
    }

    else
    {
      id v20 = (id)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction propertyNames](self, "propertyNames"));
    }

    -[DebugHierarchyPropertyAction _fetchValuesForPropertiesWithNames:onObject:inContext:]( self,  "_fetchValuesForPropertiesWithNames:onObject:inContext:",  v20,  v7,  v6);
  }
}

- (BOOL)targetsObjectIdentifiers:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction objectIdentifiers](self, "objectIdentifiers"));
  if ([v5 count])
  {
    unsigned __int8 v6 = -[DebugHierarchyPropertyAction objectIdentifiersAreExclusive](self, "objectIdentifiersAreExclusive");

    if ((v6 & 1) == 0)
    {
      *a3 = (id)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction objectIdentifiers](self, "objectIdentifiers"));
      return 1;
    }
  }

  else
  {
  }

  return 0;
}

- (BOOL)isTargetingObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction objectIdentifiers](self, "objectIdentifiers"));
  id v6 = [v5 count];

  if (v6
    && (!v4 ? (id v7 = 0LL) : (id v7 = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%p", v4)),
        unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction objectIdentifiers](self, "objectIdentifiers")),
        unsigned int v9 = [v8 containsObject:v7],
        v8,
        LODWORD(v8) = -[DebugHierarchyPropertyAction objectIdentifiersAreExclusive]( self,  "objectIdentifiersAreExclusive"),  v7,  v9 == (_DWORD)v8))
  {
    LOBYTE(v25) = 0;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction types](self, "types"));
    id v11 = [v10 count];

    if (v11)
    {
      if (-[DebugHierarchyPropertyAction typesAreExclusive](self, "typesAreExclusive"))
      {
        __int128 v49 = 0uLL;
        __int128 v50 = 0uLL;
        __int128 v47 = 0uLL;
        __int128 v48 = 0uLL;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction types](self, "types"));
        id v13 = [v12 countByEnumeratingWithState:&v47 objects:v54 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v48;
LABEL_10:
          uint64_t v16 = 0LL;
          while (1)
          {
            if (*(void *)v48 != v15) {
              objc_enumerationMutation(v12);
            }
            Class v17 = NSClassFromString(*(NSString **)(*((void *)&v47 + 1) + 8 * v16));
            if (v17)
            {
              if ((objc_opt_isKindOfClass(v4, v17) & 1) != 0) {
                goto LABEL_29;
              }
            }

            if (v14 == (id)++v16)
            {
              id v14 = [v12 countByEnumeratingWithState:&v47 objects:v54 count:16];
              if (v14) {
                goto LABEL_10;
              }
              break;
            }
          }
        }
      }

      else
      {
        __int128 v45 = 0uLL;
        __int128 v46 = 0uLL;
        __int128 v43 = 0uLL;
        __int128 v44 = 0uLL;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction types](self, "types"));
        id v25 = [v12 countByEnumeratingWithState:&v43 objects:v53 count:16];
        if (!v25) {
          goto LABEL_53;
        }
        uint64_t v26 = *(void *)v44;
LABEL_33:
        uint64_t v27 = 0LL;
        while (1)
        {
          if (*(void *)v44 != v26) {
            objc_enumerationMutation(v12);
          }
          Class v28 = NSClassFromString(*(NSString **)(*((void *)&v43 + 1) + 8 * v27));
          if (v28)
          {
            if ((objc_opt_isKindOfClass(v4, v28) & 1) != 0) {
              break;
            }
          }

          if (v25 == (id)++v27)
          {
            id v25 = [v12 countByEnumeratingWithState:&v43 objects:v53 count:16];
            if (v25) {
              goto LABEL_33;
            }
            goto LABEL_53;
          }
        }
      }
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction exactTypes](self, "exactTypes"));
    id v19 = [v18 count];

    if (v19)
    {
      if (-[DebugHierarchyPropertyAction exactTypesAreExclusive](self, "exactTypesAreExclusive"))
      {
        __int128 v41 = 0uLL;
        __int128 v42 = 0uLL;
        __int128 v39 = 0uLL;
        __int128 v40 = 0uLL;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction exactTypes](self, "exactTypes"));
        id v20 = [v12 countByEnumeratingWithState:&v39 objects:v52 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v40;
LABEL_22:
          uint64_t v23 = 0LL;
          while (1)
          {
            if (*(void *)v40 != v22) {
              objc_enumerationMutation(v12);
            }
            Class v24 = NSClassFromString(*(NSString **)(*((void *)&v39 + 1) + 8 * v23));
            if (v24)
            {
            }

            if (v21 == (id)++v23)
            {
              id v21 = [v12 countByEnumeratingWithState:&v39 objects:v52 count:16];
              if (v21) {
                goto LABEL_22;
              }
              break;
            }
          }
        }
      }

      else
      {
        __int128 v37 = 0uLL;
        __int128 v38 = 0uLL;
        __int128 v35 = 0uLL;
        __int128 v36 = 0uLL;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction exactTypes](self, "exactTypes"));
        id v29 = [v12 countByEnumeratingWithState:&v35 objects:v51 count:16];
        if (!v29)
        {
LABEL_52:
          LOBYTE(v25) = 1;
          goto LABEL_53;
        }

        id v30 = v29;
        uint64_t v31 = *(void *)v36;
LABEL_44:
        uint64_t v32 = 0LL;
        while (1)
        {
          if (*(void *)v36 != v31) {
            objc_enumerationMutation(v12);
          }
          Class v33 = NSClassFromString(*(NSString **)(*((void *)&v35 + 1) + 8 * v32));
          if (v33)
          {
          }

          if (v30 == (id)++v32)
          {
            id v30 = [v12 countByEnumeratingWithState:&v35 objects:v51 count:16];
            LOBYTE(v25) = 1;
            if (v30) {
              goto LABEL_44;
            }
            goto LABEL_53;
          }
        }
      }

- (BOOL)_isTargetingProperty:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[v4 visibility];
  if ((-[DebugHierarchyPropertyAction visibility](self, "visibility") & v5) != 0)
  {
    unint64_t v6 = (unint64_t)[v4 options];
    int64_t v7 = -[DebugHierarchyPropertyAction options](self, "options");
    switch(-[DebugHierarchyPropertyAction optionsComparisonStyle](self, "optionsComparisonStyle"))
    {
      case 0LL:
        break;
      case 1LL:
        if ((v7 & ~v6) != 0) {
          goto LABEL_10;
        }
        break;
      case 2LL:
        if ((v7 & v6) == 0) {
          goto LABEL_10;
        }
        break;
      case 3LL:
        if ((v7 & v6) != 0) {
          goto LABEL_10;
        }
        break;
      case 4LL:
        if (v7 != v6) {
          goto LABEL_10;
        }
        break;
      default:
        goto LABEL_10;
    }

    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction propertyNames](self, "propertyNames"));
    id v9 = [v8 count];

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction propertyNames](self, "propertyNames"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      unsigned int v12 = [v10 containsObject:v11];

      unsigned int v13 = v12 ^ -[DebugHierarchyPropertyAction propertyNamesAreExclusive](self, "propertyNamesAreExclusive");
    }

    else
    {
      LOBYTE(v13) = 1;
    }
  }

  else
  {
LABEL_10:
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (void)_fetchValuesForPropertiesWithNames:(id)a3 onObject:(id)a4 inContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
    unsigned int v12 = (objc_class *)objc_opt_class(v8, v11);
    if (v12 && (unsigned int v13 = v12, object_isClass(v12)))
    {
      id v14 = NSStringFromClass(v13);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    }

    else
    {
      uint64_t v15 = 0LL;
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 runtimeTypeWithName:v15]);

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v28 = v7;
    id v17 = v7;
    id v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        id v21 = 0LL;
        do
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v16 propertyWithName:*(void *)(*((void *)&v29 + 1) + 8 * (void)v21)]);
          if (v22)
          {
            uint64_t v23 = objc_claimAutoreleasedReturnValue( +[DebugHierarchyObjectInterface valueAndOptionsForProperty:onObject:inContext:]( &OBJC_CLASS___DebugHierarchyObjectInterface,  "valueAndOptionsForProperty:onObject:inContext:",  v22,  v8,  v9));
            id v24 = v9;
            id v25 = v8;
            uint64_t v26 = (void *)v23;
            [v10 addObject:v23];

            id v8 = v25;
            id v9 = v24;
          }

          id v21 = (char *)v21 + 1;
        }

        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }

      while (v19);
    }

    id v27 = [v10 copy];
    [v9 addProperties:v27 toObject:v8];

    id v7 = v28;
  }
}

- (NSString)debugDescription
{
  objc_super v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction objectIdentifiers](self, "objectIdentifiers"));
  id v7 = [v6 count];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction propertyNames](self, "propertyNames"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", @", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p identifiers: %lu; properties: %@>",
                    v5,
                    self,
                    v7,
                    v9));

  return (NSString *)v10;
}

- (NSArray)objectIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setObjectIdentifiers:(id)a3
{
}

- (BOOL)objectIdentifiersAreExclusive
{
  return self->_objectIdentifiersAreExclusive;
}

- (void)setObjectIdentifiersAreExclusive:(BOOL)a3
{
  self->_objectIdentifiersAreExclusive = a3;
}

- (NSArray)propertyNames
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPropertyNames:(id)a3
{
}

- (BOOL)propertyNamesAreExclusive
{
  return self->_propertyNamesAreExclusive;
}

- (void)setPropertyNamesAreExclusive:(BOOL)a3
{
  self->_propertyNamesAreExclusive = a3;
}

- (NSArray)types
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setTypes:(id)a3
{
}

- (BOOL)typesAreExclusive
{
  return self->_typesAreExclusive;
}

- (void)setTypesAreExclusive:(BOOL)a3
{
  self->_typesAreExclusive = a3;
}

- (NSArray)exactTypes
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setExactTypes:(id)a3
{
}

- (BOOL)exactTypesAreExclusive
{
  return self->_exactTypesAreExclusive;
}

- (void)setExactTypesAreExclusive:(BOOL)a3
{
  self->_exactTypesAreExclusive = a3;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(int64_t)a3
{
  self->_visibility = a3;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (int64_t)optionsComparisonStyle
{
  return self->_optionsComparisonStyle;
}

- (void)setOptionsComparisonStyle:(int64_t)a3
{
  self->_optionsComparisonStyle = a3;
}

- (void).cxx_destruct
{
}

@end