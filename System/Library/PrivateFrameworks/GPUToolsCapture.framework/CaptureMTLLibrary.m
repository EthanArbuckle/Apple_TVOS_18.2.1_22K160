@interface CaptureMTLLibrary
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (BOOL)shaderValidationEnabled;
- (CaptureMTLLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (CaptureMTLLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4 captureFunctions:(id)a5;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLCompileOptions)options;
- (MTLDevice)device;
- (MTLLibrary)baseObject;
- (NSArray)externFunctionNames;
- (NSArray)functionNames;
- (NSData)bitcodeData;
- (NSString)description;
- (NSString)installName;
- (NSString)label;
- (NSString)overrideTriple;
- (NSUUID)libraryIdentifier;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newExternFunctionWithName:(id)a3;
- (id)newFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 error:(id *)a5;
- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4;
- (id)newFunctionWithName:(id)a3;
- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5;
- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6;
- (id)originalObject;
- (int64_t)type;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5;
- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 completionHandler:(id)a6;
- (void)setLabel:(id)a3;
- (void)setOptions:(id)a3;
- (void)setOverrideTriple:(id)a3;
- (void)setShaderValidationEnabled:(BOOL)a3;
- (void)touch;
@end

@implementation CaptureMTLLibrary

- (MTLLibrary)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CaptureMTLLibrary;
  v9 = -[CaptureMTLLibrary init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    id v12 = DEVICEOBJECT(v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v11,  (unint64_t)v13,  (unint64_t)v10);

    captureFunctions = v10->_captureFunctions;
    v10->_captureFunctions = 0LL;
  }

  return v10;
}

- (CaptureMTLLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4 captureFunctions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CaptureMTLLibrary;
  id v12 = -[CaptureMTLLibrary init](&v20, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    objc_storeStrong((id *)&v13->_captureDevice, a4);
    v14 = (GTTraceContext *)[v10 traceContext];
    v13->_traceContext = v14;
    id v15 = DEVICEOBJECT(v9);
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v14,  (unint64_t)v16,  (unint64_t)v13);

    v17 = (NSArray *)[v11 copy];
    captureFunctions = v13->_captureFunctions;
    v13->_captureFunctions = v17;
  }

  return v13;
}

- (void)dealloc
{
  baseObject = self->_baseObject;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MTLDebugLibrary, a2);
  if ((objc_opt_isKindOfClass(baseObject, v4) & 1) != 0) {
    ReleaseDebugObject((uint64_t)self->_traceContext, (uint64_t)self->_traceStream, self->_baseObject);
  }
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v15);
  uint64_t v5 = v17;
  *(_DWORD *)(v17 + 8) = -16291;
  unsigned __int8 v6 = v20;
  if (v20 > 0x38uLL)
  {
    uint64_t v8 = *(void *)(v16 + 24);
    uint64_t v9 = v21++;
    id v7 = GTTraceMemPool_allocateBytes(v8, v18, v9 | 0x800000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    id v7 = (char *)(v5 + v20);
    v20 += 8;
  }

  *(_BYTE *)(v5 + 13) = v6;
  id v10 = -[CaptureMTLLibrary traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v7 = var0;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CaptureMTLLibrary;
  -[CaptureMTLLibrary dealloc](&v14, "dealloc");
}

- (id)newExternFunctionWithName:(id)a3
{
  id v4 = a3;
  id v5 = -[MTLLibrarySPI newExternFunctionWithName:](self->_baseObject, "newExternFunctionWithName:", v4);
  unsigned __int8 v6 = v5;
  id v33 = 0LL;
  if (v5)
  {
    if (!-[CaptureMTLDevice newCaptureFunction:associatedWithBaseFunction:captureLibrary:]( self->_captureDevice,  "newCaptureFunction:associatedWithBaseFunction:captureLibrary:",  &v33,  v5,  self)) {
      goto LABEL_16;
    }
    id v5 = v33;
  }

  traceContext = self->_traceContext;
  [v5 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v26);
  uint64_t v8 = v28;
  *(_DWORD *)(v28 + 8) = -16038;
  unsigned __int8 v9 = v31;
  if (v31 > 0x28uLL)
  {
    uint64_t v11 = *(void *)(v27 + 24);
    uint64_t v12 = v32++;
    id v10 = GTTraceMemPool_allocateBytes(v11, v29, v12 | 0x1800000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    id v10 = (char *)(v8 + v31);
    v31 += 24;
  }

  *(_BYTE *)(v8 + 13) = v9;
  SaveMTLFunctionInfo((uint64_t)v26, v6, 0LL);
  uint64_t v13 = -[CaptureMTLLibrary traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v15 = (uint64_t *)[v33 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  id v17 = v4;
  id v18 = [v17 UTF8String];
  if (v18)
  {
    id v19 = v17;
    id v20 = [v19 UTF8String];
    size_t v21 = strlen((const char *)[v19 UTF8String]);
    LOBYTE(v18) = GTTraceEncoder_storeBytes((uint64_t)v26, v20, v21 + 1);
  }

  *(void *)id v10 = var0;
  *((void *)v10 + 1) = v16;
  v10[16] = (char)v18;
  *(_DWORD *)(v10 + 17) = 0;
  *((_DWORD *)v10 + 5) = 0;
  s();
  *(void *)uint64_t v22 = v23;
  *(_BYTE *)(v22 + 8) = v30;
  *(_BYTE *)(v28 + 15) |= 8u;
LABEL_16:
  id v24 = v33;

  return v24;
}

- (id)newFunctionWithName:(id)a3
{
  id v4 = a3;
  id v5 = -[MTLLibrarySPI newFunctionWithName:](self->_baseObject, "newFunctionWithName:", v4);
  unsigned __int8 v6 = v5;
  id v33 = 0LL;
  if (v5)
  {
    if (!-[CaptureMTLDevice newCaptureFunction:associatedWithBaseFunction:captureLibrary:]( self->_captureDevice,  "newCaptureFunction:associatedWithBaseFunction:captureLibrary:",  &v33,  v5,  self)) {
      goto LABEL_16;
    }
    id v5 = v33;
  }

  traceContext = self->_traceContext;
  [v5 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v26);
  uint64_t v8 = v28;
  *(_DWORD *)(v28 + 8) = -16290;
  unsigned __int8 v9 = v31;
  if (v31 > 0x28uLL)
  {
    uint64_t v11 = *(void *)(v27 + 24);
    uint64_t v12 = v32++;
    id v10 = GTTraceMemPool_allocateBytes(v11, v29, v12 | 0x1800000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    id v10 = (char *)(v8 + v31);
    v31 += 24;
  }

  *(_BYTE *)(v8 + 13) = v9;
  SaveMTLFunctionInfo((uint64_t)v26, v6, 0LL);
  uint64_t v13 = -[CaptureMTLLibrary traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v15 = (uint64_t *)[v33 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  id v17 = v4;
  id v18 = [v17 UTF8String];
  if (v18)
  {
    id v19 = v17;
    id v20 = [v19 UTF8String];
    size_t v21 = strlen((const char *)[v19 UTF8String]);
    LOBYTE(v18) = GTTraceEncoder_storeBytes((uint64_t)v26, v20, v21 + 1);
  }

  *(void *)id v10 = var0;
  *((void *)v10 + 1) = v16;
  v10[16] = (char)v18;
  *(_DWORD *)(v10 + 17) = 0;
  *((_DWORD *)v10 + 5) = 0;
  s();
  *(void *)uint64_t v22 = v23;
  *(_BYTE *)(v22 + 8) = v30;
  *(_BYTE *)(v28 + 15) |= 8u;
LABEL_16:
  id v24 = v33;

  return v24;
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 copy];
  id v11 = [v9 copy];

  uint64_t v12 = self;
  baseObject = v12->_baseObject;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = __74__CaptureMTLLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke;
  v18[3] = &unk_20D848;
  v18[4] = v12;
  id v19 = v12;
  id v20 = v10;
  id v21 = v11;
  id v22 = v8;
  id v14 = v8;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  -[MTLLibrarySPI newFunctionWithName:constantValues:completionHandler:]( baseObject,  "newFunctionWithName:constantValues:completionHandler:",  v16,  v15,  v18);
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = -[MTLLibrarySPI newFunctionWithName:constantValues:error:]( self->_baseObject,  "newFunctionWithName:constantValues:error:",  v8,  v9,  a5);
  id v41 = 0LL;
  if (!v10
    || !-[CaptureMTLDevice newCaptureFunction:associatedWithBaseFunction:captureLibrary:]( self->_captureDevice,  "newCaptureFunction:associatedWithBaseFunction:captureLibrary:",  &v41,  v10,  self))
  {
    goto LABEL_18;
  }

  id v11 = -[MTLLibrarySPI newFunctionWithName:](self->_baseObject, "newFunctionWithName:", v8);
  traceContext = self->_traceContext;
  [v41 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v34);
  uint64_t v13 = v36;
  *(_DWORD *)(v36 + 8) = -16107;
  unsigned __int8 v14 = v39;
  if (v39 > 0x20uLL)
  {
    uint64_t v16 = *(void *)(v35 + 24);
    uint64_t v17 = v40++;
    id v15 = GTTraceMemPool_allocateBytes(v16, v37, v17 | 0x2000000000LL) + 16;
    unsigned __int8 v14 = v17;
  }

  else
  {
    id v15 = (char *)(v13 + v39);
    v39 += 32;
  }

  *(_BYTE *)(v13 + 13) = v14;
  SaveMTLFunctionInfo((uint64_t)v34, v10, v11);
  id v18 = -[CaptureMTLLibrary traceStream](self, "traceStream");
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v20 = (uint64_t *)[v41 traceStream];
  if (!v20)
  {
    uint64_t v21 = 0LL;
    if (a5) {
      goto LABEL_11;
    }
LABEL_13:
    id v22 = 0LL;
    goto LABEL_14;
  }

  uint64_t v21 = *v20;
  if (!a5) {
    goto LABEL_13;
  }
LABEL_11:
  id v22 = *a5;
LABEL_14:
  id v23 = v8;
  if ([v23 UTF8String])
  {
    id v24 = v23;
    id v25 = [v24 UTF8String];
    size_t v26 = strlen((const char *)[v24 UTF8String]);
    char v27 = GTTraceEncoder_storeBytes((uint64_t)v34, v25, v26 + 1);
  }

  else
  {
    char v27 = 0;
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v11 functionConstantsDictionary]);
  char v29 = SaveMTLFunctionConstantValues((uint64_t)v34, v28, v9);
  *(void *)id v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = v22;
  v15[24] = v27;
  v15[25] = v29;
  *(_DWORD *)(v15 + 26) = 0;
  *((_WORD *)v15 + 15) = 0;

  s();
  *(void *)uint64_t v30 = v31;
  *(_BYTE *)(v30 + 8) = v38;
  *(_BYTE *)(v36 + 15) |= 8u;

LABEL_18:
  id v32 = v41;

  return v32;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  baseObject = self->_baseObject;
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  id v15 = -[MTLLibrarySPI newFunctionWithName:constantValues:pipelineLibrary:error:]( baseObject,  "newFunctionWithName:constantValues:pipelineLibrary:error:",  v10,  v11,  v14,  a6);

  id v48 = 0LL;
  if (!v15
    || !-[CaptureMTLDevice newCaptureFunction:associatedWithBaseFunction:captureLibrary:]( self->_captureDevice,  "newCaptureFunction:associatedWithBaseFunction:captureLibrary:",  &v48,  v15,  self))
  {
    goto LABEL_21;
  }

  id v16 = -[MTLLibrarySPI newFunctionWithName:](self->_baseObject, "newFunctionWithName:", v10);
  traceContext = self->_traceContext;
  [v48 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v41);
  uint64_t v18 = v43;
  *(_DWORD *)(v43 + 8) = -16082;
  unsigned __int8 v19 = v46;
  if (v46 > 0x18uLL)
  {
    uint64_t v21 = *(void *)(v42 + 24);
    uint64_t v22 = v47++;
    id v20 = GTTraceMemPool_allocateBytes(v21, v44, v22 | 0x2800000000LL) + 16;
    unsigned __int8 v19 = v22;
  }

  else
  {
    id v20 = (char *)(v18 + v46);
    v46 += 40;
  }

  *(_BYTE *)(v18 + 13) = v19;
  SaveMTLFunctionInfo((uint64_t)v41, v15, v16);
  id v23 = -[CaptureMTLLibrary traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v24 = (uint64_t *)[v48 traceStream];
  if (v24) {
    uint64_t v39 = *v24;
  }
  else {
    uint64_t v39 = 0LL;
  }
  id v25 = (uint64_t *)[v12 traceStream];
  if (!v25)
  {
    uint64_t v26 = 0LL;
    if (a6) {
      goto LABEL_14;
    }
LABEL_16:
    id v27 = 0LL;
    goto LABEL_17;
  }

  uint64_t v26 = *v25;
  if (!a6) {
    goto LABEL_16;
  }
LABEL_14:
  id v27 = *a6;
LABEL_17:
  id v28 = v10;
  if ([v28 UTF8String])
  {
    id v29 = v28;
    id v30 = [v29 UTF8String];
    size_t v31 = strlen((const char *)[v29 UTF8String]);
    char v32 = GTTraceEncoder_storeBytes((uint64_t)v41, v30, v31 + 1);
  }

  else
  {
    char v32 = 0;
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue([v16 functionConstantsDictionary]);
  char v34 = SaveMTLFunctionConstantValues((uint64_t)v41, v33, v11);
  *(void *)id v20 = var0;
  *((void *)v20 + 1) = v39;
  *((void *)v20 + 2) = v26;
  *((void *)v20 + 3) = v27;
  v20[32] = v32;
  v20[33] = v34;
  *(_DWORD *)(v20 + 34) = 0;
  *((_WORD *)v20 + 19) = 0;

  s();
  *(void *)uint64_t v35 = v36;
  *(_BYTE *)(v35 + 8) = v45;
  *(_BYTE *)(v43 + 15) |= 8u;

LABEL_21:
  id v37 = v48;

  return v37;
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = [a3 copy];
  id v14 = [v12 copy];

  id v15 = self;
  baseObject = v15->_baseObject;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = __90__CaptureMTLLibrary_newFunctionWithName_constantValues_pipelineLibrary_completionHandler___block_invoke;
  v23[3] = &unk_20D870;
  v23[4] = v15;
  id v24 = v15;
  id v25 = v13;
  id v26 = v14;
  id v27 = v10;
  id v28 = v11;
  id v18 = v11;
  id v19 = v10;
  id v20 = v14;
  id v21 = v13;
  uint64_t v22 = v15;
  -[MTLLibrarySPI newFunctionWithName:constantValues:pipelineLibrary:completionHandler:]( baseObject,  "newFunctionWithName:constantValues:pipelineLibrary:completionHandler:",  v21,  v20,  v17,  v23);
}

- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  baseObject = self->_baseObject;
  id v8 = unwrapMTLFunctionDescriptor(v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = -[MTLLibrarySPI newFunctionWithDescriptor:error:](baseObject, "newFunctionWithDescriptor:error:", v9, a4);

  id v62 = 0LL;
  if (v10)
  {
    -[CaptureMTLDevice newCaptureFunction:associatedWithBaseFunction:captureLibrary:]( self->_captureDevice,  "newCaptureFunction:associatedWithBaseFunction:captureLibrary:",  &v62,  v10,  self);
    s();
    id v12 = v11;
    if (v13)
    {
      traceContext = self->_traceContext;
      p_var2 = &traceContext->var2;
      do
        unint64_t v16 = __ldaxr(p_var2);
      while (__stlxr(v16 + 1, p_var2));
      v53 = traceContext;
      uint64_t v54 = 0LL;
      uint64_t v55 = 0LL;
      unint64_t v56 = v16;
      unint64_t v17 = *v11;
      unint64_t *v11 = v16;
      unint64_t v57 = v17;
      char v58 = *((_BYTE *)v11 + 8);
      __int16 v59 = 16400;
      int v60 = 0;
      char v61 = 0;
      GTTraceEncoder_setStream((uint64_t *)&v53, (uint64_t)[v62 traceStream]);
      uint64_t v18 = v55;
      *(_DWORD *)(v55 + 8) = -15608;
      char v19 = v59;
      if (v59 > 0x20uLL)
      {
        uint64_t v28 = *(void *)(v54 + 24);
        uint64_t v29 = HIBYTE(v59);
        ++HIBYTE(v59);
        id v20 = GTTraceMemPool_allocateBytes(v28, v56, v29 | 0x2000000000LL) + 16;
        char v19 = v29;
      }

      else
      {
        id v20 = (char *)(v18 + v59);
        LOBYTE(v59) = v59 + 32;
      }

      *(_BYTE *)(v18 + 13) = v19;
      id v30 = self->_baseObject;
      size_t v31 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      id v32 = -[MTLLibrarySPI newFunctionWithName:](v30, "newFunctionWithName:", v31);

      SaveMTLFunctionInfo((uint64_t)&v53, v10, v32);
      id v33 = -[CaptureMTLLibrary traceStream](self, "traceStream");
      if (v33) {
        unint64_t var0 = v33->var0;
      }
      else {
        unint64_t var0 = 0LL;
      }
      uint64_t v42 = (uint64_t *)[v62 traceStream];
      if (v42)
      {
        uint64_t v43 = *v42;
        if (!a4)
        {
LABEL_21:
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v32 functionConstantsDictionary]);
          char v45 = SaveMTLFunctionDescriptor((uint64_t)&v53, v6, v44);
          *(void *)id v20 = var0;
          *((void *)v20 + 1) = v43;
          *((void *)v20 + 2) = a4;
          v20[24] = v45;
          *(_DWORD *)(v20 + 25) = 0;
          *((_DWORD *)v20 + 7) = 0;

          *id v12 = v57;
          *((_BYTE *)v12 + 8) = v58;
          *(_BYTE *)(v55 + 15) |= 8u;

          goto LABEL_29;
        }
      }

      else
      {
        uint64_t v43 = 0LL;
        if (!a4) {
          goto LABEL_21;
        }
      }

      a4 = (id *)*a4;
      goto LABEL_21;
    }

    id v21 = self->_traceContext;
    uint64_t v22 = &v21->var2;
    do
      unint64_t v23 = __ldaxr(v22);
    while (__stlxr(v23 + 1, v22));
    v53 = v21;
    uint64_t v54 = 0LL;
    uint64_t v55 = 0LL;
    unint64_t v56 = v23;
    unint64_t v24 = *v11;
    unint64_t *v11 = v23;
    unint64_t v57 = v24;
    char v58 = *((_BYTE *)v11 + 8);
    __int16 v59 = 16400;
    int v60 = 0;
    char v61 = 0;
    GTTraceEncoder_setStream((uint64_t *)&v53, (uint64_t)[v62 traceStream]);
    uint64_t v25 = v55;
    *(_DWORD *)(v55 + 8) = -10157;
    char v26 = v59;
    if (v59 > 0x28uLL)
    {
      uint64_t v35 = *(void *)(v54 + 24);
      uint64_t v36 = HIBYTE(v59);
      ++HIBYTE(v59);
      id v27 = GTTraceMemPool_allocateBytes(v35, v56, v36 | 0x1800000000LL) + 16;
      char v26 = v36;
    }

    else
    {
      id v27 = (char *)(v25 + v59);
      LOBYTE(v59) = v59 + 24;
    }

    *(_BYTE *)(v25 + 13) = v26;
    id v37 = self->_baseObject;
    char v38 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    id v39 = -[MTLLibrarySPI newFunctionWithName:](v37, "newFunctionWithName:", v38);

    unsigned __int8 v40 = (uint64_t *)[v62 traceStream];
    if (v40) {
      uint64_t v41 = *v40;
    }
    else {
      uint64_t v41 = 0LL;
    }
    unsigned __int8 v46 = (void *)objc_claimAutoreleasedReturnValue([v62 captureLibrary]);
    unsigned __int8 v47 = (uint64_t *)[v46 traceStream];
    if (v47) {
      uint64_t v48 = *v47;
    }
    else {
      uint64_t v48 = 0LL;
    }
    v49 = (void *)objc_claimAutoreleasedReturnValue([v39 functionConstantsDictionary]);
    char v50 = SaveMTLFunctionDescriptor((uint64_t)&v53, v6, v49);
    *(void *)id v27 = v41;
    *((void *)v27 + 1) = v48;
    v27[16] = v50;
    *(_DWORD *)(v27 + 17) = 0;
    *((_DWORD *)v27 + 5) = 0;

    *id v12 = v57;
    *((_BYTE *)v12 + 8) = v58;
    *(_BYTE *)(v55 + 15) |= 8u;
  }

- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  baseObject = v8->_baseObject;
  id v10 = unwrapMTLFunctionDescriptor(v6);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __65__CaptureMTLLibrary_newFunctionWithDescriptor_completionHandler___block_invoke;
  v15[3] = &unk_20D898;
  v15[4] = v8;
  unint64_t v16 = v8;
  id v17 = v6;
  id v18 = v7;
  id v12 = v7;
  id v13 = v6;
  id v14 = v8;
  -[MTLLibrarySPI newFunctionWithDescriptor:completionHandler:]( baseObject,  "newFunctionWithDescriptor:completionHandler:",  v11,  v15);
}

- (id)originalObject
{
  return DEVICEOBJECT(self->_baseObject);
}

- (void)touch
{
  traceStream = self->_traceStream;
  uint64_t v3 = mach_absolute_time();
  if (traceStream)
  {
    p_var1 = &traceStream[1].var1;
    unint64_t v5 = atomic_load(&traceStream[1].var1);
    while (1)
    {
      unint64_t v6 = __ldaxr(p_var1);
      if (v6 != v5) {
        break;
      }
      if (__stlxr(v5 & 0x1F | v3 & 0xFFFFFFFFFFFFFFE0LL, p_var1)) {
        goto LABEL_7;
      }
      int v7 = 1;
LABEL_8:
      unint64_t v5 = v6;
      if (v7) {
        return;
      }
    }

    __clrex();
LABEL_7:
    int v7 = 0;
    goto LABEL_8;
  }

- (GTTraceContext)traceContext
{
  return self->_traceContext;
}

- (GTTraceStream)traceStream
{
  return self->_traceStream;
}

- (unint64_t)streamReference
{
  traceStream = self->_traceStream;
  if (traceStream) {
    return traceStream->var0;
  }
  else {
    return 0LL;
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_baseObject;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLLibrary;
  uint64_t v3 = -[CaptureMTLLibrary description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLLibrarySPI description](self->_baseObject, "description"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ -> %@", v4, v5));

  return (NSString *)v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return CaptureRespondsToSelector((uint64_t)self->_baseObject, a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = -[MTLLibrarySPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (NSData)bitcodeData
{
  return (NSData *)-[MTLLibrarySPI bitcodeData](self->_baseObject, "bitcodeData");
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (NSArray)externFunctionNames
{
  return (NSArray *)-[MTLLibrarySPI externFunctionNames](self->_baseObject, "externFunctionNames");
}

- (NSArray)functionNames
{
  return (NSArray *)-[MTLLibrarySPI functionNames](self->_baseObject, "functionNames");
}

- (NSString)installName
{
  return (NSString *)-[MTLLibrarySPI installName](self->_baseObject, "installName");
}

- (NSString)label
{
  return (NSString *)-[MTLLibrarySPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLLibrarySPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16292;
  unsigned __int8 v6 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v19[1] + 24LL);
    uint64_t v9 = v24++;
    int v7 = GTTraceMemPool_allocateBytes(v8, v21, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    int v7 = (char *)(v5 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  id v10 = -[CaptureMTLLibrary traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)v19, v15, v16 + 1);
  }

  *(void *)int v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (NSUUID)libraryIdentifier
{
  return (NSUUID *)-[MTLLibrarySPI libraryIdentifier](self->_baseObject, "libraryIdentifier");
}

- (NSString)overrideTriple
{
  return (NSString *)-[MTLLibrarySPI overrideTriple](self->_baseObject, "overrideTriple");
}

- (void)setOverrideTriple:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLLibrarySPI setOverrideTriple:](self->_baseObject, "setOverrideTriple:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16083;
  unsigned __int8 v6 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v19[1] + 24LL);
    uint64_t v9 = v24++;
    int v7 = GTTraceMemPool_allocateBytes(v8, v21, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    int v7 = (char *)(v5 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  id v10 = -[CaptureMTLLibrary traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)v19, v15, v16 + 1);
  }

  *(void *)int v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (BOOL)shaderValidationEnabled
{
  return -[MTLLibrarySPI shaderValidationEnabled](self->_baseObject, "shaderValidationEnabled");
}

- (void)setShaderValidationEnabled:(BOOL)a3
{
}

- (int64_t)type
{
  return (int64_t)-[MTLLibrarySPI type](self->_baseObject, "type");
}

- (id)newFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLLibrary_newFunctionWithDescriptor_destinationArchive_error",  (uint64_t)"Binary Linking",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v11 = unwrapMTLFunctionDescriptor(v9);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  id v14 = -[MTLLibrarySPI newFunctionWithDescriptor:destinationArchive:error:]( baseObject,  "newFunctionWithDescriptor:destinationArchive:error:",  v12,  v13,  a5);

  if (v14)
  {
    id v15 = objc_alloc(&OBJC_CLASS___CaptureMTLFunction);
    size_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLLibrary device](self, "device"));
    uint64_t v17 = -[CaptureMTLFunction initWithBaseObject:captureDevice:](v15, "initWithBaseObject:captureDevice:", v14, v16);
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return v17;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  return -[MTLLibrarySPI serializeToURL:error:](self->_baseObject, "serializeToURL:error:", a3, a4);
}

- (MTLCompileOptions)options
{
  return self->options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

void __65__CaptureMTLLibrary_newFunctionWithDescriptor_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v62 = 0LL;
  if (v5)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) newCaptureFunction:&v62 associatedWithBaseFunction:v5 captureLibrary:*(void *)(a1 + 40)];
    s();
    id v8 = (uint64_t *)v7;
    if (v9)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24LL);
      id v11 = (unint64_t *)(v10 + 72);
      do
        unint64_t v12 = __ldaxr(v11);
      while (__stlxr(v12 + 1, v11));
      uint64_t v53 = v10;
      uint64_t v54 = 0LL;
      uint64_t v55 = 0LL;
      unint64_t v56 = v12;
      unint64_t v13 = *v7;
      *int v7 = v12;
      unint64_t v57 = v13;
      char v58 = *((_BYTE *)v7 + 8);
      __int16 v59 = 16400;
      int v60 = 0;
      char v61 = 0;
      GTTraceEncoder_setStream(&v53, (uint64_t)[v62 traceStream]);
      uint64_t v14 = v55;
      *(_DWORD *)(v55 + 8) = -15609;
      char v15 = v59;
      if (v59 > 0x20uLL)
      {
        uint64_t v26 = *(void *)(v54 + 24);
        uint64_t v27 = HIBYTE(v59);
        ++HIBYTE(v59);
        size_t v16 = GTTraceMemPool_allocateBytes(v26, v56, v27 | 0x2000000000LL) + 16;
        char v15 = v27;
      }

      else
      {
        size_t v16 = (char *)(v14 + v59);
        LOBYTE(v59) = v59 + 32;
      }

      *(_BYTE *)(v14 + 13) = v15;
      uint64_t v28 = *(void **)(*(void *)(a1 + 32) + 8LL);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "name", v6));
      id v30 = [v28 newFunctionWithName:v29];

      SaveMTLFunctionInfo((uint64_t)&v53, v5, v30);
      size_t v31 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
      if (v31) {
        uint64_t v32 = *v31;
      }
      else {
        uint64_t v32 = 0LL;
      }
      unsigned __int8 v40 = (uint64_t *)[v62 traceStream];
      if (v40) {
        uint64_t v41 = *v40;
      }
      else {
        uint64_t v41 = 0LL;
      }
      char v45 = *(void **)(a1 + 48);
      unsigned __int8 v46 = (void *)objc_claimAutoreleasedReturnValue([v30 functionConstantsDictionary]);
      char v47 = SaveMTLFunctionDescriptor((uint64_t)&v53, v45, v46);
      *(void *)size_t v16 = v32;
      *((void *)v16 + 1) = v41;
      *((void *)v16 + 2) = 0LL;
      v16[24] = v47;
      *(_DWORD *)(v16 + 25) = 0;
      *((_DWORD *)v16 + 7) = 0;

      uint64_t v18 = v56;
      *id v8 = v57;
      *((_BYTE *)v8 + 8) = v58;
      *(_BYTE *)(v55 + 15) |= 8u;
    }

    else
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 24LL);
      uint64_t v20 = (unint64_t *)(v19 + 72);
      do
        unint64_t v21 = __ldaxr(v20);
      while (__stlxr(v21 + 1, v20));
      uint64_t v53 = v19;
      uint64_t v54 = 0LL;
      uint64_t v55 = 0LL;
      unint64_t v56 = v21;
      unint64_t v22 = *v7;
      *int v7 = v21;
      unint64_t v57 = v22;
      char v58 = *((_BYTE *)v7 + 8);
      __int16 v59 = 16400;
      int v60 = 0;
      char v61 = 0;
      GTTraceEncoder_setStream(&v53, (uint64_t)[v62 traceStream]);
      uint64_t v23 = v55;
      *(_DWORD *)(v55 + 8) = -10157;
      char v24 = v59;
      if (v59 > 0x28uLL)
      {
        uint64_t v33 = *(void *)(v54 + 24);
        uint64_t v34 = HIBYTE(v59);
        ++HIBYTE(v59);
        uint64_t v25 = GTTraceMemPool_allocateBytes(v33, v56, v34 | 0x1800000000LL) + 16;
        char v24 = v34;
      }

      else
      {
        uint64_t v25 = (char *)(v23 + v59);
        LOBYTE(v59) = v59 + 24;
      }

      *(_BYTE *)(v23 + 13) = v24;
      uint64_t v35 = *(void **)(*(void *)(a1 + 32) + 8LL);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "name", v6));
      id v37 = [v35 newFunctionWithName:v36];

      char v38 = (uint64_t *)[v62 traceStream];
      if (v38) {
        uint64_t v39 = *v38;
      }
      else {
        uint64_t v39 = 0LL;
      }
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v62 captureLibrary]);
      uint64_t v43 = (uint64_t *)[v42 traceStream];
      if (v43) {
        uint64_t v44 = *v43;
      }
      else {
        uint64_t v44 = 0LL;
      }
      uint64_t v48 = *(void **)(a1 + 48);
      v49 = (void *)objc_claimAutoreleasedReturnValue([v37 functionConstantsDictionary]);
      char v50 = SaveMTLFunctionDescriptor((uint64_t)&v53, v48, v49);
      *(void *)uint64_t v25 = v39;
      *((void *)v25 + 1) = v44;
      v25[16] = v50;
      *(_DWORD *)(v25 + 17) = 0;
      *((_DWORD *)v25 + 5) = 0;

      *id v8 = v57;
      *((_BYTE *)v8 + 8) = v58;
      *(_BYTE *)(v55 + 15) |= 8u;

      uint64_t v18 = 0LL;
    }

    id v6 = v52;
  }

  else
  {
    s();
    id v8 = v17;
    uint64_t v18 = 0LL;
  }

  uint64_t v51 = *v8;
  *id v8 = v18;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  *id v8 = v51;
}

void __90__CaptureMTLLibrary_newFunctionWithName_constantValues_pipelineLibrary_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v39 = 0LL;
  if (v5
    && [*(id *)(*(void *)(a1 + 32) + 16) newCaptureFunction:&v39 associatedWithBaseFunction:v5 captureLibrary:*(void *)(a1 + 40)])
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) baseObject]);
    id v8 = [v7 newFunctionWithName:*(void *)(a1 + 48)];

    id v9 = [*(id *)(a1 + 40) traceContext];
    [v39 traceStream];
    GTTraceContext_pushEncoderWithStream((uint64_t)v9, (uint64_t)v32);
    uint64_t v10 = v34;
    *(_DWORD *)(v34 + 8) = -16081;
    unsigned __int8 v11 = v37;
    if (v37 > 0x18uLL)
    {
      uint64_t v14 = *(void *)(v33 + 24);
      uint64_t v15 = v38++;
      unint64_t v12 = GTTraceMemPool_allocateBytes(v14, v35, v15 | 0x2800000000LL) + 16;
      unsigned __int8 v11 = v15;
    }

    else
    {
      unint64_t v12 = (char *)(v10 + v37);
      v37 += 40;
    }

    *(_BYTE *)(v10 + 13) = v11;
    SaveMTLFunctionInfo((uint64_t)v32, v5, v8);
    size_t v16 = [*(id *)(a1 + 40) traceStream];
    if (v16) {
      uint64_t v17 = (uint64_t *)objc_msgSend(v39, "traceStream", *v16);
    }
    else {
      uint64_t v17 = (uint64_t *)objc_msgSend(v39, "traceStream", 0);
    }
    if (v17) {
      uint64_t v18 = *v17;
    }
    else {
      uint64_t v18 = 0LL;
    }
    uint64_t v19 = (uint64_t *)[*(id *)(a1 + 64) traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0LL;
    }
    if ([*(id *)(a1 + 48) UTF8String])
    {
      id v21 = [*(id *)(a1 + 48) UTF8String];
      size_t v22 = strlen((const char *)[*(id *)(a1 + 48) UTF8String]);
      char v23 = GTTraceEncoder_storeBytes((uint64_t)v32, v21, v22 + 1);
    }

    else
    {
      char v23 = 0;
    }

    char v24 = (void *)objc_claimAutoreleasedReturnValue([v8 functionConstantsDictionary]);
    char v25 = SaveMTLFunctionConstantValues((uint64_t)v32, v24, *(void **)(a1 + 56));
    *(void *)unint64_t v12 = v31;
    *((void *)v12 + 1) = v18;
    *((void *)v12 + 2) = v20;
    *((void *)v12 + 3) = 0LL;
    v12[32] = v23;
    v12[33] = v25;
    *(_DWORD *)(v12 + 34) = 0;
    *((_WORD *)v12 + 19) = 0;

    uint64_t v13 = v35;
    [*(id *)(a1 + 40) traceContext];
    s();
    *(void *)uint64_t v26 = v27;
    *(_BYTE *)(v26 + 8) = v36;
    *(_BYTE *)(v34 + 15) |= 8u;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  s();
  uint64_t v29 = v28;
  uint64_t v30 = *v28;
  *uint64_t v28 = v13;
  (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
  *uint64_t v29 = v30;
}

void __74__CaptureMTLLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v37 = 0LL;
  if (v5
    && [*(id *)(*(void *)(a1 + 32) + 16) newCaptureFunction:&v37 associatedWithBaseFunction:v5 captureLibrary:*(void *)(a1 + 40)])
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) baseObject]);
    id v8 = [v7 newFunctionWithName:*(void *)(a1 + 48)];

    id v9 = [*(id *)(a1 + 40) traceContext];
    [v37 traceStream];
    GTTraceContext_pushEncoderWithStream((uint64_t)v9, (uint64_t)v30);
    uint64_t v10 = v32;
    *(_DWORD *)(v32 + 8) = -16106;
    unsigned __int8 v11 = v35;
    if (v35 > 0x20uLL)
    {
      uint64_t v14 = *(void *)(v31 + 24);
      uint64_t v15 = v36++;
      unint64_t v12 = GTTraceMemPool_allocateBytes(v14, v33, v15 | 0x2000000000LL) + 16;
      unsigned __int8 v11 = v15;
    }

    else
    {
      unint64_t v12 = (char *)(v10 + v35);
      v35 += 32;
    }

    *(_BYTE *)(v10 + 13) = v11;
    SaveMTLFunctionInfo((uint64_t)v30, v5, v8);
    size_t v16 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
    if (v16) {
      uint64_t v17 = *v16;
    }
    else {
      uint64_t v17 = 0LL;
    }
    uint64_t v18 = (uint64_t *)[v37 traceStream];
    if (v18) {
      uint64_t v19 = *v18;
    }
    else {
      uint64_t v19 = 0LL;
    }
    if ([*(id *)(a1 + 48) UTF8String])
    {
      id v20 = [*(id *)(a1 + 48) UTF8String];
      size_t v21 = strlen((const char *)[*(id *)(a1 + 48) UTF8String]);
      char v22 = GTTraceEncoder_storeBytes((uint64_t)v30, v20, v21 + 1);
    }

    else
    {
      char v22 = 0;
    }

    char v23 = (void *)objc_claimAutoreleasedReturnValue([v8 functionConstantsDictionary]);
    char v24 = SaveMTLFunctionConstantValues((uint64_t)v30, v23, *(void **)(a1 + 56));
    *(void *)unint64_t v12 = v17;
    *((void *)v12 + 1) = v19;
    *((void *)v12 + 2) = 0LL;
    v12[24] = v22;
    v12[25] = v24;
    *(_DWORD *)(v12 + 26) = 0;
    *((_WORD *)v12 + 15) = 0;

    uint64_t v13 = v33;
    [*(id *)(a1 + 40) traceContext];
    s();
    *(void *)uint64_t v25 = v26;
    *(_BYTE *)(v25 + 8) = v34;
    *(_BYTE *)(v32 + 15) |= 8u;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  s();
  uint64_t v28 = v27;
  uint64_t v29 = *v27;
  *uint64_t v27 = v13;
  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  *uint64_t v28 = v29;
}

@end