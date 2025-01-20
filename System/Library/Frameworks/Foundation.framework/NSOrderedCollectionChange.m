@interface NSOrderedCollectionChange
+ (NSOrderedCollectionChange)changeWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index;
+ (NSOrderedCollectionChange)changeWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index associatedIndex:(NSUInteger)associatedIndex;
- (BOOL)isEqual:(id)a3;
- (NSCollectionChangeType)changeType;
- (NSOrderedCollectionChange)initWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index;
- (NSOrderedCollectionChange)initWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index associatedIndex:(NSUInteger)associatedIndex;
- (NSUInteger)associatedIndex;
- (NSUInteger)index;
- (id)debugDescription;
- (id)init;
- (id)object;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation NSOrderedCollectionChange

- (NSOrderedCollectionChange)initWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index associatedIndex:(NSUInteger)associatedIndex
{
  v20[1] = *MEMORY[0x1895F89C0];
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NSOrderedCollectionChange;
  v10 = -[NSOrderedCollectionChange init](&v18, sel_init);
  v11 = v10;
  if (!v10) {
    return v11;
  }
  if ((unint64_t)type < 2)
  {
    v10->_object = anObject;
    v11->_changeType = type;
    v11->_index = index;
    v11->_associatedIndex = associatedIndex;
    return v11;
  }

  v13 = (void *)MEMORY[0x189603F70];
  uint64_t v14 = *MEMORY[0x189603A60];
  v19 = @"type";
  v20[0] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", type);
  objc_exception_throw((id)objc_msgSend( v13,  "exceptionWithName:reason:userInfo:",  v14,  @"Invalid type for change",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1)));
  return (NSOrderedCollectionChange *)-[NSIndexSet indexLessThanIndex:](v15, v16, v17);
}

- (NSCollectionChangeType)changeType
{
  return self->_changeType;
}

- (NSUInteger)index
{
  return self->_index;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSOrderedCollectionChange;
  -[NSOrderedCollectionChange dealloc](&v3, sel_dealloc);
}

+ (NSOrderedCollectionChange)changeWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index
{
  return (NSOrderedCollectionChange *)(id)[objc_alloc((Class)a1) initWithObject:anObject type:type index:index];
}

+ (NSOrderedCollectionChange)changeWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index associatedIndex:(NSUInteger)associatedIndex
{
  return (NSOrderedCollectionChange *)(id)[objc_alloc((Class)a1) initWithObject:anObject type:type index:index associatedIndex:associatedIndex];
}

- (id)init
{
  id v3 = objc_alloc(MEMORY[0x189603F70]);
  uint64_t v4 = *MEMORY[0x189603A58];
  Name = sel_getName(a2);
  v6 = (void *)[v3 initWithName:v4, +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Unavailable method %s called on class %@", Name, objc_opt_class()), 0 reason userInfo];
  objc_exception_throw(v6);
  return -[NSOrderedCollectionChange initWithObject:type:index:](v7, v8, v9, v10, v11);
}

- (NSOrderedCollectionChange)initWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index
{
  return -[NSOrderedCollectionChange initWithObject:type:index:associatedIndex:]( self,  "initWithObject:type:index:associatedIndex:",  anObject,  type,  index,  0x7FFFFFFFFFFFFFFFLL);
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int64_t changeType = self->_changeType;
  if (self->_object)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"of object <%@: %p> ",  NSStringFromClass(v6),  self->_object);
  }

  else
  {
    v7 = (NSString *)&stru_189CA6A28;
  }

  unint64_t index = self->_index;
  if (self->_associatedIndex == 0x7FFFFFFFFFFFFFFFLL) {
    id v9 = (NSString *)&stru_189CA6A28;
  }
  else {
    id v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" associated with index %lu",  self->_associatedIndex);
  }
  NSCollectionChangeType v10 = @"insertion";
  if (changeType == 1) {
    NSCollectionChangeType v10 = @"removal";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p>(%@ %@at index %lu%@)",  v4,  self,  v10,  v7,  index,  v9);
}

- (unint64_t)hash
{
  return self->_index ^ (self->_associatedIndex << 8) ^ (self->_changeType << 31);
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  id object = self->_object;
  if (object == *((id *)a3 + 1) || (int v6 = objc_msgSend(object, "isEqual:")) != 0)
  {
    if (self->_changeType == *((void *)a3 + 2) && self->_index == *((void *)a3 + 3))
    {
      LOBYTE(v6) = self->_associatedIndex == *((void *)a3 + 4);
      return v6;
    }

- (id)object
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (NSUInteger)associatedIndex
{
  return self->_associatedIndex;
}

@end