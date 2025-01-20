@interface MRAVOutputDevice
- (BOOL)isLocallyHosted;
- (BOOL)isSmartDevice;
- (BOOL)willBeLocallyHosted;
@end

@implementation MRAVOutputDevice

- (BOOL)isLocallyHosted
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDAVOutputContextManager sharedManager](&OBJC_CLASS___MRDAVOutputContextManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 populatedOutputContexts]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CC098;
  v7[3] = &unk_10039F798;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msv_firstWhere:", v7));
  LOBYTE(self) = v5 != 0LL;

  return (char)self;
}

- (BOOL)willBeLocallyHosted
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  if ([v3 supportMultiplayerHost])
  {
    if (-[MRAVOutputDevice isLocallyHosted](self, "isLocallyHosted")
      || (-[MRAVOutputDevice shouldBeLocallyHosted](self, "shouldBeLocallyHosted") & 1) != 0)
    {
      unsigned __int8 v4 = 1;
    }

    else
    {
      unsigned __int8 v4 = -[MRAVOutputDevice isPrimaryLocalDevice](self, "isPrimaryLocalDevice");
    }
  }

  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)isSmartDevice
{
  unsigned int v3 = -[MRAVOutputDevice isRemoteControllable](self, "isRemoteControllable");
  if (v3) {
    LOBYTE(v3) = -[MRAVOutputDevice isAuxiliary](self, "isAuxiliary") ^ 1;
  }
  return v3;
}

@end