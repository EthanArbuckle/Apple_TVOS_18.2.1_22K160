@interface BMSyncDevicePeer
- (BMSyncDevicePeer)initWithDeviceIdentifier:(id)a3 metadata:(id)a4 protocolVersion:(unint64_t)a5;
- (BMSyncDevicePeer)initWithFMResultSet:(id)a3;
- (BMSyncDevicePeerMetadata)metadata;
- (BOOL)isEqual:(id)a3;
- (NSString)deviceIdentifier;
- (NSString)idsDeviceIdentifier;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (unint64_t)hash;
- (unint64_t)protocolVersion;
- (void)setIdsDeviceIdentifier:(id)a3;
- (void)setProtocolVersion:(unint64_t)a3;
@end

@implementation BMSyncDevicePeer

- (BMSyncDevicePeer)initWithFMResultSet:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForColumn:@"device_identifier"]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForColumn:@"ids_device_identifier"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForColumn:@"name"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForColumn:@"model"]);
  uint64_t v9 = (int)[v4 intForColumn:@"platform"];
  signed int v10 = [v4 intForColumn:@"protocol_version"];

  v11 = -[BMSyncDevicePeerMetadata initWithName:model:platform:]( objc_alloc(&OBJC_CLASS___BMSyncDevicePeerMetadata),  "initWithName:model:platform:",  v7,  v8,  v9);
  v12 = -[BMSyncDevicePeer initWithDeviceIdentifier:metadata:protocolVersion:]( objc_alloc(&OBJC_CLASS___BMSyncDevicePeer),  "initWithDeviceIdentifier:metadata:protocolVersion:",  v5,  v11,  v10);
  -[BMSyncDevicePeer setIdsDeviceIdentifier:](v12, "setIdsDeviceIdentifier:", v6);

  return v12;
}

- (BMSyncDevicePeer)initWithDeviceIdentifier:(id)a3 metadata:(id)a4 protocolVersion:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___BMSyncDevicePeer;
  v11 = -[BMSyncDevicePeer init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_deviceIdentifier, a3);
    objc_storeStrong((id *)&v12->_metadata, a4);
    v12->_protocolVersion = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___BMSyncDevicePeer, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    deviceIdentifier = self->_deviceIdentifier;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceIdentifier]);
    if (-[NSString isEqualToString:](deviceIdentifier, "isEqualToString:", v9))
    {
      metadata = self->_metadata;
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
      if (-[BMSyncDevicePeerMetadata isEqual:](metadata, "isEqual:", v11))
      {
        id protocolVersion = (id)self->_protocolVersion;
        BOOL v13 = protocolVersion == [v7 protocolVersion];
      }

      else
      {
        BOOL v13 = 0;
      }
    }

    else
    {
      BOOL v13 = 0;
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_deviceIdentifier, "hash");
  unint64_t v4 = -[BMSyncDevicePeerMetadata hash](self->_metadata, "hash") ^ v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_protocolVersion));
  unint64_t v6 = v4 ^ (unint64_t)[v5 hash];

  return v6;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"deviceIdentifier"]);
  unint64_t v6 = objc_alloc(&OBJC_CLASS___BMSyncDevicePeerMetadata);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"deviceMetadata"]);
  id v8 = -[BMSyncDevicePeerMetadata initFromDictionary:](v6, "initFromDictionary:", v7);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"protocolVersion"]);
  id v10 = [v9 unsignedIntegerValue];

  v11 = -[BMSyncDevicePeer initWithDeviceIdentifier:metadata:protocolVersion:]( self,  "initWithDeviceIdentifier:metadata:protocolVersion:",  v5,  v8,  v10);
  return v11;
}

- (id)dictionaryRepresentation
{
  v8[0] = self->_deviceIdentifier;
  v7[0] = @"deviceIdentifier";
  v7[1] = @"deviceMetadata";
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeerMetadata dictionaryRepresentation](self->_metadata, "dictionaryRepresentation"));
  v8[1] = v3;
  v7[2] = @"protocolVersion";
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_protocolVersion));
  v8[2] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  3LL));

  return v5;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)idsDeviceIdentifier
{
  return self->_idsDeviceIdentifier;
}

- (void)setIdsDeviceIdentifier:(id)a3
{
}

- (BMSyncDevicePeerMetadata)metadata
{
  return self->_metadata;
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unint64_t)a3
{
  self->_id protocolVersion = a3;
}

- (void).cxx_destruct
{
}

@end