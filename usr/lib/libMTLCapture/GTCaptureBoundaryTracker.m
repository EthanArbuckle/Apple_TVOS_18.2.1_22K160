@interface GTCaptureBoundaryTracker
@end

@implementation GTCaptureBoundaryTracker

void __GTCaptureBoundaryTracker_handleTrigger_block_invoke(uint64_t a1)
{
  unsigned int v1 = atomic_load((unsigned int *)(*(void *)(a1 + 48) + 20LL));
  unsigned int v191 = v1;
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = *(_DWORD *)(a1 + 56);
  int v4 = *(_DWORD *)(a1 + 60);
  uint64_t v195 = *(void *)(a1 + 64);
  uint64_t v201 = *(void *)(a1 + 72);
  uint64_t v202 = *(void *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 104);
  uint64_t v203 = *(void *)(a1 + 112);
  uint64_t v204 = *(void *)(a1 + 96);
  uint64_t v205 = *(void *)(a1 + 120);
  unint64_t v206 = *(void *)(a1 + 80);
  int v198 = *(unsigned __int8 *)(a1 + 128);
  *(_DWORD *)v214 = *(_DWORD *)(a1 + 129);
  *(_DWORD *)&v214[3] = *(_DWORD *)(a1 + 132);
  uint64_t v6 = *(void *)(a1 + 136);
  lock = (os_unfair_lock_s *)(v2 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 16));
  int v193 = v3;
  int v194 = v4;
  if (v3 != 7)
  {
    if (v4 != 9)
    {
      if (v4 == 3) {
        goto LABEL_7;
      }
      goto LABEL_13;
    }

void __GTCaptureBoundaryTracker_handleTrigger_block_invoke_2(uint64_t a1)
{
  if (s_logUsingOsLog)
  {
    uint64_t v2 = (os_log_s *)gt_tagged_log(0LL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "🛑 Stopping capture", buf, 2u);
    }
  }

  else
  {
    fwrite("🛑 Stopping capture\n", 0x16uLL, 1uLL, __stdoutp);
  }

  GTMTLCaptureManager_stopActiveCapture( *(void *)(*(void *)(a1 + 32) + 72LL),  *(void *)(*(void *)(a1 + 32) + 80LL));
  if (s_logUsingOsLog)
  {
    int v3 = (os_log_s *)gt_tagged_log(0LL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "🏁 Capture finished", v4, 2u);
    }
  }

  else
  {
    fwrite("🏁 Capture finished\n", 0x16uLL, 1uLL, __stdoutp);
  }

@end