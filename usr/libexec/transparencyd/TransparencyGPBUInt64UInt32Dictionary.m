@interface TransparencyGPBUInt64UInt32Dictionary
- (BOOL)getUInt32:(unsigned int *)a3 forKey:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBUInt64UInt32Dictionary)init;
- (TransparencyGPBUInt64UInt32Dictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBUInt64UInt32Dictionary)initWithDictionary:(id)a3;
- (TransparencyGPBUInt64UInt32Dictionary)initWithUInt32s:(const unsigned int *)a3 forKeys:(const unint64_t *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndUInt32sUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeUInt32ForKey:(unint64_t)a3;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)setUInt32:(unsigned int)a3 forKey:(unint64_t)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBUInt64UInt32Dictionary

- (TransparencyGPBUInt64UInt32Dictionary)init
{
  return -[TransparencyGPBUInt64UInt32Dictionary initWithUInt32s:forKeys:count:]( self,  "initWithUInt32s:forKeys:count:",  0LL,  0LL,  0LL);
}

- (TransparencyGPBUInt64UInt32Dictionary)initWithUInt32s:(const unsigned int *)a3 forKeys:(const unint64_t *)a4 count:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TransparencyGPBUInt64UInt32Dictionary;
  v8 = -[TransparencyGPBUInt64UInt32Dictionary init](&v14, "init");
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
          unsigned int v10 = *a3++;
          v11 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10);
          uint64_t v12 = *a4++;
          -[NSMutableDictionary setObject:forKey:]( dictionary,  "setObject:forKey:",  v11,  +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v12));
          --a5;
        }

        while (a5);
      }
    }
  }

  return v8;
}

- (TransparencyGPBUInt64UInt32Dictionary)initWithDictionary:(id)a3
{
  v4 = -[TransparencyGPBUInt64UInt32Dictionary initWithUInt32s:forKeys:count:]( self,  "initWithUInt32s:forKeys:count:",  0LL,  0LL,  0LL);
  v5 = v4;
  if (a3 && v4) {
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((void *)a3 + 2));
  }
  return v5;
}

- (TransparencyGPBUInt64UInt32Dictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBUInt64UInt32Dictionary initWithUInt32s:forKeys:count:]( self,  "initWithUInt32s:forKeys:count:",  0LL,  0LL,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBUInt64UInt32Dictionary;
  -[TransparencyGPBUInt64UInt32Dictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBUInt64UInt32Dictionary initWithDictionary:]( +[TransparencyGPBUInt64UInt32Dictionary allocWithZone:]( &OBJC_CLASS___TransparencyGPBUInt64UInt32Dictionary,  "allocWithZone:",  a3),  "initWithDictionary:",  self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBUInt64UInt32Dictionary, a2);
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

- (void)enumerateKeysAndUInt32sUsingBlock:(id)a3
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
    (*((void (**)(id, id, id, char *))a3 + 2))( a3,  [v6 unsignedLongLongValue],  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6),  "unsignedIntValue"),  &v7);
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
        uint64_t v14 = sub_100113F88((unint64_t)[v11 unsignedLongLongValue], 1, v8);
        uint64_t v15 = sub_100112F20([v13 unsignedIntValue], 2, v7) + v14;
        v12 += v15 + sub_10010E104(v15);
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
      id v15 = [v13 unsignedLongLongValue];
      id v16 = [v14 unsignedIntValue];
      LODWORD(v14) = sub_100113F88((unint64_t)v15, 1, v8);
      objc_msgSend(a3, "writeInt32NoTag:", sub_100112F20(v16, 2, v7) + v14);
      if (v8 == 4)
      {
        [a3 writeFixed64:1 value:v15];
      }

      else if (v8 == 12)
      {
        [a3 writeUInt64:1 value:v15];
      }

      if (v7 == 1)
      {
        [a3 writeFixed32:2 value:v16];
      }

      else if (v7 == 11)
      {
        [a3 writeUInt32:2 value:v16];
      }

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
  v3[2] = sub_10011C544;
  v3[3] = &unk_100282DA0;
  v3[4] = a3;
  -[TransparencyGPBUInt64UInt32Dictionary enumerateKeysAndUInt32sUsingBlock:]( self,  "enumerateKeysAndUInt32sUsingBlock:",  v3);
}

- (BOOL)getUInt32:(unsigned int *)a3 forKey:(unint64_t)a4
{
  id v5 = -[NSMutableDictionary objectForKey:]( self->_dictionary,  "objectForKey:",  +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  id v6 = v5;
  if (a3 && v5) {
    *a3 = [v5 unsignedIntValue];
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

- (void)setUInt32:(unsigned int)a3 forKey:(unint64_t)a4
{
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)removeUInt32ForKey:(unint64_t)a3
{
}

- (void)removeAll
{
}

@end