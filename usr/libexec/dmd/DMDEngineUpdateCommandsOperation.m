@interface DMDEngineUpdateCommandsOperation
- (DMFUpdateEnqueuedCommandsRequest)request;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation DMDEngineUpdateCommandsOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateCommandsOperation request](self, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 addCommands]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineUpdateCommandsOperation request](self, "request"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 organizationIdentifier]);
  id v21 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[DMDCommandPayloadMetadata commandsWithPayloadDictionaries:organizationIdentifier:context:error:]( &OBJC_CLASS___DMDCommandPayloadMetadata,  "commandsWithPayloadDictionaries:organizationIdentifier:context:error:",  v6,  v8,  v4,  &v21));
  id v10 = v21;

  if (v9)
  {
    id v20 = v10;
    unsigned __int8 v12 = [v4 save:&v20];
    id v13 = v20;

    if ((v12 & 1) != 0)
    {
      -[DMDEngineUpdateCommandsOperation setResultObject:](self, "setResultObject:", 0LL);
    }

    else
    {
      uint64_t v18 = DMFConfigurationEngineLog(v14);
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100064938(v13, v19);
      }

      -[DMDEngineUpdateCommandsOperation setError:](self, "setError:", v13);
    }

    id v10 = v13;
  }

  else
  {
    uint64_t v15 = DMFConfigurationEngineLog(v11);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000648CC((uint64_t)v10, v16, v17);
    }

    -[DMDEngineUpdateCommandsOperation setError:](self, "setError:", v10);
  }
}

- (DMFUpdateEnqueuedCommandsRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end