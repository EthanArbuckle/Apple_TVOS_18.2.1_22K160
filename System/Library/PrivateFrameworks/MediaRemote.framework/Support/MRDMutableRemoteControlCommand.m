@interface MRDMutableRemoteControlCommand
- (NSString)destinationAppDisplayID;
- (int)destinationAppProcessID;
- (void)setAppOptions:(unsigned int)a3;
- (void)setCommandType:(unsigned int)a3;
- (void)setDateCreated:(id)a3;
- (void)setDestinationAppDisplayID:(id)a3;
- (void)setDestinationAppProcessID:(int)a3;
- (void)setOptionValue:(id)a3 forKey:(__CFString *)a4;
- (void)setOptionsData:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)setSenderAppDisplayID:(id)a3;
@end

@implementation MRDMutableRemoteControlCommand

- (void)setCommandType:(unsigned int)a3
{
  self->super._commandType = a3;
}

- (void)setOptionsData:(id)a3
{
  v4 = (NSData *)[a3 copy];
  optionsData = self->super._optionsData;
  self->super._optionsData = v4;
}

- (void)setPlayerPath:(id)a3
{
}

- (void)setDateCreated:(id)a3
{
}

- (void)setSenderAppDisplayID:(id)a3
{
  v4 = (NSString *)[a3 copy];
  senderAppDisplayID = self->super._senderAppDisplayID;
  self->super._senderAppDisplayID = v4;
}

- (void)setAppOptions:(unsigned int)a3
{
  self->super._appOptions = a3;
}

- (void)setDestinationAppDisplayID:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand playerPath](self, "playerPath"));
  v5 = (MRClient *)objc_claimAutoreleasedReturnValue([v4 client]);

  if (v5)
  {
    if (v7) {
      -[MRClient setBundleIdentifier:](v5, "setBundleIdentifier:", v7);
    }
  }

  else
  {
    v5 = -[MRClient initWithProcessIdentifier:bundleIdentifier:]( objc_alloc(&OBJC_CLASS___MRClient),  "initWithProcessIdentifier:bundleIdentifier:",  0LL,  v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand playerPath](self, "playerPath"));
    [v6 setClient:v5];
  }
}

- (void)setDestinationAppProcessID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand playerPath](self, "playerPath"));
  v8 = (MRClient *)objc_claimAutoreleasedReturnValue([v5 client]);

  v6 = v8;
  if (!v8)
  {
    v8 = -[MRClient initWithProcessIdentifier:bundleIdentifier:]( objc_alloc(&OBJC_CLASS___MRClient),  "initWithProcessIdentifier:bundleIdentifier:",  v3,  0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand playerPath](self, "playerPath"));
    [v7 setClient:v8];

    goto LABEL_5;
  }

  if ((int)v3 >= 1)
  {
    -[MRClient setProcessIdentifier:](v8, "setProcessIdentifier:", v3);
LABEL_5:
    v6 = v8;
  }
}

- (int)destinationAppProcessID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand playerPath](self, "playerPath"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 client]);
  int v4 = [v3 processIdentifier];

  return v4;
}

- (NSString)destinationAppDisplayID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand playerPath](self, "playerPath"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 client]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);

  return (NSString *)v4;
}

- (void)setOptionValue:(id)a3 forKey:(__CFString *)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlCommand _optionsDictionary](self, "_optionsDictionary"));
  [v7 setValue:v6 forKey:a4];
}

@end