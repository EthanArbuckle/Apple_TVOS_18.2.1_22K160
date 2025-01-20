@interface MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics
- (BOOL)requestContainsLocalDeviceUID;
- (BOOL)requestForCompanionOrigin;
- (BOOL)requestForCurrentConfiguration;
- (BOOL)requestForLocalOrigin;
- (MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics)init;
- (MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics)initWithDetails:(id)a3 deviceInfo:(id)a4 numberOfRequestedOutputDeviceUIDs:(int64_t)a5 timeout:(double)a6;
- (MRDTimingEvent)connect;
- (MRDTimingEvent)createEndpointWithCurrentTopology;
- (MRDTimingEvent)createOptimizedEndpoint;
- (MRDTimingEvent)createPartialEndpoint;
- (MRDTimingEvent)sendCommand;
- (MRDeviceInfo)deviceInfo;
- (MRRequestDetails)details;
- (NSString)commandString;
- (double)timeout;
- (int64_t)command;
- (int64_t)numberOfRequestedOutputDeviceUIDs;
- (void)setCommand:(int64_t)a3;
- (void)setCommandString:(id)a3;
- (void)setConnect:(id)a3;
- (void)setCreateEndpointWithCurrentTopology:(id)a3;
- (void)setCreateOptimizedEndpoint:(id)a3;
- (void)setCreatePartialEndpoint:(id)a3;
- (void)setDetails:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setNumberOfRequestedOutputDeviceUIDs:(int64_t)a3;
- (void)setRequestContainsLocalDeviceUID:(BOOL)a3;
- (void)setRequestForCompanionOrigin:(BOOL)a3;
- (void)setRequestForCurrentConfiguration:(BOOL)a3;
- (void)setRequestForLocalOrigin:(BOOL)a3;
- (void)setSendCommand:(id)a3;
- (void)setTimeout:(double)a3;
- (void)track;
- (void)trackWithError:(id)a3;
@end

@implementation MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics

- (MRRequestDetails)details
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_details);
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_details,  v4,  0LL,  0LL);
  return (MRRequestDetails *)*v2;
}

- (void)setDetails:(id)a3
{
}

- (MRDeviceInfo)deviceInfo
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_deviceInfo);
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_deviceInfo,  v4,  0LL,  0LL);
  return (MRDeviceInfo *)*v2;
}

- (void)setDeviceInfo:(id)a3
{
}

- (int64_t)command
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_command);
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_command,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setCommand:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_command);
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_command,  v5,  1LL,  0LL);
  int64_t *v4 = a3;
}

- (NSString)commandString
{
  return (NSString *)sub_10021FBE0( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_commandString);
}

- (void)setCommandString:(id)a3
{
}

- (BOOL)requestContainsLocalDeviceUID
{
  v2 = (BOOL *)self
     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestContainsLocalDeviceUID;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestContainsLocalDeviceUID,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setRequestContainsLocalDeviceUID:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestContainsLocalDeviceUID;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestContainsLocalDeviceUID,  v5,  1LL,  0LL);
  BOOL *v4 = a3;
}

- (BOOL)requestForCurrentConfiguration
{
  v2 = (BOOL *)self
     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForCurrentConfiguration;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForCurrentConfiguration,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setRequestForCurrentConfiguration:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForCurrentConfiguration;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForCurrentConfiguration,  v5,  1LL,  0LL);
  BOOL *v4 = a3;
}

- (BOOL)requestForLocalOrigin
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForLocalOrigin;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForLocalOrigin,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setRequestForLocalOrigin:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForLocalOrigin;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForLocalOrigin,  v5,  1LL,  0LL);
  BOOL *v4 = a3;
}

- (BOOL)requestForCompanionOrigin
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForCompanionOrigin;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForCompanionOrigin,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setRequestForCompanionOrigin:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForCompanionOrigin;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForCompanionOrigin,  v5,  1LL,  0LL);
  BOOL *v4 = a3;
}

- (int64_t)numberOfRequestedOutputDeviceUIDs
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_numberOfRequestedOutputDeviceUIDs);
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_numberOfRequestedOutputDeviceUIDs,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setNumberOfRequestedOutputDeviceUIDs:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_numberOfRequestedOutputDeviceUIDs);
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_numberOfRequestedOutputDeviceUIDs,  v5,  1LL,  0LL);
  int64_t *v4 = a3;
}

- (double)timeout
{
  v2 = (double *)((char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_timeout);
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_timeout,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setTimeout:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_timeout);
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_timeout,  v5,  1LL,  0LL);
  double *v4 = a3;
}

- (MRDTimingEvent)createOptimizedEndpoint
{
  v2 = self;
  id v3 = sub_10021EA58();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateOptimizedEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createOptimizedEndpoint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createOptimizedEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)createEndpointWithCurrentTopology
{
  v2 = self;
  id v3 = sub_10021EAC8();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateEndpointWithCurrentTopology:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createEndpointWithCurrentTopology);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createEndpointWithCurrentTopology) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)createPartialEndpoint
{
  v2 = self;
  id v3 = sub_10021EB38();

  return (MRDTimingEvent *)v3;
}

- (void)setCreatePartialEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createPartialEndpoint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createPartialEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)connect
{
  v2 = self;
  id v3 = sub_10021EBA8();

  return (MRDTimingEvent *)v3;
}

- (void)setConnect:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___connect);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___connect) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)sendCommand
{
  v2 = self;
  id v3 = sub_10021EC18();

  return (MRDTimingEvent *)v3;
}

- (void)setSendCommand:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___sendCommand);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___sendCommand) = (Class)a3;
  id v3 = a3;
}

- (MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics)initWithDetails:(id)a3 deviceInfo:(id)a4 numberOfRequestedOutputDeviceUIDs:(int64_t)a5 timeout:(double)a6
{
  return (MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics *)sub_10021F674( (uint64_t)a3,  (uint64_t)a4,  a5,  a6);
}

- (void)trackWithError:(id)a3
{
}

- (void)track
{
}

- (MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics)init
{
  result = (MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.SendCommandToNewEndpointWithOutpu tDevicesRequestAnalytics",  70LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_details));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_deviceInfo));
  swift_bridgeObjectRelease(*(void *)&self->details[OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_commandString]);
  swift_bridgeObjectRelease(*(void *)&self->details[OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_eventName]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createOptimizedEndpoint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createEndpointWithCurrentTopology));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createPartialEndpoint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___connect));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___sendCommand));
}

@end