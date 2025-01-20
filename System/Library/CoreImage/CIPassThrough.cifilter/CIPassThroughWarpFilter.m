@interface CIPassThroughWarpFilter
- (id)outputImage;
@end

@implementation CIPassThroughWarpFilter

- (id)outputImage
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_2F3C;
  block[3] = &unk_4160;
  block[4] = self;
  if (qword_88E0 != -1) {
    dispatch_once(&qword_88E0, block);
  }
  v3 = (void *)qword_88E8;
  -[CIImage extent](self->super.inputImage, "extent");
  return (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "applyWithExtent:roiCallback:inputImage:arguments:",  &stru_41A0,  self->super.inputImage,  &__NSArray0__struct));
}

@end