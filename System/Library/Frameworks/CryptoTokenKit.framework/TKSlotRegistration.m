@interface TKSlotRegistration
+ (BOOL)handleConnection:(id)a3 server:(id)a4;
- (NSString)slotName;
- (NSString)slotType;
- (NSXPCListenerEndpoint)endpoint;
- (OS_os_transaction)transaction;
- (TKSlotRegistration)initWithConnection:(id)a3 server:(id)a4;
- (void)addSlotWithEndpoint:(id)a3 name:(id)a4 type:(id)a5 reply:(id)a6;
- (void)setSlotName:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation TKSlotRegistration

- (TKSlotRegistration)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TKSlotRegistration;
  v8 = -[TKSlotRegistration init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    objc_storeStrong((id *)&v9->_server, a4);
  }

  return v9;
}

+ (BOOL)handleConnection:(id)a3 server:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[TKSlotRegistration initWithConnection:server:]( objc_alloc(&OBJC_CLASS___TKSlotRegistration),  "initWithConnection:server:",  v6,  v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TKProtocolSlotRegistry));
  [v6 setExportedInterface:v8];

  [v6 setExportedObject:v7];
  return 1;
}

- (void)addSlotWithEndpoint:(id)a3 name:(id)a4 type:(id)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, id))a6;
  if (!self->_endpoint)
  {
    location = (id *)&self->_connection;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    id v17 = (id)objc_claimAutoreleasedReturnValue([WeakRetained valueForEntitlement:@"com.apple.private.ctk.slot-type"]);

    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
    {
      if ([v17 isEqualToString:v13])
      {
LABEL_22:
        objc_storeStrong((id *)&self->_slotType, a5);
        objc_storeStrong((id *)&self->_endpoint, a3);
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472LL;
        v34[2] = sub_10000ACD0;
        v34[3] = &unk_10001C5E8;
        v34[4] = self;
        id v29 = objc_loadWeakRetained(location);
        [v29 setInvalidationHandler:v34];

        -[TKSlotServer addSlotRegistration:name:](self->_server, "addSlotRegistration:name:", self, v12);
        id v28 = (id)objc_claimAutoreleasedReturnValue(-[TKSlotRegistration slotName](self, "slotName"));
        v14[2](v14, v28);
LABEL_23:

        goto LABEL_24;
      }
    }

    else
    {
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v17, v20) & 1) != 0)
      {
        v30 = v14;
        id v31 = v12;
        id v32 = v11;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        id v21 = v17;
        id v22 = [v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v36;
          while (2)
          {
            for (i = 0LL; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v36 != v24) {
                objc_enumerationMutation(v21);
              }
              if ([v13 isEqualToString:*(void *)(*((void *)&v35 + 1) + 8 * (void)i)])
              {

                id v12 = v31;
                id v11 = v32;
                v14 = v30;
                goto LABEL_22;
              }
            }

            id v23 = [v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }

        id v12 = v31;
        id v11 = v32;
        v14 = v30;
      }
    }

    id v26 = sub_10000AC90();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100010E28(location, (uint64_t)v13, v27);
    }

    id v28 = objc_loadWeakRetained(location);
    [v28 invalidate];
    goto LABEL_23;
  }

  id v15 = sub_10000AC90();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_100010EE4((uint64_t)self, v16);
  }

  id v17 = objc_loadWeakRetained((id *)&self->_connection);
  [v17 invalidate];
LABEL_24:
}

- (NSString)slotName
{
  return self->_slotName;
}

- (void)setSlotName:(id)a3
{
}

- (NSString)slotType
{
  return self->_slotType;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end