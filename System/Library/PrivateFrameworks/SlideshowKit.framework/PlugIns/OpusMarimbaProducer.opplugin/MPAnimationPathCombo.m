@interface MPAnimationPathCombo
+ (id)animationPath;
- (MPAnimationPathCombo)init;
- (NSString)key;
- (NSString)operation;
- (id)animationPathForKey:(id)a3;
- (id)animationPaths;
- (id)copyWithZone:(_NSZone *)a3;
- (void)cleanup;
- (void)copyAnimationPaths:(id)a3;
- (void)dealloc;
- (void)removeAnimationPathForKey:(id)a3;
- (void)setAnimationPath:(id)a3;
- (void)setAnimationPath:(id)a3 forKey:(id)a4;
- (void)setKey:(id)a3;
- (void)setOperation:(id)a3;
@end

@implementation MPAnimationPathCombo

+ (id)animationPath
{
  return objc_alloc_init(&OBJC_CLASS___MPAnimationPathCombo);
}

- (MPAnimationPathCombo)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPAnimationPathCombo;
  v2 = -[MPAnimationPath init](&v4, "init");
  if (v2)
  {
    v2->_animationPaths = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->_key = 0LL;
    v2->_operation = 0LL;
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MPAnimationPathCombo;
  id v4 = -[MPAnimationPath copyWithZone:](&v6, "copyWithZone:", a3);
  [v4 copyAnimationPaths:self->_animationPaths];
  objc_msgSend(v4, "setOperation:", -[NSString copy](self->_operation, "copy"));
  objc_msgSend(v4, "setKey:", -[NSString copy](self->_key, "copy"));
  return v4;
}

- (void)dealloc
{
  self->_animationPaths = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPAnimationPathCombo;
  -[MPAnimationPath dealloc](&v3, "dealloc");
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
    id v7 = -[MPAnimationPathCombo animationPathForKey:](self, "animationPathForKey:", a4);
    if (v7)
    {
      v8 = v7;
      id v9 = objc_msgSend(-[MPAnimationPath parentDocument](self, "parentDocument"), "undoManager");
      if (v9) {
        objc_msgSend(objc_msgSend(v9, "prepareWithInvocationTarget:", self), "setAnimationPath:forKey:", v8, a4);
      }
      [v8 setParent:0];
      [v8 setAnimationPath:0];
    }

    [a3 setParent:self];
    -[NSMutableDictionary setObject:forKey:](self->_animationPaths, "setObject:forKey:", a3, a4);
    animationPath = self->super._animationPath;
    if (animationPath)
    {
      -[MCAnimationPath removeAnimationPathForKey:](animationPath, "removeAnimationPathForKey:", a4);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___MPAnimationPathCombo, v11);
      char isKindOfClass = objc_opt_isKindOfClass(a3, v12);
      v14 = off_24C620;
      if ((isKindOfClass & 1) == 0) {
        v14 = off_24C628;
      }
      id v15 = -[__objc2_class animationPathWithKey:](*v14, "animationPathWithKey:", a4);
      -[MCAnimationPath addAnimationPath:](self->super._animationPath, "addAnimationPath:", v15);
      [a3 setAnimationPath:v15];
    }
  }

  else
  {
    -[MPAnimationPathCombo removeAnimationPathForKey:](self, "removeAnimationPathForKey:", a4);
  }

- (void)removeAnimationPathForKey:(id)a3
{
  id v5 = -[MPAnimationPathCombo animationPathForKey:](self, "animationPathForKey:");
  id v6 = objc_msgSend(-[MPAnimationPath parentDocument](self, "parentDocument"), "undoManager");
  if (v6) {
    objc_msgSend(objc_msgSend(v6, "prepareWithInvocationTarget:", self), "setAnimationPath:forKey:", v5, a3);
  }
  animationPath = self->super._animationPath;
  if (animationPath)
  {
    -[MCAnimationPath removeAnimationPathForKey:](animationPath, "removeAnimationPathForKey:", a3);
    [v5 setAnimationPath:0];
  }

  [v5 setParent:0];
  -[NSMutableDictionary removeObjectForKey:](self->_animationPaths, "removeObjectForKey:", a3);
}

- (void)setOperation:(id)a3
{
  operation = self->_operation;
  if (operation)
  {

    self->_operation = 0LL;
  }

  self->_operation = (NSString *)[a3 copy];
  animationPath = self->super._animationPath;
  if (animationPath) {
    -[MCAnimationPath setCombineOperation:](animationPath, "setCombineOperation:", a3);
  }
}

- (NSString)key
{
  if (!objc_msgSend( -[MPAnimationPath parent](self, "parent"),  "conformsToProtocol:",  &OBJC_PROTOCOL___MPAnimationSupport)) {
    return -[MPAnimationPathCombo key](self, "key");
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPAnimationPathCombo;
  return (NSString *)-[MPAnimationPath key](&v4, "key");
}

- (void)setKey:(id)a3
{
  if ((objc_msgSend( -[MPAnimationPath parent](self, "parent"),  "conformsToProtocol:",  &OBJC_PROTOCOL___MPAnimationSupport) & 1) == 0)
  {
    key = self->_key;
    if (key)
    {

      self->_key = 0LL;
    }

    id v6 = (NSString *)[a3 copy];
    self->_key = v6;
    animationPath = self->super._animationPath;
    if (animationPath) {
      -[MCAnimationPath setKey:](animationPath, "setKey:", v6);
    }
  }

- (NSString)operation
{
  return self->_operation;
}

- (void)cleanup
{
  id v3 = -[NSMutableDictionary allKeys](self->_animationPaths, "allKeys");
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
        -[MPAnimationPathCombo removeAnimationPathForKey:]( self,  "removeAnimationPathForKey:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

- (void)setAnimationPath:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MPAnimationPathCombo;
  -[MPAnimationPath setAnimationPath:](&v29, "setAnimationPath:", a3);
  if (self->super._animationPath)
  {
    -[MCAnimationPath setCombineOperation:]( self->super._animationPath,  "setCombineOperation:",  -[MPAnimationPathCombo operation](self, "operation"));
    if ((objc_msgSend( -[MPAnimationPath parent](self, "parent"),  "conformsToProtocol:",  &OBJC_PROTOCOL___MPAnimationSupport) & 1) == 0) {
      -[MCAnimationPath setKey:](self->super._animationPath, "setKey:", -[MPAnimationPathCombo key](self, "key"));
    }
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    obj = self->_animationPaths;
    id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v25,  v31,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v26 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
          id v9 = -[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", v8);
          uint64_t v11 = objc_opt_class(&OBJC_CLASS___MPAnimationPathCombo, v10);
          if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0) {
            uint64_t v12 = off_24C620;
          }
          else {
            uint64_t v12 = off_24C628;
          }
          id v13 = -[__objc2_class animationPathWithKey:](*v12, "animationPathWithKey:", v8);
          [v9 setAnimationPath:v13];
          -[MCAnimationPath addAnimationPath:](self->super._animationPath, "addAnimationPath:", v13);
        }

        id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v25,  v31,  16LL);
      }

      while (v5);
    }
  }

  else
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    animationPaths = self->_animationPaths;
    id v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v21,  v30,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (j = 0LL; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(animationPaths);
          }
          uint64_t v19 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)j);
          objc_msgSend( -[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", v19),  "setAnimationPath:",  0);
          -[MCAnimationPath removeAnimationPathForKey:](self->super._animationPath, "removeAnimationPathForKey:", v19);
        }

        id v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v21,  v30,  16LL);
      }

      while (v16);
    }
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
        -[MPAnimationPathCombo setAnimationPath:forKey:](self, "setAnimationPath:forKey:", v10, v9);
      }

      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

@end