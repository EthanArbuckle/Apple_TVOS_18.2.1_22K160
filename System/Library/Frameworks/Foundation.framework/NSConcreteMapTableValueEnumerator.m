@interface NSConcreteMapTableValueEnumerator
+ (id)enumeratorWithMapTable:(id)a3;
- (id)nextObject;
- (void)dealloc;
@end

@implementation NSConcreteMapTableValueEnumerator

+ (id)enumeratorWithMapTable:(id)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSConcreteMapTableValueEnumerator);
  v4->mapTable = (NSConcreteMapTable *)a3;
  v4->counter = 0LL;
  return v4;
}

- (id)nextObject
{
  unint64_t counter = self->counter;
  mapTable = self->mapTable;
  if (counter >= mapTable->capacity) {
    return 0LL;
  }
  while (1)
  {
    uint64_t v5 = (*((uint64_t (**)(void **, void))mapTable->keys.internalProps + 3))( &mapTable->keys.items[counter],  0LL);
    uint64_t v6 = (*((uint64_t (**)(void **, void))self->mapTable->values.internalProps + 3))( &self->mapTable->values.items[self->counter],  0LL);
    v7 = (void *)v6;
    ++self->counter;
    v8 = (void (*)(uint64_t))*((void *)self->mapTable->keys.internalProps + 4);
    if (v5 && v6 != 0) {
      break;
    }
    v8(v5);
    (*((void (**)(void *))self->mapTable->values.internalProps + 4))(v7);
    unint64_t counter = self->counter;
    mapTable = self->mapTable;
    if (counter >= mapTable->capacity) {
      return 0LL;
    }
  }

  v8(v5);
  (*((void (**)(void *))self->mapTable->values.internalProps + 5))(v7);
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSConcreteMapTableValueEnumerator;
  -[NSConcreteMapTableValueEnumerator dealloc](&v3, sel_dealloc);
}

@end