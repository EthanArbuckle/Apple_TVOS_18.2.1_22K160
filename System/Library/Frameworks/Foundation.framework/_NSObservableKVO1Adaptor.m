@interface _NSObservableKVO1Adaptor
- (BOOL)isEqual:(id)a3;
- (_NSObservableKVO1Adaptor)initWithObservable:(id)a3 observer:(id)a4 keyPath:(id)a5;
- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 changeKind:(unint64_t)a5 oldValue:(id)a6 newValue:(id)a7 indexes:(id)a8 context:(void *)a9;
- (void)finishObserving;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)remove;
@end

@implementation _NSObservableKVO1Adaptor

- (BOOL)isEqual:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____NSObservableKVO1Adaptor;
  BOOL v5 = -[_NSConcreteObservation isEqual:](&v7, sel_isEqual_);
  if (v5) {
    LOBYTE(v5) = (objc_opt_isKindOfClass() & 1) != 0
  }
              && -[NSBoundKeyPath isEqual:](self->kp, "isEqual:", *((void *)a3 + 7));
  return v5;
}

- (_NSObservableKVO1Adaptor)initWithObservable:(id)a3 observer:(id)a4 keyPath:(id)a5
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____NSObservableKVO1Adaptor;
  uint64_t v8 = -[_NSObservableKVO1Adaptor init](&v14, sel_init);
  if (v8)
  {
    v8->super.super._RHSobserver = (NSObserver *)a4;
    v8->super.super._LHSobservable = (NSObservable *)a3;
    if (-[NSObserver conformsToProtocol:]( v8->super.super._RHSobserver,  "conformsToProtocol:",  &unk_18C661D08)) {
      -[NSObserver setObservation:](v8->super.super._RHSobserver, "setObservation:", v8);
    }
    int v9 = [a5 _wantsChanges];
    v8->emitsChanges = v9;
    if (v9) {
      uint64_t v10 = 39LL;
    }
    else {
      uint64_t v10 = 37LL;
    }
    -[NSObservable addObserver:forKeyPath:options:context:]( v8->super.super._LHSobservable,  "addObserver:forKeyPath:options:context:",  v8,  *((void *)a5 + 2),  v10,  &internalObservationContext);
    v8->kp = (NSObservableKeyPath *)a5;
    if ((-[NSObserver conformsToProtocol:](v8->super.super._RHSobserver, "conformsToProtocol:", &unk_18C65FF90) & 1) == 0) {
      __assert_rtn( "-[_NSObservableKVO1Adaptor initWithObservable:observer:keyPath:]",  "NSObservingKeyPathSupport.m",  412,  "[_RHSobserver conformsToProtocol:@protocol(NSObservable)]");
    }
    v11 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]( (uint64_t)&OBJC_CLASS____NSObserverList,  v8->super.super._RHSobserver,  1);
    v12 = v11;
    if (v11) {
      addObserver((uint64_t)v11, v8);
    }
  }

  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 changeKind:(unint64_t)a5 oldValue:(id)a6 newValue:(id)a7 indexes:(id)a8 context:(void *)a9
{
  if ((id)*MEMORY[0x189605018] == a7) {
    id v10 = 0LL;
  }
  else {
    id v10 = a7;
  }
  if ((id)*MEMORY[0x189605018] == a6) {
    id v11 = 0LL;
  }
  else {
    id v11 = a6;
  }
  _NSKVO1AdaptorDeliver( (uint64_t)self->super.super._LHSobservable,  self->super.super._RHSobserver,  self->emitsChanges,  (uint64_t)v10,  (uint64_t)v11,  a8,  a5,  (uint64_t)a3,  (uint64_t)a4);
}

- (void)remove
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (self->kp)
  {
    -[NSObservable removeObservation:forObservableKeyPath:]( self->super.super._LHSobservable,  "removeObservation:forObservableKeyPath:",  self);

    self->kp = 0LL;
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSObservableKVO1Adaptor;
  -[_NSConcreteObservation remove](&v3, sel_remove);
}

- (void)finishObserving
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (self->kp)
  {
    -[NSObservable removeObservation:forObservableKeyPath:]( self->super.super._LHSobservable,  "removeObservation:forObservableKeyPath:",  self);

    self->kp = 0LL;
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSObservableKVO1Adaptor;
  -[_NSConcreteObservation finishObserving](&v3, sel_finishObserving);
}

@end