@interface IDSService
- (id)amsa_allDevices;
@end

@implementation IDSService

- (id)amsa_allDevices
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[IDSService linkedDevicesWithRelationship:](self, "linkedDevicesWithRelationship:", 1LL));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[IDSService linkedDevicesWithRelationship:](self, "linkedDevicesWithRelationship:", 2LL));
  if (v3 | v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (char *)[(id)v3 count] + (void)objc_msgSend((id)v4, "count")));
    v6 = v5;
    if (v3) {
      [v5 addObjectsFromArray:v3];
    }
    if (v4) {
      [v6 addObjectsFromArray:v4];
    }
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

@end