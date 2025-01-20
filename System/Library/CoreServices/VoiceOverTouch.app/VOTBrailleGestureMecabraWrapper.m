@interface VOTBrailleGestureMecabraWrapper
- (BOOL)_moveToNextRawCandidate;
- (BOOL)moveToNextCandidate;
- (VOTBrailleGestureMecabraWrapper)initWithLanguage:(id)a3;
- (id)currentCandidateAnalysisString;
- (id)currentCandidateSurfaceString;
- (void)anlayzeString:(id)a3;
- (void)dealloc;
- (void)didSelectCandidateWithSurfaceString:(id)a3;
@end

@implementation VOTBrailleGestureMecabraWrapper

- (VOTBrailleGestureMecabraWrapper)initWithLanguage:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureMecabraWrapper;
  v3 = -[VOTBrailleGestureMecabraWrapper init](&v15, "init", a3);
  if (v3)
  {
    v4 = NSHomeDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 stringByAppendingPathComponent:@"/Library/Accessibility/brailleLearningDict_ja"]);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v9 createDirectoryAtPath:v6 withIntermediateDirectories:0 attributes:0 error:0];
    }

    v3->_mecabra = (__Mecabra *)MecabraCreateWithOptions( 1LL,  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6),  0LL);
    v3->_context = (__MecabraContext *)MecabraContextCreateMutable(0LL, 0LL);
    v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    candidateRefForSurface = v3->_candidateRefForSurface;
    v3->_candidateRefForSurface = v10;

    v3->_reachedEnd = v3->_mecabra == 0LL;
    currentAnalysis = v3->_currentAnalysis;
    v3->_currentAnalysis = (NSString *)&stru_10017A920;

    currentSurface = v3->_currentSurface;
    v3->_currentSurface = (NSString *)&stru_10017A920;
  }

  return v3;
}

- (void)dealloc
{
  mecabra = self->_mecabra;
  if (mecabra) {
    MecabraRelease(mecabra, a2);
  }
  context = self->_context;
  if (context) {
    MecabraContextRelease(context, a2);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureMecabraWrapper;
  -[VOTBrailleGestureMecabraWrapper dealloc](&v5, "dealloc");
}

- (void)anlayzeString:(id)a3
{
  id v5 = a3;
  if (self->_mecabra)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_string, a3);
    v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    candidateRefForSurface = self->_candidateRefForSurface;
    self->_candidateRefForSurface = v6;

    self->_reachedEnd = 0;
    objc_storeStrong((id *)&self->_currentAnalysis, a3);
    objc_storeStrong((id *)&self->_currentSurface, a3);
    MecabraAnalyzeStringWithContext(self->_mecabra, self->_string, 2LL, self->_context);
    id v5 = v8;
  }
}

- (BOOL)moveToNextCandidate
{
  while (1)
  {
    -[VOTBrailleGestureMecabraWrapper _moveToNextRawCandidate](self, "_moveToNextRawCandidate");
    if (self->_reachedEnd) {
      break;
    }
    v3 = -[NSString length](self->_string, "length");
  }

  return 0;
}

- (BOOL)_moveToNextRawCandidate
{
  if (self->_reachedEnd)
  {
    LOBYTE(NextCandidate) = 0;
  }

  else
  {
    uint64_t NextCandidate = MecabraGetNextCandidate(self->_mecabra, a2);
    if (NextCandidate)
    {
      uint64_t v4 = NextCandidate;
      uint64_t AnalysisString = MecabraCandidateGetAnalysisString();
      v6 = (NSString *)objc_claimAutoreleasedReturnValue(AnalysisString);
      currentAnalysis = self->_currentAnalysis;
      self->_currentAnalysis = v6;

      uint64_t Surface = MecabraCandidateGetSurface(v4);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue(Surface);
      currentuint64_t Surface = self->_currentSurface;
      self->_currentuint64_t Surface = v9;

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_candidateRefForSurface,  "setObject:forKeyedSubscript:",  v4,  self->_currentSurface);
      LOBYTE(NextCandidate) = 1;
    }

    else
    {
      self->_reachedEnd = 1;
    }
  }

  return NextCandidate;
}

- (id)currentCandidateAnalysisString
{
  return self->_currentAnalysis;
}

- (id)currentCandidateSurfaceString
{
  return self->_currentSurface;
}

- (void)didSelectCandidateWithSurfaceString:(id)a3
{
  id v4 = -[NSMutableDictionary objectForKey:](self->_candidateRefForSurface, "objectForKey:", a3);
  if (v4) {
    MecabraContextAddInlineCandidate(self->_context, v4);
  }
  MecabraAcceptInlineCandidates(self->_mecabra, self->_context);
}

- (void).cxx_destruct
{
}

@end