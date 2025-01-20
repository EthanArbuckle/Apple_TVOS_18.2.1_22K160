@interface TransparencyGPBStringUInt64Dictionary
- (BOOL)getUInt64:(unint64_t *)a3 forKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBStringUInt64Dictionary)init;
- (TransparencyGPBStringUInt64Dictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBStringUInt64Dictionary)initWithDictionary:(id)a3;
- (TransparencyGPBStringUInt64Dictionary)initWithUInt64s:(const unint64_t *)a3 forKeys:(id *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndUInt64sUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeUInt64ForKey:(id)a3;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)setUInt64:(unint64_t)a3 forKey:(id)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBStringUInt64Dictionary

- (TransparencyGPBStringUInt64Dictionary)init
{
  return -[TransparencyGPBStringUInt64Dictionary initWithUInt64s:forKeys:count:]( self,  "initWithUInt64s:forKeys:count:",  0LL,  0LL,  0LL);
}

- (TransparencyGPBStringUInt64Dictionary)initWithUInt64s:(const unint64_t *)a3 forKeys:(id *)a4 count:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TransparencyGPBStringUInt64Dictionary;
  v8 = -[TransparencyGPBStringUInt64Dictionary init](&v14, "init");
  if (v8)
  {
    v8->_dictionary = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (a4)
    {
      if (a3 && a5)
      {
        do
        {
          if (!*a4) {
            +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Attempting to add nil key to a Dictionary");
          }
          dictionary = v8->_dictionary;
          uint64_t v10 = *a3++;
          v11 = +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v10);
          uint64_t v12 = (uint64_t)*a4++;
          -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v11, v12);
          --a5;
        }

        while (a5);
      }
    }
  }

  return v8;
}

- (TransparencyGPBStringUInt64Dictionary)initWithDictionary:(id)a3
{
  v4 = -[TransparencyGPBStringUInt64Dictionary initWithUInt64s:forKeys:count:]( self,  "initWithUInt64s:forKeys:count:",  0LL,  0LL,  0LL);
  v5 = v4;
  if (a3 && v4) {
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((void *)a3 + 2));
  }
  return v5;
}

- (TransparencyGPBStringUInt64Dictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBStringUInt64Dictionary initWithUInt64s:forKeys:count:]( self,  "initWithUInt64s:forKeys:count:",  0LL,  0LL,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBStringUInt64Dictionary;
  -[TransparencyGPBStringUInt64Dictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBStringUInt64Dictionary initWithDictionary:]( +[TransparencyGPBStringUInt64Dictionary allocWithZone:]( &OBJC_CLASS___TransparencyGPBStringUInt64Dictionary,  "allocWithZone:",  a3),  "initWithDictionary:",  self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class(0x1002D9000LL, a2);
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

- (void)enumerateKeysAndUInt64sUsingBlock:(id)a3
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
    (*((void (**)(id, id, id, char *))a3 + 2))( a3,  v6,  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6),  "unsignedLongLongValue"),  &v7);
  }

  while (!v7);
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  dictionary = self->_dictionary;
  unint64_t result = (unint64_t)-[NSMutableDictionary count](dictionary, "count");
  if (result)
  {
    unint64_t v6 = result;
    int v7 = *(unsigned __int8 *)(*((void *)a3 + 1) + 30LL);
    [a3 mapKeyDataType];
    id v8 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
    id v9 = [v8 nextObject];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = 0LL;
      do
      {
        id v12 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v10);
        v13 = sub_10010FAF8(1, v10);
        objc_super v14 = &v13[sub_100113F88((unint64_t)[v12 unsignedLongLongValue], 2, v7)];
        v11 += (uint64_t)&v14[sub_10010E104(v14)];
        id v10 = [v8 nextObject];
      }

      while (v10);
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    return v11 + sub_10010FFE0(*(_DWORD *)(*((void *)a3 + 1) + 16LL), 15) * v6;
  }

  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  int v7 = *(unsigned __int8 *)(*((void *)a4 + 1) + 30LL);
  [a4 mapKeyDataType];
  uint64_t v8 = sub_10013B0C8(*(_DWORD *)(*((void *)a4 + 1) + 16LL), 2);
  dictionary = self->_dictionary;
  id v10 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  id v11 = [v10 nextObject];
  if (v11)
  {
    id v12 = v11;
    do
    {
      id v13 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v12);
      [a3 writeInt32NoTag:v8];
      id v14 = [v13 unsignedLongLongValue];
      unsigned int v15 = sub_10010FAF8(1, v12);
      objc_msgSend(a3, "writeInt32NoTag:", sub_100113F88((unint64_t)v14, 2, v7) + v15);
      [a3 writeString:1 value:v12];
      if (v7 == 4)
      {
        [a3 writeFixed64:2 value:v14];
      }

      else if (v7 == 12)
      {
        [a3 writeUInt64:2 value:v14];
      }

      id v12 = [v10 nextObject];
    }

    while (v12);
  }

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001265EC;
  v3[3] = &unk_100283070;
  v3[4] = a3;
  -[TransparencyGPBStringUInt64Dictionary enumerateKeysAndUInt64sUsingBlock:]( self,  "enumerateKeysAndUInt64sUsingBlock:",  v3);
}

- (BOOL)getUInt64:(unint64_t *)a3 forKey:(id)a4
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a4);
  id v6 = v5;
  if (a3 && v5) {
    *a3 = (unint64_t)[v5 unsignedLongLongValue];
  }
  return v6 != 0LL;
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

- (void)setUInt64:(unint64_t)a3 forKey:(id)a4
{
  if (!a4) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Attempting to add nil key to a Dictionary");
  }
  -[NSMutableDictionary setObject:forKey:]( self->_dictionary,  "setObject:forKey:",  +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3),  a4);
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)removeUInt64ForKey:(id)a3
{
}

- (void)removeAll
{
}

@end