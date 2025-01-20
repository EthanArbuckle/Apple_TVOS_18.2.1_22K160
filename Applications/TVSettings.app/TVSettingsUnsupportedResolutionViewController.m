@interface TVSettingsUnsupportedResolutionViewController
+ (id)unsupportedResolutionViewControllerWithModeName:(id)a3 completionHandler:(id)a4;
- (id)completionHandler;
- (void)_ok;
- (void)setCompletionHandler:(id)a3;
@end

@implementation TVSettingsUnsupportedResolutionViewController

+ (id)unsupportedResolutionViewControllerWithModeName:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = TSKLocString(@"FailedResolutionChangeTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = TSKLocString(@"FailedResolutionChangeText");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v6));

  uint64_t v12 = TSKLocString(@"FailedResolutionChangeSubtext");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v11, v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsUnsupportedResolutionViewController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___TVSettingsUnsupportedResolutionViewController,  "alertControllerWithTitle:message:preferredStyle:",  v8,  v14,  1LL));
  [v15 setCompletionHandler:v5];

  uint64_t v16 = TSKLocString(@"OK");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10005D5C8;
  v22[3] = &unk_10018F018;
  id v18 = v15;
  id v23 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  1LL,  v22));

  [v18 addAction:v19];
  [v18 setPreferredAction:v19];
  id v20 = v18;

  return v20;
}

- (void)_ok
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUnsupportedResolutionViewController completionHandler](self, "completionHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[TVSettingsUnsupportedResolutionViewController completionHandler]( self,  "completionHandler"));
    v4[2]();

    -[TVSettingsUnsupportedResolutionViewController setCompletionHandler:](self, "setCompletionHandler:", 0LL);
  }

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end