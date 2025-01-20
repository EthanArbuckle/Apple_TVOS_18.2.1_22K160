@interface PBIntentHandlerExtension
- (void)handleShowHome:(id)a3 completion:(id)a4;
@end

@implementation PBIntentHandlerExtension

- (void)handleShowHome:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id))a4;
  v7 = -[INInteraction initWithIntent:response:]( objc_alloc(&OBJC_CLASS___INInteraction),  "initWithIntent:response:",  v5,  0LL);
  -[INInteraction donateInteractionWithCompletion:](v7, "donateInteractionWithCompletion:", 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 systemServiceProxy]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 filters]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 time]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100003720;
  v14[3] = &unk_1000040D0;
  id v15 = v5;
  id v12 = v5;
  [v9 handleShowHomeIntentWithFilters:v10 time:v11 completion:v14];

  id v13 = [[INShowHomeIntentResponse alloc] initWithCode:3 userActivity:0];
  v6[2](v6, v13);
}

@end