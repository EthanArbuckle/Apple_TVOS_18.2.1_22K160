@interface __NSConstantDictionaryEnumerator
- (__NSConstantDictionaryEnumerator)initWithConstantDictionary:(id)a3 enumerateKeys:(BOOL)a4;
- (id)nextObject;
@end

@implementation __NSConstantDictionaryEnumerator

- (__NSConstantDictionaryEnumerator)initWithConstantDictionary:(id)a3 enumerateKeys:(BOOL)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS_____NSConstantDictionaryEnumerator;
  result = -[__NSConstantDictionaryEnumerator init](&v7, sel_init);
  result->_underlyingDictionary = (NSConstantDictionary *)a3;
  result->_currentIndex = 0LL;
  result->_isForKeys = a4;
  return result;
}

- (id)nextObject
{
  underlyingDictionary = self->_underlyingDictionary;
  unint64_t currentIndex = self->_currentIndex;
  if (currentIndex >= underlyingDictionary->_count) {
    return 0LL;
  }
  if (self->_isForKeys) {
    v4 = &OBJC_IVAR___NSConstantDictionary__keys;
  }
  else {
    v4 = &OBJC_IVAR___NSConstantDictionary__objects;
  }
  Class isa = (*(Class *)((char *)&underlyingDictionary->super.super.isa + *v4))[currentIndex].isa;
  self->_unint64_t currentIndex = currentIndex + 1;
  return isa;
}

@end