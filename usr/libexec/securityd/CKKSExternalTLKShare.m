@interface CKKSExternalTLKShare
- (id)datafyPeerID:(id)a3;
- (id)initWithViewName:(id)a3 tlkShare:(id)a4;
- (id)makeTLKShareRecord:(id)a3 contextID:(id)a4;
@end

@implementation CKKSExternalTLKShare

- (id)initWithViewName:(id)a3 tlkShare:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 tlkUUID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 receiverPeerID]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare datafyPeerID:](self, "datafyPeerID:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 senderPeerID]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare datafyPeerID:](self, "datafyPeerID:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 wrappedTLK]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 signature]);

  v15 = -[CKKSExternalTLKShare initWithView:tlkUUID:receiverPeerID:senderPeerID:wrappedTLK:signature:]( self,  "initWithView:tlkUUID:receiverPeerID:senderPeerID:wrappedTLK:signature:",  v7,  v8,  v10,  v12,  v13,  v14);
  return v15;
}

- (id)makeTLKShareRecord:(id)a3 contextID:(id)a4
{
  id v18 = a4;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___CKKSTLKShare);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare tlkUUID](self, "tlkUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare senderPeerID](self, "senderPeerID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare stringifyPeerID:](self, "stringifyPeerID:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare receiverPeerID](self, "receiverPeerID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare stringifyPeerID:](self, "stringifyPeerID:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare wrappedTLK](self, "wrappedTLK"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalTLKShare signature](self, "signature"));
  id v15 = -[CKKSTLKShare initForKey:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrappedKey:signature:zoneID:]( v7,  "initForKey:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrappedKey:signature:zoneID:",  v8,  v10,  v12,  0LL,  4LL,  1LL,  0LL,  0LL,  v13,  v14,  v6);

  v16 = -[CKKSTLKShareRecord initWithShare:contextID:zoneID:encodedCKRecord:]( objc_alloc(&OBJC_CLASS___CKKSTLKShareRecord),  "initWithShare:contextID:zoneID:encodedCKRecord:",  v15,  v18,  v6,  0LL);
  return v16;
}

- (id)datafyPeerID:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"spid-"])
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(@"spid-", "length")));

    id v3 = (id)v4;
  }

  v5 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v3,  0LL);

  return v5;
}

@end