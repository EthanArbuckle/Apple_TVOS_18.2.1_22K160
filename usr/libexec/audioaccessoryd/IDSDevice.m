@interface IDSDevice
- (id)cpDescription;
- (id)deviceTypeToString;
@end

@implementation IDSDevice

- (id)cpDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice name](self, "name"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueID](self, "uniqueID"));
  v5 = (void *)v4;
  if (v4) {
    v6 = (const __CFString *)v4;
  }
  else {
    v6 = @"unknown ID";
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice nsuuid](self, "nsuuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%@), BT: (%@)",  v3,  v6,  v7));

  return v8;
}

- (id)deviceTypeToString
{
  id v2 = -[IDSDevice deviceType](self, "deviceType");
  else {
    return (id)*((void *)&off_100208FE0 + (void)v2);
  }
}

@end