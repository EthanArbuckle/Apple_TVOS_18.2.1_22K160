@interface UARPiCloudZone
- (CKRecordZoneID)zoneID;
- (CKServerChangeToken)changeToken;
- (NSString)containerID;
- (UARPiCloudZone)initWithZoneID:(id)a3 containerID:(id)a4;
- (void)setChangeToken:(id)a3;
- (void)setContainerID:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation UARPiCloudZone

- (UARPiCloudZone)initWithZoneID:(id)a3 containerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___UARPiCloudZone;
  v8 = -[UARPiCloudZone init](&v14, sel_init);
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    zoneID = v8->_zoneID;
    v8->_zoneID = (CKRecordZoneID *)v9;

    uint64_t v11 = [v7 copy];
    containerID = v8->_containerID;
    v8->_containerID = (NSString *)v11;
  }

  return v8;
}

- (void)setChangeToken:(id)a3
{
  v4 = (CKServerChangeToken *)a3;
  if (v4)
  {
    id v13 = 0LL;
    [MEMORY[0x1896078F8] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v13];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = v13;
    id v7 = (void *)NSString;
    containerID = self->_containerID;
    -[CKRecordZoneID zoneName](self->_zoneID, "zoneName");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 stringWithFormat:@"%@_%@", containerID, v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    saveEntryForKey(v5, v10);
  }

  else
  {
    v5 = 0LL;
    id v6 = 0LL;
  }

  changeToken = self->_changeToken;
  self->_changeToken = v4;
  v12 = v4;
}

- (CKServerChangeToken)changeToken
{
  v3 = (void *)NSString;
  containerID = self->_containerID;
  v5 = -[CKRecordZoneID zoneName](self->_zoneID, "zoneName");
  [v3 stringWithFormat:@"%@_%@", containerID, v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_changeToken)
  {
    id v7 = 0LL;
  }

  else
  {
    getEntryForKey(v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      id v13 = 0LL;
      [MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v13];
      uint64_t v9 = (CKServerChangeToken *)objc_claimAutoreleasedReturnValue();
      id v8 = v13;
      changeToken = self->_changeToken;
      self->_changeToken = v9;

      goto LABEL_6;
    }
  }

  id v8 = 0LL;
LABEL_6:
  uint64_t v11 = self->_changeToken;

  return v11;
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setZoneID:(id)a3
{
}

- (NSString)containerID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setContainerID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end