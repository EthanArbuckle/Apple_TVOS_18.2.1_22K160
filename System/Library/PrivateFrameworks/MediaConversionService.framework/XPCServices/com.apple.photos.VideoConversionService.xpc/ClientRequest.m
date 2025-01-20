@interface ClientRequest
- (BOOL)requiresDeduplicationAgainstOriginalWithIdenticalOutput;
- (BOOL)wantsProgress;
- (MediaConversionQueueEntry)requestQueueEntry;
- (MediaConversionRequestTracker)requestTracker;
- (NSString)cancellationReasonDebugDescription;
- (NSString)identifier;
- (NSUUID)connectionIdentifier;
- (NSXPCConnection)connection;
- (id)description;
- (id)imageClientReplyHandler;
- (id)videoClientReplyHandler;
- (unint64_t)signpostID;
- (void)setCancellationReasonDebugDescription:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionIdentifier:(id)a3;
- (void)setImageClientReplyHandler:(id)a3;
- (void)setRequestQueueEntry:(id)a3;
- (void)setRequestTracker:(id)a3;
- (void)setRequiresDeduplicationAgainstOriginalWithIdenticalOutput:(BOOL)a3;
- (void)setSignpostID:(unint64_t)a3;
- (void)setVideoClientReplyHandler:(id)a3;
- (void)setWantsProgress:(BOOL)a3;
- (void)videoConversionTask:(id)a3 didUpdateFractionCompleted:(double)a4;
@end

@implementation ClientRequest

- (void)videoConversionTask:(id)a3 didUpdateFractionCompleted:(double)a4
{
  if (-[ClientRequest wantsProgress](self, "wantsProgress", a3))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientRequest identifier](self, "identifier"));
    if (!v7)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v13 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:122 description:@"Unexpected missing job identifier"];
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v8 setObject:v7 forKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];
    if (__fpclassifyd(a4) != 1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
      [v8 setObject:v9 forKeyedSubscript:@"PAMediaConversionServiceProgressKey"];
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientRequest connection](self, "connection"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000083D0;
    v14[3] = &unk_100030BC0;
    id v15 = v7;
    id v11 = v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteObjectProxyWithErrorHandler:v14]);
    [v12 updateProgress:v8];
  }

- (id)description
{
  unint64_t v3 = -[MediaConversionRequestTracker requestNumber](self->_requestTracker, "requestNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionRequestTracker requestIdentifier](self->_requestTracker, "requestIdentifier"));
  unint64_t v5 = -[MediaConversionRequestTracker effectivePriority](self->_requestTracker, "effectivePriority");
  if (v5 > 4) {
    v6 = 0LL;
  }
  else {
    v6 = off_100030EB8[v5];
  }
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<Request #%lu (%p) %@ %@>",  v3,  self,  v4,  v7));

  return v8;
}

- (NSString)identifier
{
  requestTracker = self->_requestTracker;
  if (!requestTracker)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v6 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:143 description:@"Unexpected nil request tracker"];

    requestTracker = self->_requestTracker;
  }

  return -[MediaConversionRequestTracker requestIdentifier](requestTracker, "requestIdentifier");
}

- (MediaConversionRequestTracker)requestTracker
{
  return (MediaConversionRequestTracker *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setRequestTracker:(id)a3
{
}

- (id)videoClientReplyHandler
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setVideoClientReplyHandler:(id)a3
{
}

- (id)imageClientReplyHandler
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setImageClientReplyHandler:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
}

- (NSUUID)connectionIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setConnectionIdentifier:(id)a3
{
}

- (NSString)cancellationReasonDebugDescription
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCancellationReasonDebugDescription:(id)a3
{
}

- (BOOL)wantsProgress
{
  return self->_wantsProgress;
}

- (void)setWantsProgress:(BOOL)a3
{
  self->_wantsProgress = a3;
}

- (BOOL)requiresDeduplicationAgainstOriginalWithIdenticalOutput
{
  return self->_requiresDeduplicationAgainstOriginalWithIdenticalOutput;
}

- (void)setRequiresDeduplicationAgainstOriginalWithIdenticalOutput:(BOOL)a3
{
  self->_requiresDeduplicationAgainstOriginalWithIdenticalOutput = a3;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (MediaConversionQueueEntry)requestQueueEntry
{
  return (MediaConversionQueueEntry *)objc_loadWeakRetained((id *)&self->_requestQueueEntry);
}

- (void)setRequestQueueEntry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end