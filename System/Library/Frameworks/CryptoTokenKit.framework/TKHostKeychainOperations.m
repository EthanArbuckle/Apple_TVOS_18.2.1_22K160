@interface TKHostKeychainOperations
- (BOOL)updateForTokenID:(id)a3 items:(id)a4;
- (id)query:(id)a3;
@end

@implementation TKHostKeychainOperations

- (id)query:(id)a3
{
  id v3 = [a3 mutableCopy];
  [v3 setObject:kSecMatchLimitAll forKeyedSubscript:kSecMatchLimit];
  CFTypeRef result = 0LL;
  OSStatus v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);
  if (v4)
  {
    int v5 = v4;
    id v6 = sub_10000A220();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100010D64((uint64_t)v3, v5, v7);
    }

    v8 = 0LL;
  }

  else
  {
    v8 = (id)result;
  }

  return v8;
}

- (BOOL)updateForTokenID:(id)a3 items:(id)a4
{
  id v4 = a3;
  int updated = SecItemUpdateTokenItemsForAccessGroups();
  if (updated)
  {
    id v6 = sub_10000A220();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543618;
      id v10 = v4;
      __int16 v11 = 1024;
      int v12 = updated;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Failed to update keychain with token items of token %{public}@ - error %d",  (uint8_t *)&v9,  0x12u);
    }
  }

  return updated == 0;
}

@end