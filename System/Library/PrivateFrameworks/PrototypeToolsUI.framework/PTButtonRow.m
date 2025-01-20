@interface PTButtonRow
+ (id)rowWithTitle:(id)a3 actionHandler:(id)a4;
@end

@implementation PTButtonRow

+ (id)rowWithTitle:(id)a3 actionHandler:(id)a4
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100006B30;
  v11[3] = &unk_1000148F8;
  id v12 = a4;
  id v6 = v12;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PTRowAction actionWithHandler:](&OBJC_CLASS___PTRowAction, "actionWithHandler:", v11));
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 rowWithTitle:v7 action:v8]);

  return v9;
}

@end