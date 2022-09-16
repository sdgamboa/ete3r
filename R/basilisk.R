ETE3Env <- basilisk::BasiliskEnvironment(
    envname = "ETE3Env",
    pkgname = "ete3r",
    channels = c("etetoolkit", "conda-forge"),
    packages = c("ete3==3", "ete_toolchain==3")
)
