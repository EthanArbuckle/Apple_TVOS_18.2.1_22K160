@interface PBEARCConfiguratorService
- (PBEARCConfiguratorService)init;
- (PBSEARCServiceObserver)serviceDelegate;
- (void)dealloc;
- (void)eARCStatusChanged:(int64_t)a3;
- (void)enableEARC:(id)a3;
- (void)fetchEARCStatusWithReply:(id)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)toggleEARC:(id)a3 withReply:(id)a4;
@end

@implementation PBEARCConfiguratorService

- (PBEARCConfiguratorService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBEARCConfiguratorService;
  v2 = -[PBEARCConfiguratorService init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBEARCConfigurator sharedInstance](&OBJC_CLASS___PBEARCConfigurator, "sharedInstance"));
    [v3 addEARCObserver:v2];

    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBEARCConfigurator sharedInstance](&OBJC_CLASS___PBEARCConfigurator, "sharedInstance"));
  [v3 removeEARCObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBEARCConfiguratorService;
  -[PBEARCConfiguratorService dealloc](&v4, "dealloc");
}

- (void)invalidate
{
  id v3 = sub_100082B14();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    objc_super v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "eARCConfiguratorService invalidated %@",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)fetchEARCStatusWithReply:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBEARCConfigurator sharedInstance](&OBJC_CLASS___PBEARCConfigurator, "sharedInstance"));
  id v5 = [v4 eARCStatus];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v5));
  v3[2](v3, v6, 0LL);
}

- (void)enableEARC:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBEARCConfigurator sharedInstance](&OBJC_CLASS___PBEARCConfigurator, "sharedInstance"));
  id v5 = [v3 BOOLValue];

  [v4 enableEARC:v5];
}

- (void)toggleEARC:(id)a3 withReply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBEARCConfigurator sharedInstance](&OBJC_CLASS___PBEARCConfigurator, "sharedInstance"));
  id v8 = [v6 BOOLValue];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10011B900;
  v10[3] = &unk_1003D82D8;
  id v11 = v5;
  id v9 = v5;
  [v7 toggleEARC:v8 completion:v10];
}

- (void)eARCStatusChanged:(int64_t)a3
{
  id v5 = sub_100082B14();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 134217984;
    int64_t v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Forwarding status change to %ld",  (uint8_t *)&v9,  0xCu);
  }

  serviceDelegate = self->_serviceDelegate;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  -[PBSEARCServiceObserver eARCStatusChanged:](serviceDelegate, "eARCStatusChanged:", v8);
}

- (PBSEARCServiceObserver)serviceDelegate
{
  return self->_serviceDelegate;
}

- (void).cxx_destruct
{
}

@end