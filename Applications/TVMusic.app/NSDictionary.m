@interface NSDictionary
- (id)tvm_mutableDeepCopy;
@end

@implementation NSDictionary

- (id)tvm_mutableDeepCopy
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009ABA8;
  v5[3] = &unk_10026CB58;
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  -[NSDictionary count](self, "count")));
  id v6 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v5);

  return v3;
}

@end