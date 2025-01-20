@interface IDSFirewallEndpointDonationComponent
- (BOOL)isCommandExcluded:(id)a3 forService:(id)a4;
- (IDSDServiceController)serviceController;
- (IDSFirewallEndpointDonationComponent)initWithServiceController:(id)a3 firewallStore:(id)a4;
- (IDSFirewallStore)firewallStore;
- (id)runIndividuallyWithInput:(id)a3;
- (void)setFirewallStore:(id)a3;
- (void)setServiceController:(id)a3;
@end

@implementation IDSFirewallEndpointDonationComponent

- (IDSFirewallEndpointDonationComponent)initWithServiceController:(id)a3 firewallStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSFirewallEndpointDonationComponent;
  v9 = -[IDSFirewallEndpointDonationComponent init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceController, a3);
    objc_storeStrong((id *)&v10->_firewallStore, a4);
  }

  return v10;
}

- (BOOL)isCommandExcluded:(id)a3 forService:(id)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a4 identifier]);
  if (![v6 isEqualToIgnoringCase:IDSServiceNameFaceTimeMulti])
  {

    goto LABEL_5;
  }

  id v7 = [v5 integerValue];

  if (v7 == (id)207)
  {
LABEL_5:
    BOOL v8 = [v5 integerValue] == (id)249;
    goto LABEL_6;
  }

  BOOL v8 = 1;
LABEL_6:

  return v8;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFirewallEndpointDonationComponent serviceController](self, "serviceController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 service]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceWithIdentifier:v6]);

  else {
    unsigned int v8 = 1;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 messageToSend]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 additionalDictionary]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"c"]);

  if (v8
    && IDSCommandIsUserInteractiveCommand(v11)
    && !-[IDSFirewallEndpointDonationComponent isCommandExcluded:forService:]( self,  "isCommandExcluded:forService:",  v11,  v7))
  {
    v40 = self;
    v41 = v11;
    v42 = v7;
    objc_super v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    v43 = v4;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 endpoints]);
    id v18 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v45;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "URI", v40));
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 prefixedURI]);

          if ((-[NSMutableSet containsObject:](v12, "containsObject:", v24) & 1) == 0)
          {
            id v25 = objc_alloc(&OBJC_CLASS___IDSFirewallEntry);
            v26 = (void *)objc_claimAutoreleasedReturnValue([v22 URI]);
            id v27 = [v25 initWithURI:v26 andLastSeenDate:0];

            v28 = (void *)objc_claimAutoreleasedReturnValue([v22 senderCorrelationIdentifier]);
            [v27 setMergeID:v28];

            -[NSMutableArray addObject:](v16, "addObject:", v27);
            -[NSMutableSet addObject:](v12, "addObject:", v24);
          }
        }

        id v19 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }

      while (v19);
    }

    id v7 = v42;
    id v4 = v43;
    if (-[NSMutableArray count](v16, "count"))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFirewallEndpointDonationComponent firewallStore](v40, "firewallStore"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v43 service]);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v30));
      objc_msgSend( v29,  "addEntries:forImpactedServices:category:isDonated:",  v16,  v31,  objc_msgSend(v42, "controlCategory"),  objc_msgSend(v43, "wantsFirewallDonation"));
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance", v40));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v43 service]);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v32 serviceWithIdentifier:v33]);
    unsigned int v35 = [v34 controlCategory];

    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue([v43 guid]);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v49 = v35;
      *(_WORD *)&v49[4] = 2112;
      *(void *)&v49[6] = v37;
      *(_WORD *)&v49[14] = 2112;
      *(void *)&v49[16] = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "IDSFirewall Update to category %u for GUID %@ addEntries %@",  buf,  0x1Cu);
    }

    v11 = v41;
  }

  else
  {
    objc_super v12 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 guid]);
      else {
        v14 = @"NO";
      }
      *(_DWORD *)buf = 138413058;
      else {
        v15 = @"NO";
      }
      *(void *)v49 = v13;
      *(_WORD *)&v49[8] = 2112;
      *(void *)&v49[10] = v14;
      *(_WORD *)&v49[18] = 2112;
      *(void *)&v49[20] = v15;
      __int16 v50 = 2112;
      v51 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "IDSFirewall GUID %@ Not donating to the firewall { wantsFirewallDonation: %@, disallowFirewallAutoEnroll: %@, command: %@",  buf,  0x2Au);
    }
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise fulfilledPromiseWithValue:]( &OBJC_CLASS___CUTUnsafePromise,  "fulfilledPromiseWithValue:",  v4));
  return v38;
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (IDSFirewallStore)firewallStore
{
  return self->_firewallStore;
}

- (void)setFirewallStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end