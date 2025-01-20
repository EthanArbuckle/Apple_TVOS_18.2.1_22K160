@interface IDSMessageFactoryComponent
- (BOOL)shouldSendAsAttachment:(id)a3 maxSize:(unint64_t)a4;
- (IDSMessageFactoryComponent)initWithMMCSUploader:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IDSMessageFactoryComponent

- (IDSMessageFactoryComponent)initWithMMCSUploader:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSMessageFactoryComponent;
  v6 = -[IDSMessageFactoryComponent init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mmcsUploader, a3);
  }

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v3 = a3;
  v52 = (void *)objc_claimAutoreleasedReturnValue([v3 guid]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 endpointsToEncryptedData]);
  [v3 setUsedMMCS:0];
  v50 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  id v5 = v4;
  id v51 = [v5 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (v51)
  {
    uint64_t v49 = *(void *)v68;
    uint64_t v47 = IDSRegistrationPropertySupportsCertifiedDeliveryV1;
    *(void *)&__int128 v6 = 138412546LL;
    __int128 v46 = v6;
    id v48 = v5;
    do
    {
      for (i = 0LL; i != v51; i = (char *)i + 1)
      {
        if (*(void *)v68 != v49) {
          objc_enumerationMutation(v5);
        }
        v8 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)i);
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URI", v46));
        v10 = (void *)objc_claimAutoreleasedReturnValue([v3 fromID]);
        v55 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue([v9 prefixedURI]);
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) != 0) {
          id v13 = 0LL;
        }
        else {
          id v13 = [v3 wantsDeliveryStatus];
        }
        if ([v3 wantsCertifiedDelivery])
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v8 capabilities]);
          BOOL v15 = (uint64_t)[v14 valueForCapability:v47] > 0;
        }

        else
        {
          BOOL v15 = 0LL;
        }

        v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v8]);
        if (([v3 forceAttachmentMessage] & 1) != 0
          || -[IDSMessageFactoryComponent shouldSendAsAttachment:maxSize:]( self,  "shouldSendAsAttachment:maxSize:",  v16,  [v3 maxSize]))
        {
          BOOL v54 = v15;
          char v17 = (char)v13;
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue([v8 pushTokenObject]);
            v20 = (void *)objc_claimAutoreleasedReturnValue([v55 URIByAddingPushToken:v19]);
            *(_DWORD *)buf = v46;
            v72 = v52;
            __int16 v73 = 2112;
            v74 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "GUID %@ Uploading data as attachment for token: %@",  buf,  0x16u);
          }

          [v3 setUsedMMCS:1];
          id v21 = objc_alloc_init(&OBJC_CLASS___CUTUnsafePromiseSeal);
          mmcsUploader = self->_mmcsUploader;
          v23 = (void *)objc_claimAutoreleasedReturnValue([v3 fromID]);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
          v25 = (IDSPeerAggregatableMessage *)objc_claimAutoreleasedReturnValue( -[IDSMMCSUploader uploadData:fromID:toEndpoint:onTopic:forGUID:encryptionType:]( mmcsUploader,  "uploadData:fromID:toEndpoint:onTopic:forGUID:encryptionType:",  v16,  v23,  v8,  v24,  v52,  [v3 encryptionType]));

          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472LL;
          v59[2] = sub_100124F40;
          v59[3] = &unk_1008FB070;
          id v60 = v3;
          id v61 = v21;
          v62 = v8;
          v26 = v55;
          id v63 = v55;
          char v65 = v17;
          BOOL v66 = v54;
          id v64 = v52;
          id v27 = v21;
          -[IDSPeerAggregatableMessage registerResultBlock:](v25, "registerResultBlock:", v59);
          v28 = (void *)objc_claimAutoreleasedReturnValue([v27 promise]);
          -[NSMutableArray addObject:](v50, "addObject:", v28);

          id v5 = v48;
        }

        else
        {
          v25 = objc_alloc_init(&OBJC_CLASS___IDSPeerAggregatableMessage);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v8 pushTokenObject]);
          -[IDSPeerAggregatableMessage setTargetToken:](v25, "setTargetToken:", v29);

          v30 = (void *)objc_claimAutoreleasedReturnValue([v8 sessionToken]);
          -[IDSPeerAggregatableMessage setTargetSessionToken:](v25, "setTargetSessionToken:", v30);

          -[IDSPeerAggregatableMessage setTargetPeerID:](v25, "setTargetPeerID:", v55);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v16 data]);
          -[IDSPeerAggregatableMessage setEncryptedData:](v25, "setEncryptedData:", v31);

          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13));
          -[IDSPeerAggregatableMessage setWantsDeliveryStatus:](v25, "setWantsDeliveryStatus:", v32);

          -[IDSPeerAggregatableMessage setWantsCertifiedDelivery:](v25, "setWantsCertifiedDelivery:", v15);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v16 payloadMetadata]);
          id v34 = [v33 length];

          if (v34)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue([v16 payloadMetadata]);
            -[IDSPeerAggregatableMessage setPayloadMetadata:](v25, "setPayloadMetadata:", v35);
          }

          v36 = (void *)objc_claimAutoreleasedReturnValue([v8 anonymizedSenderID]);
          -[IDSPeerAggregatableMessage setAnonymizedSenderID:](v25, "setAnonymizedSenderID:", v36);

          v37 = (void *)objc_claimAutoreleasedReturnValue([v8 expireDate]);
          -[IDSPeerAggregatableMessage setExpirationDate:](v25, "setExpirationDate:", v37);

          if ([v16 encryptionType] != (id)2)
          {
            uint64_t v38 = IDSEncryptionTypeStringFromEncryptionType([v16 encryptionType]);
            v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
            -[IDSPeerAggregatableMessage setEncryptionType:](v25, "setEncryptionType:", v39);
          }

          id v27 = (id)objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise fulfilledPromiseWithValue:]( &OBJC_CLASS___CUTUnsafePromise,  "fulfilledPromiseWithValue:",  v25));
          -[NSMutableArray addObject:](v50, "addObject:", v27);
          v26 = v55;
        }
      }

      id v51 = [v5 countByEnumeratingWithState:&v67 objects:v75 count:16];
    }

    while (v51);
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[CUTUnsafePromise all:](&OBJC_CLASS___CUTUnsafePromise, "all:", v50));
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_100125350;
  v56[3] = &unk_1008F7770;
  id v57 = v3;
  id v58 = v52;
  v41 = v5;
  id v42 = v52;
  id v43 = v3;
  v44 = (void *)objc_claimAutoreleasedReturnValue([v40 then:v56]);

  return v44;
}

- (BOOL)shouldSendAsAttachment:(id)a3 maxSize:(unint64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 data]);
  LOBYTE(a4) = (unint64_t)[v5 length] >= a4;

  return a4;
}

- (void).cxx_destruct
{
}

@end