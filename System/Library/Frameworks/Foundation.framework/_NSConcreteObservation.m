@interface _NSConcreteObservation
- (BOOL)isEqual:(id)a3;
- (_NSConcreteObservation)initWithObservable:(id)a3 observer:(id)a4;
- (id)debugDescription;
- (void)_observerStorageOfSize:(unint64_t)a3;
- (void)_receiveBox:(id)a3;
- (void)dealloc;
- (void)finishObserving;
- (void)remove;
@end

@implementation _NSConcreteObservation

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0 && (NSObservable *)*((void *)a3 + 1) == self->_LHSobservable) {
    return (NSObserver *)*((void *)a3 + 2) == self->_RHSobserver;
  }
  return 0;
}

- (id)debugDescription
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(%p) (%@ => %@)",  objc_opt_class(),  self,  -[NSObservable debugDescription](self->_LHSobservable, "debugDescription"),  -[NSObserver debugDescription](self->_RHSobserver, "debugDescription"));
}

- (_NSConcreteObservation)initWithObservable:(id)a3 observer:(id)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____NSConcreteObservation;
  v6 = -[_NSConcreteObservation init](&v10, sel_init);
  if (v6)
  {
    v6->_RHSobserver = (NSObserver *)a4;
    v6->_LHSobservable = (NSObservable *)a3;
    if (-[_NSConcreteObservation conformsToProtocol:](v6, "conformsToProtocol:", &unk_18C65FF90))
    {
      if ((-[NSObserver conformsToProtocol:](v6->_RHSobserver, "conformsToProtocol:", &unk_18C65FF90) & 1) == 0) {
        __assert_rtn( "-[_NSConcreteObservation initWithObservable:observer:]",  "NSObserving.m",  113,  "[_RHSobserver conformsToProtocol:@protocol(NSObservable)]");
      }
      v7 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]( (uint64_t)&OBJC_CLASS____NSObserverList,  v6->_RHSobserver,  1);
      v8 = v7;
      if (v7) {
        addObserver((uint64_t)v7, v6);
      }
    }
  }

  return v6;
}

- (void)_observerStorageOfSize:(unint64_t)a3
{
  if (a3 != 32) {
    __assert_rtn("-[_NSConcreteObservation _observerStorageOfSize:]", "NSObserving.m", 126, "sz == 4 * sizeof(id)");
  }
  return self->_observers;
}

- (void)remove
{
  LHSobservable = self->_LHSobservable;
  if (LHSobservable)
  {
    v4 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]( (uint64_t)&OBJC_CLASS____NSObserverList,  LHSobservable,  0);
    if (v4)
    {
      v5 = v4;
      removeObservation((uint64_t)v4, (uint64_t)self->_RHSobserver);
      v4 = v5;
    }
  }

- (void)finishObserving
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[_NSConcreteObservation remove](self, "remove");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSConcreteObservation;
  -[_NSConcreteObservation finishObserving](&v3, sel_finishObserving);
}

- (void)_receiveBox:(id)a3
{
  v11[1] = *MEMORY[0x1895F89C0];
  if ((NSObserver *)*((void *)a3 + 2) == self->_RHSobserver)
  {
    uint64_t v4 = *((void *)a3 + 1);
    int v5 = *((_DWORD *)a3 + 6);
    uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v11);
    MEMORY[0x1895F8858](StackObservedValueClassAndBoxSize);
    v9 = objc_constructInstance(v8, (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    v9[6] = v5;
    *((void *)v9 + 1) = v4;
    *((void *)v9 + 2) = self;
    objc_super v10 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)&OBJC_CLASS____NSObserverList, self, 0);
    [v10 _receiveBox:v9];
  }

  else
  {
    -[NSObservable _receiveBox:](self->_LHSobservable, "_receiveBox:");
  }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[_NSConcreteObservation remove](self, "remove");

  -[_NSConcreteObservation _destroyObserverList](self, "_destroyObserverList");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSConcreteObservation;
  -[_NSConcreteObservation dealloc](&v3, sel_dealloc);
}

@end