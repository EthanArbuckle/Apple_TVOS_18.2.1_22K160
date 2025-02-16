@interface TypeCheckedArrayReader
- (TypeCheckedArrayReader)initWithArray:(id)a3;
- (id)enumeratorForObjectsOfClass:(Class)a3;
@end

@implementation TypeCheckedArrayReader

- (TypeCheckedArrayReader)initWithArray:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TypeCheckedArrayReader;
  v5 = -[TypeCheckedArrayReader init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_array, v4);
  }

  return v6;
}

- (id)enumeratorForObjectsOfClass:(Class)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_array);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TypeCheckedAbstractReader _predicateForKindOfClass:]( &OBJC_CLASS___TypeCheckedArrayReader,  "_predicateForKindOfClass:",  a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained filteredArrayUsingPredicate:v5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectEnumerator]);

  return v7;
}

- (void).cxx_destruct
{
}

@end