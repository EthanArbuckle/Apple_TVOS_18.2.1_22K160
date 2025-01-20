@interface NSSet
- (id)_lowercaseSet;
@end

@implementation NSSet

- (id)_lowercaseSet
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100026808;
  v6[3] = &unk_1000F9A20;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( &OBJC_CLASS___NSMutableSet,  "setWithCapacity:",  -[NSSet count](self, "count")));
  id v3 = v7;
  -[NSSet enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v6);
  id v4 = [v3 copy];

  return v4;
}

@end