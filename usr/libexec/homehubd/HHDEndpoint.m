@interface HHDEndpoint
+ (id)endpointWithAccessoryId:(id)a3 mediaRouteId:(id)a4 bubbleId:(id)a5 state:(unint64_t)a6;
- (BOOL)operationInProgress;
- (HHDEndpoint)initWithAccessoryId:(id)a3 mediaRouteId:(id)a4 bubbleId:(id)a5 state:(unint64_t)a6;
- (NSString)mediaRouteId;
- (NSUUID)accessoryId;
- (NSUUID)endpointId;
- (NSUUID)launchInstanceId;
- (id)bridgedEndpoint;
- (unint64_t)bubbleId;
- (unint64_t)state;
- (void)setOperationInProgress:(BOOL)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation HHDEndpoint

- (HHDEndpoint)initWithAccessoryId:(id)a3 mediaRouteId:(id)a4 bubbleId:(id)a5 state:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___HHDEndpoint;
  v14 = -[HHDEndpoint init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_launchInstanceId, a5);
    objc_storeStrong((id *)&v15->_mediaRouteId, a4);
    objc_storeStrong((id *)&v15->_accessoryId, a3);
    v15->_state = a6;
    v15->_operationInProgress = 0;
  }

  return v15;
}

+ (id)endpointWithAccessoryId:(id)a3 mediaRouteId:(id)a4 bubbleId:(id)a5 state:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v13)),  "initWithAccessoryId:mediaRouteId:bubbleId:state:",  v12,  v11,  v10,  a6);

  return v14;
}

- (unint64_t)bubbleId
{
  return 0LL;
}

- (NSUUID)endpointId
{
  return self->_accessoryId;
}

- (NSUUID)accessoryId
{
  return self->_accessoryId;
}

- (NSString)mediaRouteId
{
  return self->_mediaRouteId;
}

- (NSUUID)launchInstanceId
{
  return self->_launchInstanceId;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)operationInProgress
{
  return self->_operationInProgress;
}

- (void)setOperationInProgress:(BOOL)a3
{
  self->_operationInProgress = a3;
}

- (void).cxx_destruct
{
}

- (id)bridgedEndpoint
{
  v3 = objc_alloc(&OBJC_CLASS___HHEndpoint);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HHDEndpoint accessoryId](self, "accessoryId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HHDEndpoint mediaRouteId](self, "mediaRouteId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HHDEndpoint launchInstanceId](self, "launchInstanceId"));
  v7 = -[HHEndpoint initWithAccessoryId:mediaRouteId:bubbleId:state:]( v3,  "initWithAccessoryId:mediaRouteId:bubbleId:state:",  v4,  v5,  v6,  -[HHDEndpoint state](self, "state"));

  return v7;
}

@end