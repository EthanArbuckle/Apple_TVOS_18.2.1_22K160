@interface TransparencyGPBUInt32ObjectDictionary
- (BOOL)isEqual:(id)a3;
- (BOOL)isInitialized;
- (TransparencyGPBUInt32ObjectDictionary)init;
- (TransparencyGPBUInt32ObjectDictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBUInt32ObjectDictionary)initWithDictionary:(id)a3;
- (TransparencyGPBUInt32ObjectDictionary)initWithObjects:(const void *)a3 forKeys:(const unsigned int *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deepCopyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectForKey:(unsigned int)a3;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeObjectForKey:(unsigned int)a3;
- (void)setObject:(id)a3 forKey:(unsigned int)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBUInt32ObjectDictionary

- (TransparencyGPBUInt32ObjectDictionary)init
{
  return -[TransparencyGPBUInt32ObjectDictionary initWithObjects:forKeys:count:]( self,  "initWithObjects:forKeys:count:",  0LL,  0LL,  0LL);
}

- (TransparencyGPBUInt32ObjectDictionary)initWithObjects:(const void *)a3 forKeys:(const unsigned int *)a4 count:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TransparencyGPBUInt32ObjectDictionary;
  v8 = -[TransparencyGPBUInt32ObjectDictionary init](&v12, "init");
  if (v8)
  {
    v8->_dictionary = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (a4)
    {
      if (a3 && a5)
      {
        do
        {
          v9 = *a3;
          if (!*a3)
          {
            +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Attempting to add nil object to a Dictionary");
            v9 = *a3;
          }

          unsigned int v10 = *a4++;
          -[NSMutableDictionary setObject:forKey:]( v8->_dictionary,  "setObject:forKey:",  v9,  +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10));
          ++a3;
          --a5;
        }

        while (a5);
      }
    }
  }

  return v8;
}

- (TransparencyGPBUInt32ObjectDictionary)initWithDictionary:(id)a3
{
  v4 = -[TransparencyGPBUInt32ObjectDictionary initWithObjects:forKeys:count:]( self,  "initWithObjects:forKeys:count:",  0LL,  0LL,  0LL);
  v5 = v4;
  if (a3 && v4) {
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((void *)a3 + 2));
  }
  return v5;
}

- (TransparencyGPBUInt32ObjectDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBUInt32ObjectDictionary initWithObjects:forKeys:count:]( self,  "initWithObjects:forKeys:count:",  0LL,  0LL,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBUInt32ObjectDictionary;
  -[TransparencyGPBUInt32ObjectDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBUInt32ObjectDictionary initWithDictionary:]( +[TransparencyGPBUInt32ObjectDictionary allocWithZone:]( &OBJC_CLASS___TransparencyGPBUInt32ObjectDictionary,  "allocWithZone:",  a3),  "initWithDictionary:",  self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBUInt32ObjectDictionary, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0) {
    return -[NSMutableDictionary isEqual:](self->_dictionary, "isEqual:", *((void *)a3 + 2));
  }
  else {
    return 0;
  }
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableDictionary count](self->_dictionary, "count");
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p> { %@ }",  objc_opt_class(self, a2),  self,  self->_dictionary);
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableDictionary count](self->_dictionary, "count");
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  char v7 = 0;
  dictionary = self->_dictionary;
  id v5 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  do
  {
    id v6 = [v5 nextObject];
    if (!v6) {
      break;
    }
    (*((void (**)(id, id, id, char *))a3 + 2))( a3,  [v6 unsignedIntValue],  -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6),  &v7);
  }

  while (!v7);
}

- (BOOL)isInitialized
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = -[NSMutableDictionary objectEnumerator](self->_dictionary, "objectEnumerator", 0LL);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0LL;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      unsigned int v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) isInitialized];
      if (!v7) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (id)deepCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___TransparencyGPBUInt32ObjectDictionary);
  id v6 = -[NSMutableDictionary keyEnumerator](self->_dictionary, "keyEnumerator");
  dictionary = v5->_dictionary;
  id v8 = [v6 nextObject];
  if (v8)
  {
    id v9 = v8;
    do
    {
      id v10 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v9),  "copyWithZone:",  a3);
      -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v10, v9);

      id v9 = [v6 nextObject];
    }

    while (v9);
  }

  return v5;
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  dictionary = self->_dictionary;
  unint64_t result = (unint64_t)-[NSMutableDictionary count](dictionary, "count");
  if (result)
  {
    unint64_t v6 = result;
    int v7 = *(unsigned __int8 *)(*((void *)a3 + 1) + 30LL);
    int v8 = [a3 mapKeyDataType];
    id v9 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
    id v10 = [v9 nextObject];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = 0LL;
      do
      {
        id v13 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v11);
        uint64_t v14 = sub_100112F20([v11 unsignedIntValue], 1, v8);
        v15 = &sub_1001124C8(v13, v7)[v14];
        v12 += (uint64_t)&v15[sub_10010E104(v15)];
        id v11 = [v9 nextObject];
      }

      while (v11);
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    return v12 + sub_10010FFE0(*(_DWORD *)(*((void *)a3 + 1) + 16LL), 15) * v6;
  }

  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  int v7 = *(unsigned __int8 *)(*((void *)a4 + 1) + 30LL);
  int v8 = [a4 mapKeyDataType];
  uint64_t v9 = sub_10013B0C8(*(_DWORD *)(*((void *)a4 + 1) + 16LL), 2);
  dictionary = self->_dictionary;
  id v11 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  id v12 = [v11 nextObject];
  if (v12)
  {
    id v13 = v12;
    do
    {
      id v14 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v13);
      [a3 writeInt32NoTag:v9];
      id v15 = [v13 unsignedIntValue];
      int v16 = sub_100112F20(v15, 1, v8);
      objc_msgSend(a3, "writeInt32NoTag:", sub_1001124C8(v14, v7) + v16);
      if (v8 == 1)
      {
        [a3 writeFixed32:1 value:v15];
      }

      else if (v8 == 11)
      {
        [a3 writeUInt32:1 value:v15];
      }

      sub_1001125F8(a3, (const char *)v14, v7);
      id v13 = [v11 nextObject];
    }

    while (v13);
  }

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001174EC;
  v3[3] = &unk_100282C38;
  v3[4] = a3;
  -[TransparencyGPBUInt32ObjectDictionary enumerateKeysAndObjectsUsingBlock:]( self,  "enumerateKeysAndObjectsUsingBlock:",  v3);
}

- (id)objectForKey:(unsigned int)a3
{
  return -[NSMutableDictionary objectForKey:]( self->_dictionary,  "objectForKey:",  +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", *(void *)&a3));
}

- (void)addEntriesFromDictionary:(id)a3
{
  if (a3)
  {
    -[NSMutableDictionary addEntriesFromDictionary:]( self->_dictionary,  "addEntriesFromDictionary:",  *((void *)a3 + 2));
    autocreator = self->_autocreator;
    if (autocreator) {
      sub_10012DFA8(autocreator, (uint64_t)self);
    }
  }

- (void)setObject:(id)a3 forKey:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!a3) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Attempting to add nil object to a Dictionary");
  }
  -[NSMutableDictionary setObject:forKey:]( self->_dictionary,  "setObject:forKey:",  a3,  +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)removeObjectForKey:(unsigned int)a3
{
}

- (void)removeAll
{
}

@end