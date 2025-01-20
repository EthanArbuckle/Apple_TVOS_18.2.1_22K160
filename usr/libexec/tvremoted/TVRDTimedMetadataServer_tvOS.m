@interface TVRDTimedMetadataServer_tvOS
- (TVRCTimedMetadataUpdating)timedMetadataUpdater;
- (TVRDTimedMetadataServer_tvOS)initWithTimedMetadataUpdater:(id)a3;
- (void)addNewConnection:(id)a3;
- (void)setTimedMetadataUpdater:(id)a3;
@end

@implementation TVRDTimedMetadataServer_tvOS

- (TVRDTimedMetadataServer_tvOS)initWithTimedMetadataUpdater:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVRDTimedMetadataServer_tvOS;
  v6 = -[TVRDTimedMetadataServer_tvOS init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_timedMetadataUpdater, a3);
  }

  return v7;
}

- (void)addNewConnection:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TVRCTimedMetadataUpdating));
  [v4 setExportedInterface:v6];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDTimedMetadataServer_tvOS timedMetadataUpdater](self, "timedMetadataUpdater"));
  [v4 setExportedObject:v5];
}

- (TVRCTimedMetadataUpdating)timedMetadataUpdater
{
  return self->_timedMetadataUpdater;
}

- (void)setTimedMetadataUpdater:(id)a3
{
}

- (void).cxx_destruct
{
}

@end