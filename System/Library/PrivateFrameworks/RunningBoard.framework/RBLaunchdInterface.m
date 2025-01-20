@interface RBLaunchdInterface
+ (id)interface;
- (id)copyJobWithLabel:(id)a3 domain:(id)a4;
- (id)copyJobWithPid:(int)a3;
- (id)copyJobsManagedBy:(id)a3 error:(id *)a4;
- (id)currentDomain;
- (id)domainForPid:(int)a3;
- (id)domainForUser:(unsigned int)a3;
- (id)forJob:(id)a3 createInstance:(unsigned __int8)a4[16] properties:(id)a5 error:(id *)a6;
- (id)instancePropertiesFromOverlay:(id)a3;
- (id)jobWithPlist:(id)a3;
- (id)jobWithPlist:(id)a3 domain:(id)a4;
- (id)propertiesForJob:(id)a3 error:(id *)a4;
- (id)propertiesForPid:(int)a3 error:(id *)a4;
- (id)submitExtension:(id)a3 overlay:(id)a4 domain:(id)a5 error:(id *)a6;
@end

@implementation RBLaunchdInterface

+ (id)interface
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__RBLaunchdInterface_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  return (id)interface_singleton;
}

void __31__RBLaunchdInterface_interface__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___RBLaunchdInterface;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_alloc), "init");
  v2 = (void *)interface_singleton;
  interface_singleton = v1;
}

- (id)domainForPid:(int)a3
{
  return (id)[MEMORY[0x18960CE88] domainForPid:*(void *)&a3];
}

- (id)domainForUser:(unsigned int)a3
{
  return (id)[MEMORY[0x18960CE88] domainForUser:*(void *)&a3];
}

- (id)currentDomain
{
  return (id)[MEMORY[0x18960CE88] currentDomain];
}

- (id)submitExtension:(id)a3 overlay:(id)a4 domain:(id)a5 error:(id *)a6
{
  return (id)[MEMORY[0x18960CE90] submitExtension:a3 overlay:a4 domain:a5 error:a6];
}

- (id)jobWithPlist:(id)a3
{
  objc_super v3 = (objc_class *)MEMORY[0x18960CE90];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithPlist:v4];

  return v5;
}

- (id)jobWithPlist:(id)a3 domain:(id)a4
{
  v5 = (objc_class *)MEMORY[0x18960CE90];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithPlist:v7 domain:v6];

  return v8;
}

- (id)copyJobWithLabel:(id)a3 domain:(id)a4
{
  return (id)[MEMORY[0x18960CE90] copyJobWithLabel:a3 domain:a4];
}

- (id)copyJobWithPid:(int)a3
{
  return (id)[MEMORY[0x18960CE90] copyJobWithPid:*(void *)&a3];
}

- (id)forJob:(id)a3 createInstance:(unsigned __int8)a4[16] properties:(id)a5 error:(id *)a6
{
  return (id)[a3 createInstance:a4 properties:a5 error:a6];
}

- (id)copyJobsManagedBy:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x18960CE90] copyJobsManagedBy:a3 error:a4];
}

- (id)propertiesForPid:(int)a3 error:(id *)a4
{
  return (id)[MEMORY[0x18960CE80] propertiesForPid:*(void *)&a3 error:a4];
}

- (id)propertiesForJob:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x18960CE80] propertiesForJob:a3 error:a4];
}

- (id)instancePropertiesFromOverlay:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_opt_new();
  [v3 objectForKeyedSubscript:@"XPCService"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"_SandboxProfile"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setSandboxProfile:v6];

  [v3 objectForKeyedSubscript:@"XPCService"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 objectForKeyedSubscript:@"EnvironmentVariables"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setEnvironmentVariables:v8];

  return v4;
}

@end