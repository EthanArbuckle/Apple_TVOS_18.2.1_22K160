@interface AFDeviceContext
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation AFDeviceContext

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[AFMutableDeviceContext allocWithZone:](&OBJC_CLASS___AFMutableDeviceContext, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AFDeviceContext serializedBackingStore](self, "serializedBackingStore"));
  id v6 = -[AFDeviceContext fromLocalDevice](self, "fromLocalDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AFDeviceContext contextCollectorSource](self, "contextCollectorSource"));
  v8 = -[AFMutableDeviceContext initWithSerializedBackingStore:fromLocalDevice:contextCollectorSource:]( v4,  "initWithSerializedBackingStore:fromLocalDevice:contextCollectorSource:",  v5,  v6,  v7);

  return v8;
}

@end