@interface NSXPCStoreManagedObjectArchivingToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSXPCStoreManagedObjectArchivingToken)initWithCoder:(id)a3;
- (NSXPCStoreManagedObjectArchivingToken)initWithURI:(id)a3;
- (id)URI;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSXPCStoreManagedObjectArchivingToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSXPCStoreManagedObjectArchivingToken)initWithURI:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSXPCStoreManagedObjectArchivingToken;
  v4 = -[NSXPCStoreManagedObjectArchivingToken init](&v6, sel_init);
  if (v4) {
    v4->_managedObjectReferenceURI = (NSURL *)a3;
  }
  return v4;
}

- (id)URI
{
  return self->_managedObjectReferenceURI;
}

- (void)dealloc
{
  self->_managedObjectReferenceURI = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSXPCStoreManagedObjectArchivingToken;
  -[NSXPCStoreManagedObjectArchivingToken dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSXPCStoreManagedObjectArchivingToken)initWithCoder:(id)a3
{
  v4 = self;
  v5 = (void *)MEMORY[0x186E3E5D8](self, a2);
  objc_super v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSManagedObjectIDURI"];
  v7 = (void *)[a3 delegate];
  if ([a3 requiresSecureCoding])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (v8 = (void *)[a3 userInfo]) != 0)
    {
      v9 = v8;
      id v10 = (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v8, "valueForKey:", @"NSConnectionContext"),  "managedObjectContext"),  "persistentStoreCoordinator");
      if (v10) {
        goto LABEL_17;
      }
      id v10 = (id)[v9 valueForKey:@"PSCKey"];
      if (v10) {
        goto LABEL_16;
      }
    }

    else
    {
      id v10 = 0LL;
    }

    if (!v7) {
      goto LABEL_16;
    }
  }

  else if (!v7)
  {
    goto LABEL_20;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend((id)objc_msgSend(v7, "managedObjectContext"), "persistentStoreCoordinator");
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_20:
      NSLog( (NSString *)@"NSMOIDArchivingToken escaping un-de-tokenized (secured %d).",  [a3 requiresSecureCoding]);
LABEL_26:
      v20 = -[NSXPCStoreManagedObjectArchivingToken init](v4, "init");
      v20->_managedObjectReferenceURI = (NSURL *)v6;
      goto LABEL_27;
    }

    v11 = (void *)[v7 _persistentStoreCoordinator];
  }

  id v10 = v11;
LABEL_16:
  if (!v10) {
    goto LABEL_20;
  }
LABEL_17:
  id v12 = v10;
  if (!v6)
  {
    _NSCoreDataLog(1LL, (uint64_t)@"XPC: Missing oid uri", v13, v14, v15, v16, v17, v18, v28);
    goto LABEL_26;
  }

  v19 = (NSXPCStoreManagedObjectArchivingToken *)(id)[v10 managedObjectIDForURIRepresentation:v6];
  if (v19)
  {
    v20 = v19;

    goto LABEL_27;
  }

  if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
    _NSCoreDataLog( 1LL,  (uint64_t)@"XPC: Possible API misuse: Unable to find object for managed object URI %@, returning null instead",  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)v6);
  }

  v20 = (NSXPCStoreManagedObjectArchivingToken *)[MEMORY[0x189603FE8] null];
  if (!v20)
  {
    v4 = 0LL;
    goto LABEL_26;
  }

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5) {
    LOBYTE(v5) = -[NSURL isEqual:](self->_managedObjectReferenceURI, "isEqual:", *((void *)a3 + 1));
  }
  return v5;
}

@end