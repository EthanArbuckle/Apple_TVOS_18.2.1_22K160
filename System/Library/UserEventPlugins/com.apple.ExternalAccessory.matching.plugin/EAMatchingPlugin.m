@interface EAMatchingPlugin
- (EAMatchingPlugin)initWithModule:(void *)a3;
- (void)accessoryChange:(id)a3 type:(int)a4;
- (void)accessoryDidConnect:(id)a3;
- (void)accessoryDidDisconnect:(id)a3;
- (void)addClient:(unint64_t)a3 eventMatchDict:(id)a4;
- (void)addClient:(unint64_t)a3 protocol:(id)a4 clientDict:(id)a5;
- (void)dealloc;
- (void)removeClient:(unint64_t)a3;
- (void)removeClient:(unint64_t)a3 clientDict:(id)a4;
- (void)sendAccessoryNotification:(id)a3 client:(unint64_t)a4 notificationTypeKey:(const char *)a5 serialNum:(id)a6;
@end

@implementation EAMatchingPlugin

- (EAMatchingPlugin)initWithModule:(void *)a3
{
  v3 = self;
  if (a3) {
    xpc_event_module_get_aslclient();
  }
  if (self)
  {
    v5 = self;
    return 0LL;
  }

  return v3;
}

- (void)dealloc
{
}

- (void)addClient:(unint64_t)a3 protocol:(id)a4 clientDict:(id)a5
{
}

- (void)removeClient:(unint64_t)a3 clientDict:(id)a4
{
}

- (void)addClient:(unint64_t)a3 eventMatchDict:(id)a4
{
  if (a4)
  {
    if (xpc_copy_description(a4)) {
      xpc_event_module_get_aslclient();
    }
    string = xpc_dictionary_get_string(a4, "EAMatchingProtocol");
    if (string)
    {
      v8 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", string, 1LL);
      if (v8)
      {
        v9 = v8;
        id xdict = a4;
        if (xpc_dictionary_get_BOOL(a4, "EAMatchConnection"))
        {
          accessoryConnectClients = self->_accessoryConnectClients;
          if (!accessoryConnectClients)
          {
            accessoryConnectClients = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  1LL);
            self->_accessoryConnectClients = accessoryConnectClients;
            if (!accessoryConnectClients) {
              return;
            }
          }

          -[EAMatchingPlugin addClient:protocol:clientDict:]( self,  "addClient:protocol:clientDict:",  a3,  v9,  accessoryConnectClients);
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          obj = -[EAAccessoryManager connectedAccessories]( +[EAAccessoryManager sharedAccessoryManager]( &OBJC_CLASS___EAAccessoryManager,  "sharedAccessoryManager"),  "connectedAccessories");
          id v22 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
          if (v22)
          {
            uint64_t v21 = *(void *)v28;
            do
            {
              v11 = 0LL;
              do
              {
                if (*(void *)v28 != v21) {
                  objc_enumerationMutation(obj);
                }
                v12 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v11);
                __int128 v23 = 0u;
                __int128 v24 = 0u;
                __int128 v25 = 0u;
                __int128 v26 = 0u;
                id v13 = [v12 protocolStrings];
                id v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
                if (v14)
                {
                  id v15 = v14;
                  uint64_t v16 = *(void *)v24;
                  do
                  {
                    v17 = 0LL;
                    do
                    {
                      if (*(void *)v24 != v16) {
                        objc_enumerationMutation(v13);
                      }
                      if (-[NSString isEqualToString:]( v9,  "isEqualToString:",  *(void *)(*((void *)&v23 + 1) + 8LL * (void)v17)))
                      {
                        -[EAMatchingPlugin sendAccessoryNotification:client:notificationTypeKey:serialNum:]( self,  "sendAccessoryNotification:client:notificationTypeKey:serialNum:",  v9,  a3,  "EAMatchConnection",  [v12 serialNumber]);
                      }

                      v17 = (char *)v17 + 1;
                    }

                    while (v15 != v17);
                    id v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
                  }

                  while (v15);
                }

                v11 = (char *)v11 + 1;
              }

              while (v11 != v22);
              id v22 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
            }

            while (v22);
          }
        }

        if (xpc_dictionary_get_BOOL(xdict, "EAMatchDisconnection"))
        {
          accessoryDisconnectClients = self->_accessoryDisconnectClients;
          if (accessoryDisconnectClients
            || (accessoryDisconnectClients = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  1LL),  (self->_accessoryDisconnectClients = accessoryDisconnectClients) != 0LL))
          {
            -[EAMatchingPlugin addClient:protocol:clientDict:]( self,  "addClient:protocol:clientDict:",  a3,  v9,  accessoryDisconnectClients);
          }
        }
      }
    }
  }

- (void)removeClient:(unint64_t)a3
{
}

- (void)sendAccessoryNotification:(id)a3 client:(unint64_t)a4 notificationTypeKey:(const char *)a5 serialNum:(id)a6
{
  if (a3)
  {
    if (a5) {
      xpc_event_module_get_aslclient();
    }
  }

- (void)accessoryChange:(id)a3 type:(int)a4
{
  if (a4 == 1)
  {
    uint64_t v4 = 4LL;
    if (!a3) {
      return;
    }
  }

  else
  {
    if (a4 != 2) {
      return;
    }
    uint64_t v4 = 5LL;
    if (!a3) {
      return;
    }
  }

  if ((&self->super.isa)[v4])
  {
    id v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", EAAccessoryKey);
    if (v5)
    {
      v6 = v5;
      id v7 = v5;
      if ([v6 protocolStrings])
      {
        -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  objc_msgSend(objc_msgSend(v6, "protocolStrings"), "count"));
        xpc_event_module_get_aslclient();
      }
    }
  }

- (void)accessoryDidConnect:(id)a3
{
}

- (void)accessoryDidDisconnect:(id)a3
{
}

@end