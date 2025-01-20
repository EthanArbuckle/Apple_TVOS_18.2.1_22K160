@interface CBAccessoryLogging
+ (id)getComponentNameFromProductID:(unint64_t)a3;
+ (id)getComponentNameFromRadarReason:(int)a3;
+ (id)getComponentVersionFromProductID:(unint64_t)a3;
+ (id)getComponentVersionFromRadarReason:(int)a3;
+ (id)getProductNameFromProductID:(unint64_t)a3;
+ (unint64_t)getComponentIDFromProductID:(unint64_t)a3;
+ (unint64_t)getComponentIDFromRadarReason:(int)a3;
@end

@implementation CBAccessoryLogging

+ (id)getProductNameFromProductID:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  unint64_t v6 = a3 - 8194;
  v7 = @"Beats Studio Pro";
  switch(v6)
  {
    case 0uLL:
      v9 = @"AIRPODS";
      v10 = @"AirPods";
      goto LABEL_16;
    case 1uLL:
      v9 = @"POWERBEATS3";
      v10 = @"Powerbeats³";
      goto LABEL_16;
    case 3uLL:
      v9 = @"BEATSX";
      v10 = @"Beatsˣ";
      goto LABEL_16;
    case 4uLL:
      v9 = @"SOLO3";
      v10 = @"Beats Solo³";
      goto LABEL_16;
    case 7uLL:
      v9 = @"BEATSSTUDIO3";
      v10 = @"Beats Studio³";
      goto LABEL_16;
    case 8uLL:
    case 0x1DuLL:

      return @"AirPods Max";
    case 9uLL:
      v9 = @"POWERBEATSPRO";
      v10 = @"PowerBeats Pro";
      goto LABEL_16;
    case 0xAuLL:
      v9 = @"SOLOPRO";
      v10 = @"Beats Solo Pro";
LABEL_16:
      [v4 localizedStringForKey:v9 value:v10 table:0];
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      return v11;
    case 0xBuLL:

      return @"Powerbeats 4";
    case 0xCuLL:
    case 0x12uLL:
    case 0x22uLL:

      return @"AirPods Pro";
    case 0xDuLL:

      return @"AirPods 2";
    case 0xEuLL:

      return @"Beats Flex";
    case 0xFuLL:

      return @"Beats Studio Buds";
    case 0x11uLL:

      return @"AirPods 3";
    case 0x13uLL:
    case 0x16uLL:
    case 0x1AuLL:

      return @"AirPods Case";
    case 0x14uLL:

      return @"Beats Studio Buds +";
    case 0x15uLL:
      goto LABEL_3;
    case 0x17uLL:
    case 0x19uLL:
    case 0x1CuLL:
    case 0x1EuLL:
      v7 = @"AirPods";
LABEL_3:

      id result = v7;
      break;
    default:

      id result = @"Unknown";
      break;
  }

  return result;
}

+ (unint64_t)getComponentIDFromProductID:(unint64_t)a3
{
  if (a3 - 8194 > 0x22) {
    return 1210810LL;
  }
  else {
    return qword_18702B310[a3 - 8194];
  }
}

+ (id)getComponentNameFromProductID:(unint64_t)a3
{
  if (a3 - 8194 > 0x22) {
    return @"AudioProducts FW";
  }
  else {
    return off_189FB27C8[a3 - 8194];
  }
}

+ (id)getComponentVersionFromProductID:(unint64_t)a3
{
  if (a3 - 8194 > 0x22) {
    return @"All";
  }
  else {
    return off_189FB28E0[a3 - 8194];
  }
}

+ (unint64_t)getComponentIDFromRadarReason:(int)a3
{
  if (a3 == 5) {
    return 1046269LL;
  }
  else {
    return 1210810LL;
  }
}

+ (id)getComponentNameFromRadarReason:(int)a3
{
  if (a3 == 5) {
    return @"SpockEngine";
  }
  else {
    return @"AudioProducts FW";
  }
}

+ (id)getComponentVersionFromRadarReason:(int)a3
{
  if (a3 == 5) {
    return @"New Bugs";
  }
  else {
    return @"All";
  }
}

@end