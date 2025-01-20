@interface CGPDFPageImpl
- (CGPDFPageImpl)initWithCGPDFPage:(CGPDFPage *)a3 requestQueue:(id)a4;
- (CGRect)rectForBox:(int)a3;
- (int64_t)rotation;
- (void)dealloc;
- (void)drawWithBox:(int)a3 size:(CGSize)a4 colorSpace:(id)a5 options:(id)a6 completion:(id)a7;
- (void)getBoxRect:(int)a3 completion:(id)a4;
- (void)getIdentifier:(id)a3;
- (void)getPageText:(id)a3;
- (void)getRotation:(id)a3;
@end

@implementation CGPDFPageImpl

- (CGPDFPageImpl)initWithCGPDFPage:(CGPDFPage *)a3 requestQueue:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CGPDFPageImpl;
  v8 = -[CGPDFPageImpl init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_requestQueue, a4);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v10;

    v9->_cgPage = CGPDFPageRetain(a3);
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CGPDFPageImpl;
  -[CGPDFPageImpl dealloc](&v3, "dealloc");
}

- (int64_t)rotation
{
  int v2 = CGPDFPageGetRotationAngle(self->_cgPage) % 360;
  if (v2 >= 0) {
    return v2;
  }
  else {
    return (v2 + 360);
  }
}

- (CGRect)rectForBox:(int)a3
{
  return CGPDFPageGetBoxRect(self->_cgPage, (CGPDFBox)a3);
}

- (void)getIdentifier:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __31__CGPDFPageImpl_getIdentifier___block_invoke;
  v7[3] = &unk_100004268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[NSOperationQueue addOperationWithBlock:](requestQueue, "addOperationWithBlock:", v7);
}

uint64_t __31__CGPDFPageImpl_getIdentifier___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(*(void *)(a1 + 32) + 16LL));
}

- (void)getRotation:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __29__CGPDFPageImpl_getRotation___block_invoke;
  v7[3] = &unk_100004268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[NSOperationQueue addOperationWithBlock:](requestQueue, "addOperationWithBlock:", v7);
}

uint64_t __29__CGPDFPageImpl_getRotation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, id))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  [*(id *)(a1 + 32) rotation]);
}

- (void)getBoxRect:(int)a3 completion:(id)a4
{
  id v6 = a4;
  requestQueue = self->_requestQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __39__CGPDFPageImpl_getBoxRect_completion___block_invoke;
  v9[3] = &unk_100004290;
  v9[4] = self;
  id v10 = v6;
  int v11 = a3;
  id v8 = v6;
  -[NSOperationQueue addOperationWithBlock:](requestQueue, "addOperationWithBlock:", v9);
}

uint64_t __39__CGPDFPageImpl_getBoxRect_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) rectForBox:*(unsigned int *)(a1 + 48)];
  return (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
}

- (void)drawWithBox:(int)a3 size:(CGSize)a4 colorSpace:(id)a5 options:(id)a6 completion:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  requestQueue = self->_requestQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = __64__CGPDFPageImpl_drawWithBox_size_colorSpace_options_completion___block_invoke;
  v20[3] = &unk_1000042B8;
  CGFloat v25 = width;
  CGFloat v26 = height;
  id v21 = v13;
  v22 = self;
  int v27 = a3;
  id v23 = v14;
  id v24 = v15;
  id v17 = v14;
  id v18 = v15;
  id v19 = v13;
  -[NSOperationQueue addOperationWithBlock:](requestQueue, "addOperationWithBlock:", v20);
}

void __64__CGPDFPageImpl_drawWithBox_size_colorSpace_options_completion___block_invoke(uint64_t a1)
{
  CGColorSpaceRef v10 = 0LL;
  int v2 = *(const void **)(a1 + 32);
  if (!v2 || (v3 = CGColorSpaceCreateWithPropertyList(v2), (CGColorSpaceRef v10 = v3) == 0LL))
  {
    CGColorSpaceRef v3 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
    CGColorSpaceRef v10 = v3;
  }

  uint64_t v4 = CGBitmapContextCreateWithShareableMappedData( vcvtpd_u64_f64(*(double *)(a1 + 64)),  vcvtpd_u64_f64(*(double *)(a1 + 72)),  v3,  &size);
  v5 = (CGContext *)v4;
  if (v4)
  {
    CGContextClear(v4);
    CGContextDrawPDFPageWithOptions( v5,  *(void *)(*(void *)(a1 + 40) + 24LL),  *(unsigned int *)(a1 + 80),  *(void *)(a1 + 48),  *(double *)(a1 + 64),  *(double *)(a1 + 72));
    Data = CGBitmapContextGetData(v5);
    dispatch_data_t v7 = dispatch_data_create(Data, size, 0LL, _dispatch_data_destructor_munmap);
    id v8 = [[CGBitmapFormat alloc] initWithBitmapContext:v5];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();

    CFRelease(v5);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  if (v3) {
    CFRelease(v3);
  }
}

- (void)getPageText:(id)a3
{
  id v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __29__CGPDFPageImpl_getPageText___block_invoke;
  v7[3] = &unk_100004268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[NSOperationQueue addOperationWithBlock:](requestQueue, "addOperationWithBlock:", v7);
}

void __29__CGPDFPageImpl_getPageText___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)CGPDFPageCopyString(*(void *)(*(void *)(a1 + 32) + 24LL));
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void).cxx_destruct
{
}

@end