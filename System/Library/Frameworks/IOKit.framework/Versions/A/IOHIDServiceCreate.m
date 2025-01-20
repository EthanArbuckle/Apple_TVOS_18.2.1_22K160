@interface IOHIDServiceCreate
@end

@implementation IOHIDServiceCreate

uint64_t ___IOHIDServiceCreate_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  mach_timebase_info(&v1);
  pthread_attr_destroy(&v2);
  pthread_mutex_lock(&stru_18C5B9520);
  while (!qword_18C5B9510)
    pthread_cond_wait(&stru_18C5B9560, &stru_18C5B9520);
  return pthread_mutex_unlock(&stru_18C5B9520);
}

void ___IOHIDServiceCreate_block_invoke_cold_1()
{
}

void ___IOHIDServiceCreate_block_invoke_cold_2()
{
}

@end