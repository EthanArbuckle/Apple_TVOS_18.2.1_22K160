@interface TransparencyGPBAutocreatedArray
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeLastObject;
- (void)removeObject:(id)a3;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
@end

@implementation TransparencyGPBAutocreatedArray

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBAutocreatedArray;
  -[TransparencyGPBAutocreatedArray dealloc](&v3, "dealloc");
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_array, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_array, "objectAtIndex:", a3);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  array = self->_array;
  if (!array)
  {
    array = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_array = array;
  }

  -[NSMutableArray insertObject:atIndex:](array, "insertObject:atIndex:", a3, a4);
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DE40(autocreator, (uint64_t)self);
  }
}

- (void)removeObject:(id)a3
{
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
}

- (void)addObject:(id)a3
{
  array = self->_array;
  if (!array)
  {
    array = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_array = array;
  }

  -[NSMutableArray addObject:](array, "addObject:", a3);
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DE40(autocreator, (uint64_t)self);
  }
}

- (void)removeLastObject
{
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  array = self->_array;
  if (array) {
    return -[NSMutableArray copyWithZone:](array, "copyWithZone:", a3);
  }
  else {
    return -[NSMutableArray init]( +[NSMutableArray allocWithZone:](&OBJC_CLASS___NSMutableArray, "allocWithZone:", a3),  "init");
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  array = self->_array;
  if (array) {
    return -[NSMutableArray mutableCopyWithZone:](array, "mutableCopyWithZone:", a3);
  }
  else {
    return -[NSMutableArray init]( +[NSMutableArray allocWithZone:](&OBJC_CLASS___NSMutableArray, "allocWithZone:", a3),  "init");
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)-[NSMutableArray countByEnumeratingWithState:objects:count:]( self->_array,  "countByEnumeratingWithState:objects:count:",  a3,  a4,  a5);
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

@end