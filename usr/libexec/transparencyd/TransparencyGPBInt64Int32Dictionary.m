@interface TransparencyGPBInt64Int32Dictionary
- (BOOL)getInt32:(int *)a3 forKey:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBInt64Int32Dictionary)init;
- (TransparencyGPBInt64Int32Dictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBInt64Int32Dictionary)initWithDictionary:(id)a3;
- (TransparencyGPBInt64Int32Dictionary)initWithInt32s:(const int *)a3 forKeys:(const int64_t *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndInt32sUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeInt32ForKey:(int64_t)a3;
- (void)setInt32:(int)a3 forKey:(int64_t)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBInt64Int32Dictionary

- (TransparencyGPBInt64Int32Dictionary)init
{
  return -[TransparencyGPBInt64Int32Dictionary initWithInt32s:forKeys:count:]( self,  "initWithInt32s:forKeys:count:",  0LL,  0LL,  0LL);
}

- (TransparencyGPBInt64Int32Dictionary)initWithInt32s:(const int *)a3 forKeys:(const int64_t *)a4 count:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TransparencyGPBInt64Int32Dictionary;
  v8 = -[TransparencyGPBInt64Int32Dictionary init](&v14, "init");
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
          v11 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10);
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

- (TransparencyGPBInt64Int32Dictionary)initWithDictionary:(id)a3
{
  v4 = -[TransparencyGPBInt64Int32Dictionary initWithInt32s:forKeys:count:]( self,  "initWithInt32s:forKeys:count:",  0LL,  0LL,  0LL);
  v5 = v4;
  if (a3 && v4) {
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((void *)a3 + 2));
  }
  return v5;
}

- (TransparencyGPBInt64Int32Dictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBInt64Int32Dictionary initWithInt32s:forKeys:count:]( self,  "initWithInt32s:forKeys:count:",  0LL,  0LL,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBInt64Int32Dictionary;
  -[TransparencyGPBInt64Int32Dictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBInt64Int32Dictionary initWithDictionary:]( +[TransparencyGPBInt64Int32Dictionary allocWithZone:]( &OBJC_CLASS___TransparencyGPBInt64Int32Dictionary,  "allocWithZone:",  a3),  "initWithDictionary:",  self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBInt64Int32Dictionary, a2);
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

- (void)enumerateKeysAndInt32sUsingBlock:(id)a3
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
    (*((void (**)(id, id, id, char *))a3 + 2))( a3,  [v6 longLongValue],  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6),  "intValue"),  &v7);
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
        uint64_t v14 = sub_1001147A4((unint64_t)[v11 longLongValue], 1, v8);
        uint64_t v15 = sub_100113744([v13 intValue], 2, v7) + v14;
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
      id v15 = [v13 longLongValue];
      id v16 = [v14 intValue];
      int v17 = sub_1001147A4((unint64_t)v15, 1, v8);
      objc_msgSend(a3, "writeInt32NoTag:", sub_100113744(v16, 2, v7) + v17);
      sub_100114940(a3, (uint64_t)v15, 1LL, v8);
      sub_1001138E0(a3, (uint64_t)v16, 2LL, v7);
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
  v3[2] = sub_1001216B8;
  v3[3] = &unk_100282F08;
  v3[4] = a3;
  -[TransparencyGPBInt64Int32Dictionary enumerateKeysAndInt32sUsingBlock:]( self,  "enumerateKeysAndInt32sUsingBlock:",  v3);
}

- (BOOL)getInt32:(int *)a3 forKey:(int64_t)a4
{
  id v5 = -[NSMutableDictionary objectForKey:]( self->_dictionary,  "objectForKey:",  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  id v6 = v5;
  if (a3 && v5) {
    *a3 = [v5 intValue];
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

- (void)setInt32:(int)a3 forKey:(int64_t)a4
{
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)removeInt32ForKey:(int64_t)a3
{
}

- (void)removeAll
{
}

@end