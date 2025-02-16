@interface RBSWrappedLSInfo
+ (id)infoWithBundleID:(id)a3 personaString:(id)a4 persistentJobLabel:(id)a5 platform:(int)a6 bundleInode:(unint64_t)a7 execInode:(unint64_t)a8;
- (NSString)bundleID;
- (NSString)persistentJobLabel;
- (NSString)personaString;
- (id)_initWithBundleID:(id)a3 personaString:(id)a4 persistentJobLabel:(id)a5 platform:(int)a6 bundleInode:(unint64_t)a7 execInode:(unint64_t)a8;
- (int)platform;
- (unint64_t)bundleInode;
- (unint64_t)execInode;
@end

@implementation RBSWrappedLSInfo

- (id)_initWithBundleID:(id)a3 personaString:(id)a4 persistentJobLabel:(id)a5 platform:(int)a6 bundleInode:(unint64_t)a7 execInode:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___RBSWrappedLSInfo;
  v18 = -[RBSWrappedLSInfo init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_bundleID, a3);
    objc_storeStrong((id *)&v19->_personaString, a4);
    objc_storeStrong((id *)&v19->_persistentJobLabel, a5);
    v19->_platform = a6;
    v19->_bundleInode = a7;
    v19->_execInode = a8;
    v20 = v19;
  }

  return v19;
}

+ (id)infoWithBundleID:(id)a3 personaString:(id)a4 persistentJobLabel:(id)a5 platform:(int)a6 bundleInode:(unint64_t)a7 execInode:(unint64_t)a8
{
  uint64_t v10 = *(void *)&a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = -[RBSWrappedLSInfo _initWithBundleID:personaString:persistentJobLabel:platform:bundleInode:execInode:]( objc_alloc(&OBJC_CLASS___RBSWrappedLSInfo),  "_initWithBundleID:personaString:persistentJobLabel:platform:bundleInode:execInode:",  v15,  v14,  v13,  v10,  a7,  a8);

  return v16;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)personaString
{
  return self->_personaString;
}

- (NSString)persistentJobLabel
{
  return self->_persistentJobLabel;
}

- (int)platform
{
  return self->_platform;
}

- (unint64_t)bundleInode
{
  return self->_bundleInode;
}

- (unint64_t)execInode
{
  return self->_execInode;
}

- (void).cxx_destruct
{
}

@end