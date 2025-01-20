@interface TCCDAccessRecord
- (BOOL)replaceStoredCodeRequirement;
- (NSDate)lastModifiedDate;
- (TCCDAccessObject)accessObject;
- (TCCDAccessRecord)initWithSubject:(id)a3 object:(id)a4 authorizationValue:(unint64_t)a5 authorizationReason:(unint64_t)a6 authorizationVersion:(unint64_t)a7 lastModified:(id)a8 flags:(unint64_t)a9 replaceStoredCodeRequirement:(BOOL)a10;
- (TCCDIdentity)subjectIdentity;
- (id)_dateFormatter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionDictionary;
- (unint64_t)authorizationReason;
- (unint64_t)authorizationValue;
- (unint64_t)authorizationVersion;
- (unint64_t)flags;
- (void)setAccessObject:(id)a3;
- (void)setAuthorizationReason:(unint64_t)a3;
- (void)setAuthorizationValue:(unint64_t)a3;
- (void)setAuthorizationVersion:(unint64_t)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setSubjectIdentity:(id)a3;
@end

@implementation TCCDAccessRecord

- (TCCDAccessRecord)initWithSubject:(id)a3 object:(id)a4 authorizationValue:(unint64_t)a5 authorizationReason:(unint64_t)a6 authorizationVersion:(unint64_t)a7 lastModified:(id)a8 flags:(unint64_t)a9 replaceStoredCodeRequirement:(BOOL)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TCCDAccessRecord;
  v20 = -[TCCDAccessRecord init](&v23, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_subjectIdentity, a3);
    objc_storeStrong((id *)&v21->_accessObject, a4);
    v21->_authorizationValue = a5;
    v21->_authorizationReason = a6;
    v21->_authorizationVersion = a7;
    objc_storeStrong((id *)&v21->_lastModifiedDate, a8);
    v21->_flags = a9;
    v21->_replaceStoredCodeRequirement = a10;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class(self, a2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessRecord subjectIdentity](self, "subjectIdentity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessRecord accessObject](self, "accessObject"));
  unint64_t v7 = -[TCCDAccessRecord authorizationValue](self, "authorizationValue");
  unint64_t v8 = -[TCCDAccessRecord authorizationReason](self, "authorizationReason");
  unint64_t v9 = -[TCCDAccessRecord authorizationValue](self, "authorizationValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessRecord lastModifiedDate](self, "lastModifiedDate"));
  unint64_t v11 = -[TCCDAccessRecord flags](self, "flags");
  LOBYTE(v14) = -[TCCDAccessRecord replaceStoredCodeRequirement](self, "replaceStoredCodeRequirement");
  id v12 = [v4 initWithSubject:v5 object:v6 authorizationValue:v7 authorizationReason:v8 authorizationVersion:v9 lastModified:v10 flags:v11 replaceS toredCodeRequirement:v14];

  return v12;
}

- (id)_dateFormatter
{
  if (qword_1000783A0 != -1) {
    dispatch_once(&qword_1000783A0, &stru_100065C98);
  }
  return (id)qword_100078398;
}

- (id)descriptionDictionary
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessRecord subjectIdentity](self, "subjectIdentity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"Sub");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessRecord accessObject](self, "accessObject"));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"Obj");

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessRecord accessObject](self, "accessObject"));
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceObject]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v9,  "descriptionForAuthorizationValue:reason:",  -[TCCDAccessRecord authorizationValue](self, "authorizationValue"),  -[TCCDAccessRecord authorizationReason](self, "authorizationReason")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, @"Auth");

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu",  -[TCCDAccessRecord authorizationVersion](self, "authorizationVersion")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"AuthVersion");

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessRecord _dateFormatter](self, "_dateFormatter"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessRecord lastModifiedDate](self, "lastModifiedDate"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 stringFromDate:v13]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, @"Mod");

  if (-[TCCDAccessRecord flags](self, "flags"))
  {
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    -[NSMutableString appendFormat:](v15, "appendFormat:", @"{");
    if ((-[TCCDAccessRecord flags](self, "flags") & 1) != 0)
    {
      -[NSMutableString appendFormat:](v15, "appendFormat:", @"Timeout");
      if ((-[TCCDAccessRecord flags](self, "flags") & 2) == 0)
      {
        int v16 = 1;
        goto LABEL_10;
      }

      -[NSMutableString appendFormat:](v15, "appendFormat:", @" | ");
      int v16 = 2;
    }

    else
    {
      if ((-[TCCDAccessRecord flags](self, "flags") & 2) == 0)
      {
        int v16 = 0;
        goto LABEL_10;
      }

      int v16 = 1;
    }

    -[NSMutableString appendFormat:](v15, "appendFormat:", @"SB Ext");
LABEL_10:
    if ((-[TCCDAccessRecord flags](self, "flags") & 4) != 0)
    {
      if (v16) {
        -[NSMutableString appendFormat:](v15, "appendFormat:", @" | ");
      }
      -[NSMutableString appendFormat:](v15, "appendFormat:", @"Allow Standard User to Set System Service");
      ++v16;
    }

    if ((-[TCCDAccessRecord flags](self, "flags") & 8) != 0)
    {
      if (v16) {
        -[NSMutableString appendFormat:](v15, "appendFormat:", @" | ");
      }
      -[NSMutableString appendFormat:](v15, "appendFormat:", @"Next Request Should Prompt");
      int v16 = 1;
    }

    if ((-[TCCDAccessRecord flags](self, "flags") & 0x10) != 0)
    {
      if (v16) {
        -[NSMutableString appendFormat:](v15, "appendFormat:", @" | ");
      }
      id v17 = @"Has Prompted For Allow";
    }

    else
    {
      if (v16)
      {
LABEL_25:
        -[NSMutableString appendFormat:](v15, "appendFormat:", @"}");
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v15, @"Flags");

        goto LABEL_26;
      }

      id v17 = @"Default";
    }

    -[NSMutableString appendFormat:](v15, "appendFormat:", v17);
    goto LABEL_25;
  }

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessRecord descriptionDictionary](self, "descriptionDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return v3;
}

- (TCCDIdentity)subjectIdentity
{
  return (TCCDIdentity *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSubjectIdentity:(id)a3
{
}

- (TCCDAccessObject)accessObject
{
  return (TCCDAccessObject *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAccessObject:(id)a3
{
}

- (unint64_t)authorizationValue
{
  return self->_authorizationValue;
}

- (void)setAuthorizationValue:(unint64_t)a3
{
  self->_authorizationValue = a3;
}

- (unint64_t)authorizationReason
{
  return self->_authorizationReason;
}

- (void)setAuthorizationReason:(unint64_t)a3
{
  self->_authorizationReason = a3;
}

- (unint64_t)authorizationVersion
{
  return self->_authorizationVersion;
}

- (void)setAuthorizationVersion:(unint64_t)a3
{
  self->_authorizationVersion = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setLastModifiedDate:(id)a3
{
}

- (BOOL)replaceStoredCodeRequirement
{
  return self->_replaceStoredCodeRequirement;
}

- (void).cxx_destruct
{
}

@end