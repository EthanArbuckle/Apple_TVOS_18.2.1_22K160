@interface NSDictionary
- (id)compactDescription;
@end

@implementation NSDictionary

- (id)compactDescription
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001ACA0;
  v6[3] = &unk_1002836B8;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v3 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@" "]);

  return v4;
}

@end