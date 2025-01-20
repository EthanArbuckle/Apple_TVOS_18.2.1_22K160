@interface TransparencyGPBStringFloatDictionary
- (BOOL)getFloat:(float *)a3 forKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBStringFloatDictionary)init;
- (TransparencyGPBStringFloatDictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBStringFloatDictionary)initWithDictionary:(id)a3;
- (TransparencyGPBStringFloatDictionary)initWithFloats:(const float *)a3 forKeys:(id *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndFloatsUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeFloatForKey:(id)a3;
- (void)setFloat:(float)a3 forKey:(id)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBStringFloatDictionary

- (TransparencyGPBStringFloatDictionary)init
{
  return -[TransparencyGPBStringFloatDictionary initWithFloats:forKeys:count:]( self,  "initWithFloats:forKeys:count:",  0LL,  0LL,  0LL);
}

- (TransparencyGPBStringFloatDictionary)initWithFloats:(const float *)a3 forKeys:(id *)a4 count:(unint64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TransparencyGPBStringFloatDictionary;
  v8 = -[TransparencyGPBStringFloatDictionary init](&v15, "init");
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
          int v11 = *(_DWORD *)a3++;
          LODWORD(v9) = v11;
          v12 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v9);
          uint64_t v13 = (uint64_t)*a4++;
          -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v12, v13);
          --a5;
        }

        while (a5);
      }
    }
  }

  return v8;
}

- (TransparencyGPBStringFloatDictionary)initWithDictionary:(id)a3
{
  v4 = -[TransparencyGPBStringFloatDictionary initWithFloats:forKeys:count:]( self,  "initWithFloats:forKeys:count:",  0LL,  0LL,  0LL);
  v5 = v4;
  if (a3 && v4) {
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((void *)a3 + 2));
  }
  return v5;
}

- (TransparencyGPBStringFloatDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBStringFloatDictionary initWithFloats:forKeys:count:]( self,  "initWithFloats:forKeys:count:",  0LL,  0LL,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBStringFloatDictionary;
  -[TransparencyGPBStringFloatDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBStringFloatDictionary initWithDictionary:]( +[TransparencyGPBStringFloatDictionary allocWithZone:]( &OBJC_CLASS___TransparencyGPBStringFloatDictionary,  "allocWithZone:",  a3),  "initWithDictionary:",  self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBStringFloatDictionary, a2);
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

- (void)enumerateKeysAndFloatsUsingBlock:(id)a3
{
  char v8 = 0;
  dictionary = self->_dictionary;
  id v5 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  do
  {
    id v6 = [v5 nextObject];
    if (!v6) {
      break;
    }
    id v7 = v6;
    objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6),  "floatValue");
    (*((void (**)(id, id, char *))a3 + 2))(a3, v7, &v8);
  }

  while (!v8);
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  dictionary = self->_dictionary;
  unint64_t result = (unint64_t)-[NSMutableDictionary count](dictionary, "count");
  if (result)
  {
    unint64_t v6 = result;
    [a3 mapKeyDataType];
    id v7 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
    id v8 = [v7 nextObject];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = 0LL;
      do
      {
        id v11 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v9);
        v12 = sub_10010FAF8(1, v9);
        [v11 floatValue];
        uint64_t v13 = &v12[sub_10010F960(2)];
        v10 += (uint64_t)&v13[sub_10010E104(v13)];
        id v9 = [v7 nextObject];
      }

      while (v9);
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    return v10 + sub_10010FFE0(*(_DWORD *)(*((void *)a3 + 1) + 16LL), 15) * v6;
  }

  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  uint64_t v7 = sub_10013B0C8(*(_DWORD *)(*((void *)a4 + 1) + 16LL), 2);
  dictionary = self->_dictionary;
  id v9 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  id v10 = [v9 nextObject];
  if (v10)
  {
    id v11 = v10;
    do
    {
      id v12 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v11);
      [a3 writeInt32NoTag:v7];
      [v12 floatValue];
      int v14 = v13;
      LODWORD(v12) = sub_10010FAF8(1, v11);
      [a3 writeInt32NoTag:sub_10010F960(2) + v12];
      [a3 writeString:1 value:v11];
      LODWORD(v15) = v14;
      [a3 writeFloat:2 value:v15];
      id v11 = [v9 nextObject];
    }

    while (v11);
  }

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  LODWORD(v4) = a3->var1;
  -[NSMutableDictionary setObject:forKey:]( self->_dictionary,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v4),  a4->var2);
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100127AD4;
  v3[3] = &unk_1002830E8;
  v3[4] = a3;
  -[TransparencyGPBStringFloatDictionary enumerateKeysAndFloatsUsingBlock:]( self,  "enumerateKeysAndFloatsUsingBlock:",  v3);
}

- (BOOL)getFloat:(float *)a3 forKey:(id)a4
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a4);
  id v6 = v5;
  if (a3 && v5)
  {
    [v5 floatValue];
    *(_DWORD *)a3 = v7;
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

- (void)setFloat:(float)a3 forKey:(id)a4
{
  if (!a4) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Attempting to add nil key to a Dictionary");
  }
  *(float *)&double v7 = a3;
  -[NSMutableDictionary setObject:forKey:]( self->_dictionary,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v7),  a4);
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)removeFloatForKey:(id)a3
{
}

- (void)removeAll
{
}

@end