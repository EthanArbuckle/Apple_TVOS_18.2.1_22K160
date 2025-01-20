@interface TransparencyGPBInt64DoubleDictionary
- (BOOL)getDouble:(double *)a3 forKey:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBInt64DoubleDictionary)init;
- (TransparencyGPBInt64DoubleDictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBInt64DoubleDictionary)initWithDictionary:(id)a3;
- (TransparencyGPBInt64DoubleDictionary)initWithDoubles:(const double *)a3 forKeys:(const int64_t *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndDoublesUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeDoubleForKey:(int64_t)a3;
- (void)setDouble:(double)a3 forKey:(int64_t)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBInt64DoubleDictionary

- (TransparencyGPBInt64DoubleDictionary)init
{
  return -[TransparencyGPBInt64DoubleDictionary initWithDoubles:forKeys:count:]( self,  "initWithDoubles:forKeys:count:",  0LL,  0LL,  0LL);
}

- (TransparencyGPBInt64DoubleDictionary)initWithDoubles:(const double *)a3 forKeys:(const int64_t *)a4 count:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TransparencyGPBInt64DoubleDictionary;
  v8 = -[TransparencyGPBInt64DoubleDictionary init](&v14, "init");
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
          double v10 = *a3++;
          v11 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10);
          uint64_t v12 = *a4++;
          -[NSMutableDictionary setObject:forKey:]( dictionary,  "setObject:forKey:",  v11,  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v12));
          --a5;
        }

        while (a5);
      }
    }
  }

  return v8;
}

- (TransparencyGPBInt64DoubleDictionary)initWithDictionary:(id)a3
{
  v4 = -[TransparencyGPBInt64DoubleDictionary initWithDoubles:forKeys:count:]( self,  "initWithDoubles:forKeys:count:",  0LL,  0LL,  0LL);
  v5 = v4;
  if (a3 && v4) {
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((void *)a3 + 2));
  }
  return v5;
}

- (TransparencyGPBInt64DoubleDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBInt64DoubleDictionary initWithDoubles:forKeys:count:]( self,  "initWithDoubles:forKeys:count:",  0LL,  0LL,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBInt64DoubleDictionary;
  -[TransparencyGPBInt64DoubleDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBInt64DoubleDictionary initWithDictionary:]( +[TransparencyGPBInt64DoubleDictionary allocWithZone:]( &OBJC_CLASS___TransparencyGPBInt64DoubleDictionary,  "allocWithZone:",  a3),  "initWithDictionary:",  self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBInt64DoubleDictionary, a2);
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

- (void)enumerateKeysAndDoublesUsingBlock:(id)a3
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
    id v9 = [v7 longLongValue];
    [v8 doubleValue];
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
        uint64_t v13 = sub_1001147A4((unint64_t)[v10 longLongValue], 1, v7);
        [v12 doubleValue];
        uint64_t v14 = sub_10010F8C8(2) + v13;
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
      id v14 = [v12 longLongValue];
      [v13 doubleValue];
      double v16 = v15;
      LODWORD(v13) = sub_1001147A4((unint64_t)v14, 1, v7);
      [a3 writeInt32NoTag:sub_10010F8C8(2) + v13];
      sub_100114940(a3, (uint64_t)v14, 1LL, v7);
      [a3 writeDouble:2 value:v16];
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
  v3[2] = sub_100123CA0;
  v3[3] = &unk_100282FD0;
  v3[4] = a3;
  -[TransparencyGPBInt64DoubleDictionary enumerateKeysAndDoublesUsingBlock:]( self,  "enumerateKeysAndDoublesUsingBlock:",  v3);
}

- (BOOL)getDouble:(double *)a3 forKey:(int64_t)a4
{
  id v5 = -[NSMutableDictionary objectForKey:]( self->_dictionary,  "objectForKey:",  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  id v6 = v5;
  if (a3 && v5)
  {
    [v5 doubleValue];
    *(void *)a3 = v7;
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

- (void)setDouble:(double)a3 forKey:(int64_t)a4
{
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)removeDoubleForKey:(int64_t)a3
{
}

- (void)removeAll
{
}

@end