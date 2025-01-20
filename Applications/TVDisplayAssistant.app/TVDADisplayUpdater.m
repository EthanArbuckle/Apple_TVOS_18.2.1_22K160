@interface TVDADisplayUpdater
+ (BOOL)updateDisplayWithMode:(id)a3 reason:(id)a4 enableEARC:(BOOL)a5 configureRequest:(id)a6 error:(id *)a7;
+ (BOOL)updateDisplayWithMode:(id)a3 reason:(id)a4 error:(id *)a5;
+ (void)notifyDisplayAssistantCompletionForKind:(int64_t)a3;
+ (void)notifyDisplayAssistantStartForKind:(int64_t)a3;
@end

@implementation TVDADisplayUpdater

+ (BOOL)updateDisplayWithMode:(id)a3 reason:(id)a4 error:(id *)a5
{
  id v11 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  unsigned __int8 v8 = [v11 updateDisplayWithMode:location[0] reason:v9 enableEARC:0 configureRequest:&stru_100029660 error:a5];
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v8 & 1;
}

+ (BOOL)updateDisplayWithMode:(id)a3 reason:(id)a4 enableEARC:(BOOL)a5 configureRequest:(id)a6 error:(id *)a7
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v27 = 0LL;
  objc_storeStrong(&v27, a4);
  BOOL v26 = a5;
  id v25 = 0LL;
  objc_storeStrong(&v25, a6);
  v24 = a7;
  v7 = objc_alloc(&OBJC_CLASS___PBSDisplayManagerUpdateRequest);
  v23 = -[PBSDisplayManagerUpdateRequest initWithDisplayMode:reason:]( v7,  "initWithDisplayMode:reason:",  location[0],  v27);
  if (v25) {
    (*((void (**)(id, PBSDisplayManagerUpdateRequest *))v25 + 2))(v25, v23);
  }
  id v13 = -[PBSDisplayManagerUpdateRequest userInfo](v23, "userInfo");
  id v14 = [v13 mutableCopy];
  char v20 = 0;
  if (v14)
  {
    unsigned __int8 v8 = (NSMutableDictionary *)v14;
  }

  else
  {
    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    char v20 = 1;
    unsigned __int8 v8 = v21;
  }

  id v22 = v8;
  if ((v20 & 1) != 0) {

  }
  [v22 setObject:&__kCFBooleanTrue forKeyedSubscript:PBSDisplayManagerUpdateRequestPassthroughKey];
  -[PBSDisplayManagerUpdateRequest setUserInfo:](v23, "setUserInfo:", v22);
  if (v26)
  {
    v12 = +[PBSEARCConfigurator sharedInstance](&OBJC_CLASS___PBSEARCConfigurator, "sharedInstance");
    -[PBSEARCConfigurator enableEARC:](v12, "enableEARC:", v26);
  }

  os_log_t oslog = (os_log_t)sub_10001A69C();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10001AD88( (uint64_t)v29,  (uint64_t)"+[TVDADisplayUpdater updateDisplayWithMode:reason:enableEARC:configureRequest:error:]",  (uint64_t)v27,  v26);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s - %{public}@, enableEARC: %i", v29, 0x1Cu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  v10 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
  unsigned __int8 v11 = -[PBSDisplayManager updateDisplayManagerWithRequest:errror:]( v10,  "updateDisplayManagerWithRequest:errror:",  v23,  v24);

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong((id *)&v23, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(location, 0LL);
  return v11 & 1;
}

+ (void)notifyDisplayAssistantStartForKind:(int64_t)a3
{
  v4 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
  v3 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3);
  -[PBSDisplayManager displayAssistantDidStartForKind:](v4, "displayAssistantDidStartForKind:");
}

+ (void)notifyDisplayAssistantCompletionForKind:(int64_t)a3
{
  v4 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
  v3 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3);
  -[PBSDisplayManager displayAssistantDidCompleteForKind:](v4, "displayAssistantDidCompleteForKind:");
}

@end