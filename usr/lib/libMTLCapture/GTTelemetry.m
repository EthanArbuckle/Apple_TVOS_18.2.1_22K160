@interface GTTelemetry
@end

@implementation GTTelemetry

void __GTTelemetry_init_block_invoke(id a1)
{
  v1 = operator new(0x110uLL);
  _OWORD *v1 = 0u;
  v1[1] = 0u;
  v1[2] = 0u;
  v1[3] = 0u;
  v1[4] = 0u;
  v1[5] = 0u;
  v1[6] = 0u;
  v1[7] = 0u;
  v1[8] = 0u;
  v1[9] = 0u;
  v1[10] = 0u;
  v1[11] = 0u;
  v2 = (char *)v1 + 200;
  uint64_t v3 = 8LL;
  v1[12] = 0u;
  do
  {
    v4 = (char *)v1 + v3;
    *(void *)v4 = 850045863LL;
    *(_OWORD *)(v4 + 8) = 0uLL;
    *(_OWORD *)(v4 + 24) = 0uLL;
    *(_OWORD *)(v4 + 40) = 0uLL;
    *((void *)v4 + 7) = 0LL;
    v3 += 64LL;
  }

  while (v4 + 64 != v2);
  *((void *)v1 + 33) = 0LL;
  *(_OWORD *)((char *)v1 + 232) = 0u;
  *(_OWORD *)((char *)v1 + 248) = 0u;
  *(_OWORD *)v2 = 0u;
  *(_OWORD *)((char *)v1 + 216) = 0u;
  telemetry = (uint64_t)v1;
}

void __GTTelemetry_trackPresent_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  [a2 presentedTime];
  GTTelemetry_trackStreamRefPresent(v2, v3);
}

void __GTTelemetry_trackCommit_block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  CFTimeInterval v3 = (std::mutex *)(telemetry + 136);
  std::mutex::lock((std::mutex *)(telemetry + 136));
  uint64_t v5 = *(void *)(telemetry + 248);
  uint64_t v4 = *(void *)(telemetry + 256);
  if (v5 != v4)
  {
    while (*(void *)v5 != *(void *)(a1 + 32))
    {
      v5 += 528LL;
      if (v5 == v4) {
        goto LABEL_6;
      }
    }

    unsigned int v6 = *(_DWORD *)(v5 + 8);
    [v17 GPUEndTime];
    double v8 = v7;
    [v17 GPUStartTime];
    *(float *)&double v9 = (v8 - v9) * 1000.0;
    CHistoryRecord::Add(v5 + 24, v6, *(float *)&v9);
    ++*(void *)(v5 + 8);
  }

@end