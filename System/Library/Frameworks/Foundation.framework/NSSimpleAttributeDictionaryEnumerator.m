@interface NSSimpleAttributeDictionaryEnumerator
- (NSSimpleAttributeDictionaryEnumerator)initWithAttributeDictionary:(id)a3;
- (id)nextObject;
- (void)dealloc;
@end

@implementation NSSimpleAttributeDictionaryEnumerator

- (NSSimpleAttributeDictionaryEnumerator)initWithAttributeDictionary:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSSimpleAttributeDictionaryEnumerator;
  v4 = -[NSSimpleAttributeDictionaryEnumerator init](&v6, sel_init);
  if (v4)
  {
    v4->dictionary = (NSSimpleAttributeDictionary *)a3;
    v4->nextElement = 0LL;
  }

  return v4;
}

- (id)nextObject
{
  unint64_t nextElement = self->nextElement;
  dictionary = self->dictionary;
  if (nextElement == dictionary->numElements) {
    return 0LL;
  }
  self->unint64_t nextElement = nextElement + 1;
  return dictionary->elements[nextElement].key;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSimpleAttributeDictionaryEnumerator;
  -[NSSimpleAttributeDictionaryEnumerator dealloc](&v3, sel_dealloc);
}

@end