@interface NSObserverKeyPath
- (NSString)description;
- (void)_receiveBox:(id)a3;
- (void)finishObserving;
- (void)setObservation:(id)a3;
@end

@implementation NSObserverKeyPath

- (void)_receiveBox:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (*((_DWORD *)a3 + 6) == 1)
  {
    if ([a3 _isToManyChangeInformation])
    {
      uint64_t v5 = [*((id *)a3 + 1) _toManyPropertyType];
      switch(v5)
      {
        case 2LL:
          objc_msgSend( *((id *)a3 + 1),  "applyChangesToOrderedSet:",  -[NSBoundKeyPath mutableOrderedSetValue](self, "mutableOrderedSetValue"));
          break;
        case 1LL:
          objc_msgSend( *((id *)a3 + 1),  "applyChangesToArray:",  -[NSBoundKeyPath mutableArrayValue](self, "mutableArrayValue"));
          break;
        case 0LL:
          objc_msgSend( *((id *)a3 + 1),  "applyChangesToSet:",  -[NSBoundKeyPath mutableSetValue](self, "mutableSetValue"));
          break;
      }
    }

    else
    {
      -[NSBoundKeyPath setValue:](self, "setValue:", *((void *)a3 + 1));
    }
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSObserverKeyPath;
  -[NSObserverKeyPath _receiveBox:](&v6, sel__receiveBox_, a3);
}

- (void)setObservation:(id)a3
{
}

- (void)finishObserving
{
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p> @observer(%@)",  objc_opt_class(),  self,  self->super._keyPath);
}

@end