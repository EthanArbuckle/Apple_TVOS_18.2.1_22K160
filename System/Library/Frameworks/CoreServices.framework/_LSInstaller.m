@interface _LSInstaller
- (NSXPCConnection)xpcConnection;
- (void)performShimmedInstallOfArtifact:(id)a3 options:(id)a4 completion:(id)a5;
- (void)performShimmedUninstallOfApplicationWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setXpcConnection:(id)a3;
@end

@implementation _LSInstaller

- (void)performShimmedInstallOfArtifact:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = -[_LSInstaller xpcConnection](self, "xpcConnection");
  id v17 = 0LL;
  int v12 = _LSValidateEntitlementsOfConnectionForVanillaInstall(v11, v9, &v17);
  id v13 = v17;

  if (v12)
  {
    _LSInstallLog();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl(&dword_183E58000, v14, OS_LOG_TYPE_DEFAULT, "shimming install of %@ with options %@", buf, 0x16u);
    }

    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __67___LSInstaller_performShimmedInstallOfArtifact_options_completion___block_invoke;
    v15[3] = &unk_189D73298;
    id v16 = v10;
    _LSInvokeMIForShimmedInstall(v8, v9, v15);
  }

  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v13);
  }
}

- (void)performShimmedUninstallOfApplicationWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = -[_LSInstaller xpcConnection](self, "xpcConnection");
  id v16 = 0LL;
  BOOL v12 = _LSValidateEntitlementsOfConnectionForUninstall(v11, (uint64_t)v9, &v16);
  id v13 = v16;

  if (v12)
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __86___LSInstaller_performShimmedUninstallOfApplicationWithIdentifier_options_completion___block_invoke;
    v14[3] = &unk_189D73298;
    id v15 = v10;
    _LSInvokeMIForShimmedUninstall(v8, v9, v14);
  }

  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v13);
  }
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end