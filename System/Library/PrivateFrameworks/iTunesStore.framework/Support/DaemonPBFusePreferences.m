@interface DaemonPBFusePreferences
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)preferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)preferencesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)preferencesCount;
- (void)addPreferences:(id)a3;
- (void)clearPreferences;
- (void)mergeFrom:(id)a3;
- (void)setPreferences:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DaemonPBFusePreferences

- (void)clearPreferences
{
}

- (void)addPreferences:(id)a3
{
  id v4 = a3;
  preferences = self->_preferences;
  id v8 = v4;
  if (!preferences)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_preferences;
    self->_preferences = v6;

    id v4 = v8;
    preferences = self->_preferences;
  }

  -[NSMutableArray addObject:](preferences, "addObject:", v4);
}

- (unint64_t)preferencesCount
{
  return (unint64_t)-[NSMutableArray count](self->_preferences, "count");
}

- (id)preferencesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_preferences, "objectAtIndex:", a3);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DaemonPBFusePreferences;
  id v3 = -[DaemonPBFusePreferences description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DaemonPBFusePreferences dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (-[NSMutableArray count](self->_preferences, "count"))
  {
    id v4 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_preferences, "count"));
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    v5 = self->_preferences;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v9),  "dictionaryRepresentation",  (void)v12));
          -[NSMutableArray addObject:](v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v7);
    }

    [v3 setObject:v4 forKey:@"preferences"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DaemonPBFusePreferencesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = self->_preferences;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage(v4, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9), 1LL);
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = self->_preferences;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v10), "copyWithZone:", a3, (void)v13);
        [v5 addPreferences:v11];

        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)])
  {
    preferences = self->_preferences;
    else {
      unsigned __int8 v6 = 1;
    }
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableArray hash](self->_preferences, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = *((id *)a3 + 1);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[DaemonPBFusePreferences addPreferences:]( self,  "addPreferences:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8),  (void)v9);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (NSMutableArray)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end