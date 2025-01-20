@interface DownloadAccelerationStructure
@end

@implementation DownloadAccelerationStructure

void __DownloadAccelerationStructure_block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MTLCommandBufferDescriptor);
  v2 = (void *)DownloadAccelerationStructure_commandBufferDescriptor;
  DownloadAccelerationStructure_commandBufferDescriptor = (uint64_t)v1;

  if ((qword_23A448 & 0x100000) != 0) {
    objc_msgSend( (id)DownloadAccelerationStructure_commandBufferDescriptor,  "setErrorOptions:",  (unint64_t)objc_msgSend((id)DownloadAccelerationStructure_commandBufferDescriptor, "errorOptions") | 1);
  }
}

@end