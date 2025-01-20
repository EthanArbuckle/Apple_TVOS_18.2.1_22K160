@interface AirPlayAlertViewController
+ (id)alertWithTitle:(id)a3 withMessage:(id)a4 actions:(id)a5 withCompletion:(id)a6;
@end

@implementation AirPlayAlertViewController

+ (id)alertWithTitle:(id)a3 withMessage:(id)a4 actions:(id)a5 withCompletion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  a3,  a4,  1LL));
  if (v11)
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id obj = v9;
    id v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      id v13 = v12;
      char v14 = 0;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472LL;
          v22[2] = sub_100006C4C;
          v22[3] = &unk_100010688;
          id v18 = v10;
          v22[4] = v17;
          id v23 = v18;
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  0LL,  v22));
          [v11 addAction:v19];
          if ((v14 & 1) == 0) {
            [v11 setPreferredAction:v19];
          }

          char v14 = 1;
        }

        id v13 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v13);
    }
  }

  return v11;
}

@end