@interface PosterBoardApplication
- (NSString)currentTestName;
- (NSString)runningPPTTestName;
- (void)setCurrentTestName:(id)a3;
@end

@implementation PosterBoardApplication

- (NSString)runningPPTTestName
{
  return self->_runningPPTTestName;
}

- (NSString)currentTestName
{
  return self->_currentTestName;
}

- (void)setCurrentTestName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end