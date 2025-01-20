@interface SDActivityEncryptionKey
+ (id)newEncryptionKey;
- (unsigned)getTagWhileEncryptingBytesInPlace:(unsigned __int8)a3[10] counterValue:(unsigned __int8)a4[2] forAdvertisementWithVersion:(unsigned __int8)a5;
- (void)prepareForNewEncryptionRequest;
@end

@implementation SDActivityEncryptionKey

+ (id)newEncryptionKey
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_opt_new(&OBJC_CLASS___NSUUID);
  [v2 setKeyIdentifier:v3];

  v4 = objc_opt_new(&OBJC_CLASS___NSDate);
  [v2 setDateCreated:v4];

  uint64_t v5 = 1LL;
  objc_msgSend( v2,  "setLastUsedCounter:",  (unsigned __int16)sub_10008E3B0(@"BluetoothAdvertiseEncryptionStartCount", 1));
  [v2 setLastUsedCounter:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 32LL));
  [v2 setKeyData:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v2 keyData]);
  [v7 setLength:32];

  id v8 = objc_claimAutoreleasedReturnValue([v2 keyData]);
  CCRandomGenerateBytes([v8 mutableBytes], 0x20uLL);

  return v2;
}

- (void)prepareForNewEncryptionRequest
{
  -[SDActivityKey setValidKey:](self, "setValidKey:", -[SDActivityKey lastUsedCounter](self, "lastUsedCounter") != 0);
}

- (unsigned)getTagWhileEncryptingBytesInPlace:(unsigned __int8)a3[10] counterValue:(unsigned __int8)a4[2] forAdvertisementWithVersion:(unsigned __int8)a5
{
  unsigned __int8 v14 = a5;
  unsigned __int8 v13 = 0;
  *a4 = -[SDActivityKey lastUsedCounter](self, "lastUsedCounter");
  a4[1] = -[SDActivityKey lastUsedCounter](self, "lastUsedCounter") >> 8;
  uint64_t v8 = ccaes_gcm_encrypt_mode();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyData](self, "keyData"));
  id v10 = [v9 length];
  id v11 = objc_claimAutoreleasedReturnValue(-[SDActivityKey keyData](self, "keyData"));
  ccgcm_one_shot(v8, v10, [v11 bytes], 2, a4, 1, &v14, 10, a3, a3, 1, &v13);

  return v13;
}

@end