@interface CFPDContainerSource
- (CFPDContainerSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 container:(__CFString *)a5 byHost:(BOOL)a6 managed:(BOOL)a7 shmemIndex:(signed __int16)a8 daemon:(id)a9;
- (__CFString)container;
- (void)dealloc;
@end

@implementation CFPDContainerSource

- (CFPDContainerSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 container:(__CFString *)a5 byHost:(BOOL)a6 managed:(BOOL)a7 shmemIndex:(signed __int16)a8 daemon:(id)a9
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CFPDContainerSource;
  v10 = -[CFPDSource initWithDomain:userName:byHost:managed:shmemIndex:daemon:]( &v13,  sel_initWithDomain_userName_byHost_managed_shmemIndex_daemon_,  a3,  a4,  a6,  a7,  a8,  a9);
  if (v10)
  {
    if (a5) {
      v11 = (__CFString *)CFRetain(a5);
    }
    else {
      v11 = 0LL;
    }
    v10->_containerPath = v11;
  }

  return v10;
}

- (__CFString)container
{
  return self->_containerPath;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  containerPath = self->_containerPath;
  if (containerPath) {
    CFRelease(containerPath);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CFPDContainerSource;
  -[CFPDSource dealloc](&v4, sel_dealloc);
}

@end