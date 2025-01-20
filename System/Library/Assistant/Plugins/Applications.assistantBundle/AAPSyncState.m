@interface AAPSyncState
+ (BOOL)supportsSecureCoding;
- (AAPSyncAnchor)startAnchor;
- (AAPSyncAnchor)stopAnchor;
- (AAPSyncPrimitiveAnchor)keyAnchor;
- (AAPSyncState)initWithCoder:(id)a3;
- (AAPSyncState)initWithValidity:(id)a3 version:(int64_t)a4 keyAnchor:(id)a5 startAnchor:(id)a6 stopAnchor:(id)a7 apps:(id)a8 deletes:(id)a9;
- (BOOL)isEqual:(id)a3;
- (NSArray)deletes;
- (NSSet)apps;
- (NSString)validity;
- (id)description;
- (int64_t)version;
- (unint64_t)hash;
- (void)_validate;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AAPSyncState

- (AAPSyncState)initWithValidity:(id)a3 version:(int64_t)a4 keyAnchor:(id)a5 startAnchor:(id)a6 stopAnchor:(id)a7 apps:(id)a8 deletes:(id)a9
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___AAPSyncState;
  v15 = -[AAPSyncState init](&v17, "init");
  if (v15)
  {
    v15->_validity = (NSString *)[a3 copy];
    v15->_version = a4;
    v15->_keyAnchor = (AAPSyncPrimitiveAnchor *)[a5 copy];
    v15->_startAnchor = (AAPSyncAnchor *)[a6 copy];
    v15->_stopAnchor = (AAPSyncAnchor *)[a7 copy];
    v15->_apps = (NSSet *)[a8 copy];
    v15->_deletes = (NSArray *)[a9 copy];
    -[AAPSyncState _validate](v15, "_validate");
  }

  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AAPSyncState;
  -[AAPSyncState dealloc](&v3, "dealloc");
}

- (void)_validate
{
  if (!self->_validity) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncState.m",  82LL,  @"validity cannot be nil");
  }
  if (!self->_keyAnchor) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncState.m",  83LL,  @"keyAnchor cannot be nil");
  }
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AAPSyncPrimitiveAnchor);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___AAPSyncAnchor);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSSet);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___AAPSyncMetaDataItemDelete);
  if ((objc_opt_isKindOfClass(self->_validity, v3) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncState.m",  96LL,  @"validity must be a %@",  v3);
  }
  if ((objc_opt_isKindOfClass(self->_keyAnchor, v4) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncState.m",  97LL,  @"keyAnchor must be a %@",  v4);
  }
  startAnchor = self->_startAnchor;
  if (startAnchor && (objc_opt_isKindOfClass(startAnchor, v5) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncState.m",  98LL,  @"startAnchor must be a %@",  v5);
  }
  stopAnchor = self->_stopAnchor;
  if (stopAnchor && (objc_opt_isKindOfClass(stopAnchor, v5) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncState.m",  99LL,  @"stopAnchor must be a %@",  v5);
  }
  apps = self->_apps;
  if (apps && (objc_opt_isKindOfClass(apps, v6) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncState.m",  100LL,  @"apps must be a %@",  v6);
  }
  deletes = self->_deletes;
  if (deletes && (objc_opt_isKindOfClass(deletes, v7) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncState.m",  101LL,  @"deletes must be a %@",  v7);
  }
  if (!self->_stopAnchor
    && (self->_startAnchor || -[NSSet count](self->_apps, "count") || -[NSArray count](self->_deletes, "count")))
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncState.m",  104LL,  @"there must be a stopAnchor unless there is no startAnchor and there are no apps and no deletes");
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  v13 = self->_apps;
  id v14 = -[NSSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        if ((objc_opt_isKindOfClass(*(void *)(*((void *)&v28 + 1) + 8LL * (void)i), v3) & 1) == 0) {
          -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncState.m",  108LL,  @"app must be a %@",  v3);
        }
      }

      id v15 = -[NSSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
    }

    while (v15);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  v18 = self->_deletes;
  id v19 = -[NSArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v24,  v32,  16LL);
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        if ((objc_opt_isKindOfClass(*(void *)(*((void *)&v24 + 1) + 8LL * (void)j), v8) & 1) == 0) {
          -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncState.m",  112LL,  @"delete must be a %@",  v8);
        }
      }

      id v20 = -[NSArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v24,  v32,  16LL);
    }

    while (v20);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAPSyncState)initWithCoder:(id)a3
{
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___AAPSyncAnchor);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSSet);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
  v9 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v7, v5, 0LL);
  v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v8,  objc_opt_class(&OBJC_CLASS___AAPSyncMetaDataItemDelete),  0LL);
  id v21 = [a3 decodeObjectOfClass:v5 forKey:@"validity"];
  id v20 = [a3 decodeIntegerForKey:@"version"];
  id v11 = [a3 decodeObjectOfClass:objc_opt_class(AAPSyncPrimitiveAnchor) forKey:@"keyAnchor"];
  id v12 = [a3 decodeObjectOfClass:v6 forKey:@"startAnchor"];
  id v13 = [a3 decodeObjectOfClass:v6 forKey:@"stopAnchor"];
  id v14 = [a3 decodeObjectOfClasses:v9 forKey:@"apps"];
  id v15 = [a3 decodeObjectOfClasses:v10 forKey:@"deletes"];
  apps = self->_apps;
  if (apps && (objc_opt_isKindOfClass(apps, v7) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncState.m",  152LL,  @"apps must be a %@",  v7);
  }
  deletes = self->_deletes;
  if (deletes && (objc_opt_isKindOfClass(deletes, v8) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncState.m",  153LL,  @"deletes must be a %@",  v8);
  }
  return -[AAPSyncState initWithValidity:version:keyAnchor:startAnchor:stopAnchor:apps:deletes:]( self,  "initWithValidity:version:keyAnchor:startAnchor:stopAnchor:apps:deletes:",  v21,  v20,  v11,  v12,  v13,  v14,  v15);
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_validity, "hash");
  int64_t v4 = self->_version - v3 + 32 * v3;
  uint64_t v5 = (char *)-[AAPSyncAnchor hash](self->_keyAnchor, "hash") + 32 * v4 - v4;
  int64_t v6 = (_BYTE *)-[AAPSyncAnchor hash](self->_startAnchor, "hash") - v5 + 32LL * (void)v5;
  int64_t v7 = -[AAPSyncAnchor hash](self->_stopAnchor, "hash") + 32 * v6 - v6;
  int64_t v8 = (int64_t)-[NSSet hash](self->_apps, "hash") + 32 * v7 - v7;
  return (unint64_t)-[NSArray hash](self->_deletes, "hash") + 32 * v8 - v8 + 0x6CE5F3FACFLL;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v3 = self;
  if (self == a3)
  {
    LOBYTE(self) = self != 0LL;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if (v5 != objc_opt_class(a3)) {
      goto LABEL_3;
    }
    LODWORD(self) = -[NSString isEqualToString:](v3->_validity, "isEqualToString:", [a3 validity]);
    if (!(_DWORD)self) {
      return (char)self;
    }
    id version = (id)v3->_version;
    if (version == [a3 version])
    {
      LODWORD(self) = -[AAPSyncAnchor isEqualToAnchor:]( v3->_keyAnchor,  "isEqualToAnchor:",  [a3 keyAnchor]);
      if ((_DWORD)self)
      {
        LODWORD(self) = -[AAPSyncAnchor isEqualToAnchor:]( v3->_startAnchor,  "isEqualToAnchor:",  [a3 startAnchor]);
        if ((_DWORD)self)
        {
          LODWORD(self) = -[AAPSyncAnchor isEqualToAnchor:]( v3->_stopAnchor,  "isEqualToAnchor:",  [a3 stopAnchor]);
          if ((_DWORD)self)
          {
            LODWORD(self) = -[NSSet isEqualToSet:](v3->_apps, "isEqualToSet:", [a3 apps]);
            if ((_DWORD)self) {
              LOBYTE(self) = -[NSArray isEqualToArray:](v3->_deletes, "isEqualToArray:", [a3 deletes]);
            }
          }
        }
      }
    }

    else
    {
LABEL_3:
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p validity='%@' version=%li anchors=(%@, %@]-%@> -> apps=%@ deletes=%@"),  objc_opt_class(self),  self,  self->_validity,  self->_version,  self->_startAnchor,  self->_stopAnchor,  self->_keyAnchor,  self->_apps,  self->_deletes;
}

- (NSString)validity
{
  return self->_validity;
}

- (int64_t)version
{
  return self->_version;
}

- (AAPSyncPrimitiveAnchor)keyAnchor
{
  return self->_keyAnchor;
}

- (AAPSyncAnchor)startAnchor
{
  return self->_startAnchor;
}

- (AAPSyncAnchor)stopAnchor
{
  return self->_stopAnchor;
}

- (NSSet)apps
{
  return self->_apps;
}

- (NSArray)deletes
{
  return self->_deletes;
}

@end