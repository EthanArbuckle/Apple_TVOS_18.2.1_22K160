@interface CSDFaceTimeIDSService
- (CSDFaceTimeIDSService)initWithName:(id)a3;
- (id)callerID;
- (void)account:(id)a3 aliasesChanged:(id)a4;
- (void)dealloc;
- (void)faceTimeIMAccountCallerIDChanged:(id)a3;
@end

@implementation CSDFaceTimeIDSService

- (CSDFaceTimeIDSService)initWithName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSDFaceTimeIDSService;
  v3 = -[CSDIDSService initWithName:](&v7, "initWithName:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v3 selector:"faceTimeIMAccountCallerIDChanged:" name:@"CSDFaceTimeIMAccountCallerIDChangedNotification" object:0];

    id v5 = +[CSDFaceTimeIMAccount sharedInstance](&OBJC_CLASS___CSDFaceTimeIMAccount, "sharedInstance");
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDFaceTimeIDSService;
  -[CSDIDSService dealloc](&v4, "dealloc");
}

- (id)callerID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSDFaceTimeIMAccount sharedInstance](&OBJC_CLASS___CSDFaceTimeIMAccount, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 callerID]);

  return v3;
}

- (void)faceTimeIMAccountCallerIDChanged:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  [v4 postNotificationName:@"CSDIDSServiceCallerIDChangedNotification" object:self];
}

- (void)account:(id)a3 aliasesChanged:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDFaceTimeIMAccount sharedInstance](&OBJC_CLASS___CSDFaceTimeIMAccount, "sharedInstance"));
  if ((objc_opt_respondsToSelector(v6, "account:aliasesChanged:") & 1) != 0) {
    [v6 account:v7 aliasesChanged:v5];
  }
}

@end