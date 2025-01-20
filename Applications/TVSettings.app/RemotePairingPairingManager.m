@interface RemotePairingPairingManager
- (_TtC10TVSettings27RemotePairingPairingManager)init;
- (void)listPairedHostsInvokingCompletionHandlerOnQueue:(id)a3 completion:(id)a4;
- (void)removePairingWithIdentifier:(id)a3 invokingCompletionHandlerOnQueue:(id)a4 completion:(id)a5;
@end

@implementation RemotePairingPairingManager

- (void)removePairingWithIdentifier:(id)a3 invokingCompletionHandlerOnQueue:(id)a4 completion:(id)a5
{
  uint64_t v9 = type metadata accessor for HostDeletionTarget(0LL, a2);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = type metadata accessor for UUID(0LL, v13);
  uint64_t v14 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v17 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v18 = swift_allocObject(&unk_100195918, 24LL, 7LL);
  *(void *)(v18 + 16) = v17;
  type metadata accessor for RemotePairingDevicePairingServiceConnection(0LL);
  id v19 = a4;
  v20 = self;
  v21 = (void *)RemotePairingDevicePairingServiceConnection.__allocating_init()();
  uint64_t v22 = v24;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v12, v16, v24);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))( v12,  enum case for HostDeletionTarget.singleHost(_:),  v9);
  RemotePairingDevicePairingServiceConnection.deletePairingRecords(matching:invokingCompletionHandlerOn:completion:)( v12,  v19,  sub_1000F2654,  v18);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release(v18);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v22);
}

- (void)listPairedHostsInvokingCompletionHandlerOnQueue:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1001958F0, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_1000F16A0(v8, (uint64_t)sub_1000F264C, v7);

  swift_release(v7);
}

- (_TtC10TVSettings27RemotePairingPairingManager)init
{
  return (_TtC10TVSettings27RemotePairingPairingManager *)sub_1000F217C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVSettings27RemotePairingPairingManager__remotePairingQueue));
}

@end