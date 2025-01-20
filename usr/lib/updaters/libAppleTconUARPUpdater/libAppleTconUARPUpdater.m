uint64_t AppleTconUARPUpdaterCreate(uint64_t a1, uint64_t a2, uint64_t a3, CFErrorRef *a4)
{
  if (a4) {
    *a4 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F58], 102LL, 0LL);
  }
  return 0LL;
}

uint64_t AppleTconUARPUpdaterExecCommand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, CFErrorRef *a5)
{
  if (a5) {
    *a5 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F58], 102LL, 0LL);
  }
  return 0LL;
}

uint64_t AppleTconUARPUpdaterIsDone()
{
  return 1LL;
}