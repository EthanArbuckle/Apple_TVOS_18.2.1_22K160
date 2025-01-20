@interface TVUNUpNextActionHandler
+ (id)buttonImageForState:(BOOL)a3;
+ (id)buttonTitleForState:(BOOL)a3;
+ (void)toggleUpNextStateForItem:(id)a3 completion:(id)a4;
@end

@implementation TVUNUpNextActionHandler

+ (void)toggleUpNextStateForItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 playAction]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___TVTopShelfCustomAction);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 _imageName]);
    unsigned int v10 = [v9 isEqualToString:@"checkmark"];

    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 _userInfo]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "wlk_stringForKey:", @"TVUNFeaturedItemUserInfoKeyCanonicalID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[VUIUpNextRequestManager sharedInstance](&OBJC_CLASS___VUIUpNextRequestManager, "sharedInstance"));
    [v13 sendRequestForCanonicalID:v12 action:v10 confirmationShouldWaitCompletion:0];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100007360;
    v14[3] = &unk_100031090;
    id v15 = v5;
    id v16 = v7;
    char v18 = v10 ^ 1;
    id v17 = v6;
    dispatch_async(&_dispatch_main_q, v14);
  }

  else if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

+ (id)buttonTitleForState:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = _os_feature_enabled_impl("TVApp", "testarossa");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v6 = v5;
  v7 = @"FEATURED_UPNEXT_REMOVE_TITLE";
  if (v4) {
    v7 = @"FEATURED_WATCHLIST_REMOVE_TITLE";
  }
  uint64_t v8 = @"FEATURED_WATCHLIST_ADD_TITLE";
  if (!v4) {
    uint64_t v8 = @"FEATURED_UPNEXT_ADD_TITLE";
  }
  if (v3) {
    v9 = v7;
  }
  else {
    v9 = v8;
  }
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v9 value:&stru_100032790 table:0]);

  return v10;
}

+ (id)buttonImageForState:(BOOL)a3
{
  if (a3) {
    return @"checkmark";
  }
  else {
    return @"plus";
  }
}

@end