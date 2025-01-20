@interface MRGroupSessionToken
- (MRGroupSessionToken)initWithInvitationData:(id)a3 sharedSecret:(id)a4 sessionIdentifier:(id)a5 equivalentMediaIdentifier:(id)a6 version:(int64_t)a7;
@end

@implementation MRGroupSessionToken

- (MRGroupSessionToken)initWithInvitationData:(id)a3 sharedSecret:(id)a4 sessionIdentifier:(id)a5 equivalentMediaIdentifier:(id)a6 version:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v18 = v17;

  if (v13)
  {
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    uint64_t v21 = v20;

    if (v14) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v22 = 0LL;
    uint64_t v24 = 0LL;
    if (v15) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v25 = 0LL;
    uint64_t v27 = 0LL;
    return (MRGroupSessionToken *)sub_1002A3228(v16, v18, v19, v21, v22, v24, v25, v27, a7);
  }

  uint64_t v19 = 0LL;
  uint64_t v21 = 0LL;
  if (!v14) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v24 = v23;

  if (!v15) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v27 = v26;

  return (MRGroupSessionToken *)sub_1002A3228(v16, v18, v19, v21, v22, v24, v25, v27, a7);
}

@end