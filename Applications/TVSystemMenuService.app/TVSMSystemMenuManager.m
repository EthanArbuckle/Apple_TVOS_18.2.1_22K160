@interface TVSMSystemMenuManager
+ (id)sharedInstance;
- (TVSMSystemMenuManagerDelegate)delegate;
- (TVSMSystemMenuStartupContext)startupContext;
- (void)dismissSystemMenuAnimated:(BOOL)a3 result:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setStartupContext:(id)a3;
@end

@implementation TVSMSystemMenuManager

+ (id)sharedInstance
{
  id v10 = a1;
  SEL v9 = a2;
  obj = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_100027000;
  v7 = &unk_100049828;
  id v8 = a1;
  v12 = (dispatch_once_t *)&unk_100056D28;
  id location = 0LL;
  objc_storeStrong(&location, &obj);
  if (*v12 != -1) {
    dispatch_once(v12, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100056D20;
}

- (void)dismissSystemMenuAnimated:(BOOL)a3 result:(id)a4
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  int v4 = -[TVSMSystemMenuManager delegate](v8, "delegate");
  -[TVSMSystemMenuManagerDelegate systemMenuManagerRequestedDismissal:animated:result:]( v4,  "systemMenuManagerRequestedDismissal:animated:result:",  v8,  v6,  location);

  objc_storeStrong(&location, 0LL);
}

- (TVSMSystemMenuManagerDelegate)delegate
{
  return (TVSMSystemMenuManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVSMSystemMenuStartupContext)startupContext
{
  return self->_startupContext;
}

- (void)setStartupContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end