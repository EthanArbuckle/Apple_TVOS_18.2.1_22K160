@interface CLFallMslSink
- (id).cxx_construct;
- (id)initInUniverse:(id)a3;
- (void)_insertSample:(void *)a3;
- (void)cleanUp;
- (void)cleanUpIncludingDerivedFeatures:(BOOL)a3;
- (void)dealloc;
- (void)logAccel100:(id)a3 startTime:(double)a4 timestamp:(unint64_t)a5;
- (void)logAccel800:(const ImpactData *)a3;
- (void)logDeviceMotion:(const ImpactData *)a3;
- (void)logFallState:(const ImpactEvent *)a3;
- (void)logFallStats:(const ImpactEvent *)a3;
- (void)logFilteredPressure:(const FilteredPressure *)a3;
- (void)logGyro100:(id)a3 startTime:(double)a4 timestamp:(unint64_t)a5;
- (void)logGyro200:(const ImpactData *)a3;
- (void)logHeartRate:(const CLCatherineData *)a3;
- (void)logHgal:(const ImpactData *)a3;
- (void)logOdometer:(const OdometerEntry *)a3;
- (void)logPressure:(const Pressure *)a3;
- (void)logSuppressionFeartures:(const FalsePositiveSuppressionFeatures *)a3;
- (void)logWristState:(const WristState *)a3;
- (void)sendData:(id)a3 completion:(id)a4;
@end

@implementation CLFallMslSink

- (void)_insertSample:(void *)a3
{
  uint64_t v5 = *((void *)a3 + 125);
  if ((*(_BYTE *)(v5 + 128) & 1) == 0)
  {
    float v6 = *((double *)a3 + 77);
    p_fOrderedSample = &self->fOrderedSample;
    while (p_fOrderedSample != self->fOrderedSample.__end_.__next_)
    {
      v8 = (CLFallMslSink **)p_fOrderedSample;
      p_fOrderedSample = (list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *)p_fOrderedSample->__end_.__prev_;
      if (*(double *)(p_fOrderedSample->__size_alloc_.__value_ + 616) <= v6)
      {
        v9 = (CLFallMslSink *)operator new(0x18uLL);
        v9->fOrderedSample.__end_.__next_ = a3;
        p_fOrderedSample->__end_.__next_ = v9;
        v9->super.isa = (Class)p_fOrderedSample;
        goto LABEL_20;
      }
    }

    if (qword_1019345D0 != -1) {
      dispatch_once(&qword_1019345D0, &stru_101864CD0);
    }
    v14 = (os_log_s *)qword_1019345D8;
    if (!os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_19;
    }
    int v17 = 68289282;
    int v18 = 0;
    __int16 v19 = 2082;
    v20 = "";
    __int16 v21 = 2050;
    unint64_t v22 = (unint64_t)v6;
    v15 = "{msg%{public}.0s:No previous sample matching ios timestamp, will insert first in queue, iosTimestamp"
          ":%{public}llu}";
    goto LABEL_18;
  }

  unint64_t v10 = *(void *)(v5 + 24);
  v8 = (CLFallMslSink **)&self->fOrderedSample;
  next = (CLFallMslSink *)self->fOrderedSample.__end_.__next_;
  if (&self->fOrderedSample == (list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *)next)
  {
LABEL_10:
    if (qword_1019345D0 != -1) {
      dispatch_once(&qword_1019345D0, &stru_101864CD0);
    }
    v14 = (os_log_s *)qword_1019345D8;
    if (!os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_19;
    }
    int v17 = 68289282;
    int v18 = 0;
    __int16 v19 = 2082;
    v20 = "";
    __int16 v21 = 2050;
    unint64_t v22 = v10;
    v15 = "{msg%{public}.0s:No previous sample matching aop timestamp, will insert first in queue, aopTimestamp"
          ":%{public}llu}";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v17, 0x1Cu);
LABEL_19:
    v8 = (CLFallMslSink **)self->fOrderedSample.__end_.__next_;
    v9 = (CLFallMslSink *)operator new(0x18uLL);
    v9->fOrderedSample.__end_.__next_ = a3;
    v16 = *v8;
    v16->fOrderedSample.__end_.__prev_ = v9;
    v9->super.isa = (Class)v16;
    goto LABEL_20;
  }

  while (1)
  {
    v12 = *v8;
    uint64_t v13 = *((void *)(*v8)->fOrderedSample.__end_.__next_ + 125);
    if ((*(_BYTE *)(v13 + 128) & 1) != 0 && v10 >= *(void *)(v13 + 24)) {
      break;
    }
    v8 = (CLFallMslSink **)*v8;
    if (v12 == next) {
      goto LABEL_10;
    }
  }

  v9 = (CLFallMslSink *)operator new(0x18uLL);
  v9->fOrderedSample.__end_.__next_ = a3;
  v12->fOrderedSample.__end_.__prev_ = v9;
  v9->super.isa = (Class)v12;
LABEL_20:
  *v8 = v9;
  v9->fOrderedSample.__end_.__prev_ = v8;
  ++self->fOrderedSample.__size_alloc_.__value_;
}

- (id)initInUniverse:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLFallMslSink;
  id result = -[CLFallMslSink init](&v4, "init", a3);
  if (result) {
    *((_BYTE *)result + 223) = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLFallMslSink;
  -[CLFallMslSink dealloc](&v3, "dealloc");
}

- (void)logAccel100:(id)a3 startTime:(double)a4 timestamp:(unint64_t)a5
{
  if ([a3 length])
  {
    LODWORD(v9) = 0;
    do
    {
      sub_1006DC1E8(v24, &v23, (uint64_t)v21);
      unint64_t v9 = (v23 + v9);
      unint64_t v10 = v22;
      double v11 = a4 + (double)(a5 - v22) / -1000000.0;
      v12 = (double *)operator new(0xE28uLL);
      uint64_t v13 = sub_101125260(v12);
      sub_10113918C(v13);
      *((_BYTE *)v12 + 3616) |= 1u;
      v12[77] = v11;
      uint64_t v14 = *((void *)v12 + 125);
      *(_BYTE *)(v14 + 128) |= 1u;
      *(void *)(v14 + 24) = v10;
      sub_101082C6C(*((void **)v12 + 125));
      uint64_t v15 = *(void *)(*((void *)v12 + 125) + 8LL);
      double v16 = (double)v22;
      *(_BYTE *)(v15 + 32) |= 1u;
      *(double *)(v15 + 8) = v16;
      uint64_t v17 = *(void *)(*((void *)v12 + 125) + 8LL);
      int v18 = v21[1];
      *(_DWORD *)(v17 + 20) = v21[0];
      *(_BYTE *)(v17 + 32) |= 4u;
      uint64_t v19 = *(void *)(*((void *)v12 + 125) + 8LL);
      *(_BYTE *)(v19 + 32) |= 8u;
      *(_DWORD *)(v19 + 24) = v18;
      uint64_t v20 = *(void *)(*((void *)v12 + 125) + 8LL);
      LODWORD(v16) = v21[2];
      *(_BYTE *)(v20 + 32) |= 0x10u;
      *(_DWORD *)(v20 + 28) = LODWORD(v16);
      -[CLFallMslSink _insertSample:](self, "_insertSample:", v12);
    }

    while ((unint64_t)[a3 length] > v9);
  }

- (void)logAccel800:(const ImpactData *)a3
{
  uint64_t v5 = (double *)operator new(0xE28uLL);
  float v6 = sub_101125260(v5);
  sub_10113918C(v6);
  double var0 = a3->var0;
  *((_BYTE *)v5 + 3616) |= 1u;
  v5[77] = var0;
  uint64_t v8 = *((void *)v5 + 125);
  uint64_t v9 = *(void *)((char *)&a3->var3.var0[2] + 1);
  *(_BYTE *)(v8 + 128) |= 1u;
  *(void *)(v8 + 24) = v9;
  sub_101082CC0(*((void **)v5 + 125));
  uint64_t v10 = *(void *)(*((void *)v5 + 125) + 16LL);
  double v11 = (double)*(unint64_t *)((char *)&a3->var3.var0[2] + 1);
  *(_BYTE *)(v10 + 32) |= 1u;
  *(double *)(v10 + 8) = v11;
  uint64_t v12 = *(void *)(*((void *)v5 + 125) + 16LL);
  LODWORD(v11) = *(_DWORD *)(&a3->var2 + 1);
  *(_BYTE *)(v12 + 32) |= 4u;
  *(_DWORD *)(v12 + 20) = LODWORD(v11);
  uint64_t v13 = *(void *)(*((void *)v5 + 125) + 16LL);
  LODWORD(v11) = *(_DWORD *)(&a3->var2 + 5);
  *(_BYTE *)(v13 + 32) |= 8u;
  *(_DWORD *)(v13 + 24) = LODWORD(v11);
  uint64_t v14 = *(void *)(*((void *)v5 + 125) + 16LL);
  *(float *)&double v11 = *(float *)((char *)a3->var3.var0 + 1);
  *(_BYTE *)(v14 + 32) |= 0x10u;
  *(_DWORD *)(v14 + 28) = LODWORD(v11);
  -[CLFallMslSink _insertSample:](self, "_insertSample:", v5);
}

- (void)logHgal:(const ImpactData *)a3
{
  uint64_t v5 = (double *)operator new(0xE28uLL);
  float v6 = sub_101125260(v5);
  sub_10113A494(v6);
  double var0 = a3->var0;
  *((_BYTE *)v5 + 3616) |= 1u;
  v5[77] = var0;
  sub_101082CC0(*((void **)v5 + 396));
  uint64_t v8 = *((void *)v5 + 396);
  uint64_t v9 = *(void *)((char *)&a3->var3.var0[2] + 1);
  *(_BYTE *)(v8 + 24) |= 1u;
  *(void *)(v8 + 8) = v9;
  uint64_t v10 = *(void *)(*((void *)v5 + 396) + 16LL);
  double v11 = (double)*(unint64_t *)((char *)&a3->var3.var0[2] + 1);
  *(_BYTE *)(v10 + 32) |= 1u;
  *(double *)(v10 + 8) = v11;
  uint64_t v12 = *(void *)(*((void *)v5 + 396) + 16LL);
  LODWORD(v11) = *(_DWORD *)(&a3->var2 + 1);
  *(_BYTE *)(v12 + 32) |= 4u;
  *(_DWORD *)(v12 + 20) = LODWORD(v11);
  uint64_t v13 = *(void *)(*((void *)v5 + 396) + 16LL);
  LODWORD(v11) = *(_DWORD *)(&a3->var2 + 5);
  *(_BYTE *)(v13 + 32) |= 8u;
  *(_DWORD *)(v13 + 24) = LODWORD(v11);
  uint64_t v14 = *(void *)(*((void *)v5 + 396) + 16LL);
  *(float *)&double v11 = *(float *)((char *)a3->var3.var0 + 1);
  *(_BYTE *)(v14 + 32) |= 0x10u;
  *(_DWORD *)(v14 + 28) = LODWORD(v11);
  -[CLFallMslSink _insertSample:](self, "_insertSample:", v5);
}

- (void)logGyro100:(id)a3 startTime:(double)a4 timestamp:(unint64_t)a5
{
  id v9 = objc_msgSend(a3, "bytes", sub_1006DC4A4((uint64_t)v25, 0));
  if (objc_msgSend(a3, "length", sub_1006DC4A4((uint64_t)v25, (uint64_t)v9)))
  {
    LODWORD(v10) = 0;
    do
    {
      sub_1006DC35C(v25, &v24, &v22);
      unint64_t v10 = (v24 + v10);
      unint64_t v11 = v23;
      double v12 = a4 + (double)(a5 - v23) / -1000000.0;
      uint64_t v13 = (double *)operator new(0xE28uLL);
      uint64_t v14 = sub_101125260(v13);
      sub_10113918C(v14);
      *((_BYTE *)v13 + 3616) |= 1u;
      v13[77] = v12;
      uint64_t v15 = *((void *)v13 + 125);
      *(_BYTE *)(v15 + 128) |= 1u;
      *(void *)(v15 + 24) = v11;
      sub_101082D14(*((_DWORD **)v13 + 125));
      uint64_t v16 = *(void *)(*((void *)v13 + 125) + 64LL);
      double v17 = (double)v23;
      *(_WORD *)(v16 + 44) |= 1u;
      *(double *)(v16 + 8) = v17;
      uint64_t v18 = *(void *)(*((void *)v13 + 125) + 64LL);
      __int32 v19 = v22.i32[1];
      *(_DWORD *)(v18 + 28) = v22.i32[0];
      *(_WORD *)(v18 + 44) |= 0x10u;
      uint64_t v20 = *(void *)(*((void *)v13 + 125) + 64LL);
      *(_WORD *)(v20 + 44) |= 0x20u;
      *(_DWORD *)(v20 + 32) = v19;
      uint64_t v21 = *(void *)(*((void *)v13 + 125) + 64LL);
      LODWORD(v17) = v22.i32[2];
      *(_WORD *)(v21 + 44) |= 0x40u;
      *(_DWORD *)(v21 + 36) = LODWORD(v17);
      -[CLFallMslSink _insertSample:](self, "_insertSample:", v13);
    }

    while ((unint64_t)[a3 length] > v10);
  }

- (void)logGyro200:(const ImpactData *)a3
{
  uint64_t v5 = (double *)operator new(0xE28uLL);
  float v6 = sub_101125260(v5);
  sub_10113918C(v6);
  double var0 = a3->var0;
  *((_BYTE *)v5 + 3616) |= 1u;
  v5[77] = var0;
  uint64_t v8 = *((void *)v5 + 125);
  uint64_t v9 = *(void *)((char *)&a3->var3.var0[2] + 1);
  *(_BYTE *)(v8 + 128) |= 1u;
  *(void *)(v8 + 24) = v9;
  sub_101082D54(*((_DWORD **)v5 + 125));
  uint64_t v10 = *(void *)(*((void *)v5 + 125) + 72LL);
  double v11 = (double)*(unint64_t *)((char *)&a3->var3.var0[2] + 1);
  *(_WORD *)(v10 + 44) |= 1u;
  *(double *)(v10 + 8) = v11;
  uint64_t v12 = *(void *)(*((void *)v5 + 125) + 72LL);
  LODWORD(v11) = *(_DWORD *)(&a3->var2 + 1);
  *(_WORD *)(v12 + 44) |= 0x10u;
  *(_DWORD *)(v12 + 28) = LODWORD(v11);
  uint64_t v13 = *(void *)(*((void *)v5 + 125) + 72LL);
  LODWORD(v11) = *(_DWORD *)(&a3->var2 + 5);
  *(_WORD *)(v13 + 44) |= 0x20u;
  *(_DWORD *)(v13 + 32) = LODWORD(v11);
  uint64_t v14 = *(void *)(*((void *)v5 + 125) + 72LL);
  *(float *)&double v11 = *(float *)((char *)a3->var3.var0 + 1);
  *(_WORD *)(v14 + 44) |= 0x40u;
  *(_DWORD *)(v14 + 36) = LODWORD(v11);
  -[CLFallMslSink _insertSample:](self, "_insertSample:", v5);
}

- (void)logDeviceMotion:(const ImpactData *)a3
{
  uint64_t v5 = (double *)operator new(0xE28uLL);
  float v6 = sub_101125260(v5);
  sub_10113918C(v6);
  double var0 = a3->var0;
  *((_BYTE *)v5 + 3616) |= 1u;
  v5[77] = var0;
  uint64_t v8 = *((void *)v5 + 125);
  uint64_t v9 = *(void *)((char *)&a3->var3.var0[2] + 1);
  *(_BYTE *)(v8 + 128) |= 1u;
  *(void *)(v8 + 24) = v9;
  sub_101082D94(*((void **)v5 + 125));
  uint64_t v10 = *(void *)(*((void *)v5 + 125) + 32LL);
  double v11 = (double)*(unint64_t *)((char *)&a3->var3.var0[2] + 1);
  *(_DWORD *)(v10 + 124) |= 0x10u;
  *(double *)(v10 + 40) = v11;
  uint64_t v12 = *(void *)(*((void *)v5 + 125) + 32LL);
  double v13 = *(float *)(&a3->var2 + 1);
  *(_DWORD *)(v12 + 124) |= 2u;
  *(double *)(v12 + 16) = v13;
  uint64_t v14 = *(void *)(*((void *)v5 + 125) + 32LL);
  double v15 = *(float *)(&a3->var2 + 5);
  *(_DWORD *)(v14 + 124) |= 4u;
  *(double *)(v14 + 24) = v15;
  uint64_t v16 = *(void *)(*((void *)v5 + 125) + 32LL);
  double v17 = *(float *)((char *)a3->var3.var0 + 1);
  *(_DWORD *)(v16 + 124) |= 8u;
  *(double *)(v16 + 32) = v17;
  uint64_t v18 = *(void *)(*((void *)v5 + 125) + 32LL);
  double v19 = *(float *)((char *)&a3->var3.var0[1] + 1);
  *(_DWORD *)(v18 + 124) |= 1u;
  *(double *)(v18 + 8) = v19;
  -[CLFallMslSink _insertSample:](self, "_insertSample:", v5);
}

- (void)logFilteredPressure:(const FilteredPressure *)a3
{
  uint64_t v5 = operator new(0xE28uLL);
  float v6 = sub_101125260(v5);
  sub_10113918C(v6);
  uint64_t v7 = *((void *)a3 + 4);
  v5[3616] |= 1u;
  *((void *)v5 + 77) = v7;
  uint64_t v8 = *((void *)v5 + 125);
  uint64_t v9 = *(void *)((char *)a3 + 12);
  *(_BYTE *)(v8 + 128) |= 1u;
  *(void *)(v8 + 24) = v9;
  sub_101082DE8(*((void **)v5 + 125));
  uint64_t v10 = *(void *)(*((void *)v5 + 125) + 104LL);
  double v11 = (double)*(unint64_t *)((char *)a3 + 12);
  *(_BYTE *)(v10 + 24) |= 1u;
  *(double *)(v10 + 8) = v11;
  uint64_t v12 = *(void *)(*((void *)v5 + 125) + 104LL);
  LODWORD(v11) = *((_DWORD *)a3 + 2);
  *(_BYTE *)(v12 + 24) |= 4u;
  *(_DWORD *)(v12 + 20) = LODWORD(v11);
  uint64_t v13 = *(void *)(*((void *)v5 + 125) + 104LL);
  LODWORD(v11) = *((_DWORD *)a3 + 1);
  *(_BYTE *)(v13 + 24) |= 2u;
  *(_DWORD *)(v13 + 16) = LODWORD(v11);
  -[CLFallMslSink _insertSample:](self, "_insertSample:", v5);
}

- (void)logPressure:(const Pressure *)a3
{
  uint64_t v5 = operator new(0xE28uLL);
  float v6 = sub_101125260(v5);
  sub_10113918C(v6);
  uint64_t v7 = *((void *)a3 + 4);
  v5[3616] |= 1u;
  *((void *)v5 + 77) = v7;
  uint64_t v8 = *((void *)v5 + 125);
  uint64_t v9 = *(void *)((char *)a3 + 12);
  *(_BYTE *)(v8 + 128) |= 1u;
  *(void *)(v8 + 24) = v9;
  sub_101082DE8(*((void **)v5 + 125));
  uint64_t v10 = *(void *)(*((void *)v5 + 125) + 104LL);
  double v11 = (double)*(unint64_t *)((char *)a3 + 12);
  *(_BYTE *)(v10 + 24) |= 1u;
  *(double *)(v10 + 8) = v11;
  uint64_t v12 = *(void *)(*((void *)v5 + 125) + 104LL);
  LODWORD(v11) = *((_DWORD *)a3 + 2);
  *(_BYTE *)(v12 + 24) |= 4u;
  *(_DWORD *)(v12 + 20) = LODWORD(v11);
  uint64_t v13 = *(void *)(*((void *)v5 + 125) + 104LL);
  LODWORD(v11) = *((_DWORD *)a3 + 1);
  *(_BYTE *)(v13 + 24) |= 2u;
  *(_DWORD *)(v13 + 16) = LODWORD(v11);
  -[CLFallMslSink _insertSample:](self, "_insertSample:", v5);
}

- (void)logHeartRate:(const CLCatherineData *)a3
{
  uint64_t v5 = (double *)operator new(0xE28uLL);
  float v6 = sub_101125260(v5);
  sub_10113918C(v6);
  double var6 = a3->var6;
  *((_BYTE *)v5 + 3616) |= 1u;
  v5[77] = var6;
  sub_101082E3C(*((void **)v5 + 125));
  sub_10114FA2C(*(void **)(*((void *)v5 + 125) + 80LL));
  uint64_t v8 = *(void *)(*(void *)(*((void *)v5 + 125) + 80LL) + 8LL);
  int var0 = a3->var0;
  *(_WORD *)(v8 + 68) |= 0x40u;
  *(_DWORD *)(v8 + 52) = var0;
  uint64_t v10 = *(void *)(*(void *)(*((void *)v5 + 125) + 80LL) + 8LL);
  int var1 = a3->var1;
  *(_WORD *)(v10 + 68) |= 0x80u;
  *(_DWORD *)(v10 + 56) = var1;
  uint64_t v12 = *(void *)(*(void *)(*((void *)v5 + 125) + 80LL) + 8LL);
  double var2 = a3->var2;
  *(_WORD *)(v12 + 68) |= 2u;
  *(double *)(v12 + 16) = var2;
  uint64_t v14 = *(void *)(*(void *)(*((void *)v5 + 125) + 80LL) + 8LL);
  double var3 = a3->var3;
  *(_WORD *)(v14 + 68) |= 1u;
  *(double *)(v14 + 8) = var3;
  uint64_t v16 = *(void *)(*(void *)(*((void *)v5 + 125) + 80LL) + 8LL);
  LOBYTE(var1) = a3->var4;
  *(_WORD *)(v16 + 68) |= 0x200u;
  *(_BYTE *)(v16 + 64) = var1;
  uint64_t v17 = *(void *)(*(void *)(*((void *)v5 + 125) + 80LL) + 8LL);
  double var5 = a3->var5;
  *(_WORD *)(v17 + 68) |= 0x10u;
  *(double *)(v17 + 40) = var5;
  uint64_t v19 = *(void *)(*(void *)(*((void *)v5 + 125) + 80LL) + 8LL);
  double v20 = a3->var6;
  *(_WORD *)(v19 + 68) |= 8u;
  *(double *)(v19 + 32) = v20;
  uint64_t v21 = *(void *)(*(void *)(*((void *)v5 + 125) + 80LL) + 8LL);
  int var8 = a3->var8;
  *(_WORD *)(v21 + 68) |= 0x20u;
  *(_DWORD *)(v21 + 48) = var8;
  -[CLFallMslSink _insertSample:](self, "_insertSample:", v5);
}

- (void)logWristState:(const WristState *)a3
{
  uint64_t v5 = operator new(0xE28uLL);
  float v6 = sub_101125260(v5);
  sub_10113918C(v6);
  uint64_t v7 = *(void *)a3;
  v5[3616] |= 1u;
  *((void *)v5 + 77) = v7;
  sub_101082E90(*((void **)v5 + 125));
  uint64_t v8 = *(void *)(*((void *)v5 + 125) + 120LL);
  int v9 = *((_DWORD *)a3 + 4);
  *(_BYTE *)(v8 + 40) |= 4u;
  *(_DWORD *)(v8 + 24) = v9;
  uint64_t v10 = *(void *)(*((void *)v5 + 125) + 120LL);
  int v11 = *((_DWORD *)a3 + 5);
  *(_BYTE *)(v10 + 40) |= 0x10u;
  *(_DWORD *)(v10 + 32) = v11;
  uint64_t v12 = *(void *)(*((void *)v5 + 125) + 120LL);
  int v13 = *((_DWORD *)a3 + 6);
  *(_BYTE *)(v12 + 40) |= 8u;
  *(_DWORD *)(v12 + 28) = v13;
  uint64_t v14 = *(void *)(*((void *)v5 + 125) + 120LL);
  LOBYTE(v13) = *((_BYTE *)a3 + 40);
  *(_BYTE *)(v14 + 40) |= 0x40u;
  *(_BYTE *)(v14 + 37) = v13;
  uint64_t v15 = *(void *)(*((void *)v5 + 125) + 120LL);
  LOBYTE(v13) = *((_BYTE *)a3 + 41);
  *(_BYTE *)(v15 + 40) |= 0x20u;
  *(_BYTE *)(v15 + 36) = v13;
  uint64_t v16 = *(void *)(*((void *)v5 + 125) + 120LL);
  LOBYTE(v13) = *((_BYTE *)a3 + 42);
  *(_BYTE *)(v16 + 40) |= 0x80u;
  *(_BYTE *)(v16 + 38) = v13;
  uint64_t v17 = *(void *)(*((void *)v5 + 125) + 120LL);
  uint64_t v18 = *((void *)a3 + 4);
  *(_BYTE *)(v17 + 40) |= 2u;
  *(void *)(v17 + 16) = v18;
  -[CLFallMslSink _insertSample:](self, "_insertSample:", v5);
}

- (void)logFallState:(const ImpactEvent *)a3
{
  uint64_t v5 = operator new(0xE28uLL);
  float v6 = sub_101125260(v5);
  sub_10113918C(v6);
  uint64_t v7 = *(void *)&a3->fImpact.fOperatingMode;
  v5[3616] |= 1u;
  *((void *)v5 + 77) = v7;
  uint64_t v8 = *((void *)v5 + 125);
  uint64_t v9 = *(void *)(&a3->fImpact.fCrown + 1);
  *(_BYTE *)(v8 + 128) |= 1u;
  *(void *)(v8 + 24) = v9;
  sub_101082EE4(*((_DWORD **)v5 + 125));
  uint64_t v10 = *(void *)(*((void *)v5 + 125) + 48LL);
  uint64_t v11 = *(void *)&a3->fImpact.fIsFall;
  *(_BYTE *)(v10 + 48) |= 2u;
  *(void *)(v10 + 16) = v11;
  uint64_t v12 = *(void *)(*((void *)v5 + 125) + 48LL);
  uint64_t v13 = *(void *)(&a3->fImpact.fCrown + 1);
  *(_BYTE *)(v12 + 48) |= 1u;
  *(void *)(v12 + 8) = v13;
  uint64_t v14 = *(void *)(*((void *)v5 + 125) + 48LL);
  LODWORD(v13) = HIBYTE(a3->fImpact.fNow);
  *(_BYTE *)(v14 + 48) |= 4u;
  *(_DWORD *)(v14 + 24) = v13;
  uint64_t v15 = *(void *)(*((void *)v5 + 125) + 48LL);
  LODWORD(v13) = BYTE5(a3->fImpact.fNow);
  *(_BYTE *)(v15 + 48) |= 0x40u;
  *(_DWORD *)(v15 + 40) = v13;
  uint64_t v16 = *(void *)(*((void *)v5 + 125) + 48LL);
  LODWORD(v13) = a3->fImpact.fHasMotionBeforeImpact;
  *(_BYTE *)(v16 + 48) |= 0x20u;
  *(_DWORD *)(v16 + 36) = v13;
  uint64_t v17 = *(void *)(*((void *)v5 + 125) + 48LL);
  LODWORD(v13) = a3->fImpact.fImpactState;
  *(_BYTE *)(v17 + 48) |= 0x10u;
  *(_DWORD *)(v17 + 32) = v13;
  uint64_t v18 = *(void *)(*((void *)v5 + 125) + 48LL);
  LODWORD(v13) = BYTE1(a3->fImpact.fAbruptGravityChangeAngle);
  *(_BYTE *)(v18 + 48) |= 8u;
  *(_DWORD *)(v18 + 28) = v13;
  uint64_t v19 = *(void *)(*((void *)v5 + 125) + 48LL);
  LOBYTE(v13) = a3->fImpact.fState;
  *(_BYTE *)(v19 + 48) |= 0x80u;
  *(_BYTE *)(v19 + 44) = v13;
  if (BYTE5(a3->fImpact.fNow))
  {
    __int128 v20 = *(_OWORD *)&a3->fImpact.fSeq;
    __int128 v21 = *(_OWORD *)&a3->fImpact.fAge;
    __int128 v22 = *(_OWORD *)&a3->fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fZMin;
    *(_OWORD *)&self->fImpactEvent.fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fXMin = *(_OWORD *)&a3->fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fXMin;
    *(_OWORD *)&self->fImpactEvent.fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fZMin = v22;
    *(_OWORD *)&self->fImpactEvent.fImpact.fSeq = v20;
    *(_OWORD *)&self->fImpactEvent.fImpact.fAge = v21;
    __int128 v23 = *(_OWORD *)&a3->fImpact.fPeakTimestamp;
    __int128 v24 = *(_OWORD *)&a3->fImpact.fMinInertialZHighFreq;
    __int128 v25 = *(_OWORD *)&a3->fImpact.fTiltAngle;
    *(_OWORD *)&self->fImpactEvent.fImpact.fMaxAngleChangePostImpact = *(_OWORD *)&a3->fImpact.fMaxAngleChangePostImpact;
    *(_OWORD *)&self->fImpactEvent.fImpact.fTiltAngle = v25;
    *(_OWORD *)&self->fImpactEvent.fImpact.fPeakTimestamp = v23;
    *(_OWORD *)&self->fImpactEvent.fImpact.fMinInertialZHighFreq = v24;
    __int128 v26 = *(_OWORD *)&a3->fImpact.fPathLengthDecorrelation;
    __int128 v27 = *(_OWORD *)&a3->fImpact.fMedianAbsGravityY;
    __int128 v28 = *(_OWORD *)&a3->fResponse;
    *(_OWORD *)((char *)&self->fImpactEvent.fAbsoluteTimestamp + 7) = *(_OWORD *)((char *)&a3->fAbsoluteTimestamp + 7);
    *(_OWORD *)&self->fImpactEvent.fImpact.fMedianAbsGravityY = v27;
    *(_OWORD *)&self->fImpactEvent.fResponse = v28;
    *(_OWORD *)&self->fImpactEvent.fImpact.fPathLengthDecorrelation = v26;
  }

  -[CLFallMslSink _insertSample:](self, "_insertSample:", v5);
}

- (void)logFallStats:(const ImpactEvent *)a3
{
  uint64_t v5 = operator new(0xE28uLL);
  float v6 = sub_101125260(v5);
  sub_10113918C(v6);
  uint64_t v7 = *(void *)&a3->fImpact.fOperatingMode;
  v5[3616] |= 1u;
  *((void *)v5 + 77) = v7;
  uint64_t v8 = *((void *)v5 + 125);
  uint64_t v9 = *(void *)&a3->fImpact.fIsFall;
  *(_BYTE *)(v8 + 128) |= 1u;
  *(void *)(v8 + 24) = v9;
  sub_101082F24(*((void **)v5 + 125));
  uint64_t v10 = *(void *)(*((void *)v5 + 125) + 56LL);
  int fSeq = a3->fImpact.fSeq;
  *(void *)(v10 + 216) |= 0x80000000uLL;
  *(_DWORD *)(v10 + 144) = fSeq;
  uint64_t v12 = *(void *)(*((void *)v5 + 125) + 56LL);
  uint64_t v13 = *(void *)(&a3->fImpact.fCrown + 1);
  *(void *)(v12 + 216) |= 1uLL;
  *(void *)(v12 + 8) = v13;
  uint64_t v14 = *(void *)(*((void *)v5 + 125) + 56LL);
  uint64_t v15 = *(void *)&a3->fImpact.fIsFall;
  *(void *)(v14 + 216) |= 2uLL;
  *(void *)(v14 + 16) = v15;
  uint64_t v16 = *(void *)(*((void *)v5 + 125) + 56LL);
  LODWORD(v15) = SBYTE6(a3->fImpact.fNow);
  *(void *)(v16 + 216) |= 0x1000uLL;
  *(_DWORD *)(v16 + 68) = v15;
  uint64_t v17 = *(void *)(*((void *)v5 + 125) + 56LL);
  LODWORD(v15) = HIBYTE(a3->fImpact.fNow);
  *(void *)(v17 + 216) |= 0x4000uLL;
  *(_DWORD *)(v17 + 76) = v15;
  uint64_t v18 = *(void *)(*((void *)v5 + 125) + 56LL);
  LODWORD(v15) = a3->fImpact.fFallType;
  *(void *)(v18 + 216) |= (unint64_t)&_mh_execute_header;
  *(_DWORD *)(v18 + 148) = v15;
  uint64_t v19 = *(void *)(*((void *)v5 + 125) + 56LL);
  LODWORD(v15) = a3->fImpact.fTrialCount;
  *(void *)(v19 + 216) |= 0x1000000000uLL;
  *(_DWORD *)(v19 + 164) = v15;
  uint64_t v20 = *(void *)(*((void *)v5 + 125) + 56LL);
  LODWORD(v15) = a3->fImpact.fCrown;
  *(void *)(v20 + 216) |= 0x100uLL;
  *(_DWORD *)(v20 + 52) = v15;
  uint64_t v21 = *(void *)(*((void *)v5 + 125) + 56LL);
  LODWORD(v15) = a3->fImpact.fAge;
  *(void *)(v21 + 216) |= 0x8000uLL;
  *(_DWORD *)(v21 + 80) = v15;
  uint64_t v22 = *(void *)(*((void *)v5 + 125) + 56LL);
  int v23 = *(_DWORD *)((char *)&a3->fImpact.fPeakTimestamp + 7);
  *(void *)(v22 + 216) |= 0x1000000uLL;
  *(_DWORD *)(v22 + 116) = v23;
  if (HIBYTE(self->fImpactEvent.fTimestamp))
  {
    uint64_t v24 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v25 = *(_DWORD *)((char *)&a3->fImpact.fTimestamp + 3);
    *(void *)(v24 + 216) |= 0x8000000000uLL;
    *(_DWORD *)(v24 + 176) = v25;
    uint64_t v26 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v27 = *(_DWORD *)((char *)&a3->fImpact.fTimestamp + 7);
    *(void *)(v26 + 216) |= 0x4000000000uLL;
    *(_DWORD *)(v26 + 172) = v27;
    uint64_t v28 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v29 = *(_DWORD *)((char *)&a3->fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fXMin + 3);
    *(void *)(v28 + 216) |= 0x80000000000uLL;
    *(_DWORD *)(v28 + 192) = v29;
    uint64_t v30 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v31 = *(_DWORD *)((char *)&a3->fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fXMax + 3);
    *(void *)(v30 + 216) |= 0x40000000000uLL;
    *(_DWORD *)(v30 + 188) = v31;
    uint64_t v32 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v33 = *(_DWORD *)((char *)&a3->fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fYMin + 3);
    *(void *)(v32 + 216) |= 0x800000000000uLL;
    *(_DWORD *)(v32 + 208) = v33;
    uint64_t v34 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v35 = *(_DWORD *)((char *)&a3->fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fYMax + 3);
    *(void *)(v34 + 216) |= 0x400000000000uLL;
    *(_DWORD *)(v34 + 204) = v35;
    uint64_t v36 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v37 = *(_DWORD *)((char *)&a3->fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fZMin + 3);
    *(void *)(v36 + 216) |= 0x10000uLL;
    *(_DWORD *)(v36 + 84) = v37;
    uint64_t v38 = *(void *)(*((void *)v5 + 125) + 56LL);
    uint64_t v39 = *(void *)((char *)&a3->fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fZMax + 3);
    *(void *)(v38 + 216) |= 4uLL;
    *(void *)(v38 + 24) = v39;
    uint64_t v40 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v41 = *(_DWORD *)((char *)&a3->fImpact.fHighFrequencyFeatures + 31);
    *(void *)(v40 + 216) |= 0x10uLL;
    *(_DWORD *)(v40 + 36) = v41;
    uint64_t v42 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v43 = *(_DWORD *)((char *)&a3->fImpact.fPeakTimestamp + 3);
    *(void *)(v42 + 216) |= 0x800000uLL;
    *(_DWORD *)(v42 + 112) = v43;
    uint64_t v44 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v45 = *(_DWORD *)((char *)&a3->fImpact.fAccelPathLength + 3);
    *(void *)(v44 + 216) |= 0x80uLL;
    *(_DWORD *)(v44 + 48) = v45;
    uint64_t v46 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v47 = *(_DWORD *)((char *)&a3->fImpact.fMinInertialZ + 3);
    *(void *)(v46 + 216) |= 0x40uLL;
    *(_DWORD *)(v46 + 44) = v47;
    uint64_t v48 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v49 = *(_DWORD *)((char *)&a3->fImpact.fMinInertialZHighFreq + 3);
    *(void *)(v48 + 216) |= 0x100000uLL;
    *(_DWORD *)(v48 + 100) = v49;
    uint64_t v50 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v51 = *(_DWORD *)((char *)&a3->fImpact.fAngleChangePreImpact + 3);
    *(void *)(v50 + 216) |= 0x80000uLL;
    *(_DWORD *)(v50 + 96) = v51;
    uint64_t v52 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v53 = *(_DWORD *)((char *)&a3->fImpact.fMaxAngleChangePreImpact + 3);
    *(void *)(v52 + 216) |= 0x40000000uLL;
    *(_DWORD *)(v52 + 140) = v53;
    uint64_t v54 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v55 = *(_DWORD *)((char *)&a3->fImpact.fAngleChangePostImpact + 3);
    *(void *)(v54 + 216) |= 0x200000000uLL;
    *(_DWORD *)(v54 + 152) = v55;
    uint64_t v56 = *(void *)(*((void *)v5 + 125) + 56LL);
    float v57 = sub_100734D60((float *)((char *)&a3->fImpact.fTimestamp + 3));
    *(void *)(v56 + 216) |= 0x40000uLL;
    *(float *)(v56 + 92) = v57;
    uint64_t v58 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v59 = *(_DWORD *)((char *)&a3->fImpact.fMaxAngleChangePostImpact + 3);
    *(void *)(v58 + 216) |= 0x20000000uLL;
    *(_DWORD *)(v58 + 136) = v59;
    uint64_t v60 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v61 = *(_DWORD *)((char *)&a3->fImpact.fSumDeltaAngles + 3);
    *(void *)(v60 + 216) |= 0x800000000uLL;
    *(_DWORD *)(v60 + 160) = v61;
    uint64_t v62 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v63 = *(_DWORD *)((char *)&a3->fImpact.fPosteriorRatio + 3);
    *(void *)(v62 + 216) |= 0x400000000uLL;
    *(_DWORD *)(v62 + 156) = v63;
    uint64_t v64 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v65 = *(_DWORD *)((char *)&a3->fImpact.fTiltAngle + 3);
    *(void *)(v64 + 216) |= 0x10000000uLL;
    *(_DWORD *)(v64 + 132) = v65;
    uint64_t v66 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v67 = *(_DWORD *)((char *)&a3->fImpact.fSwingAngle + 3);
    *(void *)(v66 + 216) |= 0x4000000uLL;
    *(_DWORD *)(v66 + 124) = v67;
    uint64_t v68 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v69 = *(_DWORD *)((char *)&a3->fImpact.fAccelPathLengthWithPeak + 3);
    *(void *)(v68 + 216) |= 0x8000000uLL;
    *(_DWORD *)(v68 + 128) = v69;
    uint64_t v70 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v71 = *(_DWORD *)((char *)&a3->fImpact.fPoseAtImpact + 3);
    *(void *)(v70 + 216) |= 0x20uLL;
    *(_DWORD *)(v70 + 40) = v71;
    uint64_t v72 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v73 = *(_DWORD *)((char *)&a3->fImpact.fPathLengthHarmonicMean + 3);
    *(void *)(v72 + 216) |= 0x2000uLL;
    *(_DWORD *)(v72 + 72) = v73;
    uint64_t v74 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v75 = *(_DWORD *)((char *)&a3->fImpact.fPathLengthDecorrelation + 3);
    *(void *)(v74 + 216) |= 0x200uLL;
    *(_DWORD *)(v74 + 56) = v75;
    uint64_t v76 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v77 = *(_DWORD *)((char *)&a3->fImpact.fPathLengthDelaySpread + 3);
    *(void *)(v76 + 216) |= 0x400000uLL;
    *(_DWORD *)(v76 + 108) = v77;
    uint64_t v78 = *(void *)(*((void *)v5 + 125) + 56LL);
    int v79 = *(_DWORD *)((char *)&a3->fImpact.fGravityVariance + 3);
    *(void *)(v78 + 216) |= 8uLL;
    *(_DWORD *)(v78 + 32) = v79;
  }

  uint64_t v80 = *(void *)(*((void *)v5 + 125) + 56LL);
  int v81 = BYTE1(a3->fImpact.fAbruptGravityChangeAngle);
  *(void *)(v80 + 216) |= 0x2000000uLL;
  *(_DWORD *)(v80 + 120) = v81;
  -[CLFallMslSink _insertSample:](self, "_insertSample:", v5);
}

- (void)logSuppressionFeartures:(const FalsePositiveSuppressionFeatures *)a3
{
  if (HIBYTE(self->fImpactEvent.fTimestamp))
  {
    uint64_t v5 = operator new(0xE28uLL);
    float v6 = sub_101125260(v5);
    sub_10113918C(v6);
    uint64_t v7 = *(void *)((char *)a3 + 68);
    v5[3616] |= 1u;
    *((void *)v5 + 77) = v7;
    uint64_t v8 = *((void *)v5 + 125);
    uint64_t v9 = *(void *)a3;
    *(_BYTE *)(v8 + 128) |= 1u;
    *(void *)(v8 + 24) = v9;
    sub_101082F64(*((_DWORD **)v5 + 125));
    uint64_t v10 = *(void *)(*((void *)v5 + 125) + 112LL);
    uint64_t v11 = *(void *)a3;
    *(_WORD *)(v10 + 80) |= 4u;
    *(void *)(v10 + 24) = v11;
    uint64_t v12 = *(void *)(*((void *)v5 + 125) + 112LL);
    uint64_t v13 = *((void *)a3 + 2);
    *(_WORD *)(v12 + 80) |= 2u;
    *(void *)(v12 + 16) = v13;
    uint64_t v14 = *(void *)(*((void *)v5 + 125) + 112LL);
    uint64_t v15 = *((void *)a3 + 1);
    *(_WORD *)(v14 + 80) |= 1u;
    *(void *)(v14 + 8) = v15;
    uint64_t v16 = *(void *)(*((void *)v5 + 125) + 112LL);
    LODWORD(v15) = *((unsigned __int16 *)a3 + 12);
    *(_WORD *)(v16 + 80) |= 0x200u;
    *(_DWORD *)(v16 + 64) = v15;
    uint64_t v17 = *(void *)(*((void *)v5 + 125) + 112LL);
    int v18 = *(_DWORD *)((char *)a3 + 26);
    *(_WORD *)(v17 + 80) |= 0x800u;
    *(_DWORD *)(v17 + 72) = v18;
    uint64_t v19 = *(void *)(*((void *)v5 + 125) + 112LL);
    int v20 = *(_DWORD *)((char *)a3 + 30);
    *(_WORD *)(v19 + 80) |= 0x1000u;
    *(_DWORD *)(v19 + 76) = v20;
    uint64_t v21 = *(void *)(*((void *)v5 + 125) + 112LL);
    int v22 = *(_DWORD *)((char *)a3 + 34);
    *(_WORD *)(v21 + 80) |= 0x400u;
    *(_DWORD *)(v21 + 68) = v22;
    uint64_t v23 = *(void *)(*((void *)v5 + 125) + 112LL);
    LODWORD(v15) = *(_DWORD *)((char *)a3 + 38);
    *(_WORD *)(v23 + 80) |= 0x20u;
    *(_DWORD *)(v23 + 48) = v15;
    uint64_t v24 = *(void *)(*((void *)v5 + 125) + 112LL);
    int v25 = *(_DWORD *)((char *)a3 + 42);
    *(_WORD *)(v24 + 80) |= 0x40u;
    *(_DWORD *)(v24 + 52) = v25;
    uint64_t v26 = *(void *)(*((void *)v5 + 125) + 112LL);
    LODWORD(v15) = *(_DWORD *)((char *)a3 + 46);
    *(_WORD *)(v26 + 80) |= 0x100u;
    *(_DWORD *)(v26 + 60) = v15;
    -[CLFallMslSink _insertSample:](self, "_insertSample:", v5);
  }

- (void)logOdometer:(const OdometerEntry *)a3
{
  if (HIBYTE(self->fImpactEvent.fTimestamp))
  {
    uint64_t v5 = (double *)operator new(0xE28uLL);
    float v6 = sub_101125260(v5);
    sub_10113918C(v6);
    double var0 = a3->var0;
    *((_BYTE *)v5 + 3616) |= 1u;
    v5[77] = var0;
    sub_101082FA4(*((void **)v5 + 125));
    uint64_t v8 = *(void *)(*((void *)v5 + 125) + 96LL);
    double groundAltitude = a3->var2.groundAltitude;
    *(_BYTE *)(v8 + 80) |= 4u;
    *(double *)(v8 + 24) = groundAltitude;
    uint64_t v10 = *(void *)(*((void *)v5 + 125) + 96LL);
    double groundAltitudeUncertainty = a3->var2.groundAltitudeUncertainty;
    *(_BYTE *)(v10 + 80) |= 8u;
    *(double *)(v10 + 32) = groundAltitudeUncertainty;
    uint64_t v12 = *(void *)(*((void *)v5 + 125) + 96LL);
    double smoothedGPSAltitude = a3->var2.smoothedGPSAltitude;
    *(_BYTE *)(v12 + 80) |= 0x40u;
    *(double *)(v12 + 56) = smoothedGPSAltitude;
    uint64_t v14 = *(void *)(*((void *)v5 + 125) + 96LL);
    double smoothedGPSAltitudeUncertainty = a3->var2.smoothedGPSAltitudeUncertainty;
    *(_BYTE *)(v14 + 80) |= 0x80u;
    *(double *)(v14 + 64) = smoothedGPSAltitudeUncertainty;
    uint64_t v16 = *(void *)(*((void *)v5 + 125) + 96LL);
    double gpsCourseRadians = a3->var2.gpsCourseRadians;
    *(_BYTE *)(v16 + 80) |= 2u;
    *(double *)(v16 + 16) = gpsCourseRadians;
    uint64_t v18 = *(void *)(*((void *)v5 + 125) + 96LL);
    double gpsCourseAccuracy = a3->var2.gpsCourseAccuracy;
    *(_BYTE *)(v18 + 80) |= 1u;
    *(double *)(v18 + 8) = gpsCourseAccuracy;
    sub_1011894E8(*(_DWORD **)(*((void *)v5 + 125) + 96LL));
    uint64_t v20 = *(void *)(*(void *)(*((void *)v5 + 125) + 96LL) + 72LL);
    double startTime = a3->var2.startTime;
    *(_WORD *)(v20 + 100) |= 0x80u;
    *(double *)(v20 + 64) = startTime;
    uint64_t v22 = *(void *)(*(void *)(*((void *)v5 + 125) + 96LL) + 72LL);
    double distance = a3->var2.distance;
    *(_WORD *)(v22 + 100) |= 2u;
    *(double *)(v22 + 16) = distance;
    uint64_t v24 = *(void *)(*(void *)(*((void *)v5 + 125) + 96LL) + 72LL);
    double accuracy = a3->var2.accuracy;
    *(_WORD *)(v24 + 100) |= 1u;
    *(double *)(v24 + 8) = accuracy;
    uint64_t v26 = *(void *)(*(void *)(*((void *)v5 + 125) + 96LL) + 72LL);
    double gpsAltitude = a3->var2.gpsAltitude;
    *(_WORD *)(v26 + 100) |= 4u;
    *(double *)(v26 + 24) = gpsAltitude;
    uint64_t v28 = *(void *)(*(void *)(*((void *)v5 + 125) + 96LL) + 72LL);
    double speed = a3->var2.speed;
    *(_WORD *)(v28 + 100) |= 0x40u;
    *(double *)(v28 + 56) = speed;
    uint64_t v30 = *(void *)(*(void *)(*((void *)v5 + 125) + 96LL) + 72LL);
    double rawSpeed = a3->var2.rawSpeed;
    *(_WORD *)(v30 + 100) |= 0x20u;
    *(double *)(v30 + 48) = rawSpeed;
    uint64_t v32 = *(void *)(*(void *)(*((void *)v5 + 125) + 96LL) + 72LL);
    double odometer = a3->var2.odometer;
    *(_WORD *)(v32 + 100) |= 0x10u;
    *(double *)(v32 + 40) = odometer;
    uint64_t v34 = *(void *)(*(void *)(*((void *)v5 + 125) + 96LL) + 72LL);
    double gpsSpeedAccuracy = a3->var2.gpsSpeedAccuracy;
    *(_WORD *)(v34 + 100) |= 8u;
    *(double *)(v34 + 32) = gpsSpeedAccuracy;
    uint64_t v36 = *(void *)(*(void *)(*((void *)v5 + 125) + 96LL) + 72LL);
    double timestampGps = a3->var2.timestampGps;
    *(_WORD *)(v36 + 100) |= 0x100u;
    *(double *)(v36 + 72) = timestampGps;
    uint64_t v38 = *(void *)(*(void *)(*((void *)v5 + 125) + 96LL) + 72LL);
    int originDevice = a3->var2.originDevice;
    *(_WORD *)(v38 + 100) |= 0x400u;
    *(_DWORD *)(v38 + 84) = originDevice;
    uint64_t v40 = *(void *)(*(void *)(*((void *)v5 + 125) + 96LL) + 72LL);
    int quality = a3->var2.quality;
    *(_WORD *)(v40 + 100) |= 0x800u;
    *(_DWORD *)(v40 + 88) = quality;
    -[CLFallMslSink _insertSample:](self, "_insertSample:", v5);
  }

- (void)sendData:(id)a3 completion:(id)a4
{
  if (a4 && self->fOrderedSample.__size_alloc_.__value_)
  {
    sub_10111C1E8(v52, a2);
    uint64_t v48 = &off_101864D00;
    __p = 0LL;
    uint64_t v51 = 0LL;
    uint64_t v50 = 0LL;
    sub_10111C584(v52, (uint64_t)&v48, 0);
    double v7 = *(double *)&self->fImpactEvent.fImpact.fOperatingMode;
    if (v7 == 0.0)
    {
      int v8 = 0;
      double v7 = *(double *)(*((void *)self->fOrderedSample.__end_.__next_ + 2) + 616LL);
    }

    else
    {
      int v8 = SBYTE6(self->fImpactEvent.fImpact.fNow);
    }

    sub_101125260(v45);
    sub_10113918C(v45);
    v47 |= 1u;
    *(double *)&v45[77] = v7;
    sub_101082C2C(v46);
    uint64_t v9 = *((void *)v46 + 11);
    char v10 = sub_10071E178();
    *(_DWORD *)(v9 + 72) |= 0x10000u;
    *(_BYTE *)(v9 + 69) = v10;
    uint64_t v11 = *((void *)v46 + 11);
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"CMCrownUpDown"), "doubleValue");
    *(_DWORD *)(v11 + 72) |= 1u;
    *(_DWORD *)(v11 + 8) = (int)v12;
    uint64_t v13 = *((void *)v46 + 11);
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"CMIsNearFall"), "doubleValue");
    *(_DWORD *)(v13 + 72) |= 0x20000u;
    *(_BYTE *)(v13 + 70) = v14 != 0.0;
    uint64_t v15 = *((void *)v46 + 11);
    *(_DWORD *)(v15 + 72) |= 2u;
    *(_DWORD *)(v15 + 12) = v8;
    uint64_t v16 = *((void *)v46 + 11);
    objc_msgSend(objc_msgSend(a3, "objectForKey:", CMNatalimeterSetUserAgeYr), "doubleValue");
    *(_DWORD *)(v16 + 72) |= 0x2000u;
    *(_DWORD *)(v16 + 60) = (int)v17;
    uint64_t v18 = *((void *)v46 + 11);
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"CMWorkoutType"), "doubleValue");
    *(_DWORD *)(v18 + 72) |= 0x4000u;
    *(_DWORD *)(v18 + 64) = (int)v19;
    uint64_t v20 = *((void *)v46 + 11);
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"CMMetMinutePercentileActual"), "doubleValue");
    *(float *)&double v21 = v21;
    *(_DWORD *)(v20 + 72) |= 0x200u;
    *(_DWORD *)(v20 + 44) = LODWORD(v21);
    uint64_t v22 = *((void *)v46 + 11);
    unsigned __int8 v23 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"isADLImpact"), "BOOLValue");
    *(_DWORD *)(v22 + 72) |= 0x8000u;
    *(_BYTE *)(v22 + 68) = v23;
    if (HIBYTE(self->fImpactEvent.fTimestamp))
    {
      uint64_t v24 = *((void *)v46 + 11);
      objc_msgSend(objc_msgSend(a3, "objectForKey:", @"CMImpactMaxAccelNormAlertThreshold"), "doubleValue");
      *(float *)&double v25 = v25;
      *(_DWORD *)(v24 + 72) |= 4u;
      *(_DWORD *)(v24 + 16) = LODWORD(v25);
      uint64_t v26 = *((void *)v46 + 11);
      objc_msgSend(objc_msgSend(a3, "objectForKey:", @"CMImpactMaxAccelNormLoggingStatsThreshold"), "doubleValue");
      *(float *)&double v27 = v27;
      *(_DWORD *)(v26 + 72) |= 0x20u;
      *(_DWORD *)(v26 + 28) = LODWORD(v27);
      uint64_t v28 = *((void *)v46 + 11);
      objc_msgSend( objc_msgSend(a3, "objectForKey:", @"CMImpactMaxAccelNormLoggingHeartRateThreshold"),  "doubleValue");
      *(float *)&double v29 = v29;
      *(_DWORD *)(v28 + 72) |= 8u;
      *(_DWORD *)(v28 + 20) = LODWORD(v29);
      uint64_t v30 = *((void *)v46 + 11);
      objc_msgSend( objc_msgSend(a3, "objectForKey:", @"CMImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold"),  "doubleValue");
      *(float *)&double v31 = v31;
      *(_DWORD *)(v30 + 72) |= 0x10u;
      *(_DWORD *)(v30 + 24) = LODWORD(v31);
      uint64_t v32 = *((void *)v46 + 11);
      objc_msgSend( objc_msgSend(a3, "objectForKey:", @"CMTripFallPosteriorRatioDetectionThreshold"),  "doubleValue");
      *(float *)&double v33 = v33;
      *(_DWORD *)(v32 + 72) |= 0x1000u;
      *(_DWORD *)(v32 + 56) = LODWORD(v33);
      uint64_t v34 = *((void *)v46 + 11);
      objc_msgSend( objc_msgSend(a3, "objectForKey:", @"CMSlipFallPosteriorRatioDetectionThreshold"),  "doubleValue");
      *(float *)&double v35 = v35;
      *(_DWORD *)(v34 + 72) |= 0x800u;
      *(_DWORD *)(v34 + 52) = LODWORD(v35);
      uint64_t v36 = *((void *)v46 + 11);
      objc_msgSend( objc_msgSend(a3, "objectForKey:", @"CMOtherFallPosteriorRatioDetectionThreshold"),  "doubleValue");
      *(float *)&double v37 = v37;
      *(_DWORD *)(v36 + 72) |= 0x400u;
      *(_DWORD *)(v36 + 48) = LODWORD(v37);
      uint64_t v38 = *((void *)v46 + 11);
      objc_msgSend(objc_msgSend(a3, "objectForKey:", @"CMMetMinutePercentile90"), "doubleValue");
      *(float *)&double v39 = v39;
      *(_DWORD *)(v38 + 72) |= 0x40u;
      *(_DWORD *)(v38 + 32) = LODWORD(v39);
      uint64_t v40 = *((void *)v46 + 11);
      objc_msgSend(objc_msgSend(a3, "objectForKey:", @"CMMetMinutePercentile95"), "doubleValue");
      *(float *)&double v41 = v41;
      *(_DWORD *)(v40 + 72) |= 0x80u;
      *(_DWORD *)(v40 + 36) = LODWORD(v41);
      uint64_t v42 = *((void *)v46 + 11);
      objc_msgSend(objc_msgSend(a3, "objectForKey:", @"CMMetMinutePercentile98"), "doubleValue");
      *(float *)&double v43 = v43;
      *(_DWORD *)(v42 + 72) |= 0x100u;
      *(_DWORD *)(v42 + 40) = LODWORD(v43);
    }

    sub_10111C5D4((uint64_t)v52, (uint64_t)v45);
    for (i = (list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *)self->fOrderedSample.__end_.__next_;
          i != &self->fOrderedSample;
          i = (list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *)i->__end_.__next_)
    {
      sub_10111C5D4((uint64_t)v52, i->__size_alloc_.__value_);
    }

    sub_10111C80C((uint64_t)v52);
    (*((void (**)(id, id, void **))a4 + 2))(a4, a3, &__p);
    sub_101127D00((PB::Base *)v45);
    uint64_t v48 = &off_101864D00;
    if (__p)
    {
      uint64_t v50 = __p;
      operator delete(__p);
    }

    sub_10111C2D8((uint64_t)v52);
  }

  -[CLFallMslSink cleanUp](self, "cleanUp", a3);
}

- (void)cleanUpIncludingDerivedFeatures:(BOOL)a3
{
  p_fOrderedSample = &self->fOrderedSample;
  for (i = (list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *)self->fOrderedSample.__end_.__next_;
        i != p_fOrderedSample;
        i = (list<CMMsl::Item *, std::allocator<CMMsl::Item *>> *)i->__end_.__next_)
  {
    unint64_t value = i->__size_alloc_.__value_;
    if (value) {
      (*(void (**)(unint64_t, SEL))(*(void *)value + 8LL))(value, a2);
    }
  }

  sub_1001B4C40(p_fOrderedSample);
  *(void *)&self->fImpactEvent.fImpact.int fSeq = 0LL;
  self->fImpactEvent.fImpact.fNow = 0LL;
  *(_DWORD *)(&self->fImpactEvent.fImpact.fSimulated + 1) = 0;
  *(void *)&self->fImpactEvent.fImpact.fAge = 0LL;
  *(_OWORD *)((char *)&self->fImpactEvent.fImpact.fTimestamp + 3) = xmmword_1013282E0;
  *(void *)((char *)&self->fImpactEvent.fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fYMin + 3) = 0xFF7FFFFF7F7FFFFFLL;
  *(float *)((char *)&self->fImpactEvent.fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fZMin + 3) = -3.4028e38;
  *(void *)((char *)&self->fImpactEvent.fImpact.fHighFrequencyFeatures.fMagnitudeFeatures.fZMax + 3) = 0LL;
  *(void *)((char *)&self->fImpactEvent.fImpact.fHighFrequencyFeatures + 31) = 0x7F7FFFFF00000000LL;
  *(_DWORD *)((char *)&self->fImpactEvent.fImpact.fPeakTimestamp + 7) = 2139095039;
  *(_OWORD *)((char *)&self->fImpactEvent.fImpact.fAccelPathLength + 3) = 0u;
  *(_OWORD *)((char *)&self->fImpactEvent.fImpact.fAngleChangePostImpact + 3) = 0u;
  *(_OWORD *)((char *)&self->fImpactEvent.fImpact.fPosteriorRatio + 3) = 0u;
  *(float *)((char *)&self->fImpactEvent.fImpact.fAccelPathLengthWithPeak + 3) = 0.0;
  *(int32x4_t *)((char *)&self->fImpactEvent.fImpact.fPathLengthHarmonicMean + 3) = vdupq_n_s32(0x7F7FFFFFu);
  *(float *)((char *)&self->fImpactEvent.fImpact.fCrownVariance + 3) = -3.4028e38;
  *(_WORD *)((char *)&self->fImpactEvent.fImpact.fMedianAbsGravityY + 3) = 1;
  BYTE1(self->fImpactEvent.fImpact.fAbruptGravityChangeAngle) = 0;
  *(_DWORD *)((char *)&self->fImpactEvent.fTimestamp + 3) = 0;
  *(_OWORD *)((char *)&self->fImpactEvent.fAbsoluteTimestamp + 4) = 0u;
  *(_OWORD *)&self->fImpactEvent.fImpact.fHasMotionBeforeImpact = 0u;
  HIBYTE(self->fImpactEvent.fTimestamp) = a3;
}

- (void)cleanUp
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = (char *)self + 8;
  *((void *)self + 2) = (char *)self + 8;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_DWORD *)((char *)self + 55) = 0;
  *(_OWORD *)((char *)self + 59) = xmmword_1013282E0;
  *(void *)((char *)self + 75) = 0xFF7FFFFF7F7FFFFFLL;
  *(_DWORD *)((char *)self + 83) = -8388609;
  *(void *)((char *)self + 87) = 0LL;
  *(void *)((char *)self + 95) = 0x7F7FFFFF00000000LL;
  *(_DWORD *)((char *)self + 103) = 2139095039;
  *(_OWORD *)((char *)self + 107) = 0u;
  *(_OWORD *)((char *)self + 123) = 0u;
  *(_OWORD *)((char *)self + 139) = 0u;
  *(_DWORD *)((char *)self + 155) = 0;
  *(int32x4_t *)((char *)self + 159) = vdupq_n_s32(0x7F7FFFFFu);
  *(_DWORD *)((char *)self + 175) = -8388609;
  *(_WORD *)((char *)self + 179) = 1;
  *((_BYTE *)self + 181) = 0;
  *(_DWORD *)((char *)self + 219) = 0;
  *(_OWORD *)((char *)self + 204) = 0u;
  *(_OWORD *)((char *)self + 188) = 0u;
  return self;
}

@end