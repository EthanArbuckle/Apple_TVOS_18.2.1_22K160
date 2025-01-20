@interface NSSet
- (id)_geo_filtered:(id)a3;
@end

@implementation NSSet

- (id)_geo_filtered:(id)a3
{
  id v4 = a3;
  if (-[NSSet count](self, "count"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10001C568;
    v8[3] = &unk_100059C78;
    id v9 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v8));
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue(-[NSSet filteredSetUsingPredicate:](self, "filteredSetUsingPredicate:", v5));
  }

  else
  {
    v6 = objc_opt_new(&OBJC_CLASS___NSSet);
  }

  return v6;
}

@end