@interface TVSettingsColorBarsView
- (void)generateColorBarLayerContents;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TVSettingsColorBarsView

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsColorBarsView;
  -[TVSettingsColorBarsView willMoveToWindow:](&v5, "willMoveToWindow:");
  if (a3) {
    -[TVSettingsColorBarsView generateColorBarLayerContents](self, "generateColorBarLayerContents");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsColorBarsView;
  id v4 = a3;
  -[TVSettingsColorBarsView traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsColorBarsView traitCollection](self, "traitCollection", v10.receiver, v10.super_class));
  [v5 displayScale];
  double v7 = v6;
  [v4 displayScale];
  double v9 = v8;

  if (v7 != v9) {
    -[TVSettingsColorBarsView generateColorBarLayerContents](self, "generateColorBarLayerContents");
  }
}

- (void)generateColorBarLayerContents
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsColorBarsView traitCollection](self, "traitCollection"));
  [v4 displayScale];
  double v6 = v5;

  if (v6 == 2.0) {
    uint64_t v7 = 3840LL;
  }
  else {
    uint64_t v7 = 1920LL;
  }
  if (v6 == 2.0) {
    uint64_t v8 = 2160LL;
  }
  else {
    uint64_t v8 = 1080LL;
  }
  CVPixelBufferRef pixelBuffer = 0LL;
  if (FigCreateIOSurfaceBackedCVPixelBuffer(v7, v8, 875704438LL, &pixelBuffer))
  {
    if (_TVSLogInternalLogLevel >= 3)
    {
      uint64_t v9 = TVSSystemLog;
      pthread_main_np();
      pthread_self();
      _TVSLogBase(v2, &_os_log_default, 65LL, 0LL, 3LL, v9);
    }
  }

  else
  {
    objc_super v10 = @"SMPTE_RP_219.NV12";
    if (v6 == 2.0) {
      objc_super v10 = @"SMPTE_RP_219-2x-hdr.NV12";
    }
    v11 = pixelBuffer;
    v12 = v10;
    CVReturn v13 = CVPixelBufferLockBaseAddress(v11, 0LL);
    v14 = objc_alloc(&OBJC_CLASS___NSData);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pathForResource:v12 ofType:0]);

    v17 = -[NSData initWithContentsOfFile:](v14, "initWithContentsOfFile:", v16);
    if (v13)
    {
      if (_TVSLogInternalLogLevel >= 3)
      {
        uint64_t v18 = TVSSystemLog;
        pthread_main_np();
        pthread_self();
        _TVSLogBase(v2, &_os_log_default, 65LL, 0LL, 3LL, v18);
      }
    }

    else
    {
      if (-[NSData length](v17, "length"))
      {
        v19 = -[NSData bytes](v17, "bytes");
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0LL);
        if (v6 == 2.0) {
          size_t v21 = 8294400LL;
        }
        else {
          size_t v21 = 2073600LL;
        }
        memcpy(BaseAddressOfPlane, v19, v21);
        v22 = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
        memcpy(v22, &v19[v21], v21 >> 1);
        CVPixelBufferUnlockBaseAddress(pixelBuffer, 0LL);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 traitCollection]);
      id v25 = [v24 displayGamut];

      v26 = &kCVImageBufferColorPrimaries_P3_D65;
      if (v25 != (id)1) {
        v26 = &kCVImageBufferColorPrimaries_ITU_R_709_2;
      }
      CVBufferSetAttachment(pixelBuffer, kCVImageBufferColorPrimariesKey, *v26, kCVAttachmentMode_ShouldPropagate);
      CVBufferSetAttachment( pixelBuffer,  kCVImageBufferTransferFunctionKey,  kCVImageBufferTransferFunction_ITU_R_709_2,  kCVAttachmentMode_ShouldPropagate);
      CVBufferSetAttachment( pixelBuffer,  kCVImageBufferYCbCrMatrixKey,  kCVImageBufferYCbCrMatrix_ITU_R_709_2,  kCVAttachmentMode_ShouldPropagate);
      IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsColorBarsView layer](self, "layer"));
      [v28 setContents:IOSurface];
    }

    if (pixelBuffer) {
      CVPixelBufferRelease(pixelBuffer);
    }
  }

@end