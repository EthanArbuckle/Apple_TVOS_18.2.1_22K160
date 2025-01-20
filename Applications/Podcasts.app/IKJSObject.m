@interface IKJSObject
- (id)blockForJSCallback:(id)a3;
@end

@implementation IKJSObject

- (id)blockForJSCallback:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IKJSObject appContext](self, "appContext"));
  if (v4) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:](&OBJC_CLASS___JSManagedValue, "managedValueWithValue:", v4));
  }
  else {
    v6 = 0LL;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000EF74;
  v12[3] = &unk_1002403D0;
  id v13 = v6;
  id v14 = v5;
  id v7 = v5;
  id v8 = v6;
  v9 = objc_retainBlock(v12);
  v10 = objc_retainBlock(v9);

  return v10;
}

@end