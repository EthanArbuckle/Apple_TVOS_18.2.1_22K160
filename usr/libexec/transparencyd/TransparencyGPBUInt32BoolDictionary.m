@interface TransparencyGPBUInt32BoolDictionary
- (BOOL)getBool:(BOOL *)a3 forKey:(unsigned int)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBUInt32BoolDictionary)init;
- (TransparencyGPBUInt32BoolDictionary)initWithBools:(const BOOL *)a3 forKeys:(const unsigned int *)a4 count:(unint64_t)a5;
- (TransparencyGPBUInt32BoolDictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBUInt32BoolDictionary)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndBoolsUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeBoolForKey:(unsigned int)a3;
- (void)setBool:(BOOL)a3 forKey:(unsigned int)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBUInt32BoolDictionary

- (TransparencyGPBUInt32BoolDictionary)init
{
  return -[TransparencyGPBUInt32BoolDictionary initWithBools:forKeys:count:]( self,  "initWithBools:forKeys:count:",  0LL,  0LL,  0LL);
}

- (TransparencyGPBUInt32BoolDictionary)initWithBools:(const BOOL *)a3 forKeys:(const unsigned int *)a4 count:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TransparencyGPBUInt32BoolDictionary;
  v8 = -[TransparencyGPBUInt32BoolDictionary init](&v14, "init");
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
          unsigned int v10 = *(unsigned __int8 *)a3++;
          v11 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10);
          unsigned int v12 = *a4++;
          -[NSMutableDictionary setObject:forKey:]( dictionary,  "setObject:forKey:",  v11,  +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v12));
          --a5;
        }

        while (a5);
      }
    }
  }

  return v8;
}

- (TransparencyGPBUInt32BoolDictionary)initWithDictionary:(id)a3
{
  v4 = -[TransparencyGPBUInt32BoolDictionary initWithBools:forKeys:count:]( self,  "initWithBools:forKeys:count:",  0LL,  0LL,  0LL);
  v5 = v4;
  if (a3 && v4) {
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((void *)a3 + 2));
  }
  return v5;
}

- (TransparencyGPBUInt32BoolDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBUInt32BoolDictionary initWithBools:forKeys:count:]( self,  "initWithBools:forKeys:count:",  0LL,  0LL,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBUInt32BoolDictionary;
  -[TransparencyGPBUInt32BoolDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBUInt32BoolDictionary initWithDictionary:]( +[TransparencyGPBUInt32BoolDictionary allocWithZone:]( &OBJC_CLASS___TransparencyGPBUInt32BoolDictionary,  "allocWithZone:",  a3),  "initWithDictionary:",  self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBUInt32BoolDictionary, a2);
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

- (void)enumerateKeysAndBoolsUsingBlock:(id)a3
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
    (*((void (**)(id, id, id, char *))a3 + 2))( a3,  [v6 unsignedIntValue],  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6),  "BOOLValue"),  &v7);
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
        uint64_t v13 = sub_100112F20([v10 unsignedIntValue], 1, v7);
        [v12 BOOLValue];
        uint64_t v14 = sub_10010FAAC(2) + v13;
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
      id v14 = [v12 unsignedIntValue];
      id v15 = [v13 BOOLValue];
      LODWORD(v13) = sub_100112F20(v14, 1, v7);
      [a3 writeInt32NoTag:sub_10010FAAC(2) + v13];
      if (v7 == 1)
      {
        [a3 writeFixed32:1 value:v14];
      }

      else if (v7 == 11)
      {
        [a3 writeUInt32:1 value:v14];
      }

      [a3 writeBool:2 value:v15];
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
  v3[2] = sub_1001151B0;
  v3[3] = &unk_100282BC0;
  v3[4] = a3;
  -[TransparencyGPBUInt32BoolDictionary enumerateKeysAndBoolsUsingBlock:](self, "enumerateKeysAndBoolsUsingBlock:", v3);
}

- (BOOL)getBool:(BOOL *)a3 forKey:(unsigned int)a4
{
  id v5 = -[NSMutableDictionary objectForKey:]( self->_dictionary,  "objectForKey:",  +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", *(void *)&a4));
  id v6 = v5;
  if (a3 && v5) {
    *a3 = [v5 BOOLValue];
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

- (void)setBool:(BOOL)a3 forKey:(unsigned int)a4
{
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)removeBoolForKey:(unsigned int)a3
{
}

- (void)removeAll
{
}

@end