@interface ADPreferredMediaUserInfo
- (ADPreferredMediaUserInfo)init;
- (NSMutableDictionary)preferredMediaUserHomeUserIDByAccessoryUUID;
- (NSMutableDictionary)preferredMediaUserSharedUserIDByAccessoryUUID;
- (NSString)preferredMediaUserHomeUserID;
- (NSString)preferredMediaUserSharedUserID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setPreferredMediaUserHomeUserID:(id)a3;
- (void)setPreferredMediaUserHomeUserIDByAccessoryUUID:(id)a3;
- (void)setPreferredMediaUserSharedUserID:(id)a3;
- (void)setPreferredMediaUserSharedUserIDByAccessoryUUID:(id)a3;
@end

@implementation ADPreferredMediaUserInfo

- (ADPreferredMediaUserInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADPreferredMediaUserInfo;
  v2 = -[ADPreferredMediaUserInfo init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    preferredMediaUserSharedUserIDByAccessoryUUID = v2->_preferredMediaUserSharedUserIDByAccessoryUUID;
    v2->_preferredMediaUserSharedUserIDByAccessoryUUID = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    preferredMediaUserHomeUserIDByAccessoryUUID = v2->_preferredMediaUserHomeUserIDByAccessoryUUID;
    v2->_preferredMediaUserHomeUserIDByAccessoryUUID = v5;
  }

  return v2;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADPreferredMediaUserInfo;
  id v4 = -[ADPreferredMediaUserInfo description](&v9, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[NSMutableString initWithFormat:]( v3,  "initWithFormat:",  @"%@, preferredMediaUserSharedUserID: %@, preferredMediaUserHomeUserID: %@",  v5,  self->_preferredMediaUserSharedUserID,  self->_preferredMediaUserHomeUserID);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @", _preferredMediaUserSharedUserIDByAccessoryUUID: %@, _preferredMediaUserHomeUserIDByAccessoryUUID: %@",  self->_preferredMediaUserSharedUserIDByAccessoryUUID,  self->_preferredMediaUserHomeUserIDByAccessoryUUID));
  -[NSMutableString appendString:](v6, "appendString:", v7);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___ADPreferredMediaUserInfo);
  id v5 = -[NSString copy](self->_preferredMediaUserSharedUserID, "copy");
  -[ADPreferredMediaUserInfo setPreferredMediaUserSharedUserID:](v4, "setPreferredMediaUserSharedUserID:", v5);

  id v6 = -[NSString copy](self->_preferredMediaUserHomeUserID, "copy");
  -[ADPreferredMediaUserInfo setPreferredMediaUserHomeUserID:](v4, "setPreferredMediaUserHomeUserID:", v6);

  id v7 = -[NSMutableDictionary mutableCopy](self->_preferredMediaUserSharedUserIDByAccessoryUUID, "mutableCopy");
  -[ADPreferredMediaUserInfo setPreferredMediaUserSharedUserIDByAccessoryUUID:]( v4,  "setPreferredMediaUserSharedUserIDByAccessoryUUID:",  v7);

  id v8 = -[NSMutableDictionary mutableCopy](self->_preferredMediaUserHomeUserIDByAccessoryUUID, "mutableCopy");
  -[ADPreferredMediaUserInfo setPreferredMediaUserHomeUserIDByAccessoryUUID:]( v4,  "setPreferredMediaUserHomeUserIDByAccessoryUUID:",  v8);

  return v4;
}

- (NSString)preferredMediaUserSharedUserID
{
  return self->_preferredMediaUserSharedUserID;
}

- (void)setPreferredMediaUserSharedUserID:(id)a3
{
}

- (NSString)preferredMediaUserHomeUserID
{
  return self->_preferredMediaUserHomeUserID;
}

- (void)setPreferredMediaUserHomeUserID:(id)a3
{
}

- (NSMutableDictionary)preferredMediaUserSharedUserIDByAccessoryUUID
{
  return self->_preferredMediaUserSharedUserIDByAccessoryUUID;
}

- (void)setPreferredMediaUserSharedUserIDByAccessoryUUID:(id)a3
{
}

- (NSMutableDictionary)preferredMediaUserHomeUserIDByAccessoryUUID
{
  return self->_preferredMediaUserHomeUserIDByAccessoryUUID;
}

- (void)setPreferredMediaUserHomeUserIDByAccessoryUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end