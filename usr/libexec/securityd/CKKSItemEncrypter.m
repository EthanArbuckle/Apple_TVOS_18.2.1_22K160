@interface CKKSItemEncrypter
+ (id)decryptDictionary:(id)a3 key:(id)a4 authenticatedData:(id)a5 error:(id *)a6;
+ (id)decryptItemToDictionary:(id)a3 keyCache:(id)a4 error:(id *)a5;
+ (id)decryptItemToDictionaryVersion1or2:(id)a3 keyCache:(id)a4 error:(id *)a5;
+ (id)decryptItemToDictionaryVersionNone:(id)a3 error:(id *)a4;
+ (id)encryptCKKSItem:(id)a3 dataDictionary:(id)a4 updatingCKKSItem:(id)a5 parentkey:(id)a6 keyCache:(id)a7 error:(id *)a8;
+ (id)encryptDictionary:(id)a3 key:(id)a4 authenticatedData:(id)a5 error:(id *)a6;
+ (id)padData:(id)a3 blockSize:(unint64_t)a4 additionalBlock:(BOOL)a5;
+ (id)removePaddingFromData:(id)a3;
@end

@implementation CKKSItemEncrypter

+ (id)padData:(id)a3 blockSize:(unint64_t)a4 additionalBlock:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  if (!a4)
  {
    v8 = sub_10001267C("SecWarning");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CKKS padding function received invalid blocksize 0, using 1 instead",  v18,  2u);
    }

    a4 = 1LL;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](&OBJC_CLASS___NSMutableData, "dataWithData:", v7));
  unint64_t v11 = (unint64_t)[v10 length];
  if (v5) {
    unint64_t v12 = a4;
  }
  else {
    unint64_t v12 = 0LL;
  }
  unint64_t v13 = a4 + v12 + v11 / a4 * a4 - v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", v13));
  [v10 appendData:v14];

  id v15 = v10;
  id v16 = [v15 mutableBytes];
  *((_BYTE *)[v15 length] + (void)v16 - v13) = 0x80;

  return v15;
}

+ (id)removePaddingFromData:(id)a3
{
  id v3 = a3;
  v4 = (unsigned __int8 *)[v3 length];
  id v5 = v3;
  v6 = (char *)[v5 bytes] - 1;
  while (v4)
  {
    int v7 = (v4--)[(void)v6];
    if (v7)
    {
      if (v7 == 128) {
        v4 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue([v5 subdataWithRange:0]);
      }
      else {
        v4 = 0LL;
      }
      break;
    }
  }

  return v4;
}

+ (id)encryptCKKSItem:(id)a3 dataDictionary:(id)a4 updatingCKKSItem:(id)a5 parentkey:(id)a6 keyCache:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v15) {
    goto LABEL_4;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSItemEncrypter decryptItemToDictionary:keyCache:error:]( &OBJC_CLASS___CKKSItemEncrypter,  "decryptItemToDictionary:keyCache:error:",  v15,  v17,  a8));
  id v19 = [v18 mutableCopy];

  if (v19)
  {
    [v19 addEntriesFromDictionary:v14];

    id v14 = v19;
LABEL_4:
    v20 = (void *)objc_claimAutoreleasedReturnValue([v16 getKeychainBackedKey:a8]);
    if (v20
      && (uint64_t v21 = objc_claimAutoreleasedReturnValue( +[CKKSKeychainBackedKey randomKeyWrappedByParent:error:]( &OBJC_CLASS___CKKSKeychainBackedKey,  "randomKeyWrappedByParent:error:",  v20,  a8))) != 0)
    {
      v22 = (void *)v21;
      id v45 = v13;
      id v23 = -[CKKSItem initCopyingCKKSItem:](objc_alloc(&OBJC_CLASS___CKKSItem), "initCopyingCKKSItem:", v13);
      id v44 = v16;
      v24 = (void *)objc_claimAutoreleasedReturnValue([v16 uuid]);
      [v23 setParentKeyUUID:v24];

      v25 = (void *)objc_claimAutoreleasedReturnValue([v22 wrappedkey]);
      [v23 setWrappedkey:v25];

      if (v15) {
        [v15 encver];
      }
      [v23 setEncver:2];
      v26 = (void *)objc_claimAutoreleasedReturnValue([v15 storedCKRecord]);

      if (v26)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue([v15 storedCKRecord]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v15 storedCKRecord]);
        id v43 = v17;
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 recordID]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 zoneID]);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v23 updateCKRecord:v42 zoneID:v29]);
        [v23 setStoredCKRecord:v30];

        id v17 = v43;
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v23,  "makeAuthenticatedDataDictionaryUpdatingCKKSItem:encryptionVersion:",  v15,  objc_msgSend(v23, "encver")));
      v32 = (void *)objc_claimAutoreleasedReturnValue([v22 aessivkey]);
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSItemEncrypter encryptDictionary:key:authenticatedData:error:]( &OBJC_CLASS___CKKSItemEncrypter,  "encryptDictionary:key:authenticatedData:error:",  v14,  v32,  v31,  a8));
      [v23 setEncitem:v33];

      v34 = (void *)objc_claimAutoreleasedReturnValue([v23 encitem]);
      if (v34) {
        id v35 = v23;
      }
      else {
        id v35 = 0LL;
      }

      id v16 = v44;
      id v13 = v45;
    }

    else
    {
      id v35 = 0LL;
    }

    goto LABEL_22;
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneID]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 zoneName]);
  id v38 = sub_1000AA6AC(@"ckme", v37);
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);

  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    if (a8) {
      v40 = (const __CFString *)*a8;
    }
    else {
      v40 = @"null error passed in";
    }
    *(_DWORD *)buf = 138412290;
    v47 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Couldn't decrypt old CKMirror entry: %@",  buf,  0xCu);
  }

  id v35 = 0LL;
LABEL_22:

  return v35;
}

+ (id)decryptItemToDictionaryVersionNone:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 encitem]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  512LL,  0LL,  a4));

  return v6;
}

+ (id)decryptItemToDictionaryVersion1or2:(id)a3 keyCache:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 parentKeyUUID]);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 contextID]);
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  if (v9) {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 loadKeyForUUID:v10 contextID:v11 zoneID:v12 error:a5]);
  }
  else {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[CKKSKey loadKeyWithUUID:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "loadKeyWithUUID:contextID:zoneID:error:",  v10,  v11,  v12,  a5));
  }
  id v14 = (void *)v13;

  if (v14
    && (id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 wrappedkey]),
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 unwrapAESKey:v15 error:a5]),
        v15,
        v16))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "makeAuthenticatedDataDictionaryUpdatingCKKSItem:encryptionVersion:",  v8,  objc_msgSend(v8, "encver")));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 encitem]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([a1 decryptDictionary:v18 key:v16 authenticatedData:v17 error:a5]);

    if (!v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 zoneName]);
      id v22 = sub_1000AA6AC(@"item", v21);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);

      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = *a5;
        int v26 = 138412290;
        id v27 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "ckks: couldn't decrypt item %@",  (uint8_t *)&v26,  0xCu);
      }
    }
  }

  else
  {
    id v19 = 0LL;
  }

  return v19;
}

+ (id)decryptItemToDictionary:(id)a3 keyCache:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 encver];
  if (v9 == (id)2 || v9 == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSItemEncrypter decryptItemToDictionaryVersion1or2:keyCache:error:]( &OBJC_CLASS___CKKSItemEncrypter,  "decryptItemToDictionaryVersion1or2:keyCache:error:",  v7,  v8,  a5));
  }

  else
  {
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Unrecognized encryption version: %lu",  [v7 encver]));
    id v22 = v11;
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"securityd",  1LL,  v12));

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneName]);
    id v16 = sub_1000AA6AC(@"item", v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "decryptItemToDictionary failed: %@", buf, 0xCu);
    }

    if (a5) {
      *a5 = v13;
    }

    v10 = 0LL;
  }

  return v10;
}

+ (id)encryptDictionary:(id)a3 key:(id)a4 authenticatedData:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v9,  200LL,  0LL,  a6));
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"v_Data"]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSItemEncrypter padData:blockSize:additionalBlock:]( CKKSItemEncrypter,  "padData:blockSize:additionalBlock:",  v13,  20,  (unint64_t)[v14 length] < 0x14));

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 encryptData:v15 authenticatedData:v11 error:a6]);
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

+ (id)decryptDictionary:(id)a3 key:(id)a4 authenticatedData:(id)a5 error:(id *)a6
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 decryptData:a3 authenticatedData:a5 error:a6]);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSItemEncrypter removePaddingFromData:]( &OBJC_CLASS___CKKSItemEncrypter,  "removePaddingFromData:",  v7));

    if (v8)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v8,  512LL,  0LL,  a6));
    }

    else
    {
      if (!a6) {
        return 0LL;
      }
      NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
      id v11 = @"Could not remove padding from decrypted item: malformed data";
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
      id v7 = 0LL;
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"securityd",  -67673LL,  v8));
    }
  }

  return v7;
}

@end