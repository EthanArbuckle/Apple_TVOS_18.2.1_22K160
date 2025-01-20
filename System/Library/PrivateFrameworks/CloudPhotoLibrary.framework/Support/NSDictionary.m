@interface NSDictionary
- (id)cplRecordWithName:(id)a3 zonedID:(id)a4;
- (id)cpl_validObjectForKey:(id)a3 class:(id)a4;
@end

@implementation NSDictionary

- (id)cpl_validObjectForKey:(id)a3 class:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", v6));
  v9 = (void *)v8;
  if (v8)
  {
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v8, v7);
    if ((isKindOfClass & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v11 = __CPLGenericOSLogDomain(isKindOfClass);
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412802;
          id v16 = v7;
          __int16 v17 = 2112;
          id v18 = (id)objc_opt_class(v9);
          __int16 v19 = 2112;
          id v20 = v6;
          id v13 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Expected class: %@ but got class %@ for key: %@",  (uint8_t *)&v15,  0x20u);
        }
      }

      v9 = 0LL;
    }
  }

  return v9;
}

- (id)cplRecordWithName:(id)a3 zonedID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  v7,  v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v8));
  return v9;
}

@end