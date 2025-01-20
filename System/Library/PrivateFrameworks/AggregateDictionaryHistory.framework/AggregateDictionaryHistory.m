id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}