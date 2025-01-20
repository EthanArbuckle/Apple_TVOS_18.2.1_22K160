@interface CLBarometerCalibrationSourceCompanion
- (CLBarometerCalibrationSourceCompanion)initWithUniverse:(id)a3 delegate:(id)a4;
- (id).cxx_construct;
- (void)disableSource;
- (void)enableSource;
- (void)onCompanionNotification:(int)a3 data:(NotificationData *)a4;
@end

@implementation CLBarometerCalibrationSourceCompanion

- (CLBarometerCalibrationSourceCompanion)initWithUniverse:(id)a3 delegate:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSourceCompanion;
  v4 = -[CLBarometerCalibrationSource initWithUniverse:delegate:](&v11, "initWithUniverse:delegate:", a3, a4);
  v5 = v4;
  if (v4)
  {
    sub_1003A09BC((uint64_t)sub_1002F8774, (uint64_t)v4, v4->super._universe, &v10);
    v6 = v10;
    v10 = 0LL;
    value = v5->fCompanionClient.__ptr_.__value_;
    v5->fCompanionClient.__ptr_.__value_ = v6;
    if (value)
    {
      (*(void (**)(Client *))(*(void *)value + 8LL))(value);
      v8 = v10;
      v10 = 0LL;
      if (v8) {
        (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
      }
    }
  }

  return v5;
}

- (void)enableSource
{
  if (!self->super._sourceEnabled)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_1018314E0);
    }
    v3 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Enabling companion data source", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_1018314E0);
      }
      v5[0] = 0;
      v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "Enabling companion data source",  v5,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibrationSourceCompanion enableSource]", "%s\n", v4);
    }

    [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) register:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:11 registrationInfo:0];
    [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) register:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:12 registrationInfo:0];
    self->super._sourceEnabled = 1;
  }

- (void)disableSource
{
  if (self->super._sourceEnabled)
  {
    [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) unregister:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:11];
    [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) unregister:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:12];
    self->super._sourceEnabled = 0;
  }

- (void)onCompanionNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 12)
  {
    v16 = (char *)operator new(0x30uLL);
    *((void *)v16 + 2) = 0LL;
    *(void *)v16 = off_101831560;
    *(int8x16_t *)(v16 + 24) = vextq_s8(*(int8x16_t *)a4, *(int8x16_t *)a4, 8uLL);
    v28 = v16 + 24;
    v29 = (std::__shared_weak_count *)v16;
    *((void *)v16 + 5) = *((void *)a4 + 2);
    *((void *)v16 + 1) = 0LL;
    v17 = (unint64_t *)(v16 + 8);
    v24 = v16 + 24;
    v25 = (std::__shared_weak_count *)v16;
    delegate = self->super._delegate;
    do
      unint64_t v19 = __ldxr(v17);
    while (__stxr(v19 + 1, v17));
    -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](delegate, "didUpdateSource:withData:", 9LL, &v24);
    v20 = v25;
    if (v25)
    {
      p_shared_owners = (unint64_t *)&v25->__shared_owners_;
      do
        unint64_t v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }

    v13 = v29;
    if (v29)
    {
      v23 = (unint64_t *)&v29->__shared_owners_;
      do
        unint64_t v15 = __ldaxr(v23);
      while (__stlxr(v15 - 1, v23));
      goto LABEL_24;
    }
  }

  else if (a3 == 11)
  {
    v6 = (char *)operator new(0x30uLL);
    *((void *)v6 + 1) = 0LL;
    v7 = (unint64_t *)(v6 + 8);
    *((void *)v6 + 2) = 0LL;
    *(void *)v6 = off_101831510;
    *(int64x2_t *)(v6 + 24) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *((void *)v6 + 5) = 0x7FEFFFFFFFFFFFFFLL;
    v28 = v6 + 24;
    v29 = (std::__shared_weak_count *)v6;
    *((CFAbsoluteTime *)v6 + 3) = CFAbsoluteTimeGetCurrent();
    *((_OWORD *)v6 + 2) = *(_OWORD *)a4;
    v8 = self->super._delegate;
    v26 = v6 + 24;
    v27 = (std::__shared_weak_count *)v6;
    do
      unint64_t v9 = __ldxr(v7);
    while (__stxr(v9 + 1, v7));
    -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](v8, "didUpdateSource:withData:", 4LL, &v26);
    v10 = v27;
    if (v27)
    {
      objc_super v11 = (unint64_t *)&v27->__shared_owners_;
      do
        unint64_t v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }

    v13 = v29;
    if (v29)
    {
      v14 = (unint64_t *)&v29->__shared_owners_;
      do
        unint64_t v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
LABEL_24:
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }

- (void).cxx_destruct
{
  value = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0LL;
  return self;
}

@end