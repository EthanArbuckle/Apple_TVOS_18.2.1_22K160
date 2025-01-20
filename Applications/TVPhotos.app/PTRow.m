@interface PTRow
+ (id)tvp_rowWithTitle:(id)a3 settings:(id)a4;
@end

@implementation PTRow

+ (id)tvp_rowWithTitle:(id)a3 settings:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100073DF4;
  v9[3] = &unk_1000CC550;
  id v10 = a4;
  id v6 = v10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "px_rowWithTitle:action:", a3, v9));

  return v7;
}

@end