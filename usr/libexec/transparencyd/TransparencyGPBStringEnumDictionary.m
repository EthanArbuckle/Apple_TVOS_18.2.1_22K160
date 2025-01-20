@interface TransparencyGPBStringEnumDictionary
- (BOOL)getEnum:(int *)a3 forKey:(id)a4;
- (BOOL)getRawValue:(int *)a3 forKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBStringEnumDictionary)init;
- (TransparencyGPBStringEnumDictionary)initWithDictionary:(id)a3;
- (TransparencyGPBStringEnumDictionary)initWithValidationFunction:(void *)a3;
- (TransparencyGPBStringEnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4;
- (TransparencyGPBStringEnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(id *)a5 count:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serializedDataForUnknownValue:(int)a3 forKey:(id *)a4 keyDataType:(unsigned __int8)a5;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addRawEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndEnumsUsingBlock:(id)a3;
- (void)enumerateKeysAndRawValuesUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeEnumForKey:(id)a3;
- (void)setEnum:(int)a3 forKey:(id)a4;
- (void)setRawValue:(int)a3 forKey:(id)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)validationFunc;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBStringEnumDictionary

- (TransparencyGPBStringEnumDictionary)init
{
  return -[TransparencyGPBStringEnumDictionary initWithValidationFunction:rawValues:forKeys:count:]( self,  "initWithValidationFunction:rawValues:forKeys:count:",  0LL,  0LL,  0LL,  0LL);
}

- (TransparencyGPBStringEnumDictionary)initWithValidationFunction:(void *)a3
{
  return -[TransparencyGPBStringEnumDictionary initWithValidationFunction:rawValues:forKeys:count:]( self,  "initWithValidationFunction:rawValues:forKeys:count:",  a3,  0LL,  0LL,  0LL);
}

- (TransparencyGPBStringEnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(id *)a5 count:(unint64_t)a6
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TransparencyGPBStringEnumDictionary;
  v10 = -[TransparencyGPBStringEnumDictionary init](&v18, "init");
  if (v10)
  {
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v12 = sub_1001163BC;
    if (a3) {
      v12 = a3;
    }
    v10->_dictionary = v11;
    v10->_validationFunc = v12;
    if (a5 && a4 && a6)
    {
      do
      {
        if (!*a5) {
          +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Attempting to add nil key to a Dictionary");
        }
        dictionary = v10->_dictionary;
        unsigned int v14 = *a4++;
        v15 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v14);
        uint64_t v16 = (uint64_t)*a5++;
        -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v15, v16);
        --a6;
      }

      while (a6);
    }
  }

  return v10;
}

- (TransparencyGPBStringEnumDictionary)initWithDictionary:(id)a3
{
  v4 = -[TransparencyGPBStringEnumDictionary initWithValidationFunction:rawValues:forKeys:count:]( self,  "initWithValidationFunction:rawValues:forKeys:count:",  [a3 validationFunc],  0,  0,  0);
  v5 = v4;
  if (a3 && v4) {
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((void *)a3 + 2));
  }
  return v5;
}

- (TransparencyGPBStringEnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  return -[TransparencyGPBStringEnumDictionary initWithValidationFunction:rawValues:forKeys:count:]( self,  "initWithValidationFunction:rawValues:forKeys:count:",  a3,  0LL,  0LL,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBStringEnumDictionary;
  -[TransparencyGPBStringEnumDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBStringEnumDictionary initWithDictionary:]( +[TransparencyGPBStringEnumDictionary allocWithZone:]( &OBJC_CLASS___TransparencyGPBStringEnumDictionary,  "allocWithZone:",  a3),  "initWithDictionary:",  self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBStringEnumDictionary, a2);
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

- (void)enumerateKeysAndRawValuesUsingBlock:(id)a3
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
    (*((void (**)(id, id, id, char *))a3 + 2))( a3,  v6,  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6),  "intValue"),  &v7);
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
        v13 = &v12[sub_10010FA10(2, [v11 intValue])];
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
      id v13 = [v12 intValue];
      unsigned int v14 = sub_10010FAF8(1, v11);
      objc_msgSend(a3, "writeInt32NoTag:", sub_10010FA10(2, v13) + v14);
      [a3 writeString:1 value:v11];
      [a3 writeEnum:2 value:v13];
      id v11 = [v9 nextObject];
    }

    while (v11);
  }

- (id)serializedDataForUnknownValue:(int)a3 forKey:(id *)a4 keyDataType:(unsigned __int8)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v7 = sub_10010FAF8(1, a4->var7);
  id v8 = +[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", &v7[sub_10010FA10(2, v6)]);
  id v9 = -[TransparencyGPBCodedOutputStream initWithData:]( objc_alloc(&OBJC_CLASS___TransparencyGPBCodedOutputStream),  "initWithData:",  v8);
  -[TransparencyGPBCodedOutputStream writeString:value:](v9, "writeString:value:", 1LL, a4->var2);
  -[TransparencyGPBCodedOutputStream writeEnum:value:](v9, "writeEnum:value:", 2LL, v6);

  return v8;
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001289C0;
  v3[3] = &unk_100283048;
  v3[4] = a3;
  -[TransparencyGPBStringEnumDictionary enumerateKeysAndRawValuesUsingBlock:]( self,  "enumerateKeysAndRawValuesUsingBlock:",  v3);
}

- (BOOL)getEnum:(int *)a3 forKey:(id)a4
{
  id v6 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a4);
  id v7 = v6;
  if (a3 && v6)
  {
    unsigned int v8 = [v6 intValue];
    else {
      int v9 = -72499473;
    }
    *a3 = v9;
  }

  return v7 != 0LL;
}

- (BOOL)getRawValue:(int *)a3 forKey:(id)a4
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a4);
  id v6 = v5;
  if (a3 && v5) {
    *a3 = [v5 intValue];
  }
  return v6 != 0LL;
}

- (void)enumerateKeysAndEnumsUsingBlock:(id)a3
{
  char v11 = 0;
  validationFunc = (unsigned int (*)(void))self->_validationFunc;
  id v6 = -[NSMutableDictionary keyEnumerator](self->_dictionary, "keyEnumerator");
  do
  {
    id v7 = [v6 nextObject];
    if (!v7) {
      break;
    }
    id v8 = v7;
    unsigned int v9 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_dictionary,  "objectForKeyedSubscript:",  v7),  "intValue");
    uint64_t v10 = validationFunc() ? v9 : 4222467823LL;
    (*((void (**)(id, id, uint64_t, char *))a3 + 2))(a3, v8, v10, &v11);
  }

  while (!v11);
}

- (void)addRawEntriesFromDictionary:(id)a3
{
  if (a3)
  {
    -[NSMutableDictionary addEntriesFromDictionary:]( self->_dictionary,  "addEntriesFromDictionary:",  *((void *)a3 + 2));
    autocreator = self->_autocreator;
    if (autocreator) {
      sub_10012DFA8(autocreator, (uint64_t)self);
    }
  }

- (void)setRawValue:(int)a3 forKey:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  if (!a4) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Attempting to add nil key to a Dictionary");
  }
  -[NSMutableDictionary setObject:forKey:]( self->_dictionary,  "setObject:forKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5),  a4);
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)removeEnumForKey:(id)a3
{
}

- (void)removeAll
{
}

- (void)setEnum:(int)a3 forKey:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  if (!a4) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Attempting to add nil key to a Dictionary");
  }
  if ((((uint64_t (*)(uint64_t, SEL))self->_validationFunc)(v5, a2) & 1) == 0) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"TransparencyGPBStringEnumDictionary: Attempt to set an unknown enum value (%d)",  v5);
  }
  -[NSMutableDictionary setObject:forKey:]( self->_dictionary,  "setObject:forKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5),  a4);
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)validationFunc
{
  return self->_validationFunc;
}

@end