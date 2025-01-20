@interface PRELAViewController
+ (id)viewController;
- (void)exit;
@end

@implementation PRELAViewController

- (void)exit
{
}

+ (id)viewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](&OBJC_CLASS___LAPreboard, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 title]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 message]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[PRELAViewController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___PRELAViewController,  "alertControllerWithTitle:message:preferredStyle:",  v3,  v4,  1LL));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"PRELAEnableButton" value:&stru_10000CBB8 table:0]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100004BF4;
  v24[3] = &unk_10000C8A0;
  id v8 = v2;
  id v25 = v8;
  id v9 = v5;
  id v26 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v7,  0LL,  v24));
  [v9 addAction:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"PRELAExitButton" value:&stru_10000CBB8 table:0]);
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  v20 = sub_100004FF4;
  v21 = &unk_10000C8A0;
  id v22 = v8;
  id v13 = v9;
  id v23 = v13;
  id v14 = v8;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  0LL,  &v18));

  objc_msgSend(v13, "addAction:", v15, v18, v19, v20, v21);
  [v13 setPreferredAction:v15];
  id v16 = v13;

  return v16;
}

@end