@interface _NSPlaceholderData
- (_NSPlaceholderData)init;
- (_NSPlaceholderData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6;
- (_NSPlaceholderData)initWithData:(id)a3;
- (unint64_t)retainCount;
@end

@implementation _NSPlaceholderData

- (_NSPlaceholderData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6
{
  if (!a4)
  {
    v10 = +[_NSZeroData data](&OBJC_CLASS____NSZeroData, "data", a3, 0LL, a5);
LABEL_6:
    v11 = v10;
    BOOL v9 = 1;
    if (!a6) {
      return v11;
    }
LABEL_19:
    if (v9) {
      (*((void (**)(id, void *, unint64_t))a6 + 2))(a6, a3, a4);
    }
    return v11;
  }

  BOOL v9 = a5;
  if (a4 <= 0xFFF6 && a5)
  {
    v10 = (_NSPlaceholderData *)objc_msgSend( +[_NSInlineData _allocWithExtraBytes:]( _NSInlineData,  "_allocWithExtraBytes:",  a4),  "initWithBytes:length:",  a3,  a4);
    goto LABEL_6;
  }

  if (a5)
  {
    unint64_t v12 = (unint64_t)NSAllocateMemoryPages(a4);
    v13 = (char *)v12;
    size_t v14 = a4;
    v15 = (char *)a3;
    if (a4 >= 0x80000)
    {
      v16 = (void *)MEMORY[0x1895FD590];
      size_t v14 = a4;
      v15 = (char *)a3;
      if (((*MEMORY[0x1895FD590] - 1LL) & (v12 | (unint64_t)a3)) == 0)
      {
        malloc_default_zone();
        int v17 = malloc_zone_claimed_address();
        unint64_t v12 = (unint64_t)v13;
        size_t v14 = a4;
        v15 = (char *)a3;
        if (!v17)
        {
          NSUInteger v18 = -*v16 & a4;
          NSCopyMemoryPages(a3, v13, v18);
          size_t v14 = a4 - v18;
          if (a4 == v18) {
            goto LABEL_18;
          }
          v15 = (char *)a3 + v18;
          unint64_t v12 = (unint64_t)&v13[v18];
        }
      }
    }

    memmove((void *)v12, v15, v14);
  }

  else
  {
    v13 = (char *)a3;
    if (a6 != &__block_literal_global_1)
    {
      v13 = (char *)a3;
      if (a6 != &__block_literal_global_2) {
        return (_NSPlaceholderData *)[objc_allocWithZone((Class)NSConcreteData) initWithBytes:a3 length:a4 copy:0 deallocator:a6];
      }
    }
  }

- (_NSPlaceholderData)init
{
  return -[_NSPlaceholderData initWithBytes:length:copy:deallocator:]( self,  "initWithBytes:length:copy:deallocator:",  0LL,  0LL,  1LL,  0LL);
}

- (_NSPlaceholderData)initWithData:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (_CFExecutableLinkedOnOrAfter())
  {
    v5 = (__objc2_class *)objc_opt_class();
    if (v5 == &OBJC_CLASS___NSConcreteData) {
      return (_NSPlaceholderData *)[a3 copyWithZone:0];
    }
    v6 = (objc_class *)v5;
    if (v5 == (__objc2_class *)objc_opt_class()
      || v6 == (objc_class *)objc_opt_class()
      || v6 == objc_lookUpClass("__NSCFData")
      || [a3 _isDispatchData])
    {
      return (_NSPlaceholderData *)[a3 copyWithZone:0];
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____NSPlaceholderData;
  return -[NSData initWithData:](&v8, sel_initWithData_, a3);
}

- (unint64_t)retainCount
{
  return -1LL;
}

@end