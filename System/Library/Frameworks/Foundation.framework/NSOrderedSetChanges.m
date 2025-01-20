@interface NSOrderedSetChanges
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isToManyChangeInformation;
- (NSOrderedSetChanges)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_toManyPropertyType;
- (unint64_t)changeCount;
- (void)addChange:(id)a3;
- (void)addChanges:(id)a3;
- (void)applyChangesToOrderedSet:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateChanges:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateChangesUsingBlock:(id)a3;
- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)moveObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)updateObject:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation NSOrderedSetChanges

- (BOOL)_isToManyChangeInformation
{
  return 1;
}

- (int64_t)_toManyPropertyType
{
  return 2LL;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSOrderedSetChanges == a1) {
    return +[NSOrderedSetChanges allocWithZone:](&OBJC_CLASS___NSConcreteOrderedSetChanges, "allocWithZone:", a3);
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSOrderedSetChanges;
  return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSOrderedSetChanges)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSOrderedSetChanges;
  objc_super v4 = -[NSOrderedSetChanges init](&v8, sel_init);
  if (v4)
  {
    unint64_t v7 = 0LL;
    [a3 decodeValueOfObjCType:"Q" at:&v7 size:8];
    if (v7)
    {
      for (unint64_t i = 0LL; i < v7; ++i)
        -[NSOrderedSetChanges addChange:](v4, "addChange:", [a3 decodeObject]);
    }
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6[1] = *MEMORY[0x1895F89C0];
  v6[0] = -[NSOrderedSetChanges changeCount](self, "changeCount");
  [a3 encodeValueOfObjCType:"Q" at:v6];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __39__NSOrderedSetChanges_encodeWithCoder___block_invoke;
  v5[3] = &unk_189CA07A8;
  v5[4] = a3;
  -[NSOrderedSetChanges enumerateChangesUsingBlock:](self, "enumerateChangesUsingBlock:", v5);
}

uint64_t __39__NSOrderedSetChanges_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) encodeObject:a2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6[5] = *MEMORY[0x1895F89C0];
  objc_super v4 = -[NSOrderedSetChanges init]( +[NSOrderedSetChanges allocWithZone:](&OBJC_CLASS___NSOrderedSetChanges, "allocWithZone:", a3),  "init");
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  void v6[2] = __36__NSOrderedSetChanges_copyWithZone___block_invoke;
  v6[3] = &unk_189CA07A8;
  v6[4] = v4;
  -[NSOrderedSetChanges enumerateChangesUsingBlock:](self, "enumerateChangesUsingBlock:", v6);
  return v4;
}

uint64_t __36__NSOrderedSetChanges_copyWithZone___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addChange:a2];
}

- (unint64_t)changeCount
{
  objc_super v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)enumerateChangesUsingBlock:(id)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)enumerateChanges:(unint64_t)a3 usingBlock:(id)a4
{
  v6 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)addChange:(id)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4
{
  if (a3 != a4)
  {
    unint64_t v4 = a4;
    uint64_t v7 = -[NSOrderedSetChanges objectAtIndex:](self, "objectAtIndex:");
    uint64_t v8 = -[NSOrderedSetChanges objectAtIndex:](self, "objectAtIndex:", v4);
    if (a3 <= v4) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v7;
    }
    if (a3 <= v4)
    {
      unint64_t v10 = v4;
    }

    else
    {
      uint64_t v7 = v8;
      unint64_t v10 = a3;
    }

    if (a3 < v4) {
      unint64_t v4 = a3;
    }
    v11 = -[NSOrderedSetChange initWithType:sourceIndex:destinationIndex:value:]( objc_alloc(&OBJC_CLASS___NSOrderedSetChange),  "initWithType:sourceIndex:destinationIndex:value:",  5LL,  v4,  v10,  v7);
    v12 = -[NSOrderedSetChange initWithType:sourceIndex:destinationIndex:value:]( objc_alloc(&OBJC_CLASS___NSOrderedSetChange),  "initWithType:sourceIndex:destinationIndex:value:",  5LL,  v10 - 1,  v4,  v9);
    -[NSOrderedSetChanges addChange:](self, "addChange:", v11);
    -[NSOrderedSetChanges addChange:](self, "addChange:", v12);
  }

- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  uint64_t v7 = [a3 firstIndex];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    do
    {
      -[NSOrderedSetChanges moveObjectAtIndex:toIndex:](self, "moveObjectAtIndex:toIndex:", v8, a4);
      uint64_t v8 = [a3 indexGreaterThanIndex:v8];
      ++a4;
    }

    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }

- (void)addChanges:(id)a3
{
  if ([a3 count])
  {
    unint64_t v5 = 0LL;
    do
      -[NSOrderedSetChanges addChange:](self, "addChange:", [a3 objectAtIndexedSubscript:v5++]);
    while (v5 < [a3 count]);
  }

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t v5 = -[NSOrderedSetChange initWithType:sourceIndex:destinationIndex:value:]( objc_alloc(&OBJC_CLASS___NSOrderedSetChange),  "initWithType:sourceIndex:destinationIndex:value:",  2LL,  a4,  a4,  a3);
  -[NSOrderedSetChanges addChange:](self, "addChange:", v5);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  unint64_t v4 = -[NSOrderedSetChange initWithType:sourceIndex:destinationIndex:value:]( objc_alloc(&OBJC_CLASS___NSOrderedSetChange),  "initWithType:sourceIndex:destinationIndex:value:",  3LL,  a3,  a3,  0LL);
  -[NSOrderedSetChanges addChange:](self, "addChange:", v4);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  unint64_t v5 = -[NSOrderedSetChange initWithType:sourceIndex:destinationIndex:value:]( objc_alloc(&OBJC_CLASS___NSOrderedSetChange),  "initWithType:sourceIndex:destinationIndex:value:",  4LL,  a3,  a3,  a4);
  -[NSOrderedSetChanges addChange:](self, "addChange:", v5);
}

- (void)moveObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  unint64_t v5 = -[NSOrderedSetChange initWithType:sourceIndex:destinationIndex:value:]( objc_alloc(&OBJC_CLASS___NSOrderedSetChange),  "initWithType:sourceIndex:destinationIndex:value:",  5LL,  a3,  a4,  -[NSOrderedSetChanges objectAtIndex:](self, "objectAtIndex:", a3));
  -[NSOrderedSetChanges addChange:](self, "addChange:", v5);
}

- (void)updateObject:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t v5 = -[NSOrderedSetChange initWithType:sourceIndex:destinationIndex:value:]( objc_alloc(&OBJC_CLASS___NSOrderedSetChange),  "initWithType:sourceIndex:destinationIndex:value:",  1LL,  a4,  a4,  a3);
  -[NSOrderedSetChanges addChange:](self, "addChange:", v5);
}

- (void)applyChangesToOrderedSet:(id)a3
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __70__NSOrderedSetChanges_NSArrayChangeActions__applyChangesToOrderedSet___block_invoke;
  v3[3] = &unk_189CA07A8;
  v3[4] = a3;
  -[NSOrderedSetChanges enumerateChangesUsingBlock:](self, "enumerateChangesUsingBlock:", v3);
}

uint64_t __70__NSOrderedSetChanges_NSArrayChangeActions__applyChangesToOrderedSet___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t result = [a2 changeType];
  switch(result)
  {
    case 1LL:
      return result;
    case 2LL:
      uint64_t result = objc_msgSend( *(id *)(a1 + 32),  "insertObject:atIndex:",  objc_msgSend(a2, "value"),  objc_msgSend(a2, "destinationIndex"));
      break;
    case 3LL:
      uint64_t result = objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", objc_msgSend(a2, "destinationIndex"));
      break;
    case 4LL:
      uint64_t result = objc_msgSend( *(id *)(a1 + 32),  "replaceObjectAtIndex:withObject:",  objc_msgSend(a2, "destinationIndex"),  objc_msgSend(a2, "value"));
      break;
    default:
      uint64_t result = [a2 changeType];
      if (result == 5) {
        uint64_t result = objc_msgSend( *(id *)(a1 + 32),  "moveObjectsAtIndexes:toIndex:",  +[NSIndexSet indexSetWithIndex:]( NSIndexSet,  "indexSetWithIndex:",  objc_msgSend(a2, "sourceIndex")),  objc_msgSend(a2, "destinationIndex"));
      }
      break;
  }

  return result;
}

@end