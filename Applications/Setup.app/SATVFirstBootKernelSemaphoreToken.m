@interface SATVFirstBootKernelSemaphoreToken
+ (id)token;
- (BOOL)isTokenSet;
- (SATVFirstBootKernelSemaphoreToken)init;
- (id)description;
- (void)_revertToFirstBoot;
- (void)unsetToken;
@end

@implementation SATVFirstBootKernelSemaphoreToken

+ (id)token
{
  return objc_alloc_init(&OBJC_CLASS___SATVFirstBootKernelSemaphoreToken);
}

- (SATVFirstBootKernelSemaphoreToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVFirstBootKernelSemaphoreToken;
  v2 = -[SATVFirstBootKernelSemaphoreToken init](&v6, "init");
  if (v2)
  {
    v3 = sem_open("tvsetup.firstboot_check", 0);
    if (v3 == (sem_t *)-1LL)
    {
      char v4 = 0;
    }

    else
    {
      sem_close(v3);
      char v4 = 1;
    }

    v2->_semaphoreExists = v4;
  }

  return v2;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 =  objc_msgSend( v3,  "appendBool:withName:",  -[SATVFirstBootKernelSemaphoreToken isTokenSet](self, "isTokenSet"),  @"isTokenSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v5;
}

- (BOOL)isTokenSet
{
  return !self->_semaphoreExists;
}

- (void)unsetToken
{
  if (!self->_semaphoreExists)
  {
    v3 = sem_open("tvsetup.firstboot_check", 512, 256LL, 0LL);
    if (v3 == (sem_t *)-1LL)
    {
      id v4 = sub_10002AF94();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100077364();
      }
    }

    else
    {
      self->_semaphoreExists = 1;
      sem_close(v3);
    }
  }

- (void)_revertToFirstBoot
{
  if (self->_semaphoreExists)
  {
    if (sem_unlink("tvsetup.firstboot_check"))
    {
      id v3 = sub_10002AF94();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_1000773E0();
      }
    }

    else
    {
      self->_semaphoreExists = 0;
    }
  }

@end