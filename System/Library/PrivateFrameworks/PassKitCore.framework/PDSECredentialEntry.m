@interface PDSECredentialEntry
- (PDSECredentialEntry)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation PDSECredentialEntry

- (PDSECredentialEntry)init
{
  return 0LL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[PDSECredentialEntry allocWithZone:](&OBJC_CLASS___PDSECredentialEntry, "allocWithZone:");
  if (v5)
  {
    v14.receiver = v5;
    v14.super_class = (Class)&OBJC_CLASS___PDSECredentialEntry;
    v6 = -[PDSECredentialEntry init](&v14, "init");
  }

  else
  {
    v6 = 0LL;
  }

  v7 = (NSString *)-[NSString copyWithZone:](self->_passUniqueIdentifier, "copyWithZone:", a3);
  passUniqueIdentifier = v6->_passUniqueIdentifier;
  v6->_passUniqueIdentifier = v7;

  v9 = (NSArray *)-[NSArray copyWithZone:](self->_automaticSelectionCriteria, "copyWithZone:", a3);
  automaticSelectionCriteria = v6->_automaticSelectionCriteria;
  v6->_automaticSelectionCriteria = v9;

  v11 = (NSSet *)-[NSSet copyWithZone:](self->_aliroGroupResolvingKeys, "copyWithZone:", a3);
  aliroGroupResolvingKeys = v6->_aliroGroupResolvingKeys;
  v6->_aliroGroupResolvingKeys = v11;

  v6->_nfcExpressEnabled = self->_nfcExpressEnabled;
  v6->_uwbExpressEnabled = self->_uwbExpressEnabled;
  v6->_expressSuspended = self->_expressSuspended;
  v6->_inSessionExpress = self->_inSessionExpress;
  v6->_supportsUWB = self->_supportsUWB;
  v6->_userChoice = self->_userChoice;
  v6->_supportsExpress = self->_supportsExpress;
  v6->_supportsInSessionExpress = self->_supportsInSessionExpress;
  return v6;
}

- (void).cxx_destruct
{
}

@end