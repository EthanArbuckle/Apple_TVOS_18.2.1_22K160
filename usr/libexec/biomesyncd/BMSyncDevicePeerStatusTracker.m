@interface BMSyncDevicePeerStatusTracker
- (BMSyncDevicePeerStatusTracker)initWithDatabase:(id)a3;
- (BOOL)setLastSyncDate:(id)a3 forDeviceWithIdentifier:(id)a4;
- (BOOL)upsertSyncDevicePeer:(id)a3;
- (id)allPeers;
- (id)deviceWithIdentifier:(id)a3;
- (id)lastSyncDateFromAnyDevice;
- (id)lastSyncDateOfDeviceWithIdentifier:(id)a3;
- (id)localDeviceIdentifierCreatingIfNecessary;
- (id)localDeviceUpdatingIfNeccesaryWithProtocolVersion:(unint64_t)a3;
- (void)setLocalDeviceIdentifier:(id)a3;
@end

@implementation BMSyncDevicePeerStatusTracker

- (BMSyncDevicePeerStatusTracker)initWithDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BMSyncDevicePeerStatusTracker;
  v6 = -[BMSyncDevicePeerStatusTracker init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_database, a3);
  }

  return v7;
}

- (id)localDeviceIdentifierCreatingIfNecessary
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[BMSyncDatabase localDevice](self->_database, "localDevice"));
  if (v3)
  {
    v4 = (BMSyncDevicePeer *)v3;
  }

  else
  {
    id v5 = objc_alloc(&OBJC_CLASS___BMSyncDevicePeer);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[BMSyncDevicePeerMetadata devicePeerMetadata]( &OBJC_CLASS___BMSyncDevicePeerMetadata,  "devicePeerMetadata"));
    v4 = -[BMSyncDevicePeer initWithDeviceIdentifier:metadata:protocolVersion:]( v5,  "initWithDeviceIdentifier:metadata:protocolVersion:",  v7,  v8,  0LL);

    -[BMSyncDatabase upsertSyncDevicePeer:isMe:](self->_database, "upsertSyncDevicePeer:isMe:", v4, 1LL);
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeer deviceIdentifier](v4, "deviceIdentifier"));

  return v9;
}

- (id)localDeviceUpdatingIfNeccesaryWithProtocolVersion:(unint64_t)a3
{
  id v5 = (BMSyncDevicePeer *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase localDevice](self->_database, "localDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeer deviceIdentifier](v5, "deviceIdentifier"));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  }

  v8 = objc_alloc(&OBJC_CLASS___BMSyncDevicePeer);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[BMSyncDevicePeerMetadata devicePeerMetadata]( &OBJC_CLASS___BMSyncDevicePeerMetadata,  "devicePeerMetadata"));
  v10 = -[BMSyncDevicePeer initWithDeviceIdentifier:metadata:protocolVersion:]( v8,  "initWithDeviceIdentifier:metadata:protocolVersion:",  v6,  v9,  a3);

  if (!-[BMSyncDevicePeer isEqual:](v5, "isEqual:", v10)
    && -[BMSyncDatabase upsertSyncDevicePeer:isMe:](self->_database, "upsertSyncDevicePeer:isMe:", v10, 1LL))
  {
    v11 = v10;

    id v5 = v11;
  }

  return v5;
}

- (BOOL)upsertSyncDevicePeer:(id)a3
{
  return -[BMSyncDatabase upsertSyncDevicePeer:isMe:](self->_database, "upsertSyncDevicePeer:isMe:", a3, 0LL);
}

- (id)deviceWithIdentifier:(id)a3
{
  return -[BMSyncDatabase deviceWithIdentifier:](self->_database, "deviceWithIdentifier:", a3);
}

- (id)lastSyncDateFromAnyDevice
{
  return -[BMSyncDatabase lastSyncDateFromAnyDevice](self->_database, "lastSyncDateFromAnyDevice");
}

- (id)lastSyncDateOfDeviceWithIdentifier:(id)a3
{
  return -[BMSyncDatabase lastSyncDateOfDeviceWithIdentifier:]( self->_database,  "lastSyncDateOfDeviceWithIdentifier:",  a3);
}

- (BOOL)setLastSyncDate:(id)a3 forDeviceWithIdentifier:(id)a4
{
  if (a4) {
    return -[BMSyncDatabase setLastSyncDate:forDeviceWithIdentifier:]( self->_database,  "setLastSyncDate:forDeviceWithIdentifier:",  a3);
  }
  uint64_t v6 = __biome_log_for_category(11LL);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    sub_100043B08((uint64_t)self, v7);
  }

  return 0;
}

- (void)setLocalDeviceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v6 = -[BMSyncDevicePeerMetadata initWithName:model:platform:]( objc_alloc(&OBJC_CLASS___BMSyncDevicePeerMetadata),  "initWithName:model:platform:",  0LL,  &stru_100069BD0,  0LL);
  id v5 = -[BMSyncDevicePeer initWithDeviceIdentifier:metadata:protocolVersion:]( objc_alloc(&OBJC_CLASS___BMSyncDevicePeer),  "initWithDeviceIdentifier:metadata:protocolVersion:",  v4,  v6,  0LL);

  -[BMSyncDatabase upsertSyncDevicePeer:isMe:](self->_database, "upsertSyncDevicePeer:isMe:", v5, 1LL);
}

- (id)allPeers
{
  return -[BMSyncDatabase allPeers](self->_database, "allPeers");
}

- (void).cxx_destruct
{
}

@end