@interface SQLiteKeychainHelper
+ (BOOL)_saveValueToKeychain:(id)a3 forKey:(id)a4 error:(id *)a5;
+ (BOOL)storeKey:(id)a3 withIdentifier:(id)a4 error:(id *)a5;
+ (__CFDictionary)_baseQueryForKeyID:(id)a3 additionalCapacity:(unint64_t)a4;
+ (id)_copyErrorForOSStatus:(int)a3;
+ (id)_valueFromKeychainForKey:(id)a3 error:(id *)a4;
+ (id)fetchKeyWithIdentifier:(id)a3 error:(id *)a4;
@end

@implementation SQLiteKeychainHelper

+ (id)fetchKeyWithIdentifier:(id)a3 error:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.storekitagent.encryption",  a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _valueFromKeychainForKey:v6 error:a4]);

  return v7;
}

+ (BOOL)storeKey:(id)a3 withIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.storekitagent.encryption",  a4));
  LOBYTE(a5) = [a1 _saveValueToKeychain:v8 forKey:v9 error:a5];

  return (char)a5;
}

+ (id)_copyErrorForOSStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = (__CFString *)SecCopyErrorMessageString(a3, 0LL);
  if (v4)
  {
    v14[0] = NSDebugDescriptionErrorKey;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Keychain failed to return value (error %d): %@",  v3,  v4));
    v15[0] = v5;
    v14[1] = @"SKUnderlyingSecErr";
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
    v15[1] = v6;
    v7 = v15;
    id v8 = v14;
  }

  else
  {
    v12[0] = NSDebugDescriptionErrorKey;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Keychain failed to return value (error %d)",  v3));
    v12[1] = @"SKUnderlyingSecErr";
    v13[0] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
    v13[1] = v6;
    v7 = v13;
    id v8 = v12;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v8,  2LL));

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ASDErrorDomain,  523LL,  v9));
  return v10;
}

+ (BOOL)_saveValueToKeychain:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (__CFDictionary *)[a1 _baseQueryForKeyID:v8 additionalCapacity:5];
  CFDictionaryAddValue(v10, kSecAttrLabel, @"StoreKit User Data Encryption");
  CFDictionaryAddValue(v10, kSecAttrCanEncrypt, kCFBooleanTrue);
  CFDictionaryAddValue(v10, kSecAttrCanDecrypt, kCFBooleanTrue);
  CFDictionaryAddValue(v10, kSecValueData, v9);

  CFDictionaryAddValue(v10, kSecAttrAccessible, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly);
  uint64_t v11 = SecItemAdd(v10, 0LL);
  if ((_DWORD)v11 == -25299)
  {
    v12 = (const __CFDictionary *)[a1 _baseQueryForKeyID:v8 additionalCapacity:0];
    SecItemDelete(v12);
    CFRelease(v12);
    uint64_t v11 = SecItemAdd(v10, 0LL);
  }

  CFRelease(v10);
  if ((_DWORD)v11)
  {
    id v13 = [a1 _copyErrorForOSStatus:v11];
    if (a5)
    {
      id v13 = v13;
      *a5 = v13;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return (_DWORD)v11 == 0;
}

+ (id)_valueFromKeychainForKey:(id)a3 error:(id *)a4
{
  v6 = (__CFDictionary *)[a1 _baseQueryForKeyID:a3 additionalCapacity:1];
  CFDictionaryAddValue(v6, kSecReturnData, kCFBooleanTrue);
  CFTypeRef cf = 0LL;
  OSStatus v7 = SecItemCopyMatching(v6, &cf);
  if (v7 || !cf)
  {
    if (v7 != -25300 && v7)
    {
      id v9 = objc_msgSend(a1, "_copyErrorForOSStatus:");
LABEL_10:
      v10 = 0LL;
      if (!a4) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }

+ (__CFDictionary)_baseQueryForKeyID:(id)a3 additionalCapacity:(unint64_t)a4
{
  CFIndex v4 = a4 + 5;
  id v5 = a3;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, v4, 0LL, 0LL);
  CFDictionaryAddValue(Mutable, kSecAttrApplicationLabel, v5);

  CFDictionaryAddValue(Mutable, kSecUseDataProtectionKeychain, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassKey);
  CFDictionaryAddValue(Mutable, kSecAttrKeyClass, kSecAttrKeyClassPrivate);
  return Mutable;
}

@end