@interface NSArrayChanges
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isToManyChangeInformation;
- (NSArrayChanges)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_toManyPropertyType;
- (unint64_t)changeCount;
- (void)addChange:(id)a3;
- (void)addChanges:(id)a3;
- (void)addObject:(id)a3;
- (void)applyChangesToArray:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateChanges:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateChangesUsingBlock:(id)a3;
- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)moveObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)sortUsingFunction:(void *)a3 context:(void *)a4;
- (void)sortUsingSelector:(SEL)a3;
- (void)updateObject:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation NSArrayChanges

- (BOOL)_isToManyChangeInformation
{
  return 1;
}

- (int64_t)_toManyPropertyType
{
  return 1LL;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSArrayChanges == a1) {
    return +[NSArrayChanges allocWithZone:](&OBJC_CLASS___NSConcreteArrayChanges, "allocWithZone:", a3);
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSArrayChanges;
  return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSArrayChanges)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSArrayChanges;
  objc_super v4 = -[NSArrayChanges init](&v8, sel_init);
  if (v4)
  {
    unint64_t v7 = 0LL;
    [a3 decodeValueOfObjCType:"Q" at:&v7 size:8];
    if (v7)
    {
      for (unint64_t i = 0LL; i < v7; ++i)
        -[NSArrayChanges addChange:](v4, "addChange:", [a3 decodeObject]);
    }
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6[1] = *MEMORY[0x1895F89C0];
  v6[0] = -[NSArrayChanges changeCount](self, "changeCount");
  [a3 encodeValueOfObjCType:"Q" at:v6];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __34__NSArrayChanges_encodeWithCoder___block_invoke;
  v5[3] = &unk_189C9F8C0;
  v5[4] = a3;
  -[NSArrayChanges enumerateChangesUsingBlock:](self, "enumerateChangesUsingBlock:", v5);
}

uint64_t __34__NSArrayChanges_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) encodeObject:a2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6[5] = *MEMORY[0x1895F89C0];
  objc_super v4 = -[NSArrayChanges init]( +[NSArrayChanges allocWithZone:](&OBJC_CLASS___NSArrayChanges, "allocWithZone:", a3),  "init");
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  void v6[2] = __31__NSArrayChanges_copyWithZone___block_invoke;
  v6[3] = &unk_189C9F8C0;
  v6[4] = v4;
  -[NSArrayChanges enumerateChangesUsingBlock:](self, "enumerateChangesUsingBlock:", v6);
  return v4;
}

uint64_t __31__NSArrayChanges_copyWithZone___block_invoke(uint64_t a1, uint64_t a2)
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

- (void)updateObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v5 = -[NSArrayChange initWithType:sourceIndex:destinationIndex:value:]( objc_alloc(&OBJC_CLASS___NSArrayChange),  "initWithType:sourceIndex:destinationIndex:value:",  1LL,  a4,  a4,  a3);
  -[NSArrayChanges addChange:](self, "addChange:", v5);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  uint64_t v5 = -[NSArrayChange initWithType:sourceIndex:destinationIndex:value:]( objc_alloc(&OBJC_CLASS___NSArrayChange),  "initWithType:sourceIndex:destinationIndex:value:",  4LL,  a3,  a3,  a4);
  -[NSArrayChanges addChange:](self, "addChange:", v5);
}

- (void)moveObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  uint64_t v5 = -[NSArrayChange initWithType:sourceIndex:destinationIndex:value:]( objc_alloc(&OBJC_CLASS___NSArrayChange),  "initWithType:sourceIndex:destinationIndex:value:",  5LL,  a3,  a4,  -[NSArrayChanges objectAtIndex:](self, "objectAtIndex:", a3));
  -[NSArrayChanges addChange:](self, "addChange:", v5);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  objc_super v4 = -[NSArrayChange initWithType:sourceIndex:destinationIndex:value:]( objc_alloc(&OBJC_CLASS___NSArrayChange),  "initWithType:sourceIndex:destinationIndex:value:",  3LL,  a3,  a3,  0LL);
  -[NSArrayChanges addChange:](self, "addChange:", v4);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v5 = -[NSArrayChange initWithType:sourceIndex:destinationIndex:value:]( objc_alloc(&OBJC_CLASS___NSArrayChange),  "initWithType:sourceIndex:destinationIndex:value:",  2LL,  a4,  a4,  a3);
  -[NSArrayChanges addChange:](self, "addChange:", v5);
}

- (void)applyChangesToArray:(id)a3
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __60__NSArrayChanges_NSArrayChangeActions__applyChangesToArray___block_invoke;
  v3[3] = &unk_189C9F8C0;
  v3[4] = a3;
  -[NSArrayChanges enumerateChangesUsingBlock:](self, "enumerateChangesUsingBlock:", v3);
}

uint64_t __60__NSArrayChanges_NSArrayChangeActions__applyChangesToArray___block_invoke(uint64_t a1, void *a2)
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

- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  uint64_t v7 = [a3 firstIndex];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    do
    {
      -[NSArrayChanges moveObjectAtIndex:toIndex:](self, "moveObjectAtIndex:toIndex:", v8, a4);
      uint64_t v8 = [a3 indexGreaterThanIndex:v8];
      ++a4;
    }

    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }

- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4
{
  if (a3 != a4)
  {
    unint64_t v4 = a4;
    uint64_t v7 = -[NSArrayChanges objectAtIndex:](self, "objectAtIndex:");
    uint64_t v8 = -[NSArrayChanges objectAtIndex:](self, "objectAtIndex:", v4);
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
    v11 = -[NSArrayChange initWithType:sourceIndex:destinationIndex:value:]( objc_alloc(&OBJC_CLASS___NSArrayChange),  "initWithType:sourceIndex:destinationIndex:value:",  5LL,  v4,  v10,  v7);
    v12 = -[NSArrayChange initWithType:sourceIndex:destinationIndex:value:]( objc_alloc(&OBJC_CLASS___NSArrayChange),  "initWithType:sourceIndex:destinationIndex:value:",  5LL,  v10 - 1,  v4,  v9);
    -[NSArrayChanges addChange:](self, "addChange:", v11);
    -[NSArrayChanges addChange:](self, "addChange:", v12);
  }

- (void)addChanges:(id)a3
{
  if ([a3 count])
  {
    unint64_t v5 = 0LL;
    do
      -[NSArrayChanges addChange:](self, "addChange:", [a3 objectAtIndexedSubscript:v5++]);
    while (v5 < [a3 count]);
  }

- (void)addObject:(id)a3
{
}

- (void)removeLastObject
{
  uint64_t v3 = -[NSArrayChanges count](self, "count");
  if (v3) {
    -[NSArrayChanges removeObjectAtIndex:](self, "removeObjectAtIndex:", v3 - 1);
  }
}

- (void)sortUsingFunction:(void *)a3 context:(void *)a4
{
  v4[6] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __69__NSArrayChanges_NSMutableArrayOverrides__sortUsingFunction_context___block_invoke;
  v4[3] = &__block_descriptor_48_e11_q24__0_8_16l;
  v4[4] = a3;
  v4[5] = a4;
  -[NSArrayChanges sortWithOptions:usingComparator:](self, "sortWithOptions:usingComparator:", 0LL, v4);
}

uint64_t __69__NSArrayChanges_NSMutableArrayOverrides__sortUsingFunction_context___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

- (void)sortUsingSelector:(SEL)a3
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __61__NSArrayChanges_NSMutableArrayOverrides__sortUsingSelector___block_invoke;
  v3[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v3[4] = a3;
  -[NSArrayChanges sortWithOptions:usingComparator:](self, "sortWithOptions:usingComparator:", 0LL, v3);
}

id __61__NSArrayChanges_NSMutableArrayOverrides__sortUsingSelector___block_invoke(uint64_t a1, id a2)
{
  return [a2 *(SEL *)(a1 + 32)];
}

@end