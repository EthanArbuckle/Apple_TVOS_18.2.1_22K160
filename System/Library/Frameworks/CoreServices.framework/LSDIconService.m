@interface LSDIconService
@end

@implementation LSDIconService

void __31___LSDIconService_XPCInterface__block_invoke()
{
  v5[6] = *MEMORY[0x1895F89C0];
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C682F70];
  v1 = (void *)XPCInterface_interface;
  XPCInterface_interface = v0;

  v2 = (void *)MEMORY[0x189604010];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = objc_opt_class();
  v5[3] = objc_opt_class();
  v5[4] = objc_opt_class();
  v5[5] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v5 count:6];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setWithArray:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  [(id)XPCInterface_interface setClass:objc_opt_class() forSelector:sel_setAlternateIconName_forIdentifier_iconsDictionary_reply_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface setClass:objc_opt_class() forSelector:sel_setAlternateIconName_forIdentifier_iconsDictionary_reply_ argumentIndex:1 ofReply:0];
  [(id)XPCInterface_interface setClasses:v4 forSelector:sel_setAlternateIconName_forIdentifier_iconsDictionary_reply_ argumentIndex:2 ofReply:0];
  [(id)XPCInterface_interface setClass:objc_opt_class() forSelector:sel_setAlternateIconName_forIdentifier_iconsDictionary_reply_ argumentIndex:1 ofReply:1];
  [(id)XPCInterface_interface setClass:objc_opt_class() forSelector:sel_getAlternateIconNameForIdentifier_reply_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface setClass:objc_opt_class() forSelector:sel_getAlternateIconNameForIdentifier_reply_ argumentIndex:1 ofReply:1];
}

@end