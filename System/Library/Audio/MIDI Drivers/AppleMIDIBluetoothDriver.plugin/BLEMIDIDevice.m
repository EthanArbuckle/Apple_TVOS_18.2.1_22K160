@interface BLEMIDIDevice
- (BLEMIDIDataReceiver)dataReceiver;
- (BLEMIDIDevice)init;
- (BLEMIDIDevice)initWithPeripheral:(id)a3 mtu:(unsigned int)a4;
- (CBPeripheral)peripheral;
- (NSString)uuid;
- (id).cxx_construct;
- (int)usage;
- (shared_ptr<BLEIOBuffer>)bufferAtIndex:(unsigned __int8)a3;
- (shared_ptr<BLEIOBuffer>)centralBuffer;
- (unsigned)advanceBuffer;
- (unsigned)dev;
- (unsigned)inEndpoint;
- (unsigned)mtu;
- (unsigned)nextBufferIndex;
- (unsigned)outEndpoint;
- (unsigned)recycleBuffer;
- (void)createBuffers;
- (void)dealloc;
- (void)setCentralBuffer:(shared_ptr<BLEIOBuffer>)a3;
- (void)setDataReceiver:(id)a3;
- (void)setDev:(unsigned int)a3;
- (void)setInEndpoint:(unsigned int)a3;
- (void)setMtu:(unsigned int)a3;
- (void)setNextBufferIndex:(unsigned __int8)a3;
- (void)setOutEndpoint:(unsigned int)a3;
- (void)setPeripheral:(id)a3;
- (void)setUsage:(int)a3;
- (void)setUuid:(id)a3;
@end

@implementation BLEMIDIDevice

- (BLEMIDIDevice)init
{
}

- (void)createBuffers
{
  v11 = self;
  if (self->peripheral)
  {
    sub_422C((uint64_t *)&v11, &self->mtu, &v10);
    sub_3B98((uint64_t)&v11->centralBuffer, &v10);
    v2 = (std::__shared_weak_count *)*((void *)&v10 + 1);
    if (!*((void *)&v10 + 1)) {
      goto LABEL_18;
    }
    v3 = (unint64_t *)(*((void *)&v10 + 1) + 8LL);
    do
      unint64_t v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    goto LABEL_16;
  }

  for (int i = 0; i != 4; ++i)
  {
    sub_422C((uint64_t *)&v11, &v11->mtu, &v10);
    sub_3A58((char **)&v11->localPeripheralBuffers, &v10);
    v6 = (std::__shared_weak_count *)*((void *)&v10 + 1);
    if (*((void *)&v10 + 1))
    {
      v7 = (unint64_t *)(*((void *)&v10 + 1) + 8LL);
      do
        unint64_t v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }

  __int128 v10 = 0uLL;
  sub_3B98((uint64_t)&v11->centralBuffer, &v10);
  v2 = (std::__shared_weak_count *)*((void *)&v10 + 1);
  if (*((void *)&v10 + 1))
  {
    v9 = (unint64_t *)(*((void *)&v10 + 1) + 8LL);
    do
      unint64_t v4 = __ldaxr(v9);
    while (__stlxr(v4 - 1, v9));
LABEL_16:
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }

- (BLEMIDIDevice)initWithPeripheral:(id)a3 mtu:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___BLEMIDIDevice;
  v6 = -[BLEMIDIDevice init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    v6->mtu = 0;
    *(_WORD *)&v6->nextBufferIndex = 0;
    -[BLEMIDIDevice setPeripheral:](v6, "setPeripheral:", a3);
    if (a4) {
      uint64_t v8 = a4;
    }
    else {
      uint64_t v8 = 20LL;
    }
    -[BLEMIDIDevice setMtu:](v7, "setMtu:", v8);
  }

  return v7;
}

- (void)dealloc
{
  peripheral = self->peripheral;
  if (peripheral) {

  }
  dataReceiver = self->dataReceiver;
  if (dataReceiver) {

  }
  uuid = self->uuid;
  if (uuid) {

  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BLEMIDIDevice;
  -[BLEMIDIDevice dealloc](&v6, "dealloc");
}

- (void)setMtu:(unsigned int)a3
{
  if (self->mtu != a3)
  {
    uint64_t end = (uint64_t)self->localPeripheralBuffers.__end_;
    begin = self->localPeripheralBuffers.__begin_;
    ptr = self->centralBuffer.__ptr_;
    self->localPeripheralBuffers.__end_ = begin;
    if (ptr) {
      sub_3D5C(&self->centralBuffer.__ptr_);
    }
    self->mtu = a3;
    -[BLEMIDIDevice createBuffers](self, "createBuffers");
  }

- (shared_ptr<BLEIOBuffer>)bufferAtIndex:(unsigned __int8)a3
{
  begin = self->localPeripheralBuffers.__begin_;
  if (a3 >= (unint64_t)(((char *)self->localPeripheralBuffers.__end_ - (char *)begin) >> 4))
  {
    void *v3 = 0LL;
    v3[1] = 0LL;
  }

  else
  {
    __int128 v5 = begin[a3];
    *(_OWORD *)v3 = v5;
    if (*((void *)&v5 + 1))
    {
      objc_super v6 = (unint64_t *)(*((void *)&v5 + 1) + 8LL);
      do
        unint64_t v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
  }

  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (BLEIOBuffer *)self;
  return result;
}

- (unsigned)advanceBuffer
{
  int nextBufferIndex = self->nextBufferIndex;
  if (!self->peripheral)
  {
    if (nextBufferIndex == 3) {
      LOBYTE(nextBufferIndex) = 0;
    }
    else {
      LOBYTE(nextBufferIndex) = nextBufferIndex + 1;
    }
    self->int nextBufferIndex = nextBufferIndex;
  }

  return nextBufferIndex;
}

- (unsigned)recycleBuffer
{
  unint64_t lastWroteBufferIndex = self->lastWroteBufferIndex;
  if (!self->peripheral)
  {
    begin = self->localPeripheralBuffers.__begin_;
    __int128 v6 = begin[lastWroteBufferIndex];
    v17 = (std::__shared_weak_count *)*((void *)&v6 + 1);
    if (*((void *)&v6 + 1))
    {
      unint64_t v7 = (unint64_t *)(*((void *)&v6 + 1) + 8LL);
      do
        unint64_t v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }

    v9 = (unsigned int *)v6;
    *(_BYTE *)(v6 + 44) = 0;
    bzero(*(void **)(v6 + 24), self->mtu);
    int v10 = self->lastWroteBufferIndex;
    if (v10 == 3) {
      unsigned __int8 v11 = 0;
    }
    else {
      unsigned __int8 v11 = v10 + 1;
    }
    self->unint64_t lastWroteBufferIndex = v11;
    v12 = v9 + 2;
    do
    {
      unsigned int v13 = __ldaxr(v12);
      unsigned int v14 = v13 - 1;
    }

    while (__stlxr(v14, v12));
    if (!v14) {
      (*(void (**)(unsigned int *))(*(void *)v9 + 16LL))(v9);
    }
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        unint64_t v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }

  return lastWroteBufferIndex;
}

- (CBPeripheral)peripheral
{
  return self->peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (unsigned)dev
{
  return self->dev;
}

- (void)setDev:(unsigned int)a3
{
  self->dev = a3;
}

- (unsigned)inEndpoint
{
  return self->inEndpoint;
}

- (void)setInEndpoint:(unsigned int)a3
{
  self->inEndpoint = a3;
}

- (unsigned)outEndpoint
{
  return self->outEndpoint;
}

- (void)setOutEndpoint:(unsigned int)a3
{
  self->outEndpoint = a3;
}

- (BLEMIDIDataReceiver)dataReceiver
{
  return self->dataReceiver;
}

- (void)setDataReceiver:(id)a3
{
}

- (int)usage
{
  return self->usage;
}

- (void)setUsage:(int)a3
{
  self->usage = a3;
}

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
}

- (shared_ptr<BLEIOBuffer>)centralBuffer
{
  cntrl = self->centralBuffer.__cntrl_;
  std::__shared_weak_count *v2 = self->centralBuffer.__ptr_;
  v2[1] = (BLEIOBuffer *)cntrl;
  if (cntrl)
  {
    unint64_t v4 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }

  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (BLEIOBuffer *)self;
  return result;
}

- (void)setCentralBuffer:(shared_ptr<BLEIOBuffer>)a3
{
}

- (unsigned)nextBufferIndex
{
  return self->nextBufferIndex;
}

- (void)setNextBufferIndex:(unsigned __int8)a3
{
  self->int nextBufferIndex = a3;
}

- (unsigned)mtu
{
  return self->mtu;
}

- (void).cxx_destruct
{
  p_localPeripheralBuffers = &self->localPeripheralBuffers;
  sub_41BC((void ***)&p_localPeripheralBuffers);
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0LL;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  return self;
}

@end