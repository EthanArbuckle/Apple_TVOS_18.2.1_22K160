@interface _NSZeroData
+ (id)data;
- (BOOL)_isCompact;
- (BOOL)_providesConcreteBacking;
- (_NSZeroData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6;
- (const)bytes;
- (id)_dispatchData;
- (unint64_t)length;
- (unint64_t)retainCount;
@end

@implementation _NSZeroData

+ (id)data
{
  if (qword_18C495518 != -1) {
    dispatch_once(&qword_18C495518, &__block_literal_global_205);
  }
  return (id)_MergedGlobals_35;
}

- (unint64_t)length
{
  return 0LL;
}

- (const)bytes
{
  return 0LL;
}

- (BOOL)_isCompact
{
  return 1;
}

- (unint64_t)retainCount
{
  return -1LL;
}

- (_NSZeroData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6
{
  BOOL v7 = a5;
  _NSDataReinitializationBreak();
  return (_NSZeroData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 length:a4 copy:v7 deallocator:a6];
}

- (id)_dispatchData
{
  return (id)MEMORY[0x1895F8AA8];
}

- (BOOL)_providesConcreteBacking
{
  return 1;
}

@end