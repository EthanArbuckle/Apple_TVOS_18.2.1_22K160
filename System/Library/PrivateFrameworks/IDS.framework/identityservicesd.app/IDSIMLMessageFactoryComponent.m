@interface IDSIMLMessageFactoryComponent
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IDSIMLMessageFactoryComponent

- (id)runIndividuallyWithInput:(id)a3
{
  id v3 = a3;
  v33 = (void *)objc_claimAutoreleasedReturnValue([v3 guid]);
  v38 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 endpoints]);
  id v4 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v37 = *(void *)v43;
    uint64_t v35 = IDSRegistrationPropertySupportsCertifiedDeliveryV1;
    uint64_t v34 = IDSSendErrorDomain;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v43 != v37) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URI", v33));
        v9 = (void *)objc_claimAutoreleasedReturnValue([v3 fromID]);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v8 prefixedURI]);
        unsigned __int8 v11 = [v9 isEqualToString:v10];

        if ((v11 & 1) != 0) {
          id v12 = 0LL;
        }
        else {
          id v12 = [v3 wantsDeliveryStatus];
        }
        if ([v3 wantsCertifiedDelivery])
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v7 capabilities]);
          BOOL v14 = (uint64_t)[v13 valueForCapability:v35] > 0;
        }

        else
        {
          BOOL v14 = 0LL;
        }

        v15 = objc_alloc_init(&OBJC_CLASS___IDSPeerAggregatableMessage);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v7 pushTokenObject]);
        -[IDSPeerAggregatableMessage setTargetToken:](v15, "setTargetToken:", v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionToken]);
        -[IDSPeerAggregatableMessage setTargetSessionToken:](v15, "setTargetSessionToken:", v17);

        -[IDSPeerAggregatableMessage setTargetPeerID:](v15, "setTargetPeerID:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
        -[IDSPeerAggregatableMessage setWantsDeliveryStatus:](v15, "setWantsDeliveryStatus:", v18);

        -[IDSPeerAggregatableMessage setWantsCertifiedDelivery:](v15, "setWantsCertifiedDelivery:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v7 anonymizedSenderID]);
        -[IDSPeerAggregatableMessage setAnonymizedSenderID:](v15, "setAnonymizedSenderID:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue([v7 expireDate]);
        -[IDSPeerAggregatableMessage setExpirationDate:](v15, "setExpirationDate:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue([v3 fromShortHandle]);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
        v23 = (void *)objc_claimAutoreleasedReturnValue([v3 fromID]);
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v23));
        v25 = (void *)objc_claimAutoreleasedReturnValue([v22 shortHandleForURI:v8 fromURI:v24]);

        if (v21 && v25)
        {
          -[IDSPeerAggregatableMessage setSenderShortHandle:](v15, "setSenderShortHandle:", v21);
          -[IDSPeerAggregatableMessage setTargetShortHandle:](v15, "setTargetShortHandle:", v25);
          v26 = (NSError *)objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise fulfilledPromiseWithValue:]( &OBJC_CLASS___CUTUnsafePromise,  "fulfilledPromiseWithValue:",  v15));
          -[NSMutableArray addObject:](v38, "addObject:", v26);
        }

        else
        {
          v26 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  v34,  40LL,  0LL);
          v27 = (void *)objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise failedPromiseWithError:]( &OBJC_CLASS___CUTUnsafePromise,  "failedPromiseWithError:",  v26));
          -[NSMutableArray addObject:](v38, "addObject:", v27);
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }

    while (v5);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[CUTUnsafePromise all:](&OBJC_CLASS___CUTUnsafePromise, "all:", v38));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10003CC58;
  v39[3] = &unk_1008F7770;
  id v40 = v3;
  id v41 = v33;
  id v29 = v33;
  id v30 = v3;
  v31 = (void *)objc_claimAutoreleasedReturnValue([v28 then:v39]);

  return v31;
}

@end