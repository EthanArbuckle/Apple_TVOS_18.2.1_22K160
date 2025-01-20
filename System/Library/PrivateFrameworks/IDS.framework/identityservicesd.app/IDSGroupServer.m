@interface IDSGroupServer
- (FTMessageDeliveryProtocol)messageDelivery;
- (IDSGroupServer)init;
- (IDSGroupServer)initWithMessageDelivery:(id)a3;
- (IDSGroupServerPushHandler)pushHandler;
- (id)_getMessageCompletionCurrentEntries:(id)a3 withCompletion:(id)a4;
- (id)_putMessageCompletionWithCompletion:(id)a3;
- (void)_queryGroupServerENID:(id)a3 withPreviousEntries:(id)a4 completion:(id)a5;
- (void)publishGroupForKey:(id)a3 data:(id)a4 signature:(id)a5 forwardingSig:(id)a6 ENID:(id)a7 version:(id)a8 completion:(id)a9;
- (void)queryGroupServerForENID:(id)a3 withCompletion:(id)a4;
- (void)setMessageDelivery:(id)a3;
- (void)setPushHandler:(id)a3;
@end

@implementation IDSGroupServer

- (IDSGroupServer)init
{
  v3 = -[FTMessageDelivery_DualMode initWithPreferedType:]( objc_alloc(&OBJC_CLASS___FTMessageDelivery_DualMode),  "initWithPreferedType:",  2LL);
  v4 = -[IDSGroupServer initWithMessageDelivery:](self, "initWithMessageDelivery:", v3);

  return v4;
}

- (IDSGroupServer)initWithMessageDelivery:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSGroupServer;
  v6 = -[IDSGroupServer init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_messageDelivery, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[IDSPushHandler sharedInstanceWithPortName:]( &OBJC_CLASS___IDSPushHandler,  "sharedInstanceWithPortName:",  @"com.apple.identityservicesd.aps"));
    pushHandler = v7->_pushHandler;
    v7->_pushHandler = (IDSGroupServerPushHandler *)v8;
  }

  return v7;
}

- (id)_getMessageCompletionCurrentEntries:(id)a3 withCompletion:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10019ABF4;
  v10[3] = &unk_1008FC728;
  id v11 = a3;
  v12 = self;
  id v13 = a4;
  id v6 = v13;
  id v7 = v11;
  uint64_t v8 = objc_retainBlock(v10);

  return v8;
}

- (id)_putMessageCompletionWithCompletion:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10019ADA0;
  v6[3] = &unk_1008FC778;
  v6[4] = self;
  id v7 = a3;
  id v3 = v7;
  v4 = objc_retainBlock(v6);

  return v4;
}

- (void)publishGroupForKey:(id)a3 data:(id)a4 signature:(id)a5 forwardingSig:(id)a6 ENID:(id)a7 version:(id)a8 completion:(id)a9
{
  id v34 = a9;
  id v33 = a8;
  id v31 = a7;
  id v32 = a6;
  id v30 = a5;
  id v16 = a4;
  id v17 = a3;
  v35 = -[FTMessageDelivery_DualMode initWithPreferedType:]( objc_alloc(&OBJC_CLASS___FTMessageDelivery_DualMode),  "initWithPreferedType:",  2LL);
  v18 = objc_alloc_init(&OBJC_CLASS___IDSGroupPutMessage);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 model]);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 productOSVersion]);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 productBuildVersion]);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 deviceName]);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupServer pushHandler](self, "pushHandler"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 pushToken]);
  -[IDSGroupPutMessage setPushToken:](v18, "setPushToken:", v28);

  IDSAssignPushIdentityToMessage(v18);
  -[IDSGroupPutMessage setHardwareVersion:](v18, "setHardwareVersion:", v20);
  -[IDSGroupPutMessage setOsVersion:](v18, "setOsVersion:", v22);
  -[IDSGroupPutMessage setSoftwareVersion:](v18, "setSoftwareVersion:", v24);
  -[IDSGroupPutMessage setDeviceName:](v18, "setDeviceName:", v26);
  -[IDSGroupPutMessage setSigAlgorithm:](v18, "setSigAlgorithm:", @"SHA256withECDSA");
  -[IDSGroupPutMessage setForwardingSigAlgorithm:](v18, "setForwardingSigAlgorithm:", @"SHA256withECDSA");
  -[IDSGroupPutMessage setKey:](v18, "setKey:", v17);

  -[IDSGroupPutMessage setData:](v18, "setData:", v16);
  -[IDSGroupPutMessage setSignature:](v18, "setSignature:", v30);

  -[IDSGroupPutMessage setEngramID:](v18, "setEngramID:", v31);
  -[IDSGroupPutMessage setVersion:](v18, "setVersion:", v33);

  -[IDSGroupPutMessage setForwardingSig:](v18, "setForwardingSig:", v32);
  v29 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupServer _putMessageCompletionWithCompletion:]( self,  "_putMessageCompletionWithCompletion:",  v34));

  -[IDSGroupPutMessage setCompletionBlock:](v18, "setCompletionBlock:", v29);
  -[FTMessageDelivery_DualMode sendMessage:](v35, "sendMessage:", v18);
}

- (void)queryGroupServerForENID:(id)a3 withCompletion:(id)a4
{
}

- (void)_queryGroupServerENID:(id)a3 withPreviousEntries:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v23 = objc_alloc_init(&OBJC_CLASS___IDSGroupGetMessage);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 model]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 productOSVersion]);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 productBuildVersion]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceName]);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupServer pushHandler](self, "pushHandler"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pushToken]);
  -[IDSGroupGetMessage setPushToken:](v23, "setPushToken:", v20);

  IDSAssignPushIdentityToMessage(v23);
  -[IDSGroupGetMessage setHardwareVersion:](v23, "setHardwareVersion:", v12);
  -[IDSGroupGetMessage setOsVersion:](v23, "setOsVersion:", v14);
  -[IDSGroupGetMessage setSoftwareVersion:](v23, "setSoftwareVersion:", v16);
  -[IDSGroupGetMessage setDeviceName:](v23, "setDeviceName:", v18);
  -[IDSGroupGetMessage setEngramID:](v23, "setEngramID:", v10);

  -[IDSGroupGetMessage setVersion:](v23, "setVersion:", &off_1009473E0);
  v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupServer _getMessageCompletionCurrentEntries:withCompletion:]( self,  "_getMessageCompletionCurrentEntries:withCompletion:",  v9,  v8));

  -[IDSGroupGetMessage setCompletionBlock:](v23, "setCompletionBlock:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupServer messageDelivery](self, "messageDelivery"));
  [v22 sendMessage:v23];
}

- (FTMessageDeliveryProtocol)messageDelivery
{
  return self->_messageDelivery;
}

- (void)setMessageDelivery:(id)a3
{
}

- (IDSGroupServerPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end