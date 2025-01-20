@interface BTMagicPairingUtility
- (id)cipherBluetoothAddress:(id)a3;
- (id)magicPairingDecryptDataWithKey:(id)a3 payload:(id)a4 length:(unint64_t)a5;
- (id)magicPairingEncryptDataWithKey:(id)a3 payload:(id)a4;
@end

@implementation BTMagicPairingUtility

- (id)cipherBluetoothAddress:(id)a3
{
  __int16 v11 = 0;
  int v10 = 0;
  v3 = [a3 bytes];
  *(_DWORD *)v7 = *(_DWORD *)v3;
  *(_WORD *)&v7[4] = v3[2];
  __int16 v9 = *(_WORD *)&v7[4];
  int v8 = *(_DWORD *)v7;
  uint64_t v4 = 6LL;
  for (uint64_t i = 5LL; i != -1; --i)
    *((_BYTE *)&v8 + v4++) = v7[i];
  int v12 = *(_DWORD *)&v7[1] ^ *(_DWORD *)v7;
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v8,  16LL));
}

- (id)magicPairingEncryptDataWithKey:(id)a3 payload:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = ccaes_ecb_encrypt_mode();
  v18[0] = 0LL;
  v18[1] = 0LL;
  id v8 = v6;
  id v9 = [v8 bytes];

  id v10 = v5;
  id v11 = [v10 bytes];

  int v12 = ccecb_one_shot(v7, 16LL, v9, 1LL, v11, v18);
  if (!v12) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v18,  16LL));
  }
  int v13 = v12;
  os_log_t v14 = sub_100060178("BTMagicPairingUtility");
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109120;
    v17[1] = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Unable to encrypt key with error code: %d",  (uint8_t *)v17,  8u);
  }

  return 0LL;
}

- (id)magicPairingDecryptDataWithKey:(id)a3 payload:(id)a4 length:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = ccaes_ecb_decrypt_mode();
  v20[0] = 0LL;
  v20[1] = 0LL;
  id v10 = v8;
  id v11 = [v10 bytes];

  id v12 = v7;
  id v13 = [v12 bytes];

  int v14 = ccecb_one_shot(v9, a5, v11, 1LL, v13, v20);
  if (!v14) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v20,  a5));
  }
  int v15 = v14;
  os_log_t v16 = sub_100060178("BTMagicPairingUtility");
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109120;
    v19[1] = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Unable to decrypt key with error code: %d",  (uint8_t *)v19,  8u);
  }

  return 0LL;
}

@end