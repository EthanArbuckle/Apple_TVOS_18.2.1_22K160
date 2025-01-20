@interface NotPatternSet
@end

@implementation NotPatternSet

id ___NotPatternSet_block_invoke()
{
  if (qword_18C494A00 != -1) {
    dispatch_once(&qword_18C494A00, &__block_literal_global_7);
  }
  id result = (id)[(id)_MergedGlobals_5 invertedSet];
  qword_18C494A08 = (uint64_t)result;
  return result;
}

@end