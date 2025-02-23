@interface CMStrideCalibrationStepCountBuffer
- (id).cxx_construct;
- (unsigned)stepsInWindow;
- (void)ageOutStepArray;
- (void)feedStepCountUpdate:(const NotificationData *)a3;
@end

@implementation CMStrideCalibrationStepCountBuffer

- (void)ageOutStepArray
{
  double Current = CFAbsoluteTimeGetCurrent();
  unint64_t value = self->fStepWindow.c.__size_.__value_;
  if (value)
  {
    double v5 = Current;
    do
    {
      unint64_t start = self->fStepWindow.c.__start_;
      if (v5 {
      self->fStepWindow.c.__start_ = start + 1;
      }
      self->fStepWindow.c.__size_.__value_ = value - 1;
      sub_100232D40((uint64_t)&self->fStepWindow, 1);
      unint64_t value = self->fStepWindow.c.__size_.__value_;
    }

    while (value);
  }

- (unsigned)stepsInWindow
{
  unint64_t value = self->fStepWindow.c.__size_.__value_;
  if (!value) {
    return 0;
  }
  unint64_t start = self->fStepWindow.c.__start_;
  return (*(_DWORD **)((char *)self->fStepWindow.c.__map_.__begin_ + (((value + start - 1) >> 5) & 0x7FFFFFFFFFFFFF8LL)))[4 * (value + start - 1) + 2]
       - (*(_DWORD **)((char *)self->fStepWindow.c.__map_.__begin_ + ((start >> 5) & 0x7FFFFFFFFFFFFF8LL)))[4 * start + 2];
}

- (void)feedStepCountUpdate:(const NotificationData *)a3
{
  unint64_t value = self->fStepWindow.c.__size_.__value_;
  if (!value
    || (*(_DWORD **)((char *)self->fStepWindow.c.__map_.__begin_
                   + (((value + self->fStepWindow.c.__start_ - 1) >> 5) & 0x7FFFFFFFFFFFFF8LL)))[4
                                                                                               * (value + LOBYTE(self->fStepWindow.c.__start_) - 1)
                                                                                               + 2] != *((_DWORD *)a3 + 8))
  {
    sub_10029CABC(&self->fStepWindow.c.__map_.__first_, (void *)a3 + 2, (_DWORD *)a3 + 8);
  }

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end