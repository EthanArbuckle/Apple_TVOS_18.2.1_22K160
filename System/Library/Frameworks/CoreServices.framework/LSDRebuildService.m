@interface LSDRebuildService
@end

@implementation LSDRebuildService

void __34___LSDRebuildService_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C683AC0];
  v3 = (void *)+[_LSDRebuildService XPCInterface]::result;
  +[_LSDRebuildService XPCInterface]::result = v2;

  v4 = (void *)+[_LSDRebuildService XPCInterface]::result;
  if (+[_LSDRebuildService XPCInterface]::result
    || ([MEMORY[0x1896077D8] currentHandler],
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        [v10 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"LSDRebuildService.mm" lineNumber:44 description:@"Failed to create XPC interface object."],  v10,  (v4 = (void *)+[_LSDRebuildService XPCInterface]::result) != 0))
  {
    XNSGetPropertyListClasses();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setClasses:v5 forSelector:sel_performRebuildRegistration_personaUniqueStrings_reply_ argumentIndex:0 ofReply:0];

    v6 = (void *)+[_LSDRebuildService XPCInterface]::result;
    v7 = (void *)MEMORY[0x189604010];
    uint64_t v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setClasses:v9 forSelector:sel_performRebuildRegistration_personaUniqueStrings_reply_ argumentIndex:1 ofReply:0];

    [(id)+[_LSDRebuildService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performRebuildRegistration_personaUniqueStrings_reply_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDRebuildService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_noteMigratorRunningWithReply_ argumentIndex:0 ofReply:1];
  }

@end