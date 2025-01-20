@interface OnScreenActionShowHomeScreen
- (void)performWithCompletion:(id)a3;
@end

@implementation OnScreenActionShowHomeScreen

- (void)performWithCompletion:(id)a3
{
  v6 = (void (**)(id, void *))a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  [v3 launchKioskApp];

  if (v6)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionary]);
    v6[2](v6, v5);
  }
}

@end