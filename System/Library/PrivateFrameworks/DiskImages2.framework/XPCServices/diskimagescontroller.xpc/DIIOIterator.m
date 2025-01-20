@interface DIIOIterator
- (BOOL)startedOver;
- (DIIOIterator)initWithIOIterator:(unsigned int)a3 retain:(BOOL)a4;
- (unsigned)copyNextObject;
- (void)setStartedOver:(BOOL)a3;
@end

@implementation DIIOIterator

- (DIIOIterator)initWithIOIterator:(unsigned int)a3 retain:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DIIOIterator;
  return -[DIIOObject initWithIOObject:retain:](&v5, "initWithIOObject:retain:", *(void *)&a3, a4);
}

- (unsigned)copyNextObject
{
  for (i = self; ; self = i)
  {
    unsigned int result = IOIteratorNext(-[DIIOObject ioObj](self, "ioObj"));
    if (result) {
      break;
    }
    if (IOIteratorIsValid(-[DIIOObject ioObj](i, "ioObj"))) {
      return 0;
    }
    IOIteratorReset(-[DIIOObject ioObj](i, "ioObj"));
    -[DIIOIterator setStartedOver:](i, "setStartedOver:", 1LL);
  }

  return result;
}

- (BOOL)startedOver
{
  return *((_BYTE *)&self->super._ioObj + 4);
}

- (void)setStartedOver:(BOOL)a3
{
  *((_BYTE *)&self->super._ioObj + 4) = a3;
}

@end