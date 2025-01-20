@interface DPDPushManager
+ (id)sharedInstance;
- (DPDPushManager)init;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connectionDidReconnect:(id)a3;
@end

@implementation DPDPushManager

+ (id)sharedInstance
{
  if (qword_10000CA10 != -1) {
    swift_once(&qword_10000CA10, sub_100002AC8);
  }
  return (id)qword_10000CD70;
}

- (DPDPushManager)init
{
  return result;
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_100003858(a3, a4);
}

- (void)connectionDidReconnect:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100003B18(a3);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4 = a4;
  if (a4)
  {
    id v6 = a3;
    id v7 = self;
    id v8 = v4;
    id v4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v4);
    unint64_t v10 = v9;
  }

  else
  {
    id v11 = a3;
    v12 = self;
    unint64_t v10 = 0xF000000000000000LL;
  }

  sub_100003DB0(a3, (uint64_t)v4, v10);
  sub_1000044A8((uint64_t)v4, v10);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000040F0(a4);
}

- (void).cxx_destruct
{
}

@end