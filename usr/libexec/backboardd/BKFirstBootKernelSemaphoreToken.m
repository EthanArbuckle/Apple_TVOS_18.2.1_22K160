@interface BKFirstBootKernelSemaphoreToken
+ (id)token;
- (BKFirstBootKernelSemaphoreToken)init;
- (BOOL)isTokenSet;
- (NSString)description;
- (void)_revertToFirstBoot;
- (void)unsetToken;
@end

@implementation BKFirstBootKernelSemaphoreToken

- (BKFirstBootKernelSemaphoreToken)init
{
  v6.receiver = self;
  v6.super_class = [BKFirstBootKernelSemaphoreToken class];
  BKFirstBootKernelSemaphoreToken *v2 = [[BKFirstBootKernelSemaphoreToken alloc] init];
  if (v2)
  {
    v3 = sem_open("backboardd.firstboot_check", 0);
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

- (NSString)description
{
  BSDescriptionBuilder *v3 = [BSDescriptionBuilder builderWithObject:self];
  [v3 appendBool:[BKFirstBootKernelSemaphoreToken isTokenSet] withName:@"isTokenSet"];
  v5 = (void *)[v3 build];

  return (NSString *)v5;
}

- (BOOL)isTokenSet
{
  return !self->_semaphoreExists;
}

- (void)unsetToken
{
  if (!self->_semaphoreExists)
  {
    v3 = sem_open("backboardd.firstboot_check", 512, 256LL, 0LL);
    if (v3 == (sem_t *)-1LL)
    {
      id v4 = sub_10003F0B0();
      v5 = v4;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = *__error();
        *(_DWORD *)buf = 136446466;
        v8 = "backboardd.firstboot_check";
        __int16 v9 = 1024;
        int v10 = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Failed to create semaphore %{public}s for first boot token. Error = %d",  buf,  0x12u);
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
    if (sem_unlink("backboardd.firstboot_check"))
    {
      id v3 = sub_10003F0B0();
      id v4 = v3;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = *__error();
        int v6 = 136446466;
        v7 = "backboardd.firstboot_check";
        __int16 v8 = 1024;
        int v9 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Failed to delete semaphore %{public}s for first boot token. Error = %d",  (uint8_t *)&v6,  0x12u);
      }
    }

    else
    {
      self->_semaphoreExists = 0;
    }
  }

+ (id)token
{
  BKFirstBootKernelSemaphoreToken *return = [[BKFirstBootKernelSemaphoreToken alloc] init];
}

@end