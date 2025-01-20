@interface GTMTLReplaySharedResourcePool
- (GTMTLReplaySharedResourcePool)initWithDevice:(id)a3 bufferCapacity:(unint64_t)a4;
- (MTLDevice)device;
- (id)newBufferHeapWithLength:(unint64_t)a3;
- (id)newTextureWithDescriptor:(id)a3 error:(id *)a4;
- (unint64_t)defaultBufferCapacity;
- (void)dealloc;
- (void)reclaimAllocatedSize:(unint64_t)a3;
- (void)reclaimBuffer:(id)a3;
- (void)releasePooledBuffers;
- (void)setMaxPooledBuffers:(unint64_t)a3;
- (void)waitUntilCapacity;
@end

@implementation GTMTLReplaySharedResourcePool

- (GTMTLReplaySharedResourcePool)initWithDevice:(id)a3 bufferCapacity:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___GTMTLReplaySharedResourcePool;
  v8 = -[GTMTLReplaySharedResourcePool init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_defaultBufferCapacity = a4;
    pthread_mutex_init(&v9->_mutex, 0LL);
    pthread_cond_init(&v9->_cond, 0LL);
    v9->_maxPooledBuffers = 8LL;
    v10 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  v9->_maxPooledBuffers);
    pooledBuffers = v9->_pooledBuffers;
    v9->_pooledBuffers = v10;

    v9->_maxSize = (unint64_t)(unsigned __int16)word_5B9DE0 << 20;
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTMTLReplaySharedResourcePool;
  -[GTMTLReplaySharedResourcePool dealloc](&v3, "dealloc");
}

- (void)waitUntilCapacity
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  unint64_t maxSize = self->_maxSize;
  unint64_t v5 = atomic_load(&self->_usedSize);
  if (maxSize < v5)
  {
    do
    {
      pthread_cond_wait(&self->_cond, p_mutex);
      unint64_t v6 = self->_maxSize;
      unint64_t v7 = atomic_load(&self->_usedSize);
    }

    while (v6 < v7);
  }

  pthread_mutex_unlock(p_mutex);
}

- (id)newBufferHeapWithLength:(unint64_t)a3
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  p_usedSize = &self->_usedSize;
  do
    unint64_t v7 = __ldaxr(p_usedSize);
  while (__stlxr(v7 + a3, p_usedSize));
  if (self->_defaultBufferCapacity != a3)
  {
    pthread_mutex_unlock(p_mutex);
    goto LABEL_7;
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_pooledBuffers, "lastObject"));
  -[NSMutableArray removeLastObject](self->_pooledBuffers, "removeLastObject");
  pthread_mutex_unlock(p_mutex);
  if (!v8)
  {
LABEL_7:
    id result = -[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", a3, 256LL);
    id v8 = result;
    if (!result) {
      return result;
    }
  }

  v10 = -[GTMTLReplaySharedBufferHeap initWithBuffer:resourcePool:]( objc_alloc(&OBJC_CLASS___GTMTLReplaySharedBufferHeap),  "initWithBuffer:resourcePool:",  v8,  self);

  return v10;
}

- (id)newTextureWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[MTLDevice heapTextureSizeAndAlignWithDescriptor:](self->_device, "heapTextureSizeAndAlignWithDescriptor:", v6);
  unint64_t v8 = (unint64_t)v7;
  if (v7)
  {
    p_usedSize = &self->_usedSize;
    do
      unint64_t v10 = __ldaxr(p_usedSize);
    while (__stlxr((unint64_t)v7 + v10, p_usedSize));
    id v11 = -[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v6);
  }

  else
  {
    v12 = (char *)[v6 pixelFormat];
    if (v12 == (_BYTE *)&stru_1F8.addr + 4) {
      int v13 = 875704438;
    }
    else {
      int v13 = 0;
    }
    unsigned int v14 = [v6 width];
    unsigned int v15 = [v6 height];
    if (v14)
    {
      unsigned int v16 = v15;
      if (v15)
      {
        if (v12 == (_BYTE *)&stru_1F8.addr + 4)
        {
          unint64_t v8 = MinBytesPerRow(v13, v14);
          if (v8)
          {
            if (IsBiplanar(v13))
            {
              unsigned int v17 = (v14 + 1) >> 1;
              unsigned int v18 = MinBytesPerRow(826486840, v14);
              unsigned int v19 = MinBytesPerRow(843264056, v17);
              if (v18 <= v19) {
                unsigned int v20 = v19;
              }
              else {
                unsigned int v20 = v18;
              }
              unint64_t v8 = (v16 + ((v16 + 1) >> 1)) * ((v20 + 15) & 0xFFFFFFF0);
            }

            else
            {
              unint64_t v8 = ((v8 + 15) & 0x1FFFFFFF0LL) * v14;
            }
          }
        }
      }
    }

    v21 = &self->_usedSize;
    do
      unint64_t v22 = __ldaxr(v21);
    while (__stlxr(v22 + v8, v21));
    unsigned int v23 = [v6 width];
    unsigned int v24 = [v6 height];
    unint64_t v25 = 0LL;
    if (v23)
    {
      unsigned int v26 = v24;
      if (v24)
      {
        if (v12 == (_BYTE *)&stru_1F8.addr + 4)
        {
          unint64_t v25 = MinBytesPerRow(v13, v23);
          if (v25)
          {
            v71 = a4;
            Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
            LODWORD(valuePtr) = v23;
            CFNumberRef v28 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
            CFDictionarySetValue(Mutable, kIOSurfaceWidth, v28);
            CFRelease(v28);
            LODWORD(valuePtr) = v26;
            CFNumberRef v29 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
            CFDictionarySetValue(Mutable, kIOSurfaceHeight, v29);
            CFRelease(v29);
            LODWORD(valuePtr) = v13;
            CFNumberRef v30 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
            CFDictionarySetValue(Mutable, kIOSurfacePixelFormat, v30);
            CFRelease(v30);
            if (IsBiplanar(v13))
            {
              unsigned int v67 = BytesPerElement(826486840);
              unsigned int v70 = BytesPerElement(843264056);
              unsigned int v68 = ElementWidth(826486840);
              unsigned int v69 = ElementWidth(843264056);
              unsigned int v31 = MinBytesPerRow(826486840, v23);
              unsigned int v32 = MinBytesPerRow(843264056, (v23 + 1) >> 1);
              if (v31 <= v32) {
                unsigned int v33 = v32;
              }
              else {
                unsigned int v33 = v31;
              }
              unsigned int v34 = (v33 + 15) & 0xFFFFFFF0;
              LODWORD(valuePtr) = v34;
              CFNumberRef v35 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
              CFDictionarySetValue(Mutable, kIOSurfaceBytesPerRow, v35);
              CFRelease(v35);
              LODWORD(valuePtr) = (v26 + ((v26 + 1) >> 1)) * v34;
              CFNumberRef v36 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
              CFDictionarySetValue(Mutable, kIOSurfaceAllocSize, v36);
              CFRelease(v36);
              CFMutableDictionaryRef v37 = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
              CFMutableDictionaryRef valuePtr = v37;
              unsigned int v72 = v23;
              CFNumberRef v38 = CFNumberCreate(0LL, kCFNumberIntType, &v72);
              CFDictionarySetValue(v37, kIOSurfacePlaneWidth, v38);
              CFRelease(v38);
              unsigned int v72 = v26;
              CFNumberRef v39 = CFNumberCreate(0LL, kCFNumberIntType, &v72);
              CFDictionarySetValue(v37, kIOSurfacePlaneHeight, v39);
              CFRelease(v39);
              CFStringRef v66 = kIOSurfacePlaneOffset;
              unsigned int v72 = 0;
              CFNumberRef v40 = CFNumberCreate(0LL, kCFNumberIntType, &v72);
              CFDictionarySetValue(v37, kIOSurfacePlaneOffset, v40);
              CFRelease(v40);
              unsigned int v72 = v34;
              CFNumberRef v41 = CFNumberCreate(0LL, kCFNumberIntType, &v72);
              CFDictionarySetValue(v37, kIOSurfacePlaneBytesPerRow, v41);
              CFRelease(v41);
              unsigned int v72 = v67;
              CFNumberRef v42 = CFNumberCreate(0LL, kCFNumberIntType, &v72);
              CFDictionarySetValue(v37, kIOSurfacePlaneBytesPerElement, v42);
              CFRelease(v42);
              unsigned int v72 = v68;
              CFNumberRef v43 = CFNumberCreate(0LL, kCFNumberIntType, &v72);
              CFDictionarySetValue(v37, kIOSurfacePlaneElementWidth, v43);
              CFRelease(v43);
              v44 = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
              v76 = v44;
              unsigned int v72 = (v23 + 1) >> 1;
              CFNumberRef v45 = CFNumberCreate(0LL, kCFNumberIntType, &v72);
              CFDictionarySetValue(v44, kIOSurfacePlaneWidth, v45);
              CFRelease(v45);
              unsigned int v72 = (v26 + 1) >> 1;
              CFNumberRef v46 = CFNumberCreate(0LL, kCFNumberIntType, &v72);
              CFDictionarySetValue(v44, kIOSurfacePlaneHeight, v46);
              CFRelease(v46);
              unsigned int v72 = v34 * v26;
              CFNumberRef v47 = CFNumberCreate(0LL, kCFNumberIntType, &v72);
              CFDictionarySetValue(v44, kIOSurfacePlaneOffset, v47);
              CFRelease(v47);
              unsigned int v72 = v34;
              v48 = Mutable;
              CFNumberRef v49 = CFNumberCreate(0LL, kCFNumberIntType, &v72);
              CFDictionarySetValue(v44, kIOSurfacePlaneBytesPerRow, v49);
              CFRelease(v49);
              unsigned int v72 = v70;
              CFNumberRef v50 = CFNumberCreate(0LL, kCFNumberIntType, &v72);
              CFDictionarySetValue(v44, kIOSurfacePlaneBytesPerElement, v50);
              CFRelease(v50);
              unsigned int v72 = v69;
              CFNumberRef v51 = CFNumberCreate(0LL, kCFNumberIntType, &v72);
              CFDictionarySetValue(v44, kIOSurfacePlaneElementWidth, v51);
              CFRelease(v51);
              CFArrayRef v52 = CFArrayCreate(0LL, (const void **)&valuePtr, 2LL, &kCFTypeArrayCallBacks);
              CFDictionarySetValue(Mutable, kIOSurfacePlaneInfo, v52);
              CFRelease(v52);
              CFRelease(valuePtr);
              CFNumberRef v53 = v76;
            }

            else
            {
              LODWORD(valuePtr) = (v25 + 15) & 0xFFFFFFF0;
              CFNumberRef v54 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
              v48 = Mutable;
              CFDictionarySetValue(Mutable, kIOSurfaceBytesPerRow, v54);
              CFRelease(v54);
              unint64_t v55 = ElementWidth(v13);
              if (v55 >= 2)
              {
                LODWORD(valuePtr) = v55;
                CFNumberRef v56 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
                CFDictionarySetValue(Mutable, kIOSurfaceElementWidth, v56);
                CFRelease(v56);
              }

              LODWORD(valuePtr) = BytesPerElement(v13);
              CFNumberRef v57 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
              CFDictionarySetValue(Mutable, kIOSurfaceBytesPerElement, v57);
              CFNumberRef v53 = v57;
            }

            CFRelease(v53);
            a4 = v71;
            unint64_t v25 = (unint64_t)IOSurfaceCreate(v48);
            CFRelease(v48);
          }
        }
      }
    }

    id v11 = -[MTLDevice newTextureWithDescriptor:iosurface:plane:]( self->_device,  "newTextureWithDescriptor:iosurface:plane:",  v6,  v25,  0LL,  v66);
  }

  v58 = v11;
  if (v11)
  {
    v59 = -[GTMTLReplaySharedTexture initWithAllocatedSize:resourcePool:]( objc_alloc(&OBJC_CLASS___GTMTLReplaySharedTexture),  "initWithAllocatedSize:resourcePool:",  v8,  self);
    objc_setAssociatedObject(v58, &AssociatedObjectKey, v59, (char *)&dword_0 + 1);
    id v60 = v58;
  }

  else
  {
    v73 = @"GTErrorKeyMTLTextureDescriptor";
    id v61 = SerializeMTLTextureDescriptorToDictionary(v6);
    v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    v74 = v62;
    v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL));

    GTMTLReplay_fillError(a4, 101, v63);
    if (a4) {
      id v64 = *a4;
    }
    else {
      id v64 = 0LL;
    }
    GTMTLReplay_handleNSError(v64);
  }

  return v58;
}

- (void)reclaimBuffer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 length];
  pthread_mutex_lock(&self->_mutex);
  if (v5 == (id)self->_defaultBufferCapacity
    && (unint64_t)-[NSMutableArray count](self->_pooledBuffers, "count") < self->_maxPooledBuffers)
  {
    -[NSMutableArray addObject:](self->_pooledBuffers, "addObject:", v4);
  }

  pthread_mutex_unlock(&self->_mutex);

  p_usedSize = &self->_usedSize;
  do
    unint64_t v7 = __ldaxr(p_usedSize);
  while (__stlxr(v7 - (void)v5, p_usedSize));
  pthread_cond_broadcast(&self->_cond);
}

- (void)reclaimAllocatedSize:(unint64_t)a3
{
  p_usedSize = &self->_usedSize;
  do
    unint64_t v4 = __ldaxr(p_usedSize);
  while (__stlxr(v4 - a3, p_usedSize));
  pthread_cond_broadcast(&self->_cond);
}

- (void)setMaxPooledBuffers:(unint64_t)a3
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  id v6 = (char *)-[NSMutableArray count](self->_pooledBuffers, "count");
  self->_maxPooledBuffers = a3;
  pthread_mutex_unlock(p_mutex);
}

- (void)releasePooledBuffers
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  -[NSMutableArray removeAllObjects](self->_pooledBuffers, "removeAllObjects");
  pthread_mutex_unlock(p_mutex);
}

- (MTLDevice)device
{
  return self->_device;
}

- (unint64_t)defaultBufferCapacity
{
  return self->_defaultBufferCapacity;
}

- (void).cxx_destruct
{
}

@end