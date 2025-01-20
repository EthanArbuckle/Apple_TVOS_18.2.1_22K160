@interface MPFilter
+ (id)filterWithFilterID:(id)a3;
- (MPFilter)init;
- (MPFilter)initWithFilterID:(id)a3;
- (NSString)filterID;
- (NSString)presetID;
- (id)animationPathForKey:(id)a3;
- (id)animationPaths;
- (id)convertMCAttributeToMPAttribute:(id)a3 withKey:(id)a4;
- (id)convertMPAttributeToMCAttribute:(id)a3 withKey:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)filter;
- (id)filterAttributeForKey:(id)a3;
- (id)filterAttributes;
- (id)fullDebugLog;
- (id)parent;
- (id)parentDocument;
- (int64_t)index;
- (void)copyAnimationPaths:(id)a3;
- (void)copyStruct:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)removeAnimationPathForKey:(id)a3;
- (void)setAnimationPath:(id)a3 forKey:(id)a4;
- (void)setDefaults;
- (void)setFilter:(id)a3;
- (void)setFilterAttribute:(id)a3 forKey:(id)a4;
- (void)setFilterID:(id)a3;
- (void)setParent:(id)a3;
- (void)setPresetID:(id)a3;
@end

@implementation MPFilter

+ (id)filterWithFilterID:(id)a3
{
  return [objc_alloc((Class)a1) initWithFilterID:a3];
}

- (MPFilter)initWithFilterID:(id)a3
{
  v4 = -[MPFilter init](self, "init");
  v5 = v4;
  if (v4)
  {
    -[MPFilterInternal setFilterID:](v4->_internal, "setFilterID:", a3);
    -[MPFilterInternal setPresetID:](v5->_internal, "setPresetID:", @"Default");
    -[MPFilter setDefaults](v5, "setDefaults");
  }

  return v5;
}

- (MPFilter)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPFilter;
  v2 = -[MPFilter init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___MPFilterInternal);
    v2->_internal = v3;
    -[MPFilterInternal setFilterID:](v3, "setFilterID:", 0LL);
    -[MPFilterInternal setPresetID:](v2->_internal, "setPresetID:", 0LL);
    v2->_attributes = 0LL;
    v2->_animationPaths = 0LL;
    v2->_filter = 0LL;
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  [v4 copyStruct:self->_internal];
  [v4 copyAnimationPaths:self->_animationPaths];
  return v4;
}

- (id)description
{
  v3 = -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"==================================== Filter ====================================\n"),  "stringByAppendingFormat:",  @"\t                     Filter ID: %@\n",  -[MPFilter filterID](self, "filterID")),  "stringByAppendingFormat:",  @"\t                     Preset ID: %@\n",  -[MPFilter presetID](self, "presetID"));
  if (self->_filter) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  return -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"\t                    Has Filter: %@\n",  v4);
}

- (void)dealloc
{
  filter = self->_filter;
  if (filter)
  {

    self->_filter = 0LL;
  }

  self->_internal = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPFilter;
  -[MPFilter dealloc](&v4, "dealloc");
}

- (NSString)filterID
{
  return -[MPFilterInternal filterID](self->_internal, "filterID");
}

- (void)setFilterID:(id)a3
{
  filter = self->_filter;
  if (filter) {
    -[MCFilter setFilterID:](filter, "setFilterID:", a3);
  }
}

- (NSString)presetID
{
  return -[MPFilterInternal presetID](self->_internal, "presetID");
}

- (void)setPresetID:(id)a3
{
  filter = self->_filter;
  if (filter) {
    -[MCFilter setAttribute:forKey:](filter, "setAttribute:forKey:", a3, @"PresetID");
  }
}

- (id)filterAttributes
{
  return self->_attributes;
}

- (id)filterAttributeForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", a3);
}

- (void)setFilterAttribute:(id)a3 forKey:(id)a4
{
  attributes = self->_attributes;
  if (!attributes)
  {
    attributes = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    self->_attributes = attributes;
  }

  -[NSMutableDictionary setObject:forKey:](attributes, "setObject:forKey:", a3, a4);
  if (self->_filter)
  {
    id v8 = -[MPFilter convertMPAttributeToMCAttribute:withKey:](self, "convertMPAttributeToMCAttribute:withKey:", a3, a4);
    id v9 = objc_msgSend( -[MCFilter attributeForKey:](self->_filter, "attributeForKey:", @"specificAttributes"),  "mutableCopy");
    [v9 setValue:v8 forKey:a4];
    -[MCFilter setAttribute:forKey:](self->_filter, "setAttribute:forKey:", v9, @"specificAttributes");
  }

- (id)animationPaths
{
  return self->_animationPaths;
}

- (id)animationPathForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", a3);
}

- (void)setAnimationPath:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    if (!self->_animationPaths) {
      self->_animationPaths = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v7 = -[MPFilter animationPathForKey:](self, "animationPathForKey:", a4);
    if (v7)
    {
      id v8 = v7;
      [v7 setParent:0];
      [v8 setAnimationPath:0];
    }

    [a3 setParent:self];
    -[NSMutableDictionary setObject:forKey:](self->_animationPaths, "setObject:forKey:", a3, a4);
    filter = self->_filter;
    if (filter)
    {
      -[MCFilter removeAnimationPathForKey:](filter, "removeAnimationPathForKey:", a4);
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___MPAnimationPathCombo, v10);
      char isKindOfClass = objc_opt_isKindOfClass(a3, v11);
      v13 = off_24C620;
      if ((isKindOfClass & 1) == 0) {
        v13 = off_24C628;
      }
      id v14 = -[__objc2_class animationPathWithKey:](*v13, "animationPathWithKey:", a4);
      -[MCFilter addAnimationPath:](self->_filter, "addAnimationPath:", v14);
      [a3 setAnimationPath:v14];
    }
  }

  else
  {
    -[MPFilter removeAnimationPathForKey:](self, "removeAnimationPathForKey:", a4);
  }

- (void)removeAnimationPathForKey:(id)a3
{
  if (self->_animationPaths)
  {
    id v5 = -[MPFilter animationPathForKey:](self, "animationPathForKey:");
    filter = self->_filter;
    if (filter)
    {
      -[MCFilter removeAnimationPathForKey:](filter, "removeAnimationPathForKey:", a3);
      [v5 setAnimationPath:0];
    }

    [v5 setParent:0];
    -[NSMutableDictionary removeObjectForKey:](self->_animationPaths, "removeObjectForKey:", a3);
  }

- (int64_t)index
{
  parent = self->_parent;
  if (parent) {
    return (int64_t)objc_msgSend(-[MPFilterSupport filters](parent, "filters"), "indexOfObject:", self);
  }
  else {
    return -1LL;
  }
}

- (id)parent
{
  return self->_parent;
}

- (id)filter
{
  return self->_filter;
}

- (void)dump
{
}

- (id)fullDebugLog
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n%@\n",  -[MPFilter description](self, "description"));
}

- (void)setDefaults
{
  id v3 = +[MPUtilities defaultAttributesForMPFilter:](&OBJC_CLASS___MPUtilities, "defaultAttributesForMPFilter:", self);
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[MPFilter setFilterAttribute:forKey:]( self,  "setFilterAttribute:forKey:",  [v3 objectForKey:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)],  *(void *)(*((void *)&v8 + 1) + 8 * (void)v7));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

- (id)convertMPAttributeToMCAttribute:(id)a3 withKey:(id)a4
{
  parent = self->_parent;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MPSlide, a2);
  objc_opt_isKindOfClass(parent, v6);
  return a3;
}

- (id)convertMCAttributeToMPAttribute:(id)a3 withKey:(id)a4
{
  parent = self->_parent;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MPSlide, a2);
  objc_opt_isKindOfClass(parent, v6);
  return a3;
}

- (void)copyStruct:(id)a3
{
}

- (void)copyAnimationPaths:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        id v10 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v9), "copy");
        -[MPFilter setAnimationPath:forKey:](self, "setAnimationPath:forKey:", v10, v9);
      }

      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

- (void)setFilter:(id)a3
{
  filter = self->_filter;
  if (filter)
  {

    self->_filter = 0LL;
  }

  id v6 = (MCFilter *)a3;
  self->_filter = v6;
  if (v6)
  {
    -[MCFilter setFilterID:](self->_filter, "setFilterID:", -[MPFilter filterID](self, "filterID"));
    -[MCFilter setAttribute:forKey:]( self->_filter,  "setAttribute:forKey:",  -[MPFilter presetID](self, "presetID"),  @"PresetID");
    id v7 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    id v8 = -[MPFilter filterAttributes](self, "filterAttributes");
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend( v7,  "setObject:forKey:",  -[MPFilter convertMPAttributeToMCAttribute:withKey:]( self,  "convertMPAttributeToMCAttribute:withKey:",  objc_msgSend(v8, "objectForKey:", *(void *)(*((void *)&v37 + 1) + 8 * (void)i)),  *(void *)(*((void *)&v37 + 1) + 8 * (void)i)),  *(void *)(*((void *)&v37 + 1) + 8 * (void)i));
        }

        id v10 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }

      while (v10);
    }

    -[MCFilter setAttribute:forKey:](self->_filter, "setAttribute:forKey:", v7, @"specificAttributes");
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    animationPaths = self->_animationPaths;
    id v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v33,  v42,  16LL);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v34;
      do
      {
        for (j = 0LL; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(animationPaths);
          }
          uint64_t v18 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)j);
          id v19 = -[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", v18);
          uint64_t v21 = objc_opt_class(&OBJC_CLASS___MPAnimationPathCombo, v20);
          if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0) {
            v22 = off_24C620;
          }
          else {
            v22 = off_24C628;
          }
          id v23 = -[__objc2_class animationPathWithKey:](*v22, "animationPathWithKey:", v18);
          -[MCFilter addAnimationPath:](self->_filter, "addAnimationPath:", v23);
          [v19 setAnimationPath:v23];
        }

        id v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v33,  v42,  16LL);
      }

      while (v15);
    }
  }

  else
  {
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    v24 = self->_animationPaths;
    id v25 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v29,  v41,  16LL);
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v30;
      do
      {
        for (k = 0LL; k != v26; k = (char *)k + 1)
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(v24);
          }
          objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_animationPaths,  "objectForKey:",  *(void *)(*((void *)&v29 + 1) + 8 * (void)k)),  "setAnimationPath:",  0);
        }

        id v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v29,  v41,  16LL);
      }

      while (v26);
    }
  }

- (void)setParent:(id)a3
{
  if (a3 && self->_parent)
  {
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"ManyToOneException",  @"A filter may one have one parent.  Please remove it first.  This is unsupported.",  0LL));
    -[MPFilter parentDocument](v3, v4);
  }

  else
  {
    self->_parent = (MPFilterSupport *)a3;
  }

- (id)parentDocument
{
  parent = self->_parent;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MPSlide, a2);
  char isKindOfClass = objc_opt_isKindOfClass(parent, v4);
  id v7 = self->_parent;
  if ((isKindOfClass & 1) != 0)
  {
    id v8 = (MPFilterSupport *)-[MPFilterSupport parentEffect](self->_parent, "parentEffect");
LABEL_6:
    __int128 v12 = (MPFilterSupport *)objc_msgSend(-[MPFilterSupport parentContainer](v8, "parentContainer"), "parentLayer");
    return -[MPFilterSupport parentDocument](v12, "parentDocument");
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MPLayer, v6);
  char v10 = objc_opt_isKindOfClass(v7, v9);
  __int128 v12 = self->_parent;
  if ((v10 & 1) != 0) {
    return -[MPFilterSupport parentDocument](v12, "parentDocument");
  }
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___MPEffect, v11);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
  {
    id v8 = self->_parent;
    goto LABEL_6;
  }

  return 0LL;
}

@end