@interface SharingViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (void)_handleMenuButton:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)viewDidLoad;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation SharingViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SharingViewController;
  -[SharingViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuButton:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_100004268);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharingViewController view](self, "view"));
  [v4 addGestureRecognizer:v3];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___SharingViewController;
  -[SharingViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)_handleMenuButton:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SharingViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", a3));
  [v3 dismissWithResult:&off_100004248];
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter);
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v19 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:SFViewServiceAirDropItemsKey]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:SFViewServiceSandboxExceptionsKey]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  objc_super v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v10]);
        v12 = v11;
        if (v11)
        {
          uint64_t v13 = sandbox_extension_consume([v11 bytes]);
          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v13));
            [v20 addObject:v14];
          }
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10));
        -[NSMutableArray addObject:](v5, "addObject:", v15);
      }

      id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v7);
  }

  id v16 = [[SFAirDropSharingViewControllerTV alloc] initWithSharingItems:v5];
  id location = 0LL;
  objc_initWeak(&location, v16);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100001D5C;
  v21[3] = &unk_1000041C0;
  objc_copyWeak(&v23, &location);
  v21[4] = self;
  id v17 = v20;
  id v22 = v17;
  [v16 setCompletionHandler:v21];
  -[SharingViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v16,  1LL,  0LL);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
}

@end