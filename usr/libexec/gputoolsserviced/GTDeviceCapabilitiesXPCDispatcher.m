@interface GTDeviceCapabilitiesXPCDispatcher
- (GTDeviceCapabilitiesXPCDispatcher)initWithService:(id)a3 properties:(id)a4;
- (void)daemonDeviceCapabilities:(id)a3 replyConnection:(id)a4;
- (void)deviceCompatibilityCapabilitiesWithHeapDescriptors_:(id)a3 replyConnection:(id)a4;
- (void)gpuToolsVersionQuery:(id)a3 replyConnection:(id)a4;
- (void)inferiorEnvironment_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTDeviceCapabilitiesXPCDispatcher

- (GTDeviceCapabilitiesXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a4 protocolMethods]);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GTDeviceCapabilitiesXPCDispatcher;
  v9 = -[GTXPCDispatcher initWithProtocolMethods:](&v11, "initWithProtocolMethods:", v8);

  if (v9) {
    objc_storeStrong((id *)&v9->_service, a3);
  }

  return v9;
}

- (void)daemonDeviceCapabilities:(id)a3 replyConnection:(id)a4
{
  service = self->_service;
  id v6 = a4;
  id v7 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[GTDeviceCapabilities daemonDeviceCapabilities](service, "daemonDeviceCapabilities"));
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_nsobject(v9, "returnValue", (uint64_t)v10);
  [v6 sendMessage:v9];
}

- (void)gpuToolsVersionQuery:(id)a3 replyConnection:(id)a4
{
  service = self->_service;
  id v6 = a4;
  id v7 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[GTDeviceCapabilities gpuToolsVersionQuery](service, "gpuToolsVersionQuery"));
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_nsobject(v9, "returnValue", (uint64_t)v10);
  [v6 sendMessage:v9];
}

- (void)inferiorEnvironment_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "launchDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTDeviceCapabilities inferiorEnvironment:](self->_service, "inferiorEnvironment:", nsdictionary_any));
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_nsobject(v10, "environment", (uint64_t)v8);
  [v6 sendMessage:v10];
}

- (void)deviceCompatibilityCapabilitiesWithHeapDescriptors_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "heapDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[GTDeviceCapabilities deviceCompatibilityCapabilitiesWithHeapDescriptors:]( self->_service,  "deviceCompatibilityCapabilitiesWithHeapDescriptors:",  nsdictionary_any));
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_nsobject(v10, "returnValue", (uint64_t)v8);
  [v6 sendMessage:v10];
}

- (void).cxx_destruct
{
}

@end