@interface UMDPersonaManifestUser
- (UMDPersonaManifestUser)init;
@end

@implementation UMDPersonaManifestUser

- (UMDPersonaManifestUser)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UMDPersonaManifestUser;
  v2 = -[UMDPersonaManifestUser init](&v7, "init");
  if (!v2) {
    sub_1000A9C18();
  }
  v3 = v2;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  personas = v3->_personas;
  v3->_personas = (NSSet *)v4;

  v3->_asid = -1;
  return v3;
}

- (void).cxx_destruct
{
}

@end