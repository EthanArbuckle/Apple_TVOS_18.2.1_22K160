@interface IDSTransportLevelAgentClientInfo
- (IDSGroupSessionConnectionParameters)multiplexerParams;
- (IDSTransportLevelAgentClientInfo)initWithAgentClient:(id)a3 assign:(id)a4 parameters:(id)a5;
- (IDSTransportLevelAgentClientInfo)initWithClientUUID:(id)a3;
- (NSUUID)clientUUID;
- (OS_nw_connection)simConnection;
- (OS_nw_endpoint)endpoint;
- (OS_nw_endpoint)listeningEndpoint;
- (OS_nw_endpoint)localEndpoint;
- (OS_nw_parameters)pathParams;
- (OS_nw_path)path;
- (id)assign;
- (id)description;
- (void)setEndpoint:(id)a3;
- (void)setLocalEndpoint:(id)a3;
- (void)setMultiplexerParams:(id)a3;
- (void)setPath:(id)a3;
- (void)setSimConnection:(id)a3;
@end

@implementation IDSTransportLevelAgentClientInfo

- (IDSTransportLevelAgentClientInfo)initWithClientUUID:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___IDSTransportLevelAgentClientInfo;
  v6 = -[IDSTransportLevelAgentClientInfo init](&v25, "init");
  v7 = v6;
  if (!v6) {
    goto LABEL_17;
  }
  objc_storeStrong((id *)&v6->_clientUUID, a3);
  v28[0] = 0xAAAAAAAAAAAAAAAALL;
  v28[1] = 0xAAAAAAAAAAAAAAAALL;
  [v5 getUUIDBytes:v28];
  v8 = (os_log_s *)nw_path_copy_path_for_client(v28);
  if (!v8)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = (os_log_s *)v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "nw_path_copy_path_for_client failed for client %@",  buf,  0xCu);
    }

    goto LABEL_16;
  }

  v9 = v8;
  objc_storeStrong((id *)&v7->_path, v8);
  v10 = (void *)nw_path_copy_parameters(v9);
  account_id = (_BYTE *)nw_parameters_get_account_id();
  if (account_id)
  {
    v12 = account_id;
    if (*account_id)
    {
      v13 = objc_alloc(&OBJC_CLASS___IDSGroupSessionConnectionParameters);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12));
      v15 = -[IDSGroupSessionConnectionParameters initWithStringRepresentation:]( v13,  "initWithStringRepresentation:",  v14);
      multiplexerParams = v7->_multiplexerParams;
      v7->_multiplexerParams = v15;

      v17 = (os_log_s *)nw_path_copy_endpoint(v9);
      if (v17)
      {
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "client endpoint %@", buf, 0xCu);
        }

        v19 = v17;
        endpoint = v7->_endpoint;
        v7->_endpoint = v19;
      }

      else
      {
        nw_endpoint_t v23 = nw_path_copy_effective_local_endpoint(v9);
        endpoint = v7->_listeningEndpoint;
        v7->_listeningEndpoint = v23;
      }

LABEL_16:
LABEL_17:
      v22 = v7;
      goto LABEL_18;
    }
  }

  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "new client path [%@] missing account_id to specify multiplexer",  buf,  0xCu);
  }

  v22 = 0LL;
LABEL_18:

  return v22;
}

- (IDSTransportLevelAgentClientInfo)initWithAgentClient:(id)a3 assign:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___IDSTransportLevelAgentClientInfo;
  v11 = -[IDSTransportLevelAgentClientInfo init](&v23, "init");
  if (v11)
  {
    id v12 = objc_retainBlock(v9);
    id assign = v11->_assign;
    v11->_id assign = v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    clientUUID = v11->_clientUUID;
    v11->_clientUUID = (NSUUID *)v14;

    uint64_t v16 = nw_agent_client_copy_path(v8);
    path = v11->_path;
    v11->_path = (OS_nw_path *)v16;

    v18 = -[IDSGroupSessionConnectionParameters initWithStringRepresentation:]( objc_alloc(&OBJC_CLASS___IDSGroupSessionConnectionParameters),  "initWithStringRepresentation:",  v10);
    multiplexerParams = v11->_multiplexerParams;
    v11->_multiplexerParams = v18;

    uint64_t v20 = nw_agent_client_copy_endpoint(v8);
    endpoint = v11->_endpoint;
    v11->_endpoint = (OS_nw_endpoint *)v20;
  }

  return v11;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IDSTAClientInfo uuid %@ params %@ endpoint %@ listeningEndpoint %@ path [%@]",  self->_clientUUID,  self->_multiplexerParams,  self->_endpoint,  self->_listeningEndpoint,  self->_path);
}

- (void)setPath:(id)a3
{
}

- (void)setMultiplexerParams:(id)a3
{
}

- (NSUUID)clientUUID
{
  return self->_clientUUID;
}

- (OS_nw_path)path
{
  return self->_path;
}

- (OS_nw_parameters)pathParams
{
  return self->_pathParams;
}

- (OS_nw_endpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (OS_nw_endpoint)listeningEndpoint
{
  return self->_listeningEndpoint;
}

- (IDSGroupSessionConnectionParameters)multiplexerParams
{
  return self->_multiplexerParams;
}

- (id)assign
{
  return self->_assign;
}

- (OS_nw_endpoint)localEndpoint
{
  return self->_localEndpoint;
}

- (void)setLocalEndpoint:(id)a3
{
}

- (OS_nw_connection)simConnection
{
  return self->_simConnection;
}

- (void)setSimConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end