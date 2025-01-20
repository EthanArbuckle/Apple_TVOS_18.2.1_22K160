@interface WAMessageAWDStoreEntry
+ (BOOL)supportsSecureCoding;
- (WAMessageAWD)message;
- (WAMessageAWDStoreEntry)init;
- (WAMessageAWDStoreEntry)initWithCoder:(id)a3;
- (WAMessageAWDStoreEntry)initWithPayload:(id)a3;
- (id)description;
- (id)payload;
- (unint64_t)lastModifiedTimeInMillisecondEpoch;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
- (void)setLastModifiedTimeInMillisecondEpoch:(unint64_t)a3;
- (void)setPayload:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)updatePayload:(id)a3;
@end

@implementation WAMessageAWDStoreEntry

- (WAMessageAWDStoreEntry)initWithPayload:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___WAMessageAWDStoreEntry;
  v6 = -[WAMessageAWDStoreEntry init](&v14, "init");
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___NSSecureCoding])
  {
    objc_storeStrong(&v6->_payload, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v7 timeIntervalSince1970];
    v6->_lastModifiedTimeInMillisecondEpoch = (unint64_t)(v8 * 1000.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6->_payload,  1LL,  0LL));
    v6->_size = (unint64_t)[v9 length];

    v10 = v6;
  }

  else
  {
    id v12 = WALogCategoryDefaultHandle();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v16 = "-[WAMessageAWDStoreEntry initWithPayload:]";
      __int16 v17 = 1024;
      int v18 = 29;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:WAMessageAWDStoreEntry can only accept payloads that conform to the NSSecureCoding protocol, returning nil",  buf,  0x12u);
    }

    v10 = 0LL;
  }

  return v10;
}

- (void)updatePayload:(id)a3
{
  id v4 = a3;
  if (([v4 conformsToProtocol:&OBJC_PROTOCOL___NSSecureCoding] & 1) == 0)
  {
    id v19 = WALogCategoryDefaultHandle();
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v21 = 136446466;
    v22 = "-[WAMessageAWDStoreEntry updatePayload:]";
    __int16 v23 = 1024;
    int v24 = 49;
    int v18 = "%{public}s::%d:WAMessageAWDStoreEntry can only accept payloads that conform to the NSSecureCoding protocol, returning nil";
    goto LABEL_8;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStoreEntry payload](self, "payload"));
  uint64_t v6 = objc_opt_class(v5);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) == 0)
  {
    id v20 = WALogCategoryDefaultHandle();
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v21 = 136446466;
    v22 = "-[WAMessageAWDStoreEntry updatePayload:]";
    __int16 v23 = 1024;
    int v24 = 50;
    int v18 = "%{public}s::%d:-[WAMessageAWDStoreEntry updatePayload:] can only accept payloads of the same class type that w"
          "as used to initalize this instance";
    goto LABEL_8;
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___WAMessageAWD);
  if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStoreEntry payload](self, "payload"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
    unsigned __int8 v12 = [v9 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      id v16 = WALogCategoryDefaultHandle();
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_9:

        goto LABEL_10;
      }

      int v21 = 136446466;
      v22 = "-[WAMessageAWDStoreEntry updatePayload:]";
      __int16 v23 = 1024;
      int v24 = 51;
      int v18 = "%{public}s::%d:-[WAMessageAWDStoreEntry updatePayload:] can only accept updated payloads of type WAMessageAW"
            "D where the update has the same uuid as the WAMessageAWD instance used to initialize this entry";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v21, 0x12u);
      goto LABEL_9;
    }
  }

  -[WAMessageAWDStoreEntry setPayload:](self, "setPayload:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v13 timeIntervalSince1970];
  -[WAMessageAWDStoreEntry setLastModifiedTimeInMillisecondEpoch:]( self,  "setLastModifiedTimeInMillisecondEpoch:",  (unint64_t)(v14 * 1000.0));

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self->_payload,  1LL,  0LL));
  -[WAMessageAWDStoreEntry setSize:](self, "setSize:", [v15 length]);

LABEL_10:
}

- (WAMessageAWD)message
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStoreEntry payload](self, "payload"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___WAMessageAWD);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0) {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStoreEntry payload](self, "payload"));
  }
  else {
    uint64_t v6 = 0LL;
  }
  return (WAMessageAWD *)v6;
}

- (WAMessageAWDStoreEntry)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"-init is not a valid initializer for this class",  0LL));
  objc_exception_throw(v2);
  return (WAMessageAWDStoreEntry *)-[WAMessageAWDStoreEntry description](v3, v4);
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStoreEntry payload](self, "payload"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___WAMessageAWD);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStoreEntry payload](self, "payload"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 key]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStoreEntry payload](self, "payload"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 originalClassName]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(-[WAMessageAWDStoreEntry lastModifiedTimeInMillisecondEpoch]( self,  "lastModifiedTimeInMillisecondEpoch")
                             / 0x3E8)));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Message with key: %@ original classname: %@ added: %@ + %llu size: %lu",  v7,  v9,  v10,  -[WAMessageAWDStoreEntry lastModifiedTimeInMillisecondEpoch]( self,  "lastModifiedTimeInMillisecondEpoch")
                    % 0x3E8,
                      -[WAMessageAWDStoreEntry size](self, "size")));
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(-[WAMessageAWDStoreEntry lastModifiedTimeInMillisecondEpoch]( self,  "lastModifiedTimeInMillisecondEpoch")
                            / 0x3E8)));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"added: %@ + %llu size: %lu",  v6,  -[WAMessageAWDStoreEntry lastModifiedTimeInMillisecondEpoch]( self,  "lastModifiedTimeInMillisecondEpoch")
                    % 0x3E8,
                      -[WAMessageAWDStoreEntry size](self, "size")));
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id payload = self->_payload;
  id v5 = a3;
  [v5 encodeObject:payload forKey:@"_payload"];
  [v5 encodeInt64:self->_lastModifiedTimeInMillisecondEpoch forKey:@"_lastModifiedTimeInMillisecondEpoch"];
  [v5 encodeInteger:self->_size forKey:@"_size"];
}

- (WAMessageAWDStoreEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___WAMessageAWDStoreEntry;
  id v5 = -[WAMessageAWDStoreEntry init](&v13, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSData);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___WAMessageAWD);
    uint64_t v8 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v7,  objc_opt_class(&OBJC_CLASS___WAField),  0LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"_payload"]);
    id payload = v5->_payload;
    v5->_id payload = (id)v10;

    v5->_lastModifiedTimeInMillisecondEpoch = (unint64_t)[v4 decodeInt64ForKey:@"_lastModifiedTimeInMillisecondEpoch"];
    v5->_size = (unint64_t)[v4 decodeIntegerForKey:@"_size"];
  }

  return v5;
}

- (id)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (unint64_t)lastModifiedTimeInMillisecondEpoch
{
  return self->_lastModifiedTimeInMillisecondEpoch;
}

- (void)setLastModifiedTimeInMillisecondEpoch:(unint64_t)a3
{
  self->_lastModifiedTimeInMillisecondEpoch = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
}

@end