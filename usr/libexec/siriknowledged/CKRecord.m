@interface CKRecord
+ (id)acceptedClasses;
- (NSSecureCoding)data;
- (void)setData:(id)a3;
@end

@implementation CKRecord

- (NSSecureCoding)data
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"value"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v22 = 0LL;
    v6 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v4,  &v22);
    id v7 = v22;
    id v8 = [(id)objc_opt_class(self) acceptedClasses];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (!v9)
    {
      uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDate);
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSSet);
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSURL);
      v17 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v21,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  objc_opt_class(&OBJC_CLASS___NSUUID),  0LL);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v17);
    }

    id v18 = (id)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v6,  "decodeObjectOfClasses:forKey:",  v9,  NSKeyedArchiveRootObjectKey));
    -[NSKeyedUnarchiver finishDecoding](v6, "finishDecoding");
    if (v7)
    {
      v19 = (os_log_s *)CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[CKRecord(SiriKnowledgeAdditions) data]";
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Error encountered while decoding record data: %@",  buf,  0x16u);
      }

      id v18 = 0LL;
    }
  }

  else
  {
    id v18 = v4;
  }

  return (NSSecureCoding *)v18;
}

- (void)setData:(id)a3
{
  if (!a3)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
    [v8 setObject:0 forKey:@"value"];

    return;
  }

  id v9 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v9));
  id v5 = v9;
  if (v5)
  {
    v6 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[CKRecord(SiriKnowledgeAdditions) setData:]";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Error encountered while encoding record data: %@",  buf,  0x16u);
    }

    goto LABEL_8;
  }

  if (v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
    [v7 setObject:v4 forKey:@"value"];

LABEL_8:
  }
}

+ (id)acceptedClasses
{
  if (qword_10001DE38 != -1) {
    dispatch_once(&qword_10001DE38, &stru_100018508);
  }
  return (id)qword_10001DE30;
}

@end