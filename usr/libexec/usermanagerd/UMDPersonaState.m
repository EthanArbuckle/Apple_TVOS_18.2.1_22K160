@interface UMDPersonaState
- (NSMutableDictionary)asidMap;
- (NSMutableDictionary)userPersonas;
- (UMDPersonaState)init;
- (void)setAsidMap:(id)a3;
- (void)setUserPersonas:(id)a3;
@end

@implementation UMDPersonaState

- (UMDPersonaState)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UMDPersonaState;
  v2 = -[UMDPersonaState init](&v7, "init");
  if (!v2) {
    sub_1000A9AD0();
  }
  v3 = v2;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  userPersonas = v3->_userPersonas;
  v3->_userPersonas = (NSMutableDictionary *)v4;

  return v3;
}

- (NSMutableDictionary)userPersonas
{
  return self->_userPersonas;
}

- (void)setUserPersonas:(id)a3
{
}

- (NSMutableDictionary)asidMap
{
  return self->_asidMap;
}

- (void)setAsidMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end