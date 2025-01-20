@interface APSSystemUser
+ (id)allConsoleUserIDs;
+ (id)allDaemonUserIDs;
+ (id)allSystemUsers;
+ (id)systemUserWithUID:(unsigned int)a3;
+ (id)systemUserWithUserID:(id)a3;
- (APSSystemUser)initWithUserID:(id)a3;
- (BOOL)isDaemonUser;
- (BOOL)isDifferentUser;
- (BOOL)isGuestUser;
- (BOOL)isLoggedIn;
- (BOOL)isLoggedOut;
- (BOOL)isRootUser;
- (NSString)status;
- (NSString)userID;
- (id)debugDescription;
- (unsigned)uid;
- (void)removeUser;
- (void)setStatus:(id)a3;
@end

@implementation APSSystemUser

+ (id)systemUserWithUserID:(id)a3
{
  id v3 = a3;
  if (qword_10014E918 != -1) {
    dispatch_once(&qword_10014E918, &stru_10011FD30);
  }
  v4 = (APSSystemUser *)objc_claimAutoreleasedReturnValue([(id)qword_10014E910 objectForKey:v3]);
  if (!v4)
  {
    v4 = -[APSSystemUser initWithUserID:](objc_alloc(&OBJC_CLASS___APSSystemUser), "initWithUserID:", v3);
    [(id)qword_10014E910 setObject:v4 forKey:v3];
  }

  return v4;
}

+ (id)systemUserWithUID:(unsigned int)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lld", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 systemUserWithUserID:v4]);

  return v5;
}

- (APSSystemUser)initWithUserID:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___APSSystemUser;
  v6 = -[APSSystemUser init](&v22, "init");
  v7 = v6;
  if (!v6) {
    goto LABEL_23;
  }
  objc_storeStrong((id *)&v6->_userID, a3);
  if ([v5 isEqualToString:APSDefaultUserID])
  {
    BOOL v8 = 1;
    goto LABEL_21;
  }

  uint64_t v9 = -[APSSystemUser uid](v7, "uid");
  if (qword_10014E920 != -1) {
    dispatch_once(&qword_10014E920, &stru_10011FD50);
  }
  if (v9 > 0x1F3)
  {
    BOOL v8 = 0;
    goto LABEL_21;
  }

  size_t v10 = qword_10014DE18;
  if (qword_10014DE18 <= 0)
  {
    size_t v10 = 0x4000LL;
    qword_10014DE18 = 0x4000LL;
  }

  v11 = (char *)calloc(v10, 1uLL);
  memset(&v24, 0, sizeof(v24));
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }

  if (getpwuid_r(v9, &v24, v11, qword_10014DE18, &v23) || !v23 || !v24.pw_name)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
LABEL_18:
    }
      sub_1000BFA00(v9, v12, v13, v14, v15, v16, v17, v18);
LABEL_19:
    BOOL v8 = 0;
    goto LABEL_20;
  }

  BOOL v8 = *v24.pw_name == 95;
LABEL_20:
  free(v11);
LABEL_21:
  v7->_daemonUser = v8;
  status = v7->_status;
  v7->_status = (NSString *)@"logged out";

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    userID = (char *)v7->_userID;
    LODWORD(v24.pw_name) = 138412546;
    *(char **)((char *)&v24.pw_name + 4) = (char *)v7;
    WORD2(v24.pw_passwd) = 2112;
    *(char **)((char *)&v24.pw_passwd + 6) = userID;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Initializing system user with uid %@",  (uint8_t *)&v24,  0x16u);
  }

- (unsigned)uid
{
  return -[NSString longLongValue](self->_userID, "longLongValue");
}

- (BOOL)isLoggedIn
{
  return -[NSString isEqualToString:](self->_status, "isEqualToString:", @"logged in");
}

- (BOOL)isLoggedOut
{
  return -[NSString isEqualToString:](self->_status, "isEqualToString:", @"logged out");
}

- (BOOL)isDaemonUser
{
  return self->_daemonUser;
}

- (BOOL)isGuestUser
{
  return 0;
}

- (BOOL)isRootUser
{
  return -[NSString isEqualToString:](self->_userID, "isEqualToString:", @"0");
}

- (BOOL)isDifferentUser
{
  return 0;
}

- (void)removeUser
{
}

- (void)setStatus:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (self->_daemonUser && [v5 isEqualToString:@"logged out"])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      userID = self->_userID;
      status = self->_status;
      int v17 = 138413058;
      uint64_t v18 = self;
      __int16 v19 = 2112;
      v20 = userID;
      __int16 v21 = 2112;
      objc_super v22 = status;
      __int16 v23 = 2112;
      passwd v24 = v6;
      uint64_t v9 = "%@: Not changing status for uid %@ from %@ to %@";
      uint32_t v10 = 42;
LABEL_8:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v9,  (uint8_t *)&v17,  v10);
    }
  }

  else
  {
    unsigned __int8 v11 = [v6 isEqualToString:self->_status];
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if ((v11 & 1) != 0)
    {
      if (v12)
      {
        uint64_t v13 = self->_userID;
        uint64_t v14 = self->_status;
        int v17 = 138412802;
        uint64_t v18 = self;
        __int16 v19 = 2112;
        v20 = v13;
        __int16 v21 = 2112;
        objc_super v22 = v14;
        uint64_t v9 = "%@: Not changing status for uid %@, status remains %@";
        uint32_t v10 = 32;
        goto LABEL_8;
      }
    }

    else
    {
      if (v12)
      {
        uint64_t v15 = self->_userID;
        uint64_t v16 = self->_status;
        int v17 = 138413058;
        uint64_t v18 = self;
        __int16 v19 = 2112;
        v20 = v15;
        __int16 v21 = 2112;
        objc_super v22 = v16;
        __int16 v23 = 2112;
        passwd v24 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Changing status for uid %@ from %@ to %@",  (uint8_t *)&v17,  0x2Au);
      }

      objc_storeStrong((id *)&self->_status, a3);
    }
  }
}

+ (id)allConsoleUserIDs
{
  return +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
}

+ (id)allDaemonUserIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [(id)qword_10014E910 count]));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10014E910, "allValues", 0));
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v8 isDaemonUser])
        {
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userID]);
          [v2 addObject:v9];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  return v2;
}

+ (id)allSystemUsers
{
  return [(id)qword_10014E910 allValues];
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class(self, a2);
  if (self->_daemonUser) {
    id v4 = "yes";
  }
  else {
    id v4 = "no";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<<%@: %p>: { userID=%@, status=%@, daemonUser=%s>",  v3,  self,  self->_userID,  self->_status,  v4);
}

- (NSString)userID
{
  return self->_userID;
}

- (NSString)status
{
  return self->_status;
}

- (void).cxx_destruct
{
}

@end