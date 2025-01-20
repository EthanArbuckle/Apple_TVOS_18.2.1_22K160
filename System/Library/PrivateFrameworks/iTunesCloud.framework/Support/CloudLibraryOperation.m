@interface CloudLibraryOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (CloudLibraryConnection)connection;
- (CloudLibraryOperation)init;
- (CloudLibraryOperation)initWithCoder:(id)a3;
- (CloudLibraryOperation)initWithConfiguration:(id)a3;
- (CloudLibraryOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4;
- (ICConnectionConfiguration)configuration;
- (ICUserIdentity)userIdentity;
- (ICUserIdentityStore)userIdentityStore;
- (ML3MusicLibrary)musicLibrary;
- (NSError)error;
- (NSString)libraryIdentifier;
- (OS_tcc_identity)clientIdentity;
- (id)description;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setConnection:(id)a3;
- (void)setError:(id)a3;
- (void)setLibraryIdentifier:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation CloudLibraryOperation

- (CloudLibraryOperation)init
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, a2);
  v4 = -[CloudLibraryOperation initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (CloudLibraryOperation)initWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MSVTCCIdentityForCurrentProcess();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( self,  "initWithConfiguration:clientIdentity:",  v4,  v6);

  return v7;
}

- (CloudLibraryOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CloudLibraryOperation;
  v9 = -[CloudLibraryOperation init](&v19, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 userIdentity]);
    libraryIdentifier = v10->_libraryIdentifier;
    v10->_libraryIdentifier = (NSString *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v7 userIdentityStore]);
    configuration = v10->_configuration;
    v10->_configuration = (ICConnectionConfiguration *)v13;

    objc_storeStrong((id *)&v10->_userIdentityStore, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v7 userIdentity]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v15));
    userIdentity = v10->_userIdentity;
    v10->_userIdentity = (ICUserIdentity *)v16;
  }

  return v10;
}

- (CloudLibraryOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(ICConnectionConfiguration, v5),  @"configuration");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = v7;
  if (v7) {
    id v10 = v7;
  }
  else {
    id v10 = (id)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v8);
  }
  uint64_t v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeTCCIdentityForKey:@"clientIdentity"]);
  uint64_t v13 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( self,  "initWithConfiguration:clientIdentity:",  v11,  v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
  [v5 encodeObject:v4 forKey:@"configuration"];

  [v5 encodeTCCIdentity:self->_userIdentityStore forKey:@"clientIdentity"];
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %p",  objc_opt_class(self, a2),  self);
}

- (CloudLibraryConnection)connection
{
  return *(CloudLibraryConnection **)&self->super._private1;
}

- (void)setConnection:(id)a3
{
}

- (NSString)libraryIdentifier
{
  return *(NSString **)&self->_persistent;
}

- (void)setLibraryIdentifier:(id)a3
{
}

- (ICConnectionConfiguration)configuration
{
  return (ICConnectionConfiguration *)self->_connection;
}

- (ICUserIdentity)userIdentity
{
  return (ICUserIdentity *)self->_libraryIdentifier;
}

- (ICUserIdentityStore)userIdentityStore
{
  return self->_configuration;
}

- (ML3MusicLibrary)musicLibrary
{
  return self->_userIdentity;
}

- (OS_tcc_identity)clientIdentity
{
  return self->_userIdentityStore;
}

- (BOOL)isPersistent
{
  return (BOOL)self->super._private;
}

- (int64_t)status
{
  return (int64_t)self->_musicLibrary;
}

- (void)setStatus:(int64_t)a3
{
  self->_musicLibrary = (ML3MusicLibrary *)a3;
}

- (NSError)error
{
  return (NSError *)self->_clientIdentity;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end