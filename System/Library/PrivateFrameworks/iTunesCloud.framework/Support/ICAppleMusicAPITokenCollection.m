@interface ICAppleMusicAPITokenCollection
- (BOOL)hasDeveloperToken;
- (BOOL)hasUserToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)developerToken;
- (NSString)userToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)privacyConsciousDescription;
- (id)privacyConsciousDictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setDeveloperToken:(id)a3;
- (void)setUserToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICAppleMusicAPITokenCollection

- (id)privacyConsciousDictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  unsigned __int8 v4 = [v3 isInternalBuild];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (-[ICAppleMusicAPITokenCollection hasDeveloperToken](self, "hasDeveloperToken"))
  {
    if ((v4 & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppleMusicAPITokenCollection developerToken](self, "developerToken"));
      [v5 setObject:v6 forKey:@"developerToken"];

      if (!-[ICAppleMusicAPITokenCollection hasUserToken](self, "hasUserToken")) {
        return v5;
      }
      goto LABEL_7;
    }

    [v5 setObject:@"<redacted>" forKey:@"developerToken"];
    if (!-[ICAppleMusicAPITokenCollection hasUserToken](self, "hasUserToken")) {
      return v5;
    }
    goto LABEL_9;
  }

  if (-[ICAppleMusicAPITokenCollection hasUserToken](self, "hasUserToken"))
  {
    if ((v4 & 1) != 0)
    {
LABEL_7:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppleMusicAPITokenCollection userToken](self, "userToken"));
      [v5 setObject:v7 forKey:@"userToken"];

      return v5;
    }

- (id)privacyConsciousDescription
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ICAppleMusicAPITokenCollection;
  id v3 = -[ICAppleMusicAPITokenCollection description](&v8, "description");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[ICAppleMusicAPITokenCollection privacyConsciousDictionaryRepresentation]( self,  "privacyConsciousDictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (BOOL)hasDeveloperToken
{
  return self->_developerToken != 0LL;
}

- (BOOL)hasUserToken
{
  return self->_userToken != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ICAppleMusicAPITokenCollection;
  id v3 = -[ICAppleMusicAPITokenCollection description](&v8, "description");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppleMusicAPITokenCollection dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unsigned __int8 v4 = v3;
  developerToken = self->_developerToken;
  if (developerToken) {
    [v3 setObject:developerToken forKey:@"developerToken"];
  }
  userToken = self->_userToken;
  if (userToken) {
    [v4 setObject:userToken forKey:@"userToken"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000CAB0C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  developerToken = self->_developerToken;
  id v7 = v4;
  if (developerToken)
  {
    PBDataWriterWriteStringField(v4, developerToken, 1LL);
    id v4 = v7;
  }

  userToken = self->_userToken;
  if (userToken)
  {
    PBDataWriterWriteStringField(v7, userToken, 2LL);
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_developerToken, "copyWithZone:", a3);
  id v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[NSString copyWithZone:](self->_userToken, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((developerToken = self->_developerToken, !((unint64_t)developerToken | v4[1]))
     || -[NSString isEqual:](developerToken, "isEqual:")))
  {
    userToken = self->_userToken;
    else {
      unsigned __int8 v8 = 1;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_developerToken, "hash");
  return -[NSString hash](self->_userToken, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4[1])
  {
    -[ICAppleMusicAPITokenCollection setDeveloperToken:](self, "setDeveloperToken:");
    id v4 = v5;
  }

  if (v4[2])
  {
    -[ICAppleMusicAPITokenCollection setUserToken:](self, "setUserToken:");
    id v4 = v5;
  }
}

- (NSString)developerToken
{
  return self->_developerToken;
}

- (void)setDeveloperToken:(id)a3
{
}

- (NSString)userToken
{
  return self->_userToken;
}

- (void)setUserToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end