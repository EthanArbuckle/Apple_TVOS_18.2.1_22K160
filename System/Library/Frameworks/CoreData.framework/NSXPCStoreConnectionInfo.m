@interface NSXPCStoreConnectionInfo
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (id)description;
- (id)entitlements;
- (id)initForToken:(id *)a3 entitlementNames:(id)a4 cache:(id)a5;
- (id)persistentStoreCoordinator;
- (id)userInfo;
- (void)dealloc;
@end

@implementation NSXPCStoreConnectionInfo

- (void)dealloc
{
  self->_userInfo = 0LL;
  self->_entitlements = 0LL;

  self->_cache = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSXPCStoreConnectionInfo;
  -[NSXPCStoreConnectionInfo dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"<NSXPCStoreServerConnectionInfo: \n\tentitlements = %@ ;\n\tcoordinator = %@ ;\n\tuserInfo = %@>",
               self->_entitlements,
               -[NSXPCStoreServerPerConnectionCache coordinator](self->_cache, "coordinator"),
               self->_userInfo);
}

- (id)entitlements
{
  return self->_entitlements;
}

- (id)persistentStoreCoordinator
{
  return -[NSXPCStoreServerPerConnectionCache coordinator](self->_cache, "coordinator");
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (id)userInfo
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_userInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)initForToken:(id *)a3 entitlementNames:(id)a4 cache:(id)a5
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___NSXPCStoreConnectionInfo;
  v8 = -[NSXPCStoreConnectionInfo init](&v25, sel_init);
  v9 = v8;
  if (!v8) {
    return v9;
  }
  *((_DWORD *)v8 + 16) = 0;
  __int128 v10 = *(_OWORD *)a3->var0;
  *(_OWORD *)(v8 + 40) = *(_OWORD *)&a3->var0[4];
  v11 = (const __CFAllocator **)MEMORY[0x189604DB0];
  *(_OWORD *)(v8 + 24) = v10;
  v12 = *v11;
  __int128 v13 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v13;
  v14 = SecTaskCreateWithAuditToken(v12, &token);
  v21 = v14;
  *(void *)token.val = 0LL;
  if (!a4)
  {
    if (v9[1]) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  CFDictionaryRef v22 = SecTaskCopyValuesForEntitlements(v14, (CFArrayRef)a4, (CFErrorRef *)&token);
  v9[1] = v22;
  if (!v22) {
LABEL_4:
  }
    v9[1] = [MEMORY[0x189603F68] dictionary];
LABEL_5:
  if (*(void *)token.val)
  {
    _NSCoreDataLog( 1LL,  (uint64_t)@"Error while copying values for entitlements, %@",  v15,  v16,  v17,  v18,  v19,  v20,  *(uint64_t *)token.val);
    CFRelease(*(CFTypeRef *)token.val);
  }

  CFRelease(v21);
  v9[2] = a5;
  return v9;
}

@end