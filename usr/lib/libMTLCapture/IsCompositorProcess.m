@interface IsCompositorProcess
@end

@implementation IsCompositorProcess

void __IsCompositorProcess_block_invoke(id a1)
{
  IsCompositorProcess_isCompositorProcess = (qword_23A448 & 0x80) != 0;
  if ((qword_23A448 & 0x80) == 0) {
    getprogname();
  }
}

@end