@interface MRDVirtualAudioInputServer
- (MRDVirtualAudioInputServer)init;
- (MRDVirtualAudioInputServerDelegate)delegate;
- (NSArray)recordingEndpointClients;
- (NSArray)registeredDevices;
- (id)registeredDeviceWithID:(unsigned int)a3;
- (void)_handleGetDevicesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleInputDeviceConnectedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleInputDeviceDisconnectedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRecordingEndpointAvailabilityMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRecordingStateChangedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleVoiceDataReceivedMessage:(id)a3 fromClient:(id)a4;
- (void)clearRecordingEndpointsForClient:(id)a3;
- (void)clearRegisteredDevicesForClient:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MRDVirtualAudioInputServer

- (MRDVirtualAudioInputServer)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MRDVirtualAudioInputServer;
  v2 = -[MRDVirtualAudioInputServer init](&v14, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    recordingEndpointClients = v2->_recordingEndpointClients;
    v2->_recordingEndpointClients = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    registeredDevices = v2->_registeredDevices;
    v2->_registeredDevices = v5;

    v7 = (objc_class *)objc_opt_class(v2);
    Name = class_getName(v7);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create(Name, v10);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v11;
  }

  return v2;
}

- (NSArray)recordingEndpointClients
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  dispatch_queue_attr_t v9 = sub_100121EF4;
  v10 = sub_100121F04;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100121F0C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)registeredDevices
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  dispatch_queue_attr_t v9 = sub_100121EF4;
  v10 = sub_100121F04;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100121FF8;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (id)registeredDeviceWithID:(unsigned int)a3
{
  uint64_t v8 = 0LL;
  dispatch_queue_attr_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_100121EF4;
  v12 = sub_100121F04;
  id v13 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001220E8;
  block[3] = &unk_1003A1958;
  unsigned int v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(serialQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (void)clearRegisteredDevicesForClient:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100122284;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)clearRecordingEndpointsForClient:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100122434;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  switch(xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY"))
  {
    case 0x900000000000001uLL:
      -[MRDVirtualAudioInputServer _handleGetDevicesMessage:fromClient:]( self,  "_handleGetDevicesMessage:fromClient:",  xdict,  v6);
      break;
    case 0x900000000000002uLL:
      -[MRDVirtualAudioInputServer _handleInputDeviceConnectedMessage:fromClient:]( self,  "_handleInputDeviceConnectedMessage:fromClient:",  xdict,  v6);
      break;
    case 0x900000000000003uLL:
      -[MRDVirtualAudioInputServer _handleInputDeviceDisconnectedMessage:fromClient:]( self,  "_handleInputDeviceDisconnectedMessage:fromClient:",  xdict,  v6);
      break;
    case 0x900000000000004uLL:
      -[MRDVirtualAudioInputServer _handleRecordingStateChangedMessage:fromClient:]( self,  "_handleRecordingStateChangedMessage:fromClient:",  xdict,  v6);
      break;
    case 0x900000000000005uLL:
      -[MRDVirtualAudioInputServer _handleVoiceDataReceivedMessage:fromClient:]( self,  "_handleVoiceDataReceivedMessage:fromClient:",  xdict,  v6);
      break;
    case 0x900000000000006uLL:
      -[MRDVirtualAudioInputServer _handleRecordingEndpointAvailabilityMessage:fromClient:]( self,  "_handleRecordingEndpointAvailabilityMessage:fromClient:",  xdict,  v6);
      break;
    default:
      break;
  }
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001226AC;
  block[3] = &unk_100398E60;
  id v8 = v4;
  dispatch_queue_attr_t v9 = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)_handleGetDevicesMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001227B8;
  block[3] = &unk_100398E60;
  void block[4] = self;
  id v11 = v6;
  dispatch_queue_attr_t v9 = v6;
  dispatch_sync(serialQueue, block);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v9,  200LL,  0LL,  0LL));
  sub_10013AC78(v5, (uint64_t)"MRXPC_VOICE_INPUT_DEVICES_DATA_KEY", v8, 0LL);
}

- (void)_handleInputDeviceConnectedMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_attr_t v9 = (void *)MRCreateDataFromXPCMessage(v6, "MRXPC_VOICE_INPUT_DESCRIPTOR_DATA_KEY");
  if (v9)
  {
    uint64_t v10 = (void *)MRVirtualVoiceInputDeviceDescriptorCreateFromExternalRepresentation(kCFAllocatorDefault, v9);
    id v11 = -[MRDVirtualAudioInputServerDevice initWithOwningClient:]( objc_alloc(&OBJC_CLASS___MRDVirtualAudioInputServerDevice),  "initWithOwningClient:",  v7);
    -[MRDVirtualAudioInputServerDevice setDescriptor:](v11, "setDescriptor:", v10);
    unsigned int v41 = -[MRDVirtualAudioInputServerDevice deviceID](v11, "deviceID");
    uint64_t v13 = _MRLogForCategory(4LL, v12);
    objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1002BA080((uint64_t)v10, v14, v15);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDVirtualAudioInputServer recordingEndpointClients](self, "recordingEndpointClients"));
    uint64_t v18 = _MRLogForCategory(4LL, v17);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_1002BA000(v16, v19);
    }

    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v20 = v16;
    id v21 = [v20 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v45;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v45 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v44 + 1) + 8 * (void)i) relayXPCMessage:v6 andReply:0];
        }

        id v22 = [v20 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }

      while (v22);
    }

    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100122BA8;
    block[3] = &unk_100398E60;
    void block[4] = self;
    v43 = v11;
    v26 = v11;
    dispatch_sync(serialQueue, block);

    uint64_t v27 = 0LL;
    uint64_t v28 = v41;
  }

  else
  {
    uint64_t v29 = _MRLogForCategory(4LL, v8);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_1002B9FD0(v30, v31, v32, v33, v34, v35, v36, v37);
    }

    uint64_t v28 = 0LL;
    uint64_t v27 = 2LL;
  }

  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v6);
  v39 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  if (v39)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    xpc_dictionary_set_uint64(reply, "MRXPC_VOICE_INPUT_DEVICE_ID_KEY", v28);
    MRAddErrorToXPCMessage(reply, v27);
    xpc_connection_send_message(v39, reply);
  }
}

- (void)_handleInputDeviceDisconnectedMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_VOICE_INPUT_DEVICE_ID_KEY");
  uint64_t v10 = _MRLogForCategory(4LL, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = v11;
  if (uint64)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1002BA1B8();
    }

    uint64_t v38 = 0LL;
    v39 = &v38;
    uint64_t v40 = 0x2020000000LL;
    char v41 = 0;
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100122E68;
    block[3] = &unk_1003A1958;
    int v37 = uint64;
    void block[4] = self;
    void block[5] = &v38;
    dispatch_sync(serialQueue, block);
    if (*((_BYTE *)v39 + 24))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDVirtualAudioInputServer recordingEndpointClients](self, "recordingEndpointClients"));
      uint64_t v17 = _MRLogForCategory(4LL, v16);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_1002BA17C((uint64_t)v43, (uint64_t)[v15 count], v18);
      }

      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      id v19 = v15;
      id v20 = [v19 countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v33;
        do
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v19);
            }
            objc_msgSend( *(id *)(*((void *)&v32 + 1) + 8 * (void)i),  "relayXPCMessage:andReply:",  v6,  0,  (void)v32);
          }

          id v20 = [v19 countByEnumeratingWithState:&v32 objects:v42 count:16];
        }

        while (v20);
      }

      unsigned int v23 = 0;
    }

    else
    {
      uint64_t v31 = _MRLogForCategory(4LL, v14);
      id v19 = (id)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
        sub_1002BA11C();
      }
      unsigned int v23 = 22;
    }

    _Block_object_dispose(&v38, 8);
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1002BA0EC(v12, v24, v25, v26, v27, v28, v29, v30);
    }

    unsigned int v23 = 22;
  }

  sub_10013AD7C(v6, v23);
}

- (void)_handleRecordingStateChangedMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = -[MRDVirtualAudioInputServer registeredDeviceWithID:]( self,  "registeredDeviceWithID:",  xpc_dictionary_get_uint64(v5, "MRXPC_VOICE_INPUT_DEVICE_ID_KEY"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v9 = _MRLogForCategory(4LL, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1002BA278();
  }

  if (v7)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v5, "MRXPC_VOICE_RECORDING_STATE");
    [v7 setRecordingState:uint64];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v14 = objc_opt_respondsToSelector(WeakRetained, "virtualAudioInputServer:didUpdateRecordingState:forDevice:");

    if ((v14 & 1) == 0)
    {
      unsigned int v16 = 0;
      goto LABEL_11;
    }

    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 virtualAudioInputServer:self didUpdateRecordingState:uint64 forDevice:v7];
    unsigned int v16 = 0;
  }

  else
  {
    uint64_t v17 = _MRLogForCategory(4LL, v11);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
      sub_1002BA218();
    }
    unsigned int v16 = 22;
  }

LABEL_11:
  sub_10013AD7C(v5, v16);
}

- (void)_handleVoiceDataReceivedMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDVirtualAudioInputServer recordingEndpointClients](self, "recordingEndpointClients"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) relayXPCMessage:v5 andReply:0];
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (void)_handleRecordingEndpointAvailabilityMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = xpc_dictionary_get_BOOL(v7, "MRXPC_VOICE_RECORDING_ENDPOINT_AVAILABLE_KEY");
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001232B0;
  block[3] = &unk_10039AA30;
  BOOL v13 = v8;
  void block[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_sync(serialQueue, block);
  sub_10013AD7C(v7, 0);
}

- (MRDVirtualAudioInputServerDelegate)delegate
{
  return (MRDVirtualAudioInputServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end