@interface NSMutableArray
- (void)_geo_filter:(id)a3;
@end

@implementation NSMutableArray

- (void)_geo_filter:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray count](self, "count"))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000393D4;
    v6[3] = &unk_100059C78;
    id v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v6));
    -[NSMutableArray filterUsingPredicate:](self, "filterUsingPredicate:", v5);
  }
}

@end