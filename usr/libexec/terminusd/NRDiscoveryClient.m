@interface NRDiscoveryClient
- (NSString)description;
- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5;
- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)dataSessionRequestStarted:(id)a3;
- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6;
- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5;
- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)publisher:(id)a3 receivedMessage:(id)a4 fromSubscriberID:(unsigned __int8)a5 subscriberAddress:(id)a6;
- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)publisherStarted:(id)a3;
- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5;
- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4;
- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)subscriberStarted:(id)a3;
@end

@implementation NRDiscoveryClient

- (NSString)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"NRDiscoveryClient[%llu, %@]",  self->_identifier,  self->_candidateServiceIdentifier);
}

- (void)publisherStarted:(id)a3
{
  v3 = self;
  if (self) {
    self = (NRDiscoveryClient *)self->_nrUUID;
  }
  v4 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v4, 0LL);

  if (IsLevelEnabled)
  {
    if (v3) {
      nrUUID = v3->_nrUUID;
    }
    else {
      nrUUID = 0LL;
    }
    id v8 = (id)_NRCopyLogObjectForNRUUID(nrUUID, v6);
    _NRLogWithArgs(v8, 0LL, "%s%.30s:%-4d NAN: publisher started", ", "-[NRDiscoveryClient publisherStarted:]"", 2088);
  }

- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4
{
  id v6 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100113824;
  block[3] = &unk_1001B0248;
  id v10 = v6;
  v11 = self;
  int64_t v12 = a4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v6 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100113754;
  block[3] = &unk_1001B0248;
  id v10 = v6;
  v11 = self;
  int64_t v12 = a4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)publisher:(id)a3 receivedMessage:(id)a4 fromSubscriberID:(unsigned __int8)a5 subscriberAddress:(id)a6
{
  id v22 = a4;
  if (v22)
  {
    id v8 = -[NRNANServiceInfo initWithData:](objc_alloc(&OBJC_CLASS___NRNANServiceInfo), "initWithData:", v22);
    if (v8)
    {
      if (self) {
        nrUUID = self->_nrUUID;
      }
      else {
        nrUUID = 0LL;
      }
      id v10 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v7);
      int IsLevelEnabled = _NRLogIsLevelEnabled(v10, 0LL);

      if (!IsLevelEnabled) {
        goto LABEL_10;
      }
      if (self) {
        v13 = self->_nrUUID;
      }
      else {
        v13 = 0LL;
      }
      v14 = (void *)_NRCopyLogObjectForNRUUID(v13, v12);
      _NRLogWithArgs( v14,  0LL,  "%s%.30s:%-4d NAN: publisher received message %@",  ",  "-[NRDiscoveryClient publisher:receivedMessage:fromSubscriberID:subscriberAddress:]"",  2124LL,  v8);
    }

    else
    {
      if (self) {
        v17 = self->_nrUUID;
      }
      else {
        v17 = 0LL;
      }
      v18 = (void *)_NRCopyLogObjectForNRUUID(v17, v7);
      int v19 = _NRLogIsLevelEnabled(v18, 16LL);

      if (!v19)
      {
        id v8 = 0LL;
        goto LABEL_10;
      }

      if (self) {
        v21 = self->_nrUUID;
      }
      else {
        v21 = 0LL;
      }
      v14 = (void *)_NRCopyLogObjectForNRUUID(v21, v20);
      _NRLogWithArgs(v14, 16LL, "%s%.30s:%-4d Failed to decode NAN service info protobuf");
    }
  }

  else
  {
    id v15 = sub_10010F4BC();
    int v16 = _NRLogIsLevelEnabled(v15, 17LL);

    if (!v16) {
      goto LABEL_11;
    }
    id v8 = (NRNANServiceInfo *)sub_10010F4BC();
    _NRLogWithArgs( v8,  17LL,  "%s called with null message",  "-[NRDiscoveryClient publisher:receivedMessage:fromSubscriberID:subscriberAddress:]");
  }

- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001135B4;
  v13[3] = &unk_1001B0270;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  int64_t v17 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001133E4;
  v14[3] = &unk_1001B0298;
  id v15 = v9;
  id v16 = self;
  id v17 = v10;
  unsigned int v18 = a5;
  id v12 = v10;
  id v13 = v9;
  dispatch_async((dispatch_queue_t)queue, v14);
}

- (void)subscriberStarted:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011330C;
  v7[3] = &unk_1001B0720;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4
{
  id v6 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011322C;
  block[3] = &unk_1001B0248;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v6 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011314C;
  block[3] = &unk_1001B0248;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100112EEC;
  v13[3] = &unk_1001B02C0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unsigned __int8 v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001116C0;
  block[3] = &unk_1001B0748;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4
{
  id v6 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001115C4;
  block[3] = &unk_1001B0248;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5
{
  id v6 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10011069C;
  v9[3] = &unk_1001B0720;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, v9);
}

- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v6 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001104F0;
  block[3] = &unk_1001B0248;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)dataSessionRequestStarted:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001102CC;
  v7[3] = &unk_1001B0720;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void).cxx_destruct
{
}

@end