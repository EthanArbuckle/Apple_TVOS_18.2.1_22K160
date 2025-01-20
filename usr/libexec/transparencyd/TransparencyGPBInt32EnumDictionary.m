@interface TransparencyGPBInt32EnumDictionary
- (BOOL)getEnum:(int *)a3 forKey:(int)a4;
- (BOOL)getRawValue:(int *)a3 forKey:(int)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBInt32EnumDictionary)init;
- (TransparencyGPBInt32EnumDictionary)initWithDictionary:(id)a3;
- (TransparencyGPBInt32EnumDictionary)initWithValidationFunction:(void *)a3;
- (TransparencyGPBInt32EnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4;
- (TransparencyGPBInt32EnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const int *)a5 count:(unint64_t)a6;
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
- (void)removeEnumForKey:(int)a3;
- (void)setEnum:(int)a3 forKey:(int)a4;
- (void)setRawValue:(int)a3 forKey:(int)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)validationFunc;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBInt32EnumDictionary

- (TransparencyGPBInt32EnumDictionary)init
{
  return -[TransparencyGPBInt32EnumDictionary initWithValidationFunction:rawValues:forKeys:count:]( self,  "initWithValidationFunction:rawValues:forKeys:count:",  0LL,  0LL,  0LL,  0LL);
}

- (TransparencyGPBInt32EnumDictionary)initWithValidationFunction:(void *)a3
{
  return -[TransparencyGPBInt32EnumDictionary initWithValidationFunction:rawValues:forKeys:count:]( self,  "initWithValidationFunction:rawValues:forKeys:count:",  a3,  0LL,  0LL,  0LL);
}

- (TransparencyGPBInt32EnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const int *)a5 count:(unint64_t)a6
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TransparencyGPBInt32EnumDictionary;
  v10 = -[TransparencyGPBInt32EnumDictionary init](&v18, "init");
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
        dictionary = v10->_dictionary;
        unsigned int v14 = *a4++;
        v15 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v14);
        unsigned int v16 = *a5++;
        -[NSMutableDictionary setObject:forKey:]( dictionary,  "setObject:forKey:",  v15,  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v16));
        --a6;
      }

      while (a6);
    }
  }

  return v10;
}

- (TransparencyGPBInt32EnumDictionary)initWithDictionary:(id)a3
{
  v4 = -[TransparencyGPBInt32EnumDictionary initWithValidationFunction:rawValues:forKeys:count:]( self,  "initWithValidationFunction:rawValues:forKeys:count:",  [a3 validationFunc],  0,  0,  0);
  v5 = v4;
  if (a3 && v4) {
    -[NSMutableDictionary addEntriesFromDictionary:](v4->_dictionary, "addEntriesFromDictionary:", *((void *)a3 + 2));
  }
  return v5;
}

- (TransparencyGPBInt32EnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  return -[TransparencyGPBInt32EnumDictionary initWithValidationFunction:rawValues:forKeys:count:]( self,  "initWithValidationFunction:rawValues:forKeys:count:",  a3,  0LL,  0LL,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBInt32EnumDictionary;
  -[TransparencyGPBInt32EnumDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBInt32EnumDictionary initWithDictionary:]( +[TransparencyGPBInt32EnumDictionary allocWithZone:]( &OBJC_CLASS___TransparencyGPBInt32EnumDictionary,  "allocWithZone:",  a3),  "initWithDictionary:",  self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBInt32EnumDictionary, a2);
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
    (*((void (**)(id, id, id, char *))a3 + 2))( a3,  [v6 intValue],  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6),  "intValue"),  &v7);
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
        uint64_t v13 = sub_100113744([v10 intValue], 1, v7);
        uint64_t v14 = sub_10010FA10(2, [v12 intValue]) + v13;
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
      id v14 = [v12 intValue];
      id v15 = [v13 intValue];
      int v16 = sub_100113744(v14, 1, v7);
      objc_msgSend(a3, "writeInt32NoTag:", sub_10010FA10(2, v15) + v16);
      sub_1001138E0(a3, (uint64_t)v14, 1LL, v7);
      [a3 writeEnum:2 value:v15];
      id v12 = [v10 nextObject];
    }

    while (v12);
  }

- (id)serializedDataForUnknownValue:(int)a3 forKey:(id *)a4 keyDataType:(unsigned __int8)a5
{
  int v5 = a5;
  uint64_t v7 = *(void *)&a3;
  uint64_t v8 = sub_100113744(a4->var1, 1, a5);
  id v9 = +[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", sub_10010FA10(2, v7) + v8);
  id v10 = -[TransparencyGPBCodedOutputStream initWithData:]( objc_alloc(&OBJC_CLASS___TransparencyGPBCodedOutputStream),  "initWithData:",  v9);
  sub_1001138E0(v10, a4->var3, 1LL, v5);
  -[TransparencyGPBCodedOutputStream writeEnum:value:](v10, "writeEnum:value:", 2LL, v7);

  return v9;
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10011B274;
  v3[3] = &unk_100282C88;
  v3[4] = a3;
  -[TransparencyGPBInt32EnumDictionary enumerateKeysAndRawValuesUsingBlock:]( self,  "enumerateKeysAndRawValuesUsingBlock:",  v3);
}

- (BOOL)getEnum:(int *)a3 forKey:(int)a4
{
  id v6 = -[NSMutableDictionary objectForKey:]( self->_dictionary,  "objectForKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(void *)&a4));
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

- (BOOL)getRawValue:(int *)a3 forKey:(int)a4
{
  id v5 = -[NSMutableDictionary objectForKey:]( self->_dictionary,  "objectForKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(void *)&a4));
  id v6 = v5;
  if (a3 && v5) {
    *a3 = [v5 intValue];
  }
  return v6 != 0LL;
}

- (void)enumerateKeysAndEnumsUsingBlock:(id)a3
{
  char v10 = 0;
  validationFunc = (unsigned int (*)(void))self->_validationFunc;
  id v6 = -[NSMutableDictionary keyEnumerator](self->_dictionary, "keyEnumerator");
  do
  {
    id v7 = [v6 nextObject];
    if (!v7) {
      break;
    }
    unsigned int v8 = v7;
    LODWORD(v9) = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_dictionary,  "objectForKeyedSubscript:",  v7),  "intValue");
    uint64_t v9 = validationFunc() ? v9 : 4222467823LL;
    (*((void (**)(id, id, uint64_t, char *))a3 + 2))(a3, [v8 intValue], v9, &v10);
  }

  while (!v10);
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

- (void)setRawValue:(int)a3 forKey:(int)a4
{
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)removeEnumForKey:(int)a3
{
}

- (void)removeAll
{
}

- (void)setEnum:(int)a3 forKey:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if ((((uint64_t (*)(void, SEL))self->_validationFunc)(*(void *)&a3, a2) & 1) == 0) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"TransparencyGPBInt32EnumDictionary: Attempt to set an unknown enum value (%d)",  v5);
  }
  -[NSMutableDictionary setObject:forKey:]( self->_dictionary,  "setObject:forKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5),  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
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