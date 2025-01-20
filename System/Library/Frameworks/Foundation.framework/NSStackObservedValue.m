@interface NSStackObservedValue
- (unint64_t)retainCount;
- (void)setError:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation NSStackObservedValue

- (unint64_t)retainCount
{
  return -1LL;
}

- (void)setFinished:(BOOL)a3
{
  self->super._tag = 3;
  self->super._contents = (id)*MEMORY[0x189604DE8];
}

- (void)setValue:(id)a3
{
  self->super._tag = 1;
  self->super._contents = a3;
}

- (void)setError:(id)a3
{
  self->super._tag = 2;
  self->super._contents = a3;
}

@end