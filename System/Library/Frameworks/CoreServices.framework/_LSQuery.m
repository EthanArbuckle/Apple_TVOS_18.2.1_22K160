@interface _LSQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)_canResolveLocallyWithoutMappingDatabase;
- (BOOL)_remoteResolutionIsExpensive;
- (BOOL)_requiresDatabaseMappingEntitlement;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLegacy;
- (_LSQuery)init;
- (id)_init;
- (id)resolveExpensiveQueryRemotelyUsingResolver:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)setLegacy:(BOOL)a3;
@end

@implementation _LSQuery

- (_LSQuery)init
{
}

- (void)setLegacy:(BOOL)a3
{
  self->_legacy = a3;
  if (a3 && ([(id)__LSDefaultsGetSharedInstance() isServer] & 1) == 0)
  {
    __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
    __LAUNCH_SERVICES_IS_ABORTING_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
    __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_IS_USING_INSECURE_SPI__();
  }

- (BOOL)isEqual:(id)a3
{
  v4 = (_LSQuery *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v7) = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = -[_LSQuery isLegacy](v5, "isLegacy");
    int v7 = v6 ^ -[_LSQuery isLegacy](self, "isLegacy") ^ 1;
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = -[_LSQuery isLegacy](self, "isLegacy");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____LSQuery;
  return -[_LSQuery hash](&v5, sel_hash) ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isLegacy
{
  return self->_legacy;
}

- (id)_init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____LSQuery;
  return -[_LSQuery init](&v4, sel_init);
}

- (BOOL)_canResolveLocallyWithoutMappingDatabase
{
  return 0;
}

- (BOOL)_remoteResolutionIsExpensive
{
  return 0;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  objc_super v5 = (void (**)(id, void, void *))a4;
  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[_LSQuery(Internal) _enumerateWithXPCConnection:block:]",  122LL,  0LL);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0LL, v4);
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 0;
}

- (id)resolveExpensiveQueryRemotelyUsingResolver:(id)a3 error:(id *)a4
{
  return 0LL;
}

@end