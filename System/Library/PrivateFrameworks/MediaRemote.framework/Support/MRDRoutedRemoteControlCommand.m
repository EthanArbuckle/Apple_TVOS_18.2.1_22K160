@interface MRDRoutedRemoteControlCommand
- (MRDRoutedRemoteControlCommand)initWithCommand:(id)a3 routedApp:(id)a4;
- (NSString)routedAppDisplayID;
- (id)description;
@end

@implementation MRDRoutedRemoteControlCommand

- (MRDRoutedRemoteControlCommand)initWithCommand:(id)a3 routedApp:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 _copyWithZone:0 usingConcreteClass:objc_opt_class(self)];

  v9 = (MRDRoutedRemoteControlCommand *)v8;
  if (v9)
  {
    v10 = (NSString *)[v6 copy];
    routedAppDisplayID = v9->_routedAppDisplayID;
    v9->_routedAppDisplayID = v10;

    id completionHandler = v9->super._completionHandler;
    v9->super._id completionHandler = 0LL;
  }

  return v9;
}

- (id)description
{
  v3 = (void *)MRMediaRemoteCopyCommandDescription(self->super._commandType);
  v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p, command = %@, routedToApp = %@>",  objc_opt_class(self),  self,  v3,  self->_routedAppDisplayID);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (NSString)routedAppDisplayID
{
  return self->_routedAppDisplayID;
}

- (void).cxx_destruct
{
}

@end