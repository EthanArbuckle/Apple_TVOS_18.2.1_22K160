@interface CDKnowledgeDaemonConnection
- (CDKnowledgeDaemon)daemon;
- (NSSet)authorizedEventStreamsToRead;
- (NSString)processName;
- (id)unauthorizedClientError;
- (void)confirmDatabaseConnectionWithReply:(id)a3;
- (void)deleteAllEventsInEventStreamNamed:(id)a3 reply:(id)a4;
- (void)deleteAllEventsMatchingPredicate:(id)a3 reply:(id)a4;
- (void)deleteObjects:(id)a3 reply:(id)a4;
- (void)deleteRemoteState:(id)a3;
- (void)deviceUUIDWithReply:(id)a3;
- (void)disableSyncPolicyForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5;
- (void)executeQuery:(id)a3 reply:(id)a4;
- (void)isSyncPolicyDisabledForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5;
- (void)requestBiomeEndpoint:(BOOL)a3 reply:(id)a4;
- (void)saveObjects:(id)a3 reply:(id)a4;
- (void)setAuthorizedEventStreamsToRead:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setProcessName:(id)a3;
- (void)sourceDeviceIdentityWithReply:(id)a3;
- (void)synchronizeWithReply:(id)a3;
- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 reply:(id)a5;
@end

@implementation CDKnowledgeDaemonConnection

- (id)unauthorizedClientError
{
  uint64_t v2 = _DKErrorDomain;
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  v7 = @"unauthorized client";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v2,  9LL,  v3));

  return v4;
}

- (void)saveObjects:(id)a3 reply:(id)a4
{
  id v9 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v6[2](v6, 0LL, v8);
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    [v8 saveObjects:v9 reply:v6];
  }
}

- (void)deleteObjects:(id)a3 reply:(id)a4
{
  id v9 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v6[2](v6, 0LL, v8);
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    [v8 deleteObjects:v9 reply:v6];
  }
}

- (void)executeQuery:(id)a3 reply:(id)a4
{
  id v17 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (!v7) {
    goto LABEL_8;
  }
  v8 = (void *)objc_opt_class(v17);
  if ([v8 isEqual:objc_opt_class(_DKEventQuery)])
  {
    id v9 = v17;
    v10 = objc_alloc(&OBJC_CLASS___NSMutableSet);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 eventStreams]);
    v12 = -[NSMutableSet initWithArray:](v10, "initWithArray:", v11);

    if (!-[NSMutableSet count](v12, "count")
      || (v13 = (void *)objc_claimAutoreleasedReturnValue( -[CDKnowledgeDaemonConnection authorizedEventStreamsToRead]( self,  "authorizedEventStreamsToRead")),  -[NSMutableSet minusSet:](v12, "minusSet:", v13),  v13,  -[NSMutableSet count](v12, "count")))
    {

      goto LABEL_6;
    }

    id v15 = [v9 resultType];

    if (v15) {
      goto LABEL_6;
    }
LABEL_8:
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection processName](self, "processName"));
    [v17 setClientName:v16];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    [v14 executeQuery:v17 reply:v6];
    goto LABEL_9;
  }

- (void)deleteAllEventsInEventStreamNamed:(id)a3 reply:(id)a4
{
  id v9 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v6[2](v6, 0LL, v8);
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    [v8 deleteAllEventsInEventStreamNamed:v9 reply:v6];
  }
}

- (void)deleteAllEventsMatchingPredicate:(id)a3 reply:(id)a4
{
  id v9 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v6[2](v6, 0LL, v8);
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    [v8 deleteAllEventsMatchingPredicate:v9 reply:v6];
  }
}

- (void)synchronizeWithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v4[2](v4, 0LL);
  }

  else
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    [v6 synchronizeWithReply:v4];
  }
}

- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 reply:(id)a5
{
  id v11 = a4;
  v8 = (void (**)(id, void, void *))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v8[2](v8, 0LL, v10);
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    [v10 synchronizeWithUrgency:a3 client:v11 reply:v8];
  }
}

- (void)deleteRemoteState:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v4[2](v4, 0LL);
  }

  else
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    [v6 deleteRemoteState:v4];
  }
}

- (void)sourceDeviceIdentityWithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v4[2](v4, 0LL);
  }

  else
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    [v6 sourceDeviceIdentityWithReply:v4];
  }
}

- (void)deviceUUIDWithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v4[2](v4, 0LL);
  }

  else
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    [v6 deviceUUIDWithReply:v4];
  }
}

- (void)disableSyncPolicyForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
  [v9 disableSyncPolicyForFeature:a3 transportType:a4 withReply:v8];
}

- (void)isSyncPolicyDisabledForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
  [v9 isSyncPolicyDisabledForFeature:a3 transportType:a4 withReply:v8];
}

- (void)confirmDatabaseConnectionWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
  [v5 confirmDatabaseConnectionWithReply:v4];
}

- (void)requestBiomeEndpoint:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
  [v7 requestBiomeEndpoint:v4 reply:v6];
}

- (NSSet)authorizedEventStreamsToRead
{
  return self->_authorizedEventStreamsToRead;
}

- (void)setAuthorizedEventStreamsToRead:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (CDKnowledgeDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end