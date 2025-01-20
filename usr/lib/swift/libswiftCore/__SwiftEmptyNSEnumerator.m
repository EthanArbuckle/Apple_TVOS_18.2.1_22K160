@interface __SwiftEmptyNSEnumerator
- (_TtCs24__SwiftEmptyNSEnumerator)initWithCoder:(id)a3;
- (id)nextObject;
- (int64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(int64_t)a5;
@end

@implementation __SwiftEmptyNSEnumerator

- (id)nextObject
{
  return 0LL;
}

- (int64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(int64_t)a5
{
  unint64_t var0 = a3->var0;
  var1 = a3->var1;
  var2 = a3->var2;
  if (!a3->var0)
  {
    var2 = &_fastEnumerationStorageMutationsTarget;
    var1 = a4;
  }

  if (var0 <= 1) {
    unint64_t var0 = 1LL;
  }
  a3->unint64_t var0 = var0;
  a3->var1 = var1;
  a3->var2 = var2;
  return 0LL;
}

- (_TtCs24__SwiftEmptyNSEnumerator)initWithCoder:(id)a3
{
  return result;
}

@end