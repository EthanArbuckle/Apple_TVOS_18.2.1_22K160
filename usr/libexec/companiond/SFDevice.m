@interface SFDevice
- (BOOL)cad_matchesDeviceIdentifier:(id)a3;
@end

@implementation SFDevice

- (BOOL)cad_matchesDeviceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice idsIdentifier](self, "idsIdentifier"));
  if ([v5 isEqualToString:v4])
  {
    unsigned __int8 v6 = 1;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice identifier](self, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    if ([v8 isEqualToString:v4])
    {
      unsigned __int8 v6 = 1;
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice rapportIdentifier](self, "rapportIdentifier"));
      unsigned __int8 v6 = [v9 isEqualToString:v4];
    }
  }

  return v6;
}

@end