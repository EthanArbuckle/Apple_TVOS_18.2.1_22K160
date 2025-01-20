@interface PDAccessPassSharingIDSService
- (BOOL)isEndpoint:(id)a3 forSameDeviceIn:(id)a4;
- (PDAccessPassSharingIDSService)init;
- (PDAccessPassSharingIDSService)initWithIDSSharingService:(id)a3 delegate:(id)a4;
- (id)resolveRemoteAddressForDeviceIdentifier:(id)a3;
- (unint64_t)type;
- (void)_cancelMessageReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_generalMessageReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_handleMessageReceived:(id)a3 service:(id)a4 fromID:(id)a5 context:(id)a6 handler:(id)a7;
- (void)_sendProtoMessageTo:(id)a3 message:(id)a4 type:(unsigned __int16)a5 completion:(id)a6;
- (void)checkOutstandingMessagesOn:(id)a3 completion:(id)a4;
- (void)closeEndpoint:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)devicesWithCompletion:(id)a3;
- (void)pingEndpoint:(id)a3 completion:(id)a4;
- (void)prewarmEndpointCreationOfType:(unint64_t)a3 count:(unint64_t)a4 completion:(id)a5;
- (void)relinquishEndpoint:(id)a3 completion:(id)a4;
- (void)remoteDeviceInformationForEndpoint:(id)a3 completion:(id)a4;
- (void)sendMessageTo:(id)a3 message:(id)a4 completion:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)universalShareURLForEndpoint:(id)a3 urlDecoration:(id)a4 completion:(id)a5;
@end

@implementation PDAccessPassSharingIDSService

- (PDAccessPassSharingIDSService)init
{
  return 0LL;
}

- (PDAccessPassSharingIDSService)initWithIDSSharingService:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PDAccessPassSharingIDSService;
  v9 = -[PDAccessPassSharingIDSService init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_service, a3);
    -[PKIDSService addDelegate:](v10->_service, "addDelegate:", v10);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.passd.sharingidsservice.internal", 0LL);
    internalQueue = v10->_internalQueue;
    v10->_internalQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.passd.sharingidsservice.internal", 0LL);
    replyQueue = v10->_replyQueue;
    v10->_replyQueue = (OS_dispatch_queue *)v13;

    v10->_lock._os_unfair_lock_opaque = 0;
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    messageIdentifierToEndpoint = v10->_messageIdentifierToEndpoint;
    v10->_messageIdentifierToEndpoint = v15;

    -[PKIDSService setProtobufAction:target:forIncomingRequestsOfType:queue:]( v10->_service,  "setProtobufAction:target:forIncomingRequestsOfType:queue:",  "_generalMessageReceived:service:account:fromID:context:",  v10,  15LL,  v10->_internalQueue);
    -[PKIDSService setProtobufAction:target:forIncomingRequestsOfType:queue:]( v10->_service,  "setProtobufAction:target:forIncomingRequestsOfType:queue:",  "_cancelMessageReceived:service:account:fromID:context:",  v10,  16LL,  v10->_internalQueue);
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDAccessPassSharingIDSService;
  -[PDAccessPassSharingIDSService dealloc](&v3, "dealloc");
}

- (void)devicesWithCompletion:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002D1DB4;
  v7[3] = &unk_1006396B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)internalQueue, v7);
}

- (void)remoteDeviceInformationForEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002D1EB4;
  block[3] = &unk_100639AF0;
  id v12 = v6;
  dispatch_queue_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)internalQueue, block);
}

- (id)resolveRemoteAddressForDeviceIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 _appearsToBeEmail])
  {
    id v4 = (id)IDSCopyIDForEmailAddress(v3);
  }

  else if ([v3 _appearsToBePhoneNumber])
  {
    id v4 = (id)IDSCopyIDForPhoneNumber(v3);
  }

  else
  {
    id v4 = v3;
  }

  v5 = v4;

  return v5;
}

- (BOOL)isEndpoint:(id)a3 forSameDeviceIn:(id)a4
{
  v5 = (os_log_s *)a3;
  id v6 = (os_log_s *)a4;
  uint64_t Object = PKLogFacilityTypeGetObject(33LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 138412546;
    v37 = v5;
    __int16 v38 = 2112;
    v39 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "IDSService: Comparing endpoints. \n %@ \n\n %@",  (uint8_t *)&v36,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s deviceIdentifier](v5, "deviceIdentifier"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s deviceIdentifier](v6, "deviceIdentifier"));
  id v11 = v9;
  id v12 = v10;
  dispatch_queue_t v13 = v12;
  if (v11 == v12)
  {
  }

  else
  {
    if (!v11 || !v12)
    {

      goto LABEL_13;
    }

    unsigned int v14 = [v11 isEqualToString:v12];

    if (!v14)
    {
LABEL_13:
      v16 = (os_log_s *)(id)IDSCopyRawAddressForDestination(v11);
      v17 = v13;
      objc_super v18 = v17;
      if (v16 == v17)
      {
      }

      else
      {
        if (!v13 || !v16)
        {

          goto LABEL_23;
        }

        unsigned int v19 = -[os_log_s isEqualToString:](v16, "isEqualToString:", v17);

        if (!v19)
        {
LABEL_23:
          v21 = (void *)IDSCopyRawAddressForDestination(v18);
          v22 = (os_log_s *)v11;
          v23 = v21;
          v20 = v23;
          if (v22 == v23)
          {
          }

          else
          {
            if (!v11 || !v23)
            {

              goto LABEL_32;
            }

            unsigned int v24 = -[os_log_s isEqualToString:](v22, "isEqualToString:", v23);

            if (!v24)
            {
LABEL_32:
              v26 = v16;
              v27 = v20;
              if (v26 == v27)
              {
              }

              else
              {
                v28 = v27;
                if (!v16 || !v20)
                {

                  goto LABEL_43;
                }

                unsigned int v29 = -[os_log_s isEqualToString:](v26, "isEqualToString:", v27);

                if (!v29)
                {
LABEL_43:
                  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
                  {
                    int v36 = 138412546;
                    v37 = v26;
                    __int16 v38 = 2112;
                    v39 = v28;
                    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "IDSService: lhsDestination: '%@' rhsDestination: '%@'",  (uint8_t *)&v36,  0x16u);
                  }

                  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s idsCorrelationIdentifier](v5, "idsCorrelationIdentifier"));
                  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s idsCorrelationIdentifier](v6, "idsCorrelationIdentifier"));
                  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
                  {
                    int v36 = 138412546;
                    v37 = v31;
                    __int16 v38 = 2112;
                    v39 = v32;
                    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "IDSService: lhsCorrelation: '%@' rhsCorrelation: '%@'",  (uint8_t *)&v36,  0x16u);
                  }

                  v30 = v31;
                  v33 = v32;
                  v34 = v33;
                  if (v30 == v33)
                  {
                  }

                  else
                  {
                    if (!v30 || !v33)
                    {

                      LOBYTE(v15) = 0;
                      id v8 = v30;
LABEL_57:

LABEL_58:
                      goto LABEL_59;
                    }

                    unsigned int v15 = -[os_log_s isEqualToString:](v30, "isEqualToString:", v33);

                    if (!v15) {
                      goto LABEL_58;
                    }
                  }

                  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(v36) = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "IDSService: equal correlation identifiers",  (uint8_t *)&v36,  2u);
                  }

                  LOBYTE(v15) = 1;
                  goto LABEL_57;
                }
              }

              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v36) = 0;
                v25 = "IDSService: equal lhs destination and rhs destination";
                goto LABEL_40;
              }

              goto LABEL_41;
            }
          }

          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v36) = 0;
            v25 = "IDSService: equal rhs destination identifier with lhs device";
LABEL_40:
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v36, 2u);
          }

- (void)_generalMessageReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002D2654;
  v12[3] = &unk_100653A00;
  id v13 = a6;
  unsigned int v14 = self;
  id v11 = v13;
  -[PDAccessPassSharingIDSService _handleMessageReceived:service:fromID:context:handler:]( self,  "_handleMessageReceived:service:fromID:context:handler:",  a3,  a4,  v11,  a7,  v12);
}

- (void)_cancelMessageReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002D28B4;
  v12[3] = &unk_100653A00;
  id v13 = a6;
  unsigned int v14 = self;
  id v11 = v13;
  -[PDAccessPassSharingIDSService _handleMessageReceived:service:fromID:context:handler:]( self,  "_handleMessageReceived:service:fromID:context:handler:",  a3,  a4,  v11,  a7,  v12);
}

- (void)_handleMessageReceived:(id)a3 service:(id)a4 fromID:(id)a5 context:(id)a6 handler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned int v14 = (void (**)(id, PDSharingIDSEndpoint *, void *))a7;
  id v15 = a3;
  id v16 = objc_alloc(&OBJC_CLASS___PKProtobufIDSSharingMessageWrapper);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v15 data]);

  id v18 = [v16 initWithData:v17];
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sessionIdentifier]);
  if (v19)
  {
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v11 deviceForFromID:v12]);
    v21 = (os_log_s *)v20;
    if (v20)
    {
      v22 = (void *)IDSCopyIDForDevice(v20);
      uint64_t v23 = 1LL;
      if (v22)
      {
LABEL_4:
        unsigned int v24 = -[PDSharingIDSEndpoint initWithSessionIdentifier:]( objc_alloc(&OBJC_CLASS___PDSharingIDSEndpoint),  "initWithSessionIdentifier:",  v19);
        -[PDSharingIDSEndpoint setIsDeviceOnSameIDSAccount:](v24, "setIsDeviceOnSameIDSAccount:", v23);
        -[PDSharingIDSEndpoint setDeviceIdentifier:](v24, "setDeviceIdentifier:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v13 senderCorrelationIdentifier]);
        -[PDSharingIDSEndpoint setIdsCorrelationIdentifier:](v24, "setIdsCorrelationIdentifier:", v25);

        v26 = (void *)objc_claimAutoreleasedReturnValue([v18 underlyingMessageData]);
        v14[2](v14, v24, v26);

LABEL_11:
        goto LABEL_12;
      }
    }

    else
    {
      v22 = (void *)IDSCopyAddressDestinationForDestination(v12);
      uint64_t v23 = 2LL;
      if (v22) {
        goto LABEL_4;
      }
    }

    uint64_t Object = PKLogFacilityTypeGetObject(33LL);
    unsigned int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138412290;
      id v31 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "IDSService: Unable to find device identifier for message from '%@'",  (uint8_t *)&v30,  0xCu);
    }

    goto LABEL_11;
  }

  uint64_t v27 = PKLogFacilityTypeGetObject(33LL);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 138412290;
    id v31 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "IDSService: Received message from %@, but no session identifier.",  (uint8_t *)&v30,  0xCu);
  }

- (unint64_t)type
{
  return 2LL;
}

- (void)pingEndpoint:(id)a3 completion:(id)a4
{
}

- (void)sendMessageTo:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(33LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 transportIdentifier]);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceIdentifier]);
    int v18 = 138412803;
    unsigned int v19 = v13;
    __int16 v20 = 2112;
    v21 = v14;
    __int16 v22 = 2113;
    id v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "IDSService<%@>: Sending message to %@ for \n\n %{private}@",  (uint8_t *)&v18,  0x20u);
  }

  id v15 = objc_alloc_init(&OBJC_CLASS___PKProtobufIDSSharingMessageWrapper);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 payload]);
  [v15 setUnderlyingMessageData:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v8 transportIdentifier]);
  [v15 setSessionIdentifier:v17];

  -[PDAccessPassSharingIDSService _sendProtoMessageTo:message:type:completion:]( self,  "_sendProtoMessageTo:message:type:completion:",  v8,  v15,  15LL,  v10);
}

- (void)_sendProtoMessageTo:(id)a3 message:(id)a4 type:(unsigned __int16)a5 completion:(id)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceIdentifier]);
  if (v13)
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v10 transportIdentifier]);
    [v11 setSessionIdentifier:v14];

    id v15 = objc_alloc(&OBJC_CLASS___IDSProtobuf);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 data]);
    id v17 = [v15 initWithProtobufData:v16 type:v7 isResponse:0];

    int v18 = (void *)objc_claimAutoreleasedReturnValue( +[PKIDSDestination destinationWithDeviceIdentifier:name:]( &OBJC_CLASS___PKIDSDestination,  "destinationWithDeviceIdentifier:name:",  v13,  0LL));
    v29[0] = IDSSendMessageOptionSendModeKey;
    v29[1] = IDSSendMessageOptionPushPriorityKey;
    v30[0] = &off_100690680;
    v30[1] = &off_100690698;
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[PKIDSService underlyingService](self->_service, "underlyingService"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v18));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1002D309C;
    v26[3] = &unk_100653A28;
    v26[4] = self;
    id v27 = v10;
    id v28 = v12;
    ((void (*)(void *, id, void *, uint64_t, void, void, uint64_t, void *, void *))PKProtobufSendWithOptions)( v20,  v17,  v21,  300LL,  0LL,  0LL,  1LL,  v26,  v19);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(33LL);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v10 transportIdentifier]);
      *(_DWORD *)buf = 138412290;
      v32 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "IDSService<%@>: Unable to send message to because no device identifier",  buf,  0xCu);
    }

    uint64_t v25 = PDBasicError(@"No device identifier");
    id v17 = (id)objc_claimAutoreleasedReturnValue(v25);
    (*((void (**)(id, void, id))v12 + 2))(v12, 0LL, v17);
  }
}

- (void)checkOutstandingMessagesOn:(id)a3 completion:(id)a4
{
}

- (void)closeEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(33LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 transportIdentifier]);
    *(_DWORD *)buf = 138412290;
    int v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "IDSService<%@>: Closing endpoint", buf, 0xCu);
  }

  id v11 = objc_alloc_init(&OBJC_CLASS___PKProtobufIDSSharingMessageWrapper);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 transportIdentifier]);
  [v11 setSessionIdentifier:v12];

  id v13 = objc_alloc_init(&OBJC_CLASS___NSData);
  [v11 setUnderlyingMessageData:v13];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1002D34D0;
  v15[3] = &unk_100639688;
  id v16 = v7;
  id v14 = v7;
  -[PDAccessPassSharingIDSService _sendProtoMessageTo:message:type:completion:]( self,  "_sendProtoMessageTo:message:type:completion:",  v6,  v11,  16LL,  v15);
}

- (void)relinquishEndpoint:(id)a3 completion:(id)a4
{
}

- (void)universalShareURLForEndpoint:(id)a3 urlDecoration:(id)a4 completion:(id)a5
{
}

- (void)prewarmEndpointCreationOfType:(unint64_t)a3 count:(unint64_t)a4 completion:(id)a5
{
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v10 = a5;
  id v11 = a8;
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002D35CC;
  block[3] = &unk_100639350;
  void block[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async((dispatch_queue_t)internalQueue, block);
}

- (void).cxx_destruct
{
}

@end