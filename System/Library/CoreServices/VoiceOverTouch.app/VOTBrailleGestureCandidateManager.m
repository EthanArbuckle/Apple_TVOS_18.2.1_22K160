@interface VOTBrailleGestureCandidateManager
- (BOOL)hasNextCandidate;
- (BOOL)hasPreviousCandidate;
- (BOOL)isActive;
- (NSString)currentCandidateAnalysisString;
- (NSString)currentCandidateSurfaceString;
- (VOTBrailleGestureCandidateManager)init;
- (void)analyzeString:(id)a3 language:(id)a4;
- (void)deactivate;
- (void)didSelectCurrentCandidate;
- (void)moveToNextCandidate;
- (void)moveToPreviousCandidate;
@end

@implementation VOTBrailleGestureCandidateManager

- (VOTBrailleGestureCandidateManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureCandidateManager;
  v2 = -[VOTBrailleGestureCandidateManager init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_isActive = 0;
    v4 = v2;
  }

  return v3;
}

- (void)analyzeString:(id)a3 language:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  v7 = v6;
  self->_isActive = 1;
  if (!self->_mecabra || !self->_language || (objc_msgSend(v6, "isEqualToString:") & 1) == 0)
  {
    v8 = -[VOTBrailleGestureMecabraWrapper initWithLanguage:]( objc_alloc(&OBJC_CLASS___VOTBrailleGestureMecabraWrapper),  "initWithLanguage:",  v7);
    mecabra = self->_mecabra;
    self->_mecabra = v8;

    objc_storeStrong((id *)&self->_language, a4);
  }

  -[VOTBrailleGestureMecabraWrapper anlayzeString:](self->_mecabra, "anlayzeString:", v19);
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  analyzeStrings = self->_analyzeStrings;
  self->_analyzeStrings = v10;

  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  surfaceStrings = self->_surfaceStrings;
  self->_surfaceStrings = v12;

  unsigned int v14 = -[VOTBrailleGestureMecabraWrapper moveToNextCandidate](self->_mecabra, "moveToNextCandidate");
  v15 = self->_analyzeStrings;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureMecabraWrapper currentCandidateAnalysisString]( self->_mecabra,  "currentCandidateAnalysisString"));
    -[NSMutableArray addObject:](v15, "addObject:", v16);

    v17 = self->_surfaceStrings;
    v18 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureMecabraWrapper currentCandidateSurfaceString]( self->_mecabra,  "currentCandidateSurfaceString"));
    -[NSMutableArray addObject:](v17, "addObject:", v18);
  }

  else
  {
    -[NSMutableArray addObject:](self->_analyzeStrings, "addObject:", v19);
    -[NSMutableArray addObject:](self->_surfaceStrings, "addObject:", &stru_10017A920);
  }

  self->_currentIndex = 0LL;
}

- (void)deactivate
{
  self->_isActive = 0;
  analyzeStrings = self->_analyzeStrings;
  self->_analyzeStrings = 0LL;

  surfaceStrings = self->_surfaceStrings;
  self->_surfaceStrings = 0LL;

  self->_currentIndex = 0LL;
}

- (BOOL)hasNextCandidate
{
  if (self->_isActive)
  {
    currentIndex = (_BYTE *)self->_currentIndex;
    BOOL v4 = -[VOTBrailleGestureMecabraWrapper moveToNextCandidate](self->_mecabra, "moveToNextCandidate");
    if (v4)
    {
      analyzeStrings = self->_analyzeStrings;
      v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureMecabraWrapper currentCandidateAnalysisString]( self->_mecabra,  "currentCandidateAnalysisString"));
      -[NSMutableArray addObject:](analyzeStrings, "addObject:", v7);

      surfaceStrings = self->_surfaceStrings;
      v9 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureMecabraWrapper currentCandidateSurfaceString]( self->_mecabra,  "currentCandidateSurfaceString"));
      -[NSMutableArray addObject:](surfaceStrings, "addObject:", v9);

      return 1;
    }

    uint64_t v11 = VOTLogBrailleGestures(v4, v5);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Candidate Manager: no more candidates",  v13,  2u);
    }
  }

  return 0;
}

- (BOOL)hasPreviousCandidate
{
  return self->_isActive && self->_currentIndex > 0;
}

- (void)moveToNextCandidate
{
  if (self->_isActive)
  {
    if (-[VOTBrailleGestureCandidateManager hasNextCandidate](self, "hasNextCandidate")) {
      ++self->_currentIndex;
    }
  }

- (void)moveToPreviousCandidate
{
  if (self->_isActive)
  {
    if (-[VOTBrailleGestureCandidateManager hasPreviousCandidate](self, "hasPreviousCandidate")) {
      --self->_currentIndex;
    }
  }

- (NSString)currentCandidateAnalysisString
{
  if (self->_isActive) {
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_analyzeStrings, "objectAtIndex:", self->_currentIndex));
  }
  else {
    v2 = &stru_10017A920;
  }
  return (NSString *)v2;
}

- (NSString)currentCandidateSurfaceString
{
  if (self->_isActive) {
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_surfaceStrings, "objectAtIndex:", self->_currentIndex));
  }
  else {
    v2 = &stru_10017A920;
  }
  return (NSString *)v2;
}

- (void)didSelectCurrentCandidate
{
  if (self->_isActive)
  {
    mecabra = self->_mecabra;
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureCandidateManager currentCandidateSurfaceString](self, "currentCandidateSurfaceString"));
    -[VOTBrailleGestureMecabraWrapper didSelectCandidateWithSurfaceString:]( mecabra,  "didSelectCandidateWithSurfaceString:",  v3);
  }

- (BOOL)isActive
{
  return self->_isActive;
}

- (void).cxx_destruct
{
}

@end