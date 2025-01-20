@interface SecureStorageMock
- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5;
- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6;
- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5;
- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6;
- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5;
- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6;
- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 completionHandler:(id)a7;
- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 connection:(id)a7 completionHandler:(id)a8;
@end

@implementation SecureStorageMock

- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  -[SecureStorageMock setObject:acl:forKey:contextUUID:connection:completionHandler:]( self,  "setObject:acl:forKey:contextUUID:connection:completionHandler:",  v15,  v14,  a5,  v13,  v16,  v12);
}

- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 connection:(id)a7 completionHandler:(id)a8
{
  id v9 = a8;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[LAErrorHelper errorNotSupported](&OBJC_CLASS___LAErrorHelper, "errorNotSupported"));
  (*((void (**)(id, void, id))a8 + 2))(v9, 0LL, v10);
}

- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  -[SecureStorageMock objectForKey:contextUUID:connection:completionHandler:]( self,  "objectForKey:contextUUID:connection:completionHandler:",  a3,  v9,  v10,  v8);
}

- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[LAErrorHelper errorNotSupported](&OBJC_CLASS___LAErrorHelper, "errorNotSupported"));
  (*((void (**)(id, void, id))a6 + 2))(v7, 0LL, v8);
}

- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  -[SecureStorageMock removeObjectForKey:contextUUID:connection:completionHandler:]( self,  "removeObjectForKey:contextUUID:connection:completionHandler:",  a3,  v9,  v10,  v8);
}

- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[LAErrorHelper errorNotSupported](&OBJC_CLASS___LAErrorHelper, "errorNotSupported"));
  (*((void (**)(id, void, id))a6 + 2))(v7, 0LL, v8);
}

- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  -[SecureStorageMock aclForKey:contextUUID:connection:completionHandler:]( self,  "aclForKey:contextUUID:connection:completionHandler:",  a3,  v9,  v10,  v8);
}

- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[LAErrorHelper errorNotSupported](&OBJC_CLASS___LAErrorHelper, "errorNotSupported"));
  (*((void (**)(id, void, id))a6 + 2))(v7, 0LL, v8);
}

@end