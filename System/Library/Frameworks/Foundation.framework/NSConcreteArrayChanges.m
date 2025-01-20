@interface NSConcreteArrayChanges
- (NSConcreteArrayChanges)init;
- (NSConcreteArrayChanges)initWithCapacity:(unint64_t)a3;
- (NSConcreteArrayChanges)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)changeCount;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_enumerateChanges:(unint64_t)a3 stop:(BOOL *)a4 usingBlock:(id)a5;
- (void)addChange:(id)a3;
- (void)applyChangesToArray:(id)a3;
- (void)dealloc;
- (void)enumerateChanges:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateChangesUsingBlock:(id)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
@end

@implementation NSConcreteArrayChanges

- (NSConcreteArrayChanges)init
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSConcreteArrayChanges;
  v2 = -[NSConcreteArrayChanges init](&v6, sel_init);
  if (v2)
  {
    uint64_t v5 = 0LL;
    v3 = (objc_class *)objc_opt_class();
    _NSOrderedChangesInit((uint64_t)&v2->_changes, v3, (uint64_t)&v5, 0LL);
  }

  return v2;
}

- (NSConcreteArrayChanges)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSConcreteArrayChanges;
  objc_super v6 = -[NSConcreteArrayChanges init](&v9, sel_init);
  if (v6)
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    _NSOrderedChangesInit((uint64_t)&v6->_changes, v7, (uint64_t)a3, a4);
  }

  return v6;
}

- (NSConcreteArrayChanges)initWithCapacity:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSConcreteArrayChanges;
  v3 = -[NSConcreteArrayChanges init](&v7, sel_init, a3);
  if (v3)
  {
    uint64_t v6 = 0LL;
    v4 = (objc_class *)objc_opt_class();
    _NSOrderedChangesInit((uint64_t)&v3->_changes, v4, (uint64_t)&v6, 0LL);
  }

  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  _NSOrderedChangesRelease((uint64_t)&self->_changes);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSConcreteArrayChanges;
  -[NSConcreteArrayChanges dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[NSArrayChanges allocWithZone:](&OBJC_CLASS___NSConcreteArrayChanges, "allocWithZone:", a3);
  _NSOrderedChangesCopy((uint64_t)&self->_changes, (uint64_t)&v4->_changes);
  return v4;
}

- (unint64_t)count
{
  return -[isMutable count](self->_changes.objects, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[isMutable objectAtIndex:](self->_changes.objects, "objectAtIndex:", a3);
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[isMutable countByEnumeratingWithState:objects:count:]( self->_changes.objects,  "countByEnumeratingWithState:objects:count:",  a3,  a4,  a5);
}

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
}

- (unint64_t)changeCount
{
  return self->_changes.list.count;
}

- (void)_enumerateChanges:(unint64_t)a3 stop:(BOOL *)a4 usingBlock:(id)a5
{
  v5[5] = *MEMORY[0x1895F89C0];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __60__NSConcreteArrayChanges__enumerateChanges_stop_usingBlock___block_invoke;
  v5[3] = &unk_189C9F898;
  v5[4] = a5;
  _NSOrderedChangesEnumerateChanges((uint64_t)&self->_changes, a3, a4, (uint64_t)v5);
}

void __60__NSConcreteArrayChanges__enumerateChanges_stop_usingBlock___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  uint64_t v10 = objc_alloc(&OBJC_CLASS___NSArrayChange);
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v11 = a4;
  }
  else {
    uint64_t v11 = a3;
  }
  v12 = -[NSArrayChange initWithType:sourceIndex:destinationIndex:value:]( v10,  "initWithType:sourceIndex:destinationIndex:value:",  a2,  v11,  a4,  a5);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)enumerateChangesUsingBlock:(id)a3
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  char v3 = 0;
  -[NSConcreteArrayChanges _enumerateChanges:stop:usingBlock:]( self,  "_enumerateChanges:stop:usingBlock:",  62LL,  &v3,  a3);
}

- (void)enumerateChanges:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  char v4 = 0;
  -[NSConcreteArrayChanges _enumerateChanges:stop:usingBlock:]( self,  "_enumerateChanges:stop:usingBlock:",  1 << a3,  &v4,  a4);
}

- (void)addChange:(id)a3
{
  uint64_t v5 = [a3 sourceIndex];
  uint64_t v6 = [a3 destinationIndex];
  -[NSConcreteArrayChanges willChangeValueForKey:](self, "willChangeValueForKey:", @"changeCount");
  uint64_t v7 = [a3 changeType];
  if (v5 == v6) {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _NSOrderedChangesAddChange((uint64_t)&self->_changes, v7, v5, v6, (void *)[a3 value]);
  -[NSConcreteArrayChanges didChangeValueForKey:](self, "didChangeValueForKey:", @"changeCount");
}

- (void)applyChangesToArray:(id)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  char v4 = 0;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = ___NSOrderedChangesApply_block_invoke;
  v3[3] = &unk_189CA67D0;
  v3[4] = a3;
  _NSOrderedChangesEnumerateChanges((uint64_t)&self->_changes, 62LL, &v4, (uint64_t)v3);
}

@end