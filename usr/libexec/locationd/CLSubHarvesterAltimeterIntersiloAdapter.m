@interface CLSubHarvesterAltimeterIntersiloAdapter
- (BOOL)valid;
- (CLSubHarvesterAltimeterIntersiloAdapter)initWithHarvesterExternal:(void *)a3;
- (void)onBarometerCalibrationNotification:(unint64_t)a3 track:(id)a4 data:(id)a5;
- (void)setValid:(BOOL)a3;
@end

@implementation CLSubHarvesterAltimeterIntersiloAdapter

- (CLSubHarvesterAltimeterIntersiloAdapter)initWithHarvesterExternal:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLSubHarvesterAltimeterIntersiloAdapter;
  result = -[CLSubHarvesterAltimeterIntersiloAdapter init](&v5, "init");
  if (result)
  {
    result->_harvesterExternal = a3;
    result->_valid = 1;
  }

  else
  {
    MEMORY[0x10] = 0;
  }

  return result;
}

- (void)onBarometerCalibrationNotification:(unint64_t)a3 track:(id)a4 data:(id)a5
{
  harvesterExternal = (void **)self->_harvesterExternal;
  (*((void (**)(void *__return_ptr, id, SEL))a5 + 2))(v9, a5, a2);
  if (!a3) {
    (*(void (**)(void *, void, id, void *))(*harvesterExternal[5] + 16LL))( harvesterExternal[5],  0LL,  a4,  v9);
  }
  for (uint64_t i = 54LL; i != -6; i -= 6LL)
    sub_10049108C(&v9[i]);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end