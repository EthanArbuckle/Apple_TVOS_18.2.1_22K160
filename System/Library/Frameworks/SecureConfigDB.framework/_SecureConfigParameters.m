@interface _SecureConfigParameters
+ (id)loadContentsAndReturnError:(id *)a3;
- (NSString)debugDescription;
- (NSString)logPolicyPath;
- (_SecureConfigParameters)init;
- (const)research_disableAppleInfrastructureEnforcement;
- (const)unvalidatedBooleanParameter:(id)a3 error:(id *)a4;
- (const)unvalidatedNumberParameter:(id)a3 error:(id *)a4;
- (id)unvalidatedStringParameter:(id)a3 error:(id *)a4;
- (int64_t)securityPolicy;
@end

@implementation _SecureConfigParameters

- (int64_t)securityPolicy
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____SecureConfigParameters_securityPolicy);
}

- (NSString)logPolicyPath
{
  if (*(void *)&self->securityPolicy[OBJC_IVAR____SecureConfigParameters_logPolicyPath])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_188B58B54();
    swift_bridgeObjectRelease();
  }

  else
  {
    v2 = 0LL;
  }

  return (NSString *)v2;
}

- (const)research_disableAppleInfrastructureEnforcement
{
  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____SecureConfigParameters_research_disableAppleInfrastrucutureEnforcement) == 2) {
    v2 = 0LL;
  }
  else {
    v2 = (void *)sub_188B58C8C();
  }
  return (const __CFBoolean *)v2;
}

- (id)unvalidatedStringParameter:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_188B58B60();
  uint64_t v7 = v6;
  v8 = self;
  sub_188B4CAD8(v5, v7);
  swift_bridgeObjectRelease();

  v9 = (void *)sub_188B58B54();
  swift_bridgeObjectRelease();
  return v9;
}

- (const)unvalidatedBooleanParameter:(id)a3 error:(id *)a4
{
  return (const __CFBoolean *)sub_188B4CEF0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, sub_188B4CD00);
}

- (const)unvalidatedNumberParameter:(id)a3 error:(id *)a4
{
  return (const __CFNumber *)sub_188B4CEF0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, sub_188B4CD44);
}

+ (id)loadContentsAndReturnError:(id *)a3
{
  return (id)static SecureConfigParameters.loadContents()();
}

- (NSString)debugDescription
{
  v2 = self;
  sub_188B4D8B8();

  v3 = (void *)sub_188B58B54();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_SecureConfigParameters)init
{
  result = (_SecureConfigParameters *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end