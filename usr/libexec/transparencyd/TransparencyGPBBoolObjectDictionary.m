@interface TransparencyGPBBoolObjectDictionary
- (BOOL)isEqual:(id)a3;
- (BOOL)isInitialized;
- (TransparencyGPBBoolObjectDictionary)init;
- (TransparencyGPBBoolObjectDictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBBoolObjectDictionary)initWithDictionary:(id)a3;
- (TransparencyGPBBoolObjectDictionary)initWithObjects:(const void *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deepCopyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectForKey:(BOOL)a3;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeObjectForKey:(BOOL)a3;
- (void)setObject:(id)a3 forKey:(BOOL)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBBoolObjectDictionary

- (TransparencyGPBBoolObjectDictionary)init
{
  return -[TransparencyGPBBoolObjectDictionary initWithObjects:forKeys:count:]( self,  "initWithObjects:forKeys:count:",  0LL,  0LL,  0LL);
}

- (TransparencyGPBBoolObjectDictionary)initWithObjects:(const void *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TransparencyGPBBoolObjectDictionary;
  v8 = -[TransparencyGPBBoolObjectDictionary init](&v16, "init");
  v9 = v8;
  if (v8) {
    BOOL v10 = a5 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    values = v8->_values;
    do
    {
      if (!*a3) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Attempting to add nil object to a Dictionary");
      }
      unsigned int v13 = *(unsigned __int8 *)a4++;
      uint64_t v12 = v13;

      v14 = (void *)*a3++;
      values[v12] = v14;
      --a5;
    }

    while (a5);
  }

  return v9;
}

- (TransparencyGPBBoolObjectDictionary)initWithDictionary:(id)a3
{
  v4 = -[TransparencyGPBBoolObjectDictionary initWithObjects:forKeys:count:]( self,  "initWithObjects:forKeys:count:",  0LL,  0LL,  0LL);
  v5 = v4;
  if (a3 && v4)
  {
    v4->_values[0] = *((id *)a3 + 2);
    v5->_values[1] = *((id *)a3 + 3);
  }

  return v5;
}

- (TransparencyGPBBoolObjectDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBBoolObjectDictionary initWithObjects:forKeys:count:]( self,  "initWithObjects:forKeys:count:",  0LL,  0LL,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBBoolObjectDictionary;
  -[TransparencyGPBBoolObjectDictionary dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBBoolObjectDictionary initWithDictionary:]( +[TransparencyGPBBoolObjectDictionary allocWithZone:]( &OBJC_CLASS___TransparencyGPBBoolObjectDictionary,  "allocWithZone:",  a3),  "initWithDictionary:",  self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v8) = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBBoolObjectDictionary, a2);
    if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0
      || (id v6 = self->_values[0], (v6 != 0LL) == (*((void *)a3 + 2) == 0LL))
      || (id v7 = self->_values[1], (v7 == 0LL) == (*((void *)a3 + 3) != 0LL)))
    {
      LOBYTE(v8) = 0;
      return v8;
    }

    if (v6)
    {
      unsigned int v8 = objc_msgSend(self->_values[0], "isEqual:");
      if (!v8) {
        return v8;
      }
      id v7 = self->_values[1];
    }
  }

  return v8;
}

- (unint64_t)hash
{
  if (self->_values[0]) {
    return (self->_values[1] != 0LL) + 1LL;
  }
  else {
    return self->_values[1] != 0LL;
  }
}

- (id)description
{
  objc_super v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p> {",  objc_opt_class(self, a2),  self);
  v4 = v3;
  if (self->_values[0]) {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"NO: %@", self->_values[0]);
  }
  if (self->_values[1]) {
    -[NSMutableString appendFormat:](v4, "appendFormat:", @"YES: %@", self->_values[1]);
  }
  -[NSMutableString appendString:](v4, "appendString:", @" }");
  return v4;
}

- (unint64_t)count
{
  if (self->_values[0]) {
    return (self->_values[1] != 0LL) + 1LL;
  }
  else {
    return self->_values[1] != 0LL;
  }
}

- (id)objectForKey:(BOOL)a3
{
  return self->_values[a3];
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  uint64_t v5 = (id *)&(&self->super.isa)[a4->var0];

  v5[2] = a3->var7;
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_values[0]) {
    (*((void (**)(id, const __CFString *))a3 + 2))(a3, @"false");
  }
  if (self->_values[1]) {
    (*((void (**)(id, const __CFString *))a3 + 2))(a3, @"true");
  }
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  char v7 = 0;
  id v5 = self->_values[0];
  if (!v5 || ((*((void (**)(id, void, id, char *))a3 + 2))(a3, 0LL, v5, &v7), !v7))
  {
    id v6 = self->_values[1];
    if (v6) {
      (*((void (**)(id, uint64_t, id, char *))a3 + 2))(a3, 1LL, v6, &v7);
    }
  }

- (BOOL)isInitialized
{
  id v3 = self->_values[0];
  if (!v3 || (unsigned int v4 = [v3 isInitialized]) != 0)
  {
    id v5 = self->_values[1];
  }

  return v4;
}

- (id)deepCopyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___TransparencyGPBBoolObjectDictionary);
  uint64_t v6 = 0LL;
  values = self->_values;
  char v8 = 1;
  do
  {
    char v9 = v8;
    id v10 = values[v6];
    if (v10) {
      v5->_values[v6] = [v10 copyWithZone:a3];
    }
    char v8 = 0;
    uint64_t v6 = 1LL;
  }

  while ((v9 & 1) != 0);
  return v5;
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v3 = 0LL;
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  uint64_t v6 = *((void *)a3 + 1);
  int v7 = *(unsigned __int8 *)(v6 + 30);
  values = self->_values;
  char v9 = 1;
  do
  {
    char v10 = v9;
    id v11 = values[v3];
    if (v11)
    {
      ++v4;
      uint64_t v12 = sub_10010FAAC(1);
      unsigned int v13 = sub_1001124C8(v11, v7);
      v5 += (uint64_t)&v13[v12 + sub_10010E104((int)v13 + (int)v12)];
    }

    char v9 = 0;
    uint64_t v3 = 1LL;
  }

  while ((v10 & 1) != 0);
  return v5 + sub_10010FFE0(*(_DWORD *)(v6 + 16), 15) * v4;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  uint64_t v6 = *((void *)a4 + 1);
  int v7 = *(unsigned __int8 *)(v6 + 30);
  uint64_t v8 = sub_10013B0C8(*(_DWORD *)(v6 + 16), 2);
  char v9 = 0;
  uint64_t v10 = 0LL;
  values = self->_values;
  char v12 = 1;
  do
  {
    char v13 = v12;
    if (values[v10])
    {
      [a3 writeInt32NoTag:v8];
      uint64_t v14 = v9 & 1;
      int v15 = sub_10010FAAC(1);
      objc_msgSend(a3, "writeInt32NoTag:", sub_1001124C8(values[v10], v7) + v15);
      [a3 writeBool:1 value:v14];
      sub_1001125F8(a3, (const char *)values[v10], v7);
    }

    char v12 = 0;
    char v9 = 1;
    uint64_t v10 = 1LL;
  }

  while ((v13 & 1) != 0);
}

- (void)addEntriesFromDictionary:(id)a3
{
  if (a3)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = (char *)a3 + 16;
    values = self->_values;
    char v7 = 1;
    do
    {
      char v8 = v7;
      if (*(void *)&v5[8 * v4])
      {

        values[v4] = *(id *)&v5[8 * v4];
      }

      char v7 = 0;
      uint64_t v4 = 1LL;
    }

    while ((v8 & 1) != 0);
    autocreator = self->_autocreator;
    if (autocreator) {
      sub_10012DFA8(autocreator, (uint64_t)self);
    }
  }

- (void)setObject:(id)a3 forKey:(BOOL)a4
{
  BOOL v4 = a4;
  if (!a3) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Attempting to add nil object to a Dictionary");
  }
  char v7 = (id *)&(&self->super.isa)[v4];

  v7[2] = a3;
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)removeObjectForKey:(BOOL)a3
{
  uint64_t v3 = (id *)&(&self->super.isa)[a3];

  v3[2] = 0LL;
}

- (void)removeAll
{
  self->_values[0] = 0LL;

  self->_values[1] = 0LL;
}

@end