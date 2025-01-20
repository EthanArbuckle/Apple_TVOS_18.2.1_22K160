@interface TransparencyGPBAutocreatedDictionary
- (TransparencyGPBAutocreatedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (unint64_t)count;
- (void)dealloc;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation TransparencyGPBAutocreatedDictionary

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBAutocreatedDictionary;
  -[TransparencyGPBAutocreatedDictionary dealloc](&v3, "dealloc");
}

- (TransparencyGPBAutocreatedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TransparencyGPBAutocreatedDictionary;
  v8 = -[TransparencyGPBAutocreatedDictionary init](&v10, "init");
  if (v8) {
    v8->_dictionary = -[NSMutableDictionary initWithObjects:forKeys:count:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjects:forKeys:count:",  a3,  a4,  a5);
  }
  return v8;
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableDictionary count](self->_dictionary, "count");
}

- (id)objectForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

- (id)keyEnumerator
{
  dictionary = self->_dictionary;
  if (!dictionary)
  {
    dictionary = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    self->_dictionary = dictionary;
  }

  return -[NSMutableDictionary keyEnumerator](dictionary, "keyEnumerator");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  dictionary = self->_dictionary;
  if (!dictionary)
  {
    dictionary = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    self->_dictionary = dictionary;
  }

  -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", a3, a4);
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)removeObjectForKey:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  dictionary = self->_dictionary;
  if (dictionary) {
    return -[NSMutableDictionary copyWithZone:](dictionary, "copyWithZone:", a3);
  }
  else {
    return -[NSMutableDictionary init]( +[NSMutableDictionary allocWithZone:](&OBJC_CLASS___NSMutableDictionary, "allocWithZone:", a3),  "init");
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  dictionary = self->_dictionary;
  if (dictionary) {
    return -[NSMutableDictionary mutableCopyWithZone:](dictionary, "mutableCopyWithZone:", a3);
  }
  else {
    return -[NSMutableDictionary init]( +[NSMutableDictionary allocWithZone:](&OBJC_CLASS___NSMutableDictionary, "allocWithZone:", a3),  "init");
  }
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", a3);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  dictionary = self->_dictionary;
  if (!dictionary)
  {
    dictionary = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    self->_dictionary = dictionary;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](dictionary, "setObject:forKeyedSubscript:", a3, a4);
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

@end