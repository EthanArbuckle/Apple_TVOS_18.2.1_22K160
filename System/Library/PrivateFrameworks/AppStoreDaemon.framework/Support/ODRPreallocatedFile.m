@interface ODRPreallocatedFile
- (void)dealloc;
@end

@implementation ODRPreallocatedFile

- (void)dealloc
{
  int fileDescriptor = self->_fileDescriptor;
  if (fileDescriptor)
  {
    close(fileDescriptor);
    self->_int fileDescriptor = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ODRPreallocatedFile;
  -[ODRPreallocatedFile dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
}

@end