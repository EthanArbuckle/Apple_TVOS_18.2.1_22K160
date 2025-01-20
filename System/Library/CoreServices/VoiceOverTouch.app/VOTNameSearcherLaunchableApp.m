@interface VOTNameSearcherLaunchableApp
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)displayID;
- (NSString)name;
- (VOTNameSearcherLaunchableApp)initWithName:(id)a3 displayID:(id)a4;
- (void)select;
- (void)setDisplayID:(id)a3;
- (void)setName:(id)a3;
@end

@implementation VOTNameSearcherLaunchableApp

- (VOTNameSearcherLaunchableApp)initWithName:(id)a3 displayID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VOTNameSearcherLaunchableApp;
  v8 = -[VOTNameSearcherLaunchableApp init](&v11, "init");
  if (v8)
  {
    if (qword_1001ACE10 != -1) {
      dispatch_once(&qword_1001ACE10, &stru_100177680);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByTrimmingCharactersInSet:qword_1001ACE08]);
    -[VOTNameSearcherLaunchableApp setName:](v8, "setName:", v9);

    -[VOTNameSearcherLaunchableApp setDisplayID:](v8, "setDisplayID:", v7);
  }

  return v8;
}

- (void)select
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement springBoardApplication](&OBJC_CLASS___VOTElement, "springBoardApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcherLaunchableApp displayID](self, "displayID"));
  [v3 launchAppWithDisplayID:v4];

  id v5 = (id)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace elementManager]);
  [v5 deactivateGesturedTextInputIfNeeded:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 displayID]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcherLaunchableApp displayID](self, "displayID"));
    unsigned __int8 v9 = [v7 isEqual:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcherLaunchableApp name](self, "name"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcherLaunchableApp displayID](self, "displayID"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ : %@", v3, v4));

  return (NSString *)v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end