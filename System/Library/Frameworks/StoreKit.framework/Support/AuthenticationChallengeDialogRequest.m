@interface AuthenticationChallengeDialogRequest
+ (id)dialogForAuthenticationChallenge:(id)a3;
@end

@implementation AuthenticationChallengeDialogRequest

+ (id)dialogForAuthenticationChallenge:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedTitle]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedMessage]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogRequest requestWithTitle:message:]( &OBJC_CLASS___AMSDialogRequest,  "requestWithTitle:message:",  v4,  v5));

  uint64_t v7 = ASDLocalizedString(@"CANCEL");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogAction actionWithTitle:style:]( &OBJC_CLASS___AMSDialogAction,  "actionWithTitle:style:",  v8,  2LL));

  [v9 setIdentifier:@"AuthenticationChallengeDialogActionCancel"];
  [v6 addButtonAction:v9];
  uint64_t v10 = ASDLocalizedString(@"OK");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogAction actionWithTitle:style:]( &OBJC_CLASS___AMSDialogAction,  "actionWithTitle:style:",  v11,  0LL));

  [v12 setIdentifier:@"AuthenticationChallengeDialogActionOkay"];
  [v6 addButtonAction:v12];
  uint64_t v13 = ASDLocalizedString(@"SERVER_AUTHENTICATION_USERNAME");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogTextField textFieldWithPlaceholder:secure:]( &OBJC_CLASS___AMSDialogTextField,  "textFieldWithPlaceholder:secure:",  v14,  0LL));

  [v15 setKeyboardType:0];
  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 user]);

  [v15 setText:v16];
  [v6 addTextField:v15];
  uint64_t v17 = ASDLocalizedString(@"SERVER_AUTHENTICATION_PASSWORD");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogTextField textFieldWithPlaceholder:secure:]( &OBJC_CLASS___AMSDialogTextField,  "textFieldWithPlaceholder:secure:",  v18,  1LL));

  [v19 setKeyboardType:0];
  [v6 addTextField:v19];

  return v6;
}

@end