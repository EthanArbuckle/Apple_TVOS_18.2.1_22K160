@interface TPPeerPermanentInfo
- (BOOL)matchesPeer:(id)a3;
- (_SFECPublicKey)publicEncryptionKey;
- (_SFECPublicKey)publicSigningKey;
@end

@implementation TPPeerPermanentInfo

- (_SFECPublicKey)publicEncryptionKey
{
  return (_SFECPublicKey *)sub_100045104(self, (uint64_t)a2, (SEL *)&selRef_encryptionPubKey);
}

- (_SFECPublicKey)publicSigningKey
{
  return (_SFECPublicKey *)sub_100045104(self, (uint64_t)a2, (SEL *)&selRef_signingPubKey);
}

- (BOOL)matchesPeer:(id)a3
{
  v5 = self;
  id v6 = -[TPPeerPermanentInfo peerID](v5, "peerID");
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  uint64_t v9 = v8;

  id v10 = [a3 peerID];
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  uint64_t v13 = v12;

  if (v7 == v11 && v9 == v13)
  {
    char v15 = 1;
    uint64_t v13 = v9;
  }

  else
  {
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v11, v13, 0LL);
  }

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v13);
  swift_unknownObjectRelease(a3);

  return v15 & 1;
}

@end