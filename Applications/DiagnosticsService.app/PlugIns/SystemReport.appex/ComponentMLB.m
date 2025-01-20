@interface ComponentMLB
- (BOOL)isPresent;
- (id)serialNumber;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentMLB

- (BOOL)isPresent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentMLB serialNumber](self, "serialNumber"));
  BOOL valid = isValidSerialNumber(v2);

  return valid;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ComponentMLB serialNumber](self, "serialNumber"));
  [v4 setObject:v5 forKeyedSubscript:@"serialNumber"];
}

- (id)serialNumber
{
  v2 = (void *)MGCopyAnswer(@"MLBSerialNumber", 0LL);
  id v3 = stringOrNull(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

@end