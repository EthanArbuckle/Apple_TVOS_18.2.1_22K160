@interface NIInternalUtils
+ (BOOL)isIntValidAntennaDiversityOverride:(int64_t)a3;
+ (BOOL)isIntValidNearbyObjectUpdateRate:(int64_t)a3;
+ (BOOL)isIntValidRelationshipSpecifier:(int64_t)a3;
+ (BOOL)nearbyObjectUpdateRate:(int64_t)a3 isGreaterThan:(int64_t)a4;
+ (const)AntennaDiversityOverrideToString:(int64_t)a3;
+ (const)NINearbyObjectUpdateRateToShortString:(int64_t)a3;
+ (const)NINearbyObjectUpdateRateToString:(int64_t)a3;
+ (const)NIRelationshipSpecifierToString:(unint64_t)a3;
+ (const)NISessionBackgroundModeToString:(int64_t)a3;
+ (id)NISystemPassiveAccessIntentToString:(unsigned int)a3;
+ (id)NISystemResourceAvailabilityToString:(unint64_t)a3;
@end

@implementation NIInternalUtils

+ (const)NIRelationshipSpecifierToString:(unint64_t)a3
{
  if (a3 > 0xF) {
    return "N/A";
  }
  else {
    return off_1007B2078[a3];
  }
}

+ (BOOL)isIntValidRelationshipSpecifier:(int64_t)a3
{
  return (unint64_t)a3 < 0x10;
}

+ (const)AntennaDiversityOverrideToString:(int64_t)a3
{
  else {
    return off_1007B20F8[a3];
  }
}

+ (BOOL)isIntValidAntennaDiversityOverride:(int64_t)a3
{
  return (unint64_t)a3 < 3;
}

+ (BOOL)isIntValidNearbyObjectUpdateRate:(int64_t)a3
{
  return (unint64_t)a3 < 4;
}

+ (BOOL)nearbyObjectUpdateRate:(int64_t)a3 isGreaterThan:(int64_t)a4
{
  unsigned int v4 = (9u >> (a4 & 0xF)) & 1;
  BOOL v5 = (a4 & 0xF) == 3;
  if (a3) {
    BOOL v5 = 0;
  }
  if (a3 == 1) {
    BOOL v5 = v4;
  }
  BOOL v6 = a3 == 2 || v5;
  return a3 != a4 && v6;
}

+ (const)NISessionBackgroundModeToString:(int64_t)a3
{
  return off_1007B2110[a3];
}

+ (const)NINearbyObjectUpdateRateToString:(int64_t)a3
{
  return off_1007B2128[a3];
}

+ (const)NINearbyObjectUpdateRateToShortString:(int64_t)a3
{
  return off_1007B2148[a3];
}

+ (id)NISystemResourceAvailabilityToString:(unint64_t)a3
{
  unsigned int v4 = objc_autoreleasePoolPush();
  if (a3)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"Unavailable:"));
    BOOL v6 = v5;
    if ((a3 & 1) != 0) {
      [v5 appendString:@"AirplaneMode|"];
    }
    if ((a3 & 2) != 0) {
      [v6 appendString:@"GeographicalRegion|"];
    }
    if ((a3 & 4) != 0) {
      [v6 appendString:@"RecoveringFromError|"];
    }
    if ((a3 & 8) != 0) {
      [v6 appendString:@"NotReady|"];
    }
    if ((a3 & 0x10) != 0) {
      [v6 appendString:@"Unsupported|"];
    }
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringToIndex:", (char *)objc_msgSend(v6, "length") - 1));
  }

  else
  {
    v7 = @"Available";
  }

  objc_autoreleasePoolPop(v4);
  return v7;
}

+ (id)NISystemPassiveAccessIntentToString:(unsigned int)a3
{
  unsigned int v4 = objc_autoreleasePoolPush();
  if (a3)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"Intent:"));
    BOOL v6 = v5;
    if ((a3 & 1) != 0) {
      [v5 appendString:@"WristRaise|"];
    }
    if ((a3 & 2) != 0) {
      [v6 appendString:@"GeofenceEntry|"];
    }
    if ((a3 & 4) != 0) {
      [v6 appendString:@"WalletInteraction|"];
    }
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringToIndex:", (char *)objc_msgSend(v6, "length") - 1));
  }

  else
  {
    v7 = @"NoIntent";
  }

  objc_autoreleasePoolPop(v4);
  return v7;
}

@end