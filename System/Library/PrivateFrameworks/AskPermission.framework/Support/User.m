@interface User
- (NSString)DSID;
- (NSString)biometricsToken;
- (NSString)password;
- (NSString)username;
- (User)initWithDSID:(id)a3 username:(id)a4 password:(id)a5 biometricsToken:(id)a6;
- (User)initWithDictionary:(id)a3;
- (id)compile;
- (id)description;
@end

@implementation User

- (User)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DSID"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    id v7 = v5;
  }
  else {
    id v7 = 0LL;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"username"]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
    id v10 = v8;
  }
  else {
    id v10 = 0LL;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"password"]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
    id v13 = v11;
  }
  else {
    id v13 = 0LL;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"biometricsToken"]);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
    id v16 = v14;
  }
  else {
    id v16 = 0LL;
  }

  v17 = 0LL;
  if (v7 && v10)
  {
    self =  -[User initWithDSID:username:password:biometricsToken:]( self,  "initWithDSID:username:password:biometricsToken:",  v7,  v10,  v13,  v16);
    v17 = self;
  }

  return v17;
}

- (User)initWithDSID:(id)a3 username:(id)a4 password:(id)a5 biometricsToken:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___User;
  uint64_t v15 = -[User init](&v18, "init");
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_DSID, a3);
    objc_storeStrong((id *)&v16->_username, a4);
    objc_storeStrong((id *)&v16->_password, a5);
    objc_storeStrong((id *)&v16->_biometricsToken, a6);
  }

  return v16;
}

- (id)compile
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[User biometricsToken](self, "biometricsToken"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v4, @"biometricsToken");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[User DSID](self, "DSID"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v5, @"DSID");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[User password](self, "password"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v6, @"password");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[User username](self, "username"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v7, @"username");

  return v3;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[User compile](self, "compile"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[User ap_generateDescriptionWithSubObjects:](self, "ap_generateDescriptionWithSubObjects:", v3));

  return v4;
}

- (NSString)biometricsToken
{
  return self->_biometricsToken;
}

- (NSString)DSID
{
  return self->_DSID;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)username
{
  return self->_username;
}

- (void).cxx_destruct
{
}

@end