@interface _LSApplicationProxyEnumerator
- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5;
@end

@implementation _LSApplicationProxyEnumerator

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____LSApplicationProxyEnumerator;
  id v11 = 0LL;
  BOOL v6 = -[_LSApplicationRecordEnumerator _getObject:atIndex:context:]( &v10,  sel__getObject_atIndex_context_,  &v11,  a4,  a5);
  if (v6)
  {
    [v11 compatibilityObject];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = *a3;
    *a3 = v7;
  }

  return v6;
}

@end