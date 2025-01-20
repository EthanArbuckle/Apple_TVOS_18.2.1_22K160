@interface PDCreateShareContext
- (NSString)expectedPairedReaderIdentifier;
- (NSString)expectedProvisioningCredentialHash;
- (PDCreateShareContext)init;
- (id)primaryInvite;
- (id)secondaryInvites;
- (void)_addInvite:(id)a3 forCredentialShare:(id)a4 primary:(BOOL)a5;
- (void)addInvite:(id)a3 forCredentialShare:(id)a4 primary:(BOOL)a5;
- (void)addInvite:(id)a3 primary:(BOOL)a4;
- (void)enumerateAllInvites:(id)a3;
- (void)enumerateSecondaryInvites:(id)a3;
- (void)setExpectedPairedReaderIdentifier:(id)a3;
- (void)setExpectedProvisioningCredentialHash:(id)a3;
- (void)setHandle:(id)a3 forInvite:(id)a4;
- (void)setShareURL:(id)a3 forInvite:(id)a4;
- (void)setTransportIdentifier:(id)a3 forInvite:(id)a4;
@end

@implementation PDCreateShareContext

- (PDCreateShareContext)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDCreateShareContext;
  v2 = -[PDCreateShareContext init](&v14, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    invites = v2->_invites;
    v2->_invites = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    credentialShareForInviteIdentifier = v2->_credentialShareForInviteIdentifier;
    v2->_credentialShareForInviteIdentifier = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    handleForInviteIdentifier = v2->_handleForInviteIdentifier;
    v2->_handleForInviteIdentifier = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    transportIdentifierForInviteIdentifier = v2->_transportIdentifierForInviteIdentifier;
    v2->_transportIdentifierForInviteIdentifier = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    shareURLForInviteIdentifier = v2->_shareURLForInviteIdentifier;
    v2->_shareURLForInviteIdentifier = v11;
  }

  return v2;
}

- (void)addInvite:(id)a3 primary:(BOOL)a4
{
}

- (void)addInvite:(id)a3 forCredentialShare:(id)a4 primary:(BOOL)a5
{
}

- (void)_addInvite:(id)a3 forCredentialShare:(id)a4 primary:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v8 = a4;
  if (v5)
  {
    v9 = (NSString *)objc_claimAutoreleasedReturnValue([v13 identifier]);
    primaryInviteIdentifier = self->_primaryInviteIdentifier;
    self->_primaryInviteIdentifier = v9;
  }

  -[NSMutableArray addObject:](self->_invites, "addObject:", v13);
  if (v8)
  {
    credentialShareForInviteIdentifier = self->_credentialShareForInviteIdentifier;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( credentialShareForInviteIdentifier,  "setObject:forKeyedSubscript:",  v8,  v12);
  }
}

- (void)setHandle:(id)a3 forInvite:(id)a4
{
  handleForInviteIdentifier = self->_handleForInviteIdentifier;
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](handleForInviteIdentifier, "setObject:forKeyedSubscript:", v8, v9);

  id v12 = (id)objc_claimAutoreleasedReturnValue([v8 transportIdentifier]);
  transportIdentifierForInviteIdentifier = self->_transportIdentifierForInviteIdentifier;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( transportIdentifierForInviteIdentifier,  "setObject:forKeyedSubscript:",  v12,  v11);
}

- (void)setTransportIdentifier:(id)a3 forInvite:(id)a4
{
  transportIdentifierForInviteIdentifier = self->_transportIdentifierForInviteIdentifier;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a4 identifier]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( transportIdentifierForInviteIdentifier,  "setObject:forKeyedSubscript:",  v6,  v7);
}

- (void)setShareURL:(id)a3 forInvite:(id)a4
{
  shareURLForInviteIdentifier = self->_shareURLForInviteIdentifier;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a4 identifier]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( shareURLForInviteIdentifier,  "setObject:forKeyedSubscript:",  v6,  v7);
}

- (id)primaryInvite
{
  if (self->_primaryInviteIdentifier)
  {
    invites = self->_invites;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10022E8D8;
    v5[3] = &unk_10064DD48;
    v5[4] = self;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray pk_firstObjectPassingTest:](invites, "pk_firstObjectPassingTest:", v5));
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (id)secondaryInvites
{
  invites = self->_invites;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10022E9B8;
  v4[3] = &unk_10064DD70;
  v4[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[NSMutableArray pk_objectsPassingTest:]( invites,  "pk_objectsPassingTest:",  v4));
}

- (void)enumerateSecondaryInvites:(id)a3
{
  v4 = (void (**)(id, void *, void *, void *))a3;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  obj = self->_invites;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
        primaryInviteIdentifier = self->_primaryInviteIdentifier;
        id v12 = v10;
        id v13 = primaryInviteIdentifier;
        objc_super v14 = v12;
        v15 = v12;
        if (v12 == v13) {
          goto LABEL_15;
        }
        v16 = v13;
        if (v12) {
          BOOL v17 = v13 == 0LL;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17)
        {

LABEL_14:
          v15 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_credentialShareForInviteIdentifier,  "objectForKeyedSubscript:",  v12));
          objc_super v14 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_shareURLForInviteIdentifier,  "objectForKeyedSubscript:",  v12));
          v4[2](v4, v9, v15, v14);
LABEL_15:

          goto LABEL_16;
        }

        unsigned __int8 v18 = -[NSString isEqualToString:](v12, "isEqualToString:", v13);

        if ((v18 & 1) == 0) {
          goto LABEL_14;
        }
LABEL_16:
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    }

    while (v6);
  }
}

- (void)enumerateAllInvites:(id)a3
{
  v4 = (void (**)(id, void *, void *, void *))a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = self->_invites;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier", (void)v14));
        id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_credentialShareForInviteIdentifier,  "objectForKeyedSubscript:",  v11));
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_transportIdentifierForInviteIdentifier,  "objectForKeyedSubscript:",  v11));
        v4[2](v4, v10, v12, v13);
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v7);
  }
}

- (NSString)expectedPairedReaderIdentifier
{
  return self->_expectedPairedReaderIdentifier;
}

- (void)setExpectedPairedReaderIdentifier:(id)a3
{
}

- (NSString)expectedProvisioningCredentialHash
{
  return self->_expectedProvisioningCredentialHash;
}

- (void)setExpectedProvisioningCredentialHash:(id)a3
{
}

- (void).cxx_destruct
{
}

@end