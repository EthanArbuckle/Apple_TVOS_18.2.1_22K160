@interface NSData
- (id)backupKeyDigests;
- (id)bskb;
- (id)hexString;
- (id)peerIDForKeybagDigest:(id)a3;
- (id)peerIDs;
- (id)peersAndBackupKeyDigests;
- (id)recoveryKey;
- (id)sha1Digest;
- (id)sha256Digest;
- (void)enumeratePeersWithBlock:(id)a3;
@end

@implementation NSData

- (id)bskb
{
  v12 = 0LL;
  v2 = (void *)SOSBackupSliceKeyBagCreateFromData(0LL, self, &v12);
  if (!v2)
  {
    uint64_t v3 = CloudServicesLog();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100043794(&v12, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  return v2;
}

- (void)enumeratePeersWithBlock:(id)a3
{
  v4 = (void (**)(id, void))a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSData bskb](self, "bskb"));
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    uint64_t v7 = SOSBSKBGetPeers(v5);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8LL * (void)v12));
          v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v10);
    }
  }
}

- (id)hexString
{
  size_t v3 = 2 * -[NSData length](self, "length");
  v4 = malloc(v3);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100007490;
  v6[3] = &unk_100068F70;
  v6[4] = v4;
  -[NSData enumerateByteRangesUsingBlock:](self, "enumerateByteRangesUsingBlock:", v6);
  return  -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  v4,  v3,  4LL,  1LL);
}

- (id)sha256Digest
{
  size_t v3 = (unsigned __int8 *)malloc(0x20uLL);
  BytePtr = CFDataGetBytePtr((CFDataRef)self);
  CC_SHA256(BytePtr, (CC_LONG)-[NSData length](self, "length"), v3);
  return  -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  v3,  32LL,  1LL);
}

- (id)sha1Digest
{
  size_t v3 = (unsigned __int8 *)malloc(0x14uLL);
  BytePtr = CFDataGetBytePtr((CFDataRef)self);
  CC_SHA1(BytePtr, (CC_LONG)-[NSData length](self, "length"), v3);
  return  -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  v3,  20LL,  1LL);
}

- (id)peerIDs
{
  __int128 v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  __int128 v15 = sub_1000076F0;
  __int128 v16 = &unk_100068F98;
  size_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v17 = v3;
  -[NSData enumeratePeersWithBlock:](self, "enumeratePeersWithBlock:", &v13);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[NSData bskb](self, "bskb"));
  uint64_t v5 = (void *)v4;
  if (v4 && SOSBSKBHasRecoveryKey(v4))
  {
    uint64_t v6 = (void *)SOSBSKBCopyRecoveryKey(v5);
    uint64_t v7 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 sha1Digest]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 hexString]);
    id v10 = -[NSString initWithFormat:](v7, "initWithFormat:", @"recovery key (%@)", v9, v13, v14, v15, v16);
    -[NSMutableArray addObject:](v3, "addObject:", v10);
  }

  uint64_t v11 = v3;

  return v11;
}

- (id)recoveryKey
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[NSData bskb](self, "bskb"));
  size_t v3 = (void *)v2;
  else {
    uint64_t v4 = 0LL;
  }

  return v4;
}

- (id)peersAndBackupKeyDigests
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100007888;
  v5[3] = &unk_100068F98;
  size_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v6 = v3;
  -[NSData enumeratePeersWithBlock:](self, "enumeratePeersWithBlock:", v5);

  return v3;
}

- (id)backupKeyDigests
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100007988;
  v5[3] = &unk_100068F98;
  size_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v6 = v3;
  -[NSData enumeratePeersWithBlock:](self, "enumeratePeersWithBlock:", v5);

  return v3;
}

- (id)peerIDForKeybagDigest:(id)a3
{
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_100007B48;
  v22 = sub_100007B58;
  id v23 = 0LL;
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  uint64_t v14 = sub_100007B60;
  __int128 v15 = &unk_100068FC0;
  id v4 = a3;
  id v16 = v4;
  v17 = &v18;
  id v5 = -[NSData enumeratePeersWithBlock:](self, "enumeratePeersWithBlock:", &v12);
  uint64_t v6 = (void *)v19[5];
  if (!v6)
  {
    uint64_t v7 = CloudServicesLog(v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hexString", v12, v13, v14, v15));
      sub_100043804(v9, (uint64_t)v24, v8);
    }

    uint64_t v6 = (void *)v19[5];
  }

  id v10 = v6;

  _Block_object_dispose(&v18, 8);
  return v10;
}

@end