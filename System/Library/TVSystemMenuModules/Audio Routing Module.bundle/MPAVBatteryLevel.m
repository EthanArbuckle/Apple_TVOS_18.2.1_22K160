@interface MPAVBatteryLevel
- (BOOL)tvnp_hasAnyPercentages;
@end

@implementation MPAVBatteryLevel

- (BOOL)tvnp_hasAnyPercentages
{
  id v3 = -[MPAVBatteryLevel leftPercentage](self, "leftPercentage");
  char v9 = 0;
  char v7 = 0;
  char v5 = 0;
  BOOL v4 = 1;
  if (!v3)
  {
    id v10 = -[MPAVBatteryLevel rightPercentage](self, "rightPercentage");
    char v9 = 1;
    BOOL v4 = 1;
    if (!v10)
    {
      id v8 = -[MPAVBatteryLevel singlePercentage](self, "singlePercentage");
      char v7 = 1;
      BOOL v4 = 1;
      if (!v8)
      {
        id v6 = -[MPAVBatteryLevel casePercentage](self, "casePercentage");
        char v5 = 1;
        BOOL v4 = v6 != 0LL;
      }
    }
  }

  if ((v5 & 1) != 0) {

  }
  if ((v7 & 1) != 0) {
  if ((v9 & 1) != 0)
  }

  return v4;
}

@end