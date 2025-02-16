@interface _NSInlineData
+ (id)_allocWithExtraBytes:(unint64_t)a3;
- (BOOL)_isCompact;
- (BOOL)_providesConcreteBacking;
- (_NSInlineData)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (_NSInlineData)initWithCoder:(id)a3;
- (id)_createDispatchData;
- (unint64_t)length;
@end

@implementation _NSInlineData

- (unint64_t)length
{
  return self->_length;
}

+ (id)_allocWithExtraBytes:(unint64_t)a3
{
  return NSAllocateObject((Class)&OBJC_CLASS____NSInlineData, a3, 0LL);
}

- (BOOL)_isCompact
{
  return 1;
}

- (_NSInlineData)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(_NSInlineData *, uint64_t, void))*MEMORY[0x189604A70])(self, v4, *MEMORY[0x189604A10]);
  }
  self->_length = a4;
  IndexedIvars = object_getIndexedIvars(self);
  memmove(IndexedIvars, a3, a4);
  return self;
}

- (_NSInlineData)initWithCoder:(id)a3
{
  v6[1] = *MEMORY[0x1895F89C0];

  v5 = @"NSDebugDescription";
  v6[0] = @"Decoding instances of _NSInlineData is not supported";
  objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
  return 0LL;
}

- (id)_createDispatchData
{
  return (id)_NSDataCreateDispatchDataFromData(self, 0);
}

- (BOOL)_providesConcreteBacking
{
  return 1;
}

@end