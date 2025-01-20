@interface TransparencyGPBUInt64FloatDictionary
- (BOOL)getFloat:(float *)a3 forKey:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBUInt64FloatDictionary)init;
- (TransparencyGPBUInt64FloatDictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBUInt64FloatDictionary)initWithDictionary:(id)a3;
- (TransparencyGPBUInt64FloatDictionary)initWithFloats:(const float *)a3 forKeys:(const unint64_t *)a4 count:(unint64_t)a5;
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
- (void)removeFloatForKey:(unint64_t)a3;
- (void)setFloat:(float)a3 forKey:(unint64_t)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBUInt64FloatDictionary

- (TransparencyGPBUInt64FloatDictionary)init
{
  return -[TransparencyGPBUInt64FloatDictionary initWithFloats:forKeys:count:]( self,  "initWithFloats:forKeys:count:",  0LL,  0LL,  0LL);
}

- (TransparencyGPBUInt64FloatDictionary)initWithFloats:(const float *)a3 forKeys:(const unint64_t *)a4 count:(unint64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TransparencyGPBUInt64FloatDictionary;
  v8 = -[TransparencyGPBUInt64FloatDictionary init](&v15, "init");
  if (v8)
  {
    v8->_dictionary = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (a4)
    {
      if (a3 && a5)
      {
        do
        {
          dictionary = v8->_dictionary;
          int v11 = *(_DWORD *)a3++;
          LODWORD(v9) = v11;
          v12 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v9);
          uint64_t v13 = *a4++;
          -[NSMutableDictionary setObject:forKey:]( dictionary,  "setObject:forKey:",  v12,  +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v13));
          --a5;
        }

        while (a5);
      }
    }
  }

  return v8;
}

- (TransparencyGPBUInt64FloatDictionary)initWithDictionary:(id)a3
{
  v4 = -[TransparencyGPBUInt64FloatDictionary initWithFloats:forKeys:count:]( self,  "initWithFloats:forKeys:count:",  0LL,  0LL,  0LL);
  v5 = v4;
  if (a3 && v4) {
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((void *)a3 + 2));
  }
  return v5;
}

- (TransparencyGPBUInt64FloatDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBUInt64FloatDictionary initWithFloats:forKeys:count:]( self,  "initWithFloats:forKeys:count:",  0LL,  0LL,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBUInt64FloatDictionary;
  -[TransparencyGPBUInt64FloatDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBUInt64FloatDictionary initWithDictionary:]( +[TransparencyGPBUInt64FloatDictionary allocWithZone:]( &OBJC_CLASS___TransparencyGPBUInt64FloatDictionary,  "allocWithZone:",  a3),  "initWithDictionary:",  self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBUInt64FloatDictionary, a2);
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
  char v10 = 0;
  dictionary = self->_dictionary;
  id v5 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
  do
  {
    id v6 = [v5 nextObject];
    if (!v6) {
      break;
    }
    v7 = v6;
    id v8 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6);
    id v9 = [v7 unsignedLongLongValue];
    [v8 floatValue];
    (*((void (**)(id, id, char *))a3 + 2))(a3, v9, &v10);
  }

  while (!v10);
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  dictionary = self->_dictionary;
  unint64_t result = (unint64_t)-[NSMutableDictionary count](dictionary, "count");
  if (result)
  {
    unint64_t v6 = result;
    int v7 = [a3 mapKeyDataType];
    id v8 = -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
    id v9 = [v8 nextObject];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = 0LL;
      do
      {
        id v12 = -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v10);
        uint64_t v13 = sub_100113F88((unint64_t)[v10 unsignedLongLongValue], 1, v7);
        [v12 floatValue];
        uint64_t v14 = sub_10010F960(2) + v13;
        v11 += v14 + sub_10010E104(v14);
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
  int v7 = [a4 mapKeyDataType];
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
      id v14 = [v12 unsignedLongLongValue];
      [v13 floatValue];
      int v16 = v15;
      LODWORD(v13) = sub_100113F88((unint64_t)v14, 1, v7);
      [a3 writeInt32NoTag:sub_10010F960(2) + v13];
      if (v7 == 4)
      {
        [a3 writeFixed64:1 value:v14];
      }

      else if (v7 == 12)
      {
        [a3 writeUInt64:1 value:v14];
      }

      LODWORD(v17) = v16;
      [a3 writeFloat:2 value:v17];
      id v12 = [v10 nextObject];
    }

    while (v12);
  }

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  LODWORD(v4) = a3->var1;
  -[NSMutableDictionary setObject:forKey:]( self->_dictionary,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v4),  +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4->var2));
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10011EBE8;
  v3[3] = &unk_100282E68;
  v3[4] = a3;
  -[TransparencyGPBUInt64FloatDictionary enumerateKeysAndFloatsUsingBlock:]( self,  "enumerateKeysAndFloatsUsingBlock:",  v3);
}

- (BOOL)getFloat:(float *)a3 forKey:(unint64_t)a4
{
  id v5 = -[NSMutableDictionary objectForKey:]( self->_dictionary,  "objectForKey:",  +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
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

- (void)setFloat:(float)a3 forKey:(unint64_t)a4
{
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)removeFloatForKey:(unint64_t)a3
{
}

- (void)removeAll
{
}

@end