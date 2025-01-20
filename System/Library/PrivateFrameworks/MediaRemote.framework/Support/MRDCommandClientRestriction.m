@interface MRDCommandClientRestriction
+ (id)restrictedTo:(id)a3 by:(id)a4;
- (MRDMediaRemoteClient)requester;
- (NSDate)date;
- (NSSet)allowedAuditTokens;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAllowedAuditTokens:(id)a3;
- (void)setDate:(id)a3;
- (void)setRequester:(id)a3;
@end

@implementation MRDCommandClientRestriction

+ (id)restrictedTo:(id)a3 by:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___MRDCommandClientRestriction);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[MRDCommandClientRestriction setDate:](v7, "setDate:", v8);

  -[MRDCommandClientRestriction setAllowedAuditTokens:](v7, "setAllowedAuditTokens:", v6);
  -[MRDCommandClientRestriction setRequester:](v7, "setRequester:", v5);

  return v7;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@ (%p): ", v6, self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDCommandClientRestriction allowedAuditTokens](self, "allowedAuditTokens"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "msv_map:", &stru_1003A0370));
  -[NSMutableString appendFormat:](v7, "appendFormat:", @"allowedAuditTokens: %@", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDCommandClientRestriction requester](self, "requester"));
  -[NSMutableString appendFormat:](v7, "appendFormat:", @", requester: %@", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDCommandClientRestriction date](self, "date"));
  -[NSMutableString appendFormat:](v7, "appendFormat:", @", date: %@", v12);

  -[NSMutableString appendString:](v7, "appendString:", @">");
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class(self));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDCommandClientRestriction date](self, "date"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setDate:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDCommandClientRestriction allowedAuditTokens](self, "allowedAuditTokens"));
  id v9 = [v8 copyWithZone:a3];
  [v5 setAllowedAuditTokens:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDCommandClientRestriction requester](self, "requester"));
  [v5 setRequester:v10];

  return v5;
}

- (MRDMediaRemoteClient)requester
{
  return self->_requester;
}

- (void)setRequester:(id)a3
{
}

- (NSSet)allowedAuditTokens
{
  return self->_allowedAuditTokens;
}

- (void)setAllowedAuditTokens:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end