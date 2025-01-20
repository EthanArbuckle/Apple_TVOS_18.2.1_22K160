@interface UARPAccessoryIDWithLocationID
- (NSNumber)locationID;
- (UARPAccessoryID)accessoryID;
- (UARPAccessoryIDWithLocationID)initWithAccessoryID:(id)a3 locationID:(id)a4;
@end

@implementation UARPAccessoryIDWithLocationID

- (UARPAccessoryIDWithLocationID)initWithAccessoryID:(id)a3 locationID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___UARPAccessoryIDWithLocationID;
  v9 = -[UARPAccessoryIDWithLocationID init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryID, a3);
    objc_storeStrong((id *)&v10->_locationID, a4);
  }

  return v10;
}

- (UARPAccessoryID)accessoryID
{
  return (UARPAccessoryID *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSNumber)locationID
{
  return (NSNumber *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end